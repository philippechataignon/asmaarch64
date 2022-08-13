.global calc2
.global hello
.global length
.global width
.global perim
.global entier

.section .bss

length:     .fill 4
width:      .fill 4
perim:      .fill 4

c:          .fill 1
s:          .fill 2
i:          .fill 4
l:          .fill 8

.section .rodata
hello: .string "Hello!\n"
entier: .word 123456789

.section .data

.section .text

calc2:
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
