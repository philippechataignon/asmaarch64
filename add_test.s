	.text
	.file	"add_test.c"
	.globl	main                    // -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   // @main
// %bb.0:
	sub	sp, sp, #48             // =48
	stp	x29, x30, [sp, #32]     // 8-byte Folded Spill
	add	x29, sp, #32            // =32
	mov	w0, #0
	orr	w8, wzr, #0x3
	orr	w9, wzr, #0x4
	adrp	x10, .L.str
	add	x10, x10, :lo12:.L.str
	add	x2, sp, #16             // =16
	stur	wzr, [x29, #-4]
	stur	w8, [x29, #-8]
	stur	w9, [x29, #-12]
	str	wzr, [sp, #16]
	ldur	w8, [x29, #-8]
	ldur	w1, [x29, #-12]
	str	w0, [sp, #12]           // 4-byte Folded Spill
	mov	w0, w8
	str	x10, [sp]               // 8-byte Folded Spill
	bl	add
	ldr	w1, [sp, #16]
	ldr	x0, [sp]                // 8-byte Folded Reload
	bl	printf
	ldr	w8, [sp, #12]           // 4-byte Folded Reload
	mov	w0, w8
	ldp	x29, x30, [sp, #32]     // 8-byte Folded Reload
	add	sp, sp, #48             // =48
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
                                        // -- End function
	.type	.L.str,@object          // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d\n"
	.size	.L.str, 4


	.ident	"clang version 7.0.1-8 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym main
	.addrsig_sym add
	.addrsig_sym printf
