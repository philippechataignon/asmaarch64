	.arch armv8-a
	.file	"add4.c"
	.text
	.p2align 3
	.global	add4
	.type	add4, %function

add4:
    # x4 = array
	mov	x4, x0
    # x0 = accumulator
	mov	x0, 0
    # w1 = narray
    # if zero or less, exit
	cmp	w1, 0
	ble	.end
    # w2 = loop index i
	mov	x2, 0
	.p2align 3
.loop1:
    # load array[i] = [x4 + 4x2] in x3
	ldrsw	x3, [x4, x2, lsl 2]
    # i++
	add	x2, x2, 1
    # x0 = accumulator
	add	x0, x0, x3
    # i < narray = w1 -> .L3
	cmp	w1, w2
	bgt	.loop1
.end:
	ret
