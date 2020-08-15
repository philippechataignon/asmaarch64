	.arch armv7-a
	.type	add4, %function
add4:
	push	{r4}
	movs	r0, #0
	movs	r1, #0
	subs	r4, r1, #0
	ble	.L4
	mov	r3, r0
	add	r4, r3, r4, lsl #2
.L3:
	ldr	r2, [r3], #4
	adds	r0, r0, r2
	adc	r1, r1, r2, asr #31
	cmp	r3, r4
	bne	.L3
.L4:
	ldr	r4, [sp], #4
	bx	lr
