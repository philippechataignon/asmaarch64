	.global	add
add:
	add	r1, r1, r0
	str	r1, [r2]
	bx	lr
