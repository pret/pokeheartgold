	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov119_0225F020
ov119_0225F020: ; 0x0225F020
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x60
	add r7, r1, #0
	str r0, [sp, #0x14]
	ldr r0, [r7]
	ldr r4, [r7, #0xc]
	cmp r0, #7
	bls _0225F032
	b _0225F35E
_0225F032:
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0225F03E: ; jump table
	.short _0225F04E - _0225F03E - 2 ; case 0
	.short _0225F10C - _0225F03E - 2 ; case 1
	.short _0225F126 - _0225F03E - 2 ; case 2
	.short _0225F132 - _0225F03E - 2 ; case 3
	.short _0225F196 - _0225F03E - 2 ; case 4
	.short _0225F1FE - _0225F03E - 2 ; case 5
	.short _0225F28A - _0225F03E - 2 ; case 6
	.short _0225F314 - _0225F03E - 2 ; case 7
_0225F04E:
	mov r1, #0x1e
	mov r0, #4
	lsl r1, r1, #4
	bl AllocFromHeap
	mov r2, #0x1e
	str r0, [r7, #0xc]
	mov r1, #0
	lsl r2, r2, #4
	bl memset
	ldr r0, [r7, #0x10]
	ldr r4, [r7, #0xc]
	ldr r1, [r0, #0x24]
	mov r0, #7
	lsl r0, r0, #6
	str r1, [r4, r0]
	bl ov01_021EFFEC
	str r0, [r4, #0x44]
	add r0, r4, #0
	add r0, #0x48
	mov r1, #2
	mov r2, #1
	bl ov01_021F05C4
	mov r0, #1
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #9
	str r0, [sp, #8]
	mov r0, #8
	str r0, [sp, #0xc]
	ldr r0, _0225F370 ; =0x000927C0
	mov r2, #0x61
	str r0, [sp, #0x10]
	add r1, r4, #0
	lsl r2, r2, #2
	ldr r0, [r7, #0x20]
	add r1, #0x48
	add r2, r4, r2
	mov r3, #0
	bl ov01_021F0614
	mov r0, #0
	str r0, [sp, #0x18]
	add r6, r0, #0
	add r0, r4, #0
	str r0, [sp, #0x20]
	add r0, #0x48
	add r5, r4, #0
	str r0, [sp, #0x20]
_0225F0B8:
	mov r0, #0
	str r0, [sp]
	mov r1, #0x61
	str r0, [sp, #4]
	lsl r1, r1, #2
	mov r2, #2
	mov r3, #6
	ldr r0, [sp, #0x20]
	add r1, r4, r1
	lsl r2, r2, #0x12
	lsl r3, r3, #0x10
	bl ov01_021F0718
	mov r1, #0x6e
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x6e
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r6, #0
	bl sub_02024ADC
	ldr r0, [sp, #0x18]
	add r5, r5, #4
	add r0, r0, #1
	add r6, r6, #2
	str r0, [sp, #0x18]
	cmp r0, #2
	blt _0225F0B8
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	ldr r0, [r7]
	add r0, r0, #1
	str r0, [r7]
	b _0225F35E
_0225F10C:
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	add r1, r0, #0
	sub r1, #0x11
	add r2, r1, #0
	add r3, r7, #4
	bl ov01_021EFCF8
	ldr r0, [r7]
	add r0, r0, #1
	str r0, [r7]
	b _0225F35E
_0225F126:
	ldr r1, [r7, #4]
	cmp r1, #0
	beq _0225F1F4
	add r0, r0, #1
	str r0, [r7]
	b _0225F35E
_0225F132:
	mov r0, #0xa
	mov r2, #1
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x29
	lsl r2, r2, #0xc
	mov r3, #2
	bl ov01_021EFEC8
	ldr r1, [r4]
	add r0, sp, #0x54
	add r2, r1, #0
	add r3, r1, #0
	bl ov01_021F074C
	mov r6, #0
	add r5, r4, #0
_0225F154:
	mov r0, #0x6e
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x6e
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #2
	bl sub_0202487C
	mov r0, #0x6e
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, sp, #0x54
	bl sub_020247F4
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #2
	blt _0225F154
	add r0, r4, #0
	ldr r2, _0225F374 ; =0x0000FFFF
	add r0, #0x18
	mov r1, #0
	mov r3, #0xa
	bl ov01_021EFE34
	ldr r0, [r7]
	add r0, r0, #1
	str r0, [r7]
	b _0225F35E
_0225F196:
	add r0, r4, #0
	bl ov01_021EFF28
	ldr r1, [r4]
	str r0, [sp, #0x1c]
	add r0, sp, #0x54
	add r2, r1, #0
	add r3, r1, #0
	bl ov01_021F074C
	add r0, r4, #0
	add r0, #0x18
	bl ov01_021EFE44
	mov r6, #0
	add r5, r4, #0
_0225F1B6:
	mov r0, #0x6e
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, sp, #0x54
	bl sub_020247F4
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #2
	blt _0225F1B6
	mov r0, #0x6e
	ldr r1, [r4, #0x18]
	lsl r0, r0, #2
	lsl r1, r1, #0x10
	ldr r0, [r4, r0]
	lsr r1, r1, #0x10
	bl sub_02024818
	mov r1, #0x6f
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	ldr r2, [r4, #0x18]
	sub r1, #0xbc
	sub r1, r2, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl sub_02024818
	ldr r0, [sp, #0x1c]
	cmp r0, #1
	beq _0225F1F6
_0225F1F4:
	b _0225F35E
_0225F1F6:
	ldr r0, [r7]
	add r0, r0, #1
	str r0, [r7]
	b _0225F35E
_0225F1FE:
	mov r0, #0
	str r0, [sp]
	mov r0, #0xff
	lsl r0, r0, #0xc
	str r0, [sp, #4]
	mov r0, #0xa
	lsl r0, r0, #0xc
	str r0, [sp, #8]
	ldr r1, [r4, #0x44]
	add r0, r7, #0
	mov r2, #0x60
	mov r3, #6
	bl ov01_021F0050
	mov r0, #0x6e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x6f
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #2
	bl Set2dSpriteAnimSeqNo
	mov r0, #6
	str r0, [sp]
	add r0, r4, #0
	mov r2, #0xff
	mov r3, #0xa
	add r0, #0x2c
	mov r1, #0
	lsl r2, r2, #0xc
	lsl r3, r3, #0xc
	bl ov01_021EFEC8
	mov r0, #7
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl GF_Camera_GetDistance
	add r1, r0, #0
	mov r0, #6
	str r0, [sp]
	mov r0, #0x71
	mov r2, #0x7d
	lsl r0, r0, #2
	lsl r2, r2, #0xe
	ldr r3, _0225F378 ; =0xFFFF6000
	add r0, r4, r0
	sub r2, r1, r2
	bl ov01_021EFEC8
	mov r0, #0x6e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_02024818
	mov r0, #0x6f
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_02024818
	ldr r0, [r7]
	add r0, r0, #1
	str r0, [r7]
	b _0225F35E
_0225F28A:
	add r0, r4, #0
	add r0, #0x2c
	bl ov01_021EFF28
	mov r1, #2
	ldr r2, [r4, #0x2c]
	lsl r1, r1, #0x12
	sub r1, r1, r2
	mov r2, #6
	add r0, sp, #0x30
	lsl r2, r2, #0x10
	mov r3, #0
	bl ov01_021F074C
	add r3, sp, #0x30
	ldmia r3!, {r0, r1}
	add r2, sp, #0x48
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r1, #2
	str r0, [r2]
	ldr r2, [r4, #0x2c]
	lsl r1, r1, #0x12
	add r1, r2, r1
	mov r2, #6
	add r0, sp, #0x24
	lsl r2, r2, #0x10
	mov r3, #0
	bl ov01_021F074C
	add r3, sp, #0x24
	ldmia r3!, {r0, r1}
	add r2, sp, #0x3c
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r1, sp, #0x48
	str r0, [r2]
	mov r0, #0x6e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_020247D4
	mov r0, #0x6f
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x3c
	bl sub_020247D4
	mov r0, #0x71
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov01_021EFF28
	mov r1, #0x71
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	sub r1, r1, #4
	ldr r1, [r4, r1]
	bl GF_Camera_SetDistance
	add r0, r7, #0
	bl ov01_021EFE30
	cmp r0, #0
	beq _0225F35E
	ldr r0, [r7]
	add r0, r0, #1
	str r0, [r7]
	b _0225F35E
_0225F314:
	mov r0, #0
	bl sub_0200FC20
	ldr r1, [r7, #0x14]
	cmp r1, #0
	beq _0225F324
	mov r0, #1
	str r0, [r1]
_0225F324:
	mov r6, #0
	add r5, r4, #0
_0225F328:
	mov r0, #0x6e
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02024758
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #2
	blt _0225F328
	mov r1, #0x61
	add r0, r4, #0
	lsl r1, r1, #2
	add r0, #0x48
	add r1, r4, r1
	bl ov01_021F06EC
	add r0, r4, #0
	add r0, #0x48
	bl ov01_021F05F4
	ldr r0, [r4, #0x44]
	bl ov01_021F0028
	ldr r1, [sp, #0x14]
	add r0, r7, #0
	bl ov01_021EFCDC
_0225F35E:
	ldr r0, [r7]
	cmp r0, #7
	beq _0225F36A
	ldr r0, [r4, #0x48]
	bl sub_0202457C
_0225F36A:
	add sp, #0x60
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225F370: .word 0x000927C0
_0225F374: .word 0x0000FFFF
_0225F378: .word 0xFFFF6000
	thumb_func_end ov119_0225F020

	thumb_func_start ov119_0225F37C
ov119_0225F37C: ; 0x0225F37C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x7c
	add r6, r1, #0
	str r0, [sp, #0x14]
	ldr r0, [r6]
	ldr r4, [r6, #0xc]
	cmp r0, #7
	bhi _0225F47A
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0225F398: ; jump table
	.short _0225F3A8 - _0225F398 - 2 ; case 0
	.short _0225F45A - _0225F398 - 2 ; case 1
	.short _0225F474 - _0225F398 - 2 ; case 2
	.short _0225F482 - _0225F398 - 2 ; case 3
	.short _0225F510 - _0225F398 - 2 ; case 4
	.short _0225F5A0 - _0225F398 - 2 ; case 5
	.short _0225F5DA - _0225F398 - 2 ; case 6
	.short _0225F604 - _0225F398 - 2 ; case 7
_0225F3A8:
	mov r1, #0x71
	mov r0, #4
	lsl r1, r1, #2
	bl AllocFromHeap
	mov r2, #0x71
	str r0, [r6, #0xc]
	mov r1, #0
	lsl r2, r2, #2
	bl memset
	ldr r0, [r6, #0x10]
	ldr r4, [r6, #0xc]
	ldr r1, [r0, #0x24]
	mov r0, #0x69
	lsl r0, r0, #2
	str r1, [r4, r0]
	bl ov01_021F0250
	str r0, [r4, #0x28]
	add r0, r4, #0
	add r0, #0x2c
	mov r1, #2
	mov r2, #1
	bl ov01_021F05C4
	mov r0, #1
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #6
	str r0, [sp, #8]
	mov r0, #5
	str r0, [sp, #0xc]
	ldr r0, _0225F660 ; =0x000927C0
	mov r2, #0x5a
	str r0, [sp, #0x10]
	add r1, r4, #0
	lsl r2, r2, #2
	ldr r0, [r6, #0x20]
	add r1, #0x2c
	add r2, r4, r2
	mov r3, #0
	bl ov01_021F0614
	add r0, r4, #0
	str r0, [sp, #0x18]
	add r0, #0x2c
	mov r7, #0
	add r5, r4, #0
	str r0, [sp, #0x18]
_0225F40E:
	mov r0, #0
	str r0, [sp]
	mov r1, #0x5a
	str r0, [sp, #4]
	lsl r1, r1, #2
	mov r2, #2
	ldr r0, [sp, #0x18]
	add r1, r4, r1
	lsl r2, r2, #0x12
	mov r3, #0
	bl ov01_021F0718
	mov r1, #0x67
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x67
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #2
	bl sub_0202487C
	add r7, r7, #1
	add r5, r5, #4
	cmp r7, #2
	blt _0225F40E
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _0225F64E
_0225F45A:
	mov r1, #0x10
	mov r0, #2
	add r2, r1, #0
	str r0, [sp]
	mov r0, #1
	sub r2, #0x20
	add r3, r6, #4
	bl ov01_021EFCF8
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _0225F64E
_0225F474:
	ldr r1, [r6, #4]
	cmp r1, #0
	bne _0225F47C
_0225F47A:
	b _0225F64E
_0225F47C:
	add r0, r0, #1
	str r0, [r6]
	b _0225F64E
_0225F482:
	mov r2, #3
	ldr r1, _0225F664 ; =0xFFF40000
	add r0, r4, #0
	lsl r2, r2, #0x12
	mov r3, #8
	bl ov01_021EFE70
	mov r0, #0x67
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r2, #2
	ldr r1, [r4]
	lsl r2, r2, #0x12
	sub r1, r2, r1
	add r0, sp, #0x40
	lsr r2, r2, #1
	mov r3, #0
	bl ov01_021F074C
	add r3, sp, #0x40
	ldmia r3!, {r0, r1}
	add r2, sp, #0x70
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r3, #0
	str r0, [r2]
	mov r2, #2
	ldr r1, [r4]
	lsl r2, r2, #0x12
	add r0, sp, #0x34
	add r1, r1, r2
	bl ov01_021F074C
	add r3, sp, #0x34
	ldmia r3!, {r0, r1}
	add r2, sp, #0x64
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r1, sp, #0x70
	str r0, [r2]
	mov r0, #0x67
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_020247D4
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r1, sp, #0x64
	bl sub_020247D4
	add r0, r4, #0
	ldr r2, _0225F668 ; =0x0001FFFE
	add r0, #0x14
	mov r1, #0
	mov r3, #8
	bl ov01_021EFE34
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _0225F64E
_0225F510:
	add r0, r4, #0
	bl ov01_021EFE80
	mov r2, #2
	add r5, r0, #0
	ldr r1, [r4]
	lsl r2, r2, #0x12
	sub r1, r2, r1
	add r0, sp, #0x28
	lsr r2, r2, #1
	mov r3, #0
	bl ov01_021F074C
	add r3, sp, #0x28
	ldmia r3!, {r0, r1}
	add r2, sp, #0x58
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r3, #0
	str r0, [r2]
	mov r2, #2
	ldr r1, [r4]
	lsl r2, r2, #0x12
	add r0, sp, #0x1c
	add r1, r1, r2
	bl ov01_021F074C
	add r3, sp, #0x1c
	ldmia r3!, {r0, r1}
	add r2, sp, #0x4c
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r1, sp, #0x58
	str r0, [r2]
	mov r0, #0x67
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_020247D4
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r1, sp, #0x4c
	bl sub_020247D4
	add r0, r4, #0
	add r0, #0x14
	bl ov01_021EFE44
	mov r0, #0x67
	ldr r1, [r4, #0x14]
	lsl r0, r0, #2
	lsl r1, r1, #0x10
	ldr r0, [r4, r0]
	lsr r1, r1, #0x10
	bl sub_02024818
	ldr r1, [r4, #0x14]
	mov r0, #0x1a
	lsl r0, r0, #4
	neg r1, r1
	lsl r1, r1, #0x10
	ldr r0, [r4, r0]
	lsr r1, r1, #0x10
	bl sub_02024818
	cmp r5, #1
	bne _0225F64E
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _0225F64E
_0225F5A0:
	mov r3, #1
	lsl r3, r3, #0xc
	str r3, [sp]
	ldr r1, [r4, #0x28]
	add r0, r6, #0
	mov r2, #8
	bl ov01_021F02C4
	mov r0, #0x69
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl GF_Camera_GetDistance
	add r1, r0, #0
	mov r0, #8
	str r0, [sp]
	mov r0, #0x6a
	mov r2, #0x7d
	lsl r0, r0, #2
	lsl r2, r2, #0xe
	ldr r3, _0225F66C ; =0xFFFF6000
	add r0, r4, r0
	sub r2, r1, r2
	bl ov01_021EFEC8
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _0225F64E
_0225F5DA:
	mov r0, #0x6a
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov01_021EFF28
	mov r1, #0x6a
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	sub r1, r1, #4
	ldr r1, [r4, r1]
	bl GF_Camera_SetDistance
	add r0, r6, #0
	bl ov01_021EFE30
	cmp r0, #1
	bne _0225F64E
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _0225F64E
_0225F604:
	mov r0, #0
	bl sub_0200FC20
	ldr r1, [r6, #0x14]
	cmp r1, #0
	beq _0225F614
	mov r0, #1
	str r0, [r1]
_0225F614:
	mov r7, #0
	add r5, r4, #0
_0225F618:
	mov r0, #0x67
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02024758
	add r7, r7, #1
	add r5, r5, #4
	cmp r7, #2
	blt _0225F618
	mov r1, #0x5a
	add r0, r4, #0
	lsl r1, r1, #2
	add r0, #0x2c
	add r1, r4, r1
	bl ov01_021F06EC
	add r0, r4, #0
	add r0, #0x2c
	bl ov01_021F05F4
	ldr r0, [r4, #0x28]
	bl ov01_021F029C
	ldr r1, [sp, #0x14]
	add r0, r6, #0
	bl ov01_021EFCDC
_0225F64E:
	ldr r0, [r6]
	cmp r0, #7
	beq _0225F65A
	ldr r0, [r4, #0x2c]
	bl sub_0202457C
_0225F65A:
	add sp, #0x7c
	pop {r4, r5, r6, r7, pc}
	nop
_0225F660: .word 0x000927C0
_0225F664: .word 0xFFF40000
_0225F668: .word 0x0001FFFE
_0225F66C: .word 0xFFFF6000
	thumb_func_end ov119_0225F37C

	thumb_func_start ov119_0225F670
ov119_0225F670: ; 0x0225F670
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x58
	add r7, r1, #0
	str r0, [sp, #0x14]
	ldr r0, [r7]
	ldr r4, [r7, #0xc]
	cmp r0, #7
	bls _0225F682
	b _0225F9F0
_0225F682:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225F68E: ; jump table
	.short _0225F69E - _0225F68E - 2 ; case 0
	.short _0225F75E - _0225F68E - 2 ; case 1
	.short _0225F778 - _0225F68E - 2 ; case 2
	.short _0225F7BE - _0225F68E - 2 ; case 3
	.short _0225F824 - _0225F68E - 2 ; case 4
	.short _0225F8B0 - _0225F68E - 2 ; case 5
	.short _0225F934 - _0225F68E - 2 ; case 6
	.short _0225F99C - _0225F68E - 2 ; case 7
_0225F69E:
	mov r1, #0x7a
	mov r0, #4
	lsl r1, r1, #2
	bl AllocFromHeap
	mov r2, #0x7a
	str r0, [r7, #0xc]
	mov r1, #0
	lsl r2, r2, #2
	bl memset
	ldr r0, [r7, #0x10]
	ldr r4, [r7, #0xc]
	ldr r1, [r0, #0x24]
	mov r0, #0x72
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r4, #0
	add r0, #0x40
	mov r1, #4
	bl ov01_021F12B4
	mov r0, #0x79
	mov r1, #0xc
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r4, #0
	add r0, #0x50
	mov r1, #2
	mov r2, #1
	bl ov01_021F05C4
	mov r0, #1
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #9
	str r0, [sp, #8]
	mov r0, #8
	str r0, [sp, #0xc]
	ldr r0, _0225FA10 ; =0x000927C0
	mov r2, #0x63
	str r0, [sp, #0x10]
	add r1, r4, #0
	lsl r2, r2, #2
	ldr r0, [r7, #0x20]
	add r1, #0x50
	add r2, r4, r2
	mov r3, #0
	bl ov01_021F0614
	add r0, r4, #0
	str r0, [sp, #0x1c]
	add r0, #0x50
	mov r6, #0
	add r5, r4, #0
	str r0, [sp, #0x1c]
_0225F710:
	mov r0, #0
	str r0, [sp]
	mov r1, #0x63
	str r0, [sp, #4]
	lsl r1, r1, #2
	mov r2, #2
	mov r3, #6
	ldr r0, [sp, #0x1c]
	add r1, r4, r1
	lsl r2, r2, #0x12
	lsl r3, r3, #0x10
	bl ov01_021F0718
	mov r1, #7
	lsl r1, r1, #6
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #7
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	add r1, r6, #0
	bl sub_02024ADC
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #2
	blt _0225F710
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	ldr r0, [r7]
	add r0, r0, #1
	str r0, [r7]
	b _0225F9F0
_0225F75E:
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	add r1, r0, #0
	sub r1, #0x11
	add r2, r1, #0
	add r3, r7, #4
	bl ov01_021EFCF8
	ldr r0, [r7]
	add r0, r0, #1
	str r0, [r7]
	b _0225F9F0
_0225F778:
	mov r0, #0x79
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	sub r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0225F7B0
	mov r0, #3
	lsl r0, r0, #0xe
	mov r3, #0x32
	str r0, [sp]
	lsl r3, r3, #4
	str r3, [sp, #4]
	ldr r0, _0225FA14 ; =0x04000010
	mov r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	mov r0, #4
	str r0, [sp, #0x10]
	add r0, r4, #0
	add r0, #0x40
	mov r2, #0xbf
	sub r3, #0x76
	bl ov01_021F12E8
	mov r0, #1
	str r0, [r4, #0x4c]
_0225F7B0:
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _0225F88A
	ldr r0, [r7]
	add r0, r0, #1
	str r0, [r7]
	b _0225F9F0
_0225F7BE:
	add r0, r4, #0
	add r0, #0x18
	mov r1, #0
	mov r2, #0x10
	mov r3, #8
	bl ov01_021EFE34
	ldr r3, [r4, #0x18]
	mov r0, #0x10
	sub r0, r0, r3
	str r0, [sp]
	ldr r0, _0225FA18 ; =0x04000050
	mov r1, #0
	mov r2, #0xf
	bl G2x_SetBlendAlpha_
	mov r6, #0
	add r5, r4, #0
_0225F7E2:
	mov r0, #7
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #7
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #2
	bl sub_0202487C
	mov r0, #7
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_02024B78
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #2
	blt _0225F7E2
	add r0, r4, #0
	ldr r2, _0225FA1C ; =0x0000FFFF
	add r0, #0x2c
	mov r1, #0
	mov r3, #8
	bl ov01_021EFE34
	ldr r0, [r7]
	add r0, r0, #1
	str r0, [r7]
	b _0225F9F0
_0225F824:
	add r0, r4, #0
	add r0, #0x18
	bl ov01_021EFE44
	add r6, r0, #0
	ldr r1, [r4, #0x18]
	mov r0, #0x10
	sub r0, r0, r1
	lsl r0, r0, #8
	orr r1, r0
	ldr r0, _0225FA20 ; =0x04000052
	strh r1, [r0]
	ldr r0, [r4, #0x2c]
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	add r0, r4, #0
	add r0, #0x2c
	bl ov01_021EFE44
	cmp r0, #0
	bne _0225F86E
	mov r0, #7
	ldr r1, [r4, #0x2c]
	lsl r0, r0, #6
	lsl r1, r1, #0x10
	ldr r0, [r4, r0]
	lsr r1, r1, #0x10
	bl sub_02024818
	mov r0, #0x71
	lsl r0, r0, #2
	lsl r1, r5, #0x10
	ldr r0, [r4, r0]
	lsr r1, r1, #0x10
	bl sub_02024818
	b _0225F886
_0225F86E:
	mov r0, #7
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_02024818
	mov r0, #0x71
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_02024818
_0225F886:
	cmp r6, #1
	beq _0225F88C
_0225F88A:
	b _0225F9F0
_0225F88C:
	ldr r0, _0225FA18 ; =0x04000050
	mov r6, #0
	strh r6, [r0]
	add r5, r4, #0
_0225F894:
	mov r0, #7
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_02024B78
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #2
	blt _0225F894
	ldr r0, [r7]
	add r0, r0, #1
	str r0, [r7]
	b _0225F9F0
_0225F8B0:
	mov r1, #8
	str r1, [sp]
	ldr r3, _0225FA24 ; =0x0000019A
	add r0, r4, #0
	lsl r1, r1, #9
	mov r2, #0x29
	bl ov01_021EFEC8
	ldr r1, [r4]
	add r0, sp, #0x34
	add r2, r1, #0
	add r3, r1, #0
	bl ov01_021F074C
	add r3, sp, #0x34
	add r2, sp, #0x4c
	ldmia r3!, {r0, r1}
	str r2, [sp, #0x20]
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r6, #0
	str r0, [r2]
	add r5, r4, #0
_0225F8DE:
	mov r0, #7
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	ldr r1, [sp, #0x20]
	bl sub_020247F4
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #2
	blt _0225F8DE
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl GF_Camera_GetDistance
	add r1, r0, #0
	mov r0, #8
	str r0, [sp]
	mov r0, #0x73
	mov r2, #0x7d
	lsl r0, r0, #2
	lsl r2, r2, #0xe
	ldr r3, _0225FA28 ; =0xFFFF6000
	add r0, r4, r0
	sub r2, r1, r2
	bl ov01_021EFEC8
	mov r0, #8
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	mov r2, #0
	str r0, [sp, #8]
	mov r0, #3
	mov r1, #0x18
	add r3, r2, #0
	bl BeginNormalPaletteFade
	ldr r0, [r7]
	add r0, r0, #1
	str r0, [r7]
	b _0225F9F0
_0225F934:
	add r0, r4, #0
	bl ov01_021EFF28
	ldr r1, [r4]
	str r0, [sp, #0x18]
	add r0, sp, #0x28
	add r2, r1, #0
	add r3, r1, #0
	bl ov01_021F074C
	add r3, sp, #0x28
	add r2, sp, #0x40
	ldmia r3!, {r0, r1}
	str r2, [sp, #0x24]
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r6, #0
	str r0, [r2]
	add r5, r4, #0
_0225F95A:
	mov r0, #7
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	ldr r1, [sp, #0x24]
	bl sub_020247F4
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #2
	blt _0225F95A
	mov r0, #0x73
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov01_021EFF28
	mov r1, #0x73
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	sub r1, r1, #4
	ldr r1, [r4, r1]
	bl GF_Camera_SetDistance
	ldr r0, [sp, #0x18]
	cmp r0, #1
	bne _0225F9F0
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0225F9F0
	ldr r0, [r7]
	add r0, r0, #1
	str r0, [r7]
	b _0225F9F0
_0225F99C:
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	ldr r1, [r7, #0x14]
	cmp r1, #0
	beq _0225F9AE
	mov r0, #1
	str r0, [r1]
_0225F9AE:
	add r0, r4, #0
	add r0, #0x40
	bl ov01_021F12D0
	mov r6, #0
	str r6, [r4, #0x4c]
	add r5, r4, #0
_0225F9BC:
	mov r0, #7
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl sub_02024758
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #2
	blt _0225F9BC
	mov r1, #0x63
	add r0, r4, #0
	lsl r1, r1, #2
	add r0, #0x50
	add r1, r4, r1
	bl ov01_021F06EC
	add r4, #0x50
	add r0, r4, #0
	bl ov01_021F05F4
	ldr r1, [sp, #0x14]
	add r0, r7, #0
	bl ov01_021EFCDC
	add sp, #0x58
	pop {r3, r4, r5, r6, r7, pc}
_0225F9F0:
	ldr r0, [r4, #0x4c]
	cmp r0, #1
	bne _0225FA00
	add r0, r4, #0
	add r0, #0x40
	mov r1, #2
	bl ov01_021F1310
_0225FA00:
	ldr r0, [r7]
	cmp r0, #7
	beq _0225FA0C
	ldr r0, [r4, #0x50]
	bl sub_0202457C
_0225FA0C:
	add sp, #0x58
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225FA10: .word 0x000927C0
_0225FA14: .word 0x04000010
_0225FA18: .word 0x04000050
_0225FA1C: .word 0x0000FFFF
_0225FA20: .word 0x04000052
_0225FA24: .word 0x0000019A
_0225FA28: .word 0xFFFF6000
	thumb_func_end ov119_0225F670

	thumb_func_start ov119_0225FA2C
ov119_0225FA2C: ; 0x0225FA2C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	str r0, [sp, #0x18]
	add r0, r1, #0
	ldr r0, [r0]
	str r1, [sp, #0x1c]
	ldr r4, [r1, #0xc]
	cmp r0, #7
	bls _0225FA40
	b _0225FED2
_0225FA40:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225FA4C: ; jump table
	.short _0225FA5C - _0225FA4C - 2 ; case 0
	.short _0225FB74 - _0225FA4C - 2 ; case 1
	.short _0225FB94 - _0225FA4C - 2 ; case 2
	.short _0225FBEE - _0225FA4C - 2 ; case 3
	.short _0225FCAE - _0225FA4C - 2 ; case 4
	.short _0225FD4C - _0225FA4C - 2 ; case 5
	.short _0225FDFC - _0225FA4C - 2 ; case 6
	.short _0225FE3A - _0225FA4C - 2 ; case 7
_0225FA5C:
	mov r1, #9
	mov r0, #4
	lsl r1, r1, #6
	bl AllocFromHeap
	ldr r1, [sp, #0x1c]
	mov r2, #9
	str r0, [r1, #0xc]
	mov r1, #0
	lsl r2, r2, #6
	bl memset
	ldr r0, [sp, #0x1c]
	ldr r4, [r0, #0xc]
	ldr r0, [r0, #0x10]
	ldr r1, [r0, #0x24]
	mov r0, #0x22
	lsl r0, r0, #4
	str r1, [r4, r0]
	sub r0, #0x10
	add r0, r4, r0
	mov r1, #4
	bl ov01_021F12B4
	mov r0, #0x8f
	mov r1, #0xe
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #3
	mov r2, #1
	bl ov01_021F05C4
	mov r0, #1
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #6
	str r0, [sp, #8]
	mov r0, #5
	str r0, [sp, #0xc]
	ldr r0, _0225FDE8 ; =0x000927C0
	mov r2, #0x4f
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x1c]
	lsl r2, r2, #2
	ldr r0, [r0, #0x20]
	add r1, r4, #0
	add r2, r4, r2
	mov r3, #0
	bl ov01_021F0614
	mov r7, #0x4f
	mov r6, #0
	add r5, r4, #0
	lsl r7, r7, #2
_0225FACC:
	mov r0, #0
	str r0, [sp]
	mov r2, #0
	str r0, [sp, #4]
	add r0, r4, #0
	add r1, r4, r7
	add r3, r2, #0
	bl ov01_021F0718
	mov r1, #0x17
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #2
	bl sub_0202487C
	mov r0, #4
	bl ov01_021F0768
	mov r1, #0x7d
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #3
	blt _0225FACC
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #1
	bl AllocWindows
	mov r1, #0x83
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r3, #0
	str r3, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	ldr r0, [sp, #0x1c]
	ldr r1, [r4, r1]
	ldr r0, [r0, #0x10]
	mov r2, #3
	ldr r0, [r0, #8]
	bl AddWindowParameterized
	mov r1, #0
	add r0, sp, #0x28
	strh r1, [r0]
	mov r0, #3
	add r1, sp, #0x28
	mov r2, #2
	mov r3, #0x1e
	bl BG_LoadPlttData
	mov r0, #0x83
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x83
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ScheduleWindowCopyToVram
	ldr r0, [sp, #0x1c]
	ldr r0, [r0]
	add r1, r0, #1
	ldr r0, [sp, #0x1c]
	str r1, [r0]
	b _0225FED2
_0225FB74:
	mov r1, #0x10
	ldr r3, [sp, #0x1c]
	mov r0, #2
	add r2, r1, #0
	str r0, [sp]
	mov r0, #1
	sub r2, #0x20
	add r3, r3, #4
	bl ov01_021EFCF8
	ldr r0, [sp, #0x1c]
	ldr r0, [r0]
	add r1, r0, #1
	ldr r0, [sp, #0x1c]
	str r1, [r0]
	b _0225FED2
_0225FB94:
	mov r3, #0x8f
	lsl r3, r3, #2
	ldr r0, [r4, r3]
	sub r0, r0, #1
	str r0, [r4, r3]
	ldr r0, [r4, r3]
	cmp r0, #0
	bne _0225FBD2
	mov r0, #3
	lsl r0, r0, #0xe
	str r0, [sp]
	add r0, r3, #0
	add r0, #0xe4
	str r0, [sp, #4]
	ldr r0, _0225FDEC ; =0x04000010
	mov r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	mov r0, #4
	str r0, [sp, #0x10]
	add r0, r3, #0
	sub r0, #0x2c
	add r0, r4, r0
	mov r2, #0xbf
	add r3, #0x6e
	bl ov01_021F12E8
	mov r0, #0x87
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r4, r0]
_0225FBD2:
	ldr r0, [sp, #0x1c]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _0225FBFE
	mov r0, #0x8f
	mov r1, #6
	lsl r0, r0, #2
	str r1, [r4, r0]
	ldr r0, [sp, #0x1c]
	ldr r0, [r0]
	add r1, r0, #1
	ldr r0, [sp, #0x1c]
	str r1, [r0]
	b _0225FED2
_0225FBEE:
	mov r0, #0x8f
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	sub r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	cmp r1, #0
	blt _0225FC00
_0225FBFE:
	b _0225FED2
_0225FC00:
	sub r0, #0x1c
	ldr r0, [r4, r0]
	bl GF_Camera_GetDistance
	add r1, r0, #0
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0x89
	mov r2, #0x7d
	lsl r0, r0, #2
	lsl r2, r2, #0xe
	ldr r3, _0225FDF0 ; =0xFFFF6000
	add r0, r4, r0
	sub r2, r1, r2
	bl ov01_021EFEC8
	mov r0, #0x6e
	lsl r0, r0, #2
	ldr r2, _0225FDF4 ; =0x0000FFFF
	add r0, r4, r0
	mov r1, #0
	mov r3, #6
	bl ov01_021EFE34
	mov r0, #0x5f
	lsl r0, r0, #2
	mov r2, #0x1f
	add r0, r4, r0
	mov r1, #0xe7
	mvn r2, r2
	mov r3, #6
	bl ov01_021EFE34
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r0, #0x83
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	mov r3, #0x40
	str r1, [sp, #8]
	mov r1, #0x56
	str r1, [sp, #0xc]
	str r3, [sp, #0x10]
	mov r1, #0xf
	str r1, [sp, #0x14]
	sub r0, #0x18
	mov r1, #0x2b
	ldr r0, [r4, r0]
	add r2, r1, #0
	add r3, #0xf8
	bl ov01_021F0788
	mov r1, #0x2b
	mov r2, #0xe7
	add r0, sp, #0x38
	lsl r1, r1, #0xc
	lsl r2, r2, #0xc
	mov r3, #0
	bl ov01_021F074C
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl sub_020247D4
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r1, #1
	lsl r0, r1, #9
	str r1, [r4, r0]
	ldr r0, [sp, #0x1c]
	ldr r0, [r0]
	add r1, r0, #1
	ldr r0, [sp, #0x1c]
	str r1, [r0]
	mov r0, #0x8f
	mov r1, #4
	lsl r0, r0, #2
	str r1, [r4, r0]
	b _0225FED2
_0225FCAE:
	mov r0, #0x8f
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	sub r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	cmp r1, #0
	bge _0225FD5C
	sub r0, #0xac
	mov r2, #0x1f
	add r0, r4, r0
	mov r1, #0xe7
	mvn r2, r2
	mov r3, #6
	bl ov01_021EFE34
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r2, _0225FDF8 ; =0xFFFF0001
	add r0, r4, r0
	mov r1, #0
	mov r3, #6
	bl ov01_021EFE34
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r0, #0x83
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	sub r0, #0x14
	str r1, [sp, #8]
	mov r1, #0x56
	str r1, [sp, #0xc]
	mov r1, #0x40
	str r1, [sp, #0x10]
	mov r1, #0xf
	str r1, [sp, #0x14]
	mov r1, #0xd7
	add r3, r1, #0
	ldr r0, [r4, r0]
	add r2, r1, #0
	add r3, #0x61
	bl ov01_021F0788
	mov r1, #0xd7
	mov r2, #0xe7
	add r0, sp, #0x38
	lsl r1, r1, #0xc
	lsl r2, r2, #0xc
	mov r3, #1
	bl ov01_021F074C
	mov r0, #0x5d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl sub_020247D4
	mov r0, #0x5d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r1, #0x81
	mov r0, #1
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [sp, #0x1c]
	add r1, #0x38
	ldr r0, [r0]
	add r2, r0, #1
	ldr r0, [sp, #0x1c]
	str r2, [r0]
	mov r0, #2
	str r0, [r4, r1]
	b _0225FED2
_0225FD4C:
	mov r0, #0x8f
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	sub r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	cmp r1, #0
	blt _0225FD5E
_0225FD5C:
	b _0225FED2
_0225FD5E:
	sub r0, #0x98
	mov r2, #0x1f
	add r0, r4, r0
	mov r1, #0xe7
	mvn r2, r2
	mov r3, #6
	bl ov01_021EFE34
	mov r0, #0x1e
	lsl r0, r0, #4
	ldr r2, _0225FDF4 ; =0x0000FFFF
	add r0, r4, r0
	mov r1, #0
	mov r3, #6
	bl ov01_021EFE34
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r0, #0x83
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	sub r0, #0x10
	str r1, [sp, #8]
	mov r1, #0x56
	str r1, [sp, #0xc]
	mov r1, #0x40
	str r1, [sp, #0x10]
	mov r1, #0xf
	str r1, [sp, #0x14]
	mov r1, #0x81
	add r3, r1, #0
	ldr r0, [r4, r0]
	add r2, r1, #0
	add r3, #0xb7
	bl ov01_021F0788
	mov r1, #0x81
	mov r2, #0xe7
	add r0, sp, #0x38
	lsl r1, r1, #0xc
	lsl r2, r2, #0xc
	mov r3, #2
	bl ov01_021F074C
	mov r0, #0x5e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl sub_020247D4
	mov r0, #0x5e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x82
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r4, r0]
	ldr r0, [sp, #0x1c]
	ldr r0, [r0]
	add r1, r0, #1
	ldr r0, [sp, #0x1c]
	str r1, [r0]
	b _0225FED2
	nop
_0225FDE8: .word 0x000927C0
_0225FDEC: .word 0x04000010
_0225FDF0: .word 0xFFFF6000
_0225FDF4: .word 0x0000FFFF
_0225FDF8: .word 0xFFFF0001
_0225FDFC:
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov01_021EFF28
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	sub r1, r1, #4
	ldr r1, [r4, r1]
	bl GF_Camera_SetDistance
	mov r1, #2
	lsl r1, r1, #8
	ldr r0, [r4, r1]
	cmp r0, #0
	bne _0225FED2
	add r0, r1, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0225FED2
	add r1, #8
	ldr r0, [r4, r1]
	cmp r0, #0
	bne _0225FED2
	ldr r0, [sp, #0x1c]
	ldr r0, [r0]
	add r1, r0, #1
	ldr r0, [sp, #0x1c]
	str r1, [r0]
	b _0225FED2
_0225FE3A:
	mov r0, #0
	bl sub_0200FC20
	ldr r0, [sp, #0x1c]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _0225FE4C
	mov r0, #1
	str r0, [r1]
_0225FE4C:
	mov r0, #0x21
	lsl r0, r0, #4
	add r0, r4, r0
	bl ov01_021F12D0
	mov r0, #0x87
	lsl r0, r0, #2
	mov r6, #0
	add r7, r0, #0
	str r6, [r4, r0]
	add r5, r4, #0
	sub r7, #0x28
_0225FE64:
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_02024758
	ldr r0, [r5, r7]
	bl ov01_021F0780
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #3
	blt _0225FE64
	mov r1, #0x4f
	lsl r1, r1, #2
	add r0, r4, #0
	add r1, r4, r1
	bl ov01_021F06EC
	add r0, r4, #0
	bl ov01_021F05F4
	mov r0, #0x83
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ClearWindowTilemapAndCopyToVram
	mov r0, #0x83
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl RemoveWindow
	mov r0, #0x83
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl WindowArray_dtor
	mov r0, #3
	mov r1, #0x20
	mov r2, #0
	mov r3, #4
	bl BG_ClearCharDataRange
	ldr r0, [sp, #0x1c]
	mov r1, #3
	ldr r0, [r0, #0x10]
	ldr r0, [r0, #8]
	bl BgClearTilemapBufferAndCommit
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x18]
	bl ov01_021EFCDC
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
_0225FED2:
	mov r0, #0x87
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #1
	bne _0225FEE6
	sub r0, #0xc
	add r0, r4, r0
	mov r1, #2
	bl ov01_021F1310
_0225FEE6:
	mov r1, #0x5f
	mov r0, #0
	lsl r1, r1, #2
	str r0, [sp, #0x20]
	add r0, r4, r1
	add r1, #0x3c
	add r5, r4, #0
	str r0, [sp, #0x24]
	add r7, r4, r1
	add r6, r4, #0
_0225FEFA:
	mov r0, #2
	lsl r0, r0, #8
	ldr r0, [r5, r0]
	cmp r0, #1
	bne _0225FF68
	mov r0, #0x7d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl ov01_021F07E0
	cmp r0, #0
	beq _0225FF1A
	mov r0, #2
	mov r1, #0
	lsl r0, r0, #8
	str r1, [r5, r0]
_0225FF1A:
	ldr r0, [sp, #0x24]
	bl ov01_021EFE44
	add r0, r7, #0
	bl ov01_021EFE44
	mov r1, #0x6e
	lsl r1, r1, #2
	mov r0, #0x17
	ldr r1, [r6, r1]
	lsl r0, r0, #4
	lsl r1, r1, #0x10
	ldr r0, [r5, r0]
	lsr r1, r1, #0x10
	bl sub_02024818
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_020248AC
	add r3, r0, #0
	add r2, sp, #0x2c
	ldmia r3!, {r0, r1}
	mov ip, r2
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r1, ip
	str r0, [r2]
	mov r0, #0x5f
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	lsl r0, r0, #0xc
	str r0, [sp, #0x30]
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_020247D4
_0225FF68:
	ldr r0, [sp, #0x24]
	add r5, r5, #4
	add r0, #0x14
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x20]
	add r7, #0x14
	add r0, r0, #1
	add r6, #0x14
	str r0, [sp, #0x20]
	cmp r0, #3
	blt _0225FEFA
	mov r0, #0x83
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ScheduleWindowCopyToVram
	ldr r0, [sp, #0x1c]
	ldr r0, [r0]
	cmp r0, #7
	beq _0225FF96
	ldr r0, [r4]
	bl sub_0202457C
_0225FF96:
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov119_0225FA2C

	thumb_func_start ov119_0225FF9C
ov119_0225FF9C: ; 0x0225FF9C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	add r5, r1, #0
	add r6, r0, #0
	ldr r0, [r5]
	ldr r4, [r5, #0xc]
	cmp r0, #7
	bhi _02260074
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0225FFB8: ; jump table
	.short _0225FFC8 - _0225FFB8 - 2 ; case 0
	.short _02260054 - _0225FFB8 - 2 ; case 1
	.short _0226006E - _0225FFB8 - 2 ; case 2
	.short _0226007C - _0225FFB8 - 2 ; case 3
	.short _022600F2 - _0225FFB8 - 2 ; case 4
	.short _0226017E - _0225FFB8 - 2 ; case 5
	.short _022601CC - _0225FFB8 - 2 ; case 6
	.short _022601F4 - _0225FFB8 - 2 ; case 7
_0225FFC8:
	mov r1, #0x1f
	mov r0, #4
	lsl r1, r1, #4
	bl AllocFromHeap
	mov r2, #0x1f
	str r0, [r5, #0xc]
	mov r1, #0
	lsl r2, r2, #4
	bl memset
	ldr r0, [r5, #0x10]
	ldr r4, [r5, #0xc]
	ldr r1, [r0, #0x24]
	mov r0, #0x1d
	lsl r0, r0, #4
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #1
	add r0, #0x5c
	add r2, r1, #0
	bl ov01_021F05C4
	mov r0, #1
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #6
	str r0, [sp, #8]
	mov r0, #5
	str r0, [sp, #0xc]
	ldr r0, _02260248 ; =0x000927C0
	mov r2, #0x66
	str r0, [sp, #0x10]
	add r1, r4, #0
	lsl r2, r2, #2
	ldr r0, [r5, #0x20]
	add r1, #0x5c
	add r2, r4, r2
	mov r3, #0
	bl ov01_021F0614
	mov r0, #0
	str r0, [sp]
	mov r1, #0x66
	str r0, [sp, #4]
	add r0, r4, #0
	lsl r1, r1, #2
	mov r2, #2
	ldr r3, _0226024C ; =0xFFFE0000
	add r0, #0x5c
	add r1, r4, r1
	lsl r2, r2, #0x12
	bl ov01_021F0718
	mov r1, #0x73
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02260238
_02260054:
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	add r1, r0, #0
	sub r1, #0x11
	add r2, r1, #0
	add r3, r5, #4
	bl ov01_021EFCF8
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02260238
_0226006E:
	ldr r1, [r5, #4]
	cmp r1, #0
	bne _02260076
_02260074:
	b _02260238
_02260076:
	add r0, r0, #1
	str r0, [r5]
	b _02260238
_0226007C:
	mov r2, #1
	mov r0, #0xc
	lsl r2, r2, #0x14
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0
	lsr r3, r2, #7
	bl ov01_021EFEC8
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0xc
	str r0, [sp]
	add r0, r4, #0
	mov r2, #2
	ldr r1, _02260250 ; =0x0000019A
	add r0, #0x18
	lsl r2, r2, #0xc
	mov r3, #0
	bl ov01_021EFEC8
	mov r0, #0xc
	str r0, [sp]
	add r0, r4, #0
	mov r2, #2
	ldr r1, _02260250 ; =0x0000019A
	add r0, #0x30
	lsl r2, r2, #0xc
	mov r3, #0
	bl ov01_021EFEC8
	ldr r1, [r4, #0x18]
	ldr r2, [r4, #0x30]
	add r0, sp, #0x2c
	mov r3, #0
	bl ov01_021F074C
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x2c
	mov r2, #2
	bl sub_02024804
	add r0, r4, #0
	ldr r2, _02260254 ; =0x0000FFFF
	add r0, #0x48
	mov r1, #0
	mov r3, #0xc
	bl ov01_021EFE34
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02260238
_022600F2:
	add r0, r4, #0
	bl ov01_021EFF28
	mov r1, #2
	lsl r1, r1, #0x12
	add r6, r0, #0
	ldr r3, [r4]
	lsr r2, r1, #2
	sub r2, r3, r2
	add r0, sp, #0x14
	mov r3, #0
	bl ov01_021F074C
	add r3, sp, #0x14
	add r2, sp, #0x20
	ldmia r3!, {r0, r1}
	add r7, r2, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r1, r7, #0
	str r0, [r2]
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_020247D4
	add r0, r4, #0
	add r0, #0x18
	bl ov01_021EFF28
	add r0, r4, #0
	add r0, #0x30
	bl ov01_021EFF28
	ldr r1, [r4, #0x18]
	ldr r2, [r4, #0x30]
	add r0, sp, #0x2c
	mov r3, #0
	bl ov01_021F074C
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x2c
	bl sub_020247F4
	add r0, r4, #0
	add r0, #0x48
	bl ov01_021EFE44
	mov r0, #0x73
	ldr r1, [r4, #0x48]
	lsl r0, r0, #2
	lsl r1, r1, #0x10
	ldr r0, [r4, r0]
	lsr r1, r1, #0x10
	bl sub_02024818
	cmp r6, #1
	bne _02260238
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02260238
_0226017E:
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x1c]
	bl ov01_021FB514
	mov r0, #0x1d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl GF_Camera_GetDistance
	add r1, r0, #0
	mov r0, #8
	str r0, [sp]
	mov r0, #0x75
	mov r2, #0xfa
	lsl r0, r0, #2
	lsl r2, r2, #0xe
	mov r3, #0xa
	add r0, r4, r0
	sub r2, r1, r2
	lsl r3, r3, #0xc
	bl ov01_021EFEC8
	mov r0, #8
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	mov r2, #0
	str r0, [sp, #8]
	mov r0, #3
	mov r1, #0x12
	add r3, r2, #0
	bl BeginNormalPaletteFade
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02260238
_022601CC:
	mov r0, #0x75
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov01_021EFF28
	mov r1, #0x75
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	sub r1, r1, #4
	ldr r1, [r4, r1]
	bl GF_Camera_SetDistance
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02260238
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02260238
_022601F4:
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x1c]
	bl ov01_021FB4F4
	ldr r1, [r5, #0x14]
	cmp r1, #0
	beq _02260210
	mov r0, #1
	str r0, [r1]
_02260210:
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02024758
	mov r1, #0x66
	add r0, r4, #0
	lsl r1, r1, #2
	add r0, #0x5c
	add r1, r4, r1
	bl ov01_021F06EC
	add r0, r4, #0
	add r0, #0x5c
	bl ov01_021F05F4
	add r0, r5, #0
	add r1, r6, #0
	bl ov01_021EFCDC
_02260238:
	ldr r0, [r5]
	cmp r0, #7
	beq _02260244
	ldr r0, [r4, #0x5c]
	bl sub_0202457C
_02260244:
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02260248: .word 0x000927C0
_0226024C: .word 0xFFFE0000
_02260250: .word 0x0000019A
_02260254: .word 0x0000FFFF
	thumb_func_end ov119_0225FF9C

	thumb_func_start ov119_02260258
ov119_02260258: ; 0x02260258
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	str r0, [sp, #0x14]
	add r0, r1, #0
	ldr r0, [r0]
	str r1, [sp, #0x18]
	ldr r4, [r1, #0xc]
	cmp r0, #9
	bls _0226026C
	b _02260688
_0226026C:
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02260278: ; jump table
	.short _0226028C - _02260278 - 2 ; case 0
	.short _02260388 - _02260278 - 2 ; case 1
	.short _022603A8 - _02260278 - 2 ; case 2
	.short _022603C0 - _02260278 - 2 ; case 3
	.short _0226043C - _02260278 - 2 ; case 4
	.short _022604B8 - _02260278 - 2 ; case 5
	.short _0226052E - _02260278 - 2 ; case 6
	.short _0226056E - _02260278 - 2 ; case 7
	.short _022605B4 - _02260278 - 2 ; case 8
	.short _02260604 - _02260278 - 2 ; case 9
_0226028C:
	mov r1, #0x8a
	mov r0, #4
	lsl r1, r1, #2
	bl AllocFromHeap
	ldr r1, [sp, #0x18]
	mov r2, #0x8a
	str r0, [r1, #0xc]
	mov r1, #0
	lsl r2, r2, #2
	bl memset
	ldr r0, [sp, #0x18]
	mov r2, #1
	ldr r4, [r0, #0xc]
	ldr r0, [r0, #0x10]
	ldr r1, [r0, #0x24]
	mov r0, #0x82
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #3
	bl ov01_021F05C4
	mov r0, #1
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #6
	str r0, [sp, #8]
	mov r0, #5
	str r0, [sp, #0xc]
	ldr r0, _022605F4 ; =0x000927C0
	mov r2, #0x4f
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x18]
	lsl r2, r2, #2
	ldr r0, [r0, #0x20]
	add r1, r4, #0
	add r2, r4, r2
	mov r3, #0
	bl ov01_021F0614
	mov r7, #0x4f
	mov r6, #0
	add r5, r4, #0
	lsl r7, r7, #2
_022602EA:
	mov r0, #0
	mov r2, #0
	str r0, [sp]
	add r3, r2, #0
	str r0, [sp, #4]
	add r0, r4, #0
	add r1, r4, r7
	sub r3, #0x20
	bl ov01_021F0718
	mov r1, #0x17
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #3
	blt _022602EA
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #1
	bl AllocWindows
	mov r1, #2
	lsl r1, r1, #8
	str r0, [r4, r1]
	mov r3, #0
	str r3, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	ldr r0, [sp, #0x18]
	ldr r1, [r4, r1]
	ldr r0, [r0, #0x10]
	mov r2, #3
	ldr r0, [r0, #8]
	bl AddWindowParameterized
	mov r1, #0
	add r0, sp, #0x28
	strh r1, [r0]
	mov r0, #3
	add r1, sp, #0x28
	mov r2, #2
	mov r3, #0x1e
	bl BG_LoadPlttData
	mov r0, #2
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #2
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	bl ScheduleWindowCopyToVram
	mov r0, #4
	bl ov01_021F09BC
	mov r1, #0x81
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [sp, #0x18]
	ldr r0, [r0]
	add r1, r0, #1
	ldr r0, [sp, #0x18]
	str r1, [r0]
	b _02260688
_02260388:
	mov r1, #0x10
	ldr r3, [sp, #0x18]
	mov r0, #2
	add r2, r1, #0
	str r0, [sp]
	mov r0, #1
	sub r2, #0x20
	add r3, r3, #4
	bl ov01_021EFCF8
	ldr r0, [sp, #0x18]
	ldr r0, [r0]
	add r1, r0, #1
	ldr r0, [sp, #0x18]
	str r1, [r0]
	b _02260688
_022603A8:
	ldr r1, [sp, #0x18]
	ldr r1, [r1, #4]
	cmp r1, #0
	beq _022603D0
	add r1, r0, #1
	ldr r0, [sp, #0x18]
	str r1, [r0]
	mov r0, #0x89
	mov r1, #0
	lsl r0, r0, #2
	strh r1, [r4, r0]
	b _02260688
_022603C0:
	mov r0, #0x89
	lsl r0, r0, #2
	ldrsh r1, [r4, r0]
	sub r1, r1, #1
	strh r1, [r4, r0]
	ldrsh r1, [r4, r0]
	cmp r1, #0
	ble _022603D2
_022603D0:
	b _02260688
_022603D2:
	sub r0, #0xa8
	mov r1, #0x1f
	add r0, r4, r0
	mvn r1, r1
	mov r2, #0xe0
	mov r3, #5
	bl ov01_021EFE34
	mov r1, #2
	ldr r2, _022605F8 ; =0xFFFE0000
	add r0, sp, #0x38
	lsl r1, r1, #0x12
	mov r3, #0
	bl ov01_021F074C
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl sub_020247D4
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x6e
	lsl r0, r0, #2
	ldr r2, _022605FC ; =0x0000FFFF
	add r0, r4, r0
	mov r1, #0
	mov r3, #5
	bl ov01_021EFE34
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #2
	bl sub_0202487C
	mov r1, #0x7d
	mov r3, #1
	lsl r1, r1, #2
	str r3, [r4, r1]
	ldr r0, [sp, #0x18]
	add r1, #0x30
	ldr r0, [r0]
	add r2, r0, #1
	ldr r0, [sp, #0x18]
	str r2, [r0]
	strh r3, [r4, r1]
	b _02260688
_0226043C:
	mov r0, #0x89
	lsl r0, r0, #2
	ldrsh r1, [r4, r0]
	sub r1, r1, #1
	strh r1, [r4, r0]
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bgt _02260548
	sub r0, #0x94
	mov r1, #0x1f
	add r0, r4, r0
	mvn r1, r1
	mov r2, #0xe0
	mov r3, #5
	bl ov01_021EFE34
	mov r1, #0xd
	ldr r2, _022605F8 ; =0xFFFE0000
	add r0, sp, #0x38
	lsl r1, r1, #0x10
	mov r3, #0
	bl ov01_021F074C
	mov r0, #0x5d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl sub_020247D4
	mov r0, #0x5d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r2, _02260600 ; =0xFFFF0001
	add r0, r4, r0
	mov r1, #0
	mov r3, #5
	bl ov01_021EFE34
	mov r0, #0x5d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #2
	bl sub_0202487C
	mov r1, #0x7e
	mov r0, #1
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [sp, #0x18]
	add r1, #0x2c
	ldr r0, [r0]
	add r2, r0, #1
	ldr r0, [sp, #0x18]
	str r2, [r0]
	mov r0, #3
	strh r0, [r4, r1]
	b _02260688
_022604B8:
	mov r0, #0x89
	lsl r0, r0, #2
	ldrsh r1, [r4, r0]
	sub r1, r1, #1
	strh r1, [r4, r0]
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bgt _02260548
	sub r0, #0x80
	mov r1, #0x1f
	add r0, r4, r0
	mvn r1, r1
	mov r2, #0xe0
	mov r3, #5
	bl ov01_021EFE34
	mov r1, #3
	ldr r2, _022605F8 ; =0xFFFE0000
	add r0, sp, #0x38
	lsl r1, r1, #0x10
	mov r3, #0
	bl ov01_021F074C
	mov r0, #0x5e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl sub_020247D4
	mov r0, #0x5e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x1e
	lsl r0, r0, #4
	ldr r2, _022605FC ; =0x0000FFFF
	add r0, r4, r0
	mov r1, #0
	mov r3, #5
	bl ov01_021EFE34
	mov r0, #0x5e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #2
	bl sub_0202487C
	mov r0, #0x7f
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r4, r0]
	ldr r0, [sp, #0x18]
	ldr r0, [r0]
	add r1, r0, #1
	ldr r0, [sp, #0x18]
	str r1, [r0]
	b _02260688
_0226052E:
	mov r1, #0x7d
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	cmp r0, #0
	bne _02260548
	add r0, r1, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _02260548
	add r1, #8
	ldr r0, [r4, r1]
	cmp r0, #0
	beq _0226054A
_02260548:
	b _02260688
_0226054A:
	mov r7, #0x17
	mov r6, #0
	add r5, r4, #0
	lsl r7, r7, #4
_02260552:
	ldr r0, [r5, r7]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #3
	blt _02260552
	ldr r0, [sp, #0x18]
	ldr r0, [r0]
	add r1, r0, #1
	ldr r0, [sp, #0x18]
	str r1, [r0]
	b _02260688
_0226056E:
	mov r0, #0xf
	mov r1, #1
	str r0, [sp]
	mov r0, #0x81
	lsl r0, r0, #2
	lsl r3, r1, #9
	ldr r0, [r4, r0]
	ldr r3, [r4, r3]
	add r2, r1, #0
	bl ov01_021F0A0C
	mov r0, #0x82
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl GF_Camera_GetDistance
	add r1, r0, #0
	mov r0, #0x40
	str r0, [sp]
	mov r0, #0x83
	mov r2, #0xfa
	lsl r0, r0, #2
	lsl r2, r2, #0xe
	mov r3, #0xa
	add r0, r4, r0
	sub r2, r1, r2
	lsl r3, r3, #0xc
	bl ov01_021EFEC8
	ldr r0, [sp, #0x18]
	ldr r0, [r0]
	add r1, r0, #1
	ldr r0, [sp, #0x18]
	str r1, [r0]
	b _02260688
_022605B4:
	mov r0, #0x81
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov01_021F0A4C
	add r5, r0, #0
	mov r0, #2
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	bl ScheduleWindowCopyToVram
	mov r0, #0x83
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov01_021EFF28
	mov r1, #0x83
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	sub r1, r1, #4
	ldr r1, [r4, r1]
	bl GF_Camera_SetDistance
	cmp r5, #1
	bne _02260688
	ldr r0, [sp, #0x18]
	ldr r0, [r0]
	add r1, r0, #1
	ldr r0, [sp, #0x18]
	str r1, [r0]
	b _02260688
	nop
_022605F4: .word 0x000927C0
_022605F8: .word 0xFFFE0000
_022605FC: .word 0x0000FFFF
_02260600: .word 0xFFFF0001
_02260604:
	mov r0, #0
	bl sub_0200FC20
	ldr r0, [sp, #0x18]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _02260616
	mov r0, #1
	str r0, [r1]
_02260616:
	mov r7, #0x17
	mov r6, #0
	add r5, r4, #0
	lsl r7, r7, #4
_0226061E:
	ldr r0, [r5, r7]
	bl sub_02024758
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #3
	blt _0226061E
	mov r1, #0x4f
	lsl r1, r1, #2
	add r0, r4, #0
	add r1, r4, r1
	bl ov01_021F06EC
	add r0, r4, #0
	bl ov01_021F05F4
	mov r0, #0x81
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov01_021F09EC
	mov r0, #2
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	bl ClearWindowTilemapAndCopyToVram
	mov r0, #2
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	bl RemoveWindow
	mov r0, #2
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	mov r1, #1
	bl WindowArray_dtor
	mov r0, #3
	mov r1, #0x20
	mov r2, #0
	mov r3, #4
	bl BG_ClearCharDataRange
	ldr r0, [sp, #0x18]
	mov r1, #3
	ldr r0, [r0, #0x10]
	ldr r0, [r0, #8]
	bl BgClearTilemapBufferAndCommit
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x14]
	bl ov01_021EFCDC
_02260688:
	mov r1, #0x5f
	mov r0, #0
	lsl r1, r1, #2
	str r0, [sp, #0x1c]
	add r0, r4, r1
	add r1, #0x3c
	add r5, r4, #0
	str r0, [sp, #0x20]
	add r7, r4, r1
	add r6, r4, #0
_0226069C:
	mov r0, #0x7d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #1
	bne _02260704
	ldr r0, [sp, #0x20]
	bl ov01_021EFE44
	str r0, [sp, #0x24]
	add r0, r7, #0
	bl ov01_021EFE44
	ldr r0, [sp, #0x24]
	cmp r0, #0
	beq _022606C2
	mov r0, #0x7d
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
_022606C2:
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_020248AC
	add r3, r0, #0
	add r2, sp, #0x2c
	ldmia r3!, {r0, r1}
	mov ip, r2
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r1, ip
	str r0, [r2]
	mov r0, #0x5f
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	lsl r0, r0, #0xc
	str r0, [sp, #0x30]
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_020247D4
	mov r1, #0x6e
	lsl r1, r1, #2
	mov r0, #0x17
	ldr r1, [r6, r1]
	lsl r0, r0, #4
	lsl r1, r1, #0x10
	ldr r0, [r5, r0]
	lsr r1, r1, #0x10
	bl sub_02024818
_02260704:
	ldr r0, [sp, #0x20]
	add r5, r5, #4
	add r0, #0x14
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x1c]
	add r7, #0x14
	add r0, r0, #1
	add r6, #0x14
	str r0, [sp, #0x1c]
	cmp r0, #3
	blt _0226069C
	ldr r0, [sp, #0x18]
	ldr r0, [r0]
	cmp r0, #9
	beq _02260728
	ldr r0, [r4]
	bl sub_0202457C
_02260728:
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov119_02260258
