	.arch armv8-a
	.file	"putdec.c"
	.text
	.align	2
	.p2align 3,,7
	.global	putdec
	.type	putdec, %function
putdec:
.LFB11:
	.cfi_startproc
	sxth	w0, w0
	tbz	w0, #31, .L2
	neg	w0, w0
	mov	w2, 45
	strb	w2, [x1], 1
	sxth	w0, w0
.L2:
	ubfx	x5, x0, 8, 4
	ubfx	x4, x0, 12, 4
	add	w2, w4, w5
	ubfx	x3, x0, 4, 4
	add	w2, w2, w3
	and	w0, w0, 15
	mov	w8, 205
	add	w7, w5, w5, lsl 2
	add	w2, w2, w2, lsl 1
	add	w6, w4, w4, lsl 3
	add	w6, w6, w7
	mov	w7, 26
	add	w0, w0, w2, lsl 1
	mov	w2, -10
	and	w0, w0, 255
	add	w9, w0, 48
	mul	w0, w0, w8
	lsr	w0, w0, 11
	add	w3, w3, w0
	add	w3, w3, w6
	and	w3, w3, 255
	madd	w0, w0, w2, w9
	add	w6, w3, 48
	strb	w0, [x1, 4]
	mul	w3, w3, w8
	lsr	w0, w3, 11
	add	w5, w0, w5, lsl 1
	add	w3, w5, 48
	madd	w0, w0, w2, w6
	mul	w5, w5, w7
	strb	w0, [x1, 3]
	lsr	w5, w5, 8
	add	w4, w5, w4, lsl 2
	add	w0, w4, 48
	madd	w5, w5, w2, w3
	mul	w4, w4, w7
	strb	w5, [x1, 2]
	lsr	w4, w4, 8
	add	w3, w4, 48
	strb	w3, [x1]
	madd	w4, w4, w2, w0
	strb	w4, [x1, 1]
	ret
	.cfi_endproc
.LFE11:
	.size	putdec, .-putdec
	.section	.text.startup,"ax",@progbits
	.align	2
	.p2align 3,,7
	.global	main
	.type	main, %function
main:
.LFB12:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	w0, -12343
	add	x10, sp, 24
	mov	x29, sp
	mov	x1, x10
	str	xzr, [sp, 24]
	bl	putdec
	mov	x0, x10
	bl	puts
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE12:
	.size	main, .-main
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
