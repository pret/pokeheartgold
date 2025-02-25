	.include "asm/macros.inc"
	.include "MSL_Common_strtoul.inc"
	.include "global.inc"

	.text

	arm_func_start __strtoul
__strtoul: ; 0x020EAE78
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	ldr r4, [sp, #0x38]
	movs sb, r0
	ldr r0, [sp, #0x34]
	str r4, [sp, #0x38]
	mov r4, #0
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x38]
	str r1, [sp]
	str r4, [r0]
	mov r0, r4
	str r0, [sp, #4]
	ldr r0, [sp, #0x34]
	mov r1, r4
	str r1, [r0]
	ldr r0, [sp, #0x30]
	str r4, [sp, #8]
	mov r8, r2
	mov r7, r3
	mov r5, r4
	mov sl, r4
	str r0, [sp, #0x30]
	mov r4, #1
	bmi _020EAEF8
	cmp sb, #1
	beq _020EAEF8
	cmp sb, #0x24
	bgt _020EAEF8
	ldr r0, [sp]
	cmp r0, #1
	bge _020EAF00
_020EAEF8:
	mov r4, #0x40
	b _020EAF1C
_020EAF00:
	ldr r1, [sp, #8]
	mov r0, r7
	mov r3, r1
	mov r2, r1
	add r5, r3, #1
	blx r8
	mov r6, r0
_020EAF1C:
	cmp sb, #0
	beq _020EAF34
	mov r1, sb
	mvn r0, #0
	bl _u32_div_f
	str r0, [sp, #4]
_020EAF34:
	mvn fp, #0
	b _020EB1F4
_020EAF3C:
	cmp r4, #8
	bgt _020EAF74
	cmp r4, #0
	addge pc, pc, r4, lsl #2
	b _020EB1F4
_020EAF50: ; jump table
	b _020EB1F4 ; case 0
	b _020EAF80 ; case 1
	b _020EB02C ; case 2
	b _020EB1F4 ; case 3
	b _020EB068 ; case 4
	b _020EB1F4 ; case 5
	b _020EB1F4 ; case 6
	b _020EB1F4 ; case 7
	b _020EB0A8 ; case 8
_020EAF74:
	cmp r4, #0x10
	beq _020EB0A8
	b _020EB1F4
_020EAF80:
	cmp r6, #0
	blt _020EAF90
	cmp r6, #0x80
	blt _020EAF98
_020EAF90:
	mov r0, #0
	b _020EAFA8
_020EAF98:
	ldr r0, _020EB258 ; =__msl_digit
	mov r1, r6, lsl #1
	ldrh r0, [r0, r1]
	and r0, r0, #0x100
_020EAFA8:
	cmp r0, #0
	beq _020EAFD4
	mov r1, #0
	mov r0, r7
	mov r2, r1
	blx r8
	mov r6, r0
	ldr r0, [sp, #8]
	add r0, r0, #1
	str r0, [sp, #8]
	b _020EB1F4
_020EAFD4:
	cmp r6, #0x2b
	bne _020EAFF8
	mov r1, #0
	mov r0, r7
	mov r2, r1
	add r5, r5, #1
	blx r8
	mov r6, r0
	b _020EB024
_020EAFF8:
	cmp r6, #0x2d
	bne _020EB024
	mov r1, #0
	mov r0, r7
	mov r2, r1
	add r5, r5, #1
	blx r8
	mov r6, r0
	ldr r0, [sp, #0x34]
	mov r1, #1
	str r1, [r0]
_020EB024:
	mov r4, #2
	b _020EB1F4
_020EB02C:
	cmp sb, #0
	cmpne sb, #0x10
	bne _020EB060
	cmp r6, #0x30
	bne _020EB060
	mov r1, #0
	mov r0, r7
	mov r2, r1
	mov r4, #4
	add r5, r5, #1
	blx r8
	mov r6, r0
	b _020EB1F4
_020EB060:
	mov r4, #8
	b _020EB1F4
_020EB068:
	cmp r6, #0x58
	cmpne r6, #0x78
	bne _020EB098
	mov r1, #0
	mov r0, r7
	mov r2, r1
	mov sb, #0x10
	mov r4, #8
	add r5, r5, #1
	blx r8
	mov r6, r0
	b _020EB1F4
_020EB098:
	cmp sb, #0
	moveq sb, #8
	mov r4, #0x10
	b _020EB1F4
_020EB0A8:
	ldr r0, [sp, #4]
	cmp sb, #0
	moveq sb, #0xa
	cmp r0, #0
	bne _020EB0CC
	mov r0, fp
	mov r1, sb
	bl _u32_div_f
	str r0, [sp, #4]
_020EB0CC:
	cmp r6, #0
	blt _020EB0DC
	cmp r6, #0x80
	blt _020EB0E4
_020EB0DC:
	mov r0, #0
	b _020EB0F4
_020EB0E4:
	ldr r0, _020EB258 ; =__msl_digit
	mov r1, r6, lsl #1
	ldrh r0, [r0, r1]
	and r0, r0, #8
_020EB0F4:
	cmp r0, #0
	beq _020EB11C
	sub r6, r6, #0x30
	cmp r6, sb
	blt _020EB1A4
	cmp r4, #0x10
	moveq r4, #0x20
	movne r4, #0x40
	add r6, r6, #0x30
	b _020EB1F4
_020EB11C:
	cmp r6, #0
	blt _020EB12C
	cmp r6, #0x80
	blt _020EB134
_020EB12C:
	mov r0, #0
	b _020EB144
_020EB134:
	ldr r0, _020EB258 ; =__msl_digit
	mov r1, r6, lsl #1
	ldrh r0, [r0, r1]
	and r0, r0, #1
_020EB144:
	cmp r0, #0
	beq _020EB178
	cmp r6, #0
	blt _020EB15C
	cmp r6, #0x80
	blt _020EB164
_020EB15C:
	mov r0, r6
	b _020EB16C
_020EB164:
	ldr r0, _020EB25C ; =__upper_mapC
	ldrb r0, [r0, r6]
_020EB16C:
	sub r0, r0, #0x37
	cmp r0, sb
	blt _020EB188
_020EB178:
	cmp r4, #0x10
	moveq r4, #0x20
	movne r4, #0x40
	b _020EB1F4
_020EB188:
	cmp r6, #0
	blt _020EB1A0
	cmp r6, #0x80
	bge _020EB1A0
	ldr r0, _020EB25C ; =__upper_mapC
	ldrb r6, [r0, r6]
_020EB1A0:
	sub r6, r6, #0x37
_020EB1A4:
	ldr r0, [sp, #4]
	mov r4, #0x10
	cmp sl, r0
	ldrhi r0, [sp, #0x38]
	movhi r1, #1
	strhi r1, [r0]
	mul r0, sl, sb
	mov sl, r0
	sub r0, fp, r0
	cmp r6, r0
	ldrhi r0, [sp, #0x38]
	movhi r1, #1
	strhi r1, [r0]
	mov r1, #0
	mov r0, r7
	mov r2, r1
	add sl, sl, r6
	add r5, r5, #1
	blx r8
	mov r6, r0
_020EB1F4:
	ldr r0, [sp]
	cmp r5, r0
	bgt _020EB210
	cmp r6, fp
	beq _020EB210
	tst r4, #0x60
	beq _020EAF3C
_020EB210:
	tst r4, #0x34
	bne _020EB228
	ldr r0, [sp, #0x30]
	mov sl, #0
	str sl, [r0]
	b _020EB23C
_020EB228:
	ldr r0, [sp, #8]
	sub r1, r5, #1
	add r1, r1, r0
	ldr r0, [sp, #0x30]
	str r1, [r0]
_020EB23C:
	mov r0, r7
	mov r1, r6
	mov r2, #1
	blx r8
	mov r0, sl
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020EB258: .word __msl_digit
_020EB25C: .word __upper_mapC
	arm_func_end __strtoul

	arm_func_start __strtoull
__strtoull: ; 0x020EB260
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x20
	ldr r4, [sp, #0x48]
	movs sb, r0
	ldr r0, [sp, #0x44]
	str r4, [sp, #0x48]
	mov r4, #0
	str r0, [sp, #0x44]
	ldr r0, [sp, #0x48]
	str r1, [sp]
	str r4, [r0]
	mov r0, r4
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x44]
	mov r1, r4
	str r1, [r0]
	ldr r0, [sp, #0x40]
	str r4, [sp, #0x18]
	mov sl, r2
	str r3, [sp, #4]
	mov r6, r4
	mov r7, r4
	str r0, [sp, #0x40]
	mov r5, #1
	bmi _020EB2E8
	cmp sb, #1
	beq _020EB2E8
	cmp sb, #0x24
	bgt _020EB2E8
	ldr r0, [sp]
	cmp r0, #1
	bge _020EB2F0
_020EB2E8:
	mov r5, #0x40
	b _020EB304
_020EB2F0:
	mov r0, r3
	mov r2, r4
	add r6, r1, #1
	blx sl
	mov r8, r0
_020EB304:
	cmp sb, #0
	beq _020EB328
	mvn r0, #0
	mov r1, r0
	mov r3, sb, asr #0x1f
	mov r2, sb
	bl _ll_udiv
	mov r7, r0
	str r1, [sp, #0xc]
_020EB328:
	mvn r0, #0
	str r0, [sp, #0x1c]
	mov r4, #0
	b _020EB650
_020EB338:
	cmp r5, #8
	bgt _020EB370
	cmp r5, #0
	addge pc, pc, r5, lsl #2
	b _020EB650
_020EB34C: ; jump table
	b _020EB650 ; case 0
	b _020EB37C ; case 1
	b _020EB428 ; case 2
	b _020EB650 ; case 3
	b _020EB464 ; case 4
	b _020EB650 ; case 5
	b _020EB650 ; case 6
	b _020EB650 ; case 7
	b _020EB4A4 ; case 8
_020EB370:
	cmp r5, #0x10
	beq _020EB4A4
	b _020EB650
_020EB37C:
	cmp r8, #0
	blt _020EB38C
	cmp r8, #0x80
	blt _020EB394
_020EB38C:
	mov r0, #0
	b _020EB3A4
_020EB394:
	ldr r0, _020EB6C4 ; =__msl_digit
	mov r1, r8, lsl #1
	ldrh r0, [r0, r1]
	and r0, r0, #0x100
_020EB3A4:
	cmp r0, #0
	beq _020EB3D0
	mov r1, #0
	ldr r0, [sp, #4]
	mov r2, r1
	blx sl
	mov r8, r0
	ldr r0, [sp, #0x18]
	add r0, r0, #1
	str r0, [sp, #0x18]
	b _020EB650
_020EB3D0:
	cmp r8, #0x2b
	bne _020EB3F4
	mov r1, #0
	ldr r0, [sp, #4]
	mov r2, r1
	add r6, r6, #1
	blx sl
	mov r8, r0
	b _020EB420
_020EB3F4:
	cmp r8, #0x2d
	bne _020EB420
	mov r1, #0
	ldr r0, [sp, #4]
	mov r2, r1
	add r6, r6, #1
	blx sl
	mov r8, r0
	ldr r0, [sp, #0x44]
	mov r1, #1
	str r1, [r0]
_020EB420:
	mov r5, #2
	b _020EB650
_020EB428:
	cmp sb, #0
	cmpne sb, #0x10
	bne _020EB45C
	cmp r8, #0x30
	bne _020EB45C
	mov r1, #0
	ldr r0, [sp, #4]
	mov r2, r1
	mov r5, #4
	add r6, r6, #1
	blx sl
	mov r8, r0
	b _020EB650
_020EB45C:
	mov r5, #8
	b _020EB650
_020EB464:
	cmp r8, #0x58
	cmpne r8, #0x78
	bne _020EB494
	mov r1, #0
	ldr r0, [sp, #4]
	mov r2, r1
	mov sb, #0x10
	mov r5, #8
	add r6, r6, #1
	blx sl
	mov r8, r0
	b _020EB650
_020EB494:
	cmp sb, #0
	moveq sb, #8
	mov r5, #0x10
	b _020EB650
_020EB4A4:
	ldr r1, [sp, #0xc]
	mov r0, #0
	cmp sb, #0
	moveq sb, #0xa
	cmp r1, r0
	cmpeq r7, r4
	bne _020EB4DC
	ldr r0, [sp, #0x1c]
	mov r3, sb, asr #0x1f
	mov r1, r0
	mov r2, sb
	bl _ll_udiv
	mov r7, r0
	str r1, [sp, #0xc]
_020EB4DC:
	cmp r8, #0
	blt _020EB4EC
	cmp r8, #0x80
	blt _020EB4F4
_020EB4EC:
	mov r0, #0
	b _020EB504
_020EB4F4:
	ldr r0, _020EB6C4 ; =__msl_digit
	mov r1, r8, lsl #1
	ldrh r0, [r0, r1]
	and r0, r0, #8
_020EB504:
	cmp r0, #0
	beq _020EB52C
	sub r8, r8, #0x30
	cmp r8, sb
	blt _020EB5B4
	cmp r5, #0x10
	moveq r5, #0x20
	movne r5, #0x40
	add r8, r8, #0x30
	b _020EB650
_020EB52C:
	cmp r8, #0
	blt _020EB53C
	cmp r8, #0x80
	blt _020EB544
_020EB53C:
	mov r0, #0
	b _020EB554
_020EB544:
	ldr r0, _020EB6C4 ; =__msl_digit
	mov r1, r8, lsl #1
	ldrh r0, [r0, r1]
	and r0, r0, #1
_020EB554:
	cmp r0, #0
	beq _020EB588
	cmp r8, #0
	blt _020EB56C
	cmp r8, #0x80
	blt _020EB574
_020EB56C:
	mov r0, r8
	b _020EB57C
_020EB574:
	ldr r0, _020EB6C8 ; =__upper_mapC
	ldrb r0, [r0, r8]
_020EB57C:
	sub r0, r0, #0x37
	cmp r0, sb
	blt _020EB598
_020EB588:
	cmp r5, #0x10
	moveq r5, #0x20
	movne r5, #0x40
	b _020EB650
_020EB598:
	cmp r8, #0
	blt _020EB5B0
	cmp r8, #0x80
	bge _020EB5B0
	ldr r0, _020EB6C8 ; =__upper_mapC
	ldrb r8, [r0, r8]
_020EB5B0:
	sub r8, r8, #0x37
_020EB5B4:
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0xc]
	ldr r3, [sp, #0x10]
	cmp r1, r0
	ldr r0, [sp, #0x10]
	mov r5, sb, asr #0x1f
	cmpeq r0, r7
	ldrhi r0, [sp, #0x48]
	movhi r1, #1
	strhi r1, [r0]
	umull r0, r1, r3, sb
	mla r1, r3, r5, r1
	ldr r3, [sp, #0x14]
	str r0, [sp, #0x10]
	mla r1, r3, sb, r1
	ldr r3, [sp, #0x1c]
	mov r2, r8, asr #0x1f
	subs r3, r3, r0
	ldr r0, [sp, #0x1c]
	str r1, [sp, #0x14]
	sbc r0, r0, r1
	cmp r2, r0
	cmpeq r8, r3
	ldrhi r0, [sp, #0x48]
	movhi r1, #1
	strhi r1, [r0]
	ldr r0, [sp, #0x10]
	mov r1, #0
	adds r0, r0, r8
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	mov r5, #0x10
	adc r0, r0, r2
	str r0, [sp, #0x14]
	ldr r0, [sp, #4]
	mov r2, r1
	add r6, r6, #1
	blx sl
	mov r8, r0
_020EB650:
	ldr r0, [sp]
	cmp r6, r0
	bgt _020EB670
	ldr r0, [sp, #0x1c]
	cmp r8, r0
	beq _020EB670
	tst r5, #0x60
	beq _020EB338
_020EB670:
	tst r5, #0x34
	bne _020EB690
	mov r0, #0
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	mov r1, r0
	ldr r0, [sp, #0x40]
	b _020EB6A0
_020EB690:
	ldr r0, [sp, #0x18]
	sub r1, r6, #1
	add r1, r1, r0
	ldr r0, [sp, #0x40]
_020EB6A0:
	str r1, [r0]
	ldr r0, [sp, #4]
	mov r1, r8
	mov r2, #1
	blx sl
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	add sp, sp, #0x20
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020EB6C4: .word __msl_digit
_020EB6C8: .word __upper_mapC
	arm_func_end __strtoull

	arm_func_start strtoul
strtoul: ; 0x020EB6CC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x20
	mov r5, r0
	mov lr, #0
	mov r0, r2
	mov r4, r1
	add r2, sp, #0x1c
	str r5, [sp, #0xc]
	str lr, [sp, #0x10]
	str r2, [sp]
	add r1, sp, #0x18
	str r1, [sp, #4]
	add ip, sp, #0x14
	ldr r2, _020EB75C ; =__StringRead
	add r3, sp, #0xc
	sub r1, lr, #0x80000001
	str ip, [sp, #8]
	bl __strtoul
	cmp r4, #0
	ldrne r1, [sp, #0x1c]
	addne r1, r5, r1
	strne r1, [r4]
	ldr r1, [sp, #0x14]
	cmp r1, #0
	beq _020EB748
	ldr r0, _020EB760 ; =errno
	mov r1, #0x22
	str r1, [r0]
	add sp, sp, #0x20
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_020EB748:
	ldr r1, [sp, #0x18]
	cmp r1, #0
	rsbne r0, r0, #0
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020EB75C: .word __StringRead
_020EB760: .word errno
	arm_func_end strtoul

	arm_func_start strtol
strtol: ; 0x020EB764
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x20
	mov r5, r0
	mov lr, #0
	mov r0, r2
	mov r4, r1
	add r2, sp, #0x1c
	str r5, [sp, #0xc]
	str lr, [sp, #0x10]
	str r2, [sp]
	add r1, sp, #0x18
	str r1, [sp, #4]
	add ip, sp, #0x14
	ldr r2, _020EB824 ; =__StringRead
	add r3, sp, #0xc
	sub r1, lr, #0x80000001
	str ip, [sp, #8]
	bl __strtoul
	cmp r4, #0
	ldrne r1, [sp, #0x1c]
	addne r1, r5, r1
	strne r1, [r4]
	ldr r1, [sp, #0x14]
	cmp r1, #0
	bne _020EB7F0
	ldr r2, [sp, #0x18]
	cmp r2, #0
	bne _020EB7E0
	mvn r1, #0x80000000
	cmp r0, r1
	bhi _020EB7F0
_020EB7E0:
	cmp r2, #0
	beq _020EB814
	cmp r0, #0x80000000
	bls _020EB814
_020EB7F0:
	ldr r0, [sp, #0x18]
	ldr r1, _020EB828 ; =errno
	mov r2, #0x22
	cmp r0, #0
	movne r0, #0x80000000
	str r2, [r1]
	add sp, sp, #0x20
	mvneq r0, #0x80000000
	ldmia sp!, {r3, r4, r5, pc}
_020EB814:
	cmp r2, #0
	rsbne r0, r0, #0
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020EB824: .word __StringRead
_020EB828: .word errno
	arm_func_end strtol

	arm_func_start atol
atol: ; 0x020EB82C
	ldr ip, _020EB83C ; =strtol
	mov r1, #0
	mov r2, #0xa
	bx ip
	.align 2, 0
_020EB83C: .word strtol
	arm_func_end atol

	exception __strtoul, 0x03E9, 0x0060FF00
	exception __strtoull, 0x046D, 0x00807F00
	exception strtoul, 0x0099, 0x00600300
	exception strtol, 0x00C9, 0x00600300
	exception atol, 0x0015, 0x00000000
