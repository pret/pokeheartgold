	.include "asm/macros.inc"
	.include "overlay_80_02236450.inc"
	.include "global.inc"

    .text

	thumb_func_start ov80_02236450
ov80_02236450: ; 0x02236450
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldrb r0, [r5, #0xf]
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl ov80_02236B04
	add r3, r0, #0
	ldr r2, [sp, #0x3c]
	add r0, r4, #0
	add r1, r6, #0
	bl ov80_02229F04
	str r0, [sp, #0x14]
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x30]
	add r4, #0x30
	str r0, [sp, #4]
	ldr r0, [sp, #0x34]
	ldr r1, [sp, #0x14]
	str r0, [sp, #8]
	ldr r0, [sp, #0x38]
	add r2, r6, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x3c]
	add r3, r4, #0
	str r0, [sp, #0x10]
	add r0, r5, #0
	bl ov80_022364A4
	add r4, r0, #0
	ldr r0, [sp, #0x14]
	bl FreeToHeap
	add r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_02236450

	thumb_func_start ov80_022364A4
ov80_022364A4: ; 0x022364A4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x84
	add r7, r0, #0
	ldr r0, [sp, #0x9c]
	str r2, [sp, #0x18]
	str r0, [sp, #0x9c]
	ldr r0, [sp, #0xa0]
	str r1, [sp, #0x14]
	str r0, [sp, #0xa0]
	ldr r0, [sp, #0xa4]
	str r3, [sp, #0x1c]
	str r0, [sp, #0xa4]
	ldr r0, [sp, #0xa8]
	str r0, [sp, #0xa8]
	mov r0, #0
	str r0, [sp, #0x2c]
	add r0, sp, #0x88
	ldrb r0, [r0, #0x10]
	cmp r0, #4
	bls _022364D0
	bl GF_AssertFail
_022364D0:
	add r0, sp, #0x88
	ldrb r6, [r0, #0x10]
	mov r4, #0
	str r4, [sp, #0x30]
	cmp r6, #0
	bne _022364DE
	b _022365EE
_022364DE:
	add r0, sp, #0x74
	str r0, [sp, #0x24]
_022364E2:
	add r0, r7, #0
	bl sub_0204B510
	ldr r1, [sp, #0x14]
	ldrh r1, [r1, #2]
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r1, r0, #0x17
	ldr r0, [sp, #0x14]
	add r0, r0, r1
	ldrh r0, [r0, #4]
	str r0, [sp, #0x34]
	ldrb r0, [r7, #0xf]
	bl ov80_02236AF0
	add r2, r0, #0
	ldr r1, [sp, #0x34]
	add r0, sp, #0x44
	bl ov80_02229EF4
	mov r0, #0
	str r0, [sp, #0x40]
	cmp r4, #0
	ble _0223653C
	add r5, sp, #0x74
_02236516:
	ldrb r0, [r7, #0xf]
	bl ov80_02236AF0
	add r2, r0, #0
	ldr r1, [r5]
	add r0, sp, #0x54
	bl ov80_02229EF4
	add r0, sp, #0x44
	ldrh r1, [r0, #0x10]
	ldrh r0, [r0]
	cmp r1, r0
	beq _0223653C
	ldr r0, [sp, #0x40]
	add r5, r5, #4
	add r0, r0, #1
	str r0, [sp, #0x40]
	cmp r0, r4
	blt _02236516
_0223653C:
	ldr r0, [sp, #0x40]
	cmp r0, r4
	bne _022365E8
	ldr r0, [sp, #0x9c]
	cmp r0, #0
	beq _02236566
	mov r0, #0
	cmp r6, #0
	ble _02236562
	add r1, sp, #0x44
	ldrh r3, [r1]
	ldr r2, [sp, #0x9c]
_02236554:
	ldrh r1, [r2]
	cmp r3, r1
	beq _02236562
	add r0, r0, #1
	add r2, r2, #2
	cmp r0, r6
	blt _02236554
_02236562:
	cmp r0, r6
	bne _022365E8
_02236566:
	ldr r0, [sp, #0x30]
	cmp r0, #0x32
	bge _022365DE
	mov r0, #0
	str r0, [sp, #0x20]
	cmp r4, #0
	ble _022365A0
	add r5, sp, #0x74
_02236576:
	ldrb r0, [r7, #0xf]
	bl ov80_02236AF0
	add r2, r0, #0
	ldr r1, [r5]
	add r0, sp, #0x54
	bl ov80_02229EF4
	add r0, sp, #0x44
	ldrh r1, [r0, #0x1c]
	cmp r1, #0
	beq _02236594
	ldrh r0, [r0, #0xc]
	cmp r1, r0
	beq _022365A0
_02236594:
	ldr r0, [sp, #0x20]
	add r5, r5, #4
	add r0, r0, #1
	str r0, [sp, #0x20]
	cmp r0, r4
	blt _02236576
_022365A0:
	ldr r0, [sp, #0x20]
	cmp r0, r4
	beq _022365AE
	ldr r0, [sp, #0x30]
	add r0, r0, #1
	str r0, [sp, #0x30]
	b _022365E8
_022365AE:
	ldr r0, [sp, #0xa0]
	cmp r0, #0
	beq _022365DE
	mov r0, #0
	cmp r6, #0
	ble _022365D2
	add r1, sp, #0x44
	ldrh r3, [r1, #0xc]
	ldr r2, [sp, #0xa0]
_022365C0:
	ldrh r1, [r2]
	cmp r3, r1
	bne _022365CA
	cmp r1, #0
	bne _022365D2
_022365CA:
	add r0, r0, #1
	add r2, r2, #2
	cmp r0, r6
	blt _022365C0
_022365D2:
	cmp r0, r6
	beq _022365DE
	ldr r0, [sp, #0x30]
	add r0, r0, #1
	str r0, [sp, #0x30]
	b _022365E8
_022365DE:
	ldr r1, [sp, #0x34]
	ldr r0, [sp, #0x24]
	add r4, r4, #1
	stmia r0!, {r1}
	str r0, [sp, #0x24]
_022365E8:
	cmp r4, r6
	beq _022365EE
	b _022364E2
_022365EE:
	ldr r0, [sp, #0x18]
	bl sub_0204B4D4
	str r0, [sp, #0x3c]
	add r0, r7, #0
	bl sub_0204B510
	add r5, r0, #0
	add r0, r7, #0
	bl sub_0204B510
	lsl r0, r0, #0x10
	orr r0, r5
	str r0, [sp, #0x38]
	ldr r0, [sp, #0x30]
	cmp r0, #0x32
	blt _02236614
	mov r0, #1
	str r0, [sp, #0x2c]
_02236614:
	mov r5, #0
	cmp r4, #0
	ble _0223665C
	add r0, sp, #0x74
	str r0, [sp, #0x28]
	add r6, sp, #0x64
_02236620:
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x3c]
	ldr r2, [sp, #0x28]
	str r0, [sp, #4]
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x1c]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0xa8]
	ldr r3, [sp, #0x38]
	str r0, [sp, #0x10]
	ldr r2, [r2]
	add r0, r7, #0
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	bl ov80_02236734
	stmia r6!, {r0}
	ldr r0, [sp, #0x28]
	add r5, r5, #1
	add r0, r0, #4
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x1c]
	add r0, #0x38
	str r0, [sp, #0x1c]
	cmp r5, r4
	blt _02236620
_0223665C:
	ldr r0, [sp, #0xa4]
	cmp r0, #0
	bne _02236668
	ldr r0, [sp, #0x2c]
	add sp, #0x84
	pop {r4, r5, r6, r7, pc}
_02236668:
	ldr r1, [sp, #0x38]
	ldr r2, [sp, #0xa4]
	str r1, [r0]
	mov r3, #0
	add r0, sp, #0x74
	add r1, sp, #0x64
_02236674:
	ldr r5, [r0]
	ldr r4, [sp, #0xa4]
	add r3, r3, #1
	strh r5, [r4, #4]
	ldr r4, [r1]
	add r0, r0, #4
	str r4, [r2, #8]
	ldr r4, [sp, #0xa4]
	add r1, r1, #4
	add r4, r4, #2
	add r2, r2, #4
	str r4, [sp, #0xa4]
	cmp r3, #2
	blt _02236674
	ldr r0, [sp, #0x2c]
	add sp, #0x84
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_022364A4

	thumb_func_start ov80_02236698
ov80_02236698: ; 0x02236698
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r4, r2, #0
	mov r2, #0x11
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0
	lsl r2, r2, #4
	bl MI_CpuFill8
	add r0, r6, #0
	bl sub_0202D928
	add r6, r0, #0
	bl sub_0202D7B0
	cmp r0, #0
	bne _022366C6
	add r0, r5, #0
	add r1, r4, #0
	bl ov80_022366D4
	pop {r4, r5, r6, pc}
_022366C6:
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl sub_0202D804
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov80_02236698

	thumb_func_start ov80_022366D4
ov80_022366D4: ; 0x022366D4
	push {r3, r4, r5, r6, r7, lr}
	mov r2, #0x11
	add r4, r1, #0
	mov r1, #0
	lsl r2, r2, #4
	add r5, r0, #0
	bl MI_CpuFill8
	mov r0, #6
	mul r0, r4
	ldr r1, _02236728 ; =ov80_0223C050
	str r0, [sp]
	add r6, r1, r0
	ldr r1, _0223672C ; =ov80_0223C07C
	mov r2, #0x30
	add r0, r4, #0
	mul r0, r2
	add r0, r1, r0
	add r1, r5, #0
	ldr r7, _02236730 ; =ov80_0223C0AC
	bl MI_CpuCopy8
	ldr r1, _02236728 ; =ov80_0223C050
	ldr r0, [sp]
	mov r4, #0
	ldrh r0, [r1, r0]
	strh r0, [r5, #6]
	add r5, #0x30
_0223670C:
	add r0, r6, r4
	ldrb r1, [r0, #2]
	mov r0, #0x38
	mov r2, #0x38
	mul r0, r1
	add r0, r7, r0
	add r1, r5, #0
	bl MI_CpuCopy8
	add r4, r4, #1
	add r5, #0x38
	cmp r4, #4
	blt _0223670C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02236728: .word ov80_0223C050
_0223672C: .word ov80_0223C07C
_02236730: .word ov80_0223C0AC
	thumb_func_end ov80_022366D4

	thumb_func_start ov80_02236734
ov80_02236734: ; 0x02236734
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r1, #0
	add r4, r0, #0
	add r6, r2, #0
	add r0, r5, #0
	mov r1, #0
	mov r2, #0x38
	str r3, [sp]
	bl MI_CpuFill8
	ldrb r0, [r4, #0xf]
	bl ov80_02236AF0
	add r2, r0, #0
	add r0, sp, #8
	add r1, r6, #0
	bl ov80_02229EF4
	add r2, sp, #8
	ldrh r0, [r5]
	ldr r1, _022368E4 ; =0xFFFFF800
	ldrh r3, [r2]
	and r0, r1
	lsr r1, r1, #0x15
	and r1, r3
	orr r0, r1
	strh r0, [r5]
	ldrh r1, [r5]
	ldr r0, _022368E8 ; =0xFFFF07FF
	and r1, r0
	ldrh r0, [r2, #0xe]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x10
	orr r0, r1
	strh r0, [r5]
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	beq _0223678E
	add r0, sp, #0x20
	ldrb r0, [r0, #0x18]
	lsl r1, r0, #1
	ldr r0, _022368EC ; =ov80_0223C048
	ldrh r0, [r0, r1]
	b _02236790
_0223678E:
	ldrh r0, [r2, #0xc]
_02236790:
	strh r0, [r5, #2]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r0, #0
	add r1, sp, #8
	add r2, r5, #0
	add r3, r0, #0
_0223679E:
	ldrh r6, [r1, #2]
	strh r6, [r2, #4]
	ldrh r6, [r1, #2]
	cmp r6, #0xda
	bne _022367AA
	str r3, [sp, #4]
_022367AA:
	add r0, r0, #1
	add r1, r1, #2
	add r2, r2, #2
	cmp r0, #4
	blt _0223679E
	ldr r0, [sp]
	ldr r7, [sp, #0x30]
	str r0, [r5, #0xc]
	cmp r7, #0
	bne _022367F0
_022367BE:
	add r0, r4, #0
	bl sub_0204B510
	add r6, r0, #0
	add r0, r4, #0
	bl sub_0204B510
	lsl r0, r0, #0x10
	add r7, r6, #0
	orr r7, r0
	add r0, r7, #0
	bl GetNatureFromPersonality
	add r1, sp, #8
	ldrb r1, [r1, #0xb]
	cmp r1, r0
	bne _022367BE
	ldr r0, [sp]
	add r1, r7, #0
	bl CalcShininessByOtIdAndPersonality
	cmp r0, #1
	beq _022367BE
	str r7, [r5, #0x10]
	b _022367F2
_022367F0:
	str r7, [r5, #0x10]
_022367F2:
	add r0, sp, #0x20
	ldrb r1, [r0, #0x14]
	ldr r2, [r5, #0x14]
	mov r0, #0x1f
	bic r2, r0
	mov r0, #0x1f
	and r0, r1
	orr r2, r0
	ldr r0, _022368F0 ; =0xFFFFFC1F
	mov r6, #0
	and r2, r0
	lsl r0, r1, #0x1b
	lsr r1, r0, #0x16
	orr r2, r1
	ldr r1, _022368F4 ; =0xFFFF83FF
	add r4, r6, #0
	and r2, r1
	lsr r1, r0, #0x11
	orr r2, r1
	ldr r1, _022368F8 ; =0xFFF07FFF
	and r2, r1
	lsr r1, r0, #0xc
	orr r2, r1
	ldr r1, _022368FC ; =0xFE0FFFFF
	and r2, r1
	lsr r1, r0, #7
	orr r2, r1
	ldr r1, _02236900 ; =0xC1FFFFFF
	lsr r0, r0, #2
	and r1, r2
	orr r0, r1
	str r0, [r5, #0x14]
_02236832:
	add r0, r4, #0
	bl MaskOfFlagNo
	add r1, sp, #8
	ldrb r1, [r1, #0xa]
	tst r0, r1
	beq _02236842
	add r6, r6, #1
_02236842:
	add r4, r4, #1
	cmp r4, #6
	blt _02236832
	ldr r0, _02236904 ; =0x000001FE
	add r1, r6, #0
	bl _s32_div_f
	cmp r0, #0xff
	ble _02236856
	mov r0, #0xff
_02236856:
	lsl r0, r0, #0x18
	mov r4, #0
	lsr r6, r0, #0x18
_0223685C:
	add r0, r4, #0
	bl MaskOfFlagNo
	add r1, sp, #8
	ldrb r1, [r1, #0xa]
	tst r0, r1
	beq _0223686E
	add r0, r5, r4
	strb r6, [r0, #0x18]
_0223686E:
	add r4, r4, #1
	cmp r4, #6
	blt _0223685C
	mov r0, #0
	strb r0, [r5, #0x1e]
	ldr r0, _02236908 ; =gGameLanguage
	mov r1, #0x19
	ldrb r0, [r0]
	strb r0, [r5, #0x1f]
	ldrh r0, [r5]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x15
	bl GetMonBaseStat
	cmp r0, #0
	beq _022368B2
	ldr r2, [r5, #0x10]
	mov r1, #1
	tst r1, r2
	beq _0223689E
	add r1, r5, #0
	add r1, #0x20
	strb r0, [r1]
	b _022368C4
_0223689E:
	ldrh r0, [r5]
	mov r1, #0x18
	lsl r0, r0, #0x15
	lsr r0, r0, #0x15
	bl GetMonBaseStat
	add r1, r5, #0
	add r1, #0x20
	strb r0, [r1]
	b _022368C4
_022368B2:
	ldrh r0, [r5]
	mov r1, #0x18
	lsl r0, r0, #0x15
	lsr r0, r0, #0x15
	bl GetMonBaseStat
	add r1, r5, #0
	add r1, #0x20
	strb r0, [r1]
_022368C4:
	add r1, r5, #0
	ldr r0, [sp, #4]
	add r1, #0x21
	strb r0, [r1]
	ldrh r0, [r5]
	add r5, #0x22
	ldr r1, [sp, #0x40]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x15
	add r2, r5, #0
	bl GetSpeciesNameIntoArray
	add r0, r7, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022368E4: .word 0xFFFFF800
_022368E8: .word 0xFFFF07FF
_022368EC: .word ov80_0223C048
_022368F0: .word 0xFFFFFC1F
_022368F4: .word 0xFFFF83FF
_022368F8: .word 0xFFF07FFF
_022368FC: .word 0xFE0FFFFF
_02236900: .word 0xC1FFFFFF
_02236904: .word 0x000001FE
_02236908: .word gGameLanguage
	thumb_func_end ov80_02236734

	thumb_func_start ov80_0223690C
ov80_0223690C: ; 0x0223690C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldrb r0, [r5, #0xf]
	add r4, r1, #0
	bl ov80_02236A88
	add r1, r0, #0
	ldr r0, [r5, #4]
	bl BattleSetup_New
	add r7, r0, #0
	ldr r0, [r4, #8]
	bl SaveArray_Party_Get
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	mov r1, #0
	str r0, [sp]
	ldr r0, [r4, #0x1c]
	str r0, [sp, #4]
	ldr r2, [r4, #8]
	ldr r3, [r4, #0x18]
	add r0, r7, #0
	bl sub_02051D18
	mov r0, #0x53
	mov r1, #0x12
	lsl r0, r0, #2
	str r1, [r7, r0]
	add r0, r0, #4
	str r1, [r7, r0]
	ldr r0, [r5, #4]
	bl AllocMonZeroed
	add r4, r0, #0
	ldrb r1, [r5, #0xe]
	ldr r0, [r7, #4]
	bl Party_InitWithMaxSize
	ldrb r0, [r5, #0xe]
	mov r6, #0
	cmp r0, #0
	ble _022369B8
_02236964:
	add r1, r5, r6
	add r1, #0x2a
	ldrb r1, [r1]
	ldr r0, [sp, #8]
	bl Party_GetMonByIndex
	add r1, r4, #0
	bl CopyPokemonToPokemon
	add r0, r4, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	cmp r0, #0x32
	bls _022369A6
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	mov r1, #0x32
	bl GetMonExpBySpeciesAndLevel
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #8
	add r2, sp, #0xc
	bl SetMonData
	add r0, r4, #0
	bl CalcMonLevelAndStats
_022369A6:
	add r0, r7, #0
	add r1, r4, #0
	mov r2, #0
	bl BattleSetup_AddMonToParty
	ldrb r0, [r5, #0xe]
	add r6, r6, #1
	cmp r6, r0
	blt _02236964
_022369B8:
	add r0, r4, #0
	bl FreeToHeap
	add r0, r7, #0
	bl BattleSetup_SetAllySideBattlersToPlayer
	ldr r0, [r5, #4]
	add r1, r5, #0
	str r0, [sp]
	ldrb r2, [r5, #0xe]
	add r0, r7, #0
	add r1, #0x78
	mov r3, #1
	bl ov80_02236A34
	mov r2, #0
	add r1, r7, #0
	mov r0, #7
_022369DC:
	add r2, r2, #1
	str r0, [r1, #0x34]
	add r1, #0x34
	cmp r2, #4
	blt _022369DC
	ldrb r0, [r5, #0xf]
	cmp r0, #2
	beq _022369F6
	cmp r0, #3
	beq _02236A18
	cmp r0, #6
	beq _02236A18
	b _02236A2C
_022369F6:
	ldr r0, [r5, #4]
	mov r1, #0xa6
	str r0, [sp]
	ldrb r2, [r5, #0x10]
	lsl r1, r1, #2
	add r1, r5, r1
	lsl r2, r2, #0x18
	lsr r3, r2, #0x1d
	lsl r2, r3, #4
	add r2, r3, r2
	lsl r2, r2, #4
	add r1, r1, r2
	ldrb r2, [r5, #0xe]
	add r0, r7, #0
	mov r3, #2
	bl ov80_02236A34
_02236A18:
	ldr r0, [r5, #4]
	mov r1, #0x62
	str r0, [sp]
	ldrb r2, [r5, #0xe]
	lsl r1, r1, #2
	add r0, r7, #0
	add r1, r5, r1
	mov r3, #3
	bl ov80_02236A34
_02236A2C:
	add r0, r7, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0223690C

	thumb_func_start ov80_02236A34
ov80_02236A34: ; 0x02236A34
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r4, [sp, #0x28]
	str r0, [sp, #4]
	add r5, r1, #0
	add r7, r2, #0
	str r3, [sp, #8]
	str r4, [sp]
	bl ov80_0222A480
	ldr r0, [sp, #0x28]
	bl AllocMonZeroed
	add r4, r0, #0
	mov r6, #0
	cmp r7, #0
	ble _02236A7E
	ldr r0, [sp, #8]
	add r5, #0x30
	lsl r1, r0, #2
	ldr r0, [sp, #4]
	add r0, r0, r1
	str r0, [sp, #0xc]
_02236A62:
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x78
	bl ov80_0222A140
	ldr r0, [sp, #0xc]
	add r1, r4, #0
	ldr r0, [r0, #4]
	bl Party_AddMon
	add r6, r6, #1
	add r5, #0x38
	cmp r6, r7
	blt _02236A62
_02236A7E:
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_02236A34

	thumb_func_start ov80_02236A88
ov80_02236A88: ; 0x02236A88
	cmp r0, #6
	bhi _02236AB6
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02236A98: ; jump table
	.short _02236AA6 - _02236A98 - 2 ; case 0
	.short _02236AAA - _02236A98 - 2 ; case 1
	.short _02236AAE - _02236A98 - 2 ; case 2
	.short _02236AB2 - _02236A98 - 2 ; case 3
	.short _02236AA6 - _02236A98 - 2 ; case 4
	.short _02236AB6 - _02236A98 - 2 ; case 5
	.short _02236AB2 - _02236A98 - 2 ; case 6
_02236AA6:
	mov r0, #0x81
	bx lr
_02236AAA:
	mov r0, #0x83
	bx lr
_02236AAE:
	mov r0, #0xcb
	bx lr
_02236AB2:
	mov r0, #0x8f
	bx lr
_02236AB6:
	mov r0, #0x81
	bx lr
	.balign 4, 0
	thumb_func_end ov80_02236A88

	thumb_func_start ov80_02236ABC
ov80_02236ABC: ; 0x02236ABC
	ldrb r3, [r0, #0x10]
	mov r2, #8
	bic r3, r2
	lsl r2, r1, #0x18
	lsr r2, r2, #0x18
	lsl r2, r2, #0x1f
	lsr r2, r2, #0x1c
	orr r2, r3
	strb r2, [r0, #0x10]
	ldr r2, _02236AD4 ; =0x0000083E
	strh r1, [r0, r2]
	bx lr
	.balign 4, 0
_02236AD4: .word 0x0000083E
	thumb_func_end ov80_02236ABC

	thumb_func_start ov80_02236AD8
ov80_02236AD8: ; 0x02236AD8
	ldrb r0, [r0, #0x10]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	bne _02236AE6
	ldrh r0, [r1]
	cmp r0, #0
	beq _02236AEA
_02236AE6:
	mov r0, #1
	bx lr
_02236AEA:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov80_02236AD8

	thumb_func_start ov80_02236AF0
ov80_02236AF0: ; 0x02236AF0
	push {r3, lr}
	bl ov80_02236B30
	cmp r0, #0
	bne _02236AFE
	mov r0, #0x81
	pop {r3, pc}
_02236AFE:
	mov r0, #0xcd
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02236AF0

	thumb_func_start ov80_02236B04
ov80_02236B04: ; 0x02236B04
	push {r3, lr}
	bl ov80_02236B30
	cmp r0, #0
	bne _02236B12
	mov r0, #0x80
	pop {r3, pc}
_02236B12:
	mov r0, #0xcc
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02236B04

	thumb_func_start ov80_02236B18
ov80_02236B18: ; 0x02236B18
	push {r3, lr}
	bl ov80_02236B30
	cmp r0, #0
	bne _02236B26
	ldr r0, _02236B2C ; =0x000002D3
	pop {r3, pc}
_02236B26:
	mov r0, #0xb5
	lsl r0, r0, #2
	pop {r3, pc}
	.balign 4, 0
_02236B2C: .word 0x000002D3
	thumb_func_end ov80_02236B18

	thumb_func_start ov80_02236B30
ov80_02236B30: ; 0x02236B30
	push {r3, r4, r5, lr}
	cmp r0, #3
	beq _02236B3A
	cmp r0, #6
	bne _02236B74
_02236B3A:
	mov r0, #0
	bl sub_02034818
	add r5, r0, #0
	bne _02236B48
	bl GF_AssertFail
_02236B48:
	mov r0, #1
	bl sub_02034818
	add r4, r0, #0
	bne _02236B56
	bl GF_AssertFail
_02236B56:
	add r0, r5, #0
	bl PlayerProfile_GetVersion
	add r5, r0, #0
	add r0, r4, #0
	bl PlayerProfile_GetVersion
	cmp r5, #0
	beq _02236B6C
	cmp r0, #0
	bne _02236B70
_02236B6C:
	mov r0, #0
	pop {r3, r4, r5, pc}
_02236B70:
	mov r0, #1
	pop {r3, r4, r5, pc}
_02236B74:
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_02236B30
