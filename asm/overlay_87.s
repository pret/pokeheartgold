	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov87_021E5900
ov87_021E5900: ; 0x021E5900
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	bl ov87_021E68A4
	mov r2, #0x12
	mov r0, #3
	mov r1, #0x7a
	lsl r2, r2, #0xe
	bl CreateHeap
	ldr r1, _021E59AC ; =0x000099FC
	add r0, r5, #0
	mov r2, #0x7a
	bl OverlayManager_CreateAndGetData
	ldr r2, _021E59AC ; =0x000099FC
	mov r1, #0
	add r4, r0, #0
	bl memset
	mov r0, #0x7a
	bl BgConfig_Alloc
	str r0, [r4, #0x58]
	add r0, r5, #0
	str r5, [r4]
	bl OverlayManager_GetParentWork
	add r5, r0, #0
	mov r1, #0x5a
	add r2, r5, #0
	ldr r0, [r5]
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldrb r0, [r5, #4]
	add r2, #0x14
	strb r0, [r4, #9]
	mov r0, #0xdd
	lsl r0, r0, #2
	str r2, [r4, r0]
	ldr r0, [r4, r1]
	bl Sav2_PlayerData_GetOptionsAddr
	mov r1, #0x59
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r1, r5, #0
	mov r0, #0xde
	add r1, #8
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r5, #0xe
	add r0, r0, #4
	str r5, [r4, r0]
	add r0, r4, #0
	bl ov87_021E7334
	mov r1, #0
	mov r3, #0xde
	lsl r3, r3, #2
	add r2, r1, #0
	add r0, r1, #0
	add r5, r3, #4
_021E5980:
	ldr r6, [r4, r3]
	add r1, r1, #1
	strh r0, [r6, r2]
	ldr r6, [r4, r5]
	strh r0, [r6, r2]
	add r2, r2, #2
	cmp r1, #3
	blt _021E5980
	ldr r1, _021E59B0 ; =0x0000039D
	strb r0, [r4, r1]
	add r0, r4, #0
	bl ov87_021E68DC
	mov r1, #0
	mov r0, #0x42
	add r2, r1, #0
	str r1, [r7]
	bl sub_02004EC4
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E59AC: .word 0x000099FC
_021E59B0: .word 0x0000039D
	thumb_func_end ov87_021E5900

	thumb_func_start ov87_021E59B4
ov87_021E59B4: ; 0x021E59B4
	push {r3, r4, r5, lr}
	add r5, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r5]
	add r4, r0, #0
	cmp r1, #7
	bhi _021E5AB2
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E59D0: ; jump table
	.short _021E59E0 - _021E59D0 - 2 ; case 0
	.short _021E59F4 - _021E59D0 - 2 ; case 1
	.short _021E5A08 - _021E59D0 - 2 ; case 2
	.short _021E5A1C - _021E59D0 - 2 ; case 3
	.short _021E5A58 - _021E59D0 - 2 ; case 4
	.short _021E5A6C - _021E59D0 - 2 ; case 5
	.short _021E5A92 - _021E59D0 - 2 ; case 6
	.short _021E5AA6 - _021E59D0 - 2 ; case 7
_021E59E0:
	bl ov87_021E5AFC
	cmp r0, #1
	bne _021E5AB2
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #1
	bl ov87_021E725C
	b _021E5AB2
_021E59F4:
	bl ov87_021E5B48
	cmp r0, #1
	bne _021E5AB2
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #2
	bl ov87_021E725C
	b _021E5AB2
_021E5A08:
	bl ov87_021E5C38
	cmp r0, #1
	bne _021E5AB2
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #3
	bl ov87_021E725C
	b _021E5AB2
_021E5A1C:
	bl ov87_021E5CEC
	cmp r0, #1
	bne _021E5AB2
	ldrb r0, [r4, #0xe]
	cmp r0, #3
	blo _021E5A4C
	mov r0, #0
	strb r0, [r4, #0xe]
	add r0, r4, #0
	bl ov87_021E6760
	add r0, r4, #0
	bl ov87_021E6668
	add r0, r4, #0
	bl ov87_021E66B8
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #4
	bl ov87_021E725C
	b _021E5AB2
_021E5A4C:
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #1
	bl ov87_021E725C
	b _021E5AB2
_021E5A58:
	bl ov87_021E5E00
	cmp r0, #1
	bne _021E5AB2
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #5
	bl ov87_021E725C
	b _021E5AB2
_021E5A6C:
	bl ov87_021E6080
	cmp r0, #1
	bne _021E5AB2
	ldrb r0, [r4, #0xe]
	cmp r0, #3
	blo _021E5A86
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #7
	bl ov87_021E725C
	b _021E5AB2
_021E5A86:
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #6
	bl ov87_021E725C
	b _021E5AB2
_021E5A92:
	bl ov87_021E64F8
	cmp r0, #1
	bne _021E5AB2
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #4
	bl ov87_021E725C
	b _021E5AB2
_021E5AA6:
	bl ov87_021E65FC
	cmp r0, #1
	bne _021E5AB2
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E5AB2:
	mov r0, #0x5b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0202457C
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov87_021E59B4

	thumb_func_start ov87_021E5AC0
ov87_021E5AC0: ; 0x021E5AC0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	bl sub_02021238
	mov r0, #0xdd
	lsl r0, r0, #2
	ldrb r1, [r4, #0xc]
	ldr r0, [r4, r0]
	strh r1, [r0]
	bl GF_DestroyVramTransferManager
	add r0, r4, #0
	bl ov87_021E6780
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0x7a
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov87_021E5AC0

	thumb_func_start ov87_021E5AFC
ov87_021E5AFC: ; 0x021E5AFC
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldrb r0, [r4, #8]
	cmp r0, #0
	beq _021E5B0E
	cmp r0, #1
	beq _021E5B2E
	b _021E5B40
_021E5B0E:
	mov r0, #6
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x7a
	str r0, [sp, #8]
	mov r0, #0
	mov r1, #1
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _021E5B40
_021E5B2E:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E5B40
	mov r0, #0
	strb r0, [r4, #0xe]
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, pc}
_021E5B40:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov87_021E5AFC

	thumb_func_start ov87_021E5B48
ov87_021E5B48: ; 0x021E5B48
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldrb r0, [r6, #8]
	cmp r0, #0
	beq _021E5B5C
	cmp r0, #1
	beq _021E5BCE
	cmp r0, #2
	beq _021E5C22
	b _021E5C2A
_021E5B5C:
	mov r0, #0xff
	mvn r0, r0
	ldr r4, _021E5C30 ; =ov87_021E81A0
	strh r0, [r6, #0x10]
	mov r7, #0
	add r5, r6, #0
_021E5B68:
	mov r1, #0x10
	mov r2, #0
	ldrsh r1, [r6, r1]
	ldrsh r2, [r4, r2]
	mov r0, #0xcb
	lsl r0, r0, #2
	add r1, r1, r2
	mov r2, #2
	ldrsh r2, [r4, r2]
	ldr r0, [r5, r0]
	bl ov87_021E7FEC
	mov r0, #0xcb
	lsl r0, r0, #2
	add r1, r7, #0
	ldr r0, [r5, r0]
	add r1, #0x14
	bl ov87_021E7FE0
	add r7, r7, #1
	add r4, r4, #4
	add r5, r5, #4
	cmp r7, #4
	blt _021E5B68
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl Options_GetFrame
	add r1, r0, #0
	mov r0, #0x53
	lsl r0, r0, #2
	add r0, r6, r0
	bl ov87_021E8134
	add r0, r6, #0
	bl ov87_021E7048
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineBToggleLayers
	mov r0, #3
	strh r0, [r6, #0x12]
	mov r0, #0x56
	lsl r0, r0, #4
	bl PlaySE
	mov r0, #1
	strb r0, [r6, #8]
	b _021E5C2A
_021E5BCE:
	mov r1, #0x10
	ldrsh r0, [r6, r1]
	add r0, #0x20
	strh r0, [r6, #0x10]
	mov r0, #0x12
	ldrsh r0, [r6, r0]
	lsl r2, r0, #2
	mov r0, #0xcb
	add r3, r6, r2
	lsl r0, r0, #2
	ldr r0, [r3, r0]
	ldrsh r3, [r6, r1]
	ldr r1, _021E5C30 ; =ov87_021E81A0
	ldrsh r1, [r1, r2]
	add r1, r3, r1
	ldr r3, _021E5C34 ; =ov87_021E81A2
	ldrsh r2, [r3, r2]
	bl ov87_021E7FEC
	mov r0, #0x10
	ldrsh r0, [r6, r0]
	cmp r0, #0
	blt _021E5C2A
	mov r0, #0x12
	ldrsh r0, [r6, r0]
	cmp r0, #0
	bne _021E5C0A
	mov r0, #2
	strb r0, [r6, #8]
	b _021E5C2A
_021E5C0A:
	mov r0, #0x56
	lsl r0, r0, #4
	bl PlaySE
	mov r0, #0x12
	ldrsh r0, [r6, r0]
	sub r0, r0, #1
	strh r0, [r6, #0x12]
	mov r0, #0xff
	mvn r0, r0
	strh r0, [r6, #0x10]
	b _021E5C2A
_021E5C22:
	mov r0, #0
	strh r0, [r6, #0x10]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E5C2A:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E5C30: .word ov87_021E81A0
_021E5C34: .word ov87_021E81A2
	thumb_func_end ov87_021E5B48

	thumb_func_start ov87_021E5C38
ov87_021E5C38: ; 0x021E5C38
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	ldrb r0, [r5, #8]
	cmp r0, #0
	beq _021E5C4E
	cmp r0, #1
	beq _021E5C60
	cmp r0, #2
	beq _021E5CD8
	b _021E5CDE
_021E5C4E:
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x1e
	strb r0, [r5, #0xf]
	mov r0, #1
	strb r0, [r5, #8]
	b _021E5CDE
_021E5C60:
	ldrb r0, [r5, #0xf]
	cmp r0, #0
	bne _021E5C7C
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0
	bl ov87_021E7FD4
	b _021E5C80
_021E5C7C:
	sub r0, r0, #1
	strb r0, [r5, #0xf]
_021E5C80:
	ldr r0, _021E5CE4 ; =ov87_021E81C0
	bl sub_02025204
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _021E5CDE
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0
	bl ov87_021E7FD4
	ldr r0, _021E5CE8 ; =0x000005E4
	bl PlaySE
	ldrb r0, [r5, #0xe]
	add r1, sp, #0
	add r0, r5, r0
	strb r4, [r0, #0x15]
	ldrb r0, [r5, #0xe]
	add r0, r0, #1
	strb r0, [r5, #0xe]
	add r0, sp, #4
	bl sub_02025364
	mov r0, #0x53
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl ClearFrameAndWindow2
	mov r0, #1
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #2
	strb r0, [r5, #8]
	b _021E5CDE
_021E5CD8:
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E5CDE:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E5CE4: .word ov87_021E81C0
_021E5CE8: .word 0x000005E4
	thumb_func_end ov87_021E5C38

	thumb_func_start ov87_021E5CEC
ov87_021E5CEC: ; 0x021E5CEC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	ldrb r1, [r4, #0xe]
	sub r1, r1, #1
	add r1, r4, r1
	ldrb r7, [r1, #0x15]
	ldrb r1, [r4, #8]
	cmp r1, #3
	bhi _021E5DFA
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E5D0C: ; jump table
	.short _021E5D14 - _021E5D0C - 2 ; case 0
	.short _021E5D40 - _021E5D0C - 2 ; case 1
	.short _021E5D9E - _021E5D0C - 2 ; case 2
	.short _021E5DF0 - _021E5D0C - 2 ; case 3
_021E5D14:
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [r4, #0x1c]
	str r0, [r4, #0x20]
	str r0, [r4, #0x24]
	mov r1, #0
	mov r2, #0x3a
	strh r1, [r4, #0x10]
	lsl r2, r2, #4
	ldrb r3, [r4, r2]
	mov r0, #0xfe
	bic r3, r0
	lsl r0, r7, #2
	strb r3, [r4, r2]
	add r0, r4, r0
	sub r2, #0x74
	ldr r0, [r0, r2]
	bl ov87_021E7FE0
	mov r0, #1
	strb r0, [r4, #8]
	b _021E5DFA
_021E5D40:
	lsl r1, r7, #0x18
	lsr r1, r1, #0x18
	bl ov87_021E73E0
	mov r0, #1
	ldr r2, [r4, #0x1c]
	lsl r0, r0, #8
	add r2, r2, r0
	str r2, [r4, #0x1c]
	ldr r2, [r4, #0x20]
	add r1, r4, #0
	add r2, r2, r0
	str r2, [r4, #0x20]
	ldr r2, [r4, #0x24]
	add r1, #0x1c
	add r0, r2, r0
	str r0, [r4, #0x24]
	mov r0, #0x10
	ldrsh r0, [r4, r0]
	add r0, r0, #1
	strh r0, [r4, #0x10]
	lsl r0, r7, #2
	add r2, r4, r0
	mov r0, #0xcb
	lsl r0, r0, #2
	ldr r0, [r2, r0]
	bl ov87_021E806C
	mov r0, #6
	ldr r1, [r4, #0x1c]
	lsl r0, r0, #0xa
	cmp r1, r0
	bne _021E5DFA
	mov r0, #0
	strh r0, [r4, #0x10]
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [r4, #0x1c]
	str r0, [r4, #0x20]
	str r0, [r4, #0x24]
	mov r0, #0x56
	lsl r0, r0, #4
	bl PlaySE
	mov r0, #2
	strb r0, [r4, #8]
	b _021E5DFA
_021E5D9E:
	mov r0, #0x10
	ldrsh r0, [r4, r0]
	mov r6, #0
	add r5, r4, #0
	add r0, #0x10
	strh r0, [r4, #0x10]
_021E5DAA:
	mov r0, #0xcb
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, sp, #4
	add r2, sp, #0
	bl ov87_021E8014
	mov r0, #0xcb
	lsl r0, r0, #2
	ldr r1, [sp, #4]
	ldr r0, [r5, r0]
	ldr r2, [sp]
	add r1, #0x10
	bl ov87_021E7FEC
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #4
	blt _021E5DAA
	mov r0, #0x10
	ldrsh r1, [r4, r0]
	add r0, #0xf0
	cmp r1, r0
	blt _021E5DFA
	lsl r0, r7, #2
	add r1, r4, r0
	mov r0, #0xcb
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #0
	bl ov87_021E8058
	mov r0, #3
	strb r0, [r4, #8]
	b _021E5DFA
_021E5DF0:
	mov r0, #0
	strh r0, [r4, #0x10]
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E5DFA:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov87_021E5CEC

	thumb_func_start ov87_021E5E00
ov87_021E5E00: ; 0x021E5E00
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #3
	bls _021E5E0C
	b _021E606C
_021E5E0C:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E5E18: ; jump table
	.short _021E5E20 - _021E5E18 - 2 ; case 0
	.short _021E5EDE - _021E5E18 - 2 ; case 1
	.short _021E5FCE - _021E5E18 - 2 ; case 2
	.short _021E6062 - _021E5E18 - 2 ; case 3
_021E5E20:
	bl ov87_021E7A2C
	mov r1, #0
	mov r3, #0xe3
	str r1, [sp]
	lsl r3, r3, #2
	ldr r2, [r4, r3]
	sub r3, r3, #4
	ldr r3, [r4, r3]
	ldr r0, [r4, #0x58]
	ldr r3, [r3, #0x10]
	bl BG_LoadCharTilesData
	ldr r0, [r4, #0x58]
	mov r1, #0
	bl BgCommitTilemapBufferToVram
	mov r0, #1
	lsl r0, r0, #8
	strh r0, [r4, #0x12]
	mov r3, #0x12
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x58]
	mov r1, #6
	mov r2, #0
	bl BgSetPosTextAndCommit
	mov r3, #0x12
	mov r1, #0
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x58]
	add r2, r1, #0
	bl BgSetPosTextAndCommit
	mov r3, #0x12
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x58]
	mov r1, #1
	mov r2, #0
	bl BgSetPosTextAndCommit
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	mov r0, #2
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #0xff
	mvn r0, r0
	strh r0, [r4, #0x10]
	ldrb r1, [r4, #0xe]
	mov r0, #0
	mov r2, #0x96
	add r1, r4, r1
	strb r0, [r1, #0x19]
	ldr r1, _021E6070 ; =0x000003FA
	add r5, r0, #0
	lsl r2, r2, #8
_021E5EA0:
	add r3, r4, r0
	add r0, r0, #1
	strb r5, [r3, r1]
	cmp r0, r2
	blt _021E5EA0
	ldr r0, _021E6074 ; =0x000003A1
	strb r5, [r4, r0]
	add r0, r4, #0
	bl ov87_021E7334
	ldrb r1, [r4, #0xe]
	add r0, r4, #0
	add r1, r4, r1
	ldrb r1, [r1, #0x19]
	bl ov87_021E7324
	ldrb r1, [r4, #0xe]
	add r0, r4, #0
	add r1, r4, r1
	ldrb r1, [r1, #0x19]
	bl ov87_021E734C
	add r0, r4, #0
	bl ov87_021E74B8
	add r0, r4, #0
	bl ov87_021E74D4
	mov r0, #1
	strb r0, [r4, #8]
	b _021E606C
_021E5EDE:
	mov r7, #0
	mov r6, #0x1a
	add r5, r4, #0
_021E5EE4:
	mov r1, #0x10
	mov r0, #0xbe
	ldrsh r1, [r4, r1]
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, #0x3c
	add r2, r6, #0
	bl ov87_021E7FEC
	mov r0, #0xbe
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl ov87_021E7FD4
	add r7, r7, #1
	add r6, #0x2a
	add r5, r5, #4
	cmp r7, #4
	blt _021E5EE4
	mov r7, #0xd1
	mov r6, #0
	add r5, r4, #0
	lsl r7, r7, #2
_021E5F14:
	ldr r0, [r5, r7]
	mov r1, #1
	bl ov87_021E8078
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #3
	blt _021E5F14
	ldr r0, _021E6078 ; =0x0000039D
	mov r7, #0
	strb r7, [r4, r0]
	add r1, r0, #3
	ldrb r2, [r4, r1]
	mov r1, #1
	ldr r6, _021E607C ; =ov87_021E82E4
	bic r2, r1
	add r1, r0, #3
	strb r2, [r4, r1]
	mov r2, #0xb1
	add r1, r0, #5
	strb r2, [r4, r1]
	add r1, r0, #6
	mov r2, #0xb2
	strb r2, [r4, r1]
	mov r1, #0xb3
	add r0, r0, #7
	strb r1, [r4, r0]
	add r5, r4, #0
_021E5F4C:
	mov r1, #0x10
	mov r2, #0
	ldrsh r1, [r4, r1]
	ldrsh r2, [r6, r2]
	mov r0, #0xc2
	lsl r0, r0, #2
	add r1, r1, r2
	mov r2, #2
	ldrsh r2, [r6, r2]
	ldr r0, [r5, r0]
	bl ov87_021E7FEC
	mov r0, #0xc2
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl ov87_021E7FD4
	mov r1, #0x36
	mov r0, #0xc2
	lsl r0, r0, #2
	add r2, r4, r7
	lsl r1, r1, #4
	ldrb r1, [r2, r1]
	ldr r0, [r5, r0]
	bl ov87_021E803C
	add r7, r7, #1
	add r6, r6, #4
	add r5, r5, #4
	cmp r7, #9
	blt _021E5F4C
	mov r0, #0x18
	str r0, [sp]
	ldrb r2, [r4, #0xe]
	add r0, r4, #0
	mov r1, #1
	add r2, r4, r2
	ldrb r2, [r2, #0x15]
	mov r3, #0x20
	add r2, r2, #4
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl ov87_021E7460
	mov r0, #0x18
	str r0, [sp]
	ldrb r2, [r4, #0xe]
	add r0, r4, #0
	mov r1, #6
	add r2, r4, r2
	ldrb r2, [r2, #0x15]
	mov r3, #0x20
	add r2, r2, #1
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl ov87_021E7460
	mov r0, #0x56
	lsl r0, r0, #4
	bl PlaySE
	mov r0, #2
	strb r0, [r4, #8]
	b _021E606C
_021E5FCE:
	mov r3, #0x12
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x58]
	mov r1, #6
	mov r2, #0
	bl BgSetPosTextAndCommit
	mov r3, #0x12
	mov r1, #0
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x58]
	add r2, r1, #0
	bl BgSetPosTextAndCommit
	mov r3, #0x12
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x58]
	mov r1, #1
	mov r2, #0
	bl BgSetPosTextAndCommit
	mov r0, #0x12
	ldrsh r0, [r4, r0]
	sub r0, #0x10
	strh r0, [r4, #0x12]
	mov r0, #0x10
	ldrsh r0, [r4, r0]
	cmp r0, #0
	blt _021E600E
	mov r0, #3
	strb r0, [r4, #8]
	b _021E6058
_021E600E:
	mov r7, #0
	mov r6, #0x1a
	add r5, r4, #0
_021E6014:
	mov r1, #0x10
	mov r0, #0xbe
	ldrsh r1, [r4, r1]
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, #0x3c
	add r2, r6, #0
	bl ov87_021E7FEC
	add r7, r7, #1
	add r6, #0x2a
	add r5, r5, #4
	cmp r7, #4
	blt _021E6014
	ldr r5, _021E607C ; =ov87_021E82E4
	mov r7, #0
	add r6, r4, #0
_021E6036:
	mov r1, #0x10
	mov r2, #0
	ldrsh r1, [r4, r1]
	ldrsh r2, [r5, r2]
	mov r0, #0xc2
	lsl r0, r0, #2
	add r1, r1, r2
	mov r2, #2
	ldrsh r2, [r5, r2]
	ldr r0, [r6, r0]
	bl ov87_021E7FEC
	add r7, r7, #1
	add r5, r5, #4
	add r6, r6, #4
	cmp r7, #9
	blt _021E6036
_021E6058:
	mov r0, #0x10
	ldrsh r0, [r4, r0]
	add r0, #0x10
	strh r0, [r4, #0x10]
	b _021E606C
_021E6062:
	mov r0, #0
	strh r0, [r4, #0x10]
	strh r0, [r4, #0x12]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E606C:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E6070: .word 0x000003FA
_021E6074: .word 0x000003A1
_021E6078: .word 0x0000039D
_021E607C: .word ov87_021E82E4
	thumb_func_end ov87_021E5E00

	thumb_func_start ov87_021E6080
ov87_021E6080: ; 0x021E6080
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #0xb
	bls _021E608C
	b _021E64F4
_021E608C:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E6098: ; jump table
	.short _021E60B0 - _021E6098 - 2 ; case 0
	.short _021E613E - _021E6098 - 2 ; case 1
	.short _021E6154 - _021E6098 - 2 ; case 2
	.short _021E6184 - _021E6098 - 2 ; case 3
	.short _021E633A - _021E6098 - 2 ; case 4
	.short _021E6356 - _021E6098 - 2 ; case 5
	.short _021E636A - _021E6098 - 2 ; case 6
	.short _021E63BA - _021E6098 - 2 ; case 7
	.short _021E63E4 - _021E6098 - 2 ; case 8
	.short _021E6414 - _021E6098 - 2 ; case 9
	.short _021E647E - _021E6098 - 2 ; case 10
	.short _021E64E8 - _021E6098 - 2 ; case 11
_021E60B0:
	ldrb r0, [r4, #0xe]
	cmp r0, #2
	bne _021E60E2
	mov r0, #0x4b
	lsl r0, r0, #2
	add r0, r4, r0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r4, #0
	bl ov87_021E71B4
	mov r0, #0xcf
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x58
	mov r2, #0xa0
	bl ov87_021E7FEC
	mov r0, #0xcf
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov87_021E803C
	b _021E60F2
_021E60E2:
	mov r0, #0x4f
	lsl r0, r0, #2
	add r0, r4, r0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r4, #0
	bl ov87_021E717C
_021E60F2:
	mov r0, #0x1e
	strb r0, [r4, #0xf]
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #1
	bl ov87_021E7FD4
	add r0, r4, #0
	bl ov87_021E708C
	mov r5, #0
_021E610A:
	lsl r1, r5, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	bl ov87_021E71EC
	add r5, r5, #1
	cmp r5, #4
	blt _021E610A
	mov r0, #0xcf
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl ov87_021E7FD4
	mov r0, #0xcf
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov87_021E8084
	ldr r0, _021E63F4 ; =0x00000562
	bl PlaySE
	mov r0, #1
	strb r0, [r4, #8]
	b _021E64F4
_021E613E:
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineBToggleLayers
	mov r0, #2
	strb r0, [r4, #8]
	b _021E64F4
_021E6154:
	ldrb r0, [r4, #0xf]
	cmp r0, #0
	bne _021E617E
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov87_021E7FD4
	add r0, r4, #0
	add r0, #0xfc
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0xfc
	bl ScheduleWindowCopyToVram
	mov r0, #3
	strb r0, [r4, #8]
	b _021E64F4
_021E617E:
	sub r0, r0, #1
	strb r0, [r4, #0xf]
	b _021E64F4
_021E6184:
	mov r0, #0xee
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #4
	mov r2, #2
	bl sub_02021280
	ldr r0, _021E63F8 ; =ov87_021E8308
	bl sub_02025204
	add r5, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r5, r0
	beq _021E6290
	add r0, r4, #0
	bl ov87_021E7490
	cmp r0, #3
	bhs _021E61B6
	mov r0, #0xe5
	mov r2, #1
	add r1, r4, r5
	lsl r0, r0, #2
	strb r2, [r1, r0]
_021E61B6:
	mov r0, #0xe5
	add r1, r4, r5
	lsl r0, r0, #2
	ldrb r0, [r1, r0]
	cmp r0, #1
	bne _021E61EA
	add r0, r4, #0
	bl ov87_021E7550
	lsl r1, r5, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	bl ov87_021E75E0
	add r0, r4, #0
	add r1, r5, #0
	bl ov87_021E74F4
	ldr r0, _021E63FC ; =0x0000055F
	bl IsSEPlaying
	cmp r0, #0
	bne _021E61EA
	ldr r0, _021E63FC ; =0x0000055F
	bl PlaySE
_021E61EA:
	add r0, r4, #0
	bl ov87_021E7734
	cmp r0, #1
	bne _021E6262
	ldr r0, _021E63FC ; =0x0000055F
	mov r1, #0
	bl StopSE
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #1
	bl ov87_021E7FD4
	ldr r1, _021E6400 ; =0x0000039F
	ldrb r0, [r4, r1]
	lsl r0, r0, #1
	add r2, r4, r0
	add r0, r1, #0
	sub r0, #0x35
	ldrh r3, [r2, r0]
	add r0, r1, #0
	sub r0, #0x27
	ldr r2, [r4, r0]
	ldrb r0, [r4, #0xe]
	lsl r0, r0, #1
	strh r3, [r2, r0]
	ldrb r0, [r4, r1]
	lsl r0, r0, #1
	add r2, r4, r0
	add r0, r1, #0
	sub r0, #0x35
	ldrh r0, [r2, r0]
	cmp r0, #0x5c
	bne _021E6236
	mov r2, #1
	b _021E6238
_021E6236:
	mov r2, #3
_021E6238:
	ldrb r0, [r4, #0xe]
	sub r1, #0x23
	ldr r1, [r4, r1]
	lsl r0, r0, #1
	strh r2, [r1, r0]
	add r0, r4, #0
	bl ov87_021E788C
	cmp r0, #1
	bne _021E6250
	mov r0, #0x1e
	b _021E6252
_021E6250:
	mov r0, #0
_021E6252:
	strb r0, [r4, #0xf]
	add r0, r4, #0
	bl ov87_021E70D0
	mov r0, #4
	strb r0, [r4, #8]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E6262:
	ldr r0, _021E6404 ; =0x000003A1
	ldrb r0, [r4, r0]
	cmp r0, #3
	blo _021E6298
	ldr r0, _021E63FC ; =0x0000055F
	mov r1, #0
	bl StopSE
	mov r0, #0x3c
	strb r0, [r4, #0xf]
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #1
	bl ov87_021E7FD4
	add r0, r4, #0
	bl ov87_021E7134
	mov r0, #7
	strb r0, [r4, #8]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E6290:
	ldr r0, _021E63FC ; =0x0000055F
	mov r1, #0
	bl StopSE
_021E6298:
	mov r0, #0x3a
	lsl r0, r0, #4
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _021E62AC
	add r0, r4, #0
	bl ov87_021E7698
_021E62AC:
	ldrb r0, [r4, #0xe]
	cmp r0, #2
	bne _021E62F6
	ldr r0, _021E6408 ; =ov87_021E8184
	bl sub_02025224
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _021E6378
	mov r0, #0xcf
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl ov87_021E8084
	add r0, r4, #0
	bl ov87_021E7008
	ldr r0, _021E640C ; =0x000005E4
	bl PlaySE
	mov r0, #0xcf
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov87_021E803C
	add r0, r4, #0
	bl ov87_021E6AE0
	add r0, r4, #0
	bl ov87_021E6AF4
	mov r0, #0xa
	strb r0, [r4, #8]
	b _021E64F4
_021E62F6:
	ldr r0, _021E6410 ; =ov87_021E818C
	bl sub_02025224
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _021E6378
	mov r0, #0xcf
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl ov87_021E8084
	add r0, r4, #0
	bl ov87_021E7008
	ldr r0, _021E640C ; =0x000005E4
	bl PlaySE
	mov r0, #0xcf
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl ov87_021E803C
	add r0, r4, #0
	bl ov87_021E6AE0
	add r0, r4, #0
	bl ov87_021E6AF4
	mov r0, #9
	strb r0, [r4, #8]
	b _021E64F4
_021E633A:
	ldrb r1, [r4, #0xf]
	cmp r1, #0
	bne _021E6350
	mov r1, #0
	bl ov87_021E78D8
	cmp r0, #0
	bne _021E6378
	mov r0, #5
	strb r0, [r4, #8]
	b _021E64F4
_021E6350:
	sub r0, r1, #1
	strb r0, [r4, #0xf]
	b _021E64F4
_021E6356:
	mov r1, #1
	bl ov87_021E78D8
	cmp r0, #0
	bne _021E6378
	mov r0, #0
	strb r0, [r4, #0xf]
	mov r0, #6
	strb r0, [r4, #8]
	b _021E64F4
_021E636A:
	mov r0, #0xd7
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov87_021E80B4
	cmp r0, #1
	bne _021E637A
_021E6378:
	b _021E64F4
_021E637A:
	ldrb r0, [r4, #0xf]
	cmp r0, #0
	bne _021E63B4
	mov r7, #0x35
	mov r6, #0
	add r5, r4, #0
	lsl r7, r7, #4
_021E6388:
	ldr r0, [r5, r7]
	mov r1, #0
	bl ov87_021E7FD4
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #3
	blt _021E6388
	mov r0, #0xd7
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov87_021E7FD4
	add r0, r4, #0
	bl ov87_021E7998
	add r0, r4, #0
	bl ov87_021E79A0
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E63B4:
	sub r0, r0, #1
	strb r0, [r4, #0xf]
	b _021E64F4
_021E63BA:
	ldrb r0, [r4, #0xf]
	cmp r0, #0
	bne _021E63DE
	mov r0, #1
	mov r1, #0
	bl GX_EngineAToggleLayers
	add r0, r4, #0
	bl ov87_021E7998
	add r0, r4, #0
	bl ov87_021E79A0
	mov r0, #0x1e
	strb r0, [r4, #0xf]
	mov r0, #8
	strb r0, [r4, #8]
	b _021E64F4
_021E63DE:
	sub r0, r0, #1
	strb r0, [r4, #0xf]
	b _021E64F4
_021E63E4:
	ldrb r0, [r4, #0xf]
	cmp r0, #0
	bne _021E63EE
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E63EE:
	sub r0, r0, #1
	strb r0, [r4, #0xf]
	b _021E64F4
	.balign 4, 0
_021E63F4: .word 0x00000562
_021E63F8: .word ov87_021E8308
_021E63FC: .word 0x0000055F
_021E6400: .word 0x0000039F
_021E6404: .word 0x000003A1
_021E6408: .word ov87_021E8184
_021E640C: .word 0x000005E4
_021E6410: .word ov87_021E818C
_021E6414:
	mov r0, #0x39
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02016748
	cmp r0, #1
	bne _021E6450
	mov r0, #0xcf
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov87_021E8084
	add r0, r4, #0
	add r0, #0x5c
	mov r1, #0
	bl sub_0200E5D4
	add r0, r4, #0
	add r0, #0x5c
	bl ClearWindowTilemapAndCopyToVram
	add r0, r4, #0
	bl ov87_021E7998
	add r0, r4, #0
	bl ov87_021E6B28
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E6450:
	cmp r0, #2
	bne _021E64F4
	mov r0, #0xcf
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov87_021E8084
	add r0, r4, #0
	add r0, #0x5c
	mov r1, #0
	bl sub_0200E5D4
	add r0, r4, #0
	add r0, #0x5c
	bl ClearWindowTilemapAndCopyToVram
	add r0, r4, #0
	bl ov87_021E6B28
	mov r0, #0xb
	strb r0, [r4, #8]
	b _021E64F4
_021E647E:
	mov r0, #0x39
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02016748
	cmp r0, #1
	bne _021E64BA
	mov r0, #0xcf
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov87_021E8084
	add r0, r4, #0
	add r0, #0x5c
	mov r1, #0
	bl sub_0200E5D4
	add r0, r4, #0
	add r0, #0x5c
	bl ClearWindowTilemapAndCopyToVram
	add r0, r4, #0
	bl ov87_021E7990
	add r0, r4, #0
	bl ov87_021E6B28
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E64BA:
	cmp r0, #2
	bne _021E64F4
	mov r0, #0xcf
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov87_021E8084
	add r0, r4, #0
	add r0, #0x5c
	mov r1, #0
	bl sub_0200E5D4
	add r0, r4, #0
	add r0, #0x5c
	bl ClearWindowTilemapAndCopyToVram
	add r0, r4, #0
	bl ov87_021E6B28
	mov r0, #0xb
	strb r0, [r4, #8]
	b _021E64F4
_021E64E8:
	bl System_GetTouchHeld
	cmp r0, #0
	bne _021E64F4
	mov r0, #3
	strb r0, [r4, #8]
_021E64F4:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov87_021E6080

	thumb_func_start ov87_021E64F8
ov87_021E64F8: ; 0x021E64F8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrb r0, [r5, #8]
	cmp r0, #0
	beq _021E650C
	cmp r0, #1
	beq _021E653C
	cmp r0, #2
	beq _021E65EA
	b _021E65F4
_021E650C:
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #1
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #0xcf
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl ov87_021E7FD4
	mov r0, #0
	strh r0, [r5, #0x10]
	strh r0, [r5, #0x12]
	mov r0, #0x56
	lsl r0, r0, #4
	bl PlaySE
	mov r0, #1
	strb r0, [r5, #8]
	b _021E65F4
_021E653C:
	mov r3, #0x12
	ldrsh r3, [r5, r3]
	ldr r0, [r5, #0x58]
	mov r1, #6
	mov r2, #0
	bl BgSetPosTextAndCommit
	mov r3, #0x12
	mov r1, #0
	ldrsh r3, [r5, r3]
	ldr r0, [r5, #0x58]
	add r2, r1, #0
	bl BgSetPosTextAndCommit
	mov r3, #0x12
	ldrsh r3, [r5, r3]
	ldr r0, [r5, #0x58]
	mov r1, #1
	mov r2, #0
	bl BgSetPosTextAndCommit
	mov r0, #0x12
	ldrsh r0, [r5, r0]
	sub r0, #0x10
	strh r0, [r5, #0x12]
	mov r0, #0x10
	ldrsh r1, [r5, r0]
	add r0, #0xf0
	cmp r1, r0
	blt _021E657E
	mov r0, #2
	strb r0, [r5, #8]
	b _021E65E0
_021E657E:
	mov r7, #0
	mov r6, #0x1a
	add r4, r5, #0
_021E6584:
	mov r1, #0x10
	mov r0, #0xbe
	ldrsh r1, [r5, r1]
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, #0x3c
	add r2, r6, #0
	bl ov87_021E7FEC
	add r7, r7, #1
	add r6, #0x2a
	add r4, r4, #4
	cmp r7, #4
	blt _021E6584
	mov r7, #0xd1
	mov r6, #0
	add r4, r5, #0
	lsl r7, r7, #2
_021E65A8:
	ldr r0, [r4, r7]
	mov r1, #0
	bl ov87_021E7FD4
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #3
	blt _021E65A8
	ldr r4, _021E65F8 ; =ov87_021E82E4
	mov r7, #0
	add r6, r5, #0
_021E65BE:
	mov r1, #0x10
	mov r2, #0
	ldrsh r1, [r5, r1]
	ldrsh r2, [r4, r2]
	mov r0, #0xc2
	lsl r0, r0, #2
	add r1, r1, r2
	mov r2, #2
	ldrsh r2, [r4, r2]
	ldr r0, [r6, r0]
	bl ov87_021E7FEC
	add r7, r7, #1
	add r4, r4, #4
	add r6, r6, #4
	cmp r7, #9
	blt _021E65BE
_021E65E0:
	mov r0, #0x10
	ldrsh r0, [r5, r0]
	add r0, #0x10
	strh r0, [r5, #0x10]
	b _021E65F4
_021E65EA:
	mov r0, #0
	strh r0, [r5, #0x10]
	strh r0, [r5, #0x12]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E65F4:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E65F8: .word ov87_021E82E4
	thumb_func_end ov87_021E64F8

	thumb_func_start ov87_021E65FC
ov87_021E65FC: ; 0x021E65FC
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldrb r0, [r4, #8]
	cmp r0, #0
	beq _021E6612
	cmp r0, #1
	beq _021E661E
	cmp r0, #2
	beq _021E6654
	b _021E6662
_021E6612:
	mov r0, #0xa
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _021E6662
_021E661E:
	ldrb r0, [r4, #0xd]
	sub r0, r0, #1
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #0xd]
	cmp r0, #0
	bne _021E6662
	add r0, r4, #0
	add r0, #0x5c
	mov r1, #0
	bl ClearFrameAndWindow2
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x7a
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _021E6662
_021E6654:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E6662
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, pc}
_021E6662:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov87_021E65FC

	thumb_func_start ov87_021E6668
ov87_021E6668: ; 0x021E6668
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x5b
	lsl r0, r0, #2
	ldr r4, _021E66B4 ; =ov87_021E82E4
	mov r6, #0
	add r7, r5, r0
_021E6678:
	ldrh r0, [r4, #2]
	mov r1, #3
	mov r2, #2
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	ldrh r3, [r4]
	add r0, r7, #0
	bl ov87_021E7F6C
	mov r1, #0xd1
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r0, [r5, r0]
	mov r1, #0
	bl ov87_021E7FD4
	add r6, r6, #1
	add r4, r4, #4
	add r5, r5, #4
	cmp r6, #3
	blt _021E6678
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E66B4: .word ov87_021E82E4
	thumb_func_end ov87_021E6668

	thumb_func_start ov87_021E66B8
ov87_021E66B8: ; 0x021E66B8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x5b
	lsl r0, r0, #2
	ldr r4, _021E6700 ; =ov87_021E8194
	mov r6, #0
	add r7, r5, r0
_021E66C8:
	ldrh r0, [r4, #2]
	mov r1, #1
	mov r2, #0
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldrh r3, [r4]
	add r0, r7, #0
	bl ov87_021E7F6C
	mov r1, #0x35
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r0, [r5, r0]
	mov r1, #0
	bl ov87_021E7FD4
	add r6, r6, #1
	add r4, r4, #4
	add r5, r5, #4
	cmp r6, #3
	blt _021E66C8
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6700: .word ov87_021E8194
	thumb_func_end ov87_021E66B8

	thumb_func_start ov87_021E6704
ov87_021E6704: ; 0x021E6704
	push {r4, lr}
	sub sp, #0x10
	mov r1, #0xa0
	add r4, r0, #0
	str r1, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r2, #1
	str r2, [sp, #8]
	add r1, #0xcc
	str r0, [sp, #0xc]
	add r0, r4, r1
	mov r1, #3
	mov r3, #0x44
	bl ov87_021E7F6C
	mov r1, #0xcf
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #0
	bl ov87_021E7FD4
	mov r3, #0x44
	str r3, [sp]
	mov r1, #0
	str r1, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x5b
	str r1, [sp, #0xc]
	lsl r0, r0, #2
	mov r1, #3
	add r0, r4, r0
	add r2, r1, #0
	bl ov87_021E7F6C
	mov r1, #0xd
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #0
	bl ov87_021E7FD4
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov87_021E6704

	thumb_func_start ov87_021E6760
ov87_021E6760: ; 0x021E6760
	push {r4, r5, r6, lr}
	mov r6, #0xcb
	add r5, r0, #0
	mov r4, #0
	lsl r6, r6, #2
_021E676A:
	ldr r0, [r5, r6]
	cmp r0, #0
	beq _021E6774
	bl ov87_021E7FC0
_021E6774:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _021E676A
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov87_021E6760

	thumb_func_start ov87_021E6780
ov87_021E6780: ; 0x021E6780
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r7, #0xbe
	mov r4, #0
	add r5, r6, #0
	lsl r7, r7, #2
_021E678C:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _021E6796
	bl ov87_021E7FC0
_021E6796:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _021E678C
	mov r7, #0xc2
	mov r5, #0
	add r4, r6, #0
	lsl r7, r7, #2
_021E67A6:
	ldr r0, [r4, r7]
	cmp r0, #0
	beq _021E67B0
	bl ov87_021E7FC0
_021E67B0:
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #9
	blt _021E67A6
	mov r0, #0xcf
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _021E67C6
	bl ov87_021E7FC0
_021E67C6:
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _021E67D4
	bl ov87_021E7FC0
_021E67D4:
	mov r7, #0xd1
	mov r5, #0
	add r4, r6, #0
	lsl r7, r7, #2
_021E67DC:
	ldr r0, [r4, r7]
	cmp r0, #0
	beq _021E67E6
	bl ov87_021E7FC0
_021E67E6:
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #3
	blt _021E67DC
	mov r7, #0x35
	mov r5, #0
	add r4, r6, #0
	lsl r7, r7, #4
_021E67F6:
	ldr r0, [r4, r7]
	cmp r0, #0
	beq _021E6800
	bl ov87_021E7FC0
_021E6800:
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #3
	blt _021E67F6
	mov r0, #0xd7
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _021E6816
	bl ov87_021E7FC0
_021E6816:
	mov r0, #2
	bl FontID_Release
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r1, #2
	bl PaletteData_FreeBuffers
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r1, #0
	bl PaletteData_FreeBuffers
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl sub_02003104
	mov r0, #0x57
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r6, r0]
	add r0, #0x10
	add r0, r6, r0
	bl ov87_021E7E98
	ldr r0, [r6, #0x34]
	bl sub_020164C4
	ldr r0, [r6, #0x38]
	bl DestroyMsgData
	ldr r0, [r6, #0x3c]
	bl ScrStrBufs_delete
	ldr r0, [r6, #0x40]
	bl String_dtor
	ldr r0, [r6, #0x44]
	bl String_dtor
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	bl MessagePrinter_delete
	mov r0, #0xe1
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl FreeToHeap
	mov r0, #0xe3
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl FreeToHeap
	add r0, r6, #0
	add r0, #0x5c
	bl ov87_021E80F0
	ldr r0, [r6, #0x58]
	bl ov87_021E6BB8
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r6, r0]
	bl NARC_dtor
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov87_021E6780

	thumb_func_start ov87_021E68A4
ov87_021E68A4: ; 0x021E68A4
	push {r3, lr}
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0
	add r1, r0, #0
	bl Main_SetHBlankIntrCB
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E68D4 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _021E68D8 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	pop {r3, pc}
	.balign 4, 0
_021E68D4: .word 0xFFFFE0FF
_021E68D8: .word 0x04001000
	thumb_func_end ov87_021E68A4

	thumb_func_start ov87_021E68DC
ov87_021E68DC: ; 0x021E68DC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0xcf
	mov r1, #0x7a
	bl NARC_ctor
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r5, r1]
	add r0, r5, #0
	bl ov87_021E6B38
	add r0, r5, #0
	bl ov87_021E6BA8
	mov r1, #0x1b
	mov r0, #1
	lsl r2, r1, #4
	mov r3, #0x7a
	bl NewMsgDataFromNarc
	str r0, [r5, #0x38]
	mov r0, #0x7a
	bl ScrStrBufs_new
	str r0, [r5, #0x3c]
	mov r0, #0x96
	lsl r0, r0, #2
	mov r1, #0x7a
	bl String_ctor
	str r0, [r5, #0x40]
	mov r0, #0x96
	lsl r0, r0, #2
	mov r1, #0x7a
	bl String_ctor
	mov r1, #0x1a
	str r0, [r5, #0x44]
	mov r0, #0
	lsl r1, r1, #4
	mov r2, #0x7a
	bl LoadFontPal0
	mov r1, #0x1a
	mov r0, #4
	lsl r1, r1, #4
	mov r2, #0x7a
	bl LoadFontPal0
	mov r1, #6
	mov r0, #0
	lsl r1, r1, #6
	mov r2, #0x7a
	bl LoadFontPal1
	mov r1, #6
	mov r0, #4
	lsl r1, r1, #6
	mov r2, #0x7a
	bl LoadFontPal1
	mov r0, #2
	mov r1, #0x7a
	bl FontID_Alloc
	mov r0, #0xf
	mov r1, #0xe
	mov r2, #0
	mov r3, #0x7a
	bl MessagePrinter_new
	mov r1, #0x16
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r1, r5, #0
	ldr r0, [r5, #0x58]
	add r1, #0x5c
	bl ov87_021E80C0
	mov r0, #0
	mov r1, #1
	mov r2, #0xc
	mov r3, #0x7a
	bl sub_020163E0
	str r0, [r5, #0x34]
	add r0, r5, #0
	bl ov87_021E79C4
	add r0, r5, #0
	bl ov87_021E7A04
	add r0, r5, #0
	bl ov87_021E7A2C
	bl GX_BothDispOn
	mov r7, #0
	mov r6, #0x1a
	add r4, r5, #0
_021E69A8:
	lsl r0, r6, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	mov r0, #0x5b
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	add r2, r7, #0
	mov r3, #0x3c
	bl ov87_021E7F6C
	mov r1, #0xbe
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r1, #0
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov87_021E7FD4
	add r7, r7, #1
	add r6, #0x2a
	add r4, r4, #4
	cmp r7, #4
	blt _021E69A8
	ldr r4, _021E6ACC ; =ov87_021E82E4
	mov r7, #0
	add r6, r5, #0
_021E69E8:
	ldrh r0, [r4, #2]
	mov r1, #1
	mov r2, #0
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xa
	str r0, [sp, #0xc]
	mov r0, #0x5b
	lsl r0, r0, #2
	ldrh r3, [r4]
	add r0, r5, r0
	bl ov87_021E7F6C
	mov r1, #0xc2
	lsl r1, r1, #2
	str r0, [r6, r1]
	add r0, r1, #0
	ldr r0, [r6, r0]
	mov r1, #0
	bl ov87_021E7FD4
	add r7, r7, #1
	add r4, r4, #4
	add r6, r6, #4
	cmp r7, #9
	blt _021E69E8
	add r0, r5, #0
	bl ov87_021E6704
	ldr r4, _021E6AD0 ; =ov87_021E81A0
	mov r7, #0
	add r6, r5, #0
_021E6A2E:
	ldrh r0, [r4, #2]
	mov r1, #2
	add r2, r7, #0
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #0x5b
	lsl r0, r0, #2
	ldrh r3, [r4]
	add r0, r5, r0
	bl ov87_021E7F6C
	mov r1, #0xcb
	lsl r1, r1, #2
	str r0, [r6, r1]
	add r0, r1, #0
	mov r1, #0
	ldrsh r2, [r4, r1]
	mov r1, #1
	lsl r1, r1, #8
	sub r1, r2, r1
	mov r2, #2
	ldrsh r2, [r4, r2]
	ldr r0, [r6, r0]
	bl ov87_021E7FEC
	mov r0, #0xcb
	lsl r0, r0, #2
	add r1, r7, #0
	ldr r0, [r6, r0]
	add r1, #0x14
	bl ov87_021E7FE0
	add r7, r7, #1
	add r4, r4, #4
	add r6, r6, #4
	cmp r7, #4
	blt _021E6A2E
	mov r0, #0x38
	str r0, [sp]
	mov r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	mov r0, #0xa
	str r0, [sp, #0xc]
	mov r0, #0x5b
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #4
	mov r3, #0x26
	bl ov87_021E7F6C
	mov r1, #0xd7
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	mov r1, #0
	bl ov87_021E7FD4
	ldr r2, _021E6AD4 ; =0x04000304
	ldr r0, _021E6AD8 ; =0xFFFF7FFF
	ldrh r1, [r2]
	and r0, r1
	strh r0, [r2]
	bl sub_020210BC
	mov r0, #1
	bl sub_02021148
	ldr r0, _021E6ADC ; =ov87_021E6C04
	add r1, r5, #0
	bl Main_SetVBlankIntrCB
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E6ACC: .word ov87_021E82E4
_021E6AD0: .word ov87_021E81A0
_021E6AD4: .word 0x04000304
_021E6AD8: .word 0xFFFF7FFF
_021E6ADC: .word ov87_021E6C04
	thumb_func_end ov87_021E68DC

	thumb_func_start ov87_021E6AE0
ov87_021E6AE0: ; 0x021E6AE0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x7a
	bl sub_0201660C
	mov r1, #0x39
	lsl r1, r1, #4
	str r0, [r4, r1]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov87_021E6AE0

	thumb_func_start ov87_021E6AF4
ov87_021E6AF4: ; 0x021E6AF4
	push {lr}
	sub sp, #0x14
	ldr r1, [r0, #0x58]
	mov r3, #0xe
	str r1, [sp]
	mov r1, #2
	str r1, [sp, #4]
	lsl r3, r3, #6
	mov r1, #9
	str r3, [sp, #8]
	str r1, [sp, #0xc]
	mov r2, #0x18
	add r1, sp, #0
	strb r2, [r1, #0x10]
	mov r2, #8
	strb r2, [r1, #0x11]
	mov r2, #0
	strb r2, [r1, #0x13]
	add r3, #0x10
	ldr r0, [r0, r3]
	add r1, sp, #0
	bl sub_020166FC
	add sp, #0x14
	pop {pc}
	.balign 4, 0
	thumb_func_end ov87_021E6AF4

	thumb_func_start ov87_021E6B28
ov87_021E6B28: ; 0x021E6B28
	mov r1, #0x39
	lsl r1, r1, #4
	ldr r3, _021E6B34 ; =sub_02016624
	ldr r0, [r0, r1]
	bx r3
	nop
_021E6B34: .word sub_02016624
	thumb_func_end ov87_021E6B28

	thumb_func_start ov87_021E6B38
ov87_021E6B38: ; 0x021E6B38
	push {r4, lr}
	add r4, r0, #0
	bl ov87_021E6C40
	ldr r0, [r4, #0x58]
	bl ov87_021E6C60
	mov r0, #0x7a
	bl sub_020030E8
	mov r1, #0x57
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #2
	lsl r2, r1, #8
	mov r3, #0x7a
	bl PaletteData_AllocBuffers
	mov r2, #0x57
	lsl r2, r2, #2
	ldr r0, [r4, r2]
	mov r1, #0
	add r2, #0xa4
	mov r3, #0x7a
	bl PaletteData_AllocBuffers
	add r0, r4, #0
	mov r1, #7
	bl ov87_021E6DBC
	bl ov87_021E6E44
	add r0, r4, #0
	mov r1, #6
	bl ov87_021E6E00
	add r0, r4, #0
	mov r1, #1
	bl ov87_021E6EB0
	bl ov87_021E6E78
	add r0, r4, #0
	mov r1, #0
	bl ov87_021E6EF4
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #1
	mov r1, #0
	bl GX_EngineBToggleLayers
	pop {r4, pc}
	thumb_func_end ov87_021E6B38

	thumb_func_start ov87_021E6BA8
ov87_021E6BA8: ; 0x021E6BA8
	mov r1, #0x5b
	lsl r1, r1, #2
	ldr r3, _021E6BB4 ; =ov87_021E7AF8
	add r0, r0, r1
	bx r3
	nop
_021E6BB4: .word ov87_021E7AF8
	thumb_func_end ov87_021E6BA8

	thumb_func_start ov87_021E6BB8
ov87_021E6BB8: ; 0x021E6BB8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x1f
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #0x1f
	mov r1, #0
	bl GX_EngineBToggleLayers
	add r0, r4, #0
	mov r1, #7
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #6
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #4
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #1
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #0
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #2
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov87_021E6BB8

	thumb_func_start ov87_021E6C04
ov87_021E6C04: ; 0x021E6C04
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _021E6C36
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E6C1C
	bl sub_0200398C
_021E6C1C:
	ldr r0, [r4, #0x58]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	bl GF_RunVramTransferTasks
	bl OamManager_ApplyAndResetBuffers
	ldr r3, _021E6C38 ; =0x027E0000
	ldr r1, _021E6C3C ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
_021E6C36:
	pop {r4, pc}
	.balign 4, 0
_021E6C38: .word 0x027E0000
_021E6C3C: .word 0x00003FF8
	thumb_func_end ov87_021E6C04

	thumb_func_start ov87_021E6C40
ov87_021E6C40: ; 0x021E6C40
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E6C5C ; =ov87_021E8330
	add r3, sp, #0
	mov r2, #5
_021E6C4A:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E6C4A
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_021E6C5C: .word ov87_021E8330
	thumb_func_end ov87_021E6C40

	thumb_func_start ov87_021E6C60
ov87_021E6C60: ; 0x021E6C60
	push {r3, r4, r5, lr}
	sub sp, #0xb8
	ldr r5, _021E6DA0 ; =ov87_021E81B0
	add r3, sp, #0xa8
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _021E6DA4 ; =ov87_021E8228
	add r3, sp, #0x8c
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #4
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x7a
	bl BG_ClearCharDataRange
	add r0, r4, #0
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E6DA8 ; =ov87_021E8260
	add r3, sp, #0x70
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #7
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E6DAC ; =ov87_021E81D4
	add r3, sp, #0x54
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #6
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E6DB0 ; =ov87_021E81F0
	add r3, sp, #0x38
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #1
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E6DB4 ; =ov87_021E820C
	add r3, sp, #0x1c
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #0
	str r0, [r3]
	add r0, r4, #0
	add r3, r1, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E6DB8 ; =ov87_021E8244
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #2
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #2
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x7a
	bl BG_ClearCharDataRange
	add r0, r4, #0
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	mov r0, #1
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #2
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	add sp, #0xb8
	pop {r3, r4, r5, pc}
	nop
_021E6DA0: .word ov87_021E81B0
_021E6DA4: .word ov87_021E8228
_021E6DA8: .word ov87_021E8260
_021E6DAC: .word ov87_021E81D4
_021E6DB0: .word ov87_021E81F0
_021E6DB4: .word ov87_021E820C
_021E6DB8: .word ov87_021E8244
	thumb_func_end ov87_021E6C60

	thumb_func_start ov87_021E6DBC
ov87_021E6DBC: ; 0x021E6DBC
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x7a
	str r0, [sp, #0xc]
	add r4, r1, #0
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x58]
	mov r1, #0x23
	add r3, r4, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x7a
	str r0, [sp, #0xc]
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x58]
	mov r1, #0x25
	add r3, r4, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov87_021E6DBC

	thumb_func_start ov87_021E6E00
ov87_021E6E00: ; 0x021E6E00
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x7a
	str r0, [sp, #0xc]
	add r4, r1, #0
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x58]
	mov r1, #0x26
	add r3, r4, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x7a
	str r0, [sp, #0xc]
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x58]
	mov r1, #0x28
	add r3, r4, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov87_021E6E00

	thumb_func_start ov87_021E6E44
ov87_021E6E44: ; 0x021E6E44
	push {r3, r4, lr}
	sub sp, #4
	mov r0, #0xcf
	mov r1, #0x22
	add r2, sp, #0
	mov r3, #0x7a
	bl GfGfxLoader_GetPlttData
	add r4, r0, #0
	ldr r0, [sp]
	mov r1, #0xa0
	ldr r0, [r0, #0xc]
	bl DC_FlushRange
	ldr r0, [sp]
	mov r1, #0
	ldr r0, [r0, #0xc]
	mov r2, #0xa0
	bl GXS_LoadBGPltt
	add r0, r4, #0
	bl FreeToHeap
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov87_021E6E44

	thumb_func_start ov87_021E6E78
ov87_021E6E78: ; 0x021E6E78
	push {r3, r4, lr}
	sub sp, #4
	mov r0, #0xcf
	mov r1, #0
	add r2, sp, #0
	mov r3, #0x7a
	bl GfGfxLoader_GetPlttData
	add r4, r0, #0
	ldr r0, [sp]
	mov r1, #6
	ldr r0, [r0, #0xc]
	lsl r1, r1, #6
	bl DC_FlushRange
	ldr r0, [sp]
	mov r2, #6
	ldr r0, [r0, #0xc]
	mov r1, #0
	lsl r2, r2, #6
	bl GX_LoadBGPltt
	add r0, r4, #0
	bl FreeToHeap
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov87_021E6E78

	thumb_func_start ov87_021E6EB0
ov87_021E6EB0: ; 0x021E6EB0
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x7a
	str r0, [sp, #0xc]
	add r4, r1, #0
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x58]
	mov r1, #4
	add r3, r4, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x7a
	str r0, [sp, #0xc]
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x58]
	mov r1, #6
	add r3, r4, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov87_021E6EB0

	thumb_func_start ov87_021E6EF4
ov87_021E6EF4: ; 0x021E6EF4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x7a
	str r0, [sp, #0xc]
	add r4, r1, #0
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x58]
	mov r1, #7
	add r3, r4, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x7a
	str r0, [sp, #0xc]
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x58]
	mov r1, #9
	add r3, r4, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov87_021E6EF4

	thumb_func_start ov87_021E6F38
ov87_021E6F38: ; 0x021E6F38
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r1, #0
	add r1, sp, #0x38
	ldrb r1, [r1]
	add r5, r0, #0
	add r0, r4, #0
	add r6, r2, #0
	add r7, r3, #0
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x38]
	ldr r2, [r5, #0x44]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	ldr r0, [r5, #0x3c]
	ldr r1, [r5, #0x40]
	ldr r2, [r5, #0x44]
	bl StringExpandPlaceholders
	ldr r0, [sp, #0x28]
	add r2, sp, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	add r3, r7, #0
	str r0, [sp, #4]
	add r0, sp, #0x38
	ldrb r1, [r0]
	ldrb r0, [r2, #0x18]
	ldrb r2, [r2, #0x1c]
	lsl r0, r0, #0x18
	lsl r2, r2, #0x18
	lsr r0, r0, #8
	lsr r2, r2, #0x10
	orr r0, r2
	orr r0, r1
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r1, sp, #0x3c
	ldrb r1, [r1]
	ldr r2, [r5, #0x40]
	add r0, r4, #0
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov87_021E6F38

	thumb_func_start ov87_021E6F98
ov87_021E6F98: ; 0x021E6F98
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r1, #0
	add r1, sp, #0x38
	ldrb r1, [r1]
	add r5, r0, #0
	add r0, r4, #0
	add r7, r2, #0
	add r6, r3, #0
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x38]
	ldr r2, [r5, #0x44]
	add r1, r7, #0
	bl ReadMsgDataIntoString
	ldr r0, [r5, #0x3c]
	ldr r1, [r5, #0x40]
	ldr r2, [r5, #0x44]
	bl StringExpandPlaceholders
	add r0, sp, #0x3c
	ldrb r0, [r0]
	ldr r1, [r5, #0x40]
	mov r2, #0
	bl FontID_String_GetWidth
	add r0, r0, #1
	lsr r0, r0, #1
	sub r3, r6, r0
	ldr r0, [sp, #0x28]
	add r2, sp, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #4]
	add r0, sp, #0x38
	ldrb r1, [r0]
	ldrb r0, [r2, #0x18]
	ldrb r2, [r2, #0x1c]
	lsl r0, r0, #0x18
	lsl r2, r2, #0x18
	lsr r0, r0, #8
	lsr r2, r2, #0x10
	orr r0, r2
	orr r0, r1
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r1, sp, #0x3c
	ldrb r1, [r1]
	ldr r2, [r5, #0x40]
	add r0, r4, #0
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov87_021E6F98

	thumb_func_start ov87_021E7008
ov87_021E7008: ; 0x021E7008
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r4, r0, #0
	add r1, r4, #0
	ldr r0, [r4, #0x58]
	add r1, #0x5c
	bl ov87_021E810C
	mov r3, #1
	str r3, [sp]
	mov r1, #0
	str r1, [sp, #4]
	str r3, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0xf
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	add r1, r4, #0
	add r0, r4, #0
	add r1, #0x5c
	mov r2, #6
	bl ov87_021E6F38
	add r4, #0x5c
	add r5, r0, #0
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	thumb_func_end ov87_021E7008

	thumb_func_start ov87_021E7048
ov87_021E7048: ; 0x021E7048
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldrb r2, [r5, #0xe]
	mov r1, #0
	add r2, r2, #1
	bl ov87_021E7244
	mov r3, #1
	mov r1, #0x53
	lsl r1, r1, #2
	str r3, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r3, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0xf
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r1, r5, r1
	mov r2, #0xc
	str r3, [sp, #0x14]
	bl ov87_021E6F38
	add r4, r0, #0
	mov r0, #0x53
	lsl r0, r0, #2
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	thumb_func_end ov87_021E7048

	thumb_func_start ov87_021E708C
ov87_021E708C: ; 0x021E708C
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r4, r0, #0
	ldrb r2, [r4, #0xe]
	mov r1, #0
	add r2, r2, #1
	bl ov87_021E7244
	mov r0, #5
	str r0, [sp]
	mov r1, #0
	str r1, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	str r1, [sp, #0x14]
	add r1, r4, #0
	add r0, r4, #0
	add r1, #0xfc
	mov r2, #9
	mov r3, #0x30
	bl ov87_021E6F98
	add r4, #0xfc
	add r5, r0, #0
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov87_021E708C

	thumb_func_start ov87_021E70D0
ov87_021E70D0: ; 0x021E70D0
	push {r3, r4, r5, r6, r7, lr}
	mov r7, #0x35
	add r5, r0, #0
	mov r4, #0
	lsl r7, r7, #4
_021E70DA:
	ldr r1, _021E712C ; =0x000003A2
	add r2, r5, r4
	ldrb r1, [r2, r1]
	lsl r0, r4, #2
	add r6, r5, r0
	add r2, r5, r1
	mov r1, #0x36
	mov r0, #0x35
	lsl r1, r1, #4
	lsl r0, r0, #4
	ldrb r1, [r2, r1]
	ldr r0, [r6, r0]
	bl ov87_021E803C
	ldr r0, [r6, r7]
	mov r1, #1
	bl ov87_021E7FD4
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #3
	blo _021E70DA
	mov r0, #0xd7
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl ov87_021E7FD4
	mov r0, #0xd7
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl ov87_021E8084
	ldr r0, _021E7130 ; =0x00000561
	bl PlaySE
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E712C: .word 0x000003A2
_021E7130: .word 0x00000561
	thumb_func_end ov87_021E70D0

	thumb_func_start ov87_021E7134
ov87_021E7134: ; 0x021E7134
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldr r0, _021E7178 ; =0x000005F3
	bl PlaySE
	mov r0, #5
	str r0, [sp]
	mov r1, #0
	str r1, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	str r1, [sp, #0x14]
	mov r1, #0x47
	lsl r1, r1, #2
	add r0, r5, #0
	add r1, r5, r1
	mov r2, #0xb
	mov r3, #0x30
	bl ov87_021E6F98
	add r4, r0, #0
	mov r0, #0x47
	lsl r0, r0, #2
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	nop
_021E7178: .word 0x000005F3
	thumb_func_end ov87_021E7134

	thumb_func_start ov87_021E717C
ov87_021E717C: ; 0x021E717C
	push {r3, r4, r5, lr}
	sub sp, #0x18
	mov r2, #1
	str r2, [sp]
	mov r1, #0
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r1, #2
	str r1, [sp, #0x14]
	mov r1, #0x4b
	add r5, r0, #0
	lsl r1, r1, #2
	add r1, r5, r1
	mov r2, #4
	mov r3, #0x30
	bl ov87_021E6F98
	add r4, r0, #0
	mov r0, #0x4b
	lsl r0, r0, #2
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	thumb_func_end ov87_021E717C

	thumb_func_start ov87_021E71B4
ov87_021E71B4: ; 0x021E71B4
	push {r3, r4, r5, lr}
	sub sp, #0x18
	mov r2, #1
	str r2, [sp]
	mov r1, #0
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r1, #2
	str r1, [sp, #0x14]
	mov r1, #0x4f
	add r5, r0, #0
	lsl r1, r1, #2
	add r1, r5, r1
	mov r2, #5
	mov r3, #0x18
	bl ov87_021E6F98
	add r4, r0, #0
	mov r0, #0x4f
	lsl r0, r0, #2
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	thumb_func_end ov87_021E71B4

	thumb_func_start ov87_021E71EC
ov87_021E71EC: ; 0x021E71EC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r7, r1, #0
	add r6, r0, #0
	lsl r2, r7, #1
	add r3, r6, r2
	ldr r2, _021E723C ; =0x0000036A
	ldr r0, [r6, #0x3c]
	ldrh r2, [r3, r2]
	mov r1, #0
	bl BufferItemName
	add r0, r7, #2
	lsl r4, r0, #4
	ldr r0, _021E7240 ; =ov87_021E8388
	add r5, r6, #0
	ldrb r0, [r0, r7]
	mov r1, #0
	mov r2, #1
	str r0, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	add r5, #0x5c
	str r1, [sp, #0x14]
	add r0, r6, #0
	add r1, r5, r4
	mov r3, #0x2c
	bl ov87_021E6F98
	add r6, r0, #0
	add r0, r5, r4
	bl ScheduleWindowCopyToVram
	add r0, r6, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E723C: .word 0x0000036A
_021E7240: .word ov87_021E8388
	thumb_func_end ov87_021E71EC

	thumb_func_start ov87_021E7244
ov87_021E7244: ; 0x021E7244
	push {r3, lr}
	sub sp, #8
	mov r3, #0
	str r3, [sp]
	mov r3, #1
	str r3, [sp, #4]
	ldr r0, [r0, #0x3c]
	bl BufferIntegerAsString
	add sp, #8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov87_021E7244

	thumb_func_start ov87_021E725C
ov87_021E725C: ; 0x021E725C
	mov r3, #0
	strb r3, [r0, #8]
	str r2, [r1]
	bx lr
	thumb_func_end ov87_021E725C

	thumb_func_start ov87_021E7264
ov87_021E7264: ; 0x021E7264
	push {r3, r4, r5, r6, r7, lr}
	mov r7, #0x36
	add r5, r0, #0
	mov r4, #0
	mov r6, #4
	lsl r7, r7, #4
_021E7270:
	bl LCRandom
	mov r1, #9
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	add r1, r5, r0
	ldrb r0, [r1, r7]
	cmp r0, #0xb0
	bne _021E7270
	mov r0, #0x36
	lsl r0, r0, #4
	add r4, r4, #1
	strb r6, [r1, r0]
	cmp r4, #2
	blt _021E7270
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov87_021E7264

	thumb_func_start ov87_021E7294
ov87_021E7294: ; 0x021E7294
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl LCRandom
	mov r7, #0
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1e
	sub r1, r1, r2
	mov r0, #0x1e
	ror r1, r0
	add r0, r2, r1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	add r4, r7, #0
_021E72B0:
	bl LCRandom
	mov r1, #9
	bl _s32_div_f
	mov r0, #0x36
	add r2, r5, r1
	lsl r0, r0, #4
	ldrb r1, [r2, r0]
	cmp r1, #0xb0
	bne _021E72E4
	mov r7, #0
	strb r6, [r2, r0]
	cmp r4, #2
	beq _021E72D6
	cmp r4, #4
	beq _021E72D6
	cmp r4, #6
	bne _021E731C
_021E72D6:
	add r0, r6, #1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	cmp r6, #4
	bne _021E731C
	mov r6, #0
	b _021E731C
_021E72E4:
	add r7, r7, #1
	cmp r7, #0x1e
	blt _021E72B0
	mov r7, #0
	add r3, r7, #0
_021E72EE:
	add r2, r5, r3
	ldrb r1, [r2, r0]
	cmp r1, #0xb0
	bne _021E7316
	mov r0, #0x36
	lsl r0, r0, #4
	strb r6, [r2, r0]
	cmp r4, #2
	beq _021E7308
	cmp r4, #4
	beq _021E7308
	cmp r4, #6
	bne _021E731C
_021E7308:
	add r0, r6, #1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	cmp r6, #4
	bne _021E731C
	mov r6, #0
	b _021E731C
_021E7316:
	add r3, r3, #1
	cmp r3, #9
	blt _021E72EE
_021E731C:
	add r4, r4, #1
	cmp r4, #9
	blt _021E72B0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov87_021E7294

	thumb_func_start ov87_021E7324
ov87_021E7324: ; 0x021E7324
	push {r4, lr}
	add r4, r0, #0
	bl ov87_021E7264
	add r0, r4, #0
	bl ov87_021E7294
	pop {r4, pc}
	thumb_func_end ov87_021E7324

	thumb_func_start ov87_021E7334
ov87_021E7334: ; 0x021E7334
	push {r3, r4}
	mov r1, #0x36
	mov r4, #0
	mov r3, #0xb0
	lsl r1, r1, #4
_021E733E:
	add r2, r0, r4
	add r4, r4, #1
	strb r3, [r2, r1]
	cmp r4, #9
	blt _021E733E
	pop {r3, r4}
	bx lr
	thumb_func_end ov87_021E7334

	thumb_func_start ov87_021E734C
ov87_021E734C: ; 0x021E734C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	mov r1, #0
	add r2, sp, #8
	mov r0, #0xff
_021E7358:
	add r1, r1, #1
	strh r0, [r2]
	add r2, r2, #2
	cmp r1, #4
	blt _021E7358
	bl LCRandom
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1e
	add r4, sp, #8
	sub r1, r1, r2
	mov r0, #0x1e
	ror r1, r0
	add r0, r2, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #4]
	mov r5, #0
	add r6, r4, #0
	mov r7, #0x17
_021E7380:
	ldr r0, [sp, #4]
	cmp r5, r0
	bne _021E7390
	ldr r1, [sp]
	ldr r0, _021E73D8 ; =0x0000036A
	mov r2, #0x5c
	strh r2, [r1, r0]
	b _021E73C6
_021E7390:
	bl LCRandom
	add r1, r7, #0
	bl _u32_div_f
	strh r1, [r4]
	mov r1, #0
	cmp r5, #0
	ble _021E73B4
	ldrh r3, [r4]
	add r2, r6, #0
_021E73A6:
	ldrh r0, [r2]
	cmp r0, r3
	beq _021E73B4
	add r1, r1, #1
	add r2, r2, #2
	cmp r1, r5
	blt _021E73A6
_021E73B4:
	cmp r1, r5
	bne _021E7390
	ldrh r0, [r4]
	lsl r1, r0, #1
	ldr r0, _021E73DC ; =ov87_021E8358
	ldrh r2, [r0, r1]
	ldr r1, [sp]
	ldr r0, _021E73D8 ; =0x0000036A
	strh r2, [r1, r0]
_021E73C6:
	ldr r0, [sp]
	add r5, r5, #1
	add r0, r0, #2
	add r4, r4, #2
	str r0, [sp]
	cmp r5, #4
	blt _021E7380
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E73D8: .word 0x0000036A
_021E73DC: .word ov87_021E8358
	thumb_func_end ov87_021E734C

	thumb_func_start ov87_021E73E0
ov87_021E73E0: ; 0x021E73E0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x3a
	lsl r0, r0, #4
	add r4, r1, #0
	ldrb r1, [r5, r0]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x19
	cmp r1, #8
	blo _021E73FC
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E73FC:
	sub r0, #0x74
	add r0, r5, r0
	str r0, [sp]
	ldr r1, [sp]
	lsl r0, r4, #2
	str r0, [sp, #4]
	ldr r0, [r1, r0]
	add r1, sp, #0xc
	add r2, sp, #8
	bl ov87_021E8014
	mov r0, #0x3a
	lsl r0, r0, #4
	ldrb r0, [r5, r0]
	lsl r2, r4, #3
	ldr r4, _021E7458 ; =ov87_021E838C
	lsl r1, r0, #0x18
	lsr r6, r1, #0x19
	ldrsb r7, [r4, r6]
	mov r4, #0xfe
	bic r0, r4
	add r4, r6, #1
	lsl r4, r4, #0x18
	lsr r4, r4, #0x18
	ldr r1, _021E745C ; =ov87_021E827C
	lsl r4, r4, #0x19
	add r1, r1, r2
	lsr r4, r4, #0x18
	ldr r2, [sp, #8]
	orr r4, r0
	mov r0, #0x3a
	ldr r3, [sp, #0xc]
	lsl r0, r0, #4
	strb r4, [r5, r0]
	ldrsb r1, [r6, r1]
	ldr r4, [sp]
	ldr r0, [sp, #4]
	add r1, r3, r1
	ldr r0, [r4, r0]
	add r2, r2, r7
	bl ov87_021E7FEC
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7458: .word ov87_021E838C
_021E745C: .word ov87_021E827C
	thumb_func_end ov87_021E73E0

	thumb_func_start ov87_021E7460
ov87_021E7460: ; 0x021E7460
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	str r3, [sp]
	add r0, sp, #8
	ldrb r0, [r0, #0x10]
	add r4, r1, #0
	lsl r1, r4, #0x18
	str r0, [sp, #4]
	str r2, [sp, #8]
	mov r2, #0
	ldr r0, [r5, #0x58]
	lsr r1, r1, #0x18
	add r3, r2, #0
	bl BgTilemapRectChangePalette
	lsl r1, r4, #0x18
	ldr r0, [r5, #0x58]
	lsr r1, r1, #0x18
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov87_021E7460

	thumb_func_start ov87_021E7490
ov87_021E7490: ; 0x021E7490
	push {r3, r4}
	mov r4, #0
	mov r2, #0xe5
	add r3, r4, #0
	lsl r2, r2, #2
_021E749A:
	add r1, r0, r3
	ldrb r1, [r1, r2]
	cmp r1, #1
	bne _021E74A8
	add r1, r4, #1
	lsl r1, r1, #0x18
	lsr r4, r1, #0x18
_021E74A8:
	add r1, r3, #1
	lsl r1, r1, #0x18
	lsr r3, r1, #0x18
	cmp r3, #9
	blo _021E749A
	add r0, r4, #0
	pop {r3, r4}
	bx lr
	thumb_func_end ov87_021E7490

	thumb_func_start ov87_021E74B8
ov87_021E74B8: ; 0x021E74B8
	push {r3, r4}
	mov r4, #0
	mov r1, #0xe5
	add r3, r4, #0
	lsl r1, r1, #2
_021E74C2:
	add r2, r0, r4
	strb r3, [r2, r1]
	add r2, r4, #1
	lsl r2, r2, #0x18
	lsr r4, r2, #0x18
	cmp r4, #9
	blo _021E74C2
	pop {r3, r4}
	bx lr
	thumb_func_end ov87_021E74B8

	thumb_func_start ov87_021E74D4
ov87_021E74D4: ; 0x021E74D4
	push {r3, r4}
	mov r4, #0
	ldr r1, _021E74F0 ; =0x000003A5
	add r3, r4, #0
_021E74DC:
	add r2, r0, r4
	strb r3, [r2, r1]
	add r2, r4, #1
	lsl r2, r2, #0x18
	lsr r4, r2, #0x18
	cmp r4, #9
	blo _021E74DC
	pop {r3, r4}
	bx lr
	nop
_021E74F0: .word 0x000003A5
	thumb_func_end ov87_021E74D4

	thumb_func_start ov87_021E74F4
ov87_021E74F4: ; 0x021E74F4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r0, #0xee
	lsl r0, r0, #2
	ldrh r0, [r7, r0]
	mov r6, #0
	cmp r0, #0
	ble _021E7544
	ldr r2, _021E7548 ; =ov87_021E829C
	lsl r0, r1, #2
	add r5, r2, r0
	ldrb r0, [r5, #2]
	add r4, r7, #0
	str r0, [sp]
_021E7510:
	ldr r0, _021E754C ; =0x000003BA
	ldrh r1, [r4, r0]
	add r0, r0, #2
	ldrh r2, [r4, r0]
	ldr r0, [sp]
	cmp r0, r1
	bgt _021E7536
	ldrb r0, [r5, #3]
	cmp r1, r0
	bgt _021E7536
	ldrb r0, [r5]
	cmp r0, r2
	bgt _021E7536
	ldrb r0, [r5, #1]
	cmp r2, r0
	bgt _021E7536
	add r0, r7, #0
	bl ov87_021E7A44
_021E7536:
	mov r0, #0xee
	lsl r0, r0, #2
	ldrh r0, [r7, r0]
	add r6, r6, #1
	add r4, #8
	cmp r6, r0
	blt _021E7510
_021E7544:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7548: .word ov87_021E829C
_021E754C: .word 0x000003BA
	thumb_func_end ov87_021E74F4

	thumb_func_start ov87_021E7550
ov87_021E7550: ; 0x021E7550
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0xee
	lsl r0, r0, #2
	ldrh r0, [r5, r0]
	mov r6, #0
	cmp r0, #0
	ble _021E7588
	mov r7, #0xee
	add r4, r5, #0
	lsl r7, r7, #2
_021E7566:
	ldr r1, _021E758C ; =0x000003BA
	mov r2, #0xef
	lsl r2, r2, #2
	ldrh r1, [r4, r1]
	ldrh r2, [r4, r2]
	add r0, r5, #0
	lsl r1, r1, #0x18
	lsl r2, r2, #0x18
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	bl ov87_021E7590
	ldrh r0, [r5, r7]
	add r6, r6, #1
	add r4, #8
	cmp r6, r0
	blt _021E7566
_021E7588:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E758C: .word 0x000003BA
	thumb_func_end ov87_021E7550

	thumb_func_start ov87_021E7590
ov87_021E7590: ; 0x021E7590
	push {r3, r4, r5, r6, r7, lr}
	add r3, r1, #0
	mov r7, #2
	mvn r7, r7
	add r0, r0, r3
	ldr r6, _021E75DC ; =0x000003FA
	str r2, [sp]
	mov lr, r0
	mov r5, #1
	mov ip, r7
_021E75A4:
	ldr r1, [sp]
	mov r2, #0xf0
	add r1, r1, r7
	add r4, r1, #0
	mul r4, r2
	mov r2, lr
	add r2, r2, r4
	mov r0, ip
	sub r4, r2, #3
_021E75B6:
	add r2, r3, r0
	cmp r2, #0
	ble _021E75CA
	cmp r2, #0xf0
	bge _021E75CA
	cmp r1, #0
	ble _021E75CA
	cmp r1, #0xa0
	bge _021E75CA
	strb r5, [r4, r6]
_021E75CA:
	add r0, r0, #1
	add r4, r4, #1
	cmp r0, #3
	blt _021E75B6
	add r7, r7, #1
	cmp r7, #3
	blt _021E75A4
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E75DC: .word 0x000003FA
	thumb_func_end ov87_021E7590

	thumb_func_start ov87_021E75E0
ov87_021E75E0: ; 0x021E75E0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r1, [sp, #4]
	str r0, [sp]
	ldr r0, [sp, #4]
	mov r4, #0
	lsl r1, r0, #2
	ldr r0, _021E7680 ; =ov87_021E82C0
	ldrsh r7, [r0, r1]
	ldr r0, _021E7684 ; =ov87_021E82C2
	ldrsh r0, [r0, r1]
	str r0, [sp, #8]
	add r0, #0x14
	ldr r1, [sp, #8]
	mov ip, r0
	cmp r1, r0
	bge _021E763A
	ldr r0, [sp, #8]
	add r2, r7, #0
	add r6, r0, #0
	mov r1, #0xf0
	ldr r0, _021E7688 ; =0x000003FA
	mul r6, r1
	add r2, #0x19
_021E7610:
	add r3, r7, #0
	cmp r7, r2
	bge _021E762C
	ldr r1, [sp]
	add r1, r1, r6
	add r5, r1, r7
_021E761C:
	ldrb r1, [r5, r0]
	cmp r1, #1
	bne _021E7624
	add r4, r4, #1
_021E7624:
	add r3, r3, #1
	add r5, r5, #1
	cmp r3, r2
	blt _021E761C
_021E762C:
	ldr r1, [sp, #8]
	add r6, #0xf0
	add r3, r1, #1
	mov r1, ip
	str r3, [sp, #8]
	cmp r3, r1
	blt _021E7610
_021E763A:
	mov r0, #0x5f
	lsl r0, r0, #2
	cmp r4, r0
	blt _021E7678
	ldr r1, _021E768C ; =0x000003A5
	ldr r0, [sp]
	add r4, r0, r1
	ldr r0, [sp, #4]
	ldrb r0, [r4, r0]
	cmp r0, #0
	bne _021E766E
	ldr r0, _021E7690 ; =0x000005E2
	bl PlaySE
	ldr r0, _021E7694 ; =0x000003A1
	ldr r1, [sp]
	ldrb r2, [r1, r0]
	add r3, r1, r2
	ldr r1, [sp, #4]
	add r2, r0, #1
	strb r1, [r3, r2]
	ldr r1, [sp]
	ldrb r1, [r1, r0]
	add r2, r1, #1
	ldr r1, [sp]
	strb r2, [r1, r0]
_021E766E:
	ldr r1, [sp, #4]
	mov r0, #1
	add sp, #0xc
	strb r0, [r4, r1]
	pop {r4, r5, r6, r7, pc}
_021E7678:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_021E7680: .word ov87_021E82C0
_021E7684: .word ov87_021E82C2
_021E7688: .word 0x000003FA
_021E768C: .word 0x000003A5
_021E7690: .word 0x000005E2
_021E7694: .word 0x000003A1
	thumb_func_end ov87_021E75E0

	thumb_func_start ov87_021E7698
ov87_021E7698: ; 0x021E7698
	push {r3, r4, r5, r6, r7, lr}
	ldr r2, _021E7720 ; =0x0000039E
	add r6, r0, #0
	ldrb r0, [r6, r2]
	add r0, r0, #1
	strb r0, [r6, r2]
	ldrb r0, [r6, r2]
	cmp r0, #1
	blo _021E771C
	mov r0, #0
	strb r0, [r6, r2]
	sub r1, r2, #1
	ldrb r1, [r6, r1]
	add r3, r1, #1
	sub r1, r2, #1
	strb r3, [r6, r1]
	ldrb r1, [r6, r1]
	cmp r1, #8
	blo _021E76C2
	sub r1, r2, #1
	strb r0, [r6, r1]
_021E76C2:
	ldr r0, _021E7724 ; =0x000003A1
	ldrb r0, [r6, r0]
	cmp r0, #2
	bne _021E770E
	ldr r7, _021E7728 ; =ov87_021E82E4
	mov r4, #0
	add r5, r6, #0
_021E76D0:
	mov r0, #0xd1
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #3
	bl ov87_021E8078
	mov r0, #0xd1
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl ov87_021E7FD4
	ldr r0, _021E772C ; =0x000003A2
	add r1, r6, r4
	ldrb r0, [r1, r0]
	mov r2, #2
	lsl r1, r0, #2
	add r3, r7, r1
	mov r0, #0xd1
	ldrsh r1, [r7, r1]
	ldrsh r2, [r3, r2]
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	sub r1, #0x24
	sub r2, #0xa
	bl ov87_021E7FEC
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #2
	blt _021E76D0
_021E770E:
	ldr r1, _021E7730 ; =0x0000039D
	mov r0, #0x5b
	ldrb r1, [r6, r1]
	lsl r0, r0, #2
	add r0, r6, r0
	bl ov87_021E7F28
_021E771C:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7720: .word 0x0000039E
_021E7724: .word 0x000003A1
_021E7728: .word ov87_021E82E4
_021E772C: .word 0x000003A2
_021E7730: .word 0x0000039D
	thumb_func_end ov87_021E7698

	thumb_func_start ov87_021E7734
ov87_021E7734: ; 0x021E7734
	push {r4, r5}
	ldr r1, _021E7880 ; =0x000003A1
	mov r3, #0
	ldrb r2, [r0, r1]
	cmp r2, #1
	bhi _021E7746
	add r0, r3, #0
	pop {r4, r5}
	bx lr
_021E7746:
	add r2, r1, #2
	ldrb r2, [r0, r2]
	add r4, r0, r2
	add r2, r1, #0
	sub r2, #0x41
	ldrb r2, [r4, r2]
	add r4, r1, #1
	ldrb r4, [r0, r4]
	add r5, r0, r4
	add r4, r1, #0
	sub r4, #0x41
	ldrb r4, [r5, r4]
	cmp r4, r2
	bne _021E7774
	sub r2, r1, #1
	ldrb r4, [r0, r2]
	mov r2, #1
	sub r1, r1, #1
	bic r4, r2
	mov r2, #1
	orr r2, r4
	strb r2, [r0, r1]
	b _021E779E
_021E7774:
	cmp r4, #4
	bne _021E778A
	sub r2, r1, #1
	ldrb r4, [r0, r2]
	mov r2, #1
	sub r1, r1, #1
	bic r4, r2
	mov r2, #1
	orr r2, r4
	strb r2, [r0, r1]
	b _021E779E
_021E778A:
	cmp r2, #4
	bne _021E779E
	sub r2, r1, #1
	ldrb r4, [r0, r2]
	mov r2, #1
	sub r1, r1, #1
	bic r4, r2
	mov r2, #1
	orr r2, r4
	strb r2, [r0, r1]
_021E779E:
	ldr r1, _021E7880 ; =0x000003A1
	ldrb r2, [r0, r1]
	cmp r2, #2
	bhi _021E77AC
	mov r0, #0
	pop {r4, r5}
	bx lr
_021E77AC:
	add r2, r1, #2
	ldrb r2, [r0, r2]
	add r4, r0, r2
	add r2, r1, #0
	sub r2, #0x41
	ldrb r4, [r4, r2]
	add r2, r1, #1
	ldrb r2, [r0, r2]
	add r5, r0, r2
	add r2, r1, #0
	sub r2, #0x41
	ldrb r2, [r5, r2]
	cmp r2, r4
	bne _021E77D8
	add r5, r1, #3
	ldrb r5, [r0, r5]
	sub r1, #0x41
	add r5, r0, r5
	ldrb r1, [r5, r1]
	cmp r2, r1
	bne _021E77D8
	mov r3, #1
_021E77D8:
	cmp r2, #4
	bne _021E77E2
	cmp r4, #4
	bne _021E77E2
	mov r3, #1
_021E77E2:
	cmp r2, #4
	bne _021E77F8
	mov r1, #0xe9
	lsl r1, r1, #2
	ldrb r5, [r0, r1]
	sub r1, #0x44
	add r5, r0, r5
	ldrb r1, [r5, r1]
	cmp r1, #4
	bne _021E77F8
	mov r3, #1
_021E77F8:
	cmp r4, #4
	bne _021E780E
	mov r1, #0xe9
	lsl r1, r1, #2
	ldrb r5, [r0, r1]
	sub r1, #0x44
	add r5, r0, r5
	ldrb r1, [r5, r1]
	cmp r1, #4
	bne _021E780E
	mov r3, #1
_021E780E:
	cmp r2, #4
	bne _021E7824
	mov r1, #0xe9
	lsl r1, r1, #2
	ldrb r5, [r0, r1]
	sub r1, #0x44
	add r5, r0, r5
	ldrb r1, [r5, r1]
	cmp r4, r1
	bne _021E7824
	mov r3, #1
_021E7824:
	cmp r4, #4
	bne _021E783A
	mov r1, #0xe9
	lsl r1, r1, #2
	ldrb r5, [r0, r1]
	sub r1, #0x44
	add r5, r0, r5
	ldrb r1, [r5, r1]
	cmp r2, r1
	bne _021E783A
	mov r3, #1
_021E783A:
	mov r1, #0xe9
	lsl r1, r1, #2
	ldrb r5, [r0, r1]
	sub r1, #0x44
	add r5, r0, r5
	ldrb r1, [r5, r1]
	cmp r1, #4
	bne _021E7850
	cmp r2, r4
	bne _021E7850
	mov r3, #1
_021E7850:
	cmp r3, #1
	bne _021E787A
	ldr r1, _021E7884 ; =0x000003A2
	mov r4, #0
	add r2, r1, #0
	sub r2, #0x42
_021E785C:
	add r3, r0, r4
	ldrb r3, [r3, r1]
	add r3, r0, r3
	ldrb r3, [r3, r2]
	cmp r3, #4
	beq _021E786E
	ldr r1, _021E7888 ; =0x0000039F
	strb r3, [r0, r1]
	b _021E7874
_021E786E:
	add r4, r4, #1
	cmp r4, #3
	blt _021E785C
_021E7874:
	mov r0, #1
	pop {r4, r5}
	bx lr
_021E787A:
	mov r0, #0
	pop {r4, r5}
	bx lr
	.balign 4, 0
_021E7880: .word 0x000003A1
_021E7884: .word 0x000003A2
_021E7888: .word 0x0000039F
	thumb_func_end ov87_021E7734

	thumb_func_start ov87_021E788C
ov87_021E788C: ; 0x021E788C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r0, #0
	mov r7, #0x36
	add r4, r0, #0
	add r5, r6, #0
	lsl r7, r7, #4
_021E789A:
	ldr r1, _021E78D0 ; =0x000003A2
	add r2, r6, r4
	ldrb r1, [r2, r1]
	add r1, r6, r1
	ldrb r1, [r1, r7]
	cmp r1, #4
	bne _021E78B6
	mov r0, #0x35
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #1
	bl ov87_021E80A8
	mov r0, #1
_021E78B6:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #3
	blt _021E789A
	mov r1, #0
	strb r1, [r6, #0x14]
	ldrb r2, [r6, #0x14]
	lsl r1, r2, #4
	orr r2, r1
	ldr r1, _021E78D4 ; =0x0400004D
	strb r2, [r1]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E78D0: .word 0x000003A2
_021E78D4: .word 0x0400004D
	thumb_func_end ov87_021E788C

	thumb_func_start ov87_021E78D8
ov87_021E78D8: ; 0x021E78D8
	push {r3, r4, r5, r6, r7, lr}
	ldr r2, _021E7980 ; =0x000003A2
	add r5, r0, #0
	add r3, r2, #0
	mov r0, #0
	sub r3, #0x42
_021E78E4:
	add r4, r5, r0
	ldrb r4, [r4, r2]
	add r4, r5, r4
	ldrb r4, [r4, r3]
	cmp r4, #4
	beq _021E78F6
	add r0, r0, #1
	cmp r0, #3
	blt _021E78E4
_021E78F6:
	cmp r0, #3
	bne _021E78FE
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E78FE:
	cmp r1, #0
	ldrb r0, [r5, #0x14]
	bne _021E794A
	cmp r0, #0
	bne _021E790E
	ldr r0, _021E7984 ; =0x00000563
	bl PlaySE
_021E790E:
	ldrb r0, [r5, #0x14]
	cmp r0, #4
	bhs _021E791A
	add r0, r0, #1
	strb r0, [r5, #0x14]
	b _021E7970
_021E791A:
	mov r7, #0x36
	mov r4, #0
	add r6, r5, #0
	lsl r7, r7, #4
_021E7922:
	ldr r0, _021E7980 ; =0x000003A2
	add r1, r5, r4
	ldrb r0, [r1, r0]
	add r0, r5, r0
	ldrb r0, [r0, r7]
	cmp r0, #4
	bne _021E793E
	ldr r1, _021E7988 ; =0x0000039F
	mov r0, #0x35
	lsl r0, r0, #4
	ldrb r1, [r5, r1]
	ldr r0, [r6, r0]
	bl ov87_021E803C
_021E793E:
	add r4, r4, #1
	add r6, r6, #4
	cmp r4, #3
	blt _021E7922
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E794A:
	cmp r0, #0
	beq _021E7954
	sub r0, r0, #1
	strb r0, [r5, #0x14]
	b _021E7970
_021E7954:
	mov r4, #0
	mov r6, #0x35
	add r7, r4, #0
	lsl r6, r6, #4
_021E795C:
	ldr r0, [r5, r6]
	add r1, r7, #0
	bl ov87_021E80A8
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #3
	blt _021E795C
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E7970:
	ldrb r1, [r5, #0x14]
	lsl r0, r1, #4
	orr r1, r0
	ldr r0, _021E798C ; =0x0400004D
	strb r1, [r0]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7980: .word 0x000003A2
_021E7984: .word 0x00000563
_021E7988: .word 0x0000039F
_021E798C: .word 0x0400004D
	thumb_func_end ov87_021E78D8

	thumb_func_start ov87_021E7990
ov87_021E7990: ; 0x021E7990
	ldrb r1, [r0, #0xe]
	add r1, r1, #1
	strb r1, [r0, #0xe]
	bx lr
	thumb_func_end ov87_021E7990

	thumb_func_start ov87_021E7998
ov87_021E7998: ; 0x021E7998
	ldrb r1, [r0, #0xe]
	add r1, r1, #1
	strb r1, [r0, #0xe]
	bx lr
	thumb_func_end ov87_021E7998

	thumb_func_start ov87_021E79A0
ov87_021E79A0: ; 0x021E79A0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov87_021E7FD4
	add r0, r4, #0
	add r0, #0xfc
	mov r1, #0
	bl FillWindowPixelBuffer
	add r4, #0xfc
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	pop {r4, pc}
	thumb_func_end ov87_021E79A0

	thumb_func_start ov87_021E79C4
ov87_021E79C4: ; 0x021E79C4
	push {r3, r4, lr}
	sub sp, #4
	mov r3, #0xe2
	add r4, r0, #0
	mov r0, #0x7a
	lsl r3, r3, #2
	str r0, [sp]
	mov r0, #0xcf
	mov r1, #7
	mov r2, #0
	add r3, r4, r3
	bl GfGfxLoader_GetCharData
	mov r1, #0xe1
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r1, #4
	ldr r3, [r4, r0]
	mov r1, #0
	str r1, [sp]
	ldr r2, [r3, #0x14]
	ldr r0, [r4, #0x58]
	ldr r3, [r3, #0x10]
	bl BG_LoadCharTilesData
	ldr r0, [r4, #0x58]
	mov r1, #0
	bl BgCommitTilemapBufferToVram
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov87_021E79C4

	thumb_func_start ov87_021E7A04
ov87_021E7A04: ; 0x021E7A04
	push {r4, lr}
	mov r1, #0xe2
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	mov r0, #0x7a
	ldr r1, [r1, #0x10]
	bl AllocFromHeap
	mov r1, #0xe3
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	cmp r0, #0
	bne _021E7A28
	bne _021E7A28
	bl GF_AssertFail
_021E7A28:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov87_021E7A04

	thumb_func_start ov87_021E7A2C
ov87_021E7A2C: ; 0x021E7A2C
	mov r1, #0xe2
	lsl r1, r1, #2
	ldr r2, [r0, r1]
	add r1, r1, #4
	ldr r0, [r0, r1]
	ldr r1, [r2, #0x14]
	ldr r3, _021E7A40 ; =memcpy
	ldr r2, [r2, #0x10]
	bx r3
	nop
_021E7A40: .word memcpy
	thumb_func_end ov87_021E7A2C

	thumb_func_start ov87_021E7A44
ov87_021E7A44: ; 0x021E7A44
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r0, #0
	mov r0, #2
	mvn r0, r0
	add r7, r1, #0
	str r2, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
_021E7A56:
	ldr r1, [sp, #4]
	ldr r0, [sp, #8]
	ldr r4, [sp, #0xc]
	add r5, r1, r0
_021E7A5E:
	add r1, r7, r4
	cmp r1, #0
	ble _021E7A7C
	mov r0, #1
	lsl r0, r0, #8
	cmp r1, r0
	bge _021E7A7C
	cmp r5, #0
	ble _021E7A7C
	cmp r5, #0xc0
	bge _021E7A7C
	add r0, r6, #0
	add r2, r5, #0
	bl ov87_021E7AB0
_021E7A7C:
	add r4, r4, #1
	cmp r4, #3
	blt _021E7A5E
	ldr r0, [sp, #8]
	add r0, r0, #1
	str r0, [sp, #8]
	cmp r0, #3
	blt _021E7A56
	mov r1, #0
	mov r3, #0xe3
	str r1, [sp]
	lsl r3, r3, #2
	ldr r2, [r6, r3]
	sub r3, r3, #4
	ldr r3, [r6, r3]
	ldr r0, [r6, #0x58]
	ldr r3, [r3, #0x10]
	bl BG_LoadCharTilesData
	ldr r0, [r6, #0x58]
	mov r1, #0
	bl BgCommitTilemapBufferToVram
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov87_021E7A44

	thumb_func_start ov87_021E7AB0
ov87_021E7AB0: ; 0x021E7AB0
	push {r3, r4, r5, r6}
	mov r3, #1
	mov r4, #0xff
	tst r3, r1
	bne _021E7ABE
	mov r3, #0xf
	b _021E7AC0
_021E7ABE:
	mov r3, #0xf0
_021E7AC0:
	eor r3, r4
	lsl r3, r3, #0x18
	lsr r4, r1, #3
	mov r6, #7
	lsr r5, r2, #3
	and r1, r6
	lsr r3, r3, #0x18
	lsl r4, r4, #5
	lsl r5, r5, #0xa
	lsr r1, r1, #1
	cmp r2, #8
	bhs _021E7ADC
	lsl r2, r2, #2
	b _021E7AE0
_021E7ADC:
	lsl r2, r2, #0x1d
	lsr r2, r2, #0x1b
_021E7AE0:
	mov r6, #0xe3
	lsl r6, r6, #2
	add r4, r5, r4
	add r1, r1, r4
	ldr r0, [r0, r6]
	add r2, r2, r1
	ldrb r1, [r0, r2]
	and r1, r3
	strb r1, [r0, r2]
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
	thumb_func_end ov87_021E7AB0

	thumb_func_start ov87_021E7AF8
ov87_021E7AF8: ; 0x021E7AF8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0x20
	mov r1, #0x7a
	bl GF_CreateVramTransferManager
	bl ov87_021E7EF0
	bl NNS_G2dInitOamManagerModule
	mov r0, #0
	str r0, [sp]
	mov r1, #0x80
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r3, #0x20
	str r3, [sp, #0xc]
	mov r2, #0x7a
	str r2, [sp, #0x10]
	add r2, r0, #0
	bl OamManager_Create
	mov r0, #0x28
	add r1, r5, #4
	mov r2, #0x7a
	bl G2dRenderer_Init
	mov r2, #2
	str r0, [r5]
	add r0, r5, #4
	mov r1, #0
	lsl r2, r2, #0x14
	bl G2dRenderer_SetSubSurfaceCoords
	ldr r4, _021E7BC0 ; =ov87_021E8394
	mov r7, #0
	add r6, r5, #0
_021E7B44:
	ldrb r0, [r4]
	add r1, r7, #0
	mov r2, #0x7a
	bl Create2DGfxResObjMan
	mov r1, #0x4b
	lsl r1, r1, #2
	str r0, [r6, r1]
	add r7, r7, #1
	add r4, r4, #1
	add r6, r6, #4
	cmp r7, #4
	blt _021E7B44
	add r0, r5, #0
	mov r1, #1
	bl ov87_021E7BC4
	mov r1, #1
	add r0, r5, #0
	add r2, r1, #0
	add r3, r1, #0
	bl ov87_021E7C50
	add r0, r5, #0
	mov r1, #1
	bl ov87_021E7CE0
	add r0, r5, #0
	mov r1, #1
	bl ov87_021E7D6C
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	mov r3, #2
	bl ov87_021E7C50
	mov r7, #0x4f
	lsl r7, r7, #2
	mov r4, #0
	add r6, r7, #4
_021E7B96:
	ldr r0, [r5, r7]
	bl sub_0200ACF0
	ldr r0, [r5, r6]
	bl sub_0200AF94
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #5
	blt _021E7B96
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_021E7BC0: .word ov87_021E8394
	thumb_func_end ov87_021E7AF8

	thumb_func_start ov87_021E7BC4
ov87_021E7BC4: ; 0x021E7BC4
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x7a
	str r0, [sp, #8]
	add r0, #0xb2
	ldr r0, [r4, r0]
	mov r1, #0xcf
	mov r2, #0xc
	mov r3, #0
	bl AddCharResObjFromNarc
	mov r1, #0x57
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0x7a
	str r0, [sp, #0xc]
	add r0, #0xb6
	ldr r0, [r4, r0]
	mov r1, #0xcf
	mov r2, #0xd
	mov r3, #0
	bl AddPlttResObjFromNarc
	mov r1, #0x16
	lsl r1, r1, #4
	str r0, [r4, r1]
	mov r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0x7a
	str r0, [sp, #8]
	add r0, #0xba
	ldr r0, [r4, r0]
	mov r1, #0xcf
	mov r2, #0xb
	mov r3, #0
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x59
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #2
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x7a
	str r0, [sp, #8]
	add r0, #0xbe
	ldr r0, [r4, r0]
	mov r1, #0xcf
	mov r2, #0xa
	mov r3, #0
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x5a
	lsl r1, r1, #2
	str r0, [r4, r1]
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov87_021E7BC4

	thumb_func_start ov87_021E7C50
ov87_021E7C50: ; 0x021E7C50
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r2, #0
	add r7, r3, #0
	str r6, [sp]
	add r5, r0, #0
	str r7, [sp, #4]
	mov r0, #0x7a
	str r0, [sp, #8]
	add r0, #0xb2
	lsl r4, r1, #4
	ldr r0, [r5, r0]
	mov r1, #0xcf
	mov r2, #0x20
	mov r3, #0
	bl AddCharResObjFromNarc
	mov r1, #0x4f
	add r2, r5, r4
	lsl r1, r1, #2
	str r0, [r2, r1]
	str r6, [sp]
	str r7, [sp, #4]
	mov r0, #5
	str r0, [sp, #8]
	mov r0, #0x7a
	str r0, [sp, #0xc]
	add r0, #0xb6
	ldr r0, [r5, r0]
	mov r1, #0xcf
	mov r2, #0x21
	mov r3, #0
	bl AddPlttResObjFromNarc
	mov r1, #5
	add r2, r5, r4
	lsl r1, r1, #6
	str r0, [r2, r1]
	str r6, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x7a
	str r0, [sp, #8]
	add r0, #0xba
	ldr r0, [r5, r0]
	mov r1, #0xcf
	mov r2, #0x1f
	mov r3, #0
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x51
	add r2, r5, r4
	lsl r1, r1, #2
	str r0, [r2, r1]
	str r6, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x7a
	str r0, [sp, #8]
	add r0, #0xbe
	ldr r0, [r5, r0]
	mov r1, #0xcf
	mov r2, #0x1e
	mov r3, #0
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x52
	add r2, r5, r4
	lsl r1, r1, #2
	str r0, [r2, r1]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov87_021E7C50

	thumb_func_start ov87_021E7CE0
ov87_021E7CE0: ; 0x021E7CE0
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #3
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x7a
	str r0, [sp, #8]
	add r0, #0xb2
	ldr r0, [r4, r0]
	mov r1, #0xcf
	mov r2, #0x10
	mov r3, #0
	bl AddCharResObjFromNarc
	mov r1, #0x5b
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #3
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0x7a
	str r0, [sp, #0xc]
	add r0, #0xb6
	ldr r0, [r4, r0]
	mov r1, #0xcf
	mov r2, #0x11
	mov r3, #0
	bl AddPlttResObjFromNarc
	mov r1, #0x17
	lsl r1, r1, #4
	str r0, [r4, r1]
	mov r0, #3
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x7a
	str r0, [sp, #8]
	add r0, #0xba
	ldr r0, [r4, r0]
	mov r1, #0xcf
	mov r2, #0xf
	mov r3, #0
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x5d
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #3
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0x7a
	str r0, [sp, #8]
	add r0, #0xbe
	ldr r0, [r4, r0]
	mov r1, #0xcf
	mov r2, #0xe
	mov r3, #0
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x5e
	lsl r1, r1, #2
	str r0, [r4, r1]
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov87_021E7CE0

	thumb_func_start ov87_021E7D6C
ov87_021E7D6C: ; 0x021E7D6C
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #4
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x7a
	str r0, [sp, #8]
	add r0, #0xb2
	ldr r0, [r4, r0]
	mov r1, #0xcf
	mov r2, #0x14
	mov r3, #0
	bl AddCharResObjFromNarc
	mov r1, #0x5f
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #4
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x7a
	str r0, [sp, #0xc]
	add r0, #0xb6
	ldr r0, [r4, r0]
	mov r1, #0xcf
	mov r2, #0x15
	mov r3, #0
	bl AddPlttResObjFromNarc
	mov r1, #6
	lsl r1, r1, #6
	str r0, [r4, r1]
	mov r0, #4
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x7a
	str r0, [sp, #8]
	add r0, #0xba
	ldr r0, [r4, r0]
	mov r1, #0xcf
	mov r2, #0x13
	mov r3, #0
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x61
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #4
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x7a
	str r0, [sp, #8]
	add r0, #0xbe
	ldr r0, [r4, r0]
	mov r1, #0xcf
	mov r2, #0x12
	mov r3, #0
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x62
	lsl r1, r1, #2
	str r0, [r4, r1]
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov87_021E7D6C

	thumb_func_start ov87_021E7DF8
ov87_021E7DF8: ; 0x021E7DF8
	push {r3, r4, r5, lr}
	sub sp, #0x80
	add r4, r0, #0
	mov r0, #0
	str r1, [sp]
	mvn r0, r0
	str r0, [sp, #4]
	add r5, r2, #0
	str r0, [sp, #8]
	mov r2, #0
	mov r0, #0x4b
	str r2, [sp, #0xc]
	lsl r0, r0, #2
	str r3, [sp, #0x10]
	ldr r3, [r4, r0]
	str r3, [sp, #0x14]
	add r3, r0, #4
	ldr r3, [r4, r3]
	str r3, [sp, #0x18]
	add r3, r0, #0
	add r3, #8
	ldr r3, [r4, r3]
	add r0, #0xc
	str r3, [sp, #0x1c]
	ldr r0, [r4, r0]
	add r3, r1, #0
	str r0, [sp, #0x20]
	str r2, [sp, #0x24]
	str r2, [sp, #0x28]
	add r0, sp, #0x5c
	add r2, r1, #0
	bl CreateSpriteResourcesHeader
	ldr r0, [r4]
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
	ldr r0, [sp, #0x90]
	str r0, [sp, #0x50]
	mov r0, #0x7a
	str r0, [sp, #0x58]
	add r0, sp, #0x80
	ldrb r0, [r0, #0x14]
	cmp r0, #0
	bne _021E7E6E
	mov r0, #1
	str r0, [sp, #0x54]
	b _021E7E72
_021E7E6E:
	mov r0, #2
	str r0, [sp, #0x54]
_021E7E72:
	add r0, sp, #0x2c
	bl CreateSprite
	mov r1, #0
	add r4, r0, #0
	bl Set2dSpriteAnimActiveFlag
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xc
	bl sub_02024868
	add r0, r4, #0
	add r1, r5, #0
	bl Set2dSpriteAnimSeqNo
	add r0, r4, #0
	add sp, #0x80
	pop {r3, r4, r5, pc}
	thumb_func_end ov87_021E7DF8

	thumb_func_start ov87_021E7E98
ov87_021E7E98: ; 0x021E7E98
	push {r3, r4, r5, r6, r7, lr}
	mov r7, #5
	add r5, r0, #0
	mov r4, #0
	lsl r7, r7, #6
_021E7EA2:
	lsl r0, r4, #4
	add r6, r5, r0
	mov r0, #0x4f
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl sub_0200AEB0
	ldr r0, [r6, r7]
	bl sub_0200B0A8
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #5
	blo _021E7EA2
	mov r6, #0x4b
	mov r4, #0
	lsl r6, r6, #2
_021E7EC6:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, r6]
	bl Destroy2DGfxResObjMan
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _021E7EC6
	ldr r0, [r5]
	bl sub_02024504
	bl OamManager_Free
	bl sub_0202168C
	bl sub_02022608
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov87_021E7E98

	thumb_func_start ov87_021E7EF0
ov87_021E7EF0: ; 0x021E7EF0
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _021E7F20 ; =ov87_021E8398
	add r3, sp, #0
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r1, _021E7F24 ; =0x00200010
	add r0, r2, #0
	add r2, r1, #0
	bl sub_020215C0
	mov r0, #0xe
	mov r1, #0x7a
	bl sub_02022588
	bl sub_020216C8
	bl sub_02022638
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_021E7F20: .word ov87_021E8398
_021E7F24: .word 0x00200010
	thumb_func_end ov87_021E7EF0

	thumb_func_start ov87_021E7F28
ov87_021E7F28: ; 0x021E7F28
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #8
	blt _021E7F38
	bl GF_AssertFail
_021E7F38:
	mov r0, #0x13
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #3
	bl Get2DGfxResObjById
	add r6, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0x7a
	str r0, [sp, #4]
	ldr r3, _021E7F68 ; =ov87_021E84C0
	add r0, #0xb6
	ldrb r3, [r3, r4]
	ldr r0, [r5, r0]
	add r1, r6, #0
	mov r2, #0xcf
	bl ReplacePlttResObjFromNarc
	add r0, r6, #0
	bl sub_0200B084
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E7F68: .word ov87_021E84C0
	thumb_func_end ov87_021E7F28

	thumb_func_start ov87_021E7F6C
ov87_021E7F6C: ; 0x021E7F6C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0x7a
	mov r1, #0x10
	add r7, r2, #0
	str r3, [sp, #8]
	bl AllocFromHeap
	add r4, r0, #0
	add r2, r4, #0
	mov r1, #0x10
	mov r0, #0
_021E7F88:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _021E7F88
	ldr r0, [sp, #0x2c]
	ldr r3, [sp, #0x28]
	str r0, [sp]
	add r0, sp, #0x10
	ldrb r0, [r0, #0x14]
	add r1, r6, #0
	add r2, r7, #0
	str r0, [sp, #4]
	add r0, r5, #0
	bl ov87_021E7DF8
	add r2, sp, #0x10
	str r0, [r4, #0xc]
	ldrb r0, [r2, #0x14]
	strb r0, [r4, #2]
	ldrh r2, [r2, #0x10]
	ldr r1, [sp, #8]
	add r0, r4, #0
	bl ov87_021E7FEC
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov87_021E7F6C

	thumb_func_start ov87_021E7FC0
ov87_021E7FC0: ; 0x021E7FC0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl sub_02024758
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov87_021E7FC0

	thumb_func_start ov87_021E7FD4
ov87_021E7FD4: ; 0x021E7FD4
	ldr r3, _021E7FDC ; =Set2dSpriteVisibleFlag
	ldr r0, [r0, #0xc]
	bx r3
	nop
_021E7FDC: .word Set2dSpriteVisibleFlag
	thumb_func_end ov87_021E7FD4

	thumb_func_start ov87_021E7FE0
ov87_021E7FE0: ; 0x021E7FE0
	ldr r3, _021E7FE8 ; =sub_02024ADC
	ldr r0, [r0, #0xc]
	bx r3
	nop
_021E7FE8: .word sub_02024ADC
	thumb_func_end ov87_021E7FE0

	thumb_func_start ov87_021E7FEC
ov87_021E7FEC: ; 0x021E7FEC
	push {lr}
	sub sp, #0xc
	lsl r2, r2, #0xc
	lsl r1, r1, #0xc
	str r2, [sp, #4]
	str r1, [sp]
	ldrb r1, [r0, #2]
	cmp r1, #1
	bne _021E8006
	mov r1, #2
	lsl r1, r1, #0x14
	add r1, r2, r1
	str r1, [sp, #4]
_021E8006:
	ldr r0, [r0, #0xc]
	add r1, sp, #0
	bl sub_020247D4
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end ov87_021E7FEC

	thumb_func_start ov87_021E8014
ov87_021E8014: ; 0x021E8014
	push {r3, r4, r5, lr}
	ldr r0, [r0, #0xc]
	add r5, r1, #0
	add r4, r2, #0
	bl sub_020248AC
	ldr r2, [r0]
	asr r1, r2, #0xb
	lsr r1, r1, #0x14
	add r1, r2, r1
	asr r1, r1, #0xc
	str r1, [r5]
	ldr r1, [r0, #4]
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r0, r0, #0xc
	str r0, [r4]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov87_021E8014

	thumb_func_start ov87_021E803C
ov87_021E803C: ; 0x021E803C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r1, #1
	ldr r0, [r5, #0xc]
	lsl r1, r1, #0xc
	bl sub_02024868
	ldr r0, [r5, #0xc]
	add r1, r4, #0
	bl sub_02024950
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov87_021E803C

	thumb_func_start ov87_021E8058
ov87_021E8058: ; 0x021E8058
	ldr r3, _021E8064 ; =sub_02024804
	ldr r0, [r0, #0xc]
	ldr r1, _021E8068 ; =ov87_021E83A8
	mov r2, #1
	bx r3
	nop
_021E8064: .word sub_02024804
_021E8068: .word ov87_021E83A8
	thumb_func_end ov87_021E8058

	thumb_func_start ov87_021E806C
ov87_021E806C: ; 0x021E806C
	ldr r3, _021E8074 ; =sub_02024804
	ldr r0, [r0, #0xc]
	mov r2, #2
	bx r3
	.balign 4, 0
_021E8074: .word sub_02024804
	thumb_func_end ov87_021E806C

	thumb_func_start ov87_021E8078
ov87_021E8078: ; 0x021E8078
	ldr r3, _021E8080 ; =sub_02024A48
	ldr r0, [r0, #0xc]
	bx r3
	nop
_021E8080: .word sub_02024A48
	thumb_func_end ov87_021E8078

	thumb_func_start ov87_021E8084
ov87_021E8084: ; 0x021E8084
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl Set2dSpriteAnimActiveFlag
	mov r1, #1
	ldr r0, [r4, #0xc]
	lsl r1, r1, #0xc
	bl sub_02024868
	ldr r0, [r4, #0xc]
	bl sub_020249A8
	add r1, r0, #0
	ldr r0, [r4, #0xc]
	bl Set2dSpriteAnimSeqNo
	pop {r4, pc}
	thumb_func_end ov87_021E8084

	thumb_func_start ov87_021E80A8
ov87_021E80A8: ; 0x021E80A8
	ldr r3, _021E80B0 ; =sub_02024B38
	ldr r0, [r0, #0xc]
	bx r3
	nop
_021E80B0: .word sub_02024B38
	thumb_func_end ov87_021E80A8

	thumb_func_start ov87_021E80B4
ov87_021E80B4: ; 0x021E80B4
	ldr r3, _021E80BC ; =sub_02024B68
	ldr r0, [r0, #0xc]
	bx r3
	nop
_021E80BC: .word sub_02024B68
	thumb_func_end ov87_021E80B4

	thumb_func_start ov87_021E80C0
ov87_021E80C0: ; 0x021E80C0
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	mov r4, #0
_021E80C8:
	ldr r2, _021E80EC ; =ov87_021E842C
	lsl r6, r4, #4
	lsl r3, r4, #3
	add r0, r7, #0
	add r1, r5, r6
	add r2, r2, r3
	bl AddWindow
	add r0, r5, r6
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #0x10
	blo _021E80C8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E80EC: .word ov87_021E842C
	thumb_func_end ov87_021E80C0

	thumb_func_start ov87_021E80F0
ov87_021E80F0: ; 0x021E80F0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_021E80F6:
	lsl r0, r4, #4
	add r0, r5, r0
	bl RemoveWindow
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #0x10
	blo _021E80F6
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov87_021E80F0

	thumb_func_start ov87_021E810C
ov87_021E810C: ; 0x021E810C
	push {r3, r4, lr}
	sub sp, #4
	add r4, r1, #0
	mov r1, #0x7a
	str r1, [sp]
	ldr r2, _021E8130 ; =0x000003F7
	mov r1, #2
	mov r3, #0
	bl sub_0200E398
	ldr r2, _021E8130 ; =0x000003F7
	add r0, r4, #0
	mov r1, #1
	mov r3, #0xb
	bl DrawFrameAndWindow1
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_021E8130: .word 0x000003F7
	thumb_func_end ov87_021E810C

	thumb_func_start ov87_021E8134
ov87_021E8134: ; 0x021E8134
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r1, #0
	add r4, r0, #0
	bl GetWindowBgId
	add r1, r0, #0
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x7a
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r2, _021E8170 ; =0x000003D9
	mov r3, #0xa
	bl LoadUserFrameGfx2
	add r0, r4, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	ldr r2, _021E8170 ; =0x000003D9
	add r0, r4, #0
	mov r1, #0
	mov r3, #0xa
	bl DrawFrameAndWindow2
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_021E8170: .word 0x000003D9
	thumb_func_end ov87_021E8134

	.rodata

_021E8174:
	.byte 0x58, 0x00, 0xA0, 0x00, 0x44, 0x00, 0xA0, 0x00, 0x26, 0x00, 0x38, 0x00
	.byte 0x44, 0x00, 0x44, 0x00

ov87_021E8184: ; 0x021E8184
	.byte 0xA4, 0xBF, 0x5E, 0xA4, 0xFF, 0x00, 0x00, 0x00

ov87_021E818C: ; 0x021E818C
	.byte 0xA4, 0xBF, 0x4C, 0xB4
	.byte 0xFF, 0x00, 0x00, 0x00

ov87_021E8194: ; 0x021E8194
	.byte 0x34, 0x00, 0x44, 0x00, 0x6C, 0x00, 0x44, 0x00, 0xA4, 0x00, 0x44, 0x00

ov87_021E81A0: ; 0x021E81A0
	.byte 0x00, 0x00

ov87_021E81A2: ; 0x021E81A2
	.byte 0x24, 0x00, 0x38, 0x00, 0x24, 0x00, 0x70, 0x00, 0x24, 0x00, 0xA8, 0x00, 0x24, 0x00

ov87_021E81B0: ; 0x021E81B0
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov87_021E81C0: ; 0x021E81C0
	.byte 0x2A, 0x9A, 0x00, 0x50, 0x2A, 0x9A, 0x58, 0x8A, 0x2A, 0x9A, 0x90, 0xC3, 0x2A, 0x9A, 0xCC, 0xFE
	.byte 0xFF, 0x00, 0x00, 0x00

ov87_021E81D4: ; 0x021E81D4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x06, 0x05, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov87_021E81F0: ; 0x021E81F0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov87_021E820C: ; 0x021E820C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x02, 0x03
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov87_021E8228: ; 0x021E8228
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov87_021E8244: ; 0x021E8244
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x04, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov87_021E8260: ; 0x021E8260
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x02, 0x03, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov87_021E827C: ; 0x021E827C
	.byte 0x09, 0x09, 0x09, 0x08
	.byte 0x07, 0x06, 0x05, 0x04, 0x02, 0x02, 0x02, 0x01, 0x01, 0x01, 0x01, 0x01, 0xF8, 0xF8, 0xF8, 0xF9
	.byte 0xF9, 0xFA, 0xFB, 0xFC, 0xEE, 0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF6, 0xF8

ov87_021E829C: ; 0x021E829C
	.byte 0x15, 0x36, 0x20, 0x59
	.byte 0x15, 0x36, 0x66, 0x9D, 0x15, 0x36, 0xAA, 0xE3, 0x44, 0x64, 0x20, 0x59, 0x44, 0x64, 0x66, 0x9D
	.byte 0x44, 0x64, 0xAA, 0xE3, 0x72, 0x94, 0x20, 0x59, 0x72, 0x94, 0x66, 0x9D, 0x72, 0x94, 0xAA, 0xE3

ov87_021E82C0: ; 0x021E82C0
	.byte 0x2A, 0x00

ov87_021E82C2: ; 0x021E82C2
	.byte 0x1B, 0x00, 0x75, 0x00, 0x1B, 0x00, 0xBD, 0x00, 0x1B, 0x00, 0x2A, 0x00, 0x4A, 0x00
	.byte 0x75, 0x00, 0x4A, 0x00, 0xBD, 0x00, 0x4A, 0x00, 0x2A, 0x00, 0x78, 0x00, 0x75, 0x00, 0x78, 0x00
	.byte 0xBD, 0x00, 0x78, 0x00

ov87_021E82E4: ; 0x021E82E4
	.byte 0x39, 0x00, 0x12, 0x00, 0x7C, 0x00, 0x12, 0x00, 0xBF, 0x00, 0x12, 0x00
	.byte 0x39, 0x00, 0x42, 0x00, 0x7C, 0x00, 0x42, 0x00, 0xBF, 0x00, 0x42, 0x00, 0x39, 0x00, 0x72, 0x00
	.byte 0x7C, 0x00, 0x72, 0x00, 0xBF, 0x00, 0x72, 0x00

ov87_021E8308: ; 0x021E8308
	.byte 0x15, 0x36, 0x20, 0x59, 0x15, 0x36, 0x66, 0x9D
	.byte 0x15, 0x36, 0xAA, 0xE3, 0x44, 0x64, 0x20, 0x59, 0x44, 0x64, 0x66, 0x9D, 0x44, 0x64, 0xAA, 0xE3
	.byte 0x72, 0x94, 0x20, 0x59, 0x72, 0x94, 0x66, 0x9D, 0x72, 0x94, 0xAA, 0xE3, 0xFF, 0x00, 0x00, 0x00

ov87_021E8330: ; 0x021E8330
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov87_021E8358: ; 0x021E8358
	.byte 0xA9, 0x00, 0xAA, 0x00, 0xAB, 0x00, 0xAC, 0x00
	.byte 0xAD, 0x00, 0xAE, 0x00, 0xB8, 0x00, 0xB9, 0x00, 0xBA, 0x00, 0xBB, 0x00, 0xBC, 0x00, 0xBD, 0x00
	.byte 0xBE, 0x00, 0xBF, 0x00, 0xC0, 0x00, 0xC1, 0x00, 0xC2, 0x00, 0xC3, 0x00, 0xC4, 0x00, 0xC5, 0x00
	.byte 0xC6, 0x00, 0xC7, 0x00, 0xC8, 0x00, 0x00, 0x00

ov87_021E8388: ; 0x021E8388
	.byte 0x0A, 0x0C, 0x06, 0x08

ov87_021E838C: ; 0x021E838C
	.byte 0xFC, 0xFC, 0xFC, 0xFC
	.byte 0xFC, 0xFC, 0xFC, 0xFC

ov87_021E8394: ; 0x021E8394
	.byte 0x05, 0x05, 0x05, 0x05

ov87_021E8398: ; 0x021E8398
	.byte 0x05, 0x00, 0x00, 0x00, 0xB8, 0x0B, 0x00, 0x00
	.byte 0x00, 0x14, 0x00, 0x00, 0x7A, 0x00, 0x00, 0x00

ov87_021E83A8: ; 0x021E83A8
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x33, 0x13, 0x00, 0x00, 0x33, 0x13, 0x00, 0x00, 0x33, 0x13, 0x00, 0x00
	.byte 0x00, 0x14, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x55, 0x15, 0x00, 0x00
	.byte 0x55, 0x15, 0x00, 0x00, 0x55, 0x15, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00
	.byte 0x00, 0x18, 0x00, 0x00, 0xCD, 0x1C, 0x00, 0x00, 0xCD, 0x1C, 0x00, 0x00, 0xCD, 0x1C, 0x00, 0x00
	.byte 0x49, 0x12, 0x00, 0x00, 0x49, 0x12, 0x00, 0x00, 0x49, 0x12, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00
	.byte 0x00, 0x0C, 0x00, 0x00, 0xCD, 0x0C, 0x00, 0x00, 0xCD, 0x0C, 0x00, 0x00, 0xCD, 0x0C, 0x00, 0x00
	.byte 0xB7, 0x0D, 0x00, 0x00, 0xB7, 0x0D, 0x00, 0x00, 0xB7, 0x0D, 0x00, 0x00

ov87_021E842C: ; 0x021E842C
	.byte 0x02, 0x02, 0x01, 0x1B
	.byte 0x04, 0x0C, 0x01, 0x00, 0x04, 0x18, 0x0D, 0x07, 0x04, 0x0D, 0x6D, 0x00, 0x04, 0x11, 0x03, 0x0B
	.byte 0x05, 0x0D, 0x89, 0x00, 0x04, 0x11, 0x08, 0x0B, 0x05, 0x0D, 0xC0, 0x00, 0x04, 0x11, 0x0E, 0x0B
	.byte 0x05, 0x0D, 0xF7, 0x00, 0x04, 0x11, 0x13, 0x0B, 0x05, 0x0D, 0x2E, 0x01, 0x04, 0x0A, 0x03, 0x05
	.byte 0x03, 0x0D, 0x65, 0x01, 0x04, 0x0A, 0x08, 0x05, 0x03, 0x0D, 0x74, 0x01, 0x04, 0x0A, 0x0E, 0x05
	.byte 0x03, 0x0D, 0x83, 0x01, 0x04, 0x0A, 0x13, 0x05, 0x03, 0x0D, 0x92, 0x01, 0x02, 0x0A, 0x09, 0x0C
	.byte 0x04, 0x0D, 0xA1, 0x01, 0x02, 0x0A, 0x09, 0x0C, 0x04, 0x0D, 0xA1, 0x01, 0x02, 0x0A, 0x09, 0x0C
	.byte 0x04, 0x0D, 0xA1, 0x01, 0x02, 0x0A, 0x15, 0x0D, 0x03, 0x0D, 0xD1, 0x01, 0x02, 0x0D, 0x15, 0x0D
	.byte 0x03, 0x0D, 0xD1, 0x01, 0x04, 0x02, 0x13, 0x1B, 0x04, 0x0C, 0x01, 0x00

	.data


ov87_021E84C0: ; 0x021E84C0
	.byte 0x16, 0x17, 0x18, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x00, 0x00, 0x00, 0x00
	; 0x021E84AC
