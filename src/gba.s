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
	.file	"gba.c"
	.text
	.align	2
	.global	interruptHandler
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L17
	ldrh	r1, [r3, #2]
	tst	r1, #1
	push	{r4, lr}
	strh	r2, [r3, #8]	@ movhi
	beq	.L3
	ldr	r3, .L17+4
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L5
	ldr	r2, [r3, #28]
	ldr	r1, [r3, #20]
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #28]
	ble	.L5
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L15
	ldr	r1, .L17+8
	ldr	r0, .L17+12
	ldr	r1, [r1]
	strh	r2, [r0, #2]	@ movhi
	str	r2, [r3, #12]
	str	r2, [r1, #20]
.L5:
	ldr	r3, .L17+16
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L3
	ldr	r2, [r3, #28]
	ldr	r1, [r3, #20]
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #28]
	ble	.L3
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L16
	ldr	r1, .L17+8
	ldr	r0, .L17+12
	ldr	r1, [r1]
	strh	r2, [r0, #6]	@ movhi
	str	r2, [r3, #12]
	str	r2, [r1, #32]
.L3:
	mov	r1, #1
	ldr	r3, .L17
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L15:
	ldm	r3, {r0, r1}
	ldr	r3, .L17+20
	mov	lr, pc
	bx	r3
	b	.L5
.L16:
	ldm	r3, {r0, r1}
	ldr	r3, .L17+24
	mov	lr, pc
	bx	r3
	b	.L3
.L18:
	.align	2
.L17:
	.word	67109376
	.word	soundA
	.word	.LANCHOR0
	.word	67109120
	.word	soundB
	.word	playSoundA
	.word	playSoundB
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	collision
	.syntax unified
	.arm
	.fpu softvfp
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, [sp, #8]
	ldr	ip, [sp, #16]
	add	ip, lr, ip
	cmp	ip, r1
	ble	.L23
	add	r1, r1, r3
	cmp	r1, lr
	bgt	.L25
.L23:
	mov	r0, #0
	ldr	lr, [sp], #4
	bx	lr
.L25:
	ldr	r3, [sp, #4]
	ldr	r1, [sp, #12]
	add	r3, r3, r1
	cmp	r3, r0
	ble	.L23
	ldr	r3, [sp, #4]
	add	r0, r0, r2
	cmp	r0, r3
	movle	r0, #0
	movgt	r0, #1
	ldr	lr, [sp], #4
	bx	lr
	.size	collision, .-collision
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L27:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bhi	.L27
	mov	r2, #67108864
.L28:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L28
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	setPixel3
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel3, %function
setPixel3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L33
	rsb	r1, r1, r1, lsl #4
	ldr	r3, [r3, #4]
	add	r0, r0, r1, lsl #4
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L34:
	.align	2
.L33:
	.word	.LANCHOR0
	.size	setPixel3, .-setPixel3
	.align	2
	.global	drawRect3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect3, %function
drawRect3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	subs	ip, r3, #0
	bxle	lr
	push	{r4, r5, lr}
	mov	lr, #0
	ldr	r5, .L44
	add	ip, r1, ip
	ldr	r3, [r5, #4]
	rsb	r1, r1, r1, lsl #4
	rsb	ip, ip, ip, lsl #4
	add	r4, r0, r1, lsl #4
	add	ip, r0, ip, lsl #4
	ldr	r1, [r5]
	orr	r0, r2, #-2130706432
	add	r2, r3, ip, lsl #1
	add	r3, r3, r4, lsl #1
.L37:
	add	ip, sp, #12
	str	lr, [r1, #44]
	str	ip, [r1, #36]
	str	r3, [r1, #40]
	add	r3, r3, #480
	cmp	r3, r2
	str	r0, [r1, #44]
	bne	.L37
	pop	{r4, r5, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	.LANCHOR0
	.size	drawRect3, .-drawRect3
	.align	2
	.global	fillScreen3
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen3, %function
fillScreen3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #0
	str	lr, [sp, #-4]!
	sub	sp, sp, #20
	strh	r0, [sp, #6]	@ movhi
	ldr	r2, .L48
	ldrh	lr, [sp, #6]
	ldr	r3, [r2]
	ldr	r1, [r2, #4]
	ldr	r2, .L48+4
	add	r0, sp, #14
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r1, [r3, #40]
	str	r2, [r3, #44]
	add	sp, sp, #20
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L49:
	.align	2
.L48:
	.word	.LANCHOR0
	.word	-2130668032
	.size	fillScreen3, .-fillScreen3
	.align	2
	.global	drawImage3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage3, %function
drawImage3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	subs	lr, r3, #0
	ble	.L50
	mov	r4, #0
	ldr	r6, .L56
	add	lr, r1, lr
	ldr	r3, [r6, #4]
	rsb	r1, r1, r1, lsl #4
	rsb	lr, lr, lr, lsl #4
	add	r5, r0, r1, lsl #4
	add	lr, r0, lr, lsl #4
	ldr	ip, [sp, #16]
	ldr	r1, [r6]
	add	r0, r3, lr, lsl #1
	orr	lr, r2, #-2147483648
	add	r3, r3, r5, lsl #1
	lsl	r2, r2, #1
.L52:
	str	r4, [r1, #44]
	str	ip, [r1, #36]
	str	r3, [r1, #40]
	add	r3, r3, #480
	cmp	r3, r0
	str	lr, [r1, #44]
	add	ip, ip, r2
	bne	.L52
.L50:
	pop	{r4, r5, r6, lr}
	bx	lr
.L57:
	.align	2
.L56:
	.word	.LANCHOR0
	.size	drawImage3, .-drawImage3
	.align	2
	.global	drawFullscreenImage3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullscreenImage3, %function
drawFullscreenImage3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r2, .L59
	ldr	r1, .L59+4
	ldr	r3, [r2]
	ldr	r2, [r2, #4]
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	bx	lr
.L60:
	.align	2
.L59:
	.word	.LANCHOR0
	.word	-2147445248
	.size	drawFullscreenImage3, .-drawFullscreenImage3
	.align	2
	.global	drawImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage4, %function
drawImage4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r3, #0
	bxle	lr
	push	{r4, r5, r6, r7, lr}
	mov	r4, #0
	ldr	r7, .L69
	add	r2, r2, r2, lsr #31
	add	r3, r1, r3
	asr	lr, r2, #1
	rsb	r5, r1, r1, lsl #4
	rsb	r3, r3, r3, lsl #4
	ldr	ip, [sp, #20]
	ldm	r7, {r2, r6}
	add	r1, r0, r3, lsl #4
	add	r0, r0, r5, lsl #4
	orr	r5, lr, #-2147483648
	lsl	lr, lr, #1
.L63:
	add	r3, r0, r0, lsr #31
	bic	r3, r3, #1
	add	r0, r0, #240
	add	r3, r6, r3
	cmp	r0, r1
	str	r4, [r2, #44]
	str	ip, [r2, #36]
	str	r3, [r2, #40]
	add	ip, ip, lr
	str	r5, [r2, #44]
	bne	.L63
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L70:
	.align	2
.L69:
	.word	.LANCHOR0
	.size	drawImage4, .-drawImage4
	.align	2
	.global	setPixel4
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	r1, r1, r1, lsl #4
	ldr	ip, .L75
	add	r3, r0, r1, lsl #4
	ldr	ip, [ip, #4]
	add	r3, r3, r3, lsr #31
	bic	r3, r3, #1
	ldrh	r1, [ip, r3]
	sub	sp, sp, #8
	strh	r1, [sp, #6]	@ movhi
	ldrh	r1, [sp, #6]
	tst	r0, #1
	andne	r1, r1, #255
	andeq	r1, r1, #65280
	strhne	r1, [sp, #6]	@ movhi
	strheq	r1, [sp, #6]	@ movhi
	ldrhne	r1, [sp, #6]
	ldrheq	r1, [sp, #6]
	orrne	r2, r1, r2, lsl #8
	orreq	r2, r1, r2
	strh	r2, [sp, #6]	@ movhi
	ldrh	r2, [sp, #6]
	strh	r2, [ip, r3]	@ movhi
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L76:
	.align	2
.L75:
	.word	.LANCHOR0
	.size	setPixel4, .-setPixel4
	.align	2
	.global	drawRect4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #28
	ldrb	ip, [sp, #64]	@ zero_extendqisi2
	ldrb	lr, [sp, #64]	@ zero_extendqisi2
	subs	r7, r3, #0
	orr	ip, ip, lr, lsl #8
	strh	ip, [sp, #22]	@ movhi
	ble	.L77
	mov	r4, r2
	mov	r10, r1
	sub	r9, r2, #1
	sub	r2, r2, #2
	add	r9, r9, r9, lsr #31
	add	r2, r2, r2, lsr #31
	add	r3, r4, r4, lsr #31
	asr	r1, r9, #1
	asr	r2, r2, #1
	asr	r3, r3, #1
	add	fp, r4, r0
	orr	r1, r1, #-2130706432
	orr	r2, r2, #-2130706432
	orr	r3, r3, #-2130706432
	mov	r5, r0
	ldr	r9, .L96
	str	r1, [sp, #4]
	str	r2, [sp, #12]
	str	r3, [sp, #8]
	add	r7, r7, r10
	sub	fp, fp, #1
	b	.L84
.L94:
	add	r2, r5, #1
	rsb	r6, r10, r10, lsl #4
	add	r6, r2, r6, lsl #4
	add	r6, r6, r6, lsr #31
	cmp	r8, #0
	mov	r1, r10
	mov	r0, r5
	ldrb	r2, [sp, #64]	@ zero_extendqisi2
	bic	r6, r6, #1
	bne	.L91
	bl	setPixel4
	ldr	r0, [r9, #4]
	ldr	r2, [r9]
	ldr	r3, [sp, #12]
	add	r6, r0, r6
	add	ip, sp, #22
	str	r8, [r2, #44]
	str	ip, [r2, #36]
	str	r6, [r2, #40]
	str	r3, [r2, #44]
	mov	r1, r10
	mov	r0, fp
	ldrb	r2, [sp, #64]	@ zero_extendqisi2
	bl	setPixel4
.L80:
	add	r10, r10, #1
	cmp	r10, r7
	beq	.L77
.L84:
	cmp	r4, #1
	beq	.L92
	cmp	r4, #2
	beq	.L93
	ands	r0, r5, #1
	and	r8, r4, #1
	bne	.L94
	rsb	r2, r10, r10, lsl #4
	add	r2, r5, r2, lsl #4
	ldr	ip, [r9, #4]
	add	r2, r2, r2, lsr #31
	bic	r2, r2, #1
	cmp	r8, #0
	add	r2, ip, r2
	ldr	ip, [r9]
	bne	.L95
	ldr	r3, [sp, #8]
	add	r10, r10, #1
	add	r0, sp, #22
	cmp	r10, r7
	str	r8, [ip, #44]
	str	r0, [ip, #36]
	str	r2, [ip, #40]
	str	r3, [ip, #44]
	bne	.L84
.L77:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L92:
	mov	r1, r10
	mov	r0, r5
	ldrb	r2, [sp, #64]	@ zero_extendqisi2
	bl	setPixel4
	b	.L80
.L95:
	add	r3, sp, #22
	str	r0, [ip, #44]
	str	r3, [ip, #36]
	ldr	r3, [sp, #4]
	str	r2, [ip, #40]
	str	r3, [ip, #44]
	mov	r1, r10
	mov	r0, fp
	ldrb	r2, [sp, #64]	@ zero_extendqisi2
	bl	setPixel4
	b	.L80
.L93:
	mov	r1, r10
	mov	r0, r5
	ldrb	r2, [sp, #64]	@ zero_extendqisi2
	bl	setPixel4
	mov	r1, r10
	ldrb	r2, [sp, #64]	@ zero_extendqisi2
	add	r0, r5, #1
	bl	setPixel4
	b	.L80
.L91:
	bl	setPixel4
	mov	r0, #0
	ldr	r2, [r9, #4]
	ldr	r3, [r9]
	add	r6, r2, r6
	add	r2, sp, #22
	str	r0, [r3, #44]
	str	r2, [r3, #36]
	ldr	r2, [sp, #4]
	str	r6, [r3, #40]
	str	r2, [r3, #44]
	b	.L80
.L97:
	.align	2
.L96:
	.word	.LANCHOR0
	.size	drawRect4, .-drawRect4
	.align	2
	.global	fillScreen4
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #0
	sub	sp, sp, #20
	strb	r0, [sp, #7]
	ldr	r1, .L100
	ldrb	r2, [sp, #7]	@ zero_extendqisi2
	ldrb	ip, [sp, #7]	@ zero_extendqisi2
	ldr	r3, [r1]
	ldr	r0, [r1, #4]
	ldr	r1, .L100+4
	orr	r2, r2, ip, lsl #8
	add	ip, sp, #14
	strh	r2, [sp, #14]	@ movhi
	str	lr, [r3, #44]
	str	ip, [r3, #36]
	str	r0, [r3, #40]
	str	r1, [r3, #44]
	add	sp, sp, #20
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L101:
	.align	2
.L100:
	.word	.LANCHOR0
	.word	-2130687232
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	drawFullscreenImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullscreenImage4, %function
drawFullscreenImage4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r2, .L103
	ldr	r1, .L103+4
	ldr	r3, [r2]
	ldr	r2, [r2, #4]
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	bx	lr
.L104:
	.align	2
.L103:
	.word	.LANCHOR0
	.word	-2147464448
	.size	drawFullscreenImage4, .-drawFullscreenImage4
	.align	2
	.global	flipPage
	.syntax unified
	.arm
	.fpu softvfp
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	ldrh	r1, [r2]
	tst	r1, #16
	ldr	r3, .L108
	moveq	r3, #100663296
	ldrh	r1, [r2]
	ldr	r0, .L108+4
	eor	r1, r1, #16
	strh	r1, [r2]	@ movhi
	str	r3, [r0, #4]
	bx	lr
.L109:
	.align	2
.L108:
	.word	100704256
	.word	.LANCHOR0
	.size	flipPage, .-flipPage
	.align	2
	.global	DMANow
	.syntax unified
	.arm
	.fpu softvfp
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #0
	ldr	ip, .L112
	ldr	lr, [ip]
	add	r0, r0, r0, lsl #1
	add	ip, lr, r0, lsl #2
	orr	r3, r3, #-2147483648
	lsl	r0, r0, #2
	str	r4, [ip, #8]
	str	r1, [lr, r0]
	str	r2, [ip, #4]
	pop	{r4, lr}
	str	r3, [ip, #8]
	bx	lr
.L113:
	.align	2
.L112:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.align	2
	.global	hideSprites
	.syntax unified
	.arm
	.fpu softvfp
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #512
	ldr	r3, .L118
	add	r2, r3, #1024
.L115:
	strh	r1, [r3], #8	@ movhi
	cmp	r3, r2
	bne	.L115
	bx	lr
.L119:
	.align	2
.L118:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.align	2
	.global	setupInterrupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #1
	str	lr, [sp, #-4]!
	mov	r0, #67108864
	mov	lr, #97
	mov	ip, #8
	ldr	r3, .L122
	ldr	r2, .L122+4
	strh	r1, [r3, #8]	@ movhi
	ldr	r1, .L122+8
	strh	lr, [r3]	@ movhi
	strh	ip, [r0, #4]	@ movhi
	ldr	lr, [sp], #4
	str	r1, [r2, #4092]
	bx	lr
.L123:
	.align	2
.L122:
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.comm	soundB,32,4
	.comm	soundA,32,4
	.global	dma
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 53) 9.1.0"
