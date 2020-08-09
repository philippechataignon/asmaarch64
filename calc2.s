    .section .data

length:     .word 3
width:      .word 4
perim:      .word 0

    .section .bss
c:          .skip 1
s:          .skip 2
i:          .skip 4
l:          .skip 8

    .section .rodata
helloLabel: .string "hello\n"

    .section .text

    .global main

main:
    adr x0, length
    ldr w1, [x0]
    adr x0, width
    ldr w2, [x0]
    add w1, w1, w2
    lsl w1, w1, 1
    adr x0, perim
    str w1, [x0]
    mov w0, w1
    ret 
