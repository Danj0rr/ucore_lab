
bin/kernel：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 28             	sub    $0x28,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100006:	ba 20 fd 10 00       	mov    $0x10fd20,%edx
  10000b:	b8 16 ea 10 00       	mov    $0x10ea16,%eax
  100010:	29 c2                	sub    %eax,%edx
  100012:	89 d0                	mov    %edx,%eax
  100014:	89 44 24 08          	mov    %eax,0x8(%esp)
  100018:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10001f:	00 
  100020:	c7 04 24 16 ea 10 00 	movl   $0x10ea16,(%esp)
  100027:	e8 02 2e 00 00       	call   102e2e <memset>

    cons_init();                // init the console
  10002c:	e8 3b 15 00 00       	call   10156c <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  100031:	c7 45 f4 40 36 10 00 	movl   $0x103640,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100038:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10003b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10003f:	c7 04 24 5c 36 10 00 	movl   $0x10365c,(%esp)
  100046:	e8 20 02 00 00       	call   10026b <cprintf>

    print_kerninfo();
  10004b:	e8 c1 08 00 00       	call   100911 <print_kerninfo>

    grade_backtrace();
  100050:	e8 8e 00 00 00       	call   1000e3 <grade_backtrace>

    pmm_init();                 // init physical memory management
  100055:	e8 a9 2a 00 00       	call   102b03 <pmm_init>

    pic_init();                 // init interrupt controller
  10005a:	e8 4b 16 00 00       	call   1016aa <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005f:	e8 c9 17 00 00       	call   10182d <idt_init>

    clock_init();               // init clock interrupt
  100064:	e8 f4 0c 00 00       	call   100d5d <clock_init>
    intr_enable();              // enable irq interrupt
  100069:	e8 6f 17 00 00       	call   1017dd <intr_enable>

    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    lab1_switch_test();
  10006e:	e8 6a 01 00 00       	call   1001dd <lab1_switch_test>

    /* do nothing */
    while (1);
  100073:	eb fe                	jmp    100073 <kern_init+0x73>

00100075 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100075:	55                   	push   %ebp
  100076:	89 e5                	mov    %esp,%ebp
  100078:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  10007b:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  100082:	00 
  100083:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10008a:	00 
  10008b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100092:	e8 b4 0c 00 00       	call   100d4b <mon_backtrace>
}
  100097:	90                   	nop
  100098:	c9                   	leave  
  100099:	c3                   	ret    

0010009a <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  10009a:	55                   	push   %ebp
  10009b:	89 e5                	mov    %esp,%ebp
  10009d:	53                   	push   %ebx
  10009e:	83 ec 14             	sub    $0x14,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  1000a1:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  1000a4:	8b 55 0c             	mov    0xc(%ebp),%edx
  1000a7:	8d 5d 08             	lea    0x8(%ebp),%ebx
  1000aa:	8b 45 08             	mov    0x8(%ebp),%eax
  1000ad:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  1000b1:	89 54 24 08          	mov    %edx,0x8(%esp)
  1000b5:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  1000b9:	89 04 24             	mov    %eax,(%esp)
  1000bc:	e8 b4 ff ff ff       	call   100075 <grade_backtrace2>
}
  1000c1:	90                   	nop
  1000c2:	83 c4 14             	add    $0x14,%esp
  1000c5:	5b                   	pop    %ebx
  1000c6:	5d                   	pop    %ebp
  1000c7:	c3                   	ret    

001000c8 <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000c8:	55                   	push   %ebp
  1000c9:	89 e5                	mov    %esp,%ebp
  1000cb:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000ce:	8b 45 10             	mov    0x10(%ebp),%eax
  1000d1:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000d5:	8b 45 08             	mov    0x8(%ebp),%eax
  1000d8:	89 04 24             	mov    %eax,(%esp)
  1000db:	e8 ba ff ff ff       	call   10009a <grade_backtrace1>
}
  1000e0:	90                   	nop
  1000e1:	c9                   	leave  
  1000e2:	c3                   	ret    

001000e3 <grade_backtrace>:

void
grade_backtrace(void) {
  1000e3:	55                   	push   %ebp
  1000e4:	89 e5                	mov    %esp,%ebp
  1000e6:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000e9:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000ee:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  1000f5:	ff 
  1000f6:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000fa:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100101:	e8 c2 ff ff ff       	call   1000c8 <grade_backtrace0>
}
  100106:	90                   	nop
  100107:	c9                   	leave  
  100108:	c3                   	ret    

00100109 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  100109:	55                   	push   %ebp
  10010a:	89 e5                	mov    %esp,%ebp
  10010c:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  10010f:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  100112:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  100115:	8c 45 f2             	mov    %es,-0xe(%ebp)
  100118:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  10011b:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10011f:	83 e0 03             	and    $0x3,%eax
  100122:	89 c2                	mov    %eax,%edx
  100124:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100129:	89 54 24 08          	mov    %edx,0x8(%esp)
  10012d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100131:	c7 04 24 61 36 10 00 	movl   $0x103661,(%esp)
  100138:	e8 2e 01 00 00       	call   10026b <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  10013d:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100141:	89 c2                	mov    %eax,%edx
  100143:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100148:	89 54 24 08          	mov    %edx,0x8(%esp)
  10014c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100150:	c7 04 24 6f 36 10 00 	movl   $0x10366f,(%esp)
  100157:	e8 0f 01 00 00       	call   10026b <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  10015c:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  100160:	89 c2                	mov    %eax,%edx
  100162:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100167:	89 54 24 08          	mov    %edx,0x8(%esp)
  10016b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10016f:	c7 04 24 7d 36 10 00 	movl   $0x10367d,(%esp)
  100176:	e8 f0 00 00 00       	call   10026b <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  10017b:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10017f:	89 c2                	mov    %eax,%edx
  100181:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100186:	89 54 24 08          	mov    %edx,0x8(%esp)
  10018a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10018e:	c7 04 24 8b 36 10 00 	movl   $0x10368b,(%esp)
  100195:	e8 d1 00 00 00       	call   10026b <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  10019a:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  10019e:	89 c2                	mov    %eax,%edx
  1001a0:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001a5:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001a9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001ad:	c7 04 24 99 36 10 00 	movl   $0x103699,(%esp)
  1001b4:	e8 b2 00 00 00       	call   10026b <cprintf>
    round ++;
  1001b9:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001be:	40                   	inc    %eax
  1001bf:	a3 20 ea 10 00       	mov    %eax,0x10ea20
}
  1001c4:	90                   	nop
  1001c5:	c9                   	leave  
  1001c6:	c3                   	ret    

001001c7 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001c7:	55                   	push   %ebp
  1001c8:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
    asm volatile(
  1001ca:	16                   	push   %ss
  1001cb:	54                   	push   %esp
  1001cc:	cd 78                	int    $0x78
  1001ce:	89 ec                	mov    %ebp,%esp
           "int %0;"
           "movl %%ebp,%%esp;"
           :
           :"i"(T_SWITCH_TOU));
   
}
  1001d0:	90                   	nop
  1001d1:	5d                   	pop    %ebp
  1001d2:	c3                   	ret    

001001d3 <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001d3:	55                   	push   %ebp
  1001d4:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
    asm volatile(
  1001d6:	cd 79                	int    $0x79
  1001d8:	89 ec                	mov    %ebp,%esp
	  "int %0;"
          "movl %%ebp,%%esp;"
          :
          :"i"(T_SWITCH_TOK));

}
  1001da:	90                   	nop
  1001db:	5d                   	pop    %ebp
  1001dc:	c3                   	ret    

001001dd <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001dd:	55                   	push   %ebp
  1001de:	89 e5                	mov    %esp,%ebp
  1001e0:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  1001e3:	e8 21 ff ff ff       	call   100109 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001e8:	c7 04 24 a8 36 10 00 	movl   $0x1036a8,(%esp)
  1001ef:	e8 77 00 00 00       	call   10026b <cprintf>
    lab1_switch_to_user();
  1001f4:	e8 ce ff ff ff       	call   1001c7 <lab1_switch_to_user>
    lab1_print_cur_status();
  1001f9:	e8 0b ff ff ff       	call   100109 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001fe:	c7 04 24 c8 36 10 00 	movl   $0x1036c8,(%esp)
  100205:	e8 61 00 00 00       	call   10026b <cprintf>
    lab1_switch_to_kernel();
  10020a:	e8 c4 ff ff ff       	call   1001d3 <lab1_switch_to_kernel>
    lab1_print_cur_status();
  10020f:	e8 f5 fe ff ff       	call   100109 <lab1_print_cur_status>
}
  100214:	90                   	nop
  100215:	c9                   	leave  
  100216:	c3                   	ret    

00100217 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  100217:	55                   	push   %ebp
  100218:	89 e5                	mov    %esp,%ebp
  10021a:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  10021d:	8b 45 08             	mov    0x8(%ebp),%eax
  100220:	89 04 24             	mov    %eax,(%esp)
  100223:	e8 71 13 00 00       	call   101599 <cons_putc>
    (*cnt) ++;
  100228:	8b 45 0c             	mov    0xc(%ebp),%eax
  10022b:	8b 00                	mov    (%eax),%eax
  10022d:	8d 50 01             	lea    0x1(%eax),%edx
  100230:	8b 45 0c             	mov    0xc(%ebp),%eax
  100233:	89 10                	mov    %edx,(%eax)
}
  100235:	90                   	nop
  100236:	c9                   	leave  
  100237:	c3                   	ret    

00100238 <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  100238:	55                   	push   %ebp
  100239:	89 e5                	mov    %esp,%ebp
  10023b:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  10023e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  100245:	8b 45 0c             	mov    0xc(%ebp),%eax
  100248:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10024c:	8b 45 08             	mov    0x8(%ebp),%eax
  10024f:	89 44 24 08          	mov    %eax,0x8(%esp)
  100253:	8d 45 f4             	lea    -0xc(%ebp),%eax
  100256:	89 44 24 04          	mov    %eax,0x4(%esp)
  10025a:	c7 04 24 17 02 10 00 	movl   $0x100217,(%esp)
  100261:	e8 1b 2f 00 00       	call   103181 <vprintfmt>
    return cnt;
  100266:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100269:	c9                   	leave  
  10026a:	c3                   	ret    

0010026b <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  10026b:	55                   	push   %ebp
  10026c:	89 e5                	mov    %esp,%ebp
  10026e:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  100271:	8d 45 0c             	lea    0xc(%ebp),%eax
  100274:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  100277:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10027a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10027e:	8b 45 08             	mov    0x8(%ebp),%eax
  100281:	89 04 24             	mov    %eax,(%esp)
  100284:	e8 af ff ff ff       	call   100238 <vcprintf>
  100289:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  10028c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10028f:	c9                   	leave  
  100290:	c3                   	ret    

00100291 <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  100291:	55                   	push   %ebp
  100292:	89 e5                	mov    %esp,%ebp
  100294:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  100297:	8b 45 08             	mov    0x8(%ebp),%eax
  10029a:	89 04 24             	mov    %eax,(%esp)
  10029d:	e8 f7 12 00 00       	call   101599 <cons_putc>
}
  1002a2:	90                   	nop
  1002a3:	c9                   	leave  
  1002a4:	c3                   	ret    

001002a5 <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  1002a5:	55                   	push   %ebp
  1002a6:	89 e5                	mov    %esp,%ebp
  1002a8:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  1002ab:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  1002b2:	eb 13                	jmp    1002c7 <cputs+0x22>
        cputch(c, &cnt);
  1002b4:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  1002b8:	8d 55 f0             	lea    -0x10(%ebp),%edx
  1002bb:	89 54 24 04          	mov    %edx,0x4(%esp)
  1002bf:	89 04 24             	mov    %eax,(%esp)
  1002c2:	e8 50 ff ff ff       	call   100217 <cputch>
 * */
int
cputs(const char *str) {
    int cnt = 0;
    char c;
    while ((c = *str ++) != '\0') {
  1002c7:	8b 45 08             	mov    0x8(%ebp),%eax
  1002ca:	8d 50 01             	lea    0x1(%eax),%edx
  1002cd:	89 55 08             	mov    %edx,0x8(%ebp)
  1002d0:	0f b6 00             	movzbl (%eax),%eax
  1002d3:	88 45 f7             	mov    %al,-0x9(%ebp)
  1002d6:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  1002da:	75 d8                	jne    1002b4 <cputs+0xf>
        cputch(c, &cnt);
    }
    cputch('\n', &cnt);
  1002dc:	8d 45 f0             	lea    -0x10(%ebp),%eax
  1002df:	89 44 24 04          	mov    %eax,0x4(%esp)
  1002e3:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  1002ea:	e8 28 ff ff ff       	call   100217 <cputch>
    return cnt;
  1002ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  1002f2:	c9                   	leave  
  1002f3:	c3                   	ret    

001002f4 <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  1002f4:	55                   	push   %ebp
  1002f5:	89 e5                	mov    %esp,%ebp
  1002f7:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  1002fa:	e8 c4 12 00 00       	call   1015c3 <cons_getc>
  1002ff:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100302:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100306:	74 f2                	je     1002fa <getchar+0x6>
        /* do nothing */;
    return c;
  100308:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10030b:	c9                   	leave  
  10030c:	c3                   	ret    

0010030d <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  10030d:	55                   	push   %ebp
  10030e:	89 e5                	mov    %esp,%ebp
  100310:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  100313:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100317:	74 13                	je     10032c <readline+0x1f>
        cprintf("%s", prompt);
  100319:	8b 45 08             	mov    0x8(%ebp),%eax
  10031c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100320:	c7 04 24 e7 36 10 00 	movl   $0x1036e7,(%esp)
  100327:	e8 3f ff ff ff       	call   10026b <cprintf>
    }
    int i = 0, c;
  10032c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  100333:	e8 bc ff ff ff       	call   1002f4 <getchar>
  100338:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  10033b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10033f:	79 07                	jns    100348 <readline+0x3b>
            return NULL;
  100341:	b8 00 00 00 00       	mov    $0x0,%eax
  100346:	eb 78                	jmp    1003c0 <readline+0xb3>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100348:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  10034c:	7e 28                	jle    100376 <readline+0x69>
  10034e:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100355:	7f 1f                	jg     100376 <readline+0x69>
            cputchar(c);
  100357:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10035a:	89 04 24             	mov    %eax,(%esp)
  10035d:	e8 2f ff ff ff       	call   100291 <cputchar>
            buf[i ++] = c;
  100362:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100365:	8d 50 01             	lea    0x1(%eax),%edx
  100368:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10036b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10036e:	88 90 40 ea 10 00    	mov    %dl,0x10ea40(%eax)
  100374:	eb 45                	jmp    1003bb <readline+0xae>
        }
        else if (c == '\b' && i > 0) {
  100376:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  10037a:	75 16                	jne    100392 <readline+0x85>
  10037c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100380:	7e 10                	jle    100392 <readline+0x85>
            cputchar(c);
  100382:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100385:	89 04 24             	mov    %eax,(%esp)
  100388:	e8 04 ff ff ff       	call   100291 <cputchar>
            i --;
  10038d:	ff 4d f4             	decl   -0xc(%ebp)
  100390:	eb 29                	jmp    1003bb <readline+0xae>
        }
        else if (c == '\n' || c == '\r') {
  100392:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  100396:	74 06                	je     10039e <readline+0x91>
  100398:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  10039c:	75 95                	jne    100333 <readline+0x26>
            cputchar(c);
  10039e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1003a1:	89 04 24             	mov    %eax,(%esp)
  1003a4:	e8 e8 fe ff ff       	call   100291 <cputchar>
            buf[i] = '\0';
  1003a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1003ac:	05 40 ea 10 00       	add    $0x10ea40,%eax
  1003b1:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1003b4:	b8 40 ea 10 00       	mov    $0x10ea40,%eax
  1003b9:	eb 05                	jmp    1003c0 <readline+0xb3>
        }
    }
  1003bb:	e9 73 ff ff ff       	jmp    100333 <readline+0x26>
}
  1003c0:	c9                   	leave  
  1003c1:	c3                   	ret    

001003c2 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  1003c2:	55                   	push   %ebp
  1003c3:	89 e5                	mov    %esp,%ebp
  1003c5:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  1003c8:	a1 40 ee 10 00       	mov    0x10ee40,%eax
  1003cd:	85 c0                	test   %eax,%eax
  1003cf:	75 5b                	jne    10042c <__panic+0x6a>
        goto panic_dead;
    }
    is_panic = 1;
  1003d1:	c7 05 40 ee 10 00 01 	movl   $0x1,0x10ee40
  1003d8:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  1003db:	8d 45 14             	lea    0x14(%ebp),%eax
  1003de:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  1003e1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1003e4:	89 44 24 08          	mov    %eax,0x8(%esp)
  1003e8:	8b 45 08             	mov    0x8(%ebp),%eax
  1003eb:	89 44 24 04          	mov    %eax,0x4(%esp)
  1003ef:	c7 04 24 ea 36 10 00 	movl   $0x1036ea,(%esp)
  1003f6:	e8 70 fe ff ff       	call   10026b <cprintf>
    vcprintf(fmt, ap);
  1003fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1003fe:	89 44 24 04          	mov    %eax,0x4(%esp)
  100402:	8b 45 10             	mov    0x10(%ebp),%eax
  100405:	89 04 24             	mov    %eax,(%esp)
  100408:	e8 2b fe ff ff       	call   100238 <vcprintf>
    cprintf("\n");
  10040d:	c7 04 24 06 37 10 00 	movl   $0x103706,(%esp)
  100414:	e8 52 fe ff ff       	call   10026b <cprintf>
    
    cprintf("stack trackback:\n");
  100419:	c7 04 24 08 37 10 00 	movl   $0x103708,(%esp)
  100420:	e8 46 fe ff ff       	call   10026b <cprintf>
    print_stackframe();
  100425:	e8 32 06 00 00       	call   100a5c <print_stackframe>
  10042a:	eb 01                	jmp    10042d <__panic+0x6b>
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
    if (is_panic) {
        goto panic_dead;
  10042c:	90                   	nop
    print_stackframe();
    
    va_end(ap);

panic_dead:
    intr_disable();
  10042d:	e8 b2 13 00 00       	call   1017e4 <intr_disable>
    while (1) {
        kmonitor(NULL);
  100432:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100439:	e8 40 08 00 00       	call   100c7e <kmonitor>
    }
  10043e:	eb f2                	jmp    100432 <__panic+0x70>

00100440 <__warn>:
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100440:	55                   	push   %ebp
  100441:	89 e5                	mov    %esp,%ebp
  100443:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  100446:	8d 45 14             	lea    0x14(%ebp),%eax
  100449:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  10044c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10044f:	89 44 24 08          	mov    %eax,0x8(%esp)
  100453:	8b 45 08             	mov    0x8(%ebp),%eax
  100456:	89 44 24 04          	mov    %eax,0x4(%esp)
  10045a:	c7 04 24 1a 37 10 00 	movl   $0x10371a,(%esp)
  100461:	e8 05 fe ff ff       	call   10026b <cprintf>
    vcprintf(fmt, ap);
  100466:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100469:	89 44 24 04          	mov    %eax,0x4(%esp)
  10046d:	8b 45 10             	mov    0x10(%ebp),%eax
  100470:	89 04 24             	mov    %eax,(%esp)
  100473:	e8 c0 fd ff ff       	call   100238 <vcprintf>
    cprintf("\n");
  100478:	c7 04 24 06 37 10 00 	movl   $0x103706,(%esp)
  10047f:	e8 e7 fd ff ff       	call   10026b <cprintf>
    va_end(ap);
}
  100484:	90                   	nop
  100485:	c9                   	leave  
  100486:	c3                   	ret    

00100487 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  100487:	55                   	push   %ebp
  100488:	89 e5                	mov    %esp,%ebp
    return is_panic;
  10048a:	a1 40 ee 10 00       	mov    0x10ee40,%eax
}
  10048f:	5d                   	pop    %ebp
  100490:	c3                   	ret    

00100491 <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  100491:	55                   	push   %ebp
  100492:	89 e5                	mov    %esp,%ebp
  100494:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  100497:	8b 45 0c             	mov    0xc(%ebp),%eax
  10049a:	8b 00                	mov    (%eax),%eax
  10049c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10049f:	8b 45 10             	mov    0x10(%ebp),%eax
  1004a2:	8b 00                	mov    (%eax),%eax
  1004a4:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1004a7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1004ae:	e9 ca 00 00 00       	jmp    10057d <stab_binsearch+0xec>
        int true_m = (l + r) / 2, m = true_m;
  1004b3:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004b6:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1004b9:	01 d0                	add    %edx,%eax
  1004bb:	89 c2                	mov    %eax,%edx
  1004bd:	c1 ea 1f             	shr    $0x1f,%edx
  1004c0:	01 d0                	add    %edx,%eax
  1004c2:	d1 f8                	sar    %eax
  1004c4:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1004c7:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1004ca:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1004cd:	eb 03                	jmp    1004d2 <stab_binsearch+0x41>
            m --;
  1004cf:	ff 4d f0             	decl   -0x10(%ebp)

    while (l <= r) {
        int true_m = (l + r) / 2, m = true_m;

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1004d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004d5:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004d8:	7c 1f                	jl     1004f9 <stab_binsearch+0x68>
  1004da:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004dd:	89 d0                	mov    %edx,%eax
  1004df:	01 c0                	add    %eax,%eax
  1004e1:	01 d0                	add    %edx,%eax
  1004e3:	c1 e0 02             	shl    $0x2,%eax
  1004e6:	89 c2                	mov    %eax,%edx
  1004e8:	8b 45 08             	mov    0x8(%ebp),%eax
  1004eb:	01 d0                	add    %edx,%eax
  1004ed:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1004f1:	0f b6 c0             	movzbl %al,%eax
  1004f4:	3b 45 14             	cmp    0x14(%ebp),%eax
  1004f7:	75 d6                	jne    1004cf <stab_binsearch+0x3e>
            m --;
        }
        if (m < l) {    // no match in [l, m]
  1004f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004fc:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004ff:	7d 09                	jge    10050a <stab_binsearch+0x79>
            l = true_m + 1;
  100501:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100504:	40                   	inc    %eax
  100505:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  100508:	eb 73                	jmp    10057d <stab_binsearch+0xec>
        }

        // actual binary search
        any_matches = 1;
  10050a:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  100511:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100514:	89 d0                	mov    %edx,%eax
  100516:	01 c0                	add    %eax,%eax
  100518:	01 d0                	add    %edx,%eax
  10051a:	c1 e0 02             	shl    $0x2,%eax
  10051d:	89 c2                	mov    %eax,%edx
  10051f:	8b 45 08             	mov    0x8(%ebp),%eax
  100522:	01 d0                	add    %edx,%eax
  100524:	8b 40 08             	mov    0x8(%eax),%eax
  100527:	3b 45 18             	cmp    0x18(%ebp),%eax
  10052a:	73 11                	jae    10053d <stab_binsearch+0xac>
            *region_left = m;
  10052c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10052f:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100532:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100534:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100537:	40                   	inc    %eax
  100538:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10053b:	eb 40                	jmp    10057d <stab_binsearch+0xec>
        } else if (stabs[m].n_value > addr) {
  10053d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100540:	89 d0                	mov    %edx,%eax
  100542:	01 c0                	add    %eax,%eax
  100544:	01 d0                	add    %edx,%eax
  100546:	c1 e0 02             	shl    $0x2,%eax
  100549:	89 c2                	mov    %eax,%edx
  10054b:	8b 45 08             	mov    0x8(%ebp),%eax
  10054e:	01 d0                	add    %edx,%eax
  100550:	8b 40 08             	mov    0x8(%eax),%eax
  100553:	3b 45 18             	cmp    0x18(%ebp),%eax
  100556:	76 14                	jbe    10056c <stab_binsearch+0xdb>
            *region_right = m - 1;
  100558:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10055b:	8d 50 ff             	lea    -0x1(%eax),%edx
  10055e:	8b 45 10             	mov    0x10(%ebp),%eax
  100561:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  100563:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100566:	48                   	dec    %eax
  100567:	89 45 f8             	mov    %eax,-0x8(%ebp)
  10056a:	eb 11                	jmp    10057d <stab_binsearch+0xec>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  10056c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10056f:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100572:	89 10                	mov    %edx,(%eax)
            l = m;
  100574:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100577:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  10057a:	ff 45 18             	incl   0x18(%ebp)
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
    int l = *region_left, r = *region_right, any_matches = 0;

    while (l <= r) {
  10057d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100580:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  100583:	0f 8e 2a ff ff ff    	jle    1004b3 <stab_binsearch+0x22>
            l = m;
            addr ++;
        }
    }

    if (!any_matches) {
  100589:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10058d:	75 0f                	jne    10059e <stab_binsearch+0x10d>
        *region_right = *region_left - 1;
  10058f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100592:	8b 00                	mov    (%eax),%eax
  100594:	8d 50 ff             	lea    -0x1(%eax),%edx
  100597:	8b 45 10             	mov    0x10(%ebp),%eax
  10059a:	89 10                	mov    %edx,(%eax)
        l = *region_right;
        for (; l > *region_left && stabs[l].n_type != type; l --)
            /* do nothing */;
        *region_left = l;
    }
}
  10059c:	eb 3e                	jmp    1005dc <stab_binsearch+0x14b>
    if (!any_matches) {
        *region_right = *region_left - 1;
    }
    else {
        // find rightmost region containing 'addr'
        l = *region_right;
  10059e:	8b 45 10             	mov    0x10(%ebp),%eax
  1005a1:	8b 00                	mov    (%eax),%eax
  1005a3:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1005a6:	eb 03                	jmp    1005ab <stab_binsearch+0x11a>
  1005a8:	ff 4d fc             	decl   -0x4(%ebp)
  1005ab:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005ae:	8b 00                	mov    (%eax),%eax
  1005b0:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1005b3:	7d 1f                	jge    1005d4 <stab_binsearch+0x143>
  1005b5:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005b8:	89 d0                	mov    %edx,%eax
  1005ba:	01 c0                	add    %eax,%eax
  1005bc:	01 d0                	add    %edx,%eax
  1005be:	c1 e0 02             	shl    $0x2,%eax
  1005c1:	89 c2                	mov    %eax,%edx
  1005c3:	8b 45 08             	mov    0x8(%ebp),%eax
  1005c6:	01 d0                	add    %edx,%eax
  1005c8:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1005cc:	0f b6 c0             	movzbl %al,%eax
  1005cf:	3b 45 14             	cmp    0x14(%ebp),%eax
  1005d2:	75 d4                	jne    1005a8 <stab_binsearch+0x117>
            /* do nothing */;
        *region_left = l;
  1005d4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005d7:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005da:	89 10                	mov    %edx,(%eax)
    }
}
  1005dc:	90                   	nop
  1005dd:	c9                   	leave  
  1005de:	c3                   	ret    

