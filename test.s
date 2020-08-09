	.text
	.file	"test.c"
	.globl	calc                    // -- Begin function calc
	.p2align	2
	.type	calc,@function
calc:                                   // @calc
// %bb.0:
	str	x23, [sp, #-64]!        // 8-byte Folded Spill
	stp	x22, x21, [sp, #16]     // 8-byte Folded Spill
	mov	w22, #26215
	movk	w22, #26214, lsl #16
	smull	x8, w1, w22
	lsr	x9, x8, #63
	asr	x8, x8, #33
	add	w8, w8, w9
	adrp	x21, .L.str
	add	w8, w8, w8, lsl #2
	add	x21, x21, :lo12:.L.str
	stp	x20, x19, [sp, #32]     // 8-byte Folded Spill
	mov	w19, w1
	mov	w20, w0
	sub	w1, w1, w8
	mov	x0, x21
	stp	x29, x30, [sp, #48]     // 8-byte Folded Spill
	add	x29, sp, #48            // =48
	bl	printf
	add	w8, w20, w19
	smull	x9, w8, w22
	lsr	x10, x9, #63
	asr	x9, x9, #33
	add	w9, w9, w10
	add	w9, w9, w9, lsl #2
	sub	w1, w8, w9
	mov	x0, x21
	bl	printf
	lsl	w23, w20, #1
	add	w8, w23, w19
	smull	x9, w8, w22
	lsr	x10, x9, #63
	asr	x9, x9, #33
	add	w9, w9, w10
	add	w9, w9, w9, lsl #2
	sub	w1, w8, w9
	mov	x0, x21
	bl	printf
	add	w8, w23, w20
	add	w8, w8, w19
	smull	x9, w8, w22
	lsr	x10, x9, #63
	asr	x9, x9, #33
	mov	x0, x21
	ldp	x29, x30, [sp, #48]     // 8-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 8-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 8-byte Folded Reload
	add	w9, w9, w10
	add	w9, w9, w9, lsl #2
	sub	w1, w8, w9
	ldr	x23, [sp], #64          // 8-byte Folded Reload
	b	printf
.Lfunc_end0:
	.size	calc, .Lfunc_end0-calc
                                        // -- End function
	.globl	add                     // -- Begin function add
	.p2align	2
	.type	add,@function
add:                                    // @add
// %bb.0:
	add	w8, w1, w0
	str	w8, [x2]
	ret
.Lfunc_end1:
	.size	add, .Lfunc_end1-add
                                        // -- End function
	.type	.L.str,@object          // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%i\n"
	.size	.L.str, 4


	.ident	"clang version 7.0.1-8 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
