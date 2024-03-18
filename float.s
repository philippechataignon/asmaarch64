	.arch armv7-a
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"float.c"
	.text
	.align	1
	.p2align 2,,3
	.global	calc
	.arch armv7-a
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	calc, %function
calc:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	vldr.64	d6, .L3
	vmul.f64	d7, d0, d6
	vmul.f64	d0, d7, d0
	vmul.f64	d7, d0, d6
	vmul.f64	d0, d0, d7
	vmul.f64	d7, d0, d6
	vmul.f64	d0, d0, d7
	vmul.f64	d6, d0, d6
	vmul.f64	d0, d0, d6
	bx	lr
.L4:
	.align	3
.L3:
	.word	858993459
	.word	1072902963
	.size	calc, .-calc
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
