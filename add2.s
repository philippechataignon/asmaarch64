	.text
	.p2align 3,,7
	.global	add
	.type	add, %function
add:
	smaddl	x0, w0, w1, x2
	ret
