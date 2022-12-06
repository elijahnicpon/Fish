	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"print.c"
	.text
	.align	2
	.global	mgba_printf_level
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	mgba_printf_level, %function
mgba_printf_level:
	@ Function supports interworking.
	@ args = 4, pretend = 12, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 1
	push	{r1, r2, r3}
	push	{r4, r5, lr}
	mov	r4, r0
	sub	sp, sp, #8
	add	r3, sp, #24
	mov	r1, #256
	ldr	r2, [sp, #20]
	ldr	r5, .L4
	ldr	r0, .L4+4
	str	r3, [sp, #4]
	mov	lr, pc
	bx	r5
	and	r4, r4, #7
	ldr	r3, .L4+8
	orr	r4, r4, #256
	strh	r4, [r3, #-255]	@ movhi
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, lr}
	add	sp, sp, #12
	bx	lr
.L5:
	.align	2
.L4:
	.word	vsnprintf
	.word	83883520
	.word	83884031
	.size	mgba_printf_level, .-mgba_printf_level
	.align	2
	.global	mgba_printf
	.syntax unified
	.arm
	.fpu softvfp
	.type	mgba_printf, %function
mgba_printf:
	@ Function supports interworking.
	@ args = 4, pretend = 16, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 1
	push	{r0, r1, r2, r3}
	push	{r4, lr}
	sub	sp, sp, #8
	add	r3, sp, #20
	ldr	r2, [sp, #16]
	mov	r1, #256
	ldr	r4, .L8
	ldr	r0, .L8+4
	str	r3, [sp, #4]
	mov	lr, pc
	bx	r4
	ldr	r3, .L8+8
	ldr	r2, .L8+12
	strh	r2, [r3, #-255]	@ movhi
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	add	sp, sp, #16
	bx	lr
.L9:
	.align	2
.L8:
	.word	vsnprintf
	.word	83883520
	.word	83884031
	.word	258
	.size	mgba_printf, .-mgba_printf
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Breakpoint Reached\000"
	.text
	.align	2
	.global	mgba_break
	.syntax unified
	.arm
	.fpu softvfp
	.type	mgba_break, %function
mgba_break:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	ldr	r1, .L11
	b	mgba_printf_level
.L12:
	.align	2
.L11:
	.word	.LC0
	.size	mgba_break, .-mgba_break
	.align	2
	.global	mgba_open
	.syntax unified
	.arm
	.fpu softvfp
	.type	mgba_open, %function
mgba_open:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L14
	ldr	r2, .L14+4
	strh	r2, [r3, #-127]	@ movhi
	ldr	r2, .L14+8
	ldrh	r0, [r3, #-127]
	sub	r3, r0, r2
	rsbs	r0, r3, #0
	adc	r0, r0, r3
	bx	lr
.L15:
	.align	2
.L14:
	.word	83884031
	.word	-16162
	.word	7658
	.size	mgba_open, .-mgba_open
	.align	2
	.global	mgba_close
	.syntax unified
	.arm
	.fpu softvfp
	.type	mgba_close, %function
mgba_close:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L17
	strh	r2, [r3, #-127]	@ movhi
	bx	lr
.L18:
	.align	2
.L17:
	.word	83884031
	.size	mgba_close, .-mgba_close
	.ident	"GCC: (devkitARM release 53) 9.1.0"
