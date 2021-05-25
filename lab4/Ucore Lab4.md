内核栈：

对于内核线程来说，内核栈就是程序运行的栈。

对于用户进程来说，内核栈是在特权级切换时保存硬件信息的栈。

TSS：保存内核栈信息。

练习1：

context保存上下文，包括大多数寄存器信息，除eax。用于线程间切换时的上下文切换。

tf指向中断栈，在发生中断时使用，保存寄存器信息，段寄存器，erro，eip esp。tf的内容包含context，但context用于上下文切换，tf用于中断。且ucore支持中断嵌套，会维护中断链（还没找到，也许就是通过函数调用的形式把）。

```c
int
kernel_thread(int (*fn)(void *), void *arg, uint32_t clone_flags) {
    struct trapframe tf;
    memset(&tf, 0, sizeof(struct trapframe));
    tf.tf_cs = KERNEL_CS;
    tf.tf_ds = tf.tf_es = tf.tf_ss = KERNEL_DS;
    tf.tf_regs.reg_ebx = (uint32_t)fn;
    tf.tf_regs.reg_edx = (uint32_t)arg;
    tf.tf_eip = (uint32_t)kernel_thread_entry;
    return do_fork(clone_flags | CLONE_VM, 0, &tf);
}
int
do_fork(uint32_t clone_flags, uintptr_t stack, struct trapframe *tf) {
    int ret = -E_NO_FREE_PROC;
    struct proc_struct *proc;
    if (nr_process >= MAX_PROCESS) {
        goto fork_out;
    }
    ret = -E_NO_MEM;
    if((proc=alloc_proc())==NULL){
		goto fork_out;
    }
	if(setup_kstack(proc)!=0){
		goto bad_fork_cleanup_proc; //不清理kstack原因在于，分配内存页失败，实际无kstack被分配，故无需free stack；
	}
	if((copy_mm(clone_flags, struct proc))!=0){
		goto bad_fork_cleanup_kstack;
	}
	copy_thread(proc, stack,tf);
	bool intr_flag;
    local_intr_save(intr_flag);
    {
        proc->pid = get_pid();
        hash_proc(proc);
        list_add(&proc_list, &(proc->list_link));
        nr_process ++;
    }
    local_intr_restore(intr_flag);
	proc->parent=current;
	wakeup_proc(proc);
	ret=proc->pid;//成功创建线程，返回pid
fork_out:
    return ret;

bad_fork_cleanup_kstack:
    put_kstack(proc);
bad_fork_cleanup_proc:
    kfree(proc);
    goto fork_out;
}


```

调用kernel thread(),初始化一个内核线程，kernel thread调用do fork dofork调用copy thread

其设置tf  esp为0，因为这里用不到它，原因在于在中断返回时是从内核态返回到内核态，iret时不会额外恢复esp与ss，eax为0，并设置该进程上下文的eip是forkret函数，esp就是tf。

而后在schedule进程调度，启动这个创建的进程，先找到，后调用proc_run

```c
void
proc_run(struct proc_struct *proc) {
    if (proc != current) {
        bool intr_flag;
        struct proc_struct *prev = current, *next = proc;
        local_intr_save(intr_flag);
        {
            current = proc;
            load_esp0(next->kstack + KSTACKSIZE);
            lcr3(next->cr3);
            switch_to(&(prev->context), &(next->context));
        }
        local_intr_restore(intr_flag);
    }
}
```

加载to进程的esp与cr3，调用switchto(参数从右至左压栈)

```
switch_to:                      # switch_to(from, to)

    # save from's registers
    movl 4(%esp), %eax          # eax points to from
    popl 0(%eax)                # save eip !popl
    movl %esp, 4(%eax)          # save esp::context of from
    movl %ebx, 8(%eax)          # save ebx::context of from
    movl %ecx, 12(%eax)         # save ecx::context of from
    movl %edx, 16(%eax)         # save edx::context of from
    movl %esi, 20(%eax)         # save esi::context of from
    movl %edi, 24(%eax)         # save edi::context of from
    movl %ebp, 28(%eax)         # save ebp::context of from

    # restore to's registers
    movl 4(%esp), %eax          # not 8(%esp): popped return address already
                                # eax now points to to
    movl 28(%eax), %ebp         # restore ebp::context of to
    movl 24(%eax), %edi         # restore edi::context of to
    movl 20(%eax), %esi         # restore esi::context of to
    movl 16(%eax), %edx         # restore edx::context of to
    movl 12(%eax), %ecx         # restore ecx::context of to
    movl 8(%eax), %ebx          # restore ebx::context of to
    movl 4(%eax), %esp          # restore esp::context of to

    pushl 0(%eax)               # push eip（context的eip）

    ret
```

这里，ret则表明，执行forkret

```
__trapret:
    # restore registers from stack
    popal

    # restore %ds, %es, %fs and %gs
    popl %gs
    popl %fs
    popl %es
    popl %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
    iret

.globl forkrets
forkrets:
    # set stack to this new process's trapframe
    movl 4(%esp), %esp
    jmp __trapret

```

先是esp指向tf，而后恢复寄存器状态为tf保存的状态，而后调用iret恢复tf的esp与eip

tf的esp是0，eip是kernel_thread_entry

```
kernel_thread_entry:        # void kernel_thread(void)

    pushl %edx              # push arg
    call *%ebx              # call fn

    pushl %eax              # save the return value of fn(arg)
    call do_exit            # call do_exit to terminate current thread
```

简单来说就是执行fn函数，参数是arg，这里就是：

```
init_main(void *arg) {
    cprintf("this initproc, pid = %d, name = \"%s\"\n", current->pid, get_proc_name(current));
    cprintf("To U: \"%s\".\n", (const char *)arg);
    cprintf("To U: \"en.., Bye, Bye. :)\"\n");
    return 0;
}
//参数是hello world
```



do_exit这里什么都没有干。

