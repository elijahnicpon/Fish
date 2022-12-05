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
	.file	"upgrade_menu.c"
	.text
	.align	2
	.global	updateShield
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateShield, %function
updateShield:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L10
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L10+4
	ldr	r6, [r2, #48]
	ldr	lr, .L10+8
	ldr	r5, [r3, r6, lsl #2]
	ldr	r8, .L10+12
	smull	r3, lr, r5, lr
	smull	r2, r8, r5, r8
	ldr	r7, .L10+16
	ldr	r3, .L10+20
	asr	ip, r5, #31
	rsb	lr, ip, lr, asr #6
	rsb	r10, ip, r8, asr #5
	ldr	r4, [r3]
	smull	r8, fp, r7, lr
	smull	r3, r8, r7, r10
	sub	sp, sp, #12
	str	r8, [sp, #4]
	asr	r8, lr, #31
	rsb	r8, r8, fp, asr #2
	add	r8, r8, r8, lsl #2
	sub	r8, lr, r8, lsl #1
	mov	lr, #148	@ movhi
	cmp	r5, r4
	ldr	r0, .L10+24
	movge	r4, #32
	movlt	r4, #0
	strh	lr, [r0, #178]	@ movhi
	mov	lr, #156	@ movhi
	smull	r2, r1, r7, r5
	rsb	ip, ip, r1, asr #2
	smull	r3, r7, ip, r7
	add	r8, r4, r8
	strh	r8, [r0, #180]	@ movhi
	ldr	r8, [sp, #4]
	strh	lr, [r0, #186]	@ movhi
	asr	lr, r10, #31
	rsb	lr, lr, r8, asr #2
	add	lr, lr, lr, lsl #2
	sub	lr, r10, lr, lsl #1
	add	lr, r4, lr
	strh	lr, [r0, #188]	@ movhi
	asr	lr, ip, #31
	rsb	r7, lr, r7, asr #2
	add	r7, r7, r7, lsl #2
	sub	r7, ip, r7, lsl #1
	add	ip, ip, ip, lsl #2
	sub	r5, r5, ip, lsl #1
	mov	ip, #164	@ movhi
	mov	r9, #110
	strh	ip, [r0, #194]	@ movhi
	mov	ip, #172	@ movhi
	mov	r2, r0
	mov	r1, #0
	mov	r3, #74
	add	r7, r4, r7
	add	r5, r4, r5
	strh	r7, [r0, #196]	@ movhi
	strh	r5, [r0, #204]	@ movhi
	strh	ip, [r0, #202]	@ movhi
	strh	r9, [r0, #176]	@ movhi
	strh	r9, [r0, #184]	@ movhi
	strh	r9, [r0, #192]	@ movhi
	strh	r9, [r0, #200]	@ movhi
	ldr	r4, .L10+28
.L4:
	cmp	r6, r1
	movle	ip, #64
	movgt	ip, #96
	add	lr, r3, #23
	add	r1, r1, #1
	orr	r0, r3, #16384
	cmp	r1, #5
	lsl	r3, lr, #16
	strh	r4, [r2, #208]	@ movhi
	strh	ip, [r2, #212]	@ movhi
	strh	r0, [r2, #210]	@ movhi
	lsr	r3, r3, #16
	add	r2, r2, #8
	bne	.L4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	player
	.word	.LANCHOR0
	.word	274877907
	.word	1374389535
	.word	1717986919
	.word	shells_owned
	.word	shadowOAM
	.word	16511
	.size	updateShield, .-updateShield
	.align	2
	.global	updateEnergy
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnergy, %function
updateEnergy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L20
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L20+4
	ldr	r6, [r2, #56]
	add	r3, r3, r6, lsl #2
	ldr	r5, [r3, #24]
	ldr	lr, .L20+8
	ldr	r8, .L20+12
	smull	r3, lr, r5, lr
	smull	r2, r8, r5, r8
	ldr	r7, .L20+16
	ldr	r3, .L20+20
	asr	ip, r5, #31
	rsb	lr, ip, lr, asr #6
	rsb	r10, ip, r8, asr #5
	ldr	r4, [r3]
	smull	r8, fp, r7, lr
	smull	r3, r8, r7, r10
	sub	sp, sp, #12
	str	r8, [sp, #4]
	asr	r8, lr, #31
	rsb	r8, r8, fp, asr #2
	add	r8, r8, r8, lsl #2
	sub	r8, lr, r8, lsl #1
	mov	lr, #148	@ movhi
	cmp	r5, r4
	ldr	r0, .L20+24
	movge	r4, #32
	movlt	r4, #0
	strh	lr, [r0, #98]	@ movhi
	mov	lr, #156	@ movhi
	smull	r2, r1, r7, r5
	rsb	ip, ip, r1, asr #2
	smull	r3, r7, ip, r7
	add	r8, r4, r8
	strh	r8, [r0, #100]	@ movhi
	ldr	r8, [sp, #4]
	strh	lr, [r0, #106]	@ movhi
	asr	lr, r10, #31
	rsb	lr, lr, r8, asr #2
	add	lr, lr, lr, lsl #2
	sub	lr, r10, lr, lsl #1
	add	lr, r4, lr
	strh	lr, [r0, #108]	@ movhi
	asr	lr, ip, #31
	rsb	r7, lr, r7, asr #2
	add	r7, r7, r7, lsl #2
	sub	r7, ip, r7, lsl #1
	add	ip, ip, ip, lsl #2
	sub	r5, r5, ip, lsl #1
	mov	ip, #164	@ movhi
	mov	r9, #70
	strh	ip, [r0, #114]	@ movhi
	mov	ip, #172	@ movhi
	mov	r2, r0
	mov	r1, #0
	mov	r3, #74
	add	r7, r4, r7
	add	r5, r4, r5
	strh	r7, [r0, #116]	@ movhi
	strh	r5, [r0, #124]	@ movhi
	strh	ip, [r0, #122]	@ movhi
	strh	r9, [r0, #96]	@ movhi
	strh	r9, [r0, #104]	@ movhi
	strh	r9, [r0, #112]	@ movhi
	strh	r9, [r0, #120]	@ movhi
	ldr	r4, .L20+28
.L15:
	cmp	r6, r1
	movle	ip, #64
	movgt	ip, #96
	add	lr, r3, #23
	add	r1, r1, #1
	orr	r0, r3, #16384
	cmp	r1, #5
	lsl	r3, lr, #16
	strh	r4, [r2, #128]	@ movhi
	strh	ip, [r2, #132]	@ movhi
	strh	r0, [r2, #130]	@ movhi
	lsr	r3, r3, #16
	add	r2, r2, #8
	bne	.L15
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	player
	.word	.LANCHOR0
	.word	274877907
	.word	1374389535
	.word	1717986919
	.word	shells_owned
	.word	shadowOAM
	.word	16471
	.size	updateEnergy, .-updateEnergy
	.align	2
	.global	updateAgility
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateAgility, %function
updateAgility:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L30
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L30+4
	ldr	r6, [r2, #52]
	add	r3, r3, r6, lsl #2
	ldr	r5, [r3, #48]
	ldr	lr, .L30+8
	ldr	r8, .L30+12
	smull	r3, lr, r5, lr
	smull	r2, r8, r5, r8
	ldr	r7, .L30+16
	ldr	r3, .L30+20
	asr	ip, r5, #31
	rsb	lr, ip, lr, asr #6
	rsb	r10, ip, r8, asr #5
	ldr	r4, [r3]
	smull	r8, fp, r7, lr
	smull	r3, r8, r7, r10
	sub	sp, sp, #12
	str	r8, [sp, #4]
	asr	r8, lr, #31
	rsb	r8, r8, fp, asr #2
	add	r8, r8, r8, lsl #2
	sub	r8, lr, r8, lsl #1
	mov	lr, #148	@ movhi
	cmp	r5, r4
	ldr	r0, .L30+24
	movge	r4, #32
	movlt	r4, #0
	strh	lr, [r0, #18]	@ movhi
	mov	lr, #156	@ movhi
	smull	r2, r1, r7, r5
	rsb	ip, ip, r1, asr #2
	smull	r3, r7, ip, r7
	add	r8, r4, r8
	strh	r8, [r0, #20]	@ movhi
	ldr	r8, [sp, #4]
	strh	lr, [r0, #26]	@ movhi
	asr	lr, r10, #31
	rsb	lr, lr, r8, asr #2
	add	lr, lr, lr, lsl #2
	sub	lr, r10, lr, lsl #1
	add	lr, r4, lr
	strh	lr, [r0, #28]	@ movhi
	asr	lr, ip, #31
	rsb	r7, lr, r7, asr #2
	add	r7, r7, r7, lsl #2
	sub	r7, ip, r7, lsl #1
	add	ip, ip, ip, lsl #2
	sub	r5, r5, ip, lsl #1
	mov	ip, #164	@ movhi
	mov	r9, #30
	strh	ip, [r0, #34]	@ movhi
	mov	ip, #172	@ movhi
	mov	r2, r0
	mov	r1, #0
	mov	r3, #74
	add	r7, r4, r7
	add	r5, r4, r5
	strh	r7, [r0, #36]	@ movhi
	strh	r5, [r0, #44]	@ movhi
	strh	ip, [r0, #42]	@ movhi
	strh	r9, [r0, #16]	@ movhi
	strh	r9, [r0, #24]	@ movhi
	strh	r9, [r0, #32]	@ movhi
	strh	r9, [r0, #40]	@ movhi
	ldr	r4, .L30+28
.L25:
	cmp	r6, r1
	movle	ip, #64
	movgt	ip, #96
	add	lr, r3, #23
	add	r1, r1, #1
	orr	r0, r3, #16384
	cmp	r1, #5
	lsl	r3, lr, #16
	strh	r4, [r2, #48]	@ movhi
	strh	ip, [r2, #52]	@ movhi
	strh	r0, [r2, #50]	@ movhi
	lsr	r3, r3, #16
	add	r2, r2, #8
	bne	.L25
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	player
	.word	.LANCHOR0
	.word	274877907
	.word	1374389535
	.word	1717986919
	.word	shells_owned
	.word	shadowOAM
	.word	16431
	.size	updateAgility, .-updateAgility
	.align	2
	.global	updateShellsOwned
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateShellsOwned, %function
updateShellsOwned:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L34
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r1, [r3]
	ldr	r8, .L34+4
	smull	r3, r6, r8, r1
	ldr	r2, .L34+8
	smull	r3, r2, r1, r2
	mov	r0, #4
	mov	r5, #37
	mov	r4, #30
	mov	lr, #23
	mov	ip, #16
	asr	r7, r1, #31
	rsb	r6, r7, r6, asr #2
	smull	r3, r10, r8, r6
	ldr	r9, .L34+12
	smull	r3, r9, r1, r9
	rsb	r2, r7, r2, asr #5
	smull	r3, r8, r2, r8
	asr	r3, r6, #31
	rsb	r3, r3, r10, asr #2
	add	r3, r3, r3, lsl #2
	add	r10, r6, r6, lsl #2
	sub	r6, r6, r3, lsl #1
	ldr	r3, .L34+16
	sub	r1, r1, r10, lsl #1
	rsb	r7, r7, r9, asr #6
	add	r6, r6, #256
	add	r9, r3, #268
	strh	r6, [r9]	@ movhi
	add	r1, r1, #256
	add	r6, r3, #260
	strh	r1, [r6]	@ movhi
	asr	r1, r2, #31
	rsb	r1, r1, r8, asr #2
	add	r1, r1, r1, lsl #2
	sub	r2, r2, r1, lsl #1
	add	r2, r2, #256
	add	r1, r3, #276
	strh	r2, [r1]	@ movhi
	add	r7, r7, #256
	add	r2, r3, #284
	add	r6, r3, #256
	strh	r7, [r2]	@ movhi
	add	r1, r3, #264
	add	r2, r3, #272
	add	r3, r3, #280
	strh	r5, [r6, #2]	@ movhi
	strh	r0, [r6]	@ movhi
	strh	r4, [r1, #2]	@ movhi
	strh	lr, [r2, #2]	@ movhi
	strh	r0, [r1]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	ip, [r3, #2]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	shells_owned
	.word	1717986919
	.word	1374389535
	.word	274877907
	.word	shadowOAM
	.size	updateShellsOwned, .-updateShellsOwned
	.align	2
	.global	attemptUpgradeEnergy
	.syntax unified
	.arm
	.fpu softvfp
	.type	attemptUpgradeEnergy, %function
attemptUpgradeEnergy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L41
	ldr	r2, .L41+4
	ldr	r3, [ip, #56]
	push	{r4, lr}
	ldr	lr, .L41+8
	add	r2, r2, r3, lsl #2
	ldr	r0, [r2, #24]
	ldr	r1, [lr]
	cmp	r3, #4
	cmple	r0, r1
	movle	r2, #1
	movgt	r2, #0
	ble	.L40
	ldr	r3, .L41+12
	ldr	r1, [r3]
	ldr	r0, .L41+16
	ldr	r3, .L41+20
	sub	r1, r1, #500
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L40:
	sub	r1, r1, r0
	add	r3, r3, #1
	str	r1, [lr]
	str	r3, [ip, #56]
	ldr	r4, .L41+24
	bl	updateShellsOwned
	bl	updateAgility
	bl	updateEnergy
	bl	updateShield
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L41+28
	mov	lr, pc
	bx	r4
	ldr	r3, .L41+32
	ldr	r1, [r3]
	mov	r2, #0
	ldr	r0, .L41+36
	ldr	r3, .L41+20
	sub	r1, r1, #500
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L42:
	.align	2
.L41:
	.word	player
	.word	.LANCHOR0
	.word	shells_owned
	.word	error_length
	.word	error_data
	.word	playSoundB
	.word	DMANow
	.word	shadowOAM
	.word	success_length
	.word	success_data
	.size	attemptUpgradeEnergy, .-attemptUpgradeEnergy
	.align	2
	.global	attemptUpgradeShield
	.syntax unified
	.arm
	.fpu softvfp
	.type	attemptUpgradeShield, %function
attemptUpgradeShield:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L48
	ldr	r2, .L48+4
	ldr	r3, [ip, #48]
	push	{r4, lr}
	ldr	lr, .L48+8
	ldr	r0, [r2, r3, lsl #2]
	ldr	r1, [lr]
	cmp	r3, #4
	cmple	r0, r1
	movle	r2, #1
	movgt	r2, #0
	ble	.L47
	ldr	r3, .L48+12
	ldr	r1, [r3]
	ldr	r0, .L48+16
	ldr	r3, .L48+20
	sub	r1, r1, #500
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L47:
	sub	r1, r1, r0
	add	r3, r3, #1
	str	r1, [lr]
	str	r3, [ip, #48]
	ldr	r4, .L48+24
	bl	updateShellsOwned
	bl	updateAgility
	bl	updateEnergy
	bl	updateShield
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L48+28
	mov	lr, pc
	bx	r4
	ldr	r3, .L48+32
	ldr	r1, [r3]
	mov	r2, #0
	ldr	r0, .L48+36
	ldr	r3, .L48+20
	sub	r1, r1, #500
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L49:
	.align	2
.L48:
	.word	player
	.word	.LANCHOR0
	.word	shells_owned
	.word	error_length
	.word	error_data
	.word	playSoundB
	.word	DMANow
	.word	shadowOAM
	.word	success_length
	.word	success_data
	.size	attemptUpgradeShield, .-attemptUpgradeShield
	.align	2
	.global	attemptUpgradeAgility
	.syntax unified
	.arm
	.fpu softvfp
	.type	attemptUpgradeAgility, %function
attemptUpgradeAgility:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L55
	ldr	r2, .L55+4
	ldr	r3, [ip, #52]
	push	{r4, lr}
	ldr	lr, .L55+8
	add	r2, r2, r3, lsl #2
	ldr	r0, [r2, #48]
	ldr	r1, [lr]
	cmp	r3, #4
	cmple	r0, r1
	movle	r2, #1
	movgt	r2, #0
	ble	.L54
	ldr	r3, .L55+12
	ldr	r1, [r3]
	ldr	r0, .L55+16
	ldr	r3, .L55+20
	sub	r1, r1, #500
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L54:
	sub	r1, r1, r0
	add	r3, r3, #1
	str	r1, [lr]
	str	r3, [ip, #52]
	ldr	r4, .L55+24
	bl	updateShellsOwned
	bl	updateAgility
	bl	updateEnergy
	bl	updateShield
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L55+28
	mov	lr, pc
	bx	r4
	ldr	r3, .L55+32
	ldr	r1, [r3]
	mov	r2, #0
	ldr	r0, .L55+36
	ldr	r3, .L55+20
	sub	r1, r1, #500
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L56:
	.align	2
.L55:
	.word	player
	.word	.LANCHOR0
	.word	shells_owned
	.word	error_length
	.word	error_data
	.word	playSoundB
	.word	DMANow
	.word	shadowOAM
	.word	success_length
	.word	success_data
	.size	attemptUpgradeAgility, .-attemptUpgradeAgility
	.align	2
	.global	doUpgradeMenu
	.syntax unified
	.arm
	.fpu softvfp
	.type	doUpgradeMenu, %function
doUpgradeMenu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L81
	ldrh	r3, [r4]
	tst	r3, #64
	beq	.L58
	ldr	r2, .L81+4
	ldrh	r2, [r2]
	tst	r2, #64
	beq	.L76
.L58:
	tst	r3, #16
	beq	.L59
	ldr	r2, .L81+4
	ldrh	r2, [r2]
	tst	r2, #16
	beq	.L77
.L59:
	tst	r3, #128
	beq	.L60
	ldr	r2, .L81+4
	ldrh	r2, [r2]
	tst	r2, #128
	beq	.L78
.L60:
	tst	r3, #8
	beq	.L61
	ldr	r3, .L81+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L79
.L61:
	ldr	r3, .L81+8
	ldrh	r2, [r3, #48]
	tst	r2, #512
	bne	.L62
	ldrh	r2, [r3, #48]
	tst	r2, #256
	bne	.L62
	ldrh	r3, [r3, #48]
	tst	r3, #4
	bne	.L62
	ldr	r3, .L81+12
	ldr	r2, [r3]
	cmp	r2, #0
	beq	.L80
.L62:
	ldr	r4, .L81+16
	ldr	r3, .L81+20
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	add	r1, r3, #1
	cmp	r1, #0
	addlt	r3, r3, #8
	movge	r3, r1
	mov	ip, #0
	mov	r0, #67108864
	ldr	lr, .L81+24
	asr	r3, r3, #3
	ldr	r2, [lr]
	str	r1, [r4]
	lsl	r3, r3, #16
	ldr	r1, .L81+28
	lsr	r3, r3, #16
	add	r2, r2, #1
	str	r2, [lr]
	str	ip, [r1]
	pop	{r4, lr}
	strh	ip, [r0, #18]	@ movhi
	strh	r3, [r0, #16]	@ movhi
	bx	lr
.L79:
	ldr	r3, .L81+32
	mov	lr, pc
	bx	r3
	b	.L61
.L76:
	bl	attemptUpgradeAgility
	ldrh	r3, [r4]
	b	.L58
.L77:
	bl	attemptUpgradeEnergy
	ldrh	r3, [r4]
	b	.L59
.L78:
	bl	attemptUpgradeShield
	ldrh	r3, [r4]
	b	.L60
.L80:
	mov	r0, #1
	ldr	r1, .L81+36
	ldr	r2, [r1]
	add	r2, r2, #4992
	add	r2, r2, #8
	str	r2, [r1]
	str	r0, [r3]
	ldr	r4, .L81+40
	bl	updateAgility
	bl	updateEnergy
	bl	updateShield
	bl	updateShellsOwned
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L81+44
	mov	lr, pc
	bx	r4
	b	.L62
.L82:
	.align	2
.L81:
	.word	oldButtons
	.word	buttons
	.word	67109120
	.word	cheatUsed
	.word	hOff
	.word	waitForVBlank
	.word	time
	.word	vOff
	.word	newGameRun
	.word	shells_owned
	.word	DMANow
	.word	shadowOAM
	.size	doUpgradeMenu, .-doUpgradeMenu
	.align	2
	.global	goUpgradeMenu
	.syntax unified
	.arm
	.fpu softvfp
	.type	goUpgradeMenu, %function
goUpgradeMenu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L85
	mov	lr, pc
	bx	r3
	mov	ip, #6
	mov	r1, #67108864
	mov	r0, #7936
	ldr	r2, .L85+4
	ldr	r5, .L85+8
	str	ip, [r2]
	mov	r3, #256
	strh	r0, [r1, #8]	@ movhi
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L85+12
	mov	lr, pc
	bx	r5
	mov	r3, #3920
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L85+16
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L85+20
	ldr	r1, .L85+24
	mov	lr, pc
	bx	r5
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L85+28
	ldr	r1, .L85+32
	mov	lr, pc
	bx	r5
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L85+36
	ldr	r1, .L85+40
	mov	lr, pc
	bx	r5
	mov	r1, #288
	mov	ip, #4
	ldr	r4, .L85+44
	ldr	r0, .L85+48
	add	r3, r4, r1
	add	r2, r4, #292
	strh	ip, [r3]	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strh	r1, [r2]	@ movhi
	bl	updateShellsOwned
	bl	updateAgility
	bl	updateEnergy
	bl	updateShield
	mov	r1, #16
	mov	r2, #80
	mov	r3, #512
	mov	fp, #520
	mov	r10, #528
	mov	r9, #768
	mov	r8, #776
	mov	r7, #784
	mov	r6, #416
	mov	lr, #424
	ldr	r0, .L85+52
	add	ip, r4, #816
	strh	r1, [ip]	@ movhi
	strh	r0, [ip, #2]	@ movhi
	add	ip, r4, #840
	strh	r2, [ip]	@ movhi
	strh	r0, [ip, #2]	@ movhi
	add	ip, r4, #820
	strh	r3, [ip]	@ movhi
	add	r0, r0, #64
	add	ip, r4, #824
	strh	r1, [ip]	@ movhi
	strh	r0, [ip, #2]	@ movhi
	add	ip, r4, #832
	strh	r1, [ip]	@ movhi
	ldr	r1, .L85+56
	strh	r1, [ip, #2]	@ movhi
	add	ip, r4, #848
	strh	r0, [ip, #2]	@ movhi
	add	r0, r4, #856
	strh	r2, [ip]	@ movhi
	strh	r2, [r0]	@ movhi
	add	r2, r4, #828
	strh	fp, [r2]	@ movhi
	add	r2, r4, #836
	strh	r10, [r2]	@ movhi
	add	r2, r4, #844
	strh	r9, [r2]	@ movhi
	add	r2, r4, #852
	strh	r8, [r2]	@ movhi
	add	r2, r4, #860
	strh	r7, [r2]	@ movhi
	ldr	r2, .L85+60
	strh	r1, [r0, #2]	@ movhi
	add	r1, r4, #864
	strh	r2, [r1, #2]	@ movhi
	ldr	r2, .L85+64
	ldr	r0, .L85+68
	strh	r2, [r1]	@ movhi
	add	r1, r4, #868
	strh	r6, [r1]	@ movhi
	add	r1, r4, #872
	strh	r0, [r1, #2]	@ movhi
	add	r0, r4, #876
	strh	lr, [r0]	@ movhi
	mov	lr, #432	@ movhi
	ldr	ip, .L85+72
	strh	r2, [r1]	@ movhi
	add	r1, r4, #880
	strh	ip, [r1, #2]	@ movhi
	add	ip, r4, #884
	strh	r2, [r1]	@ movhi
	strh	lr, [ip]	@ movhi
	mov	r1, r4
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r5
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L86:
	.align	2
.L85:
	.word	hideSprites
	.word	state
	.word	DMANow
	.word	coral_bgPal
	.word	coral_bgTiles
	.word	100726784
	.word	coral_bgMap
	.word	83886592
	.word	upgrade_menu_ssPal
	.word	100728832
	.word	upgrade_menu_ssTiles
	.word	shadowOAM
	.word	16386
	.word	-16360
	.word	-16232
	.word	-16304
	.word	16528
	.word	-16240
	.word	-16176
	.size	goUpgradeMenu, .-goUpgradeMenu
	.comm	cheatUsed,4,4
	.global	energyUpgradeCosts
	.global	agilityUpgradeCosts
	.global	shieldUpgradeCosts
	.comm	player,72,4
	.comm	shadowOAM,1024,4
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
	.type	shieldUpgradeCosts, %object
	.size	shieldUpgradeCosts, 24
shieldUpgradeCosts:
	.word	50
	.word	100
	.word	250
	.word	500
	.word	1000
	.word	9999
	.type	energyUpgradeCosts, %object
	.size	energyUpgradeCosts, 24
energyUpgradeCosts:
	.word	5
	.word	50
	.word	100
	.word	250
	.word	500
	.word	9999
	.type	agilityUpgradeCosts, %object
	.size	agilityUpgradeCosts, 24
agilityUpgradeCosts:
	.word	10
	.word	25
	.word	50
	.word	100
	.word	250
	.word	9999
	.ident	"GCC: (devkitARM release 53) 9.1.0"
