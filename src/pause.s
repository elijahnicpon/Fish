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
	.file	"pause.c"
	.text
	.align	2
	.global	goPause
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goPause, %function
goPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	mov	ip, #5
	mov	r1, #67108864
	mov	r0, #7936
	ldr	r2, .L4+4
	ldr	r4, .L4+8
	str	ip, [r2]
	mov	r3, #256
	strh	r0, [r1, #8]	@ movhi
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r4
	mov	r3, #3920
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+20
	ldr	r1, .L4+24
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L4+28
	ldr	r1, .L4+32
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L4+36
	ldr	r1, .L4+40
	mov	lr, pc
	bx	r4
	mov	ip, #0
	mov	r2, #264
	mov	r0, #20
	mov	lr, #256
	mov	r5, #8
	mov	r3, #272
	ldr	r1, .L4+44
	strh	ip, [r1, #4]	@ movhi
	ldr	ip, .L4+48
	strh	r2, [r1, #28]	@ movhi
	ldr	r2, .L4+52
	strh	ip, [r1, #2]	@ movhi
	add	ip, ip, #64
	strh	ip, [r1, #10]	@ movhi
	strh	r2, [r1, #26]	@ movhi
	add	ip, ip, #16
	ldr	r2, .L4+56
	strh	ip, [r1, #18]	@ movhi
	add	ip, ip, #128
	strh	r5, [r1, #12]	@ movhi
	strh	lr, [r1, #20]	@ movhi
	strh	r3, [r1, #36]	@ movhi
	strh	r2, [r1]	@ movhi
	strh	r2, [r1, #8]	@ movhi
	strh	r0, [r1, #16]	@ movhi
	strh	r0, [r1, #24]	@ movhi
	strh	r0, [r1, #32]	@ movhi
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	strh	ip, [r1, #34]	@ movhi
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	hideSprites
	.word	state
	.word	DMANow
	.word	coral_bgPal
	.word	coral_bgTiles
	.word	100726784
	.word	coral_bgMap
	.word	83886592
	.word	pause_and_about_menus_ssPal
	.word	100728832
	.word	pause_and_about_menus_ssTiles
	.word	shadowOAM
	.word	-16374
	.word	-16230
	.word	16430
	.size	goPause, .-goPause
	.align	2
	.global	doPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	doPause, %function
doPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L20
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L7
	ldr	r2, .L20+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L17
.L7:
	tst	r3, #4
	beq	.L8
	ldr	r3, .L20+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L18
.L8:
	ldr	r3, .L20+8
	ldrh	r2, [r3, #48]
	tst	r2, #1
	bne	.L9
	ldrh	r3, [r3, #48]
	tst	r3, #2
	beq	.L19
.L9:
	ldr	r3, .L20+12
	mov	lr, pc
	bx	r3
	ldr	ip, .L20+16
	ldr	r3, [ip]
	add	r2, r3, #1
	cmp	r2, #0
	addlt	r3, r3, #8
	movge	r3, r2
	mov	r0, #0
	mov	r1, #67108864
	asr	r3, r3, #3
	ldr	lr, .L20+20
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	str	r0, [lr]
	str	r2, [ip]
	pop	{r4, lr}
	strh	r0, [r1, #18]	@ movhi
	strh	r3, [r1, #16]	@ movhi
	bx	lr
.L19:
	ldr	r3, .L20+24
	mov	lr, pc
	bx	r3
	b	.L9
.L17:
	ldr	r3, .L20+28
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L7
.L18:
	ldr	r0, .L20+32
	ldr	r3, .L20+36
	mov	lr, pc
	bx	r3
	b	.L8
.L21:
	.align	2
.L20:
	.word	oldButtons
	.word	buttons
	.word	67109120
	.word	waitForVBlank
	.word	hOff
	.word	vOff
	.word	goStartMenu
	.word	resumeGame
	.word	goPause
	.word	goInfoMenu
	.size	doPause, .-doPause
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
