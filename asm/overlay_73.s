	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov73_021E5900
ov73_021E5900: ; 0x021E5900
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r1, #0
	ldr r1, [r5]
	add r7, r0, #0
	cmp r1, #0
	beq _021E5916
	cmp r1, #1
	bne _021E5914
	b _021E5A80
_021E5914:
	b _021E5A8E
_021E5916:
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E5A94 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _021E5A98 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r2, #0x41
	mov r0, #3
	mov r1, #0x32
	lsl r2, r2, #0xc
	bl CreateHeap
	mov r0, #0x54
	mov r1, #0x32
	bl NARC_ctor
	add r6, r0, #0
	ldr r1, _021E5A9C ; =0x00004A8C
	add r0, r7, #0
	mov r2, #0x32
	bl OverlayManager_CreateAndGetData
	ldr r2, _021E5A9C ; =0x00004A8C
	mov r1, #0
	add r4, r0, #0
	bl memset
	mov r0, #0x32
	bl BgConfig_Alloc
	str r0, [r4]
	add r0, r7, #0
	bl OverlayManager_GetParentWork
	str r0, [r4, #8]
	ldr r1, [r0]
	ldr r0, _021E5AA0 ; =0x00004A0C
	str r1, [r4, r0]
	ldr r0, [r4, #8]
	ldr r0, [r0, #0x10]
	bl sub_020183F0
	mov r1, #0xc5
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0x32
	bl ScrStrBufs_new
	str r0, [r4, #0x24]
	ldr r2, _021E5AA4 ; =0x000001A6
	mov r0, #0
	mov r1, #0x1b
	mov r3, #0x32
	bl NewMsgDataFromNarc
	str r0, [r4, #0x28]
	mov r0, #4
	mov r1, #0x32
	bl FontID_Alloc
	mov r0, #4
	mov r1, #8
	bl SetKeyRepeatTimers
	bl ov73_021E5D00
	ldr r0, [r4]
	bl ov73_021E5D20
	mov r0, #0
	bl SetMasterBrightnessNeutral
	mov r0, #1
	bl SetMasterBrightnessNeutral
	mov r0, #0x10
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x32
	str r0, [sp, #8]
	mov r0, #0
	mov r1, #0x11
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	add r0, r4, #0
	add r1, r6, #0
	bl ov73_021E5F38
	bl sub_020210BC
	mov r0, #2
	bl sub_02021148
	ldr r0, _021E5AA8 ; =ov73_021E5CD8
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	add r0, r4, #0
	add r1, r6, #0
	bl ov73_021E5E0C
	bl ov73_021E6060
	add r0, r4, #0
	add r1, r6, #0
	bl ov73_021E6090
	add r0, r4, #0
	bl ov73_021E6184
	add r0, r4, #0
	add r1, r7, #0
	bl ov73_021E629C
	add r0, r4, #0
	bl ov73_021E7230
	mov r1, #0
	mov r0, #0x34
	add r2, r1, #0
	bl sub_02004EC4
	ldr r2, _021E5AAC ; =0x04000304
	ldr r0, _021E5AB0 ; =0xFFFF7FFF
	ldrh r1, [r2]
	and r0, r1
	strh r0, [r2]
	add r0, r4, #0
	bl sub_0208FB64
	bl sub_0203893C
	mov r0, #3
	bl sub_02038C1C
	bl sub_0203769C
	cmp r0, #0
	bne _021E5A54
	mov r0, #2
	bl sub_0205A904
_021E5A54:
	bl sub_0203A880
	ldr r0, _021E5AA0 ; =0x00004A0C
	mov r1, #0xe2
	lsl r1, r1, #2
	ldr r0, [r4, r0]
	add r1, r4, r1
	bl ov73_021EA374
	ldr r0, _021E5AB4 ; =ov73_021E5C74
	add r1, r4, #0
	mov r2, #5
	bl sub_0200E33C
	str r0, [r4, #0x20]
	add r0, r6, #0
	bl NARC_dtor
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _021E5A8E
_021E5A80:
	bl OverlayManager_GetData
	mov r0, #0
	str r0, [r5]
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_021E5A8E:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E5A94: .word 0xFFFFE0FF
_021E5A98: .word 0x04001000
_021E5A9C: .word 0x00004A8C
_021E5AA0: .word 0x00004A0C
_021E5AA4: .word 0x000001A6
_021E5AA8: .word ov73_021E5CD8
_021E5AAC: .word 0x04000304
_021E5AB0: .word 0xFFFF7FFF
_021E5AB4: .word ov73_021E5C74
	thumb_func_end ov73_021E5900

	thumb_func_start ov73_021E5AB8
ov73_021E5AB8: ; 0x021E5AB8
	push {r3, r4, r5, lr}
	add r5, r1, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	bl sub_0203769C
	cmp r0, #0
	bne _021E5ADE
	ldr r0, _021E5B9C ; =0x00004A24
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E5ADE
	bl sub_02033250
	ldr r1, _021E5B9C ; =0x00004A24
	ldr r2, [r4, r1]
	and r0, r2
	str r0, [r4, r1]
_021E5ADE:
	ldr r1, [r5]
	cmp r1, #3
	bhi _021E5B92
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E5AF0: ; jump table
	.short _021E5AF8 - _021E5AF0 - 2 ; case 0
	.short _021E5B20 - _021E5AF0 - 2 ; case 1
	.short _021E5B6E - _021E5AF0 - 2 ; case 2
	.short _021E5B86 - _021E5AF0 - 2 ; case 3
_021E5AF8:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E5B92
	mov r0, #1
	str r0, [r5]
	bl sub_0203769C
	cmp r0, #0
	beq _021E5B92
	bl ov73_021E746C
	cmp r0, #2
	ble _021E5B92
	mov r1, #0
	mov r0, #0x72
	add r2, r1, #0
	bl sub_02037030
	b _021E5B92
_021E5B20:
	mov r0, #0xc6
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	lsl r2, r0, #2
	ldr r0, _021E5BA0 ; =_021EA7C0
	ldr r2, [r0, r2]
	cmp r2, #0
	beq _021E5B36
	add r0, r4, #0
	blx r2
	str r0, [r5]
_021E5B36:
	ldr r0, _021E5BA4 ; =0x00004A14
	ldrb r0, [r4, r0]
	cmp r0, #0
	bne _021E5B4E
	mov r0, #0xa6
	lsl r0, r0, #2
	ldr r2, _021E5BA8 ; =0x00010300
	add r0, r4, r0
	mov r1, #0
	add r3, r4, #0
	bl ov73_021E735C
_021E5B4E:
	add r0, r4, #0
	bl ov73_021E762C
	bl sub_0203769C
	cmp r0, #0
	bne _021E5B92
	add r0, r4, #0
	mov r1, #1
	bl ov73_021E7870
	ldr r1, [r5]
	cmp r1, #1
	bne _021E5B92
	str r0, [r5]
	b _021E5B92
_021E5B6E:
	mov r0, #0xc6
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	lsl r2, r0, #2
	ldr r0, _021E5BA0 ; =_021EA7C0
	ldr r2, [r0, r2]
	cmp r2, #0
	beq _021E5B92
	add r0, r4, #0
	blx r2
	str r0, [r5]
	b _021E5B92
_021E5B86:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E5B92
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E5B92:
	ldr r0, [r4, #0x50]
	bl sub_0202457C
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E5B9C: .word 0x00004A24
_021E5BA0: .word _021EA7C0
_021E5BA4: .word 0x00004A14
_021E5BA8: .word 0x00010300
	thumb_func_end ov73_021E5AB8

	thumb_func_start ov73_021E5BAC
ov73_021E5BAC: ; 0x021E5BAC
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	bl OverlayManager_GetData
	add r6, r0, #0
	ldr r0, [r6, #0x20]
	bl DestroySysTask
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl sub_0200AEB0
	mov r0, #0x1b
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	bl sub_0200B0A8
	mov r7, #0x5f
	mov r4, #0
	add r5, r6, #0
	lsl r7, r7, #2
_021E5BD8:
	ldr r0, [r5, r7]
	bl Destroy2DGfxResObjMan
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _021E5BD8
	ldr r0, [r6, #0x50]
	bl sub_02024504
	bl OamManager_Free
	bl sub_0202168C
	bl sub_02022608
	add r0, r6, #0
	bl ov73_021E6400
	add r0, r6, #0
	bl ov73_021E6048
	ldr r0, [r6]
	bl ov73_021E5F0C
	mov r0, #2
	bl sub_02038C1C
	bl sub_02037FF0
	ldr r0, [r6, #8]
	ldr r0, [r0, #4]
	bl sub_0205AD24
	bl sub_02021238
	mov r0, #4
	bl FontID_Release
	ldr r0, [r6, #0x28]
	bl DestroyMsgData
	ldr r0, [r6, #0x24]
	bl ScrStrBufs_delete
	ldr r0, [r6, #8]
	mov r1, #0xc5
	lsl r1, r1, #2
	ldr r0, [r0, #0x10]
	ldr r1, [r6, r1]
	bl sub_02018410
	add r0, r6, #0
	bl ov73_021E5ED4
	ldr r0, [sp]
	bl OverlayManager_FreeData
	ldr r2, _021E5C70 ; =0x04000304
	ldrh r1, [r2]
	lsr r0, r2, #0xb
	orr r0, r1
	strh r0, [r2]
	mov r0, #0
	bl sub_0205A904
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0x32
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E5C70: .word 0x04000304
	thumb_func_end ov73_021E5BAC

	thumb_func_start ov73_021E5C74
ov73_021E5C74: ; 0x021E5C74
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4, #0xc]
	add r1, #0xc
	cmp r0, #0
	beq _021E5CCE
	ldr r0, [r1, #4]
	ldr r3, [r1, #8]
	lsl r2, r0, #1
	ldr r0, _021E5CD0 ; =ov73_021EA52A
	ldrb r0, [r0, r2]
	cmp r3, r0
	ble _021E5CBE
	mov r0, #0
	str r0, [r1, #8]
	ldr r2, [r1, #4]
	add r2, r2, #1
	str r2, [r1, #4]
	lsl r3, r2, #1
	ldr r2, _021E5CD4 ; =ov73_021EA52B
	ldrb r2, [r2, r3]
	cmp r2, #0xff
	bne _021E5CA4
	str r0, [r1, #4]
_021E5CA4:
	ldr r0, [r1, #0x10]
	ldr r1, [r1, #4]
	ldr r0, [r0, #0xc]
	lsl r2, r1, #1
	ldr r1, _021E5CD4 ; =ov73_021EA52B
	ldrb r1, [r1, r2]
	mov r2, #0x20
	lsl r1, r1, #5
	add r0, r0, r1
	mov r1, #0
	bl GX_LoadOBJPltt
	b _021E5CC4
_021E5CBE:
	ldr r0, [r4, #0x14]
	add r0, r0, #1
	str r0, [r4, #0x14]
_021E5CC4:
	mov r0, #0xde
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov73_021E72F4
_021E5CCE:
	pop {r4, pc}
	.balign 4, 0
_021E5CD0: .word ov73_021EA52A
_021E5CD4: .word ov73_021EA52B
	thumb_func_end ov73_021E5C74

	thumb_func_start ov73_021E5CD8
ov73_021E5CD8: ; 0x021E5CD8
	push {r4, lr}
	add r4, r0, #0
	bl GF_RunVramTransferTasks
	bl OamManager_ApplyAndResetBuffers
	ldr r0, [r4]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	ldr r3, _021E5CF8 ; =0x027E0000
	ldr r1, _021E5CFC ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.balign 4, 0
_021E5CF8: .word 0x027E0000
_021E5CFC: .word 0x00003FF8
	thumb_func_end ov73_021E5CD8

	thumb_func_start ov73_021E5D00
ov73_021E5D00: ; 0x021E5D00
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E5D1C ; =ov73_021EA5E8
	add r3, sp, #0
	mov r2, #5
_021E5D0A:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E5D0A
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_021E5D1C: .word ov73_021EA5E8
	thumb_func_end ov73_021E5D00

	thumb_func_start ov73_021E5D20
ov73_021E5D20: ; 0x021E5D20
	push {r3, r4, r5, lr}
	sub sp, #0x80
	ldr r5, _021E5DF8 ; =ov73_021EA540
	add r3, sp, #0x70
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _021E5DFC ; =ov73_021EA5B0
	add r3, sp, #0x54
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
	add r0, r4, #0
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E5E00 ; =ov73_021EA5CC
	add r3, sp, #0x38
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
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E5E04 ; =ov73_021EA578
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
	ldr r5, _021E5E08 ; =ov73_021EA594
	add r3, sp, #0
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
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	mov r3, #0x32
	bl BG_ClearCharDataRange
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x32
	bl BG_ClearCharDataRange
	add sp, #0x80
	pop {r3, r4, r5, pc}
	nop
_021E5DF8: .word ov73_021EA540
_021E5DFC: .word ov73_021EA5B0
_021E5E00: .word ov73_021EA5CC
_021E5E04: .word ov73_021EA578
_021E5E08: .word ov73_021EA594
	thumb_func_end ov73_021E5D20

	thumb_func_start ov73_021E5E0C
ov73_021E5E0C: ; 0x021E5E0C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	str r1, [sp, #4]
	mov r7, #0
	add r6, r0, #0
	add r4, r0, #0
	add r5, r0, #0
_021E5E1C:
	mov r0, #8
	mov r1, #0x32
	bl String_ctor
	str r0, [r6, #0x2c]
	mov r0, #0xce
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r0, #4
	str r1, [r4, r0]
	ldr r0, _021E5EC8 ; =0x00004A3C
	add r7, r7, #1
	str r1, [r5, r0]
	add r0, r0, #4
	str r1, [r5, r0]
	ldr r0, _021E5ECC ; =0x00004A44
	add r4, #8
	str r1, [r5, r0]
	add r0, r0, #4
	str r1, [r5, r0]
	mov r0, #0x36
	lsl r0, r0, #4
	str r1, [r6, r0]
	add r6, r6, #4
	add r5, #0x10
	cmp r7, #5
	blt _021E5E1C
	mov r0, #0xb4
	mov r1, #0x32
	bl String_ctor
	ldr r1, [sp]
	str r0, [r1, #0x44]
	mov r0, #0x28
	mov r1, #0x32
	bl String_ctor
	ldr r1, [sp]
	mov r2, #0
	str r0, [r1, #0x48]
	mov r1, #0xc6
	ldr r0, [sp]
	lsl r1, r1, #2
	str r2, [r0, r1]
	ldr r2, [sp]
	ldr r0, [r0, #0x28]
	ldr r2, [r2, #0x48]
	mov r1, #0x11
	bl ReadMsgDataIntoString
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl ov73_021E7740
	mov r0, #0x32
	bl sub_0205B4A4
	mov r2, #0xdf
	ldr r1, [sp]
	lsl r2, r2, #2
	str r0, [r1, r2]
	ldr r2, [sp]
	ldr r0, [sp]
	mov r1, #0
	str r1, [r0, #0xc]
	str r1, [r0, #0x14]
	str r1, [r0, #0x10]
	ldr r0, [sp, #4]
	mov r1, #7
	add r2, #0x1c
	mov r3, #0x32
	bl GfGfxLoader_GetPlttDataFromOpenNarc
	ldr r1, [sp]
	ldr r2, _021E5ED0 ; =0x00004A18
	str r0, [r1, #0x18]
	mov r0, #0
	str r0, [r1, r2]
	add r3, r2, #4
	mov r4, #2
	str r4, [r1, r3]
	sub r2, r2, #3
	strb r0, [r1, r2]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E5EC8: .word 0x00004A3C
_021E5ECC: .word 0x00004A44
_021E5ED0: .word 0x00004A18
	thumb_func_end ov73_021E5E0C

	thumb_func_start ov73_021E5ED4
ov73_021E5ED4: ; 0x021E5ED4
	push {r4, r5, r6, lr}
	add r6, r0, #0
	bl ov73_021E77E8
	ldr r0, [r6, #0x18]
	bl FreeToHeap
	mov r0, #0xdf
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl FreeToHeap
	mov r4, #0
	add r5, r6, #0
_021E5EF0:
	ldr r0, [r5, #0x2c]
	bl String_dtor
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #5
	blt _021E5EF0
	ldr r0, [r6, #0x48]
	bl String_dtor
	ldr r0, [r6, #0x44]
	bl String_dtor
	pop {r4, r5, r6, pc}
	thumb_func_end ov73_021E5ED4

	thumb_func_start ov73_021E5F0C
ov73_021E5F0C: ; 0x021E5F0C
	push {r4, lr}
	add r4, r0, #0
	mov r1, #5
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
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov73_021E5F0C

	thumb_func_start ov73_021E5F38
ov73_021E5F38: ; 0x021E5F38
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r6, [r5]
	add r4, r1, #0
	mov r1, #0
	str r1, [sp]
	mov r0, #0x32
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r1, #0
	add r3, r1, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r3, #0
	mov r1, #4
	str r3, [sp]
	mov r0, #0x32
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r1, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x32
	mov r1, #5
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r2, r6, #0
	add r3, r1, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x32
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #6
	add r2, r6, #0
	mov r3, #5
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r0, #0x32
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r2, r6, #0
	add r3, r1, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0x32
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #2
	add r2, r6, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r3, #0xc3
	mov r0, #0x32
	lsl r3, r3, #2
	str r0, [sp]
	add r0, r4, #0
	mov r1, #3
	mov r2, #1
	add r3, r5, r3
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	mov r1, #0x31
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r1, #6
	mov r0, #0
	lsl r1, r1, #6
	mov r2, #0x32
	bl LoadFontPal1
	mov r1, #0x1a
	mov r0, #0
	lsl r1, r1, #4
	mov r2, #0x32
	bl LoadFontPal0
	mov r1, #6
	mov r0, #4
	lsl r1, r1, #6
	mov r2, #0x32
	bl LoadFontPal1
	mov r1, #0x1a
	mov r0, #4
	lsl r1, r1, #4
	mov r2, #0x32
	bl LoadFontPal0
	ldr r0, [r5, #8]
	ldr r0, [r0, #8]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x32
	str r0, [sp, #4]
	add r0, r6, #0
	mov r1, #0
	mov r2, #1
	mov r3, #0xb
	bl LoadUserFrameGfx2
	mov r1, #0
	str r1, [sp]
	mov r0, #0x32
	str r0, [sp, #4]
	add r0, r6, #0
	mov r2, #0x1f
	mov r3, #0xa
	bl LoadUserFrameGfx1
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov73_021E5F38

	thumb_func_start ov73_021E6048
ov73_021E6048: ; 0x021E6048
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x31
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0x31
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r4, r0]
	pop {r4, pc}
	thumb_func_end ov73_021E6048

	thumb_func_start ov73_021E6060
ov73_021E6060: ; 0x021E6060
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _021E608C ; =ov73_021EA550
	add r3, sp, #0
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl sub_020215A0
	mov r0, #0x14
	mov r1, #0x32
	bl sub_02022588
	bl sub_020216C8
	bl sub_02022638
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_021E608C: .word ov73_021EA550
	thumb_func_end ov73_021E6060

	thumb_func_start ov73_021E6090
ov73_021E6090: ; 0x021E6090
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r6, r0, #0
	str r1, [sp, #0x14]
	bl NNS_G2dInitOamManagerModule
	mov r0, #0
	str r0, [sp]
	mov r1, #0x7e
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r3, #0x20
	str r3, [sp, #0xc]
	mov r2, #0x32
	str r2, [sp, #0x10]
	add r2, r0, #0
	bl OamManager_Create
	add r1, r6, #0
	mov r0, #0x1e
	add r1, #0x54
	mov r2, #0x32
	bl G2dRenderer_Init
	str r0, [r6, #0x50]
	add r0, r6, #0
	mov r2, #1
	add r0, #0x54
	mov r1, #0
	lsl r2, r2, #0x14
	bl G2dRenderer_SetSubSurfaceCoords
	mov r7, #0x5f
	mov r4, #0
	add r5, r6, #0
	lsl r7, r7, #2
_021E60D8:
	mov r0, #3
	add r1, r4, #0
	mov r2, #0x32
	bl Create2DGfxResObjMan
	str r0, [r5, r7]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _021E60D8
	mov r0, #2
	str r0, [sp]
	mov r3, #1
	str r3, [sp, #4]
	mov r0, #0x32
	str r0, [sp, #8]
	mov r0, #0x5f
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	ldr r1, [sp, #0x14]
	mov r2, #8
	bl AddCharResObjFromOpenNarc
	mov r1, #0x6b
	lsl r1, r1, #2
	str r0, [r6, r1]
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0xf
	str r0, [sp, #8]
	mov r0, #0x32
	sub r1, #0x2c
	str r0, [sp, #0xc]
	ldr r0, [r6, r1]
	ldr r1, [sp, #0x14]
	mov r2, #7
	mov r3, #0
	bl AddPlttResObjFromOpenNarc
	mov r1, #0x1b
	lsl r1, r1, #4
	str r0, [r6, r1]
	mov r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0x32
	sub r1, #0x2c
	str r0, [sp, #8]
	ldr r0, [r6, r1]
	ldr r1, [sp, #0x14]
	mov r2, #9
	mov r3, #1
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x6d
	lsl r1, r1, #2
	str r0, [r6, r1]
	mov r0, #2
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x32
	sub r1, #0x2c
	str r0, [sp, #8]
	ldr r0, [r6, r1]
	ldr r1, [sp, #0x14]
	mov r2, #0xa
	mov r3, #1
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x6e
	lsl r1, r1, #2
	str r0, [r6, r1]
	sub r1, #0xc
	ldr r0, [r6, r1]
	bl sub_0200ACF0
	mov r0, #0x1b
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	bl sub_0200AF94
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov73_021E6090

	thumb_func_start ov73_021E6184
ov73_021E6184: ; 0x021E6184
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	mov r1, #2
	add r5, r0, #0
	str r1, [sp]
	sub r0, r1, #3
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	mov r3, #0x5f
	str r0, [sp, #0xc]
	mov r2, #1
	lsl r3, r3, #2
	str r2, [sp, #0x10]
	ldr r2, [r5, r3]
	str r2, [sp, #0x14]
	add r2, r3, #4
	ldr r2, [r5, r2]
	str r2, [sp, #0x18]
	add r2, r3, #0
	add r2, #8
	ldr r2, [r5, r2]
	str r2, [sp, #0x1c]
	add r2, r3, #0
	add r2, #0xc
	ldr r2, [r5, r2]
	add r3, #0x88
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, r5, r3
	add r2, r1, #0
	add r3, r1, #0
	bl CreateSpriteResourcesHeader
	ldr r0, [r5, #0x50]
	mov r1, #0
	str r0, [sp, #0x2c]
	mov r0, #0x81
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [sp, #0x30]
	mov r0, #1
	lsl r0, r0, #0xc
	str r1, [sp, #0x3c]
	str r0, [sp, #0x40]
	str r0, [sp, #0x44]
	str r0, [sp, #0x48]
	add r0, sp, #0x2c
	strh r1, [r0, #0x20]
	mov r0, #1
	str r0, [sp, #0x50]
	str r0, [sp, #0x54]
	mov r0, #0x32
	str r0, [sp, #0x58]
	mov r0, #0x15
	lsl r0, r0, #0xe
	str r0, [sp, #0x34]
	mov r0, #0x1a
	lsl r0, r0, #0xe
	str r0, [sp, #0x38]
	add r0, sp, #0x2c
	bl CreateSprite
	mov r1, #0x8a
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x64
	bl sub_02024ADC
	mov r7, #0x8b
	ldr r4, _021E6298 ; =ov73_021EA560
	mov r6, #0
	lsl r7, r7, #2
_021E6232:
	ldrh r0, [r4, #4]
	lsl r0, r0, #0xc
	str r0, [sp, #0x34]
	ldrh r0, [r4, #6]
	lsl r0, r0, #0xc
	str r0, [sp, #0x38]
	add r0, sp, #0x2c
	bl CreateSprite
	mov r1, #0x8b
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #0x8b
	lsl r0, r0, #2
	sub r1, r6, #1
	lsl r1, r1, #1
	ldr r0, [r5, r0]
	add r1, #0x1b
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r5, r7]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r6, r6, #1
	add r4, r4, #4
	add r5, r5, #4
	cmp r6, #5
	blt _021E6232
	mov r0, #6
	lsl r0, r0, #0xe
	str r0, [sp, #0x34]
	mov r0, #0x1a
	lsl r0, r0, #0x10
	str r0, [sp, #0x38]
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	nop
_021E6298: .word ov73_021EA560
	thumb_func_end ov73_021E6184

	thumb_func_start ov73_021E629C
ov73_021E629C: ; 0x021E629C
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	mov r0, #0x5b
	mov r1, #0xaa
	str r0, [sp, #0x10]
	lsl r1, r1, #2
	ldr r0, [r4]
	add r1, r4, r1
	mov r2, #0
	mov r3, #2
	bl AddWindowParameterized
	mov r0, #0xaa
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #0x15
	str r0, [sp]
	mov r0, #8
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #9
	str r0, [sp, #0xc]
	mov r0, #0xc7
	mov r1, #0xae
	str r0, [sp, #0x10]
	lsl r1, r1, #2
	ldr r0, [r4]
	add r1, r4, r1
	mov r2, #0
	mov r3, #0x10
	bl AddWindowParameterized
	mov r0, #0xae
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x15
	str r0, [sp]
	mov r0, #8
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #9
	str r0, [sp, #0xc]
	ldr r0, _021E63B4 ; =0x00000133
	mov r1, #0xb2
	str r0, [sp, #0x10]
	lsl r1, r1, #2
	ldr r0, [r4]
	add r1, r4, r1
	mov r2, #0
	mov r3, #0x18
	bl AddWindowParameterized
	mov r0, #0xb2
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r1, #1
	str r1, [sp]
	mov r0, #0x1a
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #9
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	mov r1, #0xb6
	lsl r1, r1, #2
	ldr r0, [r4]
	add r1, r4, r1
	mov r2, #4
	mov r3, #3
	bl AddWindowParameterized
	mov r0, #0xb6
	lsl r0, r0, #2
	ldr r1, [r4, #0x48]
	add r0, r4, r0
	mov r2, #0
	bl ov73_021E63BC
	mov r0, #7
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	mov r0, #9
	str r0, [sp, #0xc]
	mov r0, #0x35
	mov r1, #0xa6
	str r0, [sp, #0x10]
	lsl r1, r1, #2
	ldr r0, [r4]
	add r1, r4, r1
	mov r2, #4
	mov r3, #8
	bl AddWindowParameterized
	mov r0, #0xa6
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0xa6
	lsl r0, r0, #2
	ldr r2, _021E63B8 ; =0x00010300
	add r0, r4, r0
	mov r1, #0
	add r3, r4, #0
	bl ov73_021E735C
	mov r0, #0x32
	bl sub_0201660C
	mov r1, #0xba
	lsl r1, r1, #2
	str r0, [r4, r1]
	add sp, #0x14
	pop {r3, r4, pc}
	nop
_021E63B4: .word 0x00000133
_021E63B8: .word 0x00010300
	thumb_func_end ov73_021E629C

	thumb_func_start ov73_021E63BC
ov73_021E63BC: ; 0x021E63BC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r2, #0
	mov r0, #1
	mov r2, #0
	add r7, r1, #0
	bl FontID_String_GetWidth
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r1, #1
	str r1, [sp]
	mov r0, #0x41
	mov r3, #0xd0
	str r4, [sp, #4]
	sub r4, r3, r6
	lsl r0, r0, #0xa
	lsr r3, r4, #0x1f
	str r0, [sp, #8]
	mov r0, #0
	add r3, r4, r3
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r2, r7, #0
	asr r3, r3, #1
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov73_021E63BC

	thumb_func_start ov73_021E6400
ov73_021E6400: ; 0x021E6400
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xba
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02016624
	mov r0, #0xa6
	lsl r0, r0, #2
	add r0, r4, r0
	bl RemoveWindow
	mov r0, #0xb6
	lsl r0, r0, #2
	add r0, r4, r0
	bl RemoveWindow
	mov r0, #0xaa
	lsl r0, r0, #2
	add r0, r4, r0
	bl RemoveWindow
	mov r0, #0xae
	lsl r0, r0, #2
	add r0, r4, r0
	bl RemoveWindow
	mov r0, #0xb2
	lsl r0, r0, #2
	add r0, r4, r0
	bl RemoveWindow
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov73_021E6400

	thumb_func_start ov73_021E6444
ov73_021E6444: ; 0x021E6444
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0
	mov r1, #1
	bl sub_020398D4
	bl sub_0203769C
	cmp r0, #0
	bne _021E646E
	bl sub_02037454
	cmp r0, #2
	blt _021E6478
	add r0, r5, #0
	mov r1, #2
	mov r2, #0
	bl ov73_021E756C
	b _021E6478
_021E646E:
	add r0, r5, #0
	mov r1, #8
	mov r2, #0
	bl ov73_021E756C
_021E6478:
	add r0, r5, #0
	mov r1, #3
	bl ov73_021E670C
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov73_021E6444

	thumb_func_start ov73_021E6484
ov73_021E6484: ; 0x021E6484
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov73_021E6508
	bl sub_0203769C
	cmp r0, #0
	bne _021E64A6
	bl ov73_021E7340
	cmp r0, #1
	beq _021E64AC
	add r0, r5, #0
	bl ov73_021E7468
	b _021E64AC
_021E64A6:
	add r0, r5, #0
	bl ov73_021E7468
_021E64AC:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov73_021E6484

	thumb_func_start ov73_021E64B0
ov73_021E64B0: ; 0x021E64B0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xc5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _021E64DE
	bl System_GetTouchHeld
	cmp r0, #0
	beq _021E64CA
	mov r0, #0
	pop {r4, pc}
_021E64CA:
	ldr r0, _021E6504 ; =gSystem
	ldr r0, [r0, #0x44]
	cmp r0, #0
	beq _021E64FE
	mov r0, #0xc5
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #1
	pop {r4, pc}
_021E64DE:
	ldr r0, _021E6504 ; =gSystem
	ldr r0, [r0, #0x44]
	cmp r0, #0
	beq _021E64EA
	mov r0, #0
	pop {r4, pc}
_021E64EA:
	bl System_GetTouchHeld
	cmp r0, #0
	beq _021E64FE
	mov r0, #0xc5
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #0
	pop {r4, pc}
_021E64FE:
	mov r0, #0
	pop {r4, pc}
	nop
_021E6504: .word gSystem
	thumb_func_end ov73_021E64B0

	thumb_func_start ov73_021E6508
ov73_021E6508: ; 0x021E6508
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r4, #0
	bl ov73_021E64B0
	ldr r0, _021E66C8 ; =ov73_021EA534
	bl sub_02025224
	add r6, r0, #0
	ldr r1, _021E66CC ; =0x0000FFD5
	add r0, sp, #4
	strh r1, [r0, #4]
	sub r0, r4, #1
	cmp r6, r0
	beq _021E6544
	add r0, sp, #8
	str r0, [sp]
	ldr r3, _021E66D0 ; =gSystem + 0x40
	ldr r0, [r5]
	ldrh r2, [r3, #0x20]
	ldrh r3, [r3, #0x22]
	mov r1, #1
	bl DoesPixelAtScreenXYMatchPtrVal
	cmp r0, #0
	beq _021E6544
	add r0, r6, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_021E6544:
	ldr r0, _021E66D4 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	bne _021E6552
	cmp r4, #1
	bne _021E65BE
_021E6552:
	bl sub_0203769C
	cmp r0, #0
	beq _021E655C
	b _021E669C
_021E655C:
	bl ov73_021E746C
	ldr r1, _021E66D8 ; =0x00004A1C
	ldr r2, [r5, r1]
	cmp r2, r0
	bne _021E65B6
	add r1, #8
	ldr r0, [r5, r1]
	cmp r0, #0
	bne _021E65B6
	mov r1, #1
	add r0, sp, #4
	strb r1, [r0, #2]
	add r0, r5, #0
	mov r1, #3
	mov r2, #0
	bl ov73_021E756C
	add r0, r5, #0
	mov r1, #0x16
	bl ov73_021E670C
	add r1, sp, #4
	mov r0, #0x75
	add r1, #2
	mov r2, #1
	bl sub_02037030
	add r0, r5, #0
	mov r1, #0
	bl ov73_021E781C
	ldr r0, _021E66DC ; =0x000005DC
	bl PlaySE
	add r0, r5, #0
	mov r1, #0
	mov r2, #1
	bl ov73_021E71E4
	ldr r0, [r5]
	mov r1, #1
	bl ScheduleBgTilemapBufferTransfer
	b _021E669C
_021E65B6:
	ldr r0, _021E66E0 ; =0x000005F2
	bl PlaySE
	b _021E669C
_021E65BE:
	mov r0, #2
	tst r0, r1
	bne _021E65C8
	cmp r4, #2
	bne _021E6670
_021E65C8:
	bl sub_0203769C
	cmp r0, #0
	beq _021E660C
	ldr r1, _021E66E4 ; =0x00004A10
	ldr r0, [r5, r1]
	cmp r0, #0
	bne _021E65F4
	add r0, r5, #0
	mov r1, #4
	mov r2, #0
	bl ov73_021E756C
	add r0, r5, #0
	mov r1, #4
	bl ov73_021E670C
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	b _021E669C
_021E65F4:
	add r0, r1, #0
	add r0, #0x28
	ldr r0, [r5, r0]
	cmp r0, #0
	bge _021E669C
	mov r0, #2
	add r1, #0x28
	str r0, [r5, r1]
	ldr r0, _021E66E0 ; =0x000005F2
	bl PlaySE
	b _021E669C
_021E660C:
	bl sub_02037454
	ldr r1, _021E66D8 ; =0x00004A1C
	ldr r2, [r5, r1]
	cmp r2, r0
	bne _021E6668
	add r1, #8
	ldr r0, [r5, r1]
	cmp r0, #0
	bne _021E6668
	mov r1, #1
	add r0, sp, #4
	strb r1, [r0, #1]
	add r0, r5, #0
	mov r1, #4
	mov r2, #0
	bl ov73_021E756C
	add r0, r5, #0
	mov r1, #4
	bl ov73_021E670C
	add r1, sp, #4
	mov r0, #0x75
	add r1, #1
	mov r2, #1
	bl sub_02037030
	add r0, r5, #0
	mov r1, #0
	bl ov73_021E781C
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	mov r1, #1
	add r0, r5, #0
	add r2, r1, #0
	bl ov73_021E71E4
	ldr r0, [r5]
	mov r1, #1
	bl ScheduleBgTilemapBufferTransfer
	b _021E669C
_021E6668:
	ldr r0, _021E66E0 ; =0x000005F2
	bl PlaySE
	b _021E669C
_021E6670:
	ldr r0, _021E66E8 ; =0x00004A20
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _021E669C
	bl sub_0203769C
	cmp r0, #0
	bne _021E669C
	bl sub_02037454
	ldr r1, _021E66D8 ; =0x00004A1C
	ldr r1, [r5, r1]
	cmp r1, r0
	bne _021E669C
	mov r1, #0
	add r0, sp, #4
	strb r1, [r0]
	mov r0, #0x75
	add r1, sp, #4
	mov r2, #1
	bl sub_02037030
_021E669C:
	ldr r0, _021E66EC ; =0x00004A38
	ldr r1, [r5, r0]
	cmp r1, #0
	blt _021E66A8
	sub r1, r1, #1
	str r1, [r5, r0]
_021E66A8:
	ldr r0, _021E66EC ; =0x00004A38
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _021E66C2
	add r0, r5, #0
	mov r1, #1
	mov r2, #0
	bl ov73_021E71E4
	ldr r0, [r5]
	mov r1, #1
	bl ScheduleBgTilemapBufferTransfer
_021E66C2:
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_021E66C8: .word ov73_021EA534
_021E66CC: .word 0x0000FFD5
_021E66D0: .word gSystem + 0x40
_021E66D4: .word gSystem
_021E66D8: .word 0x00004A1C
_021E66DC: .word 0x000005DC
_021E66E0: .word 0x000005F2
_021E66E4: .word 0x00004A10
_021E66E8: .word 0x00004A20
_021E66EC: .word 0x00004A38
	thumb_func_end ov73_021E6508

	thumb_func_start ov73_021E66F0
ov73_021E66F0: ; 0x021E66F0
	bx lr
	.balign 4, 0
	thumb_func_end ov73_021E66F0

	thumb_func_start ov73_021E66F4
ov73_021E66F4: ; 0x021E66F4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	mov r1, #2
	bl ov73_021E670C
	add r0, r5, #0
	bl ov73_021E66F0
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov73_021E66F4

	thumb_func_start ov73_021E670C
ov73_021E670C: ; 0x021E670C
	mov r2, #0xc6
	mov r3, #0x1e
	lsl r2, r2, #2
	str r3, [r0, r2]
	add r2, r2, #4
	str r1, [r0, r2]
	bx lr
	.balign 4, 0
	thumb_func_end ov73_021E670C

	thumb_func_start ov73_021E671C
ov73_021E671C: ; 0x021E671C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x4c]
	add r4, r1, #0
	bl ov73_021E75FC
	cmp r0, #0
	beq _021E6768
	mov r1, #0xc7
	lsl r1, r1, #2
	ldr r2, [r5, r1]
	sub r0, r1, #4
	str r2, [r5, r0]
	ldr r0, [r5, r1]
	cmp r0, #3
	bne _021E6768
	bl sub_0203769C
	cmp r0, #0
	bne _021E674E
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	bl ov73_021E71E4
_021E674E:
	mov r1, #0
	ldr r0, _021E6774 ; =0x00004A38
	mvn r1, r1
	str r1, [r5, r0]
	add r0, r5, #0
	mov r1, #1
	mov r2, #0
	bl ov73_021E71E4
	ldr r0, [r5]
	mov r1, #1
	bl ScheduleBgTilemapBufferTransfer
_021E6768:
	add r0, r5, #0
	bl ov73_021E66F0
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E6774: .word 0x00004A38
	thumb_func_end ov73_021E671C

	thumb_func_start ov73_021E6778
ov73_021E6778: ; 0x021E6778
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0203769C
	cmp r0, #0
	bne _021E6794
	mov r0, #0
	str r0, [sp]
	mov r0, #0x75
	add r1, sp, #0
	mov r2, #1
	bl sub_02037030
_021E6794:
	mov r0, #0xc6
	mov r1, #3
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r5, #0
	bl ov73_021E66F0
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov73_021E6778

	thumb_func_start ov73_021E67A8
ov73_021E67A8: ; 0x021E67A8
	push {r4, r5, lr}
	sub sp, #0x14
	add r4, r0, #0
	add r0, sp, #0
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	ldr r0, [r4]
	mov r3, #0xc5
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0x1f
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	mov r1, #0x19
	add r0, sp, #0
	strb r1, [r0, #0x10]
	mov r1, #6
	strb r1, [r0, #0x11]
	ldrb r1, [r0, #0x12]
	mov r2, #0xf
	lsl r3, r3, #2
	bic r1, r2
	ldr r2, [r4, r3]
	sub r3, #0x2c
	lsl r2, r2, #0x18
	lsr r5, r2, #0x18
	mov r2, #0xf
	and r2, r5
	orr r1, r2
	strb r1, [r0, #0x12]
	ldrb r2, [r0, #0x12]
	mov r1, #0xf0
	bic r2, r1
	strb r2, [r0, #0x12]
	ldr r0, [r4, r3]
	add r1, sp, #0
	bl sub_020166FC
	ldr r0, _021E682C ; =0x00004A15
	mov r1, #1
	strb r1, [r4, r0]
	bl sub_0203769C
	cmp r0, #0
	bne _021E6814
	add r0, r4, #0
	mov r1, #0
	mov r2, #2
	bl ov73_021E71E4
_021E6814:
	add r0, r4, #0
	mov r1, #1
	mov r2, #2
	bl ov73_021E71E4
	ldr r0, [r4]
	mov r1, #1
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x14
	pop {r4, r5, pc}
	nop
_021E682C: .word 0x00004A15
	thumb_func_end ov73_021E67A8

	thumb_func_start ov73_021E6830
ov73_021E6830: ; 0x021E6830
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E6888 ; =0x00004A15
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _021E6886
	mov r0, #0xba
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_020169C0
	mov r1, #0xc5
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, #0x2c
	ldr r0, [r4, r1]
	bl sub_020169CC
	ldr r0, _021E6888 ; =0x00004A15
	mov r1, #0
	strb r1, [r4, r0]
	bl sub_0203769C
	cmp r0, #0
	bne _021E686C
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov73_021E71E4
_021E686C:
	mov r1, #0
	ldr r0, _021E688C ; =0x00004A38
	mvn r1, r1
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0
	bl ov73_021E71E4
	ldr r0, [r4]
	mov r1, #1
	bl ScheduleBgTilemapBufferTransfer
_021E6886:
	pop {r4, pc}
	.balign 4, 0
_021E6888: .word 0x00004A15
_021E688C: .word 0x00004A38
	thumb_func_end ov73_021E6830

	thumb_func_start ov73_021E6890
ov73_021E6890: ; 0x021E6890
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov73_021E67A8
	mov r0, #0xc6
	mov r1, #5
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r5, #0
	bl ov73_021E66F0
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov73_021E6890

	thumb_func_start ov73_021E68AC
ov73_021E68AC: ; 0x021E68AC
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r6, r1, #0
	bl sub_0203769C
	cmp r0, #0
	beq _021E68E0
	ldr r0, _021E69BC ; =0x00004A10
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _021E6904
	ldr r0, _021E69C0 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #0xc3
	tst r0, r1
	beq _021E68D4
	ldr r0, _021E69C4 ; =0x000005F2
	bl PlaySE
_021E68D4:
	add r0, r5, #0
	bl ov73_021E66F0
	add sp, #8
	add r0, r6, #0
	pop {r4, r5, r6, pc}
_021E68E0:
	ldr r0, _021E69C8 ; =0x00004A24
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _021E6904
	ldr r0, _021E69C0 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #0xc3
	tst r0, r1
	beq _021E68F8
	ldr r0, _021E69C4 ; =0x000005F2
	bl PlaySE
_021E68F8:
	add r0, r5, #0
	bl ov73_021E66F0
	add sp, #8
	add r0, r6, #0
	pop {r4, r5, r6, pc}
_021E6904:
	bl ov73_021E746C
	add r4, r0, #0
	bl sub_02037454
	cmp r4, r0
	beq _021E691E
	add r0, r5, #0
	bl ov73_021E66F0
	add sp, #8
	add r0, r6, #0
	pop {r4, r5, r6, pc}
_021E691E:
	mov r0, #0xba
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_020168F4
	cmp r0, #0
	beq _021E69B0
	cmp r0, #2
	bne _021E6958
	bl sub_0203769C
	cmp r0, #0
	bne _021E694E
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0x75
	add r1, sp, #4
	mov r2, #1
	bl sub_02037030
	add r0, r5, #0
	mov r1, #1
	bl ov73_021E781C
_021E694E:
	add r0, r5, #0
	mov r1, #0
	bl ov73_021E670C
	b _021E69AA
_021E6958:
	bl sub_0203769C
	cmp r0, #0
	bne _021E6974
	add r0, r5, #0
	mov r1, #0xb
	bl ov73_021E670C
	add r0, r5, #0
	mov r1, #0xe
	mov r2, #0
	bl ov73_021E756C
	b _021E69AA
_021E6974:
	add r0, sp, #0
	mov r1, #0
	mov r2, #4
	bl MI_CpuFill8
	mov r1, #0
	add r0, sp, #0
	strb r1, [r0, #2]
	bl sub_0203769C
	add r1, sp, #0
	strb r0, [r1]
	ldr r0, _021E69CC ; =0x00004A28
	mov r1, #1
	strb r1, [r5, r0]
	mov r1, #0
	add r0, #0xa
	strh r1, [r5, r0]
	mov r0, #0xc6
	mov r1, #6
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r0, #0x70
	add r1, sp, #0
	mov r2, #4
	bl sub_02037030
_021E69AA:
	add r0, r5, #0
	bl ov73_021E6830
_021E69B0:
	add r0, r5, #0
	bl ov73_021E66F0
	add r0, r6, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E69BC: .word 0x00004A10
_021E69C0: .word gSystem
_021E69C4: .word 0x000005F2
_021E69C8: .word 0x00004A24
_021E69CC: .word 0x00004A28
	thumb_func_end ov73_021E68AC

	thumb_func_start ov73_021E69D0
ov73_021E69D0: ; 0x021E69D0
	push {r4, lr}
	add r4, r1, #0
	ldr r1, _021E69E4 ; =0x00004A32
	mov r2, #0
	strh r2, [r0, r1]
	bl ov73_021E66F0
	add r0, r4, #0
	pop {r4, pc}
	nop
_021E69E4: .word 0x00004A32
	thumb_func_end ov73_021E69D0

	thumb_func_start ov73_021E69E8
ov73_021E69E8: ; 0x021E69E8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02037454
	ldr r1, _021E6A68 ; =0x00004A30
	ldrh r1, [r5, r1]
	cmp r1, r0
	bne _021E6A06
	bl ov73_021E746C
	ldr r1, _021E6A68 ; =0x00004A30
	ldrh r2, [r5, r1]
	cmp r2, r0
	beq _021E6A1E
_021E6A06:
	ldr r0, _021E6A6C ; =0x00004A32
	mov r1, #0
	strh r1, [r5, r0]
	mov r0, #0xc6
	mov r1, #8
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r5, #0
	bl ov73_021E66F0
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_021E6A1E:
	add r0, r1, #2
	ldrsh r0, [r5, r0]
	add r2, r0, #1
	add r0, r1, #2
	strh r2, [r5, r0]
	ldrsh r0, [r5, r0]
	cmp r0, #0x1e
	ble _021E6A5E
	add r0, sp, #0
	mov r1, #0
	mov r2, #4
	bl MI_CpuFill8
	mov r1, #1
	add r0, sp, #0
	strb r1, [r0, #2]
	bl sub_0203769C
	add r1, sp, #0
	strb r0, [r1]
	mov r0, #0x70
	add r1, sp, #0
	mov r2, #4
	bl sub_02037030
	ldr r0, _021E6A6C ; =0x00004A32
	mov r1, #0
	strh r1, [r5, r0]
	mov r0, #0xc6
	mov r1, #9
	lsl r0, r0, #2
	str r1, [r5, r0]
_021E6A5E:
	add r0, r5, #0
	bl ov73_021E66F0
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E6A68: .word 0x00004A30
_021E6A6C: .word 0x00004A32
	thumb_func_end ov73_021E69E8

	thumb_func_start ov73_021E6A70
ov73_021E6A70: ; 0x021E6A70
	push {r3, r4, r5, lr}
	ldr r2, _021E6A8C ; =0x00004A28
	add r4, r1, #0
	add r5, r0, #0
	mov r1, #0
	strb r1, [r5, r2]
	bl ov73_021E670C
	add r0, r5, #0
	bl ov73_021E66F0
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E6A8C: .word 0x00004A28
	thumb_func_end ov73_021E6A70

	thumb_func_start ov73_021E6A90
ov73_021E6A90: ; 0x021E6A90
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov73_021E67A8
	mov r0, #0xc6
	mov r1, #0x17
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r5, #0
	bl ov73_021E66F0
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov73_021E6A90

	thumb_func_start ov73_021E6AAC
ov73_021E6AAC: ; 0x021E6AAC
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	add r4, r1, #0
	bl ov73_021E746C
	ldr r1, _021E6B5C ; =0x00004A1C
	ldr r2, [r5, r1]
	cmp r2, r0
	bne _021E6AC8
	add r1, #8
	ldr r0, [r5, r1]
	cmp r0, #0
	beq _021E6AE4
_021E6AC8:
	ldr r0, _021E6B60 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #0xc3
	tst r0, r1
	beq _021E6AD8
	ldr r0, _021E6B64 ; =0x000005F2
	bl PlaySE
_021E6AD8:
	add r0, r5, #0
	bl ov73_021E66F0
	add sp, #4
	add r0, r4, #0
	pop {r3, r4, r5, r6, pc}
_021E6AE4:
	mov r0, #0xba
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_020168F4
	add r6, r0, #0
	beq _021E6B4E
	add r0, r5, #0
	bl ov73_021E6830
	cmp r6, #2
	bne _021E6B1C
	mov r0, #0
	str r0, [sp]
	mov r0, #0x75
	add r1, sp, #0
	mov r2, #1
	bl sub_02037030
	add r0, r5, #0
	mov r1, #1
	bl ov73_021E781C
	add r0, r5, #0
	mov r1, #0
	bl ov73_021E670C
	b _021E6B4E
_021E6B1C:
	add r0, r5, #0
	mov r1, #1
	mov r2, #2
	bl ov73_021E71E4
	add r0, r5, #0
	mov r1, #0
	mov r2, #2
	bl ov73_021E71E4
	bl sub_0203769C
	cmp r0, #0
	bne _021E6B4A
	mov r0, #0xc6
	mov r1, #0x18
	lsl r0, r0, #2
	str r1, [r5, r0]
	bl ov73_021E746C
	ldr r1, _021E6B68 ; =0x00004A2A
	strb r0, [r5, r1]
	b _021E6B4E
_021E6B4A:
	bl GF_AssertFail
_021E6B4E:
	add r0, r5, #0
	bl ov73_021E66F0
	add r0, r4, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_021E6B5C: .word 0x00004A1C
_021E6B60: .word gSystem
_021E6B64: .word 0x000005F2
_021E6B68: .word 0x00004A2A
	thumb_func_end ov73_021E6AAC

	thumb_func_start ov73_021E6B6C
ov73_021E6B6C: ; 0x021E6B6C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021E6B94 ; =0x00004A2B
	add r4, r1, #0
	ldrb r0, [r5, r0]
	cmp r0, #0
	bne _021E6B8E
	mov r1, #0
	mov r0, #0x73
	add r2, r1, #0
	bl sub_02037030
	cmp r0, #1
	bne _021E6B8E
	ldr r0, _021E6B94 ; =0x00004A2B
	mov r1, #1
	strb r1, [r5, r0]
_021E6B8E:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E6B94: .word 0x00004A2B
	thumb_func_end ov73_021E6B6C

	thumb_func_start ov73_021E6B98
ov73_021E6B98: ; 0x021E6B98
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x28]
	ldr r2, [r4, #0x48]
	mov r1, #0x12
	bl ReadMsgDataIntoString
	mov r0, #0xb6
	lsl r0, r0, #2
	ldr r1, [r4, #0x48]
	add r0, r4, r0
	mov r2, #0
	bl ov73_021E63BC
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x25
	bl Set2dSpriteAnimSeqNo
	mov r0, #1
	str r0, [r4, #0xc]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov73_021E6B98

	thumb_func_start ov73_021E6BC8
ov73_021E6BC8: ; 0x021E6BC8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0203769C
	cmp r0, #0
	bne _021E6BDA
	bl sub_02037454
_021E6BDA:
	bl sub_02037454
	ldr r1, _021E6BF4 ; =0x00004A08
	ldr r1, [r5, r1]
	cmp r1, r0
	bne _021E6BEE
	mov r0, #0xc6
	mov r1, #0x1a
	lsl r0, r0, #2
	str r1, [r5, r0]
_021E6BEE:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E6BF4: .word 0x00004A08
	thumb_func_end ov73_021E6BC8

	thumb_func_start ov73_021E6BF8
ov73_021E6BF8: ; 0x021E6BF8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021E6C18 ; =0x00004A0C
	add r4, r1, #0
	ldr r1, _021E6C1C ; =0x00000F48
	ldr r0, [r5, r0]
	add r1, r5, r1
	bl ov73_021EA3D0
	mov r0, #0xc6
	mov r1, #0x1b
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E6C18: .word 0x00004A0C
_021E6C1C: .word 0x00000F48
	thumb_func_end ov73_021E6BF8

	thumb_func_start ov73_021E6C20
ov73_021E6C20: ; 0x021E6C20
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r0, _021E6C4C ; =gSystem + 0x60
	mov r1, #1
	strb r1, [r0, #0xc]
	ldr r0, [r5, #8]
	mov r1, #0x13
	ldr r0, [r0, #0xc]
	bl GameStats_AddSpecial
	mov r0, #0xdd
	lsl r0, r0, #2
	add r0, r5, r0
	bl sub_02039EAC
	mov r0, #0xc6
	mov r1, #0x1c
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E6C4C: .word gSystem + 0x60
	thumb_func_end ov73_021E6C20

	thumb_func_start ov73_021E6C50
ov73_021E6C50: ; 0x021E6C50
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0203769C
	cmp r0, #0
	bne _021E6C62
	bl sub_02037454
_021E6C62:
	ldr r0, [r5, #8]
	mov r2, #0xdd
	lsl r2, r2, #2
	ldr r0, [r0]
	mov r1, #2
	add r2, r5, r2
	bl sub_02039EB4
	cmp r0, #0
	beq _021E6CAE
	ldr r0, _021E6CB4 ; =0x00000657
	mov r1, #8
	bl StopSE
	add r0, r5, #0
	mov r1, #0xd
	mov r2, #0
	bl ov73_021E756C
	add r0, r5, #0
	mov r1, #0x1d
	bl ov73_021E670C
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteAnimSeqNo
	mov r1, #0
	mov r0, #0xc9
	str r1, [r5, #0xc]
	lsl r0, r0, #2
	str r1, [r5, r0]
	ldr r0, _021E6CB8 ; =gSystem + 0x60
	strb r1, [r0, #0xc]
	ldr r0, _021E6CBC ; =0x00004A14
	strb r1, [r5, r0]
_021E6CAE:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E6CB4: .word 0x00000657
_021E6CB8: .word gSystem + 0x60
_021E6CBC: .word 0x00004A14
	thumb_func_end ov73_021E6C50

	thumb_func_start ov73_021E6CC0
ov73_021E6CC0: ; 0x021E6CC0
	push {r3, r4}
	mov r2, #0xc9
	lsl r2, r2, #2
	ldr r4, [r0, r2]
	add r3, r4, #1
	str r3, [r0, r2]
	cmp r4, #0x3c
	ble _021E6CD6
	mov r3, #0xf
	sub r2, #0xc
	str r3, [r0, r2]
_021E6CD6:
	add r0, r1, #0
	pop {r3, r4}
	bx lr
	thumb_func_end ov73_021E6CC0

	thumb_func_start ov73_021E6CDC
ov73_021E6CDC: ; 0x021E6CDC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	mov r1, #5
	mov r2, #0
	bl ov73_021E756C
	add r0, r5, #0
	mov r1, #0xa
	bl ov73_021E670C
	add r0, r5, #0
	bl ov73_021E66F0
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov73_021E6CDC

	thumb_func_start ov73_021E6CFC
ov73_021E6CFC: ; 0x021E6CFC
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0xc9
	lsl r0, r0, #2
	add r4, r1, #0
	ldr r1, [r5, r0]
	add r1, r1, #1
	str r1, [r5, r0]
	ldr r0, [r5, r0]
	cmp r0, #0x3c
	ble _021E6D2C
	mov r1, #0x10
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x32
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r4, #3
_021E6D2C:
	add r0, r5, #0
	bl ov73_021E66F0
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov73_021E6CFC

	thumb_func_start ov73_021E6D38
ov73_021E6D38: ; 0x021E6D38
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov73_021E67A8
	mov r0, #0xc6
	mov r1, #0xc
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r5, #0
	bl ov73_021E66F0
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov73_021E6D38

	thumb_func_start ov73_021E6D54
ov73_021E6D54: ; 0x021E6D54
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov73_021E746C
	ldr r1, _021E6DEC ; =0x00004A1C
	ldr r2, [r5, r1]
	cmp r2, r0
	bne _021E6D6E
	add r1, #8
	ldr r0, [r5, r1]
	cmp r0, #0
	beq _021E6D88
_021E6D6E:
	ldr r0, _021E6DF0 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #0xc3
	tst r0, r1
	beq _021E6D7E
	ldr r0, _021E6DF4 ; =0x000005F2
	bl PlaySE
_021E6D7E:
	add r0, r5, #0
	bl ov73_021E66F0
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_021E6D88:
	mov r0, #0xba
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_020168F4
	cmp r0, #0
	beq _021E6DE0
	cmp r0, #2
	bne _021E6DB8
	mov r1, #0
	mov r0, #0xc6
	str r1, [sp]
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r0, #0x75
	add r1, sp, #0
	mov r2, #1
	bl sub_02037030
	add r0, r5, #0
	mov r1, #1
	bl ov73_021E781C
	b _021E6DDA
_021E6DB8:
	mov r0, #0xc6
	mov r1, #0xd
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r1, #0
	mov r0, #0x71
	add r2, r1, #0
	bl sub_02037030
	mov r0, #0
	bl sub_02034818
	add r2, r0, #0
	ldr r0, [r5, #0x24]
	mov r1, #0
	bl BufferPlayersName
_021E6DDA:
	add r0, r5, #0
	bl ov73_021E6830
_021E6DE0:
	add r0, r5, #0
	bl ov73_021E66F0
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E6DEC: .word 0x00004A1C
_021E6DF0: .word gSystem
_021E6DF4: .word 0x000005F2
	thumb_func_end ov73_021E6D54

	thumb_func_start ov73_021E6DF8
ov73_021E6DF8: ; 0x021E6DF8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0203769C
	cmp r0, #0
	bne _021E6E12
	add r0, r5, #0
	mov r1, #5
	mov r2, #0
	bl ov73_021E756C
	b _021E6E2C
_021E6E12:
	mov r0, #0
	bl sub_02034818
	add r2, r0, #0
	ldr r0, [r5, #0x24]
	mov r1, #0
	bl BufferPlayersName
	add r0, r5, #0
	mov r1, #0x10
	mov r2, #0
	bl ov73_021E756C
_021E6E2C:
	add r0, r5, #0
	mov r1, #0xe
	bl ov73_021E670C
	mov r0, #0xc9
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r5, #0
	bl ov73_021E66F0
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov73_021E6DF8

	thumb_func_start ov73_021E6E48
ov73_021E6E48: ; 0x021E6E48
	push {r4, lr}
	add r4, r1, #0
	mov r1, #0xc9
	lsl r1, r1, #2
	ldr r2, [r0, r1]
	add r2, r2, #1
	str r2, [r0, r1]
	ldr r2, [r0, r1]
	cmp r2, #0x2d
	ble _021E6E62
	mov r2, #0xf
	sub r1, #0xc
	str r2, [r0, r1]
_021E6E62:
	bl ov73_021E66F0
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov73_021E6E48

	thumb_func_start ov73_021E6E6C
ov73_021E6E6C: ; 0x021E6E6C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xc9
	add r4, r1, #0
	bl sub_02037AC0
	mov r0, #0xc6
	mov r1, #0x10
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r5, #0
	bl ov73_021E66F0
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov73_021E6E6C

	thumb_func_start ov73_021E6E8C
ov73_021E6E8C: ; 0x021E6E8C
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #0xc9
	add r5, r1, #0
	bl sub_02037B38
	cmp r0, #0
	beq _021E6EBE
	mov r0, #0
	add r1, r0, #0
	bl sub_020398D4
	mov r1, #0x10
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x32
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r5, #3
_021E6EBE:
	add r0, r4, #0
	bl ov73_021E66F0
	add r0, r5, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov73_021E6E8C

	thumb_func_start ov73_021E6ECC
ov73_021E6ECC: ; 0x021E6ECC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x4c]
	add r4, r1, #0
	bl ov73_021E75FC
	cmp r0, #0
	beq _021E6EE6
	add r0, r5, #0
	mov r1, #9
	mov r2, #0
	bl ov73_021E756C
_021E6EE6:
	mov r0, #0xc6
	mov r1, #0x12
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r5, #0
	bl ov73_021E66F0
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov73_021E6ECC

	thumb_func_start ov73_021E6EF8
ov73_021E6EF8: ; 0x021E6EF8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x4c]
	add r4, r1, #0
	bl ov73_021E75FC
	cmp r0, #0
	beq _021E6F10
	mov r0, #0xc6
	mov r1, #0xa
	lsl r0, r0, #2
	str r1, [r5, r0]
_021E6F10:
	add r0, r5, #0
	bl ov73_021E66F0
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov73_021E6EF8

	thumb_func_start ov73_021E6F1C
ov73_021E6F1C: ; 0x021E6F1C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0203769C
	cmp r0, #0
	bne _021E6F34
	add r0, r5, #0
	mov r1, #0
	mov r2, #2
	bl ov73_021E71E4
_021E6F34:
	mov r1, #0
	ldr r0, _021E6FA4 ; =0x00004A38
	mvn r1, r1
	str r1, [r5, r0]
	add r0, r5, #0
	mov r1, #1
	mov r2, #2
	bl ov73_021E71E4
	ldr r0, [r5]
	mov r1, #1
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0x4c]
	cmp r0, #0xff
	beq _021E6F66
	bl ov73_021E75FC
	cmp r0, #0
	bne _021E6F66
	ldr r0, [r5, #0x4c]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_020200A0
_021E6F66:
	add r0, r5, #0
	mov r1, #0xf
	mov r2, #1
	bl ov73_021E756C
	mov r0, #0xc6
	mov r1, #0x14
	lsl r0, r0, #2
	str r1, [r5, r0]
	bl sub_0203769C
	cmp r0, #0
	bne _021E6F88
	add r0, r5, #0
	mov r1, #0
	bl ov73_021E781C
_021E6F88:
	bl sub_02037454
	ldr r1, _021E6FA8 ; =0x00004A2C
	str r0, [r5, r1]
	mov r0, #0x4b
	lsl r0, r0, #2
	add r1, #8
	str r0, [r5, r1]
	add r0, r5, #0
	bl ov73_021E66F0
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E6FA4: .word 0x00004A38
_021E6FA8: .word 0x00004A2C
	thumb_func_end ov73_021E6F1C

	thumb_func_start ov73_021E6FAC
ov73_021E6FAC: ; 0x021E6FAC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021E6FE4 ; =0x00004A2C
	add r4, r1, #0
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _021E6FCA
	bl sub_02037454
	ldr r1, _021E6FE4 ; =0x00004A2C
	ldr r2, [r5, r1]
	cmp r2, r0
	beq _021E6FCA
	mov r0, #0
	str r0, [r5, r1]
_021E6FCA:
	mov r0, #0xc6
	mov r1, #0x15
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r1, #0
	add r0, #0xc
	str r1, [r5, r0]
	add r0, r5, #0
	bl ov73_021E66F0
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E6FE4: .word 0x00004A2C
	thumb_func_end ov73_021E6FAC

	thumb_func_start ov73_021E6FE8
ov73_021E6FE8: ; 0x021E6FE8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021E7054 ; =0x00004A2C
	add r4, r1, #0
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _021E7006
	bl sub_02037454
	ldr r1, _021E7054 ; =0x00004A2C
	ldr r2, [r5, r1]
	cmp r2, r0
	beq _021E7006
	mov r0, #0
	str r0, [r5, r1]
_021E7006:
	ldr r0, _021E7058 ; =0x00004A34
	ldr r1, [r5, r0]
	sub r1, r1, #1
	str r1, [r5, r0]
	ldr r1, [r5, r0]
	cmp r1, #0
	bge _021E701A
	mov r1, #0
	sub r0, #8
	str r1, [r5, r0]
_021E701A:
	mov r1, #0xc9
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	add r0, r0, #1
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	cmp r0, #0x3c
	ble _021E7048
	ldr r0, _021E7054 ; =0x00004A2C
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _021E7048
	mov r0, #0
	sub r1, #0xc
	str r0, [r5, r1]
	bl sub_0203769C
	cmp r0, #0
	bne _021E7048
	add r0, r5, #0
	mov r1, #1
	bl ov73_021E781C
_021E7048:
	add r0, r5, #0
	bl ov73_021E66F0
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E7054: .word 0x00004A2C
_021E7058: .word 0x00004A34
	thumb_func_end ov73_021E6FE8

	thumb_func_start ov73_021E705C
ov73_021E705C: ; 0x021E705C
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #0xd
	bgt _021E707E
	bge _021E7092
	cmp r4, #8
	bgt _021E7110
	cmp r4, #2
	blt _021E7110
	beq _021E708C
	cmp r4, #7
	beq _021E710A
	cmp r4, #8
	beq _021E710A
	pop {r4, r5, r6, pc}
_021E707E:
	cmp r4, #0x13
	bgt _021E7086
	beq _021E70D0
	pop {r4, r5, r6, pc}
_021E7086:
	cmp r4, #0x19
	beq _021E7098
	pop {r4, r5, r6, pc}
_021E708C:
	bl ov73_021E761C
	b _021E710A
_021E7092:
	bl ov73_021E6830
	b _021E710A
_021E7098:
	ldr r0, [r5, #0x4c]
	bl ov73_021E75FC
	cmp r0, #0
	bne _021E70AC
	ldr r0, [r5, #0x4c]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_020200A0
_021E70AC:
	add r0, r5, #0
	mov r1, #1
	mov r2, #2
	bl ov73_021E71E4
	ldr r0, [r5]
	mov r1, #1
	bl ScheduleBgTilemapBufferTransfer
	add r0, r5, #0
	mov r1, #0xc
	mov r2, #0
	bl ov73_021E756C
	add r0, r5, #0
	bl ov73_021E6830
	b _021E710A
_021E70D0:
	ldr r0, _021E7114 ; =0x00004A28
	ldrb r0, [r5, r0]
	cmp r0, #1
	beq _021E7110
	add r0, r6, #0
	bl sub_02034818
	add r2, r0, #0
	ldr r0, [r5, #0x24]
	mov r1, #0
	bl BufferPlayersName
	bl sub_0203769C
	cmp r6, r0
	beq _021E7110
	add r0, r5, #0
	bl ov73_021E6830
	bl sub_0203769C
	cmp r0, #0
	bne _021E710A
	ldr r1, _021E7118 ; =0x00004A24
	ldr r0, _021E711C ; =0x0000FFFF
	ldr r2, [r5, r1]
	eor r0, r6
	and r0, r2
	str r0, [r5, r1]
_021E710A:
	mov r0, #0xc6
	lsl r0, r0, #2
	str r4, [r5, r0]
_021E7110:
	pop {r4, r5, r6, pc}
	nop
_021E7114: .word 0x00004A28
_021E7118: .word 0x00004A24
_021E711C: .word 0x0000FFFF
	thumb_func_end ov73_021E705C

	thumb_func_start ov73_021E7120
ov73_021E7120: ; 0x021E7120
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	mov r0, #0xc6
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r4, r1, #0
	add r6, r2, #0
	cmp r0, #3
	bne _021E71C0
	cmp r4, #1
	beq _021E713E
	cmp r4, #0x13
	beq _021E7182
	b _021E71B8
_021E713E:
	add r0, r6, #0
	bl sub_02034818
	add r2, r0, #0
	ldr r0, [r5, #0x24]
	mov r1, #0
	bl BufferPlayersName
	add r0, r5, #0
	mov r1, #1
	bl ov73_021E781C
	mov r0, #0xc6
	lsl r0, r0, #2
	str r4, [r5, r0]
	bl sub_02037454
	ldr r1, _021E71D8 ; =0x00004A1C
	str r0, [r5, r1]
	mov r0, #0
	add r1, #8
	str r0, [r5, r1]
	bl sub_0203769C
	cmp r0, #0
	bne _021E71D2
	mov r2, #1
	mov r0, #0x75
	add r1, sp, #0
	str r2, [sp]
	bl sub_02037030
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_021E7182:
	add r0, r6, #0
	bl sub_02034818
	add r2, r0, #0
	ldr r0, [r5, #0x24]
	mov r1, #0
	bl BufferPlayersName
	bl sub_0203769C
	cmp r6, r0
	beq _021E71D2
	bl sub_0203769C
	cmp r0, #0
	bne _021E71AE
	ldr r1, _021E71DC ; =0x00004A24
	ldr r0, _021E71E0 ; =0x0000FFFF
	ldr r2, [r5, r1]
	eor r0, r6
	and r0, r2
	str r0, [r5, r1]
_021E71AE:
	mov r0, #0xc6
	lsl r0, r0, #2
	add sp, #4
	str r4, [r5, r0]
	pop {r3, r4, r5, r6, pc}
_021E71B8:
	bl GF_AssertFail
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_021E71C0:
	cmp r4, #1
	bne _021E71D2
	ldr r0, _021E71DC ; =0x00004A24
	mov r1, #0
	str r1, [r5, r0]
	bl sub_02037454
	ldr r1, _021E71D8 ; =0x00004A1C
	str r0, [r5, r1]
_021E71D2:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_021E71D8: .word 0x00004A1C
_021E71DC: .word 0x00004A24
_021E71E0: .word 0x0000FFFF
	thumb_func_end ov73_021E7120

	thumb_func_start ov73_021E71E4
ov73_021E71E4: ; 0x021E71E4
	push {r3, r4, lr}
	sub sp, #0x1c
	add r3, r1, #0
	mov r1, #0xc3
	lsl r1, r1, #2
	ldr r1, [r0, r1]
	mov r4, #8
	str r4, [sp]
	mov r4, #4
	str r4, [sp, #4]
	add r4, r1, #0
	add r4, #0xc
	str r4, [sp, #8]
	mov r4, #0
	lsl r2, r2, #0x1a
	str r4, [sp, #0xc]
	lsr r2, r2, #0x18
	str r2, [sp, #0x10]
	ldrh r2, [r1]
	lsl r2, r2, #0x15
	lsr r2, r2, #0x18
	str r2, [sp, #0x14]
	ldrh r1, [r1, #2]
	ldr r2, _021E722C ; =_021EA51C
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x18]
	ldrb r2, [r2, r3]
	ldr r0, [r0]
	mov r1, #1
	mov r3, #0x14
	bl CopyToBgTilemapRect
	add sp, #0x1c
	pop {r3, r4, pc}
	nop
_021E722C: .word _021EA51C
	thumb_func_end ov73_021E71E4

	thumb_func_start ov73_021E7230
ov73_021E7230: ; 0x021E7230
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r4, r0, #0
	bl sub_0203769C
	cmp r0, #0
	bne _021E7286
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov73_021E71E4
	ldr r0, [r4, #0x28]
	mov r1, #0x15
	bl NewString_ReadMsgData
	add r5, r0, #0
	mov r0, #4
	add r1, r5, #0
	mov r2, #0
	bl FontID_String_GetWidth
	mov r1, #0x40
	sub r3, r1, r0
	mov r1, #0
	str r1, [sp]
	lsr r6, r3, #0x1f
	add r6, r3, r6
	ldr r0, _021E72EC ; =0x00040100
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xae
	lsl r0, r0, #2
	str r1, [sp, #0xc]
	add r0, r4, r0
	mov r1, #4
	add r2, r5, #0
	asr r3, r6, #1
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl String_dtor
_021E7286:
	mov r1, #0
	ldr r0, _021E72F0 ; =0x00004A38
	mvn r1, r1
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0
	bl ov73_021E71E4
	ldr r0, [r4, #0x28]
	mov r1, #0x16
	bl NewString_ReadMsgData
	add r5, r0, #0
	mov r0, #4
	add r1, r5, #0
	mov r2, #0
	bl FontID_String_GetWidth
	mov r1, #0x40
	sub r3, r1, r0
	mov r1, #0
	str r1, [sp]
	lsr r6, r3, #0x1f
	add r6, r3, r6
	ldr r0, _021E72EC ; =0x00040100
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xb2
	lsl r0, r0, #2
	str r1, [sp, #0xc]
	add r0, r4, r0
	mov r1, #4
	add r2, r5, #0
	asr r3, r6, #1
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl String_dtor
	ldr r0, [r4]
	mov r1, #1
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4]
	mov r1, #0
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021E72EC: .word 0x00040100
_021E72F0: .word 0x00004A38
	thumb_func_end ov73_021E7230

	thumb_func_start ov73_021E72F4
ov73_021E72F4: ; 0x021E72F4
	push {r3, lr}
	ldrh r1, [r0]
	add r1, #0xa
	strh r1, [r0]
	ldrh r2, [r0]
	mov r1, #0x5a
	lsl r1, r1, #2
	cmp r2, r1
	bls _021E730A
	mov r1, #0
	strh r1, [r0]
_021E730A:
	ldrh r0, [r0]
	bl GF_SinDeg
	mov r1, #0xa
	add r2, r0, #0
	mul r2, r1
	asr r0, r2, #0xb
	lsr r0, r0, #0x14
	add r0, r2, r0
	asr r0, r0, #0xc
	add r0, #0xf
	lsl r2, r0, #5
	mov r0, #0x1d
	orr r2, r0
	add r0, sp, #0
	strh r2, [r0]
	add r0, sp, #0
	mov r2, #2
	bl GX_LoadOBJPltt
	add r0, sp, #0
	mov r1, #0x2a
	mov r2, #2
	bl GX_LoadOBJPltt
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov73_021E72F4

	thumb_func_start ov73_021E7340
ov73_021E7340: ; 0x021E7340
	push {r3, r4, r5, lr}
	mov r5, #0
	add r4, r5, #0
_021E7346:
	add r0, r4, #0
	bl sub_02034818
	cmp r0, #0
	beq _021E7352
	add r5, r5, #1
_021E7352:
	add r4, r4, #1
	cmp r4, #5
	blt _021E7346
	add r0, r5, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov73_021E7340

	thumb_func_start ov73_021E735C
ov73_021E735C: ; 0x021E735C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	str r3, [sp, #0x14]
	add r6, r0, #0
	str r2, [sp, #0x10]
	bl sub_0203769C
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x14]
	bl ov73_021E7490
	cmp r0, #0
	bne _021E737C
	add sp, #0x28
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E737C:
	add r0, r6, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r7, [sp, #0x14]
	mov r0, #0
	str r0, [sp, #0x20]
	add r4, r7, #0
	mov r5, #1
_021E738E:
	mov r0, #0xce
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	cmp r0, #0
	beq _021E7448
	bl PlayerProfile_GetTrainerID_VisibleHalf
	str r0, [sp, #0x24]
	mov r0, #0xce
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	ldr r1, [r4, #0x2c]
	bl PlayerName_FlatToString
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0x24]
	ldr r0, [r0, #0x24]
	mov r1, #0
	mov r3, #5
	bl BufferIntegerAsString
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x14]
	ldr r0, [r0, #0x24]
	ldr r1, [r1, #0x28]
	mov r2, #1
	mov r3, #0x32
	bl ReadMsgData_ExpandPlaceholders
	str r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	cmp r1, r0
	str r5, [sp]
	bne _021E7410
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E7464 ; =0x00020300
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x2c]
	add r0, r6, #0
	mov r3, #5
	bl AddTextPrinterParameterized2
	str r5, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E7464 ; =0x00020300
	ldr r2, [sp, #0x18]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #0
	mov r3, #0x46
	bl AddTextPrinterParameterized2
	b _021E7442
_021E7410:
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x2c]
	add r0, r6, #0
	mov r3, #5
	bl AddTextPrinterParameterized2
	str r5, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0x18]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #0
	mov r3, #0x46
	bl AddTextPrinterParameterized2
_021E7442:
	ldr r0, [sp, #0x18]
	bl String_dtor
_021E7448:
	ldr r0, [sp, #0x20]
	add r7, #8
	add r0, r0, #1
	add r4, r4, #4
	add r5, #0x12
	str r0, [sp, #0x20]
	cmp r0, #5
	blt _021E738E
	add r0, r6, #0
	bl CopyWindowToVram
	mov r0, #1
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E7464: .word 0x00020300
	thumb_func_end ov73_021E735C

	thumb_func_start ov73_021E7468
ov73_021E7468: ; 0x021E7468
	bx lr
	.balign 4, 0
	thumb_func_end ov73_021E7468

	thumb_func_start ov73_021E746C
ov73_021E746C: ; 0x021E746C
	push {r3, r4, r5, lr}
	mov r5, #0
	add r4, r5, #0
_021E7472:
	add r0, r4, #0
	bl sub_02034818
	cmp r0, #0
	beq _021E747E
	add r5, r5, #1
_021E747E:
	add r4, r4, #1
	cmp r4, #5
	blt _021E7472
	add r0, r5, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov73_021E746C

	thumb_func_start ov73_021E7488
ov73_021E7488: ; 0x021E7488
	ldr r3, _021E748C ; =ov73_021E746C
	bx r3
	.balign 4, 0
_021E748C: .word ov73_021E746C
	thumb_func_end ov73_021E7488

	thumb_func_start ov73_021E7490
ov73_021E7490: ; 0x021E7490
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r4, #0
	str r4, [sp]
	add r6, r7, #0
	add r5, r7, #0
_021E749C:
	mov r0, #0xce
	lsl r0, r0, #2
	ldr r1, [r6, r0]
	add r0, r0, #4
	str r1, [r6, r0]
	add r0, r4, #0
	bl sub_02034818
	mov r1, #0xce
	lsl r1, r1, #2
	str r0, [r6, r1]
	ldr r0, _021E7560 ; =0x00004A3C
	ldr r2, _021E7564 ; =0x00004A44
	ldr r1, [r5, r0]
	add r0, r0, #4
	ldr r0, [r5, r0]
	str r1, [r5, r2]
	add r1, r2, #4
	str r0, [r5, r1]
	mov r0, #0xce
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _021E74DA
	bl PlayerProfile_GetTrainerID
	ldr r1, _021E7560 ; =0x00004A3C
	str r0, [r5, r1]
	mov r1, #1
	ldr r0, _021E7568 ; =0x00004A40
	b _021E74E4
_021E74DA:
	add r0, r2, #0
	mov r1, #0
	sub r0, #8
	str r1, [r5, r0]
	sub r0, r2, #4
_021E74E4:
	add r4, r4, #1
	str r1, [r5, r0]
	add r6, #8
	add r5, #0x10
	cmp r4, #5
	blt _021E749C
	mov r4, #0
	add r2, r7, #0
	add r3, r7, #0
_021E74F6:
	mov r0, #0xce
	mov r1, #0xcf
	lsl r0, r0, #2
	lsl r1, r1, #2
	ldr r0, [r7, r0]
	ldr r1, [r7, r1]
	cmp r1, r0
	beq _021E7520
	mov r1, #1
	str r1, [sp]
	cmp r0, #0
	bne _021E7518
	mov r0, #0x36
	mov r1, #3
	lsl r0, r0, #4
	str r1, [r2, r0]
	b _021E7550
_021E7518:
	mov r0, #0x36
	lsl r0, r0, #4
	str r1, [r2, r0]
	b _021E7550
_021E7520:
	ldr r0, _021E7560 ; =0x00004A3C
	ldr r5, _021E7564 ; =0x00004A44
	ldr r1, [r3, r0]
	ldr r6, [r3, r5]
	add r0, r0, #4
	add r5, r5, #4
	ldr r0, [r3, r0]
	ldr r5, [r3, r5]
	eor r1, r6
	eor r5, r0
	orr r1, r5
	beq _021E7550
	mov r1, #1
	str r1, [sp]
	cmp r0, #0
	bne _021E754A
	mov r0, #0x36
	mov r1, #3
	lsl r0, r0, #4
	str r1, [r2, r0]
	b _021E7550
_021E754A:
	mov r0, #0x36
	lsl r0, r0, #4
	str r1, [r2, r0]
_021E7550:
	add r4, r4, #1
	add r7, #8
	add r2, r2, #4
	add r3, #0x10
	cmp r4, #5
	blt _021E74F6
	ldr r0, [sp]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E7560: .word 0x00004A3C
_021E7564: .word 0x00004A44
_021E7568: .word 0x00004A40
	thumb_func_end ov73_021E7490

	thumb_func_start ov73_021E756C
ov73_021E756C: ; 0x021E756C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r7, r1, #0
	mov r0, #0xb4
	mov r1, #0x32
	add r6, r2, #0
	bl String_ctor
	add r4, r0, #0
	ldr r0, [r5, #0x28]
	add r1, r7, #0
	add r2, r4, #0
	bl ReadMsgDataIntoString
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x44]
	add r2, r4, #0
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	mov r0, #0xaa
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #0xaa
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	mov r2, #1
	mov r3, #0xb
	bl DrawFrameAndWindow2
	cmp r6, #0
	bne _021E75DC
	add r0, r5, #0
	bl ov73_021E7818
	mov r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	str r3, [sp, #8]
	mov r0, #0xaa
	lsl r0, r0, #2
	ldr r2, [r5, #0x44]
	add r0, r5, r0
	mov r1, #1
	bl AddTextPrinterParameterized
	add sp, #0xc
	str r0, [r5, #0x4c]
	pop {r4, r5, r6, r7, pc}
_021E75DC:
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	mov r0, #0xaa
	lsl r0, r0, #2
	ldr r2, [r5, #0x44]
	add r0, r5, r0
	mov r1, #1
	bl AddTextPrinterParameterized
	mov r0, #0xff
	str r0, [r5, #0x4c]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov73_021E756C

	thumb_func_start ov73_021E75FC
ov73_021E75FC: ; 0x021E75FC
	push {r3, lr}
	cmp r0, #0xff
	bne _021E7606
	mov r0, #1
	pop {r3, pc}
_021E7606:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _021E7616
	mov r0, #1
	pop {r3, pc}
_021E7616:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov73_021E75FC

	thumb_func_start ov73_021E761C
ov73_021E761C: ; 0x021E761C
	mov r1, #0xaa
	lsl r1, r1, #2
	add r0, r0, r1
	ldr r3, _021E7628 ; =ClearFrameAndWindow2
	mov r1, #0
	bx r3
	.balign 4, 0
_021E7628: .word ClearFrameAndWindow2
	thumb_func_end ov73_021E761C

	thumb_func_start ov73_021E762C
ov73_021E762C: ; 0x021E762C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #0xbd
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [sp, #0x14]
	mov r0, #0xc1
	lsl r0, r0, #2
	mov r4, #0
	add r0, r5, r0
	str r4, [sp, #8]
	add r6, r5, #0
	mov r7, #0x1c
	str r0, [sp, #0x18]
_021E764E:
	mov r0, #0x36
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #3
	bhi _021E771A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E7664: ; jump table
	.short _021E771A - _021E7664 - 2 ; case 0
	.short _021E766C - _021E7664 - 2 ; case 1
	.short _021E771A - _021E7664 - 2 ; case 2
	.short _021E76E2 - _021E7664 - 2 ; case 3
_021E766C:
	mov r0, #0xce
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	cmp r0, #0
	bne _021E767A
	bl GF_AssertFail
_021E767A:
	mov r0, #0xce
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl PlayerProfile_GetTrainerGender
	str r0, [sp, #0xc]
	mov r0, #0xce
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl PlayerProfile_GetAvatar
	str r0, [sp, #0x10]
	bl sub_0203769C
	cmp r4, r0
	bne _021E76AC
	mov r0, #0x8b
	ldr r1, [sp, #0xc]
	lsl r0, r0, #2
	lsl r1, r1, #1
	ldr r0, [r5, r0]
	add r1, #0x26
	bl Set2dSpriteAnimSeqNo
	b _021E76C8
_021E76AC:
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x18]
	str r0, [sp]
	ldr r0, [sp, #0x14]
	ldr r3, [sp, #0x10]
	add r2, r4, #0
	bl ov73_021E77A4
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [sp, #4]
	bl Set2dSpriteAnimSeqNo
_021E76C8:
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x36
	mov r1, #2
	lsl r0, r0, #4
	str r1, [r5, r0]
	mov r0, #1
	str r0, [sp, #8]
	b _021E771A
_021E76E2:
	bl sub_0203769C
	cmp r4, r0
	bne _021E7706
	mov r0, #0xce
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl PlayerProfile_GetTrainerGender
	add r1, r0, #0
	mov r0, #0x8b
	lsl r0, r0, #2
	lsl r1, r1, #1
	ldr r0, [r5, r0]
	add r1, #0x27
	bl Set2dSpriteAnimSeqNo
	b _021E7712
_021E7706:
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r7, #0
	bl Set2dSpriteAnimSeqNo
_021E7712:
	mov r0, #0x36
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r5, r0]
_021E771A:
	ldr r0, [sp, #4]
	add r4, r4, #1
	add r0, r0, #2
	add r5, r5, #4
	add r6, #8
	add r7, r7, #2
	str r0, [sp, #4]
	cmp r4, #5
	blt _021E764E
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _021E7738
	ldr r0, _021E773C ; =0x0000064E
	bl PlaySE
_021E7738:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E773C: .word 0x0000064E
	thumb_func_end ov73_021E762C

	thumb_func_start ov73_021E7740
ov73_021E7740: ; 0x021E7740
	push {r3, r4, r5, lr}
	mov r2, #0xc1
	add r5, r0, #0
	lsl r2, r2, #2
	add r4, r1, #0
	mov r0, #0x64
	mov r1, #9
	add r2, r5, r2
	mov r3, #0x32
	bl GfGfxLoader_GetPlttData
	mov r2, #0xbf
	lsl r2, r2, #2
	str r0, [r5, r2]
	add r2, #0xc
	add r0, r4, #0
	mov r1, #0xb
	add r2, r5, r2
	mov r3, #0x32
	bl GfGfxLoader_GetPlttDataFromOpenNarc
	mov r3, #3
	lsl r3, r3, #8
	str r0, [r5, r3]
	mov r0, #0x32
	sub r3, #0xc
	str r0, [sp]
	mov r0, #0x64
	mov r1, #0x2b
	mov r2, #1
	add r3, r5, r3
	bl GfGfxLoader_GetCharData
	mov r3, #0xbb
	lsl r3, r3, #2
	str r0, [r5, r3]
	mov r0, #0x32
	add r3, #0xc
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0xc
	mov r2, #1
	add r3, r5, r3
	bl GfGfxLoader_GetCharDataFromOpenNarc
	mov r1, #0x2f
	lsl r1, r1, #4
	str r0, [r5, r1]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov73_021E7740

	thumb_func_start ov73_021E77A4
ov73_021E77A4: ; 0x021E77A4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r6, r1, #0
	ldr r0, [sp, #0x18]
	add r1, r3, #0
	add r5, r2, #0
	bl sub_0205B464
	add r4, r0, #0
	ldr r0, [r6, #4]
	mov r2, #6
	ldr r6, [r0, #0xc]
	ldr r0, [r7, #4]
	lsl r2, r2, #8
	ldr r1, [r0, #0x14]
	add r0, r4, #0
	mul r0, r2
	add r0, r1, r0
	ldr r1, _021E77E4 ; =ov73_021EA520
	lsl r3, r5, #1
	ldrh r1, [r1, r3]
	bl GX_LoadOBJ
	lsl r0, r4, #5
	add r1, r5, #7
	add r0, r6, r0
	lsl r1, r1, #5
	mov r2, #0x20
	bl GX_LoadOBJPltt
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E77E4: .word ov73_021EA520
	thumb_func_end ov73_021E77A4

	thumb_func_start ov73_021E77E8
ov73_021E77E8: ; 0x021E77E8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xbf
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #3
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0xbb
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov73_021E77E8

	thumb_func_start ov73_021E7818
ov73_021E7818: ; 0x021E7818
	mov r0, #1
	bx lr
	thumb_func_end ov73_021E7818

	thumb_func_start ov73_021E781C
ov73_021E781C: ; 0x021E781C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0203769C
	cmp r0, #0
	bne _021E7868
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _021E783A
	mov r0, #1
	bl sub_02038C1C
	b _021E784A
_021E783A:
	bl sub_02037454
	add r0, r4, r0
	cmp r0, #5
	ble _021E7846
	mov r0, #5
_021E7846:
	bl sub_02038C1C
_021E784A:
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	ldr r0, _021E786C ; =0x00004A29
	bne _021E785A
	mov r1, #2
	strb r1, [r5, r0]
	pop {r3, r4, r5, pc}
_021E785A:
	cmp r4, #0
	bne _021E7864
	mov r1, #1
	strb r1, [r5, r0]
	pop {r3, r4, r5, pc}
_021E7864:
	mov r1, #0
	strb r1, [r5, r0]
_021E7868:
	pop {r3, r4, r5, pc}
	nop
_021E786C: .word 0x00004A29
	thumb_func_end ov73_021E781C

	thumb_func_start ov73_021E7870
ov73_021E7870: ; 0x021E7870
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r4, r0, #0
	add r6, r1, #0
	bl ov73_021E746C
	add r5, r0, #0
	ldr r0, _021E7950 ; =0x00004A1C
	ldr r1, [r4, r0]
	cmp r5, r1
	ble _021E789A
	mov r2, #1
	add r0, sp, #0
	strb r2, [r0]
	mov r0, #0x75
	add r1, sp, #0
	bl sub_02037030
	mov r1, #1
	ldr r0, _021E7954 ; =0x00004A20
	b _021E789E
_021E789A:
	mov r1, #0
	add r0, r0, #4
_021E789E:
	str r1, [r4, r0]
	ldr r0, _021E7958 ; =0x00004A18
	ldr r0, [r4, r0]
	cmp r5, r0
	bne _021E78AE
	add sp, #4
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_021E78AE:
	cmp r5, #5
	bhi _021E7942
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E78BE: ; jump table
	.short _021E7942 - _021E78BE - 2 ; case 0
	.short _021E78CA - _021E78BE - 2 ; case 1
	.short _021E78FC - _021E78BE - 2 ; case 2
	.short _021E78FC - _021E78BE - 2 ; case 3
	.short _021E78FC - _021E78BE - 2 ; case 4
	.short _021E7934 - _021E78BE - 2 ; case 5
_021E78CA:
	bl sub_02037454
	cmp r0, #1
	bgt _021E78DA
	bl sub_02033250
	cmp r0, #1
	bls _021E78E0
_021E78DA:
	add sp, #4
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_021E78E0:
	mov r0, #0xc6
	mov r1, #0x11
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r4, #0
	sub r1, #0x12
	bl ov73_021E781C
	add r0, r4, #0
	bl ov73_021E6830
	add sp, #4
	mov r0, #2
	pop {r3, r4, r5, r6, pc}
_021E78FC:
	mov r0, #2
	bl sub_0205A904
	ldr r0, _021E7958 ; =0x00004A18
	ldr r1, [r4, r0]
	cmp r5, r1
	bge _021E7942
	add r0, #0x11
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _021E7918
	cmp r0, #1
	beq _021E7922
	b _021E792A
_021E7918:
	add r0, r4, #0
	add r1, r6, #0
	bl ov73_021E781C
	b _021E792A
_021E7922:
	add r0, r4, #0
	mov r1, #0
	bl ov73_021E781C
_021E792A:
	bl sub_02037454
	ldr r1, _021E7950 ; =0x00004A1C
	str r0, [r4, r1]
	b _021E7942
_021E7934:
	mov r0, #9
	bl sub_0205A904
	add r0, r4, #0
	add r1, r6, #0
	bl ov73_021E781C
_021E7942:
	bl ov73_021E746C
	ldr r1, _021E7958 ; =0x00004A18
	str r0, [r4, r1]
	mov r0, #1
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021E7950: .word 0x00004A1C
_021E7954: .word 0x00004A20
_021E7958: .word 0x00004A18
	thumb_func_end ov73_021E7870

	thumb_func_start ov73_021E795C
ov73_021E795C: ; 0x021E795C
	mov r0, #0x2c
	bx lr
	thumb_func_end ov73_021E795C

	thumb_func_start ov73_021E7960
ov73_021E7960: ; 0x021E7960
	add r0, #0x2c
	bx lr
	thumb_func_end ov73_021E7960

	thumb_func_start ov73_021E7964
ov73_021E7964: ; 0x021E7964
	push {r4, r5, r6, r7}
	add r7, r0, #0
	add r6, r7, #0
	mov ip, r1
	mov r5, #5
	add r6, #0xdc
_021E7970:
	add r4, r6, #0
	sub r4, #0x2c
	add r3, r6, #0
	mov r2, #5
_021E7978:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E7978
	ldr r0, [r4]
	sub r5, r5, #1
	sub r6, #0x2c
	str r0, [r3]
	cmp r5, #2
	bgt _021E7970
	add r7, #0x58
	mov r3, #5
_021E7990:
	mov r2, ip
	ldmia r2!, {r0, r1}
	mov ip, r2
	stmia r7!, {r0, r1}
	sub r3, r3, #1
	bne _021E7990
	mov r0, ip
	ldr r0, [r0]
	str r0, [r7]
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end ov73_021E7964

	thumb_func_start ov73_021E79A8
ov73_021E79A8: ; 0x021E79A8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #2
	blt _021E79B6
	cmp r5, #5
	ble _021E79BA
_021E79B6:
	bl GF_AssertFail
_021E79BA:
	add r2, r5, #1
	cmp r2, #5
	bgt _021E79E2
	mov r0, #0x2c
	mul r0, r2
	add r3, r4, r0
_021E79C6:
	add r6, r3, #0
	add r7, r3, #0
	sub r6, #0x2c
	mov r5, #5
_021E79CE:
	ldmia r7!, {r0, r1}
	stmia r6!, {r0, r1}
	sub r5, r5, #1
	bne _021E79CE
	ldr r0, [r7]
	add r2, r2, #1
	add r3, #0x2c
	str r0, [r6]
	cmp r2, #5
	ble _021E79C6
_021E79E2:
	ldr r0, _021E79F0 ; =0x0000FFFF
	add r1, r4, #0
	add r4, #0xdc
	add r1, #0xdc
	strh r0, [r4]
	strh r0, [r1, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E79F0: .word 0x0000FFFF
	thumb_func_end ov73_021E79A8

	thumb_func_start ov73_021E79F4
ov73_021E79F4: ; 0x021E79F4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp]
	add r5, r2, #0
	str r1, [sp, #4]
	str r3, [sp, #8]
	cmp r0, #0
	ble _021E7A6E
	mov r7, #0x2c
_021E7A0C:
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	ldr r6, [r0]
	ldr r0, [sp, #4]
	cmp r1, r0
	beq _021E7A5C
	cmp r6, #0
	beq _021E7A5C
	add r0, r6, #0
	bl sub_0202C8C4
	cmp r0, #1
	beq _021E7A5C
	add r0, r6, #0
	add r1, r5, #0
	bl sub_0202C8E4
	cmp r0, #0
	bne _021E7A5C
	mov r4, #0
_021E7A34:
	add r1, r4, #2
	add r2, r1, #0
	mul r2, r7
	add r0, r6, #0
	add r1, r5, r2
	bl sub_0202C8E4
	cmp r0, #0
	beq _021E7A4E
	add r0, r5, #0
	add r1, r4, #2
	bl ov73_021E79A8
_021E7A4E:
	add r4, r4, #1
	cmp r4, #4
	blt _021E7A34
	add r0, r5, #0
	add r1, r6, #0
	bl ov73_021E7964
_021E7A5C:
	ldr r0, [sp, #8]
	add r0, r0, #4
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	add r1, r0, #1
	ldr r0, [sp]
	str r1, [sp, #0xc]
	cmp r1, r0
	blt _021E7A0C
_021E7A6E:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov73_021E79F4

	thumb_func_start ov73_021E7A74
ov73_021E7A74: ; 0x021E7A74
	mov r0, #0x12
	lsl r0, r0, #4
	bx lr
	.balign 4, 0
	thumb_func_end ov73_021E7A74

	thumb_func_start ov73_021E7A7C
ov73_021E7A7C: ; 0x021E7A7C
	mov r0, #0x12
	lsl r0, r0, #4
	bx lr
	.balign 4, 0
	thumb_func_end ov73_021E7A7C

	thumb_func_start ov73_021E7A84
ov73_021E7A84: ; 0x021E7A84
	mov r0, #0x12
	lsl r0, r0, #4
	bx lr
	.balign 4, 0
	thumb_func_end ov73_021E7A84

	thumb_func_start ov73_021E7A8C
ov73_021E7A8C: ; 0x021E7A8C
	push {r4, r5}
	ldr r4, _021E7ABC ; =ov73_021EA664
	lsl r5, r0, #2
	ldr r0, [r4, r5]
	mov r2, #0
	ldrb r3, [r0]
	cmp r3, #0xff
	beq _021E7AB4
	add r4, r0, #0
_021E7A9E:
	ldrb r3, [r0]
	cmp r1, r3
	bne _021E7AAA
	mov r0, #1
	pop {r4, r5}
	bx lr
_021E7AAA:
	add r2, r2, #1
	ldrb r3, [r4, r2]
	add r0, r0, #1
	cmp r3, #0xff
	bne _021E7A9E
_021E7AB4:
	mov r0, #0
	pop {r4, r5}
	bx lr
	nop
_021E7ABC: .word ov73_021EA664
	thumb_func_end ov73_021E7A8C

	thumb_func_start ov73_021E7AC0
ov73_021E7AC0: ; 0x021E7AC0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	add r7, r2, #0
	str r3, [sp]
	bl Sav2_PlayerData_GetProfileAddr
	add r4, r0, #0
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [sp]
	cmp r0, #0
	ble _021E7B36
_021E7ADA:
	mov r0, #0
	add r1, r5, #0
	mov r2, #0x48
	bl MIi_CpuClearFast
	add r0, r4, #0
	bl PlayerProfile_GetTrainerID
	str r0, [r5]
	add r0, r4, #0
	bl PlayerProfile_GetTrainerGender
	strb r0, [r5, #4]
	mov r0, #GAME_VERSION
	strb r0, [r5, #5]
	mov r0, #2
	strb r0, [r5, #6]
	add r0, r4, #0
	bl PlayerProfile_GetNamePtr
	add r1, r0, #0
	add r0, r5, #0
	add r0, #8
	mov r2, #8
	bl CopyU16StringArrayN
	add r3, r5, #0
	add r6, r7, #0
	add r3, #0x18
	mov r2, #6
_021E7B16:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E7B16
	mov r0, #0
	strb r0, [r5, #0x19]
	strb r0, [r5, #0x18]
	ldr r0, [sp, #4]
	add r7, #0x30
	add r0, r0, #1
	str r0, [sp, #4]
	add r1, r0, #0
	ldr r0, [sp]
	add r5, #0x48
	cmp r1, r0
	blt _021E7ADA
_021E7B36:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov73_021E7AC0

	thumb_func_start ov73_021E7B3C
ov73_021E7B3C: ; 0x021E7B3C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r2, #0
	add r5, r0, #0
	add r0, r1, #0
	add r1, r4, #0
	bl AllocFromHeapAtEnd
	add r7, r0, #0
	add r0, r5, #0
	bl sub_020270C4
	add r6, r0, #0
	add r0, r5, #0
	bl ov73_021E7A74
	cmp r4, r0
	beq _021E7B64
	bl GF_AssertFail
_021E7B64:
	mov r0, #1
	mov r2, #0x63
	str r0, [sp]
	mov r0, #3
	lsl r2, r2, #2
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r7, #0
	add r2, r6, r2
	mov r3, #4
	bl ov73_021E7AC0
	add r0, r7, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov73_021E7B3C

	thumb_func_start ov73_021E7B84
ov73_021E7B84: ; 0x021E7B84
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r2, #0
	add r5, r0, #0
	add r0, r1, #0
	add r1, r4, #0
	bl AllocFromHeapAtEnd
	add r7, r0, #0
	add r0, r5, #0
	bl sub_020270C4
	add r6, r0, #0
	add r0, r5, #0
	bl ov73_021E7A7C
	cmp r4, r0
	beq _021E7BAC
	bl GF_AssertFail
_021E7BAC:
	mov r0, #1
	add r6, #0xc
	str r0, [sp]
	mov r3, #4
	add r0, r5, #0
	add r1, r7, #0
	add r2, r6, #0
	str r3, [sp, #4]
	bl ov73_021E7AC0
	add r0, r7, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov73_021E7B84

	thumb_func_start ov73_021E7BC8
ov73_021E7BC8: ; 0x021E7BC8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r2, #0
	add r5, r0, #0
	add r0, r1, #0
	add r1, r4, #0
	bl AllocFromHeapAtEnd
	add r7, r0, #0
	add r0, r5, #0
	bl sub_020270C4
	add r6, r0, #0
	add r0, r5, #0
	bl ov73_021E7A84
	cmp r4, r0
	beq _021E7BF0
	bl GF_AssertFail
_021E7BF0:
	mov r0, #1
	str r0, [sp]
	mov r0, #5
	add r6, #0xcc
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r7, #0
	add r2, r6, #0
	mov r3, #4
	bl ov73_021E7AC0
	add r0, r7, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov73_021E7BC8

	thumb_func_start ov73_021E7C0C
ov73_021E7C0C: ; 0x021E7C0C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r2, #0
	add r5, r0, #0
	add r0, r1, #0
	add r1, r4, #0
	bl AllocFromHeapAtEnd
	add r7, r0, #0
	add r0, r5, #0
	bl sub_020270C4
	add r6, r0, #0
	add r0, r5, #0
	bl ov73_021E7A74
	cmp r4, r0
	beq _021E7C34
	bl GF_AssertFail
_021E7C34:
	mov r0, #0
	mov r2, #0x63
	str r0, [sp]
	lsl r2, r2, #2
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r7, #0
	add r2, r6, r2
	mov r3, #4
	bl ov73_021E7AC0
	add r0, r7, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov73_021E7C0C

	thumb_func_start ov73_021E7C50
ov73_021E7C50: ; 0x021E7C50
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r2, #0
	add r5, r0, #0
	add r0, r1, #0
	add r1, r4, #0
	bl AllocFromHeapAtEnd
	add r7, r0, #0
	add r0, r5, #0
	bl sub_020270C4
	add r6, r0, #0
	add r0, r5, #0
	bl ov73_021E7A7C
	cmp r4, r0
	beq _021E7C78
	bl GF_AssertFail
_021E7C78:
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	add r6, #0xc
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r7, #0
	add r2, r6, #0
	mov r3, #4
	bl ov73_021E7AC0
	add r0, r7, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov73_021E7C50

	thumb_func_start ov73_021E7C94
ov73_021E7C94: ; 0x021E7C94
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r2, #0
	add r5, r0, #0
	add r0, r1, #0
	add r1, r4, #0
	bl AllocFromHeapAtEnd
	add r7, r0, #0
	add r0, r5, #0
	bl sub_020270C4
	add r6, r0, #0
	add r0, r5, #0
	bl ov73_021E7A84
	cmp r4, r0
	beq _021E7CBC
	bl GF_AssertFail
_021E7CBC:
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	add r6, #0xcc
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r7, #0
	add r2, r6, #0
	mov r3, #4
	bl ov73_021E7AC0
	add r0, r7, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov73_021E7C94

	thumb_func_start ov73_021E7CD8
ov73_021E7CD8: ; 0x021E7CD8
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r4, r1, #0
	ldrb r1, [r6, #0x18]
	add r5, r0, #0
	cmp r1, #0
	bne _021E7CEA
	mov r0, #0
	pop {r4, r5, r6, pc}
_021E7CEA:
	add r0, r3, #0
	bl ov73_021E7A8C
	cmp r0, #0
	bne _021E7CFA
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021E7CFA:
	mov r1, #0
	cmp r4, #0
	ble _021E7D24
	add r2, r5, #0
_021E7D02:
	ldrb r0, [r2, #0x18]
	cmp r0, #0
	bne _021E7D1C
	mov r0, #0x48
	mul r0, r1
	add r3, r5, r0
	mov r2, #9
_021E7D10:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E7D10
	mov r0, #1
	pop {r4, r5, r6, pc}
_021E7D1C:
	add r1, r1, #1
	add r2, #0x48
	cmp r1, r4
	blt _021E7D02
_021E7D24:
	mov r2, #0
	cmp r4, #0
	ble _021E7D4E
	add r1, r5, #0
_021E7D2C:
	ldrb r0, [r1, #0x19]
	cmp r0, #3
	blo _021E7D46
	mov r0, #0x48
	mul r0, r2
	add r3, r5, r0
	mov r2, #9
_021E7D3A:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E7D3A
	mov r0, #1
	pop {r4, r5, r6, pc}
_021E7D46:
	add r2, r2, #1
	add r1, #0x48
	cmp r2, r4
	blt _021E7D2C
_021E7D4E:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov73_021E7CD8

	thumb_func_start ov73_021E7D54
ov73_021E7D54: ; 0x021E7D54
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl sub_02034818
	cmp r0, #0
	bne _021E7D66
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E7D66:
	bl PlayerProfile_GetVersion
	cmp r0, #0
	beq _021E7D70
	add r4, r5, #0
_021E7D70:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov73_021E7D54

	thumb_func_start ov73_021E7D74
ov73_021E7D74: ; 0x021E7D74
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	str r0, [sp]
	ldr r0, [sp, #0x44]
	str r1, [sp, #4]
	str r0, [sp, #0x44]
	ldr r0, [sp, #0x48]
	add r7, r2, #0
	str r0, [sp, #0x48]
	add r0, sp, #0x1c
	mov r1, #0
	mov r2, #0x10
	str r3, [sp, #8]
	ldr r5, [sp, #0x40]
	bl MI_CpuFill8
	mov r4, #0
	add r6, r4, #0
	cmp r7, #0
	ble _021E7E18
	str r5, [sp, #0x14]
_021E7D9E:
	ldr r0, [sp, #0x14]
	ldr r0, [r0]
	cmp r0, #0
	beq _021E7E0C
	mov r0, #0
	str r0, [sp, #0x18]
	str r0, [sp, #0x10]
	b _021E7E06
_021E7DAE:
	add r0, r4, #1
	add r1, r7, #0
	bl _s32_div_f
	add r4, r1, #0
_021E7DB8:
	lsl r0, r4, #2
	str r0, [sp, #0xc]
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _021E7DAE
	cmp r4, r6
	beq _021E7DAE
	add r0, sp, #0x1c
	ldrb r0, [r0, r4]
	cmp r0, #4
	beq _021E7DAE
	add r1, r0, #1
	add r0, sp, #0x1c
	strb r1, [r0, r4]
	ldr r0, [sp, #8]
	cmp r4, r0
	beq _021E7DFA
	ldr r2, [sp, #0x44]
	add r0, r4, #0
	add r1, r5, #0
	bl ov73_021E7D54
	add r3, r0, #0
	beq _021E7DFA
	ldr r2, [sp, #0xc]
	ldr r0, [sp]
	ldr r3, [r3, r2]
	ldr r2, [sp, #0x10]
	ldr r1, [sp, #4]
	add r2, r3, r2
	ldr r3, [sp, #0x48]
	bl ov73_021E7CD8
_021E7DFA:
	ldr r0, [sp, #0x10]
	add r0, #0x48
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x18]
	add r0, r0, #1
	str r0, [sp, #0x18]
_021E7E06:
	ldr r0, [sp, #0x18]
	cmp r0, #4
	blt _021E7DB8
_021E7E0C:
	ldr r0, [sp, #0x14]
	add r6, r6, #1
	add r0, r0, #4
	str r0, [sp, #0x14]
	cmp r6, r7
	blt _021E7D9E
_021E7E18:
	mov r0, #0x17
	bl SaveSubstruct_UpdateCRC
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov73_021E7D74

	thumb_func_start ov73_021E7E24
ov73_021E7E24: ; 0x021E7E24
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r1, #0
	ldr r1, [sp, #0x18]
	str r3, [sp]
	str r1, [sp, #4]
	add r4, r2, #0
	mov r1, #0
	str r1, [sp, #8]
	ldr r1, _021E7E48 ; =0x0000090C
	add r2, r5, #0
	add r0, r0, r1
	mov r1, #8
	add r3, r4, #0
	bl ov73_021E7D74
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_021E7E48: .word 0x0000090C
	thumb_func_end ov73_021E7E24

	thumb_func_start ov73_021E7E4C
ov73_021E7E4C: ; 0x021E7E4C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r1, #0
	add r6, r0, #0
	ldr r0, [r5]
	cmp r0, #0
	beq _021E7E62
	cmp r0, #1
	bne _021E7E60
	b _021E7F62
_021E7E60:
	b _021E7F78
_021E7E62:
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E7F80 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _021E7F84 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r2, #5
	mov r0, #3
	mov r1, #0x96
	lsl r2, r2, #0x10
	bl CreateHeap
	ldr r1, _021E7F88 ; =0x000012CC
	add r0, r6, #0
	mov r2, #0x96
	bl OverlayManager_CreateAndGetData
	ldr r2, _021E7F88 ; =0x000012CC
	mov r1, #0
	add r4, r0, #0
	bl memset
	mov r0, #0x96
	bl BgConfig_Alloc
	str r0, [r4, #4]
	ldr r0, _021E7F8C ; =_021EA940
	add r2, sp, #0
	ldr r3, _021E7F90 ; =ov73_021EA68C
	str r4, [r0]
	add r7, r2, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	add r0, r7, #0
	bl SetBothScreensModesAndDisable
	mov r0, #0xb
	mov r1, #0x20
	mov r2, #0x96
	bl ScrStrBufs_new_custom
	mov r1, #0xbd
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r2, _021E7F94 ; =0x0000031F
	mov r0, #0
	mov r1, #0x1b
	mov r3, #0x96
	bl NewMsgDataFromNarc
	ldr r1, _021E7F98 ; =0x00000BD4
	ldr r2, _021E7F9C ; =0x0000030A
	str r0, [r4, r1]
	mov r0, #0
	mov r1, #0x1b
	mov r3, #0x96
	bl NewMsgDataFromNarc
	ldr r1, _021E7FA0 ; =0x00000BD8
	mov r2, #0x32
	str r0, [r4, r1]
	mov r0, #0
	mov r1, #0x1b
	lsl r2, r2, #4
	mov r3, #0x96
	bl NewMsgDataFromNarc
	ldr r1, _021E7FA4 ; =0x00000BDC
	str r0, [r4, r1]
	mov r0, #4
	mov r1, #8
	bl SetKeyRepeatTimers
	add r0, r4, #0
	add r1, r6, #0
	bl ov73_021E8148
	add r0, r4, #0
	bl ov73_021E8454
	mov r1, #0
	mov r0, #0x34
	add r2, r1, #0
	bl sub_02004EC4
	ldr r1, _021E7FA8 ; =0x00020020
	mov r0, #0x96
	bl AllocFromHeap
	str r0, [r4, #0x24]
	add r0, #0x1f
	mov r1, #0x1f
	bic r0, r1
	mov r1, #2
	lsl r1, r1, #0x10
	mov r2, #0
	bl NNS_FndCreateExpHeapEx
	str r0, [r4, #0x28]
	ldr r1, _021E7FAC ; =0x0000047D
	mov r0, #0xb
	mov r2, #1
	bl sub_02004EC4
	ldr r2, _021E7FB0 ; =0x04000304
	ldr r0, _021E7FB4 ; =0xFFFF7FFF
	ldrh r1, [r2]
	and r0, r1
	strh r0, [r2]
	mov r0, #1
	str r0, [r5]
	b _021E7F78
_021E7F62:
	bl LoadDwcOverlay
	bl LoadOVY38
	bl sub_02034D8C
	mov r0, #0
	str r0, [r5]
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E7F78:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7F80: .word 0xFFFFE0FF
_021E7F84: .word 0x04001000
_021E7F88: .word 0x000012CC
_021E7F8C: .word _021EA940
_021E7F90: .word ov73_021EA68C
_021E7F94: .word 0x0000031F
_021E7F98: .word 0x00000BD4
_021E7F9C: .word 0x0000030A
_021E7FA0: .word 0x00000BD8
_021E7FA4: .word 0x00000BDC
_021E7FA8: .word 0x00020020
_021E7FAC: .word 0x0000047D
_021E7FB0: .word 0x04000304
_021E7FB4: .word 0xFFFF7FFF
	thumb_func_end ov73_021E7E4C

	thumb_func_start ov73_021E7FB8
ov73_021E7FB8: ; 0x021E7FB8
	push {r4, r5, r6, lr}
	add r4, r1, #0
	bl OverlayManager_GetData
	add r5, r0, #0
	bl ov00_021ECB40
	bl ov72_022378DC
	bl ov00_021ECB40
	ldr r1, [r4]
	cmp r1, #5
	bhi _021E8060
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E7FE0: ; jump table
	.short _021E7FEC - _021E7FE0 - 2 ; case 0
	.short _021E8008 - _021E7FE0 - 2 ; case 1
	.short _021E801C - _021E7FE0 - 2 ; case 2
	.short _021E802A - _021E7FE0 - 2 ; case 3
	.short _021E803E - _021E7FE0 - 2 ; case 4
	.short _021E805C - _021E7FE0 - 2 ; case 5
_021E7FEC:
	bl sub_02034DB8
	cmp r0, #0
	beq _021E8060
	ldr r1, [r5, #0x28]
	ldr r0, _021E8070 ; =_021EA940
	str r1, [r0, #4]
	ldr r0, _021E8074 ; =ov73_021E83F4
	ldr r1, _021E8078 ; =ov73_021E841C
	bl ov00_021EC294
	mov r0, #1
	str r0, [r4]
	b _021E8060
_021E8008:
	ldr r3, [r5, #0x10]
	mov r2, #0xc
	add r6, r3, #0
	mul r6, r2
	ldr r2, _021E807C ; =ov73_021EA83C
	add r0, r5, #0
	ldr r2, [r2, r6]
	blx r2
	str r0, [r4]
	b _021E8060
_021E801C:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E8060
	mov r0, #3
	str r0, [r4]
	b _021E8060
_021E802A:
	ldr r3, [r5, #0x10]
	mov r2, #0xc
	add r6, r3, #0
	mul r6, r2
	ldr r2, _021E8080 ; =ov73_021EA840
	add r0, r5, #0
	ldr r2, [r2, r6]
	blx r2
	str r0, [r4]
	b _021E8060
_021E803E:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E8060
	ldr r3, [r5, #0x10]
	mov r2, #0xc
	add r6, r3, #0
	mul r6, r2
	ldr r2, _021E8084 ; =ov73_021EA844
	ldr r1, [r4]
	ldr r2, [r2, r6]
	add r0, r5, #0
	blx r2
	str r0, [r4]
	b _021E8060
_021E805C:
	mov r0, #1
	pop {r4, r5, r6, pc}
_021E8060:
	ldr r0, _021E8088 ; =0x00000BF8
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _021E806C
	bl sub_0202457C
_021E806C:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E8070: .word _021EA940
_021E8074: .word ov73_021E83F4
_021E8078: .word ov73_021E841C
_021E807C: .word ov73_021EA83C
_021E8080: .word ov73_021EA840
_021E8084: .word ov73_021EA844
_021E8088: .word 0x00000BF8
	thumb_func_end ov73_021E7FB8

	thumb_func_start ov73_021E808C
ov73_021E808C: ; 0x021E808C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	ldr r0, [r4, #0x24]
	bl FreeToHeap
	bl UnloadOVY38
	bl UnloadDwcOverlay
	add r0, r4, #0
	bl ov73_021E847C
	ldr r0, _021E80F4 ; =0x00000BDC
	ldr r0, [r4, r0]
	bl DestroyMsgData
	ldr r0, _021E80F8 ; =0x00000BD8
	ldr r0, [r4, r0]
	bl DestroyMsgData
	ldr r0, _021E80FC ; =0x00000BD4
	ldr r0, [r4, r0]
	bl DestroyMsgData
	mov r0, #0xbd
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ScrStrBufs_delete
	add r0, r4, #0
	bl ov73_021E8164
	bl sub_02034DE0
	ldr r0, [r4, #4]
	bl FreeToHeap
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0x96
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E80F4: .word 0x00000BDC
_021E80F8: .word 0x00000BD8
_021E80FC: .word 0x00000BD4
	thumb_func_end ov73_021E808C

	thumb_func_start ov73_021E8100
ov73_021E8100: ; 0x021E8100
	push {r4, lr}
	add r4, r0, #0
	bl GF_RunVramTransferTasks
	ldr r0, [r4, #4]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	bl OamManager_ApplyAndResetBuffers
	ldr r3, _021E8120 ; =0x027E0000
	ldr r1, _021E8124 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.balign 4, 0
_021E8120: .word 0x027E0000
_021E8124: .word 0x00003FF8
	thumb_func_end ov73_021E8100

	thumb_func_start ov73_021E8128
ov73_021E8128: ; 0x021E8128
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E8144 ; =ov73_021EA6AC
	add r3, sp, #0
	mov r2, #5
_021E8132:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E8132
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_021E8144: .word ov73_021EA6AC
	thumb_func_end ov73_021E8128

	thumb_func_start ov73_021E8148
ov73_021E8148: ; 0x021E8148
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl OverlayManager_GetParentWork
	mov r1, #0
	str r0, [r4]
	add r0, r4, #0
	add r2, r1, #0
	str r1, [r4, #0x10]
	bl ov73_021E844C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov73_021E8148

	thumb_func_start ov73_021E8164
ov73_021E8164: ; 0x021E8164
	bx lr
	.balign 4, 0
	thumb_func_end ov73_021E8164

	thumb_func_start ov73_021E8168
ov73_021E8168: ; 0x021E8168
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _021E8194 ; =ov73_021EA69C
	add r3, sp, #0
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl sub_020215A0
	mov r0, #0x14
	mov r1, #0x96
	bl sub_02022588
	bl sub_020216C8
	bl sub_02022638
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_021E8194: .word ov73_021EA69C
	thumb_func_end ov73_021E8168

	thumb_func_start ov73_021E8198
ov73_021E8198: ; 0x021E8198
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r6, r0, #0
	mov r0, #0x64
	mov r1, #0x96
	bl NARC_ctor
	str r0, [sp, #0x14]
	bl NNS_G2dInitOamManagerModule
	mov r0, #0
	str r0, [sp]
	mov r1, #0x7e
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r3, #0x20
	str r3, [sp, #0xc]
	mov r2, #0x96
	str r2, [sp, #0x10]
	add r2, r0, #0
	bl OamManager_Create
	ldr r1, _021E8290 ; =0x00000BFC
	mov r0, #0xa
	add r1, r6, r1
	mov r2, #0x96
	bl G2dRenderer_Init
	ldr r1, _021E8294 ; =0x00000BF8
	mov r2, #1
	str r0, [r6, r1]
	add r0, r1, #4
	add r0, r6, r0
	mov r1, #0
	lsl r2, r2, #0x14
	bl G2dRenderer_SetSubSurfaceCoords
	ldr r7, _021E8298 ; =0x00000D24
	mov r4, #0
	add r5, r6, #0
_021E81E8:
	mov r0, #2
	add r1, r4, #0
	mov r2, #0x96
	bl Create2DGfxResObjMan
	str r0, [r5, r7]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _021E81E8
	mov r0, #0
	str r0, [sp]
	mov r3, #1
	str r3, [sp, #4]
	mov r0, #0x96
	str r0, [sp, #8]
	ldr r0, _021E8298 ; =0x00000D24
	ldr r1, [sp, #0x14]
	ldr r0, [r6, r0]
	mov r2, #0x2e
	bl AddCharResObjFromOpenNarc
	ldr r1, _021E829C ; =0x00000D34
	mov r3, #0
	str r0, [r6, r1]
	str r3, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	mov r0, #0x96
	sub r1, #0xc
	str r0, [sp, #0xc]
	ldr r0, [r6, r1]
	ldr r1, [sp, #0x14]
	mov r2, #0xa
	bl AddPlttResObjFromOpenNarc
	ldr r1, _021E82A0 ; =0x00000D38
	mov r2, #0x2f
	str r0, [r6, r1]
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x96
	sub r1, #0xc
	str r0, [sp, #8]
	ldr r0, [r6, r1]
	ldr r1, [sp, #0x14]
	mov r3, #1
	bl AddCellOrAnimResObjFromOpenNarc
	ldr r1, _021E82A4 ; =0x00000D3C
	mov r2, #0x30
	str r0, [r6, r1]
	mov r0, #0
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x96
	sub r1, #0xc
	str r0, [sp, #8]
	ldr r0, [r6, r1]
	ldr r1, [sp, #0x14]
	mov r3, #1
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x35
	lsl r1, r1, #6
	str r0, [r6, r1]
	sub r1, #0xc
	ldr r0, [r6, r1]
	bl sub_0200ACF0
	ldr r0, _021E82A0 ; =0x00000D38
	ldr r0, [r6, r0]
	bl sub_0200AF94
	ldr r0, [sp, #0x14]
	bl NARC_dtor
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E8290: .word 0x00000BFC
_021E8294: .word 0x00000BF8
_021E8298: .word 0x00000D24
_021E829C: .word 0x00000D34
_021E82A0: .word 0x00000D38
_021E82A4: .word 0x00000D3C
	thumb_func_end ov73_021E8198

	thumb_func_start ov73_021E82A8
ov73_021E82A8: ; 0x021E82A8
	push {r3, r4}
	ldr r4, _021E82D0 ; =0x00000BF8
	ldr r1, [r1, r4]
	str r1, [r0]
	str r2, [r0, #4]
	mov r2, #0
	mov r1, #1
	str r2, [r0, #0x10]
	lsl r1, r1, #0xc
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	str r1, [r0, #0x1c]
	strh r2, [r0, #0x20]
	mov r1, #1
	str r1, [r0, #0x24]
	str r3, [r0, #0x28]
	mov r1, #0x96
	str r1, [r0, #0x2c]
	pop {r3, r4}
	bx lr
	.balign 4, 0
_021E82D0: .word 0x00000BF8
	thumb_func_end ov73_021E82A8

	thumb_func_start ov73_021E82D4
ov73_021E82D4: ; 0x021E82D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	mov r1, #0
	add r5, r0, #0
	str r1, [sp]
	sub r0, r1, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, _021E8384 ; =0x00000D24
	str r1, [sp, #0x10]
	ldr r0, [r5, r2]
	add r3, r1, #0
	str r0, [sp, #0x14]
	add r0, r2, #4
	ldr r0, [r5, r0]
	str r0, [sp, #0x18]
	add r0, r2, #0
	add r0, #8
	ldr r0, [r5, r0]
	str r0, [sp, #0x1c]
	add r0, r2, #0
	add r0, #0xc
	ldr r0, [r5, r0]
	add r2, #0x40
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, r5, r2
	add r2, r1, #0
	str r1, [sp, #0x28]
	bl CreateSpriteResourcesHeader
	ldr r2, _021E8388 ; =0x00000D64
	add r0, sp, #0x2c
	add r1, r5, #0
	add r2, r5, r2
	mov r3, #1
	bl ov73_021E82A8
	mov r7, #0xdd
	ldr r4, _021E838C ; =ov73_021EA684
	mov r6, #0
	lsl r7, r7, #4
_021E832A:
	ldrh r0, [r4]
	lsl r0, r0, #0xc
	str r0, [sp, #0x34]
	ldrh r0, [r4, #2]
	lsl r0, r0, #0xc
	str r0, [sp, #0x38]
	add r0, sp, #0x2c
	bl CreateSprite
	mov r1, #0xdd
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #0xdd
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r1, r6, #0
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r5, r7]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r6, r6, #1
	add r4, r4, #4
	add r5, r5, #4
	cmp r6, #2
	blt _021E832A
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	bl sub_0203A880
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	nop
_021E8384: .word 0x00000D24
_021E8388: .word 0x00000D64
_021E838C: .word ov73_021EA684
	thumb_func_end ov73_021E82D4

	thumb_func_start ov73_021E8390
ov73_021E8390: ; 0x021E8390
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0x96
	add r4, r1, #0
	add r6, r2, #0
	bl sub_0201660C
	mov r1, #0
	mov r2, #8
	str r2, [sp, #0xc]
	str r5, [sp]
	str r1, [sp, #4]
	str r6, [sp, #8]
	mov r2, #0x17
	add r3, sp, #0
	strb r2, [r3, #0x10]
	strb r4, [r3, #0x11]
	ldrb r4, [r3, #0x12]
	mov r2, #0xf
	add r7, r0, #0
	bic r4, r2
	strb r4, [r3, #0x12]
	ldrb r4, [r3, #0x12]
	mov r2, #0xf0
	bic r4, r2
	strb r4, [r3, #0x12]
	strb r1, [r3, #0x13]
	add r1, sp, #0
	bl sub_020166FC
	add r0, r7, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov73_021E8390

	thumb_func_start ov73_021E83D4
ov73_021E83D4: ; 0x021E83D4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_020168F4
	add r4, r0, #0
	beq _021E83E6
	add r0, r5, #0
	bl sub_02016624
_021E83E6:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov73_021E83D4

	thumb_func_start ov73_021E83EC
ov73_021E83EC: ; 0x021E83EC
	str r1, [r0, #0x1c]
	str r2, [r0, #0x20]
	bx lr
	.balign 4, 0
	thumb_func_end ov73_021E83EC

	thumb_func_start ov73_021E83F4
ov73_021E83F4: ; 0x021E83F4
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl OS_DisableInterrupts
	add r6, r0, #0
	ldr r0, _021E8418 ; =_021EA940
	add r1, r5, #0
	ldr r0, [r0, #4]
	add r2, r4, #0
	bl NNS_FndAllocFromExpHeapEx
	add r4, r0, #0
	add r0, r6, #0
	bl OS_RestoreInterrupts
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E8418: .word _021EA940
	thumb_func_end ov73_021E83F4

	thumb_func_start ov73_021E841C
ov73_021E841C: ; 0x021E841C
	push {r3, r4, r5, lr}
	add r5, r1, #0
	beq _021E8438
	bl OS_DisableInterrupts
	add r4, r0, #0
	ldr r0, _021E843C ; =_021EA940
	add r1, r5, #0
	ldr r0, [r0, #4]
	bl NNS_FndFreeToExpHeap
	add r0, r4, #0
	bl OS_RestoreInterrupts
_021E8438:
	pop {r3, r4, r5, pc}
	nop
_021E843C: .word _021EA940
	thumb_func_end ov73_021E841C

	thumb_func_start ov73_021E8440
ov73_021E8440: ; 0x021E8440
	push {r3, lr}
	bl ov00_021EC9D4
	mov r1, #3
	sub r0, r1, r0
	pop {r3, pc}
	thumb_func_end ov73_021E8440

	thumb_func_start ov73_021E844C
ov73_021E844C: ; 0x021E844C
	str r1, [r0, #0x14]
	str r2, [r0, #0x18]
	bx lr
	.balign 4, 0
	thumb_func_end ov73_021E844C

	thumb_func_start ov73_021E8454
ov73_021E8454: ; 0x021E8454
	push {r4, lr}
	add r4, r0, #0
	bl ov73_021E8128
	bl ov73_021E8168
	add r0, r4, #0
	bl ov73_021E8198
	add r0, r4, #0
	bl ov73_021E82D4
	ldr r0, _021E8478 ; =ov73_021E8100
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	pop {r4, pc}
	nop
_021E8478: .word ov73_021E8100
	thumb_func_end ov73_021E8454

	thumb_func_start ov73_021E847C
ov73_021E847C: ; 0x021E847C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, _021E84C0 ; =0x00000D34
	ldr r0, [r6, r0]
	bl sub_0200AEB0
	ldr r0, _021E84C4 ; =0x00000D38
	ldr r0, [r6, r0]
	bl sub_0200B0A8
	ldr r7, _021E84C8 ; =0x00000D24
	mov r4, #0
	add r5, r6, #0
_021E8496:
	ldr r0, [r5, r7]
	bl Destroy2DGfxResObjMan
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _021E8496
	ldr r0, _021E84CC ; =0x00000BF8
	ldr r0, [r6, r0]
	bl sub_02024504
	ldr r0, _021E84CC ; =0x00000BF8
	mov r1, #0
	str r1, [r6, r0]
	bl OamManager_Free
	bl sub_0202168C
	bl sub_02022608
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E84C0: .word 0x00000D34
_021E84C4: .word 0x00000D38
_021E84C8: .word 0x00000D24
_021E84CC: .word 0x00000BF8
	thumb_func_end ov73_021E847C

	thumb_func_start ov73_021E84D0
ov73_021E84D0: ; 0x021E84D0
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl ov73_021E8B64
	mov r0, #8
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x96
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4, #4]
	bl ov73_021E8628
	add r0, r4, #0
	bl ov73_021E8730
	add r0, r4, #0
	bl ov73_021E8A08
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	mov r0, #2
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineBToggleLayers
	mov r0, #2
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_02039418
	add r0, r4, #0
	bl ov73_021EA12C
	ldr r0, [r4]
	mov r1, #0
	ldr r0, [r0]
	bl sub_0202D488
	add r1, r4, #0
	add r1, #0x90
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x90
	ldr r1, [r0]
	add r0, r4, #0
	add r0, #0x94
	str r1, [r0]
	add r0, r4, #0
	mov r1, #1
	add r0, #0x9c
	str r1, [r0]
	ldr r0, _021E85A0 ; =0x00000F0C
	mov r1, #0
	str r1, [r4, r0]
	bl ov00_021EC5B4
	cmp r0, #0
	bne _021E8594
	ldr r0, [r4]
	ldr r0, [r0, #0x24]
	cmp r0, #0
	beq _021E858E
	ldr r0, _021E85A4 ; =0x00000F0F
	ldr r1, _021E85A8 ; =0x00000BD8
	str r0, [sp]
	mov r2, #1
	ldr r1, [r4, r1]
	add r0, r4, #0
	add r3, r2, #0
	bl ov73_021E9FF8
	add r0, r4, #0
	mov r1, #0x2f
	mov r2, #2
	bl ov73_021E83EC
	add r0, r4, #0
	bl ov73_021EA15C
	b _021E8598
_021E858E:
	mov r0, #0
	str r0, [r4, #0x1c]
	b _021E8598
_021E8594:
	mov r0, #0x33
	str r0, [r4, #0x1c]
_021E8598:
	mov r0, #2
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_021E85A0: .word 0x00000F0C
_021E85A4: .word 0x00000F0F
_021E85A8: .word 0x00000BD8
	thumb_func_end ov73_021E84D0

	thumb_func_start ov73_021E85AC
ov73_021E85AC: ; 0x021E85AC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov73_021E8440
	bl sub_0203A930
	ldr r4, [r5, #0x1c]
	ldr r1, _021E85D8 ; =ov73_021EA848
	lsl r2, r4, #2
	ldr r1, [r1, r2]
	add r0, r5, #0
	blx r1
	ldr r1, [r5, #0x1c]
	cmp r4, r1
	beq _021E85D6
	mov r1, #0xf9
	mov r2, #0
	lsl r1, r1, #4
	strh r2, [r5, r1]
	add r1, r1, #2
	strh r2, [r5, r1]
_021E85D6:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E85D8: .word ov73_021EA848
	thumb_func_end ov73_021E85AC

	thumb_func_start ov73_021E85DC
ov73_021E85DC: ; 0x021E85DC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E8620 ; =0x00000F98
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E85F6
	bl DestroySysTask
	ldr r0, _021E8620 ; =0x00000F98
	mov r1, #0
	str r1, [r4, r0]
	add r0, r0, #4
	str r1, [r4, r0]
_021E85F6:
	add r0, r4, #0
	bl ov73_021E8BBC
	add r0, r4, #0
	bl ov73_021E8B20
	ldr r0, [r4, #4]
	bl ov73_021E870C
	ldr r0, _021E8624 ; =0x00000F9C
	mov r1, #0
	str r1, [r4, r0]
	ldr r0, [r4, #0x14]
	str r0, [r4, #0x10]
	cmp r0, #0
	bne _021E861A
	mov r0, #5
	pop {r4, pc}
_021E861A:
	mov r0, #1
	pop {r4, pc}
	nop
_021E8620: .word 0x00000F98
_021E8624: .word 0x00000F9C
	thumb_func_end ov73_021E85DC

	thumb_func_start ov73_021E8628
ov73_021E8628: ; 0x021E8628
	push {r3, r4, r5, lr}
	sub sp, #0x70
	ldr r5, _021E86FC ; =ov73_021EA70C
	add r4, r0, #0
	ldmia r5!, {r0, r1}
	add r3, sp, #0x54
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
	mov r0, #1
	mov r1, #0
	bl GX_EngineAToggleLayers
	add r0, r4, #0
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E8700 ; =ov73_021EA6F0
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
	mov r0, #2
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r5, _021E8704 ; =ov73_021EA728
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
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #1
	mov r1, #0
	bl GX_EngineBToggleLayers
	add r0, r4, #0
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E8708 ; =ov73_021EA6D4
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
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #2
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	mov r3, #0x96
	bl BG_ClearCharDataRange
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x96
	bl BG_ClearCharDataRange
	add sp, #0x70
	pop {r3, r4, r5, pc}
	nop
_021E86FC: .word ov73_021EA70C
_021E8700: .word ov73_021EA6F0
_021E8704: .word ov73_021EA728
_021E8708: .word ov73_021EA6D4
	thumb_func_end ov73_021E8628

	thumb_func_start ov73_021E870C
ov73_021E870C: ; 0x021E870C
	push {r4, lr}
	add r4, r0, #0
	mov r1, #5
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
	pop {r4, pc}
	thumb_func_end ov73_021E870C

	thumb_func_start ov73_021E8730
ov73_021E8730: ; 0x021E8730
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	str r0, [sp, #0x10]
	ldr r4, [r0, #4]
	mov r0, #0x58
	mov r1, #0x96
	bl NARC_ctor
	mov r2, #0
	str r2, [sp]
	mov r1, #0x96
	str r1, [sp, #4]
	mov r1, #3
	add r3, r2, #0
	str r0, [sp, #0x2c]
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r3, #0
	str r3, [sp]
	mov r0, #0x96
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	mov r1, #3
	mov r2, #4
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r1, #0x1a
	mov r0, #0
	lsl r1, r1, #4
	mov r2, #0x96
	bl LoadFontPal1
	mov r1, #0x1a
	mov r0, #4
	lsl r1, r1, #4
	mov r2, #0x96
	bl LoadFontPal1
	ldr r0, [sp, #0x10]
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x96
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	mov r3, #0xe
	bl LoadUserFrameGfx2
	mov r1, #0
	str r1, [sp]
	mov r0, #0x96
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0x1f
	mov r3, #0xb
	bl LoadUserFrameGfx1
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x96
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x2c]
	mov r1, #2
	add r2, r4, #0
	mov r3, #1
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r1, #0
	mov r0, #6
	str r1, [sp]
	lsl r0, r0, #8
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r0, #0x96
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x2c]
	mov r1, #6
	add r2, r4, #0
	mov r3, #1
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x96
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x2c]
	mov r1, #0xb
	add r2, r4, #0
	mov r3, #5
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r1, #0
	mov r0, #6
	str r1, [sp]
	lsl r0, r0, #8
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r0, #0x96
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x2c]
	mov r1, #0xc
	add r2, r4, #0
	mov r3, #5
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	add r1, r0, #0
	bl BG_SetMaskColor
	mov r0, #4
	mov r1, #0
	bl BG_SetMaskColor
	mov r2, #0x33
	ldr r1, _021E894C ; =0x00000F98
	ldr r0, [sp, #0x10]
	lsl r2, r2, #4
	add r0, r0, r1
	mov r1, #0
	bl MI_CpuFill8
	ldr r0, [sp, #0x2c]
	mov r1, #5
	add r2, sp, #0x38
	mov r3, #0x96
	bl GfGfxLoader_GetPlttDataFromOpenNarc
	add r4, r0, #0
	ldr r0, [sp, #0x38]
	mov r2, #0xfa
	ldr r1, [sp, #0x10]
	lsl r2, r2, #4
	add r1, r1, r2
	ldr r0, [r0, #0xc]
	mov r2, #0x80
	bl MIi_CpuCopy16
	ldr r0, [sp, #0x38]
	ldr r2, _021E8950 ; =0x00001020
	ldr r1, [sp, #0x10]
	ldr r0, [r0, #0xc]
	add r1, r1, r2
	mov r2, #0x80
	bl MIi_CpuCopy16
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	ldr r1, _021E8950 ; =0x00001020
	ldr r0, [sp, #0x10]
	add r0, r0, r1
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x10]
	sub r1, #0x80
	add r0, r0, r1
	str r0, [sp, #0x14]
_021E8882:
	mov r0, #0
	str r0, [sp, #0x20]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x28]
	add r0, r0, #1
	lsl r1, r0, #5
	ldr r0, [sp, #0x10]
	add r0, r0, r1
	str r0, [sp, #0x30]
_021E8894:
	ldr r0, [sp, #0x24]
	cmp r0, #0x15
	blt _021E889E
	bl GF_AssertFail
_021E889E:
	ldr r0, [sp, #0x30]
	mov r7, #1
	add r4, r0, #2
	ldr r0, [sp, #0x18]
	add r6, r0, #2
	ldr r0, [sp, #0x14]
	add r5, r0, #2
	ldr r0, [sp, #0x20]
	asr r0, r0, #8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x34]
_021E88B6:
	mov r0, #0xfa
	lsl r0, r0, #4
	ldrh r0, [r4, r0]
	ldr r3, [sp, #0x34]
	add r1, r6, #0
	str r0, [sp]
	add r0, r5, #0
	mov r2, #1
	bl sub_02003DE8
	add r7, r7, #1
	add r4, r4, #2
	add r6, r6, #2
	add r5, r5, #2
	cmp r7, #0x10
	blt _021E88B6
	ldr r0, [sp, #0x18]
	add r0, #0x20
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x24]
	add r0, r0, #1
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x1c]
	cmp r0, #1
	beq _021E8902
	mov r0, #3
	ldr r1, [sp, #0x20]
	lsl r0, r0, #8
	add r1, r1, r0
	mov r0, #1
	lsl r0, r0, #0xc
	str r1, [sp, #0x20]
	cmp r1, r0
	blt _021E8894
	str r0, [sp, #0x20]
	mov r0, #1
	str r0, [sp, #0x1c]
	b _021E8894
_021E8902:
	ldr r0, [sp, #0x14]
	add r0, #0x20
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x28]
	add r0, r0, #1
	str r0, [sp, #0x28]
	cmp r0, #3
	blt _021E8882
	ldr r1, _021E8950 ; =0x00001020
	ldr r0, [sp, #0x10]
	add r0, r0, r1
	mov r1, #0x2a
	lsl r1, r1, #4
	bl DC_FlushRange
	ldr r1, _021E8954 ; =0x00000F9C
	ldr r0, [sp, #0x10]
	mov r2, #1
	str r2, [r0, r1]
	ldr r2, _021E8958 ; =0x000012C4
	mov r3, #0
	str r3, [r0, r2]
	sub r2, r1, #4
	ldr r1, [sp, #0x10]
	ldr r0, _021E895C ; =ov73_021E8960
	add r1, r1, r2
	mov r2, #0x14
	bl sub_0200E33C
	ldr r2, _021E894C ; =0x00000F98
	ldr r1, [sp, #0x10]
	str r0, [r1, r2]
	ldr r0, [sp, #0x2c]
	bl NARC_dtor
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E894C: .word 0x00000F98
_021E8950: .word 0x00001020
_021E8954: .word 0x00000F9C
_021E8958: .word 0x000012C4
_021E895C: .word ov73_021E8960
	thumb_func_end ov73_021E8730

	thumb_func_start ov73_021E8960
ov73_021E8960: ; 0x021E8960
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _021E89FE
	ldr r1, _021E8A00 ; =0x0000032B
	mov r0, #1
	ldrb r2, [r4, r1]
	eor r2, r0
	strb r2, [r4, r1]
	ldrb r2, [r4, r1]
	tst r0, r2
	bne _021E89FE
	add r0, r1, #1
	ldr r0, [r4, r0]
	cmp r0, #1
	bhi _021E8996
	sub r0, r1, #3
	ldrsh r0, [r4, r0]
	add r2, r4, #0
	add r2, #0x88
	lsl r0, r0, #5
	add r0, r2, r0
	mov r1, #0
	mov r2, #0x20
	bl GX_LoadBGPltt
_021E8996:
	mov r0, #0xcb
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E89A4
	cmp r0, #2
	bne _021E89BA
_021E89A4:
	mov r0, #0xca
	lsl r0, r0, #2
	ldrsh r0, [r4, r0]
	add r1, r4, #0
	add r1, #0x88
	lsl r0, r0, #5
	add r0, r1, r0
	mov r1, #0
	mov r2, #0x20
	bl GXS_LoadBGPltt
_021E89BA:
	ldr r0, _021E8A04 ; =0x0000032A
	ldrsb r1, [r4, r0]
	cmp r1, #0
	bne _021E89E2
	sub r1, r0, #2
	ldrsh r1, [r4, r1]
	add r2, r1, #1
	sub r1, r0, #2
	strh r2, [r4, r1]
	ldrsh r1, [r4, r1]
	cmp r1, #0x15
	blt _021E89FE
	mov r2, #0x13
	sub r1, r0, #2
	strh r2, [r4, r1]
	ldrsb r2, [r4, r0]
	mov r1, #1
	eor r1, r2
	strb r1, [r4, r0]
	pop {r4, pc}
_021E89E2:
	sub r1, r0, #2
	ldrsh r1, [r4, r1]
	sub r2, r1, #1
	sub r1, r0, #2
	strh r2, [r4, r1]
	ldrsh r1, [r4, r1]
	cmp r1, #0
	bge _021E89FE
	mov r2, #1
	sub r1, r0, #2
	strh r2, [r4, r1]
	ldrsb r1, [r4, r0]
	eor r1, r2
	strb r1, [r4, r0]
_021E89FE:
	pop {r4, pc}
	.balign 4, 0
_021E8A00: .word 0x0000032B
_021E8A04: .word 0x0000032A
	thumb_func_end ov73_021E8960

	thumb_func_start ov73_021E8A08
ov73_021E8A08: ; 0x021E8A08
	push {r3, r4, lr}
	sub sp, #0x14
	mov r3, #4
	add r4, r0, #0
	str r3, [sp]
	mov r0, #0x17
	str r0, [sp, #4]
	mov r0, #0x10
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0xa4
	ldr r1, _021E8B04 ; =0x00000E18
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	add r1, r4, r1
	mov r2, #0
	bl AddWindowParameterized
	ldr r0, _021E8B04 ; =0x00000E18
	mov r1, #0
	add r0, r4, r0
	bl FillWindowPixelBuffer
	mov r0, #0xe
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0x94
	ldr r1, _021E8B08 ; =0x00000DF8
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	add r1, r4, r1
	mov r2, #0
	mov r3, #0x1a
	bl AddWindowParameterized
	ldr r0, _021E8B08 ; =0x00000DF8
	mov r1, #0xf
	add r0, r4, r0
	bl FillWindowPixelBuffer
	mov r0, #0xe
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0x9c
	ldr r1, _021E8B0C ; =0x00000DE8
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	add r1, r4, r1
	mov r2, #0
	mov r3, #0x1a
	bl AddWindowParameterized
	ldr r0, _021E8B0C ; =0x00000DE8
	mov r1, #0xf
	add r0, r4, r0
	bl FillWindowPixelBuffer
	mov r0, #1
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0x85
	lsl r0, r0, #2
	ldr r1, _021E8B10 ; =0x00000E08
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	add r1, r4, r1
	mov r2, #0
	mov r3, #4
	bl AddWindowParameterized
	ldr r0, _021E8B10 ; =0x00000E08
	mov r1, #0
	add r0, r4, r0
	bl FillWindowPixelBuffer
	mov r3, #1
	ldr r0, _021E8B14 ; =0x000F0E00
	str r3, [sp]
	str r0, [sp, #4]
	ldr r1, _021E8B18 ; =0x00000BE4
	ldr r0, _021E8B10 ; =0x00000E08
	ldr r1, [r4, r1]
	add r0, r4, r0
	mov r2, #0
	bl ov73_021EA088
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0x28
	ldr r1, _021E8B1C ; =0x00000DD8
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	add r1, r4, r1
	mov r2, #0
	mov r3, #2
	bl AddWindowParameterized
	ldr r0, _021E8B1C ; =0x00000DD8
	mov r1, #0xf
	add r0, r4, r0
	bl FillWindowPixelBuffer
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
_021E8B04: .word 0x00000E18
_021E8B08: .word 0x00000DF8
_021E8B0C: .word 0x00000DE8
_021E8B10: .word 0x00000E08
_021E8B14: .word 0x000F0E00
_021E8B18: .word 0x00000BE4
_021E8B1C: .word 0x00000DD8
	thumb_func_end ov73_021E8A08

	thumb_func_start ov73_021E8B20
ov73_021E8B20: ; 0x021E8B20
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E8B50 ; =0x00000DD8
	add r0, r4, r0
	bl RemoveWindow
	ldr r0, _021E8B54 ; =0x00000E08
	add r0, r4, r0
	bl RemoveWindow
	ldr r0, _021E8B58 ; =0x00000DE8
	add r0, r4, r0
	bl RemoveWindow
	ldr r0, _021E8B5C ; =0x00000DF8
	add r0, r4, r0
	bl RemoveWindow
	ldr r0, _021E8B60 ; =0x00000E18
	add r0, r4, r0
	bl RemoveWindow
	pop {r4, pc}
	nop
_021E8B50: .word 0x00000DD8
_021E8B54: .word 0x00000E08
_021E8B58: .word 0x00000DE8
_021E8B5C: .word 0x00000DF8
_021E8B60: .word 0x00000E18
	thumb_func_end ov73_021E8B20

	thumb_func_start ov73_021E8B64
ov73_021E8B64: ; 0x021E8B64
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xb4
	mov r1, #0x96
	bl String_ctor
	mov r1, #0xbe
	lsl r1, r1, #4
	str r0, [r4, r1]
	mov r0, #4
	mov r1, #0x96
	bl String_ctor
	ldr r1, _021E8BB0 ; =0x00000BE8
	str r0, [r4, r1]
	mov r0, #3
	mov r1, #0x96
	bl String_ctor
	ldr r1, _021E8BB4 ; =0x00000BEC
	str r0, [r4, r1]
	sub r1, #0x18
	ldr r0, [r4, r1]
	mov r1, #0xa
	bl NewString_ReadMsgData
	ldr r1, _021E8BB8 ; =0x00000BE4
	str r0, [r4, r1]
	mov r0, #1
	lsl r0, r0, #8
	mov r1, #0x96
	bl String_ctor
	mov r1, #0xbf
	lsl r1, r1, #4
	str r0, [r4, r1]
	pop {r4, pc}
	nop
_021E8BB0: .word 0x00000BE8
_021E8BB4: .word 0x00000BEC
_021E8BB8: .word 0x00000BE4
	thumb_func_end ov73_021E8B64

	thumb_func_start ov73_021E8BBC
ov73_021E8BBC: ; 0x021E8BBC
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xbf
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl String_dtor
	ldr r0, _021E8BF0 ; =0x00000BE4
	ldr r0, [r4, r0]
	bl String_dtor
	ldr r0, _021E8BF4 ; =0x00000BEC
	ldr r0, [r4, r0]
	bl String_dtor
	ldr r0, _021E8BF8 ; =0x00000BE8
	ldr r0, [r4, r0]
	bl String_dtor
	mov r0, #0xbe
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl String_dtor
	pop {r4, pc}
	nop
_021E8BF0: .word 0x00000BE4
_021E8BF4: .word 0x00000BEC
_021E8BF8: .word 0x00000BE8
	thumb_func_end ov73_021E8BBC

	thumb_func_start ov73_021E8BFC
ov73_021E8BFC: ; 0x021E8BFC
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _021E8C24 ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	ldr r1, _021E8C28 ; =0x00000BDC
	mov r2, #0x11
	ldr r1, [r4, r1]
	mov r3, #1
	bl ov73_021E9FF8
	add r0, r4, #0
	mov r1, #0x30
	mov r2, #1
	bl ov73_021E83EC
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_021E8C24: .word 0x00000F0F
_021E8C28: .word 0x00000BDC
	thumb_func_end ov73_021E8BFC

	thumb_func_start ov73_021E8C2C
ov73_021E8C2C: ; 0x021E8C2C
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, _021E8C80 ; =0x000012C8
	ldr r0, [r4, r0]
	bl ov73_021E83D4
	cmp r0, #0
	beq _021E8C78
	cmp r0, #2
	bne _021E8C56
	bl sub_0203946C
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov73_021E844C
	mov r0, #0x2e
	str r0, [r4, #0x1c]
	b _021E8C78
_021E8C56:
	ldr r0, _021E8C84 ; =0x00000F0F
	ldr r1, _021E8C88 ; =0x00000BD8
	str r0, [sp]
	mov r2, #1
	ldr r1, [r4, r1]
	add r0, r4, #0
	add r3, r2, #0
	bl ov73_021E9FF8
	add r0, r4, #0
	mov r1, #0x2f
	mov r2, #2
	bl ov73_021E83EC
	add r0, r4, #0
	bl ov73_021EA15C
_021E8C78:
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_021E8C80: .word 0x000012C8
_021E8C84: .word 0x00000F0F
_021E8C88: .word 0x00000BD8
	thumb_func_end ov73_021E8C2C

	thumb_func_start ov73_021E8C8C
ov73_021E8C8C: ; 0x021E8C8C
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _021E8CB4 ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	ldr r1, _021E8CB8 ; =0x00000BD8
	mov r2, #0xc
	ldr r1, [r4, r1]
	mov r3, #1
	bl ov73_021E9FF8
	add r0, r4, #0
	mov r1, #0x30
	mov r2, #0x34
	bl ov73_021E83EC
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_021E8CB4: .word 0x00000F0F
_021E8CB8: .word 0x00000BD8
	thumb_func_end ov73_021E8C8C

	thumb_func_start ov73_021E8CBC
ov73_021E8CBC: ; 0x021E8CBC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E8D08 ; =0x000012C8
	ldr r0, [r4, r0]
	bl ov73_021E83D4
	cmp r0, #0
	beq _021E8D04
	cmp r0, #2
	bne _021E8CE4
	bl ov00_021EC5B4
	cmp r0, #0
	bne _021E8CDE
	mov r0, #0
	str r0, [r4, #0x1c]
	b _021E8D04
_021E8CDE:
	mov r0, #0x29
	str r0, [r4, #0x1c]
	b _021E8D04
_021E8CE4:
	bl ov00_021EC5B4
	cmp r0, #0
	bne _021E8CFA
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov73_021E844C
	mov r0, #0x2e
	b _021E8CFC
_021E8CFA:
	mov r0, #0x29
_021E8CFC:
	str r0, [r4, #0x1c]
	ldr r0, [r4]
	mov r1, #1
	str r1, [r0, #0x20]
_021E8D04:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_021E8D08: .word 0x000012C8
	thumb_func_end ov73_021E8CBC

	thumb_func_start ov73_021E8D0C
ov73_021E8D0C: ; 0x021E8D0C
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x2c
	mov r1, #2
	mov r2, #1
	mov r3, #0x14
	bl ov00_021EC3F0
	mov r0, #2
	bl ov00_021EC454
	bl ov00_021EC4A4
	mov r0, #3
	str r0, [r4, #0x1c]
	pop {r4, pc}
	thumb_func_end ov73_021E8D0C

	thumb_func_start ov73_021E8D2C
ov73_021E8D2C: ; 0x021E8D2C
	push {r3, r4, lr}
	sub sp, #0x44
	add r4, r0, #0
	bl ov00_021EC60C
	bl ov00_021EC5B4
	cmp r0, #0
	beq _021E8DAC
	bl ov00_021EC724
	cmp r0, #8
	bhi _021E8D8A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E8D52: ; jump table
	.short _021E8D8A - _021E8D52 - 2 ; case 0
	.short _021E8D8A - _021E8D52 - 2 ; case 1
	.short _021E8D8A - _021E8D52 - 2 ; case 2
	.short _021E8D8A - _021E8D52 - 2 ; case 3
	.short _021E8DA2 - _021E8D52 - 2 ; case 4
	.short _021E8D8A - _021E8D52 - 2 ; case 5
	.short _021E8D8A - _021E8D52 - 2 ; case 6
	.short _021E8D64 - _021E8D52 - 2 ; case 7
	.short _021E8D8A - _021E8D52 - 2 ; case 8
_021E8D64:
	add r0, sp, #4
	bl ov00_021EC0FC
	mov r1, #0xf1
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r2, [sp, #4]
	add r0, r1, #4
	str r2, [r4, r0]
	bl ov00_021EC210
	bl ov00_021EC8D8
	add r0, r4, #0
	bl ov73_021EA180
	mov r0, #0x37
	str r0, [r4, #0x1c]
	b _021E8DAC
_021E8D8A:
	add r0, sp, #0
	bl ov00_021EC0FC
	add r0, r4, #0
	bl ov73_021EA180
	mov r1, #0x35
	str r1, [r4, #0x1c]
	ldr r0, _021E8DB4 ; =0x00000F1C
	sub r1, #0x37
	str r1, [r4, r0]
	b _021E8DAC
_021E8DA2:
	add r0, sp, #8
	bl ov00_021EC9E0
	mov r0, #4
	str r0, [r4, #0x1c]
_021E8DAC:
	mov r0, #3
	add sp, #0x44
	pop {r3, r4, pc}
	nop
_021E8DB4: .word 0x00000F1C
	thumb_func_end ov73_021E8D2C

	thumb_func_start ov73_021E8DB8
ov73_021E8DB8: ; 0x021E8DB8
	push {r4, lr}
	add r4, r0, #0
	bl ov00_021ECD04
	mov r0, #5
	str r0, [r4, #0x1c]
	mov r0, #3
	pop {r4, pc}
	thumb_func_end ov73_021E8DB8

	thumb_func_start ov73_021E8DC8
ov73_021E8DC8: ; 0x021E8DC8
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	bl ov00_021ECDC8
	cmp r0, #5
	bhi _021E8E6E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E8DE2: ; jump table
	.short _021E8DF4 - _021E8DE2 - 2 ; case 0
	.short _021E8E6E - _021E8DE2 - 2 ; case 1
	.short _021E8E6E - _021E8DE2 - 2 ; case 2
	.short _021E8DEE - _021E8DE2 - 2 ; case 3
	.short _021E8DF4 - _021E8DE2 - 2 ; case 4
	.short _021E8DF4 - _021E8DE2 - 2 ; case 5
_021E8DEE:
	mov r0, #6
	str r0, [r4, #0x1c]
	b _021E8E6E
_021E8DF4:
	add r0, r4, #0
	bl ov73_021EA180
	add r0, sp, #4
	add r1, sp, #0
	bl ov00_021EC11C
	mov r1, #0xf1
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r2, [sp, #4]
	add r0, r1, #4
	str r2, [r4, r0]
	bl ov00_021EC210
	bl ov00_021EC8D8
	mov r0, #0x37
	str r0, [r4, #0x1c]
	ldr r1, [sp]
	cmp r1, #7
	bhi _021E8E5C
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E8E2C: ; jump table
	.short _021E8E5C - _021E8E2C - 2 ; case 0
	.short _021E8E3C - _021E8E2C - 2 ; case 1
	.short _021E8E3C - _021E8E2C - 2 ; case 2
	.short _021E8E4E - _021E8E2C - 2 ; case 3
	.short _021E8E40 - _021E8E2C - 2 ; case 4
	.short _021E8E58 - _021E8E2C - 2 ; case 5
	.short _021E8E4A - _021E8E2C - 2 ; case 6
	.short _021E8E58 - _021E8E2C - 2 ; case 7
_021E8E3C:
	str r0, [r4, #0x1c]
	b _021E8E5C
_021E8E40:
	bl ov00_021FA0D8
	mov r0, #0x37
	str r0, [r4, #0x1c]
	b _021E8E5C
_021E8E4A:
	str r0, [r4, #0x1c]
	b _021E8E5C
_021E8E4E:
	bl ov00_021ED9B4
	mov r0, #0x37
	str r0, [r4, #0x1c]
	b _021E8E5C
_021E8E58:
	bl sub_020399EC
_021E8E5C:
	ldr r1, [sp, #4]
	ldr r0, _021E8E74 ; =0xFFFFB1E0
	cmp r1, r0
	bge _021E8E6E
	ldr r0, _021E8E78 ; =0xFFFF8AD1
	cmp r1, r0
	blt _021E8E6E
	mov r0, #0x37
	str r0, [r4, #0x1c]
_021E8E6E:
	mov r0, #3
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_021E8E74: .word 0xFFFFB1E0
_021E8E78: .word 0xFFFF8AD1
	thumb_func_end ov73_021E8DC8

	thumb_func_start ov73_021E8E7C
ov73_021E8E7C: ; 0x021E8E7C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl Sav2_SysInfo_GetField4C
	cmp r0, #0
	bne _021E8E96
	ldr r1, [r5]
	ldr r0, [r1, #8]
	ldr r1, [r1, #0x1c]
	bl Sav2_SysInfo_SetField4C
_021E8E96:
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl Sav2_SysInfo_GetField4C
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0x14]
	bl DWC_CreateFriendKey
	add r3, r0, #0
	add r2, r1, #0
	add r0, r4, #0
	add r1, r3, #0
	bl ov72_022378C0
	mov r0, #7
	str r0, [r5, #0x1c]
	mov r0, #3
	pop {r3, r4, r5, pc}
	thumb_func_end ov73_021E8E7C

	thumb_func_start ov73_021E8EBC
ov73_021E8EBC: ; 0x021E8EBC
	push {r4, lr}
	add r4, r0, #0
	bl ov72_02237CB0
	mov r0, #8
	str r0, [r4, #0x1c]
	ldr r0, _021E8ED4 ; =0x00000F94
	mov r1, #0
	str r1, [r4, r0]
	mov r0, #3
	pop {r4, pc}
	nop
_021E8ED4: .word 0x00000F94
	thumb_func_end ov73_021E8EBC

	thumb_func_start ov73_021E8ED8
ov73_021E8ED8: ; 0x021E8ED8
	push {r4, lr}
	add r4, r0, #0
	bl ov72_02237B54
	cmp r0, #0
	beq _021E8F90
	bl ov72_02237B74
	ldr r1, _021E8FAC ; =0x00000F94
	mov r2, #0
	str r2, [r4, r1]
	add r2, r0, #7
	cmp r2, #9
	bhi _021E8F84
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_021E8F00: ; jump table
	.short _021E8F64 - _021E8F00 - 2 ; case 0
	.short _021E8F74 - _021E8F00 - 2 ; case 1
	.short _021E8F84 - _021E8F00 - 2 ; case 2
	.short _021E8F64 - _021E8F00 - 2 ; case 3
	.short _021E8F84 - _021E8F00 - 2 ; case 4
	.short _021E8F74 - _021E8F00 - 2 ; case 5
	.short _021E8F54 - _021E8F00 - 2 ; case 6
	.short _021E8F14 - _021E8F00 - 2 ; case 7
	.short _021E8F44 - _021E8F00 - 2 ; case 8
	.short _021E8F54 - _021E8F00 - 2 ; case 9
_021E8F14:
	add r0, r4, #0
	bl ov73_021EA180
	ldr r0, [r4]
	ldr r0, [r0, #0x18]
	cmp r0, #0
	beq _021E8F2C
	cmp r0, #1
	beq _021E8F38
	cmp r0, #2
	beq _021E8F3E
	b _021E8FA6
_021E8F2C:
	add r0, r4, #0
	mov r1, #0xb
	mov r2, #0xd
	bl ov73_021E83EC
	b _021E8FA6
_021E8F38:
	mov r0, #0x19
	str r0, [r4, #0x1c]
	b _021E8FA6
_021E8F3E:
	mov r0, #0x1d
	str r0, [r4, #0x1c]
	b _021E8FA6
_021E8F44:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov73_021EA180
	b _021E8FA6
_021E8F54:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov73_021EA180
	b _021E8FA6
_021E8F64:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov73_021EA180
	b _021E8FA6
_021E8F74:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov73_021EA180
	b _021E8FA6
_021E8F84:
	add r0, r4, #0
	bl ov73_021EA180
	bl sub_020399EC
	b _021E8FA6
_021E8F90:
	ldr r0, _021E8FAC ; =0x00000F94
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	mov r0, #0xe1
	lsl r0, r0, #4
	cmp r1, r0
	bne _021E8FA6
	bl sub_020399EC
_021E8FA6:
	mov r0, #3
	pop {r4, pc}
	nop
_021E8FAC: .word 0x00000F94
	thumb_func_end ov73_021E8ED8

	thumb_func_start ov73_021E8FB0
ov73_021E8FB0: ; 0x021E8FB0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r1, _021E8FDC ; =0x00000F24
	ldr r0, [r0, #0xc]
	add r1, r4, r1
	bl sub_0203189C
	ldr r1, _021E8FDC ; =0x00000F24
	add r0, r4, r1
	add r1, #0x64
	add r1, r4, r1
	bl ov72_02237CF4
	mov r0, #0xa
	str r0, [r4, #0x1c]
	ldr r0, _021E8FE0 ; =0x00000F94
	mov r1, #0
	str r1, [r4, r0]
	mov r0, #3
	pop {r4, pc}
	nop
_021E8FDC: .word 0x00000F24
_021E8FE0: .word 0x00000F94
	thumb_func_end ov73_021E8FB0

	thumb_func_start ov73_021E8FE4
ov73_021E8FE4: ; 0x021E8FE4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ov72_02237B54
	cmp r0, #0
	bne _021E8FF2
	b _021E90FA
_021E8FF2:
	bl ov72_02237B74
	add r5, r0, #0
	ldr r0, _021E9114 ; =0x00000F94
	mov r1, #0
	str r1, [r4, r0]
	add r1, r5, #7
	cmp r1, #9
	bhi _021E90EE
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E9010: ; jump table
	.short _021E90CE - _021E9010 - 2 ; case 0
	.short _021E90DE - _021E9010 - 2 ; case 1
	.short _021E90EE - _021E9010 - 2 ; case 2
	.short _021E90CE - _021E9010 - 2 ; case 3
	.short _021E90EE - _021E9010 - 2 ; case 4
	.short _021E90DE - _021E9010 - 2 ; case 5
	.short _021E90BE - _021E9010 - 2 ; case 6
	.short _021E9024 - _021E9010 - 2 ; case 7
	.short _021E90AE - _021E9010 - 2 ; case 8
	.short _021E90BE - _021E9010 - 2 ; case 9
_021E9024:
	add r0, r4, #0
	bl ov73_021EA180
	ldr r0, _021E9118 ; =0x00000F88
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _021E903C
	cmp r1, #1
	beq _021E9092
	cmp r1, #2
	beq _021E9092
	b _021E90A2
_021E903C:
	add r1, r0, #4
	ldr r1, [r4, r1]
	cmp r1, #3
	bhi _021E9110
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E9050: ; jump table
	.short _021E9058 - _021E9050 - 2 ; case 0
	.short _021E9082 - _021E9050 - 2 ; case 1
	.short _021E9082 - _021E9050 - 2 ; case 2
	.short _021E9082 - _021E9050 - 2 ; case 3
_021E9058:
	ldr r0, [r4]
	ldr r0, [r0, #0x18]
	cmp r0, #0
	beq _021E906A
	cmp r0, #1
	beq _021E9076
	cmp r0, #2
	beq _021E907C
	b _021E9110
_021E906A:
	add r0, r4, #0
	mov r1, #0xb
	mov r2, #0xd
	bl ov73_021E83EC
	b _021E9110
_021E9076:
	mov r0, #0x19
	str r0, [r4, #0x1c]
	b _021E9110
_021E907C:
	mov r0, #0x1d
	str r0, [r4, #0x1c]
	b _021E9110
_021E9082:
	sub r0, #0x6c
	str r5, [r4, r0]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov73_021EA180
	b _021E9110
_021E9092:
	ldr r0, _021E911C ; =0x00000F1C
	str r5, [r4, r0]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov73_021EA180
	b _021E9110
_021E90A2:
	add r0, r4, #0
	bl ov73_021EA180
	bl sub_020399EC
	b _021E9110
_021E90AE:
	sub r0, #0x78
	str r5, [r4, r0]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov73_021EA180
	b _021E9110
_021E90BE:
	sub r0, #0x78
	str r5, [r4, r0]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov73_021EA180
	b _021E9110
_021E90CE:
	sub r0, #0x78
	str r5, [r4, r0]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov73_021EA180
	b _021E9110
_021E90DE:
	sub r0, #0x78
	str r5, [r4, r0]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov73_021EA180
	b _021E9110
_021E90EE:
	add r0, r4, #0
	bl ov73_021EA180
	bl sub_020399EC
	b _021E9110
_021E90FA:
	ldr r0, _021E9114 ; =0x00000F94
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	mov r0, #0xe1
	lsl r0, r0, #4
	cmp r1, r0
	bne _021E9110
	bl sub_020399EC
_021E9110:
	mov r0, #3
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E9114: .word 0x00000F94
_021E9118: .word 0x00000F88
_021E911C: .word 0x00000F1C
	thumb_func_end ov73_021E8FE4

	thumb_func_start ov73_021E9120
ov73_021E9120: ; 0x021E9120
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x94
	ldr r0, [r0]
	bl ov72_02237B80
	mov r0, #0xc
	str r0, [r4, #0x1c]
	ldr r0, _021E9140 ; =0x00000F94
	mov r1, #0
	str r1, [r4, r0]
	add r0, r4, #0
	bl ov73_021EA15C
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_021E9140: .word 0x00000F94
	thumb_func_end ov73_021E9120

	thumb_func_start ov73_021E9144
ov73_021E9144: ; 0x021E9144
	push {r4, lr}
	add r4, r0, #0
	bl ov72_02237B54
	cmp r0, #0
	beq _021E91D6
	bl ov72_02237B74
	ldr r1, _021E91F0 ; =0x00000F94
	mov r2, #0
	str r2, [r4, r1]
	add r2, r0, #7
	cmp r2, #6
	bhi _021E91C0
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_021E916C: ; jump table
	.short _021E91A2 - _021E916C - 2 ; case 0
	.short _021E9198 - _021E916C - 2 ; case 1
	.short _021E91AC - _021E916C - 2 ; case 2
	.short _021E91A2 - _021E916C - 2 ; case 3
	.short _021E918E - _021E916C - 2 ; case 4
	.short _021E9184 - _021E916C - 2 ; case 5
	.short _021E917A - _021E916C - 2 ; case 6
_021E917A:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	b _021E91CE
_021E9184:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	b _021E91CE
_021E918E:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	b _021E91CE
_021E9198:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	b _021E91CE
_021E91A2:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	b _021E91CE
_021E91AC:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov73_021EA180
	bl sub_020399EC
	b _021E91CE
_021E91C0:
	cmp r0, #0
	ble _021E91CE
	add r1, r4, #0
	add r1, #0x98
	str r0, [r1]
	ldr r0, [r4, #0x20]
	str r0, [r4, #0x1c]
_021E91CE:
	add r0, r4, #0
	bl ov73_021EA180
	b _021E91EC
_021E91D6:
	ldr r0, _021E91F0 ; =0x00000F94
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	mov r0, #0xe1
	lsl r0, r0, #4
	cmp r1, r0
	bne _021E91EC
	bl sub_020399EC
_021E91EC:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_021E91F0: .word 0x00000F94
	thumb_func_end ov73_021E9144

	thumb_func_start ov73_021E91F4
ov73_021E91F4: ; 0x021E91F4
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _021E921C ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	ldr r1, _021E9220 ; =0x00000BD4
	mov r2, #0
	ldr r1, [r4, r1]
	mov r3, #1
	bl ov73_021E9FF8
	add r0, r4, #0
	mov r1, #0x2f
	mov r2, #0xe
	bl ov73_021E83EC
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_021E921C: .word 0x00000F0F
_021E9220: .word 0x00000BD4
	thumb_func_end ov73_021E91F4

	thumb_func_start ov73_021E9224
ov73_021E9224: ; 0x021E9224
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E9264 ; =0x00000DF8
	mov r1, #0
	add r0, r4, r0
	mov r2, #0x1f
	mov r3, #0xe
	bl DrawFrameAndWindow1
	ldr r1, _021E9268 ; =0x00000BE8
	add r2, r4, #0
	ldr r0, _021E9264 ; =0x00000DF8
	add r2, #0x9c
	ldr r1, [r4, r1]
	ldr r2, [r2]
	add r0, r4, r0
	mov r3, #3
	bl ov73_021EA0F0
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	bl ov73_021EA134
	ldr r0, _021E9264 ; =0x00000DF8
	add r0, r4, r0
	bl CopyWindowToVram
	mov r0, #0xf
	str r0, [r4, #0x1c]
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_021E9264: .word 0x00000DF8
_021E9268: .word 0x00000BE8
	thumb_func_end ov73_021E9224

	thumb_func_start ov73_021E926C
ov73_021E926C: ; 0x021E926C
	push {r3, r4, lr}
	sub sp, #0x1c
	ldr r2, _021E9368 ; =gSystem
	mov r1, #0x40
	ldr r3, [r2, #0x4c]
	add r4, r0, #0
	tst r1, r3
	beq _021E92BA
	add r0, #0x9c
	ldr r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x9c
	str r1, [r0]
	add r0, r4, #0
	add r0, #0x9c
	ldr r1, [r0]
	add r0, r4, #0
	add r0, #0x98
	ldr r0, [r0]
	cmp r1, r0
	ble _021E92A0
	add r0, r4, #0
	mov r1, #1
	add r0, #0x9c
	str r1, [r0]
_021E92A0:
	ldr r0, _021E936C ; =0x00000DF8
	ldr r1, _021E9370 ; =0x00000BE8
	add r0, r4, r0
	ldr r1, [r4, r1]
	add r4, #0x9c
	ldr r2, [r4]
	mov r3, #3
	bl ov73_021EA0F0
	ldr r0, _021E9374 ; =0x000005DC
	bl PlaySE
	b _021E9360
_021E92BA:
	mov r1, #0x80
	tst r1, r3
	beq _021E92FC
	add r0, #0x9c
	ldr r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x9c
	str r1, [r0]
	add r0, r4, #0
	add r0, #0x9c
	ldr r0, [r0]
	cmp r0, #1
	bge _021E92E2
	add r0, r4, #0
	add r0, #0x98
	ldr r1, [r0]
	add r0, r4, #0
	add r0, #0x9c
	str r1, [r0]
_021E92E2:
	ldr r0, _021E936C ; =0x00000DF8
	ldr r1, _021E9370 ; =0x00000BE8
	add r0, r4, r0
	ldr r1, [r4, r1]
	add r4, #0x9c
	ldr r2, [r4]
	mov r3, #3
	bl ov73_021EA0F0
	ldr r0, _021E9374 ; =0x000005DC
	bl PlaySE
	b _021E9360
_021E92FC:
	ldr r2, [r2, #0x48]
	mov r1, #1
	tst r1, r2
	beq _021E9348
	add r0, sp, #0
	add r1, sp, #0x10
	bl ov00_021ECB94
	add r1, r4, #0
	add r2, r4, #0
	add r1, #0x94
	add r2, #0x9c
	ldr r0, [r4]
	ldr r1, [r1]
	ldr r2, [r2]
	lsl r1, r1, #0x18
	lsl r2, r2, #0x18
	ldr r0, [r0, #4]
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	add r3, sp, #0
	bl sub_0202D720
	cmp r0, #0
	beq _021E9332
	mov r0, #0x14
	b _021E9334
_021E9332:
	mov r0, #0x10
_021E9334:
	mov r1, #0
	str r0, [r4, #0x1c]
	add r0, r4, #0
	add r2, r1, #0
	bl ov73_021EA134
	ldr r0, _021E9374 ; =0x000005DC
	bl PlaySE
	b _021E9360
_021E9348:
	mov r1, #2
	tst r1, r2
	beq _021E9360
	mov r1, #0
	add r2, r1, #0
	bl ov73_021EA134
	mov r0, #0x15
	str r0, [r4, #0x1c]
	ldr r0, _021E9374 ; =0x000005DC
	bl PlaySE
_021E9360:
	mov r0, #3
	add sp, #0x1c
	pop {r3, r4, pc}
	nop
_021E9368: .word gSystem
_021E936C: .word 0x00000DF8
_021E9370: .word 0x00000BE8
_021E9374: .word 0x000005DC
	thumb_func_end ov73_021E926C

	thumb_func_start ov73_021E9378
ov73_021E9378: ; 0x021E9378
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0xbd
	add r2, r4, #0
	lsl r0, r0, #4
	add r2, #0x9c
	ldr r0, [r4, r0]
	ldr r2, [r2]
	mov r1, #0
	mov r3, #3
	bl BufferIntegerAsString
	mov r3, #2
	mov r0, #0xbd
	add r2, r4, #0
	str r3, [sp]
	mov r1, #1
	str r1, [sp, #4]
	lsl r0, r0, #4
	add r2, #0x94
	ldr r0, [r4, r0]
	ldr r2, [r2]
	bl BufferIntegerAsString
	ldr r0, _021E93E0 ; =0x00000F0F
	mov r2, #1
	str r0, [sp]
	ldr r1, _021E93E4 ; =0x00000BD4
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r3, r2, #0
	bl ov73_021E9F34
	add r0, r4, #0
	mov r1, #0x2f
	mov r2, #0x11
	bl ov73_021E83EC
	add r4, #0xa0
	ldr r2, _021E93E8 ; =0x00000A38
	mov r0, #0
	add r1, r4, #0
	bl MIi_CpuClearFast
	mov r0, #3
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_021E93E0: .word 0x00000F0F
_021E93E4: .word 0x00000BD4
_021E93E8: .word 0x00000A38
	thumb_func_end ov73_021E9378

	thumb_func_start ov73_021E93EC
ov73_021E93EC: ; 0x021E93EC
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _021E9414 ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	ldr r1, _021E9418 ; =0x00000BD4
	mov r2, #2
	ldr r1, [r4, r1]
	mov r3, #1
	bl ov73_021E9F34
	add r0, r4, #0
	mov r1, #0x2f
	mov r2, #0xd
	bl ov73_021E83EC
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_021E9414: .word 0x00000F0F
_021E9418: .word 0x00000BD4
	thumb_func_end ov73_021E93EC

	thumb_func_start ov73_021E941C
ov73_021E941C: ; 0x021E941C
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r0, #0x90
	add r1, #0x9c
	add r2, r4, #0
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, #0xa0
	bl ov72_02237BD0
	add r0, r4, #0
	bl ov73_021EA15C
	mov r0, #0x12
	str r0, [r4, #0x1c]
	ldr r0, _021E9448 ; =0x00000F94
	mov r1, #0
	str r1, [r4, r0]
	mov r0, #3
	pop {r4, pc}
	nop
_021E9448: .word 0x00000F94
	thumb_func_end ov73_021E941C

	thumb_func_start ov73_021E944C
ov73_021E944C: ; 0x021E944C
	push {r3, r4, lr}
	sub sp, #0x1c
	add r4, r0, #0
	bl ov72_02237B54
	cmp r0, #0
	beq _021E953A
	bl ov72_02237B74
	ldr r1, _021E9558 ; =0x00000F94
	mov r2, #0
	str r2, [r4, r1]
	add r2, r0, #7
	cmp r2, #7
	bhi _021E9550
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_021E9476: ; jump table
	.short _021E9516 - _021E9476 - 2 ; case 0
	.short _021E9506 - _021E9476 - 2 ; case 1
	.short _021E9526 - _021E9476 - 2 ; case 2
	.short _021E94F6 - _021E9476 - 2 ; case 3
	.short _021E94F6 - _021E9476 - 2 ; case 4
	.short _021E94E6 - _021E9476 - 2 ; case 5
	.short _021E94D6 - _021E9476 - 2 ; case 6
	.short _021E9486 - _021E9476 - 2 ; case 7
_021E9486:
	add r2, r4, #0
	add r3, r4, #0
	add r2, #0x90
	add r3, #0x9c
	ldr r0, [r4]
	ldr r2, [r2]
	ldr r3, [r3]
	add r1, r4, #0
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	ldr r0, [r0, #4]
	add r1, #0xa0
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl sub_0202D7C0
	add r0, r4, #0
	mov r1, #0x27
	mov r2, #0x13
	bl ov73_021E83EC
	add r0, sp, #0
	add r1, sp, #0x10
	bl ov00_021ECB94
	add r1, r4, #0
	ldr r0, [r4]
	add r1, #0x94
	add r4, #0x9c
	ldr r1, [r1]
	ldr r2, [r4]
	lsl r1, r1, #0x18
	lsl r2, r2, #0x18
	ldr r0, [r0, #4]
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	add r3, sp, #0
	bl sub_0202D678
	b _021E9550
_021E94D6:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov73_021EA180
	b _021E9550
_021E94E6:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov73_021EA180
	b _021E9550
_021E94F6:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0xb
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov73_021EA180
	b _021E9550
_021E9506:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov73_021EA180
	b _021E9550
_021E9516:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov73_021EA180
	b _021E9550
_021E9526:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov73_021EA180
	bl sub_020399EC
	b _021E9550
_021E953A:
	ldr r0, _021E9558 ; =0x00000F94
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	mov r0, #0xe1
	lsl r0, r0, #4
	cmp r1, r0
	bne _021E9550
	bl sub_020399EC
_021E9550:
	mov r0, #3
	add sp, #0x1c
	pop {r3, r4, pc}
	nop
_021E9558: .word 0x00000F94
	thumb_func_end ov73_021E944C

	thumb_func_start ov73_021E955C
ov73_021E955C: ; 0x021E955C
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _021E9590 ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	ldr r1, _021E9594 ; =0x00000BD4
	mov r2, #3
	ldr r1, [r4, r1]
	mov r3, #1
	bl ov73_021E9FF8
	add r0, r4, #0
	mov r1, #0x2f
	mov r2, #0x2d
	bl ov73_021E83EC
	add r0, r4, #0
	bl ov73_021EA180
	ldr r0, [r4]
	mov r1, #0
	str r1, [r0, #0x20]
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_021E9590: .word 0x00000F0F
_021E9594: .word 0x00000BD4
	thumb_func_end ov73_021E955C

	thumb_func_start ov73_021E9598
ov73_021E9598: ; 0x021E9598
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _021E95C4 ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	ldr r1, _021E95C8 ; =0x00000BD4
	mov r2, #7
	ldr r1, [r4, r1]
	mov r3, #1
	bl ov73_021E9FF8
	add r0, r4, #0
	mov r1, #0x2f
	mov r2, #0x1a
	bl ov73_021E83EC
	add r0, r4, #0
	bl ov73_021EA15C
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_021E95C4: .word 0x00000F0F
_021E95C8: .word 0x00000BD4
	thumb_func_end ov73_021E9598

	thumb_func_start ov73_021E95CC
ov73_021E95CC: ; 0x021E95CC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_0202D568
	add r4, r0, #0
	ldr r0, [r5]
	add r1, sp, #0
	ldr r0, [r0, #4]
	bl sub_0202D7F0
	ldr r0, [r5]
	ldr r2, _021E9610 ; =0x00000AD8
	ldr r0, [r0, #0xc]
	mov r1, #1
	add r2, r5, r2
	bl sub_02069528
	add r1, sp, #0
	ldrb r0, [r1]
	ldr r3, _021E9610 ; =0x00000AD8
	ldrb r1, [r1, #1]
	add r2, r4, #0
	add r3, r5, r3
	bl ov72_02237C30
	mov r0, #0x1b
	str r0, [r5, #0x1c]
	ldr r0, _021E9614 ; =0x00000F94
	mov r1, #0
	str r1, [r5, r0]
	mov r0, #3
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E9610: .word 0x00000AD8
_021E9614: .word 0x00000F94
	thumb_func_end ov73_021E95CC

	thumb_func_start ov73_021E9618
ov73_021E9618: ; 0x021E9618
	push {r4, lr}
	add r4, r0, #0
	bl ov72_02237B54
	cmp r0, #0
	beq _021E96CC
	bl ov72_02237B74
	ldr r1, _021E96E8 ; =0x00000F94
	mov r2, #0
	str r2, [r4, r1]
	add r2, r0, #7
	cmp r2, #7
	bhi _021E96E2
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_021E9640: ; jump table
	.short _021E96A8 - _021E9640 - 2 ; case 0
	.short _021E9698 - _021E9640 - 2 ; case 1
	.short _021E96B8 - _021E9640 - 2 ; case 2
	.short _021E96A8 - _021E9640 - 2 ; case 3
	.short _021E9688 - _021E9640 - 2 ; case 4
	.short _021E9678 - _021E9640 - 2 ; case 5
	.short _021E9668 - _021E9640 - 2 ; case 6
	.short _021E9650 - _021E9640 - 2 ; case 7
_021E9650:
	ldr r0, [r4]
	mov r1, #5
	ldr r0, [r0]
	mov r2, #2
	bl sub_0202D5DC
	add r0, r4, #0
	mov r1, #0x27
	mov r2, #0x1c
	bl ov73_021E83EC
	b _021E96E2
_021E9668:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov73_021EA180
	b _021E96E2
_021E9678:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov73_021EA180
	b _021E96E2
_021E9688:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov73_021EA180
	b _021E96E2
_021E9698:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov73_021EA180
	b _021E96E2
_021E96A8:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov73_021EA180
	b _021E96E2
_021E96B8:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov73_021EA180
	bl sub_020399EC
	b _021E96E2
_021E96CC:
	ldr r0, _021E96E8 ; =0x00000F94
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	mov r0, #0xe1
	lsl r0, r0, #4
	cmp r1, r0
	bne _021E96E2
	bl sub_020399EC
_021E96E2:
	mov r0, #3
	pop {r4, pc}
	nop
_021E96E8: .word 0x00000F94
	thumb_func_end ov73_021E9618

	thumb_func_start ov73_021E96EC
ov73_021E96EC: ; 0x021E96EC
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _021E9720 ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	ldr r1, _021E9724 ; =0x00000BD4
	mov r2, #8
	ldr r1, [r4, r1]
	mov r3, #1
	bl ov73_021E9FF8
	add r0, r4, #0
	mov r1, #0x2f
	mov r2, #0x2d
	bl ov73_021E83EC
	add r0, r4, #0
	bl ov73_021EA180
	ldr r0, [r4]
	mov r1, #0
	str r1, [r0, #0x20]
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_021E9720: .word 0x00000F0F
_021E9724: .word 0x00000BD4
	thumb_func_end ov73_021E96EC

	thumb_func_start ov73_021E9728
ov73_021E9728: ; 0x021E9728
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _021E9750 ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	ldr r1, _021E9754 ; =0x00000BD4
	mov r2, #5
	ldr r1, [r4, r1]
	mov r3, #1
	bl ov73_021E9FF8
	add r0, r4, #0
	mov r1, #0x2f
	mov r2, #0x1e
	bl ov73_021E83EC
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_021E9750: .word 0x00000F0F
_021E9754: .word 0x00000BD4
	thumb_func_end ov73_021E9728

	thumb_func_start ov73_021E9758
ov73_021E9758: ; 0x021E9758
	push {r4, lr}
	add r4, r0, #0
	mov r1, #1
	add r0, #0x94
	str r1, [r0]
	ldr r0, _021E97A0 ; =0x00000DE8
	mov r1, #0
	add r0, r4, r0
	mov r2, #0x1f
	mov r3, #0xe
	bl DrawFrameAndWindow1
	ldr r1, _021E97A4 ; =0x00000BEC
	add r2, r4, #0
	ldr r0, _021E97A0 ; =0x00000DE8
	add r2, #0x94
	ldr r1, [r4, r1]
	ldr r2, [r2]
	add r0, r4, r0
	mov r3, #2
	bl ov73_021EA0F0
	mov r1, #1
	add r0, r4, #0
	add r2, r1, #0
	bl ov73_021EA134
	ldr r0, _021E97A0 ; =0x00000DE8
	add r0, r4, r0
	bl CopyWindowToVram
	mov r0, #0x1f
	str r0, [r4, #0x1c]
	mov r0, #3
	pop {r4, pc}
	nop
_021E97A0: .word 0x00000DE8
_021E97A4: .word 0x00000BEC
	thumb_func_end ov73_021E9758

	thumb_func_start ov73_021E97A8
ov73_021E97A8: ; 0x021E97A8
	push {r4, lr}
	ldr r2, _021E986C ; =gSystem
	mov r1, #0x40
	ldr r3, [r2, #0x4c]
	add r4, r0, #0
	tst r1, r3
	beq _021E97EE
	add r0, #0x94
	ldr r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x94
	str r1, [r0]
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	cmp r0, #0xa
	ble _021E97D4
	add r0, r4, #0
	mov r1, #1
	add r0, #0x94
	str r1, [r0]
_021E97D4:
	ldr r0, _021E9870 ; =0x00000DE8
	ldr r1, _021E9874 ; =0x00000BEC
	add r0, r4, r0
	ldr r1, [r4, r1]
	add r4, #0x94
	ldr r2, [r4]
	mov r3, #2
	bl ov73_021EA0F0
	ldr r0, _021E9878 ; =0x000005DC
	bl PlaySE
	b _021E9866
_021E97EE:
	mov r1, #0x80
	tst r1, r3
	beq _021E982C
	add r0, #0x94
	ldr r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x94
	str r1, [r0]
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	cmp r0, #1
	bge _021E9812
	add r0, r4, #0
	mov r1, #0xa
	add r0, #0x94
	str r1, [r0]
_021E9812:
	ldr r0, _021E9870 ; =0x00000DE8
	ldr r1, _021E9874 ; =0x00000BEC
	add r0, r4, r0
	ldr r1, [r4, r1]
	add r4, #0x94
	ldr r2, [r4]
	mov r3, #2
	bl ov73_021EA0F0
	ldr r0, _021E9878 ; =0x000005DC
	bl PlaySE
	b _021E9866
_021E982C:
	ldr r2, [r2, #0x48]
	mov r1, #1
	tst r1, r2
	beq _021E984E
	mov r1, #0
	add r2, r1, #0
	bl ov73_021EA134
	add r0, r4, #0
	mov r1, #0xb
	mov r2, #0x20
	bl ov73_021E83EC
	ldr r0, _021E9878 ; =0x000005DC
	bl PlaySE
	b _021E9866
_021E984E:
	mov r1, #2
	tst r1, r2
	beq _021E9866
	mov r1, #0
	add r2, r1, #0
	bl ov73_021EA134
	mov r0, #0x17
	str r0, [r4, #0x1c]
	ldr r0, _021E9878 ; =0x000005DC
	bl PlaySE
_021E9866:
	mov r0, #3
	pop {r4, pc}
	nop
_021E986C: .word gSystem
_021E9870: .word 0x00000DE8
_021E9874: .word 0x00000BEC
_021E9878: .word 0x000005DC
	thumb_func_end ov73_021E97A8

	thumb_func_start ov73_021E987C
ov73_021E987C: ; 0x021E987C
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _021E98A4 ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	ldr r1, _021E98A8 ; =0x00000BD4
	mov r2, #6
	ldr r1, [r4, r1]
	mov r3, #1
	bl ov73_021E9FF8
	add r0, r4, #0
	mov r1, #0x2f
	mov r2, #0x21
	bl ov73_021E83EC
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_021E98A4: .word 0x00000F0F
_021E98A8: .word 0x00000BD4
	thumb_func_end ov73_021E987C

	thumb_func_start ov73_021E98AC
ov73_021E98AC: ; 0x021E98AC
	push {r4, lr}
	add r4, r0, #0
	mov r1, #1
	add r0, #0x9c
	str r1, [r0]
	ldr r0, _021E98F4 ; =0x00000DF8
	mov r1, #0
	add r0, r4, r0
	mov r2, #0x1f
	mov r3, #0xe
	bl DrawFrameAndWindow1
	ldr r1, _021E98F8 ; =0x00000BE8
	add r2, r4, #0
	ldr r0, _021E98F4 ; =0x00000DF8
	add r2, #0x9c
	ldr r1, [r4, r1]
	ldr r2, [r2]
	add r0, r4, r0
	mov r3, #3
	bl ov73_021EA0F0
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	bl ov73_021EA134
	ldr r0, _021E98F4 ; =0x00000DF8
	add r0, r4, r0
	bl CopyWindowToVram
	mov r0, #0x22
	str r0, [r4, #0x1c]
	mov r0, #3
	pop {r4, pc}
	nop
_021E98F4: .word 0x00000DF8
_021E98F8: .word 0x00000BE8
	thumb_func_end ov73_021E98AC

	thumb_func_start ov73_021E98FC
ov73_021E98FC: ; 0x021E98FC
	push {r4, lr}
	ldr r2, _021E99C4 ; =gSystem
	mov r1, #0x40
	ldr r3, [r2, #0x4c]
	add r4, r0, #0
	tst r1, r3
	beq _021E994A
	add r0, #0x9c
	ldr r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x9c
	str r1, [r0]
	add r0, r4, #0
	add r0, #0x9c
	ldr r1, [r0]
	add r0, r4, #0
	add r0, #0x98
	ldr r0, [r0]
	add r0, r0, #1
	cmp r1, r0
	bne _021E9930
	add r0, r4, #0
	mov r1, #1
	add r0, #0x9c
	str r1, [r0]
_021E9930:
	ldr r0, _021E99C8 ; =0x00000DF8
	ldr r1, _021E99CC ; =0x00000BE8
	add r0, r4, r0
	ldr r1, [r4, r1]
	add r4, #0x9c
	ldr r2, [r4]
	mov r3, #3
	bl ov73_021EA0F0
	ldr r0, _021E99D0 ; =0x000005DC
	bl PlaySE
	b _021E99C0
_021E994A:
	mov r1, #0x80
	tst r1, r3
	beq _021E998C
	add r0, #0x9c
	ldr r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x9c
	str r1, [r0]
	add r0, r4, #0
	add r0, #0x9c
	ldr r0, [r0]
	cmp r0, #1
	bge _021E9972
	add r0, r4, #0
	add r0, #0x98
	ldr r1, [r0]
	add r0, r4, #0
	add r0, #0x9c
	str r1, [r0]
_021E9972:
	ldr r0, _021E99C8 ; =0x00000DF8
	ldr r1, _021E99CC ; =0x00000BE8
	add r0, r4, r0
	ldr r1, [r4, r1]
	add r4, #0x9c
	ldr r2, [r4]
	mov r3, #3
	bl ov73_021EA0F0
	ldr r0, _021E99D0 ; =0x000005DC
	bl PlaySE
	b _021E99C0
_021E998C:
	ldr r2, [r2, #0x48]
	mov r1, #1
	tst r1, r2
	beq _021E99A8
	mov r1, #0
	add r2, r1, #0
	bl ov73_021EA134
	mov r0, #0x23
	str r0, [r4, #0x1c]
	ldr r0, _021E99D0 ; =0x000005DC
	bl PlaySE
	b _021E99C0
_021E99A8:
	mov r1, #2
	tst r1, r2
	beq _021E99C0
	mov r1, #0
	add r2, r1, #0
	bl ov73_021EA134
	mov r0, #0x1d
	str r0, [r4, #0x1c]
	ldr r0, _021E99D0 ; =0x000005DC
	bl PlaySE
_021E99C0:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_021E99C4: .word gSystem
_021E99C8: .word 0x00000DF8
_021E99CC: .word 0x00000BE8
_021E99D0: .word 0x000005DC
	thumb_func_end ov73_021E98FC

	thumb_func_start ov73_021E99D4
ov73_021E99D4: ; 0x021E99D4
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0xbd
	add r2, r4, #0
	lsl r0, r0, #4
	add r2, #0x9c
	ldr r0, [r4, r0]
	ldr r2, [r2]
	mov r1, #0
	mov r3, #3
	bl BufferIntegerAsString
	mov r3, #2
	mov r0, #0xbd
	add r2, r4, #0
	str r3, [sp]
	mov r1, #1
	str r1, [sp, #4]
	lsl r0, r0, #4
	add r2, #0x94
	ldr r0, [r4, r0]
	ldr r2, [r2]
	bl BufferIntegerAsString
	ldr r0, _021E9A34 ; =0x00000F0F
	mov r2, #1
	str r0, [sp]
	ldr r1, _021E9A38 ; =0x00000BD4
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r3, r2, #0
	bl ov73_021E9F34
	add r0, r4, #0
	mov r1, #0x2f
	mov r2, #0x24
	bl ov73_021E83EC
	mov r0, #0x24
	str r0, [r4, #0x1c]
	mov r0, #3
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_021E9A34: .word 0x00000F0F
_021E9A38: .word 0x00000BD4
	thumb_func_end ov73_021E99D4

	thumb_func_start ov73_021E9A3C
ov73_021E9A3C: ; 0x021E9A3C
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r0, #0x94
	add r1, #0x9c
	add r2, r4, #0
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, #0xa0
	bl ov72_02237BD0
	mov r0, #0x25
	str r0, [r4, #0x1c]
	ldr r0, _021E9A68 ; =0x00000F94
	mov r1, #0
	str r1, [r4, r0]
	add r0, r4, #0
	bl ov73_021EA15C
	mov r0, #3
	pop {r4, pc}
	nop
_021E9A68: .word 0x00000F94
	thumb_func_end ov73_021E9A3C

	thumb_func_start ov73_021E9A6C
ov73_021E9A6C: ; 0x021E9A6C
	push {r4, lr}
	add r4, r0, #0
	bl ov72_02237B54
	cmp r0, #0
	beq _021E9B34
	bl ov72_02237B74
	ldr r1, _021E9B50 ; =0x00000F94
	mov r2, #0
	str r2, [r4, r1]
	add r2, r0, #7
	cmp r2, #7
	bhi _021E9B4A
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_021E9A94: ; jump table
	.short _021E9B10 - _021E9A94 - 2 ; case 0
	.short _021E9B00 - _021E9A94 - 2 ; case 1
	.short _021E9B20 - _021E9A94 - 2 ; case 2
	.short _021E9B10 - _021E9A94 - 2 ; case 3
	.short _021E9AF0 - _021E9A94 - 2 ; case 4
	.short _021E9AE0 - _021E9A94 - 2 ; case 5
	.short _021E9AD0 - _021E9A94 - 2 ; case 6
	.short _021E9AA4 - _021E9A94 - 2 ; case 7
_021E9AA4:
	add r2, r4, #0
	add r3, r4, #0
	add r2, #0x94
	add r3, #0x9c
	ldr r0, [r4]
	ldr r2, [r2]
	ldr r3, [r3]
	ldr r1, _021E9B54 ; =0x000006DC
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	ldr r0, [r0, #4]
	add r1, r4, r1
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl sub_0202D8A4
	add r0, r4, #0
	mov r1, #0x27
	mov r2, #0x26
	bl ov73_021E83EC
	b _021E9B4A
_021E9AD0:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov73_021EA180
	b _021E9B4A
_021E9AE0:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov73_021EA180
	b _021E9B4A
_021E9AF0:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0xb
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov73_021EA180
	b _021E9B4A
_021E9B00:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov73_021EA180
	b _021E9B4A
_021E9B10:
	mov r2, #0xb
	str r2, [r4, #0x1c]
	sub r1, #0x78
	str r0, [r4, r1]
	add r0, r4, #0
	bl ov73_021EA180
	b _021E9B4A
_021E9B20:
	sub r1, #0x78
	str r0, [r4, r1]
	mov r0, #0x35
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov73_021EA180
	bl sub_020399EC
	b _021E9B4A
_021E9B34:
	ldr r0, _021E9B50 ; =0x00000F94
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	mov r0, #0xe1
	lsl r0, r0, #4
	cmp r1, r0
	bne _021E9B4A
	bl sub_020399EC
_021E9B4A:
	mov r0, #3
	pop {r4, pc}
	nop
_021E9B50: .word 0x00000F94
_021E9B54: .word 0x000006DC
	thumb_func_end ov73_021E9A6C

	thumb_func_start ov73_021E9B58
ov73_021E9B58: ; 0x021E9B58
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _021E9B8C ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	ldr r1, _021E9B90 ; =0x00000BD4
	mov r2, #3
	ldr r1, [r4, r1]
	mov r3, #1
	bl ov73_021E9FF8
	add r0, r4, #0
	mov r1, #0x2f
	mov r2, #0x2d
	bl ov73_021E83EC
	add r0, r4, #0
	bl ov73_021EA180
	ldr r0, [r4]
	mov r1, #0
	str r1, [r0, #0x20]
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_021E9B8C: .word 0x00000F0F
_021E9B90: .word 0x00000BD4
	thumb_func_end ov73_021E9B58

	thumb_func_start ov73_021E9B94
ov73_021E9B94: ; 0x021E9B94
	mov r1, #0x29
	str r1, [r0, #0x1c]
	mov r0, #3
	bx lr
	thumb_func_end ov73_021E9B94

	thumb_func_start ov73_021E9B9C
ov73_021E9B9C: ; 0x021E9B9C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	mov r1, #2
	ldr r0, [r0, #0xc]
	bl Save_PrepareForAsyncWrite
	mov r0, #0x28
	str r0, [r4, #0x1c]
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov73_021E9B9C

	thumb_func_start ov73_021E9BB4
ov73_021E9BB4: ; 0x021E9BB4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl Save_WriteFileAsync
	cmp r0, #2
	bne _021E9BCE
	ldr r0, [r4, #0x20]
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov73_021EA180
_021E9BCE:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov73_021E9BB4

	thumb_func_start ov73_021E9BD4
ov73_021E9BD4: ; 0x021E9BD4
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _021E9BFC ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	ldr r1, _021E9C00 ; =0x00000BD4
	mov r2, #4
	ldr r1, [r4, r1]
	mov r3, #1
	bl ov73_021E9FF8
	add r0, r4, #0
	mov r1, #0x30
	mov r2, #0x16
	bl ov73_021E83EC
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_021E9BFC: .word 0x00000F0F
_021E9C00: .word 0x00000BD4
	thumb_func_end ov73_021E9BD4

	thumb_func_start ov73_021E9C04
ov73_021E9C04: ; 0x021E9C04
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E9C2C ; =0x000012C8
	ldr r0, [r4, r0]
	bl ov73_021E83D4
	cmp r0, #0
	beq _021E9C28
	cmp r0, #2
	bne _021E9C1E
	mov r0, #0xd
	str r0, [r4, #0x1c]
	b _021E9C28
_021E9C1E:
	mov r0, #0x29
	str r0, [r4, #0x1c]
	ldr r0, [r4]
	mov r1, #1
	str r1, [r0, #0x20]
_021E9C28:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_021E9C2C: .word 0x000012C8
	thumb_func_end ov73_021E9C04

	thumb_func_start ov73_021E9C30
ov73_021E9C30: ; 0x021E9C30
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _021E9C58 ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	ldr r1, _021E9C5C ; =0x00000BD4
	mov r2, #9
	ldr r1, [r4, r1]
	mov r3, #1
	bl ov73_021E9FF8
	add r0, r4, #0
	mov r1, #0x30
	mov r2, #0x18
	bl ov73_021E83EC
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_021E9C58: .word 0x00000F0F
_021E9C5C: .word 0x00000BD4
	thumb_func_end ov73_021E9C30

	thumb_func_start ov73_021E9C60
ov73_021E9C60: ; 0x021E9C60
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E9C88 ; =0x000012C8
	ldr r0, [r4, r0]
	bl ov73_021E83D4
	cmp r0, #0
	beq _021E9C84
	cmp r0, #2
	bne _021E9C7A
	mov r0, #0x1d
	str r0, [r4, #0x1c]
	b _021E9C84
_021E9C7A:
	mov r0, #0x29
	str r0, [r4, #0x1c]
	ldr r0, [r4]
	mov r1, #1
	str r1, [r0, #0x20]
_021E9C84:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_021E9C88: .word 0x000012C8
	thumb_func_end ov73_021E9C60

	thumb_func_start ov73_021E9C8C
ov73_021E9C8C: ; 0x021E9C8C
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _021E9CB4 ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	ldr r1, _021E9CB8 ; =0x00000BDC
	mov r2, #0x1a
	ldr r1, [r4, r1]
	mov r3, #1
	bl ov73_021E9FF8
	add r0, r4, #0
	mov r1, #0x2f
	mov r2, #0x2a
	bl ov73_021E83EC
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_021E9CB4: .word 0x00000F0F
_021E9CB8: .word 0x00000BDC
	thumb_func_end ov73_021E9C8C

	thumb_func_start ov73_021E9CBC
ov73_021E9CBC: ; 0x021E9CBC
	push {r4, lr}
	add r4, r0, #0
	bl ov00_021EC8D8
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov73_021E844C
	mov r0, #0x2b
	str r0, [r4, #0x1c]
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov73_021E9CBC

	thumb_func_start ov73_021E9CD8
ov73_021E9CD8: ; 0x021E9CD8
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _021E9D08 ; =0x00000F0F
	add r4, r0, #0
	str r1, [sp]
	ldr r1, _021E9D0C ; =0x00000BDC
	mov r2, #0x1b
	ldr r1, [r4, r1]
	mov r3, #1
	bl ov73_021E9FF8
	add r0, r4, #0
	mov r1, #0x31
	mov r2, #0x2e
	bl ov73_021E83EC
	mov r0, #0xf2
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r4, r0]
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_021E9D08: .word 0x00000F0F
_021E9D0C: .word 0x00000BDC
	thumb_func_end ov73_021E9CD8

	thumb_func_start ov73_021E9D10
ov73_021E9D10: ; 0x021E9D10
	mov r0, #3
	bx lr
	thumb_func_end ov73_021E9D10

	thumb_func_start ov73_021E9D14
ov73_021E9D14: ; 0x021E9D14
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl sub_0203A914
	bl sub_0203946C
	mov r0, #8
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x96
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #0
	str r0, [r4, #0x1c]
	mov r0, #4
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov73_021E9D14

	thumb_func_start ov73_021E9D44
ov73_021E9D44: ; 0x021E9D44
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E9D68 ; =0x000012C8
	ldr r0, [r4, r0]
	bl ov73_021E83D4
	cmp r0, #0
	beq _021E9D62
	cmp r0, #2
	bne _021E9D5E
	mov r0, #0
	str r0, [r4, #0x1c]
	b _021E9D62
_021E9D5E:
	mov r0, #0x29
	str r0, [r4, #0x1c]
_021E9D62:
	mov r0, #3
	pop {r4, pc}
	nop
_021E9D68: .word 0x000012C8
	thumb_func_end ov73_021E9D44

	thumb_func_start ov73_021E9D6C
ov73_021E9D6C: ; 0x021E9D6C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021E9DD4 ; =0x00000F1C
	mov r4, #0
	ldr r0, [r5, r0]
	add r0, r0, #7
	cmp r0, #9
	bhi _021E9DAE
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E9D88: ; jump table
	.short _021E9DA8 - _021E9D88 - 2 ; case 0
	.short _021E9D9C - _021E9D88 - 2 ; case 1
	.short _021E9DAE - _021E9D88 - 2 ; case 2
	.short _021E9DA8 - _021E9D88 - 2 ; case 3
	.short _021E9DAC - _021E9D88 - 2 ; case 4
	.short _021E9D9C - _021E9D88 - 2 ; case 5
	.short _021E9DA4 - _021E9D88 - 2 ; case 6
	.short _021E9DAE - _021E9D88 - 2 ; case 7
	.short _021E9DA0 - _021E9D88 - 2 ; case 8
	.short _021E9DA4 - _021E9D88 - 2 ; case 9
_021E9D9C:
	mov r4, #0xd
	b _021E9DAE
_021E9DA0:
	mov r4, #0xb
	b _021E9DAE
_021E9DA4:
	mov r4, #0xc
	b _021E9DAE
_021E9DA8:
	mov r4, #0xe
	b _021E9DAE
_021E9DAC:
	mov r4, #0xf
_021E9DAE:
	add r0, r5, #0
	bl ov73_021EA180
	ldr r0, _021E9DD8 ; =0x00000F0F
	ldr r1, _021E9DDC ; =0x00000BD4
	str r0, [sp]
	ldr r1, [r5, r1]
	add r0, r5, #0
	add r2, r4, #0
	mov r3, #1
	bl ov73_021E9FF8
	add r0, r5, #0
	mov r1, #0x2f
	mov r2, #0x36
	bl ov73_021E83EC
	mov r0, #3
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E9DD4: .word 0x00000F1C
_021E9DD8: .word 0x00000F0F
_021E9DDC: .word 0x00000BD4
	thumb_func_end ov73_021E9D6C

	thumb_func_start ov73_021E9DE0
ov73_021E9DE0: ; 0x021E9DE0
	push {r3, r4, lr}
	sub sp, #4
	mov r1, #0xf9
	add r4, r0, #0
	lsl r1, r1, #4
	ldrsh r2, [r4, r1]
	cmp r2, #3
	bhi _021E9E7C
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_021E9DFC: ; jump table
	.short _021E9E04 - _021E9DFC - 2 ; case 0
	.short _021E9E20 - _021E9DFC - 2 ; case 1
	.short _021E9E44 - _021E9DFC - 2 ; case 2
	.short _021E9E60 - _021E9DFC - 2 ; case 3
_021E9E04:
	sub r1, #0x81
	str r1, [sp]
	ldr r1, _021E9EA0 ; =0x00000BD4
	mov r2, #0x10
	ldr r1, [r4, r1]
	mov r3, #1
	bl ov73_021E9FF8
	mov r0, #0xf9
	lsl r0, r0, #4
	ldrsh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, r0]
	b _021E9E98
_021E9E20:
	ldr r0, _021E9EA4 ; =0x00000BF4
	ldr r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _021E9E98
	bl sub_0203946C
	bl ov00_021EC8D8
	mov r0, #0xf9
	lsl r0, r0, #4
	ldrsh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, r0]
	b _021E9E98
_021E9E44:
	sub r1, #0x81
	str r1, [sp]
	ldr r1, _021E9EA0 ; =0x00000BD4
	mov r2, #0x11
	ldr r1, [r4, r1]
	mov r3, #1
	bl ov73_021E9FF8
	mov r0, #0xf9
	lsl r0, r0, #4
	ldrsh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, r0]
	b _021E9E98
_021E9E60:
	ldr r0, _021E9EA4 ; =0x00000BF4
	ldr r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _021E9E98
	mov r0, #0xf9
	lsl r0, r0, #4
	ldrsh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, r0]
	b _021E9E98
_021E9E7C:
	ldr r0, _021E9EA8 ; =0x00000F92
	ldrsh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, r0]
	ldrsh r0, [r4, r0]
	cmp r0, #0x1e
	ble _021E9E98
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov73_021E844C
	mov r0, #0x2e
	str r0, [r4, #0x1c]
_021E9E98:
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_021E9EA0: .word 0x00000BD4
_021E9EA4: .word 0x00000BF4
_021E9EA8: .word 0x00000F92
	thumb_func_end ov73_021E9DE0

	thumb_func_start ov73_021E9EAC
ov73_021E9EAC: ; 0x021E9EAC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E9EC8 ; =0x00000BF4
	ldr r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _021E9EC4
	ldr r0, [r4, #0x20]
	str r0, [r4, #0x1c]
_021E9EC4:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_021E9EC8: .word 0x00000BF4
	thumb_func_end ov73_021E9EAC

	thumb_func_start ov73_021E9ECC
ov73_021E9ECC: ; 0x021E9ECC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E9EFC ; =0x00000BF4
	ldr r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _021E9EF8
	mov r0, #0xf2
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0x1e
	ble _021E9EEE
	ldr r0, [r4, #0x20]
	str r0, [r4, #0x1c]
_021E9EEE:
	mov r0, #0xf2
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
_021E9EF8:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_021E9EFC: .word 0x00000BF4
	thumb_func_end ov73_021E9ECC

	thumb_func_start ov73_021E9F00
ov73_021E9F00: ; 0x021E9F00
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E9F2C ; =0x00000BF4
	ldr r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _021E9F28
	mov r2, #0x91
	ldr r0, [r4, #4]
	mov r1, #0xa
	lsl r2, r2, #2
	bl ov73_021E8390
	ldr r1, _021E9F30 ; =0x000012C8
	str r0, [r4, r1]
	ldr r0, [r4, #0x20]
	str r0, [r4, #0x1c]
_021E9F28:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_021E9F2C: .word 0x00000BF4
_021E9F30: .word 0x000012C8
	thumb_func_end ov73_021E9F00

	thumb_func_start ov73_021E9F34
ov73_021E9F34: ; 0x021E9F34
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	add r4, r3, #0
	bl NewString_ReadMsgData
	mov r1, #0xbd
	add r6, r0, #0
	lsl r1, r1, #4
	ldr r0, [r5, r1]
	add r1, #0x10
	ldr r1, [r5, r1]
	add r2, r6, #0
	bl StringExpandPlaceholders
	ldr r0, _021E9F94 ; =0x00000DD8
	mov r1, #0xf
	add r0, r5, r0
	bl FillWindowPixelBuffer
	ldr r0, _021E9F94 ; =0x00000DD8
	mov r1, #0
	add r0, r5, r0
	mov r2, #1
	mov r3, #0xe
	bl DrawFrameAndWindow2
	mov r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	mov r2, #0xbe
	ldr r0, _021E9F94 ; =0x00000DD8
	str r3, [sp, #8]
	lsl r2, r2, #4
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r1, #1
	bl AddTextPrinterParameterized
	ldr r1, _021E9F98 ; =0x00000BF4
	str r0, [r5, r1]
	add r0, r6, #0
	bl String_dtor
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021E9F94: .word 0x00000DD8
_021E9F98: .word 0x00000BF4
	thumb_func_end ov73_021E9F34

	thumb_func_start ov73_021E9F9C
ov73_021E9F9C: ; 0x021E9F9C
	push {r4, lr}
	ldr r1, _021E9FC4 ; =0x00000F14
	add r4, r0, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	neg r0, r0
	bl ov73_021E6A70
	ldr r2, _021E9FC4 ; =0x00000F14
	add r1, r0, #0
	ldr r2, [r4, r2]
	add r0, r4, #0
	neg r2, r2
	bl ov73_021EA218
	mov r0, #0x38
	str r0, [r4, #0x1c]
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_021E9FC4: .word 0x00000F14
	thumb_func_end ov73_021E9F9C

	thumb_func_start ov73_021E9FC8
ov73_021E9FC8: ; 0x021E9FC8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E9FF0 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	bne _021E9FDC
	mov r0, #2
	tst r0, r1
	beq _021E9FEA
_021E9FDC:
	ldr r0, _021E9FF4 ; =0x00000E18
	mov r1, #0
	add r0, r4, r0
	bl sub_0200E5D4
	mov r0, #0
	str r0, [r4, #0x1c]
_021E9FEA:
	mov r0, #3
	pop {r4, pc}
	nop
_021E9FF0: .word gSystem
_021E9FF4: .word 0x00000E18
	thumb_func_end ov73_021E9FC8

	thumb_func_start ov73_021E9FF8
ov73_021E9FF8: ; 0x021E9FF8
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	mov r2, #0xbe
	lsl r2, r2, #4
	ldr r2, [r5, r2]
	add r4, r3, #0
	bl ReadMsgDataIntoString
	ldr r0, _021EA048 ; =0x00000DD8
	mov r1, #0xf
	add r0, r5, r0
	bl FillWindowPixelBuffer
	ldr r0, _021EA048 ; =0x00000DD8
	mov r1, #0
	add r0, r5, r0
	mov r2, #1
	mov r3, #0xe
	bl DrawFrameAndWindow2
	mov r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	mov r2, #0xbe
	ldr r0, _021EA048 ; =0x00000DD8
	str r3, [sp, #8]
	lsl r2, r2, #4
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r1, #1
	bl AddTextPrinterParameterized
	ldr r1, _021EA04C ; =0x00000BF4
	str r0, [r5, r1]
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_021EA048: .word 0x00000DD8
_021EA04C: .word 0x00000BF4
	thumb_func_end ov73_021E9FF8

	thumb_func_start ov73_021EA050
ov73_021EA050: ; 0x021EA050
	push {r4, lr}
	add r4, r0, #0
	cmp r3, #1
	beq _021EA05E
	cmp r3, #2
	beq _021EA074
	b _021EA082
_021EA05E:
	ldr r0, [sp, #0xc]
	mov r2, #0
	bl FontID_String_GetWidth
	ldrb r1, [r4, #7]
	lsl r1, r1, #3
	sub r1, r1, r0
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r2, r0, #1
	b _021EA082
_021EA074:
	ldr r0, [sp, #0xc]
	mov r2, #0
	bl FontID_String_GetWidth
	ldrb r1, [r4, #7]
	lsl r1, r1, #3
	sub r2, r1, r0
_021EA082:
	add r0, r2, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov73_021EA050

	thumb_func_start ov73_021EA088
ov73_021EA088: ; 0x021EA088
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r4, r3, #0
	ldr r3, [sp, #0x24]
	add r5, r0, #0
	str r3, [sp]
	mov r3, #1
	str r3, [sp, #4]
	ldr r3, [sp, #0x20]
	add r6, r1, #0
	bl ov73_021EA050
	add r3, r0, #0
	str r4, [sp]
	mov r1, #0
	ldr r0, [sp, #0x24]
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r5, #0
	mov r1, #1
	add r2, r6, #0
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov73_021EA088

	thumb_func_start ov73_021EA0BC
ov73_021EA0BC: ; 0x021EA0BC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r4, r3, #0
	ldr r3, [sp, #0x24]
	add r5, r0, #0
	str r3, [sp]
	mov r3, #0
	str r3, [sp, #4]
	ldr r3, [sp, #0x20]
	add r6, r1, #0
	bl ov73_021EA050
	add r3, r0, #0
	str r4, [sp]
	mov r1, #0
	ldr r0, [sp, #0x24]
	str r1, [sp, #4]
	str r0, [sp, #8]
	add r0, r5, #0
	add r2, r6, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov73_021EA0BC

	thumb_func_start ov73_021EA0F0
ov73_021EA0F0: ; 0x021EA0F0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r1, #0
	mov r1, #0xf
	add r5, r0, #0
	add r6, r2, #0
	add r7, r3, #0
	bl FillWindowPixelBuffer
	mov r0, #1
	str r0, [sp]
	add r0, r4, #0
	add r1, r6, #0
	add r2, r7, #0
	mov r3, #2
	bl String16_FormatInteger
	mov r3, #1
	ldr r0, _021EA128 ; =0x00010200
	str r3, [sp]
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl ov73_021EA0BC
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021EA128: .word 0x00010200
	thumb_func_end ov73_021EA0F0

	thumb_func_start ov73_021EA12C
ov73_021EA12C: ; 0x021EA12C
	ldr r3, _021EA130 ; =sub_0203A880
	bx r3
	.balign 4, 0
_021EA130: .word sub_0203A880
	thumb_func_end ov73_021EA12C

	thumb_func_start ov73_021EA134
ov73_021EA134: ; 0x021EA134
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	cmp r1, #1
	bhi _021EA154
	mov r0, #0xdd
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, _021EA158 ; =0x00000DD4
	add r1, r4, #0
	ldr r0, [r5, r0]
	bl Set2dSpriteVisibleFlag
_021EA154:
	pop {r3, r4, r5, pc}
	nop
_021EA158: .word 0x00000DD4
	thumb_func_end ov73_021EA134

	thumb_func_start ov73_021EA15C
ov73_021EA15C: ; 0x021EA15C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021EA178 ; =0x00000F0C
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _021EA176
	ldr r0, _021EA17C ; =0x00000DD8
	mov r1, #1
	add r0, r4, r0
	bl sub_0200F0AC
	ldr r1, _021EA178 ; =0x00000F0C
	str r0, [r4, r1]
_021EA176:
	pop {r4, pc}
	.balign 4, 0
_021EA178: .word 0x00000F0C
_021EA17C: .word 0x00000DD8
	thumb_func_end ov73_021EA15C

	thumb_func_start ov73_021EA180
ov73_021EA180: ; 0x021EA180
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021EA198 ; =0x00000F0C
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021EA196
	bl sub_0200F450
	ldr r0, _021EA198 ; =0x00000F0C
	mov r1, #0
	str r1, [r4, r0]
_021EA196:
	pop {r4, pc}
	.balign 4, 0
_021EA198: .word 0x00000F0C
	thumb_func_end ov73_021EA180

	thumb_func_start ov73_021EA19C
ov73_021EA19C: ; 0x021EA19C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #1
	add r6, r1, #0
	lsl r0, r0, #8
	mov r1, #0x96
	bl String_ctor
	add r4, r0, #0
	ldr r0, _021EA20C ; =0x00000BDC
	add r1, r6, #0
	ldr r0, [r5, r0]
	add r2, r4, #0
	bl ReadMsgDataIntoString
	mov r1, #0xbd
	lsl r1, r1, #4
	ldr r0, [r5, r1]
	add r1, #0x20
	ldr r1, [r5, r1]
	add r2, r4, #0
	bl StringExpandPlaceholders
	ldr r0, _021EA210 ; =0x00000E18
	mov r1, #0xf
	add r0, r5, r0
	bl FillWindowPixelBuffer
	ldr r0, _021EA210 ; =0x00000E18
	mov r1, #1
	add r0, r5, r0
	mov r2, #0x1f
	mov r3, #0xb
	bl DrawFrameAndWindow1
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r2, #0xbf
	ldr r0, _021EA210 ; =0x00000E18
	str r3, [sp, #8]
	lsl r2, r2, #4
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r1, #1
	bl AddTextPrinterParameterized
	ldr r1, _021EA214 ; =0x00000BF4
	str r0, [r5, r1]
	add r0, r4, #0
	bl String_dtor
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_021EA20C: .word 0x00000BDC
_021EA210: .word 0x00000E18
_021EA214: .word 0x00000BF4
	thumb_func_end ov73_021EA19C

	thumb_func_start ov73_021EA218
ov73_021EA218: ; 0x021EA218
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0
	add r4, r1, #0
	mvn r0, r0
	cmp r4, r0
	bne _021EA22A
	mov r4, #0xb
_021EA22A:
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0xbd
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	mov r3, #5
	bl BufferIntegerAsString
	ldr r0, _021EA258 ; =0x00000DD8
	mov r1, #1
	add r0, r5, r0
	bl ClearFrameAndWindow2
	add r0, r5, #0
	add r1, r4, #0
	bl ov73_021EA19C
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_021EA258: .word 0x00000DD8
	thumb_func_end ov73_021EA218

	thumb_func_start ov73_021EA25C
ov73_021EA25C: ; 0x021EA25C
	push {r3, lr}
	bl Save_FriendGroup_get
	bl ov73_021E795C
	pop {r3, pc}
	thumb_func_end ov73_021EA25C

	thumb_func_start ov73_021EA268
ov73_021EA268: ; 0x021EA268
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r2, #0
	bl Save_FriendGroup_get
	add r6, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	add r0, r6, #0
	bl ov73_021E7960
	add r1, r4, #0
	add r2, r5, #0
	bl MIi_CpuCopyFast
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov73_021EA268

	thumb_func_start ov73_021EA290
ov73_021EA290: ; 0x021EA290
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	bl Save_FriendGroup_get
	add r2, r0, #0
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	ldr r3, [r4, #0x10]
	bl ov73_021E79F4
	pop {r4, pc}
	thumb_func_end ov73_021EA290

	thumb_func_start ov73_021EA2A8
ov73_021EA2A8: ; 0x021EA2A8
	push {r3, lr}
	bl Save_DressupData_get
	bl sub_0202B994
	pop {r3, pc}
	thumb_func_end ov73_021EA2A8

	thumb_func_start ov73_021EA2B4
ov73_021EA2B4: ; 0x021EA2B4
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r2, #0
	bl Save_DressupData_get
	add r6, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	add r0, r6, #0
	mov r1, #0
	bl sub_0202B9B8
	add r1, r4, #0
	add r2, r5, #0
	bl MIi_CpuCopyFast
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov73_021EA2B4

	thumb_func_start ov73_021EA2E0
ov73_021EA2E0: ; 0x021EA2E0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	bl Save_DressupData_get
	add r2, r0, #0
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	lsl r0, r0, #0x18
	ldr r3, [r4, #0x10]
	lsr r0, r0, #0x18
	bl sub_0202BF80
	pop {r4, pc}
	thumb_func_end ov73_021EA2E0

	thumb_func_start ov73_021EA2FC
ov73_021EA2FC: ; 0x021EA2FC
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, [r4, #4]
	bl sub_020270C4
	ldr r1, [r4, #0x14]
	str r1, [sp]
	ldr r1, [r4, #8]
	ldr r2, [r4, #0xc]
	ldr r3, [r4, #0x10]
	bl ov73_021E7E24
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov73_021EA2FC

	thumb_func_start ov73_021EA31C
ov73_021EA31C: ; 0x021EA31C
	ldr r3, _021EA320 ; =sub_0202E66C
	bx r3
	.balign 4, 0
_021EA320: .word sub_0202E66C
	thumb_func_end ov73_021EA31C

	thumb_func_start ov73_021EA324
ov73_021EA324: ; 0x021EA324
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, [r4, #4]
	bl sub_0202E530
	ldr r0, [r4]
	str r0, [sp]
	ldr r2, [r4, #8]
	ldr r0, [r4, #4]
	lsl r2, r2, #0x18
	ldr r1, [r4, #0xc]
	ldr r3, [r4, #0x10]
	lsr r2, r2, #0x18
	bl sub_0202E97C
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov73_021EA324

	thumb_func_start ov73_021EA348
ov73_021EA348: ; 0x021EA348
	push {r4, r5, r6, lr}
	add r5, r2, #0
	add r6, r0, #0
	add r0, r1, #0
	add r1, r5, #0
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	mov r1, #0
	add r2, r5, #0
	bl MI_CpuFill8
	add r0, r6, #0
	mov r1, #0
	add r2, r4, #0
	bl sub_02069528
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov73_021EA348

	thumb_func_start ov73_021EA370
ov73_021EA370: ; 0x021EA370
	bx lr
	.balign 4, 0
	thumb_func_end ov73_021EA370

	thumb_func_start ov73_021EA374
ov73_021EA374: ; 0x021EA374
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	mov r0, #0
	ldr r6, _021EA3C8 ; =0x00000BB8
	ldr r5, _021EA3CC ; =ov73_021EA744
	str r1, [sp, #4]
	str r0, [sp, #8]
_021EA384:
	ldr r0, [sp]
	ldr r1, [r5]
	blx r1
	add r4, r0, #0
	ldr r0, [sp]
	ldr r3, [r5, #4]
	mov r1, #0x32
	add r2, r4, #0
	blx r3
	add r7, r0, #0
	cmp r6, r4
	bhi _021EA3A0
	bl GF_AssertFail
_021EA3A0:
	ldr r1, [sp, #4]
	add r0, r7, #0
	add r2, r4, #0
	bl MIi_CpuCopyFast
	add r0, r7, #0
	bl FreeToHeap
	ldr r0, [sp, #4]
	sub r6, r6, r4
	add r0, r0, r4
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	add r5, #0xc
	add r0, r0, #1
	str r0, [sp, #8]
	cmp r0, #0xa
	blt _021EA384
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021EA3C8: .word 0x00000BB8
_021EA3CC: .word ov73_021EA744
	thumb_func_end ov73_021EA374

	thumb_func_start ov73_021EA3D0
ov73_021EA3D0: ; 0x021EA3D0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x68
	str r0, [sp]
	ldr r0, _021EA514 ; =0x00000BB8
	str r1, [sp, #4]
	str r0, [sp, #0x14]
	mov r0, #0x32
	str r0, [sp, #0x50]
	ldr r0, [sp]
	mov r7, #0
	str r0, [sp, #0x54]
	bl sub_0203769C
	add r5, r7, #0
	str r0, [sp, #0x5c]
	mov r0, #5
	str r0, [sp, #0x58]
	add r0, sp, #0x3c
	str r0, [sp, #0x60]
	add r0, sp, #0x28
	ldr r4, _021EA518 ; =ov73_021EA744
	str r0, [sp, #0x64]
	str r5, [sp, #0x1c]
	str r5, [sp, #0x20]
	str r5, [sp, #0x24]
_021EA402:
	ldr r0, [sp]
	ldr r1, [r4]
	blx r1
	ldr r1, [sp, #0x1c]
	add r5, r5, #1
	add r0, r1, r0
	add r4, #0xc
	str r0, [sp, #0x1c]
	cmp r5, #2
	blt _021EA402
	ldr r4, _021EA518 ; =ov73_021EA744
	mov r5, #0
_021EA41A:
	ldr r0, [sp]
	ldr r1, [r4]
	blx r1
	ldr r1, [sp, #0x20]
	add r5, r5, #1
	add r0, r1, r0
	add r4, #0xc
	str r0, [sp, #0x20]
	cmp r5, #3
	blt _021EA41A
	ldr r4, _021EA518 ; =ov73_021EA744
	mov r5, #0
_021EA432:
	ldr r0, [sp]
	ldr r1, [r4]
	blx r1
	ldr r1, [sp, #0x24]
	add r5, r5, #1
	add r0, r1, r0
	add r4, #0xc
	str r0, [sp, #0x24]
	cmp r5, #4
	blt _021EA432
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, _021EA518 ; =ov73_021EA744
	str r0, [sp, #0x10]
	add r0, sp, #0x1c
	str r0, [sp, #0xc]
_021EA452:
	ldr r1, [sp, #0x10]
	ldr r0, [sp]
	ldr r1, [r1]
	blx r1
	ldr r1, [sp, #0x14]
	str r0, [sp, #0x18]
	cmp r1, r0
	bhi _021EA466
	bl GF_AssertFail
_021EA466:
	mov r6, #0
	ldr r4, [sp, #4]
	add r5, r6, #0
_021EA46C:
	add r0, r6, #0
	bl sub_02034818
	cmp r0, #0
	beq _021EA47E
	ldr r0, [sp, #0x60]
	add r1, r4, r7
	str r1, [r0, r5]
	b _021EA484
_021EA47E:
	ldr r1, [sp, #0x60]
	mov r0, #0
	str r0, [r1, r5]
_021EA484:
	mov r0, #0x2f
	lsl r0, r0, #6
	add r6, r6, #1
	add r4, r4, r0
	add r5, r5, #4
	cmp r6, #5
	blt _021EA46C
	ldr r0, [sp, #8]
	cmp r0, #7
	beq _021EA4A0
	cmp r0, #8
	beq _021EA4A0
	cmp r0, #9
	bne _021EA4D2
_021EA4A0:
	mov r6, #0
	ldr r4, [sp, #4]
	add r5, r6, #0
_021EA4A6:
	add r0, r6, #0
	bl sub_02034818
	cmp r0, #0
	beq _021EA4BE
	ldr r0, [sp, #0xc]
	sub r0, #0x1c
	ldr r0, [r0]
	add r1, r4, r0
	ldr r0, [sp, #0x64]
	str r1, [r0, r5]
	b _021EA4C4
_021EA4BE:
	ldr r1, [sp, #0x64]
	mov r0, #0
	str r0, [r1, r5]
_021EA4C4:
	mov r0, #0x2f
	lsl r0, r0, #6
	add r6, r6, #1
	add r4, r4, r0
	add r5, r5, #4
	cmp r6, #5
	blt _021EA4A6
_021EA4D2:
	ldr r0, [sp, #0x10]
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _021EA4DE
	add r0, sp, #0x50
	blx r1
_021EA4DE:
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x14]
	add r7, r7, r0
	sub r0, r1, r0
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	add r0, #0xc
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	add r0, r0, #4
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	add r0, r0, #1
	str r0, [sp, #8]
	cmp r0, #0xa
	blo _021EA452
	ldr r0, [sp]
	bl sub_020270C4
	add r4, r0, #0
	bl sub_0202E43C
	add r0, r4, #0
	bl sub_0202E474
	add sp, #0x68
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021EA514: .word 0x00000BB8
_021EA518: .word ov73_021EA744
	thumb_func_end ov73_021EA3D0

	.rodata

_021EA51C:
	.byte 0x10, 0x18, 0x00, 0x00

ov73_021EA520: ; 0x021EA520
	.byte 0xA0, 0x01, 0xA0, 0x07, 0xA0, 0x0D, 0xA0, 0x13, 0xA0, 0x19

ov73_021EA52A: ; 0x021EA52A
	.byte 0x08

ov73_021EA52B: ; 0x021EA52B
	.byte 0x02, 0x08, 0x03, 0x08, 0x04
	.byte 0x18, 0x00, 0x00, 0xFF

ov73_021EA534: ; 0x021EA534
	.byte 0xA0, 0xC0, 0x80, 0xC0, 0xA0, 0xC0, 0xC0, 0x00, 0xFF, 0x00, 0x00, 0x00

ov73_021EA540: ; 0x021EA540
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov73_021EA550: ; 0x021EA550
	.byte 0x14, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00

ov73_021EA560: ; 0x021EA560
	.byte 0x54, 0x00, 0x68, 0x00, 0x55, 0x00, 0x48, 0x00, 0x72, 0x00, 0x58, 0x00, 0x67, 0x00, 0x75, 0x00
	.byte 0x42, 0x00, 0x75, 0x00, 0x37, 0x00, 0x58, 0x00

ov73_021EA578: ; 0x021EA578
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov73_021EA594: ; 0x021EA594
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov73_021EA5B0: ; 0x021EA5B0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov73_021EA5CC: ; 0x021EA5CC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov73_021EA5E8: ; 0x021EA5E8
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov73_021EA610:
	.byte 0x01, 0x03, 0x04, 0x06, 0x08, 0x09, 0xFF, 0x00

ov73_021EA618:
	.byte 0x01, 0x03, 0x04, 0x05, 0x08, 0x09, 0x0A, 0x0B, 0xFF, 0x00, 0x00, 0x00

ov73_021EA624:
	.byte 0x02, 0x04, 0x06, 0x07, 0x09, 0x0A, 0x0B, 0x0D, 0xFF, 0x00, 0x00, 0x00

ov73_021EA630:
	.byte 0x02, 0x04, 0x06, 0x07, 0x09, 0x0A, 0x0B, 0x0D, 0x0E, 0x0F, 0x10, 0x11, 0x12, 0x13, 0xFF, 0x00

ov73_021EA640:
	.byte 0x01, 0x02, 0x03, 0x04, 0x06, 0x0A, 0x0D, 0x0F, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0xFF

ov73_021EA650:
	.byte 0x01, 0x02, 0x03, 0x04, 0x06, 0x07, 0x08, 0x0A, 0x0D, 0x0F, 0x10, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x19, 0x1A, 0xFF

ov73_021EA664: ; 0x021EA664
	.word ov73_021EA630
	.word ov73_021EA650
	.word ov73_021EA618
	.word ov73_021EA624
	.word ov73_021EA640
	.word ov73_021EA610
	.byte 0x00, 0x17, 0x0D, 0x07
	.byte 0x04, 0x0D, 0x00, 0x00

ov73_021EA684: ; 0x021EA684
	.byte 0xE0, 0x00, 0x6F, 0x00, 0xE0, 0x00, 0x81, 0x00

ov73_021EA68C: ; 0x021EA68C
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov73_021EA69C: ; 0x021EA69C
	.byte 0x14, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x96, 0x00, 0x00, 0x00

ov73_021EA6AC: ; 0x021EA6AC
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x60, 0x00, 0x00, 0x00

ov73_021EA6D4: ; 0x021EA6D4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1B, 0x02, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov73_021EA6F0: ; 0x021EA6F0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov73_021EA70C: ; 0x021EA70C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov73_021EA728: ; 0x021EA728
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x04, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov73_021EA744: ; 0x021EA744
	.word ov73_021EA25C
	.word ov73_021EA268
	.word ov73_021EA290
	.word ov73_021EA2A8
	.word ov73_021EA2B4
	.word ov73_021EA2E0
	.word ov73_021E7A7C
	.word ov73_021E7B84
	.word 0
	.word ov73_021E7A84
	.word ov73_021E7BC8
	.word 0
	.word ov73_021E7A74
	.word ov73_021E7B3C
	.word 0
	.word sub_0202E58C
	.word ov73_021EA31C
	.word ov73_021EA324
	.word sub_0202D230
	.word ov73_021EA348
	.word ov73_021EA370
	.word ov73_021E7A7C
	.word ov73_021E7C50
	.word 0
	.word ov73_021E7A84
	.word ov73_021E7C94
	.word 0
	.word ov73_021E7A74
	.word ov73_021E7C0C
	.word ov73_021EA2FC

	.data

_021EA7C0:
	.word ov73_021E6444
	.word ov73_021E66F4
	.word ov73_021E6778
	.word ov73_021E6484
	.word ov73_021E6890
	.word ov73_021E68AC
	.word ov73_021E69D0
	.word ov73_021E69E8
	.word ov73_021E6A70
	.word ov73_021E6CDC
	.word ov73_021E6CFC
	.word ov73_021E6D38
	.word ov73_021E6D54
	.word ov73_021E6DF8
	.word ov73_021E6E48
	.word ov73_021E6E6C
	.word ov73_021E6E8C
	.word ov73_021E6ECC
	.word ov73_021E6EF8
	.word ov73_021E6F1C
	.word ov73_021E6FAC
	.word ov73_021E6FE8
	.word ov73_021E6A90
	.word ov73_021E6AAC
	.word ov73_021E6B6C
	.word ov73_021E6BC8
	.word ov73_021E6BF8
	.word ov73_021E6C20
	.word ov73_021E6C50
	.word ov73_021E6CC0
	.word ov73_021E671C

ov73_021EA83C: ; 0x021EA83C
	.word ov73_021E84D0

ov73_021EA840: ; 0x021EA840
	.word ov73_021E85AC

ov73_021EA844: ; 0x021EA844
	.word ov73_021E85DC

ov73_021EA848: ; 0x021EA848
	.word ov73_021E8BFC
	.word ov73_021E8C2C
	.word ov73_021E8D0C
	.word ov73_021E8D2C
	.word ov73_021E8DB8
	.word ov73_021E8DC8
	.word ov73_021E8E7C
	.word ov73_021E8EBC
	.word ov73_021E8ED8
	.word ov73_021E8FB0
	.word ov73_021E8FE4
	.word ov73_021E9120
	.word ov73_021E9144
	.word ov73_021E91F4
	.word ov73_021E9224
	.word ov73_021E926C
	.word ov73_021E9378
	.word ov73_021E941C
	.word ov73_021E944C
	.word ov73_021E955C
	.word ov73_021E93EC
	.word ov73_021E9BD4
	.word ov73_021E9C04
	.word ov73_021E9C30
	.word ov73_021E9C60
	.word ov73_021E9598
	.word ov73_021E95CC
	.word ov73_021E9618
	.word ov73_021E96EC
	.word ov73_021E9728
	.word ov73_021E9758
	.word ov73_021E97A8
	.word ov73_021E987C
	.word ov73_021E98AC
	.word ov73_021E98FC
	.word ov73_021E99D4
	.word ov73_021E9A3C
	.word ov73_021E9A6C
	.word ov73_021E9B58
	.word ov73_021E9B9C
	.word ov73_021E9BB4
	.word ov73_021E9C8C
	.word ov73_021E9CBC
	.word ov73_021E9CD8
	.word ov73_021E9D10
	.word ov73_021E9B94
	.word ov73_021E9D14
	.word ov73_021E9EAC
	.word ov73_021E9F00
	.word ov73_021E9ECC
	.word ov73_021E9D44
	.word ov73_021E8C8C
	.word ov73_021E8CBC
	.word ov73_021E9D6C
	.word ov73_021E9DE0
	.word ov73_021E9F9C
	.word ov73_021E9FC8

	.bss

_021EA940:
	.space 0x8
