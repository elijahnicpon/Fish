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
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r7, .L63
	ldr	r1, [r7]
	cmp	r1, #0
	ble	.L50
	ldr	r6, .L63+4
	mov	r4, #0
	mov	r3, r6
	b	.L60
.L52:
	add	r4, r4, #1
	cmp	r4, r1
	add	r3, r3, #40
	beq	.L50
.L60:
	ldr	r2, [r3, #28]
	cmp	r2, #0
	bne	.L52
	ldr	r3, .L63+8
	ldr	r5, .L63+12
	ldr	r3, [r3]
	smull	r2, r5, r3, r5
	ldr	r8, .L63+16
	asr	r3, r3, #31
	rsb	r5, r3, r5, asr #5
	mov	lr, pc
	bx	r8
	tst	r0, #1
	addeq	r5, r5, #1
	add	r5, r7, r5, lsl #2
	ldr	r3, [r5, #4]
	add	r7, r4, r4, lsl #2
	add	r5, r6, r7, lsl #3
	str	r3, [r5, #4]
	mov	lr, pc
	bx	r8
	mvn	ip, #63
	mov	r1, #1
	ldr	r2, .L63+20
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #7
	rsb	r3, r3, r3, lsl #4
	ldr	r2, [r5, #4]
	sub	r0, r0, r3, lsl #4
	lsl	r7, r7, #3
	lsl	r0, r0, #3
	sub	r2, r2, #1
	str	r0, [r6, r7]
	str	ip, [r5, #8]
	str	r1, [r5, #28]
	lsl	r3, r4, #2
	cmp	r2, #7
	ldrls	pc, [pc, r2, asl #2]
	b	.L54
.L56:
	.word	.L59
	.word	.L58
	.word	.L54
	.word	.L57
	.word	.L54
	.word	.L54
	.word	.L54
	.word	.L54
.L54:
	mov	r2, #3
	add	r3, r3, r4
	add	r6, r6, r3, lsl r2
	str	r2, [r6, #36]
.L50:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L57:
	mov	r2, #2
	add	r3, r3, r4
	add	r6, r6, r3, lsl #3
	str	r2, [r6, #36]
	b	.L50
.L58:
	mov	r2, #1
	add	r3, r3, r4
	add	r6, r6, r3, lsl #3
	str	r2, [r6, #36]
	b	.L50
.L59:
	mov	r2, #0
	add	r3, r3, r4
	add	r6, r6, r3, lsl #3
	str	r2, [r6, #36]
	b	.L50
.L64:
	.align	2
.L63:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	time
	.word	91625969
	.word	rand
	.word	-2004318071
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
	ldr	r3, .L81
	ldr	r3, [r3]
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	add	r3, r3, r3, lsl #4
	ldr	r2, .L81+4
	add	r3, r3, r3, lsl #8
	ldr	r1, .L81+8
	add	r3, r3, r3, lsl #16
	sub	r2, r2, r3
	cmp	r1, r2, ror #3
	sub	sp, sp, #20
	bcs	.L79
.L66:
	ldr	r8, .L81+12
	ldr	r3, [r8]
	cmp	r3, #0
	ble	.L65
	mov	r5, #0
	ldr	r4, .L81+16
	ldr	r6, .L81+20
	ldr	r7, .L81+24
	ldr	r9, .L81+28
	ldr	r10, .L81+32
	b	.L72
.L71:
	ldr	r3, [r8]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #40
	ble	.L65
.L72:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	moveq	r3, #512
	ldr	ip, [r4, #24]
	lsleq	ip, ip, #3
	strheq	r3, [r6, ip]	@ movhi
	beq	.L71
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
	ldr	r2, .L81+36
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
	bne	.L80
.L69:
	ldr	r3, [r4, #8]
	cmp	r3, #1280
	movgt	r3, #0
	ldrle	r2, [r10]
	addle	r3, r2, r3
	strgt	r3, [r4, #28]
	strle	r3, [r4, #8]
	b	.L71
.L65:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L80:
	mov	r2, #0
	ldr	ip, .L81+40
	ldr	r1, .L81+44
	ldr	r0, [ip]
	ldr	r3, [r4, #4]
	ldr	r1, [r1]
	add	r3, r3, r0
	str	r3, [ip]
	ldr	r0, .L81+48
	ldr	r3, .L81+52
	str	r2, [r4, #28]
	sub	r1, r1, #500
	mov	lr, pc
	bx	r3
	b	.L69
.L79:
	bl	newShell
	b	.L66
.L82:
	.align	2
.L81:
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
.L85:
	subs	r1, r1, #1
	mul	r0, r3, r0
	bne	.L85
	bx	lr
	.size	powpow, .-powpow
	.align	2
	.global	toggleCloudsOn
	.syntax unified
	.arm
	.fpu softvfp
	.type	toggleCloudsOn, %function
toggleCloudsOn:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	lr, #1
	ldr	ip, .L91
	ldr	r4, .L91+4
	mov	r3, #816
	mov	r0, #3
	ldr	r2, .L91+8
	ldr	r1, .L91+12
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L91+16
	ldr	r1, .L91+20
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L91+24
	ldr	r1, .L91+28
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L91+32
	ldr	r1, .L91+36
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L92:
	.align	2
.L91:
	.word	cloudsOn
	.word	DMANow
	.word	100679680
	.word	game_clouds_bgTiles
	.word	100724736
	.word	game_clouds_bgMap
	.word	100696064
	.word	game_clouds_SHADOW_bgTiles
	.word	100722688
	.word	game_clouds_SHADOW_bgMap
	.size	toggleCloudsOn, .-toggleCloudsOn
	.align	2
	.global	toggleCloudsOff
	.syntax unified
	.arm
	.fpu softvfp
	.type	toggleCloudsOff, %function
toggleCloudsOff:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	mov	r2, r3
	mov	r1, r3
	ldr	r0, .L97
	str	r3, [r0]
.L94:
	lsl	r3, r2, #1
	add	r3, r3, #100663296
	add	r2, r2, #1
	add	r0, r3, #59392
	cmp	r2, #1024
	add	r3, r3, #61440
	strh	r1, [r0]	@ movhi
	strh	r1, [r3]	@ movhi
	bne	.L94
	bx	lr
.L98:
	.align	2
.L97:
	.word	cloudsOn
	.size	toggleCloudsOff, .-toggleCloudsOff
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
	ldr	r3, .L104
	push	{r4, r5, r6, lr}
	ldr	r4, .L104+4
	ldr	r1, [r3]
	ldr	r3, [r4, #40]
	ldr	r2, .L104+8
	add	r1, r1, r1, lsr #31
	sub	r3, r3, #1
	asr	r1, r1, #1
	ldr	r0, [r2]
	ldr	r5, .L104+12
	str	r3, [r4, #40]
	rsb	r1, r1, #10
	mov	lr, pc
	bx	r5
	cmp	r1, #0
	ldr	r1, [r4, #12]
	bne	.L100
	add	r0, r1, #1
	ldr	r1, [r4, #16]
	mov	lr, pc
	bx	r5
	str	r1, [r4, #12]
.L100:
	ldr	r3, [r4, #52]
	cmp	r3, #5
	beq	.L103
.L101:
	ldrb	r3, [r4, #8]	@ zero_extendqisi2
	mvn	r3, r3, lsl #17
	ldr	r2, [r4]
	add	r0, r2, #7
	cmp	r2, #0
	movlt	r2, r0
	mvn	r3, r3, lsr #17
	ldr	r0, .L104+16
	add	r1, r0, r1, lsl #2
	ldr	ip, [r4, #28]
	ldr	lr, .L104+20
	ldr	r4, .L104+24
	ldr	r1, [r1, #36]
	add	r0, r4, ip, lsl #3
	and	r2, lr, r2, asr #3
	lsl	ip, ip, #3
	orr	r1, r1, #1024
	strh	r3, [r4, ip]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	strh	r1, [r0, #4]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L103:
	ldr	r3, [r4, #56]
	cmp	r3, #5
	bne	.L101
	ldr	r3, [r4, #48]
	cmp	r3, #5
	ldreq	r2, .L104+28
	ldrheq	r3, [r2, #24]
	addeq	r3, r3, #1
	strheq	r3, [r2, #24]	@ movhi
	b	.L101
.L105:
	.align	2
.L104:
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
	ldr	r3, .L111
	ldr	r2, [r3]
	cmp	r2, #968
	mvnge	r0, #2
	movlt	r0, #3
	ldr	r1, [r3, #8]
	sub	r1, r1, #1
	add	r2, r2, r0
	cmn	r1, #16
	str	r2, [r3]
	mvnlt	r2, #15
	strge	r1, [r3, #8]
	strlt	r2, [r3, #8]
	bx	lr
.L112:
	.align	2
.L111:
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
	push	{r4, lr}
	ldr	r4, .L130
	ldrh	ip, [r4]
	tst	ip, #4
	beq	.L114
	ldr	r3, .L130+4
	ldrh	r3, [r3]
	ands	r3, r3, #4
	beq	.L128
.L114:
	tst	ip, #8
	beq	.L117
	ldr	r3, .L130+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L129
.L117:
	ldr	r3, .L130+8
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L118
	ldr	r3, .L130+12
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
.L118:
	ldr	r3, .L130+8
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L113
	ldr	r2, .L130+12
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
.L113:
	pop	{r4, lr}
	bx	lr
.L128:
	ldr	r0, .L130+16
	ldr	r2, [r0]
	cmp	r2, #0
	beq	.L115
	mov	r2, r3
	mov	r1, r3
	str	r3, [r0]
.L116:
	lsl	r3, r2, #1
	add	r3, r3, #100663296
	add	r2, r2, #1
	add	r0, r3, #59392
	cmp	r2, #1024
	add	r3, r3, #61440
	strh	r1, [r0]	@ movhi
	strh	r1, [r3]	@ movhi
	bne	.L116
	b	.L114
.L129:
	ldr	r3, .L130+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L130+24
	mov	lr, pc
	bx	r3
	b	.L117
.L115:
	bl	toggleCloudsOn
	ldrh	ip, [r4]
	b	.L114
.L131:
	.align	2
.L130:
	.word	oldButtons
	.word	buttons
	.word	67109120
	.word	player
	.word	cloudsOn
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
	ldr	r2, .L134
	ldr	r3, .L134+4
	ldr	r2, [r2]
	smull	r0, r1, r3, r2
	push	{r4, lr}
	asr	r3, r2, #31
	ldr	lr, .L134+8
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
	ldr	r4, .L134+12
	ldr	lr, .L134+16
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
.L135:
	.align	2
.L134:
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
	ldr	r5, .L146
	ldr	r3, [r5]
	ldr	r2, .L146+4
	add	r3, r3, #1
	str	r3, [r5]
	ldr	r4, .L146+8
	mov	lr, pc
	bx	r2
	bl	updateBackgrounds
	bl	updateAndDrawPlayer
	bl	updateAndDrawShells
	bl	updateAndDrawHUD
	ldr	r3, .L146+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L146+16
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #40]
	cmp	r3, #0
	ldrle	r3, .L146+20
	movle	lr, pc
	bxle	r3
.L137:
	ldr	r2, [r5]
	ldr	r3, .L146+24
	cmp	r2, r3
	ble	.L138
	ldr	r3, [r4]
	cmp	r3, #968
	mvnge	r0, #2
	movlt	r0, #3
	ldr	r1, [r4, #8]
	sub	r1, r1, #1
	add	r3, r3, r0
	cmn	r1, #16
	str	r3, [r4]
	mvnlt	r3, #15
	strlt	r3, [r4, #8]
	ldr	r3, .L146+28
	strge	r1, [r4, #8]
	cmp	r2, r3
	bgt	.L145
.L142:
	ldr	r4, .L146+32
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L146+36
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L138:
	bl	checkButtons
	ldr	r2, [r5]
	ldr	r3, .L146+28
	cmp	r2, r3
	ble	.L142
.L145:
	ldr	r3, .L146+40
	mov	lr, pc
	bx	r3
	b	.L142
.L147:
	.align	2
.L146:
	.word	time
	.word	waitForVBlank
	.word	player
	.word	updateAndDrawHazards
	.word	updateAndDrawShield
	.word	goDeathEnergy
	.word	7379
	.word	7559
	.word	DMANow
	.word	shadowOAM
	.word	goWin
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
	ldr	r3, .L152
	mov	lr, pc
	bx	r3
	ldr	r3, .L152+4
	mov	lr, pc
	bx	r3
	mov	r5, #67108864
	mov	r0, #4
	mov	r2, #5888
	ldr	r3, .L152+8
	ldr	r1, .L152+12
	ldr	r4, .L152+16
	str	r0, [r3]
	strh	r2, [r5]	@ movhi
	mov	r3, #256
	strh	r1, [r5, #10]	@ movhi
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L152+20
	mov	lr, pc
	bx	r4
	mov	r3, #176
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L152+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L152+28
	ldr	r1, .L152+32
	mov	lr, pc
	bx	r4
	ldr	r2, .L152+36
	mov	r3, #816
	strh	r2, [r5, #8]	@ movhi
	mov	r0, #3
	ldr	r2, .L152+40
	ldr	r1, .L152+44
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L152+48
	ldr	r1, .L152+52
	mov	lr, pc
	bx	r4
	ldr	r2, .L152+56
	mov	r3, #1024
	strh	r2, [r5, #12]	@ movhi
	mov	r0, #3
	ldr	r2, .L152+60
	ldr	r1, .L152+64
	mov	lr, pc
	bx	r4
	mov	r5, #784
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L152+68
	ldr	r1, .L152+72
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L152+76
	ldr	r1, .L152+80
	mov	lr, pc
	bx	r4
	mov	r7, #128
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L152+84
	ldr	r1, .L152+88
	mov	r6, #132
	mov	lr, pc
	bx	r4
	mov	r3, #9
	mov	ip, #2
	mov	r0, #136
	ldr	r1, .L152+92
	ldr	lr, .L152+96
	strh	lr, [r1, #2]	@ movhi
	add	lr, lr, #32
	strh	lr, [r1, #10]	@ movhi
	add	lr, lr, #14
	strh	r5, [r1, #20]	@ movhi
	strh	lr, [r1, #16]	@ movhi
	ldr	r5, .L152+100
	ldr	lr, .L152+104
	mov	r2, r1
	strh	r7, [r1, #4]	@ movhi
	strh	r6, [r1, #12]	@ movhi
	strh	r5, [r1, #18]	@ movhi
	strh	lr, [r1]	@ movhi
	strh	lr, [r1, #8]	@ movhi
	add	r1, r1, #224
.L149:
	strh	r3, [r2, #242]	@ movhi
	strh	ip, [r2, #240]	@ movhi
	strh	r0, [r2, #244]	@ movhi
	add	r3, r3, #2
	add	r2, r2, #8
	lsl	r3, r3, #16
	cmp	r2, r1
	lsr	r3, r3, #16
	bne	.L149
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L152+92
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L153:
	.align	2
.L152:
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
	ldr	r1, .L155
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
.L156:
	.align	2
.L155:
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
	ldr	r3, .L164
	ldr	r1, [r3]
	push	{r4, r5, r6, lr}
	mov	r2, #1
	ldr	r0, .L164+4
	sub	r1, r1, #500
	ldr	r3, .L164+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L164+12
	mov	lr, pc
	bx	r3
	mov	r6, #67108864
	mov	r2, #5888
	mov	r4, #4
	ldr	r3, .L164+16
	ldr	r1, .L164+20
	ldr	r5, .L164+24
	str	r4, [r3]
	mov	r0, #3
	strh	r2, [r6]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	strh	r1, [r6, #10]	@ movhi
	ldr	r1, .L164+28
	mov	lr, pc
	bx	r5
	mov	r3, #176
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L164+32
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L164+36
	ldr	r1, .L164+40
	mov	lr, pc
	bx	r5
	ldr	r2, .L164+44
	mov	r3, #816
	mov	r0, #3
	strh	r2, [r6, #8]	@ movhi
	ldr	r1, .L164+48
	ldr	r2, .L164+52
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L164+56
	ldr	r1, .L164+60
	mov	lr, pc
	bx	r5
	ldr	r2, .L164+64
	mov	r3, #1024
	mov	r0, #3
	strh	r2, [r6, #12]	@ movhi
	ldr	r1, .L164+68
	ldr	r2, .L164+72
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L164+76
	ldr	r1, .L164+80
	mov	lr, pc
	bx	r5
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L164+84
	ldr	r1, .L164+88
	mov	lr, pc
	bx	r5
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L164+92
	ldr	r1, .L164+96
	mov	lr, pc
	bx	r5
	mov	ip, #128
	mov	r2, #132
	mov	r1, #784
	ldr	r3, .L164+100
	ldr	r0, [r3]
	ldr	r3, .L164+104
	strh	ip, [r3, #4]	@ movhi
	ldr	ip, .L164+108
	ldr	lr, .L164+112
	strh	ip, [r3, #10]	@ movhi
	strh	r2, [r3, #12]	@ movhi
	ldr	ip, .L164+116
	ldr	r2, .L164+120
	strh	lr, [r3, #2]	@ movhi
	cmp	r0, #0
	add	lr, lr, #46
	strh	lr, [r3, #16]	@ movhi
	strh	ip, [r3, #18]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ble	.L158
	mov	r2, r4
	mov	lr, #0
	mov	ip, #10
	mov	r1, #7
	ldr	r3, .L164+124
	add	r0, r0, r4
.L159:
	str	r2, [r3, #24]
	add	r2, r2, #1
	cmp	r2, r0
	str	lr, [r3, #28]
	str	ip, [r3, #32]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	add	r3, r3, #40
	bne	.L159
.L158:
	mov	r3, #9
	mov	ip, #2
	mov	r0, #136
	ldr	r2, .L164+104
	add	r1, r2, #224
.L160:
	strh	r3, [r2, #242]	@ movhi
	strh	ip, [r2, #240]	@ movhi
	strh	r0, [r2, #244]	@ movhi
	add	r3, r3, #2
	add	r2, r2, #8
	lsl	r3, r3, #16
	cmp	r2, r1
	lsr	r3, r3, #16
	bne	.L160
	bl	updatePlayerStatsAndReset
	ldr	r3, .L164+128
	mov	lr, pc
	bx	r3
	mov	ip, #0
	ldr	r0, .L164+132
	mov	r3, #512
	str	ip, [r0]
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L164+104
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L165:
	.align	2
.L164:
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
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, r5, r6, r7, lr}
	mov	ip, #8
	mov	r7, #9
	mov	r6, #928
	mov	r5, #960
	mov	r4, #138
	mov	lr, #16
	mov	r0, #3
	mov	r1, #2
	ldr	r3, .L168
	str	r2, [r3]
	ldr	r3, .L168+4
	str	r2, [r3, #12]
	str	r2, [r3, #56]
	str	r2, [r3, #48]
	str	r2, [r3, #52]
	str	r2, [r3, #32]
	ldr	r2, .L168+8
	str	r7, [r3, #24]
	str	r6, [r3]
	str	r5, [r3, #4]
	str	r4, [r3, #8]
	str	lr, [r3, #20]
	str	ip, [r3, #16]
	str	r0, [r3, #28]
	str	r1, [r3, #36]
	str	r2, [r3, #40]
	str	r2, [r3, #44]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L169:
	.align	2
.L168:
	.word	shells_owned
	.word	player
	.word	2700
	.size	initPlayer, .-initPlayer
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
	push	{r4, r5, r6, lr}
	mov	r4, r0
	ldr	r3, .L177
	ldr	r1, [r3]
	mov	r2, #1
	sub	r1, r1, #500
	ldr	r0, .L177+4
	ldr	r3, .L177+8
	mov	lr, pc
	bx	r3
	mov	r0, r4
	ldr	r3, .L177+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L177+16
	mov	lr, pc
	bx	r3
	mov	r6, #67108864
	mov	r2, #5888
	mov	r4, #4
	ldr	r3, .L177+20
	ldr	r1, .L177+24
	ldr	r5, .L177+28
	str	r4, [r3]
	mov	r0, #3
	strh	r2, [r6]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	strh	r1, [r6, #10]	@ movhi
	ldr	r1, .L177+32
	mov	lr, pc
	bx	r5
	mov	r3, #176
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L177+36
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L177+40
	ldr	r1, .L177+44
	mov	lr, pc
	bx	r5
	ldr	r2, .L177+48
	mov	r3, #816
	mov	r0, #3
	strh	r2, [r6, #8]	@ movhi
	ldr	r1, .L177+52
	ldr	r2, .L177+56
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L177+60
	ldr	r1, .L177+64
	mov	lr, pc
	bx	r5
	ldr	r2, .L177+68
	mov	r3, #1024
	mov	r0, #3
	strh	r2, [r6, #12]	@ movhi
	ldr	r1, .L177+72
	ldr	r2, .L177+76
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L177+80
	ldr	r1, .L177+84
	mov	lr, pc
	bx	r5
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L177+88
	ldr	r1, .L177+92
	mov	lr, pc
	bx	r5
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L177+96
	ldr	r1, .L177+100
	mov	lr, pc
	bx	r5
	mov	ip, #128
	mov	lr, #132
	mov	r1, #784
	ldr	r3, .L177+104
	ldr	r0, .L177+108
	ldr	r2, .L177+112
	strh	ip, [r3, #4]	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r0, .L177+116
	ldr	r2, .L177+120
	ldr	ip, .L177+124
	strh	r0, [r3, #18]	@ movhi
	strh	lr, [r3, #12]	@ movhi
	strh	ip, [r3, #16]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	bl	initPlayer
	ldr	r3, .L177+128
	ldr	r0, [r3]
	cmp	r0, #0
	ble	.L171
	mov	r2, r4
	mov	lr, #0
	mov	ip, #10
	mov	r1, #7
	ldr	r3, .L177+132
	add	r0, r0, r4
.L172:
	str	r2, [r3, #24]
	add	r2, r2, #1
	cmp	r2, r0
	str	lr, [r3, #28]
	str	ip, [r3, #32]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	add	r3, r3, #40
	bne	.L172
.L171:
	mov	r3, #9
	mov	ip, #2
	mov	r0, #136
	ldr	r2, .L177+104
	add	r1, r2, #224
.L173:
	strh	r3, [r2, #242]	@ movhi
	strh	ip, [r2, #240]	@ movhi
	strh	r0, [r2, #244]	@ movhi
	add	r3, r3, #2
	add	r2, r2, #8
	lsl	r3, r3, #16
	cmp	r2, r1
	lsr	r3, r3, #16
	bne	.L173
	ldr	r3, .L177+136
	mov	lr, pc
	bx	r3
	ldr	r3, .L177+140
	mov	lr, pc
	bx	r3
	mov	r0, #0
	ldr	r1, .L177+144
	ldr	ip, .L177+148
	str	r0, [r1]
	str	r0, [ip]
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L177+104
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L178:
	.align	2
.L177:
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
	.word	shadowOAM
	.word	-32766
	.word	-32734
	.word	-16154
	.word	16386
	.word	-32720
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	initHazards
	.word	resetHazards
	.word	vOff
	.word	time
	.size	goGame, .-goGame
	.global	shellVals
	.global	NUM_SHELLS
	.global	shells
	.global	playerFrames
	.comm	player,72,4
	.comm	shadowOAM,1024,4
	.comm	cloudsOn,4,4
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
	.type	shellVals, %object
	.size	shellVals, 32
shellVals:
	.word	1
	.word	2
	.word	4
	.word	8
	.word	8
	.word	8
	.word	8
	.word	8
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
