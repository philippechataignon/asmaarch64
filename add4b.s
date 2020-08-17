	.arch armv8-a
	.text
	.align	2
	.global	add4
	.type	add4, %function
add4:
	mov	x2, x0
	mov	x0, 0
.L3:
	ldrsw	x3, [x2, w1, sxtw #2]
	add	    x0, x0, x3
	subs	x1, x1, #1
	bne	.L3
    ret
