	.text
	.file	"float.c"
	.globl	calc                    // -- Begin function calc
	.p2align	2
	.type	calc,@function
calc:                                   // @calc
// %bb.0:
	sub	sp, sp, #16             // =16
	str	d0, [sp, #8]
	str	wzr, [sp, #4]
.LBB0_1:                                // =>This Inner Loop Header: Depth=1
	orr	w8, wzr, #0x4
	ldr	w9, [sp, #4]
	cmp	w9, w8
	cset	w8, lt
	tbnz	w8, #0, .LBB0_2
	b	.LBB0_4
.LBB0_2:                                //   in Loop: Header=BB0_1 Depth=1
	mov	x8, #3689348814741910323
	movk	x8, #16371, lsl #48
	fmov	d0, x8
	ldr	d1, [sp, #8]
	fmul	d0, d1, d0
	ldr	d1, [sp, #8]
	fmul	d0, d1, d0
	str	d0, [sp, #8]
// %bb.3:                               //   in Loop: Header=BB0_1 Depth=1
	ldr	w8, [sp, #4]
	add	w8, w8, #1              // =1
	str	w8, [sp, #4]
	b	.LBB0_1
.LBB0_4:
	ldr	d0, [sp, #8]
	add	sp, sp, #16             // =16
	ret
.Lfunc_end0:
	.size	calc, .Lfunc_end0-calc
                                        // -- End function

	.ident	"clang version 7.0.1-8 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym calc
