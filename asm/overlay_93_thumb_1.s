	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov93_0225C540
ov93_0225C540: ; 0x0225C540
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl OverlayManager_GetParentWork
	add r5, r0, #0
	mov r0, #3
	mov r1, #0x75
	lsl r2, r0, #0x11
	bl CreateHeap
	add r0, r4, #0
	mov r1, #0x40
	mov r2, #0x75
	bl OverlayManager_CreateAndGetData
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x40
	bl MI_CpuFill8
	add r0, r4, #0
	add r1, r5, #0
	bl ov93_0225C6D8
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov93_0225C540

	thumb_func_start ov93_0225C574
ov93_0225C574: ; 0x0225C574
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r4, r1, #0
	bl OverlayManager_GetData
	add r5, r0, #0
	add r0, r6, #0
	bl OverlayManager_GetParentWork
	add r6, r0, #0
	add r0, r5, #0
	bl ov93_0225C730
	cmp r0, #1
	bne _0225C596
	mov r0, #1
	pop {r4, r5, r6, pc}
_0225C596:
	ldr r0, [r4]
	cmp r0, #8
	bls _0225C59E
	b _0225C6B0
_0225C59E:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225C5AA: ; jump table
	.short _0225C5BC - _0225C5AA - 2 ; case 0
	.short _0225C5D8 - _0225C5AA - 2 ; case 1
	.short _0225C5F4 - _0225C5AA - 2 ; case 2
	.short _0225C610 - _0225C5AA - 2 ; case 3
	.short _0225C62C - _0225C5AA - 2 ; case 4
	.short _0225C654 - _0225C5AA - 2 ; case 5
	.short _0225C67A - _0225C5AA - 2 ; case 6
	.short _0225C690 - _0225C5AA - 2 ; case 7
	.short _0225C6B0 - _0225C5AA - 2 ; case 8
