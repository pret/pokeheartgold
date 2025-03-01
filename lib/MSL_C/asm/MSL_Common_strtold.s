	.include "asm/macros.inc"
	.include "MSL_Common_strtold.inc"
	.include "global.inc"

	.rodata

model$4434: ; 0x0210E62C
	.asciz "NAN("
	.size model$4434,.-model$4434

model$4439: ; 0x0210E631
	.asciz "INFINITY"
	.size model$4439,.-model$4439

	.text

	arm_func_start __strtold
__strtold: ; 0x020E9B3C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xa8
	ldr r4, [sp, #0xd0]
	mov sl, #0
	str r4, [sp, #0xd0]
	str r0, [sp]
	add r6, sp, #0x80
	mov sb, r1
	mov r8, r2
	str r3, [sp, #4]
	mov r4, sl
	str sl, [sp, #0x2c]
	mov r5, #1
	mov r0, #4
_020E9B74:
	strh sl, [r6]
	strh sl, [r6, #2]
	strh sl, [r6, #4]
	strh sl, [r6, #6]
	add r6, r6, #8
	subs r0, r0, #1
	bne _020E9B74
	mov r0, #0
	str r0, [sp, #0x28]
	strh sl, [r6]
	strh sl, [r6, #2]
	ldr r2, [sp, #0x28]
	ldr r1, [sp, #0xd0]
	strh sl, [r6, #4]
	str r2, [r1]
	mov r1, r2
	mov r0, r8
	str r1, [sp, #0x24]
	str r1, [sp, #0x20]
	str r1, [sp, #0x1c]
	str r1, [sp, #0x18]
	str r1, [sp, #0x10]
	str r1, [sp, #0xc]
	str r1, [sp, #8]
	add r4, r4, #1
	blx sb
	mov r1, r0
	ldr r7, _020EAB1C ; =model$4439
	add r0, sp, #0x4d
	mov r6, #4
_020E9BEC:
	ldrb r3, [r7]
	ldrb r2, [r7, #1]
	add r7, r7, #2
	strb r3, [r0]
	strb r2, [r0, #1]
	add r0, r0, #2
	subs r6, r6, #1
	bne _020E9BEC
	ldrb r3, [r7]
	ldr r2, _020EAB20 ; =model$4434
	strb r3, [r0]
	ldrb r3, [r2, #1]
	ldrb r0, [r2, #2]
	ldrb r6, [r2]
	strb r3, [sp, #0x31]
	strb r0, [sp, #0x32]
	ldrb r3, [r2, #3]
	ldrb r0, [r2, #4]
	strb r6, [sp, #0x30]
	strb r3, [sp, #0x33]
	strb r0, [sp, #0x34]
	b _020EA930
_020E9C44:
	cmp r5, #0x100
	bgt _020E9CBC
	bge _020EA3C4
	cmp r5, #0x20
	bgt _020E9CA0
	bge _020EA298
	cmp r5, #8
	bgt _020E9C94
	cmp r5, #0
	addge pc, pc, r5, lsl #2
	b _020EA930
_020E9C70: ; jump table
	b _020EA930 ; case 0
	b _020E9D00 ; case 1
	b _020EA0E4 ; case 2
	b _020EA930 ; case 3
	b _020EA194 ; case 4
	b _020EA930 ; case 5
	b _020EA930 ; case 6
	b _020EA930 ; case 7
	b _020EA1BC ; case 8
_020E9C94:
	cmp r5, #0x10
	beq _020EA260
	b _020EA930
_020E9CA0:
	cmp r5, #0x40
	bgt _020E9CB0
	beq _020EA324
	b _020EA930
_020E9CB0:
	cmp r5, #0x80
	beq _020EA370
	b _020EA930
_020E9CBC:
	cmp r5, #0x2000
	bgt _020E9CE4
	bge _020E9F18
	cmp r5, #0x200
	bgt _020E9CD8
	beq _020EA424
	b _020EA930
_020E9CD8:
	cmp r5, #0x400
	beq _020EA44C
	b _020EA930
_020E9CE4:
	cmp r5, #0x4000
	bgt _020E9CF4
	beq _020E9E20
	b _020EA930
_020E9CF4:
	cmp r5, #0x8000
	beq _020EA4C4
	b _020EA930
_020E9D00:
	cmp r1, #0
	blt _020E9D10
	cmp r1, #0x80
	blt _020E9D18
_020E9D10:
	mov r0, #0
	b _020E9D28
_020E9D18:
	mov r2, r1, lsl #1
	ldr r0, _020EAB24 ; =__msl_digit
	ldrh r0, [r0, r2]
	and r0, r0, #0x100
_020E9D28:
	cmp r0, #0
	beq _020E9D54
	mov r1, #0
	mov r0, r8
	mov r2, r1
	blx sb
	mov r1, r0
	ldr r0, [sp, #0x2c]
	add r0, r0, #1
	str r0, [sp, #0x2c]
	b _020EA930
_020E9D54:
	cmp r1, #0
	blt _020E9D64
	cmp r1, #0x80
	blt _020E9D6C
_020E9D64:
	mov r0, r1
	b _020E9D74
_020E9D6C:
	ldr r0, _020EAB28 ; =__upper_mapC
	ldrb r0, [r0, r1]
_020E9D74:
	cmp r0, #0x49
	bgt _020E9DA0
	bge _020E9DD8
	cmp r0, #0x2d
	bgt _020E9E18
	cmp r0, #0x2b
	blt _020E9E18
	beq _020E9DB4
	cmp r0, #0x2d
	beq _020E9DAC
	b _020E9E18
_020E9DA0:
	cmp r0, #0x4e
	beq _020E9DF8
	b _020E9E18
_020E9DAC:
	mov r0, #1
	str r0, [sp, #0x28]
_020E9DB4:
	mov r1, #0
	mov r0, r8
	mov r2, r1
	add r4, r4, #1
	blx sb
	mov r1, r0
	mov r0, #1
	str r0, [sp, #0x18]
	b _020EA930
_020E9DD8:
	add r4, r4, #1
	mov r0, r8
	mov r1, #0
	mov r2, r1
	blx sb
	mov r1, r0
	mov r5, #0x4000
	b _020EA930
_020E9DF8:
	add r4, r4, #1
	mov r0, r8
	mov r1, #0
	mov r2, r1
	blx sb
	mov r1, r0
	mov r5, #0x2000
	b _020EA930
_020E9E18:
	mov r5, #2
	b _020EA930
_020E9E20:
	mov r5, #1
	add r7, sp, #0x4d
	add r0, sp, #0x76
	mov r6, #4
_020E9E30:
	ldrb r3, [r7]
	ldrb r2, [r7, #1]
	add r7, r7, #2
	strb r3, [r0]
	strb r2, [r0, #1]
	add r0, r0, #2
	subs r6, r6, #1
	bne _020E9E30
	ldrb r2, [r7]
	add r6, sp, #0x77
	ldr r7, _020EAB28 ; =__upper_mapC
	strb r2, [r0]
	b _020E9E84
_020E9E64:
	mov r1, #0
	mov r0, r8
	mov r2, r1
	add r6, r6, #1
	add r5, r5, #1
	add r4, r4, #1
	blx sb
	mov r1, r0
_020E9E84:
	cmp r5, #8
	bge _020E9EB4
	cmp r1, #0
	blt _020E9E9C
	cmp r1, #0x80
	blt _020E9EA4
_020E9E9C:
	mov r2, r1
	b _020E9EA8
_020E9EA4:
	ldrb r2, [r7, r1]
_020E9EA8:
	ldrsb r0, [r6]
	cmp r0, r2
	beq _020E9E64
_020E9EB4:
	cmp r5, #3
	cmpne r5, #8
	bne _020E9F10
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _020E9EE4
	ldr r1, _020EAB2C ; =__float_huge
	mov r0, #0
	ldr r1, [r1]
	bl _fsub
	bl _f2d
	b _020E9EF0
_020E9EE4:
	ldr r0, _020EAB2C ; =__float_huge
	ldr r0, [r0]
	bl _f2d
_020E9EF0:
	ldr r2, [sp, #0x2c]
	add r3, r2, r5
	ldr r2, [sp, #0x18]
	add r3, r2, r3
	ldr r2, [sp, #4]
	add sp, sp, #0xa8
	str r3, [r2]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020E9F10:
	mov r5, #0x1000
	b _020EA930
_020E9F18:
	ldrb r3, [sp, #0x30]
	ldrb r0, [sp, #0x32]
	ldrb r2, [sp, #0x31]
	strb r3, [sp, #0x40]
	strb r0, [sp, #0x42]
	ldrb r3, [sp, #0x33]
	ldrb r0, [sp, #0x34]
	strb r2, [sp, #0x41]
	mov r5, #1
	strb r0, [sp, #0x44]
	mov r6, #0
	add r2, sp, #0x56
	strb r3, [sp, #0x43]
	mov r0, #8
_020E9F50:
	strb r6, [r2]
	strb r6, [r2, #1]
	strb r6, [r2, #2]
	strb r6, [r2, #3]
	add r2, r2, #4
	subs r0, r0, #1
	bne _020E9F50
	add r7, sp, #0x41
	b _020E9F94
_020E9F74:
	mov r1, #0
	mov r0, r8
	mov r2, r1
	add r7, r7, #1
	add r5, r5, #1
	add r4, r4, #1
	blx sb
	mov r1, r0
_020E9F94:
	cmp r5, #4
	bge _020E9FC8
	cmp r1, #0
	blt _020E9FAC
	cmp r1, #0x80
	blt _020E9FB4
_020E9FAC:
	mov r2, r1
	b _020E9FBC
_020E9FB4:
	ldr r0, _020EAB28 ; =__upper_mapC
	ldrb r2, [r0, r1]
_020E9FBC:
	ldrsb r0, [r7]
	cmp r0, r2
	beq _020E9F74
_020E9FC8:
	sub r0, r5, #3
	cmp r0, #1
	bhi _020EA0DC
	cmp r5, #4
	bne _020EA080
	ldr r7, _020EAB24 ; =__msl_digit
	b _020EA008
_020E9FE4:
	add r0, sp, #0x56
	strb r1, [r0, r6]
	mov r1, #0
	mov r0, r8
	mov r2, r1
	add r6, r6, #1
	add r4, r4, #1
	blx sb
	mov r1, r0
_020EA008:
	cmp r6, #0x20
	bge _020EA070
	cmp r1, #0
	blt _020EA020
	cmp r1, #0x80
	blt _020EA028
_020EA020:
	mov r0, #0
	b _020EA034
_020EA028:
	mov r0, r1, lsl #1
	ldrh r0, [r7, r0]
	and r0, r0, #8
_020EA034:
	cmp r0, #0
	bne _020E9FE4
	cmp r1, #0
	blt _020EA04C
	cmp r1, #0x80
	blt _020EA054
_020EA04C:
	mov r0, #0
	b _020EA060
_020EA054:
	mov r0, r1, lsl #1
	ldrh r0, [r7, r0]
	and r0, r0, #1
_020EA060:
	cmp r0, #0
	bne _020E9FE4
	cmp r1, #0x2e
	beq _020E9FE4
_020EA070:
	cmp r1, #0x29
	movne r5, #0x1000
	bne _020EA930
	add r6, r6, #1
_020EA080:
	add r0, sp, #0x56
	mov r1, #0
	strb r1, [r0, r6]
	ldr r1, [sp, #0x28]
	cmp r1, #0
	beq _020EA0B4
	bl nan
	mov r2, r0
	mov r0, #0
	mov r3, r1
	mov r1, r0
	bl _dsub
	b _020EA0B8
_020EA0B4:
	bl nan
_020EA0B8:
	ldr r2, [sp, #0x2c]
	add r2, r2, r5
	add r3, r6, r2
	ldr r2, [sp, #0x18]
	add r3, r2, r3
	ldr r2, [sp, #4]
	add sp, sp, #0xa8
	str r3, [r2]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020EA0DC:
	mov r5, #0x1000
	b _020EA930
_020EA0E4:
	cmp r1, #0x2e
	bne _020EA10C
	mov r5, #0x10
	add r4, r4, #1
	mov r0, r8
	mov r1, #0
	mov r2, r1
	blx sb
	mov r1, r0
	b _020EA930
_020EA10C:
	cmp r1, #0
	blt _020EA11C
	cmp r1, #0x80
	blt _020EA124
_020EA11C:
	mov r0, #0
	b _020EA134
_020EA124:
	mov r2, r1, lsl #1
	ldr r0, _020EAB24 ; =__msl_digit
	ldrh r0, [r0, r2]
	and r0, r0, #8
_020EA134:
	cmp r0, #0
	moveq r5, #0x1000
	beq _020EA930
	cmp r1, #0x30
	bne _020EA18C
	add r4, r4, #1
	mov r0, r8
	mov r1, #0
	mov r2, r1
	blx sb
	cmp r0, #0
	mov r1, r0
	blt _020EA178
	cmp r0, #0x80
	bge _020EA178
	ldr r2, _020EAB28 ; =__upper_mapC
	ldrb r0, [r2, r0]
_020EA178:
	cmp r0, #0x58
	moveq r5, #0x8000
	moveq sl, #1
	movne r5, #4
	b _020EA930
_020EA18C:
	mov r5, #8
	b _020EA930
_020EA194:
	cmp r1, #0x30
	movne r5, #8
	bne _020EA930
	mov r1, #0
	mov r0, r8
	mov r2, r1
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _020EA930
_020EA1BC:
	cmp r1, #0
	blt _020EA1CC
	cmp r1, #0x80
	blt _020EA1D4
_020EA1CC:
	mov r0, #0
	b _020EA1E4
_020EA1D4:
	mov r2, r1, lsl #1
	ldr r0, _020EAB24 ; =__msl_digit
	ldrh r0, [r0, r2]
	and r0, r0, #8
_020EA1E4:
	cmp r0, #0
	bne _020EA218
	cmp r1, #0x2e
	movne r5, #0x40
	bne _020EA930
	mov r1, #0
	mov r0, r8
	mov r2, r1
	mov r5, #0x20
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _020EA930
_020EA218:
	ldrb r2, [sp, #0x84]
	cmp r2, #0x14
	ldrhs r0, [sp, #0x1c]
	addhs r0, r0, #1
	strhs r0, [sp, #0x1c]
	bhs _020EA244
	add r0, r2, #1
	strb r0, [sp, #0x84]
	add r0, sp, #0x80
	add r0, r0, r2
	strb r1, [r0, #5]
_020EA244:
	add r4, r4, #1
	mov r0, r8
	mov r1, #0
	mov r2, r1
	blx sb
	mov r1, r0
	b _020EA930
_020EA260:
	cmp r1, #0
	blt _020EA270
	cmp r1, #0x80
	blt _020EA278
_020EA270:
	mov r0, #0
	b _020EA288
_020EA278:
	mov r2, r1, lsl #1
	ldr r0, _020EAB24 ; =__msl_digit
	ldrh r0, [r0, r2]
	and r0, r0, #8
_020EA288:
	cmp r0, #0
	moveq r5, #0x1000
	movne r5, #0x20
	b _020EA930
_020EA298:
	cmp r1, #0
	blt _020EA2A8
	cmp r1, #0x80
	blt _020EA2B0
_020EA2A8:
	mov r0, #0
	b _020EA2C0
_020EA2B0:
	mov r2, r1, lsl #1
	ldr r0, _020EAB24 ; =__msl_digit
	ldrh r0, [r0, r2]
	and r0, r0, #8
_020EA2C0:
	cmp r0, #0
	moveq r5, #0x40
	beq _020EA930
	ldrb r3, [sp, #0x84]
	cmp r3, #0x14
	bhs _020EA308
	cmp r1, #0x30
	cmpeq r3, #0
	beq _020EA2FC
	ldrb r2, [sp, #0x84]
	add r0, sp, #0x80
	add r0, r0, r3
	add r2, r2, #1
	strb r2, [sp, #0x84]
	strb r1, [r0, #5]
_020EA2FC:
	ldr r0, [sp, #0x1c]
	sub r0, r0, #1
	str r0, [sp, #0x1c]
_020EA308:
	add r4, r4, #1
	mov r0, r8
	mov r1, #0
	mov r2, r1
	blx sb
	mov r1, r0
	b _020EA930
_020EA324:
	cmp r1, #0
	blt _020EA334
	cmp r1, #0x80
	blt _020EA33C
_020EA334:
	mov r0, r1
	b _020EA344
_020EA33C:
	ldr r0, _020EAB28 ; =__upper_mapC
	ldrb r0, [r0, r1]
_020EA344:
	cmp r0, #0x45
	movne r5, #0x800
	bne _020EA930
	mov r1, #0
	mov r0, r8
	mov r2, r1
	mov r5, #0x80
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _020EA930
_020EA370:
	cmp r1, #0x2b
	bne _020EA394
	add r4, r4, #1
	mov r0, r8
	mov r1, #0
	mov r2, r1
	blx sb
	mov r1, r0
	b _020EA3BC
_020EA394:
	cmp r1, #0x2d
	bne _020EA3BC
	mov r1, #0
	mov r0, r8
	mov r2, r1
	add r4, r4, #1
	blx sb
	mov r1, r0
	mov r0, #1
	str r0, [sp, #0x24]
_020EA3BC:
	mov r5, #0x100
	b _020EA930
_020EA3C4:
	cmp r1, #0
	blt _020EA3D4
	cmp r1, #0x80
	blt _020EA3DC
_020EA3D4:
	mov r0, #0
	b _020EA3EC
_020EA3DC:
	mov r2, r1, lsl #1
	ldr r0, _020EAB24 ; =__msl_digit
	ldrh r0, [r0, r2]
	and r0, r0, #8
_020EA3EC:
	cmp r0, #0
	moveq r5, #0x1000
	beq _020EA930
	cmp r1, #0x30
	movne r5, #0x400
	bne _020EA930
	mov r1, #0
	mov r0, r8
	mov r2, r1
	mov r5, #0x200
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _020EA930
_020EA424:
	cmp r1, #0x30
	movne r5, #0x400
	bne _020EA930
	mov r1, #0
	mov r0, r8
	mov r2, r1
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _020EA930
_020EA44C:
	cmp r1, #0
	blt _020EA45C
	cmp r1, #0x80
	blt _020EA464
_020EA45C:
	mov r0, #0
	b _020EA474
_020EA464:
	mov r2, r1, lsl #1
	ldr r0, _020EAB24 ; =__msl_digit
	ldrh r0, [r0, r2]
	and r0, r0, #8
_020EA474:
	cmp r0, #0
	moveq r5, #0x800
	beq _020EA930
	ldr r0, [sp, #0x20]
	sub r2, r1, #0x30
	mov r1, #0xa
	mla r0, r1, r0, r2
	ldr r1, _020EAB30 ; =0x00007FFF
	str r0, [sp, #0x20]
	cmp r0, r1
	ldrgt r0, [sp, #0xd0]
	movgt r1, #1
	strgt r1, [r0]
	mov r1, #0
	mov r0, r8
	mov r2, r1
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _020EA930
_020EA4C4:
	cmp sl, #0x20
	bgt _020EA514
	bge _020EA7E8
	cmp sl, #8
	bgt _020EA508
	cmp sl, #0
	addge pc, pc, sl, lsl #2
	b _020EA930
_020EA4E4: ; jump table
	b _020EA930 ; case 0
	b _020EA538 ; case 1
	b _020EA588 ; case 2
	b _020EA930 ; case 3
	b _020EA5B0 ; case 4
	b _020EA930 ; case 5
	b _020EA930 ; case 6
	b _020EA930 ; case 7
	b _020EA6C0 ; case 8
_020EA508:
	cmp sl, #0x10
	beq _020EA79C
	b _020EA930
_020EA514:
	cmp sl, #0x80
	bgt _020EA52C
	bge _020EA890
	cmp sl, #0x40
	beq _020EA830
	b _020EA930
_020EA52C:
	cmp sl, #0x100
	beq _020EA8B8
	b _020EA930
_020EA538:
	mov r1, #0
	add r0, sp, #0x45
	str r0, [sp, #0x14]
	strb r1, [r0]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	strb r1, [r0, #4]
	strb r1, [r0, #5]
	strb r1, [r0, #6]
	strb r1, [r0, #7]
	mov r0, r8
	mov r2, r1
	str r1, [sp, #8]
	mov fp, r1
	mov sl, #2
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _020EA930
_020EA588:
	cmp r1, #0x30
	movne sl, #4
	bne _020EA930
	mov r1, #0
	mov r0, r8
	mov r2, r1
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _020EA930
_020EA5B0:
	cmp r1, #0
	blt _020EA5C0
	cmp r1, #0x80
	blt _020EA5C8
_020EA5C0:
	mov r0, #0
	b _020EA5D8
_020EA5C8:
	mov r2, r1, lsl #1
	ldr r0, _020EAB24 ; =__msl_digit
	ldrh r0, [r0, r2]
	and r0, r0, #0x400
_020EA5D8:
	cmp r0, #0
	bne _020EA60C
	cmp r1, #0x2e
	movne sl, #0x10
	bne _020EA930
	mov r1, #0
	mov r0, r8
	mov r2, r1
	mov sl, #8
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _020EA930
_020EA60C:
	ldr r2, [sp, #8]
	mov r0, #0xe
	cmp r2, r0
	bhs _020EA6A4
	mov r0, r2
	add r0, r0, #1
	str r0, [sp, #8]
	ldr r0, [sp, #0x14]
	add r2, fp, fp, lsr #31
	cmp r1, #0
	ldrb r0, [r0, r2, asr #1]
	blt _020EA64C
	cmp r1, #0x80
	bge _020EA64C
	ldr r2, _020EAB28 ; =__upper_mapC
	ldrb r1, [r2, r1]
_020EA64C:
	cmp r1, #0x41
	subge r1, r1, #0x37
	sublt r1, r1, #0x30
	mov r2, fp, lsr #0x1f
	and r3, r1, #0xff
	rsb r1, r2, fp, lsl #31
	adds r1, r2, r1, ror #31
	moveq r1, r3, lsl #4
	add r2, fp, fp, lsr #31
	orrne r0, r0, r3
	andeq r1, r1, #0xff
	orreq r0, r0, r1
	ldr r1, [sp, #0x14]
	add fp, fp, #1
	strb r0, [r1, r2, asr #1]
	mov r1, #0
	mov r0, r8
	mov r2, r1
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _020EA930
_020EA6A4:
	add r4, r4, #1
	mov r0, r8
	mov r1, #0
	mov r2, r1
	blx sb
	mov r1, r0
	b _020EA930
_020EA6C0:
	cmp r1, #0
	blt _020EA6D0
	cmp r1, #0x80
	blt _020EA6D8
_020EA6D0:
	mov r0, #0
	b _020EA6E8
_020EA6D8:
	mov r2, r1, lsl #1
	ldr r0, _020EAB24 ; =__msl_digit
	ldrh r0, [r0, r2]
	and r0, r0, #0x400
_020EA6E8:
	cmp r0, #0
	moveq sl, #0x10
	beq _020EA930
	ldr r2, [sp, #8]
	mov r0, #0xe
	cmp r2, r0
	bhs _020EA780
	ldr r0, [sp, #0x14]
	add r2, fp, fp, lsr #31
	cmp r1, #0
	ldrb r0, [r0, r2, asr #1]
	blt _020EA728
	cmp r1, #0x80
	bge _020EA728
	ldr r2, _020EAB28 ; =__upper_mapC
	ldrb r1, [r2, r1]
_020EA728:
	cmp r1, #0x41
	subge r1, r1, #0x37
	sublt r1, r1, #0x30
	mov r2, fp, lsr #0x1f
	and r3, r1, #0xff
	rsb r1, r2, fp, lsl #31
	adds r1, r2, r1, ror #31
	moveq r1, r3, lsl #4
	add r2, fp, fp, lsr #31
	orrne r0, r0, r3
	andeq r1, r1, #0xff
	orreq r0, r0, r1
	ldr r1, [sp, #0x14]
	add fp, fp, #1
	strb r0, [r1, r2, asr #1]
	mov r1, #0
	mov r0, r8
	mov r2, r1
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _020EA930
_020EA780:
	add r4, r4, #1
	mov r0, r8
	mov r1, #0
	mov r2, r1
	blx sb
	mov r1, r0
	b _020EA930
_020EA79C:
	cmp r1, #0
	blt _020EA7AC
	cmp r1, #0x80
	blt _020EA7B4
_020EA7AC:
	mov r0, r1
	b _020EA7BC
_020EA7B4:
	ldr r0, _020EAB28 ; =__upper_mapC
	ldrb r0, [r0, r1]
_020EA7BC:
	cmp r0, #0x50
	movne r5, #0x800
	bne _020EA930
	mov r1, #0
	mov r0, r8
	mov r2, r1
	mov sl, #0x20
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _020EA930
_020EA7E8:
	cmp r1, #0x2d
	moveq r0, #1
	streq r0, [sp, #0xc]
	beq _020EA810
	cmp r1, #0x2b
	beq _020EA810
	mov r0, r8
	mov r2, #1
	blx sb
	sub r4, r4, #1
_020EA810:
	mov sl, #0x40
	add r4, r4, #1
	mov r0, r8
	mov r1, #0
	mov r2, r1
	blx sb
	mov r1, r0
	b _020EA930
_020EA830:
	cmp r1, #0
	blt _020EA840
	cmp r1, #0x80
	blt _020EA848
_020EA840:
	mov r0, #0
	b _020EA858
_020EA848:
	mov r2, r1, lsl #1
	ldr r0, _020EAB24 ; =__msl_digit
	ldrh r0, [r0, r2]
	and r0, r0, #8
_020EA858:
	cmp r0, #0
	moveq r5, #0x1000
	beq _020EA930
	cmp r1, #0x30
	movne sl, #0x100
	bne _020EA930
	mov r1, #0
	mov r0, r8
	mov r2, r1
	mov sl, #0x80
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _020EA930
_020EA890:
	cmp r1, #0x30
	movne sl, #0x100
	bne _020EA930
	mov r1, #0
	mov r0, r8
	mov r2, r1
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _020EA930
_020EA8B8:
	cmp r1, #0
	blt _020EA8C8
	cmp r1, #0x80
	blt _020EA8D0
_020EA8C8:
	mov r0, #0
	b _020EA8E0
_020EA8D0:
	mov r2, r1, lsl #1
	ldr r0, _020EAB24 ; =__msl_digit
	ldrh r0, [r0, r2]
	and r0, r0, #8
_020EA8E0:
	cmp r0, #0
	moveq r5, #0x800
	beq _020EA930
	ldr r0, [sp, #0x10]
	sub r2, r1, #0x30
	mov r1, #0xa
	mla r0, r1, r0, r2
	str r0, [sp, #0x10]
	ldr r1, _020EAB30 ; =0x00007FFF
	ldr r0, [sp, #0x20]
	add r4, r4, #1
	cmp r0, r1
	ldrgt r0, [sp, #0xd0]
	movgt r1, #1
	strgt r1, [r0]
	mov r1, #0
	mov r0, r8
	mov r2, r1
	blx sb
	mov r1, r0
_020EA930:
	ldr r0, [sp]
	cmp r4, r0
	bgt _020EA950
	mvn r0, #0
	cmp r1, r0
	beq _020EA950
	tst r5, #0x1800
	beq _020E9C44
_020EA950:
	cmp r5, #0x8000
	beq _020EA96C
	ldr r0, _020EAB34 ; =0x00000E2C
	tst r5, r0
	moveq r0, #1
	movne r0, #0
	b _020EA990
_020EA96C:
	sub r0, r4, #1
	cmp r0, #2
	ble _020EA984
	ldr r0, _020EAB38 ; =0x0000018E
	tst sl, r0
	bne _020EA98C
_020EA984:
	mov r0, #1
	b _020EA990
_020EA98C:
	mov r0, #0
_020EA990:
	cmp r0, #0
	movne r2, #0
	ldrne r0, [sp, #4]
	bne _020EA9B0
	ldr r0, [sp, #0x2c]
	sub r2, r4, #1
	add r2, r2, r0
	ldr r0, [sp, #4]
_020EA9B0:
	str r2, [r0]
	mov r0, r8
	mov r2, #1
	blx sb
	cmp sl, #0
	bne _020EABB4
	ldr r0, [sp, #0x24]
	ldrb r2, [sp, #0x84]
	cmp r0, #0
	ldrne r0, [sp, #0x20]
	rsbne r0, r0, #0
	strne r0, [sp, #0x20]
	add r0, sp, #0x85
	add r1, r0, r2
	b _020EA9F8
_020EA9EC:
	ldr r0, [sp, #0x1c]
	add r0, r0, #1
	str r0, [sp, #0x1c]
_020EA9F8:
	cmp r2, #0
	sub r2, r2, #1
	beq _020EAA10
	ldrb r0, [r1, #-1]!
	cmp r0, #0x30
	beq _020EA9EC
_020EAA10:
	add r0, r2, #1
	strb r0, [sp, #0x84]
	ands r2, r0, #0xff
	bne _020EAA34
	add r1, r2, #1
	strb r1, [sp, #0x84]
	add r0, sp, #0x85
	mov r1, #0x30
	strb r1, [r0, r2]
_020EAA34:
	ldr r1, [sp, #0x20]
	ldr r0, [sp, #0x1c]
	mov r2, #0x8000
	add r0, r1, r0
	rsb r2, r2, #0
	str r0, [sp, #0x20]
	cmp r0, r2
	blt _020EAA5C
	cmp r0, r2, lsr #17
	ble _020EAA68
_020EAA5C:
	ldr r0, [sp, #0xd0]
	mov r1, #1
	str r1, [r0]
_020EAA68:
	ldr r0, [sp, #0xd0]
	ldr r0, [r0]
	cmp r0, #0
	beq _020EAAC4
	ldr r0, [sp, #0x24]
	cmp r0, #0
	movne r0, #0
	addne sp, sp, #0xa8
	movne r1, r0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [sp, #0x28]
	cmp r0, #0
	ldreq r1, _020EAB3C ; =__double_huge
	addeq sp, sp, #0xa8
	ldmeqia r1, {r0, r1}
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r1, _020EAB3C ; =__double_huge
	mov r0, #0
	ldmia r1, {r2, r3}
	mov r1, r0
	bl _dsub
	add sp, sp, #0xa8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020EAAC4:
	ldr r1, [sp, #0x20]
	add r0, sp, #0x80
	strh r1, [sp, #0x82]
	bl __dec2num
	mov r4, r0
	mov r6, r1
	mov r0, #0
	mov r1, r0
	mov r2, r4
	mov r3, r6
	bl _dneq
	beq _020EAB44
	mov r0, r4
	mov r1, r6
	mov r2, #0
	mov r3, #0x100000
	bl _dls
	bhs _020EAB44
	ldr r0, [sp, #0xd0]
	mov r1, #1
	str r1, [r0]
	b _020EAB70
	.align 2, 0
_020EAB1C: .word model$4439
_020EAB20: .word model$4434
_020EAB24: .word __msl_digit
_020EAB28: .word __upper_mapC
_020EAB2C: .word __float_huge
_020EAB30: .word 0x00007FFF
_020EAB34: .word 0x00000E2C
_020EAB38: .word 0x0000018E
_020EAB3C: .word __double_huge
_020EAB40: .word 0x7FEFFFFF
_020EAB44:
	ldr r3, _020EAB40 ; =0x7FEFFFFF
	mov r0, r4
	mov r1, r6
	mvn r2, #0
	bl _dgr
	bls _020EAB70
	ldr r0, [sp, #0xd0]
	mov r2, #1
	ldr r1, _020EAB3C ; =__double_huge
	str r2, [r0]
	ldmia r1, {r4, r6}
_020EAB70:
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _020EABA4
	ldr r0, _020EAB34 ; =0x00000E2C
	tst r5, r0
	beq _020EABA4
	mov r0, #0
	mov r1, r0
	mov r2, r4
	mov r3, r6
	bl _dsub
	mov r4, r0
	mov r6, r1
_020EABA4:
	add sp, sp, #0xa8
	mov r0, r4
	mov r1, r6
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020EABB4:
	ldr r0, [sp, #0xc]
	add r4, sp, #0x38
	cmp r0, #0
	ldrne r0, [sp, #0x10]
	ldrb r3, [sp, #0x45]
	rsbne r0, r0, #0
	strne r0, [sp, #0x10]
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #8]
	mov r2, #0
	add r0, r1, r0, lsl #2
	str r0, [sp, #0x10]
	mov r1, #0x80
	b _020EABFC
_020EABEC:
	ldr r0, [sp, #0x10]
	add r2, r2, #1
	sub r0, r0, #1
	str r0, [sp, #0x10]
_020EABFC:
	cmp r2, #4
	bhs _020EAC0C
	tst r3, r1, asr r2
	beq _020EABEC
_020EAC0C:
	adds r5, r2, #1
	beq _020EAC58
	add r0, sp, #0x4c
	add r3, sp, #0x45
	str r0, [sp, #0x14]
	mov r1, #0
	cmp r0, r3
	blo _020EAC58
	rsb r6, r5, #8
_020EAC30:
	ldr r0, [sp, #0x14]
	ldrb r0, [r0]
	orr r2, r1, r0, lsl r5
	mov r1, r0, asr r6
	ldr r0, [sp, #0x14]
	and r1, r1, #0xff
	strb r2, [r0], #-1
	str r0, [sp, #0x14]
	cmp r0, r3
	bhs _020EAC30
_020EAC58:
	mov r2, #0
	mov r6, r2
	strb r2, [r4]
	strb r2, [r4, #1]
	strb r2, [r4, #2]
	strb r2, [r4, #3]
	strb r2, [r4, #4]
	strb r2, [r4, #5]
	strb r2, [r4, #6]
	strb r2, [r4, #7]
	mov r3, #0xc
	mov r7, #1
	mov r0, #0xff
	add r1, sp, #0x45
_020EAC90:
	add r5, r2, #8
	cmp r5, #0x34
	ldrb r5, [r1, r6]
	rsbhi r8, r2, #0x34
	and fp, r3, #7
	andhi r5, r5, r0, lsl r8
	andhi r5, r5, #0xff
	mov r8, r5, asr fp
	and sb, r8, #0xff
	ldrb sl, [r4, r7]
	rsb r8, fp, #8
	mov r5, r5, lsl r8
	orr sb, sl, sb
	strb sb, [r4, r7]
	add r7, r7, #1
	add r2, r2, #8
	ldrb r8, [r4, r7]
	and r5, r5, #0xff
	cmp r2, #0x34
	orr r5, r8, r5
	strb r5, [r4, r7]
	add r3, r3, #8
	add r6, r6, #1
	blo _020EAC90
	ldr r0, [sp, #0x10]
	mov r1, #0x800
	add r0, r0, #0xfe
	add r2, r0, #0x300
	rsb r1, r1, #0
	tst r2, r1
	beq _020EAD28
	ldr r2, [sp, #0xd0]
	mov r3, #1
	mov r0, #0
	add sp, sp, #0xa8
	mov r1, r0
	str r3, [r2]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020EAD28:
	ldrb r0, [r4, #1]
	mov r2, r2, lsl #0x15
	ldrb r1, [r4]
	orr r0, r0, r2, lsr #17
	strb r0, [r4, #1]
	ldr r0, [sp, #0x28]
	orr r1, r1, r2, lsr #25
	cmp r0, #0
	andne r0, r1, #0xff
	strb r1, [r4]
	orrne r0, r0, #0x80
	strneb r0, [r4]
	mov r3, #0
_020EAD5C:
	rsb r1, r3, #7
	ldrb r2, [r4, r3]
	ldrb r0, [r4, r1]
	strb r0, [r4, r3]
	add r3, r3, #1
	strb r2, [r4, r1]
	cmp r3, #4
	blt _020EAD5C
	ldmia r4, {r0, r1}
	add sp, sp, #0xa8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end __strtold

	arm_func_start strtold
strtold: ; 0x020EAD88
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x14
	mov r7, r0
	mov r0, #0
	mov r6, r1
	str r0, [sp, #8]
	add r4, sp, #0xc
	str r7, [sp, #4]
	ldr r1, _020EAE5C ; =__StringRead
	add r2, sp, #4
	add r3, sp, #0x10
	sub r0, r0, #0x80000001
	str r4, [sp]
	bl __strtold
	mov r5, r1
	mov r4, r0
	cmp r6, #0
	ldrne r0, [sp, #0x10]
	mov r1, r5
	addne r0, r7, r0
	strne r0, [r6]
	mov r0, r4
	bl fabs
	ldr r2, [sp, #0xc]
	mov r6, r0
	mov r7, r1
	cmp r2, #0
	bne _020EAE40
	mov r0, #0
	mov r1, r0
	mov r2, r4
	mov r3, r5
	bl _dneq
	beq _020EAE4C
	mov r0, r6
	mov r1, r7
	mov r2, #0
	mov r3, #0x100000
	bl _dls
	blo _020EAE40
	ldr r3, _020EAE60 ; =0x7FEFFFFF
	mov r0, r6
	mov r1, r7
	mvn r2, #0
	bl _dgr
	bls _020EAE4C
_020EAE40:
	ldr r0, _020EAE64 ; =errno
	mov r1, #0x22
	str r1, [r0]
_020EAE4C:
	mov r0, r4
	mov r1, r5
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_020EAE5C: .word __StringRead
_020EAE60: .word 0x7FEFFFFF
_020EAE64: .word errno
	arm_func_end strtold

	arm_func_start atod
atod: ; 0x020EAE68
	ldr ip, _020EAE74 ; =strtold
	mov r1, #0
	bx ip
	.align 2, 0
_020EAE74: .word strtold
	arm_func_end atod

	exception __strtold, 0x124C, __strtold_exception
	exception strtold, 0x00E1, 0x00500F00
	exception atod, 0x0011, 0x00000000

	.section .exception,4,1,2

__strtold_exception: ; 0x020F4F94
	.byte 0x00, 0xFF, 0x01, 0xD0, 0x00, 0x00, 0x00, 0x00
