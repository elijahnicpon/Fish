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
	.file	"info_menu.c"
	.text
	.align	2
	.global	doInfoMenu
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	doInfoMenu, %function
doInfoMenu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L19
	ldrh	r3, [r4]
	tst	r3, #1
	beq	.L2
	ldr	r2, .L19+4
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L16
.L2:
	tst	r3, #2
	beq	.L3
	ldr	r2, .L19+4
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L17
.L3:
	tst	r3, #4
	beq	.L4
	ldr	r3, .L19+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L18
.L4:
	ldr	r3, .L19+8
	mov	lr, pc
	bx	r3
	ldr	r1, .L19+12
	ldr	r3, [r1]
	add	r2, r3, #1
	cmp	r2, #0
	addlt	r3, r3, #8
	movge	r3, r2
	mov	r0, #67108864
	asr	r3, r3, #3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	str	r2, [r1]
	pop	{r4, lr}
	strh	r3, [r0, #16]	@ movhi
	bx	lr
.L18:
	ldr	r3, .L19+16
	mov	lr, pc
	bx	r3
	b	.L4
.L16:
	ldr	r3, .L19+20
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L2
.L17:
	ldr	r3, .L19+24
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L3
.L20:
	.align	2
.L19:
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.word	hOff
	.word	goStartMenu
	.word	goAboutMenu
	.word	goControlsMenu
	.size	doInfoMenu, .-doInfoMenu
	.align	2
	.global	goInfoMenu
	.syntax unified
	.arm
	.fpu softvfp
	.type	goInfoMenu, %function
goInfoMenu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L23
	mov	lr, pc
	bx	r3
	mov	ip, #1
	mov	r1, #67108864
	mov	r0, #7936
	ldr	r2, .L23+4
	ldr	r4, .L23+8
	str	ip, [r2]
	mov	r3, #256
	strh	r0, [r1, #8]	@ movhi
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L23+12
	mov	lr, pc
	bx	r4
	mov	r3, #3920
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L23+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L23+20
	ldr	r1, .L23+24
	mov	lr, pc
	bx	r4
	mov	r5, #0
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L23+28
	ldr	r1, .L23+32
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L23+36
	ldr	r1, .L23+40
	mov	lr, pc
	bx	r4
	mov	ip, #40
	mov	r3, #656
	mov	lr, #24
	mov	r0, #30
	mov	r2, #664
	ldr	r1, .L23+44
	str	r5, [r1]
	ldr	r1, .L23+48
	strh	ip, [r1]	@ movhi
	ldr	ip, .L23+52
	strh	r3, [r1, #20]	@ movhi
	ldr	r3, .L23+56
	strh	ip, [r1, #2]	@ movhi
	add	ip, ip, #78
	strh	lr, [r1, #4]	@ movhi
	strh	r3, [r1, #26]	@ movhi
	strh	r2, [r1, #28]	@ movhi
	strh	r0, [r1, #16]	@ movhi
	strh	r0, [r1, #24]	@ movhi
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	strh	ip, [r1, #18]	@ movhi
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L24:
	.align	2
.L23:
	.word	hideSprites
	.word	state
	.word	DMANow
	.word	coral_bgPal
	.word	coral_bgTiles
	.word	100726784
	.word	coral_bgMap
	.word	83886592
	.word	start_menus_ssPal
	.word	100728832
	.word	start_menus_ssTiles
	.word	hOff
	.word	shadowOAM
	.word	-16352
	.word	-16210
	.size	goInfoMenu, .-goInfoMenu
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	gameSpeed,4,4
	.comm	time,4,4
	.comm	shells_owned,4,4
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
