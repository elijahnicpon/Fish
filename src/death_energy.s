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
	.file	"death_energy.c"
	.text
	.align	2
	.global	doDeathEnergy
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	doDeathEnergy, %function
doDeathEnergy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L9
	ldrh	r3, [r3]
	tst	r3, #8
	push	{r4, lr}
	beq	.L2
	ldr	r3, .L9+4
	ldrh	r3, [r3]
	tst	r3, #8
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
	.word	goUpgradeMenu
	.size	doDeathEnergy, .-doDeathEnergy
	.align	2
	.global	goDeathEnergy
	.syntax unified
	.arm
	.fpu softvfp
	.type	goDeathEnergy, %function
goDeathEnergy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r3, .L13
	mov	lr, pc
	bx	r3
	mov	ip, #9
	mov	r1, #67108864
	mov	r0, #7936
	ldr	r2, .L13+4
	ldr	r4, .L13+8
	str	ip, [r2]
	mov	r3, #256
	strh	r0, [r1, #8]	@ movhi
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L13+12
	mov	lr, pc
	bx	r4
	mov	r3, #3920
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L13+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L13+20
	ldr	r1, .L13+24
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L13+28
	ldr	r1, .L13+32
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L13+36
	ldr	r1, .L13+40
	mov	lr, pc
	bx	r4
	mov	ip, #784
	mov	r0, #16
	mov	r2, #80
	mov	lr, #432
	mov	r3, #512
	mov	r10, #520
	mov	r9, #528
	mov	r8, #768
	mov	r7, #776
	mov	r6, #416
	mov	r5, #424
	ldr	r1, .L13+44
	strh	ip, [r1, #60]	@ movhi
	ldr	ip, .L13+48
	strh	r0, [r1, #16]	@ movhi
	strh	ip, [r1, #66]	@ movhi
	strh	r0, [r1, #24]	@ movhi
	strh	r0, [r1, #32]	@ movhi
	add	ip, ip, #64
	ldr	r0, .L13+52
	strh	ip, [r1, #74]	@ movhi
	add	ip, ip, #64
	strh	ip, [r1, #82]	@ movhi
	strh	r0, [r1, #26]	@ movhi
	sub	ip, ip, #184
	strh	r0, [r1, #50]	@ movhi
	ldr	r0, .L13+56
	strh	ip, [r1, #18]	@ movhi
	strh	ip, [r1, #42]	@ movhi
	add	ip, ip, #128
	strh	r10, [r1, #28]	@ movhi
	strh	r9, [r1, #36]	@ movhi
	strh	r8, [r1, #44]	@ movhi
	strh	r7, [r1, #52]	@ movhi
	strh	r6, [r1, #68]	@ movhi
	strh	r5, [r1, #76]	@ movhi
	strh	lr, [r1, #84]	@ movhi
	strh	r2, [r1, #40]	@ movhi
	strh	r2, [r1, #48]	@ movhi
	strh	r2, [r1, #56]	@ movhi
	strh	r0, [r1, #64]	@ movhi
	strh	r0, [r1, #72]	@ movhi
	strh	r0, [r1, #80]	@ movhi
	mov	r2, #117440512
	mov	r0, #3
	strh	r3, [r1, #20]	@ movhi
	strh	ip, [r1, #34]	@ movhi
	strh	ip, [r1, #58]	@ movhi
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
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
	.word	death_energy_ssPal
	.word	100728832
	.word	death_energy_ssTiles
	.word	shadowOAM
	.word	-16304
	.word	-16296
	.word	16528
	.size	goDeathEnergy, .-goDeathEnergy
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
