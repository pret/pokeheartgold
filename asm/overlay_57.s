	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov57_022378C0
ov57_022378C0: ; 0x022378C0
	push {r3, lr}
	ldr r0, _022378D4 ; =FS_OVERLAY_ID(OVY_6)
	mov r1, #2
	bl HandleLoadOverlay
	ldr r0, _022378D8 ; =FS_OVERLAY_ID(OVY_7)
	mov r1, #2
	bl HandleLoadOverlay
	pop {r3, pc}
	.balign 4, 0
_022378D4: .word FS_OVERLAY_ID(OVY_6)
_022378D8: .word FS_OVERLAY_ID(OVY_7)
	thumb_func_end ov57_022378C0

	thumb_func_start ov57_022378DC
ov57_022378DC: ; 0x022378DC
	push {r3, r4, r5, r6, r7, lr}
	mov r2, #2
	add r5, r0, #0
	mov r0, #3
	mov r1, #0x34
	lsl r2, r2, #0x12
	bl CreateHeap
	mov r1, #0x46
	add r0, r5, #0
	lsl r1, r1, #4
	mov r2, #0x34
	bl OverlayManager_CreateAndGetData
	mov r2, #0x46
	mov r1, #0
	lsl r2, r2, #4
	add r4, r0, #0
	bl memset
	add r0, r5, #0
	bl OverlayManager_GetParentWork
	str r0, [r4]
	mov r0, #0xb4
	mov r1, #0x34
	bl NARC_ctor
	ldr r1, _02237AE4 ; =0x0000045C
	str r0, [r4, r1]
	ldr r0, [r4]
	ldr r0, [r0, #0x2c]
	bl sub_020183F0
	ldr r1, _02237AE8 ; =0x0000040C
	str r0, [r4, r1]
	mov r0, #0x34
	bl AllocMonZeroed
	ldr r1, _02237AEC ; =0x00000458
	mov r2, #0xff
	str r0, [r4, r1]
	add r0, r4, #0
	add r0, #0xd4
	str r2, [r0]
	mov r5, #0
	sub r1, #0x10
	str r5, [r4, r1]
	ldr r0, [r4]
	ldr r0, [r0, #0x20]
	bl SealCase_CountUniqueSeals
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1d
	sub r1, r1, r2
	mov r0, #0x1d
	ror r1, r0
	add r0, r2, r1
	beq _02237954
	mov r5, #1
_02237954:
	ldr r0, [r4]
	ldr r0, [r0, #0x20]
	bl SealCase_CountUniqueSeals
	asr r1, r0, #2
	lsr r1, r1, #0x1d
	add r1, r0, r1
	asr r0, r1, #3
	add r1, r5, r0
	ldr r0, _02237AF0 ; =0x0000044C
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	cmp r1, #0xa
	ble _02237974
	mov r1, #0xa
	str r1, [r4, r0]
_02237974:
	ldr r0, [r4]
	bl ov57_02237E78
	mov r1, #0xfb
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4]
	bl ov57_02237E78
	mov r1, #0x3f
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4]
	ldr r0, [r0, #0x20]
	bl SealCase_inventory_get
	str r0, [r4, #0x64]
	mov r6, #0
	add r5, r4, #0
	mov r7, #0xff
_0223799C:
	ldr r0, [r4]
	add r1, r6, #0
	ldr r0, [r0, #0x20]
	bl SealCase_GetCapsuleI
	str r7, [r5, #4]
	str r0, [r5, #8]
	add r6, r6, #1
	add r5, #8
	cmp r6, #0xc
	blt _0223799C
	mov r5, #0
	add r6, r5, #0
	mov r7, #0xa2
_022379B8:
	ldr r0, [r4]
	add r0, r0, r6
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _022379D6
	add r1, r7, #0
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _022379D6
	lsl r0, r0, #3
	add r0, r4, r0
	sub r0, r0, #4
	str r5, [r0]
_022379D6:
	add r5, r5, #1
	add r6, r6, #4
	cmp r5, #6
	blt _022379B8
	mov r0, #0x34
	bl ov57_02237CA8
	bl ov57_0223BB5C
	bl ov57_02238B28
	mov r1, #0x96
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0x34
	bl BgConfig_Alloc
	add r1, r4, #0
	add r1, #0xe4
	str r0, [r1]
	mov r0, #0x40
	mov r1, #0x34
	bl GF_CreateVramTransferManager
	mov r0, #0x34
	bl sub_020030E8
	add r1, r4, #0
	add r1, #0xe8
	str r0, [r1]
	add r0, r4, #0
	add r0, #0xe8
	ldr r0, [r0]
	mov r1, #1
	bl sub_02003B50
	add r0, r4, #0
	add r0, #0xe8
	mov r2, #2
	ldr r0, [r0]
	mov r1, #0
	lsl r2, r2, #8
	mov r3, #0x34
	bl PaletteData_AllocBuffers
	add r0, r4, #0
	add r0, #0xe8
	mov r1, #1
	ldr r0, [r0]
	lsl r2, r1, #9
	mov r3, #0x34
	bl PaletteData_AllocBuffers
	add r0, r4, #0
	add r0, #0xe8
	mov r1, #2
	ldr r0, [r0]
	lsl r2, r1, #8
	mov r3, #0x34
	bl PaletteData_AllocBuffers
	add r0, r4, #0
	add r0, #0xe8
	mov r2, #2
	ldr r0, [r0]
	mov r1, #3
	lsl r2, r2, #8
	mov r3, #0x34
	bl PaletteData_AllocBuffers
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	bl ov57_02237CEC
	bl ov57_02238BCC
	mov r0, #0x34
	bl sub_02007FD4
	mov r1, #0x71
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0x34
	mov r1, #1
	mov r2, #0
	bl sub_02016EDC
	mov r1, #0xa1
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4]
	ldr r0, [r0, #0x24]
	bl Options_GetFrame
	add r5, r0, #0
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0xe4
	add r1, #0xe8
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, r5, #0
	bl ov57_022395B8
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0xe4
	add r1, #0xe8
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, r5, #0
	bl ov57_02239670
	add r0, r4, #0
	add r0, #0xd4
	bl ov57_02239058
	bl sub_020210BC
	mov r0, #4
	bl sub_02021148
	add r0, r4, #0
	bl ov57_0223BB84
	ldr r0, _02237AF4 ; =ov57_02237E38
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	add r0, r4, #0
	bl ov57_022386F0
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02237AE4: .word 0x0000045C
_02237AE8: .word 0x0000040C
_02237AEC: .word 0x00000458
_02237AF0: .word 0x0000044C
_02237AF4: .word ov57_02237E38
	thumb_func_end ov57_022378DC

	thumb_func_start ov57_02237AF8
ov57_02237AF8: ; 0x02237AF8
	push {r4, lr}
	bl OverlayManager_GetData
	add r4, r0, #0
	bl ov57_0223A0E0
	cmp r0, #0
	bne _02237B0C
	mov r0, #1
	pop {r4, pc}
_02237B0C:
	mov r0, #0x71
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02008120
	bl ov57_02238C0C
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov57_02237AF8

	thumb_func_start ov57_02237B20
ov57_02237B20: ; 0x02237B20
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	mov r0, #1
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #2
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #1
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #2
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #8
	mov r1, #0
	bl GX_EngineBToggleLayers
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	mov r1, #1
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	mov r1, #2
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	mov r1, #3
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	mov r1, #4
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	mov r1, #5
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	mov r1, #6
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	mov r1, #7
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	bl FreeToHeap
	add r0, r4, #0
	add r0, #0xe8
	ldr r0, [r0]
	mov r1, #0
	bl PaletteData_FreeBuffers
	add r0, r4, #0
	add r0, #0xe8
	ldr r0, [r0]
	mov r1, #1
	bl PaletteData_FreeBuffers
	add r0, r4, #0
	add r0, #0xe8
	ldr r0, [r0]
	mov r1, #2
	bl PaletteData_FreeBuffers
	add r0, r4, #0
	add r0, #0xe8
	ldr r0, [r0]
	mov r1, #3
	bl PaletteData_FreeBuffers
	add r0, r4, #0
	add r0, #0xe8
	ldr r0, [r0]
	bl sub_02003104
	mov r1, #0xfb
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldr r0, [r4]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov57_02237E80
	ldr r0, _02237C94 ; =0x00000458
	ldr r0, [r4, r0]
	bl FreeToHeap
	add r0, r4, #0
	bl ov57_022383AC
	mov r0, #0x7b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02026CAC
	mov r0, #0x71
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02008524
	mov r0, #0xa1
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02016F2C
	add r0, r4, #0
	bl ov57_02238714
	add r0, r4, #0
	add r0, #0xd4
	bl ov57_022390F4
	bl GF_DestroyVramTransferManager
	mov r0, #0x96
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl GF_3DVramMan_Delete
	mov r0, #0x34
	bl ov57_02237CDC
	ldr r0, _02237C98 ; =0x0000045C
	ldr r0, [r4, r0]
	bl NARC_dtor
	ldr r0, [r4]
	ldr r1, _02237C9C ; =0x0000040C
	ldr r0, [r0, #0x2c]
	ldr r1, [r4, r1]
	bl sub_02018410
	add r0, r5, #0
	bl OverlayManager_FreeData
	bl sub_02021238
	mov r0, #0x34
	bl DestroyHeap
	ldr r0, _02237CA0 ; =FS_OVERLAY_ID(OVY_6)
	bl UnloadOverlayByID
	ldr r0, _02237CA4 ; =FS_OVERLAY_ID(OVY_7)
	bl UnloadOverlayByID
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02237C94: .word 0x00000458
_02237C98: .word 0x0000045C
_02237C9C: .word 0x0000040C
_02237CA0: .word FS_OVERLAY_ID(OVY_6)
_02237CA4: .word FS_OVERLAY_ID(OVY_7)
	thumb_func_end ov57_02237B20

	thumb_func_start ov57_02237CA8
ov57_02237CA8: ; 0x02237CA8
	push {r3, lr}
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _02237CD4 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _02237CD8 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	pop {r3, pc}
	.balign 4, 0
_02237CD4: .word 0xFFFFE0FF
_02237CD8: .word 0x04001000
	thumb_func_end ov57_02237CA8

	thumb_func_start ov57_02237CDC
ov57_02237CDC: ; 0x02237CDC
	push {r3, lr}
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	pop {r3, pc}
	thumb_func_end ov57_02237CDC

	thumb_func_start ov57_02237CEC
ov57_02237CEC: ; 0x02237CEC
	push {r4, r5, lr}
	sub sp, #0xfc
	add r4, r0, #0
	bl GX_DisableEngineALayers
	ldr r5, _02237E24 ; =ov57_0223BC90
	add r3, sp, #0x10
	mov r2, #5
_02237CFC:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02237CFC
	add r0, sp, #0x10
	bl GX_SetBanks
	mov r1, #6
	mov r2, #2
	mov r0, #0
	lsl r1, r1, #0x18
	lsl r2, r2, #0x12
	bl MIi_CpuClear32
	mov r1, #0x62
	mov r2, #2
	mov r0, #0
	lsl r1, r1, #0x14
	lsl r2, r2, #0x10
	bl MIi_CpuClear32
	mov r1, #0x19
	mov r2, #1
	mov r0, #0
	lsl r1, r1, #0x16
	lsl r2, r2, #0x12
	bl MIi_CpuClear32
	mov r1, #0x66
	mov r2, #2
	mov r0, #0
	lsl r1, r1, #0x14
	lsl r2, r2, #0x10
	bl MIi_CpuClear32
	ldr r5, _02237E28 ; =_0223BC80
	add r3, sp, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _02237E2C ; =ov57_0223BCB8
	add r3, sp, #0xa8
	mov r2, #0xa
_02237D5C:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02237D5C
	ldr r0, [r5]
	mov r1, #1
	str r0, [r3]
	add r0, r4, #0
	add r2, sp, #0xa8
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #2
	add r2, sp, #0xc4
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #3
	add r2, sp, #0xe0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r1, _02237E30 ; =0x04000008
	mov r0, #3
	ldrh r2, [r1]
	bic r2, r0
	mov r0, #1
	orr r2, r0
	strh r2, [r1]
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	ldr r5, _02237E34 ; =ov57_0223BD0C
	add r3, sp, #0x38
	mov r2, #0xe
_02237DBE:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02237DBE
	add r0, r4, #0
	mov r1, #4
	add r2, sp, #0x38
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #5
	add r2, sp, #0x54
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #6
	add r2, sp, #0x70
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #7
	add r2, sp, #0x8c
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	add sp, #0xfc
	pop {r4, r5, pc}
	nop
_02237E24: .word ov57_0223BC90
_02237E28: .word _0223BC80
_02237E2C: .word ov57_0223BCB8
_02237E30: .word 0x04000008
_02237E34: .word ov57_0223BD0C
	thumb_func_end ov57_02237CEC

	thumb_func_start ov57_02237E38
ov57_02237E38: ; 0x02237E38
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x71
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02009418
	bl sub_0200D034
	add r0, r4, #0
	add r0, #0xe8
	ldr r0, [r0]
	bl sub_0200398C
	add r4, #0xe4
	ldr r0, [r4]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	bl GF_RunVramTransferTasks
	ldr r3, _02237E70 ; =0x027E0000
	ldr r1, _02237E74 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_02237E70: .word 0x027E0000
_02237E74: .word 0x00003FF8
	thumb_func_end ov57_02237E38

	thumb_func_start ov57_02237E78
ov57_02237E78: ; 0x02237E78
	add r0, #0x30
	ldrb r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov57_02237E78

	thumb_func_start ov57_02237E80
ov57_02237E80: ; 0x02237E80
	add r0, #0x30
	strb r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov57_02237E80

	thumb_func_start ov57_02237E88
ov57_02237E88: ; 0x02237E88
	add r0, #0x31
	strb r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov57_02237E88

	thumb_func_start ov57_02237E90
ov57_02237E90: ; 0x02237E90
	add r3, r2, #0
	sub r3, #0xa
	strb r3, [r0]
	add r3, r1, #0
	sub r3, #0xa
	strb r3, [r0, #2]
	add r2, #0xa
	strb r2, [r0, #1]
	add r1, #0xa
	strb r1, [r0, #3]
	bx lr
	.balign 4, 0
	thumb_func_end ov57_02237E90

	thumb_func_start ov57_02237EA8
ov57_02237EA8: ; 0x02237EA8
	mov r1, #0
	strb r1, [r0]
	strb r1, [r0, #2]
	mov r1, #0xc0
	strb r1, [r0, #1]
	mov r1, #0xff
	strb r1, [r0, #3]
	bx lr
	thumb_func_end ov57_02237EA8

	thumb_func_start ov57_02237EB8
ov57_02237EB8: ; 0x02237EB8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	beq _02237F0C
	cmp r2, #1
	bne _02237EE8
	ldr r3, _02237F10 ; =gSystem + 0x40
	mov r1, #0x20
	mov r2, #0x22
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, r4, #0
	bl sub_0200DDB8
	add r1, sp, #0
	add r0, r4, #0
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	add r0, r5, #0
	bl ov57_02237EA8
	pop {r3, r4, r5, pc}
_02237EE8:
	add r1, sp, #0
	add r0, r4, #0
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	add r3, sp, #0
	mov r1, #2
	mov r2, #0
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, r5, #0
	lsl r1, r1, #0x18
	lsl r2, r2, #0x18
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	bl ov57_02237E90
_02237F0C:
	pop {r3, r4, r5, pc}
	nop
_02237F10: .word gSystem + 0x40
	thumb_func_end ov57_02237EB8

	thumb_func_start ov57_02237F14
ov57_02237F14: ; 0x02237F14
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	add r7, r4, #0
	mov r6, #0xd5
	add r5, r0, #0
	sub r7, #0x38
	lsl r6, r6, #2
_02237F22:
	ldr r0, [r5, r6]
	cmp r0, #0
	beq _02237F30
	add r1, r7, #0
	mov r2, #0x10
	bl sub_0200DED0
_02237F30:
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #8
	blt _02237F22
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov57_02237F14

	thumb_func_start ov57_02237F3C
ov57_02237F3C: ; 0x02237F3C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r0, #0xfb
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	mov r6, #0
	lsl r0, r0, #3
	add r0, r7, r0
	ldr r4, [r0, #8]
	add r5, r7, #0
_02237F50:
	ldrb r1, [r4]
	cmp r1, #0
	beq _02237F8E
	mov r0, #0x35
	lsl r0, r0, #4
	strb r1, [r5, r0]
	ldrb r1, [r4, #1]
	add r0, r0, #1
	strb r1, [r5, r0]
	ldrb r1, [r4, #2]
	ldr r0, _02237FA8 ; =0x00000352
	strb r1, [r5, r0]
	lsl r1, r6, #0x18
	add r0, r7, #0
	lsr r1, r1, #0x18
	bl ov57_02238260
	mov r0, #0xd6
	mov r1, #0xd5
	lsl r0, r0, #2
	lsl r1, r1, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	mov r2, #0
	bl ov57_02237EB8
	mov r0, #0xd3
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _02237F9A
_02237F8E:
	mov r0, #0xd3
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r0, #4
	strb r1, [r5, r0]
_02237F9A:
	add r6, r6, #1
	add r4, r4, #3
	add r5, #0x10
	cmp r6, #8
	blt _02237F50
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02237FA8: .word 0x00000352
	thumb_func_end ov57_02237F3C

	thumb_func_start ov57_02237FAC
ov57_02237FAC: ; 0x02237FAC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	mov r0, #0xd3
	mov r4, #0
	add r3, r6, #0
	lsl r0, r0, #2
_02237FBA:
	ldr r2, [r3, r0]
	cmp r2, #1
	beq _0223801A
	mov r0, #0x45
	add r1, r6, r1
	lsl r0, r0, #4
	ldrb r2, [r1, r0]
	lsl r5, r4, #4
	mov r0, #0x35
	add r1, r6, r5
	lsl r0, r0, #4
	strb r2, [r1, r0]
	add r1, r0, #1
	add r7, r6, r1
	mov r1, #0xbe
	add r0, r0, #2
	strb r1, [r7, r5]
	add r0, r6, r0
	mov r1, #0x46
	strb r1, [r0, r5]
	str r0, [sp]
	add r0, sp, #8
	add r1, sp, #4
	bl sub_02025364
	ldr r0, [sp, #8]
	strb r0, [r7, r5]
	ldr r1, [sp, #4]
	ldr r0, [sp]
	strb r1, [r0, r5]
	lsl r1, r4, #0x18
	add r0, r6, #0
	lsr r1, r1, #0x18
	bl ov57_02238260
	lsl r1, r4, #0x18
	add r0, r6, #0
	lsr r1, r1, #0x18
	bl ov57_02238044
	mov r0, #0xd3
	mov r2, #1
	add r1, r6, r5
	lsl r0, r0, #2
	str r2, [r1, r0]
	add sp, #0xc
	add r0, r4, #0
	pop {r4, r5, r6, r7, pc}
_0223801A:
	add r4, r4, #1
	add r3, #0x10
	cmp r4, #8
	blt _02237FBA
	mov r0, #0xff
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov57_02237FAC

	thumb_func_start ov57_02238028
ov57_02238028: ; 0x02238028
	mov r1, #0xd3
	mov r3, #0
	lsl r1, r1, #2
_0223802E:
	ldr r2, [r0, r1]
	cmp r2, #1
	beq _02238038
	mov r0, #1
	bx lr
_02238038:
	add r3, r3, #1
	add r0, #0x10
	cmp r3, #8
	blt _0223802E
	mov r0, #0
	bx lr
	thumb_func_end ov57_02238028

	thumb_func_start ov57_02238044
ov57_02238044: ; 0x02238044
	push {r3, r4, r5, r6, r7, lr}
	mov r7, #0xd3
	add r5, r0, #0
	add r6, r1, #0
	mov r4, #0
	lsl r7, r7, #2
_02238050:
	ldr r0, [r5, r7]
	cmp r0, #1
	bne _02238090
	cmp r4, r6
	bne _02238068
	mov r0, #0xd5
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_0200DD68
	b _02238090
_02238068:
	mov r0, #0xd5
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200DD7C
	add r1, r0, #0
	bne _02238084
	mov r0, #0xd5
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r1, #1
	bl sub_0200DD68
	b _02238090
_02238084:
	mov r0, #0xd5
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r1, #2
	bl sub_0200DD68
_02238090:
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #8
	blt _02238050
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov57_02238044

	thumb_func_start ov57_0223809C
ov57_0223809C: ; 0x0223809C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r7, r1, #0
	add r1, r0, #0
	add r1, #0xdc
	ldr r4, [r1]
	add r1, r0, #0
	add r1, #0xe0
	ldr r5, [r1]
	mov r1, #0x57
	str r1, [sp]
	mov r1, #6
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	mov r1, #1
	str r1, [sp, #0xc]
	mov r1, #2
	str r1, [sp, #0x10]
	ldr r1, _02238124 ; =0x0000520E
	add r6, r2, #0
	str r1, [sp, #0x14]
	add r0, #0xe8
	ldr r0, [r0]
	mov r1, #3
	add r2, r4, #0
	add r3, r5, #0
	bl sub_0200D644
	add r0, r7, #0
	bl sub_02091054
	add r3, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _02238128 ; =0x00004E20
	add r1, r5, #0
	add r0, r6, r0
	str r0, [sp, #8]
	add r0, r4, #0
	mov r2, #0x57
	bl sub_0200D4A4
	mov r0, #1
	str r0, [sp]
	ldr r0, _0223812C ; =0x00005616
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0x57
	mov r3, #0x26
	bl sub_0200D6D4
	mov r0, #1
	str r0, [sp]
	ldr r0, _02238130 ; =0x000059FC
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0x57
	mov r3, #0x24
	bl sub_0200D704
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02238124: .word 0x0000520E
_02238128: .word 0x00004E20
_0223812C: .word 0x00005616
_02238130: .word 0x000059FC
	thumb_func_end ov57_0223809C

	thumb_func_start ov57_02238134
ov57_02238134: ; 0x02238134
	push {r4, r5, r6, r7, lr}
	sub sp, #0x74
	mov r1, #0xa2
	lsl r1, r1, #2
	str r0, [sp]
	ldr r0, [r0, r1]
	cmp r0, #0
	bne _02238146
	b _02238254
_02238146:
	ldr r0, [sp]
	mov r7, #0
	str r7, [r0, r1]
	add r4, sp, #0x54
	add r5, sp, #0x34
	add r6, r0, #0
_02238152:
	mov r0, #0xff
	str r0, [r4]
	str r0, [r5]
	mov r0, #0xd5
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _0223816A
	bl sub_0200DD7C
	str r0, [r4]
	str r7, [r5]
_0223816A:
	add r7, r7, #1
	add r4, r4, #4
	add r5, r5, #4
	add r6, #0x10
	cmp r7, #8
	blt _02238152
	mov r0, #0
	mov ip, r0
_0223817A:
	mov r0, ip
	mov r3, #7
	cmp r0, #7
	bge _022381AA
	add r4, sp, #0x70
	add r5, sp, #0x50
_02238186:
	sub r7, r4, #4
	ldr r2, [r4]
	ldr r0, [r7]
	cmp r0, r2
	blt _0223819E
	ldr r1, [r5]
	sub r6, r5, #4
	str r0, [r4]
	ldr r0, [r6]
	str r0, [r5]
	str r2, [r7]
	str r1, [r6]
_0223819E:
	sub r3, r3, #1
	mov r0, ip
	sub r4, r4, #4
	sub r5, r5, #4
	cmp r3, r0
	bgt _02238186
_022381AA:
	mov r0, ip
	add r0, r0, #1
	mov ip, r0
	cmp r0, #7
	blt _0223817A
	mov r3, #0x35
	lsl r3, r3, #4
	ldr r0, [sp]
	mov r2, #0
	add r1, sp, #0x1c
	add r4, r3, #1
	add r5, r3, #2
_022381C2:
	ldrb r6, [r0, r3]
	add r2, r2, #1
	strb r6, [r1]
	ldrb r6, [r0, r4]
	strb r6, [r1, #1]
	ldrb r6, [r0, r5]
	add r0, #0x10
	strb r6, [r1, #2]
	add r1, r1, #3
	cmp r2, #8
	blt _022381C2
	add r3, sp, #0x1c
	add r2, sp, #4
	mov r1, #0x18
_022381DE:
	ldrb r0, [r3]
	add r3, r3, #1
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _022381DE
	ldr r5, [sp]
	mov r6, #0
	add r4, sp, #0x34
	add r7, sp, #4
_022381F2:
	ldr r1, [r4]
	cmp r1, #0xff
	bne _0223820A
	mov r0, #0x35
	mov r1, #0
	lsl r0, r0, #4
	strb r1, [r5, r0]
	add r0, r0, #1
	strb r1, [r5, r0]
	ldr r0, _02238258 ; =0x00000352
	strb r1, [r5, r0]
	b _0223824A
_0223820A:
	lsl r0, r1, #1
	add r0, r1, r0
	ldrb r1, [r7, r0]
	mov r0, #0x35
	lsl r0, r0, #4
	strb r1, [r5, r0]
	ldr r1, [r4]
	lsl r0, r1, #1
	add r0, r1, r0
	add r0, r7, r0
	ldrb r1, [r0, #1]
	ldr r0, _0223825C ; =0x00000351
	strb r1, [r5, r0]
	ldr r1, [r4]
	lsl r0, r1, #1
	add r0, r1, r0
	add r0, r7, r0
	ldrb r1, [r0, #2]
	ldr r0, _02238258 ; =0x00000352
	strb r1, [r5, r0]
	ldr r0, [r4]
	lsl r1, r0, #4
	ldr r0, [sp]
	add r1, r0, r1
	mov r0, #0xd5
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0223824A
	add r1, r6, #0
	bl sub_0200DD68
_0223824A:
	add r6, r6, #1
	add r4, r4, #4
	add r5, #0x10
	cmp r6, #8
	blt _022381F2
_02238254:
	add sp, #0x74
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02238258: .word 0x00000352
_0223825C: .word 0x00000351
	thumb_func_end ov57_02238134

	thumb_func_start ov57_02238260
ov57_02238260: ; 0x02238260
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	add r5, r1, #0
	add r1, r0, #0
	add r1, #0xdc
	ldr r7, [r1]
	add r1, r0, #0
	add r1, #0xe0
	ldr r6, [r1]
	mov r1, #0xd3
	lsl r1, r1, #2
	add r2, r0, r1
	lsl r1, r5, #4
	add r4, r2, r1
	ldr r1, [r2, r1]
	cmp r1, #1
	bne _0223828C
	bl GF_AssertFail
	add sp, #0x34
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0223828C:
	ldrb r1, [r4, #4]
	add r2, r5, #0
	bl ov57_0223809C
	ldrb r1, [r4, #5]
	add r0, sp, #0
	strh r1, [r0]
	ldrb r1, [r4, #6]
	strh r1, [r0, #2]
	mov r1, #0
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	mov r0, #2
	str r0, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x2c]
	sub r0, r0, #2
	str r1, [sp, #0xc]
	str r1, [sp, #0x30]
	str r1, [sp, #8]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	ldrb r0, [r4, #4]
	bl sub_02091054
	ldr r0, _022382E8 ; =0x00004E20
	add r1, r6, #0
	add r0, r5, r0
	str r0, [sp, #0x14]
	ldr r0, _022382EC ; =0x0000520E
	add r2, sp, #0
	str r0, [sp, #0x18]
	ldr r0, _022382F0 ; =0x00005616
	str r0, [sp, #0x1c]
	ldr r0, _022382F4 ; =0x000059FC
	str r0, [sp, #0x20]
	add r0, r7, #0
	bl sub_0200D734
	str r0, [r4, #8]
	bl sub_0200DC18
	mov r0, #1
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_022382E8: .word 0x00004E20
_022382EC: .word 0x0000520E
_022382F0: .word 0x00005616
_022382F4: .word 0x000059FC
	thumb_func_end ov57_02238260

	thumb_func_start ov57_022382F8
ov57_022382F8: ; 0x022382F8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r2, #0
	add r6, r1, #0
	mov r1, #0xd3
	add r4, r0, #0
	lsl r7, r5, #4
	add r3, r4, r7
	lsl r1, r1, #2
	ldr r2, [r3, r1]
	cmp r2, #0
	bne _02238312
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02238312:
	cmp r6, #3
	bhi _022383A2
	add r2, r6, r6
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_02238322: ; jump table
	.short _0223832A - _02238322 - 2 ; case 0
	.short _0223836A - _02238322 - 2 ; case 1
	.short _02238340 - _02238322 - 2 ; case 2
	.short _0223836A - _02238322 - 2 ; case 3
_0223832A:
	add r1, r4, #0
	add r1, #0xd4
	ldr r1, [r1]
	cmp r1, #0xff
	bne _022383A6
	add r4, #0xd4
	add r1, r5, #0
	str r5, [r4]
	bl ov57_02238044
	b _022383A6
_02238340:
	add r0, #0xd4
	ldr r0, [r0]
	cmp r0, r5
	bne _022383A6
	add r0, r1, #0
	add r0, #0xc
	add r1, #8
	ldr r0, [r3, r0]
	ldr r1, [r3, r1]
	mov r2, #1
	bl ov57_02237EB8
	add r0, r4, #0
	add r1, r5, #0
	bl ov57_0223848C
	add r0, r4, #0
	add r1, r5, #0
	bl ov57_02238508
	b _022383A6
_0223836A:
	add r1, r4, #0
	add r1, #0xd4
	ldr r1, [r1]
	cmp r1, #0xff
	bne _022383A6
	add r1, r5, #0
	bl ov57_022383F8
	mov r1, #0xd6
	add r2, r4, r7
	lsl r1, r1, #2
	add r6, r0, #0
	ldr r0, [r2, r1]
	sub r1, r1, #4
	ldr r1, [r2, r1]
	mov r2, #0
	bl ov57_02237EB8
	cmp r6, #0
	bne _0223839A
	add r0, r4, #0
	add r1, r5, #0
	bl ov57_02238438
_0223839A:
	mov r0, #0xff
	add r4, #0xd4
	str r0, [r4]
	b _022383A6
_022383A2:
	bl GF_AssertFail
_022383A6:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov57_022382F8

	thumb_func_start ov57_022383AC
ov57_022383AC: ; 0x022383AC
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r7, #0xd3
	mov r4, #0
	add r5, r6, #0
	lsl r7, r7, #2
_022383B8:
	ldr r0, [r5, r7]
	cmp r0, #1
	bne _022383C6
	add r0, r6, #0
	add r1, r4, #0
	bl ov57_02238438
_022383C6:
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #8
	blt _022383B8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov57_022383AC

	thumb_func_start ov57_022383D0
ov57_022383D0: ; 0x022383D0
	push {r3, r4, r5, r6, r7, lr}
	mov r7, #0xd3
	add r5, r0, #0
	add r6, r1, #0
	mov r4, #0
	lsl r7, r7, #2
_022383DC:
	ldr r0, [r5, r7]
	cmp r0, #1
	bne _022383EE
	mov r0, #0xd5
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r6, #0
	bl sub_0200DCE8
_022383EE:
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #8
	blt _022383DC
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov57_022383D0

	thumb_func_start ov57_022383F8
ov57_022383F8: ; 0x022383F8
	push {r3, lr}
	lsl r1, r1, #4
	add r2, r0, r1
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r1, [r2, r0]
	cmp r1, #0
	bne _0223840C
	mov r0, #1
	pop {r3, pc}
_0223840C:
	add r0, #8
	ldr r0, [r2, r0]
	add r1, sp, #0
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	add r2, sp, #0
	mov r0, #2
	mov r1, #0
	ldrsh r0, [r2, r0]
	ldrsh r1, [r2, r1]
	mov r2, #0xbe
	mov r3, #0x46
	bl ov07_022344E4
	cmp r0, #0x3c
	bgt _02238434
	mov r0, #1
	pop {r3, pc}
_02238434:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov57_022383F8

	thumb_func_start ov57_02238438
ov57_02238438: ; 0x02238438
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x35
	add r7, r1, #0
	lsl r0, r0, #4
	lsl r4, r7, #4
	add r6, r5, r0
	ldrb r0, [r6, r4]
	bl sub_02091054
	add r0, r5, #0
	add r0, #0xe0
	ldr r1, _02238488 ; =0x00004E20
	ldr r0, [r0]
	add r1, r7, r1
	bl sub_0200D958
	mov r0, #0xd5
	lsl r0, r0, #2
	add r7, r5, r0
	ldr r0, [r7, r4]
	bl sub_0200D9DC
	mov r1, #0
	mov r2, #0xd3
	lsl r2, r2, #2
	str r1, [r7, r4]
	add r3, r5, r4
	str r1, [r3, r2]
	strb r1, [r6, r4]
	add r0, r2, #5
	strb r1, [r3, r0]
	add r0, r2, #6
	add r2, #0xc
	strb r1, [r3, r0]
	ldr r0, [r3, r2]
	add r2, r1, #0
	bl ov57_02237E90
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02238488: .word 0x00004E20
	thumb_func_end ov57_02238438

	thumb_func_start ov57_0223848C
ov57_0223848C: ; 0x0223848C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	bl ov57_022383F8
	cmp r0, #0
	bne _022384AC
	lsl r0, r5, #4
	add r1, r4, r0
	mov r0, #0xd5
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #1
	bl sub_0200E0FC
	pop {r3, r4, r5, pc}
_022384AC:
	lsl r0, r5, #4
	add r1, r4, r0
	mov r0, #0xd5
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0200E0FC
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov57_0223848C

	thumb_func_start ov57_022384C0
ov57_022384C0: ; 0x022384C0
	push {r4, r5, r6, r7}
	mov r2, #0xfb
	lsl r2, r2, #2
	ldr r2, [r0, r2]
	ldr r4, _02238504 ; =0x00000351
	lsl r2, r2, #3
	add r2, r0, r2
	ldr r2, [r2, #8]
	mov r1, #0
	add r3, r4, #1
	sub r5, r4, #1
_022384D6:
	ldrb r7, [r0, r5]
	ldrb r6, [r2]
	cmp r7, r6
	bne _022384EE
	ldrb r7, [r0, r4]
	ldrb r6, [r2, #1]
	cmp r7, r6
	bne _022384EE
	ldrb r7, [r0, r3]
	ldrb r6, [r2, #2]
	cmp r7, r6
	beq _022384F4
_022384EE:
	mov r0, #1
	pop {r4, r5, r6, r7}
	bx lr
_022384F4:
	add r1, r1, #1
	add r2, r2, #3
	add r0, #0x10
	cmp r1, #8
	blt _022384D6
	mov r0, #0
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
_02238504: .word 0x00000351
	thumb_func_end ov57_022384C0

	thumb_func_start ov57_02238508
ov57_02238508: ; 0x02238508
	push {r3, r4, r5, lr}
	add r5, r0, #0
	lsl r4, r1, #4
	mov r0, #0xd5
	add r1, r5, r4
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	add r1, sp, #0
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	add r2, sp, #0
	mov r0, #2
	ldrsh r1, [r2, r0]
	ldr r0, _02238538 ; =0x00000351
	add r3, r5, r4
	strb r1, [r3, r0]
	mov r1, #0
	ldrsh r1, [r2, r1]
	add r0, r0, #1
	strb r1, [r3, r0]
	pop {r3, r4, r5, pc}
	nop
_02238538: .word 0x00000351
	thumb_func_end ov57_02238508

	thumb_func_start ov57_0223853C
ov57_0223853C: ; 0x0223853C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	mov r3, #0x35
	add r7, r0, #0
	lsl r3, r3, #4
	mov r0, #0
	add r1, r7, #0
	add r2, sp, #0
	add r4, r3, #1
	add r5, r3, #2
_02238550:
	ldrb r6, [r1, r3]
	add r0, r0, #1
	strb r6, [r2]
	ldrb r6, [r1, r4]
	strb r6, [r2, #1]
	ldrb r6, [r1, r5]
	add r1, #0x10
	strb r6, [r2, #2]
	add r2, r2, #3
	cmp r0, #8
	blt _02238550
	ldr r0, [r7]
	mov r2, #0xfb
	lsl r2, r2, #2
	ldr r0, [r0, #0x20]
	ldr r2, [r7, r2]
	add r1, sp, #0
	bl SealCase_SetCapsuleI
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov57_0223853C

	thumb_func_start ov57_0223857C
ov57_0223857C: ; 0x0223857C
	push {r3, r4, r5, r6}
	mov r3, #0x35
	lsl r3, r3, #4
	mov r2, #0
	add r4, r3, #1
	add r5, r3, #2
_02238588:
	ldrb r6, [r1, r3]
	add r2, r2, #1
	strb r6, [r0]
	ldrb r6, [r1, r4]
	strb r6, [r0, #1]
	ldrb r6, [r1, r5]
	add r1, #0x10
	strb r6, [r0, #2]
	add r0, r0, #3
	cmp r2, #8
	blt _02238588
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
	thumb_func_end ov57_0223857C

	thumb_func_start ov57_022385A4
ov57_022385A4: ; 0x022385A4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	add r0, r1, #0
	add r1, sp, #0
	add r4, r2, #0
	add r1, #2
	add r2, sp, #0
	add r6, r3, #0
	bl sub_0200DE44
	add r1, sp, #0
	mov r0, #0
	ldrsh r2, [r1, r0]
	sub r2, r2, r6
	strb r2, [r5]
	ldrsh r0, [r1, r0]
	add r0, r0, r6
	strb r0, [r5, #1]
	mov r0, #2
	ldrsh r2, [r1, r0]
	sub r2, r2, r4
	strb r2, [r5, #2]
	ldrsh r0, [r1, r0]
	add r0, r0, r4
	strb r0, [r5, #3]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov57_022385A4

	thumb_func_start ov57_022385DC
ov57_022385DC: ; 0x022385DC
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0x15
	str r0, [sp]
	mov r0, #0x1e
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0x3a
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r0, #0xe4
	add r1, r4, #0
	mov r2, #1
	ldr r0, [r0]
	add r1, #0xec
	add r3, r2, #0
	bl ov57_02239814
	mov r0, #0x15
	str r0, [sp]
	mov r0, #0x14
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r1, #0x3a
	add r0, r4, #0
	str r1, [sp, #0xc]
	add r0, #0xe4
	add r1, #0xe2
	mov r2, #1
	ldr r0, [r0]
	add r1, r4, r1
	add r3, r2, #0
	bl ov57_02239814
	mov r0, #0x15
	str r0, [sp]
	mov r0, #8
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r1, #0x76
	add r0, r4, #0
	str r1, [sp, #0xc]
	add r0, #0xe4
	add r1, #0x96
	ldr r0, [r0]
	add r1, r4, r1
	mov r2, #1
	mov r3, #0x17
	bl ov57_02239814
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov57_022385DC

	thumb_func_start ov57_0223864C
ov57_0223864C: ; 0x0223864C
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xec
	bl RemoveWindow
	mov r0, #0x47
	lsl r0, r0, #2
	add r0, r4, r0
	bl RemoveWindow
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r4, r0
	bl RemoveWindow
	pop {r4, pc}
	thumb_func_end ov57_0223864C

	thumb_func_start ov57_0223866C
ov57_0223866C: ; 0x0223866C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	cmp r1, #0
	beq _022386DC
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xb
	mov r3, #0x34
	bl NewMsgDataFromNarc
	mov r1, #0x11
	add r6, r0, #0
	bl NewString_ReadMsgData
	add r4, r0, #0
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #4
	add r1, r4, #0
	mov r2, #0
	bl FontID_String_GetWidth
	mov r1, #0x40
	sub r3, r1, r0
	mov r2, #0
	str r2, [sp]
	mov r1, #0xff
	str r1, [sp, #4]
	ldr r0, _022386EC ; =0x00010F00
	add r1, #0xd
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	add r0, r5, r1
	mov r1, #4
	add r2, r4, #0
	lsr r3, r3, #1
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl String_dtor
	add r0, r6, #0
	bl DestroyMsgData
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, r5, r6, pc}
_022386DC:
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	bl ClearWindowTilemapAndScheduleTransfer
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_022386EC: .word 0x00010F00
	thumb_func_end ov57_0223866C

	thumb_func_start ov57_022386F0
ov57_022386F0: ; 0x022386F0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #2
	mov r1, #0x34
	bl sub_02013534
	mov r1, #0x97
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #2
	mov r1, #0x34
	bl FontID_Alloc
	mov r0, #4
	mov r1, #0x34
	bl FontID_Alloc
	pop {r4, pc}
	thumb_func_end ov57_022386F0

	thumb_func_start ov57_02238714
ov57_02238714: ; 0x02238714
	push {r4, lr}
	add r4, r0, #0
	mov r0, #4
	bl FontID_Release
	mov r0, #2
	bl FontID_Release
	mov r0, #0x26
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02013660
	mov r0, #0x9a
	lsl r0, r0, #2
	add r0, r4, r0
	bl sub_02021B5C
	mov r0, #0x99
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02013660
	mov r0, #0x9d
	lsl r0, r0, #2
	add r0, r4, r0
	bl sub_02021B5C
	mov r0, #0x97
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_020135AC
	pop {r4, pc}
	thumb_func_end ov57_02238714

	thumb_func_start ov57_02238758
ov57_02238758: ; 0x02238758
	push {r3, lr}
	sub sp, #0x18
	add r3, r0, #0
	mov r0, #0x10
	str r0, [sp]
	mov r0, #8
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	ldr r0, _02238790 ; =0x00007530
	add r2, r3, #0
	str r0, [sp, #0x14]
	add r0, r3, #0
	add r0, #0xe8
	add r2, #0xdc
	add r3, #0xe0
	ldr r0, [r0]
	ldr r2, [r2]
	ldr r3, [r3]
	mov r1, #3
	bl sub_0200D644
	add sp, #0x18
	pop {r3, pc}
	.balign 4, 0
_02238790: .word 0x00007530
	thumb_func_end ov57_02238758

	thumb_func_start ov57_02238794
ov57_02238794: ; 0x02238794
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	bl ov57_02238758
	mov r1, #0
	add r0, r4, #0
	mov r2, #0x68
	mov r3, #0xa5
	str r1, [sp]
	bl ov57_022387E0
	mov r0, #0
	str r0, [sp]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xc0
	mov r3, #0xa5
	bl ov57_022387E0
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov57_02238794

	thumb_func_start ov57_022387C0
ov57_022387C0: ; 0x022387C0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x26
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r4, r1, #0
	bl sub_020137C0
	mov r0, #0x99
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl sub_020137C0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov57_022387C0

	thumb_func_start ov57_022387E0
ov57_022387E0: ; 0x022387E0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	add r5, r0, #0
	add r4, r1, #0
	str r2, [sp, #0x10]
	add r7, r3, #0
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xb
	mov r3, #0x34
	bl NewMsgDataFromNarc
	add r1, r4, #5
	str r0, [sp, #0x14]
	bl NewString_ReadMsgData
	str r0, [sp, #0x18]
	add r0, sp, #0x1c
	bl InitWindow
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0xe4
	ldr r0, [r0]
	add r1, sp, #0x1c
	mov r2, #0xa
	mov r3, #2
	bl AddTextWindowTopLeftCorner
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _022388DC ; =0x000F0D02
	ldr r2, [sp, #0x18]
	str r0, [sp, #8]
	add r0, sp, #0x1c
	mov r1, #2
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, sp, #0x1c
	mov r1, #2
	mov r2, #0x34
	bl sub_02013688
	mov r3, #0x9a
	lsl r3, r3, #2
	mov r1, #0xc
	add r6, r4, #0
	mul r6, r1
	add r3, r5, r3
	mov r1, #1
	mov r2, #2
	add r3, r3, r6
	bl sub_02021AC8
	mov r0, #0x97
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	str r0, [sp, #0x2c]
	add r0, sp, #0x1c
	str r0, [sp, #0x30]
	add r0, r5, #0
	add r0, #0xe0
	ldr r0, [r0]
	bl sub_0200E2B0
	str r0, [sp, #0x34]
	add r0, r5, #0
	add r0, #0xe0
	ldr r0, [r0]
	ldr r1, _022388E0 ; =0x00007530
	bl sub_0200D934
	str r0, [sp, #0x38]
	mov r2, #0
	mov r0, #0x9b
	str r2, [sp, #0x3c]
	add r1, r5, r6
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	str r0, [sp, #0x40]
	ldr r1, [sp, #0x18]
	mov r0, #2
	bl FontID_String_GetWidth
	lsr r1, r0, #1
	ldr r0, [sp, #0x10]
	add r7, #0xc0
	sub r0, r0, r1
	str r0, [sp, #0x44]
	mov r0, #1
	str r0, [sp, #0x4c]
	mov r0, #0x28
	str r0, [sp, #0x50]
	mov r0, #2
	str r0, [sp, #0x54]
	mov r0, #0x34
	str r0, [sp, #0x58]
	mov r0, #0x26
	lsl r0, r0, #4
	add r5, r5, r0
	str r7, [sp, #0x48]
	lsl r4, r4, #2
	add r0, sp, #0x2c
	bl sub_020135D8
	str r0, [r5, r4]
	ldr r0, [r5, r4]
	ldr r1, [sp, #0x70]
	bl sub_020138E0
	ldr r0, [sp, #0x18]
	bl String_dtor
	ldr r0, [sp, #0x14]
	bl DestroyMsgData
	add r0, sp, #0x1c
	bl RemoveWindow
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022388DC: .word 0x000F0D02
_022388E0: .word 0x00007530
	thumb_func_end ov57_022387E0

	thumb_func_start ov57_022388E4
ov57_022388E4: ; 0x022388E4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r0, #0
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp]
	add r3, r0, #0
	add r5, r0, #0
	mov r0, #0x45
	lsl r0, r0, #4
_022388F8:
	add r2, r7, r3
	add r3, r3, #1
	strb r5, [r2, r0]
	cmp r3, #8
	blt _022388F8
	lsl r0, r1, #3
	str r0, [sp, #8]
_02238906:
	mov r6, #0
	add r4, r7, #0
_0223890A:
	ldr r0, [r4, #8]
	add r1, r5, #0
	bl SealIsOnCapsule
	cmp r0, #0
	bne _0223891E
	add r6, r6, #1
	add r4, #8
	cmp r6, #0xc
	blt _0223890A
_0223891E:
	add r1, r7, r5
	add r1, #0x80
	ldrb r1, [r1]
	cmp r1, #0
	bne _0223892C
	cmp r0, #1
	bne _0223894E
_0223892C:
	ldr r0, [sp]
	add r1, r0, #1
	ldr r0, [sp, #8]
	str r1, [sp]
	cmp r1, r0
	ble _0223894E
	ldr r0, [sp, #4]
	add r2, r5, #1
	add r1, r7, r0
	mov r0, #0x45
	lsl r0, r0, #4
	strb r2, [r1, r0]
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #8
	bge _02238954
_0223894E:
	add r5, r5, #1
	cmp r5, #0x51
	blt _02238906
_02238954:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov57_022388E4

	thumb_func_start ov57_02238958
ov57_02238958: ; 0x02238958
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r7, r0, #0
	add r0, #0xdc
	ldr r6, [r0]
	add r0, r7, #0
	add r0, #0xe0
	ldr r5, [r0]
	add r0, r7, #0
	add r0, #0xe8
	ldr r0, [r0]
	mov r4, #0
	str r0, [sp, #0x18]
_02238972:
	mov r0, #0x45
	add r1, r7, r4
	lsl r0, r0, #4
	ldrb r0, [r1, r0]
	bl sub_02091054
	add r3, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _022389F0 ; =0x000061A8
	add r1, r5, #0
	add r0, r4, r0
	str r0, [sp, #8]
	add r0, r6, #0
	mov r2, #0x57
	bl sub_0200D4A4
	add r4, r4, #1
	cmp r4, #8
	blt _02238972
	mov r0, #0x57
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	ldr r0, _022389F4 ; =0x00006597
	mov r1, #3
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	add r2, r6, #0
	add r3, r5, #0
	bl sub_0200D644
	mov r0, #1
	str r0, [sp]
	ldr r0, _022389F8 ; =0x0000699D
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r6, #0
	mov r2, #0x57
	mov r3, #0x25
	bl sub_0200D6D4
	mov r0, #1
	str r0, [sp]
	ldr r0, _022389FC ; =0x00006D83
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r6, #0
	mov r2, #0x57
	mov r3, #0x23
	bl sub_0200D704
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_022389F0: .word 0x000061A8
_022389F4: .word 0x00006597
_022389F8: .word 0x0000699D
_022389FC: .word 0x00006D83
	thumb_func_end ov57_02238958

	thumb_func_start ov57_02238A00
ov57_02238A00: ; 0x02238A00
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x58
	add r5, r0, #0
	add r0, #0xdc
	ldr r0, [r0]
	mov r4, #0
	str r0, [sp]
	add r0, r5, #0
	add r0, #0xe0
	ldr r7, [r0]
	add r0, sp, #4
	strh r4, [r0, #0x20]
	strh r4, [r0, #0x22]
	strh r4, [r0, #0x24]
	strh r4, [r0, #0x26]
	mov r0, #0x3c
	str r0, [sp, #0x2c]
	mov r0, #2
	str r0, [sp, #0x34]
	mov r0, #1
	str r0, [sp, #0x50]
	sub r0, r0, #2
	str r0, [sp, #0x48]
	str r0, [sp, #0x4c]
	ldr r0, _02238AA8 ; =0x00006597
	str r4, [sp, #0x54]
	str r0, [sp, #0x3c]
	ldr r0, _02238AAC ; =0x0000699D
	str r4, [sp, #0x30]
	str r0, [sp, #0x40]
	ldr r0, _02238AB0 ; =0x00006D83
	str r0, [sp, #0x44]
	ldr r0, _02238AB4 ; =0x00000414
	add r6, r5, r0
_02238A44:
	ldr r0, _02238AB8 ; =0x000061A8
	add r1, r7, #0
	add r0, r4, r0
	str r0, [sp, #0x38]
	ldr r0, [sp]
	add r2, sp, #0x24
	bl sub_0200D734
	add r4, r4, #1
	stmia r6!, {r0}
	cmp r4, #8
	blt _02238A44
	ldr r3, _02238ABC ; =ov57_0223BDD4
	add r2, sp, #4
	mov r1, #0x10
_02238A62:
	ldrh r0, [r3]
	add r3, r3, #2
	strh r0, [r2]
	add r2, r2, #2
	sub r1, r1, #1
	bne _02238A62
	ldr r7, _02238AB4 ; =0x00000414
	mov r6, #0
	add r4, sp, #4
_02238A74:
	mov r2, #2
	ldrsh r2, [r4, r2]
	ldr r0, _02238AB4 ; =0x00000414
	mov r1, #0
	sub r2, r2, #1
	lsl r2, r2, #0x10
	ldrsh r1, [r4, r1]
	ldr r0, [r5, r0]
	asr r2, r2, #0x10
	bl sub_0200DDB8
	ldr r0, _02238AB4 ; =0x00000414
	ldr r0, [r5, r0]
	bl sub_0200DC18
	ldr r0, [r5, r7]
	mov r1, #0
	bl sub_0200DCC0
	add r6, r6, #1
	add r4, r4, #4
	add r5, r5, #4
	cmp r6, #8
	blt _02238A74
	add sp, #0x58
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02238AA8: .word 0x00006597
_02238AAC: .word 0x0000699D
_02238AB0: .word 0x00006D83
_02238AB4: .word 0x00000414
_02238AB8: .word 0x000061A8
_02238ABC: .word ov57_0223BDD4
	thumb_func_end ov57_02238A00

	thumb_func_start ov57_02238AC0
ov57_02238AC0: ; 0x02238AC0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r7, _02238AE8 ; =0x00000414
	mov r4, #0
	add r5, r6, #0
_02238ACA:
	add r0, r6, #0
	add r0, #0xe0
	ldr r1, _02238AEC ; =0x000061A8
	ldr r0, [r0]
	add r1, r4, r1
	bl sub_0200D958
	ldr r0, [r5, r7]
	bl sub_0200D9DC
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #8
	blt _02238ACA
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02238AE8: .word 0x00000414
_02238AEC: .word 0x000061A8
	thumb_func_end ov57_02238AC0

	thumb_func_start ov57_02238AF0
ov57_02238AF0: ; 0x02238AF0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x38
	mul r0, r1
	lsl r0, r0, #0x10
	asr r7, r0, #0x10
	lsl r0, r1, #4
	neg r0, r0
	lsl r0, r0, #0x10
	asr r6, r0, #0x10
	mov r4, #0
_02238B06:
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02238B1E
	mov r0, #0xd5
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r7, #0
	add r2, r6, #0
	bl sub_0200DED0
_02238B1E:
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #8
	blt _02238B06
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov57_02238AF0

	thumb_func_start ov57_02238B28
ov57_02238B28: ; 0x02238B28
	push {r3, lr}
	sub sp, #8
	mov r2, #2
	mov r1, #0
	ldr r0, _02238B44 ; =ov57_02238B48
	str r2, [sp]
	str r0, [sp, #4]
	mov r0, #0x34
	add r3, r1, #0
	bl GF_3DVramMan_Create
	add sp, #8
	pop {r3, pc}
	nop
_02238B44: .word ov57_02238B48
	thumb_func_end ov57_02238B28

	thumb_func_start ov57_02238B48
ov57_02238B48: ; 0x02238B48
	push {r3, lr}
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	ldr r0, _02238BB4 ; =0x04000008
	mov r1, #3
	ldrh r2, [r0]
	bic r2, r1
	mov r1, #1
	orr r1, r2
	strh r1, [r0]
	add r0, #0x58
	ldrh r2, [r0]
	ldr r1, _02238BB8 ; =0xFFFFCFFD
	and r2, r1
	strh r2, [r0]
	add r2, r1, #2
	ldrh r3, [r0]
	add r1, r1, #2
	and r3, r2
	mov r2, #0x10
	orr r2, r3
	strh r2, [r0]
	ldrh r3, [r0]
	ldr r2, _02238BBC ; =0x0000CFFB
	and r3, r2
	strh r3, [r0]
	ldrh r3, [r0]
	sub r2, #0x1c
	and r3, r1
	mov r1, #8
	orr r1, r3
	strh r1, [r0]
	ldrh r1, [r0]
	and r1, r2
	strh r1, [r0]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl G3X_SetFog
	mov r0, #0
	ldr r2, _02238BC0 ; =0x00007FFF
	add r1, r0, #0
	mov r3, #0x3f
	str r0, [sp]
	bl G3X_SetClearColor
	ldr r1, _02238BC4 ; =0xBFFF0000
	ldr r0, _02238BC8 ; =0x04000580
	str r1, [r0]
	pop {r3, pc}
	.balign 4, 0
_02238BB4: .word 0x04000008
_02238BB8: .word 0xFFFFCFFD
_02238BBC: .word 0x0000CFFB
_02238BC0: .word 0x00007FFF
_02238BC4: .word 0xBFFF0000
_02238BC8: .word 0x04000580
	thumb_func_end ov57_02238B48

	thumb_func_start ov57_02238BCC
ov57_02238BCC: ; 0x02238BCC
	push {r3, r4, r5, lr}
	ldr r3, _02238C04 ; =NNS_GfdDefaultFuncAllocTexVram
	mov r0, #2
	mov r1, #0
	ldr r3, [r3]
	lsl r0, r0, #0xe
	add r2, r1, #0
	blx r3
	ldr r3, _02238C08 ; =NNS_GfdDefaultFuncAllocPlttVram
	mov r1, #0
	add r4, r0, #0
	ldr r3, [r3]
	mov r0, #0x80
	add r2, r1, #0
	blx r3
	add r5, r0, #0
	cmp r4, #0
	bne _02238BF4
	bl GF_AssertFail
_02238BF4:
	cmp r5, #0
	bne _02238BFC
	bl GF_AssertFail
_02238BFC:
	bl sub_02014DA0
	pop {r3, r4, r5, pc}
	nop
_02238C04: .word NNS_GfdDefaultFuncAllocTexVram
_02238C08: .word NNS_GfdDefaultFuncAllocPlttVram
	thumb_func_end ov57_02238BCC

	thumb_func_start ov57_02238C0C
ov57_02238C0C: ; 0x02238C0C
	push {r3, lr}
	bl sub_02026E48
	bl sub_0201543C
	cmp r0, #0
	ble _02238C22
	bl sub_02026E48
	bl NNS_G2dSetupSoftwareSpriteCamera
_02238C22:
	bl sub_02015460
	mov r0, #1
	mov r1, #0
	bl sub_02026E50
	pop {r3, pc}
	thumb_func_end ov57_02238C0C

	thumb_func_start ov57_02238C30
ov57_02238C30: ; 0x02238C30
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	add r7, r3, #0
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x58]
	add r0, r7, #0
	bl ov57_0223A0A8
	cmp r0, #3
	bhi _02238CA2
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02238C50: ; jump table
	.short _02238C58 - _02238C50 - 2 ; case 0
	.short _02238C68 - _02238C50 - 2 ; case 1
	.short _02238C7C - _02238C50 - 2 ; case 2
	.short _02238C90 - _02238C50 - 2 ; case 3
_02238C58:
	mov r0, #0
	str r0, [sp, #0x18]
	mov r0, #4
	str r0, [sp, #0x1c]
	mov r0, #1
	mov r4, #6
	str r0, [sp, #0x20]
	b _02238CA2
_02238C68:
	mov r0, #2
	str r0, [sp, #0x18]
	mov r0, #0
	str r0, [sp, #0x1c]
	mov r0, #4
	str r0, [sp, #0x20]
	mov r0, #1
	mov r4, #8
	str r0, [sp, #0x24]
	b _02238CA2
_02238C7C:
	mov r0, #3
	str r0, [sp, #0x18]
	mov r0, #0
	str r0, [sp, #0x1c]
	mov r0, #4
	str r0, [sp, #0x20]
	mov r0, #1
	mov r4, #8
	str r0, [sp, #0x24]
	b _02238CA2
_02238C90:
	mov r0, #2
	str r0, [sp, #0x18]
	mov r0, #0
	str r0, [sp, #0x1c]
	mov r0, #4
	str r0, [sp, #0x20]
	mov r0, #1
	mov r4, #8
	str r0, [sp, #0x24]
_02238CA2:
	lsr r0, r4, #0x1f
	add r0, r4, r0
	asr r0, r0, #1
	mov r1, #0x34
	str r0, [sp, #0x14]
	bl ListMenuItems_ctor
	mov r1, #0x6f
	lsl r1, r1, #2
	str r0, [r7, r1]
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xb
	mov r3, #0x34
	bl NewMsgDataFromNarc
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	mov r6, #0
	cmp r0, #0
	ble _02238D04
	add r5, sp, #0x18
_02238CCE:
	ldr r1, [r5]
	ldr r0, [sp, #0x10]
	lsl r2, r1, #3
	ldr r1, _02238D74 ; =ov57_0223BECC
	ldr r1, [r1, r2]
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r2, [r5]
	mov r0, #0x6f
	lsl r3, r2, #3
	ldr r2, _02238D74 ; =ov57_0223BECC
	lsl r0, r0, #2
	add r2, r2, r3
	ldr r0, [r7, r0]
	ldr r2, [r2, #4]
	add r1, r4, #0
	bl ListMenuItems_AddItem
	add r0, r4, #0
	bl String_dtor
	ldr r0, [sp, #0x14]
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, r0
	blt _02238CCE
_02238D04:
	ldr r0, [sp, #0x10]
	bl DestroyMsgData
	add r0, sp, #0x28
	mov r1, #0
	mov r2, #0x18
	bl MI_CpuFill8
	ldr r2, _02238D78 ; =ov57_0223BD7C
	add r0, sp, #0x18
	ldrh r3, [r2]
	add r1, sp, #0x28
	strh r3, [r0, #0x10]
	ldrh r3, [r2, #2]
	strh r3, [r0, #0x12]
	ldrh r3, [r2, #4]
	strh r3, [r0, #0x14]
	ldrh r3, [r2, #6]
	strh r3, [r0, #0x16]
	ldrh r3, [r2, #8]
	ldrh r2, [r2, #0xa]
	strh r3, [r0, #0x18]
	strh r2, [r0, #0x1a]
	mov r0, #0x6f
	lsl r0, r0, #2
	ldr r2, [r7, r0]
	add r0, #0x8c
	str r2, [sp, #0x34]
	ldr r2, [sp, #0xc]
	str r2, [sp, #0x38]
	ldr r2, [sp, #0x14]
	lsl r3, r2, #1
	strb r2, [r1, #0x14]
	add r3, r2, r3
	mov r2, #0x17
	sub r2, r2, r3
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	str r2, [sp]
	mov r2, #8
	str r2, [sp, #4]
	mov r2, #0
	str r2, [sp, #8]
	ldr r2, _02238D7C ; =0x0000040C
	ldr r0, [r7, r0]
	ldr r2, [r7, r2]
	mov r3, #0x16
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl sub_020185FC
	mov r1, #0x93
	lsl r1, r1, #2
	str r0, [r7, r1]
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02238D74: .word ov57_0223BECC
_02238D78: .word ov57_0223BD7C
_02238D7C: .word 0x0000040C
	thumb_func_end ov57_02238C30

	thumb_func_start ov57_02238D80
ov57_02238D80: ; 0x02238D80
	push {r4, lr}
	mov r1, #0x93
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r0, #0x27
	ldrb r0, [r0]
	lsl r0, r0, #0x18
	lsr r2, r0, #0x19
	ldr r0, _02238DA8 ; =0x0000040C
	str r2, [r4, r0]
	ldr r0, [r4, r1]
	bl sub_02018680
	mov r0, #0x6f
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ListMenuItems_dtor
	pop {r4, pc}
	.balign 4, 0
_02238DA8: .word 0x0000040C
	thumb_func_end ov57_02238D80

	thumb_func_start ov57_02238DAC
ov57_02238DAC: ; 0x02238DAC
	push {r4, r5}
	lsr r5, r0, #0x1f
	lsl r4, r0, #0x1e
	sub r4, r4, r5
	mov r3, #0x1e
	ror r4, r3
	add r4, r5, r4
	mov r3, #0x38
	mul r3, r4
	add r3, #0x28
	strh r3, [r1]
	asr r1, r0, #2
	mov r0, #0x35
	mul r0, r1
	add r0, #0x1b
	strh r0, [r2]
	pop {r4, r5}
	bx lr
	thumb_func_end ov57_02238DAC

	thumb_func_start ov57_02238DD0
ov57_02238DD0: ; 0x02238DD0
	push {r4, r5, r6, lr}
	sub sp, #0x18
	add r1, r0, #0
	add r1, #0xdc
	ldr r4, [r1]
	add r1, r0, #0
	add r1, #0xe0
	add r0, #0xe8
	ldr r5, [r1]
	ldr r6, [r0]
	bl sub_02074490
	mov r1, #0x14
	str r1, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #3
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	mov r0, #0xfa
	lsl r0, r0, #6
	str r0, [sp, #0x14]
	add r0, r6, #0
	mov r1, #2
	add r2, r4, #0
	add r3, r5, #0
	bl sub_0200D644
	bl sub_0207449C
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _02238E40 ; =0x00004268
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0x14
	bl sub_0200D6D4
	bl sub_020744A8
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _02238E44 ; =0x00004650
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0x14
	bl sub_0200D704
	add sp, #0x18
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02238E40: .word 0x00004268
_02238E44: .word 0x00004650
	thumb_func_end ov57_02238DD0

	thumb_func_start ov57_02238E48
ov57_02238E48: ; 0x02238E48
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	add r5, r0, #0
	ldr r1, [r5]
	mov r6, #0
	ldr r0, [r1]
	cmp r0, #0
	ble _02238F36
	str r6, [sp, #0xc]
	add r4, r5, #0
_02238E5C:
	ldr r0, [sp, #0xc]
	add r0, r1, r0
	ldr r7, [r0, #4]
	add r0, r7, #0
	bl Pokemon_GetIconNaix
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _02238F3C ; =0x00003A98
	add r1, r5, #0
	add r0, r6, r0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0xdc
	add r1, #0xe0
	ldr r0, [r0]
	ldr r1, [r1]
	mov r2, #0x14
	bl sub_0200E188
	mov r1, #0
	add r0, sp, #0x18
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	mov r0, #0xa
	str r0, [sp, #0x20]
	add r0, r1, #0
	str r0, [sp, #0x24]
	mov r0, #1
	str r0, [sp, #0x28]
	mov r0, #2
	str r0, [sp, #0x44]
	add r0, r1, #0
	str r0, [sp, #0x48]
	ldr r0, _02238F3C ; =0x00003A98
	add r2, sp, #0x18
	add r0, r6, r0
	str r0, [sp, #0x2c]
	mov r0, #0xfa
	lsl r0, r0, #6
	str r0, [sp, #0x30]
	ldr r0, _02238F40 ; =0x00004268
	str r0, [sp, #0x34]
	ldr r0, _02238F44 ; =0x00004650
	str r0, [sp, #0x38]
	sub r0, r1, #1
	str r0, [sp, #0x3c]
	sub r0, r1, #1
	str r0, [sp, #0x40]
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0xdc
	add r1, #0xe0
	ldr r0, [r0]
	ldr r1, [r1]
	bl sub_0200D734
	mov r1, #0xc9
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r7, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x10]
	add r0, r7, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x14]
	add r0, r7, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	add r1, r0, #0
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0x14]
	bl GetMonIconPaletteEx
	add r1, r0, #0
	mov r0, #0xc9
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r0, [r0]
	bl sub_02024AA8
	mov r0, #0xc9
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_0200DC4C
	ldr r0, [sp, #0xc]
	ldr r1, [r5]
	add r0, r0, #4
	str r0, [sp, #0xc]
	ldr r0, [r1]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, r0
	blt _02238E5C
_02238F36:
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	nop
_02238F3C: .word 0x00003A98
_02238F40: .word 0x00004268
_02238F44: .word 0x00004650
	thumb_func_end ov57_02238E48

	thumb_func_start ov57_02238F48
ov57_02238F48: ; 0x02238F48
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6]
	mov r4, #0
	ldr r0, [r0]
	cmp r0, #0
	ble _02238F70
	mov r7, #0xc9
	add r5, r6, #0
	lsl r7, r7, #2
_02238F5C:
	ldr r0, [r5, r7]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r6]
	add r4, r4, #1
	ldr r0, [r0]
	add r5, r5, #4
	cmp r4, r0
	blt _02238F5C
_02238F70:
	mov r5, #0
	add r4, r6, #0
_02238F74:
	ldr r7, [r4, #4]
	cmp r7, #0xff
	beq _02238FB8
	add r1, sp, #0
	add r0, r5, #0
	add r1, #2
	add r2, sp, #0
	bl ov57_02238DAC
	add r2, sp, #0
	mov r1, #2
	ldrsh r1, [r2, r1]
	add r3, r2, #0
	mov r2, #0
	ldrsh r2, [r3, r2]
	lsl r0, r7, #2
	add r7, r6, r0
	mov r0, #0xc9
	lsl r0, r0, #2
	sub r1, #0x10
	add r2, #0xc
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	ldr r0, [r7, r0]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl sub_0200DDB8
	mov r0, #0xc9
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	mov r1, #1
	bl sub_0200DCE8
_02238FB8:
	add r5, r5, #1
	add r4, #8
	cmp r5, #0xc
	blt _02238F74
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov57_02238F48

	thumb_func_start ov57_02238FC4
ov57_02238FC4: ; 0x02238FC4
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6]
	mov r4, #0
	ldr r0, [r0]
	cmp r0, #0
	ble _02238FEA
	mov r7, #0xc9
	add r5, r6, #0
	lsl r7, r7, #2
_02238FD8:
	ldr r0, [r5, r7]
	bl sub_0200DC18
	ldr r0, [r6]
	add r4, r4, #1
	ldr r0, [r0]
	add r5, r5, #4
	cmp r4, r0
	blt _02238FD8
_02238FEA:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov57_02238FC4

	thumb_func_start ov57_02238FEC
ov57_02238FEC: ; 0x02238FEC
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6]
	mov r4, #0
	ldr r0, [r0]
	cmp r0, #0
	ble _02239012
	mov r7, #0xc9
	add r5, r6, #0
	lsl r7, r7, #2
_02239000:
	ldr r0, [r5, r7]
	bl sub_0200D9DC
	ldr r0, [r6]
	add r4, r4, #1
	ldr r0, [r0]
	add r5, r5, #4
	cmp r4, r0
	blt _02239000
_02239012:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov57_02238FEC

	thumb_func_start ov57_02239014
ov57_02239014: ; 0x02239014
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r6, #0
	add r4, r7, #0
	add r5, r7, #0
_0223901E:
	ldr r0, [r4, #8]
	bl ov57_0223A07C
	mov r1, #0x29
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r0, #0xa3
	ldr r1, [r4, #4]
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _0223904C
	mov r0, #0xa3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0xff
	beq _0223904C
	add r0, r7, #0
	add r1, r6, #0
	bl ov57_0223BC4C
_0223904C:
	add r6, r6, #1
	add r4, #8
	add r5, #0xc
	cmp r6, #0xc
	blt _0223901E
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov57_02239014

	thumb_func_start ov57_02239058
ov57_02239058: ; 0x02239058
	push {r3, r4, r5, r6, lr}
	sub sp, #0x4c
	add r4, r0, #0
	mov r0, #0x34
	bl sub_0200CF18
	add r2, sp, #0x2c
	ldr r5, _022390E8 ; =ov57_0223BDB4
	str r0, [r4, #8]
	ldmia r5!, {r0, r1}
	add r3, r2, #0
	stmia r2!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r5!, {r0, r1}
	ldr r6, _022390EC ; =ov57_0223BD88
	stmia r2!, {r0, r1}
	add r5, sp, #0x18
	ldmia r6!, {r0, r1}
	add r2, r5, #0
	stmia r5!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	ldr r0, [r6]
	add r1, r3, #0
	str r0, [r5]
	ldr r0, [r4, #8]
	mov r3, #0x20
	bl sub_0200CF70
	ldr r3, _022390F0 ; =ov57_0223BD9C
	add r2, sp, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r4, #8]
	bl sub_0200CF38
	str r0, [r4, #0xc]
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	mov r2, #0x80
	bl sub_0200CFF4
	cmp r0, #0
	bne _022390C2
	bl GF_AssertFail
_022390C2:
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	add r2, sp, #0
	bl sub_0200D3F8
	cmp r0, #0
	bne _022390D4
	bl GF_AssertFail
_022390D4:
	ldr r1, [r4, #0x14]
	mov r0, #0x34
	bl sub_02018424
	mov r1, #0x5d
	lsl r1, r1, #2
	str r0, [r4, r1]
	add sp, #0x4c
	pop {r3, r4, r5, r6, pc}
	nop
_022390E8: .word ov57_0223BDB4
_022390EC: .word ov57_0223BD88
_022390F0: .word ov57_0223BD9C
	thumb_func_end ov57_02239058

	thumb_func_start ov57_022390F4
ov57_022390F4: ; 0x022390F4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x5d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02018474
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	bl sub_0200D998
	ldr r0, [r4, #8]
	bl sub_0200D108
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov57_022390F4

	thumb_func_start ov57_02239114
ov57_02239114: ; 0x02239114
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	add r4, r1, #0
	str r0, [sp, #4]
	ldr r0, _02239178 ; =0x0000AFC8
	add r1, r5, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0xdc
	add r1, #0xe0
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, r4, #0
	mov r3, #0xe
	bl sub_0200D504
	mov r0, #1
	str r0, [sp]
	ldr r0, _0223917C ; =0x0000B798
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0xdc
	add r1, #0xe0
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, r4, #0
	mov r3, #0x10
	bl sub_0200D6EC
	mov r0, #1
	str r0, [sp]
	ldr r0, _02239180 ; =0x0000BB80
	add r2, r4, #0
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0xdc
	add r5, #0xe0
	ldr r0, [r0]
	ldr r1, [r5]
	mov r3, #0xf
	bl sub_0200D71C
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02239178: .word 0x0000AFC8
_0223917C: .word 0x0000B798
_02239180: .word 0x0000BB80
	thumb_func_end ov57_02239114

	thumb_func_start ov57_02239184
ov57_02239184: ; 0x02239184
	push {r4, r5, r6, r7, lr}
	sub sp, #0x64
	ldr r4, _02239208 ; =ov57_0223BE18
	add r6, r0, #0
	add r3, sp, #0
	mov r2, #6
_02239190:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02239190
	mov r7, #0
	add r4, sp, #0
	add r5, r6, #0
_0223919E:
	ldr r1, [r4]
	add r0, sp, #0
	strh r1, [r0, #0x30]
	ldr r1, [r4, #4]
	add r2, sp, #0x30
	strh r1, [r0, #0x32]
	mov r1, #0
	strh r1, [r0, #0x34]
	strh r1, [r0, #0x36]
	mov r0, #0x28
	str r0, [sp, #0x38]
	mov r0, #2
	str r0, [sp, #0x3c]
	str r0, [sp, #0x40]
	mov r0, #1
	str r0, [sp, #0x5c]
	add r0, r1, #0
	str r0, [sp, #0x60]
	ldr r0, _0223920C ; =0x0000AFC8
	str r0, [sp, #0x44]
	ldr r0, _02239210 ; =0x00006594
	str r0, [sp, #0x48]
	ldr r0, _02239214 ; =0x0000B798
	str r0, [sp, #0x4c]
	ldr r0, _02239218 ; =0x0000BB80
	str r0, [sp, #0x50]
	sub r0, r1, #1
	str r0, [sp, #0x54]
	sub r0, r1, #1
	str r0, [sp, #0x58]
	add r0, r6, #0
	add r1, r6, #0
	add r0, #0xdc
	add r1, #0xe0
	ldr r0, [r0]
	ldr r1, [r1]
	bl sub_0200D734
	mov r1, #0xcf
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r0, [r5, r0]
	ldr r1, [r4, #8]
	bl sub_0200E0C0
	add r7, r7, #1
	add r4, #0xc
	add r5, r5, #4
	cmp r7, #4
	blt _0223919E
	add sp, #0x64
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02239208: .word ov57_0223BE18
_0223920C: .word 0x0000AFC8
_02239210: .word 0x00006594
_02239214: .word 0x0000B798
_02239218: .word 0x0000BB80
	thumb_func_end ov57_02239184

	thumb_func_start ov57_0223921C
ov57_0223921C: ; 0x0223921C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0xd8
	ldr r0, [r0]
	cmp r0, #0
	beq _0223923C
	mov r6, #0xcf
	mov r4, #0
	lsl r6, r6, #2
_0223922E:
	ldr r0, [r5, r6]
	bl sub_0200DC18
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0223922E
_0223923C:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov57_0223921C

	thumb_func_start ov57_02239240
ov57_02239240: ; 0x02239240
	push {r3, r4, r5, r6, r7, lr}
	mov r7, #0xcf
	add r5, r0, #0
	add r6, r1, #0
	mov r4, #0
	lsl r7, r7, #2
_0223924C:
	ldr r0, [r5, r7]
	add r1, r6, #0
	bl sub_0200DCE8
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0223924C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov57_02239240

	thumb_func_start ov57_02239260
ov57_02239260: ; 0x02239260
	push {r4, r5, r6, lr}
	mov r6, #0xcf
	add r5, r0, #0
	mov r4, #0
	lsl r6, r6, #2
_0223926A:
	ldr r0, [r5, r6]
	bl sub_0200D9DC
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0223926A
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov57_02239260

	thumb_func_start ov57_0223927C
ov57_0223927C: ; 0x0223927C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r7, r2, #0
	mov r2, #1
	str r2, [sp]
	ldr r2, [sp, #0x3c]
	ldr r4, [sp, #0x48]
	str r2, [sp, #4]
	ldr r2, _022392F0 ; =0x00002AF8
	add r5, r0, #0
	add r2, r3, r2
	str r2, [sp, #8]
	add r2, r4, #0
	add r6, r1, #0
	bl sub_0200D504
	ldr r0, [sp, #0x30]
	str r4, [sp]
	str r0, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	ldr r1, [sp, #0x44]
	add r2, r5, #0
	str r1, [sp, #0xc]
	ldr r1, [sp, #0x3c]
	add r3, r6, #0
	str r1, [sp, #0x10]
	ldr r1, _022392F0 ; =0x00002AF8
	add r0, r0, r1
	str r0, [sp, #0x14]
	ldr r1, [sp, #0x40]
	add r0, r7, #0
	bl sub_0200D68C
	mov r0, #1
	str r0, [sp]
	ldr r3, [sp, #0x34]
	ldr r0, _022392F0 ; =0x00002AF8
	add r1, r6, #0
	add r0, r3, r0
	str r0, [sp, #4]
	add r0, r5, #0
	add r2, r4, #0
	bl sub_0200D6EC
	mov r0, #1
	str r0, [sp]
	ldr r3, [sp, #0x38]
	ldr r0, _022392F0 ; =0x00002AF8
	add r1, r6, #0
	add r0, r3, r0
	str r0, [sp, #4]
	add r0, r5, #0
	add r2, r4, #0
	bl sub_0200D71C
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022392F0: .word 0x00002AF8
	thumb_func_end ov57_0223927C

	thumb_func_start ov57_022392F4
ov57_022392F4: ; 0x022392F4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x58
	add r5, r0, #0
	mov r0, #3
	str r0, [sp]
	mov r0, #0x13
	str r0, [sp, #4]
	mov r0, #0x12
	add r4, r1, #0
	str r0, [sp, #8]
	mov r1, #1
	add r2, r5, #0
	str r1, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	add r0, r5, #0
	add r1, r5, #0
	str r4, [sp, #0x18]
	add r0, #0xdc
	add r1, #0xe0
	add r2, #0xe8
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	mov r3, #0x11
	bl ov57_0223927C
	mov r0, #5
	str r0, [sp]
	mov r0, #0x22
	str r0, [sp, #4]
	mov r0, #0x21
	str r0, [sp, #8]
	mov r1, #1
	add r2, r5, #0
	str r1, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	add r0, r5, #0
	add r1, r5, #0
	str r4, [sp, #0x18]
	add r0, #0xdc
	add r1, #0xe0
	add r2, #0xe8
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	mov r3, #0x20
	bl ov57_0223927C
	mov r6, #0
	add r4, r5, #0
	add r7, sp, #0x1c
_02239362:
	mov r0, #0
	strh r0, [r7, #8]
	strh r0, [r7, #0xa]
	strh r0, [r7, #0xc]
	mov r0, #0x29
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r1, r5, #0
	strh r0, [r7, #0xe]
	mov r0, #0x28
	sub r0, r0, r6
	str r0, [sp, #0x2c]
	mov r0, #0
	str r0, [sp, #0x30]
	mov r0, #1
	str r0, [sp, #0x34]
	mov r0, #2
	str r0, [sp, #0x50]
	mov r0, #0
	str r0, [sp, #0x54]
	ldr r0, _022394A0 ; =0x00002B09
	add r1, #0xe0
	str r0, [sp, #0x38]
	sub r0, #0xe
	str r0, [sp, #0x3c]
	ldr r0, _022394A4 ; =0x00002B0B
	add r2, sp, #0x24
	str r0, [sp, #0x40]
	sub r0, r0, #1
	str r0, [sp, #0x44]
	mov r0, #0
	mvn r0, r0
	str r0, [sp, #0x48]
	str r0, [sp, #0x4c]
	add r0, r5, #0
	add r0, #0xdc
	ldr r0, [r0]
	ldr r1, [r1]
	bl sub_0200D734
	mov r1, #0xa5
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r1, sp, #0x20
	add r0, r6, #0
	add r1, #2
	add r2, sp, #0x20
	bl ov57_02238DAC
	mov r0, #0xa5
	mov r1, #6
	mov r2, #4
	lsl r0, r0, #2
	ldrsh r1, [r7, r1]
	ldrsh r2, [r7, r2]
	ldr r0, [r4, r0]
	bl sub_0200DDB8
	add r6, r6, #1
	add r4, #0xc
	cmp r6, #0xc
	blt _02239362
	mov r1, #0
	add r0, sp, #0x1c
	strh r1, [r0, #8]
	strh r1, [r0, #0xa]
	strh r1, [r0, #0xc]
	strh r1, [r0, #0xe]
	mov r0, #0x14
	str r0, [sp, #0x2c]
	mov r0, #1
	str r1, [sp, #0x30]
	str r1, [sp, #0x54]
	ldr r1, _022394A8 ; =0x00002B18
	str r0, [sp, #0x34]
	add r0, r1, #0
	sub r0, #0x1b
	str r0, [sp, #0x3c]
	add r0, r1, #2
	mov r2, #2
	str r0, [sp, #0x40]
	add r0, r1, #1
	str r0, [sp, #0x44]
	sub r0, r2, #3
	str r1, [sp, #0x38]
	add r1, r5, #0
	str r2, [sp, #0x50]
	str r0, [sp, #0x48]
	str r0, [sp, #0x4c]
	add r0, r5, #0
	add r0, #0xdc
	add r1, #0xe0
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, sp, #0x24
	bl sub_0200D734
	mov r1, #0xc7
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0xdc
	add r1, #0xe0
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, sp, #0x24
	bl sub_0200D734
	mov r1, #0x32
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r1, #0xcc
	ldr r0, [r5, r1]
	add r1, sp, #0x1c
	add r1, #2
	add r2, sp, #0x1c
	bl ov57_02238DAC
	mov r0, #0xc7
	lsl r0, r0, #2
	add r3, sp, #0x1c
	mov r1, #2
	mov r2, #0
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	ldr r0, [r5, r0]
	bl sub_0200DDB8
	mov r0, #0x32
	lsl r0, r0, #4
	add r3, sp, #0x1c
	mov r1, #2
	mov r2, #0
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	ldr r0, [r5, r0]
	bl sub_0200DDB8
	mov r0, #0x32
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x19
	bl sub_0200DD68
	mov r0, #0xc7
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_0200DC4C
	mov r0, #0x32
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_0200DC4C
	add sp, #0x58
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022394A0: .word 0x00002B09
_022394A4: .word 0x00002B0B
_022394A8: .word 0x00002B18
	thumb_func_end ov57_022392F4

	thumb_func_start ov57_022394AC
ov57_022394AC: ; 0x022394AC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ov57_02239014
	add r0, r5, #0
	bl ov57_02238F48
	mov r7, #0x29
	lsl r7, r7, #4
	mov r4, #0
	add r6, r7, #4
_022394C2:
	ldr r0, [r5, r6]
	cmp r0, #0
	beq _022394CE
	ldr r1, [r5, r7]
	bl sub_0200DC4C
_022394CE:
	add r4, r4, #1
	add r5, #0xc
	cmp r4, #0xc
	blt _022394C2
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov57_022394AC

	thumb_func_start ov57_022394D8
ov57_022394D8: ; 0x022394D8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r0, #0
	lsl r6, r1, #3
	add r0, r5, r6
	ldr r0, [r0, #4]
	lsl r4, r2, #3
	str r1, [sp]
	add r1, r5, r4
	ldr r7, [r1, #4]
	cmp r0, #0xff
	beq _02239504
	add r1, r2, #1
	str r1, [sp, #0xc]
	ldr r1, [r5]
	lsl r0, r0, #2
	add r0, r1, r0
	ldr r0, [r0, #4]
	mov r1, #0xa2
	add r2, sp, #0xc
	bl SetMonData
_02239504:
	cmp r7, #0xff
	beq _0223951E
	ldr r0, [sp]
	add r2, sp, #8
	add r0, r0, #1
	str r0, [sp, #8]
	ldr r1, [r5]
	lsl r0, r7, #2
	add r0, r1, r0
	ldr r0, [r0, #4]
	mov r1, #0xa2
	bl SetMonData
_0223951E:
	add r2, r5, #4
	ldr r1, [r2, r6]
	ldr r0, [r2, r4]
	add r7, r5, #0
	str r0, [r2, r6]
	str r1, [r2, r4]
	add r7, #8
	ldr r0, [r7, r6]
	add r1, sp, #0x10
	bl CopyCapsule
	add r0, r5, #0
	str r0, [sp, #4]
	add r0, #8
	str r0, [sp, #4]
	ldr r0, [r0, r4]
	ldr r1, [r7, r6]
	bl CopyCapsule
	ldr r1, [sp, #4]
	add r0, sp, #0x10
	ldr r1, [r1, r4]
	bl CopyCapsule
	add r0, r5, #0
	bl ov57_022394AC
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov57_022394D8

	thumb_func_start ov57_02239558
ov57_02239558: ; 0x02239558
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r6, #0xa5
	mov r4, #0
	add r5, r7, #0
	lsl r6, r6, #2
_02239564:
	ldr r0, [r5, r6]
	bl sub_0200DC18
	add r4, r4, #1
	add r5, #0xc
	cmp r4, #0xc
	blt _02239564
	mov r0, #0xc7
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	bl sub_0200DC18
	mov r0, #0x32
	lsl r0, r0, #4
	ldr r0, [r7, r0]
	bl sub_0200DC18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov57_02239558

	thumb_func_start ov57_02239588
ov57_02239588: ; 0x02239588
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r6, #0xa5
	mov r4, #0
	add r5, r7, #0
	lsl r6, r6, #2
_02239594:
	ldr r0, [r5, r6]
	bl sub_0200D9DC
	add r4, r4, #1
	add r5, #0xc
	cmp r4, #0xc
	blt _02239594
	mov r0, #0xc7
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	bl sub_0200D9DC
	mov r0, #0x32
	lsl r0, r0, #4
	ldr r0, [r7, r0]
	bl sub_0200D9DC
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov57_02239588

	thumb_func_start ov57_022395B8
ov57_022395B8: ; 0x022395B8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r6, r0, #0
	mov r0, #0x34
	str r1, [sp, #0x10]
	str r0, [sp]
	mov r0, #0x57
	mov r1, #8
	mov r2, #1
	add r3, sp, #0x18
	bl GfGfxLoader_GetCharData
	ldr r1, [sp, #0x18]
	str r0, [sp, #0x14]
	ldr r7, [r1, #0x14]
	ldr r1, [r1, #0x10]
	add r0, r7, #0
	bl DC_FlushRange
	ldr r5, _0223966C ; =ov57_0223BDF4
	mov r4, #0
_022395E2:
	add r0, r4, #1
	str r0, [sp]
	ldr r2, [r5]
	add r0, r6, #0
	lsl r2, r2, #5
	mov r1, #1
	add r2, r7, r2
	mov r3, #0x20
	bl BG_LoadCharTilesData
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #9
	blo _022395E2
	ldr r0, [sp, #0x14]
	bl FreeToHeap
	mov r0, #0
	str r0, [sp]
	mov r1, #0x20
	str r1, [sp, #4]
	mov r0, #0xc0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [sp, #0x10]
	mov r1, #0x57
	mov r2, #2
	mov r3, #0x34
	bl PaletteData_LoadFromNarc
	mov r0, #0
	str r0, [sp]
	mov r0, #0x34
	str r0, [sp, #4]
	add r0, r6, #0
	mov r1, #1
	mov r2, #0x1f
	mov r3, #0xd
	bl LoadUserFrameGfx1
	bl sub_0200E3D8
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xd0
	str r0, [sp, #8]
	ldr r0, [sp, #0x10]
	mov r1, #0x26
	mov r3, #0x34
	bl PaletteData_LoadNarc
	mov r0, #0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xe0
	str r0, [sp, #8]
	ldr r0, [sp, #0x10]
	mov r1, #0x10
	mov r2, #8
	mov r3, #0x34
	bl PaletteData_LoadNarc
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_0223966C: .word ov57_0223BDF4
	thumb_func_end ov57_022395B8

	thumb_func_start ov57_02239670
ov57_02239670: ; 0x02239670
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r6, r2, #0
	add r4, r1, #0
	lsl r1, r6, #0x18
	lsr r1, r1, #0x18
	str r1, [sp]
	mov r1, #0x34
	str r1, [sp, #4]
	mov r1, #4
	mov r2, #1
	mov r3, #0xf
	add r5, r0, #0
	bl LoadUserFrameGfx2
	add r0, r6, #0
	bl sub_0200E640
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xc0
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x26
	mov r3, #0x34
	bl PaletteData_LoadNarc
	mov r0, #0
	str r0, [sp]
	mov r0, #0x34
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #4
	mov r2, #0x1f
	mov r3, #0xd
	bl LoadUserFrameGfx1
	bl sub_0200E3D8
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xd0
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x26
	mov r3, #0x34
	bl PaletteData_LoadNarc
	mov r0, #1
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xe0
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x10
	mov r2, #8
	mov r3, #0x34
	bl PaletteData_LoadNarc
	mov r0, #1
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x30
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x10
	mov r2, #8
	mov r3, #0x34
	bl PaletteData_LoadNarc
	mov r0, #1
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xb0
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x57
	mov r2, #0
	mov r3, #0x34
	bl PaletteData_LoadNarc
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov57_02239670

	thumb_func_start ov57_02239728
ov57_02239728: ; 0x02239728
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r5, r2, #0
	cmp r3, #0
	beq _0223974E
	cmp r1, #0
	bne _02239744
	mov r1, #1
	add r2, r1, #0
	mov r3, #0xc
	bl DrawFrameAndWindow1
	b _0223974E
_02239744:
	mov r1, #1
	add r2, r1, #0
	mov r3, #0xc
	bl DrawFrameAndWindow2
_0223974E:
	ldr r0, _022397AC ; =0x0000FFFF
	cmp r5, r0
	bne _02239766
	add r0, r4, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_02239766:
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xb
	mov r3, #0x34
	bl NewMsgDataFromNarc
	add r1, r5, #0
	add r6, r0, #0
	bl NewString_ReadMsgData
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	add r0, r4, #0
	add r2, r5, #0
	add r3, r1, #0
	str r1, [sp, #8]
	bl AddTextPrinterParameterized
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	bl String_dtor
	add r0, r6, #0
	bl DestroyMsgData
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_022397AC: .word 0x0000FFFF
	thumb_func_end ov57_02239728

	thumb_func_start ov57_022397B0
ov57_022397B0: ; 0x022397B0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r1, #0
	add r7, r0, #0
	add r0, r5, #0
	add r4, r2, #0
	add r6, r3, #0
	bl InitWindow
	ldr r0, [sp, #0x28]
	lsl r2, r4, #0x18
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	lsl r3, r6, #0x18
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	add r1, r5, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x34]
	lsr r2, r2, #0x18
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	add r0, r7, #0
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	mov r1, #1
	add r0, r5, #0
	add r2, r1, #0
	mov r3, #0xc
	bl DrawFrameAndWindow2
	add r0, r5, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov57_022397B0

	thumb_func_start ov57_02239814
ov57_02239814: ; 0x02239814
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r1, #0
	add r7, r0, #0
	add r0, r5, #0
	add r4, r2, #0
	add r6, r3, #0
	bl InitWindow
	ldr r0, [sp, #0x28]
	lsl r2, r4, #0x18
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	lsl r3, r6, #0x18
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	add r1, r5, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x34]
	lsr r2, r2, #0x18
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	add r0, r7, #0
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	add r0, r5, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov57_02239814

	thumb_func_start ov57_02239868
ov57_02239868: ; 0x02239868
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r1, #0
	add r7, r0, #0
	add r0, r5, #0
	add r4, r2, #0
	add r6, r3, #0
	bl InitWindow
	ldr r0, [sp, #0x28]
	lsl r2, r4, #0x18
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	lsl r3, r6, #0x18
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	add r1, r5, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [sp, #0x38]
	lsr r2, r2, #0x18
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x34]
	lsr r3, r3, #0x18
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	add r0, r7, #0
	bl AddWindowParameterized
	add r0, r5, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov57_02239868

	thumb_func_start ov57_022398C4
ov57_022398C4: ; 0x022398C4
	push {r3, r4, lr}
	sub sp, #0x14
	mov r1, #2
	add r4, r0, #0
	str r1, [sp]
	mov r0, #4
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0xa6
	str r1, [sp, #0xc]
	mov r0, #0xb
	str r0, [sp, #0x10]
	add r0, r4, #0
	add r0, #0xe4
	add r1, #0x96
	ldr r0, [r0]
	add r1, r4, r1
	mov r2, #6
	mov r3, #3
	bl ov57_02239868
	mov r1, #2
	str r1, [sp]
	mov r0, #4
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0xae
	str r1, [sp, #0xc]
	mov r0, #0xb
	str r0, [sp, #0x10]
	add r0, r4, #0
	add r0, #0xe4
	add r1, #0x9e
	ldr r0, [r0]
	add r1, r4, r1
	mov r2, #6
	mov r3, #0xa
	bl ov57_02239868
	mov r0, #5
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r1, #0xb6
	str r1, [sp, #0xc]
	mov r0, #0xb
	str r0, [sp, #0x10]
	add r0, r4, #0
	add r0, #0xe4
	add r1, #0xa6
	ldr r0, [r0]
	add r1, r4, r1
	mov r2, #6
	mov r3, #3
	bl ov57_02239868
	mov r0, #5
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r1, #0xbe
	str r1, [sp, #0xc]
	mov r0, #0xb
	str r0, [sp, #0x10]
	add r0, r4, #0
	add r0, #0xe4
	add r1, #0xae
	ldr r0, [r0]
	add r1, r4, r1
	mov r2, #6
	mov r3, #0xa
	bl ov57_02239868
	mov r0, #8
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r1, #0xc6
	str r1, [sp, #0xc]
	mov r0, #0xb
	str r0, [sp, #0x10]
	add r0, r4, #0
	add r0, #0xe4
	add r1, #0xb6
	ldr r0, [r0]
	add r1, r4, r1
	mov r2, #6
	mov r3, #3
	bl ov57_02239868
	mov r0, #8
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r1, #0xce
	str r1, [sp, #0xc]
	mov r0, #0xb
	str r0, [sp, #0x10]
	add r0, r4, #0
	add r0, #0xe4
	add r1, #0xbe
	ldr r0, [r0]
	add r1, r4, r1
	mov r2, #6
	mov r3, #0xa
	bl ov57_02239868
	mov r2, #0xb
	str r2, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r1, #0xd6
	str r1, [sp, #0xc]
	add r0, r4, #0
	str r2, [sp, #0x10]
	add r0, #0xe4
	add r1, #0xc6
	ldr r0, [r0]
	add r1, r4, r1
	mov r2, #6
	mov r3, #3
	bl ov57_02239868
	mov r2, #0xb
	str r2, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r1, #0xde
	str r1, [sp, #0xc]
	add r0, r4, #0
	str r2, [sp, #0x10]
	add r0, #0xe4
	add r1, #0xce
	ldr r0, [r0]
	add r1, r4, r1
	mov r2, #6
	mov r3, #0xa
	bl ov57_02239868
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov57_022398C4

	thumb_func_start ov57_022399F8
ov57_022399F8: ; 0x022399F8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r0, #0
	add r5, r7, #0
	add r5, #0xec
	mov r6, #5
	add r5, #0x50
_02239A06:
	ldr r0, _02239A84 ; =0x0000044B
	add r1, r7, r6
	ldrb r0, [r1, r0]
	str r0, [sp, #0x10]
	cmp r0, #0
	bne _02239A22
	add r0, r5, #0
	mov r1, #0xee
	bl FillWindowPixelBuffer
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	b _02239A76
_02239A22:
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x64
	mov r1, #0x34
	bl String_ctor
	ldr r1, [sp, #0x10]
	add r4, r0, #0
	ldr r0, [r7, #0x64]
	sub r1, r1, #1
	bl SealCaseInventory_GetSealQuantity
	add r1, r0, #0
	mov r0, #1
	str r0, [sp]
	add r0, r4, #0
	mov r2, #3
	mov r3, #1
	bl String16_FormatInteger
	mov r0, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02239A88 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r2, r4, #0
	mov r3, #7
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	bl String_dtor
_02239A76:
	add r6, r6, #1
	add r5, #0x10
	cmp r6, #0xd
	blt _02239A06
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02239A84: .word 0x0000044B
_02239A88: .word 0x00010200
	thumb_func_end ov57_022399F8

	thumb_func_start ov57_02239A8C
ov57_02239A8C: ; 0x02239A8C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r6, r0, #0
	add r0, r1, #5
	lsl r4, r0, #4
	mov r0, #0x45
	add r1, r6, r1
	lsl r0, r0, #4
	add r5, r6, #0
	ldrb r7, [r1, r0]
	add r5, #0xec
	cmp r7, #0
	bne _02239AB8
	add r0, r5, r4
	mov r1, #0xee
	bl FillWindowPixelBuffer
	add r0, r5, r4
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_02239AB8:
	add r0, r5, r4
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x64
	mov r1, #0x34
	bl String_ctor
	str r0, [sp, #0x10]
	ldr r0, [r6, #0x64]
	sub r1, r7, #1
	bl SealCaseInventory_GetSealQuantity
	add r1, r0, #0
	mov r3, #1
	ldr r0, [sp, #0x10]
	mov r2, #3
	str r3, [sp]
	bl String16_FormatInteger
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02239B08 ; =0x00010200
	ldr r2, [sp, #0x10]
	str r0, [sp, #8]
	add r0, r5, r4
	mov r3, #7
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, r4
	bl ScheduleWindowCopyToVram
	ldr r0, [sp, #0x10]
	bl String_dtor
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02239B08: .word 0x00010200
	thumb_func_end ov57_02239A8C

	thumb_func_start ov57_02239B0C
ov57_02239B0C: ; 0x02239B0C
	push {r3, r4, r5, lr}
	add r0, #0xec
	add r5, r0, #0
	mov r4, #5
	add r5, #0x50
_02239B16:
	add r0, r5, #0
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #0xd
	blt _02239B16
	pop {r3, r4, r5, pc}
	thumb_func_end ov57_02239B0C

	thumb_func_start ov57_02239B2C
ov57_02239B2C: ; 0x02239B2C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r1, #0
	ldr r1, _02239B90 ; =0x0000FFFF
	add r4, r0, #0
	cmp r5, r1
	bne _02239B4A
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_02239B4A:
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xf
	mov r3, #0x34
	bl NewMsgDataFromNarc
	add r1, r5, #0
	add r6, r0, #0
	bl NewString_ReadMsgData
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	add r0, r4, #0
	add r2, r5, #0
	add r3, r1, #0
	str r1, [sp, #8]
	bl AddTextPrinterParameterized
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	bl String_dtor
	add r0, r6, #0
	bl DestroyMsgData
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02239B90: .word 0x0000FFFF
	thumb_func_end ov57_02239B2C

	thumb_func_start ov57_02239B94
ov57_02239B94: ; 0x02239B94
	push {r3, lr}
	bl GX_BothDispOn
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	pop {r3, pc}
	thumb_func_end ov57_02239B94

	thumb_func_start ov57_02239BAC
ov57_02239BAC: ; 0x02239BAC
	push {lr}
	sub sp, #0xc
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x34
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end ov57_02239BAC

	thumb_func_start ov57_02239BCC
ov57_02239BCC: ; 0x02239BCC
	push {lr}
	sub sp, #0xc
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x34
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	add sp, #0xc
	pop {pc}
	thumb_func_end ov57_02239BCC

	thumb_func_start ov57_02239BEC
ov57_02239BEC: ; 0x02239BEC
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x34
	add r2, r5, #0
	add r4, r1, #0
	str r0, [sp, #0xc]
	add r2, #0xe4
	ldr r2, [r2]
	add r0, r4, #0
	mov r1, #8
	mov r3, #2
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x34
	add r2, r5, #0
	str r0, [sp, #0xc]
	add r2, #0xe4
	ldr r2, [r2]
	add r0, r4, #0
	mov r1, #0xc
	mov r3, #2
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r1, #0
	str r1, [sp]
	mov r0, #0x60
	str r0, [sp, #4]
	add r0, r5, #0
	str r1, [sp, #8]
	add r0, #0xe8
	ldr r0, [r0]
	mov r1, #0x57
	mov r2, #2
	mov r3, #0x34
	bl PaletteData_LoadNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x34
	add r2, r5, #0
	str r0, [sp, #0xc]
	add r2, #0xe4
	ldr r2, [r2]
	add r0, r4, #0
	mov r1, #9
	mov r3, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x34
	str r0, [sp, #0xc]
	add r5, #0xe4
	ldr r2, [r5]
	add r0, r4, #0
	mov r1, #0xd
	mov r3, #3
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov57_02239BEC

	thumb_func_start ov57_02239C88
ov57_02239C88: ; 0x02239C88
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x34
	add r2, r5, #0
	add r4, r1, #0
	str r0, [sp, #0xc]
	add r2, #0xe4
	ldr r2, [r2]
	add r0, r4, #0
	mov r1, #7
	mov r3, #5
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x34
	add r2, r5, #0
	str r0, [sp, #0xc]
	add r2, #0xe4
	ldr r2, [r2]
	add r0, r4, #0
	mov r1, #0xb
	mov r3, #5
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r2, #1
	str r2, [sp]
	mov r0, #0x40
	str r0, [sp, #4]
	mov r0, #0
	add r5, #0xe8
	str r0, [sp, #8]
	ldr r0, [r5]
	mov r1, #0x57
	mov r3, #0x34
	bl PaletteData_LoadNarc
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov57_02239C88

	thumb_func_start ov57_02239CE8
ov57_02239CE8: ; 0x02239CE8
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x34
	add r2, r5, #0
	add r4, r1, #0
	str r0, [sp, #0xc]
	add r2, #0xe4
	mov r1, #7
	ldr r2, [r2]
	add r0, r4, #0
	add r3, r1, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x34
	add r2, r5, #0
	str r0, [sp, #0xc]
	add r2, #0xe4
	ldr r2, [r2]
	add r0, r4, #0
	mov r1, #0xa
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r2, #1
	str r2, [sp]
	mov r0, #0x40
	str r0, [sp, #4]
	mov r0, #0
	add r5, #0xe8
	str r0, [sp, #8]
	ldr r0, [r5]
	mov r1, #0x57
	mov r3, #0x34
	bl PaletteData_LoadNarc
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov57_02239CE8

	thumb_func_start ov57_02239D48
ov57_02239D48: ; 0x02239D48
	push {r4, r5, r6, lr}
	sub sp, #0x18
	add r5, r1, #0
	add r1, r0, #0
	add r1, #0xdc
	ldr r6, [r1]
	add r1, r0, #0
	add r1, #0xe0
	ldr r4, [r1]
	mov r1, #4
	str r5, [sp]
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	mov r1, #3
	str r1, [sp, #0xc]
	mov r2, #2
	str r2, [sp, #0x10]
	ldr r2, _02239E80 ; =0x00006594
	add r0, #0xe8
	str r2, [sp, #0x14]
	ldr r0, [r0]
	add r2, r6, #0
	add r3, r4, #0
	bl sub_0200D68C
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _02239E84 ; =0x000061C2
	add r1, r4, #0
	str r0, [sp, #8]
	add r0, r6, #0
	add r2, r5, #0
	mov r3, #0x1a
	bl sub_0200D504
	mov r0, #1
	str r0, [sp]
	ldr r0, _02239E88 ; =0x00006994
	add r1, r4, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r5, #0
	mov r3, #0x1c
	bl sub_0200D6EC
	mov r0, #1
	str r0, [sp]
	ldr r0, _02239E8C ; =0x00006D7B
	add r1, r4, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r5, #0
	mov r3, #0x1b
	bl sub_0200D71C
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _02239E90 ; =0x000061C5
	add r1, r4, #0
	str r0, [sp, #8]
	add r0, r6, #0
	add r2, r5, #0
	mov r3, #0x1d
	bl sub_0200D504
	mov r0, #1
	str r0, [sp]
	ldr r0, _02239E94 ; =0x00006997
	add r1, r4, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r5, #0
	mov r3, #0x1f
	bl sub_0200D6EC
	mov r0, #1
	str r0, [sp]
	ldr r0, _02239E98 ; =0x00006D7E
	add r1, r4, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r5, #0
	mov r3, #0x1e
	bl sub_0200D71C
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _02239E9C ; =0x000061BC
	add r1, r4, #0
	str r0, [sp, #8]
	add r0, r6, #0
	add r2, r5, #0
	mov r3, #0x14
	bl sub_0200D504
	mov r0, #1
	str r0, [sp]
	ldr r0, _02239EA0 ; =0x0000698E
	add r1, r4, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r5, #0
	mov r3, #0x16
	bl sub_0200D6EC
	mov r0, #1
	str r0, [sp]
	ldr r0, _02239EA4 ; =0x00006D75
	add r1, r4, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r5, #0
	mov r3, #0x15
	bl sub_0200D71C
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _02239EA8 ; =0x000088CF
	add r1, r4, #0
	str r0, [sp, #8]
	add r0, r6, #0
	add r2, r5, #0
	mov r3, #0x17
	bl sub_0200D504
	mov r0, #1
	str r0, [sp]
	ldr r0, _02239EAC ; =0x00006991
	add r1, r4, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r5, #0
	mov r3, #0x19
	bl sub_0200D6EC
	mov r0, #1
	str r0, [sp]
	ldr r0, _02239EB0 ; =0x00006D78
	add r1, r4, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r5, #0
	mov r3, #0x18
	bl sub_0200D71C
	add sp, #0x18
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02239E80: .word 0x00006594
_02239E84: .word 0x000061C2
_02239E88: .word 0x00006994
_02239E8C: .word 0x00006D7B
_02239E90: .word 0x000061C5
_02239E94: .word 0x00006997
_02239E98: .word 0x00006D7E
_02239E9C: .word 0x000061BC
_02239EA0: .word 0x0000698E
_02239EA4: .word 0x00006D75
_02239EA8: .word 0x000088CF
_02239EAC: .word 0x00006991
_02239EB0: .word 0x00006D78
	thumb_func_end ov57_02239D48

	thumb_func_start ov57_02239EB4
ov57_02239EB4: ; 0x02239EB4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0xa0
	add r7, r0, #0
	add r0, #0xdc
	ldr r6, [r0]
	add r0, r7, #0
	add r0, #0xe0
	ldr r5, [r0]
	ldr r0, _02239FF4 ; =0x00000414
	mov r1, #0
	add r2, sp, #0x6c
	strh r1, [r2]
	strh r1, [r2, #2]
	strh r1, [r2, #4]
	add r4, r7, r0
	strh r1, [r2, #6]
	mov r0, #0x3c
	str r0, [sp, #0x74]
	mov r0, #2
	str r0, [sp, #0x7c]
	mov r0, #1
	str r1, [sp, #0x9c]
	sub r1, r0, #2
	str r0, [sp, #0x98]
	str r0, [sp, #0x78]
	ldr r0, _02239FF8 ; =0x000061C2
	str r1, [sp, #0x90]
	str r0, [sp, #0x80]
	ldr r0, _02239FFC ; =0x00006594
	str r1, [sp, #0x94]
	str r0, [sp, #0x84]
	ldr r0, _0223A000 ; =0x00006994
	add r1, r5, #0
	str r0, [sp, #0x88]
	ldr r0, _0223A004 ; =0x00006D7B
	str r0, [sp, #0x8c]
	add r0, r6, #0
	bl sub_0200D734
	str r0, [r4, #0x20]
	ldr r0, _0223A008 ; =0x000061C5
	add r1, r5, #0
	str r0, [sp, #0x80]
	ldr r0, _02239FFC ; =0x00006594
	add r2, sp, #0x6c
	str r0, [sp, #0x84]
	ldr r0, _0223A00C ; =0x00006997
	str r0, [sp, #0x88]
	ldr r0, _0223A010 ; =0x00006D7E
	str r0, [sp, #0x8c]
	add r0, r6, #0
	bl sub_0200D734
	str r0, [r4, #0x24]
	mov r0, #1
	str r0, [sp, #0x98]
	str r0, [sp, #0x78]
	ldr r0, _0223A014 ; =0x000088CF
	add r1, r5, #0
	str r0, [sp, #0x80]
	ldr r0, _02239FFC ; =0x00006594
	add r2, sp, #0x6c
	str r0, [sp, #0x84]
	ldr r0, _0223A018 ; =0x00006991
	str r0, [sp, #0x88]
	ldr r0, _0223A01C ; =0x00006D78
	str r0, [sp, #0x8c]
	add r0, r6, #0
	bl sub_0200D734
	str r0, [r4, #0x28]
	mov r0, #1
	str r0, [sp, #0x98]
	mov r0, #0
	str r0, [sp, #0x78]
	ldr r0, _0223A020 ; =0x000061BC
	add r1, r5, #0
	str r0, [sp, #0x80]
	ldr r0, _02239FFC ; =0x00006594
	add r2, sp, #0x6c
	str r0, [sp, #0x84]
	ldr r0, _0223A024 ; =0x0000698E
	str r0, [sp, #0x88]
	ldr r0, _0223A028 ; =0x00006D75
	str r0, [sp, #0x8c]
	add r0, r6, #0
	bl sub_0200D734
	str r0, [r4, #0x2c]
	add r0, r6, #0
	add r1, r5, #0
	add r2, sp, #0x6c
	bl sub_0200D734
	ldr r3, _0223A02C ; =ov57_0223BE48
	str r0, [r4, #0x30]
	add r2, sp, #0x38
	mov r1, #0x1a
_02239F78:
	ldrh r0, [r3]
	add r3, r3, #2
	strh r0, [r2]
	add r2, r2, #2
	sub r1, r1, #1
	bne _02239F78
	ldr r3, _0223A030 ; =ov57_0223BE7C
	add r2, sp, #4
	mov r1, #0x1a
_02239F8A:
	ldrh r0, [r3]
	add r3, r3, #2
	strh r0, [r2]
	add r2, r2, #2
	sub r1, r1, #1
	bne _02239F8A
	mov r0, #8
	str r0, [sp]
	mov r0, #0x1f
	add r4, r7, #0
	lsl r0, r0, #4
	add r7, r7, r0
	add r6, sp, #0x58
	add r4, #0x20
	add r5, sp, #0x24
	add r7, #0x20
_02239FAA:
	ldr r0, _02239FF4 ; =0x00000414
	mov r1, #0
	mov r2, #2
	ldrsh r1, [r6, r1]
	ldrsh r2, [r6, r2]
	ldr r0, [r4, r0]
	bl sub_0200DDB8
	ldr r0, _02239FF4 ; =0x00000414
	ldr r0, [r4, r0]
	bl sub_0200DC18
	ldr r0, _02239FF4 ; =0x00000414
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_0200DCC0
	ldr r1, _02239FF4 ; =0x00000414
	mov r2, #0
	mov r3, #2
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	ldr r1, [r4, r1]
	add r0, r7, #0
	bl ov57_022385A4
	ldr r0, [sp]
	add r6, r6, #4
	add r0, r0, #1
	add r4, r4, #4
	add r5, r5, #4
	add r7, r7, #4
	str r0, [sp]
	cmp r0, #0xd
	blt _02239FAA
	add sp, #0xa0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02239FF4: .word 0x00000414
_02239FF8: .word 0x000061C2
_02239FFC: .word 0x00006594
_0223A000: .word 0x00006994
_0223A004: .word 0x00006D7B
_0223A008: .word 0x000061C5
_0223A00C: .word 0x00006997
_0223A010: .word 0x00006D7E
_0223A014: .word 0x000088CF
_0223A018: .word 0x00006991
_0223A01C: .word 0x00006D78
_0223A020: .word 0x000061BC
_0223A024: .word 0x0000698E
_0223A028: .word 0x00006D75
_0223A02C: .word ov57_0223BE48
_0223A030: .word ov57_0223BE7C
	thumb_func_end ov57_02239EB4

	thumb_func_start ov57_0223A034
ov57_0223A034: ; 0x0223A034
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, _0223A054 ; =0x00000414
	add r5, r0, #0
	add r6, r1, #0
	mov r4, #0
_0223A03E:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _0223A04A
	add r1, r6, #0
	bl sub_0200DCE8
_0223A04A:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0xd
	blt _0223A03E
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223A054: .word 0x00000414
	thumb_func_end ov57_0223A034

	thumb_func_start ov57_0223A058
ov57_0223A058: ; 0x0223A058
	bx lr
	.balign 4, 0
	thumb_func_end ov57_0223A058

	thumb_func_start ov57_0223A05C
ov57_0223A05C: ; 0x0223A05C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r6, _0223A078 ; =0x00000414
	mov r4, #8
	add r5, #0x20
_0223A066:
	ldr r0, [r5, r6]
	bl sub_0200D9DC
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0xd
	blt _0223A066
	pop {r4, r5, r6, pc}
	nop
_0223A078: .word 0x00000414
	thumb_func_end ov57_0223A05C

	thumb_func_start ov57_0223A07C
ov57_0223A07C: ; 0x0223A07C
	push {r3, r4, r5, r6, r7, lr}
	mov r7, #0
	add r6, r0, #0
	add r5, r7, #0
	add r4, r7, #0
_0223A086:
	add r0, r6, #0
	add r1, r4, #0
	bl CapsuleGetSealI
	bl SealOnCapsuleGetID
	cmp r0, #0
	beq _0223A098
	add r5, r5, #1
_0223A098:
	add r4, r4, #1
	cmp r4, #8
	blt _0223A086
	cmp r5, #0
	beq _0223A0A4
	mov r7, #1
_0223A0A4:
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov57_0223A07C

	thumb_func_start ov57_0223A0A8
ov57_0223A0A8: ; 0x0223A0A8
	mov r2, #0xc
	mul r2, r1
	add r1, r0, r2
	mov r0, #0xa3
	lsl r0, r0, #2
	ldr r2, [r1, r0]
	add r0, r0, #4
	ldr r0, [r1, r0]
	cmp r2, #0xff
	bne _0223A0C4
	cmp r0, #0
	bne _0223A0C4
	mov r0, #0
	bx lr
_0223A0C4:
	cmp r2, #0xff
	bne _0223A0D0
	cmp r0, #1
	bne _0223A0D0
	mov r0, #1
	bx lr
_0223A0D0:
	cmp r2, #0xff
	beq _0223A0DC
	cmp r0, #1
	bne _0223A0DC
	mov r0, #2
	bx lr
_0223A0DC:
	mov r0, #3
	bx lr
	thumb_func_end ov57_0223A0A8

	thumb_func_start ov57_0223A0E0
ov57_0223A0E0: ; 0x0223A0E0
	push {r3, r4, r5, lr}
	mov r1, #0xfd
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	lsl r2, r1, #2
	ldr r1, _0223A100 ; =ov57_0223BEB8
	ldr r1, [r1, r2]
	blx r1
	add r4, #0xe0
	add r5, r0, #0
	ldr r0, [r4]
	bl sub_0200D020
	add r0, r5, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223A100: .word ov57_0223BEB8
	thumb_func_end ov57_0223A0E0

	thumb_func_start ov57_0223A104
ov57_0223A104: ; 0x0223A104
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r0, #0xff
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #6
	bls _0223A114
	b _0223A300
_0223A114:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223A120: ; jump table
	.short _0223A12E - _0223A120 - 2 ; case 0
	.short _0223A226 - _0223A120 - 2 ; case 1
	.short _0223A236 - _0223A120 - 2 ; case 2
	.short _0223A248 - _0223A120 - 2 ; case 3
	.short _0223A256 - _0223A120 - 2 ; case 4
	.short _0223A2C0 - _0223A120 - 2 ; case 5
	.short _0223A2D0 - _0223A120 - 2 ; case 6
_0223A12E:
	mov r0, #0x57
	mov r1, #0x34
	bl NARC_ctor
	add r5, r0, #0
	add r0, r4, #0
	bl ov57_02238DD0
	add r0, r4, #0
	bl ov57_02238E48
	add r0, r4, #0
	bl ov57_02238F48
	add r0, r4, #0
	add r1, r5, #0
	bl ov57_02239BEC
	add r0, r4, #0
	add r1, r5, #0
	bl ov57_02239C88
	add r0, r4, #0
	add r1, r5, #0
	bl ov57_02239CE8
	add r0, r4, #0
	bl ov57_02239014
	add r0, r4, #0
	add r1, r5, #0
	bl ov57_022392F4
	add r0, r4, #0
	bl ov57_022385DC
	add r0, r4, #0
	bl ov57_02237F3C
	add r0, r4, #0
	mov r1, #1
	bl ov57_022383D0
	add r0, r4, #0
	bl ov57_02237F14
	add r0, r4, #0
	add r1, r5, #0
	bl ov57_02239D48
	add r0, r4, #0
	bl ov57_02239EB4
	add r0, r4, #0
	add r1, r5, #0
	bl ov57_02239114
	add r0, r4, #0
	bl ov57_02239184
	add r0, r4, #0
	bl ov57_0223B75C
	add r0, r4, #0
	bl ov57_0223B78C
	ldr r1, _0223A310 ; =0x00000448
	add r0, r4, #0
	ldr r1, [r4, r1]
	bl ov57_022388E4
	add r0, r4, #0
	bl ov57_02238958
	add r0, r4, #0
	bl ov57_02238A00
	add r0, r4, #0
	mov r1, #0
	bl ov57_0223A034
	add r0, r4, #0
	mov r1, #0
	bl ov57_02239240
	add r0, r4, #0
	bl ov57_02238794
	add r0, r4, #0
	mov r1, #0
	bl ov57_022387C0
	mov r0, #0x47
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #3
	mov r2, #7
	mov r3, #0
	bl ov57_02239728
	bl ov57_02239B94
	add r0, r4, #0
	mov r1, #0
	bl ov57_0223B948
	add r0, r4, #0
	mov r1, #1
	bl ov57_0223866C
	ldr r2, _0223A314 ; =0x04000304
	ldr r0, _0223A318 ; =0xFFFF7FFF
	ldrh r1, [r2]
	and r0, r1
	strh r0, [r2]
	add r0, r5, #0
	bl NARC_dtor
	mov r0, #0xff
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _0223A300
_0223A226:
	bl ov57_02239BAC
	mov r0, #0xff
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _0223A300
_0223A236:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0223A300
	mov r0, #0xff
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
_0223A248:
	add r0, r4, #0
	bl ov57_0223B180
	mov r1, #0xff
	lsl r1, r1, #2
	str r0, [r4, r1]
	b _0223A300
_0223A256:
	mov r0, #0x93
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_020186A4
	add r1, r0, #0
	mov r0, #1
	mvn r0, r0
	cmp r1, r0
	beq _0223A272
	add r0, r0, #1
	cmp r1, r0
	beq _0223A300
	b _0223A292
_0223A272:
	add r0, r4, #0
	bl ov57_0223B700
	mov r0, #0x47
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #3
	mov r2, #7
	mov r3, #0
	bl ov57_02239728
	mov r0, #0xff
	mov r1, #3
	lsl r0, r0, #2
	str r1, [r4, r0]
	b _0223A300
_0223A292:
	cmp r1, #0
	beq _0223A300
	add r0, r4, #0
	blx r1
	cmp r0, #1
	beq _0223A2A6
	add r0, r4, #0
	bl ov57_0223B700
	b _0223A300
_0223A2A6:
	mov r0, #0x47
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #3
	mov r2, #7
	mov r3, #0
	bl ov57_02239728
	mov r0, #0xff
	mov r1, #3
	lsl r0, r0, #2
	str r1, [r4, r0]
	b _0223A300
_0223A2C0:
	bl ov57_02239BCC
	mov r0, #0xff
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _0223A300
_0223A2D0:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0223A300
	add r0, r4, #0
	bl ov57_0223864C
	add r0, r4, #0
	bl ov57_02239588
	add r0, r4, #0
	bl ov57_02238FEC
	add r0, r4, #0
	bl ov57_0223A05C
	add r0, r4, #0
	bl ov57_02239260
	add r0, r4, #0
	bl ov57_02238AC0
	mov r0, #0
	pop {r3, r4, r5, pc}
_0223A300:
	add r0, r4, #0
	bl ov57_02238FC4
	add r0, r4, #0
	bl ov57_02239558
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223A310: .word 0x00000448
_0223A314: .word 0x04000304
_0223A318: .word 0xFFFF7FFF
	thumb_func_end ov57_0223A104

	thumb_func_start ov57_0223A31C
ov57_0223A31C: ; 0x0223A31C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	mov r1, #0xff
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	cmp r1, #0xb
	bhi _0223A406
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223A338: ; jump table
	.short _0223A350 - _0223A338 - 2 ; case 0
	.short _0223A406 - _0223A338 - 2 ; case 1
	.short _0223A406 - _0223A338 - 2 ; case 2
	.short _0223A406 - _0223A338 - 2 ; case 3
	.short _0223A35C - _0223A338 - 2 ; case 4
	.short _0223A368 - _0223A338 - 2 ; case 5
	.short _0223A374 - _0223A338 - 2 ; case 6
	.short _0223A3EC - _0223A338 - 2 ; case 7
	.short _0223A406 - _0223A338 - 2 ; case 8
	.short _0223A406 - _0223A338 - 2 ; case 9
	.short _0223A406 - _0223A338 - 2 ; case 10
	.short _0223A3F8 - _0223A338 - 2 ; case 11
_0223A350:
	bl ov57_0223A6B8
	mov r1, #0xff
	lsl r1, r1, #2
	str r0, [r4, r1]
	b _0223A406
_0223A35C:
	bl ov57_0223B620
	mov r1, #0xff
	lsl r1, r1, #2
	str r0, [r4, r1]
	b _0223A406
_0223A368:
	bl ov57_0223AB58
	mov r1, #0xff
	lsl r1, r1, #2
	str r0, [r4, r1]
	b _0223A406
_0223A374:
	mov r1, #0
	add r0, #0xec
	mov r2, #0xc
	add r3, r1, #0
	bl ov57_02239728
	mov r0, #0x41
	mov r1, #0x14
	lsl r0, r0, #4
	str r1, [r4, r0]
	add r0, r4, #0
	bl ov57_022384C0
	cmp r0, #1
	bne _0223A39A
	mov r0, #0xa2
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r4, r0]
_0223A39A:
	add r0, r4, #0
	bl ov57_0223853C
	add r0, r4, #0
	bl ov57_022394AC
	ldr r0, [r4]
	ldr r0, [r0, #0x28]
	bl Sav2_GameStats_get
	mov r1, #7
	bl GameStats_AddSpecial
	mov r0, #0xfb
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	mov r0, #0xc
	mul r0, r1
	add r2, r4, r0
	mov r0, #0xa3
	lsl r0, r0, #2
	ldr r0, [r2, r0]
	cmp r0, #0xff
	beq _0223A3E2
	ldr r2, [r4]
	lsl r0, r0, #2
	add r0, r2, r0
	ldr r5, [r0, #4]
	ldr r0, [r2, #0x20]
	bl SealCase_GetCapsuleI
	add r2, r0, #0
	add r0, r5, #0
	mov r1, #0xab
	bl SetMonData
_0223A3E2:
	mov r0, #0xff
	mov r1, #0xb
	lsl r0, r0, #2
	str r1, [r4, r0]
	b _0223A406
_0223A3EC:
	bl ov57_0223A8FC
	mov r1, #0xff
	lsl r1, r1, #2
	str r0, [r4, r1]
	b _0223A406
_0223A3F8:
	bl ov57_0223A7DC
	cmp r0, #0
	beq _0223A406
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0223A406:
	mov r0, #0xff
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #4
	beq _0223A414
	cmp r0, #0
	bne _0223A4DE
_0223A414:
	add r0, r4, #0
	add r0, #0xd4
	ldr r5, [r0]
	cmp r5, #0xff
	bne _0223A42A
	mov r0, #0x7b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02026CC4
	b _0223A4DE
_0223A42A:
	add r0, sp, #4
	add r1, sp, #0
	bl sub_02025364
	mov r1, #0xff
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	cmp r1, #4
	beq _0223A43E
	mov r0, #0
_0223A43E:
	cmp r0, #0
	beq _0223A484
	lsl r6, r5, #4
	mov r0, #0x35
	add r1, r4, r6
	lsl r0, r0, #4
	ldrb r0, [r1, r0]
	bl sub_0209106C
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0xec
	bl ov57_02239B2C
	mov r0, #0xd5
	ldr r2, [sp]
	add r1, r4, r6
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	ldr r1, [sp, #4]
	lsl r2, r2, #0x10
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl sub_0200DDB8
	add r0, r4, #0
	add r1, r5, #0
	bl ov57_0223848C
	add r0, r4, #0
	add r1, r5, #0
	bl ov57_02238508
	b _0223A4DE
_0223A484:
	add r0, r4, #0
	add r1, r5, #0
	bl ov57_022383F8
	lsl r6, r5, #4
	mov r2, #0xd6
	add r1, r4, r6
	lsl r2, r2, #2
	add r7, r0, #0
	ldr r0, [r1, r2]
	sub r2, r2, #4
	ldr r1, [r1, r2]
	mov r2, #0
	bl ov57_02237EB8
	cmp r7, #0
	bne _0223A4C6
	mov r1, #0x35
	ldr r0, [r4]
	add r2, r4, r6
	lsl r1, r1, #4
	ldrb r1, [r2, r1]
	ldr r0, [r0, #0x20]
	mov r2, #1
	bl GiveOrTakeSeal2
	add r0, r4, #0
	bl ov57_022399F8
	add r0, r4, #0
	add r1, r5, #0
	bl ov57_02238438
_0223A4C6:
	ldr r0, _0223A4FC ; =0x000005EA
	bl PlaySE
	add r0, r4, #0
	mov r1, #0xff
	add r0, #0xd4
	str r1, [r0]
	add r0, r4, #0
	ldr r1, _0223A500 ; =0x0000FFFF
	add r0, #0xec
	bl ov57_02239B2C
_0223A4DE:
	add r0, r4, #0
	bl ov57_0223A058
	add r0, r4, #0
	bl ov57_0223921C
	add r0, r4, #0
	bl ov57_02238FC4
	add r0, r4, #0
	bl ov57_02239558
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223A4FC: .word 0x000005EA
_0223A500: .word 0x0000FFFF
	thumb_func_end ov57_0223A31C

	thumb_func_start ov57_0223A504
ov57_0223A504: ; 0x0223A504
	push {r4, lr}
	mov r1, #0xff
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r2, [r4, r1]
	cmp r2, #0
	beq _0223A51C
	cmp r2, #1
	beq _0223A53E
	cmp r2, #2
	beq _0223A560
	b _0223A594
_0223A51C:
	sub r1, #0x10
	ldr r1, [r4, r1]
	bl ov57_0223BC4C
	add r0, r4, #0
	add r0, #0xec
	mov r1, #0
	mov r2, #9
	mov r3, #1
	bl ov57_02239728
	mov r0, #0xff
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _0223A594
_0223A53E:
	bl ov57_0223B12C
	ldr r0, _0223A5A4 ; =gSystem
	ldr r1, [r0, #0x48]
	ldr r0, _0223A5A8 ; =0x00000CF3
	tst r0, r1
	bne _0223A554
	bl System_GetTouchNew
	cmp r0, #0
	beq _0223A594
_0223A554:
	mov r0, #0xff
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _0223A594
_0223A560:
	mov r1, #0
	mov r2, #0xff
	add r3, r1, #0
	bl ov57_0223B828
	add r0, r4, #0
	add r0, #0xec
	mov r1, #1
	bl sub_0200E5D4
	add r0, r4, #0
	add r0, #0xec
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	mov r1, #1
	bl ov57_0223866C
	mov r0, #0x47
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #3
	mov r2, #7
	mov r3, #0
	bl ov57_02239728
_0223A594:
	add r0, r4, #0
	bl ov57_02238FC4
	add r0, r4, #0
	bl ov57_02239558
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_0223A5A4: .word gSystem
_0223A5A8: .word 0x00000CF3
	thumb_func_end ov57_0223A504

	thumb_func_start ov57_0223A5AC
ov57_0223A5AC: ; 0x0223A5AC
	push {r4, lr}
	mov r1, #0xff
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r2, [r4, r1]
	cmp r2, #3
	bhi _0223A69C
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0223A5C6: ; jump table
	.short _0223A5CE - _0223A5C6 - 2 ; case 0
	.short _0223A616 - _0223A5C6 - 2 ; case 1
	.short _0223A624 - _0223A5C6 - 2 ; case 2
	.short _0223A644 - _0223A5C6 - 2 ; case 3
_0223A5CE:
	sub r1, #0xe0
	ldr r0, [r4, r1]
	mov r1, #0x19
	bl sub_0200DD68
	mov r0, #0x32
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0x14
	bl sub_0200DD68
	mov r0, #0xc7
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_0200DC4C
	mov r0, #0x47
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #3
	mov r2, #0xa
	mov r3, #0
	bl ov57_02239728
	mov r0, #0x32
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_0200DCE8
	mov r0, #0xff
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
_0223A616:
	add r0, r4, #0
	bl ov57_0223B308
	mov r1, #0xff
	lsl r1, r1, #2
	str r0, [r4, r1]
	b _0223A69C
_0223A624:
	bl ov57_0223B12C
	ldr r0, _0223A6AC ; =gSystem
	ldr r1, [r0, #0x48]
	ldr r0, _0223A6B0 ; =0x00000CF3
	tst r0, r1
	bne _0223A63A
	bl System_GetTouchNew
	cmp r0, #0
	beq _0223A69C
_0223A63A:
	mov r0, #0xff
	mov r1, #3
	lsl r0, r0, #2
	str r1, [r4, r0]
	b _0223A69C
_0223A644:
	sub r1, #0xe0
	ldr r0, [r4, r1]
	mov r1, #0x14
	bl sub_0200DD68
	mov r0, #0x32
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0x19
	bl sub_0200DD68
	mov r1, #0
	add r0, r4, #0
	mov r2, #0xff
	add r3, r1, #0
	bl ov57_0223B828
	mov r0, #0xc7
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DC4C
	add r0, r4, #0
	add r0, #0xec
	mov r1, #1
	bl sub_0200E5D4
	add r0, r4, #0
	add r0, #0xec
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	mov r1, #1
	bl ov57_0223866C
	mov r0, #0x47
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #3
	mov r2, #7
	mov r3, #0
	bl ov57_02239728
_0223A69C:
	add r0, r4, #0
	bl ov57_02238FC4
	add r0, r4, #0
	bl ov57_02239558
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_0223A6AC: .word gSystem
_0223A6B0: .word 0x00000CF3
	thumb_func_end ov57_0223A5AC

	thumb_func_start ov57_0223A6B4
ov57_0223A6B4: ; 0x0223A6B4
	mov r0, #0
	bx lr
	thumb_func_end ov57_0223A6B4

	thumb_func_start ov57_0223A6B8
ov57_0223A6B8: ; 0x0223A6B8
	push {r4, lr}
	ldr r1, _0223A7C4 ; =0x00000404
	add r4, r0, #0
	ldr r1, [r4, r1]
	cmp r1, #0
	beq _0223A6CE
	cmp r1, #1
	beq _0223A708
	cmp r1, #2
	beq _0223A7A6
	b _0223A7C0
_0223A6CE:
	mov r1, #0
	bl ov57_0223B948
	add r0, r4, #0
	bl ov57_022398C4
	add r0, r4, #0
	bl ov57_022399F8
	add r0, r4, #0
	bl ov57_0223B75C
	add r0, r4, #0
	bl ov57_0223B78C
	mov r0, #0xa2
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #0x41
	lsl r0, r0, #4
	str r1, [r4, r0]
	bl ov57_02239BCC
	ldr r0, _0223A7C4 ; =0x00000404
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _0223A7C0
_0223A708:
	bl ov57_0223B940
	cmp r0, #1
	beq _0223A7C0
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0223A7C0
	mov r0, #0x10
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #7
	mov r1, #1
	bl SetBgPriority
	add r0, r4, #0
	mov r1, #1
	bl ov57_0223A034
	add r0, r4, #0
	mov r1, #1
	bl ov57_02239240
	add r0, r4, #0
	mov r1, #1
	bl ov57_022387C0
	add r0, r4, #0
	mov r1, #1
	bl ov57_02238AF0
	ldr r0, _0223A7C8 ; =0x00000434
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_0200DCC0
	ldr r0, _0223A7CC ; =0x00000438
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_0200DCC0
	ldr r0, _0223A7D0 ; =0x0000043C
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_0200DCC0
	mov r0, #3
	mov r1, #1
	bl SetBgPriority
	mov r0, #0x47
	lsl r0, r0, #2
	add r0, r4, r0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r4, #0
	ldr r2, _0223A7D4 ; =0x0000FFFF
	add r0, #0xec
	mov r1, #0
	mov r3, #1
	bl ov57_02239728
	ldr r2, _0223A7D8 ; =0x04000304
	ldrh r1, [r2]
	lsr r0, r2, #0xb
	orr r0, r1
	strh r0, [r2]
	bl ov57_02239BAC
	ldr r0, _0223A7C4 ; =0x00000404
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _0223A7C0
_0223A7A6:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0223A7C0
	add r0, r4, #0
	mov r1, #1
	bl ov57_0223B948
	ldr r0, _0223A7C4 ; =0x00000404
	mov r1, #0
	str r1, [r4, r0]
	mov r0, #4
	pop {r4, pc}
_0223A7C0:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0223A7C4: .word 0x00000404
_0223A7C8: .word 0x00000434
_0223A7CC: .word 0x00000438
_0223A7D0: .word 0x0000043C
_0223A7D4: .word 0x0000FFFF
_0223A7D8: .word 0x04000304
	thumb_func_end ov57_0223A6B8

	thumb_func_start ov57_0223A7DC
ov57_0223A7DC: ; 0x0223A7DC
	push {r4, lr}
	ldr r1, _0223A8F0 ; =0x00000404
	add r4, r0, #0
	ldr r2, [r4, r1]
	cmp r2, #0
	beq _0223A7F2
	cmp r2, #1
	beq _0223A820
	cmp r2, #2
	beq _0223A8B4
	b _0223A8EC
_0223A7F2:
	add r0, r1, #0
	add r0, #0xc
	ldr r0, [r4, r0]
	cmp r0, #0
	ble _0223A80C
	add r0, r1, #0
	add r0, #0xc
	ldr r0, [r4, r0]
	add r1, #0xc
	sub r0, r0, #1
	str r0, [r4, r1]
	mov r0, #0
	pop {r4, pc}
_0223A80C:
	mov r0, #0
	add r1, #0xc
	str r0, [r4, r1]
	bl ov57_02239BCC
	ldr r0, _0223A8F0 ; =0x00000404
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _0223A8EC
_0223A820:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0223A8EC
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #3
	add r1, r0, #0
	bl SetBgPriority
	mov r0, #7
	mov r1, #3
	bl SetBgPriority
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	add r0, r4, #0
	mov r1, #0
	bl ov57_0223A034
	add r0, r4, #0
	mov r1, #0
	bl ov57_02239240
	add r0, r4, #0
	mov r1, #0
	bl ov57_022387C0
	add r0, r4, #0
	add r0, #0xec
	mov r1, #1
	bl sub_0200E5D4
	mov r0, #0x47
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #3
	mov r2, #7
	mov r3, #0
	bl ov57_02239728
	mov r0, #0x47
	lsl r0, r0, #2
	add r0, r4, r0
	bl CopyWindowToVram
	add r0, r4, #0
	mov r1, #1
	bl ov57_0223866C
	ldr r2, _0223A8F4 ; =0x04000304
	ldr r1, _0223A8F8 ; =0xFFFF7FFF
	ldrh r0, [r2]
	and r0, r1
	strh r0, [r2]
	add r0, r4, #0
	asr r1, r1, #0x10
	bl ov57_02238AF0
	add r0, r4, #0
	mov r1, #0
	bl ov57_0223B948
	bl ov57_02239BAC
	ldr r0, _0223A8F0 ; =0x00000404
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _0223A8EC
_0223A8B4:
	bl ov57_0223B940
	cmp r0, #1
	beq _0223A8EC
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0223A8EC
	mov r0, #0x32
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DCE8
	mov r1, #0
	add r0, r4, #0
	mov r2, #0xff
	add r3, r1, #0
	bl ov57_0223B828
	add r0, r4, #0
	bl ov57_02239B0C
	ldr r0, _0223A8F0 ; =0x00000404
	mov r1, #0
	str r1, [r4, r0]
	mov r0, #1
	pop {r4, pc}
_0223A8EC:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0223A8F0: .word 0x00000404
_0223A8F4: .word 0x04000304
_0223A8F8: .word 0xFFFF7FFF
	thumb_func_end ov57_0223A7DC

	thumb_func_start ov57_0223A8FC
ov57_0223A8FC: ; 0x0223A8FC
	push {r4, r5, lr}
	sub sp, #0x24
	ldr r1, _0223AB44 ; =0x00000404
	add r4, r0, #0
	ldr r1, [r4, r1]
	cmp r1, #5
	bhi _0223A986
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223A916: ; jump table
	.short _0223A922 - _0223A916 - 2 ; case 0
	.short _0223A97A - _0223A916 - 2 ; case 1
	.short _0223AA20 - _0223A916 - 2 ; case 2
	.short _0223AA30 - _0223A916 - 2 ; case 3
	.short _0223AA98 - _0223A916 - 2 ; case 4
	.short _0223AAD2 - _0223A916 - 2 ; case 5
_0223A922:
	bl ov57_022384C0
	cmp r0, #0
	bne _0223A930
	add sp, #0x24
	mov r0, #0xb
	pop {r4, r5, pc}
_0223A930:
	mov r3, #0
	str r3, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	add r0, r4, #0
	str r3, [sp, #8]
	add r0, #0xe8
	ldr r0, [r0]
	ldr r2, _0223AB48 ; =0x0000080B
	mov r1, #2
	bl sub_02003370
	mov r3, #0
	str r3, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	add r0, r4, #0
	str r3, [sp, #8]
	add r0, #0xe8
	ldr r0, [r0]
	ldr r2, _0223AB4C ; =0x0000FFFF
	mov r1, #8
	bl sub_02003370
	add r0, r4, #0
	mov r1, #0
	bl ov57_0223B948
	mov r0, #1
	mov r1, #0
	bl GX_EngineBToggleLayers
	ldr r0, _0223AB44 ; =0x00000404
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _0223AB3C
_0223A97A:
	add r0, #0xe8
	ldr r0, [r0]
	bl sub_02003B44
	cmp r0, #0
	beq _0223A988
_0223A986:
	b _0223AB3C
_0223A988:
	add r0, r4, #0
	add r0, #0xe8
	ldr r0, [r0]
	mov r1, #0
	bl sub_02003B50
	mov r0, #1
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r2, #4
	add r0, r4, #0
	str r2, [sp, #8]
	mov r1, #0x3a
	str r1, [sp, #0xc]
	add r0, #0xe4
	add r1, #0xf2
	ldr r0, [r0]
	add r1, r4, r1
	mov r3, #2
	bl ov57_022397B0
	add r0, sp, #0x10
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	add r2, sp, #0x10
	str r0, [sp, #0x10]
	mov r0, #4
	str r0, [sp, #0x14]
	mov r0, #0xe6
	str r0, [sp, #0x18]
	mov r0, #5
	str r0, [sp, #0x1c]
	mov r0, #0x19
	strb r0, [r2, #0x10]
	mov r0, #6
	strb r0, [r2, #0x11]
	ldrb r0, [r2, #0x12]
	mov r1, #0xf
	bic r0, r1
	ldr r1, _0223AB50 ; =0x0000040C
	ldr r1, [r4, r1]
	lsl r1, r1, #0x18
	lsr r3, r1, #0x18
	mov r1, #0xf
	and r1, r3
	orr r0, r1
	strb r0, [r2, #0x12]
	mov r0, #0x34
	bl sub_0201660C
	mov r1, #0x91
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	add r1, sp, #0x10
	bl sub_020166FC
	mov r0, #0x4b
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #4
	mov r2, #0xe
	mov r3, #0
	bl ov57_02239728
	ldr r0, _0223AB44 ; =0x00000404
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _0223AB3C
_0223AA20:
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineBToggleLayers
	ldr r0, _0223AB44 ; =0x00000404
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
_0223AA30:
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_020168F4
	add r5, r0, #0
	beq _0223AB3C
	cmp r5, #1
	beq _0223AA46
	cmp r5, #2
	bne _0223AB3C
_0223AA46:
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_020169C0
	ldr r1, _0223AB50 ; =0x0000040C
	str r0, [r4, r1]
	sub r0, r1, #4
	str r5, [r4, r0]
	add r0, r4, #0
	add r0, #0xe8
	ldr r0, [r0]
	mov r1, #1
	bl sub_02003B50
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_020169CC
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02016624
	mov r0, #0x4b
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	bl ClearFrameAndWindow2
	mov r0, #0x4b
	lsl r0, r0, #2
	add r0, r4, r0
	bl RemoveWindow
	ldr r0, _0223AB44 ; =0x00000404
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _0223AB3C
_0223AA98:
	mov r0, #0xa
	str r0, [sp]
	mov r3, #0
	str r3, [sp, #4]
	add r0, r4, #0
	str r3, [sp, #8]
	add r0, #0xe8
	ldr r0, [r0]
	ldr r2, _0223AB48 ; =0x0000080B
	mov r1, #2
	bl sub_02003370
	mov r0, #0xa
	str r0, [sp]
	mov r3, #0
	str r3, [sp, #4]
	add r0, r4, #0
	str r3, [sp, #8]
	add r0, #0xe8
	ldr r0, [r0]
	ldr r2, _0223AB4C ; =0x0000FFFF
	mov r1, #8
	bl sub_02003370
	ldr r0, _0223AB44 ; =0x00000404
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _0223AB3C
_0223AAD2:
	add r0, #0xe8
	ldr r0, [r0]
	bl sub_02003B44
	cmp r0, #0
	bne _0223AB3C
	ldr r0, _0223AB54 ; =0x00000408
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0223AB26
	cmp r0, #1
	beq _0223AAF0
	cmp r0, #2
	beq _0223AB22
	b _0223AB26
_0223AAF0:
	add r0, r4, #0
	bl ov57_0223B774
	add r0, r4, #0
	bl ov57_0223B7A8
	add r0, r4, #0
	bl ov57_022399F8
	add r0, r4, #0
	bl ov57_022383AC
	add r0, r4, #0
	bl ov57_02237F3C
	add r0, r4, #0
	mov r1, #1
	bl ov57_022383D0
	mov r0, #0x41
	mov r1, #0x14
	lsl r0, r0, #4
	mov r5, #6
	str r1, [r4, r0]
	b _0223AB28
_0223AB22:
	mov r5, #4
	b _0223AB28
_0223AB26:
	mov r5, #7
_0223AB28:
	add r0, r4, #0
	mov r1, #1
	bl ov57_0223B948
	ldr r0, _0223AB44 ; =0x00000404
	mov r1, #0
	str r1, [r4, r0]
	add sp, #0x24
	add r0, r5, #0
	pop {r4, r5, pc}
_0223AB3C:
	mov r0, #7
	add sp, #0x24
	pop {r4, r5, pc}
	nop
_0223AB44: .word 0x00000404
_0223AB48: .word 0x0000080B
_0223AB4C: .word 0x0000FFFF
_0223AB50: .word 0x0000040C
_0223AB54: .word 0x00000408
	thumb_func_end ov57_0223A8FC

	thumb_func_start ov57_0223AB58
ov57_0223AB58: ; 0x0223AB58
	push {r4, r5, lr}
	sub sp, #0x84
	ldr r1, _0223AE90 ; =0x00000404
	add r4, r0, #0
	ldr r2, [r4, r1]
	cmp r2, #7
	bls _0223AB68
	b _0223AE4C
_0223AB68:
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0223AB74: ; jump table
	.short _0223AB84 - _0223AB74 - 2 ; case 0
	.short _0223ABF6 - _0223AB74 - 2 ; case 1
	.short _0223AC4A - _0223AB74 - 2 ; case 2
	.short _0223ACAC - _0223AB74 - 2 ; case 3
	.short _0223ACF6 - _0223AB74 - 2 ; case 4
	.short _0223AD38 - _0223AB74 - 2 ; case 5
	.short _0223AD7A - _0223AB74 - 2 ; case 6
	.short _0223ADE2 - _0223AB74 - 2 ; case 7
_0223AB84:
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r3, #0
	str r3, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	add r0, r4, #0
	str r3, [sp, #8]
	add r0, #0xe8
	ldr r0, [r0]
	ldr r2, _0223AE94 ; =0x0000080B
	mov r1, #2
	bl sub_02003370
	mov r3, #0
	str r3, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	add r0, r4, #0
	str r3, [sp, #8]
	add r0, #0xe8
	ldr r0, [r0]
	ldr r2, _0223AE98 ; =0x0000FFFF
	mov r1, #8
	bl sub_02003370
	add r0, r4, #0
	mov r1, #0
	bl ov57_0223B948
	ldr r0, _0223AE9C ; =0x00000408
	mov r1, #0
	str r1, [r4, r0]
	add r0, r4, #0
	bl ov57_0223B7C4
	add r0, r4, #0
	bl ov57_0223B950
	add r0, r4, #0
	mov r1, #1
	bl ov57_0223BB38
	add r0, r4, #0
	mov r1, #0
	add r0, #0xec
	mov r2, #0xd
	add r3, r1, #0
	bl ov57_02239728
	ldr r0, _0223AE90 ; =0x00000404
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _0223AE88
_0223ABF6:
	add r0, #0xe8
	ldr r0, [r0]
	bl sub_02003B44
	cmp r0, #0
	beq _0223AC04
	b _0223AE88
_0223AC04:
	mov r0, #0x34
	str r0, [sp, #0x60]
	mov r1, #1
	mov r2, #0
	mov r0, #0xff
	str r0, [sp, #0x68]
	add r0, r4, #0
	str r1, [sp, #0x5c]
	str r1, [sp, #0x74]
	str r2, [sp, #0x64]
	str r2, [sp, #0x70]
	add r0, #0xdc
	ldr r0, [r0]
	mov r1, #0x9b
	str r0, [sp, #0x78]
	add r0, r4, #0
	add r0, #0xe8
	ldr r0, [r0]
	str r0, [sp, #0x7c]
	ldr r0, _0223AEA0 ; =0x00000458
	ldr r0, [r4, r0]
	bl GetMonData
	str r0, [sp, #0x6c]
	add r0, sp, #0x5c
	bl ov07_02233DB8
	mov r1, #0x95
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, _0223AE90 ; =0x00000404
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _0223AE88
_0223AC4A:
	add r2, sp, #0x38
	mov r0, #0
	str r0, [r2]
	str r0, [r2, #4]
	str r0, [r2, #8]
	mov r0, #1
	str r0, [sp, #0x38]
	add r0, r1, #0
	add r0, #0x54
	ldr r0, [r4, r0]
	sub r1, #0x18
	str r0, [sp, #0x40]
	ldr r0, [r4, r1]
	add r1, r4, #0
	add r0, r0, #1
	str r0, [sp, #0xc]
	add r0, sp, #0x44
	bl ov57_0223857C
	ldr r0, _0223AEA0 ; =0x00000458
	mov r1, #0xa2
	ldr r0, [r4, r0]
	add r2, sp, #0xc
	bl SetMonData
	ldr r0, _0223AEA0 ; =0x00000458
	mov r1, #0xab
	ldr r0, [r4, r0]
	add r2, sp, #0x44
	bl SetMonData
	mov r0, #0x34
	add r1, sp, #0x38
	bl ov07_02232694
	mov r1, #0x25
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	bl ov07_022329B0
	ldr r0, _0223AE90 ; =0x00000404
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	mov r1, #0
	add r0, r0, #4
	str r1, [r4, r0]
	b _0223AE88
_0223ACAC:
	mov r0, #0x25
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ov07_02232A04
	cmp r0, #1
	bne _0223AD64
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov07_02233EA0
	cmp r0, #1
	bne _0223AD64
	add r0, r4, #0
	bl ov57_0223BA40
	mov r0, #0x25
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ov07_02232A44
	add r0, r4, #0
	mov r1, #0
	bl ov57_0223BB38
	add r0, r4, #0
	bl ov57_0223BA1C
	ldr r0, _0223AEA4 ; =0x000006C5
	bl PlaySE
	ldr r0, _0223AE90 ; =0x00000404
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _0223AE88
_0223ACF6:
	bl ov57_0223BA40
	add r5, r0, #0
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov07_02233E88
	cmp r0, #0
	bne _0223AD64
	cmp r5, #0
	bne _0223AD64
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov07_02233ECC
	mov r0, #0x10
	mov r1, #0
	bl GX_EngineAToggleLayers
	add r0, r4, #0
	bl ov57_0223B9C8
	ldr r0, _0223AE9C ; =0x00000408
	mov r1, #0
	str r1, [r4, r0]
	sub r1, r0, #4
	ldr r1, [r4, r1]
	sub r0, r0, #4
	add r1, r1, #1
	str r1, [r4, r0]
	b _0223AE88
_0223AD38:
	mov r0, #0x25
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ov07_02232A54
	cmp r0, #0
	bne _0223AD64
	mov r0, #0xa1
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_02017068
	cmp r0, #1
	bne _0223AD64
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_020085DC
	cmp r0, #0
	beq _0223AD66
_0223AD64:
	b _0223AE88
_0223AD66:
	mov r0, #0x25
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ov07_02232AB8
	ldr r0, _0223AE90 ; =0x00000404
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _0223AE88
_0223AD7A:
	add r0, r1, #4
	ldr r0, [r4, r0]
	add r2, r0, #1
	add r0, r1, #4
	str r2, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0x1e
	blt _0223AE88
	add r0, r1, #4
	mov r2, #0
	str r2, [r4, r0]
	mov r0, #0x34
	mov r3, #1
	str r0, [sp, #0x14]
	mov r0, #5
	str r0, [sp, #0x18]
	mov r0, #0xff
	str r0, [sp, #0x1c]
	add r0, r4, #0
	str r3, [sp, #0x10]
	str r2, [sp, #0x24]
	str r3, [sp, #0x28]
	add r0, #0xdc
	ldr r0, [r0]
	add r1, #0x54
	str r0, [sp, #0x2c]
	add r0, r4, #0
	add r0, #0xe8
	ldr r0, [r0]
	str r0, [sp, #0x30]
	ldr r0, [r4, r1]
	mov r1, #0x9b
	bl GetMonData
	str r0, [sp, #0x20]
	add r0, sp, #0x10
	bl ov07_02233DB8
	mov r1, #0x95
	lsl r1, r1, #2
	str r0, [r4, r1]
	bl ov57_0223BB5C
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	ldr r0, _0223AE90 ; =0x00000404
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _0223AE88
_0223ADE2:
	bl ov57_0223BABC
	add r5, r0, #0
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov07_02233E88
	cmp r0, #0
	bne _0223AE88
	cmp r5, #0
	bne _0223AE88
	mov r0, #0xa
	str r0, [sp]
	mov r3, #0
	str r3, [sp, #4]
	add r0, r4, #0
	str r3, [sp, #8]
	add r0, #0xe8
	ldr r0, [r0]
	ldr r2, _0223AE94 ; =0x0000080B
	mov r1, #2
	bl sub_02003370
	mov r0, #0xa
	str r0, [sp]
	mov r3, #0
	str r3, [sp, #4]
	add r0, r4, #0
	str r3, [sp, #8]
	add r0, #0xe8
	ldr r0, [r0]
	ldr r2, _0223AE98 ; =0x0000FFFF
	mov r1, #8
	bl sub_02003370
	add r0, r4, #0
	mov r1, #1
	bl ov57_0223BB38
	add r0, r4, #0
	bl ov57_0223BB4C
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov07_02233ECC
	ldr r0, _0223AE90 ; =0x00000404
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _0223AE88
_0223AE4C:
	add r0, r4, #0
	add r0, #0xe8
	ldr r0, [r0]
	bl sub_02003B44
	cmp r0, #0
	bne _0223AE88
	mov r0, #0x10
	mov r1, #0
	bl GX_EngineAToggleLayers
	add r0, r4, #0
	mov r1, #1
	bl ov57_0223B948
	mov r1, #0
	ldr r0, _0223AE90 ; =0x00000404
	mov r2, #4
	str r1, [r4, r0]
	sub r0, #8
	str r2, [r4, r0]
	add r4, #0xec
	ldr r2, _0223AE98 ; =0x0000FFFF
	add r0, r4, #0
	add r3, r1, #0
	bl ov57_02239728
	add sp, #0x84
	mov r0, #4
	pop {r4, r5, pc}
_0223AE88:
	mov r0, #5
	add sp, #0x84
	pop {r4, r5, pc}
	nop
_0223AE90: .word 0x00000404
_0223AE94: .word 0x0000080B
_0223AE98: .word 0x0000FFFF
_0223AE9C: .word 0x00000408
_0223AEA0: .word 0x00000458
_0223AEA4: .word 0x000006C5
	thumb_func_end ov57_0223AB58

	thumb_func_start ov57_0223AEA8
ov57_0223AEA8: ; 0x0223AEA8
	push {r4, r5, r6, lr}
	add r4, r2, #0
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0xd8
	ldr r0, [r0]
	add r6, r1, #0
	cmp r0, #0
	bne _0223AEBC
	b _0223B100
_0223AEBC:
	cmp r5, #0x14
	bls _0223AEC2
	b _0223B0FC
_0223AEC2:
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223AECE: ; jump table
	.short _0223B036 - _0223AECE - 2 ; case 0
	.short _0223B036 - _0223AECE - 2 ; case 1
	.short _0223B036 - _0223AECE - 2 ; case 2
	.short _0223B036 - _0223AECE - 2 ; case 3
	.short _0223B036 - _0223AECE - 2 ; case 4
	.short _0223B036 - _0223AECE - 2 ; case 5
	.short _0223B036 - _0223AECE - 2 ; case 6
	.short _0223B036 - _0223AECE - 2 ; case 7
	.short _0223AEF8 - _0223AECE - 2 ; case 8
	.short _0223AF42 - _0223AECE - 2 ; case 9
	.short _0223AF90 - _0223AECE - 2 ; case 10
	.short _0223AFBE - _0223AECE - 2 ; case 11
	.short _0223AFFC - _0223AECE - 2 ; case 12
	.short _0223B0CC - _0223AECE - 2 ; case 13
	.short _0223B0CC - _0223AECE - 2 ; case 14
	.short _0223B0CC - _0223AECE - 2 ; case 15
	.short _0223B0CC - _0223AECE - 2 ; case 16
	.short _0223B0CC - _0223AECE - 2 ; case 17
	.short _0223B0CC - _0223AECE - 2 ; case 18
	.short _0223B0CC - _0223AECE - 2 ; case 19
	.short _0223B0CC - _0223AECE - 2 ; case 20
_0223AEF8:
	cmp r6, #0
	bne _0223AF36
	ldr r1, _0223B104 ; =0x00000448
	ldr r0, [r4, r1]
	cmp r0, #0
	ble _0223AF06
	b _0223AF0A
_0223AF06:
	add r0, r1, #4
	ldr r0, [r4, r0]
_0223AF0A:
	sub r0, r0, #1
	str r0, [r4, r1]
	add r0, r4, #0
	bl ov57_02238AC0
	ldr r1, _0223B104 ; =0x00000448
	add r0, r4, #0
	ldr r1, [r4, r1]
	bl ov57_022388E4
	add r0, r4, #0
	bl ov57_02238958
	add r0, r4, #0
	bl ov57_02238A00
	add r0, r4, #0
	bl ov57_022399F8
	ldr r0, _0223B108 ; =0x000006C4
	bl PlaySE
_0223AF36:
	ldr r0, _0223B10C ; =0x00000434
	add r1, r6, #0
	ldr r0, [r4, r0]
	bl ov57_0223B858
	pop {r4, r5, r6, pc}
_0223AF42:
	cmp r6, #0
	bne _0223AF84
	ldr r1, _0223B104 ; =0x00000448
	ldr r0, [r4, r1]
	add r0, r0, #1
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl _s32_div_f
	ldr r0, _0223B104 ; =0x00000448
	str r1, [r4, r0]
	add r0, r4, #0
	bl ov57_02238AC0
	ldr r1, _0223B104 ; =0x00000448
	add r0, r4, #0
	ldr r1, [r4, r1]
	bl ov57_022388E4
	add r0, r4, #0
	bl ov57_02238958
	add r0, r4, #0
	bl ov57_02238A00
	add r0, r4, #0
	bl ov57_022399F8
	ldr r0, _0223B108 ; =0x000006C4
	bl PlaySE
_0223AF84:
	ldr r0, _0223B110 ; =0x00000438
	add r1, r6, #0
	ldr r0, [r4, r0]
	bl ov57_0223B858
	pop {r4, r5, r6, pc}
_0223AF90:
	cmp r6, #0
	bne _0223AFB2
	mov r0, #0xff
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #5
	beq _0223AFA8
	mov r1, #5
	str r1, [r4, r0]
	ldr r0, _0223B114 ; =0x000005DD
	bl PlaySE
_0223AFA8:
	ldr r0, _0223B118 ; =0x0000043C
	mov r1, #0
	ldr r0, [r4, r0]
	bl ov57_0223B90C
_0223AFB2:
	ldr r0, _0223B118 ; =0x0000043C
	add r1, r6, #0
	ldr r0, [r4, r0]
	bl ov57_0223B858
	pop {r4, r5, r6, pc}
_0223AFBE:
	cmp r6, #0
	bne _0223AFEE
	mov r0, #0xff
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #6
	beq _0223AFDE
	mov r1, #6
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #0
	bl ov57_0223B948
	ldr r0, _0223B11C ; =0x000005E2
	bl PlaySE
_0223AFDE:
	mov r0, #0x11
	mov r1, #0x26
	lsl r0, r0, #6
	lsl r1, r1, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	bl ov57_0223B90C
_0223AFEE:
	mov r0, #0x11
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	add r1, r6, #0
	bl ov57_0223B858
	pop {r4, r5, r6, pc}
_0223AFFC:
	cmp r6, #0
	bne _0223B02A
	mov r0, #0xff
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #7
	beq _0223B01C
	mov r1, #7
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #0
	bl ov57_0223B948
	ldr r0, _0223B114 ; =0x000005DD
	bl PlaySE
_0223B01C:
	ldr r0, _0223B120 ; =0x00000444
	mov r1, #0x99
	lsl r1, r1, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	bl ov57_0223B90C
_0223B02A:
	ldr r0, _0223B120 ; =0x00000444
	add r1, r6, #0
	ldr r0, [r4, r0]
	bl ov57_0223B858
	pop {r4, r5, r6, pc}
_0223B036:
	cmp r6, #0
	bne _0223B100
	add r0, r4, #0
	bl ov57_02238028
	cmp r0, #0
	bne _0223B05A
	ldr r0, _0223B124 ; =0x000005F2
	bl PlaySE
	add r4, #0xec
	mov r1, #0
	add r0, r4, #0
	mov r2, #0xf
	add r3, r1, #0
	bl ov57_02239728
	pop {r4, r5, r6, pc}
_0223B05A:
	mov r0, #0x45
	lsl r0, r0, #4
	add r6, r4, r0
	ldrb r1, [r6, r5]
	cmp r1, #0
	beq _0223B0B0
	ldr r0, [r4, #0x64]
	sub r1, r1, #1
	bl SealCaseInventory_GetSealQuantity
	cmp r0, #0
	beq _0223B0B0
	lsl r1, r5, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	bl ov57_02237FAC
	add r1, r4, #0
	add r1, #0xd4
	str r0, [r1]
	ldrb r0, [r6, r5]
	bl sub_0209106C
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0xec
	bl ov57_02239B2C
	ldr r0, [r4]
	mov r2, #0
	ldrb r1, [r6, r5]
	ldr r0, [r0, #0x20]
	mvn r2, r2
	bl GiveOrTakeSeal
	add r0, r4, #0
	add r1, r5, #0
	bl ov57_02239A8C
	ldr r0, _0223B128 ; =0x000005EB
	bl PlaySE
	pop {r4, r5, r6, pc}
_0223B0B0:
	ldrb r0, [r6, r5]
	cmp r0, #0
	beq _0223B100
	ldr r0, _0223B124 ; =0x000005F2
	bl PlaySE
	add r4, #0xec
	mov r1, #0
	add r0, r4, #0
	mov r2, #0x10
	add r3, r1, #0
	bl ov57_02239728
	pop {r4, r5, r6, pc}
_0223B0CC:
	cmp r6, #0
	bne _0223B100
	sub r5, #0xd
	lsl r2, r5, #0x18
	add r0, r4, #0
	lsr r2, r2, #0x18
	bl ov57_022382F8
	lsl r0, r5, #4
	add r1, r4, r0
	mov r0, #0x35
	lsl r0, r0, #4
	ldrb r0, [r1, r0]
	bl sub_0209106C
	add r4, #0xec
	add r1, r0, #0
	add r0, r4, #0
	bl ov57_02239B2C
	ldr r0, _0223B128 ; =0x000005EB
	bl PlaySE
	pop {r4, r5, r6, pc}
_0223B0FC:
	bl GF_AssertFail
_0223B100:
	pop {r4, r5, r6, pc}
	nop
_0223B104: .word 0x00000448
_0223B108: .word 0x000006C4
_0223B10C: .word 0x00000434
_0223B110: .word 0x00000438
_0223B114: .word 0x000005DD
_0223B118: .word 0x0000043C
_0223B11C: .word 0x000005E2
_0223B120: .word 0x00000444
_0223B124: .word 0x000005F2
_0223B128: .word 0x000005EB
	thumb_func_end ov57_0223AEA8

	thumb_func_start ov57_0223B12C
ov57_0223B12C: ; 0x0223B12C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0223B178 ; =0x0000040C
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _0223B156
	bl System_GetTouchHeld
	cmp r0, #0
	beq _0223B144
	mov r0, #0
	pop {r4, pc}
_0223B144:
	ldr r0, _0223B17C ; =gSystem
	ldr r0, [r0, #0x44]
	cmp r0, #0
	beq _0223B174
	ldr r0, _0223B178 ; =0x0000040C
	mov r1, #0
	str r1, [r4, r0]
	mov r0, #1
	pop {r4, pc}
_0223B156:
	ldr r0, _0223B17C ; =gSystem
	ldr r0, [r0, #0x44]
	cmp r0, #0
	beq _0223B162
	mov r0, #0
	pop {r4, pc}
_0223B162:
	bl System_GetTouchHeld
	cmp r0, #0
	beq _0223B174
	ldr r0, _0223B178 ; =0x0000040C
	mov r1, #1
	str r1, [r4, r0]
	mov r0, #0
	pop {r4, pc}
_0223B174:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0223B178: .word 0x0000040C
_0223B17C: .word gSystem
	thumb_func_end ov57_0223B12C

	thumb_func_start ov57_0223B180
ov57_0223B180: ; 0x0223B180
	push {r4, lr}
	add r4, r0, #0
	bl ov57_0223B12C
	ldr r0, _0223B1A0 ; =0x0000040C
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0223B198
	add r0, r4, #0
	bl ov57_0223B288
	pop {r4, pc}
_0223B198:
	add r0, r4, #0
	bl ov57_0223B2EC
	pop {r4, pc}
	.balign 4, 0
_0223B1A0: .word 0x0000040C
	thumb_func_end ov57_0223B180

	thumb_func_start ov57_0223B1A4
ov57_0223B1A4: ; 0x0223B1A4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0xc
	beq _0223B1B4
	cmp r4, #0xd
	beq _0223B1C6
	b _0223B1FA
_0223B1B4:
	ldr r0, _0223B27C ; =0x000005DD
	bl PlaySE
	ldr r0, [r5]
	mov r1, #0
	bl ov57_02237E88
	mov r0, #5
	pop {r3, r4, r5, pc}
_0223B1C6:
	mov r0, #0x47
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #3
	mov r2, #8
	mov r3, #0
	bl ov57_02239728
	mov r0, #0xfb
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r5, #0
	str r0, [sp]
	add r0, r5, #0
	add r0, #0xe4
	ldr r0, [r0]
	add r1, #0xfc
	mov r2, #1
	add r3, r5, #0
	bl ov57_02238C30
	ldr r0, _0223B280 ; =0x000005DC
	bl PlaySE
	mov r0, #4
	pop {r3, r4, r5, pc}
_0223B1FA:
	bl ov57_02238134
	add r0, r5, #0
	bl ov57_0223853C
	add r0, r5, #0
	bl ov57_022394AC
	mov r0, #0xfb
	lsl r0, r0, #2
	str r4, [r5, r0]
	add r0, r5, #0
	mov r1, #0
	mov r2, #1
	bl ov57_0223B504
	add r0, r5, #0
	bl ov57_022383AC
	add r0, r5, #0
	bl ov57_02237F3C
	add r0, r5, #0
	mov r1, #1
	bl ov57_022383D0
	add r0, r5, #0
	bl ov57_02237F14
	ldr r0, _0223B284 ; =0x0000040C
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _0223B244
	ldr r0, _0223B280 ; =0x000005DC
	bl PlaySE
	b _0223B278
_0223B244:
	mov r0, #0x47
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #3
	mov r2, #8
	mov r3, #0
	bl ov57_02239728
	mov r0, #0xfb
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r5, #0
	str r0, [sp]
	add r0, r5, #0
	add r0, #0xe4
	ldr r0, [r0]
	add r1, #0xfc
	mov r2, #1
	add r3, r5, #0
	bl ov57_02238C30
	ldr r0, _0223B280 ; =0x000005DC
	bl PlaySE
	mov r0, #4
	pop {r3, r4, r5, pc}
_0223B278:
	mov r0, #3
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223B27C: .word 0x000005DD
_0223B280: .word 0x000005DC
_0223B284: .word 0x0000040C
	thumb_func_end ov57_0223B1A4

	thumb_func_start ov57_0223B288
ov57_0223B288: ; 0x0223B288
	push {r3, r4, lr}
	sub sp, #4
	ldr r2, _0223B2E8 ; =gSystem
	mov r1, #2
	ldr r3, [r2, #0x48]
	add r4, r0, #0
	tst r1, r3
	beq _0223B2A2
	mov r1, #0xc
	bl ov57_0223B1A4
	add sp, #4
	pop {r3, r4, pc}
_0223B2A2:
	mov r1, #1
	tst r1, r3
	beq _0223B2B2
	mov r1, #0xd
	bl ov57_0223B1A4
	add sp, #4
	pop {r3, r4, pc}
_0223B2B2:
	ldr r1, [r2, #0x4c]
	mov r0, #0xf0
	tst r0, r1
	bne _0223B2C0
	add sp, #4
	mov r0, #3
	pop {r3, r4, pc}
_0223B2C0:
	mov r0, #0xfb
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	str r0, [sp]
	add r0, sp, #0
	bl ov57_0223B478
	cmp r0, #0
	bne _0223B2D8
	add sp, #4
	mov r0, #3
	pop {r3, r4, pc}
_0223B2D8:
	ldr r1, [sp]
	add r0, r4, #0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov57_0223B1A4
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0223B2E8: .word gSystem
	thumb_func_end ov57_0223B288

	thumb_func_start ov57_0223B2EC
ov57_0223B2EC: ; 0x0223B2EC
	push {r4, lr}
	add r4, r0, #0
	bl ov57_0223B578
	add r1, r0, #0
	bpl _0223B2FC
	mov r0, #3
	pop {r4, pc}
_0223B2FC:
	lsl r1, r1, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	bl ov57_0223B1A4
	pop {r4, pc}
	thumb_func_end ov57_0223B2EC

	thumb_func_start ov57_0223B308
ov57_0223B308: ; 0x0223B308
	push {r4, lr}
	add r4, r0, #0
	bl ov57_0223B12C
	ldr r0, _0223B328 ; =0x0000040C
	ldr r0, [r4, r0]
	cmp r0, #0
	bne gApp_MainMenu_SelectOption_ConnectToRanger
	add r0, r4, #0
	bl ov57_0223B3F8
	pop {r4, pc}
gApp_MainMenu_SelectOption_ConnectToRanger:
	add r0, r4, #0
	bl ov57_0223B45C
	pop {r4, pc}
	.balign 4, 0
_0223B328: .word 0x0000040C
	thumb_func_end ov57_0223B308

	thumb_func_start ov57_0223B32C
ov57_0223B32C: ; 0x0223B32C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #4
	ldr r2, [r4, r0]
	sub r0, r0, #4
	ldr r3, [r4, r0]
	cmp r3, r2
	bne _0223B340
	mov r1, #0
_0223B340:
	cmp r1, #0
	beq _0223B36E
	add r0, r4, #0
	add r1, r3, #0
	bl ov57_022394D8
	mov r1, #1
	add r0, r4, #0
	add r2, r1, #0
	bl ov57_0223B504
	add r4, #0xec
	add r0, r4, #0
	mov r1, #0
	mov r2, #0xb
	mov r3, #1
	bl ov57_02239728
	ldr r0, _0223B39C ; =0x000005DC
	bl PlaySE
	mov r0, #2
	pop {r4, pc}
_0223B36E:
	mov r0, #0x32
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DCE8
	mov r0, #0xc7
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DC4C
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov57_0223B504
	ldr r0, _0223B3A0 ; =0x000005DD
	bl PlaySE
	mov r0, #3
	pop {r4, pc}
	nop
_0223B39C: .word 0x000005DC
_0223B3A0: .word 0x000005DD
	thumb_func_end ov57_0223B32C

	thumb_func_start ov57_0223B3A4
ov57_0223B3A4: ; 0x0223B3A4
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #0xc
	beq _0223B3B2
	cmp r1, #0xd
	beq _0223B3BA
	b _0223B3C2
_0223B3B2:
	mov r1, #0
	bl ov57_0223B32C
	pop {r4, pc}
_0223B3BA:
	mov r1, #1
	bl ov57_0223B32C
	pop {r4, pc}
_0223B3C2:
	mov r2, #0x3f
	lsl r2, r2, #4
	str r1, [r4, r2]
	mov r1, #1
	mov r2, #0
	bl ov57_0223B504
	ldr r0, _0223B3F0 ; =0x0000040C
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0223B3E0
	ldr r0, _0223B3F4 ; =0x000005DC
	bl PlaySE
	b _0223B3EA
_0223B3E0:
	add r0, r4, #0
	mov r1, #1
	bl ov57_0223B32C
	pop {r4, pc}
_0223B3EA:
	mov r0, #1
	pop {r4, pc}
	nop
_0223B3F0: .word 0x0000040C
_0223B3F4: .word 0x000005DC
	thumb_func_end ov57_0223B3A4

	thumb_func_start ov57_0223B3F8
ov57_0223B3F8: ; 0x0223B3F8
	push {r3, r4, lr}
	sub sp, #4
	ldr r2, _0223B458 ; =gSystem
	mov r1, #2
	ldr r3, [r2, #0x48]
	add r4, r0, #0
	tst r1, r3
	beq _0223B412
	mov r1, #0xc
	bl ov57_0223B3A4
	add sp, #4
	pop {r3, r4, pc}
_0223B412:
	mov r1, #1
	tst r3, r1
	beq _0223B422
	mov r1, #0xd
	bl ov57_0223B3A4
	add sp, #4
	pop {r3, r4, pc}
_0223B422:
	ldr r2, [r2, #0x4c]
	mov r0, #0xf0
	tst r0, r2
	bne _0223B430
	add sp, #4
	add r0, r1, #0
	pop {r3, r4, pc}
_0223B430:
	mov r0, #0x3f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	str r0, [sp]
	add r0, sp, #0
	bl ov57_0223B478
	cmp r0, #0
	bne _0223B448
	add sp, #4
	mov r0, #1
	pop {r3, r4, pc}
_0223B448:
	ldr r1, [sp]
	add r0, r4, #0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov57_0223B3A4
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0223B458: .word gSystem
	thumb_func_end ov57_0223B3F8

	thumb_func_start ov57_0223B45C
ov57_0223B45C: ; 0x0223B45C
	push {r4, lr}
	add r4, r0, #0
	bl ov57_0223B578
	add r1, r0, #0
	bpl _0223B46C
	mov r0, #1
	pop {r4, pc}
_0223B46C:
	lsl r1, r1, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	bl ov57_0223B3A4
	pop {r4, pc}
	thumb_func_end ov57_0223B45C

	thumb_func_start ov57_0223B478
ov57_0223B478: ; 0x0223B478
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0223B500 ; =gSystem
	mov r1, #0x10
	ldr r0, [r0, #0x4c]
	tst r1, r0
	beq _0223B496
	ldr r0, [r4]
	mov r1, #0xc
	add r0, r0, #1
	str r0, [r4]
	bl _s32_div_f
	str r1, [r4]
	b _0223B4FC
_0223B496:
	mov r1, #0x20
	tst r1, r0
	beq _0223B4AE
	ldr r0, [r4]
	cmp r0, #0
	ble _0223B4A8
	sub r0, r0, #1
	str r0, [r4]
	b _0223B4FC
_0223B4A8:
	mov r0, #0xb
	str r0, [r4]
	b _0223B4FC
_0223B4AE:
	mov r1, #0x40
	tst r1, r0
	beq _0223B4D2
	ldr r1, [r4]
	asr r0, r1, #1
	lsr r0, r0, #0x1e
	add r0, r1, r0
	asr r0, r0, #2
	beq _0223B4CE
	sub r0, r1, #4
	mov r1, #0xc
	str r0, [r4]
	bl _s32_div_f
	str r1, [r4]
	b _0223B4FC
_0223B4CE:
	mov r0, #0
	pop {r4, pc}
_0223B4D2:
	mov r1, #0x80
	tst r0, r1
	beq _0223B4F8
	ldr r1, [r4]
	asr r0, r1, #1
	lsr r0, r0, #0x1e
	add r0, r1, r0
	asr r0, r0, #2
	cmp r0, #2
	beq _0223B4F4
	add r0, r1, #4
	mov r1, #0xc
	str r0, [r4]
	bl _s32_div_f
	str r1, [r4]
	b _0223B4FC
_0223B4F4:
	mov r0, #0
	pop {r4, pc}
_0223B4F8:
	mov r0, #0
	pop {r4, pc}
_0223B4FC:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_0223B500: .word gSystem
	thumb_func_end ov57_0223B478

	thumb_func_start ov57_0223B504
ov57_0223B504: ; 0x0223B504
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	mov r4, #0
	str r2, [sp]
	cmp r1, #0
	bne _0223B514
	mov r4, #1
_0223B514:
	mov r0, #0xfb
	lsl r0, r0, #2
	lsl r6, r1, #2
	add r7, r5, r0
	add r1, sp, #4
	ldr r0, [r7, r6]
	add r1, #2
	add r2, sp, #4
	bl ov57_02238DAC
	mov r0, #0xc7
	add r1, r5, r6
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	add r3, sp, #4
	mov r1, #2
	mov r2, #0
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	bl sub_0200DDB8
	ldr r0, [sp]
	cmp r0, #1
	bne _0223B572
	mov r0, #0xfb
	lsl r0, r0, #2
	add r1, r5, r0
	ldr r0, [r7, r6]
	lsl r4, r4, #2
	str r0, [r1, r4]
	ldr r0, [r1, r4]
	add r1, sp, #4
	add r1, #2
	add r2, sp, #4
	bl ov57_02238DAC
	mov r0, #0xc7
	add r1, r5, r4
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	add r3, sp, #4
	mov r1, #2
	mov r2, #0
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	bl sub_0200DDB8
_0223B572:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov57_0223B504

	thumb_func_start ov57_0223B578
ov57_0223B578: ; 0x0223B578
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp, #4]
	bl System_GetTouchNew
	cmp r0, #0
	bne _0223B58E
	mov r0, #0
	add sp, #0x18
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0223B58E:
	mov r0, #0xfe
	add r6, sp, #0x10
	strb r0, [r6, #2]
	mov r0, #0x18
	add r7, sp, #0x10
	str r0, [sp, #8]
	strb r0, [r6, #5]
	mov r0, #0
	str r0, [sp, #0xc]
	add r7, #2
_0223B5A2:
	ldr r0, [sp, #8]
	mov r4, #0
	strb r0, [r6, #4]
	mov r5, #0x28
_0223B5AA:
	add r0, r7, #0
	strb r5, [r6, #3]
	bl sub_02025320
	cmp r0, #0
	beq _0223B5C0
	ldr r0, [sp, #0xc]
	add sp, #0x18
	lsl r0, r0, #2
	add r0, r4, r0
	pop {r3, r4, r5, r6, r7, pc}
_0223B5C0:
	add r4, r4, #1
	add r5, #0x38
	cmp r4, #4
	blt _0223B5AA
	ldr r0, [sp, #8]
	add r0, #0x38
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #3
	blt _0223B5A2
	ldr r0, _0223B618 ; =ov57_0223BEB0
	bl sub_02025224
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _0223B614
	lsr r1, r0, #0x16
	add r0, sp, #0x10
	strh r1, [r0]
	add r0, sp, #0x10
	str r0, [sp]
	ldr r0, [sp, #4]
	ldr r3, _0223B61C ; =gSystem + 0x40
	add r0, #0xe4
	ldrh r2, [r3, #0x20]
	str r0, [sp, #4]
	ldrh r3, [r3, #0x22]
	ldr r0, [r0]
	mov r1, #3
	bl DoesPixelAtScreenXYMatchPtrVal
	cmp r0, #0
	bne _0223B610
	mov r4, #0
	mvn r4, r4
	b _0223B612
_0223B610:
	add r4, #0xc
_0223B612:
	add r0, r4, #0
_0223B614:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223B618: .word ov57_0223BEB0
_0223B61C: .word gSystem + 0x40
	thumb_func_end ov57_0223B578

	thumb_func_start ov57_0223B620
ov57_0223B620: ; 0x0223B620
	push {r4, lr}
	add r4, r0, #0
	bl ov57_0223B12C
	ldr r0, _0223B6D8 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _0223B668
	add r0, r4, #0
	add r0, #0xd4
	ldr r0, [r0]
	cmp r0, #0xff
	beq _0223B646
	ldr r0, _0223B6DC ; =0x000005F2
	bl PlaySE
	mov r0, #4
	pop {r4, pc}
_0223B646:
	add r0, r4, #0
	mov r1, #0
	bl ov57_0223B948
	ldr r0, _0223B6E0 ; =0x000005E2
	bl PlaySE
	mov r0, #0x11
	mov r1, #0x26
	lsl r0, r0, #6
	lsl r1, r1, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	bl ov57_0223B90C
	mov r0, #6
	pop {r4, pc}
_0223B668:
	mov r0, #2
	tst r0, r1
	beq _0223B6A2
	add r0, r4, #0
	add r0, #0xd4
	ldr r0, [r0]
	cmp r0, #0xff
	beq _0223B682
	ldr r0, _0223B6DC ; =0x000005F2
	bl PlaySE
	mov r0, #4
	pop {r4, pc}
_0223B682:
	add r0, r4, #0
	mov r1, #0
	bl ov57_0223B948
	ldr r0, _0223B6E4 ; =0x000005DD
	bl PlaySE
	ldr r0, _0223B6E8 ; =0x00000444
	mov r1, #0x99
	lsl r1, r1, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	bl ov57_0223B90C
	mov r0, #7
	pop {r4, pc}
_0223B6A2:
	mov r0, #3
	lsl r0, r0, #0xa
	tst r0, r1
	beq _0223B6D2
	add r0, r4, #0
	add r0, #0xd4
	ldr r0, [r0]
	cmp r0, #0xff
	beq _0223B6BE
	ldr r0, _0223B6DC ; =0x000005F2
	bl PlaySE
	mov r0, #4
	pop {r4, pc}
_0223B6BE:
	ldr r0, _0223B6E4 ; =0x000005DD
	bl PlaySE
	ldr r0, _0223B6EC ; =0x0000043C
	mov r1, #0
	ldr r0, [r4, r0]
	bl ov57_0223B90C
	mov r0, #5
	pop {r4, pc}
_0223B6D2:
	mov r0, #4
	pop {r4, pc}
	nop
_0223B6D8: .word gSystem
_0223B6DC: .word 0x000005F2
_0223B6E0: .word 0x000005E2
_0223B6E4: .word 0x000005DD
_0223B6E8: .word 0x00000444
_0223B6EC: .word 0x0000043C
	thumb_func_end ov57_0223B620

	thumb_func_start ov57_0223B6F0
ov57_0223B6F0: ; 0x0223B6F0
	push {r3, lr}
	mov r1, #1
	mov r2, #0
	mov r3, #3
	bl ov57_0223B828
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov57_0223B6F0

	thumb_func_start ov57_0223B700
ov57_0223B700: ; 0x0223B700
	push {r4, lr}
	add r4, r0, #0
	bl ov57_02238D80
	add r0, r4, #0
	mov r1, #1
	bl ov57_0223866C
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov57_0223B700

	thumb_func_start ov57_0223B714
ov57_0223B714: ; 0x0223B714
	push {r4, lr}
	add r4, r0, #0
	bl ov57_02238134
	add r0, r4, #0
	bl ov57_0223853C
	add r0, r4, #0
	bl ov57_022394AC
	ldr r0, [r4]
	mov r1, #1
	bl ov57_02237E88
	mov r0, #0xff
	mov r1, #5
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov57_0223B714

	thumb_func_start ov57_0223B73C
ov57_0223B73C: ; 0x0223B73C
	push {r3, lr}
	mov r1, #2
	mov r2, #0
	mov r3, #3
	bl ov57_0223B828
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov57_0223B73C

	thumb_func_start ov57_0223B74C
ov57_0223B74C: ; 0x0223B74C
	push {r3, lr}
	mov r1, #3
	mov r2, #0
	add r3, r1, #0
	bl ov57_0223B828
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov57_0223B74C

	thumb_func_start ov57_0223B75C
ov57_0223B75C: ; 0x0223B75C
	add r1, r0, #0
	mov r0, #0xfb
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	ldr r3, _0223B770 ; =CopyCapsule
	lsl r0, r0, #3
	add r0, r1, r0
	ldr r0, [r0, #8]
	add r1, #0x68
	bx r3
	.balign 4, 0
_0223B770: .word CopyCapsule
	thumb_func_end ov57_0223B75C

	thumb_func_start ov57_0223B774
ov57_0223B774: ; 0x0223B774
	mov r1, #0xfb
	add r2, r0, #0
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	ldr r3, _0223B788 ; =CopyCapsule
	lsl r1, r1, #3
	add r1, r2, r1
	add r0, #0x68
	ldr r1, [r1, #8]
	bx r3
	.balign 4, 0
_0223B788: .word CopyCapsule
	thumb_func_end ov57_0223B774

	thumb_func_start ov57_0223B78C
ov57_0223B78C: ; 0x0223B78C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_0223B792:
	ldr r0, [r5, #0x64]
	add r1, r4, #0
	bl SealCaseInventory_GetSealQuantity
	add r1, r5, r4
	add r1, #0x80
	add r4, r4, #1
	strb r0, [r1]
	cmp r4, #0x51
	blt _0223B792
	pop {r3, r4, r5, pc}
	thumb_func_end ov57_0223B78C

	thumb_func_start ov57_0223B7A8
ov57_0223B7A8: ; 0x0223B7A8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_0223B7AE:
	add r2, r5, r4
	add r2, #0x80
	ldrb r2, [r2]
	ldr r0, [r5, #0x64]
	add r1, r4, #0
	bl SealCaseInventory_SetSealQuantity
	add r4, r4, #1
	cmp r4, #0x51
	blt _0223B7AE
	pop {r3, r4, r5, pc}
	thumb_func_end ov57_0223B7A8

	thumb_func_start ov57_0223B7C4
ov57_0223B7C4: ; 0x0223B7C4
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0xfb
	add r5, r0, #0
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	lsl r0, r0, #3
	add r0, r5, r0
	ldr r0, [r0, #4]
	cmp r0, #0xff
	beq _0223B7EA
	ldr r2, [r5]
	lsl r0, r0, #2
	add r0, r2, r0
	add r1, #0x6c
	ldr r0, [r0, #4]
	ldr r1, [r5, r1]
	bl CopyPokemonToPokemon
	pop {r3, r4, r5, r6, r7, pc}
_0223B7EA:
	ldr r1, [r5]
	mov r6, #0
	ldr r0, [r1]
	cmp r0, #0
	ble _0223B820
	add r4, r6, #0
_0223B7F6:
	add r0, r1, r4
	ldr r7, [r0, #4]
	mov r1, #0x4c
	add r0, r7, #0
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0223B814
	ldr r1, _0223B824 ; =0x00000458
	add r0, r7, #0
	ldr r1, [r5, r1]
	bl CopyPokemonToPokemon
	pop {r3, r4, r5, r6, r7, pc}
_0223B814:
	ldr r1, [r5]
	add r6, r6, #1
	ldr r0, [r1]
	add r4, r4, #4
	cmp r6, r0
	blt _0223B7F6
_0223B820:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223B824: .word 0x00000458
	thumb_func_end ov57_0223B7C4

	thumb_func_start ov57_0223B828
ov57_0223B828: ; 0x0223B828
	push {r3, r4}
	cmp r2, #0xff
	bne _0223B83A
	mov r2, #1
	lsl r2, r2, #0xa
	ldr r4, [r0, r2]
	sub r2, r2, #4
	str r4, [r0, r2]
	b _0223B840
_0223B83A:
	mov r4, #0xff
	lsl r4, r4, #2
	str r2, [r0, r4]
_0223B840:
	mov r2, #0xfd
	lsl r2, r2, #2
	str r1, [r0, r2]
	add r1, r2, #0
	add r1, #0xc
	str r3, [r0, r1]
	mov r1, #0
	add r2, #0x10
	str r1, [r0, r2]
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov57_0223B828

	thumb_func_start ov57_0223B858
ov57_0223B858: ; 0x0223B858
	push {r3, lr}
	cmp r1, #3
	bhi _0223B88A
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223B86A: ; jump table
	.short _0223B872 - _0223B86A - 2 ; case 0
	.short _0223B882 - _0223B86A - 2 ; case 1
	.short _0223B87A - _0223B86A - 2 ; case 2
	.short _0223B882 - _0223B86A - 2 ; case 3
_0223B872:
	mov r1, #1
	bl sub_0200DCC0
	pop {r3, pc}
_0223B87A:
	mov r1, #2
	bl sub_0200DCC0
	pop {r3, pc}
_0223B882:
	mov r1, #0
	bl sub_0200DCC0
	pop {r3, pc}
_0223B88A:
	bl GF_AssertFail
	pop {r3, pc}
	thumb_func_end ov57_0223B858

	thumb_func_start ov57_0223B890
ov57_0223B890: ; 0x0223B890
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	cmp r5, #0
	beq _0223B8B4
	add r1, sp, #4
	add r2, sp, #0
	bl sub_02013794
	ldr r1, [sp, #4]
	ldr r2, [sp]
	add r0, r5, #0
	add r1, r1, r4
	add r2, r2, r6
	bl sub_020136B4
_0223B8B4:
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ov57_0223B890

	thumb_func_start ov57_0223B8B8
ov57_0223B8B8: ; 0x0223B8B8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4]
	cmp r0, #3
	beq _0223B8CA
	cmp r0, #6
	beq _0223B8E4
	b _0223B904
_0223B8CA:
	mov r1, #0
	ldr r0, [r4, #8]
	sub r2, r1, #1
	bl ov57_0223B890
	ldr r0, [r4, #4]
	mov r1, #2
	bl sub_0200DCC0
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, pc}
_0223B8E4:
	ldr r0, [r4, #8]
	mov r1, #0
	mov r2, #2
	bl ov57_0223B890
	ldr r0, [r4, #4]
	mov r1, #0
	bl sub_0200DCC0
	add r0, r5, #0
	bl DestroySysTask
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, pc}
_0223B904:
	add r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov57_0223B8B8

	thumb_func_start ov57_0223B90C
ov57_0223B90C: ; 0x0223B90C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	mov r0, #0x34
	mov r1, #0xc
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #1
	str r0, [r4]
	mov r1, #0
	str r6, [r4, #4]
	add r0, r5, #0
	sub r2, r1, #1
	str r5, [r4, #8]
	bl ov57_0223B890
	mov r2, #0xfa
	ldr r0, _0223B93C ; =ov57_0223B8B8
	add r1, r4, #0
	lsl r2, r2, #2
	bl CreateSysTask
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0223B93C: .word ov57_0223B8B8
	thumb_func_end ov57_0223B90C

	thumb_func_start ov57_0223B940
ov57_0223B940: ; 0x0223B940
	mov r1, #0xa
	lsl r1, r1, #6
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end ov57_0223B940

	thumb_func_start ov57_0223B948
ov57_0223B948: ; 0x0223B948
	add r0, #0xd8
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov57_0223B948

	thumb_func_start ov57_0223B950
ov57_0223B950: ; 0x0223B950
	push {r4, r5, r6, lr}
	sub sp, #0x48
	ldr r1, _0223B9BC ; =0x00000458
	add r5, r0, #0
	ldr r1, [r5, r1]
	add r0, sp, #0x38
	mov r2, #2
	bl GetPokemonSpriteCharAndPlttNarcIds
	ldr r0, _0223B9BC ; =0x00000458
	mov r1, #5
	ldr r0, [r5, r0]
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	ldr r0, _0223B9BC ; =0x00000458
	mov r1, #2
	ldr r0, [r5, r0]
	bl sub_0207083C
	add r6, r0, #0
	mov r0, #0x73
	lsl r0, r0, #2
	str r6, [r5, r0]
	ldr r0, _0223B9C0 ; =0x0000045C
	lsl r2, r4, #0x10
	ldr r0, [r5, r0]
	add r1, sp, #0x10
	lsr r2, r2, #0x10
	mov r3, #1
	bl sub_02072914
	ldr r0, _0223B9C4 ; =0xFFFFFD80
	add r6, #0x30
	str r0, [sp]
	mov r1, #0
	str r1, [sp, #4]
	add r0, sp, #0x10
	str r0, [sp, #8]
	mov r0, #0x71
	str r1, [sp, #0xc]
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, sp, #0x38
	mov r2, #0xc0
	add r3, r6, #0
	bl sub_020085EC
	mov r1, #0x72
	lsl r1, r1, #2
	str r0, [r5, r1]
	add sp, #0x48
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0223B9BC: .word 0x00000458
_0223B9C0: .word 0x0000045C
_0223B9C4: .word 0xFFFFFD80
	thumb_func_end ov57_0223B950

	thumb_func_start ov57_0223B9C8
ov57_0223B9C8: ; 0x0223B9C8
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, _0223BA14 ; =0x00000458
	mov r1, #5
	ldr r0, [r5, r0]
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	ldr r0, _0223BA14 ; =0x00000458
	ldr r0, [r5, r0]
	bl GetMonNature
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_02008550
	mov r0, #2
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r2, #0xa1
	str r0, [sp, #8]
	ldr r0, _0223BA18 ; =0x0000045C
	lsl r2, r2, #2
	ldr r1, [r5, r2]
	sub r2, #0xbc
	lsl r3, r4, #0x10
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	lsr r3, r3, #0x10
	bl sub_0207294C
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_0223BA14: .word 0x00000458
_0223BA18: .word 0x0000045C
	thumb_func_end ov57_0223B9C8

	thumb_func_start ov57_0223BA1C
ov57_0223BA1C: ; 0x0223BA1C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0xc
	mov r2, #0
	bl sub_020087A4
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0xd
	mov r2, #0
	bl sub_020087A4
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov57_0223BA1C

	thumb_func_start ov57_0223BA40
ov57_0223BA40: ; 0x0223BA40
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0xc
	bl sub_02008A78
	mov r1, #1
	lsl r1, r1, #8
	cmp r0, r1
	bne _0223BA5C
	mov r0, #0
	pop {r4, pc}
_0223BA5C:
	add r1, #0xc8
	ldr r0, [r4, r1]
	mov r1, #0xc
	bl sub_02008A78
	mov r2, #1
	lsl r2, r2, #8
	cmp r0, r2
	blt _0223BA8E
	add r0, r2, #0
	add r0, #0xc8
	ldr r0, [r4, r0]
	mov r1, #0xc
	bl sub_020087A4
	mov r0, #0x72
	lsl r0, r0, #2
	mov r1, #0xd
	add r2, r1, #0
	ldr r0, [r4, r0]
	add r2, #0xf3
	bl sub_020087A4
	mov r0, #0
	pop {r4, pc}
_0223BA8E:
	add r2, #0xc8
	ldr r0, [r4, r2]
	mov r1, #0xc
	mov r2, #0x20
	bl sub_02008C2C
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0xd
	mov r2, #0x20
	bl sub_02008C2C
	mov r1, #0x72
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl sub_0200914C
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov57_0223BA40

	thumb_func_start ov57_0223BABC
ov57_0223BABC: ; 0x0223BABC
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0xc
	bl sub_02008A78
	cmp r0, #0
	bne _0223BAD4
	mov r0, #0
	pop {r4, pc}
_0223BAD4:
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0xc
	bl sub_02008A78
	cmp r0, #0
	bgt _0223BB04
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0xc
	mov r2, #0
	bl sub_020087A4
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0xd
	mov r2, #0
	bl sub_020087A4
	mov r0, #0
	pop {r4, pc}
_0223BB04:
	mov r0, #0x72
	lsl r0, r0, #2
	mov r1, #0xc
	add r2, r1, #0
	ldr r0, [r4, r0]
	sub r2, #0x2c
	bl sub_02008C2C
	mov r0, #0x72
	lsl r0, r0, #2
	mov r1, #0xd
	add r2, r1, #0
	ldr r0, [r4, r0]
	sub r2, #0x2d
	bl sub_02008C2C
	mov r1, #0x72
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl sub_0200914C
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov57_0223BABC

	thumb_func_start ov57_0223BB38
ov57_0223BB38: ; 0x0223BB38
	add r2, r1, #0
	mov r1, #0x72
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	ldr r3, _0223BB48 ; =sub_020087A4
	mov r1, #6
	bx r3
	nop
_0223BB48: .word sub_020087A4
	thumb_func_end ov57_0223BB38

	thumb_func_start ov57_0223BB4C
ov57_0223BB4C: ; 0x0223BB4C
	mov r1, #0x72
	lsl r1, r1, #2
	ldr r3, _0223BB58 ; =sub_02008780
	ldr r0, [r0, r1]
	bx r3
	nop
_0223BB58: .word sub_02008780
	thumb_func_end ov57_0223BB4C

	thumb_func_start ov57_0223BB5C
ov57_0223BB5C: ; 0x0223BB5C
	push {r3, lr}
	mov r1, #0
	mov r3, #0x1f
	ldr r0, _0223BB7C ; =0x04000050
	add r2, r1, #0
	str r3, [sp]
	bl G2x_SetBlendAlpha_
	mov r1, #0
	mov r3, #0x1f
	ldr r0, _0223BB80 ; =0x04001050
	add r2, r1, #0
	str r3, [sp]
	bl G2x_SetBlendAlpha_
	pop {r3, pc}
	.balign 4, 0
_0223BB7C: .word 0x04000050
_0223BB80: .word 0x04001050
	thumb_func_end ov57_0223BB5C

	thumb_func_start ov57_0223BB84
ov57_0223BB84: ; 0x0223BB84
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp, #4]
	add r1, sp, #0x10
	mov r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	mov r7, #0x1f
	lsl r7, r7, #4
	strb r0, [r1, #3]
	ldr r1, _0223BC40 ; =ov57_0223BEF4
	ldr r2, [sp, #4]
	add r3, r7, #1
	add r4, r7, #2
	add r5, r7, #3
_0223BBA4:
	ldrb r6, [r1]
	add r0, r0, #1
	strb r6, [r2, r7]
	ldrb r6, [r1, #1]
	strb r6, [r2, r3]
	ldrb r6, [r1, #2]
	strb r6, [r2, r4]
	ldrb r6, [r1, #3]
	add r1, r1, #4
	strb r6, [r2, r5]
	add r2, r2, #4
	cmp r0, #0xd
	blt _0223BBA4
	cmp r0, #0x15
	bge _0223BC1E
	mov r3, #0x1f
	ldr r2, [sp, #4]
	lsl r3, r3, #4
	add r2, r2, r3
	lsl r4, r0, #2
	ldr r1, [sp, #4]
	ldr r3, [sp, #4]
	add r1, r1, r4
	add r2, r2, r4
	lsl r4, r0, #4
	add r5, sp, #0xc
	add r3, r3, r4
	ldrb r4, [r5, #4]
	strb r4, [r5]
	ldrb r4, [r5, #5]
	strb r4, [r5, #1]
	ldrb r4, [r5, #6]
	strb r4, [r5, #2]
	ldrb r4, [r5, #7]
	strb r4, [r5, #3]
	ldrb r4, [r5, #2]
	ldrb r6, [r5]
	ldrb r7, [r5, #1]
	str r4, [sp, #8]
	ldrb r4, [r5, #3]
	mov ip, r4
_0223BBF6:
	mov r4, #0x1f
	lsl r4, r4, #4
	strb r6, [r1, r4]
	add r4, r4, #1
	strb r7, [r1, r4]
	ldr r5, _0223BC44 ; =0x000001F2
	ldr r4, [sp, #8]
	add r0, r0, #1
	strb r4, [r1, r5]
	add r5, r5, #1
	mov r4, ip
	strb r4, [r1, r5]
	mov r4, #0xa2
	lsl r4, r4, #2
	str r2, [r3, r4]
	add r1, r1, #4
	add r2, r2, #4
	add r3, #0x10
	cmp r0, #0x15
	blt _0223BBF6
_0223BC1E:
	mov r0, #0x34
	str r0, [sp]
	mov r1, #0x1f
	ldr r0, [sp, #4]
	lsl r1, r1, #4
	add r0, r0, r1
	ldr r2, _0223BC48 ; =ov57_0223AEA8
	ldr r3, [sp, #4]
	mov r1, #0x15
	bl sub_02026C44
	mov r2, #0x7b
	ldr r1, [sp, #4]
	lsl r2, r2, #2
	str r0, [r1, r2]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0223BC40: .word ov57_0223BEF4
_0223BC44: .word 0x000001F2
_0223BC48: .word ov57_0223AEA8
	thumb_func_end ov57_0223BB84

	thumb_func_start ov57_0223BC4C
ov57_0223BC4C: ; 0x0223BC4C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	mov r0, #0
	add r4, r5, #4
	lsl r6, r1, #3
	str r0, [sp]
	ldr r0, [r4, r6]
	cmp r0, #0xff
	beq _0223BC70
	ldr r1, [r5]
	lsl r0, r0, #2
	add r0, r1, r0
	ldr r0, [r0, #4]
	mov r1, #0xa2
	add r2, sp, #0
	bl SetMonData
_0223BC70:
	mov r0, #0xff
	str r0, [r4, r6]
	add r0, r5, #0
	bl ov57_022394AC
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov57_0223BC4C

	.rodata

_0223BC80:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

ov57_0223BC90: ; 0x0223BC90
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00

ov57_0223BCB8: ; 0x0223BCB8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x03, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x06, 0x04, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov57_0223BD0C: ; 0x0223BD0C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0D, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0E, 0x01, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0C, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0F, 0x01, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov57_0223BD7C: ; 0x0223BD7C
	.byte 0x03, 0x00, 0x01, 0x0B
	.byte 0x00, 0x00, 0x86, 0x00, 0x1F, 0x00, 0x5A, 0x00

ov57_0223BD88: ; 0x0223BD88
	.byte 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x10, 0x00, 0x10, 0x00, 0x00, 0x00

ov57_0223BD9C: ; 0x0223BD9C
	.byte 0x60, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00

ov57_0223BDB4: ; 0x0223BDB4
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00

ov57_0223BDD4: ; 0x0223BDD4
	.byte 0x13, 0x00, 0x17, 0x00, 0x4B, 0x00, 0x17, 0x00, 0x13, 0x00, 0x2F, 0x00
	.byte 0x4B, 0x00, 0x2F, 0x00, 0x13, 0x00, 0x47, 0x00, 0x4B, 0x00, 0x47, 0x00, 0x13, 0x00, 0x5F, 0x00
	.byte 0x4B, 0x00, 0x5F, 0x00

ov57_0223BDF4: ; 0x0223BDF4
	.byte 0x18, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00
	.byte 0x28, 0x00, 0x00, 0x00, 0x29, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x00, 0x00, 0x48, 0x00, 0x00, 0x00
	.byte 0x49, 0x00, 0x00, 0x00, 0x4B, 0x00, 0x00, 0x00

ov57_0223BE18: ; 0x0223BE18
	.byte 0x88, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0xF0, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF0, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00

ov57_0223BE48: ; 0x0223BE48
	.byte 0x14, 0x00, 0x17, 0x00, 0x14, 0x00, 0x2F, 0x00
	.byte 0x14, 0x00, 0x47, 0x00, 0x14, 0x00, 0x5F, 0x00, 0x4C, 0x00, 0x17, 0x00, 0x4C, 0x00, 0x2F, 0x00
	.byte 0x4C, 0x00, 0x47, 0x00, 0x4C, 0x00, 0x5F, 0x00, 0x1B, 0x00, 0x7C, 0x00, 0x43, 0x00, 0x7C, 0x00
	.byte 0x20, 0x00, 0xAB, 0x00, 0x68, 0x00, 0xAB, 0x00, 0xC0, 0x00, 0xAB, 0x00

ov57_0223BE7C: ; 0x0223BE7C
	.byte 0xFF, 0x00, 0xFF, 0x00
	.byte 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00
	.byte 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0x0D, 0x00, 0x0A, 0x00
	.byte 0x0D, 0x00, 0x0A, 0x00, 0x10, 0x00, 0x0C, 0x00, 0x1C, 0x00, 0x0C, 0x00, 0x1C, 0x00, 0x0C, 0x00

ov57_0223BEB0: ; 0x0223BEB0
	.byte 0xA8, 0xC0, 0xC0, 0x00, 0xFF, 0x00, 0x00, 0x00

ov57_0223BEB8: ; 0x0223BEB8
	.word ov57_0223A104
	.word ov57_0223A31C
	.word ov57_0223A504
	.word ov57_0223A5AC
	.word ov57_0223A6B4

ov57_0223BECC: ; 0x0223BECC
	.word 0x00000000, ov57_0223B6F0
	.word 0x00000001, ov57_0223B700
	.word 0x00000002, ov57_0223B714
	.word 0x00000003, ov57_0223B73C
	.word 0x00000004, ov57_0223B74C

ov57_0223BEF4: ; 0x0223BEF4
	.byte 0x10, 0x20, 0x08, 0x18, 0x10, 0x20, 0x40, 0x50, 0x28, 0x38, 0x08, 0x18
	.byte 0x28, 0x38, 0x40, 0x50, 0x40, 0x50, 0x08, 0x18, 0x40, 0x50, 0x40, 0x50, 0x58, 0x68, 0x08, 0x18
	.byte 0x58, 0x68, 0x40, 0x50, 0x68, 0x80, 0x08, 0x30, 0x68, 0x80, 0x38, 0x60, 0xA8, 0xBC, 0x12, 0x4D
	.byte 0xA8, 0xBC, 0x61, 0x9C, 0xA8, 0xBC, 0xB2, 0xED

	.section .sinit,4

	.word ov57_022378C0