001005df <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  1005df:	55                   	push   %ebp
  1005e0:	89 e5                	mov    %esp,%ebp
  1005e2:	83 ec 58             	sub    $0x58,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  1005e5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005e8:	c7 00 38 37 10 00    	movl   $0x103738,(%eax)
    info->eip_line = 0;
  1005ee:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005f1:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  1005f8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005fb:	c7 40 08 38 37 10 00 	movl   $0x103738,0x8(%eax)
    info->eip_fn_namelen = 9;
  100602:	8b 45 0c             	mov    0xc(%ebp),%eax
  100605:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  10060c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10060f:	8b 55 08             	mov    0x8(%ebp),%edx
  100612:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  100615:	8b 45 0c             	mov    0xc(%ebp),%eax
  100618:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  10061f:	c7 45 f4 8c 3f 10 00 	movl   $0x103f8c,-0xc(%ebp)
    stab_end = __STAB_END__;
  100626:	c7 45 f0 80 ba 10 00 	movl   $0x10ba80,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  10062d:	c7 45 ec 81 ba 10 00 	movl   $0x10ba81,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  100634:	c7 45 e8 bf da 10 00 	movl   $0x10dabf,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  10063b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10063e:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  100641:	76 0b                	jbe    10064e <debuginfo_eip+0x6f>
  100643:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100646:	48                   	dec    %eax
  100647:	0f b6 00             	movzbl (%eax),%eax
  10064a:	84 c0                	test   %al,%al
  10064c:	74 0a                	je     100658 <debuginfo_eip+0x79>
        return -1;
  10064e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100653:	e9 b7 02 00 00       	jmp    10090f <debuginfo_eip+0x330>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100658:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10065f:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100662:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100665:	29 c2                	sub    %eax,%edx
  100667:	89 d0                	mov    %edx,%eax
  100669:	c1 f8 02             	sar    $0x2,%eax
  10066c:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  100672:	48                   	dec    %eax
  100673:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  100676:	8b 45 08             	mov    0x8(%ebp),%eax
  100679:	89 44 24 10          	mov    %eax,0x10(%esp)
  10067d:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  100684:	00 
  100685:	8d 45 e0             	lea    -0x20(%ebp),%eax
  100688:	89 44 24 08          	mov    %eax,0x8(%esp)
  10068c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  10068f:	89 44 24 04          	mov    %eax,0x4(%esp)
  100693:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100696:	89 04 24             	mov    %eax,(%esp)
  100699:	e8 f3 fd ff ff       	call   100491 <stab_binsearch>
    if (lfile == 0)
  10069e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006a1:	85 c0                	test   %eax,%eax
  1006a3:	75 0a                	jne    1006af <debuginfo_eip+0xd0>
        return -1;
  1006a5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1006aa:	e9 60 02 00 00       	jmp    10090f <debuginfo_eip+0x330>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1006af:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006b2:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1006b5:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1006b8:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1006bb:	8b 45 08             	mov    0x8(%ebp),%eax
  1006be:	89 44 24 10          	mov    %eax,0x10(%esp)
  1006c2:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  1006c9:	00 
  1006ca:	8d 45 d8             	lea    -0x28(%ebp),%eax
  1006cd:	89 44 24 08          	mov    %eax,0x8(%esp)
  1006d1:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1006d4:	89 44 24 04          	mov    %eax,0x4(%esp)
  1006d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006db:	89 04 24             	mov    %eax,(%esp)
  1006de:	e8 ae fd ff ff       	call   100491 <stab_binsearch>

    if (lfun <= rfun) {
  1006e3:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1006e6:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1006e9:	39 c2                	cmp    %eax,%edx
  1006eb:	7f 7c                	jg     100769 <debuginfo_eip+0x18a>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  1006ed:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1006f0:	89 c2                	mov    %eax,%edx
  1006f2:	89 d0                	mov    %edx,%eax
  1006f4:	01 c0                	add    %eax,%eax
  1006f6:	01 d0                	add    %edx,%eax
  1006f8:	c1 e0 02             	shl    $0x2,%eax
  1006fb:	89 c2                	mov    %eax,%edx
  1006fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100700:	01 d0                	add    %edx,%eax
  100702:	8b 00                	mov    (%eax),%eax
  100704:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  100707:	8b 55 ec             	mov    -0x14(%ebp),%edx
  10070a:	29 d1                	sub    %edx,%ecx
  10070c:	89 ca                	mov    %ecx,%edx
  10070e:	39 d0                	cmp    %edx,%eax
  100710:	73 22                	jae    100734 <debuginfo_eip+0x155>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  100712:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100715:	89 c2                	mov    %eax,%edx
  100717:	89 d0                	mov    %edx,%eax
  100719:	01 c0                	add    %eax,%eax
  10071b:	01 d0                	add    %edx,%eax
  10071d:	c1 e0 02             	shl    $0x2,%eax
  100720:	89 c2                	mov    %eax,%edx
  100722:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100725:	01 d0                	add    %edx,%eax
  100727:	8b 10                	mov    (%eax),%edx
  100729:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10072c:	01 c2                	add    %eax,%edx
  10072e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100731:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  100734:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100737:	89 c2                	mov    %eax,%edx
  100739:	89 d0                	mov    %edx,%eax
  10073b:	01 c0                	add    %eax,%eax
  10073d:	01 d0                	add    %edx,%eax
  10073f:	c1 e0 02             	shl    $0x2,%eax
  100742:	89 c2                	mov    %eax,%edx
  100744:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100747:	01 d0                	add    %edx,%eax
  100749:	8b 50 08             	mov    0x8(%eax),%edx
  10074c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10074f:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  100752:	8b 45 0c             	mov    0xc(%ebp),%eax
  100755:	8b 40 10             	mov    0x10(%eax),%eax
  100758:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  10075b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10075e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  100761:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100764:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100767:	eb 15                	jmp    10077e <debuginfo_eip+0x19f>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  100769:	8b 45 0c             	mov    0xc(%ebp),%eax
  10076c:	8b 55 08             	mov    0x8(%ebp),%edx
  10076f:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  100772:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100775:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  100778:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10077b:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  10077e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100781:	8b 40 08             	mov    0x8(%eax),%eax
  100784:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  10078b:	00 
  10078c:	89 04 24             	mov    %eax,(%esp)
  10078f:	e8 16 25 00 00       	call   102caa <strfind>
  100794:	89 c2                	mov    %eax,%edx
  100796:	8b 45 0c             	mov    0xc(%ebp),%eax
  100799:	8b 40 08             	mov    0x8(%eax),%eax
  10079c:	29 c2                	sub    %eax,%edx
  10079e:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007a1:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1007a4:	8b 45 08             	mov    0x8(%ebp),%eax
  1007a7:	89 44 24 10          	mov    %eax,0x10(%esp)
  1007ab:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  1007b2:	00 
  1007b3:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1007b6:	89 44 24 08          	mov    %eax,0x8(%esp)
  1007ba:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1007bd:	89 44 24 04          	mov    %eax,0x4(%esp)
  1007c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007c4:	89 04 24             	mov    %eax,(%esp)
  1007c7:	e8 c5 fc ff ff       	call   100491 <stab_binsearch>
    if (lline <= rline) {
  1007cc:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1007cf:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1007d2:	39 c2                	cmp    %eax,%edx
  1007d4:	7f 23                	jg     1007f9 <debuginfo_eip+0x21a>
        info->eip_line = stabs[rline].n_desc;
  1007d6:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1007d9:	89 c2                	mov    %eax,%edx
  1007db:	89 d0                	mov    %edx,%eax
  1007dd:	01 c0                	add    %eax,%eax
  1007df:	01 d0                	add    %edx,%eax
  1007e1:	c1 e0 02             	shl    $0x2,%eax
  1007e4:	89 c2                	mov    %eax,%edx
  1007e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007e9:	01 d0                	add    %edx,%eax
  1007eb:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  1007ef:	89 c2                	mov    %eax,%edx
  1007f1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007f4:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  1007f7:	eb 11                	jmp    10080a <debuginfo_eip+0x22b>
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
    if (lline <= rline) {
        info->eip_line = stabs[rline].n_desc;
    } else {
        return -1;
  1007f9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1007fe:	e9 0c 01 00 00       	jmp    10090f <debuginfo_eip+0x330>
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  100803:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100806:	48                   	dec    %eax
  100807:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  10080a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10080d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100810:	39 c2                	cmp    %eax,%edx
  100812:	7c 56                	jl     10086a <debuginfo_eip+0x28b>
           && stabs[lline].n_type != N_SOL
  100814:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100817:	89 c2                	mov    %eax,%edx
  100819:	89 d0                	mov    %edx,%eax
  10081b:	01 c0                	add    %eax,%eax
  10081d:	01 d0                	add    %edx,%eax
  10081f:	c1 e0 02             	shl    $0x2,%eax
  100822:	89 c2                	mov    %eax,%edx
  100824:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100827:	01 d0                	add    %edx,%eax
  100829:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10082d:	3c 84                	cmp    $0x84,%al
  10082f:	74 39                	je     10086a <debuginfo_eip+0x28b>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  100831:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100834:	89 c2                	mov    %eax,%edx
  100836:	89 d0                	mov    %edx,%eax
  100838:	01 c0                	add    %eax,%eax
  10083a:	01 d0                	add    %edx,%eax
  10083c:	c1 e0 02             	shl    $0x2,%eax
  10083f:	89 c2                	mov    %eax,%edx
  100841:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100844:	01 d0                	add    %edx,%eax
  100846:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10084a:	3c 64                	cmp    $0x64,%al
  10084c:	75 b5                	jne    100803 <debuginfo_eip+0x224>
  10084e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100851:	89 c2                	mov    %eax,%edx
  100853:	89 d0                	mov    %edx,%eax
  100855:	01 c0                	add    %eax,%eax
  100857:	01 d0                	add    %edx,%eax
  100859:	c1 e0 02             	shl    $0x2,%eax
  10085c:	89 c2                	mov    %eax,%edx
  10085e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100861:	01 d0                	add    %edx,%eax
  100863:	8b 40 08             	mov    0x8(%eax),%eax
  100866:	85 c0                	test   %eax,%eax
  100868:	74 99                	je     100803 <debuginfo_eip+0x224>
        lline --;
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  10086a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10086d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100870:	39 c2                	cmp    %eax,%edx
  100872:	7c 46                	jl     1008ba <debuginfo_eip+0x2db>
  100874:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100877:	89 c2                	mov    %eax,%edx
  100879:	89 d0                	mov    %edx,%eax
  10087b:	01 c0                	add    %eax,%eax
  10087d:	01 d0                	add    %edx,%eax
  10087f:	c1 e0 02             	shl    $0x2,%eax
  100882:	89 c2                	mov    %eax,%edx
  100884:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100887:	01 d0                	add    %edx,%eax
  100889:	8b 00                	mov    (%eax),%eax
  10088b:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  10088e:	8b 55 ec             	mov    -0x14(%ebp),%edx
  100891:	29 d1                	sub    %edx,%ecx
  100893:	89 ca                	mov    %ecx,%edx
  100895:	39 d0                	cmp    %edx,%eax
  100897:	73 21                	jae    1008ba <debuginfo_eip+0x2db>
        info->eip_file = stabstr + stabs[lline].n_strx;
  100899:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10089c:	89 c2                	mov    %eax,%edx
  10089e:	89 d0                	mov    %edx,%eax
  1008a0:	01 c0                	add    %eax,%eax
  1008a2:	01 d0                	add    %edx,%eax
  1008a4:	c1 e0 02             	shl    $0x2,%eax
  1008a7:	89 c2                	mov    %eax,%edx
  1008a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008ac:	01 d0                	add    %edx,%eax
  1008ae:	8b 10                	mov    (%eax),%edx
  1008b0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1008b3:	01 c2                	add    %eax,%edx
  1008b5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008b8:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1008ba:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1008bd:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1008c0:	39 c2                	cmp    %eax,%edx
  1008c2:	7d 46                	jge    10090a <debuginfo_eip+0x32b>
        for (lline = lfun + 1;
  1008c4:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1008c7:	40                   	inc    %eax
  1008c8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  1008cb:	eb 16                	jmp    1008e3 <debuginfo_eip+0x304>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  1008cd:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008d0:	8b 40 14             	mov    0x14(%eax),%eax
  1008d3:	8d 50 01             	lea    0x1(%eax),%edx
  1008d6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008d9:	89 50 14             	mov    %edx,0x14(%eax)
    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
  1008dc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008df:	40                   	inc    %eax
  1008e0:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1008e3:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1008e6:	8b 45 d8             	mov    -0x28(%ebp),%eax
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
  1008e9:	39 c2                	cmp    %eax,%edx
  1008eb:	7d 1d                	jge    10090a <debuginfo_eip+0x32b>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1008ed:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008f0:	89 c2                	mov    %eax,%edx
  1008f2:	89 d0                	mov    %edx,%eax
  1008f4:	01 c0                	add    %eax,%eax
  1008f6:	01 d0                	add    %edx,%eax
  1008f8:	c1 e0 02             	shl    $0x2,%eax
  1008fb:	89 c2                	mov    %eax,%edx
  1008fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100900:	01 d0                	add    %edx,%eax
  100902:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100906:	3c a0                	cmp    $0xa0,%al
  100908:	74 c3                	je     1008cd <debuginfo_eip+0x2ee>
             lline ++) {
            info->eip_fn_narg ++;
        }
    }
    return 0;
  10090a:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10090f:	c9                   	leave  
  100910:	c3                   	ret    

00100911 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  100911:	55                   	push   %ebp
  100912:	89 e5                	mov    %esp,%ebp
  100914:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  100917:	c7 04 24 42 37 10 00 	movl   $0x103742,(%esp)
  10091e:	e8 48 f9 ff ff       	call   10026b <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  100923:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  10092a:	00 
  10092b:	c7 04 24 5b 37 10 00 	movl   $0x10375b,(%esp)
  100932:	e8 34 f9 ff ff       	call   10026b <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  100937:	c7 44 24 04 28 36 10 	movl   $0x103628,0x4(%esp)
  10093e:	00 
  10093f:	c7 04 24 73 37 10 00 	movl   $0x103773,(%esp)
  100946:	e8 20 f9 ff ff       	call   10026b <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  10094b:	c7 44 24 04 16 ea 10 	movl   $0x10ea16,0x4(%esp)
  100952:	00 
  100953:	c7 04 24 8b 37 10 00 	movl   $0x10378b,(%esp)
  10095a:	e8 0c f9 ff ff       	call   10026b <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  10095f:	c7 44 24 04 20 fd 10 	movl   $0x10fd20,0x4(%esp)
  100966:	00 
  100967:	c7 04 24 a3 37 10 00 	movl   $0x1037a3,(%esp)
  10096e:	e8 f8 f8 ff ff       	call   10026b <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  100973:	b8 20 fd 10 00       	mov    $0x10fd20,%eax
  100978:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  10097e:	b8 00 00 10 00       	mov    $0x100000,%eax
  100983:	29 c2                	sub    %eax,%edx
  100985:	89 d0                	mov    %edx,%eax
  100987:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  10098d:	85 c0                	test   %eax,%eax
  10098f:	0f 48 c2             	cmovs  %edx,%eax
  100992:	c1 f8 0a             	sar    $0xa,%eax
  100995:	89 44 24 04          	mov    %eax,0x4(%esp)
  100999:	c7 04 24 bc 37 10 00 	movl   $0x1037bc,(%esp)
  1009a0:	e8 c6 f8 ff ff       	call   10026b <cprintf>
}
  1009a5:	90                   	nop
  1009a6:	c9                   	leave  
  1009a7:	c3                   	ret    

001009a8 <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1009a8:	55                   	push   %ebp
  1009a9:	89 e5                	mov    %esp,%ebp
  1009ab:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1009b1:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1009b4:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009b8:	8b 45 08             	mov    0x8(%ebp),%eax
  1009bb:	89 04 24             	mov    %eax,(%esp)
  1009be:	e8 1c fc ff ff       	call   1005df <debuginfo_eip>
  1009c3:	85 c0                	test   %eax,%eax
  1009c5:	74 15                	je     1009dc <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  1009c7:	8b 45 08             	mov    0x8(%ebp),%eax
  1009ca:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009ce:	c7 04 24 e6 37 10 00 	movl   $0x1037e6,(%esp)
  1009d5:	e8 91 f8 ff ff       	call   10026b <cprintf>
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
    }
}
  1009da:	eb 6c                	jmp    100a48 <print_debuginfo+0xa0>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1009dc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1009e3:	eb 1b                	jmp    100a00 <print_debuginfo+0x58>
            fnname[j] = info.eip_fn_name[j];
  1009e5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1009e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009eb:	01 d0                	add    %edx,%eax
  1009ed:	0f b6 00             	movzbl (%eax),%eax
  1009f0:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  1009f6:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1009f9:	01 ca                	add    %ecx,%edx
  1009fb:	88 02                	mov    %al,(%edx)
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1009fd:	ff 45 f4             	incl   -0xc(%ebp)
  100a00:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100a03:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  100a06:	7f dd                	jg     1009e5 <print_debuginfo+0x3d>
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
  100a08:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  100a0e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a11:	01 d0                	add    %edx,%eax
  100a13:	c6 00 00             	movb   $0x0,(%eax)
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
  100a16:	8b 45 ec             	mov    -0x14(%ebp),%eax
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  100a19:	8b 55 08             	mov    0x8(%ebp),%edx
  100a1c:	89 d1                	mov    %edx,%ecx
  100a1e:	29 c1                	sub    %eax,%ecx
  100a20:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100a23:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100a26:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  100a2a:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100a30:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100a34:	89 54 24 08          	mov    %edx,0x8(%esp)
  100a38:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a3c:	c7 04 24 02 38 10 00 	movl   $0x103802,(%esp)
  100a43:	e8 23 f8 ff ff       	call   10026b <cprintf>
                fnname, eip - info.eip_fn_addr);
    }
}
  100a48:	90                   	nop
  100a49:	c9                   	leave  
  100a4a:	c3                   	ret    

00100a4b <read_eip>:

static __noinline uint32_t
read_eip(void) {
  100a4b:	55                   	push   %ebp
  100a4c:	89 e5                	mov    %esp,%ebp
  100a4e:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100a51:	8b 45 04             	mov    0x4(%ebp),%eax
  100a54:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  100a57:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100a5a:	c9                   	leave  
  100a5b:	c3                   	ret    

00100a5c <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100a5c:	55                   	push   %ebp
  100a5d:	89 e5                	mov    %esp,%ebp
  100a5f:	53                   	push   %ebx
  100a60:	83 ec 44             	sub    $0x44,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100a63:	89 e8                	mov    %ebp,%eax
  100a65:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    return ebp;
  100a68:	8b 45 e4             	mov    -0x1c(%ebp),%eax
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
     uint32_t ebp=read_ebp(), eip=read_eip();
  100a6b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100a6e:	e8 d8 ff ff ff       	call   100a4b <read_eip>
  100a73:	89 45 f0             	mov    %eax,-0x10(%ebp)
     for(int i=0;i<STACKFRAME_DEPTH;i++){
  100a76:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  100a7d:	eb 7e                	jmp    100afd <print_stackframe+0xa1>
     
     uint32_t* call_arguments = (uint32_t*)ebp+2;
  100a7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a82:	83 c0 08             	add    $0x8,%eax
  100a85:	89 45 e8             	mov    %eax,-0x18(%ebp)
     cprintf("ebp:0x%08x eip:0x%08x args:0x%08x 0x%08x 0x%08x 0x%08x",
             ebp,eip,call_arguments[0],call_arguments[1],
             call_arguments[2],call_arguments[3]);
  100a88:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100a8b:	83 c0 0c             	add    $0xc,%eax
      */
     uint32_t ebp=read_ebp(), eip=read_eip();
     for(int i=0;i<STACKFRAME_DEPTH;i++){
     
     uint32_t* call_arguments = (uint32_t*)ebp+2;
     cprintf("ebp:0x%08x eip:0x%08x args:0x%08x 0x%08x 0x%08x 0x%08x",
  100a8e:	8b 18                	mov    (%eax),%ebx
             ebp,eip,call_arguments[0],call_arguments[1],
             call_arguments[2],call_arguments[3]);
  100a90:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100a93:	83 c0 08             	add    $0x8,%eax
      */
     uint32_t ebp=read_ebp(), eip=read_eip();
     for(int i=0;i<STACKFRAME_DEPTH;i++){
     
     uint32_t* call_arguments = (uint32_t*)ebp+2;
     cprintf("ebp:0x%08x eip:0x%08x args:0x%08x 0x%08x 0x%08x 0x%08x",
  100a96:	8b 08                	mov    (%eax),%ecx
             ebp,eip,call_arguments[0],call_arguments[1],
  100a98:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100a9b:	83 c0 04             	add    $0x4,%eax
      */
     uint32_t ebp=read_ebp(), eip=read_eip();
     for(int i=0;i<STACKFRAME_DEPTH;i++){
     
     uint32_t* call_arguments = (uint32_t*)ebp+2;
     cprintf("ebp:0x%08x eip:0x%08x args:0x%08x 0x%08x 0x%08x 0x%08x",
  100a9e:	8b 10                	mov    (%eax),%edx
  100aa0:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100aa3:	8b 00                	mov    (%eax),%eax
  100aa5:	89 5c 24 18          	mov    %ebx,0x18(%esp)
  100aa9:	89 4c 24 14          	mov    %ecx,0x14(%esp)
  100aad:	89 54 24 10          	mov    %edx,0x10(%esp)
  100ab1:	89 44 24 0c          	mov    %eax,0xc(%esp)
  100ab5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100ab8:	89 44 24 08          	mov    %eax,0x8(%esp)
  100abc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100abf:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ac3:	c7 04 24 14 38 10 00 	movl   $0x103814,(%esp)
  100aca:	e8 9c f7 ff ff       	call   10026b <cprintf>
             ebp,eip,call_arguments[0],call_arguments[1],
             call_arguments[2],call_arguments[3]);
     cprintf("\n");
  100acf:	c7 04 24 4b 38 10 00 	movl   $0x10384b,(%esp)
  100ad6:	e8 90 f7 ff ff       	call   10026b <cprintf>
     print_debuginfo(eip-1);
  100adb:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100ade:	48                   	dec    %eax
  100adf:	89 04 24             	mov    %eax,(%esp)
  100ae2:	e8 c1 fe ff ff       	call   1009a8 <print_debuginfo>
     eip=*(((uint32_t*)ebp)+1);
  100ae7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100aea:	83 c0 04             	add    $0x4,%eax
  100aed:	8b 00                	mov    (%eax),%eax
  100aef:	89 45 f0             	mov    %eax,-0x10(%ebp)
     ebp=*((uint32_t*)ebp);
  100af2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100af5:	8b 00                	mov    (%eax),%eax
  100af7:	89 45 f4             	mov    %eax,-0xc(%ebp)
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
     uint32_t ebp=read_ebp(), eip=read_eip();
     for(int i=0;i<STACKFRAME_DEPTH;i++){
  100afa:	ff 45 ec             	incl   -0x14(%ebp)
  100afd:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  100b01:	0f 8e 78 ff ff ff    	jle    100a7f <print_stackframe+0x23>
     cprintf("\n");
     print_debuginfo(eip-1);
     eip=*(((uint32_t*)ebp)+1);
     ebp=*((uint32_t*)ebp);
     } 
}
  100b07:	90                   	nop
  100b08:	83 c4 44             	add    $0x44,%esp
  100b0b:	5b                   	pop    %ebx
  100b0c:	5d                   	pop    %ebp
  100b0d:	c3                   	ret    

00100b0e <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100b0e:	55                   	push   %ebp
  100b0f:	89 e5                	mov    %esp,%ebp
  100b11:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100b14:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b1b:	eb 0c                	jmp    100b29 <parse+0x1b>
            *buf ++ = '\0';
  100b1d:	8b 45 08             	mov    0x8(%ebp),%eax
  100b20:	8d 50 01             	lea    0x1(%eax),%edx
  100b23:	89 55 08             	mov    %edx,0x8(%ebp)
  100b26:	c6 00 00             	movb   $0x0,(%eax)
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b29:	8b 45 08             	mov    0x8(%ebp),%eax
  100b2c:	0f b6 00             	movzbl (%eax),%eax
  100b2f:	84 c0                	test   %al,%al
  100b31:	74 1d                	je     100b50 <parse+0x42>
  100b33:	8b 45 08             	mov    0x8(%ebp),%eax
  100b36:	0f b6 00             	movzbl (%eax),%eax
  100b39:	0f be c0             	movsbl %al,%eax
  100b3c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b40:	c7 04 24 d0 38 10 00 	movl   $0x1038d0,(%esp)
  100b47:	e8 2c 21 00 00       	call   102c78 <strchr>
  100b4c:	85 c0                	test   %eax,%eax
  100b4e:	75 cd                	jne    100b1d <parse+0xf>
            *buf ++ = '\0';
        }
        if (*buf == '\0') {
  100b50:	8b 45 08             	mov    0x8(%ebp),%eax
  100b53:	0f b6 00             	movzbl (%eax),%eax
  100b56:	84 c0                	test   %al,%al
  100b58:	74 69                	je     100bc3 <parse+0xb5>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100b5a:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100b5e:	75 14                	jne    100b74 <parse+0x66>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100b60:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  100b67:	00 
  100b68:	c7 04 24 d5 38 10 00 	movl   $0x1038d5,(%esp)
  100b6f:	e8 f7 f6 ff ff       	call   10026b <cprintf>
        }
        argv[argc ++] = buf;
  100b74:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b77:	8d 50 01             	lea    0x1(%eax),%edx
  100b7a:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100b7d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100b84:	8b 45 0c             	mov    0xc(%ebp),%eax
  100b87:	01 c2                	add    %eax,%edx
  100b89:	8b 45 08             	mov    0x8(%ebp),%eax
  100b8c:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100b8e:	eb 03                	jmp    100b93 <parse+0x85>
            buf ++;
  100b90:	ff 45 08             	incl   0x8(%ebp)
        // save and scan past next arg
        if (argc == MAXARGS - 1) {
            cprintf("Too many arguments (max %d).\n", MAXARGS);
        }
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100b93:	8b 45 08             	mov    0x8(%ebp),%eax
  100b96:	0f b6 00             	movzbl (%eax),%eax
  100b99:	84 c0                	test   %al,%al
  100b9b:	0f 84 7a ff ff ff    	je     100b1b <parse+0xd>
  100ba1:	8b 45 08             	mov    0x8(%ebp),%eax
  100ba4:	0f b6 00             	movzbl (%eax),%eax
  100ba7:	0f be c0             	movsbl %al,%eax
  100baa:	89 44 24 04          	mov    %eax,0x4(%esp)
  100bae:	c7 04 24 d0 38 10 00 	movl   $0x1038d0,(%esp)
  100bb5:	e8 be 20 00 00       	call   102c78 <strchr>
  100bba:	85 c0                	test   %eax,%eax
  100bbc:	74 d2                	je     100b90 <parse+0x82>
            buf ++;
        }
    }
  100bbe:	e9 58 ff ff ff       	jmp    100b1b <parse+0xd>
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
            *buf ++ = '\0';
        }
        if (*buf == '\0') {
            break;
  100bc3:	90                   	nop
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
            buf ++;
        }
    }
    return argc;
  100bc4:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100bc7:	c9                   	leave  
  100bc8:	c3                   	ret    

00100bc9 <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100bc9:	55                   	push   %ebp
  100bca:	89 e5                	mov    %esp,%ebp
  100bcc:	53                   	push   %ebx
  100bcd:	83 ec 64             	sub    $0x64,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100bd0:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100bd3:	89 44 24 04          	mov    %eax,0x4(%esp)
  100bd7:	8b 45 08             	mov    0x8(%ebp),%eax
  100bda:	89 04 24             	mov    %eax,(%esp)
  100bdd:	e8 2c ff ff ff       	call   100b0e <parse>
  100be2:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100be5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100be9:	75 0a                	jne    100bf5 <runcmd+0x2c>
        return 0;
  100beb:	b8 00 00 00 00       	mov    $0x0,%eax
  100bf0:	e9 83 00 00 00       	jmp    100c78 <runcmd+0xaf>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100bf5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100bfc:	eb 5a                	jmp    100c58 <runcmd+0x8f>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100bfe:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100c01:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c04:	89 d0                	mov    %edx,%eax
  100c06:	01 c0                	add    %eax,%eax
  100c08:	01 d0                	add    %edx,%eax
  100c0a:	c1 e0 02             	shl    $0x2,%eax
  100c0d:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c12:	8b 00                	mov    (%eax),%eax
  100c14:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100c18:	89 04 24             	mov    %eax,(%esp)
  100c1b:	e8 bb 1f 00 00       	call   102bdb <strcmp>
  100c20:	85 c0                	test   %eax,%eax
  100c22:	75 31                	jne    100c55 <runcmd+0x8c>
            return commands[i].func(argc - 1, argv + 1, tf);
  100c24:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c27:	89 d0                	mov    %edx,%eax
  100c29:	01 c0                	add    %eax,%eax
  100c2b:	01 d0                	add    %edx,%eax
  100c2d:	c1 e0 02             	shl    $0x2,%eax
  100c30:	05 08 e0 10 00       	add    $0x10e008,%eax
  100c35:	8b 10                	mov    (%eax),%edx
  100c37:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100c3a:	83 c0 04             	add    $0x4,%eax
  100c3d:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  100c40:	8d 59 ff             	lea    -0x1(%ecx),%ebx
  100c43:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100c46:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100c4a:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c4e:	89 1c 24             	mov    %ebx,(%esp)
  100c51:	ff d2                	call   *%edx
  100c53:	eb 23                	jmp    100c78 <runcmd+0xaf>
    int argc = parse(buf, argv);
    if (argc == 0) {
        return 0;
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c55:	ff 45 f4             	incl   -0xc(%ebp)
  100c58:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c5b:	83 f8 02             	cmp    $0x2,%eax
  100c5e:	76 9e                	jbe    100bfe <runcmd+0x35>
        if (strcmp(commands[i].name, argv[0]) == 0) {
            return commands[i].func(argc - 1, argv + 1, tf);
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100c60:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100c63:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c67:	c7 04 24 f3 38 10 00 	movl   $0x1038f3,(%esp)
  100c6e:	e8 f8 f5 ff ff       	call   10026b <cprintf>
    return 0;
  100c73:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c78:	83 c4 64             	add    $0x64,%esp
  100c7b:	5b                   	pop    %ebx
  100c7c:	5d                   	pop    %ebp
  100c7d:	c3                   	ret    

00100c7e <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100c7e:	55                   	push   %ebp
  100c7f:	89 e5                	mov    %esp,%ebp
  100c81:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100c84:	c7 04 24 0c 39 10 00 	movl   $0x10390c,(%esp)
  100c8b:	e8 db f5 ff ff       	call   10026b <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100c90:	c7 04 24 34 39 10 00 	movl   $0x103934,(%esp)
  100c97:	e8 cf f5 ff ff       	call   10026b <cprintf>

    if (tf != NULL) {
  100c9c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100ca0:	74 0b                	je     100cad <kmonitor+0x2f>
        print_trapframe(tf);
  100ca2:	8b 45 08             	mov    0x8(%ebp),%eax
  100ca5:	89 04 24             	mov    %eax,(%esp)
  100ca8:	e8 35 0d 00 00       	call   1019e2 <print_trapframe>
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100cad:	c7 04 24 59 39 10 00 	movl   $0x103959,(%esp)
  100cb4:	e8 54 f6 ff ff       	call   10030d <readline>
  100cb9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100cbc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100cc0:	74 eb                	je     100cad <kmonitor+0x2f>
            if (runcmd(buf, tf) < 0) {
  100cc2:	8b 45 08             	mov    0x8(%ebp),%eax
  100cc5:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cc9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ccc:	89 04 24             	mov    %eax,(%esp)
  100ccf:	e8 f5 fe ff ff       	call   100bc9 <runcmd>
  100cd4:	85 c0                	test   %eax,%eax
  100cd6:	78 02                	js     100cda <kmonitor+0x5c>
                break;
            }
        }
    }
  100cd8:	eb d3                	jmp    100cad <kmonitor+0x2f>

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
            if (runcmd(buf, tf) < 0) {
                break;
  100cda:	90                   	nop
            }
        }
    }
}
  100cdb:	90                   	nop
  100cdc:	c9                   	leave  
  100cdd:	c3                   	ret    

00100cde <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100cde:	55                   	push   %ebp
  100cdf:	89 e5                	mov    %esp,%ebp
  100ce1:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100ce4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100ceb:	eb 3d                	jmp    100d2a <mon_help+0x4c>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100ced:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100cf0:	89 d0                	mov    %edx,%eax
  100cf2:	01 c0                	add    %eax,%eax
  100cf4:	01 d0                	add    %edx,%eax
  100cf6:	c1 e0 02             	shl    $0x2,%eax
  100cf9:	05 04 e0 10 00       	add    $0x10e004,%eax
  100cfe:	8b 08                	mov    (%eax),%ecx
  100d00:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100d03:	89 d0                	mov    %edx,%eax
  100d05:	01 c0                	add    %eax,%eax
  100d07:	01 d0                	add    %edx,%eax
  100d09:	c1 e0 02             	shl    $0x2,%eax
  100d0c:	05 00 e0 10 00       	add    $0x10e000,%eax
  100d11:	8b 00                	mov    (%eax),%eax
  100d13:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100d17:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d1b:	c7 04 24 5d 39 10 00 	movl   $0x10395d,(%esp)
  100d22:	e8 44 f5 ff ff       	call   10026b <cprintf>

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100d27:	ff 45 f4             	incl   -0xc(%ebp)
  100d2a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d2d:	83 f8 02             	cmp    $0x2,%eax
  100d30:	76 bb                	jbe    100ced <mon_help+0xf>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
    }
    return 0;
  100d32:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d37:	c9                   	leave  
  100d38:	c3                   	ret    

00100d39 <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100d39:	55                   	push   %ebp
  100d3a:	89 e5                	mov    %esp,%ebp
  100d3c:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100d3f:	e8 cd fb ff ff       	call   100911 <print_kerninfo>
    return 0;
  100d44:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d49:	c9                   	leave  
  100d4a:	c3                   	ret    

00100d4b <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100d4b:	55                   	push   %ebp
  100d4c:	89 e5                	mov    %esp,%ebp
  100d4e:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100d51:	e8 06 fd ff ff       	call   100a5c <print_stackframe>
    return 0;
  100d56:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d5b:	c9                   	leave  
  100d5c:	c3                   	ret    

00100d5d <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100d5d:	55                   	push   %ebp
  100d5e:	89 e5                	mov    %esp,%ebp
  100d60:	83 ec 28             	sub    $0x28,%esp
  100d63:	66 c7 45 f6 43 00    	movw   $0x43,-0xa(%ebp)
  100d69:	c6 45 ef 34          	movb   $0x34,-0x11(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d6d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
  100d71:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100d75:	ee                   	out    %al,(%dx)
  100d76:	66 c7 45 f4 40 00    	movw   $0x40,-0xc(%ebp)
  100d7c:	c6 45 f0 9c          	movb   $0x9c,-0x10(%ebp)
  100d80:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
  100d84:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100d87:	ee                   	out    %al,(%dx)
  100d88:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100d8e:	c6 45 f1 2e          	movb   $0x2e,-0xf(%ebp)
  100d92:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100d96:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100d9a:	ee                   	out    %al,(%dx)
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100d9b:	c7 05 08 f9 10 00 00 	movl   $0x0,0x10f908
  100da2:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100da5:	c7 04 24 66 39 10 00 	movl   $0x103966,(%esp)
  100dac:	e8 ba f4 ff ff       	call   10026b <cprintf>
    pic_enable(IRQ_TIMER);
  100db1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100db8:	e8 ba 08 00 00       	call   101677 <pic_enable>
}
  100dbd:	90                   	nop
  100dbe:	c9                   	leave  
  100dbf:	c3                   	ret    

