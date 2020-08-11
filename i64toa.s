	.arch armv8-a
	.file	"i64toa.c"
	.text
	.align	2
	.p2align 3,,7
	.global	writeInt64
	.type	writeInt64, %function
writeInt64:
.LFB23:
	.cfi_startproc
	tbz	x0, #63, .L2
	neg	x0, x0
	mov	w2, 45
	strb	w2, [x1], 1
.L2:
	mov	x6, -3689348814741910324
	mov	x4, x1
	movk	x6, 0xcccd, lsl 0
	b	.L3
	.p2align 2
.L6:
	mov	x4, x5
.L3:
	umulh	x3, x0, x6
	mov	x5, x4
	cmp	x0, 9
	lsr	x3, x3, 3
	add	x2, x3, x3, lsl 2
	sub	x2, x0, x2, lsl 1
	mov	x0, x3
	add	w2, w2, 48
	and	w2, w2, 255
	strb	w2, [x5], 1
	bgt	.L6
	cmp	x1, x4
	bcc	.L5
	b	.L1
	.p2align 2
.L8:
	ldrb	w2, [x4]
.L5:
	ldrb	w0, [x1]
	strb	w0, [x4], -1
	strb	w2, [x1], 1
	cmp	x4, x1
	bhi	.L8
.L1:
	ret
	.cfi_endproc
.LFE23:
	.size	writeInt64, .-writeInt64
	.section	.text.startup,"ax",@progbits
	.align	2
	.p2align 3,,7
	.global	main
	.type	main, %function
main:
.LFB24:
	.cfi_startproc
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	mov	x1, 1
	mov	x0, 1024
	mov	x29, sp
	bl	calloc
	mov	x7, x0
	mov	x1, x0
	mov	x0, -7689
	movk	x0, 0x8a32, lsl 16
	movk	x0, 0xfffa, lsl 32
	bl	writeInt64
	mov	x0, x7
	bl	puts
	mov	w0, 0
	ldp	x29, x30, [sp], 16
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
