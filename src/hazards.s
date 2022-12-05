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
	.file	"hazards.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"checkHazardSpawnLocation(%d, %d, %d) called\000"
	.text
	.align	2
	.global	checkHazardSpawnLocation
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkHazardSpawnLocation, %function
checkHazardSpawnLocation:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r6, .L11
	mov	r3, r2
	mov	r7, r0
	mov	r9, r1
	mov	r8, r2
	ldr	r4, .L11+4
	mov	r2, r1
	sub	sp, sp, #20
	mov	r1, r0
	ldr	r0, .L11+8
	mov	lr, pc
	bx	r4
	ldr	r3, [r6]
	cmp	r3, #0
	ble	.L2
	add	r1, r7, #7
	cmp	r7, #0
	movlt	r7, r1
	mov	r5, #0
	ldr	r4, .L11+12
	ldr	r10, .L11+16
	asr	r7, r7, #3
	rsb	fp, r8, #0
	b	.L4
.L5:
	ldr	r3, [r6]
	cmp	r3, r5
	add	r4, r4, #76
	ble	.L2
.L4:
	ldr	r0, [r4, #68]
	cmp	r0, #0
	add	r5, r5, #1
	beq	.L5
	ldr	r2, [r4, #4]
	cmp	r2, #39
	bgt	.L5
	ldr	r3, [r4]
	cmp	r3, #0
	add	r1, r3, #7
	movlt	r3, r1
	add	r0, r4, #16
	ldm	r0, {r0, r1}
	asr	r3, r3, #3
	str	r2, [sp, #4]
	str	r3, [sp]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	mov	r3, r8
	mov	r2, r9
	mov	r1, fp
	mov	r0, r7
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	beq	.L5
	mov	r0, #1
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L2:
	mov	r0, #0
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	.LANCHOR0
	.word	mgba_printf
	.word	.LC0
	.word	hazards
	.word	collision
	.size	checkHazardSpawnLocation, .-checkHazardSpawnLocation
	.align	2
	.global	hazardFactory
	.syntax unified
	.arm
	.fpu softvfp
	.type	hazardFactory, %function
hazardFactory:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r7, .L55
	ldr	r1, [r7]
	cmp	r1, #0
	ble	.L13
	ldr	r6, .L55+4
	mov	r5, r0
	mov	r4, #0
	mov	r3, r6
	b	.L42
.L15:
	add	r4, r4, #1
	cmp	r1, r4
	add	r3, r3, #76
	beq	.L13
.L42:
	ldr	r2, [r3, #68]
	cmp	r2, #0
	bne	.L15
	mov	r3, #1
	add	r9, r4, r4, lsl #3
	add	r9, r4, r9, lsl r3
	add	r9, r6, r9, lsl #2
	str	r3, [r9, #68]
	ldr	r8, .L55+8
	mov	lr, pc
	bx	r8
	subs	r3, r0, #0
	and	r3, r3, #1
	mov	r2, r3
	rsblt	r2, r3, #0
	str	r2, [r9, #32]
	lsl	r9, r4, #3
	cmp	r5, #8
	ldrls	pc, [pc, r5, asl #2]
	b	.L13
.L17:
	.word	.L24
	.word	.L23
	.word	.L22
	.word	.L13
	.word	.L21
	.word	.L20
	.word	.L19
	.word	.L18
	.word	.L16
.L24:
	mov	r1, #1
	mov	r0, #0
	mov	r2, #22
	mov	r3, #18
	add	r9, r9, r4
	add	r4, r4, r9, lsl r1
	add	r9, r6, r4, lsl #2
	str	r0, [r9, #40]
	str	r1, [r9, #68]
	str	r2, [r9, #16]
	str	r3, [r9, #20]
	mov	lr, pc
	bx	r8
	ldr	r7, .L55+12
	b	.L45
.L26:
	mov	lr, pc
	bx	r8
.L45:
	smull	r2, r3, r7, r0
	asr	r5, r0, #31
	add	r3, r3, r0
	rsb	r5, r5, r3, asr #7
	ldr	r1, [r9, #20]
	rsb	r5, r5, r5, lsl #4
	sub	r5, r0, r5, lsl #4
	sub	r5, r5, r1
	lsl	r5, r5, #3
	mov	r0, r5
	ldr	r2, [r9, #16]
	bl	checkHazardSpawnLocation
	cmp	r0, #0
	bne	.L26
	mov	ip, #1
	mov	r1, #608
.L52:
	mov	r2, #2
	ldr	r3, [r9, #16]
	rsb	r3, r3, r3, lsl #29
	lsl	r3, r3, #3
	str	r3, [r9, #4]
	str	r5, [r9]
	ldr	r3, .L55+16
	add	r4, r6, r4, lsl r2
.L53:
	str	r0, [r9, #24]
	str	r0, [r9, #28]
	str	r0, [r9, #52]
	str	r0, [r9, #8]
	str	ip, [r4, #12]
	str	r1, [r9, #48]
	str	r2, [r9, #36]
	str	r3, [r9, #72]
.L13:
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L16:
	mov	r0, #1
	mov	r3, #32
	mov	ip, #8
	mov	r1, #36
	add	r9, r9, r4
	add	r4, r4, r9, lsl r0
	add	r10, r6, r4, lsl #2
	ldr	r2, .L55+20
	str	ip, [r10, #40]
	str	r0, [r10, #68]
	str	r3, [r10, #16]
	str	r3, [r10, #20]
	str	r1, [r2]
	ldr	r9, .L55+12
	mov	lr, pc
	bx	r8
	b	.L51
.L41:
	mov	lr, pc
	bx	r8
.L51:
	smull	r2, r3, r9, r0
	asr	r5, r0, #31
	add	r3, r3, r0
	rsb	r5, r5, r3, asr #7
	ldr	r1, [r10, #20]
	rsb	r5, r5, r5, lsl #4
	sub	r5, r0, r5, lsl #4
	sub	r5, r5, r1
	lsl	r5, r5, #3
	mov	r0, r5
	ldr	r2, [r10, #16]
	bl	checkHazardSpawnLocation
	subs	fp, r0, #0
	bne	.L41
	mov	r9, #1
	mov	r2, #10
	mov	r1, #2
	ldr	r3, [r10, #16]
	rsb	r3, r3, r3, lsl #29
	lsl	r3, r3, #3
	ldr	r0, [r7, #28]
	str	r3, [r10, #4]
	ldr	r3, .L55+24
	str	r2, [r10, #56]
	str	r3, [r10, #72]
	str	r0, [r10, #48]
	str	r5, [r10]
	str	fp, [r10, #64]
	str	r1, [r10, #36]
	str	r9, [r10, #52]
	mov	lr, pc
	bx	r8
	ldr	r3, .L55+28
	smull	r2, r3, r0, r3
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl r9
	sub	r3, r0, r3
	add	r4, r6, r4, lsl #2
	add	r3, r3, #16
	str	r9, [r4, #12]
	str	fp, [r10, #24]
	str	fp, [r10, #28]
	str	fp, [r10, #8]
	str	r3, [r10, #60]
	b	.L13
.L18:
	mov	ip, #1
	mov	r3, #7
	mov	r0, #40
	mov	r1, #52
	mov	r2, #59
	add	r9, r9, r4
	add	r4, r4, r9, lsl ip
	add	r9, r6, r4, lsl #2
	str	r3, [r9, #40]
	ldr	r3, .L55+20
	str	ip, [r9, #68]
	str	r0, [r9, #16]
	str	r1, [r9, #20]
	str	r2, [r3]
	ldr	r7, .L55+12
	mov	lr, pc
	bx	r8
	b	.L50
.L36:
	mov	lr, pc
	bx	r8
.L50:
	smull	r2, r3, r7, r0
	asr	r5, r0, #31
	add	r3, r3, r0
	rsb	r5, r5, r3, asr #7
	ldr	r1, [r9, #20]
	rsb	r5, r5, r5, lsl #4
	sub	r5, r0, r5, lsl #4
	sub	r5, r5, r1
	lsl	r5, r5, #3
	mov	r0, r5
	ldr	r2, [r9, #16]
	bl	checkHazardSpawnLocation
	cmp	r0, #0
	bne	.L36
	mov	r2, #3
	ldr	r3, [r9, #16]
	rsb	r3, r3, r3, lsl #29
	lsl	r3, r3, r2
	str	r3, [r9, #4]
	mov	ip, #1
	mov	r1, #768
	str	r5, [r9]
	ldr	r3, .L55+32
	add	r4, r6, r4, lsl #2
	b	.L53
.L19:
	mov	r1, #1
	mov	r0, #6
	mov	r2, #45
	mov	r3, #20
	add	r9, r9, r4
	add	r4, r4, r9, lsl r1
	add	r10, r6, r4, lsl #2
	str	r0, [r10, #40]
	str	r1, [r10, #68]
	str	r2, [r10, #16]
	str	r3, [r10, #20]
	mov	lr, pc
	bx	r8
	ldr	r9, .L55+12
	b	.L48
.L32:
	mov	lr, pc
	bx	r8
.L48:
	smull	r2, r3, r9, r0
	asr	r5, r0, #31
	add	r3, r3, r0
	rsb	r5, r5, r3, asr #7
	ldr	r1, [r10, #20]
	rsb	r5, r5, r5, lsl #4
	sub	r5, r0, r5, lsl #4
	sub	r5, r5, r1
	lsl	r5, r5, #3
	mov	r0, r5
	ldr	r2, [r10, #16]
	bl	checkHazardSpawnLocation
	subs	fp, r0, #0
	bne	.L32
	mov	r1, #3
	mov	r9, #1
	mov	r2, #6
	ldr	r3, [r10, #16]
	rsb	r3, r3, r3, lsl #29
	lsl	r3, r3, r1
	ldr	r0, [r7, #4]
	str	r3, [r10, #4]
	ldr	r3, .L55+36
	str	r2, [r10, #56]
	str	r3, [r10, #72]
	str	r0, [r10, #48]
	str	r5, [r10]
	str	fp, [r10, #64]
	str	r1, [r10, #36]
	str	r9, [r10, #52]
	mov	lr, pc
	bx	r8
	ldr	r3, .L55+28
	smull	r2, r3, r0, r3
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl r9
	sub	r3, r0, r3
	add	r4, r6, r4, lsl #2
	add	r3, r3, #15
	str	r9, [r4, #12]
	str	r9, [r10, #24]
	str	fp, [r10, #28]
	str	fp, [r10, #8]
	str	r3, [r10, #60]
	b	.L13
.L20:
	mov	ip, #1
	mov	lr, #5
	mov	r0, #24
	mov	r1, #63
	mov	r2, #49
	cmp	r3, #0
	add	r3, r9, r4
	add	r3, r4, r3, lsl ip
	add	r3, r6, r3, lsl #2
	str	lr, [r3, #40]
	str	ip, [r3, #68]
	str	r0, [r3, #16]
	str	r1, [r3, #20]
	ldr	r3, .L55+20
	str	r2, [r3]
	beq	.L54
	mov	lr, pc
	bx	r8
	ldr	r3, .L55+28
	smull	r2, r3, r0, r3
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	sub	r3, r0, r3
	mvn	r3, r3
.L38:
	add	r5, r9, r4
	add	r5, r4, r5, lsl #1
	add	r5, r6, r5, lsl #2
	str	r3, [r5, #8]
	mov	lr, pc
	bx	r8
	ldr	r3, .L55+40
	smull	r1, r2, r3, r0
	ldr	r1, [r5, #8]
	cmp	r1, #0
	mov	r1, #1
	mov	ip, #3
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #4
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #3
	mov	lr, #256
	mov	r0, #0
	add	r9, r9, r4
	addle	r3, r3, #1488
	add	r4, r4, r9, lsl r1
	add	r2, r6, r4, lsl #2
	addle	r3, r3, #12
	str	r3, [r6, r4, lsl #2]
	ldr	r3, [r2, #16]
	rsb	r3, r3, r3, lsl #29
	lsl	r3, r3, ip
	str	r3, [r2, #4]
	ldr	r3, .L55+44
	str	lr, [r2, #48]
	str	ip, [r2, #36]
	str	r3, [r2, #72]
	str	r0, [r2, #24]
	str	r0, [r2, #52]
	str	r1, [r2, #28]
	str	r1, [r2, #12]
	b	.L13
.L21:
	mov	ip, #1
	mov	r3, #4
	mov	r0, #40
	mov	r1, #48
	mov	r2, #59
	add	r9, r9, r4
	add	r4, r4, r9, lsl ip
	add	r9, r6, r4, lsl #2
	str	r3, [r9, #40]
	ldr	r3, .L55+20
	str	ip, [r9, #68]
	str	r0, [r9, #16]
	str	r1, [r9, #20]
	str	r2, [r3]
	ldr	r7, .L55+12
	mov	lr, pc
	bx	r8
	b	.L49
.L34:
	mov	lr, pc
	bx	r8
.L49:
	smull	r2, r3, r7, r0
	asr	r5, r0, #31
	add	r3, r3, r0
	rsb	r5, r5, r3, asr #7
	ldr	r1, [r9, #20]
	rsb	r5, r5, r5, lsl #4
	sub	r5, r0, r5, lsl #4
	sub	r5, r5, r1
	lsl	r5, r5, #3
	mov	r0, r5
	ldr	r2, [r9, #16]
	bl	checkHazardSpawnLocation
	cmp	r0, #0
	bne	.L34
	mov	r2, #3
	ldr	r3, [r9, #16]
	rsb	r3, r3, r3, lsl #29
	lsl	r3, r3, r2
	str	r3, [r9, #4]
	mov	ip, #1
	mov	r1, #776
	str	r5, [r9]
	ldr	r3, .L55+48
	add	r4, r6, r4, lsl #2
	b	.L53
.L22:
	mov	r2, #1
	mov	r1, #2
	mov	r3, #19
	add	r9, r9, r4
	add	r4, r4, r9, lsl r2
	add	r9, r6, r4, lsl r1
	str	r1, [r9, #40]
	str	r2, [r9, #68]
	str	r3, [r9, #16]
	str	r3, [r9, #20]
	mov	lr, pc
	bx	r8
	ldr	r7, .L55+12
	b	.L47
.L30:
	mov	lr, pc
	bx	r8
.L47:
	smull	r2, r3, r7, r0
	asr	r5, r0, #31
	add	r3, r3, r0
	rsb	r5, r5, r3, asr #7
	ldr	r1, [r9, #20]
	rsb	r5, r5, r5, lsl #4
	sub	r5, r0, r5, lsl #4
	sub	r5, r5, r1
	lsl	r5, r5, #3
	mov	r0, r5
	ldr	r2, [r9, #16]
	bl	checkHazardSpawnLocation
	cmp	r0, #0
	bne	.L30
	mov	ip, #1
	mov	r1, #480
	b	.L52
.L23:
	mov	r3, #1
	mov	r2, #5
	mov	ip, #15
	mov	r0, #736
	mov	r1, #0
	add	r9, r9, r4
	add	r4, r4, r9, lsl r3
	add	r7, r6, r4, lsl #2
	str	r2, [r7, #16]
	ldr	r2, .L55+16
	str	ip, [r7, #20]
	str	r0, [r7, #48]
	str	r1, [r7, #36]
	str	r2, [r7, #72]
	str	r3, [r7, #40]
	str	r3, [r7, #68]
	mov	lr, pc
	bx	r8
	ldr	r9, .L55+12
	b	.L46
.L28:
	mov	lr, pc
	bx	r8
.L46:
	smull	r2, r3, r9, r0
	asr	r5, r0, #31
	add	r3, r3, r0
	rsb	r5, r5, r3, asr #7
	ldr	r1, [r7, #20]
	rsb	r5, r5, r5, lsl #4
	sub	r5, r0, r5, lsl #4
	sub	r5, r5, r1
	lsl	r5, r5, #3
	mov	r0, r5
	ldr	r2, [r7, #16]
	bl	checkHazardSpawnLocation
	cmp	r0, #0
	bne	.L28
	mov	r2, #1
	ldr	r3, [r7, #16]
	rsb	r3, r3, r3, lsl #29
	lsl	r3, r3, #3
	add	r4, r6, r4, lsl #2
	str	r3, [r7, #4]
	str	r5, [r7]
	str	r0, [r7, #24]
	str	r0, [r7, #52]
	str	r0, [r7, #8]
	str	r2, [r4, #12]
	str	r2, [r7, #28]
	b	.L13
.L54:
	mov	lr, pc
	bx	r8
	ldr	r3, .L55+28
	smull	r2, r3, r0, r3
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	sub	r3, r0, r3
	add	r3, r3, #1
	b	.L38
.L56:
	.align	2
.L55:
	.word	.LANCHOR0
	.word	hazards
	.word	rand
	.word	-2004318071
	.word	goDeathPlastic
	.word	cooldownTimer
	.word	goDeathDynamite
	.word	1431655766
	.word	goDeathCyanide
	.word	goDeathShark
	.word	1717986919
	.word	goDeathBoat
	.word	goDeathOil
	.size	hazardFactory, .-hazardFactory
	.align	2
	.global	newShield
	.syntax unified
	.arm
	.fpu softvfp
	.type	newShield, %function
newShield:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L59
	ldr	r1, [r3]
	mov	r2, #0
	push	{r4, lr}
	ldr	r3, .L59+4
	ldr	r0, .L59+8
	sub	r1, r1, #500
	mov	lr, pc
	bx	r3
	ldr	r3, .L59+12
	ldr	r3, [r3]
	ldr	r2, .L59+16
	add	r3, r3, #60
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L60:
	.align	2
.L59:
	.word	shield_length
	.word	playSoundB
	.word	shield_data
	.word	time
	.word	shieldTime
	.size	newShield, .-newShield
	.align	2
	.global	updateAndDrawShield
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateAndDrawShield, %function
updateAndDrawShield:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L67
	ldr	r2, .L67+4
	ldr	r3, [r3]
	ldr	r2, [r2]
	cmp	r2, r3
	blt	.L62
	tst	r3, #1
	beq	.L62
	ldr	r2, .L67+8
	ldr	r3, [r2]
	add	r1, r3, #7
	cmp	r3, #0
	movlt	r3, r1
	asr	r3, r3, #3
	sub	r3, r3, #2
	lsl	r3, r3, #23
	ldrb	r0, [r2, #8]	@ zero_extendqisi2
	ldr	r1, .L67+12
	ldr	r2, .L67+16
	lsr	r3, r3, #23
	orr	r3, r3, #16384
	strh	r0, [r2, #88]	@ movhi
	strh	r3, [r2, #90]	@ movhi
	strh	r1, [r2, #92]	@ movhi
	bx	lr
.L62:
	mov	r2, #512
	ldr	r3, .L67+16
	strh	r2, [r3, #88]	@ movhi
	bx	lr
.L68:
	.align	2
.L67:
	.word	time
	.word	shieldTime
	.word	player
	.word	523
	.word	shadowOAM
	.size	updateAndDrawShield, .-updateAndDrawShield
	.align	2
	.global	minmin
	.syntax unified
	.arm
	.fpu softvfp
	.type	minmin, %function
minmin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r1, r0
	movlt	r0, r1
	bx	lr
	.size	minmin, .-minmin
	.align	2
	.global	resetHazards
	.syntax unified
	.arm
	.fpu softvfp
	.type	resetHazards, %function
resetHazards:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L74
	ldr	r1, [r3]
	cmp	r1, #0
	ble	.L71
	mov	r2, #60
	mov	r0, #0
	ldr	r3, .L74+4
	add	r1, r1, r2
.L72:
	str	r2, [r3, #44]
	add	r2, r2, #1
	cmp	r2, r1
	str	r0, [r3, #68]
	add	r3, r3, #76
	bne	.L72
.L71:
	mov	r3, #0
	ldr	r1, .L74+8
	ldr	r2, .L74+12
	str	r3, [r1]
	str	r3, [r2]
	bx	lr
.L75:
	.align	2
.L74:
	.word	.LANCHOR0
	.word	hazards
	.word	shieldTime
	.word	cooldownTimer
	.size	resetHazards, .-resetHazards
	.align	2
	.global	initHazards
	.syntax unified
	.arm
	.fpu softvfp
	.type	initHazards, %function
initHazards:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L80
	ldr	r1, [r3]
	cmp	r1, #0
	bxle	lr
	mov	r2, #60
	mov	r0, #0
	ldr	r3, .L80+4
	add	r1, r1, r2
.L78:
	str	r2, [r3, #44]
	add	r2, r2, #1
	cmp	r2, r1
	str	r0, [r3, #68]
	add	r3, r3, #76
	bne	.L78
	bx	lr
.L81:
	.align	2
.L80:
	.word	.LANCHOR0
	.word	hazards
	.size	initHazards, .-initHazards
	.align	2
	.global	checkHazardCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkHazardCollision, %function
checkHazardCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r7, .L91
	ldr	r3, [r7]
	cmp	r3, #0
	sub	sp, sp, #16
	ble	.L83
	mov	r5, #0
	ldr	r4, .L91+4
	ldr	r6, .L91+8
	ldr	r8, .L91+12
	b	.L85
.L87:
	ldr	r3, [r7]
	cmp	r3, r5
	add	r4, r4, #76
	ble	.L83
.L85:
	ldr	r3, [r4, #68]
	cmp	r3, #0
	add	r5, r5, #1
	beq	.L87
	add	r0, r6, #20
	ldm	r0, {r0, r1}
	ldr	r2, [r6, #8]
	ldr	r3, [r6]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r2, [r4, #20]
	ldr	r3, [r4, #16]
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L87
	mov	r0, #1
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L83:
	mov	r0, #0
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L92:
	.align	2
.L91:
	.word	.LANCHOR0
	.word	hazards
	.word	player
	.word	collision
	.size	checkHazardCollision, .-checkHazardCollision
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"newHazard(): time: %d, timeInSeconds: %d, timeBlock"
	.ascii	": %d\000"
	.text
	.align	2
	.global	newHazard
	.syntax unified
	.arm
	.fpu softvfp
	.type	newHazard, %function
newHazard:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L133
	ldr	r2, .L133+4
	ldr	r3, [r5]
	smull	r1, r2, r3, r2
	asr	r4, r3, #31
	add	r2, r2, r3
	rsb	r4, r4, r2, asr #5
	cmp	r4, #14
	bhi	.L128
	ldr	r3, .L133+8
	mov	lr, pc
	bx	r3
	mov	r6, r0
	mov	r2, r4
	mov	r3, #0
	ldr	r1, [r5]
	ldr	r0, .L133+12
	ldr	r4, .L133+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L133+20
	smull	r1, r2, r3, r6
	asr	r3, r6, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r6, r3, lsl #2
	sub	r3, r3, #1
	cmp	r3, #48
	bhi	.L102
.L109:
	mov	r0, #0
	pop	{r4, r5, r6, lr}
	b	hazardFactory
.L128:
	sub	r3, r4, #15
	cmp	r3, #14
	bhi	.L129
	ldr	r3, .L133+8
	mov	lr, pc
	bx	r3
	mov	r6, r0
	mov	r2, r4
	mov	r3, #1
	ldr	r1, [r5]
	ldr	r0, .L133+12
	ldr	r4, .L133+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L133+20
	smull	r1, r2, r3, r6
	asr	r3, r6, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r6, r3, lsl #2
	sub	r2, r3, #1
	cmp	r2, #23
	bls	.L109
	sub	r2, r3, #26
	cmp	r2, #23
	bls	.L102
	sub	r3, r3, #51
	cmp	r3, #23
	bhi	.L103
.L113:
	mov	r0, #2
	pop	{r4, r5, r6, lr}
	b	hazardFactory
.L129:
	sub	r3, r4, #30
	cmp	r3, #14
	bhi	.L130
	ldr	r3, .L133+8
	mov	lr, pc
	bx	r3
	mov	r6, r0
	mov	r2, r4
	mov	r3, #2
	ldr	r1, [r5]
	ldr	r0, .L133+12
	ldr	r4, .L133+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L133+20
	smull	r1, r2, r3, r6
	asr	r3, r6, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r6, r3, lsl #2
	sub	r2, r3, #1
	cmp	r2, #31
	bls	.L113
	sub	r3, r3, #34
	cmp	r3, #31
	bhi	.L104
.L103:
	mov	r0, #3
	pop	{r4, r5, r6, lr}
	b	hazardFactory
.L130:
	sub	r3, r4, #45
	cmp	r3, #14
	bls	.L97
	sub	r3, r4, #60
	cmp	r3, #14
	bhi	.L131
	ldr	r3, .L133+8
	mov	lr, pc
	bx	r3
	mov	r2, r4
	mov	r6, r0
	mov	r3, #4
	ldr	r1, [r5]
.L127:
	ldr	r0, .L133+12
	ldr	r4, .L133+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L133+20
	smull	r1, r2, r3, r6
	asr	r3, r6, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r6, r3, lsl #2
	sub	r2, r3, #1
	cmp	r2, #23
	bls	.L103
	sub	r2, r3, #26
	cmp	r2, #23
	bls	.L104
	sub	r3, r3, #51
	cmp	r3, #23
	bls	.L106
.L105:
	mov	r0, #7
	pop	{r4, r5, r6, lr}
	b	hazardFactory
.L102:
	mov	r0, #1
	pop	{r4, r5, r6, lr}
	b	hazardFactory
.L104:
	mov	r0, #4
	pop	{r4, r5, r6, lr}
	b	hazardFactory
.L106:
	mov	r0, #6
	pop	{r4, r5, r6, lr}
	b	hazardFactory
.L97:
	ldr	r3, .L133+8
	mov	lr, pc
	bx	r3
	mov	r2, r4
	mov	r6, r0
	mov	r3, #3
	ldr	r1, [r5]
	b	.L127
.L131:
	sub	r3, r4, #75
	cmp	r3, #14
	bls	.L99
	sub	r3, r4, #90
	cmp	r3, #14
	bhi	.L132
	ldr	r3, .L133+8
	mov	lr, pc
	bx	r3
	mov	r6, r0
	mov	r2, r4
	mov	r3, #6
	ldr	r1, [r5]
	ldr	r0, .L133+12
	ldr	r4, .L133+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L133+20
	smull	r1, r2, r3, r6
	asr	r3, r6, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r6, r3, lsl #2
	sub	r3, r3, #1
	cmp	r3, #48
	bls	.L106
.L107:
	mov	r0, #5
	pop	{r4, r5, r6, lr}
	b	hazardFactory
.L99:
	ldr	r3, .L133+8
	mov	lr, pc
	bx	r3
	mov	r6, r0
	mov	r2, r4
	mov	r3, #5
	ldr	r1, [r5]
	ldr	r0, .L133+12
	ldr	r4, .L133+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L133+20
	smull	r1, r2, r3, r6
	asr	r3, r6, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r6, r3, lsl #2
	sub	r2, r3, #1
	cmp	r2, #31
	bls	.L106
	sub	r3, r3, #34
	cmp	r3, #31
	bhi	.L105
	b	.L107
.L132:
	ldr	r3, .L133+8
	mov	lr, pc
	bx	r3
	mov	r6, r0
	mov	r2, r4
	mov	r3, #7
	ldr	r1, [r5]
	ldr	r0, .L133+12
	ldr	r4, .L133+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L133+20
	smull	r1, r2, r3, r6
	asr	r3, r6, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r6, r3, lsl #2
	sub	r2, r3, #1
	cmp	r2, #31
	bls	.L106
	sub	r3, r3, #34
	cmp	r3, #31
	bls	.L107
	mov	r0, #8
	pop	{r4, r5, r6, lr}
	b	hazardFactory
.L134:
	.align	2
.L133:
	.word	time
	.word	-2004318071
	.word	rand
	.word	.LC1
	.word	mgba_printf
	.word	1374389535
	.size	newHazard, .-newHazard
	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.align	2
	.global	updateAndDrawHazards
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateAndDrawHazards, %function
updateAndDrawHazards:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L173
	ldr	r4, [r3]
	ldr	fp, .L173+4
	sub	r5, r4, #1
	str	r5, [r3]
	ldr	r1, [fp]
	ldr	r3, .L173+8
	sub	sp, sp, #28
	mov	r0, #120
	mov	lr, pc
	bx	r3
	ldr	r3, .L173+12
	ldr	r4, [r3]
	mov	r1, r0
	ldr	r3, .L173+16
	mov	r0, r4
	mov	lr, pc
	bx	r3
	ldr	r3, .L173+20
	cmp	r4, r3
	movgt	r4, #0
	movle	r4, #1
	cmp	r1, #0
	and	r4, r4, r5, lsr #31
	movne	r4, #0
	cmp	r4, #0
	bne	.L169
.L136:
	ldr	r9, .L173+24
	ldr	r3, [r9]
	cmp	r3, #0
	ble	.L135
	mov	r6, #0
	ldr	r4, .L173+28
	ldr	r8, .L173+32
	ldr	r7, .L173+36
	ldr	r10, .L173+40
	b	.L154
.L170:
	ldr	r2, [r4, #4]
	cmp	r2, #0
	add	r3, r2, #7
	movge	r3, r2
	ldr	r1, [r4, #24]
	cmp	r1, #0
	asr	r3, r3, #3
	beq	.L139
	and	r3, r3, #255
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	lsl	r1, r5, #3
	strh	r3, [r8, r1]	@ movhi
	ldr	r3, [r4, #52]
	cmp	r3, #0
	bne	.L166
.L171:
	ldr	r3, [r4, #40]
.L142:
	ldr	r1, [r4, #32]
	ldr	r0, [r4]
	cmp	r1, #0
	add	r1, r0, #7
	beq	.L144
	cmp	r0, #0
	movge	r1, r0
	ldr	lr, .L173+44
	ldr	ip, [r4, #36]
	and	r1, lr, r1, asr #3
	orr	r1, r1, ip, lsl #14
	orr	r1, r1, #4096
	add	ip, r8, r5, lsl #3
	strh	r1, [ip, #2]	@ movhi
.L145:
	cmp	r3, #8
	ldrsh	r3, [r4, #48]
	add	r5, r8, r5, lsl #3
	orreq	r3, r3, #5120
	orrne	r3, r3, #1024
	strh	r3, [r5, #4]	@ movhi
	ldr	r3, [r7]
	add	r1, r3, #7
	cmp	r3, #0
	movlt	r3, r1
	add	r1, r2, #7
	cmp	r2, #0
	movlt	r2, r1
	add	ip, r0, #7
	cmp	r0, #0
	movlt	r0, ip
	asr	r3, r3, #3
	str	r3, [sp]
	ldr	lr, [r7, #20]
	ldr	r3, [r7, #8]
	ldr	ip, [r7, #24]
	stmib	sp, {r3, ip, lr}
	asr	r1, r2, #3
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #20]
	asr	r0, r0, #3
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	beq	.L148
	ldr	r3, [r7, #32]
	cmp	r3, #0
	ble	.L149
	sub	r3, r3, #1
	str	r3, [r7, #32]
	bl	newShield
.L150:
	mov	r3, #0
	str	r3, [r4, #68]
.L148:
	ldr	r3, [r4, #4]
	cmp	r3, #1280
	movgt	r3, #0
	strgt	r3, [r4, #68]
	bgt	.L152
	ldr	r1, [fp]
	ldr	r2, [r4, #40]
	add	r3, r3, r1
	cmp	r2, #6
	str	r3, [r4, #4]
	addeq	r3, r3, #2
	streq	r3, [r4, #4]
	beq	.L152
	cmp	r2, #5
	ldreq	r3, [r4]
	ldreq	r2, [r4, #8]
	addeq	r3, r3, r2
	streq	r3, [r4]
.L152:
	ldr	r3, [r9]
	add	r6, r6, #1
	cmp	r3, r6
	add	r4, r4, #76
	ble	.L135
.L154:
	ldr	r3, [r4, #68]
	cmp	r3, #0
	ldr	r5, [r4, #44]
	bne	.L170
	mov	r3, #512
	lsl	r5, r5, #3
	strh	r3, [r8, r5]	@ movhi
	b	.L152
.L139:
	ldr	r1, [r4, #28]
	and	r3, r3, #255
	cmp	r1, #0
	orrne	r3, r3, #16384
	lsl	r1, r5, #3
	strh	r3, [r8, r1]	@ movhi
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L171
.L166:
	ldr	r3, .L173+12
	str	r2, [sp, #16]
	ldr	r0, [r3]
	ldr	r1, [r4, #60]
	ldr	r3, .L173+16
	mov	lr, pc
	bx	r3
	cmp	r1, #0
	ldr	r3, [r4, #40]
	ldr	r2, [sp, #16]
	bne	.L142
	cmp	r3, #6
	beq	.L172
	cmp	r3, #8
	bne	.L142
	cmp	r2, #720
	ble	.L142
	ldr	r1, [r4, #64]
	add	r1, r1, #1
	cmp	r1, #9
	movge	r1, #9
	add	r0, r9, r1, lsl #2
	ldr	r0, [r0, #28]
	str	r1, [r4, #64]
	str	r0, [r4, #48]
	b	.L142
.L144:
	cmp	r0, #0
	movge	r1, r0
	ldr	lr, .L173+44
	ldr	ip, [r4, #36]
	and	r1, lr, r1, asr #3
	orr	r1, r1, ip, lsl #14
	add	ip, r8, r5, lsl #3
	strh	r1, [ip, #2]	@ movhi
	b	.L145
.L135:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L149:
	ldr	r3, .L173+48
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	r2, .L173+52
	str	r3, [r2]
	ldr	r3, [r4, #72]
	mov	lr, pc
	bx	r3
	b	.L150
.L172:
	ldr	r0, [r4, #64]
	str	r3, [sp, #20]
	str	r2, [sp, #16]
	ldr	r3, .L173+16
	ldr	r1, [r4, #56]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	add	r0, r9, r1, lsl #2
	ldr	r0, [r0, #4]
	add	r2, sp, #16
	str	r1, [r4, #64]
	str	r0, [r4, #48]
	ldm	r2, {r2, r3}
	b	.L142
.L169:
	bl	newHazard
	b	.L136
.L174:
	.align	2
.L173:
	.word	cooldownTimer
	.word	gameSpeed
	.word	__aeabi_idiv
	.word	time
	.word	__aeabi_idivmod
	.word	7199
	.word	.LANCHOR0
	.word	hazards
	.word	shadowOAM
	.word	player
	.word	collision
	.word	511
	.word	pauseSounds
	.word	shieldTime
	.size	updateAndDrawHazards, .-updateAndDrawHazards
	.global	NUM_HAZARDS
	.comm	hazards,1520,4
	.global	dynamiteFrames
	.global	sharkFrames
	.comm	shadowOAM,1024,4
	.comm	player,72,4
	.comm	cooldownTimer,4,4
	.comm	shieldTime,4,4
	.comm	gameSpeed,4,4
	.comm	time,4,4
	.comm	shells_owned,4,4
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	NUM_HAZARDS, %object
	.size	NUM_HAZARDS, 4
NUM_HAZARDS:
	.word	20
	.type	sharkFrames, %object
	.size	sharkFrames, 24
sharkFrames:
	.word	11
	.word	15
	.word	19
	.word	23
	.word	19
	.word	15
	.type	dynamiteFrames, %object
	.size	dynamiteFrames, 40
dynamiteFrames:
	.word	267
	.word	271
	.word	275
	.word	279
	.word	283
	.word	395
	.word	399
	.word	403
	.word	407
	.word	411
	.ident	"GCC: (devkitARM release 53) 9.1.0"