00100dc0 <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100dc0:	55                   	push   %ebp
  100dc1:	89 e5                	mov    %esp,%ebp
  100dc3:	83 ec 10             	sub    $0x10,%esp
  100dc6:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100dcc:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100dd0:	89 c2                	mov    %eax,%edx
  100dd2:	ec                   	in     (%dx),%al
  100dd3:	88 45 f4             	mov    %al,-0xc(%ebp)
  100dd6:	66 c7 45 fc 84 00    	movw   $0x84,-0x4(%ebp)
  100ddc:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ddf:	89 c2                	mov    %eax,%edx
  100de1:	ec                   	in     (%dx),%al
  100de2:	88 45 f5             	mov    %al,-0xb(%ebp)
  100de5:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100deb:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100def:	89 c2                	mov    %eax,%edx
  100df1:	ec                   	in     (%dx),%al
  100df2:	88 45 f6             	mov    %al,-0xa(%ebp)
  100df5:	66 c7 45 f8 84 00    	movw   $0x84,-0x8(%ebp)
  100dfb:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100dfe:	89 c2                	mov    %eax,%edx
  100e00:	ec                   	in     (%dx),%al
  100e01:	88 45 f7             	mov    %al,-0x9(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100e04:	90                   	nop
  100e05:	c9                   	leave  
  100e06:	c3                   	ret    

00100e07 <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  100e07:	55                   	push   %ebp
  100e08:	89 e5                	mov    %esp,%ebp
  100e0a:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  100e0d:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  100e14:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e17:	0f b7 00             	movzwl (%eax),%eax
  100e1a:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  100e1e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e21:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  100e26:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e29:	0f b7 00             	movzwl (%eax),%eax
  100e2c:	0f b7 c0             	movzwl %ax,%eax
  100e2f:	3d 5a a5 00 00       	cmp    $0xa55a,%eax
  100e34:	74 12                	je     100e48 <cga_init+0x41>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  100e36:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  100e3d:	66 c7 05 66 ee 10 00 	movw   $0x3b4,0x10ee66
  100e44:	b4 03 
  100e46:	eb 13                	jmp    100e5b <cga_init+0x54>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  100e48:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e4b:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100e4f:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  100e52:	66 c7 05 66 ee 10 00 	movw   $0x3d4,0x10ee66
  100e59:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  100e5b:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e62:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
  100e66:	c6 45 ea 0e          	movb   $0xe,-0x16(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e6a:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
  100e6e:	8b 55 f8             	mov    -0x8(%ebp),%edx
  100e71:	ee                   	out    %al,(%dx)
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  100e72:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e79:	40                   	inc    %eax
  100e7a:	0f b7 c0             	movzwl %ax,%eax
  100e7d:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e81:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100e85:	89 c2                	mov    %eax,%edx
  100e87:	ec                   	in     (%dx),%al
  100e88:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  100e8b:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
  100e8f:	0f b6 c0             	movzbl %al,%eax
  100e92:	c1 e0 08             	shl    $0x8,%eax
  100e95:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100e98:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e9f:	66 89 45 f0          	mov    %ax,-0x10(%ebp)
  100ea3:	c6 45 ec 0f          	movb   $0xf,-0x14(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ea7:	0f b6 45 ec          	movzbl -0x14(%ebp),%eax
  100eab:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100eae:	ee                   	out    %al,(%dx)
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  100eaf:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100eb6:	40                   	inc    %eax
  100eb7:	0f b7 c0             	movzwl %ax,%eax
  100eba:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ebe:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100ec2:	89 c2                	mov    %eax,%edx
  100ec4:	ec                   	in     (%dx),%al
  100ec5:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100ec8:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100ecc:	0f b6 c0             	movzbl %al,%eax
  100ecf:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  100ed2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ed5:	a3 60 ee 10 00       	mov    %eax,0x10ee60
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  100eda:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100edd:	0f b7 c0             	movzwl %ax,%eax
  100ee0:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
}
  100ee6:	90                   	nop
  100ee7:	c9                   	leave  
  100ee8:	c3                   	ret    

00100ee9 <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100ee9:	55                   	push   %ebp
  100eea:	89 e5                	mov    %esp,%ebp
  100eec:	83 ec 38             	sub    $0x38,%esp
  100eef:	66 c7 45 f6 fa 03    	movw   $0x3fa,-0xa(%ebp)
  100ef5:	c6 45 da 00          	movb   $0x0,-0x26(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ef9:	0f b6 45 da          	movzbl -0x26(%ebp),%eax
  100efd:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100f01:	ee                   	out    %al,(%dx)
  100f02:	66 c7 45 f4 fb 03    	movw   $0x3fb,-0xc(%ebp)
  100f08:	c6 45 db 80          	movb   $0x80,-0x25(%ebp)
  100f0c:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  100f10:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100f13:	ee                   	out    %al,(%dx)
  100f14:	66 c7 45 f2 f8 03    	movw   $0x3f8,-0xe(%ebp)
  100f1a:	c6 45 dc 0c          	movb   $0xc,-0x24(%ebp)
  100f1e:	0f b6 45 dc          	movzbl -0x24(%ebp),%eax
  100f22:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100f26:	ee                   	out    %al,(%dx)
  100f27:	66 c7 45 f0 f9 03    	movw   $0x3f9,-0x10(%ebp)
  100f2d:	c6 45 dd 00          	movb   $0x0,-0x23(%ebp)
  100f31:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100f35:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100f38:	ee                   	out    %al,(%dx)
  100f39:	66 c7 45 ee fb 03    	movw   $0x3fb,-0x12(%ebp)
  100f3f:	c6 45 de 03          	movb   $0x3,-0x22(%ebp)
  100f43:	0f b6 45 de          	movzbl -0x22(%ebp),%eax
  100f47:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100f4b:	ee                   	out    %al,(%dx)
  100f4c:	66 c7 45 ec fc 03    	movw   $0x3fc,-0x14(%ebp)
  100f52:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
  100f56:	0f b6 45 df          	movzbl -0x21(%ebp),%eax
  100f5a:	8b 55 ec             	mov    -0x14(%ebp),%edx
  100f5d:	ee                   	out    %al,(%dx)
  100f5e:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100f64:	c6 45 e0 01          	movb   $0x1,-0x20(%ebp)
  100f68:	0f b6 45 e0          	movzbl -0x20(%ebp),%eax
  100f6c:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100f70:	ee                   	out    %al,(%dx)
  100f71:	66 c7 45 e8 fd 03    	movw   $0x3fd,-0x18(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f77:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100f7a:	89 c2                	mov    %eax,%edx
  100f7c:	ec                   	in     (%dx),%al
  100f7d:	88 45 e1             	mov    %al,-0x1f(%ebp)
    return data;
  100f80:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100f84:	3c ff                	cmp    $0xff,%al
  100f86:	0f 95 c0             	setne  %al
  100f89:	0f b6 c0             	movzbl %al,%eax
  100f8c:	a3 68 ee 10 00       	mov    %eax,0x10ee68
  100f91:	66 c7 45 e6 fa 03    	movw   $0x3fa,-0x1a(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f97:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
  100f9b:	89 c2                	mov    %eax,%edx
  100f9d:	ec                   	in     (%dx),%al
  100f9e:	88 45 e2             	mov    %al,-0x1e(%ebp)
  100fa1:	66 c7 45 e4 f8 03    	movw   $0x3f8,-0x1c(%ebp)
  100fa7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100faa:	89 c2                	mov    %eax,%edx
  100fac:	ec                   	in     (%dx),%al
  100fad:	88 45 e3             	mov    %al,-0x1d(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100fb0:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  100fb5:	85 c0                	test   %eax,%eax
  100fb7:	74 0c                	je     100fc5 <serial_init+0xdc>
        pic_enable(IRQ_COM1);
  100fb9:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  100fc0:	e8 b2 06 00 00       	call   101677 <pic_enable>
    }
}
  100fc5:	90                   	nop
  100fc6:	c9                   	leave  
  100fc7:	c3                   	ret    

00100fc8 <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  100fc8:	55                   	push   %ebp
  100fc9:	89 e5                	mov    %esp,%ebp
  100fcb:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fce:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100fd5:	eb 08                	jmp    100fdf <lpt_putc_sub+0x17>
        delay();
  100fd7:	e8 e4 fd ff ff       	call   100dc0 <delay>
}

static void
lpt_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fdc:	ff 45 fc             	incl   -0x4(%ebp)
  100fdf:	66 c7 45 f4 79 03    	movw   $0x379,-0xc(%ebp)
  100fe5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100fe8:	89 c2                	mov    %eax,%edx
  100fea:	ec                   	in     (%dx),%al
  100feb:	88 45 f3             	mov    %al,-0xd(%ebp)
    return data;
  100fee:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  100ff2:	84 c0                	test   %al,%al
  100ff4:	78 09                	js     100fff <lpt_putc_sub+0x37>
  100ff6:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  100ffd:	7e d8                	jle    100fd7 <lpt_putc_sub+0xf>
        delay();
    }
    outb(LPTPORT + 0, c);
  100fff:	8b 45 08             	mov    0x8(%ebp),%eax
  101002:	0f b6 c0             	movzbl %al,%eax
  101005:	66 c7 45 f8 78 03    	movw   $0x378,-0x8(%ebp)
  10100b:	88 45 f0             	mov    %al,-0x10(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10100e:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
  101012:	8b 55 f8             	mov    -0x8(%ebp),%edx
  101015:	ee                   	out    %al,(%dx)
  101016:	66 c7 45 f6 7a 03    	movw   $0x37a,-0xa(%ebp)
  10101c:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
  101020:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101024:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101028:	ee                   	out    %al,(%dx)
  101029:	66 c7 45 fa 7a 03    	movw   $0x37a,-0x6(%ebp)
  10102f:	c6 45 f2 08          	movb   $0x8,-0xe(%ebp)
  101033:	0f b6 45 f2          	movzbl -0xe(%ebp),%eax
  101037:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  10103b:	ee                   	out    %al,(%dx)
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  10103c:	90                   	nop
  10103d:	c9                   	leave  
  10103e:	c3                   	ret    

0010103f <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  10103f:	55                   	push   %ebp
  101040:	89 e5                	mov    %esp,%ebp
  101042:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  101045:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101049:	74 0d                	je     101058 <lpt_putc+0x19>
        lpt_putc_sub(c);
  10104b:	8b 45 08             	mov    0x8(%ebp),%eax
  10104e:	89 04 24             	mov    %eax,(%esp)
  101051:	e8 72 ff ff ff       	call   100fc8 <lpt_putc_sub>
    else {
        lpt_putc_sub('\b');
        lpt_putc_sub(' ');
        lpt_putc_sub('\b');
    }
}
  101056:	eb 24                	jmp    10107c <lpt_putc+0x3d>
lpt_putc(int c) {
    if (c != '\b') {
        lpt_putc_sub(c);
    }
    else {
        lpt_putc_sub('\b');
  101058:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  10105f:	e8 64 ff ff ff       	call   100fc8 <lpt_putc_sub>
        lpt_putc_sub(' ');
  101064:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  10106b:	e8 58 ff ff ff       	call   100fc8 <lpt_putc_sub>
        lpt_putc_sub('\b');
  101070:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101077:	e8 4c ff ff ff       	call   100fc8 <lpt_putc_sub>
    }
}
  10107c:	90                   	nop
  10107d:	c9                   	leave  
  10107e:	c3                   	ret    

0010107f <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  10107f:	55                   	push   %ebp
  101080:	89 e5                	mov    %esp,%ebp
  101082:	53                   	push   %ebx
  101083:	83 ec 24             	sub    $0x24,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  101086:	8b 45 08             	mov    0x8(%ebp),%eax
  101089:	25 00 ff ff ff       	and    $0xffffff00,%eax
  10108e:	85 c0                	test   %eax,%eax
  101090:	75 07                	jne    101099 <cga_putc+0x1a>
        c |= 0x0700;
  101092:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  101099:	8b 45 08             	mov    0x8(%ebp),%eax
  10109c:	0f b6 c0             	movzbl %al,%eax
  10109f:	83 f8 0a             	cmp    $0xa,%eax
  1010a2:	74 54                	je     1010f8 <cga_putc+0x79>
  1010a4:	83 f8 0d             	cmp    $0xd,%eax
  1010a7:	74 62                	je     10110b <cga_putc+0x8c>
  1010a9:	83 f8 08             	cmp    $0x8,%eax
  1010ac:	0f 85 93 00 00 00    	jne    101145 <cga_putc+0xc6>
    case '\b':
        if (crt_pos > 0) {
  1010b2:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010b9:	85 c0                	test   %eax,%eax
  1010bb:	0f 84 ae 00 00 00    	je     10116f <cga_putc+0xf0>
            crt_pos --;
  1010c1:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010c8:	48                   	dec    %eax
  1010c9:	0f b7 c0             	movzwl %ax,%eax
  1010cc:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  1010d2:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1010d7:	0f b7 15 64 ee 10 00 	movzwl 0x10ee64,%edx
  1010de:	01 d2                	add    %edx,%edx
  1010e0:	01 c2                	add    %eax,%edx
  1010e2:	8b 45 08             	mov    0x8(%ebp),%eax
  1010e5:	98                   	cwtl   
  1010e6:	25 00 ff ff ff       	and    $0xffffff00,%eax
  1010eb:	98                   	cwtl   
  1010ec:	83 c8 20             	or     $0x20,%eax
  1010ef:	98                   	cwtl   
  1010f0:	0f b7 c0             	movzwl %ax,%eax
  1010f3:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  1010f6:	eb 77                	jmp    10116f <cga_putc+0xf0>
    case '\n':
        crt_pos += CRT_COLS;
  1010f8:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010ff:	83 c0 50             	add    $0x50,%eax
  101102:	0f b7 c0             	movzwl %ax,%eax
  101105:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  10110b:	0f b7 1d 64 ee 10 00 	movzwl 0x10ee64,%ebx
  101112:	0f b7 0d 64 ee 10 00 	movzwl 0x10ee64,%ecx
  101119:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  10111e:	89 c8                	mov    %ecx,%eax
  101120:	f7 e2                	mul    %edx
  101122:	c1 ea 06             	shr    $0x6,%edx
  101125:	89 d0                	mov    %edx,%eax
  101127:	c1 e0 02             	shl    $0x2,%eax
  10112a:	01 d0                	add    %edx,%eax
  10112c:	c1 e0 04             	shl    $0x4,%eax
  10112f:	29 c1                	sub    %eax,%ecx
  101131:	89 c8                	mov    %ecx,%eax
  101133:	0f b7 c0             	movzwl %ax,%eax
  101136:	29 c3                	sub    %eax,%ebx
  101138:	89 d8                	mov    %ebx,%eax
  10113a:	0f b7 c0             	movzwl %ax,%eax
  10113d:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
        break;
  101143:	eb 2b                	jmp    101170 <cga_putc+0xf1>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  101145:	8b 0d 60 ee 10 00    	mov    0x10ee60,%ecx
  10114b:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101152:	8d 50 01             	lea    0x1(%eax),%edx
  101155:	0f b7 d2             	movzwl %dx,%edx
  101158:	66 89 15 64 ee 10 00 	mov    %dx,0x10ee64
  10115f:	01 c0                	add    %eax,%eax
  101161:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  101164:	8b 45 08             	mov    0x8(%ebp),%eax
  101167:	0f b7 c0             	movzwl %ax,%eax
  10116a:	66 89 02             	mov    %ax,(%edx)
        break;
  10116d:	eb 01                	jmp    101170 <cga_putc+0xf1>
    case '\b':
        if (crt_pos > 0) {
            crt_pos --;
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
        }
        break;
  10116f:	90                   	nop
        crt_buf[crt_pos ++] = c;     // write the character
        break;
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  101170:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101177:	3d cf 07 00 00       	cmp    $0x7cf,%eax
  10117c:	76 5d                	jbe    1011db <cga_putc+0x15c>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  10117e:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  101183:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  101189:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  10118e:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  101195:	00 
  101196:	89 54 24 04          	mov    %edx,0x4(%esp)
  10119a:	89 04 24             	mov    %eax,(%esp)
  10119d:	e8 cc 1c 00 00       	call   102e6e <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011a2:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  1011a9:	eb 14                	jmp    1011bf <cga_putc+0x140>
            crt_buf[i] = 0x0700 | ' ';
  1011ab:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1011b0:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1011b3:	01 d2                	add    %edx,%edx
  1011b5:	01 d0                	add    %edx,%eax
  1011b7:	66 c7 00 20 07       	movw   $0x720,(%eax)

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011bc:	ff 45 f4             	incl   -0xc(%ebp)
  1011bf:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  1011c6:	7e e3                	jle    1011ab <cga_putc+0x12c>
            crt_buf[i] = 0x0700 | ' ';
        }
        crt_pos -= CRT_COLS;
  1011c8:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011cf:	83 e8 50             	sub    $0x50,%eax
  1011d2:	0f b7 c0             	movzwl %ax,%eax
  1011d5:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  1011db:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  1011e2:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  1011e6:	c6 45 e8 0e          	movb   $0xe,-0x18(%ebp)
  1011ea:	0f b6 45 e8          	movzbl -0x18(%ebp),%eax
  1011ee:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1011f2:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos >> 8);
  1011f3:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011fa:	c1 e8 08             	shr    $0x8,%eax
  1011fd:	0f b7 c0             	movzwl %ax,%eax
  101200:	0f b6 c0             	movzbl %al,%eax
  101203:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  10120a:	42                   	inc    %edx
  10120b:	0f b7 d2             	movzwl %dx,%edx
  10120e:	66 89 55 f0          	mov    %dx,-0x10(%ebp)
  101212:	88 45 e9             	mov    %al,-0x17(%ebp)
  101215:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101219:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10121c:	ee                   	out    %al,(%dx)
    outb(addr_6845, 15);
  10121d:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  101224:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  101228:	c6 45 ea 0f          	movb   $0xf,-0x16(%ebp)
  10122c:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
  101230:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101234:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos);
  101235:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10123c:	0f b6 c0             	movzbl %al,%eax
  10123f:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  101246:	42                   	inc    %edx
  101247:	0f b7 d2             	movzwl %dx,%edx
  10124a:	66 89 55 ec          	mov    %dx,-0x14(%ebp)
  10124e:	88 45 eb             	mov    %al,-0x15(%ebp)
  101251:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
  101255:	8b 55 ec             	mov    -0x14(%ebp),%edx
  101258:	ee                   	out    %al,(%dx)
}
  101259:	90                   	nop
  10125a:	83 c4 24             	add    $0x24,%esp
  10125d:	5b                   	pop    %ebx
  10125e:	5d                   	pop    %ebp
  10125f:	c3                   	ret    

00101260 <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  101260:	55                   	push   %ebp
  101261:	89 e5                	mov    %esp,%ebp
  101263:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101266:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10126d:	eb 08                	jmp    101277 <serial_putc_sub+0x17>
        delay();
  10126f:	e8 4c fb ff ff       	call   100dc0 <delay>
}

static void
serial_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101274:	ff 45 fc             	incl   -0x4(%ebp)
  101277:	66 c7 45 f8 fd 03    	movw   $0x3fd,-0x8(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10127d:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101280:	89 c2                	mov    %eax,%edx
  101282:	ec                   	in     (%dx),%al
  101283:	88 45 f7             	mov    %al,-0x9(%ebp)
    return data;
  101286:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  10128a:	0f b6 c0             	movzbl %al,%eax
  10128d:	83 e0 20             	and    $0x20,%eax
  101290:	85 c0                	test   %eax,%eax
  101292:	75 09                	jne    10129d <serial_putc_sub+0x3d>
  101294:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  10129b:	7e d2                	jle    10126f <serial_putc_sub+0xf>
        delay();
    }
    outb(COM1 + COM_TX, c);
  10129d:	8b 45 08             	mov    0x8(%ebp),%eax
  1012a0:	0f b6 c0             	movzbl %al,%eax
  1012a3:	66 c7 45 fa f8 03    	movw   $0x3f8,-0x6(%ebp)
  1012a9:	88 45 f6             	mov    %al,-0xa(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012ac:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
  1012b0:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1012b4:	ee                   	out    %al,(%dx)
}
  1012b5:	90                   	nop
  1012b6:	c9                   	leave  
  1012b7:	c3                   	ret    

001012b8 <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  1012b8:	55                   	push   %ebp
  1012b9:	89 e5                	mov    %esp,%ebp
  1012bb:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  1012be:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  1012c2:	74 0d                	je     1012d1 <serial_putc+0x19>
        serial_putc_sub(c);
  1012c4:	8b 45 08             	mov    0x8(%ebp),%eax
  1012c7:	89 04 24             	mov    %eax,(%esp)
  1012ca:	e8 91 ff ff ff       	call   101260 <serial_putc_sub>
    else {
        serial_putc_sub('\b');
        serial_putc_sub(' ');
        serial_putc_sub('\b');
    }
}
  1012cf:	eb 24                	jmp    1012f5 <serial_putc+0x3d>
serial_putc(int c) {
    if (c != '\b') {
        serial_putc_sub(c);
    }
    else {
        serial_putc_sub('\b');
  1012d1:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1012d8:	e8 83 ff ff ff       	call   101260 <serial_putc_sub>
        serial_putc_sub(' ');
  1012dd:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1012e4:	e8 77 ff ff ff       	call   101260 <serial_putc_sub>
        serial_putc_sub('\b');
  1012e9:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1012f0:	e8 6b ff ff ff       	call   101260 <serial_putc_sub>
    }
}
  1012f5:	90                   	nop
  1012f6:	c9                   	leave  
  1012f7:	c3                   	ret    

001012f8 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  1012f8:	55                   	push   %ebp
  1012f9:	89 e5                	mov    %esp,%ebp
  1012fb:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  1012fe:	eb 33                	jmp    101333 <cons_intr+0x3b>
        if (c != 0) {
  101300:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  101304:	74 2d                	je     101333 <cons_intr+0x3b>
            cons.buf[cons.wpos ++] = c;
  101306:	a1 84 f0 10 00       	mov    0x10f084,%eax
  10130b:	8d 50 01             	lea    0x1(%eax),%edx
  10130e:	89 15 84 f0 10 00    	mov    %edx,0x10f084
  101314:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101317:	88 90 80 ee 10 00    	mov    %dl,0x10ee80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  10131d:	a1 84 f0 10 00       	mov    0x10f084,%eax
  101322:	3d 00 02 00 00       	cmp    $0x200,%eax
  101327:	75 0a                	jne    101333 <cons_intr+0x3b>
                cons.wpos = 0;
  101329:	c7 05 84 f0 10 00 00 	movl   $0x0,0x10f084
  101330:	00 00 00 
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
    int c;
    while ((c = (*proc)()) != -1) {
  101333:	8b 45 08             	mov    0x8(%ebp),%eax
  101336:	ff d0                	call   *%eax
  101338:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10133b:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  10133f:	75 bf                	jne    101300 <cons_intr+0x8>
            if (cons.wpos == CONSBUFSIZE) {
                cons.wpos = 0;
            }
        }
    }
}
  101341:	90                   	nop
  101342:	c9                   	leave  
  101343:	c3                   	ret    

00101344 <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  101344:	55                   	push   %ebp
  101345:	89 e5                	mov    %esp,%ebp
  101347:	83 ec 10             	sub    $0x10,%esp
  10134a:	66 c7 45 f8 fd 03    	movw   $0x3fd,-0x8(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101350:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101353:	89 c2                	mov    %eax,%edx
  101355:	ec                   	in     (%dx),%al
  101356:	88 45 f7             	mov    %al,-0x9(%ebp)
    return data;
  101359:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  10135d:	0f b6 c0             	movzbl %al,%eax
  101360:	83 e0 01             	and    $0x1,%eax
  101363:	85 c0                	test   %eax,%eax
  101365:	75 07                	jne    10136e <serial_proc_data+0x2a>
        return -1;
  101367:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10136c:	eb 2a                	jmp    101398 <serial_proc_data+0x54>
  10136e:	66 c7 45 fa f8 03    	movw   $0x3f8,-0x6(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101374:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101378:	89 c2                	mov    %eax,%edx
  10137a:	ec                   	in     (%dx),%al
  10137b:	88 45 f6             	mov    %al,-0xa(%ebp)
    return data;
  10137e:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  101382:	0f b6 c0             	movzbl %al,%eax
  101385:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  101388:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  10138c:	75 07                	jne    101395 <serial_proc_data+0x51>
        c = '\b';
  10138e:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  101395:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  101398:	c9                   	leave  
  101399:	c3                   	ret    

0010139a <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  10139a:	55                   	push   %ebp
  10139b:	89 e5                	mov    %esp,%ebp
  10139d:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  1013a0:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  1013a5:	85 c0                	test   %eax,%eax
  1013a7:	74 0c                	je     1013b5 <serial_intr+0x1b>
        cons_intr(serial_proc_data);
  1013a9:	c7 04 24 44 13 10 00 	movl   $0x101344,(%esp)
  1013b0:	e8 43 ff ff ff       	call   1012f8 <cons_intr>
    }
}
  1013b5:	90                   	nop
  1013b6:	c9                   	leave  
  1013b7:	c3                   	ret    

001013b8 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  1013b8:	55                   	push   %ebp
  1013b9:	89 e5                	mov    %esp,%ebp
  1013bb:	83 ec 28             	sub    $0x28,%esp
  1013be:	66 c7 45 ec 64 00    	movw   $0x64,-0x14(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013c4:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1013c7:	89 c2                	mov    %eax,%edx
  1013c9:	ec                   	in     (%dx),%al
  1013ca:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  1013cd:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  1013d1:	0f b6 c0             	movzbl %al,%eax
  1013d4:	83 e0 01             	and    $0x1,%eax
  1013d7:	85 c0                	test   %eax,%eax
  1013d9:	75 0a                	jne    1013e5 <kbd_proc_data+0x2d>
        return -1;
  1013db:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1013e0:	e9 56 01 00 00       	jmp    10153b <kbd_proc_data+0x183>
  1013e5:	66 c7 45 f0 60 00    	movw   $0x60,-0x10(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013eb:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1013ee:	89 c2                	mov    %eax,%edx
  1013f0:	ec                   	in     (%dx),%al
  1013f1:	88 45 ea             	mov    %al,-0x16(%ebp)
    return data;
  1013f4:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
    }

    data = inb(KBDATAP);
  1013f8:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  1013fb:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  1013ff:	75 17                	jne    101418 <kbd_proc_data+0x60>
        // E0 escape character
        shift |= E0ESC;
  101401:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101406:	83 c8 40             	or     $0x40,%eax
  101409:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  10140e:	b8 00 00 00 00       	mov    $0x0,%eax
  101413:	e9 23 01 00 00       	jmp    10153b <kbd_proc_data+0x183>
    } else if (data & 0x80) {
  101418:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10141c:	84 c0                	test   %al,%al
  10141e:	79 45                	jns    101465 <kbd_proc_data+0xad>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  101420:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101425:	83 e0 40             	and    $0x40,%eax
  101428:	85 c0                	test   %eax,%eax
  10142a:	75 08                	jne    101434 <kbd_proc_data+0x7c>
  10142c:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101430:	24 7f                	and    $0x7f,%al
  101432:	eb 04                	jmp    101438 <kbd_proc_data+0x80>
  101434:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101438:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  10143b:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10143f:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  101446:	0c 40                	or     $0x40,%al
  101448:	0f b6 c0             	movzbl %al,%eax
  10144b:	f7 d0                	not    %eax
  10144d:	89 c2                	mov    %eax,%edx
  10144f:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101454:	21 d0                	and    %edx,%eax
  101456:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  10145b:	b8 00 00 00 00       	mov    $0x0,%eax
  101460:	e9 d6 00 00 00       	jmp    10153b <kbd_proc_data+0x183>
    } else if (shift & E0ESC) {
  101465:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10146a:	83 e0 40             	and    $0x40,%eax
  10146d:	85 c0                	test   %eax,%eax
  10146f:	74 11                	je     101482 <kbd_proc_data+0xca>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  101471:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  101475:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10147a:	83 e0 bf             	and    $0xffffffbf,%eax
  10147d:	a3 88 f0 10 00       	mov    %eax,0x10f088
    }

    shift |= shiftcode[data];
  101482:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101486:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  10148d:	0f b6 d0             	movzbl %al,%edx
  101490:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101495:	09 d0                	or     %edx,%eax
  101497:	a3 88 f0 10 00       	mov    %eax,0x10f088
    shift ^= togglecode[data];
  10149c:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014a0:	0f b6 80 40 e1 10 00 	movzbl 0x10e140(%eax),%eax
  1014a7:	0f b6 d0             	movzbl %al,%edx
  1014aa:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014af:	31 d0                	xor    %edx,%eax
  1014b1:	a3 88 f0 10 00       	mov    %eax,0x10f088

    c = charcode[shift & (CTL | SHIFT)][data];
  1014b6:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014bb:	83 e0 03             	and    $0x3,%eax
  1014be:	8b 14 85 40 e5 10 00 	mov    0x10e540(,%eax,4),%edx
  1014c5:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014c9:	01 d0                	add    %edx,%eax
  1014cb:	0f b6 00             	movzbl (%eax),%eax
  1014ce:	0f b6 c0             	movzbl %al,%eax
  1014d1:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  1014d4:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014d9:	83 e0 08             	and    $0x8,%eax
  1014dc:	85 c0                	test   %eax,%eax
  1014de:	74 22                	je     101502 <kbd_proc_data+0x14a>
        if ('a' <= c && c <= 'z')
  1014e0:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  1014e4:	7e 0c                	jle    1014f2 <kbd_proc_data+0x13a>
  1014e6:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  1014ea:	7f 06                	jg     1014f2 <kbd_proc_data+0x13a>
            c += 'A' - 'a';
  1014ec:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  1014f0:	eb 10                	jmp    101502 <kbd_proc_data+0x14a>
        else if ('A' <= c && c <= 'Z')
  1014f2:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  1014f6:	7e 0a                	jle    101502 <kbd_proc_data+0x14a>
  1014f8:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  1014fc:	7f 04                	jg     101502 <kbd_proc_data+0x14a>
            c += 'a' - 'A';
  1014fe:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  101502:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101507:	f7 d0                	not    %eax
  101509:	83 e0 06             	and    $0x6,%eax
  10150c:	85 c0                	test   %eax,%eax
  10150e:	75 28                	jne    101538 <kbd_proc_data+0x180>
  101510:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  101517:	75 1f                	jne    101538 <kbd_proc_data+0x180>
        cprintf("Rebooting!\n");
  101519:	c7 04 24 81 39 10 00 	movl   $0x103981,(%esp)
  101520:	e8 46 ed ff ff       	call   10026b <cprintf>
  101525:	66 c7 45 ee 92 00    	movw   $0x92,-0x12(%ebp)
  10152b:	c6 45 e9 03          	movb   $0x3,-0x17(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10152f:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101533:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101537:	ee                   	out    %al,(%dx)
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  101538:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10153b:	c9                   	leave  
  10153c:	c3                   	ret    

0010153d <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  10153d:	55                   	push   %ebp
  10153e:	89 e5                	mov    %esp,%ebp
  101540:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  101543:	c7 04 24 b8 13 10 00 	movl   $0x1013b8,(%esp)
  10154a:	e8 a9 fd ff ff       	call   1012f8 <cons_intr>
}
  10154f:	90                   	nop
  101550:	c9                   	leave  
  101551:	c3                   	ret    

00101552 <kbd_init>:

static void
kbd_init(void) {
  101552:	55                   	push   %ebp
  101553:	89 e5                	mov    %esp,%ebp
  101555:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  101558:	e8 e0 ff ff ff       	call   10153d <kbd_intr>
    pic_enable(IRQ_KBD);
  10155d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  101564:	e8 0e 01 00 00       	call   101677 <pic_enable>
}
  101569:	90                   	nop
  10156a:	c9                   	leave  
  10156b:	c3                   	ret    

0010156c <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  10156c:	55                   	push   %ebp
  10156d:	89 e5                	mov    %esp,%ebp
  10156f:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  101572:	e8 90 f8 ff ff       	call   100e07 <cga_init>
    serial_init();
  101577:	e8 6d f9 ff ff       	call   100ee9 <serial_init>
    kbd_init();
  10157c:	e8 d1 ff ff ff       	call   101552 <kbd_init>
    if (!serial_exists) {
  101581:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  101586:	85 c0                	test   %eax,%eax
  101588:	75 0c                	jne    101596 <cons_init+0x2a>
        cprintf("serial port does not exist!!\n");
  10158a:	c7 04 24 8d 39 10 00 	movl   $0x10398d,(%esp)
  101591:	e8 d5 ec ff ff       	call   10026b <cprintf>
    }
}
  101596:	90                   	nop
  101597:	c9                   	leave  
  101598:	c3                   	ret    

00101599 <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  101599:	55                   	push   %ebp
  10159a:	89 e5                	mov    %esp,%ebp
  10159c:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  10159f:	8b 45 08             	mov    0x8(%ebp),%eax
  1015a2:	89 04 24             	mov    %eax,(%esp)
  1015a5:	e8 95 fa ff ff       	call   10103f <lpt_putc>
    cga_putc(c);
  1015aa:	8b 45 08             	mov    0x8(%ebp),%eax
  1015ad:	89 04 24             	mov    %eax,(%esp)
  1015b0:	e8 ca fa ff ff       	call   10107f <cga_putc>
    serial_putc(c);
  1015b5:	8b 45 08             	mov    0x8(%ebp),%eax
  1015b8:	89 04 24             	mov    %eax,(%esp)
  1015bb:	e8 f8 fc ff ff       	call   1012b8 <serial_putc>
}
  1015c0:	90                   	nop
  1015c1:	c9                   	leave  
  1015c2:	c3                   	ret    

001015c3 <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  1015c3:	55                   	push   %ebp
  1015c4:	89 e5                	mov    %esp,%ebp
  1015c6:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  1015c9:	e8 cc fd ff ff       	call   10139a <serial_intr>
    kbd_intr();
  1015ce:	e8 6a ff ff ff       	call   10153d <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1015d3:	8b 15 80 f0 10 00    	mov    0x10f080,%edx
  1015d9:	a1 84 f0 10 00       	mov    0x10f084,%eax
  1015de:	39 c2                	cmp    %eax,%edx
  1015e0:	74 36                	je     101618 <cons_getc+0x55>
        c = cons.buf[cons.rpos ++];
  1015e2:	a1 80 f0 10 00       	mov    0x10f080,%eax
  1015e7:	8d 50 01             	lea    0x1(%eax),%edx
  1015ea:	89 15 80 f0 10 00    	mov    %edx,0x10f080
  1015f0:	0f b6 80 80 ee 10 00 	movzbl 0x10ee80(%eax),%eax
  1015f7:	0f b6 c0             	movzbl %al,%eax
  1015fa:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  1015fd:	a1 80 f0 10 00       	mov    0x10f080,%eax
  101602:	3d 00 02 00 00       	cmp    $0x200,%eax
  101607:	75 0a                	jne    101613 <cons_getc+0x50>
            cons.rpos = 0;
  101609:	c7 05 80 f0 10 00 00 	movl   $0x0,0x10f080
  101610:	00 00 00 
        }
        return c;
  101613:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101616:	eb 05                	jmp    10161d <cons_getc+0x5a>
    }
    return 0;
  101618:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10161d:	c9                   	leave  
  10161e:	c3                   	ret    

0010161f <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  10161f:	55                   	push   %ebp
  101620:	89 e5                	mov    %esp,%ebp
  101622:	83 ec 14             	sub    $0x14,%esp
  101625:	8b 45 08             	mov    0x8(%ebp),%eax
  101628:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  10162c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10162f:	66 a3 50 e5 10 00    	mov    %ax,0x10e550
    if (did_init) {
  101635:	a1 8c f0 10 00       	mov    0x10f08c,%eax
  10163a:	85 c0                	test   %eax,%eax
  10163c:	74 36                	je     101674 <pic_setmask+0x55>
        outb(IO_PIC1 + 1, mask);
  10163e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101641:	0f b6 c0             	movzbl %al,%eax
  101644:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  10164a:	88 45 fa             	mov    %al,-0x6(%ebp)
  10164d:	0f b6 45 fa          	movzbl -0x6(%ebp),%eax
  101651:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  101655:	ee                   	out    %al,(%dx)
        outb(IO_PIC2 + 1, mask >> 8);
  101656:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  10165a:	c1 e8 08             	shr    $0x8,%eax
  10165d:	0f b7 c0             	movzwl %ax,%eax
  101660:	0f b6 c0             	movzbl %al,%eax
  101663:	66 c7 45 fc a1 00    	movw   $0xa1,-0x4(%ebp)
  101669:	88 45 fb             	mov    %al,-0x5(%ebp)
  10166c:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
  101670:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101673:	ee                   	out    %al,(%dx)
    }
}
  101674:	90                   	nop
  101675:	c9                   	leave  
  101676:	c3                   	ret    

00101677 <pic_enable>:

void
pic_enable(unsigned int irq) {
  101677:	55                   	push   %ebp
  101678:	89 e5                	mov    %esp,%ebp
  10167a:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  10167d:	8b 45 08             	mov    0x8(%ebp),%eax
  101680:	ba 01 00 00 00       	mov    $0x1,%edx
  101685:	88 c1                	mov    %al,%cl
  101687:	d3 e2                	shl    %cl,%edx
  101689:	89 d0                	mov    %edx,%eax
  10168b:	98                   	cwtl   
  10168c:	f7 d0                	not    %eax
  10168e:	0f bf d0             	movswl %ax,%edx
  101691:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  101698:	98                   	cwtl   
  101699:	21 d0                	and    %edx,%eax
  10169b:	98                   	cwtl   
  10169c:	0f b7 c0             	movzwl %ax,%eax
  10169f:	89 04 24             	mov    %eax,(%esp)
  1016a2:	e8 78 ff ff ff       	call   10161f <pic_setmask>
}
  1016a7:	90                   	nop
  1016a8:	c9                   	leave  
  1016a9:	c3                   	ret    

