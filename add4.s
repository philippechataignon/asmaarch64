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
    # x4 = array
	mov	x4, x0
    # w1 = narray
    # if zero, exit
	cmp	w1, 0
	ble	.L4
    # init x0, x2
    # x2 = loop index i
	mov	x2, 0
    # x0 = accumulator
	mov	x0, 0
	.p2align 3
.L3:
    # load array[i] = [x4 + 4x2] in x3
	ldrsw	x3, [x4, x2, lsl 2]
    # i++
	add	x2, x2, 1
    # i < narray = w1 -> .L3
	cmp	w1, w2
    # x0 = accumulator
	add	x0, x0, x3
	bgt	.L3
	ret
	.p2align 2
.L4:
	mov	x0, 0
	ret
	.cfi_endproc
.LFE0:
	.size	add4, .-add4
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
