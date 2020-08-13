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
	mov	w2, 0
	.p2align 3
.loop1:
    # load array[i] = [x4 + 4w2] in x3
    # sxtw = (s)igned e(xt)end (w)ord
    # ldrsw = load (s)igned (w)ord = 32 bits
	ldrsw	x3, [x4, w2, sxtw #2]
    # i++
	add	w2, w2, 1
    # x0 = accumulator
	add	x0, x0, x3
    # loop if w2 = i < w1 = narray
	cmp	w2, w1
	blt	.loop1
.end:
	ret