001016aa <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  1016aa:	55                   	push   %ebp
  1016ab:	89 e5                	mov    %esp,%ebp
  1016ad:	83 ec 34             	sub    $0x34,%esp
    did_init = 1;
  1016b0:	c7 05 8c f0 10 00 01 	movl   $0x1,0x10f08c
  1016b7:	00 00 00 
  1016ba:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  1016c0:	c6 45 d6 ff          	movb   $0xff,-0x2a(%ebp)
  1016c4:	0f b6 45 d6          	movzbl -0x2a(%ebp),%eax
  1016c8:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1016cc:	ee                   	out    %al,(%dx)
  1016cd:	66 c7 45 fc a1 00    	movw   $0xa1,-0x4(%ebp)
  1016d3:	c6 45 d7 ff          	movb   $0xff,-0x29(%ebp)
  1016d7:	0f b6 45 d7          	movzbl -0x29(%ebp),%eax
  1016db:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1016de:	ee                   	out    %al,(%dx)
  1016df:	66 c7 45 fa 20 00    	movw   $0x20,-0x6(%ebp)
  1016e5:	c6 45 d8 11          	movb   $0x11,-0x28(%ebp)
  1016e9:	0f b6 45 d8          	movzbl -0x28(%ebp),%eax
  1016ed:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1016f1:	ee                   	out    %al,(%dx)
  1016f2:	66 c7 45 f8 21 00    	movw   $0x21,-0x8(%ebp)
  1016f8:	c6 45 d9 20          	movb   $0x20,-0x27(%ebp)
  1016fc:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  101700:	8b 55 f8             	mov    -0x8(%ebp),%edx
  101703:	ee                   	out    %al,(%dx)
  101704:	66 c7 45 f6 21 00    	movw   $0x21,-0xa(%ebp)
  10170a:	c6 45 da 04          	movb   $0x4,-0x26(%ebp)
  10170e:	0f b6 45 da          	movzbl -0x26(%ebp),%eax
  101712:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101716:	ee                   	out    %al,(%dx)
  101717:	66 c7 45 f4 21 00    	movw   $0x21,-0xc(%ebp)
  10171d:	c6 45 db 03          	movb   $0x3,-0x25(%ebp)
  101721:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  101725:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101728:	ee                   	out    %al,(%dx)
  101729:	66 c7 45 f2 a0 00    	movw   $0xa0,-0xe(%ebp)
  10172f:	c6 45 dc 11          	movb   $0x11,-0x24(%ebp)
  101733:	0f b6 45 dc          	movzbl -0x24(%ebp),%eax
  101737:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10173b:	ee                   	out    %al,(%dx)
  10173c:	66 c7 45 f0 a1 00    	movw   $0xa1,-0x10(%ebp)
  101742:	c6 45 dd 28          	movb   $0x28,-0x23(%ebp)
  101746:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  10174a:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10174d:	ee                   	out    %al,(%dx)
  10174e:	66 c7 45 ee a1 00    	movw   $0xa1,-0x12(%ebp)
  101754:	c6 45 de 02          	movb   $0x2,-0x22(%ebp)
  101758:	0f b6 45 de          	movzbl -0x22(%ebp),%eax
  10175c:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101760:	ee                   	out    %al,(%dx)
  101761:	66 c7 45 ec a1 00    	movw   $0xa1,-0x14(%ebp)
  101767:	c6 45 df 03          	movb   $0x3,-0x21(%ebp)
  10176b:	0f b6 45 df          	movzbl -0x21(%ebp),%eax
  10176f:	8b 55 ec             	mov    -0x14(%ebp),%edx
  101772:	ee                   	out    %al,(%dx)
  101773:	66 c7 45 ea 20 00    	movw   $0x20,-0x16(%ebp)
  101779:	c6 45 e0 68          	movb   $0x68,-0x20(%ebp)
  10177d:	0f b6 45 e0          	movzbl -0x20(%ebp),%eax
  101781:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101785:	ee                   	out    %al,(%dx)
  101786:	66 c7 45 e8 20 00    	movw   $0x20,-0x18(%ebp)
  10178c:	c6 45 e1 0a          	movb   $0xa,-0x1f(%ebp)
  101790:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  101794:	8b 55 e8             	mov    -0x18(%ebp),%edx
  101797:	ee                   	out    %al,(%dx)
  101798:	66 c7 45 e6 a0 00    	movw   $0xa0,-0x1a(%ebp)
  10179e:	c6 45 e2 68          	movb   $0x68,-0x1e(%ebp)
  1017a2:	0f b6 45 e2          	movzbl -0x1e(%ebp),%eax
  1017a6:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  1017aa:	ee                   	out    %al,(%dx)
  1017ab:	66 c7 45 e4 a0 00    	movw   $0xa0,-0x1c(%ebp)
  1017b1:	c6 45 e3 0a          	movb   $0xa,-0x1d(%ebp)
  1017b5:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
  1017b9:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1017bc:	ee                   	out    %al,(%dx)
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  1017bd:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017c4:	3d ff ff 00 00       	cmp    $0xffff,%eax
  1017c9:	74 0f                	je     1017da <pic_init+0x130>
        pic_setmask(irq_mask);
  1017cb:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017d2:	89 04 24             	mov    %eax,(%esp)
  1017d5:	e8 45 fe ff ff       	call   10161f <pic_setmask>
    }
}
  1017da:	90                   	nop
  1017db:	c9                   	leave  
  1017dc:	c3                   	ret    

001017dd <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  1017dd:	55                   	push   %ebp
  1017de:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  1017e0:	fb                   	sti    
    sti();
}
  1017e1:	90                   	nop
  1017e2:	5d                   	pop    %ebp
  1017e3:	c3                   	ret    

001017e4 <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  1017e4:	55                   	push   %ebp
  1017e5:	89 e5                	mov    %esp,%ebp
}

static inline void
cli(void) {
    asm volatile ("cli");
  1017e7:	fa                   	cli    
    cli();
}
  1017e8:	90                   	nop
  1017e9:	5d                   	pop    %ebp
  1017ea:	c3                   	ret    

001017eb <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  1017eb:	55                   	push   %ebp
  1017ec:	89 e5                	mov    %esp,%ebp
  1017ee:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  1017f1:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  1017f8:	00 
  1017f9:	c7 04 24 c0 39 10 00 	movl   $0x1039c0,(%esp)
  101800:	e8 66 ea ff ff       	call   10026b <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
  101805:	c7 04 24 ca 39 10 00 	movl   $0x1039ca,(%esp)
  10180c:	e8 5a ea ff ff       	call   10026b <cprintf>
    panic("EOT: kernel seems ok.");
  101811:	c7 44 24 08 d8 39 10 	movl   $0x1039d8,0x8(%esp)
  101818:	00 
  101819:	c7 44 24 04 12 00 00 	movl   $0x12,0x4(%esp)
  101820:	00 
  101821:	c7 04 24 ee 39 10 00 	movl   $0x1039ee,(%esp)
  101828:	e8 95 eb ff ff       	call   1003c2 <__panic>

0010182d <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  10182d:	55                   	push   %ebp
  10182e:	89 e5                	mov    %esp,%ebp
  101830:	83 ec 10             	sub    $0x10,%esp
      * (3) After setup the contents of IDT, you will let CPU know where is the IDT by using 'lidt' instruction.
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
      extern uintptr_t __vectors[];
      for(int i=0;i<256;i++){
  101833:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10183a:	e9 c4 00 00 00       	jmp    101903 <idt_init+0xd6>
      SETGATE(idt[i],0,KERNEL_CS,__vectors[i],DPL_KERNEL);
  10183f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101842:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  101849:	0f b7 d0             	movzwl %ax,%edx
  10184c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10184f:	66 89 14 c5 a0 f0 10 	mov    %dx,0x10f0a0(,%eax,8)
  101856:	00 
  101857:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10185a:	66 c7 04 c5 a2 f0 10 	movw   $0x8,0x10f0a2(,%eax,8)
  101861:	00 08 00 
  101864:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101867:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  10186e:	00 
  10186f:	80 e2 e0             	and    $0xe0,%dl
  101872:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  101879:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10187c:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  101883:	00 
  101884:	80 e2 1f             	and    $0x1f,%dl
  101887:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  10188e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101891:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  101898:	00 
  101899:	80 e2 f0             	and    $0xf0,%dl
  10189c:	80 ca 0e             	or     $0xe,%dl
  10189f:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018a6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018a9:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018b0:	00 
  1018b1:	80 e2 ef             	and    $0xef,%dl
  1018b4:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018bb:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018be:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018c5:	00 
  1018c6:	80 e2 9f             	and    $0x9f,%dl
  1018c9:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018d3:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018da:	00 
  1018db:	80 ca 80             	or     $0x80,%dl
  1018de:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018e8:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  1018ef:	c1 e8 10             	shr    $0x10,%eax
  1018f2:	0f b7 d0             	movzwl %ax,%edx
  1018f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018f8:	66 89 14 c5 a6 f0 10 	mov    %dx,0x10f0a6(,%eax,8)
  1018ff:	00 
      * (3) After setup the contents of IDT, you will let CPU know where is the IDT by using 'lidt' instruction.
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
      extern uintptr_t __vectors[];
      for(int i=0;i<256;i++){
  101900:	ff 45 fc             	incl   -0x4(%ebp)
  101903:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
  10190a:	0f 8e 2f ff ff ff    	jle    10183f <idt_init+0x12>
      SETGATE(idt[i],0,KERNEL_CS,__vectors[i],DPL_KERNEL);
      }
      SETGATE(idt[T_SWITCH_TOK],1,KERNEL_CS,__vectors[T_SWITCH_TOK],DPL_USER);
  101910:	a1 c4 e7 10 00       	mov    0x10e7c4,%eax
  101915:	0f b7 c0             	movzwl %ax,%eax
  101918:	66 a3 68 f4 10 00    	mov    %ax,0x10f468
  10191e:	66 c7 05 6a f4 10 00 	movw   $0x8,0x10f46a
  101925:	08 00 
  101927:	0f b6 05 6c f4 10 00 	movzbl 0x10f46c,%eax
  10192e:	24 e0                	and    $0xe0,%al
  101930:	a2 6c f4 10 00       	mov    %al,0x10f46c
  101935:	0f b6 05 6c f4 10 00 	movzbl 0x10f46c,%eax
  10193c:	24 1f                	and    $0x1f,%al
  10193e:	a2 6c f4 10 00       	mov    %al,0x10f46c
  101943:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  10194a:	0c 0f                	or     $0xf,%al
  10194c:	a2 6d f4 10 00       	mov    %al,0x10f46d
  101951:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  101958:	24 ef                	and    $0xef,%al
  10195a:	a2 6d f4 10 00       	mov    %al,0x10f46d
  10195f:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  101966:	0c 60                	or     $0x60,%al
  101968:	a2 6d f4 10 00       	mov    %al,0x10f46d
  10196d:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  101974:	0c 80                	or     $0x80,%al
  101976:	a2 6d f4 10 00       	mov    %al,0x10f46d
  10197b:	a1 c4 e7 10 00       	mov    0x10e7c4,%eax
  101980:	c1 e8 10             	shr    $0x10,%eax
  101983:	0f b7 c0             	movzwl %ax,%eax
  101986:	66 a3 6e f4 10 00    	mov    %ax,0x10f46e
  10198c:	c7 45 f8 60 e5 10 00 	movl   $0x10e560,-0x8(%ebp)
    return ebp;
}

static inline void
lidt(struct pseudodesc *pd) {
    asm volatile ("lidt (%0)" :: "r" (pd));
  101993:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101996:	0f 01 18             	lidtl  (%eax)
      lidt(&idt_pd);
      
      
}
  101999:	90                   	nop
  10199a:	c9                   	leave  
  10199b:	c3                   	ret    

0010199c <trapname>:

static const char *
trapname(int trapno) {
  10199c:	55                   	push   %ebp
  10199d:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  10199f:	8b 45 08             	mov    0x8(%ebp),%eax
  1019a2:	83 f8 13             	cmp    $0x13,%eax
  1019a5:	77 0c                	ja     1019b3 <trapname+0x17>
        return excnames[trapno];
  1019a7:	8b 45 08             	mov    0x8(%ebp),%eax
  1019aa:	8b 04 85 40 3d 10 00 	mov    0x103d40(,%eax,4),%eax
  1019b1:	eb 18                	jmp    1019cb <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  1019b3:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  1019b7:	7e 0d                	jle    1019c6 <trapname+0x2a>
  1019b9:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  1019bd:	7f 07                	jg     1019c6 <trapname+0x2a>
        return "Hardware Interrupt";
  1019bf:	b8 ff 39 10 00       	mov    $0x1039ff,%eax
  1019c4:	eb 05                	jmp    1019cb <trapname+0x2f>
    }
    return "(unknown trap)";
  1019c6:	b8 12 3a 10 00       	mov    $0x103a12,%eax
}
  1019cb:	5d                   	pop    %ebp
  1019cc:	c3                   	ret    

001019cd <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  1019cd:	55                   	push   %ebp
  1019ce:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  1019d0:	8b 45 08             	mov    0x8(%ebp),%eax
  1019d3:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  1019d7:	83 f8 08             	cmp    $0x8,%eax
  1019da:	0f 94 c0             	sete   %al
  1019dd:	0f b6 c0             	movzbl %al,%eax
}
  1019e0:	5d                   	pop    %ebp
  1019e1:	c3                   	ret    

001019e2 <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  1019e2:	55                   	push   %ebp
  1019e3:	89 e5                	mov    %esp,%ebp
  1019e5:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  1019e8:	8b 45 08             	mov    0x8(%ebp),%eax
  1019eb:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019ef:	c7 04 24 53 3a 10 00 	movl   $0x103a53,(%esp)
  1019f6:	e8 70 e8 ff ff       	call   10026b <cprintf>
    print_regs(&tf->tf_regs);
  1019fb:	8b 45 08             	mov    0x8(%ebp),%eax
  1019fe:	89 04 24             	mov    %eax,(%esp)
  101a01:	e8 91 01 00 00       	call   101b97 <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101a06:	8b 45 08             	mov    0x8(%ebp),%eax
  101a09:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  101a0d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a11:	c7 04 24 64 3a 10 00 	movl   $0x103a64,(%esp)
  101a18:	e8 4e e8 ff ff       	call   10026b <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101a1d:	8b 45 08             	mov    0x8(%ebp),%eax
  101a20:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101a24:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a28:	c7 04 24 77 3a 10 00 	movl   $0x103a77,(%esp)
  101a2f:	e8 37 e8 ff ff       	call   10026b <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101a34:	8b 45 08             	mov    0x8(%ebp),%eax
  101a37:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101a3b:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a3f:	c7 04 24 8a 3a 10 00 	movl   $0x103a8a,(%esp)
  101a46:	e8 20 e8 ff ff       	call   10026b <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101a4b:	8b 45 08             	mov    0x8(%ebp),%eax
  101a4e:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101a52:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a56:	c7 04 24 9d 3a 10 00 	movl   $0x103a9d,(%esp)
  101a5d:	e8 09 e8 ff ff       	call   10026b <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101a62:	8b 45 08             	mov    0x8(%ebp),%eax
  101a65:	8b 40 30             	mov    0x30(%eax),%eax
  101a68:	89 04 24             	mov    %eax,(%esp)
  101a6b:	e8 2c ff ff ff       	call   10199c <trapname>
  101a70:	89 c2                	mov    %eax,%edx
  101a72:	8b 45 08             	mov    0x8(%ebp),%eax
  101a75:	8b 40 30             	mov    0x30(%eax),%eax
  101a78:	89 54 24 08          	mov    %edx,0x8(%esp)
  101a7c:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a80:	c7 04 24 b0 3a 10 00 	movl   $0x103ab0,(%esp)
  101a87:	e8 df e7 ff ff       	call   10026b <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  101a8c:	8b 45 08             	mov    0x8(%ebp),%eax
  101a8f:	8b 40 34             	mov    0x34(%eax),%eax
  101a92:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a96:	c7 04 24 c2 3a 10 00 	movl   $0x103ac2,(%esp)
  101a9d:	e8 c9 e7 ff ff       	call   10026b <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101aa2:	8b 45 08             	mov    0x8(%ebp),%eax
  101aa5:	8b 40 38             	mov    0x38(%eax),%eax
  101aa8:	89 44 24 04          	mov    %eax,0x4(%esp)
  101aac:	c7 04 24 d1 3a 10 00 	movl   $0x103ad1,(%esp)
  101ab3:	e8 b3 e7 ff ff       	call   10026b <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101ab8:	8b 45 08             	mov    0x8(%ebp),%eax
  101abb:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101abf:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ac3:	c7 04 24 e0 3a 10 00 	movl   $0x103ae0,(%esp)
  101aca:	e8 9c e7 ff ff       	call   10026b <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101acf:	8b 45 08             	mov    0x8(%ebp),%eax
  101ad2:	8b 40 40             	mov    0x40(%eax),%eax
  101ad5:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ad9:	c7 04 24 f3 3a 10 00 	movl   $0x103af3,(%esp)
  101ae0:	e8 86 e7 ff ff       	call   10026b <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101ae5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101aec:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101af3:	eb 3d                	jmp    101b32 <print_trapframe+0x150>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101af5:	8b 45 08             	mov    0x8(%ebp),%eax
  101af8:	8b 50 40             	mov    0x40(%eax),%edx
  101afb:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101afe:	21 d0                	and    %edx,%eax
  101b00:	85 c0                	test   %eax,%eax
  101b02:	74 28                	je     101b2c <print_trapframe+0x14a>
  101b04:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b07:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101b0e:	85 c0                	test   %eax,%eax
  101b10:	74 1a                	je     101b2c <print_trapframe+0x14a>
            cprintf("%s,", IA32flags[i]);
  101b12:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b15:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101b1c:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b20:	c7 04 24 02 3b 10 00 	movl   $0x103b02,(%esp)
  101b27:	e8 3f e7 ff ff       	call   10026b <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
    cprintf("  flag 0x%08x ", tf->tf_eflags);

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101b2c:	ff 45 f4             	incl   -0xc(%ebp)
  101b2f:	d1 65 f0             	shll   -0x10(%ebp)
  101b32:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b35:	83 f8 17             	cmp    $0x17,%eax
  101b38:	76 bb                	jbe    101af5 <print_trapframe+0x113>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
            cprintf("%s,", IA32flags[i]);
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101b3a:	8b 45 08             	mov    0x8(%ebp),%eax
  101b3d:	8b 40 40             	mov    0x40(%eax),%eax
  101b40:	25 00 30 00 00       	and    $0x3000,%eax
  101b45:	c1 e8 0c             	shr    $0xc,%eax
  101b48:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b4c:	c7 04 24 06 3b 10 00 	movl   $0x103b06,(%esp)
  101b53:	e8 13 e7 ff ff       	call   10026b <cprintf>

    if (!trap_in_kernel(tf)) {
  101b58:	8b 45 08             	mov    0x8(%ebp),%eax
  101b5b:	89 04 24             	mov    %eax,(%esp)
  101b5e:	e8 6a fe ff ff       	call   1019cd <trap_in_kernel>
  101b63:	85 c0                	test   %eax,%eax
  101b65:	75 2d                	jne    101b94 <print_trapframe+0x1b2>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101b67:	8b 45 08             	mov    0x8(%ebp),%eax
  101b6a:	8b 40 44             	mov    0x44(%eax),%eax
  101b6d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b71:	c7 04 24 0f 3b 10 00 	movl   $0x103b0f,(%esp)
  101b78:	e8 ee e6 ff ff       	call   10026b <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101b7d:	8b 45 08             	mov    0x8(%ebp),%eax
  101b80:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101b84:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b88:	c7 04 24 1e 3b 10 00 	movl   $0x103b1e,(%esp)
  101b8f:	e8 d7 e6 ff ff       	call   10026b <cprintf>
    }
}
  101b94:	90                   	nop
  101b95:	c9                   	leave  
  101b96:	c3                   	ret    

00101b97 <print_regs>:

void
print_regs(struct pushregs *regs) {
  101b97:	55                   	push   %ebp
  101b98:	89 e5                	mov    %esp,%ebp
  101b9a:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101b9d:	8b 45 08             	mov    0x8(%ebp),%eax
  101ba0:	8b 00                	mov    (%eax),%eax
  101ba2:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ba6:	c7 04 24 31 3b 10 00 	movl   $0x103b31,(%esp)
  101bad:	e8 b9 e6 ff ff       	call   10026b <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101bb2:	8b 45 08             	mov    0x8(%ebp),%eax
  101bb5:	8b 40 04             	mov    0x4(%eax),%eax
  101bb8:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bbc:	c7 04 24 40 3b 10 00 	movl   $0x103b40,(%esp)
  101bc3:	e8 a3 e6 ff ff       	call   10026b <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101bc8:	8b 45 08             	mov    0x8(%ebp),%eax
  101bcb:	8b 40 08             	mov    0x8(%eax),%eax
  101bce:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bd2:	c7 04 24 4f 3b 10 00 	movl   $0x103b4f,(%esp)
  101bd9:	e8 8d e6 ff ff       	call   10026b <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101bde:	8b 45 08             	mov    0x8(%ebp),%eax
  101be1:	8b 40 0c             	mov    0xc(%eax),%eax
  101be4:	89 44 24 04          	mov    %eax,0x4(%esp)
  101be8:	c7 04 24 5e 3b 10 00 	movl   $0x103b5e,(%esp)
  101bef:	e8 77 e6 ff ff       	call   10026b <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101bf4:	8b 45 08             	mov    0x8(%ebp),%eax
  101bf7:	8b 40 10             	mov    0x10(%eax),%eax
  101bfa:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bfe:	c7 04 24 6d 3b 10 00 	movl   $0x103b6d,(%esp)
  101c05:	e8 61 e6 ff ff       	call   10026b <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101c0a:	8b 45 08             	mov    0x8(%ebp),%eax
  101c0d:	8b 40 14             	mov    0x14(%eax),%eax
  101c10:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c14:	c7 04 24 7c 3b 10 00 	movl   $0x103b7c,(%esp)
  101c1b:	e8 4b e6 ff ff       	call   10026b <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101c20:	8b 45 08             	mov    0x8(%ebp),%eax
  101c23:	8b 40 18             	mov    0x18(%eax),%eax
  101c26:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c2a:	c7 04 24 8b 3b 10 00 	movl   $0x103b8b,(%esp)
  101c31:	e8 35 e6 ff ff       	call   10026b <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101c36:	8b 45 08             	mov    0x8(%ebp),%eax
  101c39:	8b 40 1c             	mov    0x1c(%eax),%eax
  101c3c:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c40:	c7 04 24 9a 3b 10 00 	movl   $0x103b9a,(%esp)
  101c47:	e8 1f e6 ff ff       	call   10026b <cprintf>
}
  101c4c:	90                   	nop
  101c4d:	c9                   	leave  
  101c4e:	c3                   	ret    

00101c4f <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101c4f:	55                   	push   %ebp
  101c50:	89 e5                	mov    %esp,%ebp
  101c52:	83 ec 28             	sub    $0x28,%esp
    char c;

    switch (tf->tf_trapno) {
  101c55:	8b 45 08             	mov    0x8(%ebp),%eax
  101c58:	8b 40 30             	mov    0x30(%eax),%eax
  101c5b:	83 f8 2f             	cmp    $0x2f,%eax
  101c5e:	77 21                	ja     101c81 <trap_dispatch+0x32>
  101c60:	83 f8 2e             	cmp    $0x2e,%eax
  101c63:	0f 83 b3 02 00 00    	jae    101f1c <trap_dispatch+0x2cd>
  101c69:	83 f8 21             	cmp    $0x21,%eax
  101c6c:	0f 84 9f 00 00 00    	je     101d11 <trap_dispatch+0xc2>
  101c72:	83 f8 24             	cmp    $0x24,%eax
  101c75:	74 71                	je     101ce8 <trap_dispatch+0x99>
  101c77:	83 f8 20             	cmp    $0x20,%eax
  101c7a:	74 1c                	je     101c98 <trap_dispatch+0x49>
  101c7c:	e9 66 02 00 00       	jmp    101ee7 <trap_dispatch+0x298>
  101c81:	83 f8 78             	cmp    $0x78,%eax
  101c84:	0f 84 94 01 00 00    	je     101e1e <trap_dispatch+0x1cf>
  101c8a:	83 f8 79             	cmp    $0x79,%eax
  101c8d:	0f 84 f3 01 00 00    	je     101e86 <trap_dispatch+0x237>
  101c93:	e9 4f 02 00 00       	jmp    101ee7 <trap_dispatch+0x298>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        ticks++;
  101c98:	a1 08 f9 10 00       	mov    0x10f908,%eax
  101c9d:	40                   	inc    %eax
  101c9e:	a3 08 f9 10 00       	mov    %eax,0x10f908
        if(ticks % TICK_NUM == 0){
  101ca3:	8b 0d 08 f9 10 00    	mov    0x10f908,%ecx
  101ca9:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  101cae:	89 c8                	mov    %ecx,%eax
  101cb0:	f7 e2                	mul    %edx
  101cb2:	c1 ea 05             	shr    $0x5,%edx
  101cb5:	89 d0                	mov    %edx,%eax
  101cb7:	c1 e0 02             	shl    $0x2,%eax
  101cba:	01 d0                	add    %edx,%eax
  101cbc:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  101cc3:	01 d0                	add    %edx,%eax
  101cc5:	c1 e0 02             	shl    $0x2,%eax
  101cc8:	29 c1                	sub    %eax,%ecx
  101cca:	89 ca                	mov    %ecx,%edx
  101ccc:	85 d2                	test   %edx,%edx
  101cce:	0f 85 4b 02 00 00    	jne    101f1f <trap_dispatch+0x2d0>
            print_ticks();
  101cd4:	e8 12 fb ff ff       	call   1017eb <print_ticks>
            ticks=0;
  101cd9:	c7 05 08 f9 10 00 00 	movl   $0x0,0x10f908
  101ce0:	00 00 00 
        }
        break;
  101ce3:	e9 37 02 00 00       	jmp    101f1f <trap_dispatch+0x2d0>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101ce8:	e8 d6 f8 ff ff       	call   1015c3 <cons_getc>
  101ced:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101cf0:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101cf4:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101cf8:	89 54 24 08          	mov    %edx,0x8(%esp)
  101cfc:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d00:	c7 04 24 a9 3b 10 00 	movl   $0x103ba9,(%esp)
  101d07:	e8 5f e5 ff ff       	call   10026b <cprintf>
	
	
        break;
  101d0c:	e9 18 02 00 00       	jmp    101f29 <trap_dispatch+0x2da>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101d11:	e8 ad f8 ff ff       	call   1015c3 <cons_getc>
  101d16:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101d19:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101d1d:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101d21:	89 54 24 08          	mov    %edx,0x8(%esp)
  101d25:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d29:	c7 04 24 bb 3b 10 00 	movl   $0x103bbb,(%esp)
  101d30:	e8 36 e5 ff ff       	call   10026b <cprintf>
        if(c=='3'){
  101d35:	80 7d f7 33          	cmpb   $0x33,-0x9(%ebp)
  101d39:	75 6a                	jne    101da5 <trap_dispatch+0x156>
	if(tf->tf_cs !=USER_CS){
  101d3b:	8b 45 08             	mov    0x8(%ebp),%eax
  101d3e:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101d42:	83 f8 1b             	cmp    $0x1b,%eax
  101d45:	74 5e                	je     101da5 <trap_dispatch+0x156>
	   tf->tf_cs=USER_CS;
  101d47:	8b 45 08             	mov    0x8(%ebp),%eax
  101d4a:	66 c7 40 3c 1b 00    	movw   $0x1b,0x3c(%eax)
	   tf->tf_ds=USER_DS;
  101d50:	8b 45 08             	mov    0x8(%ebp),%eax
  101d53:	66 c7 40 2c 23 00    	movw   $0x23,0x2c(%eax)
	   tf->tf_gs=tf->tf_fs=tf->tf_es = USER_DS;
  101d59:	8b 45 08             	mov    0x8(%ebp),%eax
  101d5c:	66 c7 40 28 23 00    	movw   $0x23,0x28(%eax)
  101d62:	8b 45 08             	mov    0x8(%ebp),%eax
  101d65:	0f b7 50 28          	movzwl 0x28(%eax),%edx
  101d69:	8b 45 08             	mov    0x8(%ebp),%eax
  101d6c:	66 89 50 24          	mov    %dx,0x24(%eax)
  101d70:	8b 45 08             	mov    0x8(%ebp),%eax
  101d73:	0f b7 50 24          	movzwl 0x24(%eax),%edx
  101d77:	8b 45 08             	mov    0x8(%ebp),%eax
  101d7a:	66 89 50 20          	mov    %dx,0x20(%eax)
	   tf->tf_eflags = tf->tf_eflags|FL_IOPL_MASK;
  101d7e:	8b 45 08             	mov    0x8(%ebp),%eax
  101d81:	8b 40 40             	mov    0x40(%eax),%eax
  101d84:	0d 00 30 00 00       	or     $0x3000,%eax
  101d89:	89 c2                	mov    %eax,%edx
  101d8b:	8b 45 08             	mov    0x8(%ebp),%eax
  101d8e:	89 50 40             	mov    %edx,0x40(%eax)
	   tf->tf_ss=USER_DS;
  101d91:	8b 45 08             	mov    0x8(%ebp),%eax
  101d94:	66 c7 40 48 23 00    	movw   $0x23,0x48(%eax)
	   print_trapframe(tf);
  101d9a:	8b 45 08             	mov    0x8(%ebp),%eax
  101d9d:	89 04 24             	mov    %eax,(%esp)
  101da0:	e8 3d fc ff ff       	call   1019e2 <print_trapframe>
	  }
	}
	if(c=='0'){
  101da5:	80 7d f7 30          	cmpb   $0x30,-0x9(%ebp)
  101da9:	0f 85 73 01 00 00    	jne    101f22 <trap_dispatch+0x2d3>
	if(tf->tf_cs !=KERNEL_CS){
  101daf:	8b 45 08             	mov    0x8(%ebp),%eax
  101db2:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101db6:	83 f8 08             	cmp    $0x8,%eax
  101db9:	0f 84 63 01 00 00    	je     101f22 <trap_dispatch+0x2d3>
	   tf->tf_cs =KERNEL_CS;
  101dbf:	8b 45 08             	mov    0x8(%ebp),%eax
  101dc2:	66 c7 40 3c 08 00    	movw   $0x8,0x3c(%eax)
	   tf->tf_ds=tf->tf_gs=tf->tf_fs=tf->tf_es = KERNEL_DS;
  101dc8:	8b 45 08             	mov    0x8(%ebp),%eax
  101dcb:	66 c7 40 28 10 00    	movw   $0x10,0x28(%eax)
  101dd1:	8b 45 08             	mov    0x8(%ebp),%eax
  101dd4:	0f b7 50 28          	movzwl 0x28(%eax),%edx
  101dd8:	8b 45 08             	mov    0x8(%ebp),%eax
  101ddb:	66 89 50 24          	mov    %dx,0x24(%eax)
  101ddf:	8b 45 08             	mov    0x8(%ebp),%eax
  101de2:	0f b7 50 24          	movzwl 0x24(%eax),%edx
  101de6:	8b 45 08             	mov    0x8(%ebp),%eax
  101de9:	66 89 50 20          	mov    %dx,0x20(%eax)
  101ded:	8b 45 08             	mov    0x8(%ebp),%eax
  101df0:	0f b7 50 20          	movzwl 0x20(%eax),%edx
  101df4:	8b 45 08             	mov    0x8(%ebp),%eax
  101df7:	66 89 50 2c          	mov    %dx,0x2c(%eax)
	   tf->tf_eflags = tf->tf_eflags&(~FL_IOPL_MASK);
  101dfb:	8b 45 08             	mov    0x8(%ebp),%eax
  101dfe:	8b 40 40             	mov    0x40(%eax),%eax
  101e01:	25 ff cf ff ff       	and    $0xffffcfff,%eax
  101e06:	89 c2                	mov    %eax,%edx
  101e08:	8b 45 08             	mov    0x8(%ebp),%eax
  101e0b:	89 50 40             	mov    %edx,0x40(%eax)
	   print_trapframe(tf);
  101e0e:	8b 45 08             	mov    0x8(%ebp),%eax
  101e11:	89 04 24             	mov    %eax,(%esp)
  101e14:	e8 c9 fb ff ff       	call   1019e2 <print_trapframe>
	   }
	}
        break;
  101e19:	e9 04 01 00 00       	jmp    101f22 <trap_dispatch+0x2d3>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
	if(tf->tf_cs !=USER_CS){
  101e1e:	8b 45 08             	mov    0x8(%ebp),%eax
  101e21:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101e25:	83 f8 1b             	cmp    $0x1b,%eax
  101e28:	0f 84 f7 00 00 00    	je     101f25 <trap_dispatch+0x2d6>
	   tf->tf_cs=USER_CS;
  101e2e:	8b 45 08             	mov    0x8(%ebp),%eax
  101e31:	66 c7 40 3c 1b 00    	movw   $0x1b,0x3c(%eax)
	   tf->tf_ds=USER_DS;
  101e37:	8b 45 08             	mov    0x8(%ebp),%eax
  101e3a:	66 c7 40 2c 23 00    	movw   $0x23,0x2c(%eax)
	   tf->tf_gs=tf->tf_fs=tf->tf_es = USER_DS;
  101e40:	8b 45 08             	mov    0x8(%ebp),%eax
  101e43:	66 c7 40 28 23 00    	movw   $0x23,0x28(%eax)
  101e49:	8b 45 08             	mov    0x8(%ebp),%eax
  101e4c:	0f b7 50 28          	movzwl 0x28(%eax),%edx
  101e50:	8b 45 08             	mov    0x8(%ebp),%eax
  101e53:	66 89 50 24          	mov    %dx,0x24(%eax)
  101e57:	8b 45 08             	mov    0x8(%ebp),%eax
  101e5a:	0f b7 50 24          	movzwl 0x24(%eax),%edx
  101e5e:	8b 45 08             	mov    0x8(%ebp),%eax
  101e61:	66 89 50 20          	mov    %dx,0x20(%eax)
	   tf->tf_eflags = tf->tf_eflags|FL_IOPL_MASK;
  101e65:	8b 45 08             	mov    0x8(%ebp),%eax
  101e68:	8b 40 40             	mov    0x40(%eax),%eax
  101e6b:	0d 00 30 00 00       	or     $0x3000,%eax
  101e70:	89 c2                	mov    %eax,%edx
  101e72:	8b 45 08             	mov    0x8(%ebp),%eax
  101e75:	89 50 40             	mov    %edx,0x40(%eax)
	   tf->tf_ss=USER_DS;
  101e78:	8b 45 08             	mov    0x8(%ebp),%eax
  101e7b:	66 c7 40 48 23 00    	movw   $0x23,0x48(%eax)
	  }
	break;
  101e81:	e9 9f 00 00 00       	jmp    101f25 <trap_dispatch+0x2d6>
    case T_SWITCH_TOK:
	if(tf->tf_cs !=KERNEL_CS){
  101e86:	8b 45 08             	mov    0x8(%ebp),%eax
  101e89:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101e8d:	83 f8 08             	cmp    $0x8,%eax
  101e90:	0f 84 92 00 00 00    	je     101f28 <trap_dispatch+0x2d9>
	   tf->tf_cs =KERNEL_CS;
  101e96:	8b 45 08             	mov    0x8(%ebp),%eax
  101e99:	66 c7 40 3c 08 00    	movw   $0x8,0x3c(%eax)
	   tf->tf_ds=tf->tf_gs=tf->tf_fs=tf->tf_es = KERNEL_DS;
  101e9f:	8b 45 08             	mov    0x8(%ebp),%eax
  101ea2:	66 c7 40 28 10 00    	movw   $0x10,0x28(%eax)
  101ea8:	8b 45 08             	mov    0x8(%ebp),%eax
  101eab:	0f b7 50 28          	movzwl 0x28(%eax),%edx
  101eaf:	8b 45 08             	mov    0x8(%ebp),%eax
  101eb2:	66 89 50 24          	mov    %dx,0x24(%eax)
  101eb6:	8b 45 08             	mov    0x8(%ebp),%eax
  101eb9:	0f b7 50 24          	movzwl 0x24(%eax),%edx
  101ebd:	8b 45 08             	mov    0x8(%ebp),%eax
  101ec0:	66 89 50 20          	mov    %dx,0x20(%eax)
  101ec4:	8b 45 08             	mov    0x8(%ebp),%eax
  101ec7:	0f b7 50 20          	movzwl 0x20(%eax),%edx
  101ecb:	8b 45 08             	mov    0x8(%ebp),%eax
  101ece:	66 89 50 2c          	mov    %dx,0x2c(%eax)
	   tf->tf_eflags = tf->tf_eflags&(~FL_IOPL_MASK);
  101ed2:	8b 45 08             	mov    0x8(%ebp),%eax
  101ed5:	8b 40 40             	mov    0x40(%eax),%eax
  101ed8:	25 ff cf ff ff       	and    $0xffffcfff,%eax
  101edd:	89 c2                	mov    %eax,%edx
  101edf:	8b 45 08             	mov    0x8(%ebp),%eax
  101ee2:	89 50 40             	mov    %edx,0x40(%eax)
	   
	}
        break;
  101ee5:	eb 41                	jmp    101f28 <trap_dispatch+0x2d9>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101ee7:	8b 45 08             	mov    0x8(%ebp),%eax
  101eea:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101eee:	83 e0 03             	and    $0x3,%eax
  101ef1:	85 c0                	test   %eax,%eax
  101ef3:	75 34                	jne    101f29 <trap_dispatch+0x2da>
            print_trapframe(tf);
  101ef5:	8b 45 08             	mov    0x8(%ebp),%eax
  101ef8:	89 04 24             	mov    %eax,(%esp)
  101efb:	e8 e2 fa ff ff       	call   1019e2 <print_trapframe>
            panic("unexpected trap in kernel.\n");
  101f00:	c7 44 24 08 ca 3b 10 	movl   $0x103bca,0x8(%esp)
  101f07:	00 
  101f08:	c7 44 24 04 db 00 00 	movl   $0xdb,0x4(%esp)
  101f0f:	00 
  101f10:	c7 04 24 ee 39 10 00 	movl   $0x1039ee,(%esp)
  101f17:	e8 a6 e4 ff ff       	call   1003c2 <__panic>
	}
        break;
    case IRQ_OFFSET + IRQ_IDE1:
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
  101f1c:	90                   	nop
  101f1d:	eb 0a                	jmp    101f29 <trap_dispatch+0x2da>
        ticks++;
        if(ticks % TICK_NUM == 0){
            print_ticks();
            ticks=0;
        }
        break;
  101f1f:	90                   	nop
  101f20:	eb 07                	jmp    101f29 <trap_dispatch+0x2da>
	   tf->tf_ds=tf->tf_gs=tf->tf_fs=tf->tf_es = KERNEL_DS;
	   tf->tf_eflags = tf->tf_eflags&(~FL_IOPL_MASK);
	   print_trapframe(tf);
	   }
	}
        break;
  101f22:	90                   	nop
  101f23:	eb 04                	jmp    101f29 <trap_dispatch+0x2da>
	   tf->tf_ds=USER_DS;
	   tf->tf_gs=tf->tf_fs=tf->tf_es = USER_DS;
	   tf->tf_eflags = tf->tf_eflags|FL_IOPL_MASK;
	   tf->tf_ss=USER_DS;
	  }
	break;
  101f25:	90                   	nop
  101f26:	eb 01                	jmp    101f29 <trap_dispatch+0x2da>
	   tf->tf_cs =KERNEL_CS;
	   tf->tf_ds=tf->tf_gs=tf->tf_fs=tf->tf_es = KERNEL_DS;
	   tf->tf_eflags = tf->tf_eflags&(~FL_IOPL_MASK);
	   
	}
        break;
  101f28:	90                   	nop
        if ((tf->tf_cs & 3) == 0) {
            print_trapframe(tf);
            panic("unexpected trap in kernel.\n");
        }
    }
}
  101f29:	90                   	nop
  101f2a:	c9                   	leave  
  101f2b:	c3                   	ret    

