	.arch armv8-a
	.file	"add.c"
	.text
	.align	2
	.global	add
	.type	add, %function
add:
.LFB0:
	.cfi_startproc
	add	x0, x0, x1
	ret
	.cfi_endproc
.LFE0:
	.size	add, .-add
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
