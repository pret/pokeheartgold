	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov67_021E5900
ov67_021E5900: ; 0x021E5900
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl OverlayManager_GetParentWork
	mov r2, #2
	add r5, r0, #0
	mov r0, #3
	mov r1, #0x48
	lsl r2, r2, #0x10
	bl CreateHeap
	ldr r1, _021E5964 ; =0x000004AC
	add r0, r4, #0
	mov r2, #0x48
	bl OverlayManager_CreateAndGetData
	ldr r2, _021E5964 ; =0x000004AC
	mov r1, #0
	add r4, r0, #0
	bl memset
	ldrh r0, [r5, #4]
	strh r0, [r4, #8]
	ldrh r0, [r5, #6]
	strb r0, [r4, #0xa]
	ldr r0, [r5]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #0x18]
	ldr r0, [r5]
	bl sub_0203107C
	str r0, [r4, #0x1c]
	ldr r0, [r5]
	bl Save_FrontierData_get
	str r0, [r4, #0x20]
	ldr r0, [r5]
	bl sub_0202D928
	str r0, [r4, #0x24]
	mov r0, #0x48
	str r0, [r4]
	mov r0, #4
	mov r1, #8
	bl SetKeyRepeatTimers
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_021E5964: .word 0x000004AC
	thumb_func_end ov67_021E5900

	thumb_func_start ov67_021E5968
ov67_021E5968: ; 0x021E5968
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	add r0, r5, #0
	bl OverlayManager_FreeData
	ldr r0, [r4]
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov67_021E5968

	thumb_func_start ov67_021E5984
ov67_021E5984: ; 0x021E5984
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r4]
	add r5, r0, #0
	cmp r1, #8
	bhi _021E5A52
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E59A2: ; jump table
	.short _021E59B4 - _021E59A2 - 2 ; case 0
	.short _021E59C2 - _021E59A2 - 2 ; case 1
	.short _021E59DE - _021E59A2 - 2 ; case 2
	.short _021E59F8 - _021E59A2 - 2 ; case 3
	.short _021E5A00 - _021E59A2 - 2 ; case 4
	.short _021E5A08 - _021E59A2 - 2 ; case 5
	.short _021E5A18 - _021E59A2 - 2 ; case 6
	.short _021E5A36 - _021E59A2 - 2 ; case 7
	.short _021E5A44 - _021E59A2 - 2 ; case 8
_021E59B4:
	bl ov67_021E5A6C
	cmp r0, #0
	beq _021E5A52
	mov r0, #1
	str r0, [r4]
	b _021E5A52
_021E59C2:
	mov r0, #6
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r5]
	add r2, r1, #0
	str r0, [sp, #8]
	mov r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #2
	str r0, [r4]
	b _021E5A52
_021E59DE:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E5A52
	ldrh r0, [r5, #8]
	cmp r0, #0
	bne _021E59F2
	mov r0, #3
	str r0, [r4]
	b _021E5A52
_021E59F2:
	mov r0, #4
	str r0, [r4]
	b _021E5A52
_021E59F8:
	bl ov67_021E5C04
	str r0, [r4]
	b _021E5A52
_021E5A00:
	bl ov67_021E5C44
	str r0, [r4]
	b _021E5A52
_021E5A08:
	bl ov67_021E6A40
	cmp r0, #0
	bne _021E5A52
	ldr r0, _021E5A68 ; =0x0000049C
	ldr r0, [r5, r0]
	str r0, [r4]
	b _021E5A52
_021E5A18:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5]
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #7
	str r0, [r4]
	b _021E5A52
_021E5A36:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E5A52
	mov r0, #8
	str r0, [r4]
	b _021E5A52
_021E5A44:
	bl ov67_021E5B44
	cmp r0, #0
	beq _021E5A52
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_021E5A52:
	ldr r0, [r4]
	cmp r0, #1
	blt _021E5A62
	cmp r0, #7
	bgt _021E5A62
	add r0, r5, #0
	bl ov67_021E69D8
_021E5A62:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_021E5A68: .word 0x0000049C
	thumb_func_end ov67_021E5984

	thumb_func_start ov67_021E5A6C
ov67_021E5A6C: ; 0x021E5A6C
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #4
	bhi _021E5B24
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E5A82: ; jump table
	.short _021E5A8C - _021E5A82 - 2 ; case 0
	.short _021E5AD6 - _021E5A82 - 2 ; case 1
	.short _021E5AE2 - _021E5A82 - 2 ; case 2
	.short _021E5AE8 - _021E5A82 - 2 ; case 3
	.short _021E5B14 - _021E5A82 - 2 ; case 4
_021E5A8C:
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E5B30 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _021E5B34 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	ldr r2, _021E5B38 ; =0x04000304
	ldr r0, _021E5B3C ; =0xFFFF7FFF
	ldrh r1, [r2]
	and r0, r1
	strh r0, [r2]
	bl ov67_021E5BC0
	mov r0, #0
	bl sub_0200FBDC
	mov r0, #1
	bl sub_0200FBDC
	add r0, r4, #0
	bl ov67_021E5DA0
	b _021E5B24
_021E5AD6:
	bl ov67_021E5EB0
	add r0, r4, #0
	bl ov67_021E60B4
	b _021E5B24
_021E5AE2:
	bl ov67_021E6820
	b _021E5B24
_021E5AE8:
	bl ov67_021E6008
	ldrh r0, [r4, #8]
	cmp r0, #0
	bne _021E5AFA
	add r0, r4, #0
	bl ov67_021E6220
	b _021E5B24
_021E5AFA:
	add r0, r4, #0
	bl ov67_021E63E8
	add r0, r4, #0
	bl ov67_021E65C0
	add r0, r4, #0
	bl ov67_021E681C
	add r0, r4, #0
	bl ov67_021E6BC4
	b _021E5B24
_021E5B14:
	ldr r0, _021E5B40 ; =ov67_021E5BE0
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0
	str r0, [r4, #4]
	mov r0, #1
	pop {r4, pc}
_021E5B24:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	pop {r4, pc}
	nop
_021E5B30: .word 0xFFFFE0FF
_021E5B34: .word 0x04001000
_021E5B38: .word 0x04000304
_021E5B3C: .word 0xFFFF7FFF
_021E5B40: .word ov67_021E5BE0
	thumb_func_end ov67_021E5A6C

	thumb_func_start ov67_021E5B44
ov67_021E5B44: ; 0x021E5B44
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _021E5B54
	cmp r1, #1
	beq _021E5B7E
	b _021E5BAE
_021E5B54:
	ldrh r1, [r4, #8]
	cmp r1, #0
	beq _021E5B64
	bl ov67_021E6C04
	add r0, r4, #0
	bl ov67_021E6474
_021E5B64:
	add r0, r4, #0
	bl ov67_021E6990
	add r0, r4, #0
	bl ov67_021E6080
	add r0, r4, #0
	bl ov67_021E60F4
	add r0, r4, #0
	bl ov67_021E5E84
	b _021E5BAE
_021E5B7E:
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E5BB8 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _021E5BBC ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r0, #0
	str r0, [r4, #4]
	mov r0, #1
	pop {r4, pc}
_021E5BAE:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_021E5BB8: .word 0xFFFFE0FF
_021E5BBC: .word 0x04001000
	thumb_func_end ov67_021E5B44

	thumb_func_start ov67_021E5BC0
ov67_021E5BC0: ; 0x021E5BC0
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E5BDC ; =ov67_021E6E38
	add r3, sp, #0
	mov r2, #5
_021E5BCA:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E5BCA
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_021E5BDC: .word ov67_021E6E38
	thumb_func_end ov67_021E5BC0

	thumb_func_start ov67_021E5BE0
ov67_021E5BE0: ; 0x021E5BE0
	push {r4, lr}
	add r4, r0, #0
	bl ov67_021E6A00
	ldr r0, [r4, #0x10]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	ldr r3, _021E5BFC ; =0x027E0000
	ldr r1, _021E5C00 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.balign 4, 0
_021E5BFC: .word 0x027E0000
_021E5C00: .word 0x00003FF8
	thumb_func_end ov67_021E5BE0

	thumb_func_start ov67_021E5C04
ov67_021E5C04: ; 0x021E5C04
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E5C34 ; =_021E6D4C
	bl sub_02025320
	cmp r0, #1
	beq _021E5C1C
	ldr r0, _021E5C38 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r1, r0
	beq _021E5C30
_021E5C1C:
	ldr r0, _021E5C3C ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	bl ov67_021E6BB8
	ldr r0, _021E5C40 ; =0x0000049C
	mov r1, #6
	str r1, [r4, r0]
	mov r0, #5
_021E5C30:
	pop {r4, pc}
	nop
_021E5C34: .word _021E6D4C
_021E5C38: .word gSystem
_021E5C3C: .word 0x000005DD
_021E5C40: .word 0x0000049C
	thumb_func_end ov67_021E5C04

	thumb_func_start ov67_021E5C44
ov67_021E5C44: ; 0x021E5C44
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E5D88 ; =0x000004A4
	ldr r0, [r4, r0]
	bl sub_02019BE4
	cmp r0, #0xc
	bhi _021E5C58
	beq _021E5C72
	b _021E5CBE
_021E5C58:
	add r0, r0, #4
	cmp r0, #3
	bhi _021E5CBE
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E5C6A: ; jump table
	.short _021E5CCC - _021E5C6A - 2 ; case 0
	.short _021E5C88 - _021E5C6A - 2 ; case 1
	.short _021E5C72 - _021E5C6A - 2 ; case 2
	.short _021E5CCC - _021E5C6A - 2 ; case 3
_021E5C72:
	ldr r0, _021E5D8C ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	bl ov67_021E6BB8
	ldr r0, _021E5D90 ; =0x0000049C
	mov r1, #6
	str r1, [r4, r0]
	mov r0, #5
	pop {r4, pc}
_021E5C88:
	ldr r0, _021E5D94 ; =0x000005DC
	bl PlaySE
	ldr r0, _021E5D98 ; =0x000004A8
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _021E5CA8
	add r0, r4, #0
	mov r1, #2
	bl ov67_021E6B6C
	ldr r0, _021E5D90 ; =0x0000049C
	mov r1, #4
	str r1, [r4, r0]
	mov r0, #5
	pop {r4, pc}
_021E5CA8:
	cmp r0, #2
	bne _021E5CCC
	add r0, r4, #0
	mov r1, #3
	bl ov67_021E6B6C
	ldr r0, _021E5D90 ; =0x0000049C
	mov r1, #4
	str r1, [r4, r0]
	mov r0, #5
	pop {r4, pc}
_021E5CBE:
	bl System_GetTouchNew
	cmp r0, #1
	bne _021E5CCC
	ldr r0, _021E5D94 ; =0x000005DC
	bl PlaySE
_021E5CCC:
	ldr r0, _021E5D9C ; =ov67_021E6D50
	bl sub_02025224
	cmp r0, #0
	beq _021E5CDC
	cmp r0, #1
	beq _021E5D30
	b _021E5D84
_021E5CDC:
	mov r0, #0x4a
	lsl r0, r0, #4
	ldrh r1, [r4, r0]
	cmp r1, #0
	beq _021E5CEA
	sub r1, r1, #1
	b _021E5CEC
_021E5CEA:
	mov r1, #2
_021E5CEC:
	strh r1, [r4, r0]
	mov r0, #0x5e
	lsl r0, r0, #4
	bl PlaySE
	add r0, r4, #0
	bl ov67_021E6490
	ldr r0, _021E5D88 ; =0x000004A4
	ldr r0, [r4, r0]
	bl sub_02019F74
	mov r1, #0x4a
	lsl r1, r1, #4
	ldrh r2, [r4, r1]
	mov r1, #0xc
	add r3, r0, #0
	mul r1, r2
	add r0, r4, #0
	add r1, r1, r3
	bl ov67_021E6688
	add r0, r4, #0
	bl ov67_021E6530
	add r0, r4, #0
	mov r1, #2
	bl ov67_021E6B6C
	ldr r0, _021E5D90 ; =0x0000049C
	mov r1, #4
	str r1, [r4, r0]
	mov r0, #5
	pop {r4, pc}
_021E5D30:
	mov r0, #0x4a
	lsl r0, r0, #4
	ldrh r1, [r4, r0]
	cmp r1, #2
	bhs _021E5D3E
	add r1, r1, #1
	b _021E5D40
_021E5D3E:
	mov r1, #0
_021E5D40:
	strh r1, [r4, r0]
	mov r0, #0x5e
	lsl r0, r0, #4
	bl PlaySE
	add r0, r4, #0
	bl ov67_021E6490
	ldr r0, _021E5D88 ; =0x000004A4
	ldr r0, [r4, r0]
	bl sub_02019F74
	mov r1, #0x4a
	lsl r1, r1, #4
	ldrh r2, [r4, r1]
	mov r1, #0xc
	add r3, r0, #0
	mul r1, r2
	add r0, r4, #0
	add r1, r1, r3
	bl ov67_021E6688
	add r0, r4, #0
	bl ov67_021E6530
	add r0, r4, #0
	mov r1, #3
	bl ov67_021E6B6C
	ldr r0, _021E5D90 ; =0x0000049C
	mov r1, #4
	str r1, [r4, r0]
	mov r0, #5
	pop {r4, pc}
_021E5D84:
	mov r0, #4
	pop {r4, pc}
	.balign 4, 0
_021E5D88: .word 0x000004A4
_021E5D8C: .word 0x000005DD
_021E5D90: .word 0x0000049C
_021E5D94: .word 0x000005DC
_021E5D98: .word 0x000004A8
_021E5D9C: .word ov67_021E6D50
	thumb_func_end ov67_021E5C44

	thumb_func_start ov67_021E5DA0
ov67_021E5DA0: ; 0x021E5DA0
	push {r3, r4, r5, lr}
	sub sp, #0x80
	add r4, r0, #0
	ldr r0, [r4]
	bl BgConfig_Alloc
	add r3, sp, #0x70
	ldr r5, _021E5E70 ; =ov67_021E6D5C
	str r0, [r4, #0x10]
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _021E5E74 ; =ov67_021E6DA8
	add r3, sp, #0x54
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
	ldr r0, [r4, #0x10]
	add r3, r1, #0
	bl InitBgFromTemplate
	mov r0, #0
	ldr r3, [r4]
	mov r1, #0x20
	add r2, r0, #0
	bl BG_ClearCharDataRange
	ldr r0, [r4, #0x10]
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E5E78 ; =ov67_021E6DFC
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
	ldr r0, [r4, #0x10]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r5, _021E5E7C ; =ov67_021E6DC4
	add r3, sp, #0x1c
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
	ldr r0, [r4, #0x10]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r3, [r4]
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	ldr r0, [r4, #0x10]
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E5E80 ; =ov67_021E6DE0
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #5
	str r0, [r3]
	ldr r0, [r4, #0x10]
	mov r3, #0
	bl InitBgFromTemplate
	add sp, #0x80
	pop {r3, r4, r5, pc}
	nop
_021E5E70: .word ov67_021E6D5C
_021E5E74: .word ov67_021E6DA8
_021E5E78: .word ov67_021E6DFC
_021E5E7C: .word ov67_021E6DC4
_021E5E80: .word ov67_021E6DE0
	thumb_func_end ov67_021E5DA0

	thumb_func_start ov67_021E5E84
ov67_021E5E84: ; 0x021E5E84
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	mov r1, #5
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x10]
	mov r1, #4
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x10]
	mov r1, #0
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x10]
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov67_021E5E84

	thumb_func_start ov67_021E5EB0
ov67_021E5EB0: ; 0x021E5EB0
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldrh r0, [r4, #8]
	cmp r0, #0
	bne _021E5F68
	ldr r1, [r4]
	mov r0, #0x76
	bl NARC_ctor
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	ldr r1, [r4]
	add r5, r0, #0
	str r1, [sp, #0xc]
	ldr r2, [r4, #0x10]
	mov r1, #4
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0x20
	str r0, [sp]
	ldr r0, [r4]
	mov r2, #0
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #7
	add r3, r2, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	ldr r0, [r4]
	mov r1, #6
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x10]
	add r0, r5, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add r0, r5, #0
	bl NARC_dtor
	ldr r1, [r4]
	mov r0, #0xb7
	bl NARC_ctor
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	ldr r1, [r4]
	mov r3, #5
	str r1, [sp, #0xc]
	ldr r2, [r4, #0x10]
	mov r1, #0x8e
	add r5, r0, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0x20
	str r0, [sp]
	ldr r0, [r4]
	mov r1, #0xc4
	str r0, [sp, #4]
	add r0, r5, #0
	mov r2, #4
	mov r3, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r4]
	mov r1, #0x8d
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x10]
	add r0, r5, #0
	mov r3, #5
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add r0, r5, #0
	bl NARC_dtor
	add sp, #0x10
	pop {r3, r4, r5, pc}
_021E5F68:
	ldr r1, [r4]
	mov r0, #0x76
	bl NARC_ctor
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	ldr r1, [r4]
	add r5, r0, #0
	str r1, [sp, #0xc]
	ldr r2, [r4, #0x10]
	mov r1, #4
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0x20
	str r0, [sp]
	ldr r0, [r4]
	mov r2, #0
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #7
	add r3, r2, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	ldr r0, [r4]
	mov r1, #5
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x10]
	add r0, r5, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r4]
	mov r1, #8
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x10]
	add r0, r5, #0
	mov r3, #5
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0x20
	str r0, [sp]
	ldr r0, [r4]
	mov r1, #0xa
	str r0, [sp, #4]
	add r0, r5, #0
	mov r2, #4
	mov r3, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r4]
	mov r1, #9
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x10]
	add r0, r5, #0
	mov r3, #5
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add r0, r5, #0
	bl NARC_dtor
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov67_021E5EB0

	thumb_func_start ov67_021E6008
ov67_021E6008: ; 0x021E6008
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldrh r0, [r6, #8]
	cmp r0, #0
	bne _021E6030
	add r5, r6, #0
	ldr r4, _021E6078 ; =ov67_021E6E98
	mov r7, #0
	add r5, #0x6c
_021E601A:
	ldr r0, [r6, #0x10]
	add r1, r5, #0
	add r2, r4, #0
	bl AddWindow
	add r7, r7, #1
	add r4, #8
	add r5, #0x10
	cmp r7, #0xa
	blt _021E601A
	b _021E6054
_021E6030:
	add r5, r6, #0
	ldr r4, _021E607C ; =ov67_021E7020
	mov r7, #0
	add r5, #0x6c
_021E6038:
	ldr r0, [r6, #0x10]
	add r1, r5, #0
	add r2, r4, #0
	bl AddWindow
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r7, r7, #1
	add r4, #8
	add r5, #0x10
	cmp r7, #0x23
	blt _021E6038
_021E6054:
	ldr r1, [r6]
	mov r0, #4
	bl FontID_Alloc
	mov r1, #0x1e
	ldr r2, [r6]
	mov r0, #0
	lsl r1, r1, #4
	bl LoadFontPal0
	mov r1, #0x1e
	ldr r2, [r6]
	mov r0, #4
	lsl r1, r1, #4
	bl LoadFontPal0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6078: .word ov67_021E6E98
_021E607C: .word ov67_021E7020
	thumb_func_end ov67_021E6008

	thumb_func_start ov67_021E6080
ov67_021E6080: ; 0x021E6080
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #4
	bl FontID_Release
	ldrh r0, [r5, #8]
	cmp r0, #0
	bne _021E6094
	mov r6, #0xa
	b _021E6096
_021E6094:
	mov r6, #0x23
_021E6096:
	mov r4, #0
	cmp r6, #0
	ble _021E60B2
	add r5, #0x6c
_021E609E:
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, r6
	blt _021E609E
_021E60B2:
	pop {r4, r5, r6, pc}
	thumb_func_end ov67_021E6080

	thumb_func_start ov67_021E60B4
ov67_021E60B4: ; 0x021E60B4
	push {r4, lr}
	add r4, r0, #0
	ldr r3, [r4]
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0x1c
	bl NewMsgDataFromNarc
	str r0, [r4, #0x28]
	ldr r2, [r4]
	mov r0, #2
	mov r1, #0x40
	bl ScrStrBufs_new_custom
	str r0, [r4, #0x2c]
	mov r0, #2
	ldr r1, [r4]
	lsl r0, r0, #8
	bl String_ctor
	str r0, [r4, #0x30]
	ldr r0, [r4, #0x28]
	mov r1, #0x21
	bl NewString_ReadMsgData
	str r0, [r4, #0x64]
	ldr r0, [r4, #0x28]
	mov r1, #0x22
	bl NewString_ReadMsgData
	str r0, [r4, #0x68]
	pop {r4, pc}
	thumb_func_end ov67_021E60B4

	thumb_func_start ov67_021E60F4
ov67_021E60F4: ; 0x021E60F4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x68]
	bl String_dtor
	ldr r0, [r4, #0x64]
	bl String_dtor
	ldr r0, [r4, #0x30]
	bl String_dtor
	ldr r0, [r4, #0x2c]
	bl ScrStrBufs_delete
	ldr r0, [r4, #0x28]
	bl DestroyMsgData
	pop {r4, pc}
	thumb_func_end ov67_021E60F4

	thumb_func_start ov67_021E6118
ov67_021E6118: ; 0x021E6118
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r0, #0
	ldr r0, [sp, #0x30]
	add r7, r1, #0
	add r5, r2, #0
	add r4, r3, #0
	cmp r0, #1
	bne _021E6136
	ldr r0, [sp, #0x28]
	mov r2, #0
	bl FontID_String_GetWidth
	sub r5, r5, r0
	b _021E6146
_021E6136:
	cmp r0, #2
	bne _021E6146
	ldr r0, [sp, #0x28]
	mov r2, #0
	bl FontID_String_GetWidth
	lsr r0, r0, #1
	sub r5, r5, r0
_021E6146:
	str r4, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x28]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, r6, #0
	add r2, r7, #0
	add r3, r5, #0
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov67_021E6118

	thumb_func_start ov67_021E6164
ov67_021E6164: ; 0x021E6164
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5, #0x28]
	add r4, r1, #0
	add r1, r2, #0
	add r7, r3, #0
	bl NewString_ReadMsgData
	add r6, r0, #0
	ldr r0, [sp, #0x24]
	add r5, #0x6c
	str r0, [sp]
	ldr r0, [sp, #0x28]
	ldr r3, [sp, #0x20]
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	add r1, r6, #0
	str r0, [sp, #8]
	lsl r0, r4, #4
	add r0, r5, r0
	add r2, r7, #0
	bl ov67_021E6118
	add r0, r6, #0
	bl String_dtor
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov67_021E6164

	thumb_func_start ov67_021E61A0
ov67_021E61A0: ; 0x021E61A0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5, #0x28]
	add r4, r1, #0
	add r1, r2, #0
	add r6, r3, #0
	bl NewString_ReadMsgData
	add r7, r0, #0
	ldr r0, [r5, #0x2c]
	ldr r1, [r5, #0x30]
	add r2, r7, #0
	bl StringExpandPlaceholders
	ldr r0, [sp, #0x24]
	add r1, r5, #0
	str r0, [sp]
	ldr r0, [sp, #0x28]
	add r1, #0x6c
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	ldr r3, [sp, #0x20]
	str r0, [sp, #8]
	lsl r0, r4, #4
	add r0, r1, r0
	ldr r1, [r5, #0x30]
	add r2, r6, #0
	bl ov67_021E6118
	add r0, r7, #0
	bl String_dtor
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov67_021E61A0

	thumb_func_start ov67_021E61E8
ov67_021E61E8: ; 0x021E61E8
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r0, #0x6c
	bl GetWindowWidth
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _021E621C ; =0x000F0100
	mov r2, #0x18
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r4, #0
	lsl r4, r3, #3
	lsr r3, r4, #0x1f
	add r3, r4, r3
	asr r3, r3, #1
	bl ov67_021E6164
	add sp, #0x10
	pop {r4, pc}
	nop
_021E621C: .word 0x000F0100
	thumb_func_end ov67_021E61E8

	thumb_func_start ov67_021E6220
ov67_021E6220: ; 0x021E6220
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r6, #0
	add r4, r5, #0
	add r4, #0x6c
	add r7, r6, #0
_021E622E:
	add r0, r4, #0
	add r1, r7, #0
	bl FillWindowPixelBuffer
	add r6, r6, #1
	add r4, #0x10
	cmp r6, #0xa
	blo _021E622E
	add r0, r5, #0
	bl ov67_021E61E8
	add r0, r5, #0
	add r0, #0x7c
	bl GetWindowWidth
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	lsl r4, r3, #3
	str r0, [sp, #4]
	ldr r0, _021E63E0 ; =0x000F0200
	lsr r3, r4, #0x1f
	add r3, r4, r3
	str r0, [sp, #8]
	mov r2, #2
	add r0, r5, #0
	mov r1, #1
	asr r3, r3, #1
	str r2, [sp, #0xc]
	bl ov67_021E6164
	mov r3, #0
	str r3, [sp]
	ldr r0, _021E63E4 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #2
	mov r2, #5
	str r3, [sp, #0xc]
	bl ov67_021E6164
	mov r3, #0
	str r3, [sp]
	ldr r0, _021E63E4 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #3
	mov r2, #8
	str r3, [sp, #0xc]
	bl ov67_021E6164
	mov r3, #0
	str r3, [sp]
	ldr r0, _021E63E4 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	add r0, r5, #0
	mov r1, #4
	mov r2, #0xc
	bl ov67_021E6164
	ldr r0, [r5, #0x20]
	mov r1, #0xc
	mov r2, #0
	bl sub_0202D5DC
	cmp r0, #0
	ldr r0, _021E63E4 ; =0x00010200
	bne _021E62D4
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #6
	mov r2, #9
	str r3, [sp, #0xc]
	bl ov67_021E6164
	b _021E62E8
_021E62D4:
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #6
	mov r2, #0xa
	str r3, [sp, #0xc]
	bl ov67_021E6164
_021E62E8:
	mov r3, #0
	str r3, [sp]
	ldr r0, _021E63E4 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	add r0, r5, #0
	mov r1, #8
	mov r2, #0xb
	bl ov67_021E6164
	ldr r0, [r5, #0x20]
	mov r1, #0
	bl sub_0202D488
	mov r1, #0
	add r2, r0, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #0x2c]
	mov r3, #2
	bl BufferIntegerAsString
	add r0, r5, #0
	add r0, #0xbc
	bl GetWindowWidth
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E63E4 ; =0x00010200
	mov r1, #5
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r2, #0xe
	lsl r3, r3, #3
	bl ov67_021E61A0
	ldr r0, [r5, #0x1c]
	mov r1, #9
	mov r2, #0xff
	bl sub_020310BC
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r5, #0x2c]
	mov r1, #0
	mov r3, #4
	bl BufferIntegerAsString
	add r0, r5, #0
	add r0, #0xdc
	bl GetWindowWidth
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E63E4 ; =0x00010200
	lsl r4, r3, #3
	lsr r3, r4, #0x1f
	str r0, [sp, #8]
	mov r0, #2
	add r3, r4, r3
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r1, #7
	mov r2, #0xf
	asr r3, r3, #1
	bl ov67_021E61A0
	ldr r0, [r5, #0x1c]
	mov r1, #8
	mov r2, #0xff
	bl sub_020310BC
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r5, #0x2c]
	mov r1, #0
	mov r3, #4
	bl BufferIntegerAsString
	add r0, r5, #0
	add r0, #0xfc
	bl GetWindowWidth
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E63E4 ; =0x00010200
	lsl r4, r3, #3
	lsr r3, r4, #0x1f
	str r0, [sp, #8]
	mov r0, #2
	add r3, r4, r3
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r1, #9
	mov r2, #0xf
	asr r3, r3, #1
	bl ov67_021E61A0
	mov r4, #0
	add r5, #0x6c
_021E63CC:
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #0xa
	blo _021E63CC
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E63E0: .word 0x000F0200
_021E63E4: .word 0x00010200
	thumb_func_end ov67_021E6220

	thumb_func_start ov67_021E63E8
ov67_021E63E8: ; 0x021E63E8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r0, #0
	ldr r0, [r7, #0x24]
	ldr r1, [r7]
	bl sub_0202D8E4
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp]
	mov r0, #0xa7
	ldr r5, [sp, #4]
	lsl r0, r0, #2
	add r4, r7, r0
	add r6, r5, #0
_021E6406:
	add r0, r5, #0
	add r0, #0x20
	ldrb r0, [r0]
	add r1, r4, #0
	add r1, #8
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	strb r0, [r4, #4]
	ldrb r0, [r5, #0x12]
	mov r2, #8
	strb r0, [r4, #5]
	ldrb r0, [r5, #0x13]
	strb r0, [r4, #6]
	add r0, r5, #0
	add r0, #0x20
	ldrb r0, [r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	strb r0, [r4, #7]
	add r0, r5, #0
	add r0, #0x18
	bl MI_CpuCopy8
	ldr r1, [r7]
	mov r0, #8
	bl String_ctor
	str r0, [r4]
	ldrb r0, [r4, #7]
	cmp r0, #0
	ldr r0, [r4]
	beq _021E6454
	ldrb r1, [r4, #4]
	lsl r1, r1, #2
	add r1, r7, r1
	ldr r1, [r1, #0x64]
	bl StringCopy
	b _021E645A
_021E6454:
	add r1, r6, #0
	bl CopyU16ArrayToString
_021E645A:
	ldr r0, [sp]
	add r4, #0x10
	add r0, r0, #1
	add r5, #0x22
	add r6, #0x22
	str r0, [sp]
	cmp r0, #0x1e
	blt _021E6406
	ldr r0, [sp, #4]
	bl FreeToHeap
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov67_021E63E8

	thumb_func_start ov67_021E6474
ov67_021E6474: ; 0x021E6474
	push {r4, r5, r6, lr}
	mov r6, #0xa7
	add r5, r0, #0
	mov r4, #0
	lsl r6, r6, #2
_021E647E:
	ldr r0, [r5, r6]
	bl String_dtor
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #0x1e
	blt _021E647E
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov67_021E6474

	thumb_func_start ov67_021E6490
ov67_021E6490: ; 0x021E6490
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r1, _021E6528 ; =0x000004A2
	str r0, [sp, #0xc]
	ldrb r0, [r0, r1]
	cmp r0, #0
	bne _021E64A6
	mov r1, #0x47
	lsl r1, r1, #2
	ldr r0, [sp, #0xc]
	b _021E64AC
_021E64A6:
	mov r1, #0x77
	ldr r0, [sp, #0xc]
	lsl r1, r1, #2
_021E64AC:
	add r5, r0, r1
	mov r1, #0x4a
	ldr r0, [sp, #0xc]
	lsl r1, r1, #4
	ldrh r1, [r0, r1]
	mov r0, #0xc
	mov r6, #0
	mul r0, r1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_021E64C0:
	lsl r7, r6, #4
	add r0, r5, r7
	mov r1, #0
	bl FillWindowPixelBuffer
	cmp r4, #0x1e
	bhs _021E64FE
	ldr r0, [sp, #0xc]
	lsl r1, r4, #4
	add r1, r0, r1
	mov r0, #0x2a
	lsl r0, r0, #4
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _021E64E2
	ldr r2, _021E652C ; =0x00070800
	b _021E64E6
_021E64E2:
	mov r2, #0xc1
	lsl r2, r2, #0xa
_021E64E6:
	mov r0, #0
	str r0, [sp]
	str r2, [sp, #4]
	mov r2, #0xa7
	str r0, [sp, #8]
	lsl r2, r2, #2
	ldr r1, [r1, r2]
	mov r2, #0
	add r0, r5, r7
	add r3, r2, #0
	bl ov67_021E6118
_021E64FE:
	add r0, r5, r7
	bl ScheduleWindowCopyToVram
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	add r0, r6, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	cmp r6, #0xc
	blo _021E64C0
	ldr r1, _021E6528 ; =0x000004A2
	ldr r0, [sp, #0xc]
	ldrb r2, [r0, r1]
	mov r0, #1
	eor r2, r0
	ldr r0, [sp, #0xc]
	strb r2, [r0, r1]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6528: .word 0x000004A2
_021E652C: .word 0x00070800
	thumb_func_end ov67_021E6490

	thumb_func_start ov67_021E6530
ov67_021E6530: ; 0x021E6530
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r0, #0xac
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r1, #0
	mov r2, #0x4a
	str r1, [sp]
	mov r3, #1
	str r3, [sp, #4]
	lsl r2, r2, #4
	ldrh r2, [r4, r2]
	ldr r0, [r4, #0x2c]
	add r2, r2, #1
	bl BufferIntegerAsString
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E65BC ; =0x00010200
	mov r1, #4
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r2, #0x14
	mov r3, #8
	bl ov67_021E61A0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E65BC ; =0x00010200
	mov r1, #4
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r2, #0x15
	mov r3, #0x10
	bl ov67_021E6164
	mov r1, #0
	str r1, [sp]
	mov r3, #1
	str r3, [sp, #4]
	ldr r0, [r4, #0x2c]
	mov r2, #3
	bl BufferIntegerAsString
	mov r1, #0
	str r1, [sp]
	ldr r0, _021E65BC ; =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r4, #0
	mov r1, #4
	mov r2, #0x14
	mov r3, #0x18
	bl ov67_021E61A0
	add r4, #0xac
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_021E65BC: .word 0x00010200
	thumb_func_end ov67_021E6530

	thumb_func_start ov67_021E65C0
ov67_021E65C0: ; 0x021E65C0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r6, r0, #0
	mov r4, #0
	add r5, r6, #0
	add r5, #0x6c
	add r7, r4, #0
_021E65CE:
	add r0, r5, #0
	add r1, r7, #0
	bl FillWindowPixelBuffer
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #3
	bls _021E65CE
	add r0, r6, #0
	bl ov67_021E61E8
	ldr r0, [r6, #0x24]
	add r1, sp, #0x10
	bl sub_0202D8D0
	mov r1, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r2, sp, #0x10
	ldrb r2, [r2]
	ldr r0, [r6, #0x2c]
	mov r3, #2
	bl BufferIntegerAsString
	mov r3, #0
	str r3, [sp]
	ldr r0, _021E6684 ; =0x000F0200
	str r3, [sp, #4]
	str r0, [sp, #8]
	add r0, r6, #0
	mov r1, #1
	mov r2, #0x11
	str r3, [sp, #0xc]
	bl ov67_021E61A0
	mov r0, #2
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	add r2, sp, #0x10
	ldrb r2, [r2, #1]
	ldr r0, [r6, #0x2c]
	mov r3, #3
	bl BufferIntegerAsString
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6684 ; =0x000F0200
	mov r1, #2
	str r0, [sp, #8]
	add r0, r6, #0
	mov r2, #0x12
	mov r3, #0x3c
	str r1, [sp, #0xc]
	bl ov67_021E61A0
	mov r3, #0
	str r3, [sp]
	ldr r0, _021E6684 ; =0x000F0200
	str r3, [sp, #4]
	str r0, [sp, #8]
	add r0, r6, #0
	mov r1, #3
	mov r2, #0x13
	str r3, [sp, #0xc]
	bl ov67_021E6164
	add r4, r6, #0
	mov r5, #0
	add r4, #0x6c
_021E665E:
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add r5, r5, #1
	add r4, #0x10
	cmp r5, #3
	bls _021E665E
	add r0, r6, #0
	bl ov67_021E6490
	add r0, r6, #0
	mov r1, #0
	bl ov67_021E6688
	add r0, r6, #0
	bl ov67_021E6530
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E6684: .word 0x000F0200
	thumb_func_end ov67_021E65C0

	thumb_func_start ov67_021E6688
ov67_021E6688: ; 0x021E6688
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r6, r0, #0
	ldr r0, _021E680C ; =0x000004A3
	str r1, [sp, #0x10]
	ldrb r0, [r6, r0]
	cmp r0, #0
	bne _021E669C
	mov r7, #5
	b _021E669E
_021E669C:
	mov r7, #8
_021E669E:
	add r1, r6, #0
	add r1, #0x6c
	lsl r0, r7, #4
	add r4, r1, r0
	mov r5, #0
_021E66A8:
	lsl r0, r5, #4
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #3
	blo _021E66A8
	ldr r0, [sp, #0x10]
	cmp r0, #0x1e
	blo _021E66C4
	b _021E67E8
_021E66C4:
	mov r2, #0x2a
	lsl r2, r2, #4
	lsl r5, r0, #4
	add r0, r6, r2
	str r0, [sp, #0x14]
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	add r3, r6, r5
	sub r2, r2, #4
	ldr r2, [r3, r2]
	ldr r3, [sp, #0x14]
	ldr r0, [r6, #0x2c]
	ldrb r3, [r3, r5]
	mov r1, #0
	bl BufferString
	ldr r0, [sp, #0x14]
	ldrb r0, [r0, r5]
	cmp r0, #0
	ldr r0, _021E6810 ; =0x00010200
	bne _021E6708
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r0, [sp, #8]
	add r0, r6, #0
	add r1, r7, #0
	mov r2, #0x16
	str r3, [sp, #0xc]
	bl ov67_021E61A0
	b _021E671C
_021E6708:
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r0, [sp, #8]
	add r0, r6, #0
	add r1, r7, #0
	mov r2, #0x17
	str r3, [sp, #0xc]
	bl ov67_021E61A0
_021E671C:
	mov r3, #0
	str r3, [sp]
	ldr r0, _021E6810 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	add r0, r6, #0
	add r1, r7, #1
	mov r2, #0x1c
	str r3, [sp, #0xc]
	bl ov67_021E6164
	ldr r0, _021E6814 ; =0x000002A1
	add r0, r6, r0
	ldrb r2, [r0, r5]
	str r0, [sp, #0x18]
	cmp r2, #0
	bne _021E6758
	mov r0, #0x10
	str r0, [sp]
	mov r3, #0
	ldr r0, _021E6810 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	add r0, r6, #0
	add r1, r7, #1
	mov r2, #0x1f
	str r3, [sp, #0xc]
	bl ov67_021E6164
	b _021E6778
_021E6758:
	ldr r0, [r6, #0x2c]
	mov r1, #0
	bl BufferCountryName
	mov r0, #0x10
	str r0, [sp]
	mov r3, #0
	ldr r0, _021E6810 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	add r0, r6, #0
	add r1, r7, #1
	mov r2, #0x1d
	str r3, [sp, #0xc]
	bl ov67_021E61A0
_021E6778:
	ldr r0, _021E6818 ; =0x000002A2
	add r1, r6, r5
	ldrb r3, [r1, r0]
	cmp r3, #0
	beq _021E67A6
	ldr r2, [sp, #0x18]
	ldr r0, [r6, #0x2c]
	ldrb r2, [r2, r5]
	mov r1, #0
	bl BufferCityName
	mov r0, #0x20
	str r0, [sp]
	mov r3, #0
	ldr r0, _021E6810 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	add r0, r6, #0
	add r1, r7, #1
	mov r2, #0x1e
	str r3, [sp, #0xc]
	bl ov67_021E61A0
_021E67A6:
	mov r3, #0
	str r3, [sp]
	ldr r0, _021E6810 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	add r0, r6, #0
	add r1, r7, #2
	mov r2, #0x20
	str r3, [sp, #0xc]
	bl ov67_021E6164
	mov r0, #0xa9
	lsl r0, r0, #2
	add r0, r6, r0
	ldr r1, [r6]
	add r0, r0, r5
	bl MailMsg_GetExpandedString
	add r5, r0, #0
	mov r2, #0
	ldr r0, _021E6810 ; =0x00010200
	str r2, [sp]
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x20
	add r1, r5, #0
	mov r3, #0x10
	str r2, [sp, #8]
	bl ov67_021E6118
	add r0, r5, #0
	bl String_dtor
_021E67E8:
	mov r5, #0
_021E67EA:
	lsl r0, r5, #4
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #3
	blo _021E67EA
	ldr r1, _021E680C ; =0x000004A3
	mov r0, #1
	ldrb r2, [r6, r1]
	eor r0, r2
	strb r0, [r6, r1]
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_021E680C: .word 0x000004A3
_021E6810: .word 0x00010200
_021E6814: .word 0x000002A1
_021E6818: .word 0x000002A2
	thumb_func_end ov67_021E6688

	thumb_func_start ov67_021E681C
ov67_021E681C: ; 0x021E681C
	bx lr
	.balign 4, 0
	thumb_func_end ov67_021E681C

	thumb_func_start ov67_021E6820
ov67_021E6820: ; 0x021E6820
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	add r5, r0, #0
	ldr r0, [r5]
	bl sub_0200CF18
	ldr r1, _021E6974 ; =0x0000047C
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	bl sub_0200CF38
	mov r7, #0x12
	lsl r7, r7, #6
	add r2, sp, #0x3c
	ldr r3, _021E6978 ; =ov67_021E6E18
	str r0, [r5, r7]
	ldmia r3!, {r0, r1}
	add r6, r2, #0
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	ldr r4, _021E697C ; =ov67_021E6D7C
	stmia r2!, {r0, r1}
	add r3, sp, #0x28
	ldmia r4!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	add r1, r6, #0
	str r0, [r3]
	sub r0, r7, #4
	ldr r0, [r5, r0]
	mov r3, #0x20
	bl sub_0200CF70
	sub r1, r7, #4
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #4
	bl sub_0200CFF4
	ldr r4, _021E6980 ; =ov67_021E6D90
	add r3, sp, #0x10
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r1, r7, #4
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl sub_0200D3F8
	sub r0, r7, #4
	ldr r0, [r5, r0]
	bl sub_0200CF6C
	mov r2, #2
	mov r1, #0
	lsl r2, r2, #0x14
	bl G2dRenderer_SetSubSurfaceCoords
	ldr r1, [r5]
	mov r0, #0x76
	bl NARC_ctor
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6984 ; =0x0000D158
	sub r1, r7, #4
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r4, #0
	mov r3, #0
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, _021E6984 ; =0x0000D158
	sub r1, r7, #4
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r4, #0
	mov r3, #3
	bl sub_0200D5D4
	mov r3, #1
	ldr r0, _021E6984 ; =0x0000D158
	str r3, [sp]
	sub r1, r7, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r4, #0
	bl sub_0200D6EC
	mov r0, #1
	str r0, [sp]
	ldr r0, _021E6984 ; =0x0000D158
	sub r1, r7, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r4, #0
	mov r3, #2
	bl sub_0200D71C
	add r0, r4, #0
	bl NARC_dtor
	ldr r6, _021E6988 ; =ov67_021E6F50
	mov r7, #0
	add r4, r5, #0
_021E692C:
	ldr r0, _021E6974 ; =0x0000047C
	mov r1, #0x12
	lsl r1, r1, #6
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r6, #0
	bl sub_0200D734
	ldr r1, _021E698C ; =0x00000484
	add r7, r7, #1
	str r0, [r4, r1]
	add r6, #0x34
	add r4, r4, #4
	cmp r7, #4
	blo _021E692C
	ldrh r0, [r5, #8]
	cmp r0, #0
	bne _021E6968
	add r0, r1, #0
	add r0, #8
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_0200DCE8
	mov r0, #0x49
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_0200DCE8
_021E6968:
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E6974: .word 0x0000047C
_021E6978: .word ov67_021E6E18
_021E697C: .word ov67_021E6D7C
_021E6980: .word ov67_021E6D90
_021E6984: .word 0x0000D158
_021E6988: .word ov67_021E6F50
_021E698C: .word 0x00000484
	thumb_func_end ov67_021E6820

	thumb_func_start ov67_021E6990
ov67_021E6990: ; 0x021E6990
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	ldr r7, _021E69D0 ; =0x00000484
	str r0, [sp]
	add r5, r0, #0
	add r6, r4, #0
_021E699C:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _021E69AA
	bl sub_0200D9DC
	ldr r0, _021E69D0 ; =0x00000484
	str r6, [r5, r0]
_021E69AA:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blo _021E699C
	ldr r1, _021E69D4 ; =0x0000047C
	ldr r0, [sp]
	add r2, r1, #4
	ldr r0, [r0, r1]
	ldr r1, [sp]
	ldr r1, [r1, r2]
	bl sub_0200D998
	ldr r1, _021E69D4 ; =0x0000047C
	ldr r0, [sp]
	ldr r0, [r0, r1]
	bl sub_0200D108
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E69D0: .word 0x00000484
_021E69D4: .word 0x0000047C
	thumb_func_end ov67_021E6990

	thumb_func_start ov67_021E69D8
ov67_021E69D8: ; 0x021E69D8
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r6, _021E69FC ; =0x00000484
	mov r4, #0
	add r5, r7, #0
_021E69E2:
	ldr r0, [r5, r6]
	bl sub_0200DC18
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blo _021E69E2
	mov r0, #0x12
	lsl r0, r0, #6
	ldr r0, [r7, r0]
	bl sub_0200D020
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E69FC: .word 0x00000484
	thumb_func_end ov67_021E69D8

	thumb_func_start ov67_021E6A00
ov67_021E6A00: ; 0x021E6A00
	ldr r3, _021E6A04 ; =sub_0200D034
	bx r3
	.balign 4, 0
_021E6A04: .word sub_0200D034
	thumb_func_end ov67_021E6A00

	thumb_func_start ov67_021E6A08
ov67_021E6A08: ; 0x021E6A08
	push {r4, r5, r6, lr}
	add r6, r2, #0
	ldr r2, _021E6A24 ; =0x00000484
	lsl r4, r1, #2
	add r5, r0, r2
	ldr r0, [r5, r4]
	mov r1, #0
	bl sub_0200DCC0
	ldr r0, [r5, r4]
	add r1, r6, #0
	bl sub_0200DC4C
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E6A24: .word 0x00000484
	thumb_func_end ov67_021E6A08

	thumb_func_start ov67_021E6A28
ov67_021E6A28: ; 0x021E6A28
	lsl r1, r1, #2
	add r1, r0, r1
	ldr r0, _021E6A38 ; =0x00000484
	ldr r0, [r1, r0]
	add r1, r2, #0
	add r2, r3, #0
	ldr r3, _021E6A3C ; =sub_0200DDB8
	bx r3
	.balign 4, 0
_021E6A38: .word 0x00000484
_021E6A3C: .word sub_0200DDB8
	thumb_func_end ov67_021E6A28

	thumb_func_start ov67_021E6A40
ov67_021E6A40: ; 0x021E6A40
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r3, _021E6B60 ; =0x00000496
	add r4, r0, #0
	ldrb r0, [r4, r3]
	cmp r0, #0
	beq _021E6A58
	cmp r0, #1
	beq _021E6AC2
	cmp r0, #2
	beq _021E6B44
	b _021E6B5A
_021E6A58:
	sub r0, r3, #2
	ldrb r0, [r4, r0]
	lsl r1, r0, #0x1f
	lsr r1, r1, #0x1f
	bne _021E6A7E
	lsl r0, r0, #0x18
	lsr r0, r0, #0x19
	lsl r0, r0, #2
	add r1, r4, r0
	add r0, r3, #0
	sub r0, #0x12
	ldr r0, [r1, r0]
	sub r1, r3, #1
	ldrb r1, [r4, r1]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	bl sub_0200DD10
	b _021E6AB8
_021E6A7E:
	add r0, r3, #4
	ldrb r0, [r4, r0]
	sub r1, r3, #2
	add r2, r3, #2
	str r0, [sp]
	add r0, r3, #5
	ldrb r0, [r4, r0]
	str r0, [sp, #4]
	sub r0, r3, #1
	ldrb r0, [r4, r0]
	add r3, r3, #3
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	str r0, [sp, #8]
	ldrb r1, [r4, r1]
	ldrb r2, [r4, r2]
	ldrb r3, [r4, r3]
	lsl r1, r1, #0x18
	ldr r0, [r4, #0x10]
	lsr r1, r1, #0x19
	bl BgTilemapRectChangePalette
	ldr r1, _021E6B64 ; =0x00000494
	ldr r0, [r4, #0x10]
	ldrb r1, [r4, r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x19
	bl ScheduleBgTilemapBufferTransfer
_021E6AB8:
	ldr r0, _021E6B60 ; =0x00000496
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _021E6B5A
_021E6AC2:
	add r0, r3, #1
	ldrb r0, [r4, r0]
	add r1, r0, #1
	add r0, r3, #1
	strb r1, [r4, r0]
	ldrb r0, [r4, r0]
	cmp r0, #4
	bne _021E6B5A
	sub r0, r3, #2
	ldrb r0, [r4, r0]
	lsl r1, r0, #0x1f
	lsr r1, r1, #0x1f
	bne _021E6AF8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x19
	lsl r0, r0, #2
	add r1, r4, r0
	add r0, r3, #0
	sub r0, #0x12
	ldr r0, [r1, r0]
	sub r1, r3, #1
	ldrb r1, [r4, r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1c
	bl sub_0200DD10
	b _021E6B32
_021E6AF8:
	add r0, r3, #4
	ldrb r0, [r4, r0]
	sub r1, r3, #2
	add r2, r3, #2
	str r0, [sp]
	add r0, r3, #5
	ldrb r0, [r4, r0]
	str r0, [sp, #4]
	sub r0, r3, #1
	ldrb r0, [r4, r0]
	add r3, r3, #3
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	str r0, [sp, #8]
	ldrb r1, [r4, r1]
	ldrb r2, [r4, r2]
	ldrb r3, [r4, r3]
	lsl r1, r1, #0x18
	ldr r0, [r4, #0x10]
	lsr r1, r1, #0x19
	bl BgTilemapRectChangePalette
	ldr r1, _021E6B64 ; =0x00000494
	ldr r0, [r4, #0x10]
	ldrb r1, [r4, r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x19
	bl ScheduleBgTilemapBufferTransfer
_021E6B32:
	ldr r0, _021E6B68 ; =0x00000497
	mov r1, #0
	strb r1, [r4, r0]
	sub r1, r0, #1
	ldrb r1, [r4, r1]
	sub r0, r0, #1
	add r1, r1, #1
	strb r1, [r4, r0]
	b _021E6B5A
_021E6B44:
	add r0, r3, #1
	ldrb r0, [r4, r0]
	add r1, r0, #1
	add r0, r3, #1
	strb r1, [r4, r0]
	ldrb r0, [r4, r0]
	cmp r0, #2
	bne _021E6B5A
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, pc}
_021E6B5A:
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_021E6B60: .word 0x00000496
_021E6B64: .word 0x00000494
_021E6B68: .word 0x00000497
	thumb_func_end ov67_021E6A40

	thumb_func_start ov67_021E6B6C
ov67_021E6B6C: ; 0x021E6B6C
	push {r3, r4}
	ldr r4, _021E6BB4 ; =0x00000494
	lsl r1, r1, #0x18
	ldrb r3, [r0, r4]
	mov r2, #1
	lsr r1, r1, #0x18
	bic r3, r2
	strb r3, [r0, r4]
	ldrb r2, [r0, r4]
	mov r3, #0xfe
	lsl r1, r1, #0x19
	bic r2, r3
	lsr r1, r1, #0x18
	orr r1, r2
	strb r1, [r0, r4]
	add r1, r4, #1
	ldrb r2, [r0, r1]
	mov r1, #0xf
	bic r2, r1
	mov r1, #1
	orr r2, r1
	add r1, r4, #1
	strb r2, [r0, r1]
	ldrb r2, [r0, r1]
	mov r1, #0xf0
	bic r2, r1
	add r1, r4, #1
	strb r2, [r0, r1]
	mov r2, #0
	add r1, r4, #2
	strb r2, [r0, r1]
	add r1, r4, #3
	strb r2, [r0, r1]
	pop {r3, r4}
	bx lr
	nop
_021E6BB4: .word 0x00000494
	thumb_func_end ov67_021E6B6C

	thumb_func_start ov67_021E6BB8
ov67_021E6BB8: ; 0x021E6BB8
	ldr r3, _021E6BC0 ; =ov67_021E6B6C
	mov r1, #1
	bx r3
	nop
_021E6BC0: .word ov67_021E6B6C
	thumb_func_end ov67_021E6BB8

	thumb_func_start ov67_021E6BC4
ov67_021E6BC4: ; 0x021E6BC4
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r1, _021E6BF4 ; =ov67_021E6EE8
	str r0, [sp, #8]
	ldr r0, _021E6BF8 ; =ov67_021E6E60
	ldr r2, _021E6BFC ; =ov67_021E6D6C
	add r3, r4, #0
	bl sub_02019BA4
	ldr r1, _021E6C00 ; =0x000004A4
	str r0, [r4, r1]
	add r0, r4, #0
	mov r1, #0
	bl ov67_021E6C14
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_021E6BF4: .word ov67_021E6EE8
_021E6BF8: .word ov67_021E6E60
_021E6BFC: .word ov67_021E6D6C
_021E6C00: .word 0x000004A4
	thumb_func_end ov67_021E6BC4

	thumb_func_start ov67_021E6C04
ov67_021E6C04: ; 0x021E6C04
	ldr r1, _021E6C0C ; =0x000004A4
	ldr r3, _021E6C10 ; =sub_02019BDC
	ldr r0, [r0, r1]
	bx r3
	.balign 4, 0
_021E6C0C: .word 0x000004A4
_021E6C10: .word sub_02019BDC
	thumb_func_end ov67_021E6C04

	thumb_func_start ov67_021E6C14
ov67_021E6C14: ; 0x021E6C14
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021E6C58 ; =0x000004A4
	add r4, r1, #0
	ldr r0, [r5, r0]
	bl sub_0201A018
	add r1, sp, #0
	add r1, #1
	add r2, sp, #0
	bl sub_02020A0C
	add r3, sp, #0
	ldrb r2, [r3, #1]
	ldrb r3, [r3]
	add r0, r5, #0
	mov r1, #0
	bl ov67_021E6A28
	cmp r4, #0xc
	bne _021E6C4A
	add r0, r5, #0
	mov r1, #0
	mov r2, #2
	bl ov67_021E6A08
	pop {r3, r4, r5, pc}
_021E6C4A:
	add r0, r5, #0
	mov r1, #0
	mov r2, #7
	bl ov67_021E6A08
	pop {r3, r4, r5, pc}
	nop
_021E6C58: .word 0x000004A4
	thumb_func_end ov67_021E6C14

	thumb_func_start ov67_021E6C5C
ov67_021E6C5C: ; 0x021E6C5C
	bx lr
	.balign 4, 0
	thumb_func_end ov67_021E6C5C

	thumb_func_start ov67_021E6C60
ov67_021E6C60: ; 0x021E6C60
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r0, _021E6D1C ; =0x000004A8
	mov r1, #0
	add r6, r2, #0
	str r1, [r5, r0]
	cmp r4, #2
	bne _021E6C76
	cmp r6, #0
	beq _021E6C8E
_021E6C76:
	cmp r4, #5
	bne _021E6C7E
	cmp r6, #3
	beq _021E6C8E
_021E6C7E:
	cmp r4, #8
	bne _021E6C86
	cmp r6, #6
	beq _021E6C8E
_021E6C86:
	cmp r4, #0xb
	bne _021E6CB2
	cmp r6, #9
	bne _021E6CB2
_021E6C8E:
	mov r0, #0x4a
	lsl r0, r0, #4
	ldrh r1, [r5, r0]
	cmp r1, #0
	beq _021E6C9C
	sub r1, r1, #1
	b _021E6C9E
_021E6C9C:
	mov r1, #2
_021E6C9E:
	strh r1, [r5, r0]
	add r0, r5, #0
	bl ov67_021E6490
	add r0, r5, #0
	bl ov67_021E6530
	ldr r0, _021E6D1C ; =0x000004A8
	mov r1, #1
	str r1, [r5, r0]
_021E6CB2:
	cmp r4, #0
	bne _021E6CBA
	cmp r6, #2
	beq _021E6CD2
_021E6CBA:
	cmp r4, #3
	bne _021E6CC2
	cmp r6, #5
	beq _021E6CD2
_021E6CC2:
	cmp r4, #6
	bne _021E6CCA
	cmp r6, #8
	beq _021E6CD2
_021E6CCA:
	cmp r4, #9
	bne _021E6CF6
	cmp r6, #0xb
	bne _021E6CF6
_021E6CD2:
	mov r0, #0x4a
	lsl r0, r0, #4
	ldrh r1, [r5, r0]
	cmp r1, #2
	bhs _021E6CE0
	add r1, r1, #1
	b _021E6CE2
_021E6CE0:
	mov r1, #0
_021E6CE2:
	strh r1, [r5, r0]
	add r0, r5, #0
	bl ov67_021E6490
	add r0, r5, #0
	bl ov67_021E6530
	ldr r0, _021E6D1C ; =0x000004A8
	mov r1, #2
	str r1, [r5, r0]
_021E6CF6:
	cmp r4, #0xc
	bne _021E6CFE
	mov r1, #0x1e
	b _021E6D0A
_021E6CFE:
	mov r0, #0x4a
	lsl r0, r0, #4
	ldrh r1, [r5, r0]
	mov r0, #0xc
	mul r0, r1
	add r1, r4, r0
_021E6D0A:
	add r0, r5, #0
	bl ov67_021E6688
	add r0, r5, #0
	add r1, r4, #0
	bl ov67_021E6C14
	pop {r4, r5, r6, pc}
	nop
_021E6D1C: .word 0x000004A8
	thumb_func_end ov67_021E6C60

	thumb_func_start ov67_021E6D20
ov67_021E6D20: ; 0x021E6D20
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0xc
	bne _021E6D2E
	mov r1, #0x1e
	b _021E6D3A
_021E6D2E:
	mov r0, #0x4a
	lsl r0, r0, #4
	ldrh r1, [r5, r0]
	mov r0, #0xc
	mul r0, r1
	add r1, r4, r0
_021E6D3A:
	add r0, r5, #0
	bl ov67_021E6688
	add r0, r5, #0
	add r1, r4, #0
	bl ov67_021E6C14
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov67_021E6D20

	.rodata

_021E6D4C:
	.byte 0xA4, 0xBB, 0xC1, 0xFE

ov67_021E6D50: ; 0x021E6D50
	.byte 0xA2, 0xBD, 0x12, 0x2D, 0xA2, 0xBD, 0x32, 0x4D, 0xFF, 0x00, 0x00, 0x00

ov67_021E6D5C: ; 0x021E6D5C
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov67_021E6D6C: ; 0x021E6D6C
	.word ov67_021E6C5C
	.word ov67_021E6C5C
	.word ov67_021E6C60
	.word ov67_021E6D20

ov67_021E6D7C: ; 0x021E6D7C
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00

ov67_021E6D90: ; 0x021E6D90
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov67_021E6DA8: ; 0x021E6DA8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x04, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov67_021E6DC4: ; 0x021E6DC4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov67_021E6DE0: ; 0x021E6DE0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov67_021E6DFC: ; 0x021E6DFC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov67_021E6E18: ; 0x021E6E18
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00

ov67_021E6E38: ; 0x021E6E38
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov67_021E6E60: ; 0x021E6E60
	.byte 0x38, 0x47, 0x15, 0x5A, 0x38, 0x47, 0x5D, 0xA2, 0x38, 0x47, 0xA5, 0xEA, 0x50, 0x5F, 0x15, 0x5A
	.byte 0x50, 0x5F, 0x5D, 0xA2, 0x50, 0x5F, 0xA5, 0xEA, 0x68, 0x77, 0x15, 0x5A, 0x68, 0x77, 0x5D, 0xA2
	.byte 0x68, 0x77, 0xA5, 0xEA, 0x80, 0x8F, 0x15, 0x5A, 0x80, 0x8F, 0x5D, 0xA2, 0x80, 0x8F, 0xA5, 0xEA
	.byte 0xA4, 0xBB, 0xC1, 0xFE, 0xFF, 0x00, 0x00, 0x00

ov67_021E6E98: ; 0x021E6E98
	.byte 0x00, 0x18, 0x15, 0x08, 0x02, 0x0F, 0x01, 0x00
	.byte 0x00, 0x05, 0x01, 0x16, 0x02, 0x0F, 0x11, 0x00, 0x00, 0x01, 0x06, 0x09, 0x04, 0x0F, 0x3D, 0x00
	.byte 0x00, 0x01, 0x0D, 0x09, 0x04, 0x0F, 0x61, 0x00, 0x00, 0x0B, 0x07, 0x06, 0x02, 0x0F, 0x85, 0x00
	.byte 0x00, 0x14, 0x07, 0x02, 0x02, 0x0F, 0x91, 0x00, 0x00, 0x0B, 0x0D, 0x07, 0x02, 0x0F, 0x95, 0x00
	.byte 0x00, 0x12, 0x0D, 0x0C, 0x02, 0x0F, 0xA3, 0x00, 0x00, 0x0B, 0x10, 0x06, 0x02, 0x0F, 0xBB, 0x00
	.byte 0x00, 0x12, 0x10, 0x0C, 0x02, 0x0F, 0xC7, 0x00

ov67_021E6EE8: ; 0x021E6EE8
	.byte 0x38, 0x40, 0x00, 0x00, 0x00, 0x03, 0x02, 0x01
	.byte 0x80, 0x40, 0x00, 0x00, 0x01, 0x04, 0x00, 0x02, 0xC8, 0x40, 0x00, 0x00, 0x02, 0x05, 0x01, 0x00
	.byte 0x38, 0x58, 0x00, 0x00, 0x00, 0x06, 0x05, 0x04, 0x80, 0x58, 0x00, 0x00, 0x01, 0x07, 0x03, 0x05
	.byte 0xC8, 0x58, 0x00, 0x00, 0x02, 0x08, 0x04, 0x03, 0x38, 0x70, 0x00, 0x00, 0x03, 0x09, 0x08, 0x07
	.byte 0x80, 0x70, 0x00, 0x00, 0x04, 0x0A, 0x06, 0x08, 0xC8, 0x70, 0x00, 0x00, 0x05, 0x0B, 0x07, 0x06
	.byte 0x38, 0x88, 0x00, 0x00, 0x06, 0x0C, 0x0B, 0x0A, 0x80, 0x88, 0x00, 0x00, 0x07, 0x0C, 0x09, 0x0B
	.byte 0xC8, 0x88, 0x00, 0x00, 0x08, 0x0C, 0x0A, 0x09, 0xE0, 0xB0, 0x00, 0x00, 0x8B, 0x0C, 0x0C, 0x0C

ov67_021E6F50: ; 0x021E6F50
	.byte 0xE0, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x58, 0xD1, 0x00, 0x00, 0x58, 0xD1, 0x00, 0x00, 0x58, 0xD1, 0x00, 0x00
	.byte 0x58, 0xD1, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xE0, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x58, 0xD1, 0x00, 0x00, 0x58, 0xD1, 0x00, 0x00
	.byte 0x58, 0xD1, 0x00, 0x00, 0x58, 0xD1, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x28, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x03, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x58, 0xD1, 0x00, 0x00
	.byte 0x58, 0xD1, 0x00, 0x00, 0x58, 0xD1, 0x00, 0x00, 0x58, 0xD1, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x48, 0x00, 0xB0, 0x00
	.byte 0x00, 0x00, 0x05, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x58, 0xD1, 0x00, 0x00, 0x58, 0xD1, 0x00, 0x00, 0x58, 0xD1, 0x00, 0x00, 0x58, 0xD1, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov67_021E7020: ; 0x021E7020
	.byte 0x00, 0x18, 0x15, 0x08, 0x02, 0x0F, 0x01, 0x00, 0x00, 0x05, 0x01, 0x08, 0x02, 0x0F, 0x11, 0x00
	.byte 0x00, 0x0D, 0x01, 0x0F, 0x02, 0x0F, 0x21, 0x00, 0x00, 0x05, 0x03, 0x16, 0x02, 0x0F, 0x3F, 0x00
	.byte 0x00, 0x0F, 0x15, 0x04, 0x02, 0x0F, 0x6B, 0x00, 0x04, 0x02, 0x07, 0x1C, 0x02, 0x0F, 0x01, 0x00
	.byte 0x04, 0x02, 0x0A, 0x1C, 0x06, 0x0F, 0x71, 0x00, 0x04, 0x02, 0x11, 0x1C, 0x06, 0x0F, 0xC1, 0x01
	.byte 0x04, 0x02, 0x07, 0x1C, 0x02, 0x0F, 0x39, 0x00, 0x04, 0x02, 0x0A, 0x1C, 0x06, 0x0F, 0x19, 0x01
	.byte 0x04, 0x02, 0x11, 0x1C, 0x06, 0x0F, 0x69, 0x02, 0x00, 0x03, 0x07, 0x08, 0x02, 0x0F, 0x73, 0x00
	.byte 0x00, 0x0C, 0x07, 0x08, 0x02, 0x0F, 0x83, 0x00, 0x00, 0x15, 0x07, 0x08, 0x02, 0x0F, 0x93, 0x00
	.byte 0x00, 0x03, 0x0A, 0x08, 0x02, 0x0F, 0xA3, 0x00, 0x00, 0x0C, 0x0A, 0x08, 0x02, 0x0F, 0xB3, 0x00
	.byte 0x00, 0x15, 0x0A, 0x08, 0x02, 0x0F, 0xC3, 0x00, 0x00, 0x03, 0x0D, 0x08, 0x02, 0x0F, 0xD3, 0x00
	.byte 0x00, 0x0C, 0x0D, 0x08, 0x02, 0x0F, 0xE3, 0x00, 0x00, 0x15, 0x0D, 0x08, 0x02, 0x0F, 0xF3, 0x00
	.byte 0x00, 0x03, 0x10, 0x08, 0x02, 0x0F, 0x03, 0x01, 0x00, 0x0C, 0x10, 0x08, 0x02, 0x0F, 0x13, 0x01
	.byte 0x00, 0x15, 0x10, 0x08, 0x02, 0x0F, 0x23, 0x01, 0x00, 0x03, 0x07, 0x08, 0x02, 0x0F, 0x33, 0x01
	.byte 0x00, 0x0C, 0x07, 0x08, 0x02, 0x0F, 0x43, 0x01, 0x00, 0x15, 0x07, 0x08, 0x02, 0x0F, 0x53, 0x01
	.byte 0x00, 0x03, 0x0A, 0x08, 0x02, 0x0F, 0x63, 0x01, 0x00, 0x0C, 0x0A, 0x08, 0x02, 0x0F, 0x73, 0x01
	.byte 0x00, 0x15, 0x0A, 0x08, 0x02, 0x0F, 0x83, 0x01, 0x00, 0x03, 0x0D, 0x08, 0x02, 0x0F, 0x93, 0x01
	.byte 0x00, 0x0C, 0x0D, 0x08, 0x02, 0x0F, 0xA3, 0x01, 0x00, 0x15, 0x0D, 0x08, 0x02, 0x0F, 0xB3, 0x01
	.byte 0x00, 0x03, 0x10, 0x08, 0x02, 0x0F, 0xC3, 0x01, 0x00, 0x0C, 0x10, 0x08, 0x02, 0x0F, 0xD3, 0x01
	.byte 0x00, 0x15, 0x10, 0x08, 0x02, 0x0F, 0xE3, 0x01
	; 0x021E7138