00101f2c <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101f2c:	55                   	push   %ebp
  101f2d:	89 e5                	mov    %esp,%ebp
  101f2f:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101f32:	8b 45 08             	mov    0x8(%ebp),%eax
  101f35:	89 04 24             	mov    %eax,(%esp)
  101f38:	e8 12 fd ff ff       	call   101c4f <trap_dispatch>
}
  101f3d:	90                   	nop
  101f3e:	c9                   	leave  
  101f3f:	c3                   	ret    

00101f40 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101f40:	6a 00                	push   $0x0
  pushl $0
  101f42:	6a 00                	push   $0x0
  jmp __alltraps
  101f44:	e9 69 0a 00 00       	jmp    1029b2 <__alltraps>

00101f49 <vector1>:
.globl vector1
vector1:
  pushl $0
  101f49:	6a 00                	push   $0x0
  pushl $1
  101f4b:	6a 01                	push   $0x1
  jmp __alltraps
  101f4d:	e9 60 0a 00 00       	jmp    1029b2 <__alltraps>

00101f52 <vector2>:
.globl vector2
vector2:
  pushl $0
  101f52:	6a 00                	push   $0x0
  pushl $2
  101f54:	6a 02                	push   $0x2
  jmp __alltraps
  101f56:	e9 57 0a 00 00       	jmp    1029b2 <__alltraps>

00101f5b <vector3>:
.globl vector3
vector3:
  pushl $0
  101f5b:	6a 00                	push   $0x0
  pushl $3
  101f5d:	6a 03                	push   $0x3
  jmp __alltraps
  101f5f:	e9 4e 0a 00 00       	jmp    1029b2 <__alltraps>

00101f64 <vector4>:
.globl vector4
vector4:
  pushl $0
  101f64:	6a 00                	push   $0x0
  pushl $4
  101f66:	6a 04                	push   $0x4
  jmp __alltraps
  101f68:	e9 45 0a 00 00       	jmp    1029b2 <__alltraps>

00101f6d <vector5>:
.globl vector5
vector5:
  pushl $0
  101f6d:	6a 00                	push   $0x0
  pushl $5
  101f6f:	6a 05                	push   $0x5
  jmp __alltraps
  101f71:	e9 3c 0a 00 00       	jmp    1029b2 <__alltraps>

00101f76 <vector6>:
.globl vector6
vector6:
  pushl $0
  101f76:	6a 00                	push   $0x0
  pushl $6
  101f78:	6a 06                	push   $0x6
  jmp __alltraps
  101f7a:	e9 33 0a 00 00       	jmp    1029b2 <__alltraps>

00101f7f <vector7>:
.globl vector7
vector7:
  pushl $0
  101f7f:	6a 00                	push   $0x0
  pushl $7
  101f81:	6a 07                	push   $0x7
  jmp __alltraps
  101f83:	e9 2a 0a 00 00       	jmp    1029b2 <__alltraps>

00101f88 <vector8>:
.globl vector8
vector8:
  pushl $8
  101f88:	6a 08                	push   $0x8
  jmp __alltraps
  101f8a:	e9 23 0a 00 00       	jmp    1029b2 <__alltraps>

00101f8f <vector9>:
.globl vector9
vector9:
  pushl $0
  101f8f:	6a 00                	push   $0x0
  pushl $9
  101f91:	6a 09                	push   $0x9
  jmp __alltraps
  101f93:	e9 1a 0a 00 00       	jmp    1029b2 <__alltraps>

00101f98 <vector10>:
.globl vector10
vector10:
  pushl $10
  101f98:	6a 0a                	push   $0xa
  jmp __alltraps
  101f9a:	e9 13 0a 00 00       	jmp    1029b2 <__alltraps>

00101f9f <vector11>:
.globl vector11
vector11:
  pushl $11
  101f9f:	6a 0b                	push   $0xb
  jmp __alltraps
  101fa1:	e9 0c 0a 00 00       	jmp    1029b2 <__alltraps>

00101fa6 <vector12>:
.globl vector12
vector12:
  pushl $12
  101fa6:	6a 0c                	push   $0xc
  jmp __alltraps
  101fa8:	e9 05 0a 00 00       	jmp    1029b2 <__alltraps>

00101fad <vector13>:
.globl vector13
vector13:
  pushl $13
  101fad:	6a 0d                	push   $0xd
  jmp __alltraps
  101faf:	e9 fe 09 00 00       	jmp    1029b2 <__alltraps>

00101fb4 <vector14>:
.globl vector14
vector14:
  pushl $14
  101fb4:	6a 0e                	push   $0xe
  jmp __alltraps
  101fb6:	e9 f7 09 00 00       	jmp    1029b2 <__alltraps>

00101fbb <vector15>:
.globl vector15
vector15:
  pushl $0
  101fbb:	6a 00                	push   $0x0
  pushl $15
  101fbd:	6a 0f                	push   $0xf
  jmp __alltraps
  101fbf:	e9 ee 09 00 00       	jmp    1029b2 <__alltraps>

00101fc4 <vector16>:
.globl vector16
vector16:
  pushl $0
  101fc4:	6a 00                	push   $0x0
  pushl $16
  101fc6:	6a 10                	push   $0x10
  jmp __alltraps
  101fc8:	e9 e5 09 00 00       	jmp    1029b2 <__alltraps>

00101fcd <vector17>:
.globl vector17
vector17:
  pushl $17
  101fcd:	6a 11                	push   $0x11
  jmp __alltraps
  101fcf:	e9 de 09 00 00       	jmp    1029b2 <__alltraps>

00101fd4 <vector18>:
.globl vector18
vector18:
  pushl $0
  101fd4:	6a 00                	push   $0x0
  pushl $18
  101fd6:	6a 12                	push   $0x12
  jmp __alltraps
  101fd8:	e9 d5 09 00 00       	jmp    1029b2 <__alltraps>

00101fdd <vector19>:
.globl vector19
vector19:
  pushl $0
  101fdd:	6a 00                	push   $0x0
  pushl $19
  101fdf:	6a 13                	push   $0x13
  jmp __alltraps
  101fe1:	e9 cc 09 00 00       	jmp    1029b2 <__alltraps>

00101fe6 <vector20>:
.globl vector20
vector20:
  pushl $0
  101fe6:	6a 00                	push   $0x0
  pushl $20
  101fe8:	6a 14                	push   $0x14
  jmp __alltraps
  101fea:	e9 c3 09 00 00       	jmp    1029b2 <__alltraps>

00101fef <vector21>:
.globl vector21
vector21:
  pushl $0
  101fef:	6a 00                	push   $0x0
  pushl $21
  101ff1:	6a 15                	push   $0x15
  jmp __alltraps
  101ff3:	e9 ba 09 00 00       	jmp    1029b2 <__alltraps>

00101ff8 <vector22>:
.globl vector22
vector22:
  pushl $0
  101ff8:	6a 00                	push   $0x0
  pushl $22
  101ffa:	6a 16                	push   $0x16
  jmp __alltraps
  101ffc:	e9 b1 09 00 00       	jmp    1029b2 <__alltraps>

00102001 <vector23>:
.globl vector23
vector23:
  pushl $0
  102001:	6a 00                	push   $0x0
  pushl $23
  102003:	6a 17                	push   $0x17
  jmp __alltraps
  102005:	e9 a8 09 00 00       	jmp    1029b2 <__alltraps>

0010200a <vector24>:
.globl vector24
vector24:
  pushl $0
  10200a:	6a 00                	push   $0x0
  pushl $24
  10200c:	6a 18                	push   $0x18
  jmp __alltraps
  10200e:	e9 9f 09 00 00       	jmp    1029b2 <__alltraps>

00102013 <vector25>:
.globl vector25
vector25:
  pushl $0
  102013:	6a 00                	push   $0x0
  pushl $25
  102015:	6a 19                	push   $0x19
  jmp __alltraps
  102017:	e9 96 09 00 00       	jmp    1029b2 <__alltraps>

0010201c <vector26>:
.globl vector26
vector26:
  pushl $0
  10201c:	6a 00                	push   $0x0
  pushl $26
  10201e:	6a 1a                	push   $0x1a
  jmp __alltraps
  102020:	e9 8d 09 00 00       	jmp    1029b2 <__alltraps>

00102025 <vector27>:
.globl vector27
vector27:
  pushl $0
  102025:	6a 00                	push   $0x0
  pushl $27
  102027:	6a 1b                	push   $0x1b
  jmp __alltraps
  102029:	e9 84 09 00 00       	jmp    1029b2 <__alltraps>

0010202e <vector28>:
.globl vector28
vector28:
  pushl $0
  10202e:	6a 00                	push   $0x0
  pushl $28
  102030:	6a 1c                	push   $0x1c
  jmp __alltraps
  102032:	e9 7b 09 00 00       	jmp    1029b2 <__alltraps>

00102037 <vector29>:
.globl vector29
vector29:
  pushl $0
  102037:	6a 00                	push   $0x0
  pushl $29
  102039:	6a 1d                	push   $0x1d
  jmp __alltraps
  10203b:	e9 72 09 00 00       	jmp    1029b2 <__alltraps>

00102040 <vector30>:
.globl vector30
vector30:
  pushl $0
  102040:	6a 00                	push   $0x0
  pushl $30
  102042:	6a 1e                	push   $0x1e
  jmp __alltraps
  102044:	e9 69 09 00 00       	jmp    1029b2 <__alltraps>

00102049 <vector31>:
.globl vector31
vector31:
  pushl $0
  102049:	6a 00                	push   $0x0
  pushl $31
  10204b:	6a 1f                	push   $0x1f
  jmp __alltraps
  10204d:	e9 60 09 00 00       	jmp    1029b2 <__alltraps>

00102052 <vector32>:
.globl vector32
vector32:
  pushl $0
  102052:	6a 00                	push   $0x0
  pushl $32
  102054:	6a 20                	push   $0x20
  jmp __alltraps
  102056:	e9 57 09 00 00       	jmp    1029b2 <__alltraps>

0010205b <vector33>:
.globl vector33
vector33:
  pushl $0
  10205b:	6a 00                	push   $0x0
  pushl $33
  10205d:	6a 21                	push   $0x21
  jmp __alltraps
  10205f:	e9 4e 09 00 00       	jmp    1029b2 <__alltraps>

00102064 <vector34>:
.globl vector34
vector34:
  pushl $0
  102064:	6a 00                	push   $0x0
  pushl $34
  102066:	6a 22                	push   $0x22
  jmp __alltraps
  102068:	e9 45 09 00 00       	jmp    1029b2 <__alltraps>

0010206d <vector35>:
.globl vector35
vector35:
  pushl $0
  10206d:	6a 00                	push   $0x0
  pushl $35
  10206f:	6a 23                	push   $0x23
  jmp __alltraps
  102071:	e9 3c 09 00 00       	jmp    1029b2 <__alltraps>

00102076 <vector36>:
.globl vector36
vector36:
  pushl $0
  102076:	6a 00                	push   $0x0
  pushl $36
  102078:	6a 24                	push   $0x24
  jmp __alltraps
  10207a:	e9 33 09 00 00       	jmp    1029b2 <__alltraps>

0010207f <vector37>:
.globl vector37
vector37:
  pushl $0
  10207f:	6a 00                	push   $0x0
  pushl $37
  102081:	6a 25                	push   $0x25
  jmp __alltraps
  102083:	e9 2a 09 00 00       	jmp    1029b2 <__alltraps>

00102088 <vector38>:
.globl vector38
vector38:
  pushl $0
  102088:	6a 00                	push   $0x0
  pushl $38
  10208a:	6a 26                	push   $0x26
  jmp __alltraps
  10208c:	e9 21 09 00 00       	jmp    1029b2 <__alltraps>

00102091 <vector39>:
.globl vector39
vector39:
  pushl $0
  102091:	6a 00                	push   $0x0
  pushl $39
  102093:	6a 27                	push   $0x27
  jmp __alltraps
  102095:	e9 18 09 00 00       	jmp    1029b2 <__alltraps>

0010209a <vector40>:
.globl vector40
vector40:
  pushl $0
  10209a:	6a 00                	push   $0x0
  pushl $40
  10209c:	6a 28                	push   $0x28
  jmp __alltraps
  10209e:	e9 0f 09 00 00       	jmp    1029b2 <__alltraps>

001020a3 <vector41>:
.globl vector41
vector41:
  pushl $0
  1020a3:	6a 00                	push   $0x0
  pushl $41
  1020a5:	6a 29                	push   $0x29
  jmp __alltraps
  1020a7:	e9 06 09 00 00       	jmp    1029b2 <__alltraps>

001020ac <vector42>:
.globl vector42
vector42:
  pushl $0
  1020ac:	6a 00                	push   $0x0
  pushl $42
  1020ae:	6a 2a                	push   $0x2a
  jmp __alltraps
  1020b0:	e9 fd 08 00 00       	jmp    1029b2 <__alltraps>

001020b5 <vector43>:
.globl vector43
vector43:
  pushl $0
  1020b5:	6a 00                	push   $0x0
  pushl $43
  1020b7:	6a 2b                	push   $0x2b
  jmp __alltraps
  1020b9:	e9 f4 08 00 00       	jmp    1029b2 <__alltraps>

001020be <vector44>:
.globl vector44
vector44:
  pushl $0
  1020be:	6a 00                	push   $0x0
  pushl $44
  1020c0:	6a 2c                	push   $0x2c
  jmp __alltraps
  1020c2:	e9 eb 08 00 00       	jmp    1029b2 <__alltraps>

001020c7 <vector45>:
.globl vector45
vector45:
  pushl $0
  1020c7:	6a 00                	push   $0x0
  pushl $45
  1020c9:	6a 2d                	push   $0x2d
  jmp __alltraps
  1020cb:	e9 e2 08 00 00       	jmp    1029b2 <__alltraps>

001020d0 <vector46>:
.globl vector46
vector46:
  pushl $0
  1020d0:	6a 00                	push   $0x0
  pushl $46
  1020d2:	6a 2e                	push   $0x2e
  jmp __alltraps
  1020d4:	e9 d9 08 00 00       	jmp    1029b2 <__alltraps>

001020d9 <vector47>:
.globl vector47
vector47:
  pushl $0
  1020d9:	6a 00                	push   $0x0
  pushl $47
  1020db:	6a 2f                	push   $0x2f
  jmp __alltraps
  1020dd:	e9 d0 08 00 00       	jmp    1029b2 <__alltraps>

001020e2 <vector48>:
.globl vector48
vector48:
  pushl $0
  1020e2:	6a 00                	push   $0x0
  pushl $48
  1020e4:	6a 30                	push   $0x30
  jmp __alltraps
  1020e6:	e9 c7 08 00 00       	jmp    1029b2 <__alltraps>

001020eb <vector49>:
.globl vector49
vector49:
  pushl $0
  1020eb:	6a 00                	push   $0x0
  pushl $49
  1020ed:	6a 31                	push   $0x31
  jmp __alltraps
  1020ef:	e9 be 08 00 00       	jmp    1029b2 <__alltraps>

001020f4 <vector50>:
.globl vector50
vector50:
  pushl $0
  1020f4:	6a 00                	push   $0x0
  pushl $50
  1020f6:	6a 32                	push   $0x32
  jmp __alltraps
  1020f8:	e9 b5 08 00 00       	jmp    1029b2 <__alltraps>

001020fd <vector51>:
.globl vector51
vector51:
  pushl $0
  1020fd:	6a 00                	push   $0x0
  pushl $51
  1020ff:	6a 33                	push   $0x33
  jmp __alltraps
  102101:	e9 ac 08 00 00       	jmp    1029b2 <__alltraps>

00102106 <vector52>:
.globl vector52
vector52:
  pushl $0
  102106:	6a 00                	push   $0x0
  pushl $52
  102108:	6a 34                	push   $0x34
  jmp __alltraps
  10210a:	e9 a3 08 00 00       	jmp    1029b2 <__alltraps>

0010210f <vector53>:
.globl vector53
vector53:
  pushl $0
  10210f:	6a 00                	push   $0x0
  pushl $53
  102111:	6a 35                	push   $0x35
  jmp __alltraps
  102113:	e9 9a 08 00 00       	jmp    1029b2 <__alltraps>

00102118 <vector54>:
.globl vector54
vector54:
  pushl $0
  102118:	6a 00                	push   $0x0
  pushl $54
  10211a:	6a 36                	push   $0x36
  jmp __alltraps
  10211c:	e9 91 08 00 00       	jmp    1029b2 <__alltraps>

00102121 <vector55>:
.globl vector55
vector55:
  pushl $0
  102121:	6a 00                	push   $0x0
  pushl $55
  102123:	6a 37                	push   $0x37
  jmp __alltraps
  102125:	e9 88 08 00 00       	jmp    1029b2 <__alltraps>

0010212a <vector56>:
.globl vector56
vector56:
  pushl $0
  10212a:	6a 00                	push   $0x0
  pushl $56
  10212c:	6a 38                	push   $0x38
  jmp __alltraps
  10212e:	e9 7f 08 00 00       	jmp    1029b2 <__alltraps>

00102133 <vector57>:
.globl vector57
vector57:
  pushl $0
  102133:	6a 00                	push   $0x0
  pushl $57
  102135:	6a 39                	push   $0x39
  jmp __alltraps
  102137:	e9 76 08 00 00       	jmp    1029b2 <__alltraps>

0010213c <vector58>:
.globl vector58
vector58:
  pushl $0
  10213c:	6a 00                	push   $0x0
  pushl $58
  10213e:	6a 3a                	push   $0x3a
  jmp __alltraps
  102140:	e9 6d 08 00 00       	jmp    1029b2 <__alltraps>

00102145 <vector59>:
.globl vector59
vector59:
  pushl $0
  102145:	6a 00                	push   $0x0
  pushl $59
  102147:	6a 3b                	push   $0x3b
  jmp __alltraps
  102149:	e9 64 08 00 00       	jmp    1029b2 <__alltraps>

0010214e <vector60>:
.globl vector60
vector60:
  pushl $0
  10214e:	6a 00                	push   $0x0
  pushl $60
  102150:	6a 3c                	push   $0x3c
  jmp __alltraps
  102152:	e9 5b 08 00 00       	jmp    1029b2 <__alltraps>

00102157 <vector61>:
.globl vector61
vector61:
  pushl $0
  102157:	6a 00                	push   $0x0
  pushl $61
  102159:	6a 3d                	push   $0x3d
  jmp __alltraps
  10215b:	e9 52 08 00 00       	jmp    1029b2 <__alltraps>

00102160 <vector62>:
.globl vector62
vector62:
  pushl $0
  102160:	6a 00                	push   $0x0
  pushl $62
  102162:	6a 3e                	push   $0x3e
  jmp __alltraps
  102164:	e9 49 08 00 00       	jmp    1029b2 <__alltraps>

00102169 <vector63>:
.globl vector63
vector63:
  pushl $0
  102169:	6a 00                	push   $0x0
  pushl $63
  10216b:	6a 3f                	push   $0x3f
  jmp __alltraps
  10216d:	e9 40 08 00 00       	jmp    1029b2 <__alltraps>

00102172 <vector64>:
.globl vector64
vector64:
  pushl $0
  102172:	6a 00                	push   $0x0
  pushl $64
  102174:	6a 40                	push   $0x40
  jmp __alltraps
  102176:	e9 37 08 00 00       	jmp    1029b2 <__alltraps>

0010217b <vector65>:
.globl vector65
vector65:
  pushl $0
  10217b:	6a 00                	push   $0x0
  pushl $65
  10217d:	6a 41                	push   $0x41
  jmp __alltraps
  10217f:	e9 2e 08 00 00       	jmp    1029b2 <__alltraps>

00102184 <vector66>:
.globl vector66
vector66:
  pushl $0
  102184:	6a 00                	push   $0x0
  pushl $66
  102186:	6a 42                	push   $0x42
  jmp __alltraps
  102188:	e9 25 08 00 00       	jmp    1029b2 <__alltraps>

0010218d <vector67>:
.globl vector67
vector67:
  pushl $0
  10218d:	6a 00                	push   $0x0
  pushl $67
  10218f:	6a 43                	push   $0x43
  jmp __alltraps
  102191:	e9 1c 08 00 00       	jmp    1029b2 <__alltraps>

00102196 <vector68>:
.globl vector68
vector68:
  pushl $0
  102196:	6a 00                	push   $0x0
  pushl $68
  102198:	6a 44                	push   $0x44
  jmp __alltraps
  10219a:	e9 13 08 00 00       	jmp    1029b2 <__alltraps>

0010219f <vector69>:
.globl vector69
vector69:
  pushl $0
  10219f:	6a 00                	push   $0x0
  pushl $69
  1021a1:	6a 45                	push   $0x45
  jmp __alltraps
  1021a3:	e9 0a 08 00 00       	jmp    1029b2 <__alltraps>

001021a8 <vector70>:
.globl vector70
vector70:
  pushl $0
  1021a8:	6a 00                	push   $0x0
  pushl $70
  1021aa:	6a 46                	push   $0x46
  jmp __alltraps
  1021ac:	e9 01 08 00 00       	jmp    1029b2 <__alltraps>

001021b1 <vector71>:
.globl vector71
vector71:
  pushl $0
  1021b1:	6a 00                	push   $0x0
  pushl $71
  1021b3:	6a 47                	push   $0x47
  jmp __alltraps
  1021b5:	e9 f8 07 00 00       	jmp    1029b2 <__alltraps>

001021ba <vector72>:
.globl vector72
vector72:
  pushl $0
  1021ba:	6a 00                	push   $0x0
  pushl $72
  1021bc:	6a 48                	push   $0x48
  jmp __alltraps
  1021be:	e9 ef 07 00 00       	jmp    1029b2 <__alltraps>

001021c3 <vector73>:
.globl vector73
vector73:
  pushl $0
  1021c3:	6a 00                	push   $0x0
  pushl $73
  1021c5:	6a 49                	push   $0x49
  jmp __alltraps
  1021c7:	e9 e6 07 00 00       	jmp    1029b2 <__alltraps>

001021cc <vector74>:
.globl vector74
vector74:
  pushl $0
  1021cc:	6a 00                	push   $0x0
  pushl $74
  1021ce:	6a 4a                	push   $0x4a
  jmp __alltraps
  1021d0:	e9 dd 07 00 00       	jmp    1029b2 <__alltraps>

001021d5 <vector75>:
.globl vector75
vector75:
  pushl $0
  1021d5:	6a 00                	push   $0x0
  pushl $75
  1021d7:	6a 4b                	push   $0x4b
  jmp __alltraps
  1021d9:	e9 d4 07 00 00       	jmp    1029b2 <__alltraps>

001021de <vector76>:
.globl vector76
vector76:
  pushl $0
  1021de:	6a 00                	push   $0x0
  pushl $76
  1021e0:	6a 4c                	push   $0x4c
  jmp __alltraps
  1021e2:	e9 cb 07 00 00       	jmp    1029b2 <__alltraps>

001021e7 <vector77>:
.globl vector77
vector77:
  pushl $0
  1021e7:	6a 00                	push   $0x0
  pushl $77
  1021e9:	6a 4d                	push   $0x4d
  jmp __alltraps
  1021eb:	e9 c2 07 00 00       	jmp    1029b2 <__alltraps>

001021f0 <vector78>:
.globl vector78
vector78:
  pushl $0
  1021f0:	6a 00                	push   $0x0
  pushl $78
  1021f2:	6a 4e                	push   $0x4e
  jmp __alltraps
  1021f4:	e9 b9 07 00 00       	jmp    1029b2 <__alltraps>

001021f9 <vector79>:
.globl vector79
vector79:
  pushl $0
  1021f9:	6a 00                	push   $0x0
  pushl $79
  1021fb:	6a 4f                	push   $0x4f
  jmp __alltraps
  1021fd:	e9 b0 07 00 00       	jmp    1029b2 <__alltraps>

00102202 <vector80>:
.globl vector80
vector80:
  pushl $0
  102202:	6a 00                	push   $0x0
  pushl $80
  102204:	6a 50                	push   $0x50
  jmp __alltraps
  102206:	e9 a7 07 00 00       	jmp    1029b2 <__alltraps>

0010220b <vector81>:
.globl vector81
vector81:
  pushl $0
  10220b:	6a 00                	push   $0x0
  pushl $81
  10220d:	6a 51                	push   $0x51
  jmp __alltraps
  10220f:	e9 9e 07 00 00       	jmp    1029b2 <__alltraps>

00102214 <vector82>:
.globl vector82
vector82:
  pushl $0
  102214:	6a 00                	push   $0x0
  pushl $82
  102216:	6a 52                	push   $0x52
  jmp __alltraps
  102218:	e9 95 07 00 00       	jmp    1029b2 <__alltraps>

0010221d <vector83>:
.globl vector83
vector83:
  pushl $0
  10221d:	6a 00                	push   $0x0
  pushl $83
  10221f:	6a 53                	push   $0x53
  jmp __alltraps
  102221:	e9 8c 07 00 00       	jmp    1029b2 <__alltraps>

00102226 <vector84>:
.globl vector84
vector84:
  pushl $0
  102226:	6a 00                	push   $0x0
  pushl $84
  102228:	6a 54                	push   $0x54
  jmp __alltraps
  10222a:	e9 83 07 00 00       	jmp    1029b2 <__alltraps>

0010222f <vector85>:
.globl vector85
vector85:
  pushl $0
  10222f:	6a 00                	push   $0x0
  pushl $85
  102231:	6a 55                	push   $0x55
  jmp __alltraps
  102233:	e9 7a 07 00 00       	jmp    1029b2 <__alltraps>

00102238 <vector86>:
.globl vector86
vector86:
  pushl $0
  102238:	6a 00                	push   $0x0
  pushl $86
  10223a:	6a 56                	push   $0x56
  jmp __alltraps
  10223c:	e9 71 07 00 00       	jmp    1029b2 <__alltraps>

00102241 <vector87>:
.globl vector87
vector87:
  pushl $0
  102241:	6a 00                	push   $0x0
  pushl $87
  102243:	6a 57                	push   $0x57
  jmp __alltraps
  102245:	e9 68 07 00 00       	jmp    1029b2 <__alltraps>

0010224a <vector88>:
.globl vector88
vector88:
  pushl $0
  10224a:	6a 00                	push   $0x0
  pushl $88
  10224c:	6a 58                	push   $0x58
  jmp __alltraps
  10224e:	e9 5f 07 00 00       	jmp    1029b2 <__alltraps>

00102253 <vector89>:
.globl vector89
vector89:
  pushl $0
  102253:	6a 00                	push   $0x0
  pushl $89
  102255:	6a 59                	push   $0x59
  jmp __alltraps
  102257:	e9 56 07 00 00       	jmp    1029b2 <__alltraps>

0010225c <vector90>:
.globl vector90
vector90:
  pushl $0
  10225c:	6a 00                	push   $0x0
  pushl $90
  10225e:	6a 5a                	push   $0x5a
  jmp __alltraps
  102260:	e9 4d 07 00 00       	jmp    1029b2 <__alltraps>

00102265 <vector91>:
.globl vector91
vector91:
  pushl $0
  102265:	6a 00                	push   $0x0
  pushl $91
  102267:	6a 5b                	push   $0x5b
  jmp __alltraps
  102269:	e9 44 07 00 00       	jmp    1029b2 <__alltraps>

0010226e <vector92>:
.globl vector92
vector92:
  pushl $0
  10226e:	6a 00                	push   $0x0
  pushl $92
  102270:	6a 5c                	push   $0x5c
  jmp __alltraps
  102272:	e9 3b 07 00 00       	jmp    1029b2 <__alltraps>

00102277 <vector93>:
.globl vector93
vector93:
  pushl $0
  102277:	6a 00                	push   $0x0
  pushl $93
  102279:	6a 5d                	push   $0x5d
  jmp __alltraps
  10227b:	e9 32 07 00 00       	jmp    1029b2 <__alltraps>

00102280 <vector94>:
.globl vector94
vector94:
  pushl $0
  102280:	6a 00                	push   $0x0
  pushl $94
  102282:	6a 5e                	push   $0x5e
  jmp __alltraps
  102284:	e9 29 07 00 00       	jmp    1029b2 <__alltraps>

00102289 <vector95>:
.globl vector95
vector95:
  pushl $0
  102289:	6a 00                	push   $0x0
  pushl $95
  10228b:	6a 5f                	push   $0x5f
  jmp __alltraps
  10228d:	e9 20 07 00 00       	jmp    1029b2 <__alltraps>

00102292 <vector96>:
.globl vector96
vector96:
  pushl $0
  102292:	6a 00                	push   $0x0
  pushl $96
  102294:	6a 60                	push   $0x60
  jmp __alltraps
  102296:	e9 17 07 00 00       	jmp    1029b2 <__alltraps>

0010229b <vector97>:
.globl vector97
vector97:
  pushl $0
  10229b:	6a 00                	push   $0x0
  pushl $97
  10229d:	6a 61                	push   $0x61
  jmp __alltraps
  10229f:	e9 0e 07 00 00       	jmp    1029b2 <__alltraps>

