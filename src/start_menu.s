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
	.file	"start_menu.c"
	.text
	.align	2
	.global	goStartMenu
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goStartMenu, %function
goStartMenu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	mov	r5, #0
	mov	r1, #67108864
	mov	r0, #7936
	ldr	r2, .L4+4
	ldr	r4, .L4+8
	str	r5, [r2]
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
	mov	lr, #640
	mov	ip, #40
	mov	r0, #30
	mov	r6, #8
	mov	r2, #648
	ldr	r3, .L4+44
	str	r5, [r3]
	ldr	r3, .L4+48
	ldr	r1, .L4+52
	str	r5, [r3]
	ldr	r3, .L4+56
	strh	lr, [r1, #20]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	ldr	lr, .L4+60
	add	r3, r3, #64
	strh	r3, [r1, #10]	@ movhi
	add	r3, r3, #130
	strh	lr, [r1, #18]	@ movhi
	strh	r5, [r1, #4]	@ movhi
	strh	r6, [r1, #12]	@ movhi
	strh	r3, [r1, #26]	@ movhi
	strh	r2, [r1, #28]	@ movhi
	strh	r0, [r1]	@ movhi
	strh	r0, [r1, #8]	@ movhi
	strh	ip, [r1, #16]	@ movhi
	strh	ip, [r1, #24]	@ movhi
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+64
	ldr	r1, [r3]
	mov	r2, #1
	ldr	r0, .L4+68
	ldr	r3, .L4+72
	sub	r1, r1, #500
	mov	lr, pc
	bx	r3
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
	.word	start_menus_ssPal
	.word	100728832
	.word	start_menus_ssTiles
	.word	hOff
	.word	time
	.word	shadowOAM
	.word	-16364
	.word	-16234
	.word	sixth_station_length
	.word	sixth_station_data
	.word	playSoundA
	.size	goStartMenu, .-goStartMenu
	.align	2
	.global	doStartMenu
	.syntax unified
	.arm
	.fpu softvfp
	.type	doStartMenu, %function
doStartMenu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L19
	ldrh	r3, [r5]
	tst	r3, #8
	bne	.L15
	ldr	r4, .L19+4
.L7:
	tst	r3, #4
	beq	.L8
	ldr	r3, .L19+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L18
.L8:
	ldr	r3, .L19+12
	mov	lr, pc
	bx	r3
	ldr	r0, .L19+16
	ldr	r3, [r0]
	add	r1, r3, #1
	cmp	r1, #0
	addlt	r3, r3, #8
	movge	r3, r1
	mov	ip, #67108864
	ldr	r2, [r4]
	asr	r3, r3, #3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r2, r2, #1
	str	r2, [r4]
	str	r1, [r0]
	pop	{r4, r5, r6, lr}
	strh	r3, [ip, #16]	@ movhi
	bx	lr
.L15:
	ldr	r2, .L19+8
	ldrh	r2, [r2]
	tst	r2, #8
	ldr	r4, .L19+4
	bne	.L7
	ldr	r3, .L19+20
	ldr	r0, [r4]
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	b	.L7
.L18:
	ldr	r0, .L19+24
	ldr	r3, .L19+28
	mov	lr, pc
	bx	r3
	b	.L8
.L20:
	.align	2
.L19:
	.word	oldButtons
	.word	time
	.word	buttons
	.word	waitForVBlank
	.word	hOff
	.word	goGame
	.word	goStartMenu
	.word	goInfoMenu
	.size	doStartMenu, .-doStartMenu
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
