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
	.file	"about_menu.c"
	.text
	.align	2
	.global	doAboutMenu
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	doAboutMenu, %function
doAboutMenu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L9
	ldrh	r3, [r3]
	tst	r3, #4
	push	{r4, lr}
	beq	.L2
	ldr	r3, .L9+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L8
.L2:
	ldr	r4, .L9+8
	ldr	r3, .L9+12
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	add	r1, r3, #1
	cmp	r1, #0
	addlt	r3, r3, #8
	movge	r3, r1
	mov	ip, #0
	mov	r0, #67108864
	ldr	lr, .L9+16
	asr	r3, r3, #3
	ldr	r2, [lr]
	str	r1, [r4]
	lsl	r3, r3, #16
	ldr	r1, .L9+20
	lsr	r3, r3, #16
	add	r2, r2, #1
	str	r2, [lr]
	str	ip, [r1]
	pop	{r4, lr}
	strh	ip, [r0, #18]	@ movhi
	strh	r3, [r0, #16]	@ movhi
	bx	lr
.L8:
	ldr	r3, .L9+24
	mov	lr, pc
	bx	r3
	b	.L2
.L10:
	.align	2
.L9:
	.word	oldButtons
	.word	buttons
	.word	hOff
	.word	waitForVBlank
	.word	time
	.word	vOff
	.word	goInfoMenu
	.size	doAboutMenu, .-doAboutMenu
	.align	2
	.global	goAboutMenu
	.syntax unified
	.arm
	.fpu softvfp
	.type	goAboutMenu, %function
goAboutMenu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L13
	mov	lr, pc
	bx	r3
	mov	r10, #3
	mov	r2, #67108864
	mov	r1, #7936
	ldr	r3, .L13+4
	ldr	r4, .L13+8
	str	r10, [r3]
	mov	r0, r10
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L13+12
	mov	lr, pc
	bx	r4
	mov	r0, r10
	mov	r3, #3920
	mov	r2, #100663296
	ldr	r1, .L13+16
	mov	lr, pc
	bx	r4
	mov	r0, r10
	mov	r3, #1024
	ldr	r2, .L13+20
	ldr	r1, .L13+24
	mov	lr, pc
	bx	r4
	mov	r0, r10
	mov	r3, #256
	ldr	r2, .L13+28
	ldr	r1, .L13+32
	mov	lr, pc
	bx	r4
	mov	r0, r10
	mov	r3, #16384
	ldr	r2, .L13+36
	ldr	r1, .L13+40
	mov	lr, pc
	bx	r4
	mov	lr, #784
	mov	r5, #776
	ldr	r1, .L13+44
	strh	lr, [r1, #60]	@ movhi
	ldr	lr, .L13+48
	strh	lr, [r1, #66]	@ movhi
	mov	lr, #424	@ movhi
	mov	ip, #20
	strh	r5, [r1, #52]	@ movhi
	mov	r5, #416	@ movhi
	mov	fp, #128
	mov	r2, #84
	mov	r3, #512
	mov	r9, #136
	mov	r8, #520
	mov	r7, #528
	mov	r6, #768
	strh	lr, [r1, #76]	@ movhi
	ldr	lr, .L13+52
	strh	ip, [r1, #16]	@ movhi
	strh	ip, [r1, #24]	@ movhi
	strh	ip, [r1, #32]	@ movhi
	ldr	ip, .L13+56
	mov	r0, r10
	strh	lr, [r1]	@ movhi
	ldr	r10, .L13+60
	strh	lr, [r1, #8]	@ movhi
	ldr	lr, .L13+64
	strh	r5, [r1, #68]	@ movhi
	strh	ip, [r1, #26]	@ movhi
	ldr	r5, .L13+68
	strh	ip, [r1, #50]	@ movhi
	ldr	ip, .L13+72
	strh	r10, [r1, #2]	@ movhi
	strh	lr, [r1, #18]	@ movhi
	strh	lr, [r1, #42]	@ movhi
	add	r10, r10, #64
	add	lr, lr, fp
	strh	r3, [r1, #20]	@ movhi
	strh	fp, [r1, #4]	@ movhi
	strh	r9, [r1, #12]	@ movhi
	strh	r10, [r1, #10]	@ movhi
	strh	r8, [r1, #28]	@ movhi
	strh	r7, [r1, #36]	@ movhi
	strh	r6, [r1, #44]	@ movhi
	strh	r5, [r1, #74]	@ movhi
	strh	lr, [r1, #34]	@ movhi
	strh	lr, [r1, #58]	@ movhi
	strh	r2, [r1, #40]	@ movhi
	strh	r2, [r1, #48]	@ movhi
	strh	r2, [r1, #56]	@ movhi
	strh	ip, [r1, #64]	@ movhi
	mov	r2, #117440512
	strh	ip, [r1, #72]	@ movhi
	mov	lr, pc
	bx	r4
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L14:
	.align	2
.L13:
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
	.word	-16304
	.word	16388
	.word	-16296
	.word	-16300
	.word	-16360
	.word	-16240
	.word	16532
	.size	goAboutMenu, .-goAboutMenu
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