001022a4 <vector98>:
.globl vector98
vector98:
  pushl $0
  1022a4:	6a 00                	push   $0x0
  pushl $98
  1022a6:	6a 62                	push   $0x62
  jmp __alltraps
  1022a8:	e9 05 07 00 00       	jmp    1029b2 <__alltraps>

001022ad <vector99>:
.globl vector99
vector99:
  pushl $0
  1022ad:	6a 00                	push   $0x0
  pushl $99
  1022af:	6a 63                	push   $0x63
  jmp __alltraps
  1022b1:	e9 fc 06 00 00       	jmp    1029b2 <__alltraps>

001022b6 <vector100>:
.globl vector100
vector100:
  pushl $0
  1022b6:	6a 00                	push   $0x0
  pushl $100
  1022b8:	6a 64                	push   $0x64
  jmp __alltraps
  1022ba:	e9 f3 06 00 00       	jmp    1029b2 <__alltraps>

001022bf <vector101>:
.globl vector101
vector101:
  pushl $0
  1022bf:	6a 00                	push   $0x0
  pushl $101
  1022c1:	6a 65                	push   $0x65
  jmp __alltraps
  1022c3:	e9 ea 06 00 00       	jmp    1029b2 <__alltraps>

001022c8 <vector102>:
.globl vector102
vector102:
  pushl $0
  1022c8:	6a 00                	push   $0x0
  pushl $102
  1022ca:	6a 66                	push   $0x66
  jmp __alltraps
  1022cc:	e9 e1 06 00 00       	jmp    1029b2 <__alltraps>

001022d1 <vector103>:
.globl vector103
vector103:
  pushl $0
  1022d1:	6a 00                	push   $0x0
  pushl $103
  1022d3:	6a 67                	push   $0x67
  jmp __alltraps
  1022d5:	e9 d8 06 00 00       	jmp    1029b2 <__alltraps>

001022da <vector104>:
.globl vector104
vector104:
  pushl $0
  1022da:	6a 00                	push   $0x0
  pushl $104
  1022dc:	6a 68                	push   $0x68
  jmp __alltraps
  1022de:	e9 cf 06 00 00       	jmp    1029b2 <__alltraps>

001022e3 <vector105>:
.globl vector105
vector105:
  pushl $0
  1022e3:	6a 00                	push   $0x0
  pushl $105
  1022e5:	6a 69                	push   $0x69
  jmp __alltraps
  1022e7:	e9 c6 06 00 00       	jmp    1029b2 <__alltraps>

001022ec <vector106>:
.globl vector106
vector106:
  pushl $0
  1022ec:	6a 00                	push   $0x0
  pushl $106
  1022ee:	6a 6a                	push   $0x6a
  jmp __alltraps
  1022f0:	e9 bd 06 00 00       	jmp    1029b2 <__alltraps>

001022f5 <vector107>:
.globl vector107
vector107:
  pushl $0
  1022f5:	6a 00                	push   $0x0
  pushl $107
  1022f7:	6a 6b                	push   $0x6b
  jmp __alltraps
  1022f9:	e9 b4 06 00 00       	jmp    1029b2 <__alltraps>

001022fe <vector108>:
.globl vector108
vector108:
  pushl $0
  1022fe:	6a 00                	push   $0x0
  pushl $108
  102300:	6a 6c                	push   $0x6c
  jmp __alltraps
  102302:	e9 ab 06 00 00       	jmp    1029b2 <__alltraps>

00102307 <vector109>:
.globl vector109
vector109:
  pushl $0
  102307:	6a 00                	push   $0x0
  pushl $109
  102309:	6a 6d                	push   $0x6d
  jmp __alltraps
  10230b:	e9 a2 06 00 00       	jmp    1029b2 <__alltraps>

00102310 <vector110>:
.globl vector110
vector110:
  pushl $0
  102310:	6a 00                	push   $0x0
  pushl $110
  102312:	6a 6e                	push   $0x6e
  jmp __alltraps
  102314:	e9 99 06 00 00       	jmp    1029b2 <__alltraps>

00102319 <vector111>:
.globl vector111
vector111:
  pushl $0
  102319:	6a 00                	push   $0x0
  pushl $111
  10231b:	6a 6f                	push   $0x6f
  jmp __alltraps
  10231d:	e9 90 06 00 00       	jmp    1029b2 <__alltraps>

00102322 <vector112>:
.globl vector112
vector112:
  pushl $0
  102322:	6a 00                	push   $0x0
  pushl $112
  102324:	6a 70                	push   $0x70
  jmp __alltraps
  102326:	e9 87 06 00 00       	jmp    1029b2 <__alltraps>

0010232b <vector113>:
.globl vector113
vector113:
  pushl $0
  10232b:	6a 00                	push   $0x0
  pushl $113
  10232d:	6a 71                	push   $0x71
  jmp __alltraps
  10232f:	e9 7e 06 00 00       	jmp    1029b2 <__alltraps>

00102334 <vector114>:
.globl vector114
vector114:
  pushl $0
  102334:	6a 00                	push   $0x0
  pushl $114
  102336:	6a 72                	push   $0x72
  jmp __alltraps
  102338:	e9 75 06 00 00       	jmp    1029b2 <__alltraps>

0010233d <vector115>:
.globl vector115
vector115:
  pushl $0
  10233d:	6a 00                	push   $0x0
  pushl $115
  10233f:	6a 73                	push   $0x73
  jmp __alltraps
  102341:	e9 6c 06 00 00       	jmp    1029b2 <__alltraps>

00102346 <vector116>:
.globl vector116
vector116:
  pushl $0
  102346:	6a 00                	push   $0x0
  pushl $116
  102348:	6a 74                	push   $0x74
  jmp __alltraps
  10234a:	e9 63 06 00 00       	jmp    1029b2 <__alltraps>

0010234f <vector117>:
.globl vector117
vector117:
  pushl $0
  10234f:	6a 00                	push   $0x0
  pushl $117
  102351:	6a 75                	push   $0x75
  jmp __alltraps
  102353:	e9 5a 06 00 00       	jmp    1029b2 <__alltraps>

00102358 <vector118>:
.globl vector118
vector118:
  pushl $0
  102358:	6a 00                	push   $0x0
  pushl $118
  10235a:	6a 76                	push   $0x76
  jmp __alltraps
  10235c:	e9 51 06 00 00       	jmp    1029b2 <__alltraps>

00102361 <vector119>:
.globl vector119
vector119:
  pushl $0
  102361:	6a 00                	push   $0x0
  pushl $119
  102363:	6a 77                	push   $0x77
  jmp __alltraps
  102365:	e9 48 06 00 00       	jmp    1029b2 <__alltraps>

0010236a <vector120>:
.globl vector120
vector120:
  pushl $0
  10236a:	6a 00                	push   $0x0
  pushl $120
  10236c:	6a 78                	push   $0x78
  jmp __alltraps
  10236e:	e9 3f 06 00 00       	jmp    1029b2 <__alltraps>

00102373 <vector121>:
.globl vector121
vector121:
  pushl $0
  102373:	6a 00                	push   $0x0
  pushl $121
  102375:	6a 79                	push   $0x79
  jmp __alltraps
  102377:	e9 36 06 00 00       	jmp    1029b2 <__alltraps>

0010237c <vector122>:
.globl vector122
vector122:
  pushl $0
  10237c:	6a 00                	push   $0x0
  pushl $122
  10237e:	6a 7a                	push   $0x7a
  jmp __alltraps
  102380:	e9 2d 06 00 00       	jmp    1029b2 <__alltraps>

00102385 <vector123>:
.globl vector123
vector123:
  pushl $0
  102385:	6a 00                	push   $0x0
  pushl $123
  102387:	6a 7b                	push   $0x7b
  jmp __alltraps
  102389:	e9 24 06 00 00       	jmp    1029b2 <__alltraps>

0010238e <vector124>:
.globl vector124
vector124:
  pushl $0
  10238e:	6a 00                	push   $0x0
  pushl $124
  102390:	6a 7c                	push   $0x7c
  jmp __alltraps
  102392:	e9 1b 06 00 00       	jmp    1029b2 <__alltraps>

00102397 <vector125>:
.globl vector125
vector125:
  pushl $0
  102397:	6a 00                	push   $0x0
  pushl $125
  102399:	6a 7d                	push   $0x7d
  jmp __alltraps
  10239b:	e9 12 06 00 00       	jmp    1029b2 <__alltraps>

001023a0 <vector126>:
.globl vector126
vector126:
  pushl $0
  1023a0:	6a 00                	push   $0x0
  pushl $126
  1023a2:	6a 7e                	push   $0x7e
  jmp __alltraps
  1023a4:	e9 09 06 00 00       	jmp    1029b2 <__alltraps>

001023a9 <vector127>:
.globl vector127
vector127:
  pushl $0
  1023a9:	6a 00                	push   $0x0
  pushl $127
  1023ab:	6a 7f                	push   $0x7f
  jmp __alltraps
  1023ad:	e9 00 06 00 00       	jmp    1029b2 <__alltraps>

001023b2 <vector128>:
.globl vector128
vector128:
  pushl $0
  1023b2:	6a 00                	push   $0x0
  pushl $128
  1023b4:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  1023b9:	e9 f4 05 00 00       	jmp    1029b2 <__alltraps>

001023be <vector129>:
.globl vector129
vector129:
  pushl $0
  1023be:	6a 00                	push   $0x0
  pushl $129
  1023c0:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  1023c5:	e9 e8 05 00 00       	jmp    1029b2 <__alltraps>

001023ca <vector130>:
.globl vector130
vector130:
  pushl $0
  1023ca:	6a 00                	push   $0x0
  pushl $130
  1023cc:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  1023d1:	e9 dc 05 00 00       	jmp    1029b2 <__alltraps>

001023d6 <vector131>:
.globl vector131
vector131:
  pushl $0
  1023d6:	6a 00                	push   $0x0
  pushl $131
  1023d8:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  1023dd:	e9 d0 05 00 00       	jmp    1029b2 <__alltraps>

001023e2 <vector132>:
.globl vector132
vector132:
  pushl $0
  1023e2:	6a 00                	push   $0x0
  pushl $132
  1023e4:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  1023e9:	e9 c4 05 00 00       	jmp    1029b2 <__alltraps>

001023ee <vector133>:
.globl vector133
vector133:
  pushl $0
  1023ee:	6a 00                	push   $0x0
  pushl $133
  1023f0:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  1023f5:	e9 b8 05 00 00       	jmp    1029b2 <__alltraps>

001023fa <vector134>:
.globl vector134
vector134:
  pushl $0
  1023fa:	6a 00                	push   $0x0
  pushl $134
  1023fc:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  102401:	e9 ac 05 00 00       	jmp    1029b2 <__alltraps>

00102406 <vector135>:
.globl vector135
vector135:
  pushl $0
  102406:	6a 00                	push   $0x0
  pushl $135
  102408:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  10240d:	e9 a0 05 00 00       	jmp    1029b2 <__alltraps>

00102412 <vector136>:
.globl vector136
vector136:
  pushl $0
  102412:	6a 00                	push   $0x0
  pushl $136
  102414:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  102419:	e9 94 05 00 00       	jmp    1029b2 <__alltraps>

0010241e <vector137>:
.globl vector137
vector137:
  pushl $0
  10241e:	6a 00                	push   $0x0
  pushl $137
  102420:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  102425:	e9 88 05 00 00       	jmp    1029b2 <__alltraps>

0010242a <vector138>:
.globl vector138
vector138:
  pushl $0
  10242a:	6a 00                	push   $0x0
  pushl $138
  10242c:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  102431:	e9 7c 05 00 00       	jmp    1029b2 <__alltraps>

00102436 <vector139>:
.globl vector139
vector139:
  pushl $0
  102436:	6a 00                	push   $0x0
  pushl $139
  102438:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  10243d:	e9 70 05 00 00       	jmp    1029b2 <__alltraps>

00102442 <vector140>:
.globl vector140
vector140:
  pushl $0
  102442:	6a 00                	push   $0x0
  pushl $140
  102444:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  102449:	e9 64 05 00 00       	jmp    1029b2 <__alltraps>

0010244e <vector141>:
.globl vector141
vector141:
  pushl $0
  10244e:	6a 00                	push   $0x0
  pushl $141
  102450:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  102455:	e9 58 05 00 00       	jmp    1029b2 <__alltraps>

0010245a <vector142>:
.globl vector142
vector142:
  pushl $0
  10245a:	6a 00                	push   $0x0
  pushl $142
  10245c:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  102461:	e9 4c 05 00 00       	jmp    1029b2 <__alltraps>

00102466 <vector143>:
.globl vector143
vector143:
  pushl $0
  102466:	6a 00                	push   $0x0
  pushl $143
  102468:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  10246d:	e9 40 05 00 00       	jmp    1029b2 <__alltraps>

00102472 <vector144>:
.globl vector144
vector144:
  pushl $0
  102472:	6a 00                	push   $0x0
  pushl $144
  102474:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  102479:	e9 34 05 00 00       	jmp    1029b2 <__alltraps>

0010247e <vector145>:
.globl vector145
vector145:
  pushl $0
  10247e:	6a 00                	push   $0x0
  pushl $145
  102480:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  102485:	e9 28 05 00 00       	jmp    1029b2 <__alltraps>

0010248a <vector146>:
.globl vector146
vector146:
  pushl $0
  10248a:	6a 00                	push   $0x0
  pushl $146
  10248c:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  102491:	e9 1c 05 00 00       	jmp    1029b2 <__alltraps>

00102496 <vector147>:
.globl vector147
vector147:
  pushl $0
  102496:	6a 00                	push   $0x0
  pushl $147
  102498:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  10249d:	e9 10 05 00 00       	jmp    1029b2 <__alltraps>

001024a2 <vector148>:
.globl vector148
vector148:
  pushl $0
  1024a2:	6a 00                	push   $0x0
  pushl $148
  1024a4:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  1024a9:	e9 04 05 00 00       	jmp    1029b2 <__alltraps>

001024ae <vector149>:
.globl vector149
vector149:
  pushl $0
  1024ae:	6a 00                	push   $0x0
  pushl $149
  1024b0:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  1024b5:	e9 f8 04 00 00       	jmp    1029b2 <__alltraps>

001024ba <vector150>:
.globl vector150
vector150:
  pushl $0
  1024ba:	6a 00                	push   $0x0
  pushl $150
  1024bc:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  1024c1:	e9 ec 04 00 00       	jmp    1029b2 <__alltraps>

001024c6 <vector151>:
.globl vector151
vector151:
  pushl $0
  1024c6:	6a 00                	push   $0x0
  pushl $151
  1024c8:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  1024cd:	e9 e0 04 00 00       	jmp    1029b2 <__alltraps>

001024d2 <vector152>:
.globl vector152
vector152:
  pushl $0
  1024d2:	6a 00                	push   $0x0
  pushl $152
  1024d4:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  1024d9:	e9 d4 04 00 00       	jmp    1029b2 <__alltraps>

001024de <vector153>:
.globl vector153
vector153:
  pushl $0
  1024de:	6a 00                	push   $0x0
  pushl $153
  1024e0:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  1024e5:	e9 c8 04 00 00       	jmp    1029b2 <__alltraps>

001024ea <vector154>:
.globl vector154
vector154:
  pushl $0
  1024ea:	6a 00                	push   $0x0
  pushl $154
  1024ec:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  1024f1:	e9 bc 04 00 00       	jmp    1029b2 <__alltraps>

001024f6 <vector155>:
.globl vector155
vector155:
  pushl $0
  1024f6:	6a 00                	push   $0x0
  pushl $155
  1024f8:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  1024fd:	e9 b0 04 00 00       	jmp    1029b2 <__alltraps>

00102502 <vector156>:
.globl vector156
vector156:
  pushl $0
  102502:	6a 00                	push   $0x0
  pushl $156
  102504:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  102509:	e9 a4 04 00 00       	jmp    1029b2 <__alltraps>

0010250e <vector157>:
.globl vector157
vector157:
  pushl $0
  10250e:	6a 00                	push   $0x0
  pushl $157
  102510:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  102515:	e9 98 04 00 00       	jmp    1029b2 <__alltraps>

0010251a <vector158>:
.globl vector158
vector158:
  pushl $0
  10251a:	6a 00                	push   $0x0
  pushl $158
  10251c:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  102521:	e9 8c 04 00 00       	jmp    1029b2 <__alltraps>

00102526 <vector159>:
.globl vector159
vector159:
  pushl $0
  102526:	6a 00                	push   $0x0
  pushl $159
  102528:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  10252d:	e9 80 04 00 00       	jmp    1029b2 <__alltraps>

00102532 <vector160>:
.globl vector160
vector160:
  pushl $0
  102532:	6a 00                	push   $0x0
  pushl $160
  102534:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  102539:	e9 74 04 00 00       	jmp    1029b2 <__alltraps>

0010253e <vector161>:
.globl vector161
vector161:
  pushl $0
  10253e:	6a 00                	push   $0x0
  pushl $161
  102540:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  102545:	e9 68 04 00 00       	jmp    1029b2 <__alltraps>

0010254a <vector162>:
.globl vector162
vector162:
  pushl $0
  10254a:	6a 00                	push   $0x0
  pushl $162
  10254c:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  102551:	e9 5c 04 00 00       	jmp    1029b2 <__alltraps>

00102556 <vector163>:
.globl vector163
vector163:
  pushl $0
  102556:	6a 00                	push   $0x0
  pushl $163
  102558:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  10255d:	e9 50 04 00 00       	jmp    1029b2 <__alltraps>

00102562 <vector164>:
.globl vector164
vector164:
  pushl $0
  102562:	6a 00                	push   $0x0
  pushl $164
  102564:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  102569:	e9 44 04 00 00       	jmp    1029b2 <__alltraps>

0010256e <vector165>:
.globl vector165
vector165:
  pushl $0
  10256e:	6a 00                	push   $0x0
  pushl $165
  102570:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  102575:	e9 38 04 00 00       	jmp    1029b2 <__alltraps>

0010257a <vector166>:
.globl vector166
vector166:
  pushl $0
  10257a:	6a 00                	push   $0x0
  pushl $166
  10257c:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  102581:	e9 2c 04 00 00       	jmp    1029b2 <__alltraps>

00102586 <vector167>:
.globl vector167
vector167:
  pushl $0
  102586:	6a 00                	push   $0x0
  pushl $167
  102588:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  10258d:	e9 20 04 00 00       	jmp    1029b2 <__alltraps>

00102592 <vector168>:
.globl vector168
vector168:
  pushl $0
  102592:	6a 00                	push   $0x0
  pushl $168
  102594:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  102599:	e9 14 04 00 00       	jmp    1029b2 <__alltraps>

0010259e <vector169>:
.globl vector169
vector169:
  pushl $0
  10259e:	6a 00                	push   $0x0
  pushl $169
  1025a0:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  1025a5:	e9 08 04 00 00       	jmp    1029b2 <__alltraps>

001025aa <vector170>:
.globl vector170
vector170:
  pushl $0
  1025aa:	6a 00                	push   $0x0
  pushl $170
  1025ac:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  1025b1:	e9 fc 03 00 00       	jmp    1029b2 <__alltraps>

001025b6 <vector171>:
.globl vector171
vector171:
  pushl $0
  1025b6:	6a 00                	push   $0x0
  pushl $171
  1025b8:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  1025bd:	e9 f0 03 00 00       	jmp    1029b2 <__alltraps>

001025c2 <vector172>:
.globl vector172
vector172:
  pushl $0
  1025c2:	6a 00                	push   $0x0
  pushl $172
  1025c4:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  1025c9:	e9 e4 03 00 00       	jmp    1029b2 <__alltraps>

001025ce <vector173>:
.globl vector173
vector173:
  pushl $0
  1025ce:	6a 00                	push   $0x0
  pushl $173
  1025d0:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  1025d5:	e9 d8 03 00 00       	jmp    1029b2 <__alltraps>

001025da <vector174>:
.globl vector174
vector174:
  pushl $0
  1025da:	6a 00                	push   $0x0
  pushl $174
  1025dc:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  1025e1:	e9 cc 03 00 00       	jmp    1029b2 <__alltraps>

001025e6 <vector175>:
.globl vector175
vector175:
  pushl $0
  1025e6:	6a 00                	push   $0x0
  pushl $175
  1025e8:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  1025ed:	e9 c0 03 00 00       	jmp    1029b2 <__alltraps>

001025f2 <vector176>:
.globl vector176
vector176:
  pushl $0
  1025f2:	6a 00                	push   $0x0
  pushl $176
  1025f4:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  1025f9:	e9 b4 03 00 00       	jmp    1029b2 <__alltraps>

001025fe <vector177>:
.globl vector177
vector177:
  pushl $0
  1025fe:	6a 00                	push   $0x0
  pushl $177
  102600:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  102605:	e9 a8 03 00 00       	jmp    1029b2 <__alltraps>

0010260a <vector178>:
.globl vector178
vector178:
  pushl $0
  10260a:	6a 00                	push   $0x0
  pushl $178
  10260c:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  102611:	e9 9c 03 00 00       	jmp    1029b2 <__alltraps>

00102616 <vector179>:
.globl vector179
vector179:
  pushl $0
  102616:	6a 00                	push   $0x0
  pushl $179
  102618:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  10261d:	e9 90 03 00 00       	jmp    1029b2 <__alltraps>

00102622 <vector180>:
.globl vector180
vector180:
  pushl $0
  102622:	6a 00                	push   $0x0
  pushl $180
  102624:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  102629:	e9 84 03 00 00       	jmp    1029b2 <__alltraps>

0010262e <vector181>:
.globl vector181
vector181:
  pushl $0
  10262e:	6a 00                	push   $0x0
  pushl $181
  102630:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  102635:	e9 78 03 00 00       	jmp    1029b2 <__alltraps>

0010263a <vector182>:
.globl vector182
vector182:
  pushl $0
  10263a:	6a 00                	push   $0x0
  pushl $182
  10263c:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  102641:	e9 6c 03 00 00       	jmp    1029b2 <__alltraps>

00102646 <vector183>:
.globl vector183
vector183:
  pushl $0
  102646:	6a 00                	push   $0x0
  pushl $183
  102648:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  10264d:	e9 60 03 00 00       	jmp    1029b2 <__alltraps>

00102652 <vector184>:
.globl vector184
vector184:
  pushl $0
  102652:	6a 00                	push   $0x0
  pushl $184
  102654:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  102659:	e9 54 03 00 00       	jmp    1029b2 <__alltraps>

0010265e <vector185>:
.globl vector185
vector185:
  pushl $0
  10265e:	6a 00                	push   $0x0
  pushl $185
  102660:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  102665:	e9 48 03 00 00       	jmp    1029b2 <__alltraps>

0010266a <vector186>:
.globl vector186
vector186:
  pushl $0
  10266a:	6a 00                	push   $0x0
  pushl $186
  10266c:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  102671:	e9 3c 03 00 00       	jmp    1029b2 <__alltraps>

00102676 <vector187>:
.globl vector187
vector187:
  pushl $0
  102676:	6a 00                	push   $0x0
  pushl $187
  102678:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  10267d:	e9 30 03 00 00       	jmp    1029b2 <__alltraps>

00102682 <vector188>:
.globl vector188
vector188:
  pushl $0
  102682:	6a 00                	push   $0x0
  pushl $188
  102684:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  102689:	e9 24 03 00 00       	jmp    1029b2 <__alltraps>

0010268e <vector189>:
.globl vector189
vector189:
  pushl $0
  10268e:	6a 00                	push   $0x0
  pushl $189
  102690:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  102695:	e9 18 03 00 00       	jmp    1029b2 <__alltraps>

0010269a <vector190>:
.globl vector190
vector190:
  pushl $0
  10269a:	6a 00                	push   $0x0
  pushl $190
  10269c:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  1026a1:	e9 0c 03 00 00       	jmp    1029b2 <__alltraps>

001026a6 <vector191>:
.globl vector191
vector191:
  pushl $0
  1026a6:	6a 00                	push   $0x0
  pushl $191
  1026a8:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  1026ad:	e9 00 03 00 00       	jmp    1029b2 <__alltraps>

001026b2 <vector192>:
.globl vector192
vector192:
  pushl $0
  1026b2:	6a 00                	push   $0x0
  pushl $192
  1026b4:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  1026b9:	e9 f4 02 00 00       	jmp    1029b2 <__alltraps>

001026be <vector193>:
.globl vector193
vector193:
  pushl $0
  1026be:	6a 00                	push   $0x0
  pushl $193
  1026c0:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  1026c5:	e9 e8 02 00 00       	jmp    1029b2 <__alltraps>

001026ca <vector194>:
.globl vector194
vector194:
  pushl $0
  1026ca:	6a 00                	push   $0x0
  pushl $194
  1026cc:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  1026d1:	e9 dc 02 00 00       	jmp    1029b2 <__alltraps>

001026d6 <vector195>:
.globl vector195
vector195:
  pushl $0
  1026d6:	6a 00                	push   $0x0
  pushl $195
  1026d8:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  1026dd:	e9 d0 02 00 00       	jmp    1029b2 <__alltraps>

001026e2 <vector196>:
.globl vector196
vector196:
  pushl $0
  1026e2:	6a 00                	push   $0x0
  pushl $196
  1026e4:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  1026e9:	e9 c4 02 00 00       	jmp    1029b2 <__alltraps>

001026ee <vector197>:
.globl vector197
vector197:
  pushl $0
  1026ee:	6a 00                	push   $0x0
  pushl $197
  1026f0:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  1026f5:	e9 b8 02 00 00       	jmp    1029b2 <__alltraps>

001026fa <vector198>:
.globl vector198
vector198:
  pushl $0
  1026fa:	6a 00                	push   $0x0
  pushl $198
  1026fc:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  102701:	e9 ac 02 00 00       	jmp    1029b2 <__alltraps>

00102706 <vector199>:
.globl vector199
vector199:
  pushl $0
  102706:	6a 00                	push   $0x0
  pushl $199
  102708:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  10270d:	e9 a0 02 00 00       	jmp    1029b2 <__alltraps>

00102712 <vector200>:
.globl vector200
vector200:
  pushl $0
  102712:	6a 00                	push   $0x0
  pushl $200
  102714:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  102719:	e9 94 02 00 00       	jmp    1029b2 <__alltraps>

0010271e <vector201>:
.globl vector201
vector201:
  pushl $0
  10271e:	6a 00                	push   $0x0
  pushl $201
  102720:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  102725:	e9 88 02 00 00       	jmp    1029b2 <__alltraps>

0010272a <vector202>:
.globl vector202
vector202:
  pushl $0
  10272a:	6a 00                	push   $0x0
  pushl $202
  10272c:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  102731:	e9 7c 02 00 00       	jmp    1029b2 <__alltraps>

00102736 <vector203>:
.globl vector203
vector203:
  pushl $0
  102736:	6a 00                	push   $0x0
  pushl $203
  102738:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  10273d:	e9 70 02 00 00       	jmp    1029b2 <__alltraps>

00102742 <vector204>:
.globl vector204
vector204:
  pushl $0
  102742:	6a 00                	push   $0x0
  pushl $204
  102744:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  102749:	e9 64 02 00 00       	jmp    1029b2 <__alltraps>

0010274e <vector205>:
.globl vector205
vector205:
  pushl $0
  10274e:	6a 00                	push   $0x0
  pushl $205
  102750:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  102755:	e9 58 02 00 00       	jmp    1029b2 <__alltraps>

0010275a <vector206>:
.globl vector206
vector206:
  pushl $0
  10275a:	6a 00                	push   $0x0
  pushl $206
  10275c:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  102761:	e9 4c 02 00 00       	jmp    1029b2 <__alltraps>

00102766 <vector207>:
.globl vector207
vector207:
  pushl $0
  102766:	6a 00                	push   $0x0
  pushl $207
  102768:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  10276d:	e9 40 02 00 00       	jmp    1029b2 <__alltraps>

00102772 <vector208>:
.globl vector208
vector208:
  pushl $0
  102772:	6a 00                	push   $0x0
  pushl $208
  102774:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  102779:	e9 34 02 00 00       	jmp    1029b2 <__alltraps>

0010277e <vector209>:
.globl vector209
vector209:
  pushl $0
  10277e:	6a 00                	push   $0x0
  pushl $209
  102780:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  102785:	e9 28 02 00 00       	jmp    1029b2 <__alltraps>

0010278a <vector210>:
.globl vector210
vector210:
  pushl $0
  10278a:	6a 00                	push   $0x0
  pushl $210
  10278c:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  102791:	e9 1c 02 00 00       	jmp    1029b2 <__alltraps>

00102796 <vector211>:
.globl vector211
vector211:
  pushl $0
  102796:	6a 00                	push   $0x0
  pushl $211
  102798:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  10279d:	e9 10 02 00 00       	jmp    1029b2 <__alltraps>

001027a2 <vector212>:
.globl vector212
vector212:
  pushl $0
  1027a2:	6a 00                	push   $0x0
  pushl $212
  1027a4:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  1027a9:	e9 04 02 00 00       	jmp    1029b2 <__alltraps>

001027ae <vector213>:
.globl vector213
vector213:
  pushl $0
  1027ae:	6a 00                	push   $0x0
  pushl $213
  1027b0:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  1027b5:	e9 f8 01 00 00       	jmp    1029b2 <__alltraps>

001027ba <vector214>:
.globl vector214
vector214:
  pushl $0
  1027ba:	6a 00                	push   $0x0
  pushl $214
  1027bc:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  1027c1:	e9 ec 01 00 00       	jmp    1029b2 <__alltraps>

001027c6 <vector215>:
.globl vector215
vector215:
  pushl $0
  1027c6:	6a 00                	push   $0x0
  pushl $215
  1027c8:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  1027cd:	e9 e0 01 00 00       	jmp    1029b2 <__alltraps>

001027d2 <vector216>:
.globl vector216
vector216:
  pushl $0
  1027d2:	6a 00                	push   $0x0
  pushl $216
  1027d4:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  1027d9:	e9 d4 01 00 00       	jmp    1029b2 <__alltraps>

001027de <vector217>:
.globl vector217
vector217:
  pushl $0
  1027de:	6a 00                	push   $0x0
  pushl $217
  1027e0:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  1027e5:	e9 c8 01 00 00       	jmp    1029b2 <__alltraps>

001027ea <vector218>:
.globl vector218
vector218:
  pushl $0
  1027ea:	6a 00                	push   $0x0
  pushl $218
  1027ec:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  1027f1:	e9 bc 01 00 00       	jmp    1029b2 <__alltraps>

001027f6 <vector219>:
.globl vector219
vector219:
  pushl $0
  1027f6:	6a 00                	push   $0x0
  pushl $219
  1027f8:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  1027fd:	e9 b0 01 00 00       	jmp    1029b2 <__alltraps>

00102802 <vector220>:
.globl vector220
vector220:
  pushl $0
  102802:	6a 00                	push   $0x0
  pushl $220
  102804:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  102809:	e9 a4 01 00 00       	jmp    1029b2 <__alltraps>

0010280e <vector221>:
.globl vector221
vector221:
  pushl $0
  10280e:	6a 00                	push   $0x0
  pushl $221
  102810:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  102815:	e9 98 01 00 00       	jmp    1029b2 <__alltraps>

0010281a <vector222>:
.globl vector222
vector222:
  pushl $0
  10281a:	6a 00                	push   $0x0
  pushl $222
  10281c:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  102821:	e9 8c 01 00 00       	jmp    1029b2 <__alltraps>

00102826 <vector223>:
.globl vector223
vector223:
  pushl $0
  102826:	6a 00                	push   $0x0
  pushl $223
  102828:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  10282d:	e9 80 01 00 00       	jmp    1029b2 <__alltraps>

00102832 <vector224>:
.globl vector224
vector224:
  pushl $0
  102832:	6a 00                	push   $0x0
  pushl $224
  102834:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  102839:	e9 74 01 00 00       	jmp    1029b2 <__alltraps>

0010283e <vector225>:
.globl vector225
vector225:
  pushl $0
  10283e:	6a 00                	push   $0x0
  pushl $225
  102840:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  102845:	e9 68 01 00 00       	jmp    1029b2 <__alltraps>

0010284a <vector226>:
.globl vector226
vector226:
  pushl $0
  10284a:	6a 00                	push   $0x0
  pushl $226
  10284c:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  102851:	e9 5c 01 00 00       	jmp    1029b2 <__alltraps>

00102856 <vector227>:
.globl vector227
vector227:
  pushl $0
  102856:	6a 00                	push   $0x0
  pushl $227
  102858:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  10285d:	e9 50 01 00 00       	jmp    1029b2 <__alltraps>

00102862 <vector228>:
.globl vector228
vector228:
  pushl $0
  102862:	6a 00                	push   $0x0
  pushl $228
  102864:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  102869:	e9 44 01 00 00       	jmp    1029b2 <__alltraps>

0010286e <vector229>:
.globl vector229
vector229:
  pushl $0
  10286e:	6a 00                	push   $0x0
  pushl $229
  102870:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  102875:	e9 38 01 00 00       	jmp    1029b2 <__alltraps>

0010287a <vector230>:
.globl vector230
vector230:
  pushl $0
  10287a:	6a 00                	push   $0x0
  pushl $230
  10287c:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  102881:	e9 2c 01 00 00       	jmp    1029b2 <__alltraps>

00102886 <vector231>:
.globl vector231
vector231:
  pushl $0
  102886:	6a 00                	push   $0x0
  pushl $231
  102888:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  10288d:	e9 20 01 00 00       	jmp    1029b2 <__alltraps>

00102892 <vector232>:
.globl vector232
vector232:
  pushl $0
  102892:	6a 00                	push   $0x0
  pushl $232
  102894:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  102899:	e9 14 01 00 00       	jmp    1029b2 <__alltraps>

0010289e <vector233>:
.globl vector233
vector233:
  pushl $0
  10289e:	6a 00                	push   $0x0
  pushl $233
  1028a0:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  1028a5:	e9 08 01 00 00       	jmp    1029b2 <__alltraps>

001028aa <vector234>:
.globl vector234
vector234:
  pushl $0
  1028aa:	6a 00                	push   $0x0
  pushl $234
  1028ac:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  1028b1:	e9 fc 00 00 00       	jmp    1029b2 <__alltraps>

