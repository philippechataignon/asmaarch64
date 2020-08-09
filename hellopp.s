# 1 "hello.s"
# 1 "<built-in>"
# 1 "<command-line>"
# 31 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 32 "<command-line>" 2
# 1 "hello.s"
# 1 "include.h" 1
# 2 "hello.s" 2

        .global _start
        .text

_start:
        mov x8, 64
        mov x2, hello_len
        adr x1, hello_txt
        mov x0, 1
        svc 0

        mov x8, 93
        svc 0

        .data

hello_txt: .ascii "Hello, World!\n"
hello_len = . - hello_txt