_0225C5BC:
	add r0, r5, #0
	mov r1, #0
	add r0, #0x31
	strb r1, [r0]
	ldr r0, _0225C6B8 ; =ov93_02262A08
	add r1, r5, #0
	mov r2, #0x75
	bl OverlayManager_new
	str r0, [r5, #0x28]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0225C6B4
_0225C5D8:
	ldr r0, [r5, #0x28]
	bl OverlayManager_run
	cmp r0, #1
	bne _0225C6B4
	ldr r0, [r5, #0x28]
	bl OverlayManager_delete
	mov r0, #0
	str r0, [r5, #0x28]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0225C6B4
_0225C5F4:
	add r0, r5, #0
	mov r1, #1
	add r0, #0x31
	strb r1, [r0]
	ldr r0, _0225C6BC ; =_022629F8
	add r1, r5, #0
	mov r2, #0x75
	bl OverlayManager_new
	str r0, [r5, #0x28]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0225C6B4
_0225C610:
	ldr r0, [r5, #0x28]
	bl OverlayManager_run
	cmp r0, #1
	bne _0225C6B4
	ldr r0, [r5, #0x28]
	bl OverlayManager_delete
	mov r0, #0
	str r0, [r5, #0x28]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0225C6B4
_0225C62C:
	add r6, #0x38
	ldrb r0, [r6]
	cmp r0, #0
	beq _0225C638
	bl ov00_021E6A4C
_0225C638:
	add r0, r5, #0
	mov r1, #2
	add r0, #0x31
	strb r1, [r0]
	ldr r0, _0225C6B8 ; =ov93_02262A08
	add r1, r5, #0
	mov r2, #0x75
	bl OverlayManager_new
	str r0, [r5, #0x28]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0225C6B4
_0225C654:
	ldr r0, [r5, #0x28]
	bl OverlayManager_run
	cmp r0, #1
	bne _0225C6B4
	ldr r0, [r5, #0x28]
	bl OverlayManager_delete
	mov r1, #0
	str r1, [r5, #0x28]
	ldr r0, [r5, #0x38]
	cmp r0, #1
	bne _0225C672
	str r1, [r4]
	b _0225C6B4
_0225C672:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0225C6B4
_0225C67A:
	mov r0, #0
	mov r1, #1
	bl sub_020398D4
	mov r0, #0xde
	bl sub_02037AC0
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0225C6B4
_0225C690:
	mov r0, #0xde
	bl sub_02037B38
	cmp r0, #1
	beq _0225C6A8
	bl sub_02037454
	add r5, r0, #0
	bl sub_020347A0
	cmp r5, r0
	bge _0225C6B4
_0225C6A8:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0225C6B4
_0225C6B0:
	mov r0, #1
	pop {r4, r5, r6, pc}
_0225C6B4:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0225C6B8: .word ov93_02262A08
_0225C6BC: .word _022629F8
	thumb_func_end ov93_0225C574

	thumb_func_start ov93_0225C6C0
ov93_0225C6C0: ; 0x0225C6C0
	push {r4, lr}
	add r4, r0, #0
	bl OverlayManager_GetData
	add r0, r4, #0
	bl OverlayManager_FreeData
	mov r0, #0x75
	bl DestroyHeap
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov93_0225C6C0

	thumb_func_start ov93_0225C6D8
ov93_0225C6D8: ; 0x0225C6D8
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r7, r1, #0
	bl sub_0203769C
	mov r5, #0
	add r4, r5, #0
_0225C6E6:
	add r0, r4, #0
	bl sub_02034818
	cmp r0, #0
	beq _0225C6FA
	add r0, r6, r5
	add r0, #0x2c
	strb r4, [r0]
	add r5, r5, #1
	b _0225C702
_0225C6FA:
	add r1, r6, r4
	add r1, #0x2c
	mov r0, #0xff
	strb r0, [r1]
_0225C702:
	add r4, r4, #1
	cmp r4, #4
	blt _0225C6E6
	add r0, r6, #0
	add r0, #0x30
	strb r5, [r0]
	add r0, r7, #0
	add r0, #0x38
	ldrb r1, [r0]
	add r0, r6, #0
	add r0, #0x3c
	strb r1, [r0]
	str r7, [sp]
	add r1, r7, #0
	add r1, #0x39
	ldr r2, [r7, #0x34]
	add r7, #0x38
	ldrb r1, [r1]
	ldrb r3, [r7]
	add r0, r6, #0
	bl ov90_02258800
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov93_0225C6D8

	thumb_func_start ov93_0225C730
ov93_0225C730: ; 0x0225C730
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #0
	bne _0225C74E
	bl ov90_02258B54
	cmp r0, #1
	bne _0225C74E
	add r0, r4, #0
	mov r1, #1
	add r0, #0x3d
	strb r1, [r0]
_0225C74E:
	add r0, r4, #0
	add r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #1
	bne _0225C762
	ldr r0, [r4, #0x28]
	cmp r0, #0
	bne _0225C762
	mov r0, #1
	pop {r4, pc}
_0225C762:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov93_0225C730

	thumb_func_start ov93_0225C768
ov93_0225C768: ; 0x0225C768
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r0, #1
	lsl r0, r0, #0x1a
	ldr r1, [r0]
	ldr r2, _0225CA54 ; =0xFFFFE0FF
	and r1, r2
	str r1, [r0]
	ldr r1, _0225CA58 ; =0x04001000
	ldr r3, [r1]
	and r2, r3
	str r2, [r1]
	ldr r3, [r0]
	ldr r2, _0225CA5C ; =0xFFFF1FFF
	and r3, r2
	str r3, [r0]
	ldr r3, [r1]
	add r0, #0x50
	and r2, r3
	str r2, [r1]
	mov r3, #0x10
	mov r1, #1
	mov r2, #0x3f
	str r3, [sp]
	bl G2x_SetBlendAlpha_
	mov r0, #3
	str r0, [sp]
	ldr r0, _0225CA60 ; =0x04001050
	mov r1, #8
	mov r2, #0x1f
	mov r3, #0xd
	bl G2x_SetBlendAlpha_
	ldr r1, _0225CA64 ; =0x00003850
	add r0, r4, #0
	mov r2, #0x75
	bl OverlayManager_CreateAndGetData
	ldr r2, _0225CA64 ; =0x00003850
	add r5, r0, #0
	mov r1, #0
	bl MI_CpuFill8
	add r0, r5, #0
	add r0, #0xa8
	mov r1, #0x75
	mov r2, #0x20
	bl GF_ExpHeap_FndInitAllocator
	mov r0, #0x75
	bl ov93_0225CF14
	add r1, r5, #0
	add r1, #0x98
	str r0, [r1]
	add r0, r4, #0
	bl OverlayManager_GetParentWork
	str r0, [r5]
	add r0, r5, #0
	bl ov93_022626FC
	mov r0, #0x75
	bl sub_020030E8
	add r1, r5, #0
	add r1, #0x8c
	str r0, [r1]
	add r0, r5, #0
	add r0, #0x8c
	ldr r0, [r0]
	mov r1, #1
	bl sub_02003B50
	add r0, r5, #0
	add r0, #0x8c
	mov r2, #2
	ldr r0, [r0]
	mov r1, #0
	lsl r2, r2, #8
	mov r3, #0x75
	bl PaletteData_AllocBuffers
	add r0, r5, #0
	add r0, #0x8c
	mov r1, #1
	ldr r0, [r0]
	lsl r2, r1, #9
	mov r3, #0x75
	bl PaletteData_AllocBuffers
	add r0, r5, #0
	add r0, #0x8c
	mov r2, #7
	ldr r0, [r0]
	mov r1, #2
	lsl r2, r2, #6
	mov r3, #0x75
	bl PaletteData_AllocBuffers
	add r0, r5, #0
	add r0, #0x8c
	mov r2, #2
	ldr r0, [r0]
	mov r1, #3
	lsl r2, r2, #8
	mov r3, #0x75
	bl PaletteData_AllocBuffers
	mov r0, #0x75
	bl BgConfig_Alloc
	str r0, [r5, #0x2c]
	mov r0, #0x40
	mov r1, #0x75
	bl GF_CreateVramTransferManager
	mov r0, #4
	mov r1, #8
	bl SetKeyRepeatTimers
	ldr r0, [r5, #0x2c]
	bl ov93_0225D1D8
	bl sub_020210BC
	mov r0, #4
	bl sub_02021148
	add r0, r5, #0
	bl ov93_0225CFC0
	mov r0, #0x75
	bl sub_0200CF18
	ldr r1, _0225CA68 ; =ov93_02262AA8
	ldr r2, _0225CA6C ; =ov93_02262A7C
	mov r3, #0x20
	str r0, [r5, #0x24]
	bl sub_0200CF70
	ldr r1, _0225CA70 ; =0x00100010
	mov r0, #1
	bl sub_02009FE8
	mov r0, #1
	bl sub_0200A080
	ldr r0, [r5, #0x24]
	bl sub_0200CF38
	str r0, [r5, #0x28]
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	mov r2, #0xe0
	bl sub_0200CFF4
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	ldr r2, _0225CA74 ; =ov93_02262A90
	bl sub_0200D3F8
	ldr r0, [r5, #0x24]
	bl sub_0200CF6C
	mov r2, #0x16
	mov r1, #0
	lsl r2, r2, #0x10
	bl G2dRenderer_SetSubSurfaceCoords
	add r0, r5, #0
	bl ov93_0225D674
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xc
	mov r3, #0x75
	bl NewMsgDataFromNarc
	add r1, r5, #0
	add r1, #0x80
	str r0, [r1]
	mov r0, #0x75
	bl ScrStrBufs_new
	add r1, r5, #0
	add r1, #0x84
	str r0, [r1]
	mov r0, #5
	lsl r0, r0, #6
	mov r1, #0x75
	bl String_ctor
	add r1, r5, #0
	add r1, #0x88
	str r0, [r1]
	mov r0, #0x13
	mov r1, #0x75
	bl sub_02013534
	add r1, r5, #0
	add r1, #0x90
	str r0, [r1]
	ldr r1, _0225CA78 ; =0x00001468
	add r0, r5, #0
	add r1, r5, r1
	bl ov93_02261310
	mov r0, #0xc9
	mov r1, #0x75
	bl NARC_ctor
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov93_0225DB2C
	add r0, r5, #0
	add r1, r4, #0
	bl ov93_0225DBC8
	add r0, r5, #0
	bl ov93_0225D380
	add r0, r5, #0
	add r1, r4, #0
	bl ov93_0225D78C
	add r0, r5, #0
	add r1, r4, #0
	bl ov93_0225DA40
	add r0, r5, #0
	add r1, r4, #0
	bl ov93_0225DD2C
	add r0, r4, #0
	bl NARC_dtor
	mov r0, #0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xe0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x8c
	ldr r0, [r0]
	mov r1, #0x10
	mov r2, #7
	mov r3, #0x75
	bl PaletteData_LoadNarc
	mov r0, #1
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x50
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x8c
	ldr r0, [r0]
	mov r1, #0x10
	mov r2, #7
	mov r3, #0x75
	bl PaletteData_LoadNarc
	add r0, r5, #0
	bl ov93_0225D4EC
	add r0, r5, #0
	mov r1, #0
	bl ov93_0225D5AC
	add r0, r5, #0
	bl ov93_0225D468
	bl sub_0203A880
	add r0, r5, #0
	bl ov93_0225E7B0
	add r1, r5, #0
	add r1, #0xd4
	str r0, [r1]
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x75
	str r0, [sp, #8]
	mov r0, #0
	mov r1, #0x1b
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, _0225CA7C ; =ov93_0225D07C
	ldr r2, _0225CA80 ; =0x0000EA60
	add r1, r5, #0
	bl CreateSysTask
	add r1, r5, #0
	add r1, #0x94
	str r0, [r1]
	ldr r0, _0225CA84 ; =gSystem + 0x60
	mov r1, #1
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	bl GX_BothDispOn
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #1
	bl sub_02002B50
	mov r0, #0
	bl TextFlags_SetCanABSpeedUpPrint
	mov r0, #0
	bl sub_02002B8C
	ldr r0, [r5, #0x28]
	bl sub_0200E2B0
	mov r1, #0x75
	bl ov90_02258BD4
	str r0, [r5, #0x1c]
	bl ov90_02258C74
	add r2, r0, #0
	add r0, r5, #0
	add r0, #0x8c
	lsl r2, r2, #0x14
	ldr r0, [r0]
	mov r1, #2
	lsr r2, r2, #0x10
	mov r3, #0x60
	bl sub_020032A4
	ldr r0, _0225CA88 ; =ov93_0225CEA0
	add r1, r5, #0
	bl Main_SetVBlankIntrCB
	ldr r0, [r5]
	add r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #0
	beq _0225CA4C
	mov r0, #0x75
	bl ov00_021E69A8
_0225CA4C:
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_0225CA54: .word 0xFFFFE0FF
_0225CA58: .word 0x04001000
_0225CA5C: .word 0xFFFF1FFF
_0225CA60: .word 0x04001050
_0225CA64: .word 0x00003850
_0225CA68: .word ov93_02262AA8
_0225CA6C: .word ov93_02262A7C
_0225CA70: .word 0x00100010
_0225CA74: .word ov93_02262A90
_0225CA78: .word 0x00001468
_0225CA7C: .word ov93_0225D07C
_0225CA80: .word 0x0000EA60
_0225CA84: .word gSystem + 0x60
_0225CA88: .word ov93_0225CEA0
	thumb_func_end ov93_0225C768

	thumb_func_start ov93_0225CA8C
ov93_0225CA8C: ; 0x0225CA8C
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r1, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	ldr r1, [r4]
	add r2, r1, #0
	add r2, #0x3d
	ldrb r2, [r2]
	cmp r2, #1
	bne _0225CAF6
	add r0, r1, #0
	add r0, #0x3e
	ldrb r0, [r0]
	cmp r0, #0
	beq _0225CAB2
	cmp r0, #1
	b _0225CAE0
_0225CAB2:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0225CABE
	bl sub_0200FB70
_0225CABE:
	mov r0, #0
	bl sub_0200FC20
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _0225CCE0 ; =0xFFFF1FFF
	and r0, r1
	str r0, [r2]
	ldr r1, [r4]
	add r0, r1, #0
	add r0, #0x3e
	ldrb r0, [r0]
	add r1, #0x3e
	add r0, r0, #1
	strb r0, [r1]
	b _0225CAF0
_0225CAE0:
	add r0, r1, #0
	bl ov90_02258B98
	cmp r0, #1
	bne _0225CAF0
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_0225CAF0:
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, pc}
_0225CAF6:
	ldr r2, [r5]
	cmp r2, #6
	bhi _0225CB60
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0225CB08: ; jump table
	.short _0225CB16 - _0225CB08 - 2 ; case 0
	.short _0225CB26 - _0225CB08 - 2 ; case 1
	.short _0225CB34 - _0225CB08 - 2 ; case 2
	.short _0225CB46 - _0225CB08 - 2 ; case 3
	.short _0225CB56 - _0225CB08 - 2 ; case 4
	.short _0225CB6E - _0225CB08 - 2 ; case 5
	.short _0225CCBA - _0225CB08 - 2 ; case 6
_0225CB16:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0225CB60
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225CCC8
_0225CB26:
	mov r0, #0xd3
	bl sub_02037AC0
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225CCC8
_0225CB34:
	mov r0, #0xd3
	bl sub_02037B38
	cmp r0, #1
	bne _0225CB60
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225CCC8
_0225CB46:
	bl ov93_022627A4
	cmp r0, #1
	bne _0225CB60
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225CCC8
_0225CB56:
	add r1, #0x30
	ldrb r1, [r1]
	ldr r2, [r4, #8]
	cmp r2, r1
	bhs _0225CB62
_0225CB60:
	b _0225CCC8
_0225CB62:
	bl ov93_0225E10C
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225CCC8
_0225CB6E:
	mov r1, #0xbf
	lsl r1, r1, #6
	ldr r1, [r4, r1]
	cmp r1, #1
	bne _0225CB9A
	bl ov93_02262250
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x75
	str r0, [sp, #8]
	mov r0, #0
	mov r1, #0x1a
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
_0225CB9A:
	add r0, r4, #0
	bl ov93_0225E764
	ldr r0, [r4, #0x20]
	cmp r0, #7
	bhi _0225CC78
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225CBB2: ; jump table
	.short _0225CC78 - _0225CBB2 - 2 ; case 0
	.short _0225CBC2 - _0225CBB2 - 2 ; case 1
	.short _0225CC0E - _0225CBB2 - 2 ; case 2
	.short _0225CC28 - _0225CBB2 - 2 ; case 3
	.short _0225CC34 - _0225CBB2 - 2 ; case 4
	.short _0225CC78 - _0225CBB2 - 2 ; case 5
	.short _0225CC5E - _0225CBB2 - 2 ; case 6
	.short _0225CC6A - _0225CBB2 - 2 ; case 7
_0225CBC2:
	mov r0, #1
	lsl r0, r0, #0x1a
	ldr r2, [r0]
	ldr r1, _0225CCE0 ; =0xFFFF1FFF
	add r3, r0, #0
	and r2, r1
	lsr r1, r0, #0xc
	orr r1, r2
	str r1, [r0]
	add r1, r0, #0
	ldr r2, _0225CCE4 ; =0x0000044C
	add r1, #0x42
	strh r2, [r1]
	add r1, r0, #0
	ldr r2, _0225CCE8 ; =0x0000A8B8
	add r1, #0x46
	strh r2, [r1]
	add r3, #0x48
	ldrh r2, [r3]
	ldr r1, _0225CCEC ; =0xFFFFC0FF
	and r2, r1
	lsr r1, r0, #0xe
	orr r1, r2
	strh r1, [r3]
	add r0, #0x4a
	ldrh r2, [r0]
	mov r1, #0x3f
	bic r2, r1
	mov r1, #0x1f
	orr r2, r1
	mov r1, #0x20
	orr r1, r2
	strh r1, [r0]
	add r0, r4, #0
	bl ov93_02262310
	mov r0, #2
	str r0, [r4, #0x20]
_0225CC0E:
	ldr r1, _0225CCF0 ; =0x0000174C
	add r0, r4, #0
	add r1, r4, r1
	bl ov93_02262374
	cmp r0, #1
	bne _0225CC78
	ldr r0, _0225CCF4 ; =0x00001768
	mov r1, #1
	str r1, [r4, r0]
	mov r0, #0
	str r0, [r4, #0x20]
	b _0225CC78
_0225CC28:
	ldr r0, [r4, #0x1c]
	bl ov90_02258C8C
	mov r0, #4
	str r0, [r4, #0x20]
	b _0225CC78
_0225CC34:
	ldr r0, [r4, #0x1c]
	bl ov90_02258CE0
	cmp r0, #1
	bne _0225CC78
	ldr r0, _0225CCF8 ; =0x00002FB8
	mov r1, #1
	str r1, [r4, r0]
	ldr r0, _0225CCFC ; =0x00001559
	mov r1, #0
	strb r1, [r4, r0]
	mov r0, #5
	str r0, [r4, #0x20]
	add r0, r4, #0
	bl ov93_0225D4B8
	add r0, r4, #0
	mov r1, #1
	bl ov93_0225D5AC
	b _0225CC78
_0225CC5E:
	ldr r0, [r4, #0x1c]
	bl ov90_02258CB0
	mov r0, #7
	str r0, [r4, #0x20]
	b _0225CC78
_0225CC6A:
	ldr r0, [r4, #0x1c]
	bl ov90_02258CE0
	cmp r0, #1
	bne _0225CC78
	mov r0, #8
	str r0, [r4, #0x20]
_0225CC78:
	add r0, r4, #0
	bl ov93_0225E4B0
	add r0, r4, #0
	bl ov93_0225E370
	ldr r0, _0225CD00 ; =0x00002FBC
	ldr r0, [r4, r0]
	cmp r0, #1
	beq _0225CCC8
	add r0, r4, #0
	bl ov93_0225E300
	cmp r0, #1
	bne _0225CC9C
	ldr r0, _0225CD04 ; =0x00002FC4
	mov r1, #0xd
	str r1, [r4, r0]
_0225CC9C:
	ldr r1, _0225CCF8 ; =0x00002FB8
	ldr r0, [r4, r1]
	cmp r0, #1
	bne _0225CCC8
	sub r0, r1, #4
	ldr r2, [r4, r0]
	ldr r0, _0225CD08 ; =0x00000516
	cmp r2, r0
	bhi _0225CCC8
	sub r0, r1, #4
	ldr r0, [r4, r0]
	add r2, r0, #1
	sub r0, r1, #4
	str r2, [r4, r0]
	b _0225CCC8
_0225CCBA:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0225CCC8
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_0225CCC8:
	add r0, r4, #0
	add r0, #0x9c
	ldr r0, [r0]
	bl ov93_0225E7AC
	ldr r0, _0225CD0C ; =0x0000384C
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_0225CCE0: .word 0xFFFF1FFF
_0225CCE4: .word 0x0000044C
_0225CCE8: .word 0x0000A8B8
_0225CCEC: .word 0xFFFFC0FF
_0225CCF0: .word 0x0000174C
_0225CCF4: .word 0x00001768
_0225CCF8: .word 0x00002FB8
_0225CCFC: .word 0x00001559
_0225CD00: .word 0x00002FBC
_0225CD04: .word 0x00002FC4
_0225CD08: .word 0x00000516
_0225CD0C: .word 0x0000384C
	thumb_func_end ov93_0225CA8C

	thumb_func_start ov93_0225CD10
ov93_0225CD10: ; 0x0225CD10
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	ldr r0, _0225CE94 ; =0x00002FD0
	ldr r1, [r4, r0]
	ldr r0, [r4]
	str r1, [r0, #0x24]
	ldr r0, [r4, #0x1c]
	bl ov90_02258C38
	add r0, r4, #0
	bl ov93_022602E4
	add r0, r4, #0
	bl ov93_02260608
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	add r0, r4, #0
	bl ov93_0225D6E0
	add r0, r4, #0
	bl ov93_0225D9E8
	add r0, r4, #0
	bl ov93_0225DAF8
	add r0, r4, #0
	bl ov93_0225DBC4
	add r0, r4, #0
	bl ov93_0225DD28
	add r0, r4, #0
	bl ov93_0225DED0
	add r1, r4, #0
	add r1, #0xd4
	ldr r1, [r1]
	add r0, r4, #0
	bl ov93_0225E860
	add r5, r4, #0
	mov r6, #0
	add r5, #0x30
_0225CD72:
	add r0, r5, #0
	bl RemoveWindow
	add r6, r6, #1
	add r5, #0x10
	cmp r6, #5
	blt _0225CD72
	mov r0, #1
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #2
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, [r4, #0x2c]
	mov r1, #1
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x2c]
	mov r1, #2
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x2c]
	mov r1, #3
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x2c]
	mov r1, #4
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x2c]
	mov r1, #5
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x2c]
	mov r1, #6
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x2c]
	mov r1, #7
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	bl sub_020135AC
	ldr r0, [r4, #0x24]
	ldr r1, [r4, #0x28]
	bl sub_0200D998
	ldr r0, [r4, #0x24]
	bl sub_0200D108
	bl GF_DestroyVramTransferManager
	add r0, r4, #0
	add r0, #0x8c
	ldr r0, [r0]
	mov r1, #0
	bl PaletteData_FreeBuffers
	add r0, r4, #0
	add r0, #0x8c
	ldr r0, [r0]
	mov r1, #1
	bl PaletteData_FreeBuffers
	add r0, r4, #0
	add r0, #0x8c
	ldr r0, [r0]
	mov r1, #2
	bl PaletteData_FreeBuffers
	add r0, r4, #0
	add r0, #0x8c
	ldr r0, [r0]
	mov r1, #3
	bl PaletteData_FreeBuffers
	add r0, r4, #0
	add r0, #0x8c
	ldr r0, [r0]
	bl sub_02003104
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	bl String_dtor
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	bl ScrStrBufs_delete
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl DestroyMsgData
	ldr r0, [r4, #0x2c]
	bl FreeToHeap
	add r0, r4, #0
	bl ov93_0225D064
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	bl DestroySysTask
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _0225CE98 ; =0xFFFF1FFF
	and r1, r0
	str r1, [r2]
	ldr r2, _0225CE9C ; =0x04001000
	add r4, #0x98
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	ldr r0, [r4]
	bl ov93_0225CFB8
	bl sub_02021238
	add r0, r7, #0
	bl OverlayManager_FreeData
	mov r0, #0
	bl TextFlags_SetCanABSpeedUpPrint
	mov r0, #0
	bl sub_02002B50
	mov r0, #0
	bl sub_02002B8C
	bl sub_0203A914
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225CE94: .word 0x00002FD0
_0225CE98: .word 0xFFFF1FFF
_0225CE9C: .word 0x04001000
	thumb_func_end ov93_0225CD10

	thumb_func_start ov93_0225CEA0
ov93_0225CEA0: ; 0x0225CEA0
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0xd4
	ldr r1, [r1]
	bl ov93_0225EA50
	bl GF_RunVramTransferTasks
	bl sub_0200D034
	add r0, r4, #0
	add r0, #0x8c
	ldr r0, [r0]
	bl sub_0200398C
	ldr r0, _0225CF04 ; =0x00001454
	ldrb r1, [r4, r0]
	cmp r1, #1
	bne _0225CED8
	mov r0, #7
	mov r1, #1
	bl ToggleBgLayer
	ldr r0, _0225CF04 ; =0x00001454
	mov r1, #0
	strb r1, [r4, r0]
	b _0225CEEE
_0225CED8:
	add r0, r0, #1
	ldrb r0, [r4, r0]
	cmp r0, #1
	bne _0225CEEE
	mov r0, #7
	mov r1, #0
	bl ToggleBgLayer
	ldr r0, _0225CF08 ; =0x00001455
	mov r1, #0
	strb r1, [r4, r0]
_0225CEEE:
	ldr r0, [r4, #0x2c]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	ldr r3, _0225CF0C ; =0x027E0000
	ldr r1, _0225CF10 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_0225CF04: .word 0x00001454
_0225CF08: .word 0x00001455
_0225CF0C: .word 0x027E0000
_0225CF10: .word 0x00003FF8
	thumb_func_end ov93_0225CEA0

	thumb_func_start ov93_0225CF14
ov93_0225CF14: ; 0x0225CF14
	push {r3, lr}
	sub sp, #8
	mov r1, #2
	str r1, [sp]
	ldr r1, _0225CF30 ; =ov93_0225CF34
	mov r2, #1
	str r1, [sp, #4]
	mov r1, #0
	add r3, r1, #0
	bl GF_3DVramMan_Create
	add sp, #8
	pop {r3, pc}
	nop
_0225CF30: .word ov93_0225CF34
	thumb_func_end ov93_0225CF14

	thumb_func_start ov93_0225CF34
ov93_0225CF34: ; 0x0225CF34
	push {r3, lr}
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	ldr r0, _0225CFA0 ; =0x04000008
	mov r1, #3
	ldrh r2, [r0]
	bic r2, r1
	mov r1, #1
	orr r1, r2
	strh r1, [r0]
	add r0, #0x58
	ldrh r2, [r0]
	ldr r1, _0225CFA4 ; =0xFFFFCFFD
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
	ldr r2, _0225CFA8 ; =0x0000CFFB
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
	ldr r2, _0225CFAC ; =0x00007FFF
	add r1, r0, #0
	mov r3, #0x3f
	str r0, [sp]
	bl G3X_SetClearColor
	ldr r1, _0225CFB0 ; =0xBFFF0000
	ldr r0, _0225CFB4 ; =0x04000580
	str r1, [r0]
	pop {r3, pc}
	.balign 4, 0
_0225CFA0: .word 0x04000008
_0225CFA4: .word 0xFFFFCFFD
_0225CFA8: .word 0x0000CFFB
_0225CFAC: .word 0x00007FFF
_0225CFB0: .word 0xBFFF0000
_0225CFB4: .word 0x04000580
	thumb_func_end ov93_0225CF34

	thumb_func_start ov93_0225CFB8
ov93_0225CFB8: ; 0x0225CFB8
	ldr r3, _0225CFBC ; =GF_3DVramMan_Delete
	bx r3
	.balign 4, 0
_0225CFBC: .word GF_3DVramMan_Delete
	thumb_func_end ov93_0225CFB8

	thumb_func_start ov93_0225CFC0
ov93_0225CFC0: ; 0x0225CFC0
	push {r4, lr}
	sub sp, #0x18
	ldr r3, _0225D058 ; =ov93_02262A38
	add r4, r0, #0
	ldmia r3!, {r0, r1}
	add r2, sp, #0xc
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	mov r0, #0x75
	bl GF_Camera_Create
	add r1, r4, #0
	add r1, #0x9c
	str r0, [r1]
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x9c
	ldr r0, [r0]
	mov r1, #0x7b
	str r0, [sp, #8]
	ldr r2, _0225D05C ; =ov93_02262A18
	ldr r3, _0225D060 ; =0x00000FA4
	add r0, sp, #0xc
	lsl r1, r1, #0xc
	bl GF_Camera_InitFromTargetDistanceAndAngle
	add r2, r4, #0
	add r2, #0x9c
	mov r0, #1
	mov r1, #0xe1
	ldr r2, [r2]
	lsl r0, r0, #0xc
	lsl r1, r1, #0xe
	bl GF_Camera_SetClipBounds
	add r0, r4, #0
	add r0, #0x9c
	ldr r0, [r0]
	bl GF_Camera_RegisterToStaticPtr
	mov r0, #0x75
	bl GF_Camera_Create
	add r1, r4, #0
	add r1, #0xa0
	str r0, [r1]
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0xa0
	ldr r0, [r0]
	mov r1, #5
	str r0, [sp, #8]
	ldr r2, _0225D05C ; =ov93_02262A18
	ldr r3, _0225D060 ; =0x00000FA4
	add r0, sp, #0xc
	lsl r1, r1, #0x10
	bl GF_Camera_InitFromTargetDistanceAndAngle
	add r4, #0xa0
	mov r0, #1
	mov r1, #0xe1
	ldr r2, [r4]
	lsl r0, r0, #0xc
	lsl r1, r1, #0xe
	bl GF_Camera_SetClipBounds
	add sp, #0x18
	pop {r4, pc}
	nop
_0225D058: .word ov93_02262A38
_0225D05C: .word ov93_02262A18
_0225D060: .word 0x00000FA4
	thumb_func_end ov93_0225CFC0

	thumb_func_start ov93_0225D064
ov93_0225D064: ; 0x0225D064
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x9c
	ldr r0, [r0]
	bl sub_02023120
	add r4, #0xa0
	ldr r0, [r4]
	bl sub_02023120
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov93_0225D064

	thumb_func_start ov93_0225D07C
ov93_0225D07C: ; 0x0225D07C
	push {r4, lr}
	sub sp, #0x40
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [sp, #0x34]
	str r0, [sp, #0x38]
	str r0, [sp, #0x3c]
	mov r0, #0
	str r0, [sp, #0x28]
	str r0, [sp, #0x2c]
	str r0, [sp, #0x30]
	add r0, sp, #4
	add r4, r1, #0
	bl MTX_Identity33_
	ldr r1, _0225D1B0 ; =0x000015A8
	add r0, r4, #0
	add r1, r4, r1
	bl ov93_02262034
	ldr r1, _0225D1B4 ; =0x00001468
	add r0, r4, #0
	add r1, r4, r1
	bl ov93_02261354
	ldr r1, _0225D1B8 ; =0x00001560
	add r0, r4, #0
	add r1, r4, r1
	bl ov93_02261D1C
	add r0, r4, #0
	bl ov93_0225FFF8
	ldr r2, _0225D1BC ; =0x00001428
	ldr r1, [r4, #0x2c]
	add r0, r4, #0
	add r2, r4, r2
	bl ov93_0225FE80
	add r0, r4, #0
	bl ov93_02260660
	add r0, r4, #0
	bl ov93_0225E03C
	add r0, r4, #0
	bl ov93_02260A30
	bl sub_02026E48
	add r0, r4, #0
	add r0, #0x9c
	ldr r0, [r0]
	bl GF_Camera_RegisterToStaticPtr
	add r1, r4, #0
	add r1, #0x9c
	ldr r1, [r1]
	mov r0, #1
	bl sub_020233D8
	bl sub_02023154
	mov r0, #0
	ldr r2, _0225D1C0 ; =0xFFFFF000
	add r1, r0, #0
	add r3, r0, #0
	bl NNS_G3dGlbLightVector
	ldr r1, _0225D1C4 ; =0x0000739C
	mov r0, #0
	bl NNS_G3dGlbLightColor
	ldr r0, _0225D1C8 ; =0x00007FFF
	mov r2, #0
	add r1, r0, #0
	bl NNS_G3dGlbMaterialColorDiffAmb
	ldr r0, _0225D1C8 ; =0x00007FFF
	mov r2, #0
	add r1, r0, #0
	bl NNS_G3dGlbMaterialColorSpecEmi
	add r0, sp, #0x28
	bl NNS_G3dGlbSetBaseTrans
	ldr r1, _0225D1CC ; =NNS_G3dGlb + 0xBC
	add r0, sp, #4
	bl MI_Copy36B
	ldr r1, _0225D1D0 ; =NNS_G3dGlb + 0x80
	mov r0, #0xa4
	ldr r2, [r1, #0x7c]
	bic r2, r0
	add r0, sp, #0x34
	str r2, [r1, #0x7c]
	bl NNS_G3dGlbSetBaseScale
	bl NNS_G3dGlbFlushP
	add r1, r4, #0
	add r1, #0xd4
	ldr r1, [r1]
	add r0, r4, #0
	bl ov93_0225E898
	mov r1, #0
	mov r0, #0x11
	add r2, r1, #0
	bl NNS_G3dGeBufferOP_N
	ldr r0, _0225D1D4 ; =0x000013B0
	add r0, r4, r0
	bl sub_020181EC
	add r0, r4, #0
	add r0, #0xe8
	bl sub_020181EC
	add r0, r4, #0
	bl ov93_0225E0A4
	mov r2, #1
	mov r0, #0x12
	add r1, sp, #0
	str r2, [sp]
	bl NNS_G3dGeBufferOP_N
	bl sub_02026E48
	bl sub_0201543C
	cmp r0, #0
	ble _0225D18C
	bl sub_02026E48
_0225D18C:
	bl sub_02015460
	ldr r0, [r4, #0x28]
	bl sub_0200D020
	bl sub_0200D03C
	mov r0, #0
	add r1, r0, #0
	bl sub_02026E50
	ldr r1, [r4, #0x2c]
	mov r0, #0x75
	bl sub_020399FC
	add sp, #0x40
	pop {r4, pc}
	nop
_0225D1B0: .word 0x000015A8
_0225D1B4: .word 0x00001468
_0225D1B8: .word 0x00001560
_0225D1BC: .word 0x00001428
_0225D1C0: .word 0xFFFFF000
_0225D1C4: .word 0x0000739C
_0225D1C8: .word 0x00007FFF
_0225D1CC: .word NNS_G3dGlb + 0xBC
_0225D1D0: .word NNS_G3dGlb + 0x80
_0225D1D4: .word 0x000013B0
	thumb_func_end ov93_0225D07C

	thumb_func_start ov93_0225D1D8
ov93_0225D1D8: ; 0x0225D1D8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x8c
	add r5, r0, #0
	bl GX_DisableEngineALayers
	ldr r4, _0225D36C ; =ov93_02262AC8
	add r3, sp, #0x10
	mov r2, #5
_0225D1E8:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0225D1E8
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
	ldr r4, _0225D370 ; =ov93_02262A44
	add r3, sp, #0
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r4, _0225D374 ; =ov93_02262B40
	add r3, sp, #0x38
	mov r2, #0xa
_0225D248:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0225D248
	ldr r0, [r4]
	mov r1, #1
	str r0, [r3]
	add r0, r5, #0
	add r2, sp, #0x38
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r5, #0
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	mov r2, #0
	add r0, r5, #0
	mov r1, #1
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	add r0, r5, #0
	mov r1, #1
	mov r2, #3
	mov r3, #0
	bl BgSetPosTextAndCommit
	add r0, r5, #0
	mov r1, #2
	add r2, sp, #0x54
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r5, #0
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	mov r2, #0
	add r0, r5, #0
	mov r1, #2
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	add r0, r5, #0
	mov r1, #2
	mov r2, #3
	mov r3, #0
	bl BgSetPosTextAndCommit
	add r0, r5, #0
	mov r1, #3
	add r2, sp, #0x70
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r5, #0
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	mov r2, #0
	add r0, r5, #0
	mov r1, #3
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	mov r1, #3
	add r0, r5, #0
	add r2, r1, #0
	mov r3, #0
	bl BgSetPosTextAndCommit
	ldr r1, _0225D378 ; =0x04000008
	mov r0, #3
	ldrh r2, [r1]
	bic r2, r0
	mov r0, #2
	orr r0, r2
	strh r0, [r1]
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	mov r4, #0
	ldr r6, _0225D37C ; =ov93_02262B94
	add r7, r4, #0
_0225D2F4:
	cmp r4, #3
	bge _0225D30A
	add r1, r4, #4
	lsl r1, r1, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	add r2, r6, #0
	add r3, r7, #0
	bl InitBgFromTemplate
	b _0225D31A
_0225D30A:
	add r1, r4, #4
	lsl r1, r1, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	add r2, r6, #0
	mov r3, #1
	bl InitBgFromTemplate
_0225D31A:
	add r0, r4, #4
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x75
	bl BG_ClearCharDataRange
	add r1, r4, #4
	lsl r1, r1, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
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
	add r6, #0x1c
	cmp r4, #4
	blo _0225D2F4
	mov r0, #7
	mov r1, #0
	bl ToggleBgLayer
	add sp, #0x8c
	pop {r4, r5, r6, r7, pc}
	nop
_0225D36C: .word ov93_02262AC8
_0225D370: .word ov93_02262A44
_0225D374: .word ov93_02262B40
_0225D378: .word 0x04000008
_0225D37C: .word ov93_02262B94
	thumb_func_end ov93_0225D1D8

	thumb_func_start ov93_0225D380
ov93_0225D380: ; 0x0225D380
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x14
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	mov r0, #3
	lsl r0, r0, #8
	str r0, [sp, #0x10]
	add r1, r4, #0
	ldr r0, [r4, #0x2c]
	add r1, #0x30
	mov r2, #1
	mov r3, #0xb
	bl AddWindowParameterized
	mov r0, #1
	str r0, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #5
	str r0, [sp, #0xc]
	mov r0, #0xc5
	lsl r0, r0, #2
	str r0, [sp, #0x10]
	add r1, r4, #0
	ldr r0, [r4, #0x2c]
	add r1, #0x40
	mov r2, #4
	mov r3, #0x12
	bl AddWindowParameterized
	mov r0, #0xe
	str r0, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #5
	str r0, [sp, #0xc]
	mov r0, #0xca
	lsl r0, r0, #2
	str r0, [sp, #0x10]
	add r1, r4, #0
	ldr r0, [r4, #0x2c]
	add r1, #0x50
	mov r2, #4
	mov r3, #0x15
	bl AddWindowParameterized
	mov r0, #0xe
	str r0, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #5
	str r0, [sp, #0xc]
	mov r0, #0xcf
	lsl r0, r0, #2
	str r0, [sp, #0x10]
	add r1, r4, #0
	ldr r0, [r4, #0x2c]
	add r1, #0x60
	mov r2, #4
	mov r3, #1
	bl AddWindowParameterized
	add r0, r4, #0
	add r0, #0x40
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x50
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x60
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1c
	str r0, [sp, #4]
	mov r2, #4
	add r1, r4, #0
	str r2, [sp, #8]
	mov r0, #5
	str r0, [sp, #0xc]
	ldr r0, _0225D464 ; =0x00000359
	add r1, #0x70
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x2c]
	mov r3, #2
	bl AddWindowParameterized
	add r4, #0x70
	add r0, r4, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add sp, #0x14
	pop {r3, r4, pc}
	nop
_0225D464: .word 0x00000359
	thumb_func_end ov93_0225D380

	thumb_func_start ov93_0225D468
ov93_0225D468: ; 0x0225D468
	push {r3, r4, r5, lr}
	sub sp, #0x10
	mov r2, #0x35
	add r5, r0, #0
	add r0, #0x70
	mov r1, #1
	lsl r2, r2, #4
	mov r3, #6
	bl DrawFrameAndWindow1
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #3
	bl NewString_ReadMsgData
	mov r1, #0
	add r4, r0, #0
	str r1, [sp]
	ldr r0, _0225D4B4 ; =0x0001020F
	str r1, [sp, #4]
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x70
	add r2, r4, #0
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl String_dtor
	add r5, #0x70
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0225D4B4: .word 0x0001020F
	thumb_func_end ov93_0225D468

	thumb_func_start ov93_0225D4B8
ov93_0225D4B8: ; 0x0225D4B8
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0x12
	str r0, [sp]
	mov r0, #0x1e
	str r0, [sp, #4]
	mov r0, #6
	str r0, [sp, #8]
	mov r0, #0x11
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x2c]
	ldr r2, _0225D4E8 ; =0x000003FF
	mov r1, #4
	mov r3, #1
	bl FillBgTilemapRect
	ldr r0, [r4, #0x2c]
	mov r1, #4
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x10
	pop {r4, pc}
	nop
_0225D4E8: .word 0x000003FF
	thumb_func_end ov93_0225D4B8

	thumb_func_start ov93_0225D4EC
ov93_0225D4EC: ; 0x0225D4EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	bl sub_0203769C
	str r0, [sp, #0x10]
	add r0, r5, #0
	str r0, [sp, #0x18]
	add r0, #0x30
	mov r4, #0
	str r0, [sp, #0x18]
	b _0225D590
_0225D504:
	ldr r0, [r5]
	ldr r2, [sp, #0x10]
	add r1, r0, r4
	add r1, #0x2c
	ldrb r1, [r1]
	cmp r2, r1
	beq _0225D58E
	bl ov90_022588CC
	mov r1, #0x75
	bl PlayerProfile_GetPlayerName_NewString
	ldr r1, [r5]
	add r6, r0, #0
	add r1, r1, r4
	add r1, #0x2c
	ldrb r1, [r1]
	add r0, r5, #0
	bl ov93_0225E3C4
	str r0, [sp, #0x14]
	ldr r0, [r5]
	add r1, r0, r4
	add r1, #0x2c
	ldrb r1, [r1]
	bl ov90_022588A4
	cmp r0, #1
	bne _0225D542
	ldr r7, _0225D5A0 ; =0x0007080F
	b _0225D544
_0225D542:
	ldr r7, _0225D5A4 ; =0x0001020F
_0225D544:
	mov r0, #0
	add r1, r6, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	lsr r1, r0, #0x1f
	add r1, r0, r1
	asr r2, r1, #1
	mov r1, #0x28
	sub r3, r1, r2
	mov r1, #1
	tst r0, r1
	beq _0225D560
	sub r3, r3, #1
_0225D560:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r7, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r5]
	add r2, r6, #0
	add r0, #0x30
	ldrb r0, [r0]
	lsl r1, r0, #2
	ldr r0, _0225D5A8 ; =ov93_02262A68
	add r1, r0, r1
	ldr r0, [sp, #0x14]
	ldrb r0, [r0, r1]
	lsl r1, r0, #4
	ldr r0, [sp, #0x18]
	add r0, r0, r1
	mov r1, #0
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl FreeToHeap
_0225D58E:
	add r4, r4, #1
_0225D590:
	ldr r0, [r5]
	add r0, #0x30
	ldrb r0, [r0]
	cmp r4, r0
	blt _0225D504
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_0225D5A0: .word 0x0007080F
_0225D5A4: .word 0x0001020F
_0225D5A8: .word ov93_02262A68
	thumb_func_end ov93_0225D4EC

	thumb_func_start ov93_0225D5AC
ov93_0225D5AC: ; 0x0225D5AC
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	cmp r1, #1
	bne _0225D604
	mov r0, #0xd
	str r0, [sp]
	mov r0, #0xc
	str r0, [sp, #4]
	mov r1, #4
	str r1, [sp, #8]
	mov r0, #0x11
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x2c]
	ldr r2, _0225D670 ; =0x000003FF
	mov r3, #0
	bl FillBgTilemapRect
	mov r0, #0
	str r0, [sp]
	mov r0, #0xc
	str r0, [sp, #4]
	mov r1, #4
	str r1, [sp, #8]
	mov r3, #0x11
	str r3, [sp, #0xc]
	ldr r0, [r4, #0x2c]
	ldr r2, _0225D670 ; =0x000003FF
	bl FillBgTilemapRect
	mov r0, #0xd
	str r0, [sp]
	mov r0, #0xc
	str r0, [sp, #4]
	mov r1, #4
	str r1, [sp, #8]
	mov r0, #0x11
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x2c]
	ldr r2, _0225D670 ; =0x000003FF
	mov r3, #0x14
	bl FillBgTilemapRect
	b _0225D662
_0225D604:
	ldr r0, [r4]
	add r0, #0x30
	ldrb r0, [r0]
	cmp r0, #2
	beq _0225D614
	cmp r0, #3
	beq _0225D64A
	b _0225D662
_0225D614:
	mov r0, #0xd
	str r0, [sp]
	mov r0, #0xc
	str r0, [sp, #4]
	mov r1, #4
	str r1, [sp, #8]
	mov r0, #0x11
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x2c]
	ldr r2, _0225D670 ; =0x000003FF
	mov r3, #0
	bl FillBgTilemapRect
	mov r0, #0xd
	str r0, [sp]
	mov r0, #0xc
	str r0, [sp, #4]
	mov r1, #4
	str r1, [sp, #8]
	mov r0, #0x11
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x2c]
	ldr r2, _0225D670 ; =0x000003FF
	mov r3, #0x14
	bl FillBgTilemapRect
	b _0225D662
_0225D64A:
	mov r0, #0
	str r0, [sp]
	mov r0, #0xc
	str r0, [sp, #4]
	mov r1, #4
	str r1, [sp, #8]
	mov r3, #0x11
	str r3, [sp, #0xc]
	ldr r0, [r4, #0x2c]
	ldr r2, _0225D670 ; =0x000003FF
	bl FillBgTilemapRect
_0225D662:
	ldr r0, [r4, #0x2c]
	mov r1, #4
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x10
	pop {r4, pc}
	nop
_0225D670: .word 0x000003FF
	thumb_func_end ov93_0225D5AC

	thumb_func_start ov93_0225D674
ov93_0225D674: ; 0x0225D674
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	bl sub_02014DA0
	mov r1, #0x12
	mov r0, #0x75
	lsl r1, r1, #0xa
	bl AllocFromHeap
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0x75
	str r0, [sp, #4]
	mov r3, #0x12
	ldr r0, _0225D6D8 ; =ov93_0225D744
	ldr r1, _0225D6DC ; =ov93_0225D768
	lsl r3, r3, #0xa
	bl sub_02014DB4
	add r1, r4, #0
	add r1, #0xa4
	str r0, [r1]
	add r0, r4, #0
	add r0, #0xa4
	ldr r0, [r0]
	bl sub_02015524
	add r2, r0, #0
	mov r0, #1
	mov r1, #0xe1
	lsl r0, r0, #0xc
	lsl r1, r1, #0xe
	bl GF_Camera_SetClipBounds
	mov r0, #0xd5
	mov r1, #0
	mov r2, #0x75
	bl sub_02015264
	add r4, #0xa4
	add r1, r0, #0
	ldr r0, [r4]
	mov r2, #0xa
	mov r3, #1
	bl sub_0201526C
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_0225D6D8: .word ov93_0225D744
_0225D6DC: .word ov93_0225D768
	thumb_func_end ov93_0225D674

	thumb_func_start ov93_0225D6E0
ov93_0225D6E0: ; 0x0225D6E0
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r0, #0xa4
	ldr r0, [r0]
	bl sub_020154D0
	add r4, #0xa4
	add r5, r0, #0
	ldr r0, [r4]
	bl sub_02014EBC
	add r0, r5, #0
	bl FreeToHeap
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov93_0225D6E0

	thumb_func_start ov93_0225D700
ov93_0225D700: ; 0x0225D700
	push {r3, lr}
	add r3, r0, #0
	cmp r1, #0
	beq _0225D712
	cmp r1, #1
	beq _0225D720
	cmp r1, #2
	beq _0225D72E
	b _0225D73C
_0225D712:
	add r0, #0xa4
	mov r1, #0
	ldr r0, [r0]
	add r2, r1, #0
	bl sub_02015494
	pop {r3, pc}
_0225D720:
	add r0, #0xa4
	ldr r0, [r0]
	mov r1, #1
	mov r2, #0
	bl sub_02015494
	pop {r3, pc}
_0225D72E:
	add r0, #0xa4
	ldr r0, [r0]
	mov r1, #2
	mov r2, #0
	bl sub_02015494
	pop {r3, pc}
_0225D73C:
	bl GF_AssertFail
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov93_0225D700

	thumb_func_start ov93_0225D744
ov93_0225D744: ; 0x0225D744
	push {r4, lr}
	ldr r3, _0225D764 ; =NNS_GfdDefaultFuncAllocTexVram
	mov r2, #0
	ldr r3, [r3]
	blx r3
	add r4, r0, #0
	bne _0225D756
	bl GF_AssertFail
_0225D756:
	add r0, r4, #0
	bl sub_02015354
	lsl r0, r4, #0x10
	lsr r0, r0, #0xd
	pop {r4, pc}
	nop
_0225D764: .word NNS_GfdDefaultFuncAllocTexVram
	thumb_func_end ov93_0225D744

	thumb_func_start ov93_0225D768
ov93_0225D768: ; 0x0225D768
	push {r4, lr}
	ldr r3, _0225D788 ; =NNS_GfdDefaultFuncAllocPlttVram
	mov r2, #1
	ldr r3, [r3]
	blx r3
	add r4, r0, #0
	bne _0225D77A
	bl GF_AssertFail
_0225D77A:
	add r0, r4, #0
	bl sub_02015394
	lsl r0, r4, #0x10
	lsr r0, r0, #0xd
	pop {r4, pc}
	nop
_0225D788: .word NNS_GfdDefaultFuncAllocPlttVram
	thumb_func_end ov93_0225D768

	thumb_func_start ov93_0225D78C
ov93_0225D78C: ; 0x0225D78C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	add r5, r0, #0
	str r1, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _0225D9C4 ; =0x00002713
	str r1, [sp, #0x2c]
	str r0, [sp, #0x14]
	add r0, r5, #0
	add r0, #0x8c
	ldr r0, [r0]
	ldr r2, [r5, #0x24]
	ldr r3, [r5, #0x28]
	mov r1, #2
	bl sub_0200D68C
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #2
	bl NewString_ReadMsgData
	add r6, r0, #0
	mov r0, #0
	add r1, r6, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	mov r1, #0x1e
	sub r0, r1, r0
	lsr r0, r0, #1
	add r4, r0, #6
	add r2, r5, #0
	ldr r3, _0225D9C8 ; =0x0000169C
	str r6, [sp]
	mov r0, #0
	ldr r1, _0225D9CC ; =0x000E0F00
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r1, _0225D9C4 ; =0x00002713
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	add r1, r4, #0
	add r1, #0x24
	str r1, [sp, #0x14]
	mov r1, #0xa8
	str r1, [sp, #0x18]
	str r0, [sp, #0x1c]
	mov r0, #1
	str r0, [sp, #0x20]
	mov r0, #0xc
	str r0, [sp, #0x24]
	mov r0, #2
	str r0, [sp, #0x28]
	add r2, #0x90
	ldr r0, [r5, #0x2c]
	ldr r1, [r5, #0x28]
	ldr r2, [r2]
	add r3, r5, r3
	bl ov93_02261EB8
	add r0, r6, #0
	bl String_dtor
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0
	bl NewString_ReadMsgData
	str r0, [sp, #0x30]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #1
	bl NewString_ReadMsgData
	str r0, [sp, #0x38]
	mov r0, #0
	str r0, [sp, #0x34]
	ldr r0, _0225D9D0 ; =0x000015AC
	add r7, r5, r0
	add r0, #0x14
	add r6, r5, r0
_0225D840:
	ldr r0, [sp, #0x30]
	add r2, r5, #0
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _0225D9CC ; =0x000E0F00
	add r2, #0x90
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, _0225D9C4 ; =0x00002713
	add r3, r7, #0
	str r0, [sp, #0x10]
	str r4, [sp, #0x14]
	mov r0, #0xa8
	str r0, [sp, #0x18]
	mov r0, #0
	str r0, [sp, #0x1c]
	mov r0, #3
	str r0, [sp, #0x20]
	mov r0, #0xc
	str r0, [sp, #0x24]
	mov r0, #0xa
	str r0, [sp, #0x28]
	ldr r0, [r5, #0x2c]
	ldr r1, [r5, #0x28]
	ldr r2, [r2]
	bl ov93_02261EB8
	ldr r0, [sp, #0x38]
	add r2, r5, #0
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _0225D9CC ; =0x000E0F00
	add r2, #0x90
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, _0225D9C4 ; =0x00002713
	add r3, r6, #0
	str r0, [sp, #0x10]
	str r4, [sp, #0x14]
	mov r0, #0xa8
	str r0, [sp, #0x18]
	mov r0, #0
	str r0, [sp, #0x1c]
	mov r0, #3
	str r0, [sp, #0x20]
	mov r0, #0xc
	str r0, [sp, #0x24]
	mov r0, #0xa
	str r0, [sp, #0x28]
	ldr r0, [r5, #0x2c]
	ldr r1, [r5, #0x28]
	ldr r2, [r2]
	bl ov93_02261EB8
	ldr r0, [sp, #0x34]
	add r4, r4, #6
	add r0, r0, #1
	add r7, #0x28
	add r6, #0x28
	str r0, [sp, #0x34]
	cmp r0, #6
	blt _0225D840
	ldr r0, [sp, #0x30]
	bl String_dtor
	ldr r0, [sp, #0x38]
	bl String_dtor
	ldr r0, _0225D9D4 ; =0x000015A8
	add r0, r5, r0
	bl ov93_02261FC8
	add r0, r5, #0
	bl ov93_02262250
	ldr r0, [sp, #0x2c]
	mov r1, #2
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _0225D9D8 ; =0x00002714
	str r0, [sp, #0x14]
	add r0, r5, #0
	add r0, #0x8c
	ldr r0, [r0]
	ldr r2, [r5, #0x24]
	ldr r3, [r5, #0x28]
	bl sub_0200D68C
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0225D9DC ; =0x00002712
	ldr r2, [sp, #0x2c]
	str r0, [sp, #8]
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	mov r3, #0x18
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	ldr r0, _0225D9DC ; =0x00002712
	ldr r2, [sp, #0x2c]
	str r0, [sp, #4]
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	mov r3, #0x1a
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _0225D9DC ; =0x00002712
	ldr r2, [sp, #0x2c]
	str r0, [sp, #4]
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	mov r3, #0x19
	bl sub_0200D71C
	add r0, r5, #0
	bl ov93_02262230
	ldr r1, _0225D9D4 ; =0x000015A8
	str r0, [r5, r1]
	mov r0, #0xc8
	str r0, [sp]
	mov r0, #0x14
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _0225D9DC ; =0x00002712
	mov r1, #2
	str r0, [sp, #0x14]
	add r0, r5, #0
	add r0, #0x8c
	ldr r0, [r0]
	ldr r2, [r5, #0x24]
	ldr r3, [r5, #0x28]
	bl sub_0200D644
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0225D9E0 ; =0x00002711
	mov r2, #0xc8
	str r0, [sp, #8]
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	mov r3, #0x15
	bl sub_0200D4A4
	mov r0, #0
	str r0, [sp]
	ldr r0, _0225D9E0 ; =0x00002711
	mov r2, #0xc8
	str r0, [sp, #4]
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	mov r3, #0x16
	bl sub_0200D6D4
	mov r0, #0
	str r0, [sp]
	ldr r0, _0225D9E0 ; =0x00002711
	mov r2, #0xc8
	str r0, [sp, #4]
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	mov r3, #0x17
	bl sub_0200D704
	add r0, r5, #0
	bl ov93_02262344
	ldr r1, _0225D9E4 ; =0x0000174C
	str r0, [r5, r1]
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	nop
_0225D9C4: .word 0x00002713
_0225D9C8: .word 0x0000169C
_0225D9CC: .word 0x000E0F00
_0225D9D0: .word 0x000015AC
_0225D9D4: .word 0x000015A8
_0225D9D8: .word 0x00002714
_0225D9DC: .word 0x00002712
_0225D9E0: .word 0x00002711
_0225D9E4: .word 0x0000174C
	thumb_func_end ov93_0225D78C

	thumb_func_start ov93_0225D9E8
ov93_0225D9E8: ; 0x0225D9E8
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r0, _0225DA30 ; =0x000015AC
	mov r6, #0
	add r4, r7, r0
	add r0, #0x14
	add r5, r7, r0
_0225D9F6:
	add r0, r4, #0
	bl ov93_02261FB0
	add r0, r5, #0
	bl ov93_02261FB0
	add r6, r6, #1
	add r4, #0x28
	add r5, #0x28
	cmp r6, #6
	blt _0225D9F6
	ldr r0, _0225DA34 ; =0x0000169C
	add r0, r7, r0
	bl ov93_02261FB0
	add r0, r7, #0
	bl ov93_02262310
	ldr r1, _0225DA38 ; =0x000015A8
	add r0, r7, #0
	ldr r1, [r7, r1]
	bl ov93_02262338
	ldr r1, _0225DA3C ; =0x0000174C
	add r0, r7, #0
	ldr r1, [r7, r1]
	bl ov93_02262368
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225DA30: .word 0x000015AC
_0225DA34: .word 0x0000169C
_0225DA38: .word 0x000015A8
_0225DA3C: .word 0x0000174C
	thumb_func_end ov93_0225D9E8

	thumb_func_start ov93_0225DA40
ov93_0225DA40: ; 0x0225DA40
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r4, r1, #0
	add r5, r0, #0
	str r4, [sp]
	mov r0, #0x17
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #9
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	ldr r0, _0225DAE4 ; =0x00002716
	mov r1, #3
	str r0, [sp, #0x14]
	add r0, r5, #0
	add r0, #0x8c
	ldr r0, [r0]
	ldr r2, [r5, #0x24]
	ldr r3, [r5, #0x28]
	bl sub_0200D68C
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _0225DAE8 ; =0x00002714
	add r2, r4, #0
	str r0, [sp, #8]
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	mov r3, #0x14
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	ldr r0, _0225DAE8 ; =0x00002714
	add r2, r4, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	mov r3, #0x16
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _0225DAE8 ; =0x00002714
	add r2, r4, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	mov r3, #0x15
	bl sub_0200D71C
	add r0, r5, #0
	bl ov93_022609E0
	ldr r1, _0225DAEC ; =0x00001458
	add r0, r5, #0
	add r1, r5, r1
	bl ov93_022610B0
	ldr r1, _0225DAF0 ; =0x00001468
	add r0, r5, #0
	add r1, r5, r1
	bl ov93_02261164
	ldr r1, _0225DAF4 ; =0x00001560
	add r0, r5, #0
	add r1, r5, r1
	bl ov93_02261BBC
	add r0, r5, #0
	bl ov93_02260CF8
	add r0, r5, #0
	bl ov93_02260E1C
	add sp, #0x18
	pop {r3, r4, r5, pc}
	nop
_0225DAE4: .word 0x00002716
_0225DAE8: .word 0x00002714
_0225DAEC: .word 0x00001458
_0225DAF0: .word 0x00001468
_0225DAF4: .word 0x00001560
	thumb_func_end ov93_0225DA40

	thumb_func_start ov93_0225DAF8
ov93_0225DAF8: ; 0x0225DAF8
	push {r4, lr}
	add r4, r0, #0
	bl ov93_02260A14
	ldr r1, _0225DB20 ; =0x00001458
	add r0, r4, #0
	add r1, r4, r1
	bl ov93_0226114C
	ldr r1, _0225DB24 ; =0x00001468
	add r0, r4, #0
	add r1, r4, r1
	bl ov93_022612E0
	ldr r1, _0225DB28 ; =0x00001560
	add r0, r4, #0
	add r1, r4, r1
	bl ov93_02261C3C
	pop {r4, pc}
	.balign 4, 0
_0225DB20: .word 0x00001458
_0225DB24: .word 0x00001468
_0225DB28: .word 0x00001560
	thumb_func_end ov93_0225DAF8

	thumb_func_start ov93_0225DB2C
ov93_0225DB2C: ; 0x0225DB2C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x8c
	add r4, r1, #0
	ldr r0, [r0]
	mov r1, #0xc9
	mov r2, #4
	mov r3, #0x75
	bl PaletteData_LoadNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x75
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x2c]
	add r0, r4, #0
	mov r1, #2
	mov r3, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x75
	str r0, [sp, #0xc]
	mov r1, #3
	ldr r2, [r5, #0x2c]
	add r0, r4, #0
	add r3, r1, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r0, #0x75
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x2c]
	add r0, r4, #0
	mov r3, #2
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x75
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x2c]
	add r0, r4, #0
	mov r1, #1
	mov r3, #2
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r1, #0
	str r1, [sp]
	mov r0, #1
	add r5, #0x8c
	str r0, [sp, #4]
	ldr r0, [r5]
	mov r2, #2
	add r3, r1, #0
	bl sub_02003D5C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov93_0225DB2C

	thumb_func_start ov93_0225DBC4
ov93_0225DBC4: ; 0x0225DBC4
	bx lr
	.balign 4, 0
	thumb_func_end ov93_0225DBC4

	thumb_func_start ov93_0225DBC8
ov93_0225DBC8: ; 0x0225DBC8
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0xa0
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x8c
	add r4, r1, #0
	ldr r0, [r0]
	mov r1, #0xc9
	mov r2, #5
	mov r3, #0x75
	bl PaletteData_LoadNarc
	mov r0, #1
	str r0, [sp]
	mov r0, #5
	lsl r0, r0, #6
	str r0, [sp, #4]
	mov r0, #0x60
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r0, #0x8c
	ldr r0, [r0]
	mov r1, #0xc9
	mov r2, #6
	mov r3, #0x75
	bl PaletteData_LoadFromNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x75
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x2c]
	add r0, r4, #0
	mov r1, #0xd
	mov r3, #6
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x75
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x2c]
	add r0, r4, #0
	mov r1, #0xe
	mov r3, #6
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x75
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x2c]
	add r0, r4, #0
	mov r1, #0x12
	mov r3, #5
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	ldr r0, [r5]
	add r0, #0x30
	ldrb r0, [r0]
	cmp r0, #2
	beq _0225DC64
	cmp r0, #3
	beq _0225DC7E
	b _0225DC98
_0225DC64:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x75
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x2c]
	add r0, r4, #0
	mov r1, #0xf
	mov r3, #5
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	b _0225DCB0
_0225DC7E:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x75
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x2c]
	add r0, r4, #0
	mov r1, #0x10
	mov r3, #5
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	b _0225DCB0
_0225DC98:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x75
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x2c]
	add r0, r4, #0
	mov r1, #0x11
	mov r3, #5
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
_0225DCB0:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x75
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x2c]
	add r0, r4, #0
	mov r1, #0x12
	mov r3, #4
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x75
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x2c]
	add r0, r4, #0
	mov r1, #0x13
	mov r3, #4
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add r0, r5, #0
	bl ov93_02260BF0
	add r0, r5, #0
	bl ov93_02260BB0
	mov r0, #0
	str r0, [sp]
	mov r0, #0x75
	str r0, [sp, #4]
	mov r2, #0x35
	ldr r0, [r5, #0x2c]
	mov r1, #4
	lsl r2, r2, #4
	mov r3, #6
	bl LoadUserFrameGfx1
	add r0, r5, #0
	add r0, #0x8c
	ldr r0, [r0]
	mov r1, #1
	mov r2, #0x60
	mov r3, #0x20
	bl sub_020032A4
	mov r3, #0
	str r3, [sp]
	mov r1, #1
	str r1, [sp, #4]
	add r5, #0x8c
	ldr r0, [r5]
	mov r2, #2
	bl sub_02003D5C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov93_0225DBC8

	thumb_func_start ov93_0225DD28
ov93_0225DD28: ; 0x0225DD28
	bx lr
	.balign 4, 0
	thumb_func_end ov93_0225DD28

	thumb_func_start ov93_0225DD2C
ov93_0225DD2C: ; 0x0225DD2C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	str r0, [sp, #8]
	str r0, [sp, #0x10]
	add r0, #0xd8
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	mov r7, #0
	bl sub_0203769C
	add r1, r0, #0
	ldr r0, [sp, #8]
	bl ov93_0225E45C
	add r4, r0, #0
	mov r1, #0x14
	mul r4, r1
	ldr r2, _0225DEB4 ; =ov93_02262AF0
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0xc]
	ldr r2, [r2, r4]
	mov r3, #0x75
	bl sub_02018030
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x10]
	add r0, #0x10
	bl sub_020181B0
	ldr r0, [sp, #0x10]
	add r1, r7, #0
	ldr r2, _0225DEB8 ; =0xFFFE7000
	add r0, #0x10
	add r3, r1, #0
	bl sub_020182A8
	ldr r0, [sp, #0x10]
	mov r1, #1
	lsl r1, r1, #0xc
	add r0, #0x10
	add r2, r1, #0
	add r3, r1, #0
	bl sub_020182C4
	ldr r0, [sp, #0x10]
	mov r1, #1
	add r0, #0x10
	bl sub_020182A0
	ldr r2, _0225DEBC ; =ov93_02262AF4
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0xc]
	ldr r2, [r2, r4]
	add r0, #0x88
	mov r3, #0x75
	bl sub_02018030
	ldr r2, _0225DEC0 ; =ov93_02262AF8
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0xc]
	ldr r2, [r2, r4]
	add r0, #0x98
	mov r3, #0x75
	bl sub_02018030
	ldr r2, _0225DEC4 ; =ov93_02262AFC
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0xc]
	ldr r2, [r2, r4]
	add r0, #0xa8
	mov r3, #0x75
	bl sub_02018030
	ldr r2, _0225DEC8 ; =ov93_02262B00
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0xc]
	ldr r2, [r2, r4]
	add r0, #0xb8
	mov r3, #0x75
	bl sub_02018030
	add r0, r7, #0
	str r0, [sp, #0x1c]
	mov r1, #0x51
	ldr r0, [sp, #0x10]
	lsl r1, r1, #2
	add r0, r0, r1
	str r0, [sp, #0x14]
	ldr r0, [sp, #8]
	str r0, [sp, #0x24]
	add r0, #0xa8
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x10]
	str r0, [sp, #0x20]
	add r0, #0x88
	str r0, [sp, #0x20]
_0225DDEC:
	mov r0, #0
	ldr r4, [sp, #0x20]
	ldr r5, [sp, #0x14]
	ldr r6, [sp, #0x10]
	str r0, [sp, #0x18]
_0225DDF6:
	cmp r7, #0
	bne _0225DE18
	mov r0, #0x75
	str r0, [sp]
	ldr r0, [sp, #0x24]
	ldr r3, [sp, #0x18]
	str r0, [sp, #4]
	ldr r2, [sp, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	add r3, #0x23
	bl sub_020180BC
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r7, [r6, r0]
	b _0225DE24
_0225DE18:
	ldr r3, [sp, #0x24]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r7, #0
	bl sub_020180E8
_0225DE24:
	add r0, r5, #0
	mov r1, #0
	bl sub_02018198
	ldr r0, [sp, #0x18]
	add r4, #0x10
	add r0, r0, #1
	add r5, #0x90
	add r6, #0x90
	str r0, [sp, #0x18]
	cmp r0, #4
	blt _0225DDF6
	mov r0, #9
	ldr r1, [sp, #0x14]
	lsl r0, r0, #6
	add r0, r1, r0
	str r0, [sp, #0x14]
	mov r0, #9
	ldr r1, [sp, #0x10]
	lsl r0, r0, #6
	add r0, r1, r0
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x1c]
	add r0, r0, #1
	str r0, [sp, #0x1c]
	cmp r0, #8
	blt _0225DDEC
	ldr r1, [sp, #8]
	ldr r0, _0225DECC ; =0x000013A0
	mov r2, #0x1e
	add r0, r1, r0
	ldr r1, [sp, #0xc]
	mov r3, #0x75
	bl sub_02018030
	ldr r1, [sp, #8]
	ldr r0, _0225DECC ; =0x000013A0
	add r2, r1, #0
	add r0, r1, r0
	ldr r1, _0225DECC ; =0x000013A0
	add r0, #0x10
	add r1, r2, r1
	bl sub_020181B0
	ldr r1, [sp, #8]
	ldr r0, _0225DECC ; =0x000013A0
	ldr r2, _0225DEB8 ; =0xFFFE7000
	add r0, r1, r0
	mov r1, #0
	add r0, #0x10
	add r3, r1, #0
	bl sub_020182A8
	ldr r1, [sp, #8]
	ldr r0, _0225DECC ; =0x000013A0
	add r0, r1, r0
	mov r1, #1
	lsl r1, r1, #0xc
	add r0, #0x10
	add r2, r1, #0
	add r3, r1, #0
	bl sub_020182C4
	ldr r1, [sp, #8]
	ldr r0, _0225DECC ; =0x000013A0
	add r0, r1, r0
	add r0, #0x10
	mov r1, #1
	bl sub_020182A0
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225DEB4: .word ov93_02262AF0
_0225DEB8: .word 0xFFFE7000
_0225DEBC: .word ov93_02262AF4
_0225DEC0: .word ov93_02262AF8
_0225DEC4: .word ov93_02262AFC
_0225DEC8: .word ov93_02262B00
_0225DECC: .word 0x000013A0
	thumb_func_end ov93_0225DD2C

	thumb_func_start ov93_0225DED0
ov93_0225DED0: ; 0x0225DED0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	add r6, #0xd8
	str r0, [sp]
	add r0, r6, #0
	bl sub_02018068
	add r5, r6, #0
	mov r4, #0
	add r5, #0x88
_0225DEE6:
	add r0, r5, #0
	bl sub_02018068
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #4
	blt _0225DEE6
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0x51
	lsl r0, r0, #2
	add r7, r6, r0
	ldr r6, [sp]
	add r6, #0xa8
_0225DF02:
	mov r4, #0
	add r5, r7, #0
_0225DF06:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_020180F8
	add r4, r4, #1
	add r5, #0x90
	cmp r4, #4
	blt _0225DF06
	mov r0, #9
	lsl r0, r0, #6
	add r7, r7, r0
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #8
	blt _0225DF02
	ldr r1, _0225DF34 ; =0x000013A0
	ldr r0, [sp]
	add r0, r0, r1
	bl sub_02018068
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225DF34: .word 0x000013A0
	thumb_func_end ov93_0225DED0

	thumb_func_start ov93_0225DF38
ov93_0225DF38: ; 0x0225DF38
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0x4b
	lsl r0, r0, #4
	add r5, #0xd8
	cmp r1, r0
	ble _0225DF4C
	mov r2, #3
	b _0225DF5E
_0225DF4C:
	cmp r1, #2
	ble _0225DF54
	mov r2, #2
	b _0225DF5E
_0225DF54:
	cmp r1, #1
	ble _0225DF5C
	mov r2, #1
	b _0225DF5E
_0225DF5C:
	mov r2, #0
_0225DF5E:
	add r0, r5, #0
	str r0, [sp, #4]
	add r0, #0x88
	mov r1, #0x90
	str r0, [sp, #4]
	lsl r0, r2, #4
	mul r1, r2
	mov r3, #9
	mov ip, r0
	mov r0, #0
	add r1, r5, r1
	lsl r3, r3, #6
_0225DF76:
	add r4, r1, #0
	add r4, #0xc8
	ldr r4, [r4]
	cmp r4, #0
	bne _0225DFF2
	add r4, r2, #0
	mov r1, #0x90
	mul r4, r1
	lsl r1, r0, #3
	add r0, r0, r1
	lsl r7, r0, #6
	add r0, r5, #0
	add r0, #0xcc
	add r6, r0, r7
	ldr r1, [sp, #4]
	mov r2, ip
	add r0, r6, r4
	add r1, r1, r2
	bl sub_020181B0
	mov r1, #0
	ldr r2, _0225E000 ; =0xFFFE7000
	add r0, r6, r4
	add r3, r1, #0
	bl sub_020182A8
	mov r1, #1
	lsl r1, r1, #0xc
	add r0, r6, r4
	add r2, r1, #0
	add r3, r1, #0
	bl sub_020182C4
	add r0, r6, r4
	mov r1, #1
	bl sub_020182A0
	mov r0, #0x51
	lsl r0, r0, #2
	add r0, r5, r0
	add r0, r0, r7
	str r0, [sp]
	add r0, r0, r4
	mov r1, #0
	bl sub_02018198
	ldr r1, [sp]
	add r0, r6, r4
	add r1, r1, r4
	bl sub_020181D4
	add r0, r5, r7
	add r0, r0, r4
	mov r1, #1
	add r0, #0xc8
	str r1, [r0]
	ldr r0, _0225E004 ; =0x00000591
	bl PlaySE
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225DFF2:
	add r0, r0, #1
	add r1, r1, r3
	cmp r0, #8
	blt _0225DF76
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225E000: .word 0xFFFE7000
_0225E004: .word 0x00000591
	thumb_func_end ov93_0225DF38

	thumb_func_start ov93_0225E008
ov93_0225E008: ; 0x0225E008
	push {r4, r5, r6, lr}
	add r4, r0, #0
	lsl r0, r1, #3
	add r0, r1, r0
	add r4, #0xd8
	lsl r6, r0, #6
	add r0, r4, #0
	add r0, #0xcc
	mov r3, #0x90
	add r5, r2, #0
	mul r5, r3
	add r3, #0xb4
	add r1, r4, r3
	add r0, r0, r6
	add r1, r1, r6
	add r0, r0, r5
	add r1, r1, r5
	bl sub_020181E0
	add r0, r4, r6
	add r0, r0, r5
	mov r1, #0
	add r0, #0xc8
	str r1, [r0]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov93_0225E008

	thumb_func_start ov93_0225E03C
ov93_0225E03C: ; 0x0225E03C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	mov r1, #0x51
	str r0, [sp]
	str r0, [sp, #8]
	add r0, #0xd8
	lsl r1, r1, #2
	str r0, [sp, #8]
	add r0, r0, r1
	mov r7, #0
	str r0, [sp, #4]
_0225E052:
	ldr r4, [sp, #8]
	ldr r5, [sp, #4]
	mov r6, #0
_0225E058:
	add r0, r4, #0
	add r0, #0xc8
	ldr r0, [r0]
	cmp r0, #1
	bne _0225E07A
	mov r1, #1
	add r0, r5, #0
	lsl r1, r1, #0xc
	bl sub_0201815C
	cmp r0, #1
	bne _0225E07A
	ldr r0, [sp]
	add r1, r7, #0
	add r2, r6, #0
	bl ov93_0225E008
_0225E07A:
	add r6, r6, #1
	add r4, #0x90
	add r5, #0x90
	cmp r6, #4
	blt _0225E058
	mov r0, #9
	ldr r1, [sp, #8]
	lsl r0, r0, #6
	add r0, r1, r0
	str r0, [sp, #8]
	mov r0, #9
	ldr r1, [sp, #4]
	lsl r0, r0, #6
	add r0, r1, r0
	add r7, r7, #1
	str r0, [sp, #4]
	cmp r7, #8
	blt _0225E052
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov93_0225E03C

	thumb_func_start ov93_0225E0A4
ov93_0225E0A4: ; 0x0225E0A4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	add r0, #0xd8
	str r0, [sp]
	ldr r7, [sp]
	mov r0, #0
	str r0, [sp, #4]
	add r7, #0xcc
_0225E0B6:
	ldr r4, [sp]
	mov r6, #0
	add r5, r7, #0
_0225E0BC:
	add r0, r4, #0
	add r0, #0xc8
	ldr r0, [r0]
	cmp r0, #1
	bne _0225E0CC
	add r0, r5, #0
	bl sub_020181EC
_0225E0CC:
	add r6, r6, #1
	add r4, #0x90
	add r5, #0x90
	cmp r6, #4
	blt _0225E0BC
	mov r0, #9
	ldr r1, [sp]
	lsl r0, r0, #6
	add r0, r1, r0
	str r0, [sp]
	mov r0, #9
	lsl r0, r0, #6
	add r7, r7, r0
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #8
	blt _0225E0B6
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov93_0225E0A4

	thumb_func_start ov93_0225E0F4
ov93_0225E0F4: ; 0x0225E0F4
	push {r4, lr}
	add r4, r0, #0
	bl sub_0203769C
	ldr r1, [r4, #4]
	cmp r1, r0
	bne _0225E106
	mov r0, #1
	pop {r4, pc}
_0225E106:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov93_0225E0F4

	thumb_func_start ov93_0225E10C
ov93_0225E10C: ; 0x0225E10C
	push {r4, r5, r6, r7}
	ldr r5, [r0]
	ldr r3, [r0, #0xc]
	add r4, r5, #0
	add r4, #0x30
	ldrb r6, [r4]
	add r1, r5, #0
	add r1, #0x2c
	mov r2, #1
	ldrb r1, [r1]
	cmp r6, #1
	ble _0225E13C
	add r4, r0, #4
_0225E126:
	ldr r7, [r4, #0xc]
	cmp r3, r7
	bhs _0225E134
	add r1, r5, r2
	add r1, #0x2c
	ldrb r1, [r1]
	add r3, r7, #0
_0225E134:
	add r2, r2, #1
	add r4, r4, #4
	cmp r2, r6
	blt _0225E126
_0225E13C:
	str r1, [r0, #4]
	add r0, r1, #0
	pop {r4, r5, r6, r7}
	bx lr
	thumb_func_end ov93_0225E10C

	thumb_func_start ov93_0225E144
ov93_0225E144: ; 0x0225E144
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	str r1, [sp]
	add r5, r2, #0
	bl ov93_0225E1E0
	cmp r0, #1
	beq _0225E196
	ldr r0, _0225E198 ; =0x00002F04
	mov r1, #0x3c
	add r6, r4, r0
	ldr r0, [sp]
	lsl r7, r0, #2
	ldr r0, [r6, r7]
	bl _s32_div_f
	add r0, r1, #0
	ldr r1, _0225E19C ; =0x00001C1C
	mov r3, #0x4b
	ldr r2, [sp]
	lsl r3, r3, #4
	add r1, r4, r1
	mul r3, r2
	add r2, r1, r3
	mov r1, #0x14
	mul r1, r0
	ldr r0, [r6, r7]
	add r4, r2, r1
	add r0, r0, #1
	str r0, [r6, r7]
	ldr r0, [r2, r1]
	cmp r0, #0
	beq _0225E18A
	bl GF_AssertFail
_0225E18A:
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldr r0, [r5]
	str r0, [r4]
_0225E196:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225E198: .word 0x00002F04
_0225E19C: .word 0x00001C1C
	thumb_func_end ov93_0225E144

	thumb_func_start ov93_0225E1A0
ov93_0225E1A0: ; 0x0225E1A0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r7, r1, #0
	ldr r0, _0225E1D8 ; =0x00002F14
	lsl r4, r7, #2
	add r5, r6, r0
	ldr r0, [r5, r4]
	mov r1, #0x3c
	bl _s32_div_f
	ldr r0, _0225E1DC ; =0x00001C1C
	add r2, r6, r0
	mov r0, #0x4b
	lsl r0, r0, #4
	mul r0, r7
	add r0, r2, r0
	mov r2, #0x14
	mul r2, r1
	ldr r1, [r0, r2]
	cmp r1, #0
	beq _0225E1D4
	ldr r1, [r5, r4]
	add r0, r0, r2
	add r1, r1, #1
	str r1, [r5, r4]
	pop {r3, r4, r5, r6, r7, pc}
_0225E1D4:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225E1D8: .word 0x00002F14
_0225E1DC: .word 0x00001C1C
	thumb_func_end ov93_0225E1A0

	thumb_func_start ov93_0225E1E0
ov93_0225E1E0: ; 0x0225E1E0
	push {r3, r4, r5, lr}
	add r4, r2, #0
	add r5, r0, #0
	ldr r0, [r4]
	cmp r0, #7
	bhi _0225E228
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225E1F8: ; jump table
	.short _0225E228 - _0225E1F8 - 2 ; case 0
	.short _0225E228 - _0225E1F8 - 2 ; case 1
	.short _0225E208 - _0225E1F8 - 2 ; case 2
	.short _0225E208 - _0225E1F8 - 2 ; case 3
	.short _0225E208 - _0225E1F8 - 2 ; case 4
	.short _0225E208 - _0225E1F8 - 2 ; case 5
	.short _0225E208 - _0225E1F8 - 2 ; case 6
	.short _0225E208 - _0225E1F8 - 2 ; case 7
_0225E208:
	ldr r0, _0225E22C ; =0x00002EF0
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0225E214
	bl GF_AssertFail
_0225E214:
	ldr r0, _0225E22C ; =0x00002EF0
	add r2, r5, r0
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r4]
	str r0, [r2]
	mov r0, #1
	pop {r3, r4, r5, pc}
_0225E228:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0225E22C: .word 0x00002EF0
	thumb_func_end ov93_0225E1E0

	thumb_func_start ov93_0225E230
ov93_0225E230: ; 0x0225E230
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov93_0225E27C
	cmp r0, #1
	beq _0225E270
	ldr r0, _0225E274 ; =0x00002F24
	mov r1, #0x3c
	ldr r0, [r5, r0]
	bl _s32_div_f
	ldr r0, _0225E278 ; =0x0000176C
	add r2, r5, r0
	mov r0, #0x14
	mul r0, r1
	ldr r1, _0225E274 ; =0x00002F24
	add r6, r2, r0
	ldr r3, [r5, r1]
	add r3, r3, #1
	str r3, [r5, r1]
	ldr r0, [r2, r0]
	cmp r0, #0
	beq _0225E264
	bl GF_AssertFail
_0225E264:
	ldmia r4!, {r0, r1}
	stmia r6!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r6!, {r0, r1}
	ldr r0, [r4]
	str r0, [r6]
_0225E270:
	pop {r4, r5, r6, pc}
	nop
_0225E274: .word 0x00002F24
_0225E278: .word 0x0000176C
	thumb_func_end ov93_0225E230

	thumb_func_start ov93_0225E27C
ov93_0225E27C: ; 0x0225E27C
	push {r4, lr}
	add r2, r1, #0
	ldr r1, [r2]
	cmp r1, #7
	bhi _0225E2CC
	add r3, r1, r1
	add r3, pc
	ldrh r3, [r3, #6]
	lsl r3, r3, #0x10
	asr r3, r3, #0x10
	add pc, r3
_0225E292: ; jump table
	.short _0225E2CC - _0225E292 - 2 ; case 0
	.short _0225E2CC - _0225E292 - 2 ; case 1
	.short _0225E2A2 - _0225E292 - 2 ; case 2
	.short _0225E2A2 - _0225E292 - 2 ; case 3
	.short _0225E2A2 - _0225E292 - 2 ; case 4
	.short _0225E2A2 - _0225E292 - 2 ; case 5
	.short _0225E2A2 - _0225E292 - 2 ; case 6
	.short _0225E2A2 - _0225E292 - 2 ; case 7
_0225E2A2:
	ldr r3, _0225E2D0 ; =0x00002EDC
	ldr r4, [r0, r3]
	cmp r4, #0
	bne _0225E2BC
	add r3, r0, r3
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	mov r0, #1
	pop {r4, pc}
_0225E2BC:
	cmp r1, r4
	bne _0225E2C4
	mov r0, #1
	pop {r4, pc}
_0225E2C4:
	bl GF_AssertFail
	mov r0, #0
	pop {r4, pc}
_0225E2CC:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0225E2D0: .word 0x00002EDC
	thumb_func_end ov93_0225E27C

	thumb_func_start ov93_0225E2D4
ov93_0225E2D4: ; 0x0225E2D4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0225E2F8 ; =0x00002F28
	mov r1, #0x3c
	ldr r0, [r4, r0]
	bl _s32_div_f
	ldr r0, _0225E2FC ; =0x0000176C
	add r2, r1, #0
	add r3, r4, r0
	mov r0, #0x14
	mul r2, r0
	ldr r1, [r3, r2]
	add r0, r3, r2
	cmp r1, #0
	bne _0225E2F6
	mov r0, #0
_0225E2F6:
	pop {r4, pc}
	.balign 4, 0
_0225E2F8: .word 0x00002F28
_0225E2FC: .word 0x0000176C
	thumb_func_end ov93_0225E2D4

	thumb_func_start ov93_0225E300
ov93_0225E300: ; 0x0225E300
	push {r3, r4, r5, lr}
	ldr r2, _0225E364 ; =0x00002FC4
	add r5, r0, #0
	ldr r1, [r5, r2]
	cmp r1, #0
	ble _0225E314
	sub r0, r1, #1
	str r0, [r5, r2]
	mov r0, #0
	pop {r3, r4, r5, pc}
_0225E314:
	add r1, r2, #0
	sub r1, #0xe8
	ldr r1, [r5, r1]
	cmp r1, #0
	beq _0225E338
	sub r2, #0xe8
	add r1, r5, r2
	bl ov93_02262724
	cmp r0, #1
	bne _0225E334
	ldr r0, _0225E368 ; =0x00002EDC
	mov r1, #0
	str r1, [r5, r0]
	mov r0, #1
	pop {r3, r4, r5, pc}
_0225E334:
	mov r0, #0
	pop {r3, r4, r5, pc}
_0225E338:
	bl ov93_0225E2D4
	add r4, r0, #0
	bne _0225E344
	mov r0, #0
	pop {r3, r4, r5, pc}
_0225E344:
	add r0, r5, #0
	add r1, r4, #0
	bl ov93_02262724
	cmp r0, #1
	bne _0225E360
	mov r0, #0
	str r0, [r4]
	ldr r0, _0225E36C ; =0x00002F28
	ldr r1, [r5, r0]
	add r1, r1, #1
	str r1, [r5, r0]
	mov r0, #1
	pop {r3, r4, r5, pc}
_0225E360:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0225E364: .word 0x00002FC4
_0225E368: .word 0x00002EDC
_0225E36C: .word 0x00002F28
	thumb_func_end ov93_0225E300

	thumb_func_start ov93_0225E370
ov93_0225E370: ; 0x0225E370
	push {r3, r4, r5, lr}
	ldr r1, _0225E3B4 ; =0x00002EF0
	add r5, r0, #0
	add r1, r5, r1
	bl ov93_022627C0
	cmp r0, #1
	beq _0225E3B2
	ldr r0, [r5]
	mov r4, #0
	add r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	ble _0225E3B2
_0225E38C:
	ldr r1, [r5]
	add r0, r5, #0
	add r1, r1, r4
	add r1, #0x2c
	ldrb r1, [r1]
	bl ov93_0225E1A0
	add r1, r0, #0
	beq _0225E3A6
	add r0, r5, #0
	bl ov93_022627C0
	b _0225E38C
_0225E3A6:
	ldr r0, [r5]
	add r4, r4, #1
	add r0, #0x30
	ldrb r0, [r0]
	cmp r4, r0
	blt _0225E38C
_0225E3B2:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0225E3B4: .word 0x00002EF0
	thumb_func_end ov93_0225E370

	thumb_func_start ov93_0225E3B8
ov93_0225E3B8: ; 0x0225E3B8
	ldr r1, _0225E3C0 ; =0x00002FC8
	ldr r0, [r0, r1]
	bx lr
	nop
_0225E3C0: .word 0x00002FC8
	thumb_func_end ov93_0225E3B8

	thumb_func_start ov93_0225E3C4
ov93_0225E3C4: ; 0x0225E3C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r7, r1, #0
	bl sub_0203769C
	mov r6, #0xff
	add r4, r6, #0
	mov r1, #0
	b _0225E3F6
_0225E3D8:
	ldr r2, [r5]
	add r2, r2, r1
	add r2, #0x2c
	ldrb r2, [r2]
	cmp r0, r2
	bne _0225E3E6
	add r4, r1, #0
_0225E3E6:
	ldr r2, [r5]
	add r2, r2, r1
	add r2, #0x2c
	ldrb r2, [r2]
	cmp r7, r2
	bne _0225E3F4
	add r6, r1, #0
_0225E3F4:
	add r1, r1, #1
_0225E3F6:
	ldr r2, [r5]
	add r2, #0x30
	ldrb r2, [r2]
	cmp r1, r2
	blt _0225E3D8
	mov r0, #0
	cmp r6, #0xff
	beq _0225E40C
	cmp r4, #0xff
	beq _0225E40C
	mov r0, #1
_0225E40C:
	cmp r0, #0
	bne _0225E414
	bl GF_AssertFail
_0225E414:
	mov r1, #0
	ldr r0, _0225E458 ; =ov93_02262A54
	b _0225E440
_0225E41A:
	ldr r2, [r5]
	add r2, #0x30
	ldrb r2, [r2]
	lsl r2, r2, #2
	add r2, r0, r2
	ldrb r2, [r1, r2]
	cmp r4, r2
	bne _0225E42C
	str r1, [sp]
_0225E42C:
	ldr r2, [r5]
	add r2, #0x30
	ldrb r2, [r2]
	lsl r2, r2, #2
	add r2, r0, r2
	ldrb r2, [r1, r2]
	cmp r6, r2
	bne _0225E43E
	str r1, [sp, #4]
_0225E43E:
	add r1, r1, #1
_0225E440:
	ldr r2, [r5]
	add r2, #0x30
	ldrb r2, [r2]
	cmp r1, r2
	blt _0225E41A
	ldr r1, [sp, #4]
	ldr r0, [sp]
	sub r0, r1, r0
	bpl _0225E454
	add r0, r0, r2
_0225E454:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225E458: .word ov93_02262A54
	thumb_func_end ov93_0225E3C4

	thumb_func_start ov93_0225E45C
ov93_0225E45C: ; 0x0225E45C
	push {r4, lr}
	ldr r3, [r0]
	mov r2, #0
	add r0, r3, #0
	add r0, #0x30
	ldrb r4, [r0]
	cmp r4, #0
	ble _0225E482
_0225E46C:
	add r0, r3, #0
	add r0, #0x2c
	ldrb r0, [r0]
	cmp r1, r0
	bne _0225E47A
	add r0, r2, #0
	pop {r4, pc}
_0225E47A:
	add r2, r2, #1
	add r3, r3, #1
	cmp r2, r4
	blt _0225E46C
_0225E482:
	bl GF_AssertFail
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov93_0225E45C

	thumb_func_start ov93_0225E48C
ov93_0225E48C: ; 0x0225E48C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0225E4AC ; =0x00002FD4
	add r4, r1, #0
	ldr r0, [r5, r0]
	add r6, r2, #0
	cmp r0, #0
	beq _0225E4A0
	bl GF_AssertFail
_0225E4A0:
	ldr r0, _0225E4AC ; =0x00002FD4
	str r4, [r5, r0]
	add r0, r0, #4
	str r6, [r5, r0]
	pop {r4, r5, r6, pc}
	nop
_0225E4AC: .word 0x00002FD4
	thumb_func_end ov93_0225E48C

	thumb_func_start ov93_0225E4B0
ov93_0225E4B0: ; 0x0225E4B0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0225E538 ; =0x00002FD4
	mov r1, #0
	ldr r2, [r4, r0]
	cmp r2, #6
	bhi _0225E508
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0225E4CA: ; jump table
	.short _0225E508 - _0225E4CA - 2 ; case 0
	.short _0225E4D8 - _0225E4CA - 2 ; case 1
	.short _0225E4DC - _0225E4CA - 2 ; case 2
	.short _0225E4E0 - _0225E4CA - 2 ; case 3
	.short _0225E4E4 - _0225E4CA - 2 ; case 4
	.short _0225E4F0 - _0225E4CA - 2 ; case 5
	.short _0225E4FC - _0225E4CA - 2 ; case 6
_0225E4D8:
	mov r1, #1
	b _0225E50C
_0225E4DC:
	mov r1, #1
	b _0225E50C
_0225E4E0:
	mov r1, #1
	b _0225E50C
_0225E4E4:
	sub r0, #8
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _0225E50C
	mov r1, #1
	b _0225E50C
_0225E4F0:
	ldr r0, _0225E53C ; =0x0000339C
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0225E50C
	mov r1, #1
	b _0225E50C
_0225E4FC:
	ldr r0, _0225E540 ; =0x00001768
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _0225E50C
	mov r1, #1
	b _0225E50C
_0225E508:
	mov r0, #0
	pop {r4, pc}
_0225E50C:
	cmp r1, #1
	bne _0225E534
	ldr r0, _0225E544 ; =0x00002FD8
	ldr r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_02037AC0
	add r0, r4, #0
	bl ov93_0225E0F4
	cmp r0, #1
	bne _0225E52A
	mov r1, #7
	b _0225E52C
_0225E52A:
	mov r1, #0
_0225E52C:
	ldr r0, _0225E538 ; =0x00002FD4
	str r1, [r4, r0]
	mov r0, #1
	pop {r4, pc}
_0225E534:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0225E538: .word 0x00002FD4
_0225E53C: .word 0x0000339C
_0225E540: .word 0x00001768
_0225E544: .word 0x00002FD8
	thumb_func_end ov93_0225E4B0

	thumb_func_start ov93_0225E548
ov93_0225E548: ; 0x0225E548
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0225E580 ; =0x00002FD4
	ldr r2, [r4, r0]
	cmp r2, #7
	beq _0225E558
	mov r0, #0
	pop {r4, pc}
_0225E558:
	add r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, r1
	beq _0225E564
	mov r0, #0
	pop {r4, pc}
_0225E564:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_02037B38
	cmp r0, #1
	bne _0225E57A
	ldr r0, _0225E580 ; =0x00002FD4
	mov r1, #0
	str r1, [r4, r0]
	mov r0, #1
	pop {r4, pc}
_0225E57A:
	mov r0, #0
	pop {r4, pc}
	nop
_0225E580: .word 0x00002FD4
	thumb_func_end ov93_0225E548

	thumb_func_start ov93_0225E584
ov93_0225E584: ; 0x0225E584
	push {r4, lr}
	add r4, r1, #0
	ldr r1, [r4, #0xc]
	cmp r1, #5
	bhi _0225E616
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0225E59A: ; jump table
	.short _0225E5A6 - _0225E59A - 2 ; case 0
	.short _0225E5B6 - _0225E59A - 2 ; case 1
	.short _0225E5CE - _0225E59A - 2 ; case 2
	.short _0225E5DC - _0225E59A - 2 ; case 3
	.short _0225E5F4 - _0225E59A - 2 ; case 4
	.short _0225E602 - _0225E59A - 2 ; case 5
_0225E5A6:
	ldrb r2, [r4, #0x18]
	mov r1, #1
	bl ov93_0226297C
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _0225E616
_0225E5B6:
	ldrb r1, [r4, #0x18]
	bl ov93_0225E548
	cmp r0, #1
	bne _0225E616
	ldrb r0, [r4, #0x18]
	add r0, r0, #1
	strb r0, [r4, #0x18]
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _0225E616
_0225E5CE:
	ldrb r1, [r4, #0x18]
	bl ov93_022629B8
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _0225E616
_0225E5DC:
	ldrb r1, [r4, #0x18]
	bl ov93_0225E548
	cmp r0, #1
	bne _0225E616
	ldrb r0, [r4, #0x18]
	add r0, r0, #1
	strb r0, [r4, #0x18]
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _0225E616
_0225E5F4:
	ldrb r1, [r4, #0x18]
	bl ov93_022628F4
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _0225E616
_0225E602:
	ldrb r1, [r4, #0x18]
	bl ov93_0225E548
	cmp r0, #1
	bne _0225E616
	ldrb r0, [r4, #0x18]
	add r0, r0, #1
	strb r0, [r4, #0x18]
	mov r0, #1
	pop {r4, pc}
_0225E616:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov93_0225E584

	thumb_func_start ov93_0225E61C
ov93_0225E61C: ; 0x0225E61C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r1, _0225E6E8 ; =0x00002FB4
	ldr r0, _0225E6EC ; =0x00000516
	ldr r2, [r5, r1]
	cmp r2, r0
	bls _0225E64C
	add r0, r1, #0
	add r0, #0x20
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _0225E64C
	add r0, r1, #0
	sub r0, #0xd8
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _0225E64C
	sub r1, #0xc4
	ldr r0, [r5, r1]
	cmp r0, #0
	bne _0225E64C
	mov r0, #1
	pop {r3, r4, r5, pc}
_0225E64C:
	ldr r0, [r4, #0xc]
	cmp r0, #3
	bhi _0225E6E4
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225E65E: ; jump table
	.short _0225E666 - _0225E65E - 2 ; case 0
	.short _0225E684 - _0225E65E - 2 ; case 1
	.short _0225E69E - _0225E65E - 2 ; case 2
	.short _0225E6CE - _0225E65E - 2 ; case 3
_0225E666:
	ldr r0, _0225E6F0 ; =0x00002FC8
	ldr r0, [r5, r0]
	bl ov93_0225FDF4
	ldr r1, _0225E6F0 ; =0x00002FC8
	add r2, r0, #0
	ldrb r3, [r4, #0x18]
	ldr r1, [r5, r1]
	add r0, r5, #0
	bl ov93_02262884
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _0225E6E4
_0225E684:
	ldrb r1, [r4, #0x18]
	add r0, r5, #0
	bl ov93_0225E548
	cmp r0, #1
	bne _0225E6E4
	ldrb r0, [r4, #0x18]
	add r0, r0, #1
	strb r0, [r4, #0x18]
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _0225E6E4
_0225E69E:
	ldr r0, _0225E6F4 ; =0x00001434
	ldr r1, [r5, r0]
	cmp r1, #0
	beq _0225E6E4
	sub r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, r1
	blt _0225E6E4
	ldr r0, _0225E6F0 ; =0x00002FC8
	ldr r1, [r5, r0]
	add r1, r1, #1
	str r1, [r5, r0]
	add r0, r5, #0
	bl ov93_0225E3B8
	add r1, r0, #0
	ldrb r2, [r4, #0x18]
	add r0, r5, #0
	bl ov93_02262830
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _0225E6E4
_0225E6CE:
	ldrb r1, [r4, #0x18]
	add r0, r5, #0
	bl ov93_0225E548
	cmp r0, #1
	bne _0225E6E4
	ldrb r0, [r4, #0x18]
	add r0, r0, #1
	strb r0, [r4, #0x18]
	mov r0, #0
	str r0, [r4, #0xc]
_0225E6E4:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0225E6E8: .word 0x00002FB4
_0225E6EC: .word 0x00000516
_0225E6F0: .word 0x00002FC8
_0225E6F4: .word 0x00001434
	thumb_func_end ov93_0225E61C

	thumb_func_start ov93_0225E6F8
ov93_0225E6F8: ; 0x0225E6F8
	push {r4, lr}
	add r4, r1, #0
	ldr r1, [r4, #0xc]
	cmp r1, #3
	bhi _0225E75E
	add r2, r1, r1
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0225E70E: ; jump table
	.short _0225E716 - _0225E70E - 2 ; case 0
	.short _0225E724 - _0225E70E - 2 ; case 1
	.short _0225E73C - _0225E70E - 2 ; case 2
	.short _0225E748 - _0225E70E - 2 ; case 3
_0225E716:
	ldrb r1, [r4, #0x18]
	bl ov93_02262934
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _0225E75E
_0225E724:
	ldrb r1, [r4, #0x18]
	bl ov93_0225E548
	cmp r0, #1
	bne _0225E75E
	ldrb r0, [r4, #0x18]
	add r0, r0, #1
	strb r0, [r4, #0x18]
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _0225E75E
_0225E73C:
	ldr r0, [r0, #0x20]
	cmp r0, #8
	bne _0225E75E
	add r0, r1, #1
	str r0, [r4, #0xc]
	b _0225E75E
_0225E748:
	ldr r1, [r4, #0x14]
	add r1, r1, #1
	str r1, [r4, #0x14]
	cmp r1, #0x5a
	blt _0225E75E
	bl ov93_02262748
	cmp r0, #1
	bne _0225E75E
	mov r0, #1
	pop {r4, pc}
_0225E75E:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov93_0225E6F8

	thumb_func_start ov93_0225E764
ov93_0225E764: ; 0x0225E764
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov93_0225E0F4
	cmp r0, #0
	bne _0225E774
	mov r0, #0
	pop {r3, r4, r5, pc}
_0225E774:
	add r0, r5, #0
	add r0, #0xb8
	ldr r2, [r0]
	add r4, r5, #0
	add r4, #0xb8
	cmp r2, #3
	blo _0225E786
	mov r0, #1
	pop {r3, r4, r5, pc}
_0225E786:
	lsl r3, r2, #2
	ldr r2, _0225E7A8 ; =ov93_02262A20
	add r0, r5, #0
	ldr r2, [r2, r3]
	add r1, r4, #0
	blx r2
	cmp r0, #1
	bne _0225E7A4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #0
	str r0, [r4, #0xc]
	str r0, [r4, #0x14]
	str r0, [r4, #0x10]
_0225E7A4:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0225E7A8: .word ov93_02262A20
	thumb_func_end ov93_0225E764

	thumb_func_start ov93_0225E7AC
ov93_0225E7AC: ; 0x0225E7AC
	bx lr
	.balign 4, 0
	thumb_func_end ov93_0225E7AC

	thumb_func_start ov93_0225E7B0
ov93_0225E7B0: ; 0x0225E7B0
	push {r3, r4, r5, lr}
	mov r1, #0x9e
	add r5, r0, #0
	mov r0, #0x75
	lsl r1, r1, #2
	bl AllocFromHeap
	mov r2, #0x9e
	mov r1, #0
	lsl r2, r2, #2
	add r4, r0, #0
	bl MI_CpuFill8
	ldr r0, [r5]
	ldr r1, [r0, #0x34]
	mov r0, #0x27
	lsl r0, r0, #4
	str r1, [r4, r0]
	add r0, r4, #0
	bl ov93_0225EC98
	add r0, r4, #0
	bl ov93_0225EF0C
	add r0, r4, #0
	bl ov93_0225EF5C
	ldr r0, [r5]
	ldr r0, [r0, #0x34]
	cmp r0, #1
	beq _0225E806
	cmp r0, #2
	bne _0225E81A
	mov r1, #1
	mov r0, #0x26
	lsl r1, r1, #0x12
	lsl r0, r0, #4
	str r1, [r4, r0]
	mov r1, #0x1a
	lsl r1, r1, #0xe
	add r0, r0, #4
	str r1, [r4, r0]
	b _0225E828
_0225E806:
	mov r1, #9
	mov r0, #0x26
	lsl r1, r1, #0x10
	lsl r0, r0, #4
	str r1, [r4, r0]
	mov r1, #7
	lsl r1, r1, #0x10
	add r0, r0, #4
	str r1, [r4, r0]
	b _0225E828
_0225E81A:
	mov r1, #6
	mov r0, #0x26
	lsl r1, r1, #0x10
	lsl r0, r0, #4
	str r1, [r4, r0]
	add r0, r0, #4
	str r1, [r4, r0]
_0225E828:
	mov r0, #0x87
	mov r1, #0x80
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r1, #0x28
	add r0, r0, #4
	str r1, [r4, r0]
	add r0, r5, #0
	bl ov93_0225F9D8
	add r0, r5, #0
	bl ov93_0225FB00
	mov r1, #0x8d
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r1, [r4, r1]
	add r0, r4, #0
	bl ov93_0225FB6C
	mov r1, #2
	mov r0, #0x92
	lsl r1, r1, #0xc
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov93_0225E7B0

	thumb_func_start ov93_0225E860
ov93_0225E860: ; 0x0225E860
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x8d
	add r4, r1, #0
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov93_0225FBE4
	add r0, r5, #0
	bl ov93_0225FABC
	ldr r0, [r4]
	bl FreeToHeap
	mov r0, #0x93
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0x25
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, pc}
	thumb_func_end ov93_0225E860

	thumb_func_start ov93_0225E898
ov93_0225E898: ; 0x0225E898
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r1, #0
	mov r1, #0x91
	add r5, r0, #0
	mov r0, #0
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r5, #0x20]
	cmp r0, #2
	bne _0225E8D8
	ldr r0, _0225EA38 ; =0x00001758
	add r2, r1, #0
	ldr r3, [r5, r0]
	sub r2, #0x38
	str r3, [r4, r2]
	add r2, r0, #4
	ldr r3, [r5, r2]
	add r2, r1, #0
	sub r2, #0x34
	str r3, [r4, r2]
	add r2, r0, #0
	add r2, #8
	ldr r3, [r5, r2]
	add r2, r1, #0
	sub r2, #0x30
	str r3, [r4, r2]
	add r0, #0xc
	ldr r0, [r5, r0]
	sub r1, #0x2c
	str r0, [r4, r1]
	b _0225E920
_0225E8D8:
	ldr r0, _0225EA3C ; =0x00002FB8
	ldr r2, [r5, r0]
	cmp r2, #0
	beq _0225E8E8
	add r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #1
	bne _0225E900
_0225E8E8:
	mov r1, #0x83
	lsl r1, r1, #2
	mov r2, #0
	str r2, [r4, r1]
	add r0, r1, #4
	str r2, [r4, r0]
	add r0, r1, #0
	add r0, #8
	str r2, [r4, r0]
	add r1, #0xc
	str r2, [r4, r1]
	b _0225E920
_0225E900:
	ldr r2, _0225EA40 ; =gSystem + 0x40
	add r0, r1, #0
	ldrh r3, [r2, #0x20]
	sub r0, #0x38
	str r3, [r4, r0]
	add r0, r1, #0
	ldrh r3, [r2, #0x22]
	sub r0, #0x34
	str r3, [r4, r0]
	add r0, r1, #0
	ldrh r3, [r2, #0x26]
	sub r0, #0x30
	sub r1, #0x2c
	str r3, [r4, r0]
	ldrh r0, [r2, #0x24]
	str r0, [r4, r1]
_0225E920:
	add r0, r4, #0
	bl ov93_0225F370
	mov r0, #0x85
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0225E946
	add r0, r4, #0
	bl ov93_0225EB38
	ldr r0, [r4, #0x20]
	cmp r0, #0
	bne _0225E946
	bne _0225E946
	mov r0, #0x9d
	mov r1, #0
	lsl r0, r0, #2
	strb r1, [r4, r0]
_0225E946:
	add r0, r4, #0
	bl ov93_0225F44C
	add r0, r4, #0
	bl ov93_0225EB70
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, r4, #0
	bl ov93_0225FB6C
	mov r0, #0x9a
	lsl r0, r0, #2
	ldrsh r1, [r4, r0]
	cmp r1, #0
	ble _0225E97C
	add r1, #8
	strh r1, [r4, r0]
	ldrsh r1, [r4, r0]
	cmp r1, #0x1e
	ble _0225E976
	mov r1, #0x1e
	strh r1, [r4, r0]
_0225E976:
	add r0, r4, #0
	bl ov93_0225EDFC
_0225E97C:
	ldr r0, _0225EA44 ; =0x00002FBC
	ldr r1, [r5, r0]
	cmp r1, #0
	bne _0225EA34
	sub r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #1
	bne _0225EA34
	mov r2, #0x91
	lsl r2, r2, #2
	ldr r1, [r4, r2]
	cmp r1, #0
	ble _0225EA34
	add r0, r2, #0
	add r0, #0x18
	ldr r0, [r4, r0]
	add r2, #0xdc
	mov r7, #0
	cmp r0, r2
	bge _0225E9C4
	add r0, r4, #0
	bl ov93_0225EDB8
	cmp r0, #1
	bne _0225E9D4
	mov r0, #0x9a
	mov r1, #8
	lsl r0, r0, #2
	strh r1, [r4, r0]
	add r1, r7, #0
	add r0, #0xd
	strb r1, [r4, r0]
	ldr r0, _0225EA48 ; =0x0000058E
	bl PlaySE
	b _0225E9D4
_0225E9C4:
	add r0, r4, #0
	bl ov93_0225EDE8
	mov r0, #0x9a
	add r1, r7, #0
	lsl r0, r0, #2
	strh r1, [r4, r0]
	mov r7, #1
_0225E9D4:
	mov r1, #0x91
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, r4, #0
	bl ov93_0225EA6C
	add r6, r0, #0
	cmp r7, #1
	bne _0225E9F2
	mov r0, #0x19
	mul r0, r6
	mov r1, #0x64
	bl _s32_div_f
	add r6, r6, r0
_0225E9F2:
	ldr r1, _0225EA4C ; =0x00002FC8
	add r0, r5, #0
	ldr r1, [r5, r1]
	add r2, r6, #0
	add r3, sp, #0
	bl ov93_02260F14
	add r0, r5, #0
	add r1, sp, #0
	bl ov93_02260F3C
	add r0, r5, #0
	add r1, sp, #0
	bl ov93_0225FEC4
	mov r1, #0x91
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, r4, #0
	bl ov93_0225EA98
	mov r2, #0x91
	lsl r2, r2, #2
	ldr r2, [r4, r2]
	add r0, r5, #0
	add r1, r4, #0
	add r3, r7, #0
	bl ov93_0225EAE0
	mov r0, #0x91
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
_0225EA34:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225EA38: .word 0x00001758
_0225EA3C: .word 0x00002FB8
_0225EA40: .word gSystem + 0x40
_0225EA44: .word 0x00002FBC
_0225EA48: .word 0x0000058E
_0225EA4C: .word 0x00002FC8
	thumb_func_end ov93_0225E898

	thumb_func_start ov93_0225EA50
ov93_0225EA50: ; 0x0225EA50
	push {r3, lr}
	ldr r0, _0225EA68 ; =0x00000276
	ldrb r2, [r1, r0]
	cmp r2, #1
	bne _0225EA64
	mov r2, #0
	strb r2, [r1, r0]
	add r0, r1, #0
	bl ov93_0225ED3C
_0225EA64:
	pop {r3, pc}
	nop
_0225EA68: .word 0x00000276
	thumb_func_end ov93_0225EA50

	thumb_func_start ov93_0225EA6C
ov93_0225EA6C: ; 0x0225EA6C
	cmp r1, #0x62
	blt _0225EA76
	mov r2, #0x4b
	lsl r2, r2, #4
	b _0225EA7A
_0225EA76:
	mov r2, #0xa
	mul r2, r1
_0225EA7A:
	mov r1, #0x27
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	ldr r3, _0225EA90 ; =_s32_div_f
	lsl r1, r0, #2
	ldr r0, _0225EA94 ; =ov93_022630D8
	ldr r0, [r0, r1]
	mov r1, #0x64
	mul r0, r2
	bx r3
	nop
_0225EA90: .word _s32_div_f
_0225EA94: .word ov93_022630D8
	thumb_func_end ov93_0225EA6C

	thumb_func_start ov93_0225EA98
ov93_0225EA98: ; 0x0225EA98
	mov r2, #0x91
	lsl r2, r2, #2
	ldr r1, [r0, r2]
	cmp r1, #0x62
	blt _0225EAB2
	add r1, r2, #4
	ldr r3, [r0, r1]
	mov r1, #1
	lsl r1, r1, #0xc
	add r3, r3, r1
	add r1, r2, #4
	str r3, [r0, r1]
	b _0225EACC
_0225EAB2:
	blt _0225EAC4
	add r1, r2, #4
	ldr r3, [r0, r1]
	mov r1, #1
	lsl r1, r1, #0xc
	add r3, r3, r1
	add r1, r2, #4
	str r3, [r0, r1]
	b _0225EACC
_0225EAC4:
	mov r3, #2
	lsl r3, r3, #0xc
	add r1, r2, #4
	str r3, [r0, r1]
_0225EACC:
	mov r1, #0x92
	lsl r1, r1, #2
	mov r2, #0x11
	ldr r3, [r0, r1]
	lsl r2, r2, #0xc
	cmp r3, r2
	ble _0225EADC
	str r2, [r0, r1]
_0225EADC:
	bx lr
	.balign 4, 0
	thumb_func_end ov93_0225EA98

	thumb_func_start ov93_0225EAE0
ov93_0225EAE0: ; 0x0225EAE0
	push {r3, lr}
	cmp r3, #1
	bne _0225EAFE
	mov r2, #0x91
	lsl r2, r2, #2
	ldr r2, [r1, r2]
	cmp r2, #0x62
	blt _0225EAFE
	mov r1, #0
	bl ov93_0225D700
	ldr r0, _0225EB34 ; =0x00000592
	bl PlaySE
	pop {r3, pc}
_0225EAFE:
	mov r2, #0x91
	lsl r2, r2, #2
	ldr r2, [r1, r2]
	cmp r2, #0x62
	bge _0225EB32
	ldr r2, [r1, #0x20]
	ldr r1, [r1, #0x10]
	cmp r1, r2
	bge _0225EB20
	mov r1, #2
	bl ov93_0225D700
	mov r0, #0x59
	lsl r0, r0, #4
	bl PlaySE
	pop {r3, pc}
_0225EB20:
	cmp r1, r2
	ble _0225EB32
	mov r1, #1
	bl ov93_0225D700
	mov r0, #0x59
	lsl r0, r0, #4
	bl PlaySE
_0225EB32:
	pop {r3, pc}
	.balign 4, 0
_0225EB34: .word 0x00000592
	thumb_func_end ov93_0225EAE0

	thumb_func_start ov93_0225EB38
ov93_0225EB38: ; 0x0225EB38
	push {r4, lr}
	mov r1, #0x8e
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r2, [r4, r1]
	cmp r2, #0
	beq _0225EB6C
	mov r2, #0
	str r2, [r4, r1]
	sub r2, r2, #1
	add r1, r1, #4
	str r2, [r4, r1]
	bl ov93_0225F9AC
	mov r1, #9
	lsl r1, r1, #6
	ldr r2, [r4, r1]
	sub r2, r2, r0
	add r0, r1, #4
	str r2, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0x19
	bge _0225EB6C
	mov r2, #0
	add r0, r1, #4
	str r2, [r4, r0]
_0225EB6C:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov93_0225EB38

	thumb_func_start ov93_0225EB70
ov93_0225EB70: ; 0x0225EB70
	push {r4, r5, r6, lr}
	sub sp, #0x38
	add r5, r0, #0
	ldr r0, _0225EC80 ; =0x2D8B6127
	add r1, sp, #0x1c
	str r0, [sp, #0x1c]
	mov r0, #0x32
	mov r2, #1
	bl NNS_G3dGeBufferOP_N
	ldr r0, _0225EC84 ; =0x00007FFF
	add r1, sp, #0x18
	str r0, [sp, #0x18]
	mov r0, #0x33
	mov r2, #1
	bl NNS_G3dGeBufferOP_N
	mov r1, #0
	mov r0, #0x11
	add r2, r1, #0
	bl NNS_G3dGeBufferOP_N
	mov r0, #0
	str r0, [sp, #0x2c]
	mov r0, #0x13
	lsl r0, r0, #0xc
	str r0, [sp, #0x30]
	ldr r0, _0225EC88 ; =0xFFFFB000
	add r1, sp, #0x2c
	str r0, [sp, #0x34]
	mov r0, #0x1c
	mov r2, #3
	bl NNS_G3dGeBufferOP_N
	mov r0, #0x99
	lsl r0, r0, #2
	ldr r4, [r5, r0]
	add r0, r0, #6
	ldrsh r0, [r5, r0]
	mov r1, #0x64
	mul r0, r4
	bl _s32_div_f
	mov r1, #0x26
	lsl r1, r1, #4
	add r6, r4, r0
	add r0, r1, #0
	ldr r4, [r5, r1]
	add r0, #8
	add r1, #0xc
	ldrsh r2, [r5, r0]
	ldrsh r0, [r5, r1]
	mov r1, #0x64
	add r0, r2, r0
	mul r0, r4
	bl _s32_div_f
	add r0, r4, r0
	str r0, [sp, #0x20]
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [sp, #0x28]
	mov r0, #0x1b
	add r1, sp, #0x20
	mov r2, #3
	str r6, [sp, #0x24]
	bl NNS_G3dGeBufferOP_N
	mov r0, #3
	str r0, [sp, #0x14]
	mov r0, #0x10
	add r1, sp, #0x14
	mov r2, #1
	bl NNS_G3dGeBufferOP_N
	mov r1, #0
	mov r0, #0x15
	add r2, r1, #0
	bl NNS_G3dGeBufferOP_N
	mov r0, #2
	str r0, [sp, #0x10]
	mov r0, #0x10
	add r1, sp, #0x10
	mov r2, #1
	bl NNS_G3dGeBufferOP_N
	mov r0, #1
	add r1, r0, #0
	bl ov93_0225EE4C
	bl ov93_0225EE98
	ldr r1, [r5, #4]
	mov r2, #1
	ldr r0, [r1, #0x2c]
	lsl r4, r0, #0x10
	ldr r0, [r1, #8]
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	ldr r0, _0225EC8C ; =0x1FFFFFFF
	and r1, r0
	ldr r0, _0225EC90 ; =0x72400000
	orr r0, r1
	str r0, [sp, #0xc]
	mov r0, #0x2a
	add r1, sp, #0xc
	bl NNS_G3dGeBufferOP_N
	lsr r0, r4, #0x11
	str r0, [sp, #8]
	mov r0, #0x2b
	add r1, sp, #8
	mov r2, #1
	bl NNS_G3dGeBufferOP_N
	ldr r0, _0225EC94 ; =0x001F00C1
	add r1, sp, #4
	str r0, [sp, #4]
	mov r0, #0x29
	mov r2, #1
	bl NNS_G3dGeBufferOP_N
	add r0, r5, #0
	bl ov93_0225EFAC
	mov r2, #1
	mov r0, #0x12
	add r1, sp, #0
	str r2, [sp]
	bl NNS_G3dGeBufferOP_N
	bl NNS_G3dGeFlushBuffer
	add sp, #0x38
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0225EC80: .word 0x2D8B6127
_0225EC84: .word 0x00007FFF
_0225EC88: .word 0xFFFFB000
_0225EC8C: .word 0x1FFFFFFF
_0225EC90: .word 0x72400000
_0225EC94: .word 0x001F00C1
	thumb_func_end ov93_0225EB70

	thumb_func_start ov93_0225EC98
ov93_0225EC98: ; 0x0225EC98
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0xc9
	mov r1, #0x1d
	mov r2, #0x75
	bl AllocAndReadWholeNarcMemberByIdPair
	str r0, [r5]
	bl NNS_G3dGetTex
	str r0, [r5, #4]
	bl AllocAndLoad3dTexResources
	ldr r6, [r5, #4]
	ldrh r0, [r6, #0x30]
	ldr r7, [r6, #0x38]
	lsl r4, r0, #3
	ldr r0, [r6, #0x2c]
	lsl r0, r0, #0x10
	lsr r0, r0, #0xd
	str r0, [sp]
	mov r0, #0x93
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0225ECD0
	bl GF_AssertFail
_0225ECD0:
	mov r0, #0x75
	add r1, r4, #0
	bl AllocFromHeap
	mov r1, #0x93
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0x75
	add r1, r4, #0
	bl AllocFromHeap
	mov r1, #0x25
	lsl r1, r1, #4
	str r0, [r5, r1]
	sub r1, r1, #4
	ldr r1, [r5, r1]
	add r0, r6, r7
	add r2, r4, #0
	bl MI_CpuCopy8
	mov r1, #0x25
	lsl r1, r1, #4
	ldr r1, [r5, r1]
	add r0, r6, r7
	add r2, r4, #0
	bl MI_CpuCopy8
	mov r0, #0x25
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl DC_FlushRange
	mov r1, #0x96
	ldr r0, [sp]
	lsl r1, r1, #2
	str r0, [r5, r1]
	sub r0, r1, #4
	str r4, [r5, r0]
	ldr r0, [r5, #4]
	ldr r0, [r0, #0x14]
	cmp r0, #0
	bne _0225ED2A
	bl GF_AssertFail
_0225ED2A:
	ldr r2, [r5, #4]
	ldr r0, [r5]
	ldr r1, [r2, #0x14]
	add r1, r2, r1
	sub r1, r1, r0
	bl ReallocFromHeap
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov93_0225EC98

	thumb_func_start ov93_0225ED3C
ov93_0225ED3C: ; 0x0225ED3C
	push {r4, lr}
	add r4, r0, #0
	bl GX_BeginLoadTexPltt
	mov r2, #0x25
	lsl r2, r2, #4
	add r1, r2, #0
	ldr r0, [r4, r2]
	add r1, #8
	add r2, r2, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	bl GX_LoadTexPltt
	bl GX_EndLoadTexPltt
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov93_0225ED3C

	thumb_func_start ov93_0225ED60
ov93_0225ED60: ; 0x0225ED60
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	lsl r0, r1, #1
	add r0, r1, r0
	mov r1, #0x32
	lsl r0, r0, #0xa
	lsl r1, r1, #4
	bl _s32_div_f
	add r0, #0x80
	asr r3, r0, #8
	cmp r3, #0x10
	ble _0225ED7E
	mov r3, #0x10
_0225ED7E:
	mov r2, #0x93
	mov r0, #0x1f
	lsl r2, r2, #2
	str r0, [sp]
	add r1, r2, #4
	ldr r0, [r4, r2]
	add r2, #8
	ldr r2, [r4, r2]
	lsl r3, r3, #0x18
	lsl r2, r2, #0xf
	ldr r1, [r4, r1]
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl sub_02003DE8
	mov r1, #0x25
	lsl r1, r1, #4
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl DC_FlushRange
	ldr r0, _0225EDB4 ; =0x00000276
	mov r1, #1
	strb r1, [r4, r0]
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0225EDB4: .word 0x00000276
	thumb_func_end ov93_0225ED60

	thumb_func_start ov93_0225EDB8
ov93_0225EDB8: ; 0x0225EDB8
	push {r4, lr}
	mov r2, #0x97
	lsl r2, r2, #2
	ldr r3, [r0, r2]
	mov r4, #0
	add r1, r3, r1
	str r1, [r0, r2]
	add r1, r2, #0
	ldr r3, [r0, r2]
	add r1, #0xc4
	cmp r3, r1
	blt _0225EDD8
	add r1, r2, #0
	add r1, #0xc4
	str r1, [r0, r2]
	mov r4, #1
_0225EDD8:
	mov r1, #0x97
	lsl r1, r1, #2
	ldr r1, [r0, r1]
	bl ov93_0225ED60
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov93_0225EDB8

	thumb_func_start ov93_0225EDE8
ov93_0225EDE8: ; 0x0225EDE8
	mov r1, #0x97
	ldr r3, _0225EDF8 ; =ov93_0225ED60
	mov r2, #0
	lsl r1, r1, #2
	str r2, [r0, r1]
	ldr r1, [r0, r1]
	bx r3
	nop
_0225EDF8: .word ov93_0225ED60
	thumb_func_end ov93_0225EDE8

	thumb_func_start ov93_0225EDFC
ov93_0225EDFC: ; 0x0225EDFC
	push {r4, lr}
	mov r2, #0x9a
	add r4, r0, #0
	lsl r2, r2, #2
	ldrsh r1, [r4, r2]
	cmp r1, #0
	beq _0225EE44
	add r1, r2, #0
	add r1, #0xd
	ldrb r1, [r4, r1]
	add r3, r1, #1
	add r1, r2, #0
	add r1, #0xd
	strb r3, [r4, r1]
	add r1, r2, #0
	add r1, #0xd
	ldrb r1, [r4, r1]
	cmp r1, #4
	bne _0225EE32
	sub r2, #0xc
	ldr r2, [r4, r2]
	lsr r1, r2, #0x1f
	add r1, r2, r1
	asr r1, r1, #1
	bl ov93_0225ED60
	pop {r4, pc}
_0225EE32:
	cmp r1, #8
	bne _0225EE44
	sub r2, #0xc
	ldr r1, [r4, r2]
	bl ov93_0225ED60
	ldr r0, _0225EE48 ; =0x00000275
	mov r1, #0
	strb r1, [r4, r0]
_0225EE44:
	pop {r4, pc}
	nop
_0225EE48: .word 0x00000275
	thumb_func_end ov93_0225EDFC

	thumb_func_start ov93_0225EE4C
ov93_0225EE4C: ; 0x0225EE4C
	push {r4, lr}
	sub sp, #8
	add r4, r1, #0
	cmp r0, #0
	beq _0225EE5A
	mov r0, #1
	b _0225EE5C
_0225EE5A:
	mov r0, #0
_0225EE5C:
	lsl r1, r0, #0xf
	ldr r0, _0225EE90 ; =0x21085EF7
	mov r2, #1
	orr r0, r1
	str r0, [sp, #4]
	mov r0, #0x30
	add r1, sp, #4
	bl NNS_G3dGeBufferOP_N
	cmp r4, #0
	beq _0225EE76
	mov r0, #1
	b _0225EE78
_0225EE76:
	mov r0, #0
_0225EE78:
	lsl r1, r0, #0xf
	ldr r0, _0225EE94 ; =0x00007FFF
	mov r2, #1
	orr r0, r1
	str r0, [sp]
	mov r0, #0x31
	add r1, sp, #0
	bl NNS_G3dGeBufferOP_N
	add sp, #8
	pop {r4, pc}
	nop
_0225EE90: .word 0x21085EF7
_0225EE94: .word 0x00007FFF
	thumb_func_end ov93_0225EE4C

	.rodata

_022629F8:
	.word ov93_0225C768, ov93_0225CA8C, ov93_0225CD10, 0xFFFFFFFF

ov93_02262A08: ; 0x02262A08
	.word ov93_02262598, ov93_022625BC, ov93_022626E8, 0xFFFFFFFF

ov93_02262A18: ; 0x02262A18
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov93_02262A20: ; 0x02262A20
	.word ov93_0225E584, ov93_0225E61C, ov93_0225E6F8
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x1E, 0x88, 0x01, 0x00, 0x00, 0x50, 0x00, 0x00

ov93_02262A38: ; 0x02262A38
	.byte 0x00, 0x00, 0x00, 0x00, 0x1E, 0x88, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov93_02262A44: ; 0x02262A44
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00

ov93_02262A54: ; 0x02262A54
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x02, 0x01, 0x00, 0x00, 0x03, 0x01, 0x02

ov93_02262A68: ; 0x02262A68
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x02, 0x00, 0x00, 0x03, 0x01, 0x02

ov93_02262A7C: ; 0x02262A7C
	.byte 0x60, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x20, 0x00, 0x10, 0x00, 0x00, 0x00

ov93_02262A90: ; 0x02262A90
	.byte 0x60, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00

ov93_02262AA8: ; 0x02262AA8
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00

ov93_02262AC8: ; 0x02262AC8
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00

ov93_02262AF0: ; 0x02262AF0
	.byte 0x20, 0x00, 0x00, 0x00

ov93_02262AF4: ; 0x02262AF4
	.byte 0x27, 0x00, 0x00, 0x00

ov93_02262AF8: ; 0x02262AF8
	.byte 0x28, 0x00, 0x00, 0x00

ov93_02262AFC: ; 0x02262AFC
	.byte 0x29, 0x00, 0x00, 0x00

ov93_02262B00: ; 0x02262B00
	.byte 0x2A, 0x00, 0x00, 0x00, 0x21, 0x00, 0x00, 0x00, 0x2F, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00
	.byte 0x31, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x00
	.byte 0x34, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x00, 0x36, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00
	.byte 0x2B, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x2D, 0x00, 0x00, 0x00, 0x2E, 0x00, 0x00, 0x00

ov93_02262B40: ; 0x02262B40
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x02, 0x03
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x06, 0x04, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov93_02262B94: ; 0x02262B94
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x04, 0x04, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x08, 0x05
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x0C, 0x06, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
