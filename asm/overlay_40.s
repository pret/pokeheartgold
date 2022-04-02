	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov40_0222B6E0
ov40_0222B6E0: ; 0x0222B6E0
	push {r3, r4, r5, lr}
	sub sp, #0x28
	add r4, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _0222B920 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _0222B924 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r0, #4
	mov r1, #0x6d
	bl GF_CreateVramTransferManager
	mov r0, #0xbf
	mov r1, #0x6d
	bl NARC_ctor
	str r0, [r4, #0x14]
	mov r0, #0x6d
	bl BgConfig_Alloc
	str r0, [r4, #0x24]
	mov r0, #0x6d
	bl sub_020030E8
	str r0, [r4, #0x28]
	mov r0, #4
	str r0, [sp]
	mov r1, #0
	str r1, [sp, #4]
	mov r0, #0x6d
	mov r2, #1
	add r3, r1, #0
	bl GF_3DVramMan_Create
	str r0, [r4, #0x60]
	mov r0, #0x6d
	bl sub_02007FD4
	str r0, [r4, #0x64]
	bl NNS_G2dSetupSoftwareSpriteCamera
	ldr r0, [r4, #0x28]
	mov r1, #1
	bl sub_02003B50
	mov r2, #2
	ldr r0, [r4, #0x28]
	mov r1, #0
	lsl r2, r2, #8
	mov r3, #0x6d
	bl PaletteData_AllocBuffers
	mov r1, #1
	ldr r0, [r4, #0x28]
	lsl r2, r1, #9
	mov r3, #0x6d
	bl PaletteData_AllocBuffers
	mov r1, #2
	ldr r0, [r4, #0x28]
	lsl r2, r1, #8
	mov r3, #0x6d
	bl PaletteData_AllocBuffers
	mov r2, #2
	ldr r0, [r4, #0x28]
	mov r1, #3
	lsl r2, r2, #8
	mov r3, #0x6d
	bl PaletteData_AllocBuffers
	ldr r0, [r4, #0x24]
	bl ov40_0222BA90
	add r0, r4, #0
	bl ov40_0222BC68
	bl sub_020210BC
	mov r0, #4
	bl sub_02021148
	mov r0, #1
	str r0, [r4, #0x44]
	add r0, r4, #0
	bl ov40_0222C360
	mov r0, #1
	bl sub_02002B8C
	ldr r0, _0222B928 ; =ov40_0222BD04
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	ldr r0, [r4]
	cmp r0, #0
	beq _0222B826
	add r0, r4, #0
	bl ov40_0223D544
	ldr r1, _0222B92C ; =0x00200010
	mov r0, #1
	bl sub_02009FE8
	mov r0, #1
	bl sub_0200A080
	ldr r1, _0222B92C ; =0x00200010
	mov r0, #2
	bl sub_02009FE8
	mov r0, #2
	bl sub_0200A080
	bl sub_0203A880
	mov r0, #1
	mov r1, #0x6d
	bl sub_0203A948
	mov r0, #0x6d
	bl sub_0203A4AC
	add r1, sp, #0x10
	add r5, r0, #0
	bl NNS_G2dGetUnpackedPaletteData
	mov r0, #0x20
	str r0, [sp]
	ldr r1, [sp, #0x10]
	ldr r0, [r4, #0x28]
	ldr r1, [r1, #0xc]
	mov r2, #2
	mov r3, #0xe0
	bl PaletteData_LoadPalette
	mov r0, #0x20
	str r0, [sp]
	ldr r1, [sp, #0x10]
	ldr r0, [r4, #0x28]
	ldr r1, [r1, #0xc]
	mov r2, #3
	mov r3, #0xe0
	bl PaletteData_LoadPalette
	add r0, r5, #0
	bl FreeToHeap
_0222B826:
	mov r0, #0xc
	str r0, [sp, #0x14]
	mov r0, #0x6d
	str r0, [sp, #0x18]
	ldr r0, [r4]
	mov r1, #1
	str r0, [sp, #0x20]
	lsl r0, r1, #0x14
	str r0, [sp, #0x24]
	ldr r0, [r4, #0x18]
	mov r5, sp
	str r0, [sp, #4]
	ldr r0, [r4, #0x1c]
	sub r5, #0x10
	str r0, [sp, #8]
	ldr r0, [r4, #0x28]
	add r3, sp, #0x14
	str r1, [sp, #0x1c]
	str r0, [sp, #0xc]
	ldmia r3!, {r0, r1}
	add r2, r5, #0
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldmia r5!, {r0, r1, r2, r3}
	bl sub_02087284
	mov r1, #0x6f
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	add r1, r4, #0
	add r1, #0x5c
	ldrb r1, [r1]
	bl sub_02087878
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_020878B0
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_020879E0
	mov r0, #2
	str r0, [sp, #0x1c]
	lsl r0, r0, #0x13
	str r0, [sp, #0x24]
	ldr r0, [r4, #0x18]
	mov r5, sp
	str r0, [sp, #4]
	ldr r0, [r4, #0x1c]
	sub r5, #0x10
	str r0, [sp, #8]
	ldr r0, [r4, #0x28]
	add r3, sp, #0x14
	str r0, [sp, #0xc]
	ldmia r3!, {r0, r1}
	add r2, r5, #0
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldmia r5!, {r0, r1, r2, r3}
	bl sub_02087284
	ldr r1, _0222B930 ; =0x000006F4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	add r1, r4, #0
	add r1, #0x5c
	ldrb r1, [r1]
	bl sub_02087878
	ldr r0, _0222B930 ; =0x000006F4
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_020878B0
	ldr r0, _0222B930 ; =0x000006F4
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_020879E0
	mov r0, #0x14
	mov r1, #0x6d
	bl sub_02013534
	str r0, [r4, #0x50]
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xd
	mov r3, #0x6d
	bl NewMsgDataFromNarc
	str r0, [r4, #0x48]
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0x1a
	mov r3, #0x6d
	bl NewMsgDataFromNarc
	str r0, [r4, #0x4c]
	add r0, r4, #0
	bl ov40_0222FCCC
	add r0, r4, #0
	bl sub_02088030
	add r0, r4, #0
	bl ov40_0222C4F8
	add r0, r4, #0
	bl ov40_0222FBF8
	add sp, #0x28
	pop {r3, r4, r5, pc}
	nop
_0222B920: .word 0xFFFFE0FF
_0222B924: .word 0x04001000
_0222B928: .word ov40_0222BD04
_0222B92C: .word 0x00200010
_0222B930: .word 0x000006F4
	thumb_func_end ov40_0222B6E0

	thumb_func_start ov40_0222B934
ov40_0222B934: ; 0x0222B934
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
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
	ldr r0, [r5, #0x24]
	mov r1, #0
	bl FreeBgTilemapBuffer
	ldr r0, [r5, #0x24]
	mov r1, #1
	bl FreeBgTilemapBuffer
	ldr r0, [r5, #0x24]
	mov r1, #2
	bl FreeBgTilemapBuffer
	ldr r0, [r5, #0x24]
	mov r1, #3
	bl FreeBgTilemapBuffer
	ldr r0, [r5, #0x24]
	mov r1, #4
	bl FreeBgTilemapBuffer
	ldr r0, [r5, #0x24]
	mov r1, #5
	bl FreeBgTilemapBuffer
	ldr r0, [r5, #0x24]
	mov r1, #6
	bl FreeBgTilemapBuffer
	ldr r0, [r5, #0x24]
	mov r1, #7
	bl FreeBgTilemapBuffer
	ldr r0, [r5, #0x24]
	bl FreeToHeap
	ldr r0, [r5, #0x28]
	mov r1, #0
	bl PaletteData_FreeBuffers
	ldr r0, [r5, #0x28]
	mov r1, #1
	bl PaletteData_FreeBuffers
	ldr r0, [r5, #0x28]
	mov r1, #2
	bl PaletteData_FreeBuffers
	ldr r0, [r5, #0x28]
	mov r1, #3
	bl PaletteData_FreeBuffers
	ldr r0, [r5, #0x28]
	bl sub_02003104
	ldr r0, [r5]
	cmp r0, #0
	bne _0222B9FE
	mov r0, #0x83
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl Sav2_Misc_get
	add r1, r5, #0
	add r1, #0x5c
	ldrb r1, [r1]
	bl sub_0202AC1C
_0222B9FE:
	ldr r0, [r5, #0x14]
	bl NARC_dtor
	ldr r0, _0222BA84 ; =0x0000416C
	ldr r0, [r5, r0]
	bl DestroySysTask
	ldr r0, [r5, #0x18]
	ldr r1, [r5, #0x1c]
	bl sub_0200D998
	ldr r0, [r5, #0x18]
	bl sub_0200D108
	bl sub_0203A914
	bl sub_02021238
	ldr r0, [r5, #0x2c]
	bl sub_02026CAC
	mov r0, #0
	bl sub_02002B8C
	ldr r7, _0222BA88 ; =0x0000087C
	mov r6, #0
	add r4, r5, #0
_0222BA34:
	ldr r0, [r4, r7]
	cmp r0, #0
	beq _0222BA3E
	bl FreeToHeap
_0222BA3E:
	ldr r0, _0222BA8C ; =0x0000088C
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222BA4A
	bl FreeToHeap
_0222BA4A:
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #4
	blt _0222BA34
	ldr r0, [r5, #0x50]
	bl sub_020135AC
	ldr r0, [r5, #0x48]
	bl DestroyMsgData
	ldr r0, [r5, #0x4c]
	bl DestroyMsgData
	ldr r0, [r5, #0x60]
	bl GF_3DVramMan_Delete
	ldr r0, [r5, #0x64]
	bl sub_02008524
	add r0, r5, #0
	bl ov40_0223D600
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl GF_DestroyVramTransferManager
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222BA84: .word 0x0000416C
_0222BA88: .word 0x0000087C
_0222BA8C: .word 0x0000088C
	thumb_func_end ov40_0222B934

	thumb_func_start ov40_0222BA90
ov40_0222BA90: ; 0x0222BA90
	push {r4, r5, lr}
	sub sp, #0x3c
	add r4, r0, #0
	bl GX_DisableEngineALayers
	ldr r5, _0222BC14 ; =_02244C44
	add r3, sp, #0x2c
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _0222BC18 ; =ov40_02244CA0
	add r3, sp, #4
	mov r2, #5
_0222BAB4:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0222BAB4
	add r0, sp, #4
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
	mov r1, #0
	ldr r2, _0222BC1C ; =ov40_02244CC8
	add r0, r4, #0
	add r3, r1, #0
	bl InitBgFromTemplate
	ldr r2, _0222BC20 ; =ov40_02244CE4
	add r0, r4, #0
	mov r1, #1
	mov r3, #0
	bl InitBgFromTemplate
	ldr r2, _0222BC24 ; =ov40_02244D00
	add r0, r4, #0
	mov r1, #2
	mov r3, #0
	bl InitBgFromTemplate
	ldr r2, _0222BC28 ; =ov40_02244D1C
	add r0, r4, #0
	mov r1, #3
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r2, _0222BC2C ; =ov40_02244D38
	add r0, r4, #0
	mov r1, #4
	mov r3, #0
	bl InitBgFromTemplate
	ldr r2, _0222BC30 ; =ov40_02244D54
	add r0, r4, #0
	mov r1, #5
	mov r3, #0
	bl InitBgFromTemplate
	ldr r2, _0222BC34 ; =ov40_02244D70
	add r0, r4, #0
	mov r1, #6
	mov r3, #0
	bl InitBgFromTemplate
	ldr r2, _0222BC38 ; =ov40_02244D8C
	add r0, r4, #0
	mov r1, #7
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
	mov r0, #1
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #2
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #1
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #2
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #8
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #1
	bl ov40_0222BC44
	mov r0, #8
	str r0, [sp]
	ldr r0, _0222BC3C ; =0x04000050
	mov r1, #4
	mov r2, #0x12
	mov r3, #7
	bl G2x_SetBlendAlpha_
	mov r0, #8
	str r0, [sp]
	ldr r0, _0222BC40 ; =0x04001050
	mov r1, #4
	mov r2, #0x12
	mov r3, #7
	bl G2x_SetBlendAlpha_
	add sp, #0x3c
	pop {r4, r5, pc}
	.balign 4, 0
_0222BC14: .word _02244C44
_0222BC18: .word ov40_02244CA0
_0222BC1C: .word ov40_02244CC8
_0222BC20: .word ov40_02244CE4
_0222BC24: .word ov40_02244D00
_0222BC28: .word ov40_02244D1C
_0222BC2C: .word ov40_02244D38
_0222BC30: .word ov40_02244D54
_0222BC34: .word ov40_02244D70
_0222BC38: .word ov40_02244D8C
_0222BC3C: .word 0x04000050
_0222BC40: .word 0x04001050
	thumb_func_end ov40_0222BA90

	thumb_func_start ov40_0222BC44
ov40_0222BC44: ; 0x0222BC44
	ldr r1, _0222BC4C ; =gSystem + 0x60
	ldr r3, _0222BC50 ; =GX_SwapDisplay
	strb r0, [r1, #9]
	bx r3
	.balign 4, 0
_0222BC4C: .word gSystem + 0x60
_0222BC50: .word GX_SwapDisplay
	thumb_func_end ov40_0222BC44

	thumb_func_start ov40_0222BC54
ov40_0222BC54: ; 0x0222BC54
	push {r3, lr}
	ldr r0, [r0, #0x24]
	ldr r2, _0222BC64 ; =ov40_02244D00
	mov r1, #2
	mov r3, #0
	bl InitBgFromTemplate
	pop {r3, pc}
	.balign 4, 0
_0222BC64: .word ov40_02244D00
	thumb_func_end ov40_0222BC54

	thumb_func_start ov40_0222BC68
ov40_0222BC68: ; 0x0222BC68
	push {r3, r4, r5, r6, lr}
	sub sp, #0x4c
	add r4, r0, #0
	mov r0, #0x6d
	bl sub_0200CF18
	add r2, sp, #0x2c
	ldr r5, _0222BCF8 ; =ov40_02244C80
	str r0, [r4, #0x18]
	ldmia r5!, {r0, r1}
	add r3, r2, #0
	stmia r2!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r5!, {r0, r1}
	ldr r6, _0222BCFC ; =ov40_02244C54
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
	ldr r0, [r4, #0x18]
	mov r3, #0x20
	bl sub_0200CF70
	ldr r3, _0222BD00 ; =ov40_02244C68
	add r2, sp, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r4, #0x18]
	bl sub_0200CF38
	str r0, [r4, #0x1c]
	ldr r0, [r4, #0x18]
	ldr r1, [r4, #0x1c]
	mov r2, #0xc0
	bl sub_0200CFF4
	cmp r0, #0
	bne _0222BCD2
	bl GF_AssertFail
_0222BCD2:
	ldr r0, [r4, #0x18]
	ldr r1, [r4, #0x1c]
	add r2, sp, #0
	bl sub_0200D3F8
	cmp r0, #0
	bne _0222BCE4
	bl GF_AssertFail
_0222BCE4:
	ldr r0, [r4, #0x18]
	bl sub_0200CF6C
	mov r2, #1
	mov r1, #0
	lsl r2, r2, #0x14
	bl G2dRenderer_SetSubSurfaceCoords
	add sp, #0x4c
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0222BCF8: .word ov40_02244C80
_0222BCFC: .word ov40_02244C54
_0222BD00: .word ov40_02244C68
	thumb_func_end ov40_0222BC68

	thumb_func_start ov40_0222BD04
ov40_0222BD04: ; 0x0222BD04
	push {r4, lr}
	add r4, r0, #0
	bl GF_RunVramTransferTasks
	ldr r0, [r4, #0x28]
	bl sub_0200398C
	ldr r0, [r4, #0x24]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	ldr r3, _0222BD28 ; =0x027E0000
	ldr r1, _0222BD2C ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_0222BD28: .word 0x027E0000
_0222BD2C: .word 0x00003FF8
	thumb_func_end ov40_0222BD04

	thumb_func_start ov40_0222BD30
ov40_0222BD30: ; 0x0222BD30
	push {r4, r5, r6, lr}
	add r5, r1, #0
	ldr r1, [r5]
	add r4, r0, #0
	cmp r1, #0x12
	bls _0222BD3E
	b _0222BF0A
_0222BD3E:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0222BD4A: ; jump table
	.short _0222BD70 - _0222BD4A - 2 ; case 0
	.short _0222BDA8 - _0222BD4A - 2 ; case 1
	.short _0222BDC0 - _0222BD4A - 2 ; case 2
	.short _0222BDD8 - _0222BD4A - 2 ; case 3
	.short _0222BDF0 - _0222BD4A - 2 ; case 4
	.short _0222BE08 - _0222BD4A - 2 ; case 5
	.short _0222BE20 - _0222BD4A - 2 ; case 6
	.short _0222BE38 - _0222BD4A - 2 ; case 7
	.short _0222BE50 - _0222BD4A - 2 ; case 8
	.short _0222BE50 - _0222BD4A - 2 ; case 9
	.short _0222BE68 - _0222BD4A - 2 ; case 10
	.short _0222BE68 - _0222BD4A - 2 ; case 11
	.short _0222BE80 - _0222BD4A - 2 ; case 12
	.short _0222BE98 - _0222BD4A - 2 ; case 13
	.short _0222BEB0 - _0222BD4A - 2 ; case 14
	.short _0222BEC8 - _0222BD4A - 2 ; case 15
	.short _0222BEE0 - _0222BD4A - 2 ; case 16
	.short _0222BEEC - _0222BD4A - 2 ; case 17
	.short _0222BF04 - _0222BD4A - 2 ; case 18
_0222BD70:
	ldr r1, [r4, #4]
	lsl r2, r1, #2
	ldr r1, _0222BF2C ; =ov40_022450F0
	ldr r1, [r1, r2]
	blx r1
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #1
	add r2, r6, #0
	add r3, r5, #0
	bl ov40_0222BF64
	cmp r6, #0
	bne _0222BD8E
	b _0222BF0E
_0222BD8E:
	ldr r0, [r4, #0x44]
	cmp r0, #1
	bne _0222BD9E
	add r0, r4, #0
	mov r1, #0
	bl ov40_0222BF80
	b _0222BF0E
_0222BD9E:
	add r0, r4, #0
	mov r1, #1
	bl ov40_0222BF80
	b _0222BF0E
_0222BDA8:
	ldr r1, [r4, #4]
	lsl r2, r1, #2
	ldr r1, _0222BF30 ; =ov40_02245108
	ldr r1, [r1, r2]
	blx r1
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0x10
	add r3, r5, #0
	bl ov40_0222BF64
	b _0222BF0E
_0222BDC0:
	ldr r1, [r4, #4]
	lsl r2, r1, #2
	ldr r1, _0222BF34 ; =ov40_02245140
	ldr r1, [r1, r2]
	blx r1
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0x10
	add r3, r5, #0
	bl ov40_0222BF64
	b _0222BF0E
_0222BDD8:
	ldr r1, [r4, #4]
	lsl r2, r1, #2
	ldr r1, _0222BF38 ; =ov40_02245168
	ldr r1, [r1, r2]
	blx r1
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0x10
	add r3, r5, #0
	bl ov40_0222BF64
	b _0222BF0E
_0222BDF0:
	ldr r1, [r4, #4]
	lsl r2, r1, #2
	ldr r1, _0222BF3C ; =ov40_02245220
	ldr r1, [r1, r2]
	blx r1
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0x10
	add r3, r5, #0
	bl ov40_0222BF64
	b _0222BF0E
_0222BE08:
	ldr r1, [r4, #4]
	lsl r2, r1, #2
	ldr r1, _0222BF40 ; =ov40_02245238
	ldr r1, [r1, r2]
	blx r1
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0x10
	add r3, r5, #0
	bl ov40_0222BF64
	b _0222BF0E
_0222BE20:
	ldr r1, [r4, #4]
	lsl r2, r1, #2
	ldr r1, _0222BF44 ; =ov40_0224533C
	ldr r1, [r1, r2]
	blx r1
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0x10
	add r3, r5, #0
	bl ov40_0222BF64
	b _0222BF0E
_0222BE38:
	ldr r1, [r4, #4]
	lsl r2, r1, #2
	ldr r1, _0222BF48 ; =ov40_02245368
	ldr r1, [r1, r2]
	blx r1
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0x10
	add r3, r5, #0
	bl ov40_0222BF64
	b _0222BF0E
_0222BE50:
	ldr r1, [r4, #4]
	lsl r2, r1, #2
	ldr r1, _0222BF4C ; =ov40_02245470
	ldr r1, [r1, r2]
	blx r1
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0x10
	add r3, r5, #0
	bl ov40_0222BF64
	b _0222BF0E
_0222BE68:
	ldr r1, [r4, #4]
	lsl r2, r1, #2
	ldr r1, _0222BF50 ; =ov40_022455F4
	ldr r1, [r1, r2]
	blx r1
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0x10
	add r3, r5, #0
	bl ov40_0222BF64
	b _0222BF0E
_0222BE80:
	ldr r1, [r4, #4]
	lsl r2, r1, #2
	ldr r1, _0222BF50 ; =ov40_022455F4
	ldr r1, [r1, r2]
	blx r1
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0x10
	add r3, r5, #0
	bl ov40_0222BF64
	b _0222BF0E
_0222BE98:
	ldr r1, [r4, #4]
	lsl r2, r1, #2
	ldr r1, _0222BF54 ; =ov40_02245B98
	ldr r1, [r1, r2]
	blx r1
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0x10
	add r3, r5, #0
	bl ov40_0222BF64
	b _0222BF0E
_0222BEB0:
	ldr r1, [r4, #4]
	lsl r2, r1, #2
	ldr r1, _0222BF58 ; =ov40_02245B44
	ldr r1, [r1, r2]
	blx r1
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0x10
	add r3, r5, #0
	bl ov40_0222BF64
	b _0222BF0E
_0222BEC8:
	ldr r1, [r4, #4]
	lsl r2, r1, #2
	ldr r1, _0222BF5C ; =ov40_02245B30
	ldr r1, [r1, r2]
	blx r1
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0x10
	add r3, r5, #0
	bl ov40_0222BF64
	b _0222BF0E
_0222BEE0:
	mov r1, #0xff
	mov r2, #1
	add r3, r5, #0
	bl ov40_0222BF64
	b _0222BF0E
_0222BEEC:
	ldr r1, [r4, #4]
	lsl r2, r1, #2
	ldr r1, _0222BF60 ; =ov40_02245CA8
	ldr r1, [r1, r2]
	blx r1
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0x10
	add r3, r5, #0
	bl ov40_0222BF64
	b _0222BF0E
_0222BF04:
	bl ov40_02230D20
	b _0222BF0E
_0222BF0A:
	mov r0, #1
	pop {r4, r5, r6, pc}
_0222BF0E:
	bl sub_02026E48
	ldr r0, [r4, #0x64]
	bl sub_02008120
	mov r0, #1
	mov r1, #0
	bl sub_02026E50
	add r0, r4, #0
	bl ov40_0223D5E8
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_0222BF2C: .word ov40_022450F0
_0222BF30: .word ov40_02245108
_0222BF34: .word ov40_02245140
_0222BF38: .word ov40_02245168
_0222BF3C: .word ov40_02245220
_0222BF40: .word ov40_02245238
_0222BF44: .word ov40_0224533C
_0222BF48: .word ov40_02245368
_0222BF4C: .word ov40_02245470
_0222BF50: .word ov40_022455F4
_0222BF54: .word ov40_02245B98
_0222BF58: .word ov40_02245B44
_0222BF5C: .word ov40_02245B30
_0222BF60: .word ov40_02245CA8
	thumb_func_end ov40_0222BD30

	thumb_func_start ov40_0222BF64
ov40_0222BF64: ; 0x0222BF64
	push {r4, lr}
	add r4, r0, #0
	cmp r2, #0
	beq _0222BF7C
	str r1, [r3]
	mov r1, #0
	bl ov40_0222BF80
	add r0, r4, #0
	mov r1, #0
	bl ov40_0222BF8C
_0222BF7C:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov40_0222BF64

	thumb_func_start ov40_0222BF80
ov40_0222BF80: ; 0x0222BF80
	str r1, [r0, #4]
	mov r1, #0
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	bx lr
	.balign 4, 0
	thumb_func_end ov40_0222BF80

	thumb_func_start ov40_0222BF8C
ov40_0222BF8C: ; 0x0222BF8C
	str r1, [r0, #8]
	mov r1, #0
	str r1, [r0, #0xc]
	bx lr
	thumb_func_end ov40_0222BF8C

	thumb_func_start ov40_0222BF94
ov40_0222BF94: ; 0x0222BF94
	push {r4, lr}
	add r4, r0, #0
	bl sub_02088030
	add r0, r4, #0
	bl ov40_0222CE7C
	ldr r0, _0222BFAC ; =0x000006E4
	mov r1, #0
	str r1, [r4, r0]
	pop {r4, pc}
	nop
_0222BFAC: .word 0x000006E4
	thumb_func_end ov40_0222BF94

	thumb_func_start ov40_0222BFB0
ov40_0222BFB0: ; 0x0222BFB0
	push {r4, r5, r6, lr}
	ldr r2, _0222C010 ; =0x000006D8
	ldr r3, _0222C014 ; =0x00000818
	ldr r4, [r0, r2]
	ldr r1, [r0, r3]
	lsl r4, r4, #2
	add r5, r0, r4
	add r4, r3, #4
	str r1, [r5, r4]
	add r1, r2, #0
	add r1, #0xc
	ldr r1, [r0, r1]
	ldr r5, [r0, r3]
	add r4, r1, #0
	ldr r1, [r0, r2]
	mov r6, #0x24
	mul r4, r6
	lsl r1, r1, #2
	add r5, r5, r4
	add r4, r0, r1
	add r1, r2, #0
	sub r1, #0x14
	str r5, [r4, r1]
	add r4, r2, #0
	add r4, #0xc
	ldr r4, [r0, r4]
	ldr r1, [r0, r3]
	add r5, r4, #0
	mul r5, r6
	add r1, r1, r5
	ldr r1, [r1, #0x20]
	mov r4, #0
	str r1, [r0, r3]
	ldr r1, [r0, r2]
	add r1, r1, #1
	str r1, [r0, r2]
	add r2, #0xc
	str r4, [r0, r2]
	ldr r1, [r0, r3]
	cmp r1, #0
	bne _0222C006
	add r0, r4, #0
	pop {r4, r5, r6, pc}
_0222C006:
	bl ov40_0222BF94
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_0222C010: .word 0x000006D8
_0222C014: .word 0x00000818
	thumb_func_end ov40_0222BFB0

	thumb_func_start ov40_0222C018
ov40_0222C018: ; 0x0222C018
	push {r3, lr}
	ldr r1, _0222C034 ; =0x000006D8
	ldr r1, [r0, r1]
	lsl r1, r1, #2
	add r2, r0, r1
	ldr r1, _0222C038 ; =0x0000081C
	ldr r2, [r2, r1]
	sub r1, r1, #4
	str r2, [r0, r1]
	bl ov40_0222BF94
	mov r0, #1
	pop {r3, pc}
	nop
_0222C034: .word 0x000006D8
_0222C038: .word 0x0000081C
	thumb_func_end ov40_0222C018

	thumb_func_start ov40_0222C03C
ov40_0222C03C: ; 0x0222C03C
	push {r3, r4, r5, lr}
	ldr r3, _0222C154 ; =0x000006E4
	add r4, r0, #0
	ldr r1, _0222C158 ; =0x00000818
	ldr r5, [r4, r3]
	mov r3, #0x24
	ldr r2, [r4, r1]
	mul r3, r5
	add r2, r2, r3
	ldr r2, [r2, #0x10]
	cmp r2, #0x13
	bhi _0222C150
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0222C060: ; jump table
	.short _0222C150 - _0222C060 - 2 ; case 0
	.short _0222C150 - _0222C060 - 2 ; case 1
	.short _0222C088 - _0222C060 - 2 ; case 2
	.short _0222C150 - _0222C060 - 2 ; case 3
	.short _0222C09E - _0222C060 - 2 ; case 4
	.short _0222C0AA - _0222C060 - 2 ; case 5
	.short _0222C150 - _0222C060 - 2 ; case 6
	.short _0222C146 - _0222C060 - 2 ; case 7
	.short _0222C0B6 - _0222C060 - 2 ; case 8
	.short _0222C0C2 - _0222C060 - 2 ; case 9
	.short _0222C0CE - _0222C060 - 2 ; case 10
	.short _0222C0DA - _0222C060 - 2 ; case 11
	.short _0222C0E6 - _0222C060 - 2 ; case 12
	.short _0222C0F2 - _0222C060 - 2 ; case 13
	.short _0222C0FE - _0222C060 - 2 ; case 14
	.short _0222C10A - _0222C060 - 2 ; case 15
	.short _0222C116 - _0222C060 - 2 ; case 16
	.short _0222C122 - _0222C060 - 2 ; case 17
	.short _0222C12E - _0222C060 - 2 ; case 18
	.short _0222C13A - _0222C060 - 2 ; case 19
_0222C088:
	add r1, #0x50
	ldr r0, [r4, r1]
	mov r1, #0
	add r2, r1, #0
	bl sub_02087A84
	add r0, r4, #0
	mov r1, #2
	bl ov40_0222BF80
	pop {r3, r4, r5, pc}
_0222C09E:
	ldr r3, [r4, #0x10]
	mov r1, #2
	mov r2, #1
	bl ov40_0222BF64
	pop {r3, r4, r5, pc}
_0222C0AA:
	ldr r3, [r4, #0x10]
	mov r1, #3
	mov r2, #1
	bl ov40_0222BF64
	pop {r3, r4, r5, pc}
_0222C0B6:
	ldr r3, [r4, #0x10]
	mov r1, #4
	mov r2, #1
	bl ov40_0222BF64
	pop {r3, r4, r5, pc}
_0222C0C2:
	ldr r3, [r4, #0x10]
	mov r1, #5
	mov r2, #1
	bl ov40_0222BF64
	pop {r3, r4, r5, pc}
_0222C0CE:
	ldr r3, [r4, #0x10]
	mov r1, #6
	mov r2, #1
	bl ov40_0222BF64
	pop {r3, r4, r5, pc}
_0222C0DA:
	ldr r3, [r4, #0x10]
	mov r1, #7
	mov r2, #1
	bl ov40_0222BF64
	pop {r3, r4, r5, pc}
_0222C0E6:
	ldr r3, [r4, #0x10]
	mov r1, #8
	mov r2, #1
	bl ov40_0222BF64
	pop {r3, r4, r5, pc}
_0222C0F2:
	ldr r3, [r4, #0x10]
	mov r1, #9
	mov r2, #1
	bl ov40_0222BF64
	pop {r3, r4, r5, pc}
_0222C0FE:
	ldr r3, [r4, #0x10]
	mov r1, #0xa
	mov r2, #1
	bl ov40_0222BF64
	pop {r3, r4, r5, pc}
_0222C10A:
	ldr r3, [r4, #0x10]
	mov r1, #0xb
	mov r2, #1
	bl ov40_0222BF64
	pop {r3, r4, r5, pc}
_0222C116:
	ldr r3, [r4, #0x10]
	mov r1, #0xc
	mov r2, #1
	bl ov40_0222BF64
	pop {r3, r4, r5, pc}
_0222C122:
	ldr r3, [r4, #0x10]
	mov r1, #0xd
	mov r2, #1
	bl ov40_0222BF64
	pop {r3, r4, r5, pc}
_0222C12E:
	ldr r3, [r4, #0x10]
	mov r1, #0xe
	mov r2, #1
	bl ov40_0222BF64
	pop {r3, r4, r5, pc}
_0222C13A:
	ldr r3, [r4, #0x10]
	mov r1, #0xf
	mov r2, #1
	bl ov40_0222BF64
	pop {r3, r4, r5, pc}
_0222C146:
	ldr r3, [r4, #0x10]
	mov r1, #0x11
	mov r2, #1
	bl ov40_0222BF64
_0222C150:
	pop {r3, r4, r5, pc}
	nop
_0222C154: .word 0x000006E4
_0222C158: .word 0x00000818
	thumb_func_end ov40_0222C03C

	thumb_func_start ov40_0222C15C
ov40_0222C15C: ; 0x0222C15C
	push {r4, r5, r6, lr}
	ldr r3, _0222C218 ; =0x000006E4
	add r5, r0, #0
	ldr r1, _0222C21C ; =0x00000818
	ldr r4, [r5, r3]
	mov r3, #0x24
	ldr r2, [r5, r1]
	mul r3, r4
	add r2, r2, r3
	ldr r4, [r2, #0x18]
	ldr r2, [r5]
	mov r6, #1
	cmp r2, #6
	bhi _0222C192
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0222C184: ; jump table
	.short _0222C192 - _0222C184 - 2 ; case 0
	.short _0222C192 - _0222C184 - 2 ; case 1
	.short _0222C1EA - _0222C184 - 2 ; case 2
	.short _0222C200 - _0222C184 - 2 ; case 3
	.short _0222C200 - _0222C184 - 2 ; case 4
	.short _0222C1AE - _0222C184 - 2 ; case 5
	.short _0222C1D2 - _0222C184 - 2 ; case 6
_0222C192:
	cmp r4, #3
	bhi _0222C200
	lsl r0, r4, #2
	add r1, r5, r0
	ldr r0, _0222C220 ; =0x0000087C
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _0222C200
	ldr r1, _0222C224 ; =0x0000010D
	add r0, r5, #0
	bl ov40_0222DD9C
	mov r6, #0
	b _0222C200
_0222C1AE:
	cmp r4, #0
	bne _0222C200
	add r1, #0x18
	ldr r0, [r5, r1]
	bl Save_DressupData_get
	add r1, r4, #0
	bl sub_0202B9B8
	bl sub_0202BC10
	add r6, r0, #0
	bne _0222C200
	ldr r1, _0222C228 ; =0x00000122
	add r0, r5, #0
	bl ov40_0222DD9C
	b _0222C200
_0222C1D2:
	cmp r4, #0x64
	bne _0222C200
	bl ov40_0222DD94
	cmp r0, #0
	beq _0222C200
	ldr r1, _0222C22C ; =0x00000111
	add r0, r5, #0
	bl ov40_0222DD9C
	mov r6, #0
	b _0222C200
_0222C1EA:
	ldr r2, _0222C230 ; =0x0000270F
	cmp r4, r2
	bne _0222C200
	add r1, #0x64
	ldr r1, [r5, r1]
	cmp r1, #0
	bne _0222C200
	mov r1, #0x81
	bl ov40_0222DD9C
	mov r6, #0
_0222C200:
	cmp r6, #0
	bne _0222C20C
	ldr r0, _0222C234 ; =0x0000057C
	bl PlaySE
	b _0222C212
_0222C20C:
	ldr r0, _0222C238 ; =0x0000057B
	bl PlaySE
_0222C212:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	nop
_0222C218: .word 0x000006E4
_0222C21C: .word 0x00000818
_0222C220: .word 0x0000087C
_0222C224: .word 0x0000010D
_0222C228: .word 0x00000122
_0222C22C: .word 0x00000111
_0222C230: .word 0x0000270F
_0222C234: .word 0x0000057C
_0222C238: .word 0x0000057B
	thumb_func_end ov40_0222C15C

	thumb_func_start ov40_0222C23C
ov40_0222C23C: ; 0x0222C23C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	add r4, r2, #0
	cmp r1, #0
	bne _0222C33C
	ldr r0, _0222C340 ; =0x000006E4
	str r5, [r4, r0]
	add r0, r4, #0
	bl ov40_0222C15C
	cmp r0, #0
	beq _0222C33C
	cmp r5, #4
	bhi _0222C33C
	mov r0, #0x28
	mul r0, r5
	add r1, r4, r0
	ldr r0, _0222C344 ; =0x000005FC
	add r2, sp, #0
	ldr r0, [r1, r0]
	add r1, sp, #0
	add r1, #2
	bl ov40_0222D294
	mov r0, #0x6f
	lsl r0, r0, #4
	add r3, sp, #0
	mov r1, #2
	ldrsh r1, [r3, r1]
	mov r2, #0
	ldrsh r2, [r3, r2]
	add r1, #0x10
	lsl r1, r1, #0x10
	ldr r0, [r4, r0]
	asr r1, r1, #0x10
	bl sub_02087948
	mov r0, #0x6f
	lsl r0, r0, #4
	add r3, sp, #0
	mov r1, #2
	ldrsh r1, [r3, r1]
	mov r2, #0
	ldrsh r2, [r3, r2]
	add r1, #0x10
	lsl r1, r1, #0x10
	ldr r0, [r4, r0]
	asr r1, r1, #0x10
	bl sub_020878B8
	ldr r2, _0222C340 ; =0x000006E4
	ldr r1, _0222C348 ; =0x00000818
	ldr r0, [r4, r2]
	ldr r6, [r4, r1]
	mov r3, #0x24
	add r5, r0, #0
	mul r5, r3
	add r0, r6, r5
	ldr r5, [r0, #0x18]
	add r0, r1, #0
	add r0, #0x54
	str r5, [r4, r0]
	ldr r5, [r4, r1]
	ldr r1, [r4, r2]
	add r0, r4, #0
	add r2, r1, #0
	mul r2, r3
	add r1, r5, r2
	ldr r1, [r1, #0x14]
	bl ov40_0222BF80
	ldr r1, _0222C340 ; =0x000006E4
	ldr r0, _0222C348 ; =0x00000818
	ldr r2, [r4, r1]
	mov r1, #0x24
	ldr r3, [r4, r0]
	mul r1, r2
	add r1, r3, r1
	ldr r1, [r1, #0x14]
	cmp r1, #2
	bne _0222C2EE
	add r0, #0x50
	mov r1, #0
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl sub_02087A84
	b _0222C300
_0222C2EE:
	add r0, r4, #0
	bl ov40_0222C434
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_020879E0
_0222C300:
	ldr r1, _0222C34C ; =0x0000086C
	ldr r0, _0222C350 ; =0x000003E7
	ldr r2, [r4, r1]
	cmp r2, r0
	bne _0222C316
	add r0, r4, #0
	mov r1, #0xc1
	bl ov40_0222DFE8
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_0222C316:
	ldr r0, _0222C354 ; =0x0000270F
	cmp r2, r0
	bne _0222C328
	ldr r1, _0222C358 ; =0x0000012D
	add r0, r4, #0
	bl ov40_0222DFE8
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_0222C328:
	add r1, #0x30
	ldr r0, [r4, r1]
	cmp r0, #0
	beq _0222C33C
	add r0, r4, #0
	bl ov40_0222DE40
	ldr r0, _0222C35C ; =0x0000089C
	mov r1, #0
	str r1, [r4, r0]
_0222C33C:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0222C340: .word 0x000006E4
_0222C344: .word 0x000005FC
_0222C348: .word 0x00000818
_0222C34C: .word 0x0000086C
_0222C350: .word 0x000003E7
_0222C354: .word 0x0000270F
_0222C358: .word 0x0000012D
_0222C35C: .word 0x0000089C
	thumb_func_end ov40_0222C23C

	thumb_func_start ov40_0222C360
ov40_0222C360: ; 0x0222C360
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	add r2, r4, #0
	ldr r0, _0222C394 ; =0x0000060C
	mov r1, #0
	add r2, #0x30
	add r3, r4, #0
_0222C370:
	add r1, r1, #1
	str r2, [r3, r0]
	add r2, r2, #4
	add r3, #0x28
	cmp r1, #5
	blt _0222C370
	mov r0, #0x6d
	str r0, [sp]
	add r0, r4, #0
	ldr r2, _0222C398 ; =ov40_0222C23C
	add r0, #0x30
	mov r1, #5
	add r3, r4, #0
	bl sub_02026C44
	str r0, [r4, #0x2c]
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0222C394: .word 0x0000060C
_0222C398: .word ov40_0222C23C
	thumb_func_end ov40_0222C360

	thumb_func_start ov40_0222C39C
ov40_0222C39C: ; 0x0222C39C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r1, _0222C428 ; =0x00000818
	str r0, [sp]
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _0222C424
	mov r4, #0
	ldr r5, [sp]
	str r4, [sp, #4]
	add r6, r4, #0
	add r7, sp, #8
_0222C3B4:
	ldr r1, [sp]
	ldr r0, _0222C428 ; =0x00000818
	ldr r0, [r1, r0]
	ldr r0, [r0, r4]
	cmp r0, #0
	bne _0222C3DA
	ldr r0, _0222C42C ; =0x0000060C
	ldr r0, [r5, r0]
	strb r6, [r0]
	ldr r0, _0222C42C ; =0x0000060C
	ldr r0, [r5, r0]
	strb r6, [r0, #1]
	ldr r0, _0222C42C ; =0x0000060C
	ldr r0, [r5, r0]
	strb r6, [r0, #2]
	ldr r0, _0222C42C ; =0x0000060C
	ldr r0, [r5, r0]
	strb r6, [r0, #3]
	b _0222C416
_0222C3DA:
	ldr r0, _0222C430 ; =0x000005FC
	add r1, sp, #8
	ldr r0, [r5, r0]
	add r1, #2
	add r2, sp, #8
	bl sub_0200DE44
	mov r0, #0
	ldrsh r1, [r7, r0]
	ldr r0, _0222C42C ; =0x0000060C
	ldr r0, [r5, r0]
	sub r1, #0x10
	strb r1, [r0]
	mov r0, #0
	ldrsh r1, [r7, r0]
	ldr r0, _0222C42C ; =0x0000060C
	ldr r0, [r5, r0]
	add r1, #0x10
	strb r1, [r0, #1]
	mov r0, #2
	ldrsh r1, [r7, r0]
	ldr r0, _0222C42C ; =0x0000060C
	ldr r0, [r5, r0]
	strb r1, [r0, #2]
	mov r0, #2
	ldrsh r1, [r7, r0]
	ldr r0, _0222C42C ; =0x0000060C
	ldr r0, [r5, r0]
	add r1, #0xa0
	strb r1, [r0, #3]
_0222C416:
	ldr r0, [sp, #4]
	add r4, #0x24
	add r0, r0, #1
	add r5, #0x28
	str r0, [sp, #4]
	cmp r0, #5
	blt _0222C3B4
_0222C424:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222C428: .word 0x00000818
_0222C42C: .word 0x0000060C
_0222C430: .word 0x000005FC
	thumb_func_end ov40_0222C39C

	thumb_func_start ov40_0222C434
ov40_0222C434: ; 0x0222C434
	push {r3, r4, r5, r6, r7, lr}
	mov r6, #0
	ldr r7, _0222C46C ; =0x0000060C
	add r5, r0, #0
	add r4, r6, #0
_0222C43E:
	ldr r0, _0222C470 ; =0x000005FC
	add r1, sp, #0
	ldr r0, [r5, r0]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	ldr r0, _0222C46C ; =0x0000060C
	add r6, r6, #1
	ldr r0, [r5, r0]
	strb r4, [r0]
	ldr r0, _0222C46C ; =0x0000060C
	ldr r0, [r5, r0]
	strb r4, [r0, #1]
	ldr r0, _0222C46C ; =0x0000060C
	ldr r0, [r5, r0]
	strb r4, [r0, #2]
	ldr r0, [r5, r7]
	add r5, #0x28
	strb r4, [r0, #3]
	cmp r6, #5
	blt _0222C43E
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222C46C: .word 0x0000060C
_0222C470: .word 0x000005FC
	thumb_func_end ov40_0222C434

	thumb_func_start ov40_0222C474
ov40_0222C474: ; 0x0222C474
	ldr r3, _0222C47C ; =sub_02026CC4
	ldr r0, [r0, #0x2c]
	bx r3
	nop
_0222C47C: .word sub_02026CC4
	thumb_func_end ov40_0222C474

	thumb_func_start ov40_0222C480
ov40_0222C480: ; 0x0222C480
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0222C4B0 ; =0x000006D8
	ldr r1, [r4, r0]
	cmp r1, #0
	ble _0222C492
	sub r1, r1, #1
	str r1, [r4, r0]
	b _0222C49C
_0222C492:
	beq _0222C49C
	mov r1, #0
	str r1, [r4, r0]
	bl GF_AssertFail
_0222C49C:
	ldr r0, _0222C4B0 ; =0x000006D8
	ldr r0, [r4, r0]
	lsl r0, r0, #2
	add r1, r4, r0
	ldr r0, _0222C4B4 ; =0x0000081C
	ldr r1, [r1, r0]
	sub r0, r0, #4
	str r1, [r4, r0]
	pop {r4, pc}
	nop
_0222C4B0: .word 0x000006D8
_0222C4B4: .word 0x0000081C
	thumb_func_end ov40_0222C480

	thumb_func_start ov40_0222C4B8
ov40_0222C4B8: ; 0x0222C4B8
	ldr r1, _0222C4D8 ; =0x00000838
	mov r3, #0
	str r3, [r0, r1]
	mov r2, #0xff
	add r1, r1, #4
	str r2, [r0, r1]
	mov r1, #0x21
	add r2, r3, #0
	lsl r1, r1, #6
_0222C4CA:
	add r3, r3, #1
	str r2, [r0, r1]
	add r0, r0, #4
	cmp r3, #8
	blt _0222C4CA
	bx lr
	nop
_0222C4D8: .word 0x00000838
	thumb_func_end ov40_0222C4B8

	thumb_func_start ov40_0222C4DC
ov40_0222C4DC: ; 0x0222C4DC
	ldr r1, _0222C4E4 ; =0x00000838
	ldr r0, [r0, r1]
	bx lr
	nop
_0222C4E4: .word 0x00000838
	thumb_func_end ov40_0222C4DC

	thumb_func_start ov40_0222C4E8
ov40_0222C4E8: ; 0x0222C4E8
	ldr r2, _0222C4F4 ; =0x00000838
	mov r3, #1
	str r3, [r0, r2]
	add r2, r2, #4
	str r1, [r0, r2]
	bx lr
	.balign 4, 0
_0222C4F4: .word 0x00000838
	thumb_func_end ov40_0222C4E8

	thumb_func_start ov40_0222C4F8
ov40_0222C4F8: ; 0x0222C4F8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r0, #0
	ldr r0, [r7]
	ldr r6, [r7, #0x14]
	ldr r4, [r7, #0x24]
	ldr r5, [r7, #0x28]
	cmp r0, #0
	bne _0222C5D6
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #0x43
	add r2, r4, #0
	mov r3, #1
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #0x43
	add r2, r4, #0
	mov r3, #5
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #0x45
	add r2, r4, #0
	mov r3, #5
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add r0, r7, #0
	mov r1, #3
	bl ov40_0222DB30
	add r2, r0, #0
	mov r1, #0
	mov r0, #0x12
	str r1, [sp]
	lsl r0, r0, #4
	str r0, [sp, #4]
	str r1, [sp, #8]
	add r0, r5, #0
	mov r1, #0xbf
	mov r3, #0x6d
	bl PaletteData_LoadNarc
	add r0, r7, #0
	mov r1, #3
	bl ov40_0222DB30
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0x12
	lsl r0, r0, #4
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #0xbf
	mov r3, #0x6d
	bl PaletteData_LoadNarc
	add r0, r7, #0
	mov r1, #0
	bl ov40_0222DB30
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xe0
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #0xbf
	mov r3, #0x6d
	bl PaletteData_LoadNarc
	add r0, r7, #0
	mov r1, #0
	bl ov40_0222DB30
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xe0
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #0xbf
	mov r3, #0x6d
	bl PaletteData_LoadNarc
	b _0222C680
_0222C5D6:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #0x36
	add r2, r4, #0
	mov r3, #1
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #0x36
	add r2, r4, #0
	mov r3, #5
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #0x37
	add r2, r4, #0
	mov r3, #5
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r1, #0
	mov r0, #0x12
	str r1, [sp]
	lsl r0, r0, #4
	str r0, [sp, #4]
	str r1, [sp, #8]
	add r0, r5, #0
	mov r1, #0xbf
	mov r2, #0x35
	mov r3, #0x6d
	bl PaletteData_LoadNarc
	mov r0, #1
	str r0, [sp]
	mov r0, #0x12
	lsl r0, r0, #4
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #0xbf
	mov r2, #0x35
	mov r3, #0x6d
	bl PaletteData_LoadNarc
	mov r0, #0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xe0
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #0xbf
	mov r2, #0x34
	mov r3, #0x6d
	bl PaletteData_LoadNarc
	mov r0, #1
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xe0
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #0xbf
	mov r2, #0x34
	mov r3, #0x6d
	bl PaletteData_LoadNarc
_0222C680:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #0x46
	add r2, r4, #0
	mov r3, #5
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #0x46
	add r2, r4, #0
	mov r3, #1
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldr r0, [r7, #0x58]
	mov r1, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	add r0, r5, #0
	mov r2, #2
	mov r3, #0x10
	bl sub_02003EA4
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov40_0222C4F8

	thumb_func_start ov40_0222C6C8
ov40_0222C6C8: ; 0x0222C6C8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r1, #0
	mov r5, #2
	ldr r6, [r0, #0x14]
	ldr r4, [r0, #0x24]
	cmp r2, #0
	beq _0222C6DA
	mov r5, #0
_0222C6DA:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #0x2d
	add r2, r4, #0
	add r3, r7, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	add r3, r7, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov40_0222C6C8

	thumb_func_start ov40_0222C710
ov40_0222C710: ; 0x0222C710
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r5, [r0, #0x24]
	ldr r4, [r0, #0x14]
	mov r0, #0
	str r0, [sp]
	add r6, r1, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #0x2d
	add r2, r5, #0
	add r3, r6, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #1
	add r2, r5, #0
	add r3, r6, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov40_0222C710

	thumb_func_start ov40_0222C750
ov40_0222C750: ; 0x0222C750
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r1, r0, #0
	ldr r6, [r1, #0x18]
	ldr r5, [r1, #0x1c]
	ldr r7, [r1, #0x28]
	ldr r1, [r1]
	str r0, [sp, #0x18]
	ldr r4, [r0, #0x14]
	cmp r1, #0
	bne _0222C7B4
	mov r1, #2
	bl ov40_0222DB30
	str r4, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #3
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, _0222C87C ; =0x0000270F
	mov r1, #2
	str r0, [sp, #0x14]
	add r0, r7, #0
	add r2, r6, #0
	add r3, r5, #0
	bl sub_0200D68C
	ldr r0, [sp, #0x18]
	mov r1, #2
	bl ov40_0222DB30
	str r4, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r1, #3
	str r1, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	ldr r0, _0222C880 ; =0x00002710
	add r2, r6, #0
	str r0, [sp, #0x14]
	add r0, r7, #0
	add r3, r5, #0
	bl sub_0200D68C
	b _0222C7F6
_0222C7B4:
	str r4, [sp]
	mov r0, #0x33
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #3
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, _0222C87C ; =0x0000270F
	mov r1, #2
	str r0, [sp, #0x14]
	add r0, r7, #0
	add r2, r6, #0
	add r3, r5, #0
	bl sub_0200D68C
	str r4, [sp]
	mov r0, #0x33
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r1, #3
	str r1, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	ldr r0, _0222C880 ; =0x00002710
	add r2, r6, #0
	str r0, [sp, #0x14]
	add r0, r7, #0
	add r3, r5, #0
	bl sub_0200D68C
_0222C7F6:
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0222C87C ; =0x0000270F
	add r1, r5, #0
	str r0, [sp, #8]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #0x41
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _0222C880 ; =0x00002710
	add r1, r5, #0
	str r0, [sp, #8]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #0x41
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	ldr r0, _0222C87C ; =0x0000270F
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #0x2e
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _0222C87C ; =0x0000270F
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #0x2f
	bl sub_0200D71C
	mov r0, #0
	str r0, [sp]
	ldr r0, _0222C880 ; =0x00002710
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #0x2e
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _0222C880 ; =0x00002710
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #0x2f
	bl sub_0200D71C
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_0222C87C: .word 0x0000270F
_0222C880: .word 0x00002710
	thumb_func_end ov40_0222C750

	thumb_func_start ov40_0222C884
ov40_0222C884: ; 0x0222C884
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x80
	str r0, [sp]
	ldr r0, [r0, #0x18]
	add r4, sp, #0x28
	str r0, [sp, #0x18]
	ldr r0, [sp]
	add r2, sp, #0x20
	ldr r0, [r0, #0x1c]
	mov r1, #2
	str r0, [sp, #0x14]
	mov r0, #0
	strh r0, [r2, #0x2c]
	strh r0, [r2, #0x2e]
	strh r0, [r2, #0x30]
	strh r0, [r2, #0x32]
	str r0, [sp, #0x10]
	str r0, [sp, #0x54]
	mov r0, #1
	str r0, [sp, #0x5c]
	ldr r0, [sp, #0x10]
	ldr r3, _0222CA60 ; =ov40_02244DA8
	str r0, [sp, #0x7c]
	str r0, [sp, #0x58]
	ldr r0, _0222CA64 ; =0x0000270F
	str r1, [sp, #0x78]
	str r0, [sp, #0x60]
	str r0, [sp, #0x64]
	str r0, [sp, #0x68]
	str r0, [sp, #0x6c]
	sub r0, r1, #3
	str r0, [sp, #0x70]
	str r0, [sp, #0x74]
	add r0, sp, #0x40
	str r0, [sp, #0xc]
	ldrh r0, [r3, #0x22]
	ldr r5, _0222CA68 ; =ov40_02244DF0
	str r4, [sp, #8]
	strh r0, [r2, #0x20]
	ldrh r0, [r3, #0x24]
	add r6, sp, #0x20
	strh r0, [r2, #0x22]
	ldrh r0, [r3, #0x26]
	strh r0, [r2, #0x24]
	ldrh r0, [r3, #0x28]
	strh r0, [r2, #0x26]
	ldrh r0, [r3, #0x2a]
	strh r0, [r2, #0x28]
	ldrh r0, [r3, #0x2c]
	strh r0, [r2, #0x2a]
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldrb r0, [r3]
	ldr r4, [sp]
	ldr r1, _0222CA6C ; =0x000006F8
	strb r0, [r2]
	ldrb r0, [r3, #1]
	strb r0, [r2, #1]
	ldrb r0, [r3, #2]
	strb r0, [r2, #2]
	ldrb r0, [r3, #3]
	strb r0, [r2, #3]
	ldrb r0, [r3, #4]
	strb r0, [r2, #4]
	ldrb r0, [r3, #5]
	strb r0, [r2, #5]
	add r0, r4, #0
	add r0, r0, r1
	str r0, [sp, #4]
_0222C916:
	ldr r0, [sp, #0x10]
	mov r1, #3
	mov r7, #0
	add r5, r4, #0
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x1c]
_0222C928:
	cmp r7, #0
	bne _0222C93C
	mov r0, #1
	str r0, [sp, #0x5c]
	ldr r0, _0222CA64 ; =0x0000270F
	str r0, [sp, #0x60]
	str r0, [sp, #0x64]
	str r0, [sp, #0x68]
	str r0, [sp, #0x6c]
	b _0222C94A
_0222C93C:
	mov r0, #2
	str r0, [sp, #0x5c]
	ldr r0, _0222CA70 ; =0x00002710
	str r0, [sp, #0x60]
	str r0, [sp, #0x64]
	str r0, [sp, #0x68]
	str r0, [sp, #0x6c]
_0222C94A:
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x14]
	add r2, sp, #0x4c
	bl sub_0200D734
	ldr r1, _0222CA6C ; =0x000006F8
	ldr r2, [sp, #0xc]
	str r0, [r5, r1]
	add r0, r1, #0
	mov r1, #0
	ldrsh r1, [r2, r1]
	ldr r0, [r5, r0]
	mov r2, #0x60
	bl ov40_0222D288
	ldr r0, _0222CA6C ; =0x000006F8
	ldr r0, [r5, r0]
	bl sub_0200DC18
	ldr r0, _0222CA6C ; =0x000006F8
	mov r1, #2
	ldr r0, [r5, r0]
	bl sub_0200DF98
	ldr r0, _0222CA6C ; =0x000006F8
	ldr r1, [sp, #8]
	mov r2, #0xfe
	ldr r0, [r5, r0]
	ldr r1, [r1]
	lsl r2, r2, #0x16
	bl sub_0200E024
	mov r0, #0x72
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r4, r0]
	ldr r1, [sp, #0x1c]
	sub r0, #0xf
	strb r1, [r4, r0]
	ldr r0, _0222CA74 ; =0x00000724
	mov r1, #0
	str r1, [r4, r0]
	ldr r0, [sp, #8]
	ldr r1, [r0]
	ldr r0, _0222CA78 ; =0x00000708
	str r1, [r4, r0]
	mov r0, #0
	ldrsb r0, [r6, r0]
	lsl r1, r0, #1
	ldr r0, _0222CA7C ; =0x0000071C
	add r1, #0xa
	str r1, [r4, r0]
	ldr r0, [sp, #0x10]
	cmp r0, #3
	ldr r0, _0222CA80 ; =0x00000718
	bge _0222C9CE
	mov r1, #0
	str r1, [r4, r0]
	add r0, r1, #0
	ldrsb r1, [r6, r0]
	ldr r0, _0222CA84 ; =0x0000070E
	add r1, #8
	strh r1, [r4, r0]
	mov r1, #0
	mvn r1, r1
	b _0222C9E2
_0222C9CE:
	mov r1, #0
	str r1, [r4, r0]
	add r0, r1, #0
	ldrsb r1, [r6, r0]
	mov r0, #0xff
	add r1, #8
	sub r1, r0, r1
	ldr r0, _0222CA84 ; =0x0000070E
	strh r1, [r4, r0]
	mov r1, #1
_0222C9E2:
	add r0, r0, #2
	add r7, r7, #1
	add r5, r5, #4
	strb r1, [r4, r0]
	cmp r7, #2
	blt _0222C928
	ldr r0, _0222CA88 ; =ov40_0222D048
	ldr r1, [sp, #4]
	mov r2, #5
	bl sub_0200E33C
	mov r1, #7
	lsl r1, r1, #8
	str r0, [r4, r1]
	ldr r0, [sp, #0xc]
	add r4, #0x30
	add r0, r0, #2
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	add r6, r6, #1
	add r0, r0, #4
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	add r0, #0x30
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	add r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #6
	bge _0222CA20
	b _0222C916
_0222CA20:
	ldr r0, [sp]
	sub r1, #0x28
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _0222CA5A
	ldr r7, _0222CA74 ; =0x00000724
_0222CA2C:
	ldr r4, [sp]
	ldr r1, _0222CA6C ; =0x000006F8
	mov r0, #0
	add r2, r4, #0
	add r6, r0, #0
	add r5, r2, r1
_0222CA38:
	ldr r1, [r4, r7]
	cmp r1, #3
	beq _0222CA4C
	mov r0, #7
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	add r1, r5, #0
	bl ov40_0222D048
	mov r0, #1
_0222CA4C:
	add r6, r6, #1
	add r4, #0x30
	add r5, #0x30
	cmp r6, #6
	blt _0222CA38
	cmp r0, #0
	bne _0222CA2C
_0222CA5A:
	add sp, #0x80
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222CA60: .word ov40_02244DA8
_0222CA64: .word 0x0000270F
_0222CA68: .word ov40_02244DF0
_0222CA6C: .word 0x000006F8
_0222CA70: .word 0x00002710
_0222CA74: .word 0x00000724
_0222CA78: .word 0x00000708
_0222CA7C: .word 0x0000071C
_0222CA80: .word 0x00000718
_0222CA84: .word 0x0000070E
_0222CA88: .word ov40_0222D048
	thumb_func_end ov40_0222C884

	thumb_func_start ov40_0222CA8C
ov40_0222CA8C: ; 0x0222CA8C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r0, #0
	ldr r6, _0222CAB8 ; =0x000006F8
	str r0, [sp]
_0222CA96:
	mov r4, #0
	add r5, r7, #0
_0222CA9A:
	ldr r0, [r5, r6]
	bl sub_0200D9DC
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #2
	blt _0222CA9A
	ldr r0, [sp]
	add r7, #0x30
	add r0, r0, #1
	str r0, [sp]
	cmp r0, #6
	blt _0222CA96
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222CAB8: .word 0x000006F8
	thumb_func_end ov40_0222CA8C

	thumb_func_start ov40_0222CABC
ov40_0222CABC: ; 0x0222CABC
	push {r4, r5, r6, lr}
	mov r6, #7
	add r5, r0, #0
	mov r4, #0
	lsl r6, r6, #8
_0222CAC6:
	ldr r0, [r5, r6]
	bl DestroySysTask
	add r4, r4, #1
	add r5, #0x30
	cmp r4, #6
	blt _0222CAC6
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov40_0222CABC

	thumb_func_start ov40_0222CAD8
ov40_0222CAD8: ; 0x0222CAD8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	ldr r1, [r0, #0x14]
	ldr r7, [r0, #0x1c]
	str r1, [sp, #0x10]
	ldr r1, [r0, #0x18]
	ldr r0, [r0]
	str r1, [sp, #0xc]
	cmp r0, #6
	bhi _0222CB2E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222CAF8: ; jump table
	.short _0222CB06 - _0222CAF8 - 2 ; case 0
	.short _0222CB2E - _0222CAF8 - 2 ; case 1
	.short _0222CB0E - _0222CAF8 - 2 ; case 2
	.short _0222CB26 - _0222CAF8 - 2 ; case 3
	.short _0222CB1E - _0222CAF8 - 2 ; case 4
	.short _0222CB16 - _0222CAF8 - 2 ; case 5
	.short _0222CB16 - _0222CAF8 - 2 ; case 6
_0222CB06:
	mov r6, #0x3f
	mov r4, #0x18
	mov r5, #0x19
	b _0222CB34
_0222CB0E:
	mov r6, #0x11
	mov r4, #0x12
	mov r5, #0x13
	b _0222CB34
_0222CB16:
	mov r6, #8
	mov r4, #9
	mov r5, #0xa
	b _0222CB34
_0222CB1E:
	mov r6, #0xb
	mov r4, #0xc
	mov r5, #0xd
	b _0222CB34
_0222CB26:
	mov r6, #0xe
	mov r4, #0xf
	mov r5, #0x10
	b _0222CB34
_0222CB2E:
	mov r6, #0x30
	mov r4, #0x16
	mov r5, #0x17
_0222CB34:
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0222CBB8 ; =0x00002711
	ldr r2, [sp, #0x10]
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	add r1, r7, #0
	add r3, r6, #0
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _0222CBBC ; =0x00002712
	ldr r2, [sp, #0x10]
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	add r1, r7, #0
	add r3, r6, #0
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	ldr r0, _0222CBB8 ; =0x00002711
	ldr r2, [sp, #0x10]
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	add r1, r7, #0
	add r3, r4, #0
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _0222CBBC ; =0x00002712
	ldr r2, [sp, #0x10]
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	add r1, r7, #0
	add r3, r4, #0
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _0222CBB8 ; =0x00002711
	ldr r2, [sp, #0x10]
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	add r1, r7, #0
	add r3, r5, #0
	bl sub_0200D71C
	mov r0, #0
	str r0, [sp]
	ldr r0, _0222CBBC ; =0x00002712
	ldr r2, [sp, #0x10]
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	add r1, r7, #0
	add r3, r5, #0
	bl sub_0200D71C
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222CBB8: .word 0x00002711
_0222CBBC: .word 0x00002712
	thumb_func_end ov40_0222CAD8

	thumb_func_start ov40_0222CBC0
ov40_0222CBC0: ; 0x0222CBC0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x1c]
	ldr r1, _0222CBD8 ; =0x00002711
	bl sub_0200D958
	ldr r0, [r4, #0x1c]
	ldr r1, _0222CBDC ; =0x00002712
	bl sub_0200D958
	pop {r4, pc}
	nop
_0222CBD8: .word 0x00002711
_0222CBDC: .word 0x00002712
	thumb_func_end ov40_0222CBC0

	thumb_func_start ov40_0222CBE0
ov40_0222CBE0: ; 0x0222CBE0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, _0222CCA0 ; =0x00000534
	mov r7, #0
	add r4, r6, r0
	add r5, r6, #0
_0222CBEC:
	mov r2, #0x6e
	lsl r2, r2, #4
	ldr r3, [r6, r2]
	mov r2, #5
	sub r2, r2, r3
	lsl r2, r2, #4
	add r2, #0xd9
	lsl r2, r2, #0x10
	ldr r0, [r4]
	mov r1, #0x32
	asr r2, r2, #0x10
	bl ov40_0222D288
	ldr r0, _0222CCA4 ; =0x00000548
	mov r1, #0x24
	add r2, r1, #0
	ldr r0, [r5, r0]
	sub r2, #0x2c
	bl sub_020136B4
	add r7, r7, #1
	add r4, #0x28
	add r5, #0x28
	cmp r7, #5
	blt _0222CBEC
	mov r5, #0
	add r4, r6, #0
	add r7, sp, #0
_0222CC24:
	ldr r0, _0222CCA8 ; =0x000006D8
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _0222CC9E
	ldr r0, _0222CCA0 ; =0x00000534
	add r1, sp, #0
	ldr r0, [r4, r0]
	add r1, #2
	add r2, sp, #0
	bl ov40_0222D294
	ldr r0, _0222CCA8 ; =0x000006D8
	ldr r1, [r6, r0]
	sub r0, r1, #1
	cmp r0, r5
	bne _0222CC54
	mov r0, #0xa9
	strh r0, [r7]
	ldr r0, _0222CCA0 ; =0x00000534
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_0200DD24
	b _0222CC82
_0222CC54:
	mov r0, #2
	ldrsh r0, [r7, r0]
	sub r1, r1, r5
	lsl r1, r1, #2
	sub r0, r0, r1
	strh r0, [r7, #2]
	ldr r0, _0222CCA8 ; =0x000006D8
	mov r2, #5
	ldr r0, [r6, r0]
	sub r1, r0, r5
	sub r0, r1, #1
	sub r2, r2, r1
	mov r1, #0x24
	mul r1, r2
	lsl r0, r0, #4
	add r1, #0x19
	add r0, r0, r1
	strh r0, [r7]
	ldr r0, _0222CCA0 ; =0x00000534
	mov r1, #2
	ldr r0, [r4, r0]
	bl sub_0200DD24
_0222CC82:
	ldr r0, _0222CCA0 ; =0x00000534
	mov r1, #2
	mov r2, #0
	ldrsh r1, [r7, r1]
	ldrsh r2, [r7, r2]
	ldr r0, [r4, r0]
	bl ov40_0222D288
	ldr r0, _0222CCA8 ; =0x000006D8
	add r5, r5, #1
	ldr r0, [r6, r0]
	add r4, #0x28
	cmp r5, r0
	blt _0222CC24
_0222CC9E:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222CCA0: .word 0x00000534
_0222CCA4: .word 0x00000548
_0222CCA8: .word 0x000006D8
	thumb_func_end ov40_0222CBE0

	thumb_func_start ov40_0222CCAC
ov40_0222CCAC: ; 0x0222CCAC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x50
	add r5, r0, #0
	ldr r0, _0222CE64 ; =0x00000534
	mov r1, #0x6e
	add r4, r5, r0
	ldr r0, [r5, #0x18]
	add r2, sp, #0x18
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x1c]
	lsl r1, r1, #4
	str r0, [sp, #8]
	ldr r0, [r5, #0x28]
	str r0, [sp, #4]
	mov r0, #0x2a
	strh r0, [r2, #4]
	ldr r3, [r5, r1]
	mov r0, #5
	sub r0, r0, r3
	lsl r0, r0, #4
	add r0, #0xc9
	strh r0, [r2, #6]
	ldr r1, [r5, r1]
	cmp r1, #2
	bne _0222CCE8
	mov r0, #4
	sub r0, r0, r1
	lsl r0, r0, #4
	add r0, #0xc9
	strh r0, [r2, #6]
_0222CCE8:
	mov r0, #0
	str r0, [sp, #0x10]
	add r1, r0, #0
	add r0, sp, #0x18
	strh r1, [r0, #8]
	ldr r1, [sp, #0x10]
	mov r2, #1
	strh r1, [r0, #0xa]
	add r0, r1, #0
	str r1, [sp, #0x4c]
	ldr r1, _0222CE68 ; =0x00002711
	str r0, [sp, #0x24]
	str r1, [sp, #0x30]
	sub r1, r1, #2
	mov r0, #3
	str r0, [sp, #0x48]
	sub r0, r0, #4
	str r1, [sp, #0x14]
	str r1, [sp, #0x34]
	ldr r1, _0222CE68 ; =0x00002711
	ldr r6, _0222CE6C ; =ov40_02244DC0
	ldr r7, [sp, #0x10]
	str r2, [sp, #0x2c]
	str r2, [sp, #0x28]
	str r1, [sp, #0x38]
	str r1, [sp, #0x3c]
	str r0, [sp, #0x40]
	str r0, [sp, #0x44]
_0222CD20:
	mov r0, #2
	str r0, [sp, #0x2c]
	ldr r0, _0222CE70 ; =0x00002712
	ldr r1, [sp, #8]
	str r0, [sp, #0x30]
	sub r0, r0, #2
	str r0, [sp, #0x34]
	ldr r0, _0222CE70 ; =0x00002712
	add r2, sp, #0x1c
	str r0, [sp, #0x38]
	str r0, [sp, #0x3c]
	ldrb r0, [r6, #5]
	str r0, [sp, #0x24]
	ldr r0, [sp, #0xc]
	bl sub_0200D734
	str r0, [r4]
	bl sub_0200DC18
	ldr r0, [r4]
	mov r1, #1
	bl sub_0200DCE8
	add r2, sp, #0x18
	mov r1, #4
	ldrsh r1, [r2, r1]
	add r3, r2, #0
	mov r2, #6
	add r1, #8
	lsl r1, r1, #0x10
	ldrsh r2, [r3, r2]
	ldr r0, [r4]
	asr r1, r1, #0x10
	bl ov40_0222D288
	mov r0, #1
	str r0, [sp, #0x2c]
	ldr r0, _0222CE68 ; =0x00002711
	ldr r1, [sp, #8]
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x14]
	add r2, sp, #0x1c
	str r0, [sp, #0x34]
	ldr r0, _0222CE68 ; =0x00002711
	str r0, [sp, #0x38]
	str r0, [sp, #0x3c]
	ldrb r0, [r6]
	str r0, [sp, #0x24]
	ldr r0, [sp, #0xc]
	bl sub_0200D734
	add r1, r4, #0
	add r1, #0xc8
	str r0, [r1]
	add r0, r4, #0
	add r0, #0xc8
	ldr r0, [r0]
	bl sub_0200DC18
	add r2, sp, #0x18
	mov r1, #4
	add r0, r4, #0
	add r0, #0xc8
	ldrsh r1, [r2, r1]
	add r3, r2, #0
	mov r2, #6
	ldrsh r2, [r3, r2]
	ldr r0, [r0]
	bl ov40_0222D288
	ldr r1, _0222CE74 ; =0x00000818
	add r0, r4, #0
	ldr r1, [r5, r1]
	add r0, #0xc8
	ldr r0, [r0]
	ldr r1, [r1, r7]
	bl sub_0200DCE8
	ldr r0, [sp, #0x10]
	add r6, r6, #1
	add r0, r0, #1
	add r4, #0x28
	add r7, #0x24
	str r0, [sp, #0x10]
	cmp r0, #5
	blt _0222CD20
	mov r4, #0
	add r6, r5, #0
	add r7, sp, #0x18
_0222CDD2:
	ldr r0, _0222CE78 ; =0x000006D8
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222CE4C
	ldr r0, _0222CE64 ; =0x00000534
	add r1, sp, #0x18
	ldr r0, [r6, r0]
	add r1, #2
	add r2, sp, #0x18
	bl ov40_0222D294
	ldr r0, _0222CE78 ; =0x000006D8
	ldr r1, [r5, r0]
	sub r0, r1, #1
	cmp r0, r4
	bne _0222CE02
	mov r0, #0xa9
	strh r0, [r7]
	ldr r0, _0222CE64 ; =0x00000534
	mov r1, #1
	ldr r0, [r6, r0]
	bl sub_0200DD24
	b _0222CE30
_0222CE02:
	mov r0, #2
	ldrsh r0, [r7, r0]
	sub r1, r1, r4
	lsl r1, r1, #2
	sub r0, r0, r1
	strh r0, [r7, #2]
	ldr r0, _0222CE78 ; =0x000006D8
	mov r2, #5
	ldr r0, [r5, r0]
	sub r1, r0, r4
	sub r0, r1, #1
	sub r2, r2, r1
	mov r1, #0x24
	mul r1, r2
	lsl r0, r0, #4
	add r1, #0x19
	add r0, r0, r1
	strh r0, [r7]
	ldr r0, _0222CE64 ; =0x00000534
	mov r1, #2
	ldr r0, [r6, r0]
	bl sub_0200DD24
_0222CE30:
	ldr r0, _0222CE64 ; =0x00000534
	mov r1, #2
	mov r2, #0
	ldrsh r1, [r7, r1]
	ldrsh r2, [r7, r2]
	ldr r0, [r6, r0]
	bl ov40_0222D288
	ldr r0, _0222CE78 ; =0x000006D8
	add r4, r4, #1
	ldr r0, [r5, r0]
	add r6, #0x28
	cmp r4, r0
	blt _0222CDD2
_0222CE4C:
	ldr r0, [r5, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r0, [sp, #4]
	mov r2, #0xc
	mov r3, #0x10
	bl sub_02003EA4
	add sp, #0x50
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222CE64: .word 0x00000534
_0222CE68: .word 0x00002711
_0222CE6C: .word ov40_02244DC0
_0222CE70: .word 0x00002712
_0222CE74: .word 0x00000818
_0222CE78: .word 0x000006D8
	thumb_func_end ov40_0222CCAC

	thumb_func_start ov40_0222CE7C
ov40_0222CE7C: ; 0x0222CE7C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0222CED0 ; =0x000005FC
	mov r4, #0
	str r4, [sp]
	add r6, r5, #0
	add r7, r5, r0
_0222CE8A:
	ldr r1, _0222CED4 ; =0x00000818
	ldr r0, _0222CED0 ; =0x000005FC
	ldr r1, [r5, r1]
	ldr r0, [r6, r0]
	ldr r1, [r1, r4]
	bl sub_0200DCE8
	ldr r0, _0222CED4 ; =0x00000818
	ldr r0, [r5, r0]
	add r1, r0, r4
	ldr r0, [r0, r4]
	cmp r0, #0
	beq _0222CEBE
	ldr r0, _0222CED0 ; =0x000005FC
	ldr r1, [r1, #0xc]
	ldr r0, [r6, r0]
	bl sub_0200DC4C
	ldr r0, _0222CED4 ; =0x00000818
	add r1, r7, #0
	ldr r2, [r5, r0]
	add r0, r5, #0
	add r3, r2, r4
	ldr r2, [r3, #8]
	bl ov40_0222D3E8
_0222CEBE:
	ldr r0, [sp]
	add r4, #0x24
	add r0, r0, #1
	add r6, #0x28
	add r7, #0x28
	str r0, [sp]
	cmp r0, #5
	blt _0222CE8A
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222CED0: .word 0x000005FC
_0222CED4: .word 0x00000818
	thumb_func_end ov40_0222CE7C

	thumb_func_start ov40_0222CED8
ov40_0222CED8: ; 0x0222CED8
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, _0222CF08 ; =0x00000548
	add r5, r0, #0
	add r6, r7, #0
	mov r4, #0
	sub r6, #0x14
_0222CEE4:
	ldr r1, _0222CF0C ; =0x000005FC
	mov r0, #0x61
	ldr r1, [r5, r1]
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	ldr r1, [r1]
	bl sub_02013FD0
	ldr r1, [r5, r6]
	ldr r0, [r5, r7]
	ldr r1, [r1]
	bl sub_02013FD0
	add r4, r4, #1
	add r5, #0x28
	cmp r4, #5
	blt _0222CEE4
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222CF08: .word 0x00000548
_0222CF0C: .word 0x000005FC
	thumb_func_end ov40_0222CED8

	thumb_func_start ov40_0222CF10
ov40_0222CF10: ; 0x0222CF10
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r0, _0222CF84 ; =0x000006D8
	ldr r1, [r7, r0]
	cmp r1, #0
	beq _0222CF80
	mov r0, #0
	str r0, [sp]
	cmp r1, #0
	ble _0222CF80
	ldr r0, _0222CF88 ; =0x00000534
	add r4, r7, #0
	add r5, r7, #0
	add r6, r7, r0
_0222CF2C:
	ldr r1, _0222CF8C ; =0x000006C4
	ldr r0, _0222CF88 ; =0x00000534
	ldr r1, [r4, r1]
	ldr r0, [r5, r0]
	ldr r1, [r1, #0xc]
	bl sub_0200DC4C
	ldr r0, _0222CF8C ; =0x000006C4
	add r1, r6, #0
	ldr r3, [r4, r0]
	add r0, r7, #0
	ldr r2, [r3, #8]
	bl ov40_0222D3E8
	ldr r0, _0222CF90 ; =0x00000548
	mov r1, #0x24
	add r2, r1, #0
	ldr r0, [r5, r0]
	sub r2, #0x2c
	bl sub_020136B4
	ldr r0, _0222CF90 ; =0x00000548
	mov r1, #1
	ldr r0, [r5, r0]
	bl sub_020137C0
	ldr r0, _0222CF88 ; =0x00000534
	mov r1, #1
	ldr r0, [r5, r0]
	bl sub_0200DCE8
	ldr r0, [sp]
	add r4, r4, #4
	add r0, r0, #1
	str r0, [sp]
	ldr r0, _0222CF84 ; =0x000006D8
	add r5, #0x28
	ldr r1, [r7, r0]
	ldr r0, [sp]
	add r6, #0x28
	cmp r0, r1
	blt _0222CF2C
_0222CF80:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222CF84: .word 0x000006D8
_0222CF88: .word 0x00000534
_0222CF8C: .word 0x000006C4
_0222CF90: .word 0x00000548
	thumb_func_end ov40_0222CF10

	thumb_func_start ov40_0222CF94
ov40_0222CF94: ; 0x0222CF94
	push {r3, r4, r5, lr}
	ldr r1, _0222CFB8 ; =0x00000534
	mov r4, #0
	add r5, r0, r1
_0222CF9C:
	ldr r0, [r5]
	bl sub_0200D9DC
	add r0, r5, #0
	add r0, #0xc8
	ldr r0, [r0]
	bl sub_0200D9DC
	add r4, r4, #1
	add r5, #0x28
	cmp r4, #5
	blt _0222CF9C
	pop {r3, r4, r5, pc}
	nop
_0222CFB8: .word 0x00000534
	thumb_func_end ov40_0222CF94

	thumb_func_start ov40_0222CFBC
ov40_0222CFBC: ; 0x0222CFBC
	push {r3, r4, r5, r6, r7, lr}
	mov r7, #0x15
	add r5, r0, #0
	add r4, r1, #0
	mov r6, #0
	lsl r7, r7, #6
_0222CFC8:
	ldr r0, [r5, r7]
	cmp r0, #0
	ldr r0, _0222D038 ; =0x00000548
	bne _0222CFE4
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_020137C0
	ldr r0, _0222D03C ; =0x00000534
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_0200DCE8
	b _0222CFF6
_0222CFE4:
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl sub_020137C0
	ldr r0, _0222D03C ; =0x00000534
	add r1, r4, #0
	ldr r0, [r5, r0]
	bl sub_0200DCE8
_0222CFF6:
	ldr r0, _0222D040 ; =0x00000608
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _0222D016
	mov r0, #0x61
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_020137C0
	ldr r0, _0222D044 ; =0x000005FC
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_0200DCE8
	b _0222D02C
_0222D016:
	mov r0, #0x61
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl sub_020137C0
	ldr r0, _0222D044 ; =0x000005FC
	add r1, r4, #0
	ldr r0, [r5, r0]
	bl sub_0200DCE8
_0222D02C:
	add r6, r6, #1
	add r5, #0x28
	cmp r6, #5
	blt _0222CFC8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222D038: .word 0x00000548
_0222D03C: .word 0x00000534
_0222D040: .word 0x00000608
_0222D044: .word 0x000005FC
	thumb_func_end ov40_0222CFBC

	thumb_func_start ov40_0222D048
ov40_0222D048: ; 0x0222D048
	push {r4, lr}
	sub sp, #0x40
	add r4, r1, #0
	ldr r0, [r4, #0x1c]
	add r0, r0, #1
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	str r0, [r4, #0x1c]
	beq _0222D064
	b _0222D278
_0222D064:
	ldr r0, [r4, #0x2c]
	cmp r0, #3
	bls _0222D06C
	b _0222D246
_0222D06C:
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0222D078: ; jump table
	.short _0222D080 - _0222D078 - 2 ; case 0
	.short _0222D096 - _0222D078 - 2 ; case 1
	.short _0222D10C - _0222D078 - 2 ; case 2
	.short _0222D1B6 - _0222D078 - 2 ; case 3
_0222D080:
	ldr r1, [r4, #0x28]
	cmp r1, #3
	bne _0222D090
	add r0, r0, #1
	str r0, [r4, #0x2c]
	mov r0, #0
	str r0, [r4, #0x28]
	b _0222D246
_0222D090:
	add r0, r1, #1
	str r0, [r4, #0x28]
	b _0222D246
_0222D096:
	ldr r1, [r4, #0x28]
	cmp r1, #4
	bne _0222D0A6
	add r0, r0, #1
	str r0, [r4, #0x2c]
	mov r0, #0
	str r0, [r4, #0x28]
	b _0222D246
_0222D0A6:
	ldr r0, [r4]
	add r1, sp, #0x24
	add r2, sp, #0x20
	bl sub_0200DF2C
	ldr r0, [r4, #4]
	add r1, sp, #0x1c
	add r2, sp, #0x18
	bl sub_0200DF2C
	ldr r1, [r4, #0x20]
	ldr r0, _0222D27C ; =0x0000FFFF
	mul r0, r1
	mov r1, #0x5a
	lsl r1, r1, #2
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl GF_SinDeg
	mov r1, #0x18
	ldrsb r1, [r4, r1]
	ldr r2, [sp, #0x24]
	neg r1, r1
	mul r0, r1
	add r0, r2, r0
	mov r1, #0x5a
	str r0, [sp, #0x24]
	str r0, [sp, #0x1c]
	ldr r0, [r4, #0x20]
	lsl r1, r1, #2
	add r0, #0x20
	str r0, [r4, #0x20]
	bl _s32_div_f
	str r1, [r4, #0x20]
	ldr r0, [r4]
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x20]
	bl sub_0200DF08
	ldr r0, [r4, #4]
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x18]
	bl sub_0200DF08
	ldr r0, [r4, #0x28]
	add r0, r0, #1
	str r0, [r4, #0x28]
	b _0222D246
_0222D10C:
	ldr r3, _0222D280 ; =ov40_02244DD8
	add r2, sp, #0x28
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	add r2, sp, #0
	ldr r0, [r4]
	add r1, sp, #4
	add r2, #2
	bl sub_0200DE44
	ldr r0, [r4, #4]
	add r1, sp, #4
	add r2, sp, #0
	bl sub_0200DE44
	ldr r1, [r4, #0x28]
	cmp r1, #0
	bne _0222D15A
	mov r0, #0x16
	ldrsh r2, [r4, r0]
	add r1, sp, #0
	mov r0, #4
	ldrsh r0, [r1, r0]
	sub r0, r2, r0
	strh r0, [r4, #0x14]
	mov r0, #0x14
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #0x24]
	bl _s32_div_f
	strh r0, [r4, #0x14]
	ldr r0, [r4, #0x28]
	add r0, r0, #1
	str r0, [r4, #0x28]
	b _0222D194
_0222D15A:
	ldr r0, [r4, #0x24]
	add r0, r0, #1
	cmp r1, r0
	bne _0222D180
	mov r0, #0x16
	ldrsh r1, [r4, r0]
	add r0, sp, #0
	strh r1, [r0, #4]
	ldrb r0, [r4, #0x19]
	lsl r1, r0, #2
	add r0, sp, #0x28
	ldr r0, [r0, r1]
	str r0, [r4, #0x20]
	ldr r0, [r4, #0x2c]
	add r0, r0, #1
	str r0, [r4, #0x2c]
	mov r0, #0
	str r0, [r4, #0x28]
	b _0222D194
_0222D180:
	add r1, sp, #0
	mov r0, #4
	ldrsh r2, [r1, r0]
	mov r0, #0x14
	ldrsh r0, [r4, r0]
	add r0, r2, r0
	strh r0, [r1, #4]
	ldr r0, [r4, #0x28]
	add r0, r0, #1
	str r0, [r4, #0x28]
_0222D194:
	add r3, sp, #0
	mov r1, #4
	mov r2, #2
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	ldr r0, [r4]
	bl sub_0200DDB8
	add r3, sp, #0
	mov r1, #4
	mov r2, #0
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	ldr r0, [r4, #4]
	bl sub_0200DDB8
	b _0222D246
_0222D1B6:
	ldr r0, [r4, #0x28]
	cmp r0, #0
	bne _0222D1CE
	add r1, r4, #0
	ldr r0, [r4]
	add r1, #0xc
	add r2, sp, #0x10
	bl sub_0200DF2C
	ldr r0, [r4, #0x28]
	add r0, r0, #1
	str r0, [r4, #0x28]
_0222D1CE:
	ldr r0, [r4]
	add r1, sp, #0x14
	add r2, sp, #0x10
	bl sub_0200DF2C
	ldr r0, [r4, #4]
	add r1, sp, #0xc
	add r2, sp, #8
	bl sub_0200DF2C
	ldr r1, [r4, #0x20]
	ldr r0, _0222D27C ; =0x0000FFFF
	mul r0, r1
	mov r1, #0x5a
	lsl r1, r1, #2
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl GF_SinDeg
	mov r2, #0x18
	ldrsb r2, [r4, r2]
	ldr r1, [r4, #0xc]
	neg r3, r2
	lsl r2, r0, #1
	add r0, r0, r2
	mul r0, r3
	add r0, r1, r0
	str r0, [sp, #0x14]
	str r0, [sp, #0xc]
	ldrb r0, [r4, #0x19]
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	ldr r0, [r4, #0x20]
	beq _0222D222
	sub r0, r0, #4
	b _0222D224
_0222D222:
	add r0, r0, #4
_0222D224:
	str r0, [r4, #0x20]
	mov r1, #0x5a
	ldr r0, [r4, #0x20]
	lsl r1, r1, #2
	bl _s32_div_f
	str r1, [r4, #0x20]
	ldr r0, [r4]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	bl sub_0200DF08
	ldr r0, [r4, #4]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #8]
	bl sub_0200DF08
_0222D246:
	ldr r0, [r4, #0x2c]
	cmp r0, #2
	blt _0222D278
	ldr r0, [r4, #0x10]
	ldr r1, _0222D284 ; =0x3DCCCCCD
	bl _fgr
	bls _0222D278
	ldr r0, [r4, #0x10]
	ldr r1, _0222D284 ; =0x3DCCCCCD
	bl _fsub
	str r0, [r4, #0x10]
	mov r2, #0xfe
	ldr r0, [r4]
	ldr r1, [r4, #0x10]
	lsl r2, r2, #0x16
	bl sub_0200E024
	mov r2, #0xfe
	ldr r0, [r4, #4]
	ldr r1, [r4, #0x10]
	lsl r2, r2, #0x16
	bl sub_0200E024
_0222D278:
	add sp, #0x40
	pop {r4, pc}
	.balign 4, 0
_0222D27C: .word 0x0000FFFF
_0222D280: .word ov40_02244DD8
_0222D284: .word 0x3DCCCCCD
	thumb_func_end ov40_0222D048

	thumb_func_start ov40_0222D288
ov40_0222D288: ; 0x0222D288
	push {r3, lr}
	mov r3, #1
	lsl r3, r3, #0x14
	bl sub_0200DDF4
	pop {r3, pc}
	thumb_func_end ov40_0222D288

	thumb_func_start ov40_0222D294
ov40_0222D294: ; 0x0222D294
	push {r3, lr}
	mov r3, #1
	lsl r3, r3, #0x14
	bl sub_0200DE94
	pop {r3, pc}
	thumb_func_end ov40_0222D294

	thumb_func_start ov40_0222D2A0
ov40_0222D2A0: ; 0x0222D2A0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x7c
	add r6, r0, #0
	ldr r0, _0222D3DC ; =ov40_02244DA8
	ldr r2, [r0, #8]
	ldr r1, [r0, #0xc]
	str r2, [sp, #0x2c]
	str r1, [sp, #0x30]
	ldr r1, [r0, #0x10]
	ldr r0, [r0, #0x14]
	str r1, [sp, #0x24]
	str r0, [sp, #0x28]
	mov r0, #0
	ldr r1, _0222D3E0 ; =0x000005FC
	str r0, [sp, #0x1c]
	add r0, r6, r1
	sub r1, #0xc8
	str r0, [sp, #0x14]
	add r0, r6, r1
	str r0, [sp, #0x10]
_0222D2C8:
	ldr r0, [sp, #0x14]
	ldr r1, _0222D3E4 ; =ov40_02244DC0
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x10]
	add r4, sp, #0x34
	str r0, [sp, #0x38]
	mov r0, #0
	str r0, [sp, #0x18]
	add r0, sp, #0x24
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x1c]
	add r5, sp, #0x2c
	add r0, r1, r0
	str r0, [sp, #8]
	add r7, sp, #0x3c
_0222D2E6:
	add r0, r7, #0
	bl InitWindow
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r6, #0x24]
	add r1, r7, #0
	mov r2, #0x14
	mov r3, #2
	bl AddTextWindowTopLeftCorner
	add r0, r7, #0
	mov r1, #0x6d
	bl sub_02013910
	ldr r1, [r4]
	mov r2, #0x6d
	str r0, [r1, #0x18]
	ldr r1, [r5]
	add r0, r7, #0
	bl sub_02013688
	ldr r3, [r4]
	ldr r2, [r5]
	mov r1, #1
	add r3, #0x1c
	bl sub_02021AC8
	ldr r0, [r4]
	add r1, sp, #0x20
	ldr r0, [r0]
	add r1, #2
	add r2, sp, #0x20
	bl sub_0200DE44
	ldr r0, [r6, #0x50]
	str r7, [sp, #0x50]
	str r0, [sp, #0x4c]
	ldr r0, [r6, #0x1c]
	bl sub_0200E2B0
	str r0, [sp, #0x54]
	ldr r1, [sp, #0xc]
	ldr r0, [r6, #0x1c]
	ldr r1, [r1]
	bl sub_0200D934
	str r0, [sp, #0x58]
	ldr r0, [r4]
	add r1, sp, #0x20
	ldr r0, [r0]
	ldr r0, [r0]
	str r0, [sp, #0x5c]
	ldr r0, [r4]
	ldr r0, [r0, #0x20]
	str r0, [sp, #0x60]
	mov r0, #2
	ldrsh r0, [r1, r0]
	add r0, #0x24
	str r0, [sp, #0x64]
	mov r0, #0
	ldrsh r0, [r1, r0]
	sub r0, #8
	str r0, [sp, #0x68]
	mov r0, #3
	str r0, [sp, #0x6c]
	ldr r0, [sp, #8]
	ldrb r0, [r0]
	sub r0, r0, #1
	str r0, [sp, #0x70]
	ldr r0, [r5]
	str r0, [sp, #0x74]
	mov r0, #0x6d
	str r0, [sp, #0x78]
	ldr r1, [r4]
	add r0, sp, #0x4c
	ldr r1, [r1, #0x18]
	bl sub_02013950
	ldr r1, [r4]
	str r0, [r1, #0x14]
	ldr r0, [r4]
	mov r1, #1
	ldr r0, [r0, #0x14]
	bl sub_020138E0
	add r0, r7, #0
	bl RemoveWindow
	ldr r0, [r4]
	mov r1, #0
	ldr r0, [r0, #0x14]
	bl sub_020137C0
	ldr r0, [sp, #0xc]
	add r4, r4, #4
	add r0, r0, #4
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	add r5, r5, #4
	add r0, r0, #5
	str r0, [sp, #8]
	ldr r0, [sp, #0x18]
	add r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, #2
	blt _0222D2E6
	ldr r0, [sp, #0x14]
	add r0, #0x28
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	add r0, #0x28
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x1c]
	add r0, r0, #1
	str r0, [sp, #0x1c]
	cmp r0, #5
	bge _0222D3D6
	b _0222D2C8
_0222D3D6:
	add sp, #0x7c
	pop {r4, r5, r6, r7, pc}
	nop
_0222D3DC: .word ov40_02244DA8
_0222D3E0: .word 0x000005FC
_0222D3E4: .word ov40_02244DC0
	thumb_func_end ov40_0222D2A0

	thumb_func_start ov40_0222D3E8
ov40_0222D3E8: ; 0x0222D3E8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r4, r0, #0
	add r5, r3, #0
	str r1, [sp, #0x10]
	ldr r0, [r4, #0x48]
	cmp r2, #8
	bne _0222D478
	ldr r1, [r5, #0x18]
	lsl r1, r1, #2
	add r3, r4, r1
	ldr r1, _0222D554 ; =0x0000088C
	ldr r1, [r3, r1]
	cmp r1, #0
	bne _0222D410
	add r1, r2, #0
	bl NewString_ReadMsgData
	add r5, r0, #0
	b _0222D504
_0222D410:
	mov r0, #0x6d
	bl ov40_0222DAB0
	add r6, r0, #0
	ldr r0, [r4, #0x48]
	mov r1, #7
	bl NewString_ReadMsgData
	add r7, r0, #0
	ldr r0, [r5, #0x18]
	lsl r0, r0, #2
	add r1, r4, r0
	ldr r0, _0222D554 ; =0x0000088C
	ldr r0, [r1, r0]
	mov r1, #0x6d
	bl sub_020315B8
	str r0, [sp, #0x14]
	ldr r1, [sp, #0x14]
	add r0, r4, #0
	bl ov40_02230DCC
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	add r5, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	mov r1, #0
	str r0, [sp, #4]
	ldr r2, [sp, #0x14]
	add r0, r6, #0
	add r3, r1, #0
	bl BufferString
	add r0, r6, #0
	add r1, r5, #0
	add r2, r7, #0
	bl StringExpandPlaceholders
	add r0, r7, #0
	bl String_dtor
	ldr r0, [sp, #0x14]
	bl String_dtor
	add r0, r6, #0
	bl ScrStrBufs_delete
	b _0222D504
_0222D478:
	cmp r2, #0x29
	bne _0222D4FC
	ldr r1, [r5, #0x18]
	lsl r1, r1, #2
	add r3, r4, r1
	ldr r1, _0222D554 ; =0x0000088C
	ldr r1, [r3, r1]
	cmp r1, #0
	bne _0222D494
	add r1, r2, #0
	bl NewString_ReadMsgData
	add r5, r0, #0
	b _0222D504
_0222D494:
	mov r0, #0x6d
	bl ov40_0222DAB0
	add r6, r0, #0
	ldr r0, [r4, #0x48]
	mov r1, #7
	bl NewString_ReadMsgData
	add r7, r0, #0
	ldr r0, [r5, #0x18]
	lsl r0, r0, #2
	add r1, r4, r0
	ldr r0, _0222D554 ; =0x0000088C
	ldr r0, [r1, r0]
	mov r1, #0x6d
	bl sub_020315B8
	str r0, [sp, #0x18]
	ldr r1, [sp, #0x18]
	add r0, r4, #0
	bl ov40_02230DCC
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	add r5, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	mov r1, #0
	str r0, [sp, #4]
	ldr r2, [sp, #0x18]
	add r0, r6, #0
	add r3, r1, #0
	bl BufferString
	add r0, r6, #0
	add r1, r5, #0
	add r2, r7, #0
	bl StringExpandPlaceholders
	add r0, r7, #0
	bl String_dtor
	ldr r0, [sp, #0x18]
	bl String_dtor
	add r0, r6, #0
	bl ScrStrBufs_delete
	b _0222D504
_0222D4FC:
	add r1, r2, #0
	bl NewString_ReadMsgData
	add r5, r0, #0
_0222D504:
	add r0, sp, #0x1c
	bl InitWindow
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r4, #0x24]
	add r1, sp, #0x1c
	mov r2, #0x14
	mov r3, #2
	bl AddTextWindowTopLeftCorner
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222D558 ; =0x000E0D00
	add r2, r5, #0
	str r0, [sp, #8]
	add r0, sp, #0x1c
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x10]
	ldr r0, [r0, #0x14]
	ldr r1, [r1, #0x18]
	add r2, sp, #0x1c
	mov r3, #0x6d
	bl sub_020139D0
	add r0, r5, #0
	bl String_dtor
	add r0, sp, #0x1c
	bl RemoveWindow
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222D554: .word 0x0000088C
_0222D558: .word 0x000E0D00
	thumb_func_end ov40_0222D3E8

	thumb_func_start ov40_0222D55C
ov40_0222D55C: ; 0x0222D55C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	mov r1, #0
	str r1, [sp]
	ldr r1, _0222D5A8 ; =0x000005FC
	add r7, r0, r1
	sub r1, #0xc8
	add r6, r0, r1
_0222D56C:
	str r7, [sp, #4]
	str r6, [sp, #8]
	mov r4, #0
	add r5, sp, #4
_0222D574:
	ldr r0, [r5]
	ldr r0, [r0, #0x18]
	bl sub_02013938
	ldr r0, [r5]
	ldr r0, [r0, #0x14]
	bl sub_020139C8
	ldr r0, [r5]
	add r0, #0x1c
	bl sub_02021B5C
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #2
	blt _0222D574
	ldr r0, [sp]
	add r7, #0x28
	add r0, r0, #1
	add r6, #0x28
	str r0, [sp]
	cmp r0, #5
	blt _0222D56C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0222D5A8: .word 0x000005FC
	thumb_func_end ov40_0222D55C

	thumb_func_start ov40_0222D5AC
ov40_0222D5AC: ; 0x0222D5AC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	add r7, r2, #0
	add r5, r0, #0
	add r4, r1, #0
	ldr r6, _0222D668 ; =0x0000270F
	cmp r7, #2
	bne _0222D5BE
	add r6, r6, #1
_0222D5BE:
	add r0, sp, #0xc
	bl InitWindow
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r4, #0x10]
	add r1, sp, #0xc
	mov r2, #0x14
	mov r3, #2
	bl AddTextWindowTopLeftCorner
	add r0, sp, #0xc
	mov r1, #0x6d
	bl sub_02013910
	str r0, [r5, #0xc]
	add r0, sp, #0xc
	add r1, r7, #0
	mov r2, #0x6d
	bl sub_02013688
	add r3, r5, #0
	mov r1, #1
	add r2, r7, #0
	add r3, #0x10
	bl sub_02021AC8
	add r1, sp, #8
	ldr r0, [r5, #4]
	add r1, #2
	add r2, sp, #8
	bl sub_0200DE44
	ldr r0, [r4, #0x3c]
	str r0, [sp, #0x1c]
	add r0, sp, #0xc
	str r0, [sp, #0x20]
	ldr r0, [r4, #8]
	bl sub_0200E2B0
	str r0, [sp, #0x24]
	ldr r0, [r4, #8]
	add r1, r6, #0
	bl sub_0200D934
	str r0, [sp, #0x28]
	ldr r0, [r5, #4]
	add r1, sp, #8
	ldr r0, [r0]
	str r0, [sp, #0x2c]
	ldr r0, [r5, #0x14]
	str r0, [sp, #0x30]
	mov r0, #2
	ldrsh r0, [r1, r0]
	add r0, #0x24
	str r0, [sp, #0x34]
	mov r0, #0
	ldrsh r1, [r1, r0]
	sub r1, #8
	str r0, [sp, #0x40]
	mov r0, #0x6d
	str r1, [sp, #0x38]
	mov r1, #3
	str r0, [sp, #0x48]
	str r7, [sp, #0x44]
	str r1, [sp, #0x3c]
	ldr r1, [r5, #0xc]
	add r0, sp, #0x1c
	bl sub_02013950
	mov r1, #1
	str r0, [r5, #8]
	bl sub_020138E0
	add r0, sp, #0xc
	bl RemoveWindow
	ldr r0, [r5, #8]
	mov r1, #0
	bl sub_020137C0
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	nop
_0222D668: .word 0x0000270F
	thumb_func_end ov40_0222D5AC

	thumb_func_start ov40_0222D66C
ov40_0222D66C: ; 0x0222D66C
	push {r4, r5, r6, lr}
	sub sp, #0x20
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x34]
	add r1, r2, #0
	bl NewString_ReadMsgData
	add r6, r0, #0
	add r0, sp, #0x10
	bl InitWindow
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r4, #0x10]
	add r1, sp, #0x10
	mov r2, #0x14
	mov r3, #2
	bl AddTextWindowTopLeftCorner
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222D6CC ; =0x000E0D00
	add r2, r6, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, sp, #0x10
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	ldr r0, [r5, #8]
	ldr r1, [r5, #0xc]
	add r2, sp, #0x10
	mov r3, #0x6d
	bl sub_020139D0
	add r0, r6, #0
	bl String_dtor
	add r0, sp, #0x10
	bl RemoveWindow
	add sp, #0x20
	pop {r4, r5, r6, pc}
	nop
_0222D6CC: .word 0x000E0D00
	thumb_func_end ov40_0222D66C

	thumb_func_start ov40_0222D6D0
ov40_0222D6D0: ; 0x0222D6D0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl sub_02013938
	ldr r0, [r4, #8]
	bl sub_020139C8
	add r4, #0x10
	add r0, r4, #0
	bl sub_02021B5C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov40_0222D6D0

	thumb_func_start ov40_0222D6EC
ov40_0222D6EC: ; 0x0222D6EC
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	ldr r6, [r0, #0x14]
	ldr r4, [r0, #0x18]
	ldr r5, [r0, #0x1c]
	mov r0, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, _0222D738 ; =0x00002E94
	add r1, r5, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r2, r6, #0
	mov r3, #0x31
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	ldr r0, _0222D738 ; =0x00002E94
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r6, #0
	mov r3, #0x1a
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _0222D738 ; =0x00002E94
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r6, #0
	mov r3, #0x1b
	bl sub_0200D71C
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0222D738: .word 0x00002E94
	thumb_func_end ov40_0222D6EC

	thumb_func_start ov40_0222D73C
ov40_0222D73C: ; 0x0222D73C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	ldr r6, [r0, #0x14]
	ldr r4, [r0, #0x18]
	ldr r5, [r0, #0x1c]
	mov r0, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, _0222D788 ; =0x00002E94
	add r1, r5, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r2, r6, #0
	mov r3, #0x7a
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	ldr r0, _0222D788 ; =0x00002E94
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r6, #0
	mov r3, #0x7b
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _0222D788 ; =0x00002E94
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r6, #0
	mov r3, #0x7c
	bl sub_0200D71C
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0222D788: .word 0x00002E94
	thumb_func_end ov40_0222D73C

	thumb_func_start ov40_0222D78C
ov40_0222D78C: ; 0x0222D78C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	ldr r6, [r0, #0x14]
	ldr r4, [r0, #0x18]
	ldr r5, [r0, #0x1c]
	mov r0, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, _0222D7D8 ; =0x00002E94
	add r1, r5, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r2, r6, #0
	mov r3, #0x1e
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	ldr r0, _0222D7D8 ; =0x00002E94
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r6, #0
	mov r3, #0x20
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _0222D7D8 ; =0x00002E94
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r6, #0
	mov r3, #0x1f
	bl sub_0200D71C
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0222D7D8: .word 0x00002E94
	thumb_func_end ov40_0222D78C

	thumb_func_start ov40_0222D7DC
ov40_0222D7DC: ; 0x0222D7DC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x1c]
	ldr r1, _0222D7FC ; =0x00002E94
	bl sub_0200D958
	ldr r0, [r4, #0x1c]
	ldr r1, _0222D7FC ; =0x00002E94
	bl sub_0200D978
	ldr r0, [r4, #0x1c]
	ldr r1, _0222D7FC ; =0x00002E94
	bl sub_0200D988
	pop {r4, pc}
	nop
_0222D7FC: .word 0x00002E94
	thumb_func_end ov40_0222D7DC

	thumb_func_start ov40_0222D800
ov40_0222D800: ; 0x0222D800
	push {r3, r4, lr}
	sub sp, #0x34
	add r2, r0, #0
	mov r3, #0x80
	add r0, sp, #0
	strh r3, [r0]
	mov r3, #0x60
	strh r3, [r0, #2]
	mov r3, #0
	strh r3, [r0, #4]
	strh r3, [r0, #6]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #3
	str r0, [sp, #0x2c]
	sub r0, r0, #4
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	ldr r0, _0222D868 ; =0x00002E94
	str r3, [sp, #0xc]
	str r1, [sp, #0x10]
	str r3, [sp, #0x30]
	str r0, [sp, #0x14]
	str r0, [sp, #0x1c]
	str r0, [sp, #0x20]
	cmp r1, #1
	bne _0222D83C
	ldr r0, _0222D86C ; =0x0000270F
	str r0, [sp, #0x18]
	b _0222D840
_0222D83C:
	ldr r0, _0222D870 ; =0x00002710
	str r0, [sp, #0x18]
_0222D840:
	ldr r0, [r2, #0x18]
	ldr r1, [r2, #0x1c]
	add r2, sp, #0
	bl sub_0200D734
	add r4, r0, #0
	mov r1, #2
	bl sub_0200DD10
	add r0, r4, #0
	mov r1, #0
	bl sub_0200DC4C
	add r0, r4, #0
	bl sub_0200DC18
	add r0, r4, #0
	add sp, #0x34
	pop {r3, r4, pc}
	nop
_0222D868: .word 0x00002E94
_0222D86C: .word 0x0000270F
_0222D870: .word 0x00002710
	thumb_func_end ov40_0222D800

	thumb_func_start ov40_0222D874
ov40_0222D874: ; 0x0222D874
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	bl ov40_0222CFBC
	add r0, r4, #0
	bl ov40_0222CF94
	add r0, r4, #0
	bl ov40_0222CBC0
	pop {r4, pc}
	thumb_func_end ov40_0222D874

	thumb_func_start ov40_0222D88C
ov40_0222D88C: ; 0x0222D88C
	push {r4, lr}
	add r4, r0, #0
	bl ov40_0222CAD8
	add r0, r4, #0
	bl ov40_0222C480
	add r0, r4, #0
	bl sub_02088030
	add r0, r4, #0
	bl ov40_0222CCAC
	add r0, r4, #0
	mov r1, #1
	bl ov40_0222CFBC
	add r0, r4, #0
	bl ov40_0222CE7C
	add r0, r4, #0
	bl ov40_0222CED8
	add r0, r4, #0
	bl ov40_0222CBE0
	add r0, r4, #0
	bl ov40_0222CF10
	pop {r4, pc}
	thumb_func_end ov40_0222D88C

	thumb_func_start ov40_0222D8C8
ov40_0222D8C8: ; 0x0222D8C8
	push {r4, lr}
	add r4, r0, #0
	bl ov40_0222CAD8
	add r0, r4, #0
	bl ov40_0222C480
	add r0, r4, #0
	bl sub_02088030
	add r0, r4, #0
	bl ov40_0222CCAC
	add r0, r4, #0
	mov r1, #1
	bl ov40_0222CFBC
	add r0, r4, #0
	bl ov40_0222CE7C
	add r0, r4, #0
	bl ov40_0222CED8
	add r0, r4, #0
	bl ov40_0222CBE0
	add r0, r4, #0
	bl ov40_0222CF10
	ldr r0, _0222D90C ; =0x000006D8
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	pop {r4, pc}
	.balign 4, 0
_0222D90C: .word 0x000006D8
	thumb_func_end ov40_0222D8C8

	thumb_func_start ov40_0222D910
ov40_0222D910: ; 0x0222D910
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0
	str r0, [r5]
	add r4, r1, #0
	mov r0, #0x1f
	str r0, [r4]
	ldr r0, [sp, #0x20]
	add r6, r2, #0
	add r7, r3, #0
	cmp r0, #0
	bne _0222D948
	ldr r0, [r4]
	add r1, r6, #0
	str r0, [sp]
	ldr r0, _0222D978 ; =0x04000050
	ldr r3, [r5]
	add r2, r7, #0
	bl G2x_SetBlendAlpha_
	ldr r0, [r4]
	ldr r1, [sp, #0x18]
	str r0, [sp]
	ldr r0, _0222D97C ; =0x04001050
	ldr r2, [sp, #0x1c]
	ldr r3, [r5]
	bl G2x_SetBlendAlpha_
_0222D948:
	ldr r0, [sp, #0x20]
	cmp r0, #1
	bne _0222D95E
	ldr r0, [r4]
	add r1, r6, #0
	str r0, [sp]
	ldr r0, _0222D978 ; =0x04000050
	ldr r3, [r5]
	add r2, r7, #0
	bl G2x_SetBlendAlpha_
_0222D95E:
	ldr r0, [sp, #0x20]
	cmp r0, #2
	bne _0222D974
	ldr r0, [r4]
	ldr r1, [sp, #0x18]
	str r0, [sp]
	ldr r0, _0222D97C ; =0x04001050
	ldr r2, [sp, #0x1c]
	ldr r3, [r5]
	bl G2x_SetBlendAlpha_
_0222D974:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222D978: .word 0x04000050
_0222D97C: .word 0x04001050
	thumb_func_end ov40_0222D910

	thumb_func_start ov40_0222D980
ov40_0222D980: ; 0x0222D980
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [sp, #0x20]
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	cmp r0, #0
	bne _0222D9B0
	ldr r0, [r4]
	add r1, r6, #0
	str r0, [sp]
	ldr r0, _0222D9E0 ; =0x04000050
	ldr r3, [r5]
	add r2, r7, #0
	bl G2x_SetBlendAlpha_
	ldr r0, [r4]
	ldr r1, [sp, #0x18]
	str r0, [sp]
	ldr r0, _0222D9E4 ; =0x04001050
	ldr r2, [sp, #0x1c]
	ldr r3, [r5]
	bl G2x_SetBlendAlpha_
_0222D9B0:
	ldr r0, [sp, #0x20]
	cmp r0, #1
	bne _0222D9C6
	ldr r0, [r4]
	add r1, r6, #0
	str r0, [sp]
	ldr r0, _0222D9E0 ; =0x04000050
	ldr r3, [r5]
	add r2, r7, #0
	bl G2x_SetBlendAlpha_
_0222D9C6:
	ldr r0, [sp, #0x20]
	cmp r0, #2
	bne _0222D9DC
	ldr r0, [r4]
	ldr r1, [sp, #0x18]
	str r0, [sp]
	ldr r0, _0222D9E4 ; =0x04001050
	ldr r2, [sp, #0x1c]
	ldr r3, [r5]
	bl G2x_SetBlendAlpha_
_0222D9DC:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222D9E0: .word 0x04000050
_0222D9E4: .word 0x04001050
	thumb_func_end ov40_0222D980

	thumb_func_start ov40_0222D9E8
ov40_0222D9E8: ; 0x0222D9E8
	push {r3, r4, lr}
	sub sp, #0xc
	mov r4, #8
	str r4, [sp]
	mov r3, #0x12
	str r3, [sp, #4]
	str r2, [sp, #8]
	add r2, r4, #0
	bl ov40_0222D910
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov40_0222D9E8

	thumb_func_start ov40_0222DA00
ov40_0222DA00: ; 0x0222DA00
	push {r4, r5}
	mov r4, #1
	cmp r2, #0
	ldr r2, [r0]
	bne _0222DA22
	cmp r2, #8
	bge _0222DA14
	add r2, r2, #1
	str r2, [r0]
	mov r4, #0
_0222DA14:
	ldr r2, [r1]
	cmp r2, #7
	ble _0222DA38
	sub r2, r2, #3
	str r2, [r1]
	mov r4, #0
	b _0222DA38
_0222DA22:
	cmp r2, #0
	ble _0222DA2C
	sub r2, r2, #1
	str r2, [r0]
	mov r4, #0
_0222DA2C:
	ldr r2, [r1]
	cmp r2, #0x1f
	bge _0222DA38
	add r2, r2, #3
	str r2, [r1]
	mov r4, #0
_0222DA38:
	cmp r3, #0
	bne _0222DA54
	ldr r2, [r1]
	ldr r5, [r0]
	lsl r2, r2, #8
	orr r5, r2
	ldr r2, _0222DA7C ; =0x04000052
	strh r5, [r2]
	ldr r2, [r1]
	ldr r5, [r0]
	lsl r2, r2, #8
	orr r5, r2
	ldr r2, _0222DA80 ; =0x04001052
	strh r5, [r2]
_0222DA54:
	cmp r3, #1
	bne _0222DA64
	ldr r2, [r1]
	ldr r5, [r0]
	lsl r2, r2, #8
	orr r5, r2
	ldr r2, _0222DA7C ; =0x04000052
	strh r5, [r2]
_0222DA64:
	cmp r3, #2
	bne _0222DA76
	ldr r2, [r0]
	ldr r0, [r1]
	add r1, r2, #0
	lsl r0, r0, #8
	orr r1, r0
	ldr r0, _0222DA80 ; =0x04001052
	strh r1, [r0]
_0222DA76:
	add r0, r4, #0
	pop {r4, r5}
	bx lr
	.balign 4, 0
_0222DA7C: .word 0x04000052
_0222DA80: .word 0x04001052
	thumb_func_end ov40_0222DA00

	thumb_func_start ov40_0222DA84
ov40_0222DA84: ; 0x0222DA84
	mov r2, #1
	cmp r1, #1
	ldr r1, [r0]
	bne _0222DA98
	cmp r1, #0x10
	bge _0222DAA2
	add r1, r1, #2
	str r1, [r0]
	mov r2, #0
	b _0222DAA2
_0222DA98:
	cmp r1, #0
	ble _0222DAA2
	sub r1, r1, #2
	str r1, [r0]
	mov r2, #0
_0222DAA2:
	add r0, r2, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov40_0222DA84

	thumb_func_start ov40_0222DAA8
ov40_0222DAA8: ; 0x0222DAA8
	mov r1, #0x10
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov40_0222DAA8

	thumb_func_start ov40_0222DAB0
ov40_0222DAB0: ; 0x0222DAB0
	ldr r3, _0222DABC ; =ScrStrBufs_new_custom
	add r2, r0, #0
	mov r0, #4
	mov r1, #0x40
	bx r3
	nop
_0222DABC: .word ScrStrBufs_new_custom
	thumb_func_end ov40_0222DAB0

	thumb_func_start ov40_0222DAC0
ov40_0222DAC0: ; 0x0222DAC0
	push {r3, r4, r5}
	sub sp, #0x1c
	ldr r4, _0222DAEC ; =ov40_02244E5C
	add r5, r0, #0
	ldmia r4!, {r0, r1}
	add r3, sp, #0
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	add r5, #0x5c
	str r0, [r3]
	ldrb r0, [r5]
	lsl r0, r0, #2
	ldr r0, [r2, r0]
	add sp, #0x1c
	pop {r3, r4, r5}
	bx lr
	nop
_0222DAEC: .word ov40_02244E5C
	thumb_func_end ov40_0222DAC0

	thumb_func_start ov40_0222DAF0
ov40_0222DAF0: ; 0x0222DAF0
	push {r3, r4, r5}
	sub sp, #0x1c
	ldr r4, _0222DB28 ; =ov40_02244E94
	add r5, r0, #0
	ldmia r4!, {r0, r1}
	add r3, sp, #0
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	str r0, [r3]
	ldr r0, [r5]
	cmp r0, #0
	beq _0222DB1A
	add sp, #0x1c
	ldr r0, _0222DB2C ; =0x00007E05
	pop {r3, r4, r5}
	bx lr
_0222DB1A:
	add r5, #0x5c
	ldrb r0, [r5]
	lsl r0, r0, #2
	ldr r0, [r2, r0]
	add sp, #0x1c
	pop {r3, r4, r5}
	bx lr
	.balign 4, 0
_0222DB28: .word ov40_02244E94
_0222DB2C: .word 0x00007E05
	thumb_func_end ov40_0222DAF0

	thumb_func_start ov40_0222DB30
ov40_0222DB30: ; 0x0222DB30
	push {r4, r5, r6, r7, lr}
	sub sp, #0x74
	ldr r4, _0222DBDC ; =ov40_02244EB0
	add r5, r0, #0
	add r2, r1, #0
	add r3, sp, #0x58
	ldmia r4!, {r0, r1}
	str r3, [sp]
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	ldr r4, _0222DBE0 ; =ov40_02244E40
	str r0, [r3]
	add r3, sp, #0x3c
	ldmia r4!, {r0, r1}
	mov ip, r3
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	ldr r4, _0222DBE4 ; =ov40_02244ECC
	str r0, [r3]
	add r3, sp, #0x20
	ldmia r4!, {r0, r1}
	add r7, r3, #0
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	ldr r4, _0222DBE8 ; =ov40_02244E78
	str r0, [r3]
	add r3, sp, #4
	ldmia r4!, {r0, r1}
	add r6, r3, #0
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	add r5, #0x5c
	str r0, [r3]
	ldrb r0, [r5]
	cmp r2, #3
	bhi _0222DBD0
	add r1, r2, r2
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0222DBA4: ; jump table
	.short _0222DBAC - _0222DBA4 - 2 ; case 0
	.short _0222DBB6 - _0222DBA4 - 2 ; case 1
	.short _0222DBC0 - _0222DBA4 - 2 ; case 2
	.short _0222DBC8 - _0222DBA4 - 2 ; case 3
_0222DBAC:
	lsl r1, r0, #2
	ldr r0, [sp]
	add sp, #0x74
	ldr r0, [r0, r1]
	pop {r4, r5, r6, r7, pc}
_0222DBB6:
	lsl r1, r0, #2
	mov r0, ip
	add sp, #0x74
	ldr r0, [r0, r1]
	pop {r4, r5, r6, r7, pc}
_0222DBC0:
	lsl r0, r0, #2
	add sp, #0x74
	ldr r0, [r7, r0]
	pop {r4, r5, r6, r7, pc}
_0222DBC8:
	lsl r0, r0, #2
	add sp, #0x74
	ldr r0, [r6, r0]
	pop {r4, r5, r6, r7, pc}
_0222DBD0:
	bl GF_AssertFail
	ldr r0, [sp, #0x58]
	add sp, #0x74
	pop {r4, r5, r6, r7, pc}
	nop
_0222DBDC: .word ov40_02244EB0
_0222DBE0: .word ov40_02244E40
_0222DBE4: .word ov40_02244ECC
_0222DBE8: .word ov40_02244E78
	thumb_func_end ov40_0222DB30

	thumb_func_start ov40_0222DBEC
ov40_0222DBEC: ; 0x0222DBEC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	ldr r1, [r5, #0x18]
	ldr r4, [r5, #0x28]
	str r1, [sp, #0x18]
	ldr r7, [r5, #0x1c]
	ldr r6, [r5, #0x14]
	mov r1, #3
	bl ov40_0222DB30
	add r2, r0, #0
	mov r1, #0
	mov r0, #0x12
	str r1, [sp]
	lsl r0, r0, #4
	str r0, [sp, #4]
	str r1, [sp, #8]
	add r0, r4, #0
	mov r1, #0xbf
	mov r3, #0x6d
	bl PaletteData_LoadNarc
	add r0, r5, #0
	mov r1, #3
	bl ov40_0222DB30
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0x12
	lsl r0, r0, #4
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0xbf
	mov r3, #0x6d
	bl PaletteData_LoadNarc
	add r0, r5, #0
	mov r1, #0
	bl ov40_0222DB30
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xe0
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0xbf
	mov r3, #0x6d
	bl PaletteData_LoadNarc
	add r0, r5, #0
	mov r1, #0
	bl ov40_0222DB30
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xe0
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0xbf
	mov r3, #0x6d
	bl PaletteData_LoadNarc
	add r1, r5, #0
	mov r0, #0x6f
	add r1, #0x5c
	lsl r0, r0, #4
	ldrb r1, [r1]
	ldr r0, [r5, r0]
	bl sub_0208763C
	add r1, r5, #0
	mov r0, #0x6f
	add r1, #0x5c
	lsl r0, r0, #4
	ldrb r1, [r1]
	ldr r0, [r5, r0]
	bl sub_0208763C
	ldr r1, _0222DD00 ; =0x0000270F
	add r0, r7, #0
	bl sub_0200D968
	ldr r1, _0222DD04 ; =0x00002710
	add r0, r7, #0
	bl sub_0200D968
	add r0, r5, #0
	mov r1, #2
	bl ov40_0222DB30
	str r6, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #3
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, _0222DD00 ; =0x0000270F
	ldr r2, [sp, #0x18]
	str r0, [sp, #0x14]
	add r0, r4, #0
	mov r1, #2
	add r3, r7, #0
	bl sub_0200D68C
	add r0, r5, #0
	mov r1, #2
	bl ov40_0222DB30
	str r6, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r1, #3
	str r1, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	ldr r0, _0222DD04 ; =0x00002710
	ldr r2, [sp, #0x18]
	str r0, [sp, #0x14]
	add r0, r4, #0
	add r3, r7, #0
	bl sub_0200D68C
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_0222DD00: .word 0x0000270F
_0222DD04: .word 0x00002710
	thumb_func_end ov40_0222DBEC

	thumb_func_start ov40_0222DD08
ov40_0222DD08: ; 0x0222DD08
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, [r4, #0x58]
	ldr r2, _0222DD64 ; =0x0000FFFF
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r4, #0x28]
	mov r1, #2
	mov r3, #0
	bl sub_02003EA4
	ldr r0, [r4, #0x58]
	mov r1, #0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r4, #0x28]
	ldr r2, _0222DD64 ; =0x0000FFFF
	add r3, r1, #0
	bl sub_02003EA4
	ldr r0, [r4, #0x58]
	ldr r2, _0222DD64 ; =0x0000FFFF
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r4, #0x28]
	mov r1, #3
	mov r3, #0
	bl sub_02003EA4
	ldr r0, [r4, #0x58]
	ldr r2, _0222DD64 ; =0x0000FFFF
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r4, #0x28]
	mov r1, #1
	mov r3, #0
	bl sub_02003EA4
	add sp, #4
	pop {r3, r4, pc}
	nop
_0222DD64: .word 0x0000FFFF
	thumb_func_end ov40_0222DD08

	thumb_func_start ov40_0222DD68
ov40_0222DD68: ; 0x0222DD68
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r2, #0
	mov r2, #0
	add r3, r0, #0
	str r2, [sp]
	add r0, sp, #8
	str r0, [sp, #4]
	mov r0, #0x4a
	mov r1, #0xd
	bl GfGfxLoader_LoadFromNarc_GetSizeOut
	ldr r1, [sp, #8]
	lsr r1, r1, #1
	str r1, [r4]
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov40_0222DD68

	thumb_func_start ov40_0222DD8C
ov40_0222DD8C: ; 0x0222DD8C
	mov r2, #0x87
	lsl r2, r2, #4
	str r1, [r0, r2]
	bx lr
	thumb_func_end ov40_0222DD8C

	thumb_func_start ov40_0222DD94
ov40_0222DD94: ; 0x0222DD94
	mov r1, #0x87
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end ov40_0222DD94

	thumb_func_start ov40_0222DD9C
ov40_0222DD9C: ; 0x0222DD9C
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	ldr r4, _0222DE34 ; =0x000008A4
	add r6, r1, #0
	add r5, r0, #0
	sub r1, r4, #4
	ldr r1, [r5, r1]
	cmp r1, #1
	beq _0222DE30
	mov r2, #1
	sub r1, r4, #4
	str r2, [r5, r1]
	mov r1, #6
	mov r2, #0
	bl ov40_0222C6C8
	ldr r0, _0222DE38 ; =0x04001050
	mov r1, #0
	strh r1, [r0]
	mov r0, #6
	bl SetBgPriority
	add r0, r5, r4
	bl InitWindow
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1e
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	mov r0, #0x20
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x24]
	add r1, r5, r4
	mov r2, #6
	mov r3, #1
	bl AddWindowParameterized
	ldr r0, [r5, #0x48]
	add r1, r6, #0
	bl NewString_ReadMsgData
	add r6, r0, #0
	add r0, r5, r4
	mov r1, #0xcc
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222DE3C ; =0x000F0D0C
	add r2, r6, #0
	str r0, [sp, #8]
	add r0, r5, r4
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, r4
	bl ScheduleWindowCopyToVram
	add r0, r6, #0
	bl String_dtor
	bl OS_WaitVBlankIntr
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
_0222DE30:
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0222DE34: .word 0x000008A4
_0222DE38: .word 0x04001050
_0222DE3C: .word 0x000F0D0C
	thumb_func_end ov40_0222DD9C

	thumb_func_start ov40_0222DE40
ov40_0222DE40: ; 0x0222DE40
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #0x8a
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _0222DE9C
	mov r1, #0
	str r1, [r4, r0]
	add r0, r0, #4
	add r0, r4, r0
	bl ClearWindowTilemapAndCopyToVram
	ldr r0, _0222DEA0 ; =0x000008A4
	add r0, r4, r0
	bl RemoveWindow
	ldr r0, [r4, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #6
	mov r1, #2
	bl SetBgPriority
	mov r0, #8
	str r0, [sp]
	ldr r0, _0222DEA4 ; =0x04000050
	mov r1, #4
	mov r2, #0x12
	mov r3, #7
	bl G2x_SetBlendAlpha_
	mov r0, #8
	str r0, [sp]
	ldr r0, _0222DEA8 ; =0x04001050
	mov r1, #4
	mov r2, #0x12
	mov r3, #7
	bl G2x_SetBlendAlpha_
_0222DE9C:
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0222DEA0: .word 0x000008A4
_0222DEA4: .word 0x04000050
_0222DEA8: .word 0x04001050
	thumb_func_end ov40_0222DE40

	thumb_func_start ov40_0222DEAC
ov40_0222DEAC: ; 0x0222DEAC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0222DECC ; =0x000008A4
	add r0, r4, r0
	bl ClearWindowTilemapAndCopyToVram
	ldr r0, _0222DECC ; =0x000008A4
	add r0, r4, r0
	bl RemoveWindow
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	pop {r4, pc}
	nop
_0222DECC: .word 0x000008A4
	thumb_func_end ov40_0222DEAC

	thumb_func_start ov40_0222DED0
ov40_0222DED0: ; 0x0222DED0
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	ldr r4, _0222DF58 ; =0x000008A4
	add r6, r1, #0
	add r5, r0, #0
	sub r1, r4, #4
	ldr r1, [r5, r1]
	cmp r1, #1
	beq _0222DF54
	mov r2, #1
	sub r1, r4, #4
	str r2, [r5, r1]
	mov r1, #2
	mov r2, #0
	bl ov40_0222C6C8
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	add r0, r5, r4
	bl InitWindow
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1e
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	mov r0, #0x20
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x24]
	add r1, r5, r4
	mov r2, #2
	mov r3, #1
	bl AddWindowParameterized
	ldr r0, [r5, #0x48]
	add r1, r6, #0
	bl NewString_ReadMsgData
	add r6, r0, #0
	add r0, r5, r4
	mov r1, #0xcc
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222DF5C ; =0x000F0D0C
	add r2, r6, #0
	str r0, [sp, #8]
	add r0, r5, r4
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, r4
	bl ScheduleWindowCopyToVram
	add r0, r6, #0
	bl String_dtor
_0222DF54:
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0222DF58: .word 0x000008A4
_0222DF5C: .word 0x000F0D0C
	thumb_func_end ov40_0222DED0

	thumb_func_start ov40_0222DF60
ov40_0222DF60: ; 0x0222DF60
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r6, _0222DFA8 ; =0x000008A4
	add r5, r0, #0
	sub r0, r6, #4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222DFA4
	ldr r0, [r5, #0x48]
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r5, r6
	mov r1, #0xcc
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222DFAC ; =0x000F0D0C
	add r2, r4, #0
	str r0, [sp, #8]
	add r0, r5, r6
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, r6
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	bl String_dtor
_0222DFA4:
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222DFA8: .word 0x000008A4
_0222DFAC: .word 0x000F0D0C
	thumb_func_end ov40_0222DF60

	thumb_func_start ov40_0222DFB0
ov40_0222DFB0: ; 0x0222DFB0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x8a
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _0222DFE2
	mov r1, #0
	str r1, [r4, r0]
	add r0, r0, #4
	add r0, r4, r0
	bl ClearWindowTilemapAndCopyToVram
	ldr r0, _0222DFE4 ; =0x000008A4
	add r0, r4, r0
	bl RemoveWindow
	ldr r0, [r4, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
_0222DFE2:
	pop {r4, pc}
	.balign 4, 0
_0222DFE4: .word 0x000008A4
	thumb_func_end ov40_0222DFB0

	thumb_func_start ov40_0222DFE8
ov40_0222DFE8: ; 0x0222DFE8
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	ldr r4, _0222E090 ; =0x000008A4
	add r5, r0, #0
	sub r0, r4, #4
	ldr r0, [r5, r0]
	add r6, r1, #0
	cmp r0, #1
	beq _0222E08A
	add r0, r4, #0
	sub r0, #8
	ldr r0, [r5, r0]
	cmp r0, #1
	beq _0222E08A
	mov r1, #1
	sub r0, r4, #4
	str r1, [r5, r0]
	add r0, r4, #0
	sub r0, #8
	str r1, [r5, r0]
	ldr r0, _0222E094 ; =0x04001050
	mov r1, #0
	strh r1, [r0]
	mov r0, #6
	bl SetBgPriority
	add r0, r5, #0
	mov r1, #6
	mov r2, #0
	bl ov40_0222C6C8
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	add r0, r5, r4
	bl InitWindow
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1e
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	mov r0, #0x20
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x24]
	add r1, r5, r4
	mov r2, #6
	mov r3, #1
	bl AddWindowParameterized
	ldr r0, [r5, #0x48]
	add r1, r6, #0
	bl NewString_ReadMsgData
	add r6, r0, #0
	add r0, r5, r4
	mov r1, #0xcc
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222E098 ; =0x000F0D0C
	add r2, r6, #0
	str r0, [sp, #8]
	add r0, r5, r4
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, r4
	bl ScheduleWindowCopyToVram
	add r0, r6, #0
	bl String_dtor
_0222E08A:
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	nop
_0222E090: .word 0x000008A4
_0222E094: .word 0x04001050
_0222E098: .word 0x000F0D0C
	thumb_func_end ov40_0222DFE8

	thumb_func_start ov40_0222E09C
ov40_0222E09C: ; 0x0222E09C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0xd8
	ldr r3, _0222E428 ; =ov40_02244F40
	add r7, r1, #0
	str r0, [sp, #0x14]
	add r2, sp, #0x88
	mov r1, #0x28
_0222E0AA:
	ldrh r0, [r3]
	add r3, r3, #2
	strh r0, [r2]
	add r2, r2, #2
	sub r1, r1, #1
	bne _0222E0AA
	ldr r4, _0222E42C ; =ov40_02244F10
	add r3, sp, #0x58
	mov r2, #6
_0222E0BC:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0222E0BC
	mov r0, #1
	str r0, [sp, #0x24]
	mov r0, #0
	ldr r4, [sp, #0x14]
	str r0, [sp, #0x28]
	add r0, sp, #0x58
	add r4, #0xc
	str r0, [sp, #0x1c]
	add r5, sp, #0x88
_0222E0D6:
	ldr r1, [sp, #0x1c]
	ldr r0, [r7, #0x48]
	ldr r1, [r1]
	bl NewString_ReadMsgData
	add r6, r0, #0
	add r0, r4, #0
	bl InitWindow
	mov r0, #2
	ldrsh r0, [r5, r0]
	mov r3, #0
	add r1, r4, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #4
	ldrsh r0, [r5, r0]
	mov r2, #2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	mov r0, #6
	ldrsh r0, [r5, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x24]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldrsh r3, [r5, r3]
	ldr r0, [r7, #0x24]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r1, r6, #0
	bl ov40_022306C0
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222E430 ; =0x000F0D00
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r2, r6, #0
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	mov r0, #4
	ldrsh r1, [r5, r0]
	mov r0, #6
	ldrsh r0, [r5, r0]
	add r2, r1, #0
	mul r2, r0
	ldr r0, [sp, #0x24]
	add r0, r0, r2
	str r0, [sp, #0x24]
	add r0, r6, #0
	bl String_dtor
	ldr r0, [sp, #0x1c]
	add r4, #0x10
	add r0, r0, #4
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x28]
	add r5, #8
	add r0, r0, #1
	str r0, [sp, #0x28]
	cmp r0, #8
	blt _0222E0D6
	ldr r0, [sp, #0x14]
	ldr r0, [r0]
	str r0, [sp, #0x20]
	mov r0, #0x6d
	bl ov40_0222DAB0
	add r4, r0, #0
	ldr r5, [sp, #0x14]
	ldr r0, [sp, #0x20]
	mov r1, #0x6d
	add r5, #0xc
	bl sub_020315B8
	str r0, [sp, #0x2c]
	ldr r1, [sp, #0x2c]
	add r0, r7, #0
	bl ov40_02230DCC
	ldr r0, [r7, #0x48]
	mov r1, #0xd
	bl NewString_ReadMsgData
	str r0, [sp, #0x30]
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	add r6, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	mov r1, #0
	str r0, [sp, #4]
	ldr r2, [sp, #0x2c]
	add r0, r4, #0
	add r3, r1, #0
	bl BufferString
	ldr r2, [sp, #0x30]
	add r0, r4, #0
	add r1, r6, #0
	bl StringExpandPlaceholders
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r1, r6, #0
	bl ov40_022306C0
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222E430 ; =0x000F0D00
	add r2, r6, #0
	str r0, [sp, #8]
	add r0, r5, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	ldr r0, [sp, #0x2c]
	bl String_dtor
	ldr r0, [sp, #0x30]
	bl String_dtor
	add r0, r6, #0
	bl String_dtor
	add r0, r4, #0
	bl ScrStrBufs_ResetBuffers
	ldr r0, [sp, #0x20]
	bl sub_020316F0
	str r0, [sp, #0x34]
	ldr r5, [sp, #0x14]
	ldr r0, [r7, #0x48]
	mov r1, #0xf
	add r5, #0x2c
	bl NewString_ReadMsgData
	str r0, [sp, #0x38]
	ldr r0, [sp, #0x20]
	mov r1, #0x6d
	bl sub_020315B8
	str r0, [sp, #0x3c]
	ldr r1, [sp, #0x3c]
	add r0, r7, #0
	bl ov40_02230DCC
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	add r6, r0, #0
	ldr r2, [sp, #0x34]
	add r0, r4, #0
	mov r1, #0
	bl BufferMonthNameAbbr
	ldr r2, [sp, #0x38]
	add r0, r4, #0
	add r1, r6, #0
	bl StringExpandPlaceholders
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r1, r6, #0
	bl ov40_022306C0
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222E430 ; =0x000F0D00
	add r2, r6, #0
	str r0, [sp, #8]
	add r0, r5, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	ldr r0, [sp, #0x38]
	bl String_dtor
	ldr r0, [sp, #0x3c]
	bl String_dtor
	add r0, r6, #0
	bl String_dtor
	add r0, r4, #0
	bl ScrStrBufs_ResetBuffers
	ldr r5, [sp, #0x14]
	ldr r0, [r7, #0x48]
	add r5, #0x3c
	mov r1, #0x10
	bl NewString_ReadMsgData
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r1, r6, #0
	bl ov40_022306C0
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222E430 ; =0x000F0D00
	add r2, r6, #0
	str r0, [sp, #8]
	add r0, r5, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add r0, r6, #0
	bl String_dtor
	ldr r0, [sp, #0x20]
	bl sub_02031620
	add r6, r0, #0
	ldr r0, [sp, #0x20]
	bl sub_0203162C
	ldr r5, [sp, #0x14]
	str r0, [sp, #0x40]
	add r5, #0x4c
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	cmp r6, #0
	bne _0222E33C
	ldr r0, [r7, #0x48]
	mov r1, #0x15
	bl NewString_ReadMsgData
	mov r1, #0
	add r6, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222E430 ; =0x000F0D00
	add r2, r6, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add r0, r6, #0
	bl String_dtor
	b _0222E3F6
_0222E33C:
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	str r0, [sp, #0x44]
	ldr r0, [r7, #0x48]
	mov r1, #0x16
	bl NewString_ReadMsgData
	str r0, [sp, #0x48]
	add r0, r4, #0
	mov r1, #0
	add r2, r6, #0
	bl BufferCountryName
	ldr r1, [sp, #0x44]
	ldr r2, [sp, #0x48]
	add r0, r4, #0
	bl StringExpandPlaceholders
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222E430 ; =0x000F0D00
	ldr r2, [sp, #0x44]
	str r0, [sp, #8]
	add r0, r5, #0
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	ldr r0, [sp, #0x44]
	bl String_dtor
	ldr r0, [sp, #0x48]
	bl String_dtor
	ldr r0, [sp, #0x40]
	cmp r0, #0
	beq _0222E3F6
	ldr r0, [sp, #0x14]
	mov r1, #0
	str r0, [sp, #0x18]
	add r0, #0x5c
	str r0, [sp, #0x18]
	bl FillWindowPixelBuffer
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	add r5, r0, #0
	ldr r0, [r7, #0x48]
	mov r1, #0x17
	bl NewString_ReadMsgData
	str r0, [sp, #0x4c]
	ldr r3, [sp, #0x40]
	add r0, r4, #0
	mov r1, #0
	add r2, r6, #0
	bl BufferCityName
	ldr r2, [sp, #0x4c]
	add r0, r4, #0
	add r1, r5, #0
	bl StringExpandPlaceholders
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222E430 ; =0x000F0D00
	add r2, r5, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x18]
	mov r3, #4
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x18]
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	bl String_dtor
	ldr r0, [sp, #0x4c]
	bl String_dtor
_0222E3F6:
	add r0, r4, #0
	bl ScrStrBufs_ResetBuffers
	ldr r5, [sp, #0x14]
	ldr r0, [r7, #0x48]
	add r5, #0x6c
	mov r1, #0x11
	bl NewString_ReadMsgData
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r1, r6, #0
	bl ov40_022306C0
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222E430 ; =0x000F0D00
	b _0222E434
	.balign 4, 0
_0222E428: .word ov40_02244F40
_0222E42C: .word ov40_02244F10
_0222E430: .word 0x000F0D00
_0222E434:
	add r2, r6, #0
	str r0, [sp, #8]
	add r0, r5, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add r0, r6, #0
	bl String_dtor
	ldr r0, [sp, #0x14]
	add r1, sp, #0x50
	add r0, #0x7c
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x20]
	mov r2, #0x6d
	bl sub_0203164C
	add r5, r0, #0
	bne _0222E46A
	add r0, sp, #0x50
	mov r1, #0x6d
	bl MailMsg_GetExpandedString
	add r5, r0, #0
_0222E46A:
	ldr r0, [sp, #0x14]
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222E4A0 ; =0x000F0D00
	add r2, r5, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x14]
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x14]
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	bl String_dtor
	add r0, r4, #0
	bl ScrStrBufs_delete
	add sp, #0xd8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222E4A0: .word 0x000F0D00
	thumb_func_end ov40_0222E09C

	thumb_func_start ov40_0222E4A4
ov40_0222E4A4: ; 0x0222E4A4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
	add r5, #0xc
_0222E4AC:
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #8
	blt _0222E4AC
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_0222E4A4

	thumb_func_start ov40_0222E4C4
ov40_0222E4C4: ; 0x0222E4C4
	push {r3, lr}
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _0222E4D0
	bl sub_0200DCE8
_0222E4D0:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov40_0222E4C4

	thumb_func_start ov40_0222E4D4
ov40_0222E4D4: ; 0x0222E4D4
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	ldr r0, [r5, #0x1c]
	ldr r1, _0222E50C ; =0x000186A0
	bl sub_0200D958
	ldr r0, [r5, #0x1c]
	ldr r1, _0222E50C ; =0x000186A0
	bl sub_0200D968
	ldr r0, [r5, #0x1c]
	ldr r1, _0222E50C ; =0x000186A0
	bl sub_0200D978
	ldr r0, [r5, #0x1c]
	ldr r1, _0222E50C ; =0x000186A0
	bl sub_0200D988
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0222E508
	bl sub_0200D9DC
	mov r0, #0
	str r0, [r4, #4]
_0222E508:
	pop {r3, r4, r5, pc}
	nop
_0222E50C: .word 0x000186A0
	thumb_func_end ov40_0222E4D4

	thumb_func_start ov40_0222E510
ov40_0222E510: ; 0x0222E510
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	add r5, r0, #0
	add r0, r1, #0
	ldr r6, [r1, #0x18]
	ldr r4, [r0, #0x1c]
	ldr r7, [r0, #0x28]
	str r1, [sp, #0x18]
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
	ldr r0, _0222E614 ; =0x000186A0
	mov r1, #2
	str r0, [sp, #0x14]
	add r0, r7, #0
	add r2, r6, #0
	add r3, r4, #0
	bl sub_0200D644
	str r0, [sp, #0x1c]
	bl sub_0207449C
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _0222E614 ; =0x000186A0
	add r1, r4, #0
	str r0, [sp, #4]
	add r0, r6, #0
	mov r2, #0x14
	bl sub_0200D6D4
	bl sub_020744A8
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _0222E614 ; =0x000186A0
	add r1, r4, #0
	str r0, [sp, #4]
	add r0, r6, #0
	mov r2, #0x14
	bl sub_0200D704
	ldr r0, [r5]
	bl sub_020315E0
	add r7, r0, #0
	ldr r0, [r5]
	bl sub_020315F0
	str r0, [sp, #0x20]
	ldr r0, [r5]
	bl sub_02031610
	str r0, [sp, #0x24]
	cmp r7, #0
	beq _0222E610
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x20]
	add r0, r7, #0
	bl GetMonIconNaixEx
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0222E614 ; =0x000186A0
	add r1, r4, #0
	str r0, [sp, #8]
	add r0, r6, #0
	mov r2, #0x14
	bl sub_0200E188
	mov r1, #0x4c
	add r0, sp, #0x28
	strh r1, [r0]
	mov r1, #0x3c
	strh r1, [r0, #2]
	mov r2, #0
	strh r2, [r0, #4]
	strh r2, [r0, #6]
	ldr r0, _0222E614 ; =0x000186A0
	mov r1, #1
	str r0, [sp, #0x3c]
	str r0, [sp, #0x40]
	str r0, [sp, #0x44]
	str r0, [sp, #0x48]
	sub r0, r1, #2
	str r1, [sp, #0x38]
	str r0, [sp, #0x4c]
	str r0, [sp, #0x50]
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x18]
	str r2, [sp, #0x30]
	str r2, [sp, #0x34]
	str r2, [sp, #0x54]
	str r2, [sp, #0x58]
	ldr r0, [r0, #0x18]
	ldr r1, [r1, #0x1c]
	add r2, sp, #0x28
	bl sub_0200D734
	str r0, [r5, #4]
	ldr r1, [sp, #0x20]
	ldr r2, [sp, #0x24]
	add r0, r7, #0
	bl GetMonIconPaletteEx
	add r2, r0, #0
	ldr r1, [sp, #0x1c]
	ldr r0, [r5, #4]
	add r1, r1, r2
	bl sub_0200DD24
	ldr r0, [r5, #4]
	mov r1, #1
	bl sub_0200DC4C
_0222E610:
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222E614: .word 0x000186A0
	thumb_func_end ov40_0222E510

	thumb_func_start ov40_0222E618
ov40_0222E618: ; 0x0222E618
	ldr r3, _0222E620 ; =sub_0200DCE8
	ldr r0, [r0, #8]
	bx r3
	nop
_0222E620: .word sub_0200DCE8
	thumb_func_end ov40_0222E618

	thumb_func_start ov40_0222E624
ov40_0222E624: ; 0x0222E624
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x1c]
	ldr r1, _0222E654 ; =0x0002869F
	bl sub_0200D958
	ldr r0, [r4, #0x1c]
	ldr r1, _0222E654 ; =0x0002869F
	bl sub_0200D968
	ldr r0, [r4, #0x1c]
	ldr r1, _0222E654 ; =0x0002869F
	bl sub_0200D978
	ldr r0, [r4, #0x1c]
	ldr r1, _0222E654 ; =0x0002869F
	bl sub_0200D988
	ldr r0, [r5, #8]
	bl sub_0200D9DC
	pop {r3, r4, r5, pc}
	nop
_0222E654: .word 0x0002869F
	thumb_func_end ov40_0222E624

	thumb_func_start ov40_0222E658
ov40_0222E658: ; 0x0222E658
	push {r4, lr}
	add r4, r1, #0
	cmp r0, #0x10
	bgt _0222E664
	cmp r0, #0
	bge _0222E66A
_0222E664:
	bl GF_AssertFail
	mov r0, #0
_0222E66A:
	cmp r4, #4
	bne _0222E676
	mov r1, #0x4f
	lsl r1, r1, #2
	add r0, r0, r1
	pop {r4, pc}
_0222E676:
	cmp r4, #5
	blt _0222E67E
	mov r0, #0
	pop {r4, pc}
_0222E67E:
	lsl r2, r0, #4
	ldr r0, _0222E68C ; =ov40_02244FF0
	lsl r1, r4, #2
	add r0, r0, r2
	ldr r0, [r1, r0]
	pop {r4, pc}
	nop
_0222E68C: .word ov40_02244FF0
	thumb_func_end ov40_0222E658

	thumb_func_start ov40_0222E690
ov40_0222E690: ; 0x0222E690
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	add r5, r0, #0
	mov r0, #0xe
	str r0, [sp, #0x20]
	ldr r0, [r5]
	str r1, [sp, #0x18]
	mov r7, #0xd
	bl sub_020315D0
	ldr r1, [sp, #0x18]
	ldr r2, _0222E794 ; =0x0000086C
	ldr r6, [r1, #0x18]
	ldr r4, [r1, #0x1c]
	ldr r1, [r1, #0x28]
	str r1, [sp, #0x24]
	ldr r1, [sp, #0x18]
	ldr r1, [r1, r2]
	cmp r1, #0
	bne _0222E6C4
	cmp r0, #1
	bne _0222E6E8
	mov r0, #0x10
	mov r7, #0xf
	str r0, [sp, #0x20]
	b _0222E6E8
_0222E6C4:
	ldr r0, [r5]
	bl sub_02031700
	str r0, [sp, #0x1c]
	cmp r0, #0x10
	blt _0222E6D4
	mov r0, #0
	str r0, [sp, #0x1c]
_0222E6D4:
	ldr r0, [sp, #0x1c]
	mov r1, #2
	bl ov40_0222E658
	add r7, r0, #0
	ldr r0, [sp, #0x1c]
	mov r1, #3
	bl ov40_0222E658
	str r0, [sp, #0x20]
_0222E6E8:
	mov r0, #0xb3
	str r0, [sp]
	str r7, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _0222E798 ; =0x0002869F
	mov r1, #2
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x24]
	add r2, r6, #0
	add r3, r4, #0
	bl sub_0200D644
	mov r0, #0
	str r0, [sp]
	ldr r0, _0222E798 ; =0x0002869F
	add r1, r4, #0
	str r0, [sp, #4]
	add r0, r6, #0
	mov r2, #0xb3
	mov r3, #9
	bl sub_0200D6D4
	mov r0, #0
	str r0, [sp]
	ldr r0, _0222E798 ; =0x0002869F
	add r1, r4, #0
	str r0, [sp, #4]
	add r0, r6, #0
	mov r2, #0xb3
	mov r3, #0xa
	bl sub_0200D704
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0222E798 ; =0x0002869F
	ldr r3, [sp, #0x20]
	str r0, [sp, #8]
	add r0, r6, #0
	add r1, r4, #0
	mov r2, #0xb3
	bl sub_0200E188
	mov r1, #0x28
	add r0, sp, #0x28
	strh r1, [r0]
	mov r1, #0x3c
	strh r1, [r0, #2]
	mov r2, #0
	strh r2, [r0, #4]
	strh r2, [r0, #6]
	ldr r0, _0222E798 ; =0x0002869F
	mov r1, #1
	str r0, [sp, #0x3c]
	str r0, [sp, #0x40]
	str r0, [sp, #0x44]
	str r0, [sp, #0x48]
	sub r0, r1, #2
	str r1, [sp, #0x38]
	str r0, [sp, #0x4c]
	str r0, [sp, #0x50]
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x18]
	str r2, [sp, #0x30]
	str r2, [sp, #0x34]
	str r2, [sp, #0x54]
	str r2, [sp, #0x58]
	ldr r0, [r0, #0x18]
	ldr r1, [r1, #0x1c]
	add r2, sp, #0x28
	bl sub_0200D734
	str r0, [r5, #8]
	mov r1, #1
	bl sub_0200DC4C
	ldr r0, [r5, #8]
	bl sub_0200DC18
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222E794: .word 0x0000086C
_0222E798: .word 0x0002869F
	thumb_func_end ov40_0222E690

	thumb_func_start ov40_0222E79C
ov40_0222E79C: ; 0x0222E79C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov40_0222E09C
	add r0, r5, #0
	add r1, r4, #0
	bl ov40_0222E690
	add r0, r5, #0
	add r1, r4, #0
	bl ov40_0222E510
	pop {r3, r4, r5, pc}
	thumb_func_end ov40_0222E79C

	thumb_func_start ov40_0222E7B8
ov40_0222E7B8: ; 0x0222E7B8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov40_0222E4A4
	add r0, r5, #0
	mov r1, #0
	bl ov40_0222E7DC
	add r0, r5, #0
	add r1, r4, #0
	bl ov40_0222E624
	add r0, r5, #0
	add r1, r4, #0
	bl ov40_0222E4D4
	pop {r3, r4, r5, pc}
	thumb_func_end ov40_0222E7B8

	thumb_func_start ov40_0222E7DC
ov40_0222E7DC: ; 0x0222E7DC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov40_0222E4C4
	add r0, r5, #0
	add r1, r4, #0
	bl ov40_0222E618
	pop {r3, r4, r5, pc}
	thumb_func_end ov40_0222E7DC

	thumb_func_start ov40_0222E7F0
ov40_0222E7F0: ; 0x0222E7F0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldr r0, _0222E8BC ; =0x0000088C
	add r4, r1, #0
	ldr r0, [r4, r0]
	bl sub_02031620
	str r0, [sp, #0x10]
	ldr r0, _0222E8BC ; =0x0000088C
	ldr r0, [r4, r0]
	bl sub_0203162C
	add r6, r0, #0
	ldr r0, [sp, #0x10]
	add r5, #0x18
	cmp r0, #0
	bne _0222E824
	cmp r6, #0
	bne _0222E824
	ldr r0, [r4, #0x48]
	mov r1, #0x7d
	bl NewString_ReadMsgData
	str r0, [sp, #0x14]
	b _0222E890
_0222E824:
	mov r0, #0x6d
	bl ov40_0222DAB0
	add r7, r0, #0
	cmp r6, #0
	beq _0222E85C
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	str r0, [sp, #0x14]
	ldr r0, [r4, #0x48]
	mov r1, #0x17
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r2, [sp, #0x10]
	add r0, r7, #0
	mov r1, #0
	add r3, r6, #0
	bl BufferCityName
	ldr r1, [sp, #0x14]
	add r0, r7, #0
	add r2, r4, #0
	bl StringExpandPlaceholders
	b _0222E884
_0222E85C:
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	str r0, [sp, #0x14]
	ldr r0, [r4, #0x48]
	mov r1, #0x16
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r2, [sp, #0x10]
	add r0, r7, #0
	mov r1, #0
	bl BufferCountryName
	ldr r1, [sp, #0x14]
	add r0, r7, #0
	add r2, r4, #0
	bl StringExpandPlaceholders
_0222E884:
	add r0, r4, #0
	bl String_dtor
	add r0, r7, #0
	bl ScrStrBufs_delete
_0222E890:
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222E8C0 ; =0x000F0D00
	mov r1, #0
	str r0, [sp, #8]
	ldr r2, [sp, #0x14]
	add r0, r5, #0
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	ldr r0, [sp, #0x14]
	bl String_dtor
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222E8BC: .word 0x0000088C
_0222E8C0: .word 0x000F0D00
	thumb_func_end ov40_0222E7F0

	thumb_func_start ov40_0222E8C4
ov40_0222E8C4: ; 0x0222E8C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	str r0, [sp, #0x18]
	add r0, #0x18
	add r4, r2, #0
	str r0, [sp, #0x18]
	ldr r0, [r4, #4]
	str r1, [sp, #0x14]
	str r0, [r5, #4]
	mov r0, #0
	str r0, [r5]
	str r0, [r5, #0xc]
	ldr r0, [r4, #0x24]
	str r0, [r5, #0x10]
	str r4, [r5, #0x28]
	add r0, r1, #0
	ldr r0, [r0, #0x48]
	str r0, [r5, #0x34]
	ldr r0, [r5, #4]
	ldr r1, [r5, #0x10]
	bl _s32_div_f
	add r0, r0, #1
	str r0, [r5, #0x14]
	ldr r1, [r5, #4]
	ldr r0, [r5, #0x10]
	cmp r1, r0
	bge _0222E90A
	str r1, [r5, #0x10]
	sub r0, r1, #1
	str r0, [r5, #0x40]
	ldr r0, [r5, #0x10]
	sub r0, r0, #1
	str r0, [r5, #0x44]
_0222E90A:
	ldr r0, [sp, #0x18]
	bl InitWindow
	ldr r0, [r4, #0x10]
	ldr r1, [sp, #0x18]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r4, #0x14]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [r4, #0x18]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x1c]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r2, [r4, #0x20]
	ldr r3, [r4, #0xc]
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	ldr r0, [r0, #0x24]
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	ldr r0, [sp, #0x18]
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x10]
	mov r7, #0
	cmp r0, #0
	ble _0222E9A8
	add r6, r7, #0
_0222E95C:
	ldr r1, [r4]
	ldr r0, [r5, #0x34]
	ldr r1, [r1, r6]
	bl NewString_ReadMsgData
	str r0, [sp, #0x1c]
	ldr r0, [r4, #8]
	mov r1, #0
	lsl r0, r0, #4
	mul r0, r7
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222E9B4 ; =0x000F0D00
	ldr r2, [sp, #0x1c]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x18]
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x1c]
	bl String_dtor
	ldr r0, [r4]
	ldr r0, [r0, r6]
	cmp r0, #0x10
	bne _0222E99E
	ldr r1, [sp, #0x14]
	add r0, r5, #0
	bl ov40_0222E7F0
_0222E99E:
	ldr r0, [r5, #0x10]
	add r7, r7, #1
	add r6, #0x10
	cmp r7, r0
	blt _0222E95C
_0222E9A8:
	ldr r0, [sp, #0x18]
	bl ScheduleWindowCopyToVram
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222E9B4: .word 0x000F0D00
	thumb_func_end ov40_0222E8C4

	thumb_func_start ov40_0222E9B8
ov40_0222E9B8: ; 0x0222E9B8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r4, r0, #0
	str r0, [sp, #0x20]
	add r0, #0x18
	add r5, r3, #0
	str r0, [sp, #0x20]
	ldr r0, [r5, #4]
	str r1, [sp, #0x14]
	str r0, [r4, #4]
	mov r0, #0
	str r0, [r4]
	str r0, [r4, #0xc]
	ldr r0, [r5, #0x24]
	cmp r2, #0
	str r0, [r4, #0x10]
	str r5, [r4, #0x28]
	beq _0222E9E0
	str r2, [r4, #0x34]
	b _0222E9E6
_0222E9E0:
	add r0, r1, #0
	ldr r0, [r0, #0x48]
	str r0, [r4, #0x34]
_0222E9E6:
	ldr r0, [r4, #4]
	ldr r1, [r4, #0x10]
	bl _s32_div_f
	add r0, r0, #1
	str r0, [r4, #0x14]
	ldr r1, [r4, #0x10]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	str r0, [r4, #0x40]
	ldr r1, [r4, #0x10]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	str r0, [r4, #0x44]
	ldr r1, [r4, #4]
	ldr r0, [r4, #0x10]
	cmp r1, r0
	bge _0222EA1A
	str r1, [r4, #0x10]
	sub r0, r1, #1
	str r0, [r4, #0x40]
	ldr r0, [r4, #0x10]
	sub r0, r0, #1
	str r0, [r4, #0x44]
_0222EA1A:
	ldr r0, [sp, #0x20]
	bl InitWindow
	ldr r0, [r5, #0x10]
	ldr r1, [sp, #0x20]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r5, #0x14]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [r5, #0x18]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x1c]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r2, [r5, #0x20]
	ldr r3, [r5, #0xc]
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	ldr r0, [r0, #0x24]
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	ldr r0, [sp, #0x20]
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r5]
	cmp r0, #0
	beq _0222EAB0
	ldr r0, [r4, #0x10]
	mov r6, #0
	cmp r0, #0
	ble _0222EAAE
	add r7, r6, #0
_0222EA72:
	ldr r1, [r5]
	ldr r0, [r4, #0x34]
	ldr r1, [r1, r7]
	bl NewString_ReadMsgData
	str r0, [sp, #0x24]
	ldr r0, [r5, #8]
	mov r1, #0
	lsl r0, r0, #4
	mul r0, r6
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222EB94 ; =0x000F0D00
	ldr r2, [sp, #0x24]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x20]
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x24]
	bl String_dtor
	ldr r0, [r4, #0x10]
	add r6, r6, #1
	add r7, #0x10
	cmp r6, r0
	blt _0222EA72
_0222EAAE:
	b _0222EB8A
_0222EAB0:
	mov r0, #0
	str r0, [sp, #0x18]
	ldr r0, [r4, #0x10]
	cmp r0, #0
	ble _0222EB8A
	ldr r0, [sp, #0x14]
	mov r5, #4
	str r0, [sp, #0x1c]
_0222EAC0:
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	add r7, r0, #0
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x14]
	mov r1, #0x63
	ldr r0, [r0, #0x48]
	bl NewString_ReadMsgData
	str r0, [sp, #0x28]
	mov r0, #1
	ldr r1, [sp, #0x18]
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	add r1, r1, #1
	mov r2, #2
	mov r3, #1
	bl String16_FormatInteger
	ldr r2, [sp, #0x1c]
	ldr r1, _0222EB98 ; =0x00002608
	add r0, r7, #0
	ldr r1, [r2, r1]
	bl CopyU16ArrayToString
	ldr r0, [sp, #0x14]
	add r1, r7, #0
	bl ov40_02230DCC
	mov r0, #0
	ldr r1, [sp, #0x2c]
	add r2, r0, #0
	bl FontID_String_GetWidth
	mov ip, r0
	str r5, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222EB94 ; =0x000F0D00
	ldr r2, [sp, #0x2c]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x20]
	mov r3, #0x10
	mov r6, ip
	mov r1, #0
	sub r3, r3, r6
	bl AddTextPrinterParameterized2
	str r5, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222EB94 ; =0x000F0D00
	ldr r2, [sp, #0x28]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x20]
	mov r1, #0
	mov r3, #0x10
	bl AddTextPrinterParameterized2
	str r5, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222EB94 ; =0x000F0D00
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x20]
	add r2, r7, #0
	mov r3, #0x16
	bl AddTextPrinterParameterized2
	add r0, r7, #0
	bl String_dtor
	ldr r0, [sp, #0x2c]
	bl String_dtor
	ldr r0, [sp, #0x28]
	bl String_dtor
	ldr r0, [sp, #0x1c]
	ldr r1, [r4, #0x10]
	add r0, r0, #4
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x18]
	add r5, #0x18
	add r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, r1
	blt _0222EAC0
_0222EB8A:
	ldr r0, [sp, #0x20]
	bl ScheduleWindowCopyToVram
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222EB94: .word 0x000F0D00
_0222EB98: .word 0x00002608
	thumb_func_end ov40_0222E9B8

	thumb_func_start ov40_0222EB9C
ov40_0222EB9C: ; 0x0222EB9C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1fc
	sub sp, #0xe0
	add r4, r0, #0
	ldr r0, [sp, #0x2f4]
	add r5, r3, #0
	str r0, [sp, #0x2f4]
	ldr r0, [sp, #0x2f8]
	str r1, [sp, #0x14]
	str r0, [sp, #0x2f8]
	mov r0, #0
	str r0, [sp, #0x40]
	add r6, sp, #0x264
	add r1, r0, #0
	mov r3, #7
_0222EBBA:
	stmia r6!, {r0, r1}
	stmia r6!, {r0, r1}
	sub r3, r3, #1
	bne _0222EBBA
	stmia r6!, {r0, r1}
	add r0, r4, #0
	str r0, [sp, #0x50]
	add r0, #0x18
	str r0, [sp, #0x50]
	ldr r0, [r5, #4]
	str r0, [r4, #4]
	mov r0, #0
	str r0, [r4]
	str r0, [r4, #0xc]
	ldr r0, [r5, #0x24]
	cmp r2, #0
	str r0, [r4, #0x10]
	str r5, [r4, #0x28]
	beq _0222EBE4
	str r2, [r4, #0x34]
	b _0222EBEA
_0222EBE4:
	ldr r0, [sp, #0x14]
	ldr r0, [r0, #0x48]
	str r0, [r4, #0x34]
_0222EBEA:
	ldr r0, [r4, #4]
	ldr r1, [r4, #0x10]
	bl _s32_div_f
	add r0, r0, #1
	str r0, [r4, #0x14]
	ldr r1, [r4, #4]
	ldr r0, [r4, #0x10]
	cmp r1, r0
	bge _0222EC0A
	str r1, [r4, #0x10]
	sub r0, r1, #1
	str r0, [r4, #0x40]
	ldr r0, [r4, #0x10]
	sub r0, r0, #1
	str r0, [r4, #0x44]
_0222EC0A:
	ldr r1, [r4, #0x10]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	str r0, [r4, #0x40]
	ldr r1, [r4, #0x10]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	str r0, [r4, #0x44]
	ldr r0, [sp, #0x50]
	bl InitWindow
	ldr r0, [r5, #0x10]
	ldr r1, [sp, #0x50]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r5, #0x14]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [r5, #0x18]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x1c]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r2, [r5, #0x20]
	ldr r3, [r5, #0xc]
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	ldr r0, [r0, #0x24]
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	ldr r0, [sp, #0x50]
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x6d
	bl ov40_0222DAB0
	add r2, sp, #0x58
	ldr r3, _0222EEC8 ; =ov40_02244E10
	add r5, r0, #0
	ldmia r3!, {r0, r1}
	add r7, r2, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r6, #1
	str r0, [r2]
	ldr r0, [r4, #0x28]
	ldr r1, [r0]
	ldr r0, [r1, #8]
	str r0, [sp, #0x38]
	ldr r0, [r1, #0xc]
	str r0, [sp, #0x3c]
	mov r0, #0
	str r0, [sp, #0x264]
	ldr r0, [sp, #0x2f4]
	lsl r0, r0, #2
	ldr r1, [r7, r0]
	cmp r1, #1
	ble _0222ECD4
	add r0, r1, #0
	mov r2, #0x10
	add r3, sp, #0x268
	mov ip, r0
_0222ECA0:
	ldr r0, [r4, #0x28]
	ldr r0, [r0]
	add r0, r0, r2
	ldr r1, [r0, #0xc]
	ldr r7, [r0, #8]
	ldr r0, [sp, #0x3c]
	str r1, [sp, #0x54]
	eor r1, r0
	ldr r0, [sp, #0x38]
	eor r0, r7
	orr r0, r1
	bne _0222ECBE
	ldr r0, [sp, #0x40]
	str r0, [r3]
	b _0222ECC8
_0222ECBE:
	ldr r0, [sp, #0x54]
	str r7, [sp, #0x38]
	str r0, [sp, #0x3c]
	str r6, [r3]
	str r6, [sp, #0x40]
_0222ECC8:
	add r6, r6, #1
	mov r0, ip
	add r2, #0x10
	add r3, r3, #4
	cmp r6, r0
	blt _0222ECA0
_0222ECD4:
	mov r0, #0
	str r0, [sp, #0x18]
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bgt _0222ECE0
	b _0222EEB4
_0222ECE0:
	add r0, sp, #0x264
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x2f4]
	ldr r6, [sp, #0x18]
	str r0, [sp, #0x1c]
	add r0, #0x58
	str r0, [sp, #0x1c]
_0222ECEE:
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x1c]
	ldr r0, [r0, #0x48]
	bl NewString_ReadMsgData
	str r0, [sp, #0x4c]
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	str r0, [sp, #0x48]
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	add r7, r0, #0
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x2f4]
	cmp r0, #0
	beq _0222ED28
	cmp r0, #1
	beq _0222ED4E
	cmp r0, #2
	beq _0222ED6E
	b _0222EDA8
_0222ED28:
	ldr r1, [r4, #0x28]
	ldr r0, [r4, #0x34]
	ldr r1, [r1]
	add r1, r1, r6
	ldr r1, [r1, #4]
	bl NewString_ReadMsgData
	str r0, [sp, #0x44]
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r2, [sp, #0x44]
	add r0, r5, #0
	mov r1, #1
	mov r3, #0
	bl BufferString
	b _0222EDA8
_0222ED4E:
	ldr r0, [r4, #0x28]
	mov r1, #0x6d
	ldr r0, [r0]
	add r0, r0, r6
	ldr r0, [r0, #4]
	str r0, [sp, #0x30]
	mov r0, #0xff
	bl String_ctor
	str r0, [sp, #0x44]
	ldr r2, [sp, #0x30]
	add r0, r5, #0
	mov r1, #1
	bl BufferMonthNameAbbr
	b _0222EDA8
_0222ED6E:
	ldr r0, [r4, #0x28]
	mov r1, #0x6d
	ldr r0, [r0]
	add r0, r0, r6
	ldr r0, [r0, #4]
	str r0, [sp, #0x2c]
	mov r0, #0xff
	bl String_ctor
	str r0, [sp, #0x44]
	ldr r0, [sp, #0x2c]
	mov r1, #0x6d
	add r2, sp, #0x64
	bl GetSpeciesNameIntoArray
	ldr r0, [sp, #0x44]
	add r1, sp, #0x64
	bl CopyU16ArrayToString
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r2, [sp, #0x44]
	add r0, r5, #0
	mov r1, #1
	mov r3, #0
	bl BufferString
_0222EDA8:
	ldr r0, [r4, #0x28]
	ldr r0, [r0]
	add r1, r0, r6
	ldr r0, [r1, #8]
	str r0, [sp, #0x24]
	ldr r0, [r1, #0xc]
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl ov40_022307B0
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0x34]
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x28]
	bl String16_FormatUnsignedLongLong
	mov r0, #1
	str r0, [sp]
	ldr r1, [sp, #0x20]
	ldr r0, [sp, #0x48]
	ldr r1, [r1]
	mov r2, #2
	add r1, r1, #1
	mov r3, #1
	bl String16_FormatInteger
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	mov r1, #0
	str r0, [sp, #4]
	ldr r2, [sp, #0x48]
	add r0, r5, #0
	add r3, r1, #0
	bl BufferString
	ldr r2, [sp, #0x4c]
	add r0, r5, #0
	add r1, r7, #0
	bl StringExpandPlaceholders
	ldr r0, [r4, #0x28]
	add r2, r7, #0
	ldr r0, [r0, #8]
	lsl r1, r0, #4
	ldr r0, [sp, #0x18]
	mul r1, r0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222EECC ; =0x000F0D00
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x50]
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	ldr r0, [r4, #0x28]
	ldr r0, [r0, #8]
	cmp r0, #2
	bne _0222EE7A
	ldr r0, [sp, #0x2f8]
	cmp r0, #0
	beq _0222EE7A
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r2, [sp, #0x34]
	add r0, r5, #0
	mov r1, #2
	mov r3, #0
	bl BufferString
	ldr r2, [sp, #0x2f8]
	add r0, r5, #0
	add r1, r7, #0
	bl StringExpandPlaceholders
	ldr r0, [r4, #0x28]
	add r2, r7, #0
	ldr r0, [r0, #8]
	mov r3, #0x10
	lsl r1, r0, #4
	ldr r0, [sp, #0x18]
	mul r1, r0
	add r1, #0x10
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222EECC ; =0x000F0D00
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x50]
	bl AddTextPrinterParameterized2
_0222EE7A:
	ldr r0, [sp, #0x4c]
	bl String_dtor
	ldr r0, [sp, #0x48]
	bl String_dtor
	ldr r0, [sp, #0x44]
	bl String_dtor
	add r0, r7, #0
	bl String_dtor
	ldr r0, [sp, #0x34]
	bl String_dtor
	add r0, r5, #0
	bl ScrStrBufs_ResetBuffers
	ldr r0, [sp, #0x20]
	ldr r1, [r4, #0x10]
	add r0, r0, #4
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x18]
	add r6, #0x10
	add r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, r1
	bge _0222EEB4
	b _0222ECEE
_0222EEB4:
	ldr r0, [sp, #0x50]
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	bl ScrStrBufs_delete
	add sp, #0x1fc
	add sp, #0xe0
	pop {r4, r5, r6, r7, pc}
	nop
_0222EEC8: .word ov40_02244E10
_0222EECC: .word 0x000F0D00
	thumb_func_end ov40_0222EB9C

	thumb_func_start ov40_0222EED0
ov40_0222EED0: ; 0x0222EED0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r6, r0, #0
	str r0, [sp, #0x14]
	add r0, #0x18
	add r7, r2, #0
	str r0, [sp, #0x14]
	ldr r0, [r7, #4]
	add r4, r1, #0
	str r0, [r6, #4]
	mov r0, #0
	str r0, [r6]
	str r0, [r6, #0xc]
	ldr r0, [r7, #0x24]
	add r5, r3, #0
	str r0, [r6, #0x10]
	str r7, [r6, #0x28]
	ldr r0, [r4, #0x48]
	str r0, [r6, #0x34]
	ldr r0, [r6, #4]
	ldr r1, [r6, #0x10]
	bl _s32_div_f
	add r0, r0, #1
	str r0, [r6, #0x14]
	ldr r1, [r6, #0x10]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	str r0, [r6, #0x40]
	ldr r1, [r6, #0x10]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	str r0, [r6, #0x44]
	ldr r1, [r6, #4]
	ldr r0, [r6, #0x10]
	cmp r1, r0
	bge _0222EF2A
	str r1, [r6, #0x10]
	sub r0, r1, #1
	str r0, [r6, #0x40]
	ldr r0, [r6, #0x10]
	sub r0, r0, #1
	str r0, [r6, #0x44]
_0222EF2A:
	mov r0, #1
	str r0, [r6, #0x48]
	ldr r0, [sp, #0x14]
	bl InitWindow
	ldr r0, [r7, #0x10]
	ldr r1, [sp, #0x14]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r7, #0x14]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [r7, #0x18]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	ldr r0, [r7, #0x1c]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r2, [r7, #0x20]
	ldr r3, [r7, #0xc]
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	ldr r0, [r4, #0x24]
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	ldr r0, [sp, #0x14]
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r6, #0x10]
	mov r4, #0
	cmp r0, #0
	ble _0222EFCA
_0222EF7C:
	ldr r0, [r7, #8]
	mov r1, #0
	lsl r0, r0, #3
	mul r0, r4
	add r0, r0, #4
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222EFD4 ; =0x000F0D00
	add r3, r1, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x14]
	ldr r2, [r5]
	bl AddTextPrinterParameterized2
	ldr r0, [r7, #8]
	mov r1, #0
	lsl r0, r0, #3
	mul r0, r4
	add r0, r0, #4
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222EFD4 ; =0x000F0D00
	mov r3, #0x88
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x14]
	ldr r2, [r5, #4]
	bl AddTextPrinterParameterized2
	ldr r0, [r6, #0x10]
	add r4, r4, #1
	add r5, #8
	cmp r4, r0
	blt _0222EF7C
_0222EFCA:
	ldr r0, [sp, #0x14]
	bl ScheduleWindowCopyToVram
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222EFD4: .word 0x000F0D00
	thumb_func_end ov40_0222EED0

	thumb_func_start ov40_0222EFD8
ov40_0222EFD8: ; 0x0222EFD8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r1, [r5, #0x38]
	ldr r0, [r5, #0xc]
	add r4, r2, #0
	cmp r1, r0
	bne _0222EFEE
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222EFEE:
	ldr r1, [r5, #0x10]
	ldr r0, [r5, #4]
	cmp r1, r0
	bne _0222EFFC
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222EFFC:
	add r7, r5, #0
	add r7, #0x18
	add r0, r7, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r3, [r5, #0x40]
	ldr r1, [r5, #0x3c]
	mov r0, #0
	cmp r1, r3
	blt _0222F024
	ldr r2, [r5, #0x38]
	ldr r1, [r5, #4]
	sub r0, r2, r3
	add r3, r3, #1
	sub r3, r1, r3
	cmp r2, r3
	blt _0222F024
	ldr r0, [r5, #0x10]
	sub r0, r1, r0
_0222F024:
	ldr r1, [r5, #0x10]
	mov r6, #0
	cmp r1, #0
	ble _0222F086
	lsl r0, r0, #3
	add r4, r4, r0
_0222F030:
	ldr r2, [r4]
	cmp r2, #0
	beq _0222F07C
	ldr r0, [r5, #0x28]
	mov r1, #0
	ldr r0, [r0, #8]
	add r3, r1, #0
	lsl r0, r0, #3
	mul r0, r6
	add r0, r0, #4
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222F098 ; =0x000F0D00
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, r7, #0
	bl AddTextPrinterParameterized2
	ldr r0, [r5, #0x28]
	mov r1, #0
	ldr r0, [r0, #8]
	mov r3, #0x88
	lsl r0, r0, #3
	mul r0, r6
	add r0, r0, #4
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222F098 ; =0x000F0D00
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r2, [r4, #4]
	add r0, r7, #0
	bl AddTextPrinterParameterized2
_0222F07C:
	ldr r0, [r5, #0x10]
	add r6, r6, #1
	add r4, #8
	cmp r6, r0
	blt _0222F030
_0222F086:
	add r0, r7, #0
	bl CopyWindowToVram
	ldr r0, [r5, #0x38]
	str r0, [r5, #0xc]
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222F098: .word 0x000F0D00
	thumb_func_end ov40_0222EFD8

	thumb_func_start ov40_0222F09C
ov40_0222F09C: ; 0x0222F09C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1fc
	sub sp, #0xe8
	add r4, r0, #0
	ldr r0, [sp, #0x2f8]
	str r1, [sp, #0x10]
	str r0, [sp, #0x2f8]
	mov r0, #8
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	str r3, [sp, #0x14]
	cmp r1, r0
	bne _0222F0BE
	add sp, #0x1fc
	add sp, #0xe8
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0222F0BE:
	ldr r1, [r4, #0x10]
	ldr r0, [r4, #4]
	cmp r1, r0
	bne _0222F0CE
	add sp, #0x1fc
	add sp, #0xe8
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0222F0CE:
	add r0, r4, #0
	str r0, [sp, #0x58]
	add r0, #0x18
	str r0, [sp, #0x58]
	mov r0, #0x6d
	bl ov40_0222DAB0
	add r5, r0, #0
	ldr r0, [sp, #0x58]
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0
	str r0, [sp, #0x44]
	str r0, [sp, #0x40]
	mov r0, #8
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #0x10]
	add r3, sp, #0x26c
	str r0, [sp, #0x18]
	add r0, r0, r1
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x44]
	mov r2, #7
	add r1, r0, #0
_0222F100:
	stmia r3!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0222F100
	stmia r3!, {r0, r1}
	ldr r1, [r4, #4]
	ldr r0, [sp, #0x34]
	cmp r0, r1
	blt _0222F11A
	ldr r0, [r4, #0x10]
	str r1, [sp, #0x34]
	sub r0, r1, r0
	str r0, [sp, #0x18]
_0222F11A:
	ldr r3, _0222F384 ; =ov40_02244E1C
	add r2, sp, #0x60
	ldmia r3!, {r0, r1}
	add r7, r2, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r6, #1
	str r0, [r2]
	ldr r0, [r4, #0x28]
	ldr r1, [r0]
	ldr r0, [r1, #8]
	str r0, [sp, #0x38]
	ldr r0, [r1, #0xc]
	str r0, [sp, #0x3c]
	mov r0, #0
	str r0, [sp, #0x26c]
	ldr r0, [sp, #0x14]
	lsl r0, r0, #2
	ldr r1, [r7, r0]
	cmp r1, #1
	ble _0222F180
	add r0, r1, #0
	mov r2, #0x10
	add r3, sp, #0x270
	mov ip, r0
_0222F14C:
	ldr r0, [r4, #0x28]
	ldr r0, [r0]
	add r0, r0, r2
	ldr r1, [r0, #0xc]
	ldr r7, [r0, #8]
	ldr r0, [sp, #0x3c]
	str r1, [sp, #0x5c]
	eor r1, r0
	ldr r0, [sp, #0x38]
	eor r0, r7
	orr r0, r1
	bne _0222F16A
	ldr r0, [sp, #0x40]
	str r0, [r3]
	b _0222F174
_0222F16A:
	ldr r0, [sp, #0x5c]
	str r7, [sp, #0x38]
	str r0, [sp, #0x3c]
	str r6, [r3]
	str r6, [sp, #0x40]
_0222F174:
	add r6, r6, #1
	mov r0, ip
	add r2, #0x10
	add r3, r3, #4
	cmp r6, r0
	blt _0222F14C
_0222F180:
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x34]
	cmp r1, r0
	blt _0222F18A
	b _0222F36A
_0222F18A:
	add r0, r1, #0
	lsl r6, r0, #4
	add r1, sp, #0x26c
	lsl r0, r0, #2
	add r0, r1, r0
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x14]
	str r0, [sp, #0x1c]
	add r0, #0x58
	str r0, [sp, #0x1c]
_0222F19E:
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x1c]
	ldr r0, [r0, #0x48]
	bl NewString_ReadMsgData
	str r0, [sp, #0x54]
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	str r0, [sp, #0x50]
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	add r7, r0, #0
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	str r0, [sp, #0x48]
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _0222F1D8
	cmp r0, #1
	beq _0222F1FE
	cmp r0, #2
	beq _0222F21E
	b _0222F258
_0222F1D8:
	ldr r1, [r4, #0x28]
	ldr r0, [r4, #0x34]
	ldr r1, [r1]
	add r1, r1, r6
	ldr r1, [r1, #4]
	bl NewString_ReadMsgData
	str r0, [sp, #0x4c]
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r2, [sp, #0x4c]
	add r0, r5, #0
	mov r1, #1
	mov r3, #0
	bl BufferString
	b _0222F258
_0222F1FE:
	ldr r0, [r4, #0x28]
	mov r1, #0x6d
	ldr r0, [r0]
	add r0, r0, r6
	ldr r0, [r0, #4]
	str r0, [sp, #0x30]
	mov r0, #0xff
	bl String_ctor
	str r0, [sp, #0x4c]
	ldr r2, [sp, #0x30]
	add r0, r5, #0
	mov r1, #1
	bl BufferMonthNameAbbr
	b _0222F258
_0222F21E:
	ldr r0, [r4, #0x28]
	mov r1, #0x6d
	ldr r0, [r0]
	add r0, r0, r6
	ldr r0, [r0, #4]
	str r0, [sp, #0x2c]
	mov r0, #0xff
	bl String_ctor
	str r0, [sp, #0x4c]
	ldr r0, [sp, #0x2c]
	mov r1, #0x6d
	add r2, sp, #0x6c
	bl GetSpeciesNameIntoArray
	ldr r0, [sp, #0x4c]
	add r1, sp, #0x6c
	bl CopyU16ArrayToString
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r2, [sp, #0x4c]
	add r0, r5, #0
	mov r1, #1
	mov r3, #0
	bl BufferString
_0222F258:
	ldr r0, [r4, #0x28]
	ldr r0, [r0]
	add r1, r0, r6
	ldr r0, [r1, #8]
	str r0, [sp, #0x24]
	ldr r0, [r1, #0xc]
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl ov40_022307B0
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0x48]
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x28]
	bl String16_FormatUnsignedLongLong
	mov r0, #1
	str r0, [sp]
	ldr r1, [sp, #0x20]
	ldr r0, [sp, #0x50]
	ldr r1, [r1]
	mov r2, #2
	add r1, r1, #1
	mov r3, #1
	bl String16_FormatInteger
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	mov r1, #0
	str r0, [sp, #4]
	ldr r2, [sp, #0x50]
	add r0, r5, #0
	add r3, r1, #0
	bl BufferString
	ldr r2, [sp, #0x54]
	add r0, r5, #0
	add r1, r7, #0
	bl StringExpandPlaceholders
	ldr r0, [r4, #0x28]
	add r2, r7, #0
	ldr r0, [r0, #8]
	lsl r1, r0, #4
	ldr r0, [sp, #0x44]
	mul r1, r0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222F388 ; =0x000F0D00
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x58]
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	ldr r0, [r4, #0x28]
	ldr r0, [r0, #8]
	cmp r0, #2
	bne _0222F32A
	ldr r0, [sp, #0x2f8]
	cmp r0, #0
	beq _0222F32A
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r2, [sp, #0x48]
	add r0, r5, #0
	mov r1, #2
	mov r3, #0
	bl BufferString
	ldr r2, [sp, #0x2f8]
	add r0, r5, #0
	add r1, r7, #0
	bl StringExpandPlaceholders
	ldr r0, [r4, #0x28]
	add r2, r7, #0
	ldr r0, [r0, #8]
	mov r3, #0x10
	lsl r1, r0, #4
	ldr r0, [sp, #0x44]
	mul r1, r0
	add r1, #0x10
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222F388 ; =0x000F0D00
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x58]
	bl AddTextPrinterParameterized2
_0222F32A:
	ldr r0, [sp, #0x44]
	add r0, r0, #1
	str r0, [sp, #0x44]
	ldr r0, [sp, #0x54]
	bl String_dtor
	ldr r0, [sp, #0x50]
	bl String_dtor
	ldr r0, [sp, #0x4c]
	bl String_dtor
	add r0, r7, #0
	bl String_dtor
	ldr r0, [sp, #0x48]
	bl String_dtor
	add r0, r5, #0
	bl ScrStrBufs_ResetBuffers
	ldr r0, [sp, #0x20]
	add r6, #0x10
	add r0, r0, #4
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x18]
	add r1, r0, #1
	ldr r0, [sp, #0x34]
	str r1, [sp, #0x18]
	cmp r1, r0
	bge _0222F36A
	b _0222F19E
_0222F36A:
	ldr r0, [sp, #0x58]
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	bl ScrStrBufs_delete
	mov r0, #8
	ldrsh r0, [r4, r0]
	str r0, [r4, #0xc]
	mov r0, #0
	add sp, #0x1fc
	add sp, #0xe8
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222F384: .word ov40_02244E1C
_0222F388: .word 0x000F0D00
	thumb_func_end ov40_0222F09C

	thumb_func_start ov40_0222F38C
ov40_0222F38C: ; 0x0222F38C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	mov r0, #0
	str r0, [sp, #0x1c]
	ldr r0, [r5, #0x28]
	add r7, r1, #0
	ldr r0, [r0, #0x28]
	cmp r0, #0
	beq _0222F3DA
	ldr r0, [r5, #0x10]
	ldr r6, [sp, #0x1c]
	cmp r0, #0
	ble _0222F3DA
	add r4, r6, #0
_0222F3AA:
	ldr r0, [r5, #0x28]
	ldr r0, [r0, #0x28]
	add r0, r0, r4
	bl sub_02025320
	cmp r0, #0
	beq _0222F3D0
	add r0, r7, #0
	bl ov40_02230944
	mov r1, #8
	ldrsh r1, [r5, r1]
	ldr r0, [r5, #0x28]
	add r1, r1, r6
	ldr r0, [r0]
	lsl r1, r1, #4
	add r0, r0, r1
	ldr r0, [r0, #4]
	str r0, [sp, #0x1c]
_0222F3D0:
	ldr r0, [r5, #0x10]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, r0
	blt _0222F3AA
_0222F3DA:
	mov r0, #8
	ldrsh r1, [r5, r0]
	ldr r0, [r5, #0xc]
	cmp r1, r0
	bne _0222F3EA
	ldr r0, [sp, #0x1c]
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
_0222F3EA:
	ldr r1, [r5, #0x10]
	ldr r0, [r5, #4]
	cmp r1, r0
	bne _0222F3F8
	ldr r0, [sp, #0x1c]
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
_0222F3F8:
	add r0, r5, #0
	str r0, [sp, #0x18]
	add r0, #0x18
	mov r1, #0
	str r0, [sp, #0x18]
	bl FillWindowPixelBuffer
	mov r0, #8
	ldrsh r0, [r5, r0]
	ldr r2, [r5, #0x10]
	ldr r1, [r5, #4]
	str r0, [sp, #0x10]
	add r0, r0, r2
	mov r6, #0
	str r0, [sp, #0x14]
	cmp r0, r1
	blt _0222F420
	sub r0, r1, r2
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
_0222F420:
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #0x14]
	cmp r1, r0
	bge _0222F472
	add r0, r1, #0
	lsl r4, r0, #4
_0222F42C:
	ldr r1, [r5, #0x28]
	ldr r0, [r5, #0x34]
	ldr r1, [r1]
	ldr r1, [r1, r4]
	bl NewString_ReadMsgData
	add r7, r0, #0
	ldr r0, [r5, #0x28]
	mov r1, #0
	ldr r0, [r0, #8]
	add r2, r7, #0
	lsl r0, r0, #4
	mul r0, r6
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222F484 ; =0x000F0D00
	add r3, r1, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x18]
	bl AddTextPrinterParameterized2
	add r0, r7, #0
	bl String_dtor
	ldr r0, [sp, #0x10]
	add r6, r6, #1
	add r1, r0, #1
	ldr r0, [sp, #0x14]
	add r4, #0x10
	str r1, [sp, #0x10]
	cmp r1, r0
	blt _0222F42C
_0222F472:
	ldr r0, [sp, #0x18]
	bl CopyWindowToVram
	mov r0, #8
	ldrsh r0, [r5, r0]
	str r0, [r5, #0xc]
	ldr r0, [sp, #0x1c]
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222F484: .word 0x000F0D00
	thumb_func_end ov40_0222F38C

	thumb_func_start ov40_0222F488
ov40_0222F488: ; 0x0222F488
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	str r1, [sp, #0x14]
	str r0, [sp, #0x10]
	ldr r1, [r0, #0x38]
	ldr r0, [r0, #0xc]
	cmp r1, r0
	bne _0222F49E
	add sp, #0x2c
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0222F49E:
	ldr r0, [sp, #0x10]
	ldr r1, [r0, #0x10]
	ldr r0, [r0, #4]
	cmp r1, r0
	bne _0222F4AE
	add sp, #0x2c
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0222F4AE:
	ldr r0, [sp, #0x10]
	mov r1, #0
	str r0, [sp, #0x28]
	add r0, #0x18
	str r0, [sp, #0x28]
	bl FillWindowPixelBuffer
	mov r0, #0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x10]
	ldr r0, [r0, #0x40]
	ldr r1, [r1, #0x3c]
	cmp r1, r0
	blt _0222F4E8
	ldr r1, [sp, #0x10]
	ldr r2, [r1, #0x38]
	sub r1, r2, r0
	str r1, [sp, #0x1c]
	ldr r1, [sp, #0x10]
	add r0, r0, #1
	ldr r1, [r1, #4]
	sub r0, r1, r0
	cmp r2, r0
	blt _0222F4E8
	ldr r0, [sp, #0x10]
	ldr r0, [r0, #0x10]
	sub r0, r1, r0
	str r0, [sp, #0x1c]
_0222F4E8:
	mov r0, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x10]
	ldr r0, [r0, #0x10]
	cmp r0, #0
	ble _0222F5D2
	ldr r0, [sp, #0x1c]
	mov r4, #4
	lsl r1, r0, #2
	ldr r0, [sp, #0x14]
	add r0, r0, r1
	str r0, [sp, #0x18]
_0222F500:
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	add r5, r0, #0
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	add r7, r0, #0
	ldr r0, [sp, #0x14]
	mov r1, #0x63
	ldr r0, [r0, #0x48]
	bl NewString_ReadMsgData
	str r0, [sp, #0x24]
	mov r0, #1
	str r0, [sp]
	ldr r2, [sp, #0x1c]
	ldr r1, [sp, #0x20]
	add r0, r7, #0
	add r1, r2, r1
	add r1, r1, #1
	mov r2, #2
	mov r3, #1
	bl String16_FormatInteger
	ldr r2, [sp, #0x18]
	ldr r1, _0222F5E4 ; =0x00002608
	add r0, r5, #0
	ldr r1, [r2, r1]
	bl CopyU16ArrayToString
	ldr r0, [sp, #0x14]
	add r1, r5, #0
	bl ov40_02230DCC
	mov r0, #0
	add r1, r7, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	mov ip, r0
	str r4, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222F5E8 ; =0x000F0D00
	mov r3, #0x10
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r6, ip
	ldr r0, [sp, #0x28]
	mov r1, #0
	add r2, r7, #0
	sub r3, r3, r6
	bl AddTextPrinterParameterized2
	str r4, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222F5E8 ; =0x000F0D00
	ldr r2, [sp, #0x24]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x28]
	mov r1, #0
	mov r3, #0x10
	bl AddTextPrinterParameterized2
	str r4, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222F5E8 ; =0x000F0D00
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x28]
	add r2, r5, #0
	mov r3, #0x16
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl String_dtor
	add r0, r7, #0
	bl String_dtor
	ldr r0, [sp, #0x24]
	bl String_dtor
	ldr r0, [sp, #0x18]
	add r4, #0x18
	add r0, r0, #4
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x20]
	add r0, r0, #1
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x10]
	ldr r1, [r0, #0x10]
	ldr r0, [sp, #0x20]
	cmp r0, r1
	blt _0222F500
_0222F5D2:
	ldr r0, [sp, #0x28]
	bl CopyWindowToVram
	ldr r0, [sp, #0x10]
	ldr r1, [r0, #0x38]
	str r1, [r0, #0xc]
	mov r0, #0
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222F5E4: .word 0x00002608
_0222F5E8: .word 0x000F0D00
	thumb_func_end ov40_0222F488

	thumb_func_start ov40_0222F5EC
ov40_0222F5EC: ; 0x0222F5EC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r4, #0
	mov r6, #0xff
	cmp r1, #0
	bge _0222F60C
	ldr r0, [r5, #0x38]
	cmp r0, #0
	ble _0222F624
	sub r0, r0, #1
	str r0, [r5, #0x38]
	ldr r0, _0222F6CC ; =0x00000572
	add r6, r4, #0
	bl PlaySE
	b _0222F624
_0222F60C:
	ble _0222F624
	ldr r0, [r5, #4]
	ldr r1, [r5, #0x38]
	sub r0, r0, #1
	cmp r1, r0
	bge _0222F624
	add r0, r1, #1
	str r0, [r5, #0x38]
	ldr r0, _0222F6CC ; =0x00000572
	mov r6, #1
	bl PlaySE
_0222F624:
	cmp r6, #0
	beq _0222F62E
	cmp r6, #1
	beq _0222F66A
	b _0222F68E
_0222F62E:
	ldr r2, [r5, #0x44]
	ldr r1, [r5, #0x38]
	cmp r1, r2
	bge _0222F63C
	lsl r0, r1, #0x10
	asr r4, r0, #0x10
	b _0222F68E
_0222F63C:
	ldr r0, [r5, #4]
	sub r0, r0, r2
	cmp r1, r0
	blt _0222F658
	add r2, r2, #1
	lsl r2, r2, #0x10
	asr r4, r2, #0x10
	cmp r1, r0
	blt _0222F68E
	sub r0, r1, r0
	add r0, r4, r0
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	b _0222F68E
_0222F658:
	lsl r0, r2, #0x10
	asr r4, r0, #0x10
	cmp r1, r2
	bgt _0222F68E
	sub r0, r1, r2
	add r0, r4, r0
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	b _0222F68E
_0222F66A:
	ldr r0, [r5, #0x38]
	ldr r2, [r5, #0x40]
	cmp r0, r2
	bgt _0222F678
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	b _0222F68E
_0222F678:
	lsl r1, r2, #0x10
	asr r4, r1, #0x10
	ldr r1, [r5, #4]
	sub r1, r1, r2
	cmp r0, r1
	blt _0222F68E
	sub r1, r1, #1
	sub r0, r0, r1
	add r0, r4, r0
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
_0222F68E:
	cmp r4, #0
	bge _0222F696
	bl GF_AssertFail
_0222F696:
	cmp r6, #0xff
	beq _0222F69C
	str r4, [r5, #0x3c]
_0222F69C:
	ldr r2, [r5, #0x40]
	ldr r0, [r5, #0x3c]
	mov r3, #0
	cmp r0, r2
	blt _0222F6C0
	ldr r1, [r5, #0x38]
	sub r0, r1, r2
	lsl r0, r0, #0x10
	asr r3, r0, #0x10
	ldr r0, [r5, #4]
	add r2, r2, #1
	sub r2, r0, r2
	cmp r1, r2
	blt _0222F6C0
	ldr r1, [r5, #0x10]
	sub r0, r0, r1
	lsl r0, r0, #0x10
	asr r3, r0, #0x10
_0222F6C0:
	add r0, r5, #0
	strh r3, [r5, #8]
	bl ov40_0222F8C0
	pop {r4, r5, r6, pc}
	nop
_0222F6CC: .word 0x00000572
	thumb_func_end ov40_0222F5EC

	thumb_func_start ov40_0222F6D0
ov40_0222F6D0: ; 0x0222F6D0
	push {r4, lr}
	add r4, r0, #0
	mov r2, #8
	ldrsh r0, [r4, r2]
	add r1, r0, r1
	strh r1, [r4, #8]
	ldrsh r1, [r4, r2]
	cmp r1, #0
	bge _0222F6E6
	mov r1, #0
	strh r1, [r4, #8]
_0222F6E6:
	ldr r2, [r4, #0x10]
	ldr r1, [r4, #4]
	cmp r2, r1
	bne _0222F6F2
	mov r1, #0
	strh r1, [r4, #8]
_0222F6F2:
	mov r1, #8
	ldrsh r1, [r4, r1]
	ldr r3, [r4, #0x10]
	ldr r2, [r4, #4]
	add r1, r1, r3
	cmp r1, r2
	ble _0222F704
	sub r1, r2, r3
	strh r1, [r4, #8]
_0222F704:
	mov r1, #8
	ldrsh r1, [r4, r1]
	cmp r0, r1
	beq _0222F712
	ldr r0, _0222F71C ; =0x00000572
	bl PlaySE
_0222F712:
	add r0, r4, #0
	bl ov40_0222F878
	pop {r4, pc}
	nop
_0222F71C: .word 0x00000572
	thumb_func_end ov40_0222F6D0

	thumb_func_start ov40_0222F720
ov40_0222F720: ; 0x0222F720
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x18
	bl ClearWindowTilemapAndCopyToVram
	add r4, #0x18
	add r0, r4, #0
	bl RemoveWindow
	pop {r4, pc}
	thumb_func_end ov40_0222F720

	thumb_func_start ov40_0222F734
ov40_0222F734: ; 0x0222F734
	ldr r3, _0222F73C ; =memset
	mov r1, #0
	mov r2, #0x50
	bx r3
	.balign 4, 0
_0222F73C: .word memset
	thumb_func_end ov40_0222F734

	thumb_func_start ov40_0222F740
ov40_0222F740: ; 0x0222F740
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x48
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x14]
	ldr r7, [r4, #0x1c]
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x18]
	add r6, r2, #0
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp]
	ldr r0, _0222F84C ; =0x00030D40
	str r6, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	ldr r2, [sp, #0x10]
	add r1, r7, #0
	mov r3, #0x7f
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	ldr r0, _0222F84C ; =0x00030D40
	ldr r2, [sp, #0x10]
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	add r1, r7, #0
	mov r3, #0x7e
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _0222F84C ; =0x00030D40
	ldr r2, [sp, #0x10]
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	add r1, r7, #0
	mov r3, #0x7d
	bl sub_0200D71C
	mov r1, #0x80
	add r0, sp, #0x14
	strh r1, [r0]
	mov r1, #0x60
	strh r1, [r0, #2]
	mov r1, #0
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	mov r0, #1
	str r0, [sp, #0x1c]
	str r0, [sp, #0x40]
	sub r0, r0, #2
	str r0, [sp, #0x38]
	str r0, [sp, #0x3c]
	ldr r0, _0222F84C ; =0x00030D40
	str r1, [sp, #0x20]
	str r6, [sp, #0x24]
	str r1, [sp, #0x44]
	str r0, [sp, #0x28]
	str r0, [sp, #0x30]
	str r0, [sp, #0x34]
	cmp r6, #1
	bne _0222F7C6
	ldr r0, _0222F850 ; =0x0000270F
	str r0, [sp, #0x2c]
	b _0222F7CA
_0222F7C6:
	ldr r0, _0222F854 ; =0x00002710
	str r0, [sp, #0x2c]
_0222F7CA:
	ldr r0, [r4, #0x18]
	ldr r1, [r4, #0x1c]
	add r2, sp, #0x14
	bl sub_0200D734
	str r0, [r5, #0x2c]
	ldr r0, [r4, #0x18]
	ldr r1, [r4, #0x1c]
	add r2, sp, #0x14
	bl sub_0200D734
	str r0, [r5, #0x30]
	ldr r0, [r5, #0x2c]
	mov r1, #2
	bl sub_0200DD10
	ldr r0, [r5, #0x30]
	mov r1, #2
	bl sub_0200DD10
	ldr r0, [r5, #0x2c]
	mov r1, #0
	bl sub_0200DC4C
	ldr r0, [r5, #0x30]
	mov r1, #0
	bl sub_0200DC4C
	ldr r0, [r5, #0x2c]
	bl sub_0200DC18
	ldr r0, [r5, #0x30]
	bl sub_0200DC18
	ldr r0, [r5, #0x30]
	mov r1, #2
	bl sub_0200E0C0
	cmp r6, #1
	ldr r0, [r5, #0x2c]
	bne _0222F830
	mov r1, #0x80
	mov r2, #0x18
	bl sub_0200DDB8
	ldr r0, [r5, #0x30]
	mov r1, #0x80
	mov r2, #0x78
	bl sub_0200DDB8
	b _0222F842
_0222F830:
	mov r1, #0x80
	mov r2, #0x58
	bl sub_0200DDB8
	ldr r0, [r5, #0x30]
	mov r1, #0x80
	mov r2, #0xb8
	bl sub_0200DDB8
_0222F842:
	add r0, r5, #0
	bl ov40_0222F878
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222F84C: .word 0x00030D40
_0222F850: .word 0x0000270F
_0222F854: .word 0x00002710
	thumb_func_end ov40_0222F740

	thumb_func_start ov40_0222F858
ov40_0222F858: ; 0x0222F858
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r3, r1, #0
	add r5, r2, #0
	ldr r0, [r4, #0x2c]
	mov r1, #0x80
	add r2, r3, #0
	bl sub_0200DDB8
	ldr r0, [r4, #0x30]
	mov r1, #0x80
	add r2, r5, #0
	bl sub_0200DDB8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_0222F858

	thumb_func_start ov40_0222F878
ov40_0222F878: ; 0x0222F878
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x2c]
	mov r1, #1
	bl sub_0200DCE8
	ldr r0, [r4, #0x30]
	mov r1, #1
	bl sub_0200DCE8
	mov r0, #8
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bne _0222F89C
	ldr r0, [r4, #0x2c]
	mov r1, #0
	bl sub_0200DCE8
_0222F89C:
	mov r0, #8
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0x10]
	add r1, r1, r0
	ldr r0, [r4, #4]
	cmp r1, r0
	blt _0222F8B2
	ldr r0, [r4, #0x30]
	mov r1, #0
	bl sub_0200DCE8
_0222F8B2:
	ldr r0, [r4, #0x2c]
	bl sub_0200DC24
	ldr r0, [r4, #0x30]
	bl sub_0200DC24
	pop {r4, pc}
	thumb_func_end ov40_0222F878

	thumb_func_start ov40_0222F8C0
ov40_0222F8C0: ; 0x0222F8C0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x2c]
	mov r1, #1
	bl sub_0200DCE8
	ldr r0, [r4, #0x30]
	mov r1, #1
	bl sub_0200DCE8
	mov r0, #8
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bne _0222F8E4
	ldr r0, [r4, #0x2c]
	mov r1, #0
	bl sub_0200DCE8
_0222F8E4:
	mov r0, #8
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0x10]
	add r1, r1, r0
	ldr r0, [r4, #4]
	cmp r1, r0
	blt _0222F8FA
	ldr r0, [r4, #0x30]
	mov r1, #0
	bl sub_0200DCE8
_0222F8FA:
	ldr r1, [r4, #0x10]
	ldr r0, [r4, #4]
	cmp r1, r0
	blt _0222F912
	ldr r0, [r4, #0x2c]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r4, #0x30]
	mov r1, #0
	bl sub_0200DCE8
_0222F912:
	ldr r0, [r4, #0x2c]
	bl sub_0200DC24
	ldr r0, [r4, #0x30]
	bl sub_0200DC24
	pop {r4, pc}
	thumb_func_end ov40_0222F8C0

	thumb_func_start ov40_0222F920
ov40_0222F920: ; 0x0222F920
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x1c]
	ldr r1, _0222F94C ; =0x00030D40
	bl sub_0200D958
	ldr r0, [r4, #0x1c]
	ldr r1, _0222F94C ; =0x00030D40
	bl sub_0200D978
	ldr r0, [r4, #0x1c]
	ldr r1, _0222F94C ; =0x00030D40
	bl sub_0200D988
	ldr r0, [r5, #0x2c]
	bl sub_0200D9DC
	ldr r0, [r5, #0x30]
	bl sub_0200D9DC
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222F94C: .word 0x00030D40
	thumb_func_end ov40_0222F920

	thumb_func_start ov40_0222F950
ov40_0222F950: ; 0x0222F950
	push {r4, r5, lr}
	sub sp, #0x34
	add r4, r3, #0
	mov r3, #0x80
	add r0, sp, #0
	strh r3, [r0]
	mov r3, #0x60
	strh r3, [r0, #2]
	mov r3, #0
	strh r3, [r0, #4]
	strh r3, [r0, #6]
	mov r0, #1
	str r0, [sp, #8]
	str r0, [sp, #0x2c]
	sub r0, r0, #2
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	ldr r0, _0222F9B4 ; =0x00002E94
	str r3, [sp, #0xc]
	str r2, [sp, #0x10]
	str r3, [sp, #0x30]
	str r0, [sp, #0x14]
	str r0, [sp, #0x1c]
	str r0, [sp, #0x20]
	cmp r2, #1
	bne _0222F98A
	ldr r0, _0222F9B8 ; =0x0000270F
	str r0, [sp, #0x18]
	b _0222F98E
_0222F98A:
	ldr r0, _0222F9BC ; =0x00002710
	str r0, [sp, #0x18]
_0222F98E:
	ldr r0, [r1, #0x18]
	ldr r1, [r1, #0x1c]
	add r2, sp, #0
	bl sub_0200D734
	add r5, r0, #0
	mov r1, #2
	bl sub_0200DD10
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0200DC4C
	add r0, r5, #0
	bl sub_0200DC18
	add r0, r5, #0
	add sp, #0x34
	pop {r4, r5, pc}
	.balign 4, 0
_0222F9B4: .word 0x00002E94
_0222F9B8: .word 0x0000270F
_0222F9BC: .word 0x00002710
	thumb_func_end ov40_0222F950

	thumb_func_start ov40_0222F9C0
ov40_0222F9C0: ; 0x0222F9C0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	bl sub_0200D9DC
	ldr r0, [r4, #0x1c]
	bl sub_0200D9DC
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov40_0222F9C0

	thumb_func_start ov40_0222F9D4
ov40_0222F9D4: ; 0x0222F9D4
	ldr r3, _0222F9DC ; =ov40_0222F9E0
	mov r2, #5
	bx r3
	nop
_0222F9DC: .word ov40_0222F9E0
	thumb_func_end ov40_0222F9D4

	thumb_func_start ov40_0222F9E0
ov40_0222F9E0: ; 0x0222F9E0
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r5, r0, #0
	add r4, r1, #0
	mov r2, #2
	add r3, r6, #0
	bl ov40_0222F950
	str r0, [r5, #0x18]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #2
	add r3, r6, #0
	bl ov40_0222F950
	str r0, [r5, #0x1c]
	ldr r0, [r5, #0x18]
	mov r1, #0x18
	mov r2, #0x88
	bl sub_0200DDB8
	ldr r0, [r5, #0x1c]
	mov r1, #0xe8
	mov r2, #0x88
	bl sub_0200DDB8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov40_0222F9E0

	thumb_func_start ov40_0222FA18
ov40_0222FA18: ; 0x0222FA18
	ldr r3, _0222FA20 ; =memset
	mov r1, #0
	mov r2, #0x20
	bx r3
	.balign 4, 0
_0222FA20: .word memset
	thumb_func_end ov40_0222FA18

	thumb_func_start ov40_0222FA24
ov40_0222FA24: ; 0x0222FA24
	ldr r3, _0222FA28 ; =ov40_0222F9C0
	bx r3
	.balign 4, 0
_0222FA28: .word ov40_0222F9C0
	thumb_func_end ov40_0222FA24

	thumb_func_start ov40_0222FA2C
ov40_0222FA2C: ; 0x0222FA2C
	push {r3, r4}
	ldr r2, [r0, #0xc]
	sub r4, r1, r2
	add r3, r4, #0
	mov r2, #1
	mul r3, r4
	lsl r2, r2, #8
	cmp r3, r2
	blt _0222FA52
	cmp r4, #0
	bge _0222FA48
	mov r2, #0
	mvn r2, r2
	b _0222FA4A
_0222FA48:
	mov r2, #1
_0222FA4A:
	strh r2, [r0, #0x10]
	str r1, [r0, #0xc]
	pop {r3, r4}
	bx lr
_0222FA52:
	mov r1, #0
	strh r1, [r0, #0x10]
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov40_0222FA2C

	thumb_func_start ov40_0222FA5C
ov40_0222FA5C: ; 0x0222FA5C
	ldr r2, [r1, #0x48]
	cmp r2, #0
	beq _0222FA74
	ldr r1, [r1, #4]
	cmp r1, #2
	bge _0222FA6E
	mov r1, #0
	str r1, [r0, #0x14]
	bx lr
_0222FA6E:
	mov r1, #1
	str r1, [r0, #0x14]
	bx lr
_0222FA74:
	ldr r2, [r1, #0x10]
	ldr r1, [r1, #4]
	cmp r2, r1
	blt _0222FA82
	mov r1, #0
	str r1, [r0, #0x14]
	bx lr
_0222FA82:
	mov r1, #1
	str r1, [r0, #0x14]
	bx lr
	thumb_func_end ov40_0222FA5C

	thumb_func_start ov40_0222FA88
ov40_0222FA88: ; 0x0222FA88
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, sp, #4
	add r1, sp, #0
	mov r4, #0
	bl sub_02025364
	add r6, r0, #0
	ldr r0, [r5, #0x14]
	cmp r0, #0
	beq _0222FAAC
	ldr r0, [r5, #0x18]
	bl sub_0200DC24
	ldr r0, [r5, #0x1c]
	bl sub_0200DC24
_0222FAAC:
	ldr r0, [r5, #4]
	cmp r0, #0
	bne _0222FAC6
	cmp r6, #0
	bne _0222FAC6
	mov r0, #0
	str r0, [r5, #4]
	str r0, [r5]
	str r0, [r5, #8]
	str r0, [r5, #0xc]
	add sp, #8
	strh r0, [r5, #0x10]
	pop {r4, r5, r6, pc}
_0222FAC6:
	ldr r0, _0222FB20 ; =ov40_02244E08
	bl sub_020252F4
	cmp r0, #0
	bne _0222FADA
	ldr r0, _0222FB24 ; =ov40_02244E0C
	bl sub_020252F4
	cmp r0, #0
	beq _0222FADC
_0222FADA:
	mov r4, #1
_0222FADC:
	cmp r4, #0
	ldr r0, [r5, #4]
	beq _0222FB0C
	cmp r0, #0
	bne _0222FAFA
	mov r0, #1
	str r0, [r5, #4]
	ldr r0, [sp, #4]
	str r0, [r5, #8]
	ldr r0, [sp]
	add sp, #8
	str r0, [r5, #0xc]
	mov r0, #2
	str r0, [r5]
	pop {r4, r5, r6, pc}
_0222FAFA:
	ldr r0, [r5]
	sub r0, r0, #1
	str r0, [r5]
	ldr r1, [sp]
	add r0, r5, #0
	bl ov40_0222FA2C
	add sp, #8
	pop {r4, r5, r6, pc}
_0222FB0C:
	cmp r0, #0
	beq _0222FB1A
	mov r0, #0
	str r0, [r5, #4]
	str r0, [r5]
	str r0, [r5, #8]
	str r0, [r5, #0xc]
_0222FB1A:
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_0222FB20: .word ov40_02244E08
_0222FB24: .word ov40_02244E0C
	thumb_func_end ov40_0222FA88

	thumb_func_start ov40_0222FB28
ov40_0222FB28: ; 0x0222FB28
	push {r4, lr}
	add r4, r1, #0
	mov r1, #0x83
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	bl Sav2_GameStats_get
	add r1, r4, #0
	bl GameStats_AddSpecial
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov40_0222FB28

	thumb_func_start ov40_0222FB40
ov40_0222FB40: ; 0x0222FB40
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #0x83
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0x7e
	add r2, sp, #4
	bl sub_0202FBF0
	ldr r1, _0222FB70 ; =0x000008B4
	mov r3, #0
	ldr r0, [r4, r1]
	sub r1, #0x84
	ldr r1, [r4, r1]
	add r2, r0, #0
	str r1, [sp]
	add r1, r0, #0
	add r1, #0x80
	add r2, #0xe4
	bl sub_02030814
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_0222FB70: .word 0x000008B4
	thumb_func_end ov40_0222FB40

	thumb_func_start ov40_0222FB74
ov40_0222FB74: ; 0x0222FB74
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4]
	bl ov40_0222BC44
	bl sub_0203A86C
	mov r0, #1
	str r0, [r4, #4]
	add r0, r5, #0
	bl DestroySysTask
	pop {r3, r4, r5, pc}
	thumb_func_end ov40_0222FB74

	thumb_func_start ov40_0222FB90
ov40_0222FB90: ; 0x0222FB90
	ldr r2, _0222FBA8 ; =0x0000052C
	add r3, r0, #0
	str r1, [r3, r2]
	mov r1, #0
	add r0, r2, #4
	str r1, [r3, r0]
	add r1, r3, r2
	ldr r3, _0222FBAC ; =sub_0200E33C
	ldr r0, _0222FBB0 ; =ov40_0222FB74
	mov r2, #4
	bx r3
	nop
_0222FBA8: .word 0x0000052C
_0222FBAC: .word sub_0200E33C
_0222FBB0: .word ov40_0222FB74
	thumb_func_end ov40_0222FB90

	thumb_func_start ov40_0222FBB4
ov40_0222FBB4: ; 0x0222FBB4
	mov r1, #0x53
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end ov40_0222FBB4

	thumb_func_start ov40_0222FBBC
ov40_0222FBBC: ; 0x0222FBBC
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _0222FBF2
	add r0, r4, #0
	bl ov40_02230958
	cmp r0, #1
	beq _0222FBF2
	ldr r0, _0222FBF4 ; =0x00000524
	ldr r1, [r4, r0]
	cmp r1, #1
	beq _0222FBF2
	mov r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, #0x64]
	bl sub_02009418
	ldr r0, [r4, #0x1c]
	bl sub_0200D020
	bl sub_0200D034
	ldr r0, _0222FBF4 ; =0x00000524
	mov r1, #0
	str r1, [r4, r0]
_0222FBF2:
	pop {r4, pc}
	.balign 4, 0
_0222FBF4: .word 0x00000524
	thumb_func_end ov40_0222FBBC

	thumb_func_start ov40_0222FBF8
ov40_0222FBF8: ; 0x0222FBF8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0222FC0C ; =ov40_0222FBBC
	add r1, r4, #0
	mov r2, #5
	bl sub_0200E33C
	ldr r1, _0222FC10 ; =0x0000416C
	str r0, [r4, r1]
	pop {r4, pc}
	.balign 4, 0
_0222FC0C: .word ov40_0222FBBC
_0222FC10: .word 0x0000416C
	thumb_func_end ov40_0222FBF8

	thumb_func_start ov40_0222FC14
ov40_0222FC14: ; 0x0222FC14
	push {r3, r4, lr}
	sub sp, #4
	ldr r4, _0222FC3C ; =0x00000836
	add r3, r0, #0
	add r0, r3, r4
	str r0, [sp]
	sub r0, r4, #6
	ldr r0, [r3, r0]
	sub r4, r4, #2
	add r3, r3, r4
	bl ov40_02244AB0
	cmp r0, #1
	bls _0222FC36
	add sp, #4
	mov r0, #1
	pop {r3, r4, pc}
_0222FC36:
	mov r0, #0
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0222FC3C: .word 0x00000836
	thumb_func_end ov40_0222FC14

	thumb_func_start ov40_0222FC40
ov40_0222FC40: ; 0x0222FC40
	ldr r2, _0222FC48 ; =0x00000874
	str r1, [r0, r2]
	bx lr
	nop
_0222FC48: .word 0x00000874
	thumb_func_end ov40_0222FC40

	thumb_func_start ov40_0222FC4C
ov40_0222FC4C: ; 0x0222FC4C
	push {r3, r4, r5, r6, r7, lr}
	ldr r3, _0222FCB8 ; =0x000008B4
	add r2, r0, #0
	ldr r1, [r1]
	add r7, r2, r3
	str r0, [sp]
	cmp r1, #1
	beq _0222FCB6
	bl ov40_0223D540
	ldr r1, _0222FCBC ; =0x00001D54
	mov r2, #0x1e
	add r1, r7, r1
	bl ov39_0222801C
	ldr r1, _0222FCC0 ; =0x00003884
	mov r4, #0
	str r0, [r7, r1]
	ldr r0, [r7, r1]
	cmp r0, #0
	ble _0222FCB6
	ldr r5, [sp]
	mov r1, #0x9a
	lsl r1, r1, #6
	add r0, r5, #0
	add r6, r0, r1
_0222FC80:
	ldr r0, _0222FCC4 ; =0x00002608
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _0222FC8C
	bl GF_AssertFail
_0222FC8C:
	ldr r0, _0222FCC4 ; =0x00002608
	add r1, r6, #0
	ldr r0, [r5, r0]
	mov r2, #0xe4
	bl MI_CpuCopy8
	ldr r0, _0222FCC4 ; =0x00002608
	ldr r1, [sp]
	ldr r0, [r5, r0]
	add r2, r1, r4
	add r0, #0xa7
	ldrb r0, [r0]
	ldr r1, _0222FCC8 ; =0x0000413C
	add r4, r4, #1
	strb r0, [r2, r1]
	ldr r0, _0222FCC0 ; =0x00003884
	add r5, r5, #4
	ldr r0, [r7, r0]
	add r6, #0xe4
	cmp r4, r0
	blt _0222FC80
_0222FCB6:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222FCB8: .word 0x000008B4
_0222FCBC: .word 0x00001D54
_0222FCC0: .word 0x00003884
_0222FCC4: .word 0x00002608
_0222FCC8: .word 0x0000413C
	thumb_func_end ov40_0222FC4C

	thumb_func_start ov40_0222FCCC
ov40_0222FCCC: ; 0x0222FCCC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	mov r5, #0
	add r4, r6, #0
	add r7, r5, #0
_0222FCD8:
	mov r0, #0x83
	str r5, [sp]
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	mov r1, #0x6d
	add r2, sp, #4
	mov r3, #0
	bl sub_0202FC90
	ldr r0, [sp, #4]
	cmp r0, #3
	bhi _0222FDA4
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222FCFC: ; jump table
	.short _0222FD04 - _0222FCFC - 2 ; case 0
	.short _0222FD74 - _0222FCFC - 2 ; case 1
	.short _0222FD28 - _0222FCFC - 2 ; case 2
	.short _0222FD4E - _0222FCFC - 2 ; case 3
_0222FD04:
	ldr r0, _0222FDBC ; =0x0000087C
	str r7, [r4, r0]
	add r0, #0x10
	str r7, [r4, r0]
	cmp r5, #0
	bne _0222FDA4
	mov r0, #0x6d
	bl sub_020314A4
	ldr r1, _0222FDC0 ; =0x0000088C
	str r0, [r4, r1]
	add r0, r1, #0
	sub r1, #0x5c
	ldr r0, [r4, r0]
	ldr r1, [r6, r1]
	bl sub_020314C4
	b _0222FDA4
_0222FD28:
	ldr r0, _0222FDBC ; =0x0000087C
	mov r1, #0
	str r1, [r4, r0]
	add r0, #0x10
	str r1, [r4, r0]
	cmp r5, #0
	bne _0222FDA4
	mov r0, #0x6d
	bl sub_020314A4
	ldr r1, _0222FDC0 ; =0x0000088C
	str r0, [r4, r1]
	add r0, r1, #0
	sub r1, #0x5c
	ldr r0, [r4, r0]
	ldr r1, [r6, r1]
	bl sub_020314C4
	b _0222FDA4
_0222FD4E:
	ldr r0, _0222FDBC ; =0x0000087C
	mov r1, #0
	str r1, [r4, r0]
	add r0, #0x10
	str r1, [r4, r0]
	cmp r5, #0
	bne _0222FDA4
	mov r0, #0x6d
	bl sub_020314A4
	ldr r1, _0222FDC0 ; =0x0000088C
	str r0, [r4, r1]
	add r0, r1, #0
	sub r1, #0x5c
	ldr r0, [r4, r0]
	ldr r1, [r6, r1]
	bl sub_020314C4
	b _0222FDA4
_0222FD74:
	mov r0, #0x6d
	bl sub_0203077C
	ldr r1, _0222FDBC ; =0x0000087C
	cmp r5, #0
	str r0, [r4, r1]
	bne _0222FD9A
	mov r0, #0x6d
	bl sub_020314A4
	ldr r1, _0222FDC0 ; =0x0000088C
	str r0, [r4, r1]
	add r0, r1, #0
	sub r1, #0x5c
	ldr r0, [r4, r0]
	ldr r1, [r6, r1]
	bl sub_020314C4
	b _0222FDA4
_0222FD9A:
	mov r0, #0x6d
	bl sub_020307AC
	ldr r1, _0222FDC0 ; =0x0000088C
	str r0, [r4, r1]
_0222FDA4:
	bl sub_0202FC48
	cmp r0, #1
	bne _0222FDB0
	bl sub_0202FC24
_0222FDB0:
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #4
	blt _0222FCD8
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222FDBC: .word 0x0000087C
_0222FDC0: .word 0x0000088C
	thumb_func_end ov40_0222FCCC

	thumb_func_start ov40_0222FDC4
ov40_0222FDC4: ; 0x0222FDC4
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	add r5, r0, #0
	add r6, r4, #0
	add r7, r4, #0
_0222FDCE:
	ldr r0, _0222FDF8 ; =0x0000087C
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222FDDE
	bl FreeToHeap
	ldr r0, _0222FDF8 ; =0x0000087C
	str r6, [r5, r0]
_0222FDDE:
	ldr r0, _0222FDFC ; =0x0000088C
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222FDEE
	bl FreeToHeap
	ldr r0, _0222FDFC ; =0x0000088C
	str r7, [r5, r0]
_0222FDEE:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0222FDCE
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222FDF8: .word 0x0000087C
_0222FDFC: .word 0x0000088C
	thumb_func_end ov40_0222FDC4

	thumb_func_start ov40_0222FE00
ov40_0222FE00: ; 0x0222FE00
	push {r4, r5, r6, lr}
	sub sp, #0x18
	ldr r4, [r0, #0x18]
	ldr r5, [r0, #0x1c]
	ldr r6, [r0, #0x28]
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
	ldr r0, _0222FE64 ; =0x000186A0
	mov r1, #2
	str r0, [sp, #0x14]
	add r0, r6, #0
	add r2, r4, #0
	add r3, r5, #0
	bl sub_0200D644
	bl sub_0207449C
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _0222FE64 ; =0x000186A0
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0x14
	bl sub_0200D6D4
	bl sub_020744A8
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _0222FE64 ; =0x000186A0
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0x14
	bl sub_0200D704
	add sp, #0x18
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222FE64: .word 0x000186A0
	thumb_func_end ov40_0222FE00

	thumb_func_start ov40_0222FE68
ov40_0222FE68: ; 0x0222FE68
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x1c]
	ldr r1, _0222FE88 ; =0x000186A0
	bl sub_0200D968
	ldr r0, [r4, #0x1c]
	ldr r1, _0222FE88 ; =0x000186A0
	bl sub_0200D978
	ldr r0, [r4, #0x1c]
	ldr r1, _0222FE88 ; =0x000186A0
	bl sub_0200D988
	pop {r4, pc}
	nop
_0222FE88: .word 0x000186A0
	thumb_func_end ov40_0222FE68

	thumb_func_start ov40_0222FE8C
ov40_0222FE8C: ; 0x0222FE8C
	ldr r3, _0222FE94 ; =NARC_ctor
	mov r0, #0x14
	mov r1, #0x6d
	bx r3
	.balign 4, 0
_0222FE94: .word NARC_ctor
	thumb_func_end ov40_0222FE8C

	thumb_func_start ov40_0222FE98
ov40_0222FE98: ; 0x0222FE98
	ldr r3, _0222FE9C ; =NARC_dtor
	bx r3
	.balign 4, 0
_0222FE9C: .word NARC_dtor
	thumb_func_end ov40_0222FE98

	thumb_func_start ov40_0222FEA0
ov40_0222FEA0: ; 0x0222FEA0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	add r5, r2, #0
	str r1, [sp, #0xc]
	add r4, r3, #0
	ldr r7, [r0, #0x18]
	ldr r6, [r0, #0x1c]
	bne _0222FEB6
	add sp, #0x4c
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0222FEB6:
	ldr r0, [sp, #0x60]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x64]
	ldr r2, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r1, [sp, #0x14]
	add r0, r4, #0
	bl GetMonIconNaixEx
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0222FF44 ; =0x000186A0
	ldr r2, [sp, #0xc]
	add r0, r5, r0
	str r0, [sp, #8]
	add r0, r7, #0
	add r1, r6, #0
	bl sub_0200E1E8
	mov r1, #0
	add r0, sp, #0x18
	add r2, r1, #0
	strh r1, [r0]
	sub r2, #0x30
	strh r2, [r0, #2]
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	mov r0, #1
	str r0, [sp, #0x28]
	sub r0, r0, #2
	str r1, [sp, #0x20]
	str r1, [sp, #0x24]
	str r1, [sp, #0x44]
	str r1, [sp, #0x48]
	ldr r1, _0222FF44 ; =0x000186A0
	str r0, [sp, #0x3c]
	add r2, r5, r1
	str r2, [sp, #0x2c]
	str r0, [sp, #0x40]
	str r1, [sp, #0x30]
	str r1, [sp, #0x34]
	str r1, [sp, #0x38]
	add r0, r7, #0
	add r1, r6, #0
	add r2, sp, #0x18
	bl sub_0200D734
	add r5, r0, #0
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x14]
	add r0, r4, #0
	bl GetMonIconPaletteEx
	add r1, r0, #0
	add r0, r5, #0
	add r1, r1, #4
	bl sub_0200DD24
	add r0, r5, #0
	mov r1, #1
	bl sub_0200DC4C
	add r0, r5, #0
	bl sub_0200DC18
	add r0, r5, #0
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222FF44: .word 0x000186A0
	thumb_func_end ov40_0222FEA0

	thumb_func_start ov40_0222FF48
ov40_0222FF48: ; 0x0222FF48
	push {r4, lr}
	add r4, r2, #0
	beq _0222FF5E
	ldr r2, _0222FF60 ; =0x000186A0
	ldr r0, [r0, #0x1c]
	add r1, r1, r2
	bl sub_0200D958
	add r0, r4, #0
	bl sub_0200D9DC
_0222FF5E:
	pop {r4, pc}
	.balign 4, 0
_0222FF60: .word 0x000186A0
	thumb_func_end ov40_0222FF48

	thumb_func_start ov40_0222FF64
ov40_0222FF64: ; 0x0222FF64
	push {r3, lr}
	cmp r2, #0
	beq _0222FF70
	add r0, r2, #0
	bl sub_0200D9DC
_0222FF70:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov40_0222FF64

	thumb_func_start ov40_0222FF74
ov40_0222FF74: ; 0x0222FF74
	push {r4, r5, r6, r7, lr}
	sub sp, #0x9c
	ldr r3, _022302A0 ; =ov40_02244EE8
	add r7, r1, #0
	str r0, [sp, #0x14]
	add r2, sp, #0x74
	mov r1, #0x14
_0222FF82:
	ldrh r0, [r3]
	add r3, r3, #2
	strh r0, [r2]
	add r2, r2, #2
	sub r1, r1, #1
	bne _0222FF82
	ldr r3, _022302A4 ; =ov40_02244E28
	add r2, sp, #0x5c
	str r2, [sp, #0x20]
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	mov r0, #1
	ldr r5, [sp, #0x14]
	str r0, [sp, #0x3c]
	mov r0, #0
	str r0, [sp, #0x40]
	add r4, sp, #0x74
	add r5, #0x3c
_0222FFAE:
	mov r0, #0
	ldrsh r0, [r4, r0]
	cmp r0, #0xff
	beq _02230062
	ldr r1, [sp, #0x20]
	ldr r0, [r7, #0x48]
	ldr r1, [r1]
	bl NewString_ReadMsgData
	add r6, r0, #0
	add r0, r5, #0
	bl InitWindow
	mov r0, #2
	ldrsh r0, [r4, r0]
	mov r3, #0
	add r1, r5, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #4
	ldrsh r0, [r4, r0]
	mov r2, #2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	mov r0, #6
	ldrsh r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x3c]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldrsh r3, [r4, r3]
	ldr r0, [r7, #0x24]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r1, r6, #0
	bl ov40_022306C0
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _022302A8 ; =0x000F0D00
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r2, r6, #0
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	mov r0, #4
	ldrsh r1, [r4, r0]
	mov r0, #6
	ldrsh r0, [r4, r0]
	add r2, r1, #0
	mul r2, r0
	ldr r0, [sp, #0x3c]
	add r0, r0, r2
	str r0, [sp, #0x3c]
	add r0, r6, #0
	bl String_dtor
	ldr r0, [sp, #0x20]
	add r4, #8
	add r0, r0, #4
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x40]
	add r5, #0x10
	add r0, r0, #1
	str r0, [sp, #0x40]
	cmp r0, #5
	blt _0222FFAE
_02230062:
	ldr r0, [sp, #0x14]
	ldr r6, [r0]
	mov r0, #0x6d
	bl ov40_0222DAB0
	ldr r5, [sp, #0x14]
	add r4, r0, #0
	add r0, r6, #0
	mov r1, #0x6d
	add r5, #0x3c
	bl sub_020315B8
	str r0, [sp, #0x44]
	ldr r1, [sp, #0x44]
	add r0, r7, #0
	bl ov40_02230DCC
	ldr r0, [r7, #0x48]
	mov r1, #7
	bl NewString_ReadMsgData
	str r0, [sp, #0x48]
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	add r6, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	mov r1, #0
	str r0, [sp, #4]
	ldr r2, [sp, #0x44]
	add r0, r4, #0
	add r3, r1, #0
	bl BufferString
	ldr r2, [sp, #0x48]
	add r0, r4, #0
	add r1, r6, #0
	bl StringExpandPlaceholders
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r1, r6, #0
	bl ov40_022306C0
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _022302A8 ; =0x000F0D00
	add r2, r6, #0
	str r0, [sp, #8]
	add r0, r5, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	ldr r0, [sp, #0x44]
	bl String_dtor
	ldr r0, [sp, #0x48]
	bl String_dtor
	add r0, r6, #0
	bl String_dtor
	add r0, r4, #0
	bl ScrStrBufs_ResetBuffers
	ldr r0, [sp, #0x14]
	mov r1, #3
	ldr r0, [r0, #4]
	mov r2, #0
	bl sub_0203088C
	add r1, r0, #0
	ldr r5, [sp, #0x14]
	ldr r0, [r7, #0x48]
	add r1, #0x84
	add r5, #0x4c
	bl NewString_ReadMsgData
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _022302A8 ; =0x000F0D00
	add r2, r6, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add r0, r6, #0
	bl String_dtor
	add r0, r4, #0
	bl ScrStrBufs_ResetBuffers
	ldr r0, [sp, #0x14]
	mov r1, #2
	ldr r0, [r0, #4]
	mov r2, #0
	bl sub_0203088C
	str r0, [sp, #0x4c]
	cmp r0, #0
	beq _022301F4
	ldr r5, [sp, #0x14]
	mov r0, #0xff
	mov r1, #0x6d
	add r5, #0x5c
	bl String_ctor
	str r0, [sp, #0x50]
	ldr r0, [r7, #0x48]
	mov r1, #9
	bl NewString_ReadMsgData
	str r0, [sp, #0x54]
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	add r6, r0, #0
	mov r0, #1
	str r0, [sp]
	ldr r0, [sp, #0x50]
	ldr r1, [sp, #0x4c]
	mov r2, #4
	mov r3, #0
	bl String16_FormatInteger
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	mov r1, #0
	str r0, [sp, #4]
	ldr r2, [sp, #0x50]
	add r0, r4, #0
	add r3, r1, #0
	bl BufferString
	ldr r2, [sp, #0x54]
	add r0, r4, #0
	add r1, r6, #0
	bl StringExpandPlaceholders
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r1, r6, #0
	bl ov40_022306C0
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _022302A8 ; =0x000F0D00
	add r2, r6, #0
	str r0, [sp, #8]
	add r0, r5, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	ldr r0, [sp, #0x50]
	bl String_dtor
	ldr r0, [sp, #0x54]
	bl String_dtor
	add r0, r6, #0
	bl String_dtor
	add r0, r4, #0
	bl ScrStrBufs_ResetBuffers
	b _02230206
_022301F4:
	ldr r5, [sp, #0x14]
	mov r1, #0
	add r5, #0x6c
	add r0, r5, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
_02230206:
	ldr r0, [sp, #0x14]
	mov r1, #4
	ldr r0, [r0, #4]
	mov r2, #0
	bl sub_0203088C
	add r5, r0, #0
	str r1, [sp, #0x1c]
	add r6, r1, #0
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	str r0, [sp, #0x38]
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	str r0, [sp, #0x34]
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x1c]
	add r0, #0x7c
	str r0, [sp, #0x14]
	ldr r2, _022302AC ; =0x000186A0
	add r0, r5, #0
	mov r3, #0
	bl _ull_mod
	str r0, [sp, #0x2c]
	ldr r2, _022302AC ; =0x000186A0
	add r0, r5, #0
	add r1, r6, #0
	mov r3, #0
	bl _ll_udiv
	ldr r2, _022302AC ; =0x000186A0
	str r0, [sp, #0x58]
	mov r3, #0
	add r6, r1, #0
	bl _ull_mod
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x58]
	ldr r2, _022302AC ; =0x000186A0
	add r1, r6, #0
	mov r3, #0
	bl _ll_udiv
	mov r1, #0xa
	str r0, [sp, #0x24]
	bl _u32_div_f
	mov r1, #0xa
	bl _u32_div_f
	cmp r1, #0
	bne _022302B0
	ldr r0, [sp, #0x1c]
	mov r1, #0
	eor r1, r0
	mov r2, #0
	add r0, r5, #0
	eor r0, r2
	orr r0, r1
	beq _022302B0
	ldr r0, [r7, #0x48]
	mov r1, #0xc
	bl NewString_ReadMsgData
	add r6, r0, #0
	b _022302BA
	nop
_022302A0: .word ov40_02244EE8
_022302A4: .word ov40_02244E28
_022302A8: .word 0x000F0D00
_022302AC: .word 0x000186A0
_022302B0:
	ldr r0, [r7, #0x48]
	mov r1, #0xb
	bl NewString_ReadMsgData
	add r6, r0, #0
_022302BA:
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	add r5, r0, #0
	mov r0, #1
	str r0, [sp]
	ldr r0, [sp, #0x38]
	ldr r1, [sp, #0x2c]
	mov r2, #5
	mov r3, #2
	bl String16_FormatInteger
	mov r0, #1
	str r0, [sp]
	ldr r0, [sp, #0x34]
	ldr r1, [sp, #0x28]
	mov r2, #5
	mov r3, #2
	bl String16_FormatInteger
	mov r0, #1
	str r0, [sp]
	mov r2, #2
	ldr r0, [sp, #0x30]
	ldr r1, [sp, #0x24]
	add r3, r2, #0
	bl String16_FormatInteger
	mov r0, #1
	str r0, [sp]
	mov r1, #2
	ldr r2, [sp, #0x38]
	add r0, r4, #0
	mov r3, #0
	str r1, [sp, #4]
	bl BufferString
	mov r1, #1
	str r1, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r2, [sp, #0x34]
	add r0, r4, #0
	mov r3, #0
	bl BufferString
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	mov r1, #0
	str r0, [sp, #4]
	ldr r2, [sp, #0x30]
	add r0, r4, #0
	add r3, r1, #0
	bl BufferString
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl StringExpandPlaceholders
	ldr r0, [sp, #0x14]
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x14]
	add r1, r5, #0
	bl ov40_022306C0
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02230394 ; =0x000F0D00
	add r2, r5, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x14]
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x14]
	bl ScheduleWindowCopyToVram
	ldr r0, [sp, #0x38]
	bl String_dtor
	ldr r0, [sp, #0x34]
	bl String_dtor
	ldr r0, [sp, #0x30]
	bl String_dtor
	add r0, r6, #0
	bl String_dtor
	add r0, r5, #0
	bl String_dtor
	add r0, r4, #0
	bl ScrStrBufs_ResetBuffers
	add r0, r4, #0
	bl ScrStrBufs_delete
	add sp, #0x9c
	pop {r4, r5, r6, r7, pc}
	nop
_02230394: .word 0x000F0D00
	thumb_func_end ov40_0222FF74

	thumb_func_start ov40_02230398
ov40_02230398: ; 0x02230398
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
	add r5, #0x3c
_022303A0:
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #5
	blt _022303A0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_02230398

	thumb_func_start ov40_022303B8
ov40_022303B8: ; 0x022303B8
	push {r3, lr}
	mov r1, #3
	mov r2, #0
	bl sub_0203088C
	cmp r0, #0x1a
	bgt _022303F0
	bge _022303FC
	add r1, r0, #0
	sub r1, #0xe
	cmp r1, #9
	bhi _02230400
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022303DC: ; jump table
	.short _022303FC - _022303DC - 2 ; case 0
	.short _02230400 - _022303DC - 2 ; case 1
	.short _02230400 - _022303DC - 2 ; case 2
	.short _022303FC - _022303DC - 2 ; case 3
	.short _02230400 - _022303DC - 2 ; case 4
	.short _02230400 - _022303DC - 2 ; case 5
	.short _022303FC - _022303DC - 2 ; case 6
	.short _02230400 - _022303DC - 2 ; case 7
	.short _02230400 - _022303DC - 2 ; case 8
	.short _022303FC - _022303DC - 2 ; case 9
_022303F0:
	cmp r0, #0x1d
	bgt _022303F8
	beq _022303FC
	b _02230400
_022303F8:
	cmp r0, #0x20
	bne _02230400
_022303FC:
	mov r0, #1
	pop {r3, pc}
_02230400:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov40_022303B8

	thumb_func_start ov40_02230404
ov40_02230404: ; 0x02230404
	ldr r3, _0223040C ; =ov40_022303B8
	ldr r0, [r0, #4]
	bx r3
	nop
_0223040C: .word ov40_022303B8
	thumb_func_end ov40_02230404

	thumb_func_start ov40_02230410
ov40_02230410: ; 0x02230410
	push {r3, lr}
	bl ov40_02230404
	cmp r0, #1
	bne _0223041E
	mov r0, #0x51
	pop {r3, pc}
_0223041E:
	mov r0, #0x52
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov40_02230410

	thumb_func_start ov40_02230424
ov40_02230424: ; 0x02230424
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x140
	str r0, [sp, #0x18]
	mov r0, #0
	str r1, [sp, #0x1c]
	ldr r3, _02230630 ; =ov40_02244F90
	str r0, [sp, #0x44]
	add r2, sp, #0xe0
	mov r1, #0x30
_02230436:
	ldrh r0, [r3]
	add r3, r3, #2
	strh r0, [r2]
	add r2, r2, #2
	sub r1, r1, #1
	bne _02230436
	ldr r0, [sp, #0x1c]
	ldr r0, [r0, #0x18]
	str r0, [sp, #0x3c]
	ldr r0, [sp, #0x1c]
	ldr r0, [r0, #0x1c]
	str r0, [sp, #0x38]
	ldr r0, [sp, #0x1c]
	ldr r4, [r0, #0x28]
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
	ldr r0, _02230634 ; =0x000186A0
	ldr r2, [sp, #0x3c]
	str r0, [sp, #0x14]
	ldr r3, [sp, #0x38]
	add r0, r4, #0
	mov r1, #2
	bl sub_0200D644
	bl sub_0207449C
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _02230634 ; =0x000186A0
	ldr r1, [sp, #0x38]
	str r0, [sp, #4]
	ldr r0, [sp, #0x3c]
	mov r2, #0x14
	bl sub_0200D6D4
	bl sub_020744A8
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _02230634 ; =0x000186A0
	ldr r1, [sp, #0x38]
	str r0, [sp, #4]
	ldr r0, [sp, #0x3c]
	mov r2, #0x14
	bl sub_0200D704
	mov r0, #6
	mov r6, #0
	str r0, [sp, #0x34]
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x18]
	str r6, [sp, #0x30]
	str r6, [sp, #0x40]
	bl ov40_02230404
	cmp r0, #1
	bne _022304C8
	mov r0, #3
	str r0, [sp, #0x34]
	str r0, [sp, #0x2c]
	mov r0, #1
	str r0, [sp, #0x40]
_022304C8:
	ldr r4, [sp, #0x30]
	ldr r0, [sp, #0x2c]
	add r1, r4, #0
	cmp r1, r0
	bge _0223050E
	lsl r1, r6, #2
	add r0, sp, #0x7c
	add r5, r0, r1
	add r0, sp, #0x4c
	add r7, r0, r1
_022304DC:
	mov r0, #0xff
	str r0, [r5]
	ldr r0, [sp, #0x18]
	mov r1, #0
	ldr r0, [r0, #4]
	add r2, r4, #0
	bl sub_0203088C
	str r0, [sp, #0x48]
	ldr r0, [sp, #0x18]
	mov r1, #1
	ldr r0, [r0, #4]
	add r2, r4, #0
	bl sub_0203088C
	ldr r1, [sp, #0x48]
	cmp r1, #0
	beq _02230506
	stmia r5!, {r1}
	stmia r7!, {r0}
	add r6, r6, #1
_02230506:
	ldr r0, [sp, #0x2c]
	add r4, r4, #1
	cmp r4, r0
	blt _022304DC
_0223050E:
	ldr r1, [sp, #0x2c]
	add r0, r6, #0
	cmp r6, r1
	bge _02230530
	lsl r2, r6, #2
	add r1, sp, #0x7c
	add r3, r1, r2
	add r1, sp, #0x4c
	add r4, r1, r2
	mov r2, #0
_02230522:
	stmia r3!, {r2}
	ldr r1, [sp, #0x2c]
	add r0, r0, #1
	stmia r4!, {r2}
	add r6, r6, #1
	cmp r0, r1
	blt _02230522
_02230530:
	ldr r1, [sp, #0x30]
	ldr r0, [sp, #0x34]
	add r0, r1, r0
	str r0, [sp, #0x30]
	ldr r1, [sp, #0x2c]
	ldr r0, [sp, #0x34]
	add r0, r1, r0
	str r0, [sp, #0x2c]
	cmp r0, #0xc
	ble _022304C8
	add r0, sp, #0x7c
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x40]
	mov r1, #0x30
	add r2, sp, #0xe0
	mul r1, r0
	ldr r5, [sp, #0x18]
	mov r6, #0
	add r7, sp, #0x4c
	add r4, r2, r1
_02230558:
	ldr r0, [sp, #0x18]
	mov r1, #0
	str r1, [r0, #0xc]
	ldr r0, [sp, #0x28]
	ldr r0, [r0]
	str r0, [sp, #0x20]
	cmp r0, #0
	beq _02230616
	ldr r0, [r7]
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x20]
	ldr r2, [sp, #0x24]
	bl GetMonIconNaixEx
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r1, [sp, #0x44]
	ldr r0, _02230634 ; =0x000186A0
	mov r2, #0x14
	add r0, r1, r0
	str r0, [sp, #8]
	ldr r0, [sp, #0x3c]
	ldr r1, [sp, #0x38]
	bl sub_0200E188
	mov r0, #0
	ldrsh r1, [r4, r0]
	add r0, sp, #0xac
	add r2, sp, #0xac
	add r1, #8
	strh r1, [r0]
	mov r0, #2
	ldrsh r1, [r4, r0]
	add r0, sp, #0xac
	sub r1, #0xc
	strh r1, [r0, #2]
	mov r1, #0
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	add r0, r1, #0
	str r0, [sp, #0xb4]
	str r0, [sp, #0xb8]
	mov r0, #1
	str r0, [sp, #0xbc]
	add r0, r1, #0
	str r0, [sp, #0xd8]
	str r0, [sp, #0xdc]
	ldr r1, [sp, #0x44]
	ldr r0, _02230634 ; =0x000186A0
	add r0, r1, r0
	str r0, [sp, #0xc0]
	ldr r0, _02230634 ; =0x000186A0
	ldr r1, [sp, #0x1c]
	str r0, [sp, #0xc4]
	str r0, [sp, #0xc8]
	str r0, [sp, #0xcc]
	mov r0, #0
	mvn r0, r0
	str r0, [sp, #0xd0]
	str r0, [sp, #0xd4]
	ldr r0, [sp, #0x1c]
	ldr r1, [r1, #0x1c]
	ldr r0, [r0, #0x18]
	bl sub_0200D734
	str r0, [r5, #0xc]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x24]
	mov r2, #0
	bl GetMonIconPaletteEx
	add r1, r0, #0
	ldr r0, [r5, #0xc]
	add r1, r1, #4
	bl sub_0200DD24
	ldr r0, [r5, #0xc]
	mov r1, #1
	bl sub_0200DC4C
	ldr r0, [r5, #0xc]
	bl sub_0200DC18
	mov r1, #0xc
	ldr r0, [r5, #0xc]
	sub r1, r1, r6
	bl sub_0200DD68
	ldr r0, [sp, #0x44]
	add r5, r5, #4
	add r0, r0, #1
	str r0, [sp, #0x44]
_02230616:
	ldr r0, [sp, #0x18]
	add r6, r6, #1
	add r0, r0, #4
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x28]
	add r7, r7, #4
	add r0, r0, #4
	add r4, r4, #4
	str r0, [sp, #0x28]
	cmp r6, #0xc
	blt _02230558
	add sp, #0x140
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02230630: .word ov40_02244F90
_02230634: .word 0x000186A0
	thumb_func_end ov40_02230424

	thumb_func_start ov40_02230638
ov40_02230638: ; 0x02230638
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov40_0222FF74
	add r0, r5, #0
	add r1, r4, #0
	bl ov40_02230424
	pop {r3, r4, r5, pc}
	thumb_func_end ov40_02230638

	thumb_func_start ov40_0223064C
ov40_0223064C: ; 0x0223064C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	str r0, [sp]
	ldr r0, [r6, #0x1c]
	ldr r1, _0223069C ; =0x000186A0
	bl sub_0200D968
	ldr r0, [r6, #0x1c]
	ldr r1, _0223069C ; =0x000186A0
	bl sub_0200D978
	ldr r0, [r6, #0x1c]
	ldr r1, _0223069C ; =0x000186A0
	bl sub_0200D988
	mov r4, #0
	ldr r5, [sp]
	add r7, r4, #0
_02230670:
	ldr r0, [r5, #0xc]
	cmp r0, #0
	beq _02230688
	ldr r1, _0223069C ; =0x000186A0
	ldr r0, [r6, #0x1c]
	add r1, r4, r1
	bl sub_0200D958
	ldr r0, [r5, #0xc]
	bl sub_0200D9DC
	str r7, [r5, #0xc]
_02230688:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0xc
	blt _02230670
	ldr r0, [sp]
	add r1, r6, #0
	bl ov40_02230398
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223069C: .word 0x000186A0
	thumb_func_end ov40_0223064C

	thumb_func_start ov40_022306A0
ov40_022306A0: ; 0x022306A0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r4, #0
_022306A8:
	ldr r0, [r5, #0xc]
	cmp r0, #0
	beq _022306B4
	add r1, r6, #0
	bl sub_0200DCE8
_022306B4:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0xc
	blt _022306A8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov40_022306A0

	thumb_func_start ov40_022306C0
ov40_022306C0: ; 0x022306C0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r4, r0, #0
	add r0, r5, #0
	bl GetWindowWidth
	lsl r0, r0, #3
	sub r1, r0, r4
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov40_022306C0

	thumb_func_start ov40_022306E0
ov40_022306E0: ; 0x022306E0
	ldr r1, _022306EC ; =0x00000834
	mov r2, #0
	strh r2, [r0, r1]
	add r1, r1, #2
	strh r2, [r0, r1]
	bx lr
	.balign 4, 0
_022306EC: .word 0x00000834
	thumb_func_end ov40_022306E0

	thumb_func_start ov40_022306F0
ov40_022306F0: ; 0x022306F0
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x83
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl Sav2_Misc_get
	add r1, sp, #4
	str r1, [sp]
	ldr r1, _02230734 ; =0x0000086C
	add r2, sp, #0xc
	ldr r1, [r5, r1]
	add r3, sp, #8
	add r1, r1, #2
	add r4, r0, #0
	bl sub_0202AC38
	add r0, sp, #4
	ldrb r0, [r0]
	mov r2, #0
	mvn r2, r2
	str r0, [sp]
	ldr r1, _02230734 ; =0x0000086C
	add r0, r4, #0
	ldr r1, [r5, r1]
	add r3, r2, #0
	add r1, r1, #2
	bl sub_0202AC60
	mov r0, #1
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_02230734: .word 0x0000086C
	thumb_func_end ov40_022306F0

	thumb_func_start ov40_02230738
ov40_02230738: ; 0x02230738
	push {r3, lr}
	mov r0, #0
	mov r1, #1
	bl SetBgPriority
	mov r0, #1
	mov r1, #3
	bl SetBgPriority
	mov r0, #2
	mov r1, #0
	bl SetBgPriority
	mov r0, #3
	mov r1, #1
	bl SetBgPriority
	mov r0, #4
	mov r1, #1
	bl SetBgPriority
	mov r0, #5
	mov r1, #3
	bl SetBgPriority
	mov r0, #6
	mov r1, #0
	bl SetBgPriority
	mov r0, #7
	mov r1, #1
	bl SetBgPriority
	pop {r3, pc}
	thumb_func_end ov40_02230738

	thumb_func_start ov40_0223077C
ov40_0223077C: ; 0x0223077C
	push {r4, r5, r6, lr}
	ldr r0, [r0, #0x44]
	add r5, r1, #0
	add r4, r2, #0
	add r6, r3, #0
	cmp r0, #0
	bne _02230792
	add r0, r5, #0
	mov r1, #1
	bl sub_020879E0
_02230792:
	add r0, r5, #0
	mov r1, #1
	bl sub_020878B0
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_02087948
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_020878B8
	pop {r4, r5, r6, pc}
	thumb_func_end ov40_0223077C

	thumb_func_start ov40_022307B0
ov40_022307B0: ; 0x022307B0
	push {r4, r5, r6, lr}
	mov r3, #0
	mov r2, #1
	mov r5, #1
	sub r2, r2, r0
	sbc r3, r1
	bhs _022307D6
	mov r4, #0xa
	mov r6, #0
_022307C2:
	add r2, r4, #0
	add r3, r6, #0
	bl _ll_udiv
	mov r2, #0
	mov r3, #1
	add r5, r5, #1
	sub r3, r3, r0
	sbc r2, r1
	blo _022307C2
_022307D6:
	add r0, r5, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov40_022307B0

	thumb_func_start ov40_022307DC
ov40_022307DC: ; 0x022307DC
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	add r3, r2, #0
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov40_022307DC

	thumb_func_start ov40_022307FC
ov40_022307FC: ; 0x022307FC
	push {r4, lr}
	ldr r2, _0223085C ; =0x00004160
	add r4, r1, #0
	ldr r1, [r4, r2]
	add r1, r1, #1
	str r1, [r4, r2]
	ldr r1, [r4, r2]
	cmp r1, #7
	blt _02230846
	bl DestroySysTask
	ldr r0, _0223085C ; =0x00004160
	mov r2, #0
	str r2, [r4, r0]
	sub r1, r0, #4
	str r2, [r4, r1]
	add r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02087A54
	ldr r0, _02230860 ; =0x00004164
	mov r1, #0
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl sub_02087A08
	ldr r0, _02230860 ; =0x00004164
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_020878B0
	ldr r0, _02230860 ; =0x00004164
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_020879E0
	pop {r4, pc}
_02230846:
	lsl r0, r1, #1
	add r0, r0, #6
	lsl r0, r0, #0x10
	asr r1, r0, #0x10
	add r0, r2, #4
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl sub_02087A08
	pop {r4, pc}
	nop
_0223085C: .word 0x00004160
_02230860: .word 0x00004164
	thumb_func_end ov40_022307FC

	thumb_func_start ov40_02230864
ov40_02230864: ; 0x02230864
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, _0223092C ; =0x0000415C
	ldr r1, [r4, r0]
	cmp r1, #1
	bne _02230884
	add r0, #0xc
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0223087E
	bl DestroySysTask
_0223087E:
	ldr r0, _02230930 ; =0x00004168
	mov r1, #0
	str r1, [r4, r0]
_02230884:
	ldr r0, _02230934 ; =gSystem + 0x60
	ldrb r0, [r0, #9]
	cmp r0, #0
	bne _02230890
	ldr r0, _02230938 ; =0x000006F4
	b _02230894
_02230890:
	mov r0, #0x6f
	lsl r0, r0, #4
_02230894:
	ldr r1, [r4, r0]
	ldr r0, _0223093C ; =0x00004164
	str r1, [r4, r0]
	ldr r0, _0223092C ; =0x0000415C
	mov r1, #1
	str r1, [r4, r0]
	mov r1, #0
	add r0, r0, #4
	str r1, [r4, r0]
	add r0, sp, #4
	add r1, sp, #0
	bl sub_02025380
	ldr r0, _0223093C ; =0x00004164
	ldr r0, [r4, r0]
	bl sub_02087A30
	ldr r0, _0223093C ; =0x00004164
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_020878B0
	ldr r0, _0223093C ; =0x00004164
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_020879E0
	ldr r0, _0223093C ; =0x00004164
	ldr r1, [sp, #4]
	ldr r2, [sp]
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	ldr r0, [r4, r0]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl sub_020878B8
	ldr r0, _0223093C ; =0x00004164
	ldr r1, [sp, #4]
	ldr r2, [sp]
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	ldr r0, [r4, r0]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl sub_02087948
	mov r2, #1
	ldr r0, _02230940 ; =ov40_022307FC
	add r1, r4, #0
	lsl r2, r2, #0xc
	bl CreateSysTask
	ldr r2, _02230930 ; =0x00004168
	str r0, [r4, r2]
	ldr r0, [r4, r2]
	cmp r0, #0
	beq _02230912
	add r1, r4, #0
	bl ov40_022307FC
	add sp, #8
	pop {r4, pc}
_02230912:
	add r0, r2, #0
	mov r1, #0
	sub r0, #0xc
	str r1, [r4, r0]
	sub r0, r2, #4
	ldr r0, [r4, r0]
	bl sub_020879E0
	bl GF_AssertFail
	add sp, #8
	pop {r4, pc}
	nop
_0223092C: .word 0x0000415C
_02230930: .word 0x00004168
_02230934: .word gSystem + 0x60
_02230938: .word 0x000006F4
_0223093C: .word 0x00004164
_02230940: .word ov40_022307FC
	thumb_func_end ov40_02230864

	thumb_func_start ov40_02230944
ov40_02230944: ; 0x02230944
	push {r3, lr}
	bl ov40_02230864
	ldr r0, _02230954 ; =0x0000057B
	bl PlaySE
	pop {r3, pc}
	nop
_02230954: .word 0x0000057B
	thumb_func_end ov40_02230944

	thumb_func_start ov40_02230958
ov40_02230958: ; 0x02230958
	ldr r1, _02230960 ; =0x00000528
	ldr r0, [r0, r1]
	bx lr
	nop
_02230960: .word 0x00000528
	thumb_func_end ov40_02230958

	thumb_func_start ov40_02230964
ov40_02230964: ; 0x02230964
	ldr r2, _0223096C ; =0x00000528
	str r1, [r0, r2]
	bx lr
	nop
_0223096C: .word 0x00000528
	thumb_func_end ov40_02230964

	thumb_func_start ov40_02230970
ov40_02230970: ; 0x02230970
	push {r3, r4, r5, r6, r7, lr}
	add r6, r2, #0
	add r4, r1, #0
	add r5, r0, #0
	add r1, r6, #0
	add r7, r3, #0
	bl ov40_0222D800
	add r1, r5, #0
	str r0, [r4, #4]
	add r0, r4, #0
	add r1, #0x14
	add r2, r6, #0
	bl ov40_0222D5AC
	add r5, #0x14
	add r0, r4, #0
	add r1, r5, #0
	add r2, r7, #0
	bl ov40_0222D66C
	add r3, sp, #8
	mov r1, #0x10
	mov r2, #0x14
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	ldr r0, [r4, #4]
	bl sub_0200DDB8
	add r3, sp, #8
	mov r1, #0x18
	mov r2, #0x1c
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	ldr r0, [r4, #8]
	bl sub_020136B4
	ldr r0, [r4, #8]
	ldr r1, [sp, #0x2c]
	bl sub_020137C0
	ldr r0, [r4, #4]
	ldr r1, [sp, #0x28]
	bl sub_0200DC4C
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov40_02230970

	thumb_func_start ov40_022309CC
ov40_022309CC: ; 0x022309CC
	push {r4, lr}
	add r4, r0, #0
	bl ov40_0222D6D0
	ldr r0, [r4, #4]
	bl sub_0200D9DC
	pop {r4, pc}
	thumb_func_end ov40_022309CC

	thumb_func_start ov40_022309DC
ov40_022309DC: ; 0x022309DC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r1, r2, #0
	add r0, r3, #0
	ldr r2, [r5, #4]
	ldr r3, _02230C9C ; =0x00000504
	str r2, [r5, r3]
	ldr r4, [r5, #8]
	add r2, r3, #4
	str r4, [r5, r2]
	ldr r2, [r5, #0x10]
	ldr r4, [r2]
	add r2, r3, #0
	add r2, #8
	str r4, [r5, r2]
	mov r2, #1
	add r3, #0x18
	mov r4, #0xc2
	str r2, [r5, r3]
	cmp r0, #0
	beq _02230A12
	cmp r0, #1
	beq _02230A82
	cmp r0, #2
	beq _02230AD4
	b _02230CD2
_02230A12:
	cmp r1, #0xe
	bhi _02230A7C
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02230A22: ; jump table
	.short _02230A40 - _02230A22 - 2 ; case 0
	.short _02230A44 - _02230A22 - 2 ; case 1
	.short _02230A48 - _02230A22 - 2 ; case 2
	.short _02230A4C - _02230A22 - 2 ; case 3
	.short _02230A50 - _02230A22 - 2 ; case 4
	.short _02230A54 - _02230A22 - 2 ; case 5
	.short _02230A58 - _02230A22 - 2 ; case 6
	.short _02230A5C - _02230A22 - 2 ; case 7
	.short _02230A60 - _02230A22 - 2 ; case 8
	.short _02230A64 - _02230A22 - 2 ; case 9
	.short _02230A68 - _02230A22 - 2 ; case 10
	.short _02230A6C - _02230A22 - 2 ; case 11
	.short _02230A70 - _02230A22 - 2 ; case 12
	.short _02230A74 - _02230A22 - 2 ; case 13
	.short _02230A78 - _02230A22 - 2 ; case 14
_02230A40:
	mov r4, #0xf4
	b _02230CD2
_02230A44:
	mov r4, #0xf5
	b _02230CD2
_02230A48:
	mov r4, #0xf6
	b _02230CD2
_02230A4C:
	mov r4, #0xf7
	b _02230CD2
_02230A50:
	mov r4, #0xf8
	b _02230CD2
_02230A54:
	mov r4, #0xf9
	b _02230CD2
_02230A58:
	mov r4, #0xfa
	b _02230CD2
_02230A5C:
	mov r4, #0xfb
	b _02230CD2
_02230A60:
	mov r4, #0xfc
	b _02230CD2
_02230A64:
	mov r4, #0xfd
	b _02230CD2
_02230A68:
	mov r4, #0xfe
	b _02230CD2
_02230A6C:
	mov r4, #0xff
	b _02230CD2
_02230A70:
	add r4, #0x3e
	b _02230CD2
_02230A74:
	add r4, #0x3f
	b _02230CD2
_02230A78:
	add r4, #0x40
	b _02230CD2
_02230A7C:
	bl GF_AssertFail
	b _02230CD2
_02230A82:
	cmp r1, #9
	bhi _02230ACE
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02230A92: ; jump table
	.short _02230AA6 - _02230A92 - 2 ; case 0
	.short _02230AAA - _02230A92 - 2 ; case 1
	.short _02230AAE - _02230A92 - 2 ; case 2
	.short _02230AB2 - _02230A92 - 2 ; case 3
	.short _02230AB6 - _02230A92 - 2 ; case 4
	.short _02230ABA - _02230A92 - 2 ; case 5
	.short _02230ABE - _02230A92 - 2 ; case 6
	.short _02230AC2 - _02230A92 - 2 ; case 7
	.short _02230AC6 - _02230A92 - 2 ; case 8
	.short _02230ACA - _02230A92 - 2 ; case 9
_02230AA6:
	add r4, #0x41
	b _02230CD2
_02230AAA:
	add r4, #0x42
	b _02230CD2
_02230AAE:
	add r4, #0x43
	b _02230CD2
_02230AB2:
	add r4, #0x44
	b _02230CD2
_02230AB6:
	add r4, #0x45
	b _02230CD2
_02230ABA:
	add r4, #0x46
	b _02230CD2
_02230ABE:
	add r4, #0x47
	b _02230CD2
_02230AC2:
	add r4, #0x48
	b _02230CD2
_02230AC6:
	add r4, #0x49
	b _02230CD2
_02230ACA:
	add r4, #0x4a
	b _02230CD2
_02230ACE:
	bl GF_AssertFail
	b _02230CD2
_02230AD4:
	cmp r6, #8
	bls _02230ADA
	b _02230CCE
_02230ADA:
	add r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02230AE6: ; jump table
	.short _02230AF8 - _02230AE6 - 2 ; case 0
	.short _02230B30 - _02230AE6 - 2 ; case 1
	.short _02230B5E - _02230AE6 - 2 ; case 2
	.short _02230B9E - _02230AE6 - 2 ; case 3
	.short _02230BCC - _02230AE6 - 2 ; case 4
	.short _02230BEC - _02230AE6 - 2 ; case 5
	.short _02230C26 - _02230AE6 - 2 ; case 6
	.short _02230C6C - _02230AE6 - 2 ; case 7
	.short _02230CA0 - _02230AE6 - 2 ; case 8
_02230AF8:
	cmp r1, #5
	bhi _02230B2A
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02230B08: ; jump table
	.short _02230B14 - _02230B08 - 2 ; case 0
	.short _02230B16 - _02230B08 - 2 ; case 1
	.short _02230B1A - _02230B08 - 2 ; case 2
	.short _02230B1E - _02230B08 - 2 ; case 3
	.short _02230B22 - _02230B08 - 2 ; case 4
	.short _02230B26 - _02230B08 - 2 ; case 5
_02230B14:
	b _02230CD2
_02230B16:
	mov r4, #0xc3
	b _02230CD2
_02230B1A:
	mov r4, #0xc4
	b _02230CD2
_02230B1E:
	mov r4, #0xc5
	b _02230CD2
_02230B22:
	mov r4, #0xc6
	b _02230CD2
_02230B26:
	mov r4, #0xc7
	b _02230CD2
_02230B2A:
	bl GF_AssertFail
	b _02230CD2
_02230B30:
	cmp r1, #3
	bhi _02230B58
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02230B40: ; jump table
	.short _02230B48 - _02230B40 - 2 ; case 0
	.short _02230B4C - _02230B40 - 2 ; case 1
	.short _02230B50 - _02230B40 - 2 ; case 2
	.short _02230B54 - _02230B40 - 2 ; case 3
_02230B48:
	mov r4, #0xc8
	b _02230CD2
_02230B4C:
	mov r4, #0xc9
	b _02230CD2
_02230B50:
	mov r4, #0xca
	b _02230CD2
_02230B54:
	mov r4, #0xcb
	b _02230CD2
_02230B58:
	bl GF_AssertFail
	b _02230CD2
_02230B5E:
	cmp r1, #6
	bhi _02230B98
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02230B6E: ; jump table
	.short _02230B7C - _02230B6E - 2 ; case 0
	.short _02230B80 - _02230B6E - 2 ; case 1
	.short _02230B84 - _02230B6E - 2 ; case 2
	.short _02230B88 - _02230B6E - 2 ; case 3
	.short _02230B8C - _02230B6E - 2 ; case 4
	.short _02230B90 - _02230B6E - 2 ; case 5
	.short _02230B94 - _02230B6E - 2 ; case 6
_02230B7C:
	mov r4, #0xcc
	b _02230CD2
_02230B80:
	mov r4, #0xcd
	b _02230CD2
_02230B84:
	mov r4, #0xce
	b _02230CD2
_02230B88:
	mov r4, #0xcf
	b _02230CD2
_02230B8C:
	mov r4, #0xd0
	b _02230CD2
_02230B90:
	mov r4, #0xd1
	b _02230CD2
_02230B94:
	mov r4, #0xd2
	b _02230CD2
_02230B98:
	bl GF_AssertFail
	b _02230CD2
_02230B9E:
	cmp r1, #3
	bhi _02230BC6
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02230BAE: ; jump table
	.short _02230BB6 - _02230BAE - 2 ; case 0
	.short _02230BBA - _02230BAE - 2 ; case 1
	.short _02230BBE - _02230BAE - 2 ; case 2
	.short _02230BC2 - _02230BAE - 2 ; case 3
_02230BB6:
	mov r4, #0xd3
	b _02230CD2
_02230BBA:
	mov r4, #0xd4
	b _02230CD2
_02230BBE:
	mov r4, #0xd5
	b _02230CD2
_02230BC2:
	mov r4, #0xd6
	b _02230CD2
_02230BC6:
	bl GF_AssertFail
	b _02230CD2
_02230BCC:
	cmp r1, #0
	beq _02230BDA
	cmp r1, #1
	beq _02230BDE
	cmp r1, #2
	beq _02230BE2
	b _02230BE6
_02230BDA:
	mov r4, #0xd7
	b _02230CD2
_02230BDE:
	mov r4, #0xd8
	b _02230CD2
_02230BE2:
	mov r4, #0xd9
	b _02230CD2
_02230BE6:
	bl GF_AssertFail
	b _02230CD2
_02230BEC:
	cmp r1, #5
	bhi _02230C20
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02230BFC: ; jump table
	.short _02230C08 - _02230BFC - 2 ; case 0
	.short _02230C0C - _02230BFC - 2 ; case 1
	.short _02230C10 - _02230BFC - 2 ; case 2
	.short _02230C14 - _02230BFC - 2 ; case 3
	.short _02230C18 - _02230BFC - 2 ; case 4
	.short _02230C1C - _02230BFC - 2 ; case 5
_02230C08:
	mov r4, #0xda
	b _02230CD2
_02230C0C:
	mov r4, #0xdb
	b _02230CD2
_02230C10:
	mov r4, #0xdc
	b _02230CD2
_02230C14:
	mov r4, #0xdd
	b _02230CD2
_02230C18:
	mov r4, #0xde
	b _02230CD2
_02230C1C:
	mov r4, #0xdf
	b _02230CD2
_02230C20:
	bl GF_AssertFail
	b _02230CD2
_02230C26:
	cmp r1, #7
	bhi _02230C66
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02230C36: ; jump table
	.short _02230C46 - _02230C36 - 2 ; case 0
	.short _02230C4A - _02230C36 - 2 ; case 1
	.short _02230C4E - _02230C36 - 2 ; case 2
	.short _02230C52 - _02230C36 - 2 ; case 3
	.short _02230C56 - _02230C36 - 2 ; case 4
	.short _02230C5A - _02230C36 - 2 ; case 5
	.short _02230C5E - _02230C36 - 2 ; case 6
	.short _02230C62 - _02230C36 - 2 ; case 7
_02230C46:
	mov r4, #0xe0
	b _02230CD2
_02230C4A:
	mov r4, #0xe1
	b _02230CD2
_02230C4E:
	mov r4, #0xe2
	b _02230CD2
_02230C52:
	mov r4, #0xe3
	b _02230CD2
_02230C56:
	mov r4, #0xe4
	b _02230CD2
_02230C5A:
	mov r4, #0xe5
	b _02230CD2
_02230C5E:
	mov r4, #0xe6
	b _02230CD2
_02230C62:
	mov r4, #0xe7
	b _02230CD2
_02230C66:
	bl GF_AssertFail
	b _02230CD2
_02230C6C:
	cmp r1, #3
	bhi _02230C94
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02230C7C: ; jump table
	.short _02230C84 - _02230C7C - 2 ; case 0
	.short _02230C88 - _02230C7C - 2 ; case 1
	.short _02230C8C - _02230C7C - 2 ; case 2
	.short _02230C90 - _02230C7C - 2 ; case 3
_02230C84:
	mov r4, #0xe8
	b _02230CD2
_02230C88:
	mov r4, #0xe9
	b _02230CD2
_02230C8C:
	mov r4, #0xea
	b _02230CD2
_02230C90:
	mov r4, #0xeb
	b _02230CD2
_02230C94:
	bl GF_AssertFail
	b _02230CD2
	nop
_02230C9C: .word 0x00000504
_02230CA0:
	cmp r1, #3
	bhi _02230CC8
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02230CB0: ; jump table
	.short _02230CB8 - _02230CB0 - 2 ; case 0
	.short _02230CBC - _02230CB0 - 2 ; case 1
	.short _02230CC0 - _02230CB0 - 2 ; case 2
	.short _02230CC4 - _02230CB0 - 2 ; case 3
_02230CB8:
	mov r4, #0xec
	b _02230CD2
_02230CBC:
	mov r4, #0xed
	b _02230CD2
_02230CC0:
	mov r4, #0xee
	b _02230CD2
_02230CC4:
	mov r4, #0xef
	b _02230CD2
_02230CC8:
	bl GF_AssertFail
	b _02230CD2
_02230CCE:
	bl GF_AssertFail
_02230CD2:
	mov r0, #0x51
	lsl r0, r0, #4
	str r4, [r5, r0]
	ldr r0, [r5, r0]
	pop {r4, r5, r6, pc}
	thumb_func_end ov40_022309DC

	thumb_func_start ov40_02230CDC
ov40_02230CDC: ; 0x02230CDC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldr r5, [r4, #4]
	ldr r7, _02230D1C ; =0x00000504
	str r5, [r4, r7]
	ldr r6, [r4, #8]
	add r5, r7, #4
	str r6, [r4, r5]
	ldr r5, [r4, #0x10]
	ldr r6, [r5]
	add r5, r7, #0
	add r5, #8
	str r6, [r4, r5]
	add r5, r7, #0
	mov r6, #0
	add r5, #0x10
	str r6, [r4, r5]
	add r7, #0x14
	str r6, [r4, r7]
	bl ov40_022309DC
	mov r1, #0x51
	lsl r1, r1, #4
	str r0, [r4, r1]
	mov r0, #1
	add r1, #0xc
	str r0, [r4, r1]
	ldr r0, [r4, #0x10]
	mov r1, #0x12
	str r1, [r0]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02230D1C: .word 0x00000504
	thumb_func_end ov40_02230CDC

	thumb_func_start ov40_02230D20
ov40_02230D20: ; 0x02230D20
	push {r4, lr}
	ldr r2, _02230D90 ; =0x00000514
	add r4, r0, #0
	ldr r1, [r4, r2]
	cmp r1, #0
	beq _02230D32
	cmp r1, #1
	beq _02230D58
	b _02230D70
_02230D32:
	add r1, r2, #4
	ldr r1, [r4, r1]
	cmp r1, #8
	bge _02230D46
	add r0, r2, #4
	ldr r0, [r4, r0]
	add r1, r0, #1
	add r0, r2, #4
	str r1, [r4, r0]
	pop {r4, pc}
_02230D46:
	sub r1, r2, #4
	ldr r1, [r4, r1]
	bl ov40_0222DED0
	ldr r0, _02230D90 ; =0x00000514
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	pop {r4, pc}
_02230D58:
	bl System_GetTouchNew
	cmp r0, #0
	beq _02230D8C
	add r0, r4, #0
	bl ov40_0222DFB0
	ldr r0, _02230D90 ; =0x00000514
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	pop {r4, pc}
_02230D70:
	add r0, r2, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	ble _02230D84
	add r0, r2, #4
	ldr r0, [r4, r0]
	sub r1, r0, #1
	add r0, r2, #4
	str r1, [r4, r0]
	pop {r4, pc}
_02230D84:
	sub r2, #8
	ldr r1, [r4, r2]
	ldr r0, [r4, #0x10]
	str r1, [r0]
_02230D8C:
	pop {r4, pc}
	nop
_02230D90: .word 0x00000514
	thumb_func_end ov40_02230D20

	thumb_func_start ov40_02230D94
ov40_02230D94: ; 0x02230D94
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r7, r2, #0
	mov r4, #1
	add r5, r0, #4
_02230D9E:
	ldr r0, _02230DC8 ; =0x0000087C
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02230DBA
	mov r1, #4
	mov r2, #0
	bl sub_0203088C
	eor r1, r7
	eor r0, r6
	orr r0, r1
	bne _02230DBA
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02230DBA:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _02230D9E
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02230DC8: .word 0x0000087C
	thumb_func_end ov40_02230D94

	thumb_func_start ov40_02230DCC
ov40_02230DCC: ; 0x02230DCC
	push {r4, r5, r6, lr}
	add r5, r1, #0
	bl ov40_0223D540
	mov r1, #0x51
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	mov r0, #0x40
	bl String_ctor
	add r6, r0, #0
	mov r0, #0
	add r1, r5, #0
	add r2, r6, #0
	bl FontID_String_AllCharsValid
	cmp r0, #0
	bne _02230DFE
	mov r1, #0x51
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, r5, #0
	bl ov40_02230E08
_02230DFE:
	add r0, r6, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov40_02230DCC

	thumb_func_start ov40_02230E08
ov40_02230E08: ; 0x02230E08
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	bl StringSetEmpty
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xd
	add r3, r5, #0
	bl NewMsgDataFromNarc
	mov r1, #0x53
	add r5, r0, #0
	lsl r1, r1, #2
	add r2, r4, #0
	bl ReadMsgDataIntoString
	add r0, r5, #0
	bl DestroyMsgData
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_02230E08

	thumb_func_start ov40_02230E34
ov40_02230E34: ; 0x02230E34
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	ldr r4, _02230EAC ; =0x000008A4
	add r5, r0, #0
	add r0, r5, r4
	bl InitWindow
	mov r0, #0x10
	str r0, [sp]
	str r0, [sp, #4]
	mov r2, #2
	str r2, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	mov r0, #0x4b
	lsl r0, r0, #2
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x24]
	add r1, r5, r4
	mov r3, #8
	bl AddWindowParameterized
	add r0, r5, r4
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x48]
	mov r1, #0xc0
	bl NewString_ReadMsgData
	add r6, r0, #0
	add r0, r5, r4
	add r1, r6, #0
	bl ov40_022306C0
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02230EB0 ; =0x00010E00
	add r2, r6, #0
	str r0, [sp, #8]
	add r0, r5, r4
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl String_dtor
	add r0, r5, r4
	bl ScheduleWindowCopyToVram
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	nop
_02230EAC: .word 0x000008A4
_02230EB0: .word 0x00010E00
	thumb_func_end ov40_02230E34

	thumb_func_start ov40_02230EB4
ov40_02230EB4: ; 0x02230EB4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02230ED4 ; =0x000008A4
	add r0, r4, r0
	bl ClearWindowTilemapAndCopyToVram
	ldr r0, _02230ED4 ; =0x000008A4
	add r0, r4, r0
	bl RemoveWindow
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	pop {r4, pc}
	nop
_02230ED4: .word 0x000008A4
	thumb_func_end ov40_02230EB4

	thumb_func_start ov40_02230ED8
ov40_02230ED8: ; 0x02230ED8
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #6
	bls _02230EE6
	b _022310DA
_02230EE6:
	add r2, r1, r1
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_02230EF2: ; jump table
	.short _02230F00 - _02230EF2 - 2 ; case 0
	.short _02230FA2 - _02230EF2 - 2 ; case 1
	.short _02230FE6 - _02230EF2 - 2 ; case 2
	.short _02231032 - _02230EF2 - 2 ; case 3
	.short _02231056 - _02230EF2 - 2 ; case 4
	.short _0223107E - _02230EF2 - 2 ; case 5
	.short _022310A6 - _02230EF2 - 2 ; case 6
_02230F00:
	bl ov40_0222C4DC
	cmp r0, #1
	bne _02230F12
	add r0, r4, #0
	mov r1, #1
	bl ov40_0222BF80
	b _022310E2
_02230F12:
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x6d
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	add r0, r4, #0
	bl ov40_0222DAF0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r4, #0x28]
	ldr r2, _022310E8 ; =0x0000FFFE
	mov r1, #2
	mov r3, #0x10
	bl sub_02003EA4
	add r0, r4, #0
	bl ov40_0222DAF0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r4, #0x28]
	ldr r2, _022310EC ; =0x0000BFFF
	mov r1, #0
	mov r3, #0x10
	bl sub_02003EA4
	add r0, r4, #0
	bl ov40_0222DAF0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r4, #0x28]
	ldr r2, _022310F0 ; =0x00003FFE
	mov r1, #3
	mov r3, #0x10
	bl sub_02003EA4
	add r0, r4, #0
	bl ov40_0222DAF0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r4, #0x28]
	ldr r2, _022310F4 ; =0x0000FFFF
	mov r1, #1
	mov r3, #0x10
	bl sub_02003EA4
	ldr r0, _022310F8 ; =0x000006F4
	ldr r0, [r4, r0]
	bl sub_02087A30
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02087A30
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022310E2
_02230FA2:
	bl IsPaletteFadeFinished
	cmp r0, #0
	bne _02230FAC
	b _022310E2
_02230FAC:
	ldr r0, _022310F8 ; =0x000006F4
	mov r1, #0x80
	ldr r0, [r4, r0]
	mov r2, #0x10
	bl sub_02087948
	ldr r0, _022310F8 ; =0x000006F4
	mov r1, #0x80
	ldr r0, [r4, r0]
	mov r2, #0xd8
	bl sub_020878B8
	ldr r0, _022310F8 ; =0x000006F4
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_020879E0
	ldr r0, _022310F8 ; =0x000006F4
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_020878B0
	ldr r0, _022310FC ; =0x00000576
	bl PlaySE
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022310E2
_02230FE6:
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	cmp r0, #0x19
	blt _022310E2
	mov r0, #0
	str r0, [r4, #0xc]
	mov r0, #0x6f
	lsl r0, r0, #4
	mov r1, #0x80
	add r2, r1, #0
	ldr r0, [r4, r0]
	sub r2, #0x90
	bl sub_02087948
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0x80
	mov r2, #0x60
	bl sub_020878B8
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_020878B0
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022310E2
_02231032:
	ldr r1, [r4, #0xc]
	add r1, r1, #1
	str r1, [r4, #0xc]
	cmp r1, #0x12
	blt _022310E2
	bl ov40_02230E34
	ldr r0, _022310F8 ; =0x000006F4
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_020879E0
	mov r0, #0
	str r0, [r4, #0xc]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022310E2
_02231056:
	ldr r0, [r4, #0xc]
	cmp r0, #0x10
	bge _02231078
	add r0, r0, #4
	str r0, [r4, #0xc]
	ldr r0, _022310F4 ; =0x0000FFFF
	mov r2, #0xf
	str r0, [sp]
	ldr r3, [r4, #0xc]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r1, #0
	lsl r2, r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _022310E2
_02231078:
	add r0, r1, #1
	str r0, [r4, #8]
	b _022310E2
_0223107E:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	ble _022310A0
	sub r0, r0, #4
	str r0, [r4, #0xc]
	ldr r0, _022310F4 ; =0x0000FFFF
	mov r2, #0xf
	str r0, [sp]
	ldr r3, [r4, #0xc]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r1, #0
	lsl r2, r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _022310E2
_022310A0:
	add r0, r1, #1
	str r0, [r4, #8]
	b _022310E2
_022310A6:
	bl System_GetTouchHeld
	cmp r0, #1
	bne _022310E2
	add r0, r4, #0
	bl ov40_02230EB4
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_020879E0
	ldr r0, _022310F8 ; =0x000006F4
	ldr r0, [r4, r0]
	bl sub_02087A54
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02087A54
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022310E2
_022310DA:
	add r0, r4, #0
	mov r1, #1
	bl ov40_0222BF80
_022310E2:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_022310E8: .word 0x0000FFFE
_022310EC: .word 0x0000BFFF
_022310F0: .word 0x00003FFE
_022310F4: .word 0x0000FFFF
_022310F8: .word 0x000006F4
_022310FC: .word 0x00000576
	thumb_func_end ov40_02230ED8

	thumb_func_start ov40_02231100
ov40_02231100: ; 0x02231100
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _02231118
	cmp r1, #1
	beq _022311E8
	cmp r1, #2
	bne _02231116
	b _022312AE
_02231116:
	b _022312EE
_02231118:
	mov r1, #1
	bl ov40_02230964
	add r0, r4, #0
	bl ov40_0222C750
	add r0, r4, #0
	bl ov40_0222C884
	add r0, r4, #0
	bl ov40_0222CAD8
	add r0, r4, #0
	bl ov40_0222CCAC
	add r0, r4, #0
	bl ov40_0222D2A0
	add r0, r4, #0
	bl ov40_0222CE7C
	add r0, r4, #0
	bl ov40_0222CF10
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	add r0, r4, #0
	bl ov40_0222C4DC
	cmp r0, #1
	bne _022311D6
	ldr r0, [r4]
	cmp r0, #0
	bne _0223117A
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #0x45
	mov r3, #5
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	b _02231192
_0223117A:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #0x37
	mov r3, #5
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
_02231192:
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0x80
	mov r2, #0xe0
	bl sub_02087948
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0x80
	mov r2, #0xe0
	bl sub_020878B8
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_020878B0
	ldr r1, _02231304 ; =0x0000083C
	ldr r3, [r4, #0x10]
	ldr r1, [r4, r1]
	add r0, r4, #0
	mov r2, #1
	bl ov40_0222BF64
	b _022312FC
_022311D6:
	ldr r0, _02231308 ; =0x00000573
	bl PlaySE
	mov r0, #0x10
	str r0, [r4, #0xc]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022312FC
_022311E8:
	bl ov40_0222C4DC
	cmp r0, #1
	bne _02231202
	bl IsPaletteFadeFinished
	cmp r0, #1
	beq _022311FA
	b _022312FC
_022311FA:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022312FC
_02231202:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _0223127E
	sub r0, r0, #2
	str r0, [r4, #0xc]
	add r0, r4, #0
	bl ov40_0222DAF0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #0xc]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	ldr r2, _0223130C ; =0x0000FFFE
	mov r1, #2
	lsr r3, r3, #0x18
	bl sub_02003EA4
	add r0, r4, #0
	bl ov40_0222DAF0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #0xc]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	ldr r2, _02231310 ; =0x0000FFFF
	mov r1, #0
	lsr r3, r3, #0x18
	bl sub_02003EA4
	add r0, r4, #0
	bl ov40_0222DAF0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #0xc]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	ldr r2, _02231314 ; =0x00003FFE
	mov r1, #3
	lsr r3, r3, #0x18
	bl sub_02003EA4
	add r0, r4, #0
	bl ov40_0222DAF0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #0xc]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	ldr r2, _02231310 ; =0x0000FFFF
	mov r1, #1
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _022312FC
_0223127E:
	ldr r0, [r4, #0x58]
	mov r1, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r4, #0x28]
	mov r2, #2
	mov r3, #0x10
	bl sub_02003EA4
	ldr r0, [r4, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r4, #0x28]
	mov r2, #0xc
	mov r3, #0x10
	bl sub_02003EA4
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022312FC
_022312AE:
	ldr r0, [r4]
	cmp r0, #0
	bne _022312CE
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #0x45
	mov r3, #5
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	b _022312E6
_022312CE:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #0x37
	mov r3, #5
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
_022312E6:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022312FC
_022312EE:
	ldr r1, _02231318 ; =0x00000724
	ldr r1, [r4, r1]
	cmp r1, #3
	blt _022312FC
	mov r1, #2
	bl ov40_0222BF80
_022312FC:
	mov r0, #0
	add sp, #0x10
	pop {r4, pc}
	nop
_02231304: .word 0x0000083C
_02231308: .word 0x00000573
_0223130C: .word 0x0000FFFE
_02231310: .word 0x0000FFFF
_02231314: .word 0x00003FFE
_02231318: .word 0x00000724
	thumb_func_end ov40_02231100

	thumb_func_start ov40_0223131C
ov40_0223131C: ; 0x0223131C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _02231330
	cmp r1, #1
	beq _02231398
	cmp r1, #2
	beq _022313B8
	b _022313E4
_02231330:
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0x80
	mov r2, #0x60
	bl sub_02087948
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0x80
	mov r2, #0x60
	bl sub_020878B8
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_020878B0
	ldr r0, [r4, #0xc]
	mov r3, #0x10
	add r0, r0, #1
	str r0, [r4, #0xc]
	ldr r0, [r4, #0x58]
	mov r1, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r5, [r4, #0xc]
	ldr r0, [r4, #0x28]
	sub r3, r3, r5
	lsl r3, r3, #0x18
	mov r2, #2
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r4, #0xc]
	cmp r0, #2
	bne _022313EA
	mov r0, #0xf
	str r0, [r4, #0xc]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022313EA
_02231398:
	ldr r0, [r4, #0x58]
	mov r1, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #0xc]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #2
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022313EA
_022313B8:
	ldr r0, [r4, #0xc]
	mov r1, #1
	sub r0, r0, #1
	str r0, [r4, #0xc]
	ldr r0, [r4, #0x58]
	mov r2, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #0xc]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _022313EA
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022313EA
_022313E4:
	mov r1, #3
	bl ov40_0222BF80
_022313EA:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_0223131C

	thumb_func_start ov40_022313F0
ov40_022313F0: ; 0x022313F0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov40_0223142C
	add r4, r0, #0
	ldr r0, _02231428 ; =0x000005FC
	add r1, sp, #0
	ldr r0, [r5, r0]
	add r1, #2
	add r2, sp, #0
	bl ov40_0222D294
	mov r0, #0x6f
	lsl r0, r0, #4
	add r3, sp, #0
	mov r1, #2
	ldrsh r1, [r3, r1]
	mov r2, #0
	ldrsh r2, [r3, r2]
	add r1, #0x10
	lsl r1, r1, #0x10
	ldr r0, [r5, r0]
	asr r1, r1, #0x10
	bl sub_020878B8
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_02231428: .word 0x000005FC
	thumb_func_end ov40_022313F0

	thumb_func_start ov40_0223142C
ov40_0223142C: ; 0x0223142C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r0, #0
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _0223143E
	cmp r0, #1
	beq _0223152A
	b _0223161A
_0223143E:
	mov r0, #0x6d
	mov r1, #0x54
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x54
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #0x86
	lsl r0, r0, #4
	str r4, [r5, r0]
	add r0, r4, #0
	add r3, r4, #0
	mov r1, #0x10
	add r0, #0x50
	strb r1, [r0]
	ldr r0, [r5, #0x58]
	add r3, #0x50
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldrb r3, [r3]
	ldr r0, [r5, #0x28]
	mov r1, #2
	mov r2, #0xc
	bl sub_02003EA4
	mov r0, #0
	str r0, [sp, #0x14]
	mov r0, #0x6e
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #0
	ble _02231522
	ldr r0, [sp, #0x14]
	mov r7, #0x19
	str r0, [sp, #4]
	add r6, r5, #0
_0223148C:
	ldr r0, [sp, #4]
	mov r2, #0x6e
	str r0, [r4]
	mov r0, #0x5a
	str r0, [r4, #4]
	mov r0, #0x6e
	lsl r0, r0, #4
	ldr r1, [r5, r0]
	mov r0, #5
	sub r0, r0, r1
	lsl r0, r0, #4
	add r0, r7, r0
	strh r0, [r4, #8]
	lsl r2, r2, #4
	ldr r3, [r5, r2]
	mov r2, #5
	sub r2, r2, r3
	ldr r0, _02231690 ; =0x000005FC
	lsl r2, r2, #4
	add r2, #0xa9
	lsl r2, r2, #0x10
	ldr r0, [r6, r0]
	mov r1, #0x2a
	asr r2, r2, #0x10
	bl ov40_0222D288
	ldr r0, _02231690 ; =0x000005FC
	add r1, r4, #0
	ldr r0, [r6, r0]
	add r1, #0xc
	add r2, sp, #0x20
	bl sub_0200DF2C
	mov r2, #0x6e
	lsl r2, r2, #4
	ldr r3, [r5, r2]
	mov r2, #5
	ldr r0, _02231690 ; =0x000005FC
	sub r2, r2, r3
	lsl r2, r2, #4
	add r2, #0xa9
	ldr r0, [r6, r0]
	ldr r1, [r4, #0xc]
	lsl r2, r2, #0xc
	bl sub_0200DF08
	mov r0, #0x61
	lsl r0, r0, #4
	mov r1, #0x24
	add r2, r1, #0
	ldr r0, [r6, r0]
	sub r2, #0x2c
	bl sub_020136B4
	mov r0, #0x61
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	mov r1, #1
	bl sub_020137C0
	ldr r0, [sp, #4]
	add r4, #0x10
	add r0, r0, #4
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	add r7, #0x24
	add r0, r0, #1
	str r0, [sp, #0x14]
	mov r0, #0x6e
	lsl r0, r0, #4
	ldr r1, [r5, r0]
	ldr r0, [sp, #0x14]
	add r6, #0x28
	cmp r0, r1
	blt _0223148C
_02231522:
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223168A
_0223152A:
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	add r0, r4, #0
	add r0, #0x50
	ldrb r0, [r0]
	cmp r0, #0
	beq _02231560
	add r0, r4, #0
	add r0, #0x50
	ldrb r0, [r0]
	add r3, r4, #0
	add r3, #0x50
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x50
	strb r1, [r0]
	ldr r0, [r5, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldrb r3, [r3]
	ldr r0, [r5, #0x28]
	mov r2, #0xc
	bl sub_02003EA4
_02231560:
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	mov r0, #0x6e
	lsl r0, r0, #4
	ldr r1, [r5, r0]
	cmp r1, #0
	ble _0223160C
	add r6, r5, #0
	add r7, sp, #0x18
_02231574:
	ldr r0, [r4]
	cmp r0, #0
	beq _02231580
	sub r0, r0, #1
	str r0, [r4]
	b _022315F6
_02231580:
	ldr r0, _02231690 ; =0x000005FC
	add r1, sp, #0x1c
	ldr r0, [r6, r0]
	add r1, #2
	add r2, sp, #0x1c
	bl ov40_0222D294
	mov r0, #8
	mov r1, #4
	ldrsh r0, [r4, r0]
	ldrsh r2, [r7, r1]
	cmp r2, r0
	bne _022315A2
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	b _022315F6
_022315A2:
	add r1, r2, #0
	sub r1, #8
	cmp r1, r0
	ble _022315B0
	sub r2, #8
	strh r2, [r7, #4]
	b _022315B2
_022315B0:
	strh r0, [r7, #4]
_022315B2:
	mov r0, #4
	ldrsh r0, [r7, r0]
	ldr r1, [r4, #4]
	lsl r0, r0, #0xc
	str r0, [sp, #8]
	ldr r0, _02231694 ; =0x0000FFFF
	mul r0, r1
	mov r1, #0x5a
	lsl r1, r1, #2
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl GF_SinDeg
	lsl r1, r0, #4
	ldr r0, [r4, #4]
	ldr r2, [r4, #0xc]
	sub r0, r0, #4
	str r0, [r4, #4]
	ldr r0, _02231690 ; =0x000005FC
	add r1, r2, r1
	ldr r0, [r6, r0]
	ldr r2, [sp, #8]
	bl sub_0200DF08
	mov r0, #0x61
	lsl r0, r0, #4
	mov r1, #0x24
	add r2, r1, #0
	ldr r0, [r6, r0]
	sub r2, #0x2c
	bl sub_020136B4
_022315F6:
	ldr r0, [sp, #0x10]
	add r4, #0x10
	add r0, r0, #1
	str r0, [sp, #0x10]
	mov r0, #0x6e
	lsl r0, r0, #4
	ldr r1, [r5, r0]
	ldr r0, [sp, #0x10]
	add r6, #0x28
	cmp r0, r1
	blt _02231574
_0223160C:
	ldr r0, [sp, #0xc]
	cmp r0, r1
	bne _0223168A
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223168A
_0223161A:
	ldr r1, _02231698 ; =0x000006E4
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r2, [r5, r1]
	ldr r4, [r5, r0]
	mov r0, #0x28
	mul r0, r2
	add r0, r5, r0
	sub r1, #0xe8
	ldr r0, [r0, r1]
	add r1, sp, #0x18
	add r1, #2
	add r2, sp, #0x18
	bl ov40_0222D294
	mov r0, #0x6f
	lsl r0, r0, #4
	add r2, sp, #0x18
	mov r1, #2
	ldrsh r1, [r2, r1]
	mov r3, #0
	ldrsh r2, [r2, r3]
	add r1, #0x10
	lsl r1, r1, #0x10
	ldr r0, [r5, r0]
	asr r1, r1, #0x10
	bl sub_02087948
	mov r0, #0x6f
	lsl r0, r0, #4
	add r2, sp, #0x18
	mov r1, #2
	ldrsh r1, [r2, r1]
	mov r3, #0
	ldrsh r2, [r2, r3]
	add r1, #0x10
	lsl r1, r1, #0x10
	ldr r0, [r5, r0]
	asr r1, r1, #0x10
	bl sub_020878B8
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_020879E0
	add r0, r5, #0
	bl ov40_0222C39C
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x24
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0223168A:
	mov r0, #0
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02231690: .word 0x000005FC
_02231694: .word 0x0000FFFF
_02231698: .word 0x000006E4
	thumb_func_end ov40_0223142C

	thumb_func_start ov40_0223169C
ov40_0223169C: ; 0x0223169C
	push {r4, lr}
	add r4, r0, #0
	bl System_GetTouchNew
	cmp r0, #0
	beq _022316B6
	ldr r0, _022316F8 ; =0x0000089C
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _022316B6
	add r0, r4, #0
	bl ov40_0222DE40
_022316B6:
	ldr r0, [r4]
	cmp r0, #0
	bne _022316EE
	bl ov40_02231700
	cmp r0, #1
	beq _022316CA
	cmp r0, #2
	beq _022316DC
	b _022316EE
_022316CA:
	ldr r0, _022316FC ; =0x0000057B
	bl PlaySE
	add r0, r4, #0
	mov r1, #7
	bl ov40_0222BF80
	mov r0, #0
	pop {r4, pc}
_022316DC:
	ldr r0, _022316FC ; =0x0000057B
	bl PlaySE
	add r0, r4, #0
	mov r1, #8
	bl ov40_0222BF80
	mov r0, #0
	pop {r4, pc}
_022316EE:
	add r0, r4, #0
	bl ov40_0222C474
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_022316F8: .word 0x0000089C
_022316FC: .word 0x0000057B
	thumb_func_end ov40_0223169C

	thumb_func_start ov40_02231700
ov40_02231700: ; 0x02231700
	push {r3, lr}
	ldr r0, _02231724 ; =ov40_02245100
	bl sub_020252F4
	cmp r0, #0
	beq _02231710
	mov r0, #1
	pop {r3, pc}
_02231710:
	ldr r0, _02231728 ; =ov40_02245104
	bl sub_020252F4
	cmp r0, #0
	beq _0223171E
	mov r0, #2
	pop {r3, pc}
_0223171E:
	mov r0, #0
	pop {r3, pc}
	nop
_02231724: .word ov40_02245100
_02231728: .word ov40_02245104
	thumb_func_end ov40_02231700

	thumb_func_start ov40_0223172C
ov40_0223172C: ; 0x0223172C
	push {r4, lr}
	add r4, r0, #0
	bl GF_AssertFail
	mov r0, #1
	str r0, [r4, #0x44]
	add r0, r4, #0
	mov r1, #0
	bl ov40_0222BF80
	add r0, r4, #0
	bl ov40_0223169C
	pop {r4, pc}
	thumb_func_end ov40_0223172C

	thumb_func_start ov40_02231748
ov40_02231748: ; 0x02231748
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _0223175E
	cmp r1, #1
	beq _02231788
	cmp r1, #2
	beq _0223180E
	b _0223183A
_0223175E:
	mov r1, #0
	str r1, [r4, #0x54]
	mov r0, #0x6f
	str r1, [r4, #0xc]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_020879E0
	ldr r0, _02231858 ; =0x000006F4
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_020879E0
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02231850
_02231788:
	ldr r1, [r4, #0xc]
	cmp r1, #0x10
	beq _02231802
	add r1, r1, #2
	str r1, [r4, #0xc]
	bl ov40_0222DAF0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #0xc]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	ldr r2, _0223185C ; =0x0000FFFE
	mov r1, #2
	lsr r3, r3, #0x18
	bl sub_02003EA4
	add r0, r4, #0
	bl ov40_0222DAF0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #0xc]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	ldr r2, _02231860 ; =0x0000FFFF
	mov r1, #0
	lsr r3, r3, #0x18
	bl sub_02003EA4
	add r0, r4, #0
	bl ov40_0222DAF0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #0xc]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	ldr r2, _02231864 ; =0x00003FFE
	mov r1, #3
	lsr r3, r3, #0x18
	bl sub_02003EA4
	add r0, r4, #0
	bl ov40_0222DAF0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #0xc]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	ldr r2, _02231860 ; =0x0000FFFF
	mov r1, #1
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02231850
_02231802:
	mov r0, #0x10
	str r0, [r4, #0xc]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02231850
_0223180E:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _0223181A
	sub r0, r0, #4
	str r0, [r4, #0xc]
	b _02231850
_0223181A:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x6d
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02231850
_0223183A:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _02231850
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, pc}
_02231850:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_02231858: .word 0x000006F4
_0223185C: .word 0x0000FFFE
_02231860: .word 0x0000FFFF
_02231864: .word 0x00003FFE
	thumb_func_end ov40_02231748

	thumb_func_start ov40_02231868
ov40_02231868: ; 0x02231868
	push {r4, lr}
	add r4, r0, #0
	bl ov40_0223142C
	cmp r0, #0
	beq _02231898
	ldr r0, [r4, #0x44]
	cmp r0, #1
	bne _02231890
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_020879E0
	add r0, r4, #0
	mov r1, #0
	bl ov40_0222BF80
	b _02231898
_02231890:
	add r0, r4, #0
	mov r1, #1
	bl ov40_0222BF80
_02231898:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov40_02231868

	thumb_func_start ov40_0223189C
ov40_0223189C: ; 0x0223189C
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x44]
	cmp r1, #1
	bne _022318BC
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_020879E0
	add r0, r4, #0
	mov r1, #0
	bl ov40_0222BF80
	b _022318C2
_022318BC:
	mov r1, #1
	bl ov40_0222BF80
_022318C2:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov40_0223189C

	thumb_func_start ov40_022318C8
ov40_022318C8: ; 0x022318C8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldrb r0, [r4, #0x1d]
	cmp r0, #0
	beq _022318DA
	cmp r0, #1
	beq _02231904
	b _02231994
_022318DA:
	mov r0, #4
	ldrsh r1, [r4, r0]
	mov r0, #0
	ldrsh r0, [r4, r0]
	sub r0, r1, r0
	ldrb r1, [r4, #0x1c]
	bl _s32_div_f
	strh r0, [r4, #8]
	mov r0, #6
	ldrsh r1, [r4, r0]
	mov r0, #2
	ldrsh r0, [r4, r0]
	sub r0, r1, r0
	ldrb r1, [r4, #0x1c]
	bl _s32_div_f
	strh r0, [r4, #0xa]
	ldrb r0, [r4, #0x1d]
	add r0, r0, #1
	strb r0, [r4, #0x1d]
_02231904:
	add r1, sp, #0
	ldr r0, [r4, #0x20]
	add r1, #2
	add r2, sp, #0
	bl ov40_0222D294
	ldrb r0, [r4, #0x1c]
	add r1, sp, #0
	sub r0, r0, #1
	strb r0, [r4, #0x1c]
	ldrb r0, [r4, #0x1c]
	cmp r0, #0
	bne _02231932
	mov r0, #4
	ldrsh r0, [r4, r0]
	strh r0, [r1, #2]
	mov r0, #6
	ldrsh r0, [r4, r0]
	strh r0, [r1]
	ldrb r0, [r4, #0x1d]
	add r0, r0, #1
	strb r0, [r4, #0x1d]
	b _0223194A
_02231932:
	mov r0, #2
	ldrsh r2, [r1, r0]
	mov r0, #8
	ldrsh r0, [r4, r0]
	add r0, r2, r0
	strh r0, [r1, #2]
	mov r0, #0
	ldrsh r2, [r1, r0]
	mov r0, #0xa
	ldrsh r0, [r4, r0]
	add r0, r2, r0
	strh r0, [r1]
_0223194A:
	ldr r0, [r4, #0x28]
	cmp r0, #0
	beq _02231970
	add r3, sp, #0
	mov r1, #2
	ldrsh r1, [r3, r1]
	mov r2, #0
	ldrsh r2, [r3, r2]
	add r1, #0x10
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	bl sub_020878B8
	ldrb r0, [r4, #0x1c]
	cmp r0, #2
	bne _02231970
	ldr r0, [r4, #0x30]
	mov r1, #1
	str r1, [r0]
_02231970:
	add r3, sp, #0
	mov r1, #2
	mov r2, #0
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	ldr r0, [r4, #0x20]
	bl ov40_0222D288
	mov r1, #0x24
	add r2, r1, #0
	ldr r0, [r4, #0x24]
	sub r2, #0x2c
	bl sub_020136B4
	ldr r0, [r4, #0x2c]
	mov r1, #1
	str r1, [r0]
	pop {r3, r4, r5, pc}
_02231994:
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_022318C8

	thumb_func_start ov40_022319A4
ov40_022319A4: ; 0x022319A4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _022319BC
	cmp r1, #1
	beq _02231A9A
	cmp r1, #2
	bne _022319BA
	b _02231C24
_022319BA:
	b _02231C54
_022319BC:
	mov r0, #0x6d
	mov r1, #0x10
	bl AllocFromHeap
	str r0, [sp, #4]
	mov r1, #0
	mov r2, #0x10
	bl MI_CpuFill8
	mov r1, #0x86
	ldr r0, [sp, #4]
	lsl r1, r1, #4
	str r0, [r4, r1]
	mov r7, #0
	str r7, [r0, #8]
	mov r0, #0x6e
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	ble _02231A8C
	ldr r0, [sp, #4]
	add r6, r4, #0
	add r0, r0, #4
	str r0, [sp, #0xc]
	ldr r0, [sp, #4]
	str r0, [sp, #0x10]
	add r0, #0xc
	str r0, [sp, #0x10]
_022319F4:
	mov r0, #0x6d
	mov r1, #0x34
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x34
	add r5, r0, #0
	bl memset
	ldr r0, _02231C5C ; =0x000005FC
	add r1, r5, #0
	ldr r0, [r6, r0]
	add r2, r5, #2
	bl ov40_0222D294
	ldr r0, _02231C5C ; =0x000005FC
	ldr r0, [r6, r0]
	str r0, [r5, #0x20]
	mov r0, #0x61
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	str r0, [r5, #0x24]
	ldr r0, [sp, #0xc]
	str r0, [r5, #0x2c]
	ldr r0, [sp, #0x10]
	str r0, [r5, #0x30]
	ldr r0, _02231C60 ; =0x000006E4
	ldr r0, [r4, r0]
	cmp r7, r0
	bne _02231A4A
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	str r0, [r5, #0x28]
	mov r0, #0
	ldrsh r0, [r5, r0]
	strh r0, [r5, #4]
	mov r0, #0x2f
	mvn r0, r0
	strh r0, [r5, #6]
	mov r0, #8
	strb r0, [r5, #0x1c]
	b _02231A72
_02231A4A:
	mov r0, #0
	str r0, [r5, #0x28]
	ldrsh r0, [r5, r0]
	strh r0, [r5, #4]
	mov r0, #0x6e
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	mov r0, #5
	sub r0, r0, r1
	lsl r0, r0, #4
	add r0, #0xcd
	strh r0, [r5, #6]
	mov r0, #6
	ldrsh r0, [r5, r0]
	cmp r0, #0xdd
	blt _02231A6E
	mov r0, #0xdd
	strh r0, [r5, #6]
_02231A6E:
	mov r0, #8
	strb r0, [r5, #0x1c]
_02231A72:
	mov r2, #2
	ldr r0, _02231C64 ; =ov40_022318C8
	add r1, r5, #0
	lsl r2, r2, #0xc
	bl CreateSysTask
	mov r0, #0x6e
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r7, r7, #1
	add r6, #0x28
	cmp r7, r0
	blt _022319F4
_02231A8C:
	ldr r0, [sp, #4]
	mov r1, #0
	str r1, [r0]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02231C54
_02231A9A:
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	str r0, [sp, #8]
	ldr r0, [r0]
	cmp r0, #0x10
	beq _02231AC8
	add r1, r0, #2
	ldr r0, [sp, #8]
	ldr r3, [sp, #8]
	str r1, [r0]
	ldr r0, [r4, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r3]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
_02231AC8:
	ldr r0, [sp, #8]
	ldr r0, [r0, #0xc]
	cmp r0, #1
	beq _02231AD2
	b _02231BDC
_02231AD2:
	ldr r0, [sp, #8]
	mov r7, #0
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _02231BD2
	ldr r0, [sp, #8]
	mov r1, #1
	str r1, [r0, #8]
	ldr r0, _02231C68 ; =0x00000534
	add r6, r4, #0
	add r0, r4, r0
	str r0, [sp, #0x18]
	ldr r0, [sp, #8]
	add r0, r0, #4
	str r0, [sp, #0x14]
_02231AF0:
	mov r0, #0x6d
	mov r1, #0x34
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x34
	add r5, r0, #0
	bl memset
	ldr r0, _02231C68 ; =0x00000534
	add r1, r5, #0
	ldr r0, [r6, r0]
	add r2, r5, #2
	bl ov40_0222D294
	ldr r0, _02231C68 ; =0x00000534
	ldr r0, [r6, r0]
	str r0, [r5, #0x20]
	ldr r0, _02231C6C ; =0x00000548
	ldr r0, [r6, r0]
	str r0, [r5, #0x24]
	ldr r0, [sp, #0x14]
	str r0, [r5, #0x2c]
	mov r0, #0
	str r0, [r5, #0x28]
	ldrsh r0, [r5, r0]
	strh r0, [r5, #4]
	ldr r0, _02231C70 ; =0x000006D8
	ldr r0, [r4, r0]
	cmp r0, r7
	bne _02231B98
	mov r0, #0
	ldrsh r0, [r5, r0]
	ldr r1, _02231C74 ; =0x00000818
	strh r0, [r5, #4]
	mov r0, #0xa9
	strh r0, [r5, #6]
	ldr r3, [r4, r1]
	ldr r1, _02231C60 ; =0x000006E4
	ldr r0, _02231C68 ; =0x00000534
	ldr r2, [r4, r1]
	mov r1, #0x24
	mul r1, r2
	add r1, r3, r1
	ldr r0, [r6, r0]
	ldr r1, [r1, #0xc]
	bl sub_0200DC4C
	ldr r0, _02231C60 ; =0x000006E4
	mov r2, #0x28
	ldr r1, [r4, r0]
	mov r0, #0x24
	add r3, r1, #0
	ldr r1, _02231C70 ; =0x000006D8
	mul r3, r0
	ldr r0, _02231C74 ; =0x00000818
	ldr r1, [r4, r1]
	ldr r0, [r4, r0]
	mul r2, r1
	ldr r1, [sp, #0x18]
	mov ip, r0
	add r1, r1, r2
	mov r2, ip
	add r3, r2, r3
	ldr r2, [r3, #8]
	add r0, r4, #0
	bl ov40_0222D3E8
	ldr r0, _02231C70 ; =0x000006D8
	ldr r1, [r4, r0]
	mov r0, #0x28
	mul r0, r1
	add r1, r4, r0
	ldr r0, _02231C6C ; =0x00000548
	ldr r0, [r1, r0]
	mov r1, #1
	bl sub_020137C0
	ldr r0, _02231C68 ; =0x00000534
	mov r1, #1
	ldr r0, [r6, r0]
	bl sub_0200DCE8
	b _02231BB6
_02231B98:
	mov r0, #0
	ldrsh r0, [r5, r0]
	mov r1, #4
	sub r0, r0, #4
	strh r0, [r5, #4]
	ldr r0, _02231C70 ; =0x000006D8
	ldr r0, [r4, r0]
	sub r2, r0, r7
	lsl r0, r2, #4
	sub r2, r1, r2
	mov r1, #0x24
	mul r1, r2
	add r1, #0x19
	add r0, r0, r1
	strh r0, [r5, #6]
_02231BB6:
	mov r0, #4
	strb r0, [r5, #0x1c]
	mov r2, #2
	ldr r0, _02231C64 ; =ov40_022318C8
	add r1, r5, #0
	lsl r2, r2, #0xc
	bl CreateSysTask
	ldr r0, _02231C70 ; =0x000006D8
	add r7, r7, #1
	ldr r0, [r4, r0]
	add r6, #0x28
	cmp r7, r0
	ble _02231AF0
_02231BD2:
	ldr r0, [sp, #8]
	ldr r1, [r0, #0xc]
	str r1, [r0, #4]
	mov r1, #0
	str r1, [r0, #0xc]
_02231BDC:
	ldr r0, _02231C70 ; =0x000006D8
	mov r5, #0
	ldr r0, [r4, r0]
	cmp r0, #0
	ble _02231C0E
	ldr r7, _02231C68 ; =0x00000534
	add r6, r4, #0
_02231BEA:
	cmp r5, r0
	bne _02231BF8
	ldr r0, [r6, r7]
	mov r1, #1
	bl sub_0200DD24
	b _02231C02
_02231BF8:
	ldr r0, _02231C68 ; =0x00000534
	mov r1, #2
	ldr r0, [r6, r0]
	bl sub_0200DD24
_02231C02:
	ldr r0, _02231C70 ; =0x000006D8
	add r5, r5, #1
	ldr r0, [r4, r0]
	add r6, #0x28
	cmp r5, r0
	blt _02231BEA
_02231C0E:
	ldr r0, [sp, #8]
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _02231C1C
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_02231C1C:
	ldr r0, [sp, #8]
	mov r1, #0
	str r1, [r0, #4]
	b _02231C54
_02231C24:
	ldr r1, _02231C74 ; =0x00000818
	ldr r3, [r4, r1]
	ldr r1, _02231C60 ; =0x000006E4
	ldr r2, [r4, r1]
	mov r1, #0x24
	mul r1, r2
	add r1, r3, r1
	ldr r1, [r1, #0x20]
	cmp r1, #0
	bne _02231C3E
	bl ov40_0222C03C
	b _02231C44
_02231C3E:
	mov r1, #5
	bl ov40_0222BF80
_02231C44:
	add r0, r4, #0
	bl ov40_0222BFB0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl FreeToHeap
_02231C54:
	mov r0, #0
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02231C5C: .word 0x000005FC
_02231C60: .word 0x000006E4
_02231C64: .word ov40_022318C8
_02231C68: .word 0x00000534
_02231C6C: .word 0x00000548
_02231C70: .word 0x000006D8
_02231C74: .word 0x00000818
	thumb_func_end ov40_022319A4

	thumb_func_start ov40_02231C78
ov40_02231C78: ; 0x02231C78
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _02231C90
	cmp r1, #1
	beq _02231D52
	cmp r1, #2
	bne _02231C8E
	b _02231E38
_02231C8E:
	b _02231E72
_02231C90:
	mov r0, #0x6d
	mov r1, #0x10
	bl AllocFromHeap
	str r0, [sp, #8]
	mov r1, #0
	mov r2, #0x10
	bl MI_CpuFill8
	mov r1, #0x86
	ldr r0, [sp, #8]
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r0, #4
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	mov r6, #0
	add r0, #0xc
	add r7, r5, #0
	str r0, [sp, #8]
_02231CB8:
	mov r0, #0x6d
	mov r1, #0x34
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x34
	add r4, r0, #0
	bl memset
	ldr r0, _02231E90 ; =0x00000534
	add r1, r4, #0
	ldr r0, [r7, r0]
	add r2, r4, #2
	bl ov40_0222D294
	ldr r0, _02231E90 ; =0x00000534
	ldr r0, [r7, r0]
	str r0, [r4, #0x20]
	ldr r0, _02231E94 ; =0x00000548
	ldr r0, [r7, r0]
	str r0, [r4, #0x24]
	ldr r0, [sp, #0xc]
	str r0, [r4, #0x2c]
	ldr r0, [sp, #8]
	str r0, [r4, #0x30]
	mov r0, #0
	str r0, [r4, #0x28]
	ldrsh r0, [r4, r0]
	strh r0, [r4, #4]
	ldr r0, _02231E98 ; =0x000006D8
	ldr r0, [r5, r0]
	sub r0, r0, #1
	cmp r0, r6
	bne _02231D0E
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	str r0, [r4, #0x28]
	mov r0, #0
	ldrsh r0, [r4, r0]
	strh r0, [r4, #4]
	mov r0, #0xd9
	b _02231D2A
_02231D0E:
	mov r0, #0
	ldrsh r0, [r4, r0]
	mov r1, #0x24
	add r0, r0, #4
	strh r0, [r4, #4]
	ldr r0, _02231E98 ; =0x000006D8
	ldr r0, [r5, r0]
	sub r2, r0, r6
	mov r0, #5
	sub r0, r0, r2
	mul r1, r0
	add r1, #0x1d
	lsl r0, r2, #4
	add r0, r1, r0
_02231D2A:
	strh r0, [r4, #6]
	mov r0, #4
	strb r0, [r4, #0x1c]
	mov r2, #2
	ldr r0, _02231E9C ; =ov40_022318C8
	add r1, r4, #0
	lsl r2, r2, #0xc
	bl CreateSysTask
	ldr r0, _02231E98 ; =0x000006D8
	add r6, r6, #1
	ldr r0, [r5, r0]
	add r7, #0x28
	sub r0, r0, #1
	cmp r6, r0
	ble _02231CB8
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02231E88
_02231D52:
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	str r0, [sp, #4]
	ldr r0, [r0, #0xc]
	cmp r0, #1
	bne _02231E36
	mov r0, #0x6e
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r7, #0
	cmp r0, #0
	ble _02231DF2
	ldr r0, [sp, #4]
	add r6, r5, #0
	add r0, r0, #4
	str r0, [sp, #0x10]
	ldr r0, [sp, #4]
	str r0, [sp, #0x14]
	add r0, #0xc
	str r0, [sp, #0x14]
_02231D7C:
	mov r0, #0x6d
	mov r1, #0x34
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x34
	add r4, r0, #0
	bl memset
	ldr r0, _02231EA0 ; =0x000005FC
	add r1, r4, #0
	ldr r0, [r6, r0]
	add r2, r4, #2
	bl ov40_0222D294
	ldr r0, _02231EA0 ; =0x000005FC
	ldr r0, [r6, r0]
	str r0, [r4, #0x20]
	mov r0, #0x61
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	str r0, [r4, #0x24]
	ldr r0, [sp, #0x10]
	str r0, [r4, #0x2c]
	ldr r0, [sp, #0x14]
	str r0, [r4, #0x30]
	mov r0, #0
	str r0, [r4, #0x28]
	ldrsh r0, [r4, r0]
	strh r0, [r4, #4]
	mov r0, #0x6e
	lsl r0, r0, #4
	ldr r1, [r5, r0]
	mov r0, #5
	sub r0, r0, r1
	lsl r0, r0, #4
	add r0, #0xcd
	strh r0, [r4, #6]
	mov r0, #6
	ldrsh r0, [r4, r0]
	cmp r0, #0xdd
	blt _02231DD4
	mov r0, #0xdd
	strh r0, [r4, #6]
_02231DD4:
	mov r0, #8
	strb r0, [r4, #0x1c]
	mov r2, #2
	ldr r0, _02231E9C ; =ov40_022318C8
	add r1, r4, #0
	lsl r2, r2, #0xc
	bl CreateSysTask
	mov r0, #0x6e
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r7, r7, #1
	add r6, #0x28
	cmp r7, r0
	blt _02231D7C
_02231DF2:
	ldr r0, [sp, #4]
	mov r4, #0
	str r4, [r0]
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	ldr r0, _02231E98 ; =0x000006D8
	ldr r1, [r5, r0]
	sub r1, r1, #1
	str r1, [r5, r0]
	ldr r0, [r5, r0]
	cmp r0, #0
	ble _02231E88
	ldr r7, _02231E90 ; =0x00000534
	add r6, r5, #0
_02231E10:
	sub r0, r0, #1
	cmp r4, r0
	bne _02231E20
	ldr r0, [r6, r7]
	mov r1, #1
	bl sub_0200DD24
	b _02231E2A
_02231E20:
	ldr r0, _02231E90 ; =0x00000534
	mov r1, #2
	ldr r0, [r6, r0]
	bl sub_0200DD24
_02231E2A:
	ldr r0, _02231E98 ; =0x000006D8
	add r4, r4, #1
	ldr r0, [r5, r0]
	add r6, #0x28
	cmp r4, r0
	blt _02231E10
_02231E36:
	b _02231E88
_02231E38:
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	ldr r0, [r4]
	cmp r0, #0x10
	beq _02231E60
	add r0, r0, #2
	str r0, [r4]
	ldr r0, [r5, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
_02231E60:
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _02231E6C
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_02231E6C:
	mov r0, #0
	str r0, [r4, #4]
	b _02231E88
_02231E72:
	bl ov40_0222C018
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl FreeToHeap
	add r0, r5, #0
	mov r1, #5
	bl ov40_0222BF80
_02231E88:
	mov r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02231E90: .word 0x00000534
_02231E94: .word 0x00000548
_02231E98: .word 0x000006D8
_02231E9C: .word ov40_022318C8
_02231EA0: .word 0x000005FC
	thumb_func_end ov40_02231C78

	thumb_func_start ov40_02231EA4
ov40_02231EA4: ; 0x02231EA4
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #4
	bls _02231EB2
	b _02232080
_02231EB2:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02231EBE: ; jump table
	.short _02231EC8 - _02231EBE - 2 ; case 0
	.short _02231EF8 - _02231EBE - 2 ; case 1
	.short _02231F6E - _02231EBE - 2 ; case 2
	.short _02231FF2 - _02231EBE - 2 ; case 3
	.short _0223200A - _02231EBE - 2 ; case 4
_02231EC8:
	mov r0, #0
	str r0, [r4, #0x54]
	add r0, r4, #0
	add r0, #0x5c
	ldrb r0, [r0]
	cmp r0, #0
	beq _02231EE0
	add r0, r4, #0
	add r0, #0x5c
	ldrb r0, [r0]
	sub r1, r0, #1
	b _02231EE2
_02231EE0:
	mov r1, #6
_02231EE2:
	add r0, r4, #0
	add r0, #0x5c
	strb r1, [r0]
	add r0, r4, #0
	bl ov40_0222DAC0
	str r0, [r4, #0x58]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02232088
_02231EF8:
	add r0, r4, #0
	add r0, #0x54
	mov r1, #1
	bl ov40_0222DA84
	cmp r0, #0
	beq _02231F0C
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_02231F0C:
	ldr r0, [r4, #0x58]
	ldr r2, _02232090 ; =0x0000FFFF
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #0x54]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r1, #2
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r4, #0x58]
	ldr r2, _02232090 ; =0x0000FFFF
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #0x54]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r1, #0
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r4, #0x58]
	ldr r2, _02232090 ; =0x0000FFFF
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #0x54]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r1, #3
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r4, #0x58]
	ldr r2, _02232090 ; =0x0000FFFF
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #0x54]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r1, #1
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02232088
_02231F6E:
	mov r0, #0x10
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #0
	bl GX_EngineBToggleLayers
	add r1, r4, #0
	add r1, #0x5c
	ldrb r1, [r1]
	add r0, r4, #0
	bl ov40_0222DBEC
	ldr r0, [r4, #0x58]
	ldr r2, _02232090 ; =0x0000FFFF
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #0x54]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r1, #2
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r4, #0x58]
	ldr r2, _02232090 ; =0x0000FFFF
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #0x54]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r1, #0
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r4, #0x58]
	ldr r2, _02232090 ; =0x0000FFFF
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #0x54]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r1, #3
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r4, #0x58]
	ldr r2, _02232090 ; =0x0000FFFF
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #0x54]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r1, #1
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02232088
_02231FF2:
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02232088
_0223200A:
	add r0, r4, #0
	add r0, #0x54
	mov r1, #0
	bl ov40_0222DA84
	cmp r0, #0
	beq _0223201E
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223201E:
	ldr r0, [r4, #0x58]
	ldr r2, _02232090 ; =0x0000FFFF
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #0x54]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r1, #2
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r4, #0x58]
	ldr r2, _02232090 ; =0x0000FFFF
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #0x54]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r1, #0
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r4, #0x58]
	ldr r2, _02232090 ; =0x0000FFFF
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #0x54]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r1, #3
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r4, #0x58]
	ldr r2, _02232090 ; =0x0000FFFF
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #0x54]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r1, #1
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02232088
_02232080:
	add r0, r4, #0
	mov r1, #0
	bl ov40_0222BF80
_02232088:
	mov r0, #0
	add sp, #4
	pop {r3, r4, pc}
	nop
_02232090: .word 0x0000FFFF
	thumb_func_end ov40_02231EA4

	thumb_func_start ov40_02232094
ov40_02232094: ; 0x02232094
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #4
	bls _022320A2
	b _02232274
_022320A2:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022320AE: ; jump table
	.short _022320B8 - _022320AE - 2 ; case 0
	.short _022320EC - _022320AE - 2 ; case 1
	.short _02232162 - _022320AE - 2 ; case 2
	.short _022321E6 - _022320AE - 2 ; case 3
	.short _022321FE - _022320AE - 2 ; case 4
_022320B8:
	mov r0, #0
	str r0, [r4, #0x54]
	add r0, r4, #0
	add r0, #0x5c
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x5c
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x5c
	ldrb r0, [r0]
	mov r1, #7
	bl _s32_div_f
	add r0, r4, #0
	add r0, #0x5c
	strb r1, [r0]
	add r0, r4, #0
	bl ov40_0222DAC0
	str r0, [r4, #0x58]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223227E
_022320EC:
	add r0, r4, #0
	add r0, #0x54
	mov r1, #1
	bl ov40_0222DA84
	cmp r0, #0
	beq _02232100
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_02232100:
	ldr r0, [r4, #0x58]
	ldr r2, _02232284 ; =0x0000FFFF
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #0x54]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r1, #2
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r4, #0x58]
	ldr r2, _02232284 ; =0x0000FFFF
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #0x54]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r1, #0
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r4, #0x58]
	ldr r2, _02232284 ; =0x0000FFFF
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #0x54]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r1, #3
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r4, #0x58]
	ldr r2, _02232284 ; =0x0000FFFF
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #0x54]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r1, #1
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223227E
_02232162:
	mov r0, #0x10
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #0
	bl GX_EngineBToggleLayers
	add r1, r4, #0
	add r1, #0x5c
	ldrb r1, [r1]
	add r0, r4, #0
	bl ov40_0222DBEC
	ldr r0, [r4, #0x58]
	ldr r2, _02232284 ; =0x0000FFFF
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #0x54]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r1, #2
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r4, #0x58]
	ldr r2, _02232284 ; =0x0000FFFF
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #0x54]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r1, #0
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r4, #0x58]
	ldr r2, _02232284 ; =0x0000FFFF
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #0x54]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r1, #3
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r4, #0x58]
	ldr r2, _02232284 ; =0x0000FFFF
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #0x54]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r1, #1
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223227E
_022321E6:
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223227E
_022321FE:
	add r0, r4, #0
	add r0, #0x54
	mov r1, #0
	bl ov40_0222DA84
	cmp r0, #0
	beq _02232212
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_02232212:
	ldr r0, [r4, #0x58]
	ldr r2, _02232284 ; =0x0000FFFF
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #0x54]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r1, #2
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r4, #0x58]
	ldr r2, _02232284 ; =0x0000FFFF
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #0x54]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r1, #0
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r4, #0x58]
	ldr r2, _02232284 ; =0x0000FFFF
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #0x54]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r1, #3
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r4, #0x58]
	ldr r2, _02232284 ; =0x0000FFFF
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #0x54]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r1, #1
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223227E
_02232274:
	mov r1, #0
	add r0, r4, #0
	str r1, [r4, #0x54]
	bl ov40_0222BF80
_0223227E:
	mov r0, #0
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_02232284: .word 0x0000FFFF
	thumb_func_end ov40_02232094

	thumb_func_start ov40_02232288
ov40_02232288: ; 0x02232288
	push {r3, r4, r5, lr}
	mov r1, #0x67
	add r5, r0, #0
	mov r0, #0x6d
	lsl r1, r1, #2
	bl AllocFromHeap
	mov r2, #0x67
	mov r1, #0
	lsl r2, r2, #2
	add r4, r0, #0
	bl memset
	mov r0, #0x86
	lsl r0, r0, #4
	str r4, [r5, r0]
	ldr r0, [r5, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	add r1, r4, #4
	mov r2, #0
	bl ov40_0222D9E8
	add r0, r5, #0
	mov r1, #1
	bl ov40_0222BF80
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_02232288

	thumb_func_start ov40_022322E0
ov40_022322E0: ; 0x022322E0
	push {r4, r5, r6, lr}
	sub sp, #0x10
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _022322F8
	cmp r1, #1
	beq _02232356
	b _022323E2
_022322F8:
	add r0, r4, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	cmp r0, #0
	beq _0223230C
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_0223230C:
	ldr r0, [r5, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r5, #0x58]
	mov r1, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #2
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02232460
_02232356:
	mov r1, #1
	bl ov40_02230964
	add r0, r5, #0
	bl ov40_0222D874
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	mov r0, #0
	add r1, r0, #0
	bl SetBgPriority
	mov r0, #1
	mov r1, #3
	bl SetBgPriority
	mov r0, #2
	mov r1, #0
	bl SetBgPriority
	mov r0, #3
	mov r1, #2
	bl SetBgPriority
	mov r0, #4
	mov r1, #0
	bl SetBgPriority
	mov r0, #5
	mov r1, #3
	bl SetBgPriority
	mov r0, #6
	mov r1, #1
	bl SetBgPriority
	mov r0, #7
	mov r1, #2
	bl SetBgPriority
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #0x24]
	mov r1, #0x3e
	mov r3, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #0x24]
	mov r1, #0x3e
	mov r3, #7
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02232460
_022323E2:
	mov r1, #0
	bl ov40_0222FB90
	add r0, r5, #0
	bl ov40_0222C4DC
	cmp r0, #1
	bne _02232458
	ldr r0, _02232468 ; =0x0000086C
	mov r6, #0
	ldr r1, [r5, r0]
	cmp r1, #0
	bne _02232400
	mov r6, #1
	b _0223242A
_02232400:
	lsl r1, r1, #2
	add r1, r5, r1
	add r0, #0x10
	ldr r0, [r1, r0]
	mov r1, #5
	add r2, r6, #0
	bl sub_0203088C
	mov r3, #0
	mov r2, #1
	eor r1, r3
	eor r0, r2
	orr r0, r1
	bne _02232420
	mov r6, #1
	b _0223242A
_02232420:
	ldr r0, _0223246C ; =0x00000874
	ldr r0, [r5, r0]
	cmp r0, #1
	bne _0223242A
	mov r6, #1
_0223242A:
	cmp r6, #0
	beq _02232446
	add r0, r5, #0
	bl ov40_02233044
	mov r0, #0x66
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r5, #0
	mov r1, #9
	bl ov40_0222BF80
	b _02232460
_02232446:
	mov r0, #0x66
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r5, #0
	mov r1, #6
	bl ov40_0222BF80
	b _02232460
_02232458:
	add r0, r5, #0
	mov r1, #2
	bl ov40_0222BF80
_02232460:
	mov r0, #0
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_02232468: .word 0x0000086C
_0223246C: .word 0x00000874
	thumb_func_end ov40_022322E0

	thumb_func_start ov40_02232470
ov40_02232470: ; 0x02232470
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r4, r0, #0
	lsl r1, r1, #4
	ldr r5, [r4, r1]
	ldr r1, [r4, #8]
	cmp r1, #3
	bls _02232482
	b _02232584
_02232482:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223248E: ; jump table
	.short _02232496 - _0223248E - 2 ; case 0
	.short _022324AC - _0223248E - 2 ; case 1
	.short _022324CE - _0223248E - 2 ; case 2
	.short _0223252A - _0223248E - 2 ; case 3
_02232496:
	bl ov40_02233044
	add r0, r4, #0
	mov r1, #6
	mov r2, #7
	bl ov40_022307DC
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223258C
_022324AC:
	bl ov40_02232F50
	mov r0, #0x6d
	str r0, [sp]
	ldr r0, _02232590 ; =ov40_02245134
	ldr r2, _02232594 ; =ov40_02232ED4
	mov r1, #3
	add r3, r4, #0
	bl sub_02026C44
	mov r1, #0x5d
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223258C
_022324CE:
	mov r1, #1
	bl ov40_02230964
	add r0, r5, #0
	add r0, #0x9c
	add r1, r4, #0
	bl ov40_02230638
	add r0, r5, #0
	add r0, #0x9c
	bl ov40_02230410
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #3
	bl ov40_022307DC
	add r5, #0x9c
	add r0, r5, #0
	mov r1, #0
	bl ov40_022306A0
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223258C
_0223252A:
	add r0, r5, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	mov r2, #0
	add r0, r5, #0
	add r1, r5, #4
	add r3, r2, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223256A
	add r0, r5, #0
	add r0, #0x9c
	mov r1, #1
	bl ov40_022306A0
	add r0, r4, #0
	bl ov40_02232F88
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223256A:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223258C
_02232584:
	add r0, r4, #0
	mov r1, #3
	bl ov40_0222BF80
_0223258C:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02232590: .word ov40_02245134
_02232594: .word ov40_02232ED4
	thumb_func_end ov40_02232470

	thumb_func_start ov40_02232598
ov40_02232598: ; 0x02232598
	push {r3, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r1, [r0, r1]
	mov r0, #0x5d
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl sub_02026CC4
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov40_02232598

	thumb_func_start ov40_022325B0
ov40_022325B0: ; 0x022325B0
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #3
	bhi _022326BE
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022325CC: ; jump table
	.short _022325D4 - _022325CC - 2 ; case 0
	.short _02232600 - _022325CC - 2 ; case 1
	.short _02232618 - _022325CC - 2 ; case 2
	.short _0223267A - _022325CC - 2 ; case 3
_022325D4:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _022325E6
	add r4, #0x9c
	add r0, r4, #0
	add r1, r5, #0
	bl ov40_0223064C
	b _022325F0
_022325E6:
	add r4, #0x10
	add r0, r4, #0
	add r1, r5, #0
	bl ov40_0222E7B8
_022325F0:
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _022326D6
_02232600:
	mov r2, #1
	add r0, r4, #0
	add r1, r4, #4
	add r3, r2, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _022326D6
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _022326D6
_02232618:
	mov r1, #1
	bl ov40_02230964
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _02232644
	add r0, r4, #0
	add r0, #0x10
	add r1, r5, #0
	bl ov40_0222E79C
	add r4, #0x10
	add r0, r4, #0
	mov r1, #0
	bl ov40_0222E7DC
	add r0, r5, #0
	mov r1, #0x50
	mov r2, #3
	bl ov40_022307DC
	b _0223266A
_02232644:
	add r0, r4, #0
	add r0, #0x9c
	add r1, r5, #0
	bl ov40_02230638
	add r0, r4, #0
	add r0, #0x9c
	mov r1, #0
	bl ov40_022306A0
	add r4, #0x9c
	add r0, r4, #0
	bl ov40_02230410
	add r1, r0, #0
	add r0, r5, #0
	mov r2, #3
	bl ov40_022307DC
_0223266A:
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _022326D6
_0223267A:
	add r0, r4, #0
	add r1, r4, #4
	mov r2, #0
	mov r3, #1
	bl ov40_0222DA00
	cmp r0, #0
	beq _022326D6
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _0223269C
	add r4, #0x10
	add r0, r4, #0
	mov r1, #1
	bl ov40_0222E7DC
	b _022326A6
_0223269C:
	add r4, #0x9c
	add r0, r4, #0
	mov r1, #1
	bl ov40_022306A0
_022326A6:
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _022326D6
_022326BE:
	ldr r1, [r4, #0xc]
	mov r0, #1
	eor r1, r0
	str r1, [r4, #0xc]
	add r0, r5, #0
	add r1, #0x79
	bl ov40_02232FEC
	add r0, r5, #0
	mov r1, #3
	bl ov40_0222BF80
_022326D6:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_022325B0

	thumb_func_start ov40_022326DC
ov40_022326DC: ; 0x022326DC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	mov r6, #0x5e
	ldr r4, [r5, r0]
	lsl r6, r6, #2
	add r0, r4, r6
	bl InitWindow
	mov r2, #6
	str r2, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x24]
	add r1, r4, r6
	mov r3, #4
	bl AddWindowParameterized
	add r0, r4, r6
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x48]
	mov r1, #0x82
	bl NewString_ReadMsgData
	add r7, r0, #0
	add r0, r4, r6
	add r1, r7, #0
	bl ov40_022306C0
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _022327B8 ; =0x000F0D00
	add r2, r7, #0
	str r0, [sp, #8]
	add r0, r4, r6
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r7, #0
	bl String_dtor
	add r0, r4, r6
	bl ScheduleWindowCopyToVram
	add r6, #0x10
	add r0, r4, r6
	bl InitWindow
	mov r2, #6
	str r2, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	mov r0, #0x15
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x24]
	add r1, r4, r6
	mov r3, #0x12
	bl AddWindowParameterized
	add r0, r4, r6
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x48]
	mov r1, #0x83
	bl NewString_ReadMsgData
	add r5, r0, #0
	add r0, r4, r6
	add r1, r5, #0
	bl ov40_022306C0
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _022327B8 ; =0x000F0D00
	add r2, r5, #0
	str r0, [sp, #8]
	add r0, r4, r6
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl String_dtor
	add r0, r4, r6
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_022327B8: .word 0x000F0D00
	thumb_func_end ov40_022326DC

	thumb_func_start ov40_022327BC
ov40_022327BC: ; 0x022327BC
	push {r4, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r4, [r0, r1]
	mov r0, #0x5e
	lsl r0, r0, #2
	add r0, r4, r0
	bl ClearWindowTilemapAndCopyToVram
	mov r0, #0x5e
	lsl r0, r0, #2
	add r0, r4, r0
	bl RemoveWindow
	mov r0, #0x62
	lsl r0, r0, #2
	add r0, r4, r0
	bl ClearWindowTilemapAndCopyToVram
	mov r0, #0x62
	lsl r0, r0, #2
	add r0, r4, r0
	bl RemoveWindow
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov40_022327BC

	thumb_func_start ov40_022327F0
ov40_022327F0: ; 0x022327F0
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r2, [r4, #8]
	ldr r5, [r4, r1]
	cmp r2, #7
	bls _02232804
	b _02232A0E
_02232804:
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_02232810: ; jump table
	.short _02232820 - _02232810 - 2 ; case 0
	.short _0223287C - _02232810 - 2 ; case 1
	.short _022328CC - _02232810 - 2 ; case 2
	.short _0223290A - _02232810 - 2 ; case 3
	.short _02232954 - _02232810 - 2 ; case 4
	.short _022329B2 - _02232810 - 2 ; case 5
	.short _022329C2 - _02232810 - 2 ; case 6
	.short _022329D4 - _02232810 - 2 ; case 7
_02232820:
	mov r0, #0x5d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02026CAC
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	ldr r0, [r5, #0xc]
	cmp r0, #0
	bne _02232854
	add r0, r5, #0
	add r0, #0x9c
	add r1, r4, #0
	bl ov40_0223064C
	b _0223285E
_02232854:
	add r0, r5, #0
	add r0, #0x10
	add r1, r4, #0
	bl ov40_0222E7B8
_0223285E:
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	add r0, r4, #0
	bl ov40_02232FCC
	mov r0, #0x66
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02232A30
_0223287C:
	add r0, r5, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _022328B2
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r4, #0
	bl ov40_022330B8
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_022328B2:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02232A30
_022328CC:
	bl ov40_022326DC
	mov r1, #0x4a
	add r0, r4, #0
	lsl r1, r1, #2
	bl ov40_0222DED0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #0x54
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02232A30
_0223290A:
	add r0, r5, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #0
	mov r3, #2
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223293A
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223293A:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02232A30
_02232954:
	ldr r0, _02232A38 ; =ov40_0224512C
	bl sub_02025320
	cmp r0, #0
	beq _02232994
	mov r0, #0x66
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r4, #0
	bl ov40_02230944
	mov r0, #0x83
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl Save_NumModifiedPCBoxesIsMany
	cmp r0, #0
	beq _02232984
	ldr r1, _02232A3C ; =0x0000012A
	add r0, r4, #0
	bl ov40_0222DF60
	b _0223298C
_02232984:
	ldr r1, _02232A40 ; =0x0000012B
	add r0, r4, #0
	bl ov40_0222DF60
_0223298C:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02232A30
_02232994:
	ldr r0, _02232A44 ; =ov40_02245130
	bl sub_02025320
	cmp r0, #0
	beq _02232A30
	mov r0, #0x66
	mov r1, #2
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r4, #0
	bl ov40_02230944
	mov r0, #6
	str r0, [r4, #8]
	b _02232A30
_022329B2:
	sub r1, #0x30
	ldr r0, [r4, r1]
	bl SaveGameNormal
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02232A30
_022329C2:
	bl ov40_0222DFB0
	add r0, r4, #0
	bl ov40_022327BC
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02232A30
_022329D4:
	add r0, r5, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #1
	mov r3, #2
	bl ov40_0222DA00
	cmp r0, #0
	beq _022329F4
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_022329F4:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02232A30
_02232A0E:
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	cmp r1, #1
	bne _02232A22
	add r0, r4, #0
	mov r1, #7
	bl ov40_0222BF80
	b _02232A30
_02232A22:
	mov r1, #0
	str r1, [r5, r0]
	str r1, [r5, #0xc]
	add r0, r4, #0
	mov r1, #2
	bl ov40_0222BF80
_02232A30:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_02232A38: .word ov40_0224512C
_02232A3C: .word 0x0000012A
_02232A40: .word 0x0000012B
_02232A44: .word ov40_02245130
	thumb_func_end ov40_022327F0

	thumb_func_start ov40_02232A48
ov40_02232A48: ; 0x02232A48
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _02232A5E
	cmp r1, #1
	beq _02232A82
	cmp r1, #2
	beq _02232A92
	b _02232AD6
_02232A5E:
	ldr r1, _02232AF0 ; =0x0000012B
	bl ov40_0222DED0
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x6d
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02232AE8
_02232A82:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _02232AE8
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02232AE8
_02232A92:
	ldr r1, _02232AF4 ; =0x00000874
	ldr r0, [r4, r1]
	cmp r0, #0
	bne _02232ACE
	add r0, r1, #0
	sub r0, #8
	ldr r0, [r4, r0]
	sub r1, #0x44
	str r0, [sp]
	ldr r0, [r4, r1]
	mov r1, #0x6d
	add r2, sp, #0xc
	mov r3, #0
	bl sub_0202FC90
	mov r1, #0x83
	lsl r1, r1, #4
	ldr r0, [r4, r1]
	add r1, #0x3c
	ldr r1, [r4, r1]
	bl ov40_02244BBC
	bl sub_0202FC24
	add r0, r4, #0
	bl ov40_0222FDC4
	add r0, r4, #0
	bl ov40_0222FCCC
_02232ACE:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02232AE8
_02232AD6:
	bl ov40_0222DFB0
	add r0, r4, #0
	bl ov40_02233044
	add r0, r4, #0
	mov r1, #9
	bl ov40_0222BF80
_02232AE8:
	mov r0, #0
	add sp, #0x10
	pop {r4, pc}
	nop
_02232AF0: .word 0x0000012B
_02232AF4: .word 0x00000874
	thumb_func_end ov40_02232A48

	thumb_func_start ov40_02232AF8
ov40_02232AF8: ; 0x02232AF8
	push {r4, r5, lr}
	sub sp, #0xc
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _02232B14
	cmp r1, #1
	beq _02232B34
	cmp r1, #2
	beq _02232B44
	b _02232BC2
_02232B14:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x6d
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02232BCE
_02232B34:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _02232BCE
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02232BCE
_02232B44:
	mov r1, #0x66
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	cmp r1, #0
	bne _02232B8E
	mov r1, #1
	bl ov40_02230964
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _02232B66
	add r0, r4, #0
	add r0, #0x9c
	add r1, r5, #0
	bl ov40_0223064C
	b _02232B70
_02232B66:
	add r0, r4, #0
	add r0, #0x10
	add r1, r5, #0
	bl ov40_0222E7B8
_02232B70:
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	mov r0, #0x5d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02026CAC
	add r0, r5, #0
	bl ov40_02232FCC
	add r0, r5, #0
	bl ov40_022330B8
_02232B8E:
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r5, #0
	bl ov40_0222D8C8
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	ldr r1, [r5, #0x10]
	add r0, r5, #0
	ldr r1, [r1]
	bl ov40_0222C4E8
	ldr r0, _02232BD4 ; =0x00000868
	mov r1, #1
	ldr r0, [r5, r0]
	mov r2, #0
	bl sub_02087A84
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02232BCE
_02232BC2:
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_02232BCE:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_02232BD4: .word 0x00000868
	thumb_func_end ov40_02232AF8

	thumb_func_start ov40_02232BD8
ov40_02232BD8: ; 0x02232BD8
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _02232BF2
	cmp r1, #1
	beq _02232C36
	cmp r1, #2
	beq _02232C76
	b _02232CBA
_02232BF2:
	mov r0, #0x5d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02026CAC
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _02232C1E
	add r4, #0x9c
	add r0, r4, #0
	add r1, r5, #0
	bl ov40_0223064C
	b _02232C28
_02232C1E:
	add r4, #0x10
	add r0, r4, #0
	add r1, r5, #0
	bl ov40_0222E7B8
_02232C28:
	add r0, r5, #0
	bl ov40_02232FCC
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02232D3E
_02232C36:
	add r0, r4, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r4, #0
	add r1, r4, #4
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _02232C5C
	add r0, r5, #0
	bl ov40_022330B8
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_02232C5C:
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02232D3E
_02232C76:
	mov r1, #1
	bl ov40_0222FB90
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r5, #0
	bl ov40_0222D88C
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, [r5, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02232D3E
_02232CBA:
	bl ov40_0222FBB4
	cmp r0, #0
	beq _02232D3E
	add r0, r4, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	cmp r0, #0
	beq _02232D0E
	add r0, r5, #0
	bl ov40_0222DD08
	add r0, r4, #0
	add r0, #8
	bl ov40_0222DAA8
	ldr r0, [r5, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r5, #0x28]
	mov r2, #0xc
	mov r3, #0x10
	bl sub_02003EA4
	mov r1, #1
	ldr r3, [r5, #0x10]
	add r0, r5, #0
	add r2, r1, #0
	bl ov40_0222BF64
	add r0, r5, #0
	mov r1, #5
	bl ov40_0222BF80
	add r0, r4, #0
	bl FreeToHeap
	b _02232D3E
_02232D0E:
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r5, #0x58]
	mov r1, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #2
	lsr r3, r3, #0x18
	bl sub_02003EA4
_02232D3E:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_02232BD8

	thumb_func_start ov40_02232D44
ov40_02232D44: ; 0x02232D44
	push {r4, r5, lr}
	sub sp, #0xc
	mov r1, #0x86
	add r4, r0, #0
	lsl r1, r1, #4
	ldr r5, [r4, r1]
	ldr r1, [r4, #8]
	cmp r1, #5
	bls _02232D58
	b _02232EAC
_02232D58:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02232D64: ; jump table
	.short _02232D70 - _02232D64 - 2 ; case 0
	.short _02232D90 - _02232D64 - 2 ; case 1
	.short _02232DB2 - _02232D64 - 2 ; case 2
	.short _02232E0E - _02232D64 - 2 ; case 3
	.short _02232E7E - _02232D64 - 2 ; case 4
	.short _02232E9C - _02232D64 - 2 ; case 5
_02232D70:
	mov r1, #6
	mov r2, #7
	bl ov40_022307DC
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02232EC2
_02232D90:
	bl ov40_02232F50
	mov r0, #0x6d
	str r0, [sp]
	ldr r0, _02232EC8 ; =ov40_02245134
	ldr r2, _02232ECC ; =ov40_02232ED4
	mov r1, #3
	add r3, r4, #0
	bl sub_02026C44
	mov r1, #0x5d
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02232EC2
_02232DB2:
	mov r1, #1
	bl ov40_02230964
	add r0, r5, #0
	add r0, #0x9c
	add r1, r4, #0
	bl ov40_02230638
	add r0, r5, #0
	add r0, #0x9c
	bl ov40_02230410
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #3
	bl ov40_022307DC
	add r5, #0x9c
	add r0, r5, #0
	mov r1, #0
	bl ov40_022306A0
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02232EC2
_02232E0E:
	add r0, r5, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	mov r2, #0
	add r0, r5, #0
	add r1, r5, #4
	add r3, r2, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _02232E64
	add r0, r5, #0
	add r0, #0x9c
	mov r1, #1
	bl ov40_022306A0
	add r0, r4, #0
	bl ov40_02232F88
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #1
	bne _02232E56
	mov r0, #0xff
	b _02232E5A
_02232E56:
	ldr r0, [r4, #8]
	add r0, r0, #1
_02232E5A:
	str r0, [r4, #8]
	mov r0, #0x66
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
_02232E64:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02232EC2
_02232E7E:
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x6d
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02232EC2
_02232E9C:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _02232EC2
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02232EC2
_02232EAC:
	ldr r0, _02232ED0 ; =0x000006D8
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	add r0, r4, #0
	bl ov40_0222C4B8
	add r0, r4, #0
	mov r1, #3
	bl ov40_0222BF80
_02232EC2:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_02232EC8: .word ov40_02245134
_02232ECC: .word ov40_02232ED4
_02232ED0: .word 0x000006D8
	thumb_func_end ov40_02232D44

	thumb_func_start ov40_02232ED4
ov40_02232ED4: ; 0x02232ED4
	push {r3, r4, r5, lr}
	add r5, r2, #0
	mov r2, #0x86
	lsl r2, r2, #4
	ldr r4, [r5, r2]
	cmp r1, #0
	bne _02232F48
	cmp r0, #0
	beq _02232EF0
	cmp r0, #1
	beq _02232F00
	cmp r0, #2
	beq _02232F3A
	pop {r3, r4, r5, pc}
_02232EF0:
	add r0, r5, #0
	bl ov40_02230944
	add r0, r5, #0
	mov r1, #4
	bl ov40_0222BF80
	pop {r3, r4, r5, pc}
_02232F00:
	add r0, r5, #0
	bl ov40_02230944
	ldr r0, _02232F4C ; =0x0000086C
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02232F26
	add r4, #0xa0
	ldr r0, [r4]
	mov r1, #5
	mov r2, #0
	bl sub_0203088C
	mov r3, #0
	mov r2, #1
	eor r1, r3
	eor r0, r2
	orr r0, r1
	bne _02232F30
_02232F26:
	add r0, r5, #0
	mov r1, #7
	bl ov40_0222BF80
	pop {r3, r4, r5, pc}
_02232F30:
	add r0, r5, #0
	mov r1, #5
	bl ov40_0222BF80
	pop {r3, r4, r5, pc}
_02232F3A:
	add r0, r5, #0
	bl ov40_02230944
	add r0, r5, #0
	mov r1, #8
	bl ov40_0222BF80
_02232F48:
	pop {r3, r4, r5, pc}
	nop
_02232F4C: .word 0x0000086C
	thumb_func_end ov40_02232ED4

	thumb_func_start ov40_02232F50
ov40_02232F50: ; 0x02232F50
	push {r3, r4}
	mov r3, #0x86
	lsl r3, r3, #4
	add r2, r3, #0
	add r2, #0xc
	ldr r2, [r0, r2]
	ldr r1, [r0, r3]
	lsl r2, r2, #2
	add r4, r0, r2
	add r2, r3, #0
	add r2, #0x2c
	ldr r4, [r4, r2]
	add r2, r1, #0
	str r4, [r1, #0x10]
	add r2, #0x9c
	str r4, [r2]
	add r2, r3, #0
	add r2, #0xc
	ldr r2, [r0, r2]
	add r3, #0x1c
	lsl r2, r2, #2
	add r0, r0, r2
	ldr r0, [r0, r3]
	add r1, #0xa0
	str r0, [r1]
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov40_02232F50

	thumb_func_start ov40_02232F88
ov40_02232F88: ; 0x02232F88
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	mov r6, #0x5e
	ldr r4, [r5, r0]
	lsl r6, r6, #2
	add r0, r4, r6
	bl InitWindow
	mov r0, #3
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x24]
	add r1, r4, r6
	mov r2, #6
	mov r3, #8
	bl AddWindowParameterized
	add r0, r5, #0
	mov r1, #0x79
	bl ov40_02232FEC
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov40_02232F88

	thumb_func_start ov40_02232FCC
ov40_02232FCC: ; 0x02232FCC
	push {r4, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r4, [r0, r1]
	mov r0, #0x5e
	lsl r0, r0, #2
	add r0, r4, r0
	bl ClearWindowTilemapAndCopyToVram
	mov r0, #0x5e
	lsl r0, r0, #2
	add r0, r4, r0
	bl RemoveWindow
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov40_02232FCC

	thumb_func_start ov40_02232FEC
ov40_02232FEC: ; 0x02232FEC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	mov r6, #0x5e
	add r7, r1, #0
	ldr r4, [r5, r0]
	lsl r6, r6, #2
	add r0, r4, r6
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x48]
	add r1, r7, #0
	bl NewString_ReadMsgData
	add r5, r0, #0
	add r0, r4, r6
	add r1, r5, #0
	bl ov40_022306C0
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02233040 ; =0x000F0D00
	add r2, r5, #0
	str r0, [sp, #8]
	add r0, r4, r6
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl String_dtor
	add r0, r4, r6
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02233040: .word 0x000F0D00
	thumb_func_end ov40_02232FEC

	thumb_func_start ov40_02233044
ov40_02233044: ; 0x02233044
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	mov r1, #2
	bl ov40_0222D6EC
	add r0, r5, #0
	mov r1, #2
	bl ov40_0222D800
	mov r1, #0x57
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r0, r1, #4
	add r1, r5, #0
	add r0, r4, r0
	add r1, #0x14
	mov r2, #2
	bl ov40_0222D5AC
	mov r0, #0x56
	lsl r0, r0, #2
	add r5, #0x14
	add r0, r4, r0
	add r1, r5, #0
	mov r2, #3
	bl ov40_0222D66C
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DC4C
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x50
	mov r2, #0xe8
	bl sub_0200DDB8
	mov r0, #0x16
	lsl r0, r0, #4
	mov r1, #0x24
	add r2, r1, #0
	ldr r0, [r4, r0]
	sub r2, #0x2c
	bl sub_020136B4
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_020137C0
	pop {r3, r4, r5, pc}
	thumb_func_end ov40_02233044

	thumb_func_start ov40_022330B8
ov40_022330B8: ; 0x022330B8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	mov r0, #0x56
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov40_0222D6D0
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200D9DC
	add r0, r5, #0
	bl ov40_0222D7DC
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_022330B8

	thumb_func_start ov40_022330E0
ov40_022330E0: ; 0x022330E0
	push {r4, lr}
	mov r2, #0x86
	lsl r2, r2, #4
	ldr r4, [r0, r2]
	cmp r1, #0
	bne _022330FC
	add r0, r4, #0
	add r0, #0xbc
	ldr r0, [r0]
	mov r1, #0x80
	mov r2, #0xe8
	bl sub_0200DDB8
	b _0223310A
_022330FC:
	add r0, r4, #0
	add r0, #0xbc
	ldr r0, [r0]
	mov r1, #0x50
	mov r2, #0xe8
	bl sub_0200DDB8
_0223310A:
	add r4, #0xc0
	mov r1, #0x24
	add r2, r1, #0
	ldr r0, [r4]
	sub r2, #0x2c
	bl sub_020136B4
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov40_022330E0

	thumb_func_start ov40_0223311C
ov40_0223311C: ; 0x0223311C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	ldr r6, [r0, #0x14]
	ldr r4, [r0, #0x18]
	ldr r5, [r0, #0x1c]
	mov r0, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, _02233168 ; =0x00002E94
	add r1, r5, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r2, r6, #0
	mov r3, #0x32
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	ldr r0, _02233168 ; =0x00002E94
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r6, #0
	mov r3, #0x1c
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _02233168 ; =0x00002E94
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r6, #0
	mov r3, #0x1d
	bl sub_0200D71C
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02233168: .word 0x00002E94
	thumb_func_end ov40_0223311C

	thumb_func_start ov40_0223316C
ov40_0223316C: ; 0x0223316C
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	mov r1, #2
	bl ov40_0223311C
	add r0, r5, #0
	mov r1, #2
	bl ov40_0222D800
	add r1, r4, #0
	add r1, #0xbc
	str r0, [r1]
	add r0, r4, #0
	add r1, r5, #0
	add r0, #0xb8
	add r1, #0x14
	mov r2, #2
	bl ov40_0222D5AC
	add r0, r4, #0
	add r1, r5, #0
	add r0, #0xb8
	add r1, #0x14
	mov r2, #3
	bl ov40_0222D66C
	add r0, r4, #0
	add r0, #0xbc
	ldr r0, [r0]
	mov r1, #0x80
	mov r2, #0xe8
	bl sub_0200DDB8
	add r0, r4, #0
	add r0, #0xc0
	mov r1, #0x24
	add r2, r1, #0
	ldr r0, [r0]
	sub r2, #0x2c
	bl sub_020136B4
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	mov r1, #1
	bl sub_020137C0
	add r0, r5, #0
	mov r1, #2
	bl ov40_0222D800
	add r1, r4, #0
	add r1, #0x98
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x98
	ldr r0, [r0]
	mov r1, #0xdc
	mov r2, #0xe0
	bl sub_0200DDB8
	add r0, r4, #0
	add r0, #0x98
	ldr r0, [r0]
	mov r1, #2
	bl sub_0200DC4C
	add r4, #0x98
	ldr r0, [r4]
	mov r1, #0
	bl sub_0200DCE8
	add r0, r5, #0
	mov r1, #1
	bl ov40_022330E0
	pop {r3, r4, r5, pc}
	thumb_func_end ov40_0223316C

	thumb_func_start ov40_0223320C
ov40_0223320C: ; 0x0223320C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	add r0, r4, #0
	add r0, #0xb8
	bl ov40_0222D6D0
	add r0, r4, #0
	add r0, #0xbc
	ldr r0, [r0]
	bl sub_0200D9DC
	add r4, #0x98
	ldr r0, [r4]
	bl sub_0200D9DC
	add r0, r5, #0
	bl ov40_0222D7DC
	pop {r3, r4, r5, pc}
	thumb_func_end ov40_0223320C

	thumb_func_start ov40_02233238
ov40_02233238: ; 0x02233238
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x50
	ldr r5, [r0, #0x24]
	str r0, [sp, #0x18]
	ldr r7, [r0, #0x14]
	ldr r6, [r0, #0x18]
	ldr r4, [r0, #0x1c]
	ldr r0, [r0, #0x28]
	mov r1, #0x3e
	str r0, [sp, #0x24]
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	add r0, r7, #0
	add r2, r5, #0
	mov r3, #6
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	add r0, r7, #0
	mov r1, #0x44
	add r2, r5, #0
	mov r3, #6
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldr r0, [sp, #0x18]
	mov r1, #0
	bl ov40_0222DB30
	str r7, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	ldr r0, _022334D8 ; =0x0000726C
	mov r1, #3
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x24]
	add r2, r6, #0
	add r3, r4, #0
	bl sub_0200D68C
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _022334D8 ; =0x0000726C
	add r1, r4, #0
	str r0, [sp, #8]
	add r0, r6, #0
	add r2, r7, #0
	mov r3, #0x42
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	ldr r0, _022334D8 ; =0x0000726C
	add r1, r4, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r7, #0
	mov r3, #0x47
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _022334D8 ; =0x0000726C
	add r1, r4, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r7, #0
	mov r3, #0x48
	bl sub_0200D71C
	ldr r0, [sp, #0x18]
	mov r1, #1
	bl ov40_0222DB30
	str r7, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #6
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, _022334DC ; =0x00006E7A
	mov r1, #2
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x24]
	add r2, r6, #0
	add r3, r4, #0
	bl sub_0200D68C
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _022334DC ; =0x00006E7A
	add r1, r4, #0
	str r0, [sp, #8]
	add r0, r6, #0
	add r2, r7, #0
	mov r3, #0x40
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	ldr r0, _022334DC ; =0x00006E7A
	add r1, r4, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r7, #0
	mov r3, #0x26
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _022334DC ; =0x00006E7A
	add r1, r4, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r7, #0
	mov r3, #0x27
	bl sub_0200D71C
	ldr r3, _022334E0 ; =ov40_0224519C
	add r2, sp, #0x3c
	ldmia r3!, {r0, r1}
	str r2, [sp, #0x20]
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	ldr r3, _022334E4 ; =ov40_02245188
	str r0, [r2]
	add r2, sp, #0x28
	ldmia r3!, {r0, r1}
	str r2, [sp, #0x1c]
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r5, #0
	str r0, [r2]
_02233370:
	cmp r5, #3
	bne _022333B2
	str r7, [sp]
	mov r0, #0x5c
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _022334E8 ; =0x00004705
	mov r1, #2
	add r0, r5, r0
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x24]
	add r2, r6, #0
	add r3, r4, #0
	bl sub_0200D68C
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _022334E8 ; =0x00004705
	add r1, r4, #0
	add r0, r5, r0
	str r0, [sp, #8]
	add r0, r6, #0
	add r2, r7, #0
	mov r3, #0x5b
	bl sub_0200D504
	b _022333F4
_022333B2:
	mov r0, #0xb3
	str r0, [sp]
	ldr r0, [sp, #0x20]
	mov r1, #2
	ldr r0, [r0]
	add r2, r6, #0
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _022334E8 ; =0x00004705
	add r3, r4, #0
	add r0, r5, r0
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x24]
	bl sub_0200D644
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _022334E8 ; =0x00004705
	ldr r3, [sp, #0x1c]
	add r0, r5, r0
	str r0, [sp, #8]
	ldr r3, [r3]
	add r0, r6, #0
	add r1, r4, #0
	mov r2, #0xb3
	bl sub_0200E188
_022333F4:
	ldr r0, [sp, #0x20]
	add r5, r5, #1
	add r0, r0, #4
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x1c]
	add r0, r0, #4
	str r0, [sp, #0x1c]
	cmp r5, #5
	blt _02233370
	mov r0, #0
	str r0, [sp]
	ldr r0, _022334E8 ; =0x00004705
	add r1, r4, #0
	str r0, [sp, #4]
	add r0, r6, #0
	mov r2, #0xb3
	mov r3, #9
	bl sub_0200D6D4
	mov r0, #0
	str r0, [sp]
	ldr r0, _022334E8 ; =0x00004705
	add r1, r4, #0
	str r0, [sp, #4]
	add r0, r6, #0
	mov r2, #0xb3
	mov r3, #0xa
	bl sub_0200D704
	mov r0, #0
	str r0, [sp]
	ldr r0, _022334EC ; =0x00004706
	add r1, r4, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r7, #0
	mov r3, #0x59
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _022334EC ; =0x00004706
	add r1, r4, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r7, #0
	mov r3, #0x5a
	bl sub_0200D71C
	ldr r1, _022334F0 ; =0x0000088C
	ldr r0, [sp, #0x18]
	mov r6, #0xd
	ldr r0, [r0, r1]
	mov r7, #0xe
	bl sub_020315D0
	ldr r1, [sp, #0x18]
	cmp r0, #0
	ldr r4, [r1, #0x18]
	ldr r5, [r1, #0x1c]
	ldr r1, [r1, #0x28]
	beq _02233474
	mov r6, #0xf
	mov r7, #0x10
_02233474:
	mov r0, #0xb3
	str r0, [sp]
	str r6, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _022334F4 ; =0x0002869F
	add r2, r4, #0
	str r0, [sp, #0x14]
	add r0, r1, #0
	mov r1, #2
	add r3, r5, #0
	bl sub_0200D644
	mov r0, #0
	str r0, [sp]
	ldr r0, _022334F4 ; =0x0002869F
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0xb3
	mov r3, #9
	bl sub_0200D6D4
	mov r0, #0
	str r0, [sp]
	ldr r0, _022334F4 ; =0x0002869F
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0xb3
	mov r3, #0xa
	bl sub_0200D704
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _022334F4 ; =0x0002869F
	add r1, r5, #0
	str r0, [sp, #8]
	add r0, r4, #0
	mov r2, #0xb3
	add r3, r7, #0
	bl sub_0200E188
	add sp, #0x50
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022334D8: .word 0x0000726C
_022334DC: .word 0x00006E7A
_022334E0: .word ov40_0224519C
_022334E4: .word ov40_02245188
_022334E8: .word 0x00004705
_022334EC: .word 0x00004706
_022334F0: .word 0x0000088C
_022334F4: .word 0x0002869F
	thumb_func_end ov40_02233238

	thumb_func_start ov40_022334F8
ov40_022334F8: ; 0x022334F8
	push {r4, r5, r6, r7}
	add r3, r0, #0
	mov r0, #0
	cmp r1, #0
	ble _0223350A
_02233502:
	add r0, r0, #1
	add r3, r3, #2
	cmp r0, r1
	blt _02233502
_0223350A:
	add r7, r1, r2
	cmp r0, r7
	bge _0223354A
	mov r1, #0x97
_02233512:
	ldrh r6, [r3]
	mov r2, #0x1f
	add r0, r0, #1
	asr r4, r6, #0xa
	and r4, r2
	add r5, r4, #0
	mov r2, #0x1d
	mul r5, r2
	mov r2, #0x1f
	and r2, r6
	mov r4, #0x4c
	mul r4, r2
	asr r6, r6, #5
	mov r2, #0x1f
	and r2, r6
	add r6, r2, #0
	mul r6, r1
	add r2, r4, r6
	add r2, r5, r2
	asr r5, r2, #8
	lsl r4, r5, #0xa
	lsl r2, r5, #5
	orr r2, r4
	orr r2, r5
	strh r2, [r3]
	add r3, r3, #2
	cmp r0, r7
	blt _02233512
_0223354A:
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end ov40_022334F8

	thumb_func_start ov40_02233550
ov40_02233550: ; 0x02233550
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	str r0, [sp]
	ldr r0, [r0, #0x28]
	mov r1, #0x83
	str r0, [sp, #4]
	ldr r0, [sp]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	bl SavArray_Flags_get
	add r4, r0, #0
	bl ScriptState_GetBattleTowerPrintProgress
	str r0, [sp, #0x30]
	add r0, r4, #0
	bl ScriptState_GetBattleFactoryPrintProgress
	str r0, [sp, #0x34]
	add r0, r4, #0
	bl ScriptState_GetBattleArcadePrintProgress
	str r0, [sp, #0x38]
	add r0, r4, #0
	bl ScriptState_GetBattleCastlePrintProgress
	str r0, [sp, #0x3c]
	add r0, r4, #0
	bl ScriptState_GetBattleHallPrintProgress
	ldr r3, _022335F0 ; =ov40_02245174
	str r0, [sp, #0x40]
	ldmia r3!, {r0, r1}
	add r2, sp, #8
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r7, #0
	add r4, sp, #0x30
	add r5, sp, #0x1c
	str r0, [r2]
_022335A4:
	ldr r6, [r4]
	cmp r6, #0
	beq _022335D8
	add r3, sp, #8
	ldmia r3!, {r0, r1}
	add r2, sp, #0x1c
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	sub r0, r6, #2
	cmp r0, #1
	bhi _022335D8
	ldr r0, [sp]
	mov r1, #2
	ldr r0, [r0, #0x28]
	bl PaletteData_GetFadedBuf
	ldr r1, [r5]
	mov r2, #0x10
	add r1, r1, #4
	lsl r1, r1, #0x14
	lsr r1, r1, #0x10
	bl ov40_022334F8
_022335D8:
	add r7, r7, #1
	add r4, r4, #4
	add r5, r5, #4
	cmp r7, #5
	blt _022335A4
	ldr r0, [sp, #4]
	mov r1, #1
	bl sub_02003B50
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	nop
_022335F0: .word ov40_02245174
	thumb_func_end ov40_02233550

	thumb_func_start ov40_022335F4
ov40_022335F4: ; 0x022335F4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xa4
	add r7, r0, #0
	mov r0, #0
	str r0, [sp, #0x1c]
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r6, [r7, r0]
	ldr r0, [sp, #0x1c]
	add r1, sp, #0x20
	strh r0, [r1, #0x28]
	mov r0, #1
	lsl r0, r0, #8
	strh r0, [r1, #0x2a]
	ldr r0, [sp, #0x1c]
	ldr r5, [sp, #0x1c]
	strh r0, [r1, #0x2c]
	strh r0, [r1, #0x2e]
	mov r0, #0xa
	str r0, [sp, #0x50]
	ldr r0, [sp, #0x1c]
	mov r1, #1
	str r0, [sp, #0x54]
	str r0, [sp, #0x74]
	str r0, [sp, #0x78]
	sub r0, r1, #2
	str r0, [sp, #0x6c]
	str r0, [sp, #0x70]
	ldr r0, _022338B8 ; =0x0002869F
	str r1, [sp, #0x58]
	str r0, [sp, #0x5c]
	str r0, [sp, #0x60]
	str r0, [sp, #0x64]
	str r0, [sp, #0x68]
	add r4, r6, #0
_0223363A:
	ldr r0, [r7, #0x18]
	ldr r1, [r7, #0x1c]
	add r2, sp, #0x48
	bl sub_0200D734
	str r0, [r4, #0x40]
	mov r1, #1
	bl sub_0200DC4C
	ldr r0, [r4, #0x40]
	bl sub_0200DC18
	ldr r1, [r4, #4]
	ldr r0, [r4, #0x40]
	add r2, r1, #0
	bl sub_0200E024
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #5
	blt _0223363A
	mov r5, #0
	add r4, r6, #0
_02233668:
	ldr r0, _022338BC ; =0x00004705
	add r0, r5, r0
	str r0, [sp, #0x5c]
	str r0, [sp, #0x60]
	cmp r5, #3
	bne _0223367C
	ldr r0, _022338C0 ; =0x00004706
	str r0, [sp, #0x64]
	str r0, [sp, #0x68]
	b _02233682
_0223367C:
	ldr r0, _022338BC ; =0x00004705
	str r0, [sp, #0x64]
	str r0, [sp, #0x68]
_02233682:
	ldr r0, [r7, #0x18]
	ldr r1, [r7, #0x1c]
	add r2, sp, #0x48
	bl sub_0200D734
	str r0, [r4, #0x54]
	cmp r5, #3
	ldr r0, [r4, #0x54]
	bne _0223369C
	mov r1, #0
	bl sub_0200DC4C
	b _022336A2
_0223369C:
	mov r1, #1
	bl sub_0200DC4C
_022336A2:
	ldr r0, [r4, #0x54]
	bl sub_0200DC18
	ldr r1, [r4, #4]
	ldr r0, [r4, #0x54]
	add r2, r1, #0
	bl sub_0200E024
	add r1, r5, #0
	ldr r0, [r4, #0x54]
	add r1, #0xa
	bl sub_0200DD10
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #5
	blt _02233668
	ldr r0, _022338C4 ; =0x00006E7A
	str r0, [sp, #0x5c]
	str r0, [sp, #0x60]
	str r0, [sp, #0x64]
	str r0, [sp, #0x68]
	mov r0, #0
	mvn r0, r0
	str r0, [sp, #0x6c]
	str r0, [sp, #0x70]
	mov r0, #0x14
	str r0, [sp, #0x50]
	mov r0, #0x83
	lsl r0, r0, #4
	ldr r0, [r7, r0]
	bl SavArray_Flags_get
	add r4, r0, #0
	bl ScriptState_GetBattleTowerPrintProgress
	str r0, [sp, #0x7c]
	add r0, r4, #0
	bl ScriptState_GetBattleFactoryPrintProgress
	str r0, [sp, #0x80]
	add r0, r4, #0
	bl ScriptState_GetBattleArcadePrintProgress
	str r0, [sp, #0x84]
	add r0, r4, #0
	bl ScriptState_GetBattleCastlePrintProgress
	str r0, [sp, #0x88]
	add r0, r4, #0
	bl ScriptState_GetBattleHallPrintProgress
	str r0, [sp, #0x8c]
	mov r0, #0
	str r0, [sp, #4]
	add r0, sp, #0x7c
	ldr r2, _022338C8 ; =ov40_022451B0
	str r0, [sp, #0x10]
	ldmia r2!, {r0, r1}
	add r3, sp, #0x20
	stmia r3!, {r0, r1}
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	add r4, r6, #0
	add r5, sp, #0x34
	str r0, [r3]
_02233728:
	ldr r0, [r7, #0x18]
	ldr r1, [r7, #0x1c]
	add r2, sp, #0x48
	bl sub_0200D734
	str r0, [r4, #0x68]
	ldr r0, [sp, #0x10]
	ldr r0, [r0]
	cmp r0, #1
	bhi _0223375E
	ldr r0, [r4, #0x68]
	mov r1, #5
	bl sub_0200DC4C
	ldr r0, [r4, #0x68]
	mov r1, #9
	bl sub_0200DD10
	ldr r0, [r4, #0x54]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r4, #0x40]
	mov r1, #0
	bl sub_0200DCE8
	b _02233780
_0223375E:
	add r3, sp, #0x20
	ldmia r3!, {r0, r1}
	add r2, sp, #0x34
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r4, #0x68]
	ldr r1, [r5]
	bl sub_0200DC4C
	ldr r1, [r5]
	ldr r0, [r4, #0x68]
	add r1, r1, #4
	bl sub_0200DD10
_02233780:
	ldr r0, [r4, #0x68]
	bl sub_0200DC18
	ldr r1, [r4, #4]
	ldr r0, [r4, #0x68]
	add r2, r1, #0
	bl sub_0200E024
	ldr r0, [sp, #0x10]
	add r4, r4, #4
	add r0, r0, #4
	str r0, [sp, #0x10]
	ldr r0, [sp, #4]
	add r5, r5, #4
	add r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #5
	blt _02233728
	ldr r0, _022338CC ; =0x0000726C
	mov r4, #0xfa
	str r0, [sp, #0x5c]
	str r0, [sp, #0x60]
	str r0, [sp, #0x64]
	str r0, [sp, #0x68]
	mov r0, #0
	mvn r0, r0
	str r0, [sp, #0x6c]
	str r0, [sp, #0x70]
	mov r0, #2
	str r0, [sp, #0x58]
	mov r0, #0
	str r0, [sp, #0x18]
	str r0, [sp, #0x50]
	add r0, r6, #0
	add r0, #0x90
	ldr r0, [r0]
	lsl r4, r4, #2
	str r0, [sp]
	ldr r0, [sp, #0x18]
	add r5, sp, #0x90
	str r0, [sp, #8]
_022337D2:
	ldr r0, [sp]
	add r1, r4, #0
	bl _s32_div_f
	str r0, [r5]
	ldr r0, [sp]
	add r1, r4, #0
	bl _s32_div_f
	str r1, [sp]
	add r0, r4, #0
	mov r1, #0xa
	bl _s32_div_f
	add r4, r0, #0
	ldr r0, [r5]
	cmp r0, #0
	bne _02233804
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne _02233804
	ldr r0, [sp, #0x1c]
	add r0, r0, #1
	str r0, [sp, #0x1c]
	b _02233808
_02233804:
	mov r0, #1
	str r0, [sp, #0x18]
_02233808:
	ldr r0, [sp, #8]
	add r5, r5, #4
	add r0, r0, #1
	str r0, [sp, #8]
	cmp r0, #4
	blt _022337D2
	mov r0, #0xa
	str r0, [sp, #0xa0]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #0x58
	add r4, r6, #0
	add r5, sp, #0x90
	str r0, [sp, #0x14]
_02233824:
	ldr r0, [r7, #0x18]
	ldr r1, [r7, #0x1c]
	add r2, sp, #0x48
	bl sub_0200D734
	str r0, [r4, #0x7c]
	ldr r0, [r5]
	cmp r0, #0
	bne _02233846
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #0x1c]
	cmp r1, r0
	bge _02233846
	ldr r0, [r4, #0x7c]
	mov r1, #0
	bl sub_0200DCE8
_02233846:
	ldr r0, [r4, #0x7c]
	ldr r1, [r5]
	bl sub_0200DC4C
	ldr r1, [sp, #0x14]
	ldr r0, [r4, #0x7c]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	mov r2, #0x48
	bl ov40_0222D288
	ldr r0, [r4, #0x7c]
	bl sub_0200DC18
	ldr r0, [sp, #0x14]
	add r4, r4, #4
	add r0, #0x10
	str r0, [sp, #0x14]
	ldr r0, [sp, #0xc]
	add r5, r5, #4
	add r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #5
	blt _02233824
	add r0, r6, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #1
	bl sub_0200DCE8
	add r0, r6, #0
	add r0, #0x8c
	ldr r0, [r0]
	mov r1, #1
	bl sub_0200DCE8
	mov r5, #2
	mov r4, #0
	add r7, r5, #0
_02233894:
	ldr r0, [r6, #0x40]
	add r1, r5, #0
	bl sub_0200DF98
	ldr r0, [r6, #0x54]
	add r1, r7, #0
	bl sub_0200DF98
	ldr r0, [r6, #0x68]
	mov r1, #2
	bl sub_0200DF98
	add r4, r4, #1
	add r6, r6, #4
	cmp r4, #5
	blt _02233894
	add sp, #0xa4
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022338B8: .word 0x0002869F
_022338BC: .word 0x00004705
_022338C0: .word 0x00004706
_022338C4: .word 0x00006E7A
_022338C8: .word ov40_022451B0
_022338CC: .word 0x0000726C
	thumb_func_end ov40_022335F4

	thumb_func_start ov40_022338D0
ov40_022338D0: ; 0x022338D0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r7, [r5, r0]
	mov r4, #0
	add r6, r7, #0
_022338DE:
	ldr r1, _022339B8 ; =0x00004705
	ldr r0, [r5, #0x1c]
	add r1, r4, r1
	bl sub_0200D958
	ldr r1, _022339B8 ; =0x00004705
	ldr r0, [r5, #0x1c]
	add r1, r4, r1
	bl sub_0200D968
	ldr r0, [r6, #0x54]
	bl sub_0200D9DC
	add r4, r4, #1
	add r6, r6, #4
	cmp r4, #5
	blt _022338DE
	ldr r0, [r5, #0x1c]
	ldr r1, _022339B8 ; =0x00004705
	bl sub_0200D978
	ldr r0, [r5, #0x1c]
	ldr r1, _022339B8 ; =0x00004705
	bl sub_0200D988
	ldr r0, [r5, #0x1c]
	ldr r1, _022339BC ; =0x00004706
	bl sub_0200D978
	ldr r0, [r5, #0x1c]
	ldr r1, _022339BC ; =0x00004706
	bl sub_0200D988
	mov r6, #0
	add r4, r7, #0
_02233924:
	ldr r0, [r4, #0x40]
	bl sub_0200D9DC
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #5
	blt _02233924
	ldr r0, [r5, #0x1c]
	ldr r1, _022339C0 ; =0x0002869F
	bl sub_0200D958
	ldr r0, [r5, #0x1c]
	ldr r1, _022339C0 ; =0x0002869F
	bl sub_0200D968
	ldr r0, [r5, #0x1c]
	ldr r1, _022339C0 ; =0x0002869F
	bl sub_0200D978
	ldr r0, [r5, #0x1c]
	ldr r1, _022339C0 ; =0x0002869F
	bl sub_0200D988
	mov r6, #0
	add r4, r7, #0
_02233956:
	ldr r0, [r4, #0x68]
	bl sub_0200D9DC
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #5
	blt _02233956
	ldr r0, [r5, #0x1c]
	ldr r1, _022339C4 ; =0x00006E7A
	bl sub_0200D958
	ldr r0, [r5, #0x1c]
	ldr r1, _022339C4 ; =0x00006E7A
	bl sub_0200D968
	ldr r0, [r5, #0x1c]
	ldr r1, _022339C4 ; =0x00006E7A
	bl sub_0200D978
	ldr r0, [r5, #0x1c]
	ldr r1, _022339C4 ; =0x00006E7A
	bl sub_0200D988
	mov r4, #0
_02233986:
	ldr r0, [r7, #0x7c]
	bl sub_0200D9DC
	add r4, r4, #1
	add r7, r7, #4
	cmp r4, #5
	blt _02233986
	ldr r0, [r5, #0x1c]
	ldr r1, _022339C8 ; =0x0000726C
	bl sub_0200D958
	ldr r0, [r5, #0x1c]
	ldr r1, _022339C8 ; =0x0000726C
	bl sub_0200D968
	ldr r0, [r5, #0x1c]
	ldr r1, _022339C8 ; =0x0000726C
	bl sub_0200D978
	ldr r0, [r5, #0x1c]
	ldr r1, _022339C8 ; =0x0000726C
	bl sub_0200D988
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022339B8: .word 0x00004705
_022339BC: .word 0x00004706
_022339C0: .word 0x0002869F
_022339C4: .word 0x00006E7A
_022339C8: .word 0x0000726C
	thumb_func_end ov40_022338D0

	thumb_func_start ov40_022339CC
ov40_022339CC: ; 0x022339CC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	mov r6, #0x5a
	str r0, [sp]
	mov r4, #0
	add r5, r0, #0
	lsl r6, r6, #2
_022339E0:
	ldr r0, [r5, #0x2c]
	add r1, r6, #0
	add r0, #0x14
	str r0, [r5, #0x2c]
	bl _s32_div_f
	str r1, [r5, #0x2c]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #5
	blt _022339E0
	ldr r0, [sp]
	ldr r1, [sp]
	mov r2, #0
	add r0, #0xd4
	add r1, #0xd8
	add r3, r2, #0
	bl ov40_0222DA00
	ldr r5, [sp]
	mov r6, #0
	add r4, sp, #4
_02233A0C:
	ldr r0, [sp]
	ldr r0, [r0, #0x2c]
	cmp r0, #0
	beq _02233A1E
	ldr r0, [r5, #4]
	ldr r1, _02233AE8 ; =0x3D4CCCCD
	bl _fadd
	b _02233A3A
_02233A1E:
	ldr r0, [r5, #0x40]
	mov r1, #0
	bl sub_0200DF98
	ldr r0, [r5, #0x54]
	mov r1, #0
	bl sub_0200DF98
	ldr r0, [r5, #0x68]
	mov r1, #0
	bl sub_0200DF98
	mov r0, #0xfe
	lsl r0, r0, #0x16
_02233A3A:
	str r0, [r5, #4]
	ldr r0, [r5, #0x2c]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl GF_SinDeg
	ldr r1, [r5, #0x18]
	add r7, r1, #0
	mul r7, r0
	ldr r0, [r5, #0x2c]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl GF_CosDeg
	ldr r1, [r5, #0x18]
	add r2, r1, #0
	mul r2, r0
	mov r0, #0x6a
	lsl r0, r0, #0xc
	mov r1, #2
	sub r2, r0, r2
	lsl r1, r1, #0x12
	ldr r0, [r5, #0x68]
	add r1, r7, r1
	bl sub_0200DF08
	add r1, sp, #4
	ldr r0, [r5, #0x68]
	add r1, #2
	add r2, sp, #4
	bl sub_0200DE44
	mov r1, #2
	mov r2, #0
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r5, #0x40]
	sub r1, #0x20
	sub r2, r2, #2
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl sub_0200DDB8
	mov r1, #2
	mov r2, #0
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r5, #0x54]
	add r1, #0x10
	sub r2, r2, #2
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl sub_0200DDB8
	ldr r1, [r5, #4]
	ldr r0, [r5, #0x68]
	add r2, r1, #0
	bl sub_0200E024
	ldr r1, [r5, #4]
	ldr r0, [r5, #0x40]
	add r2, r1, #0
	bl sub_0200E024
	ldr r1, [r5, #4]
	ldr r0, [r5, #0x54]
	add r2, r1, #0
	bl sub_0200E024
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #5
	blt _02233A0C
	ldr r0, [sp]
	ldr r0, [r0, #0x2c]
	cmp r0, #0
	beq _02233AE2
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02233AE2:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02233AE8: .word 0x3D4CCCCD
	thumb_func_end ov40_022339CC

	thumb_func_start ov40_02233AEC
ov40_02233AEC: ; 0x02233AEC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	mov r6, #0x5a
	str r0, [sp]
	mov r4, #0
	add r5, r0, #0
	lsl r6, r6, #2
_02233B00:
	ldr r0, [r5, #0x2c]
	add r1, r6, #0
	add r0, #0x14
	str r0, [r5, #0x2c]
	bl _s32_div_f
	str r1, [r5, #0x2c]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #5
	blt _02233B00
	ldr r0, [sp]
	ldr r0, [r0, #0x2c]
	cmp r0, #0x14
	bne _02233B46
	mov r6, #2
	ldr r4, [sp]
	mov r5, #0
	add r7, r6, #0
_02233B26:
	ldr r0, [r4, #0x40]
	add r1, r6, #0
	bl sub_0200DF98
	ldr r0, [r4, #0x54]
	add r1, r7, #0
	bl sub_0200DF98
	ldr r0, [r4, #0x68]
	mov r1, #2
	bl sub_0200DF98
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #5
	blt _02233B26
_02233B46:
	ldr r0, [sp]
	ldr r1, [sp]
	add r0, #0xd4
	add r1, #0xd8
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	ldr r5, [sp]
	mov r6, #0
	add r4, sp, #4
_02233B5C:
	ldr r0, [sp]
	ldr r0, [r0, #0x2c]
	cmp r0, #0
	beq _02233B70
	ldr r0, [r5, #4]
	ldr r1, _02233C38 ; =0x3D4CCCCD
	bl _fsub
	str r0, [r5, #4]
	b _02233B88
_02233B70:
	ldr r0, [r5, #0x68]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r5, #0x40]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r5, #0x54]
	mov r1, #0
	bl sub_0200DCE8
_02233B88:
	ldr r0, [r5, #0x2c]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl GF_SinDeg
	ldr r1, [r5, #0x18]
	add r2, r1, #0
	mul r2, r0
	mov r0, #2
	lsl r0, r0, #0x12
	sub r7, r0, r2
	ldr r0, [r5, #0x2c]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl GF_CosDeg
	ldr r1, [r5, #0x18]
	add r2, r1, #0
	mul r2, r0
	mov r0, #0x6a
	lsl r0, r0, #0xc
	sub r2, r0, r2
	ldr r0, [r5, #0x68]
	add r1, r7, #0
	bl sub_0200DF08
	add r1, sp, #4
	ldr r0, [r5, #0x68]
	add r1, #2
	add r2, sp, #4
	bl sub_0200DE44
	mov r1, #2
	mov r2, #0
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r5, #0x40]
	sub r1, #0x20
	sub r2, r2, #2
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl sub_0200DDB8
	mov r1, #2
	mov r2, #0
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r5, #0x54]
	add r1, #0x10
	sub r2, r2, #2
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl sub_0200DDB8
	ldr r1, [r5, #4]
	ldr r0, [r5, #0x68]
	add r2, r1, #0
	bl sub_0200E024
	ldr r1, [r5, #4]
	ldr r0, [r5, #0x40]
	add r2, r1, #0
	bl sub_0200E024
	ldr r1, [r5, #4]
	ldr r0, [r5, #0x54]
	add r2, r1, #0
	bl sub_0200E024
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #5
	blt _02233B5C
	ldr r0, [sp]
	ldr r0, [r0, #0x2c]
	cmp r0, #0
	beq _02233C30
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02233C30:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02233C38: .word 0x3D4CCCCD
	thumb_func_end ov40_02233AEC

	thumb_func_start ov40_02233C3C
ov40_02233C3C: ; 0x02233C3C
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r4, _02233CA8 ; =_02245CC0
	ldr r5, [r0, r1]
	mov r7, #0
	add r6, sp, #0
_02233C4A:
	mov r1, #0
	mov r2, #2
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r5, #0x68]
	lsl r1, r1, #0xc
	lsl r2, r2, #0xc
	bl sub_0200DF08
	add r1, sp, #0
	ldr r0, [r5, #0x68]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	mov r1, #2
	mov r2, #0
	ldrsh r1, [r6, r1]
	ldrsh r2, [r6, r2]
	ldr r0, [r5, #0x40]
	sub r1, #0x20
	sub r2, r2, #2
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl sub_0200DDB8
	mov r1, #2
	mov r2, #0
	ldrsh r1, [r6, r1]
	ldrsh r2, [r6, r2]
	ldr r0, [r5, #0x54]
	add r1, #0x10
	sub r2, r2, #2
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl sub_0200DDB8
	add r7, r7, #1
	add r4, r4, #4
	add r5, r5, #4
	cmp r7, #5
	blt _02233C4A
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02233CA8: .word _02245CC0
	thumb_func_end ov40_02233C3C

	thumb_func_start ov40_02233CAC
ov40_02233CAC: ; 0x02233CAC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _02233D4E
	mov r0, #0x6d
	mov r1, #0xdc
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0xdc
	add r5, r0, #0
	bl MI_CpuFill8
	mov r0, #0x86
	lsl r0, r0, #4
	str r5, [r4, r0]
	mov r0, #0
	str r0, [r5]
	add r1, r5, #0
	add r2, r0, #0
	mov r7, #0x40
	mov r6, #0x34
_02233CDC:
	sub r3, r0, #2
	cmp r3, #1
	bhi _02233CE6
	str r6, [r1, #0x18]
	b _02233CE8
_02233CE6:
	str r7, [r1, #0x18]
_02233CE8:
	ldr r3, _02233EE0 ; =0x3E4CCCCD
	str r2, [r1, #0x2c]
	str r3, [r1, #4]
	add r0, r0, #1
	add r1, r1, #4
	add r2, #0x48
	cmp r0, #5
	blt _02233CDC
	ldr r0, [r4, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0xd4
	add r1, #0xd8
	mov r2, #0
	bl ov40_0222D9E8
	mov r0, #4
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r2, #0
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0xd4
	add r1, #0xd8
	add r3, r2, #0
	str r2, [sp, #8]
	bl ov40_0222D980
	ldr r0, _02233EE4 ; =0x00000579
	bl PlaySE
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233D54
_02233D4E:
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r5, [r4, r0]
_02233D54:
	ldr r0, [r4, #8]
	cmp r0, #4
	bls _02233D5C
	b _02233ED0
_02233D5C:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02233D68: ; jump table
	.short _02233ED0 - _02233D68 - 2 ; case 0
	.short _02233D72 - _02233D68 - 2 ; case 1
	.short _02233DE6 - _02233D68 - 2 ; case 2
	.short _02233E42 - _02233D68 - 2 ; case 3
	.short _02233E86 - _02233D68 - 2 ; case 4
_02233D72:
	add r0, r5, #0
	mov r1, #1
	bl ov40_0222DA84
	cmp r0, #0
	beq _02233D9C
	mov r0, #0x83
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl Save_FrontierData_get
	mov r1, #0
	add r2, r1, #0
	bl FrontierData_BattlePointAction
	add r1, r5, #0
	add r1, #0x90
	str r0, [r1]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_02233D9C:
	ldr r0, [r4, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r4, #0x58]
	mov r1, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #2
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02233ED8
_02233DE6:
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r4, #0
	bl ov40_0222D874
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	add r0, r4, #0
	mov r1, #0
	bl ov40_0222FB90
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_020879E0
	bl ov40_02230738
	mov r0, #6
	mov r1, #2
	bl SetBgPriority
	add r0, r4, #0
	bl ov40_02233238
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0x1c
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233ED8
_02233E42:
	add r0, r4, #0
	bl ov40_0222FBB4
	cmp r0, #0
	beq _02233ED8
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r4, #0
	bl ov40_0223316C
	add r0, r4, #0
	bl ov40_022335F4
	add r0, r4, #0
	bl ov40_02233550
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	mov r0, #8
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233ED8
_02233E86:
	add r0, r4, #0
	bl ov40_022339CC
	add r6, r0, #0
	add r0, r5, #0
	add r1, r5, #0
	mov r2, #0
	add r0, #0xd4
	add r1, #0xd8
	add r3, r2, #0
	bl ov40_0222DA00
	add r0, r5, #0
	mov r1, #0
	bl ov40_0222DA84
	cmp r6, #0
	bne _02233EB6
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	add r0, r4, #0
	bl ov40_02233C3C
_02233EB6:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0x1c
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02233ED8
_02233ED0:
	add r0, r4, #0
	mov r1, #1
	bl ov40_0222BF80
_02233ED8:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02233EE0: .word 0x3E4CCCCD
_02233EE4: .word 0x00000579
	thumb_func_end ov40_02233CAC

	thumb_func_start ov40_02233EE8
ov40_02233EE8: ; 0x02233EE8
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	add r0, sp, #4
	add r1, sp, #0
	bl sub_02025380
	cmp r0, #0
	beq _02233F1C
	ldr r0, [sp, #4]
	cmp r0, #0x50
	bls _02233F1C
	cmp r0, #0xb0
	bhs _02233F1C
	ldr r0, [sp]
	cmp r0, #0x98
	bls _02233F1C
	cmp r0, #0xb0
	bhs _02233F1C
	ldr r0, _02233F24 ; =0x0000057B
	bl PlaySE
	add r0, r4, #0
	mov r1, #2
	bl ov40_0222BF80
_02233F1C:
	mov r0, #0
	add sp, #8
	pop {r4, pc}
	nop
_02233F24: .word 0x0000057B
	thumb_func_end ov40_02233EE8

	thumb_func_start ov40_02233F28
ov40_02233F28: ; 0x02233F28
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r5, [r4, r0]
	ldr r0, [r4, #8]
	cmp r0, #4
	bls _02233F3A
	b _0223409E
_02233F3A:
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02233F46: ; jump table
	.short _02233F50 - _02233F46 - 2 ; case 0
	.short _02233FAE - _02233F46 - 2 ; case 1
	.short _02233FB2 - _02233F46 - 2 ; case 2
	.short _02233FFA - _02233F46 - 2 ; case 3
	.short _0223403E - _02233F46 - 2 ; case 4
_02233F50:
	ldr r0, [r5]
	cmp r0, #0
	bne _02233F5C
	ldr r0, _0223413C ; =0x0000057A
	bl PlaySE
_02233F5C:
	ldr r0, [r5]
	cmp r0, #0x10
	beq _02233F66
	add r0, r0, #2
	str r0, [r5]
_02233F66:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0x1c
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r4, #0x58]
	ldr r2, _02234140 ; =0x00004018
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r1, #1
	lsr r3, r3, #0x18
	bl sub_02003EA4
	add r0, r4, #0
	bl ov40_02233AEC
	cmp r0, #0
	beq _02233FA2
	b _02234136
_02233FA2:
	mov r0, #0
	str r0, [r5]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02234136
_02233FAE:
	add r0, r0, #1
	str r0, [r4, #8]
_02233FB2:
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r4, #0
	bl ov40_022338D0
	add r0, r4, #0
	bl ov40_0223320C
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	mov r0, #8
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #0
	str r0, [r5]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02234136
_02233FFA:
	mov r0, #1
	bl ov40_0222BC44
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r4, #0
	bl ov40_0222D88C
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, [r4, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02234136
_0223403E:
	ldr r1, [r5]
	cmp r1, #0
	beq _0223404A
	sub r0, r1, #2
	str r0, [r5]
	b _02234136
_0223404A:
	add r0, r0, #1
	str r0, [r4, #8]
	add r0, r5, #0
	bl ov40_0222DAA8
	ldr r0, [r4, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0x1c
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r4, #0x58]
	mov r1, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #2
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02234136
_0223409E:
	add r0, r5, #0
	mov r1, #0
	bl ov40_0222DA84
	cmp r0, #0
	beq _02234106
	mov r0, #8
	str r0, [sp]
	ldr r0, _02234144 ; =0x04000050
	mov r1, #4
	mov r2, #0x12
	mov r3, #7
	bl G2x_SetBlendAlpha_
	mov r0, #8
	str r0, [sp]
	ldr r0, _02234148 ; =0x04001050
	mov r1, #4
	mov r2, #0x12
	mov r3, #7
	bl G2x_SetBlendAlpha_
	add r0, r5, #0
	bl FreeToHeap
	add r0, r4, #0
	bl ov40_0222DD08
	add r0, r5, #0
	bl ov40_0222DAA8
	ldr r0, [r4, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r4, #0x28]
	mov r2, #0xc
	mov r3, #0x10
	bl sub_02003EA4
	mov r1, #1
	ldr r3, [r4, #0x10]
	add r0, r4, #0
	add r2, r1, #0
	bl ov40_0222BF64
	add r0, r4, #0
	mov r1, #5
	bl ov40_0222BF80
	b _02234136
_02234106:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r4, #0x58]
	mov r1, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #2
	lsr r3, r3, #0x18
	bl sub_02003EA4
_02234136:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0223413C: .word 0x0000057A
_02234140: .word 0x00004018
_02234144: .word 0x04000050
_02234148: .word 0x04001050
	thumb_func_end ov40_02233F28

	thumb_func_start ov40_0223414C
ov40_0223414C: ; 0x0223414C
	push {r3, r4, r5, lr}
	mov r1, #0xba
	add r5, r0, #0
	mov r0, #0x6d
	lsl r1, r1, #2
	bl AllocFromHeap
	mov r2, #0xba
	mov r1, #0
	lsl r2, r2, #2
	add r4, r0, #0
	bl memset
	mov r0, #0x86
	lsl r0, r0, #4
	str r4, [r5, r0]
	ldr r0, _022341DC ; =FS_OVERLAY_ID(OVY_41)
	mov r1, #2
	bl HandleLoadOverlay
	mov r1, #0x86
	ldr r0, [r5, #0x24]
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r2, #0x48
	add r0, r1, #4
	str r2, [r4, r0]
	add r0, r1, #0
	mov r2, #0x10
	add r0, #8
	str r2, [r4, r0]
	mov r0, #0x6d
	add r1, #0xc
	str r0, [r4, r1]
	bl sub_0202B998
	mov r1, #0x8e
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0x6d
	bl sub_020314A4
	mov r1, #0x25
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r5, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	add r1, r4, #4
	mov r2, #0
	bl ov40_0222D9E8
	add r0, r5, #0
	mov r1, #1
	bl ov40_0222BF80
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022341DC: .word FS_OVERLAY_ID(OVY_41)
	thumb_func_end ov40_0223414C

	thumb_func_start ov40_022341E0
ov40_022341E0: ; 0x022341E0
	push {r3, r4, r5, lr}
	sub sp, #0x10
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _022341FC
	cmp r1, #1
	beq _0223425A
	cmp r1, #2
	beq _022342AE
	b _022342C4
_022341FC:
	add r0, r4, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	cmp r0, #0
	beq _02234210
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_02234210:
	ldr r0, [r5, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r5, #0x58]
	mov r1, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #2
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02234328
_0223425A:
	mov r0, #0
	add r1, r0, #0
	bl SetBgPriority
	mov r0, #2
	mov r1, #0
	bl SetBgPriority
	mov r0, #1
	mov r1, #3
	bl SetBgPriority
	mov r0, #3
	mov r1, #2
	bl SetBgPriority
	mov r0, #4
	mov r1, #0
	bl SetBgPriority
	mov r0, #6
	mov r1, #1
	bl SetBgPriority
	mov r0, #5
	mov r1, #3
	bl SetBgPriority
	mov r0, #7
	mov r1, #2
	bl SetBgPriority
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_020879E0
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02234328
_022342AE:
	mov r1, #0
	bl ov40_0222FB90
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02234328
_022342C4:
	bl ov40_0222FBB4
	cmp r0, #0
	beq _02234328
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r5, #0
	bl ov40_0222D874
	add r0, r5, #0
	bl ov40_02235A30
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #0x24]
	mov r1, #0x3e
	mov r3, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #0x24]
	mov r1, #0x3e
	mov r3, #7
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	add r0, r5, #0
	mov r1, #2
	bl ov40_0222BF80
_02234328:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_022341E0

	thumb_func_start ov40_02234330
ov40_02234330: ; 0x02234330
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _0223434A
	cmp r1, #1
	beq _022343DA
	cmp r1, #2
	beq _022343F0
	b _02234440
_0223434A:
	bl ov40_02235940
	add r0, r5, #0
	mov r1, #0x23
	mov r2, #3
	bl ov40_022307DC
	add r0, r5, #0
	mov r1, #0x25
	mov r2, #7
	bl ov40_022307DC
	mov r0, #8
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	mov r0, #0x83
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl Save_DressupData_get
	mov r1, #0
	bl sub_0202B9B8
	mov r1, #0x8b
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r0, r1, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _022343B2
	add r0, r1, #0
	sub r0, #0x14
	ldr r1, [r4, r1]
	add r0, r4, r0
	bl ov41_0224B530
	mov r1, #0x8a
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #1
	bl ov41_0224B5D0
_022343B2:
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #1
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, _0223446C ; =ov40_02235900
	add r1, r5, #0
	bl Main_SetVBlankIntrCB
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02234446
_022343DA:
	mov r1, #0
	mov r3, #2
	ldr r0, [r5, #0x28]
	add r2, r1, #0
	lsl r3, r3, #8
	bl sub_020032A4
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02234446
_022343F0:
	add r0, r4, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	mov r2, #0
	add r0, r4, #0
	add r1, r4, #4
	add r3, r2, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _02234426
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	add r0, r5, #0
	bl ov40_02235B4C
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_02234426:
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02234446
_02234440:
	mov r1, #3
	bl ov40_0222BF80
_02234446:
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02234466
	bl sub_02026E48
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov41_0224B554
	mov r0, #0
	add r1, r0, #0
	bl sub_02026E50
_02234466:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0223446C: .word ov40_02235900
	thumb_func_end ov40_02234330

	thumb_func_start ov40_02234470
ov40_02234470: ; 0x02234470
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	ldr r0, _022344D0 ; =ov40_022451C8
	bl sub_02025320
	cmp r0, #0
	beq _02234492
	add r0, r5, #0
	bl ov40_02230944
	add r0, r5, #0
	mov r1, #5
	bl ov40_0222BF80
_02234492:
	ldr r0, _022344D4 ; =ov40_022451CC
	bl sub_02025320
	cmp r0, #0
	beq _022344AA
	add r0, r5, #0
	bl ov40_02230944
	add r0, r5, #0
	mov r1, #4
	bl ov40_0222BF80
_022344AA:
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _022344CA
	bl sub_02026E48
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov41_0224B554
	mov r0, #0
	add r1, r0, #0
	bl sub_02026E50
_022344CA:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_022344D0: .word ov40_022451C8
_022344D4: .word ov40_022451CC
	thumb_func_end ov40_02234470

	thumb_func_start ov40_022344D8
ov40_022344D8: ; 0x022344D8
	push {r3, r4, r5, lr}
	sub sp, #8
	mov r1, #0x86
	add r4, r0, #0
	lsl r1, r1, #4
	ldr r5, [r4, r1]
	bl ov40_0223D5CC
	cmp r0, #0
	bne _022344F2
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, pc}
_022344F2:
	ldr r0, [r4, #8]
	cmp r0, #6
	bls _022344FA
	b _0223473E
_022344FA:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02234506: ; jump table
	.short _02234514 - _02234506 - 2 ; case 0
	.short _02234586 - _02234506 - 2 ; case 1
	.short _022345FA - _02234506 - 2 ; case 2
	.short _02234652 - _02234506 - 2 ; case 3
	.short _0223467E - _02234506 - 2 ; case 4
	.short _022346CE - _02234506 - 2 ; case 5
	.short _022346F0 - _02234506 - 2 ; case 6
_02234514:
	mov r0, #0
	mov r1, #1
	bl SetBgPriority
	mov r0, #1
	mov r1, #3
	bl SetBgPriority
	mov r0, #2
	add r1, r0, #0
	bl SetBgPriority
	mov r0, #3
	mov r1, #1
	bl SetBgPriority
	mov r0, #4
	mov r1, #1
	bl SetBgPriority
	mov r0, #5
	mov r1, #3
	bl SetBgPriority
	mov r0, #6
	mov r1, #2
	bl SetBgPriority
	mov r0, #7
	mov r1, #1
	bl SetBgPriority
	mov r0, #0x8e
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl FreeToHeap
	mov r0, #0x25
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_020314BC
	ldr r0, [r4, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	bl ov40_02236130
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022347F2
_02234586:
	add r0, r5, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _022345E0
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r4, #0
	bl ov40_02235B10
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, [r4, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	mov r2, #0
	ldr r0, [r4, #0x24]
	mov r1, #2
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	mov r0, #2
	mov r1, #0
	bl SetBgPriority
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_022345E0:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _022347F2
_022345FA:
	mov r1, #0x6f
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	add r0, r4, #0
	mov r2, #0x80
	mov r3, #0x60
	bl ov40_0223077C
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	mov r1, #0x18
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl sub_02087A08
	ldr r1, _022347F8 ; =0x0000011E
	add r0, r4, #0
	bl ov40_0222DED0
	mov r0, #0x6d
	bl sub_020314A4
	mov r1, #0xb7
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	mov r1, #0x83
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	bl sub_020314C4
	ldr r0, _022347FC ; =0x0000057D
	bl PlaySE
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022347F2
_02234652:
	add r0, r4, #0
	bl ov40_0223D540
	mov r2, #0xb7
	lsl r2, r2, #2
	ldr r1, [r5, r2]
	sub r2, #0xb0
	ldr r2, [r5, r2]
	bl ov39_022273B0
	cmp r0, #1
	beq _0223466C
	b _022347F2
_0223466C:
	mov r0, #0xb7
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_020314BC
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022347F2
_0223467E:
	add r0, r4, #0
	bl ov40_0222DFB0
	add r0, r4, #0
	bl ov40_0223D540
	add r1, sp, #4
	bl ov39_02227D44
	cmp r0, #1
	ldr r0, _022347FC ; =0x0000057D
	bne _022346B2
	mov r1, #0
	bl StopSE
	ldr r3, [sp, #4]
	add r0, r4, #0
	ldr r2, [r3, #0xc]
	ldr r3, [r3, #4]
	mov r1, #0
	bl ov40_02230CDC
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022347F2
_022346B2:
	mov r1, #0
	bl StopSE
	add r0, r4, #0
	mov r1, #0x24
	bl ov40_0222FB28
	ldr r0, _02234800 ; =0x00000577
	bl PlaySE
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022347F2
_022346CE:
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	mov r1, #0
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl sub_02087A08
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022347F2
_022346F0:
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	add r5, #8
	add r0, r5, #0
	bl ov40_0222DAA8
	add r0, r4, #0
	bl ov40_0222D88C
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, [r4, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #1
	bl ov40_0222FB90
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022347F2
_0223473E:
	add r0, r4, #0
	bl ov40_0222FBB4
	cmp r0, #0
	beq _022347F2
	add r0, r5, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	cmp r0, #0
	beq _022347C2
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02234776
	bl ov41_0224B57C
	add r0, r4, #0
	bl ov40_0222BC54
	mov r0, #2
	mov r1, #0
	bl SetBgPriority
	bl ov40_02235994
_02234776:
	add r0, r4, #0
	bl ov40_0222DD08
	add r0, r5, #0
	add r0, #8
	bl ov40_0222DAA8
	ldr r0, [r4, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r4, #0x28]
	mov r2, #0xc
	mov r3, #0x10
	bl sub_02003EA4
	mov r1, #1
	ldr r3, [r4, #0x10]
	add r0, r4, #0
	add r2, r1, #0
	bl ov40_0222BF64
	add r0, r4, #0
	mov r1, #5
	bl ov40_0222BF80
	add r0, r5, #0
	bl FreeToHeap
	ldr r0, _02234804 ; =FS_OVERLAY_ID(OVY_41)
	bl UnloadOverlayByID
	ldr r0, _02234808 ; =ov40_0222BD04
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	b _022347F2
_022347C2:
	ldr r0, [r4, #0x58]
	mov r1, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #2
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
_022347F2:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022347F8: .word 0x0000011E
_022347FC: .word 0x0000057D
_02234800: .word 0x00000577
_02234804: .word FS_OVERLAY_ID(OVY_41)
_02234808: .word ov40_0222BD04
	thumb_func_end ov40_022344D8

	thumb_func_start ov40_0223480C
ov40_0223480C: ; 0x0223480C
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _02234826
	cmp r1, #1
	beq _02234898
	cmp r1, #2
	beq _022348F8
	b _02234946
_02234826:
	mov r0, #0
	mov r1, #1
	bl SetBgPriority
	mov r0, #1
	mov r1, #3
	bl SetBgPriority
	mov r0, #2
	add r1, r0, #0
	bl SetBgPriority
	mov r0, #3
	mov r1, #1
	bl SetBgPriority
	mov r0, #4
	mov r1, #1
	bl SetBgPriority
	mov r0, #5
	mov r1, #3
	bl SetBgPriority
	mov r0, #6
	mov r1, #2
	bl SetBgPriority
	mov r0, #7
	mov r1, #1
	bl SetBgPriority
	mov r0, #0x8e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0x25
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_020314BC
	ldr r0, [r5, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	add r0, r5, #0
	bl ov40_02236130
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02234A08
_02234898:
	add r0, r4, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r4, #0
	add r1, r4, #4
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _022348DE
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r5, #0
	bl ov40_02235B10
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, [r5, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_022348DE:
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02234A08
_022348F8:
	add r4, #8
	add r0, r4, #0
	bl ov40_0222DAA8
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r5, #0
	bl ov40_0222D88C
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, [r5, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	add r0, r5, #0
	mov r1, #1
	bl ov40_0222FB90
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02234A08
_02234946:
	bl ov40_0222FBB4
	cmp r0, #0
	beq _02234A08
	add r0, r4, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	cmp r0, #0
	beq _022349D8
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02234984
	bl ov41_0224B57C
	add r0, r5, #0
	bl ov40_0222BC54
	mov r0, #2
	mov r1, #0
	bl SetBgPriority
	bl ov40_02235994
_02234984:
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	add r0, r5, #0
	bl ov40_0222DD08
	add r0, r4, #0
	add r0, #8
	bl ov40_0222DAA8
	ldr r0, [r5, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r5, #0x28]
	mov r2, #0xc
	mov r3, #0x10
	bl sub_02003EA4
	mov r1, #1
	ldr r3, [r5, #0x10]
	add r0, r5, #0
	add r2, r1, #0
	bl ov40_0222BF64
	add r0, r5, #0
	mov r1, #5
	bl ov40_0222BF80
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, _02234A0C ; =FS_OVERLAY_ID(OVY_41)
	bl UnloadOverlayByID
	ldr r0, _02234A10 ; =ov40_0222BD04
	add r1, r5, #0
	bl Main_SetVBlankIntrCB
	b _02234A08
_022349D8:
	ldr r0, [r5, #0x58]
	mov r1, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #2
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
_02234A08:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02234A0C: .word FS_OVERLAY_ID(OVY_41)
_02234A10: .word ov40_0222BD04
	thumb_func_end ov40_0223480C

	thumb_func_start ov40_02234A14
ov40_02234A14: ; 0x02234A14
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	bne _02234A2C
	mov r1, #1
	bl ov40_022359B4
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02234A32
_02234A2C:
	mov r1, #3
	bl ov40_0222BF80
_02234A32:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov40_02234A14

	thumb_func_start ov40_02234A38
ov40_02234A38: ; 0x02234A38
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r4, r0, #0
	lsl r1, r1, #4
	ldr r5, [r4, r1]
	ldr r1, [r4, #8]
	cmp r1, #4
	bls _02234A4A
	b _02234B90
_02234A4A:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02234A56: ; jump table
	.short _02234A60 - _02234A56 - 2 ; case 0
	.short _02234AA6 - _02234A56 - 2 ; case 1
	.short _02234AEE - _02234A56 - 2 ; case 2
	.short _02234B1A - _02234A56 - 2 ; case 3
	.short _02234B34 - _02234A56 - 2 ; case 4
_02234A60:
	mov r1, #0x3c
	mov r2, #7
	bl ov40_022307DC
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #0x6d
	str r0, [sp]
	ldr r0, _02234BB0 ; =ov40_02245708
	ldr r2, _02234BB4 ; =ov40_02235FD0
	mov r1, #9
	add r3, r4, #0
	bl sub_02026C44
	mov r1, #0x1d
	lsl r1, r1, #4
	str r0, [r5, r1]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02234BAC
_02234AA6:
	add r0, r5, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	mov r2, #0
	add r0, r5, #0
	add r1, r5, #4
	add r3, r2, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _02234AD4
	add r0, r4, #0
	mov r1, #0x72
	bl ov40_0222DED0
	add r0, r4, #0
	bl ov40_02235FFC
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_02234AD4:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02234BAC
_02234AEE:
	mov r0, #0x1d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_02026CC4
	ldr r0, _02234BB8 ; =ov40_022451C4
	bl sub_02025320
	cmp r0, #0
	bne _02234B0C
	mov r0, #0x79
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #1
	bne _02234BAC
_02234B0C:
	add r0, r4, #0
	bl ov40_02230944
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02234BAC
_02234B1A:
	bl ov40_0223610C
	mov r0, #0x1d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_02026CAC
	add r0, r4, #0
	bl ov40_0222DFB0
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_02234B34:
	mov r0, #0x79
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #1
	bne _02234B56
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #1
	mov r3, #2
	bl ov40_0222DA00
	cmp r0, #0
	beq _02234BAC
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02234BAC
_02234B56:
	add r0, r5, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #1
	mov r3, #2
	bl ov40_0222DA00
	cmp r0, #0
	beq _02234B76
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_02234B76:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02234BAC
_02234B90:
	mov r0, #0x79
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #1
	bne _02234BA4
	add r0, r4, #0
	mov r1, #4
	bl ov40_0222BF80
	b _02234BAC
_02234BA4:
	add r0, r4, #0
	mov r1, #5
	bl ov40_0222BF80
_02234BAC:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02234BB0: .word ov40_02245708
_02234BB4: .word ov40_02235FD0
_02234BB8: .word ov40_022451C4
	thumb_func_end ov40_02234A38

	thumb_func_start ov40_02234BBC
ov40_02234BBC: ; 0x02234BBC
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	mov r1, #0x86
	add r4, r0, #0
	lsl r1, r1, #4
	ldr r5, [r4, r1]
	ldr r1, [r4, #8]
	cmp r1, #4
	bls _02234BD0
	b _02234D5A
_02234BD0:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02234BDC: ; jump table
	.short _02234BE6 - _02234BDC - 2 ; case 0
	.short _02234BFE - _02234BDC - 2 ; case 1
	.short _02234CA0 - _02234BDC - 2 ; case 2
	.short _02234CEC - _02234BDC - 2 ; case 3
	.short _02234D20 - _02234BDC - 2 ; case 4
_02234BE6:
	mov r1, #1
	bl ov40_022359B4
	add r0, r4, #0
	mov r1, #0x3a
	mov r2, #7
	bl ov40_022307DC
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02234D7C
_02234BFE:
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #0
	mov r3, #2
	bl ov40_0222DA00
	cmp r0, #0
	bne _02234C10
	b _02234D7C
_02234C10:
	add r0, r4, #0
	mov r1, #0x72
	bl ov40_0222DED0
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	ldr r0, _02234D84 ; =0x0000047C
	add r1, r4, #0
	add r0, r4, r0
	bl ov40_0222F9D4
	mov r0, #0x7b
	lsl r0, r0, #2
	ldr r3, _02234D88 ; =ov40_022451F4
	add r2, r5, r0
	mov r6, #5
_02234C34:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r6, r6, #1
	bne _02234C34
	ldr r0, [r3]
	mov r1, #0x7a
	lsl r1, r1, #2
	str r0, [r2]
	ldr r2, [r5, r1]
	add r0, r1, #4
	str r2, [r5, r0]
	add r0, r1, #0
	sub r0, #0x14
	ldr r0, [r5, r0]
	add r1, #8
	str r0, [r5, r1]
	ldr r0, _02234D8C ; =0x0000049C
	add r0, r4, r0
	bl ov40_0222F734
	mov r3, #0x1e
	ldr r0, _02234D8C ; =0x0000049C
	lsl r3, r3, #4
	ldr r2, [r5, r3]
	add r3, #0xc
	add r0, r4, r0
	add r1, r4, #0
	add r3, r5, r3
	bl ov40_0222E9B8
	ldr r1, _02234D84 ; =0x0000047C
	add r0, r4, r1
	add r1, #0x20
	add r1, r4, r1
	bl ov40_0222FA5C
	ldr r0, _02234D8C ; =0x0000049C
	add r1, r4, #0
	add r0, r4, r0
	mov r2, #2
	bl ov40_0222F740
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	mov r0, #0x2e
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r5, r0]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02234D7C
_02234CA0:
	ldr r0, _02234D84 ; =0x0000047C
	add r0, r4, r0
	bl ov40_0222FA88
	ldr r1, _02234D8C ; =0x0000049C
	add r0, r4, r1
	sub r1, #0x10
	ldrsh r1, [r4, r1]
	bl ov40_0222F6D0
	ldr r0, _02234D8C ; =0x0000049C
	add r1, r4, #0
	add r0, r4, r0
	bl ov40_0222F38C
	cmp r0, #0
	beq _02234CD4
	mov r1, #0x2e
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r4, #0
	bl ov40_02230944
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_02234CD4:
	ldr r0, _02234D90 ; =ov40_022451C4
	bl sub_02025320
	cmp r0, #0
	beq _02234D7C
	add r0, r4, #0
	bl ov40_02230944
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02234D7C
_02234CEC:
	bl ov40_0222DFB0
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	ldr r0, _02234D84 ; =0x0000047C
	add r0, r4, r0
	bl ov40_0222FA24
	ldr r0, _02234D8C ; =0x0000049C
	add r0, r4, r0
	bl ov40_0222F720
	ldr r0, _02234D8C ; =0x0000049C
	add r1, r4, #0
	add r0, r4, r0
	bl ov40_0222F920
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_02234D20:
	add r0, r5, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _02234D40
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_02234D40:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02234D7C
_02234D5A:
	add r0, r4, #0
	bl ov40_02235FA0
	mov r0, #0x2e
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02234D74
	add r0, r4, #0
	mov r1, #6
	bl ov40_0222BF80
	b _02234D7C
_02234D74:
	add r0, r4, #0
	mov r1, #3
	bl ov40_0222BF80
_02234D7C:
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_02234D84: .word 0x0000047C
_02234D88: .word ov40_022451F4
_02234D8C: .word 0x0000049C
_02234D90: .word ov40_022451C4
	thumb_func_end ov40_02234BBC

	thumb_func_start ov40_02234D94
ov40_02234D94: ; 0x02234D94
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _02234DAE
	cmp r1, #1
	beq _02234E1A
	cmp r1, #2
	beq _02234E7A
	b _02234EC8
_02234DAE:
	mov r0, #0
	mov r1, #1
	bl SetBgPriority
	mov r0, #1
	mov r1, #3
	bl SetBgPriority
	mov r0, #2
	add r1, r0, #0
	bl SetBgPriority
	mov r0, #3
	mov r1, #1
	bl SetBgPriority
	mov r0, #4
	mov r1, #1
	bl SetBgPriority
	mov r0, #5
	mov r1, #3
	bl SetBgPriority
	mov r0, #6
	mov r1, #2
	bl SetBgPriority
	mov r0, #7
	mov r1, #1
	bl SetBgPriority
	mov r0, #0x8e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0x25
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_020314BC
	ldr r0, [r5, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02234F8A
_02234E1A:
	add r0, r4, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r4, #0
	add r1, r4, #4
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _02234E60
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r5, #0
	bl ov40_02235B10
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, [r5, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_02234E60:
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02234F8A
_02234E7A:
	add r4, #8
	add r0, r4, #0
	bl ov40_0222DAA8
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r5, #0
	bl ov40_0222D88C
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, [r5, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	add r0, r5, #0
	mov r1, #1
	bl ov40_0222FB90
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02234F8A
_02234EC8:
	bl ov40_0222FBB4
	cmp r0, #0
	beq _02234F8A
	add r0, r4, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	cmp r0, #0
	beq _02234F5A
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02234F06
	bl ov41_0224B57C
	add r0, r5, #0
	bl ov40_0222BC54
	mov r0, #2
	mov r1, #0
	bl SetBgPriority
	bl ov40_02235994
_02234F06:
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	add r0, r5, #0
	bl ov40_0222DD08
	add r0, r4, #0
	add r0, #8
	bl ov40_0222DAA8
	ldr r0, [r5, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r5, #0x28]
	mov r2, #0xc
	mov r3, #0x10
	bl sub_02003EA4
	mov r1, #1
	ldr r3, [r5, #0x10]
	add r0, r5, #0
	add r2, r1, #0
	bl ov40_0222BF64
	add r0, r5, #0
	mov r1, #5
	bl ov40_0222BF80
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, _02234F90 ; =FS_OVERLAY_ID(OVY_41)
	bl UnloadOverlayByID
	ldr r0, _02234F94 ; =ov40_0222BD04
	add r1, r5, #0
	bl Main_SetVBlankIntrCB
	b _02234F8A
_02234F5A:
	ldr r0, [r5, #0x58]
	mov r1, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #2
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
_02234F8A:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_02234F90: .word FS_OVERLAY_ID(OVY_41)
_02234F94: .word ov40_0222BD04
	thumb_func_end ov40_02234D94

	thumb_func_start ov40_02234F98
ov40_02234F98: ; 0x02234F98
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r4, r0, #0
	lsl r1, r1, #4
	ldr r5, [r4, r1]
	bl ov40_0223D5CC
	cmp r0, #0
	bne _02234FAE
	mov r0, #0
	pop {r3, r4, r5, pc}
_02234FAE:
	ldr r0, [r4, #8]
	cmp r0, #4
	bls _02234FB6
	b _022350F4
_02234FB6:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02234FC2: ; jump table
	.short _02234FCC - _02234FC2 - 2 ; case 0
	.short _0223500C - _02234FC2 - 2 ; case 1
	.short _02235028 - _02234FC2 - 2 ; case 2
	.short _02235086 - _02234FC2 - 2 ; case 3
	.short _022350C0 - _02234FC2 - 2 ; case 4
_02234FCC:
	mov r1, #0x6f
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	add r0, r4, #0
	mov r2, #0x80
	mov r3, #0x60
	bl ov40_0223077C
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	mov r1, #0x18
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl sub_02087A08
	ldr r1, _0223511C ; =0x0000011F
	add r0, r4, #0
	bl ov40_0222DED0
	ldr r0, _02235120 ; =0x0000057D
	bl PlaySE
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02235118
_0223500C:
	add r0, r4, #0
	bl ov40_0223D540
	mov r1, #0x2e
	lsl r1, r1, #4
	ldr r1, [r5, r1]
	bl ov39_022273F8
	cmp r0, #1
	bne _02235118
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02235118
_02235028:
	add r0, r4, #0
	bl ov40_0222DFB0
	add r0, r4, #0
	bl ov40_0223D540
	add r1, sp, #0
	bl ov39_02227D44
	cmp r0, #1
	ldr r0, _02235120 ; =0x0000057D
	bne _02235072
	mov r1, #0
	bl StopSE
	ldr r3, [sp]
	add r0, r4, #0
	ldr r2, [r3, #0xc]
	ldr r3, [r3, #4]
	mov r1, #1
	bl ov40_02230CDC
	mov r0, #0xb9
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r0, #0x6f
	str r1, [r4, #0xc]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_020879E0
	add r0, r4, #0
	mov r1, #3
	bl ov40_0222BF80
	b _02235118
_02235072:
	mov r1, #0
	bl StopSE
	ldr r0, _02235124 ; =0x00000577
	bl PlaySE
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02235118
_02235086:
	mov r0, #1
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	mov r1, #0
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl sub_02087A08
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02235118
_022350C0:
	mov r1, #0xb9
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	cmp r0, #0
	beq _022350E0
	add r0, r1, #0
	mov r2, #0
	sub r0, #0xb0
	str r2, [r5, r0]
	sub r1, #0xb4
	str r2, [r5, r1]
	add r0, r4, #0
	mov r1, #7
	bl ov40_0222BF80
	b _02235118
_022350E0:
	ldr r1, _02235128 ; =0x00000125
	add r0, r4, #0
	bl ov40_0222DED0
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	mov r0, #0
	str r0, [r4, #0xc]
	b _02235118
_022350F4:
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	cmp r0, #0x3c
	bge _02235106
	bl System_GetTouchNew
	cmp r0, #1
	bne _02235118
_02235106:
	mov r0, #0
	str r0, [r4, #0xc]
	add r0, r4, #0
	bl ov40_0222DFB0
	add r0, r4, #0
	mov r1, #3
	bl ov40_0222BF80
_02235118:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223511C: .word 0x0000011F
_02235120: .word 0x0000057D
_02235124: .word 0x00000577
_02235128: .word 0x00000125
	thumb_func_end ov40_02234F98

	thumb_func_start ov40_0223512C
ov40_0223512C: ; 0x0223512C
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _02235146
	cmp r1, #1
	beq _022351D0
	cmp r1, #2
	beq _022351E6
	b _0223524E
_02235146:
	mov r1, #0x8d
	mov r0, #0
	lsl r1, r1, #2
	str r0, [r4, #0xc]
	ldr r0, [r4, r1]
	lsl r0, r0, #2
	add r2, r4, r0
	add r0, r1, #0
	add r0, #8
	ldr r0, [r2, r0]
	add r1, r1, #4
	ldr r1, [r4, r1]
	add r0, #0x80
	bl ov39_02227080
	mov r1, #0x86
	lsl r1, r1, #2
	add r0, r4, r1
	add r1, #0x20
	ldr r1, [r4, r1]
	bl ov41_0224B530
	mov r1, #0x8a
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #0
	bl ov41_0224B5D0
	bl ov40_02235940
	add r0, r5, #0
	mov r1, #0x23
	mov r2, #3
	bl ov40_022307DC
	add r0, r5, #0
	mov r1, #0x24
	mov r2, #7
	bl ov40_022307DC
	mov r0, #8
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #1
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, _02235278 ; =ov40_02235900
	add r1, r5, #0
	bl Main_SetVBlankIntrCB
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02235254
_022351D0:
	mov r1, #0
	mov r3, #2
	ldr r0, [r5, #0x28]
	add r2, r1, #0
	lsl r3, r3, #8
	bl sub_020032A4
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02235254
_022351E6:
	add r0, r4, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	mov r2, #0
	add r0, r4, #0
	add r1, r4, #4
	add r3, r2, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _02235234
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl ov41_0224B5D0
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, r5, #0
	bl ov40_02235C7C
	add r0, r5, #0
	bl ov40_022358C0
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_02235234:
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02235254
_0223524E:
	mov r1, #8
	bl ov40_0222BF80
_02235254:
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02235274
	bl sub_02026E48
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov41_0224B554
	mov r0, #0
	add r1, r0, #0
	bl sub_02026E50
_02235274:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02235278: .word ov40_02235900
	thumb_func_end ov40_0223512C

	thumb_func_start ov40_0223527C
ov40_0223527C: ; 0x0223527C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	ldr r0, _0223533C ; =ov40_022451C4
	bl sub_02025320
	cmp r0, #0
	beq _0223529E
	add r0, r5, #0
	bl ov40_02230944
	add r0, r5, #0
	mov r1, #9
	bl ov40_0222BF80
_0223529E:
	ldr r0, _02235340 ; =ov40_022451D0
	bl sub_02025320
	cmp r0, #0
	beq _022352B6
	add r0, r5, #0
	bl ov40_02230944
	add r0, r5, #0
	mov r1, #0xa
	bl ov40_0222BF80
_022352B6:
	ldr r0, _02235344 ; =ov40_022451D4
	bl sub_02025320
	cmp r0, #0
	beq _022352E4
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	cmp r0, #0
	beq _022352CC
	b _022352D2
_022352CC:
	add r0, r1, #0
	add r0, #0xb0
	ldr r0, [r4, r0]
_022352D2:
	sub r0, r0, #1
	str r0, [r4, r1]
	add r0, r5, #0
	bl ov40_02230944
	add r0, r5, #0
	mov r1, #0xb
	bl ov40_0222BF80
_022352E4:
	ldr r0, _02235348 ; =ov40_022451D8
	bl sub_02025320
	cmp r0, #0
	beq _02235316
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r0, r0, #1
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	add r1, #0xb0
	ldr r1, [r4, r1]
	bl _s32_div_f
	mov r0, #0x8d
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r5, #0
	bl ov40_02230944
	add r0, r5, #0
	mov r1, #0xb
	bl ov40_0222BF80
_02235316:
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02235336
	bl sub_02026E48
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov41_0224B554
	mov r0, #0
	add r1, r0, #0
	bl sub_02026E50
_02235336:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0223533C: .word ov40_022451C4
_02235340: .word ov40_022451D0
_02235344: .word ov40_022451D4
_02235348: .word ov40_022451D8
	thumb_func_end ov40_0223527C

	thumb_func_start ov40_0223534C
ov40_0223534C: ; 0x0223534C
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _02235362
	cmp r1, #1
	beq _022353A8
	b _0223542A
_02235362:
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _02235380
	ldr r0, [r5, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	add r0, r5, #0
	bl ov40_02236130
	b _0223539A
_02235380:
	mov r1, #1
	bl ov40_02230964
	mov r0, #0x25
	lsl r0, r0, #4
	add r0, r4, r0
	add r1, r5, #0
	bl ov40_0222E7B8
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
_0223539A:
	add r0, r5, #0
	bl ov40_0223584C
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02235430
_022353A8:
	add r0, r4, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r4, #0
	add r1, r4, #4
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _02235410
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _022353EA
	bl ov41_0224B57C
	add r0, r5, #0
	bl ov40_0222BC54
	mov r0, #2
	mov r1, #0
	bl SetBgPriority
	mov r0, #0x8a
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	bl ov40_02235994
_022353EA:
	ldr r0, [r5, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_02235410:
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02235430
_0223542A:
	mov r1, #3
	bl ov40_0222BF80
_02235430:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov40_0223534C

	thumb_func_start ov40_02235434
ov40_02235434: ; 0x02235434
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #4
	bls _02235446
	b _02235626
_02235446:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02235452: ; jump table
	.short _0223545C - _02235452 - 2 ; case 0
	.short _02235492 - _02235452 - 2 ; case 1
	.short _022354F2 - _02235452 - 2 ; case 2
	.short _022355AE - _02235452 - 2 ; case 3
	.short _022355CA - _02235452 - 2 ; case 4
_0223545C:
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _02235470
	bl ov40_02236130
	ldr r0, [r5, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	b _0223548A
_02235470:
	mov r1, #1
	bl ov40_02230964
	mov r0, #0x25
	lsl r0, r0, #4
	add r0, r4, r0
	add r1, r5, #0
	bl ov40_0222E7B8
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
_0223548A:
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223563E
_02235492:
	mov r2, #1
	add r0, r4, #0
	add r1, r4, #4
	add r3, r2, #0
	bl ov40_0222DA00
	cmp r0, #0
	bne _022354A4
	b _0223563E
_022354A4:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _022354EA
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _022354D2
	bl ov41_0224B57C
	add r0, r5, #0
	bl ov40_0222BC54
	mov r0, #2
	mov r1, #0
	bl SetBgPriority
	mov r0, #0x8a
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	bl ov40_02235994
_022354D2:
	ldr r0, [r5, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
_022354EA:
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223563E
_022354F2:
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _02235542
	mov r1, #1
	bl ov40_02230964
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	lsl r0, r0, #2
	add r2, r4, r0
	add r0, r1, #0
	add r0, #8
	add r1, #0x1c
	ldr r0, [r2, r0]
	ldr r1, [r4, r1]
	bl ov39_022271C0
	mov r0, #0x25
	lsl r0, r0, #4
	add r0, r4, r0
	add r1, r5, #0
	bl ov40_0222E79C
	mov r0, #0x25
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl ov40_0222E7DC
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	add r0, r5, #0
	mov r1, #0x50
	mov r2, #3
	bl ov40_022307DC
	b _022355A6
_02235542:
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	lsl r0, r0, #2
	add r2, r4, r0
	add r0, r1, #0
	add r0, #8
	ldr r0, [r2, r0]
	add r1, r1, #4
	ldr r1, [r4, r1]
	add r0, #0x80
	bl ov39_02227080
	mov r1, #0x86
	lsl r1, r1, #2
	add r0, r4, r1
	add r1, #0x20
	ldr r1, [r4, r1]
	bl ov41_0224B530
	mov r1, #0x8a
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #0
	bl ov41_0224B5D0
	bl ov40_02235940
	add r0, r5, #0
	mov r1, #0x23
	mov r2, #3
	bl ov40_022307DC
	mov r0, #8
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #1
	mov r1, #0
	bl GX_EngineAToggleLayers
_022355A6:
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223563E
_022355AE:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _022355C2
	mov r1, #0
	mov r3, #2
	ldr r0, [r5, #0x28]
	add r2, r1, #0
	lsl r3, r3, #8
	bl sub_020032A4
_022355C2:
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223563E
_022355CA:
	add r0, r4, #0
	add r1, r4, #4
	mov r2, #0
	mov r3, #1
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223563E
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _022355F6
	mov r0, #0x25
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #1
	bl ov40_0222E7DC
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	b _0223561E
_022355F6:
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, r5, #0
	bl ov40_02235C7C
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl ov41_0224B5D0
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
_0223561E:
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223563E
_02235626:
	ldr r1, [r4, #0xc]
	mov r0, #1
	eor r1, r0
	str r1, [r4, #0xc]
	add r0, r5, #0
	add r1, #0x79
	bl ov40_02235868
	add r0, r5, #0
	mov r1, #8
	bl ov40_0222BF80
_0223563E:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_02235434

	thumb_func_start ov40_02235644
ov40_02235644: ; 0x02235644
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #4
	bls _02235656
	b _0223583E
_02235656:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02235662: ; jump table
	.short _0223566C - _02235662 - 2 ; case 0
	.short _022356A2 - _02235662 - 2 ; case 1
	.short _02235702 - _02235662 - 2 ; case 2
	.short _022357C6 - _02235662 - 2 ; case 3
	.short _022357E2 - _02235662 - 2 ; case 4
_0223566C:
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _02235680
	bl ov40_02236130
	ldr r0, [r5, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	b _0223569A
_02235680:
	mov r1, #1
	bl ov40_02230964
	mov r0, #0x25
	lsl r0, r0, #4
	add r0, r4, r0
	add r1, r5, #0
	bl ov40_0222E7B8
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
_0223569A:
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02235846
_022356A2:
	mov r2, #1
	add r0, r4, #0
	add r1, r4, #4
	add r3, r2, #0
	bl ov40_0222DA00
	cmp r0, #0
	bne _022356B4
	b _02235846
_022356B4:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _022356FA
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _022356E2
	bl ov41_0224B57C
	add r0, r5, #0
	bl ov40_0222BC54
	mov r0, #2
	mov r1, #0
	bl SetBgPriority
	mov r0, #0x8a
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	bl ov40_02235994
_022356E2:
	ldr r0, [r5, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
_022356FA:
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02235846
_02235702:
	mov r1, #1
	bl ov40_02230964
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _02235774
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	lsl r0, r0, #2
	add r2, r4, r0
	add r0, r1, #0
	add r0, #8
	ldr r0, [r2, r0]
	add r1, r1, #4
	ldr r1, [r4, r1]
	add r0, #0x80
	bl ov39_02227080
	mov r1, #0x86
	lsl r1, r1, #2
	add r0, r4, r1
	add r1, #0x20
	ldr r1, [r4, r1]
	bl ov41_0224B530
	mov r1, #0x8a
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #0
	bl ov41_0224B5D0
	bl ov40_02235940
	add r0, r5, #0
	mov r1, #0x23
	mov r2, #3
	bl ov40_022307DC
	mov r0, #8
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #1
	mov r1, #0
	bl GX_EngineAToggleLayers
	b _022357B6
_02235774:
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	lsl r0, r0, #2
	add r2, r4, r0
	add r0, r1, #0
	add r0, #8
	add r1, #0x1c
	ldr r0, [r2, r0]
	ldr r1, [r4, r1]
	bl ov39_022271C0
	mov r0, #0x25
	lsl r0, r0, #4
	add r0, r4, r0
	add r1, r5, #0
	bl ov40_0222E79C
	mov r0, #0x25
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl ov40_0222E7DC
	add r0, r5, #0
	mov r1, #0x50
	mov r2, #3
	bl ov40_022307DC
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
_022357B6:
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02235846
_022357C6:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _022357DA
	mov r1, #0
	mov r3, #2
	ldr r0, [r5, #0x28]
	add r2, r1, #0
	lsl r3, r3, #8
	bl sub_020032A4
_022357DA:
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02235846
_022357E2:
	add r0, r4, #0
	add r1, r4, #4
	mov r2, #0
	mov r3, #1
	bl ov40_0222DA00
	cmp r0, #0
	beq _02235846
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _02235822
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, r5, #0
	bl ov40_02235C7C
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl ov41_0224B5D0
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	b _02235836
_02235822:
	mov r0, #0x25
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #1
	bl ov40_0222E7DC
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
_02235836:
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02235846
_0223583E:
	add r0, r5, #0
	mov r1, #8
	bl ov40_0222BF80
_02235846:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_02235644

	thumb_func_start ov40_0223584C
ov40_0223584C: ; 0x0223584C
	push {r4, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r4, [r0, r1]
	add r0, r4, #0
	add r0, #0xd0
	bl ClearWindowTilemapAndCopyToVram
	add r4, #0xd0
	add r0, r4, #0
	bl RemoveWindow
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov40_0223584C

	thumb_func_start ov40_02235868
ov40_02235868: ; 0x02235868
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	add r6, r1, #0
	add r4, #0xd0
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x48]
	add r1, r6, #0
	bl NewString_ReadMsgData
	add r5, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	bl ov40_022306C0
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _022358BC ; =0x000F0D00
	add r2, r5, #0
	str r0, [sp, #8]
	add r0, r4, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl String_dtor
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_022358BC: .word 0x000F0D00
	thumb_func_end ov40_02235868

	thumb_func_start ov40_022358C0
ov40_022358C0: ; 0x022358C0
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	add r4, #0xd0
	add r0, r4, #0
	bl InitWindow
	mov r0, #3
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x24]
	add r1, r4, #0
	mov r2, #6
	mov r3, #8
	bl AddWindowParameterized
	add r0, r5, #0
	mov r1, #0x79
	bl ov40_02235868
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov40_022358C0

	thumb_func_start ov40_02235900
ov40_02235900: ; 0x02235900
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _02235918
	bl ov41_0224B5C8
_02235918:
	bl GF_RunVramTransferTasks
	ldr r0, [r4, #0x28]
	bl sub_0200398C
	ldr r0, [r4, #0x24]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	ldr r3, _02235938 ; =0x027E0000
	ldr r1, _0223593C ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_02235938: .word 0x027E0000
_0223593C: .word 0x00003FF8
	thumb_func_end ov40_02235900

	thumb_func_start ov40_02235940
ov40_02235940: ; 0x02235940
	push {r4, r5}
	mov r0, #1
	lsl r0, r0, #0x1a
	ldr r2, [r0]
	ldr r1, _02235988 ; =0xFFFF1FFF
	add r4, r0, #0
	and r2, r1
	lsr r1, r0, #0xd
	orr r1, r2
	str r1, [r0]
	add r4, #0x48
	ldrh r3, [r4]
	mov r2, #0x3f
	mov r1, #0x1f
	bic r3, r2
	orr r1, r3
	mov r3, #0x20
	orr r1, r3
	strh r1, [r4]
	add r4, r0, #0
	add r4, #0x4a
	ldrh r5, [r4]
	mov r1, #0x1e
	bic r5, r2
	orr r1, r5
	orr r1, r3
	strh r1, [r4]
	add r1, r0, #0
	ldr r2, _0223598C ; =0x000048B8
	add r1, #0x40
	strh r2, [r1]
	ldr r1, _02235990 ; =0x00001090
	add r0, #0x44
	strh r1, [r0]
	pop {r4, r5}
	bx lr
	.balign 4, 0
_02235988: .word 0xFFFF1FFF
_0223598C: .word 0x000048B8
_02235990: .word 0x00001090
	thumb_func_end ov40_02235940

	thumb_func_start ov40_02235994
ov40_02235994: ; 0x02235994
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _022359AC ; =0xFFFF1FFF
	and r1, r0
	str r1, [r2]
	ldr r2, _022359B0 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	bx lr
	nop
_022359AC: .word 0xFFFF1FFF
_022359B0: .word 0x04001000
	thumb_func_end ov40_02235994

	thumb_func_start ov40_022359B4
ov40_022359B4: ; 0x022359B4
	push {r4, lr}
	mov r2, #0x86
	lsl r2, r2, #4
	ldr r4, [r0, r2]
	cmp r1, #0
	bne _022359E8
	mov r0, #0x6e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_0200DCE8
	mov r0, #0x6f
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_020137C0
	mov r0, #0x67
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x20
	mov r2, #0xe8
	bl sub_0200DDB8
	b _02235A0E
_022359E8:
	mov r0, #0x6e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DCE8
	mov r0, #0x6f
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_020137C0
	mov r0, #0x67
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x50
	mov r2, #0xe8
	bl sub_0200DDB8
_02235A0E:
	mov r0, #0x1a
	lsl r0, r0, #4
	mov r1, #0x24
	add r2, r1, #0
	ldr r0, [r4, r0]
	sub r2, #0x2c
	bl sub_020136B4
	mov r0, #0x6f
	lsl r0, r0, #2
	mov r1, #0x24
	add r2, r1, #0
	ldr r0, [r4, r0]
	sub r2, #0x2c
	bl sub_020136B4
	pop {r4, pc}
	thumb_func_end ov40_022359B4

	thumb_func_start ov40_02235A30
ov40_02235A30: ; 0x02235A30
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	mov r1, #2
	bl ov40_0222D6EC
	add r0, r5, #0
	mov r1, #2
	bl ov40_0222D800
	mov r1, #0x67
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r5, #0
	mov r1, #2
	bl ov40_0222D800
	mov r1, #0x6e
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, #0x20
	add r0, r4, r1
	add r1, r5, #0
	add r1, #0x14
	mov r2, #2
	bl ov40_0222D5AC
	mov r0, #0x6d
	lsl r0, r0, #2
	add r1, r5, #0
	add r0, r4, r0
	add r1, #0x14
	mov r2, #2
	bl ov40_0222D5AC
	mov r0, #0x66
	lsl r0, r0, #2
	add r1, r5, #0
	add r0, r4, r0
	add r1, #0x14
	mov r2, #3
	bl ov40_0222D66C
	mov r0, #0x6d
	lsl r0, r0, #2
	add r1, r5, #0
	add r0, r4, r0
	add r1, #0x14
	mov r2, #0x35
	bl ov40_0222D66C
	mov r0, #0x67
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DC4C
	mov r0, #0x6e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #4
	bl sub_0200DC4C
	mov r0, #0x67
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x20
	mov r2, #0xe8
	bl sub_0200DDB8
	mov r0, #0x6e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x80
	mov r2, #0xe8
	bl sub_0200DDB8
	mov r0, #0x1a
	lsl r0, r0, #4
	mov r1, #0x24
	add r2, r1, #0
	ldr r0, [r4, r0]
	sub r2, #0x2c
	bl sub_020136B4
	mov r0, #0x6f
	lsl r0, r0, #2
	mov r1, #0x24
	add r2, r1, #0
	ldr r0, [r4, r0]
	sub r2, #0x2c
	bl sub_020136B4
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_020137C0
	mov r0, #0x6f
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_020137C0
	add r0, r5, #0
	mov r1, #0
	bl ov40_022359B4
	pop {r3, r4, r5, pc}
	thumb_func_end ov40_02235A30

	thumb_func_start ov40_02235B10
ov40_02235B10: ; 0x02235B10
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	mov r0, #0x66
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov40_0222D6D0
	mov r0, #0x6d
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov40_0222D6D0
	mov r0, #0x67
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200D9DC
	mov r0, #0x6e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200D9DC
	add r0, r5, #0
	bl ov40_0222D7DC
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_02235B10

	thumb_func_start ov40_02235B4C
ov40_02235B4C: ; 0x02235B4C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r6, [r5, r0]
	add r0, r6, #0
	add r0, #0x10
	bl WindowIsInUse
	cmp r0, #1
	bne _02235B66
	b _02235C72
_02235B66:
	add r0, r6, #0
	str r0, [sp, #0x20]
	add r0, #0x10
	str r0, [sp, #0x20]
	bl InitWindow
	mov r0, #0x13
	str r0, [sp]
	mov r3, #0x10
	str r3, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	mov r0, #0x4b
	lsl r0, r0, #2
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x24]
	ldr r1, [sp, #0x20]
	mov r2, #2
	bl AddWindowParameterized
	ldr r0, [sp, #0x20]
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x6d
	bl ov40_0222DAB0
	str r0, [sp, #0x18]
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	add r7, r0, #0
	ldr r0, [r5, #0x48]
	mov r1, #0x38
	bl NewString_ReadMsgData
	str r0, [sp, #0x1c]
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	add r4, r0, #0
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	add r1, r4, #0
	bl sub_0202BE60
	add r0, r5, #0
	add r1, r4, #0
	bl ov40_02230DCC
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl sub_0202BE98
	add r5, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r1, #0
	ldr r0, [sp, #0x18]
	add r2, r4, #0
	add r3, r1, #0
	bl BufferString
	ldr r0, [sp, #0x18]
	mov r1, #1
	add r2, r5, #0
	bl BufferECWord
	ldr r0, [sp, #0x18]
	ldr r2, [sp, #0x1c]
	add r1, r7, #0
	bl StringExpandPlaceholders
	add r0, r7, #0
	bl StringCountLines
	mov r5, #0
	str r0, [sp, #0x14]
	cmp r0, #0
	bls _02235C54
	add r6, r5, #0
_02235C18:
	add r0, r4, #0
	add r1, r7, #0
	add r2, r5, #0
	bl StringGetLineN
	mov r0, #0
	add r1, r4, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	mov r1, #0x80
	sub r0, r1, r0
	lsr r3, r0, #1
	str r6, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02235C78 ; =0x000F0D00
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x20]
	add r2, r4, #0
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x14]
	add r5, r5, #1
	add r6, #0x10
	cmp r5, r0
	blo _02235C18
_02235C54:
	ldr r0, [sp, #0x20]
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	bl String_dtor
	ldr r0, [sp, #0x1c]
	bl String_dtor
	add r0, r7, #0
	bl String_dtor
	ldr r0, [sp, #0x18]
	bl ScrStrBufs_delete
_02235C72:
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_02235C78: .word 0x000F0D00
	thumb_func_end ov40_02235B4C

	thumb_func_start ov40_02235C7C
ov40_02235C7C: ; 0x02235C7C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r6, [r5, r0]
	add r0, r6, #0
	add r0, #0x10
	bl WindowIsInUse
	cmp r0, #1
	bne _02235C96
	b _02235DA2
_02235C96:
	add r0, r6, #0
	str r0, [sp, #0x20]
	add r0, #0x10
	str r0, [sp, #0x20]
	bl InitWindow
	mov r0, #0x13
	str r0, [sp]
	mov r3, #0x10
	str r3, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	mov r0, #0x4b
	lsl r0, r0, #2
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x24]
	ldr r1, [sp, #0x20]
	mov r2, #2
	bl AddWindowParameterized
	ldr r0, [sp, #0x20]
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x6d
	bl ov40_0222DAB0
	str r0, [sp, #0x18]
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	add r7, r0, #0
	ldr r0, [r5, #0x48]
	mov r1, #0x38
	bl NewString_ReadMsgData
	str r0, [sp, #0x1c]
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	add r4, r0, #0
	mov r0, #0x8e
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	add r1, r4, #0
	bl sub_0202BE60
	add r0, r5, #0
	add r1, r4, #0
	bl ov40_02230DCC
	mov r0, #0x8e
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl sub_0202BE98
	add r5, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r1, #0
	ldr r0, [sp, #0x18]
	add r2, r4, #0
	add r3, r1, #0
	bl BufferString
	ldr r0, [sp, #0x18]
	mov r1, #1
	add r2, r5, #0
	bl BufferECWord
	ldr r0, [sp, #0x18]
	ldr r2, [sp, #0x1c]
	add r1, r7, #0
	bl StringExpandPlaceholders
	add r0, r7, #0
	bl StringCountLines
	mov r5, #0
	str r0, [sp, #0x14]
	cmp r0, #0
	bls _02235D84
	add r6, r5, #0
_02235D48:
	add r0, r4, #0
	add r1, r7, #0
	add r2, r5, #0
	bl StringGetLineN
	mov r0, #0
	add r1, r4, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	mov r1, #0x80
	sub r0, r1, r0
	lsr r3, r0, #1
	str r6, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02235DA8 ; =0x000F0D00
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x20]
	add r2, r4, #0
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x14]
	add r5, r5, #1
	add r6, #0x10
	cmp r5, r0
	blo _02235D48
_02235D84:
	ldr r0, [sp, #0x20]
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	bl String_dtor
	ldr r0, [sp, #0x1c]
	bl String_dtor
	add r0, r7, #0
	bl String_dtor
	ldr r0, [sp, #0x18]
	bl ScrStrBufs_delete
_02235DA2:
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_02235DA8: .word 0x000F0D00
	thumb_func_end ov40_02235C7C

	thumb_func_start ov40_02235DAC
ov40_02235DAC: ; 0x02235DAC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	str r0, [sp, #8]
	add r0, r1, #1
	ldr r2, _02235E2C ; =ov40_02245CD4
	lsl r0, r0, #1
	ldrh r4, [r2, r0]
	lsl r0, r1, #1
	ldrh r6, [r2, r0]
	ldr r1, [sp, #8]
	mov r0, #0x6d
	add r2, sp, #0xc
	bl ov40_0222DD68
	str r0, [sp, #4]
	mov r0, #0x83
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl Sav2_Pokedex_get
	str r0, [sp]
	add r7, r6, #0
	cmp r6, r4
	bge _02235DFE
	ldr r0, [sp, #4]
	lsl r1, r6, #1
	add r5, r0, r1
_02235DE6:
	ldrh r1, [r5]
	ldr r0, [sp]
	bl Pokedex_CheckMonSeenFlag
	cmp r0, #0
	bne _02235DF6
	ldr r0, _02235E30 ; =0x0000FFFF
	strh r0, [r5]
_02235DF6:
	add r7, r7, #1
	add r5, r5, #2
	cmp r7, r4
	blt _02235DE6
_02235DFE:
	cmp r6, r4
	bge _02235E1E
	ldr r0, [sp, #4]
	lsl r1, r6, #1
	add r2, r0, r1
	ldr r0, _02235E30 ; =0x0000FFFF
_02235E0A:
	ldrh r1, [r2]
	cmp r1, r0
	beq _02235E16
	mov r0, #1
	str r0, [sp, #8]
	b _02235E1E
_02235E16:
	add r6, r6, #1
	add r2, r2, #2
	cmp r6, r4
	blt _02235E0A
_02235E1E:
	ldr r0, [sp, #4]
	bl FreeToHeap
	ldr r0, [sp, #8]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02235E2C: .word ov40_02245CD4
_02235E30: .word 0x0000FFFF
	thumb_func_end ov40_02235DAC

	thumb_func_start ov40_02235E34
ov40_02235E34: ; 0x02235E34
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	add r0, r1, #1
	ldr r2, _02235F98 ; =ov40_02245CD4
	lsl r0, r0, #1
	ldrh r6, [r2, r0]
	lsl r0, r1, #1
	ldrh r0, [r2, r0]
	mov r2, #0x76
	lsl r2, r2, #2
	str r0, [sp]
	mov r0, #0x6d
	mov r1, #0
	add r2, r4, r2
	bl ov40_0222DD68
	mov r2, #0x77
	lsl r2, r2, #2
	str r0, [r4, r2]
	sub r2, r2, #4
	mov r0, #0x6d
	mov r1, #0
	add r2, r4, r2
	bl ov40_0222DD68
	str r0, [sp, #8]
	mov r0, #0x83
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl Sav2_Pokedex_get
	str r0, [sp, #4]
	mov r0, #0x75
	ldr r7, [sp]
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r7, #0
	cmp r0, r6
	bge _02235EBA
	lsl r1, r0, #1
	ldr r0, [sp, #8]
	add r5, r0, r1
_02235E92:
	ldrh r1, [r5]
	ldr r0, [sp, #4]
	bl Pokedex_CheckMonSeenFlag
	cmp r0, #0
	bne _02235EA4
	ldr r0, _02235F9C ; =0x0000FFFF
	strh r0, [r5]
	b _02235EB2
_02235EA4:
	mov r0, #0x75
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, r0, #1
	mov r0, #0x75
	lsl r0, r0, #2
	str r1, [r4, r0]
_02235EB2:
	add r7, r7, #1
	add r5, r5, #2
	cmp r7, r6
	blt _02235E92
_02235EBA:
	ldr r1, [sp]
	mov r0, #0
	cmp r1, r6
	bge _02235EEA
	lsl r2, r1, #1
	ldr r1, [sp, #8]
	ldr r7, _02235F9C ; =0x0000FFFF
	add r2, r1, r2
	add r3, r0, #0
_02235ECC:
	ldrh r1, [r2]
	cmp r1, r7
	beq _02235EDE
	mov r5, #0x77
	lsl r5, r5, #2
	ldr r5, [r4, r5]
	add r0, r0, #1
	strh r1, [r5, r3]
	add r3, r3, #2
_02235EDE:
	ldr r1, [sp]
	add r2, r2, #2
	add r1, r1, #1
	str r1, [sp]
	cmp r1, r6
	blt _02235ECC
_02235EEA:
	mov r1, #0x76
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	cmp r0, r1
	bge _02235F12
	mov r7, #0x77
	ldr r1, [sp, #8]
	lsl r6, r0, #1
	lsl r7, r7, #2
	add r5, r1, r6
	sub r1, r7, #4
_02235F00:
	ldrh r3, [r5]
	ldr r2, [r4, r7]
	add r0, r0, #1
	strh r3, [r2, r6]
	ldr r2, [r4, r1]
	add r5, r5, #2
	add r6, r6, #2
	cmp r0, r2
	blt _02235F00
_02235F12:
	ldr r0, [sp, #8]
	bl FreeToHeap
	mov r1, #0x75
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	mov r0, #0x6d
	lsl r1, r1, #4
	bl AllocFromHeap
	mov r2, #0x7a
	lsl r2, r2, #2
	str r0, [r4, r2]
	ldr r0, [r4, r2]
	sub r2, #0x14
	ldr r2, [r4, r2]
	mov r1, #0
	lsl r2, r2, #4
	bl MI_CpuFill8
	mov r0, #0x75
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r5, #0
	cmp r0, #0
	ble _02235F7C
	mov r7, #0x7a
	lsl r7, r7, #2
	add r0, r7, #0
	add r2, r5, #0
	add r3, r5, #0
	sub r0, #0x14
_02235F52:
	mov r1, #0x77
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	mov r6, #0x7a
	lsl r6, r6, #2
	ldrh r1, [r1, r2]
	ldr r6, [r4, r6]
	add r5, r5, #1
	str r1, [r6, r3]
	mov r1, #0x77
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldr r6, [r4, r7]
	ldrh r1, [r1, r2]
	add r6, r6, r3
	add r2, r2, #2
	str r1, [r6, #4]
	ldr r1, [r4, r0]
	add r3, #0x10
	cmp r5, r1
	blt _02235F52
_02235F7C:
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xed
	mov r3, #0x6d
	bl NewMsgDataFromNarc
	mov r1, #0x1e
	lsl r1, r1, #4
	str r0, [r4, r1]
	mov r2, #1
	add r0, r1, #4
	str r2, [r4, r0]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02235F98: .word ov40_02245CD4
_02235F9C: .word 0x0000FFFF
	thumb_func_end ov40_02235E34

	thumb_func_start ov40_02235FA0
ov40_02235FA0: ; 0x02235FA0
	push {r4, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r4, [r0, r1]
	mov r0, #0x1e
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl DestroyMsgData
	mov r0, #0x7a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0x77
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0x79
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	pop {r4, pc}
	thumb_func_end ov40_02235FA0

	thumb_func_start ov40_02235FD0
ov40_02235FD0: ; 0x02235FD0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	cmp r1, #0
	bne _02235FF6
	add r0, r4, #0
	add r1, r5, #0
	bl ov40_02235DAC
	cmp r0, #0
	bne _02235FEE
	ldr r0, _02235FF8 ; =0x0000057C
	bl PlaySE
	pop {r3, r4, r5, pc}
_02235FEE:
	add r0, r4, #0
	add r1, r5, #0
	bl ov40_02235E34
_02235FF6:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02235FF8: .word 0x0000057C
	thumb_func_end ov40_02235FD0

	thumb_func_start ov40_02235FFC
ov40_02235FFC: ; 0x02235FFC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	str r0, [sp, #0x14]
	mov r0, #1
	str r0, [sp, #0x28]
	mov r1, #0x86
	ldr r0, [sp, #0x14]
	lsl r1, r1, #4
	ldr r4, [r0, r1]
	ldr r5, _02236100 ; =ov40_02245708
	mov r7, #0
	add r4, #0xd0
_02236014:
	ldrb r0, [r5, #2]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x24]
	ldrb r0, [r5]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x20]
	ldrb r0, [r5, #3]
	lsr r1, r0, #3
	ldr r0, [sp, #0x24]
	sub r0, r1, r0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x1c]
	ldrb r0, [r5, #1]
	lsr r1, r0, #3
	ldr r0, [sp, #0x20]
	sub r0, r1, r0
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	add r0, r4, #0
	bl InitWindow
	ldr r0, [sp, #0x20]
	add r1, r4, #0
	str r0, [sp]
	ldr r0, [sp, #0x1c]
	mov r2, #6
	str r0, [sp, #4]
	str r6, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x28]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r3, [sp, #0x24]
	ldr r0, [r0, #0x24]
	bl AddWindowParameterized
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x14]
	add r1, r7, #0
	ldr r0, [r0, #0x48]
	add r1, #0x44
	bl NewString_ReadMsgData
	str r0, [sp, #0x2c]
	ldr r1, [sp, #0x2c]
	add r0, r4, #0
	bl ov40_022306C0
	lsl r1, r6, #3
	sub r1, #0x10
	str r0, [sp, #0x30]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	add r1, r7, #0
	bl ov40_02235DAC
	cmp r0, #1
	bne _022360BE
	ldr r0, [sp, #0x18]
	ldr r2, [sp, #0x2c]
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02236104 ; =0x000F0D00
	ldr r3, [sp, #0x30]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #0
	bl AddTextPrinterParameterized2
	b _022360DA
_022360BE:
	ldr r0, [sp, #0x18]
	ldr r2, [sp, #0x2c]
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02236108 ; =0x000C0B00
	ldr r3, [sp, #0x30]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #0
	bl AddTextPrinterParameterized2
_022360DA:
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	ldr r0, [sp, #0x2c]
	bl String_dtor
	ldr r0, [sp, #0x1c]
	add r7, r7, #1
	add r1, r0, #0
	ldr r0, [sp, #0x28]
	mul r1, r6
	add r0, r0, r1
	str r0, [sp, #0x28]
	add r4, #0x10
	add r5, r5, #4
	cmp r7, #9
	blo _02236014
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02236100: .word ov40_02245708
_02236104: .word 0x000F0D00
_02236108: .word 0x000C0B00
	thumb_func_end ov40_02235FFC

	thumb_func_start ov40_0223610C
ov40_0223610C: ; 0x0223610C
	push {r3, r4, r5, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r5, [r0, r1]
	mov r4, #0
	add r5, #0xd0
_02236118:
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #9
	blo _02236118
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_0223610C

	thumb_func_start ov40_02236130
ov40_02236130: ; 0x02236130
	push {r4, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r4, [r0, r1]
	add r0, r4, #0
	add r0, #0x10
	bl WindowIsInUse
	cmp r0, #1
	bne _02236154
	add r0, r4, #0
	add r0, #0x10
	bl ClearWindowTilemapAndCopyToVram
	add r4, #0x10
	add r0, r4, #0
	bl RemoveWindow
_02236154:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov40_02236130

	thumb_func_start ov40_02236158
ov40_02236158: ; 0x02236158
	bx lr
	.balign 4, 0
	thumb_func_end ov40_02236158

	thumb_func_start ov40_0223615C
ov40_0223615C: ; 0x0223615C
	push {r4, lr}
	mov r2, #0x86
	lsl r2, r2, #4
	ldr r1, [r1]
	ldr r4, [r0, r2]
	cmp r1, #1
	beq _02236180
	bl ov40_0223D540
	mov r1, #0x8f
	lsl r1, r1, #2
	add r1, r4, r1
	mov r2, #5
	bl ov39_02227E8C
	mov r1, #0xb9
	lsl r1, r1, #2
	str r0, [r4, r1]
_02236180:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov40_0223615C

	thumb_func_start ov40_02236184
ov40_02236184: ; 0x02236184
	push {r3, r4, r5, lr}
	add r5, r1, #0
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r4, [r0, r1]
	mov r0, #0x6d
	bl sub_020314A4
	ldr r1, _022361AC ; =0x00002ED8
	str r0, [r4, r1]
	lsl r0, r5, #2
	add r2, r4, r0
	mov r0, #0xe3
	lsl r0, r0, #2
	ldr r0, [r2, r0]
	ldr r1, [r4, r1]
	bl ov39_022271C0
	pop {r3, r4, r5, pc}
	nop
_022361AC: .word 0x00002ED8
	thumb_func_end ov40_02236184

	thumb_func_start ov40_022361B0
ov40_022361B0: ; 0x022361B0
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r1, [r0, r1]
	ldr r0, _022361C0 ; =0x00002ED8
	ldr r3, _022361C4 ; =sub_020314BC
	ldr r0, [r1, r0]
	bx r3
	nop
_022361C0: .word 0x00002ED8
_022361C4: .word sub_020314BC
	thumb_func_end ov40_022361B0

	thumb_func_start ov40_022361C8
ov40_022361C8: ; 0x022361C8
	mov r2, #0
_022361CA:
	ldrh r1, [r0, #0x28]
	cmp r1, #0
	beq _022361D4
	mov r0, #1
	bx lr
_022361D4:
	add r2, r2, #1
	add r0, r0, #2
	cmp r2, #0x1e
	blt _022361CA
	mov r0, #0
	bx lr
	thumb_func_end ov40_022361C8

	thumb_func_start ov40_022361E0
ov40_022361E0: ; 0x022361E0
	push {r3, r4}
	mov r1, #0x1b
	lsl r1, r1, #4
	ldr r4, [r0, r1]
	add r2, r4, #0
	cmp r4, #0x1e
	bge _0223620A
	lsl r1, r4, #1
	add r3, r0, r1
_022361F2:
	ldrh r1, [r3, #0x2c]
	cmp r1, #0
	beq _02236202
	mov r1, #0x1b
	lsl r1, r1, #4
	str r2, [r0, r1]
	pop {r3, r4}
	bx lr
_02236202:
	add r2, r2, #1
	add r3, r3, #2
	cmp r2, #0x1e
	blt _022361F2
_0223620A:
	mov r3, #0
	cmp r4, #0
	ble _0223622A
	add r2, r0, #0
_02236212:
	ldrh r1, [r2, #0x2c]
	cmp r1, #0
	beq _02236222
	mov r1, #0x1b
	lsl r1, r1, #4
	str r3, [r0, r1]
	pop {r3, r4}
	bx lr
_02236222:
	add r3, r3, #1
	add r2, r2, #2
	cmp r3, r4
	blt _02236212
_0223622A:
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov40_022361E0

	thumb_func_start ov40_02236230
ov40_02236230: ; 0x02236230
	push {r3, r4, r5, lr}
	add r5, r2, #0
	mov r2, #0x86
	lsl r2, r2, #4
	ldr r4, [r5, r2]
	cmp r0, #3
	bhi _022362DE
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223624A: ; jump table
	.short _02236252 - _0223624A - 2 ; case 0
	.short _02236278 - _0223624A - 2 ; case 1
	.short _022362A4 - _0223624A - 2 ; case 2
	.short _022362B8 - _0223624A - 2 ; case 3
_02236252:
	cmp r1, #2
	bne _022362DE
	add r0, r5, #0
	bl ov40_02230944
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	cmp r1, #0
	ble _0223626A
	sub r1, r1, #1
	b _0223626C
_0223626A:
	mov r1, #0x11
_0223626C:
	str r1, [r4, r0]
	add r0, r5, #0
	mov r1, #4
	bl ov40_0222BF80
	pop {r3, r4, r5, pc}
_02236278:
	cmp r1, #2
	bne _022362DE
	add r0, r5, #0
	bl ov40_02230944
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	mov r1, #0x12
	bl _s32_div_f
	mov r0, #0x1a
	lsl r0, r0, #4
	str r1, [r4, r0]
	add r0, r5, #0
	mov r1, #4
	bl ov40_0222BF80
	pop {r3, r4, r5, pc}
_022362A4:
	cmp r1, #0
	bne _022362DE
	add r0, r5, #0
	bl ov40_02230944
	add r0, r5, #0
	mov r1, #9
	bl ov40_0222BF80
	pop {r3, r4, r5, pc}
_022362B8:
	cmp r1, #0
	bne _022362DE
	add r0, r5, #0
	bl ov40_02230944
	add r0, r4, #4
	bl ov40_022361C8
	cmp r0, #0
	beq _022362D6
	add r0, r5, #0
	mov r1, #5
	bl ov40_0222BF80
	pop {r3, r4, r5, pc}
_022362D6:
	ldr r1, _022362E0 ; =0x0000010F
	add r0, r5, #0
	bl ov40_02237030
_022362DE:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022362E0: .word 0x0000010F
	thumb_func_end ov40_02236230

	thumb_func_start ov40_022362E4
ov40_022362E4: ; 0x022362E4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0x86
	add r4, r2, #0
	lsl r0, r0, #4
	ldr r6, [r4, r0]
	cmp r1, #0
	bne _0223631C
	cmp r5, #6
	beq _0223630E
	add r0, r4, #0
	bl ov40_02230944
	mov r0, #0xe
	lsl r0, r0, #6
	str r5, [r6, r0]
	add r0, r4, #0
	mov r1, #8
	bl ov40_0222BF80
	pop {r4, r5, r6, pc}
_0223630E:
	add r0, r4, #0
	bl ov40_02230944
	add r0, r4, #0
	mov r1, #7
	bl ov40_0222BF80
_0223631C:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov40_022362E4

	thumb_func_start ov40_02236320
ov40_02236320: ; 0x02236320
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0x86
	add r4, r2, #0
	lsl r0, r0, #4
	ldr r6, [r4, r0]
	cmp r1, #0
	bne _02236358
	cmp r5, #6
	beq _0223634A
	add r0, r4, #0
	bl ov40_02230944
	mov r0, #0xe
	lsl r0, r0, #6
	str r5, [r6, r0]
	add r0, r4, #0
	mov r1, #4
	bl ov40_0222BF80
	pop {r4, r5, r6, pc}
_0223634A:
	add r0, r4, #0
	bl ov40_02230944
	add r0, r4, #0
	mov r1, #0xc
	bl ov40_0222BF80
_02236358:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov40_02236320

	thumb_func_start ov40_0223635C
ov40_0223635C: ; 0x0223635C
	push {r3, r4, r5, lr}
	add r5, r2, #0
	mov r2, #0x86
	lsl r2, r2, #4
	ldr r4, [r5, r2]
	cmp r1, #0
	bne _022363B6
	cmp r0, #0
	beq _02236376
	cmp r0, #1
	beq _02236398
	cmp r0, #2
	beq _022363A8
_02236376:
	add r0, r5, #0
	bl ov40_02230944
	ldr r0, _022363B8 ; =0x00002F64
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0223638E
	add r0, r5, #0
	mov r1, #7
	bl ov40_0222BF80
	pop {r3, r4, r5, pc}
_0223638E:
	add r0, r5, #0
	mov r1, #8
	bl ov40_0222BF80
	pop {r3, r4, r5, pc}
_02236398:
	add r0, r5, #0
	bl ov40_02230944
	add r0, r5, #0
	mov r1, #9
	bl ov40_0222BF80
	pop {r3, r4, r5, pc}
_022363A8:
	add r0, r5, #0
	bl ov40_02230944
	add r0, r5, #0
	mov r1, #6
	bl ov40_0222BF80
_022363B6:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022363B8: .word 0x00002F64
	thumb_func_end ov40_0223635C

	thumb_func_start ov40_022363BC
ov40_022363BC: ; 0x022363BC
	push {r3, r4, r5, lr}
	add r5, r2, #0
	mov r2, #0x86
	lsl r2, r2, #4
	ldr r4, [r5, r2]
	cmp r1, #0
	bne _022364C4
	cmp r0, #0
	beq _022363D4
	cmp r0, #1
	beq _0223649C
	pop {r3, r4, r5, pc}
_022363D4:
	add r0, r5, #0
	bl ov40_02230944
	mov r0, #0x1b
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	mov r1, #0x1e
	bl _s32_div_f
	mov r0, #0x1b
	lsl r0, r0, #4
	str r1, [r4, r0]
	add r0, r4, #0
	bl ov40_022361E0
	mov r0, #0x1b
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #6
	bl _s32_div_f
	ldr r0, _022364C8 ; =0x00002F68
	str r1, [r4, r0]
	mov r0, #0x1b
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #6
	bl _s32_div_f
	ldr r2, _022364CC ; =0x00002F6C
	str r0, [r4, r2]
	sub r1, r2, #4
	ldr r3, [r4, r1]
	mov r1, #0x18
	mul r1, r3
	ldr r3, [r4, r2]
	mov r2, #0x16
	mov r0, #0x6f
	mul r2, r3
	lsl r0, r0, #4
	add r1, #0x6e
	add r2, #0x34
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	ldr r0, [r5, r0]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl sub_020878B8
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r5, #0
	bl ov40_02237564
	add r0, r5, #0
	bl ov40_02237474
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	mov r1, #0x1b
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	add r0, r5, #0
	bl ov40_022371E4
	mov r0, #0x1b
	lsl r0, r0, #4
	ldr r2, [r4, r0]
	lsl r1, r2, #1
	add r1, r4, r1
	ldrh r1, [r1, #0x2c]
	cmp r1, #0
	beq _022364C4
	sub r0, #0x58
	mov r1, #1
	ldr r0, [r4, r0]
	lsl r1, r2
	bl ov40_022371D4
	cmp r0, #1
	beq _022364C4
	mov r1, #0x1b
	lsl r1, r1, #4
	ldr r2, [r4, r1]
	sub r1, #0x54
	lsl r0, r2, #1
	add r0, r4, r0
	add r2, r4, r2
	ldrh r0, [r0, #0x2c]
	ldrb r1, [r2, r1]
	bl PlayCry
	pop {r3, r4, r5, pc}
_0223649C:
	add r0, r5, #0
	bl ov40_02230944
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	mov r1, #0
	ldr r0, [r5, r0]
	add r2, r1, #0
	bl sub_02087A08
	add r0, r5, #0
	mov r1, #0xb
	bl ov40_0222BF80
_022364C4:
	pop {r3, r4, r5, pc}
	nop
_022364C8: .word 0x00002F68
_022364CC: .word 0x00002F6C
	thumb_func_end ov40_022363BC

	thumb_func_start ov40_022364D0
ov40_022364D0: ; 0x022364D0
	push {r3, r4, r5, lr}
	sub sp, #0x18
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	mov r1, #2
	bl ov40_0222D73C
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0xe8
	str r0, [sp, #4]
	mov r0, #0x24
	str r0, [sp, #8]
	sub r0, #0x2c
	str r0, [sp, #0xc]
	mov r0, #0
	mov r1, #0xd2
	str r0, [sp, #0x10]
	mov r0, #1
	lsl r1, r1, #2
	str r0, [sp, #0x14]
	add r0, r5, #0
	add r1, r4, r1
	mov r2, #2
	mov r3, #3
	bl ov40_02230970
	mov r0, #0x80
	str r0, [sp]
	mov r0, #0xe8
	str r0, [sp, #4]
	mov r0, #0x24
	str r0, [sp, #8]
	sub r0, #0x2c
	str r0, [sp, #0xc]
	mov r0, #1
	mov r1, #0xd9
	str r0, [sp, #0x10]
	lsl r1, r1, #2
	str r0, [sp, #0x14]
	add r0, r5, #0
	add r1, r4, r1
	mov r2, #2
	mov r3, #0x35
	bl ov40_02230970
	add sp, #0x18
	pop {r3, r4, r5, pc}
	thumb_func_end ov40_022364D0

	thumb_func_start ov40_02236534
ov40_02236534: ; 0x02236534
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	mov r0, #0xd2
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov40_022309CC
	mov r0, #0xd9
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov40_022309CC
	add r0, r5, #0
	bl ov40_0222D7DC
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_02236534

	thumb_func_start ov40_0223655C
ov40_0223655C: ; 0x0223655C
	mov r2, #0
	add r3, r0, #0
_02236560:
	ldrh r1, [r3, #0x2c]
	cmp r1, #0
	beq _0223656E
	mov r1, #0x1b
	lsl r1, r1, #4
	str r2, [r0, r1]
	bx lr
_0223656E:
	add r2, r2, #1
	add r3, r3, #2
	cmp r2, #0x1e
	blt _02236560
	bx lr
	thumb_func_end ov40_0223655C

	thumb_func_start ov40_02236578
ov40_02236578: ; 0x02236578
	push {r3, r4, r5, r6, r7, lr}
	add r6, r2, #0
	mov r2, #0x67
	add r4, r1, #0
	add r7, r3, #0
	add r5, r0, #0
	add r0, r7, #0
	mov r1, #0
	lsl r2, r2, #2
	bl memset
	mov r0, #0x6d
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	add r3, r7, #0
	bl ov39_02227088
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov40_02236578

	thumb_func_start ov40_022365A0
ov40_022365A0: ; 0x022365A0
	push {r3, r4, r5, lr}
	ldr r1, _022366A4 ; =0x00002F70
	add r5, r0, #0
	mov r0, #0x6d
	bl AllocFromHeap
	ldr r2, _022366A4 ; =0x00002F70
	mov r1, #0
	add r4, r0, #0
	bl memset
	mov r0, #0x86
	lsl r0, r0, #4
	str r4, [r5, r0]
	ldr r0, [r5, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	mov r0, #0x83
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl GetStoragePCPointer
	str r0, [r4]
	mov r0, #0x83
	mov r2, #0x1a
	lsl r0, r0, #4
	lsl r2, r2, #4
	ldr r0, [r5, r0]
	ldr r1, [r4]
	ldr r2, [r4, r2]
	add r3, r4, #4
	bl ov40_02236578
	add r0, r4, #0
	bl ov40_0223655C
	mov r1, #0x69
	lsl r1, r1, #2
	add r0, r4, r1
	add r1, r1, #4
	add r1, r4, r1
	mov r2, #0
	bl ov40_0222D9E8
	mov r0, #0x6d
	str r0, [sp]
	ldr r0, _022366A8 ; =ov40_022452CC
	ldr r2, _022366AC ; =ov40_02236230
	mov r1, #4
	add r3, r5, #0
	bl sub_02026C44
	mov r1, #0x33
	lsl r1, r1, #4
	str r0, [r4, r1]
	mov r0, #0x6d
	str r0, [sp]
	ldr r0, _022366B0 ; =ov40_022452F4
	ldr r2, _022366B4 ; =ov40_022362E4
	mov r1, #7
	add r3, r5, #0
	bl sub_02026C44
	mov r1, #0xcd
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0x6d
	str r0, [sp]
	ldr r0, _022366B0 ; =ov40_022452F4
	ldr r2, _022366B8 ; =ov40_02236320
	mov r1, #7
	add r3, r5, #0
	bl sub_02026C44
	mov r1, #0xce
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0x6d
	str r0, [sp]
	ldr r0, _022366BC ; =ov40_02245284
	ldr r2, _022366C0 ; =ov40_0223635C
	mov r1, #3
	add r3, r5, #0
	bl sub_02026C44
	mov r1, #0xcf
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0x6d
	str r0, [sp]
	ldr r0, _022366C4 ; =ov40_0224526C
	ldr r2, _022366C8 ; =ov40_022363BC
	mov r1, #2
	add r3, r5, #0
	bl sub_02026C44
	mov r1, #0xd
	lsl r1, r1, #6
	str r0, [r4, r1]
	mov r0, #0x6d
	bl sub_020314A4
	mov r1, #0xe1
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #0x83
	lsl r1, r1, #4
	ldr r1, [r5, r1]
	bl sub_020314C4
	add r0, r5, #0
	mov r1, #1
	bl ov40_0222BF80
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022366A4: .word 0x00002F70
_022366A8: .word ov40_022452CC
_022366AC: .word ov40_02236230
_022366B0: .word ov40_022452F4
_022366B4: .word ov40_022362E4
_022366B8: .word ov40_02236320
_022366BC: .word ov40_02245284
_022366C0: .word ov40_0223635C
_022366C4: .word ov40_0224526C
_022366C8: .word ov40_022363BC
	thumb_func_end ov40_022365A0

	thumb_func_start ov40_022366CC
ov40_022366CC: ; 0x022366CC
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _022366E6
	cmp r1, #1
	beq _02236752
	cmp r1, #2
	beq _02236782
	b _022367AC
_022366E6:
	mov r0, #0x6b
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ov40_0222DA84
	cmp r0, #0
	beq _022366FC
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_022366FC:
	ldr r0, [r5, #0x58]
	mov r3, #0x6b
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	lsl r3, r3, #2
	ldr r3, [r4, r3]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r1, #2
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r5, #0x58]
	mov r3, #0x6b
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	lsl r3, r3, #2
	ldr r3, [r4, r3]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r1, #3
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r5, #0x58]
	mov r3, #0x6b
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	lsl r3, r3, #2
	ldr r3, [r4, r3]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r1, #1
	mov r2, #2
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _022367B2
_02236752:
	mov r1, #1
	bl ov40_02230964
	add r0, r5, #0
	bl ov40_0222D874
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	add r0, r5, #0
	mov r1, #0
	bl ov40_0222FB90
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_020879E0
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _022367B2
_02236782:
	bl ov40_0222FBB4
	cmp r0, #0
	beq _022367B2
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r5, #0
	bl ov40_022364D0
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	bl ov40_02230738
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _022367B2
_022367AC:
	mov r1, #2
	bl ov40_0222BF80
_022367B2:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_022366CC

	thumb_func_start ov40_022367B8
ov40_022367B8: ; 0x022367B8
	push {r4, r5, lr}
	sub sp, #0xc
	mov r1, #0x86
	add r4, r0, #0
	lsl r1, r1, #4
	ldr r5, [r4, r1]
	ldr r1, [r4, #8]
	cmp r1, #3
	bls _022367CC
	b _022368DC
_022367CC:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022367D8: ; jump table
	.short _022367E0 - _022367D8 - 2 ; case 0
	.short _02236822 - _022367D8 - 2 ; case 1
	.short _0223685A - _022367D8 - 2 ; case 2
	.short _02236886 - _022367D8 - 2 ; case 3
_022367E0:
	mov r2, #8
	mov r1, #0x69
	str r2, [sp]
	mov r3, #0x12
	str r3, [sp, #4]
	mov r0, #1
	lsl r1, r1, #2
	str r0, [sp, #8]
	add r0, r5, r1
	add r1, r1, #4
	add r1, r5, r1
	bl ov40_0222D980
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r4, #0
	bl ov40_02237564
	add r0, r4, #0
	bl ov40_02237410
	add r0, r4, #0
	bl ov40_022371A0
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_02236822:
	mov r1, #0x69
	lsl r1, r1, #2
	add r0, r5, r1
	add r1, r1, #4
	mov r2, #1
	add r1, r5, r1
	add r3, r2, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _022368DC
	mov r0, #0x83
	mov r2, #0x1a
	lsl r0, r0, #4
	lsl r2, r2, #4
	ldr r0, [r4, r0]
	ldr r1, [r5]
	ldr r2, [r5, r2]
	add r3, r5, #4
	bl ov40_02236578
	add r0, r5, #0
	bl ov40_0223655C
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022368DC
_0223685A:
	mov r1, #1
	bl ov40_02230964
	add r0, r4, #0
	bl ov40_02237644
	add r0, r4, #0
	mov r1, #1
	bl ov40_02237548
	add r0, r4, #0
	mov r1, #0
	bl ov40_022373E4
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022368DC
_02236886:
	mov r1, #0x69
	lsl r1, r1, #2
	add r0, r5, r1
	add r1, r1, #4
	add r1, r5, r1
	mov r2, #0
	mov r3, #1
	bl ov40_0222DA00
	cmp r0, #0
	beq _022368DC
	mov r1, #0x1b
	lsl r1, r1, #4
	ldr r1, [r5, r1]
	add r0, r4, #0
	bl ov40_022371E4
	add r0, r4, #0
	bl ov40_02237144
	ldr r1, _022368E4 ; =0x0000010E
	add r0, r4, #0
	bl ov40_02237030
	add r0, r4, #0
	mov r1, #0
	bl ov40_02237548
	add r0, r4, #0
	mov r1, #1
	bl ov40_022373E4
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	ldr r0, _022368E8 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	add r0, r4, #0
	mov r1, #3
	bl ov40_0222BF80
_022368DC:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_022368E4: .word 0x0000010E
_022368E8: .word 0x04000050
	thumb_func_end ov40_022367B8

	thumb_func_start ov40_022368EC
ov40_022368EC: ; 0x022368EC
	push {r4, lr}
	mov r2, #0x86
	lsl r2, r2, #4
	ldr r4, [r0, r2]
	cmp r1, #0
	bne _02236920
	mov r0, #0xda
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_0200DCE8
	mov r0, #0xdb
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_020137C0
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x20
	mov r2, #0xe8
	bl sub_0200DDB8
	b _02236946
_02236920:
	mov r0, #0xda
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DCE8
	mov r0, #0xdb
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_020137C0
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x50
	mov r2, #0xe8
	bl sub_0200DDB8
_02236946:
	mov r0, #0x35
	lsl r0, r0, #4
	mov r1, #0x24
	add r2, r1, #0
	ldr r0, [r4, r0]
	sub r2, #0x2c
	bl sub_020136B4
	mov r0, #0xdb
	lsl r0, r0, #2
	mov r1, #0x24
	add r2, r1, #0
	ldr r0, [r4, r0]
	sub r2, #0x2c
	bl sub_020136B4
	pop {r4, pc}
	thumb_func_end ov40_022368EC

	thumb_func_start ov40_02236968
ov40_02236968: ; 0x02236968
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _02236980
	cmp r0, #1
	beq _022369F6
	b _02236A4E
_02236980:
	ldr r0, _02236A54 ; =0x000006F4
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_020879E0
	mov r0, #0x6b
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ov40_0222DA84
	mov r1, #0x69
	lsl r1, r1, #2
	add r0, r4, r1
	add r1, r1, #4
	add r1, r4, r1
	mov r2, #1
	mov r3, #2
	bl ov40_0222DA00
	cmp r0, #0
	beq _022369D8
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #0x24]
	mov r1, #0x4f
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add r0, r5, #0
	bl ov40_02236F38
	add r0, r5, #0
	mov r1, #1
	bl ov40_022368EC
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_022369D8:
	ldr r0, [r5, #0x58]
	mov r3, #0x6b
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	lsl r3, r3, #2
	ldr r3, [r4, r3]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r1, #3
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02236A4E
_022369F6:
	mov r0, #0x6b
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	bl ov40_0222DA84
	mov r1, #0x69
	lsl r1, r1, #2
	add r0, r4, r1
	add r1, r1, #4
	add r1, r4, r1
	mov r2, #0
	mov r3, #2
	bl ov40_0222DA00
	cmp r0, #0
	beq _02236A32
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	add r0, r5, #0
	mov r1, #6
	bl ov40_0222BF80
	mov r1, #0x11
	add r0, r5, #0
	lsl r1, r1, #4
	bl ov40_02237030
_02236A32:
	ldr r0, [r5, #0x58]
	mov r3, #0x6b
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	lsl r3, r3, #2
	ldr r3, [r4, r3]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r1, #3
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
_02236A4E:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02236A54: .word 0x000006F4
	thumb_func_end ov40_02236968

	thumb_func_start ov40_02236A58
ov40_02236A58: ; 0x02236A58
	push {r3, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r1, [r0, r1]
	mov r0, #0xcd
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl sub_02026CC4
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov40_02236A58

	thumb_func_start ov40_02236A70
ov40_02236A70: ; 0x02236A70
	push {r3, r4, r5, lr}
	sub sp, #0x10
	mov r1, #0x86
	add r4, r0, #0
	lsl r1, r1, #4
	ldr r5, [r4, r1]
	bl ov40_0223D5CC
	cmp r0, #0
	bne _02236A8A
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, pc}
_02236A8A:
	ldr r0, [r4, #8]
	cmp r0, #7
	bls _02236A92
	b _02236C48
_02236A92:
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02236A9E: ; jump table
	.short _02236AAE - _02236A9E - 2 ; case 0
	.short _02236ACC - _02236A9E - 2 ; case 1
	.short _02236B18 - _02236A9E - 2 ; case 2
	.short _02236B5E - _02236A9E - 2 ; case 3
	.short _02236B62 - _02236A9E - 2 ; case 4
	.short _02236BA4 - _02236A9E - 2 ; case 5
	.short _02236BCE - _02236A9E - 2 ; case 6
	.short _02236C26 - _02236A9E - 2 ; case 7
_02236AAE:
	add r0, r4, #0
	bl ov40_02236FE0
	ldr r0, _02236C58 ; =0x000006F4
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_020879E0
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_02236ACC:
	mov r2, #8
	mov r1, #0x69
	str r2, [sp]
	mov r3, #0x12
	str r3, [sp, #4]
	mov r0, #1
	lsl r1, r1, #2
	str r0, [sp, #8]
	add r0, r5, r1
	add r1, r1, #4
	add r1, r5, r1
	bl ov40_0222D980
	add r0, r4, #0
	bl ov40_02237564
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r4, #0
	bl ov40_02237410
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	add r0, r4, #0
	bl ov40_022371A0
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02236C50
_02236B18:
	mov r0, #0x6b
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	bl ov40_0222DA84
	mov r1, #0x69
	lsl r1, r1, #2
	add r0, r5, r1
	add r1, r1, #4
	add r1, r5, r1
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _02236B40
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_02236B40:
	ldr r0, [r4, #0x58]
	mov r3, #0x6b
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	lsl r3, r3, #2
	ldr r3, [r5, r3]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r1, #3
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02236C50
_02236B5E:
	add r0, r0, #1
	str r0, [r4, #8]
_02236B62:
	mov r1, #0x6f
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	add r0, r4, #0
	mov r2, #0x80
	mov r3, #0x60
	bl ov40_0223077C
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	mov r1, #0x18
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl sub_02087A08
	mov r1, #0x12
	add r0, r4, #0
	lsl r1, r1, #4
	bl ov40_0222DED0
	ldr r0, _02236C5C ; =0x0000057D
	bl PlaySE
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02236C50
_02236BA4:
	add r0, r4, #0
	bl ov40_0223D540
	mov r1, #0x1a
	lsl r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0xe
	str r1, [sp]
	lsl r2, r2, #6
	ldr r1, [r5, r2]
	add r2, r2, #4
	ldr r2, [r5, r2]
	ldr r3, [r5]
	bl ov39_02227420
	cmp r0, #1
	bne _02236C50
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02236C50
_02236BCE:
	add r0, r4, #0
	bl ov40_0222DFB0
	add r0, r4, #0
	bl ov40_0223D540
	add r1, sp, #0xc
	bl ov39_02227D44
	cmp r0, #1
	ldr r0, _02236C5C ; =0x0000057D
	bne _02236C02
	mov r1, #0
	bl StopSE
	ldr r3, [sp, #0xc]
	add r0, r4, #0
	ldr r2, [r3, #0xc]
	ldr r3, [r3, #4]
	mov r1, #2
	bl ov40_02230CDC
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02236C50
_02236C02:
	mov r1, #0
	bl StopSE
	add r0, r4, #0
	mov r1, #0x25
	bl ov40_0222FB28
	add r0, r4, #0
	mov r1, #1
	bl ov40_0222DD8C
	ldr r0, _02236C60 ; =0x00000577
	bl PlaySE
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02236C50
_02236C26:
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	mov r1, #0
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl sub_02087A08
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02236C50
_02236C48:
	add r0, r4, #0
	mov r1, #0xa
	bl ov40_0222BF80
_02236C50:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_02236C58: .word 0x000006F4
_02236C5C: .word 0x0000057D
_02236C60: .word 0x00000577
	thumb_func_end ov40_02236A70

	thumb_func_start ov40_02236C64
ov40_02236C64: ; 0x02236C64
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _02236C80
	cmp r0, #1
	beq _02236C9E
	cmp r0, #2
	beq _02236D04
	b _02236D52
_02236C80:
	ldr r0, _02236D58 ; =0x000006F4
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_020879E0
	add r0, r5, #0
	bl ov40_02236FE0
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_02236C9E:
	mov r0, #0x6b
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ov40_0222DA84
	mov r1, #0x69
	lsl r1, r1, #2
	add r0, r4, r1
	add r1, r1, #4
	add r1, r4, r1
	mov r2, #1
	mov r3, #2
	bl ov40_0222DA00
	cmp r0, #0
	beq _02236CE6
	add r0, r5, #0
	mov r1, #0
	bl ov40_022368EC
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #0x24]
	mov r1, #0x4d
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_02236CE6:
	ldr r0, [r5, #0x58]
	mov r3, #0x6b
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	lsl r3, r3, #2
	ldr r3, [r4, r3]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r1, #3
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02236D52
_02236D04:
	mov r0, #0x6b
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	bl ov40_0222DA84
	mov r1, #0x69
	lsl r1, r1, #2
	add r0, r4, r1
	add r1, r1, #4
	add r1, r4, r1
	mov r2, #0
	mov r3, #2
	bl ov40_0222DA00
	cmp r0, #0
	beq _02236D36
	ldr r1, _02236D5C ; =0x0000010E
	add r0, r5, #0
	bl ov40_02237030
	add r0, r5, #0
	mov r1, #3
	bl ov40_0222BF80
_02236D36:
	ldr r0, [r5, #0x58]
	mov r3, #0x6b
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	lsl r3, r3, #2
	ldr r3, [r4, r3]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r1, #3
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
_02236D52:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02236D58: .word 0x000006F4
_02236D5C: .word 0x0000010E
	thumb_func_end ov40_02236C64

	thumb_func_start ov40_02236D60
ov40_02236D60: ; 0x02236D60
	push {r4, r5, lr}
	sub sp, #0xc
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _02236D7C
	cmp r1, #1
	beq _02236DC6
	cmp r1, #2
	beq _02236E0C
	b _02236E12
_02236D7C:
	mov r2, #8
	mov r1, #0x69
	str r2, [sp]
	mov r3, #0x12
	str r3, [sp, #4]
	mov r0, #1
	lsl r1, r1, #2
	str r0, [sp, #8]
	add r0, r4, r1
	add r1, r1, #4
	add r1, r4, r1
	bl ov40_0222D980
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r5, #0
	bl ov40_02237564
	add r0, r5, #0
	bl ov40_02237410
	add r0, r5, #0
	bl ov40_022371A0
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_02236DC6:
	mov r0, #0x6b
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ov40_0222DA84
	mov r1, #0x69
	lsl r1, r1, #2
	add r0, r4, r1
	add r1, r1, #4
	add r1, r4, r1
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _02236DEE
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_02236DEE:
	ldr r0, [r5, #0x58]
	mov r3, #0x6b
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	lsl r3, r3, #2
	ldr r3, [r4, r3]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r1, #3
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02236E12
_02236E0C:
	mov r1, #0xa
	bl ov40_0222BF80
_02236E12:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov40_02236D60

	thumb_func_start ov40_02236E18
ov40_02236E18: ; 0x02236E18
	push {r4, r5, lr}
	sub sp, #0xc
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _02236E34
	cmp r1, #1
	beq _02236E60
	cmp r1, #2
	beq _02236EA6
	b _02236EAC
_02236E34:
	bl ov40_02236FE0
	mov r2, #8
	mov r1, #0x69
	str r2, [sp]
	mov r3, #0x12
	str r3, [sp, #4]
	mov r0, #1
	lsl r1, r1, #2
	str r0, [sp, #8]
	add r0, r4, r1
	add r1, r1, #4
	add r1, r4, r1
	bl ov40_0222D980
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_02236E60:
	mov r0, #0x6b
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ov40_0222DA84
	mov r1, #0x69
	lsl r1, r1, #2
	add r0, r4, r1
	add r1, r1, #4
	add r1, r4, r1
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _02236E88
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_02236E88:
	ldr r0, [r5, #0x58]
	mov r3, #0x6b
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	lsl r3, r3, #2
	ldr r3, [r4, r3]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r1, #3
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02236EAC
_02236EA6:
	mov r1, #0xd
	bl ov40_0222BF80
_02236EAC:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_02236E18

	thumb_func_start ov40_02236EB4
ov40_02236EB4: ; 0x02236EB4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r0, [sp, #0x14]
	mov r0, #0
	str r0, [sp, #0x18]
	mov r1, #0x86
	ldr r6, _02236F2C ; =0x00000101
	ldr r0, [sp, #0x14]
	lsl r1, r1, #4
	ldr r1, [r0, r1]
	add r0, r6, #0
	add r0, #0xb3
	ldr r5, _02236F30 ; =ov40_022452B4
	ldr r7, _02236F34 ; =ov40_02245290
	add r4, r1, r0
_02236ED2:
	add r0, r4, #0
	bl InitWindow
	ldrb r0, [r5, #1]
	add r1, r4, #0
	mov r2, #2
	str r0, [sp]
	ldrb r0, [r5, #2]
	str r0, [sp, #4]
	ldrb r0, [r5, #3]
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	lsl r0, r6, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldrb r3, [r5]
	ldr r0, [r0, #0x24]
	bl AddWindowParameterized
	ldr r1, [r7]
	add r0, r4, #0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl FillWindowPixelBuffer
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	ldrb r1, [r5, #2]
	ldrb r0, [r5, #3]
	add r4, #0x10
	add r5, r5, #4
	mul r0, r1
	add r6, r6, r0
	ldr r0, [sp, #0x18]
	add r7, r7, #4
	add r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, #3
	blt _02236ED2
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02236F2C: .word 0x00000101
_02236F30: .word ov40_022452B4
_02236F34: .word ov40_02245290
	thumb_func_end ov40_02236EB4

	thumb_func_start ov40_02236F38
ov40_02236F38: ; 0x02236F38
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	mov r1, #0x86
	lsl r1, r1, #4
	str r0, [sp, #0x14]
	ldr r1, [r0, r1]
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r5, _02236FD8 ; =ov40_022452DC
	mov r6, #1
	mov r7, #0
	add r4, r1, r0
_02236F50:
	add r0, r4, #0
	bl InitWindow
	ldrb r0, [r5, #1]
	add r1, r4, #0
	mov r2, #6
	str r0, [sp]
	ldrb r0, [r5, #2]
	str r0, [sp, #4]
	ldrb r0, [r5, #3]
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	lsl r0, r6, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldrb r3, [r5]
	ldr r0, [r0, #0x24]
	bl AddWindowParameterized
	ldr r0, [sp, #0x14]
	add r1, r7, #0
	ldr r0, [r0, #0x48]
	add r1, #0x3c
	bl NewString_ReadMsgData
	str r0, [sp, #0x18]
	ldr r1, [sp, #0x18]
	add r0, r4, #0
	bl ov40_022306C0
	str r0, [sp, #0x1c]
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02236FDC ; =0x000F0D00
	ldr r2, [sp, #0x18]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r3, [sp, #0x1c]
	add r0, r4, #0
	mov r1, #0
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	ldr r0, [sp, #0x18]
	bl String_dtor
	ldrb r1, [r5, #2]
	ldrb r0, [r5, #3]
	add r7, r7, #1
	add r4, #0x10
	mul r0, r1
	add r6, r6, r0
	add r5, r5, #4
	cmp r7, #6
	blo _02236F50
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02236FD8: .word ov40_022452DC
_02236FDC: .word 0x000F0D00
	thumb_func_end ov40_02236F38

	thumb_func_start ov40_02236FE0
ov40_02236FE0: ; 0x02236FE0
	push {r3, r4, r5, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r1, [r0, r1]
	mov r0, #0x8d
	lsl r0, r0, #2
	mov r4, #0
	add r5, r1, r0
_02236FF0:
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #6
	blo _02236FF0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_02236FE0

	thumb_func_start ov40_02237008
ov40_02237008: ; 0x02237008
	push {r3, r4, r5, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r1, [r0, r1]
	mov r0, #0x6d
	lsl r0, r0, #2
	mov r4, #0
	add r5, r1, r0
_02237018:
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #3
	blt _02237018
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_02237008

	thumb_func_start ov40_02237030
ov40_02237030: ; 0x02237030
	push {r4, r5, r6, lr}
	sub sp, #0x10
	mov r2, #0x86
	lsl r2, r2, #4
	ldr r5, [r0, r2]
	mov r6, #0x75
	ldr r0, [r0, #0x48]
	lsl r6, r6, #2
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r5, r6
	mov r1, #0xcc
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02237078 ; =0x000F0D00
	add r2, r4, #0
	str r0, [sp, #8]
	add r0, r5, r6
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, r6
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	bl String_dtor
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_02237078: .word 0x000F0D00
	thumb_func_end ov40_02237030

	thumb_func_start ov40_0223707C
ov40_0223707C: ; 0x0223707C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	mov r1, #0xe
	lsl r1, r1, #6
	ldr r1, [r4, r1]
	ldr r0, [r5, #0x48]
	add r1, #0x1c
	bl NewString_ReadMsgData
	str r0, [sp, #0x10]
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	add r6, r0, #0
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	add r7, r0, #0
	mov r0, #0x6d
	bl ov40_0222DAB0
	ldr r1, _0223713C ; =0x000004D4
	str r0, [sp, #0x14]
	ldr r1, [r5, r1]
	add r0, r6, #0
	lsl r1, r1, #2
	add r2, r4, r1
	mov r1, #0xe3
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	bl CopyU16ArrayToString
	add r0, r5, #0
	add r1, r6, #0
	bl ov40_02230DCC
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r1, #0
	ldr r0, [sp, #0x14]
	add r2, r6, #0
	add r3, r1, #0
	bl BufferString
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0x10]
	add r1, r7, #0
	bl StringExpandPlaceholders
	mov r0, #0x75
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0xcc
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02237140 ; =0x000F0D00
	add r2, r7, #0
	str r0, [sp, #8]
	mov r0, #0x75
	lsl r0, r0, #2
	add r0, r4, r0
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	mov r0, #0x75
	lsl r0, r0, #2
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	ldr r0, [sp, #0x10]
	bl String_dtor
	add r0, r6, #0
	bl String_dtor
	add r0, r7, #0
	bl String_dtor
	ldr r0, [sp, #0x14]
	bl ScrStrBufs_delete
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223713C: .word 0x000004D4
_02237140: .word 0x000F0D00
	thumb_func_end ov40_0223707C

	thumb_func_start ov40_02237144
ov40_02237144: ; 0x02237144
	push {r4, r5, r6, lr}
	sub sp, #0x10
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r5, [r0, r1]
	mov r6, #0x71
	mov r0, #0xff
	mov r1, #0x6d
	lsl r6, r6, #2
	bl String_ctor
	add r1, r5, #4
	add r4, r0, #0
	bl CopyU16ArrayToString
	add r0, r5, r6
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, r6
	add r1, r4, #0
	bl ov40_022306C0
	add r3, r0, #0
	mov r0, #4
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0223719C ; =0x000F0100
	mov r1, #0
	str r0, [sp, #8]
	add r0, r5, r6
	add r2, r4, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, r6
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	bl String_dtor
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0223719C: .word 0x000F0100
	thumb_func_end ov40_02237144

	thumb_func_start ov40_022371A0
ov40_022371A0: ; 0x022371A0
	push {r4, r5, r6, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r1, [r0, r1]
	mov r0, #0x6d
	lsl r0, r0, #2
	ldr r5, _022371D0 ; =ov40_02245290
	mov r6, #0
	add r4, r1, r0
_022371B2:
	ldr r1, [r5]
	add r0, r4, #0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl FillWindowPixelBuffer
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add r6, r6, #1
	add r4, #0x10
	add r5, r5, #4
	cmp r6, #2
	blt _022371B2
	pop {r4, r5, r6, pc}
	.balign 4, 0
_022371D0: .word ov40_02245290
	thumb_func_end ov40_022371A0

	thumb_func_start ov40_022371D4
ov40_022371D4: ; 0x022371D4
	and r0, r1
	cmp r1, r0
	bne _022371DE
	mov r0, #1
	bx lr
_022371DE:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov40_022371D4

	thumb_func_start ov40_022371E4
ov40_022371E4: ; 0x022371E4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x1fc
	sub sp, #0x14
	add r5, r1, #0
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r4, [r0, r1]
	mov r7, #0x6d
	lsl r7, r7, #2
	add r0, r4, r7
	mov r1, #0
	bl FillWindowPixelBuffer
	lsl r0, r5, #1
	add r0, r4, r0
	ldrh r6, [r0, #0x2c]
	cmp r6, #0
	bne _02237214
	add r0, r4, r7
	bl ScheduleWindowCopyToVram
	add sp, #0x1fc
	add sp, #0x14
	pop {r3, r4, r5, r6, r7, pc}
_02237214:
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	add r2, r7, #0
	sub r2, #0x5c
	add r5, r0, #0
	ldr r0, [r4, r2]
	add r2, #0x58
	ldr r2, [r4, r2]
	mov r1, #1
	lsl r1, r2
	bl ov40_022371D4
	cmp r0, #1
	bne _02237238
	add r6, r7, #0
	add r6, #0x3a
_02237238:
	add r0, r6, #0
	mov r1, #0x6d
	add r2, sp, #0x10
	bl GetSpeciesNameIntoArray
	add r0, r5, #0
	add r1, sp, #0x10
	bl CopyU16ArrayToString
	add r0, r4, r7
	add r1, r5, #0
	bl ov40_022306C0
	add r3, r0, #0
	mov r0, #6
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02237280 ; =0x000F0D00
	mov r1, #0
	str r0, [sp, #8]
	add r0, r4, r7
	add r2, r5, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r4, r7
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	bl String_dtor
	add sp, #0x1fc
	add sp, #0x14
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02237280: .word 0x000F0D00
	thumb_func_end ov40_022371E4

	thumb_func_start ov40_02237284
ov40_02237284: ; 0x02237284
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x60
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r1, [r0, r1]
	ldr r4, [r0, #0x28]
	str r1, [sp, #0x24]
	ldr r1, [r0, #0x18]
	str r1, [sp, #0x20]
	ldr r1, [r0, #0x1c]
	str r1, [sp, #0x1c]
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
	ldr r0, _022373E0 ; =0x000186A0
	ldr r2, [sp, #0x20]
	str r0, [sp, #0x14]
	ldr r3, [sp, #0x1c]
	add r0, r4, #0
	mov r1, #2
	bl sub_0200D644
	bl sub_0207449C
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _022373E0 ; =0x000186A0
	ldr r1, [sp, #0x1c]
	str r0, [sp, #4]
	ldr r0, [sp, #0x20]
	mov r2, #0x14
	bl sub_0200D6D4
	bl sub_020744A8
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _022373E0 ; =0x000186A0
	ldr r1, [sp, #0x1c]
	str r0, [sp, #4]
	ldr r0, [sp, #0x20]
	mov r2, #0x14
	bl sub_0200D704
	ldr r7, [sp, #0x24]
	mov r4, #0
	add r5, r7, #0
_022372F6:
	ldr r0, [sp, #0x24]
	ldrh r6, [r7, #0x2c]
	add r1, r0, r4
	mov r0, #0x57
	lsl r0, r0, #2
	ldrb r0, [r1, r0]
	ldr r1, [sp, #0x24]
	str r0, [sp, #0x18]
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #1
	lsl r1, r4
	bl ov40_022371D4
	str r0, [sp, #0x28]
	cmp r6, #0
	beq _022373D2
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x18]
	add r0, r6, #0
	bl GetMonIconNaixEx
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _022373E0 ; =0x000186A0
	ldr r1, [sp, #0x1c]
	add r0, r4, r0
	str r0, [sp, #8]
	ldr r0, [sp, #0x20]
	mov r2, #0x14
	bl sub_0200E188
	add r0, r4, #0
	mov r1, #6
	bl _s32_div_f
	add r2, r1, #0
	mov r0, #0x18
	mul r2, r0
	add r2, #0x6e
	add r0, sp, #0x2c
	strh r2, [r0]
	add r0, r4, #0
	mov r1, #6
	bl _s32_div_f
	mov r1, #0x16
	mul r1, r0
	add r1, #0x30
	add r0, sp, #0x2c
	strh r1, [r0, #2]
	mov r1, #0
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	add r0, r1, #0
	str r0, [sp, #0x34]
	str r0, [sp, #0x38]
	mov r0, #1
	str r0, [sp, #0x3c]
	add r0, r1, #0
	str r0, [sp, #0x58]
	str r0, [sp, #0x5c]
	ldr r0, _022373E0 ; =0x000186A0
	add r2, sp, #0x2c
	add r0, r4, r0
	str r0, [sp, #0x40]
	ldr r0, _022373E0 ; =0x000186A0
	str r0, [sp, #0x44]
	str r0, [sp, #0x48]
	str r0, [sp, #0x4c]
	sub r0, r1, #1
	str r0, [sp, #0x50]
	sub r0, r1, #1
	str r0, [sp, #0x54]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x1c]
	bl sub_0200D734
	mov r1, #0xad
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x28]
	add r0, r6, #0
	bl GetMonIconPaletteEx
	add r1, r0, #0
	mov r0, #0xad
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r1, #4
	bl sub_0200DD24
	mov r0, #0xad
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_0200DC4C
	mov r0, #0xad
	lsl r0, r0, #2
	mov r1, #0x1e
	ldr r0, [r5, r0]
	sub r1, r1, r4
	bl sub_0200DD68
_022373D2:
	add r4, r4, #1
	add r7, r7, #2
	add r5, r5, #4
	cmp r4, #0x1e
	blt _022372F6
	add sp, #0x60
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022373E0: .word 0x000186A0
	thumb_func_end ov40_02237284

	thumb_func_start ov40_022373E4
ov40_022373E4: ; 0x022373E4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r4, [r0, r1]
	mov r6, #0
	add r5, r4, #0
_022373F2:
	ldrh r0, [r4, #0x2c]
	cmp r0, #0
	beq _02237404
	mov r0, #0xad
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r7, #0
	bl sub_0200DCE8
_02237404:
	add r6, r6, #1
	add r4, r4, #2
	add r5, r5, #4
	cmp r6, #0x1e
	blt _022373F2
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov40_022373E4

	thumb_func_start ov40_02237410
ov40_02237410: ; 0x02237410
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r7, r0]
	ldr r0, [r7, #0x1c]
	ldr r1, _02237470 ; =0x000186A0
	bl sub_0200D968
	ldr r0, [r7, #0x1c]
	ldr r1, _02237470 ; =0x000186A0
	bl sub_0200D978
	ldr r0, [r7, #0x1c]
	ldr r1, _02237470 ; =0x000186A0
	bl sub_0200D988
	mov r6, #0
	add r5, r4, #0
_02237436:
	ldrh r0, [r4, #0x2c]
	cmp r0, #0
	beq _02237462
	mov r0, #0xad
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02237462
	ldr r1, _02237470 ; =0x000186A0
	ldr r0, [r7, #0x1c]
	add r1, r6, r1
	bl sub_0200D958
	mov r0, #0xad
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200D9DC
	mov r0, #0xad
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
_02237462:
	add r6, r6, #1
	add r4, r4, #2
	add r5, r5, #4
	cmp r6, #0x1e
	blt _02237436
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02237470: .word 0x000186A0
	thumb_func_end ov40_02237410

	thumb_func_start ov40_02237474
ov40_02237474: ; 0x02237474
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	mov r1, #0x86
	lsl r1, r1, #4
	str r0, [sp, #0x10]
	ldr r4, [r0, r1]
	mov r0, #0x1b
	lsl r0, r0, #4
	ldr r2, [r4, r0]
	lsl r1, r2, #2
	add r1, r4, r1
	add r3, r1, #0
	add r3, #0xe0
	ldr r3, [r3]
	add r5, r4, r2
	str r3, [sp, #0x14]
	add r3, r0, #0
	sub r3, #0x54
	ldrb r7, [r5, r3]
	lsl r3, r2, #1
	add r3, r4, r3
	ldrh r5, [r3, #0x2c]
	ldr r6, [r1, #0x68]
	cmp r5, #0
	bne _022374B2
	mov r0, #0xcb
	mov r1, #0
	lsl r0, r0, #2
	add sp, #0x34
	str r1, [r4, r0]
	pop {r4, r5, r6, r7, pc}
_022374B2:
	sub r0, #0x58
	mov r1, #1
	ldr r0, [r4, r0]
	lsl r1, r2
	bl ov40_022371D4
	cmp r0, #1
	bne _022374D0
	ldr r0, _02237540 ; =0x000001EA
	cmp r5, r0
	bne _022374CC
	mov r7, #1
	b _022374CE
_022374CC:
	mov r7, #0
_022374CE:
	ldr r5, _02237544 ; =0x000001EE
_022374D0:
	add r0, r5, #0
	mov r1, #0x6d
	bl AllocAndLoadMonPersonal
	str r0, [sp, #0x18]
	add r0, r5, #0
	add r1, r6, #0
	bl GetGenderBySpeciesAndPersonality
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x14]
	add r1, r6, #0
	bl CalcShininessByOtIdAndPersonality
	lsl r3, r7, #0x18
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x1c]
	add r0, r5, #0
	mov r2, #2
	lsr r3, r3, #0x18
	str r6, [sp]
	bl sub_020708D8
	ldr r0, [sp, #0x20]
	ldr r2, [sp, #0x1c]
	str r0, [sp]
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	add r0, sp, #0x24
	add r1, r5, #0
	mov r3, #2
	str r6, [sp, #8]
	bl GetMonSpriteCharAndPlttNarcIdsEx
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	add r1, sp, #0x24
	ldr r0, [r0, #0x64]
	mov r2, #0x2a
	mov r3, #0x5b
	bl sub_020085EC
	mov r1, #0xcb
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [sp, #0x18]
	bl FreeMonPersonal
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_02237540: .word 0x000001EA
_02237544: .word 0x000001EE
	thumb_func_end ov40_02237474

	thumb_func_start ov40_02237548
ov40_02237548: ; 0x02237548
	push {r3, lr}
	add r2, r1, #0
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r1, [r0, r1]
	mov r0, #0xcb
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _02237562
	mov r1, #6
	bl sub_020087A4
_02237562:
	pop {r3, pc}
	thumb_func_end ov40_02237548

	thumb_func_start ov40_02237564
ov40_02237564: ; 0x02237564
	push {r3, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r1, [r0, r1]
	mov r0, #0xcb
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0223757A
	bl sub_02008780
_0223757A:
	pop {r3, pc}
	thumb_func_end ov40_02237564

	thumb_func_start ov40_0223757C
ov40_0223757C: ; 0x0223757C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	sub r0, #0x30
	ldr r0, [r5, r0]
	bl GetStoragePCPointer
	ldr r0, _0223763C ; =0x0000017A
	ldrb r1, [r4, r0]
	cmp r1, #0x10
	blo _022375A0
	cmp r1, #0x18
	bhs _022375A0
	mov r1, #0
	strb r1, [r4, r0]
_022375A0:
	ldr r0, _0223763C ; =0x0000017A
	ldrb r1, [r4, r0]
	cmp r1, #0x28
	blo _022375AC
	mov r1, #0
	strb r1, [r4, r0]
_022375AC:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r1, _0223763C ; =0x0000017A
	ldr r0, [r5, #0x14]
	ldrb r2, [r4, r1]
	mov r3, #3
	lsl r1, r2, #1
	add r1, r2, r1
	ldr r2, [r5, #0x24]
	add r1, #0x8a
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r1, _0223763C ; =0x0000017A
	ldr r0, [r5, #0x14]
	ldrb r2, [r4, r1]
	mov r3, #3
	lsl r1, r2, #1
	add r1, r2, r1
	ldr r2, [r5, #0x24]
	add r1, #0x8c
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	mov r0, #0x40
	str r0, [sp, #4]
	mov r0, #0xc0
	mov r1, #0xbf
	str r0, [sp, #8]
	add r2, r1, #0
	str r0, [sp, #0xc]
	add r2, #0xbb
	ldrb r3, [r4, r2]
	ldr r0, [r5, #0x28]
	lsl r2, r3, #1
	add r2, r3, r2
	add r2, #0x8b
	mov r3, #0x6d
	bl PaletteData_LoadFromNarc
	add r0, r5, #0
	bl ov40_02237474
	add r0, r5, #0
	bl ov40_02237284
	mov r1, #0x1b
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	add r0, r5, #0
	bl ov40_022371E4
	add r0, r5, #0
	bl ov40_02237144
	ldr r1, _02237640 ; =0x0000010E
	add r0, r5, #0
	bl ov40_02237030
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0223763C: .word 0x0000017A
_02237640: .word 0x0000010E
	thumb_func_end ov40_0223757C

	thumb_func_start ov40_02237644
ov40_02237644: ; 0x02237644
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	sub r0, #0x30
	ldr r0, [r5, r0]
	bl GetStoragePCPointer
	ldr r1, _022376F8 ; =0x0000017A
	ldrb r2, [r4, r1]
	cmp r2, #0x10
	blo _02237668
	cmp r2, #0x18
	bhs _02237668
	mov r2, #0
	strb r2, [r4, r1]
_02237668:
	ldr r1, _022376F8 ; =0x0000017A
	ldrb r1, [r4, r1]
	cmp r1, #0x18
	blo _02237684
	cmp r1, #0x20
	bhs _02237684
	sub r1, #0x18
	bl PCStorage_IsBonusWallpaperUnlocked
	cmp r0, #0
	bne _02237684
	ldr r0, _022376F8 ; =0x0000017A
	mov r1, #0
	strb r1, [r4, r0]
_02237684:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r1, _022376F8 ; =0x0000017A
	ldr r0, [r5, #0x14]
	ldrb r2, [r4, r1]
	mov r3, #3
	lsl r1, r2, #1
	add r1, r2, r1
	ldr r2, [r5, #0x24]
	add r1, #0x8a
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r1, _022376F8 ; =0x0000017A
	ldr r0, [r5, #0x14]
	ldrb r2, [r4, r1]
	mov r3, #3
	lsl r1, r2, #1
	add r1, r2, r1
	ldr r2, [r5, #0x24]
	add r1, #0x8c
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	mov r0, #0x40
	str r0, [sp, #4]
	mov r0, #0xc0
	mov r1, #0xbf
	str r0, [sp, #8]
	add r2, r1, #0
	str r0, [sp, #0xc]
	add r2, #0xbb
	ldrb r3, [r4, r2]
	ldr r0, [r5, #0x28]
	lsl r2, r3, #1
	add r2, r3, r2
	add r2, #0x8b
	mov r3, #0x6d
	bl PaletteData_LoadFromNarc
	add r0, r5, #0
	bl ov40_02237474
	add r0, r5, #0
	bl ov40_02237284
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022376F8: .word 0x0000017A
	thumb_func_end ov40_02237644

	thumb_func_start ov40_022376FC
ov40_022376FC: ; 0x022376FC
	push {r3, r4, r5, lr}
	sub sp, #0x10
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _02237718
	cmp r1, #1
	beq _02237792
	cmp r1, #2
	beq _022377D6
	b _02237814
_02237718:
	mov r1, #2
	bl ov40_0222C710
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r5, #0
	bl ov40_02236EB4
	add r0, r5, #0
	bl ov40_0223757C
	add r0, r5, #0
	mov r1, #1
	bl ov40_02237548
	add r0, r5, #0
	mov r1, #0
	bl ov40_022373E4
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #0x24]
	mov r1, #0x3e
	mov r3, #7
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #0x24]
	mov r1, #0x4d
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02237814
_02237792:
	mov r1, #0x69
	lsl r1, r1, #2
	add r0, r4, r1
	add r1, r1, #4
	mov r2, #0
	add r1, r4, r1
	add r3, r2, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _02237814
	add r0, r5, #0
	mov r1, #0
	bl ov40_02237548
	add r0, r5, #0
	mov r1, #1
	bl ov40_022373E4
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	ldr r0, _0223781C ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02237814
_022377D6:
	mov r0, #0x6b
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	bl ov40_0222DA84
	cmp r0, #0
	beq _022377F8
	mov r0, #0x33
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	add r0, #0x14
	str r1, [r4, r0]
	add r0, r5, #0
	mov r1, #3
	bl ov40_0222BF80
_022377F8:
	ldr r0, [r5, #0x58]
	mov r3, #0x6b
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	lsl r3, r3, #2
	ldr r3, [r4, r3]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r1, #3
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
_02237814:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0223781C: .word 0x04000050
	thumb_func_end ov40_022376FC

	thumb_func_start ov40_02237820
ov40_02237820: ; 0x02237820
	push {r3, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r1, [r0, r1]
	mov r0, #0xd1
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl sub_02026CC4
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov40_02237820

	thumb_func_start ov40_02237838
ov40_02237838: ; 0x02237838
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r7, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _0223784E
	cmp r1, #1
	beq _02237888
	b _022378DE
_0223784E:
	bl ov40_02237410
	add r0, r5, #0
	bl ov40_02237564
	add r0, r5, #0
	bl ov40_02237008
	add r0, r5, #0
	bl ov40_02236534
	ldr r0, _02237974 ; =0x000006F4
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_020878B0
	ldr r0, _02237974 ; =0x000006F4
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_020879E0
	add r0, r5, #0
	mov r1, #1
	bl ov40_0222FB90
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02237970
_02237888:
	bl ov40_0222FBB4
	cmp r0, #0
	beq _02237970
	mov r6, #0
	add r4, r7, #0
_02237894:
	mov r0, #0x33
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02026CAC
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #5
	blt _02237894
	mov r0, #0x6b
	lsl r0, r0, #2
	add r0, r7, r0
	bl ov40_0222DAA8
	add r0, r5, #0
	bl ov40_0222D88C
	ldr r0, [r5, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02237970
_022378DE:
	mov r0, #0x6b
	lsl r0, r0, #2
	add r0, r7, r0
	mov r1, #0
	bl ov40_0222DA84
	cmp r0, #0
	beq _02237938
	add r0, r5, #0
	bl ov40_0222DD08
	mov r0, #0x6b
	lsl r0, r0, #2
	add r0, r7, r0
	bl ov40_0222DAA8
	ldr r0, [r5, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r5, #0x28]
	mov r2, #0xc
	mov r3, #0x10
	bl sub_02003EA4
	mov r1, #1
	ldr r3, [r5, #0x10]
	add r0, r5, #0
	add r2, r1, #0
	bl ov40_0222BF64
	add r0, r5, #0
	mov r1, #5
	bl ov40_0222BF80
	mov r0, #0xe1
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	bl sub_020314BC
	add r0, r7, #0
	bl FreeToHeap
	b _02237970
_02237938:
	ldr r0, [r5, #0x58]
	mov r3, #0x6b
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	lsl r3, r3, #2
	ldr r3, [r7, r3]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r1, #1
	mov r2, #2
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r5, #0x58]
	mov r3, #0x6b
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	lsl r3, r3, #2
	ldr r3, [r7, r3]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r1, #3
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
_02237970:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02237974: .word 0x000006F4
	thumb_func_end ov40_02237838

	thumb_func_start ov40_02237978
ov40_02237978: ; 0x02237978
	push {r3, r4, r5, lr}
	sub sp, #0x10
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _02237994
	cmp r1, #1
	beq _02237A1E
	cmp r1, #2
	beq _02237A5A
	b _02237A98
_02237994:
	mov r1, #1
	bl ov40_02230964
	add r0, r5, #0
	mov r1, #2
	bl ov40_0222C710
	add r0, r5, #0
	bl ov40_02236EB4
	ldr r1, _02237AA0 ; =0x00000113
	add r0, r5, #0
	bl ov40_02237030
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #0x24]
	mov r1, #0x3e
	mov r3, #7
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #0x24]
	mov r1, #0x4f
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add r0, r5, #0
	bl ov40_02236F38
	add r0, r5, #0
	mov r1, #1
	bl ov40_022368EC
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02237A98
_02237A1E:
	mov r1, #0x69
	lsl r1, r1, #2
	add r0, r4, r1
	add r1, r1, #4
	mov r2, #0
	add r1, r4, r1
	add r3, r2, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _02237A98
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r0, _02237AA4 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02237A98
_02237A5A:
	mov r0, #0x6b
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	bl ov40_0222DA84
	cmp r0, #0
	beq _02237A7C
	mov r0, #0xce
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r0, #0xc
	str r1, [r4, r0]
	add r0, r5, #0
	mov r1, #3
	bl ov40_0222BF80
_02237A7C:
	ldr r0, [r5, #0x58]
	mov r3, #0x6b
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	lsl r3, r3, #2
	ldr r3, [r4, r3]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r1, #3
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
_02237A98:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_02237AA0: .word 0x00000113
_02237AA4: .word 0x04000050
	thumb_func_end ov40_02237978

	thumb_func_start ov40_02237AA8
ov40_02237AA8: ; 0x02237AA8
	push {r3, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r1, [r0, r1]
	mov r0, #0xce
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl sub_02026CC4
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov40_02237AA8

	thumb_func_start ov40_02237AC0
ov40_02237AC0: ; 0x02237AC0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	mov r1, #0x86
	lsl r1, r1, #4
	str r0, [sp, #0x14]
	ldr r0, [r0, r1]
	ldr r1, _02237B70 ; =ov40_02245268
	ldr r5, _02237B74 ; =ov40_02245274
	ldr r2, [r1, #0x14]
	ldr r1, [r1, #0x18]
	mov r7, #1
	str r1, [sp, #0x24]
	mov r1, #0
	str r1, [sp, #0x18]
	mov r1, #0x8d
	lsl r1, r1, #2
	add r6, sp, #0x20
	str r2, [sp, #0x20]
	add r4, r0, r1
_02237AE6:
	add r0, r4, #0
	bl InitWindow
	ldrb r0, [r5, #1]
	add r1, r4, #0
	mov r2, #6
	str r0, [sp]
	ldrb r0, [r5, #2]
	str r0, [sp, #4]
	ldrb r0, [r5, #3]
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	lsl r0, r7, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldrb r3, [r5]
	ldr r0, [r0, #0x24]
	bl AddWindowParameterized
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x14]
	ldr r1, [r6]
	ldr r0, [r0, #0x48]
	bl NewString_ReadMsgData
	str r0, [sp, #0x1c]
	ldr r1, [sp, #0x1c]
	add r0, r4, #0
	bl ov40_022306C0
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02237B78 ; =0x000F0D00
	ldr r2, [sp, #0x1c]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #0
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	ldrb r1, [r5, #2]
	ldrb r0, [r5, #3]
	mul r0, r1
	add r7, r7, r0
	ldr r0, [sp, #0x1c]
	bl String_dtor
	ldr r0, [sp, #0x18]
	add r4, #0x10
	add r0, r0, #1
	add r5, r5, #4
	add r6, r6, #4
	str r0, [sp, #0x18]
	cmp r0, #2
	blt _02237AE6
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02237B70: .word ov40_02245268
_02237B74: .word ov40_02245274
_02237B78: .word 0x000F0D00
	thumb_func_end ov40_02237AC0

	thumb_func_start ov40_02237B7C
ov40_02237B7C: ; 0x02237B7C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	mov r6, #0x8d
	add r7, r1, #0
	ldr r4, [r5, r0]
	lsl r6, r6, #2
	add r0, r4, r6
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x48]
	add r1, r7, #0
	bl NewString_ReadMsgData
	add r5, r0, #0
	add r0, r4, r6
	add r1, r5, #0
	bl ov40_022306C0
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02237BD0 ; =0x000F0D00
	add r2, r5, #0
	str r0, [sp, #8]
	add r0, r4, r6
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl String_dtor
	add r0, r4, r6
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02237BD0: .word 0x000F0D00
	thumb_func_end ov40_02237B7C

	thumb_func_start ov40_02237BD4
ov40_02237BD4: ; 0x02237BD4
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	mov r6, #0x8d
	ldr r4, [r5, r0]
	lsl r6, r6, #2
	add r0, r4, r6
	bl InitWindow
	mov r2, #6
	str r2, [sp]
	mov r0, #8
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x24]
	add r1, r4, r6
	mov r3, #0xc
	bl AddWindowParameterized
	add r0, r4, r6
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x48]
	mov r1, #0x22
	bl NewString_ReadMsgData
	add r5, r0, #0
	mov r0, #0
	add r1, r5, #0
	add r2, r0, #0
	bl FontID_String_GetWidthMultiline
	mov r1, #0x40
	sub r0, r1, r0
	mov r1, #0
	lsr r3, r0, #1
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02237C50 ; =0x000F0D00
	add r2, r5, #0
	str r0, [sp, #8]
	add r0, r4, r6
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r4, r6
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	bl String_dtor
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02237C50: .word 0x000F0D00
	thumb_func_end ov40_02237BD4

	thumb_func_start ov40_02237C54
ov40_02237C54: ; 0x02237C54
	push {r4, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r4, [r0, r1]
	mov r0, #0x8d
	lsl r0, r0, #2
	add r0, r4, r0
	bl ClearWindowTilemapAndCopyToVram
	mov r0, #0x8d
	lsl r0, r0, #2
	add r0, r4, r0
	bl RemoveWindow
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov40_02237C54

	thumb_func_start ov40_02237C74
ov40_02237C74: ; 0x02237C74
	push {r3, r4, r5, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r1, [r0, r1]
	mov r0, #0x8d
	lsl r0, r0, #2
	mov r4, #0
	add r5, r1, r0
_02237C84:
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #2
	blt _02237C84
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_02237C74

	thumb_func_start ov40_02237C9C
ov40_02237C9C: ; 0x02237C9C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	mov r1, #0x86
	lsl r1, r1, #4
	str r0, [sp, #0x14]
	ldr r0, [r0, r1]
	mov r1, #0x6d
	str r0, [sp, #0x24]
	mov r0, #1
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x24]
	lsl r1, r1, #2
	ldr r5, _02237D60 ; =ov40_02245268
	mov r7, #0
	add r4, r0, r1
_02237CBA:
	add r0, r4, #0
	bl InitWindow
	ldrb r0, [r5, #1]
	add r1, r4, #0
	mov r2, #2
	str r0, [sp]
	ldrb r0, [r5, #2]
	str r0, [sp, #4]
	ldrb r0, [r5, #3]
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x20]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldrb r3, [r5]
	ldr r0, [r0, #0x24]
	bl AddWindowParameterized
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	cmp r7, #0
	bne _02237D16
	mov r1, #0xe
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0x24]
	lsl r1, r1, #6
	ldr r2, [r2, r1]
	ldr r1, _02237D64 ; =0x00000136
	ldr r0, [r0, #0x48]
	add r1, r2, r1
	bl NewString_ReadMsgData
	add r6, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl ov40_022306C0
	str r0, [sp, #0x1c]
	mov r0, #0
	str r0, [sp, #0x18]
_02237D16:
	cmp r6, #0
	beq _02237D3C
	ldr r0, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02237D68 ; =0x000F0D00
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r2, r6, #0
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl String_dtor
_02237D3C:
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	ldrb r1, [r5, #2]
	ldrb r0, [r5, #3]
	add r7, r7, #1
	add r2, r1, #0
	mul r2, r0
	ldr r0, [sp, #0x20]
	add r4, #0x10
	add r0, r0, r2
	add r5, r5, #4
	str r0, [sp, #0x20]
	cmp r7, #1
	blo _02237CBA
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02237D60: .word ov40_02245268
_02237D64: .word 0x00000136
_02237D68: .word 0x000F0D00
	thumb_func_end ov40_02237C9C

	thumb_func_start ov40_02237D6C
ov40_02237D6C: ; 0x02237D6C
	push {r3, r4, r5, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r1, [r0, r1]
	mov r0, #0x6d
	lsl r0, r0, #2
	mov r4, #0
	add r5, r1, r0
_02237D7C:
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #1
	blo _02237D7C
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_02237D6C

	thumb_func_start ov40_02237D94
ov40_02237D94: ; 0x02237D94
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	mov r1, #0x86
	add r4, r0, #0
	lsl r1, r1, #4
	ldr r5, [r4, r1]
	bl ov40_0223D5CC
	cmp r0, #0
	bne _02237DAE
	add sp, #0x14
	mov r0, #0
	pop {r3, r4, r5, r6, pc}
_02237DAE:
	ldr r0, [r4, #8]
	cmp r0, #8
	bls _02237DB6
	b _02238140
_02237DB6:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02237DC2: ; jump table
	.short _02237DD4 - _02237DC2 - 2 ; case 0
	.short _02237E1A - _02237DC2 - 2 ; case 1
	.short _02237EA8 - _02237DC2 - 2 ; case 2
	.short _02237EE8 - _02237DC2 - 2 ; case 3
	.short _02237F06 - _02237DC2 - 2 ; case 4
	.short _02237FAE - _02237DC2 - 2 ; case 5
	.short _02237FEC - _02237DC2 - 2 ; case 6
	.short _0223806C - _02237DC2 - 2 ; case 7
	.short _022380B4 - _02237DC2 - 2 ; case 8
_02237DD4:
	ldr r0, _02238124 ; =0x000006F4
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_020879E0
	add r0, r4, #0
	bl ov40_02237008
	add r0, r4, #0
	bl ov40_02236FE0
	ldr r0, [r4, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	mov r2, #8
	mov r1, #0x69
	str r2, [sp]
	mov r3, #0x12
	str r3, [sp, #4]
	mov r0, #1
	lsl r1, r1, #2
	str r0, [sp, #8]
	add r0, r5, r1
	add r1, r1, #4
	add r1, r5, r1
	bl ov40_0222D980
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_02237E1A:
	mov r0, #0x6b
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	bl ov40_0222DA84
	mov r1, #0x69
	lsl r1, r1, #2
	add r0, r5, r1
	add r1, r1, #4
	add r1, r5, r1
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _02237E8A
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #0x3e
	mov r3, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	mov r1, #3
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	add r3, r1, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #0x4e
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_02237E8A:
	ldr r0, [r4, #0x58]
	mov r3, #0x6b
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	lsl r3, r3, #2
	ldr r3, [r5, r3]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r1, #3
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02238272
_02237EA8:
	mov r1, #0x6f
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	add r0, r4, #0
	mov r2, #0x80
	mov r3, #0x60
	bl ov40_0223077C
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	mov r1, #0x18
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl sub_02087A08
	ldr r1, _02238128 ; =0x00000121
	add r0, r4, #0
	bl ov40_0222DED0
	ldr r0, _0223812C ; =0x0000057D
	bl PlaySE
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02238272
_02237EE8:
	add r0, r4, #0
	bl ov40_0223D540
	mov r1, #0xe
	lsl r1, r1, #6
	ldr r1, [r5, r1]
	bl ov39_0222748C
	cmp r0, #1
	beq _02237EFE
	b _02238272
_02237EFE:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02238272
_02237F06:
	add r0, r4, #0
	bl ov40_0222DFB0
	add r0, r4, #0
	bl ov40_0223D540
	add r1, sp, #0x10
	bl ov39_02227D44
	cmp r0, #1
	ldr r0, _0223812C ; =0x0000057D
	bne _02237F9A
	mov r1, #0
	bl StopSE
	ldr r3, [sp, #0x10]
	add r0, r4, #0
	ldr r2, [r3, #0xc]
	ldr r3, [r3, #4]
	mov r1, #3
	bl ov40_02230CDC
	mov r0, #0xe2
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
	ldr r0, _02238130 ; =0x00002F64
	str r1, [r5, r0]
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r4, #0
	bl ov40_02236EB4
	ldr r0, _02238124 ; =0x000006F4
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_020878B0
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	mov r1, #0
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl sub_02087A08
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, [r4, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	mov r0, #7
	str r0, [r4, #8]
	b _02238272
_02237F9A:
	mov r1, #0
	bl StopSE
	ldr r0, _02238134 ; =0x00000577
	bl PlaySE
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02238272
_02237FAE:
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	mov r1, #0
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl sub_02087A08
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _02237FE6
	ldr r0, [r4, #8]
	ldr r1, _02238138 ; =0x00000126
	add r0, r0, #1
	str r0, [r4, #8]
	mov r0, #0
	str r0, [r4, #0xc]
	add r0, r4, #0
	bl ov40_0222DED0
	b _02238272
_02237FE6:
	mov r0, #0xff
	str r0, [r4, #8]
	b _02238272
_02237FEC:
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	cmp r0, #0x3c
	bge _02237FFE
	bl System_GetTouchNew
	cmp r0, #1
	bne _02238082
_02237FFE:
	mov r0, #0
	str r0, [r4, #0xc]
	add r0, r4, #0
	bl ov40_0222DFB0
	ldr r0, _02238130 ; =0x00002F64
	mov r1, #0
	str r1, [r5, r0]
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r4, #0
	bl ov40_02236EB4
	ldr r0, _02238124 ; =0x000006F4
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_020878B0
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	mov r1, #0
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl sub_02087A08
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, [r4, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02238272
_0223806C:
	mov r1, #0x69
	lsl r1, r1, #2
	add r0, r5, r1
	add r1, r1, #4
	add r1, r5, r1
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	bne _02238084
_02238082:
	b _02238272
_02238084:
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #0x4f
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02238272
_022380B4:
	mov r0, #0x6b
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl ov40_0222DA84
	mov r1, #0x69
	lsl r1, r1, #2
	add r0, r5, r1
	add r1, r1, #4
	add r1, r5, r1
	mov r2, #0
	mov r3, #2
	bl ov40_0222DA00
	cmp r0, #0
	beq _02238104
	add r0, r4, #0
	mov r1, #2
	bl ov40_0222C710
	ldr r1, _0223813C ; =0x00000113
	add r0, r4, #0
	bl ov40_02237030
	add r0, r4, #0
	bl ov40_02236F38
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	add r0, r4, #0
	mov r1, #3
	bl ov40_0222BF80
_02238104:
	ldr r0, [r4, #0x58]
	mov r3, #0x6b
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	lsl r3, r3, #2
	ldr r3, [r5, r3]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r1, #3
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02238272
	nop
_02238124: .word 0x000006F4
_02238128: .word 0x00000121
_0223812C: .word 0x0000057D
_02238130: .word 0x00002F64
_02238134: .word 0x00000577
_02238138: .word 0x00000126
_0223813C: .word 0x00000113
_02238140:
	mov r0, #0x6b
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl ov40_0222DA84
	mov r1, #0x69
	lsl r1, r1, #2
	add r0, r5, r1
	add r1, r1, #4
	mov r2, #0
	add r1, r5, r1
	add r3, r2, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223823A
	add r0, r4, #0
	bl ov40_02237C9C
	add r0, r4, #0
	bl ov40_02238290
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	ldr r0, _02238278 ; =0x00002EAC
	ldr r3, _0223827C ; =ov40_02245310
	add r2, r5, r0
	mov r6, #5
_0223817E:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r6, r6, #1
	bne _0223817E
	ldr r0, [r3]
	mov r1, #0xe2
	str r0, [r2]
	lsl r1, r1, #2
	ldr r2, [r5, r1]
	ldr r0, _02238280 ; =0x00002EB0
	add r1, #0xf4
	str r2, [r5, r0]
	add r0, r4, r1
	add r1, r4, #0
	mov r2, #2
	bl ov40_0222F9E0
	ldr r0, _02238284 ; =0x0000049C
	add r0, r4, r0
	bl ov40_0222F734
	ldr r3, _02238278 ; =0x00002EAC
	ldr r0, _02238284 ; =0x0000049C
	add r2, r5, r3
	sub r3, #0xa0
	add r0, r4, r0
	add r1, r4, #0
	add r3, r5, r3
	bl ov40_0222EED0
	ldr r1, _02238288 ; =0x0000047C
	add r0, r4, r1
	add r1, #0x20
	add r1, r4, r1
	bl ov40_0222FA5C
	ldr r0, _02238284 ; =0x0000049C
	add r1, r4, #0
	add r0, r4, r0
	mov r2, #1
	bl ov40_0222F740
	ldr r0, _02238284 ; =0x0000049C
	mov r1, #0x38
	add r0, r4, r0
	mov r2, #0xb0
	bl ov40_0222F858
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	add r0, r4, #0
	bl ov40_02237AC0
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	ldr r3, _0223828C ; =0x000004D8
	mov r1, #0x6f
	ldr r6, [r4, r3]
	mov r3, #0x18
	mul r3, r6
	lsl r1, r1, #4
	add r3, #0x44
	lsl r3, r3, #0x10
	ldr r1, [r4, r1]
	add r0, r4, #0
	mov r2, #0x10
	asr r3, r3, #0x10
	bl ov40_0223077C
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	mov r1, #0xc
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl sub_02087A08
	add r0, r4, #0
	mov r1, #5
	bl ov40_0222BF80
_0223823A:
	ldr r0, [r4, #0x58]
	mov r3, #0x6b
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	lsl r3, r3, #2
	ldr r3, [r5, r3]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r1, #3
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r4, #0x58]
	mov r3, #0x6b
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	lsl r3, r3, #2
	ldr r3, [r5, r3]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r1, #2
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
_02238272:
	mov r0, #0
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02238278: .word 0x00002EAC
_0223827C: .word ov40_02245310
_02238280: .word 0x00002EB0
_02238284: .word 0x0000049C
_02238288: .word 0x0000047C
_0223828C: .word 0x000004D8
	thumb_func_end ov40_02237D94

	thumb_func_start ov40_02238290
ov40_02238290: ; 0x02238290
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	str r0, [sp]
	ldr r7, [r0, r1]
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	mov r6, #0
	cmp r0, #0
	ble _022382FA
	add r4, r7, #0
	add r5, r7, #0
_022382AA:
	mov r0, #0x14
	mov r1, #0x6d
	bl String_ctor
	ldr r1, _022382FC ; =0x00002E10
	str r0, [r4, r1]
	add r0, r1, #0
	mov r1, #0xe3
	lsl r1, r1, #2
	ldr r0, [r4, r0]
	ldr r1, [r5, r1]
	bl CopyU16ArrayToString
	ldr r1, _022382FC ; =0x00002E10
	ldr r0, [sp]
	ldr r1, [r4, r1]
	bl ov40_02230DCC
	mov r0, #0x1e
	mov r1, #0x6d
	bl String_ctor
	ldr r1, _02238300 ; =0x00002E0C
	str r0, [r4, r1]
	add r0, r1, #0
	mov r1, #0xe3
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	ldr r0, [r4, r0]
	add r1, #0x80
	bl CopyU16ArrayToString
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	add r6, r6, #1
	add r4, #8
	add r5, r5, #4
	cmp r6, r0
	blt _022382AA
_022382FA:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022382FC: .word 0x00002E10
_02238300: .word 0x00002E0C
	thumb_func_end ov40_02238290

	thumb_func_start ov40_02238304
ov40_02238304: ; 0x02238304
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r6, [r0, r1]
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r4, #0
	cmp r0, #0
	ble _0223834C
	add r5, r6, #0
	add r7, r4, #0
_0223831C:
	ldr r0, _02238350 ; =0x00002E0C
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0223832C
	bl String_dtor
	ldr r0, _02238350 ; =0x00002E0C
	str r7, [r5, r0]
_0223832C:
	ldr r0, _02238354 ; =0x00002E10
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0223833E
	bl String_dtor
	ldr r0, _02238354 ; =0x00002E10
	mov r1, #0
	str r1, [r5, r0]
_0223833E:
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	add r4, r4, #1
	add r5, #8
	cmp r4, r0
	blt _0223831C
_0223834C:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02238350: .word 0x00002E0C
_02238354: .word 0x00002E10
	thumb_func_end ov40_02238304

	thumb_func_start ov40_02238358
ov40_02238358: ; 0x02238358
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	ldr r0, _022383B4 ; =0x00002F64
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _022383A6
	ldr r0, _022383B8 ; =0x0000047C
	add r0, r5, r0
	bl ov40_0222FA88
	ldr r1, _022383BC ; =0x0000049C
	add r0, r5, r1
	sub r1, #0x10
	ldrsh r1, [r5, r1]
	bl ov40_0222F5EC
	ldr r0, _022383BC ; =0x0000049C
	ldr r2, _022383C0 ; =0x00002E0C
	add r0, r5, r0
	add r1, r5, #0
	add r2, r4, r2
	bl ov40_0222EFD8
	ldr r2, _022383C4 ; =0x000004D8
	mov r0, #0x6f
	ldr r3, [r5, r2]
	mov r2, #0x18
	mul r2, r3
	lsl r0, r0, #4
	add r2, #0x44
	lsl r2, r2, #0x10
	ldr r0, [r5, r0]
	mov r1, #0x10
	asr r2, r2, #0x10
	bl sub_020878EC
_022383A6:
	mov r0, #0xcf
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02026CC4
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022383B4: .word 0x00002F64
_022383B8: .word 0x0000047C
_022383BC: .word 0x0000049C
_022383C0: .word 0x00002E0C
_022383C4: .word 0x000004D8
	thumb_func_end ov40_02238358

	thumb_func_start ov40_022383C8
ov40_022383C8: ; 0x022383C8
	push {r3, r4, r5, lr}
	sub sp, #0x10
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _022383E6
	cmp r1, #1
	beq _022384B4
	cmp r1, #2
	bne _022383E4
	b _022384EA
_022383E4:
	b _0223852E
_022383E6:
	bl ov40_02238304
	add r0, r5, #0
	bl ov40_02237C74
	ldr r0, _02238534 ; =0x00002F64
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0223842A
	add r0, r5, #0
	bl ov40_02237D6C
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	ldr r0, _02238538 ; =0x0000047C
	add r0, r5, r0
	bl ov40_0222FA24
	ldr r0, _0223853C ; =0x0000049C
	add r0, r5, r0
	bl ov40_0222F720
	ldr r0, _0223853C ; =0x0000049C
	add r1, r5, #0
	add r0, r5, r0
	bl ov40_0222F920
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	b _0223844A
_0223842A:
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	ldr r0, _02238540 ; =0x00002ED8
	add r1, r5, #0
	add r0, r4, r0
	bl ov40_0222E7B8
	add r0, r5, #0
	bl ov40_022361B0
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
_0223844A:
	ldr r0, _02238534 ; =0x00002F64
	mov r1, #0
	str r1, [r4, r0]
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r5, #0
	bl ov40_02236EB4
	add r0, r5, #0
	mov r1, #0xff
	bl ov40_0223707C
	ldr r0, _02238544 ; =0x000006F4
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_020878B0
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	mov r1, #0
	ldr r0, [r5, r0]
	add r2, r1, #0
	bl sub_02087A08
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, [r5, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_022384B4:
	mov r1, #0x69
	lsl r1, r1, #2
	add r0, r4, r1
	add r1, r1, #4
	add r1, r4, r1
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223852E
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #0x24]
	mov r1, #0x4f
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223852E
_022384EA:
	mov r1, #0x69
	lsl r1, r1, #2
	add r0, r4, r1
	add r1, r1, #4
	add r1, r4, r1
	mov r2, #0
	mov r3, #2
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223852E
	add r0, r5, #0
	mov r1, #2
	bl ov40_0222C710
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r1, _02238548 ; =0x00000113
	add r0, r5, #0
	bl ov40_02237030
	add r0, r5, #0
	bl ov40_02236F38
	add r0, r5, #0
	mov r1, #3
	bl ov40_0222BF80
_0223852E:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02238534: .word 0x00002F64
_02238538: .word 0x0000047C
_0223853C: .word 0x0000049C
_02238540: .word 0x00002ED8
_02238544: .word 0x000006F4
_02238548: .word 0x00000113
	thumb_func_end ov40_022383C8

	thumb_func_start ov40_0223854C
ov40_0223854C: ; 0x0223854C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	mov r1, #0x86
	add r4, r0, #0
	lsl r1, r1, #4
	ldr r5, [r4, r1]
	ldr r1, [r4, #8]
	cmp r1, #3
	bls _02238560
	b _0223871A
_02238560:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223856C: ; jump table
	.short _02238574 - _0223856C - 2 ; case 0
	.short _02238610 - _0223856C - 2 ; case 1
	.short _0223862E - _0223856C - 2 ; case 2
	.short _022386C6 - _0223856C - 2 ; case 3
_02238574:
	bl ov40_02237C74
	ldr r0, _022387FC ; =0x00002F64
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _022385B2
	add r0, r4, #0
	bl ov40_02237D6C
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	ldr r0, _02238800 ; =0x0000047C
	add r0, r4, r0
	bl ov40_0222FA24
	ldr r0, _02238804 ; =0x0000049C
	add r0, r4, r0
	bl ov40_0222F720
	ldr r0, _02238804 ; =0x0000049C
	add r1, r4, #0
	add r0, r4, r0
	bl ov40_0222F920
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	b _022385D2
_022385B2:
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	ldr r0, _02238808 ; =0x00002ED8
	add r1, r4, #0
	add r0, r5, r0
	bl ov40_0222E7B8
	add r0, r4, #0
	bl ov40_022361B0
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
_022385D2:
	ldr r0, _0223880C ; =0x000006F4
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_020878B0
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	mov r1, #0
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl sub_02087A08
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_02238610:
	mov r1, #0x69
	lsl r1, r1, #2
	add r0, r5, r1
	add r1, r1, #4
	add r1, r5, r1
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _022386DC
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022387F4
_0223862E:
	mov r1, #1
	bl ov40_02230964
	ldr r0, _02238810 ; =0x000004D4
	add r3, r5, #4
	ldr r0, [r4, r0]
	mov r2, #0x33
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0xe3
	lsl r0, r0, #2
	ldr r6, [r1, r0]
	add r6, #0x80
_02238648:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02238648
	ldr r0, [r6]
	str r0, [r3]
	add r0, r5, #0
	bl ov40_0223655C
	add r0, r4, #0
	mov r1, #2
	bl ov40_0222C710
	add r0, r4, #0
	bl ov40_02236EB4
	add r0, r4, #0
	bl ov40_0223757C
	add r0, r4, #0
	mov r1, #0xff
	bl ov40_0223707C
	add r0, r4, #0
	mov r1, #1
	bl ov40_02237548
	add r0, r4, #0
	mov r1, #0
	bl ov40_022373E4
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #0x4b
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022387F4
_022386C6:
	mov r1, #0x69
	lsl r1, r1, #2
	add r0, r5, r1
	add r1, r1, #4
	mov r2, #0
	add r1, r5, r1
	add r3, r2, #0
	bl ov40_0222DA00
	cmp r0, #0
	bne _022386DE
_022386DC:
	b _022387F4
_022386DE:
	add r0, r4, #0
	mov r1, #0
	bl ov40_02237548
	add r0, r4, #0
	mov r1, #1
	bl ov40_022373E4
	add r0, r4, #0
	bl ov40_02237BD4
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	ldr r0, _02238814 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022387F4
_0223871A:
	mov r0, #0x6b
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl ov40_0222DA84
	cmp r0, #0
	beq _022387D8
	mov r0, #0x33
	lsl r0, r0, #4
	ldr r1, [r5, r0]
	add r0, #0x14
	str r1, [r5, r0]
	add r0, r5, #0
	bl ov40_0223655C
	mov r0, #0x1b
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #6
	bl _s32_div_f
	ldr r0, _02238818 ; =0x00002F68
	str r1, [r5, r0]
	mov r0, #0x1b
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #6
	bl _s32_div_f
	ldr r3, _0223881C ; =0x00002F6C
	mov r1, #0x6f
	str r0, [r5, r3]
	sub r2, r3, #4
	ldr r6, [r5, r2]
	mov r2, #0x18
	mul r2, r6
	ldr r6, [r5, r3]
	mov r3, #0x16
	mul r3, r6
	lsl r1, r1, #4
	add r2, #0x6e
	add r3, #0x34
	lsl r2, r2, #0x10
	lsl r3, r3, #0x10
	ldr r1, [r4, r1]
	add r0, r4, #0
	asr r2, r2, #0x10
	asr r3, r3, #0x10
	bl ov40_0223077C
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	mov r1, #0xc
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl sub_02087A08
	mov r0, #0x1b
	lsl r0, r0, #4
	ldr r2, [r5, r0]
	lsl r1, r2, #1
	add r1, r5, r1
	ldrh r1, [r1, #0x2c]
	cmp r1, #0
	beq _022387D0
	sub r0, #0x58
	mov r1, #1
	ldr r0, [r5, r0]
	lsl r1, r2
	bl ov40_022371D4
	cmp r0, #1
	beq _022387D0
	mov r1, #0x1b
	lsl r1, r1, #4
	ldr r2, [r5, r1]
	sub r1, #0x54
	lsl r0, r2, #1
	add r0, r5, r0
	add r2, r5, r2
	ldrh r0, [r0, #0x2c]
	ldrb r1, [r2, r1]
	bl PlayCry
_022387D0:
	add r0, r4, #0
	mov r1, #0xa
	bl ov40_0222BF80
_022387D8:
	ldr r0, [r4, #0x58]
	mov r3, #0x6b
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	lsl r3, r3, #2
	ldr r3, [r5, r3]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r1, #3
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
_022387F4:
	mov r0, #0
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_022387FC: .word 0x00002F64
_02238800: .word 0x0000047C
_02238804: .word 0x0000049C
_02238808: .word 0x00002ED8
_0223880C: .word 0x000006F4
_02238810: .word 0x000004D4
_02238814: .word 0x04000050
_02238818: .word 0x00002F68
_0223881C: .word 0x00002F6C
	thumb_func_end ov40_0223854C

	thumb_func_start ov40_02238820
ov40_02238820: ; 0x02238820
	push {r3, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r1, [r0, r1]
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r0, [r1, r0]
	bl sub_02026CC4
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov40_02238820

	thumb_func_start ov40_02238838
ov40_02238838: ; 0x02238838
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _02238854
	cmp r0, #1
	beq _0223889A
	cmp r0, #2
	beq _022388A6
	b _0223891E
_02238854:
	mov r2, #8
	mov r1, #0x69
	str r2, [sp]
	mov r3, #0x12
	str r3, [sp, #4]
	mov r0, #1
	lsl r1, r1, #2
	str r0, [sp, #8]
	add r0, r4, r1
	add r1, r1, #4
	add r1, r4, r1
	bl ov40_0222D980
	add r0, r5, #0
	bl ov40_02237564
	add r0, r5, #0
	bl ov40_02237410
	add r0, r5, #0
	bl ov40_022371A0
	ldr r0, [r5, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	add r0, r5, #0
	bl ov40_02237008
	add r0, r5, #0
	bl ov40_02237C54
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_0223889A:
	ldr r0, _02238A38 ; =0x00002F64
	mov r1, #0
	str r1, [r4, r0]
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_022388A6:
	mov r1, #0x69
	lsl r1, r1, #2
	add r0, r4, r1
	add r1, r1, #4
	add r1, r4, r1
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	bne _022388BE
	b _02238A30
_022388BE:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #0x24]
	mov r1, #0x3e
	mov r3, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	mov r1, #3
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #0x24]
	add r3, r1, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #0x24]
	mov r1, #0x4e
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02238A30
_0223891E:
	mov r1, #0x69
	lsl r1, r1, #2
	add r0, r4, r1
	add r1, r1, #4
	mov r2, #0
	add r1, r4, r1
	add r3, r2, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _02238A30
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_020879E0
	add r0, r5, #0
	bl ov40_02237C9C
	add r0, r5, #0
	bl ov40_02237AC0
	ldr r0, _02238A3C ; =0x0000047C
	add r1, r5, #0
	add r0, r5, r0
	mov r2, #2
	bl ov40_0222F9E0
	ldr r3, _02238A40 ; =0x00002EAC
	ldr r0, _02238A44 ; =0x0000049C
	add r2, r4, r3
	sub r3, #0xa0
	add r0, r5, r0
	add r1, r5, #0
	add r3, r4, r3
	bl ov40_0222EED0
	ldr r1, _02238A3C ; =0x0000047C
	add r0, r5, r1
	add r1, #0x20
	add r1, r5, r1
	bl ov40_0222FA5C
	ldr r0, _02238A44 ; =0x0000049C
	add r1, r5, #0
	add r0, r5, r0
	mov r2, #1
	bl ov40_0222F740
	ldr r0, _02238A44 ; =0x0000049C
	mov r1, #0x38
	add r0, r5, r0
	mov r2, #0xb0
	bl ov40_0222F858
	ldr r3, _02238A48 ; =0x000004D8
	mov r1, #0x6f
	ldr r6, [r5, r3]
	mov r3, #0x18
	mul r3, r6
	lsl r1, r1, #4
	add r3, #0x44
	lsl r3, r3, #0x10
	ldr r1, [r5, r1]
	add r0, r5, #0
	mov r2, #0x10
	asr r3, r3, #0x10
	bl ov40_0223077C
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	mov r1, #0xc
	ldr r0, [r5, r0]
	add r2, r1, #0
	bl sub_02087A08
	ldr r0, _02238A38 ; =0x00002F64
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _02238A10
	ldr r0, _02238A3C ; =0x0000047C
	add r0, r5, r0
	bl ov40_0222FA88
	ldr r1, _02238A44 ; =0x0000049C
	add r0, r5, r1
	sub r1, #0x10
	ldrsh r1, [r5, r1]
	bl ov40_0222F5EC
	ldr r0, _02238A44 ; =0x0000049C
	ldr r2, _02238A4C ; =0x00002E0C
	add r0, r5, r0
	add r1, r5, #0
	add r2, r4, r2
	bl ov40_0222EFD8
	ldr r2, _02238A48 ; =0x000004D8
	mov r0, #0x6f
	ldr r3, [r5, r2]
	mov r2, #0x18
	mul r2, r3
	lsl r0, r0, #4
	add r2, #0x44
	lsl r2, r2, #0x10
	ldr r0, [r5, r0]
	mov r1, #0x10
	asr r2, r2, #0x10
	bl sub_020878EC
_02238A10:
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	add r0, r5, #0
	mov r1, #5
	bl ov40_0222BF80
_02238A30:
	mov r0, #0
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_02238A38: .word 0x00002F64
_02238A3C: .word 0x0000047C
_02238A40: .word 0x00002EAC
_02238A44: .word 0x0000049C
_02238A48: .word 0x000004D8
_02238A4C: .word 0x00002E0C
	thumb_func_end ov40_02238838

	thumb_func_start ov40_02238A50
ov40_02238A50: ; 0x02238A50
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _02238A6C
	cmp r0, #1
	beq _02238AD6
	cmp r0, #2
	beq _02238B52
	b _02238B96
_02238A6C:
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_020879E0
	ldr r0, _02238B9C ; =0x00002F64
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _02238A86
	add r0, r5, #0
	bl ov40_02237D6C
_02238A86:
	ldr r0, _02238BA0 ; =0x0000047C
	add r0, r5, r0
	bl ov40_0222FA24
	ldr r0, _02238BA4 ; =0x0000049C
	add r0, r5, r0
	bl ov40_0222F720
	ldr r0, _02238BA4 ; =0x0000049C
	add r1, r5, #0
	add r0, r5, r0
	bl ov40_0222F920
	ldr r0, _02238B9C ; =0x00002F64
	mov r1, #1
	str r1, [r4, r0]
	ldr r0, [r5, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	mov r2, #8
	mov r1, #0x69
	str r2, [sp]
	mov r3, #0x12
	str r3, [sp, #4]
	mov r0, #1
	lsl r1, r1, #2
	str r0, [sp, #8]
	add r0, r4, r1
	add r1, r1, #4
	add r1, r4, r1
	bl ov40_0222D980
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_02238AD6:
	mov r1, #0x69
	lsl r1, r1, #2
	add r0, r4, r1
	add r1, r1, #4
	mov r2, #1
	add r1, r4, r1
	add r3, r2, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _02238B96
	ldr r1, _02238BA8 ; =0x000004D4
	add r0, r5, #0
	ldr r1, [r5, r1]
	bl ov40_02236184
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	ldr r0, _02238BAC ; =0x00002ED8
	add r1, r5, #0
	add r0, r4, r0
	bl ov40_0222E79C
	ldr r0, _02238BAC ; =0x00002ED8
	mov r1, #0
	add r0, r4, r0
	bl ov40_0222E7DC
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #0x24]
	mov r1, #0x3e
	mov r3, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #0x24]
	mov r1, #0x50
	mov r3, #3
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02238B96
_02238B52:
	mov r1, #0x69
	lsl r1, r1, #2
	add r0, r4, r1
	add r1, r1, #4
	add r1, r4, r1
	mov r2, #0
	mov r3, #1
	bl ov40_0222DA00
	cmp r0, #0
	beq _02238B96
	ldr r0, _02238BAC ; =0x00002ED8
	mov r1, #1
	add r0, r4, r0
	bl ov40_0222E7DC
	ldr r1, _02238B9C ; =0x00002F64
	add r0, r5, #0
	ldr r1, [r4, r1]
	add r1, #0x79
	bl ov40_02237B7C
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	add r0, r5, #0
	mov r1, #5
	bl ov40_0222BF80
_02238B96:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02238B9C: .word 0x00002F64
_02238BA0: .word 0x0000047C
_02238BA4: .word 0x0000049C
_02238BA8: .word 0x000004D4
_02238BAC: .word 0x00002ED8
	thumb_func_end ov40_02238A50

	thumb_func_start ov40_02238BB0
ov40_02238BB0: ; 0x02238BB0
	push {r3, r4, r5, lr}
	sub sp, #0x10
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _02238BCC
	cmp r1, #1
	beq _02238BDA
	cmp r1, #2
	beq _02238BFE
	b _02238C5E
_02238BCC:
	ldr r0, _02238D40 ; =0x00002F64
	mov r1, #0
	str r1, [r4, r0]
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02238D38
_02238BDA:
	mov r1, #1
	bl ov40_02230964
	ldr r0, _02238D44 ; =0x00002ED8
	add r1, r5, #0
	add r0, r4, r0
	bl ov40_0222E7B8
	add r0, r5, #0
	bl ov40_022361B0
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_02238BFE:
	mov r1, #0x69
	lsl r1, r1, #2
	add r0, r4, r1
	add r1, r1, #4
	mov r2, #1
	add r1, r4, r1
	add r3, r2, #0
	bl ov40_0222DA00
	cmp r0, #0
	bne _02238C16
	b _02238D38
_02238C16:
	ldr r0, [r5, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #0x24]
	mov r1, #0x3e
	mov r3, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	mov r1, #3
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #0x24]
	add r3, r1, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02238D38
_02238C5E:
	mov r1, #0x69
	lsl r1, r1, #2
	add r0, r4, r1
	add r1, r1, #4
	add r1, r4, r1
	mov r2, #0
	mov r3, #1
	bl ov40_0222DA00
	cmp r0, #0
	beq _02238D38
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	ldr r1, _02238D40 ; =0x00002F64
	add r0, r5, #0
	ldr r1, [r4, r1]
	add r1, #0x79
	bl ov40_02237B7C
	add r0, r5, #0
	bl ov40_02237C9C
	ldr r0, _02238D48 ; =0x0000047C
	add r1, r5, #0
	add r0, r5, r0
	mov r2, #2
	bl ov40_0222F9E0
	ldr r3, _02238D4C ; =0x00002EAC
	ldr r0, _02238D50 ; =0x0000049C
	add r2, r4, r3
	sub r3, #0xa0
	add r0, r5, r0
	add r1, r5, #0
	add r3, r4, r3
	bl ov40_0222EED0
	ldr r1, _02238D48 ; =0x0000047C
	add r0, r5, r1
	add r1, #0x20
	add r1, r5, r1
	bl ov40_0222FA5C
	ldr r0, _02238D50 ; =0x0000049C
	add r1, r5, #0
	add r0, r5, r0
	mov r2, #1
	bl ov40_0222F740
	ldr r0, _02238D50 ; =0x0000049C
	mov r1, #0x38
	add r0, r5, r0
	mov r2, #0xb0
	bl ov40_0222F858
	ldr r0, _02238D40 ; =0x00002F64
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _02238D14
	ldr r0, _02238D48 ; =0x0000047C
	add r0, r5, r0
	bl ov40_0222FA88
	ldr r1, _02238D50 ; =0x0000049C
	add r0, r5, r1
	sub r1, #0x10
	ldrsh r1, [r5, r1]
	bl ov40_0222F5EC
	ldr r0, _02238D50 ; =0x0000049C
	ldr r2, _02238D54 ; =0x00002E0C
	add r0, r5, r0
	add r1, r5, #0
	add r2, r4, r2
	bl ov40_0222EFD8
	ldr r2, _02238D58 ; =0x000004D8
	mov r0, #0x6f
	ldr r3, [r5, r2]
	mov r2, #0x18
	mul r2, r3
	lsl r0, r0, #4
	add r2, #0x44
	lsl r2, r2, #0x10
	ldr r0, [r5, r0]
	mov r1, #0x10
	asr r2, r2, #0x10
	bl sub_020878EC
_02238D14:
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_020879E0
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	add r0, r5, #0
	mov r1, #5
	bl ov40_0222BF80
_02238D38:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_02238D40: .word 0x00002F64
_02238D44: .word 0x00002ED8
_02238D48: .word 0x0000047C
_02238D4C: .word 0x00002EAC
_02238D50: .word 0x0000049C
_02238D54: .word 0x00002E0C
_02238D58: .word 0x000004D8
	thumb_func_end ov40_02238BB0

	thumb_func_start ov40_02238D5C
ov40_02238D5C: ; 0x02238D5C
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r7, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _02238D72
	cmp r1, #1
	beq _02238DC8
	b _02238E1E
_02238D72:
	mov r1, #1
	bl ov40_02230964
	add r0, r5, #0
	bl ov40_02237008
	add r0, r5, #0
	bl ov40_02236534
	ldr r0, _02238EB4 ; =0x000006F4
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_020878B0
	ldr r0, _02238EB4 ; =0x000006F4
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_020878B0
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_020879E0
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	add r0, r5, #0
	mov r1, #1
	bl ov40_0222FB90
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02238EB0
_02238DC8:
	bl ov40_0222FBB4
	cmp r0, #0
	beq _02238EB0
	mov r6, #0
	add r4, r7, #0
_02238DD4:
	mov r0, #0x33
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02026CAC
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #5
	blt _02238DD4
	mov r0, #0x6b
	lsl r0, r0, #2
	add r0, r7, r0
	bl ov40_0222DAA8
	add r0, r5, #0
	bl ov40_0222D88C
	ldr r0, [r5, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02238EB0
_02238E1E:
	mov r0, #0x6b
	lsl r0, r0, #2
	add r0, r7, r0
	mov r1, #0
	bl ov40_0222DA84
	cmp r0, #0
	beq _02238E78
	add r0, r5, #0
	bl ov40_0222DD08
	mov r0, #0x6b
	lsl r0, r0, #2
	add r0, r7, r0
	bl ov40_0222DAA8
	ldr r0, [r5, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r5, #0x28]
	mov r2, #0xc
	mov r3, #0x10
	bl sub_02003EA4
	mov r1, #1
	ldr r3, [r5, #0x10]
	add r0, r5, #0
	add r2, r1, #0
	bl ov40_0222BF64
	add r0, r5, #0
	mov r1, #5
	bl ov40_0222BF80
	mov r0, #0xe1
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	bl sub_020314BC
	add r0, r7, #0
	bl FreeToHeap
	b _02238EB0
_02238E78:
	ldr r0, [r5, #0x58]
	mov r3, #0x6b
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	lsl r3, r3, #2
	ldr r3, [r7, r3]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r1, #1
	mov r2, #2
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r5, #0x58]
	mov r3, #0x6b
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	lsl r3, r3, #2
	ldr r3, [r7, r3]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r1, #3
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
_02238EB0:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02238EB4: .word 0x000006F4
	thumb_func_end ov40_02238D5C

	thumb_func_start ov40_02238EB8
ov40_02238EB8: ; 0x02238EB8
	bx lr
	.balign 4, 0
	thumb_func_end ov40_02238EB8

	thumb_func_start ov40_02238EBC
ov40_02238EBC: ; 0x02238EBC
	push {r4, lr}
	mov r2, #0x86
	lsl r2, r2, #4
	ldr r1, [r1]
	ldr r4, [r0, r2]
	cmp r1, #1
	bne _02238ED4
	mov r0, #0xe2
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	pop {r4, pc}
_02238ED4:
	bl ov40_0223D540
	mov r1, #0xe3
	lsl r1, r1, #2
	add r1, r4, r1
	mov r2, #0x14
	bl ov39_02227F14
	mov r1, #0xe2
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r1, #4
	add r1, #0x54
	ldr r2, _02238EFC ; =0x00002A30
	add r0, r4, r0
	add r1, r4, r1
	bl MI_CpuCopy8
	pop {r4, pc}
	nop
_02238EFC: .word 0x00002A30
	thumb_func_end ov40_02238EBC

	thumb_func_start ov40_02238F00
ov40_02238F00: ; 0x02238F00
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	ldr r0, _02238FD4 ; =0x00000B0C
	bne _02238F2E
	ldr r3, _02238FD8 ; =ov40_02245418
	add r2, r4, r0
	mov r6, #5
_02238F1A:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r6, r6, #1
	bne _02238F1A
	ldr r0, [r3]
	mov r1, #0
	str r0, [r2]
	ldr r0, _02238FDC ; =0x00000748
	str r1, [r4, r0]
	b _02238F5A
_02238F2E:
	ldr r3, _02238FE0 ; =ov40_02245444
	add r2, r4, r0
	mov r6, #5
_02238F34:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r6, r6, #1
	bne _02238F34
	ldr r0, [r3]
	ldr r1, _02238FE4 ; =0x00000714
	str r0, [r2]
	ldr r3, [r4, r1]
	mov r1, #0x72
	ldr r2, [r4, #0xc]
	lsl r1, r1, #2
	mul r1, r2
	ldrb r1, [r3, r1]
	ldr r0, [r5, #0x4c]
	add r1, #0x5e
	bl NewString_ReadMsgData
	ldr r1, _02238FDC ; =0x00000748
	str r0, [r4, r1]
_02238F5A:
	mov r1, #0xb1
	ldr r0, [r4, #0x20]
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r3, [r4, #0xc]
	ldr r0, _02238FE8 ; =0x0000074C
	lsl r2, r3, #2
	add r2, r3, r2
	add r0, r4, r0
	lsl r2, r2, #6
	add r2, r0, r2
	sub r0, r1, #4
	str r2, [r4, r0]
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	ldr r0, _02238FEC ; =0x0000049C
	add r0, r5, r0
	bl ov40_0222F734
	ldr r0, [r4, #0xc]
	ldr r3, _02238FD4 ; =0x00000B0C
	str r0, [sp]
	ldr r0, [r4, #0x14]
	ldr r2, _02238FDC ; =0x00000748
	str r0, [sp, #4]
	ldr r0, [r4, r2]
	sub r2, r2, #4
	str r0, [sp, #8]
	ldr r0, _02238FEC ; =0x0000049C
	ldr r2, [r4, r2]
	add r0, r5, r0
	add r1, r5, #0
	add r3, r4, r3
	bl ov40_0222EB9C
	ldr r1, _02238FF0 ; =0x0000047C
	add r0, r5, r1
	add r1, #0x20
	add r1, r5, r1
	bl ov40_0222FA5C
	ldr r0, _02238FEC ; =0x0000049C
	add r1, r5, #0
	add r0, r5, r0
	mov r2, #1
	bl ov40_0222F740
	ldr r0, _02238FEC ; =0x0000049C
	mov r1, #0x70
	add r0, r5, r0
	mov r2, #0xb8
	bl ov40_0222F858
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02238FD4: .word 0x00000B0C
_02238FD8: .word ov40_02245418
_02238FDC: .word 0x00000748
_02238FE0: .word ov40_02245444
_02238FE4: .word 0x00000714
_02238FE8: .word 0x0000074C
_02238FEC: .word 0x0000049C
_02238FF0: .word 0x0000047C
	thumb_func_end ov40_02238F00

	thumb_func_start ov40_02238FF4
ov40_02238FF4: ; 0x02238FF4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r4, [r0, r1]
	ldr r0, _02239314 ; =0x00000714
	add r1, r4, #0
	add r1, #0xe0
	str r1, [r4, r0]
	add r1, r0, #0
	sub r1, #0xdc
	add r1, r4, r1
	add r0, r0, #4
	str r1, [r4, r0]
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _02239026
	cmp r0, #1
	bne _0223901C
	b _02239120
_0223901C:
	cmp r0, #2
	bne _02239022
	b _0223920C
_02239022:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_02239026:
	mov r6, #0
	add r5, r6, #0
	str r6, [sp]
_0223902C:
	ldr r0, [r4, #0x1c]
	ldr r1, [r4, #0xc]
	cmp r0, #0
	bne _02239084
	lsl r0, r1, #2
	add r0, r1, r0
	lsl r0, r0, #6
	add r0, r4, r0
	add r2, r5, r0
	ldr r1, _02239318 ; =0x00002710
	ldr r0, _0223931C ; =0x0000074C
	str r1, [r2, r0]
	sub r0, #0x34
	ldr r2, [r4, r0]
	ldr r1, [r4, #0xc]
	mov r0, #0x48
	mul r0, r1
	add r0, r2, r0
	add r0, r6, r0
	ldrb r0, [r0, #4]
	mov r1, #4
	bl ov40_0222E658
	ldr r2, [r4, #0xc]
	lsl r1, r2, #2
	add r1, r2, r1
	lsl r1, r1, #6
	add r1, r4, r1
	add r2, r5, r1
	mov r1, #0x75
	lsl r1, r1, #4
	str r0, [r2, r1]
	ldr r2, [r4, #0xc]
	asr r0, r6, #0x1f
	lsl r1, r2, #2
	add r1, r2, r1
	lsl r1, r1, #6
	add r1, r4, r1
	add r2, r5, r1
	ldr r1, _02239320 ; =0x00000754
	str r6, [r2, r1]
	add r1, r1, #4
	str r0, [r2, r1]
	b _0223910E
_02239084:
	lsl r0, r1, #2
	add r0, r1, r0
	lsl r0, r0, #6
	add r0, r4, r0
	add r2, r5, r0
	ldr r1, _02239324 ; =0x00004E20
	ldr r0, _0223931C ; =0x0000074C
	str r1, [r2, r0]
	sub r0, #0x38
	ldr r2, [r4, r0]
	mov r0, #0x72
	ldr r1, [r4, #0xc]
	lsl r0, r0, #2
	mul r0, r1
	add r0, r2, r0
	add r0, r6, r0
	ldrb r0, [r0, #4]
	mov r1, #4
	bl ov40_0222E658
	ldr r2, [r4, #0xc]
	lsl r1, r2, #2
	add r1, r2, r1
	lsl r1, r1, #6
	add r1, r4, r1
	add r2, r5, r1
	mov r1, #0x75
	lsl r1, r1, #4
	str r0, [r2, r1]
	sub r1, #0x3c
	ldr r2, [r4, r1]
	mov r1, #0x72
	ldr r0, [r4, #0xc]
	lsl r1, r1, #2
	mul r1, r0
	add r2, r2, r1
	ldr r1, [sp]
	add r1, r1, r2
	add r1, #0x14
	ldmia r1!, {r2, r3}
	lsl r1, r0, #2
	add r0, r0, r1
	lsl r0, r0, #6
	add r0, r4, r0
	add r1, r5, r0
	ldr r0, _02239320 ; =0x00000754
	add r0, r1, r0
	stmia r0!, {r2, r3}
	ldr r1, [r4, #0xc]
	lsl r0, r1, #2
	add r0, r1, r0
	lsl r0, r0, #6
	add r0, r4, r0
	add r3, r0, r5
	ldr r0, _02239320 ; =0x00000754
	ldr r2, [r3, r0]
	add r0, r0, #4
	ldr r1, [r3, r0]
	ldr r7, _02239328 ; =0x8AC72304
	ldr r0, _0223932C ; =0x89E7FFFF
	sub r0, r2, r0
	sbc r1, r7
	blo _0223910E
	ldr r1, _0223932C ; =0x89E7FFFF
	ldr r0, _02239320 ; =0x00000754
	str r1, [r3, r0]
	ldr r1, _02239328 ; =0x8AC72304
	add r0, r0, #4
	str r1, [r3, r0]
_0223910E:
	ldr r0, [sp]
	add r6, r6, #1
	add r0, #8
	add r5, #0x10
	str r0, [sp]
	cmp r6, #0x10
	blt _0223902C
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_02239120:
	mov r1, #0
	add r0, r1, #0
	add r7, r1, #0
_02239126:
	ldr r2, [r4, #0x1c]
	ldr r3, [r4, #0xc]
	cmp r2, #0
	bne _02239176
	lsl r2, r3, #2
	add r2, r3, r2
	lsl r2, r2, #6
	add r2, r4, r2
	add r5, r0, r2
	ldr r3, _02239330 ; =0x00007530
	ldr r2, _0223931C ; =0x0000074C
	str r3, [r5, r2]
	sub r2, #0x34
	ldr r3, [r4, #0xc]
	mov r5, #0x48
	ldr r2, [r4, r2]
	mul r5, r3
	add r2, r2, r5
	lsl r5, r3, #2
	add r3, r3, r5
	add r2, r1, r2
	lsl r3, r3, #6
	add r3, r4, r3
	add r5, r0, r3
	mov r3, #0x75
	ldrb r2, [r2, #0x14]
	lsl r3, r3, #4
	str r2, [r5, r3]
	ldr r5, [r4, #0xc]
	asr r3, r1, #0x1f
	lsl r2, r5, #2
	add r2, r5, r2
	lsl r2, r2, #6
	add r2, r4, r2
	ldr r5, _02239320 ; =0x00000754
	add r2, r0, r2
	str r1, [r2, r5]
	add r5, r5, #4
	str r3, [r2, r5]
	b _022391FE
_02239176:
	lsl r2, r3, #2
	add r2, r3, r2
	lsl r2, r2, #6
	add r2, r4, r2
	add r5, r0, r2
	ldr r3, _02239334 ; =0x00009C40
	ldr r2, _0223931C ; =0x0000074C
	str r3, [r5, r2]
	sub r2, #0x38
	mov r5, #0x72
	ldr r3, [r4, #0xc]
	lsl r5, r5, #2
	ldr r2, [r4, r2]
	mul r5, r3
	add r2, r2, r5
	lsl r5, r3, #2
	add r2, r1, r2
	add r3, r3, r5
	add r2, #0x94
	lsl r3, r3, #6
	add r3, r4, r3
	add r5, r0, r3
	mov r3, #0x75
	ldrb r2, [r2]
	lsl r3, r3, #4
	str r2, [r5, r3]
	add r2, r3, #0
	sub r2, #0x3c
	mov r3, #0x72
	ldr r5, [r4, #0xc]
	lsl r3, r3, #2
	ldr r2, [r4, r2]
	mul r3, r5
	add r2, r2, r3
	add r6, r7, r2
	add r6, #0xa0
	ldmia r6!, {r2, r3}
	lsl r6, r5, #2
	add r5, r5, r6
	lsl r5, r5, #6
	add r5, r4, r5
	add r6, r0, r5
	ldr r5, _02239320 ; =0x00000754
	add r5, r6, r5
	stmia r5!, {r2, r3}
	ldr r3, [r4, #0xc]
	lsl r2, r3, #2
	add r2, r3, r2
	lsl r2, r2, #6
	add r2, r4, r2
	add r5, r2, r0
	ldr r2, _02239320 ; =0x00000754
	ldr r3, [r5, r2]
	add r2, r2, #4
	ldr r2, [r5, r2]
	ldr r6, _02239328 ; =0x8AC72304
	str r6, [sp, #0xc]
	ldr r6, _0223932C ; =0x89E7FFFF
	sub r3, r3, r6
	ldr r3, [sp, #0xc]
	sbc r2, r3
	blo _022391FE
	ldr r3, _0223932C ; =0x89E7FFFF
	ldr r2, _02239320 ; =0x00000754
	str r3, [r5, r2]
	ldr r3, _02239328 ; =0x8AC72304
	add r2, r2, #4
	str r3, [r5, r2]
_022391FE:
	add r1, r1, #1
	add r0, #0x10
	add r7, #8
	cmp r1, #0xc
	blt _02239126
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_0223920C:
	mov r7, #0
	add r0, r7, #0
	add r1, r7, #0
	str r7, [sp, #0x10]
_02239214:
	ldr r2, [r4, #0x1c]
	ldr r3, [r4, #0xc]
	cmp r2, #0
	bne _02239264
	lsl r2, r3, #2
	add r2, r3, r2
	lsl r2, r2, #6
	add r2, r4, r2
	add r5, r0, r2
	ldr r3, _02239338 ; =0x0000C350
	ldr r2, _0223931C ; =0x0000074C
	str r3, [r5, r2]
	sub r2, #0x34
	ldr r3, [r4, #0xc]
	mov r5, #0x48
	ldr r2, [r4, r2]
	mul r5, r3
	add r2, r2, r5
	lsl r5, r3, #2
	add r3, r3, r5
	add r2, r1, r2
	lsl r3, r3, #6
	add r3, r4, r3
	add r5, r0, r3
	mov r3, #0x75
	ldrh r2, [r2, #0x20]
	lsl r3, r3, #4
	str r2, [r5, r3]
	ldr r5, [r4, #0xc]
	asr r3, r7, #0x1f
	lsl r2, r5, #2
	add r2, r5, r2
	lsl r2, r2, #6
	add r2, r4, r2
	ldr r5, _02239320 ; =0x00000754
	add r2, r0, r2
	str r7, [r2, r5]
	add r5, r5, #4
	str r3, [r2, r5]
	b _022392FE
_02239264:
	lsl r2, r3, #2
	add r2, r3, r2
	lsl r2, r2, #6
	add r2, r4, r2
	add r5, r0, r2
	ldr r3, _0223933C ; =0x0000EA60
	ldr r2, _0223931C ; =0x0000074C
	str r3, [r5, r2]
	sub r2, #0x38
	mov r5, #0x72
	ldr r3, [r4, #0xc]
	lsl r5, r5, #2
	ldr r2, [r4, r2]
	mul r5, r3
	add r2, r2, r5
	add r5, r1, r2
	mov r2, #1
	lsl r2, r2, #8
	ldrh r2, [r5, r2]
	lsl r5, r3, #2
	add r3, r3, r5
	lsl r3, r3, #6
	add r3, r4, r3
	add r5, r0, r3
	mov r3, #0x75
	lsl r3, r3, #4
	str r2, [r5, r3]
	ldr r2, [r4, #0xc]
	str r2, [sp, #4]
	add r2, r3, #0
	sub r2, #0x3c
	mov r3, #0x72
	ldr r5, [sp, #4]
	lsl r3, r3, #2
	ldr r2, [r4, r2]
	mul r3, r5
	add r3, r2, r3
	ldr r2, [sp, #0x10]
	add r3, r2, r3
	mov r2, #0x4a
	lsl r2, r2, #2
	add r5, r3, r2
	ldmia r5!, {r2, r3}
	ldr r5, [sp, #4]
	lsl r6, r5, #2
	add r5, r5, r6
	lsl r5, r5, #6
	add r5, r4, r5
	add r6, r0, r5
	ldr r5, _02239320 ; =0x00000754
	add r5, r6, r5
	stmia r5!, {r2, r3}
	ldr r3, [r4, #0xc]
	lsl r2, r3, #2
	add r2, r3, r2
	lsl r2, r2, #6
	add r2, r4, r2
	add r3, r2, r0
	ldr r2, _02239320 ; =0x00000754
	str r3, [sp, #8]
	ldr r5, [r3, r2]
	add r2, r2, #4
	ldr r3, [r3, r2]
	ldr r2, _02239328 ; =0x8AC72304
	mov ip, r2
	ldr r2, _0223932C ; =0x89E7FFFF
	sub r2, r5, r2
	mov r2, ip
	sbc r3, r2
	blo _022392FE
	ldr r5, _0223932C ; =0x89E7FFFF
	ldr r3, [sp, #8]
	ldr r2, _02239320 ; =0x00000754
	str r5, [r3, r2]
	ldr r5, _02239328 ; =0x8AC72304
	add r2, r2, #4
	str r5, [r3, r2]
_022392FE:
	ldr r2, [sp, #0x10]
	add r7, r7, #1
	add r2, #8
	add r0, #0x10
	add r1, r1, #2
	str r2, [sp, #0x10]
	cmp r7, #0x14
	blt _02239214
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02239314: .word 0x00000714
_02239318: .word 0x00002710
_0223931C: .word 0x0000074C
_02239320: .word 0x00000754
_02239324: .word 0x00004E20
_02239328: .word 0x8AC72304
_0223932C: .word 0x89E7FFFF
_02239330: .word 0x00007530
_02239334: .word 0x00009C40
_02239338: .word 0x0000C350
_0223933C: .word 0x0000EA60
	thumb_func_end ov40_02238FF4

	thumb_func_start ov40_02239340
ov40_02239340: ; 0x02239340
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r0, [sp, #0x14]
	mov r0, #0
	str r0, [sp, #0x18]
	mov r1, #0x86
	ldr r0, [sp, #0x14]
	lsl r1, r1, #4
	ldr r4, [r0, r1]
	ldr r5, _022393EC ; =ov40_022453B8
	mov r6, #1
	add r4, #0x84
_02239358:
	ldr r0, [r5, #4]
	add r1, r4, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r5, #8]
	mov r2, #6
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	lsl r0, r6, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r3, [r5]
	ldr r0, [r0, #0x24]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	ldr r1, [r5, #8]
	ldr r0, [r5, #0xc]
	mul r0, r1
	add r6, r6, r0
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	ldr r0, [r0, #0x48]
	add r1, #0x50
	bl NewString_ReadMsgData
	add r7, r0, #0
	add r0, r4, #0
	add r1, r7, #0
	bl ov40_022306C0
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _022393F0 ; =0x000F0D00
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r2, r7, #0
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add r0, r7, #0
	bl String_dtor
	ldr r0, [sp, #0x18]
	add r4, #0x10
	add r0, r0, #1
	add r5, #0x10
	str r0, [sp, #0x18]
	cmp r0, #2
	blt _02239358
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022393EC: .word ov40_022453B8
_022393F0: .word 0x000F0D00
	thumb_func_end ov40_02239340

	thumb_func_start ov40_022393F4
ov40_022393F4: ; 0x022393F4
	push {r3, r4, r5, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r5, [r0, r1]
	mov r4, #0
	add r5, #0x84
_02239400:
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #2
	blt _02239400
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_022393F4

	thumb_func_start ov40_02239418
ov40_02239418: ; 0x02239418
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	mov r1, #0x86
	lsl r1, r1, #4
	str r0, [sp, #0x14]
	ldr r0, [r0, r1]
	ldr r6, _02239508 ; =ov40_022453D8
	str r0, [sp, #0x1c]
	ldr r4, [sp, #0x1c]
	mov r0, #0
	ldr r5, _0223950C ; =ov40_022453F8
	mov r7, #1
	str r0, [sp, #0x18]
	add r4, #0x24
_02239434:
	add r0, r4, #0
	bl InitWindow
	ldr r0, [sp, #0x1c]
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	bne _0223947C
	ldr r0, [r6, #4]
	add r1, r4, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r6, #8]
	mov r2, #2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [r6, #0xc]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	lsl r0, r7, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r3, [r6]
	ldr r0, [r0, #0x24]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	ldr r1, [r6, #8]
	ldr r0, [r6, #0xc]
	b _022394B4
_0223947C:
	ldr r0, [r5, #4]
	add r1, r4, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r5, #8]
	mov r2, #2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	lsl r0, r7, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r3, [r5]
	ldr r0, [r0, #0x24]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	ldr r1, [r5, #8]
	ldr r0, [r5, #0xc]
_022394B4:
	mul r0, r1
	add r7, r7, r0
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x14]
	mov r1, #0x43
	ldr r0, [r0, #0x48]
	bl NewString_ReadMsgData
	str r0, [sp, #0x20]
	mov r0, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02239510 ; =0x000F0D00
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r2, [sp, #0x20]
	add r0, r4, #0
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	ldr r0, [sp, #0x20]
	bl String_dtor
	ldr r0, [sp, #0x18]
	add r4, #0x10
	add r0, r0, #1
	add r6, #0x10
	add r5, #0x10
	str r0, [sp, #0x18]
	cmp r0, #2
	blt _02239434
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02239508: .word ov40_022453D8
_0223950C: .word ov40_022453F8
_02239510: .word 0x000F0D00
	thumb_func_end ov40_02239418

	thumb_func_start ov40_02239514
ov40_02239514: ; 0x02239514
	push {r3, r4, r5, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r5, [r0, r1]
	mov r4, #0
	add r5, #0x24
_02239520:
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #2
	blt _02239520
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_02239514

	thumb_func_start ov40_02239538
ov40_02239538: ; 0x02239538
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #0x57
	blt _02239548
	mov r5, #0
	bl GF_AssertFail
_02239548:
	ldr r6, _0223956C ; =ov40_02245CE8
	lsl r5, r5, #2
	ldr r1, [r6, r5]
	ldr r0, _02239570 ; =0x0000FFFF
	cmp r1, r0
	bne _02239558
	bl GF_AssertFail
_02239558:
	mov r0, #0x83
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl Sav2_GameStats_get
	ldr r1, [r6, r5]
	bl GameStats_GetCapped
	pop {r4, r5, r6, pc}
	nop
_0223956C: .word ov40_02245CE8
_02239570: .word 0x0000FFFF
	thumb_func_end ov40_02239538

	thumb_func_start ov40_02239574
ov40_02239574: ; 0x02239574
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1fc
	sub sp, #0x30
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	str r0, [sp, #0x14]
	mov r0, #0x6d
	bl ov40_0222DAB0
	add r6, r0, #0
	add r0, r4, #0
	add r0, #0x24
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	ldr r0, [r5, #0x4c]
	bne _022395BA
	ldr r1, _022397A4 ; =0x00000718
	ldr r3, [r4, #0xc]
	mov r2, #0x48
	ldr r1, [r4, r1]
	mul r2, r3
	ldrb r1, [r1, r2]
	sub r1, r1, #1
	bl NewString_ReadMsgData
	b _022395CE
_022395BA:
	ldr r1, _022397A8 ; =0x00000714
	mov r2, #0x72
	ldr r3, [r4, #0xc]
	lsl r2, r2, #2
	ldr r1, [r4, r1]
	mul r2, r3
	ldrb r1, [r1, r2]
	sub r1, r1, #1
	bl NewString_ReadMsgData
_022395CE:
	mov r1, #0
	add r7, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _022397AC ; =0x000F0D00
	add r2, r7, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x24
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	add r0, #0x24
	bl ScheduleWindowCopyToVram
	add r0, r7, #0
	bl String_dtor
	add r0, r4, #0
	add r0, #0x34
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	ldr r0, [r5, #0x48]
	bne _02239614
	ldr r1, [r4, #0x14]
	add r1, #0x52
	bl NewString_ReadMsgData
	b _0223961A
_02239614:
	mov r1, #0x5b
	bl NewString_ReadMsgData
_0223961A:
	mov r1, #0
	add r7, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _022397AC ; =0x000F0D00
	add r2, r7, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x34
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	add r0, #0x34
	bl ScheduleWindowCopyToVram
	add r0, r7, #0
	bl String_dtor
	ldr r0, _022397B0 ; =0x0000088C
	mov r1, #0x6d
	ldr r0, [r5, r0]
	bl sub_020315B8
	str r0, [sp, #0x18]
	ldr r1, [sp, #0x18]
	add r0, r5, #0
	bl ov40_02230DCC
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _02239668
	cmp r0, #1
	beq _022396A6
	cmp r0, #2
	beq _022396D0
	b _0223973A
_02239668:
	ldr r0, _022397B0 ; =0x0000088C
	ldr r0, [r5, r0]
	bl sub_02031700
	str r0, [sp, #0x20]
	ldr r0, [r5, #0x48]
	mov r1, #0x55
	bl NewString_ReadMsgData
	add r7, r0, #0
	ldr r0, [sp, #0x20]
	mov r1, #4
	bl ov40_0222E658
	add r1, r0, #0
	ldr r0, _022397B4 ; =0x00000744
	ldr r0, [r4, r0]
	bl NewString_ReadMsgData
	str r0, [sp, #0x1c]
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	mov r1, #0
	str r0, [sp, #4]
	ldr r2, [sp, #0x1c]
	add r0, r6, #0
	add r3, r1, #0
	bl BufferString
	b _0223973A
_022396A6:
	ldr r0, _022397B0 ; =0x0000088C
	ldr r0, [r5, r0]
	bl sub_020316F0
	str r0, [sp, #0x24]
	ldr r0, [r5, #0x48]
	mov r1, #0x56
	bl NewString_ReadMsgData
	add r7, r0, #0
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	str r0, [sp, #0x1c]
	ldr r2, [sp, #0x24]
	add r0, r6, #0
	mov r1, #0
	bl BufferMonthNameAbbr
	b _0223973A
_022396D0:
	ldr r0, _022397B0 ; =0x0000088C
	ldr r0, [r5, r0]
	bl sub_020315E0
	str r0, [sp, #0x10]
	ldr r0, _022397B0 ; =0x0000088C
	ldr r0, [r5, r0]
	bl sub_02031610
	str r0, [sp, #0x28]
	ldr r0, [r5, #0x48]
	mov r1, #0x57
	bl NewString_ReadMsgData
	add r7, r0, #0
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _022396F8
	ldr r0, _022397B8 ; =0x000001EE
	str r0, [sp, #0x10]
_022396F8:
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _0223971C
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x10]
	mov r1, #0x6d
	add r2, sp, #0x2c
	bl GetSpeciesNameIntoArray
	ldr r0, [sp, #0x1c]
	add r1, sp, #0x2c
	bl CopyU16ArrayToString
	b _02239726
_0223971C:
	ldr r0, [r5, #0x48]
	mov r1, #0x15
	bl NewString_ReadMsgData
	str r0, [sp, #0x1c]
_02239726:
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	mov r1, #0
	str r0, [sp, #4]
	ldr r2, [sp, #0x1c]
	add r0, r6, #0
	add r3, r1, #0
	bl BufferString
_0223973A:
	mov r1, #1
	str r1, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r2, [sp, #0x18]
	add r0, r6, #0
	mov r3, #0
	bl BufferString
	ldr r1, [sp, #0x14]
	add r0, r6, #0
	add r2, r7, #0
	bl StringExpandPlaceholders
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _022397AC ; =0x000F0D00
	mov r1, #0
	str r0, [sp, #8]
	add r0, r4, #0
	ldr r2, [sp, #0x14]
	add r0, #0x34
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r4, #0x34
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add r0, r7, #0
	bl String_dtor
	ldr r0, [sp, #0x1c]
	bl String_dtor
	ldr r0, [sp, #0x14]
	bl String_dtor
	ldr r0, [sp, #0x18]
	bl String_dtor
	add r0, r6, #0
	bl ScrStrBufs_ResetBuffers
	add r0, r6, #0
	bl ScrStrBufs_delete
	add sp, #0x1fc
	add sp, #0x30
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022397A4: .word 0x00000718
_022397A8: .word 0x00000714
_022397AC: .word 0x000F0D00
_022397B0: .word 0x0000088C
_022397B4: .word 0x00000744
_022397B8: .word 0x000001EE
	thumb_func_end ov40_02239574

	thumb_func_start ov40_022397BC
ov40_022397BC: ; 0x022397BC
	push {r4, lr}
	mov r2, #0x86
	lsl r2, r2, #4
	ldr r4, [r0, r2]
	cmp r1, #0
	bne _022397F0
	add r0, r4, #0
	add r0, #0xa8
	ldr r0, [r0]
	mov r1, #1
	bl sub_0200DCE8
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	mov r1, #1
	bl sub_020137C0
	add r0, r4, #0
	add r0, #0xc4
	ldr r0, [r0]
	mov r1, #0x80
	mov r2, #0xe8
	bl sub_0200DDB8
	b _02239816
_022397F0:
	add r0, r4, #0
	add r0, #0xa8
	ldr r0, [r0]
	mov r1, #0
	bl sub_0200DCE8
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	mov r1, #0
	bl sub_020137C0
	add r0, r4, #0
	add r0, #0xc4
	ldr r0, [r0]
	mov r1, #0x50
	mov r2, #0xe8
	bl sub_0200DDB8
_02239816:
	add r0, r4, #0
	add r0, #0xac
	mov r1, #0x24
	add r2, r1, #0
	ldr r0, [r0]
	sub r2, #0x2c
	bl sub_020136B4
	add r4, #0xc8
	mov r1, #0x24
	add r2, r1, #0
	ldr r0, [r4]
	sub r2, #0x2c
	bl sub_020136B4
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov40_022397BC

	thumb_func_start ov40_02239838
ov40_02239838: ; 0x02239838
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	mov r1, #2
	bl ov40_0222D73C
	add r0, r5, #0
	mov r1, #2
	bl ov40_0222D800
	add r1, r4, #0
	add r1, #0xa8
	str r0, [r1]
	add r0, r5, #0
	mov r1, #2
	bl ov40_0222D800
	add r1, r4, #0
	add r1, #0xc4
	str r0, [r1]
	add r0, r4, #0
	add r1, r5, #0
	add r0, #0xa4
	add r1, #0x14
	mov r2, #2
	bl ov40_0222D5AC
	add r0, r4, #0
	add r1, r5, #0
	add r0, #0xc0
	add r1, #0x14
	mov r2, #2
	bl ov40_0222D5AC
	add r0, r4, #0
	add r1, r5, #0
	add r0, #0xa4
	add r1, #0x14
	mov r2, #0x35
	bl ov40_0222D66C
	add r0, r4, #0
	add r1, r5, #0
	add r0, #0xc0
	add r1, #0x14
	mov r2, #3
	bl ov40_0222D66C
	add r0, r4, #0
	add r0, #0xa8
	ldr r0, [r0]
	mov r1, #0x20
	mov r2, #0xe8
	bl sub_0200DDB8
	add r0, r4, #0
	add r0, #0xc4
	ldr r0, [r0]
	mov r1, #0x80
	mov r2, #0xe8
	bl sub_0200DDB8
	add r0, r4, #0
	add r0, #0xac
	mov r1, #0x24
	add r2, r1, #0
	ldr r0, [r0]
	sub r2, #0x2c
	bl sub_020136B4
	add r0, r4, #0
	add r0, #0xc8
	mov r1, #0x24
	add r2, r1, #0
	ldr r0, [r0]
	sub r2, #0x2c
	bl sub_020136B4
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	mov r1, #0
	bl sub_020137C0
	add r4, #0xc8
	ldr r0, [r4]
	mov r1, #1
	bl sub_020137C0
	add r0, r5, #0
	mov r1, #1
	bl ov40_022397BC
	pop {r3, r4, r5, pc}
	thumb_func_end ov40_02239838

	thumb_func_start ov40_022398F8
ov40_022398F8: ; 0x022398F8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	add r0, r4, #0
	add r0, #0xa4
	bl ov40_0222D6D0
	add r0, r4, #0
	add r0, #0xc0
	bl ov40_0222D6D0
	add r0, r4, #0
	add r0, #0xa8
	ldr r0, [r0]
	bl sub_0200D9DC
	add r4, #0xc4
	ldr r0, [r4]
	bl sub_0200D9DC
	add r0, r5, #0
	bl ov40_0222D7DC
	pop {r3, r4, r5, pc}
	thumb_func_end ov40_022398F8

	thumb_func_start ov40_0223992C
ov40_0223992C: ; 0x0223992C
	push {r3, r4, r5}
	sub sp, #0xc
	ldr r5, _02239950 ; =ov40_022453A0
	add r2, r0, #0
	ldmia r5!, {r0, r1}
	add r4, sp, #0
	add r3, r4, #0
	stmia r4!, {r0, r1}
	ldr r0, [r5]
	str r0, [r4]
	ldr r0, [r2, #0x14]
	lsl r0, r0, #2
	ldr r0, [r3, r0]
	str r0, [r2, #0x20]
	add sp, #0xc
	pop {r3, r4, r5}
	bx lr
	nop
_02239950: .word ov40_022453A0
	thumb_func_end ov40_0223992C

	thumb_func_start ov40_02239954
ov40_02239954: ; 0x02239954
	push {r3, r4, r5, lr}
	add r5, r2, #0
	mov r2, #0x86
	lsl r2, r2, #4
	ldr r4, [r5, r2]
	cmp r1, #0
	bne _022399B6
	cmp r0, #0
	beq _0223996C
	cmp r0, #1
	beq _0223998A
	b _022399A8
_0223996C:
	add r0, r5, #0
	bl ov40_02230944
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	bl _s32_div_f
	str r1, [r4, #0xc]
	add r0, r5, #0
	mov r1, #4
	bl ov40_0222BF80
	pop {r3, r4, r5, pc}
_0223998A:
	add r0, r5, #0
	bl ov40_02230944
	ldr r0, [r4, #0x14]
	add r0, r0, #1
	str r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	bl _s32_div_f
	str r1, [r4, #0x14]
	add r0, r5, #0
	mov r1, #4
	bl ov40_0222BF80
	pop {r3, r4, r5, pc}
_022399A8:
	add r0, r5, #0
	bl ov40_02230944
	add r0, r5, #0
	mov r1, #7
	bl ov40_0222BF80
_022399B6:
	pop {r3, r4, r5, pc}
	thumb_func_end ov40_02239954

	thumb_func_start ov40_022399B8
ov40_022399B8: ; 0x022399B8
	push {r3, r4, r5, lr}
	ldr r1, _02239A48 ; =0x00000B38
	add r5, r0, #0
	mov r0, #0x6d
	bl AllocFromHeap
	ldr r2, _02239A48 ; =0x00000B38
	mov r1, #0
	add r4, r0, #0
	bl memset
	mov r0, #0x86
	lsl r0, r0, #4
	str r4, [r5, r0]
	add r0, #0xc
	ldr r0, [r5, r0]
	str r0, [r4, #0x1c]
	mov r0, #3
	str r0, [r4, #0x10]
	add r0, r5, #0
	bl sub_02087E1C
	cmp r0, #0
	bne _022399EE
	ldr r0, [r4, #0x10]
	sub r0, r0, #1
	str r0, [r4, #0x10]
_022399EE:
	mov r0, #3
	str r0, [r4, #0x18]
	add r0, r4, #0
	bl ov40_0223992C
	ldr r1, [r5, #0x48]
	ldr r0, _02239A4C ; =0x00000744
	str r1, [r4, r0]
	ldr r0, [r5, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	add r1, r4, #4
	mov r2, #0
	bl ov40_0222D9E8
	mov r0, #0x6d
	str r0, [sp]
	ldr r0, _02239A50 ; =ov40_022453AC
	ldr r2, _02239A54 ; =ov40_02239954
	mov r1, #3
	add r3, r5, #0
	bl sub_02026C44
	add r4, #0xdc
	str r0, [r4]
	add r0, r5, #0
	mov r1, #1
	bl ov40_0222BF80
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02239A48: .word 0x00000B38
_02239A4C: .word 0x00000744
_02239A50: .word ov40_022453AC
_02239A54: .word ov40_02239954
	thumb_func_end ov40_022399B8

	thumb_func_start ov40_02239A58
ov40_02239A58: ; 0x02239A58
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _02239A6E
	cmp r1, #1
	beq _02239ACC
	b _02239B42
_02239A6E:
	add r0, r4, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	cmp r0, #0
	beq _02239A82
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_02239A82:
	ldr r0, [r5, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r5, #0x58]
	mov r1, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #2
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02239B52
_02239ACC:
	mov r1, #1
	bl ov40_02230964
	add r0, r5, #0
	bl ov40_0222D874
	add r0, r5, #0
	bl ov40_02239838
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	mov r0, #0
	mov r1, #1
	bl SetBgPriority
	mov r0, #1
	mov r1, #3
	bl SetBgPriority
	mov r0, #2
	mov r1, #0
	bl SetBgPriority
	mov r0, #3
	mov r1, #1
	bl SetBgPriority
	mov r0, #4
	mov r1, #1
	bl SetBgPriority
	mov r0, #5
	mov r1, #3
	bl SetBgPriority
	mov r0, #6
	mov r1, #0
	bl SetBgPriority
	mov r0, #7
	mov r1, #2
	bl SetBgPriority
	add r0, r5, #0
	mov r1, #0
	bl ov40_0222FB90
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_020879E0
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02239B52
_02239B42:
	bl ov40_0222FBB4
	cmp r0, #0
	beq _02239B52
	add r0, r5, #0
	mov r1, #2
	bl ov40_0222BF80
_02239B52:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_02239A58

	thumb_func_start ov40_02239B58
ov40_02239B58: ; 0x02239B58
	push {r3, r4, r5, lr}
	sub sp, #8
	mov r1, #0x86
	add r4, r0, #0
	lsl r1, r1, #4
	ldr r5, [r4, r1]
	bl ov40_0223D5CC
	cmp r0, #0
	bne _02239B72
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, pc}
_02239B72:
	ldr r0, [r4, #8]
	cmp r0, #6
	bls _02239B7A
	b _02239EA0
_02239B7A:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02239B86: ; jump table
	.short _02239B94 - _02239B86 - 2 ; case 0
	.short _02239BD4 - _02239B86 - 2 ; case 1
	.short _02239BEC - _02239B86 - 2 ; case 2
	.short _02239CD6 - _02239B86 - 2 ; case 3
	.short _02239CF6 - _02239B86 - 2 ; case 4
	.short _02239DBA - _02239B86 - 2 ; case 5
	.short _02239E18 - _02239B86 - 2 ; case 6
_02239B94:
	mov r1, #0x6f
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	add r0, r4, #0
	mov r2, #0x80
	mov r3, #0x60
	bl ov40_0223077C
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	mov r1, #0x18
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl sub_02087A08
	ldr r1, _02239ED0 ; =0x00000117
	add r0, r4, #0
	bl ov40_0222DED0
	ldr r0, _02239ED4 ; =0x0000057D
	bl PlaySE
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02239EC8
_02239BD4:
	add r0, r4, #0
	bl ov40_0223D540
	bl ov39_022274B4
	cmp r0, #1
	beq _02239BE4
	b _02239EC8
_02239BE4:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02239EC8
_02239BEC:
	add r0, r4, #0
	bl ov40_0223D540
	add r1, sp, #4
	bl ov39_02227D44
	cmp r0, #1
	bne _02239C2A
	ldr r0, _02239ED4 ; =0x0000057D
	mov r1, #0
	bl StopSE
	add r0, r4, #0
	bl ov40_0222DFB0
	ldr r3, [sp, #4]
	add r0, r4, #0
	ldr r2, [r3, #0xc]
	ldr r3, [r3, #4]
	mov r1, #4
	bl ov40_02230CDC
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_020879E0
	mov r0, #5
	str r0, [r4, #8]
	b _02239EC8
_02239C2A:
	mov r0, #0x71
	lsl r0, r0, #4
	add r1, r5, r0
	add r0, #0xc
	str r1, [r5, r0]
	mov r0, #0x83
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl Sav2_PlayerData_GetIGTAddr
	bl GetIGTHours
	ldr r1, _02239ED8 ; =0x00000728
	strh r0, [r5, r1]
	mov r0, #0x83
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl Sav2_PlayerData_GetIGTAddr
	bl GetIGTMinutes
	ldr r1, _02239EDC ; =0x0000072A
	strb r0, [r5, r1]
	mov r0, #0x83
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl Sav2_PlayerData_GetIGTAddr
	bl GetIGTSeconds
	ldr r1, _02239EE0 ; =0x0000072B
	strb r0, [r5, r1]
	add r0, r1, #0
	sub r0, #0xf
	ldr r0, [r5, r0]
	ldrb r2, [r0]
	add r0, r1, #1
	strb r2, [r5, r0]
	add r0, r1, #0
	sub r0, #0xf
	ldr r0, [r5, r0]
	ldrb r2, [r0, #1]
	add r0, r1, #0
	add r0, #9
	strb r2, [r5, r0]
	add r0, r1, #0
	sub r0, #0xf
	ldr r0, [r5, r0]
	ldrb r2, [r0, #2]
	add r0, r1, #0
	add r0, #0x11
	strb r2, [r5, r0]
	add r1, r1, #1
	ldrb r1, [r5, r1]
	add r0, r4, #0
	sub r1, r1, #1
	bl ov40_02239538
	mov r1, #0x73
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r1, r1, #4
	ldrb r1, [r5, r1]
	add r0, r4, #0
	sub r1, r1, #1
	bl ov40_02239538
	ldr r1, _02239EE4 ; =0x00000738
	str r0, [r5, r1]
	add r1, r1, #4
	ldrb r1, [r5, r1]
	add r0, r4, #0
	sub r1, r1, #1
	bl ov40_02239538
	mov r1, #0x1d
	lsl r1, r1, #6
	str r0, [r5, r1]
	ldr r0, _02239ED4 ; =0x0000057D
	mov r1, #0
	bl StopSE
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02239EC8
_02239CD6:
	add r0, r4, #0
	bl ov40_0223D540
	ldr r1, _02239EE8 ; =0x0000088C
	ldr r2, _02239EEC ; =0x0000072C
	ldr r1, [r4, r1]
	add r2, r5, r2
	bl ov39_022274D4
	cmp r0, #1
	beq _02239CEE
	b _02239EC8
_02239CEE:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02239EC8
_02239CF6:
	add r0, r4, #0
	bl ov40_0222DFB0
	add r0, r4, #0
	bl ov40_0223D540
	add r1, sp, #4
	bl ov39_02227D44
	cmp r0, #1
	bne _02239D34
	ldr r0, _02239ED4 ; =0x0000057D
	mov r1, #0
	bl StopSE
	ldr r3, [sp, #4]
	add r0, r4, #0
	ldr r2, [r3, #0xc]
	ldr r3, [r3, #4]
	mov r1, #5
	bl ov40_02230CDC
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_020879E0
	mov r0, #5
	str r0, [r4, #8]
	b _02239EC8
_02239D34:
	ldr r1, [r5, #0x1c]
	mov r0, #0
	cmp r1, #0
	bne _02239D5C
	ldr r1, _02239EF0 ; =0x00000718
	ldr r2, [r5, r1]
	ldrb r1, [r2]
	cmp r1, #0
	beq _02239D58
	add r1, r2, #0
	add r1, #0x48
	ldrb r1, [r1]
	cmp r1, #0
	beq _02239D58
	add r2, #0x90
	ldrb r1, [r2]
	cmp r1, #0
	bne _02239D7A
_02239D58:
	mov r0, #1
	b _02239D7A
_02239D5C:
	ldr r1, _02239EF4 ; =0x00000714
	ldr r3, [r5, r1]
	ldrb r1, [r3]
	cmp r1, #0
	beq _02239D78
	mov r1, #0x72
	lsl r1, r1, #2
	ldrb r2, [r3, r1]
	cmp r2, #0
	beq _02239D78
	lsl r1, r1, #1
	ldrb r1, [r3, r1]
	cmp r1, #0
	bne _02239D7A
_02239D78:
	mov r0, #1
_02239D7A:
	cmp r0, #0
	beq _02239DA6
	mov r2, #0
	add r0, r4, #0
	mov r1, #5
	add r3, r2, #0
	bl ov40_02230CDC
	mov r1, #0x4b
	mov r0, #0x51
	lsl r1, r1, #2
	lsl r0, r0, #4
	str r1, [r4, r0]
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_020879E0
	mov r0, #5
	str r0, [r4, #8]
	b _02239EC8
_02239DA6:
	ldr r0, _02239ED4 ; =0x0000057D
	mov r1, #0
	bl StopSE
	ldr r0, _02239EF8 ; =0x00000577
	bl PlaySE
	mov r0, #0xff
	str r0, [r4, #8]
	b _02239EC8
_02239DBA:
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r4, #0
	bl ov40_022398F8
	add r0, r5, #0
	add r0, #0xdc
	ldr r0, [r0]
	bl sub_02026CAC
	add r5, #8
	add r0, r5, #0
	bl ov40_0222DAA8
	add r0, r4, #0
	bl ov40_0222D88C
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, [r4, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #1
	bl ov40_0222FB90
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02239EC8
_02239E18:
	add r0, r4, #0
	bl ov40_0222FBB4
	cmp r0, #0
	beq _02239EC8
	add r0, r5, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	cmp r0, #0
	beq _02239E6E
	add r0, r4, #0
	bl ov40_0222DD08
	add r0, r5, #0
	add r0, #8
	bl ov40_0222DAA8
	ldr r0, [r4, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r4, #0x28]
	mov r2, #0xc
	mov r3, #0x10
	bl sub_02003EA4
	mov r1, #1
	ldr r3, [r4, #0x10]
	add r0, r4, #0
	add r2, r1, #0
	bl ov40_0222BF64
	add r0, r4, #0
	mov r1, #5
	bl ov40_0222BF80
	add r0, r5, #0
	bl FreeToHeap
	b _02239EC8
_02239E6E:
	ldr r0, [r4, #0x58]
	mov r1, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #2
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02239EC8
_02239EA0:
	add r0, r4, #0
	bl ov40_02238FF4
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	mov r1, #0
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl sub_02087A08
	add r0, r4, #0
	mov r1, #5
	bl ov40_0222BF80
_02239EC8:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_02239ED0: .word 0x00000117
_02239ED4: .word 0x0000057D
_02239ED8: .word 0x00000728
_02239EDC: .word 0x0000072A
_02239EE0: .word 0x0000072B
_02239EE4: .word 0x00000738
_02239EE8: .word 0x0000088C
_02239EEC: .word 0x0000072C
_02239EF0: .word 0x00000718
_02239EF4: .word 0x00000714
_02239EF8: .word 0x00000577
	thumb_func_end ov40_02239B58

	thumb_func_start ov40_02239EFC
ov40_02239EFC: ; 0x02239EFC
	push {r3, r4, r5, lr}
	sub sp, #0x10
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _02239F14
	cmp r1, #1
	beq _02239FC0
	b _0223A022
_02239F14:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #0x24]
	mov r1, #0x3e
	mov r3, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #0x24]
	mov r1, #0x3e
	mov r3, #7
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #0x24]
	mov r1, #0x21
	mov r3, #3
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #0x24]
	mov r1, #0x22
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add r0, r5, #0
	bl ov40_02239418
	add r0, r5, #0
	bl ov40_02239574
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	ldr r0, _0223A030 ; =0x0000047C
	add r1, r5, #0
	add r0, r5, r0
	mov r2, #2
	bl ov40_0222F9E0
	add r0, r5, #0
	bl ov40_02238F00
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	add r0, r5, #0
	bl ov40_02239340
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223A028
_02239FC0:
	add r0, r4, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	mov r2, #0
	add r0, r4, #0
	add r1, r4, #4
	add r3, r2, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _02239FF0
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_02239FF0:
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r5, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223A028
_0223A022:
	mov r1, #6
	bl ov40_0222BF80
_0223A028:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0223A030: .word 0x0000047C
	thumb_func_end ov40_02239EFC

	thumb_func_start ov40_0223A034
ov40_0223A034: ; 0x0223A034
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	ldr r0, _0223A074 ; =0x0000047C
	add r0, r5, r0
	bl ov40_0222FA88
	ldr r1, _0223A078 ; =0x0000049C
	add r0, r5, r1
	sub r1, #0x10
	ldrsh r1, [r5, r1]
	bl ov40_0222F6D0
	ldr r0, _0223A07C ; =0x00000748
	add r1, r5, #0
	ldr r0, [r4, r0]
	str r0, [sp]
	ldr r0, _0223A078 ; =0x0000049C
	ldr r2, [r4, #0xc]
	ldr r3, [r4, #0x14]
	add r0, r5, r0
	bl ov40_0222F09C
	add r4, #0xdc
	ldr r0, [r4]
	bl sub_02026CC4
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0223A074: .word 0x0000047C
_0223A078: .word 0x0000049C
_0223A07C: .word 0x00000748
	thumb_func_end ov40_0223A034

	thumb_func_start ov40_0223A080
ov40_0223A080: ; 0x0223A080
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _0223A096
	cmp r1, #1
	beq _0223A0EC
	b _0223A13E
_0223A096:
	mov r1, #1
	bl ov40_02230964
	ldr r0, _0223A148 ; =0x0000047C
	add r0, r5, r0
	bl ov40_0222FA24
	ldr r0, _0223A14C ; =0x0000049C
	add r0, r5, r0
	bl ov40_0222F720
	ldr r0, _0223A150 ; =0x00000748
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0223A0B8
	bl String_dtor
_0223A0B8:
	ldr r0, _0223A14C ; =0x0000049C
	add r1, r5, #0
	add r0, r5, r0
	bl ov40_0222F920
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, _0223A154 ; =0x000006F4
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_020879E0
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223A144
_0223A0EC:
	add r0, r4, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r4, #0
	add r1, r4, #4
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223A10C
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_0223A10C:
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r5, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223A144
_0223A13E:
	mov r1, #8
	bl ov40_0222BF80
_0223A144:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223A148: .word 0x0000047C
_0223A14C: .word 0x0000049C
_0223A150: .word 0x00000748
_0223A154: .word 0x000006F4
	thumb_func_end ov40_0223A080

	thumb_func_start ov40_0223A158
ov40_0223A158: ; 0x0223A158
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _0223A16E
	cmp r1, #1
	beq _0223A19E
	b _0223A1EA
_0223A16E:
	bl ov40_022393F4
	add r0, r5, #0
	bl ov40_02239514
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r5, #0
	bl ov40_022398F8
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	add r4, #0xdc
	ldr r0, [r4]
	bl sub_02026CAC
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223A26E
_0223A19E:
	mov r1, #1
	bl ov40_02230964
	add r4, #8
	add r0, r4, #0
	bl ov40_0222DAA8
	add r0, r5, #0
	bl ov40_0222D88C
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, [r5, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	add r0, r5, #0
	mov r1, #1
	bl ov40_0222FB90
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223A26E
_0223A1EA:
	bl ov40_0222FBB4
	cmp r0, #0
	beq _0223A26E
	add r0, r4, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	cmp r0, #0
	beq _0223A23E
	add r0, r5, #0
	bl ov40_0222DD08
	add r0, r4, #0
	add r0, #8
	bl ov40_0222DAA8
	ldr r0, [r5, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r5, #0x28]
	mov r2, #0xc
	mov r3, #0x10
	bl sub_02003EA4
	mov r1, #1
	ldr r3, [r5, #0x10]
	add r0, r5, #0
	add r2, r1, #0
	bl ov40_0222BF64
	add r0, r5, #0
	mov r1, #5
	bl ov40_0222BF80
	add r0, r4, #0
	bl FreeToHeap
	b _0223A26E
_0223A23E:
	ldr r0, [r5, #0x58]
	mov r1, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #2
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
_0223A26E:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_0223A158

	thumb_func_start ov40_0223A274
ov40_0223A274: ; 0x0223A274
	push {r3, lr}
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov40_0223A274

	thumb_func_start ov40_0223A280
ov40_0223A280: ; 0x0223A280
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _0223A29A
	cmp r1, #1
	beq _0223A2D0
	cmp r1, #2
	beq _0223A2E8
	b _0223A312
_0223A29A:
	bl ov40_02238FF4
	add r0, r4, #0
	bl ov40_0223992C
	add r0, r5, #0
	bl ov40_02239514
	ldr r0, _0223A31C ; =0x0000049C
	add r0, r5, r0
	bl ov40_0222F720
	ldr r0, _0223A320 ; =0x00000748
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0223A2BE
	bl String_dtor
_0223A2BE:
	ldr r0, _0223A31C ; =0x0000049C
	add r1, r5, #0
	add r0, r5, r0
	bl ov40_0222F920
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223A318
_0223A2D0:
	mov r2, #1
	add r0, r4, #0
	add r1, r4, #4
	add r3, r2, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223A318
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223A318
_0223A2E8:
	add r0, r4, #0
	add r1, r4, #4
	mov r2, #0
	mov r3, #1
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223A318
	add r0, r5, #0
	bl ov40_02239418
	add r0, r5, #0
	bl ov40_02239574
	add r0, r5, #0
	bl ov40_02238F00
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223A318
_0223A312:
	mov r1, #6
	bl ov40_0222BF80
_0223A318:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223A31C: .word 0x0000049C
_0223A320: .word 0x00000748
	thumb_func_end ov40_0223A280

	thumb_func_start ov40_0223A324
ov40_0223A324: ; 0x0223A324
	push {r4, lr}
	mov r2, #0x86
	lsl r2, r2, #4
	ldr r1, [r1]
	ldr r4, [r0, r2]
	cmp r1, #1
	bne _0223A33E
	mov r0, #0x71
	lsl r0, r0, #4
	add r1, r4, r0
	add r0, #0xc
	str r1, [r4, r0]
	pop {r4, pc}
_0223A33E:
	bl ov40_0223D540
	ldr r1, _0223A35C ; =0x0000071C
	add r1, r4, r1
	bl ov39_02227F74
	ldr r1, _0223A35C ; =0x0000071C
	mov r2, #4
	ldr r0, [r4, r1]
	sub r1, #0xc
	add r1, r4, r1
	bl MI_CpuCopy8
	pop {r4, pc}
	nop
_0223A35C: .word 0x0000071C
	thumb_func_end ov40_0223A324

	thumb_func_start ov40_0223A360
ov40_0223A360: ; 0x0223A360
	push {r4, lr}
	mov r2, #0x86
	lsl r2, r2, #4
	ldr r1, [r1]
	ldr r4, [r0, r2]
	cmp r1, #1
	bne _0223A382
	add r1, r4, #0
	ldr r0, _0223A3B0 ; =0x00000714
	add r1, #0xe0
	str r1, [r4, r0]
	add r1, r0, #0
	sub r1, #0xdc
	add r1, r4, r1
	add r0, r0, #4
	str r1, [r4, r0]
	pop {r4, pc}
_0223A382:
	bl ov40_0223D540
	ldr r2, _0223A3B0 ; =0x00000714
	add r1, r4, r2
	add r2, r2, #4
	add r2, r4, r2
	bl ov39_02227FA8
	ldr r0, _0223A3B0 ; =0x00000714
	add r1, r4, #0
	ldr r0, [r4, r0]
	ldr r2, _0223A3B4 ; =0x00000558
	add r1, #0xe0
	bl MI_CpuCopy8
	ldr r1, _0223A3B8 ; =0x00000718
	mov r2, #0xd8
	ldr r0, [r4, r1]
	sub r1, #0xe0
	add r1, r4, r1
	bl MI_CpuCopy8
	pop {r4, pc}
	.balign 4, 0
_0223A3B0: .word 0x00000714
_0223A3B4: .word 0x00000558
_0223A3B8: .word 0x00000718
	thumb_func_end ov40_0223A360

	thumb_func_start ov40_0223A3BC
ov40_0223A3BC: ; 0x0223A3BC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x84
	ldr r4, _0223A428 ; =ov40_0224557C
	add r3, sp, #0xc
	mov r2, #0x3c
_0223A3C6:
	ldrh r1, [r4]
	add r4, r4, #2
	strh r1, [r3]
	add r3, r3, #2
	sub r2, r2, #1
	bne _0223A3C6
	mov r1, #0
	str r1, [sp, #8]
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	ldr r7, _0223A42C ; =0x00002090
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	str r0, [sp]
_0223A3E4:
	ldr r0, [sp]
	ldr r4, [sp, #4]
	lsl r1, r0, #2
	add r0, sp, #0xc
	mov r6, #0
	add r5, r0, r1
_0223A3F0:
	ldr r0, [r4, r7]
	cmp r0, #0
	beq _0223A402
	mov r1, #0
	mov r2, #2
	ldrsh r1, [r5, r1]
	ldrsh r2, [r5, r2]
	bl sub_0200DDB8
_0223A402:
	add r6, r6, #1
	add r4, #8
	add r5, r5, #4
	cmp r6, #6
	blt _0223A3F0
	ldr r0, [sp, #4]
	add r0, #0x30
	str r0, [sp, #4]
	ldr r0, [sp]
	add r0, r0, #6
	str r0, [sp]
	ldr r0, [sp, #8]
	add r0, r0, #1
	str r0, [sp, #8]
	cmp r0, #5
	blt _0223A3E4
	add sp, #0x84
	pop {r4, r5, r6, r7, pc}
	nop
_0223A428: .word ov40_0224557C
_0223A42C: .word 0x00002090
	thumb_func_end ov40_0223A3BC

	thumb_func_start ov40_0223A430
ov40_0223A430: ; 0x0223A430
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	mov r1, #2
	bl ov40_0222D6EC
	add r0, r5, #0
	mov r1, #2
	bl ov40_0222D800
	mov r1, #0x46
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r5, #0
	mov r1, #2
	bl ov40_0222D800
	mov r1, #0x4d
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, #0x20
	add r0, r4, r1
	add r1, r5, #0
	add r1, #0x14
	mov r2, #2
	bl ov40_0222D5AC
	mov r0, #0x13
	lsl r0, r0, #4
	add r1, r5, #0
	add r0, r4, r0
	add r1, #0x14
	mov r2, #2
	bl ov40_0222D5AC
	mov r0, #0x45
	lsl r0, r0, #2
	add r1, r5, #0
	add r0, r4, r0
	add r1, #0x14
	mov r2, #3
	bl ov40_0222D66C
	mov r0, #0x13
	lsl r0, r0, #4
	add r1, r5, #0
	add r0, r4, r0
	add r1, #0x14
	mov r2, #0x5e
	bl ov40_0222D66C
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DC4C
	mov r0, #0x4d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #3
	bl sub_0200DC4C
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x20
	mov r2, #0xe8
	bl sub_0200DDB8
	mov r0, #0x4d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x80
	mov r2, #0xe8
	bl sub_0200DDB8
	mov r0, #0x47
	lsl r0, r0, #2
	mov r1, #0x24
	add r2, r1, #0
	ldr r0, [r4, r0]
	sub r2, #0x2c
	bl sub_020136B4
	mov r0, #0x4e
	lsl r0, r0, #2
	mov r1, #0x24
	add r2, r1, #0
	ldr r0, [r4, r0]
	sub r2, #0x2c
	bl sub_020136B4
	mov r0, #0x47
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_020137C0
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_020137C0
	add r0, r5, #0
	mov r1, #0
	bl ov40_0223B4BC
	pop {r3, r4, r5, pc}
	thumb_func_end ov40_0223A430

	thumb_func_start ov40_0223A510
ov40_0223A510: ; 0x0223A510
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	ldr r0, _0223A638 ; =0x000008A4
	add r4, r1, #0
	sub r0, #0x44
	ldr r3, [r5, r0]
	cmp r4, #0x64
	bne _0223A58A
	mov r0, #0x65
	lsl r0, r0, #2
	ldr r0, [r3, r0]
	str r0, [sp, #0x14]
	mov r0, #0x6d
	bl ov40_0222DAB0
	add r7, r0, #0
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	add r6, r0, #0
	ldr r0, [sp, #0x14]
	mov r1, #0x6d
	bl sub_020315B8
	str r0, [sp, #0x18]
	ldr r1, [sp, #0x18]
	add r0, r5, #0
	bl ov40_02230DCC
	ldr r0, [r5, #0x48]
	add r1, r4, #0
	bl NewString_ReadMsgData
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	mov r1, #0
	str r0, [sp, #4]
	ldr r2, [sp, #0x18]
	add r0, r7, #0
	add r3, r1, #0
	bl BufferString
	add r0, r7, #0
	add r1, r6, #0
	add r2, r4, #0
	bl StringExpandPlaceholders
	ldr r0, [sp, #0x18]
	bl String_dtor
	add r0, r4, #0
	bl String_dtor
	add r0, r7, #0
	bl ScrStrBufs_delete
	b _0223A602
_0223A58A:
	cmp r4, #0x66
	bne _0223A5FA
	lsl r0, r2, #2
	add r1, r5, r0
	ldr r0, _0223A638 ; =0x000008A4
	sub r0, #0x18
	ldr r0, [r1, r0]
	str r0, [sp, #0x10]
	mov r0, #0x6d
	bl ov40_0222DAB0
	add r7, r0, #0
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	add r6, r0, #0
	ldr r0, [sp, #0x10]
	mov r1, #0x6d
	bl sub_020315B8
	str r0, [sp, #0x1c]
	ldr r1, [sp, #0x1c]
	add r0, r5, #0
	bl ov40_02230DCC
	ldr r0, [r5, #0x48]
	add r1, r4, #0
	bl NewString_ReadMsgData
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	mov r1, #0
	str r0, [sp, #4]
	ldr r2, [sp, #0x1c]
	add r0, r7, #0
	add r3, r1, #0
	bl BufferString
	add r0, r7, #0
	add r1, r6, #0
	add r2, r4, #0
	bl StringExpandPlaceholders
	ldr r0, [sp, #0x1c]
	bl String_dtor
	add r0, r4, #0
	bl String_dtor
	add r0, r7, #0
	bl ScrStrBufs_delete
	b _0223A602
_0223A5FA:
	ldr r0, [r5, #0x48]
	bl NewString_ReadMsgData
	add r6, r0, #0
_0223A602:
	ldr r0, _0223A638 ; =0x000008A4
	mov r1, #0xcc
	add r0, r5, r0
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0223A63C ; =0x000F0D0C
	add r2, r6, #0
	str r0, [sp, #8]
	ldr r0, _0223A638 ; =0x000008A4
	add r3, r1, #0
	add r0, r5, r0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r0, _0223A638 ; =0x000008A4
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	add r0, r6, #0
	bl String_dtor
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223A638: .word 0x000008A4
_0223A63C: .word 0x000F0D0C
	thumb_func_end ov40_0223A510

	thumb_func_start ov40_0223A640
ov40_0223A640: ; 0x0223A640
	push {r3, r4, r5, lr}
	sub sp, #8
	mov r1, #0x86
	add r4, r0, #0
	lsl r1, r1, #4
	ldr r5, [r4, r1]
	bl ov40_0223D5CC
	cmp r0, #0
	bne _0223A65A
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, pc}
_0223A65A:
	ldr r0, [r4, #8]
	cmp r0, #4
	bls _0223A662
	b _0223A7E8
_0223A662:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223A66E: ; jump table
	.short _0223A678 - _0223A66E - 2 ; case 0
	.short _0223A6AE - _0223A66E - 2 ; case 1
	.short _0223A6E8 - _0223A66E - 2 ; case 2
	.short _0223A72E - _0223A66E - 2 ; case 3
	.short _0223A75A - _0223A66E - 2 ; case 4
_0223A678:
	ldr r0, [r4, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x10]
	cmp r0, #0
	bne _0223A69C
	mov r0, #0x22
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #0
	bl ov40_022306A0
	b _0223A6A8
_0223A69C:
	mov r0, #0x65
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl ov40_0222E7DC
_0223A6A8:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223A6AE:
	add r0, r5, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223A6CE
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223A6CE:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223A812
_0223A6E8:
	add r0, r4, #0
	mov r1, #0x75
	bl ov40_0222DED0
	mov r1, #0x6f
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	add r0, r4, #0
	mov r2, #0x80
	mov r3, #0x60
	bl ov40_0223077C
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	mov r1, #0x18
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl sub_02087A08
	ldr r0, _0223A818 ; =0x00002038
	mov r1, #0
	str r1, [r5, r0]
	ldr r0, _0223A81C ; =0x0000057D
	bl PlaySE
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223A812
_0223A72E:
	add r0, r4, #0
	bl ov40_0223D540
	ldr r1, _0223A820 ; =0x000004D4
	ldr r1, [r4, r1]
	lsl r1, r1, #2
	add r2, r4, r1
	ldr r1, _0223A824 ; =0x00002608
	ldr r2, [r2, r1]
	add r1, r2, #0
	add r1, #0xd8
	add r2, #0xdc
	ldr r1, [r1]
	ldr r2, [r2]
	bl ov39_02227720
	cmp r0, #1
	bne _0223A812
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223A812
_0223A75A:
	add r0, r4, #0
	bl ov40_0222DFB0
	add r0, r4, #0
	bl ov40_0223D540
	add r1, sp, #4
	bl ov39_02227D44
	cmp r0, #1
	ldr r0, _0223A81C ; =0x0000057D
	bne _0223A794
	mov r1, #0
	bl StopSE
	ldr r3, [sp, #4]
	add r0, r4, #0
	ldr r2, [r3, #0xc]
	ldr r3, [r3, #4]
	mov r1, #8
	bl ov40_02230CDC
	ldr r0, [r4, #8]
	mov r1, #0
	add r0, r0, #1
	str r0, [r4, #8]
	ldr r0, _0223A818 ; =0x00002038
	str r1, [r5, r0]
	b _0223A7CC
_0223A794:
	mov r1, #0
	bl StopSE
	mov r0, #0xff
	ldr r1, _0223A818 ; =0x00002038
	str r0, [r4, #8]
	mov r2, #1
	str r2, [r5, r1]
	ldr r1, _0223A828 ; =0x0000413C
	add r2, r4, r1
	ldr r1, _0223A820 ; =0x000004D4
	ldr r1, [r4, r1]
	add r1, r2, r1
	ldr r2, _0223A82C ; =0x00000878
	str r1, [r4, r2]
	add r1, r2, #0
	add r1, #0x3c
	ldr r3, [r4, r1]
	add r1, r0, #0
	add r1, #0x85
	str r3, [r5, r1]
	add r0, #0x85
	add r2, #0x40
	add r1, r4, r2
	ldr r0, [r5, r0]
	ldr r2, _0223A830 ; =0x00001D4C
	bl MI_CpuCopy8
_0223A7CC:
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	mov r1, #0
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl sub_02087A08
	b _0223A812
_0223A7E8:
	ldr r0, _0223A818 ; =0x00002038
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0223A80A
	ldr r0, _0223A834 ; =0x00000577
	bl PlaySE
	ldr r1, _0223A838 ; =0x00002034
	add r0, r4, #0
	ldr r1, [r5, r1]
	bl ov40_0222BF80
	add r0, r4, #0
	mov r1, #1
	bl ov40_0222FC40
	b _0223A812
_0223A80A:
	add r0, r4, #0
	mov r1, #0x14
	bl ov40_0222BF80
_0223A812:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223A818: .word 0x00002038
_0223A81C: .word 0x0000057D
_0223A820: .word 0x000004D4
_0223A824: .word 0x00002608
_0223A828: .word 0x0000413C
_0223A82C: .word 0x00000878
_0223A830: .word 0x00001D4C
_0223A834: .word 0x00000577
_0223A838: .word 0x00002034
	thumb_func_end ov40_0223A640

	thumb_func_start ov40_0223A83C
ov40_0223A83C: ; 0x0223A83C
	push {r4, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r4, [r0, r1]
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02030938
	mov r0, #0x65
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_020314BC
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov40_0223A83C

	thumb_func_start ov40_0223A85C
ov40_0223A85C: ; 0x0223A85C
	push {r3, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r1, [r0, r1]
	mov r0, #0x19
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	bl sub_02026CC4
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov40_0223A85C

	thumb_func_start ov40_0223A874
ov40_0223A874: ; 0x0223A874
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _0223A88E
	cmp r1, #1
	beq _0223A89E
	cmp r1, #2
	beq _0223A8CC
	b _0223A918
_0223A88E:
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223A91E
_0223A89E:
	add r0, r4, #0
	add r1, r4, #4
	mov r2, #1
	mov r3, #2
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223A91E
	add r0, r5, #0
	bl ov40_0223CE38
	ldr r0, [r5, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223A91E
_0223A8CC:
	add r0, r4, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	add r0, r4, #0
	add r1, r4, #4
	mov r2, #0
	mov r3, #2
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223A8FE
	add r0, r5, #0
	mov r1, #0x64
	mov r2, #0
	bl ov40_0223A510
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_0223A8FE:
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223A91E
_0223A918:
	mov r1, #0xc
	bl ov40_0222BF80
_0223A91E:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_0223A874

	thumb_func_start ov40_0223A924
ov40_0223A924: ; 0x0223A924
	push {r4, r5, r6, lr}
	sub sp, #8
	mov r1, #0x86
	add r4, r0, #0
	lsl r1, r1, #4
	ldr r5, [r4, r1]
	ldr r1, [r4, #8]
	cmp r1, #7
	bls _0223A938
	b _0223AB4A
_0223A938:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223A944: ; jump table
	.short _0223A954 - _0223A944 - 2 ; case 0
	.short _0223A964 - _0223A944 - 2 ; case 1
	.short _0223A9B6 - _0223A944 - 2 ; case 2
	.short _0223A9D4 - _0223A944 - 2 ; case 3
	.short _0223AA0A - _0223A944 - 2 ; case 4
	.short _0223AA4E - _0223A944 - 2 ; case 5
	.short _0223AA94 - _0223A944 - 2 ; case 6
	.short _0223AAF0 - _0223A944 - 2 ; case 7
_0223A954:
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223ABFC
_0223A964:
	add r0, r5, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #1
	mov r3, #2
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223A99C
	ldr r0, [r4, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r1, _0223AC04 ; =0x00000116
	add r0, r4, #0
	mov r2, #0
	bl ov40_0223A510
	add r0, r4, #0
	bl ov40_022306E0
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223A99C:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223ABFC
_0223A9B6:
	ldr r2, _0223AC08 ; =0x000004D4
	ldr r1, _0223AC0C ; =0x00002028
	ldr r2, [r4, r2]
	ldr r1, [r5, r1]
	add r3, r4, r2
	ldr r2, _0223AC10 ; =0x0000413C
	ldrb r2, [r3, r2]
	bl ov40_0222FC14
	cmp r0, #0
	beq _0223AA9C
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223ABFC
_0223A9D4:
	mov r1, #0x6f
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #0x80
	mov r3, #0x60
	bl ov40_0223077C
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	mov r1, #0x18
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl sub_02087A08
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	ldr r0, _0223AC14 ; =0x0000057D
	bl PlaySE
	b _0223ABFC
_0223AA0A:
	bl ov40_0223D5CC
	cmp r0, #0
	bne _0223AA18
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_0223AA18:
	mov r1, #0x46
	add r0, r4, #0
	lsl r1, r1, #2
	mov r2, #0
	bl ov40_0223A510
	bl sub_020307F8
	mov r1, #4
	mov r2, #0
	bl sub_0203088C
	add r6, r0, #0
	add r5, r1, #0
	add r0, r4, #0
	bl ov40_0223D540
	add r1, r6, #0
	add r2, r5, #0
	bl ov39_0222774C
	cmp r0, #1
	bne _0223AA9C
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223ABFC
_0223AA4E:
	bl ov40_0223D5CC
	cmp r0, #0
	bne _0223AA5C
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_0223AA5C:
	add r0, r4, #0
	bl ov40_0223D540
	add r1, sp, #4
	bl ov39_02227D44
	cmp r0, #1
	ldr r0, _0223AC14 ; =0x0000057D
	bne _0223AA76
	mov r1, #0
	bl StopSE
	b _0223AA82
_0223AA76:
	mov r1, #0
	bl StopSE
	ldr r0, _0223AC18 ; =0x00000577
	bl PlaySE
_0223AA82:
	ldr r0, [r4, #8]
	ldr r1, _0223AC1C ; =0x00000119
	add r0, r0, #1
	str r0, [r4, #8]
	add r0, r4, #0
	mov r2, #0
	bl ov40_0223A510
	b _0223ABFC
_0223AA94:
	bl System_GetTouchNew
	cmp r0, #0
	bne _0223AA9E
_0223AA9C:
	b _0223ABFC
_0223AA9E:
	add r0, r4, #0
	bl ov40_0222DEAC
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r4, #0
	bl ov40_0223B44C
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	mov r1, #0
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl sub_02087A08
	add r0, r4, #0
	bl ov40_0222FDC4
	add r0, r4, #0
	bl ov40_0222FCCC
	ldr r0, _0223AC20 ; =0x0000049C
	add r0, r4, r0
	bl ov40_0222F734
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223ABFC
_0223AAF0:
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02026CAC
	mov r0, #0x63
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02026CAC
	mov r0, #0x19
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_02026CAC
	add r0, r4, #0
	bl ov40_0223A83C
	add r5, #8
	add r0, r5, #0
	bl ov40_0222DAA8
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r4, #0
	bl ov40_0222D88C
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	mov r0, #1
	mov r1, #0x6d
	bl sub_0203A948
	add r0, r4, #0
	mov r1, #1
	bl ov40_0222FB90
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223ABFC
_0223AB4A:
	add r0, r4, #0
	bl ov40_0222FBB4
	cmp r0, #0
	beq _0223ABFC
	add r0, r5, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	cmp r0, #0
	beq _0223ABCC
	add r0, r4, #0
	bl ov40_0222DD08
	add r0, r5, #0
	add r0, #8
	bl ov40_0222DAA8
	ldr r0, [r4, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r4, #0x28]
	mov r2, #0xc
	mov r3, #0x10
	bl sub_02003EA4
	mov r1, #1
	ldr r3, [r4, #0x10]
	add r0, r4, #0
	add r2, r1, #0
	bl ov40_0222BF64
	add r0, r4, #0
	mov r1, #5
	bl ov40_0222BF80
	ldr r0, [r4, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	add r0, r5, #0
	bl FreeToHeap
	bl sub_0202FC48
	cmp r0, #1
	bne _0223ABFC
	bl sub_0202FC24
	b _0223ABFC
_0223ABCC:
	ldr r0, [r4, #0x58]
	mov r1, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #2
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
_0223ABFC:
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_0223AC04: .word 0x00000116
_0223AC08: .word 0x000004D4
_0223AC0C: .word 0x00002028
_0223AC10: .word 0x0000413C
_0223AC14: .word 0x0000057D
_0223AC18: .word 0x00000577
_0223AC1C: .word 0x00000119
_0223AC20: .word 0x0000049C
	thumb_func_end ov40_0223A924

	thumb_func_start ov40_0223AC24
ov40_0223AC24: ; 0x0223AC24
	push {r3, r4, r5, lr}
	sub sp, #0x10
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _0223AC3C
	cmp r1, #1
	beq _0223AC9A
	b _0223ACC0
_0223AC3C:
	add r0, r4, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r4, #0
	add r1, r4, #4
	mov r2, #1
	mov r3, #2
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223AC80
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #0x24]
	mov r1, #0x54
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldr r2, _0223ACCC ; =0x00002028
	add r0, r5, #0
	ldr r2, [r4, r2]
	mov r1, #0x66
	bl ov40_0223A510
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_0223AC80:
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223ACC6
_0223AC9A:
	add r0, r4, #0
	add r1, r4, #4
	mov r2, #0
	mov r3, #2
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223ACC6
	add r0, r5, #0
	bl ov40_0223CD58
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223ACC6
_0223ACC0:
	mov r1, #0xf
	bl ov40_0222BF80
_0223ACC6:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223ACCC: .word 0x00002028
	thumb_func_end ov40_0223AC24

	thumb_func_start ov40_0223ACD0
ov40_0223ACD0: ; 0x0223ACD0
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r1, [r4, #8]
	ldr r5, [r4, r0]
	cmp r1, #3
	bls _0223ACE4
	b _0223AEEC
_0223ACE4:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223ACF0: ; jump table
	.short _0223ACF8 - _0223ACF0 - 2 ; case 0
	.short _0223AD20 - _0223ACF0 - 2 ; case 1
	.short _0223AD5A - _0223ACF0 - 2 ; case 2
	.short _0223AE82 - _0223ACF0 - 2 ; case 3
_0223ACF8:
	ldr r0, [r4, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223AF18
_0223AD20:
	add r0, r5, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223AD40
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223AD40:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223AF18
_0223AD5A:
	add r0, #0xc
	ldr r0, [r4, r0]
	cmp r0, #0xd2
	bne _0223AD9A
	mov r0, #0x45
	lsl r0, r0, #2
	add r1, r4, #0
	add r0, r5, r0
	add r1, #0x14
	mov r2, #3
	bl ov40_0222D66C
	mov r0, #0x13
	lsl r0, r0, #4
	add r1, r4, #0
	add r0, r5, r0
	add r1, #0x14
	mov r2, #0x5e
	bl ov40_0222D66C
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_0200DC4C
	mov r0, #0x4d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #3
	bl sub_0200DC4C
_0223AD9A:
	add r0, r4, #0
	bl ov40_0223CCA0
	add r0, r4, #0
	bl ov40_0223CD14
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #0x3e
	mov r3, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #0x3e
	mov r3, #7
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	ldr r0, [r5, #0x10]
	cmp r0, #0
	bne _0223AE1E
	mov r0, #0x22
	lsl r0, r0, #4
	add r0, r5, r0
	add r1, r4, #0
	bl ov40_0223064C
	mov r0, #0x22
	lsl r0, r0, #4
	add r0, r5, r0
	add r1, r4, #0
	bl ov40_02230638
	mov r0, #0x22
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #0
	bl ov40_022306A0
	mov r0, #0x22
	lsl r0, r0, #4
	add r0, r5, r0
	bl ov40_02230410
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #3
	bl ov40_022307DC
	b _0223AE5A
_0223AE1E:
	mov r0, #0x65
	lsl r0, r0, #2
	add r0, r5, r0
	add r1, r4, #0
	bl ov40_0222E7B8
	mov r0, #0x65
	lsl r0, r0, #2
	add r0, r5, r0
	add r1, r4, #0
	bl ov40_0222E79C
	mov r0, #0x65
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl ov40_0222E7DC
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #0x50
	mov r3, #3
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
_0223AE5A:
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #6
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223AF18
_0223AE82:
	add r0, r5, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	mov r2, #0
	add r0, r5, #0
	add r1, r5, #4
	add r3, r2, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223AED2
	ldr r0, [r5, #0x10]
	cmp r0, #0
	bne _0223AEB0
	mov r0, #0x22
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #1
	bl ov40_022306A0
	b _0223AEBC
_0223AEB0:
	mov r0, #0x65
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	bl ov40_0222E7DC
_0223AEBC:
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223AED2:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223AF18
_0223AEEC:
	ldr r1, _0223AF20 ; =0x00004138
	mov r0, #0
	ldr r1, [r4, r1]
	cmp r1, #0
	ble _0223AF10
	mov r1, #0x9a
	lsl r1, r1, #6
	add r5, r4, r1
	ldr r2, _0223AF20 ; =0x00004138
	add r6, r4, #0
	sub r1, #0x78
_0223AF02:
	str r5, [r6, r1]
	ldr r3, [r4, r2]
	add r0, r0, #1
	add r5, #0xe4
	add r6, r6, #4
	cmp r0, r3
	blt _0223AF02
_0223AF10:
	add r0, r4, #0
	mov r1, #7
	bl ov40_0222BF80
_0223AF18:
	mov r0, #0
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0223AF20: .word 0x00004138
	thumb_func_end ov40_0223ACD0

	thumb_func_start ov40_0223AF24
ov40_0223AF24: ; 0x0223AF24
	push {r3, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r1, [r0, r1]
	mov r0, #0x63
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl sub_02026CC4
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov40_0223AF24

	thumb_func_start ov40_0223AF3C
ov40_0223AF3C: ; 0x0223AF3C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	mov r1, #0x86
	add r4, r0, #0
	lsl r1, r1, #4
	ldr r5, [r4, r1]
	ldr r1, [r4, #8]
	cmp r1, #3
	bls _0223AF50
	b _0223B154
_0223AF50:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223AF5C: ; jump table
	.short _0223AF64 - _0223AF5C - 2 ; case 0
	.short _0223AF8C - _0223AF5C - 2 ; case 1
	.short _0223AFDC - _0223AF5C - 2 ; case 2
	.short _0223B0EA - _0223AF5C - 2 ; case 3
_0223AF64:
	ldr r0, [r4, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223B180
_0223AF8C:
	add r0, r5, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223AFC2
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r4, #0
	bl ov40_0223B44C
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223AFC2:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223B180
_0223AFDC:
	bl ov40_0223A430
	ldr r0, _0223B188 ; =0x0000086C
	ldr r0, [r4, r0]
	cmp r0, #0xd2
	bne _0223B020
	mov r0, #0x45
	lsl r0, r0, #2
	add r1, r4, #0
	add r0, r5, r0
	add r1, #0x14
	mov r2, #3
	bl ov40_0222D66C
	mov r0, #0x13
	lsl r0, r0, #4
	add r1, r4, #0
	add r0, r5, r0
	add r1, #0x14
	mov r2, #0x5e
	bl ov40_0222D66C
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_0200DC4C
	mov r0, #0x4d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #3
	bl sub_0200DC4C
_0223B020:
	add r0, r4, #0
	bl ov40_0223CD14
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #0x3e
	mov r3, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #0x3e
	mov r3, #7
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	ldr r0, [r5, #0x10]
	cmp r0, #0
	bne _0223B092
	mov r0, #0x22
	lsl r0, r0, #4
	add r0, r5, r0
	add r1, r4, #0
	bl ov40_02230638
	mov r0, #0x22
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #0
	bl ov40_022306A0
	mov r0, #0x22
	lsl r0, r0, #4
	add r0, r5, r0
	bl ov40_02230410
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #3
	bl ov40_022307DC
	b _0223B0C2
_0223B092:
	mov r0, #0x65
	lsl r0, r0, #2
	add r0, r5, r0
	add r1, r4, #0
	bl ov40_0222E79C
	mov r0, #0x65
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl ov40_0222E7DC
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #0x50
	mov r3, #3
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
_0223B0C2:
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #6
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223B180
_0223B0EA:
	add r0, r5, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	mov r2, #0
	add r0, r5, #0
	add r1, r5, #4
	add r3, r2, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223B13A
	ldr r0, [r5, #0x10]
	cmp r0, #0
	bne _0223B118
	mov r0, #0x22
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #1
	bl ov40_022306A0
	b _0223B124
_0223B118:
	mov r0, #0x65
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	bl ov40_0222E7DC
_0223B124:
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223B13A:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223B180
_0223B154:
	ldr r1, _0223B18C ; =0x00004138
	mov r0, #0
	ldr r1, [r4, r1]
	cmp r1, #0
	ble _0223B178
	mov r1, #0x9a
	lsl r1, r1, #6
	add r5, r4, r1
	ldr r2, _0223B18C ; =0x00004138
	add r6, r4, #0
	sub r1, #0x78
_0223B16A:
	str r5, [r6, r1]
	ldr r3, [r4, r2]
	add r0, r0, #1
	add r5, #0xe4
	add r6, r6, #4
	cmp r0, r3
	blt _0223B16A
_0223B178:
	add r0, r4, #0
	mov r1, #7
	bl ov40_0222BF80
_0223B180:
	mov r0, #0
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0223B188: .word 0x0000086C
_0223B18C: .word 0x00004138
	thumb_func_end ov40_0223AF3C

	thumb_func_start ov40_0223B190
ov40_0223B190: ; 0x0223B190
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _0223B1A6
	cmp r1, #1
	beq _0223B218
	b _0223B292
_0223B1A6:
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02026CAC
	mov r0, #0x63
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02026CAC
	mov r0, #0x19
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02026CAC
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	add r0, r5, #0
	bl ov40_0223A83C
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _0223B1F6
	mov r0, #0x22
	lsl r0, r0, #4
	add r0, r4, r0
	add r1, r5, #0
	bl ov40_0223064C
	b _0223B202
_0223B1F6:
	mov r0, #0x65
	lsl r0, r0, #2
	add r0, r4, r0
	add r1, r5, #0
	bl ov40_0222E7B8
_0223B202:
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	add r0, r5, #0
	bl ov40_0223CCA0
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223B298
_0223B218:
	add r0, r4, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r4, #0
	add r1, r4, #4
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223B278
	mov r0, #0x45
	lsl r0, r0, #2
	add r1, r5, #0
	add r0, r4, r0
	add r1, #0x14
	mov r2, #3
	bl ov40_0222D66C
	mov r0, #0x13
	lsl r0, r0, #4
	add r1, r5, #0
	add r0, r4, r0
	add r1, #0x14
	mov r2, #0x6f
	bl ov40_0222D66C
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DC4C
	mov r0, #0x4d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_0200DC4C
	add r0, r5, #0
	mov r1, #1
	bl ov40_0223B4BC
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_0223B278:
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223B298
_0223B292:
	mov r1, #3
	bl ov40_0222BF80
_0223B298:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov40_0223B190

	thumb_func_start ov40_0223B29C
ov40_0223B29C: ; 0x0223B29C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r1, #0
	ldr r1, _0223B36C ; =0x0000088C
	lsl r6, r2, #2
	add r4, r5, r1
	ldr r1, [r4, r6]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x48]
	cmp r1, #0
	bne _0223B2BC
	mov r1, #8
	bl NewString_ReadMsgData
	add r4, r0, #0
	b _0223B31A
_0223B2BC:
	mov r0, #0x6d
	bl ov40_0222DAB0
	add r7, r0, #0
	ldr r0, [r5, #0x48]
	mov r1, #7
	bl NewString_ReadMsgData
	str r0, [sp, #0x14]
	ldr r0, [r4, r6]
	mov r1, #0x6d
	bl sub_020315B8
	add r6, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl ov40_02230DCC
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	mov r1, #0
	str r0, [sp, #4]
	add r0, r7, #0
	add r2, r6, #0
	add r3, r1, #0
	bl BufferString
	ldr r2, [sp, #0x14]
	add r0, r7, #0
	add r1, r4, #0
	bl StringExpandPlaceholders
	ldr r0, [sp, #0x14]
	bl String_dtor
	add r0, r6, #0
	bl String_dtor
	add r0, r7, #0
	bl ScrStrBufs_delete
_0223B31A:
	add r0, sp, #0x18
	bl InitWindow
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r5, #0x24]
	add r1, sp, #0x18
	mov r2, #0x14
	mov r3, #2
	bl AddTextWindowTopLeftCorner
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0223B370 ; =0x000E0D00
	add r2, r4, #0
	str r0, [sp, #8]
	add r0, sp, #0x18
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x10]
	ldr r0, [r0, #8]
	ldr r1, [r1, #0xc]
	add r2, sp, #0x18
	mov r3, #0x6d
	bl sub_020139D0
	add r0, r4, #0
	bl String_dtor
	add r0, sp, #0x18
	bl RemoveWindow
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223B36C: .word 0x0000088C
_0223B370: .word 0x000E0D00
	thumb_func_end ov40_0223B29C

	thumb_func_start ov40_0223B374
ov40_0223B374: ; 0x0223B374
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r3, _0223B444 ; =ov40_022454C0
	ldr r4, [r0, r1]
	str r0, [sp]
	add r2, sp, #0x20
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r3, _0223B448 ; =ov40_022454D0
	add r2, sp, #0x10
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [sp]
	mov r1, #2
	bl ov40_0222D78C
	mov r0, #0x45
	lsl r0, r0, #2
	add r5, r4, r0
	add r0, sp, #0x20
	str r0, [sp, #8]
	mov r0, #0x69
	str r0, [sp, #4]
	ldr r0, [sp]
	mov r6, #0
	str r0, [sp, #0xc]
	add r0, #0x14
	add r7, sp, #0x10
	str r0, [sp, #0xc]
_0223B3BA:
	ldr r0, [sp]
	mov r1, #2
	bl ov40_0222D800
	mov r1, #0x46
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r1, [sp, #0xc]
	add r0, r5, #0
	mov r2, #2
	bl ov40_0222D5AC
	ldr r2, [sp, #8]
	ldr r1, [sp, #0xc]
	ldr r2, [r2]
	add r0, r5, #0
	bl ov40_0222D66C
	cmp r6, #3
	beq _0223B3EC
	ldr r1, [sp]
	add r0, r5, #0
	add r2, r6, #1
	bl ov40_0223B29C
_0223B3EC:
	mov r0, #0x46
	ldr r2, [sp, #4]
	lsl r0, r0, #2
	lsl r2, r2, #0x10
	ldr r0, [r4, r0]
	mov r1, #0x32
	asr r2, r2, #0x10
	bl sub_0200DDB8
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [r7]
	bl sub_0200DC4C
	mov r0, #0x47
	lsl r0, r0, #2
	mov r1, #0x24
	add r2, r1, #0
	ldr r0, [r4, r0]
	sub r2, #0x2c
	bl sub_020136B4
	mov r0, #0x47
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_020137C0
	ldr r0, [sp, #8]
	add r6, r6, #1
	add r0, r0, #4
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	add r4, #0x1c
	add r0, #0x24
	add r5, #0x1c
	add r7, r7, #4
	str r0, [sp, #4]
	cmp r6, #4
	blt _0223B3BA
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223B444: .word ov40_022454C0
_0223B448: .word ov40_022454D0
	thumb_func_end ov40_0223B374

	thumb_func_start ov40_0223B44C
ov40_0223B44C: ; 0x0223B44C
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	str r0, [sp]
	ldr r5, [r0, r1]
	mov r0, #0x45
	lsl r0, r0, #2
	mov r6, #0
	add r4, r5, r0
	add r7, r0, #4
_0223B460:
	add r0, r4, #0
	bl ov40_0222D6D0
	ldr r0, [r5, r7]
	bl sub_0200D9DC
	add r6, r6, #1
	add r4, #0x1c
	add r5, #0x1c
	cmp r6, #4
	blt _0223B460
	ldr r0, [sp]
	bl ov40_0222D7DC
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov40_0223B44C

	thumb_func_start ov40_0223B480
ov40_0223B480: ; 0x0223B480
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	mov r0, #0x45
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov40_0222D6D0
	mov r0, #0x13
	lsl r0, r0, #4
	add r0, r4, r0
	bl ov40_0222D6D0
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200D9DC
	mov r0, #0x4d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200D9DC
	add r0, r5, #0
	bl ov40_0222D7DC
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_0223B480

	thumb_func_start ov40_0223B4BC
ov40_0223B4BC: ; 0x0223B4BC
	push {r4, lr}
	mov r2, #0x86
	lsl r2, r2, #4
	ldr r4, [r0, r2]
	cmp r1, #0
	bne _0223B4F0
	mov r0, #0x4d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_0200DCE8
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_020137C0
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x20
	mov r2, #0xe8
	bl sub_0200DDB8
	b _0223B516
_0223B4F0:
	mov r0, #0x4d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DCE8
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_020137C0
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x50
	mov r2, #0xe8
	bl sub_0200DDB8
_0223B516:
	mov r0, #0x47
	lsl r0, r0, #2
	mov r1, #0x24
	add r2, r1, #0
	ldr r0, [r4, r0]
	sub r2, #0x2c
	bl sub_020136B4
	mov r0, #0x4e
	lsl r0, r0, #2
	mov r1, #0x24
	add r2, r1, #0
	ldr r0, [r4, r0]
	sub r2, #0x2c
	bl sub_020136B4
	pop {r4, pc}
	thumb_func_end ov40_0223B4BC

	thumb_func_start ov40_0223B538
ov40_0223B538: ; 0x0223B538
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r6, [r0, r1]
	ldr r0, _0223B570 ; =0x00002030
	mov r4, #0
	ldr r0, [r6, r0]
	cmp r0, #0
	ble _0223B566
	add r5, r6, #0
	ldr r7, _0223B570 ; =0x00002030
	add r5, #0x14
_0223B550:
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
	ldr r0, [r6, r7]
	add r4, r4, #1
	add r5, #0x10
	cmp r4, r0
	blt _0223B550
_0223B566:
	ldr r0, _0223B570 ; =0x00002030
	mov r1, #0
	str r1, [r6, r0]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223B570: .word 0x00002030
	thumb_func_end ov40_0223B538

	thumb_func_start ov40_0223B574
ov40_0223B574: ; 0x0223B574
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r6, [r0, r1]
	ldr r0, _0223B5AC ; =0x0000202C
	mov r4, #0
	ldr r0, [r6, r0]
	cmp r0, #0
	ble _0223B5A2
	add r5, r6, #0
	ldr r7, _0223B5AC ; =0x0000202C
	add r5, #0x94
_0223B58C:
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
	ldr r0, [r6, r7]
	add r4, r4, #1
	add r5, #0x10
	cmp r4, r0
	blt _0223B58C
_0223B5A2:
	ldr r0, _0223B5AC ; =0x0000202C
	mov r1, #0
	str r1, [r6, r0]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223B5AC: .word 0x0000202C
	thumb_func_end ov40_0223B574

	thumb_func_start ov40_0223B5B0
ov40_0223B5B0: ; 0x0223B5B0
	push {r3, r4, r5, lr}
	ldr r1, _0223B628 ; =0x0000217C
	add r5, r0, #0
	mov r0, #0x6d
	bl AllocFromHeap
	ldr r2, _0223B628 ; =0x0000217C
	mov r1, #0
	add r4, r0, #0
	bl memset
	mov r0, #0x86
	lsl r0, r0, #4
	str r4, [r5, r0]
	add r0, #0xc
	ldr r1, [r5, r0]
	mov r0, #0x4b
	lsl r0, r0, #2
	cmp r1, r0
	bne _0223B5DE
	mov r0, #0
	str r0, [r4, #0xc]
	b _0223B5F2
_0223B5DE:
	add r0, r0, #1
	cmp r1, r0
	bne _0223B5EA
	mov r0, #1
	str r0, [r4, #0xc]
	b _0223B5F2
_0223B5EA:
	cmp r1, #0xc8
	bne _0223B5F2
	mov r0, #2
	str r0, [r4, #0xc]
_0223B5F2:
	ldr r0, [r5, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	add r1, r4, #4
	mov r2, #0
	bl ov40_0222D9E8
	add r0, r5, #0
	mov r1, #1
	bl ov40_0222BF80
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223B628: .word 0x0000217C
	thumb_func_end ov40_0223B5B0

	thumb_func_start ov40_0223B62C
ov40_0223B62C: ; 0x0223B62C
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _0223B646
	cmp r1, #1
	beq _0223B6A4
	cmp r1, #2
	beq _0223B700
	b _0223B73C
_0223B646:
	add r0, r4, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	cmp r0, #0
	beq _0223B65A
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_0223B65A:
	ldr r0, [r5, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r5, #0x58]
	mov r1, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #2
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223B756
_0223B6A4:
	mov r0, #0
	mov r1, #1
	bl SetBgPriority
	mov r0, #1
	mov r1, #3
	bl SetBgPriority
	mov r0, #2
	mov r1, #0
	bl SetBgPriority
	mov r0, #3
	mov r1, #1
	bl SetBgPriority
	mov r0, #4
	mov r1, #1
	bl SetBgPriority
	mov r0, #5
	mov r1, #3
	bl SetBgPriority
	mov r0, #6
	mov r1, #0
	bl SetBgPriority
	mov r0, #7
	mov r1, #2
	bl SetBgPriority
	add r0, r5, #0
	mov r1, #0
	bl ov40_0222FB90
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_020879E0
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223B756
_0223B700:
	bl ov40_0222FBB4
	cmp r0, #0
	beq _0223B756
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r5, #0
	bl ov40_0222D874
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r5, #0
	bl ov40_0223A430
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223B756
_0223B73C:
	bl ov40_0222C4DC
	cmp r0, #1
	bne _0223B74E
	add r0, r5, #0
	mov r1, #0x13
	bl ov40_0222BF80
	b _0223B756
_0223B74E:
	add r0, r5, #0
	mov r1, #2
	bl ov40_0222BF80
_0223B756:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_0223B62C

	thumb_func_start ov40_0223B75C
ov40_0223B75C: ; 0x0223B75C
	push {r3, r4, r5, lr}
	sub sp, #8
	mov r1, #0x86
	add r4, r0, #0
	lsl r1, r1, #4
	ldr r5, [r4, r1]
	bl ov40_0223D5CC
	cmp r0, #0
	bne _0223B776
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, pc}
_0223B776:
	ldr r0, [r4, #8]
	cmp r0, #6
	bls _0223B77E
	b _0223BA36
_0223B77E:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223B78A: ; jump table
	.short _0223B798 - _0223B78A - 2 ; case 0
	.short _0223B7F0 - _0223B78A - 2 ; case 1
	.short _0223B87C - _0223B78A - 2 ; case 2
	.short _0223B8FE - _0223B78A - 2 ; case 3
	.short _0223B920 - _0223B78A - 2 ; case 4
	.short _0223B95A - _0223B78A - 2 ; case 5
	.short _0223B98E - _0223B78A - 2 ; case 6
_0223B798:
	mov r1, #0x6f
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	add r0, r4, #0
	mov r2, #0x80
	mov r3, #0x60
	bl ov40_0223077C
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	mov r1, #0x18
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl sub_02087A08
	ldr r0, _0223BA60 ; =0x0000086C
	mov r1, #0x4b
	ldr r0, [r4, r0]
	lsl r1, r1, #2
	sub r0, r0, r1
	cmp r0, #1
	bhi _0223B7DA
	add r0, r4, #0
	sub r1, #0x15
	bl ov40_0222DED0
	b _0223B7E2
_0223B7DA:
	add r0, r4, #0
	sub r1, #8
	bl ov40_0222DED0
_0223B7E2:
	ldr r0, _0223BA64 ; =0x0000057D
	bl PlaySE
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223BA58
_0223B7F0:
	ldr r0, _0223BA60 ; =0x0000086C
	ldr r1, [r4, r0]
	mov r0, #0x4b
	lsl r0, r0, #2
	cmp r1, r0
	bne _0223B816
	mov r0, #0
	str r0, [r5, #0xc]
	add r0, r4, #0
	bl ov40_0223D540
	bl ov39_022276A4
	cmp r0, #1
	bne _0223B86C
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223BA58
_0223B816:
	add r0, r0, #1
	cmp r1, r0
	bne _0223B836
	mov r0, #1
	str r0, [r5, #0xc]
	add r0, r4, #0
	bl ov40_0223D540
	bl ov39_022276E0
	cmp r0, #1
	bne _0223B86C
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223BA58
_0223B836:
	cmp r1, #0xc8
	bne _0223B876
	mov r0, #2
	str r0, [r5, #0xc]
	add r0, r4, #0
	bl sub_02087E1C
	cmp r0, #1
	bne _0223B85E
	add r0, r4, #0
	bl ov40_0223D540
	bl ov39_02227648
	cmp r0, #1
	bne _0223B86C
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223BA58
_0223B85E:
	add r0, r4, #0
	bl ov40_0223D540
	bl ov39_022275E8
	cmp r0, #1
	beq _0223B86E
_0223B86C:
	b _0223BA58
_0223B86E:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223BA58
_0223B876:
	bl GF_AssertFail
	b _0223BA58
_0223B87C:
	add r0, r4, #0
	bl ov40_0222DFB0
	add r0, r4, #0
	bl ov40_0223D540
	add r1, sp, #4
	bl ov39_02227D44
	cmp r0, #1
	ldr r0, _0223BA64 ; =0x0000057D
	bne _0223B8B0
	mov r1, #0
	bl StopSE
	ldr r3, [sp, #4]
	add r0, r4, #0
	ldr r2, [r3, #0xc]
	ldr r3, [r3, #4]
	mov r1, #7
	bl ov40_02230CDC
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223BA58
_0223B8B0:
	mov r1, #0
	bl StopSE
	ldr r0, _0223BA68 ; =0x00000577
	bl PlaySE
	ldr r0, _0223BA6C ; =0x00004138
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0223B8F8
	mov r2, #0
	add r0, r4, #0
	mov r1, #5
	add r3, r2, #0
	bl ov40_02230CDC
	ldr r0, [r5, #0xc]
	cmp r0, #2
	bne _0223B8DA
	mov r1, #0x76
	b _0223B8DE
_0223B8DA:
	mov r1, #0x4b
	lsl r1, r1, #2
_0223B8DE:
	mov r0, #0x51
	lsl r0, r0, #4
	str r1, [r4, r0]
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_020879E0
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223BA58
_0223B8F8:
	mov r0, #0xff
	str r0, [r4, #8]
	b _0223BA58
_0223B8FE:
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	mov r1, #0
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl sub_02087A08
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223BA58
_0223B920:
	add r0, r5, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223B940
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223B940:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223BA58
_0223B95A:
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r4, #0
	bl ov40_0223B480
	add r0, r4, #0
	bl ov40_0222D88C
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	mov r0, #1
	mov r1, #0x6d
	bl sub_0203A948
	add r0, r4, #0
	mov r1, #1
	bl ov40_0222FB90
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223BA58
_0223B98E:
	add r0, r4, #0
	bl ov40_0222FBB4
	cmp r0, #0
	beq _0223BA58
	add r0, r5, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	cmp r0, #0
	beq _0223BA04
	add r0, r4, #0
	bl ov40_0222DD08
	add r0, r5, #0
	add r0, #8
	bl ov40_0222DAA8
	ldr r0, [r4, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r4, #0x28]
	mov r2, #0xc
	mov r3, #0x10
	bl sub_02003EA4
	mov r1, #1
	ldr r3, [r4, #0x10]
	add r0, r4, #0
	add r2, r1, #0
	bl ov40_0222BF64
	add r0, r4, #0
	mov r1, #5
	bl ov40_0222BF80
	ldr r0, [r4, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	add r0, r5, #0
	bl FreeToHeap
	b _0223BA58
_0223BA04:
	ldr r0, [r4, #0x58]
	mov r1, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #2
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223BA58
_0223BA36:
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	mov r1, #0
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl sub_02087A08
	add r0, r4, #0
	mov r1, #3
	bl ov40_0222BF80
_0223BA58:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_0223BA60: .word 0x0000086C
_0223BA64: .word 0x0000057D
_0223BA68: .word 0x00000577
_0223BA6C: .word 0x00004138
	thumb_func_end ov40_0223B75C

	thumb_func_start ov40_0223BA70
ov40_0223BA70: ; 0x0223BA70
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	ldr r3, _0223BB68 ; =ov40_022454A4
	add r6, r4, #0
	ldmia r3!, {r0, r1}
	add r2, sp, #0x14
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r6, #0x14
	str r0, [r2]
	add r0, r6, #0
	bl InitWindow
	mov r3, #3
	str r3, [sp]
	mov r0, #0x14
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	mov r0, #0x20
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x24]
	add r1, r6, #0
	mov r2, #2
	bl AddWindowParameterized
	add r0, r6, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r1, [r4, #0xc]
	ldr r0, [r5, #0x48]
	lsl r2, r1, #2
	add r1, sp, #0x14
	ldr r1, [r1, r2]
	bl NewString_ReadMsgData
	mov r1, #0
	add r7, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0223BB6C ; =0x000F0D00
	add r2, r7, #0
	str r0, [sp, #8]
	add r0, r6, #0
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl ScheduleWindowCopyToVram
	add r0, r7, #0
	bl String_dtor
	add r6, r4, #0
	add r6, #0x94
	add r0, r6, #0
	bl InitWindow
	mov r2, #6
	str r2, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	add r0, #0xf2
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x24]
	add r1, r6, #0
	mov r3, #0xb
	bl AddWindowParameterized
	add r0, r6, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x48]
	mov r1, #0x5f
	bl NewString_ReadMsgData
	add r5, r0, #0
	mov r0, #0
	add r1, r5, #0
	add r2, r0, #0
	bl FontID_String_GetWidthMultiline
	mov r1, #0x50
	sub r0, r1, r0
	mov r1, #0
	lsr r3, r0, #1
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0223BB6C ; =0x000F0D00
	add r2, r5, #0
	str r0, [sp, #8]
	add r0, r6, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	bl String_dtor
	ldr r0, _0223BB70 ; =0x0000202C
	mov r1, #1
	str r1, [r4, r0]
	add r0, r0, #4
	str r1, [r4, r0]
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223BB68: .word ov40_022454A4
_0223BB6C: .word 0x000F0D00
_0223BB70: .word 0x0000202C
	thumb_func_end ov40_0223BA70

	thumb_func_start ov40_0223BB74
ov40_0223BB74: ; 0x0223BB74
	push {r4, r5, r6, lr}
	sub sp, #0x10
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _0223BB8E
	cmp r1, #1
	bne _0223BB8C
	b _0223BCCE
_0223BB8C:
	b _0223BD6E
_0223BB8E:
	bl sub_0202FC48
	cmp r0, #0
	beq _0223BB9A
	bl sub_0202FC24
_0223BB9A:
	ldr r0, _0223BD7C ; =0x00002054
	ldr r3, _0223BD80 ; =ov40_022454F0
	add r2, r4, r0
	mov r6, #5
_0223BBA2:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r6, r6, #1
	bne _0223BBA2
	ldr r0, [r3]
	mov r1, #0
	str r0, [r2]
	ldr r0, _0223BD7C ; =0x00002054
	str r1, [r4, r0]
	ldr r1, _0223BD84 ; =0x00004138
	add r0, r0, #4
	ldr r1, [r5, r1]
	str r1, [r4, r0]
	add r0, r5, #0
	bl ov40_0222FE00
	mov r0, #0x6d
	bl ov40_0222FE8C
	mov r1, #0x82
	lsl r1, r1, #6
	str r0, [r4, r1]
	mov r0, #0x7d
	lsl r0, r0, #2
	add r1, #8
	str r0, [r4, r1]
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #0x24]
	mov r1, #0x3e
	mov r3, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #0x24]
	mov r1, #0x3e
	mov r3, #7
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	add r0, r5, #0
	mov r1, #4
	mov r2, #3
	bl ov40_022307DC
	mov r1, #7
	add r0, r5, #0
	add r2, r1, #0
	bl ov40_022307DC
	mov r0, #8
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	add r0, r5, #0
	mov r1, #1
	bl ov40_0223B4BC
	add r0, r5, #0
	bl ov40_0223BA70
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	ldr r0, _0223BD88 ; =0x0000047C
	add r1, r5, #0
	add r0, r5, r0
	bl ov40_0222F9D4
	ldr r0, _0223BD8C ; =0x0000049C
	ldr r3, _0223BD7C ; =0x00002054
	add r0, r5, r0
	add r1, r5, #0
	mov r2, #0
	add r3, r4, r3
	bl ov40_0222E9B8
	ldr r1, _0223BD90 ; =0x000004E4
	mov r0, #1
	str r0, [r5, r1]
	add r0, r1, #0
	sub r0, #0x68
	sub r1, #0x48
	add r0, r5, r0
	add r1, r5, r1
	bl ov40_0222FA5C
	ldr r0, _0223BD8C ; =0x0000049C
	add r1, r5, #0
	add r0, r5, r0
	mov r2, #1
	bl ov40_0222F740
	ldr r0, _0223BD8C ; =0x0000049C
	mov r1, #0x40
	add r0, r5, r0
	mov r2, #0xb8
	bl ov40_0222F858
	ldr r0, _0223BD8C ; =0x0000049C
	add r1, r5, #0
	add r0, r5, r0
	bl ov40_0222F488
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r5, #0
	bl ov40_0223D008
	add r0, r5, #0
	mov r1, #0
	bl ov40_0223D1AC
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223BD74
_0223BCCE:
	add r0, r4, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	mov r2, #0
	add r0, r4, #0
	add r1, r4, #4
	add r3, r2, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223BD3C
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	add r0, r5, #0
	mov r1, #1
	bl ov40_0223D1AC
	ldr r3, _0223BD94 ; =0x000004D8
	mov r1, #0x6f
	ldr r6, [r5, r3]
	mov r3, #0x18
	mul r3, r6
	lsl r1, r1, #4
	add r3, #0x4c
	lsl r3, r3, #0x10
	ldr r1, [r5, r1]
	add r0, r5, #0
	mov r2, #0x10
	asr r3, r3, #0x10
	bl ov40_0223077C
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	mov r1, #0xc
	ldr r0, [r5, r0]
	add r2, r1, #0
	bl sub_02087A08
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_0223BD3C:
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r5, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223BD74
_0223BD6E:
	mov r1, #4
	bl ov40_0222BF80
_0223BD74:
	mov r0, #0
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0223BD7C: .word 0x00002054
_0223BD80: .word ov40_022454F0
_0223BD84: .word 0x00004138
_0223BD88: .word 0x0000047C
_0223BD8C: .word 0x0000049C
_0223BD90: .word 0x000004E4
_0223BD94: .word 0x000004D8
	thumb_func_end ov40_0223BB74

	thumb_func_start ov40_0223BD98
ov40_0223BD98: ; 0x0223BD98
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _0223BDB4
	cmp r1, #1
	beq _0223BE42
	cmp r1, #2
	bne _0223BDB2
	b _0223BEBC
_0223BDB2:
	b _0223BF56
_0223BDB4:
	ldr r0, _0223BF64 ; =0x0000047C
	add r0, r5, r0
	bl ov40_0222FA88
	ldr r1, _0223BF68 ; =0x0000049C
	add r0, r5, r1
	sub r1, #0x10
	ldrsh r1, [r5, r1]
	bl ov40_0222F5EC
	ldr r0, _0223BF68 ; =0x0000049C
	add r1, r5, #0
	add r0, r5, r0
	bl ov40_0222F488
	ldr r2, _0223BF6C ; =0x000004D8
	mov r0, #0x6f
	ldr r3, [r5, r2]
	mov r2, #0x18
	mul r2, r3
	lsl r0, r0, #4
	add r2, #0x4c
	lsl r2, r2, #0x10
	ldr r0, [r5, r0]
	mov r1, #0x10
	asr r2, r2, #0x10
	bl sub_020878EC
	add r0, r5, #0
	bl ov40_0223D244
	ldr r0, _0223BF70 ; =ov40_02245494
	bl sub_02025320
	cmp r0, #0
	beq _0223BE22
	add r0, r5, #0
	bl ov40_02230944
	ldr r0, _0223BF74 ; =0x000004D4
	ldr r0, [r5, r0]
	lsl r0, r0, #2
	add r1, r5, r0
	ldr r0, _0223BF78 ; =0x00002608
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0223BE22
	ldr r0, _0223BF7C ; =0x00002034
	mov r1, #6
	str r1, [r4, r0]
	mov r0, #0
	str r0, [r4, #0x10]
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_0223BE22:
	ldr r0, _0223BF80 ; =ov40_02245498
	bl sub_02025320
	cmp r0, #0
	bne _0223BE2E
	b _0223BF5E
_0223BE2E:
	add r0, r5, #0
	bl ov40_02230944
	ldr r0, _0223BF7C ; =0x00002034
	mov r1, #5
	str r1, [r4, r0]
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223BF5E
_0223BE42:
	ldr r0, _0223BF64 ; =0x0000047C
	add r0, r5, r0
	bl ov40_0222FA24
	ldr r0, _0223BF68 ; =0x0000049C
	add r0, r5, r0
	bl ov40_0222F720
	ldr r0, _0223BF68 ; =0x0000049C
	add r1, r5, #0
	add r0, r5, r0
	bl ov40_0222F920
	mov r0, #0x82
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl ov40_0222FE98
	add r0, r5, #0
	bl ov40_0223D1F0
	add r0, r5, #0
	bl ov40_0222FE68
	add r0, r5, #0
	bl ov40_0223B538
	add r0, r5, #0
	bl ov40_0223B574
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	mov r1, #0
	ldr r0, [r5, r0]
	add r2, r1, #0
	bl sub_02087A08
	ldr r0, _0223BF7C ; =0x00002034
	ldr r0, [r4, r0]
	cmp r0, #5
	bne _0223BEB6
	ldr r0, _0223BF64 ; =0x0000047C
	add r0, r5, r0
	bl ov40_0222FA18
	ldr r0, _0223BF68 ; =0x0000049C
	add r0, r5, r0
	bl ov40_0222F734
	ldr r0, _0223BF84 ; =0x00002084
	mov r1, #0
	str r1, [r4, r0]
_0223BEB6:
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_0223BEBC:
	add r0, r4, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r4, #0
	add r1, r4, #4
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223BF24
	add r0, r5, #0
	mov r1, #0
	bl ov40_0223B4BC
	ldr r0, _0223BF7C ; =0x00002034
	ldr r0, [r4, r0]
	cmp r0, #6
	bne _0223BF1E
	mov r0, #0x45
	lsl r0, r0, #2
	add r1, r5, #0
	add r0, r4, r0
	add r1, #0x14
	mov r2, #3
	bl ov40_0222D66C
	mov r0, #0x13
	lsl r0, r0, #4
	add r1, r5, #0
	add r0, r4, r0
	add r1, #0x14
	mov r2, #0x5e
	bl ov40_0222D66C
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DC4C
	mov r0, #0x4d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #3
	bl sub_0200DC4C
_0223BF1E:
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_0223BF24:
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r5, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223BF5E
_0223BF56:
	ldr r1, _0223BF7C ; =0x00002034
	ldr r1, [r4, r1]
	bl ov40_0222BF80
_0223BF5E:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0223BF64: .word 0x0000047C
_0223BF68: .word 0x0000049C
_0223BF6C: .word 0x000004D8
_0223BF70: .word ov40_02245494
_0223BF74: .word 0x000004D4
_0223BF78: .word 0x00002608
_0223BF7C: .word 0x00002034
_0223BF80: .word ov40_02245498
_0223BF84: .word 0x00002084
	thumb_func_end ov40_0223BD98

	thumb_func_start ov40_0223BF88
ov40_0223BF88: ; 0x0223BF88
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _0223BFA2
	cmp r1, #1
	beq _0223BFBA
	cmp r1, #2
	beq _0223C00A
	b _0223C030
_0223BFA2:
	bl ov40_0223B538
	add r0, r5, #0
	bl ov40_0223B574
	add r0, r5, #0
	bl ov40_0222DFB0
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223C0D4
_0223BFBA:
	add r0, r4, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r4, #0
	add r1, r4, #4
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223BFF0
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r5, #0
	bl ov40_0223B480
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_0223BFF0:
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223C0D4
_0223C00A:
	add r4, #8
	add r0, r4, #0
	bl ov40_0222DAA8
	add r0, r5, #0
	bl ov40_0222D88C
	mov r0, #1
	mov r1, #0x6d
	bl sub_0203A948
	add r0, r5, #0
	mov r1, #1
	bl ov40_0222FB90
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223C0D4
_0223C030:
	bl ov40_0222FBB4
	cmp r0, #0
	beq _0223C0D4
	add r0, r4, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	cmp r0, #0
	beq _0223C0A4
	add r0, r5, #0
	bl ov40_0222DD08
	add r0, r4, #0
	add r0, #8
	bl ov40_0222DAA8
	ldr r0, [r5, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r5, #0x28]
	mov r2, #0xc
	mov r3, #0x10
	bl sub_02003EA4
	mov r1, #1
	ldr r3, [r5, #0x10]
	add r0, r5, #0
	add r2, r1, #0
	bl ov40_0222BF64
	add r0, r5, #0
	mov r1, #5
	bl ov40_0222BF80
	ldr r0, [r5, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	bl FreeToHeap
	b _0223C0D4
_0223C0A4:
	ldr r0, [r5, #0x58]
	mov r1, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #2
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
_0223C0D4:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov40_0223BF88

	thumb_func_start ov40_0223C0D8
ov40_0223C0D8: ; 0x0223C0D8
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r4, r0, #0
	lsl r1, r1, #4
	ldr r5, [r4, r1]
	ldr r1, [r4, #8]
	cmp r1, #3
	bls _0223C0EA
	b _0223C21A
_0223C0EA:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223C0F6: ; jump table
	.short _0223C0FE - _0223C0F6 - 2 ; case 0
	.short _0223C10E - _0223C0F6 - 2 ; case 1
	.short _0223C15C - _0223C0F6 - 2 ; case 2
	.short _0223C1BE - _0223C0F6 - 2 ; case 3
_0223C0FE:
	mov r1, #6
	mov r2, #7
	bl ov40_022307DC
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223C222
_0223C10E:
	bl ov40_0223CFA8
	mov r0, #0x6d
	str r0, [sp]
	ldr r0, _0223C228 ; =ov40_022454E0
	ldr r2, _0223C22C ; =ov40_0223CE64
	mov r1, #4
	add r3, r4, #0
	bl sub_02026C44
	mov r1, #0x62
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0x6d
	str r0, [sp]
	ldr r0, _0223C230 ; =ov40_022454B0
	ldr r2, _0223C234 ; =ov40_0223CF00
	mov r1, #4
	add r3, r4, #0
	bl sub_02026C44
	mov r1, #0x63
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0x6d
	str r0, [sp]
	ldr r0, _0223C238 ; =ov40_0224549C
	ldr r2, _0223C23C ; =ov40_0223CF70
	mov r1, #2
	add r3, r4, #0
	bl sub_02026C44
	mov r1, #0x19
	lsl r1, r1, #4
	str r0, [r5, r1]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223C222
_0223C15C:
	mov r1, #1
	bl ov40_02230964
	mov r0, #0x22
	lsl r0, r0, #4
	add r0, r5, r0
	add r1, r4, #0
	bl ov40_02230638
	mov r0, #0x22
	lsl r0, r0, #4
	add r0, r5, r0
	bl ov40_02230410
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #3
	bl ov40_022307DC
	mov r0, #0x22
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #0
	bl ov40_022306A0
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223C222
_0223C1BE:
	add r0, r5, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	mov r2, #0
	add r0, r5, #0
	add r1, r5, #4
	add r3, r2, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223C200
	mov r0, #0x22
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #1
	bl ov40_022306A0
	add r0, r4, #0
	bl ov40_0223CD14
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223C200:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223C222
_0223C21A:
	add r0, r4, #0
	mov r1, #7
	bl ov40_0222BF80
_0223C222:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0223C228: .word ov40_022454E0
_0223C22C: .word ov40_0223CE64
_0223C230: .word ov40_022454B0
_0223C234: .word ov40_0223CF00
_0223C238: .word ov40_0224549C
_0223C23C: .word ov40_0223CF70
	thumb_func_end ov40_0223C0D8

	thumb_func_start ov40_0223C240
ov40_0223C240: ; 0x0223C240
	push {r3, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r1, [r0, r1]
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl sub_02026CC4
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov40_0223C240

	thumb_func_start ov40_0223C258
ov40_0223C258: ; 0x0223C258
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #3
	bls _0223C26A
	b _0223C388
_0223C26A:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223C276: ; jump table
	.short _0223C27E - _0223C276 - 2 ; case 0
	.short _0223C2BC - _0223C276 - 2 ; case 1
	.short _0223C2D4 - _0223C276 - 2 ; case 2
	.short _0223C340 - _0223C276 - 2 ; case 3
_0223C27E:
	mov r1, #1
	bl ov40_02230964
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _0223C298
	mov r0, #0x22
	lsl r0, r0, #4
	add r0, r4, r0
	add r1, r5, #0
	bl ov40_0223064C
	b _0223C2A4
_0223C298:
	mov r0, #0x65
	lsl r0, r0, #2
	add r0, r4, r0
	add r1, r5, #0
	bl ov40_0222E7B8
_0223C2A4:
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223C3A0
_0223C2BC:
	mov r2, #1
	add r0, r4, #0
	add r1, r4, #4
	add r3, r2, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223C3A0
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223C3A0
_0223C2D4:
	mov r1, #1
	bl ov40_02230964
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _0223C304
	mov r0, #0x65
	lsl r0, r0, #2
	add r0, r4, r0
	add r1, r5, #0
	bl ov40_0222E79C
	mov r0, #0x65
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	bl ov40_0222E7DC
	add r0, r5, #0
	mov r1, #0x50
	mov r2, #3
	bl ov40_022307DC
	b _0223C330
_0223C304:
	mov r0, #0x22
	lsl r0, r0, #4
	add r0, r4, r0
	add r1, r5, #0
	bl ov40_02230638
	mov r0, #0x22
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl ov40_022306A0
	mov r0, #0x22
	lsl r0, r0, #4
	add r0, r4, r0
	bl ov40_02230410
	add r1, r0, #0
	add r0, r5, #0
	mov r2, #3
	bl ov40_022307DC
_0223C330:
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223C3A0
_0223C340:
	add r0, r4, #0
	add r1, r4, #4
	mov r2, #0
	mov r3, #1
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223C3A0
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _0223C364
	mov r0, #0x65
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ov40_0222E7DC
	b _0223C370
_0223C364:
	mov r0, #0x22
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #1
	bl ov40_022306A0
_0223C370:
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223C3A0
_0223C388:
	ldr r1, [r4, #0x10]
	mov r0, #1
	eor r1, r0
	str r1, [r4, #0x10]
	add r0, r5, #0
	add r1, #0x79
	bl ov40_0223CCBC
	add r0, r5, #0
	mov r1, #7
	bl ov40_0222BF80
_0223C3A0:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov40_0223C258

	thumb_func_start ov40_0223C3A4
ov40_0223C3A4: ; 0x0223C3A4
	push {r4, r5, lr}
	sub sp, #0xc
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _0223C3C0
	cmp r1, #1
	beq _0223C3E0
	cmp r1, #2
	beq _0223C3F0
	b _0223C482
_0223C3C0:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x6d
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223C48E
_0223C3E0:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0223C48E
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223C48E
_0223C3F0:
	mov r1, #1
	bl ov40_02230964
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _0223C40A
	mov r0, #0x22
	lsl r0, r0, #4
	add r0, r4, r0
	add r1, r5, #0
	bl ov40_0223064C
	b _0223C416
_0223C40A:
	mov r0, #0x65
	lsl r0, r0, #2
	add r0, r4, r0
	add r1, r5, #0
	bl ov40_0222E7B8
_0223C416:
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02026CAC
	mov r0, #0x63
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02026CAC
	mov r0, #0x19
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02026CAC
	add r0, r5, #0
	bl ov40_0223A83C
	add r0, r5, #0
	bl ov40_0223CCA0
	add r0, r5, #0
	bl ov40_0223D504
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r5, #0
	bl ov40_0222D8C8
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	ldr r1, [r5, #0x10]
	add r0, r5, #0
	ldr r1, [r1]
	bl ov40_0222C4E8
	ldr r0, _0223C494 ; =0x00000868
	mov r1, #1
	ldr r0, [r5, r0]
	mov r2, #0
	bl sub_02087A84
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223C48E
_0223C482:
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_0223C48E:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_0223C494: .word 0x00000868
	thumb_func_end ov40_0223C3A4

	thumb_func_start ov40_0223C498
ov40_0223C498: ; 0x0223C498
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	mov r1, #0x86
	add r4, r0, #0
	lsl r1, r1, #4
	ldr r5, [r4, r1]
	ldr r1, [r4, #8]
	cmp r1, #5
	bls _0223C4AC
	b _0223C6CC
_0223C4AC:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223C4B8: ; jump table
	.short _0223C4C4 - _0223C4B8 - 2 ; case 0
	.short _0223C592 - _0223C4B8 - 2 ; case 1
	.short _0223C5E0 - _0223C4B8 - 2 ; case 2
	.short _0223C642 - _0223C4B8 - 2 ; case 3
	.short _0223C69E - _0223C4B8 - 2 ; case 4
	.short _0223C6BC - _0223C4B8 - 2 ; case 5
_0223C4C4:
	bl ov40_02230738
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #0
	bl ov40_0222D9E8
	ldr r0, _0223C6E8 ; =0x00004138
	mov r2, #0
	ldr r0, [r4, r0]
	cmp r0, #0
	ble _0223C4F8
	mov r0, #0x9a
	lsl r0, r0, #6
	add r7, r0, #0
	add r3, r4, r0
	ldr r0, _0223C6E8 ; =0x00004138
	add r6, r4, #0
	sub r7, #0x78
_0223C4EA:
	str r3, [r6, r7]
	ldr r1, [r4, r0]
	add r2, r2, #1
	add r3, #0xe4
	add r6, r6, #4
	cmp r2, r1
	blt _0223C4EA
_0223C4F8:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #0x3e
	mov r3, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #0x3e
	mov r3, #7
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	add r0, r4, #0
	mov r1, #6
	mov r2, #7
	bl ov40_022307DC
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #0x45
	lsl r0, r0, #2
	add r1, r4, #0
	add r0, r5, r0
	add r1, #0x14
	mov r2, #3
	bl ov40_0222D66C
	mov r0, #0x13
	lsl r0, r0, #4
	add r1, r4, #0
	add r0, r5, r0
	add r1, #0x14
	mov r2, #0x5e
	bl ov40_0222D66C
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_0200DC4C
	mov r0, #0x4d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #3
	bl sub_0200DC4C
	mov r1, #0x7d
	ldr r0, _0223C6EC ; =0x00002088
	lsl r1, r1, #2
	str r1, [r5, r0]
	ldr r1, _0223C6F0 ; =0x000004A4
	sub r0, r0, #4
	ldrsh r1, [r4, r1]
	str r1, [r5, r0]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223C6E2
_0223C592:
	bl ov40_0223CFA8
	mov r0, #0x6d
	str r0, [sp]
	ldr r0, _0223C6F4 ; =ov40_022454E0
	ldr r2, _0223C6F8 ; =ov40_0223CE64
	mov r1, #4
	add r3, r4, #0
	bl sub_02026C44
	mov r1, #0x62
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0x6d
	str r0, [sp]
	ldr r0, _0223C6FC ; =ov40_022454B0
	ldr r2, _0223C700 ; =ov40_0223CF00
	mov r1, #4
	add r3, r4, #0
	bl sub_02026C44
	mov r1, #0x63
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0x6d
	str r0, [sp]
	ldr r0, _0223C704 ; =ov40_0224549C
	ldr r2, _0223C708 ; =ov40_0223CF70
	mov r1, #2
	add r3, r4, #0
	bl sub_02026C44
	mov r1, #0x19
	lsl r1, r1, #4
	str r0, [r5, r1]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223C6E2
_0223C5E0:
	mov r1, #1
	bl ov40_02230964
	mov r0, #0x22
	lsl r0, r0, #4
	add r0, r5, r0
	add r1, r4, #0
	bl ov40_02230638
	mov r0, #0x22
	lsl r0, r0, #4
	add r0, r5, r0
	bl ov40_02230410
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #3
	bl ov40_022307DC
	mov r0, #0x22
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #0
	bl ov40_022306A0
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223C6E2
_0223C642:
	add r0, r5, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	mov r2, #0
	add r0, r5, #0
	add r1, r5, #4
	add r3, r2, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223C684
	mov r0, #0x22
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #1
	bl ov40_022306A0
	add r0, r4, #0
	bl ov40_0223CD14
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223C684:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223C6E2
_0223C69E:
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x6d
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223C6E2
_0223C6BC:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0223C6E2
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223C6E2
_0223C6CC:
	ldr r0, _0223C70C ; =0x000006D8
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	add r0, r4, #0
	bl ov40_0222C4B8
	add r0, r4, #0
	mov r1, #7
	bl ov40_0222BF80
_0223C6E2:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223C6E8: .word 0x00004138
_0223C6EC: .word 0x00002088
_0223C6F0: .word 0x000004A4
_0223C6F4: .word ov40_022454E0
_0223C6F8: .word ov40_0223CE64
_0223C6FC: .word ov40_022454B0
_0223C700: .word ov40_0223CF00
_0223C704: .word ov40_0224549C
_0223C708: .word ov40_0223CF70
_0223C70C: .word 0x000006D8
	thumb_func_end ov40_0223C498

	thumb_func_start ov40_0223C710
ov40_0223C710: ; 0x0223C710
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r4, r1, #0
	ldr r1, _0223C804 ; =0x000008A4
	add r5, r0, #0
	sub r1, #0x44
	ldr r6, [r5, r1]
	mov r1, #2
	bl ov40_0222C6C8
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	ldr r0, _0223C804 ; =0x000008A4
	add r0, r5, r0
	bl InitWindow
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1e
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	mov r0, #0x4b
	lsl r0, r0, #2
	ldr r1, _0223C804 ; =0x000008A4
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x24]
	add r1, r5, r1
	mov r2, #2
	mov r3, #1
	bl AddWindowParameterized
	cmp r4, #0x64
	bne _0223C7C4
	mov r0, #0x65
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	str r0, [sp, #0x14]
	mov r0, #0x6d
	bl ov40_0222DAB0
	add r7, r0, #0
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	add r6, r0, #0
	ldr r0, [sp, #0x14]
	mov r1, #0x6d
	bl sub_020315B8
	str r0, [sp, #0x18]
	ldr r1, [sp, #0x18]
	add r0, r5, #0
	bl ov40_02230DCC
	ldr r0, [r5, #0x48]
	add r1, r4, #0
	bl NewString_ReadMsgData
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	mov r1, #0
	str r0, [sp, #4]
	ldr r2, [sp, #0x18]
	add r0, r7, #0
	add r3, r1, #0
	bl BufferString
	add r0, r7, #0
	add r1, r6, #0
	add r2, r4, #0
	bl StringExpandPlaceholders
	ldr r0, [sp, #0x18]
	bl String_dtor
	add r0, r4, #0
	bl String_dtor
	add r0, r7, #0
	bl ScrStrBufs_delete
	b _0223C7CE
_0223C7C4:
	ldr r0, [r5, #0x48]
	add r1, r4, #0
	bl NewString_ReadMsgData
	add r6, r0, #0
_0223C7CE:
	ldr r0, _0223C804 ; =0x000008A4
	mov r1, #0xcc
	add r0, r5, r0
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0223C808 ; =0x000F0D0C
	add r2, r6, #0
	str r0, [sp, #8]
	ldr r0, _0223C804 ; =0x000008A4
	add r3, r1, #0
	add r0, r5, r0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r0, _0223C804 ; =0x000008A4
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	add r0, r6, #0
	bl String_dtor
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0223C804: .word 0x000008A4
_0223C808: .word 0x000F0D0C
	thumb_func_end ov40_0223C710

	thumb_func_start ov40_0223C80C
ov40_0223C80C: ; 0x0223C80C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r5, [r4, r0]
	bl sub_020307F8
	mov r1, #4
	mov r2, #0
	bl sub_0203088C
	add r3, r0, #0
	add r2, r1, #0
	add r0, r4, #0
	add r1, r3, #0
	bl ov40_02230D94
	cmp r0, #0
	ldr r0, [r4, #8]
	bne _0223C838
	b _0223CB6C
_0223C838:
	cmp r0, #6
	bls _0223C83E
	b _0223CB3E
_0223C83E:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223C84A: ; jump table
	.short _0223C858 - _0223C84A - 2 ; case 0
	.short _0223C8BC - _0223C84A - 2 ; case 1
	.short _0223C91C - _0223C84A - 2 ; case 2
	.short _0223C92C - _0223C84A - 2 ; case 3
	.short _0223C964 - _0223C84A - 2 ; case 4
	.short _0223C9B4 - _0223C84A - 2 ; case 5
	.short _0223CAD4 - _0223C84A - 2 ; case 6
_0223C858:
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	ldr r0, [r5, #0x10]
	cmp r0, #0
	bne _0223C874
	mov r0, #0x22
	lsl r0, r0, #4
	add r0, r5, r0
	add r1, r4, #0
	bl ov40_0223064C
	b _0223C880
_0223C874:
	mov r0, #0x65
	lsl r0, r0, #2
	add r0, r5, r0
	add r1, r4, #0
	bl ov40_0222E7B8
_0223C880:
	add r0, r4, #0
	bl ov40_0223CCA0
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r4, #0
	bl ov40_0223D504
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223CC98
_0223C8BC:
	add r0, r5, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223C902
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r4, #0
	bl ov40_0223B374
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, [r4, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223C902:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223CC98
_0223C91C:
	ldr r1, _0223CC40 ; =0x00000115
	add r0, r4, #0
	bl ov40_0222DED0
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223CC98
_0223C92C:
	bl System_GetTouchNew
	cmp r0, #0
	bne _0223C936
	b _0223CC98
_0223C936:
	add r0, r4, #0
	bl ov40_0222DFB0
	ldr r0, [r4, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223CC98
_0223C964:
	add r0, r5, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223C99A
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r4, #0
	bl ov40_0223B44C
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223C99A:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223CC98
_0223C9B4:
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r4, #0
	bl ov40_0223A430
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, _0223CC44 ; =0x0000086C
	ldr r0, [r4, r0]
	cmp r0, #0xd2
	bne _0223CA0A
	mov r0, #0x45
	lsl r0, r0, #2
	add r1, r4, #0
	add r0, r5, r0
	add r1, #0x14
	mov r2, #3
	bl ov40_0222D66C
	mov r0, #0x13
	lsl r0, r0, #4
	add r1, r4, #0
	add r0, r5, r0
	add r1, #0x14
	mov r2, #0x5e
	bl ov40_0222D66C
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_0200DC4C
	mov r0, #0x4d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #3
	bl sub_0200DC4C
_0223CA0A:
	add r0, r4, #0
	bl ov40_0223CD14
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #0x3e
	mov r3, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #0x3e
	mov r3, #7
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	ldr r0, [r5, #0x10]
	cmp r0, #0
	bne _0223CA7C
	mov r0, #0x22
	lsl r0, r0, #4
	add r0, r5, r0
	add r1, r4, #0
	bl ov40_02230638
	mov r0, #0x22
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #0
	bl ov40_022306A0
	mov r0, #0x22
	lsl r0, r0, #4
	add r0, r5, r0
	bl ov40_02230410
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #3
	bl ov40_022307DC
	b _0223CAAC
_0223CA7C:
	mov r0, #0x65
	lsl r0, r0, #2
	add r0, r5, r0
	add r1, r4, #0
	bl ov40_0222E79C
	mov r0, #0x65
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl ov40_0222E7DC
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #0x50
	mov r3, #3
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
_0223CAAC:
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #6
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223CC98
_0223CAD4:
	add r0, r5, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	mov r2, #0
	add r0, r5, #0
	add r1, r5, #4
	add r3, r2, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223CB24
	ldr r0, [r5, #0x10]
	cmp r0, #0
	bne _0223CB02
	mov r0, #0x22
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #1
	bl ov40_022306A0
	b _0223CB0E
_0223CB02:
	mov r0, #0x65
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	bl ov40_0222E7DC
_0223CB0E:
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223CB24:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223CC98
_0223CB3E:
	ldr r1, _0223CC48 ; =0x00004138
	mov r0, #0
	ldr r1, [r4, r1]
	cmp r1, #0
	ble _0223CB62
	mov r1, #0x9a
	lsl r1, r1, #6
	add r5, r4, r1
	ldr r2, _0223CC48 ; =0x00004138
	add r6, r4, #0
	sub r1, #0x78
_0223CB54:
	str r5, [r6, r1]
	ldr r3, [r4, r2]
	add r0, r0, #1
	add r5, #0xe4
	add r6, r6, #4
	cmp r0, r3
	blt _0223CB54
_0223CB62:
	add r0, r4, #0
	mov r1, #7
	bl ov40_0222BF80
	b _0223CC98
_0223CB6C:
	cmp r0, #0
	beq _0223CB7A
	cmp r0, #1
	beq _0223CBDE
	cmp r0, #2
	beq _0223CC4C
	b _0223CC90
_0223CB7A:
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	ldr r0, [r5, #0x10]
	cmp r0, #0
	bne _0223CB96
	mov r0, #0x22
	lsl r0, r0, #4
	add r0, r5, r0
	add r1, r4, #0
	bl ov40_0223064C
	b _0223CBA2
_0223CB96:
	mov r0, #0x65
	lsl r0, r0, #2
	add r0, r5, r0
	add r1, r4, #0
	bl ov40_0222E7B8
_0223CBA2:
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r4, #0
	bl ov40_0223D504
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	add r0, r4, #0
	bl ov40_0223CCA0
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223CC98
_0223CBDE:
	add r0, r5, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223CC24
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r4, #0
	bl ov40_0223B374
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, [r4, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223CC24:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223CC98
	nop
_0223CC40: .word 0x00000115
_0223CC44: .word 0x0000086C
_0223CC48: .word 0x00004138
_0223CC4C:
	add r0, r5, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #0
	mov r3, #1
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223CC76
	add r0, r4, #0
	mov r1, #0x64
	mov r2, #0
	bl ov40_0223C710
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223CC76:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223CC98
_0223CC90:
	add r0, r4, #0
	mov r1, #0xc
	bl ov40_0222BF80
_0223CC98:
	mov r0, #0
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov40_0223C80C

	thumb_func_start ov40_0223CCA0
ov40_0223CCA0: ; 0x0223CCA0
	push {r4, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r4, [r0, r1]
	add r0, r4, #0
	add r0, #0x94
	bl ClearWindowTilemapAndCopyToVram
	add r4, #0x94
	add r0, r4, #0
	bl RemoveWindow
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov40_0223CCA0

	thumb_func_start ov40_0223CCBC
ov40_0223CCBC: ; 0x0223CCBC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	add r6, r1, #0
	add r4, #0x94
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x48]
	add r1, r6, #0
	bl NewString_ReadMsgData
	add r5, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	bl ov40_022306C0
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0223CD10 ; =0x000F0D00
	add r2, r5, #0
	str r0, [sp, #8]
	add r0, r4, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl String_dtor
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0223CD10: .word 0x000F0D00
	thumb_func_end ov40_0223CCBC

	thumb_func_start ov40_0223CD14
ov40_0223CD14: ; 0x0223CD14
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	add r6, r4, #0
	add r6, #0x94
	add r0, r6, #0
	bl InitWindow
	mov r0, #3
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x24]
	add r1, r6, #0
	mov r2, #6
	mov r3, #8
	bl AddWindowParameterized
	ldr r1, [r4, #0x10]
	add r0, r5, #0
	add r1, #0x79
	bl ov40_0223CCBC
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov40_0223CD14

	thumb_func_start ov40_0223CD58
ov40_0223CD58: ; 0x0223CD58
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	add r6, r4, #0
	add r6, #0x94
	add r0, r6, #0
	bl InitWindow
	mov r2, #6
	str r2, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x24]
	add r1, r6, #0
	mov r3, #4
	bl AddWindowParameterized
	add r0, r6, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x48]
	mov r1, #0x82
	bl NewString_ReadMsgData
	add r7, r0, #0
	add r0, r6, #0
	add r1, r7, #0
	bl ov40_022306C0
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0223CE34 ; =0x000F0D00
	add r2, r7, #0
	str r0, [sp, #8]
	add r0, r6, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r7, #0
	bl String_dtor
	add r0, r6, #0
	bl ScheduleWindowCopyToVram
	add r4, #0xa4
	add r0, r4, #0
	bl InitWindow
	mov r2, #6
	str r2, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	mov r0, #0x15
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x24]
	add r1, r4, #0
	mov r3, #0x12
	bl AddWindowParameterized
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x48]
	mov r1, #0x83
	bl NewString_ReadMsgData
	add r5, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	bl ov40_022306C0
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0223CE34 ; =0x000F0D00
	add r2, r5, #0
	str r0, [sp, #8]
	add r0, r4, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl String_dtor
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0223CE34: .word 0x000F0D00
	thumb_func_end ov40_0223CD58

	thumb_func_start ov40_0223CE38
ov40_0223CE38: ; 0x0223CE38
	push {r4, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r4, [r0, r1]
	add r0, r4, #0
	add r0, #0x94
	bl ClearWindowTilemapAndCopyToVram
	add r0, r4, #0
	add r0, #0x94
	bl RemoveWindow
	add r0, r4, #0
	add r0, #0xa4
	bl ClearWindowTilemapAndCopyToVram
	add r4, #0xa4
	add r0, r4, #0
	bl RemoveWindow
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov40_0223CE38

	thumb_func_start ov40_0223CE64
ov40_0223CE64: ; 0x0223CE64
	push {r3, r4, r5, lr}
	add r4, r2, #0
	mov r2, #0x86
	lsl r2, r2, #4
	ldr r5, [r4, r2]
	cmp r1, #0
	bne _0223CEF8
	cmp r0, #3
	bhi _0223CEF8
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223CE82: ; jump table
	.short _0223CE8A - _0223CE82 - 2 ; case 0
	.short _0223CE9A - _0223CE82 - 2 ; case 1
	.short _0223CEC2 - _0223CE82 - 2 ; case 2
	.short _0223CEEA - _0223CE82 - 2 ; case 3
_0223CE8A:
	add r0, r4, #0
	bl ov40_02230944
	add r0, r4, #0
	mov r1, #8
	bl ov40_0222BF80
	pop {r3, r4, r5, pc}
_0223CE9A:
	add r0, r4, #0
	bl ov40_02230944
	bl sub_0202FC48
	cmp r0, #0
	beq _0223CEB2
	add r0, r4, #0
	mov r1, #9
	bl ov40_0222BF80
	pop {r3, r4, r5, pc}
_0223CEB2:
	ldr r0, _0223CEFC ; =0x00002034
	mov r1, #9
	str r1, [r5, r0]
	add r0, r4, #0
	mov r1, #0x12
	bl ov40_0222BF80
	pop {r3, r4, r5, pc}
_0223CEC2:
	add r0, r4, #0
	bl ov40_02230944
	bl sub_0202FC48
	cmp r0, #0
	beq _0223CEDA
	add r0, r4, #0
	mov r1, #0xb
	bl ov40_0222BF80
	pop {r3, r4, r5, pc}
_0223CEDA:
	ldr r0, _0223CEFC ; =0x00002034
	mov r1, #0xb
	str r1, [r5, r0]
	add r0, r4, #0
	mov r1, #0x12
	bl ov40_0222BF80
	pop {r3, r4, r5, pc}
_0223CEEA:
	add r0, r4, #0
	bl ov40_02230944
	add r0, r4, #0
	mov r1, #0xa
	bl ov40_0222BF80
_0223CEF8:
	pop {r3, r4, r5, pc}
	nop
_0223CEFC: .word 0x00002034
	thumb_func_end ov40_0223CE64

	thumb_func_start ov40_0223CF00
ov40_0223CF00: ; 0x0223CF00
	push {r4, lr}
	add r4, r2, #0
	mov r2, #0x86
	lsl r2, r2, #4
	ldr r3, [r4, r2]
	cmp r1, #0
	bne _0223CF68
	cmp r0, #3
	bhi _0223CF68
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223CF1E: ; jump table
	.short _0223CF26 - _0223CF1E - 2 ; case 0
	.short _0223CF26 - _0223CF1E - 2 ; case 1
	.short _0223CF26 - _0223CF1E - 2 ; case 2
	.short _0223CF54 - _0223CF1E - 2 ; case 3
_0223CF26:
	add r1, r0, #1
	ldr r0, _0223CF6C ; =0x00002028
	add r2, #0x2c
	str r1, [r3, r0]
	ldr r0, [r3, r0]
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, r2]
	cmp r0, #0
	beq _0223CF44
	add r0, r4, #0
	mov r1, #0xe
	bl ov40_0222BF80
	b _0223CF4C
_0223CF44:
	add r0, r4, #0
	mov r1, #0x11
	bl ov40_0222BF80
_0223CF4C:
	add r0, r4, #0
	bl ov40_02230944
	pop {r4, pc}
_0223CF54:
	add r0, r4, #0
	bl ov40_02230944
	add r0, r4, #0
	bl ov40_0222DEAC
	add r0, r4, #0
	mov r1, #0xd
	bl ov40_0222BF80
_0223CF68:
	pop {r4, pc}
	nop
_0223CF6C: .word 0x00002028
	thumb_func_end ov40_0223CF00

	thumb_func_start ov40_0223CF70
ov40_0223CF70: ; 0x0223CF70
	push {r4, lr}
	add r4, r2, #0
	cmp r1, #0
	bne _0223CFA6
	cmp r0, #0
	beq _0223CF82
	cmp r0, #1
	beq _0223CF98
	pop {r4, pc}
_0223CF82:
	add r0, r4, #0
	bl ov40_02230944
	add r0, r4, #0
	bl ov40_0223CE38
	add r0, r4, #0
	mov r1, #0x11
	bl ov40_0222BF80
	pop {r4, pc}
_0223CF98:
	add r0, r4, #0
	bl ov40_02230944
	add r0, r4, #0
	mov r1, #0x10
	bl ov40_0222BF80
_0223CFA6:
	pop {r4, pc}
	thumb_func_end ov40_0223CF70

	thumb_func_start ov40_0223CFA8
ov40_0223CFA8: ; 0x0223CFA8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	mov r0, #0x6d
	bl sub_020314A4
	mov r1, #0x65
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, _0223D000 ; =0x000004D4
	ldr r1, [r4, r1]
	ldr r0, [r5, r0]
	lsl r0, r0, #2
	add r2, r5, r0
	ldr r0, _0223D004 ; =0x00002608
	ldr r0, [r2, r0]
	bl ov39_022271C0
	mov r0, #0x65
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r0, #0x8c
	str r1, [r4, r0]
	mov r0, #0x6d
	bl sub_02030920
	mov r1, #0x89
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, _0223D000 ; =0x000004D4
	ldr r1, [r4, r1]
	ldr r0, [r5, r0]
	lsl r0, r0, #2
	add r2, r5, r0
	ldr r0, _0223D004 ; =0x00002608
	ldr r0, [r2, r0]
	mov r2, #0x64
	add r0, #0x80
	bl MI_CpuCopy8
	pop {r3, r4, r5, pc}
	nop
_0223D000: .word 0x000004D4
_0223D004: .word 0x00002608
	thumb_func_end ov40_0223CFA8

	thumb_func_start ov40_0223D008
ov40_0223D008: ; 0x0223D008
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x80
	mov r1, #0x86
	lsl r1, r1, #4
	str r0, [sp, #8]
	ldr r0, [r0, r1]
	ldr r1, _0223D194 ; =0x000004A4
	str r0, [sp, #0x14]
	ldr r0, [sp, #8]
	ldr r5, _0223D198 ; =ov40_0224554C
	ldrsh r2, [r0, r1]
	add r4, sp, #0x50
	mov r3, #6
_0223D022:
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	sub r3, r3, #1
	bne _0223D022
	mov r1, #0
	add r0, sp, #0x38
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	str r1, [r0, #0x10]
	str r1, [r0, #0x14]
	add r0, sp, #0x20
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	str r1, [r0, #0x10]
	str r1, [r0, #0x14]
	str r1, [sp, #0x18]
	ldr r0, [sp, #8]
	lsl r1, r2, #2
	add r0, r0, r1
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	str r0, [sp, #0xc]
_0223D056:
	ldr r1, _0223D19C ; =0x00002608
	ldr r0, [sp, #0x10]
	ldr r0, [r0, r1]
	cmp r0, #0
	bne _0223D062
	b _0223D170
_0223D062:
	add r0, #0x80
	bl ov40_022303B8
	cmp r0, #0
	beq _0223D070
	mov r0, #1
	b _0223D072
_0223D070:
	mov r0, #0
_0223D072:
	mov r7, #0
	add r1, r7, #0
	add r2, sp, #0x38
	add r4, sp, #0x20
	add r3, r7, #0
_0223D07C:
	stmia r2!, {r3}
	add r1, r1, #1
	stmia r4!, {r3}
	cmp r1, #6
	blt _0223D07C
	mov r1, #0x18
	mul r1, r0
	add r0, sp, #0x50
	str r1, [sp, #0x1c]
	add r0, r0, r1
	add r1, sp, #0x38
	add r2, sp, #0x20
_0223D094:
	ldr r5, [sp, #0x10]
	ldr r4, _0223D19C ; =0x00002608
	ldr r6, [r0]
	ldr r5, [r5, r4]
	lsl r4, r6, #1
	add r4, r5, r4
	add r4, #0x80
	ldrh r4, [r4]
	cmp r4, #0
	beq _0223D0BA
	stmia r1!, {r4}
	ldr r5, [sp, #0x10]
	ldr r4, _0223D19C ; =0x00002608
	add r7, r7, #1
	ldr r4, [r5, r4]
	add r4, r4, r6
	add r4, #0x98
	ldrb r4, [r4]
	stmia r2!, {r4}
_0223D0BA:
	add r3, r3, #1
	add r0, r0, #4
	cmp r3, #3
	blt _0223D094
	ldr r1, _0223D19C ; =0x00002608
	ldr r0, [sp, #0x10]
	ldr r0, [r0, r1]
	add r0, #0x80
	bl ov40_022303B8
	cmp r0, #0
	beq _0223D0D4
	mov r7, #3
_0223D0D4:
	ldr r0, [sp, #0x1c]
	add r1, sp, #0x50
	add r0, r1, r0
	lsl r4, r7, #2
	add r1, sp, #0x38
	add r2, sp, #0x20
	mov r3, #3
	add r0, #0xc
	add r1, r1, r4
	add r2, r2, r4
_0223D0E8:
	ldr r5, [sp, #0x10]
	ldr r4, _0223D19C ; =0x00002608
	ldr r6, [r0]
	ldr r5, [r5, r4]
	lsl r4, r6, #1
	add r4, r5, r4
	add r4, #0x80
	ldrh r4, [r4]
	cmp r4, #0
	beq _0223D10E
	stmia r1!, {r4}
	ldr r5, [sp, #0x10]
	ldr r4, _0223D19C ; =0x00002608
	add r7, r7, #1
	ldr r4, [r5, r4]
	add r4, r4, r6
	add r4, #0x98
	ldrb r4, [r4]
	stmia r2!, {r4}
_0223D10E:
	add r3, r3, #1
	add r0, r0, #4
	cmp r3, #6
	blt _0223D0E8
	ldr r5, [sp, #0xc]
	mov r7, #0
	add r6, sp, #0x38
	add r4, sp, #0x20
_0223D11E:
	ldr r2, [sp, #0x14]
	ldr r1, _0223D1A0 ; =0x00002088
	ldr r3, [r6]
	ldr r2, [r2, r1]
	ldr r0, [r4]
	add r1, r1, #4
	str r2, [r5, r1]
	str r0, [sp]
	mov r0, #0
	mov r1, #0x82
	str r0, [sp, #4]
	ldr r2, [sp, #0x14]
	lsl r1, r1, #6
	ldr r1, [r2, r1]
	ldr r2, _0223D1A4 ; =0x0000208C
	ldr r0, [sp, #8]
	ldr r2, [r5, r2]
	bl ov40_0222FEA0
	ldr r1, _0223D1A8 ; =0x00002090
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0223D158
	mov r1, #6
	sub r1, r1, r7
	bl sub_0200DD68
_0223D158:
	ldr r1, [sp, #0x14]
	ldr r0, _0223D1A0 ; =0x00002088
	add r7, r7, #1
	ldr r0, [r1, r0]
	add r6, r6, #4
	add r2, r0, #1
	ldr r0, _0223D1A0 ; =0x00002088
	add r4, r4, #4
	add r5, #8
	str r2, [r1, r0]
	cmp r7, #6
	blt _0223D11E
_0223D170:
	ldr r0, [sp, #0x10]
	add r0, r0, #4
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	add r0, #0x30
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x18]
	add r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, #5
	bge _0223D188
	b _0223D056
_0223D188:
	ldr r0, [sp, #8]
	bl ov40_0223A3BC
	add sp, #0x80
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223D194: .word 0x000004A4
_0223D198: .word ov40_0224554C
_0223D19C: .word 0x00002608
_0223D1A0: .word 0x00002088
_0223D1A4: .word 0x0000208C
_0223D1A8: .word 0x00002090
	thumb_func_end ov40_0223D008

	thumb_func_start ov40_0223D1AC
ov40_0223D1AC: ; 0x0223D1AC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r1, #0
	mov r1, #0
	str r1, [sp, #4]
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	ldr r7, _0223D1EC ; =0x00002090
	str r0, [sp]
_0223D1C0:
	ldr r5, [sp]
	mov r4, #0
_0223D1C4:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _0223D1D0
	add r1, r6, #0
	bl sub_0200DCE8
_0223D1D0:
	add r4, r4, #1
	add r5, #8
	cmp r4, #6
	blt _0223D1C4
	ldr r0, [sp]
	add r0, #0x30
	str r0, [sp]
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #5
	blt _0223D1C0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223D1EC: .word 0x00002090
	thumb_func_end ov40_0223D1AC

	thumb_func_start ov40_0223D1F0
ov40_0223D1F0: ; 0x0223D1F0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	mov r7, #0
	str r0, [sp]
_0223D204:
	ldr r5, [sp]
	mov r4, #0
_0223D208:
	ldr r0, _0223D23C ; =0x00002090
	ldr r2, [r5, r0]
	cmp r2, #0
	beq _0223D21E
	ldr r1, _0223D240 ; =0x0000208C
	add r0, r6, #0
	ldr r1, [r5, r1]
	bl ov40_0222FF48
	ldr r0, _0223D23C ; =0x00002090
	str r7, [r5, r0]
_0223D21E:
	add r4, r4, #1
	add r5, #8
	cmp r4, #6
	blt _0223D208
	ldr r0, [sp]
	add r0, #0x30
	str r0, [sp]
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #5
	blt _0223D204
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223D23C: .word 0x00002090
_0223D240: .word 0x0000208C
	thumb_func_end ov40_0223D1F0

	thumb_func_start ov40_0223D244
ov40_0223D244: ; 0x0223D244
	push {r4, r5, r6, r7, lr}
	sub sp, #0xa4
	mov r1, #0
	str r1, [sp, #0x20]
	ldr r2, [sp, #0x20]
	add r1, sp, #0x8c
	str r2, [r1]
	str r2, [r1, #4]
	str r2, [r1, #8]
	str r2, [r1, #0xc]
	str r2, [r1, #0x10]
	str r2, [r1, #0x14]
	mov r2, #0x86
	lsl r2, r2, #4
	add r1, r0, #0
	ldr r1, [r1, r2]
	ldr r2, _0223D4E0 ; =0x00002084
	str r1, [sp, #0x1c]
	ldr r3, [r1, r2]
	ldr r2, _0223D4E4 ; =0x000004A4
	add r1, r0, #0
	ldrsh r1, [r1, r2]
	str r0, [sp, #8]
	cmp r3, r1
	bne _0223D278
	b _0223D4DA
_0223D278:
	mov r1, #1
	bl ov40_02230964
	ldr r1, _0223D4E0 ; =0x00002084
	ldr r0, [sp, #0x1c]
	ldr r2, [r0, r1]
	ldr r1, _0223D4E4 ; =0x000004A4
	ldr r0, [sp, #8]
	ldrsh r0, [r0, r1]
	cmp r2, r0
	ble _0223D292
	mov r0, #4
	str r0, [sp, #0x20]
_0223D292:
	ldr r0, [sp, #0x20]
	mov r1, #0x30
	mul r1, r0
	ldr r0, [sp, #0x1c]
	mov r6, #0
	add r4, r0, r1
	add r5, sp, #0x8c
	add r7, r6, #0
_0223D2A2:
	ldr r0, _0223D4E8 ; =0x00002090
	ldr r2, [r4, r0]
	cmp r2, #0
	beq _0223D2BE
	ldr r1, _0223D4EC ; =0x0000208C
	ldr r0, [sp, #8]
	ldr r1, [r4, r1]
	bl ov40_0222FF64
	ldr r0, _0223D4EC ; =0x0000208C
	ldr r0, [r4, r0]
	str r0, [r5]
	ldr r0, _0223D4E8 ; =0x00002090
	str r7, [r4, r0]
_0223D2BE:
	add r6, r6, #1
	add r4, #8
	add r5, r5, #4
	cmp r6, #6
	blt _0223D2A2
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _0223D308
	ldr r2, _0223D4F0 ; =0x00002060
	ldr r7, [sp, #0x1c]
	mov r0, #4
	add r3, r2, #0
	add r5, r2, #0
	str r0, [sp, #0xc]
	add r7, #0xc0
	add r3, #0x30
	sub r4, r2, #4
	add r5, #0x2c
_0223D2E2:
	mov r0, #0
	add r1, r7, #0
_0223D2E6:
	ldr r6, [r1, r2]
	add r0, r0, #1
	str r6, [r1, r3]
	ldr r6, [r1, r4]
	str r6, [r1, r5]
	add r1, #8
	cmp r0, #6
	blt _0223D2E6
	ldr r0, [sp, #0xc]
	sub r7, #0x30
	sub r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #1
	bge _0223D2E2
	mov r0, #0
	str r0, [sp, #0x10]
	b _0223D340
_0223D308:
	ldr r6, _0223D4E8 ; =0x00002090
	ldr r7, [sp, #0x1c]
	mov r0, #1
	add r2, r6, #0
	add r4, r6, #0
	mov ip, r0
	add r7, #0x30
	sub r2, #0x30
	sub r3, r6, #4
	sub r4, #0x34
_0223D31C:
	mov r1, #0
	add r0, r7, #0
_0223D320:
	ldr r5, [r0, r6]
	add r1, r1, #1
	str r5, [r0, r2]
	ldr r5, [r0, r3]
	str r5, [r0, r4]
	add r0, #8
	cmp r1, #6
	blt _0223D320
	mov r0, ip
	add r0, r0, #1
	add r7, #0x30
	mov ip, r0
	cmp r0, #5
	blt _0223D31C
	mov r0, #4
	str r0, [sp, #0x10]
_0223D340:
	ldr r1, _0223D4E4 ; =0x000004A4
	ldr r0, [sp, #8]
	ldr r5, _0223D4F4 ; =ov40_0224551C
	ldrsh r1, [r0, r1]
	ldr r0, [sp, #0x10]
	add r4, sp, #0x5c
	add r2, r1, r0
	mov r3, #6
_0223D350:
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	sub r3, r3, #1
	bne _0223D350
	add r0, sp, #0x44
	mov r4, #0
	str r4, [r0]
	str r4, [r0, #4]
	str r4, [r0, #8]
	str r4, [r0, #0xc]
	str r4, [r0, #0x10]
	str r4, [r0, #0x14]
	add r0, sp, #0x2c
	str r4, [r0]
	str r4, [r0, #4]
	str r4, [r0, #8]
	str r4, [r0, #0xc]
	str r4, [r0, #0x10]
	str r4, [r0, #0x14]
	lsl r0, r2, #2
	str r0, [sp, #0x14]
	ldr r1, _0223D4F8 ; =0x00002608
	ldr r0, [sp, #8]
	add r1, r0, r1
	ldr r0, [sp, #0x14]
	str r1, [sp, #0x24]
	ldr r0, [r1, r0]
	add r0, #0x80
	bl ov40_022303B8
	cmp r0, #0
	beq _0223D392
	mov r4, #1
_0223D392:
	mov r0, #0
	str r0, [sp, #0x18]
	add r1, sp, #0x44
	add r2, sp, #0x2c
	add r6, r0, #0
_0223D39C:
	stmia r1!, {r6}
	add r0, r0, #1
	stmia r2!, {r6}
	cmp r0, #6
	blt _0223D39C
	mov r0, #0x18
	mul r0, r4
	add r1, sp, #0x5c
	add r2, r1, r0
	str r0, [sp, #0x28]
	ldr r1, [sp, #8]
	ldr r0, [sp, #0x14]
	add r3, sp, #0x44
	add r5, sp, #0x2c
	add r4, r1, r0
_0223D3BA:
	ldr r0, _0223D4F8 ; =0x00002608
	ldr r7, [r2]
	ldr r1, [r4, r0]
	lsl r0, r7, #1
	add r0, r1, r0
	add r0, #0x80
	ldrh r0, [r0]
	cmp r0, #0
	beq _0223D3E0
	stmia r3!, {r0}
	ldr r0, _0223D4F8 ; =0x00002608
	ldr r0, [r4, r0]
	add r0, r0, r7
	add r0, #0x98
	ldrb r0, [r0]
	stmia r5!, {r0}
	ldr r0, [sp, #0x18]
	add r0, r0, #1
	str r0, [sp, #0x18]
_0223D3E0:
	add r6, r6, #1
	add r2, r2, #4
	cmp r6, #3
	blt _0223D3BA
	ldr r1, [sp, #0x24]
	ldr r0, [sp, #0x14]
	ldr r0, [r1, r0]
	add r0, #0x80
	bl ov40_022303B8
	cmp r0, #0
	beq _0223D3FC
	mov r0, #3
	str r0, [sp, #0x18]
_0223D3FC:
	ldr r0, [sp, #0x28]
	add r1, sp, #0x5c
	add r2, r1, r0
	ldr r0, [sp, #0x18]
	mov r6, #3
	lsl r1, r0, #2
	add r0, sp, #0x44
	add r3, r0, r1
	add r0, sp, #0x2c
	add r2, #0xc
	add r5, r0, r1
_0223D412:
	ldr r0, _0223D4F8 ; =0x00002608
	ldr r7, [r2]
	ldr r1, [r4, r0]
	lsl r0, r7, #1
	add r0, r1, r0
	add r0, #0x80
	ldrh r0, [r0]
	cmp r0, #0
	beq _0223D438
	stmia r3!, {r0}
	ldr r0, _0223D4F8 ; =0x00002608
	ldr r0, [r4, r0]
	add r0, r0, r7
	add r0, #0x98
	ldrb r0, [r0]
	stmia r5!, {r0}
	ldr r0, [sp, #0x18]
	add r0, r0, #1
	str r0, [sp, #0x18]
_0223D438:
	add r6, r6, #1
	add r2, r2, #4
	cmp r6, #6
	blt _0223D412
	ldr r0, [sp, #0x10]
	mov r1, #0x30
	mul r1, r0
	ldr r0, [sp, #0x1c]
	mov r5, #0
	add r7, sp, #0x44
	add r6, sp, #0x2c
	add r4, r0, r1
_0223D450:
	ldr r2, [sp, #0x1c]
	ldr r1, _0223D4FC ; =0x00002088
	ldr r3, [r7]
	ldr r2, [r2, r1]
	ldr r0, [r6]
	add r1, r1, #4
	str r2, [r4, r1]
	str r0, [sp]
	mov r0, #0
	mov r1, #0x82
	str r0, [sp, #4]
	ldr r2, [sp, #0x1c]
	lsl r1, r1, #6
	ldr r1, [r2, r1]
	ldr r2, _0223D4EC ; =0x0000208C
	ldr r0, [sp, #8]
	ldr r2, [r4, r2]
	bl ov40_0222FEA0
	ldr r1, _0223D4E8 ; =0x00002090
	str r0, [r4, r1]
	add r0, r1, #0
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0223D48A
	mov r1, #6
	sub r1, r1, r5
	bl sub_0200DD68
_0223D48A:
	ldr r1, [sp, #0x1c]
	ldr r0, _0223D4FC ; =0x00002088
	add r5, r5, #1
	ldr r0, [r1, r0]
	add r7, r7, #4
	add r2, r0, #1
	ldr r0, _0223D4FC ; =0x00002088
	add r6, r6, #4
	add r4, #8
	str r2, [r1, r0]
	cmp r5, #6
	blt _0223D450
	ldr r0, [sp, #8]
	bl ov40_0223A3BC
	ldr r1, _0223D4E4 ; =0x000004A4
	ldr r0, [sp, #8]
	ldr r6, _0223D500 ; =0x000186A0
	ldrsh r2, [r0, r1]
	ldr r1, _0223D4E0 ; =0x00002084
	ldr r0, [sp, #0x1c]
	mov r5, #0
	str r2, [r0, r1]
	add r4, sp, #0x8c
_0223D4BA:
	ldr r1, [r4]
	cmp r1, #0
	beq _0223D4CA
	ldr r0, [sp, #8]
	add r1, r1, r6
	ldr r0, [r0, #0x1c]
	bl sub_0200D958
_0223D4CA:
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #6
	blt _0223D4BA
	ldr r0, [sp, #8]
	mov r1, #0
	bl ov40_02230964
_0223D4DA:
	add sp, #0xa4
	pop {r4, r5, r6, r7, pc}
	nop
_0223D4E0: .word 0x00002084
_0223D4E4: .word 0x000004A4
_0223D4E8: .word 0x00002090
_0223D4EC: .word 0x0000208C
_0223D4F0: .word 0x00002060
_0223D4F4: .word ov40_0224551C
_0223D4F8: .word 0x00002608
_0223D4FC: .word 0x00002088
_0223D500: .word 0x000186A0
	thumb_func_end ov40_0223D244

	thumb_func_start ov40_0223D504
ov40_0223D504: ; 0x0223D504
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	mov r0, #0x45
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov40_0222D6D0
	mov r0, #0x13
	lsl r0, r0, #4
	add r0, r4, r0
	bl ov40_0222D6D0
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200D9DC
	mov r0, #0x4d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200D9DC
	add r0, r5, #0
	bl ov40_0222D7DC
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_0223D504

	thumb_func_start ov40_0223D540
ov40_0223D540: ; 0x0223D540
	add r0, #0x68
	bx lr
	thumb_func_end ov40_0223D540

	thumb_func_start ov40_0223D544
ov40_0223D544: ; 0x0223D544
	push {r4, lr}
	sub sp, #0x40
	add r4, r0, #0
	mov r0, #0x83
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl Sav2_SysInfo_get
	bl Sav2_SysInfo_GetField4C
	str r0, [sp]
	mov r0, #0x6d
	str r0, [sp, #4]
	mov r0, #0x83
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r1, sp, #0
	str r0, [sp, #8]
	ldr r0, _0223D5A4 ; =ov40_02236158
	str r4, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _0223D5A8 ; =ov40_0223615C
	str r4, [sp, #0x3c]
	str r0, [sp, #0x14]
	ldr r0, _0223D5AC ; =ov40_02238EB8
	add r4, #0x68
	str r0, [sp, #0x18]
	ldr r0, _0223D5B0 ; =ov40_02238EBC
	str r0, [sp, #0x1c]
	ldr r0, _0223D5B4 ; =ov40_0223A324
	str r0, [sp, #0x20]
	ldr r0, _0223D5B8 ; =ov40_0223A360
	str r0, [sp, #0x24]
	ldr r0, _0223D5BC ; =ov40_02242DF0
	str r0, [sp, #0x28]
	ldr r0, _0223D5C0 ; =ov40_0222FC4C
	str r0, [sp, #0x2c]
	ldr r0, _0223D5C4 ; =ov40_02242E14
	str r0, [sp, #0x30]
	ldr r0, _0223D5C8 ; =ov40_02242E48
	str r0, [sp, #0x34]
	mov r0, #0
	str r0, [sp, #0x38]
	add r0, r4, #0
	bl ov39_02227208
	add sp, #0x40
	pop {r4, pc}
	.balign 4, 0
_0223D5A4: .word ov40_02236158
_0223D5A8: .word ov40_0223615C
_0223D5AC: .word ov40_02238EB8
_0223D5B0: .word ov40_02238EBC
_0223D5B4: .word ov40_0223A324
_0223D5B8: .word ov40_0223A360
_0223D5BC: .word ov40_02242DF0
_0223D5C0: .word ov40_0222FC4C
_0223D5C4: .word ov40_02242E14
_0223D5C8: .word ov40_02242E48
	thumb_func_end ov40_0223D544

	thumb_func_start ov40_0223D5CC
ov40_0223D5CC: ; 0x0223D5CC
	push {r3, lr}
	mov r1, #0x42
	lsl r1, r1, #4
	ldr r1, [r0, r1]
	cmp r1, #0
	bne _0223D5DC
	mov r0, #0
	pop {r3, pc}
_0223D5DC:
	bl ov40_0223D540
	bl ov39_02227DB8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov40_0223D5CC

	thumb_func_start ov40_0223D5E8
ov40_0223D5E8: ; 0x0223D5E8
	push {r3, lr}
	mov r1, #0x42
	lsl r1, r1, #4
	ldr r1, [r0, r1]
	cmp r1, #0
	beq _0223D5FC
	bl ov40_0223D540
	bl ov39_02227778
_0223D5FC:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov40_0223D5E8

	thumb_func_start ov40_0223D600
ov40_0223D600: ; 0x0223D600
	push {r3, lr}
	mov r1, #0x42
	lsl r1, r1, #4
	ldr r1, [r0, r1]
	cmp r1, #0
	beq _0223D614
	bl ov40_0223D540
	bl ov39_022272EC
_0223D614:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov40_0223D600

	thumb_func_start ov40_0223D618
ov40_0223D618: ; 0x0223D618
	push {r4, r5, r6, r7, lr}
	sub sp, #0x84
	ldr r4, _0223D684 ; =ov40_02245948
	add r3, sp, #0xc
	mov r2, #0x3c
_0223D622:
	ldrh r1, [r4]
	add r4, r4, #2
	strh r1, [r3]
	add r3, r3, #2
	sub r2, r2, #1
	bne _0223D622
	mov r1, #0
	str r1, [sp, #8]
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	ldr r7, _0223D688 ; =0x0000051C
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	str r0, [sp]
_0223D640:
	ldr r0, [sp]
	ldr r4, [sp, #4]
	lsl r1, r0, #2
	add r0, sp, #0xc
	mov r6, #0
	add r5, r0, r1
_0223D64C:
	ldr r0, [r4, r7]
	cmp r0, #0
	beq _0223D65E
	mov r1, #0
	mov r2, #2
	ldrsh r1, [r5, r1]
	ldrsh r2, [r5, r2]
	bl sub_0200DDB8
_0223D65E:
	add r6, r6, #1
	add r4, #8
	add r5, r5, #4
	cmp r6, #6
	blt _0223D64C
	ldr r0, [sp, #4]
	add r0, #0x30
	str r0, [sp, #4]
	ldr r0, [sp]
	add r0, r0, #6
	str r0, [sp]
	ldr r0, [sp, #8]
	add r0, r0, #1
	str r0, [sp, #8]
	cmp r0, #5
	blt _0223D640
	add sp, #0x84
	pop {r4, r5, r6, r7, pc}
	nop
_0223D684: .word ov40_02245948
_0223D688: .word 0x0000051C
	thumb_func_end ov40_0223D618

	thumb_func_start ov40_0223D68C
ov40_0223D68C: ; 0x0223D68C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x80
	mov r1, #0x86
	lsl r1, r1, #4
	str r0, [sp, #8]
	ldr r0, [r0, r1]
	ldr r4, _0223D814 ; =ov40_02245808
	str r0, [sp, #0x14]
	add r3, sp, #0x50
	mov r2, #6
_0223D6A0:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0223D6A0
	mov r0, #0
	add r1, sp, #0x38
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	str r0, [r1, #0xc]
	str r0, [r1, #0x10]
	str r0, [r1, #0x14]
	add r1, sp, #0x20
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	str r0, [r1, #0xc]
	str r0, [r1, #0x10]
	str r0, [r1, #0x14]
	str r0, [sp, #0x18]
	ldr r1, _0223D818 ; =0x000004A4
	ldr r0, [sp, #8]
	ldrsh r0, [r0, r1]
	lsl r1, r0, #2
	ldr r0, [sp, #8]
	add r0, r0, r1
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	str r0, [sp, #0xc]
_0223D6DA:
	ldr r1, _0223D81C ; =0x00002608
	ldr r0, [sp, #0x10]
	ldr r0, [r0, r1]
	cmp r0, #0
	bne _0223D6E6
	b _0223D7F2
_0223D6E6:
	add r0, #0x80
	bl ov40_022303B8
	cmp r0, #0
	beq _0223D6F4
	mov r0, #1
	b _0223D6F6
_0223D6F4:
	mov r0, #0
_0223D6F6:
	mov r7, #0
	add r1, r7, #0
	add r2, sp, #0x38
	add r4, sp, #0x20
	add r3, r7, #0
_0223D700:
	stmia r2!, {r3}
	add r1, r1, #1
	stmia r4!, {r3}
	cmp r1, #6
	blt _0223D700
	mov r1, #0x18
	mul r1, r0
	add r0, sp, #0x50
	str r1, [sp, #0x1c]
	add r0, r0, r1
	add r1, sp, #0x38
	add r2, sp, #0x20
_0223D718:
	ldr r5, [sp, #0x10]
	ldr r4, _0223D81C ; =0x00002608
	ldr r6, [r0]
	ldr r5, [r5, r4]
	lsl r4, r6, #1
	add r4, r5, r4
	add r4, #0x80
	ldrh r4, [r4]
	cmp r4, #0
	beq _0223D73E
	stmia r1!, {r4}
	ldr r5, [sp, #0x10]
	ldr r4, _0223D81C ; =0x00002608
	add r7, r7, #1
	ldr r4, [r5, r4]
	add r4, r4, r6
	add r4, #0x98
	ldrb r4, [r4]
	stmia r2!, {r4}
_0223D73E:
	add r3, r3, #1
	add r0, r0, #4
	cmp r3, #3
	blt _0223D718
	ldr r1, _0223D81C ; =0x00002608
	ldr r0, [sp, #0x10]
	ldr r0, [r0, r1]
	add r0, #0x80
	bl ov40_022303B8
	cmp r0, #0
	beq _0223D758
	mov r7, #3
_0223D758:
	ldr r0, [sp, #0x1c]
	add r1, sp, #0x50
	add r0, r1, r0
	lsl r4, r7, #2
	add r1, sp, #0x38
	add r2, sp, #0x20
	mov r3, #3
	add r0, #0xc
	add r1, r1, r4
	add r2, r2, r4
_0223D76C:
	ldr r5, [sp, #0x10]
	ldr r4, _0223D81C ; =0x00002608
	ldr r6, [r0]
	ldr r5, [r5, r4]
	lsl r4, r6, #1
	add r4, r5, r4
	add r4, #0x80
	ldrh r4, [r4]
	cmp r4, #0
	beq _0223D792
	stmia r1!, {r4}
	ldr r5, [sp, #0x10]
	ldr r4, _0223D81C ; =0x00002608
	add r7, r7, #1
	ldr r4, [r5, r4]
	add r4, r4, r6
	add r4, #0x98
	ldrb r4, [r4]
	stmia r2!, {r4}
_0223D792:
	add r3, r3, #1
	add r0, r0, #4
	cmp r3, #6
	blt _0223D76C
	ldr r5, [sp, #0xc]
	mov r7, #0
	add r6, sp, #0x38
	add r4, sp, #0x20
_0223D7A2:
	ldr r2, [sp, #0x14]
	ldr r1, _0223D820 ; =0x00000514
	ldr r3, [r6]
	ldr r2, [r2, r1]
	ldr r0, [r4]
	add r1, r1, #4
	str r2, [r5, r1]
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r2, [sp, #0x14]
	ldr r1, _0223D824 ; =0x0000050C
	ldr r0, [sp, #8]
	ldr r1, [r2, r1]
	ldr r2, _0223D828 ; =0x00000518
	ldr r2, [r5, r2]
	bl ov40_0222FEA0
	ldr r1, _0223D82C ; =0x0000051C
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0223D7DA
	mov r1, #6
	sub r1, r1, r7
	bl sub_0200DD68
_0223D7DA:
	ldr r1, [sp, #0x14]
	ldr r0, _0223D820 ; =0x00000514
	add r7, r7, #1
	ldr r0, [r1, r0]
	add r6, r6, #4
	add r2, r0, #1
	ldr r0, _0223D820 ; =0x00000514
	add r4, r4, #4
	add r5, #8
	str r2, [r1, r0]
	cmp r7, #6
	blt _0223D7A2
_0223D7F2:
	ldr r0, [sp, #0x10]
	add r0, r0, #4
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	add r0, #0x30
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x18]
	add r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, #5
	bge _0223D80A
	b _0223D6DA
_0223D80A:
	ldr r0, [sp, #8]
	bl ov40_0223D618
	add sp, #0x80
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223D814: .word ov40_02245808
_0223D818: .word 0x000004A4
_0223D81C: .word 0x00002608
_0223D820: .word 0x00000514
_0223D824: .word 0x0000050C
_0223D828: .word 0x00000518
_0223D82C: .word 0x0000051C
	thumb_func_end ov40_0223D68C

	thumb_func_start ov40_0223D830
ov40_0223D830: ; 0x0223D830
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r1, #0
	mov r1, #0
	str r1, [sp, #4]
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	ldr r7, _0223D870 ; =0x0000051C
	str r0, [sp]
_0223D844:
	ldr r5, [sp]
	mov r4, #0
_0223D848:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _0223D854
	add r1, r6, #0
	bl sub_0200DCE8
_0223D854:
	add r4, r4, #1
	add r5, #8
	cmp r4, #6
	blt _0223D848
	ldr r0, [sp]
	add r0, #0x30
	str r0, [sp]
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #5
	blt _0223D844
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223D870: .word 0x0000051C
	thumb_func_end ov40_0223D830

	thumb_func_start ov40_0223D874
ov40_0223D874: ; 0x0223D874
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	mov r1, #0x86
	add r6, r0, #0
	lsl r1, r1, #4
	ldr r1, [r6, r1]
	str r1, [sp]
	mov r1, #1
	bl ov40_02230964
	mov r0, #0
	str r0, [sp, #4]
	add r7, r0, #0
_0223D88E:
	ldr r5, [sp]
	mov r4, #0
_0223D892:
	ldr r0, _0223D8CC ; =0x0000051C
	ldr r2, [r5, r0]
	cmp r2, #0
	beq _0223D8A8
	ldr r1, _0223D8D0 ; =0x00000518
	add r0, r6, #0
	ldr r1, [r5, r1]
	bl ov40_0222FF48
	ldr r0, _0223D8CC ; =0x0000051C
	str r7, [r5, r0]
_0223D8A8:
	add r4, r4, #1
	add r5, #8
	cmp r4, #6
	blt _0223D892
	ldr r0, [sp]
	add r0, #0x30
	str r0, [sp]
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #5
	blt _0223D88E
	add r0, r6, #0
	mov r1, #0
	bl ov40_02230964
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223D8CC: .word 0x0000051C
_0223D8D0: .word 0x00000518
	thumb_func_end ov40_0223D874

	thumb_func_start ov40_0223D8D4
ov40_0223D8D4: ; 0x0223D8D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xa4
	mov r1, #0
	str r1, [sp, #0x20]
	ldr r2, [sp, #0x20]
	add r1, sp, #0x8c
	str r2, [r1]
	str r2, [r1, #4]
	str r2, [r1, #8]
	str r2, [r1, #0xc]
	str r2, [r1, #0x10]
	str r2, [r1, #0x14]
	mov r2, #0x86
	lsl r2, r2, #4
	add r1, r0, #0
	ldr r1, [r1, r2]
	mov r2, #0x51
	lsl r2, r2, #4
	ldr r3, [r1, r2]
	str r1, [sp, #0x1c]
	sub r2, #0x6c
	add r1, r0, #0
	ldrsh r1, [r1, r2]
	str r0, [sp, #8]
	cmp r3, r1
	bne _0223D90A
	b _0223DB6C
_0223D90A:
	mov r1, #1
	bl ov40_02230964
	mov r1, #0x51
	ldr r0, [sp, #0x1c]
	lsl r1, r1, #4
	ldr r2, [r0, r1]
	ldr r0, [sp, #8]
	sub r1, #0x6c
	ldrsh r0, [r0, r1]
	cmp r2, r0
	ble _0223D926
	mov r0, #4
	str r0, [sp, #0x20]
_0223D926:
	ldr r0, [sp, #0x20]
	mov r1, #0x30
	mul r1, r0
	ldr r0, [sp, #0x1c]
	mov r6, #0
	add r4, r0, r1
	add r5, sp, #0x8c
	add r7, r6, #0
_0223D936:
	ldr r0, _0223DB70 ; =0x0000051C
	ldr r2, [r4, r0]
	cmp r2, #0
	beq _0223D952
	ldr r1, _0223DB74 ; =0x00000518
	ldr r0, [sp, #8]
	ldr r1, [r4, r1]
	bl ov40_0222FF64
	ldr r0, _0223DB74 ; =0x00000518
	ldr r0, [r4, r0]
	str r0, [r5]
	ldr r0, _0223DB70 ; =0x0000051C
	str r7, [r4, r0]
_0223D952:
	add r6, r6, #1
	add r4, #8
	add r5, r5, #4
	cmp r6, #6
	blt _0223D936
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _0223D99C
	ldr r2, _0223DB78 ; =0x000004EC
	ldr r7, [sp, #0x1c]
	mov r0, #4
	add r3, r2, #0
	add r5, r2, #0
	str r0, [sp, #0xc]
	add r7, #0xc0
	add r3, #0x30
	sub r4, r2, #4
	add r5, #0x2c
_0223D976:
	mov r0, #0
	add r1, r7, #0
_0223D97A:
	ldr r6, [r1, r2]
	add r0, r0, #1
	str r6, [r1, r3]
	ldr r6, [r1, r4]
	str r6, [r1, r5]
	add r1, #8
	cmp r0, #6
	blt _0223D97A
	ldr r0, [sp, #0xc]
	sub r7, #0x30
	sub r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #1
	bge _0223D976
	mov r0, #0
	str r0, [sp, #0x10]
	b _0223D9D4
_0223D99C:
	ldr r6, _0223DB70 ; =0x0000051C
	ldr r7, [sp, #0x1c]
	mov r0, #1
	add r2, r6, #0
	add r4, r6, #0
	mov ip, r0
	add r7, #0x30
	sub r2, #0x30
	sub r3, r6, #4
	sub r4, #0x34
_0223D9B0:
	mov r1, #0
	add r0, r7, #0
_0223D9B4:
	ldr r5, [r0, r6]
	add r1, r1, #1
	str r5, [r0, r2]
	ldr r5, [r0, r3]
	str r5, [r0, r4]
	add r0, #8
	cmp r1, #6
	blt _0223D9B4
	mov r0, ip
	add r0, r0, #1
	add r7, #0x30
	mov ip, r0
	cmp r0, #5
	blt _0223D9B0
	mov r0, #4
	str r0, [sp, #0x10]
_0223D9D4:
	ldr r1, _0223DB7C ; =0x000004A4
	ldr r0, [sp, #8]
	ldr r5, _0223DB80 ; =ov40_02245838
	ldrsh r1, [r0, r1]
	ldr r0, [sp, #0x10]
	add r4, sp, #0x5c
	add r2, r1, r0
	mov r3, #6
_0223D9E4:
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	sub r3, r3, #1
	bne _0223D9E4
	add r0, sp, #0x44
	mov r4, #0
	str r4, [r0]
	str r4, [r0, #4]
	str r4, [r0, #8]
	str r4, [r0, #0xc]
	str r4, [r0, #0x10]
	str r4, [r0, #0x14]
	add r0, sp, #0x2c
	str r4, [r0]
	str r4, [r0, #4]
	str r4, [r0, #8]
	str r4, [r0, #0xc]
	str r4, [r0, #0x10]
	str r4, [r0, #0x14]
	lsl r0, r2, #2
	str r0, [sp, #0x14]
	ldr r1, _0223DB84 ; =0x00002608
	ldr r0, [sp, #8]
	add r1, r0, r1
	ldr r0, [sp, #0x14]
	str r1, [sp, #0x24]
	ldr r0, [r1, r0]
	add r0, #0x80
	bl ov40_022303B8
	cmp r0, #0
	beq _0223DA26
	mov r4, #1
_0223DA26:
	mov r0, #0
	str r0, [sp, #0x18]
	add r1, sp, #0x44
	add r2, sp, #0x2c
	add r6, r0, #0
_0223DA30:
	stmia r1!, {r6}
	add r0, r0, #1
	stmia r2!, {r6}
	cmp r0, #6
	blt _0223DA30
	mov r0, #0x18
	mul r0, r4
	add r1, sp, #0x5c
	add r2, r1, r0
	str r0, [sp, #0x28]
	ldr r1, [sp, #8]
	ldr r0, [sp, #0x14]
	add r3, sp, #0x44
	add r5, sp, #0x2c
	add r4, r1, r0
_0223DA4E:
	ldr r0, _0223DB84 ; =0x00002608
	ldr r7, [r2]
	ldr r1, [r4, r0]
	lsl r0, r7, #1
	add r0, r1, r0
	add r0, #0x80
	ldrh r0, [r0]
	cmp r0, #0
	beq _0223DA74
	stmia r3!, {r0}
	ldr r0, _0223DB84 ; =0x00002608
	ldr r0, [r4, r0]
	add r0, r0, r7
	add r0, #0x98
	ldrb r0, [r0]
	stmia r5!, {r0}
	ldr r0, [sp, #0x18]
	add r0, r0, #1
	str r0, [sp, #0x18]
_0223DA74:
	add r6, r6, #1
	add r2, r2, #4
	cmp r6, #3
	blt _0223DA4E
	ldr r1, [sp, #0x24]
	ldr r0, [sp, #0x14]
	ldr r0, [r1, r0]
	add r0, #0x80
	bl ov40_022303B8
	cmp r0, #0
	beq _0223DA90
	mov r0, #3
	str r0, [sp, #0x18]
_0223DA90:
	ldr r0, [sp, #0x28]
	add r1, sp, #0x5c
	add r2, r1, r0
	ldr r0, [sp, #0x18]
	mov r6, #3
	lsl r1, r0, #2
	add r0, sp, #0x44
	add r3, r0, r1
	add r0, sp, #0x2c
	add r2, #0xc
	add r5, r0, r1
_0223DAA6:
	ldr r0, _0223DB84 ; =0x00002608
	ldr r7, [r2]
	ldr r1, [r4, r0]
	lsl r0, r7, #1
	add r0, r1, r0
	add r0, #0x80
	ldrh r0, [r0]
	cmp r0, #0
	beq _0223DACC
	stmia r3!, {r0}
	ldr r0, _0223DB84 ; =0x00002608
	ldr r0, [r4, r0]
	add r0, r0, r7
	add r0, #0x98
	ldrb r0, [r0]
	stmia r5!, {r0}
	ldr r0, [sp, #0x18]
	add r0, r0, #1
	str r0, [sp, #0x18]
_0223DACC:
	add r6, r6, #1
	add r2, r2, #4
	cmp r6, #6
	blt _0223DAA6
	ldr r0, [sp, #0x10]
	mov r1, #0x30
	mul r1, r0
	ldr r0, [sp, #0x1c]
	mov r5, #0
	add r7, sp, #0x44
	add r6, sp, #0x2c
	add r4, r0, r1
_0223DAE4:
	ldr r2, [sp, #0x1c]
	ldr r1, _0223DB88 ; =0x00000514
	ldr r3, [r7]
	ldr r2, [r2, r1]
	ldr r0, [r6]
	add r1, r1, #4
	str r2, [r4, r1]
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r2, [sp, #0x1c]
	ldr r1, _0223DB8C ; =0x0000050C
	ldr r0, [sp, #8]
	ldr r1, [r2, r1]
	ldr r2, _0223DB74 ; =0x00000518
	ldr r2, [r4, r2]
	bl ov40_0222FEA0
	ldr r1, _0223DB70 ; =0x0000051C
	str r0, [r4, r1]
	add r0, r1, #0
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0223DB1C
	mov r1, #6
	sub r1, r1, r5
	bl sub_0200DD68
_0223DB1C:
	ldr r1, [sp, #0x1c]
	ldr r0, _0223DB88 ; =0x00000514
	add r5, r5, #1
	ldr r0, [r1, r0]
	add r7, r7, #4
	add r2, r0, #1
	ldr r0, _0223DB88 ; =0x00000514
	add r6, r6, #4
	add r4, #8
	str r2, [r1, r0]
	cmp r5, #6
	blt _0223DAE4
	ldr r0, [sp, #8]
	bl ov40_0223D618
	ldr r1, _0223DB7C ; =0x000004A4
	ldr r0, [sp, #8]
	ldr r6, _0223DB90 ; =0x000186A0
	ldrsh r2, [r0, r1]
	ldr r0, [sp, #0x1c]
	add r1, #0x6c
	str r2, [r0, r1]
	mov r5, #0
	add r4, sp, #0x8c
_0223DB4C:
	ldr r1, [r4]
	cmp r1, #0
	beq _0223DB5C
	ldr r0, [sp, #8]
	add r1, r1, r6
	ldr r0, [r0, #0x1c]
	bl sub_0200D958
_0223DB5C:
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #6
	blt _0223DB4C
	ldr r0, [sp, #8]
	mov r1, #0
	bl ov40_02230964
_0223DB6C:
	add sp, #0xa4
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0223DB70: .word 0x0000051C
_0223DB74: .word 0x00000518
_0223DB78: .word 0x000004EC
_0223DB7C: .word 0x000004A4
_0223DB80: .word ov40_02245838
_0223DB84: .word 0x00002608
_0223DB88: .word 0x00000514
_0223DB8C: .word 0x0000050C
_0223DB90: .word 0x000186A0
	thumb_func_end ov40_0223D8D4

	thumb_func_start ov40_0223DB94
ov40_0223DB94: ; 0x0223DB94
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	mov r2, #0x13
	lsl r2, r2, #6
	ldrh r3, [r0, r2]
	ldr r1, _0223DBD0 ; =0x0000FFFF
	cmp r3, r1
	beq _0223DBAA
	mov r0, #1
	bx lr
_0223DBAA:
	add r1, r2, #2
	ldrb r1, [r0, r1]
	cmp r1, #0xff
	beq _0223DBB6
	mov r0, #1
	bx lr
_0223DBB6:
	add r1, r2, #3
	ldrb r1, [r0, r1]
	cmp r1, #0xff
	bne _0223DBC6
	add r1, r2, #4
	ldrb r0, [r0, r1]
	cmp r0, #0xff
	beq _0223DBCA
_0223DBC6:
	mov r0, #1
	bx lr
_0223DBCA:
	mov r0, #0
	bx lr
	nop
_0223DBD0: .word 0x0000FFFF
	thumb_func_end ov40_0223DB94

	thumb_func_start ov40_0223DBD4
ov40_0223DBD4: ; 0x0223DBD4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x9c
	add r3, r1, #0
	mov r1, #0x86
	lsl r1, r1, #4
	str r0, [sp, #0x14]
	ldr r0, [r0, r1]
	ldr r6, _0223DCDC ; =ov40_022458E8
	str r0, [sp, #0x20]
	add r4, sp, #0x3c
	mov r2, #0xc
_0223DBEA:
	ldmia r6!, {r0, r1}
	stmia r4!, {r0, r1}
	sub r2, r2, #1
	bne _0223DBEA
	ldr r6, _0223DCE0 ; =ov40_022456F0
	add r4, sp, #0x24
	add r2, r4, #0
	ldmia r6!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r4!, {r0, r1}
	cmp r3, #0
	beq _0223DC0C
	cmp r3, #1
	b _0223DC18
_0223DC0C:
	ldr r1, _0223DCE4 ; =0x00000794
	ldr r0, [sp, #0x20]
	mov r3, #6
	str r3, [r0, r1]
	add r5, sp, #0x3c
	str r2, [sp, #0x18]
_0223DC18:
	mov r0, #0
	str r0, [sp, #0x1c]
	ldr r1, _0223DCE4 ; =0x00000794
	ldr r0, [sp, #0x20]
	mov r7, #1
	ldr r0, [r0, r1]
	lsl r7, r7, #8
	cmp r0, #0
	ble _0223DCD8
	ldr r1, _0223DCE8 ; =0x00000614
	ldr r0, [sp, #0x20]
	add r4, r0, r1
_0223DC30:
	add r0, r4, #0
	bl InitWindow
	ldr r0, [r5, #4]
	add r1, r4, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r5, #8]
	mov r2, #2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	lsl r0, r7, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r3, [r5]
	ldr r0, [r0, #0x24]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	ldr r0, [r0, #0x48]
	ldr r1, [r1]
	bl NewString_ReadMsgData
	add r6, r0, #0
	ldr r1, [r5, #8]
	ldr r0, [r5, #0xc]
	mul r0, r1
	add r7, r7, r0
	mov r0, #0
	beq _0223DC94
	add r0, r4, #0
	add r1, r6, #0
	bl ov40_022306C0
_0223DC94:
	mov r0, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0223DCEC ; =0x000F0D00
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r2, r6, #0
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add r0, r6, #0
	bl String_dtor
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x20]
	add r0, r0, #4
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	add r4, #0x10
	add r0, r0, #1
	str r0, [sp, #0x1c]
	ldr r0, _0223DCE4 ; =0x00000794
	add r5, #0x10
	ldr r1, [r1, r0]
	ldr r0, [sp, #0x1c]
	cmp r0, r1
	blt _0223DC30
_0223DCD8:
	add sp, #0x9c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0223DCDC: .word ov40_022458E8
_0223DCE0: .word ov40_022456F0
_0223DCE4: .word 0x00000794
_0223DCE8: .word 0x00000614
_0223DCEC: .word 0x000F0D00
	thumb_func_end ov40_0223DBD4

	thumb_func_start ov40_0223DCF0
ov40_0223DCF0: ; 0x0223DCF0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r6, [r5, r0]
	ldr r7, _0223DD60 ; =0x00000644
	add r4, r1, #0
	add r0, r6, r7
	mov r1, #0
	bl FillWindowPixelBuffer
	cmp r4, #0xff
	bne _0223DD18
	ldr r0, [r5, #0x48]
	mov r1, #0x7d
	bl NewString_ReadMsgData
	add r4, r0, #0
	b _0223DD38
_0223DD18:
	add r0, r4, #0
	sub r0, #0xfa
	cmp r0, #3
	ldr r0, [r5, #0x48]
	bhi _0223DD2E
	sub r4, #0x55
	add r1, r4, #0
	bl NewString_ReadMsgData
	add r4, r0, #0
	b _0223DD38
_0223DD2E:
	add r4, #0x84
	add r1, r4, #0
	bl NewString_ReadMsgData
	add r4, r0, #0
_0223DD38:
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0223DD64 ; =0x000F0D00
	add r2, r4, #0
	str r0, [sp, #8]
	add r0, r6, r7
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r6, r7
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	bl String_dtor
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223DD60: .word 0x00000644
_0223DD64: .word 0x000F0D00
	thumb_func_end ov40_0223DCF0

	thumb_func_start ov40_0223DD68
ov40_0223DD68: ; 0x0223DD68
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x1fc
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	ldr r7, _0223DDDC ; =0x00000654
	add r6, r1, #0
	add r0, r4, r7
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0223DDE0 ; =0x0000FFFF
	cmp r6, r0
	bne _0223DD94
	ldr r0, [r5, #0x48]
	mov r1, #0x7d
	bl NewString_ReadMsgData
	add r5, r0, #0
	b _0223DDB0
_0223DD94:
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	add r5, r0, #0
	add r0, r6, #0
	mov r1, #0x6d
	add r2, sp, #0x10
	bl GetSpeciesNameIntoArray
	add r0, r5, #0
	add r1, sp, #0x10
	bl CopyU16ArrayToString
_0223DDB0:
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0223DDE4 ; =0x000F0D00
	add r2, r5, #0
	str r0, [sp, #8]
	add r0, r4, r7
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r4, r7
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	bl String_dtor
	add sp, #0x1fc
	add sp, #0x14
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223DDDC: .word 0x00000654
_0223DDE0: .word 0x0000FFFF
_0223DDE4: .word 0x000F0D00
	thumb_func_end ov40_0223DD68

	thumb_func_start ov40_0223DDE8
ov40_0223DDE8: ; 0x0223DDE8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r7, [r5, r0]
	ldr r0, _0223DEB0 ; =0x00000664
	str r1, [sp, #0x10]
	add r0, r7, r0
	mov r1, #0
	add r4, r2, #0
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x10]
	cmp r0, #0xff
	bne _0223DE18
	cmp r4, #0xff
	bne _0223DE18
	ldr r0, [r5, #0x48]
	mov r1, #0x7d
	bl NewString_ReadMsgData
	str r0, [sp, #0x14]
	b _0223DE84
_0223DE18:
	mov r0, #0x6d
	bl ov40_0222DAB0
	add r6, r0, #0
	cmp r4, #0
	beq _0223DE50
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	str r0, [sp, #0x14]
	ldr r0, [r5, #0x48]
	mov r1, #0x17
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r2, [sp, #0x10]
	add r0, r6, #0
	mov r1, #0
	add r3, r4, #0
	bl BufferCityName
	ldr r1, [sp, #0x14]
	add r0, r6, #0
	add r2, r5, #0
	bl StringExpandPlaceholders
	b _0223DE78
_0223DE50:
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	str r0, [sp, #0x14]
	ldr r0, [r5, #0x48]
	mov r1, #0x16
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r2, [sp, #0x10]
	add r0, r6, #0
	mov r1, #0
	bl BufferCountryName
	ldr r1, [sp, #0x14]
	add r0, r6, #0
	add r2, r5, #0
	bl StringExpandPlaceholders
_0223DE78:
	add r0, r5, #0
	bl String_dtor
	add r0, r6, #0
	bl ScrStrBufs_delete
_0223DE84:
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0223DEB4 ; =0x000F0D00
	ldr r2, [sp, #0x14]
	str r0, [sp, #8]
	ldr r0, _0223DEB0 ; =0x00000664
	add r3, r1, #0
	add r0, r7, r0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r0, _0223DEB0 ; =0x00000664
	add r0, r7, r0
	bl ScheduleWindowCopyToVram
	ldr r0, [sp, #0x14]
	bl String_dtor
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223DEB0: .word 0x00000664
_0223DEB4: .word 0x000F0D00
	thumb_func_end ov40_0223DDE8

	thumb_func_start ov40_0223DEB8
ov40_0223DEB8: ; 0x0223DEB8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r5, [r0, r1]
	ldr r1, _0223DF0C ; =0x000004C3
	ldr r6, _0223DF10 ; =0x000006F4
	ldrb r1, [r5, r1]
	cmp r1, #0xff
	bne _0223DED0
	mov r1, #0x32
	b _0223DED2
_0223DED0:
	ldr r1, _0223DF14 ; =0x0000014D
_0223DED2:
	ldr r0, [r0, #0x48]
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r5, r6
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0223DF18 ; =0x000F0D00
	add r2, r4, #0
	str r0, [sp, #8]
	add r0, r5, r6
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, r6
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	bl String_dtor
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0223DF0C: .word 0x000004C3
_0223DF10: .word 0x000006F4
_0223DF14: .word 0x0000014D
_0223DF18: .word 0x000F0D00
	thumb_func_end ov40_0223DEB8

	thumb_func_start ov40_0223DF1C
ov40_0223DF1C: ; 0x0223DF1C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	add r2, r1, #0
	mov r1, #0x86
	lsl r1, r1, #4
	str r0, [sp, #0x14]
	ldr r0, [r0, r1]
	ldr r5, _0223E010 ; =ov40_02245868
	str r0, [sp, #0x1c]
	add r4, sp, #0x2c
	mov r3, #6
_0223DF32:
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	sub r3, r3, #1
	bne _0223DF32
	ldr r4, _0223E014 ; =ov40_0224565C
	add r3, sp, #0x20
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	cmp r2, #0
	str r0, [r3]
	beq _0223DF4E
	bl GF_AssertFail
_0223DF4E:
	ldr r1, _0223E018 ; =0x00000798
	ldr r0, [sp, #0x1c]
	mov r6, #3
	str r6, [r0, r1]
	mov r0, #0
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	sub r1, #0xc4
	add r7, sp, #0x20
	add r6, #0xfd
	add r4, r0, r1
	add r5, sp, #0x2c
_0223DF66:
	add r0, r4, #0
	bl InitWindow
	ldr r0, [r5, #4]
	add r1, r4, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r5, #8]
	mov r2, #6
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	lsl r0, r6, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r3, [r5]
	ldr r0, [r0, #0x24]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r1, [r5, #8]
	ldr r0, [r5, #0xc]
	add r4, #0x10
	mul r0, r1
	add r6, r6, r0
	ldr r0, [sp, #0x18]
	add r5, #0x10
	add r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, #3
	blt _0223DF66
	ldr r1, _0223E01C ; =0x000006D4
	ldr r0, [sp, #0x1c]
	mov r6, #0
	add r5, r0, r1
_0223DFC6:
	ldr r0, [sp, #0x14]
	ldr r1, [r7]
	ldr r0, [r0, #0x48]
	bl NewString_ReadMsgData
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0223E020 ; =0x000F0D00
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r2, r4, #0
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	bl String_dtor
	add r6, r6, #1
	add r5, #0x10
	add r7, r7, #4
	cmp r6, #2
	blt _0223DFC6
	ldr r0, [sp, #0x14]
	bl ov40_0223DEB8
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	nop
_0223E010: .word ov40_02245868
_0223E014: .word ov40_0224565C
_0223E018: .word 0x00000798
_0223E01C: .word 0x000006D4
_0223E020: .word 0x000F0D00
	thumb_func_end ov40_0223DF1C

	thumb_func_start ov40_0223E024
ov40_0223E024: ; 0x0223E024
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r6, [r0, r1]
	sub r1, #0xcc
	ldr r0, [r6, r1]
	mov r4, #0
	cmp r0, #0
	ble _0223E052
	ldr r0, _0223E05C ; =0x00000614
	ldr r7, _0223E060 ; =0x00000794
	add r5, r6, r0
_0223E03C:
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
	ldr r0, [r6, r7]
	add r4, r4, #1
	add r5, #0x10
	cmp r4, r0
	blt _0223E03C
_0223E052:
	ldr r0, _0223E060 ; =0x00000794
	mov r1, #0
	str r1, [r6, r0]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223E05C: .word 0x00000614
_0223E060: .word 0x00000794
	thumb_func_end ov40_0223E024

	thumb_func_start ov40_0223E064
ov40_0223E064: ; 0x0223E064
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r6, [r0, r1]
	sub r1, #0xc8
	ldr r0, [r6, r1]
	mov r4, #0
	cmp r0, #0
	ble _0223E094
	ldr r0, _0223E09C ; =0x000006D4
	add r7, r0, #0
	add r5, r6, r0
	add r7, #0xc4
_0223E07E:
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
	ldr r0, [r6, r7]
	add r4, r4, #1
	add r5, #0x10
	cmp r4, r0
	blt _0223E07E
_0223E094:
	ldr r0, _0223E0A0 ; =0x00000798
	mov r1, #0
	str r1, [r6, r0]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223E09C: .word 0x000006D4
_0223E0A0: .word 0x00000798
	thumb_func_end ov40_0223E064

	thumb_func_start ov40_0223E0A4
ov40_0223E0A4: ; 0x0223E0A4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	ldr r6, _0223E184 ; =0x00000614
	add r0, r4, r6
	bl InitWindow
	mov r3, #3
	str r3, [sp]
	mov r0, #0x14
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	mov r0, #0x20
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x24]
	add r1, r4, r6
	mov r2, #2
	bl AddWindowParameterized
	add r0, r4, r6
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x48]
	mov r1, #0x7e
	bl NewString_ReadMsgData
	mov r1, #0
	add r7, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0223E188 ; =0x000F0D00
	add r2, r7, #0
	str r0, [sp, #8]
	add r0, r4, r6
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r4, r6
	bl ScheduleWindowCopyToVram
	add r0, r7, #0
	bl String_dtor
	add r6, #0xc0
	add r0, r4, r6
	bl InitWindow
	mov r2, #6
	str r2, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	add r0, #0xf2
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x24]
	add r1, r4, r6
	mov r3, #0xb
	bl AddWindowParameterized
	add r0, r4, r6
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x48]
	mov r1, #0x5f
	bl NewString_ReadMsgData
	add r5, r0, #0
	mov r0, #0
	add r1, r5, #0
	add r2, r0, #0
	bl FontID_String_GetWidthMultiline
	mov r1, #0x50
	sub r0, r1, r0
	mov r1, #0
	lsr r3, r0, #1
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0223E188 ; =0x000F0D00
	add r2, r5, #0
	str r0, [sp, #8]
	add r0, r4, r6
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r4, r6
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	bl String_dtor
	ldr r0, _0223E18C ; =0x00000798
	mov r1, #1
	str r1, [r4, r0]
	sub r0, r0, #4
	str r1, [r4, r0]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0223E184: .word 0x00000614
_0223E188: .word 0x000F0D00
_0223E18C: .word 0x00000798
	thumb_func_end ov40_0223E0A4

	thumb_func_start ov40_0223E190
ov40_0223E190: ; 0x0223E190
	push {r3, r4, r5, lr}
	sub sp, #0x10
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _0223E1A8
	cmp r1, #1
	beq _0223E252
	b _0223E2EE
_0223E1A8:
	bl ov40_02230738
	add r0, r4, #0
	add r1, r4, #4
	mov r2, #0
	bl ov40_0222D9E8
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #0x24]
	mov r1, #0x3e
	mov r3, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #0x24]
	mov r1, #0x3e
	mov r3, #7
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	add r0, r5, #0
	mov r1, #0x38
	mov r2, #3
	bl ov40_022307DC
	add r0, r5, #0
	mov r1, #0x3b
	mov r2, #7
	bl ov40_022307DC
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineBToggleLayers
	add r0, r5, #0
	bl ov40_02242110
	add r0, r5, #0
	mov r1, #0
	bl ov40_022420B4
	mov r1, #0x7d
	ldr r0, _0223E2FC ; =0x00000514
	lsl r1, r1, #2
	str r1, [r4, r0]
	mov r0, #0x6d
	str r0, [sp]
	ldr r0, _0223E300 ; =ov40_022456C4
	ldr r2, _0223E304 ; =ov40_02241D10
	mov r1, #5
	add r3, r5, #0
	bl sub_02026C44
	ldr r1, _0223E308 ; =0x00000608
	ldr r2, _0223E30C ; =ov40_02241E14
	str r0, [r4, r1]
	mov r0, #0x6d
	str r0, [sp]
	ldr r0, _0223E310 ; =ov40_02245708
	mov r1, #9
	add r3, r5, #0
	bl sub_02026C44
	ldr r1, _0223E314 ; =0x0000060C
	add r5, #8
	str r0, [r4, r1]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0223E2F4
_0223E252:
	add r0, r4, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	mov r2, #0
	add r0, r4, #0
	add r1, r4, #4
	add r3, r2, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223E2D4
	add r0, r5, #0
	mov r1, #0x7c
	bl ov40_0222DED0
	mov r0, #0x13
	ldr r1, _0223E318 ; =0x0000FFFF
	lsl r0, r0, #6
	strh r1, [r4, r0]
	mov r2, #0xff
	add r1, r0, #2
	strb r2, [r4, r1]
	add r1, r0, #3
	strb r2, [r4, r1]
	add r0, r0, #4
	strb r2, [r4, r0]
	add r0, r5, #0
	mov r1, #0
	bl ov40_0223DBD4
	add r0, r5, #0
	mov r1, #0
	bl ov40_0223DF1C
	mov r1, #0x13
	lsl r1, r1, #6
	ldrh r1, [r4, r1]
	add r0, r5, #0
	bl ov40_0223DD68
	ldr r1, _0223E31C ; =0x000004C2
	add r0, r5, #0
	ldrb r1, [r4, r1]
	bl ov40_0223DCF0
	ldr r2, _0223E320 ; =0x000004C3
	add r0, r5, #0
	ldrb r1, [r4, r2]
	add r2, r2, #1
	ldrb r2, [r4, r2]
	bl ov40_0223DDE8
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_0223E2D4:
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223E2F4
_0223E2EE:
	mov r1, #3
	bl ov40_0222BF80
_0223E2F4:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0223E2FC: .word 0x00000514
_0223E300: .word ov40_022456C4
_0223E304: .word ov40_02241D10
_0223E308: .word 0x00000608
_0223E30C: .word ov40_02241E14
_0223E310: .word ov40_02245708
_0223E314: .word 0x0000060C
_0223E318: .word 0x0000FFFF
_0223E31C: .word 0x000004C2
_0223E320: .word 0x000004C3
	thumb_func_end ov40_0223E190

	thumb_func_start ov40_0223E324
ov40_0223E324: ; 0x0223E324
	push {r3, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r1, [r0, r1]
	ldr r0, _0223E338 ; =0x00000608
	ldr r0, [r1, r0]
	bl sub_02026CC4
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_0223E338: .word 0x00000608
	thumb_func_end ov40_0223E324

	thumb_func_start ov40_0223E33C
ov40_0223E33C: ; 0x0223E33C
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _0223E356
	cmp r1, #1
	beq _0223E37E
	cmp r1, #2
	beq _0223E3B8
	b _0223E3E2
_0223E356:
	bl ov40_0223E024
	add r0, r5, #0
	bl ov40_0223E064
	add r0, r5, #0
	bl ov40_0222DFB0
	ldr r0, _0223E48C ; =0x00000608
	ldr r0, [r4, r0]
	bl sub_02026CAC
	ldr r0, _0223E490 ; =0x0000060C
	ldr r0, [r4, r0]
	bl sub_02026CAC
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223E486
_0223E37E:
	add r0, r4, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r4, #0
	add r1, r4, #4
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223E39E
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_0223E39E:
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223E486
_0223E3B8:
	mov r1, #1
	bl ov40_02230964
	add r0, r5, #0
	bl ov40_022421FC
	add r0, r5, #0
	bl ov40_0222D88C
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	add r0, r5, #0
	mov r1, #1
	bl ov40_0222FB90
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223E486
_0223E3E2:
	bl ov40_0222FBB4
	cmp r0, #0
	beq _0223E486
	add r0, r4, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	cmp r0, #0
	beq _0223E456
	add r0, r5, #0
	bl ov40_0222DD08
	add r0, r4, #0
	add r0, #8
	bl ov40_0222DAA8
	ldr r0, [r5, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r5, #0x28]
	mov r2, #0xc
	mov r3, #0x10
	bl sub_02003EA4
	mov r1, #1
	ldr r3, [r5, #0x10]
	add r0, r5, #0
	add r2, r1, #0
	bl ov40_0222BF64
	add r0, r5, #0
	mov r1, #5
	bl ov40_0222BF80
	ldr r0, [r5, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	bl FreeToHeap
	b _0223E486
_0223E456:
	ldr r0, [r5, #0x58]
	mov r1, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #2
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
_0223E486:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0223E48C: .word 0x00000608
_0223E490: .word 0x0000060C
	thumb_func_end ov40_0223E33C

	thumb_func_start ov40_0223E494
ov40_0223E494: ; 0x0223E494
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _0223E4AA
	cmp r1, #1
	beq _0223E4B4
	b _0223E4EE
_0223E4AA:
	bl ov40_0223E064
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_0223E4B4:
	add r0, r4, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r4, #0
	add r1, r4, #4
	mov r2, #1
	mov r3, #2
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223E4D4
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_0223E4D4:
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223E516
_0223E4EE:
	ldr r1, _0223E51C ; =0x000004C5
	ldrb r1, [r4, r1]
	cmp r1, #0
	beq _0223E500
	cmp r1, #1
	beq _0223E508
	cmp r1, #2
	beq _0223E510
	b _0223E516
_0223E500:
	mov r1, #6
	bl ov40_0222BF80
	b _0223E516
_0223E508:
	mov r1, #7
	bl ov40_0222BF80
	b _0223E516
_0223E510:
	mov r1, #0xa
	bl ov40_0222BF80
_0223E516:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0223E51C: .word 0x000004C5
	thumb_func_end ov40_0223E494

	thumb_func_start ov40_0223E520
ov40_0223E520: ; 0x0223E520
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r4, r0, #0
	lsl r1, r1, #4
	ldr r5, [r4, r1]
	ldr r1, [r4, #8]
	cmp r1, #4
	bls _0223E532
	b _0223E6C8
_0223E532:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223E53E: ; jump table
	.short _0223E548 - _0223E53E - 2 ; case 0
	.short _0223E576 - _0223E53E - 2 ; case 1
	.short _0223E60C - _0223E53E - 2 ; case 2
	.short _0223E656 - _0223E53E - 2 ; case 3
	.short _0223E686 - _0223E53E - 2 ; case 4
_0223E548:
	mov r1, #0x71
	bl ov40_0222DF60
	ldr r1, _0223E6D4 ; =0x000004C2
	mov r0, #0xff
	strb r0, [r5, r1]
	ldrb r1, [r5, r1]
	add r0, r4, #0
	bl ov40_0223DCF0
	add r0, r4, #0
	mov r1, #1
	bl ov40_022420B4
	add r0, r4, #0
	mov r1, #0x3d
	mov r2, #7
	bl ov40_022307DC
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223E6D0
_0223E576:
	add r0, r5, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #0
	mov r3, #2
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223E5F2
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	ldr r0, _0223E6D8 ; =0x0000047C
	add r1, r4, #0
	add r0, r4, r0
	bl ov40_0222F9D4
	ldr r0, _0223E6DC ; =0x0000049C
	add r0, r4, r0
	bl ov40_0222F734
	add r0, r4, #0
	bl sub_02087E1C
	cmp r0, #1
	ldr r0, _0223E6DC ; =0x0000049C
	bne _0223E5C2
	ldr r2, _0223E6E0 ; =ov40_02245784
	add r0, r4, r0
	add r1, r4, #0
	bl ov40_0222E8C4
	b _0223E5CC
_0223E5C2:
	ldr r2, _0223E6E4 ; =ov40_02245758
	add r0, r4, r0
	add r1, r4, #0
	bl ov40_0222E8C4
_0223E5CC:
	ldr r1, _0223E6D8 ; =0x0000047C
	add r0, r4, r1
	add r1, #0x20
	add r1, r4, r1
	bl ov40_0222FA5C
	ldr r0, _0223E6DC ; =0x0000049C
	add r1, r4, #0
	add r0, r4, r0
	mov r2, #2
	bl ov40_0222F740
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223E5F2:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223E6D0
_0223E60C:
	ldr r0, _0223E6D8 ; =0x0000047C
	add r0, r4, r0
	bl ov40_0222FA88
	ldr r1, _0223E6DC ; =0x0000049C
	add r0, r4, r1
	sub r1, #0x10
	ldrsh r1, [r4, r1]
	bl ov40_0222F6D0
	ldr r0, _0223E6DC ; =0x0000049C
	add r1, r4, #0
	add r0, r4, r0
	bl ov40_0222F38C
	add r1, r0, #0
	beq _0223E63E
	ldr r0, _0223E6D4 ; =0x000004C2
	strb r1, [r5, r0]
	add r0, r4, #0
	bl ov40_0223DCF0
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223E63E:
	ldr r0, _0223E6E8 ; =ov40_02245650
	bl sub_02025320
	cmp r0, #0
	beq _0223E6D0
	add r0, r4, #0
	bl ov40_02230944
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223E6D0
_0223E656:
	ldr r0, _0223E6D8 ; =0x0000047C
	add r0, r4, r0
	bl ov40_0222FA24
	ldr r0, _0223E6DC ; =0x0000049C
	add r0, r4, r0
	bl ov40_0222F720
	ldr r0, _0223E6DC ; =0x0000049C
	add r1, r4, #0
	add r0, r4, r0
	bl ov40_0222F920
	ldr r0, _0223E6D8 ; =0x0000047C
	add r0, r4, r0
	bl ov40_0222FA18
	ldr r0, _0223E6DC ; =0x0000049C
	add r0, r4, r0
	bl ov40_0222F734
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223E686:
	add r0, r5, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #1
	mov r3, #2
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223E6AE
	add r0, r4, #0
	mov r1, #0
	bl ov40_022420B4
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223E6AE:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223E6D0
_0223E6C8:
	add r0, r4, #0
	mov r1, #0xb
	bl ov40_0222BF80
_0223E6D0:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223E6D4: .word 0x000004C2
_0223E6D8: .word 0x0000047C
_0223E6DC: .word 0x0000049C
_0223E6E0: .word ov40_02245784
_0223E6E4: .word ov40_02245758
_0223E6E8: .word ov40_02245650
	thumb_func_end ov40_0223E520

	thumb_func_start ov40_0223E6EC
ov40_0223E6EC: ; 0x0223E6EC
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	bne _0223E720
	mov r1, #0x72
	bl ov40_0222DF60
	mov r1, #0x13
	ldr r0, _0223E72C ; =0x0000FFFF
	lsl r1, r1, #6
	strh r0, [r4, r1]
	ldrh r1, [r4, r1]
	add r0, r5, #0
	bl ov40_0223DD68
	add r0, r5, #0
	mov r1, #1
	bl ov40_022420B4
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_0223E720:
	add r0, r5, #0
	mov r1, #8
	bl ov40_0222BF80
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223E72C: .word 0x0000FFFF
	thumb_func_end ov40_0223E6EC

	thumb_func_start ov40_0223E730
ov40_0223E730: ; 0x0223E730
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	str r0, [sp, #0x14]
	mov r0, #1
	str r0, [sp, #0x28]
	mov r1, #0x86
	ldr r0, [sp, #0x14]
	lsl r1, r1, #4
	ldr r1, [r0, r1]
	ldr r0, _0223E838 ; =0x000006D4
	ldr r5, _0223E83C ; =ov40_02245708
	mov r7, #0
	add r4, r1, r0
_0223E74A:
	ldrb r0, [r5, #2]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x24]
	ldrb r0, [r5]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x20]
	ldrb r0, [r5, #3]
	lsr r1, r0, #3
	ldr r0, [sp, #0x24]
	sub r0, r1, r0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x1c]
	ldrb r0, [r5, #1]
	lsr r1, r0, #3
	ldr r0, [sp, #0x20]
	sub r0, r1, r0
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	add r0, r4, #0
	bl InitWindow
	ldr r0, [sp, #0x20]
	add r1, r4, #0
	str r0, [sp]
	ldr r0, [sp, #0x1c]
	mov r2, #6
	str r0, [sp, #4]
	str r6, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x28]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r3, [sp, #0x24]
	ldr r0, [r0, #0x24]
	bl AddWindowParameterized
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x14]
	add r1, r7, #0
	ldr r0, [r0, #0x48]
	add r1, #0x44
	bl NewString_ReadMsgData
	str r0, [sp, #0x2c]
	ldr r1, [sp, #0x2c]
	add r0, r4, #0
	bl ov40_022306C0
	lsl r1, r6, #3
	sub r1, #0x10
	str r0, [sp, #0x30]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	add r1, r7, #0
	bl ov40_0223EBB8
	cmp r0, #1
	bne _0223E7F4
	ldr r0, [sp, #0x18]
	ldr r2, [sp, #0x2c]
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0223E840 ; =0x000F0D00
	ldr r3, [sp, #0x30]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #0
	bl AddTextPrinterParameterized2
	b _0223E810
_0223E7F4:
	ldr r0, [sp, #0x18]
	ldr r2, [sp, #0x2c]
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0223E844 ; =0x000C0B00
	ldr r3, [sp, #0x30]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #0
	bl AddTextPrinterParameterized2
_0223E810:
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	ldr r0, [sp, #0x2c]
	bl String_dtor
	ldr r0, [sp, #0x1c]
	add r7, r7, #1
	add r1, r0, #0
	ldr r0, [sp, #0x28]
	mul r1, r6
	add r0, r0, r1
	str r0, [sp, #0x28]
	add r4, #0x10
	add r5, r5, #4
	cmp r7, #9
	blo _0223E74A
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_0223E838: .word 0x000006D4
_0223E83C: .word ov40_02245708
_0223E840: .word 0x000F0D00
_0223E844: .word 0x000C0B00
	thumb_func_end ov40_0223E730

	thumb_func_start ov40_0223E848
ov40_0223E848: ; 0x0223E848
	push {r3, r4, r5, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r1, [r0, r1]
	ldr r0, _0223E86C ; =0x000006D4
	mov r4, #0
	add r5, r1, r0
_0223E856:
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #9
	blo _0223E856
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223E86C: .word 0x000006D4
	thumb_func_end ov40_0223E848

	thumb_func_start ov40_0223E870
ov40_0223E870: ; 0x0223E870
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r4, r0, #0
	lsl r1, r1, #4
	ldr r5, [r4, r1]
	ldr r1, [r4, #8]
	cmp r1, #4
	bhi _0223E97A
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223E88C: ; jump table
	.short _0223E896 - _0223E88C - 2 ; case 0
	.short _0223E8A6 - _0223E88C - 2 ; case 1
	.short _0223E8E6 - _0223E88C - 2 ; case 2
	.short _0223E90E - _0223E88C - 2 ; case 3
	.short _0223E918 - _0223E88C - 2 ; case 4
_0223E896:
	mov r1, #0x3c
	mov r2, #7
	bl ov40_022307DC
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223E994
_0223E8A6:
	add r0, r5, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #0
	mov r3, #2
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223E8CC
	add r0, r4, #0
	bl ov40_0223E730
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223E8CC:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223E994
_0223E8E6:
	ldr r0, _0223E998 ; =0x0000060C
	ldr r0, [r5, r0]
	bl sub_02026CC4
	ldr r0, _0223E99C ; =ov40_02245650
	bl sub_02025320
	cmp r0, #0
	bne _0223E900
	ldr r0, _0223E9A0 ; =0x000004D8
	ldr r0, [r5, r0]
	cmp r0, #1
	bne _0223E994
_0223E900:
	add r0, r4, #0
	bl ov40_02230944
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223E994
_0223E90E:
	bl ov40_0223E848
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223E918:
	ldr r0, _0223E9A0 ; =0x000004D8
	ldr r0, [r5, r0]
	cmp r0, #1
	bne _0223E938
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #1
	mov r3, #2
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223E994
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223E994
_0223E938:
	add r0, r5, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #1
	mov r3, #2
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223E960
	add r0, r4, #0
	mov r1, #0
	bl ov40_022420B4
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223E960:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223E994
_0223E97A:
	ldr r0, _0223E9A0 ; =0x000004D8
	ldr r0, [r5, r0]
	cmp r0, #1
	bne _0223E98C
	add r0, r4, #0
	mov r1, #9
	bl ov40_0222BF80
	b _0223E994
_0223E98C:
	add r0, r4, #0
	mov r1, #0xb
	bl ov40_0222BF80
_0223E994:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223E998: .word 0x0000060C
_0223E99C: .word ov40_02245650
_0223E9A0: .word 0x000004D8
	thumb_func_end ov40_0223E870

	thumb_func_start ov40_0223E9A4
ov40_0223E9A4: ; 0x0223E9A4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	mov r1, #0x86
	add r4, r0, #0
	lsl r1, r1, #4
	ldr r5, [r4, r1]
	ldr r1, [r4, #8]
	cmp r1, #4
	bls _0223E9B8
	b _0223EB72
_0223E9B8:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223E9C4: ; jump table
	.short _0223E9CE - _0223E9C4 - 2 ; case 0
	.short _0223E9EE - _0223E9C4 - 2 ; case 1
	.short _0223EA88 - _0223E9C4 - 2 ; case 2
	.short _0223EADC - _0223E9C4 - 2 ; case 3
	.short _0223EB0C - _0223E9C4 - 2 ; case 4
_0223E9CE:
	mov r1, #0x72
	bl ov40_0222DF60
	add r0, r4, #0
	mov r1, #1
	bl ov40_022420B4
	add r0, r4, #0
	mov r1, #0x3a
	mov r2, #7
	bl ov40_022307DC
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223EB96
_0223E9EE:
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #0
	mov r3, #2
	bl ov40_0222DA00
	cmp r0, #0
	bne _0223EA00
	b _0223EB96
_0223EA00:
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	ldr r0, _0223EB9C ; =0x0000047C
	add r1, r4, #0
	add r0, r4, r0
	bl ov40_0222F9D4
	mov r0, #0x4e
	lsl r0, r0, #4
	ldr r3, _0223EBA0 ; =ov40_022457DC
	add r2, r5, r0
	mov r6, #5
_0223EA1C:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r6, r6, #1
	bne _0223EA1C
	ldr r0, [r3]
	ldr r1, _0223EBA4 ; =0x000004DC
	str r0, [r2]
	ldr r2, [r5, r1]
	add r0, r1, #4
	str r2, [r5, r0]
	add r0, r1, #0
	sub r0, #0x14
	ldr r2, [r5, r0]
	add r0, r1, #0
	add r0, #8
	sub r1, #0x40
	str r2, [r5, r0]
	add r0, r4, r1
	bl ov40_0222F734
	ldr r3, _0223EBA8 ; =0x0000049C
	add r1, r4, #0
	add r2, r3, #0
	add r2, #0x38
	add r0, r4, r3
	add r3, #0x44
	ldr r2, [r5, r2]
	add r3, r5, r3
	bl ov40_0222E9B8
	ldr r1, _0223EBAC ; =0x000004E4
	mov r0, #0
	str r0, [r4, r1]
	add r0, r1, #0
	sub r0, #0x68
	sub r1, #0x48
	add r0, r4, r0
	add r1, r4, r1
	bl ov40_0222FA5C
	ldr r0, _0223EBA8 ; =0x0000049C
	add r1, r4, #0
	add r0, r4, r0
	mov r2, #2
	bl ov40_0222F740
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223EB96
_0223EA88:
	ldr r0, _0223EB9C ; =0x0000047C
	add r0, r4, r0
	bl ov40_0222FA88
	ldr r1, _0223EBA8 ; =0x0000049C
	add r0, r4, r1
	sub r1, #0x10
	ldrsh r1, [r4, r1]
	bl ov40_0222F6D0
	ldr r0, _0223EBA8 ; =0x0000049C
	add r1, r4, #0
	add r0, r4, r0
	bl ov40_0222F38C
	add r1, r0, #0
	beq _0223EABC
	mov r0, #0x13
	lsl r0, r0, #6
	strh r1, [r5, r0]
	add r0, r4, #0
	bl ov40_0223DD68
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223EABC:
	ldr r0, _0223EBB0 ; =ov40_02245650
	bl sub_02025320
	cmp r0, #0
	beq _0223EB96
	mov r0, #0x13
	ldr r1, _0223EBB4 ; =0x0000FFFF
	lsl r0, r0, #6
	strh r1, [r5, r0]
	add r0, r4, #0
	bl ov40_02230944
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223EB96
_0223EADC:
	ldr r0, _0223EB9C ; =0x0000047C
	add r0, r4, r0
	bl ov40_0222FA24
	ldr r0, _0223EBA8 ; =0x0000049C
	add r0, r4, r0
	bl ov40_0222F720
	ldr r0, _0223EBA8 ; =0x0000049C
	add r1, r4, #0
	add r0, r4, r0
	bl ov40_0222F920
	ldr r0, _0223EB9C ; =0x0000047C
	add r0, r4, r0
	bl ov40_0222FA18
	ldr r0, _0223EBA8 ; =0x0000049C
	add r0, r4, r0
	bl ov40_0222F734
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223EB0C:
	mov r0, #0x13
	lsl r0, r0, #6
	ldrh r1, [r5, r0]
	ldr r0, _0223EBB4 ; =0x0000FFFF
	cmp r1, r0
	beq _0223EB5A
	add r0, r5, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #1
	mov r3, #2
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223EB40
	add r0, r4, #0
	mov r1, #0
	bl ov40_022420B4
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223EB40:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223EB96
_0223EB5A:
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #1
	mov r3, #2
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223EB96
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223EB96
_0223EB72:
	add r0, r4, #0
	bl ov40_0223EDA8
	mov r0, #0x13
	lsl r0, r0, #6
	ldrh r1, [r5, r0]
	ldr r0, _0223EBB4 ; =0x0000FFFF
	cmp r1, r0
	beq _0223EB8E
	add r0, r4, #0
	mov r1, #0xb
	bl ov40_0222BF80
	b _0223EB96
_0223EB8E:
	add r0, r4, #0
	mov r1, #8
	bl ov40_0222BF80
_0223EB96:
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0223EB9C: .word 0x0000047C
_0223EBA0: .word ov40_022457DC
_0223EBA4: .word 0x000004DC
_0223EBA8: .word 0x0000049C
_0223EBAC: .word 0x000004E4
_0223EBB0: .word ov40_02245650
_0223EBB4: .word 0x0000FFFF
	thumb_func_end ov40_0223E9A4

	thumb_func_start ov40_0223EBB8
ov40_0223EBB8: ; 0x0223EBB8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	str r0, [sp, #8]
	add r0, r1, #1
	ldr r2, _0223EC38 ; =ov40_02245E44
	lsl r0, r0, #1
	ldrh r4, [r2, r0]
	lsl r0, r1, #1
	ldrh r6, [r2, r0]
	ldr r1, [sp, #8]
	mov r0, #0x6d
	add r2, sp, #0xc
	bl ov40_0222DD68
	str r0, [sp, #4]
	mov r0, #0x83
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl Sav2_Pokedex_get
	str r0, [sp]
	add r7, r6, #0
	cmp r6, r4
	bge _0223EC0A
	ldr r0, [sp, #4]
	lsl r1, r6, #1
	add r5, r0, r1
_0223EBF2:
	ldrh r1, [r5]
	ldr r0, [sp]
	bl Pokedex_CheckMonSeenFlag
	cmp r0, #0
	bne _0223EC02
	ldr r0, _0223EC3C ; =0x0000FFFF
	strh r0, [r5]
_0223EC02:
	add r7, r7, #1
	add r5, r5, #2
	cmp r7, r4
	blt _0223EBF2
_0223EC0A:
	cmp r6, r4
	bge _0223EC2A
	ldr r0, [sp, #4]
	lsl r1, r6, #1
	add r2, r0, r1
	ldr r0, _0223EC3C ; =0x0000FFFF
_0223EC16:
	ldrh r1, [r2]
	cmp r1, r0
	beq _0223EC22
	mov r0, #1
	str r0, [sp, #8]
	b _0223EC2A
_0223EC22:
	add r6, r6, #1
	add r2, r2, #2
	cmp r6, r4
	blt _0223EC16
_0223EC2A:
	ldr r0, [sp, #4]
	bl FreeToHeap
	ldr r0, [sp, #8]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223EC38: .word ov40_02245E44
_0223EC3C: .word 0x0000FFFF
	thumb_func_end ov40_0223EBB8

	thumb_func_start ov40_0223EC40
ov40_0223EC40: ; 0x0223EC40
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	add r0, r1, #1
	ldr r2, _0223ED90 ; =ov40_02245E44
	lsl r0, r0, #1
	ldrh r6, [r2, r0]
	lsl r0, r1, #1
	ldrh r0, [r2, r0]
	ldr r2, _0223ED94 ; =0x000004CC
	mov r1, #0
	str r0, [sp]
	mov r0, #0x6d
	add r2, r4, r2
	bl ov40_0222DD68
	mov r2, #0x4d
	lsl r2, r2, #4
	str r0, [r4, r2]
	sub r2, r2, #4
	mov r0, #0x6d
	mov r1, #0
	add r2, r4, r2
	bl ov40_0222DD68
	str r0, [sp, #8]
	mov r0, #0x83
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl Sav2_Pokedex_get
	str r0, [sp, #4]
	ldr r0, _0223ED98 ; =0x000004C8
	mov r1, #0
	ldr r7, [sp]
	str r1, [r4, r0]
	add r0, r7, #0
	cmp r0, r6
	bge _0223ECBE
	lsl r1, r0, #1
	ldr r0, [sp, #8]
	add r5, r0, r1
_0223EC9A:
	ldrh r1, [r5]
	ldr r0, [sp, #4]
	bl Pokedex_CheckMonSeenFlag
	cmp r0, #0
	bne _0223ECAC
	ldr r0, _0223ED9C ; =0x0000FFFF
	strh r0, [r5]
	b _0223ECB6
_0223ECAC:
	ldr r0, _0223ED98 ; =0x000004C8
	ldr r0, [r4, r0]
	add r1, r0, #1
	ldr r0, _0223ED98 ; =0x000004C8
	str r1, [r4, r0]
_0223ECB6:
	add r7, r7, #1
	add r5, r5, #2
	cmp r7, r6
	blt _0223EC9A
_0223ECBE:
	ldr r1, [sp]
	mov r0, #0
	cmp r1, r6
	bge _0223ECEE
	lsl r2, r1, #1
	ldr r1, [sp, #8]
	ldr r7, _0223ED9C ; =0x0000FFFF
	add r2, r1, r2
	add r3, r0, #0
_0223ECD0:
	ldrh r1, [r2]
	cmp r1, r7
	beq _0223ECE2
	mov r5, #0x4d
	lsl r5, r5, #4
	ldr r5, [r4, r5]
	add r0, r0, #1
	strh r1, [r5, r3]
	add r3, r3, #2
_0223ECE2:
	ldr r1, [sp]
	add r2, r2, #2
	add r1, r1, #1
	str r1, [sp]
	cmp r1, r6
	blt _0223ECD0
_0223ECEE:
	ldr r1, _0223ED94 ; =0x000004CC
	ldr r1, [r4, r1]
	cmp r0, r1
	bge _0223ED14
	mov r7, #0x4d
	ldr r1, [sp, #8]
	lsl r6, r0, #1
	lsl r7, r7, #4
	add r5, r1, r6
	sub r1, r7, #4
_0223ED02:
	ldrh r3, [r5]
	ldr r2, [r4, r7]
	add r0, r0, #1
	strh r3, [r2, r6]
	ldr r2, [r4, r1]
	add r5, r5, #2
	add r6, r6, #2
	cmp r0, r2
	blt _0223ED02
_0223ED14:
	ldr r0, [sp, #8]
	bl FreeToHeap
	ldr r1, _0223ED98 ; =0x000004C8
	mov r0, #0x6d
	ldr r1, [r4, r1]
	lsl r1, r1, #4
	bl AllocFromHeap
	ldr r2, _0223EDA0 ; =0x000004DC
	mov r1, #0
	str r0, [r4, r2]
	ldr r0, [r4, r2]
	sub r2, #0x14
	ldr r2, [r4, r2]
	lsl r2, r2, #4
	bl MI_CpuFill8
	ldr r0, _0223ED98 ; =0x000004C8
	mov r5, #0
	ldr r0, [r4, r0]
	cmp r0, #0
	ble _0223ED74
	ldr r7, _0223EDA0 ; =0x000004DC
	add r2, r5, #0
	add r0, r7, #0
	add r3, r5, #0
	sub r0, #0x14
_0223ED4C:
	mov r1, #0x4d
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	ldr r6, _0223EDA0 ; =0x000004DC
	ldrh r1, [r1, r2]
	ldr r6, [r4, r6]
	add r5, r5, #1
	str r1, [r6, r3]
	mov r1, #0x4d
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	ldr r6, [r4, r7]
	ldrh r1, [r1, r2]
	add r6, r6, r3
	add r2, r2, #2
	str r1, [r6, #4]
	ldr r1, [r4, r0]
	add r3, #0x10
	cmp r5, r1
	blt _0223ED4C
_0223ED74:
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xed
	mov r3, #0x6d
	bl NewMsgDataFromNarc
	ldr r1, _0223EDA4 ; =0x000004D4
	mov r2, #1
	str r0, [r4, r1]
	add r0, r1, #4
	str r2, [r4, r0]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0223ED90: .word ov40_02245E44
_0223ED94: .word 0x000004CC
_0223ED98: .word 0x000004C8
_0223ED9C: .word 0x0000FFFF
_0223EDA0: .word 0x000004DC
_0223EDA4: .word 0x000004D4
	thumb_func_end ov40_0223EC40

	thumb_func_start ov40_0223EDA8
ov40_0223EDA8: ; 0x0223EDA8
	push {r4, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r4, [r0, r1]
	ldr r0, _0223EDD4 ; =0x000004D4
	ldr r0, [r4, r0]
	bl DestroyMsgData
	ldr r0, _0223EDD8 ; =0x000004DC
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0x4d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl FreeToHeap
	ldr r0, _0223EDDC ; =0x000004D8
	mov r1, #0
	str r1, [r4, r0]
	pop {r4, pc}
	nop
_0223EDD4: .word 0x000004D4
_0223EDD8: .word 0x000004DC
_0223EDDC: .word 0x000004D8
	thumb_func_end ov40_0223EDA8

	thumb_func_start ov40_0223EDE0
ov40_0223EDE0: ; 0x0223EDE0
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r4, r0, #0
	lsl r1, r1, #4
	ldr r5, [r4, r1]
	ldr r1, [r4, #8]
	cmp r1, #4
	bls _0223EDF2
	b _0223EF7C
_0223EDF2:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223EDFE: ; jump table
	.short _0223EE08 - _0223EDFE - 2 ; case 0
	.short _0223EE3E - _0223EDFE - 2 ; case 1
	.short _0223EEB6 - _0223EDFE - 2 ; case 2
	.short _0223EF1A - _0223EDFE - 2 ; case 3
	.short _0223EF3A - _0223EDFE - 2 ; case 4
_0223EE08:
	mov r1, #0x73
	bl ov40_0222DF60
	ldr r2, _0223EF88 ; =0x000004C3
	mov r1, #0xff
	strb r1, [r5, r2]
	add r0, r2, #1
	strb r1, [r5, r0]
	ldrb r1, [r5, r2]
	add r2, r2, #1
	ldrb r2, [r5, r2]
	add r0, r4, #0
	bl ov40_0223DDE8
	add r0, r4, #0
	mov r1, #1
	bl ov40_022420B4
	add r0, r4, #0
	mov r1, #0x39
	mov r2, #7
	bl ov40_022307DC
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223EF84
_0223EE3E:
	add r0, r5, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #0
	mov r3, #2
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223EE9C
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	ldr r0, _0223EF8C ; =0x0000047C
	add r1, r4, #0
	add r0, r4, r0
	bl ov40_0222F9D4
	ldr r0, _0223EF90 ; =0x0000049C
	ldr r2, _0223EF94 ; =ov40_0224572C
	add r0, r4, r0
	add r1, r4, #0
	bl ov40_0222E8C4
	ldr r1, _0223EF8C ; =0x0000047C
	add r0, r4, r1
	add r1, #0x20
	add r1, r4, r1
	bl ov40_0222FA5C
	ldr r0, _0223EF90 ; =0x0000049C
	add r1, r4, #0
	add r0, r4, r0
	mov r2, #2
	bl ov40_0222F740
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223EE9C:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223EF84
_0223EEB6:
	ldr r0, _0223EF8C ; =0x0000047C
	add r0, r4, r0
	bl ov40_0222FA88
	ldr r1, _0223EF90 ; =0x0000049C
	add r0, r4, r1
	sub r1, #0x10
	ldrsh r1, [r4, r1]
	bl ov40_0222F6D0
	ldr r0, _0223EF90 ; =0x0000049C
	add r1, r4, #0
	add r0, r4, r0
	bl ov40_0222F38C
	cmp r0, #0
	beq _0223EF02
	ldr r0, _0223EF98 ; =0x0000088C
	ldr r0, [r4, r0]
	bl sub_02031620
	ldr r1, _0223EF88 ; =0x000004C3
	strb r0, [r5, r1]
	ldr r0, _0223EF98 ; =0x0000088C
	ldr r0, [r4, r0]
	bl sub_0203162C
	ldr r2, _0223EF9C ; =0x000004C4
	strb r0, [r5, r2]
	sub r1, r2, #1
	ldrb r1, [r5, r1]
	ldrb r2, [r5, r2]
	add r0, r4, #0
	bl ov40_0223DDE8
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223EF02:
	ldr r0, _0223EFA0 ; =ov40_02245650
	bl sub_02025320
	cmp r0, #0
	beq _0223EF84
	add r0, r4, #0
	bl ov40_02230944
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223EF84
_0223EF1A:
	ldr r0, _0223EF8C ; =0x0000047C
	add r0, r4, r0
	bl ov40_0222FA24
	ldr r0, _0223EF90 ; =0x0000049C
	add r0, r4, r0
	bl ov40_0222F720
	ldr r0, _0223EF90 ; =0x0000049C
	add r1, r4, #0
	add r0, r4, r0
	bl ov40_0222F920
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223EF3A:
	add r0, r5, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #1
	mov r3, #2
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223EF62
	add r0, r4, #0
	mov r1, #0
	bl ov40_022420B4
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223EF62:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223EF84
_0223EF7C:
	add r0, r4, #0
	mov r1, #0xb
	bl ov40_0222BF80
_0223EF84:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223EF88: .word 0x000004C3
_0223EF8C: .word 0x0000047C
_0223EF90: .word 0x0000049C
_0223EF94: .word ov40_0224572C
_0223EF98: .word 0x0000088C
_0223EF9C: .word 0x000004C4
_0223EFA0: .word ov40_02245650
	thumb_func_end ov40_0223EDE0

	thumb_func_start ov40_0223EFA4
ov40_0223EFA4: ; 0x0223EFA4
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _0223EFBA
	cmp r1, #1
	beq _0223EFD4
	b _0223F01E
_0223EFBA:
	mov r1, #0x38
	mov r2, #3
	bl ov40_022307DC
	add r0, r5, #0
	mov r1, #0x3b
	mov r2, #7
	bl ov40_022307DC
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223F024
_0223EFD4:
	add r0, r4, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	add r0, r4, #0
	add r1, r4, #4
	mov r2, #0
	mov r3, #2
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223F004
	add r0, r5, #0
	mov r1, #0x7c
	bl ov40_0222DF60
	add r0, r5, #0
	mov r1, #0
	bl ov40_0223DF1C
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_0223F004:
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223F024
_0223F01E:
	mov r1, #3
	bl ov40_0222BF80
_0223F024:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov40_0223EFA4

	thumb_func_start ov40_0223F028
ov40_0223F028: ; 0x0223F028
	push {r4, r5, r6, lr}
	sub sp, #8
	mov r1, #0x86
	add r4, r0, #0
	lsl r1, r1, #4
	ldr r5, [r4, r1]
	bl ov40_0223D5CC
	cmp r0, #0
	bne _0223F042
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_0223F042:
	ldr r0, [r4, #8]
	cmp r0, #3
	bhi _0223F126
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223F054: ; jump table
	.short _0223F05C - _0223F054 - 2 ; case 0
	.short _0223F072 - _0223F054 - 2 ; case 1
	.short _0223F0B2 - _0223F054 - 2 ; case 2
	.short _0223F0FC - _0223F054 - 2 ; case 3
_0223F05C:
	add r0, r4, #0
	mov r1, #0x75
	bl ov40_0222DF60
	ldr r0, _0223F150 ; =0x0000057D
	bl PlaySE
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223F148
_0223F072:
	ldr r0, _0223F154 ; =0x000004C2
	ldrb r6, [r5, r0]
	cmp r6, #0xff
	bne _0223F08A
	add r0, r4, #0
	bl sub_02087E1C
	cmp r0, #1
	bne _0223F088
	mov r6, #0xff
	b _0223F08A
_0223F088:
	mov r6, #0xfe
_0223F08A:
	add r0, r4, #0
	bl ov40_0223D540
	ldr r3, _0223F158 ; =0x000004C4
	lsl r2, r6, #0x18
	ldrb r1, [r5, r3]
	lsr r2, r2, #0x18
	str r1, [sp]
	sub r1, r3, #4
	sub r3, r3, #1
	ldrh r1, [r5, r1]
	ldrb r3, [r5, r3]
	bl ov39_02227590
	cmp r0, #1
	bne _0223F148
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223F148
_0223F0B2:
	add r0, r4, #0
	bl ov40_0223D540
	add r1, sp, #4
	bl ov39_02227D44
	cmp r0, #1
	ldr r0, _0223F150 ; =0x0000057D
	bne _0223F0E6
	mov r1, #0
	bl StopSE
	ldr r3, [sp, #4]
	add r0, r4, #0
	ldr r2, [r3, #0xc]
	ldr r3, [r3, #4]
	mov r1, #7
	bl ov40_022309DC
	ldr r0, _0223F15C ; =0x00004138
	mov r1, #0
	str r1, [r4, r0]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223F148
_0223F0E6:
	mov r1, #0
	bl StopSE
	mov r0, #0x51
	mov r1, #0x76
	lsl r0, r0, #4
	str r1, [r4, r0]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223F148
_0223F0FC:
	ldr r0, _0223F15C ; =0x00004138
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0223F118
	mov r1, #0x51
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	add r0, r4, #0
	bl ov40_0222DF60
	ldr r0, _0223F160 ; =0x0000057C
	bl PlaySE
	b _0223F11E
_0223F118:
	ldr r0, _0223F164 ; =0x00000577
	bl PlaySE
_0223F11E:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223F148
_0223F126:
	ldr r0, _0223F168 ; =0x0000049C
	add r0, r4, r0
	bl ov40_0222F734
	ldr r0, _0223F15C ; =0x00004138
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0223F140
	add r0, r4, #0
	mov r1, #3
	bl ov40_0222BF80
	b _0223F148
_0223F140:
	add r0, r4, #0
	mov r1, #0xd
	bl ov40_0222BF80
_0223F148:
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_0223F150: .word 0x0000057D
_0223F154: .word 0x000004C2
_0223F158: .word 0x000004C4
_0223F15C: .word 0x00004138
_0223F160: .word 0x0000057C
_0223F164: .word 0x00000577
_0223F168: .word 0x0000049C
	thumb_func_end ov40_0223F028

	thumb_func_start ov40_0223F16C
ov40_0223F16C: ; 0x0223F16C
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _0223F182
	cmp r1, #1
	beq _0223F1AA
	b _0223F1EC
_0223F182:
	bl ov40_0223E024
	add r0, r5, #0
	bl ov40_0223E064
	add r0, r5, #0
	bl ov40_0222DFB0
	ldr r0, _0223F1F8 ; =0x00000608
	ldr r0, [r4, r0]
	bl sub_02026CAC
	ldr r0, _0223F1FC ; =0x0000060C
	ldr r0, [r4, r0]
	bl sub_02026CAC
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223F1F2
_0223F1AA:
	add r0, r4, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r4, #0
	add r1, r4, #4
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223F1D2
	add r0, r5, #0
	mov r1, #1
	bl ov40_022420B4
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_0223F1D2:
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223F1F2
_0223F1EC:
	mov r1, #0xe
	bl ov40_0222BF80
_0223F1F2:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0223F1F8: .word 0x00000608
_0223F1FC: .word 0x0000060C
	thumb_func_end ov40_0223F16C

	thumb_func_start ov40_0223F200
ov40_0223F200: ; 0x0223F200
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _0223F21A
	cmp r1, #1
	bne _0223F218
	b _0223F31C
_0223F218:
	b _0223F3BC
_0223F21A:
	bl sub_0202FC48
	cmp r0, #0
	beq _0223F226
	bl sub_0202FC24
_0223F226:
	mov r0, #0x4e
	lsl r0, r0, #4
	ldr r3, _0223F3C8 ; =ov40_022457B0
	add r2, r4, r0
	mov r6, #5
_0223F230:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r6, r6, #1
	bne _0223F230
	ldr r0, [r3]
	mov r1, #0
	str r0, [r2]
	mov r0, #0x4e
	lsl r0, r0, #4
	str r1, [r4, r0]
	ldr r1, _0223F3CC ; =0x00004138
	add r0, r0, #4
	ldr r1, [r5, r1]
	str r1, [r4, r0]
	add r0, r5, #0
	bl ov40_0222FE00
	mov r0, #0x6d
	bl ov40_0222FE8C
	ldr r1, _0223F3D0 ; =0x0000050C
	mov r2, #3
	str r0, [r4, r1]
	add r0, r5, #0
	mov r1, #4
	bl ov40_022307DC
	mov r1, #7
	add r0, r5, #0
	add r2, r1, #0
	bl ov40_022307DC
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	add r0, r5, #0
	bl ov40_0223E0A4
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	ldr r0, _0223F3D4 ; =0x0000047C
	add r1, r5, #0
	add r0, r5, r0
	bl ov40_0222F9D4
	ldr r3, _0223F3D8 ; =0x0000049C
	add r1, r5, #0
	add r0, r5, r3
	add r3, #0x44
	mov r2, #0
	add r3, r4, r3
	bl ov40_0222E9B8
	ldr r1, _0223F3DC ; =0x000004E4
	mov r0, #1
	str r0, [r5, r1]
	add r0, r1, #0
	sub r0, #0x68
	sub r1, #0x48
	add r0, r5, r0
	add r1, r5, r1
	bl ov40_0222FA5C
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	ldr r0, _0223F3D8 ; =0x0000049C
	add r1, r5, #0
	add r0, r5, r0
	mov r2, #1
	bl ov40_0222F740
	ldr r0, _0223F3D8 ; =0x0000049C
	mov r1, #0x40
	add r0, r5, r0
	mov r2, #0xb8
	bl ov40_0222F858
	ldr r0, _0223F3D8 ; =0x0000049C
	add r1, r5, #0
	add r0, r5, r0
	bl ov40_0222F488
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r5, #0
	bl ov40_0223D68C
	add r0, r5, #0
	mov r1, #0
	bl ov40_0223D830
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223F3C2
_0223F31C:
	add r0, r4, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	mov r2, #0
	add r0, r4, #0
	add r1, r4, #4
	add r3, r2, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223F38A
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	add r0, r5, #0
	mov r1, #1
	bl ov40_0223D830
	ldr r3, _0223F3E0 ; =0x000004D8
	mov r1, #0x6f
	ldr r6, [r5, r3]
	mov r3, #0x18
	mul r3, r6
	lsl r1, r1, #4
	add r3, #0x4c
	lsl r3, r3, #0x10
	ldr r1, [r5, r1]
	add r0, r5, #0
	mov r2, #0x10
	asr r3, r3, #0x10
	bl ov40_0223077C
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	mov r1, #0xc
	ldr r0, [r5, r0]
	add r2, r1, #0
	bl sub_02087A08
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_0223F38A:
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r5, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223F3C2
_0223F3BC:
	mov r1, #0xf
	bl ov40_0222BF80
_0223F3C2:
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0223F3C8: .word ov40_022457B0
_0223F3CC: .word 0x00004138
_0223F3D0: .word 0x0000050C
_0223F3D4: .word 0x0000047C
_0223F3D8: .word 0x0000049C
_0223F3DC: .word 0x000004E4
_0223F3E0: .word 0x000004D8
	thumb_func_end ov40_0223F200

	thumb_func_start ov40_0223F3E4
ov40_0223F3E4: ; 0x0223F3E4
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _0223F3FE
	cmp r1, #1
	beq _0223F474
	cmp r1, #2
	beq _0223F4EC
	b _0223F578
_0223F3FE:
	ldr r0, _0223F584 ; =0x0000047C
	add r0, r5, r0
	bl ov40_0222FA88
	ldr r1, _0223F588 ; =0x0000049C
	add r0, r5, r1
	sub r1, #0x10
	ldrsh r1, [r5, r1]
	bl ov40_0222F5EC
	ldr r0, _0223F588 ; =0x0000049C
	add r1, r5, #0
	add r0, r5, r0
	bl ov40_0222F488
	ldr r2, _0223F58C ; =0x000004D8
	mov r0, #0x6f
	ldr r3, [r5, r2]
	mov r2, #0x18
	mul r2, r3
	lsl r0, r0, #4
	add r2, #0x4c
	lsl r2, r2, #0x10
	ldr r0, [r5, r0]
	mov r1, #0x10
	asr r2, r2, #0x10
	bl sub_020878EC
	add r0, r5, #0
	bl ov40_0223D8D4
	ldr r0, _0223F590 ; =ov40_0224564C
	bl sub_02025320
	cmp r0, #0
	beq _0223F456
	add r0, r5, #0
	bl ov40_02230944
	mov r0, #0x11
	str r0, [r4, #0xc]
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_0223F456:
	ldr r0, _0223F594 ; =ov40_02245650
	bl sub_02025320
	cmp r0, #0
	bne _0223F462
	b _0223F57E
_0223F462:
	add r0, r5, #0
	bl ov40_02230944
	mov r0, #0x10
	str r0, [r4, #0xc]
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223F57E
_0223F474:
	ldr r0, _0223F584 ; =0x0000047C
	add r0, r5, r0
	bl ov40_0222FA24
	ldr r0, _0223F588 ; =0x0000049C
	add r0, r5, r0
	bl ov40_0222F720
	ldr r0, _0223F588 ; =0x0000049C
	add r1, r5, #0
	add r0, r5, r0
	bl ov40_0222F920
	ldr r0, _0223F598 ; =0x0000050C
	ldr r0, [r4, r0]
	bl ov40_0222FE98
	add r0, r5, #0
	bl ov40_0223D874
	add r0, r5, #0
	bl ov40_0222FE68
	add r0, r5, #0
	bl ov40_0223E024
	add r0, r5, #0
	bl ov40_0223E064
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	mov r1, #0
	ldr r0, [r5, r0]
	add r2, r1, #0
	bl sub_02087A08
	ldr r0, [r4, #0xc]
	cmp r0, #0x10
	bne _0223F4E6
	ldr r0, _0223F584 ; =0x0000047C
	add r0, r5, r0
	bl ov40_0222FA18
	ldr r0, _0223F588 ; =0x0000049C
	add r0, r5, r0
	bl ov40_0222F734
	mov r0, #0x51
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r4, r0]
_0223F4E6:
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_0223F4EC:
	add r0, r4, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r4, #0
	add r1, r4, #4
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223F546
	add r0, r5, #0
	mov r1, #0
	bl ov40_022420B4
	ldr r0, [r4, #0xc]
	cmp r0, #0x11
	bne _0223F540
	add r0, r4, #0
	add r1, r5, #0
	add r0, #0x10
	add r1, #0x14
	mov r2, #3
	bl ov40_0222D66C
	add r0, r4, #0
	add r1, r5, #0
	add r0, #0x2c
	add r1, #0x14
	mov r2, #0x5e
	bl ov40_0222D66C
	ldr r0, [r4, #0x14]
	mov r1, #0
	bl sub_0200DC4C
	ldr r0, [r4, #0x30]
	mov r1, #3
	bl sub_0200DC4C
_0223F540:
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_0223F546:
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r5, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223F57E
_0223F578:
	ldr r1, [r4, #0xc]
	bl ov40_0222BF80
_0223F57E:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0223F584: .word 0x0000047C
_0223F588: .word 0x0000049C
_0223F58C: .word 0x000004D8
_0223F590: .word ov40_0224564C
_0223F594: .word ov40_02245650
_0223F598: .word 0x0000050C
	thumb_func_end ov40_0223F3E4

	thumb_func_start ov40_0223F59C
ov40_0223F59C: ; 0x0223F59C
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _0223F5B2
	cmp r1, #1
	beq _0223F614
	b _0223F692
_0223F5B2:
	mov r1, #0x38
	mov r2, #3
	bl ov40_022307DC
	add r0, r5, #0
	mov r1, #0x3b
	mov r2, #7
	bl ov40_022307DC
	add r0, r5, #0
	mov r1, #0
	bl ov40_022420B4
	mov r0, #0x6d
	str r0, [sp]
	ldr r0, _0223F69C ; =ov40_022456C4
	ldr r2, _0223F6A0 ; =ov40_02241D10
	mov r1, #5
	add r3, r5, #0
	bl sub_02026C44
	ldr r1, _0223F6A4 ; =0x00000608
	ldr r2, _0223F6A8 ; =ov40_02241E14
	str r0, [r4, r1]
	mov r0, #0x6d
	str r0, [sp]
	ldr r0, _0223F6AC ; =ov40_02245708
	mov r1, #9
	add r3, r5, #0
	bl sub_02026C44
	ldr r1, _0223F6B0 ; =0x0000060C
	str r0, [r4, r1]
	add r0, r5, #0
	mov r1, #0
	bl ov40_0223DF1C
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223F698
_0223F614:
	add r0, r4, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	mov r2, #0
	add r0, r4, #0
	add r1, r4, #4
	add r3, r2, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223F678
	add r0, r5, #0
	mov r1, #0x7c
	bl ov40_0222DED0
	add r0, r5, #0
	mov r1, #0
	bl ov40_0223DBD4
	mov r1, #0x13
	lsl r1, r1, #6
	ldrh r1, [r4, r1]
	add r0, r5, #0
	bl ov40_0223DD68
	ldr r1, _0223F6B4 ; =0x000004C2
	add r0, r5, #0
	ldrb r1, [r4, r1]
	bl ov40_0223DCF0
	ldr r2, _0223F6B8 ; =0x000004C3
	add r0, r5, #0
	ldrb r1, [r4, r2]
	add r2, r2, #1
	ldrb r2, [r4, r2]
	bl ov40_0223DDE8
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_0223F678:
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223F698
_0223F692:
	mov r1, #3
	bl ov40_0222BF80
_0223F698:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223F69C: .word ov40_022456C4
_0223F6A0: .word ov40_02241D10
_0223F6A4: .word 0x00000608
_0223F6A8: .word ov40_02241E14
_0223F6AC: .word ov40_02245708
_0223F6B0: .word 0x0000060C
_0223F6B4: .word 0x000004C2
_0223F6B8: .word 0x000004C3
	thumb_func_end ov40_0223F59C

	thumb_func_start ov40_0223F6BC
ov40_0223F6BC: ; 0x0223F6BC
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r4, r0, #0
	lsl r1, r1, #4
	ldr r5, [r4, r1]
	ldr r1, [r4, #8]
	cmp r1, #3
	bls _0223F6CE
	b _0223F802
_0223F6CE:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223F6DA: ; jump table
	.short _0223F6E2 - _0223F6DA - 2 ; case 0
	.short _0223F6F2 - _0223F6DA - 2 ; case 1
	.short _0223F73C - _0223F6DA - 2 ; case 2
	.short _0223F7A6 - _0223F6DA - 2 ; case 3
_0223F6E2:
	mov r1, #6
	mov r2, #7
	bl ov40_022307DC
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223F80A
_0223F6F2:
	bl ov40_022408AC
	mov r0, #0x6d
	str r0, [sp]
	ldr r0, _0223F810 ; =ov40_022456B4
	ldr r2, _0223F814 ; =ov40_02241E40
	mov r1, #4
	add r3, r4, #0
	bl sub_02026C44
	ldr r1, _0223F818 ; =0x00000608
	ldr r2, _0223F81C ; =ov40_02241ED4
	str r0, [r5, r1]
	mov r0, #0x6d
	str r0, [sp]
	ldr r0, _0223F820 ; =ov40_02245674
	mov r1, #4
	add r3, r4, #0
	bl sub_02026C44
	ldr r1, _0223F824 ; =0x0000060C
	ldr r2, _0223F828 ; =ov40_02241F3C
	str r0, [r5, r1]
	mov r0, #0x6d
	str r0, [sp]
	ldr r0, _0223F82C ; =ov40_02245654
	mov r1, #2
	add r3, r4, #0
	bl sub_02026C44
	mov r1, #0x61
	lsl r1, r1, #4
	str r0, [r5, r1]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223F80A
_0223F73C:
	mov r1, #0x73
	mov r2, #0
	lsl r1, r1, #2
	str r2, [r5, r1]
	mov r1, #1
	bl ov40_02230964
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	add r1, r4, #0
	bl ov40_02230638
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov40_02230410
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #3
	bl ov40_022307DC
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl ov40_022306A0
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223F80A
_0223F7A6:
	add r0, r5, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	mov r2, #0
	add r0, r5, #0
	add r1, r5, #4
	add r3, r2, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223F7E8
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	bl ov40_022306A0
	add r0, r4, #0
	bl ov40_02241AB0
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223F7E8:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223F80A
_0223F802:
	add r0, r4, #0
	mov r1, #0x12
	bl ov40_0222BF80
_0223F80A:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0223F810: .word ov40_022456B4
_0223F814: .word ov40_02241E40
_0223F818: .word 0x00000608
_0223F81C: .word ov40_02241ED4
_0223F820: .word ov40_02245674
_0223F824: .word 0x0000060C
_0223F828: .word ov40_02241F3C
_0223F82C: .word ov40_02245654
	thumb_func_end ov40_0223F6BC

	thumb_func_start ov40_0223F830
ov40_0223F830: ; 0x0223F830
	push {r3, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r1, [r0, r1]
	ldr r0, _0223F844 ; =0x00000608
	ldr r0, [r1, r0]
	bl sub_02026CC4
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_0223F844: .word 0x00000608
	thumb_func_end ov40_0223F830

	thumb_func_start ov40_0223F848
ov40_0223F848: ; 0x0223F848
	push {r4, lr}
	add r4, r0, #0
	bl ov40_0224222C
	cmp r0, #0
	beq _0223F85C
	add r0, r4, #0
	mov r1, #0x12
	bl ov40_0222BF80
_0223F85C:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov40_0223F848

	thumb_func_start ov40_0223F860
ov40_0223F860: ; 0x0223F860
	push {r4, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r4, [r0, r1]
	bl ov40_02242CFC
	cmp r0, #0
	beq _0223F87A
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r4, pc}
_0223F87A:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov40_0223F860

	thumb_func_start ov40_0223F880
ov40_0223F880: ; 0x0223F880
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _0223F896
	cmp r1, #1
	beq _0223F904
	b _0223F972
_0223F896:
	ldr r0, _0223F97C ; =0x00000608
	ldr r0, [r4, r0]
	bl sub_02026CAC
	ldr r0, _0223F980 ; =0x0000060C
	ldr r0, [r4, r0]
	bl sub_02026CAC
	mov r0, #0x61
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02026CAC
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	add r0, r5, #0
	bl ov40_02240910
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #0
	bne _0223F8E4
	sub r0, #0xc0
	add r0, r4, r0
	add r1, r5, #0
	bl ov40_0223064C
	b _0223F8EE
_0223F8E4:
	add r4, #0x80
	add r0, r4, #0
	add r1, r5, #0
	bl ov40_0222E7B8
_0223F8EE:
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	add r0, r5, #0
	bl ov40_02241A34
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0223F978
_0223F904:
	add r0, r4, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r4, #0
	add r1, r4, #4
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223F958
	add r0, r4, #0
	add r1, r5, #0
	add r0, #0x10
	add r1, #0x14
	mov r2, #3
	bl ov40_0222D66C
	add r0, r4, #0
	add r1, r5, #0
	add r0, #0x2c
	add r1, #0x14
	mov r2, #0x6f
	bl ov40_0222D66C
	ldr r0, [r4, #0x14]
	mov r1, #0
	bl sub_0200DC4C
	ldr r0, [r4, #0x30]
	mov r1, #1
	bl sub_0200DC4C
	add r0, r5, #0
	mov r1, #1
	bl ov40_022420B4
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_0223F958:
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223F978
_0223F972:
	mov r1, #0xe
	bl ov40_0222BF80
_0223F978:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223F97C: .word 0x00000608
_0223F980: .word 0x0000060C
	thumb_func_end ov40_0223F880

	thumb_func_start ov40_0223F984
ov40_0223F984: ; 0x0223F984
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r5, [r4, r0]
	bl sub_020307F8
	mov r1, #4
	mov r2, #0
	bl sub_0203088C
	add r3, r0, #0
	add r2, r1, #0
	add r0, r4, #0
	add r1, r3, #0
	bl ov40_02230D94
	cmp r0, #0
	bne _0223F9AE
	b _0223FC7A
_0223F9AE:
	ldr r0, [r4, #8]
	cmp r0, #5
	bls _0223F9B6
	b _0223FC4C
_0223F9B6:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223F9C2: ; jump table
	.short _0223F9CE - _0223F9C2 - 2 ; case 0
	.short _0223FA1C - _0223F9C2 - 2 ; case 1
	.short _0223FA82 - _0223F9C2 - 2 ; case 2
	.short _0223FA92 - _0223F9C2 - 2 ; case 3
	.short _0223FAD0 - _0223F9C2 - 2 ; case 4
	.short _0223FBE2 - _0223F9C2 - 2 ; case 5
_0223F9CE:
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	cmp r1, #0
	bne _0223F9EC
	sub r0, #0xc0
	add r0, r5, r0
	add r1, r4, #0
	bl ov40_0223064C
	b _0223F9F6
_0223F9EC:
	add r5, #0x80
	add r0, r5, #0
	add r1, r4, #0
	bl ov40_0222E7B8
_0223F9F6:
	add r0, r4, #0
	bl ov40_02241A34
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223FC8C
_0223FA1C:
	add r0, r5, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223FA68
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r4, #0
	bl ov40_022421FC
	add r0, r4, #0
	bl ov40_02241054
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, [r4, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223FA68:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223FC8C
_0223FA82:
	ldr r1, _0223FC94 ; =0x00000115
	add r0, r4, #0
	bl ov40_0222DED0
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223FC8C
_0223FA92:
	bl System_GetTouchNew
	cmp r0, #0
	bne _0223FA9C
	b _0223FC8C
_0223FA9C:
	add r0, r4, #0
	bl ov40_02241114
	add r0, r4, #0
	bl ov40_0222DFB0
	ldr r0, [r4, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223FC8C
_0223FAD0:
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r4, #0
	bl ov40_02242110
	ldr r0, _0223FC98 ; =0x0000086C
	ldr r0, [r4, r0]
	cmp r0, #0xd2
	bne _0223FB12
	add r0, r5, #0
	add r1, r4, #0
	add r0, #0x10
	add r1, #0x14
	mov r2, #3
	bl ov40_0222D66C
	add r0, r5, #0
	add r1, r4, #0
	add r0, #0x2c
	add r1, #0x14
	mov r2, #0x5e
	bl ov40_0222D66C
	ldr r0, [r5, #0x14]
	mov r1, #0
	bl sub_0200DC4C
	ldr r0, [r5, #0x30]
	mov r1, #3
	bl sub_0200DC4C
_0223FB12:
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	add r0, r4, #0
	bl ov40_02241AB0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #0x3e
	mov r3, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #0x3e
	mov r3, #7
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	cmp r1, #0
	bne _0223FB8E
	sub r0, #0xc0
	add r0, r5, r0
	add r1, r4, #0
	bl ov40_02230638
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl ov40_022306A0
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov40_02230410
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #3
	bl ov40_022307DC
	b _0223FBBA
_0223FB8E:
	add r0, r5, #0
	add r0, #0x80
	add r1, r4, #0
	bl ov40_0222E79C
	add r5, #0x80
	add r0, r5, #0
	mov r1, #0
	bl ov40_0222E7DC
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #0x50
	mov r3, #3
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
_0223FBBA:
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #6
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223FC8C
_0223FBE2:
	add r0, r5, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	mov r2, #0
	add r0, r5, #0
	add r1, r5, #4
	add r3, r2, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223FC32
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	cmp r1, #0
	bne _0223FC12
	sub r0, #0xc0
	add r0, r5, r0
	mov r1, #1
	bl ov40_022306A0
	b _0223FC1C
_0223FC12:
	add r0, r5, #0
	add r0, #0x80
	mov r1, #1
	bl ov40_0222E7DC
_0223FC1C:
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223FC32:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223FC8C
_0223FC4C:
	ldr r1, _0223FC9C ; =0x00004138
	mov r0, #0
	ldr r1, [r4, r1]
	cmp r1, #0
	ble _0223FC70
	mov r1, #0x9a
	lsl r1, r1, #6
	add r5, r4, r1
	ldr r2, _0223FC9C ; =0x00004138
	add r6, r4, #0
	sub r1, #0x78
_0223FC62:
	str r5, [r6, r1]
	ldr r3, [r4, r2]
	add r0, r0, #1
	add r5, #0xe4
	add r6, r6, #4
	cmp r0, r3
	blt _0223FC62
_0223FC70:
	add r0, r4, #0
	mov r1, #0x12
	bl ov40_0222BF80
	b _0223FC8C
_0223FC7A:
	add r0, r4, #0
	bl ov40_02242378
	cmp r0, #0
	beq _0223FC8C
	add r0, r4, #0
	mov r1, #0x17
	bl ov40_0222BF80
_0223FC8C:
	mov r0, #0
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0223FC94: .word 0x00000115
_0223FC98: .word 0x0000086C
_0223FC9C: .word 0x00004138
	thumb_func_end ov40_0223F984

	thumb_func_start ov40_0223FCA0
ov40_0223FCA0: ; 0x0223FCA0
	push {r3, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r1, [r0, r1]
	ldr r0, _0223FCB4 ; =0x0000060C
	ldr r0, [r1, r0]
	bl sub_02026CC4
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_0223FCB4: .word 0x0000060C
	thumb_func_end ov40_0223FCA0

	thumb_func_start ov40_0223FCB8
ov40_0223FCB8: ; 0x0223FCB8
	push {r4, r5, r6, lr}
	add r4, r0, #0
	bl ov40_02242AEC
	cmp r0, #0
	beq _0223FCF0
	ldr r1, _0223FCF4 ; =0x00004138
	mov r0, #0
	ldr r1, [r4, r1]
	cmp r1, #0
	ble _0223FCE8
	mov r1, #0x9a
	lsl r1, r1, #6
	add r5, r4, r1
	ldr r2, _0223FCF4 ; =0x00004138
	add r6, r4, #0
	sub r1, #0x78
_0223FCDA:
	str r5, [r6, r1]
	ldr r3, [r4, r2]
	add r0, r0, #1
	add r5, #0xe4
	add r6, r6, #4
	cmp r0, r3
	blt _0223FCDA
_0223FCE8:
	add r0, r4, #0
	mov r1, #0x12
	bl ov40_0222BF80
_0223FCF0:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0223FCF4: .word 0x00004138
	thumb_func_end ov40_0223FCB8

	thumb_func_start ov40_0223FCF8
ov40_0223FCF8: ; 0x0223FCF8
	push {r4, r5, r6, lr}
	add r4, r0, #0
	bl ov40_022428D4
	cmp r0, #0
	beq _0223FD30
	ldr r1, _0223FD34 ; =0x00004138
	mov r0, #0
	ldr r1, [r4, r1]
	cmp r1, #0
	ble _0223FD28
	mov r1, #0x9a
	lsl r1, r1, #6
	add r5, r4, r1
	ldr r2, _0223FD34 ; =0x00004138
	add r6, r4, #0
	sub r1, #0x78
_0223FD1A:
	str r5, [r6, r1]
	ldr r3, [r4, r2]
	add r0, r0, #1
	add r5, #0xe4
	add r6, r6, #4
	cmp r0, r3
	blt _0223FD1A
_0223FD28:
	add r0, r4, #0
	mov r1, #0x12
	bl ov40_0222BF80
_0223FD30:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0223FD34: .word 0x00004138
	thumb_func_end ov40_0223FCF8

	thumb_func_start ov40_0223FD38
ov40_0223FD38: ; 0x0223FD38
	push {r4, lr}
	add r4, r0, #0
	bl ov40_02242490
	cmp r0, #0
	beq _0223FD4C
	add r0, r4, #0
	mov r1, #0x1a
	bl ov40_0222BF80
_0223FD4C:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov40_0223FD38

	thumb_func_start ov40_0223FD50
ov40_0223FD50: ; 0x0223FD50
	push {r3, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r1, [r0, r1]
	mov r0, #0x61
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	bl sub_02026CC4
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov40_0223FD50

	thumb_func_start ov40_0223FD68
ov40_0223FD68: ; 0x0223FD68
	push {r4, lr}
	add r4, r0, #0
	bl ov40_0224253C
	cmp r0, #0
	beq _0223FD7C
	add r0, r4, #0
	mov r1, #0x17
	bl ov40_0222BF80
_0223FD7C:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov40_0223FD68

	thumb_func_start ov40_0223FD80
ov40_0223FD80: ; 0x0223FD80
	push {r3, lr}
	bl ov40_022425E8
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov40_0223FD80

	thumb_func_start ov40_0223FD8C
ov40_0223FD8C: ; 0x0223FD8C
	push {r3, r4, r5, lr}
	sub sp, #8
	mov r1, #0x86
	add r4, r0, #0
	lsl r1, r1, #4
	ldr r5, [r4, r1]
	bl ov40_0223D5CC
	cmp r0, #0
	bne _0223FDA6
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, pc}
_0223FDA6:
	ldr r0, [r4, #8]
	cmp r0, #4
	bls _0223FDAE
	b _0223FF34
_0223FDAE:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223FDBA: ; jump table
	.short _0223FDC4 - _0223FDBA - 2 ; case 0
	.short _0223FDFA - _0223FDBA - 2 ; case 1
	.short _0223FE34 - _0223FDBA - 2 ; case 2
	.short _0223FE7A - _0223FDBA - 2 ; case 3
	.short _0223FEA6 - _0223FDBA - 2 ; case 4
_0223FDC4:
	ldr r0, [r4, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	cmp r1, #0
	bne _0223FDEA
	sub r0, #0xc0
	add r0, r5, r0
	mov r1, #0
	bl ov40_022306A0
	b _0223FDF4
_0223FDEA:
	add r0, r5, #0
	add r0, #0x80
	mov r1, #0
	bl ov40_0222E7DC
_0223FDF4:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223FDFA:
	add r0, r5, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _0223FE1A
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223FE1A:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0223FF68
_0223FE34:
	add r0, r4, #0
	mov r1, #0x75
	bl ov40_0222DED0
	mov r1, #0x6f
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	add r0, r4, #0
	mov r2, #0x80
	mov r3, #0x60
	bl ov40_0223077C
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	mov r1, #0x18
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl sub_02087A08
	ldr r0, _0223FF70 ; =0x000004B8
	mov r1, #0
	str r1, [r5, r0]
	add r0, #0xc5
	bl PlaySE
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223FF68
_0223FE7A:
	add r0, r4, #0
	bl ov40_0223D540
	ldr r1, _0223FF74 ; =0x000004D4
	ldr r1, [r4, r1]
	lsl r1, r1, #2
	add r2, r4, r1
	ldr r1, _0223FF78 ; =0x00002608
	ldr r2, [r2, r1]
	add r1, r2, #0
	add r1, #0xd8
	add r2, #0xdc
	ldr r1, [r1]
	ldr r2, [r2]
	bl ov39_02227720
	cmp r0, #1
	bne _0223FF68
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223FF68
_0223FEA6:
	add r0, r4, #0
	bl ov40_0223D540
	add r1, sp, #4
	bl ov39_02227D44
	cmp r0, #1
	ldr r0, _0223FF7C ; =0x0000057D
	bne _0223FEE0
	mov r1, #0
	bl StopSE
	add r0, r4, #0
	bl ov40_0222DFB0
	ldr r3, [sp, #4]
	add r0, r4, #0
	ldr r2, [r3, #0xc]
	ldr r3, [r3, #4]
	mov r1, #8
	bl ov40_02230CDC
	ldr r0, [r4, #8]
	mov r1, #0
	add r0, r0, #1
	str r0, [r4, #8]
	ldr r0, _0223FF70 ; =0x000004B8
	str r1, [r5, r0]
	b _0223FF18
_0223FEE0:
	mov r1, #0
	bl StopSE
	mov r0, #0xff
	str r0, [r4, #8]
	ldr r0, _0223FF70 ; =0x000004B8
	mov r1, #1
	str r1, [r5, r0]
	ldr r1, _0223FF80 ; =0x0000413C
	add r2, r4, r1
	add r1, r0, #0
	add r1, #0x1c
	ldr r1, [r4, r1]
	add r2, r2, r1
	ldr r1, _0223FF84 ; =0x00000878
	str r2, [r4, r1]
	add r2, r1, #0
	add r2, #0x3c
	ldr r3, [r4, r2]
	add r2, r0, #4
	str r3, [r5, r2]
	add r0, r0, #4
	add r1, #0x40
	ldr r0, [r5, r0]
	ldr r2, _0223FF88 ; =0x00001D4C
	add r1, r4, r1
	bl MI_CpuCopy8
_0223FF18:
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	mov r1, #0
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl sub_02087A08
	b _0223FF68
_0223FF34:
	ldr r0, _0223FF70 ; =0x000004B8
	ldr r1, [r5, r0]
	cmp r1, #0
	beq _0223FF5A
	add r0, #0xbf
	bl PlaySE
	add r0, r4, #0
	bl ov40_0222DFB0
	ldr r1, [r5, #0xc]
	add r0, r4, #0
	bl ov40_0222BF80
	add r0, r4, #0
	mov r1, #1
	bl ov40_0222FC40
	b _0223FF68
_0223FF5A:
	add r0, r4, #0
	bl ov40_0222DFB0
	add r0, r4, #0
	mov r1, #0x1f
	bl ov40_0222BF80
_0223FF68:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_0223FF70: .word 0x000004B8
_0223FF74: .word 0x000004D4
_0223FF78: .word 0x00002608
_0223FF7C: .word 0x0000057D
_0223FF80: .word 0x0000413C
_0223FF84: .word 0x00000878
_0223FF88: .word 0x00001D4C
	thumb_func_end ov40_0223FD8C

	thumb_func_start ov40_0223FF8C
ov40_0223FF8C: ; 0x0223FF8C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	mov r1, #0x86
	add r4, r0, #0
	lsl r1, r1, #4
	ldr r5, [r4, r1]
	ldr r1, [r4, #8]
	cmp r1, #5
	bls _0223FFA0
	b _022401E4
_0223FFA0:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223FFAC: ; jump table
	.short _0223FFB8 - _0223FFAC - 2 ; case 0
	.short _022400AE - _0223FFAC - 2 ; case 1
	.short _022400F8 - _0223FFAC - 2 ; case 2
	.short _0224015A - _0223FFAC - 2 ; case 3
	.short _022401B6 - _0223FFAC - 2 ; case 4
	.short _022401D4 - _0223FFAC - 2 ; case 5
_0223FFB8:
	bl ov40_02230738
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #0
	bl ov40_0222D9E8
	ldr r0, _02240200 ; =0x00004138
	mov r2, #0
	ldr r0, [r4, r0]
	cmp r0, #0
	ble _0223FFEC
	mov r0, #0x9a
	lsl r0, r0, #6
	add r7, r0, #0
	add r3, r4, r0
	ldr r0, _02240200 ; =0x00004138
	add r6, r4, #0
	sub r7, #0x78
_0223FFDE:
	str r3, [r6, r7]
	ldr r1, [r4, r0]
	add r2, r2, #1
	add r3, #0xe4
	add r6, r6, #4
	cmp r2, r1
	blt _0223FFDE
_0223FFEC:
	ldr r0, _02240204 ; =0x000004D4
	mov r3, #3
	ldr r0, [r4, r0]
	add r1, r4, r0
	ldr r0, _02240208 ; =0x0000413C
	ldrb r1, [r1, r0]
	ldr r0, _0224020C ; =0x0000079C
	strb r1, [r5, r0]
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #0x3e
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #0x3e
	mov r3, #7
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	add r0, r4, #0
	mov r1, #6
	mov r2, #7
	bl ov40_022307DC
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineBToggleLayers
	add r0, r4, #0
	bl ov40_02242110
	add r0, r4, #0
	mov r1, #0
	bl ov40_022420B4
	add r0, r5, #0
	add r1, r4, #0
	add r0, #0x10
	add r1, #0x14
	mov r2, #3
	bl ov40_0222D66C
	add r0, r5, #0
	add r1, r4, #0
	add r0, #0x2c
	add r1, #0x14
	mov r2, #0x5e
	bl ov40_0222D66C
	ldr r0, [r5, #0x14]
	mov r1, #0
	bl sub_0200DC4C
	ldr r0, [r5, #0x30]
	mov r1, #3
	bl sub_0200DC4C
	mov r1, #0x13
	ldr r0, _02240210 ; =0x0000FFFF
	lsl r1, r1, #6
	strh r0, [r5, r1]
	mov r2, #0xff
	add r0, r1, #2
	strb r2, [r5, r0]
	add r0, r1, #3
	strb r2, [r5, r0]
	add r0, r1, #4
	strb r2, [r5, r0]
	add r0, r1, #0
	add r2, #0xf5
	add r0, #0x54
	str r2, [r5, r0]
	add r0, r1, #0
	sub r0, #0x1c
	ldrsh r0, [r4, r0]
	add r1, #0x50
	str r0, [r5, r1]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022401FA
_022400AE:
	bl ov40_022408AC
	mov r0, #0x6d
	str r0, [sp]
	ldr r0, _02240214 ; =ov40_022456B4
	ldr r2, _02240218 ; =ov40_02241E40
	mov r1, #4
	add r3, r4, #0
	bl sub_02026C44
	ldr r1, _0224021C ; =0x00000608
	ldr r2, _02240220 ; =ov40_02241ED4
	str r0, [r5, r1]
	mov r0, #0x6d
	str r0, [sp]
	ldr r0, _02240224 ; =ov40_02245674
	mov r1, #4
	add r3, r4, #0
	bl sub_02026C44
	ldr r1, _02240228 ; =0x0000060C
	ldr r2, _0224022C ; =ov40_02241F3C
	str r0, [r5, r1]
	mov r0, #0x6d
	str r0, [sp]
	ldr r0, _02240230 ; =ov40_02245654
	mov r1, #2
	add r3, r4, #0
	bl sub_02026C44
	mov r1, #0x61
	lsl r1, r1, #4
	str r0, [r5, r1]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022401FA
_022400F8:
	mov r1, #1
	bl ov40_02230964
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	add r1, r4, #0
	bl ov40_02230638
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov40_02230410
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #3
	bl ov40_022307DC
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl ov40_022306A0
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022401FA
_0224015A:
	add r0, r5, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	mov r2, #0
	add r0, r5, #0
	add r1, r5, #4
	add r3, r2, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _0224019C
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	bl ov40_022306A0
	add r0, r4, #0
	bl ov40_02241AB0
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0224019C:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _022401FA
_022401B6:
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x6d
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022401FA
_022401D4:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _022401FA
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022401FA
_022401E4:
	ldr r0, _02240234 ; =0x000006D8
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	add r0, r4, #0
	bl ov40_0222C4B8
	add r0, r4, #0
	mov r1, #0x12
	bl ov40_0222BF80
_022401FA:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02240200: .word 0x00004138
_02240204: .word 0x000004D4
_02240208: .word 0x0000413C
_0224020C: .word 0x0000079C
_02240210: .word 0x0000FFFF
_02240214: .word ov40_022456B4
_02240218: .word ov40_02241E40
_0224021C: .word 0x00000608
_02240220: .word ov40_02241ED4
_02240224: .word ov40_02245674
_02240228: .word 0x0000060C
_0224022C: .word ov40_02241F3C
_02240230: .word ov40_02245654
_02240234: .word 0x000006D8
	thumb_func_end ov40_0223FF8C

	thumb_func_start ov40_02240238
ov40_02240238: ; 0x02240238
	push {r3, r4, r5, lr}
	mov r1, #0x7a
	add r5, r0, #0
	mov r0, #0x6d
	lsl r1, r1, #4
	bl AllocFromHeap
	mov r2, #0x7a
	mov r1, #0
	lsl r2, r2, #4
	add r4, r0, #0
	bl memset
	mov r0, #0x86
	lsl r0, r0, #4
	str r4, [r5, r0]
	ldr r0, [r5, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	add r1, r4, #4
	mov r2, #0
	bl ov40_0222D9E8
	add r0, r5, #0
	mov r1, #1
	bl ov40_0222BF80
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_02240238

	thumb_func_start ov40_02240290
ov40_02240290: ; 0x02240290
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r2, [r5, #8]
	ldr r4, [r5, r1]
	cmp r2, #0
	beq _022402A6
	cmp r2, #1
	beq _02240304
	b _02240360
_022402A6:
	add r0, r4, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	cmp r0, #0
	beq _022402BA
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_022402BA:
	ldr r0, [r5, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r5, #0x58]
	mov r1, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #2
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02240414
_02240304:
	mov r1, #1
	bl ov40_02230964
	add r0, r5, #0
	bl ov40_0222D874
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	mov r0, #0
	add r1, r0, #0
	bl SetBgPriority
	mov r0, #1
	mov r1, #3
	bl SetBgPriority
	mov r0, #2
	mov r1, #0
	bl SetBgPriority
	mov r0, #3
	mov r1, #2
	bl SetBgPriority
	mov r0, #4
	mov r1, #0
	bl SetBgPriority
	mov r0, #5
	mov r1, #3
	bl SetBgPriority
	mov r0, #6
	mov r1, #1
	bl SetBgPriority
	mov r0, #7
	mov r1, #2
	bl SetBgPriority
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02240414
_02240360:
	add r1, #0xc
	ldr r1, [r5, r1]
	cmp r1, #0xc8
	beq _02240372
	cmp r1, #0xd2
	beq _022403A2
	cmp r1, #0xdc
	beq _022403D2
	b _022403FA
_02240372:
	mov r1, #0
	bl ov40_0222FB90
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_020879E0
	add r0, r5, #0
	bl ov40_0222C4DC
	cmp r0, #1
	bne _02240398
	add r0, r5, #0
	mov r1, #6
	bl ov40_0222BF80
	b _02240414
_02240398:
	add r0, r5, #0
	mov r1, #2
	bl ov40_0222BF80
	b _02240414
_022403A2:
	mov r1, #0
	bl ov40_0222FB90
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_020879E0
	add r0, r5, #0
	bl ov40_0222C4DC
	cmp r0, #1
	bne _022403C8
	add r0, r5, #0
	mov r1, #0x1e
	bl ov40_0222BF80
	b _02240414
_022403C8:
	add r0, r5, #0
	mov r1, #2
	bl ov40_0222BF80
	b _02240414
_022403D2:
	bl ov40_0222C4DC
	cmp r0, #1
	bne _022403E4
	add r0, r5, #0
	mov r1, #0x13
	bl ov40_0222BF80
	b _022403EC
_022403E4:
	add r0, r5, #0
	mov r1, #2
	bl ov40_0222BF80
_022403EC:
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_020879E0
	b _02240414
_022403FA:
	mov r1, #0
	bl ov40_0222FB90
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_020879E0
	add r0, r5, #0
	mov r1, #2
	bl ov40_0222BF80
_02240414:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov40_02240290

	thumb_func_start ov40_02240418
ov40_02240418: ; 0x02240418
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	mov r2, #0x75
	ldr r6, [r5, r1]
	lsl r2, r2, #2
	add r4, r6, r2
	ldr r2, [r5, #8]
	cmp r2, #0
	beq _0224043A
	cmp r2, #1
	beq _022404AA
	cmp r2, #2
	beq _022404CE
	b _02240510
_0224043A:
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #5
	sub r1, #0x30
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r0, [r5, r1]
	bl Sav2_PlayerData_GetOptionsAddr
	add r3, r0, #0
	mov r0, #0x6d
	mov r1, #0xc
	add r2, sp, #0xc
	bl ov40_02242FAC
	ldr r1, _0224051C ; =0x000004AC
	mov r2, #0x22
	str r0, [r6, r1]
	ldr r0, [r5, #0x14]
	lsl r2, r2, #4
	str r0, [r4, r2]
	ldr r3, [r5, #0x18]
	add r0, r2, #4
	str r3, [r4, r0]
	add r0, r2, #0
	ldr r3, [r5, #0x1c]
	add r0, #8
	str r3, [r4, r0]
	add r0, r2, #0
	ldr r3, [r5, #0x24]
	add r0, #0xc
	str r3, [r4, r0]
	add r0, r2, #0
	ldr r3, [r5, #0x28]
	add r0, #0x10
	str r3, [r4, r0]
	add r0, r2, #0
	add r0, #0x88
	ldr r3, [r6, r1]
	add r7, r4, r0
	ldmia r3!, {r0, r1}
	stmia r7!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r7!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r7!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r7!, {r0, r1}
	add r2, #0xb4
	str r5, [r4, r2]
	add r0, r5, #0
	bl ov40_02241FD0
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_022404AA:
	mov r2, #8
	str r2, [sp]
	mov r3, #0x12
	str r3, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	add r0, r6, #0
	add r1, r6, #4
	bl ov40_0222D910
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02240516
_022404CE:
	add r0, r6, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	mov r2, #0
	add r0, r6, #0
	add r1, r6, #4
	add r3, r2, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _022404F6
	add r0, r5, #0
	mov r1, #0x70
	bl ov40_0222DD9C
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_022404F6:
	ldr r0, [r5, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r6, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02240516
_02240510:
	mov r1, #3
	bl ov40_0222BF80
_02240516:
	mov r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224051C: .word 0x000004AC
	thumb_func_end ov40_02240418

	thumb_func_start ov40_02240520
ov40_02240520: ; 0x02240520
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	mov r0, #0x75
	lsl r0, r0, #2
	add r0, r1, r0
	bl ov40_02243538
	cmp r0, #1
	bne _02240540
	add r0, r4, #0
	mov r1, #4
	bl ov40_0222BF80
_02240540:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov40_02240520

	thumb_func_start ov40_02240544
ov40_02240544: ; 0x02240544
	push {r4, r5, lr}
	sub sp, #0xc
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	mov r1, #0x75
	lsl r1, r1, #2
	ldr r2, [r5, #8]
	add r3, r4, r1
	cmp r2, #0
	beq _02240562
	cmp r2, #1
	beq _02240588
	b _022405D0
_02240562:
	bl ov40_0222DE40
	mov r2, #8
	str r2, [sp]
	mov r3, #0x12
	str r3, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r1, r4, #4
	bl ov40_0222D980
	ldr r0, _022405EC ; =0x000004AC
	ldr r0, [r4, r0]
	bl ov40_02242FF8
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_02240588:
	add r0, r4, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r4, #0
	add r1, r4, #4
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _022405B6
	mov r0, #8
	mov r1, #0
	bl GX_EngineAToggleLayers
	add r0, r5, #0
	bl ov40_02242084
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_022405B6:
	ldr r0, [r5, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _022405E6
_022405D0:
	add r1, #0xf4
	ldr r1, [r3, r1]
	cmp r1, #0
	beq _022405E0
	mov r1, #6
	bl ov40_0222BF80
	b _022405E6
_022405E0:
	mov r1, #5
	bl ov40_0222BF80
_022405E6:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_022405EC: .word 0x000004AC
	thumb_func_end ov40_02240544

	thumb_func_start ov40_022405F0
ov40_022405F0: ; 0x022405F0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	ldr r0, [r5, #8]
	cmp r0, #0
	bne _02240626
	add r4, #8
	add r0, r4, #0
	bl ov40_0222DAA8
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r5, #0
	bl ov40_0222D88C
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _022406C2
_02240626:
	add r0, r4, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	cmp r0, #0
	beq _02240692
	add r0, r5, #0
	bl ov40_0222DD08
	add r0, r4, #0
	add r0, #8
	bl ov40_0222DAA8
	ldr r0, [r5, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r5, #0x28]
	mov r2, #0xc
	mov r3, #0x10
	bl sub_02003EA4
	mov r1, #1
	ldr r3, [r5, #0x10]
	add r0, r5, #0
	add r2, r1, #0
	bl ov40_0222BF64
	add r0, r5, #0
	mov r1, #5
	bl ov40_0222BF80
	ldr r0, [r5, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	bl FreeToHeap
	b _022406C2
_02240692:
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r5, #0x58]
	mov r1, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #2
	lsr r3, r3, #0x18
	bl sub_02003EA4
_022406C2:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_022405F0

	thumb_func_start ov40_022406C8
ov40_022406C8: ; 0x022406C8
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	mov r1, #0x86
	add r4, r0, #0
	lsl r1, r1, #4
	ldr r5, [r4, r1]
	mov r1, #0x75
	lsl r1, r1, #2
	add r6, r5, r1
	ldr r1, [r4, #8]
	cmp r1, #4
	bls _022406E2
	b _0224081A
_022406E2:
	add r2, r1, r1
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_022406EE: ; jump table
	.short _022406F8 - _022406EE - 2 ; case 0
	.short _02240736 - _022406EE - 2 ; case 1
	.short _02240764 - _022406EE - 2 ; case 2
	.short _02240806 - _022406EE - 2 ; case 3
	.short _02240814 - _022406EE - 2 ; case 4
_022406F8:
	mov r1, #0x75
	bl ov40_0222DD9C
	ldr r1, _0224083C ; =0x000006F4
	add r0, r4, #0
	ldr r1, [r4, r1]
	mov r2, #0x80
	mov r3, #0x60
	bl ov40_0223077C
	ldr r0, _0224083C ; =0x000006F4
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_020879E0
	ldr r0, _0224083C ; =0x000006F4
	mov r1, #0x18
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl sub_02087A08
	ldr r0, _02240840 ; =0x000004B8
	mov r1, #0
	str r1, [r5, r0]
	add r0, #0xc5
	bl PlaySE
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02240834
_02240736:
	bl ov40_0223D5CC
	cmp r0, #0
	bne _02240744
	add sp, #4
	mov r0, #0
	pop {r3, r4, r5, r6, pc}
_02240744:
	add r0, r4, #0
	bl ov40_0223D540
	mov r2, #0xb3
	lsl r2, r2, #2
	ldr r1, [r6, r2]
	add r2, r2, #4
	ldr r2, [r6, r2]
	bl ov39_02227720
	cmp r0, #1
	bne _02240834
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02240834
_02240764:
	bl ov40_0223D5CC
	cmp r0, #0
	bne _02240772
	add sp, #4
	mov r0, #0
	pop {r3, r4, r5, r6, pc}
_02240772:
	add r0, r4, #0
	bl ov40_0222DE40
	add r0, r4, #0
	bl ov40_0223D540
	add r1, sp, #0
	bl ov39_02227D44
	cmp r0, #1
	ldr r0, _02240844 ; =0x0000057D
	bne _022407BA
	mov r1, #0
	bl StopSE
	ldr r0, _02240848 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	ldr r3, [sp]
	add r0, r4, #0
	ldr r2, [r3, #0xc]
	ldr r3, [r3, #4]
	mov r1, #8
	bl ov40_02230CDC
	add r0, r4, #0
	mov r1, #0
	bl ov40_0222FB90
	ldr r0, [r4, #8]
	mov r1, #0
	add r0, r0, #1
	str r0, [r4, #8]
	ldr r0, _02240840 ; =0x000004B8
	str r1, [r5, r0]
	b _022407EE
_022407BA:
	mov r1, #0
	bl StopSE
	mov r0, #0xff
	str r0, [r4, #8]
	ldr r0, _02240840 ; =0x000004B8
	mov r1, #1
	str r1, [r5, r0]
	add r0, #0xbf
	bl PlaySE
	ldr r0, _0224084C ; =0x00002604
	ldr r1, _02240850 ; =0x00000878
	add r0, r4, r0
	str r0, [r4, r1]
	add r0, r1, #0
	add r0, #0x3c
	ldr r2, [r4, r0]
	ldr r0, _02240854 ; =0x000004BC
	add r1, #0x40
	str r2, [r5, r0]
	ldr r0, [r5, r0]
	ldr r2, _02240858 ; =0x00001D4C
	add r1, r4, r1
	bl MI_CpuCopy8
_022407EE:
	ldr r0, _0224083C ; =0x000006F4
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_020879E0
	ldr r0, _0224083C ; =0x000006F4
	mov r1, #0
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl sub_02087A08
	b _02240834
_02240806:
	mov r1, #1
	bl ov40_0222FB90
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02240834
_02240814:
	add r0, r1, #1
	str r0, [r4, #8]
	b _02240834
_0224081A:
	ldr r0, _02240840 ; =0x000004B8
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0224082C
	add r0, r4, #0
	mov r1, #7
	bl ov40_0222BF80
	b _02240834
_0224082C:
	add r0, r4, #0
	mov r1, #5
	bl ov40_0222BF80
_02240834:
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_0224083C: .word 0x000006F4
_02240840: .word 0x000004B8
_02240844: .word 0x0000057D
_02240848: .word 0x04000050
_0224084C: .word 0x00002604
_02240850: .word 0x00000878
_02240854: .word 0x000004BC
_02240858: .word 0x00001D4C
	thumb_func_end ov40_022406C8

	thumb_func_start ov40_0224085C
ov40_0224085C: ; 0x0224085C
	push {r4, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r4, [r0, r1]
	mov r0, #0x6d
	bl sub_020314A4
	add r1, r4, #0
	add r1, #0x80
	str r0, [r1]
	ldr r0, _022408A8 ; =0x000004BC
	add r1, r4, #0
	add r1, #0x80
	ldr r0, [r4, r0]
	ldr r1, [r1]
	bl ov39_022271C0
	add r0, r4, #0
	add r0, #0x80
	ldr r1, [r0]
	mov r0, #0x43
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #0x6d
	bl sub_02030920
	mov r1, #0x11
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r0, _022408A8 ; =0x000004BC
	ldr r1, [r4, r1]
	ldr r0, [r4, r0]
	mov r2, #0x64
	add r0, #0x80
	bl MI_CpuCopy8
	pop {r4, pc}
	nop
_022408A8: .word 0x000004BC
	thumb_func_end ov40_0224085C

	thumb_func_start ov40_022408AC
ov40_022408AC: ; 0x022408AC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	mov r0, #0x6d
	bl sub_020314A4
	add r1, r4, #0
	add r1, #0x80
	str r0, [r1]
	ldr r0, _02240908 ; =0x000004D4
	ldr r0, [r5, r0]
	lsl r0, r0, #2
	add r1, r5, r0
	ldr r0, _0224090C ; =0x00002608
	ldr r0, [r1, r0]
	add r1, r4, #0
	add r1, #0x80
	ldr r1, [r1]
	bl ov39_022271C0
	add r0, r4, #0
	add r0, #0x80
	ldr r1, [r0]
	mov r0, #0x43
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #0x6d
	bl sub_02030920
	mov r1, #0x11
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r0, _02240908 ; =0x000004D4
	ldr r1, [r4, r1]
	ldr r0, [r5, r0]
	lsl r0, r0, #2
	add r2, r5, r0
	ldr r0, _0224090C ; =0x00002608
	ldr r0, [r2, r0]
	mov r2, #0x64
	add r0, #0x80
	bl MI_CpuCopy8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02240908: .word 0x000004D4
_0224090C: .word 0x00002608
	thumb_func_end ov40_022408AC

	thumb_func_start ov40_02240910
ov40_02240910: ; 0x02240910
	push {r4, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r4, [r0, r1]
	mov r0, #0x11
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02030938
	add r4, #0x80
	ldr r0, [r4]
	bl sub_020314BC
	pop {r4, pc}
	thumb_func_end ov40_02240910

	thumb_func_start ov40_0224092C
ov40_0224092C: ; 0x0224092C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	mov r1, #0x86
	add r4, r0, #0
	lsl r1, r1, #4
	ldr r5, [r4, r1]
	ldr r1, [r4, #8]
	cmp r1, #3
	bls _02240940
	b _02240B10
_02240940:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0224094C: ; jump table
	.short _02240954 - _0224094C - 2 ; case 0
	.short _02240962 - _0224094C - 2 ; case 1
	.short _02240A4C - _0224094C - 2 ; case 2
	.short _02240AB4 - _0224094C - 2 ; case 3
_02240954:
	mov r1, #0
	bl ov40_0222FB90
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02240B18
_02240962:
	bl ov40_0222FBB4
	cmp r0, #0
	bne _0224096C
	b _02240B18
_0224096C:
	mov r2, #8
	str r2, [sp]
	mov r3, #0x12
	str r3, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r1, r5, #4
	bl ov40_0222D980
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #0x3e
	mov r3, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #0x3e
	mov r3, #7
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	add r0, r4, #0
	mov r1, #6
	mov r2, #7
	bl ov40_022307DC
	mov r0, #0
	mov r1, #1
	bl SetBgPriority
	mov r0, #1
	mov r1, #3
	bl SetBgPriority
	mov r0, #2
	mov r1, #0
	bl SetBgPriority
	mov r0, #3
	mov r1, #1
	bl SetBgPriority
	mov r0, #4
	mov r1, #1
	bl SetBgPriority
	mov r0, #5
	mov r1, #3
	bl SetBgPriority
	mov r0, #6
	mov r1, #0
	bl SetBgPriority
	mov r0, #7
	mov r1, #2
	bl SetBgPriority
	add r0, r4, #0
	bl ov40_0224085C
	add r0, r4, #0
	bl ov40_02242110
	mov r0, #0x6d
	str r0, [sp]
	ldr r0, _02240B20 ; =ov40_022456B4
	ldr r2, _02240B24 ; =ov40_02241C10
	mov r1, #4
	add r3, r4, #0
	bl sub_02026C44
	ldr r1, _02240B28 ; =0x00000608
	ldr r2, _02240B2C ; =ov40_02241C70
	str r0, [r5, r1]
	mov r0, #0x6d
	str r0, [sp]
	ldr r0, _02240B30 ; =ov40_02245674
	mov r1, #4
	add r3, r4, #0
	bl sub_02026C44
	ldr r1, _02240B34 ; =0x0000060C
	ldr r2, _02240B38 ; =ov40_02241CD8
	str r0, [r5, r1]
	mov r0, #0x6d
	str r0, [sp]
	ldr r0, _02240B3C ; =ov40_02245654
	mov r1, #2
	add r3, r4, #0
	bl sub_02026C44
	mov r1, #0x61
	lsl r1, r1, #4
	str r0, [r5, r1]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02240B18
_02240A4C:
	mov r1, #1
	bl ov40_02230964
	mov r0, #0x73
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
	sub r0, #0xc0
	add r0, r5, r0
	add r1, r4, #0
	bl ov40_02230638
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov40_02230410
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #3
	bl ov40_022307DC
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl ov40_022306A0
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02240B18
_02240AB4:
	add r0, r5, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	mov r2, #0
	add r0, r5, #0
	add r1, r5, #4
	add r3, r2, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _02240AF6
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	bl ov40_022306A0
	add r0, r4, #0
	bl ov40_02241AB0
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_02240AF6:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02240B18
_02240B10:
	add r0, r4, #0
	mov r1, #8
	bl ov40_0222BF80
_02240B18:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_02240B20: .word ov40_022456B4
_02240B24: .word ov40_02241C10
_02240B28: .word 0x00000608
_02240B2C: .word ov40_02241C70
_02240B30: .word ov40_02245674
_02240B34: .word 0x0000060C
_02240B38: .word ov40_02241CD8
_02240B3C: .word ov40_02245654
	thumb_func_end ov40_0224092C

	thumb_func_start ov40_02240B40
ov40_02240B40: ; 0x02240B40
	push {r3, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r1, [r0, r1]
	ldr r0, _02240B54 ; =0x00000608
	ldr r0, [r1, r0]
	bl sub_02026CC4
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_02240B54: .word 0x00000608
	thumb_func_end ov40_02240B40

	thumb_func_start ov40_02240B58
ov40_02240B58: ; 0x02240B58
	push {r4, lr}
	add r4, r0, #0
	bl ov40_0224222C
	cmp r0, #0
	beq _02240B6C
	add r0, r4, #0
	mov r1, #8
	bl ov40_0222BF80
_02240B6C:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov40_02240B58

	thumb_func_start ov40_02240B70
ov40_02240B70: ; 0x02240B70
	push {r4, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r4, [r0, r1]
	bl ov40_02242CFC
	cmp r0, #0
	beq _02240B8A
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r4, pc}
_02240B8A:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov40_02240B70

	thumb_func_start ov40_02240B90
ov40_02240B90: ; 0x02240B90
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r4, r0, #0
	lsl r1, r1, #4
	ldr r5, [r4, r1]
	ldr r1, [r4, #8]
	cmp r1, #3
	bls _02240BA2
	b _02240D42
_02240BA2:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02240BAE: ; jump table
	.short _02240BB6 - _02240BAE - 2 ; case 0
	.short _02240C24 - _02240BAE - 2 ; case 1
	.short _02240C64 - _02240BAE - 2 ; case 2
	.short _02240C92 - _02240BAE - 2 ; case 3
_02240BB6:
	ldr r0, _02240D48 ; =0x00000608
	ldr r0, [r5, r0]
	bl sub_02026CAC
	ldr r0, _02240D4C ; =0x0000060C
	ldr r0, [r5, r0]
	bl sub_02026CAC
	mov r0, #0x61
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_02026CAC
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	add r0, r4, #0
	bl ov40_02240910
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	cmp r1, #0
	bne _02240C04
	sub r0, #0xc0
	add r0, r5, r0
	add r1, r4, #0
	bl ov40_0223064C
	b _02240C0E
_02240C04:
	add r5, #0x80
	add r0, r5, #0
	add r1, r4, #0
	bl ov40_0222E7B8
_02240C0E:
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	add r0, r4, #0
	bl ov40_02241A34
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02240D42
_02240C24:
	add r0, r5, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _02240C4A
	add r0, r4, #0
	bl ov40_022421FC
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_02240C4A:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02240D42
_02240C64:
	add r5, #8
	add r0, r5, #0
	bl ov40_0222DAA8
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r4, #0
	bl ov40_0222D88C
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	add r0, r4, #0
	mov r1, #1
	bl ov40_0222FB90
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02240D42
_02240C92:
	bl ov40_0222FBB4
	cmp r0, #0
	beq _02240D42
	add r0, r5, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	cmp r0, #0
	beq _02240D12
	add r0, r4, #0
	bl ov40_0222DD08
	add r0, r5, #0
	add r0, #8
	bl ov40_0222DAA8
	ldr r0, [r4, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r4, #0x28]
	mov r2, #0xc
	mov r3, #0x10
	bl sub_02003EA4
	mov r1, #1
	ldr r3, [r4, #0x10]
	add r0, r4, #0
	add r2, r1, #0
	bl ov40_0222BF64
	add r0, r4, #0
	mov r1, #5
	bl ov40_0222BF80
	add r0, r5, #0
	bl FreeToHeap
	ldr r0, [r4, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	bl sub_0202FC48
	cmp r0, #1
	bne _02240D42
	bl sub_0202FC24
	b _02240D42
_02240D12:
	ldr r0, [r4, #0x58]
	mov r1, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #2
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
_02240D42:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_02240D48: .word 0x00000608
_02240D4C: .word 0x0000060C
	thumb_func_end ov40_02240B90

	thumb_func_start ov40_02240D50
ov40_02240D50: ; 0x02240D50
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r1, #0
	ldr r1, _02240E20 ; =0x0000088C
	lsl r6, r2, #2
	add r4, r5, r1
	ldr r1, [r4, r6]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x48]
	cmp r1, #0
	bne _02240D70
	mov r1, #8
	bl NewString_ReadMsgData
	add r4, r0, #0
	b _02240DCE
_02240D70:
	mov r0, #0x6d
	bl ov40_0222DAB0
	add r7, r0, #0
	ldr r0, [r5, #0x48]
	mov r1, #7
	bl NewString_ReadMsgData
	str r0, [sp, #0x14]
	ldr r0, [r4, r6]
	mov r1, #0x6d
	bl sub_020315B8
	add r6, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl ov40_02230DCC
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	mov r1, #0
	str r0, [sp, #4]
	add r0, r7, #0
	add r2, r6, #0
	add r3, r1, #0
	bl BufferString
	ldr r2, [sp, #0x14]
	add r0, r7, #0
	add r1, r4, #0
	bl StringExpandPlaceholders
	ldr r0, [sp, #0x14]
	bl String_dtor
	add r0, r6, #0
	bl String_dtor
	add r0, r7, #0
	bl ScrStrBufs_delete
_02240DCE:
	add r0, sp, #0x18
	bl InitWindow
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r5, #0x24]
	add r1, sp, #0x18
	mov r2, #0x14
	mov r3, #2
	bl AddTextWindowTopLeftCorner
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02240E24 ; =0x000E0D00
	add r2, r4, #0
	str r0, [sp, #8]
	add r0, sp, #0x18
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x10]
	ldr r0, [r0, #8]
	ldr r1, [r1, #0xc]
	add r2, sp, #0x18
	mov r3, #0x6d
	bl sub_020139D0
	add r0, r4, #0
	bl String_dtor
	add r0, sp, #0x18
	bl RemoveWindow
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02240E20: .word 0x0000088C
_02240E24: .word 0x000E0D00
	thumb_func_end ov40_02240D50

	thumb_func_start ov40_02240E28
ov40_02240E28: ; 0x02240E28
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r4, r1, #0
	ldr r1, _02240F1C ; =0x000008A4
	add r5, r0, #0
	sub r1, #0x44
	ldr r6, [r5, r1]
	mov r1, #2
	bl ov40_0222C6C8
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	ldr r0, _02240F1C ; =0x000008A4
	add r0, r5, r0
	bl InitWindow
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1e
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	mov r0, #0x4b
	lsl r0, r0, #2
	ldr r1, _02240F1C ; =0x000008A4
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x24]
	add r1, r5, r1
	mov r2, #2
	mov r3, #1
	bl AddWindowParameterized
	cmp r4, #0x64
	bne _02240EDA
	add r6, #0x80
	ldr r0, [r6]
	str r0, [sp, #0x14]
	mov r0, #0x6d
	bl ov40_0222DAB0
	add r7, r0, #0
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	add r6, r0, #0
	ldr r0, [sp, #0x14]
	mov r1, #0x6d
	bl sub_020315B8
	str r0, [sp, #0x18]
	ldr r1, [sp, #0x18]
	add r0, r5, #0
	bl ov40_02230DCC
	ldr r0, [r5, #0x48]
	add r1, r4, #0
	bl NewString_ReadMsgData
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	mov r1, #0
	str r0, [sp, #4]
	ldr r2, [sp, #0x18]
	add r0, r7, #0
	add r3, r1, #0
	bl BufferString
	add r0, r7, #0
	add r1, r6, #0
	add r2, r4, #0
	bl StringExpandPlaceholders
	ldr r0, [sp, #0x18]
	bl String_dtor
	add r0, r4, #0
	bl String_dtor
	add r0, r7, #0
	bl ScrStrBufs_delete
	b _02240EE4
_02240EDA:
	ldr r0, [r5, #0x48]
	add r1, r4, #0
	bl NewString_ReadMsgData
	add r6, r0, #0
_02240EE4:
	ldr r0, _02240F1C ; =0x000008A4
	mov r1, #0xcc
	add r0, r5, r0
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02240F20 ; =0x000F0D0C
	add r2, r6, #0
	str r0, [sp, #8]
	ldr r0, _02240F1C ; =0x000008A4
	add r3, r1, #0
	add r0, r5, r0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r0, _02240F1C ; =0x000008A4
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	add r0, r6, #0
	bl String_dtor
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02240F1C: .word 0x000008A4
_02240F20: .word 0x000F0D0C
	thumb_func_end ov40_02240E28

	thumb_func_start ov40_02240F24
ov40_02240F24: ; 0x02240F24
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	ldr r0, _0224104C ; =0x000008A4
	add r4, r1, #0
	sub r0, #0x44
	ldr r0, [r5, r0]
	cmp r4, #0x64
	bne _02240F9C
	add r0, #0x80
	ldr r0, [r0]
	str r0, [sp, #0x14]
	mov r0, #0x6d
	bl ov40_0222DAB0
	add r7, r0, #0
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	add r6, r0, #0
	ldr r0, [sp, #0x14]
	mov r1, #0x6d
	bl sub_020315B8
	str r0, [sp, #0x18]
	ldr r1, [sp, #0x18]
	add r0, r5, #0
	bl ov40_02230DCC
	ldr r0, [r5, #0x48]
	add r1, r4, #0
	bl NewString_ReadMsgData
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	mov r1, #0
	str r0, [sp, #4]
	ldr r2, [sp, #0x18]
	add r0, r7, #0
	add r3, r1, #0
	bl BufferString
	add r0, r7, #0
	add r1, r6, #0
	add r2, r4, #0
	bl StringExpandPlaceholders
	ldr r0, [sp, #0x18]
	bl String_dtor
	add r0, r4, #0
	bl String_dtor
	add r0, r7, #0
	bl ScrStrBufs_delete
	b _02241014
_02240F9C:
	cmp r4, #0x66
	bne _0224100C
	lsl r0, r2, #2
	add r1, r5, r0
	ldr r0, _0224104C ; =0x000008A4
	sub r0, #0x18
	ldr r0, [r1, r0]
	str r0, [sp, #0x10]
	mov r0, #0x6d
	bl ov40_0222DAB0
	add r7, r0, #0
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	add r6, r0, #0
	ldr r0, [sp, #0x10]
	mov r1, #0x6d
	bl sub_020315B8
	str r0, [sp, #0x1c]
	ldr r1, [sp, #0x1c]
	add r0, r5, #0
	bl ov40_02230DCC
	ldr r0, [r5, #0x48]
	add r1, r4, #0
	bl NewString_ReadMsgData
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	mov r1, #0
	str r0, [sp, #4]
	ldr r2, [sp, #0x1c]
	add r0, r7, #0
	add r3, r1, #0
	bl BufferString
	add r0, r7, #0
	add r1, r6, #0
	add r2, r4, #0
	bl StringExpandPlaceholders
	ldr r0, [sp, #0x1c]
	bl String_dtor
	add r0, r4, #0
	bl String_dtor
	add r0, r7, #0
	bl ScrStrBufs_delete
	b _02241014
_0224100C:
	ldr r0, [r5, #0x48]
	bl NewString_ReadMsgData
	add r6, r0, #0
_02241014:
	ldr r0, _0224104C ; =0x000008A4
	mov r1, #0xcc
	add r0, r5, r0
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02241050 ; =0x000F0D0C
	add r2, r6, #0
	str r0, [sp, #8]
	ldr r0, _0224104C ; =0x000008A4
	add r3, r1, #0
	add r0, r5, r0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r0, _0224104C ; =0x000008A4
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	add r0, r6, #0
	bl String_dtor
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224104C: .word 0x000008A4
_02241050: .word 0x000F0D0C
	thumb_func_end ov40_02240F24

	thumb_func_start ov40_02241054
ov40_02241054: ; 0x02241054
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r3, _0224110C ; =ov40_02245684
	ldr r4, [r0, r1]
	str r0, [sp]
	add r2, sp, #0x20
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r3, _02241110 ; =ov40_02245694
	add r2, sp, #0x10
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [sp]
	mov r1, #2
	bl ov40_0222D78C
	add r0, sp, #0x20
	str r0, [sp, #8]
	mov r0, #0x69
	str r0, [sp, #4]
	ldr r0, [sp]
	add r5, r4, #0
	str r0, [sp, #0xc]
	add r0, #0x14
	mov r6, #0
	add r5, #0x10
	add r7, sp, #0x10
	str r0, [sp, #0xc]
_02241098:
	ldr r0, [sp]
	mov r1, #2
	bl ov40_0222D800
	str r0, [r4, #0x14]
	ldr r1, [sp, #0xc]
	add r0, r5, #0
	mov r2, #2
	bl ov40_0222D5AC
	ldr r2, [sp, #8]
	ldr r1, [sp, #0xc]
	ldr r2, [r2]
	add r0, r5, #0
	bl ov40_0222D66C
	cmp r6, #3
	beq _022410C6
	ldr r1, [sp]
	add r0, r5, #0
	add r2, r6, #1
	bl ov40_02240D50
_022410C6:
	ldr r2, [sp, #4]
	ldr r0, [r4, #0x14]
	lsl r2, r2, #0x10
	mov r1, #0x32
	asr r2, r2, #0x10
	bl sub_0200DDB8
	ldr r0, [r4, #0x14]
	ldr r1, [r7]
	bl sub_0200DC4C
	mov r1, #0x24
	add r2, r1, #0
	ldr r0, [r4, #0x18]
	sub r2, #0x2c
	bl sub_020136B4
	ldr r0, [r4, #0x18]
	mov r1, #1
	bl sub_020137C0
	ldr r0, [sp, #8]
	add r6, r6, #1
	add r0, r0, #4
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	add r4, #0x1c
	add r0, #0x24
	add r5, #0x1c
	add r7, r7, #4
	str r0, [sp, #4]
	cmp r6, #4
	blt _02241098
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224110C: .word ov40_02245684
_02241110: .word ov40_02245694
	thumb_func_end ov40_02241054

	thumb_func_start ov40_02241114
ov40_02241114: ; 0x02241114
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r5, [r7, r0]
	mov r6, #0
	add r4, r5, #0
	add r4, #0x10
_02241124:
	add r0, r4, #0
	bl ov40_0222D6D0
	ldr r0, [r5, #0x14]
	bl sub_0200D9DC
	add r6, r6, #1
	add r4, #0x1c
	add r5, #0x1c
	cmp r6, #4
	blt _02241124
	add r0, r7, #0
	bl ov40_0222D7DC
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov40_02241114

	thumb_func_start ov40_02241144
ov40_02241144: ; 0x02241144
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r5, [r4, r0]
	bl sub_020307F8
	mov r1, #4
	mov r2, #0
	bl sub_0203088C
	add r3, r0, #0
	add r2, r1, #0
	add r0, r4, #0
	add r1, r3, #0
	bl ov40_02230D94
	cmp r0, #0
	bne _0224116C
	b _022413CA
_0224116C:
	ldr r0, [r4, #8]
	cmp r0, #5
	bls _02241174
	b _02241316
_02241174:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02241180: ; jump table
	.short _0224118C - _02241180 - 2 ; case 0
	.short _022411DA - _02241180 - 2 ; case 1
	.short _02241240 - _02241180 - 2 ; case 2
	.short _02241250 - _02241180 - 2 ; case 3
	.short _02241288 - _02241180 - 2 ; case 4
	.short _022412C8 - _02241180 - 2 ; case 5
_0224118C:
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	cmp r1, #0
	bne _022411AA
	sub r0, #0xc0
	add r0, r5, r0
	add r1, r4, #0
	bl ov40_0223064C
	b _022411B4
_022411AA:
	add r5, #0x80
	add r0, r5, #0
	add r1, r4, #0
	bl ov40_0222E7B8
_022411B4:
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	add r0, r4, #0
	bl ov40_02241A34
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022413DC
_022411DA:
	add r0, r5, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _02241226
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r4, #0
	bl ov40_022421FC
	add r0, r4, #0
	bl ov40_02241054
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, [r4, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_02241226:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _022413DC
_02241240:
	ldr r1, _022413E0 ; =0x00000115
	add r0, r4, #0
	bl ov40_0222DED0
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022413DC
_02241250:
	bl System_GetTouchNew
	cmp r0, #0
	bne _0224125A
	b _022413DC
_0224125A:
	add r0, r4, #0
	bl ov40_0222DFB0
	ldr r0, [r4, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022413DC
_02241288:
	add r0, r5, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _022412AE
	add r0, r4, #0
	bl ov40_02241114
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_022412AE:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _022413DC
_022412C8:
	ldr r0, _022413E4 ; =0x00000608
	ldr r0, [r5, r0]
	bl sub_02026CAC
	ldr r0, _022413E8 ; =0x0000060C
	ldr r0, [r5, r0]
	bl sub_02026CAC
	mov r0, #0x61
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_02026CAC
	add r5, #8
	add r0, r5, #0
	bl ov40_0222DAA8
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r4, #0
	bl ov40_02240910
	add r0, r4, #0
	bl ov40_0222D88C
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	add r0, r4, #0
	mov r1, #1
	bl ov40_0222FB90
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022413DC
_02241316:
	add r0, r4, #0
	bl ov40_0222FBB4
	cmp r0, #0
	beq _022413DC
	add r0, r5, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	cmp r0, #0
	beq _02241398
	add r0, r4, #0
	bl ov40_0222DD08
	add r0, r5, #0
	add r0, #8
	bl ov40_0222DAA8
	ldr r0, [r4, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r4, #0x28]
	mov r2, #0xc
	mov r3, #0x10
	bl sub_02003EA4
	mov r1, #1
	ldr r3, [r4, #0x10]
	add r0, r4, #0
	add r2, r1, #0
	bl ov40_0222BF64
	add r0, r4, #0
	mov r1, #5
	bl ov40_0222BF80
	add r0, r5, #0
	bl FreeToHeap
	ldr r0, [r4, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	bl sub_0202FC48
	cmp r0, #1
	bne _022413DC
	bl sub_0202FC24
	b _022413DC
_02241398:
	ldr r0, [r4, #0x58]
	mov r1, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #2
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _022413DC
_022413CA:
	add r0, r4, #0
	bl ov40_02242378
	cmp r0, #0
	beq _022413DC
	add r0, r4, #0
	mov r1, #0xd
	bl ov40_0222BF80
_022413DC:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022413E0: .word 0x00000115
_022413E4: .word 0x00000608
_022413E8: .word 0x0000060C
	thumb_func_end ov40_02241144

	thumb_func_start ov40_022413EC
ov40_022413EC: ; 0x022413EC
	push {r3, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r1, [r0, r1]
	ldr r0, _02241400 ; =0x0000060C
	ldr r0, [r1, r0]
	bl sub_02026CC4
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_02241400: .word 0x0000060C
	thumb_func_end ov40_022413EC

	thumb_func_start ov40_02241404
ov40_02241404: ; 0x02241404
	push {r4, lr}
	add r4, r0, #0
	bl ov40_02242AEC
	cmp r0, #0
	beq _02241418
	add r0, r4, #0
	mov r1, #8
	bl ov40_0222BF80
_02241418:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov40_02241404

	thumb_func_start ov40_0224141C
ov40_0224141C: ; 0x0224141C
	push {r4, lr}
	add r4, r0, #0
	bl ov40_022428D4
	cmp r0, #0
	beq _02241430
	add r0, r4, #0
	mov r1, #8
	bl ov40_0222BF80
_02241430:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov40_0224141C

	thumb_func_start ov40_02241434
ov40_02241434: ; 0x02241434
	push {r4, lr}
	add r4, r0, #0
	bl ov40_02242490
	cmp r0, #0
	beq _02241448
	add r0, r4, #0
	mov r1, #0x10
	bl ov40_0222BF80
_02241448:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov40_02241434

	thumb_func_start ov40_0224144C
ov40_0224144C: ; 0x0224144C
	push {r3, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r1, [r0, r1]
	mov r0, #0x61
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	bl sub_02026CC4
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov40_0224144C

	thumb_func_start ov40_02241464
ov40_02241464: ; 0x02241464
	push {r4, lr}
	add r4, r0, #0
	bl ov40_0224253C
	cmp r0, #0
	beq _02241478
	add r0, r4, #0
	mov r1, #0xd
	bl ov40_0222BF80
_02241478:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov40_02241464

	thumb_func_start ov40_0224147C
ov40_0224147C: ; 0x0224147C
	push {r3, lr}
	bl ov40_022425E8
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov40_0224147C

	thumb_func_start ov40_02241488
ov40_02241488: ; 0x02241488
	push {r3, r4, r5, lr}
	sub sp, #0x10
	mov r1, #0x86
	add r4, r0, #0
	lsl r1, r1, #4
	ldr r5, [r4, r1]
	ldr r1, [r4, #8]
	cmp r1, #5
	bls _0224149C
	b _02241754
_0224149C:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022414A8: ; jump table
	.short _022414B4 - _022414A8 - 2 ; case 0
	.short _02241548 - _022414A8 - 2 ; case 1
	.short _022415E8 - _022414A8 - 2 ; case 2
	.short _022416B4 - _022414A8 - 2 ; case 3
	.short _02241726 - _022414A8 - 2 ; case 4
	.short _02241744 - _022414A8 - 2 ; case 5
_022414B4:
	bl ov40_0222FBB4
	cmp r0, #0
	beq _02241560
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #0
	bl ov40_0222D9E8
	ldr r0, _02241770 ; =0x00002604
	ldrb r1, [r4, r0]
	ldr r0, _02241774 ; =0x0000079C
	strb r1, [r5, r0]
	ldr r0, _02241778 ; =0x000008B8
	ldr r1, _0224177C ; =0x000004BC
	add r2, r4, r0
	str r2, [r5, r1]
	ldr r1, [r5, r1]
	sub r0, r0, #4
	str r1, [r4, r0]
	add r0, r4, #0
	bl ov40_0222FB40
	add r0, r4, #0
	bl ov40_0224085C
	ldr r0, [r4, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #0x3e
	mov r3, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #0x3e
	mov r3, #7
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	add r0, r4, #0
	mov r1, #0
	bl ov40_0222FB90
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0224176A
_02241548:
	bl ov40_0222FBB4
	cmp r0, #0
	beq _02241560
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #0
	mov r3, #1
	bl ov40_0222DA00
	cmp r0, #0
	bne _02241562
_02241560:
	b _0224176A
_02241562:
	mov r0, #0
	mov r1, #1
	bl SetBgPriority
	mov r0, #1
	mov r1, #3
	bl SetBgPriority
	mov r0, #2
	mov r1, #0
	bl SetBgPriority
	mov r0, #3
	mov r1, #1
	bl SetBgPriority
	mov r0, #4
	mov r1, #1
	bl SetBgPriority
	mov r0, #5
	mov r1, #3
	bl SetBgPriority
	mov r0, #6
	mov r1, #0
	bl SetBgPriority
	mov r0, #7
	mov r1, #2
	bl SetBgPriority
	mov r0, #0x6d
	str r0, [sp]
	ldr r0, _02241780 ; =ov40_022456B4
	ldr r2, _02241784 ; =ov40_02241C10
	mov r1, #4
	add r3, r4, #0
	bl sub_02026C44
	ldr r1, _02241788 ; =0x00000608
	ldr r2, _0224178C ; =ov40_02241C70
	str r0, [r5, r1]
	mov r0, #0x6d
	str r0, [sp]
	ldr r0, _02241790 ; =ov40_02245674
	mov r1, #4
	add r3, r4, #0
	bl sub_02026C44
	ldr r1, _02241794 ; =0x0000060C
	ldr r2, _02241798 ; =ov40_02241CD8
	str r0, [r5, r1]
	mov r0, #0x6d
	str r0, [sp]
	ldr r0, _0224179C ; =ov40_02245654
	mov r1, #2
	add r3, r4, #0
	bl sub_02026C44
	mov r1, #0x61
	lsl r1, r1, #4
	str r0, [r5, r1]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0224176A
_022415E8:
	bl ov40_02242110
	add r0, r4, #0
	bl ov40_02241AB0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #0x3e
	mov r3, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #0x3e
	mov r3, #7
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	cmp r1, #0
	bne _02241660
	sub r0, #0xc0
	add r0, r5, r0
	add r1, r4, #0
	bl ov40_02230638
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl ov40_022306A0
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov40_02230410
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #3
	bl ov40_022307DC
	b _0224168C
_02241660:
	add r0, r5, #0
	add r0, #0x80
	add r1, r4, #0
	bl ov40_0222E79C
	add r5, #0x80
	add r0, r5, #0
	mov r1, #0
	bl ov40_0222E7DC
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #0x50
	mov r3, #3
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
_0224168C:
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #6
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0224176A
_022416B4:
	mov r2, #0
	add r0, r5, #0
	add r1, r5, #4
	add r3, r2, #0
	str r2, [r5, #8]
	bl ov40_0222DA00
	cmp r0, #0
	beq _0224170C
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	cmp r1, #0
	bne _022416DC
	sub r0, #0xc0
	add r0, r5, r0
	mov r1, #1
	bl ov40_022306A0
	b _022416E6
_022416DC:
	add r0, r5, #0
	add r0, #0x80
	mov r1, #1
	bl ov40_0222E7DC
_022416E6:
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0224170C:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0224176A
_02241726:
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x6d
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0224176A
_02241744:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0224176A
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0224176A
_02241754:
	ldr r0, _022417A0 ; =0x000006D8
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	add r0, r4, #0
	bl ov40_0222C4B8
	add r0, r4, #0
	mov r1, #8
	bl ov40_0222BF80
_0224176A:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02241770: .word 0x00002604
_02241774: .word 0x0000079C
_02241778: .word 0x000008B8
_0224177C: .word 0x000004BC
_02241780: .word ov40_022456B4
_02241784: .word ov40_02241C10
_02241788: .word 0x00000608
_0224178C: .word ov40_02241C70
_02241790: .word ov40_02245674
_02241794: .word 0x0000060C
_02241798: .word ov40_02241CD8
_0224179C: .word ov40_02245654
_022417A0: .word 0x000006D8
	thumb_func_end ov40_02241488

	thumb_func_start ov40_022417A4
ov40_022417A4: ; 0x022417A4
	push {r4, lr}
	mov r1, #0x6f
	add r4, r0, #0
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #0x80
	mov r3, #0x60
	bl ov40_0223077C
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	mov r1, #0x18
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl sub_02087A08
	add r0, r4, #0
	mov r1, #3
	bl ov40_0222BF80
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov40_022417A4

	thumb_func_start ov40_022417DC
ov40_022417DC: ; 0x022417DC
	push {r4, r5, lr}
	sub sp, #0xc
	mov r1, #0x86
	add r4, r0, #0
	lsl r1, r1, #4
	ldr r5, [r4, r1]
	ldr r1, [r4, #8]
	cmp r1, #3
	bls _022417F0
	b _02241910
_022417F0:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022417FC: ; jump table
	.short _02241804 - _022417FC - 2 ; case 0
	.short _02241818 - _022417FC - 2 ; case 1
	.short _02241876 - _022417FC - 2 ; case 2
	.short _022418FA - _022417FC - 2 ; case 3
_02241804:
	mov r1, #0x77
	bl ov40_0222DED0
	ldr r0, _02241940 ; =0x0000057D
	bl PlaySE
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0224193A
_02241818:
	bl ov40_0223D5CC
	cmp r0, #0
	bne _02241826
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, pc}
_02241826:
	mov r3, #0
	mov r0, #0x83
	str r3, [sp]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0x6d
	add r2, sp, #4
	bl sub_0202FC90
	mov r0, #0x6d
	bl sub_020314A4
	mov r1, #0x1d
	lsl r1, r1, #4
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	mov r1, #0x83
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	bl sub_020314C4
	add r0, r4, #0
	bl ov40_0223D540
	mov r1, #0x1d
	lsl r1, r1, #4
	ldr r1, [r5, r1]
	bl ov39_02227534
	cmp r0, #1
	bne _0224193A
	mov r0, #0x1d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_020314BC
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0224193A
_02241876:
	bl ov40_0223D5CC
	cmp r0, #0
	bne _02241884
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, pc}
_02241884:
	bl sub_0202FC24
	add r0, r4, #0
	bl ov40_0222DFB0
	add r0, r4, #0
	bl ov40_0223D540
	add r1, sp, #8
	bl ov39_02227D44
	cmp r0, #1
	bne _022418D4
	ldr r0, _02241940 ; =0x0000057D
	mov r1, #0
	bl StopSE
	ldr r3, [sp, #8]
	add r0, r4, #0
	ldr r2, [r3, #0xc]
	ldr r3, [r3, #4]
	mov r1, #6
	bl ov40_02230CDC
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	mov r1, #0
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl sub_02087A08
	mov r0, #0xff
	str r0, [r4, #8]
	b _0224193A
_022418D4:
	add r0, r4, #0
	mov r1, #0x77
	bl ov40_0222DED0
	add r0, r5, #0
	add r1, r4, #0
	bl ov40_02242E4C
	ldr r0, _02241940 ; =0x0000057D
	mov r1, #0
	bl StopSE
	ldr r0, _02241944 ; =0x00000577
	bl PlaySE
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0224193A
_022418FA:
	bl System_GetTouchNew
	cmp r0, #0
	beq _0224193A
	add r0, r4, #0
	bl ov40_0222DFB0
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0224193A
_02241910:
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	mov r1, #0
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl sub_02087A08
	add r0, r4, #0
	mov r1, #0x23
	bl ov40_0222FB28
	add r0, r4, #0
	mov r1, #4
	bl ov40_0222BF80
_0224193A:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_02241940: .word 0x0000057D
_02241944: .word 0x00000577
	thumb_func_end ov40_022417DC

	thumb_func_start ov40_02241948
ov40_02241948: ; 0x02241948
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	bne _0224198C
	add r4, #8
	add r0, r4, #0
	bl ov40_0222DAA8
	add r0, r5, #0
	bl ov40_0222C480
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r5, #0
	bl ov40_0222D88C
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	add r0, r5, #0
	mov r1, #1
	bl ov40_0222FB90
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02241A30
_0224198C:
	bl ov40_0222FBB4
	cmp r0, #0
	beq _02241A30
	add r0, r4, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	cmp r0, #0
	beq _02241A00
	add r0, r5, #0
	bl ov40_0222DD08
	add r0, r4, #0
	add r0, #8
	bl ov40_0222DAA8
	ldr r0, [r5, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r5, #0x28]
	mov r2, #0xc
	mov r3, #0x10
	bl sub_02003EA4
	mov r1, #1
	ldr r3, [r5, #0x10]
	add r0, r5, #0
	add r2, r1, #0
	bl ov40_0222BF64
	add r0, r5, #0
	mov r1, #5
	bl ov40_0222BF80
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, [r5, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	b _02241A30
_02241A00:
	ldr r0, [r5, #0x58]
	mov r1, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #2
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
_02241A30:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov40_02241948

	thumb_func_start ov40_02241A34
ov40_02241A34: ; 0x02241A34
	push {r4, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r4, [r0, r1]
	ldr r0, _02241A50 ; =0x000006D4
	add r0, r4, r0
	bl ClearWindowTilemapAndCopyToVram
	ldr r0, _02241A50 ; =0x000006D4
	add r0, r4, r0
	bl RemoveWindow
	pop {r4, pc}
	nop
_02241A50: .word 0x000006D4
	thumb_func_end ov40_02241A34

	thumb_func_start ov40_02241A54
ov40_02241A54: ; 0x02241A54
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	ldr r6, _02241AA8 ; =0x000006D4
	add r7, r1, #0
	add r0, r4, r6
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x48]
	add r1, r7, #0
	bl NewString_ReadMsgData
	add r5, r0, #0
	add r0, r4, r6
	add r1, r5, #0
	bl ov40_022306C0
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02241AAC ; =0x000F0D00
	add r2, r5, #0
	str r0, [sp, #8]
	add r0, r4, r6
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl String_dtor
	add r0, r4, r6
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02241AA8: .word 0x000006D4
_02241AAC: .word 0x000F0D00
	thumb_func_end ov40_02241A54

	thumb_func_start ov40_02241AB0
ov40_02241AB0: ; 0x02241AB0
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	ldr r6, _02241AF8 ; =0x000006D4
	add r0, r4, r6
	bl InitWindow
	mov r0, #3
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x24]
	add r1, r4, r6
	mov r2, #6
	mov r3, #8
	bl AddWindowParameterized
	mov r1, #0x73
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, r5, #0
	add r1, #0x79
	bl ov40_02241A54
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	nop
_02241AF8: .word 0x000006D4
	thumb_func_end ov40_02241AB0

	thumb_func_start ov40_02241AFC
ov40_02241AFC: ; 0x02241AFC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	ldr r6, _02241BD4 ; =0x000006D4
	add r0, r4, r6
	bl InitWindow
	mov r2, #6
	str r2, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x24]
	add r1, r4, r6
	mov r3, #4
	bl AddWindowParameterized
	add r0, r4, r6
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x48]
	mov r1, #0x82
	bl NewString_ReadMsgData
	add r7, r0, #0
	add r0, r4, r6
	add r1, r7, #0
	bl ov40_022306C0
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02241BD8 ; =0x000F0D00
	add r2, r7, #0
	str r0, [sp, #8]
	add r0, r4, r6
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r7, #0
	bl String_dtor
	add r0, r4, r6
	bl ScheduleWindowCopyToVram
	add r6, #0x10
	add r0, r4, r6
	bl InitWindow
	mov r2, #6
	str r2, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	mov r0, #0x15
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x24]
	add r1, r4, r6
	mov r3, #0x12
	bl AddWindowParameterized
	add r0, r4, r6
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x48]
	mov r1, #0x83
	bl NewString_ReadMsgData
	add r5, r0, #0
	add r0, r4, r6
	add r1, r5, #0
	bl ov40_022306C0
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02241BD8 ; =0x000F0D00
	add r2, r5, #0
	str r0, [sp, #8]
	add r0, r4, r6
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl String_dtor
	add r0, r4, r6
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02241BD4: .word 0x000006D4
_02241BD8: .word 0x000F0D00
	thumb_func_end ov40_02241AFC

	thumb_func_start ov40_02241BDC
ov40_02241BDC: ; 0x02241BDC
	push {r4, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r4, [r0, r1]
	ldr r0, _02241C08 ; =0x000006D4
	add r0, r4, r0
	bl ClearWindowTilemapAndCopyToVram
	ldr r0, _02241C08 ; =0x000006D4
	add r0, r4, r0
	bl RemoveWindow
	ldr r0, _02241C0C ; =0x000006E4
	add r0, r4, r0
	bl ClearWindowTilemapAndCopyToVram
	ldr r0, _02241C0C ; =0x000006E4
	add r0, r4, r0
	bl RemoveWindow
	pop {r4, pc}
	nop
_02241C08: .word 0x000006D4
_02241C0C: .word 0x000006E4
	thumb_func_end ov40_02241BDC

	thumb_func_start ov40_02241C10
ov40_02241C10: ; 0x02241C10
	push {r4, lr}
	add r4, r2, #0
	cmp r1, #0
	bne _02241C6E
	cmp r0, #3
	bhi _02241C6E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02241C28: ; jump table
	.short _02241C30 - _02241C28 - 2 ; case 0
	.short _02241C40 - _02241C28 - 2 ; case 1
	.short _02241C50 - _02241C28 - 2 ; case 2
	.short _02241C60 - _02241C28 - 2 ; case 3
_02241C30:
	add r0, r4, #0
	bl ov40_02230944
	add r0, r4, #0
	mov r1, #9
	bl ov40_0222BF80
	pop {r4, pc}
_02241C40:
	add r0, r4, #0
	bl ov40_02230944
	add r0, r4, #0
	mov r1, #0xa
	bl ov40_0222BF80
	pop {r4, pc}
_02241C50:
	add r0, r4, #0
	bl ov40_02230944
	add r0, r4, #0
	mov r1, #0xc
	bl ov40_0222BF80
	pop {r4, pc}
_02241C60:
	add r0, r4, #0
	bl ov40_02230944
	add r0, r4, #0
	mov r1, #0xb
	bl ov40_0222BF80
_02241C6E:
	pop {r4, pc}
	thumb_func_end ov40_02241C10

	thumb_func_start ov40_02241C70
ov40_02241C70: ; 0x02241C70
	push {r4, lr}
	add r4, r2, #0
	mov r2, #0x86
	lsl r2, r2, #4
	ldr r3, [r4, r2]
	cmp r1, #0
	bne _02241CD4
	cmp r0, #3
	bhi _02241CD4
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02241C8E: ; jump table
	.short _02241C96 - _02241C8E - 2 ; case 0
	.short _02241C96 - _02241C8E - 2 ; case 1
	.short _02241C96 - _02241C8E - 2 ; case 2
	.short _02241CC6 - _02241C8E - 2 ; case 3
_02241C96:
	add r1, r0, #1
	mov r0, #0x72
	lsl r0, r0, #2
	str r1, [r3, r0]
	ldr r0, [r3, r0]
	add r2, #0x2c
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, r2]
	cmp r0, #0
	beq _02241CB6
	add r0, r4, #0
	mov r1, #0xf
	bl ov40_0222BF80
	b _02241CBE
_02241CB6:
	add r0, r4, #0
	mov r1, #0x12
	bl ov40_0222BF80
_02241CBE:
	add r0, r4, #0
	bl ov40_02230944
	pop {r4, pc}
_02241CC6:
	add r0, r4, #0
	bl ov40_02230944
	add r0, r4, #0
	mov r1, #0xe
	bl ov40_0222BF80
_02241CD4:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov40_02241C70

	thumb_func_start ov40_02241CD8
ov40_02241CD8: ; 0x02241CD8
	push {r4, lr}
	add r4, r2, #0
	cmp r1, #0
	bne _02241D0E
	cmp r0, #0
	beq _02241CEA
	cmp r0, #1
	beq _02241D00
	pop {r4, pc}
_02241CEA:
	add r0, r4, #0
	bl ov40_02230944
	add r0, r4, #0
	bl ov40_02241BDC
	add r0, r4, #0
	mov r1, #0x12
	bl ov40_0222BF80
	pop {r4, pc}
_02241D00:
	add r0, r4, #0
	bl ov40_02230944
	add r0, r4, #0
	mov r1, #0x11
	bl ov40_0222BF80
_02241D0E:
	pop {r4, pc}
	thumb_func_end ov40_02241CD8

	thumb_func_start ov40_02241D10
ov40_02241D10: ; 0x02241D10
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r0, #0x86
	add r4, r2, #0
	lsl r0, r0, #4
	ldr r5, [r4, r0]
	cmp r1, #0
	bne _02241DFE
	cmp r6, #4
	bhi _02241DFE
	add r1, r6, r6
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02241D30: ; jump table
	.short _02241D3A - _02241D30 - 2 ; case 0
	.short _02241D4E - _02241D30 - 2 ; case 1
	.short _02241D62 - _02241D30 - 2 ; case 2
	.short _02241DC6 - _02241D30 - 2 ; case 3
	.short _02241DD6 - _02241D30 - 2 ; case 4
_02241D3A:
	add r0, r4, #0
	bl ov40_02230944
	ldr r0, _02241E00 ; =0x000004C5
	mov r1, #5
	strb r6, [r5, r0]
	add r0, r4, #0
	bl ov40_0222BF80
	pop {r4, r5, r6, pc}
_02241D4E:
	add r0, r4, #0
	bl ov40_02230944
	ldr r0, _02241E00 ; =0x000004C5
	mov r1, #5
	strb r6, [r5, r0]
	add r0, r4, #0
	bl ov40_0222BF80
	pop {r4, r5, r6, pc}
_02241D62:
	add r0, #0x2c
	ldr r0, [r4, r0]
	bl sub_02031620
	add r6, r0, #0
	add r0, r4, #0
	bl ov40_02230944
	cmp r6, #0
	bne _02241D86
	ldr r0, _02241E04 ; =0x0000057C
	bl PlaySE
	add r0, r4, #0
	mov r1, #0x80
	bl ov40_0222DF60
	pop {r4, r5, r6, pc}
_02241D86:
	ldr r0, _02241E08 ; =0x000004C3
	ldrb r1, [r5, r0]
	cmp r1, #0xff
	bne _02241DA8
	ldr r0, _02241E0C ; =0x0000088C
	ldr r0, [r4, r0]
	bl sub_02031620
	ldr r1, _02241E08 ; =0x000004C3
	strb r0, [r5, r1]
	ldr r0, _02241E0C ; =0x0000088C
	ldr r0, [r4, r0]
	bl sub_0203162C
	ldr r1, _02241E10 ; =0x000004C4
	strb r0, [r5, r1]
	b _02241DB0
_02241DA8:
	mov r1, #0xff
	strb r1, [r5, r0]
	add r0, r0, #1
	strb r1, [r5, r0]
_02241DB0:
	ldr r2, _02241E08 ; =0x000004C3
	add r0, r4, #0
	ldrb r1, [r5, r2]
	add r2, r2, #1
	ldrb r2, [r5, r2]
	bl ov40_0223DDE8
	add r0, r4, #0
	bl ov40_0223DEB8
	pop {r4, r5, r6, pc}
_02241DC6:
	add r0, r4, #0
	bl ov40_02230944
	add r0, r4, #0
	mov r1, #4
	bl ov40_0222BF80
	pop {r4, r5, r6, pc}
_02241DD6:
	add r0, r4, #0
	bl ov40_02230944
	add r0, r4, #0
	bl ov40_0223DB94
	cmp r0, #0
	bne _02241DF6
	ldr r0, _02241E04 ; =0x0000057C
	bl PlaySE
	add r0, r4, #0
	mov r1, #0x74
	bl ov40_0222DF60
	pop {r4, r5, r6, pc}
_02241DF6:
	add r0, r4, #0
	mov r1, #0xc
	bl ov40_0222BF80
_02241DFE:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02241E00: .word 0x000004C5
_02241E04: .word 0x0000057C
_02241E08: .word 0x000004C3
_02241E0C: .word 0x0000088C
_02241E10: .word 0x000004C4
	thumb_func_end ov40_02241D10

	thumb_func_start ov40_02241E14
ov40_02241E14: ; 0x02241E14
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	cmp r1, #0
	bne _02241E3A
	add r0, r4, #0
	add r1, r5, #0
	bl ov40_0223EBB8
	cmp r0, #0
	bne _02241E32
	ldr r0, _02241E3C ; =0x0000057C
	bl PlaySE
	pop {r3, r4, r5, pc}
_02241E32:
	add r0, r4, #0
	add r1, r5, #0
	bl ov40_0223EC40
_02241E3A:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02241E3C: .word 0x0000057C
	thumb_func_end ov40_02241E14

	thumb_func_start ov40_02241E40
ov40_02241E40: ; 0x02241E40
	push {r3, r4, r5, lr}
	add r4, r2, #0
	mov r2, #0x86
	lsl r2, r2, #4
	ldr r5, [r4, r2]
	cmp r1, #0
	bne _02241ED0
	cmp r0, #3
	bhi _02241ED0
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02241E5E: ; jump table
	.short _02241E66 - _02241E5E - 2 ; case 0
	.short _02241E76 - _02241E5E - 2 ; case 1
	.short _02241E9C - _02241E5E - 2 ; case 2
	.short _02241EC2 - _02241E5E - 2 ; case 3
_02241E66:
	add r0, r4, #0
	bl ov40_02230944
	add r0, r4, #0
	mov r1, #0x13
	bl ov40_0222BF80
	pop {r3, r4, r5, pc}
_02241E76:
	add r0, r4, #0
	bl ov40_02230944
	bl sub_0202FC48
	cmp r0, #0
	beq _02241E8E
	add r0, r4, #0
	mov r1, #0x14
	bl ov40_0222BF80
	pop {r3, r4, r5, pc}
_02241E8E:
	mov r0, #0x14
	str r0, [r5, #0xc]
	add r0, r4, #0
	mov r1, #0x1d
	bl ov40_0222BF80
	pop {r3, r4, r5, pc}
_02241E9C:
	add r0, r4, #0
	bl ov40_02230944
	bl sub_0202FC48
	cmp r0, #0
	beq _02241EB4
	add r0, r4, #0
	mov r1, #0x16
	bl ov40_0222BF80
	pop {r3, r4, r5, pc}
_02241EB4:
	mov r0, #0x16
	str r0, [r5, #0xc]
	add r0, r4, #0
	mov r1, #0x1d
	bl ov40_0222BF80
	pop {r3, r4, r5, pc}
_02241EC2:
	add r0, r4, #0
	bl ov40_02230944
	add r0, r4, #0
	mov r1, #0x15
	bl ov40_0222BF80
_02241ED0:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_02241E40

	thumb_func_start ov40_02241ED4
ov40_02241ED4: ; 0x02241ED4
	push {r4, lr}
	add r4, r2, #0
	mov r2, #0x86
	lsl r2, r2, #4
	ldr r3, [r4, r2]
	cmp r1, #0
	bne _02241F38
	cmp r0, #3
	bhi _02241F38
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02241EF2: ; jump table
	.short _02241EFA - _02241EF2 - 2 ; case 0
	.short _02241EFA - _02241EF2 - 2 ; case 1
	.short _02241EFA - _02241EF2 - 2 ; case 2
	.short _02241F2A - _02241EF2 - 2 ; case 3
_02241EFA:
	add r1, r0, #1
	mov r0, #0x72
	lsl r0, r0, #2
	str r1, [r3, r0]
	ldr r0, [r3, r0]
	add r2, #0x2c
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, r2]
	cmp r0, #0
	beq _02241F1A
	add r0, r4, #0
	mov r1, #0x19
	bl ov40_0222BF80
	b _02241F22
_02241F1A:
	add r0, r4, #0
	mov r1, #0x1c
	bl ov40_0222BF80
_02241F22:
	add r0, r4, #0
	bl ov40_02230944
	pop {r4, pc}
_02241F2A:
	add r0, r4, #0
	bl ov40_02230944
	add r0, r4, #0
	mov r1, #0x18
	bl ov40_0222BF80
_02241F38:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov40_02241ED4

	thumb_func_start ov40_02241F3C
ov40_02241F3C: ; 0x02241F3C
	push {r4, lr}
	add r4, r2, #0
	cmp r1, #0
	bne _02241F72
	cmp r0, #0
	beq _02241F4E
	cmp r0, #1
	beq _02241F64
	pop {r4, pc}
_02241F4E:
	add r0, r4, #0
	bl ov40_02230944
	add r0, r4, #0
	bl ov40_02241BDC
	add r0, r4, #0
	mov r1, #0x1c
	bl ov40_0222BF80
	pop {r4, pc}
_02241F64:
	add r0, r4, #0
	bl ov40_02230944
	add r0, r4, #0
	mov r1, #0x1b
	bl ov40_0222BF80
_02241F72:
	pop {r4, pc}
	thumb_func_end ov40_02241F3C

	thumb_func_start ov40_02241F74
ov40_02241F74: ; 0x02241F74
	push {r4, lr}
	mov r2, #0x86
	lsl r2, r2, #4
	ldr r4, [r0, r2]
	cmp r1, #0
	ldr r0, [r4, #0x14]
	bne _02241F9C
	mov r1, #1
	bl sub_0200DCE8
	ldr r0, [r4, #0x18]
	mov r1, #1
	bl sub_020137C0
	ldr r0, [r4, #0x30]
	mov r1, #0x80
	mov r2, #0xa8
	bl sub_0200DDB8
	b _02241FB4
_02241F9C:
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r4, #0x18]
	mov r1, #0
	bl sub_020137C0
	ldr r0, [r4, #0x30]
	mov r1, #0x50
	mov r2, #0xa8
	bl sub_0200DDB8
_02241FB4:
	mov r1, #0x24
	add r2, r1, #0
	ldr r0, [r4, #0x18]
	sub r2, #0x2c
	bl sub_020136B4
	mov r1, #0x24
	add r2, r1, #0
	ldr r0, [r4, #0x34]
	sub r2, #0x2c
	bl sub_020136B4
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov40_02241F74

	thumb_func_start ov40_02241FD0
ov40_02241FD0: ; 0x02241FD0
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r4, r0, #0
	lsl r1, r1, #4
	ldr r5, [r4, r1]
	mov r1, #1
	bl ov40_0222D6EC
	add r0, r4, #0
	mov r1, #1
	bl ov40_0222D800
	str r0, [r5, #0x14]
	add r0, r4, #0
	mov r1, #1
	bl ov40_0222D800
	str r0, [r5, #0x30]
	add r0, r5, #0
	add r1, r4, #0
	add r0, #0x10
	add r1, #0x14
	mov r2, #1
	bl ov40_0222D5AC
	add r0, r5, #0
	add r1, r4, #0
	add r0, #0x2c
	add r1, #0x14
	mov r2, #1
	bl ov40_0222D5AC
	add r0, r5, #0
	add r1, r4, #0
	add r0, #0x10
	add r1, #0x14
	mov r2, #3
	bl ov40_0222D66C
	add r0, r5, #0
	add r1, r4, #0
	add r0, #0x2c
	add r1, #0x14
	mov r2, #0x6f
	bl ov40_0222D66C
	ldr r0, [r5, #0x14]
	mov r1, #0x20
	mov r2, #0xa8
	bl sub_0200DDB8
	ldr r0, [r5, #0x30]
	mov r1, #0x80
	mov r2, #0xa8
	bl sub_0200DDB8
	mov r1, #0x24
	add r2, r1, #0
	ldr r0, [r5, #0x18]
	sub r2, #0x2c
	bl sub_020136B4
	mov r1, #0x24
	add r2, r1, #0
	ldr r0, [r5, #0x34]
	sub r2, #0x2c
	bl sub_020136B4
	ldr r0, [r5, #0x18]
	mov r1, #1
	bl sub_020137C0
	ldr r0, [r5, #0x34]
	mov r1, #1
	bl sub_020137C0
	ldr r0, [r5, #0x14]
	mov r1, #0
	bl sub_0200DC4C
	ldr r0, [r5, #0x30]
	mov r1, #1
	bl sub_0200DC4C
	add r0, r4, #0
	mov r1, #0
	bl ov40_02241F74
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_02241FD0

	thumb_func_start ov40_02242084
ov40_02242084: ; 0x02242084
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r5, [r4, r0]
	add r0, r5, #0
	add r0, #0x10
	bl ov40_0222D6D0
	add r0, r5, #0
	add r0, #0x2c
	bl ov40_0222D6D0
	ldr r0, [r5, #0x14]
	bl sub_0200D9DC
	ldr r0, [r5, #0x30]
	bl sub_0200D9DC
	add r0, r4, #0
	bl ov40_0222D7DC
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_02242084

	thumb_func_start ov40_022420B4
ov40_022420B4: ; 0x022420B4
	push {r4, lr}
	mov r2, #0x86
	lsl r2, r2, #4
	ldr r4, [r0, r2]
	cmp r1, #0
	ldr r0, [r4, #0x30]
	bne _022420DC
	mov r1, #1
	bl sub_0200DCE8
	ldr r0, [r4, #0x34]
	mov r1, #1
	bl sub_020137C0
	ldr r0, [r4, #0x14]
	mov r1, #0x20
	mov r2, #0xe8
	bl sub_0200DDB8
	b _022420F4
_022420DC:
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r4, #0x34]
	mov r1, #0
	bl sub_020137C0
	ldr r0, [r4, #0x14]
	mov r1, #0x50
	mov r2, #0xe8
	bl sub_0200DDB8
_022420F4:
	mov r1, #0x24
	add r2, r1, #0
	ldr r0, [r4, #0x18]
	sub r2, #0x2c
	bl sub_020136B4
	mov r1, #0x24
	add r2, r1, #0
	ldr r0, [r4, #0x34]
	sub r2, #0x2c
	bl sub_020136B4
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov40_022420B4

	thumb_func_start ov40_02242110
ov40_02242110: ; 0x02242110
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	mov r1, #2
	bl ov40_0222D6EC
	add r0, r5, #0
	mov r1, #2
	bl ov40_0222D800
	str r0, [r4, #0x14]
	add r0, r5, #0
	mov r1, #2
	bl ov40_0222D800
	str r0, [r4, #0x30]
	add r0, r4, #0
	add r1, r5, #0
	add r0, #0x10
	add r1, #0x14
	mov r2, #2
	bl ov40_0222D5AC
	add r0, r4, #0
	add r1, r5, #0
	add r0, #0x2c
	add r1, #0x14
	mov r2, #2
	bl ov40_0222D5AC
	ldr r0, _022421F8 ; =0x0000086C
	ldr r0, [r5, r0]
	cmp r0, #0xd2
	bne _02242186
	add r0, r4, #0
	add r1, r5, #0
	add r0, #0x10
	add r1, #0x14
	mov r2, #3
	bl ov40_0222D66C
	add r0, r4, #0
	add r1, r5, #0
	add r0, #0x2c
	add r1, #0x14
	mov r2, #0x6f
	bl ov40_0222D66C
	ldr r0, [r4, #0x14]
	mov r1, #0
	bl sub_0200DC4C
	ldr r0, [r4, #0x30]
	mov r1, #1
	bl sub_0200DC4C
	b _022421B2
_02242186:
	add r0, r4, #0
	add r1, r5, #0
	add r0, #0x10
	add r1, #0x14
	mov r2, #3
	bl ov40_0222D66C
	add r0, r4, #0
	add r1, r5, #0
	add r0, #0x2c
	add r1, #0x14
	mov r2, #0x5e
	bl ov40_0222D66C
	ldr r0, [r4, #0x14]
	mov r1, #0
	bl sub_0200DC4C
	ldr r0, [r4, #0x30]
	mov r1, #3
	bl sub_0200DC4C
_022421B2:
	ldr r0, [r4, #0x14]
	mov r1, #0x20
	mov r2, #0xe8
	bl sub_0200DDB8
	ldr r0, [r4, #0x30]
	mov r1, #0x80
	mov r2, #0xe8
	bl sub_0200DDB8
	mov r1, #0x24
	add r2, r1, #0
	ldr r0, [r4, #0x18]
	sub r2, #0x2c
	bl sub_020136B4
	mov r1, #0x24
	add r2, r1, #0
	ldr r0, [r4, #0x34]
	sub r2, #0x2c
	bl sub_020136B4
	ldr r0, [r4, #0x18]
	mov r1, #1
	bl sub_020137C0
	ldr r0, [r4, #0x34]
	mov r1, #1
	bl sub_020137C0
	add r0, r5, #0
	mov r1, #0
	bl ov40_022420B4
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022421F8: .word 0x0000086C
	thumb_func_end ov40_02242110

	thumb_func_start ov40_022421FC
ov40_022421FC: ; 0x022421FC
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r5, [r4, r0]
	add r0, r5, #0
	add r0, #0x10
	bl ov40_0222D6D0
	add r0, r5, #0
	add r0, #0x2c
	bl ov40_0222D6D0
	ldr r0, [r5, #0x14]
	bl sub_0200D9DC
	ldr r0, [r5, #0x30]
	bl sub_0200D9DC
	add r0, r4, #0
	bl ov40_0222D7DC
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_022421FC

	thumb_func_start ov40_0224222C
ov40_0224222C: ; 0x0224222C
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #3
	bls _0224223E
	b _0224235A
_0224223E:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0224224A: ; jump table
	.short _02242252 - _0224224A - 2 ; case 0
	.short _02242290 - _0224224A - 2 ; case 1
	.short _022422A8 - _0224224A - 2 ; case 2
	.short _02242312 - _0224224A - 2 ; case 3
_02242252:
	mov r1, #1
	bl ov40_02230964
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #0
	bne _0224226E
	sub r0, #0xc0
	add r0, r4, r0
	add r1, r5, #0
	bl ov40_0223064C
	b _02242278
_0224226E:
	add r4, #0x80
	add r0, r4, #0
	add r1, r5, #0
	bl ov40_0222E7B8
_02242278:
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02242374
_02242290:
	mov r2, #1
	add r0, r4, #0
	add r1, r4, #4
	add r3, r2, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _02242374
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02242374
_022422A8:
	mov r1, #1
	bl ov40_02230964
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #0
	bne _022422D8
	add r0, r4, #0
	add r0, #0x80
	add r1, r5, #0
	bl ov40_0222E79C
	add r4, #0x80
	add r0, r4, #0
	mov r1, #0
	bl ov40_0222E7DC
	add r0, r5, #0
	mov r1, #0x50
	mov r2, #3
	bl ov40_022307DC
	b _02242302
_022422D8:
	sub r0, #0xc0
	add r0, r4, r0
	add r1, r5, #0
	bl ov40_02230638
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	bl ov40_022306A0
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov40_02230410
	add r1, r0, #0
	add r0, r5, #0
	mov r2, #3
	bl ov40_022307DC
_02242302:
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02242374
_02242312:
	add r0, r4, #0
	add r1, r4, #4
	mov r2, #0
	mov r3, #1
	bl ov40_0222DA00
	cmp r0, #0
	beq _02242374
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #0
	bne _02242338
	add r4, #0x80
	add r0, r4, #0
	mov r1, #1
	bl ov40_0222E7DC
	b _02242342
_02242338:
	sub r0, #0xc0
	add r0, r4, r0
	mov r1, #1
	bl ov40_022306A0
_02242342:
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02242374
_0224235A:
	mov r1, #0x73
	lsl r1, r1, #2
	ldr r2, [r4, r1]
	mov r0, #1
	eor r0, r2
	str r0, [r4, r1]
	ldr r1, [r4, r1]
	add r0, r5, #0
	add r1, #0x79
	bl ov40_02241A54
	mov r0, #1
	pop {r3, r4, r5, pc}
_02242374:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov40_0224222C

	thumb_func_start ov40_02242378
ov40_02242378: ; 0x02242378
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _02242392
	cmp r1, #1
	beq _022423DE
	cmp r1, #2
	beq _02242444
	b _02242488
_02242392:
	mov r1, #1
	bl ov40_02230964
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #0
	bne _022423AE
	sub r0, #0xc0
	add r0, r4, r0
	add r1, r5, #0
	bl ov40_0223064C
	b _022423B8
_022423AE:
	add r4, #0x80
	add r0, r4, #0
	add r1, r5, #0
	bl ov40_0222E7B8
_022423B8:
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	add r0, r5, #0
	bl ov40_02241A34
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0224248C
_022423DE:
	add r0, r4, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r4, #0
	add r1, r4, #4
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _0224242A
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r5, #0
	bl ov40_022421FC
	add r0, r5, #0
	bl ov40_02241054
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, [r5, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_0224242A:
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0224248C
_02242444:
	add r0, r4, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	add r0, r4, #0
	add r1, r4, #4
	mov r2, #0
	mov r3, #1
	bl ov40_0222DA00
	cmp r0, #0
	beq _0224246E
	add r0, r5, #0
	mov r1, #0x64
	mov r2, #0
	bl ov40_02240E28
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_0224246E:
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0224248C
_02242488:
	mov r0, #1
	pop {r3, r4, r5, pc}
_0224248C:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov40_02242378

	thumb_func_start ov40_02242490
ov40_02242490: ; 0x02242490
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _022424A8
	cmp r0, #1
	beq _02242508
	b _0224252E
_022424A8:
	add r0, r4, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r4, #0
	add r1, r4, #4
	mov r2, #1
	mov r3, #2
	bl ov40_0222DA00
	cmp r0, #0
	beq _022424EE
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #0x24]
	mov r1, #0x54
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r2, #0x72
	lsl r2, r2, #2
	ldr r2, [r4, r2]
	add r0, r5, #0
	mov r1, #0x66
	bl ov40_02240F24
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_022424EE:
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02242534
_02242508:
	add r0, r4, #0
	add r1, r4, #4
	mov r2, #0
	mov r3, #2
	bl ov40_0222DA00
	cmp r0, #0
	beq _02242534
	add r0, r5, #0
	bl ov40_02241AFC
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02242534
_0224252E:
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, pc}
_02242534:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_02242490

	thumb_func_start ov40_0224253C
ov40_0224253C: ; 0x0224253C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _02242556
	cmp r0, #1
	beq _02242566
	cmp r0, #2
	beq _02242594
	b _022425E0
_02242556:
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _022425E4
_02242566:
	add r0, r4, #0
	add r1, r4, #4
	mov r2, #1
	mov r3, #2
	bl ov40_0222DA00
	cmp r0, #0
	beq _022425E4
	add r0, r5, #0
	bl ov40_02241BDC
	ldr r0, [r5, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _022425E4
_02242594:
	add r0, r4, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	add r0, r4, #0
	add r1, r4, #4
	mov r2, #0
	mov r3, #2
	bl ov40_0222DA00
	cmp r0, #0
	beq _022425C6
	add r0, r5, #0
	mov r1, #0x64
	mov r2, #0
	bl ov40_02240F24
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_022425C6:
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _022425E4
_022425E0:
	mov r0, #1
	pop {r3, r4, r5, pc}
_022425E4:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov40_0224253C

	thumb_func_start ov40_022425E8
ov40_022425E8: ; 0x022425E8
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r0, #0
	mov r2, #0x86
	lsl r2, r2, #4
	ldr r1, [r4, #8]
	ldr r5, [r4, r2]
	cmp r1, #7
	bls _022425FC
	b _022427FC
_022425FC:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02242608: ; jump table
	.short _02242618 - _02242608 - 2 ; case 0
	.short _02242628 - _02242608 - 2 ; case 1
	.short _0224267A - _02242608 - 2 ; case 2
	.short _0224269A - _02242608 - 2 ; case 3
	.short _022426D0 - _02242608 - 2 ; case 4
	.short _02242714 - _02242608 - 2 ; case 5
	.short _0224275A - _02242608 - 2 ; case 6
	.short _022427A6 - _02242608 - 2 ; case 7
_02242618:
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022428AE
_02242628:
	add r0, r5, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #1
	mov r3, #2
	bl ov40_0222DA00
	cmp r0, #0
	beq _02242660
	ldr r0, [r4, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r1, _022428B4 ; =0x00000116
	add r0, r4, #0
	mov r2, #0
	bl ov40_02240F24
	add r0, r4, #0
	bl ov40_022306E0
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_02242660:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _022428AE
_0224267A:
	mov r1, #0x72
	sub r2, #0xc4
	lsl r1, r1, #2
	ldrb r2, [r5, r2]
	ldr r1, [r5, r1]
	bl ov40_0222FC14
	cmp r0, #0
	beq _02242762
	ldr r0, _022428B8 ; =0x0000079C
	mov r1, #0
	strb r1, [r5, r0]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022428AE
_0224269A:
	mov r1, #0x6f
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #0x80
	mov r3, #0x60
	bl ov40_0223077C
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	mov r1, #0x18
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl sub_02087A08
	ldr r0, _022428BC ; =0x0000057D
	bl PlaySE
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022428AE
_022426D0:
	bl ov40_0223D5CC
	cmp r0, #0
	bne _022426DE
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_022426DE:
	mov r1, #0x46
	add r0, r4, #0
	lsl r1, r1, #2
	mov r2, #0
	bl ov40_02240F24
	bl sub_020307F8
	mov r1, #4
	mov r2, #0
	bl sub_0203088C
	add r6, r0, #0
	add r5, r1, #0
	add r0, r4, #0
	bl ov40_0223D540
	add r1, r6, #0
	add r2, r5, #0
	bl ov39_0222774C
	cmp r0, #1
	bne _02242762
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022428AE
_02242714:
	bl ov40_0223D5CC
	cmp r0, #0
	bne _02242722
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_02242722:
	add r0, r4, #0
	bl ov40_0223D540
	add r1, sp, #4
	bl ov39_02227D44
	cmp r0, #1
	ldr r0, _022428BC ; =0x0000057D
	bne _0224273C
	mov r1, #0
	bl StopSE
	b _02242748
_0224273C:
	mov r1, #0
	bl StopSE
	ldr r0, _022428C0 ; =0x00000577
	bl PlaySE
_02242748:
	ldr r0, [r4, #8]
	ldr r1, _022428C4 ; =0x00000119
	add r0, r0, #1
	str r0, [r4, #8]
	add r0, r4, #0
	mov r2, #0
	bl ov40_02240F24
	b _022428AE
_0224275A:
	bl System_GetTouchNew
	cmp r0, #0
	bne _02242764
_02242762:
	b _022428AE
_02242764:
	add r0, r4, #0
	bl ov40_0222DEAC
	add r0, r4, #0
	bl ov40_02241114
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_020879E0
	mov r0, #0x6f
	lsl r0, r0, #4
	mov r1, #0
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl sub_02087A08
	add r0, r4, #0
	bl ov40_0222FDC4
	add r0, r4, #0
	bl ov40_0222FCCC
	ldr r0, _022428C8 ; =0x0000049C
	add r0, r4, r0
	bl ov40_0222F734
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022428AE
_022427A6:
	ldr r0, _022428CC ; =0x00000608
	ldr r0, [r5, r0]
	bl sub_02026CAC
	ldr r0, _022428D0 ; =0x0000060C
	ldr r0, [r5, r0]
	bl sub_02026CAC
	mov r0, #0x61
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_02026CAC
	add r5, #8
	add r0, r5, #0
	bl ov40_0222DAA8
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r4, #0
	bl ov40_02240910
	add r0, r4, #0
	bl ov40_0222D88C
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	mov r0, #1
	mov r1, #0x6d
	bl sub_0203A948
	add r0, r4, #0
	mov r1, #1
	bl ov40_0222FB90
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022428AE
_022427FC:
	add r0, r4, #0
	bl ov40_0222FBB4
	cmp r0, #0
	beq _022428AE
	add r0, r5, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	cmp r0, #0
	beq _0224287E
	add r0, r4, #0
	bl ov40_0222DD08
	add r0, r5, #0
	add r0, #8
	bl ov40_0222DAA8
	ldr r0, [r4, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r4, #0x28]
	mov r2, #0xc
	mov r3, #0x10
	bl sub_02003EA4
	mov r1, #1
	ldr r3, [r4, #0x10]
	add r0, r4, #0
	add r2, r1, #0
	bl ov40_0222BF64
	add r0, r4, #0
	mov r1, #5
	bl ov40_0222BF80
	add r0, r5, #0
	bl FreeToHeap
	ldr r0, [r4, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	bl sub_0202FC48
	cmp r0, #1
	bne _022428AE
	bl sub_0202FC24
	b _022428AE
_0224287E:
	ldr r0, [r4, #0x58]
	mov r1, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #2
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
_022428AE:
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_022428B4: .word 0x00000116
_022428B8: .word 0x0000079C
_022428BC: .word 0x0000057D
_022428C0: .word 0x00000577
_022428C4: .word 0x00000119
_022428C8: .word 0x0000049C
_022428CC: .word 0x00000608
_022428D0: .word 0x0000060C
	thumb_func_end ov40_022425E8

	thumb_func_start ov40_022428D4
ov40_022428D4: ; 0x022428D4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r1, [r4, #8]
	ldr r5, [r4, r0]
	cmp r1, #3
	bls _022428E8
	b _02242AE0
_022428E8:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022428F4: ; jump table
	.short _022428FC - _022428F4 - 2 ; case 0
	.short _02242924 - _022428F4 - 2 ; case 1
	.short _0224295E - _022428F4 - 2 ; case 2
	.short _02242A76 - _022428F4 - 2 ; case 3
_022428FC:
	ldr r0, [r4, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02242AE6
_02242924:
	add r0, r5, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _02242944
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_02242944:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02242AE6
_0224295E:
	add r0, #0xc
	ldr r0, [r4, r0]
	cmp r0, #0xd2
	bne _02242992
	add r0, r5, #0
	add r1, r4, #0
	add r0, #0x10
	add r1, #0x14
	mov r2, #3
	bl ov40_0222D66C
	add r0, r5, #0
	add r1, r4, #0
	add r0, #0x2c
	add r1, #0x14
	mov r2, #0x5e
	bl ov40_0222D66C
	ldr r0, [r5, #0x14]
	mov r1, #0
	bl sub_0200DC4C
	ldr r0, [r5, #0x30]
	mov r1, #3
	bl sub_0200DC4C
_02242992:
	add r0, r4, #0
	bl ov40_02241A34
	add r0, r4, #0
	bl ov40_02241AB0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #0x3e
	mov r3, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #0x3e
	mov r3, #7
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	cmp r1, #0
	bne _02242A18
	sub r0, #0xc0
	add r0, r5, r0
	add r1, r4, #0
	bl ov40_0223064C
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	add r1, r4, #0
	bl ov40_02230638
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl ov40_022306A0
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov40_02230410
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #3
	bl ov40_022307DC
	b _02242A4E
_02242A18:
	add r0, r5, #0
	add r0, #0x80
	add r1, r4, #0
	bl ov40_0222E7B8
	add r0, r5, #0
	add r0, #0x80
	add r1, r4, #0
	bl ov40_0222E79C
	add r5, #0x80
	add r0, r5, #0
	mov r1, #0
	bl ov40_0222E7DC
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #0x50
	mov r3, #3
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
_02242A4E:
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #6
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02242AE6
_02242A76:
	add r0, r5, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	mov r2, #0
	add r0, r5, #0
	add r1, r5, #4
	add r3, r2, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _02242AC6
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	cmp r1, #0
	bne _02242AA6
	sub r0, #0xc0
	add r0, r5, r0
	mov r1, #1
	bl ov40_022306A0
	b _02242AB0
_02242AA6:
	add r0, r5, #0
	add r0, #0x80
	mov r1, #1
	bl ov40_0222E7DC
_02242AB0:
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_02242AC6:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02242AE6
_02242AE0:
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, pc}
_02242AE6:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov40_022428D4

	thumb_func_start ov40_02242AEC
ov40_02242AEC: ; 0x02242AEC
	push {r3, r4, r5, lr}
	sub sp, #0x10
	mov r1, #0x86
	add r4, r0, #0
	lsl r1, r1, #4
	ldr r5, [r4, r1]
	ldr r1, [r4, #8]
	cmp r1, #3
	bls _02242B00
	b _02242CEA
_02242B00:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02242B0C: ; jump table
	.short _02242B14 - _02242B0C - 2 ; case 0
	.short _02242B40 - _02242B0C - 2 ; case 1
	.short _02242B80 - _02242B0C - 2 ; case 2
	.short _02242C80 - _02242B0C - 2 ; case 3
_02242B14:
	bl ov40_0222DEAC
	ldr r0, [r4, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02242CF0
_02242B40:
	add r0, r5, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _02242B66
	add r0, r4, #0
	bl ov40_02241114
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_02242B66:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02242CF0
_02242B80:
	bl ov40_02242110
	ldr r0, _02242CF8 ; =0x0000086C
	ldr r0, [r4, r0]
	cmp r0, #0xd2
	bne _02242BB8
	add r0, r5, #0
	add r1, r4, #0
	add r0, #0x10
	add r1, #0x14
	mov r2, #3
	bl ov40_0222D66C
	add r0, r5, #0
	add r1, r4, #0
	add r0, #0x2c
	add r1, #0x14
	mov r2, #0x5e
	bl ov40_0222D66C
	ldr r0, [r5, #0x14]
	mov r1, #0
	bl sub_0200DC4C
	ldr r0, [r5, #0x30]
	mov r1, #3
	bl sub_0200DC4C
_02242BB8:
	add r0, r4, #0
	bl ov40_02241AB0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #0x3e
	mov r3, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #0x3e
	mov r3, #7
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	add r0, r4, #0
	mov r1, #1
	bl ov40_02230964
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	cmp r1, #0
	bne _02242C2C
	sub r0, #0xc0
	add r0, r5, r0
	add r1, r4, #0
	bl ov40_02230638
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl ov40_022306A0
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov40_02230410
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #3
	bl ov40_022307DC
	b _02242C58
_02242C2C:
	add r0, r5, #0
	add r0, #0x80
	add r1, r4, #0
	bl ov40_0222E79C
	add r5, #0x80
	add r0, r5, #0
	mov r1, #0
	bl ov40_0222E7DC
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #0x50
	mov r3, #3
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
_02242C58:
	add r0, r4, #0
	mov r1, #0
	bl ov40_02230964
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #6
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02242CF0
_02242C80:
	add r0, r5, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	mov r2, #0
	add r0, r5, #0
	add r1, r5, #4
	add r3, r2, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _02242CD0
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	cmp r1, #0
	bne _02242CB0
	sub r0, #0xc0
	add r0, r5, r0
	mov r1, #1
	bl ov40_022306A0
	b _02242CBA
_02242CB0:
	add r0, r5, #0
	add r0, #0x80
	mov r1, #1
	bl ov40_0222E7DC
_02242CBA:
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_02242CD0:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02242CF0
_02242CEA:
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, pc}
_02242CF0:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_02242CF8: .word 0x0000086C
	thumb_func_end ov40_02242AEC

	thumb_func_start ov40_02242CFC
ov40_02242CFC: ; 0x02242CFC
	push {r4, r5, lr}
	sub sp, #0xc
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _02242D18
	cmp r1, #1
	beq _02242D38
	cmp r1, #2
	beq _02242D48
	b _02242DD6
_02242D18:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x6d
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02242DDC
_02242D38:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _02242DDC
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02242DDC
_02242D48:
	mov r1, #1
	bl ov40_02230964
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #0
	bne _02242D64
	sub r0, #0xc0
	add r0, r4, r0
	add r1, r5, #0
	bl ov40_0223064C
	b _02242D6E
_02242D64:
	add r0, r4, #0
	add r0, #0x80
	add r1, r5, #0
	bl ov40_0222E7B8
_02242D6E:
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, _02242DE4 ; =0x00000608
	ldr r0, [r4, r0]
	bl sub_02026CAC
	ldr r0, _02242DE8 ; =0x0000060C
	ldr r0, [r4, r0]
	bl sub_02026CAC
	mov r0, #0x61
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02026CAC
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r5, #0
	bl ov40_02240910
	add r0, r5, #0
	bl ov40_02241A34
	add r0, r5, #0
	bl ov40_022421FC
	add r0, r5, #0
	bl ov40_0222D8C8
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	ldr r1, [r5, #0x10]
	add r0, r5, #0
	ldr r1, [r1]
	bl ov40_0222C4E8
	ldr r0, _02242DEC ; =0x00000868
	mov r1, #1
	ldr r0, [r5, r0]
	mov r2, #0
	bl sub_02087A84
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02242DDC
_02242DD6:
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_02242DDC:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02242DE4: .word 0x00000608
_02242DE8: .word 0x0000060C
_02242DEC: .word 0x00000868
	thumb_func_end ov40_02242CFC

	thumb_func_start ov40_02242DF0
ov40_02242DF0: ; 0x02242DF0
	push {r4, lr}
	mov r2, #0x86
	lsl r2, r2, #4
	ldr r1, [r1]
	ldr r4, [r0, r2]
	cmp r1, #1
	beq _02242E10
	bl ov40_0223D540
	bl ov39_02227FEC
	mov r2, #0x4b
	lsl r2, r2, #4
	str r0, [r4, r2]
	add r0, r2, #4
	str r1, [r4, r0]
_02242E10:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov40_02242DF0

	thumb_func_start ov40_02242E14
ov40_02242E14: ; 0x02242E14
	push {r4, lr}
	ldr r1, [r1]
	add r4, r0, #0
	cmp r1, #1
	beq _02242E3C
	bl ov40_0223D540
	ldr r1, _02242E40 ; =0x000008B4
	add r1, r4, r1
	bl ov39_022280D4
	add r0, r4, #0
	bl ov40_0222FB40
	ldr r0, _02242E40 ; =0x000008B4
	ldr r0, [r4, r0]
	add r0, #0xa7
	ldrb r1, [r0]
	ldr r0, _02242E44 ; =0x00002604
	strb r1, [r4, r0]
_02242E3C:
	pop {r4, pc}
	nop
_02242E40: .word 0x000008B4
_02242E44: .word 0x00002604
	thumb_func_end ov40_02242E14

	thumb_func_start ov40_02242E48
ov40_02242E48: ; 0x02242E48
	bx lr
	.balign 4, 0
	thumb_func_end ov40_02242E48

	thumb_func_start ov40_02242E4C
ov40_02242E4C: ; 0x02242E4C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r4, r0, #0
	mov r0, #0x6d
	add r5, r1, #0
	bl ov40_0222DAB0
	add r6, r0, #0
	mov r0, #0x4b
	lsl r0, r0, #4
	ldr r7, [r4, r0]
	add r0, r0, #4
	ldr r4, [r4, r0]
	mov r0, #0xff
	mov r1, #0x6d
	str r4, [sp, #0x14]
	bl String_ctor
	str r0, [sp, #0x18]
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	str r0, [sp, #0x1c]
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	str r0, [sp, #0x20]
	ldr r2, _02242F9C ; =0x000186A0
	add r0, r7, #0
	add r1, r4, #0
	mov r3, #0
	bl _ll_udiv
	str r0, [sp, #0x24]
	add r4, r1, #0
	ldr r0, [r5, #0x48]
	ldr r1, _02242FA0 ; =0x00000127
	bl NewString_ReadMsgData
	str r0, [sp, #0x28]
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	str r0, [sp, #0x2c]
	ldr r1, [sp, #0x14]
	ldr r2, _02242F9C ; =0x000186A0
	add r0, r7, #0
	mov r3, #0
	bl _ull_mod
	add r1, r0, #0
	mov r0, #1
	str r0, [sp]
	ldr r0, [sp, #0x18]
	mov r2, #5
	mov r3, #2
	bl String16_FormatInteger
	ldr r0, [sp, #0x24]
	ldr r2, _02242F9C ; =0x000186A0
	add r1, r4, #0
	mov r3, #0
	bl _ull_mod
	add r1, r0, #0
	mov r0, #1
	str r0, [sp]
	ldr r0, [sp, #0x1c]
	mov r2, #5
	mov r3, #2
	bl String16_FormatInteger
	ldr r0, [sp, #0x24]
	ldr r2, _02242F9C ; =0x000186A0
	add r1, r4, #0
	mov r3, #0
	bl _ll_udiv
	add r1, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r2, #2
	ldr r0, [sp, #0x20]
	add r3, r2, #0
	bl String16_FormatInteger
	mov r0, #1
	str r0, [sp]
	mov r1, #2
	ldr r2, [sp, #0x18]
	add r0, r6, #0
	mov r3, #0
	str r1, [sp, #4]
	bl BufferString
	mov r1, #1
	str r1, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r2, [sp, #0x1c]
	add r0, r6, #0
	mov r3, #0
	bl BufferString
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	mov r1, #0
	str r0, [sp, #4]
	ldr r2, [sp, #0x20]
	add r0, r6, #0
	add r3, r1, #0
	bl BufferString
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x28]
	add r0, r6, #0
	bl StringExpandPlaceholders
	ldr r0, _02242FA4 ; =0x000008A4
	mov r1, #0xcc
	add r0, r5, r0
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02242FA8 ; =0x000F0D00
	ldr r2, [sp, #0x2c]
	str r0, [sp, #8]
	ldr r0, _02242FA4 ; =0x000008A4
	add r3, r1, #0
	add r0, r5, r0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r0, _02242FA4 ; =0x000008A4
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	ldr r0, [sp, #0x18]
	bl String_dtor
	ldr r0, [sp, #0x1c]
	bl String_dtor
	ldr r0, [sp, #0x20]
	bl String_dtor
	ldr r0, [sp, #0x28]
	bl String_dtor
	ldr r0, [sp, #0x2c]
	bl String_dtor
	add r0, r6, #0
	bl ScrStrBufs_ResetBuffers
	add r0, r6, #0
	bl ScrStrBufs_delete
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02242F9C: .word 0x000186A0
_02242FA0: .word 0x00000127
_02242FA4: .word 0x000008A4
_02242FA8: .word 0x000F0D00
	thumb_func_end ov40_02242E4C

	thumb_func_start ov40_02242FAC
ov40_02242FAC: ; 0x02242FAC
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	mov r1, #0x20
	str r0, [sp]
	add r5, r2, #0
	add r7, r3, #0
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x20
	add r4, r0, #0
	bl MI_CpuFill8
	ldr r1, [sp]
	add r0, r6, #1
	str r6, [r4]
	bl String_ctor
	str r0, [r4, #0x18]
	str r7, [r4, #0x1c]
	mov r2, #0
	add r1, r5, #0
	add r3, r4, #0
_02242FDA:
	ldr r0, [r1]
	add r2, r2, #1
	str r0, [r3, #4]
	add r1, r1, #4
	add r3, r3, #4
	cmp r2, #3
	blt _02242FDA
	sub r0, r2, #1
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	lsl r0, r2, #2
	add r0, r4, r0
	str r1, [r0, #4]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov40_02242FAC

	thumb_func_start ov40_02242FF8
ov40_02242FF8: ; 0x02242FF8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	cmp r0, #0
	bne _02243006
	bl GF_AssertFail
_02243006:
	cmp r4, #0
	bne _0224300E
	bl GF_AssertFail
_0224300E:
	ldr r0, [r4, #0x18]
	bl String_dtor
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov40_02242FF8

	thumb_func_start ov40_0224301C
ov40_0224301C: ; 0x0224301C
	push {r3, r4}
	mov r2, #0x82
	lsl r2, r2, #2
	ldr r4, [r0, r2]
	add r3, r2, #4
	str r4, [r0, r3]
	str r1, [r0, r2]
	add r1, r2, #0
	mov r3, #0
	add r1, #8
	str r3, [r0, r1]
	add r1, r2, #0
	add r1, #0xc
	str r3, [r0, r1]
	add r1, r2, #0
	add r1, #0x10
	str r3, [r0, r1]
	add r1, r2, #0
	add r1, #0x14
	str r3, [r0, r1]
	ldr r1, [r0, r2]
	cmp r1, #0
	beq _0224306E
	sub r1, r1, #1
	lsl r1, r1, #2
	add r3, r0, r1
	add r1, r2, #0
	sub r1, #0x24
	ldrh r3, [r3, r1]
	add r1, r2, #0
	add r1, #8
	str r3, [r0, r1]
	ldr r1, [r0, r2]
	sub r1, r1, #1
	lsl r1, r1, #2
	add r3, r0, r1
	add r1, r2, #0
	sub r1, #0x22
	ldrh r1, [r3, r1]
	add r2, #0xc
	str r1, [r0, r2]
_0224306E:
	mov r2, #0x83
	lsl r2, r2, #2
	ldr r1, [r0, r2]
	cmp r1, #0
	beq _0224309C
	sub r1, r1, #1
	lsl r1, r1, #2
	add r3, r0, r1
	add r1, r2, #0
	sub r1, #0x28
	ldrh r3, [r3, r1]
	add r1, r2, #0
	add r1, #0xc
	str r3, [r0, r1]
	ldr r1, [r0, r2]
	sub r1, r1, #1
	lsl r1, r1, #2
	add r3, r0, r1
	add r1, r2, #0
	sub r1, #0x26
	ldrh r1, [r3, r1]
	add r2, #0x10
	str r1, [r0, r2]
_0224309C:
	pop {r3, r4}
	bx lr
	thumb_func_end ov40_0224301C

	thumb_func_start ov40_022430A0
ov40_022430A0: ; 0x022430A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	mov r2, #0xa6
	lsl r2, r2, #2
	add r4, r2, #0
	mov r1, #1
	add r3, r0, #0
	str r1, [r3, r2]
	mov r5, #0
	sub r4, #0xb4
	strh r5, [r3, r4]
	add r4, r2, #0
	add r4, #0x14
	ldr r5, [r3, r4]
	add r4, r2, #0
	sub r4, #0xb2
	strh r5, [r3, r4]
	add r4, r2, #0
	add r4, #0x14
	ldr r5, [r3, r4]
	add r4, r2, #0
	sub r4, #0xb0
	strh r5, [r3, r4]
	add r4, r2, #0
	add r4, #0x14
	ldr r5, [r3, r4]
	add r4, r2, #0
	add r4, #0x18
	ldr r3, [r3, r4]
	add r4, r2, #0
	add r5, r5, r3
	add r6, r2, #0
	sub r4, #0xae
	add r3, r0, #0
	strh r5, [r3, r4]
	add r4, r2, #0
	add r4, #0x14
	ldr r5, [r3, r4]
	add r4, r2, #0
	add r4, #0x18
	ldr r3, [r3, r4]
	add r4, r2, #0
	add r5, r5, r3
	sub r4, #0xac
	add r3, r0, #0
	strh r5, [r3, r4]
	add r4, r2, #0
	add r5, r2, #0
	add r4, #0x1c
	add r5, #0x14
	ldr r4, [r3, r4]
	ldr r3, [r3, r5]
	add r6, #0x18
	add r5, r0, #0
	ldr r5, [r5, r6]
	sub r2, #0xaa
	add r3, r3, r5
	add r4, r4, r3
	add r3, r0, #0
	str r0, [sp]
	strh r4, [r3, r2]
	bl ov40_0224301C
	mov r4, #0x81
	lsl r4, r4, #2
	add r3, r4, #0
	ldr r1, [sp]
	mov r0, #0
	add r3, #0xa8
_0224312A:
	ldr r2, [sp]
	add r0, r0, #1
	ldr r5, [r2, r4]
	ldr r2, [r1, r3]
	add r1, r1, #4
	add r5, r5, r2
	ldr r2, [sp]
	cmp r0, #3
	str r5, [r2, r4]
	blt _0224312A
	ldr r4, _02243208 ; =ov40_02245C28
	add r3, sp, #8
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	mov r1, #0xab
	ldr r0, [sp]
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	mov r2, #0
	cmp r0, #4
	beq _0224315E
	mov r2, #1
_0224315E:
	mov r0, #0xc
	mul r0, r2
	add r3, sp, #8
	add r0, r3, r0
	mov r2, #0x77
	ldr r5, [sp]
	mov r1, #0
	add r4, r0, #0
	lsl r2, r2, #2
_02243170:
	ldr r3, [r4]
	add r1, r1, #1
	strh r3, [r5, r2]
	add r4, r4, #4
	add r5, r5, #2
	cmp r1, #3
	blt _02243170
	sub r2, r1, #1
	lsl r2, r2, #2
	ldr r2, [r0, r2]
	ldr r0, [sp]
	lsl r1, r1, #1
	add r1, r0, r1
	mov r0, #0x77
	lsl r0, r0, #2
	strh r2, [r1, r0]
	ldr r1, [sp]
	mov r0, #0
	mov r4, #0xab
	mov r5, #0x15
	add r3, r0, #0
	add r2, r1, #0
	lsl r4, r4, #2
	lsl r5, r5, #4
_022431A0:
	ldr r6, [r1, r4]
	add r3, r3, #1
	add r0, r0, r6
	sub r6, r0, #1
	str r6, [r2, r5]
	add r1, r1, #4
	add r2, #0x1c
	cmp r3, #2
	blt _022431A0
	ldr r0, [sp]
	mov r5, #0
	mov r7, #0xab
	mov ip, r5
	str r0, [sp, #4]
	add r4, r0, #0
	lsl r7, r7, #2
_022431C0:
	mov r0, #0xab
	ldr r2, [sp, #4]
	lsl r0, r0, #2
	ldr r0, [r2, r0]
	mov r1, #0
	cmp r0, #0
	ble _022431EC
	mov r0, ip
	lsl r3, r0, #2
	ldr r0, [sp]
	add r2, r4, #0
	add r3, r0, r3
	mov r0, ip
	add r6, r0, #1
_022431DC:
	str r6, [r2, #4]
	ldr r0, [r3, r7]
	add r1, r1, #1
	add r2, #0x1c
	add r4, #0x1c
	add r5, r5, #1
	cmp r1, r0
	blt _022431DC
_022431EC:
	ldr r0, [sp, #4]
	ldr r1, [sp]
	add r0, r0, #4
	str r0, [sp, #4]
	mov r0, ip
	add r0, r0, #1
	mov ip, r0
	mov r0, #0x81
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	cmp r5, r0
	blt _022431C0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02243208: .word ov40_02245C28
	thumb_func_end ov40_022430A0

	thumb_func_start ov40_0224320C
ov40_0224320C: ; 0x0224320C
	mov r2, #0x7d
	lsl r2, r2, #2
	str r1, [r0, r2]
	mov r3, #0
	add r1, r2, #4
	str r3, [r0, r1]
	add r1, r2, #0
	add r1, #8
	str r3, [r0, r1]
	add r2, #0xc
	str r3, [r0, r2]
	bx lr
	thumb_func_end ov40_0224320C

	thumb_func_start ov40_02243224
ov40_02243224: ; 0x02243224
	push {r4, lr}
	add r4, r0, #0
	bl ov40_022430A0
	add r0, r4, #0
	bl ov40_022436D4
	add r0, r4, #0
	bl ov40_02243A28
	add r0, r4, #0
	bl ov40_02244060
	add r0, r4, #0
	bl ov40_02243C54
	add r0, r4, #0
	mov r1, #0
	bl ov40_022440A0
	add r0, r4, #0
	bl ov40_02243B48
	add r0, r4, #0
	bl ov40_02243D64
	add r0, r4, #0
	bl ov40_022441F8
	add r0, r4, #0
	mov r1, #1
	bl ov40_0224320C
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov40_02243224

	thumb_func_start ov40_0224326C
ov40_0224326C: ; 0x0224326C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02026CAC
	add r0, r4, #0
	bl ov40_02243B94
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov40_0224326C

	thumb_func_start ov40_02243284
ov40_02243284: ; 0x02243284
	push {r4, lr}
	mov r1, #0x7f
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r2, [r4, r1]
	cmp r2, #0
	bne _02243298
	add r0, r2, #1
	str r0, [r4, r1]
	b _022432A6
_02243298:
	bl ov40_0224395C
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02026CC4
_022432A6:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov40_02243284

	thumb_func_start ov40_022432AC
ov40_022432AC: ; 0x022432AC
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0x7f
	add r5, r0, #0
	lsl r1, r1, #2
	ldr r2, [r5, r1]
	cmp r2, #0
	beq _022432C2
	cmp r2, #1
	bne _022432C0
	b _02243428
_022432C0:
	b _022434D0
_022432C2:
	mov r1, #0
	add r2, r1, #0
	bl ov40_02243E80
	mov r0, #0x81
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r6, #0
	cmp r0, #0
	ble _02243364
	ldr r7, _0224352C ; =ov40_02245E74
	add r4, r5, #0
_022432DA:
	ldrb r0, [r4, #0x18]
	cmp r0, #0
	beq _02243356
	mov r1, #0x14
	mov r2, #0x16
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	bl sub_0200DED0
	ldrb r0, [r4, #0x18]
	sub r0, r0, #1
	strb r0, [r4, #0x18]
	mov r0, #0x21
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	cmp r6, r0
	blt _02243324
	mov r0, #0x85
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r6, r0
	bge _02243324
	ldrb r0, [r4, #0x19]
	lsl r1, r0, #2
	ldr r1, [r7, r1]
	ldr r0, [r4, #0xc]
	add r2, r1, #0
	bl sub_0200E024
	ldrb r0, [r4, #0x19]
	mov r1, #2
	add r0, r0, #1
	strb r0, [r4, #0x19]
	ldr r0, [r4, #0xc]
	bl sub_0200DF98
_02243324:
	mov r0, #0x86
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r6, r0
	blt _02243356
	mov r0, #0x87
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r6, r0
	bge _02243356
	ldrb r0, [r4, #0x19]
	ldr r1, _02243530 ; =ov40_02245E58
	lsl r2, r0, #2
	ldr r1, [r1, r2]
	ldr r0, [r4, #0xc]
	add r2, r1, #0
	bl sub_0200E024
	ldrb r0, [r4, #0x19]
	mov r1, #2
	add r0, r0, #1
	strb r0, [r4, #0x19]
	ldr r0, [r4, #0xc]
	bl sub_0200DF98
_02243356:
	mov r0, #0x81
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r6, r6, #1
	add r4, #0x1c
	cmp r6, r0
	blt _022432DA
_02243364:
	mov r7, #0x5a
	mov r6, #0
	add r4, r5, #0
	lsl r7, r7, #2
_0224336C:
	ldrb r0, [r4, r7]
	cmp r0, #0
	beq _02243394
	mov r1, #0x59
	ldr r2, _02243534 ; =0x00000166
	mov r0, #0x57
	lsl r1, r1, #2
	lsl r0, r0, #2
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, r0]
	bl sub_0200DED0
	mov r0, #0x5a
	lsl r0, r0, #2
	ldrb r0, [r4, r0]
	sub r1, r0, #1
	mov r0, #0x5a
	lsl r0, r0, #2
	strb r1, [r4, r0]
_02243394:
	add r6, r6, #1
	add r4, #0x1c
	cmp r6, #2
	blt _0224336C
	ldrb r0, [r5, #0x18]
	cmp r0, #0
	bne _0224341C
	mov r0, #0x21
	lsl r0, r0, #4
	ldr r6, [r5, r0]
	add r0, r0, #4
	ldr r0, [r5, r0]
	cmp r6, r0
	bge _022433DA
	mov r0, #0x1c
	mul r0, r6
	mov r7, #0x85
	add r4, r5, r0
	lsl r7, r7, #2
_022433BA:
	ldr r0, [r4]
	ldr r1, [r4, #8]
	bl ov40_02244054
	add r1, r0, #0
	ldr r0, [r4, #0xc]
	bl sub_0200DC4C
	ldr r0, [r4, #0xc]
	bl sub_0200DC18
	ldr r0, [r5, r7]
	add r6, r6, #1
	add r4, #0x1c
	cmp r6, r0
	blt _022433BA
_022433DA:
	mov r0, #0x86
	lsl r0, r0, #2
	ldr r6, [r5, r0]
	add r0, r0, #4
	ldr r0, [r5, r0]
	cmp r6, r0
	bge _02243412
	mov r0, #0x1c
	mul r0, r6
	mov r7, #0x87
	add r4, r5, r0
	lsl r7, r7, #2
_022433F2:
	ldr r0, [r4]
	ldr r1, [r4, #8]
	bl ov40_02244054
	add r1, r0, #0
	ldr r0, [r4, #0xc]
	bl sub_0200DC4C
	ldr r0, [r4, #0xc]
	bl sub_0200DC18
	ldr r0, [r5, r7]
	add r6, r6, #1
	add r4, #0x1c
	cmp r6, r0
	blt _022433F2
_02243412:
	mov r0, #0x7f
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	add r1, r1, #1
	str r1, [r5, r0]
_0224341C:
	mov r0, #2
	lsl r0, r0, #8
	ldr r1, [r5, r0]
	add r1, r1, #1
	str r1, [r5, r0]
	b _02243526
_02243428:
	add r0, r1, #0
	add r0, #0x14
	add r1, #0x18
	ldr r6, [r5, r0]
	ldr r0, [r5, r1]
	cmp r6, r0
	bge _0224346E
	mov r0, #0x1c
	mul r0, r6
	ldr r7, _0224352C ; =ov40_02245E74
	add r4, r5, r0
_0224343E:
	ldrb r0, [r4, #0x19]
	cmp r0, #6
	bne _0224344E
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl sub_0200DF98
	b _02243460
_0224344E:
	lsl r1, r0, #2
	ldr r1, [r7, r1]
	ldr r0, [r4, #0xc]
	add r2, r1, #0
	bl sub_0200E024
	ldrb r0, [r4, #0x19]
	add r0, r0, #1
	strb r0, [r4, #0x19]
_02243460:
	mov r0, #0x85
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r6, r6, #1
	add r4, #0x1c
	cmp r6, r0
	blt _0224343E
_0224346E:
	mov r0, #0x86
	lsl r0, r0, #2
	ldr r6, [r5, r0]
	add r0, r0, #4
	ldr r0, [r5, r0]
	cmp r6, r0
	bge _022434B4
	mov r0, #0x1c
	mul r0, r6
	ldr r7, _02243530 ; =ov40_02245E58
	add r4, r5, r0
_02243484:
	ldrb r0, [r4, #0x19]
	cmp r0, #6
	bne _02243494
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl sub_0200DF98
	b _022434A6
_02243494:
	lsl r1, r0, #2
	ldr r1, [r7, r1]
	ldr r0, [r4, #0xc]
	add r2, r1, #0
	bl sub_0200E024
	ldrb r0, [r4, #0x19]
	add r0, r0, #1
	strb r0, [r4, #0x19]
_022434A6:
	mov r0, #0x87
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r6, r6, #1
	add r4, #0x1c
	cmp r6, r0
	blt _02243484
_022434B4:
	mov r1, #2
	lsl r1, r1, #8
	ldr r0, [r5, r1]
	add r0, r0, #1
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	cmp r0, #6
	bne _02243526
	sub r0, r1, #4
	ldr r0, [r5, r0]
	add r2, r0, #1
	sub r0, r1, #4
	str r2, [r5, r0]
	b _02243526
_022434D0:
	bl ov40_022441F8
	mov r1, #0xa9
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	cmp r0, #0
	bne _022434F2
	sub r1, r1, #4
	ldr r1, [r5, r1]
	add r0, r5, #0
	bl ov40_022439CC
	add r1, r0, #0
	add r0, r5, #0
	bl ov40_02243EB0
	b _02243504
_022434F2:
	sub r1, r1, #4
	ldr r1, [r5, r1]
	add r0, r5, #0
	bl ov40_022439F4
	add r1, r0, #0
	add r0, r5, #0
	bl ov40_02243EB0
_02243504:
	mov r0, #0x82
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02243518
	add r0, r5, #0
	mov r1, #0
	mov r2, #1
	bl ov40_02243E80
_02243518:
	add r0, r5, #0
	bl ov40_022439B8
	add r0, r5, #0
	mov r1, #1
	bl ov40_0224320C
_02243526:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224352C: .word ov40_02245E74
_02243530: .word ov40_02245E58
_02243534: .word 0x00000166
	thumb_func_end ov40_022432AC

	thumb_func_start ov40_02243538
ov40_02243538: ; 0x02243538
	push {r3, r4, r5, lr}
	mov r1, #0x7d
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	lsl r2, r1, #2
	ldr r1, _02243558 ; =ov40_02245C18
	ldr r1, [r1, r2]
	blx r1
	add r5, r0, #0
	bne _02243554
	add r0, r4, #0
	bl ov40_02243F88
_02243554:
	add r0, r5, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02243558: .word ov40_02245C18
	thumb_func_end ov40_02243538

	thumb_func_start ov40_0224355C
ov40_0224355C: ; 0x0224355C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r0, #0
	mov r0, #0x64
	mov r1, #0x6d
	bl String_ctor
	mov r1, #0xb2
	str r0, [sp, #4]
	mov r0, #1
	lsl r1, r1, #2
	str r0, [r7, r1]
	mov r6, #0
	add r0, r1, #4
	str r6, [r7, r0]
	add r0, r1, #0
	add r0, #8
	sub r1, #0xc4
	str r6, [r7, r0]
	ldr r0, [r7, r1]
	cmp r0, #0
	ble _022435FC
	mov r0, #0xb3
	lsl r0, r0, #2
	add r4, r7, #0
	add r5, r7, r0
_02243590:
	ldr r0, [r4]
	cmp r0, #0
	bne _022435A8
	mov r0, #1
	str r0, [r4]
	ldr r1, [r4, #8]
	bl ov40_02244054
	add r1, r0, #0
	ldr r0, [r4, #0xc]
	bl sub_0200DC4C
_022435A8:
	ldr r0, [r4]
	sub r0, r0, #1
	str r0, [sp, #8]
	cmp r6, #0
	beq _022435C2
	ldr r0, [r5]
	ldr r1, [r5, #4]
	mov r2, #0xa
	mov r3, #0
	bl _ll_mul
	str r0, [r5]
	str r1, [r5, #4]
_022435C2:
	ldr r2, [r5]
	ldr r1, [sp, #8]
	ldr r0, [r5, #4]
	add r2, r2, r1
	ldr r1, _02243610 ; =0x00000000
	str r2, [r5]
	adc r0, r1
	str r0, [r5, #4]
	mov r0, #1
	str r0, [sp]
	mov r2, #1
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	add r3, r2, #0
	bl String16_FormatInteger
	mov r0, #0xb
	lsl r0, r0, #6
	ldr r0, [r7, r0]
	ldr r1, [sp, #4]
	bl StringCat
	mov r0, #0x81
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	add r6, r6, #1
	add r4, #0x1c
	cmp r6, r0
	blt _02243590
_022435FC:
	ldr r0, [sp, #4]
	bl String_dtor
	add r0, r7, #0
	mov r1, #3
	bl ov40_0224320C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02243610: .word 0x00000000
	thumb_func_end ov40_0224355C

	thumb_func_start ov40_02243614
ov40_02243614: ; 0x02243614
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x82
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	cmp r1, #0
	bne _02243650
	sub r1, r0, #4
	ldr r1, [r5, r1]
	sub r2, r1, #1
	add r1, r0, #0
	sub r1, #0x80
	str r2, [r5, r1]
	add r1, r0, #0
	sub r1, #0x80
	ldr r2, [r5, r1]
	mov r1, #0x1c
	mul r1, r2
	add r1, r5, r1
	ldr r3, [r1, #4]
	add r1, r0, #0
	mov r2, #1
	add r1, #0x94
	str r2, [r5, r1]
	add r1, r0, #0
	add r1, #0x98
	str r3, [r5, r1]
	add r0, #0x9c
	str r2, [r5, r0]
	pop {r3, r4, r5, r6, r7, pc}
_02243650:
	sub r0, #0x80
	ldr r6, [r5, r0]
	mov r0, #0x1c
	add r4, r6, #0
	mul r4, r0
	mov r0, #0
	str r0, [r5, r4]
	add r1, r5, r4
	ldr r0, [r5, r4]
	ldr r1, [r1, #8]
	bl ov40_02244054
	add r1, r0, #0
	add r0, r5, r4
	ldr r0, [r0, #0xc]
	bl sub_0200DC4C
	add r0, r5, r4
	ldr r7, [r0, #4]
	cmp r6, #0
	ble _022436C0
	sub r1, r6, #1
	mov r0, #0x1c
	add r4, r1, #0
	mul r4, r0
	add r1, r5, r4
	ldr r0, [r5, r4]
	ldr r1, [r1, #8]
	bl ov40_02244054
	add r1, r0, #0
	add r0, r5, r4
	ldr r0, [r0, #0xc]
	bl sub_0200DC4C
	add r0, r5, r4
	ldr r3, [r0, #4]
	cmp r7, r3
	beq _022436B0
	mov r1, #0xa7
	lsl r1, r1, #2
	mov r2, #1
	str r2, [r5, r1]
	add r0, r1, #4
	str r3, [r5, r0]
	add r1, #8
	str r2, [r5, r1]
	pop {r3, r4, r5, r6, r7, pc}
_022436B0:
	mov r0, #0xa7
	mov r1, #2
	lsl r0, r0, #2
	str r1, [r5, r0]
	sub r1, r6, #1
	add r0, r0, #4
	str r1, [r5, r0]
	pop {r3, r4, r5, r6, r7, pc}
_022436C0:
	mov r0, #0xb2
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r5, #0
	mov r1, #3
	bl ov40_0224320C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov40_02243614

	thumb_func_start ov40_022436D4
ov40_022436D4: ; 0x022436D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x64
	mov r1, #0x8e
	add r4, r0, #0
	lsl r1, r1, #2
	mov r0, #0
	add r1, r4, r1
	add r2, r4, #0
_022436E4:
	add r0, r0, #1
	str r1, [r2, #0x10]
	add r1, r1, #4
	add r2, #0x1c
	cmp r0, #0xc
	blt _022436E4
	ldr r5, _022437AC ; =ov40_02245C40
	add r3, sp, #4
	mov r2, #0x30
_022436F6:
	ldrh r1, [r5]
	add r5, r5, #2
	strh r1, [r3]
	add r3, r3, #2
	sub r2, r2, #1
	bne _022436F6
	cmp r0, #0x18
	bge _02243764
	add r2, sp, #4
	lsl r1, r0, #3
	add r1, r2, r1
	lsl r2, r0, #2
	mov r7, #0x5b
	ldr r3, _022437B0 ; =0x0000023B
	add r2, r4, r2
	mvn r7, r7
_02243716:
	mov r5, #0x5d
	mov r6, #0x59
	mvn r5, r5
	mvn r6, r6
	ldrsh r5, [r1, r5]
	ldrsh r6, [r1, r6]
	add r0, r0, #1
	sub r6, r5, r6
	mov r5, #0x8e
	lsl r5, r5, #2
	strb r6, [r2, r5]
	mov r5, #0x5f
	mov r6, #0x5b
	mvn r5, r5
	mvn r6, r6
	ldrsh r5, [r1, r5]
	ldrsh r6, [r1, r6]
	sub r6, r5, r6
	ldr r5, _022437B4 ; =0x0000023A
	strb r6, [r2, r5]
	mov r5, #0x5d
	mov r6, #0x59
	mvn r5, r5
	mvn r6, r6
	ldrsh r5, [r1, r5]
	ldrsh r6, [r1, r6]
	add r6, r5, r6
	ldr r5, _022437B8 ; =0x00000239
	strb r6, [r2, r5]
	mov r5, #0x5f
	mvn r5, r5
	ldrsh r6, [r1, r5]
	ldrsh r5, [r1, r7]
	add r1, #8
	add r5, r6, r5
	strb r5, [r2, r3]
	add r2, r2, #4
	cmp r0, #0x18
	blt _02243716
_02243764:
	mov r0, #0x29
	lsl r0, r0, #4
	mov r3, #0x98
	strb r3, [r4, r0]
	mov r2, #0x20
	add r1, r0, #2
	strb r2, [r4, r1]
	mov r2, #0xb8
	add r1, r0, #1
	strb r2, [r4, r1]
	mov r1, #0x80
	add r5, r0, #3
	strb r1, [r4, r5]
	add r5, r0, #4
	strb r3, [r4, r5]
	add r3, r0, #6
	strb r1, [r4, r3]
	add r1, r0, #5
	strb r2, [r4, r1]
	add r1, r0, #7
	mov r2, #0xe0
	strb r2, [r4, r1]
	mov r1, #0x6d
	sub r0, #0x58
	str r1, [sp]
	ldr r2, _022437BC ; =ov40_022437C0
	add r0, r4, r0
	mov r1, #0x18
	add r3, r4, #0
	bl sub_02026C44
	mov r1, #0x8d
	lsl r1, r1, #2
	str r0, [r4, r1]
	add sp, #0x64
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022437AC: .word ov40_02245C40
_022437B0: .word 0x0000023B
_022437B4: .word 0x0000023A
_022437B8: .word 0x00000239
_022437BC: .word ov40_022437C0
	thumb_func_end ov40_022436D4

	thumb_func_start ov40_022437C0
ov40_022437C0: ; 0x022437C0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r2, #0
	mov r2, #0x7d
	lsl r2, r2, #2
	add r5, r0, #0
	ldr r0, [r4, r2]
	cmp r0, #1
	beq _022437D2
	b _02243950
_022437D2:
	add r0, r2, #0
	add r0, #0xa4
	ldr r0, [r4, r0]
	cmp r0, #1
	beq _022437E2
	mov r0, #1
	add r2, #0xa4
	str r0, [r4, r2]
_022437E2:
	cmp r1, #0
	beq _022437E8
	b _02243950
_022437E8:
	cmp r5, #0xb
	bhi _0224381C
	mov r0, #0x1c
	mul r0, r5
	add r2, r4, r0
	ldr r0, [r2, #8]
	cmp r0, #1
	bne _02243806
	mov r0, #0xa7
	mov r1, #2
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r0, #4
	str r5, [r4, r0]
	b _02243814
_02243806:
	mov r0, #0xa7
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r4, r0]
	ldr r1, [r2, #4]
	add r0, r0, #4
	str r1, [r4, r0]
_02243814:
	ldr r0, _02243954 ; =0x0000057B
	bl PlaySE
	pop {r3, r4, r5, r6, r7, pc}
_0224381C:
	cmp r5, #0x16
	bne _02243830
	mov r0, #0x6e
	mov r1, #0
	lsl r0, r0, #2
	strh r1, [r4, r0]
	mov r1, #2
	add r0, r0, #2
	strh r1, [r4, r0]
	b _02243862
_02243830:
	cmp r5, #0x17
	bne _02243844
	mov r0, #0x6e
	mov r1, #3
	lsl r0, r0, #2
	strh r1, [r4, r0]
	mov r1, #2
	add r0, r0, #2
	strh r1, [r4, r0]
	b _02243862
_02243844:
	add r0, r5, #0
	sub r0, #0xc
	mov r1, #5
	bl _u32_div_f
	mov r0, #0x6e
	lsl r0, r0, #2
	strh r1, [r4, r0]
	add r0, r5, #0
	sub r0, #0xc
	mov r1, #5
	bl _u32_div_f
	ldr r1, _02243958 ; =0x000001BA
	strh r0, [r4, r1]
_02243862:
	cmp r5, #0xc
	blo _02243934
	cmp r5, #0x15
	bhi _02243934
	mov r0, #0x82
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02243950
	ldr r0, _02243954 ; =0x0000057B
	bl PlaySE
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r7, [r4, r0]
	mov r0, #0x1c
	add r6, r7, #0
	mul r6, r0
	add r0, r5, #0
	sub r0, #0xb
	str r0, [r4, r6]
	add r1, r4, r6
	ldr r0, [r4, r6]
	ldr r1, [r1, #8]
	bl ov40_02244054
	add r1, r0, #0
	add r0, r4, r6
	ldr r0, [r0, #0xc]
	bl sub_0200DC4C
	mov r1, #1
	add r0, r4, #0
	add r2, r1, #0
	bl ov40_02243E80
	sub r5, #0xc
	add r0, r4, #0
	add r1, r5, #0
	bl ov40_02243EEC
	add r0, r4, #0
	mov r1, #1
	mov r2, #0
	bl ov40_02243E80
	add r0, r4, #0
	mov r1, #2
	mov r2, #1
	bl ov40_02243E80
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #2
	bl ov40_02243F38
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #3
	bl sub_0200DC4C
	add r0, r4, r6
	ldr r2, [r0, #4]
	mov r0, #0x81
	lsl r0, r0, #2
	ldr r3, [r4, r0]
	add r1, r7, #1
	cmp r1, r3
	bne _02243904
	add r1, r0, #0
	mov r2, #1
	add r1, #0x98
	str r2, [r4, r1]
	add r1, r0, #0
	mov r2, #0
	add r1, #0x9c
	str r2, [r4, r1]
	add r0, #0xa0
	str r2, [r4, r0]
	pop {r3, r4, r5, r6, r7, pc}
_02243904:
	mov r3, #0x1c
	mul r3, r1
	add r3, r4, r3
	ldr r3, [r3, #4]
	cmp r2, r3
	beq _02243926
	add r1, r0, #0
	mov r2, #1
	add r1, #0x98
	str r2, [r4, r1]
	add r1, r0, #0
	add r1, #0x9c
	str r3, [r4, r1]
	mov r1, #0
	add r0, #0xa0
	str r1, [r4, r0]
	pop {r3, r4, r5, r6, r7, pc}
_02243926:
	add r2, r0, #0
	mov r3, #2
	add r2, #0x98
	str r3, [r4, r2]
	add r0, #0x9c
	str r1, [r4, r0]
	pop {r3, r4, r5, r6, r7, pc}
_02243934:
	cmp r5, #0x16
	ldr r0, _02243954 ; =0x0000057B
	bne _02243946
	bl PlaySE
	add r0, r4, #0
	bl ov40_02243614
	pop {r3, r4, r5, r6, r7, pc}
_02243946:
	bl PlaySE
	add r0, r4, #0
	bl ov40_0224355C
_02243950:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02243954: .word 0x0000057B
_02243958: .word 0x000001BA
	thumb_func_end ov40_022437C0

	thumb_func_start ov40_0224395C
ov40_0224395C: ; 0x0224395C
	push {r4, lr}
	mov r1, #0xa7
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r2, [r4, r1]
	cmp r2, #2
	bgt _0224397A
	cmp r2, #0
	blt _022439B4
	beq _022439B4
	cmp r2, #1
	beq _0224397E
	cmp r2, #2
	beq _022439A6
	pop {r4, pc}
_0224397A:
	cmp r2, #0xff
	pop {r4, pc}
_0224397E:
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl ov40_0224301C
	add r0, r4, #0
	bl ov40_02244060
	add r0, r4, #0
	mov r1, #1
	bl ov40_022440A0
	add r0, r4, #0
	mov r1, #2
	bl ov40_0224320C
	mov r0, #0xa7
	mov r1, #0xff
	lsl r0, r0, #2
	str r1, [r4, r0]
	pop {r4, pc}
_022439A6:
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl ov40_02243EB0
	add r0, r4, #0
	bl ov40_022439B8
_022439B4:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov40_0224395C

	thumb_func_start ov40_022439B8
ov40_022439B8: ; 0x022439B8
	mov r2, #0xa7
	lsl r2, r2, #2
	mov r3, #0
	str r3, [r0, r2]
	add r1, r2, #4
	str r3, [r0, r1]
	add r2, #8
	str r3, [r0, r2]
	bx lr
	.balign 4, 0
	thumb_func_end ov40_022439B8

	thumb_func_start ov40_022439CC
ov40_022439CC: ; 0x022439CC
	push {r3, r4}
	mov r2, #0x81
	lsl r2, r2, #2
	ldr r4, [r0, r2]
	mov r3, #0
	cmp r4, #0
	ble _022439EE
_022439DA:
	ldr r2, [r0, #4]
	cmp r1, r2
	bne _022439E6
	add r0, r3, #0
	pop {r3, r4}
	bx lr
_022439E6:
	add r3, r3, #1
	add r0, #0x1c
	cmp r3, r4
	blt _022439DA
_022439EE:
	mov r0, #0
	pop {r3, r4}
	bx lr
	thumb_func_end ov40_022439CC

	thumb_func_start ov40_022439F4
ov40_022439F4: ; 0x022439F4
	push {r3, r4, r5, r6}
	mov r2, #0x81
	lsl r2, r2, #2
	ldr r6, [r0, r2]
	mov r5, #0
	add r4, r5, #0
	cmp r6, #0
	ble _02243A22
	mov r2, #1
_02243A06:
	ldr r3, [r0, #4]
	cmp r1, r3
	bne _02243A10
	add r5, r2, #0
	b _02243A1A
_02243A10:
	cmp r5, #1
	bne _02243A1A
	sub r0, r4, #1
	pop {r3, r4, r5, r6}
	bx lr
_02243A1A:
	add r4, r4, #1
	add r0, #0x1c
	cmp r4, r6
	blt _02243A06
_02243A22:
	sub r0, r6, #1
	pop {r3, r4, r5, r6}
	bx lr
	thumb_func_end ov40_022439F4

	thumb_func_start ov40_02243A28
ov40_02243A28: ; 0x02243A28
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	mov r2, #0x89
	lsl r2, r2, #2
	add r1, r2, #4
	ldr r5, [r0, r1]
	add r1, r2, #0
	add r1, #0xc
	ldr r1, [r0, r1]
	ldr r6, [r0, r2]
	str r1, [sp, #0x18]
	add r1, r2, #0
	add r1, #8
	ldr r7, [r0, r1]
	sub r1, r2, #4
	ldr r4, [r0, r1]
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #0x36
	add r2, r7, #0
	mov r3, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #0x2b
	add r2, r7, #0
	mov r3, #3
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	str r4, [sp]
	mov r0, #0x2c
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	mov r0, #0xfa
	lsl r0, r0, #2
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	mov r1, #2
	add r2, r6, #0
	add r3, r5, #0
	bl sub_0200D68C
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0xfa
	lsl r0, r0, #2
	str r0, [sp, #8]
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	mov r3, #0x28
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	mov r0, #0xfa
	lsl r0, r0, #2
	str r0, [sp, #4]
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	mov r3, #0x29
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	mov r0, #0xfa
	lsl r0, r0, #2
	str r0, [sp, #4]
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	mov r3, #0x2a
	bl sub_0200D71C
	str r4, [sp]
	mov r0, #0x58
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _02243B44 ; =0x000003E9
	mov r1, #2
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	add r2, r6, #0
	add r3, r5, #0
	bl sub_0200D68C
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _02243B44 ; =0x000003E9
	add r1, r5, #0
	str r0, [sp, #8]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #0x57
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	ldr r0, _02243B44 ; =0x000003E9
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #0x55
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _02243B44 ; =0x000003E9
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #0x56
	bl sub_0200D71C
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02243B44: .word 0x000003E9
	thumb_func_end ov40_02243A28

	thumb_func_start ov40_02243B48
ov40_02243B48: ; 0x02243B48
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x81
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r6, #0
	cmp r0, #0
	ble _02243B74
	mov r7, #0x81
	add r4, r5, #0
	lsl r7, r7, #2
_02243B5E:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _02243B6A
	mov r1, #1
	bl sub_0200DCE8
_02243B6A:
	ldr r0, [r5, r7]
	add r6, r6, #1
	add r4, #0x1c
	cmp r6, r0
	blt _02243B5E
_02243B74:
	mov r6, #0x57
	mov r4, #0
	mov r7, #1
	lsl r6, r6, #2
_02243B7C:
	ldr r0, [r5, r6]
	cmp r0, #0
	beq _02243B88
	add r1, r7, #0
	bl sub_0200DCE8
_02243B88:
	add r4, r4, #1
	add r5, #0x1c
	cmp r4, #2
	blt _02243B7C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov40_02243B48

	thumb_func_start ov40_02243B94
ov40_02243B94: ; 0x02243B94
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r0, #0x81
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r4, #0
	cmp r0, #0
	ble _02243BBA
	mov r7, #0x81
	add r5, r6, #0
	lsl r7, r7, #2
_02243BAA:
	ldr r0, [r5, #0xc]
	bl sub_0200D9DC
	ldr r0, [r6, r7]
	add r4, r4, #1
	add r5, #0x1c
	cmp r4, r0
	blt _02243BAA
_02243BBA:
	mov r7, #0x57
	mov r5, #0
	add r4, r6, #0
	lsl r7, r7, #2
_02243BC2:
	ldr r0, [r4, r7]
	bl sub_0200D9DC
	add r5, r5, #1
	add r4, #0x1c
	cmp r5, #2
	blt _02243BC2
	mov r7, #0x65
	mov r5, #0
	add r4, r6, #0
	lsl r7, r7, #2
_02243BD8:
	ldr r0, [r4, r7]
	bl sub_0200D9DC
	add r5, r5, #1
	add r4, #0x1c
	cmp r5, #3
	blt _02243BD8
	mov r0, #0x8a
	lsl r0, r0, #2
	mov r1, #0xfa
	ldr r0, [r6, r0]
	lsl r1, r1, #2
	bl sub_0200D958
	mov r0, #0x8a
	lsl r0, r0, #2
	mov r1, #0xfa
	ldr r0, [r6, r0]
	lsl r1, r1, #2
	bl sub_0200D968
	mov r0, #0x8a
	lsl r0, r0, #2
	mov r1, #0xfa
	ldr r0, [r6, r0]
	lsl r1, r1, #2
	bl sub_0200D978
	mov r0, #0x8a
	lsl r0, r0, #2
	mov r1, #0xfa
	ldr r0, [r6, r0]
	lsl r1, r1, #2
	bl sub_0200D988
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	ldr r1, _02243C50 ; =0x000003E9
	bl sub_0200D958
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	ldr r1, _02243C50 ; =0x000003E9
	bl sub_0200D968
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	ldr r1, _02243C50 ; =0x000003E9
	bl sub_0200D978
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	ldr r1, _02243C50 ; =0x000003E9
	bl sub_0200D988
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02243C50: .word 0x000003E9
	thumb_func_end ov40_02243B94

	thumb_func_start ov40_02243C54
ov40_02243C54: ; 0x02243C54
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r1, [sp]
	add r2, r0, #4
	ldr r1, [r1, r0]
	ldr r7, [sp, #0xc]
	str r1, [sp, #8]
	ldr r1, [sp]
	ldr r1, [r1, r2]
	add r2, sp, #0x10
	str r1, [sp, #4]
	add r1, r0, #0
	sub r1, #0xf4
	strh r1, [r2]
	mov r1, #0xe0
	strh r1, [r2, #2]
	ldr r1, [sp, #0xc]
	sub r0, #0x20
	strh r1, [r2, #4]
	strh r1, [r2, #6]
	mov r1, #0xa
	str r1, [sp, #0x18]
	ldr r1, [sp, #0xc]
	mov r2, #1
	str r1, [sp, #0x3c]
	str r1, [sp, #0x40]
	str r1, [sp, #0x1c]
	mov r1, #0xfa
	lsl r1, r1, #2
	str r1, [sp, #0x24]
	str r1, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r1, [sp, #0x30]
	sub r1, r2, #2
	str r1, [sp, #0x34]
	str r1, [sp, #0x38]
	ldr r1, [sp]
	str r2, [sp, #0x20]
	ldr r0, [r1, r0]
	add r0, r0, #2
	cmp r0, #0
	ble _02243D60
	add r4, r1, #0
	mov r6, #0x4c
	add r5, r1, #0
_02243CB8:
	mov r0, #0x15
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	ldr r0, [sp, #0xc]
	add r0, r0, r1
	add r0, r0, #1
	cmp r7, r0
	add r2, sp, #0x10
	bne _02243D12
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	bl sub_0200D734
	mov r1, #0x57
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r1, #0
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DCE8
	mov r0, #0x57
	lsl r0, r0, #2
	lsl r1, r6, #0x10
	ldr r0, [r4, r0]
	asr r1, r1, #0x10
	mov r2, #0x18
	bl sub_0200DDB8
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x16
	bl sub_0200DC4C
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200DC18
	ldr r0, [sp, #0xc]
	add r4, #0x1c
	add r0, r0, #1
	str r0, [sp, #0xc]
	b _02243D4E
_02243D12:
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	bl sub_0200D734
	str r0, [r5, #0xc]
	mov r1, #0
	bl sub_0200DCE8
	lsl r1, r6, #0x10
	ldr r0, [r5, #0xc]
	asr r1, r1, #0x10
	mov r2, #0x18
	bl sub_0200DDB8
	ldr r0, [r5]
	ldr r1, [r5, #8]
	bl ov40_02244054
	add r1, r0, #0
	ldr r0, [r5, #0xc]
	bl sub_0200DC4C
	ldr r0, [r5, #0xc]
	mov r1, #0
	bl sub_0200DF98
	ldr r0, [r5, #0xc]
	bl sub_0200DC18
	add r5, #0x1c
_02243D4E:
	mov r0, #0x81
	ldr r1, [sp]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	add r7, r7, #1
	add r0, r0, #2
	add r6, #8
	cmp r7, r0
	blt _02243CB8
_02243D60:
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov40_02243C54

	thumb_func_start ov40_02243D64
ov40_02243D64: ; 0x02243D64
	push {r3, r4, r5, r6, lr}
	sub sp, #0x34
	add r5, r0, #0
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r6, [r5, r0]
	add r0, r0, #4
	ldr r4, [r5, r0]
	mov r2, #0
	add r0, sp, #0
	strh r2, [r0]
	strh r2, [r0, #2]
	strh r2, [r0, #4]
	strh r2, [r0, #6]
	ldr r0, _02243E7C ; =0x000003E9
	mov r1, #1
	str r0, [sp, #0x14]
	str r0, [sp, #0x18]
	str r0, [sp, #0x1c]
	str r0, [sp, #0x20]
	sub r0, r1, #2
	str r1, [sp, #0x10]
	str r2, [sp, #8]
	str r2, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r2, [sp, #0xc]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, r6, #0
	add r1, r4, #0
	add r2, sp, #0
	bl sub_0200D734
	mov r1, #0x65
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r6, #0
	add r1, r4, #0
	add r2, sp, #0
	bl sub_0200D734
	mov r1, #0x1b
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r6, #0
	add r1, r4, #0
	add r2, sp, #0
	bl sub_0200D734
	mov r1, #0x73
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r5, #0
	mov r1, #0
	bl ov40_02243EB0
	mov r0, #0x65
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_0200DC4C
	mov r0, #0x65
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200DC18
	mov r2, #0x6e
	lsl r2, r2, #2
	mov r1, #0
	strh r1, [r5, r2]
	add r0, r2, #2
	strh r1, [r5, r0]
	mov r0, #1
	sub r2, #0x14
	str r0, [r5, r2]
	add r0, r5, #0
	bl ov40_02243EEC
	mov r1, #0x1b
	lsl r1, r1, #4
	ldr r0, [r5, r1]
	sub r1, #0xc
	ldr r1, [r5, r1]
	bl sub_0200DC4C
	mov r0, #0x1b
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_0200DC18
	mov r0, #0x1b
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_0200E0FC
	mov r2, #0x75
	lsl r2, r2, #2
	mov r1, #0
	strh r1, [r5, r2]
	add r0, r2, #2
	strh r1, [r5, r0]
	mov r0, #1
	sub r2, #0x14
	str r0, [r5, r2]
	add r0, r5, #0
	bl ov40_02243EEC
	mov r1, #0x73
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	sub r1, #0xc
	ldr r1, [r5, r1]
	bl sub_0200DC4C
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200DC18
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_0200E0FC
	add r0, r5, #0
	mov r1, #1
	mov r2, #0
	bl ov40_02243E80
	add r0, r5, #0
	mov r1, #2
	mov r2, #0
	bl ov40_02243E80
	add sp, #0x34
	pop {r3, r4, r5, r6, pc}
	nop
_02243E7C: .word 0x000003E9
	thumb_func_end ov40_02243D64

	thumb_func_start ov40_02243E80
ov40_02243E80: ; 0x02243E80
	push {r3, lr}
	cmp r2, #1
	bne _02243E9A
	mov r2, #0x1c
	mul r2, r1
	add r1, r0, r2
	mov r0, #0x65
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #1
	bl sub_0200DCE8
	pop {r3, pc}
_02243E9A:
	mov r2, #0x1c
	mul r2, r1
	add r1, r0, r2
	mov r0, #0x65
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0200DCE8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov40_02243E80

	thumb_func_start ov40_02243EB0
ov40_02243EB0: ; 0x02243EB0
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #0x1c
	mul r0, r1
	add r0, r4, r0
	mov r2, #0x62
	ldr r0, [r0, #0xc]
	lsl r2, r2, #2
	str r1, [r4, r2]
	add r1, sp, #0
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	mov r0, #0x65
	lsl r0, r0, #2
	add r3, sp, #0
	mov r2, #0
	ldrsh r2, [r3, r2]
	mov r1, #2
	ldrsh r1, [r3, r1]
	add r2, #0x10
	lsl r2, r2, #0x10
	ldr r0, [r4, r0]
	asr r2, r2, #0x10
	bl sub_0200DDB8
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov40_02243EB0

	thumb_func_start ov40_02243EEC
ov40_02243EEC: ; 0x02243EEC
	push {r4, lr}
	add r1, #0xc
	mov r2, #0x1b
	add r3, r0, #0
	lsl r2, r2, #4
	lsl r1, r1, #2
	ldr r0, [r3, r2]
	add r3, r3, r1
	add r1, r2, #0
	add r1, #0x8a
	ldrb r4, [r3, r1]
	add r1, r2, #0
	add r1, #0x8b
	ldrb r1, [r3, r1]
	add r4, r4, r1
	lsr r1, r4, #0x1f
	add r1, r4, r1
	add r4, r2, #0
	add r4, #0x88
	add r2, #0x89
	lsl r1, r1, #0xf
	asr r1, r1, #0x10
	lsl r1, r1, #0x10
	ldrb r4, [r3, r4]
	ldrb r2, [r3, r2]
	asr r1, r1, #0x10
	add r3, r4, r2
	lsr r2, r3, #0x1f
	add r2, r3, r2
	lsl r2, r2, #0xf
	asr r2, r2, #0x10
	sub r2, #8
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl sub_0200DDB8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov40_02243EEC

	thumb_func_start ov40_02243F38
ov40_02243F38: ; 0x02243F38
	push {r4, lr}
	add r3, r0, #0
	mov r0, #0x1c
	mul r0, r2
	add r1, #0xc
	mov r2, #0x65
	lsl r1, r1, #2
	add r0, r3, r0
	lsl r2, r2, #2
	add r3, r3, r1
	add r1, r2, #0
	add r1, #0xa6
	ldrb r4, [r3, r1]
	add r1, r2, #0
	add r1, #0xa7
	ldrb r1, [r3, r1]
	ldr r0, [r0, r2]
	add r4, r4, r1
	lsr r1, r4, #0x1f
	add r1, r4, r1
	add r4, r2, #0
	add r4, #0xa4
	add r2, #0xa5
	lsl r1, r1, #0xf
	asr r1, r1, #0x10
	lsl r1, r1, #0x10
	ldrb r4, [r3, r4]
	ldrb r2, [r3, r2]
	asr r1, r1, #0x10
	add r3, r4, r2
	lsr r2, r3, #0x1f
	add r2, r3, r2
	lsl r2, r2, #0xf
	asr r2, r2, #0x10
	sub r2, #8
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl sub_0200DDB8
	pop {r4, pc}
	thumb_func_end ov40_02243F38

	thumb_func_start ov40_02243F88
ov40_02243F88: ; 0x02243F88
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x65
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200DC18
	mov r0, #0x1b
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_0200DC18
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200DC18
	add r4, r5, #0
	mov r7, #0x65
	mov r6, #1
	add r4, #0x1c
	lsl r7, r7, #2
_02243FB4:
	ldr r0, [r4, r7]
	bl sub_0200DC64
	cmp r0, #3
	bne _02244008
	mov r0, #0x65
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200DCA0
	cmp r0, #0
	bne _0224404A
	mov r0, #0x65
	mov r1, #0x62
	lsl r0, r0, #2
	lsl r1, r1, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	bl sub_0200DC4C
	mov r0, #0xa6
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #1
	bne _02243FF2
	add r0, r5, #0
	mov r1, #1
	mov r2, #0
	bl ov40_02243E80
	b _02243FFC
_02243FF2:
	mov r1, #1
	add r0, r5, #0
	add r2, r1, #0
	bl ov40_02243E80
_02243FFC:
	add r0, r5, #0
	mov r1, #2
	mov r2, #0
	bl ov40_02243E80
	b _0224404A
_02244008:
	mov r1, #0x62
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	cmp r0, r1
	beq _0224401C
	mov r0, #0x65
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200DC4C
_0224401C:
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200DC64
	cmp r0, #3
	beq _0224404A
	mov r0, #0xa6
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #1
	bne _02244040
	add r0, r5, #0
	mov r1, #1
	mov r2, #0
	bl ov40_02243E80
	b _0224404A
_02244040:
	mov r1, #1
	add r0, r5, #0
	add r2, r1, #0
	bl ov40_02243E80
_0224404A:
	add r6, r6, #1
	add r4, #0x1c
	cmp r6, #3
	blt _02243FB4
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov40_02243F88

	thumb_func_start ov40_02244054
ov40_02244054: ; 0x02244054
	mov r2, #0
	cmp r1, #0
	bne _0224405C
	mov r2, #0xb
_0224405C:
	add r0, r2, r0
	bx lr
	thumb_func_end ov40_02244054

	thumb_func_start ov40_02244060
ov40_02244060: ; 0x02244060
	push {r4, r5, r6, r7}
	mov r1, #0x81
	lsl r1, r1, #2
	ldr r1, [r0, r1]
	mov r3, #0
	cmp r1, #0
	ble _0224409A
	mov r6, #0x85
	lsl r6, r6, #2
	add r4, r0, #0
	add r1, r3, #0
	mov r2, #1
	sub r7, r6, #4
_0224407A:
	ldr r5, [r0, r7]
	cmp r3, r5
	blt _0224408A
	ldr r5, [r0, r6]
	cmp r3, r5
	bge _0224408A
	str r2, [r4, #8]
	b _0224408C
_0224408A:
	str r1, [r4, #8]
_0224408C:
	mov r5, #0x81
	lsl r5, r5, #2
	ldr r5, [r0, r5]
	add r3, r3, #1
	add r4, #0x1c
	cmp r3, r5
	blt _0224407A
_0224409A:
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end ov40_02244060

	thumb_func_start ov40_022440A0
ov40_022440A0: ; 0x022440A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r1, [sp, #4]
	mov r1, #0x82
	lsl r1, r1, #2
	str r0, [sp]
	ldr r0, [r0, r1]
	mov r4, #0
	lsl r2, r0, #1
	ldr r0, [sp]
	str r4, [sp, #8]
	add r2, r0, r2
	add r0, r1, #0
	sub r0, #0x2c
	ldrsh r5, [r2, r0]
	ldr r0, [sp]
	sub r1, r1, #4
	ldr r0, [r0, r1]
	cmp r0, #0
	bgt _022440CA
	b _022441F2
_022440CA:
	ldr r7, [sp]
	add r6, r7, #0
_022440CE:
	mov r0, #0x21
	ldr r1, [sp]
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	cmp r4, r0
	blt _022440FA
	add r2, r1, #0
	mov r1, #0x85
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	cmp r4, r1
	bge _022440FA
	cmp r4, r0
	bne _022440F2
	add r5, #0x14
	lsl r0, r5, #0x10
	asr r5, r0, #0x10
	b _0224410C
_022440F2:
	add r5, #0x20
	lsl r0, r5, #0x10
	asr r5, r0, #0x10
	b _0224410C
_022440FA:
	cmp r4, #0
	bne _02244106
	add r5, #0x14
	lsl r0, r5, #0x10
	asr r5, r0, #0x10
	b _0224410C
_02244106:
	add r5, #8
	lsl r0, r5, #0x10
	asr r5, r0, #0x10
_0224410C:
	add r1, sp, #0xc
	ldr r0, [r7, #0xc]
	add r1, #2
	add r2, sp, #0xc
	bl sub_0200DE44
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _0224412E
	add r3, sp, #0xc
	mov r2, #0
	ldrsh r2, [r3, r2]
	ldr r0, [r7, #0xc]
	add r1, r5, #0
	bl sub_0200DDB8
	b _0224414A
_0224412E:
	add r1, sp, #0xc
	mov r0, #2
	ldrsh r0, [r1, r0]
	sub r1, r5, r0
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	strh r0, [r7, #0x14]
	mov r0, #0
	strh r0, [r7, #0x16]
	mov r0, #2
	strb r0, [r7, #0x18]
	mov r0, #0
	strb r0, [r7, #0x19]
_0224414A:
	mov r0, #0x15
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	cmp r4, r0
	bne _022441E0
	ldr r0, [sp, #8]
	cmp r0, #2
	beq _022441E0
	mov r0, #0x57
	lsl r0, r0, #2
	add r1, sp, #0xc
	ldr r0, [r6, r0]
	add r1, #2
	add r2, sp, #0xc
	bl sub_0200DE44
	ldr r1, [sp]
	mov r0, #0x85
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	add r2, r1, #0
	mov r1, #0x21
	lsl r1, r1, #4
	ldr r1, [r2, r1]
	cmp r1, r0
	bne _02244186
	add r5, #8
	lsl r0, r5, #0x10
	asr r5, r0, #0x10
	b _0224419C
_02244186:
	cmp r4, r1
	ble _02244196
	cmp r4, r0
	bge _02244196
	add r5, #0x14
	lsl r0, r5, #0x10
	asr r5, r0, #0x10
	b _0224419C
_02244196:
	add r5, #8
	lsl r0, r5, #0x10
	asr r5, r0, #0x10
_0224419C:
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _022441B6
	mov r0, #0x57
	lsl r0, r0, #2
	add r3, sp, #0xc
	mov r2, #0
	ldrsh r2, [r3, r2]
	ldr r0, [r6, r0]
	add r1, r5, #0
	bl sub_0200DDB8
	b _022441D8
_022441B6:
	add r1, sp, #0xc
	mov r0, #2
	ldrsh r0, [r1, r0]
	sub r1, r5, r0
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r1, r0, #1
	mov r0, #0x59
	lsl r0, r0, #2
	strh r1, [r6, r0]
	mov r1, #0
	add r0, r0, #2
	strh r1, [r6, r0]
	mov r0, #0x5a
	mov r1, #2
	lsl r0, r0, #2
	strb r1, [r6, r0]
_022441D8:
	ldr r0, [sp, #8]
	add r6, #0x1c
	add r0, r0, #1
	str r0, [sp, #8]
_022441E0:
	mov r0, #0x81
	ldr r1, [sp]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	add r4, r4, #1
	add r7, #0x1c
	cmp r4, r0
	bge _022441F2
	b _022440CE
_022441F2:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov40_022440A0

	thumb_func_start ov40_022441F8
ov40_022441F8: ; 0x022441F8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	mov r0, #0x81
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r4, #0
	cmp r0, #0
	ble _02244288
	add r5, r6, #0
_0224420C:
	mov r0, #0x21
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	cmp r4, r0
	blt _02244228
	mov r0, #0x85
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	cmp r4, r0
	bge _02244228
	mov r0, #0x10
	str r0, [sp]
	add r7, r0, #0
	b _0224422E
_02244228:
	mov r0, #4
	str r0, [sp]
	mov r7, #8
_0224422E:
	add r2, sp, #4
	ldr r0, [r5, #0xc]
	add r1, sp, #4
	add r2, #2
	bl sub_0200DE44
	add r1, sp, #4
	mov r0, #2
	ldrsh r0, [r1, r0]
	sub r1, r0, r7
	ldr r0, [r5, #0x10]
	strb r1, [r0]
	add r1, sp, #4
	mov r0, #0
	ldrsh r1, [r1, r0]
	ldr r0, [sp]
	sub r1, r1, r0
	ldr r0, [r5, #0x10]
	strb r1, [r0, #2]
	add r1, sp, #4
	mov r0, #2
	ldrsh r0, [r1, r0]
	add r1, r0, r7
	ldr r0, [r5, #0x10]
	strb r1, [r0, #1]
	add r1, sp, #4
	mov r0, #0
	ldrsh r1, [r1, r0]
	ldr r0, [sp]
	add r1, r1, r0
	ldr r0, [r5, #0x10]
	cmp r4, #0
	strb r1, [r0, #3]
	bne _0224427A
	ldr r1, [r5, #0x10]
	ldrb r0, [r1, #2]
	sub r0, r0, #4
	strb r0, [r1, #2]
_0224427A:
	mov r0, #0x81
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	add r4, r4, #1
	add r5, #0x1c
	cmp r4, r0
	blt _0224420C
_02244288:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov40_022441F8

	thumb_func_start ov40_0224428C
ov40_0224428C: ; 0x0224428C
	push {r4, r5, lr}
	sub sp, #0x14
	ldr r5, _022442C8 ; =0x000008A4
	add r2, r1, #0
	add r4, r0, #0
	mov r1, #2
	bl ov40_0222C6C8
	add r0, r4, r5
	bl InitWindow
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1e
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	mov r0, #0x4b
	lsl r0, r0, #2
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x24]
	add r1, r4, r5
	mov r2, #2
	mov r3, #1
	bl AddWindowParameterized
	add sp, #0x14
	pop {r4, r5, pc}
	.balign 4, 0
_022442C8: .word 0x000008A4
	thumb_func_end ov40_0224428C

	thumb_func_start ov40_022442CC
ov40_022442CC: ; 0x022442CC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _022442EC ; =0x000008A4
	add r0, r4, r0
	bl ClearWindowTilemapAndCopyToVram
	ldr r0, _022442EC ; =0x000008A4
	add r0, r4, r0
	bl RemoveWindow
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	pop {r4, pc}
	nop
_022442EC: .word 0x000008A4
	thumb_func_end ov40_022442CC

	thumb_func_start ov40_022442F0
ov40_022442F0: ; 0x022442F0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	ldr r3, _022443A8 ; =0x0000011A
	add r5, r0, #0
	add r0, r1, #0
	str r1, [sp, #0x10]
	cmp r0, r3
	bne _0224436A
	lsl r0, r2, #2
	add r1, r5, r0
	ldr r0, _022443AC ; =0x000008A4
	sub r0, #0x18
	ldr r7, [r1, r0]
	mov r0, #0x6d
	bl ov40_0222DAB0
	add r6, r0, #0
	mov r0, #0xff
	mov r1, #0x6d
	bl String_ctor
	add r4, r0, #0
	add r0, r7, #0
	mov r1, #0x6d
	bl sub_020315B8
	str r0, [sp, #0x14]
	ldr r1, [sp, #0x14]
	add r0, r5, #0
	bl ov40_02230DCC
	ldr r0, [r5, #0x48]
	ldr r1, [sp, #0x10]
	bl NewString_ReadMsgData
	add r7, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	mov r1, #0
	str r0, [sp, #4]
	ldr r2, [sp, #0x14]
	add r0, r6, #0
	add r3, r1, #0
	bl BufferString
	add r0, r6, #0
	add r1, r4, #0
	add r2, r7, #0
	bl StringExpandPlaceholders
	ldr r0, [sp, #0x14]
	bl String_dtor
	add r0, r7, #0
	bl String_dtor
	add r0, r6, #0
	bl ScrStrBufs_delete
	b _02244372
_0224436A:
	ldr r0, [r5, #0x48]
	bl NewString_ReadMsgData
	add r4, r0, #0
_02244372:
	ldr r0, _022443AC ; =0x000008A4
	mov r1, #0xcc
	add r0, r5, r0
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _022443B0 ; =0x000F0D0C
	add r2, r4, #0
	str r0, [sp, #8]
	ldr r0, _022443AC ; =0x000008A4
	add r3, r1, #0
	add r0, r5, r0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r0, _022443AC ; =0x000008A4
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	bl String_dtor
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022443A8: .word 0x0000011A
_022443AC: .word 0x000008A4
_022443B0: .word 0x000F0D0C
	thumb_func_end ov40_022442F0

	thumb_func_start ov40_022443B4
ov40_022443B4: ; 0x022443B4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	add r6, r4, #0
	add r6, #0x10
	add r0, r6, #0
	bl InitWindow
	mov r2, #6
	str r2, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x24]
	add r1, r6, #0
	mov r3, #4
	bl AddWindowParameterized
	add r0, r6, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x48]
	mov r1, #0x82
	bl NewString_ReadMsgData
	add r7, r0, #0
	add r0, r6, #0
	add r1, r7, #0
	bl ov40_022306C0
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02244490 ; =0x000F0D00
	add r2, r7, #0
	str r0, [sp, #8]
	add r0, r6, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r7, #0
	bl String_dtor
	add r0, r6, #0
	bl ScheduleWindowCopyToVram
	add r4, #0x20
	add r0, r4, #0
	bl InitWindow
	mov r2, #6
	str r2, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	mov r0, #0x15
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x24]
	add r1, r4, #0
	mov r3, #0x12
	bl AddWindowParameterized
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x48]
	mov r1, #0x83
	bl NewString_ReadMsgData
	add r5, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	bl ov40_022306C0
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02244490 ; =0x000F0D00
	add r2, r5, #0
	str r0, [sp, #8]
	add r0, r4, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl String_dtor
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02244490: .word 0x000F0D00
	thumb_func_end ov40_022443B4

	thumb_func_start ov40_02244494
ov40_02244494: ; 0x02244494
	push {r4, lr}
	mov r1, #0x86
	lsl r1, r1, #4
	ldr r4, [r0, r1]
	add r0, r4, #0
	add r0, #0x10
	bl ClearWindowTilemapAndCopyToVram
	add r0, r4, #0
	add r0, #0x10
	bl RemoveWindow
	add r0, r4, #0
	add r0, #0x20
	bl ClearWindowTilemapAndCopyToVram
	add r4, #0x20
	add r0, r4, #0
	bl RemoveWindow
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov40_02244494

	thumb_func_start ov40_022444C0
ov40_022444C0: ; 0x022444C0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x6d
	mov r1, #0x30
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x30
	add r4, r0, #0
	bl memset
	mov r0, #0x86
	lsl r0, r0, #4
	str r4, [r5, r0]
	ldr r0, [r5, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	add r1, r4, #4
	mov r2, #0
	bl ov40_0222D9E8
	add r0, r5, #0
	mov r1, #1
	bl ov40_0222BF80
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_022444C0

	thumb_func_start ov40_02244514
ov40_02244514: ; 0x02244514
	push {r3, r4, r5, lr}
	sub sp, #0x10
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _0224452C
	cmp r1, #1
	beq _0224458A
	b _02244618
_0224452C:
	add r0, r4, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	cmp r0, #0
	beq _02244540
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_02244540:
	ldr r0, [r5, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r5, #0x58]
	mov r1, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #2
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _02244626
_0224458A:
	mov r0, #0
	add r1, r0, #0
	bl SetBgPriority
	mov r0, #1
	mov r1, #3
	bl SetBgPriority
	mov r0, #2
	mov r1, #0
	bl SetBgPriority
	mov r0, #3
	mov r1, #2
	bl SetBgPriority
	mov r0, #4
	mov r1, #0
	bl SetBgPriority
	mov r0, #5
	mov r1, #3
	bl SetBgPriority
	mov r0, #6
	mov r1, #1
	bl SetBgPriority
	mov r0, #7
	mov r1, #2
	bl SetBgPriority
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #0x24]
	mov r1, #0x3e
	mov r3, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #0x24]
	mov r1, #0x3e
	mov r3, #7
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	add r0, r5, #0
	mov r1, #1
	bl ov40_02230964
	add r0, r5, #0
	bl ov40_0222D874
	add r0, r5, #0
	mov r1, #0
	bl ov40_02230964
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02244626
_02244618:
	mov r1, #0
	bl ov40_0222FB90
	add r0, r5, #0
	mov r1, #2
	bl ov40_0222BF80
_02244626:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov40_02244514

	thumb_func_start ov40_0224462C
ov40_0224462C: ; 0x0224462C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	mov r1, #0x86
	add r4, r0, #0
	lsl r1, r1, #4
	ldr r5, [r4, r1]
	ldr r1, [r4, #8]
	cmp r1, #6
	bls _02244640
	b _02244808
_02244640:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0224464C: ; jump table
	.short _0224465A - _0224464C - 2 ; case 0
	.short _022446A6 - _0224464C - 2 ; case 1
	.short _022446FC - _0224464C - 2 ; case 2
	.short _0224473E - _0224464C - 2 ; case 3
	.short _02244782 - _0224464C - 2 ; case 4
	.short _0224478E - _0224464C - 2 ; case 5
	.short _022447D8 - _0224464C - 2 ; case 6
_0224465A:
	bl ov40_022443B4
	add r0, r4, #0
	mov r1, #0
	bl ov40_0224428C
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6d
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x24]
	mov r1, #0x54
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0224481E
_022446A6:
	add r0, r5, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #0
	mov r3, #2
	bl ov40_0222DA00
	cmp r0, #0
	beq _022446E2
	ldr r2, _02244824 ; =0x0000086C
	ldr r1, _02244828 ; =0x0000011A
	ldr r2, [r4, r2]
	add r0, r4, #0
	bl ov40_022442F0
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_022446E2:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0224481E
_022446FC:
	ldr r0, _0224482C ; =ov40_02245CA0
	bl sub_02025320
	cmp r0, #0
	beq _0224471E
	add r0, r4, #0
	bl ov40_02230944
	ldr r1, _02244830 ; =0x0000011B
	add r0, r4, #0
	mov r2, #0
	bl ov40_022442F0
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0224481E
_0224471E:
	ldr r0, _02244834 ; =ov40_02245CA4
	bl sub_02025320
	cmp r0, #0
	beq _0224481E
	add r0, r4, #0
	bl ov40_02230944
	mov r0, #1
	str r0, [r5, #0xc]
	add r0, r4, #0
	bl ov40_022442CC
	mov r0, #4
	str r0, [r4, #8]
	b _0224481E
_0224473E:
	ldr r0, _0224482C ; =ov40_02245CA0
	bl sub_02025320
	cmp r0, #0
	beq _02244760
	add r0, r4, #0
	bl ov40_02230944
	add r0, r4, #0
	bl ov40_022306E0
	mov r0, #0
	str r0, [r5, #0xc]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0224481E
_02244760:
	ldr r0, _02244834 ; =ov40_02245CA4
	bl sub_02025320
	cmp r0, #0
	beq _0224481E
	add r0, r4, #0
	bl ov40_02230944
	add r0, r4, #0
	bl ov40_022442CC
	mov r0, #1
	str r0, [r5, #0xc]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0224481E
_02244782:
	bl ov40_02244494
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0224481E
_0224478E:
	add r0, r5, #0
	add r0, #8
	mov r1, #1
	bl ov40_0222DA84
	add r0, r5, #0
	add r1, r5, #4
	mov r2, #1
	mov r3, #0
	bl ov40_0222DA00
	cmp r0, #0
	beq _022447BE
	ldr r0, [r5, #0xc]
	cmp r0, #1
	bne _022447B8
	add r0, r4, #0
	mov r1, #3
	bl ov40_0222BF80
	b _022447BE
_022447B8:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_022447BE:
	ldr r0, [r4, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r5, #8]
	ldr r0, [r4, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
	b _0224481E
_022447D8:
	bl ov40_022306F0
	cmp r0, #0
	beq _022447FE
	add r0, r4, #0
	bl ov40_0222FDC4
	add r0, r4, #0
	bl ov40_0222FCCC
	ldr r1, _02244838 ; =0x0000011D
	add r0, r4, #0
	mov r2, #0
	bl ov40_022442F0
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0224481E
_022447FE:
	add r0, r4, #0
	mov r1, #3
	bl ov40_0222BF80
	b _0224481E
_02244808:
	bl System_GetTouchNew
	cmp r0, #0
	beq _0224481E
	add r0, r4, #0
	bl ov40_022442CC
	add r0, r4, #0
	mov r1, #3
	bl ov40_0222BF80
_0224481E:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02244824: .word 0x0000086C
_02244828: .word 0x0000011A
_0224482C: .word ov40_02245CA0
_02244830: .word 0x0000011B
_02244834: .word ov40_02245CA4
_02244838: .word 0x0000011D
	thumb_func_end ov40_0224462C

	thumb_func_start ov40_0224483C
ov40_0224483C: ; 0x0224483C
	push {r3, r4, r5, lr}
	mov r1, #0x86
	add r5, r0, #0
	lsl r1, r1, #4
	ldr r4, [r5, r1]
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _02244856
	cmp r1, #1
	beq _0224485A
	cmp r1, #2
	beq _02244860
	b _02244896
_02244856:
	add r0, r1, #1
	str r0, [r5, #8]
_0224485A:
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_02244860:
	add r0, r5, #0
	bl ov40_0222D88C
	ldr r0, [r5, #0x24]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x24]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	add r0, r5, #0
	mov r1, #1
	bl ov40_0222FB90
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _0224491A
_02244896:
	bl ov40_0222FBB4
	cmp r0, #0
	beq _0224491A
	add r0, r4, #0
	add r0, #8
	mov r1, #0
	bl ov40_0222DA84
	cmp r0, #0
	beq _022448EA
	add r0, r5, #0
	bl ov40_0222DD08
	add r0, r4, #0
	add r0, #8
	bl ov40_0222DAA8
	ldr r0, [r5, #0x58]
	mov r1, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r5, #0x28]
	mov r2, #0xc
	mov r3, #0x10
	bl sub_02003EA4
	mov r1, #1
	ldr r3, [r5, #0x10]
	add r0, r5, #0
	add r2, r1, #0
	bl ov40_0222BF64
	add r0, r5, #0
	mov r1, #5
	bl ov40_0222BF80
	add r0, r4, #0
	bl FreeToHeap
	b _0224491A
_022448EA:
	ldr r0, [r5, #0x58]
	mov r1, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #2
	lsr r3, r3, #0x18
	bl sub_02003EA4
	ldr r0, [r5, #0x58]
	mov r1, #3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r3, [r4, #8]
	ldr r0, [r5, #0x28]
	lsl r3, r3, #0x18
	mov r2, #0xc
	lsr r3, r3, #0x18
	bl sub_02003EA4
_0224491A:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_0224483C

	thumb_func_start ov40_02244920
ov40_02244920: ; 0x02244920
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r0, #0xaa
	ldrb r0, [r0]
	str r1, [sp]
	str r2, [sp, #4]
	add r1, sp, #0x28
	add r2, sp, #0x24
	bl sub_0202FEB8
	ldr r1, [sp, #4]
	mov r0, #0x40
	bl String_ctor
	add r4, r0, #0
	ldr r1, [sp, #4]
	mov r0, #0x40
	bl String_ctor
	str r0, [sp, #0x1c]
	ldr r0, [sp, #4]
	mov r1, #0x80
	bl AllocFromHeap
	add r5, r0, #0
	mov r0, #0
	ldr r1, [sp, #0x28]
	str r0, [sp, #0x20]
	cmp r1, #0
	ble _022449EA
	ldr r0, [sp]
	mov r7, #0
	mvn r7, r7
	str r0, [sp, #0x14]
	str r0, [sp, #0x10]
	add r0, #0x3c
	str r0, [sp, #0x10]
	str r0, [sp, #0xc]
	lsr r6, r7, #0x10
_0224496E:
	ldr r2, [sp, #0x14]
	mov r1, #7
	add r2, #0xe
_02244974:
	ldrh r0, [r2, #0x3c]
	cmp r0, r6
	beq _02244982
	sub r1, r1, #1
	sub r2, r2, #2
	cmp r1, r7
	bgt _02244974
_02244982:
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	bne _0224499E
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #4]
	bl ov40_02244A84
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x10]
	mov r2, #8
	bl CopyStringToU16Array
	b _022449CC
_0224499E:
	add r0, r4, #0
	bl StringSetEmpty
	ldr r1, [sp, #0xc]
	add r0, r4, #0
	bl CopyU16ArrayToString
	ldr r2, [sp, #0x1c]
	mov r0, #0
	add r1, r4, #0
	bl FontID_String_AllCharsValid
	cmp r0, #0
	bne _022449CC
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #4]
	bl ov40_02244A84
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x10]
	mov r2, #8
	bl CopyStringToU16Array
_022449CC:
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x28]
	add r0, #0x34
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	add r0, #0x34
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	add r0, #0x34
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x20]
	add r0, r0, #1
	str r0, [sp, #0x20]
	cmp r0, r1
	blt _0224496E
_022449EA:
	mov r0, #0
	str r0, [sp, #8]
	cmp r1, #0
	ble _02244A6E
_022449F2:
	ldr r0, [sp]
	ldr r0, [r0, #4]
	bl GetPartyCount
	mov r6, #0
	str r0, [sp, #0x18]
	cmp r0, #0
	ble _02244A5C
_02244A02:
	ldr r0, [sp]
	add r1, r6, #0
	ldr r0, [r0, #4]
	bl GetPartyMonByIndex
	mov r1, #0xac
	mov r2, #0
	add r7, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _02244A5C
	mov r0, #0
	add r1, r5, #0
	mov r2, #0x80
	bl MIi_CpuClear16
	add r0, r7, #0
	mov r1, #0x75
	add r2, r5, #0
	bl GetMonData
	add r0, r4, #0
	bl StringSetEmpty
	add r0, r4, #0
	add r1, r5, #0
	bl CopyU16ArrayToString
	ldr r2, [sp, #0x1c]
	mov r0, #0
	add r1, r4, #0
	bl FontID_String_AllCharsValid
	cmp r0, #0
	bne _02244A54
	add r0, r7, #0
	mov r1, #0xb3
	mov r2, #0
	bl SetMonData
_02244A54:
	ldr r0, [sp, #0x18]
	add r6, r6, #1
	cmp r6, r0
	blt _02244A02
_02244A5C:
	ldr r0, [sp]
	ldr r1, [sp, #0x28]
	add r0, r0, #4
	str r0, [sp]
	ldr r0, [sp, #8]
	add r0, r0, #1
	str r0, [sp, #8]
	cmp r0, r1
	blt _022449F2
_02244A6E:
	add r0, r4, #0
	bl String_dtor
	ldr r0, [sp, #0x1c]
	bl String_dtor
	add r0, r5, #0
	bl FreeToHeap
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov40_02244920

	thumb_func_start ov40_02244A84
ov40_02244A84: ; 0x02244A84
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	bl StringSetEmpty
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xd
	add r3, r5, #0
	bl NewMsgDataFromNarc
	mov r1, #0x53
	add r5, r0, #0
	lsl r1, r1, #2
	add r2, r4, #0
	bl ReadMsgDataIntoString
	add r0, r5, #0
	bl DestroyMsgData
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov40_02244A84

	thumb_func_start ov40_02244AB0
ov40_02244AB0: ; 0x02244AB0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r3, #0
	add r6, r1, #0
	ldrh r1, [r4]
	add r7, r0, #0
	add r5, r2, #0
	cmp r1, #0
	beq _02244AC6
	cmp r1, #1
	beq _02244B1A
	b _02244B28
_02244AC6:
	ldr r0, _02244B2C ; =_021D2AF8
	ldr r0, [r0]
	cmp r0, #0
	bne _02244AD2
	bl GF_AssertFail
_02244AD2:
	cmp r5, #1
	bne _02244AFA
	ldr r1, _02244B2C ; =_021D2AF8
	ldr r2, _02244B30 ; =0x0000E281
	ldr r0, [r1]
	add r0, #0xab
	strb r5, [r0]
	ldr r0, [r1]
	add r0, #0xcc
	strh r2, [r0]
	ldr r1, [r1]
	add r0, r7, #0
	add r1, #0x84
	mov r2, #0x58
	bl SavArray_CalcCRC16
	ldr r1, _02244B2C ; =_021D2AF8
	ldr r1, [r1]
	add r1, #0xe4
	strh r0, [r1]
_02244AFA:
	ldr r0, _02244B2C ; =_021D2AF8
	ldr r1, _02244B34 ; =0x00001D4C
	ldr r0, [r0]
	ldr r2, _02244B38 ; =0x0000FFFF
	ldrh r3, [r0, r1]
	add r0, #0xe8
	sub r1, #0xe8
	eor r2, r3
	lsl r2, r2, #0x10
	add r2, r3, r2
	bl sub_02030250
	ldrh r0, [r4]
	add r0, r0, #1
	strh r0, [r4]
	b _02244B28
_02244B1A:
	ldr r1, _02244B2C ; =_021D2AF8
	ldr r3, [sp, #0x18]
	ldr r1, [r1]
	add r2, r6, #0
	bl sub_0202FDA4
	pop {r3, r4, r5, r6, r7, pc}
_02244B28:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02244B2C: .word _021D2AF8
_02244B30: .word 0x0000E281
_02244B34: .word 0x00001D4C
_02244B38: .word 0x0000FFFF
	thumb_func_end ov40_02244AB0

	thumb_func_start ov40_02244B3C
ov40_02244B3C: ; 0x02244B3C
	push {r3, lr}
	ldr r0, _02244B64 ; =_021D2AF8
	ldr r0, [r0]
	cmp r0, #0
	bne _02244B4A
	bl GF_AssertFail
_02244B4A:
	ldr r0, _02244B64 ; =_021D2AF8
	ldr r1, _02244B68 ; =0x00001D4C
	ldr r0, [r0]
	ldr r2, _02244B6C ; =0x0000FFFF
	ldrh r3, [r0, r1]
	add r0, #0xe8
	sub r1, #0xe8
	eor r2, r3
	lsl r2, r2, #0x10
	add r2, r3, r2
	bl sub_02030250
	pop {r3, pc}
	.balign 4, 0
_02244B64: .word _021D2AF8
_02244B68: .word 0x00001D4C
_02244B6C: .word 0x0000FFFF
	thumb_func_end ov40_02244B3C

	thumb_func_start ov40_02244B70
ov40_02244B70: ; 0x02244B70
	push {r4, r5, r6, lr}
	add r4, r3, #0
	add r5, r1, #0
	ldrh r1, [r4]
	add r6, r2, #0
	cmp r1, #0
	beq _02244B84
	cmp r1, #1
	beq _02244BA6
	b _02244BB4
_02244B84:
	ldr r0, _02244BB8 ; =_021D2AF8
	ldr r0, [r0]
	cmp r0, #0
	bne _02244B90
	bl GF_AssertFail
_02244B90:
	ldr r0, _02244BB8 ; =_021D2AF8
	ldr r1, [r0]
	add r0, r1, #0
	add r0, #0xdc
	str r5, [r0]
	add r1, #0xe0
	str r6, [r1]
	ldrh r0, [r4]
	add r0, r0, #1
	strh r0, [r4]
	b _02244BB4
_02244BA6:
	ldr r1, _02244BB8 ; =_021D2AF8
	ldr r3, [sp, #0x10]
	ldr r1, [r1]
	mov r2, #0
	bl sub_0202FDA4
	pop {r4, r5, r6, pc}
_02244BB4:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02244BB8: .word _021D2AF8
	thumb_func_end ov40_02244B70

	thumb_func_start ov40_02244BBC
ov40_02244BBC: ; 0x02244BBC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02244C34 ; =_021D2AF8
	add r4, r1, #0
	ldr r0, [r0]
	cmp r0, #0
	bne _02244BCE
	bl GF_AssertFail
_02244BCE:
	ldr r1, _02244C34 ; =_021D2AF8
	mov r2, #1
	ldr r0, [r1]
	add r0, #0xab
	strb r2, [r0]
	ldr r0, [r1]
	ldr r2, _02244C38 ; =0x0000E281
	add r0, #0xcc
	strh r2, [r0]
	ldr r1, [r1]
	add r0, r5, #0
	add r1, #0x84
	mov r2, #0x58
	bl SavArray_CalcCRC16
	ldr r1, _02244C34 ; =_021D2AF8
	ldr r3, _02244C3C ; =0x0000FFFF
	ldr r2, [r1]
	add r2, #0xe4
	strh r0, [r2]
	ldr r0, [r1]
	ldr r1, _02244C40 ; =0x00001D4C
	ldrh r2, [r0, r1]
	add r0, #0xe8
	sub r1, #0xe8
	eor r3, r2
	lsl r3, r3, #0x10
	add r2, r2, r3
	bl sub_02030250
	mov r0, #8
	bl sub_0201A728
	ldr r1, _02244C34 ; =_021D2AF8
	add r0, r5, #0
	ldr r1, [r1]
	add r2, r4, #0
	bl sub_02027134
	add r4, r0, #0
	cmp r4, #2
	bne _02244C2A
	add r0, r5, #0
	bl SaveGameNormal
	add r4, r0, #0
_02244C2A:
	mov r0, #8
	bl sub_0201A738
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02244C34: .word _021D2AF8
_02244C38: .word 0x0000E281
_02244C3C: .word 0x0000FFFF
_02244C40: .word 0x00001D4C
	thumb_func_end ov40_02244BBC

	.rodata

_02244C44:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00

ov40_02244C54: ; 0x02244C54
	.byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x40, 0x00, 0x00
	.byte 0x10, 0x00, 0x20, 0x00, 0x10, 0x00, 0x20, 0x00

ov40_02244C68: ; 0x02244C68
	.byte 0x80, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00

ov40_02244C80: ; 0x02244C80
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x7C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00

ov40_02244CA0: ; 0x02244CA0
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00

ov40_02244CC8: ; 0x02244CC8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x04, 0x04, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov40_02244CE4: ; 0x02244CE4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x05, 0x05, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov40_02244D00: ; 0x02244D00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x06, 0x06, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov40_02244D1C: ; 0x02244D1C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x07, 0x07
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov40_02244D38: ; 0x02244D38
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x18, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov40_02244D54: ; 0x02244D54
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x19, 0x01, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov40_02244D70: ; 0x02244D70
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1A, 0x02, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov40_02244D8C: ; 0x02244D8C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1B, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov40_02244DA8: ; 0x02244DA8
	.byte 0xFF, 0xFD, 0x02, 0xFF, 0xFD, 0x02, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x0F, 0x27, 0x00, 0x00, 0x10, 0x27, 0x00, 0x00

ov40_02244DC0: ; 0x02244DC0
	.byte 0x05, 0x0A, 0x0F, 0x14, 0x19, 0x19, 0x14, 0x0F, 0x0A, 0x05, 0x52, 0x00, 0xB2, 0x00, 0x76, 0x00
	.byte 0x2A, 0x00, 0x96, 0x00, 0xD2, 0x00, 0x00, 0x00

ov40_02244DD8: ; 0x02244DD8
	.byte 0x5A, 0x00, 0x00, 0x00, 0x87, 0x00, 0x00, 0x00
	.byte 0x0E, 0x01, 0x00, 0x00, 0x2D, 0x00, 0x00, 0x00, 0xE1, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov40_02244DF0: ; 0x02244DF0
	.byte 0x33, 0x33, 0xB3, 0x3F, 0x66, 0x66, 0xE6, 0x3F, 0x00, 0x00, 0x00, 0x40, 0xCD, 0xCC, 0xCC, 0x3F
	.byte 0x33, 0x33, 0xB3, 0x3F, 0xCD, 0xCC, 0xCC, 0x3F

ov40_02244E08: ; 0x02244E08
	.byte 0x08, 0x80, 0x08, 0x20

ov40_02244E0C: ; 0x02244E0C
	.byte 0x08, 0x80, 0xE0, 0xF8

ov40_02244E10: ; 0x02244E10
	.byte 0x10, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00

ov40_02244E1C: ; 0x02244E1C
	.byte 0x10, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00

ov40_02244E28: ; 0x02244E28
	.byte 0x14, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00

ov40_02244E40: ; 0x02244E40
	.byte 0x6B, 0x00, 0x00, 0x00, 0x6C, 0x00, 0x00, 0x00, 0x6D, 0x00, 0x00, 0x00, 0x6E, 0x00, 0x00, 0x00
	.byte 0x6F, 0x00, 0x00, 0x00, 0x82, 0x00, 0x00, 0x00, 0x87, 0x00, 0x00, 0x00

ov40_02244E5C: ; 0x02244E5C
	.byte 0xFA, 0x73, 0x00, 0x00
	.byte 0x1F, 0x77, 0x00, 0x00, 0x7B, 0x6F, 0x00, 0x00, 0xFF, 0x6F, 0x00, 0x00, 0xBF, 0x4E, 0x00, 0x00
	.byte 0x5E, 0x57, 0x00, 0x00, 0x9F, 0x5B, 0x00, 0x00

ov40_02244E78: ; 0x02244E78
	.byte 0x70, 0x00, 0x00, 0x00, 0x71, 0x00, 0x00, 0x00
	.byte 0x72, 0x00, 0x00, 0x00, 0x73, 0x00, 0x00, 0x00, 0x74, 0x00, 0x00, 0x00, 0x83, 0x00, 0x00, 0x00
	.byte 0x88, 0x00, 0x00, 0x00

ov40_02244E94: ; 0x02244E94
	.byte 0x42, 0x16, 0x00, 0x00, 0x7F, 0x35, 0x00, 0x00, 0xEF, 0x3D, 0x00, 0x00
	.byte 0x1F, 0x03, 0x00, 0x00, 0xBC, 0x00, 0x00, 0x00, 0x31, 0x01, 0x00, 0x00, 0x3F, 0x02, 0x00, 0x00

ov40_02244EB0: ; 0x02244EB0
	.byte 0x66, 0x00, 0x00, 0x00, 0x67, 0x00, 0x00, 0x00, 0x68, 0x00, 0x00, 0x00, 0x69, 0x00, 0x00, 0x00
	.byte 0x6A, 0x00, 0x00, 0x00, 0x81, 0x00, 0x00, 0x00, 0x86, 0x00, 0x00, 0x00

ov40_02244ECC: ; 0x02244ECC
	.byte 0x75, 0x00, 0x00, 0x00
	.byte 0x76, 0x00, 0x00, 0x00, 0x77, 0x00, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00, 0x79, 0x00, 0x00, 0x00
	.byte 0x84, 0x00, 0x00, 0x00, 0x89, 0x00, 0x00, 0x00

ov40_02244EE8: ; 0x02244EE8
	.byte 0x04, 0x00, 0x04, 0x00, 0x18, 0x00, 0x02, 0x00
	.byte 0x04, 0x00, 0x06, 0x00, 0x18, 0x00, 0x04, 0x00, 0x04, 0x00, 0x0B, 0x00, 0x05, 0x00, 0x02, 0x00
	.byte 0x04, 0x00, 0x0D, 0x00, 0x05, 0x00, 0x02, 0x00, 0x04, 0x00, 0x15, 0x00, 0x18, 0x00, 0x02, 0x00

ov40_02244F10: ; 0x02244F10
	.byte 0x14, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00

ov40_02244F40: ; 0x02244F40
	.byte 0x04, 0x00, 0x04, 0x00, 0x18, 0x00, 0x02, 0x00, 0x0F, 0x00, 0x08, 0x00, 0x03, 0x00, 0x02, 0x00
	.byte 0x10, 0x00, 0x08, 0x00, 0x0D, 0x00, 0x02, 0x00, 0x04, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x02, 0x00
	.byte 0x04, 0x00, 0x0D, 0x00, 0x18, 0x00, 0x02, 0x00, 0x04, 0x00, 0x0F, 0x00, 0x1A, 0x00, 0x02, 0x00
	.byte 0x04, 0x00, 0x11, 0x00, 0x0B, 0x00, 0x02, 0x00, 0x04, 0x00, 0x13, 0x00, 0x18, 0x00, 0x04, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x15, 0x00, 0x18, 0x00, 0x02, 0x00

ov40_02244F90: ; 0x02244F90
	.byte 0x58, 0x00, 0x68, 0x00, 0x70, 0x00, 0x68, 0x00, 0x88, 0x00, 0x68, 0x00, 0xA0, 0x00, 0x68, 0x00
	.byte 0xB8, 0x00, 0x68, 0x00, 0xD0, 0x00, 0x68, 0x00, 0x18, 0x00, 0x98, 0x00, 0x30, 0x00, 0x98, 0x00
	.byte 0x48, 0x00, 0x98, 0x00, 0x60, 0x00, 0x98, 0x00, 0x78, 0x00, 0x98, 0x00, 0x90, 0x00, 0x98, 0x00
	.byte 0x18, 0x00, 0x88, 0x00, 0x30, 0x00, 0x88, 0x00, 0x48, 0x00, 0x88, 0x00, 0x28, 0x00, 0xA0, 0x00
	.byte 0x40, 0x00, 0xA0, 0x00, 0x58, 0x00, 0xA0, 0x00, 0x90, 0x00, 0x88, 0x00, 0xA8, 0x00, 0x88, 0x00
	.byte 0xC0, 0x00, 0x88, 0x00, 0xA0, 0x00, 0xA0, 0x00, 0xB8, 0x00, 0xA0, 0x00, 0xD0, 0x00, 0xA0, 0x00

ov40_02244FF0: ; 0x02244FF0
	.byte 0x03, 0x00, 0x00, 0x00, 0x3C, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00
	.byte 0x1F, 0x00, 0x00, 0x00, 0x39, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00
	.byte 0x32, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00
	.byte 0x33, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00
	.byte 0x3E, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x1D, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00
	.byte 0x46, 0x00, 0x00, 0x00, 0x31, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x21, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x23, 0x00, 0x00, 0x00, 0x24, 0x00, 0x00, 0x00
	.byte 0x0D, 0x00, 0x00, 0x00, 0x24, 0x00, 0x00, 0x00, 0x25, 0x00, 0x00, 0x00, 0x26, 0x00, 0x00, 0x00
	.byte 0x0E, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x27, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00
	.byte 0x23, 0x00, 0x00, 0x00, 0x55, 0x00, 0x00, 0x00, 0x29, 0x00, 0x00, 0x00, 0x2A, 0x00, 0x00, 0x00
	.byte 0x25, 0x00, 0x00, 0x00, 0x23, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00
	.byte 0x2A, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x2D, 0x00, 0x00, 0x00, 0x2E, 0x00, 0x00, 0x00
	.byte 0x3F, 0x00, 0x00, 0x00, 0x21, 0x00, 0x00, 0x00, 0x2F, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00

ov40_022450F0: ; 0x022450F0
	.word ov40_02230ED8
	.word ov40_02231100
	.word ov40_0223131C
	.word ov40_022313F0

ov40_02245100: ; 0x02245100
	.byte 0x00, 0xC0, 0x00, 0x08

ov40_02245104: ; 0x02245104
	.byte 0x00, 0xC0, 0xF8, 0x00

ov40_02245108: ; 0x02245108
	.word ov40_0223169C
	.word ov40_0223172C
	.word ov40_02231748
	.word ov40_022319A4
	.word ov40_02231C78
	.word ov40_02231868
	.word ov40_0223189C
	.word ov40_02231EA4
	.word ov40_02232094

ov40_0224512C: ; 0x0224512C
	.byte 0x28, 0x48, 0x20, 0x78

ov40_02245130: ; 0x02245130
	.byte 0x28, 0x48, 0x90, 0xE8

ov40_02245134: ; 0x02245134
	.byte 0x10, 0x30, 0x40, 0xC8, 0x40, 0x70, 0x58, 0xA8, 0x98, 0xB8, 0x50, 0xB0

ov40_02245140: ; 0x02245140
	.word ov40_02232288
	.word ov40_022322E0
	.word ov40_02232470
	.word ov40_02232598
	.word ov40_022325B0
	.word ov40_022327F0
	.word ov40_02232A48
	.word ov40_02232AF8
	.word ov40_02232BD8
	.word ov40_02232D44

ov40_02245168: ; 0x02245168
	.word ov40_02233CAC
	.word ov40_02233EE8
	.word ov40_02233F28

ov40_02245174: ; 0x02245174
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00

ov40_02245188: ; 0x02245188
	.byte 0x7E, 0x00, 0x00, 0x00, 0x24, 0x01, 0x00, 0x00
	.byte 0x2A, 0x01, 0x00, 0x00, 0x28, 0x01, 0x00, 0x00, 0x26, 0x01, 0x00, 0x00

ov40_0224519C: ; 0x0224519C
	.byte 0x7D, 0x00, 0x00, 0x00
	.byte 0x23, 0x01, 0x00, 0x00, 0x29, 0x01, 0x00, 0x00, 0x27, 0x01, 0x00, 0x00, 0x25, 0x01, 0x00, 0x00

ov40_022451B0: ; 0x022451B0
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00

ov40_022451C4: ; 0x022451C4
	.byte 0x98, 0xB8, 0x50, 0xB0

ov40_022451C8: ; 0x022451C8
	.byte 0x98, 0xB8, 0x20, 0x80

ov40_022451CC: ; 0x022451CC
	.byte 0x98, 0xB8, 0x80, 0xE0

ov40_022451D0: ; 0x022451D0
	.byte 0x10, 0x30, 0x38, 0xC8

ov40_022451D4: ; 0x022451D4
	.byte 0x48, 0x68, 0x18, 0x48

ov40_022451D8: ; 0x022451D8
	.byte 0x48, 0x68, 0xB8, 0xE8

ov40_022451DC:
	.byte 0x18, 0x28, 0x38, 0xC0
	.byte 0x28, 0x38, 0x38, 0xC0, 0x38, 0x48, 0x38, 0xC0, 0x48, 0x58, 0x38, 0xC0, 0x58, 0x68, 0x38, 0xC0
	.byte 0x68, 0x78, 0x38, 0xC0

ov40_022451F4: ; 0x022451F4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.word ov40_022451DC

ov40_02245220: ; 0x02245220
	.word ov40_0223414C
	.word ov40_022341E0
	.word ov40_02234330
	.word ov40_02234470
	.word ov40_022344D8
	.word ov40_0223480C

ov40_02245238: ; 0x02245238
	.word ov40_0223414C
	.word ov40_022341E0
	.word ov40_02234A14
	.word ov40_02234A38
	.word ov40_02234BBC
	.word ov40_02234D94
	.word ov40_02234F98
	.word ov40_0223512C
	.word ov40_0223527C
	.word ov40_0223534C
	.word ov40_02235434
	.word ov40_02235644

ov40_02245268: ; 0x02245268
	.byte 0x04, 0x03, 0x18, 0x02

ov40_0224526C: ; 0x0224526C
	.byte 0x20, 0x60, 0x48, 0xB8
	.byte 0x98, 0xB8, 0x50, 0xB0

ov40_02245274: ; 0x02245274
	.byte 0x08, 0x03, 0x10, 0x02, 0x09, 0x0A, 0x0E, 0x02, 0x79, 0x00, 0x00, 0x00
	.byte 0x3B, 0x00, 0x00, 0x00

ov40_02245284: ; 0x02245284
	.byte 0x10, 0x30, 0x38, 0xC8, 0x40, 0x70, 0x38, 0xC8, 0x98, 0xB8, 0x50, 0xB0

ov40_02245290: ; 0x02245290
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xCC, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00
	.byte 0x13, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00, 0x00, 0x0D, 0x0F, 0x00, 0x00, 0x01, 0x0F, 0x00
	.byte 0x00, 0x0D, 0x0F, 0x00

ov40_022452B4: ; 0x022452B4
	.byte 0x01, 0x02, 0x09, 0x03, 0x0F, 0x01, 0x0D, 0x03, 0x01, 0x15, 0x1E, 0x02
	.byte 0x06, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov40_022452CC: ; 0x022452CC
	.byte 0x20, 0x40, 0x18, 0x48
	.byte 0x20, 0x40, 0xB8, 0xE0, 0x98, 0xB8, 0x20, 0x80, 0x98, 0xB8, 0x80, 0xE0

ov40_022452DC: ; 0x022452DC
	.byte 0x03, 0x03, 0x0B, 0x02
	.byte 0x12, 0x03, 0x0B, 0x02, 0x03, 0x08, 0x0B, 0x02, 0x12, 0x08, 0x0B, 0x02, 0x03, 0x0D, 0x0B, 0x02
	.byte 0x12, 0x0D, 0x0B, 0x02

ov40_022452F4: ; 0x022452F4
	.byte 0x18, 0x28, 0x18, 0x78, 0x18, 0x28, 0x90, 0xF0, 0x40, 0x50, 0x18, 0x78
	.byte 0x40, 0x50, 0x90, 0xF0, 0x68, 0x78, 0x18, 0x78, 0x68, 0x78, 0x90, 0xF0, 0x98, 0xB8, 0x50, 0xB0

ov40_02245310: ; 0x02245310
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov40_0224533C: ; 0x0224533C
	.word ov40_022365A0
	.word ov40_022366CC
	.word ov40_022376FC
	.word ov40_02237820
	.word ov40_022367B8
	.word ov40_02236968
	.word ov40_02236A58
	.word ov40_02236C64
	.word ov40_02236A70
	.word ov40_02236D60
	.word ov40_02237838

ov40_02245368: ; 0x02245368
	.word ov40_022365A0
	.word ov40_022366CC
	.word ov40_02237978
	.word ov40_02237AA8
	.word ov40_02237D94
	.word ov40_02238358
	.word ov40_022383C8
	.word ov40_02238A50
	.word ov40_02238BB0
	.word ov40_0223854C
	.word ov40_02238820
	.word ov40_02238838
	.word ov40_02236E18
	.word ov40_02238D5C

ov40_022453A0: ; 0x022453A0
	.byte 0x10, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00

ov40_022453AC: ; 0x022453AC
	.byte 0x18, 0x38, 0x30, 0xD0
	.byte 0x50, 0x70, 0x30, 0xD0, 0x98, 0xB8, 0x50, 0xB0

ov40_022453B8: ; 0x022453B8
	.byte 0x07, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x12, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x12, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00

ov40_022453D8: ; 0x022453D8
	.byte 0x04, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x18, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0x18, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00

ov40_022453F8: ; 0x022453F8
	.byte 0x04, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x18, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0x18, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00

ov40_02245418: ; 0x02245418
	.byte 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov40_02245444: ; 0x02245444
	.byte 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov40_02245470: ; 0x02245470
	.word ov40_022399B8
	.word ov40_02239A58
	.word ov40_02239B58
	.word ov40_0223A274
	.word ov40_0223A280
	.word ov40_02239EFC
	.word ov40_0223A034
	.word ov40_0223A080
	.word ov40_0223A158

ov40_02245494: ; 0x02245494
	.byte 0x20, 0x60, 0x50, 0xB0

ov40_02245498: ; 0x02245498
	.byte 0x98, 0xB8, 0x50, 0xB0

ov40_0224549C: ; 0x0224549C
	.byte 0x28, 0x48, 0x20, 0x78
	.byte 0x28, 0x48, 0x90, 0xE8

ov40_022454A4: ; 0x022454A4
	.byte 0x61, 0x00, 0x00, 0x00, 0x62, 0x00, 0x00, 0x00, 0x7B, 0x00, 0x00, 0x00

ov40_022454B0: ; 0x022454B0
	.byte 0x19, 0x39, 0x32, 0xD2, 0x3D, 0x5D, 0x32, 0xD2, 0x61, 0x81, 0x32, 0xD2, 0x85, 0xA5, 0x32, 0xD2

ov40_022454C0: ; 0x022454C0
	.byte 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00

ov40_022454D0: ; 0x022454D0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

ov40_022454E0: ; 0x022454E0
	.byte 0x10, 0x30, 0x40, 0xC8, 0x40, 0x70, 0x58, 0xA8, 0x98, 0xB8, 0x80, 0xE0, 0x98, 0xB8, 0x20, 0x80

ov40_022454F0: ; 0x022454F0
	.byte 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov40_0224551C: ; 0x0224551C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00

ov40_0224554C: ; 0x0224554C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00

ov40_0224557C: ; 0x0224557C
	.byte 0x68, 0x00, 0x48, 0x00
	.byte 0x80, 0x00, 0x48, 0x00, 0x98, 0x00, 0x48, 0x00, 0xB0, 0x00, 0x48, 0x00, 0xC8, 0x00, 0x48, 0x00
	.byte 0xE0, 0x00, 0x48, 0x00, 0x68, 0x00, 0x60, 0x00, 0x80, 0x00, 0x60, 0x00, 0x98, 0x00, 0x60, 0x00
	.byte 0xB0, 0x00, 0x60, 0x00, 0xC8, 0x00, 0x60, 0x00, 0xE0, 0x00, 0x60, 0x00, 0x68, 0x00, 0x78, 0x00
	.byte 0x80, 0x00, 0x78, 0x00, 0x98, 0x00, 0x78, 0x00, 0xB0, 0x00, 0x78, 0x00, 0xC8, 0x00, 0x78, 0x00
	.byte 0xE0, 0x00, 0x78, 0x00, 0x68, 0x00, 0x90, 0x00, 0x80, 0x00, 0x90, 0x00, 0x98, 0x00, 0x90, 0x00
	.byte 0xB0, 0x00, 0x90, 0x00, 0xC8, 0x00, 0x90, 0x00, 0xE0, 0x00, 0x90, 0x00, 0x68, 0x00, 0xA8, 0x00
	.byte 0x80, 0x00, 0xA8, 0x00, 0x98, 0x00, 0xA8, 0x00, 0xB0, 0x00, 0xA8, 0x00, 0xC8, 0x00, 0xA8, 0x00
	.byte 0xE0, 0x00, 0xA8, 0x00

ov40_022455F4: ; 0x022455F4
	.word ov40_0223B5B0
	.word ov40_0223B62C
	.word ov40_0223B75C
	.word ov40_0223BB74
	.word ov40_0223BD98
	.word ov40_0223BF88
	.word ov40_0223C0D8
	.word ov40_0223C240
	.word ov40_0223C258
	.word ov40_0223C3A4
	.word ov40_0223B190
	.word ov40_0223C80C
	.word ov40_0223AF24
	.word ov40_0223AF3C
	.word ov40_0223AC24
	.word ov40_0223A85C
	.word ov40_0223A874
	.word ov40_0223A924
	.word ov40_0223A640
	.word ov40_0223C498
	.word ov40_0223ACD0

ov40_02245648:
	.byte 0x18, 0x38, 0x38, 0xC8

ov40_0224564C: ; 0x0224564C
	.byte 0x20, 0x60, 0x50, 0xB0

ov40_02245650: ; 0x02245650
	.byte 0x98, 0xB8, 0x50, 0xB0

ov40_02245654: ; 0x02245654
	.byte 0x28, 0x48, 0x20, 0x78, 0x28, 0x48, 0x90, 0xE8

ov40_0224565C: ; 0x0224565C
	.byte 0x30, 0x00, 0x00, 0x00
	.byte 0x31, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00

ov40_02245668:
	.byte 0x18, 0x38, 0x30, 0xD0, 0x38, 0x58, 0x30, 0xD0
	.byte 0x58, 0x78, 0x30, 0xD0

ov40_02245674: ; 0x02245674
	.byte 0x19, 0x39, 0x32, 0xD2, 0x3D, 0x5D, 0x32, 0xD2, 0x61, 0x81, 0x32, 0xD2
	.byte 0x85, 0xA5, 0x32, 0xD2

ov40_02245684: ; 0x02245684
	.byte 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00

ov40_02245694: ; 0x02245694
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00

ov40_022456A4:
	.byte 0x10, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov40_022456B4: ; 0x022456B4
	.byte 0x10, 0x30, 0x40, 0xC8, 0x40, 0x70, 0x58, 0xA8, 0x98, 0xB8, 0x80, 0xE0
	.byte 0x98, 0xB8, 0x20, 0x80

ov40_022456C4: ; 0x022456C4
	.byte 0x10, 0x30, 0x28, 0xD8, 0x38, 0x58, 0x28, 0xD8, 0x60, 0x80, 0x28, 0xD8
	.byte 0x98, 0xB8, 0x20, 0x80, 0x98, 0xB8, 0x80, 0xE0

ov40_022456D8:
	.byte 0x18, 0x28, 0x38, 0xC0, 0x28, 0x38, 0x38, 0xC0
	.byte 0x38, 0x48, 0x38, 0xC0, 0x48, 0x58, 0x38, 0xC0, 0x58, 0x68, 0x38, 0xC0, 0x68, 0x78, 0x38, 0xC0

ov40_022456F0: ; 0x022456F0
	.byte 0x30, 0x00, 0x00, 0x00, 0x31, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00, 0x7D, 0x00, 0x00, 0x00
	.byte 0x7D, 0x00, 0x00, 0x00, 0x7D, 0x00, 0x00, 0x00

ov40_02245708: ; 0x02245708
	.byte 0x18, 0x30, 0x28, 0x48, 0x18, 0x30, 0x70, 0x90
	.byte 0x18, 0x30, 0xB8, 0xD8, 0x38, 0x50, 0x28, 0x48, 0x38, 0x50, 0x70, 0x90, 0x38, 0x50, 0xB8, 0xD8
	.byte 0x58, 0x70, 0x28, 0x48, 0x58, 0x70, 0x70, 0x90, 0x58, 0x70, 0xB8, 0xD8

ov40_0224572C: ; 0x0224572C
	.word ov40_022456A4
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00
	.word ov40_02245648

ov40_02245758: ; 0x02245758
	.word ov40_02245898
	.byte 0x05, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.word ov40_02245668

ov40_02245784: ; 0x02245784
	.word ov40_022459C0
	.byte 0x17, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.word ov40_02245668

ov40_022457B0: ; 0x022457B0
	.word ov40_022459C0
	.byte 0x06, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.word 0

ov40_022457DC: ; 0x022457DC
	.word 0
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x0E, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00
	.word ov40_022456D8

ov40_02245808: ; 0x02245808
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00

ov40_02245838: ; 0x02245838
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00

ov40_02245868: ; 0x02245868
	.byte 0x07, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00

ov40_02245898:
	.byte 0xA9, 0x00, 0x00, 0x00, 0xFA, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xAA, 0x00, 0x00, 0x00, 0xFB, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xAB, 0x00, 0x00, 0x00, 0xFC, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xAC, 0x00, 0x00, 0x00, 0xFD, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xAD, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov40_022458E8: ; 0x022458E8
	.byte 0x04, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x0F, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0x0F, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00
	.byte 0x0F, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x0F, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00
	.byte 0x19, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00

ov40_02245948: ; 0x02245948
	.byte 0x68, 0x00, 0x48, 0x00, 0x80, 0x00, 0x48, 0x00
	.byte 0x98, 0x00, 0x48, 0x00, 0xB0, 0x00, 0x48, 0x00, 0xC8, 0x00, 0x48, 0x00, 0xE0, 0x00, 0x48, 0x00
	.byte 0x68, 0x00, 0x60, 0x00, 0x80, 0x00, 0x60, 0x00, 0x98, 0x00, 0x60, 0x00, 0xB0, 0x00, 0x60, 0x00
	.byte 0xC8, 0x00, 0x60, 0x00, 0xE0, 0x00, 0x60, 0x00, 0x68, 0x00, 0x78, 0x00, 0x80, 0x00, 0x78, 0x00
	.byte 0x98, 0x00, 0x78, 0x00, 0xB0, 0x00, 0x78, 0x00, 0xC8, 0x00, 0x78, 0x00, 0xE0, 0x00, 0x78, 0x00
	.byte 0x68, 0x00, 0x90, 0x00, 0x80, 0x00, 0x90, 0x00, 0x98, 0x00, 0x90, 0x00, 0xB0, 0x00, 0x90, 0x00
	.byte 0xC8, 0x00, 0x90, 0x00, 0xE0, 0x00, 0x90, 0x00, 0x68, 0x00, 0xA8, 0x00, 0x80, 0x00, 0xA8, 0x00
	.byte 0x98, 0x00, 0xA8, 0x00, 0xB0, 0x00, 0xA8, 0x00, 0xC8, 0x00, 0xA8, 0x00, 0xE0, 0x00, 0xA8, 0x00

ov40_022459C0:
	.byte 0xA9, 0x00, 0x00, 0x00, 0xFA, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xAA, 0x00, 0x00, 0x00, 0xFB, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xAB, 0x00, 0x00, 0x00, 0xFC, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xAC, 0x00, 0x00, 0x00, 0xFD, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xAD, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xAE, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xAF, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xB0, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xB1, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xB2, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xB3, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xB4, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xB5, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xB6, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xB7, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xB8, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xB9, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xBA, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xBB, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xBC, 0x00, 0x00, 0x00, 0x1D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xBD, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xBE, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xBF, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov40_02245B30: ; 0x02245B30
	.word ov40_02240238
	.word ov40_02240290
	.word ov40_022417A4
	.word ov40_022417DC
	.word ov40_02241948

ov40_02245B44: ; 0x02245B44
	.word ov40_02240238
	.word ov40_02240290
	.word ov40_02240418
	.word ov40_02240520
	.word ov40_02240544
	.word ov40_022405F0
	.word ov40_022406C8
	.word ov40_0224092C
	.word ov40_02240B40
	.word ov40_02240B58
	.word ov40_02240B70
	.word ov40_02240B90
	.word ov40_02241144
	.word ov40_022413EC
	.word ov40_02241404
	.word ov40_02241434
	.word ov40_0224144C
	.word ov40_02241464
	.word ov40_0224147C
	.word ov40_02241488
	.word ov40_0224141C

ov40_02245B98: ; 0x02245B98
	.word ov40_02240238
	.word ov40_02240290
	.word ov40_0223E190
	.word ov40_0223E324
	.word ov40_0223E33C
	.word ov40_0223E494
	.word ov40_0223E520
	.word ov40_0223E6EC
	.word ov40_0223E870
	.word ov40_0223E9A4
	.word ov40_0223EDE0
	.word ov40_0223EFA4
	.word ov40_0223F028
	.word ov40_0223F16C
	.word ov40_0223F200
	.word ov40_0223F3E4
	.word ov40_0223F59C
	.word ov40_0223F6BC
	.word ov40_0223F830
	.word ov40_0223F848
	.word ov40_0223F860
	.word ov40_0223F880
	.word ov40_0223F984
	.word ov40_0223FCA0
	.word ov40_0223FCB8
	.word ov40_0223FD38
	.word ov40_0223FD50
	.word ov40_0223FD68
	.word ov40_0223FD80
	.word ov40_0223FD8C
	.word ov40_0223FF8C
	.word ov40_0223FCF8

ov40_02245C18: ; 0x02245C18
	.word ov40_02243224
	.word ov40_02243284
	.word ov40_022432AC
	.word ov40_0224326C

ov40_02245C28: ; 0x02245C28
	.byte 0x38, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x38, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov40_02245C40: ; 0x02245C40
	.byte 0x20, 0x00, 0x50, 0x00, 0x14, 0x00, 0x14, 0x00, 0x50, 0x00, 0x50, 0x00, 0x14, 0x00, 0x14, 0x00
	.byte 0x80, 0x00, 0x50, 0x00, 0x14, 0x00, 0x14, 0x00, 0xB0, 0x00, 0x50, 0x00, 0x14, 0x00, 0x14, 0x00
	.byte 0xE0, 0x00, 0x50, 0x00, 0x14, 0x00, 0x14, 0x00, 0x20, 0x00, 0x80, 0x00, 0x14, 0x00, 0x14, 0x00
	.byte 0x50, 0x00, 0x80, 0x00, 0x14, 0x00, 0x14, 0x00, 0x80, 0x00, 0x80, 0x00, 0x14, 0x00, 0x14, 0x00
	.byte 0xB0, 0x00, 0x80, 0x00, 0x14, 0x00, 0x14, 0x00, 0xE0, 0x00, 0x80, 0x00, 0x14, 0x00, 0x14, 0x00
	.byte 0x4C, 0x00, 0xB0, 0x00, 0x3C, 0x00, 0x0C, 0x00, 0xC0, 0x00, 0xB0, 0x00, 0x3C, 0x00, 0x0C, 0x00

ov40_02245CA0: ; 0x02245CA0
	.byte 0x28, 0x48, 0x20, 0x78

ov40_02245CA4: ; 0x02245CA4
	.byte 0x28, 0x48, 0x90, 0xE8

ov40_02245CA8: ; 0x02245CA8
	.word ov40_022444C0
	.word ov40_02244514
	.word ov40_0224462C
	.word ov40_0224483C

	.data

_02245CC0:
	.byte 0x80, 0x00, 0x2A, 0x00, 0xBD, 0x00, 0x57, 0x00, 0xAC, 0x00, 0x86, 0x00, 0x53, 0x00, 0x86, 0x00
	.byte 0x42, 0x00, 0x57, 0x00

ov40_02245CD4: ; 0x02245CD4
	.byte 0x00, 0x00, 0x57, 0x00, 0x88, 0x00, 0xBF, 0x00, 0xEB, 0x00, 0x2F, 0x01
	.byte 0x68, 0x01, 0xC9, 0x01, 0xE7, 0x01, 0xED, 0x01

ov40_02245CE8: ; 0x02245CE8
	.byte 0x4A, 0x00, 0x00, 0x00, 0x4D, 0x00, 0x00, 0x00
	.byte 0x4F, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00
	.byte 0xFF, 0xFF, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00
	.byte 0xFF, 0xFF, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00
	.byte 0x5B, 0x00, 0x00, 0x00, 0x5C, 0x00, 0x00, 0x00, 0x5D, 0x00, 0x00, 0x00, 0x5E, 0x00, 0x00, 0x00
	.byte 0x5F, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x61, 0x00, 0x00, 0x00, 0x62, 0x00, 0x00, 0x00
	.byte 0x63, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x65, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00
	.byte 0x18, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00
	.byte 0x1D, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x24, 0x00, 0x00, 0x00, 0x29, 0x00, 0x00, 0x00
	.byte 0x2A, 0x00, 0x00, 0x00, 0x2D, 0x00, 0x00, 0x00, 0x72, 0x00, 0x00, 0x00, 0x73, 0x00, 0x00, 0x00
	.byte 0x74, 0x00, 0x00, 0x00, 0x75, 0x00, 0x00, 0x00, 0x2E, 0x00, 0x00, 0x00, 0x76, 0x00, 0x00, 0x00
	.byte 0x2F, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x31, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00
	.byte 0x33, 0x00, 0x00, 0x00, 0x34, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x00, 0x36, 0x00, 0x00, 0x00
	.byte 0x37, 0x00, 0x00, 0x00, 0x38, 0x00, 0x00, 0x00, 0x39, 0x00, 0x00, 0x00, 0x3A, 0x00, 0x00, 0x00
	.byte 0x3B, 0x00, 0x00, 0x00, 0x3C, 0x00, 0x00, 0x00, 0x3D, 0x00, 0x00, 0x00, 0x3E, 0x00, 0x00, 0x00
	.byte 0x3F, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x41, 0x00, 0x00, 0x00, 0x42, 0x00, 0x00, 0x00
	.byte 0x43, 0x00, 0x00, 0x00, 0x44, 0x00, 0x00, 0x00, 0x45, 0x00, 0x00, 0x00, 0x46, 0x00, 0x00, 0x00
	.byte 0x77, 0x00, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00, 0x47, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00
	.byte 0xFF, 0xFF, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00
	.byte 0xFF, 0xFF, 0x00, 0x00

ov40_02245E44: ; 0x02245E44
	.byte 0x00, 0x00, 0x57, 0x00, 0x88, 0x00, 0xBF, 0x00, 0xEB, 0x00, 0x2F, 0x01
	.byte 0x68, 0x01, 0xC9, 0x01, 0xE7, 0x01, 0xED, 0x01

ov40_02245E58: ; 0x02245E58
	.byte 0xCD, 0xCC, 0x4C, 0x3F, 0x9A, 0x99, 0x19, 0x3F
	.byte 0xCD, 0xCC, 0xCC, 0x3E, 0xCD, 0xCC, 0x4C, 0x3E, 0xCD, 0xCC, 0x4C, 0x3F, 0x00, 0x00, 0x80, 0x3F
	.byte 0x00, 0x00, 0x80, 0x3F

ov40_02245E74: ; 0x02245E74
	.byte 0x00, 0x00, 0x00, 0x3F, 0xCD, 0xCC, 0x4C, 0x3E, 0x00, 0x00, 0x00, 0x3F
	.byte 0x00, 0x00, 0x80, 0x3F, 0x9A, 0x99, 0x99, 0x3F, 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x80, 0x3F
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
