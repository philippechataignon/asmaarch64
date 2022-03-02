.nolist
.include "syscall.s"
.list
.globl _start

.text
_start:
    mov     x0,#1          // fd := STDOUT_FILENO 
    ldr     x1,=msg        // buf := msg 
    ldr     x2,=len        // count := len 
    mov     w8,__NR_write  // syscall 
    svc     #0             // invoke syscall 

    mov     x0,#0          // status := 0 
    mov     w8,__NR_exit   // syscal l
    svc     #0             // invoke syscall 

.data
msg:    .asciz        "Hello, ARM64!\n"
len = . - msg

