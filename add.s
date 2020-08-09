	.text
	.p2align 3,,7
	.global	add
	.type	add, %function
//add:
//.LFB12:
//	// .cfi_startproc
//	add	w0, w0, w1
//	str	w0, [x2]
//	ret
//	// .cfi_endproc
//   	// .size	add, .-add


add:
.LFB1:
    # reserve 16 bytes on stack
	sub	sp, sp, #16
    # 0--x2--@8--w1--@12--w2--@
    # store w0, w1, x2 on stack
	str	w0, [sp, 12]
	str	w1, [sp, 8]
	str	x2, [sp]
    # read w0,w1 on stack
	ldr	w1, [sp, 12]
	ldr	w0, [sp, 8]
    # add in w1
	add	w1, w1, w0
    # store w1 in x2
	ldr	x0, [sp]
	str	w1, [x0]
    # restore sp
	add	sp, sp, 16
	ret
