	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov61_021E5900
ov61_021E5900: ; 0x021E5900
	push {r3, r4, r5, lr}
	sub sp, #0x10
	mov r2, #1
	add r5, r0, #0
	mov r0, #3
	mov r1, #0x2e
	lsl r2, r2, #0x12
	bl CreateHeap
	ldr r1, _021E5A20 ; =0x00000598
	add r0, r5, #0
	mov r2, #0x2e
	bl OverlayManager_CreateAndGetData
	ldr r2, _021E5A20 ; =0x00000598
	add r4, r0, #0
	mov r1, #0
	bl MI_CpuFill8
	add r0, r4, #0
	mov r1, #0x2e
	add r0, #0x20
	mov r2, #0x20
	str r1, [r4, #4]
	bl GF_ExpHeap_FndInitAllocator
	add r0, r5, #0
	bl OverlayManager_GetField18
	add r5, r0, #0
	ldr r0, [r5, #4]
	bl Options_GetFrame
	mov r1, #0xe9
	lsl r1, r1, #2
	strb r0, [r4, r1]
	ldr r0, _021E5A24 ; =0x00000578
	mov r1, #0
	add r5, #8
	add r2, r4, #0
_021E5950:
	add r1, r1, #1
	str r5, [r2, r0]
	add r5, #0xec
	add r2, r2, #4
	cmp r1, #3
	blt _021E5950
	ldr r0, _021E5A28 ; =0x000003A5
	mov r1, #1
	strb r1, [r4, r0]
	ldr r0, _021E5A2C ; =ov61_021E60B8
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	bl sub_0201A108
	bl ov61_021E60C8
	ldr r0, [r4, #4]
	bl ov61_021E60E8
	add r0, r4, #0
	bl ov61_021E6140
	ldr r0, [r4, #4]
	bl BgConfig_Alloc
	str r0, [r4, #8]
	mov r1, #1
	mov r0, #0
	str r0, [sp, #4]
	str r1, [sp]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	add r0, sp, #0
	bl SetBothScreensModesAndDisable
	ldr r0, [r4, #8]
	ldr r1, [r4, #4]
	bl ov61_021E6350
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	mov r0, #2
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, _021E5A30 ; =gMain + 0x60
	mov r1, #1
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	bl sub_02020080
	add r0, r4, #0
	bl ov61_021E6B6C
	ldr r0, [r4, #8]
	ldr r1, [r4, #4]
	bl ov61_021E6C3C
	add r0, r4, #0
	bl ov61_021E6508
	add r0, r4, #0
	bl ov61_021E6564
	ldr r0, [r4, #4]
	bl sub_02023114
	str r0, [r4, #0x10]
	ldr r0, [r4, #4]
	ldr r1, [r4, #0x10]
	bl sub_02019014
	ldr r1, _021E5A34 ; =0x00000574
	str r0, [r4, r1]
	add r0, r4, #0
	bl ov61_021E6488
	add r0, r4, #0
	bl ov61_021E6944
	add r0, r4, #0
	bl ov61_021E6FC4
	mov r0, #0
	bl TextFlags_SetCanABSpeedUpPrint
	mov r0, #1
	bl sub_02002B50
	mov r0, #0
	bl sub_02002B8C
	mov r0, #1
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_021E5A20: .word 0x00000598
_021E5A24: .word 0x00000578
_021E5A28: .word 0x000003A5
_021E5A2C: .word ov61_021E60B8
_021E5A30: .word gMain + 0x60
_021E5A34: .word 0x00000574
	thumb_func_end ov61_021E5900

	thumb_func_start ov61_021E5A38
ov61_021E5A38: ; 0x021E5A38
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	add r5, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r5]
	add r4, r0, #0
	mov r6, #0
	cmp r1, #0xc
	bls _021E5A4E
	b _021E5E86
_021E5A4E:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E5A5A: ; jump table
	.short _021E5A74 - _021E5A5A - 2 ; case 0
	.short _021E5AA6 - _021E5A5A - 2 ; case 1
	.short _021E5AB4 - _021E5A5A - 2 ; case 2
	.short _021E5AFE - _021E5A5A - 2 ; case 3
	.short _021E5B4C - _021E5A5A - 2 ; case 4
	.short _021E5B70 - _021E5A5A - 2 ; case 5
	.short _021E5CF2 - _021E5A5A - 2 ; case 6
	.short _021E5D72 - _021E5A5A - 2 ; case 7
	.short _021E5D8C - _021E5A5A - 2 ; case 8
	.short _021E5DA2 - _021E5A5A - 2 ; case 9
	.short _021E5DBC - _021E5A5A - 2 ; case 10
	.short _021E5E52 - _021E5A5A - 2 ; case 11
	.short _021E5E78 - _021E5A5A - 2 ; case 12
_021E5A74:
	mov r1, #7
	bl ov61_021E6DFC
	mov r0, #2
	add r1, r6, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	add r1, r6, #0
	bl GX_EngineAToggleLayers
	mov r0, #6
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4, #4]
	add r2, r1, #0
	str r0, [sp, #8]
	add r0, r6, #0
	add r3, r0, #0
	bl sub_0200FA24
	mov r0, #1
	str r0, [r5]
	b _021E5E86
_021E5AA6:
	bl sub_0200FB5C
	cmp r0, #0
	beq _021E5B94
	mov r0, #2
	str r0, [r5]
	b _021E5E86
_021E5AB4:
	ldr r0, _021E5E0C ; =0x00000574
	ldr r0, [r4, r0]
	bl sub_020190E8
	cmp r0, #0
	beq _021E5B94
	add r0, r6, #0
	str r0, [sp]
	ldr r0, _021E5E10 ; =0x0001020F
	ldr r1, _021E5E14 ; =0x000003A5
	str r0, [sp, #4]
	ldrb r0, [r4, r1]
	mov r2, #1
	mov r3, #0xbe
	str r0, [sp, #8]
	add r0, r1, #0
	add r0, #0xb
	add r0, r4, r0
	str r0, [sp, #0xc]
	sub r1, #9
	ldr r0, [r4, r1]
	ldr r1, [r4, #4]
	bl ov61_021E6D78
	ldr r1, _021E5E18 ; =0x000003A6
	strb r0, [r4, r1]
	mov r0, #2
	add r1, r6, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	add r1, r6, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	str r0, [r5]
	b _021E5E86
_021E5AFE:
	mov r1, #0xe5
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	mov r2, #1
	add r0, r0, #1
	str r0, [sp]
	ldr r0, _021E5E10 ; =0x0001020F
	mov r3, #0xbe
	str r0, [sp, #4]
	add r0, r1, #0
	add r0, #0x11
	ldrb r0, [r4, r0]
	str r0, [sp, #8]
	add r0, r1, #0
	add r0, #0x1c
	add r0, r4, r0
	str r0, [sp, #0xc]
	add r1, #8
	ldr r0, [r4, r1]
	ldr r1, [r4, #4]
	bl ov61_021E6D78
	ldr r1, _021E5E18 ; =0x000003A6
	strb r0, [r4, r1]
	add r0, r4, #0
	mov r1, #8
	bl ov61_021E6DFC
	mov r0, #2
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	str r0, [r5]
	b _021E5E86
_021E5B4C:
	ldr r0, _021E5E18 ; =0x000003A6
	ldrb r0, [r4, r0]
	bl sub_02020094
	cmp r0, #0
	bne _021E5B94
	mov r0, #0x3b
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl String_dtor
	mov r0, #0x3b
	add r1, r6, #0
	lsl r0, r0, #4
	str r1, [r4, r0]
	mov r0, #5
	str r0, [r5]
	b _021E5E86
_021E5B70:
	ldr r0, _021E5E0C ; =0x00000574
	ldr r0, [r4, r0]
	bl sub_020190E8
	cmp r0, #0
	beq _021E5B94
	add r0, r4, #0
	bl ov61_021E6E40
	cmp r0, #7
	beq _021E5B8E
	cmp r0, #8
	bne _021E5B90
	mov r6, #1
	b _021E5B90
_021E5B8E:
	mov r6, #2
_021E5B90:
	cmp r0, #8
	bls _021E5B96
_021E5B94:
	b _021E5E86
_021E5B96:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E5BA2: ; jump table
	.short _021E5E86 - _021E5BA2 - 2 ; case 0
	.short _021E5C1E - _021E5BA2 - 2 ; case 1
	.short _021E5C32 - _021E5BA2 - 2 ; case 2
	.short _021E5C1E - _021E5BA2 - 2 ; case 3
	.short _021E5C32 - _021E5BA2 - 2 ; case 4
	.short _021E5BB4 - _021E5BA2 - 2 ; case 5
	.short _021E5C5E - _021E5BA2 - 2 ; case 6
	.short _021E5C48 - _021E5BA2 - 2 ; case 7
	.short _021E5CB2 - _021E5BA2 - 2 ; case 8
_021E5BB4:
	ldr r0, _021E5E1C ; =0x00000584
	mov r1, #2
	str r1, [r4, r0]
	mov r2, #0
	mov r0, #0xe5
	str r2, [sp, #0x14]
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r0, #8
	add r1, r1, #4
	str r1, [sp]
	ldr r1, _021E5E10 ; =0x0001020F
	mov r3, #0xbe
	str r1, [sp, #4]
	str r2, [sp, #8]
	add r1, sp, #0x14
	str r1, [sp, #0xc]
	ldr r0, [r4, r0]
	ldr r1, [r4, #4]
	bl ov61_021E6D78
	ldr r0, [sp, #0x14]
	bl String_dtor
	mov r0, #0xe5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	lsl r1, r0, #2
	ldr r0, _021E5E20 ; =0x021E7398
	ldr r0, [r0, r1]
	mov r1, #0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl PlayCry
	add r0, r4, #0
	mov r1, #7
	bl ov61_021E6DFC
	mov r0, #2
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	add r0, r4, #0
	bl ov61_021E7220
	mov r0, #5
	str r0, [r5]
	b _021E5E86
_021E5C1E:
	ldr r1, _021E5E24 ; =0xFFFFF800
	ldr r0, _021E5E28 ; =0x0000039A
	strh r1, [r4, r0]
	mov r0, #6
	str r0, [r5]
	ldr r0, _021E5E2C ; =0x00000607
	asr r1, r1, #2
	bl sub_02006134
	b _021E5E86
_021E5C32:
	mov r1, #2
	ldr r0, _021E5E28 ; =0x0000039A
	lsl r1, r1, #0xa
	strh r1, [r4, r0]
	mov r0, #6
	str r0, [r5]
	ldr r0, _021E5E2C ; =0x00000607
	ldr r1, _021E5E30 ; =0xFFFFFE00
	bl sub_02006134
	b _021E5E86
_021E5C48:
	mov r0, #2
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #7
	str r0, [r5]
	b _021E5E86
_021E5C5E:
	mov r2, #0xe5
	lsl r2, r2, #2
	ldr r7, [r4, r2]
	add r0, r4, #0
	add r3, r7, #3
	mov r1, #0x78
	sub r2, #0x54
	add r0, #0x70
	mul r1, r3
	add r0, r0, r1
	add r2, r4, r2
	lsl r1, r7, #3
	add r1, r2, r1
	bl ov61_021E6820
	mov r2, #0xe5
	lsl r2, r2, #2
	ldr r1, [r4, r2]
	add r0, r4, #0
	add r3, r1, #3
	mov r1, #0x78
	add r0, #0x70
	mul r1, r3
	sub r2, #0x3c
	add r0, r0, r1
	add r1, r4, r2
	bl ov61_021E6814
	mov r1, #0x36
	add r0, r4, #0
	lsl r1, r1, #4
	add r0, #0x70
	add r1, r4, r1
	bl ov61_021E6814
	add r0, r4, #0
	mov r1, #1
	add r0, #0xc8
	str r1, [r0]
	mov r0, #0xa
	str r0, [r5]
	b _021E5E86
_021E5CB2:
	mov r0, #0xea
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #2
	bne _021E5D7E
	ldr r0, _021E5E1C ; =0x00000584
	mov r1, #0
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #7
	bl ov61_021E6DFC
	mov r0, #2
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #0xed
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov61_021E7248
	mov r0, #0xea
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #9
	str r0, [r5]
	b _021E5E86
_021E5CF2:
	ldr r1, _021E5E28 ; =0x0000039A
	ldrsh r1, [r4, r1]
	bl ov61_021E6AE0
	cmp r0, #0
	beq _021E5D7E
	ldr r0, _021E5E1C ; =0x00000584
	mov r1, #2
	str r1, [r4, r0]
	add r2, r6, #0
	mov r0, #0xe5
	str r2, [sp, #0x10]
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r0, #8
	add r1, r1, #4
	str r1, [sp]
	ldr r1, _021E5E10 ; =0x0001020F
	mov r3, #0xbe
	str r1, [sp, #4]
	str r2, [sp, #8]
	add r1, sp, #0x10
	str r1, [sp, #0xc]
	ldr r0, [r4, r0]
	ldr r1, [r4, #4]
	bl ov61_021E6D78
	ldr r0, [sp, #0x10]
	bl String_dtor
	mov r0, #0xe5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	lsl r1, r0, #2
	ldr r0, _021E5E20 ; =0x021E7398
	ldr r0, [r0, r1]
	add r1, r6, #0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl PlayCry
	mov r0, #0xea
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #1
	beq _021E5D5E
	mov r0, #2
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
_021E5D5E:
	add r0, r4, #0
	bl ov61_021E7220
	mov r0, #0xea
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #5
	str r0, [r5]
	b _021E5E86
_021E5D72:
	ldr r2, _021E5E34 ; =0xFFFFEA20
	add r1, r6, #0
	bl ov61_021E7268
	cmp r0, #0
	bne _021E5D80
_021E5D7E:
	b _021E5E86
_021E5D80:
	add r0, r4, #0
	bl ov61_021E7220
	mov r0, #8
	str r0, [r5]
	b _021E5E86
_021E5D8C:
	bl ov61_021E68E4
	cmp r0, #0
	beq _021E5E86
	mov r0, #0xea
	mov r1, #2
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #3
	str r0, [r5]
	b _021E5E86
_021E5DA2:
	ldr r1, _021E5E34 ; =0xFFFFEA20
	add r2, r6, #0
	bl ov61_021E7268
	cmp r0, #0
	beq _021E5E86
	add r0, r4, #0
	add r1, r6, #0
	bl ov61_021E6B2C
	mov r0, #2
	str r0, [r5]
	b _021E5E86
_021E5DBC:
	mov r0, #0xa
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4, #4]
	ldr r3, _021E5E38 ; =0x00007FFF
	str r0, [sp, #8]
	mov r0, #4
	add r1, r6, #0
	add r2, r6, #0
	bl sub_0200FA24
	ldr r7, _021E5E1C ; =0x00000584
	mov r0, #1
	str r0, [r4, r7]
	ldr r1, _021E5E3C ; =0x0000DCC0
	add r0, sp, #0x10
	strh r1, [r0, #0x1c]
	ldr r1, _021E5E40 ; =0x000011A4
	ldr r3, _021E5E44 ; =0x021E73A4
	strh r1, [r0, #0x1e]
	ldmia r3!, {r0, r1}
	add r2, sp, #0x30
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	sub r7, #0x10
	str r0, [r2]
	mov r0, #0x19
	lsl r0, r0, #0xe
	str r0, [sp, #0x3c]
	ldr r0, [r4, r7]
	add r1, sp, #0x2c
	mov r2, #8
	bl sub_02019040
	mov r0, #0xb
	str r0, [r5]
	ldr r0, _021E5E48 ; =0x000005F8
	b _021E5E4C
	nop
_021E5E0C: .word 0x00000574
_021E5E10: .word 0x0001020F
_021E5E14: .word 0x000003A5
_021E5E18: .word 0x000003A6
_021E5E1C: .word 0x00000584
_021E5E20: .word 0x021E7398
_021E5E24: .word 0xFFFFF800
_021E5E28: .word 0x0000039A
_021E5E2C: .word 0x00000607
_021E5E30: .word 0xFFFFFE00
_021E5E34: .word 0xFFFFEA20
_021E5E38: .word 0x00007FFF
_021E5E3C: .word 0x0000DCC0
_021E5E40: .word 0x000011A4
_021E5E44: .word 0x021E73A4
_021E5E48: .word 0x000005F8
_021E5E4C:
	bl PlaySE
	b _021E5E86
_021E5E52:
	bl sub_0200FB5C
	cmp r0, #0
	beq _021E5E86
	mov r0, #0x10
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4, #4]
	add r1, r6, #0
	str r0, [sp, #8]
	ldr r3, _021E5F50 ; =0x00007FFF
	mov r0, #3
	add r2, r1, #0
	bl sub_0200FA24
	mov r0, #0xc
	str r0, [r5]
	b _021E5E86
_021E5E78:
	bl sub_0200FB5C
	cmp r0, #0
	beq _021E5E86
	add sp, #0x40
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E5E86:
	cmp r6, #0
	beq _021E5EDC
	cmp r6, #1
	add r0, sp, #0x10
	bne _021E5EAE
	ldr r1, _021E5F54 ; =0x0000DCC0
	ldr r3, _021E5F58 ; =_021E7380
	strh r1, [r0, #8]
	ldr r1, _021E5F5C ; =0x000011A4
	add r2, sp, #0x1c
	strh r1, [r0, #0xa]
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r1, #0
	str r0, [r2]
	mov r0, #0x19
	lsl r0, r0, #0xe
	str r0, [sp, #0x28]
	b _021E5ECA
_021E5EAE:
	ldr r1, _021E5F60 ; =0x0000EA20
	ldr r3, _021E5F64 ; =0x021E73BC
	strh r1, [r0, #8]
	ldr r1, _021E5F68 ; =0x00001024
	add r2, sp, #0x1c
	strh r1, [r0, #0xa]
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r1, #2
	str r0, [r2]
	mov r0, #0xf
	lsl r0, r0, #0xe
	str r0, [sp, #0x28]
_021E5ECA:
	mov r0, #0xeb
	lsl r0, r0, #2
	str r1, [r4, r0]
	ldr r0, _021E5F6C ; =0x00000574
	add r1, sp, #0x18
	ldr r0, [r4, r0]
	mov r2, #8
	bl sub_02019040
_021E5EDC:
	ldr r0, _021E5F70 ; =0x00000584
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _021E5EFA
	mov r0, #0xd6
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov61_021E682C
	mov r0, #0x36
	lsl r0, r0, #4
	add r0, r4, r0
	bl ov61_021E682C
	b _021E5F1E
_021E5EFA:
	cmp r0, #2
	bne _021E5F06
	add r0, r4, #0
	bl ov61_021E6894
	b _021E5F1E
_021E5F06:
	mov r1, #0xd1
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	mov r2, #0
	str r2, [r0]
	add r0, r1, #0
	add r0, #8
	ldr r0, [r4, r0]
	add r1, #0x10
	str r2, [r0]
	ldr r0, [r4, r1]
	str r2, [r0]
_021E5F1E:
	mov r0, #0xda
	lsl r0, r0, #2
	add r3, r4, r0
	ldr r2, [r3, #4]
	mov r0, #1
	ldr r1, [r2]
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [r2]
	ldr r2, [r3, #4]
	ldr r0, [r2, #8]
	ldr r1, [r2]
	ldrh r0, [r0, #4]
	lsl r0, r0, #0xc
	cmp r1, r0
	blt _021E5F42
	mov r0, #0
	str r0, [r2]
_021E5F42:
	add r0, r4, #0
	bl ov61_021E61FC
	mov r0, #0
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E5F50: .word 0x00007FFF
_021E5F54: .word 0x0000DCC0
_021E5F58: .word _021E7380
_021E5F5C: .word 0x000011A4
_021E5F60: .word 0x0000EA20
_021E5F64: .word 0x021E73BC
_021E5F68: .word 0x00001024
_021E5F6C: .word 0x00000574
_021E5F70: .word 0x00000584
	thumb_func_end ov61_021E5A38

	thumb_func_start ov61_021E5F74
ov61_021E5F74: ; 0x021E5F74
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	add r0, r5, #0
	bl OverlayManager_GetField18
	add r6, r0, #0
	mov r0, #0
	bl TextFlags_SetCanABSpeedUpPrint
	mov r0, #0
	bl sub_02002B50
	mov r0, #0
	bl sub_02002B8C
	mov r0, #0xe5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	str r0, [r6]
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	ldr r0, _021E6060 ; =0x00000574
	ldr r0, [r4, r0]
	bl sub_02019030
	ldr r0, [r4, #0x10]
	bl sub_02023120
	add r0, r4, #0
	bl ov61_021E6730
	add r0, r4, #0
	bl ov61_021E6750
	mov r0, #0xed
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov61_021E6068
	ldr r0, _021E6064 ; =0x0000043C
	ldr r0, [r4, r0]
	bl sub_02024504
	mov r0, #0xed
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200A0D0
	mov r0, #0xee
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200A0D0
	mov r0, #0xef
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200A0D0
	mov r0, #0xf
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl sub_0200A0D0
	bl sub_0200B244
	bl sub_0202168C
	bl sub_02022608
	mov r0, #0xe7
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov61_021E6E30
	mov r0, #0x3a
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ov61_021E6E30
	ldr r0, [r4, #8]
	mov r1, #1
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #8]
	mov r1, #2
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #8]
	mov r1, #4
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #8]
	mov r1, #5
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #8]
	mov r1, #6
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #8]
	bl FreeToHeap
	ldr r0, [r4, #0xc]
	bl sub_02026F54
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0x2e
	bl DestroyHeap
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E6060: .word 0x00000574
_021E6064: .word 0x0000043C
	thumb_func_end ov61_021E5F74

	thumb_func_start ov61_021E6068
ov61_021E6068: ; 0x021E6068
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r7, #0
	add r4, r5, #0
	add r6, r5, #0
_021E6072:
	ldr r0, [r4, #0x18]
	bl sub_0200AEB0
	ldr r0, [r4, #0x1c]
	bl sub_0200B0A8
	ldr r0, [r5]
	ldr r1, [r4, #0x18]
	bl sub_0200A75C
	ldr r0, [r5, #4]
	ldr r1, [r4, #0x1c]
	bl sub_0200A75C
	ldr r0, [r5, #8]
	ldr r1, [r4, #0x20]
	bl sub_0200A75C
	ldr r0, [r5, #0xc]
	ldr r1, [r4, #0x24]
	bl sub_0200A75C
	ldr r0, [r6, #0x60]
	bl FreeToHeap
	ldr r0, [r6, #0x6c]
	bl FreeToHeap
	add r7, r7, #1
	add r4, #0x18
	add r6, r6, #4
	cmp r7, #3
	blt _021E6072
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov61_021E6068

	thumb_func_start ov61_021E60B8
ov61_021E60B8: ; 0x021E60B8
	push {r4, lr}
	add r4, r0, #0
	bl sub_0200B224
	ldr r0, [r4, #8]
	bl sub_0201EEB4
	pop {r4, pc}
	thumb_func_end ov61_021E60B8

	thumb_func_start ov61_021E60C8
ov61_021E60C8: ; 0x021E60C8
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E60E4 ; =0x021E7494
	add r3, sp, #0
	mov r2, #5
_021E60D2:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E60D2
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_021E60E4: .word 0x021E7494
	thumb_func_end ov61_021E60C8

	thumb_func_start ov61_021E60E8
ov61_021E60E8: ; 0x021E60E8
	push {r4, r5, lr}
	sub sp, #0x24
	add r4, r0, #0
	bl NNS_G2dInitOamManagerModule
	mov r0, #0
	str r0, [sp]
	mov r1, #0x80
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r3, #0x20
	str r3, [sp, #0xc]
	add r2, r0, #0
	str r4, [sp, #0x10]
	bl sub_0200B150
	ldr r5, _021E6138 ; =0x021E73F8
	add r3, sp, #0x14
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	ldr r1, _021E613C ; =0x00200010
	mov r2, #0x10
	str r4, [sp, #0x20]
	bl sub_020215C0
	mov r0, #3
	add r1, r4, #0
	bl sub_02022588
	bl sub_020216C8
	bl sub_02022638
	add sp, #0x24
	pop {r4, r5, pc}
	nop
_021E6138: .word 0x021E73F8
_021E613C: .word 0x00200010
	thumb_func_end ov61_021E60E8

	thumb_func_start ov61_021E6140
ov61_021E6140: ; 0x021E6140
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #4
	mov r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4, #4]
	mov r2, #2
	add r3, r1, #0
	bl sub_02026EB4
	str r0, [r4, #0xc]
	ldr r0, _021E61DC ; =0x04000060
	ldr r2, _021E61E0 ; =0xFFFFCFFF
	ldrh r1, [r0]
	add r3, r1, #0
	and r3, r2
	mov r1, #0x10
	orr r1, r3
	strh r1, [r0]
	ldrh r3, [r0]
	ldr r1, _021E61E4 ; =0x0000CFFB
	and r1, r3
	strh r1, [r0]
	ldrh r1, [r0]
	add r3, r1, #0
	and r3, r2
	mov r1, #8
	orr r1, r3
	strh r1, [r0]
	ldrh r1, [r0]
	add r3, r4, #0
	and r2, r1
	mov r1, #0x20
	orr r1, r2
	strh r1, [r0]
	ldr r1, _021E61E8 ; =0x00001084
	ldr r0, _021E61EC ; =0x00000588
	mov r2, #0
_021E6190:
	add r2, r2, #1
	strh r1, [r3, r0]
	add r3, r3, #2
	cmp r2, #8
	blt _021E6190
	ldr r0, _021E61EC ; =0x00000588
	add r0, r4, r0
	bl G3X_SetEdgeColorTable
	mov r1, #0
	ldr r0, _021E61F0 ; =0x000043FF
	ldr r2, _021E61F4 ; =0x00007FFF
	mov r3, #0x3f
	str r1, [sp]
	bl G3X_SetClearColor
	mov r0, #0
	ldr r2, _021E61F8 ; =0xFFFFF000
	add r1, r0, #0
	add r3, r0, #0
	bl NNS_G3dGlbLightVector
	ldr r1, _021E61F4 ; =0x00007FFF
	mov r0, #0
	bl NNS_G3dGlbLightColor
	ldr r0, _021E61F4 ; =0x00007FFF
	mov r2, #0
	add r1, r0, #0
	bl NNS_G3dGlbMaterialColorDiffAmb
	ldr r0, _021E61F4 ; =0x00007FFF
	mov r2, #0
	add r1, r0, #0
	bl NNS_G3dGlbMaterialColorSpecEmi
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_021E61DC: .word 0x04000060
_021E61E0: .word 0xFFFFCFFF
_021E61E4: .word 0x0000CFFB
_021E61E8: .word 0x00001084
_021E61EC: .word 0x00000588
_021E61F0: .word 0x000043FF
_021E61F4: .word 0x00007FFF
_021E61F8: .word 0xFFFFF000
	thumb_func_end ov61_021E6140

	thumb_func_start ov61_021E61FC
ov61_021E61FC: ; 0x021E61FC
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, _021E623C ; =0x0000043C
	ldr r0, [r4, r0]
	bl sub_0202457C
	bl sub_02026E48
	mov r1, #0
	mov r0, #0x11
	add r2, r1, #0
	bl NNS_G3dGeBufferOP_N
	bl sub_02023154
	add r0, r4, #0
	bl ov61_021E6240
	mov r2, #1
	mov r0, #0x12
	add r1, sp, #0
	str r2, [sp]
	bl NNS_G3dGeBufferOP_N
	mov r0, #0
	add r1, r0, #0
	bl sub_02026E50
	add sp, #4
	pop {r3, r4, pc}
	nop
_021E623C: .word 0x0000043C
	thumb_func_end ov61_021E61FC

	thumb_func_start ov61_021E6240
ov61_021E6240: ; 0x021E6240
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x98
	ldr r3, _021E633C ; =0x021E73EC
	add r5, r0, #0
	ldmia r3!, {r0, r1}
	add r2, sp, #0x8c
	str r2, [sp]
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r4, r5, #0
	str r0, [r2]
	mov r6, #0
	add r4, #0x70
	add r7, sp, #0x68
_021E625C:
	ldr r0, [r4, #0x58]
	cmp r0, #0
	beq _021E629C
	add r0, r7, #0
	bl MTX_Identity33_
	add r0, r4, #0
	add r0, #0x74
	ldrh r0, [r0]
	ldr r1, _021E6340 ; =0x021094DC
	asr r0, r0, #4
	lsl r3, r0, #2
	ldr r0, _021E6340 ; =0x021094DC
	ldrsh r1, [r1, r3]
	add r2, r0, r3
	mov r3, #2
	ldrsh r2, [r2, r3]
	add r0, sp, #0x44
	bl MTX_RotY33_
	add r0, sp, #0x44
	add r1, r7, #0
	add r2, r7, #0
	bl MTX_Concat33
	add r1, r4, #0
	ldr r3, [sp]
	add r0, r4, #0
	add r1, #0x5c
	add r2, r7, #0
	bl sub_0201F554
_021E629C:
	add r6, r6, #1
	add r4, #0x78
	cmp r6, #2
	blt _021E625C
	add r2, sp, #0x14
	mov r0, #0
	str r0, [r2]
	str r0, [r2, #4]
	ldr r4, _021E6344 ; =0x021E73E0
	str r0, [r2, #8]
	ldmia r4!, {r0, r1}
	add r3, sp, #8
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	str r0, [r3]
	add r0, r2, #0
	bl NNS_G3dGlbSetBaseTrans
	mov r0, #0xe6
	lsl r0, r0, #2
	ldrh r4, [r5, r0]
	add r0, sp, #0x20
	bl MTX_Identity33_
	asr r0, r4, #4
	lsl r2, r0, #1
	lsl r1, r2, #1
	ldr r3, _021E6340 ; =0x021094DC
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #0x20
	bl MTX_RotY33_
	ldr r1, _021E6348 ; =0x021DA558
	add r0, sp, #0x20
	bl MI_Copy36B
	ldr r1, _021E634C ; =0x021DA51C
	mov r0, #0xa4
	ldr r2, [r1, #0x7c]
	bic r2, r0
	add r0, sp, #8
	str r2, [r1, #0x7c]
	bl NNS_G3dGlbSetBaseScale
	bl NNS_G3dGlbFlushP
	add r5, #0x70
	mov r4, #2
	add r5, #0xf0
	mov r6, #0x11
	mov r7, #1
_021E6308:
	ldr r0, [r5, #0x58]
	cmp r0, #0
	beq _021E632E
	mov r1, #0
	add r0, r6, #0
	add r2, r1, #0
	bl NNS_G3dGeBufferOP_N
	add r0, r5, #0
	bl ov61_021E6A28
	mov r0, #0x12
	add r1, sp, #4
	add r2, r7, #0
	str r7, [sp, #4]
	bl NNS_G3dGeBufferOP_N
	bl NNS_G3dGlbFlushP
_021E632E:
	add r4, r4, #1
	add r5, #0x78
	cmp r4, #6
	blt _021E6308
	add sp, #0x98
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E633C: .word 0x021E73EC
_021E6340: .word 0x021094DC
_021E6344: .word 0x021E73E0
_021E6348: .word 0x021DA558
_021E634C: .word 0x021DA51C
	thumb_func_end ov61_021E6240

	thumb_func_start ov61_021E6350
ov61_021E6350: ; 0x021E6350
	push {r3, r4, r5, r6, lr}
	sub sp, #0x8c
	add r4, r1, #0
	ldr r1, _021E6470 ; =0x04000008
	add r5, r0, #0
	ldrh r2, [r1]
	mov r0, #3
	ldr r6, _021E6474 ; =0x021E745C
	bic r2, r0
	mov r0, #2
	orr r0, r2
	strh r0, [r1]
	add r3, sp, #0x70
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	mov r1, #1
	str r0, [r3]
	add r0, r5, #0
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #1
	mov r1, #0x20
	mov r2, #0
	add r3, r4, #0
	bl BG_ClearCharDataRange
	add r0, r5, #0
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	ldr r6, _021E6478 ; =0x021E7478
	add r3, sp, #0x54
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	mov r1, #2
	str r0, [r3]
	add r0, r5, #0
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #2
	mov r1, #0x20
	mov r2, #0
	add r3, r4, #0
	bl BG_ClearCharDataRange
	add r0, r5, #0
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r6, _021E647C ; =0x021E7408
	add r3, sp, #0x38
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	mov r1, #4
	str r0, [r3]
	add r0, r5, #0
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	add r3, r4, #0
	bl BG_ClearCharDataRange
	add r0, r5, #0
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	ldr r6, _021E6480 ; =0x021E7424
	add r3, sp, #0x1c
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	mov r1, #5
	str r0, [r3]
	add r0, r5, #0
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #5
	mov r1, #0x20
	mov r2, #0
	add r3, r4, #0
	bl BG_ClearCharDataRange
	add r0, r5, #0
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	ldr r6, _021E6484 ; =0x021E7440
	add r3, sp, #0
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	mov r1, #6
	str r0, [r3]
	add r0, r5, #0
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #6
	mov r1, #0x20
	mov r2, #0
	add r3, r4, #0
	bl BG_ClearCharDataRange
	add r0, r5, #0
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	add sp, #0x8c
	pop {r3, r4, r5, r6, pc}
	nop
_021E6470: .word 0x04000008
_021E6474: .word 0x021E745C
_021E6478: .word 0x021E7478
_021E647C: .word 0x021E7408
_021E6480: .word 0x021E7424
_021E6484: .word 0x021E7440
	thumb_func_end ov61_021E6350

	thumb_func_start ov61_021E6488
ov61_021E6488: ; 0x021E6488
	push {r3, r4, lr}
	sub sp, #0x2c
	ldr r3, _021E64FC ; =0x021E73C8
	add r4, r0, #0
	ldmia r3!, {r0, r1}
	add r2, sp, #0x14
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	ldr r1, _021E6500 ; =0x0000DCC0
	str r0, [r2]
	mov r2, #0
	mov r0, #0xf
	str r2, [r4, #0x14]
	lsl r0, r0, #0xc
	str r0, [r4, #0x18]
	str r2, [r4, #0x1c]
	add r0, sp, #0xc
	strh r1, [r0]
	strh r2, [r0, #2]
	strh r2, [r0, #4]
	str r2, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4, #0x10]
	mov r1, #0x19
	str r0, [sp, #8]
	add r0, r4, #0
	ldr r3, _021E6504 ; =0x000011A4
	add r0, #0x14
	lsl r1, r1, #0xe
	add r2, sp, #0xc
	bl sub_02023254
	ldr r1, [r4, #0x10]
	add r0, sp, #0x14
	bl sub_02023514
	mov r0, #1
	lsl r0, r0, #0xe
	ldr r2, [r4, #0x10]
	lsl r1, r0, #6
	bl sub_02023240
	mov r1, #0
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [sp, #0x24]
	str r1, [sp, #0x20]
	str r1, [sp, #0x28]
	ldr r1, [r4, #0x10]
	add r0, sp, #0x20
	bl sub_02023204
	ldr r0, [r4, #0x10]
	bl sub_0202313C
	add sp, #0x2c
	pop {r3, r4, pc}
	.balign 4, 0
_021E64FC: .word 0x021E73C8
_021E6500: .word 0x0000DCC0
_021E6504: .word 0x000011A4
	thumb_func_end ov61_021E6488

	thumb_func_start ov61_021E6508
ov61_021E6508: ; 0x021E6508
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xed
	lsl r0, r0, #2
	add r4, r5, r0
	add r1, r4, #0
	ldr r2, [r5, #4]
	mov r0, #3
	add r1, #0x8c
	bl sub_02009F40
	add r1, r4, #0
	add r1, #0x88
	str r0, [r1]
	ldr r2, [r5, #4]
	mov r0, #3
	mov r1, #0
	bl sub_0200A090
	mov r1, #0xed
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r2, [r5, #4]
	mov r0, #3
	mov r1, #1
	bl sub_0200A090
	str r0, [r4, #4]
	ldr r2, [r5, #4]
	mov r0, #3
	mov r1, #2
	bl sub_0200A090
	str r0, [r4, #8]
	mov r0, #3
	ldr r2, [r5, #4]
	add r1, r0, #0
	bl sub_0200A090
	str r0, [r4, #0xc]
	mov r0, #0x10
	mov r1, #1
	bl sub_02022CC8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov61_021E6508

	thumb_func_start ov61_021E6564
ov61_021E6564: ; 0x021E6564
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r2, [r5, #4]
	mov r1, #3
	add r0, #0x30
	bl ov61_021E6768
	add r0, r5, #0
	mov r2, #0xe
	mov r3, #2
	add r0, #0x70
	mov r1, #0
	lsl r2, r2, #0xc
	lsl r3, r3, #0x10
	bl ov61_021E6934
	mov r1, #1
	lsl r1, r1, #0xc
	add r0, r5, #0
	add r0, #0x70
	add r2, r1, #0
	add r3, r1, #0
	bl ov61_021E693C
	add r0, r5, #0
	ldr r2, [r5, #4]
	add r0, #0x40
	mov r1, #0
	bl ov61_021E6768
	mov r1, #0
	add r0, r5, #0
	add r0, #0xe8
	add r2, r1, #0
	add r3, r1, #0
	bl ov61_021E6934
	mov r1, #1
	lsl r1, r1, #0xc
	add r0, r5, #0
	add r0, #0xe8
	add r2, r1, #0
	add r3, r1, #0
	bl ov61_021E693C
	add r0, r5, #0
	ldr r2, [r5, #4]
	add r0, #0x50
	mov r1, #1
	bl ov61_021E6768
	mov r1, #0
	mov r0, #0x16
	lsl r0, r0, #4
	add r0, r5, r0
	add r2, r1, #0
	add r3, r1, #0
	bl ov61_021E6934
	mov r0, #0x16
	mov r1, #1
	lsl r1, r1, #0xc
	lsl r0, r0, #4
	add r0, r5, r0
	add r2, r1, #0
	add r3, r1, #0
	bl ov61_021E693C
	add r0, r5, #0
	ldr r2, [r5, #4]
	add r0, #0x60
	mov r1, #2
	bl ov61_021E6768
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0x70
	add r1, #0x30
	bl ov61_021E67BC
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0xe8
	add r1, #0x40
	bl ov61_021E67BC
	mov r0, #0x16
	lsl r0, r0, #4
	add r1, r5, #0
	add r0, r5, r0
	add r1, #0x50
	bl ov61_021E67BC
	add r6, r5, #0
	add r7, r5, #0
	mov r4, #0
	add r6, #0x70
	add r7, #0x60
_021E6628:
	add r1, r4, #3
	mov r0, #0x78
	mul r0, r1
	add r0, r6, r0
	add r1, r7, #0
	bl ov61_021E67BC
	add r4, r4, #1
	cmp r4, #3
	blt _021E6628
	add r0, r5, #0
	mov r1, #0
	add r0, #0xc8
	str r1, [r0]
	mov r1, #0x6e
	lsl r1, r1, #2
	mov r2, #1
	add r0, r1, #0
	str r2, [r5, r1]
	sub r0, #0x78
	str r2, [r5, r0]
	add r0, r1, #0
	add r0, #0x78
	str r2, [r5, r0]
	add r1, #0xf0
	mov r0, #0x32
	add r3, r5, #0
	str r2, [r5, r1]
	lsl r0, r0, #4
	str r2, [r5, r0]
	add r0, #0x48
	add r0, r5, r0
	str r0, [sp]
	add r2, r5, #0
	ldr r1, [r5, #4]
	mov r0, #7
	add r2, #0x20
	add r3, #0x50
	bl ov61_021E67D4
	mov r0, #0xd
	lsl r0, r0, #6
	add r0, r5, r0
	str r0, [sp]
	add r2, r5, #0
	add r3, r5, #0
	ldr r1, [r5, #4]
	mov r0, #6
	add r2, #0x20
	add r3, #0x60
	bl ov61_021E67D4
	mov r0, #0xd2
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [sp]
	add r2, r5, #0
	add r3, r5, #0
	ldr r1, [r5, #4]
	mov r0, #6
	add r2, #0x20
	add r3, #0x60
	bl ov61_021E67D4
	mov r0, #0x35
	lsl r0, r0, #4
	add r0, r5, r0
	str r0, [sp]
	add r2, r5, #0
	add r3, r5, #0
	ldr r1, [r5, #4]
	mov r0, #6
	add r2, #0x20
	add r3, #0x60
	bl ov61_021E67D4
	mov r0, #0xd6
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [sp]
	add r2, r5, #0
	add r3, r5, #0
	ldr r1, [r5, #4]
	mov r0, #5
	add r2, #0x20
	add r3, #0x60
	bl ov61_021E67D4
	mov r0, #0x36
	lsl r0, r0, #4
	add r0, r5, r0
	str r0, [sp]
	add r2, r5, #0
	add r3, r5, #0
	ldr r1, [r5, #4]
	mov r0, #4
	add r2, #0x20
	add r3, #0x30
	bl ov61_021E67D4
	mov r0, #0x16
	mov r1, #0xda
	lsl r0, r0, #4
	lsl r1, r1, #2
	add r0, r5, r0
	add r1, r5, r1
	bl ov61_021E6814
	mov r0, #0x76
	mov r1, #0xd
	lsl r0, r0, #2
	lsl r1, r1, #6
	add r0, r5, r0
	add r1, r5, r1
	bl ov61_021E6814
	mov r1, #0x25
	lsl r1, r1, #4
	add r0, r5, r1
	add r1, #0xf8
	add r1, r5, r1
	bl ov61_021E6814
	mov r1, #0xb2
	lsl r1, r1, #2
	add r0, r5, r1
	add r1, #0x88
	add r1, r5, r1
	bl ov61_021E6814
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov61_021E6564

	thumb_func_start ov61_021E6730
ov61_021E6730: ; 0x021E6730
	push {r4, r5, r6, lr}
	mov r1, #0xd
	lsl r1, r1, #6
	add r6, r0, #0
	mov r4, #0
	add r5, r0, r1
	add r6, #0x20
_021E673E:
	add r0, r5, #0
	add r1, r6, #0
	bl ov61_021E6918
	add r4, r4, #1
	add r5, #8
	cmp r4, #6
	blt _021E673E
	pop {r4, r5, r6, pc}
	thumb_func_end ov61_021E6730

	thumb_func_start ov61_021E6750
ov61_021E6750: ; 0x021E6750
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
	add r5, #0x30
_021E6758:
	add r0, r5, #0
	bl ov61_021E6908
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #4
	blt _021E6758
	pop {r3, r4, r5, pc}
	thumb_func_end ov61_021E6750

	thumb_func_start ov61_021E6768
ov61_021E6768: ; 0x021E6768
	push {r3, r4, lr}
	sub sp, #4
	add r3, r2, #0
	mov r2, #0
	add r4, r0, #0
	str r2, [sp]
	mov r0, #0x52
	bl GfGfxLoader_LoadFromNarc
	str r0, [r4]
	bl NNS_G3dGetMdlSet
	str r0, [r4, #4]
	cmp r0, #0
	beq _021E67A6
	add r2, r0, #0
	add r2, #8
	beq _021E679A
	ldrb r1, [r0, #9]
	cmp r1, #0
	bls _021E679A
	ldrh r1, [r0, #0xe]
	add r1, r2, r1
	add r1, r1, #4
	b _021E679C
_021E679A:
	mov r1, #0
_021E679C:
	cmp r1, #0
	beq _021E67A6
	ldr r1, [r1]
	add r0, r0, r1
	b _021E67A8
_021E67A6:
	mov r0, #0
_021E67A8:
	str r0, [r4, #8]
	ldr r0, [r4]
	bl NNS_G3dGetTex
	str r0, [r4, #0xc]
	bl sub_0201F668
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov61_021E6768

	thumb_func_start ov61_021E67BC
ov61_021E67BC: ; 0x021E67BC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4]
	ldr r1, [r4, #0xc]
	bl sub_0201F64C
	ldr r1, [r4, #8]
	add r0, r5, #0
	bl NNS_G3dRenderObjInit
	pop {r3, r4, r5, pc}
	thumb_func_end ov61_021E67BC

	thumb_func_start ov61_021E67D4
ov61_021E67D4: ; 0x021E67D4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	add r7, r1, #0
	str r2, [sp, #4]
	mov r2, #0
	add r5, r3, #0
	ldr r4, [sp, #0x20]
	str r2, [sp]
	mov r0, #0x52
	add r1, r6, #0
	add r3, r7, #0
	bl GfGfxLoader_LoadFromNarc
	str r0, [r4]
	mov r1, #0
	bl NNS_G3dGetAnmByIdx
	add r6, r0, #0
	ldr r0, [sp, #4]
	ldr r2, [r5, #8]
	add r1, r6, #0
	bl NNS_G3dAllocAnmObj
	str r0, [r4, #4]
	ldr r2, [r5, #8]
	ldr r3, [r5, #0xc]
	add r1, r6, #0
	bl NNS_G3dAnmObjInit
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov61_021E67D4

	thumb_func_start ov61_021E6814
ov61_021E6814: ; 0x021E6814
	ldr r3, _021E681C ; =NNS_G3dRenderObjAddAnmObj
	ldr r1, [r1, #4]
	bx r3
	nop
_021E681C: .word NNS_G3dRenderObjAddAnmObj
	thumb_func_end ov61_021E6814

	thumb_func_start ov61_021E6820
ov61_021E6820: ; 0x021E6820
	ldr r3, _021E6828 ; =NNS_G3dRenderObjRemoveAnmObj
	ldr r1, [r1, #4]
	bx r3
	nop
_021E6828: .word NNS_G3dRenderObjRemoveAnmObj
	thumb_func_end ov61_021E6820

	thumb_func_start ov61_021E682C
ov61_021E682C: ; 0x021E682C
	ldr r3, [r0, #4]
	mov r0, #1
	ldr r2, [r3]
	lsl r0, r0, #0xc
	add r2, r2, r0
	ldr r0, [r3, #8]
	mov r1, #0
	ldrh r0, [r0, #4]
	lsl r0, r0, #0xc
	cmp r2, r0
	beq _021E6846
	str r2, [r3]
	b _021E6848
_021E6846:
	mov r1, #1
_021E6848:
	add r0, r1, #0
	bx lr
	thumb_func_end ov61_021E682C

	thumb_func_start ov61_021E684C
ov61_021E684C: ; 0x021E684C
	push {r3, r4}
	ldr r4, [r0, #4]
	mov r2, #1
	ldr r3, [r4]
	lsl r2, r2, #0xc
	add r2, r3, r2
	str r2, [r4]
	cmp r1, #2
	bne _021E686E
	ldr r4, [r0, #4]
	mov r2, #0xa
	ldr r3, [r4]
	lsl r2, r2, #0xe
	cmp r3, r2
	bne _021E686E
	lsl r2, r2, #1
	str r2, [r4]
_021E686E:
	ldr r3, [r0, #4]
	ldr r0, [r3, #8]
	ldr r2, [r3]
	ldrh r0, [r0, #4]
	lsl r0, r0, #0xc
	cmp r2, r0
	blt _021E688E
	cmp r1, #2
	bne _021E688A
	mov r0, #5
	lsl r0, r0, #0x10
	str r0, [r3]
	pop {r3, r4}
	bx lr
_021E688A:
	mov r0, #0
	str r0, [r3]
_021E688E:
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov61_021E684C

	thumb_func_start ov61_021E6894
ov61_021E6894: ; 0x021E6894
	push {r3, r4, r5, lr}
	mov r1, #0xe5
	add r5, r0, #0
	lsl r1, r1, #2
	add r0, r1, #0
	ldr r4, [r5, r1]
	sub r0, #0x54
	add r2, r5, r0
	lsl r0, r4, #0x18
	add r1, #0x18
	lsr r0, r0, #0x15
	ldr r1, [r5, r1]
	add r0, r2, r0
	bl ov61_021E684C
	add r0, r4, #1
	mov r1, #3
	bl _u32_div_f
	lsl r1, r1, #0x18
	lsr r1, r1, #0x15
	add r2, r5, r1
	mov r1, #0xd1
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	mov r0, #0
	str r0, [r1]
	add r0, r4, #2
	mov r1, #3
	bl _u32_div_f
	lsl r0, r1, #0x18
	lsr r0, r0, #0x15
	add r1, r5, r0
	mov r0, #0xd1
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r2, #0
	str r2, [r0]
	pop {r3, r4, r5, pc}
	thumb_func_end ov61_021E6894

	thumb_func_start ov61_021E68E4
ov61_021E68E4: ; 0x021E68E4
	mov r2, #0xe5
	lsl r2, r2, #2
	ldr r1, [r0, r2]
	sub r2, #0x50
	lsl r1, r1, #0x18
	lsr r1, r1, #0x15
	add r0, r0, r1
	ldr r0, [r0, r2]
	ldr r1, [r0]
	mov r0, #5
	lsl r0, r0, #0x10
	cmp r1, r0
	blt _021E6902
	mov r0, #1
	bx lr
_021E6902:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov61_021E68E4

	thumb_func_start ov61_021E6908
ov61_021E6908: ; 0x021E6908
	push {r3, lr}
	ldr r0, [r0]
	cmp r0, #0
	beq _021E6914
	bl FreeToHeap
_021E6914:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov61_021E6908

	thumb_func_start ov61_021E6918
ov61_021E6918: ; 0x021E6918
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _021E6930
	add r0, r1, #0
	ldr r1, [r4, #4]
	bl NNS_G3dFreeAnmObj
	ldr r0, [r4]
	bl FreeToHeap
_021E6930:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov61_021E6918

	thumb_func_start ov61_021E6934
ov61_021E6934: ; 0x021E6934
	str r1, [r0, #0x5c]
	str r2, [r0, #0x60]
	str r3, [r0, #0x64]
	bx lr
	thumb_func_end ov61_021E6934

	thumb_func_start ov61_021E693C
ov61_021E693C: ; 0x021E693C
	str r1, [r0, #0x68]
	str r2, [r0, #0x6c]
	str r3, [r0, #0x70]
	bx lr
	thumb_func_end ov61_021E693C

	thumb_func_start ov61_021E6944
ov61_021E6944: ; 0x021E6944
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	ldr r3, _021E6A20 ; =0x021E73B0
	add r7, r0, #0
	ldmia r3!, {r0, r1}
	add r2, sp, #0x34
	str r2, [sp, #8]
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r5, #0
	str r0, [r2]
	mov r0, #0xe5
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	str r5, [sp, #4]
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r7, #0
	str r0, [sp, #0xc]
	add r0, #0x70
	str r0, [sp, #0xc]
_021E696E:
	add r0, r5, #0
	mov r1, #3
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	asr r0, r0, #4
	lsl r1, r0, #2
	ldr r0, _021E6A24 ; =0x021094DC
	ldr r3, _021E6A24 ; =0x021094DC
	add r2, r0, r1
	ldrsh r1, [r3, r1]
	mov r3, #2
	ldrsh r2, [r2, r3]
	add r0, sp, #0x10
	bl MTX_RotY33_
	ldr r0, [sp, #8]
	add r1, sp, #0x10
	add r2, sp, #0x40
	bl MTX_MultVec33
	mov r0, #0xc
	mul r0, r4
	add r6, r7, r0
	mov r0, #0x37
	lsl r0, r0, #4
	add r3, sp, #0x40
	add r2, r6, r0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	mov r0, #0xdd
	lsl r0, r0, #2
	ldr r1, [r6, r0]
	mov r0, #0xd
	lsl r0, r0, #0xc
	add r1, r1, r0
	mov r0, #0xdd
	lsl r0, r0, #2
	str r1, [r6, r0]
	add r1, r4, #3
	add r6, r1, #0
	mov r0, #0x78
	mul r6, r0
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x40]
	ldr r2, [sp, #0x44]
	ldr r3, [sp, #0x48]
	add r0, r0, r6
	bl ov61_021E6934
	ldr r0, [sp, #0xc]
	mov r1, #1
	lsl r1, r1, #0xc
	add r0, r0, r6
	add r2, r1, #0
	add r3, r1, #0
	bl ov61_021E693C
	mov r0, #0x78
	mul r0, r4
	mov r1, #0x93
	ldr r2, [sp]
	add r0, r7, r0
	lsl r1, r1, #2
	strh r2, [r0, r1]
	mov r2, #0
	add r1, r1, #2
	strh r2, [r0, r1]
	add r0, r4, #1
	mov r1, #3
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r4, r0, #0x18
	mov r0, #1
	lsl r0, r0, #0x10
	add r5, r5, r0
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #3
	blt _021E696E
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	nop
_021E6A20: .word 0x021E73B0
_021E6A24: .word 0x021094DC
	thumb_func_end ov61_021E6944

	thumb_func_start ov61_021E6A28
ov61_021E6A28: ; 0x021E6A28
	push {r4, lr}
	sub sp, #0x30
	add r1, sp, #0
	add r4, r0, #0
	bl ov61_021E6A48
	mov r0, #0x19
	add r1, sp, #0
	mov r2, #0xc
	bl NNS_G3dGeBufferOP_N
	add r0, r4, #0
	bl NNS_G3dDraw
	add sp, #0x30
	pop {r4, pc}
	thumb_func_end ov61_021E6A28

	thumb_func_start ov61_021E6A48
ov61_021E6A48: ; 0x021E6A48
	push {r4, r5, lr}
	sub sp, #0x94
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl MTX_Identity43_
	ldr r0, [r5, #0x64]
	add r1, r4, #0
	str r0, [sp]
	ldr r2, [r5, #0x5c]
	ldr r3, [r5, #0x60]
	add r0, r4, #0
	bl MTX_TransApply43
	add r0, sp, #0x64
	bl MTX_Identity43_
	add r0, r5, #0
	add r0, #0x76
	ldrh r0, [r0]
	ldr r3, _021E6ADC ; =0x021094DC
	asr r0, r0, #4
	lsl r2, r0, #1
	lsl r1, r2, #1
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #4
	bl MTX_RotX43_
	add r1, sp, #0x64
	add r0, sp, #4
	add r2, r1, #0
	bl MTX_Concat43
	add r0, r5, #0
	add r0, #0x74
	ldrh r0, [r0]
	ldr r3, _021E6ADC ; =0x021094DC
	asr r0, r0, #4
	lsl r2, r0, #1
	lsl r1, r2, #1
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #4
	bl MTX_RotY43_
	add r1, sp, #0x64
	add r0, sp, #4
	add r2, r1, #0
	bl MTX_Concat43
	ldr r1, [r5, #0x68]
	ldr r2, [r5, #0x6c]
	ldr r3, [r5, #0x70]
	add r0, sp, #0x34
	bl MTX_Scale43_
	add r0, sp, #0x64
	add r1, r4, #0
	add r2, r4, #0
	bl MTX_Concat43
	add r0, sp, #0x34
	add r1, r4, #0
	add r2, r4, #0
	bl MTX_Concat43
	add sp, #0x94
	pop {r4, r5, pc}
	.balign 4, 0
_021E6ADC: .word 0x021094DC
	thumb_func_end ov61_021E6A48

	thumb_func_start ov61_021E6AE0
ov61_021E6AE0: ; 0x021E6AE0
	push {r4, lr}
	mov r3, #0xe6
	lsl r3, r3, #2
	ldrsh r4, [r0, r3]
	mov r2, #0
	add r4, r4, r1
	strh r4, [r0, r3]
	cmp r1, #0
	ldrsh r4, [r0, r3]
	blt _021E6B0A
	ldr r1, _021E6B24 ; =0x00005555
	cmp r4, r1
	blt _021E6B1E
	strh r2, [r0, r3]
	add r1, r3, #2
	strh r2, [r0, r1]
	mov r1, #1
	bl ov61_021E6B2C
	mov r2, #1
	b _021E6B1E
_021E6B0A:
	ldr r1, _021E6B28 ; =0xFFFFAAAB
	cmp r4, r1
	bgt _021E6B1E
	strh r2, [r0, r3]
	add r1, r3, #2
	strh r2, [r0, r1]
	mov r1, #2
	bl ov61_021E6B2C
	mov r2, #1
_021E6B1E:
	add r0, r2, #0
	pop {r4, pc}
	nop
_021E6B24: .word 0x00005555
_021E6B28: .word 0xFFFFAAAB
	thumb_func_end ov61_021E6AE0

	thumb_func_start ov61_021E6B2C
ov61_021E6B2C: ; 0x021E6B2C
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #2
	bne _021E6B4A
	mov r0, #0xe5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #3
	add r0, r0, #1
	bl _u32_div_f
	mov r0, #0xe5
	lsl r0, r0, #2
	str r1, [r4, r0]
	b _021E6B64
_021E6B4A:
	cmp r1, #1
	bne _021E6B64
	mov r0, #0xe5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	sub r0, r0, #1
	lsl r0, r0, #0x18
	asr r1, r0, #0x18
	bpl _021E6B5E
	mov r1, #2
_021E6B5E:
	mov r0, #0xe5
	lsl r0, r0, #2
	str r1, [r4, r0]
_021E6B64:
	add r0, r4, #0
	bl ov61_021E6944
	pop {r4, pc}
	thumb_func_end ov61_021E6B2C

	thumb_func_start ov61_021E6B6C
ov61_021E6B6C: ; 0x021E6B6C
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	ldr r0, [r4, #4]
	mov r1, #1
	bl AllocWindows
	mov r1, #0xe7
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, #4]
	mov r1, #1
	bl AllocWindows
	mov r1, #0x3a
	lsl r1, r1, #4
	str r0, [r4, r1]
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r2, #4
	str r2, [sp, #8]
	mov r3, #2
	str r3, [sp, #0xc]
	mov r0, #0x1f
	str r0, [sp, #0x10]
	sub r1, r1, #4
	ldr r0, [r4, #8]
	ldr r1, [r4, r1]
	bl AddWindowParameterized
	mov r0, #0x13
	str r0, [sp]
	mov r1, #0x1d
	str r1, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0x1f
	str r0, [sp, #0x10]
	lsl r1, r1, #5
	mov r2, #1
	ldr r0, [r4, #8]
	ldr r1, [r4, r1]
	add r3, r2, #0
	bl AddWindowParameterized
	mov r0, #0xe7
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #0x3a
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0xe9
	lsl r0, r0, #2
	ldrb r0, [r4, r0]
	mov r1, #4
	lsl r2, r1, #7
	str r0, [sp]
	ldr r0, [r4, #4]
	mov r3, #0
	str r0, [sp, #4]
	ldr r0, [r4, #8]
	bl sub_0200E644
	mov r0, #0x20
	str r0, [sp]
	ldr r0, [r4, #4]
	mov r1, #8
	str r0, [sp, #4]
	mov r0, #0x52
	mov r2, #4
	mov r3, #0x40
	bl GfGfxLoader_GXLoadPal
	mov r0, #0x20
	str r0, [sp]
	ldr r0, [r4, #4]
	mov r1, #8
	str r0, [sp, #4]
	mov r0, #0x52
	mov r2, #0
	mov r3, #0x40
	bl GfGfxLoader_GXLoadPal
	mov r0, #0xe7
	lsl r0, r0, #2
	mov r1, #0
	mov r2, #2
	ldr r0, [r4, r0]
	lsl r2, r2, #8
	add r3, r1, #0
	bl DrawFrameAndWindow2
	add sp, #0x14
	pop {r3, r4, pc}
	thumb_func_end ov61_021E6B6C

	thumb_func_start ov61_021E6C3C
ov61_021E6C3C: ; 0x021E6C3C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	add r4, r1, #0
	str r0, [sp, #8]
	mov r0, #0x52
	mov r1, #0xd
	add r2, r5, #0
	mov r3, #2
	str r4, [sp, #0xc]
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x52
	mov r1, #0xa
	add r2, r5, #0
	mov r3, #5
	str r4, [sp, #0xc]
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x52
	mov r1, #0x10
	add r2, r5, #0
	mov r3, #6
	str r4, [sp, #0xc]
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x52
	mov r1, #0xe
	add r2, r5, #0
	mov r3, #2
	str r4, [sp, #0xc]
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x52
	mov r1, #0xb
	add r2, r5, #0
	mov r3, #5
	str r4, [sp, #0xc]
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x52
	mov r1, #0x11
	add r2, r5, #0
	mov r3, #6
	str r4, [sp, #0xc]
	bl GfGfxLoader_LoadScrnData
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x52
	mov r1, #0xc
	mov r2, #0
	mov r3, #0x60
	str r4, [sp, #4]
	bl GfGfxLoader_GXLoadPal
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x52
	mov r1, #9
	mov r2, #4
	mov r3, #0x60
	str r4, [sp, #4]
	bl GfGfxLoader_GXLoadPal
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x52
	mov r1, #0xf
	mov r2, #4
	mov r3, #0x80
	str r4, [sp, #4]
	bl GfGfxLoader_GXLoadPal
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	mov r0, #3
	mov r2, #0
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #2
	add r3, r2, #0
	bl sub_0201CA4C
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	mov r0, #3
	mov r2, #0
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #5
	add r3, r2, #0
	bl sub_0201CA4C
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	mov r0, #4
	mov r2, #0
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #6
	add r3, r2, #0
	bl sub_0201CA4C
	add r0, r5, #0
	mov r1, #2
	bl BgCommitTilemapBufferToVram
	add r0, r5, #0
	mov r1, #5
	bl BgCommitTilemapBufferToVram
	add r0, r5, #0
	mov r1, #6
	bl BgCommitTilemapBufferToVram
	mov r0, #0xb
	str r0, [sp]
	ldr r0, _021E6D74 ; =0x04001050
	mov r1, #4
	mov r2, #0x22
	mov r3, #5
	bl G2x_SetBlendAlpha_
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_021E6D74: .word 0x04001050
	thumb_func_end ov61_021E6C3C

	thumb_func_start ov61_021E6D78
ov61_021E6D78: ; 0x021E6D78
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	ldr r4, [sp, #0x34]
	add r5, r0, #0
	ldr r0, [r4]
	add r7, r1, #0
	add r6, r2, #0
	str r3, [sp, #0x10]
	cmp r0, #0
	beq _021E6D90
	bl GF_AssertFail
_021E6D90:
	ldr r2, [sp, #0x10]
	mov r0, #0
	mov r1, #0x1b
	add r3, r7, #0
	bl NewMsgDataFromNarc
	add r7, r0, #0
	bne _021E6DA4
	bl GF_AssertFail
_021E6DA4:
	ldr r1, [sp, #0x28]
	add r0, r7, #0
	bl NewString_ReadMsgData
	ldr r1, [sp, #0x2c]
	str r0, [r4]
	lsl r1, r1, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl FillWindowPixelBuffer
	mov r3, #0
	ldr r0, [sp, #0x30]
	str r3, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	mov r1, #1
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r2, [r4]
	add r0, r5, #0
	bl AddTextPrinterParameterized2
	add r4, r0, #0
	cmp r6, #0
	beq _021E6DE8
	mov r1, #0
	mov r2, #2
	add r0, r5, #0
	lsl r2, r2, #8
	add r3, r1, #0
	bl DrawFrameAndWindow2
	b _021E6DEE
_021E6DE8:
	add r0, r5, #0
	bl CopyWindowToVram
_021E6DEE:
	add r0, r7, #0
	bl DestroyMsgData
	add r0, r4, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov61_021E6D78

	thumb_func_start ov61_021E6DFC
ov61_021E6DFC: ; 0x021E6DFC
	push {lr}
	sub sp, #0x14
	mov r2, #0
	add r3, r0, #0
	str r2, [sp, #0x10]
	ldr r0, _021E6E2C ; =0x00010200
	str r1, [sp]
	str r0, [sp, #4]
	str r2, [sp, #8]
	add r0, sp, #0x10
	str r0, [sp, #0xc]
	mov r0, #0x3a
	lsl r0, r0, #4
	ldr r0, [r3, r0]
	ldr r1, [r3, #4]
	mov r3, #0xbe
	bl ov61_021E6D78
	ldr r0, [sp, #0x10]
	bl String_dtor
	add sp, #0x14
	pop {pc}
	nop
_021E6E2C: .word 0x00010200
	thumb_func_end ov61_021E6DFC

	thumb_func_start ov61_021E6E30
ov61_021E6E30: ; 0x021E6E30
	push {r4, lr}
	add r4, r0, #0
	bl RemoveWindow
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov61_021E6E30

	thumb_func_start ov61_021E6E40
ov61_021E6E40: ; 0x021E6E40
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r5, r0, #0
	mov r4, #0
	bl sub_0202534C
	cmp r0, #0
	bne _021E6EB6
	ldr r0, _021E6F74 ; =gMain
	mov r1, #1
	ldr r2, [r0, #0x48]
	add r0, r2, #0
	tst r0, r1
	beq _021E6E78
	mov r0, #0xea
	lsl r0, r0, #2
	ldr r2, [r5, r0]
	cmp r2, #2
	bne _021E6E6A
	mov r4, #6
	b _021E6F62
_021E6E6A:
	cmp r2, #1
	bne _021E6E72
	mov r4, #7
	b _021E6F62
_021E6E72:
	str r1, [r5, r0]
	mov r4, #5
	b _021E6F62
_021E6E78:
	mov r0, #2
	add r3, r2, #0
	tst r3, r0
	beq _021E6E8E
	mov r0, #0xea
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #2
	bne _021E6F62
	mov r4, #8
	b _021E6F62
_021E6E8E:
	mov r3, #0x20
	tst r3, r2
	beq _021E6EA2
	mov r0, #0xea
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #2
	beq _021E6F62
	add r4, r1, #0
	b _021E6F62
_021E6EA2:
	mov r1, #0x10
	tst r1, r2
	beq _021E6F62
	mov r1, #0xea
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	cmp r1, #2
	beq _021E6F62
	add r4, r0, #0
	b _021E6F62
_021E6EB6:
	ldr r0, _021E6F74 ; =gMain
	ldr r0, [r0, #0x44]
	cmp r0, #0
	bne _021E6F62
	bl sub_02025358
	cmp r0, #0
	beq _021E6F62
	ldr r1, _021E6F78 ; =gMain + 0x40
	add r2, sp, #0xc
	ldrh r0, [r1, #0x20]
	ldrh r1, [r1, #0x22]
	add r3, sp, #0
	bl NNS_G3dScrPosToWorldLine
	mov r0, #0xea
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #2
	bne _021E6EE2
	mov r3, #6
	b _021E6EE4
_021E6EE2:
	mov r3, #0xd
_021E6EE4:
	mov r0, #0x37
	lsl r0, r0, #4
	lsl r3, r3, #0xc
	add r0, r5, r0
	add r1, sp, #0xc
	add r2, sp, #0
	bl ov61_021E6F98
	cmp r0, #3
	beq _021E6F56
	mov r2, #0xea
	lsl r2, r2, #2
	ldr r1, [r5, r2]
	cmp r1, #2
	bne _021E6F12
	sub r2, #0x14
	ldr r1, [r5, r2]
	cmp r0, r1
	bne _021E6F0E
	mov r4, #6
	b _021E6F62
_021E6F0E:
	mov r4, #8
	b _021E6F62
_021E6F12:
	cmp r1, #1
	bne _021E6F34
	add r1, r2, #0
	sub r1, #0x14
	ldr r1, [r5, r1]
	cmp r0, r1
	bne _021E6F24
	mov r4, #7
	b _021E6F62
_021E6F24:
	add r2, r2, #4
	lsl r1, r1, #0x18
	ldr r2, [r5, r2]
	lsr r1, r1, #0x18
	bl ov61_021E6F80
	add r4, r0, #0
	b _021E6F62
_021E6F34:
	add r1, r2, #0
	sub r1, #0x14
	ldr r1, [r5, r1]
	cmp r0, r1
	bne _021E6F46
	mov r0, #1
	str r0, [r5, r2]
	mov r4, #5
	b _021E6F62
_021E6F46:
	add r2, r2, #4
	lsl r1, r1, #0x18
	ldr r2, [r5, r2]
	lsr r1, r1, #0x18
	bl ov61_021E6F80
	add r4, r0, #0
	b _021E6F62
_021E6F56:
	mov r0, #0xea
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #2
	bne _021E6F62
	mov r4, #8
_021E6F62:
	cmp r4, #6
	bne _021E6F6C
	ldr r0, _021E6F7C ; =0x000005EA
	bl PlaySE
_021E6F6C:
	add r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	nop
_021E6F74: .word gMain
_021E6F78: .word gMain + 0x40
_021E6F7C: .word 0x000005EA
	thumb_func_end ov61_021E6E40

	thumb_func_start ov61_021E6F80
ov61_021E6F80: ; 0x021E6F80
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #1
	mov r1, #3
	bl _s32_div_f
	cmp r1, r4
	bne _021E6F94
	mov r0, #1
	pop {r4, pc}
_021E6F94:
	mov r0, #2
	pop {r4, pc}
	thumb_func_end ov61_021E6F80

	thumb_func_start ov61_021E6F98
ov61_021E6F98: ; 0x021E6F98
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	str r2, [sp]
	add r6, r3, #0
	mov r4, #0
_021E6FA4:
	mov r0, #0xc
	mul r0, r4
	ldr r2, [sp]
	add r0, r5, r0
	add r1, r7, #0
	bl sub_02020B9C
	cmp r0, r6
	ble _021E6FC0
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #3
	blo _021E6FA4
_021E6FC0:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov61_021E6F98

	thumb_func_start ov61_021E6FC4
ov61_021E6FC4: ; 0x021E6FC4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r6, r0, #0
	ldr r1, [r6, #4]
	mov r0, #0x5d
	bl NARC_ctor
	str r0, [sp, #0x18]
	mov r0, #0xed
	lsl r0, r0, #2
	add r5, r6, r0
	add r0, r5, #0
	str r0, [sp, #0x24]
	add r0, #0x78
	mov r4, #0
	str r5, [sp, #0x14]
	str r6, [sp, #0x10]
	add r7, r5, #0
	str r0, [sp, #0x24]
_021E6FEA:
	str r4, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [r6, #4]
	ldr r1, [sp, #0x18]
	str r0, [sp, #8]
	ldr r0, [r5]
	mov r2, #9
	mov r3, #0
	bl sub_0200A3C8
	ldr r1, [sp, #0x14]
	mov r2, #6
	str r0, [r1, #0x18]
	str r4, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r6, #4]
	ldr r1, [sp, #0x18]
	str r0, [sp, #0xc]
	ldr r0, [r5, #4]
	mov r3, #0
	bl sub_0200A480
	ldr r1, [sp, #0x14]
	mov r2, #0xa
	str r0, [r1, #0x1c]
	str r4, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [r6, #4]
	ldr r1, [sp, #0x18]
	str r0, [sp, #8]
	ldr r0, [r5, #8]
	mov r3, #0
	bl sub_0200A540
	ldr r1, [sp, #0x14]
	mov r2, #0x10
	str r0, [r1, #0x20]
	str r4, [sp]
	mov r0, #3
	str r0, [sp, #4]
	ldr r0, [r6, #4]
	ldr r1, [sp, #0x18]
	str r0, [sp, #8]
	ldr r0, [r5, #0xc]
	mov r3, #0
	bl sub_0200A540
	ldr r1, [sp, #0x14]
	mov r2, #0
	str r0, [r1, #0x24]
	ldr r1, [sp, #0x10]
	ldr r0, _021E7104 ; =0x00000578
	ldr r0, [r1, r0]
	mov r1, #5
	bl GetMonData
	str r0, [sp, #0x1c]
	ldr r1, [sp, #0x10]
	ldr r0, _021E7104 ; =0x00000578
	mov r2, #0
	ldr r0, [r1, r0]
	mov r1, #0x6f
	bl GetMonData
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x10]
	ldr r0, _021E7104 ; =0x00000578
	ldr r0, [r1, r0]
	bl MonIsShiny
	str r0, [sp]
	mov r0, #0
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x20]
	str r0, [sp, #4]
	str r0, [sp, #8]
	lsl r1, r1, #0x10
	lsl r2, r2, #0x18
	ldr r0, [sp, #0x24]
	lsr r1, r1, #0x10
	lsr r2, r2, #0x18
	mov r3, #2
	bl sub_020701E4
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0x78
	add r1, #0x7a
	ldrh r0, [r0]
	ldrh r1, [r1]
	ldr r2, [r6, #4]
	bl sub_0201442C
	str r0, [r7, #0x60]
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0x78
	add r1, #0x7c
	ldrh r0, [r0]
	ldrh r1, [r1]
	ldr r2, [r6, #4]
	bl sub_02014450
	str r0, [r7, #0x6c]
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	ldr r2, [r7, #0x60]
	ldr r3, [r7, #0x6c]
	bl ov61_021E7108
	lsl r1, r4, #0x18
	ldr r2, [r6, #4]
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ov61_021E7188
	ldr r0, [sp, #0x14]
	add r4, r4, #1
	add r0, #0x18
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	add r7, r7, #4
	add r0, r0, #4
	str r0, [sp, #0x10]
	cmp r4, #3
	bge _021E70F8
	b _021E6FEA
_021E70F8:
	ldr r0, [sp, #0x18]
	bl NARC_dtor
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7104: .word 0x00000578
	thumb_func_end ov61_021E6FC4

	thumb_func_start ov61_021E7108
ov61_021E7108: ; 0x021E7108
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r1, #0
	add r1, sp, #0x10
	ldrb r1, [r1, #0x10]
	add r4, r2, #0
	add r6, r3, #0
	str r1, [sp]
	bl sub_0200A7BC
	add r5, r0, #0
	ldr r1, [sp]
	add r0, r7, #0
	bl sub_0200A7BC
	add r7, r0, #0
	add r0, r5, #0
	bl sub_0200ADA4
	add r0, r7, #0
	bl sub_0200B00C
	add r0, r5, #0
	bl sub_0200AF00
	add r5, r0, #0
	add r0, r7, #0
	add r1, r5, #0
	bl sub_0200B0F8
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #2
	bl NNS_G2dGetImageLocation
	str r0, [sp, #4]
	add r0, r7, #0
	mov r1, #2
	bl NNS_G2dGetImagePaletteLocation
	mov r1, #0x32
	add r5, r0, #0
	add r0, r4, #0
	lsl r1, r1, #6
	bl DC_FlushRange
	mov r2, #0x32
	ldr r1, [sp, #4]
	add r0, r4, #0
	lsl r2, r2, #6
	bl GXS_LoadOBJ
	add r0, r6, #0
	mov r1, #0x20
	bl DC_FlushRange
	add r0, r6, #0
	add r1, r5, #0
	mov r2, #0x20
	bl GXS_LoadOBJPltt
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov61_021E7108

	thumb_func_start ov61_021E7188
ov61_021E7188: ; 0x021E7188
	push {r4, r5, r6, lr}
	sub sp, #0x80
	add r4, r1, #0
	add r5, r0, #0
	mov r0, #0
	str r4, [sp]
	mvn r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	add r6, r2, #0
	ldr r2, [r5]
	add r3, r4, #0
	str r2, [sp, #0x14]
	ldr r2, [r5, #4]
	str r2, [sp, #0x18]
	ldr r2, [r5, #8]
	str r2, [sp, #0x1c]
	ldr r2, [r5, #0xc]
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, sp, #0x5c
	add r2, r4, #0
	bl sub_02009D48
	add r0, r5, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #0
	str r0, [sp, #0x2c]
	add r0, sp, #0x5c
	str r0, [sp, #0x30]
	mov r0, #1
	lsl r0, r0, #0xc
	str r1, [sp, #0x34]
	str r1, [sp, #0x38]
	str r1, [sp, #0x3c]
	str r0, [sp, #0x40]
	str r0, [sp, #0x44]
	str r0, [sp, #0x48]
	add r0, sp, #0x2c
	strh r1, [r0, #0x20]
	mov r0, #2
	str r0, [sp, #0x54]
	lsl r0, r0, #0x12
	str r0, [sp, #0x34]
	mov r0, #0x12
	lsl r0, r0, #0x10
	str r0, [sp, #0x38]
	mov r0, #0x6d
	lsl r0, r0, #2
	add r5, r5, r0
	str r1, [sp, #0x50]
	str r6, [sp, #0x58]
	lsl r4, r4, #2
	add r0, sp, #0x2c
	bl sub_02024624
	str r0, [r5, r4]
	ldr r0, [r5, r4]
	mov r1, #0
	bl sub_0202484C
	ldr r0, [r5, r4]
	mov r1, #0
	bl sub_020248F0
	ldr r0, [r5, r4]
	mov r1, #0
	bl sub_02024830
	add sp, #0x80
	pop {r4, r5, r6, pc}
	thumb_func_end ov61_021E7188

	thumb_func_start ov61_021E7220
ov61_021E7220: ; 0x021E7220
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xed
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov61_021E7248
	mov r0, #0xe5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	lsl r0, r0, #2
	add r1, r4, r0
	ldr r0, _021E7244 ; =0x00000568
	ldr r0, [r1, r0]
	mov r1, #1
	bl sub_02024830
	pop {r4, pc}
	.balign 4, 0
_021E7244: .word 0x00000568
	thumb_func_end ov61_021E7220

	thumb_func_start ov61_021E7248
ov61_021E7248: ; 0x021E7248
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	mov r6, #0x6d
	add r5, r0, #0
	add r7, r4, #0
	lsl r6, r6, #2
_021E7254:
	ldr r0, [r5, r6]
	add r1, r7, #0
	bl sub_02024830
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #3
	blt _021E7254
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov61_021E7248

	thumb_func_start ov61_021E7268
ov61_021E7268: ; 0x021E7268
	push {r0, r1, r2, r3}
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	mov r2, #0xe5
	lsl r2, r2, #2
	add r4, r0, #0
	add r0, r2, #0
	add r0, #0x13
	ldrb r0, [r4, r0]
	ldr r5, [r4, r2]
	mov r3, #8
	add r1, r0, #1
	add r0, r2, #0
	add r0, #0x13
	strb r1, [r4, r0]
	add r2, #0x13
	ldrb r2, [r4, r2]
	add r0, sp, #0x54
	add r1, sp, #0x58
	bl ov61_021E7348
	add r2, sp, #0xc
	ldr r3, _021E7330 ; =0x021E73D4
	add r6, r0, #0
	ldmia r3!, {r0, r1}
	add r7, r2, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	ldr r3, _021E7334 ; =0x021E738C
	str r0, [r2]
	add r2, sp, #0
	ldmia r3!, {r0, r1}
	mov ip, r2
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r1, [sp, #4]
	ldr r0, _021E7338 ; =0x0000D73F
	add r2, r7, #0
	add r0, r1, r0
	str r0, [sp, #4]
	add r0, r7, #0
	mov r1, ip
	bl VEC_Subtract
	asr r0, r6, #4
	lsl r3, r0, #1
	lsl r1, r3, #1
	ldr r2, _021E733C ; =0x021094DC
	add r3, r3, #1
	lsl r3, r3, #1
	ldrsh r1, [r2, r1]
	ldrsh r2, [r2, r3]
	add r0, sp, #0x18
	bl MTX_RotX33_
	add r0, r7, #0
	add r1, sp, #0x18
	add r2, r0, #0
	bl MTX_MultVec33
	add r0, r7, #0
	add r1, sp, #0
	add r2, r0, #0
	bl VEC_Add
	add r2, r4, #0
	add r1, r5, #3
	mov r0, #0x78
	mul r0, r1
	add r2, #0x70
	add r0, r2, r0
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	bl ov61_021E6934
	mov r0, #0x78
	mul r0, r5
	add r1, r4, r0
	ldr r0, _021E7340 ; =0x0000024E
	strh r6, [r1, r0]
	ldr r0, _021E7344 ; =0x000003A7
	ldrb r1, [r4, r0]
	cmp r1, #8
	blo _021E7324
	mov r1, #0
	strb r1, [r4, r0]
	add sp, #0x3c
	mov r0, #1
	pop {r4, r5, r6, r7}
	pop {r3}
	add sp, #0x10
	bx r3
_021E7324:
	mov r0, #0
	add sp, #0x3c
	pop {r4, r5, r6, r7}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
_021E7330: .word 0x021E73D4
_021E7334: .word 0x021E738C
_021E7338: .word 0x0000D73F
_021E733C: .word 0x021094DC
_021E7340: .word 0x0000024E
_021E7344: .word 0x000003A7
	thumb_func_end ov61_021E7268

	thumb_func_start ov61_021E7348
ov61_021E7348: ; 0x021E7348
	push {r4, lr}
	ldr r4, [r0]
	ldr r0, [r1]
	cmp r0, r4
	blt _021E7364
	sub r0, r0, r4
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	add r0, r1, #0
	mul r0, r2
	add r1, r3, #0
	bl _s32_div_f
	b _021E7376
_021E7364:
	sub r0, r4, r0
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	add r0, r1, #0
	mul r0, r2
	add r1, r3, #0
	bl _s32_div_f
	neg r0, r0
_021E7376:
	add r0, r4, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov61_021E7348

	.rodata

_021E7380:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0xE0, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x98, 0x00, 0x00, 0x00, 0x9B, 0x00, 0x00, 0x00
	.byte 0x9E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0xE0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x05, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x04, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x03, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00
	; 0x021E74BC
