	.file	"add4.c"
	.text
	.p2align 4
	.globl	add4
	.type	add4, @function
add4:
.LFB0:
	.cfi_startproc
	endbr64
	testl	%esi, %esi
	jle	.L4
	leal	-1(%rsi), %eax
	leaq	4(%rdi,%rax,4), %rcx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L3:
	movslq	(%rdi), %rdx
	addq	$4, %rdi
	addq	%rdx, %rax
	cmpq	%rcx, %rdi
	jne	.L3
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE0:
	.size	add4, .-add4
	.ident	"GCC: (Ubuntu 9.3.0-10ubuntu2) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
