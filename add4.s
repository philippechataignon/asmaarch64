	.arch armv8-a
	.file	"add4.c"
	.text
	.align	2
	.p2align 4,,11
	.global	add4
	.type	add4, %function
add4:
.LFB0:
	.cfi_startproc
	mov	x4, x0
	cmp	x1, 0
	ble	.L7
	sub	x0, x1, #1
	cmp	x0, 3
	bls	.L8
	lsr	x3, x1, 2
	mov	x2, x4
	movi	v0.4s, 0
	add	x3, x4, x3, lsl 4
	.p2align 3,,7
.L4:
	ldr	q1, [x2], 16
	saddw	v0.2d, v0.2d, v1.2s
	saddw2	v0.2d, v0.2d, v1.4s
	cmp	x2, x3
	bne	.L4
	addp	d0, v0.2d
	and	x2, x1, -4
	umov	x0, v0.d[0]
	tst	x1, 3
	beq	.L1
.L3:
	ldrsw	x5, [x4, x2, lsl 2]
	add	x3, x2, 1
	lsl	x6, x2, 2
	add	x0, x0, x5
	cmp	x1, x3
	ble	.L1
	add	x4, x4, x6
	add	x3, x2, 2
	ldrsw	x5, [x4, 4]
	add	x0, x0, x5
	cmp	x1, x3
	ble	.L1
	ldrsw	x3, [x4, 8]
	add	x2, x2, 3
	add	x0, x0, x3
	cmp	x1, x2
	ble	.L1
	ldrsw	x1, [x4, 12]
	add	x0, x0, x1
.L1:
	ret
	.p2align 2,,3
.L7:
	mov	x0, 0
	ret
.L8:
	mov	x2, 0
	mov	x0, 0
	b	.L3
	.cfi_endproc
.LFE0:
	.size	add4, .-add4
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
