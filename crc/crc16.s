	.arch armv8-a
	.file	"crc16.c"
	.text
	.align	2
	.global	crc16_ccitt
	.type	crc16_ccitt, %function
crc16_ccitt:
.LFB0:
	.cfi_startproc
	mov	x4, 0
	mov	w2, 0
	mov	w6, 4129
.L2:
	cmp	w1, w4
	bhi	.L5
	mov	w0, w2
	ret
.L5:
	ldrb	w3, [x0, x4]
	eor	w2, w2, w3, lsl 8
	mov	w3, 8
.L4:
	ubfiz	w5, w2, 1, 15
	tst	x2, 32768
	eor	w7, w5, w6
	sub	w3, w3, #1
	csel	w2, w7, w5, ne
	ands	w3, w3, 255
	bne	.L4
	add	x4, x4, 1
	b	.L2
	.cfi_endproc
.LFE0:
	.size	crc16_ccitt, .-crc16_ccitt
	.align	2
	.global	crc16
	.type	crc16, %function
crc16:
.LFB1:
	.cfi_startproc
	and	x1, x1, 255
	mov	x5, 0
	mov	w3, 0
.L9:
	cmp	x5, x1
	bne	.L10
	mov	w0, w3
	ret
.L10:
	ldrb	w2, [x0, x5]
	add	x5, x5, 1
	eor	w2, w2, w3, lsr 8
	eor	w2, w2, w2, lsr 4
	lsl	w4, w2, 5
	eor	w4, w4, w2, lsl 12
	orr	w2, w2, w3, lsl 8
	eor	w2, w4, w2
	and	w3, w2, 65535
	b	.L9
	.cfi_endproc
.LFE1:
	.size	crc16, .-crc16
	.section	.text.startup,"ax",@progbits
	.align	2
	.global	main
	.type	main, %function
main:
.LFB2:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	w1, 3
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -16
	.cfi_offset 20, -8
	adrp	x20, .LC0
	add	x20, x20, :lo12:.LC0
	mov	x0, x20
	adrp	x19, .LC1
	bl	crc16
	add	x19, x19, :lo12:.LC1
	and	w1, w0, 65535
	mov	x0, x19
	bl	printf
	mov	w1, 3
	mov	x0, x20
	bl	crc16_ccitt
	and	w1, w0, 65535
	mov	x0, x19
	bl	printf
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Hi!"
.LC1:
	.string	"%x\n"
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
