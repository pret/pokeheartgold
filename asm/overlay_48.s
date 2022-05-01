	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov48_02258800
ov48_02258800: ; 0x02258800
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r0, #0
	bl OverlayManager_GetParentWork
	mov r2, #5
	add r5, r0, #0
	mov r0, #3
	mov r1, #0x70
	lsl r2, r2, #0x10
	bl CreateHeap
	ldr r1, _0225890C ; =0x0000C724
	add r0, r4, #0
	mov r2, #0x70
	bl OverlayManager_CreateAndGetData
	ldr r2, _0225890C ; =0x0000C724
	mov r1, #0
	add r4, r0, #0
	bl memset
	ldr r0, [r5, #4]
	bl sub_0202CA44
	str r0, [r4, #0xc]
	ldr r0, [r5, #4]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #0x10]
	ldr r0, [r4, #0xc]
	bl sub_0202CA8C
	str r0, [r4, #0x14]
	ldr r0, [r4, #0xc]
	bl sub_0202CA90
	str r0, [r4, #0x18]
	ldr r0, [r5, #8]
	add r1, r5, #0
	str r0, [r4, #0x1c]
	add r0, r4, #0
	bl ov48_022593F4
	add r0, r4, #0
	ldr r1, [r4, #0x10]
	add r0, #0x20
	mov r2, #0x70
	bl ov48_02259464
	mov r0, #0x5e
	lsl r0, r0, #2
	add r1, r4, #0
	add r0, r4, r0
	add r1, #0x20
	mov r2, #0x70
	bl ov48_02259824
	mov r0, #0x5a
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0x70
	bl ov48_0225B068
	mov r0, #0x70
	str r0, [sp, #4]
	mov r2, sp
	ldr r1, [r4, #4]
	ldr r0, [r4, #8]
	sub r2, r2, #4
	str r1, [r2]
	str r0, [r2, #4]
	mov r0, #0x89
	ldr r3, [r2]
	lsl r0, r0, #2
	add r2, r4, #0
	ldr r1, [r5]
	add r0, r4, r0
	add r2, #0x20
	bl ov48_022598EC
	add r3, r4, #4
	ldr r0, _02258910 ; =0x0000C3CC
	ldmia r3!, {r1, r2}
	add r0, r4, r0
	mov r3, #0x70
	bl ov48_02259BC0
	ldr r0, _02258914 ; =0x0000C3E0
	mov r2, #0x5a
	add r1, r4, #0
	lsl r2, r2, #2
	add r0, r4, r0
	add r1, #0x20
	add r2, r4, r2
	mov r3, #0x70
	bl ov48_02259D00
	mov r2, #0x70
	str r2, [sp]
	mov r0, #0xc7
	lsl r0, r0, #8
	add r1, r4, #0
	add r2, #0xf8
	ldr r3, [r5, #4]
	add r0, r4, r0
	add r1, #0x20
	add r2, r4, r2
	bl ov48_02259EAC
	ldr r0, _02258918 ; =0x0000C40C
	mov r2, #0x5a
	add r1, r4, #0
	lsl r2, r2, #2
	add r0, r4, r0
	add r1, #0x20
	add r2, r4, r2
	mov r3, #0x70
	bl ov48_0225A00C
	add r0, r4, #0
	add r1, r5, #0
	bl ov48_02259130
	ldr r0, _0225891C ; =ov48_02259090
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_0225890C: .word 0x0000C724
_02258910: .word 0x0000C3CC
_02258914: .word 0x0000C3E0
_02258918: .word 0x0000C40C
_0225891C: .word ov48_02259090
	thumb_func_end ov48_02258800

	thumb_func_start ov48_02258920
ov48_02258920: ; 0x02258920
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	bl OverlayManager_GetData
	add r7, r0, #0
	add r0, r5, #0
	bl OverlayManager_GetParentWork
	add r5, r0, #0
	ldr r0, [r4]
	cmp r0, #6
	bhi _022589EE
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02258948: ; jump table
	.short _02258956 - _02258948 - 2 ; case 0
	.short _0225897C - _02258948 - 2 ; case 1
	.short _0225898C - _02258948 - 2 ; case 2
	.short _022589EE - _02258948 - 2 ; case 3
	.short _022589EE - _02258948 - 2 ; case 4
	.short _022589C0 - _02258948 - 2 ; case 5
	.short _022589E0 - _02258948 - 2 ; case 6
_02258956:
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x70
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r5, #0xc]
	mov r1, #1
	bl ov45_0222A520
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _022589EE
_0225897C:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _022589EE
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _022589EE
_0225898C:
	add r0, r7, #0
	bl ov48_02258F64
	add r6, r0, #0
	add r0, r7, #0
	bl ov48_02259030
	ldr r0, [r5, #0xc]
	bl ov45_0222A330
	cmp r0, #1
	bne _022589AC
	ldr r0, [r5, #0xc]
	bl ov45_0222A4A8
	mov r6, #1
_022589AC:
	bl ov45_0222D844
	cmp r0, #1
	bne _022589B6
	mov r6, #1
_022589B6:
	cmp r6, #1
	bne _022589EE
	mov r0, #5
	str r0, [r4]
	b _022589EE
_022589C0:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x70
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _022589EE
_022589E0:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _022589EE
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_022589EE:
	add r0, r7, #0
	bl ov48_02259050
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov48_02258920

	thumb_func_start ov48_022589FC
ov48_022589FC: ; 0x022589FC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	add r0, r5, #0
	bl OverlayManager_GetParentWork
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	ldr r0, _02258A74 ; =0x0000C40C
	add r1, r4, #0
	add r0, r4, r0
	add r1, #0x20
	bl ov48_0225A108
	mov r0, #0xc7
	lsl r0, r0, #8
	add r0, r4, r0
	bl ov48_02259F14
	ldr r0, _02258A78 ; =0x0000C3E0
	add r0, r4, r0
	bl ov48_02259D94
	ldr r0, _02258A7C ; =0x0000C3CC
	add r0, r4, r0
	bl ov48_02259C38
	mov r0, #0x5e
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov48_02259868
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov48_02259984
	mov r0, #0x5a
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov48_0225B0A4
	add r4, #0x20
	add r0, r4, #0
	bl ov48_022594A8
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0x70
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02258A74: .word 0x0000C40C
_02258A78: .word 0x0000C3E0
_02258A7C: .word 0x0000C3CC
	thumb_func_end ov48_022589FC

	thumb_func_start ov48_02258A80
ov48_02258A80: ; 0x02258A80
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r5, r0, #0
	str r1, [sp, #0xc]
	mov r0, #0x62
	add r1, r2, #0
	str r2, [sp, #0x10]
	bl NARC_ctor
	mov r2, #0
	str r2, [r5]
	str r2, [sp]
	add r1, sp, #0x2c
	str r1, [sp, #4]
	ldr r3, [sp, #0x10]
	mov r1, #0x12
	str r0, [sp, #0x24]
	bl GfGfxLoader_LoadFromOpenNarc_GetSizeOut
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x2c]
	mov r1, #6
	bl _u32_div_f
	add r7, r0, #0
	ldr r0, [sp, #0x20]
	mov r6, #1
	add r4, r0, #6
	cmp r7, #1
	ble _02258AEE
_02258ABC:
	ldrh r0, [r4]
	cmp r0, #2
	beq _02258AE6
	lsl r0, r6, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	mov r2, #2
	str r0, [sp, #8]
	mov r3, #4
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	ldr r1, [r5]
	add r0, r5, #0
	bl ov48_02258B7C
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
_02258AE6:
	add r6, r6, #1
	add r4, r4, #6
	cmp r6, r7
	blt _02258ABC
_02258AEE:
	ldr r0, [sp, #0x20]
	bl FreeToHeap
	mov r7, #1
	bl LocationGmmDatCountGet
	str r0, [sp, #0x18]
	cmp r0, #1
	ble _02258B72
_02258B00:
	add r0, r7, #0
	bl LocationGmmDatGetEarthPlaceDatId
	add r1, r0, #0
	mov r0, #0
	str r0, [sp]
	add r0, sp, #0x28
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	ldr r3, [sp, #0x10]
	mov r2, #0
	bl GfGfxLoader_LoadFromOpenNarc_GetSizeOut
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x28]
	mov r6, #1
	lsr r0, r0, #2
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x1c]
	add r4, r0, #4
	ldr r0, [sp, #0x14]
	cmp r0, #1
	ble _02258B64
_02258B2E:
	add r0, r7, #0
	bl LocationGmmDatGetCountryMsgNo
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	lsl r0, r6, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	mov r2, #0
	str r0, [sp, #8]
	mov r3, #2
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	ldr r1, [r5]
	add r0, r5, #0
	bl ov48_02258B7C
	ldr r0, [r5]
	add r6, r6, #1
	add r0, r0, #1
	str r0, [r5]
	ldr r0, [sp, #0x14]
	add r4, r4, #4
	cmp r6, r0
	blt _02258B2E
_02258B64:
	ldr r0, [sp, #0x1c]
	bl FreeToHeap
	ldr r0, [sp, #0x18]
	add r7, r7, #1
	cmp r7, r0
	blt _02258B00
_02258B72:
	ldr r0, [sp, #0x24]
	bl NARC_dtor
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov48_02258A80

	thumb_func_start ov48_02258B7C
ov48_02258B7C: ; 0x02258B7C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	ldr r5, _02258BF0 ; =ov48_0225B1EC
	add r7, r2, #0
	add r6, r3, #0
	add r4, r0, #0
	mov ip, r1
	add r3, sp, #0xc
	mov r2, #4
_02258B8E:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02258B8E
	ldr r0, [r5]
	mov r1, #0x30
	str r0, [r3]
	mov r0, ip
	add r5, r0, #0
	mul r5, r1
	add r0, r4, r5
	strh r7, [r0, #4]
	strh r6, [r0, #6]
	mov r0, #0
	str r0, [sp, #8]
	add r0, sp, #0xc
	add r1, sp, #0
	str r7, [sp]
	str r6, [sp, #4]
	bl ov48_02258C6C
	add r3, r4, r5
	add r6, sp, #0xc
	add r3, #8
	mov r2, #4
_02258BC0:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02258BC0
	ldr r0, [r6]
	str r0, [r3]
	ldr r0, [sp, #0x50]
	cmp r0, #0
	beq _02258BE0
	add r2, sp, #0x38
	ldrh r1, [r2, #0x10]
	ldrh r2, [r2, #0x14]
	bl ov48_02259A68
	add r1, r4, r5
	strh r0, [r1, #0x2c]
_02258BE0:
	add r0, sp, #0x38
	ldrh r2, [r0, #0x10]
	add r1, r4, r5
	strh r2, [r1, #0x2e]
	ldrh r0, [r0, #0x14]
	strh r0, [r1, #0x30]
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02258BF0: .word ov48_0225B1EC
	thumb_func_end ov48_02258B7C

	thumb_func_start ov48_02258BF4
ov48_02258BF4: ; 0x02258BF4
	push {r4, r5, lr}
	sub sp, #0x24
	add r4, r1, #0
	ldr r1, [r4, #4]
	ldr r3, _02258C68 ; =FX_SinCosTable_
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	asr r1, r1, #4
	lsl r2, r1, #1
	lsl r1, r2, #1
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r5, r0, #0
	bl MTX_RotY33_
	ldr r0, [r4]
	ldr r3, _02258C68 ; =FX_SinCosTable_
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	asr r0, r0, #4
	lsl r2, r0, #1
	lsl r1, r2, #1
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #0
	bl MTX_RotX33_
	add r0, r5, #0
	add r1, sp, #0
	add r2, r5, #0
	bl MTX_Concat33
	ldr r0, [r4, #8]
	ldr r3, _02258C68 ; =FX_SinCosTable_
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	asr r0, r0, #4
	lsl r2, r0, #1
	lsl r1, r2, #1
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #0
	bl MTX_RotZ33_
	add r0, r5, #0
	add r1, sp, #0
	add r2, r5, #0
	bl MTX_Concat33
	add sp, #0x24
	pop {r4, r5, pc}
	nop
_02258C68: .word FX_SinCosTable_
	thumb_func_end ov48_02258BF4

	thumb_func_start ov48_02258C6C
ov48_02258C6C: ; 0x02258C6C
	push {r4, r5, lr}
	sub sp, #0x24
	add r4, r1, #0
	ldr r1, [r4]
	ldr r3, _02258CE0 ; =FX_SinCosTable_
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	asr r1, r1, #4
	lsl r2, r1, #1
	lsl r1, r2, #1
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r5, r0, #0
	bl MTX_RotY33_
	ldr r0, [r4, #4]
	ldr r3, _02258CE0 ; =FX_SinCosTable_
	neg r0, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	asr r0, r0, #4
	lsl r2, r0, #1
	lsl r1, r2, #1
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #0
	bl MTX_RotX33_
	add r0, r5, #0
	add r1, sp, #0
	add r2, r5, #0
	bl MTX_Concat33
	ldr r0, [r4, #8]
	ldr r3, _02258CE0 ; =FX_SinCosTable_
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	asr r0, r0, #4
	lsl r2, r0, #1
	add r1, r2, #1
	lsl r1, r1, #1
	lsl r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #0
	bl MTX_RotZ33_
	add r0, r5, #0
	add r1, sp, #0
	add r2, r5, #0
	bl MTX_Concat33
	add sp, #0x24
	pop {r4, r5, pc}
	.balign 4, 0
_02258CE0: .word FX_SinCosTable_
	thumb_func_end ov48_02258C6C

	thumb_func_start ov48_02258CE4
ov48_02258CE4: ; 0x02258CE4
	push {r3, r4, r5, r6, r7, lr}
	mov lr, r0
	ldr r0, _02258D4C ; =gSystem + 0x40
	mov ip, r1
	ldrh r5, [r0, #0x20]
	mov r1, #0
	add r7, r2, #0
	add r6, r3, #0
	ldr r0, _02258D50 ; =0x0000FFFF
	add r2, r1, #0
	add r3, r1, #0
	add r4, r1, #0
	cmp r5, r0
	beq _02258D14
	mov r0, lr
	sub r3, r5, r0
	bpl _02258D0E
	sub r0, r1, #1
	eor r3, r0
	mov r1, #0x10
	b _02258D14
_02258D0E:
	cmp r3, #0
	ble _02258D14
	mov r1, #0x20
_02258D14:
	str r1, [r7]
	mov r1, #0x3f
	add r0, r3, #0
	and r0, r1
	str r0, [r6]
	ldr r0, _02258D4C ; =gSystem + 0x40
	ldrh r3, [r0, #0x22]
	ldr r0, _02258D50 ; =0x0000FFFF
	cmp r3, r0
	beq _02258D3C
	mov r0, ip
	sub r4, r3, r0
	bpl _02258D36
	sub r1, #0x40
	eor r4, r1
	mov r2, #0x80
	b _02258D3C
_02258D36:
	cmp r4, #0
	ble _02258D3C
	mov r2, #0x40
_02258D3C:
	ldr r0, [sp, #0x18]
	add r1, r4, #0
	str r2, [r0]
	mov r0, #0x3f
	and r1, r0
	ldr r0, [sp, #0x1c]
	str r1, [r0]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02258D4C: .word gSystem + 0x40
_02258D50: .word 0x0000FFFF
	thumb_func_end ov48_02258CE4

	thumb_func_start ov48_02258D54
ov48_02258D54: ; 0x02258D54
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r4, r0, #0
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #0x5e
	lsl r0, r0, #2
	str r1, [sp]
	add r0, r4, r0
	add r1, sp, #0xc
	add r7, r2, #0
	bl ov48_022598CC
	ldr r0, _02258EF4 ; =0x0000C3E0
	mov r1, #0
	add r0, r4, r0
	bl ov48_02259E5C
	add r6, r0, #0
	ldr r0, _02258EF4 ; =0x0000C3E0
	mov r1, #1
	add r0, r4, r0
	bl ov48_02259E5C
	str r0, [sp, #4]
	ldr r0, _02258EF4 ; =0x0000C3E0
	mov r1, #2
	add r0, r4, r0
	bl ov48_02259E5C
	add r5, r0, #0
	ldr r0, _02258EF8 ; =0x0000C3CC
	add r0, r4, r0
	bl ov48_02259CFC
	ldr r2, [sp, #0x10]
	add r1, r0, #0
	lsl r2, r2, #0x10
	ldr r0, [sp, #0xc]
	asr r2, r2, #0x10
	mov ip, r2
	lsl r0, r0, #0x10
	ldr r2, [sp]
	mov r3, #1
	asr r0, r0, #0x10
	tst r2, r3
	bne _02258DB8
	add r2, r6, #0
	tst r2, r3
	beq _02258DCC
_02258DB8:
	ldr r0, [r4, #4]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _02258DC6
	mov r0, #1
	str r0, [sp, #8]
_02258DC6:
	ldr r0, [sp, #8]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_02258DCC:
	cmp r1, #0
	bne _02258DF4
	ldr r1, [sp, #4]
	cmp r1, #0
	bne _02258DDA
	cmp r5, #0
	beq _02258DEE
_02258DDA:
	ldr r2, [sp, #4]
	mov r1, #0x55
	mul r1, r2
	lsl r1, r1, #0x10
	lsr r3, r1, #0x10
	mov r1, #0x55
	mul r1, r5
	lsl r1, r1, #0x10
	lsr r5, r1, #0x10
	b _02258E16
_02258DEE:
	lsl r3, r3, #9
	add r5, r3, #0
	b _02258E16
_02258DF4:
	ldr r1, [sp, #4]
	cmp r1, #0
	bne _02258DFE
	cmp r5, #0
	beq _02258E12
_02258DFE:
	ldr r2, [sp, #4]
	mov r1, #0xa
	mul r1, r2
	lsl r1, r1, #0x10
	lsr r3, r1, #0x10
	mov r1, #0xa
	mul r1, r5
	lsl r1, r1, #0x10
	lsr r5, r1, #0x10
	b _02258E16
_02258E12:
	mov r3, #0x20
	add r5, r3, #0
_02258E16:
	mov r2, #0x20
	add r1, r7, #0
	tst r1, r2
	bne _02258E24
	add r1, r6, #0
	tst r1, r2
	beq _02258E44
_02258E24:
	ldr r1, [r4, #4]
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1f
	cmp r1, #1
	bne _02258E36
	ldr r1, [sp, #0x10]
	add r1, r1, r3
	str r1, [sp, #0x10]
	b _02258E44
_02258E36:
	ldr r2, _02258EFC ; =0xFFFFD820
	mov r1, ip
	cmp r1, r2
	bge _02258E44
	ldr r1, [sp, #0x10]
	add r1, r1, r3
	str r1, [sp, #0x10]
_02258E44:
	mov r2, #0x10
	add r1, r7, #0
	tst r1, r2
	bne _02258E52
	add r1, r6, #0
	tst r1, r2
	beq _02258E72
_02258E52:
	ldr r1, [r4, #4]
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1f
	cmp r1, #1
	bne _02258E64
	ldr r1, [sp, #0x10]
	sub r1, r1, r3
	str r1, [sp, #0x10]
	b _02258E72
_02258E64:
	ldr r2, _02258F00 ; =0xFFFFCC80
	mov r1, ip
	cmp r1, r2
	ble _02258E72
	ldr r1, [sp, #0x10]
	sub r1, r1, r3
	str r1, [sp, #0x10]
_02258E72:
	mov r1, #0x40
	add r2, r7, #0
	tst r2, r1
	bne _02258E7E
	tst r1, r6
	beq _02258EAA
_02258E7E:
	ldr r1, [r4, #4]
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1f
	cmp r1, #1
	bne _02258E9E
	mov r1, #0x3e
	add r2, r0, r5
	lsl r1, r1, #8
	cmp r2, r1
	bge _02258E9A
	ldr r1, [sp, #0xc]
	add r1, r1, r5
	str r1, [sp, #0xc]
	b _02258EAA
_02258E9A:
	str r1, [sp, #0xc]
	b _02258EAA
_02258E9E:
	ldr r1, _02258F04 ; =0x00002020
	cmp r0, r1
	bge _02258EAA
	ldr r1, [sp, #0xc]
	add r1, r1, r5
	str r1, [sp, #0xc]
_02258EAA:
	mov r1, #0x80
	add r2, r7, #0
	tst r2, r1
	bne _02258EB6
	tst r1, r6
	beq _02258EE2
_02258EB6:
	ldr r1, [r4, #4]
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1f
	cmp r1, #1
	bne _02258ED4
	sub r1, r0, r5
	ldr r0, _02258F08 ; =0xFFFFC200
	cmp r1, r0
	ble _02258ED0
	ldr r0, [sp, #0xc]
	sub r0, r0, r5
	str r0, [sp, #0xc]
	b _02258EE2
_02258ED0:
	str r0, [sp, #0xc]
	b _02258EE2
_02258ED4:
	mov r1, #0x13
	lsl r1, r1, #8
	cmp r0, r1
	ble _02258EE2
	ldr r0, [sp, #0xc]
	sub r0, r0, r5
	str r0, [sp, #0xc]
_02258EE2:
	mov r0, #0x5e
	lsl r0, r0, #2
	add r0, r4, r0
	add r1, sp, #0xc
	bl ov48_022598DC
	mov r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02258EF4: .word 0x0000C3E0
_02258EF8: .word 0x0000C3CC
_02258EFC: .word 0xFFFFD820
_02258F00: .word 0xFFFFCC80
_02258F04: .word 0x00002020
_02258F08: .word 0xFFFFC200
	thumb_func_end ov48_02258D54

	thumb_func_start ov48_02258F0C
ov48_02258F0C: ; 0x02258F0C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	blt _02258F20
	ldr r1, _02258F60 ; =0x0000FFFF
	bl _s32_div_f
	str r1, [r4]
	b _02258F36
_02258F20:
	bge _02258F24
	neg r0, r0
_02258F24:
	ldr r1, _02258F60 ; =0x0000FFFF
	bl _s32_div_f
	add r1, r0, #1
	ldr r0, _02258F60 ; =0x0000FFFF
	ldr r2, [r4]
	mul r0, r1
	add r0, r2, r0
	str r0, [r4]
_02258F36:
	ldr r0, [r4, #4]
	cmp r0, #0
	blt _02258F46
	ldr r1, _02258F60 ; =0x0000FFFF
	bl _s32_div_f
	str r1, [r4, #4]
	pop {r4, pc}
_02258F46:
	bge _02258F4A
	neg r0, r0
_02258F4A:
	ldr r1, _02258F60 ; =0x0000FFFF
	bl _s32_div_f
	add r1, r0, #1
	ldr r0, _02258F60 ; =0x0000FFFF
	ldr r2, [r4, #4]
	mul r0, r1
	add r0, r2, r0
	str r0, [r4, #4]
	pop {r4, pc}
	nop
_02258F60: .word 0x0000FFFF
	thumb_func_end ov48_02258F0C

	thumb_func_start ov48_02258F64
ov48_02258F64: ; 0x02258F64
	push {r4, lr}
	add r4, r0, #0
	ldrh r1, [r4]
	cmp r1, #3
	bhi _0225901C
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02258F7A: ; jump table
	.short _02258F82 - _02258F7A - 2 ; case 0
	.short _02258FA8 - _02258F7A - 2 ; case 1
	.short _02258FC0 - _02258F7A - 2 ; case 2
	.short _02258FE2 - _02258F7A - 2 ; case 3
_02258F82:
	bl ov48_0225909C
	cmp r0, #0
	beq _02259020
	cmp r0, #1
	beq _02258F94
	cmp r0, #2
	beq _02258FA2
	b _02259020
_02258F94:
	ldr r0, _02259024 ; =0x0000C3CC
	add r0, r4, r0
	bl ov48_02259C4C
	mov r0, #1
	strh r0, [r4]
	b _02259020
_02258FA2:
	mov r0, #2
	strh r0, [r4]
	b _02259020
_02258FA8:
	ldr r0, _02259024 ; =0x0000C3CC
	mov r1, #0x89
	lsl r1, r1, #2
	add r0, r4, r0
	add r1, r4, r1
	bl ov48_02259C78
	cmp r0, #1
	bne _02259020
	mov r0, #0
	strh r0, [r4]
	b _02259020
_02258FC0:
	mov r0, #0xc7
	lsl r0, r0, #8
	add r0, r4, r0
	bl ov48_02259F48
	ldr r0, _02259028 ; =0x0000C40C
	add r0, r4, r0
	bl ov48_0225A1D0
	ldr r0, _0225902C ; =0x0000C3E0
	add r0, r4, r0
	bl ov48_02259E78
	ldrh r0, [r4]
	add r0, r0, #1
	strh r0, [r4]
	b _02259020
_02258FE2:
	mov r0, #0xc7
	lsl r0, r0, #8
	add r0, r4, r0
	bl ov48_02259F8C
	cmp r0, #0
	beq _02259020
	cmp r0, #1
	beq _02259018
	cmp r0, #2
	bne _02259018
	ldr r0, _02259028 ; =0x0000C40C
	add r0, r4, r0
	bl ov48_0225A1EC
	mov r0, #0xc7
	lsl r0, r0, #8
	add r0, r4, r0
	bl ov48_02259FEC
	ldr r0, _0225902C ; =0x0000C3E0
	add r0, r4, r0
	bl ov48_02259E90
	mov r0, #0
	strh r0, [r4]
	b _02259020
_02259018:
	mov r0, #1
	pop {r4, pc}
_0225901C:
	bl GF_AssertFail
_02259020:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_02259024: .word 0x0000C3CC
_02259028: .word 0x0000C40C
_0225902C: .word 0x0000C3E0
	thumb_func_end ov48_02258F64

	thumb_func_start ov48_02259030
ov48_02259030: ; 0x02259030
	push {r3, lr}
	add r2, r0, #0
	ldrh r0, [r2, #2]
	cmp r0, #0
	bne _0225904A
	ldr r0, _0225904C ; =0x0000C40C
	mov r1, #0x5a
	lsl r1, r1, #2
	add r0, r2, r0
	add r1, r2, r1
	add r2, #0x20
	bl ov48_0225A158
_0225904A:
	pop {r3, pc}
	.balign 4, 0
_0225904C: .word 0x0000C40C
	thumb_func_end ov48_02259030

	thumb_func_start ov48_02259050
ov48_02259050: ; 0x02259050
	push {r4, lr}
	add r4, r0, #0
	bl sub_02026E48
	ldr r0, _0225908C ; =0x0000C3CC
	add r0, r4, r0
	bl ov48_02259C44
	mov r0, #0x5e
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov48_02259874
	mov r1, #0x89
	lsl r1, r1, #2
	add r0, r4, r1
	sub r1, #0xac
	add r1, r4, r1
	bl ov48_022599A0
	add r4, #0x20
	add r0, r4, #0
	bl ov48_022594D0
	mov r0, #0
	mov r1, #1
	bl sub_02026E50
	pop {r4, pc}
	nop
_0225908C: .word 0x0000C3CC
	thumb_func_end ov48_02259050

	thumb_func_start ov48_02259090
ov48_02259090: ; 0x02259090
	ldr r3, _02259098 ; =ov48_022594DC
	add r0, #0x20
	bx r3
	nop
_02259098: .word ov48_022594DC
	thumb_func_end ov48_02259090

	thumb_func_start ov48_0225909C
ov48_0225909C: ; 0x0225909C
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, _0225911C ; =0x0000C3E0
	add r0, r5, r0
	bl ov48_02259DA0
	ldr r0, _0225911C ; =0x0000C3E0
	ldr r1, [r5, r0]
	mov r0, #2
	tst r1, r0
	beq _022590C0
	ldr r0, _02259120 ; =0x000005DD
	bl PlaySE
	add sp, #0xc
	mov r0, #2
	pop {r4, r5, pc}
_022590C0:
	ldr r2, _02259124 ; =gSystem
	lsl r0, r0, #9
	ldr r1, [r2, #0x48]
	tst r0, r1
	beq _0225910C
	add r0, r5, #0
	add r1, sp, #0
	bl ov48_02259188
	cmp r0, #1
	bne _02259116
	ldr r0, _02259128 ; =0x0000C40C
	add r1, sp, #0
	add r0, r5, r0
	bl ov48_0225A244
	cmp r0, #0
	bne _02259116
	ldr r0, _02259128 ; =0x0000C40C
	add r1, sp, #0
	add r0, r5, r0
	bl ov48_0225A20C
	cmp r0, #0
	beq _02259116
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	lsl r1, r1, #0x18
	lsl r2, r2, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	bl ov48_022593B4
	ldr r0, _0225912C ; =0x000005D6
	bl PlaySE
	b _02259116
_0225910C:
	ldr r2, [r2, #0x44]
	add r0, r5, #0
	bl ov48_02258D54
	add r4, r0, #0
_02259116:
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_0225911C: .word 0x0000C3E0
_02259120: .word 0x000005DD
_02259124: .word gSystem
_02259128: .word 0x0000C40C
_0225912C: .word 0x000005D6
	thumb_func_end ov48_0225909C

	thumb_func_start ov48_02259130
ov48_02259130: ; 0x02259130
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r5, #0x14]
	ldr r2, [r5, #0x18]
	lsl r1, r1, #0x18
	lsl r2, r2, #0x18
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	bl ov48_022593B4
	cmp r0, #0
	bne _02259184
	ldr r0, [r4]
	bl ov48_0225B13C
	add r6, r0, #0
	cmp r6, #0x32
	beq _02259184
	lsl r1, r6, #0x18
	ldr r0, [r4]
	lsr r1, r1, #0x18
	bl ov45_0222D6B0
	add r7, r0, #0
	lsl r1, r6, #0x18
	ldr r0, [r4]
	lsr r1, r1, #0x18
	bl ov45_0222D6D4
	add r2, r0, #0
	lsl r1, r7, #0x18
	lsl r2, r2, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	bl ov48_022593B4
	cmp r0, #1
	beq _02259184
	bl GF_AssertFail
_02259184:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov48_02259130

	thumb_func_start ov48_02259188
ov48_02259188: ; 0x02259188
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov48_022591D8
	add r6, r0, #0
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov48_02259BBC
	cmp r6, r0
	blo _022591A6
	mov r0, #0
	pop {r4, r5, r6, pc}
_022591A6:
	add r2, r5, #0
	add r2, #0x1c
	ldr r2, [r2]
	add r0, r5, #0
	add r1, r6, #0
	bl ov48_0225932C
	str r0, [r4]
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r5, r0
	add r1, r6, #0
	bl ov48_02259B84
	str r0, [r4, #4]
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r5, r0
	add r1, r6, #0
	bl ov48_02259BA0
	str r0, [r4, #8]
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov48_02259188

	thumb_func_start ov48_022591D8
ov48_022591D8: ; 0x022591D8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	add r5, r0, #0
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov48_02259BBC
	str r0, [sp, #0xc]
	mov r0, #0x5e
	lsl r0, r0, #2
	add r0, r5, r0
	add r1, sp, #0x28
	bl ov48_022598CC
	ldr r1, [sp, #0x28]
	add r0, r1, #0
	sub r0, #0x80
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add r1, #0x80
	str r0, [sp, #4]
	lsl r0, r1, #0x10
	asr r0, r0, #0x10
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	add r1, r0, #0
	sub r1, #0x80
	lsl r1, r1, #0x10
	asr r6, r1, #0x10
	add r1, r0, #0
	add r1, #0x80
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	str r1, [sp, #0x18]
	sub r2, r1, r6
	bpl _02259224
	neg r2, r2
_02259224:
	mov r1, #1
	lsl r1, r1, #8
	cmp r2, r1
	ble _0225925E
	lsl r0, r0, #0x10
	asr r6, r0, #0x10
	str r6, [sp, #0x18]
	cmp r6, #0
	ble _02259240
	lsl r0, r1, #8
	sub r0, r6, r0
	str r0, [sp, #0x14]
	str r0, [sp, #0x10]
	b _02259248
_02259240:
	lsl r0, r1, #8
	add r0, r6, r0
	str r0, [sp, #0x14]
	str r0, [sp, #0x10]
_02259248:
	ldr r0, [sp, #0x18]
	sub r6, #0x80
	add r0, #0x80
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	sub r0, #0x80
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	add r0, #0x80
	str r0, [sp, #0x10]
	b _02259264
_0225925E:
	ldr r0, [sp, #0x18]
	str r6, [sp, #0x14]
	str r0, [sp, #0x10]
_02259264:
	ldr r0, [sp, #0xc]
	mov r7, #1
	lsl r7, r7, #8
	mov r4, #0
	str r0, [sp, #8]
	cmp r0, #0
	bls _022592DA
_02259272:
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r5, r0
	add r1, sp, #0x1c
	add r2, r4, #0
	bl ov48_02259B3C
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r5, r0
	add r1, r4, #0
	bl ov48_02259B68
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #4]
	cmp r1, r2
	ble _022592D2
	ldr r2, [sp]
	cmp r1, r2
	bge _022592D2
	ldr r1, [sp, #0x20]
	cmp r1, r6
	ble _022592A6
	ldr r2, [sp, #0x18]
	cmp r1, r2
	blt _022592B2
_022592A6:
	ldr r2, [sp, #0x14]
	cmp r1, r2
	ble _022592D2
	ldr r2, [sp, #0x10]
	cmp r1, r2
	bge _022592D2
_022592B2:
	cmp r0, #3
	beq _022592D2
	add r0, sp, #0x28
	bl ov48_02258F0C
	add r0, sp, #0x1c
	bl ov48_02258F0C
	add r0, sp, #0x28
	add r1, sp, #0x1c
	bl ov48_022592E0
	cmp r0, r7
	bhs _022592D2
	add r7, r0, #0
	str r4, [sp, #8]
_022592D2:
	ldr r0, [sp, #0xc]
	add r4, r4, #1
	cmp r4, r0
	blo _02259272
_022592DA:
	ldr r0, [sp, #8]
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov48_022591D8

	thumb_func_start ov48_022592E0
ov48_022592E0: ; 0x022592E0
	push {r3, r4, r5, lr}
	ldr r3, [r0]
	ldr r2, [r1]
	sub r4, r3, r2
	bpl _022592EC
	neg r4, r4
_022592EC:
	ldr r2, [r0, #4]
	ldr r0, [r1, #4]
	sub r5, r2, r0
	bpl _022592F6
	neg r5, r5
_022592F6:
	mov r0, #0xb4
	bl GF_DegreeToSinCosIdxNoWrap
	cmp r4, r0
	ble _02259304
	ldr r0, _02259328 ; =0x0000FFFF
	sub r4, r0, r4
_02259304:
	mov r0, #0xb4
	bl GF_DegreeToSinCosIdxNoWrap
	cmp r5, r0
	ble _02259312
	ldr r0, _02259328 ; =0x0000FFFF
	sub r5, r0, r5
_02259312:
	add r1, r4, #0
	add r0, r5, #0
	mul r1, r4
	mul r0, r5
	add r0, r1, r0
	lsl r0, r0, #0xc
	bl FX_Sqrt
	asr r0, r0, #0xc
	pop {r3, r4, r5, pc}
	nop
_02259328: .word 0x0000FFFF
	thumb_func_end ov48_022592E0

	thumb_func_start ov48_0225932C
ov48_0225932C: ; 0x0225932C
	push {r0, r1, r2, r3}
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	add r0, sp, #0x30
	ldrb r0, [r0, #8]
	add r7, r1, #0
	mov r1, #0xdb
	sub r4, r0, #4
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r5, r0
	mov r2, #3
	bl ov48_02259B10
	add r6, r0, #0
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov48_02259BBC
	cmp r6, r0
	blo _0225935E
	bl GF_AssertFail
_0225935E:
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r5, r0
	add r1, sp, #0xc
	add r2, r6, #0
	bl ov48_02259B3C
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r5, r0
	add r1, sp, #0
	add r2, r7, #0
	bl ov48_02259B3C
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #4]
	sub r0, r1, r0
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	mov r0, #0x18
	mul r0, r1
	ldr r1, _022593B0 ; =0x0000FFFF
	bl _s32_div_f
	add r4, r4, r0
	bpl _02259394
	add r4, #0x18
_02259394:
	cmp r4, #0x18
	blt _022593A2
	add r0, r4, #0
	mov r1, #0x18
	bl _s32_div_f
	add r4, r1, #0
_022593A2:
	add r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7}
	pop {r3}
	add sp, #0x10
	bx r3
	nop
_022593B0: .word 0x0000FFFF
	thumb_func_end ov48_0225932C

	thumb_func_start ov48_022593B4
ov48_022593B4: ; 0x022593B4
	push {r4, lr}
	sub sp, #0x18
	add r4, r0, #0
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r4, r0
	add r3, sp, #0xc
	bl ov48_02259AD0
	cmp r0, #3
	beq _022593EC
	mov r0, #0x5e
	lsl r0, r0, #2
	add r0, r4, r0
	add r1, sp, #0
	bl ov48_022598CC
	ldr r0, [sp, #8]
	add r1, sp, #0xc
	str r0, [sp, #0x14]
	mov r0, #0x5e
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov48_022598DC
	add sp, #0x18
	mov r0, #1
	pop {r4, pc}
_022593EC:
	mov r0, #0
	add sp, #0x18
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov48_022593B4

	thumb_func_start ov48_022593F4
ov48_022593F4: ; 0x022593F4
	push {r4, r5, r6, r7}
	ldr r4, [r0, #4]
	mov r2, #2
	bic r4, r2
	mov r3, #1
	bic r4, r3
	ldr r3, _02259460 ; =gGameLanguage
	str r4, [r0, #4]
	ldrb r3, [r3]
	cmp r3, #1
	ldr r3, [r0, #4]
	bne _02259414
	mov r2, #2
	orr r2, r3
	str r2, [r0, #4]
	b _02259418
_02259414:
	bic r3, r2
	str r3, [r0, #4]
_02259418:
	ldr r2, [r0, #4]
	lsl r3, r2, #0x1e
	lsr r3, r3, #0x1f
	cmp r3, #1
	bne _02259452
	mov r3, #0
	add r4, r3, #0
	mov r5, #1
	mov r6, #1
_0225942A:
	ldr r2, [r1]
	add r7, r2, r4
	ldrb r7, [r7, #3]
	lsl r7, r7, #0x18
	lsr r7, r7, #0x1c
	cmp r7, #1
	bne _02259446
	ldrh r2, [r2, r4]
	cmp r2, #0x67
	beq _02259446
	ldr r2, [r0, #4]
	bic r2, r5
	orr r2, r6
	str r2, [r0, #4]
_02259446:
	add r3, r3, #1
	add r4, r4, #4
	cmp r3, #0x32
	blt _0225942A
	pop {r4, r5, r6, r7}
	bx lr
_02259452:
	mov r1, #1
	bic r2, r1
	mov r1, #1
	orr r1, r2
	str r1, [r0, #4]
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
_02259460: .word gGameLanguage
	thumb_func_end ov48_022593F4

	thumb_func_start ov48_02259464
ov48_02259464: ; 0x02259464
	push {r4, r5, r6, lr}
	add r4, r2, #0
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xc0
	add r1, r4, #0
	bl NARC_ctor
	mov r1, #0x51
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0x40
	add r1, r4, #0
	bl GF_CreateVramTransferManager
	ldr r0, _022594A4 ; =ov48_0225B210
	bl GX_SetBanks
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	bl ov48_022594F0
	add r0, r5, #0
	add r1, r4, #0
	bl ov48_02259688
	add r0, r5, #0
	add r1, r4, #0
	bl ov48_02259750
	pop {r4, r5, r6, pc}
	.balign 4, 0
_022594A4: .word ov48_0225B210
	thumb_func_end ov48_02259464

	thumb_func_start ov48_022594A8
ov48_022594A8: ; 0x022594A8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl NARC_dtor
	bl GF_DestroyVramTransferManager
	add r0, r4, #0
	bl ov48_02259650
	add r0, r4, #0
	bl ov48_02259724
	add r0, r4, #0
	bl ov48_02259788
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov48_022594A8

	thumb_func_start ov48_022594D0
ov48_022594D0: ; 0x022594D0
	ldr r3, _022594D8 ; =sub_0202457C
	ldr r0, [r0, #4]
	bx r3
	nop
_022594D8: .word sub_0202457C
	thumb_func_end ov48_022594D0

	thumb_func_start ov48_022594DC
ov48_022594DC: ; 0x022594DC
	push {r3, lr}
	ldr r0, [r0]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	bl OamManager_ApplyAndResetBuffers
	bl GF_RunVramTransferTasks
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov48_022594DC

	thumb_func_start ov48_022594F0
ov48_022594F0: ; 0x022594F0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldr r0, _0225963C ; =ov48_0225B190
	add r7, r2, #0
	str r1, [sp, #0x10]
	bl SetBothScreensModesAndDisable
	add r0, r7, #0
	bl BgConfig_Alloc
	str r0, [r5]
	ldr r0, _02259640 ; =gSystem + 0x60
	mov r1, #1
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	mov r0, #0
	ldr r6, _02259644 ; =ov48_0225B2A4
	ldr r4, _02259648 ; =ov48_0225B1B0
	str r0, [sp, #0x14]
_0225951A:
	ldr r1, [r4]
	ldr r0, [r5]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	add r2, r6, #0
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4]
	mov r1, #0x20
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r2, #0
	add r3, r7, #0
	bl BG_ClearCharDataRange
	ldr r1, [r4]
	ldr r0, [r5]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	ldr r0, [sp, #0x14]
	add r6, #0x1c
	add r0, r0, #1
	add r4, r4, #4
	str r0, [sp, #0x14]
	cmp r0, #5
	blt _0225951A
	mov r3, #0
	str r3, [sp]
	mov r0, #0x51
	str r7, [sp, #4]
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #5
	mov r2, #4
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x51
	str r7, [sp, #0xc]
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [r5]
	mov r1, #0xb
	mov r3, #4
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x51
	str r7, [sp, #0xc]
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [r5]
	mov r1, #0xc
	mov r3, #4
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x51
	str r7, [sp, #0xc]
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [r5]
	mov r1, #4
	mov r3, #6
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x51
	str r7, [sp, #0xc]
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [r5]
	mov r1, #0x12
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	mov r1, #0x20
	add r2, r7, #0
	bl LoadFontPal1
	mov r1, #0x16
	mov r0, #4
	lsl r1, r1, #4
	add r2, r7, #0
	bl LoadFontPal1
	mov r3, #0
	str r3, [sp]
	str r7, [sp, #4]
	ldr r0, [r5]
	mov r1, #1
	mov r2, #0x1f
	bl LoadUserFrameGfx1
	mov r3, #0
	str r3, [sp]
	str r7, [sp, #4]
	ldr r0, [r5]
	mov r1, #1
	mov r2, #0x1f
	bl LoadUserFrameGfx1
	ldr r0, [sp, #0x10]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	str r4, [sp]
	str r7, [sp, #4]
	mov r2, #0xa
	ldr r0, [r5]
	mov r1, #4
	add r3, r2, #0
	bl LoadUserFrameGfx2
	str r4, [sp]
	str r7, [sp, #4]
	mov r1, #1
	ldr r0, [r5]
	add r2, r1, #0
	mov r3, #2
	bl LoadUserFrameGfx2
	ldr r1, _0225964C ; =0x000072CA
	mov r0, #0
	bl BG_SetMaskColor
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225963C: .word ov48_0225B190
_02259640: .word gSystem + 0x60
_02259644: .word ov48_0225B2A4
_02259648: .word ov48_0225B1B0
_0225964C: .word 0x000072CA
	thumb_func_end ov48_022594F0

	thumb_func_start ov48_02259650
ov48_02259650: ; 0x02259650
	push {r4, r5, r6, lr}
	ldr r5, _02259680 ; =ov48_0225B1B0
	add r6, r0, #0
	mov r4, #0
_02259658:
	ldr r1, [r5]
	ldr r0, [r6]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl FreeBgTilemapBuffer
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #5
	blt _02259658
	ldr r0, [r6]
	bl FreeToHeap
	ldr r0, _02259684 ; =gSystem + 0x60
	mov r1, #0
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	pop {r4, r5, r6, pc}
	nop
_02259680: .word ov48_0225B1B0
_02259684: .word gSystem + 0x60
	thumb_func_end ov48_02259650

	thumb_func_start ov48_02259688
ov48_02259688: ; 0x02259688
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r6, r1, #0
	bl NNS_G2dInitOamManagerModule
	mov r0, #0
	str r0, [sp]
	mov r1, #0x7e
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r3, #0x1f
	str r3, [sp, #0xc]
	add r2, r0, #0
	str r6, [sp, #0x10]
	bl OamManager_Create
	mov r1, #0x10
	ldr r0, _02259720 ; =ov48_0225B1A0
	add r2, r1, #0
	bl sub_020215C0
	mov r0, #0x20
	add r1, r6, #0
	bl sub_02022588
	bl sub_020216C8
	bl sub_02022638
	mov r0, #1
	mov r1, #0x10
	bl sub_02009FE8
	mov r0, #1
	bl sub_0200A080
	add r1, r5, #0
	mov r0, #0x20
	add r1, #8
	add r2, r6, #0
	bl G2dRenderer_Init
	str r0, [r5, #4]
	add r0, r5, #0
	mov r2, #1
	add r0, #8
	mov r1, #0
	lsl r2, r2, #0x14
	bl G2dRenderer_SetSubSurfaceCoords
	mov r7, #0x13
	mov r4, #0
	lsl r7, r7, #4
_022596F4:
	mov r0, #0x20
	add r1, r4, #0
	add r2, r6, #0
	bl Create2DGfxResObjMan
	str r0, [r5, r7]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _022596F4
	bl sub_0203A880
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02259720: .word ov48_0225B1A0
	thumb_func_end ov48_02259688

	thumb_func_start ov48_02259724
ov48_02259724: ; 0x02259724
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	bl sub_02024504
	mov r6, #0x13
	mov r4, #0
	lsl r6, r6, #4
_02259734:
	ldr r0, [r5, r6]
	bl Destroy2DGfxResObjMan
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _02259734
	bl sub_0202168C
	bl sub_02022608
	bl OamManager_Free
	pop {r4, r5, r6, pc}
	thumb_func_end ov48_02259724

	thumb_func_start ov48_02259750
ov48_02259750: ; 0x02259750
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #4
	str r0, [sp]
	ldr r0, _02259780 ; =ov48_02259798
	mov r2, #2
	str r0, [sp, #4]
	add r0, r1, #0
	mov r1, #0
	add r3, r1, #0
	bl GF_3DVramMan_Create
	mov r1, #5
	lsl r1, r1, #6
	str r0, [r4, r1]
	mov r0, #0
	ldr r3, _02259784 ; =0xFFFFF001
	add r1, r0, #0
	add r2, r0, #0
	bl NNS_G3dGlbLightVector
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_02259780: .word ov48_02259798
_02259784: .word 0xFFFFF001
	thumb_func_end ov48_02259750

	thumb_func_start ov48_02259788
ov48_02259788: ; 0x02259788
	mov r1, #5
	lsl r1, r1, #6
	ldr r3, _02259794 ; =GF_3DVramMan_Delete
	ldr r0, [r0, r1]
	bx r3
	nop
_02259794: .word GF_3DVramMan_Delete
	thumb_func_end ov48_02259788

	thumb_func_start ov48_02259798
ov48_02259798: ; 0x02259798
	push {r3, lr}
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	ldr r0, _02259808 ; =0x04000008
	mov r1, #3
	ldrh r2, [r0]
	bic r2, r1
	mov r1, #1
	orr r1, r2
	strh r1, [r0]
	add r0, #0x58
	ldrh r2, [r0]
	ldr r1, _0225980C ; =0xFFFFCFFD
	and r2, r1
	strh r2, [r0]
	ldrh r3, [r0]
	add r2, r1, #2
	and r3, r2
	mov r2, #0x10
	orr r2, r3
	strh r2, [r0]
	ldrh r3, [r0]
	ldr r2, _02259810 ; =0x0000CFFB
	and r2, r3
	strh r2, [r0]
	add r2, r1, #2
	ldrh r3, [r0]
	add r1, r1, #2
	and r3, r2
	mov r2, #8
	orr r2, r3
	strh r2, [r0]
	ldrh r2, [r0]
	and r2, r1
	mov r1, #0x20
	orr r1, r2
	strh r1, [r0]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl G3X_SetFog
	mov r1, #0
	ldr r0, _02259814 ; =0x00006B5A
	ldr r2, _02259818 ; =0x00007FFF
	mov r3, #0x3f
	str r1, [sp]
	bl G3X_SetClearColor
	ldr r1, _0225981C ; =0xBFFF0000
	ldr r0, _02259820 ; =0x04000580
	str r1, [r0]
	pop {r3, pc}
	.balign 4, 0
_02259808: .word 0x04000008
_0225980C: .word 0xFFFFCFFD
_02259810: .word 0x0000CFFB
_02259814: .word 0x00006B5A
_02259818: .word 0x00007FFF
_0225981C: .word 0xBFFF0000
_02259820: .word 0x04000580
	thumb_func_end ov48_02259798

	thumb_func_start ov48_02259824
ov48_02259824: ; 0x02259824
	push {r4, lr}
	add r4, r0, #0
	add r3, r2, #0
	mov r2, #0
	str r2, [r4]
	str r2, [r4, #4]
	mov r0, #1
	str r2, [r4, #8]
	lsl r0, r0, #0xc
	str r0, [r4, #0xc]
	str r0, [r4, #0x10]
	str r0, [r4, #0x14]
	mov r0, #0x69
	lsl r0, r0, #6
	str r0, [r4, #0x18]
	mov r0, #0x1f
	lsl r0, r0, #0xa
	str r0, [r4, #0x1c]
	str r2, [r4, #0x20]
	mov r2, #0x51
	lsl r2, r2, #2
	add r0, r4, #0
	ldr r1, [r1, r2]
	add r0, #0x9c
	mov r2, #3
	bl sub_02018030
	add r0, r4, #0
	add r4, #0x9c
	add r0, #0x24
	add r1, r4, #0
	bl sub_020181B0
	pop {r4, pc}
	thumb_func_end ov48_02259824

	thumb_func_start ov48_02259868
ov48_02259868: ; 0x02259868
	ldr r3, _02259870 ; =sub_02018068
	add r0, #0x9c
	bx r3
	nop
_02259870: .word sub_02018068
	thumb_func_end ov48_02259868

	thumb_func_start ov48_02259874
ov48_02259874: ; 0x02259874
	push {r3, r4, lr}
	sub sp, #0x24
	add r4, r0, #0
	add r1, sp, #0
	bl ov48_022598BC
	add r0, r4, #0
	ldr r1, [r4]
	ldr r2, [r4, #4]
	ldr r3, [r4, #8]
	add r0, #0x24
	bl sub_020182A8
	add r0, r4, #0
	ldr r1, [r4, #0xc]
	ldr r2, [r4, #0x10]
	ldr r3, [r4, #0x14]
	add r0, #0x24
	bl sub_020182C4
	add r4, #0x24
	add r0, r4, #0
	add r1, sp, #0
	bl sub_02018288
	add sp, #0x24
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov48_02259874

	thumb_func_start ov48_022598AC
ov48_022598AC: ; 0x022598AC
	add r3, r0, #0
	add r2, r1, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	bx lr
	.balign 4, 0
	thumb_func_end ov48_022598AC

	thumb_func_start ov48_022598BC
ov48_022598BC: ; 0x022598BC
	add r2, r0, #0
	ldr r3, _022598C8 ; =ov48_02258BF4
	add r2, #0x18
	add r0, r1, #0
	add r1, r2, #0
	bx r3
	.balign 4, 0
_022598C8: .word ov48_02258BF4
	thumb_func_end ov48_022598BC

	thumb_func_start ov48_022598CC
ov48_022598CC: ; 0x022598CC
	add r2, r0, #0
	add r2, #0x18
	add r3, r1, #0
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	bx lr
	thumb_func_end ov48_022598CC

	thumb_func_start ov48_022598DC
ov48_022598DC: ; 0x022598DC
	add r3, r1, #0
	add r2, r0, #0
	ldmia r3!, {r0, r1}
	add r2, #0x18
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	bx lr
	thumb_func_end ov48_022598DC

	thumb_func_start ov48_022598EC
ov48_022598EC: ; 0x022598EC
	push {r0, r1, r2, r3}
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r2, [sp, #4]
	ldr r2, [sp, #0x34]
	str r0, [sp]
	str r2, [sp, #0x34]
	bl ov48_02258A80
	ldr r1, _02259974 ; =0x0000C178
	ldr r0, [sp]
	ldr r4, _02259978 ; =ov48_0225B178
	add r5, r0, r1
	ldr r1, _0225997C ; =0x0000C010
	mov r7, #0
	add r6, r0, r1
_0225990C:
	mov r1, #0x51
	ldr r2, [sp, #4]
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	ldr r2, [r4]
	ldr r3, [sp, #0x34]
	add r0, r5, #0
	bl sub_02018030
	add r0, r6, #0
	add r1, r5, #0
	bl sub_020181B0
	add r7, r7, #1
	add r4, r4, #4
	add r5, #0x10
	add r6, #0x78
	cmp r7, #3
	blt _0225990C
	ldr r0, [sp, #0x2c]
	ldr r2, _02259980 ; =0x0000C004
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bne _0225995A
	mov r3, #3
	ldr r0, [sp]
	lsl r3, r3, #8
	str r3, [r0, r2]
	add r1, r2, #4
	str r3, [r0, r1]
	mov r1, #1
	lsl r1, r1, #0xc
	add r2, #8
	str r1, [r0, r2]
	add sp, #8
	pop {r3, r4, r5, r6, r7}
	pop {r3}
	add sp, #0x10
	bx r3
_0225995A:
	mov r3, #1
	ldr r0, [sp]
	lsl r3, r3, #0xc
	str r3, [r0, r2]
	add r1, r2, #4
	str r3, [r0, r1]
	add r2, #8
	str r3, [r0, r2]
	add sp, #8
	pop {r3, r4, r5, r6, r7}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
_02259974: .word 0x0000C178
_02259978: .word ov48_0225B178
_0225997C: .word 0x0000C010
_02259980: .word 0x0000C004
	thumb_func_end ov48_022598EC

	thumb_func_start ov48_02259984
ov48_02259984: ; 0x02259984
	push {r3, r4, r5, lr}
	ldr r1, _0225999C ; =0x0000C178
	mov r4, #0
	add r5, r0, r1
_0225998C:
	add r0, r5, #0
	bl sub_02018068
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #3
	blt _0225998C
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0225999C: .word 0x0000C178
	thumb_func_end ov48_02259984

	thumb_func_start ov48_022599A0
ov48_022599A0: ; 0x022599A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x58
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r1, sp, #4
	bl ov48_022598AC
	add r0, r4, #0
	add r1, sp, #0x10
	bl ov48_022598BC
	ldr r0, _02259A54 ; =0x0000C010
	ldr r7, _02259A58 ; =0x0000019A
	mov r6, #0
	add r4, r5, r0
_022599C0:
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	add r0, r4, #0
	bl sub_020182A8
	cmp r6, #2
	ldr r1, _02259A5C ; =0x0000C004
	bne _022599E6
	ldr r3, _02259A60 ; =0x0000C00C
	ldr r2, _02259A64 ; =0x0000C008
	ldr r3, [r5, r3]
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	add r0, r4, #0
	add r3, r3, r7
	bl sub_020182C4
	b _022599F6
_022599E6:
	ldr r2, _02259A64 ; =0x0000C008
	ldr r3, _02259A60 ; =0x0000C00C
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	ldr r3, [r5, r3]
	add r0, r4, #0
	bl sub_020182C4
_022599F6:
	add r6, r6, #1
	add r4, #0x78
	cmp r6, #3
	blt _022599C0
	add r0, sp, #0x34
	bl MTX_Identity33_
	mov r0, #0xc1
	lsl r0, r0, #8
	add r0, r5, r0
	add r1, sp, #0x34
	bl sub_02018288
	ldr r0, [r5]
	mov r7, #0
	cmp r0, #0
	bls _02259A50
	ldr r0, _02259A54 ; =0x0000C010
	add r6, r5, #0
	add r0, r5, r0
	add r6, #8
	add r4, r5, #0
	str r0, [sp]
_02259A24:
	add r0, r6, #0
	add r1, sp, #0x10
	add r2, sp, #0x34
	bl MTX_Concat33
	ldrh r2, [r4, #0x2c]
	cmp r2, #3
	beq _02259A44
	mov r0, #0x78
	add r1, r2, #0
	mul r1, r0
	ldr r0, [sp]
	add r0, r0, r1
	add r1, sp, #0x34
	bl sub_02018288
_02259A44:
	ldr r0, [r5]
	add r7, r7, #1
	add r6, #0x30
	add r4, #0x30
	cmp r7, r0
	blo _02259A24
_02259A50:
	add sp, #0x58
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02259A54: .word 0x0000C010
_02259A58: .word 0x0000019A
_02259A5C: .word 0x0000C004
_02259A60: .word 0x0000C00C
_02259A64: .word 0x0000C008
	thumb_func_end ov48_022599A0

	thumb_func_start ov48_02259A68
ov48_02259A68: ; 0x02259A68
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r7, r1, #0
	str r2, [sp]
	mov r4, #0
_02259A74:
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ov45_0222D724
	cmp r0, #0
	beq _02259AC2
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ov45_0222D6FC
	lsl r1, r4, #0x18
	str r0, [sp, #4]
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ov45_0222D6B0
	lsl r0, r0, #0x18
	lsl r1, r4, #0x18
	lsr r6, r0, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ov45_0222D6D4
	cmp r6, r7
	bne _02259AC2
	ldr r1, [sp]
	cmp r0, r1
	bne _02259AC2
	ldr r0, [sp, #4]
	cmp r0, #1
	bne _02259ABC
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02259ABC:
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02259AC2:
	add r4, r4, #1
	cmp r4, #0x32
	blt _02259A74
	mov r0, #3
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov48_02259A68

	thumb_func_start ov48_02259AD0
ov48_02259AD0: ; 0x02259AD0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r2, [sp]
	add r5, r0, #0
	add r7, r1, #0
	str r3, [sp, #4]
	mov r4, #3
	bl ov48_02259BBC
	add r6, r0, #0
	ldr r2, [sp]
	add r0, r5, #0
	add r1, r7, #0
	bl ov48_02259B10
	add r7, r0, #0
	cmp r7, r6
	bge _02259B08
	add r0, r5, #0
	add r1, r7, #0
	bl ov48_02259B68
	add r4, r0, #0
	ldr r1, [sp, #4]
	add r0, r5, #0
	add r2, r7, #0
	bl ov48_02259B3C
_02259B08:
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov48_02259AD0

	thumb_func_start ov48_02259B10
ov48_02259B10: ; 0x02259B10
	push {r4, r5}
	ldr r5, [r0]
	mov r4, #0
	cmp r5, #0
	bls _02259B34
_02259B1A:
	ldrh r3, [r0, #0x2e]
	cmp r1, r3
	bne _02259B2C
	ldrh r3, [r0, #0x30]
	cmp r2, r3
	bne _02259B2C
	add r0, r4, #0
	pop {r4, r5}
	bx lr
_02259B2C:
	add r4, r4, #1
	add r0, #0x30
	cmp r4, r5
	blo _02259B1A
_02259B34:
	add r0, r5, #0
	pop {r4, r5}
	bx lr
	.balign 4, 0
	thumb_func_end ov48_02259B10

	thumb_func_start ov48_02259B3C
ov48_02259B3C: ; 0x02259B3C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r2, #0
	add r4, r1, #0
	cmp r6, r0
	blo _02259B4E
	bl GF_AssertFail
_02259B4E:
	mov r0, #0x30
	mul r0, r6
	add r1, r5, r0
	mov r0, #4
	ldrsh r0, [r1, r0]
	str r0, [r4]
	mov r0, #6
	ldrsh r0, [r1, r0]
	str r0, [r4, #4]
	mov r0, #0
	str r0, [r4, #8]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov48_02259B3C

	thumb_func_start ov48_02259B68
ov48_02259B68: ; 0x02259B68
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	cmp r4, r0
	blo _02259B78
	bl GF_AssertFail
_02259B78:
	mov r0, #0x30
	mul r0, r4
	add r0, r5, r0
	ldrh r0, [r0, #0x2c]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov48_02259B68

	thumb_func_start ov48_02259B84
ov48_02259B84: ; 0x02259B84
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	cmp r4, r0
	blo _02259B94
	bl GF_AssertFail
_02259B94:
	mov r0, #0x30
	mul r0, r4
	add r0, r5, r0
	ldrh r0, [r0, #0x2e]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov48_02259B84

	thumb_func_start ov48_02259BA0
ov48_02259BA0: ; 0x02259BA0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	cmp r4, r0
	blo _02259BB0
	bl GF_AssertFail
_02259BB0:
	mov r0, #0x30
	mul r0, r4
	add r0, r5, r0
	ldrh r0, [r0, #0x30]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov48_02259BA0

	thumb_func_start ov48_02259BBC
ov48_02259BBC: ; 0x02259BBC
	ldr r0, [r0]
	bx lr
	thumb_func_end ov48_02259BBC

	thumb_func_start ov48_02259BC0
ov48_02259BC0: ; 0x02259BC0
	push {r0, r1, r2, r3}
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	add r0, r3, #0
	bl GF_Camera_Create
	str r0, [r4]
	mov r3, #0
	str r3, [sp]
	ldr r0, [r4]
	ldr r1, _02259C2C ; =ov48_0225B16C
	str r0, [sp, #4]
	ldr r0, _02259C30 ; =ov48_0225B184
	ldr r2, _02259C34 ; =0x000005C1
	bl sub_02023308
	mov r1, #0x19
	ldr r2, [r4]
	mov r0, #0
	lsl r1, r1, #0xe
	bl GF_Camera_SetClipBounds
	ldr r1, [r4]
	mov r0, #0
	bl sub_020233D8
	ldr r0, [r4]
	bl GF_Camera_RegisterToStaticPtr
	ldr r0, [sp, #0x14]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bne _02259C0E
	mov r0, #1
	strh r0, [r4, #0x10]
	mov r0, #5
	lsl r0, r0, #0x10
	b _02259C16
_02259C0E:
	mov r0, #0
	strh r0, [r4, #0x10]
	mov r0, #0x4a
	lsl r0, r0, #0xe
_02259C16:
	str r0, [r4, #0xc]
	ldr r0, [r4, #0xc]
	ldr r1, [r4]
	bl GF_Camera_SetDistance
	add sp, #8
	pop {r4}
	pop {r3}
	add sp, #0x10
	bx r3
	nop
_02259C2C: .word ov48_0225B16C
_02259C30: .word ov48_0225B184
_02259C34: .word 0x000005C1
	thumb_func_end ov48_02259BC0

	thumb_func_start ov48_02259C38
ov48_02259C38: ; 0x02259C38
	ldr r3, _02259C40 ; =sub_02023120
	ldr r0, [r0]
	bx r3
	nop
_02259C40: .word sub_02023120
	thumb_func_end ov48_02259C38

	thumb_func_start ov48_02259C44
ov48_02259C44: ; 0x02259C44
	ldr r3, _02259C48 ; =sub_02023154
	bx r3
	.balign 4, 0
_02259C48: .word sub_02023154
	thumb_func_end ov48_02259C44

	thumb_func_start ov48_02259C4C
ov48_02259C4C: ; 0x02259C4C
	push {r4, lr}
	add r4, r0, #0
	ldrh r0, [r4, #0x10]
	cmp r0, #0
	bne _02259C62
	mov r0, #1
	strh r0, [r4, #0x10]
	ldr r0, _02259C74 ; =0x000005D5
	bl PlaySE
	b _02259C6C
_02259C62:
	mov r0, #0
	strh r0, [r4, #0x10]
	ldr r0, _02259C74 ; =0x000005D5
	bl PlaySE
_02259C6C:
	mov r0, #1
	strh r0, [r4, #0x12]
	pop {r4, pc}
	nop
_02259C74: .word 0x000005D5
	thumb_func_end ov48_02259C4C

	thumb_func_start ov48_02259C78
ov48_02259C78: ; 0x02259C78
	push {r3, lr}
	add r2, r0, #0
	ldrh r0, [r2, #0x12]
	cmp r0, #0
	bne _02259C86
	mov r0, #1
	pop {r3, pc}
_02259C86:
	ldrh r0, [r2, #0x10]
	cmp r0, #0
	beq _02259CBE
	cmp r0, #1
	bne _02259CEA
	mov r0, #0x16
	ldr r3, [r2, #0xc]
	lsl r0, r0, #0xe
	cmp r3, r0
	ble _02259CB2
	mov r0, #2
	lsl r0, r0, #0xe
	sub r0, r3, r0
	str r0, [r2, #0xc]
	ldr r0, _02259CF8 ; =0x0000C004
	ldr r3, [r1, r0]
	sub r3, #0x80
	str r3, [r1, r0]
	ldr r3, [r1, r0]
	add r0, r0, #4
	str r3, [r1, r0]
	b _02259CEA
_02259CB2:
	mov r0, #5
	lsl r0, r0, #0x10
	str r0, [r2, #0xc]
	mov r0, #0
	strh r0, [r2, #0x12]
	b _02259CEA
_02259CBE:
	mov r0, #0x12
	ldr r3, [r2, #0xc]
	lsl r0, r0, #0x10
	cmp r3, r0
	bge _02259CE0
	mov r0, #2
	lsl r0, r0, #0xe
	add r0, r3, r0
	str r0, [r2, #0xc]
	ldr r0, _02259CF8 ; =0x0000C004
	ldr r3, [r1, r0]
	add r3, #0x80
	str r3, [r1, r0]
	ldr r3, [r1, r0]
	add r0, r0, #4
	str r3, [r1, r0]
	b _02259CEA
_02259CE0:
	mov r0, #0x4a
	lsl r0, r0, #0xe
	str r0, [r2, #0xc]
	mov r0, #0
	strh r0, [r2, #0x12]
_02259CEA:
	ldr r0, [r2, #0xc]
	ldr r1, [r2]
	bl GF_Camera_SetDistance
	mov r0, #0
	pop {r3, pc}
	nop
_02259CF8: .word 0x0000C004
	thumb_func_end ov48_02259C78

	thumb_func_start ov48_02259CFC
ov48_02259CFC: ; 0x02259CFC
	ldrh r0, [r0, #0x10]
	bx lr
	thumb_func_end ov48_02259CFC

	thumb_func_start ov48_02259D00
ov48_02259D00: ; 0x02259D00
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r4, r1, #0
	add r6, r2, #0
	mov r1, #0
	mov r2, #0x2c
	add r5, r0, #0
	add r7, r3, #0
	bl memset
	mov r0, #0x15
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r2, #1
	add r1, r5, #0
	str r2, [sp, #0xc]
	mov r0, #0x28
	str r0, [sp, #0x10]
	ldr r0, [r4]
	add r1, #0x1c
	mov r3, #0x19
	bl AddWindowParameterized
	add r0, r5, #0
	add r0, #0x1c
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r6, #0
	mov r1, #1
	bl ov48_0225B0C4
	add r4, r0, #0
	mov r0, #2
	add r1, r7, #0
	bl FontID_Alloc
	mov r0, #2
	add r1, r4, #0
	mov r2, #0
	mov r3, #0x30
	bl FontID_String_GetCenterAlignmentX
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02259D90 ; =0x0002010F
	add r2, r4, #0
	str r0, [sp, #8]
	add r0, r5, #0
	str r1, [sp, #0xc]
	add r0, #0x1c
	mov r1, #2
	bl AddTextPrinterParameterized2
	mov r0, #2
	bl FontID_Release
	add r5, #0x1c
	mov r1, #0
	add r0, r5, #0
	mov r2, #0x1f
	add r3, r1, #0
	bl DrawFrameAndWindow1
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02259D90: .word 0x0002010F
	thumb_func_end ov48_02259D00

	thumb_func_start ov48_02259D94
ov48_02259D94: ; 0x02259D94
	ldr r3, _02259D9C ; =RemoveWindow
	add r0, #0x1c
	bx r3
	nop
_02259D9C: .word RemoveWindow
	thumb_func_end ov48_02259D94

	thumb_func_start ov48_02259DA0
ov48_02259DA0: ; 0x02259DA0
	push {r4, lr}
	sub sp, #0x18
	add r4, r0, #0
	mov r0, #0
	str r0, [r4]
	ldr r0, _02259E58 ; =gSystem + 0x40
	ldrh r1, [r0, #0x24]
	cmp r1, #0
	beq _02259DE8
	ldrh r1, [r0, #0x20]
	cmp r1, #0xc8
	blo _02259DCE
	cmp r1, #0xf8
	bhi _02259DCE
	ldrh r0, [r0, #0x22]
	cmp r0, #0xa8
	blo _02259DCE
	cmp r0, #0xb8
	bhi _02259DCE
	mov r0, #2
	add sp, #0x18
	str r0, [r4]
	pop {r4, pc}
_02259DCE:
	mov r0, #0
	str r0, [r4, #4]
	str r0, [r4, #0x10]
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	str r0, [r4]
	ldr r0, _02259E58 ; =gSystem + 0x40
	ldrh r1, [r0, #0x20]
	str r1, [r4, #8]
	ldrh r0, [r0, #0x22]
	str r0, [r4, #0xc]
	mov r0, #4
	str r0, [r4, #0x18]
_02259DE8:
	ldr r0, _02259E58 ; =gSystem + 0x40
	ldrh r0, [r0, #0x26]
	cmp r0, #0
	beq _02259E40
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _02259DFE
	cmp r1, #1
	beq _02259E0E
	add sp, #0x18
	pop {r4, pc}
_02259DFE:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	bne _02259E0A
	add r0, r1, #1
	str r0, [r4, #4]
	b _02259E0E
_02259E0A:
	sub r0, r0, #1
	str r0, [r4, #0x18]
_02259E0E:
	add r0, sp, #0xc
	str r0, [sp]
	add r0, sp, #8
	str r0, [sp, #4]
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	add r2, sp, #0x14
	add r3, sp, #0x10
	bl ov48_02258CE4
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0xc]
	orr r0, r1
	str r0, [r4]
	ldr r0, [sp, #0x10]
	str r0, [r4, #0x10]
	ldr r0, [sp, #8]
	add sp, #0x18
	str r0, [r4, #0x14]
	ldr r0, _02259E58 ; =gSystem + 0x40
	ldrh r1, [r0, #0x20]
	str r1, [r4, #8]
	ldrh r0, [r0, #0x22]
	str r0, [r4, #0xc]
	pop {r4, pc}
_02259E40:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _02259E4A
	mov r0, #1
	str r0, [r4]
_02259E4A:
	mov r0, #0
	str r0, [r4, #4]
	str r0, [r4, #0x10]
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	add sp, #0x18
	pop {r4, pc}
	.balign 4, 0
_02259E58: .word gSystem + 0x40
	thumb_func_end ov48_02259DA0

	thumb_func_start ov48_02259E5C
ov48_02259E5C: ; 0x02259E5C
	cmp r1, #0
	beq _02259E6A
	cmp r1, #1
	beq _02259E6E
	cmp r1, #2
	beq _02259E72
	bx lr
_02259E6A:
	ldr r0, [r0]
	bx lr
_02259E6E:
	ldr r0, [r0, #0x10]
	bx lr
_02259E72:
	ldr r0, [r0, #0x14]
	bx lr
	.balign 4, 0
	thumb_func_end ov48_02259E5C

	thumb_func_start ov48_02259E78
ov48_02259E78: ; 0x02259E78
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x1c
	mov r1, #1
	bl sub_0200E5D4
	add r4, #0x1c
	add r0, r4, #0
	bl ClearWindowTilemapAndScheduleTransfer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov48_02259E78

	thumb_func_start ov48_02259E90
ov48_02259E90: ; 0x02259E90
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x1c
	bl ScheduleWindowCopyToVram
	add r4, #0x1c
	mov r1, #0
	add r0, r4, #0
	mov r2, #0x1f
	add r3, r1, #0
	bl DrawFrameAndWindow1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov48_02259E90

	thumb_func_start ov48_02259EAC
ov48_02259EAC: ; 0x02259EAC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	mov r1, #0
	mov r2, #0x2c
	add r5, r0, #0
	bl memset
	add r0, r7, #0
	bl Sav2_PlayerData_GetOptionsAddr
	bl Options_GetTextFrameDelay
	str r0, [r5, #8]
	ldr r1, [sp, #0x28]
	mov r0, #0x80
	bl String_ctor
	str r0, [r5, #0xc]
	mov r2, #1
	add r1, r5, #0
	str r2, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	mov r0, #0x34
	str r0, [sp, #0x10]
	ldr r0, [r4]
	add r1, #0x10
	mov r3, #2
	bl AddWindowParameterized
	add r0, r5, #0
	add r0, #0x10
	mov r1, #0xf
	bl FillWindowPixelBuffer
	ldr r2, [r5, #0xc]
	add r0, r6, #0
	mov r1, #5
	bl ov48_0225B0D4
	ldr r0, [sp, #0x28]
	bl sub_0201660C
	str r0, [r5, #0x20]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov48_02259EAC

	thumb_func_start ov48_02259F14
ov48_02259F14: ; 0x02259F14
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _02259F30
	ldr r0, [r4, #4]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_020200A0
_02259F30:
	ldr r0, [r4, #0xc]
	bl String_dtor
	ldr r0, [r4, #0x20]
	bl sub_02016624
	add r4, #0x10
	add r0, r4, #0
	bl RemoveWindow
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov48_02259F14

	thumb_func_start ov48_02259F48
ov48_02259F48: ; 0x02259F48
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r0, #0x10
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r4, #0
	mov r1, #1
	add r0, #0x10
	add r2, r1, #0
	mov r3, #2
	bl DrawFrameAndWindow2
	add r0, r4, #0
	add r0, #0x10
	bl ScheduleWindowCopyToVram
	mov r3, #0
	str r3, [sp]
	ldr r0, [r4, #8]
	mov r1, #1
	str r0, [sp, #4]
	str r3, [sp, #8]
	add r0, r4, #0
	ldr r2, [r4, #0xc]
	add r0, #0x10
	bl AddTextPrinterParameterized
	str r0, [r4, #4]
	mov r0, #0
	str r0, [r4]
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov48_02259F48

	thumb_func_start ov48_02259F8C
ov48_02259F8C: ; 0x02259F8C
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, [r5]
	cmp r0, #0
	beq _02259F9E
	cmp r0, #1
	beq _02259FD8
	b _02259FE0
_02259F9E:
	ldr r0, [r5, #4]
	mov r4, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _02259FE0
	ldr r3, _02259FE8 ; =ov48_0225B1C4
	add r2, sp, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	add r0, r5, #0
	add r0, #0x10
	bl GetWindowBgConfig
	str r0, [sp]
	ldr r0, [r5, #0x20]
	add r1, sp, #0
	bl sub_020166FC
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02259FE0
_02259FD8:
	ldr r0, [r5, #0x20]
	bl sub_020168F4
	add r4, r0, #0
_02259FE0:
	add r0, r4, #0
	add sp, #0x14
	pop {r4, r5, pc}
	nop
_02259FE8: .word ov48_0225B1C4
	thumb_func_end ov48_02259F8C

	thumb_func_start ov48_02259FEC
ov48_02259FEC: ; 0x02259FEC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x20]
	bl sub_020169CC
	add r0, r4, #0
	add r0, #0x10
	mov r1, #1
	bl ClearFrameAndWindow2
	add r4, #0x10
	add r0, r4, #0
	bl ClearWindowTilemapAndScheduleTransfer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov48_02259FEC

	thumb_func_start ov48_0225A00C
ov48_0225A00C: ; 0x0225A00C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	str r1, [sp, #0x18]
	str r2, [sp, #0x1c]
	mov r2, #0
	add r1, r0, #0
	str r0, [sp, #0x14]
	str r3, [sp, #0x20]
	str r2, [r1]
	bl ov48_0225A288
	ldr r5, [sp, #0x14]
	ldr r4, _0225A100 ; =_0225B164
	ldr r6, _0225A104 ; =ov48_0225B268
	mov r7, #0
	add r5, #0xa0
_0225A02C:
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x18]
	str r0, [sp]
	ldrb r3, [r4]
	add r0, r5, #0
	add r2, r6, #0
	bl ov48_0225A894
	add r7, r7, #1
	add r4, r4, #1
	add r6, #0xc
	add r5, #0x28
	cmp r7, #5
	blt _0225A02C
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r2, #4
	str r2, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	mov r0, #0x28
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x18]
	mov r3, #0x6a
	ldr r1, [sp, #0x14]
	lsl r3, r3, #2
	add r1, r1, r3
	ldr r0, [r0]
	mov r3, #2
	bl AddWindowParameterized
	mov r1, #0x6a
	ldr r0, [sp, #0x14]
	lsl r1, r1, #2
	add r0, r0, r1
	mov r1, #0xf
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x1c]
	mov r1, #0
	bl ov48_0225B0C4
	mov r3, #0
	add r2, r0, #0
	str r3, [sp]
	mov r1, #0xff
	str r1, [sp, #4]
	ldr r0, [sp, #0x14]
	add r1, #0xa9
	add r0, r0, r1
	mov r1, #1
	str r3, [sp, #8]
	bl AddTextPrinterParameterized
	mov r1, #0x6a
	mov r2, #0xa
	ldr r0, [sp, #0x14]
	lsl r1, r1, #2
	add r0, r0, r1
	mov r1, #0
	add r3, r2, #0
	bl DrawFrameAndWindow2
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x20]
	bl ov48_0225A6DC
	ldr r0, [sp, #0x20]
	mov r1, #0x51
	str r0, [sp]
	ldr r3, [sp, #0x14]
	ldr r0, [sp, #0x18]
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	mov r1, #0x13
	mov r2, #0
	add r3, #0x98
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	ldr r1, [sp, #0x14]
	mov r3, #0xb9
	add r1, #0x94
	str r0, [r1]
	mov r1, #0x6e
	ldr r0, [sp, #0x14]
	lsl r1, r1, #2
	add r0, r0, r1
	ldr r2, [sp, #0x14]
	lsl r3, r3, #2
	add r2, r2, r3
	ldr r1, [sp, #0x18]
	ldr r3, [sp, #0x20]
	bl ov48_0225AAAC
	mov r1, #0xb9
	ldr r0, [sp, #0x14]
	lsl r1, r1, #2
	add r0, r0, r1
	bl ov48_0225A5C4
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_0225A100: .word _0225B164
_0225A104: .word ov48_0225B268
	thumb_func_end ov48_0225A00C

	thumb_func_start ov48_0225A108
ov48_0225A108: ; 0x0225A108
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xb9
	lsl r0, r0, #2
	add r0, r5, r0
	add r4, r1, #0
	bl ov48_0225A634
	mov r0, #0x6e
	lsl r0, r0, #2
	add r0, r5, r0
	add r1, r4, #0
	bl ov48_0225AC34
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	bl FreeToHeap
	add r0, r5, #0
	bl ov48_0225A768
	mov r0, #0x6a
	lsl r0, r0, #2
	add r0, r5, r0
	bl RemoveWindow
	add r0, r5, #0
	bl ov48_0225A294
	mov r4, #0
	add r5, #0xa0
_0225A148:
	add r0, r5, #0
	bl ov48_0225A928
	add r4, r4, #1
	add r5, #0x28
	cmp r4, #5
	blt _0225A148
	pop {r3, r4, r5, pc}
	thumb_func_end ov48_0225A108

	thumb_func_start ov48_0225A158
ov48_0225A158: ; 0x0225A158
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r3, [r4]
	add r5, r2, #0
	cmp r3, #4
	bhi _0225A1CC
	add r3, r3, r3
	add r3, pc
	ldrh r3, [r3, #6]
	lsl r3, r3, #0x10
	asr r3, r3, #0x10
	add pc, r3
_0225A170: ; jump table
	.short _0225A17A - _0225A170 - 2 ; case 0
	.short _0225A192 - _0225A170 - 2 ; case 1
	.short _0225A19C - _0225A170 - 2 ; case 2
	.short _0225A1AC - _0225A170 - 2 ; case 3
	.short _0225A1BE - _0225A170 - 2 ; case 4
_0225A17A:
	add r1, r5, #0
	bl ov48_0225A338
	mov r0, #0x6e
	mov r1, #0xb9
	lsl r0, r0, #2
	lsl r1, r1, #2
	add r0, r4, r0
	add r1, r4, r1
	bl ov48_0225AD54
	pop {r3, r4, r5, pc}
_0225A192:
	bl ov48_0225A354
	mov r0, #2
	str r0, [r4]
	pop {r3, r4, r5, pc}
_0225A19C:
	add r1, r5, #0
	bl ov48_0225A41C
	cmp r0, #1
	bne _0225A1CC
	mov r0, #0
	str r0, [r4]
	pop {r3, r4, r5, pc}
_0225A1AC:
	bl ov48_0225A428
	add r0, r4, #0
	add r1, r5, #0
	bl ov48_0225A430
	mov r0, #4
	str r0, [r4]
	pop {r3, r4, r5, pc}
_0225A1BE:
	add r1, r5, #0
	bl ov48_0225A430
	cmp r0, #1
	bne _0225A1CC
	mov r0, #0
	str r0, [r4]
_0225A1CC:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov48_0225A158

	thumb_func_start ov48_0225A1D0
ov48_0225A1D0: ; 0x0225A1D0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x6a
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	mov r0, #0x6a
	lsl r0, r0, #2
	add r0, r4, r0
	bl ClearWindowTilemapAndScheduleTransfer
	pop {r4, pc}
	thumb_func_end ov48_0225A1D0

	thumb_func_start ov48_0225A1EC
ov48_0225A1EC: ; 0x0225A1EC
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x6a
	lsl r0, r0, #2
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	mov r0, #0x6a
	lsl r0, r0, #2
	mov r2, #0xa
	add r0, r4, r0
	mov r1, #1
	add r3, r2, #0
	bl DrawFrameAndWindow2
	pop {r4, pc}
	thumb_func_end ov48_0225A1EC

	thumb_func_start ov48_0225A20C
ov48_0225A20C: ; 0x0225A20C
	push {r3, lr}
	ldr r2, [r0]
	cmp r2, #4
	bhi _0225A23C
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0225A220: ; jump table
	.short _0225A22A - _0225A220 - 2 ; case 0
	.short _0225A238 - _0225A220 - 2 ; case 1
	.short _0225A230 - _0225A220 - 2 ; case 2
	.short _0225A238 - _0225A220 - 2 ; case 3
	.short _0225A238 - _0225A220 - 2 ; case 4
_0225A22A:
	mov r2, #1
	str r2, [r0]
	b _0225A23C
_0225A230:
	mov r1, #3
	str r1, [r0]
	mov r0, #0
	pop {r3, pc}
_0225A238:
	mov r0, #0
	pop {r3, pc}
_0225A23C:
	bl ov48_0225A2A0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ov48_0225A20C

	thumb_func_start ov48_0225A244
ov48_0225A244: ; 0x0225A244
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	add r5, r1, #0
	mov r4, #0
	add r7, sp, #0
_0225A250:
	add r0, r6, #0
	add r1, r7, #0
	add r2, r4, #0
	bl ov48_0225A30C
	cmp r0, #0
	bne _0225A264
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0225A264:
	ldr r1, [sp, #4]
	ldr r0, [r5, #4]
	cmp r1, r0
	bne _0225A27A
	ldr r1, [sp, #8]
	ldr r0, [r5, #8]
	cmp r1, r0
	bne _0225A27A
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0225A27A:
	add r4, r4, #1
	cmp r4, #3
	blt _0225A250
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov48_0225A244

	thumb_func_start ov48_0225A288
ov48_0225A288: ; 0x0225A288
	mov r1, #0
	strh r1, [r0, #0x34]
	strh r1, [r0, #0x36]
	str r1, [r0, #0x38]
	bx lr
	.balign 4, 0
	thumb_func_end ov48_0225A288

	thumb_func_start ov48_0225A294
ov48_0225A294: ; 0x0225A294
	mov r1, #0
	strh r1, [r0, #0x34]
	strh r1, [r0, #0x36]
	str r1, [r0, #0x38]
	bx lr
	.balign 4, 0
	thumb_func_end ov48_0225A294

	thumb_func_start ov48_0225A2A0
ov48_0225A2A0: ; 0x0225A2A0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldrh r1, [r5, #0x36]
	add r1, r1, #1
	lsr r3, r1, #0x1f
	lsl r2, r1, #0x1e
	sub r2, r2, r3
	mov r1, #0x1e
	ror r2, r1
	ldrh r1, [r5, #0x34]
	add r2, r3, r2
	cmp r2, r1
	bne _0225A2C0
	bl ov48_0225A2EC
_0225A2C0:
	ldrh r1, [r5, #0x36]
	mov r0, #0xc
	mul r0, r1
	add r0, r5, r0
	add r2, r0, #4
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r4]
	str r0, [r2]
	ldrh r0, [r5, #0x36]
	add r0, r0, #1
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1e
	sub r1, r1, r2
	mov r0, #0x1e
	ror r1, r0
	add r0, r2, r1
	strh r0, [r5, #0x36]
	ldr r0, [r5, #0x38]
	add r0, r0, #1
	str r0, [r5, #0x38]
	pop {r3, r4, r5, pc}
	thumb_func_end ov48_0225A2A0

	thumb_func_start ov48_0225A2EC
ov48_0225A2EC: ; 0x0225A2EC
	ldrh r2, [r0, #0x34]
	ldrh r1, [r0, #0x36]
	cmp r1, r2
	beq _0225A30A
	add r1, r2, #1
	lsr r3, r1, #0x1f
	lsl r2, r1, #0x1e
	sub r2, r2, r3
	mov r1, #0x1e
	ror r2, r1
	add r1, r3, r2
	strh r1, [r0, #0x34]
	ldr r1, [r0, #0x38]
	sub r1, r1, #1
	str r1, [r0, #0x38]
_0225A30A:
	bx lr
	thumb_func_end ov48_0225A2EC

	thumb_func_start ov48_0225A30C
ov48_0225A30C: ; 0x0225A30C
	add r3, r1, #0
	ldr r1, [r0, #0x38]
	cmp r2, r1
	blo _0225A318
	mov r0, #0
	bx lr
_0225A318:
	ldrh r1, [r0, #0x36]
	sub r1, r1, #1
	sub r2, r1, r2
	bpl _0225A322
	add r2, r2, #4
_0225A322:
	mov r1, #0xc
	mul r1, r2
	add r0, r0, r1
	add r2, r0, #4
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	mov r0, #1
	bx lr
	.balign 4, 0
	thumb_func_end ov48_0225A30C

	thumb_func_start ov48_0225A338
ov48_0225A338: ; 0x0225A338
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r4, #0
	add r5, #0xa0
_0225A342:
	add r0, r5, #0
	add r1, r6, #0
	bl ov48_0225A95C
	add r4, r4, #1
	add r5, #0x28
	cmp r4, #5
	blt _0225A342
	pop {r4, r5, r6, pc}
	thumb_func_end ov48_0225A338

	thumb_func_start ov48_0225A354
ov48_0225A354: ; 0x0225A354
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	str r1, [sp]
	add r0, #0x40
	mov r1, #0
	mov r2, #0x48
	bl memset
	mov r6, #0
	strh r6, [r5, #0x3c]
	add r4, r5, #0
	strh r6, [r5, #0x3e]
	add r4, #0xa0
_0225A370:
	add r0, r4, #0
	bl ov48_0225AA50
	add r6, r6, #1
	add r4, #0x28
	cmp r6, #5
	blt _0225A370
	mov r0, #0x6e
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov48_0225ACAC
	add r0, r5, #0
	str r0, [sp, #8]
	add r0, #0xa0
	mov r7, #0
	str r0, [sp, #8]
	add r0, r5, #0
	mvn r7, r7
	str r0, [sp, #0xc]
	add r0, #0x3e
	mov r6, #0
	str r7, [sp, #0x10]
	str r0, [sp, #0xc]
_0225A3A0:
	mov r0, #2
	sub r4, r0, r6
	add r0, r5, #0
	add r1, sp, #0x14
	add r2, r6, #0
	bl ov48_0225A30C
	cmp r0, #1
	bne _0225A406
	ldr r0, [sp, #0x14]
	bl ov48_0225B038
	mov r1, #0x28
	str r0, [sp, #4]
	mul r1, r0
	ldr r0, [sp, #8]
	mov r2, #1
	add r0, r0, r1
	add r1, r4, #0
	bl ov48_0225AA38
	ldr r3, [sp]
	add r0, r5, #0
	add r1, r4, #0
	add r2, sp, #0x14
	bl ov48_0225A790
	lsl r0, r4, #2
	add r1, r5, r0
	lsl r3, r7, #0x18
	ldr r0, [sp, #4]
	add r1, #0x88
	str r0, [r1]
	ldr r2, [sp, #0x14]
	mov r0, #0x6e
	lsl r0, r0, #2
	lsl r1, r4, #0x18
	lsl r2, r2, #0x18
	add r0, r5, r0
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl ov48_0225ACD8
	ldr r0, [sp, #0xc]
	ldrh r0, [r0]
	add r1, r0, #6
	ldr r0, [sp, #0xc]
	strh r1, [r0]
	ldr r7, [sp, #0x14]
	b _0225A412
_0225A406:
	lsl r0, r4, #2
	add r1, r5, r0
	add r1, #0x88
	mov r0, #5
	ldr r7, [sp, #0x10]
	str r0, [r1]
_0225A412:
	add r6, r6, #1
	cmp r6, #3
	blt _0225A3A0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov48_0225A354

	thumb_func_start ov48_0225A41C
ov48_0225A41C: ; 0x0225A41C
	ldr r3, _0225A424 ; =ov48_0225A43C
	mov r2, #2
	bx r3
	nop
_0225A424: .word ov48_0225A43C
	thumb_func_end ov48_0225A41C

	thumb_func_start ov48_0225A428
ov48_0225A428: ; 0x0225A428
	ldrh r1, [r0, #0x3c]
	lsr r1, r1, #1
	strh r1, [r0, #0x3c]
	bx lr
	thumb_func_end ov48_0225A428

	thumb_func_start ov48_0225A430
ov48_0225A430: ; 0x0225A430
	ldr r3, _0225A438 ; =ov48_0225A43C
	mov r2, #1
	bx r3
	nop
_0225A438: .word ov48_0225A43C
	thumb_func_end ov48_0225A430

	thumb_func_start ov48_0225A43C
ov48_0225A43C: ; 0x0225A43C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrh r0, [r5, #0x3c]
	add r4, r2, #0
	add r6, r1, #0
	add r1, r4, #0
	mov r7, #1
	str r0, [sp]
	bl _s32_div_f
	cmp r1, #0
	bne _0225A464
	ldr r0, [sp]
	add r1, r4, #0
	bl _s32_div_f
	add r1, r0, #0
	add r0, r5, #0
	bl ov48_0225A4B4
_0225A464:
	ldrh r0, [r5, #0x3c]
	add r1, r0, #1
	mov r0, #0x12
	mul r0, r4
	cmp r1, r0
	bge _0225A472
	strh r1, [r5, #0x3c]
_0225A472:
	ldrh r0, [r5, #0x3e]
	mov r4, #0
	cmp r0, #0
	ble _0225A492
_0225A47A:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov48_0225A4C0
	cmp r0, #0
	bne _0225A48A
	mov r7, #0
_0225A48A:
	ldrh r0, [r5, #0x3e]
	add r4, r4, #1
	cmp r4, r0
	blt _0225A47A
_0225A492:
	cmp r7, #1
	bne _0225A4AE
	mov r0, #0x6e
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov48_0225AD38
	mov r0, #0xb9
	lsl r0, r0, #2
	mov r1, #0
	add r0, r5, r0
	add r2, r1, #0
	bl ov48_0225A668
_0225A4AE:
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov48_0225A43C

	thumb_func_start ov48_0225A4B4
ov48_0225A4B4: ; 0x0225A4B4
	lsl r1, r1, #2
	add r0, r0, r1
	mov r2, #1
	add r0, #0x40
	strb r2, [r0]
	bx lr
	thumb_func_end ov48_0225A4B4

	thumb_func_start ov48_0225A4C0
ov48_0225A4C0: ; 0x0225A4C0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r2, [sp]
	add r5, r0, #0
	lsl r2, r1, #2
	add r0, r5, r2
	add r0, #0x40
	ldrb r0, [r0]
	cmp r0, #0
	bne _0225A4DA
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0225A4DA:
	add r0, r5, #0
	add r0, #0x41
	ldrsb r4, [r0, r2]
	add r6, r0, r2
	cmp r4, #2
	blt _0225A4EC
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225A4EC:
	mov r0, #0x11
	sub r7, r0, r1
	add r0, r7, #0
	mov r1, #6
	bl _u32_div_f
	str r0, [sp, #0xc]
	add r0, r7, #0
	mov r1, #6
	bl _u32_div_f
	ldr r0, [sp, #0xc]
	str r1, [sp, #4]
	lsl r0, r0, #2
	add r0, r5, r0
	add r0, #0x88
	ldr r0, [r0]
	cmp r4, #0
	str r0, [sp, #8]
	beq _0225A51A
	cmp r4, #1
	beq _0225A548
	b _0225A570
_0225A51A:
	add r0, r5, #0
	bl ov48_0225A858
	add r3, r0, #0
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #4]
	add r0, r5, #0
	bl ov48_0225A868
	ldr r2, [sp]
	add r0, r5, #0
	add r1, r7, #0
	bl ov48_0225A57C
	mov r0, #0xb9
	lsl r0, r0, #2
	lsl r1, r7, #0x13
	add r0, r5, r0
	asr r1, r1, #0x10
	mov r2, #0x90
	bl ov48_0225A668
	b _0225A570
_0225A548:
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #4]
	add r0, r5, #0
	bl ov48_0225A834
	add r3, r0, #0
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #4]
	add r0, r5, #0
	bl ov48_0225A868
	ldr r0, [sp, #8]
	mov r1, #0x28
	add r5, #0xa0
	mul r1, r0
	add r0, r5, r1
	ldr r2, [sp]
	add r1, r7, #0
	bl ov48_0225AA5C
_0225A570:
	mov r0, #0
	ldrsb r1, [r6, r0]
	add r1, r1, #1
	strb r1, [r6]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov48_0225A4C0

	thumb_func_start ov48_0225A57C
ov48_0225A57C: ; 0x0225A57C
	push {r3, r4, lr}
	sub sp, #0x1c
	add r0, #0x98
	ldr r0, [r0]
	add r4, r2, #0
	mov r2, #0x20
	str r2, [sp]
	mov r2, #1
	str r2, [sp, #4]
	add r2, r0, #0
	add r2, #0xc
	str r2, [sp, #8]
	mov r2, #0
	lsl r1, r1, #0x18
	str r2, [sp, #0xc]
	lsr r3, r1, #0x18
	str r3, [sp, #0x10]
	ldrh r1, [r0]
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #6
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r4]
	bl CopyToBgTilemapRect
	ldr r0, [r4]
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x1c
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov48_0225A57C

	thumb_func_start ov48_0225A5C4
ov48_0225A5C4: ; 0x0225A5C4
	push {r4, r5, r6, lr}
	ldr r1, _0225A624 ; =0x04001000
	ldr r2, _0225A628 ; =0xFFFF1FFF
	ldr r3, [r1]
	add r5, r1, #0
	and r3, r2
	mov r2, #6
	lsl r2, r2, #0xc
	orr r2, r3
	str r2, [r1]
	add r5, #0x4a
	ldrh r6, [r5]
	mov r3, #0x3f
	mov r2, #0x1f
	bic r6, r3
	orr r2, r6
	strh r2, [r5]
	add r1, #0x48
	ldrh r5, [r1]
	mov r2, #0xf
	add r4, r0, #0
	bic r5, r3
	add r3, r5, #0
	orr r3, r2
	strh r3, [r1]
	ldrh r5, [r1]
	ldr r3, _0225A62C ; =0xFFFFC0FF
	lsl r2, r2, #8
	and r3, r5
	orr r2, r3
	strh r2, [r1]
	mov r1, #0
	add r2, r1, #0
	bl ov48_0225A650
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov48_0225A668
	ldr r0, _0225A630 ; =ov48_0225A680
	add r1, r4, #0
	mov r2, #0
	bl sub_0200E374
	str r0, [r4, #0xc]
	pop {r4, r5, r6, pc}
	nop
_0225A624: .word 0x04001000
_0225A628: .word 0xFFFF1FFF
_0225A62C: .word 0xFFFFC0FF
_0225A630: .word ov48_0225A680
	thumb_func_end ov48_0225A5C4

	thumb_func_start ov48_0225A634
ov48_0225A634: ; 0x0225A634
	push {r3, lr}
	ldr r0, [r0, #0xc]
	bl DestroySysTask
	ldr r2, _0225A648 ; =0x04001000
	ldr r0, _0225A64C ; =0xFFFF1FFF
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	pop {r3, pc}
	.balign 4, 0
_0225A648: .word 0x04001000
_0225A64C: .word 0xFFFF1FFF
	thumb_func_end ov48_0225A634

	thumb_func_start ov48_0225A650
ov48_0225A650: ; 0x0225A650
	cmp r1, #0
	bge _0225A656
	mov r1, #0
_0225A656:
	cmp r2, #0
	bge _0225A65C
	mov r2, #0
_0225A65C:
	mov r3, #1
	strh r3, [r0]
	strh r1, [r0, #4]
	strh r2, [r0, #6]
	bx lr
	.balign 4, 0
	thumb_func_end ov48_0225A650

	thumb_func_start ov48_0225A668
ov48_0225A668: ; 0x0225A668
	cmp r1, #0
	bge _0225A66E
	mov r1, #0
_0225A66E:
	cmp r2, #0
	bge _0225A674
	mov r2, #0
_0225A674:
	mov r3, #1
	strh r3, [r0, #2]
	strh r1, [r0, #8]
	strh r2, [r0, #0xa]
	bx lr
	.balign 4, 0
	thumb_func_end ov48_0225A668

	thumb_func_start ov48_0225A680
ov48_0225A680: ; 0x0225A680
	push {r4, r5}
	mov r4, #0
	ldrsh r0, [r1, r4]
	cmp r0, #0
	beq _0225A6A8
	mov r0, #6
	ldrsh r2, [r1, r0]
	mov r0, #4
	ldrsh r5, [r1, r0]
	ldr r0, _0225A6D4 ; =0x04001040
	mov r3, #0xff
	strh r3, [r0]
	lsl r2, r2, #0x18
	lsl r5, r5, #8
	lsl r3, r3, #8
	and r3, r5
	lsr r2, r2, #0x18
	orr r2, r3
	strh r2, [r0, #4]
	strh r4, [r1]
_0225A6A8:
	mov r0, #2
	ldrsh r0, [r1, r0]
	cmp r0, #0
	beq _0225A6D0
	mov r0, #0xa
	ldrsh r2, [r1, r0]
	mov r0, #8
	ldrsh r4, [r1, r0]
	ldr r0, _0225A6D8 ; =0x04001042
	mov r3, #0xff
	strh r3, [r0]
	lsl r2, r2, #0x18
	lsl r4, r4, #8
	lsl r3, r3, #8
	and r3, r4
	lsr r2, r2, #0x18
	orr r2, r3
	strh r2, [r0, #4]
	mov r0, #0
	strh r0, [r1, #2]
_0225A6D0:
	pop {r4, r5}
	bx lr
	.balign 4, 0
_0225A6D4: .word 0x04001040
_0225A6D8: .word 0x04001042
	thumb_func_end ov48_0225A680

	thumb_func_start ov48_0225A6DC
ov48_0225A6DC: ; 0x0225A6DC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	mov r6, #0x94
	str r1, [sp, #0x18]
	add r1, r6, #0
	mov r7, #0
	add r1, #0xd4
	str r0, [sp, #0x14]
	add r4, r7, #0
	add r5, r0, r1
_0225A6F0:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #6
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	lsl r0, r6, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x18]
	add r1, r5, #0
	ldr r0, [r0]
	mov r2, #5
	mov r3, #0
	bl AddWindowParameterized
	add r0, r5, #0
	mov r1, #0
	add r6, #0xa2
	bl FillWindowPixelBuffer
	add r0, r5, #0
	bl CopyWindowToVram
	add r7, r7, #1
	add r4, r4, #6
	add r5, #0x10
	cmp r7, #3
	blt _0225A6F0
	mov r3, #0
	str r3, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #6
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	mov r0, #0x94
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x18]
	mov r2, #0x66
	ldr r1, [sp, #0x14]
	lsl r2, r2, #2
	add r1, r1, r2
	ldr r0, [r0]
	mov r2, #5
	bl AddWindowParameterized
	mov r1, #0x66
	ldr r0, [sp, #0x14]
	lsl r1, r1, #2
	add r0, r0, r1
	mov r1, #0
	bl FillWindowPixelBuffer
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov48_0225A6DC

	thumb_func_start ov48_0225A768
ov48_0225A768: ; 0x0225A768
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r0, #0x5a
	lsl r0, r0, #2
	mov r4, #0
	add r5, r6, r0
_0225A774:
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #3
	blt _0225A774
	mov r0, #0x66
	lsl r0, r0, #2
	add r0, r6, r0
	bl RemoveWindow
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov48_0225A768

	thumb_func_start ov48_0225A790
ov48_0225A790: ; 0x0225A790
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	add r7, r3, #0
	cmp r4, #3
	blo _0225A7A4
	bl GF_AssertFail
_0225A7A4:
	mov r0, #0x5a
	lsl r0, r0, #2
	add r5, r5, r0
	lsl r4, r4, #4
	add r0, r5, r4
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r6]
	bl ov48_0225B038
	str r0, [sp, #0x10]
	add r0, r7, #0
	mov r1, #2
	bl ov48_0225B0C4
	mov r3, #0
	add r2, r0, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	lsl r1, r0, #2
	ldr r0, _0225A82C ; =ov48_0225B1D8
	ldr r0, [r0, r1]
	mov r1, #1
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	add r0, r5, r4
	bl AddTextPrinterParameterized2
	ldr r1, [r6, #4]
	add r0, r7, #0
	bl ov48_0225B0E0
	add r2, r0, #0
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225A830 ; =0x00010200
	mov r3, #0
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	add r0, r5, r4
	mov r1, #1
	bl AddTextPrinterParameterized2
	ldr r1, [r6, #4]
	ldr r2, [r6, #8]
	add r0, r7, #0
	bl ov48_0225B108
	add r2, r0, #0
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225A830 ; =0x00010200
	mov r3, #0
	str r0, [sp, #8]
	add r0, r5, r4
	mov r1, #1
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0225A82C: .word ov48_0225B1D8
_0225A830: .word 0x00010200
	thumb_func_end ov48_0225A790

	thumb_func_start ov48_0225A834
ov48_0225A834: ; 0x0225A834
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #3
	blo _0225A844
	bl GF_AssertFail
_0225A844:
	lsl r0, r4, #4
	add r1, r5, r0
	mov r0, #0x5d
	lsl r0, r0, #2
	ldr r1, [r1, r0]
	mov r0, #0x36
	lsl r0, r0, #4
	mul r0, r6
	add r0, r1, r0
	pop {r4, r5, r6, pc}
	thumb_func_end ov48_0225A834

	thumb_func_start ov48_0225A858
ov48_0225A858: ; 0x0225A858
	mov r2, #0x69
	lsl r2, r2, #2
	ldr r2, [r0, r2]
	mov r0, #0x36
	lsl r0, r0, #4
	mul r0, r1
	add r0, r2, r0
	bx lr
	thumb_func_end ov48_0225A858

	thumb_func_start ov48_0225A868
ov48_0225A868: ; 0x0225A868
	push {r3, r4, r5, lr}
	add r5, r2, #0
	mov r2, #0x5a
	lsl r2, r2, #2
	add r2, r0, r2
	lsl r0, r1, #4
	add r0, r2, r0
	add r4, r3, #0
	bl GetWindowBaseTile
	mov r3, #0x1b
	add r1, r5, #0
	mul r1, r3
	add r0, r0, r1
	lsl r1, r0, #0x10
	mov r0, #0x15
	lsr r1, r1, #0xb
	add r2, r4, #0
	lsl r3, r3, #5
	bl GF_CreateNewVramTransferTask
	pop {r3, r4, r5, pc}
	thumb_func_end ov48_0225A868

	thumb_func_start ov48_0225A894
ov48_0225A894: ; 0x0225A894
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r1, [sp, #4]
	ldr r1, [sp, #0x28]
	str r2, [sp, #8]
	str r1, [sp, #0x28]
	mov r1, #0
	mov r2, #0x28
	add r7, r0, #0
	add r4, r3, #0
	bl memset
	ldr r0, [sp, #8]
	strh r4, [r7, #2]
	ldrh r0, [r0, #4]
	cmp r0, #0
	beq _0225A8F4
	strh r0, [r7, #0x18]
	mov r0, #0
	str r0, [sp, #0xc]
	ldrh r0, [r7, #0x18]
	cmp r0, #0
	ble _0225A8F4
	add r6, r7, #0
	ldr r4, [sp, #8]
	add r6, #0x10
	add r5, r7, #0
_0225A8CA:
	ldr r0, [sp, #0x28]
	ldr r1, [sp, #4]
	str r0, [sp]
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	ldrh r1, [r4]
	mov r2, #0
	add r3, r6, #0
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	str r0, [r5, #8]
	ldr r0, [sp, #0xc]
	ldrh r1, [r7, #0x18]
	add r0, r0, #1
	add r6, r6, #4
	add r4, r4, #2
	add r5, r5, #4
	str r0, [sp, #0xc]
	cmp r0, r1
	blt _0225A8CA
_0225A8F4:
	ldr r0, [sp, #8]
	ldrh r1, [r0, #8]
	cmp r1, #0
	beq _0225A924
	add r0, r7, #0
	add r0, #0x24
	strb r1, [r0]
	ldr r0, [sp, #8]
	add r2, r7, #0
	ldrh r1, [r0, #0xa]
	add r0, r7, #0
	add r0, #0x26
	strb r1, [r0]
	mov r1, #0x51
	ldr r0, [sp, #4]
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	ldr r1, [sp, #8]
	ldr r3, [sp, #0x28]
	ldrh r1, [r1, #6]
	add r2, #0x20
	bl GfGfxLoader_GetPlttDataFromOpenNarc
	str r0, [r7, #0x1c]
_0225A924:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov48_0225A894

	thumb_func_start ov48_0225A928
ov48_0225A928: ; 0x0225A928
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldrh r0, [r6, #0x18]
	cmp r0, #0
	beq _0225A94A
	mov r4, #0
	cmp r0, #0
	ble _0225A94A
	add r5, r6, #0
_0225A93A:
	ldr r0, [r5, #8]
	bl FreeToHeap
	ldrh r0, [r6, #0x18]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r0
	blt _0225A93A
_0225A94A:
	add r0, r6, #0
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _0225A95A
	ldr r0, [r6, #0x1c]
	bl FreeToHeap
_0225A95A:
	pop {r4, r5, r6, pc}
	thumb_func_end ov48_0225A928

	thumb_func_start ov48_0225A95C
ov48_0225A95C: ; 0x0225A95C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r0, #0
	ldrh r4, [r5]
	ldrh r0, [r5, #0x18]
	ldrh r6, [r5, #2]
	add r7, r1, #0
	mul r0, r4
	add r1, r6, #0
	bl _s32_div_f
	str r0, [sp, #0x20]
	add r0, r5, #0
	add r0, #0x24
	ldrb r0, [r0]
	add r1, r6, #0
	mul r0, r4
	bl _s32_div_f
	str r0, [sp, #0x1c]
	add r0, r4, #1
	add r1, r6, #0
	bl _s32_div_f
	strh r1, [r5]
	ldrh r0, [r5, #0x18]
	cmp r0, #0
	beq _0225A9F4
	ldrh r1, [r5, #0x1a]
	ldr r0, [sp, #0x20]
	cmp r0, r1
	beq _0225A9F4
	mov r6, #0
	strh r0, [r5, #0x1a]
	add r4, r6, #0
_0225A9A2:
	add r0, r5, r6
	ldrb r0, [r0, #4]
	cmp r0, #1
	bne _0225A9EC
	ldrh r0, [r5, #0x1a]
	mov r1, #0x20
	mov r2, #0
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #0x10]
	str r1, [sp]
	mov r1, #6
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	lsl r1, r4, #0x18
	lsr r3, r1, #0x18
	str r3, [sp, #0x10]
	ldrh r1, [r0]
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #6
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r7]
	bl CopyToBgTilemapRect
	ldr r0, [r7]
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
_0225A9EC:
	add r6, r6, #1
	add r4, r4, #6
	cmp r6, #3
	blt _0225A9A2
_0225A9F4:
	add r0, r5, #0
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _0225AA34
	add r0, r5, #0
	add r0, #0x25
	ldrb r1, [r0]
	ldr r0, [sp, #0x1c]
	cmp r0, r1
	beq _0225AA34
	add r1, r5, #0
	add r1, #0x25
	strb r0, [r1]
	ldr r2, [r5, #0x20]
	add r1, r5, #0
	add r1, #0x26
	ldrb r1, [r1]
	add r5, #0x25
	ldr r3, [r2, #0xc]
	ldrb r2, [r5]
	mov r0, #0x1f
	lsl r1, r1, #5
	lsl r2, r2, #5
	add r2, r3, r2
	mov r3, #0x20
	bl GF_CreateNewVramTransferTask
	cmp r0, #0
	bne _0225AA34
	bl GF_AssertFail
_0225AA34:
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov48_0225A95C

	thumb_func_start ov48_0225AA38
ov48_0225AA38: ; 0x0225AA38
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #3
	blo _0225AA48
	bl GF_AssertFail
_0225AA48:
	add r0, r5, r4
	strb r6, [r0, #4]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov48_0225AA38

	thumb_func_start ov48_0225AA50
ov48_0225AA50: ; 0x0225AA50
	mov r1, #0
	strb r1, [r0, #4]
	strb r1, [r0, #5]
	strb r1, [r0, #6]
	strb r1, [r0, #7]
	bx lr
	thumb_func_end ov48_0225AA50

	thumb_func_start ov48_0225AA5C
ov48_0225AA5C: ; 0x0225AA5C
	push {r3, r4, lr}
	sub sp, #0x1c
	add r4, r2, #0
	ldrh r2, [r0, #0x18]
	cmp r2, #0
	beq _0225AAA8
	ldrh r2, [r0, #0x1a]
	lsl r1, r1, #0x18
	lsr r3, r1, #0x18
	lsl r2, r2, #2
	add r0, r0, r2
	ldr r0, [r0, #0x10]
	mov r2, #0x20
	str r2, [sp]
	mov r2, #1
	str r2, [sp, #4]
	add r2, r0, #0
	add r2, #0xc
	str r2, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	ldrh r1, [r0]
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #6
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r4]
	bl CopyToBgTilemapRect
	ldr r0, [r4]
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
_0225AAA8:
	add sp, #0x1c
	pop {r3, r4, pc}
	thumb_func_end ov48_0225AA5C

	thumb_func_start ov48_0225AAAC
ov48_0225AAAC: ; 0x0225AAAC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x88
	str r0, [sp, #0x2c]
	str r2, [sp, #0x30]
	mov r0, #0
	add r5, r1, #0
	add r2, sp, #0x44
	add r1, r0, #0
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	mov r2, #0x4b
	ldr r0, [sp, #0x2c]
	lsl r2, r2, #2
	str r3, [sp, #0x34]
	bl memset
	ldr r0, [sp, #0x2c]
	mov r2, #2
	strh r2, [r0, #0x30]
	mov r1, #0x80
	strh r1, [r0, #0x32]
	ldr r0, [r5, #4]
	ldr r3, [sp, #0x34]
	str r0, [sp, #0x44]
	add r0, sp, #0x64
	str r0, [sp, #0x48]
	mov r0, #0x40
	str r0, [sp, #0x58]
	str r3, [sp, #0x60]
	str r2, [sp, #0x5c]
	mov r3, #0
	str r3, [sp]
	str r2, [sp, #4]
	mov r2, #0xc
	str r2, [sp, #8]
	ldr r2, [sp, #0x34]
	add r0, #0xf4
	str r2, [sp, #0xc]
	add r1, #0xc4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	mov r2, #0x14
	bl AddPlttResObjFromOpenNarc
	ldr r1, [sp, #0x2c]
	str r0, [r1, #0x70]
	bl sub_0200B00C
	cmp r0, #0
	bne _0225AB18
	bl GF_AssertFail
_0225AB18:
	ldr r0, [sp, #0x2c]
	ldr r0, [r0, #0x70]
	bl sub_0200A740
	mov r0, #0x15
	str r0, [sp, #0x40]
	ldr r4, [sp, #0x2c]
	mov r0, #0x16
	str r0, [sp, #0x3c]
	mov r0, #0x17
	mov r6, #0
	str r0, [sp, #0x38]
	add r7, r4, #0
_0225AB32:
	str r6, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0x34]
	mov r1, #0x51
	str r0, [sp, #8]
	mov r0, #0x13
	lsl r0, r0, #4
	lsl r1, r1, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, [sp, #0x40]
	mov r3, #0
	bl AddCharResObjFromOpenNarc
	str r0, [r4, #0x6c]
	mov r1, #0x51
	str r6, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0x34]
	lsl r1, r1, #2
	str r0, [sp, #8]
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, [sp, #0x3c]
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	str r0, [r4, #0x74]
	mov r1, #0x51
	str r6, [sp]
	mov r0, #3
	str r0, [sp, #4]
	ldr r0, [sp, #0x34]
	lsl r1, r1, #2
	str r0, [sp, #8]
	mov r0, #0x4f
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, [sp, #0x38]
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	str r0, [r4, #0x78]
	ldr r0, [r4, #0x6c]
	bl sub_0200ADA4
	cmp r0, #0
	bne _0225ABA0
	bl GF_AssertFail
_0225ABA0:
	ldr r0, [r4, #0x6c]
	bl sub_0200A740
	mov r0, #0
	str r6, [sp]
	mvn r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	mov r0, #0x13
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r1, r6, #0
	str r0, [sp, #0x14]
	mov r0, #0x4d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r2, #0
	str r0, [sp, #0x18]
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r3, r6, #0
	str r0, [sp, #0x1c]
	mov r0, #0x4f
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	str r0, [sp, #0x20]
	mov r0, #0
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, sp, #0x64
	bl CreateSpriteResourcesHeader
	add r0, sp, #0x44
	bl sub_02024714
	str r0, [r7, #0x3c]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r1, #1
	ldr r0, [r7, #0x3c]
	lsl r1, r1, #0xc
	bl sub_02024868
	ldr r0, [sp, #0x40]
	add r6, r6, #1
	add r0, r0, #3
	str r0, [sp, #0x40]
	ldr r0, [sp, #0x3c]
	add r4, #0x10
	add r0, r0, #3
	str r0, [sp, #0x3c]
	ldr r0, [sp, #0x38]
	add r7, r7, #4
	add r0, r0, #3
	str r0, [sp, #0x38]
	cmp r6, #0xc
	blt _0225AB32
	ldr r0, [sp, #0x2c]
	bl ov48_0225AD38
	mov r1, #0
	ldr r0, [sp, #0x30]
	add r2, r1, #0
	bl ov48_0225A668
	add sp, #0x88
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov48_0225AAAC

	thumb_func_start ov48_0225AC34
ov48_0225AC34: ; 0x0225AC34
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, _0225ACA8 ; =0x000005D8
	mov r1, #0
	bl StopSE
	mov r0, #0
	ldr r7, [sp]
	str r0, [sp, #8]
_0225AC4A:
	ldr r0, [sp]
	ldr r0, [r0, #0x3c]
	bl sub_02024758
	ldr r0, [r7, #0x6c]
	bl sub_0200AEB0
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0225AC72
	ldr r0, [r7, #0x70]
	bl sub_0200B0A8
	mov r0, #0x4d
	ldr r1, [sp, #4]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	ldr r1, [r7, #0x70]
	bl DestroySingle2DGfxResObj
_0225AC72:
	ldr r5, [sp, #4]
	mov r4, #0
	add r6, r7, #0
_0225AC78:
	cmp r4, #1
	beq _0225AC88
	mov r0, #0x13
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	ldr r1, [r6, #0x6c]
	bl DestroySingle2DGfxResObj
_0225AC88:
	add r4, r4, #1
	add r6, r6, #4
	add r5, r5, #4
	cmp r4, #4
	blt _0225AC78
	ldr r0, [sp]
	add r7, #0x10
	add r0, r0, #4
	str r0, [sp]
	ldr r0, [sp, #8]
	add r0, r0, #1
	str r0, [sp, #8]
	cmp r0, #0xc
	blt _0225AC4A
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0225ACA8: .word 0x000005D8
	thumb_func_end ov48_0225AC34

	thumb_func_start ov48_0225ACAC
ov48_0225ACAC: ; 0x0225ACAC
	add r1, r0, #0
	add r2, r0, #0
	mov r3, #0
	add r1, #0x34
	strb r3, [r1]
	add r2, #0x34
	strb r3, [r2, #1]
	strb r3, [r2, #2]
	add r1, r0, #0
	strb r3, [r2, #3]
	add r2, r0, #0
	add r1, #0x38
	strb r3, [r1]
	add r2, #0x38
	strb r3, [r2, #1]
	strb r3, [r2, #2]
	strb r3, [r2, #3]
	mov r1, #2
	strh r1, [r0, #0x30]
	mov r1, #0x80
	strh r1, [r0, #0x32]
	bx lr
	thumb_func_end ov48_0225ACAC

	thumb_func_start ov48_0225ACD8
ov48_0225ACD8: ; 0x0225ACD8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r0, r5, r4
	add r6, r5, #0
	str r3, [sp]
	mov r1, #1
	add r0, #0x34
	strb r1, [r0]
	add r6, #0x38
	add r0, r2, #0
	bl ov48_0225B050
	strb r0, [r6, r4]
	lsl r7, r4, #4
	ldrb r2, [r6, r4]
	mov r1, #0x30
	ldr r3, _0225AD34 ; =ov48_0225B330
	mul r1, r2
	add r1, r3, r1
	add r0, r5, r7
	add r1, r1, r7
	bl ov48_0225AE3C
	ldr r0, [sp]
	cmp r0, #0x18
	bhs _0225AD30
	bl ov48_0225B050
	ldrb r1, [r6, r4]
	cmp r0, r1
	bne _0225AD30
	cmp r4, #2
	bhs _0225AD30
	add r0, r4, #1
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #1
	bl ov48_0225AE5C
	add r0, r5, r7
	mov r1, #1
	bl ov48_0225AE58
_0225AD30:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225AD34: .word ov48_0225B330
	thumb_func_end ov48_0225ACD8

	thumb_func_start ov48_0225AD38
ov48_0225AD38: ; 0x0225AD38
	push {r4, r5, r6, lr}
	mov r4, #0
	add r5, r0, #0
	add r6, r4, #0
_0225AD40:
	ldr r0, [r5, #0x3c]
	add r1, r6, #0
	bl Set2dSpriteVisibleFlag
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0xc
	blt _0225AD40
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov48_0225AD38

	thumb_func_start ov48_0225AD54
ov48_0225AD54: ; 0x0225AD54
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	mov r1, #0x32
	ldrsh r2, [r5, r1]
	cmp r2, #0
	ble _0225AD82
	sub r2, r2, #1
	strh r2, [r5, #0x32]
	ldrsh r1, [r5, r1]
	cmp r1, #0
	bne _0225ADB6
	mov r1, #0x30
	ldrsh r1, [r5, r1]
	add r2, r4, #0
	bl ov48_0225ADBC
	cmp r0, #1
	bne _0225ADB6
	ldr r0, _0225ADB8 ; =0x000005D8
	bl PlaySE
	pop {r3, r4, r5, pc}
_0225AD82:
	mov r1, #0x30
	ldrsh r1, [r5, r1]
	add r2, r4, #0
	bl ov48_0225ADF8
	cmp r0, #1
	bne _0225ADB6
	mov r1, #0x30
	ldrsh r0, [r5, r1]
	sub r0, r0, #1
	bmi _0225ADA6
	strh r0, [r5, #0x30]
	ldrsh r1, [r5, r1]
	add r0, r5, #0
	add r2, r4, #0
	bl ov48_0225ADBC
	pop {r3, r4, r5, pc}
_0225ADA6:
	ldr r0, _0225ADB8 ; =0x000005D8
	mov r1, #0
	bl StopSE
	mov r0, #2
	strh r0, [r5, #0x30]
	mov r0, #0x80
	strh r0, [r5, #0x32]
_0225ADB6:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0225ADB8: .word 0x000005D8
	thumb_func_end ov48_0225AD54

	thumb_func_start ov48_0225ADBC
ov48_0225ADBC: ; 0x0225ADBC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r0, r5, r4
	add r0, #0x34
	ldrb r0, [r0]
	cmp r0, #0
	bne _0225ADD0
	mov r0, #0
	pop {r3, r4, r5, pc}
_0225ADD0:
	lsl r0, r4, #4
	add r0, r5, r0
	add r1, r2, #0
	bl ov48_0225AEA8
	add r0, r5, r4
	add r0, #0x38
	ldrb r0, [r0]
	mov r1, #1
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #0x3c]
	bl Set2dSpriteVisibleFlag
	add r0, r5, #0
	add r1, r4, #0
	bl ov48_0225B010
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov48_0225ADBC

	thumb_func_start ov48_0225ADF8
ov48_0225ADF8: ; 0x0225ADF8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r0, r5, r4
	add r0, #0x34
	ldrb r0, [r0]
	cmp r0, #0
	bne _0225AE0C
	mov r0, #1
	pop {r4, r5, r6, pc}
_0225AE0C:
	lsl r0, r4, #4
	add r0, r5, r0
	add r1, r2, #0
	bl ov48_0225AE60
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov48_0225B010
	cmp r6, #1
	bne _0225AE36
	add r0, r5, r4
	add r0, #0x38
	ldrb r0, [r0]
	mov r1, #0
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #0x3c]
	bl Set2dSpriteVisibleFlag
_0225AE36:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov48_0225ADF8

	thumb_func_start ov48_0225AE3C
ov48_0225AE3C: ; 0x0225AE3C
	str r1, [r0, #0xc]
	mov r3, #0
	ldrsh r2, [r1, r3]
	strh r2, [r0]
	mov r2, #2
	ldrsh r1, [r1, r2]
	add r1, #0x10
	strh r1, [r0, #2]
	strh r3, [r0, #4]
	strh r3, [r0, #6]
	strh r3, [r0, #8]
	strh r3, [r0, #0xa]
	bx lr
	.balign 4, 0
	thumb_func_end ov48_0225AE3C

	thumb_func_start ov48_0225AE58
ov48_0225AE58: ; 0x0225AE58
	strh r1, [r0, #8]
	bx lr
	thumb_func_end ov48_0225AE58

	thumb_func_start ov48_0225AE5C
ov48_0225AE5C: ; 0x0225AE5C
	strh r1, [r0, #0xa]
	bx lr
	thumb_func_end ov48_0225AE5C

	thumb_func_start ov48_0225AE60
ov48_0225AE60: ; 0x0225AE60
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r1, #4
	ldrsh r3, [r5, r1]
	ldr r2, [r5, #0xc]
	mov r1, #8
	ldrsh r1, [r2, r1]
	cmp r3, r1
	ble _0225AE78
	mov r0, #1
	pop {r3, r4, r5, pc}
_0225AE78:
	bl ov48_0225AEDC
	mov r0, #4
	ldrsh r0, [r5, r0]
	add r0, r0, #1
	strh r0, [r5, #4]
	mov r0, #6
	ldrsh r0, [r5, r0]
	ldr r1, [r5, #0xc]
	add r2, r0, #1
	mov r0, #0xc
	ldrsh r0, [r1, r0]
	cmp r2, r0
	ble _0225AE9A
	mov r0, #0
	strh r0, [r5, #6]
	b _0225AE9C
_0225AE9A:
	strh r2, [r5, #6]
_0225AE9C:
	add r0, r5, #0
	add r1, r4, #0
	bl ov48_0225AFB4
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov48_0225AE60

	thumb_func_start ov48_0225AEA8
ov48_0225AEA8: ; 0x0225AEA8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	mov r1, #0
	strh r1, [r5, #4]
	strh r1, [r5, #6]
	bl ov48_0225AEDC
	add r0, r5, #0
	add r1, r4, #0
	bl ov48_0225AFB4
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov48_0225AEA8

	thumb_func_start ov48_0225AEC4
ov48_0225AEC4: ; 0x0225AEC4
	mov r2, #0
	ldrsh r2, [r0, r2]
	lsl r2, r2, #0xc
	str r2, [r1]
	mov r2, #2
	ldrsh r0, [r0, r2]
	lsl r3, r0, #0xc
	lsl r0, r2, #0x13
	add r0, r3, r0
	str r0, [r1, #4]
	bx lr
	.balign 4, 0
	thumb_func_end ov48_0225AEC4

	thumb_func_start ov48_0225AEDC
ov48_0225AEDC: ; 0x0225AEDC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrh r0, [r5, #0xa]
	ldr r2, [r5, #0xc]
	cmp r0, #0
	bne _0225AEF4
	mov r0, #6
	ldrsh r0, [r2, r0]
	sub r0, #0x10
	lsl r0, r0, #0x10
	asr r7, r0, #0x10
	b _0225AEF8
_0225AEF4:
	mov r0, #6
	ldrsh r7, [r2, r0]
_0225AEF8:
	ldrh r0, [r5, #8]
	cmp r0, #0
	bne _0225AF0A
	mov r0, #2
	ldrsh r0, [r2, r0]
	add r0, #0x10
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	b _0225AF0E
_0225AF0A:
	mov r0, #2
	ldrsh r4, [r2, r0]
_0225AF0E:
	mov r0, #0
	ldrsh r6, [r2, r0]
	mov r0, #4
	ldrsh r1, [r5, r0]
	ldrsh r0, [r2, r0]
	sub r0, r0, r6
	mul r0, r1
	mov r1, #8
	ldrsh r1, [r2, r1]
	bl _s32_div_f
	add r0, r6, r0
	strh r0, [r5]
	mov r0, #4
	ldrsh r1, [r5, r0]
	sub r0, r7, r4
	ldr r2, [r5, #0xc]
	mul r0, r1
	mov r1, #8
	ldrsh r1, [r2, r1]
	bl _s32_div_f
	add r0, r4, r0
	strh r0, [r5, #2]
	mov r0, #6
	ldrsh r1, [r5, r0]
	ldr r0, _0225AFAC ; =0x0000FFFF
	ldr r4, [r5, #0xc]
	mul r0, r1
	mov r1, #0xc
	ldrsh r1, [r4, r1]
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	asr r0, r0, #4
	lsl r1, r0, #2
	ldr r0, _0225AFB0 ; =FX_SinCosTable_
	ldrsh r6, [r0, r1]
	mov r0, #0xa
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _0225AF76
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0225AF84
_0225AF76:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0225AF84:
	bl _ffix
	asr r1, r0, #0x1f
	asr r3, r6, #0x1f
	add r2, r6, #0
	bl _ll_mul
	mov r3, #2
	mov r4, #0
	lsl r3, r3, #0xa
	add r3, r0, r3
	adc r1, r4
	lsl r0, r1, #0x14
	lsr r1, r3, #0xc
	orr r1, r0
	ldrsh r2, [r5, r4]
	asr r0, r1, #0xc
	add r0, r2, r0
	strh r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225AFAC: .word 0x0000FFFF
_0225AFB0: .word FX_SinCosTable_
	thumb_func_end ov48_0225AEDC

	thumb_func_start ov48_0225AFB4
ov48_0225AFB4: ; 0x0225AFB4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov48_0225A650
	ldrh r0, [r5, #8]
	cmp r0, #0
	bne _0225AFE8
	ldr r1, [r5, #0xc]
	mov r0, #2
	ldrsh r1, [r1, r0]
	ldrsh r2, [r5, r0]
	add r0, r1, #0
	sub r0, #0x10
	cmp r2, r0
	ble _0225AFE8
	add r2, r1, #0
	add r2, #0x20
	lsl r2, r2, #0x10
	add r0, r4, #0
	asr r2, r2, #0x10
	bl ov48_0225A650
_0225AFE8:
	ldrh r0, [r5, #0xa]
	cmp r0, #0
	bne _0225B00C
	ldr r1, [r5, #0xc]
	mov r0, #6
	ldrsh r2, [r1, r0]
	mov r0, #2
	ldrsh r0, [r5, r0]
	sub r0, #0x10
	cmp r0, r2
	bgt _0225B00C
	add r1, r2, #0
	sub r1, #0x20
	lsl r1, r1, #0x10
	add r0, r4, #0
	asr r1, r1, #0x10
	bl ov48_0225A650
_0225B00C:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov48_0225AFB4

	thumb_func_start ov48_0225B010
ov48_0225B010: ; 0x0225B010
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	lsl r0, r4, #4
	add r0, r5, r0
	add r1, sp, #0
	bl ov48_0225AEC4
	add r0, r5, r4
	add r0, #0x38
	ldrb r0, [r0]
	add r1, sp, #0
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #0x3c]
	bl sub_020247D4
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov48_0225B010

	thumb_func_start ov48_0225B038
ov48_0225B038: ; 0x0225B038
	push {r4, lr}
	add r4, r0, #0
	cmp r4, #0x18
	blo _0225B044
	bl GF_AssertFail
_0225B044:
	ldr r0, _0225B04C ; =ov48_0225B238
	lsl r1, r4, #1
	ldrb r0, [r0, r1]
	pop {r4, pc}
	.balign 4, 0
_0225B04C: .word ov48_0225B238
	thumb_func_end ov48_0225B038

	thumb_func_start ov48_0225B050
ov48_0225B050: ; 0x0225B050
	push {r4, lr}
	add r4, r0, #0
	cmp r4, #0x18
	blo _0225B05C
	bl GF_AssertFail
_0225B05C:
	ldr r0, _0225B064 ; =ov48_0225B239
	lsl r1, r4, #1
	ldrb r0, [r0, r1]
	pop {r4, pc}
	.balign 4, 0
_0225B064: .word ov48_0225B239
	thumb_func_end ov48_0225B050

	thumb_func_start ov48_0225B068
ov48_0225B068: ; 0x0225B068
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r2, _0225B0A0 ; =0x00000321
	mov r0, #0
	mov r1, #0x1b
	add r3, r4, #0
	bl NewMsgDataFromNarc
	str r0, [r5]
	mov r0, #8
	mov r1, #0x40
	add r2, r4, #0
	bl ScrStrBufs_new_custom
	str r0, [r5, #4]
	mov r0, #0x80
	add r1, r4, #0
	bl String_ctor
	str r0, [r5, #8]
	mov r0, #0x80
	add r1, r4, #0
	bl String_ctor
	str r0, [r5, #0xc]
	pop {r3, r4, r5, pc}
	nop
_0225B0A0: .word 0x00000321
	thumb_func_end ov48_0225B068

	thumb_func_start ov48_0225B0A4
ov48_0225B0A4: ; 0x0225B0A4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl DestroyMsgData
	ldr r0, [r4, #4]
	bl ScrStrBufs_delete
	ldr r0, [r4, #8]
	bl String_dtor
	ldr r0, [r4, #0xc]
	bl String_dtor
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov48_0225B0A4

	thumb_func_start ov48_0225B0C4
ov48_0225B0C4: ; 0x0225B0C4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r2, [r4, #8]
	bl ReadMsgDataIntoString
	ldr r0, [r4, #8]
	pop {r4, pc}
	thumb_func_end ov48_0225B0C4

	thumb_func_start ov48_0225B0D4
ov48_0225B0D4: ; 0x0225B0D4
	ldr r3, _0225B0DC ; =ReadMsgDataIntoString
	ldr r0, [r0]
	bx r3
	nop
_0225B0DC: .word ReadMsgDataIntoString
	thumb_func_end ov48_0225B0D4

	thumb_func_start ov48_0225B0E0
ov48_0225B0E0: ; 0x0225B0E0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	ldr r2, [r5, #0xc]
	mov r1, #3
	bl ReadMsgDataIntoString
	ldr r0, [r5, #4]
	mov r1, #0
	add r2, r4, #0
	bl BufferCountryName
	ldr r0, [r5, #4]
	ldr r1, [r5, #8]
	ldr r2, [r5, #0xc]
	bl StringExpandPlaceholders
	ldr r0, [r5, #8]
	pop {r3, r4, r5, pc}
	thumb_func_end ov48_0225B0E0

	thumb_func_start ov48_0225B108
ov48_0225B108: ; 0x0225B108
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	add r4, r1, #0
	add r6, r2, #0
	bl ScrStrBufs_ResetBuffers
	ldr r0, [r5]
	ldr r2, [r5, #0xc]
	mov r1, #3
	bl ReadMsgDataIntoString
	ldr r0, [r5, #4]
	mov r1, #0
	add r2, r4, #0
	add r3, r6, #0
	bl BufferCityName
	ldr r0, [r5, #4]
	ldr r1, [r5, #8]
	ldr r2, [r5, #0xc]
	bl StringExpandPlaceholders
	ldr r0, [r5, #8]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov48_0225B108

	thumb_func_start ov48_0225B13C
ov48_0225B13C: ; 0x0225B13C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_0225B142:
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ov45_0222D724
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bne _0225B158
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_0225B158:
	add r4, r4, #1
	cmp r4, #0x32
	blt _0225B142
	mov r0, #0x32
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov48_0225B13C

	.rodata

_0225B164:
	.byte 0x1E, 0x1E, 0x1E, 0x1E, 0x1E, 0x00, 0x00, 0x00

ov48_0225B16C: ; 0x0225B16C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x12, 0x00

ov48_0225B178: ; 0x0225B178
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00

ov48_0225B184: ; 0x0225B184
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov48_0225B190: ; 0x0225B190
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

ov48_0225B1A0: ; 0x0225B1A0
	.byte 0x20, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x70, 0x00, 0x00, 0x00

ov48_0225B1B0: ; 0x0225B1B0
	.byte 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00

ov48_0225B1C4: ; 0x0225B1C4
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x19, 0x06, 0x00, 0x00

ov48_0225B1D8: ; 0x0225B1D8
	.byte 0x00, 0x06, 0x05, 0x00, 0x00, 0x08, 0x07, 0x00
	.byte 0x00, 0x0A, 0x09, 0x00, 0x00, 0x0C, 0x0B, 0x00, 0x00, 0x0C, 0x0B, 0x00

ov48_0225B1EC: ; 0x0225B1EC
	.byte 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00

ov48_0225B210: ; 0x0225B210
	.byte 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00

ov48_0225B238: ; 0x0225B238
	.byte 0x00

ov48_0225B239: ; 0x0225B239
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01
	.byte 0x00, 0x02, 0x00, 0x02, 0x01, 0x03, 0x01, 0x03, 0x01, 0x04, 0x01, 0x04, 0x01, 0x05, 0x01, 0x05
	.byte 0x02, 0x06, 0x02, 0x06, 0x02, 0x07, 0x02, 0x07, 0x03, 0x08, 0x03, 0x08, 0x03, 0x09, 0x03, 0x09
	.byte 0x04, 0x0A, 0x04, 0x0A, 0x04, 0x0B, 0x04, 0x0B

ov48_0225B268: ; 0x0225B268
	.byte 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0D, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x10, 0x00, 0x11, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0E, 0x00, 0x04, 0x00, 0x02, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0F, 0x00, 0x10, 0x00, 0x03, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0F, 0x00
	.byte 0x10, 0x00, 0x03, 0x00

ov48_0225B2A4: ; 0x0225B2A4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1A, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x00
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x04, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1B, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov48_0225B330: ; 0x0225B330
	.byte 0xA0, 0x00, 0x30, 0x00, 0xBE, 0x00, 0x00, 0x00, 0x3F, 0x01, 0x08, 0x00, 0x50, 0x00, 0x00, 0x00
	.byte 0xCE, 0x00, 0x60, 0x00, 0xA0, 0x00, 0x30, 0x00, 0x3F, 0x01, 0x08, 0x00, 0x50, 0x00, 0x00, 0x00
	.byte 0x96, 0x00, 0x90, 0x00, 0xCE, 0x00, 0x60, 0x00, 0x3F, 0x01, 0x08, 0x00, 0x50, 0x00, 0x00, 0x00
	.byte 0xBE, 0x00, 0x30, 0x00, 0x8C, 0x00, 0x00, 0x00, 0xDC, 0x00, 0x0C, 0x00, 0x36, 0x00, 0x00, 0x00
	.byte 0x96, 0x00, 0x60, 0x00, 0xBE, 0x00, 0x30, 0x00, 0xDC, 0x00, 0x0C, 0x00, 0x36, 0x00, 0x00, 0x00
	.byte 0xC8, 0x00, 0x90, 0x00, 0x96, 0x00, 0x60, 0x00, 0xDC, 0x00, 0x0C, 0x00, 0x36, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x30, 0x00, 0xA0, 0x00, 0x00, 0x00, 0xDC, 0x00, 0x0C, 0x00, 0x36, 0x00, 0x00, 0x00
	.byte 0xD2, 0x00, 0x60, 0x00, 0x80, 0x00, 0x30, 0x00, 0xDC, 0x00, 0x0C, 0x00, 0x36, 0x00, 0x00, 0x00
	.byte 0xA0, 0x00, 0x90, 0x00, 0xD2, 0x00, 0x60, 0x00, 0xDC, 0x00, 0x0C, 0x00, 0x36, 0x00, 0x00, 0x00
	.byte 0xB4, 0x00, 0x30, 0x00, 0x8A, 0x00, 0x00, 0x00, 0xDC, 0x00, 0x0C, 0x00, 0x36, 0x00, 0x00, 0x00
	.byte 0x8A, 0x00, 0x60, 0x00, 0xB4, 0x00, 0x30, 0x00, 0xDC, 0x00, 0x0C, 0x00, 0x36, 0x00, 0x00, 0x00
	.byte 0xB4, 0x00, 0x90, 0x00, 0x8A, 0x00, 0x60, 0x00, 0xDC, 0x00, 0x0C, 0x00, 0x36, 0x00, 0x00, 0x00
	.byte 0xB4, 0x00, 0x30, 0x00, 0xA0, 0x00, 0x00, 0x00, 0x8F, 0x01, 0x04, 0x00, 0x64, 0x00, 0x00, 0x00
	.byte 0x82, 0x00, 0x60, 0x00, 0xB4, 0x00, 0x30, 0x00, 0x8F, 0x01, 0x04, 0x00, 0x64, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x90, 0x00, 0x82, 0x00, 0x60, 0x00, 0x8F, 0x01, 0x04, 0x00, 0x64, 0x00, 0x00, 0x00
	.byte 0xB4, 0x00, 0x30, 0x00, 0x74, 0x00, 0x00, 0x00, 0x3F, 0x01, 0x08, 0x00, 0x50, 0x00, 0x00, 0x00
	.byte 0x74, 0x00, 0x60, 0x00, 0xB4, 0x00, 0x30, 0x00, 0x3F, 0x01, 0x08, 0x00, 0x50, 0x00, 0x00, 0x00
	.byte 0xB4, 0x00, 0x90, 0x00, 0x74, 0x00, 0x60, 0x00, 0x3F, 0x01, 0x08, 0x00, 0x50, 0x00, 0x00, 0x00
	.byte 0xB4, 0x00, 0x30, 0x00, 0xF0, 0x00, 0x00, 0x00, 0xDC, 0x00, 0x0C, 0x00, 0x36, 0x00, 0x00, 0x00
	.byte 0xA0, 0x00, 0x60, 0x00, 0xB4, 0x00, 0x30, 0x00, 0xDC, 0x00, 0x0C, 0x00, 0x36, 0x00, 0x00, 0x00
	.byte 0x60, 0x00, 0x90, 0x00, 0xA0, 0x00, 0x60, 0x00, 0xDC, 0x00, 0x0C, 0x00, 0x36, 0x00, 0x00, 0x00
	.byte 0x90, 0x00, 0x30, 0x00, 0xDA, 0x00, 0x00, 0x00, 0xDC, 0x00, 0x0C, 0x00, 0x36, 0x00, 0x00, 0x00
	.byte 0xDA, 0x00, 0x60, 0x00, 0x90, 0x00, 0x30, 0x00, 0xDC, 0x00, 0x0C, 0x00, 0x36, 0x00, 0x00, 0x00
	.byte 0x90, 0x00, 0x90, 0x00, 0xDA, 0x00, 0x60, 0x00, 0xDC, 0x00, 0x0C, 0x00, 0x36, 0x00, 0x00, 0x00
	.byte 0xA0, 0x00, 0x30, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x8F, 0x01, 0x04, 0x00, 0x64, 0x00, 0x00, 0x00
	.byte 0xC0, 0x00, 0x60, 0x00, 0xA0, 0x00, 0x30, 0x00, 0x8F, 0x01, 0x04, 0x00, 0x64, 0x00, 0x00, 0x00
	.byte 0xA0, 0x00, 0x90, 0x00, 0xC0, 0x00, 0x60, 0x00, 0x8F, 0x01, 0x04, 0x00, 0x64, 0x00, 0x00, 0x00
	.byte 0x8C, 0x00, 0x30, 0x00, 0x60, 0x00, 0x00, 0x00, 0x3F, 0x01, 0x08, 0x00, 0x50, 0x00, 0x00, 0x00
	.byte 0xBE, 0x00, 0x60, 0x00, 0x8C, 0x00, 0x30, 0x00, 0x3F, 0x01, 0x08, 0x00, 0x50, 0x00, 0x00, 0x00
	.byte 0xF0, 0x00, 0x90, 0x00, 0xBE, 0x00, 0x60, 0x00, 0x3F, 0x01, 0x08, 0x00, 0x50, 0x00, 0x00, 0x00
	.byte 0xD4, 0x00, 0x30, 0x00, 0xA0, 0x00, 0x00, 0x00, 0x8F, 0x01, 0x04, 0x00, 0x64, 0x00, 0x00, 0x00
	.byte 0xD4, 0x00, 0x60, 0x00, 0xD4, 0x00, 0x30, 0x00, 0x8F, 0x01, 0x04, 0x00, 0x64, 0x00, 0x00, 0x00
	.byte 0xA0, 0x00, 0x90, 0x00, 0xD4, 0x00, 0x60, 0x00, 0x8F, 0x01, 0x04, 0x00, 0x64, 0x00, 0x00, 0x00
	.byte 0x7B, 0x00, 0x30, 0x00, 0xAA, 0x00, 0x00, 0x00, 0x3F, 0x01, 0x08, 0x00, 0x50, 0x00, 0x00, 0x00
	.byte 0xC6, 0x00, 0x60, 0x00, 0x7B, 0x00, 0x30, 0x00, 0x3F, 0x01, 0x08, 0x00, 0x50, 0x00, 0x00, 0x00
	.byte 0x85, 0x00, 0x90, 0x00, 0xC6, 0x00, 0x60, 0x00, 0x3F, 0x01, 0x08, 0x00, 0x50, 0x00, 0x00, 0x00
	; 0x0225B580
