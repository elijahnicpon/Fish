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
	.file	"main.c"
	.text
	.align	2
	.global	init
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	init, %function
init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #4352
	mov	r2, #67108864
	push	{r4, lr}
	ldr	r3, .L4
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+4
	mov	lr, pc
	bx	r3
	ldr	r2, .L4+8
	ldr	r3, .L4+12
	ldrh	r2, [r2, #48]
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	setupInterrupts
	.word	setupSounds
	.word	67109120
	.word	hideSprites
	.word	goStartMenu
	.size	init, .-init
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Debugging Initialized :)\000"
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L28
	mov	lr, pc
	bx	r3
	ldr	r3, .L28+4
	mov	lr, pc
	bx	r3
	ldr	r0, .L28+8
	ldr	r3, .L28+12
	mov	lr, pc
	bx	r3
	ldr	r6, .L28+16
	ldr	r7, .L28+20
	ldr	r5, .L28+24
	ldr	fp, .L28+28
	ldr	r10, .L28+32
	ldr	r9, .L28+36
	ldr	r8, .L28+40
	ldr	r4, .L28+44
.L7:
	ldr	r2, [r6]
	ldrh	r3, [r7]
.L8:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #15
	ldrls	pc, [pc, r2, asl #2]
	b	.L8
.L10:
	.word	.L24
	.word	.L23
	.word	.L22
	.word	.L21
	.word	.L20
	.word	.L19
	.word	.L18
	.word	.L8
	.word	.L17
	.word	.L16
	.word	.L15
	.word	.L14
	.word	.L13
	.word	.L12
	.word	.L11
	.word	.L9
.L9:
	ldr	r3, .L28+48
	mov	lr, pc
	bx	r3
	b	.L7
.L11:
	ldr	r3, .L28+52
	mov	lr, pc
	bx	r3
	b	.L7
.L12:
	ldr	r3, .L28+56
	mov	lr, pc
	bx	r3
	b	.L7
.L13:
	ldr	r3, .L28+60
	mov	lr, pc
	bx	r3
	b	.L7
.L14:
	ldr	r3, .L28+64
	mov	lr, pc
	bx	r3
	b	.L7
.L15:
	ldr	r3, .L28+68
	mov	lr, pc
	bx	r3
	b	.L7
.L16:
	ldr	r3, .L28+72
	mov	lr, pc
	bx	r3
	b	.L7
.L17:
	ldr	r3, .L28+76
	mov	lr, pc
	bx	r3
	b	.L7
.L18:
	ldr	r3, .L28+80
	mov	lr, pc
	bx	r3
	b	.L7
.L19:
	ldr	r3, .L28+84
	mov	lr, pc
	bx	r3
	b	.L7
.L20:
	ldr	r3, .L28+88
	mov	lr, pc
	bx	r3
	b	.L7
.L21:
	mov	lr, pc
	bx	r9
	b	.L7
.L22:
	mov	lr, pc
	bx	r8
	b	.L7
.L23:
	mov	lr, pc
	bx	r10
	b	.L7
.L24:
	mov	lr, pc
	bx	fp
	b	.L7
.L29:
	.align	2
.L28:
	.word	init
	.word	mgba_open
	.word	.LC0
	.word	mgba_printf
	.word	state
	.word	buttons
	.word	oldButtons
	.word	doStartMenu
	.word	doInfoMenu
	.word	doAboutMenu
	.word	doControlsMenu
	.word	67109120
	.word	doDeathDynamite
	.word	doDeathCyanide
	.word	doDeathShark
	.word	doDeathBoat
	.word	doDeathOil
	.word	doDeathPlastic
	.word	doDeathEnergy
	.word	doWin
	.word	doUpgradeMenu
	.word	doPause
	.word	doGame
	.size	main, .-main
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	gameSpeed,4,4
	.comm	time,4,4
	.comm	shells_owned,4,4
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
