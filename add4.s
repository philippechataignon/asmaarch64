	.arch armv8-a
	.file	"add4.c"
	.text
	.align	2
	.p2align 3,,7
	.global	add4
	.type	add4, %function
add4:
.LFB0:
	.cfi_startproc
	mov	x4, x0
	cmp	w1, 0
	ble	.L4
	mov	x2, 0
	mov	x0, 0
	# .p2align 3
.L3:
	ldrsw	x3, [x4, x2, lsl 2]
	add	x2, x2, 1
	cmp	w1, w2
	add	x0, x0, x3
	bgt	.L3
	ret
	# .p2align 2
.L4:
	mov	x0, 0
	ret
	.cfi_endproc
.LFE0:
	.size	add4, .-add4
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
