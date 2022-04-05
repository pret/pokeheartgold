	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov95_021E5900
ov95_021E5900: ; 0x021E5900
	push {r3, lr}
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E5920 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _021E5924 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	pop {r3, pc}
	.balign 4, 0
_021E5920: .word 0xFFFFE0FF
_021E5924: .word 0x04001000
	thumb_func_end ov95_021E5900

	thumb_func_start ov95_021E5928
ov95_021E5928: ; 0x021E5928
	push {r3, lr}
	mov r0, #7
	str r0, [sp]
	ldr r0, _021E594C ; =0x04000050
	mov r1, #0
	mov r2, #0xe
	mov r3, #0xb
	bl G2x_SetBlendAlpha_
	mov r0, #8
	str r0, [sp]
	ldr r0, _021E5950 ; =0x04001050
	mov r1, #0
	mov r2, #0xe
	mov r3, #7
	bl G2x_SetBlendAlpha_
	pop {r3, pc}
	.balign 4, 0
_021E594C: .word 0x04000050
_021E5950: .word 0x04001050
	thumb_func_end ov95_021E5928

	thumb_func_start ov95_021E5954
ov95_021E5954: ; 0x021E5954
	push {r3, lr}
	sub sp, #8
	mov r2, #2
	mov r1, #0
	ldr r0, _021E5970 ; =ov95_021E5974
	str r2, [sp]
	str r0, [sp, #4]
	mov r0, #0x46
	add r3, r1, #0
	bl GF_3DVramMan_Create
	add sp, #8
	pop {r3, pc}
	nop
_021E5970: .word ov95_021E5974
	thumb_func_end ov95_021E5954

	thumb_func_start ov95_021E5974
ov95_021E5974: ; 0x021E5974
	push {r3, lr}
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	ldr r0, _021E59E0 ; =0x04000008
	mov r1, #3
	ldrh r2, [r0]
	bic r2, r1
	mov r1, #1
	orr r1, r2
	strh r1, [r0]
	add r0, #0x58
	ldrh r2, [r0]
	ldr r1, _021E59E4 ; =0xFFFFCFFD
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
	ldr r2, _021E59E8 ; =0x0000CFFB
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
	ldr r2, _021E59EC ; =0x00007FFF
	add r1, r0, #0
	mov r3, #0x3f
	str r0, [sp]
	bl G3X_SetClearColor
	ldr r1, _021E59F0 ; =0xBFFF0000
	ldr r0, _021E59F4 ; =0x04000580
	str r1, [r0]
	pop {r3, pc}
	.balign 4, 0
_021E59E0: .word 0x04000008
_021E59E4: .word 0xFFFFCFFD
_021E59E8: .word 0x0000CFFB
_021E59EC: .word 0x00007FFF
_021E59F0: .word 0xBFFF0000
_021E59F4: .word 0x04000580
	thumb_func_end ov95_021E5974

	thumb_func_start ov95_021E59F8
ov95_021E59F8: ; 0x021E59F8
	push {r3, r4, r5, lr}
	ldr r3, _021E5A30 ; =NNS_GfdDefaultFuncAllocTexVram
	mov r0, #2
	mov r1, #0
	ldr r3, [r3]
	lsl r0, r0, #0xe
	add r2, r1, #0
	blx r3
	ldr r3, _021E5A34 ; =NNS_GfdDefaultFuncAllocPlttVram
	mov r1, #0
	add r4, r0, #0
	ldr r3, [r3]
	mov r0, #0x80
	add r2, r1, #0
	blx r3
	add r5, r0, #0
	cmp r4, #0
	bne _021E5A20
	bl GF_AssertFail
_021E5A20:
	cmp r5, #0
	bne _021E5A28
	bl GF_AssertFail
_021E5A28:
	bl sub_02014DA0
	pop {r3, r4, r5, pc}
	nop
_021E5A30: .word NNS_GfdDefaultFuncAllocTexVram
_021E5A34: .word NNS_GfdDefaultFuncAllocPlttVram
	thumb_func_end ov95_021E59F8

	thumb_func_start ov95_021E5A38
ov95_021E5A38: ; 0x021E5A38
	push {r4, r5, lr}
	sub sp, #0x8c
	add r4, r0, #0
	bl GX_DisableEngineALayers
	ldr r5, _021E5B14 ; =ov95_021E75B4
	add r3, sp, #0x10
	mov r2, #5
_021E5A48:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E5A48
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
	ldr r5, _021E5B18 ; =ov95_021E7538
	add r3, sp, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _021E5B1C ; =ov95_021E767C
	add r3, sp, #0x38
	mov r2, #0xa
_021E5AA8:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E5AA8
	ldr r0, [r5]
	mov r1, #1
	str r0, [r3]
	add r0, r4, #0
	add r2, sp, #0x38
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #2
	add r2, sp, #0x54
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #3
	add r2, sp, #0x70
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
	ldr r1, _021E5B20 ; =0x04000008
	mov r0, #3
	ldrh r2, [r1]
	bic r2, r0
	mov r0, #1
	orr r2, r0
	strh r2, [r1]
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	bl GX_BothDispOn
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	add sp, #0x8c
	pop {r4, r5, pc}
	.balign 4, 0
_021E5B14: .word ov95_021E75B4
_021E5B18: .word ov95_021E7538
_021E5B1C: .word ov95_021E767C
_021E5B20: .word 0x04000008
	thumb_func_end ov95_021E5A38

	thumb_func_start ov95_021E5B24
ov95_021E5B24: ; 0x021E5B24
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x3c]
	bl sub_02009418
	bl GF_RunVramTransferTasks
	bl sub_0200D034
	ldr r0, [r4, #8]
	bl sub_0200398C
	ldr r0, [r4, #4]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	ldr r3, _021E5B50 ; =0x027E0000
	ldr r1, _021E5B54 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.balign 4, 0
_021E5B50: .word 0x027E0000
_021E5B54: .word 0x00003FF8
	thumb_func_end ov95_021E5B24

	thumb_func_start ov95_021E5B58
ov95_021E5B58: ; 0x021E5B58
	push {r3, lr}
	bl sub_02026E48
	bl sub_0201543C
	cmp r0, #0
	ble _021E5B6E
	bl sub_02026E48
	bl NNS_G2dSetupSoftwareSpriteCamera
_021E5B6E:
	bl sub_02015460
	mov r0, #1
	mov r1, #0
	bl sub_02026E50
	pop {r3, pc}
	thumb_func_end ov95_021E5B58

	thumb_func_start ov95_021E5B7C
ov95_021E5B7C: ; 0x021E5B7C
	push {lr}
	sub sp, #0xc
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x46
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end ov95_021E5B7C

	thumb_func_start ov95_021E5B9C
ov95_021E5B9C: ; 0x021E5B9C
	push {lr}
	sub sp, #0xc
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x46
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	add sp, #0xc
	pop {pc}
	thumb_func_end ov95_021E5B9C

	thumb_func_start ov95_021E5BBC
ov95_021E5BBC: ; 0x021E5BBC
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r6, r2, #0
	add r4, r1, #0
	lsl r1, r6, #0x18
	lsr r1, r1, #0x18
	str r1, [sp]
	mov r1, #0x46
	str r1, [sp, #4]
	mov r1, #1
	mov r2, #0x14
	mov r3, #0xf
	add r5, r0, #0
	bl LoadUserFrameGfx2
	add r0, r6, #0
	bl sub_0200E640
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xc0
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x26
	mov r3, #0x46
	bl PaletteData_LoadNarc
	mov r0, #0
	str r0, [sp]
	mov r0, #0x46
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #1
	mov r2, #0x32
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
	add r0, r4, #0
	mov r1, #0x26
	mov r3, #0x46
	bl PaletteData_LoadNarc
	mov r0, #0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xe0
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x10
	mov r2, #8
	mov r3, #0x46
	bl PaletteData_LoadNarc
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov95_021E5BBC

	thumb_func_start ov95_021E5C44
ov95_021E5C44: ; 0x021E5C44
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
	mov r1, #1
	mov r2, #0x14
	mov r3, #0xc
	bl DrawFrameAndWindow2
	add r0, r5, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r5, #0
	bl CopyWindowToVram
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov95_021E5C44

	thumb_func_start ov95_021E5CAC
ov95_021E5CAC: ; 0x021E5CAC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r4, r1, #0
	mov r1, #0xf
	str r0, [sp, #0xc]
	str r2, [sp, #0x10]
	add r6, r3, #0
	bl FillWindowPixelBuffer
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xbb
	mov r3, #0x46
	bl NewMsgDataFromNarc
	add r7, r0, #0
	mov r0, #0x46
	bl ScrStrBufs_new
	add r5, r0, #0
	add r0, r7, #0
	add r1, r4, #0
	bl NewString_ReadMsgData
	str r0, [sp, #0x14]
	mov r0, #0xff
	mov r1, #0x46
	bl String_ctor
	add r4, r0, #0
	ldr r0, [sp, #0x10]
	bl Mon_GetBoxMon
	add r2, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl BufferBoxMonSpeciesName
	ldr r2, [sp, #0x14]
	add r0, r5, #0
	add r1, r4, #0
	bl StringExpandPlaceholders
	mov r3, #0
	str r3, [sp]
	str r6, [sp, #4]
	ldr r0, [sp, #0xc]
	mov r1, #1
	add r2, r4, #0
	str r3, [sp, #8]
	bl AddTextPrinterParameterized
	add r6, r0, #0
	add r0, r7, #0
	bl DestroyMsgData
	add r0, r4, #0
	bl String_dtor
	ldr r0, [sp, #0x14]
	bl String_dtor
	add r0, r5, #0
	bl ScrStrBufs_delete
	add r0, r6, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov95_021E5CAC

	thumb_func_start ov95_021E5D34
ov95_021E5D34: ; 0x021E5D34
	push {r4, lr}
	add r4, r0, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r4, #0
	bl RemoveWindow
	pop {r4, pc}
	thumb_func_end ov95_021E5D34

	thumb_func_start ov95_021E5D44
ov95_021E5D44: ; 0x021E5D44
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r1, #0
	mov r1, #0
	add r5, r0, #0
	str r1, [sp]
	str r1, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x46
	str r0, [sp, #0xc]
	mov r0, #0x73
	add r2, r5, #0
	mov r3, #3
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r0, #0x46
	str r0, [sp, #0xc]
	mov r0, #0x73
	add r2, r5, #0
	mov r3, #3
	bl GfGfxLoader_LoadScrnData
	mov r1, #0
	str r1, [sp]
	mov r0, #0x40
	str r0, [sp, #4]
	str r1, [sp, #8]
	add r0, r4, #0
	mov r1, #0x73
	mov r2, #8
	mov r3, #0x46
	bl PaletteData_LoadNarc
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov95_021E5D44

	thumb_func_start ov95_021E5D98
ov95_021E5D98: ; 0x021E5D98
	push {r4, lr}
	ldr r3, _021E5DB0 ; =NNS_GfdDefaultFuncAllocTexVram
	mov r2, #0
	ldr r3, [r3]
	blx r3
	add r4, r0, #0
	bl sub_02015354
	lsl r0, r4, #0x10
	lsr r0, r0, #0xd
	pop {r4, pc}
	nop
_021E5DB0: .word NNS_GfdDefaultFuncAllocTexVram
	thumb_func_end ov95_021E5D98

	thumb_func_start ov95_021E5DB4
ov95_021E5DB4: ; 0x021E5DB4
	push {r4, lr}
	ldr r3, _021E5DCC ; =NNS_GfdDefaultFuncAllocPlttVram
	mov r2, #0
	ldr r3, [r3]
	blx r3
	add r4, r0, #0
	bl sub_02015394
	lsl r0, r4, #0x10
	lsr r0, r0, #0xd
	pop {r4, pc}
	nop
_021E5DCC: .word NNS_GfdDefaultFuncAllocPlttVram
	thumb_func_end ov95_021E5DB4

	thumb_func_start ov95_021E5DD0
ov95_021E5DD0: ; 0x021E5DD0
	push {r4, lr}
	sub sp, #8
	mov r1, #0x12
	lsl r1, r1, #0xa
	add r4, r0, #0
	bl AllocFromHeap
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r3, #0x12
	ldr r0, _021E5E10 ; =ov95_021E5D98
	ldr r1, _021E5E14 ; =ov95_021E5DB4
	lsl r3, r3, #0xa
	str r4, [sp, #4]
	bl sub_02014DB4
	add r4, r0, #0
	bl sub_02015524
	add r2, r0, #0
	beq _021E5E08
	mov r0, #1
	mov r1, #0xe1
	lsl r0, r0, #0xc
	lsl r1, r1, #0xe
	bl GF_Camera_SetClipBounds
_021E5E08:
	add r0, r4, #0
	add sp, #8
	pop {r4, pc}
	nop
_021E5E10: .word ov95_021E5D98
_021E5E14: .word ov95_021E5DB4
	thumb_func_end ov95_021E5DD0

	thumb_func_start ov95_021E5E18
ov95_021E5E18: ; 0x021E5E18
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	bl ov95_021E5DD0
	add r4, r0, #0
	add r0, r6, #0
	add r1, r7, #0
	add r2, r5, #0
	bl sub_02015264
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #0xa
	mov r3, #1
	bl sub_0201526C
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov95_021E5E18

	thumb_func_start ov95_021E5E40
ov95_021E5E40: ; 0x021E5E40
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_020154D0
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02014EBC
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, pc}
	thumb_func_end ov95_021E5E40

	thumb_func_start ov95_021E5E58
ov95_021E5E58: ; 0x021E5E58
	push {r3}
	sub sp, #0xc
	add r2, sp, #0
	mov r1, #0
	str r1, [r2]
	str r1, [r2, #4]
	str r1, [r2, #8]
	ldr r1, [r0, #0x20]
	ldr r2, [sp]
	ldr r1, [r1]
	ldr r1, [r1, #4]
	add r1, r2, r1
	str r1, [r0, #0x28]
	ldr r1, [r0, #0x20]
	ldr r2, [sp, #4]
	ldr r1, [r1]
	ldr r1, [r1, #8]
	add r1, r2, r1
	str r1, [r0, #0x2c]
	ldr r1, [r0, #0x20]
	ldr r2, [sp, #8]
	ldr r1, [r1]
	ldr r1, [r1, #0xc]
	add r1, r2, r1
	str r1, [r0, #0x30]
	add sp, #0xc
	pop {r3}
	bx lr
	thumb_func_end ov95_021E5E58

	thumb_func_start ov95_021E5E90
ov95_021E5E90: ; 0x021E5E90
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #0x10
	bl AllocFromHeap
	add r4, r0, #0
	bne _021E5EA4
	bl GF_AssertFail
_021E5EA4:
	ldr r0, [r5]
	ldr r2, [r5, #4]
	mov r1, #0x74
	str r0, [r4]
	str r2, [r4, #4]
	ldr r0, [r4]
	bl ov95_021E5E18
	mov r1, #1
	str r0, [r4, #0xc]
	bl sub_02015528
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov95_021E5E90

	thumb_func_start ov95_021E5EC0
ov95_021E5EC0: ; 0x021E5EC0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	ldr r2, _021E5ED8 ; =ov95_021E5E58
	add r3, r4, #0
	bl sub_02015494
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl sub_02015528
	pop {r4, pc}
	.balign 4, 0
_021E5ED8: .word ov95_021E5E58
	thumb_func_end ov95_021E5EC0

	thumb_func_start ov95_021E5EDC
ov95_021E5EDC: ; 0x021E5EDC
	push {r3, lr}
	ldr r0, [r0, #0xc]
	bl sub_020154B0
	cmp r0, #0
	beq _021E5EEC
	mov r0, #1
	pop {r3, pc}
_021E5EEC:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov95_021E5EDC

	thumb_func_start ov95_021E5EF0
ov95_021E5EF0: ; 0x021E5EF0
	ldr r3, _021E5EF4 ; =FreeToHeap
	bx r3
	.balign 4, 0
_021E5EF4: .word FreeToHeap
	thumb_func_end ov95_021E5EF0

	thumb_func_start ov95_021E5EF8
ov95_021E5EF8: ; 0x021E5EF8
	push {r4, r5, r6, lr}
	sub sp, #0x38
	ldr r3, _021E5FDC ; =ov95_021E7594
	add r2, sp, #0x18
	add r6, r0, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r5, [r6, #0x50]
	ldr r4, [r6, #0x54]
	ldr r6, [r6, #8]
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E5FE0 ; =0x00004E20
	add r1, r5, #0
	str r0, [sp, #8]
	ldr r3, [sp, #0x18]
	add r0, r4, #0
	mov r2, #0x73
	bl sub_0200D4A4
	mov r0, #0x73
	str r0, [sp]
	ldr r0, [sp, #0x1c]
	mov r1, #2
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _021E5FE4 ; =0x00004E21
	add r2, r4, #0
	str r0, [sp, #0x14]
	add r0, r6, #0
	add r3, r5, #0
	bl sub_0200D644
	mov r0, #1
	str r0, [sp]
	ldr r0, _021E5FE8 ; =0x00004E22
	add r1, r5, #0
	str r0, [sp, #4]
	ldr r3, [sp, #0x20]
	add r0, r4, #0
	mov r2, #0x73
	bl sub_0200D6D4
	mov r0, #1
	str r0, [sp]
	ldr r0, _021E5FEC ; =0x00004E23
	add r1, r5, #0
	str r0, [sp, #4]
	ldr r3, [sp, #0x24]
	add r0, r4, #0
	mov r2, #0x73
	bl sub_0200D704
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E5FF0 ; =0x000061A8
	add r1, r5, #0
	str r0, [sp, #8]
	add r0, r4, #0
	mov r2, #0x73
	mov r3, #7
	bl sub_0200D4A4
	mov r0, #0x73
	str r0, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _021E5FF4 ; =0x000061A9
	mov r1, #2
	str r0, [sp, #0x14]
	add r0, r6, #0
	add r2, r4, #0
	add r3, r5, #0
	bl sub_0200D644
	mov r0, #1
	str r0, [sp]
	ldr r0, _021E5FF8 ; =0x000061AA
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0x73
	mov r3, #6
	bl sub_0200D6D4
	mov r0, #1
	str r0, [sp]
	ldr r0, _021E5FFC ; =0x000061AB
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0x73
	mov r3, #5
	bl sub_0200D704
	add sp, #0x38
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E5FDC: .word ov95_021E7594
_021E5FE0: .word 0x00004E20
_021E5FE4: .word 0x00004E21
_021E5FE8: .word 0x00004E22
_021E5FEC: .word 0x00004E23
_021E5FF0: .word 0x000061A8
_021E5FF4: .word 0x000061A9
_021E5FF8: .word 0x000061AA
_021E5FFC: .word 0x000061AB
	thumb_func_end ov95_021E5EF8

	thumb_func_start ov95_021E6000
ov95_021E6000: ; 0x021E6000
	push {r3, r4, lr}
	sub sp, #0x34
	add r4, r0, #0
	mov r1, #0x80
	add r0, sp, #0
	strh r1, [r0]
	mov r1, #0x78
	strh r1, [r0, #2]
	mov r1, #0
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	mov r0, #1
	mov r2, #2
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	str r1, [sp, #0x30]
	ldr r1, _021E609C ; =0x00004E20
	str r0, [sp, #0x10]
	add r0, r1, #1
	str r0, [sp, #0x18]
	add r0, r1, #2
	str r0, [sp, #0x1c]
	add r0, r1, #3
	str r0, [sp, #0x20]
	sub r0, r2, #3
	str r2, [sp, #0x2c]
	str r1, [sp, #0x14]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x50]
	add r2, sp, #0
	bl sub_0200D734
	str r0, [r4, #0x74]
	bl sub_0200DC18
	ldr r0, [r4, #0x74]
	mov r1, #2
	bl sub_0200DF98
	mov r2, #0
	add r0, sp, #0
	add r1, r2, #0
	strh r2, [r0]
	sub r1, #0x10
	strh r1, [r0, #2]
	ldr r1, _021E60A0 ; =0x000061A8
	str r2, [sp, #0x2c]
	add r0, r1, #1
	str r0, [sp, #0x18]
	add r0, r1, #2
	str r0, [sp, #0x1c]
	add r0, r1, #3
	str r1, [sp, #0x14]
	str r0, [sp, #0x20]
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x50]
	add r2, sp, #0
	bl sub_0200D734
	str r0, [r4, #0x78]
	bl sub_0200DC18
	mov r1, #0x90
	add r0, sp, #0
	strh r1, [r0, #2]
	ldr r0, [r4, #0x54]
	ldr r1, [r4, #0x50]
	add r2, sp, #0
	bl sub_0200D734
	str r0, [r4, #0x7c]
	bl sub_0200DC18
	add sp, #0x34
	pop {r3, r4, pc}
	nop
_021E609C: .word 0x00004E20
_021E60A0: .word 0x000061A8
	thumb_func_end ov95_021E6000

	thumb_func_start ov95_021E60A4
ov95_021E60A4: ; 0x021E60A4
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	str r0, [sp]
	add r0, #0x80
	add r3, r1, #0
	ldr r1, [r0]
	add r4, #0x80
	cmp r1, #0
	bne _021E6132
	ldr r0, [r4, #4]
	cmp r0, #0xa
	blt _021E60C6
	add r0, r1, #1
	str r0, [r4]
	mov r0, #0
	str r0, [r4, #4]
	b _021E6132
_021E60C6:
	mov r1, #0x14
	add r7, r3, #0
	mul r7, r1
	ldr r1, _021E6140 ; =ov95_021E75DC
	ldr r2, _021E6144 ; =ov95_021E762C
	lsl r6, r0, #1
	add r1, r1, r7
	add r2, r2, r7
	ldrsh r1, [r6, r1]
	ldrsh r2, [r6, r2]
	lsl r6, r0, #2
	mov r0, #0x28
	mul r0, r3
	ldr r3, _021E6148 ; =ov95_021E76D0
	mov r5, #0
	add r3, r3, r0
	ldr r7, [r6, r3]
	ldr r3, _021E614C ; =ov95_021E7770
	add r0, r3, r0
	ldr r6, [r6, r0]
	cmp r1, #0xff
	bne _021E60F6
	add r1, r5, #0
	add r5, r5, #1
_021E60F6:
	cmp r2, #0xff
	bne _021E60FE
	mov r2, #0
	add r5, r5, #1
_021E60FE:
	ldr r0, [sp]
	ldr r0, [r0, #0x74]
	bl sub_0200DED0
	mov r0, #0
	add r1, r7, #0
	bl _fneq
	beq _021E611E
	ldr r0, [sp]
	add r1, r7, #0
	ldr r0, [r0, #0x74]
	add r2, r6, #0
	bl sub_0200E024
	b _021E6120
_021E611E:
	add r5, r5, #1
_021E6120:
	cmp r5, #3
	beq _021E612C
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _021E613A
_021E612C:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_021E6132:
	mov r0, #0
	str r0, [r4]
	str r0, [r4, #4]
	pop {r3, r4, r5, r6, r7, pc}
_021E613A:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6140: .word ov95_021E75DC
_021E6144: .word ov95_021E762C
_021E6148: .word ov95_021E76D0
_021E614C: .word ov95_021E7770
	thumb_func_end ov95_021E60A4

	thumb_func_start ov95_021E6150
ov95_021E6150: ; 0x021E6150
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov95_021E60A4
	cmp r0, #0
	bne _021E6162
	mov r0, #2
	pop {r3, r4, r5, pc}
_021E6162:
	cmp r4, #4
	bne _021E6172
	add r5, #0x84
	ldr r0, [r5]
	cmp r0, #6
	bne _021E617E
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E6172:
	add r5, #0x84
	ldr r0, [r5]
	cmp r0, #6
	bne _021E617E
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E617E:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov95_021E6150

	thumb_func_start ov95_021E6184
ov95_021E6184: ; 0x021E6184
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x74]
	bl sub_0200D9DC
	ldr r0, [r4, #0x78]
	bl sub_0200D9DC
	ldr r0, [r4, #0x7c]
	bl sub_0200D9DC
	pop {r4, pc}
	thumb_func_end ov95_021E6184

	thumb_func_start ov95_021E619C
ov95_021E619C: ; 0x021E619C
	push {r3, r4, r5, r6, lr}
	sub sp, #0x4c
	add r4, r0, #0
	mov r0, #0x46
	bl sub_0200CF18
	add r2, sp, #0x2c
	ldr r5, _021E621C ; =ov95_021E7574
	str r0, [r4, #0x50]
	ldmia r5!, {r0, r1}
	add r3, r2, #0
	stmia r2!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r5!, {r0, r1}
	ldr r6, _021E6220 ; =ov95_021E7548
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
	ldr r0, [r4, #0x50]
	mov r3, #0x20
	bl sub_0200CF70
	ldr r3, _021E6224 ; =ov95_021E755C
	add r2, sp, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r4, #0x50]
	bl sub_0200CF38
	str r0, [r4, #0x4c]
	ldr r0, [r4, #0x50]
	ldr r1, [r4, #0x4c]
	mov r2, #0xff
	bl sub_0200CFF4
	cmp r0, #0
	bne _021E6206
	bl GF_AssertFail
_021E6206:
	ldr r0, [r4, #0x50]
	ldr r1, [r4, #0x4c]
	add r2, sp, #0
	bl sub_0200D3F8
	cmp r0, #0
	bne _021E6218
	bl GF_AssertFail
_021E6218:
	add sp, #0x4c
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021E621C: .word ov95_021E7574
_021E6220: .word ov95_021E7548
_021E6224: .word ov95_021E755C
	thumb_func_end ov95_021E619C

	thumb_func_start ov95_021E6228
ov95_021E6228: ; 0x021E6228
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x50]
	ldr r1, [r4, #0x4c]
	bl sub_0200D998
	ldr r0, [r4, #0x50]
	bl sub_0200D108
	pop {r4, pc}
	thumb_func_end ov95_021E6228

	thumb_func_start ov95_021E623C
ov95_021E623C: ; 0x021E623C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #5
	ldr r4, [r0, #0xc]
	mov r2, #0
	add r0, r4, #0
	bl GetMonData
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #2
	bl sub_0207083C
	add r7, r0, #0
	mov r0, #0
	str r0, [sp, #0x10]
	add r0, r4, #0
	mov r1, #0x4c
	add r2, sp, #0x10
	bl SetMonData
	add r0, sp, #0x3c
	add r1, r4, #0
	mov r2, #2
	bl GetPokemonSpriteCharAndPlttNarcIds
	lsl r2, r6, #0x10
	ldr r0, [r5, #0x40]
	add r1, sp, #0x14
	lsr r2, r2, #0x10
	mov r3, #1
	bl sub_02072914
	mov r1, #0
	str r1, [sp]
	add r7, #0x60
	str r1, [sp, #4]
	add r0, sp, #0x14
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r5, #0x3c]
	add r1, sp, #0x3c
	mov r2, #0x80
	add r3, r7, #0
	bl sub_020085EC
	str r0, [r5, #0x70]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov95_021E623C

	thumb_func_start ov95_021E62A4
ov95_021E62A4: ; 0x021E62A4
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #5
	ldr r0, [r0, #0xc]
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl GetMonNature
	ldr r0, [r5, #0x70]
	mov r1, #1
	bl sub_02008550
	mov r0, #2
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	lsl r3, r4, #0x10
	ldr r0, [r5, #0x40]
	ldr r1, [r5, #0x58]
	ldr r2, [r5, #0x70]
	lsr r3, r3, #0x10
	bl sub_0207294C
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov95_021E62A4

	thumb_func_start ov95_021E62E4
ov95_021E62E4: ; 0x021E62E4
	ldr r3, _021E62EC ; =sub_02008780
	ldr r0, [r0, #0x70]
	bx r3
	nop
_021E62EC: .word sub_02008780
	thumb_func_end ov95_021E62E4

	thumb_func_start ov95_021E62F0
ov95_021E62F0: ; 0x021E62F0
	ldr r3, _021E62FC ; =sub_020087A4
	add r2, r1, #0
	ldr r0, [r0, #0x70]
	mov r1, #6
	bx r3
	nop
_021E62FC: .word sub_020087A4
	thumb_func_end ov95_021E62F0

	thumb_func_start ov95_021E6300
ov95_021E6300: ; 0x021E6300
	push {r3, lr}
	ldr r1, [r0, #0x5c]
	lsl r2, r1, #2
	ldr r1, _021E6310 ; =ov95_021E7810
	ldr r1, [r1, r2]
	blx r1
	pop {r3, pc}
	nop
_021E6310: .word ov95_021E7810
	thumb_func_end ov95_021E6300

	thumb_func_start ov95_021E6314
ov95_021E6314: ; 0x021E6314
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	add r4, r0, #0
	ldr r1, [r4, #0x60]
	mov r5, #1
	cmp r1, #0x11
	bls _021E6324
	b _021E6562
_021E6324:
	add r2, r1, r1
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_021E6330: ; jump table
	.short _021E6354 - _021E6330 - 2 ; case 0
	.short _021E63D2 - _021E6330 - 2 ; case 1
	.short _021E63DC - _021E6330 - 2 ; case 2
	.short _021E63FA - _021E6330 - 2 ; case 3
	.short _021E640A - _021E6330 - 2 ; case 4
	.short _021E641C - _021E6330 - 2 ; case 5
	.short _021E642C - _021E6330 - 2 ; case 6
	.short _021E643C - _021E6330 - 2 ; case 7
	.short _021E648C - _021E6330 - 2 ; case 8
	.short _021E64A0 - _021E6330 - 2 ; case 9
	.short _021E64AE - _021E6330 - 2 ; case 10
	.short _021E64D4 - _021E6330 - 2 ; case 11
	.short _021E650E - _021E6330 - 2 ; case 12
	.short _021E653C - _021E6330 - 2 ; case 13
	.short _021E6542 - _021E6330 - 2 ; case 14
	.short _021E6548 - _021E6330 - 2 ; case 15
	.short _021E6552 - _021E6330 - 2 ; case 16
	.short _021E6562 - _021E6330 - 2 ; case 17
_021E6354:
	ldr r0, [r4, #4]
	ldr r1, [r4, #8]
	bl ov95_021E5D44
	ldr r0, [r4, #4]
	ldr r1, [r4, #8]
	ldr r2, [r4, #0x14]
	bl ov95_021E5BBC
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0x3b
	str r0, [sp, #0xc]
	mov r0, #0xe
	str r0, [sp, #0x10]
	add r1, r4, #0
	ldr r0, [r4, #4]
	add r1, #0x18
	add r2, r5, #0
	mov r3, #2
	bl ov95_021E5C44
	add r0, r4, #0
	bl ov95_021E5EF8
	add r0, r4, #0
	bl ov95_021E6000
	ldr r3, _021E6594 ; =0x0000520A
	str r3, [sp]
	add r0, r3, #1
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x88
	sub r2, r3, #2
	ldr r0, [r0]
	ldr r1, [r4, #8]
	sub r3, r3, #1
	bl ov95_021E70BC
	add r0, r4, #0
	bl ov95_021E623C
	add r0, r4, #0
	add r1, r5, #0
	bl ov95_021E62F0
	mov r0, #0x46
	str r0, [sp, #0x14]
	mov r0, #0
	str r0, [sp, #0x18]
	add r0, sp, #0x14
	bl ov95_021E5E90
	str r0, [r4, #0x44]
	ldr r0, [r4, #0x60]
	add r0, r0, #1
	str r0, [r4, #0x60]
	b _021E6586
_021E63D2:
	bl ov95_021E5B7C
	ldr r0, [r4, #0x60]
	add r0, r0, #1
	str r0, [r4, #0x60]
_021E63DC:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E6412
	bl sub_02005FA0
	ldr r1, _021E6598 ; =0x000003F3
	mov r0, #0xd
	mov r2, #1
	bl sub_02004EC4
	ldr r0, [r4, #0x60]
	add r0, r0, #1
	str r0, [r4, #0x60]
	b _021E6586
_021E63FA:
	bl ov95_021E67F0
	cmp r0, #0
	bne _021E6412
	ldr r0, [r4, #0x60]
	add r0, r0, #1
	str r0, [r4, #0x60]
	b _021E6586
_021E640A:
	bl ov95_021E6838
	cmp r0, #0
	beq _021E6414
_021E6412:
	b _021E6586
_021E6414:
	ldr r0, [r4, #0x60]
	add r0, r0, #1
	str r0, [r4, #0x60]
	b _021E6586
_021E641C:
	bl ov95_021E68A8
	cmp r0, #0
	bne _021E651E
	ldr r0, [r4, #0x60]
	add r0, r0, #1
	str r0, [r4, #0x60]
	b _021E6586
_021E642C:
	bl ov95_021E6900
	cmp r0, #0
	bne _021E651E
	ldr r0, [r4, #0x60]
	add r0, r0, #1
	str r0, [r4, #0x60]
	b _021E6586
_021E643C:
	bl ov95_021E6964
	cmp r0, #0
	bne _021E651E
	add r0, r4, #0
	bl ov95_021E62A4
	ldr r0, [r4]
	mov r1, #5
	ldr r0, [r0, #0xc]
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	ldr r0, [r4]
	mov r1, #0x70
	ldr r0, [r0, #0xc]
	mov r2, #0
	bl GetMonData
	add r1, r0, #0
	lsl r0, r6, #0x10
	lsl r1, r1, #0x18
	lsr r0, r0, #0x10
	lsr r1, r1, #0x18
	bl PlayCry
	ldr r2, [r4]
	add r0, r4, #0
	ldr r2, [r2, #0xc]
	ldr r3, [r4, #0x10]
	add r0, #0x18
	mov r1, #0
	bl ov95_021E5CAC
	str r0, [r4, #0xc]
	ldr r0, [r4, #0x60]
	add r0, r0, #1
	str r0, [r4, #0x60]
	b _021E6586
_021E648C:
	bl IsCryFinished
	cmp r0, #0
	bne _021E6586
	ldr r0, _021E659C ; =0x000004A4
	bl PlayFanfare
	ldr r0, [r4, #0x60]
	add r0, r0, #1
	str r0, [r4, #0x60]
_021E64A0:
	bl IsFanfarePlaying
	cmp r0, #0
	bne _021E6586
	ldr r0, [r4, #0x60]
	add r0, r0, #1
	str r0, [r4, #0x60]
_021E64AE:
	ldr r0, [r4, #0xc]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _021E6586
	ldr r2, [r4]
	add r0, r4, #0
	ldr r2, [r2, #0xc]
	ldr r3, [r4, #0x10]
	add r0, #0x18
	mov r1, #1
	bl ov95_021E5CAC
	str r0, [r4, #0xc]
	ldr r0, [r4, #0x60]
	add r0, r0, #1
	str r0, [r4, #0x60]
_021E64D4:
	ldr r0, [r4, #0xc]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _021E6586
	ldr r0, [r4, #0x58]
	mov r1, #0
	bl sub_02017068
	cmp r0, #1
	bne _021E6586
	ldr r0, [r4, #0x70]
	bl sub_020085DC
	cmp r0, #0
	bne _021E6586
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #2
	mov r2, #3
	bl ov95_021E7208
	ldr r0, [r4, #0x60]
	add r0, r0, #1
	str r0, [r4, #0x60]
	b _021E6586
_021E650E:
	add r0, #0x88
	ldr r0, [r0]
	bl ov95_021E7258
	cmp r0, #1
	beq _021E6520
	cmp r0, #2
	beq _021E652E
_021E651E:
	b _021E6586
_021E6520:
	ldr r0, [r4]
	add r1, r5, #0
	str r1, [r0, #4]
	ldr r0, [r4, #0x60]
	add r0, r0, #1
	str r0, [r4, #0x60]
	b _021E6586
_021E652E:
	ldr r0, [r4]
	mov r1, #0
	str r1, [r0, #4]
	ldr r0, [r4, #0x60]
	add r0, r0, #1
	str r0, [r4, #0x60]
	b _021E6586
_021E653C:
	add r0, r1, #1
	str r0, [r4, #0x60]
	b _021E6586
_021E6542:
	add r0, r1, #1
	str r0, [r4, #0x60]
	b _021E6586
_021E6548:
	bl ov95_021E5B9C
	ldr r0, [r4, #0x60]
	add r0, r0, #1
	str r0, [r4, #0x60]
_021E6552:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E6586
	ldr r0, [r4, #0x60]
	add r0, r0, #1
	str r0, [r4, #0x60]
	b _021E6586
_021E6562:
	add r0, r4, #0
	bl ov95_021E62E4
	add r0, r4, #0
	bl ov95_021E6184
	add r0, r4, #0
	add r0, #0x18
	bl ov95_021E5D34
	ldr r0, [r4, #0x44]
	ldr r0, [r0, #0xc]
	bl ov95_021E5E40
	ldr r0, [r4, #0x44]
	bl ov95_021E5EF0
	mov r5, #0
_021E6586:
	ldr r0, [r4, #0x50]
	bl sub_0200D020
	add r0, r5, #0
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	nop
_021E6594: .word 0x0000520A
_021E6598: .word 0x000003F3
_021E659C: .word 0x000004A4
	thumb_func_end ov95_021E6314

	thumb_func_start ov95_021E65A0
ov95_021E65A0: ; 0x021E65A0
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	add r4, r0, #0
	ldr r1, [r4, #0x60]
	mov r5, #1
	cmp r1, #0x11
	bls _021E65B0
	b _021E67B4
_021E65B0:
	add r2, r1, r1
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_021E65BC: ; jump table
	.short _021E65E0 - _021E65BC - 2 ; case 0
	.short _021E6666 - _021E65BC - 2 ; case 1
	.short _021E6670 - _021E65BC - 2 ; case 2
	.short _021E668A - _021E65BC - 2 ; case 3
	.short _021E66D8 - _021E65BC - 2 ; case 4
	.short _021E66D8 - _021E65BC - 2 ; case 5
	.short _021E66D8 - _021E65BC - 2 ; case 6
	.short _021E66D8 - _021E65BC - 2 ; case 7
	.short _021E66DE - _021E65BC - 2 ; case 8
	.short _021E66F2 - _021E65BC - 2 ; case 9
	.short _021E6700 - _021E65BC - 2 ; case 10
	.short _021E6726 - _021E65BC - 2 ; case 11
	.short _021E6760 - _021E65BC - 2 ; case 12
	.short _021E678E - _021E65BC - 2 ; case 13
	.short _021E6794 - _021E65BC - 2 ; case 14
	.short _021E679A - _021E65BC - 2 ; case 15
	.short _021E67A4 - _021E65BC - 2 ; case 16
	.short _021E67B4 - _021E65BC - 2 ; case 17
_021E65E0:
	ldr r0, [r4, #4]
	ldr r1, [r4, #8]
	bl ov95_021E5D44
	ldr r0, [r4, #4]
	ldr r1, [r4, #8]
	ldr r2, [r4, #0x14]
	bl ov95_021E5BBC
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0x3b
	str r0, [sp, #0xc]
	mov r0, #0xe
	str r0, [sp, #0x10]
	add r1, r4, #0
	ldr r0, [r4, #4]
	add r1, #0x18
	add r2, r5, #0
	mov r3, #2
	bl ov95_021E5C44
	add r0, r4, #0
	bl ov95_021E5EF8
	add r0, r4, #0
	bl ov95_021E6000
	ldr r0, [r4, #0x74]
	mov r1, #0
	bl sub_0200DCE8
	ldr r3, _021E67E4 ; =0x0000520A
	str r3, [sp]
	add r0, r3, #1
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x88
	sub r2, r3, #2
	ldr r0, [r0]
	ldr r1, [r4, #8]
	sub r3, r3, #1
	bl ov95_021E70BC
	add r0, r4, #0
	bl ov95_021E623C
	add r0, r4, #0
	add r1, r5, #0
	bl ov95_021E62F0
	mov r0, #0x46
	str r0, [sp, #0x14]
	add r0, r5, #0
	str r0, [sp, #0x18]
	add r0, sp, #0x14
	bl ov95_021E5E90
	str r0, [r4, #0x44]
	ldr r0, [r4, #0x60]
	add r0, r0, #1
	str r0, [r4, #0x60]
	b _021E67D8
_021E6666:
	bl ov95_021E5B7C
	ldr r0, [r4, #0x60]
	add r0, r0, #1
	str r0, [r4, #0x60]
_021E6670:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E6770
	ldr r1, _021E67E8 ; =0x000003F3
	mov r0, #0xd
	mov r2, #1
	bl sub_02004EC4
	ldr r0, [r4, #0x60]
	add r0, r0, #1
	str r0, [r4, #0x60]
	b _021E67D8
_021E668A:
	bl ov95_021E6B74
	cmp r0, #0
	bne _021E6770
	add r0, r4, #0
	bl ov95_021E62A4
	ldr r0, [r4]
	mov r1, #5
	ldr r0, [r0, #0xc]
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	ldr r0, [r4]
	mov r1, #0x70
	ldr r0, [r0, #0xc]
	mov r2, #0
	bl GetMonData
	add r1, r0, #0
	lsl r0, r6, #0x10
	lsl r1, r1, #0x18
	lsr r0, r0, #0x10
	lsr r1, r1, #0x18
	bl PlayCry
	ldr r2, [r4]
	add r0, r4, #0
	ldr r2, [r2, #0xc]
	ldr r3, [r4, #0x10]
	add r0, #0x18
	mov r1, #0
	bl ov95_021E5CAC
	str r0, [r4, #0xc]
	mov r0, #8
	str r0, [r4, #0x60]
	b _021E67D8
_021E66D8:
	bl GF_AssertFail
	b _021E67D8
_021E66DE:
	bl IsCryFinished
	cmp r0, #0
	bne _021E67D8
	ldr r0, _021E67EC ; =0x000004A4
	bl PlayFanfare
	ldr r0, [r4, #0x60]
	add r0, r0, #1
	str r0, [r4, #0x60]
_021E66F2:
	bl IsFanfarePlaying
	cmp r0, #0
	bne _021E67D8
	ldr r0, [r4, #0x60]
	add r0, r0, #1
	str r0, [r4, #0x60]
_021E6700:
	ldr r0, [r4, #0xc]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _021E67D8
	ldr r2, [r4]
	add r0, r4, #0
	ldr r2, [r2, #0xc]
	ldr r3, [r4, #0x10]
	add r0, #0x18
	mov r1, #1
	bl ov95_021E5CAC
	str r0, [r4, #0xc]
	ldr r0, [r4, #0x60]
	add r0, r0, #1
	str r0, [r4, #0x60]
_021E6726:
	ldr r0, [r4, #0xc]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _021E67D8
	ldr r0, [r4, #0x58]
	mov r1, #0
	bl sub_02017068
	cmp r0, #1
	bne _021E67D8
	ldr r0, [r4, #0x70]
	bl sub_020085DC
	cmp r0, #0
	bne _021E67D8
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #2
	mov r2, #3
	bl ov95_021E7208
	ldr r0, [r4, #0x60]
	add r0, r0, #1
	str r0, [r4, #0x60]
	b _021E67D8
_021E6760:
	add r0, #0x88
	ldr r0, [r0]
	bl ov95_021E7258
	cmp r0, #1
	beq _021E6772
	cmp r0, #2
	beq _021E6780
_021E6770:
	b _021E67D8
_021E6772:
	ldr r0, [r4]
	add r1, r5, #0
	str r1, [r0, #4]
	ldr r0, [r4, #0x60]
	add r0, r0, #1
	str r0, [r4, #0x60]
	b _021E67D8
_021E6780:
	ldr r0, [r4]
	mov r1, #0
	str r1, [r0, #4]
	ldr r0, [r4, #0x60]
	add r0, r0, #1
	str r0, [r4, #0x60]
	b _021E67D8
_021E678E:
	add r0, r1, #1
	str r0, [r4, #0x60]
	b _021E67D8
_021E6794:
	add r0, r1, #1
	str r0, [r4, #0x60]
	b _021E67D8
_021E679A:
	bl ov95_021E5B9C
	ldr r0, [r4, #0x60]
	add r0, r0, #1
	str r0, [r4, #0x60]
_021E67A4:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E67D8
	ldr r0, [r4, #0x60]
	add r0, r0, #1
	str r0, [r4, #0x60]
	b _021E67D8
_021E67B4:
	add r0, r4, #0
	bl ov95_021E62E4
	add r0, r4, #0
	bl ov95_021E6184
	add r0, r4, #0
	add r0, #0x18
	bl ov95_021E5D34
	ldr r0, [r4, #0x44]
	ldr r0, [r0, #0xc]
	bl ov95_021E5E40
	ldr r0, [r4, #0x44]
	bl ov95_021E5EF0
	mov r5, #0
_021E67D8:
	ldr r0, [r4, #0x50]
	bl sub_0200D020
	add r0, r5, #0
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021E67E4: .word 0x0000520A
_021E67E8: .word 0x000003F3
_021E67EC: .word 0x000004A4
	thumb_func_end ov95_021E65A0

	thumb_func_start ov95_021E67F0
ov95_021E67F0: ; 0x021E67F0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x68]
	cmp r0, #0
	beq _021E6800
	cmp r0, #1
	beq _021E6810
	b _021E6828
_021E6800:
	ldr r0, [r4, #0x74]
	mov r1, #0
	bl sub_0200DCC0
	ldr r0, [r4, #0x68]
	add r0, r0, #1
	str r0, [r4, #0x68]
	b _021E6830
_021E6810:
	ldr r0, [r4, #0x64]
	add r0, r0, #1
	str r0, [r4, #0x64]
	cmp r0, #0x19
	blt _021E6830
	ldr r0, _021E6834 ; =0x00000714
	bl PlaySE
	ldr r0, [r4, #0x68]
	add r0, r0, #1
	str r0, [r4, #0x68]
	b _021E6830
_021E6828:
	mov r0, #0
	str r0, [r4, #0x68]
	str r0, [r4, #0x64]
	pop {r4, pc}
_021E6830:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_021E6834: .word 0x00000714
	thumb_func_end ov95_021E67F0

	thumb_func_start ov95_021E6838
ov95_021E6838: ; 0x021E6838
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x68]
	cmp r1, #0
	beq _021E6848
	cmp r1, #1
	beq _021E6862
	b _021E6886
_021E6848:
	ldr r0, [r4, #0x44]
	bl ov95_021E5EDC
	cmp r0, #1
	beq _021E68A0
	ldr r0, [r4, #0x74]
	mov r1, #1
	bl sub_0200DCC0
	ldr r0, [r4, #0x68]
	add r0, r0, #1
	str r0, [r4, #0x68]
	b _021E68A0
_021E6862:
	mov r1, #0
	bl ov95_021E6150
	cmp r0, #2
	bne _021E68A0
	ldr r0, _021E68A4 ; =0x00000714
	bl PlaySE
	ldr r0, [r4, #0x74]
	mov r1, #2
	bl sub_0200DCC0
	ldr r0, [r4, #0x68]
	add r0, r0, #1
	str r0, [r4, #0x68]
	mov r0, #0
	str r0, [r4, #0x64]
	b _021E68A0
_021E6886:
	mov r1, #0
	bl ov95_021E6150
	cmp r0, #2
	bne _021E68A0
	ldr r0, [r4, #0x74]
	mov r1, #2
	bl sub_0200DCC0
	mov r0, #0
	str r0, [r4, #0x68]
	str r0, [r4, #0x64]
	pop {r4, pc}
_021E68A0:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_021E68A4: .word 0x00000714
	thumb_func_end ov95_021E6838

	thumb_func_start ov95_021E68A8
ov95_021E68A8: ; 0x021E68A8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x68]
	cmp r1, #0
	beq _021E68B8
	cmp r1, #1
	beq _021E68BE
	b _021E68F0
_021E68B8:
	add r0, r1, #1
	str r0, [r4, #0x68]
	b _021E68F8
_021E68BE:
	mov r1, #1
	bl ov95_021E6150
	add r5, r0, #0
	cmp r5, #1
	bne _021E68E0
	ldr r0, _021E68FC ; =0x00000714
	bl PlaySE
	ldr r0, [r4, #0x74]
	mov r1, #3
	bl sub_0200DCC0
	ldr r0, [r4, #0x44]
	mov r1, #0
	bl ov95_021E5EC0
_021E68E0:
	cmp r5, #2
	bne _021E68F8
	mov r0, #0
	str r0, [r4, #0x64]
	ldr r0, [r4, #0x68]
	add r0, r0, #1
	str r0, [r4, #0x68]
	b _021E68F8
_021E68F0:
	mov r0, #0
	str r0, [r4, #0x68]
	str r0, [r4, #0x64]
	pop {r3, r4, r5, pc}
_021E68F8:
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E68FC: .word 0x00000714
	thumb_func_end ov95_021E68A8

	thumb_func_start ov95_021E6900
ov95_021E6900: ; 0x021E6900
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x68]
	cmp r1, #0
	beq _021E6910
	cmp r1, #1
	beq _021E6922
	b _021E6954
_021E6910:
	ldr r0, [r4, #0x44]
	bl ov95_021E5EDC
	cmp r0, #1
	beq _021E695C
	ldr r0, [r4, #0x68]
	add r0, r0, #1
	str r0, [r4, #0x68]
	b _021E695C
_021E6922:
	mov r1, #2
	bl ov95_021E6150
	add r5, r0, #0
	cmp r5, #1
	bne _021E6944
	ldr r0, _021E6960 ; =0x00000714
	bl PlaySE
	ldr r0, [r4, #0x74]
	mov r1, #4
	bl sub_0200DCC0
	ldr r0, [r4, #0x44]
	mov r1, #1
	bl ov95_021E5EC0
_021E6944:
	cmp r5, #2
	bne _021E695C
	mov r0, #0
	str r0, [r4, #0x64]
	ldr r0, [r4, #0x68]
	add r0, r0, #1
	str r0, [r4, #0x68]
	b _021E695C
_021E6954:
	mov r0, #0
	str r0, [r4, #0x68]
	str r0, [r4, #0x64]
	pop {r3, r4, r5, pc}
_021E695C:
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E6960: .word 0x00000714
	thumb_func_end ov95_021E6900

	thumb_func_start ov95_021E6964
ov95_021E6964: ; 0x021E6964
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r1, [r4, #0x68]
	cmp r1, #5
	bls _021E6972
	b _021E6B50
_021E6972:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E697E: ; jump table
	.short _021E698A - _021E697E - 2 ; case 0
	.short _021E69AC - _021E697E - 2 ; case 1
	.short _021E69EE - _021E697E - 2 ; case 2
	.short _021E6A56 - _021E697E - 2 ; case 3
	.short _021E6AE8 - _021E697E - 2 ; case 4
	.short _021E6B34 - _021E697E - 2 ; case 5
_021E698A:
	ldr r0, [r4, #0x44]
	bl ov95_021E5EDC
	cmp r0, #1
	beq _021E69F8
	ldr r0, [r4, #0x74]
	mov r1, #4
	bl sub_0200DCC0
	mov r0, #2
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, [r4, #0x68]
	add r0, r0, #1
	str r0, [r4, #0x68]
	b _021E6B64
_021E69AC:
	mov r1, #3
	bl ov95_021E6150
	add r5, r0, #0
	cmp r5, #1
	bne _021E69D6
	ldr r0, [r4, #0x74]
	mov r1, #5
	bl sub_0200DCC0
	ldr r0, _021E6B6C ; =0x00000707
	bl PlaySE
	ldr r0, [r4, #0x44]
	mov r1, #2
	bl ov95_021E5EC0
	ldr r0, [r4, #0x44]
	mov r1, #3
	bl ov95_021E5EC0
_021E69D6:
	cmp r5, #2
	bne _021E69F8
	ldr r0, [r4, #0x74]
	mov r1, #0
	bl sub_0200DCE8
	mov r0, #0
	str r0, [r4, #0x64]
	ldr r0, [r4, #0x68]
	add r0, r0, #1
	str r0, [r4, #0x68]
	b _021E6B64
_021E69EE:
	ldr r0, [r4, #0x64]
	add r0, r0, #1
	str r0, [r4, #0x64]
	cmp r0, #0xa
	bge _021E69FA
_021E69F8:
	b _021E6B64
_021E69FA:
	mov r3, #0
	str r3, [r4, #0x64]
	str r3, [sp]
	mov r0, #0x10
	ldr r2, _021E6B70 ; =0x0000FFFF
	str r0, [sp, #4]
	str r2, [sp, #8]
	ldr r0, [r4, #8]
	mov r1, #1
	bl sub_02003370
	ldr r0, [r4, #0x78]
	ldr r0, [r0]
	bl sub_02024B34
	mov r1, #1
	bl sub_02022808
	add r5, r0, #0
	mov r3, #0
	mov r6, #1
	str r3, [sp]
	mov r0, #0x10
	ldr r2, _021E6B70 ; =0x0000FFFF
	str r0, [sp, #4]
	str r2, [sp, #8]
	lsl r6, r5
	eor r2, r6
	lsl r2, r2, #0x10
	ldr r0, [r4, #8]
	mov r1, #4
	lsr r2, r2, #0x10
	bl sub_02003370
	ldr r0, _021E6B70 ; =0x0000FFFF
	mov r1, #0
	str r0, [sp]
	ldr r0, [r4, #0x70]
	mov r2, #0x10
	add r3, r1, #0
	bl sub_020090B4
	ldr r0, [r4, #0x68]
	add r0, r0, #1
	str r0, [r4, #0x68]
	b _021E6B64
_021E6A56:
	add r1, sp, #0xc
	ldr r0, [r4, #0x78]
	mov r5, #0
	add r1, #2
	add r2, sp, #0xc
	bl sub_0200DE44
	add r0, sp, #0xc
	add r1, r5, #0
	ldrsh r2, [r0, r1]
	add r0, r1, #0
	sub r0, #0x30
	cmp r2, r0
	ble _021E6A7C
	ldr r0, [r4, #0x78]
	sub r2, r1, #4
	bl sub_0200DED0
	b _021E6A7E
_021E6A7C:
	add r5, r5, #1
_021E6A7E:
	add r1, sp, #0xc
	ldr r0, [r4, #0x7c]
	add r1, #2
	add r2, sp, #0xc
	bl sub_0200DE44
	add r0, sp, #0xc
	mov r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0xc0
	bge _021E6A9E
	ldr r0, [r4, #0x7c]
	mov r2, #4
	bl sub_0200DED0
	b _021E6AA0
_021E6A9E:
	add r5, r5, #1
_021E6AA0:
	ldr r0, [r4, #8]
	bl sub_02003B44
	cmp r0, #0
	bne _021E6B64
	cmp r5, #2
	bne _021E6B64
	ldr r0, [r4, #0x70]
	bl sub_02009138
	cmp r0, #0
	bne _021E6B64
	mov r0, #2
	mov r1, #1
	bl GX_EngineAToggleLayers
	add r0, r4, #0
	mov r1, #0
	bl ov95_021E62F0
	ldr r0, [r4, #0x74]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r4, #0x78]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r4, #0x7c]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r4, #0x68]
	add r0, r0, #1
	str r0, [r4, #0x68]
	b _021E6B64
_021E6AE8:
	ldr r0, [r4, #0x64]
	add r0, r0, #1
	str r0, [r4, #0x64]
	cmp r0, #0x19
	blt _021E6B64
	mov r2, #0
	ldr r0, _021E6B70 ; =0x0000FFFF
	str r2, [r4, #0x64]
	str r0, [sp]
	ldr r0, [r4, #0x70]
	mov r1, #0x10
	add r3, r2, #0
	bl sub_020090B4
	mov r0, #0x10
	str r0, [sp]
	mov r3, #0
	ldr r2, _021E6B70 ; =0x0000FFFF
	str r3, [sp, #4]
	str r2, [sp, #8]
	ldr r0, [r4, #8]
	mov r1, #1
	bl sub_02003370
	mov r0, #0x10
	str r0, [sp]
	mov r3, #0
	ldr r2, _021E6B70 ; =0x0000FFFF
	str r3, [sp, #4]
	str r2, [sp, #8]
	ldr r0, [r4, #8]
	mov r1, #4
	bl sub_02003370
	ldr r0, [r4, #0x68]
	add r0, r0, #1
	str r0, [r4, #0x68]
	b _021E6B64
_021E6B34:
	ldr r0, [r4, #8]
	bl sub_02003B44
	cmp r0, #0
	bne _021E6B64
	ldr r0, [r4, #0x70]
	bl sub_02009138
	cmp r0, #0
	bne _021E6B64
	ldr r0, [r4, #0x68]
	add r0, r0, #1
	str r0, [r4, #0x68]
	b _021E6B64
_021E6B50:
	ldr r0, [r4, #0x44]
	bl ov95_021E5EDC
	cmp r0, #1
	beq _021E6B64
	mov r0, #0
	str r0, [r4, #0x68]
	add sp, #0x10
	str r0, [r4, #0x64]
	pop {r4, r5, r6, pc}
_021E6B64:
	mov r0, #1
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021E6B6C: .word 0x00000707
_021E6B70: .word 0x0000FFFF
	thumb_func_end ov95_021E6964

	thumb_func_start ov95_021E6B74
ov95_021E6B74: ; 0x021E6B74
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r0, [r4, #0x68]
	cmp r0, #4
	bls _021E6B82
	b _021E6D50
_021E6B82:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E6B8E: ; jump table
	.short _021E6B98 - _021E6B8E - 2 ; case 0
	.short _021E6BC8 - _021E6B8E - 2 ; case 1
	.short _021E6C56 - _021E6B8E - 2 ; case 2
	.short _021E6CE8 - _021E6B8E - 2 ; case 3
	.short _021E6D34 - _021E6B8E - 2 ; case 4
_021E6B98:
	ldr r0, [r4, #0x44]
	mov r1, #0
	bl ov95_021E5EC0
	ldr r0, [r4, #0x44]
	mov r1, #1
	bl ov95_021E5EC0
	ldr r0, [r4, #0x44]
	mov r1, #2
	bl ov95_021E5EC0
	ldr r0, [r4, #0x44]
	mov r1, #3
	bl ov95_021E5EC0
	mov r0, #2
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, [r4, #0x68]
	add r0, r0, #1
	str r0, [r4, #0x68]
	b _021E6D5A
_021E6BC8:
	ldr r0, [r4, #0x64]
	cmp r0, #0x19
	beq _021E6BD8
	cmp r0, #0x50
	beq _021E6BE0
	cmp r0, #0x8e
	beq _021E6BE8
	b _021E6BEE
_021E6BD8:
	ldr r0, _021E6D60 ; =0x00000806
	bl PlaySE
	b _021E6BEE
_021E6BE0:
	ldr r0, _021E6D64 ; =0x000007AA
	bl PlaySE
	b _021E6BEE
_021E6BE8:
	ldr r0, _021E6D68 ; =0x00000815
	bl PlaySE
_021E6BEE:
	ldr r0, [r4, #0x64]
	add r0, r0, #1
	str r0, [r4, #0x64]
	cmp r0, #0xa0
	bge _021E6BFA
	b _021E6D5A
_021E6BFA:
	mov r3, #0
	str r3, [r4, #0x64]
	str r3, [sp]
	mov r0, #0x10
	ldr r2, _021E6D6C ; =0x0000FFFF
	str r0, [sp, #4]
	str r2, [sp, #8]
	ldr r0, [r4, #8]
	mov r1, #1
	bl sub_02003370
	ldr r0, [r4, #0x78]
	ldr r0, [r0]
	bl sub_02024B34
	mov r1, #1
	bl sub_02022808
	add r5, r0, #0
	mov r3, #0
	mov r6, #1
	str r3, [sp]
	mov r0, #0x10
	ldr r2, _021E6D6C ; =0x0000FFFF
	str r0, [sp, #4]
	str r2, [sp, #8]
	lsl r6, r5
	eor r2, r6
	lsl r2, r2, #0x10
	ldr r0, [r4, #8]
	mov r1, #4
	lsr r2, r2, #0x10
	bl sub_02003370
	ldr r0, _021E6D6C ; =0x0000FFFF
	mov r1, #0
	str r0, [sp]
	ldr r0, [r4, #0x70]
	mov r2, #0x10
	add r3, r1, #0
	bl sub_020090B4
	ldr r0, [r4, #0x68]
	add r0, r0, #1
	str r0, [r4, #0x68]
	b _021E6D5A
_021E6C56:
	add r1, sp, #0xc
	ldr r0, [r4, #0x78]
	mov r5, #0
	add r1, #2
	add r2, sp, #0xc
	bl sub_0200DE44
	add r0, sp, #0xc
	add r1, r5, #0
	ldrsh r2, [r0, r1]
	add r0, r1, #0
	sub r0, #0x30
	cmp r2, r0
	ble _021E6C7C
	ldr r0, [r4, #0x78]
	sub r2, r1, #4
	bl sub_0200DED0
	b _021E6C7E
_021E6C7C:
	add r5, r5, #1
_021E6C7E:
	add r1, sp, #0xc
	ldr r0, [r4, #0x7c]
	add r1, #2
	add r2, sp, #0xc
	bl sub_0200DE44
	add r0, sp, #0xc
	mov r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0xc0
	bge _021E6C9E
	ldr r0, [r4, #0x7c]
	mov r2, #4
	bl sub_0200DED0
	b _021E6CA0
_021E6C9E:
	add r5, r5, #1
_021E6CA0:
	ldr r0, [r4, #8]
	bl sub_02003B44
	cmp r0, #0
	bne _021E6D5A
	cmp r5, #2
	bne _021E6D5A
	ldr r0, [r4, #0x70]
	bl sub_02009138
	cmp r0, #0
	bne _021E6D5A
	add r0, r4, #0
	mov r1, #0
	bl ov95_021E62F0
	mov r0, #2
	mov r1, #1
	bl GX_EngineAToggleLayers
	ldr r0, [r4, #0x74]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r4, #0x78]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r4, #0x7c]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r4, #0x68]
	add r0, r0, #1
	str r0, [r4, #0x68]
	b _021E6D5A
_021E6CE8:
	ldr r0, [r4, #0x64]
	add r0, r0, #1
	str r0, [r4, #0x64]
	cmp r0, #0x19
	blt _021E6D5A
	mov r2, #0
	ldr r0, _021E6D6C ; =0x0000FFFF
	str r2, [r4, #0x64]
	str r0, [sp]
	ldr r0, [r4, #0x70]
	mov r1, #0x10
	add r3, r2, #0
	bl sub_020090B4
	mov r0, #0x10
	str r0, [sp]
	mov r3, #0
	ldr r2, _021E6D6C ; =0x0000FFFF
	str r3, [sp, #4]
	str r2, [sp, #8]
	ldr r0, [r4, #8]
	mov r1, #1
	bl sub_02003370
	mov r0, #0x10
	str r0, [sp]
	mov r3, #0
	ldr r2, _021E6D6C ; =0x0000FFFF
	str r3, [sp, #4]
	str r2, [sp, #8]
	ldr r0, [r4, #8]
	mov r1, #4
	bl sub_02003370
	ldr r0, [r4, #0x68]
	add r0, r0, #1
	str r0, [r4, #0x68]
	b _021E6D5A
_021E6D34:
	ldr r0, [r4, #8]
	bl sub_02003B44
	cmp r0, #0
	bne _021E6D5A
	ldr r0, [r4, #0x70]
	bl sub_02009138
	cmp r0, #0
	bne _021E6D5A
	ldr r0, [r4, #0x68]
	add r0, r0, #1
	str r0, [r4, #0x68]
	b _021E6D5A
_021E6D50:
	mov r0, #0
	str r0, [r4, #0x68]
	add sp, #0x10
	str r0, [r4, #0x64]
	pop {r4, r5, r6, pc}
_021E6D5A:
	mov r0, #1
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E6D60: .word 0x00000806
_021E6D64: .word 0x000007AA
_021E6D68: .word 0x00000815
_021E6D6C: .word 0x0000FFFF
	thumb_func_end ov95_021E6B74

	thumb_func_start ov95_021E6D70
ov95_021E6D70: ; 0x021E6D70
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	mov r2, #1
	mov r0, #3
	mov r1, #0x46
	lsl r2, r2, #0x12
	bl CreateHeap
	add r0, r5, #0
	mov r1, #0x8c
	mov r2, #0x46
	bl OverlayManager_CreateAndGetData
	mov r1, #0
	mov r2, #0x8c
	add r4, r0, #0
	bl memset
	add r0, r5, #0
	bl OverlayManager_GetParentWork
	str r0, [r4]
	ldr r0, [r0, #0x10]
	bl Options_GetTextFrameDelay
	str r0, [r4, #0x10]
	ldr r0, [r4]
	ldr r0, [r0, #0x10]
	bl Options_GetFrame
	str r0, [r4, #0x14]
	bl ov95_021E5954
	str r0, [r4, #0x38]
	mov r0, #0x46
	bl sub_02007FD4
	str r0, [r4, #0x3c]
	mov r0, #0xb4
	mov r1, #0x46
	bl NARC_ctor
	str r0, [r4, #0x40]
	mov r0, #0x46
	bl BgConfig_Alloc
	str r0, [r4, #4]
	mov r0, #0x40
	mov r1, #0x46
	bl GF_CreateVramTransferManager
	mov r0, #0x46
	mov r1, #1
	mov r2, #0
	bl sub_02016EDC
	str r0, [r4, #0x58]
	mov r0, #0x46
	bl sub_020030E8
	mov r1, #1
	str r0, [r4, #8]
	bl sub_02003B50
	mov r2, #2
	ldr r0, [r4, #8]
	mov r1, #0
	lsl r2, r2, #8
	mov r3, #0x46
	bl PaletteData_AllocBuffers
	mov r1, #2
	ldr r0, [r4, #8]
	lsl r2, r1, #8
	mov r3, #0x46
	bl PaletteData_AllocBuffers
	mov r1, #1
	ldr r0, [r4, #8]
	lsl r2, r1, #9
	mov r3, #0x46
	bl PaletteData_AllocBuffers
	mov r0, #1
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xf0
	str r0, [sp, #8]
	ldr r0, [r4, #8]
	mov r1, #0x10
	mov r2, #9
	mov r3, #0x46
	bl PaletteData_LoadNarc
	bl ov95_021E5900
	bl ov95_021E5928
	bl ov95_021E59F8
	ldr r0, [r4, #4]
	bl ov95_021E5A38
	ldr r0, [r4, #4]
	bl ov95_021E6FC4
	add r0, r4, #4
	bl ov95_021E619C
	mov r0, #1
	bl sub_02002B8C
	ldr r0, [r4, #4]
	ldr r1, [r4, #0x54]
	ldr r2, [r4, #0x50]
	mov r3, #0x46
	bl ov95_021E7020
	add r1, r4, #0
	add r1, #0x88
	str r0, [r1]
	bl sub_02005FA0
	ldr r0, _021E6E84 ; =ov95_021E5B24
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_021E6E84: .word ov95_021E5B24
	thumb_func_end ov95_021E6D70

	thumb_func_start ov95_021E6E88
ov95_021E6E88: ; 0x021E6E88
	push {r3, r4, r5, lr}
	add r4, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r4]
	add r5, r0, #0
	cmp r1, #0
	beq _021E6E9E
	cmp r1, #1
	beq _021E6EDC
	b _021E6EF8
_021E6E9E:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E6EAC
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_021E6EAC:
	ldr r0, [r5]
	mov r1, #5
	ldr r0, [r0, #0xc]
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	add r1, r5, #0
	lsl r2, r4, #0x10
	ldr r0, [r5, #0x40]
	add r1, #0x6c
	lsr r2, r2, #0x10
	mov r3, #1
	bl sub_020729A4
	ldr r0, _021E6F08 ; =0x000001EA
	cmp r4, r0
	bne _021E6ED6
	mov r0, #1
	str r0, [r5, #0x5c]
	b _021E6F04
_021E6ED6:
	mov r0, #0
	str r0, [r5, #0x5c]
	b _021E6F04
_021E6EDC:
	bl ov95_021E6300
	cmp r0, #0
	bne _021E6EEC
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021E6F04
_021E6EEC:
	ldr r0, [r5, #0x3c]
	bl sub_02008120
	bl ov95_021E5B58
	b _021E6F04
_021E6EF8:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E6F04
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E6F04:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E6F08: .word 0x000001EA
	thumb_func_end ov95_021E6E88

	thumb_func_start ov95_021E6F0C
ov95_021E6F0C: ; 0x021E6F0C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	add r0, #0x88
	ldr r0, [r0]
	bl ov95_021E7078
	ldr r0, [r4, #0x38]
	bl GF_3DVramMan_Delete
	mov r0, #1
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #2
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #3
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	ldr r0, [r4, #8]
	mov r1, #0
	bl PaletteData_FreeBuffers
	ldr r0, [r4, #8]
	mov r1, #2
	bl PaletteData_FreeBuffers
	ldr r0, [r4, #8]
	mov r1, #1
	bl PaletteData_FreeBuffers
	ldr r0, [r4, #8]
	bl sub_02003104
	mov r0, #0
	bl sub_02002B8C
	ldr r0, [r4, #4]
	mov r1, #1
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #4]
	mov r1, #2
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #4]
	mov r1, #3
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #4]
	bl FreeToHeap
	bl GF_DestroyVramTransferManager
	ldr r0, [r4, #0x3c]
	bl sub_02008524
	ldr r0, [r4, #0x58]
	bl sub_02016F2C
	ldr r0, [r4, #0x40]
	bl NARC_dtor
	add r0, r4, #4
	bl ov95_021E6228
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0x46
	bl DestroyHeap
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl sub_0203E354
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov95_021E6F0C

	thumb_func_start ov95_021E6FC4
ov95_021E6FC4: ; 0x021E6FC4
	push {r4, r5, lr}
	sub sp, #0x54
	ldr r5, _021E701C ; =ov95_021E7860
	add r4, r0, #0
	add r3, sp, #0
	mov r2, #0xa
_021E6FD0:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E6FD0
	ldr r0, [r5]
	mov r1, #4
	str r0, [r3]
	add r0, r4, #0
	add r2, sp, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #5
	add r2, sp, #0x1c
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #6
	add r2, sp, #0x38
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	add sp, #0x54
	pop {r4, r5, pc}
	.balign 4, 0
_021E701C: .word ov95_021E7860
	thumb_func_end ov95_021E6FC4

	thumb_func_start ov95_021E7020
ov95_021E7020: ; 0x021E7020
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	str r3, [sp]
	cmp r5, #0
	bne _021E7032
	bl GF_AssertFail
_021E7032:
	cmp r6, #0
	bne _021E703A
	bl GF_AssertFail
_021E703A:
	cmp r7, #0
	bne _021E7042
	bl GF_AssertFail
_021E7042:
	ldr r0, [sp]
	mov r1, #0x3c
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x3c
	add r4, r0, #0
	bl MI_CpuFill8
	ldr r0, [sp]
	str r0, [r4]
	str r5, [r4, #0xc]
	str r6, [r4, #4]
	str r7, [r4, #8]
	bl ScrStrBufs_new
	str r0, [r4, #0x14]
	ldr r1, [r4]
	mov r0, #4
	bl FontID_Alloc
	add r0, r4, #0
	bl ov95_021E72B8
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov95_021E7020

	thumb_func_start ov95_021E7078
ov95_021E7078: ; 0x021E7078
	push {r4, lr}
	add r4, r0, #0
	bne _021E7082
	bl GF_AssertFail
_021E7082:
	add r0, r4, #0
	bl ov95_021E7308
	add r0, r4, #0
	bl ov95_021E7404
	mov r0, #4
	bl FontID_Release
	ldr r0, [r4, #0x14]
	bl ScrStrBufs_delete
	ldr r0, [r4, #0xc]
	mov r1, #4
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0xc]
	mov r1, #5
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0xc]
	mov r1, #6
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov95_021E7078

	thumb_func_start ov95_021E70BC
ov95_021E70BC: ; 0x021E70BC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	str r1, [sp, #0x10]
	str r2, [sp, #0x14]
	str r3, [sp, #0x18]
	ldr r7, [r5, #4]
	ldr r6, [r5, #8]
	bne _021E70D2
	bl GF_AssertFail
_021E70D2:
	cmp r7, #0
	bne _021E70DA
	bl GF_AssertFail
_021E70DA:
	cmp r6, #0
	bne _021E70E2
	bl GF_AssertFail
_021E70E2:
	ldr r1, [r5]
	mov r0, #0xef
	bl NARC_ctor
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	ldr r0, [sp, #0x18]
	add r1, r6, #0
	str r0, [sp, #0xc]
	add r0, r7, #0
	add r2, r4, #0
	mov r3, #0xb
	bl sub_0200D5D4
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	add r1, r6, #0
	str r0, [sp, #8]
	add r0, r7, #0
	add r2, r4, #0
	mov r3, #0xc
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x30]
	add r1, r6, #0
	str r0, [sp, #4]
	add r0, r7, #0
	add r2, r4, #0
	mov r3, #0xd
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x34]
	add r1, r6, #0
	str r0, [sp, #4]
	add r0, r7, #0
	add r2, r4, #0
	mov r3, #0xe
	bl sub_0200D71C
	ldr r0, [sp, #0x34]
	ldr r1, [sp, #0x14]
	str r0, [sp]
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x30]
	add r0, r5, #0
	bl ov95_021E7388
	mov r0, #1
	str r0, [sp]
	mov r0, #0xa0
	str r0, [sp, #4]
	mov r2, #0
	ldr r0, [sp, #0x10]
	mov r1, #0xef
	mov r3, #0x46
	str r2, [sp, #8]
	bl PaletteData_LoadNarc
	mov r0, #1
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xf0
	str r0, [sp, #8]
	ldr r0, [sp, #0x10]
	mov r1, #0x10
	mov r2, #9
	mov r3, #0x46
	bl PaletteData_LoadNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x46
	str r0, [sp, #0xc]
	ldr r2, [r5, #0xc]
	add r0, r4, #0
	mov r1, #1
	mov r3, #4
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x46
	str r0, [sp, #0xc]
	ldr r2, [r5, #0xc]
	add r0, r4, #0
	mov r1, #9
	mov r3, #4
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x46
	str r0, [sp, #0xc]
	ldr r2, [r5, #0xc]
	add r0, r4, #0
	mov r1, #1
	mov r3, #5
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x46
	str r0, [sp, #0xc]
	ldr r2, [r5, #0xc]
	add r0, r4, #0
	mov r1, #0xa
	mov r3, #5
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #5
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #6
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	add r0, r4, #0
	bl NARC_dtor
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov95_021E70BC

	thumb_func_start ov95_021E7208
ov95_021E7208: ; 0x021E7208
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r3, r1, #0
	add r1, r4, #0
	add r5, r2, #0
	add r1, #0x1c
	add r2, r3, #0
	bl ov95_021E7328
	add r1, r4, #0
	add r0, r4, #0
	add r1, #0x2c
	add r2, r5, #0
	bl ov95_021E7328
	mov r0, #0
	strb r0, [r4, #0x18]
	mov r0, #1
	strb r0, [r4, #0x19]
	add r0, r4, #0
	bl ov95_021E7410
	mov r0, #5
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #6
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl sub_0200DCE8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov95_021E7208

	thumb_func_start ov95_021E7258
ov95_021E7258: ; 0x021E7258
	push {r4, lr}
	add r4, r0, #0
	ldrb r1, [r4, #0x18]
	cmp r1, #0
	beq _021E7268
	cmp r1, #1
	beq _021E7278
	b _021E72AE
_021E7268:
	bl ov95_021E7450
	cmp r0, #0
	beq _021E72B2
	ldrb r0, [r4, #0x18]
	add r0, r0, #1
	strb r0, [r4, #0x18]
	b _021E72B2
_021E7278:
	bl ov95_021E7514
	cmp r0, #0
	beq _021E72B2
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	bne _021E728A
	bl GF_AssertFail
_021E728A:
	mov r0, #5
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #6
	mov r1, #0
	bl ToggleBgLayer
	ldr r0, [r4, #0x10]
	mov r1, #0
	bl sub_0200DCE8
	mov r0, #0x10
	mov r1, #0
	bl GX_EngineBToggleLayers
	ldrb r0, [r4, #0x19]
	pop {r4, pc}
_021E72AE:
	bl GF_AssertFail
_021E72B2:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov95_021E7258

	thumb_func_start ov95_021E72B8
ov95_021E72B8: ; 0x021E72B8
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	mov r0, #8
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xf
	str r0, [sp, #0xc]
	mov r0, #0x50
	str r0, [sp, #0x10]
	add r1, r4, #0
	ldr r0, [r4, #0xc]
	add r1, #0x1c
	mov r2, #6
	mov r3, #4
	bl AddWindowParameterized
	mov r0, #0xe
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xf
	str r0, [sp, #0xc]
	mov r0, #0x80
	str r0, [sp, #0x10]
	ldr r0, [r4, #0xc]
	add r4, #0x2c
	add r1, r4, #0
	mov r2, #6
	mov r3, #4
	bl AddWindowParameterized
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov95_021E72B8

	thumb_func_start ov95_021E7308
ov95_021E7308: ; 0x021E7308
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bne _021E7312
	bl GF_AssertFail
_021E7312:
	mov r4, #0
	add r5, #0x1c
_021E7316:
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #2
	blt _021E7316
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov95_021E7308

	thumb_func_start ov95_021E7328
ov95_021E7328: ; 0x021E7328
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r3, [r5]
	add r4, r1, #0
	add r6, r2, #0
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xbb
	bl NewMsgDataFromNarc
	add r7, r0, #0
	ldr r0, [r5, #0x14]
	ldr r3, [r5]
	add r1, r7, #0
	add r2, r6, #0
	bl ReadMsgData_ExpandPlaceholders
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r3, #0
	str r3, [sp]
	ldr r0, _021E7384 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #4
	add r2, r5, #0
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl CopyWindowToVram
	add r0, r7, #0
	bl DestroyMsgData
	add r0, r5, #0
	bl String_dtor
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7384: .word 0x00010200
	thumb_func_end ov95_021E7328

	thumb_func_start ov95_021E7388
ov95_021E7388: ; 0x021E7388
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	ldr r4, _021E7400 ; =ov95_021E782C
	str r2, [sp]
	str r3, [sp, #4]
	add r5, r0, #0
	add r7, r1, #0
	add r3, sp, #8
	mov r2, #6
_021E739A:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E739A
	ldr r0, [r4]
	cmp r5, #0
	str r0, [r3]
	ldr r6, [r5, #4]
	ldr r4, [r5, #8]
	bne _021E73B2
	bl GF_AssertFail
_021E73B2:
	cmp r6, #0
	bne _021E73BA
	bl GF_AssertFail
_021E73BA:
	cmp r4, #0
	bne _021E73C2
	bl GF_AssertFail
_021E73C2:
	mov r1, #0x80
	add r0, sp, #8
	strh r1, [r0]
	mov r1, #0x48
	strh r1, [r0, #2]
	mov r1, #1
	strh r1, [r0, #6]
	ldr r0, [sp]
	add r1, r4, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #4]
	add r2, sp, #8
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x50]
	str r7, [sp, #0x1c]
	str r0, [sp, #0x28]
	add r0, r6, #0
	bl sub_0200D734
	add r4, r0, #0
	mov r1, #1
	bl sub_0200DC78
	add r0, r4, #0
	mov r1, #0
	bl sub_0200DCE8
	str r4, [r5, #0x10]
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	nop
_021E7400: .word ov95_021E782C
	thumb_func_end ov95_021E7388

	thumb_func_start ov95_021E7404
ov95_021E7404: ; 0x021E7404
	ldr r3, _021E740C ; =sub_0200D9DC
	ldr r0, [r0, #0x10]
	bx r3
	nop
_021E740C: .word sub_0200D9DC
	thumb_func_end ov95_021E7404

	thumb_func_start ov95_021E7410
ov95_021E7410: ; 0x021E7410
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x10]
	cmp r0, #0
	bne _021E741E
	bl GF_AssertFail
_021E741E:
	ldrb r0, [r5, #0x19]
	cmp r0, #1
	beq _021E742A
	cmp r0, #2
	beq _021E742E
	b _021E7432
_021E742A:
	mov r4, #0
	b _021E7436
_021E742E:
	mov r4, #1
	b _021E7436
_021E7432:
	bl GF_AssertFail
_021E7436:
	ldr r1, _021E7448 ; =ov95_021E7818
	lsl r3, r4, #2
	ldr r2, _021E744C ; =ov95_021E7818 + 2
	ldrsh r1, [r1, r3]
	ldrsh r2, [r2, r3]
	ldr r0, [r5, #0x10]
	bl sub_0200DDB8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E7448: .word ov95_021E7818
_021E744C: .word ov95_021E7818 + 2
	thumb_func_end ov95_021E7410

	thumb_func_start ov95_021E7450
ov95_021E7450: ; 0x021E7450
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _021E7508 ; =ov95_021E7820
	mov r4, #0
	bl sub_02025224
	add r6, r0, #0
	sub r0, r4, #1
	cmp r6, r0
	beq _021E7488
	ldr r0, _021E750C ; =0x000005DC
	bl PlaySE
	cmp r6, #0
	beq _021E7474
	cmp r6, #1
	beq _021E747A
	b _021E7482
_021E7474:
	mov r4, #1
	strb r4, [r5, #0x19]
	b _021E74EC
_021E747A:
	mov r0, #2
	strb r0, [r5, #0x19]
	mov r4, #1
	b _021E74EC
_021E7482:
	bl GF_AssertFail
	b _021E74EC
_021E7488:
	ldr r0, _021E7510 ; =gSystem
	mov r1, #0x40
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _021E74AA
	ldrb r0, [r5, #0x19]
	cmp r0, #1
	beq _021E74EC
	mov r0, #1
	strb r0, [r5, #0x19]
	add r0, r5, #0
	bl ov95_021E7410
	ldr r0, _021E750C ; =0x000005DC
	bl PlaySE
	b _021E74EC
_021E74AA:
	mov r1, #0x80
	tst r1, r0
	beq _021E74C8
	ldrb r0, [r5, #0x19]
	cmp r0, #2
	beq _021E74EC
	mov r0, #2
	strb r0, [r5, #0x19]
	add r0, r5, #0
	bl ov95_021E7410
	ldr r0, _021E750C ; =0x000005DC
	bl PlaySE
	b _021E74EC
_021E74C8:
	mov r1, #1
	add r2, r0, #0
	tst r2, r1
	beq _021E74E2
	ldrb r0, [r5, #0x19]
	cmp r0, #0
	bne _021E74DE
	bl GF_AssertFail
	mov r0, #2
	strb r0, [r5, #0x19]
_021E74DE:
	mov r4, #1
	b _021E74EC
_021E74E2:
	mov r2, #2
	tst r0, r2
	beq _021E74EC
	strb r2, [r5, #0x19]
	add r4, r1, #0
_021E74EC:
	cmp r4, #0
	beq _021E7504
	add r0, r5, #0
	bl ov95_021E7410
	ldr r0, [r5, #0x10]
	mov r1, #3
	bl sub_0200DC4C
	ldr r0, _021E750C ; =0x000005DC
	bl PlaySE
_021E7504:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E7508: .word ov95_021E7820
_021E750C: .word 0x000005DC
_021E7510: .word gSystem
	thumb_func_end ov95_021E7450

	thumb_func_start ov95_021E7514
ov95_021E7514: ; 0x021E7514
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	bl sub_0200DC64
	cmp r0, #3
	beq _021E7526
	bl GF_AssertFail
_021E7526:
	ldr r0, [r4, #0x10]
	bl sub_0200DCA0
	cmp r0, #0
	bne _021E7534
	mov r0, #1
	pop {r4, pc}
_021E7534:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov95_021E7514

	.rodata

	.public ov95_021E7538
ov95_021E7538:
	.word 0x00000001
	.word 0x00000000
	.word 0x00000000
	.word 0x00000001

ov95_021E7548: ; 0x021E7548
	.word 0x00000060
	.word 0x00010000
	.word 0x00004000
	.word 0x00100010
	.word 0x00000010

ov95_021E755C: ; 0x021E755C
	.word 0x00000060
	.word 0x00000020
	.word 0x00000040
	.word 0x00000040
	.word 0x00000010
	.word 0x00000010

ov95_021E7574: ; 0x021E7574
	.word 0x00000000
	.word 0x00000080
	.word 0x00000000
	.word 0x00000020
	.word 0x00000000
	.word 0x00000080
	.word 0x00000000
	.word 0x00000020

ov95_021E7594: ; 0x021E7594
	.word 0x00000004
	.word 0x00000009
	.word 0x00000003
	.word 0x00000002
	.word 0x00000004
	.word 0x00000009
	.word 0x00000003
	.word 0x00000002

	.balign 4, 0
	.public ov95_021E75B4
ov95_021E75B4: ; 0x021E75B4
	.word 0x00000001
	.word 0x00000000
	.word 0x00000080
	.word 0x00000000
	.word 0x00000010
	.word 0x00000000
	.word 0x00000100
	.word 0x00000000
	.word 0x00000006
	.word 0x00000060

	.balign 2, 0
ov95_021E75DC: ; 0x021E75DC
	.short -1, 1, 1, -1, -1, 1, 1, -1, 255, 255
	.short -2, 2, 2, -2, -2, 2, 2, -2, 255, 255
	.short -3, 3, 3, -3, -3, 3, 255, 255, 0, 0
	.short -3, 3, 3, -3, -3, 3, 255, 255, 0, 0

	.balign 2, 0
ov95_021E762C: ; 0x021E762C
	.short 0, 255, 0, 0, 0, 0, 0, 0, 0, 0
	.short 0, 0, 1, 1, 0, -1, -1, 0, 0, 255
	.short 0, 0, 1, 1, 1, -1, -1, -1, 0, 0
	.short 0, 0, 1, 1, 1, -1, -1, -1, 0, 0

	.public ov95_021E767C
	.balign 4, 0
ov95_021E767C: ; 0x021E767C
	.word 0
	.word 0
	.word 0x800
	.word 0
	.byte 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00
	.word 0

	.word 0
	.word 0
	.word 0x2000
	.word 0
	.byte 0x01, 0x00, 0x02, 0x03, 0x00, 0x01, 0x00, 0x00
	.word 0

	.word 0
	.word 0
	.word 0x1000
	.word 0
	.byte 0x01, 0x00, 0x06, 0x04, 0x00, 0x02, 0x00, 0x00
	.word 0

ov95_021E76D0: ; 0x021E76D0
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x80, 0x3F
	.byte 0xCD, 0xCC, 0x8C, 0x3F, 0xCD, 0xCC, 0x8C, 0x3F, 0xCD, 0xCC, 0x8C, 0x3F, 0xCD, 0xCC, 0x8C, 0x3F
	.byte 0xCD, 0xCC, 0x8C, 0x3F, 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0xCD, 0xCC, 0x8C, 0x3F, 0xCD, 0xCC, 0x8C, 0x3F, 0x9A, 0x99, 0x99, 0x3F
	.byte 0x9A, 0x99, 0x99, 0x3F, 0x9A, 0x99, 0x99, 0x3F, 0xCD, 0xCC, 0x8C, 0x3F, 0xCD, 0xCC, 0x8C, 0x3F
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x3F, 0xCD, 0xCC, 0x8C, 0x3F
	.byte 0xCD, 0xCC, 0x8C, 0x3F, 0x9A, 0x99, 0x99, 0x3F, 0x9A, 0x99, 0x99, 0x3F, 0x9A, 0x99, 0x99, 0x3F
	.byte 0xCD, 0xCC, 0x8C, 0x3F, 0xCD, 0xCC, 0x8C, 0x3F, 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x00, 0x00

ov95_021E7770: ; 0x021E7770
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x80, 0x3F
	.byte 0x66, 0x66, 0x66, 0x3F, 0x66, 0x66, 0x66, 0x3F, 0x66, 0x66, 0x66, 0x3F, 0x66, 0x66, 0x66, 0x3F
	.byte 0x66, 0x66, 0x66, 0x3F, 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x80, 0x3F, 0x66, 0x66, 0x66, 0x3F, 0xCD, 0xCC, 0x4C, 0x3F
	.byte 0x33, 0x33, 0x33, 0x3F, 0x33, 0x33, 0x33, 0x3F, 0xCD, 0xCC, 0x4C, 0x3F, 0x66, 0x66, 0x66, 0x3F
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x80, 0x3F
	.byte 0x66, 0x66, 0x66, 0x3F, 0xCD, 0xCC, 0x4C, 0x3F, 0x33, 0x33, 0x33, 0x3F, 0x33, 0x33, 0x33, 0x3F
	.byte 0xCD, 0xCC, 0x4C, 0x3F, 0x66, 0x66, 0x66, 0x3F, 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x80, 0x3F

ov95_021E7810: ; 0x021E7810
	.word ov95_021E6314
	.word ov95_021E65A0

ov95_021E7818: ; 0x021E7818
	.short 0x0080, 0x0048
	.short 0x0080, 0x0078

ov95_021E7820: ; 0x021E7820
	.byte 0x32, 0x5C, 0x03, 0xFB, 0x63, 0x8C, 0x03, 0xFB, 0xFF, 0x00, 0x00, 0x00

ov95_021E782C: ; 0x021E782C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov95_021E7860: ; 0x021E7860
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0E, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0D, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	; 0x021E78B4
