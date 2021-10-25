// gcc -nostartfiles -o hello hello.S

#include "include.h"

        .global _start
        .text

_start:
        mov    x8, __NR_write
        mov    x2, hello_len
        adr    x1, hello_txt
        mov    x0, STDOUT_FILENO
        svc    0

        mov    x0, 0
        mov    x8, __NR_exit
        svc    0

        .data

hello_txt:
        .ascii "Hello, World!\n"
        .equ    hello_len,. - hello_txt
