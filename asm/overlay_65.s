	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov65_0221BE20
ov65_0221BE20: ; 0x0221BE20
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r6, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _0221BF9C ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _0221BFA0 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	ldr r2, _0221BFA4 ; =0x00070FA0
	mov r0, #3
	mov r1, #0x1a
	bl CreateHeap
	mov r0, #4
	mov r1, #0x1a
	bl FontID_Alloc
	mov r0, #0x34
	mov r1, #0x1a
	bl NARC_ctor
	add r5, r0, #0
	ldr r1, _0221BFA8 ; =0x000036CC
	add r0, r6, #0
	mov r2, #0x1a
	bl OverlayManager_CreateAndGetData
	add r4, r0, #0
	ldr r2, _0221BFA8 ; =0x000036CC
	mov r0, #0
	add r1, r4, #0
	bl MIi_CpuClearFast
	mov r0, #0x1a
	bl BgConfig_Alloc
	mov r1, #6
	lsl r1, r1, #6
	str r0, [r4, r1]
	mov r0, #0xc
	mov r1, #0x16
	mov r2, #0x1a
	bl ScrStrBufs_new_custom
	mov r1, #0x61
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0x1a
	bl ScrStrBufs_new
	mov r1, #0x62
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0x1a
	bl ScrStrBufs_new
	mov r1, #0x63
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xb7
	mov r3, #0x1a
	bl NewMsgDataFromNarc
	mov r1, #0x19
	lsl r1, r1, #4
	str r0, [r4, r1]
	mov r0, #0
	str r0, [r4, #0x4c]
	add r0, r4, #0
	add r1, r6, #0
	bl ov65_0221D0EC
	mov r0, #4
	mov r1, #8
	bl SetKeyRepeatTimers
	bl ov65_0221CE98
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl ov65_0221CEB8
	mov r0, #0x10
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x1a
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	add r0, r4, #0
	add r1, r5, #0
	bl ov65_0221D280
	ldr r0, _0221BFAC ; =ov65_0221CE1C
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	bl ov65_0221D3B8
	add r0, r4, #0
	add r1, r5, #0
	bl ov65_0221D3E8
	add r0, r4, #0
	bl ov65_0221D930
	mov r0, #6
	ldr r2, [r4, #8]
	lsl r0, r0, #6
	ldr r1, _0221BFB0 ; =0x00000444
	ldr r0, [r4, r0]
	ldr r2, [r2, #0x18]
	add r1, r4, r1
	bl ov65_0221F8D0
	ldr r0, [r4, #8]
	add r1, r4, #0
	ldr r0, [r0]
	str r0, [r4]
	bl sub_0208F7E0
	mov r3, #0x61
	lsl r3, r3, #2
	ldr r0, [r4, r3]
	add r3, #0xc
	str r0, [sp]
	ldr r0, _0221BFB4 ; =0x000005B4
	ldr r3, [r4, r3]
	add r0, r4, r0
	mov r1, #0x14
	mov r2, #1
	bl ov65_0221FB90
	ldr r0, [r4]
	bl sub_0208F658
	mov r0, #0
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r1, #6
	lsl r1, r1, #6
	ldr r1, [r4, r1]
	mov r0, #0x1a
	bl sub_020399FC
	bl sub_0203A880
	bl IsNighttime
	ldr r1, _0221BFB8 ; =0x00000427
	mov r0, #0
	bl sub_02055198
	ldr r0, _0221BFB8 ; =0x00000427
	bl sub_02005448
	add r0, r5, #0
	bl NARC_dtor
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_0221BF9C: .word 0xFFFFE0FF
_0221BFA0: .word 0x04001000
_0221BFA4: .word 0x00070FA0
_0221BFA8: .word 0x000036CC
_0221BFAC: .word ov65_0221CE1C
_0221BFB0: .word 0x00000444
_0221BFB4: .word 0x000005B4
_0221BFB8: .word 0x00000427
	thumb_func_end ov65_0221BE20

	thumb_func_start ov65_0221BFBC
ov65_0221BFBC: ; 0x0221BFBC
	push {r4, r5, r6, lr}
	add r5, r1, #0
	ldr r1, [sp, #0x10]
	add r4, r2, #0
	lsl r1, r1, #4
	add r1, #0x92
	mov r2, #2
	ldr r0, [r0, #0x14]
	add r6, r3, #0
	lsl r1, r1, #5
	lsl r2, r2, #8
	bl GX_LoadOBJ
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl GetMonIconPaletteEx
	add r1, r0, #0
	ldr r0, [sp, #0x14]
	add r1, #0xa
	bl sub_02024A74
	pop {r4, r5, r6, pc}
	thumb_func_end ov65_0221BFBC

	thumb_func_start ov65_0221BFEC
ov65_0221BFEC: ; 0x0221BFEC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	bl sub_0203769C
	bl sub_02034818
	add r4, r0, #0
	bl sub_0203769C
	mov r1, #1
	eor r0, r1
	bl sub_02034818
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #0x1a
	bl PlayerProfile_GetPlayerName_NewString
	add r4, r0, #0
	add r0, r6, #0
	mov r1, #0x1a
	bl PlayerProfile_GetPlayerName_NewString
	add r6, r0, #0
	mov r0, #0x19
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x32
	bl NewString_ReadMsgData
	add r7, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0221C080 ; =0x00000444
	add r1, r4, #0
	add r0, r5, r0
	mov r2, #0xa
	mov r3, #0
	bl ov65_0221FB4C
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0221C084 ; =0x00000454
	add r1, r6, #0
	add r0, r5, r0
	mov r2, #0xa
	mov r3, #0
	bl ov65_0221FB4C
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0221C088 ; =0x000004A4
	add r1, r7, #0
	add r0, r5, r0
	mov r2, #5
	mov r3, #0
	bl ov65_0221FB4C
	add r0, r7, #0
	bl String_dtor
	add r0, r6, #0
	bl String_dtor
	add r0, r4, #0
	bl String_dtor
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221C080: .word 0x00000444
_0221C084: .word 0x00000454
_0221C088: .word 0x000004A4
	thumb_func_end ov65_0221BFEC

	thumb_func_start ov65_0221C08C
ov65_0221C08C: ; 0x0221C08C
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0x34
	mov r1, #0x1a
	bl NARC_ctor
	add r4, r0, #0
	bl ov65_0221CE98
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl ov65_0221CEB8
	add r0, r5, #0
	add r1, r4, #0
	bl ov65_0221D280
	add r0, r5, #0
	bl ov65_0221C1C4
	add r0, r5, #0
	bl ov65_0221BFEC
	ldr r0, [r5, #8]
	ldr r0, [r0, #0x18]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x1a
	str r0, [sp, #4]
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	ldr r2, _0221C1AC ; =0x000003D9
	mov r1, #0
	mov r3, #0xa
	bl LoadUserFrameGfx2
	mov r1, #0
	str r1, [sp]
	mov r0, #0x1a
	str r0, [sp, #4]
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	ldr r2, _0221C1B0 ; =0x000003F7
	mov r3, #0xb
	bl LoadUserFrameGfx1
	mov r3, #0x61
	lsl r3, r3, #2
	ldr r0, [r5, r3]
	add r3, #0xc
	str r0, [sp]
	ldr r0, _0221C1B4 ; =0x00000594
	ldr r3, [r5, r3]
	add r0, r5, r0
	mov r1, #0xf
	mov r2, #1
	bl ov65_0221FB90
	mov r0, #4
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #5
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #6
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #0
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #1
	add r1, r0, #0
	bl ToggleBgLayer
	mov r0, #2
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #3
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	bl ov65_0221D3B8
	add r0, r5, #0
	add r1, r4, #0
	bl ov65_0221D3E8
	add r0, r5, #0
	bl ov65_0221D930
	ldr r0, _0221C1B8 ; =0x00002224
	mov r1, #0
	ldr r0, [r5, r0]
	add r2, r5, #0
	bl ov65_0221C46C
	ldr r0, _0221C1BC ; =0x00002228
	mov r1, #6
	ldr r0, [r5, r0]
	add r2, r5, #0
	bl ov65_0221C46C
	mov r0, #0xd1
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0xd2
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, _0221C1C0 ; =ov65_0221CE1C
	add r1, r5, #0
	bl Main_SetVBlankIntrCB
	add r0, r4, #0
	bl NARC_dtor
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_0221C1AC: .word 0x000003D9
_0221C1B0: .word 0x000003F7
_0221C1B4: .word 0x00000594
_0221C1B8: .word 0x00002224
_0221C1BC: .word 0x00002228
_0221C1C0: .word ov65_0221CE1C
	thumb_func_end ov65_0221C08C

	thumb_func_start ov65_0221C1C4
ov65_0221C1C4: ; 0x0221C1C4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x61
	ldr r1, _0221C240 ; =0x00002224
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	mov r2, #0
	bl ov65_0221C3DC
	mov r0, #0x61
	ldr r1, _0221C244 ; =0x00002228
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	mov r2, #6
	bl ov65_0221C3DC
	mov r0, #0
	mov r2, #0x61
	str r0, [sp]
	lsl r2, r2, #2
	ldr r3, _0221C240 ; =0x00002224
	ldr r0, _0221C248 ; =0x000004B4
	ldr r1, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	ldr r3, [r5, r3]
	add r0, r5, r0
	bl ov65_0221C414
	mov r0, #6
	mov r2, #0x61
	str r0, [sp]
	lsl r2, r2, #2
	ldr r3, _0221C244 ; =0x00002228
	ldr r0, _0221C24C ; =0x00000514
	ldr r1, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	ldr r3, [r5, r3]
	add r0, r5, r0
	bl ov65_0221C414
	ldr r0, _0221C240 ; =0x00002224
	ldr r0, [r5, r0]
	bl GetPartyCount
	add r4, r0, #0
	ldr r0, _0221C244 ; =0x00002228
	ldr r0, [r5, r0]
	bl GetPartyCount
	add r2, r0, #0
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl ov65_0221D25C
	pop {r3, r4, r5, pc}
	nop
_0221C240: .word 0x00002224
_0221C244: .word 0x00002228
_0221C248: .word 0x000004B4
_0221C24C: .word 0x00000514
	thumb_func_end ov65_0221C1C4

	thumb_func_start ov65_0221C250
ov65_0221C250: ; 0x0221C250
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r5]
	add r4, r0, #0
	mov r6, #0
	cmp r1, #0
	beq _0221C270
	cmp r1, #1
	beq _0221C284
	cmp r1, #2
	bne _0221C26E
	b _0221C3AA
_0221C26E:
	b _0221C3B4
_0221C270:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0221C28A
	mov r0, #1
	str r0, [r5]
	add r0, r4, #0
	bl ov65_0221BFEC
	b _0221C3B4
_0221C284:
	ldr r1, [r4, #0x54]
	cmp r1, #7
	bls _0221C28C
_0221C28A:
	b _0221C3B4
_0221C28C:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0221C298: ; jump table
	.short _0221C2A8 - _0221C298 - 2 ; case 0
	.short _0221C2B0 - _0221C298 - 2 ; case 1
	.short _0221C2B8 - _0221C298 - 2 ; case 2
	.short _0221C2D6 - _0221C298 - 2 ; case 3
	.short _0221C2F4 - _0221C298 - 2 ; case 4
	.short _0221C330 - _0221C298 - 2 ; case 5
	.short _0221C380 - _0221C298 - 2 ; case 6
	.short _0221C39C - _0221C298 - 2 ; case 7
_0221C2A8:
	bl ov65_0221C5E0
	str r0, [r4, #0x54]
	b _0221C3B4
_0221C2B0:
	bl ov65_0221CC0C
	str r0, [r4, #0x54]
	b _0221C3B4
_0221C2B8:
	mov r0, #8
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x1a
	str r0, [sp, #8]
	add r0, r6, #0
	add r1, r6, #0
	add r2, r6, #0
	add r3, r6, #0
	bl BeginNormalPaletteFade
	mov r0, #2
	str r0, [r5]
	b _0221C3B4
_0221C2D6:
	mov r0, #8
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x1a
	str r0, [sp, #8]
	add r0, r6, #0
	add r1, r6, #0
	add r2, r6, #0
	add r3, r6, #0
	bl BeginNormalPaletteFade
	mov r0, #4
	str r0, [r4, #0x54]
	b _0221C3B4
_0221C2F4:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0221C3B4
	add r0, r4, #0
	bl ov65_0221CD0C
	add r0, r4, #0
	bl ov65_0221CCB0
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl ov65_0221D1C8
	mov r0, #1
	str r0, [r4, #0x50]
	mov r0, #5
	str r0, [r4, #0x54]
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	mov r1, #6
	bl _s32_div_f
	add r1, r0, #0
	add r0, r4, #0
	bl ov65_0221E06C
	b _0221C3B4
_0221C330:
	ldr r0, [r4, #0x4c]
	bl OverlayManager_run
	cmp r0, #0
	beq _0221C3B4
	ldr r0, [r4, #0x4c]
	bl OverlayManager_delete
	add r0, r4, #0
	bl ov65_0221C08C
	add r0, r6, #0
	str r0, [r4, #0x50]
	add r0, r4, #0
	add r0, #0x20
	ldrb r2, [r0]
	ldr r1, [r4, #0x48]
	mov r0, #6
	mul r0, r1
	add r1, r2, r0
	add r0, r4, #0
	add r0, #0x94
	str r1, [r0]
	add r0, r4, #0
	bl ov65_0221CB5C
	add r0, r4, #0
	mov r1, #0xd1
	add r0, #0x94
	lsl r1, r1, #2
	ldr r0, [r0]
	ldr r1, [r4, r1]
	add r2, r6, #0
	bl ov65_0221DD34
	bl sub_0203A880
	mov r0, #6
	str r0, [r4, #0x54]
	b _0221C3B4
_0221C380:
	mov r0, #8
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x1a
	str r0, [sp, #8]
	add r0, r6, #0
	add r2, r1, #0
	add r3, r6, #0
	bl BeginNormalPaletteFade
	mov r0, #7
	str r0, [r4, #0x54]
	b _0221C3B4
_0221C39C:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0221C3B4
	mov r0, #1
	str r0, [r4, #0x54]
	b _0221C3B4
_0221C3AA:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0221C3B4
	mov r6, #1
_0221C3B4:
	ldr r0, [r4, #0x50]
	cmp r0, #0
	bne _0221C3CA
	add r0, r4, #0
	bl ov65_0221F714
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_0202457C
_0221C3CA:
	mov r1, #6
	lsl r1, r1, #6
	ldr r1, [r4, r1]
	mov r0, #0x1a
	bl sub_020399FC
	add r0, r6, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov65_0221C250

	thumb_func_start ov65_0221C3DC
ov65_0221C3DC: ; 0x0221C3DC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	add r0, r5, #0
	add r6, r2, #0
	mov r4, #0
	bl GetPartyCount
	cmp r0, #0
	ble _0221C412
_0221C3F0:
	add r0, r5, #0
	add r1, r4, #0
	bl GetPartyMonByIndex
	bl Mon_GetBoxMon
	add r2, r0, #0
	add r0, r7, #0
	add r1, r4, r6
	bl BufferBoxMonNickname
	add r0, r5, #0
	add r4, r4, #1
	bl GetPartyCount
	cmp r4, r0
	blt _0221C3F0
_0221C412:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov65_0221C3DC

	thumb_func_start ov65_0221C414
ov65_0221C414: ; 0x0221C414
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r0, r3, #0
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	ldr r6, [sp, #0x28]
	mov r4, #0
	bl GetPartyCount
	cmp r0, #0
	ble _0221C466
	add r7, r6, #1
_0221C430:
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	add r2, r7, r4
	mov r3, #0x1a
	bl ReadMsgData_ExpandPlaceholders
	add r6, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #8
	mov r3, #0
	bl ov65_0221FB4C
	add r0, r6, #0
	bl String_dtor
	ldr r0, [sp, #0x10]
	add r5, #0x10
	add r4, r4, #1
	bl GetPartyCount
	cmp r4, r0
	blt _0221C430
_0221C466:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov65_0221C414

	thumb_func_start ov65_0221C46C
ov65_0221C46C: ; 0x0221C46C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	str r2, [sp, #0x20]
	mov r7, #0
	bl GetPartyCount
	cmp r0, #0
	bgt _0221C482
	b _0221C584
_0221C482:
	ldr r1, _0221C5C4 ; =0x000007CC
	ldr r0, [sp, #0x20]
	add r0, r0, r1
	str r0, [sp, #0x1c]
_0221C48A:
	ldr r0, [sp, #0xc]
	ldr r2, _0221C5C8 ; =0x000006A2
	add r0, r7, r0
	str r0, [sp, #0x10]
	lsl r0, r0, #2
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x10]
	lsl r1, r0, #4
	ldr r0, [sp, #0x20]
	add r4, r0, r1
	ldr r1, [sp, #0x18]
	ldrb r2, [r4, r2]
	add r5, r0, r1
	ldr r0, _0221C5CC ; =0x0000069C
	ldr r1, _0221C5D0 ; =0x000006A1
	ldrh r0, [r4, r0]
	ldrb r1, [r4, r1]
	bl GetMonIconNaixEx
	add r1, r0, #0
	mov r0, #0x1a
	str r0, [sp]
	ldr r6, [sp, #0x1c]
	ldr r3, [sp, #0x18]
	mov r0, #0x14
	mov r2, #0
	add r3, r6, r3
	bl GfGfxLoader_GetCharData
	ldr r1, _0221C5D4 ; =0x0000079C
	str r0, [r5, r1]
	add r0, r1, #0
	add r0, #0x30
	ldr r0, [r5, r0]
	mov r1, #2
	ldr r0, [r0, #0x14]
	lsl r1, r1, #8
	bl DC_FlushRange
	ldr r0, [sp, #0x10]
	ldr r1, _0221C5CC ; =0x0000069C
	str r0, [sp]
	mov r0, #0xdf
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, _0221C5C8 ; =0x000006A2
	str r0, [sp, #4]
	ldr r3, _0221C5D0 ; =0x000006A1
	ldr r0, _0221C5C4 ; =0x000007CC
	ldrh r1, [r4, r1]
	ldrb r2, [r4, r2]
	ldrb r3, [r4, r3]
	ldr r0, [r5, r0]
	bl ov65_0221BFBC
	mov r0, #0xdf
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, _0221C5D8 ; =0x0000069E
	ldrh r0, [r4, r0]
	cmp r0, #0
	bne _0221C51A
	mov r0, #0xeb
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	b _0221C542
_0221C51A:
	ldr r0, [sp, #0x10]
	lsl r1, r0, #2
	ldr r0, [sp, #0x20]
	add r1, r0, r1
	mov r0, #0xeb
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	str r1, [sp, #0x14]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0xeb
	ldr r1, [sp, #0x14]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	ldr r1, _0221C5D8 ; =0x0000069E
	ldrh r1, [r4, r1]
	add r1, r1, #2
	bl Set2dSpriteAnimSeqNo
_0221C542:
	ldr r0, _0221C5DC ; =0x000006A8
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0221C558
	mov r0, #0xf7
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	b _0221C578
_0221C558:
	ldr r0, [sp, #0x10]
	lsl r1, r0, #2
	ldr r0, [sp, #0x20]
	add r4, r0, r1
	mov r0, #0xf7
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0xf7
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x15
	bl Set2dSpriteAnimSeqNo
_0221C578:
	ldr r0, [sp, #8]
	add r7, r7, #1
	bl GetPartyCount
	cmp r7, r0
	blt _0221C48A
_0221C584:
	cmp r7, #6
	bge _0221C5C0
	ldr r0, [sp, #0xc]
	mov r6, #0xeb
	lsl r1, r0, #2
	ldr r0, [sp, #0x20]
	lsl r6, r6, #2
	add r1, r0, r1
	lsl r0, r7, #2
	add r5, r6, #0
	add r4, r1, r0
	add r5, #0x30
_0221C59C:
	mov r0, #0xdf
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r4, r6]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r4, r5]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r7, r7, #1
	add r4, r4, #4
	cmp r7, #6
	blt _0221C59C
_0221C5C0:
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0221C5C4: .word 0x000007CC
_0221C5C8: .word 0x000006A2
_0221C5CC: .word 0x0000069C
_0221C5D0: .word 0x000006A1
_0221C5D4: .word 0x0000079C
_0221C5D8: .word 0x0000069E
_0221C5DC: .word 0x000006A8
	thumb_func_end ov65_0221C46C

	thumb_func_start ov65_0221C5E0
ov65_0221C5E0: ; 0x0221C5E0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r0, #0
	bl ov65_0221F864
	ldr r0, [r4, #0x58]
	cmp r0, #0x13
	bls _0221C5F2
	b _0221C99E
_0221C5F2:
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0221C5FE: ; jump table
	.short _0221C626 - _0221C5FE - 2 ; case 0
	.short _0221C68E - _0221C5FE - 2 ; case 1
	.short _0221C6D8 - _0221C5FE - 2 ; case 2
	.short _0221C6E6 - _0221C5FE - 2 ; case 3
	.short _0221C6FA - _0221C5FE - 2 ; case 4
	.short _0221C70A - _0221C5FE - 2 ; case 5
	.short _0221C722 - _0221C5FE - 2 ; case 6
	.short _0221C736 - _0221C5FE - 2 ; case 7
	.short _0221C748 - _0221C5FE - 2 ; case 8
	.short _0221C774 - _0221C5FE - 2 ; case 9
	.short _0221C782 - _0221C5FE - 2 ; case 10
	.short _0221C78E - _0221C5FE - 2 ; case 11
	.short _0221C812 - _0221C5FE - 2 ; case 12
	.short _0221C82E - _0221C5FE - 2 ; case 13
	.short _0221C83A - _0221C5FE - 2 ; case 14
	.short _0221C84C - _0221C5FE - 2 ; case 15
	.short _0221C890 - _0221C5FE - 2 ; case 16
	.short _0221C8CA - _0221C5FE - 2 ; case 17
	.short _0221C90C - _0221C5FE - 2 ; case 18
	.short _0221C94C - _0221C5FE - 2 ; case 19
_0221C626:
	mov r0, #0x50
	bl sub_02037AC0
	mov r0, #2
	bl sub_0201A728
	add r0, r4, #0
	bl ov65_0221F760
	ldr r0, [r4, #8]
	mov r5, #0
	ldr r0, [r0, #8]
	bl GetPartyCount
	cmp r0, #0
	ble _0221C686
	mov r7, #0x7b
	lsl r7, r7, #2
_0221C64A:
	ldr r0, [r4, #8]
	add r1, r5, #0
	ldr r0, [r0, #8]
	bl GetPartyMonByIndex
	mov r1, #0xae
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	cmp r0, r7
	bne _0221C678
	add r0, r6, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0221C678
	add r0, r6, #0
	mov r1, #0
	bl Mon_UpdateShayminForme
_0221C678:
	ldr r0, [r4, #8]
	add r5, r5, #1
	ldr r0, [r0, #8]
	bl GetPartyCount
	cmp r5, r0
	blt _0221C64A
_0221C686:
	ldr r0, [r4, #0x58]
	add r0, r0, #1
	str r0, [r4, #0x58]
	b _0221C99E
_0221C68E:
	mov r0, #0x50
	bl sub_02037B38
	cmp r0, #0
	beq _0221C77A
	ldr r0, [r4, #8]
	ldr r0, [r0, #0x30]
	cmp r0, #0
	bne _0221C6A4
	mov r0, #6
	b _0221C6A6
_0221C6A4:
	mov r0, #2
_0221C6A6:
	str r0, [r4, #0x58]
	bl sub_0203769C
	cmp r0, #0
	bne _0221C6CA
	bl LCRandom
	mov r1, #0x3c
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r5, r0, #0x10
	bl sub_0203769C
	mov r1, #0x1f
	add r2, r5, #3
	bl ov65_0221DE10
_0221C6CA:
	ldr r0, [r4, #4]
	bl ov65_0221DE8C
	add r0, r4, #0
	bl ov65_0221F850
	b _0221C99E
_0221C6D8:
	ldr r1, _0221C9A4 ; =0x000022CC
	ldr r1, [r4, r1]
	cmp r1, #0
	beq _0221C77A
	add r0, r0, #1
	str r0, [r4, #0x58]
	b _0221C99E
_0221C6E6:
	ldr r0, _0221C9A4 ; =0x000022CC
	ldr r1, [r4, r0]
	sub r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0221C77A
	mov r0, #4
	str r0, [r4, #0x58]
	b _0221C99E
_0221C6FA:
	ldr r0, _0221C9A8 ; =0x000036A8
	add r0, r4, r0
	bl sub_02039EAC
	ldr r0, [r4, #0x58]
	add r0, r0, #1
	str r0, [r4, #0x58]
	b _0221C99E
_0221C70A:
	ldr r2, _0221C9A8 ; =0x000036A8
	ldr r0, [r4, #4]
	mov r1, #2
	add r2, r4, r2
	bl sub_02039EB4
	cmp r0, #0
	beq _0221C77A
	ldr r0, [r4, #0x58]
	add r0, r0, #1
	str r0, [r4, #0x58]
	b _0221C99E
_0221C722:
	mov r0, #1
	bl sub_020378E4
	mov r0, #0x51
	bl sub_02037AC0
	ldr r0, [r4, #0x58]
	add r0, r0, #1
	str r0, [r4, #0x58]
	b _0221C99E
_0221C736:
	mov r0, #0x51
	bl sub_02037B38
	cmp r0, #0
	beq _0221C77A
	ldr r0, [r4, #0x58]
	add r0, r0, #1
	str r0, [r4, #0x58]
	b _0221C99E
_0221C748:
	mov r0, #0
	str r0, [r4, #0x5c]
	str r0, [r4, #0x60]
	str r0, [r4, #0x64]
	bl sub_0203769C
	cmp r0, #1
	bne _0221C76C
	bl sub_0203769C
	ldr r1, _0221C9AC ; =0x00002224
	ldr r2, [r4, #0x5c]
	ldr r1, [r4, r1]
	bl ov65_0221DE64
	ldr r0, [r4, #0x5c]
	add r0, r0, #1
	str r0, [r4, #0x5c]
_0221C76C:
	ldr r0, [r4, #0x58]
	add r0, r0, #1
	str r0, [r4, #0x58]
	b _0221C99E
_0221C774:
	ldr r0, [r4, #0x60]
	cmp r0, #0
	bne _0221C77C
_0221C77A:
	b _0221C99E
_0221C77C:
	mov r0, #0xa
	str r0, [r4, #0x58]
	b _0221C99E
_0221C782:
	add r0, r0, #1
	str r0, [r4, #0x58]
	add r0, r4, #0
	bl ov65_0221C1C4
	b _0221C99E
_0221C78E:
	mov r1, #0
	ldr r0, _0221C9B0 ; =0x0000069C
	add r2, r4, #0
	add r5, r1, #0
_0221C796:
	add r1, r1, #1
	strh r5, [r2, r0]
	add r2, #0x10
	cmp r1, #0xd
	blt _0221C796
	ldr r0, _0221C9AC ; =0x00002224
	ldr r0, [r4, r0]
	bl GetPartyCount
	cmp r0, #0
	ble _0221C7D0
	ldr r0, _0221C9B0 ; =0x0000069C
	ldr r7, _0221C9AC ; =0x00002224
	add r6, r4, r0
_0221C7B2:
	ldr r0, _0221C9AC ; =0x00002224
	add r1, r5, #0
	ldr r0, [r4, r0]
	bl GetPartyMonByIndex
	add r1, r6, #0
	bl ov65_0221C9D8
	ldr r0, [r4, r7]
	add r6, #0x10
	add r5, r5, #1
	bl GetPartyCount
	cmp r5, r0
	blt _0221C7B2
_0221C7D0:
	ldr r0, _0221C9B4 ; =0x00002228
	mov r5, #0
	ldr r0, [r4, r0]
	bl GetPartyCount
	cmp r0, #0
	ble _0221C804
	ldr r0, _0221C9B0 ; =0x0000069C
	ldr r7, _0221C9B4 ; =0x00002228
	add r6, r4, r0
_0221C7E4:
	ldr r0, _0221C9B4 ; =0x00002228
	add r1, r5, #0
	ldr r0, [r4, r0]
	bl GetPartyMonByIndex
	add r1, r5, #6
	lsl r1, r1, #4
	add r1, r6, r1
	bl ov65_0221C9D8
	ldr r0, [r4, r7]
	add r5, r5, #1
	bl GetPartyCount
	cmp r5, r0
	blt _0221C7E4
_0221C804:
	ldr r0, _0221C9B8 ; =0x0000075C
	mov r1, #1
	strh r1, [r4, r0]
	ldr r0, [r4, #0x58]
	add r0, r0, #1
	str r0, [r4, #0x58]
	b _0221C99E
_0221C812:
	bl sub_0203769C
	bl sub_02034818
	ldr r2, _0221C9BC ; =0x00002230
	ldr r1, [r4, r2]
	add r2, r2, #4
	add r2, r4, r2
	bl ov65_0221DEA0
	ldr r0, [r4, #0x58]
	add r0, r0, #1
	str r0, [r4, #0x58]
	b _0221C99E
_0221C82E:
	ldr r1, [r4, #0x60]
	cmp r1, #3
	bne _0221C88E
	add r0, r0, #1
	str r0, [r4, #0x58]
	b _0221C99E
_0221C83A:
	ldr r0, [r4, #4]
	bl Sav2_Chatot_get
	bl ov65_0221DF0C
	ldr r0, [r4, #0x58]
	add r0, r0, #1
	str r0, [r4, #0x58]
	b _0221C99E
_0221C84C:
	ldr r1, [r4, #0x60]
	cmp r1, #4
	bne _0221C88E
	add r0, r0, #1
	str r0, [r4, #0x58]
	mov r0, #0x10
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, _0221C9AC ; =0x00002224
	mov r1, #0
	ldr r0, [r4, r0]
	add r2, r4, #0
	bl ov65_0221C46C
	ldr r0, _0221C9B4 ; =0x00002228
	mov r1, #6
	ldr r0, [r4, r0]
	add r2, r4, #0
	bl ov65_0221C46C
	mov r6, #0xd1
	mov r5, #0
	mov r7, #1
	lsl r6, r6, #2
_0221C87E:
	ldr r0, [r4, r6]
	add r1, r7, #0
	bl Set2dSpriteVisibleFlag
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #2
	blt _0221C87E
_0221C88E:
	b _0221C99E
_0221C890:
	mov r1, #0
	mov r0, #1
	add r2, r1, #0
	str r0, [sp]
	mov r0, #8
	sub r2, #0x10
	mov r3, #0x1e
	bl sub_0200B484
	mov r0, #1
	add r1, r0, #0
	bl ToggleBgLayer
	mov r0, #2
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #3
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	ldr r0, [r4, #0x58]
	add r0, r0, #1
	str r0, [r4, #0x58]
	b _0221C99E
_0221C8CA:
	mov r0, #1
	bl sub_0200B5C0
	cmp r0, #0
	beq _0221C99E
	ldr r0, _0221C9AC ; =0x00002224
	mov r1, #0
	ldr r0, [r4, r0]
	bl GetPartyMonByIndex
	ldr r2, _0221C9C0 ; =0x000007FC
	ldr r3, _0221C9C4 ; =0x000020FC
	add r1, r0, #0
	mov r0, #0
	add r2, r4, r2
	add r3, r4, r3
	bl ov65_0221D57C
	ldr r1, _0221C9C8 ; =0x0000211C
	ldr r2, _0221C9AC ; =0x00002224
	str r0, [r4, r1]
	str r4, [sp]
	ldr r0, _0221C9CC ; =0x00000444
	mov r1, #0
	ldr r2, [r4, r2]
	add r0, r4, r0
	add r3, r1, #0
	bl ov65_0221D674
	ldr r0, [r4, #0x58]
	add r0, r0, #1
	str r0, [r4, #0x58]
	b _0221C99E
_0221C90C:
	mov r1, #0
	mov r0, #2
	add r2, r1, #0
	str r0, [sp]
	mov r0, #8
	sub r2, #0x10
	mov r3, #0x17
	bl sub_0200B484
	mov r0, #4
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #5
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #6
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r0, [r4, #0x58]
	add r0, r0, #1
	str r0, [r4, #0x58]
	add r0, r4, #0
	bl ov65_0221F780
	b _0221C99E
_0221C94C:
	mov r0, #2
	bl sub_0200B5C0
	cmp r0, #0
	beq _0221C99E
	ldr r0, _0221C9D0 ; =0x000005B4
	mov r1, #1
	add r0, r4, r0
	bl ClearFrameAndWindow2
	mov r1, #0
	str r1, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x18
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r2, r1, #0
	add r3, r1, #0
	bl FillBgTilemapRect
	mov r3, #0x61
	lsl r3, r3, #2
	ldr r0, [r4, r3]
	add r3, #0xc
	str r0, [sp]
	ldr r0, _0221C9D4 ; =0x00000594
	ldr r3, [r4, r3]
	add r0, r4, r0
	mov r1, #0xf
	mov r2, #1
	bl ov65_0221FB90
	mov r0, #2
	bl sub_0201A738
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0221C99E:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221C9A4: .word 0x000022CC
_0221C9A8: .word 0x000036A8
_0221C9AC: .word 0x00002224
_0221C9B0: .word 0x0000069C
_0221C9B4: .word 0x00002228
_0221C9B8: .word 0x0000075C
_0221C9BC: .word 0x00002230
_0221C9C0: .word 0x000007FC
_0221C9C4: .word 0x000020FC
_0221C9C8: .word 0x0000211C
_0221C9CC: .word 0x00000444
_0221C9D0: .word 0x000005B4
_0221C9D4: .word 0x00000594
	thumb_func_end ov65_0221C5E0

	thumb_func_start ov65_0221C9D8
ov65_0221C9D8: ; 0x0221C9D8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl AcquireMonLock
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #0x9b
	mov r2, #0
	bl GetMonData
	strb r0, [r4, #4]
	add r0, r5, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	strh r0, [r4]
	add r0, r5, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	strb r0, [r4, #6]
	add r0, r5, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	strb r0, [r4, #5]
	add r0, r5, #0
	mov r1, #0x6f
	mov r2, #0
	bl GetMonData
	strh r0, [r4, #8]
	add r0, r5, #0
	mov r1, #0xa2
	mov r2, #0
	bl GetMonData
	str r0, [r4, #0xc]
	add r0, r5, #0
	mov r1, #6
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	bl ReleaseMonLock
	ldrh r0, [r4]
	cmp r0, #0
	beq _0221CA50
	ldrb r1, [r4, #6]
	mov r2, #0x1c
	bl GetMonBaseStat_HandleAlternateForme
	strh r0, [r4, #0xa]
_0221CA50:
	cmp r6, #0
	beq _0221CA60
	lsl r0, r6, #0x10
	lsr r0, r0, #0x10
	bl ItemIdIsMail
	add r0, r0, #1
	strh r0, [r4, #2]
_0221CA60:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov65_0221C9D8

	thumb_func_start ov65_0221CA64
ov65_0221CA64: ; 0x0221CA64
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	ldr r1, _0221CAD4 ; =0x0000040C
	lsl r7, r5, #2
	add r6, r0, r1
	add r4, r2, #0
	ldr r0, [r6, r7]
	add r1, r4, #7
	bl Set2dSpriteAnimSeqNo
	cmp r5, #2
	bne _0221CAA6
	mov r0, #0x20
	sub r1, r4, #1
	str r0, [sp]
	mov r0, #0x1a
	lsl r2, r1, #2
	ldr r1, _0221CAD8 ; =ov65_0221FEEC
	str r0, [sp, #4]
	mov r0, #0xa2
	ldr r1, [r1, r2]
	add r3, r0, #0
	mov r2, #5
	add r3, #0xbe
	bl GfGfxLoader_GXLoadPal
	ldr r0, [r6, r7]
	mov r1, #0xb
	bl sub_02024A14
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0221CAA6:
	cmp r5, #3
	bne _0221CACE
	mov r0, #0x20
	sub r1, r4, #1
	str r0, [sp]
	mov r0, #0x1a
	lsl r2, r1, #2
	ldr r1, _0221CAD8 ; =ov65_0221FEEC
	str r0, [sp, #4]
	mov r0, #0xa2
	ldr r1, [r1, r2]
	add r3, r0, #0
	mov r2, #5
	add r3, #0xde
	bl GfGfxLoader_GXLoadPal
	ldr r0, [r6, r7]
	mov r1, #0xc
	bl sub_02024A14
_0221CACE:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221CAD4: .word 0x0000040C
_0221CAD8: .word ov65_0221FEEC
	thumb_func_end ov65_0221CA64

	thumb_func_start ov65_0221CADC
ov65_0221CADC: ; 0x0221CADC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #6
	bl _s32_div_f
	ldr r0, _0221CB48 ; =0x00002228
	add r7, r1, #0
	ldr r0, [r5, r0]
	bl GetPartyMonByIndex
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #6
	bl _s32_div_f
	add r1, r6, #0
	ldr r2, _0221CB4C ; =0x000007FC
	mov r6, #0x32
	add r3, r0, #0
	lsl r6, r6, #6
	mul r6, r3
	add r2, r5, r2
	add r2, r2, r6
	ldr r6, _0221CB50 ; =0x000020FC
	lsl r3, r3, #4
	add r6, r5, r6
	mov r0, #1
	add r3, r6, r3
	bl ov65_0221D57C
	ldr r1, _0221CB54 ; =0x0000211C
	ldr r2, _0221CB48 ; =0x00002228
	str r0, [r5, r1]
	str r5, [sp]
	ldr r0, _0221CB58 ; =0x00000444
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r1, #1
	add r3, r7, #0
	bl ov65_0221D674
	lsl r2, r4, #4
	add r3, r5, r2
	mov r2, #0x6a
	lsl r2, r2, #4
	ldrb r2, [r3, r2]
	add r0, r5, #0
	mov r1, #3
	bl ov65_0221CA64
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221CB48: .word 0x00002228
_0221CB4C: .word 0x000007FC
_0221CB50: .word 0x000020FC
_0221CB54: .word 0x0000211C
_0221CB58: .word 0x00000444
	thumb_func_end ov65_0221CADC

	thumb_func_start ov65_0221CB5C
ov65_0221CB5C: ; 0x0221CB5C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x94
	ldr r1, [r1]
	cmp r1, #0xc
	beq _0221CBEE
	cmp r1, #6
	bge _0221CBD4
	ldr r0, _0221CBF0 ; =0x00002224
	ldr r0, [r5, r0]
	bl GetPartyMonByIndex
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	mov r1, #6
	bl _s32_div_f
	add r3, r0, #0
	ldr r2, _0221CBF4 ; =0x000007FC
	add r1, r4, #0
	add r4, r5, r2
	mov r2, #0x32
	lsl r2, r2, #6
	mul r2, r3
	add r2, r4, r2
	ldr r4, _0221CBF8 ; =0x000020FC
	lsl r3, r3, #4
	add r4, r5, r4
	mov r0, #0
	add r3, r4, r3
	bl ov65_0221D57C
	ldr r1, _0221CBFC ; =0x0000211C
	add r3, r5, #0
	str r0, [r5, r1]
	ldr r0, _0221CC00 ; =0x00000444
	ldr r2, _0221CBF0 ; =0x00002224
	str r5, [sp]
	add r3, #0x94
	ldr r2, [r5, r2]
	ldr r3, [r3]
	add r0, r5, r0
	mov r1, #0
	bl ov65_0221D674
	ldr r0, _0221CC00 ; =0x00000444
	mov r1, #1
	add r0, r5, r0
	add r2, r5, #0
	bl ov65_0221D8C4
	ldr r0, _0221CC04 ; =0x00000418
	mov r1, #0
	ldr r0, [r5, r0]
	bl Set2dSpriteVisibleFlag
	pop {r3, r4, r5, pc}
_0221CBD4:
	bl ov65_0221CADC
	ldr r0, _0221CC00 ; =0x00000444
	mov r1, #0
	add r0, r5, r0
	add r2, r5, #0
	bl ov65_0221D8C4
	ldr r0, _0221CC08 ; =0x00000414
	mov r1, #0
	ldr r0, [r5, r0]
	bl Set2dSpriteVisibleFlag
_0221CBEE:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0221CBF0: .word 0x00002224
_0221CBF4: .word 0x000007FC
_0221CBF8: .word 0x000020FC
_0221CBFC: .word 0x0000211C
_0221CC00: .word 0x00000444
_0221CC04: .word 0x00000418
_0221CC08: .word 0x00000414
	thumb_func_end ov65_0221CB5C

	thumb_func_start ov65_0221CC0C
ov65_0221CC0C: ; 0x0221CC0C
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _0221CCA8 ; =0x00002220
	add r4, r0, #0
	ldr r1, [r4, r1]
	cmp r1, #0
	beq _0221CC22
	blx r1
	mov r1, #0x53
	lsl r1, r1, #2
	str r0, [r4, r1]
_0221CC22:
	mov r0, #0x53
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #3
	bhi _0221CC4C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0221CC38: ; jump table
	.short _0221CC4C - _0221CC38 - 2 ; case 0
	.short _0221CC4C - _0221CC38 - 2 ; case 1
	.short _0221CC40 - _0221CC38 - 2 ; case 2
	.short _0221CC46 - _0221CC38 - 2 ; case 3
_0221CC40:
	add sp, #4
	mov r0, #2
	pop {r3, r4, pc}
_0221CC46:
	add sp, #4
	mov r0, #3
	pop {r3, r4, pc}
_0221CC4C:
	mov r0, #0
	mov r2, #0xd1
	str r0, [sp]
	mov r0, #0x56
	lsl r2, r2, #2
	ldr r3, _0221CCAC ; =0x0000069C
	lsl r0, r0, #2
	add r1, r4, #0
	ldr r2, [r4, r2]
	add r0, r4, r0
	add r1, #0x94
	add r3, r4, r3
	bl ov65_0221DDC0
	cmp r0, #0
	beq _0221CC72
	add r0, r4, #0
	bl ov65_0221CB5C
_0221CC72:
	mov r0, #1
	mov r2, #0xd2
	str r0, [sp]
	mov r0, #0x57
	lsl r2, r2, #2
	ldr r3, _0221CCAC ; =0x0000069C
	lsl r0, r0, #2
	add r1, r4, #0
	ldr r2, [r4, r2]
	add r0, r4, r0
	add r1, #0x98
	add r3, r4, r3
	bl ov65_0221DDC0
	add r0, r4, #0
	add r0, #0x9c
	bl ov65_0221DCBC
	add r0, r4, #0
	add r4, #0x94
	ldr r2, [r4]
	mov r1, #0x17
	bl ov65_0221DE24
	mov r0, #1
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0221CCA8: .word 0x00002220
_0221CCAC: .word 0x0000069C
	thumb_func_end ov65_0221CC0C

	thumb_func_start ov65_0221CCB0
ov65_0221CCB0: ; 0x0221CCB0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r0, #0xb7
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl sub_0200AEB0
	mov r0, #0xbb
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl sub_0200AEB0
	mov r0, #0x2e
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	bl sub_0200B0A8
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	bl sub_0200B0A8
	mov r7, #0xb3
	mov r4, #0
	add r5, r6, #0
	lsl r7, r7, #2
_0221CCE4:
	ldr r0, [r5, r7]
	bl Destroy2DGfxResObjMan
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0221CCE4
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	bl sub_02024504
	bl OamManager_Free
	bl sub_0202168C
	bl sub_02022608
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov65_0221CCB0

	thumb_func_start ov65_0221CD0C
ov65_0221CD0C: ; 0x0221CD0C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0221CD64 ; =0x00002224
	mov r6, #0
	ldr r0, [r5, r0]
	bl GetPartyCount
	cmp r0, #0
	ble _0221CD38
	ldr r7, _0221CD64 ; =0x00002224
	add r4, r5, #0
_0221CD22:
	ldr r0, _0221CD68 ; =0x0000079C
	ldr r0, [r4, r0]
	bl FreeToHeap
	ldr r0, [r5, r7]
	add r4, r4, #4
	add r6, r6, #1
	bl GetPartyCount
	cmp r6, r0
	blt _0221CD22
_0221CD38:
	ldr r0, _0221CD6C ; =0x00002228
	mov r6, #0
	ldr r0, [r5, r0]
	bl GetPartyCount
	cmp r0, #0
	ble _0221CD60
	ldr r7, _0221CD6C ; =0x00002228
	add r4, r5, #0
_0221CD4A:
	ldr r0, _0221CD70 ; =0x000007B4
	ldr r0, [r4, r0]
	bl FreeToHeap
	ldr r0, [r5, r7]
	add r4, r4, #4
	add r6, r6, #1
	bl GetPartyCount
	cmp r6, r0
	blt _0221CD4A
_0221CD60:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221CD64: .word 0x00002224
_0221CD68: .word 0x0000079C
_0221CD6C: .word 0x00002228
_0221CD70: .word 0x000007B4
	thumb_func_end ov65_0221CD0C

	thumb_func_start ov65_0221CD74
ov65_0221CD74: ; 0x0221CD74
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	add r0, r5, #0
	bl OverlayManager_GetParentWork
	ldr r1, [r4, #0x68]
	str r1, [r0, #0x24]
	add r0, r4, #0
	bl ov65_0221CD0C
	mov r0, #0x67
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl String_dtor
	ldr r0, _0221CE14 ; =0x00002228
	ldr r0, [r4, r0]
	bl FreeToHeap
	add r0, r4, #0
	bl ov65_0221CCB0
	ldr r0, _0221CE18 ; =0x00000444
	add r0, r4, r0
	bl ov65_0221FAE0
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl ov65_0221D1C8
	mov r1, #6
	lsl r1, r1, #6
	ldr r1, [r4, r1]
	mov r0, #0x1a
	bl FreeToHeapExplicit
	mov r0, #0x19
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl DestroyMsgData
	mov r0, #0x63
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ScrStrBufs_delete
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ScrStrBufs_delete
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ScrStrBufs_delete
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl String_dtor
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r0, #4
	bl FontID_Release
	mov r0, #0x1a
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0221CE14: .word 0x00002228
_0221CE18: .word 0x00000444
	thumb_func_end ov65_0221CD74

	thumb_func_start ov65_0221CE1C
ov65_0221CE1C: ; 0x0221CE1C
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	ldr r0, _0221CE84 ; =0x0000211C
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0221CE6C
	sub r4, r0, #1
	ldr r0, _0221CE88 ; =0x000007FC
	mov r2, #0x32
	lsl r2, r2, #6
	add r1, r4, #0
	add r0, r5, r0
	mul r1, r2
	add r0, r0, r1
	bl GXS_LoadOBJ
	lsl r1, r4, #4
	mov r0, #0x20
	add r2, r5, r1
	str r0, [sp]
	mov r0, #0x1a
	add r3, r4, #2
	ldr r1, _0221CE8C ; =0x000020FC
	str r0, [sp, #4]
	ldrh r0, [r2, r1]
	add r1, r1, #4
	ldrh r1, [r2, r1]
	mov r2, #5
	lsl r3, r3, #5
	bl GfGfxLoader_GXLoadPal
	ldr r0, _0221CE84 ; =0x0000211C
	mov r1, #0
	str r1, [r5, r0]
_0221CE6C:
	bl GF_RunVramTransferTasks
	bl OamManager_ApplyAndResetBuffers
	ldr r3, _0221CE90 ; =0x027E0000
	ldr r1, _0221CE94 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0221CE84: .word 0x0000211C
_0221CE88: .word 0x000007FC
_0221CE8C: .word 0x000020FC
_0221CE90: .word 0x027E0000
_0221CE94: .word 0x00003FF8
	thumb_func_end ov65_0221CE1C

	thumb_func_start ov65_0221CE98
ov65_0221CE98: ; 0x0221CE98
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _0221CEB4 ; =ov65_0221FE44
	add r3, sp, #0
	mov r2, #5
_0221CEA2:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0221CEA2
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_0221CEB4: .word ov65_0221FE44
	thumb_func_end ov65_0221CE98

	thumb_func_start ov65_0221CEB8
ov65_0221CEB8: ; 0x0221CEB8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xd4
	ldr r4, _0221D0C0 ; =ov65_0221FD58
	add r3, sp, #0xc4
	add r5, r0, #0
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r4, _0221D0C4 ; =ov65_0221FDF0
	add r3, sp, #0xa8
	ldmia r4!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	mov r1, #0
	str r0, [r3]
	add r0, r5, #0
	add r3, r1, #0
	bl InitBgFromTemplate
	add r0, r5, #0
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	ldr r4, _0221D0C8 ; =ov65_0221FDB8
	add r3, sp, #0x8c
	ldmia r4!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	mov r1, #1
	str r0, [r3]
	add r0, r5, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r5, #0
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	ldr r4, _0221D0CC ; =ov65_0221FE0C
	add r3, sp, #0x70
	ldmia r4!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	mov r1, #2
	str r0, [r3]
	add r0, r5, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r5, #0
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r4, _0221D0D0 ; =ov65_0221FE28
	add r3, sp, #0x54
	ldmia r4!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	mov r1, #3
	str r0, [r3]
	add r0, r5, #0
	mov r3, #0
	bl InitBgFromTemplate
	ldr r4, _0221D0D4 ; =ov65_0221FD80
	add r3, sp, #0x38
	ldmia r4!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	str r0, [r3]
	add r0, r5, #0
	mov r1, #4
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r5, #0
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	ldr r4, _0221D0D8 ; =ov65_0221FD9C
	add r3, sp, #0x1c
	ldmia r4!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	mov r1, #5
	str r0, [r3]
	add r0, r5, #0
	mov r3, #0
	bl InitBgFromTemplate
	ldr r4, _0221D0DC ; =ov65_0221FDD4
	add r3, sp, #0
	ldmia r4!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	mov r1, #6
	str r0, [r3]
	add r0, r5, #0
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	mov r3, #0x1a
	bl BG_ClearCharDataRange
	mov r0, #1
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x1a
	bl BG_ClearCharDataRange
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x1a
	bl BG_ClearCharDataRange
	mov r4, #0
	mov r6, #3
	add r7, r4, #0
_0221CFFC:
	lsl r1, r4, #0x18
	mov r2, #0
	add r0, r5, #0
	lsr r1, r1, #0x18
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	add r2, r6, #0
	add r3, r7, #0
	bl BgSetPosTextAndCommit
	add r1, r4, #4
	lsl r1, r1, #0x18
	mov r2, #0
	add r0, r5, #0
	lsr r1, r1, #0x18
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	add r1, r4, #4
	lsl r1, r1, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	mov r2, #3
	mov r3, #0
	bl BgSetPosTextAndCommit
	add r4, r4, #1
	cmp r4, #4
	blt _0221CFFC
	mov r0, #0
	add r1, r0, #0
	bl ToggleBgLayer
	mov r0, #1
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #2
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #3
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #4
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #5
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #6
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #1
	lsl r0, r0, #0x1a
	add r3, r0, #0
	ldr r2, [r0]
	ldr r1, _0221D0E0 ; =0xFFFF1FFF
	add r3, #0x48
	and r1, r2
	str r1, [r0]
	ldrh r4, [r3]
	mov r1, #0x3f
	mov r2, #0x1f
	bic r4, r1
	orr r4, r2
	strh r4, [r3]
	add r3, r0, #0
	add r3, #0x4a
	ldrh r4, [r3]
	bic r4, r1
	orr r2, r4
	mov r1, #0x20
	orr r1, r2
	strh r1, [r3]
	add r1, r0, #0
	mov r2, #0xf
	lsl r2, r2, #0xc
	add r1, #0x40
	strh r2, [r1]
	ldr r2, _0221D0E4 ; =0x04000304
	mov r1, #0x10
	add r0, #0x44
	strh r1, [r0]
	ldrh r1, [r2]
	ldr r0, _0221D0E8 ; =0xFFFF7FFF
	and r0, r1
	strh r0, [r2]
	add sp, #0xd4
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0221D0C0: .word ov65_0221FD58
_0221D0C4: .word ov65_0221FDF0
_0221D0C8: .word ov65_0221FDB8
_0221D0CC: .word ov65_0221FE0C
_0221D0D0: .word ov65_0221FE28
_0221D0D4: .word ov65_0221FD80
_0221D0D8: .word ov65_0221FD9C
_0221D0DC: .word ov65_0221FDD4
_0221D0E0: .word 0xFFFF1FFF
_0221D0E4: .word 0x04000304
_0221D0E8: .word 0xFFFF7FFF
	thumb_func_end ov65_0221CEB8

	thumb_func_start ov65_0221D0EC
ov65_0221D0EC: ; 0x0221D0EC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, r1, #0
	bl OverlayManager_GetParentWork
	add r4, r0, #0
	mov r2, #6
	ldr r0, _0221D1B0 ; =0x00000674
	str r4, [r5, #8]
	mov r1, #4
	str r1, [r5, r0]
	mov r3, #0
	str r3, [r5, #0x50]
	sub r0, r0, #4
	str r3, [r5, r0]
	mov r0, #0x5e
	lsl r0, r0, #2
	str r2, [r5, r0]
	add r1, r0, #4
	str r2, [r5, r1]
	add r1, r5, #0
	add r1, #0x94
	str r3, [r1]
	add r1, r5, #0
	add r1, #0x98
	str r2, [r1]
	sub r0, #0x2c
	str r3, [r5, r0]
	str r3, [r5, #0x54]
	ldr r0, _0221D1B4 ; =ov65_0221E050
	ldr r1, _0221D1B8 ; =0x00002220
	str r3, [r5, #0x58]
	str r0, [r5, r1]
	str r3, [r5, #0x6c]
	str r3, [r5, #0x70]
	ldr r0, _0221D1BC ; =0x0000211C
	str r3, [r5, #0x68]
	str r3, [r5, r0]
	ldr r0, _0221D1C0 ; =0x000036AC
	sub r6, r2, #7
	str r6, [r5, r0]
	add r2, r0, #4
	str r6, [r5, r2]
	add r2, r1, #0
	add r2, #0xac
	str r3, [r5, r2]
	add r2, r0, #0
	add r2, #0xc
	str r3, [r5, r2]
	add r0, #0x10
	str r3, [r5, r0]
	add r0, r1, #4
	ldr r2, [r4, #8]
	add r1, #0x10
	str r2, [r5, r0]
	ldr r0, [r4, #0xc]
	str r0, [r5, r1]
	ldr r0, [r4, #0x10]
	str r0, [r5, #4]
	bl SavArray_Party_sizeof
	add r1, r0, #0
	mov r0, #0x1a
	bl AllocFromHeap
	ldr r1, _0221D1C4 ; =0x00002228
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	mov r1, #6
	bl InitPartyWithMaxSize
	bl SavArray_Party_sizeof
	add r2, r0, #0
	ldr r0, _0221D1C4 ; =0x00002228
	mov r1, #0xff
	ldr r0, [r5, r0]
	bl memset
	ldr r0, [r4, #4]
	mov r1, #0x1a
	bl PlayerProfile_GetPlayerName_NewString
	mov r1, #0x66
	lsl r1, r1, #2
	str r0, [r5, r1]
	sub r1, #8
	ldr r0, [r5, r1]
	mov r1, #0x2a
	bl NewString_ReadMsgData
	mov r1, #0x67
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r4, #0x14]
	bl sub_02039F68
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0221D1B0: .word 0x00000674
_0221D1B4: .word ov65_0221E050
_0221D1B8: .word 0x00002220
_0221D1BC: .word 0x0000211C
_0221D1C0: .word 0x000036AC
_0221D1C4: .word 0x00002228
	thumb_func_end ov65_0221D0EC

	thumb_func_start ov65_0221D1C8
ov65_0221D1C8: ; 0x0221D1C8
	push {r4, lr}
	add r4, r0, #0
	mov r1, #6
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #5
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #4
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #3
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #2
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #1
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #0
	bl FreeBgTilemapBuffer
	pop {r4, pc}
	thumb_func_end ov65_0221D1C8

	thumb_func_start ov65_0221D204
ov65_0221D204: ; 0x0221D204
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r2, #0
	mov r2, #1
	add r4, r3, #0
	str r2, [sp]
	ldr r2, [sp, #0x20]
	ldr r3, [sp, #0x24]
	bl GfGfxLoader_LoadFromOpenNarc
	add r6, r0, #0
	beq _0221D256
	add r1, sp, #4
	bl NNS_G2dGetUnpackedScreenData
	cmp r0, #0
	beq _0221D250
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	bne _0221D232
	ldr r0, [sp, #4]
	ldr r0, [r0, #8]
	str r0, [sp, #0x1c]
_0221D232:
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl GetBgTilemapBuffer
	cmp r0, #0
	beq _0221D250
	ldr r2, [sp, #4]
	lsl r1, r4, #0x18
	ldr r3, [sp, #0x1c]
	add r0, r5, #0
	lsr r1, r1, #0x18
	add r2, #0xc
	bl BG_LoadScreenTilemapData
_0221D250:
	add r0, r6, #0
	bl FreeToHeap
_0221D256:
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov65_0221D204

	thumb_func_start ov65_0221D25C
ov65_0221D25C: ; 0x0221D25C
	push {r3, r4, lr}
	sub sp, #4
	mov r1, #2
	add r4, r0, #0
	bl GetBgTilemapBuffer
	add r2, r0, #0
	mov r0, #0
	mov r3, #6
	str r0, [sp]
	add r0, r4, #0
	mov r1, #2
	lsl r3, r3, #8
	bl BgCopyOrUncompressTilemapBufferRangeToVram
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov65_0221D25C

	thumb_func_start ov65_0221D280
ov65_0221D280: ; 0x0221D280
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r1, #0
	mov r1, #6
	lsl r1, r1, #6
	ldr r4, [r0, r1]
	sub r1, #0x60
	str r1, [sp]
	mov r0, #0x1a
	mov r1, #0
	str r0, [sp, #4]
	add r0, r5, #0
	mov r2, #4
	add r3, r1, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r1, #0
	mov r0, #0x12
	lsl r0, r0, #4
	str r0, [sp]
	mov r0, #0x1a
	str r0, [sp, #4]
	add r0, r5, #0
	add r2, r1, #0
	add r3, r1, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0
	add r1, r0, #0
	bl BG_SetMaskColor
	mov r0, #4
	mov r1, #0
	bl BG_SetMaskColor
	mov r1, #0x1a
	mov r0, #0
	lsl r1, r1, #4
	mov r2, #0x1a
	bl LoadFontPal1
	mov r0, #0
	str r0, [sp]
	mov r0, #9
	lsl r0, r0, #0xa
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r0, #0x1a
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r2, r4, #0
	mov r3, #2
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x1a
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r1, #3
	add r2, r4, #0
	mov r3, #2
	bl ov65_0221D204
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x1a
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r1, #4
	add r2, r4, #0
	mov r3, #3
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	mov r1, #0x40
	mov r2, #0x1a
	bl LoadFontPal1
	mov r0, #0
	mov r1, #0x60
	mov r2, #0x1a
	bl LoadFontPal0
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	lsl r0, r0, #0xa
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x1a
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r1, #2
	add r2, r4, #0
	mov r3, #5
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x1a
	mov r1, #5
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r2, r4, #0
	add r3, r1, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x1a
	mov r1, #6
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r2, r4, #0
	add r3, r1, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #4
	mov r1, #0x40
	mov r2, #0x1a
	bl LoadFontPal1
	mov r0, #4
	mov r1, #0x60
	mov r2, #0x1a
	bl LoadFontPal0
	add r0, r4, #0
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov65_0221D280

	thumb_func_start ov65_0221D3B8
ov65_0221D3B8: ; 0x0221D3B8
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _0221D3E4 ; =ov65_0221FD48
	add r3, sp, #0
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl sub_020215A0
	mov r0, #0x14
	mov r1, #0x1a
	bl sub_02022588
	bl sub_020216C8
	bl sub_02022638
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_0221D3E4: .word ov65_0221FD48
	thumb_func_end ov65_0221D3B8

	thumb_func_start ov65_0221D3E8
ov65_0221D3E8: ; 0x0221D3E8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r7, r1, #0
	bl NNS_G2dInitOamManagerModule
	mov r0, #0
	str r0, [sp]
	mov r1, #0x64
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r3, #0x20
	str r3, [sp, #0xc]
	mov r2, #0x1a
	str r2, [sp, #0x10]
	add r2, r0, #0
	bl OamManager_Create
	mov r1, #0x69
	lsl r1, r1, #2
	mov r0, #0x2d
	add r1, r5, r1
	mov r2, #0x1a
	bl G2dRenderer_Init
	mov r1, #0x1a
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r6, #0
	add r4, r5, #0
_0221D424:
	mov r0, #2
	add r1, r6, #0
	mov r2, #0x1a
	bl Create2DGfxResObjMan
	mov r1, #0xb3
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #4
	blt _0221D424
	mov r0, #0
	str r0, [sp]
	mov r3, #1
	str r3, [sp, #4]
	mov r0, #0x1a
	str r0, [sp, #8]
	add r0, r1, #0
	ldr r0, [r5, r0]
	add r1, r7, #0
	mov r2, #7
	bl AddCharResObjFromOpenNarc
	mov r1, #0xb7
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r2, #0
	str r2, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #9
	str r0, [sp, #8]
	mov r0, #0x1a
	sub r1, #0xc
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	add r1, r7, #0
	add r3, r2, #0
	bl AddPlttResObjFromOpenNarc
	mov r1, #0x2e
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x1a
	sub r1, #0xc
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r7, #0
	mov r2, #8
	mov r3, #1
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0xb9
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x1a
	sub r1, #0xc
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r7, #0
	mov r2, #9
	mov r3, #1
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0xba
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r3, #1
	str r3, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x1a
	sub r1, #0x1c
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r7, #0
	mov r2, #0xa
	bl AddCharResObjFromOpenNarc
	mov r1, #0xbb
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0xa
	str r0, [sp, #8]
	mov r0, #0x1a
	mov r2, #0
	sub r1, #0x1c
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	add r1, r7, #0
	add r3, r2, #0
	bl AddPlttResObjFromOpenNarc
	mov r1, #0x2f
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r3, #1
	str r3, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x1a
	sub r1, #0x1c
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r7, #0
	mov r2, #0xb
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0xbd
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r3, #1
	str r3, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x1a
	sub r1, #0x1c
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r7, #0
	mov r2, #0xc
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0xbe
	lsl r1, r1, #2
	str r0, [r5, r1]
	sub r1, #0x1c
	ldr r0, [r5, r1]
	bl sub_0200ACF0
	mov r0, #0xbb
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200ACF0
	mov r0, #0x2e
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_0200AF94
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_0200AF94
	bl sub_02074490
	add r1, r0, #0
	mov r0, #0x80
	str r0, [sp]
	mov r0, #0x1a
	str r0, [sp, #4]
	mov r0, #0x14
	mov r2, #1
	lsl r3, r0, #4
	bl GfGfxLoader_GXLoadPal
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov65_0221D3E8

	thumb_func_start ov65_0221D57C
ov65_0221D57C: ; 0x0221D57C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r7, r0, #0
	add r6, r2, #0
	add r0, r3, #0
	mov r2, #2
	add r5, r1, #0
	str r3, [sp, #0x20]
	bl GetPokemonSpriteCharAndPlttNarcIds
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	bl GetMonData
	str r0, [sp, #0x24]
	add r0, r5, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #1
	bne _0221D5C0
	ldr r0, _0221D5F8 ; =0x00000147
	cmp r4, r0
	bne _0221D5C0
	add r4, r0, #0
	add r4, #0xa7
_0221D5C0:
	mov r3, #0
	str r3, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #0x24]
	str r6, [sp, #0xc]
	str r0, [sp, #0x10]
	str r3, [sp, #0x14]
	mov r0, #2
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x20]
	str r4, [sp, #0x1c]
	ldr r1, [sp, #0x20]
	ldrh r0, [r0]
	ldrh r1, [r1, #2]
	mov r2, #0x1a
	bl sub_02014494
	mov r1, #0x32
	add r0, r6, #0
	lsl r1, r1, #6
	bl DC_FlushRange
	add r0, r7, #1
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221D5F8: .word 0x00000147
	thumb_func_end ov65_0221D57C

	thumb_func_start ov65_0221D5FC
ov65_0221D5FC: ; 0x0221D5FC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	mov r0, #0x14
	mov r1, #0x1a
	str r3, [sp, #8]
	bl String_ctor
	add r4, r0, #0
	add r0, r6, #0
	add r1, r7, #0
	bl GetPartyMonByIndex
	mov r1, #0x77
	add r2, r4, #0
	bl GetMonData
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x20]
	ldr r2, [sp, #8]
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl ov65_0221FB4C
	add r0, r4, #0
	bl String_dtor
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov65_0221D5FC

	thumb_func_start ov65_0221D648
ov65_0221D648: ; 0x0221D648
	push {r4, lr}
	ldrh r0, [r0]
	add r4, r3, #0
	cmp r0, #0x1d
	beq _0221D656
	cmp r0, #0x20
	bne _0221D66E
_0221D656:
	add r0, r1, #0
	add r1, r2, #0
	bl GetPartyMonByIndex
	mov r1, #0x4d
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0221D66E
	mov r0, #2
	pop {r4, pc}
_0221D66E:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov65_0221D648

	thumb_func_start ov65_0221D674
ov65_0221D674: ; 0x0221D674
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	add r7, r0, #0
	add r5, r1, #0
	add r0, r2, #0
	add r1, r3, #0
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	ldr r4, [sp, #0x50]
	bl GetPartyMonByIndex
	mov r1, #2
	bl sub_0207083C
	str r0, [sp, #0x10]
	ldr r0, _0221D8AC ; =0x0000040C
	mov r1, #1
	add r6, r4, r0
	lsl r0, r5, #2
	str r0, [sp, #0x14]
	ldr r0, [r6, r0]
	bl Set2dSpriteVisibleFlag
	mov r0, #0xc
	add r3, r5, #0
	mul r3, r0
	ldr r1, _0221D8B0 ; =ov65_0221FEA4
	ldr r0, [sp, #0x14]
	ldr r2, _0221D8B4 ; =ov65_0221FEA8
	ldr r1, [r1, r3]
	ldr r3, [r2, r3]
	ldr r2, [sp, #0x10]
	ldr r0, [r6, r0]
	add r2, r2, r3
	add r2, #0xc0
	bl ov65_0221F748
	cmp r5, #0
	bne _0221D6D4
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #0x14]
	lsl r1, r1, #4
	add r2, r4, r1
	ldr r1, _0221D8B8 ; =0x000006A6
	ldr r0, [r6, r0]
	ldrh r1, [r2, r1]
	bl sub_02024890
_0221D6D4:
	ldr r2, [sp, #0xc]
	add r0, r4, #0
	lsl r2, r2, #4
	add r3, r4, r2
	mov r2, #0x6a
	lsl r2, r2, #4
	ldrb r2, [r3, r2]
	add r1, r5, #2
	bl ov65_0221CA64
	add r0, r5, #2
	lsl r0, r0, #2
	add r1, r4, r0
	ldr r0, _0221D8AC ; =0x0000040C
	ldr r0, [r1, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #6
	str r0, [sp]
	add r0, r5, #0
	add r0, #0x1a
	lsl r0, r0, #4
	ldr r1, [sp, #8]
	ldr r2, [sp, #0xc]
	add r0, r7, r0
	mov r3, #9
	bl ov65_0221D5FC
	mov r0, #6
	add r1, r5, #0
	mul r1, r0
	ldr r0, [sp, #0xc]
	ldr r2, [sp, #0xc]
	add r0, r0, r1
	lsl r0, r0, #4
	str r0, [sp, #0x34]
	ldr r0, _0221D8BC ; =0x0000069C
	ldr r3, [sp, #0x34]
	mov ip, r0
	add r3, r4, r3
	str r3, [sp, #0x30]
	mov r3, ip
	add r1, r4, r0
	ldr r0, [sp, #0x34]
	ldr r6, [sp, #0x30]
	add r3, #8
	add r0, r1, r0
	ldrh r3, [r6, r3]
	ldr r1, [sp, #8]
	bl ov65_0221D648
	ldr r1, _0221D8C0 ; =0x000006A1
	add r2, r4, r1
	ldr r1, [sp, #0x34]
	str r2, [sp, #0x18]
	ldrb r1, [r2, r1]
	cmp r1, #0
	beq _0221D74C
	mov r0, #2
_0221D74C:
	cmp r0, #0
	beq _0221D76A
	cmp r0, #1
	beq _0221D78E
	cmp r0, #2
	bne _0221D7B0
	add r0, r5, #4
	lsl r0, r0, #2
	add r1, r4, r0
	ldr r0, _0221D8AC ; =0x0000040C
	ldr r0, [r1, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	b _0221D7B0
_0221D76A:
	ldr r0, _0221D8AC ; =0x0000040C
	add r0, r4, r0
	str r0, [sp, #0x1c]
	add r0, r5, #4
	lsl r0, r0, #2
	ldr r1, [sp, #0x1c]
	str r0, [sp, #0x20]
	ldr r0, [r1, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r1, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	ldr r0, [r1, r0]
	mov r1, #7
	bl Set2dSpriteAnimSeqNo
	b _0221D7B0
_0221D78E:
	ldr r0, _0221D8AC ; =0x0000040C
	add r0, r4, r0
	str r0, [sp, #0x24]
	add r0, r5, #4
	lsl r0, r0, #2
	ldr r1, [sp, #0x24]
	str r0, [sp, #0x28]
	ldr r0, [r1, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r1, [sp, #0x24]
	ldr r0, [sp, #0x28]
	ldr r0, [r1, r0]
	mov r1, #6
	bl Set2dSpriteAnimSeqNo
_0221D7B0:
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x34]
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _0221D836
	mov r0, #0xa
	mov r1, #0x1a
	bl String_ctor
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0x1c
	lsl r0, r0, #4
	str r0, [sp, #0x2c]
	add r0, r7, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x19
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0x29
	add r2, r6, #0
	bl ReadMsgDataIntoString
	mov r0, #6
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	add r1, r6, #0
	add r0, r7, r0
	mov r2, #9
	mov r3, #0xff
	bl ov65_0221FB4C
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	bl GetPartyMonByIndex
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	mov r0, #1
	str r0, [sp]
	add r0, r6, #0
	mov r2, #3
	mov r3, #0
	bl String16_FormatInteger
	mov r0, #0x1e
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	mov r3, #0
	add r0, r7, r0
	add r1, r6, #0
	mov r2, #9
	str r3, [sp, #4]
	bl ov65_0221FB4C
	add r0, r6, #0
	bl String_dtor
	b _0221D842
_0221D836:
	add r0, r5, #0
	add r0, #0x1c
	lsl r0, r0, #4
	add r0, r7, r0
	bl ClearWindowTilemapAndCopyToVram
_0221D842:
	mov r0, #3
	str r0, [sp]
	mov r3, #0
	add r0, r5, #0
	mov r1, #0x67
	add r0, #0x1e
	lsl r0, r0, #4
	str r3, [sp, #4]
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, r7, r0
	mov r2, #7
	bl ov65_0221FB4C
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	bl GetPartyMonByIndex
	mov r1, #6
	mov r2, #0
	bl GetMonData
	add r5, #0x20
	lsl r0, r0, #0x10
	lsl r4, r5, #4
	lsr r6, r0, #0x10
	add r0, r7, r4
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x14
	mov r1, #0x1a
	bl String_ctor
	add r1, r6, #0
	mov r2, #0x1a
	add r5, r0, #0
	bl GetItemNameIntoString
	mov r0, #3
	str r0, [sp]
	mov r3, #0
	add r0, r7, r4
	add r1, r5, #0
	mov r2, #9
	str r3, [sp, #4]
	bl ov65_0221FB4C
	add r0, r5, #0
	bl String_dtor
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221D8AC: .word 0x0000040C
_0221D8B0: .word ov65_0221FEA4
_0221D8B4: .word ov65_0221FEA8
_0221D8B8: .word 0x000006A6
_0221D8BC: .word 0x0000069C
_0221D8C0: .word 0x000006A1
	thumb_func_end ov65_0221D674

	thumb_func_start ov65_0221D8C4
ov65_0221D8C4: ; 0x0221D8C4
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	lsl r0, r4, #2
	add r1, r6, r0
	ldr r0, _0221D92C ; =0x0000040C
	ldr r0, [r1, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r4, #2
	lsl r0, r0, #2
	add r1, r6, r0
	ldr r0, _0221D92C ; =0x0000040C
	ldr r0, [r1, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r4, #4
	lsl r0, r0, #2
	add r1, r6, r0
	ldr r0, _0221D92C ; =0x0000040C
	ldr r0, [r1, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	add r0, #0x1a
	lsl r0, r0, #4
	add r0, r5, r0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r4, #0
	add r0, #0x1c
	lsl r0, r0, #4
	add r0, r5, r0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r4, #0
	add r0, #0x1e
	lsl r0, r0, #4
	add r0, r5, r0
	bl ClearWindowTilemapAndCopyToVram
	add r4, #0x20
	lsl r0, r4, #4
	add r0, r5, r0
	bl ClearWindowTilemapAndCopyToVram
	pop {r4, r5, r6, pc}
	nop
_0221D92C: .word 0x0000040C
	thumb_func_end ov65_0221D8C4

	thumb_func_start ov65_0221D930
ov65_0221D930: ; 0x0221D930
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	mov r1, #0
	add r5, r0, #0
	str r1, [sp]
	sub r0, r1, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r2, #0xb3
	str r1, [sp, #0xc]
	mov r0, #2
	lsl r2, r2, #2
	str r0, [sp, #0x10]
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
	add r2, #0x30
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, r5, r2
	add r2, r1, #0
	str r1, [sp, #0x28]
	bl CreateSpriteResourcesHeader
	mov r1, #1
	mov r3, #0xb3
	str r1, [sp]
	sub r0, r1, #2
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	lsl r3, r3, #2
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
	add r3, #0x54
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, r5, r3
	add r2, r1, #0
	add r3, r1, #0
	bl CreateSpriteResourcesHeader
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #2
	str r0, [sp, #0x2c]
	mov r0, #0xbf
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [sp, #0x30]
	mov r0, #6
	lsl r1, r1, #0x10
	lsl r0, r0, #0x10
	str r0, [sp, #0x38]
	lsr r0, r1, #5
	mov r7, #0
	str r1, [sp, #0x34]
	str r7, [sp, #0x3c]
	str r0, [sp, #0x40]
	str r0, [sp, #0x44]
	str r0, [sp, #0x48]
	add r0, sp, #0x2c
	strh r7, [r0, #0x20]
	mov r0, #1
	str r0, [sp, #0x54]
	mov r0, #0x1a
	ldr r6, _0221DBE4 ; =ov65_0221FF4C
	str r7, [sp, #0x50]
	str r0, [sp, #0x58]
	add r4, r5, #0
_0221D9EC:
	ldr r0, [r6]
	lsl r0, r0, #0xc
	str r0, [sp, #0x34]
	ldr r0, [r6, #4]
	lsl r0, r0, #0xc
	str r0, [sp, #0x38]
	add r0, sp, #0x2c
	bl CreateSprite
	mov r1, #0xd1
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r1, #0
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	add r0, r4, #0
	mov r1, #0xd1
	add r0, #0x94
	lsl r1, r1, #2
	ldr r0, [r0]
	ldr r1, [r4, r1]
	add r2, r7, #0
	bl ov65_0221DD34
	mov r0, #0xd1
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x64
	bl sub_02024ADC
	mov r0, #0xd1
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0xd1
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_02024B78
	add r7, r7, #1
	add r6, #8
	add r4, r4, #4
	cmp r7, #2
	blt _0221D9EC
	ldr r6, _0221DBE4 ; =ov65_0221FF4C
	mov r7, #0
	add r4, r5, #0
_0221DA54:
	ldr r0, [r6]
	add r0, #0x10
	lsl r0, r0, #0xc
	str r0, [sp, #0x34]
	ldr r0, [r6, #4]
	sub r0, r0, #6
	lsl r0, r0, #0xc
	str r0, [sp, #0x38]
	add r0, sp, #0x2c
	bl CreateSprite
	mov r1, #0xdf
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r1, #0
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #0xdf
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, r7, #5
	bl Set2dSpriteAnimSeqNo
	mov r0, #0xdf
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #5
	bl sub_02024ADC
	mov r0, #0xdf
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0xdf
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_02024B78
	add r7, r7, #1
	add r6, #8
	add r4, r4, #4
	cmp r7, #0xc
	blt _0221DA54
	ldr r6, _0221DBE4 ; =ov65_0221FF4C
	mov r7, #0
	add r4, r5, #0
_0221DABA:
	ldr r0, [r6]
	add r0, #0x24
	lsl r0, r0, #0xc
	str r0, [sp, #0x34]
	ldr r0, [r6, #4]
	add r0, #0x10
	lsl r0, r0, #0xc
	str r0, [sp, #0x38]
	mov r0, #0
	str r0, [sp, #0x50]
	add r0, sp, #0x2c
	bl CreateSprite
	mov r1, #0xeb
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r1, #0
	ldr r0, [r4, r0]
	mov r1, #3
	bl sub_02024ADC
	mov r0, #0xeb
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0xeb
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_02024B78
	add r7, r7, #1
	add r6, #8
	add r4, r4, #4
	cmp r7, #0xc
	blt _0221DABA
	ldr r6, _0221DBE4 ; =ov65_0221FF4C
	mov r7, #0
	add r4, r5, #0
_0221DB0C:
	ldr r0, [r6]
	add r0, #0x2d
	lsl r0, r0, #0xc
	str r0, [sp, #0x34]
	ldr r0, [r6, #4]
	add r0, #0x10
	lsl r0, r0, #0xc
	str r0, [sp, #0x38]
	mov r0, #0
	str r0, [sp, #0x50]
	add r0, sp, #0x2c
	bl CreateSprite
	mov r1, #0xf7
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r1, #0
	ldr r0, [r4, r0]
	mov r1, #3
	bl sub_02024ADC
	mov r0, #0xf7
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0xf7
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_02024B78
	add r7, r7, #1
	add r6, #8
	add r4, r4, #4
	cmp r7, #0xc
	blt _0221DB0C
	mov r0, #6
	lsl r0, r0, #0x10
	str r0, [sp, #0x34]
	mov r0, #0x42
	lsl r0, r0, #0xc
	str r0, [sp, #0x38]
	add r0, sp, #0x2c
	bl CreateSprite
	ldr r1, _0221DBE8 ; =0x00000424
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	ldr r0, _0221DBE8 ; =0x00000424
	mov r1, #0x14
	ldr r0, [r5, r0]
	bl Set2dSpriteAnimSeqNo
	ldr r0, _0221DBE8 ; =0x00000424
	mov r1, #0
	ldr r0, [r5, r0]
	bl Set2dSpriteVisibleFlag
	mov r0, #0x32
	lsl r0, r0, #4
	ldr r4, _0221DBEC ; =ov65_0221FEA4
	mov r6, #0
	add r7, r5, r0
_0221DB94:
	ldr r0, [r4]
	str r7, [sp, #0x30]
	lsl r0, r0, #0xc
	str r0, [sp, #0x34]
	ldr r0, [r4, #4]
	lsl r1, r0, #0xc
	mov r0, #3
	lsl r0, r0, #0x12
	add r0, r1, r0
	str r0, [sp, #0x38]
	mov r0, #2
	str r0, [sp, #0x54]
	add r0, sp, #0x2c
	bl CreateSprite
	ldr r1, _0221DBF0 ; =0x0000040C
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, _0221DBF0 ; =0x0000040C
	mov r1, #0
	ldr r0, [r5, r0]
	bl Set2dSpriteAnimActiveFlag
	ldr r0, _0221DBF0 ; =0x0000040C
	ldr r1, [r4, #8]
	ldr r0, [r5, r0]
	bl Set2dSpriteAnimSeqNo
	add r6, r6, #1
	add r4, #0xc
	add r5, r5, #4
	cmp r6, #6
	blt _0221DB94
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	nop
_0221DBE4: .word ov65_0221FF4C
_0221DBE8: .word 0x00000424
_0221DBEC: .word ov65_0221FEA4
_0221DBF0: .word 0x0000040C
	thumb_func_end ov65_0221D930

	thumb_func_start ov65_0221DBF4
ov65_0221DBF4: ; 0x0221DBF4
	push {r3, r4}
	ldr r3, _0221DC30 ; =gSystem
	mov r1, #0
	ldr r3, [r3, #0x4c]
	mov r4, #0x40
	add r2, r1, #0
	tst r4, r3
	beq _0221DC08
	mov r2, #1
	add r1, r1, #1
_0221DC08:
	mov r4, #0x80
	tst r4, r3
	beq _0221DC12
	mov r2, #2
	add r1, r1, #1
_0221DC12:
	mov r4, #0x20
	tst r4, r3
	beq _0221DC1C
	mov r2, #3
	add r1, r1, #1
_0221DC1C:
	mov r4, #0x10
	tst r3, r4
	beq _0221DC26
	mov r2, #4
	add r1, r1, #1
_0221DC26:
	cmp r1, #0
	beq _0221DC2C
	str r2, [r0]
_0221DC2C:
	pop {r3, r4}
	bx lr
	.balign 4, 0
_0221DC30: .word gSystem
	thumb_func_end ov65_0221DBF4

	thumb_func_start ov65_0221DC34
ov65_0221DC34: ; 0x0221DC34
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x94
	ldr r0, [r0]
	cmp r0, #6
	bge _0221DCAA
	ldr r0, _0221DCAC ; =ov65_0221FE6C
	bl sub_02025224
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0221DCAA
	cmp r0, #6
	bge _0221DCAA
	lsl r0, r0, #4
	ldr r1, _0221DCB0 ; =0x0000069C
	add r0, r4, r0
	ldrh r0, [r0, r1]
	cmp r0, #0
	beq _0221DCAA
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	lsl r0, r0, #4
	add r2, r4, r0
	add r0, r1, #5
	ldrb r0, [r2, r0]
	cmp r0, #0
	bne _0221DCAA
	ldrh r0, [r2, r1]
	add r1, r1, #6
	ldrb r2, [r2, r1]
	ldr r1, _0221DCB4 ; =0x000001B9
	cmp r0, r1
	bne _0221DC8E
	ldr r0, [r4, #4]
	bl Sav2_Chatot_get
	mov r1, #0
	mov r2, #0x64
	add r3, r1, #0
	bl sub_02006E4C
	b _0221DC96
_0221DC8E:
	lsl r1, r2, #0x18
	lsr r1, r1, #0x18
	bl PlayCry
_0221DC96:
	ldr r0, _0221DCB8 ; =0x0000040C
	mov r1, #1
	ldr r0, [r4, r0]
	bl Set2dSpriteAnimActiveFlag
	ldr r0, _0221DCB8 ; =0x0000040C
	mov r1, #4
	ldr r0, [r4, r0]
	bl Set2dSpriteAnimSeqNo
_0221DCAA:
	pop {r4, pc}
	.balign 4, 0
_0221DCAC: .word ov65_0221FE6C
_0221DCB0: .word 0x0000069C
_0221DCB4: .word 0x000001B9
_0221DCB8: .word 0x0000040C
	thumb_func_end ov65_0221DC34

	thumb_func_start ov65_0221DCBC
ov65_0221DCBC: ; 0x0221DCBC
	push {r3, lr}
	ldrh r1, [r0]
	add r1, #0x14
	strh r1, [r0]
	ldrh r2, [r0]
	mov r1, #0x5a
	lsl r1, r1, #2
	cmp r2, r1
	bls _0221DCD2
	mov r1, #0
	strh r1, [r0]
_0221DCD2:
	ldrh r0, [r0]
	bl GF_SinDeg
	mov r1, #0xa
	mul r1, r0
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r0, r0, #0xc
	add r0, #0xf
	lsl r1, r0, #5
	mov r0, #0x1d
	orr r1, r0
	add r0, sp, #0
	strh r1, [r0]
	add r0, sp, #0
	mov r1, #0x3a
	mov r2, #2
	bl GX_LoadOBJPltt
	pop {r3, pc}
	thumb_func_end ov65_0221DCBC

	thumb_func_start ov65_0221DCFC
ov65_0221DCFC: ; 0x0221DCFC
	push {r3, r4, r5, r6}
	mov r5, #0x18
	mul r5, r0
	ldr r6, _0221DD30 ; =ov65_0221FFB4
	mov r0, #6
	mov r4, #0
	add r5, r6, r5
	mul r0, r1
	add r5, r5, r0
	add r3, r4, #0
	add r1, r5, #0
_0221DD12:
	ldrb r0, [r1]
	lsl r0, r0, #4
	ldrh r0, [r2, r0]
	cmp r0, #0
	beq _0221DD20
	ldrb r4, [r5, r3]
	b _0221DD28
_0221DD20:
	add r3, r3, #1
	add r1, r1, #1
	cmp r3, #6
	blt _0221DD12
_0221DD28:
	add r0, r4, #0
	pop {r3, r4, r5, r6}
	bx lr
	nop
_0221DD30: .word ov65_0221FFB4
	thumb_func_end ov65_0221DCFC

	thumb_func_start ov65_0221DD34
ov65_0221DD34: ; 0x0221DD34
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r6, r1, #0
	add r4, r2, #0
	cmp r5, #0xd
	blt _0221DD46
	bl GF_AssertFail
_0221DD46:
	ldr r1, _0221DDAC ; =ov65_0221FF4C
	lsl r0, r5, #3
	ldr r1, [r1, r0]
	lsl r1, r1, #0xc
	str r1, [sp]
	ldr r1, _0221DDB0 ; =ov65_0221FF50
	ldr r0, [r1, r0]
	add r1, sp, #0
	lsl r0, r0, #0xc
	str r0, [sp, #4]
	cmp r5, #0xc
	bne _0221DD78
	add r0, r6, #0
	bl sub_020247D4
	mov r1, #0xc
	add r2, r4, #0
	mul r2, r1
	ldr r1, _0221DDB4 ; =ov65_0221FD70
	add r0, r6, #0
	ldr r1, [r1, r2]
	bl Set2dSpriteAnimSeqNo
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_0221DD78:
	add r0, r6, #0
	bl sub_020247D4
	cmp r5, #6
	bge _0221DD96
	mov r1, #0xc
	add r2, r4, #0
	mul r2, r1
	ldr r1, _0221DDB8 ; =ov65_0221FD68
	add r0, r6, #0
	ldr r1, [r1, r2]
	bl Set2dSpriteAnimSeqNo
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_0221DD96:
	mov r1, #0xc
	add r2, r4, #0
	mul r2, r1
	ldr r1, _0221DDBC ; =ov65_0221FD6C
	add r0, r6, #0
	ldr r1, [r1, r2]
	bl Set2dSpriteAnimSeqNo
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_0221DDAC: .word ov65_0221FF4C
_0221DDB0: .word ov65_0221FF50
_0221DDB4: .word ov65_0221FD70
_0221DDB8: .word ov65_0221FD68
_0221DDBC: .word ov65_0221FD6C
	thumb_func_end ov65_0221DD34

	thumb_func_start ov65_0221DDC0
ov65_0221DDC0: ; 0x0221DDC0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	str r2, [sp]
	ldr r0, [r5]
	add r4, r1, #0
	ldr r2, [sp, #0x18]
	sub r1, r0, #1
	mov r7, #0
	cmp r2, #0
	bne _0221DE00
	cmp r0, #0
	beq _0221DDFA
	ldr r0, [r4]
	add r2, r3, #0
	bl ov65_0221DCFC
	ldr r1, [sp]
	ldr r2, [sp, #0x18]
	add r6, r0, #0
	bl ov65_0221DD34
	ldr r0, [r4]
	cmp r0, r6
	beq _0221DDFA
	ldr r0, _0221DE0C ; =0x000005DC
	bl PlaySE
	str r6, [r4]
	mov r7, #1
_0221DDFA:
	mov r0, #0
	str r0, [r5]
	b _0221DE08
_0221DE00:
	ldr r0, [r4]
	ldr r1, [sp]
	bl ov65_0221DD34
_0221DE08:
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221DE0C: .word 0x000005DC
	thumb_func_end ov65_0221DDC0

	thumb_func_start ov65_0221DE10
ov65_0221DE10: ; 0x0221DE10
	push {r3, lr}
	add r0, sp, #0
	strb r2, [r0]
	add r0, r1, #0
	add r1, sp, #0
	mov r2, #1
	bl sub_02037030
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov65_0221DE10

	thumb_func_start ov65_0221DE24
ov65_0221DE24: ; 0x0221DE24
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0221DE54 ; =0x000036AC
	add r4, r1, #0
	ldr r1, [r5, r0]
	add r6, r2, #0
	cmp r6, r1
	bne _0221DE3C
	add r0, r0, #4
	ldr r0, [r5, r0]
	cmp r4, r0
	beq _0221DE50
_0221DE3C:
	bl sub_0203769C
	add r1, r4, #0
	add r2, r6, #0
	bl ov65_0221DE10
	ldr r0, _0221DE54 ; =0x000036AC
	str r6, [r5, r0]
	add r0, r0, #4
	str r4, [r5, r0]
_0221DE50:
	pop {r4, r5, r6, pc}
	nop
_0221DE54: .word 0x000036AC
	thumb_func_end ov65_0221DE24

	thumb_func_start ov65_0221DE58
ov65_0221DE58: ; 0x0221DE58
	mov r2, #0x59
	lsl r2, r2, #4
	mul r2, r1
	add r0, r0, r2
	bx lr
	.balign 4, 0
	thumb_func_end ov65_0221DE58

	thumb_func_start ov65_0221DE64
ov65_0221DE64: ; 0x0221DE64
	push {r3, r4, r5, lr}
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	add r5, r1, #0
	add r4, r2, #0
	bl sub_020373B4
	cmp r0, #0
	beq _0221DE8A
	add r0, r5, #0
	add r1, r4, #0
	bl ov65_0221DE58
	mov r2, #0x59
	add r1, r0, #0
	mov r0, #0x16
	lsl r2, r2, #4
	bl sub_02036FD8
_0221DE8A:
	pop {r3, r4, r5, pc}
	thumb_func_end ov65_0221DE64

	thumb_func_start ov65_0221DE8C
ov65_0221DE8C: ; 0x0221DE8C
	push {r3, lr}
	bl Save_SpecialRibbons_get
	add r1, r0, #0
	mov r0, #0x20
	mov r2, #0xe
	bl sub_02037030
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov65_0221DE8C

	thumb_func_start ov65_0221DEA0
ov65_0221DEA0: ; 0x0221DEA0
	push {r4, r5, r6, lr}
	add r4, r2, #0
	add r6, r0, #0
	add r5, r1, #0
	bl PlayerProfile_GetNamePtr
	add r1, r0, #0
	add r0, r4, #0
	bl CopyU16StringArray
	add r0, r6, #0
	bl PlayerProfile_GetTrainerID
	str r0, [r4, #0x10]
	add r0, r6, #0
	bl PlayerProfile_GetLanguage
	strb r0, [r4, #0x14]
	add r0, r6, #0
	bl PlayerProfile_GetVersion
	strb r0, [r4, #0x15]
	add r0, r6, #0
	bl PlayerProfile_GetTrainerGender
	strb r0, [r4, #0x16]
	mov r0, #0
	add r1, r4, #0
_0221DED8:
	ldr r2, [r5, #0x10]
	str r2, [r1, #0x18]
	ldrb r3, [r5, #0x15]
	add r2, r4, r0
	add r2, #0x58
	strb r3, [r2]
	add r2, r4, r0
	ldrb r3, [r5, #0x14]
	add r2, #0x68
	add r1, r1, #4
	strb r3, [r2]
	add r2, r4, r0
	ldrb r3, [r5, #0x16]
	add r2, #0x78
	add r0, r0, #1
	add r5, #0x88
	strb r3, [r2]
	cmp r0, #0x10
	blt _0221DED8
	mov r0, #0x1c
	add r1, r4, #0
	mov r2, #0x88
	bl sub_02036FD8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov65_0221DEA0

	thumb_func_start ov65_0221DF0C
ov65_0221DF0C: ; 0x0221DF0C
	ldr r3, _0221DF18 ; =sub_02036FD8
	mov r2, #0xfa
	add r1, r0, #0
	mov r0, #0x1d
	lsl r2, r2, #2
	bx r3
	.balign 4, 0
_0221DF18: .word sub_02036FD8
	thumb_func_end ov65_0221DF0C

	thumb_func_start ov65_0221DF1C
ov65_0221DF1C: ; 0x0221DF1C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0221DFA0 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #2
	tst r0, r1
	beq _0221DF52
	ldr r0, _0221DFA4 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	mov r1, #0xc
	add r0, #0x94
	str r1, [r0]
	add r0, r4, #0
	bl ov65_0221CB5C
	add r0, r4, #0
	mov r1, #0xd1
	add r0, #0x94
	lsl r1, r1, #2
	ldr r0, [r0]
	ldr r1, [r4, r1]
	mov r2, #0
	bl ov65_0221DD34
	b _0221DF9A
_0221DF52:
	mov r0, #0x56
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov65_0221DBF4
	ldr r0, _0221DFA0 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _0221DF9A
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0221DF9A
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	cmp r0, #0xc
	bne _0221DF82
	ldr r1, _0221DFA8 ; =ov65_0221E144
	ldr r0, _0221DFAC ; =0x00002220
	str r1, [r4, r0]
	b _0221DF9A
_0221DF82:
	cmp r0, #6
	bge _0221DF8E
	ldr r1, _0221DFB0 ; =ov65_0221E9A8
	ldr r0, _0221DFAC ; =0x00002220
	str r1, [r4, r0]
	b _0221DF9A
_0221DF8E:
	blt _0221DF9A
	cmp r0, #0xc
	bge _0221DF9A
	ldr r1, _0221DFB4 ; =ov65_0221F3F4
	ldr r0, _0221DFAC ; =0x00002220
	str r1, [r4, r0]
_0221DF9A:
	mov r0, #0
	pop {r4, pc}
	nop
_0221DFA0: .word gSystem
_0221DFA4: .word 0x000005DC
_0221DFA8: .word ov65_0221E144
_0221DFAC: .word 0x00002220
_0221DFB0: .word ov65_0221E9A8
_0221DFB4: .word ov65_0221F3F4
	thumb_func_end ov65_0221DF1C

	thumb_func_start ov65_0221DFB8
ov65_0221DFB8: ; 0x0221DFB8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0221E034 ; =ov65_0221FE6C
	bl sub_02025224
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0221E030
	cmp r0, #0xc
	bne _0221DFE4
	ldr r0, _0221E038 ; =0x000005DC
	bl PlaySE
	ldr r1, _0221E03C ; =ov65_0221E144
	ldr r0, _0221E040 ; =0x00002220
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #0xc
	add r0, #0x94
	str r1, [r0]
	b _0221E014
_0221DFE4:
	lsl r1, r0, #4
	add r2, r4, r1
	ldr r1, _0221E044 ; =0x0000069C
	ldrh r1, [r2, r1]
	cmp r1, #0
	beq _0221E014
	add r1, r4, #0
	add r1, #0x94
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	cmp r0, #6
	bge _0221E008
	ldr r1, _0221E048 ; =ov65_0221E9A8
	ldr r0, _0221E040 ; =0x00002220
	str r1, [r4, r0]
	b _0221E014
_0221E008:
	blt _0221E014
	cmp r0, #0xc
	bge _0221E014
	ldr r1, _0221E04C ; =ov65_0221F3F4
	ldr r0, _0221E040 ; =0x00002220
	str r1, [r4, r0]
_0221E014:
	add r0, r4, #0
	mov r1, #0xd1
	add r0, #0x94
	lsl r1, r1, #2
	ldr r0, [r0]
	ldr r1, [r4, r1]
	mov r2, #0
	bl ov65_0221DD34
	add r0, r4, #0
	bl ov65_0221CB5C
	mov r0, #1
	pop {r4, pc}
_0221E030:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0221E034: .word ov65_0221FE6C
_0221E038: .word 0x000005DC
_0221E03C: .word ov65_0221E144
_0221E040: .word 0x00002220
_0221E044: .word 0x0000069C
_0221E048: .word ov65_0221E9A8
_0221E04C: .word ov65_0221F3F4
	thumb_func_end ov65_0221DFB8

	thumb_func_start ov65_0221E050
ov65_0221E050: ; 0x0221E050
	push {r4, lr}
	add r4, r0, #0
	bl ov65_0221DFB8
	cmp r0, #0
	bne _0221E062
	add r0, r4, #0
	bl ov65_0221DF1C
_0221E062:
	add r0, r4, #0
	bl ov65_0221DC34
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov65_0221E050

	thumb_func_start ov65_0221E06C
ov65_0221E06C: ; 0x0221E06C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bne _0221E09C
	ldr r0, _0221E130 ; =0x00002224
	ldr r0, [r5, r0]
	str r0, [r5, #0xc]
	ldr r0, [r5, #8]
	ldr r0, [r0, #8]
	bl GetPartyCount
	strb r0, [r5, #0x1f]
	mov r0, #0
	str r0, [r5, #0x34]
	bl sub_0203769C
	bl sub_02034818
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0xc
	bl sub_0208AD34
	b _0221E0D6
_0221E09C:
	ldr r0, _0221E134 ; =0x00002228
	ldr r1, [r5, r0]
	str r1, [r5, #0xc]
	ldr r0, [r5, r0]
	bl GetPartyCount
	strb r0, [r5, #0x1f]
	bl sub_0203769C
	mov r2, #1
	ldr r1, _0221E138 ; =0x00002E20
	eor r2, r0
	mov r0, #0xfb
	lsl r0, r0, #2
	add r1, r5, r1
	mul r0, r2
	add r0, r1, r0
	str r0, [r5, #0x34]
	bl sub_0203769C
	mov r1, #1
	eor r0, r1
	bl sub_02034818
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0xc
	bl sub_0208AD34
_0221E0D6:
	mov r0, #1
	strb r0, [r5, #0x1d]
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	mov r1, #6
	bl _s32_div_f
	add r0, r5, #0
	add r0, #0x20
	strb r1, [r0]
	mov r0, #1
	strb r0, [r5, #0x1e]
	mov r0, #0
	strh r0, [r5, #0x24]
	ldr r0, [r5, #8]
	ldr r0, [r0, #0x10]
	bl sub_02088288
	str r0, [r5, #0x38]
	ldr r0, [r5, #8]
	ldr r0, [r0, #0x2c]
	str r0, [r5, #0x28]
	ldr r0, [r5, #8]
	ldr r0, [r0, #0x18]
	str r0, [r5, #0x10]
	ldr r0, [r5, #8]
	ldr r0, [r0, #0x10]
	bl Save_SpecialRibbons_get
	str r0, [r5, #0x2c]
	add r0, r5, #0
	ldr r1, _0221E13C ; =_0221FD34
	add r0, #0xc
	bl sub_02089D40
	add r1, r5, #0
	ldr r0, _0221E140 ; =_02103A1C
	add r1, #0xc
	mov r2, #0x1a
	bl OverlayManager_new
	str r0, [r5, #0x4c]
	str r4, [r5, #0x48]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0221E130: .word 0x00002224
_0221E134: .word 0x00002228
_0221E138: .word 0x00002E20
_0221E13C: .word _0221FD34
_0221E140: .word _02103A1C
	thumb_func_end ov65_0221E06C

	thumb_func_start ov65_0221E144
ov65_0221E144: ; 0x0221E144
	push {r4, lr}
	sub sp, #0x10
	mov r1, #0
	add r4, r0, #0
	str r1, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x18
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r2, r1, #0
	add r3, r1, #0
	bl FillBgTilemapRect
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x19
	str r0, [sp]
	ldr r0, _0221E188 ; =0x000005B4
	lsl r3, r1, #4
	ldr r3, [r4, r3]
	add r0, r4, r0
	mov r2, #1
	bl ov65_0221FB90
	ldr r1, _0221E18C ; =ov65_0221E194
	ldr r0, _0221E190 ; =0x00002220
	str r1, [r4, r0]
	mov r0, #0
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_0221E188: .word 0x000005B4
_0221E18C: .word ov65_0221E194
_0221E190: .word 0x00002220
	thumb_func_end ov65_0221E144

	thumb_func_start ov65_0221E194
ov65_0221E194: ; 0x0221E194
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #6
	ldr r2, _0221E258 ; =0x00000664
	lsl r0, r0, #6
	mov r3, #0xdb
	add r1, r4, r2
	add r2, #0xc
	lsl r3, r3, #6
	ldr r0, [r4, r0]
	add r2, r4, r2
	add r3, r4, r3
	bl ov65_0221FC54
	cmp r0, #4
	bhi _0221E250
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0221E1C6: ; jump table
	.short _0221E250 - _0221E1C6 - 2 ; case 0
	.short _0221E1D0 - _0221E1C6 - 2 ; case 1
	.short _0221E218 - _0221E1C6 - 2 ; case 2
	.short _0221E1D0 - _0221E1C6 - 2 ; case 3
	.short _0221E218 - _0221E1C6 - 2 ; case 4
_0221E1D0:
	mov r1, #0
	str r1, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x18
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r2, r1, #0
	add r3, r1, #0
	bl FillBgTilemapRect
	mov r3, #0x61
	lsl r3, r3, #2
	ldr r0, [r4, r3]
	add r3, #0xc
	str r0, [sp]
	ldr r0, _0221E25C ; =0x000005B4
	ldr r3, [r4, r3]
	add r0, r4, r0
	mov r1, #0x1c
	mov r2, #1
	bl ov65_0221FB90
	add r0, r4, #0
	mov r1, #0x18
	mov r2, #1
	bl ov65_0221DE24
	ldr r1, _0221E260 ; =ov65_0221E8EC
	ldr r0, _0221E264 ; =0x00002220
	str r1, [r4, r0]
	mov r0, #0
	str r0, [r4, #0x68]
	b _0221E250
_0221E218:
	mov r1, #0
	str r1, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x18
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r2, r1, #0
	add r3, r1, #0
	bl FillBgTilemapRect
	mov r3, #0x61
	lsl r3, r3, #2
	ldr r0, [r4, r3]
	add r3, #0xc
	str r0, [sp]
	ldr r0, _0221E268 ; =0x00000594
	ldr r3, [r4, r3]
	add r0, r4, r0
	mov r1, #0xf
	mov r2, #1
	bl ov65_0221FB90
	ldr r1, _0221E26C ; =ov65_0221E050
	ldr r0, _0221E264 ; =0x00002220
	str r1, [r4, r0]
_0221E250:
	mov r0, #0
	add sp, #0x10
	pop {r4, pc}
	nop
_0221E258: .word 0x00000664
_0221E25C: .word 0x000005B4
_0221E260: .word ov65_0221E8EC
_0221E264: .word 0x00002220
_0221E268: .word 0x00000594
_0221E26C: .word ov65_0221E050
	thumb_func_end ov65_0221E194

	thumb_func_start ov65_0221E270
ov65_0221E270: ; 0x0221E270
	push {r4, lr}
	sub sp, #0x10
	mov r1, #0
	add r4, r0, #0
	str r1, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x18
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r2, r1, #0
	add r3, r1, #0
	bl FillBgTilemapRect
	mov r3, #0x61
	lsl r3, r3, #2
	ldr r0, [r4, r3]
	add r3, #0xc
	str r0, [sp]
	ldr r0, _0221E2B4 ; =0x000005B4
	ldr r1, [r4, #0x74]
	ldr r3, [r4, r3]
	add r0, r4, r0
	mov r2, #1
	bl ov65_0221FB90
	ldr r1, _0221E2B8 ; =ov65_0221E2C0
	ldr r0, _0221E2BC ; =0x00002220
	str r1, [r4, r0]
	mov r0, #0
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_0221E2B4: .word 0x000005B4
_0221E2B8: .word ov65_0221E2C0
_0221E2BC: .word 0x00002220
	thumb_func_end ov65_0221E270

	thumb_func_start ov65_0221E2C0
ov65_0221E2C0: ; 0x0221E2C0
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r0, _0221E31C ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	bne _0221E2D8
	ldr r0, _0221E320 ; =gSystem + 0x40
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _0221E316
_0221E2D8:
	mov r1, #0
	str r1, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x18
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r2, r1, #0
	add r3, r1, #0
	bl FillBgTilemapRect
	mov r3, #0x61
	lsl r3, r3, #2
	ldr r0, [r4, r3]
	add r3, #0xc
	str r0, [sp]
	ldr r0, _0221E324 ; =0x00000594
	ldr r3, [r4, r3]
	add r0, r4, r0
	mov r1, #0xf
	mov r2, #1
	bl ov65_0221FB90
	ldr r1, _0221E328 ; =ov65_0221E050
	ldr r0, _0221E32C ; =0x00002220
	str r1, [r4, r0]
	add r0, r4, #0
	bl ov65_0221EF0C
_0221E316:
	mov r0, #0
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_0221E31C: .word gSystem
_0221E320: .word gSystem + 0x40
_0221E324: .word 0x00000594
_0221E328: .word ov65_0221E050
_0221E32C: .word 0x00002220
	thumb_func_end ov65_0221E2C0

	thumb_func_start ov65_0221E330
ov65_0221E330: ; 0x0221E330
	push {r3, r4, lr}
	sub sp, #4
	mov r4, #0xda
	add r3, r0, #0
	lsl r4, r4, #6
	ldr r0, [r3, r4]
	add r4, r4, #4
	str r0, [sp]
	ldr r0, _0221E350 ; =0x000005B4
	mov r2, #1
	add r0, r3, r0
	ldr r3, [r3, r4]
	bl ov65_0221FB90
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0221E350: .word 0x000005B4
	thumb_func_end ov65_0221E330

	thumb_func_start ov65_0221E354
ov65_0221E354: ; 0x0221E354
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #6
	ldr r2, _0221E3AC ; =0x00000664
	lsl r0, r0, #6
	mov r3, #0xdb
	add r1, r4, r2
	add r2, #0xc
	lsl r3, r3, #6
	ldr r0, [r4, r0]
	add r2, r4, r2
	add r3, r4, r3
	bl ov65_0221FC54
	cmp r0, #4
	bhi _0221E3A6
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0221E386: ; jump table
	.short _0221E3A6 - _0221E386 - 2 ; case 0
	.short _0221E390 - _0221E386 - 2 ; case 1
	.short _0221E398 - _0221E386 - 2 ; case 2
	.short _0221E390 - _0221E386 - 2 ; case 3
	.short _0221E398 - _0221E386 - 2 ; case 4
_0221E390:
	ldr r1, _0221E3B0 ; =ov65_0221E740
	ldr r0, _0221E3B4 ; =0x00002220
	str r1, [r4, r0]
	b _0221E3A6
_0221E398:
	add r0, r4, #0
	mov r1, #0x3f
	bl ov65_0221E330
	ldr r1, _0221E3B8 ; =ov65_0221E600
	ldr r0, _0221E3B4 ; =0x00002220
	str r1, [r4, r0]
_0221E3A6:
	mov r0, #0
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0221E3AC: .word 0x00000664
_0221E3B0: .word ov65_0221E740
_0221E3B4: .word 0x00002220
_0221E3B8: .word ov65_0221E600
	thumb_func_end ov65_0221E354

	thumb_func_start ov65_0221E3BC
ov65_0221E3BC: ; 0x0221E3BC
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #6
	ldr r2, _0221E458 ; =0x00000664
	lsl r0, r0, #6
	mov r3, #0xdb
	add r1, r4, r2
	add r2, #0xc
	lsl r3, r3, #6
	ldr r0, [r4, r0]
	add r2, r4, r2
	add r3, r4, r3
	bl ov65_0221FC54
	cmp r0, #4
	bhi _0221E450
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0221E3EE: ; jump table
	.short _0221E450 - _0221E3EE - 2 ; case 0
	.short _0221E3F8 - _0221E3EE - 2 ; case 1
	.short _0221E42C - _0221E3EE - 2 ; case 2
	.short _0221E3F8 - _0221E3EE - 2 ; case 3
	.short _0221E42C - _0221E3EE - 2 ; case 4
_0221E3F8:
	ldr r0, [r4, #4]
	bl sub_0203107C
	ldr r1, _0221E45C ; =0x0000367C
	ldr r1, [r4, r1]
	bl sub_020311AC
	ldr r1, _0221E460 ; =0x000036A0
	ldr r0, [r4, r1]
	sub r1, #0x24
	ldr r1, [r4, r1]
	bl sub_0202C338
	mov r0, #0
	str r0, [sp]
	ldr r1, _0221E464 ; =0x00003678
	ldr r0, [r4, #4]
	ldr r1, [r4, r1]
	mov r2, #0x1f
	mov r3, #0x1a
	bl sub_0203A280
	ldr r1, _0221E468 ; =ov65_0221E740
	ldr r0, _0221E46C ; =0x00002220
	str r1, [r4, r0]
	b _0221E450
_0221E42C:
	ldr r0, _0221E464 ; =0x00003678
	ldr r0, [r4, r0]
	bl sub_02034818
	add r2, r0, #0
	mov r0, #0xda
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0
	bl BufferPlayersName
	add r0, r4, #0
	mov r1, #0x40
	bl ov65_0221E330
	ldr r1, _0221E470 ; =ov65_0221E354
	ldr r0, _0221E46C ; =0x00002220
	str r1, [r4, r0]
_0221E450:
	mov r0, #0
	add sp, #4
	pop {r3, r4, pc}
	nop
_0221E458: .word 0x00000664
_0221E45C: .word 0x0000367C
_0221E460: .word 0x000036A0
_0221E464: .word 0x00003678
_0221E468: .word ov65_0221E740
_0221E46C: .word 0x00002220
_0221E470: .word ov65_0221E354
	thumb_func_end ov65_0221E3BC

	thumb_func_start ov65_0221E474
ov65_0221E474: ; 0x0221E474
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0221E530 ; =0x0000368C
	ldr r0, [r5, r0]
	bl ListMenu_ProcessInput
	add r4, r0, #0
	mov r0, #1
	mvn r0, r0
	cmp r4, r0
	beq _0221E494
	add r0, r0, #1
	cmp r4, r0
	bne _0221E4C0
	mov r0, #0
	pop {r4, r5, r6, pc}
_0221E494:
	ldr r0, _0221E534 ; =0x000005DC
	bl PlaySE
	ldr r0, _0221E538 ; =0x00003678
	ldr r0, [r5, r0]
	bl sub_02034818
	add r2, r0, #0
	mov r0, #0xda
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0
	bl BufferPlayersName
	add r0, r5, #0
	mov r1, #0x40
	bl ov65_0221E330
	ldr r1, _0221E53C ; =ov65_0221E354
	ldr r0, _0221E540 ; =0x00002220
	str r1, [r5, r0]
	b _0221E506
_0221E4C0:
	ldr r0, _0221E534 ; =0x000005DC
	bl PlaySE
	ldr r0, _0221E544 ; =0x0000367C
	str r4, [r5, r0]
	mov r0, #0x1a
	bl PlayerProfile_new
	add r6, r0, #0
	ldr r0, _0221E548 ; =0x000036A0
	add r1, r4, #0
	ldr r0, [r5, r0]
	bl sub_0202C254
	add r1, r0, #0
	add r0, r6, #0
	bl Sav2_Profile_PlayerName_set
	mov r0, #0xda
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0
	add r2, r6, #0
	bl BufferPlayersName
	add r0, r6, #0
	bl FreeToHeap
	add r0, r5, #0
	mov r1, #0x41
	bl ov65_0221E330
	ldr r1, _0221E54C ; =ov65_0221E3BC
	ldr r0, _0221E540 ; =0x00002220
	str r1, [r5, r0]
_0221E506:
	ldr r0, _0221E550 ; =0x00003690
	mov r1, #0
	add r0, r5, r0
	bl sub_0200E5D4
	ldr r0, _0221E550 ; =0x00003690
	add r0, r5, r0
	bl RemoveWindow
	ldr r0, _0221E530 ; =0x0000368C
	mov r1, #0
	ldr r0, [r5, r0]
	add r2, r1, #0
	bl DestroyListMenu
	ldr r0, _0221E554 ; =0x00003688
	ldr r0, [r5, r0]
	bl ListMenuItems_dtor
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0221E530: .word 0x0000368C
_0221E534: .word 0x000005DC
_0221E538: .word 0x00003678
_0221E53C: .word ov65_0221E354
_0221E540: .word 0x00002220
_0221E544: .word 0x0000367C
_0221E548: .word 0x000036A0
_0221E54C: .word ov65_0221E3BC
_0221E550: .word 0x00003690
_0221E554: .word 0x00003688
	thumb_func_end ov65_0221E474

	thumb_func_start ov65_0221E558
ov65_0221E558: ; 0x0221E558
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0221E5EC ; =0x000036A0
	ldr r0, [r5, r0]
	bl sub_0202C2F8
	str r0, [sp]
	add r0, r0, #1
	mov r1, #0x1a
	bl ListMenuItems_ctor
	ldr r1, _0221E5F0 ; =0x00003688
	str r0, [r5, r1]
	mov r0, #0x64
	mov r1, #0x1a
	bl String_ctor
	ldr r7, _0221E5EC ; =0x000036A0
	add r6, r0, #0
	mov r4, #0
_0221E580:
	ldr r0, [r5, r7]
	add r1, r4, #0
	bl sub_0202C2DC
	cmp r0, #0
	beq _0221E5AA
	ldr r0, _0221E5EC ; =0x000036A0
	add r1, r4, #0
	ldr r0, [r5, r0]
	bl sub_0202C254
	add r1, r0, #0
	add r0, r6, #0
	bl CopyU16ArrayToString
	ldr r0, _0221E5F0 ; =0x00003688
	add r1, r6, #0
	ldr r0, [r5, r0]
	add r2, r4, #0
	bl ListMenuItems_AddItem
_0221E5AA:
	add r4, r4, #1
	cmp r4, #0x20
	blt _0221E580
	ldr r1, _0221E5F0 ; =0x00003688
	mov r2, #0xb
	ldr r0, [r5, r1]
	sub r1, r1, #4
	add r3, r2, #0
	ldr r1, [r5, r1]
	sub r3, #0xd
	bl ListMenuItems_AppendFromMsgData
	add r0, r6, #0
	bl String_dtor
	ldr r2, _0221E5F0 ; =0x00003688
	mov r3, #6
	lsl r3, r3, #6
	ldr r0, [r5, r2]
	add r2, #8
	ldr r1, [sp]
	ldr r3, [r5, r3]
	add r2, r5, r2
	bl ov65_0221FCA0
	ldr r1, _0221E5F4 ; =0x0000368C
	str r0, [r5, r1]
	ldr r1, _0221E5F8 ; =ov65_0221E474
	ldr r0, _0221E5FC ; =0x00002220
	str r1, [r5, r0]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221E5EC: .word 0x000036A0
_0221E5F0: .word 0x00003688
_0221E5F4: .word 0x0000368C
_0221E5F8: .word ov65_0221E474
_0221E5FC: .word 0x00002220
	thumb_func_end ov65_0221E558

	thumb_func_start ov65_0221E600
ov65_0221E600: ; 0x0221E600
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #6
	ldr r2, _0221E670 ; =0x00000664
	lsl r0, r0, #6
	mov r3, #0xdb
	add r1, r4, r2
	add r2, #0xc
	lsl r3, r3, #6
	ldr r0, [r4, r0]
	add r2, r4, r2
	add r3, r4, r3
	bl ov65_0221FC54
	cmp r0, #4
	bhi _0221E668
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0221E632: ; jump table
	.short _0221E668 - _0221E632 - 2 ; case 0
	.short _0221E63C - _0221E632 - 2 ; case 1
	.short _0221E644 - _0221E632 - 2 ; case 2
	.short _0221E63C - _0221E632 - 2 ; case 3
	.short _0221E644 - _0221E632 - 2 ; case 4
_0221E63C:
	ldr r1, _0221E674 ; =ov65_0221E558
	ldr r0, _0221E678 ; =0x00002220
	str r1, [r4, r0]
	b _0221E668
_0221E644:
	ldr r0, _0221E67C ; =0x00003678
	ldr r0, [r4, r0]
	bl sub_02034818
	add r2, r0, #0
	mov r0, #0xda
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0
	bl BufferPlayersName
	add r0, r4, #0
	mov r1, #0x40
	bl ov65_0221E330
	ldr r1, _0221E680 ; =ov65_0221E354
	ldr r0, _0221E678 ; =0x00002220
	str r1, [r4, r0]
_0221E668:
	mov r0, #0
	add sp, #4
	pop {r3, r4, pc}
	nop
_0221E670: .word 0x00000664
_0221E674: .word ov65_0221E558
_0221E678: .word 0x00002220
_0221E67C: .word 0x00003678
_0221E680: .word ov65_0221E354
	thumb_func_end ov65_0221E600

	thumb_func_start ov65_0221E684
ov65_0221E684: ; 0x0221E684
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #6
	ldr r2, _0221E714 ; =0x00000664
	lsl r0, r0, #6
	mov r3, #0xdb
	add r1, r4, r2
	add r2, #0xc
	lsl r3, r3, #6
	ldr r0, [r4, r0]
	add r2, r4, r2
	add r3, r4, r3
	bl ov65_0221FC54
	cmp r0, #4
	bhi _0221E70E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0221E6B6: ; jump table
	.short _0221E70E - _0221E6B6 - 2 ; case 0
	.short _0221E6C0 - _0221E6B6 - 2 ; case 1
	.short _0221E708 - _0221E6B6 - 2 ; case 2
	.short _0221E6C0 - _0221E6B6 - 2 ; case 3
	.short _0221E708 - _0221E6B6 - 2 ; case 4
_0221E6C0:
	ldr r1, _0221E718 ; =ov65_0221E740
	ldr r0, _0221E71C ; =0x00002220
	ldr r6, _0221E720 ; =0x000036A0
	str r1, [r4, r0]
	mov r5, #0
_0221E6CA:
	ldr r0, [r4, r6]
	add r1, r5, #0
	bl sub_0202C2DC
	cmp r0, #0
	bne _0221E6EA
	mov r0, #0
	str r0, [sp]
	ldr r1, _0221E724 ; =0x00003678
	ldr r0, [r4, #4]
	ldr r1, [r4, r1]
	add r2, r5, #0
	mov r3, #0x1a
	bl sub_0203A280
	b _0221E6F0
_0221E6EA:
	add r5, r5, #1
	cmp r5, #0x20
	blt _0221E6CA
_0221E6F0:
	cmp r5, #0x20
	bne _0221E70E
	add r0, r4, #0
	mov r1, #0x3f
	bl ov65_0221E330
	ldr r1, _0221E728 ; =ov65_0221E600
	ldr r0, _0221E71C ; =0x00002220
	add sp, #4
	str r1, [r4, r0]
	mov r0, #0
	pop {r3, r4, r5, r6, pc}
_0221E708:
	ldr r1, _0221E718 ; =ov65_0221E740
	ldr r0, _0221E71C ; =0x00002220
	str r1, [r4, r0]
_0221E70E:
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0221E714: .word 0x00000664
_0221E718: .word ov65_0221E740
_0221E71C: .word 0x00002220
_0221E720: .word 0x000036A0
_0221E724: .word 0x00003678
_0221E728: .word ov65_0221E600
	thumb_func_end ov65_0221E684

	thumb_func_start ov65_0221E72C
ov65_0221E72C: ; 0x0221E72C
	push {r3, lr}
	mov r0, #0x13
	bl sub_02037B38
	cmp r0, #0
	beq _0221E73C
	mov r0, #2
	pop {r3, pc}
_0221E73C:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov65_0221E72C

	thumb_func_start ov65_0221E740
ov65_0221E740: ; 0x0221E740
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r1, #0
	ldr r0, _0221E838 ; =0x00003678
	mvn r1, r1
	str r1, [r5, r0]
	mov r6, #0
	bl sub_02037454
	cmp r0, #0
	ble _0221E77C
	ldr r7, _0221E83C ; =0x000035F8
	add r4, r5, #0
_0221E75A:
	ldr r0, [r4, r7]
	cmp r0, #2
	bne _0221E770
	ldr r0, _0221E838 ; =0x00003678
	lsl r1, r6, #2
	str r6, [r5, r0]
	mov r2, #0
	add r1, r5, r1
	sub r0, #0x80
	str r2, [r1, r0]
	b _0221E77C
_0221E770:
	add r4, r4, #4
	add r6, r6, #1
	bl sub_02037454
	cmp r6, r0
	blt _0221E75A
_0221E77C:
	ldr r0, _0221E838 ; =0x00003678
	mov r1, #0
	ldr r2, [r5, r0]
	mvn r1, r1
	cmp r2, r1
	bne _0221E7C2
	add r0, #0xc
	ldr r0, [r5, r0]
	bl DestroyMsgData
	mov r0, #0xda
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl ScrStrBufs_delete
	mov r0, #0x13
	bl sub_02037AC0
	mov r3, #0x61
	lsl r3, r3, #2
	ldr r0, [r5, r3]
	add r3, #0xc
	str r0, [sp]
	ldr r0, _0221E840 ; =0x000005B4
	ldr r3, [r5, r3]
	add r0, r5, r0
	mov r1, #0x1c
	mov r2, #1
	bl ov65_0221FB90
	ldr r1, _0221E844 ; =ov65_0221E72C
	ldr r0, _0221E848 ; =0x00002220
	str r1, [r5, r0]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0221E7C2:
	ldr r0, [r5, #4]
	bl Sav2_Bag_get
	ldr r1, _0221E84C ; =0x000001B5
	mov r2, #1
	mov r3, #0x1a
	bl Bag_HasItem
	cmp r0, #1
	bne _0221E7FE
	ldr r0, _0221E838 ; =0x00003678
	ldr r0, [r5, r0]
	bl sub_02034818
	add r2, r0, #0
	mov r0, #0xda
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0
	bl BufferPlayersName
	add r0, r5, #0
	mov r1, #0x3e
	bl ov65_0221E330
	ldr r1, _0221E850 ; =ov65_0221E684
	ldr r0, _0221E848 ; =0x00002220
	str r1, [r5, r0]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0221E7FE:
	ldr r0, [r5, #4]
	bl sub_0202C6F4
	add r6, r0, #0
	mov r4, #0
_0221E808:
	add r0, r6, #0
	add r1, r4, #0
	bl sub_0202C2DC
	cmp r0, #0
	bne _0221E828
	mov r0, #0
	str r0, [sp]
	ldr r1, _0221E838 ; =0x00003678
	ldr r0, [r5, #4]
	ldr r1, [r5, r1]
	add r2, r4, #0
	mov r3, #0x1a
	bl sub_0203A280
	b _0221E82E
_0221E828:
	add r4, r4, #1
	cmp r4, #0x20
	blt _0221E808
_0221E82E:
	ldr r1, _0221E854 ; =ov65_0221E740
	ldr r0, _0221E848 ; =0x00002220
	str r1, [r5, r0]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221E838: .word 0x00003678
_0221E83C: .word 0x000035F8
_0221E840: .word 0x000005B4
_0221E844: .word ov65_0221E72C
_0221E848: .word 0x00002220
_0221E84C: .word 0x000001B5
_0221E850: .word ov65_0221E684
_0221E854: .word ov65_0221E740
	thumb_func_end ov65_0221E740

	thumb_func_start ov65_0221E858
ov65_0221E858: ; 0x0221E858
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r1, _0221E8CC ; =0x000035F8
	ldr r0, [r4, #4]
	add r1, r4, r1
	mov r2, #0x1a
	bl sub_0203A1C4
	cmp r0, #0
	bne _0221E898
	mov r0, #0x13
	bl sub_02037AC0
	mov r3, #0x61
	lsl r3, r3, #2
	ldr r0, [r4, r3]
	add r3, #0xc
	str r0, [sp]
	ldr r0, _0221E8D0 ; =0x000005B4
	ldr r3, [r4, r3]
	add r0, r4, r0
	mov r1, #0x1c
	mov r2, #1
	bl ov65_0221FB90
	ldr r1, _0221E8D4 ; =ov65_0221E72C
	ldr r0, _0221E8D8 ; =0x00002220
	add sp, #4
	str r1, [r4, r0]
	mov r0, #0
	pop {r3, r4, pc}
_0221E898:
	mov r0, #0x1a
	bl ScrStrBufs_new
	mov r1, #0xda
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r2, _0221E8DC ; =0x0000030B
	mov r0, #0
	mov r1, #0x1b
	mov r3, #0x1a
	bl NewMsgDataFromNarc
	ldr r1, _0221E8E0 ; =0x00003684
	str r0, [r4, r1]
	ldr r0, [r4, #4]
	bl sub_0202C6F4
	ldr r1, _0221E8E4 ; =0x000036A0
	str r0, [r4, r1]
	ldr r1, _0221E8E8 ; =ov65_0221E740
	ldr r0, _0221E8D8 ; =0x00002220
	str r1, [r4, r0]
	mov r0, #0
	add sp, #4
	pop {r3, r4, pc}
	nop
_0221E8CC: .word 0x000035F8
_0221E8D0: .word 0x000005B4
_0221E8D4: .word ov65_0221E72C
_0221E8D8: .word 0x00002220
_0221E8DC: .word 0x0000030B
_0221E8E0: .word 0x00003684
_0221E8E4: .word 0x000036A0
_0221E8E8: .word ov65_0221E740
	thumb_func_end ov65_0221E858

	thumb_func_start ov65_0221E8EC
ov65_0221E8EC: ; 0x0221E8EC
	ldr r2, [r0, #0x6c]
	cmp r2, #0
	beq _0221E918
	ldr r1, [r0, #0x70]
	cmp r1, #0
	beq _0221E918
	cmp r2, #1
	bne _0221E908
	cmp r1, #1
	bne _0221E908
	ldr r2, _0221E91C ; =ov65_0221E858
	ldr r1, _0221E920 ; =0x00002220
	str r2, [r0, r1]
	b _0221E90E
_0221E908:
	ldr r2, _0221E924 ; =ov65_0221E270
	ldr r1, _0221E920 ; =0x00002220
	str r2, [r0, r1]
_0221E90E:
	mov r1, #0
	str r1, [r0, #0x6c]
	str r1, [r0, #0x70]
	mov r1, #0x1d
	str r1, [r0, #0x74]
_0221E918:
	mov r0, #0
	bx lr
	.balign 4, 0
_0221E91C: .word ov65_0221E858
_0221E920: .word 0x00002220
_0221E924: .word ov65_0221E270
	thumb_func_end ov65_0221E8EC

	thumb_func_start ov65_0221E928
ov65_0221E928: ; 0x0221E928
	push {r3, r4, r5, r6, lr}
	sub sp, #0x24
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0x1a
	mov r1, #0
	add r6, r2, #0
	bl sub_02018424
	ldr r1, _0221E99C ; =0x000036C4
	mov r2, #0x18
	str r0, [r5, r1]
	add r0, sp, #0xc
	mov r1, #0
	bl MI_CpuFill8
	ldr r0, _0221E9A0 ; =ov65_0221FD3C
	add r2, sp, #0xc
	ldrh r3, [r0]
	add r1, sp, #0xc
	strh r3, [r2]
	ldrh r3, [r0, #2]
	strh r3, [r2, #2]
	ldrh r3, [r0, #4]
	strh r3, [r2, #4]
	ldrh r3, [r0, #6]
	strh r3, [r2, #6]
	ldrh r3, [r0, #8]
	ldrh r0, [r0, #0xa]
	strh r3, [r2, #8]
	strh r0, [r2, #0xa]
	ldr r0, _0221E9A4 ; =0x00000668
	mov r3, #0x11
	ldr r0, [r5, r0]
	str r0, [sp, #0x18]
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	str r0, [sp, #0x1c]
	lsl r0, r6, #0x18
	strb r4, [r2, #0x14]
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0xd
	str r0, [sp, #4]
	mov r2, #0
	ldr r0, _0221E99C ; =0x000036C4
	str r2, [sp, #8]
	ldr r0, [r5, r0]
	bl sub_020185FC
	add r4, r0, #0
	bl ov65_0221F890
	add r0, r4, #0
	add sp, #0x24
	pop {r3, r4, r5, r6, pc}
	nop
_0221E99C: .word 0x000036C4
_0221E9A0: .word ov65_0221FD3C
_0221E9A4: .word 0x00000668
	thumb_func_end ov65_0221E928

	thumb_func_start ov65_0221E9A8
ov65_0221E9A8: ; 0x0221E9A8
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r0, _0221EA5C ; =0x00002224
	add r1, r4, #0
	add r1, #0x94
	ldr r0, [r4, r0]
	ldr r1, [r1]
	bl GetPartyMonByIndex
	bl Mon_GetBoxMon
	add r2, r0, #0
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl BufferBoxMonNickname
	mov r1, #0
	str r1, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x18
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r2, r1, #0
	add r3, r1, #0
	bl FillBgTilemapRect
	mov r3, #0x62
	lsl r3, r3, #2
	ldr r0, [r4, r3]
	add r3, #8
	str r0, [sp]
	ldr r0, _0221EA60 ; =0x000005A4
	ldr r3, [r4, r3]
	add r0, r4, r0
	mov r1, #0x10
	mov r2, #1
	bl ov65_0221FB90
	mov r0, #3
	mov r1, #0x1a
	bl ListMenuItems_ctor
	ldr r1, _0221EA64 ; =0x00000668
	mov r2, #0x11
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #0x19
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	mov r3, #0
	bl ListMenuItems_AppendFromMsgData
	ldr r0, _0221EA64 ; =0x00000668
	mov r1, #0x19
	lsl r1, r1, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	mov r2, #0x12
	mov r3, #1
	bl ListMenuItems_AppendFromMsgData
	ldr r0, _0221EA64 ; =0x00000668
	mov r1, #0x19
	lsl r1, r1, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	mov r2, #0x13
	mov r3, #2
	bl ListMenuItems_AppendFromMsgData
	add r0, r4, #0
	mov r1, #3
	mov r2, #9
	bl ov65_0221E928
	ldr r1, _0221EA68 ; =0x000036C8
	str r0, [r4, r1]
	ldr r1, _0221EA6C ; =ov65_0221EA74
	ldr r0, _0221EA70 ; =0x00002220
	str r1, [r4, r0]
	mov r0, #0
	add sp, #0x10
	pop {r4, pc}
	nop
_0221EA5C: .word 0x00002224
_0221EA60: .word 0x000005A4
_0221EA64: .word 0x00000668
_0221EA68: .word 0x000036C8
_0221EA6C: .word ov65_0221EA74
_0221EA70: .word 0x00002220
	thumb_func_end ov65_0221E9A8

	thumb_func_start ov65_0221EA74
ov65_0221EA74: ; 0x0221EA74
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r0, _0221EB80 ; =0x000036C8
	ldr r0, [r4, r0]
	bl sub_020186A4
	cmp r0, #2
	bhi _0221EA94
	cmp r0, #0
	beq _0221EA9E
	cmp r0, #1
	beq _0221EAEA
	cmp r0, #2
	beq _0221EB32
	b _0221EB78
_0221EA94:
	mov r1, #1
	mvn r1, r1
	cmp r0, r1
	beq _0221EB32
	b _0221EB78
_0221EA9E:
	mov r1, #0
	str r1, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x18
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r2, r1, #0
	add r3, r1, #0
	bl FillBgTilemapRect
	mov r3, #0x61
	lsl r3, r3, #2
	ldr r0, [r4, r3]
	add r3, #0xc
	str r0, [sp]
	ldr r0, _0221EB84 ; =0x00000594
	ldr r3, [r4, r3]
	add r0, r4, r0
	mov r1, #0xf
	mov r2, #1
	bl ov65_0221FB90
	add r0, r4, #0
	bl ov65_0221F4B0
	ldr r0, _0221EB88 ; =0x00000668
	ldr r0, [r4, r0]
	bl ListMenuItems_dtor
	ldr r1, _0221EB8C ; =ov65_0221E050
	ldr r0, _0221EB90 ; =0x00002220
	add sp, #0x10
	str r1, [r4, r0]
	mov r0, #3
	pop {r4, pc}
_0221EAEA:
	mov r1, #0
	str r1, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x18
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r2, r1, #0
	add r3, r1, #0
	bl FillBgTilemapRect
	mov r3, #0x61
	lsl r3, r3, #2
	ldr r0, [r4, r3]
	add r3, #0xc
	str r0, [sp]
	ldr r0, _0221EB94 ; =0x000005B4
	ldr r3, [r4, r3]
	add r0, r4, r0
	mov r1, #0x14
	mov r2, #1
	bl ov65_0221FB90
	add r0, r4, #0
	bl ov65_0221F4B0
	ldr r0, _0221EB88 ; =0x00000668
	ldr r0, [r4, r0]
	bl ListMenuItems_dtor
	ldr r1, _0221EB98 ; =ov65_0221EB9C
	ldr r0, _0221EB90 ; =0x00002220
	str r1, [r4, r0]
	b _0221EB78
_0221EB32:
	mov r1, #0
	str r1, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x18
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r2, r1, #0
	add r3, r1, #0
	bl FillBgTilemapRect
	mov r3, #0x61
	lsl r3, r3, #2
	ldr r0, [r4, r3]
	add r3, #0xc
	str r0, [sp]
	ldr r0, _0221EB84 ; =0x00000594
	ldr r3, [r4, r3]
	add r0, r4, r0
	mov r1, #0xf
	mov r2, #1
	bl ov65_0221FB90
	add r0, r4, #0
	bl ov65_0221F4B0
	ldr r0, _0221EB88 ; =0x00000668
	ldr r0, [r4, r0]
	bl ListMenuItems_dtor
	ldr r1, _0221EB8C ; =ov65_0221E050
	ldr r0, _0221EB90 ; =0x00002220
	str r1, [r4, r0]
_0221EB78:
	mov r0, #0
	add sp, #0x10
	pop {r4, pc}
	nop
_0221EB80: .word 0x000036C8
_0221EB84: .word 0x00000594
_0221EB88: .word 0x00000668
_0221EB8C: .word ov65_0221E050
_0221EB90: .word 0x00002220
_0221EB94: .word 0x000005B4
_0221EB98: .word ov65_0221EB9C
	thumb_func_end ov65_0221EA74

	thumb_func_start ov65_0221EB9C
ov65_0221EB9C: ; 0x0221EB9C
	push {r4, lr}
	sub sp, #0x10
	mov r1, #0
	add r4, r0, #0
	str r1, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x18
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r2, r1, #0
	add r3, r1, #0
	bl FillBgTilemapRect
	mov r3, #0x61
	lsl r3, r3, #2
	ldr r0, [r4, r3]
	add r3, #0xc
	str r0, [sp]
	ldr r0, _0221EBEC ; =0x000005B4
	ldr r3, [r4, r3]
	add r0, r4, r0
	mov r1, #0x14
	mov r2, #1
	bl ov65_0221FB90
	add r0, r4, #0
	mov r1, #0x18
	mov r2, #2
	bl ov65_0221DE24
	ldr r1, _0221EBF0 ; =ov65_0221EBF8
	ldr r0, _0221EBF4 ; =0x00002220
	str r1, [r4, r0]
	mov r0, #0
	add sp, #0x10
	pop {r4, pc}
	nop
_0221EBEC: .word 0x000005B4
_0221EBF0: .word ov65_0221EBF8
_0221EBF4: .word 0x00002220
	thumb_func_end ov65_0221EB9C

	thumb_func_start ov65_0221EBF8
ov65_0221EBF8: ; 0x0221EBF8
	ldr r2, [r0, #0x6c]
	cmp r2, #0
	beq _0221EC24
	ldr r1, [r0, #0x70]
	cmp r1, #0
	beq _0221EC24
	cmp r2, #2
	bne _0221EC14
	cmp r1, #2
	bne _0221EC14
	ldr r2, _0221EC28 ; =ov65_0221EC34
	ldr r1, _0221EC2C ; =0x00002220
	str r2, [r0, r1]
	b _0221EC1A
_0221EC14:
	ldr r2, _0221EC30 ; =ov65_0221E270
	ldr r1, _0221EC2C ; =0x00002220
	str r2, [r0, r1]
_0221EC1A:
	mov r1, #0x18
	str r1, [r0, #0x74]
	mov r1, #0
	str r1, [r0, #0x6c]
	str r1, [r0, #0x70]
_0221EC24:
	mov r0, #0
	bx lr
	.balign 4, 0
_0221EC28: .word ov65_0221EC34
_0221EC2C: .word 0x00002220
_0221EC30: .word ov65_0221E270
	thumb_func_end ov65_0221EBF8

	thumb_func_start ov65_0221EC34
ov65_0221EC34: ; 0x0221EC34
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r0, #0
	ldr r0, _0221ED54 ; =0x00000444
	mov r6, #0
	add r0, r7, r0
	add r4, r7, #0
	add r5, r7, #0
	str r0, [sp, #4]
_0221EC46:
	add r0, r7, #0
	add r0, #0x94
	ldr r0, [r0]
	cmp r6, r0
	beq _0221EC84
	mov r0, #0xdf
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, _0221ED58 ; =0x0000069E
	ldrh r0, [r5, r0]
	cmp r0, #0
	beq _0221EC70
	mov r0, #0xeb
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
_0221EC70:
	ldr r0, _0221ED5C ; =0x000006A8
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0221EC84
	mov r0, #0xf7
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
_0221EC84:
	add r0, r6, #7
	lsl r1, r0, #4
	ldr r0, [sp, #4]
	add r0, r0, r1
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r7, #0
	add r0, #0x98
	ldr r0, [r0]
	sub r0, r0, #6
	cmp r6, r0
	beq _0221ECD0
	mov r0, #0xe5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, _0221ED60 ; =0x000006FE
	ldrh r0, [r5, r0]
	cmp r0, #0
	beq _0221ECBC
	mov r0, #0xf1
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
_0221ECBC:
	ldr r0, _0221ED64 ; =0x00000708
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0221ECD0
	mov r0, #0xfd
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
_0221ECD0:
	add r0, r6, #0
	add r0, #0xd
	lsl r1, r0, #4
	ldr r0, [sp, #4]
	add r0, r0, r1
	bl ClearWindowTilemapAndScheduleTransfer
	add r6, r6, #1
	add r4, r4, #4
	add r5, #0x10
	cmp r6, #6
	blt _0221EC46
	mov r0, #0xd1
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0xd2
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r7, #0
	add r0, #0x94
	ldr r0, [r0]
	ldr r1, _0221ED68 ; =ov65_0221FF4C
	lsl r2, r0, #3
	mov r0, #0x20
	str r0, [sp]
	ldr r0, _0221ED6C ; =0x000022D0
	ldr r1, [r1, r2]
	ldr r3, _0221ED70 ; =ov65_0221FF50
	add r0, r7, r0
	ldr r2, [r3, r2]
	add r1, #0x10
	sub r2, r2, #6
	mov r3, #0x30
	bl ov65_0221ED80
	add r0, r7, #0
	add r0, #0x98
	ldr r0, [r0]
	ldr r1, _0221ED68 ; =ov65_0221FF4C
	lsl r2, r0, #3
	mov r0, #0x20
	str r0, [sp]
	ldr r0, _0221ED74 ; =0x000022E8
	ldr r1, [r1, r2]
	ldr r3, _0221ED70 ; =ov65_0221FF50
	add r0, r7, r0
	ldr r2, [r3, r2]
	add r1, #0x10
	sub r2, r2, #6
	mov r3, #0xb0
	bl ov65_0221ED80
	ldr r1, _0221ED78 ; =0x000022C8
	mov r0, #0
	str r0, [r7, r1]
	ldr r2, _0221ED7C ; =ov65_0221EE18
	sub r1, #0xa8
	str r2, [r7, r1]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221ED54: .word 0x00000444
_0221ED58: .word 0x0000069E
_0221ED5C: .word 0x000006A8
_0221ED60: .word 0x000006FE
_0221ED64: .word 0x00000708
_0221ED68: .word ov65_0221FF4C
_0221ED6C: .word 0x000022D0
_0221ED70: .word ov65_0221FF50
_0221ED74: .word 0x000022E8
_0221ED78: .word 0x000022C8
_0221ED7C: .word ov65_0221EE18
	thumb_func_end ov65_0221EC34

	thumb_func_start ov65_0221ED80
ov65_0221ED80: ; 0x0221ED80
	lsl r1, r1, #0xc
	str r1, [r0]
	lsl r1, r2, #0xc
	str r1, [r0, #4]
	lsl r1, r3, #0xc
	str r1, [r0, #0xc]
	ldr r1, [sp]
	lsl r1, r1, #0xc
	str r1, [r0, #0x10]
	bx lr
	thumb_func_end ov65_0221ED80

	thumb_func_start ov65_0221ED94
ov65_0221ED94: ; 0x0221ED94
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	ldr r7, [sp, #0x48]
	str r0, [sp]
	ldr r4, [r7]
	ldr r0, [r7, #0xc]
	str r1, [sp, #4]
	add r6, r3, #0
	sub r0, r0, r4
	mov r1, #0x14
	str r2, [sp, #8]
	ldr r5, [sp, #0x4c]
	bl _s32_div_f
	mul r0, r6
	add r0, r4, r0
	str r0, [sp, #0x24]
	ldr r4, [r7, #4]
	ldr r0, [r7, #0x10]
	mov r1, #0x14
	sub r0, r0, r4
	bl _s32_div_f
	mul r0, r6
	add r0, r4, r0
	str r0, [sp, #0x28]
	ldr r0, [sp]
	add r1, sp, #0x24
	bl sub_020247D4
	ldrh r0, [r5, #2]
	cmp r0, #0
	beq _0221EDF2
	mov r0, #5
	ldr r1, [sp, #0x24]
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [sp, #0x18]
	mov r0, #0x16
	ldr r1, [sp, #0x28]
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #4]
	add r1, sp, #0x18
	bl sub_020247D4
_0221EDF2:
	ldr r0, [r5, #0xc]
	cmp r0, #0
	beq _0221EE14
	mov r0, #7
	ldr r1, [sp, #0x24]
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [sp, #0xc]
	mov r0, #0x16
	ldr r1, [sp, #0x28]
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [sp, #0x10]
	ldr r0, [sp, #8]
	add r1, sp, #0xc
	bl sub_020247D4
_0221EE14:
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov65_0221ED94

	thumb_func_start ov65_0221EE18
ov65_0221EE18: ; 0x0221EE18
	push {r3, r4, r5, lr}
	sub sp, #8
	ldr r3, _0221EEE8 ; =0x000022C8
	add r4, r0, #0
	ldr r0, [r4, r3]
	add r2, r3, #0
	add r0, r0, #1
	str r0, [r4, r3]
	add r0, r4, #0
	add r0, #0x94
	ldr r1, [r0]
	add r2, #8
	add r2, r4, r2
	lsl r0, r1, #2
	str r2, [sp]
	ldr r2, _0221EEEC ; =0x0000069C
	lsl r1, r1, #4
	add r2, r4, r2
	add r1, r2, r1
	mov r2, #0xdf
	str r1, [sp, #4]
	lsl r2, r2, #2
	add r5, r4, r0
	add r1, r2, #0
	ldr r0, [r5, r2]
	add r1, #0x30
	add r2, #0x60
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	ldr r3, [r4, r3]
	bl ov65_0221ED94
	add r0, r4, #0
	add r0, #0x98
	ldr r3, _0221EEF0 ; =0x000022E8
	ldr r5, [r0]
	add r1, r4, r3
	str r1, [sp]
	ldr r1, _0221EEEC ; =0x0000069C
	lsl r0, r5, #2
	add r2, r4, r1
	lsl r1, r5, #4
	add r1, r2, r1
	mov r2, #0xdf
	lsl r2, r2, #2
	str r1, [sp, #4]
	add r5, r4, r0
	add r1, r2, #0
	ldr r0, [r5, r2]
	add r1, #0x30
	add r2, #0x60
	sub r3, #0x20
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	ldr r3, [r4, r3]
	bl ov65_0221ED94
	ldr r1, _0221EEE8 ; =0x000022C8
	ldr r0, [r4, r1]
	cmp r0, #0x15
	bne _0221EEE0
	mov r0, #1
	add r2, r4, #0
	str r0, [sp]
	ldr r0, _0221EEF4 ; =0x00000574
	sub r1, #0xa4
	add r2, #0x94
	ldr r1, [r4, r1]
	ldr r2, [r2]
	add r0, r4, r0
	mov r3, #8
	bl ov65_0221D5FC
	mov r0, #1
	add r2, r4, #0
	str r0, [sp]
	ldr r1, _0221EEF8 ; =0x00002228
	add r2, #0x98
	ldr r0, _0221EEFC ; =0x00000584
	ldr r2, [r2]
	ldr r1, [r4, r1]
	add r0, r4, r0
	sub r2, r2, #6
	mov r3, #8
	bl ov65_0221D5FC
	add r1, r4, #0
	add r1, #0x98
	ldr r1, [r1]
	add r0, r4, #0
	bl ov65_0221CADC
	ldr r1, _0221EF00 ; =ov65_0221F028
	ldr r0, _0221EF04 ; =0x00002220
	str r1, [r4, r0]
	ldr r0, _0221EF08 ; =0x00000424
	mov r1, #1
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
_0221EEE0:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_0221EEE8: .word 0x000022C8
_0221EEEC: .word 0x0000069C
_0221EEF0: .word 0x000022E8
_0221EEF4: .word 0x00000574
_0221EEF8: .word 0x00002228
_0221EEFC: .word 0x00000584
_0221EF00: .word ov65_0221F028
_0221EF04: .word 0x00002220
_0221EF08: .word 0x00000424
	thumb_func_end ov65_0221EE18

	thumb_func_start ov65_0221EF0C
ov65_0221EF0C: ; 0x0221EF0C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r1, _0221F004 ; =0x00000574
	str r0, [sp]
	add r0, r0, r1
	bl ClearWindowTilemapAndScheduleTransfer
	ldr r1, _0221F008 ; =0x00000584
	ldr r0, [sp]
	add r0, r0, r1
	bl ClearWindowTilemapAndScheduleTransfer
	ldr r6, [sp]
	ldr r1, _0221F00C ; =0x00000444
	add r0, r6, #0
	add r0, r0, r1
	ldr r4, _0221F010 ; =ov65_0221FF4C
	mov r7, #0
	add r5, r6, #0
	str r0, [sp, #4]
_0221EF34:
	ldr r0, _0221F014 ; =0x0000069C
	ldrh r0, [r6, r0]
	cmp r0, #0
	beq _0221EFB2
	mov r0, #0xdf
	lsl r0, r0, #2
	ldr r1, [r4]
	ldr r2, [r4, #4]
	ldr r0, [r5, r0]
	add r1, #0x10
	sub r2, r2, #6
	bl ov65_0221F748
	mov r0, #0xdf
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, _0221F018 ; =0x0000069E
	ldrh r0, [r6, r0]
	cmp r0, #0
	beq _0221EF80
	mov r0, #0xeb
	lsl r0, r0, #2
	ldr r1, [r4]
	ldr r2, [r4, #4]
	ldr r0, [r5, r0]
	add r1, #0x24
	add r2, #0x10
	bl ov65_0221F748
	mov r0, #0xeb
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
_0221EF80:
	ldr r0, _0221F01C ; =0x000006A8
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _0221EFA6
	mov r0, #0xf7
	lsl r0, r0, #2
	ldr r1, [r4]
	ldr r2, [r4, #4]
	ldr r0, [r5, r0]
	add r1, #0x2c
	add r2, #0x10
	bl ov65_0221F748
	mov r0, #0xf7
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
_0221EFA6:
	add r0, r7, #7
	lsl r1, r0, #4
	ldr r0, [sp, #4]
	add r0, r0, r1
	bl ScheduleWindowCopyToVram
_0221EFB2:
	add r7, r7, #1
	add r6, #0x10
	add r4, #8
	add r5, r5, #4
	cmp r7, #0xc
	blt _0221EF34
	mov r1, #0xd1
	ldr r0, [sp]
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r1, #0xd2
	ldr r0, [sp]
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r1, _0221F00C ; =0x00000444
	ldr r0, [sp]
	ldr r2, [sp]
	add r0, r0, r1
	mov r1, #1
	bl ov65_0221D8C4
	ldr r1, _0221F020 ; =0x00000418
	ldr r0, [sp]
	ldr r0, [r0, r1]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r1, _0221F024 ; =0x00000424
	ldr r0, [sp]
	ldr r0, [r0, r1]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221F004: .word 0x00000574
_0221F008: .word 0x00000584
_0221F00C: .word 0x00000444
_0221F010: .word ov65_0221FF4C
_0221F014: .word 0x0000069C
_0221F018: .word 0x0000069E
_0221F01C: .word 0x000006A8
_0221F020: .word 0x00000418
_0221F024: .word 0x00000424
	thumb_func_end ov65_0221EF0C

	thumb_func_start ov65_0221F028
ov65_0221F028: ; 0x0221F028
	push {r4, lr}
	sub sp, #0x10
	mov r1, #0
	add r4, r0, #0
	str r1, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x18
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r2, r1, #0
	add r3, r1, #0
	bl FillBgTilemapRect
	ldr r0, _0221F0B0 ; =0x00002224
	add r1, r4, #0
	add r1, #0x94
	ldr r0, [r4, r0]
	ldr r1, [r1]
	bl GetPartyMonByIndex
	bl Mon_GetBoxMon
	add r2, r0, #0
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl BufferBoxMonNickname
	add r1, r4, #0
	ldr r0, _0221F0B4 ; =0x00002228
	add r1, #0x98
	ldr r1, [r1]
	ldr r0, [r4, r0]
	sub r1, r1, #6
	bl GetPartyMonByIndex
	bl Mon_GetBoxMon
	add r2, r0, #0
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl BufferBoxMonNickname
	mov r3, #0x62
	lsl r3, r3, #2
	ldr r0, [r4, r3]
	add r3, #8
	str r0, [sp]
	ldr r0, _0221F0B8 ; =0x000005B4
	ldr r3, [r4, r3]
	add r0, r4, r0
	mov r1, #0x15
	mov r2, #1
	bl ov65_0221FB90
	ldr r1, _0221F0BC ; =ov65_0221F120
	ldr r0, _0221F0C0 ; =0x00002220
	str r1, [r4, r0]
	mov r0, #0
	add sp, #0x10
	pop {r4, pc}
	nop
_0221F0B0: .word 0x00002224
_0221F0B4: .word 0x00002228
_0221F0B8: .word 0x000005B4
_0221F0BC: .word ov65_0221F120
_0221F0C0: .word 0x00002220
	thumb_func_end ov65_0221F028

	thumb_func_start ov65_0221F0C4
ov65_0221F0C4: ; 0x0221F0C4
	push {r4, lr}
	mov r1, #0x18
	mov r2, #3
	add r4, r0, #0
	bl ov65_0221DE24
	mov r0, #1
	str r0, [r4, #0x68]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov65_0221F0C4

	thumb_func_start ov65_0221F0D8
ov65_0221F0D8: ; 0x0221F0D8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r4, r1, #0
	mov r1, #0
	add r5, r0, #0
	str r1, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x18
	str r0, [sp, #8]
	add r6, r2, #0
	str r1, [sp, #0xc]
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r2, r1, #0
	add r3, r1, #0
	bl FillBgTilemapRect
	mov r3, #0x61
	lsl r3, r3, #2
	ldr r0, [r5, r3]
	add r3, #0xc
	str r0, [sp]
	ldr r0, _0221F11C ; =0x00000444
	ldr r3, [r5, r3]
	add r1, r5, r0
	lsl r0, r4, #4
	add r0, r1, r0
	add r1, r6, #0
	mov r2, #1
	bl ov65_0221FB90
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0221F11C: .word 0x00000444
	thumb_func_end ov65_0221F0D8

	thumb_func_start ov65_0221F120
ov65_0221F120: ; 0x0221F120
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	ldr r2, _0221F240 ; =0x00000664
	lsl r0, r0, #6
	mov r3, #0xdb
	add r1, r4, r2
	add r2, #0xc
	lsl r3, r3, #6
	ldr r0, [r4, r0]
	add r2, r4, r2
	add r3, r4, r3
	bl ov65_0221FC54
	cmp r0, #4
	bhi _0221F238
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0221F152: ; jump table
	.short _0221F238 - _0221F152 - 2 ; case 0
	.short _0221F15C - _0221F152 - 2 ; case 1
	.short _0221F1F6 - _0221F152 - 2 ; case 2
	.short _0221F15C - _0221F152 - 2 ; case 3
	.short _0221F1F6 - _0221F152 - 2 ; case 4
_0221F15C:
	add r0, r4, #0
	bl ov65_0221F79C
	cmp r0, #0
	beq _0221F1E4
	add r0, r4, #0
	bl ov65_0221F7E0
	cmp r0, #0
	beq _0221F17A
	cmp r0, #1
	beq _0221F1AC
	cmp r0, #2
	beq _0221F1C8
	b _0221F238
_0221F17A:
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	lsl r0, r0, #4
	add r1, r4, r0
	ldr r0, _0221F244 ; =0x000006A8
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _0221F1A4
	add r0, r4, #0
	bl ov65_0221F0C4
	add r0, r4, #0
	mov r1, #0x17
	mov r2, #0x14
	bl ov65_0221F0D8
	ldr r1, _0221F248 ; =ov65_0221F354
	ldr r0, _0221F24C ; =0x00002220
	str r1, [r4, r0]
	b _0221F238
_0221F1A4:
	ldr r1, _0221F250 ; =ov65_0221F258
	ldr r0, _0221F24C ; =0x00002220
	str r1, [r4, r0]
	b _0221F238
_0221F1AC:
	add r0, r4, #0
	mov r1, #0x17
	mov r2, #0x25
	bl ov65_0221F0D8
	ldr r1, _0221F248 ; =ov65_0221F354
	ldr r0, _0221F24C ; =0x00002220
	mov r2, #4
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #0x18
	bl ov65_0221DE24
	b _0221F238
_0221F1C8:
	add r0, r4, #0
	mov r1, #0x17
	mov r2, #0x26
	bl ov65_0221F0D8
	ldr r1, _0221F248 ; =ov65_0221F354
	ldr r0, _0221F24C ; =0x00002220
	mov r2, #4
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #0x18
	bl ov65_0221DE24
	b _0221F238
_0221F1E4:
	ldr r1, _0221F248 ; =ov65_0221F354
	ldr r0, _0221F24C ; =0x00002220
	mov r2, #4
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #0x18
	bl ov65_0221DE24
	b _0221F238
_0221F1F6:
	mov r1, #0
	str r1, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x18
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r2, r1, #0
	add r3, r1, #0
	bl FillBgTilemapRect
	mov r3, #0x61
	lsl r3, r3, #2
	ldr r0, [r4, r3]
	add r3, #0xc
	str r0, [sp]
	ldr r0, _0221F254 ; =0x000005B4
	ldr r3, [r4, r3]
	add r0, r4, r0
	mov r1, #0x14
	mov r2, #1
	bl ov65_0221FB90
	ldr r1, _0221F248 ; =ov65_0221F354
	ldr r0, _0221F24C ; =0x00002220
	mov r2, #4
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #0x18
	bl ov65_0221DE24
_0221F238:
	mov r0, #0
	add sp, #0x10
	pop {r4, pc}
	nop
_0221F240: .word 0x00000664
_0221F244: .word 0x000006A8
_0221F248: .word ov65_0221F354
_0221F24C: .word 0x00002220
_0221F250: .word ov65_0221F258
_0221F254: .word 0x000005B4
	thumb_func_end ov65_0221F120

	thumb_func_start ov65_0221F258
ov65_0221F258: ; 0x0221F258
	push {r4, lr}
	sub sp, #0x10
	mov r1, #0
	add r4, r0, #0
	str r1, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x18
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r2, r1, #0
	add r3, r1, #0
	bl FillBgTilemapRect
	mov r3, #0x62
	lsl r3, r3, #2
	ldr r0, [r4, r3]
	add r3, #8
	str r0, [sp]
	ldr r0, _0221F29C ; =0x000005B4
	ldr r3, [r4, r3]
	add r0, r4, r0
	mov r1, #0x24
	mov r2, #1
	bl ov65_0221FB90
	ldr r1, _0221F2A0 ; =ov65_0221F2A8
	ldr r0, _0221F2A4 ; =0x00002220
	str r1, [r4, r0]
	mov r0, #0
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_0221F29C: .word 0x000005B4
_0221F2A0: .word ov65_0221F2A8
_0221F2A4: .word 0x00002220
	thumb_func_end ov65_0221F258

	thumb_func_start ov65_0221F2A8
ov65_0221F2A8: ; 0x0221F2A8
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	ldr r2, _0221F344 ; =0x00000664
	lsl r0, r0, #6
	mov r3, #0xdb
	add r1, r4, r2
	add r2, #0xc
	lsl r3, r3, #6
	ldr r0, [r4, r0]
	add r2, r4, r2
	add r3, r4, r3
	bl ov65_0221FC54
	cmp r0, #4
	bhi _0221F33E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0221F2DA: ; jump table
	.short _0221F33E - _0221F2DA - 2 ; case 0
	.short _0221F2E4 - _0221F2DA - 2 ; case 1
	.short _0221F2FC - _0221F2DA - 2 ; case 2
	.short _0221F2E4 - _0221F2DA - 2 ; case 3
	.short _0221F2FC - _0221F2DA - 2 ; case 4
_0221F2E4:
	add r0, r4, #0
	bl ov65_0221F0C4
	add r0, r4, #0
	mov r1, #0x17
	mov r2, #0x14
	bl ov65_0221F0D8
	ldr r1, _0221F348 ; =ov65_0221F354
	ldr r0, _0221F34C ; =0x00002220
	str r1, [r4, r0]
	b _0221F33E
_0221F2FC:
	mov r1, #0
	str r1, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x18
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r2, r1, #0
	add r3, r1, #0
	bl FillBgTilemapRect
	mov r3, #0x61
	lsl r3, r3, #2
	ldr r0, [r4, r3]
	add r3, #0xc
	str r0, [sp]
	ldr r0, _0221F350 ; =0x000005B4
	ldr r3, [r4, r3]
	add r0, r4, r0
	mov r1, #0x14
	mov r2, #1
	bl ov65_0221FB90
	ldr r1, _0221F348 ; =ov65_0221F354
	ldr r0, _0221F34C ; =0x00002220
	mov r2, #4
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #0x18
	bl ov65_0221DE24
_0221F33E:
	mov r0, #0
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_0221F344: .word 0x00000664
_0221F348: .word ov65_0221F354
_0221F34C: .word 0x00002220
_0221F350: .word 0x000005B4
	thumb_func_end ov65_0221F2A8

	thumb_func_start ov65_0221F354
ov65_0221F354: ; 0x0221F354
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x6c]
	cmp r1, #0
	beq _0221F39C
	ldr r0, [r4, #0x70]
	cmp r0, #0
	beq _0221F39C
	cmp r1, #3
	bne _0221F37C
	cmp r0, #3
	bne _0221F37C
	ldr r0, _0221F3A0 ; =0x000036A4
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	ldr r1, _0221F3A4 ; =ov65_0221F3B0
	ldr r0, _0221F3A8 ; =0x00002220
	str r1, [r4, r0]
	b _0221F382
_0221F37C:
	ldr r1, _0221F3AC ; =ov65_0221E270
	ldr r0, _0221F3A8 ; =0x00002220
	str r1, [r4, r0]
_0221F382:
	mov r0, #0
	str r0, [r4, #0x6c]
	str r0, [r4, #0x70]
	add r0, r4, #0
	bl ov65_0221F79C
	cmp r0, #0
	beq _0221F398
	mov r0, #0x18
	str r0, [r4, #0x74]
	b _0221F39C
_0221F398:
	mov r0, #0x22
	str r0, [r4, #0x74]
_0221F39C:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0221F3A0: .word 0x000036A4
_0221F3A4: .word ov65_0221F3B0
_0221F3A8: .word 0x00002220
_0221F3AC: .word ov65_0221E270
	thumb_func_end ov65_0221F354

	thumb_func_start ov65_0221F3B0
ov65_0221F3B0: ; 0x0221F3B0
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, [r4, #4]
	mov r1, #1
	bl sub_02034AEC
	ldr r0, [r4, #8]
	add r3, r4, #0
	add r2, r4, #0
	ldr r1, _0221F3E8 ; =0x00002224
	str r0, [sp]
	add r3, #0x98
	ldr r0, [r4, r1]
	add r1, r1, #4
	add r2, #0x94
	ldr r3, [r3]
	ldr r1, [r4, r1]
	ldr r2, [r2]
	sub r3, r3, #6
	bl ov65_0221F5A0
	ldr r1, _0221F3EC ; =ov65_0221E270
	ldr r0, _0221F3F0 ; =0x00002220
	str r1, [r4, r0]
	mov r0, #2
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0221F3E8: .word 0x00002224
_0221F3EC: .word ov65_0221E270
_0221F3F0: .word 0x00002220
	thumb_func_end ov65_0221F3B0

	thumb_func_start ov65_0221F3F4
ov65_0221F3F4: ; 0x0221F3F4
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r1, r4, #0
	ldr r0, _0221F498 ; =0x00002228
	add r1, #0x94
	ldr r1, [r1]
	ldr r0, [r4, r0]
	sub r1, r1, #6
	bl GetPartyMonByIndex
	bl Mon_GetBoxMon
	add r2, r0, #0
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl BufferBoxMonNickname
	mov r1, #0
	str r1, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x18
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r2, r1, #0
	add r3, r1, #0
	bl FillBgTilemapRect
	mov r3, #0x62
	lsl r3, r3, #2
	ldr r0, [r4, r3]
	add r3, #8
	str r0, [sp]
	ldr r0, _0221F49C ; =0x000005A4
	ldr r3, [r4, r3]
	add r0, r4, r0
	mov r1, #0x10
	mov r2, #1
	bl ov65_0221FB90
	mov r0, #2
	mov r1, #0x1a
	bl ListMenuItems_ctor
	ldr r1, _0221F4A0 ; =0x00000668
	mov r2, #0x11
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #0x19
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	mov r3, #0
	bl ListMenuItems_AppendFromMsgData
	ldr r0, _0221F4A0 ; =0x00000668
	mov r1, #0x19
	lsl r1, r1, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	mov r2, #0x13
	mov r3, #1
	bl ListMenuItems_AppendFromMsgData
	add r0, r4, #0
	mov r1, #2
	mov r2, #0xc
	bl ov65_0221E928
	ldr r1, _0221F4A4 ; =0x000036C8
	str r0, [r4, r1]
	ldr r1, _0221F4A8 ; =ov65_0221F4D4
	ldr r0, _0221F4AC ; =0x00002220
	str r1, [r4, r0]
	mov r0, #0
	add sp, #0x10
	pop {r4, pc}
	nop
_0221F498: .word 0x00002228
_0221F49C: .word 0x000005A4
_0221F4A0: .word 0x00000668
_0221F4A4: .word 0x000036C8
_0221F4A8: .word ov65_0221F4D4
_0221F4AC: .word 0x00002220
	thumb_func_end ov65_0221F3F4

	thumb_func_start ov65_0221F4B0
ov65_0221F4B0: ; 0x0221F4B0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0221F4CC ; =0x000036C8
	ldr r0, [r4, r0]
	bl sub_02018680
	ldr r0, _0221F4D0 ; =0x000036C4
	ldr r0, [r4, r0]
	bl sub_02018474
	bl ov65_0221F8B4
	pop {r4, pc}
	nop
_0221F4CC: .word 0x000036C8
_0221F4D0: .word 0x000036C4
	thumb_func_end ov65_0221F4B0

	thumb_func_start ov65_0221F4D4
ov65_0221F4D4: ; 0x0221F4D4
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r0, _0221F58C ; =0x000036C8
	ldr r0, [r4, r0]
	bl sub_020186A4
	cmp r0, #0
	beq _0221F4F4
	cmp r0, #1
	beq _0221F540
	mov r1, #1
	mvn r1, r1
	cmp r0, r1
	beq _0221F540
	b _0221F586
_0221F4F4:
	mov r1, #0
	str r1, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x18
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r2, r1, #0
	add r3, r1, #0
	bl FillBgTilemapRect
	mov r3, #0x61
	lsl r3, r3, #2
	ldr r0, [r4, r3]
	add r3, #0xc
	str r0, [sp]
	ldr r0, _0221F590 ; =0x00000594
	ldr r3, [r4, r3]
	add r0, r4, r0
	mov r1, #0xf
	mov r2, #1
	bl ov65_0221FB90
	ldr r1, _0221F594 ; =ov65_0221E050
	ldr r0, _0221F598 ; =0x00002220
	str r1, [r4, r0]
	add r0, r4, #0
	bl ov65_0221F4B0
	ldr r0, _0221F59C ; =0x00000668
	ldr r0, [r4, r0]
	bl ListMenuItems_dtor
	add sp, #0x10
	mov r0, #3
	pop {r4, pc}
_0221F540:
	mov r1, #0
	str r1, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x18
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r2, r1, #0
	add r3, r1, #0
	bl FillBgTilemapRect
	mov r3, #0x61
	lsl r3, r3, #2
	ldr r0, [r4, r3]
	add r3, #0xc
	str r0, [sp]
	ldr r0, _0221F590 ; =0x00000594
	ldr r3, [r4, r3]
	add r0, r4, r0
	mov r1, #0xf
	mov r2, #1
	bl ov65_0221FB90
	add r0, r4, #0
	bl ov65_0221F4B0
	ldr r0, _0221F59C ; =0x00000668
	ldr r0, [r4, r0]
	bl ListMenuItems_dtor
	ldr r1, _0221F594 ; =ov65_0221E050
	ldr r0, _0221F598 ; =0x00002220
	str r1, [r4, r0]
_0221F586:
	mov r0, #0
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_0221F58C: .word 0x000036C8
_0221F590: .word 0x00000594
_0221F594: .word ov65_0221E050
_0221F598: .word 0x00002220
_0221F59C: .word 0x00000668
	thumb_func_end ov65_0221F4D4

	thumb_func_start ov65_0221F5A0
ov65_0221F5A0: ; 0x0221F5A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r7, r0, #0
	mov r0, #0x1a
	str r1, [sp, #4]
	add r6, r2, #0
	str r3, [sp, #8]
	ldr r5, [sp, #0x30]
	bl AllocMonZeroed
	str r0, [sp, #0xc]
	mov r0, #0x1a
	bl AllocMonZeroed
	add r4, r0, #0
	add r0, r7, #0
	add r1, r6, #0
	bl GetPartyMonByIndex
	ldr r1, [sp, #0xc]
	bl CopyPokemonToPokemon
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	bl GetPartyMonByIndex
	add r1, r4, #0
	bl CopyPokemonToPokemon
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	ldr r1, _0221F70C ; =0x000001ED
	cmp r0, r1
	bne _0221F62C
	add r0, r4, #0
	mov r1, #0x6e
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0221F614
	add r0, r4, #0
	mov r1, #0x99
	mov r2, #0
	bl GetMonData
	cmp r0, #0x56
	bne _0221F62C
	add r0, r4, #0
	mov r1, #0x6e
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0221F62C
_0221F614:
	ldr r0, [r5, #0x10]
	bl SavArray_Flags_get
	str r0, [sp, #0x10]
	bl ScriptState_GetVar404C
	cmp r0, #0
	bne _0221F62C
	ldr r0, [sp, #0x10]
	mov r1, #1
	bl ScriptState_SetVar404C
_0221F62C:
	add r0, r4, #0
	mov r1, #0x6f
	mov r2, #0
	bl SetMonData
	add r0, r4, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0221F664
	mov r1, #0x46
	add r0, sp, #0x14
	strb r1, [r0, #1]
	mov r1, #0
	strb r1, [r0]
	add r2, sp, #0x14
	add r0, r4, #0
	mov r1, #9
	add r2, #1
	bl SetMonData
	add r0, r4, #0
	mov r1, #0xbb
	add r2, sp, #0x14
	bl SetMonData
_0221F664:
	bl sub_0203769C
	bl sub_02034818
	add r1, r0, #0
	mov r0, #0xb
	str r0, [sp]
	add r0, r4, #0
	mov r2, #5
	mov r3, #0
	bl MonSetTrainerMemo
	add r0, r4, #0
	bl Pokemon_RemoveCapsule
	ldr r0, [sp, #0xc]
	ldr r1, [r5, #0x38]
	bl CopyPokemonToPokemon
	ldr r1, [r5, #0x3c]
	add r0, r4, #0
	bl CopyPokemonToPokemon
	bl sub_0203769C
	mov r1, #1
	eor r0, r1
	bl sub_02034818
	ldr r1, [r5, #0x34]
	bl PlayerProfile_copy
	ldr r1, _0221F710 ; =0x000001B9
	add r0, r7, #0
	str r6, [r5, #0x28]
	bl PartyHasMon
	cmp r0, #0
	bne _0221F6BC
	ldr r0, [r5, #0x10]
	bl Sav2_Chatot_get
	bl Chatot_invalidate
_0221F6BC:
	ldr r0, [r5, #0x10]
	add r1, r4, #0
	bl UpdatePokedexWithReceivedSpecies
	add r0, r7, #0
	add r1, r6, #0
	bl GetPartyMonByIndex
	add r1, r0, #0
	add r0, r4, #0
	bl CopyPokemonToPokemon
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	bl GetPartyMonByIndex
	add r1, r0, #0
	ldr r0, [sp, #0xc]
	bl CopyPokemonToPokemon
	add r0, r7, #0
	add r1, r6, #0
	bl Party_ResetUnkSubSlot
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	bl Party_ResetUnkSubSlot
	ldr r0, [r5, #0x1c]
	mov r1, #0x14
	bl GameStats_Inc
	ldr r0, [sp, #0xc]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221F70C: .word 0x000001ED
_0221F710: .word 0x000001B9
	thumb_func_end ov65_0221F5A0

	thumb_func_start ov65_0221F714
ov65_0221F714: ; 0x0221F714
	push {r4, lr}
	ldr r3, _0221F744 ; =0x000022C4
	add r4, r0, #0
	ldr r0, [r4, r3]
	mov r1, #6
	add r0, r0, #2
	str r0, [r4, r3]
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	ldr r3, [r4, r3]
	mov r2, #0
	bl BgSetPosTextAndCommit
	mov r0, #6
	ldr r3, _0221F744 ; =0x000022C4
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	ldr r3, [r4, r3]
	mov r1, #3
	mov r2, #0
	bl BgSetPosTextAndCommit
	pop {r4, pc}
	.balign 4, 0
_0221F744: .word 0x000022C4
	thumb_func_end ov65_0221F714

	thumb_func_start ov65_0221F748
ov65_0221F748: ; 0x0221F748
	push {lr}
	sub sp, #0xc
	lsl r1, r1, #0xc
	str r1, [sp]
	lsl r1, r2, #0xc
	str r1, [sp, #4]
	add r1, sp, #0
	bl sub_020247D4
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end ov65_0221F748

	thumb_func_start ov65_0221F760
ov65_0221F760: ; 0x0221F760
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0221F774 ; =0x000005B4
	ldr r1, _0221F778 ; =0x000003D9
	add r0, r4, r0
	bl sub_0200F0AC
	ldr r1, _0221F77C ; =0x000036B4
	str r0, [r4, r1]
	pop {r4, pc}
	.balign 4, 0
_0221F774: .word 0x000005B4
_0221F778: .word 0x000003D9
_0221F77C: .word 0x000036B4
	thumb_func_end ov65_0221F760

	thumb_func_start ov65_0221F780
ov65_0221F780: ; 0x0221F780
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0221F798 ; =0x000036B4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0221F796
	bl sub_0200F450
	ldr r0, _0221F798 ; =0x000036B4
	mov r1, #0
	str r1, [r4, r0]
_0221F796:
	pop {r4, pc}
	.balign 4, 0
_0221F798: .word 0x000036B4
	thumb_func_end ov65_0221F780

	thumb_func_start ov65_0221F79C
ov65_0221F79C: ; 0x0221F79C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0221F7D8 ; =0x00002224
	mov r4, #0
	ldr r0, [r5, r0]
	bl GetPartyCount
	add r3, r4, #0
	cmp r0, #0
	ble _0221F7C8
	add r1, r5, #0
	add r1, #0x94
	ldr r6, [r1]
	ldr r1, _0221F7DC ; =0x000006A1
_0221F7B8:
	cmp r3, r6
	beq _0221F7C0
	ldrb r2, [r5, r1]
	add r4, r4, r2
_0221F7C0:
	add r3, r3, #1
	add r5, #0x10
	cmp r3, r0
	blt _0221F7B8
_0221F7C8:
	sub r0, r0, #1
	cmp r4, r0
	bne _0221F7D2
	mov r0, #0
	pop {r4, r5, r6, pc}
_0221F7D2:
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_0221F7D8: .word 0x00002224
_0221F7DC: .word 0x000006A1
	thumb_func_end ov65_0221F79C

	thumb_func_start ov65_0221F7E0
ov65_0221F7E0: ; 0x0221F7E0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0221F848 ; =0x00002224
	ldr r0, [r5, r0]
	bl GetPartyCount
	add r6, r0, #0
	mov r4, #0
	cmp r6, #0
	ble _0221F814
	ldr r7, _0221F848 ; =0x00002224
_0221F7F6:
	ldr r0, [r5, r7]
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0221F80E
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0221F80E:
	add r4, r4, #1
	cmp r4, r6
	blt _0221F7F6
_0221F814:
	ldr r0, _0221F84C ; =0x00002228
	ldr r0, [r5, r0]
	bl GetPartyCount
	add r6, r0, #0
	mov r4, #0
	cmp r6, #0
	ble _0221F844
	ldr r7, _0221F84C ; =0x00002228
_0221F826:
	ldr r0, [r5, r7]
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0221F83E
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_0221F83E:
	add r4, r4, #1
	cmp r4, r6
	blt _0221F826
_0221F844:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221F848: .word 0x00002224
_0221F84C: .word 0x00002228
	thumb_func_end ov65_0221F7E0

	thumb_func_start ov65_0221F850
ov65_0221F850: ; 0x0221F850
	ldr r1, _0221F860 ; =0x000036B8
	mov r2, #1
	str r2, [r0, r1]
	mov r2, #0
	add r1, r1, #4
	str r2, [r0, r1]
	bx lr
	nop
_0221F860: .word 0x000036B8
	thumb_func_end ov65_0221F850

	thumb_func_start ov65_0221F864
ov65_0221F864: ; 0x0221F864
	push {r3, lr}
	ldr r2, _0221F888 ; =0x000036B8
	ldr r1, [r0, r2]
	cmp r1, #0
	beq _0221F886
	add r1, r2, #4
	ldr r1, [r0, r1]
	add r3, r1, #1
	add r1, r2, #4
	str r3, [r0, r1]
	ldr r1, [r0, r1]
	ldr r0, _0221F88C ; =0x00000708
	cmp r1, r0
	ble _0221F886
	mov r0, #4
	bl sub_02039AD8
_0221F886:
	pop {r3, pc}
	.balign 4, 0
_0221F888: .word 0x000036B8
_0221F88C: .word 0x00000708
	thumb_func_end ov65_0221F864

	thumb_func_start ov65_0221F890
ov65_0221F890: ; 0x0221F890
	mov r0, #1
	lsl r0, r0, #0x1a
	ldr r2, [r0]
	ldr r1, _0221F8AC ; =0xFFFF1FFF
	ldr r3, _0221F8B0 ; =G2x_SetBlendBrightness_
	and r2, r1
	lsr r1, r0, #0xd
	orr r1, r2
	str r1, [r0]
	add r0, #0x50
	mov r1, #0x1e
	mov r2, #7
	bx r3
	nop
_0221F8AC: .word 0xFFFF1FFF
_0221F8B0: .word G2x_SetBlendBrightness_
	thumb_func_end ov65_0221F890

	thumb_func_start ov65_0221F8B4
ov65_0221F8B4: ; 0x0221F8B4
	ldr r2, _0221F8C8 ; =0x04000050
	mov r0, #0
	strh r0, [r2]
	sub r2, #0x50
	ldr r1, [r2]
	ldr r0, _0221F8CC ; =0xFFFF1FFF
	and r0, r1
	str r0, [r2]
	bx lr
	nop
_0221F8C8: .word 0x04000050
_0221F8CC: .word 0xFFFF1FFF
	thumb_func_end ov65_0221F8B4

	thumb_func_start ov65_0221F8D0
ov65_0221F8D0: ; 0x0221F8D0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r4, r2, #0
	mov r2, #1
	str r2, [sp]
	mov r3, #0xa
	str r3, [sp, #4]
	mov r3, #2
	str r3, [sp, #8]
	mov r6, #8
	str r6, [sp, #0xc]
	add r5, r1, #0
	str r0, [sp, #0x14]
	str r2, [sp, #0x10]
	bl AddWindowParameterized
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r2, #1
	add r1, r5, #0
	str r2, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	add r0, r6, #0
	str r0, [sp, #0xc]
	mov r0, #0x15
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	add r1, #0x10
	mov r3, #0x14
	bl AddWindowParameterized
	add r0, r5, #0
	add r0, #0x10
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x15
	str r0, [sp]
	mov r0, #5
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	add r0, r6, #0
	str r0, [sp, #0xc]
	mov r0, #0x29
	str r0, [sp, #0x10]
	add r1, r5, #0
	ldr r0, [sp, #0x14]
	add r1, #0x60
	mov r2, #1
	mov r3, #0x1a
	bl AddWindowParameterized
	add r0, r5, #0
	add r0, #0x60
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x1a
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	ldr r2, _0221FAD0 ; =0x000003D9
	mov r1, #0
	mov r3, #0xa
	bl LoadUserFrameGfx2
	mov r1, #0
	str r1, [sp]
	mov r0, #0x1a
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	ldr r2, _0221FAD4 ; =0x000003F7
	mov r3, #0xb
	bl LoadUserFrameGfx1
	mov r1, #0x15
	str r1, [sp]
	mov r0, #0x14
	str r0, [sp, #4]
	mov r3, #2
	lsl r1, r1, #4
	str r3, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	add r1, r5, r1
	mov r2, #0
	bl AddWindowParameterized
	mov r0, #0x15
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x15
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r3, #2
	mov r1, #0x16
	lsl r1, r1, #4
	str r3, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0x28
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	add r1, r5, r1
	mov r2, #0
	bl AddWindowParameterized
	mov r0, #0x16
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0x36
	mov r1, #0x17
	str r0, [sp, #0x10]
	lsl r1, r1, #4
	ldr r0, [sp, #0x14]
	add r1, r5, r1
	mov r2, #0
	mov r3, #2
	bl AddWindowParameterized
	mov r0, #0x17
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r1, #0xa2
	str r1, [sp, #0x10]
	add r1, #0xee
	ldr r0, [sp, #0x14]
	add r1, r5, r1
	mov r2, #0
	mov r3, #0x14
	bl AddWindowParameterized
	mov r0, #0x19
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r4, _0221FAD8 ; =ov65_0222010C
	mov r7, #0
	mov r6, #0x33
_0221FA3A:
	add r0, r7, #7
	lsl r0, r0, #4
	str r0, [sp, #0x18]
	ldrh r0, [r4, #2]
	ldr r1, [sp, #0x18]
	mov r2, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #8
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #8
	str r0, [sp, #0xc]
	lsl r0, r6, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldrh r3, [r4]
	ldr r0, [sp, #0x14]
	add r1, r5, r1
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	ldr r0, [sp, #0x18]
	mov r1, #0
	add r0, r5, r0
	bl FillWindowPixelBuffer
	add r7, r7, #1
	add r6, #0x10
	add r4, r4, #4
	cmp r7, #0xe
	blt _0221FA3A
	ldr r4, _0221FADC ; =ov65_02220144
	mov r6, #0
_0221FA84:
	add r0, r6, #0
	add r0, #0x1a
	lsl r7, r0, #4
	ldrh r0, [r4, #2]
	add r1, r5, r7
	mov r2, #4
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldrh r0, [r4, #4]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldrh r0, [r4, #6]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #8
	str r0, [sp, #0xc]
	ldrh r0, [r4, #8]
	str r0, [sp, #0x10]
	ldrh r3, [r4]
	ldr r0, [sp, #0x14]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	add r0, r5, r7
	mov r1, #0
	bl FillWindowPixelBuffer
	add r6, r6, #1
	add r4, #0xa
	cmp r6, #8
	blt _0221FA84
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_0221FAD0: .word 0x000003D9
_0221FAD4: .word 0x000003F7
_0221FAD8: .word ov65_0222010C
_0221FADC: .word ov65_02220144
	thumb_func_end ov65_0221F8D0

	thumb_func_start ov65_0221FAE0
ov65_0221FAE0: ; 0x0221FAE0
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r5, #0
_0221FAE6:
	add r0, r5, #7
	lsl r0, r0, #4
	add r0, r4, r0
	bl RemoveWindow
	add r5, r5, #1
	cmp r5, #0xe
	blt _0221FAE6
	mov r5, #0
_0221FAF8:
	add r0, r5, #0
	add r0, #0x1a
	lsl r0, r0, #4
	add r0, r4, r0
	bl RemoveWindow
	add r5, r5, #1
	cmp r5, #8
	blt _0221FAF8
	add r0, r4, #0
	bl RemoveWindow
	add r0, r4, #0
	add r0, #0x10
	bl RemoveWindow
	add r0, r4, #0
	add r0, #0x60
	bl RemoveWindow
	mov r0, #0x15
	lsl r0, r0, #4
	add r0, r4, r0
	bl RemoveWindow
	mov r0, #0x16
	lsl r0, r0, #4
	add r0, r4, r0
	bl RemoveWindow
	mov r0, #0x17
	lsl r0, r0, #4
	add r0, r4, r0
	bl RemoveWindow
	mov r0, #0x19
	lsl r0, r0, #4
	add r0, r4, r0
	bl RemoveWindow
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov65_0221FAE0

	thumb_func_start ov65_0221FB4C
ov65_0221FB4C: ; 0x0221FB4C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r4, r3, #0
	ldr r3, [sp, #0x20]
	add r5, r0, #0
	add r6, r1, #0
	cmp r3, #1
	bne _0221FB70
	mov r0, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	ldrb r1, [r5, #7]
	lsl r1, r1, #3
	sub r1, r1, r0
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r3, r0, #1
_0221FB70:
	ldr r0, [sp, #0x24]
	mov r1, #0
	str r0, [sp]
	ldr r0, _0221FB8C ; =0x000B0C00
	str r4, [sp, #4]
	str r0, [sp, #8]
	add r0, r5, #0
	add r2, r6, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0221FB8C: .word 0x000B0C00
	thumb_func_end ov65_0221FB4C

	thumb_func_start ov65_0221FB90
ov65_0221FB90: ; 0x0221FB90
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r6, r1, #0
	add r4, r2, #0
	add r1, r3, #0
	ldr r0, [sp, #0x20]
	add r2, r6, #0
	mov r3, #0x1a
	bl ReadMsgData_ExpandPlaceholders
	add r6, r0, #0
	cmp r4, #1
	bne _0221FBBA
	ldr r2, _0221FBFC ; =0x000003D9
	add r0, r5, #0
	mov r1, #1
	mov r3, #0xa
	bl DrawFrameAndWindow2
	b _0221FBC6
_0221FBBA:
	ldr r2, _0221FC00 ; =0x000003F7
	add r0, r5, #0
	mov r1, #1
	mov r3, #0xb
	bl DrawFrameAndWindow1
_0221FBC6:
	add r0, r5, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221FC04 ; =0x0001020F
	add r1, r4, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r2, r6, #0
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r4, r0, #0
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add r0, r6, #0
	bl String_dtor
	add r0, r4, #0
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0221FBFC: .word 0x000003D9
_0221FC00: .word 0x000003F7
_0221FC04: .word 0x0001020F
	thumb_func_end ov65_0221FB90

	thumb_func_start ov65_0221FC08
ov65_0221FC08: ; 0x0221FC08
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	add r0, sp, #0
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #6
	lsl r0, r0, #6
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	str r4, [sp]
	mov r0, #0x1a
	add r2, sp, #0
	strb r0, [r2, #0x10]
	mov r1, #0xa
	strb r1, [r2, #0x11]
	ldrb r3, [r2, #0x12]
	mov r1, #0xf
	bic r3, r1
	strb r3, [r2, #0x12]
	ldrb r3, [r2, #0x12]
	mov r1, #0xf0
	bic r3, r1
	strb r3, [r2, #0x12]
	bl sub_0201660C
	add r1, sp, #0
	add r4, r0, #0
	bl sub_020166FC
	add r0, r4, #0
	add sp, #0x14
	pop {r3, r4, pc}
	thumb_func_end ov65_0221FC08

	thumb_func_start ov65_0221FC54
ov65_0221FC54: ; 0x0221FC54
	push {r4, r5, r6, lr}
	add r5, r2, #0
	ldr r1, [r5]
	mov r6, #0
	add r4, r3, #0
	mvn r6, r6
	cmp r1, #0
	beq _0221FC6A
	cmp r1, #1
	beq _0221FC82
	b _0221FC9A
_0221FC6A:
	bl ov65_0221FC08
	str r0, [r4]
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _0221FC7A
	bl ov65_0221F890
_0221FC7A:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0221FC9A
_0221FC82:
	ldr r0, [r4]
	bl sub_020168F4
	add r6, r0, #0
	beq _0221FC9A
	ldr r0, [r4]
	bl sub_02016624
	bl ov65_0221F8B4
	mov r0, #0
	str r0, [r5]
_0221FC9A:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov65_0221FC54

	thumb_func_start ov65_0221FCA0
ov65_0221FCA0: ; 0x0221FCA0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	add r5, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0xc
	str r0, [sp, #4]
	mov r0, #0xa
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	ldr r0, _0221FD10 ; =0x0000034D
	add r4, r2, #0
	add r6, r1, #0
	str r0, [sp, #0x10]
	add r0, r3, #0
	add r1, r4, #0
	mov r2, #0
	mov r3, #0x13
	bl AddWindowParameterized
	ldr r2, _0221FD14 ; =0x000003F7
	add r0, r4, #0
	mov r1, #0
	mov r3, #0xb
	bl DrawFrameAndWindow1
	ldr r3, _0221FD18 ; =ov65_022200EC
	add r2, sp, #0x14
	add r7, r2, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	add r1, r6, #1
	add r0, sp, #0x14
	strh r1, [r0, #0x10]
	mov r1, #5
	strh r1, [r0, #0x12]
	ldr r0, _0221FD1C ; =ov65_0221FD20
	mov r1, #0
	str r0, [sp, #0x18]
	add r0, r7, #0
	add r2, r1, #0
	mov r3, #0x1a
	str r5, [sp, #0x14]
	str r4, [sp, #0x20]
	bl ListMenuInit
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_0221FD10: .word 0x0000034D
_0221FD14: .word 0x000003F7
_0221FD18: .word ov65_022200EC
_0221FD1C: .word ov65_0221FD20
	thumb_func_end ov65_0221FCA0

	thumb_func_start ov65_0221FD20
ov65_0221FD20: ; 0x0221FD20
	push {r3, lr}
	cmp r2, #0
	bne _0221FD2C
	ldr r0, _0221FD30 ; =0x000005DC
	bl PlaySE
_0221FD2C:
	pop {r3, pc}
	nop
_0221FD30: .word 0x000005DC
	thumb_func_end ov65_0221FD20

	.rodata

_0221FD34:
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x00, 0x00, 0x00

ov65_0221FD3C: ; 0x0221FD3C
	.byte 0x02, 0x00, 0x00, 0x0C
	.byte 0x00, 0x00, 0x80, 0x01, 0xCE, 0x01, 0x4E, 0x00

ov65_0221FD48: ; 0x0221FD48
	.byte 0x14, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00

ov65_0221FD58: ; 0x0221FD58
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov65_0221FD68: ; 0x0221FD68
	.byte 0x00, 0x00, 0x00, 0x00

ov65_0221FD6C: ; 0x0221FD6C
	.byte 0x01, 0x00, 0x00, 0x00

ov65_0221FD70: ; 0x0221FD70
	.byte 0x02, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00

ov65_0221FD80: ; 0x0221FD80
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov65_0221FD9C: ; 0x0221FD9C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov65_0221FDB8: ; 0x0221FDB8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x02, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov65_0221FDD4: ; 0x0221FDD4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1B, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov65_0221FDF0: ; 0x0221FDF0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov65_0221FE0C: ; 0x0221FE0C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x04
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov65_0221FE28: ; 0x0221FE28
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x04, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov65_0221FE44: ; 0x0221FE44
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov65_0221FE6C: ; 0x0221FE6C
	.byte 0x20, 0x47, 0x00, 0x3F
	.byte 0x20, 0x47, 0x40, 0x7F, 0x48, 0x6F, 0x00, 0x3F, 0x48, 0x6F, 0x40, 0x7F, 0x70, 0x97, 0x00, 0x3F
	.byte 0x70, 0x97, 0x40, 0x7F, 0x20, 0x47, 0x80, 0xBF, 0x20, 0x47, 0xC0, 0xFF, 0x48, 0x6F, 0x80, 0xBF
	.byte 0x48, 0x6F, 0xC0, 0xFF, 0x70, 0x97, 0x80, 0xBF, 0x70, 0x97, 0xC0, 0xFF, 0xA0, 0xC0, 0xC8, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00

ov65_0221FEA4: ; 0x0221FEA4
	.byte 0x3F, 0x00, 0x00, 0x00

ov65_0221FEA8: ; 0x0221FEA8
	.byte 0x58, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xC0, 0x00, 0x00, 0x00, 0x58, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x63, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0xE3, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00

ov65_0221FEEC: ; 0x0221FEEC
	.byte 0x31, 0x00, 0x00, 0x00
	.byte 0x33, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x00, 0x31, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00
	.byte 0x32, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x00
	.byte 0x33, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x00, 0x34, 0x00, 0x00, 0x00
	.byte 0x34, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x00, 0x31, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x00
	.byte 0x36, 0x00, 0x00, 0x00, 0x37, 0x00, 0x00, 0x00, 0x38, 0x00, 0x00, 0x00, 0x39, 0x00, 0x00, 0x00
	.byte 0x3A, 0x00, 0x00, 0x00, 0x3B, 0x00, 0x00, 0x00, 0x3C, 0x00, 0x00, 0x00

ov65_0221FF4C: ; 0x0221FF4C
	.byte 0x00, 0x00, 0x00, 0x00

ov65_0221FF50: ; 0x0221FF50
	.byte 0x20, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x48, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x48, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x70, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x70, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x48, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x48, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x70, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x70, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00
	.byte 0xA0, 0x00, 0x00, 0x00

ov65_0221FFB4: ; 0x0221FFB4
	.byte 0x04, 0x02, 0x0C, 0x0C, 0x00, 0x00, 0x02, 0x04, 0x0C, 0x0C, 0x00, 0x00
	.byte 0x07, 0x06, 0x01, 0x00, 0x00, 0x00, 0x01, 0x06, 0x07, 0x00, 0x00, 0x00, 0x05, 0x03, 0x0C, 0x0C
	.byte 0x00, 0x00, 0x03, 0x05, 0x0C, 0x0C, 0x00, 0x00, 0x00, 0x07, 0x06, 0x01, 0x00, 0x00, 0x06, 0x07
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x09, 0x08, 0x07, 0x06, 0x00, 0x00, 0x03, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01
	.byte 0x00, 0x00, 0x05, 0x01, 0x01, 0x01, 0x00, 0x00, 0x02, 0x09, 0x08, 0x07, 0x00, 0x00, 0x08, 0x09
	.byte 0x06, 0x06, 0x00, 0x00, 0x02, 0x02, 0x02, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0B, 0x0A, 0x09, 0x08, 0x07, 0x06, 0x05, 0x03, 0x01, 0x00, 0x00, 0x00, 0x03, 0x03, 0x03, 0x03
	.byte 0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x04, 0x04, 0x04, 0x04, 0x00, 0x00, 0x0A, 0x08
	.byte 0x06, 0x00, 0x00, 0x00, 0x0A, 0x08, 0x0C, 0x00, 0x00, 0x00, 0x08, 0x0A, 0x0C, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x09, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x06, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x02, 0x01, 0x00, 0x00, 0x00, 0x09, 0x07, 0x00, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x0B, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x05, 0x04, 0x03, 0x02, 0x01, 0x00, 0x0B, 0x09, 0x07, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x0B, 0x09, 0x07, 0x06, 0x00, 0x00, 0x07, 0x06, 0x00, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00

ov65_022200EC: ; 0x022200EC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x20, 0x00
	.byte 0x00, 0x08, 0x00, 0x10, 0x2F, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00

ov65_0222010C: ; 0x0222010C
	.byte 0x00, 0x00, 0x07, 0x00
	.byte 0x08, 0x00, 0x07, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x08, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x11, 0x00
	.byte 0x08, 0x00, 0x11, 0x00, 0x10, 0x00, 0x07, 0x00, 0x18, 0x00, 0x07, 0x00, 0x10, 0x00, 0x0C, 0x00
	.byte 0x18, 0x00, 0x0C, 0x00, 0x10, 0x00, 0x11, 0x00, 0x18, 0x00, 0x11, 0x00, 0x04, 0x00, 0x08, 0x00
	.byte 0x14, 0x00, 0x08, 0x00

ov65_02220144: ; 0x02220144
	.byte 0x04, 0x00, 0x01, 0x00, 0x09, 0x00, 0x02, 0x00, 0x01, 0x00, 0x14, 0x00
	.byte 0x01, 0x00, 0x09, 0x00, 0x02, 0x00, 0x13, 0x00, 0x04, 0x00, 0x03, 0x00, 0x08, 0x00, 0x02, 0x00
	.byte 0x25, 0x00, 0x14, 0x00, 0x03, 0x00, 0x08, 0x00, 0x02, 0x00, 0x35, 0x00, 0x02, 0x00, 0x13, 0x00
	.byte 0x07, 0x00, 0x02, 0x00, 0x45, 0x00, 0x12, 0x00, 0x13, 0x00, 0x07, 0x00, 0x02, 0x00, 0x53, 0x00
	.byte 0x02, 0x00, 0x15, 0x00, 0x0C, 0x00, 0x02, 0x00, 0x61, 0x00, 0x12, 0x00, 0x15, 0x00, 0x0C, 0x00
	.byte 0x02, 0x00, 0x79, 0x00
	; 0x02220194
