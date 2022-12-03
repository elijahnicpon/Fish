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
	.file	"game.c"
	.text
	.align	2
	.global	checkNoEnergy
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkNoEnergy, %function
checkNoEnergy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L3
	ldr	r0, [r3, #40]
	cmp	r0, #0
	movgt	r0, #0
	movle	r0, #1
	bx	lr
.L4:
	.align	2
.L3:
	.word	player
	.size	checkNoEnergy, .-checkNoEnergy
	.align	2
	.global	doProgressBar
	.syntax unified
	.arm
	.fpu softvfp
	.type	doProgressBar, %function
doProgressBar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L8
	ldr	r2, .L8+4
	ldr	r3, [r3]
	smull	r0, r1, r2, r3
	asr	r2, r3, #31
	rsb	r2, r2, r1, asr #4
	add	r2, r2, r2, lsl #2
	sub	r2, r3, r2, lsl #3
	cmp	r2, #20
	ble	.L6
	add	r2, r3, #127
	cmp	r3, #0
	movlt	r3, r2
	asr	r3, r3, #7
	rsb	r3, r3, #108
	and	r3, r3, #255
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r2, .L8+8
	ldr	r0, .L8+12
	ldr	r1, .L8+16
	strh	r3, [r2, #192]	@ movhi
	strh	r0, [r2, #194]	@ movhi
	strh	r1, [r2, #196]	@ movhi
	bx	lr
.L6:
	mov	r2, #512
	ldr	r3, .L8+8
	strh	r2, [r3, #192]	@ movhi
	bx	lr
.L9:
	.align	2
.L8:
	.word	time
	.word	1717986919
	.word	shadowOAM
	.word	-16153
	.word	786
	.size	doProgressBar, .-doProgressBar
	.global	__aeabi_idiv
	.align	2
	.global	doEnergyBar
	.syntax unified
	.arm
	.fpu softvfp
	.type	doEnergyBar, %function
doEnergyBar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L15
	ldr	r0, [r3, #40]
	rsb	r0, r0, r0, lsl #3
	ldr	r1, [r3, #44]
	push	{r4, lr}
	ldr	r3, .L15+4
	lsl	r0, r0, #2
	mov	lr, pc
	bx	r3
	cmp	r0, #27
	bgt	.L10
	mov	r2, #512
	ldr	r3, .L15+8
	add	r0, r3, r0, lsl #3
	add	r3, r3, #224
.L12:
	strh	r2, [r0, #240]	@ movhi
	add	r0, r0, #8
	cmp	r0, r3
	bne	.L12
.L10:
	pop	{r4, lr}
	bx	lr
.L16:
	.align	2
.L15:
	.word	player
	.word	__aeabi_idiv
	.word	shadowOAM
	.size	doEnergyBar, .-doEnergyBar
	.align	2
	.global	initEnergyBar
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnergyBar, %function
initEnergyBar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #9
	mov	ip, #2
	mov	r0, #136
	ldr	r2, .L21
	add	r1, r2, #224
.L18:
	strh	r3, [r2, #242]	@ movhi
	strh	ip, [r2, #240]	@ movhi
	strh	r0, [r2, #244]	@ movhi
	add	r3, r3, #2
	add	r2, r2, #8
	lsl	r3, r3, #16
	cmp	r2, r1
	lsr	r3, r3, #16
	bne	.L18
	bx	lr
.L22:
	.align	2
.L21:
	.word	shadowOAM
	.size	initEnergyBar, .-initEnergyBar
	.align	2
	.global	doShieldDisplay
	.syntax unified
	.arm
	.fpu softvfp
	.type	doShieldDisplay, %function
doShieldDisplay:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #11
	mov	r1, #59
	ldr	r3, .L24
	ldr	r2, [r3, #32]
	ldr	r3, .L24+4
	add	r2, r2, #96
	strh	r2, [r3, #236]	@ movhi
	strh	r0, [r3, #232]	@ movhi
	strh	r1, [r3, #234]	@ movhi
	bx	lr
.L25:
	.align	2
.L24:
	.word	player
	.word	shadowOAM
	.size	doShieldDisplay, .-doShieldDisplay
	.align	2
	.global	doShellDisplay
	.syntax unified
	.arm
	.fpu softvfp
	.type	doShellDisplay, %function
doShellDisplay:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L28
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r3, [r3]
	ldr	r8, .L28+4
	smull	r1, r0, r8, r3
	ldr	r2, .L28+8
	smull	r1, r2, r3, r2
	mov	lr, #11
	mov	r7, #37
	mov	r6, #30
	mov	r5, #23
	mov	r4, #16
	asr	ip, r3, #31
	rsb	r0, ip, r0, asr #2
	smull	r1, r10, r8, r0
	rsb	r2, ip, r2, asr #5
	smull	r1, r8, r2, r8
	ldr	r9, .L28+12
	smull	r1, r9, r3, r9
	asr	r1, r0, #31
	rsb	r1, r1, r10, asr #2
	add	r1, r1, r1, lsl #2
	sub	r1, r0, r1, lsl #1
	add	r0, r0, r0, lsl #2
	sub	r0, r3, r0, lsl #1
	ldr	r3, .L28+16
	add	r1, r1, #96
	strh	r1, [r3, #212]	@ movhi
	asr	r1, r2, #31
	rsb	r8, r1, r8, asr #2
	add	r8, r8, r8, lsl #2
	rsb	ip, ip, r9, asr #6
	sub	r2, r2, r8, lsl #1
	add	r0, r0, #96
	add	ip, ip, #96
	add	r2, r2, #96
	strh	r7, [r3, #202]	@ movhi
	strh	r6, [r3, #210]	@ movhi
	strh	r5, [r3, #218]	@ movhi
	strh	r4, [r3, #226]	@ movhi
	strh	lr, [r3, #200]	@ movhi
	strh	lr, [r3, #208]	@ movhi
	strh	lr, [r3, #216]	@ movhi
	strh	lr, [r3, #224]	@ movhi
	strh	r0, [r3, #204]	@ movhi
	strh	r2, [r3, #220]	@ movhi
	strh	ip, [r3, #228]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L29:
	.align	2
.L28:
	.word	shells_owned
	.word	1717986919
	.word	1374389535
	.word	274877907
	.word	shadowOAM
	.size	doShellDisplay, .-doShellDisplay
	.align	2
	.global	updateAndDrawHUD
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateAndDrawHUD, %function
updateAndDrawHUD:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	doShellDisplay
	mov	lr, #11
	mov	ip, #59
	ldr	r2, .L37
	ldr	r0, [r2, #40]
	ldr	r3, [r2, #32]
	ldr	r4, .L37+4
	add	r3, r3, #96
	rsb	r0, r0, r0, lsl #3
	strh	r3, [r4, #236]	@ movhi
	ldr	r1, [r2, #44]
	ldr	r3, .L37+8
	strh	lr, [r4, #232]	@ movhi
	strh	ip, [r4, #234]	@ movhi
	lsl	r0, r0, #2
	mov	lr, pc
	bx	r3
	cmp	r0, #27
	bgt	.L31
	mov	r2, #512
	add	r0, r4, r0, lsl #3
	add	r3, r4, #224
.L32:
	strh	r2, [r0, #240]	@ movhi
	add	r0, r0, #8
	cmp	r0, r3
	bne	.L32
.L31:
	ldr	r3, .L37+12
	ldr	r2, .L37+16
	ldr	r3, [r3]
	smull	r0, r1, r2, r3
	asr	r2, r3, #31
	rsb	r2, r2, r1, asr #4
	add	r2, r2, r2, lsl #2
	sub	r2, r3, r2, lsl #3
	cmp	r2, #20
	movle	r3, #512
	strhle	r3, [r4, #192]	@ movhi
	ble	.L30
	add	r2, r3, #127
	cmp	r3, #0
	movlt	r3, r2
	asr	r3, r3, #7
	rsb	r3, r3, #108
	and	r3, r3, #255
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r1, .L37+20
	ldr	r2, .L37+24
	strh	r3, [r4, #192]	@ movhi
	strh	r1, [r4, #194]	@ movhi
	strh	r2, [r4, #196]	@ movhi
.L30:
	pop	{r4, lr}
	bx	lr
.L38:
	.align	2
.L37:
	.word	player
	.word	shadowOAM
	.word	__aeabi_idiv
	.word	time
	.word	1717986919
	.word	-16153
	.word	786
	.size	updateAndDrawHUD, .-updateAndDrawHUD
	.align	2
	.global	min
	.syntax unified
	.arm
	.fpu softvfp
	.type	min, %function
min:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r1, r0
	movlt	r0, r1
	bx	lr
	.size	min, .-min
	.align	2
	.global	initShells
	.syntax unified
	.arm
	.fpu softvfp
	.type	initShells, %function
initShells:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L48
	ldr	r0, [r3]
	cmp	r0, #0
	bxle	lr
	mov	r2, #4
	str	lr, [sp, #-4]!
	mov	ip, #10
	mov	lr, #0
	mov	r1, #7
	ldr	r3, .L48+4
	add	r0, r0, r2
.L42:
	str	r2, [r3, #24]
	add	r2, r2, #1
	cmp	r2, r0
	str	lr, [r3, #28]
	str	ip, [r3, #32]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	add	r3, r3, #40
	bne	.L42
	ldr	lr, [sp], #4
	bx	lr
.L49:
	.align	2
.L48:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.size	initShells, .-initShells
	.align	2
	.global	newShell
	.syntax unified
	.arm
	.fpu softvfp
	.type	newShell, %function
newShell:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L70
	ldr	r1, [r3]
	cmp	r1, #0
	bxle	lr
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r6, .L70+4
	mov	r4, #0
	mov	r3, r6
	b	.L61
.L52:
	add	r4, r4, #1
	cmp	r4, r1
	add	r3, r3, #40
	beq	.L50
.L61:
	ldr	r2, [r3, #28]
	cmp	r2, #0
	bne	.L52
	ldr	r3, .L70+8
	ldr	r2, .L70+12
	ldr	r1, [r3]
	smull	r3, r2, r1, r2
	asr	r3, r1, #31
	add	r2, r2, r1
	rsbs	r3, r3, r2, asr #6
	mov	r5, #1
	beq	.L53
.L54:
	subs	r3, r3, #1
	lsl	r5, r5, #1
	bne	.L54
.L53:
	ldr	r8, .L70+16
	mov	lr, pc
	bx	r8
	mvn	r3, r0
	and	r3, r3, #1
	muls	r2, r5, r3
	movne	r3, #2
	moveq	r3, #1
	add	r7, r4, r4, lsl #2
	add	r5, r6, r7, lsl #3
	str	r3, [r5, #4]
	mov	lr, pc
	bx	r8
	mvn	ip, #63
	mov	r1, #1
	ldr	r2, .L70+12
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #7
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #4
	ldr	r3, [r5, #4]
	lsl	r7, r7, #3
	lsl	r0, r0, #3
	sub	r3, r3, #1
	str	r0, [r6, r7]
	str	ip, [r5, #8]
	str	r1, [r5, #28]
	lsl	r2, r4, #2
	cmp	r3, #7
	ldrls	pc, [pc, r3, asl #2]
	b	.L50
.L57:
	.word	.L60
	.word	.L59
	.word	.L50
	.word	.L58
	.word	.L50
	.word	.L50
	.word	.L50
	.word	.L56
.L56:
	mov	r3, #3
	add	r2, r2, r4
	add	r6, r6, r2, lsl r3
	str	r3, [r6, #36]
.L50:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L58:
	mov	r3, #2
	add	r2, r2, r4
	add	r6, r6, r2, lsl #3
	str	r3, [r6, #36]
	b	.L50
.L59:
	mov	r3, #1
	add	r2, r2, r4
	add	r6, r6, r2, lsl #3
	str	r3, [r6, #36]
	b	.L50
.L60:
	mov	r3, #0
	add	r2, r2, r4
	add	r6, r6, r2, lsl #3
	str	r3, [r6, #36]
	b	.L50
.L71:
	.align	2
.L70:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	time
	.word	-2004318071
	.word	rand
	.size	newShell, .-newShell
	.align	2
	.global	updateAndDrawShells
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateAndDrawShells, %function
updateAndDrawShells:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L88
	ldr	r3, [r3]
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	add	r3, r3, r3, lsl #4
	ldr	r2, .L88+4
	add	r3, r3, r3, lsl #8
	ldr	r1, .L88+8
	add	r3, r3, r3, lsl #16
	sub	r2, r2, r3
	cmp	r1, r2, ror #3
	sub	sp, sp, #20
	bcs	.L86
.L73:
	ldr	r8, .L88+12
	ldr	r3, [r8]
	cmp	r3, #0
	ble	.L72
	mov	r5, #0
	ldr	r4, .L88+16
	ldr	r6, .L88+20
	ldr	r7, .L88+24
	ldr	r9, .L88+28
	ldr	r10, .L88+32
	b	.L79
.L78:
	ldr	r3, [r8]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #40
	ble	.L72
.L79:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	moveq	r3, #512
	ldr	ip, [r4, #24]
	lsleq	ip, ip, #3
	strheq	r3, [r6, ip]	@ movhi
	beq	.L78
	ldr	r1, [r4, #8]
	add	r3, r1, #7
	cmp	r1, #0
	movlt	r1, r3
	ldr	r2, [r7]
	add	r3, r2, #7
	cmp	r2, #0
	ldr	r0, [r4]
	movlt	r2, r3
	cmp	r0, #0
	add	r3, r0, #7
	movlt	r0, r3
	ldr	lr, [r4, #32]
	ldr	r3, [r4, #36]
	asr	r1, r1, #3
	orr	lr, lr, r3, lsl #12
	and	fp, r1, #255
	lsl	r3, ip, #3
	strh	fp, [r6, r3]	@ movhi
	ldr	r3, [r7, #20]
	asr	r2, r2, #3
	str	r3, [sp, #12]
	ldr	r3, [r7, #24]
	str	r2, [sp]
	ldr	r2, .L88+36
	str	r3, [sp, #8]
	ldr	r3, [r7, #8]
	add	ip, r6, ip, lsl #3
	and	r2, r2, r0, asr #3
	orr	lr, lr, #1024
	str	r3, [sp, #4]
	asr	r0, r0, #3
	strh	r2, [ip, #2]	@ movhi
	ldr	r3, [r4, #20]
	ldr	r2, [r4, #16]
	strh	lr, [ip, #4]	@ movhi
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	bne	.L87
.L76:
	ldr	r3, [r4, #8]
	cmp	r3, #1280
	movgt	r3, #0
	ldrle	r2, [r10]
	addle	r3, r2, r3
	strgt	r3, [r4, #28]
	strle	r3, [r4, #8]
	b	.L78
.L72:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L87:
	mov	r2, #0
	ldr	ip, .L88+40
	ldr	r1, .L88+44
	ldr	r0, [ip]
	ldr	r3, [r4, #4]
	ldr	r1, [r1]
	add	r3, r3, r0
	str	r3, [ip]
	ldr	r0, .L88+48
	ldr	r3, .L88+52
	str	r2, [r4, #28]
	sub	r1, r1, #500
	mov	lr, pc
	bx	r3
	b	.L76
.L86:
	bl	newShell
	b	.L73
.L89:
	.align	2
.L88:
	.word	time
	.word	143165576
	.word	35791394
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	shadowOAM
	.word	player
	.word	collision
	.word	gameSpeed
	.word	511
	.word	shells_owned
	.word	coin_length
	.word	coin_data
	.word	playSoundB
	.size	updateAndDrawShells, .-updateAndDrawShells
	.align	2
	.global	powpow
	.syntax unified
	.arm
	.fpu softvfp
	.type	powpow, %function
powpow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r1, #0
	mov	r3, r0
	mov	r0, #1
	bxeq	lr
.L92:
	subs	r1, r1, #1
	mul	r0, r3, r0
	bne	.L92
	bx	lr
	.size	powpow, .-powpow
	.global	__aeabi_idivmod
	.align	2
	.global	updateAndDrawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateAndDrawPlayer, %function
updateAndDrawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L101
	push	{r4, r5, r6, lr}
	ldr	r4, .L101+4
	ldr	r1, [r3]
	ldr	r3, [r4, #40]
	ldr	r2, .L101+8
	add	r1, r1, r1, lsr #31
	sub	r3, r3, #1
	asr	r1, r1, #1
	ldr	r0, [r2]
	ldr	r5, .L101+12
	str	r3, [r4, #40]
	rsb	r1, r1, #10
	mov	lr, pc
	bx	r5
	cmp	r1, #0
	ldr	r1, [r4, #12]
	bne	.L97
	add	r0, r1, #1
	ldr	r1, [r4, #16]
	mov	lr, pc
	bx	r5
	str	r1, [r4, #12]
.L97:
	ldr	r3, [r4, #52]
	cmp	r3, #5
	beq	.L100
.L98:
	ldrb	r3, [r4, #8]	@ zero_extendqisi2
	mvn	r3, r3, lsl #17
	ldr	r2, [r4]
	add	r0, r2, #7
	cmp	r2, #0
	movlt	r2, r0
	mvn	r3, r3, lsr #17
	ldr	r0, .L101+16
	add	r1, r0, r1, lsl #2
	ldr	ip, [r4, #28]
	ldr	lr, .L101+20
	ldr	r4, .L101+24
	ldr	r1, [r1, #4]
	add	r0, r4, ip, lsl #3
	and	r2, lr, r2, asr #3
	lsl	ip, ip, #3
	orr	r1, r1, #1024
	strh	r3, [r4, ip]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	strh	r1, [r0, #4]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L100:
	ldr	r3, [r4, #56]
	cmp	r3, #5
	bne	.L98
	ldr	r3, [r4, #48]
	cmp	r3, #5
	ldreq	r2, .L101+28
	ldrheq	r3, [r2, #24]
	addeq	r3, r3, #1
	strheq	r3, [r2, #24]	@ movhi
	b	.L98
.L102:
	.align	2
.L101:
	.word	gameSpeed
	.word	player
	.word	time
	.word	__aeabi_idivmod
	.word	.LANCHOR0
	.word	511
	.word	shadowOAM
	.word	83886592
	.size	updateAndDrawPlayer, .-updateAndDrawPlayer
	.align	2
	.global	prepWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	prepWin, %function
prepWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L106
	ldr	r2, [r3]
	cmp	r2, #968
	mvnge	r0, #2
	movlt	r0, #3
	ldr	r1, [r3, #8]
	add	r2, r2, r0
	sub	r1, r1, #1
	str	r2, [r3]
	str	r1, [r3, #8]
	bx	lr
.L107:
	.align	2
.L106:
	.word	player
	.size	prepWin, .-prepWin
	.align	2
	.global	checkButtons
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkButtons, %function
checkButtons:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L117
	ldrh	r3, [r3]
	tst	r3, #8
	push	{r4, lr}
	beq	.L109
	ldr	r3, .L117+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L116
.L109:
	ldr	r3, .L117+8
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L110
	ldr	r3, .L117+12
	ldr	r2, [r3, #36]
	cmp	r2, #0
	add	r1, r2, #7
	movge	r1, r2
	ldr	r0, [r3]
	adds	r1, r0, r1, asr #3
	ldrpl	r1, [r3, #40]
	subpl	r2, r0, r2
	subpl	r1, r1, #1
	strpl	r2, [r3]
	strpl	r1, [r3, #40]
.L110:
	ldr	r3, .L117+8
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L108
	ldr	r2, .L117+12
	ldr	r1, [r2, #36]
	cmp	r1, #0
	add	r3, r1, #7
	movge	r3, r1
	ldr	ip, [r2]
	ldr	r0, [r2, #24]
	add	r3, ip, r3, asr #3
	rsb	r0, r0, #241
	cmp	r3, r0, lsl #3
	ldrle	r3, [r2, #40]
	addle	r1, ip, r1
	suble	r3, r3, #1
	strle	r1, [r2]
	strle	r3, [r2, #40]
.L108:
	pop	{r4, lr}
	bx	lr
.L116:
	ldr	r3, .L117+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L117+20
	mov	lr, pc
	bx	r3
	b	.L109
.L118:
	.align	2
.L117:
	.word	oldButtons
	.word	buttons
	.word	67109120
	.word	player
	.word	pauseSounds
	.word	goPause
	.size	checkButtons, .-checkButtons
	.align	2
	.global	updateBackgrounds
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBackgrounds, %function
updateBackgrounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L121
	ldr	r3, .L121+4
	ldr	r2, [r2]
	smull	r0, r1, r3, r2
	push	{r4, lr}
	asr	r3, r2, #31
	ldr	lr, .L121+8
	rsb	r3, r3, r1, asr #7
	add	r3, r3, #2
	ldr	r1, [lr]
	add	r2, r3, r3, lsr #31
	sub	r1, r1, r2, asr #1
	cmp	r1, #0
	add	r2, r1, #7
	movge	r2, r1
	mov	r0, #67108864
	asr	r2, r2, #3
	str	r1, [lr]
	ldr	r4, .L121+12
	ldr	lr, .L121+16
	lsl	r2, r2, #16
	lsr	r2, r2, #16
	str	r3, [r4]
	sub	ip, r2, #10
	strh	r2, [r0, #18]	@ movhi
	ldr	r2, [lr]
	sub	r3, r2, r3
	cmp	r3, #0
	add	r2, r3, #7
	movge	r2, r3
	mov	r1, #0
	asr	r2, r2, #3
	lsl	ip, ip, #16
	lsl	r2, r2, #16
	lsr	ip, ip, #16
	lsr	r2, r2, #16
	strh	ip, [r0, #26]	@ movhi
	str	r3, [lr]
	strh	r2, [r0, #22]	@ movhi
	pop	{r4, lr}
	strh	r1, [r0, #20]	@ movhi
	strh	r1, [r0, #16]	@ movhi
	strh	r1, [r0, #24]	@ movhi
	bx	lr
.L122:
	.align	2
.L121:
	.word	time
	.word	458129845
	.word	cloudVOff
	.word	gameSpeed
	.word	vOff
	.size	updateBackgrounds, .-updateBackgrounds
	.align	2
	.global	doGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	doGame, %function
doGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L130
	ldr	r3, [r5]
	ldr	r2, .L130+4
	add	r3, r3, #1
	str	r3, [r5]
	ldr	r4, .L130+8
	mov	lr, pc
	bx	r2
	bl	updateBackgrounds
	bl	updateAndDrawPlayer
	bl	updateAndDrawShells
	bl	updateAndDrawHUD
	ldr	r3, .L130+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L130+16
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #40]
	cmp	r3, #0
	ldrle	r3, .L130+20
	movle	lr, pc
	bxle	r3
.L124:
	ldr	r2, [r5]
	ldr	r3, .L130+24
	cmp	r2, r3
	ble	.L125
	ldr	r3, [r4]
	cmp	r3, #968
	mvnge	r1, #2
	movlt	r1, #3
	ldr	r2, [r4, #8]
	add	r3, r3, r1
	sub	r2, r2, #1
	str	r3, [r4]
	str	r2, [r4, #8]
.L127:
	ldr	r4, .L130+28
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L130+32
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L125:
	bl	checkButtons
	b	.L127
.L131:
	.align	2
.L130:
	.word	time
	.word	waitForVBlank
	.word	player
	.word	updateAndDrawHazards
	.word	updateAndDrawShield
	.word	goDeathEnergy
	.word	7499
	.word	DMANow
	.word	shadowOAM
	.size	doGame, .-doGame
	.align	2
	.global	resumeGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	resumeGame, %function
resumeGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r3, .L136
	mov	lr, pc
	bx	r3
	ldr	r3, .L136+4
	mov	lr, pc
	bx	r3
	mov	r5, #67108864
	mov	r0, #4
	mov	r2, #5888
	ldr	r3, .L136+8
	ldr	r1, .L136+12
	ldr	r4, .L136+16
	str	r0, [r3]
	strh	r2, [r5]	@ movhi
	mov	r3, #256
	strh	r1, [r5, #10]	@ movhi
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L136+20
	mov	lr, pc
	bx	r4
	mov	r3, #176
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L136+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L136+28
	ldr	r1, .L136+32
	mov	lr, pc
	bx	r4
	ldr	r2, .L136+36
	mov	r3, #816
	strh	r2, [r5, #8]	@ movhi
	mov	r0, #3
	ldr	r2, .L136+40
	ldr	r1, .L136+44
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L136+48
	ldr	r1, .L136+52
	mov	lr, pc
	bx	r4
	ldr	r2, .L136+56
	mov	r3, #1024
	strh	r2, [r5, #12]	@ movhi
	mov	r0, #3
	ldr	r2, .L136+60
	ldr	r1, .L136+64
	mov	lr, pc
	bx	r4
	mov	r5, #784
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L136+68
	ldr	r1, .L136+72
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L136+76
	ldr	r1, .L136+80
	mov	lr, pc
	bx	r4
	mov	r7, #128
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L136+84
	ldr	r1, .L136+88
	mov	r6, #132
	mov	lr, pc
	bx	r4
	mov	r3, #9
	mov	ip, #2
	mov	r0, #136
	ldr	r1, .L136+92
	ldr	lr, .L136+96
	strh	lr, [r1, #2]	@ movhi
	add	lr, lr, #32
	strh	lr, [r1, #10]	@ movhi
	add	lr, lr, #14
	strh	r5, [r1, #20]	@ movhi
	strh	lr, [r1, #16]	@ movhi
	ldr	r5, .L136+100
	ldr	lr, .L136+104
	mov	r2, r1
	strh	r7, [r1, #4]	@ movhi
	strh	r6, [r1, #12]	@ movhi
	strh	r5, [r1, #18]	@ movhi
	strh	lr, [r1]	@ movhi
	strh	lr, [r1, #8]	@ movhi
	add	r1, r1, #224
.L133:
	strh	r3, [r2, #242]	@ movhi
	strh	ip, [r2, #240]	@ movhi
	strh	r0, [r2, #244]	@ movhi
	add	r3, r3, #2
	add	r2, r2, #8
	lsl	r3, r3, #16
	cmp	r2, r1
	lsr	r3, r3, #16
	bne	.L133
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L136+92
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L137:
	.align	2
.L136:
	.word	unpauseSounds
	.word	hideSprites
	.word	state
	.word	7938
	.word	DMANow
	.word	game_bg_copyPal
	.word	game_bg_copyTiles
	.word	100726784
	.word	game_bg_copyMap
	.word	7684
	.word	100679680
	.word	game_clouds_bgTiles
	.word	100724736
	.word	game_clouds_bgMap
	.word	7433
	.word	100696064
	.word	game_clouds_SHADOW_bgTiles
	.word	100722688
	.word	game_clouds_SHADOW_bgMap
	.word	83886592
	.word	game_ssPal
	.word	100728832
	.word	game_ssTiles
	.word	shadowOAM
	.word	-32766
	.word	-16154
	.word	16386
	.size	resumeGame, .-resumeGame
	.align	2
	.global	updatePlayerStatsAndReset
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayerStatsAndReset, %function
updatePlayerStatsAndReset:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L139
	ldr	r3, [r1, #56]
	ldr	r2, [r1, #24]
	add	r3, r3, #1
	ldr	r0, [r1, #52]
	add	r2, r2, r2, lsr #31
	add	r3, r3, r3, lsl #1
	asr	r2, r2, #1
	rsb	r3, r3, r3, lsl #4
	ldr	ip, [r1, #48]
	add	r0, r0, r0, lsl #1
	rsb	r2, r2, #120
	rsb	r3, r3, r3, lsl #4
	lsl	r3, r3, #2
	add	r0, r0, #2
	lsl	r2, r2, #3
	str	ip, [r1, #32]
	str	r0, [r1, #36]
	str	r2, [r1]
	str	r3, [r1, #40]
	str	r3, [r1, #44]
	bx	lr
.L140:
	.align	2
.L139:
	.word	player
	.size	updatePlayerStatsAndReset, .-updatePlayerStatsAndReset
	.align	2
	.global	newGameRun
	.syntax unified
	.arm
	.fpu softvfp
	.type	newGameRun, %function
newGameRun:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L148
	ldr	r1, [r3]
	push	{r4, r5, r6, lr}
	mov	r2, #1
	ldr	r0, .L148+4
	sub	r1, r1, #500
	ldr	r3, .L148+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L148+12
	mov	lr, pc
	bx	r3
	mov	r6, #67108864
	mov	r2, #5888
	mov	r4, #4
	ldr	r3, .L148+16
	ldr	r1, .L148+20
	ldr	r5, .L148+24
	str	r4, [r3]
	mov	r0, #3
	strh	r2, [r6]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	strh	r1, [r6, #10]	@ movhi
	ldr	r1, .L148+28
	mov	lr, pc
	bx	r5
	mov	r3, #176
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L148+32
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L148+36
	ldr	r1, .L148+40
	mov	lr, pc
	bx	r5
	ldr	r2, .L148+44
	mov	r3, #816
	mov	r0, #3
	strh	r2, [r6, #8]	@ movhi
	ldr	r1, .L148+48
	ldr	r2, .L148+52
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L148+56
	ldr	r1, .L148+60
	mov	lr, pc
	bx	r5
	ldr	r2, .L148+64
	mov	r3, #1024
	mov	r0, #3
	strh	r2, [r6, #12]	@ movhi
	ldr	r1, .L148+68
	ldr	r2, .L148+72
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L148+76
	ldr	r1, .L148+80
	mov	lr, pc
	bx	r5
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L148+84
	ldr	r1, .L148+88
	mov	lr, pc
	bx	r5
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L148+92
	ldr	r1, .L148+96
	mov	lr, pc
	bx	r5
	mov	ip, #128
	mov	r2, #132
	mov	r1, #784
	ldr	r3, .L148+100
	ldr	r0, [r3]
	ldr	r3, .L148+104
	strh	ip, [r3, #4]	@ movhi
	ldr	ip, .L148+108
	ldr	lr, .L148+112
	strh	ip, [r3, #10]	@ movhi
	strh	r2, [r3, #12]	@ movhi
	ldr	ip, .L148+116
	ldr	r2, .L148+120
	strh	lr, [r3, #2]	@ movhi
	cmp	r0, #0
	add	lr, lr, #46
	strh	lr, [r3, #16]	@ movhi
	strh	ip, [r3, #18]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ble	.L142
	mov	r2, r4
	mov	lr, #0
	mov	ip, #10
	mov	r1, #7
	ldr	r3, .L148+124
	add	r0, r0, r4
.L143:
	str	r2, [r3, #24]
	add	r2, r2, #1
	cmp	r2, r0
	str	lr, [r3, #28]
	str	ip, [r3, #32]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	add	r3, r3, #40
	bne	.L143
.L142:
	mov	r3, #9
	mov	ip, #2
	mov	r0, #136
	ldr	r2, .L148+104
	add	r1, r2, #224
.L144:
	strh	r3, [r2, #242]	@ movhi
	strh	ip, [r2, #240]	@ movhi
	strh	r0, [r2, #244]	@ movhi
	add	r3, r3, #2
	add	r2, r2, #8
	lsl	r3, r3, #16
	cmp	r2, r1
	lsr	r3, r3, #16
	bne	.L144
	bl	updatePlayerStatsAndReset
	ldr	r3, .L148+128
	mov	lr, pc
	bx	r3
	mov	ip, #0
	ldr	r0, .L148+132
	mov	r3, #512
	str	ip, [r0]
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L148+104
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L149:
	.align	2
.L148:
	.word	town_w_ocean_view_length
	.word	town_w_ocean_view_data
	.word	playSoundA
	.word	hideSprites
	.word	state
	.word	7938
	.word	DMANow
	.word	game_bg_copyPal
	.word	game_bg_copyTiles
	.word	100726784
	.word	game_bg_copyMap
	.word	7684
	.word	game_clouds_bgTiles
	.word	100679680
	.word	100724736
	.word	game_clouds_bgMap
	.word	7433
	.word	game_clouds_SHADOW_bgTiles
	.word	100696064
	.word	100722688
	.word	game_clouds_SHADOW_bgMap
	.word	83886592
	.word	game_ssPal
	.word	100728832
	.word	game_ssTiles
	.word	.LANCHOR0
	.word	shadowOAM
	.word	-32734
	.word	-32766
	.word	-16154
	.word	16386
	.word	.LANCHOR1
	.word	resetHazards
	.word	time
	.size	newGameRun, .-newGameRun
	.align	2
	.global	goGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goGame, %function
goGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	ldr	r3, .L157
	ldr	r1, [r3]
	mov	r2, #1
	sub	r1, r1, #500
	ldr	r0, .L157+4
	ldr	r3, .L157+8
	mov	lr, pc
	bx	r3
	mov	r0, r4
	ldr	r3, .L157+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L157+16
	mov	lr, pc
	bx	r3
	mov	r6, #67108864
	mov	r2, #5888
	mov	r4, #4
	ldr	r3, .L157+20
	ldr	r1, .L157+24
	ldr	r5, .L157+28
	str	r4, [r3]
	mov	r0, #3
	strh	r2, [r6]	@ movhi
	mov	r3, #256
	strh	r1, [r6, #10]	@ movhi
	mov	r2, #83886080
	ldr	r1, .L157+32
	mov	lr, pc
	bx	r5
	mov	r3, #176
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L157+36
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L157+40
	ldr	r1, .L157+44
	mov	lr, pc
	bx	r5
	ldr	r2, .L157+48
	mov	r3, #816
	strh	r2, [r6, #8]	@ movhi
	mov	r0, #3
	mov	r9, #784
	ldr	r2, .L157+52
	ldr	r1, .L157+56
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L157+60
	ldr	r1, .L157+64
	mov	lr, pc
	bx	r5
	ldr	r2, .L157+68
	mov	r10, #128
	strh	r2, [r6, #12]	@ movhi
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L157+72
	ldr	r1, .L157+76
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L157+80
	ldr	r1, .L157+84
	mov	lr, pc
	bx	r5
	mov	fp, #132
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L157+88
	ldr	r1, .L157+92
	mov	lr, pc
	bx	r5
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L157+96
	ldr	r1, .L157+100
	mov	lr, pc
	bx	r5
	mov	ip, #16
	ldr	r1, .L157+104
	strh	r9, [r1, #20]	@ movhi
	ldr	r9, .L157+108
	strh	r9, [r1, #16]	@ movhi
	ldr	r9, .L157+112
	strh	r10, [r1, #4]	@ movhi
	ldr	r10, .L157+116
	strh	r9, [r1, #18]	@ movhi
	ldr	r9, .L157+120
	strh	r10, [r1, #2]	@ movhi
	add	r10, r10, #32
	strh	fp, [r1, #12]	@ movhi
	strh	r10, [r1, #10]	@ movhi
	strh	r9, [r1]	@ movhi
	strh	r9, [r1, #8]	@ movhi
	ldr	r1, .L157+124
	str	ip, [r1, #20]
	mov	ip, #3
	mov	r0, #8
	mov	r3, #0
	mov	r8, #9
	mov	r7, #928
	mov	r6, #960
	mov	lr, #138
	str	ip, [r1, #28]
	mov	ip, #2
	ldr	r2, .L157+128
	ldr	r2, [r2]
	str	r0, [r1, #16]
	ldr	r0, .L157+132
	cmp	r2, r3
	stmib	r1, {r6, lr}
	str	r8, [r1, #24]
	str	r7, [r1]
	str	ip, [r1, #36]
	str	r3, [r1, #12]
	str	r3, [r1, #56]
	str	r3, [r1, #48]
	str	r3, [r1, #52]
	str	r3, [r1, #32]
	str	r0, [r1, #40]
	str	r0, [r1, #44]
	ble	.L151
	mov	ip, #10
	mov	r0, #7
	ldr	r1, .L157+136
	add	r2, r2, r4
.L152:
	str	r4, [r1, #24]
	add	r4, r4, #1
	cmp	r4, r2
	str	r3, [r1, #28]
	str	ip, [r1, #32]
	str	r0, [r1, #16]
	str	r0, [r1, #20]
	add	r1, r1, #40
	bne	.L152
.L151:
	mov	r3, #9
	mov	ip, #2
	mov	r0, #136
	ldr	r2, .L157+104
	add	r1, r2, #224
.L153:
	strh	r3, [r2, #242]	@ movhi
	strh	ip, [r2, #240]	@ movhi
	strh	r0, [r2, #244]	@ movhi
	add	r3, r3, #2
	add	r2, r2, #8
	lsl	r3, r3, #16
	cmp	r2, r1
	lsr	r3, r3, #16
	bne	.L153
	ldr	r3, .L157+140
	mov	lr, pc
	bx	r3
	mov	r0, #0
	ldr	r1, .L157+144
	ldr	ip, .L157+148
	str	r0, [r1]
	mov	r3, #512
	str	r0, [ip]
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L157+104
	mov	lr, pc
	bx	r5
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L158:
	.align	2
.L157:
	.word	town_w_ocean_view_length
	.word	town_w_ocean_view_data
	.word	playSoundA
	.word	srand
	.word	hideSprites
	.word	state
	.word	7938
	.word	DMANow
	.word	game_bg_copyPal
	.word	game_bg_copyTiles
	.word	100726784
	.word	game_bg_copyMap
	.word	7684
	.word	100679680
	.word	game_clouds_bgTiles
	.word	100724736
	.word	game_clouds_bgMap
	.word	7433
	.word	100696064
	.word	game_clouds_SHADOW_bgTiles
	.word	100722688
	.word	game_clouds_SHADOW_bgMap
	.word	83886592
	.word	game_ssPal
	.word	100728832
	.word	game_ssTiles
	.word	shadowOAM
	.word	-32720
	.word	-16154
	.word	-32766
	.word	16386
	.word	player
	.word	.LANCHOR0
	.word	2700
	.word	.LANCHOR1
	.word	initHazards
	.word	vOff
	.word	time
	.size	goGame, .-goGame
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #16
	push	{r4, r5, r6, r7, lr}
	mov	r2, #0
	mov	r7, #9
	mov	r6, #928
	mov	r5, #960
	mov	r4, #138
	mov	lr, #8
	mov	ip, #3
	mov	r0, #2
	ldr	r3, .L161
	str	r1, [r3, #20]
	ldr	r1, .L161+4
	str	r7, [r3, #24]
	str	r6, [r3]
	str	r5, [r3, #4]
	str	r4, [r3, #8]
	str	lr, [r3, #16]
	str	ip, [r3, #28]
	str	r0, [r3, #36]
	str	r2, [r3, #12]
	str	r2, [r3, #56]
	str	r2, [r3, #48]
	str	r2, [r3, #52]
	str	r2, [r3, #32]
	str	r1, [r3, #40]
	str	r1, [r3, #44]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L162:
	.align	2
.L161:
	.word	player
	.word	2700
	.size	initPlayer, .-initPlayer
	.global	NUM_SHELLS
	.global	shells
	.global	playerFrames
	.comm	player,72,4
	.comm	shadowOAM,1024,4
	.comm	cloudVOff,4,4
	.comm	vOff,4,4
	.comm	gameSpeed,4,4
	.comm	time,4,4
	.comm	shells_owned,4,4
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	NUM_SHELLS, %object
	.size	NUM_SHELLS, 4
NUM_SHELLS:
	.word	20
	.type	playerFrames, %object
	.size	playerFrames, 32
playerFrames:
	.word	0
	.word	2
	.word	4
	.word	6
	.word	8
	.word	6
	.word	4
	.word	2
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	shells, %object
	.size	shells, 800
shells:
	.space	800
	.ident	"GCC: (devkitARM release 53) 9.1.0"
