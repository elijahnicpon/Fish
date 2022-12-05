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
	.file	"win.c"
	.text
	.align	2
	.global	drawWin
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawWin, %function
drawWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L11
	ldr	r2, [r1, #12]
	ldr	r3, .L11+4
	cmp	r2, #0
	ldr	ip, .L11+8
	ldr	r2, .L11+12
	push	{r4, lr}
	mov	r0, #64
	mov	lr, #100
	strh	ip, [r3, #2]	@ movhi
	ldr	ip, [r2]
	moveq	r2, #512
	strh	lr, [r3]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	strheq	r2, [r3, #8]	@ movhi
	beq	.L6
	ldr	r2, .L11+16
	smull	lr, r0, r2, ip
	asr	r2, ip, #31
	rsb	r2, r2, r0, asr #2
	add	r2, r2, r2, lsl #2
	cmp	ip, r2, lsl #1
	ldr	lr, [r1, #8]
	ldr	r2, [r1]
	ldr	r0, [r1, #4]
	beq	.L10
.L3:
	cmp	r2, #122
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	moveq	r4, #0
	mvn	r2, r2, lsr #17
	streq	r4, [r1, #12]
	add	r1, r1, lr, lsl #2
	ldr	r1, [r1, #16]
	and	r0, r0, #255
	orr	r0, r0, #16384
	strh	r2, [r3, #10]	@ movhi
	strh	r1, [r3, #12]	@ movhi
	strh	r0, [r3, #8]	@ movhi
.L6:
	cmp	ip, #720
	ble	.L1
	mov	r2, #80
	mov	r4, #320
	mov	lr, #328
	mov	ip, #336
	ldr	r0, .L11+20
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #24]	@ movhi
	strh	r2, [r3, #32]	@ movhi
	ldr	r1, .L11+24
	ldr	r2, .L11+28
	strh	r4, [r3, #20]	@ movhi
	strh	lr, [r3, #28]	@ movhi
	strh	ip, [r3, #36]	@ movhi
	strh	r0, [r3, #18]	@ movhi
	strh	r1, [r3, #26]	@ movhi
	strh	r2, [r3, #34]	@ movhi
.L1:
	pop	{r4, lr}
	bx	lr
.L10:
	add	lr, lr, #1
	rsbs	r4, lr, #0
	and	r4, r4, #3
	and	lr, lr, #3
	rsbpl	lr, r4, #0
	cmp	r0, #111
	add	r2, r2, #1
	subgt	r0, r0, #1
	addle	r0, r0, #1
	str	r2, [r1]
	str	lr, [r1, #8]
	str	r0, [r1, #4]
	b	.L3
.L12:
	.align	2
.L11:
	.word	.LANCHOR0
	.word	shadowOAM
	.word	-16268
	.word	wintime
	.word	1717986919
	.word	-16334
	.word	-16270
	.word	-16206
	.size	drawWin, .-drawWin
	.align	2
	.global	doWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	doWin, %function
doWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L20
	mov	lr, pc
	bx	r3
	ldr	r2, .L20+4
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	ldr	r4, .L20+8
	bl	drawWin
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L20+12
	mov	lr, pc
	bx	r4
	ldr	r3, .L20+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L14
	ldr	r3, .L20+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L19
.L14:
	mov	r3, #67108864
	mov	r2, #0
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	bx	lr
.L19:
	ldr	r3, .L20+24
	mov	lr, pc
	bx	r3
	b	.L14
.L21:
	.align	2
.L20:
	.word	waitForVBlank
	.word	wintime
	.word	DMANow
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
	.word	goStartMenu
	.size	doWin, .-doWin
	.align	2
	.global	goWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goWin, %function
goWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L24
	mov	lr, pc
	bx	r3
	mov	ip, #8
	mov	r1, #67108864
	mov	r2, #4352
	mov	r0, #7936
	ldr	r3, .L24+4
	ldr	r4, .L24+8
	str	ip, [r3]
	strh	r2, [r1]	@ movhi
	mov	r3, #256
	strh	r0, [r1, #8]	@ movhi
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L24+12
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L24+16
	ldr	r1, .L24+20
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L24+24
	ldr	r1, .L24+28
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L24+32
	ldr	r1, .L24+36
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L24+40
	ldr	r1, .L24+44
	mov	lr, pc
	bx	r4
	mov	r0, #100
	mvn	lr, #23
	mov	r5, #64
	mov	r3, #110
	mov	r2, #1
	mov	ip, #0
	ldr	r1, .L24+48
	strh	r0, [r1]	@ movhi
	ldr	r0, .L24+52
	strh	r0, [r1, #2]	@ movhi
	ldr	r0, .L24+56
	strh	r5, [r1, #4]	@ movhi
	str	lr, [r0]
	str	r3, [r0, #4]
	str	r2, [r0, #12]
	str	ip, [r0, #8]
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	hideSprites
	.word	state
	.word	DMANow
	.word	win_bgPal
	.word	4320
	.word	win_bgTiles
	.word	100726784
	.word	win_bgMap
	.word	83886592
	.word	win_ssPal
	.word	100728832
	.word	win_ssTiles
	.word	shadowOAM
	.word	-16268
	.word	.LANCHOR0
	.size	goWin, .-goWin
	.global	clark
	.global	clarkFrames
	.comm	shadowOAM,1024,4
	.comm	wintime,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	gameSpeed,4,4
	.comm	time,4,4
	.comm	shells_owned,4,4
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	clark, %object
	.size	clark, 16
clark:
	.word	-24
	.word	110
	.word	0
	.word	1
	.type	clarkFrames, %object
	.size	clarkFrames, 16
clarkFrames:
	.word	8
	.word	4
	.word	0
	.word	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