001028b6 <vector235>:
.globl vector235
vector235:
  pushl $0
  1028b6:	6a 00                	push   $0x0
  pushl $235
  1028b8:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  1028bd:	e9 f0 00 00 00       	jmp    1029b2 <__alltraps>

001028c2 <vector236>:
.globl vector236
vector236:
  pushl $0
  1028c2:	6a 00                	push   $0x0
  pushl $236
  1028c4:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  1028c9:	e9 e4 00 00 00       	jmp    1029b2 <__alltraps>

001028ce <vector237>:
.globl vector237
vector237:
  pushl $0
  1028ce:	6a 00                	push   $0x0
  pushl $237
  1028d0:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  1028d5:	e9 d8 00 00 00       	jmp    1029b2 <__alltraps>

001028da <vector238>:
.globl vector238
vector238:
  pushl $0
  1028da:	6a 00                	push   $0x0
  pushl $238
  1028dc:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  1028e1:	e9 cc 00 00 00       	jmp    1029b2 <__alltraps>

001028e6 <vector239>:
.globl vector239
vector239:
  pushl $0
  1028e6:	6a 00                	push   $0x0
  pushl $239
  1028e8:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  1028ed:	e9 c0 00 00 00       	jmp    1029b2 <__alltraps>

001028f2 <vector240>:
.globl vector240
vector240:
  pushl $0
  1028f2:	6a 00                	push   $0x0
  pushl $240
  1028f4:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  1028f9:	e9 b4 00 00 00       	jmp    1029b2 <__alltraps>

001028fe <vector241>:
.globl vector241
vector241:
  pushl $0
  1028fe:	6a 00                	push   $0x0
  pushl $241
  102900:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  102905:	e9 a8 00 00 00       	jmp    1029b2 <__alltraps>

0010290a <vector242>:
.globl vector242
vector242:
  pushl $0
  10290a:	6a 00                	push   $0x0
  pushl $242
  10290c:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  102911:	e9 9c 00 00 00       	jmp    1029b2 <__alltraps>

00102916 <vector243>:
.globl vector243
vector243:
  pushl $0
  102916:	6a 00                	push   $0x0
  pushl $243
  102918:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  10291d:	e9 90 00 00 00       	jmp    1029b2 <__alltraps>

00102922 <vector244>:
.globl vector244
vector244:
  pushl $0
  102922:	6a 00                	push   $0x0
  pushl $244
  102924:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  102929:	e9 84 00 00 00       	jmp    1029b2 <__alltraps>

0010292e <vector245>:
.globl vector245
vector245:
  pushl $0
  10292e:	6a 00                	push   $0x0
  pushl $245
  102930:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  102935:	e9 78 00 00 00       	jmp    1029b2 <__alltraps>

0010293a <vector246>:
.globl vector246
vector246:
  pushl $0
  10293a:	6a 00                	push   $0x0
  pushl $246
  10293c:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  102941:	e9 6c 00 00 00       	jmp    1029b2 <__alltraps>

00102946 <vector247>:
.globl vector247
vector247:
  pushl $0
  102946:	6a 00                	push   $0x0
  pushl $247
  102948:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  10294d:	e9 60 00 00 00       	jmp    1029b2 <__alltraps>

00102952 <vector248>:
.globl vector248
vector248:
  pushl $0
  102952:	6a 00                	push   $0x0
  pushl $248
  102954:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  102959:	e9 54 00 00 00       	jmp    1029b2 <__alltraps>

0010295e <vector249>:
.globl vector249
vector249:
  pushl $0
  10295e:	6a 00                	push   $0x0
  pushl $249
  102960:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  102965:	e9 48 00 00 00       	jmp    1029b2 <__alltraps>

0010296a <vector250>:
.globl vector250
vector250:
  pushl $0
  10296a:	6a 00                	push   $0x0
  pushl $250
  10296c:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  102971:	e9 3c 00 00 00       	jmp    1029b2 <__alltraps>

00102976 <vector251>:
.globl vector251
vector251:
  pushl $0
  102976:	6a 00                	push   $0x0
  pushl $251
  102978:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  10297d:	e9 30 00 00 00       	jmp    1029b2 <__alltraps>

00102982 <vector252>:
.globl vector252
vector252:
  pushl $0
  102982:	6a 00                	push   $0x0
  pushl $252
  102984:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  102989:	e9 24 00 00 00       	jmp    1029b2 <__alltraps>

0010298e <vector253>:
.globl vector253
vector253:
  pushl $0
  10298e:	6a 00                	push   $0x0
  pushl $253
  102990:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  102995:	e9 18 00 00 00       	jmp    1029b2 <__alltraps>

0010299a <vector254>:
.globl vector254
vector254:
  pushl $0
  10299a:	6a 00                	push   $0x0
  pushl $254
  10299c:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  1029a1:	e9 0c 00 00 00       	jmp    1029b2 <__alltraps>

001029a6 <vector255>:
.globl vector255
vector255:
  pushl $0
  1029a6:	6a 00                	push   $0x0
  pushl $255
  1029a8:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  1029ad:	e9 00 00 00 00       	jmp    1029b2 <__alltraps>

001029b2 <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  1029b2:	1e                   	push   %ds
    pushl %es
  1029b3:	06                   	push   %es
    pushl %fs
  1029b4:	0f a0                	push   %fs
    pushl %gs
  1029b6:	0f a8                	push   %gs
    pushal
  1029b8:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  1029b9:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  1029be:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  1029c0:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  1029c2:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  1029c3:	e8 64 f5 ff ff       	call   101f2c <trap>

    # pop the pushed stack pointer
    popl %esp
  1029c8:	5c                   	pop    %esp

001029c9 <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  1029c9:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  1029ca:	0f a9                	pop    %gs
    popl %fs
  1029cc:	0f a1                	pop    %fs
    popl %es
  1029ce:	07                   	pop    %es
    popl %ds
  1029cf:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  1029d0:	83 c4 08             	add    $0x8,%esp
    iret
  1029d3:	cf                   	iret   

001029d4 <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  1029d4:	55                   	push   %ebp
  1029d5:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  1029d7:	8b 45 08             	mov    0x8(%ebp),%eax
  1029da:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  1029dd:	b8 23 00 00 00       	mov    $0x23,%eax
  1029e2:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  1029e4:	b8 23 00 00 00       	mov    $0x23,%eax
  1029e9:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  1029eb:	b8 10 00 00 00       	mov    $0x10,%eax
  1029f0:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  1029f2:	b8 10 00 00 00       	mov    $0x10,%eax
  1029f7:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  1029f9:	b8 10 00 00 00       	mov    $0x10,%eax
  1029fe:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  102a00:	ea 07 2a 10 00 08 00 	ljmp   $0x8,$0x102a07
}
  102a07:	90                   	nop
  102a08:	5d                   	pop    %ebp
  102a09:	c3                   	ret    

00102a0a <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  102a0a:	55                   	push   %ebp
  102a0b:	89 e5                	mov    %esp,%ebp
  102a0d:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  102a10:	b8 20 f9 10 00       	mov    $0x10f920,%eax
  102a15:	05 00 04 00 00       	add    $0x400,%eax
  102a1a:	a3 a4 f8 10 00       	mov    %eax,0x10f8a4
    ts.ts_ss0 = KERNEL_DS;
  102a1f:	66 c7 05 a8 f8 10 00 	movw   $0x10,0x10f8a8
  102a26:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  102a28:	66 c7 05 08 ea 10 00 	movw   $0x68,0x10ea08
  102a2f:	68 00 
  102a31:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  102a36:	0f b7 c0             	movzwl %ax,%eax
  102a39:	66 a3 0a ea 10 00    	mov    %ax,0x10ea0a
  102a3f:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  102a44:	c1 e8 10             	shr    $0x10,%eax
  102a47:	a2 0c ea 10 00       	mov    %al,0x10ea0c
  102a4c:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102a53:	24 f0                	and    $0xf0,%al
  102a55:	0c 09                	or     $0x9,%al
  102a57:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102a5c:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102a63:	0c 10                	or     $0x10,%al
  102a65:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102a6a:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102a71:	24 9f                	and    $0x9f,%al
  102a73:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102a78:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102a7f:	0c 80                	or     $0x80,%al
  102a81:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102a86:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a8d:	24 f0                	and    $0xf0,%al
  102a8f:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a94:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a9b:	24 ef                	and    $0xef,%al
  102a9d:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102aa2:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102aa9:	24 df                	and    $0xdf,%al
  102aab:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102ab0:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102ab7:	0c 40                	or     $0x40,%al
  102ab9:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102abe:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102ac5:	24 7f                	and    $0x7f,%al
  102ac7:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102acc:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  102ad1:	c1 e8 18             	shr    $0x18,%eax
  102ad4:	a2 0f ea 10 00       	mov    %al,0x10ea0f
    gdt[SEG_TSS].sd_s = 0;
  102ad9:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102ae0:	24 ef                	and    $0xef,%al
  102ae2:	a2 0d ea 10 00       	mov    %al,0x10ea0d

    // reload all segment registers
    lgdt(&gdt_pd);
  102ae7:	c7 04 24 10 ea 10 00 	movl   $0x10ea10,(%esp)
  102aee:	e8 e1 fe ff ff       	call   1029d4 <lgdt>
  102af3:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
    asm volatile ("cli");
}

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102af9:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102afd:	0f 00 d8             	ltr    %ax

    // load the TSS
    ltr(GD_TSS);
}
  102b00:	90                   	nop
  102b01:	c9                   	leave  
  102b02:	c3                   	ret    

00102b03 <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  102b03:	55                   	push   %ebp
  102b04:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102b06:	e8 ff fe ff ff       	call   102a0a <gdt_init>
}
  102b0b:	90                   	nop
  102b0c:	5d                   	pop    %ebp
  102b0d:	c3                   	ret    

00102b0e <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  102b0e:	55                   	push   %ebp
  102b0f:	89 e5                	mov    %esp,%ebp
  102b11:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102b14:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  102b1b:	eb 03                	jmp    102b20 <strlen+0x12>
        cnt ++;
  102b1d:	ff 45 fc             	incl   -0x4(%ebp)
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
    size_t cnt = 0;
    while (*s ++ != '\0') {
  102b20:	8b 45 08             	mov    0x8(%ebp),%eax
  102b23:	8d 50 01             	lea    0x1(%eax),%edx
  102b26:	89 55 08             	mov    %edx,0x8(%ebp)
  102b29:	0f b6 00             	movzbl (%eax),%eax
  102b2c:	84 c0                	test   %al,%al
  102b2e:	75 ed                	jne    102b1d <strlen+0xf>
        cnt ++;
    }
    return cnt;
  102b30:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102b33:	c9                   	leave  
  102b34:	c3                   	ret    

00102b35 <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  102b35:	55                   	push   %ebp
  102b36:	89 e5                	mov    %esp,%ebp
  102b38:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102b3b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102b42:	eb 03                	jmp    102b47 <strnlen+0x12>
        cnt ++;
  102b44:	ff 45 fc             	incl   -0x4(%ebp)
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
    size_t cnt = 0;
    while (cnt < len && *s ++ != '\0') {
  102b47:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b4a:	3b 45 0c             	cmp    0xc(%ebp),%eax
  102b4d:	73 10                	jae    102b5f <strnlen+0x2a>
  102b4f:	8b 45 08             	mov    0x8(%ebp),%eax
  102b52:	8d 50 01             	lea    0x1(%eax),%edx
  102b55:	89 55 08             	mov    %edx,0x8(%ebp)
  102b58:	0f b6 00             	movzbl (%eax),%eax
  102b5b:	84 c0                	test   %al,%al
  102b5d:	75 e5                	jne    102b44 <strnlen+0xf>
        cnt ++;
    }
    return cnt;
  102b5f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102b62:	c9                   	leave  
  102b63:	c3                   	ret    

00102b64 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  102b64:	55                   	push   %ebp
  102b65:	89 e5                	mov    %esp,%ebp
  102b67:	57                   	push   %edi
  102b68:	56                   	push   %esi
  102b69:	83 ec 20             	sub    $0x20,%esp
  102b6c:	8b 45 08             	mov    0x8(%ebp),%eax
  102b6f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102b72:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b75:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  102b78:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102b7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102b7e:	89 d1                	mov    %edx,%ecx
  102b80:	89 c2                	mov    %eax,%edx
  102b82:	89 ce                	mov    %ecx,%esi
  102b84:	89 d7                	mov    %edx,%edi
  102b86:	ac                   	lods   %ds:(%esi),%al
  102b87:	aa                   	stos   %al,%es:(%edi)
  102b88:	84 c0                	test   %al,%al
  102b8a:	75 fa                	jne    102b86 <strcpy+0x22>
  102b8c:	89 fa                	mov    %edi,%edx
  102b8e:	89 f1                	mov    %esi,%ecx
  102b90:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102b93:	89 55 e8             	mov    %edx,-0x18(%ebp)
  102b96:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  102b99:	8b 45 f4             	mov    -0xc(%ebp),%eax
#ifdef __HAVE_ARCH_STRCPY
    return __strcpy(dst, src);
  102b9c:	90                   	nop
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  102b9d:	83 c4 20             	add    $0x20,%esp
  102ba0:	5e                   	pop    %esi
  102ba1:	5f                   	pop    %edi
  102ba2:	5d                   	pop    %ebp
  102ba3:	c3                   	ret    

00102ba4 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  102ba4:	55                   	push   %ebp
  102ba5:	89 e5                	mov    %esp,%ebp
  102ba7:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  102baa:	8b 45 08             	mov    0x8(%ebp),%eax
  102bad:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  102bb0:	eb 1e                	jmp    102bd0 <strncpy+0x2c>
        if ((*p = *src) != '\0') {
  102bb2:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bb5:	0f b6 10             	movzbl (%eax),%edx
  102bb8:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102bbb:	88 10                	mov    %dl,(%eax)
  102bbd:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102bc0:	0f b6 00             	movzbl (%eax),%eax
  102bc3:	84 c0                	test   %al,%al
  102bc5:	74 03                	je     102bca <strncpy+0x26>
            src ++;
  102bc7:	ff 45 0c             	incl   0xc(%ebp)
        }
        p ++, len --;
  102bca:	ff 45 fc             	incl   -0x4(%ebp)
  102bcd:	ff 4d 10             	decl   0x10(%ebp)
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
    char *p = dst;
    while (len > 0) {
  102bd0:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102bd4:	75 dc                	jne    102bb2 <strncpy+0xe>
        if ((*p = *src) != '\0') {
            src ++;
        }
        p ++, len --;
    }
    return dst;
  102bd6:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102bd9:	c9                   	leave  
  102bda:	c3                   	ret    

00102bdb <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  102bdb:	55                   	push   %ebp
  102bdc:	89 e5                	mov    %esp,%ebp
  102bde:	57                   	push   %edi
  102bdf:	56                   	push   %esi
  102be0:	83 ec 20             	sub    $0x20,%esp
  102be3:	8b 45 08             	mov    0x8(%ebp),%eax
  102be6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102be9:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bec:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCMP
#define __HAVE_ARCH_STRCMP
static inline int
__strcmp(const char *s1, const char *s2) {
    int d0, d1, ret;
    asm volatile (
  102bef:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102bf2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102bf5:	89 d1                	mov    %edx,%ecx
  102bf7:	89 c2                	mov    %eax,%edx
  102bf9:	89 ce                	mov    %ecx,%esi
  102bfb:	89 d7                	mov    %edx,%edi
  102bfd:	ac                   	lods   %ds:(%esi),%al
  102bfe:	ae                   	scas   %es:(%edi),%al
  102bff:	75 08                	jne    102c09 <strcmp+0x2e>
  102c01:	84 c0                	test   %al,%al
  102c03:	75 f8                	jne    102bfd <strcmp+0x22>
  102c05:	31 c0                	xor    %eax,%eax
  102c07:	eb 04                	jmp    102c0d <strcmp+0x32>
  102c09:	19 c0                	sbb    %eax,%eax
  102c0b:	0c 01                	or     $0x1,%al
  102c0d:	89 fa                	mov    %edi,%edx
  102c0f:	89 f1                	mov    %esi,%ecx
  102c11:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102c14:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102c17:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            "orb $1, %%al;"
            "3:"
            : "=a" (ret), "=&S" (d0), "=&D" (d1)
            : "1" (s1), "2" (s2)
            : "memory");
    return ret;
  102c1a:	8b 45 ec             	mov    -0x14(%ebp),%eax
#ifdef __HAVE_ARCH_STRCMP
    return __strcmp(s1, s2);
  102c1d:	90                   	nop
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  102c1e:	83 c4 20             	add    $0x20,%esp
  102c21:	5e                   	pop    %esi
  102c22:	5f                   	pop    %edi
  102c23:	5d                   	pop    %ebp
  102c24:	c3                   	ret    

00102c25 <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  102c25:	55                   	push   %ebp
  102c26:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102c28:	eb 09                	jmp    102c33 <strncmp+0xe>
        n --, s1 ++, s2 ++;
  102c2a:	ff 4d 10             	decl   0x10(%ebp)
  102c2d:	ff 45 08             	incl   0x8(%ebp)
  102c30:	ff 45 0c             	incl   0xc(%ebp)
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102c33:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102c37:	74 1a                	je     102c53 <strncmp+0x2e>
  102c39:	8b 45 08             	mov    0x8(%ebp),%eax
  102c3c:	0f b6 00             	movzbl (%eax),%eax
  102c3f:	84 c0                	test   %al,%al
  102c41:	74 10                	je     102c53 <strncmp+0x2e>
  102c43:	8b 45 08             	mov    0x8(%ebp),%eax
  102c46:	0f b6 10             	movzbl (%eax),%edx
  102c49:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c4c:	0f b6 00             	movzbl (%eax),%eax
  102c4f:	38 c2                	cmp    %al,%dl
  102c51:	74 d7                	je     102c2a <strncmp+0x5>
        n --, s1 ++, s2 ++;
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  102c53:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102c57:	74 18                	je     102c71 <strncmp+0x4c>
  102c59:	8b 45 08             	mov    0x8(%ebp),%eax
  102c5c:	0f b6 00             	movzbl (%eax),%eax
  102c5f:	0f b6 d0             	movzbl %al,%edx
  102c62:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c65:	0f b6 00             	movzbl (%eax),%eax
  102c68:	0f b6 c0             	movzbl %al,%eax
  102c6b:	29 c2                	sub    %eax,%edx
  102c6d:	89 d0                	mov    %edx,%eax
  102c6f:	eb 05                	jmp    102c76 <strncmp+0x51>
  102c71:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102c76:	5d                   	pop    %ebp
  102c77:	c3                   	ret    

00102c78 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  102c78:	55                   	push   %ebp
  102c79:	89 e5                	mov    %esp,%ebp
  102c7b:	83 ec 04             	sub    $0x4,%esp
  102c7e:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c81:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102c84:	eb 13                	jmp    102c99 <strchr+0x21>
        if (*s == c) {
  102c86:	8b 45 08             	mov    0x8(%ebp),%eax
  102c89:	0f b6 00             	movzbl (%eax),%eax
  102c8c:	3a 45 fc             	cmp    -0x4(%ebp),%al
  102c8f:	75 05                	jne    102c96 <strchr+0x1e>
            return (char *)s;
  102c91:	8b 45 08             	mov    0x8(%ebp),%eax
  102c94:	eb 12                	jmp    102ca8 <strchr+0x30>
        }
        s ++;
  102c96:	ff 45 08             	incl   0x8(%ebp)
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
    while (*s != '\0') {
  102c99:	8b 45 08             	mov    0x8(%ebp),%eax
  102c9c:	0f b6 00             	movzbl (%eax),%eax
  102c9f:	84 c0                	test   %al,%al
  102ca1:	75 e3                	jne    102c86 <strchr+0xe>
        if (*s == c) {
            return (char *)s;
        }
        s ++;
    }
    return NULL;
  102ca3:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102ca8:	c9                   	leave  
  102ca9:	c3                   	ret    

00102caa <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  102caa:	55                   	push   %ebp
  102cab:	89 e5                	mov    %esp,%ebp
  102cad:	83 ec 04             	sub    $0x4,%esp
  102cb0:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cb3:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102cb6:	eb 0e                	jmp    102cc6 <strfind+0x1c>
        if (*s == c) {
  102cb8:	8b 45 08             	mov    0x8(%ebp),%eax
  102cbb:	0f b6 00             	movzbl (%eax),%eax
  102cbe:	3a 45 fc             	cmp    -0x4(%ebp),%al
  102cc1:	74 0f                	je     102cd2 <strfind+0x28>
            break;
        }
        s ++;
  102cc3:	ff 45 08             	incl   0x8(%ebp)
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
    while (*s != '\0') {
  102cc6:	8b 45 08             	mov    0x8(%ebp),%eax
  102cc9:	0f b6 00             	movzbl (%eax),%eax
  102ccc:	84 c0                	test   %al,%al
  102cce:	75 e8                	jne    102cb8 <strfind+0xe>
  102cd0:	eb 01                	jmp    102cd3 <strfind+0x29>
        if (*s == c) {
            break;
  102cd2:	90                   	nop
        }
        s ++;
    }
    return (char *)s;
  102cd3:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102cd6:	c9                   	leave  
  102cd7:	c3                   	ret    

00102cd8 <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  102cd8:	55                   	push   %ebp
  102cd9:	89 e5                	mov    %esp,%ebp
  102cdb:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  102cde:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  102ce5:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102cec:	eb 03                	jmp    102cf1 <strtol+0x19>
        s ++;
  102cee:	ff 45 08             	incl   0x8(%ebp)
strtol(const char *s, char **endptr, int base) {
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102cf1:	8b 45 08             	mov    0x8(%ebp),%eax
  102cf4:	0f b6 00             	movzbl (%eax),%eax
  102cf7:	3c 20                	cmp    $0x20,%al
  102cf9:	74 f3                	je     102cee <strtol+0x16>
  102cfb:	8b 45 08             	mov    0x8(%ebp),%eax
  102cfe:	0f b6 00             	movzbl (%eax),%eax
  102d01:	3c 09                	cmp    $0x9,%al
  102d03:	74 e9                	je     102cee <strtol+0x16>
        s ++;
    }

    // plus/minus sign
    if (*s == '+') {
  102d05:	8b 45 08             	mov    0x8(%ebp),%eax
  102d08:	0f b6 00             	movzbl (%eax),%eax
  102d0b:	3c 2b                	cmp    $0x2b,%al
  102d0d:	75 05                	jne    102d14 <strtol+0x3c>
        s ++;
  102d0f:	ff 45 08             	incl   0x8(%ebp)
  102d12:	eb 14                	jmp    102d28 <strtol+0x50>
    }
    else if (*s == '-') {
  102d14:	8b 45 08             	mov    0x8(%ebp),%eax
  102d17:	0f b6 00             	movzbl (%eax),%eax
  102d1a:	3c 2d                	cmp    $0x2d,%al
  102d1c:	75 0a                	jne    102d28 <strtol+0x50>
        s ++, neg = 1;
  102d1e:	ff 45 08             	incl   0x8(%ebp)
  102d21:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  102d28:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102d2c:	74 06                	je     102d34 <strtol+0x5c>
  102d2e:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  102d32:	75 22                	jne    102d56 <strtol+0x7e>
  102d34:	8b 45 08             	mov    0x8(%ebp),%eax
  102d37:	0f b6 00             	movzbl (%eax),%eax
  102d3a:	3c 30                	cmp    $0x30,%al
  102d3c:	75 18                	jne    102d56 <strtol+0x7e>
  102d3e:	8b 45 08             	mov    0x8(%ebp),%eax
  102d41:	40                   	inc    %eax
  102d42:	0f b6 00             	movzbl (%eax),%eax
  102d45:	3c 78                	cmp    $0x78,%al
  102d47:	75 0d                	jne    102d56 <strtol+0x7e>
        s += 2, base = 16;
  102d49:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  102d4d:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  102d54:	eb 29                	jmp    102d7f <strtol+0xa7>
    }
    else if (base == 0 && s[0] == '0') {
  102d56:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102d5a:	75 16                	jne    102d72 <strtol+0x9a>
  102d5c:	8b 45 08             	mov    0x8(%ebp),%eax
  102d5f:	0f b6 00             	movzbl (%eax),%eax
  102d62:	3c 30                	cmp    $0x30,%al
  102d64:	75 0c                	jne    102d72 <strtol+0x9a>
        s ++, base = 8;
  102d66:	ff 45 08             	incl   0x8(%ebp)
  102d69:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  102d70:	eb 0d                	jmp    102d7f <strtol+0xa7>
    }
    else if (base == 0) {
  102d72:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102d76:	75 07                	jne    102d7f <strtol+0xa7>
        base = 10;
  102d78:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  102d7f:	8b 45 08             	mov    0x8(%ebp),%eax
  102d82:	0f b6 00             	movzbl (%eax),%eax
  102d85:	3c 2f                	cmp    $0x2f,%al
  102d87:	7e 1b                	jle    102da4 <strtol+0xcc>
  102d89:	8b 45 08             	mov    0x8(%ebp),%eax
  102d8c:	0f b6 00             	movzbl (%eax),%eax
  102d8f:	3c 39                	cmp    $0x39,%al
  102d91:	7f 11                	jg     102da4 <strtol+0xcc>
            dig = *s - '0';
  102d93:	8b 45 08             	mov    0x8(%ebp),%eax
  102d96:	0f b6 00             	movzbl (%eax),%eax
  102d99:	0f be c0             	movsbl %al,%eax
  102d9c:	83 e8 30             	sub    $0x30,%eax
  102d9f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102da2:	eb 48                	jmp    102dec <strtol+0x114>
        }
        else if (*s >= 'a' && *s <= 'z') {
  102da4:	8b 45 08             	mov    0x8(%ebp),%eax
  102da7:	0f b6 00             	movzbl (%eax),%eax
  102daa:	3c 60                	cmp    $0x60,%al
  102dac:	7e 1b                	jle    102dc9 <strtol+0xf1>
  102dae:	8b 45 08             	mov    0x8(%ebp),%eax
  102db1:	0f b6 00             	movzbl (%eax),%eax
  102db4:	3c 7a                	cmp    $0x7a,%al
  102db6:	7f 11                	jg     102dc9 <strtol+0xf1>
            dig = *s - 'a' + 10;
  102db8:	8b 45 08             	mov    0x8(%ebp),%eax
  102dbb:	0f b6 00             	movzbl (%eax),%eax
  102dbe:	0f be c0             	movsbl %al,%eax
  102dc1:	83 e8 57             	sub    $0x57,%eax
  102dc4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102dc7:	eb 23                	jmp    102dec <strtol+0x114>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  102dc9:	8b 45 08             	mov    0x8(%ebp),%eax
  102dcc:	0f b6 00             	movzbl (%eax),%eax
  102dcf:	3c 40                	cmp    $0x40,%al
  102dd1:	7e 3b                	jle    102e0e <strtol+0x136>
  102dd3:	8b 45 08             	mov    0x8(%ebp),%eax
  102dd6:	0f b6 00             	movzbl (%eax),%eax
  102dd9:	3c 5a                	cmp    $0x5a,%al
  102ddb:	7f 31                	jg     102e0e <strtol+0x136>
            dig = *s - 'A' + 10;
  102ddd:	8b 45 08             	mov    0x8(%ebp),%eax
  102de0:	0f b6 00             	movzbl (%eax),%eax
  102de3:	0f be c0             	movsbl %al,%eax
  102de6:	83 e8 37             	sub    $0x37,%eax
  102de9:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  102dec:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102def:	3b 45 10             	cmp    0x10(%ebp),%eax
  102df2:	7d 19                	jge    102e0d <strtol+0x135>
            break;
        }
        s ++, val = (val * base) + dig;
  102df4:	ff 45 08             	incl   0x8(%ebp)
  102df7:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102dfa:	0f af 45 10          	imul   0x10(%ebp),%eax
  102dfe:	89 c2                	mov    %eax,%edx
  102e00:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102e03:	01 d0                	add    %edx,%eax
  102e05:	89 45 f8             	mov    %eax,-0x8(%ebp)
        // we don't properly detect overflow!
    }
  102e08:	e9 72 ff ff ff       	jmp    102d7f <strtol+0xa7>
        }
        else {
            break;
        }
        if (dig >= base) {
            break;
  102e0d:	90                   	nop
        }
        s ++, val = (val * base) + dig;
        // we don't properly detect overflow!
    }

    if (endptr) {
  102e0e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102e12:	74 08                	je     102e1c <strtol+0x144>
        *endptr = (char *) s;
  102e14:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e17:	8b 55 08             	mov    0x8(%ebp),%edx
  102e1a:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  102e1c:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  102e20:	74 07                	je     102e29 <strtol+0x151>
  102e22:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102e25:	f7 d8                	neg    %eax
  102e27:	eb 03                	jmp    102e2c <strtol+0x154>
  102e29:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  102e2c:	c9                   	leave  
  102e2d:	c3                   	ret    

00102e2e <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  102e2e:	55                   	push   %ebp
  102e2f:	89 e5                	mov    %esp,%ebp
  102e31:	57                   	push   %edi
  102e32:	83 ec 24             	sub    $0x24,%esp
  102e35:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e38:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  102e3b:	0f be 45 d8          	movsbl -0x28(%ebp),%eax
  102e3f:	8b 55 08             	mov    0x8(%ebp),%edx
  102e42:	89 55 f8             	mov    %edx,-0x8(%ebp)
  102e45:	88 45 f7             	mov    %al,-0x9(%ebp)
  102e48:	8b 45 10             	mov    0x10(%ebp),%eax
  102e4b:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  102e4e:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  102e51:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  102e55:	8b 55 f8             	mov    -0x8(%ebp),%edx
  102e58:	89 d7                	mov    %edx,%edi
  102e5a:	f3 aa                	rep stos %al,%es:(%edi)
  102e5c:	89 fa                	mov    %edi,%edx
  102e5e:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102e61:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  102e64:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102e67:	90                   	nop
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  102e68:	83 c4 24             	add    $0x24,%esp
  102e6b:	5f                   	pop    %edi
  102e6c:	5d                   	pop    %ebp
  102e6d:	c3                   	ret    

00102e6e <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  102e6e:	55                   	push   %ebp
  102e6f:	89 e5                	mov    %esp,%ebp
  102e71:	57                   	push   %edi
  102e72:	56                   	push   %esi
  102e73:	53                   	push   %ebx
  102e74:	83 ec 30             	sub    $0x30,%esp
  102e77:	8b 45 08             	mov    0x8(%ebp),%eax
  102e7a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102e7d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e80:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102e83:	8b 45 10             	mov    0x10(%ebp),%eax
  102e86:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  102e89:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e8c:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  102e8f:	73 42                	jae    102ed3 <memmove+0x65>
  102e91:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e94:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102e97:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102e9a:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102e9d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102ea0:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102ea3:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102ea6:	c1 e8 02             	shr    $0x2,%eax
  102ea9:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  102eab:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102eae:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102eb1:	89 d7                	mov    %edx,%edi
  102eb3:	89 c6                	mov    %eax,%esi
  102eb5:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102eb7:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  102eba:	83 e1 03             	and    $0x3,%ecx
  102ebd:	74 02                	je     102ec1 <memmove+0x53>
  102ebf:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102ec1:	89 f0                	mov    %esi,%eax
  102ec3:	89 fa                	mov    %edi,%edx
  102ec5:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  102ec8:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  102ecb:	89 45 d0             	mov    %eax,-0x30(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  102ece:	8b 45 e4             	mov    -0x1c(%ebp),%eax
#ifdef __HAVE_ARCH_MEMMOVE
    return __memmove(dst, src, n);
  102ed1:	eb 36                	jmp    102f09 <memmove+0x9b>
    asm volatile (
            "std;"
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  102ed3:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102ed6:	8d 50 ff             	lea    -0x1(%eax),%edx
  102ed9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102edc:	01 c2                	add    %eax,%edx
  102ede:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102ee1:	8d 48 ff             	lea    -0x1(%eax),%ecx
  102ee4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ee7:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
        return __memcpy(dst, src, n);
    }
    int d0, d1, d2;
    asm volatile (
  102eea:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102eed:	89 c1                	mov    %eax,%ecx
  102eef:	89 d8                	mov    %ebx,%eax
  102ef1:	89 d6                	mov    %edx,%esi
  102ef3:	89 c7                	mov    %eax,%edi
  102ef5:	fd                   	std    
  102ef6:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102ef8:	fc                   	cld    
  102ef9:	89 f8                	mov    %edi,%eax
  102efb:	89 f2                	mov    %esi,%edx
  102efd:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  102f00:	89 55 c8             	mov    %edx,-0x38(%ebp)
  102f03:	89 45 c4             	mov    %eax,-0x3c(%ebp)
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
            : "memory");
    return dst;
  102f06:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  102f09:	83 c4 30             	add    $0x30,%esp
  102f0c:	5b                   	pop    %ebx
  102f0d:	5e                   	pop    %esi
  102f0e:	5f                   	pop    %edi
  102f0f:	5d                   	pop    %ebp
  102f10:	c3                   	ret    

00102f11 <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  102f11:	55                   	push   %ebp
  102f12:	89 e5                	mov    %esp,%ebp
  102f14:	57                   	push   %edi
  102f15:	56                   	push   %esi
  102f16:	83 ec 20             	sub    $0x20,%esp
  102f19:	8b 45 08             	mov    0x8(%ebp),%eax
  102f1c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102f1f:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f22:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102f25:	8b 45 10             	mov    0x10(%ebp),%eax
  102f28:	89 45 ec             	mov    %eax,-0x14(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102f2b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102f2e:	c1 e8 02             	shr    $0x2,%eax
  102f31:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  102f33:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102f36:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f39:	89 d7                	mov    %edx,%edi
  102f3b:	89 c6                	mov    %eax,%esi
  102f3d:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102f3f:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  102f42:	83 e1 03             	and    $0x3,%ecx
  102f45:	74 02                	je     102f49 <memcpy+0x38>
  102f47:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102f49:	89 f0                	mov    %esi,%eax
  102f4b:	89 fa                	mov    %edi,%edx
  102f4d:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102f50:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  102f53:	89 45 e0             	mov    %eax,-0x20(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  102f56:	8b 45 f4             	mov    -0xc(%ebp),%eax
#ifdef __HAVE_ARCH_MEMCPY
    return __memcpy(dst, src, n);
  102f59:	90                   	nop
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  102f5a:	83 c4 20             	add    $0x20,%esp
  102f5d:	5e                   	pop    %esi
  102f5e:	5f                   	pop    %edi
  102f5f:	5d                   	pop    %ebp
  102f60:	c3                   	ret    

00102f61 <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  102f61:	55                   	push   %ebp
  102f62:	89 e5                	mov    %esp,%ebp
  102f64:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  102f67:	8b 45 08             	mov    0x8(%ebp),%eax
  102f6a:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  102f6d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f70:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  102f73:	eb 2e                	jmp    102fa3 <memcmp+0x42>
        if (*s1 != *s2) {
  102f75:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102f78:	0f b6 10             	movzbl (%eax),%edx
  102f7b:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102f7e:	0f b6 00             	movzbl (%eax),%eax
  102f81:	38 c2                	cmp    %al,%dl
  102f83:	74 18                	je     102f9d <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  102f85:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102f88:	0f b6 00             	movzbl (%eax),%eax
  102f8b:	0f b6 d0             	movzbl %al,%edx
  102f8e:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102f91:	0f b6 00             	movzbl (%eax),%eax
  102f94:	0f b6 c0             	movzbl %al,%eax
  102f97:	29 c2                	sub    %eax,%edx
  102f99:	89 d0                	mov    %edx,%eax
  102f9b:	eb 18                	jmp    102fb5 <memcmp+0x54>
        }
        s1 ++, s2 ++;
  102f9d:	ff 45 fc             	incl   -0x4(%ebp)
  102fa0:	ff 45 f8             	incl   -0x8(%ebp)
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
    const char *s1 = (const char *)v1;
    const char *s2 = (const char *)v2;
    while (n -- > 0) {
  102fa3:	8b 45 10             	mov    0x10(%ebp),%eax
  102fa6:	8d 50 ff             	lea    -0x1(%eax),%edx
  102fa9:	89 55 10             	mov    %edx,0x10(%ebp)
  102fac:	85 c0                	test   %eax,%eax
  102fae:	75 c5                	jne    102f75 <memcmp+0x14>
        if (*s1 != *s2) {
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
        }
        s1 ++, s2 ++;
    }
    return 0;
  102fb0:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102fb5:	c9                   	leave  
  102fb6:	c3                   	ret    

00102fb7 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102fb7:	55                   	push   %ebp
  102fb8:	89 e5                	mov    %esp,%ebp
  102fba:	83 ec 58             	sub    $0x58,%esp
  102fbd:	8b 45 10             	mov    0x10(%ebp),%eax
  102fc0:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102fc3:	8b 45 14             	mov    0x14(%ebp),%eax
  102fc6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102fc9:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102fcc:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102fcf:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102fd2:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102fd5:	8b 45 18             	mov    0x18(%ebp),%eax
  102fd8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102fdb:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102fde:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102fe1:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102fe4:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102fe7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102fea:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102fed:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102ff1:	74 1c                	je     10300f <printnum+0x58>
  102ff3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ff6:	ba 00 00 00 00       	mov    $0x0,%edx
  102ffb:	f7 75 e4             	divl   -0x1c(%ebp)
  102ffe:	89 55 f4             	mov    %edx,-0xc(%ebp)
  103001:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103004:	ba 00 00 00 00       	mov    $0x0,%edx
  103009:	f7 75 e4             	divl   -0x1c(%ebp)
  10300c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10300f:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103012:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103015:	f7 75 e4             	divl   -0x1c(%ebp)
  103018:	89 45 e0             	mov    %eax,-0x20(%ebp)
  10301b:	89 55 dc             	mov    %edx,-0x24(%ebp)
  10301e:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103021:	8b 55 f0             	mov    -0x10(%ebp),%edx
  103024:	89 45 e8             	mov    %eax,-0x18(%ebp)
  103027:	89 55 ec             	mov    %edx,-0x14(%ebp)
  10302a:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10302d:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  103030:	8b 45 18             	mov    0x18(%ebp),%eax
  103033:	ba 00 00 00 00       	mov    $0x0,%edx
  103038:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  10303b:	77 56                	ja     103093 <printnum+0xdc>
  10303d:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  103040:	72 05                	jb     103047 <printnum+0x90>
  103042:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  103045:	77 4c                	ja     103093 <printnum+0xdc>
        printnum(putch, putdat, result, base, width - 1, padc);
  103047:	8b 45 1c             	mov    0x1c(%ebp),%eax
  10304a:	8d 50 ff             	lea    -0x1(%eax),%edx
  10304d:	8b 45 20             	mov    0x20(%ebp),%eax
  103050:	89 44 24 18          	mov    %eax,0x18(%esp)
  103054:	89 54 24 14          	mov    %edx,0x14(%esp)
  103058:	8b 45 18             	mov    0x18(%ebp),%eax
  10305b:	89 44 24 10          	mov    %eax,0x10(%esp)
  10305f:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103062:	8b 55 ec             	mov    -0x14(%ebp),%edx
  103065:	89 44 24 08          	mov    %eax,0x8(%esp)
  103069:	89 54 24 0c          	mov    %edx,0xc(%esp)
  10306d:	8b 45 0c             	mov    0xc(%ebp),%eax
  103070:	89 44 24 04          	mov    %eax,0x4(%esp)
  103074:	8b 45 08             	mov    0x8(%ebp),%eax
  103077:	89 04 24             	mov    %eax,(%esp)
  10307a:	e8 38 ff ff ff       	call   102fb7 <printnum>
  10307f:	eb 1b                	jmp    10309c <printnum+0xe5>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  103081:	8b 45 0c             	mov    0xc(%ebp),%eax
  103084:	89 44 24 04          	mov    %eax,0x4(%esp)
  103088:	8b 45 20             	mov    0x20(%ebp),%eax
  10308b:	89 04 24             	mov    %eax,(%esp)
  10308e:	8b 45 08             	mov    0x8(%ebp),%eax
  103091:	ff d0                	call   *%eax
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
        printnum(putch, putdat, result, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
  103093:	ff 4d 1c             	decl   0x1c(%ebp)
  103096:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  10309a:	7f e5                	jg     103081 <printnum+0xca>
            putch(padc, putdat);
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  10309c:	8b 45 d8             	mov    -0x28(%ebp),%eax
  10309f:	05 10 3e 10 00       	add    $0x103e10,%eax
  1030a4:	0f b6 00             	movzbl (%eax),%eax
  1030a7:	0f be c0             	movsbl %al,%eax
  1030aa:	8b 55 0c             	mov    0xc(%ebp),%edx
  1030ad:	89 54 24 04          	mov    %edx,0x4(%esp)
  1030b1:	89 04 24             	mov    %eax,(%esp)
  1030b4:	8b 45 08             	mov    0x8(%ebp),%eax
  1030b7:	ff d0                	call   *%eax
}
  1030b9:	90                   	nop
  1030ba:	c9                   	leave  
  1030bb:	c3                   	ret    

001030bc <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  1030bc:	55                   	push   %ebp
  1030bd:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  1030bf:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  1030c3:	7e 14                	jle    1030d9 <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  1030c5:	8b 45 08             	mov    0x8(%ebp),%eax
  1030c8:	8b 00                	mov    (%eax),%eax
  1030ca:	8d 48 08             	lea    0x8(%eax),%ecx
  1030cd:	8b 55 08             	mov    0x8(%ebp),%edx
  1030d0:	89 0a                	mov    %ecx,(%edx)
  1030d2:	8b 50 04             	mov    0x4(%eax),%edx
  1030d5:	8b 00                	mov    (%eax),%eax
  1030d7:	eb 30                	jmp    103109 <getuint+0x4d>
    }
    else if (lflag) {
  1030d9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1030dd:	74 16                	je     1030f5 <getuint+0x39>
        return va_arg(*ap, unsigned long);
  1030df:	8b 45 08             	mov    0x8(%ebp),%eax
  1030e2:	8b 00                	mov    (%eax),%eax
  1030e4:	8d 48 04             	lea    0x4(%eax),%ecx
  1030e7:	8b 55 08             	mov    0x8(%ebp),%edx
  1030ea:	89 0a                	mov    %ecx,(%edx)
  1030ec:	8b 00                	mov    (%eax),%eax
  1030ee:	ba 00 00 00 00       	mov    $0x0,%edx
  1030f3:	eb 14                	jmp    103109 <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  1030f5:	8b 45 08             	mov    0x8(%ebp),%eax
  1030f8:	8b 00                	mov    (%eax),%eax
  1030fa:	8d 48 04             	lea    0x4(%eax),%ecx
  1030fd:	8b 55 08             	mov    0x8(%ebp),%edx
  103100:	89 0a                	mov    %ecx,(%edx)
  103102:	8b 00                	mov    (%eax),%eax
  103104:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  103109:	5d                   	pop    %ebp
  10310a:	c3                   	ret    

0010310b <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  10310b:	55                   	push   %ebp
  10310c:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  10310e:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  103112:	7e 14                	jle    103128 <getint+0x1d>
        return va_arg(*ap, long long);
  103114:	8b 45 08             	mov    0x8(%ebp),%eax
  103117:	8b 00                	mov    (%eax),%eax
  103119:	8d 48 08             	lea    0x8(%eax),%ecx
  10311c:	8b 55 08             	mov    0x8(%ebp),%edx
  10311f:	89 0a                	mov    %ecx,(%edx)
  103121:	8b 50 04             	mov    0x4(%eax),%edx
  103124:	8b 00                	mov    (%eax),%eax
  103126:	eb 28                	jmp    103150 <getint+0x45>
    }
    else if (lflag) {
  103128:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  10312c:	74 12                	je     103140 <getint+0x35>
        return va_arg(*ap, long);
  10312e:	8b 45 08             	mov    0x8(%ebp),%eax
  103131:	8b 00                	mov    (%eax),%eax
  103133:	8d 48 04             	lea    0x4(%eax),%ecx
  103136:	8b 55 08             	mov    0x8(%ebp),%edx
  103139:	89 0a                	mov    %ecx,(%edx)
  10313b:	8b 00                	mov    (%eax),%eax
  10313d:	99                   	cltd   
  10313e:	eb 10                	jmp    103150 <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  103140:	8b 45 08             	mov    0x8(%ebp),%eax
  103143:	8b 00                	mov    (%eax),%eax
  103145:	8d 48 04             	lea    0x4(%eax),%ecx
  103148:	8b 55 08             	mov    0x8(%ebp),%edx
  10314b:	89 0a                	mov    %ecx,(%edx)
  10314d:	8b 00                	mov    (%eax),%eax
  10314f:	99                   	cltd   
    }
}
  103150:	5d                   	pop    %ebp
  103151:	c3                   	ret    

00103152 <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  103152:	55                   	push   %ebp
  103153:	89 e5                	mov    %esp,%ebp
  103155:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  103158:	8d 45 14             	lea    0x14(%ebp),%eax
  10315b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  10315e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103161:	89 44 24 0c          	mov    %eax,0xc(%esp)
  103165:	8b 45 10             	mov    0x10(%ebp),%eax
  103168:	89 44 24 08          	mov    %eax,0x8(%esp)
  10316c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10316f:	89 44 24 04          	mov    %eax,0x4(%esp)
  103173:	8b 45 08             	mov    0x8(%ebp),%eax
  103176:	89 04 24             	mov    %eax,(%esp)
  103179:	e8 03 00 00 00       	call   103181 <vprintfmt>
    va_end(ap);
}
  10317e:	90                   	nop
  10317f:	c9                   	leave  
  103180:	c3                   	ret    

00103181 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  103181:	55                   	push   %ebp
  103182:	89 e5                	mov    %esp,%ebp
  103184:	56                   	push   %esi
  103185:	53                   	push   %ebx
  103186:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  103189:	eb 17                	jmp    1031a2 <vprintfmt+0x21>
            if (ch == '\0') {
  10318b:	85 db                	test   %ebx,%ebx
  10318d:	0f 84 bf 03 00 00    	je     103552 <vprintfmt+0x3d1>
                return;
            }
            putch(ch, putdat);
  103193:	8b 45 0c             	mov    0xc(%ebp),%eax
  103196:	89 44 24 04          	mov    %eax,0x4(%esp)
  10319a:	89 1c 24             	mov    %ebx,(%esp)
  10319d:	8b 45 08             	mov    0x8(%ebp),%eax
  1031a0:	ff d0                	call   *%eax
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  1031a2:	8b 45 10             	mov    0x10(%ebp),%eax
  1031a5:	8d 50 01             	lea    0x1(%eax),%edx
  1031a8:	89 55 10             	mov    %edx,0x10(%ebp)
  1031ab:	0f b6 00             	movzbl (%eax),%eax
  1031ae:	0f b6 d8             	movzbl %al,%ebx
  1031b1:	83 fb 25             	cmp    $0x25,%ebx
  1031b4:	75 d5                	jne    10318b <vprintfmt+0xa>
            }
            putch(ch, putdat);
        }

        // Process a %-escape sequence
        char padc = ' ';
  1031b6:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  1031ba:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  1031c1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1031c4:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  1031c7:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  1031ce:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1031d1:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  1031d4:	8b 45 10             	mov    0x10(%ebp),%eax
  1031d7:	8d 50 01             	lea    0x1(%eax),%edx
  1031da:	89 55 10             	mov    %edx,0x10(%ebp)
  1031dd:	0f b6 00             	movzbl (%eax),%eax
  1031e0:	0f b6 d8             	movzbl %al,%ebx
  1031e3:	8d 43 dd             	lea    -0x23(%ebx),%eax
  1031e6:	83 f8 55             	cmp    $0x55,%eax
  1031e9:	0f 87 37 03 00 00    	ja     103526 <vprintfmt+0x3a5>
  1031ef:	8b 04 85 34 3e 10 00 	mov    0x103e34(,%eax,4),%eax
  1031f6:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  1031f8:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  1031fc:	eb d6                	jmp    1031d4 <vprintfmt+0x53>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  1031fe:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  103202:	eb d0                	jmp    1031d4 <vprintfmt+0x53>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  103204:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  10320b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  10320e:	89 d0                	mov    %edx,%eax
  103210:	c1 e0 02             	shl    $0x2,%eax
  103213:	01 d0                	add    %edx,%eax
  103215:	01 c0                	add    %eax,%eax
  103217:	01 d8                	add    %ebx,%eax
  103219:	83 e8 30             	sub    $0x30,%eax
  10321c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  10321f:	8b 45 10             	mov    0x10(%ebp),%eax
  103222:	0f b6 00             	movzbl (%eax),%eax
  103225:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  103228:	83 fb 2f             	cmp    $0x2f,%ebx
  10322b:	7e 38                	jle    103265 <vprintfmt+0xe4>
  10322d:	83 fb 39             	cmp    $0x39,%ebx
  103230:	7f 33                	jg     103265 <vprintfmt+0xe4>
            padc = '0';
            goto reswitch;

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  103232:	ff 45 10             	incl   0x10(%ebp)
                precision = precision * 10 + ch - '0';
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
  103235:	eb d4                	jmp    10320b <vprintfmt+0x8a>
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  103237:	8b 45 14             	mov    0x14(%ebp),%eax
  10323a:	8d 50 04             	lea    0x4(%eax),%edx
  10323d:	89 55 14             	mov    %edx,0x14(%ebp)
  103240:	8b 00                	mov    (%eax),%eax
  103242:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  103245:	eb 1f                	jmp    103266 <vprintfmt+0xe5>

        case '.':
            if (width < 0)
  103247:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  10324b:	79 87                	jns    1031d4 <vprintfmt+0x53>
                width = 0;
  10324d:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  103254:	e9 7b ff ff ff       	jmp    1031d4 <vprintfmt+0x53>

        case '#':
            altflag = 1;
  103259:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  103260:	e9 6f ff ff ff       	jmp    1031d4 <vprintfmt+0x53>
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
            goto process_precision;
  103265:	90                   	nop
        case '#':
            altflag = 1;
            goto reswitch;

        process_precision:
            if (width < 0)
  103266:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  10326a:	0f 89 64 ff ff ff    	jns    1031d4 <vprintfmt+0x53>
                width = precision, precision = -1;
  103270:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  103273:	89 45 e8             	mov    %eax,-0x18(%ebp)
  103276:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  10327d:	e9 52 ff ff ff       	jmp    1031d4 <vprintfmt+0x53>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  103282:	ff 45 e0             	incl   -0x20(%ebp)
            goto reswitch;
  103285:	e9 4a ff ff ff       	jmp    1031d4 <vprintfmt+0x53>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  10328a:	8b 45 14             	mov    0x14(%ebp),%eax
  10328d:	8d 50 04             	lea    0x4(%eax),%edx
  103290:	89 55 14             	mov    %edx,0x14(%ebp)
  103293:	8b 00                	mov    (%eax),%eax
  103295:	8b 55 0c             	mov    0xc(%ebp),%edx
  103298:	89 54 24 04          	mov    %edx,0x4(%esp)
  10329c:	89 04 24             	mov    %eax,(%esp)
  10329f:	8b 45 08             	mov    0x8(%ebp),%eax
  1032a2:	ff d0                	call   *%eax
            break;
  1032a4:	e9 a4 02 00 00       	jmp    10354d <vprintfmt+0x3cc>

        // error message
        case 'e':
            err = va_arg(ap, int);
  1032a9:	8b 45 14             	mov    0x14(%ebp),%eax
  1032ac:	8d 50 04             	lea    0x4(%eax),%edx
  1032af:	89 55 14             	mov    %edx,0x14(%ebp)
  1032b2:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  1032b4:	85 db                	test   %ebx,%ebx
  1032b6:	79 02                	jns    1032ba <vprintfmt+0x139>
                err = -err;
  1032b8:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  1032ba:	83 fb 06             	cmp    $0x6,%ebx
  1032bd:	7f 0b                	jg     1032ca <vprintfmt+0x149>
  1032bf:	8b 34 9d f4 3d 10 00 	mov    0x103df4(,%ebx,4),%esi
  1032c6:	85 f6                	test   %esi,%esi
  1032c8:	75 23                	jne    1032ed <vprintfmt+0x16c>
                printfmt(putch, putdat, "error %d", err);
  1032ca:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  1032ce:	c7 44 24 08 21 3e 10 	movl   $0x103e21,0x8(%esp)
  1032d5:	00 
  1032d6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032d9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1032dd:	8b 45 08             	mov    0x8(%ebp),%eax
  1032e0:	89 04 24             	mov    %eax,(%esp)
  1032e3:	e8 6a fe ff ff       	call   103152 <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  1032e8:	e9 60 02 00 00       	jmp    10354d <vprintfmt+0x3cc>
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
                printfmt(putch, putdat, "error %d", err);
            }
            else {
                printfmt(putch, putdat, "%s", p);
  1032ed:	89 74 24 0c          	mov    %esi,0xc(%esp)
  1032f1:	c7 44 24 08 2a 3e 10 	movl   $0x103e2a,0x8(%esp)
  1032f8:	00 
  1032f9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032fc:	89 44 24 04          	mov    %eax,0x4(%esp)
  103300:	8b 45 08             	mov    0x8(%ebp),%eax
  103303:	89 04 24             	mov    %eax,(%esp)
  103306:	e8 47 fe ff ff       	call   103152 <printfmt>
            }
            break;
  10330b:	e9 3d 02 00 00       	jmp    10354d <vprintfmt+0x3cc>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  103310:	8b 45 14             	mov    0x14(%ebp),%eax
  103313:	8d 50 04             	lea    0x4(%eax),%edx
  103316:	89 55 14             	mov    %edx,0x14(%ebp)
  103319:	8b 30                	mov    (%eax),%esi
  10331b:	85 f6                	test   %esi,%esi
  10331d:	75 05                	jne    103324 <vprintfmt+0x1a3>
                p = "(null)";
  10331f:	be 2d 3e 10 00       	mov    $0x103e2d,%esi
            }
            if (width > 0 && padc != '-') {
  103324:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103328:	7e 76                	jle    1033a0 <vprintfmt+0x21f>
  10332a:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  10332e:	74 70                	je     1033a0 <vprintfmt+0x21f>
                for (width -= strnlen(p, precision); width > 0; width --) {
  103330:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  103333:	89 44 24 04          	mov    %eax,0x4(%esp)
  103337:	89 34 24             	mov    %esi,(%esp)
  10333a:	e8 f6 f7 ff ff       	call   102b35 <strnlen>
  10333f:	8b 55 e8             	mov    -0x18(%ebp),%edx
  103342:	29 c2                	sub    %eax,%edx
  103344:	89 d0                	mov    %edx,%eax
  103346:	89 45 e8             	mov    %eax,-0x18(%ebp)
  103349:	eb 16                	jmp    103361 <vprintfmt+0x1e0>
                    putch(padc, putdat);
  10334b:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  10334f:	8b 55 0c             	mov    0xc(%ebp),%edx
  103352:	89 54 24 04          	mov    %edx,0x4(%esp)
  103356:	89 04 24             	mov    %eax,(%esp)
  103359:	8b 45 08             	mov    0x8(%ebp),%eax
  10335c:	ff d0                	call   *%eax
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
                p = "(null)";
            }
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
  10335e:	ff 4d e8             	decl   -0x18(%ebp)
  103361:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103365:	7f e4                	jg     10334b <vprintfmt+0x1ca>
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  103367:	eb 37                	jmp    1033a0 <vprintfmt+0x21f>
                if (altflag && (ch < ' ' || ch > '~')) {
  103369:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  10336d:	74 1f                	je     10338e <vprintfmt+0x20d>
  10336f:	83 fb 1f             	cmp    $0x1f,%ebx
  103372:	7e 05                	jle    103379 <vprintfmt+0x1f8>
  103374:	83 fb 7e             	cmp    $0x7e,%ebx
  103377:	7e 15                	jle    10338e <vprintfmt+0x20d>
                    putch('?', putdat);
  103379:	8b 45 0c             	mov    0xc(%ebp),%eax
  10337c:	89 44 24 04          	mov    %eax,0x4(%esp)
  103380:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  103387:	8b 45 08             	mov    0x8(%ebp),%eax
  10338a:	ff d0                	call   *%eax
  10338c:	eb 0f                	jmp    10339d <vprintfmt+0x21c>
                }
                else {
                    putch(ch, putdat);
  10338e:	8b 45 0c             	mov    0xc(%ebp),%eax
  103391:	89 44 24 04          	mov    %eax,0x4(%esp)
  103395:	89 1c 24             	mov    %ebx,(%esp)
  103398:	8b 45 08             	mov    0x8(%ebp),%eax
  10339b:	ff d0                	call   *%eax
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  10339d:	ff 4d e8             	decl   -0x18(%ebp)
  1033a0:	89 f0                	mov    %esi,%eax
  1033a2:	8d 70 01             	lea    0x1(%eax),%esi
  1033a5:	0f b6 00             	movzbl (%eax),%eax
  1033a8:	0f be d8             	movsbl %al,%ebx
  1033ab:	85 db                	test   %ebx,%ebx
  1033ad:	74 27                	je     1033d6 <vprintfmt+0x255>
  1033af:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  1033b3:	78 b4                	js     103369 <vprintfmt+0x1e8>
  1033b5:	ff 4d e4             	decl   -0x1c(%ebp)
  1033b8:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  1033bc:	79 ab                	jns    103369 <vprintfmt+0x1e8>
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  1033be:	eb 16                	jmp    1033d6 <vprintfmt+0x255>
                putch(' ', putdat);
  1033c0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1033c3:	89 44 24 04          	mov    %eax,0x4(%esp)
  1033c7:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1033ce:	8b 45 08             	mov    0x8(%ebp),%eax
  1033d1:	ff d0                	call   *%eax
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  1033d3:	ff 4d e8             	decl   -0x18(%ebp)
  1033d6:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1033da:	7f e4                	jg     1033c0 <vprintfmt+0x23f>
                putch(' ', putdat);
            }
            break;
  1033dc:	e9 6c 01 00 00       	jmp    10354d <vprintfmt+0x3cc>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  1033e1:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1033e4:	89 44 24 04          	mov    %eax,0x4(%esp)
  1033e8:	8d 45 14             	lea    0x14(%ebp),%eax
  1033eb:	89 04 24             	mov    %eax,(%esp)
  1033ee:	e8 18 fd ff ff       	call   10310b <getint>
  1033f3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033f6:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  1033f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1033fc:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1033ff:	85 d2                	test   %edx,%edx
  103401:	79 26                	jns    103429 <vprintfmt+0x2a8>
                putch('-', putdat);
  103403:	8b 45 0c             	mov    0xc(%ebp),%eax
  103406:	89 44 24 04          	mov    %eax,0x4(%esp)
  10340a:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  103411:	8b 45 08             	mov    0x8(%ebp),%eax
  103414:	ff d0                	call   *%eax
                num = -(long long)num;
  103416:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103419:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10341c:	f7 d8                	neg    %eax
  10341e:	83 d2 00             	adc    $0x0,%edx
  103421:	f7 da                	neg    %edx
  103423:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103426:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  103429:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  103430:	e9 a8 00 00 00       	jmp    1034dd <vprintfmt+0x35c>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  103435:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103438:	89 44 24 04          	mov    %eax,0x4(%esp)
  10343c:	8d 45 14             	lea    0x14(%ebp),%eax
  10343f:	89 04 24             	mov    %eax,(%esp)
  103442:	e8 75 fc ff ff       	call   1030bc <getuint>
  103447:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10344a:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  10344d:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  103454:	e9 84 00 00 00       	jmp    1034dd <vprintfmt+0x35c>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  103459:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10345c:	89 44 24 04          	mov    %eax,0x4(%esp)
  103460:	8d 45 14             	lea    0x14(%ebp),%eax
  103463:	89 04 24             	mov    %eax,(%esp)
  103466:	e8 51 fc ff ff       	call   1030bc <getuint>
  10346b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10346e:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  103471:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  103478:	eb 63                	jmp    1034dd <vprintfmt+0x35c>

        // pointer
        case 'p':
            putch('0', putdat);
  10347a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10347d:	89 44 24 04          	mov    %eax,0x4(%esp)
  103481:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  103488:	8b 45 08             	mov    0x8(%ebp),%eax
  10348b:	ff d0                	call   *%eax
            putch('x', putdat);
  10348d:	8b 45 0c             	mov    0xc(%ebp),%eax
  103490:	89 44 24 04          	mov    %eax,0x4(%esp)
  103494:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  10349b:	8b 45 08             	mov    0x8(%ebp),%eax
  10349e:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  1034a0:	8b 45 14             	mov    0x14(%ebp),%eax
  1034a3:	8d 50 04             	lea    0x4(%eax),%edx
  1034a6:	89 55 14             	mov    %edx,0x14(%ebp)
  1034a9:	8b 00                	mov    (%eax),%eax
  1034ab:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1034ae:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  1034b5:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  1034bc:	eb 1f                	jmp    1034dd <vprintfmt+0x35c>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  1034be:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1034c1:	89 44 24 04          	mov    %eax,0x4(%esp)
  1034c5:	8d 45 14             	lea    0x14(%ebp),%eax
  1034c8:	89 04 24             	mov    %eax,(%esp)
  1034cb:	e8 ec fb ff ff       	call   1030bc <getuint>
  1034d0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1034d3:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  1034d6:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  1034dd:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  1034e1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1034e4:	89 54 24 18          	mov    %edx,0x18(%esp)
  1034e8:	8b 55 e8             	mov    -0x18(%ebp),%edx
  1034eb:	89 54 24 14          	mov    %edx,0x14(%esp)
  1034ef:	89 44 24 10          	mov    %eax,0x10(%esp)
  1034f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1034f6:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1034f9:	89 44 24 08          	mov    %eax,0x8(%esp)
  1034fd:	89 54 24 0c          	mov    %edx,0xc(%esp)
  103501:	8b 45 0c             	mov    0xc(%ebp),%eax
  103504:	89 44 24 04          	mov    %eax,0x4(%esp)
  103508:	8b 45 08             	mov    0x8(%ebp),%eax
  10350b:	89 04 24             	mov    %eax,(%esp)
  10350e:	e8 a4 fa ff ff       	call   102fb7 <printnum>
            break;
  103513:	eb 38                	jmp    10354d <vprintfmt+0x3cc>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  103515:	8b 45 0c             	mov    0xc(%ebp),%eax
  103518:	89 44 24 04          	mov    %eax,0x4(%esp)
  10351c:	89 1c 24             	mov    %ebx,(%esp)
  10351f:	8b 45 08             	mov    0x8(%ebp),%eax
  103522:	ff d0                	call   *%eax
            break;
  103524:	eb 27                	jmp    10354d <vprintfmt+0x3cc>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  103526:	8b 45 0c             	mov    0xc(%ebp),%eax
  103529:	89 44 24 04          	mov    %eax,0x4(%esp)
  10352d:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  103534:	8b 45 08             	mov    0x8(%ebp),%eax
  103537:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  103539:	ff 4d 10             	decl   0x10(%ebp)
  10353c:	eb 03                	jmp    103541 <vprintfmt+0x3c0>
  10353e:	ff 4d 10             	decl   0x10(%ebp)
  103541:	8b 45 10             	mov    0x10(%ebp),%eax
  103544:	48                   	dec    %eax
  103545:	0f b6 00             	movzbl (%eax),%eax
  103548:	3c 25                	cmp    $0x25,%al
  10354a:	75 f2                	jne    10353e <vprintfmt+0x3bd>
                /* do nothing */;
            break;
  10354c:	90                   	nop
        }
    }
  10354d:	e9 37 fc ff ff       	jmp    103189 <vprintfmt+0x8>
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
            if (ch == '\0') {
                return;
  103552:	90                   	nop
            for (fmt --; fmt[-1] != '%'; fmt --)
                /* do nothing */;
            break;
        }
    }
}
  103553:	83 c4 40             	add    $0x40,%esp
  103556:	5b                   	pop    %ebx
  103557:	5e                   	pop    %esi
  103558:	5d                   	pop    %ebp
  103559:	c3                   	ret    

0010355a <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  10355a:	55                   	push   %ebp
  10355b:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  10355d:	8b 45 0c             	mov    0xc(%ebp),%eax
  103560:	8b 40 08             	mov    0x8(%eax),%eax
  103563:	8d 50 01             	lea    0x1(%eax),%edx
  103566:	8b 45 0c             	mov    0xc(%ebp),%eax
  103569:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  10356c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10356f:	8b 10                	mov    (%eax),%edx
  103571:	8b 45 0c             	mov    0xc(%ebp),%eax
  103574:	8b 40 04             	mov    0x4(%eax),%eax
  103577:	39 c2                	cmp    %eax,%edx
  103579:	73 12                	jae    10358d <sprintputch+0x33>
        *b->buf ++ = ch;
  10357b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10357e:	8b 00                	mov    (%eax),%eax
  103580:	8d 48 01             	lea    0x1(%eax),%ecx
  103583:	8b 55 0c             	mov    0xc(%ebp),%edx
  103586:	89 0a                	mov    %ecx,(%edx)
  103588:	8b 55 08             	mov    0x8(%ebp),%edx
  10358b:	88 10                	mov    %dl,(%eax)
    }
}
  10358d:	90                   	nop
  10358e:	5d                   	pop    %ebp
  10358f:	c3                   	ret    

00103590 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  103590:	55                   	push   %ebp
  103591:	89 e5                	mov    %esp,%ebp
  103593:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  103596:	8d 45 14             	lea    0x14(%ebp),%eax
  103599:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  10359c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10359f:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1035a3:	8b 45 10             	mov    0x10(%ebp),%eax
  1035a6:	89 44 24 08          	mov    %eax,0x8(%esp)
  1035aa:	8b 45 0c             	mov    0xc(%ebp),%eax
  1035ad:	89 44 24 04          	mov    %eax,0x4(%esp)
  1035b1:	8b 45 08             	mov    0x8(%ebp),%eax
  1035b4:	89 04 24             	mov    %eax,(%esp)
  1035b7:	e8 08 00 00 00       	call   1035c4 <vsnprintf>
  1035bc:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  1035bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1035c2:	c9                   	leave  
  1035c3:	c3                   	ret    

001035c4 <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  1035c4:	55                   	push   %ebp
  1035c5:	89 e5                	mov    %esp,%ebp
  1035c7:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  1035ca:	8b 45 08             	mov    0x8(%ebp),%eax
  1035cd:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1035d0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1035d3:	8d 50 ff             	lea    -0x1(%eax),%edx
  1035d6:	8b 45 08             	mov    0x8(%ebp),%eax
  1035d9:	01 d0                	add    %edx,%eax
  1035db:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1035de:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  1035e5:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1035e9:	74 0a                	je     1035f5 <vsnprintf+0x31>
  1035eb:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1035ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1035f1:	39 c2                	cmp    %eax,%edx
  1035f3:	76 07                	jbe    1035fc <vsnprintf+0x38>
        return -E_INVAL;
  1035f5:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  1035fa:	eb 2a                	jmp    103626 <vsnprintf+0x62>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  1035fc:	8b 45 14             	mov    0x14(%ebp),%eax
  1035ff:	89 44 24 0c          	mov    %eax,0xc(%esp)
  103603:	8b 45 10             	mov    0x10(%ebp),%eax
  103606:	89 44 24 08          	mov    %eax,0x8(%esp)
  10360a:	8d 45 ec             	lea    -0x14(%ebp),%eax
  10360d:	89 44 24 04          	mov    %eax,0x4(%esp)
  103611:	c7 04 24 5a 35 10 00 	movl   $0x10355a,(%esp)
  103618:	e8 64 fb ff ff       	call   103181 <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  10361d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103620:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  103623:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103626:	c9                   	leave  
  103627:	c3                   	ret    
