	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov18_021E5900
ov18_021E5900: ; 0x021E5900
	mov r0, #0x45
	bx lr
	thumb_func_end ov18_021E5900

	thumb_func_start ov18_021E5904
ov18_021E5904: ; 0x021E5904
	add r0, r0, #3
	bx lr
	thumb_func_end ov18_021E5904

	thumb_func_start ov18_021E5908
ov18_021E5908: ; 0x021E5908
	mov r0, #0
	bx lr
	thumb_func_end ov18_021E5908

	thumb_func_start ov18_021E590C
ov18_021E590C: ; 0x021E590C
	push {r4, r5, r6, lr}
	sub sp, #0x28
	add r4, r2, #0
	add r2, sp, #4
	str r2, [sp]
	add r2, sp, #0xc
	add r3, sp, #8
	add r5, r0, #0
	bl ov18_021E5A50
	ldr r2, [sp, #4]
	cmp r2, #6
	bne _021E5932
	add r0, r5, #0
	add r1, r4, #0
	bl GetSpeciesName
	add sp, #0x28
	pop {r4, r5, r6, pc}
_021E5932:
	ldr r6, _021E5958 ; =_021F96F4
	add r5, sp, #0x10
	add r3, r5, #0
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	lsl r0, r2, #2
	ldr r1, [sp, #0xc]
	ldr r0, [r3, r0]
	add r2, r4, #0
	str r1, [sp, #4]
	bl ov18_021E5A10
	add sp, #0x28
	pop {r4, r5, r6, pc}
	nop
_021E5958: .word _021F96F4
	thumb_func_end ov18_021E590C

	thumb_func_start ov18_021E595C
ov18_021E595C: ; 0x021E595C
	push {r4, r5, r6, lr}
	sub sp, #0x28
	add r4, r2, #0
	add r2, sp, #4
	str r2, [sp]
	add r2, sp, #0xc
	add r3, sp, #8
	add r5, r0, #0
	bl ov18_021E5A50
	ldr r2, [sp, #4]
	cmp r2, #6
	bne _021E597E
	mov r0, #0x33
	str r5, [sp, #4]
	lsl r0, r0, #4
	b _021E5998
_021E597E:
	ldr r6, _021E59A4 ; =_021F970C
	add r5, sp, #0x10
	add r3, r5, #0
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	lsl r0, r2, #2
	ldr r1, [sp, #0xc]
	ldr r0, [r3, r0]
	str r1, [sp, #4]
_021E5998:
	ldr r1, [sp, #4]
	add r2, r4, #0
	bl ov18_021E5A10
	add sp, #0x28
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E59A4: .word _021F970C
	thumb_func_end ov18_021E595C

	thumb_func_start ov18_021E59A8
ov18_021E59A8: ; 0x021E59A8
	push {r4, r5, r6, lr}
	sub sp, #0x28
	add r4, r2, #0
	add r2, sp, #4
	add r6, r3, #0
	str r2, [sp]
	add r2, sp, #0xc
	add r3, sp, #8
	add r5, r0, #0
	bl ov18_021E5A50
	ldr r0, [sp, #4]
	cmp r0, #6
	bne _021E59D4
	cmp r4, #1
	blt _021E59CC
	bl GF_AssertFail
_021E59CC:
	add r0, r5, r4
	str r0, [sp, #4]
#ifdef HEARTGOLD
	ldr r0, _021E5A08 ; =0x00000323
#else
	mov r0, #0xC9
	lsl r0, r0, #2
#endif
	b _021E59FA
_021E59D4:
	ldr r3, _021E5A0C ; =_021F9724
	add r2, sp, #0x10
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	cmp r4, #1
	blt _021E59EC
	bl GF_AssertFail
_021E59EC:
	ldr r0, [sp, #4]
	lsl r1, r0, #2
	add r0, sp, #0x10
	ldr r0, [r0, r1]
	ldr r1, [sp, #0xc]
	add r1, r1, r4
	str r1, [sp, #4]
_021E59FA:
	ldr r1, [sp, #4]
	add r2, r6, #0
	bl ov18_021E5A10
	add sp, #0x28
	pop {r4, r5, r6, pc}
#ifdef HEARTGOLD
	nop
_021E5A08: .word 0x00000323
#endif
_021E5A0C: .word _021F9724
	thumb_func_end ov18_021E59A8

	thumb_func_start ov18_021E5A10
ov18_021E5A10: ; 0x021E5A10
	push {r4, r5, r6, lr}
	add r3, r0, #0
	add r5, r2, #0
	add r6, r1, #0
	add r2, r3, #0
	mov r0, #1
	mov r1, #0x1b
	add r3, r5, #0
	bl NewMsgDataFromNarc
	add r4, r0, #0
	beq _021E5A4A
	mov r0, #1
	lsl r0, r0, #8
	add r1, r5, #0
	bl String_ctor
	add r5, r0, #0
	beq _021E5A40
	add r0, r4, #0
	add r1, r6, #0
	add r2, r5, #0
	bl ReadMsgDataIntoString
_021E5A40:
	add r0, r4, #0
	bl DestroyMsgData
	add r0, r5, #0
	pop {r4, r5, r6, pc}
_021E5A4A:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov18_021E5A10

	thumb_func_start ov18_021E5A50
ov18_021E5A50: ; 0x021E5A50
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r0, r1, #0
	add r4, r2, #0
	add r5, r3, #0
	ldr r6, [sp, #0x18]
	bl LanguageToDexFlag
	str r0, [r5]
	cmp r0, #6
	blt _021E5A6A
	bl GF_AssertFail
_021E5A6A:
	str r7, [r4]
	ldr r5, [r5]
	cmp r5, #6
	blt _021E5A76
	bl GF_AssertFail
_021E5A76:
	cmp r5, #1
	bne _021E5A7C
	mov r5, #6
_021E5A7C:
	str r5, [r6]
	ldr r1, [r4]
	ldr r0, _021E5A9C ; =0x000001ED
	cmp r1, r0
	ble _021E5A8E
	cmp r5, #6
	beq _021E5A8E
	mov r0, #0
	b _021E5A90
_021E5A8E:
	mov r0, #1
_021E5A90:
	cmp r0, #0
	bne _021E5A98
	bl GF_AssertFail
_021E5A98:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E5A9C: .word 0x000001ED
	thumb_func_end ov18_021E5A50

	thumb_func_start ov18_021E5AA0
ov18_021E5AA0: ; 0x021E5AA0
	push {r3, r4, r5, lr}
	mov r2, #0x61
	add r5, r0, #0
	mov r0, #3
	mov r1, #0x25
	lsl r2, r2, #0xc
	bl CreateHeap
	ldr r1, _021E5B4C ; =0x00001910
	add r0, r5, #0
	mov r2, #0x25
	bl OverlayManager_CreateAndGetData
	ldr r2, _021E5B4C ; =0x00001910
	mov r1, #0
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	bl OverlayManager_GetParentWork
	str r0, [r4]
	ldr r0, _021E5B50 ; =0x0000085C
	mov r1, #5
	str r1, [r4, r0]
	ldr r0, [r4]
	ldr r0, [r0, #8]
	bl sub_02092BE0
	ldr r1, _021E5B54 ; =0x00001858
	strb r0, [r4, r1]
	ldr r0, [r4]
	ldr r0, [r0]
	bl Pokedex_GetNatDexFlag
	cmp r0, #0
	ldr r0, _021E5B58 ; =0x00001860
	beq _021E5B00
	mov r2, #1
	add r1, r0, #0
	str r2, [r4, r0]
	sub r1, #8
	ldrb r1, [r4, r1]
	cmp r1, #2
	bne _021E5B12
	sub r0, #8
	strb r2, [r4, r0]
	b _021E5B12
_021E5B00:
	mov r2, #0
	add r1, r0, #0
	str r2, [r4, r0]
	sub r1, #8
	ldrb r1, [r4, r1]
	cmp r1, #2
	bne _021E5B12
	sub r0, #8
	strb r2, [r4, r0]
_021E5B12:
	ldr r0, [r4]
	ldr r1, _021E5B5C ; =0x000001E7
	ldr r0, [r0]
	bl Pokedex_CheckMonCaughtFlag
	cmp r0, #1
	bne _021E5B32
	ldr r0, [r4]
	ldr r1, _021E5B5C ; =0x000001E7
	ldr r0, [r0]
	mov r2, #0
	bl Pokedex_GetSeenFormeByIdx
	bl SetDexBanksByGiratinaForme
	b _021E5B38
_021E5B32:
	mov r0, #0
	bl SetDexBanksByGiratinaForme
_021E5B38:
	mov r0, #1
	mov r1, #0x2a
	bl GF_SndHandleSetPlayerVolume
	ldr r0, _021E5B60 ; =0x0000185C
	mov r1, #2
	strb r1, [r4, r0]
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_021E5B4C: .word 0x00001910
_021E5B50: .word 0x0000085C
_021E5B54: .word 0x00001858
_021E5B58: .word 0x00001860
_021E5B5C: .word 0x000001E7
_021E5B60: .word 0x0000185C
	thumb_func_end ov18_021E5AA0

	thumb_func_start ov18_021E5B64
ov18_021E5B64: ; 0x021E5B64
	push {r4, lr}
	add r4, r1, #0
	bl OverlayManager_GetData
	add r1, r4, #0
	bl ov18_021E8BF4
	cmp r0, #0
	bne _021E5B7A
	mov r0, #1
	pop {r4, pc}
_021E5B7A:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov18_021E5B64

	thumb_func_start ov18_021E5B80
ov18_021E5B80: ; 0x021E5B80
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	ldr r6, _021E5C08 ; =FS_OVERLAY_ID(OVY_123)
	add r4, r0, #0
	mov r0, #0
	add r1, r6, #0
	bl FS_LoadOverlay
	ldr r0, _021E5C0C ; =ov18_021E5C1C
	blx ov123_0225F520
	cmp r0, #0
	beq _021E5BA8
	mov r1, #0xfa
	mov r0, #3
	lsl r1, r1, #2
	bl AllocFromHeapAtEnd
_021E5BA8:
	add r0, r4, #0
	bl ov18_021F8838
	ldr r2, _021E5C10 ; =0x00001858
	add r1, r0, #0
	ldr r0, [r4]
	ldrb r2, [r4, r2]
	ldr r0, [r0, #8]
	bl sub_02092BD8
	ldr r0, _021E5C14 ; =ov18_021E5C2C
	blx ov123_0225F430
	cmp r0, #0
	beq _021E5BD0
	mov r1, #0xfa
	mov r0, #3
	lsl r1, r1, #2
	bl AllocFromHeapAtEnd
_021E5BD0:
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0x25
	bl DestroyHeap
	mov r0, #1
	mov r1, #0x7f
	bl GF_SndHandleSetPlayerVolume
	bl sub_02004B10
	ldr r0, _021E5C18 ; =ov18_021E5C3C
	blx ov123_0225F688
	cmp r0, #0
	bne _021E5BFC
	mov r1, #0xfa
	mov r0, #3
	lsl r1, r1, #2
	bl AllocFromHeapAtEnd
_021E5BFC:
	mov r0, #0
	add r1, r6, #0
	bl FS_UnloadOverlay
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E5C08: .word FS_OVERLAY_ID(OVY_123)
_021E5C0C: .word ov18_021E5C1C
_021E5C10: .word 0x00001858
_021E5C14: .word ov18_021E5C2C
_021E5C18: .word ov18_021E5C3C
	thumb_func_end ov18_021E5B80

	thumb_func_start ov18_021E5C1C
ov18_021E5C1C: ; 0x021E5C1C
	ldr r3, _021E5C28 ; =AllocFromHeapAtEnd
	mov r1, #0xfa
	mov r0, #3
	lsl r1, r1, #2
	bx r3
	nop
_021E5C28: .word AllocFromHeapAtEnd
	thumb_func_end ov18_021E5C1C

	thumb_func_start ov18_021E5C2C
ov18_021E5C2C: ; 0x021E5C2C
	ldr r3, _021E5C38 ; =AllocFromHeapAtEnd
	mov r1, #0xfa
	mov r0, #3
	lsl r1, r1, #2
	bx r3
	nop
_021E5C38: .word AllocFromHeapAtEnd
	thumb_func_end ov18_021E5C2C

	thumb_func_start ov18_021E5C3C
ov18_021E5C3C: ; 0x021E5C3C
	bx lr
	.balign 4, 0
	thumb_func_end ov18_021E5C3C

	thumb_func_start ov18_021E5C40
ov18_021E5C40: ; 0x021E5C40
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x85
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_0200398C
	add r0, r4, #0
	bl ov18_021E7A3C
	ldr r0, [r4, #4]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	bl sub_0200D034
	ldr r3, _021E5C6C ; =0x027E0000
	ldr r1, _021E5C70 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.balign 4, 0
_021E5C6C: .word 0x027E0000
_021E5C70: .word 0x00003FF8
	thumb_func_end ov18_021E5C40

	thumb_func_start ov18_021E5C74
ov18_021E5C74: ; 0x021E5C74
	ldr r3, _021E5C7C ; =GX_SetBanks
	ldr r0, _021E5C80 ; =_021F98B0
	bx r3
	nop
_021E5C7C: .word GX_SetBanks
_021E5C80: .word _021F98B0
	thumb_func_end ov18_021E5C74

	thumb_func_start ov18_021E5C84
ov18_021E5C84: ; 0x021E5C84
	push {r3, r4, r5, lr}
	sub sp, #0xf0
	add r4, r0, #0
	mov r0, #0x25
	bl BgConfig_Alloc
	add r3, sp, #0xe0
	ldr r5, _021E5E4C ; =_021F9750
	str r0, [r4, #4]
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _021E5E50 ; =_021F97EC
	add r3, sp, #0xc4
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
	ldr r0, [r4, #4]
	add r3, r1, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #0
	bl ov18_021E613C
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	mov r3, #0x25
	bl BG_ClearCharDataRange
	ldr r5, _021E5E54 ; =_021F97B4
	add r3, sp, #0xa8
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
	ldr r0, [r4, #4]
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #1
	bl ov18_021E613C
	mov r0, #1
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x25
	bl BG_ClearCharDataRange
	ldr r5, _021E5E58 ; =_021F9894
	add r3, sp, #0x8c
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
	ldr r0, [r4, #4]
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #2
	bl ov18_021E613C
	mov r0, #2
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x25
	bl BG_ClearCharDataRange
	ldr r5, _021E5E5C ; =_021F9824
	add r3, sp, #0x70
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #3
	str r0, [r3]
	ldr r0, [r4, #4]
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #3
	bl ov18_021E613C
	mov r0, #3
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x25
	bl BG_ClearCharDataRange
	ldr r5, _021E5E60 ; =_021F9840
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
	ldr r0, [r4, #4]
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #4
	bl ov18_021E613C
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x25
	bl BG_ClearCharDataRange
	ldr r5, _021E5E64 ; =_021F985C
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
	ldr r0, [r4, #4]
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #5
	bl ov18_021E613C
	mov r0, #5
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x25
	bl BG_ClearCharDataRange
	ldr r5, _021E5E68 ; =_021F9798
	add r3, sp, #0x1c
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
	ldr r0, [r4, #4]
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #6
	bl ov18_021E613C
	mov r0, #6
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x25
	bl BG_ClearCharDataRange
	ldr r5, _021E5E6C ; =_021F97D0
	add r3, sp, #0
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
	ldr r0, [r4, #4]
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #7
	bl ov18_021E613C
	mov r0, #7
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x25
	bl BG_ClearCharDataRange
	add sp, #0xf0
	pop {r3, r4, r5, pc}
	nop
_021E5E4C: .word _021F9750
_021E5E50: .word _021F97EC
_021E5E54: .word _021F97B4
_021E5E58: .word _021F9894
_021E5E5C: .word _021F9824
_021E5E60: .word _021F9840
_021E5E64: .word _021F985C
_021E5E68: .word _021F9798
_021E5E6C: .word _021F97D0
	thumb_func_end ov18_021E5C84

	thumb_func_start ov18_021E5E70
ov18_021E5E70: ; 0x021E5E70
	push {r3, r4, r5, lr}
	sub sp, #0x58
	add r4, r0, #0
	ldr r0, [r4, #4]
	add r5, r1, #0
	mov r1, #7
	bl FreeBgTilemapBuffer
	cmp r5, #0
	bne _021E5ED0
	ldr r5, _021E5F48 ; =_021F9740
	add r3, sp, #0x48
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	mov r1, #1
	bl SetScreenModeAndDisable
	ldr r5, _021E5F4C ; =_021F9878
	add r3, sp, #0x2c
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
	ldr r0, [r4, #4]
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #7
	bl ov18_021E613C
	mov r0, #7
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x25
	bl BG_ClearCharDataRange
	b _021E5F1A
_021E5ED0:
	ldr r5, _021E5F50 ; =_021F9760
	add r3, sp, #0x1c
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	mov r1, #1
	bl SetScreenModeAndDisable
	ldr r5, _021E5F54 ; =_021F9808
	add r3, sp, #0
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
	ldr r0, [r4, #4]
	mov r3, #1
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #7
	bl ov18_021E613C
	mov r0, #7
	mov r1, #0x40
	mov r2, #0
	mov r3, #0x25
	bl BG_ClearCharDataRange
_021E5F1A:
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineBToggleLayers
	mov r0, #2
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	add sp, #0x58
	pop {r3, r4, r5, pc}
	nop
_021E5F48: .word _021F9740
_021E5F4C: .word _021F9878
_021E5F50: .word _021F9760
_021E5F54: .word _021F9808
	thumb_func_end ov18_021E5E70

	thumb_func_start ov18_021E5F58
ov18_021E5F58: ; 0x021E5F58
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	mov r1, #7
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #4]
	mov r1, #6
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #4]
	mov r1, #5
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #4]
	mov r1, #4
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #4]
	mov r1, #3
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #4]
	mov r1, #2
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #4]
	mov r1, #1
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #4]
	mov r1, #0
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #4]
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov18_021E5F58

	thumb_func_start ov18_021E5FA4
ov18_021E5FA4: ; 0x021E5FA4
	push {r3, lr}
	mov r0, #0
	mov r1, #2
	bl SetBgPriority
	mov r0, #1
	mov r1, #0
	bl SetBgPriority
	mov r0, #2
	mov r1, #1
	bl SetBgPriority
	mov r0, #3
	add r1, r0, #0
	bl SetBgPriority
	mov r0, #4
	mov r1, #0
	bl SetBgPriority
	mov r0, #5
	mov r1, #1
	bl SetBgPriority
	mov r0, #6
	mov r1, #2
	bl SetBgPriority
	mov r0, #7
	mov r1, #3
	bl SetBgPriority
	pop {r3, pc}
	thumb_func_end ov18_021E5FA4

	thumb_func_start ov18_021E5FE8
ov18_021E5FE8: ; 0x021E5FE8
	push {r3, lr}
	mov r0, #0
	mov r1, #1
	bl SetBgPriority
	mov r0, #1
	mov r1, #0
	bl SetBgPriority
	mov r0, #2
	add r1, r0, #0
	bl SetBgPriority
	mov r0, #3
	add r1, r0, #0
	bl SetBgPriority
	mov r0, #4
	mov r1, #0
	bl SetBgPriority
	mov r0, #5
	mov r1, #1
	bl SetBgPriority
	mov r0, #6
	mov r1, #2
	bl SetBgPriority
	mov r0, #7
	mov r1, #3
	bl SetBgPriority
	pop {r3, pc}
	thumb_func_end ov18_021E5FE8

	thumb_func_start ov18_021E602C
ov18_021E602C: ; 0x021E602C
	push {r3, lr}
	mov r0, #0
	mov r1, #1
	bl SetBgPriority
	mov r0, #1
	mov r1, #0
	bl SetBgPriority
	mov r0, #2
	add r1, r0, #0
	bl SetBgPriority
	mov r0, #3
	add r1, r0, #0
	bl SetBgPriority
	mov r0, #4
	mov r1, #0
	bl SetBgPriority
	mov r0, #5
	mov r1, #1
	bl SetBgPriority
	mov r0, #6
	mov r1, #2
	bl SetBgPriority
	mov r0, #7
	mov r1, #3
	bl SetBgPriority
	pop {r3, pc}
	thumb_func_end ov18_021E602C

	thumb_func_start ov18_021E6070
ov18_021E6070: ; 0x021E6070
	push {r3, lr}
	mov r0, #0
	mov r1, #1
	bl SetBgPriority
	mov r0, #1
	mov r1, #0
	bl SetBgPriority
	mov r0, #2
	add r1, r0, #0
	bl SetBgPriority
	mov r0, #3
	add r1, r0, #0
	bl SetBgPriority
	mov r0, #4
	mov r1, #3
	bl SetBgPriority
	mov r0, #5
	mov r1, #0
	bl SetBgPriority
	mov r0, #6
	mov r1, #1
	bl SetBgPriority
	mov r0, #7
	mov r1, #2
	bl SetBgPriority
	pop {r3, pc}
	thumb_func_end ov18_021E6070

	thumb_func_start ov18_021E60B4
ov18_021E60B4: ; 0x021E60B4
	push {r3, lr}
	mov r0, #0
	mov r1, #1
	bl SetBgPriority
	mov r0, #1
	mov r1, #0
	bl SetBgPriority
	mov r0, #2
	add r1, r0, #0
	bl SetBgPriority
	mov r0, #3
	add r1, r0, #0
	bl SetBgPriority
	mov r0, #4
	mov r1, #0
	bl SetBgPriority
	mov r0, #5
	mov r1, #1
	bl SetBgPriority
	mov r0, #6
	mov r1, #3
	bl SetBgPriority
	mov r0, #7
	mov r1, #2
	bl SetBgPriority
	pop {r3, pc}
	thumb_func_end ov18_021E60B4

	thumb_func_start ov18_021E60F8
ov18_021E60F8: ; 0x021E60F8
	push {r3, lr}
	mov r0, #0
	mov r1, #1
	bl SetBgPriority
	mov r0, #1
	mov r1, #0
	bl SetBgPriority
	mov r0, #2
	add r1, r0, #0
	bl SetBgPriority
	mov r0, #3
	add r1, r0, #0
	bl SetBgPriority
	mov r0, #4
	mov r1, #0
	bl SetBgPriority
	mov r0, #5
	mov r1, #1
	bl SetBgPriority
	mov r0, #6
	mov r1, #3
	bl SetBgPriority
	mov r0, #7
	mov r1, #2
	bl SetBgPriority
	pop {r3, pc}
	thumb_func_end ov18_021E60F8

	thumb_func_start ov18_021E613C
ov18_021E613C: ; 0x021E613C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r1, #0
	beq _021E614A
	cmp r4, #4
	bne _021E614E
_021E614A:
	mov r0, #0x40
	b _021E6150
_021E614E:
	mov r0, #0x20
_021E6150:
	mov r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	mov r0, #0x20
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [r5, #4]
	add r1, r4, #0
	add r3, r2, #0
	bl FillBgTilemapRect
	ldr r0, [r5, #4]
	add r1, r4, #0
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov18_021E613C

	thumb_func_start ov18_021E6174
ov18_021E6174: ; 0x021E6174
	push {r3, lr}
	mov r0, #0xa
	str r0, [sp]
	ldr r0, _021E6188 ; =0x04000050
	mov r1, #0
	mov r2, #0xf
	mov r3, #6
	bl G2x_SetBlendAlpha_
	pop {r3, pc}
	.balign 4, 0
_021E6188: .word 0x04000050
	thumb_func_end ov18_021E6174

	thumb_func_start ov18_021E618C
ov18_021E618C: ; 0x021E618C
	push {r3, lr}
	add r3, r0, #0
	str r1, [sp]
	ldr r0, _021E61A0 ; =0x04000050
	mov r1, #4
	mov r2, #8
	bl G2x_SetBlendAlpha_
	pop {r3, pc}
	nop
_021E61A0: .word 0x04000050
	thumb_func_end ov18_021E618C

	thumb_func_start ov18_021E61A4
ov18_021E61A4: ; 0x021E61A4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x25
	bl sub_020030E8
	mov r1, #0x85
	lsl r1, r1, #4
	str r0, [r4, r1]
	mov r0, #0xf
	mov r1, #0x25
	bl sub_02003BA8
	mov r0, #0x85
	lsl r0, r0, #4
	mov r2, #2
	ldr r0, [r4, r0]
	mov r1, #0
	lsl r2, r2, #8
	mov r3, #0x25
	bl PaletteData_AllocBuffers
	mov r0, #0x85
	lsl r0, r0, #4
	mov r1, #1
	ldr r0, [r4, r0]
	lsl r2, r1, #9
	mov r3, #0x25
	bl PaletteData_AllocBuffers
	mov r0, #0x85
	lsl r0, r0, #4
	mov r1, #2
	ldr r0, [r4, r0]
	lsl r2, r1, #8
	mov r3, #0x25
	bl PaletteData_AllocBuffers
	mov r0, #0x85
	lsl r0, r0, #4
	mov r2, #2
	ldr r0, [r4, r0]
	mov r1, #3
	lsl r2, r2, #8
	mov r3, #0x25
	bl PaletteData_AllocBuffers
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov18_021E61A4

	thumb_func_start ov18_021E6204
ov18_021E6204: ; 0x021E6204
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x85
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #3
	bl PaletteData_FreeBuffers
	mov r0, #0x85
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #2
	bl PaletteData_FreeBuffers
	mov r0, #0x85
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl PaletteData_FreeBuffers
	mov r0, #0x85
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl PaletteData_FreeBuffers
	mov r0, #0x85
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02003104
	pop {r4, pc}
	thumb_func_end ov18_021E6204

	thumb_func_start ov18_021E6244
ov18_021E6244: ; 0x021E6244
	push {r4, lr}
	ldr r2, _021E6274 ; =0x00000322
	add r4, r0, #0
	mov r0, #0
	mov r1, #0x1b
	mov r3, #0x25
	bl NewMsgDataFromNarc
	ldr r1, _021E6278 ; =0x0000065C
	str r0, [r4, r1]
	mov r0, #0x25
	bl ScrStrBufs_new
	mov r1, #0x66
	lsl r1, r1, #4
	str r0, [r4, r1]
	mov r0, #1
	lsl r0, r0, #0xa
	mov r1, #0x25
	bl String_ctor
	ldr r1, _021E627C ; =0x00000664
	str r0, [r4, r1]
	pop {r4, pc}
	.balign 4, 0
_021E6274: .word 0x00000322
_021E6278: .word 0x0000065C
_021E627C: .word 0x00000664
	thumb_func_end ov18_021E6244

	thumb_func_start ov18_021E6280
ov18_021E6280: ; 0x021E6280
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E62A0 ; =0x00000664
	ldr r0, [r4, r0]
	bl String_dtor
	mov r0, #0x66
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ScrStrBufs_delete
	ldr r0, _021E62A4 ; =0x0000065C
	ldr r0, [r4, r0]
	bl DestroyMsgData
	pop {r4, pc}
	.balign 4, 0
_021E62A0: .word 0x00000664
_021E62A4: .word 0x0000065C
	thumb_func_end ov18_021E6280

	thumb_func_start ov18_021E62A8
ov18_021E62A8: ; 0x021E62A8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x4b
	mov r1, #0x25
	bl NARC_ctor
	mov r1, #0
	add r2, r1, #0
	mov r3, #0x25
	add r4, r0, #0
	str r1, [sp]
	bl GfGfxLoader_LoadFromOpenNarc
	ldr r1, _021E62E0 ; =0x00001850
	mov r2, #0
	str r0, [r5, r1]
	add r0, r4, #0
	mov r1, #1
	mov r3, #0x25
	str r2, [sp]
	bl GfGfxLoader_LoadFromOpenNarc
	ldr r1, _021E62E4 ; =0x00001854
	str r0, [r5, r1]
	add r0, r4, #0
	bl NARC_dtor
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E62E0: .word 0x00001850
_021E62E4: .word 0x00001854
	thumb_func_end ov18_021E62A8

	thumb_func_start ov18_021E62E8
ov18_021E62E8: ; 0x021E62E8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E6300 ; =0x00001854
	ldr r0, [r4, r0]
	bl FreeToHeap
	ldr r0, _021E6304 ; =0x00001850
	ldr r0, [r4, r0]
	bl FreeToHeap
	pop {r4, pc}
	nop
_021E6300: .word 0x00001854
_021E6304: .word 0x00001850
	thumb_func_end ov18_021E62E8

	thumb_func_start ov18_021E6308
ov18_021E6308: ; 0x021E6308
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, [r4, #4]
	mov r1, #2
	mov r2, #0x18
	mov r3, #0x25
	bl sub_0201956C
	str r0, [r4, #8]
	mov r0, #5
	str r0, [sp]
	ldr r0, [r4, #8]
	mov r1, #0
	mov r2, #2
	mov r3, #0x20
	bl sub_020195F4
	mov r0, #5
	str r0, [sp]
	ldr r0, [r4, #8]
	mov r1, #1
	mov r2, #2
	mov r3, #0x20
	bl sub_020195F4
	mov r0, #4
	str r0, [sp]
	ldr r0, [r4, #8]
	mov r1, #2
	mov r2, #0
	mov r3, #0x16
	bl sub_020195F4
	mov r0, #4
	str r0, [sp]
	ldr r0, [r4, #8]
	mov r1, #3
	mov r2, #0
	mov r3, #0x16
	bl sub_020195F4
	mov r1, #4
	str r1, [sp]
	ldr r0, [r4, #8]
	mov r2, #2
	mov r3, #0x20
	bl sub_020195F4
	mov r1, #5
	str r1, [sp]
	ldr r0, [r4, #8]
	mov r2, #3
	mov r3, #0x20
	bl sub_020195F4
	mov r0, #4
	str r0, [sp]
	ldr r0, [r4, #8]
	mov r1, #6
	mov r2, #1
	mov r3, #0x20
	bl sub_020195F4
	mov r0, #4
	str r0, [sp]
	ldr r0, [r4, #8]
	mov r1, #7
	mov r2, #1
	mov r3, #0x20
	bl sub_020195F4
	mov r0, #5
	str r0, [sp]
	ldr r0, [r4, #8]
	mov r1, #8
	mov r2, #2
	mov r3, #0x20
	bl sub_020195F4
	mov r0, #0x18
	str r0, [sp]
	ldr r0, [r4, #8]
	mov r1, #9
	mov r2, #0
	mov r3, #0x20
	bl sub_020195F4
	mov r0, #0x18
	str r0, [sp]
	ldr r0, [r4, #8]
	mov r1, #0xa
	mov r2, #2
	mov r3, #0x20
	bl sub_020195F4
	mov r0, #0x18
	str r0, [sp]
	ldr r0, [r4, #8]
	mov r1, #0xb
	mov r2, #5
	mov r3, #0x20
	bl sub_020195F4
	mov r0, #0x18
	str r0, [sp]
	ldr r0, [r4, #8]
	mov r1, #0xc
	mov r2, #6
	mov r3, #0x20
	bl sub_020195F4
	mov r0, #0x18
	str r0, [sp]
	ldr r0, [r4, #8]
	mov r1, #0xd
	mov r2, #4
	mov r3, #0x20
	bl sub_020195F4
	mov r0, #0x18
	str r0, [sp]
	ldr r0, [r4, #8]
	mov r1, #0xf
	mov r2, #0
	mov r3, #0x20
	bl sub_020195F4
	mov r0, #0x18
	str r0, [sp]
	ldr r0, [r4, #8]
	mov r1, #0xe
	mov r2, #0
	mov r3, #3
	bl sub_020195F4
	mov r0, #4
	str r0, [sp]
	ldr r0, [r4, #8]
	mov r1, #0x10
	mov r2, #1
	mov r3, #0x20
	bl sub_020195F4
	mov r0, #4
	str r0, [sp]
	ldr r0, [r4, #8]
	mov r1, #0x17
	mov r2, #7
	mov r3, #0x14
	bl sub_020195F4
	mov r0, #1
	str r0, [sp]
	ldr r2, _021E653C ; =0x00000854
	ldr r0, [r4, #8]
	ldr r2, [r4, r2]
	mov r1, #0
	mov r3, #5
	bl sub_020196B8
	mov r1, #1
	str r1, [sp]
	ldr r2, _021E653C ; =0x00000854
	ldr r0, [r4, #8]
	ldr r2, [r4, r2]
	mov r3, #6
	bl sub_020196B8
	mov r0, #1
	str r0, [sp]
	ldr r2, _021E653C ; =0x00000854
	ldr r0, [r4, #8]
	ldr r2, [r4, r2]
	mov r1, #2
	mov r3, #7
	bl sub_020196B8
	mov r0, #1
	str r0, [sp]
	ldr r2, _021E653C ; =0x00000854
	ldr r0, [r4, #8]
	ldr r2, [r4, r2]
	mov r1, #3
	mov r3, #8
	bl sub_020196B8
	mov r0, #1
	str r0, [sp]
	ldr r2, _021E653C ; =0x00000854
	ldr r0, [r4, #8]
	ldr r2, [r4, r2]
	mov r1, #4
	mov r3, #9
	bl sub_020196B8
	mov r0, #1
	str r0, [sp]
	ldr r2, _021E653C ; =0x00000854
	ldr r0, [r4, #8]
	ldr r2, [r4, r2]
	mov r1, #5
	mov r3, #0xa
	bl sub_020196B8
	mov r0, #1
	str r0, [sp]
	ldr r2, _021E653C ; =0x00000854
	ldr r0, [r4, #8]
	ldr r2, [r4, r2]
	mov r1, #6
	mov r3, #0x45
	bl sub_020196B8
	mov r0, #1
	str r0, [sp]
	ldr r2, _021E653C ; =0x00000854
	ldr r0, [r4, #8]
	ldr r2, [r4, r2]
	mov r1, #7
	mov r3, #0x46
	bl sub_020196B8
	mov r0, #1
	str r0, [sp]
	ldr r2, _021E653C ; =0x00000854
	ldr r0, [r4, #8]
	ldr r2, [r4, r2]
	mov r1, #8
	mov r3, #0x47
	bl sub_020196B8
	mov r0, #1
	str r0, [sp]
	ldr r2, _021E653C ; =0x00000854
	ldr r0, [r4, #8]
	ldr r2, [r4, r2]
	mov r1, #0xd
	mov r3, #0x10
	bl sub_020196B8
	mov r0, #1
	str r0, [sp]
	ldr r2, _021E653C ; =0x00000854
	ldr r0, [r4, #8]
	ldr r2, [r4, r2]
	mov r1, #0x10
	mov r3, #0xb
	bl sub_020196B8
	mov r0, #1
	str r0, [sp]
	ldr r2, _021E653C ; =0x00000854
	ldr r0, [r4, #8]
	ldr r2, [r4, r2]
	mov r1, #0x17
	mov r3, #0x58
	bl sub_020196B8
	mov r2, #0
	str r2, [sp]
	mov r0, #0x13
	str r0, [sp, #4]
	ldr r0, [r4, #8]
	mov r1, #0xb
	mov r3, #0x20
	bl sub_02019B70
	mov r2, #0
	str r2, [sp]
	mov r0, #0x13
	str r0, [sp, #4]
	ldr r0, [r4, #8]
	mov r1, #0xc
	mov r3, #0x20
	bl sub_02019B70
	add r0, r4, #0
	bl ov18_021F0168
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_021E653C: .word 0x00000854
	thumb_func_end ov18_021E6308

	thumb_func_start ov18_021E6540
ov18_021E6540: ; 0x021E6540
	ldr r3, _021E6548 ; =sub_020195C0
	ldr r0, [r0, #8]
	bx r3
	nop
_021E6548: .word sub_020195C0
	thumb_func_end ov18_021E6540

	thumb_func_start ov18_021E654C
ov18_021E654C: ; 0x021E654C
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r1, #0
	ldr r0, [r4, #8]
	add r2, r1, #0
	mov r3, #0x18
	bl sub_020196E8
	mov r1, #0
	mov r0, #5
	str r0, [sp]
	ldr r0, [r4, #8]
	add r2, r1, #0
	sub r3, r1, #1
	bl sub_020198FC
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov18_021E654C

	thumb_func_start ov18_021E6574
ov18_021E6574: ; 0x021E6574
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r1, #0
	ldr r0, [r4, #8]
	add r2, r1, #0
	mov r3, #0x13
	bl sub_020196E8
	mov r0, #5
	str r0, [sp]
	mov r1, #0
	ldr r0, [r4, #8]
	add r2, r1, #0
	mov r3, #1
	bl sub_020198FC
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov18_021E6574

	thumb_func_start ov18_021E659C
ov18_021E659C: ; 0x021E659C
	push {r3, lr}
	ldr r0, [r0, #8]
	mov r1, #4
	mov r2, #0
	mov r3, #0xf
	bl sub_020196E8
	pop {r3, pc}
	thumb_func_end ov18_021E659C

	thumb_func_start ov18_021E65AC
ov18_021E65AC: ; 0x021E65AC
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, [r4, #8]
	mov r1, #1
	mov r2, #0
	mov r3, #0x18
	bl sub_020196E8
	mov r0, #5
	str r0, [sp]
	mov r2, #0
	ldr r0, [r4, #8]
	mov r1, #1
	sub r3, r2, #1
	bl sub_020198FC
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov18_021E65AC

	thumb_func_start ov18_021E65D4
ov18_021E65D4: ; 0x021E65D4
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, [r4, #8]
	mov r1, #1
	mov r2, #0
	mov r3, #0x13
	bl sub_020196E8
	mov r0, #5
	str r0, [sp]
	mov r1, #1
	ldr r0, [r4, #8]
	mov r2, #0
	add r3, r1, #0
	bl sub_020198FC
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov18_021E65D4

	thumb_func_start ov18_021E65FC
ov18_021E65FC: ; 0x021E65FC
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, [r4, #8]
	mov r1, #6
	mov r2, #0
	mov r3, #0x18
	bl sub_020196E8
	mov r0, #4
	str r0, [sp]
	mov r2, #0
	ldr r0, [r4, #8]
	mov r1, #6
	sub r3, r2, #1
	bl sub_020198FC
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov18_021E65FC

	thumb_func_start ov18_021E6624
ov18_021E6624: ; 0x021E6624
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, [r4, #8]
	mov r1, #6
	mov r2, #0
	mov r3, #0x14
	bl sub_020196E8
	mov r0, #4
	str r0, [sp]
	ldr r0, [r4, #8]
	mov r1, #6
	mov r2, #0
	mov r3, #1
	bl sub_020198FC
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov18_021E6624

	thumb_func_start ov18_021E664C
ov18_021E664C: ; 0x021E664C
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, [r4, #8]
	mov r1, #7
	mov r2, #0
	mov r3, #0x18
	bl sub_020196E8
	mov r0, #4
	str r0, [sp]
	mov r2, #0
	ldr r0, [r4, #8]
	mov r1, #7
	sub r3, r2, #1
	bl sub_020198FC
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov18_021E664C

	thumb_func_start ov18_021E6674
ov18_021E6674: ; 0x021E6674
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, [r4, #8]
	mov r1, #7
	mov r2, #0
	mov r3, #0x14
	bl sub_020196E8
	mov r0, #4
	str r0, [sp]
	ldr r0, [r4, #8]
	mov r1, #7
	mov r2, #0
	mov r3, #1
	bl sub_020198FC
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov18_021E6674

	thumb_func_start ov18_021E669C
ov18_021E669C: ; 0x021E669C
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, [r4, #8]
	mov r1, #8
	mov r2, #0
	mov r3, #0x18
	bl sub_020196E8
	mov r0, #5
	str r0, [sp]
	mov r2, #0
	ldr r0, [r4, #8]
	mov r1, #8
	sub r3, r2, #1
	bl sub_020198FC
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov18_021E669C

	thumb_func_start ov18_021E66C4
ov18_021E66C4: ; 0x021E66C4
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, [r4, #8]
	mov r1, #8
	mov r2, #0
	mov r3, #0x13
	bl sub_020196E8
	mov r0, #5
	str r0, [sp]
	ldr r0, [r4, #8]
	mov r1, #8
	mov r2, #0
	mov r3, #1
	bl sub_020198FC
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov18_021E66C4

	thumb_func_start ov18_021E66EC
ov18_021E66EC: ; 0x021E66EC
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, [r4, #8]
	mov r1, #0x10
	mov r2, #0
	mov r3, #0x18
	bl sub_020196E8
	mov r0, #4
	str r0, [sp]
	mov r2, #0
	ldr r0, [r4, #8]
	mov r1, #0x10
	sub r3, r2, #1
	bl sub_020198FC
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov18_021E66EC

	thumb_func_start ov18_021E6714
ov18_021E6714: ; 0x021E6714
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, [r4, #8]
	mov r1, #0x10
	mov r2, #0
	mov r3, #0x14
	bl sub_020196E8
	mov r0, #4
	str r0, [sp]
	ldr r0, [r4, #8]
	mov r1, #0x10
	mov r2, #0
	mov r3, #1
	bl sub_020198FC
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov18_021E6714

	thumb_func_start ov18_021E673C
ov18_021E673C: ; 0x021E673C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #8]
	mov r1, #0x10
	bl sub_02019B08
	ldr r1, _021E678C ; =0x000018A2
	add r4, r0, #0
	ldr r0, [r5]
	ldrh r1, [r5, r1]
	ldr r0, [r0]
	bl Pokedex_CheckMonCaughtFlag
	cmp r0, #0
	beq _021E675E
	mov r5, #0
	b _021E6762
_021E675E:
	mov r5, #0xb
	lsl r5, r5, #0xc
_021E6762:
	mov r0, #0
	ldr r6, _021E6790 ; =0x00000FFF
	add r2, r0, #0
_021E6768:
	lsl r3, r2, #1
	add r3, r4, r3
	mov r1, #8
	add r3, #0x10
_021E6770:
	ldrh r7, [r3]
	add r1, r1, #1
	and r7, r6
	orr r7, r5
	strh r7, [r3]
	add r3, r3, #2
	cmp r1, #0x10
	blo _021E6770
	add r0, r0, #1
	add r2, #0x20
	cmp r0, #4
	blo _021E6768
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E678C: .word 0x000018A2
_021E6790: .word 0x00000FFF
	thumb_func_end ov18_021E673C

	thumb_func_start ov18_021E6794
ov18_021E6794: ; 0x021E6794
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #8]
	mov r1, #0x17
	mov r2, #0xa
	mov r3, #0xb
	bl sub_020196E8
	add r4, #0x3c
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov18_021E6794

	thumb_func_start ov18_021E67B0
ov18_021E67B0: ; 0x021E67B0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #8]
	mov r1, #0x17
	bl sub_0201980C
	add r4, #0x3c
	add r0, r4, #0
	bl ClearWindowTilemapAndScheduleTransfer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov18_021E67B0

	thumb_func_start ov18_021E67C8
ov18_021E67C8: ; 0x021E67C8
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #5
	bhi _021E6864
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E67DC: ; jump table
	.short _021E67E8 - _021E67DC - 2 ; case 0
	.short _021E67FE - _021E67DC - 2 ; case 1
	.short _021E6814 - _021E67DC - 2 ; case 2
	.short _021E682A - _021E67DC - 2 ; case 3
	.short _021E6840 - _021E67DC - 2 ; case 4
	.short _021E6850 - _021E67DC - 2 ; case 5
_021E67E8:
	bl ov18_021E6868
	bl ov18_021E5FA4
	add r0, r4, #0
	bl ov18_021EE3FC
	add r0, r4, #0
	bl ov18_021F2880
	pop {r4, pc}
_021E67FE:
	bl ov18_021E7BD0
	bl ov18_021E6070
	add r0, r4, #0
	bl ov18_021F021C
	add r0, r4, #0
	bl ov18_021F3D98
	pop {r4, pc}
_021E6814:
	bl ov18_021E7D90
	bl ov18_021E60B4
	add r0, r4, #0
	bl ov18_021F05E8
	add r0, r4, #0
	bl ov18_021F49F8
	pop {r4, pc}
_021E682A:
	bl ov18_021E800C
	bl ov18_021E602C
	add r0, r4, #0
	bl ov18_021F0900
	add r0, r4, #0
	bl ov18_021F5DC0
	pop {r4, pc}
_021E6840:
	bl ov18_021E7ED8
	bl ov18_021E60F8
	add r0, r4, #0
	bl ov18_021F0858
	pop {r4, pc}
_021E6850:
	bl ov18_021E7048
	bl ov18_021E5FE8
	add r0, r4, #0
	bl ov18_021EEE58
	add r0, r4, #0
	bl ov18_021F2F3C
_021E6864:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov18_021E67C8

	thumb_func_start ov18_021E6868
ov18_021E6868: ; 0x021E6868
	push {r4, r5, lr}
	sub sp, #0x14
	add r4, r0, #0
	mov r1, #1
	bl ov18_021E613C
	add r0, r4, #0
	mov r1, #2
	bl ov18_021E613C
	add r0, r4, #0
	mov r1, #3
	bl ov18_021E613C
	add r0, r4, #0
	mov r1, #4
	bl ov18_021E613C
	add r0, r4, #0
	mov r1, #5
	bl ov18_021E613C
	add r0, r4, #0
	mov r1, #6
	bl ov18_021E613C
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E6A64 ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0x25
	str r0, [sp]
	ldr r0, _021E6A64 ; =0x00000854
	mov r1, #0
	ldr r0, [r4, r0]
	mov r2, #1
	add r3, sp, #0x10
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	ldr r2, [sp, #0x10]
	add r5, r0, #0
	mov r3, #1
	ldr r0, [r4, #4]
	mov r1, #0
	add r2, #0xc
	lsl r3, r3, #0xc
	bl BG_LoadScreenTilemapData
	add r0, r5, #0
	bl FreeToHeap
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E6A64 ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #4
	mov r3, #2
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E6A64 ; =0x00000854
	mov r1, #3
	ldr r0, [r4, r0]
	ldr r2, [r4, #4]
	add r3, r1, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	mov r1, #0x85
	str r0, [sp, #4]
	lsl r1, r1, #4
	str r0, [sp, #8]
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #2
	mov r3, #0x25
	bl sub_02003284
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E6A64 ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x11
	mov r3, #4
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E6A64 ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x10
	mov r3, #4
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E6A64 ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x13
	mov r3, #7
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	ldr r0, _021E6A68 ; =0x0000185C
	ldrb r0, [r4, r0]
	cmp r0, #2
	bne _021E69AA
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E6A64 ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x14
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	b _021E69C6
_021E69AA:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E6A64 ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x15
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
_021E69C6:
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	mov r1, #0x85
	str r0, [sp, #4]
	lsl r1, r1, #4
	str r0, [sp, #8]
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #0x12
	mov r3, #0x25
	bl sub_02003284
	ldr r0, _021E6A6C ; =0x00001860
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _021E6A06
	mov r0, #0xf
	str r0, [sp]
	mov r0, #0x1a
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, [r4, #4]
	mov r1, #0
	mov r2, #0x16
	mov r3, #3
	bl FillBgTilemapRect
_021E6A06:
	add r0, r4, #0
	bl ov18_021E6A70
	mov r1, #0
	ldr r0, [r4, #8]
	add r2, r1, #0
	mov r3, #0x13
	bl sub_020196E8
	add r0, r4, #0
	bl ov18_021E6C98
	ldr r0, [r4, #4]
	mov r1, #0
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #4]
	mov r1, #1
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #4]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #4]
	mov r1, #3
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #4]
	mov r1, #4
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #4]
	mov r1, #5
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #4]
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #4]
	mov r1, #7
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x14
	pop {r4, r5, pc}
	nop
_021E6A64: .word 0x00000854
_021E6A68: .word 0x0000185C
_021E6A6C: .word 0x00001860
	thumb_func_end ov18_021E6868

	thumb_func_start ov18_021E6A70
ov18_021E6A70: ; 0x021E6A70
	push {r3, lr}
	ldr r1, _021E6A94 ; =0x00001858
	ldrb r1, [r0, r1]
	ldr r0, [r0, #8]
	cmp r1, #0
	bne _021E6A88
	mov r1, #2
	mov r2, #5
	mov r3, #3
	bl sub_020196E8
	pop {r3, pc}
_021E6A88:
	mov r1, #3
	mov r2, #5
	add r3, r1, #0
	bl sub_020196E8
	pop {r3, pc}
	.balign 4, 0
_021E6A94: .word 0x00001858
	thumb_func_end ov18_021E6A70

	thumb_func_start ov18_021E6A98
ov18_021E6A98: ; 0x021E6A98
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	ldr r1, _021E6AE8 ; =_021F973C
	str r2, [sp]
	ldrb r2, [r1]
	add r7, r0, #0
	add r0, sp, #4
	strb r2, [r0]
	ldrb r2, [r1, #1]
	ldrb r1, [r1, #2]
	mov r4, #0
	strb r2, [r0, #1]
	strb r1, [r0, #2]
_021E6AB4:
	add r0, sp, #4
	ldrb r6, [r0, r4]
	add r0, r5, #0
	add r1, r6, #0
	bl _s32_div_f
	ldr r1, [sp]
	add r1, r1, r0
	mov r0, #1
	lsl r0, r0, #0xc
	orr r1, r0
	lsl r0, r4, #1
	strh r1, [r7, r0]
	add r0, r5, #0
	add r1, r6, #0
	bl _u32_div_f
	lsl r0, r1, #0x10
	lsr r5, r0, #0x10
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #3
	blo _021E6AB4
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E6AE8: .word _021F973C
	thumb_func_end ov18_021E6A98

	thumb_func_start ov18_021E6AEC
ov18_021E6AEC: ; 0x021E6AEC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r1, [sp, #4]
	mov r1, #0x32
	str r0, [sp]
	mov r0, #0x25
	lsl r1, r1, #6
	bl AllocFromHeapAtEnd
	add r6, r0, #0
	ldr r0, [sp]
	mov r1, #5
	ldr r0, [r0, #8]
	bl sub_02019B08
	str r0, [sp, #0x14]
	ldr r0, [sp]
	mov r1, #1
	bl ov18_021F891C
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0xc]
_021E6B1A:
	ldr r0, [sp, #0xc]
	mov r2, #0xa0
	add r5, r0, #0
	mul r5, r2
	lsl r1, r5, #1
	ldr r0, [sp, #0x14]
	add r1, r6, r1
	add r2, #0xa0
	bl MIi_CpuCopy16
	ldr r0, [sp, #0xc]
	mov r4, #0
	lsl r1, r0, #2
	add r1, r0, r1
	ldr r0, [sp, #4]
	add r0, r0, r1
	str r0, [sp, #8]
	lsl r0, r5, #1
	add r7, r6, r0
	add r5, #0x25
_021E6B42:
	ldr r0, [sp, #8]
	add r1, r4, r0
	ldr r0, [sp, #0x10]
	cmp r1, r0
	bhs _021E6B9C
	ldr r0, [sp]
	lsl r2, r1, #2
	add r2, r0, r2
	ldr r0, _021E6BB0 ; =0x00001032
	ldrh r0, [r2, r0]
	cmp r0, #2
	bne _021E6B7C
	lsl r0, r4, #2
	add r3, r4, r0
	lsl r0, r3, #1
	add r2, r7, r0
	ldr r0, _021E6BB4 ; =0x00001002
	add r2, #0x48
	strh r0, [r2]
	add r0, r5, r3
	add r1, r1, #1
	lsl r0, r0, #1
	lsl r1, r1, #0x10
	add r0, r6, r0
	lsr r1, r1, #0x10
	mov r2, #3
	bl ov18_021E6A98
	b _021E6B92
_021E6B7C:
	lsl r0, r4, #2
	add r0, r4, r0
	add r0, r5, r0
	add r1, r1, #1
	lsl r0, r0, #1
	lsl r1, r1, #0x10
	add r0, r6, r0
	lsr r1, r1, #0x10
	mov r2, #0xe
	bl ov18_021E6A98
_021E6B92:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #5
	blo _021E6B42
_021E6B9C:
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0xc]
	cmp r0, #0xa
	blo _021E6B1A
	add r0, r6, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E6BB0: .word 0x00001032
_021E6BB4: .word 0x00001002
	thumb_func_end ov18_021E6AEC

	thumb_func_start ov18_021E6BB8
ov18_021E6BB8: ; 0x021E6BB8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r1, [sp]
	mov r1, #0x32
	add r7, r0, #0
	mov r0, #0x25
	lsl r1, r1, #6
	bl AllocFromHeapAtEnd
	add r6, r0, #0
	ldr r0, [r7, #8]
	mov r1, #5
	bl sub_02019B08
	str r0, [sp, #0x14]
	mov r0, #0
	str r0, [sp, #0x10]
_021E6BDA:
	ldr r0, [sp, #0x10]
	mov r2, #0xa0
	add r5, r0, #0
	mul r5, r2
	lsl r1, r5, #1
	ldr r0, [sp, #0x14]
	add r1, r6, r1
	add r2, #0xa0
	bl MIi_CpuCopy16
	ldr r0, [sp, #0x10]
	mov r4, #0
	lsl r1, r0, #2
	add r1, r0, r1
	ldr r0, [sp]
	add r0, r0, r1
	str r0, [sp, #0xc]
	lsl r0, r5, #1
	add r0, r6, r0
	str r0, [sp, #8]
	add r5, #0x25
_021E6C04:
	ldr r0, [sp, #0xc]
	add r0, r4, r0
	lsl r0, r0, #2
	add r1, r7, r0
	ldr r0, _021E6C80 ; =0x00001030
	str r1, [sp, #4]
	ldrh r1, [r1, r0]
	cmp r1, #0
	beq _021E6C60
	ldr r0, _021E6C84 ; =0x00001858
	ldrb r0, [r7, r0]
	bl Pokedex_ConvertToCurrentDexNo
	add r1, r0, #0
	ldr r2, [sp, #4]
	ldr r0, _021E6C88 ; =0x00001032
	ldrh r0, [r2, r0]
	cmp r0, #2
	bne _021E6C4C
	lsl r0, r4, #2
	add r0, r4, r0
	lsl r3, r0, #1
	ldr r2, [sp, #8]
	add r0, r5, r0
	add r3, r2, r3
	lsl r0, r0, #1
	lsl r1, r1, #0x10
	ldr r2, _021E6C8C ; =0x00001002
	add r3, #0x48
	strh r2, [r3]
	add r0, r6, r0
	lsr r1, r1, #0x10
	mov r2, #3
	bl ov18_021E6A98
	b _021E6C60
_021E6C4C:
	lsl r0, r4, #2
	add r0, r4, r0
	add r0, r5, r0
	lsl r0, r0, #1
	lsl r1, r1, #0x10
	add r0, r6, r0
	lsr r1, r1, #0x10
	mov r2, #0xe
	bl ov18_021E6A98
_021E6C60:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #5
	blo _021E6C04
	ldr r0, [sp, #0x10]
	add r0, r0, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	cmp r0, #0xa
	blo _021E6BDA
	add r0, r6, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6C80: .word 0x00001030
_021E6C84: .word 0x00001858
_021E6C88: .word 0x00001032
_021E6C8C: .word 0x00001002
	thumb_func_end ov18_021E6BB8

	thumb_func_start ov18_021E6C90
ov18_021E6C90: ; 0x021E6C90
	ldr r3, _021E6C94 ; =FreeToHeap
	bx r3
	.balign 4, 0
_021E6C94: .word FreeToHeap
	thumb_func_end ov18_021E6C90

	thumb_func_start ov18_021E6C98
ov18_021E6C98: ; 0x021E6C98
	push {r3, r4, r5, lr}
	ldr r1, _021E6CBC ; =0x00001859
	add r4, r0, #0
	ldrb r2, [r4, r1]
	mov r1, #0xf
	mul r1, r2
	bl ov18_021E6AEC
	add r5, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	bl ov18_021E6CE8
	add r0, r5, #0
	bl ov18_021E6C90
	pop {r3, r4, r5, pc}
	nop
_021E6CBC: .word 0x00001859
	thumb_func_end ov18_021E6C98

	thumb_func_start ov18_021E6CC0
ov18_021E6CC0: ; 0x021E6CC0
	push {r3, r4, r5, lr}
	ldr r1, _021E6CE4 ; =0x00001859
	add r4, r0, #0
	ldrb r2, [r4, r1]
	mov r1, #0xf
	mul r1, r2
	bl ov18_021E6BB8
	add r5, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	bl ov18_021E6CE8
	add r0, r5, #0
	bl ov18_021E6C90
	pop {r3, r4, r5, pc}
	nop
_021E6CE4: .word 0x00001859
	thumb_func_end ov18_021E6CC0

	thumb_func_start ov18_021E6CE8
ov18_021E6CE8: ; 0x021E6CE8
	push {r3, r4, lr}
	sub sp, #0xc
	mov r3, #0
	add r4, r0, #0
	str r3, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x18
	str r0, [sp, #8]
	add r2, r1, #0
	ldr r0, [r4, #4]
	mov r1, #3
	bl LoadRectToBgTilemapRect
	ldr r0, [r4, #4]
	mov r1, #3
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov18_021E6CE8

	thumb_func_start ov18_021E6D10
ov18_021E6D10: ; 0x021E6D10
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	ldr r0, [r0]
	add r6, r2, #0
	bl Pokedex_GetInternationalViewFlag
	cmp r0, #0
	bne _021E6D28
	mov r0, #0
	pop {r4, r5, r6, pc}
_021E6D28:
	ldr r0, [r5]
	add r1, r4, #0
	ldr r0, [r0]
	add r2, r6, #0
	bl Pokedex_HasCaughtMonWithLanguage
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov18_021E6D10

	thumb_func_start ov18_021E6D38
ov18_021E6D38: ; 0x021E6D38
	push {r3, r4, r5, r6, r7, lr}
	ldr r5, _021E6D64 ; =_021F9C18
	add r6, r0, #0
	add r7, r1, #0
	mov r4, #0
_021E6D42:
	ldrb r2, [r5]
	cmp r2, #2
	beq _021E6D58
	add r0, r6, #0
	add r1, r7, #0
	bl ov18_021E6D10
	cmp r0, #1
	bne _021E6D58
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E6D58:
	add r4, r4, #1
	add r5, r5, #1
	cmp r4, #6
	blo _021E6D42
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E6D64: .word _021F9C18
	thumb_func_end ov18_021E6D38

	thumb_func_start ov18_021E6D68
ov18_021E6D68: ; 0x021E6D68
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r1, [sp, #4]
	add r5, r0, #0
	str r2, [sp, #8]
	ldr r0, [r5]
	ldr r0, [r0]
	bl Pokedex_GetInternationalViewFlag
	cmp r0, #0
	beq _021E6E34
	ldr r0, _021E6E38 ; =0x0000185C
	ldrb r0, [r5, r0]
	bl LanguageToDexFlag
	lsl r0, r0, #0x10
	asr r7, r0, #0x10
	mov r6, #0
_021E6D8C:
	ldr r1, [sp, #8]
	add r0, r7, #0
	bl sub_020912D0
	add r7, r0, #0
	bl sub_02091294
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	ldr r0, _021E6E38 ; =0x0000185C
	ldrb r0, [r5, r0]
	cmp r4, r0
	beq _021E6E34
	lsl r2, r4, #0x10
	ldr r1, [sp, #4]
	add r0, r5, #0
	lsr r2, r2, #0x10
	bl ov18_021E6D10
	cmp r0, #1
	beq _021E6DBA
	cmp r4, #2
	bne _021E6E2E
_021E6DBA:
	add r0, r5, #0
	bl ov18_021F8824
	add r6, r0, #0
	ldr r0, _021E6E38 ; =0x0000185C
	mov r2, #6
	strb r4, [r5, r0]
	ldr r1, [sp, #4]
	add r0, r5, #0
	bl ov18_021EE638
	mov r0, #0x25
	str r0, [sp]
	ldr r2, _021E6E38 ; =0x0000185C
	ldr r3, _021E6E3C ; =0x00000854
	ldrb r2, [r5, r2]
	ldr r0, [r5, #4]
	ldr r3, [r5, r3]
	mov r1, #7
	bl ov18_021E6F6C
	ldr r1, [sp, #4]
	add r0, r5, #0
	add r2, r6, #0
	bl ov18_021EE8B8
	ldr r1, [sp, #4]
	add r0, r5, #0
	mov r2, #8
	bl ov18_021F24E0
	ldr r1, [sp, #4]
	add r0, r5, #0
	mov r2, #0x12
	bl ov18_021F2530
	ldr r1, [sp, #4]
	add r0, r5, #0
	add r2, r6, #0
	mov r3, #0xe
	bl ov18_021F209C
	ldr r1, [sp, #4]
	add r0, r5, #0
	add r2, r6, #0
	mov r3, #0xd
	bl ov18_021F1DE4
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #9
	bl ov18_021F2EC8
	ldr r0, _021E6E40 ; =0x000008E8
	bl PlaySE
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_021E6E2E:
	add r6, r6, #1
	cmp r6, #6
	blo _021E6D8C
_021E6E34:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E6E38: .word 0x0000185C
_021E6E3C: .word 0x00000854
_021E6E40: .word 0x000008E8
	thumb_func_end ov18_021E6D68

	thumb_func_start ov18_021E6E44
ov18_021E6E44: ; 0x021E6E44
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl ov18_021F8824
	add r6, r0, #0
	add r0, r5, #0
	bl ov18_021F8838
	add r4, r0, #0
	bne _021E6E70
	add r0, r5, #0
	mov r1, #6
	mov r2, #0
	bl ov18_021F2A2C
	add r0, r5, #0
	mov r1, #8
	mov r2, #0
	bl ov18_021F2A84
	b _021E6E9C
_021E6E70:
	add r0, r5, #0
	add r1, r4, #0
	bl ov18_021E6D38
	cmp r0, #1
	bne _021E6E88
	add r0, r5, #0
	mov r1, #6
	mov r2, #1
	bl ov18_021F2A2C
	b _021E6E92
_021E6E88:
	add r0, r5, #0
	mov r1, #6
	mov r2, #0
	bl ov18_021F2A2C
_021E6E92:
	add r0, r5, #0
	mov r1, #8
	mov r2, #1
	bl ov18_021F2A84
_021E6E9C:
	ldr r2, _021E6F64 ; =0x0000185C
	add r0, r5, #0
	ldrb r2, [r5, r2]
	add r1, r4, #0
	bl ov18_021E6D10
	cmp r0, #0
	bne _021E6EB2
	ldr r0, _021E6F64 ; =0x0000185C
	mov r1, #2
	strb r1, [r5, r0]
_021E6EB2:
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #6
	bl ov18_021EE638
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov18_021EE6BC
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov18_021EE8B8
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0xb
	mov r3, #0xa
	bl ov18_021F1CAC
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #8
	bl ov18_021F24E0
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x12
	bl ov18_021F2530
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #0xe
	bl ov18_021F209C
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #0xd
	bl ov18_021F1DE4
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #9
	bl ov18_021F2EC8
	add r0, r5, #0
	mov r1, #1
	bl ov18_021F891C
	cmp r6, r0
	blo _021E6F42
	ldr r2, _021E6F68 ; =0x00000854
	ldr r0, [r5, #4]
	ldr r2, [r5, r2]
	mov r1, #7
	mov r3, #0x25
	bl ov18_021E6FB8
	add r0, r5, #0
	add r0, #0x7c
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r5, #0
	mov r1, #0xa
	mov r2, #0
	bl ov18_021F11C0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_021E6F42:
	mov r0, #0x25
	str r0, [sp]
	ldr r2, _021E6F64 ; =0x0000185C
	ldr r3, _021E6F68 ; =0x00000854
	ldrb r2, [r5, r2]
	ldr r0, [r5, #4]
	ldr r3, [r5, r3]
	mov r1, #7
	bl ov18_021E6F6C
	add r5, #0x7c
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_021E6F64: .word 0x0000185C
_021E6F68: .word 0x00000854
	thumb_func_end ov18_021E6E44

	thumb_func_start ov18_021E6F6C
ov18_021E6F6C: ; 0x021E6F6C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r1, #0
	cmp r2, #2
	bne _021E6F7C
	mov r1, #0x14
	b _021E6F7E
_021E6F7C:
	mov r1, #0x15
_021E6F7E:
	ldr r0, [sp, #0x20]
	mov r2, #1
	str r0, [sp]
	add r0, r3, #0
	add r3, sp, #0xc
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	mov r3, #0
	add r6, r0, #0
	str r3, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x18
	str r0, [sp, #8]
	ldr r2, [sp, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	add r2, #0xc
	bl LoadRectToBgTilemapRect
	add r0, r5, #0
	add r1, r4, #0
	bl ScheduleBgTilemapBufferTransfer
	add r0, r6, #0
	bl FreeToHeap
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov18_021E6F6C

	thumb_func_start ov18_021E6FB8
ov18_021E6FB8: ; 0x021E6FB8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r1, #0
	str r3, [sp]
	add r0, r2, #0
	mov r1, #0x16
	mov r2, #1
	add r3, sp, #0xc
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	mov r3, #0
	add r6, r0, #0
	str r3, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x18
	str r0, [sp, #8]
	ldr r2, [sp, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	add r2, #0xc
	bl LoadRectToBgTilemapRect
	add r0, r5, #0
	add r1, r4, #0
	bl ScheduleBgTilemapBufferTransfer
	add r0, r6, #0
	bl FreeToHeap
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov18_021E6FB8

	thumb_func_start ov18_021E6FFC
ov18_021E6FFC: ; 0x021E6FFC
	push {r3, r4}
	ldr r1, _021E7044 ; =0x00001868
	mov r2, #0
	str r2, [r0, r1]
	mov r4, #0x1a
	add r3, r1, #4
	str r4, [r0, r3]
	add r3, r1, #0
	mov r4, #0x11
	add r3, #8
	str r4, [r0, r3]
	add r3, r1, #0
	add r3, #0xc
	str r4, [r0, r3]
	add r3, r1, #0
	add r3, #0x10
	str r2, [r0, r3]
	add r3, r1, #0
	mov r4, #0x98
	add r3, #0x14
	str r4, [r0, r3]
	add r3, r1, #0
	add r3, #0x18
	str r2, [r0, r3]
	add r2, r1, #0
	add r2, #0x1c
	str r4, [r0, r2]
	add r2, r1, #0
	mov r3, #3
	add r2, #0x20
	str r3, [r0, r2]
	mov r2, #0xe
	add r1, #0x24
	str r2, [r0, r1]
	pop {r3, r4}
	bx lr
	.balign 4, 0
_021E7044: .word 0x00001868
	thumb_func_end ov18_021E6FFC

	thumb_func_start ov18_021E7048
ov18_021E7048: ; 0x021E7048
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r1, #0
	bl ov18_021E613C
	add r0, r4, #0
	mov r1, #1
	bl ov18_021E613C
	add r0, r4, #0
	mov r1, #3
	bl ov18_021E613C
	add r0, r4, #0
	mov r1, #4
	bl ov18_021E613C
	add r0, r4, #0
	mov r1, #5
	bl ov18_021E613C
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E71CC ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #4
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E71CC ; =0x00000854
	mov r1, #3
	ldr r0, [r4, r0]
	ldr r2, [r4, #4]
	add r3, r1, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E71CC ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x3a
	mov r3, #2
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E71CC ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x39
	mov r3, #2
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	mov r1, #0x85
	str r0, [sp, #4]
	lsl r1, r1, #4
	str r0, [sp, #8]
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #2
	mov r3, #0x25
	bl sub_02003284
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E71CC ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x3a
	mov r3, #6
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E71CC ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x3a
	mov r3, #7
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E71CC ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x3b
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E71CC ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x3c
	mov r3, #6
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	mov r1, #0x85
	str r0, [sp, #4]
	lsl r1, r1, #4
	str r0, [sp, #8]
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #0x12
	mov r3, #0x25
	bl sub_02003284
	ldr r0, [r4, #4]
	mov r1, #0
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #4]
	mov r1, #1
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #4]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #4]
	mov r1, #3
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #4]
	mov r1, #4
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #4]
	mov r1, #5
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #4]
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #4]
	mov r1, #7
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_021E71CC: .word 0x00000854
	thumb_func_end ov18_021E7048

	thumb_func_start ov18_021E71D0
ov18_021E71D0: ; 0x021E71D0
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r5, r2, #0
	cmp r1, #7
	bls _021E71DE
	b _021E7426
_021E71DE:
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E71EA: ; jump table
	.short _021E71FA - _021E71EA - 2 ; case 0
	.short _021E723E - _021E71EA - 2 ; case 1
	.short _021E728C - _021E71EA - 2 ; case 2
	.short _021E72D4 - _021E71EA - 2 ; case 3
	.short _021E7316 - _021E71EA - 2 ; case 4
	.short _021E7352 - _021E71EA - 2 ; case 5
	.short _021E738E - _021E71EA - 2 ; case 6
	.short _021E73E2 - _021E71EA - 2 ; case 7
_021E71FA:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E742C ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x39
	mov r3, #2
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add r0, r4, #0
	add r1, r5, #0
	bl ov18_021F6DE0
	add r0, r4, #0
	mov r1, #0
	bl ov18_021EEED0
	add r0, r4, #0
	bl ov18_021EF45C
	add r0, r4, #0
	bl ov18_021EF528
	add r0, r4, #0
	mov r1, #0
	bl ov18_021F3618
	add sp, #0x10
	pop {r3, r4, r5, pc}
_021E723E:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E742C ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x3e
	mov r3, #2
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldr r1, _021E7430 ; =0x00001868
	ldr r2, _021E7434 ; =_021F9780
	ldr r1, [r4, r1]
	add r0, r4, #0
	lsl r1, r1, #2
	add r1, r2, r1
	mov r2, #1
	bl ov18_021E7448
	add r0, r4, #0
	bl ov18_021F6EC0
	add r0, r4, #0
	mov r1, #2
	bl ov18_021EEED0
	add r0, r4, #0
	bl ov18_021EF5D8
	add r0, r4, #0
	mov r1, #4
	bl ov18_021F3618
	add sp, #0x10
	pop {r3, r4, r5, pc}
_021E728C:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E742C ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x3f
	mov r3, #2
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldr r1, _021E7438 ; =0x0000186C
	add r0, r4, #0
	ldr r1, [r4, r1]
	mov r2, #1
	bl ov18_021E76A4
	add r0, r4, #0
	bl ov18_021F6FA0
	add r0, r4, #0
	mov r1, #3
	bl ov18_021EEED0
	add r0, r4, #0
	bl ov18_021EF764
	add r0, r4, #0
	mov r1, #4
	bl ov18_021F3618
	add sp, #0x10
	pop {r3, r4, r5, pc}
_021E72D4:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E742C ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x40
	mov r3, #2
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add r0, r4, #0
	bl ov18_021E74E4
	add r0, r4, #0
	bl ov18_021F7124
	add r0, r4, #0
	mov r1, #4
	bl ov18_021EEED0
	add r0, r4, #0
	bl ov18_021EF848
	add r0, r4, #0
	mov r1, #4
	bl ov18_021F3618
	add sp, #0x10
	pop {r3, r4, r5, pc}
_021E7316:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E742C ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x41
	mov r3, #2
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add r0, r4, #0
	bl ov18_021F7354
	add r0, r4, #0
	mov r1, #5
	bl ov18_021EEED0
	add r0, r4, #0
	bl ov18_021EF91C
	add r0, r4, #0
	mov r1, #2
	bl ov18_021F3618
	add sp, #0x10
	pop {r3, r4, r5, pc}
_021E7352:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E742C ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x42
	mov r3, #2
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add r0, r4, #0
	bl ov18_021F74D8
	add r0, r4, #0
	mov r1, #6
	bl ov18_021EEED0
	add r0, r4, #0
	bl ov18_021EF9B4
	add r0, r4, #0
	mov r1, #3
	bl ov18_021F3618
	add sp, #0x10
	pop {r3, r4, r5, pc}
_021E738E:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E742C ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x43
	mov r3, #2
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldr r1, _021E743C ; =0x00001888
	ldr r2, _021E7440 ; =_021F9770
	ldr r1, [r4, r1]
	add r0, r4, #0
	lsl r1, r1, #2
	add r1, r2, r1
	mov r2, #1
	bl ov18_021E7448
	add r0, r4, #0
	bl ov18_021F7668
	add r0, r4, #0
	mov r1, #7
	bl ov18_021EEED0
	add r0, r4, #0
	bl ov18_021EFA50
	add r0, r4, #0
	mov r1, #4
	bl ov18_021F3618
	add r0, r4, #0
	bl ov18_021E7564
	add sp, #0x10
	pop {r3, r4, r5, pc}
_021E73E2:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E742C ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x44
	mov r3, #2
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldr r1, _021E7444 ; =0x0000188C
	add r0, r4, #0
	ldr r1, [r4, r1]
	mov r2, #1
	bl ov18_021E7628
	add r0, r4, #0
	bl ov18_021F7748
	add r0, r4, #0
	mov r1, #8
	bl ov18_021EEED0
	add r0, r4, #0
	bl ov18_021EFB88
	add r0, r4, #0
	mov r1, #1
	bl ov18_021F3618
_021E7426:
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_021E742C: .word 0x00000854
_021E7430: .word 0x00001868
_021E7434: .word _021F9780
_021E7438: .word 0x0000186C
_021E743C: .word 0x00001888
_021E7440: .word _021F9770
_021E7444: .word 0x0000188C
	thumb_func_end ov18_021E71D0

	thumb_func_start ov18_021E7448
ov18_021E7448: ; 0x021E7448
	push {r3, r4, lr}
	sub sp, #0xc
	add r3, r1, #0
	add r4, r0, #0
	cmp r2, #1
	ldrb r0, [r3, #2]
	bne _021E746E
	str r0, [sp]
	ldrb r0, [r3, #3]
	mov r1, #2
	str r0, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	ldrb r2, [r3]
	ldrb r3, [r3, #1]
	ldr r0, [r4, #4]
	bl BgTilemapRectChangePalette
	b _021E7482
_021E746E:
	str r0, [sp]
	ldrb r0, [r3, #3]
	mov r1, #2
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldrb r2, [r3]
	ldrb r3, [r3, #1]
	ldr r0, [r4, #4]
	bl BgTilemapRectChangePalette
_021E7482:
	ldr r0, [r4, #4]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov18_021E7448

	thumb_func_start ov18_021E7490
ov18_021E7490: ; 0x021E7490
	push {r3, r4, r5, r6, r7, lr}
	add r4, r2, #0
	add r5, r1, #0
	ldr r1, [r4]
	add r6, r3, #0
	lsl r1, r1, #2
	add r1, r5, r1
	mov r2, #0
	add r7, r0, #0
	bl ov18_021E7448
	lsl r1, r6, #2
	add r0, r7, #0
	add r1, r5, r1
	mov r2, #1
	str r6, [r4]
	bl ov18_021E7448
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov18_021E7490

	thumb_func_start ov18_021E74B8
ov18_021E74B8: ; 0x021E74B8
	push {r4, lr}
	ldr r2, _021E74DC ; =0x00001868
	add r4, r0, #0
	add r3, r1, #0
	ldr r1, _021E74E0 ; =_021F9780
	add r2, r4, r2
	bl ov18_021E7490
	add r0, r4, #0
	mov r1, #0x25
	bl ov18_021EFBE8
	mov r0, #0x97
	lsl r0, r0, #2
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	pop {r4, pc}
	.balign 4, 0
_021E74DC: .word 0x00001868
_021E74E0: .word _021F9780
	thumb_func_end ov18_021E74B8

	thumb_func_start ov18_021E74E4
ov18_021E74E4: ; 0x021E74E4
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	ldr r5, _021E7528 ; =_021F990C
	add r6, r0, #0
	add r7, r4, #0
_021E74EE:
	add r0, r6, #0
	add r1, r5, #0
	add r2, r7, #0
	bl ov18_021E7448
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x12
	blo _021E74EE
	ldr r1, _021E752C ; =0x00001870
	ldr r2, _021E7528 ; =_021F990C
	ldr r1, [r6, r1]
	add r0, r6, #0
	lsl r1, r1, #2
	add r1, r2, r1
	mov r2, #1
	bl ov18_021E7448
	ldr r1, _021E7530 ; =0x00001874
	ldr r2, _021E7528 ; =_021F990C
	ldr r1, [r6, r1]
	add r0, r6, #0
	lsl r1, r1, #2
	add r1, r2, r1
	mov r2, #1
	bl ov18_021E7448
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7528: .word _021F990C
_021E752C: .word 0x00001870
_021E7530: .word 0x00001874
	thumb_func_end ov18_021E74E4

	thumb_func_start ov18_021E7534
ov18_021E7534: ; 0x021E7534
	push {r4, lr}
	ldr r2, _021E7558 ; =0x00001888
	add r4, r0, #0
	add r3, r1, #0
	ldr r1, _021E755C ; =_021F9770
	add r2, r4, r2
	bl ov18_021E7490
	add r0, r4, #0
	mov r1, #0x4b
	bl ov18_021EFE70
	ldr r0, _021E7560 ; =0x000004BC
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	pop {r4, pc}
	nop
_021E7558: .word 0x00001888
_021E755C: .word _021F9770
_021E7560: .word 0x000004BC
	thumb_func_end ov18_021E7534

	thumb_func_start ov18_021E7564
ov18_021E7564: ; 0x021E7564
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, _021E7620 ; =0x00001860
	ldr r1, [r6, r0]
	cmp r1, #1
	beq _021E761C
	add r0, r0, #4
	ldr r0, [r6, r0]
	mov r1, #1
	bl sub_02019FD0
	ldr r5, _021E7624 ; =_021F9774
	ldr r0, [r6, #4]
	mov r1, #2
	bl GetBgTilemapBuffer
	add r4, r0, #0
	ldrb r0, [r5]
	ldrb r2, [r5, #1]
	sub r1, r0, #1
	sub r0, r2, #2
	sub r2, r2, #1
	lsl r0, r0, #5
	add r0, r1, r0
	lsl r2, r2, #5
	add r1, r1, r2
	ldrb r2, [r5, #2]
	lsl r0, r0, #1
	lsl r1, r1, #1
	add r2, r2, #2
	add r0, r4, r0
	add r1, r4, r1
	lsl r2, r2, #1
	bl MIi_CpuCopy16
	ldrb r0, [r5]
	ldrb r2, [r5, #1]
	sub r1, r0, #1
	sub r0, r2, #2
	lsl r0, r0, #5
	add r0, r1, r0
	lsl r2, r2, #5
	add r1, r1, r2
	ldrb r2, [r5, #2]
	lsl r0, r0, #1
	lsl r1, r1, #1
	add r2, r2, #2
	add r0, r4, r0
	add r1, r4, r1
	lsl r2, r2, #1
	bl MIi_CpuCopy16
	ldrb r0, [r5]
	ldrb r2, [r5, #1]
	sub r1, r0, #1
	sub r0, r2, #2
	add r2, r2, #1
	lsl r0, r0, #5
	add r0, r1, r0
	lsl r2, r2, #5
	add r1, r1, r2
	ldrb r2, [r5, #2]
	lsl r0, r0, #1
	lsl r1, r1, #1
	add r2, r2, #2
	add r0, r4, r0
	add r1, r4, r1
	lsl r2, r2, #1
	bl MIi_CpuCopy16
	ldrb r0, [r5]
	ldrb r2, [r5, #1]
	sub r1, r0, #1
	sub r0, r2, #3
	add r2, r2, #2
	lsl r0, r0, #5
	add r0, r1, r0
	lsl r2, r2, #5
	add r1, r1, r2
	ldrb r2, [r5, #2]
	lsl r0, r0, #1
	lsl r1, r1, #1
	add r2, r2, #2
	add r0, r4, r0
	add r1, r4, r1
	lsl r2, r2, #1
	bl MIi_CpuCopy16
	ldr r0, [r6, #4]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
_021E761C:
	pop {r4, r5, r6, pc}
	nop
_021E7620: .word 0x00001860
_021E7624: .word _021F9774
	thumb_func_end ov18_021E7564

	thumb_func_start ov18_021E7628
ov18_021E7628: ; 0x021E7628
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	add r4, r1, #0
	mov r1, #4
	add r0, sp, #0
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	add r0, r4, #0
	mov r1, #5
	add r6, r2, #0
	bl _u32_div_f
	mov r0, #6
	mul r0, r1
	add r1, r0, #2
	add r0, sp, #0
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #5
	bl _u32_div_f
	add r1, r0, #1
	lsl r0, r1, #2
	add r1, r1, r0
	add r0, sp, #0
	strb r1, [r0, #1]
	add r0, r5, #0
	add r1, sp, #0
	add r2, r6, #0
	bl ov18_021E7448
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov18_021E7628

	thumb_func_start ov18_021E766C
ov18_021E766C: ; 0x021E766C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, _021E7694 ; =0x0000188C
	add r5, r0, #0
	ldr r1, [r5, r1]
	mov r2, #0
	bl ov18_021E7628
	ldr r1, _021E7694 ; =0x0000188C
	add r0, r5, #0
	str r4, [r5, r1]
	ldr r1, [r5, r1]
	mov r2, #1
	bl ov18_021E7628
	add r0, r5, #0
	bl ov18_021F3494
	pop {r3, r4, r5, pc}
	nop
_021E7694: .word 0x0000188C
	thumb_func_end ov18_021E766C

	thumb_func_start ov18_021E7698
ov18_021E7698: ; 0x021E7698
	ldr r1, _021E76A0 ; =_021F9C20
	ldrb r0, [r1, r0]
	bx lr
	nop
_021E76A0: .word _021F9C20
	thumb_func_end ov18_021E7698

	thumb_func_start ov18_021E76A4
ov18_021E76A4: ; 0x021E76A4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	add r4, r2, #0
	mov r2, #2
	add r0, sp, #0
	strb r2, [r0, #2]
	strb r2, [r0, #3]
	ldr r0, _021E76E8 ; =_021F9C20
	ldrb r6, [r0, r1]
	mov r1, #7
	add r0, r6, #0
	bl _s32_div_f
	lsl r0, r1, #2
	add r1, r0, #3
	add r0, sp, #0
	strb r1, [r0]
	add r0, r6, #0
	mov r1, #7
	bl _s32_div_f
	lsl r0, r0, #2
	add r1, r0, #5
	add r0, sp, #0
	strb r1, [r0, #1]
	add r0, r5, #0
	add r1, sp, #0
	add r2, r4, #0
	bl ov18_021E7448
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_021E76E8: .word _021F9C20
	thumb_func_end ov18_021E76A4

	thumb_func_start ov18_021E76EC
ov18_021E76EC: ; 0x021E76EC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, _021E771C ; =0x0000186C
	add r5, r0, #0
	ldr r1, [r5, r1]
	mov r2, #0
	bl ov18_021E76A4
	ldr r1, _021E771C ; =0x0000186C
	add r0, r5, #0
	str r4, [r5, r1]
	ldr r1, [r5, r1]
	mov r2, #1
	bl ov18_021E76A4
	add r0, r5, #0
	mov r1, #0x42
	bl ov18_021EFC3C
	ldr r0, _021E7720 ; =0x0000042C
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E771C: .word 0x0000186C
_021E7720: .word 0x0000042C
	thumb_func_end ov18_021E76EC

	thumb_func_start ov18_021E7724
ov18_021E7724: ; 0x021E7724
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	str r0, [sp, #4]
	ldr r0, [r0, #8]
	mov r1, #0xf
	bl sub_02019B08
	add r4, r0, #0
	ldr r0, [sp, #4]
	mov r1, #0xe
	ldr r0, [r0, #8]
	bl sub_02019B08
	add r5, r0, #0
	mov r0, #0x25
	str r0, [sp]
	ldr r1, _021E78A0 ; =0x00000854
	ldr r0, [sp, #4]
	mov r2, #1
	ldr r0, [r0, r1]
	mov r1, #0
	add r3, sp, #0x1c
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x1c]
	mov r6, #1
	str r0, [sp, #0x10]
	add r0, #0xc
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	add r7, r4, #0
	str r0, [sp, #8]
	lsl r6, r6, #0xa
_021E776C:
	ldr r1, [sp, #8]
	add r0, r7, #0
	mov r2, #0x40
	bl memcpy
	lsl r0, r6, #1
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x10]
	add r1, r1, r0
	ldrb r0, [r2, r0]
	add r7, #0x40
	add r6, #0x20
	strb r0, [r5]
	ldrb r0, [r1, #1]
	strb r0, [r5, #1]
	ldrb r0, [r1, #2]
	strb r0, [r5, #2]
	ldrb r0, [r1, #3]
	strb r0, [r5, #3]
	ldrb r0, [r1, #4]
	strb r0, [r5, #4]
	ldrb r0, [r1, #5]
	strb r0, [r5, #5]
	ldr r0, [sp, #8]
	add r5, r5, #6
	add r0, #0x40
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #0x18
	blo _021E776C
	ldr r0, [sp, #0x14]
	bl FreeToHeap
	ldr r1, _021E78A4 ; =0x00001860
	ldr r0, [sp, #4]
	ldr r0, [r0, r1]
	cmp r0, #0
	bne _021E77E6
	mov r3, #0xf
	mov r7, #0
	lsl r3, r3, #0xc
	mov r5, #0x16
_021E77C4:
	add r0, r7, #0
	add r0, #0xf
	lsl r0, r0, #5
	mov r1, #0
	add r2, r0, #3
_021E77CE:
	lsl r0, r2, #1
	ldrh r6, [r4, r0]
	add r1, r1, #1
	add r2, r2, #1
	and r6, r3
	orr r6, r5
	strh r6, [r4, r0]
	cmp r1, #0x1a
	blo _021E77CE
	add r7, r7, #1
	cmp r7, #2
	blo _021E77C4
_021E77E6:
	ldr r1, _021E78A8 ; =0x00001858
	ldr r0, [sp, #4]
	ldrb r0, [r0, r1]
	cmp r0, #0
	bne _021E7844
	ldr r0, [sp, #4]
	mov r1, #2
	ldr r0, [r0, #8]
	bl sub_02019B08
	add r5, r0, #0
	ldr r0, [sp, #4]
	add r2, sp, #0x18
	ldr r0, [r0, #8]
	mov r1, #2
	add r2, #2
	add r3, sp, #0x18
	bl sub_02019B44
	add r6, sp, #0x18
	ldrh r0, [r6]
	mov r2, #0
	cmp r0, #0
	bls _021E7896
	add r7, r2, #0
_021E7818:
	ldrh r1, [r6, #2]
	add r3, r7, #0
	cmp r1, #0
	bls _021E783A
	add r0, r2, #3
	lsl r0, r0, #6
	add r0, r4, r0
_021E7826:
	mul r1, r2
	add r1, r3, r1
	lsl r1, r1, #1
	ldrh r1, [r5, r1]
	add r3, r3, #1
	strh r1, [r0, #0xa]
	ldrh r1, [r6, #2]
	add r0, r0, #2
	cmp r3, r1
	blo _021E7826
_021E783A:
	ldrh r0, [r6]
	add r2, r2, #1
	cmp r2, r0
	blo _021E7818
	b _021E7896
_021E7844:
	ldr r0, [sp, #4]
	mov r1, #3
	ldr r0, [r0, #8]
	bl sub_02019B08
	add r5, r0, #0
	ldr r0, [sp, #4]
	add r2, sp, #0x18
	ldr r0, [r0, #8]
	mov r1, #2
	add r2, #2
	add r3, sp, #0x18
	bl sub_02019B44
	add r6, sp, #0x18
	ldrh r0, [r6]
	mov r2, #0
	cmp r0, #0
	bls _021E7896
	add r7, r2, #0
_021E786C:
	ldrh r1, [r6, #2]
	add r3, r7, #0
	cmp r1, #0
	bls _021E788E
	add r0, r2, #3
	lsl r0, r0, #6
	add r0, r4, r0
_021E787A:
	mul r1, r2
	add r1, r3, r1
	lsl r1, r1, #1
	ldrh r1, [r5, r1]
	add r3, r3, #1
	strh r1, [r0, #0xa]
	ldrh r1, [r6, #2]
	add r0, r0, #2
	cmp r3, r1
	blo _021E787A
_021E788E:
	ldrh r0, [r6]
	add r2, r2, #1
	cmp r2, r0
	blo _021E786C
_021E7896:
	ldr r0, [sp, #4]
	bl ov18_021EFFEC
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E78A0: .word 0x00000854
_021E78A4: .word 0x00001860
_021E78A8: .word 0x00001858
	thumb_func_end ov18_021E7724

	thumb_func_start ov18_021E78AC
ov18_021E78AC: ; 0x021E78AC
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl ov18_021F8824
	add r6, r0, #0
	bne _021E7900
	add r0, r5, #0
	mov r1, #0x16
	mov r2, #0
	bl ov18_021F2A2C
	add r0, r5, #0
	mov r1, #0x18
	mov r2, #0
	bl ov18_021F2A84
	add r0, r5, #0
	mov r1, #0
	bl ov18_021F3B60
	add r0, r5, #0
	mov r1, #0
	mov r2, #0x5e
	bl ov18_021EE638
	add r0, r5, #0
	bl ov18_021F014C
	add r0, r5, #0
	mov r1, #1
	bl ov18_021F0118
	ldr r0, [r5, #4]
	mov r1, #5
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, _021E7A2C ; =0x00001898
	mov r1, #1
	add sp, #4
	str r1, [r5, r0]
	pop {r3, r4, r5, r6, pc}
_021E7900:
	add r0, r5, #0
	mov r1, #0
	bl ov18_021F0118
	add r0, r5, #0
	bl ov18_021F8838
	add r4, r0, #0
	ldr r2, _021E7A30 ; =0x0000185C
	add r0, r5, #0
	ldrb r2, [r5, r2]
	add r1, r4, #0
	bl ov18_021E6D10
	cmp r0, #0
	bne _021E7926
	ldr r0, _021E7A30 ; =0x0000185C
	mov r1, #2
	strb r1, [r5, r0]
_021E7926:
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x5e
	bl ov18_021EE638
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov18_021EE6EC
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov18_021EED70
	ldr r0, [r5, #4]
	mov r1, #7
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #4]
	mov r1, #5
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, _021E7A2C ; =0x00001898
	mov r1, #2
	str r1, [r5, r0]
	add r0, r5, #0
	mov r1, #1
	bl ov18_021F3B60
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x2e
	mov r3, #0x2d
	bl ov18_021F1CAC
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x18
	bl ov18_021F24E0
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x35
	bl ov18_021F2530
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #0x31
	bl ov18_021F209C
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #0x30
	bl ov18_021F1DE4
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0x2c
	bl ov18_021F2EC8
	cmp r4, #0
	bne _021E79E0
	add r0, r5, #0
	mov r1, #0x16
	mov r2, #0
	bl ov18_021F2A2C
	add r0, r5, #0
	mov r1, #0x18
	mov r2, #0
	bl ov18_021F2A84
	ldr r2, _021E7A34 ; =0x00000854
	ldr r0, [r5, #4]
	ldr r2, [r5, r2]
	mov r1, #7
	mov r3, #0x25
	bl ov18_021E6FB8
	ldr r0, _021E7A38 ; =0x0000051C
	add r0, r5, r0
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r5, #0
	mov r1, #0x2d
	mov r2, #0
	bl ov18_021F11C0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_021E79E0:
	add r0, r5, #0
	add r1, r4, #0
	bl ov18_021E6D38
	cmp r0, #1
	bne _021E79F8
	add r0, r5, #0
	mov r1, #0x16
	mov r2, #1
	bl ov18_021F2A2C
	b _021E7A02
_021E79F8:
	add r0, r5, #0
	mov r1, #0x16
	mov r2, #0
	bl ov18_021F2A2C
_021E7A02:
	add r0, r5, #0
	mov r1, #0x18
	mov r2, #1
	bl ov18_021F2A84
	mov r0, #0x25
	str r0, [sp]
	ldr r2, _021E7A30 ; =0x0000185C
	ldr r3, _021E7A34 ; =0x00000854
	ldrb r2, [r5, r2]
	ldr r0, [r5, #4]
	ldr r3, [r5, r3]
	mov r1, #7
	bl ov18_021E6F6C
	ldr r0, _021E7A38 ; =0x0000051C
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021E7A2C: .word 0x00001898
_021E7A30: .word 0x0000185C
_021E7A34: .word 0x00000854
_021E7A38: .word 0x0000051C
	thumb_func_end ov18_021E78AC

	thumb_func_start ov18_021E7A3C
ov18_021E7A3C: ; 0x021E7A3C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E7A7C ; =0x00001898
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E7A7A
	cmp r0, #1
	beq _021E7A52
	cmp r0, #2
	beq _021E7A64
	b _021E7A74
_021E7A52:
	mov r0, #6
	mov r1, #2
	bl SetBgPriority
	mov r0, #7
	mov r1, #3
	bl SetBgPriority
	b _021E7A74
_021E7A64:
	mov r0, #6
	mov r1, #3
	bl SetBgPriority
	mov r0, #7
	mov r1, #2
	bl SetBgPriority
_021E7A74:
	ldr r0, _021E7A7C ; =0x00001898
	mov r1, #0
	str r1, [r4, r0]
_021E7A7A:
	pop {r4, pc}
	.balign 4, 0
_021E7A7C: .word 0x00001898
	thumb_func_end ov18_021E7A3C

	thumb_func_start ov18_021E7A80
ov18_021E7A80: ; 0x021E7A80
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r1, [sp, #4]
	add r6, r0, #0
	str r2, [sp, #8]
	ldr r0, [r6]
	ldr r0, [r0]
	bl Pokedex_GetInternationalViewFlag
	cmp r0, #0
	beq _021E7B5C
	add r0, r6, #0
	bl ov18_021F8824
	str r0, [sp, #0xc]
	cmp r0, #0
	beq _021E7B5C
	ldr r0, _021E7B60 ; =0x0000185C
	ldrb r0, [r6, r0]
	bl LanguageToDexFlag
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	mov r7, #0
_021E7AB0:
	ldr r0, [sp, #8]
	add r0, r4, r0
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	bpl _021E7ABE
	mov r4, #5
	b _021E7AC4
_021E7ABE:
	cmp r4, #6
	blt _021E7AC4
	mov r4, #0
_021E7AC4:
	add r0, r4, #0
	bl sub_02091294
	lsl r0, r0, #0x10
	asr r5, r0, #0x10
	ldr r0, _021E7B60 ; =0x0000185C
	ldrb r0, [r6, r0]
	cmp r5, r0
	beq _021E7B5C
	lsl r2, r5, #0x10
	ldr r1, [sp, #4]
	add r0, r6, #0
	lsr r2, r2, #0x10
	bl ov18_021E6D10
	cmp r0, #1
	beq _021E7AEA
	cmp r5, #2
	bne _021E7B56
_021E7AEA:
	ldr r0, _021E7B60 ; =0x0000185C
	mov r2, #0x5e
	strb r5, [r6, r0]
	ldr r1, [sp, #4]
	add r0, r6, #0
	bl ov18_021EE638
	mov r0, #0x25
	str r0, [sp]
	ldr r2, _021E7B60 ; =0x0000185C
	ldr r3, _021E7B64 ; =0x00000854
	ldrb r2, [r6, r2]
	ldr r0, [r6, #4]
	ldr r3, [r6, r3]
	mov r1, #7
	bl ov18_021E6F6C
	ldr r1, [sp, #4]
	ldr r2, [sp, #0xc]
	add r0, r6, #0
	bl ov18_021EED70
	ldr r1, [sp, #4]
	add r0, r6, #0
	mov r2, #0x18
	bl ov18_021F24E0
	ldr r1, [sp, #4]
	add r0, r6, #0
	mov r2, #0x35
	bl ov18_021F2530
	ldr r1, [sp, #4]
	ldr r2, [sp, #0xc]
	add r0, r6, #0
	mov r3, #0x31
	bl ov18_021F209C
	ldr r1, [sp, #4]
	ldr r2, [sp, #0xc]
	add r0, r6, #0
	mov r3, #0x30
	bl ov18_021F1DE4
	ldr r1, [sp, #0xc]
	add r0, r6, #0
	mov r2, #0x2c
	bl ov18_021F2EC8
	ldr r0, _021E7B68 ; =0x000008E8
	bl PlaySE
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_021E7B56:
	add r7, r7, #1
	cmp r7, #6
	blo _021E7AB0
_021E7B5C:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E7B60: .word 0x0000185C
_021E7B64: .word 0x00000854
_021E7B68: .word 0x000008E8
	thumb_func_end ov18_021E7A80

	thumb_func_start ov18_021E7B6C
ov18_021E7B6C: ; 0x021E7B6C
	push {r4, r5}
	cmp r0, #1
	bne _021E7BB6
	ldr r0, _021E7BC4 ; =0x04001000
	ldr r1, _021E7BC8 ; =0xFFFF1FFF
	ldr r2, [r0]
	add r4, r0, #0
	and r2, r1
	lsr r1, r0, #0xd
	orr r1, r2
	str r1, [r0]
	add r4, #0x48
	ldrh r3, [r4]
	mov r2, #0x3f
	mov r1, #0xf
	bic r3, r2
	orr r1, r3
	mov r3, #0x20
	orr r1, r3
	strh r1, [r4]
	add r4, r0, #0
	add r4, #0x4a
	ldrh r5, [r4]
	mov r1, #0x1f
	bic r5, r2
	orr r1, r5
	orr r1, r3
	strh r1, [r4]
	add r1, r0, #0
	mov r2, #0xff
	add r1, #0x40
	strh r2, [r1]
	ldr r1, _021E7BCC ; =0x000098C0
	add r0, #0x44
	strh r1, [r0]
	pop {r4, r5}
	bx lr
_021E7BB6:
	ldr r2, _021E7BC4 ; =0x04001000
	ldr r0, _021E7BC8 ; =0xFFFF1FFF
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	pop {r4, r5}
	bx lr
	.balign 4, 0
_021E7BC4: .word 0x04001000
_021E7BC8: .word 0xFFFF1FFF
_021E7BCC: .word 0x000098C0
	thumb_func_end ov18_021E7B6C

	thumb_func_start ov18_021E7BD0
ov18_021E7BD0: ; 0x021E7BD0
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r1, #0
	bl ov18_021E613C
	add r0, r4, #0
	mov r1, #2
	bl ov18_021E613C
	add r0, r4, #0
	mov r1, #5
	bl ov18_021E613C
	add r0, r4, #0
	mov r1, #6
	bl ov18_021E613C
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E7D88 ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x52
	mov r3, #3
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldr r0, _021E7D8C ; =0x00001860
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _021E7C34
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E7D88 ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x51
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	b _021E7C4E
_021E7C34:
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E7D88 ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x50
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
_021E7C4E:
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E7D88 ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x53
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E7D88 ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x53
	mov r3, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E7D88 ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #4
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	mov r1, #0x85
	str r0, [sp, #4]
	lsl r1, r1, #4
	str r0, [sp, #8]
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #2
	mov r3, #0x25
	bl sub_02003284
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E7D88 ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x54
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E7D88 ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x55
	mov r3, #7
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E7D88 ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x56
	mov r3, #4
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E7D88 ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x57
	mov r3, #4
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	mov r1, #0x85
	str r0, [sp, #4]
	lsl r1, r1, #4
	str r0, [sp, #8]
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #0x12
	mov r3, #0x25
	bl sub_02003284
	ldr r0, [r4, #4]
	mov r1, #0
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #4]
	mov r1, #1
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #4]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #4]
	mov r1, #3
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #4]
	mov r1, #4
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #4]
	mov r1, #5
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #4]
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #4]
	mov r1, #7
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_021E7D88: .word 0x00000854
_021E7D8C: .word 0x00001860
	thumb_func_end ov18_021E7BD0

	thumb_func_start ov18_021E7D90
ov18_021E7D90: ; 0x021E7D90
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r1, #0
	bl ov18_021E613C
	add r0, r4, #0
	mov r1, #1
	bl ov18_021E613C
	add r0, r4, #0
	mov r1, #2
	bl ov18_021E613C
	add r0, r4, #0
	mov r1, #4
	bl ov18_021E613C
	add r0, r4, #0
	mov r1, #5
	bl ov18_021E613C
	add r0, r4, #0
	mov r1, #7
	bl ov18_021E613C
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E7ED4 ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x59
	mov r3, #3
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E7ED4 ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x5a
	mov r3, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E7ED4 ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #4
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	mov r1, #0x85
	str r0, [sp, #4]
	lsl r1, r1, #4
	str r0, [sp, #8]
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #2
	mov r3, #0x25
	bl sub_02003284
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E7ED4 ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x5b
	mov r3, #6
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E7ED4 ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x5c
	mov r3, #6
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	mov r1, #0x85
	str r0, [sp, #4]
	lsl r1, r1, #4
	str r0, [sp, #8]
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #0x12
	mov r3, #0x25
	bl sub_02003284
	ldr r0, [r4, #8]
	mov r1, #0x10
	mov r2, #0
	mov r3, #0x14
	bl sub_020196E8
	ldr r0, [r4, #4]
	mov r1, #0
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #4]
	mov r1, #1
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #4]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #4]
	mov r1, #3
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #4]
	mov r1, #4
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #4]
	mov r1, #5
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #4]
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #4]
	mov r1, #7
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_021E7ED4: .word 0x00000854
	thumb_func_end ov18_021E7D90

	thumb_func_start ov18_021E7ED8
ov18_021E7ED8: ; 0x021E7ED8
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r1, #0
	bl ov18_021E613C
	add r0, r4, #0
	mov r1, #2
	bl ov18_021E613C
	add r0, r4, #0
	mov r1, #4
	bl ov18_021E613C
	add r0, r4, #0
	mov r1, #5
	bl ov18_021E613C
	add r0, r4, #0
	mov r1, #7
	bl ov18_021E613C
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E8008 ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x65
	mov r3, #3
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E8008 ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x66
	mov r3, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E8008 ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #4
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	mov r1, #0x85
	str r0, [sp, #4]
	lsl r1, r1, #4
	str r0, [sp, #8]
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #2
	mov r3, #0x25
	bl sub_02003284
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E8008 ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x67
	mov r3, #6
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E8008 ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x68
	mov r3, #6
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	mov r1, #0x85
	str r0, [sp, #4]
	lsl r1, r1, #4
	str r0, [sp, #8]
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #0x12
	mov r3, #0x25
	bl sub_02003284
	ldr r0, [r4, #4]
	mov r1, #0
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #4]
	mov r1, #1
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #4]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #4]
	mov r1, #3
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #4]
	mov r1, #4
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #4]
	mov r1, #5
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #4]
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #4]
	mov r1, #7
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_021E8008: .word 0x00000854
	thumb_func_end ov18_021E7ED8

	thumb_func_start ov18_021E800C
ov18_021E800C: ; 0x021E800C
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r1, #2
	bl ov18_021E613C
	add r0, r5, #0
	mov r1, #4
	bl ov18_021E613C
	add r0, r5, #0
	mov r1, #5
	bl ov18_021E613C
	add r0, r5, #0
	mov r1, #6
	bl ov18_021E613C
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E81A0 ; =0x00000854
	ldr r2, [r5, #4]
	ldr r0, [r5, r0]
	mov r1, #0x60
	mov r3, #3
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E81A0 ; =0x00000854
	ldr r2, [r5, #4]
	ldr r0, [r5, r0]
	mov r1, #0x5d
	mov r3, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E81A0 ; =0x00000854
	ldr r2, [r5, #4]
	ldr r0, [r5, r0]
	mov r1, #0x5f
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E81A0 ; =0x00000854
	ldr r2, [r5, #4]
	ldr r0, [r5, r0]
	mov r1, #0x5d
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E81A0 ; =0x00000854
	ldr r2, [r5, #4]
	ldr r0, [r5, r0]
	mov r1, #4
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	mov r1, #0x85
	str r0, [sp, #4]
	lsl r1, r1, #4
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #2
	mov r3, #0x25
	bl sub_02003284
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E81A0 ; =0x00000854
	ldr r2, [r5, #4]
	ldr r0, [r5, r0]
	mov r1, #0x61
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E81A0 ; =0x00000854
	ldr r2, [r5, #4]
	ldr r0, [r5, r0]
	mov r1, #0x5e
	mov r3, #7
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	mov r1, #0x85
	str r0, [sp, #4]
	lsl r1, r1, #4
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0x12
	mov r3, #0x25
	bl sub_02003284
	ldr r0, _021E81A4 ; =0x000018C4
	ldrsb r0, [r5, r0]
	cmp r0, #1
	bne _021E815C
	mov r0, #0x25
	str r0, [sp]
	ldr r0, _021E81A0 ; =0x00000854
	mov r1, #0x64
	ldr r0, [r5, r0]
	mov r2, #1
	add r3, sp, #0x10
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	mov r3, #0x10
	str r3, [sp]
	add r4, r0, #0
	str r3, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	ldr r2, [sp, #0x10]
	ldr r0, [r5, #4]
	mov r1, #0
	add r2, #0xc
	bl LoadRectToBgTilemapRect
	add r0, r4, #0
	bl FreeToHeap
_021E815C:
	ldr r0, [r5, #4]
	mov r1, #0
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #4]
	mov r1, #1
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #4]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #4]
	mov r1, #3
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #4]
	mov r1, #4
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #4]
	mov r1, #5
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #4]
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #4]
	mov r1, #7
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x14
	pop {r4, r5, pc}
	.balign 4, 0
_021E81A0: .word 0x00000854
_021E81A4: .word 0x000018C4
	thumb_func_end ov18_021E800C

	thumb_func_start ov18_021E81A8
ov18_021E81A8: ; 0x021E81A8
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r1, #0
	bl ov18_021E613C
	add r0, r4, #0
	mov r1, #2
	bl ov18_021E613C
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E8250 ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x62
	mov r3, #3
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E8250 ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x5d
	mov r3, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E8250 ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x63
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021E8250 ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x5e
	mov r3, #7
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	ldr r0, [r4, #4]
	mov r1, #0
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #4]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #4]
	mov r1, #3
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #4]
	mov r1, #7
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_021E8250: .word 0x00000854
	thumb_func_end ov18_021E81A8

	thumb_func_start ov18_021E8254
ov18_021E8254: ; 0x021E8254
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _021E83BC ; =0x000018A4
	mov r1, #0
	add r0, r5, r0
	mov r2, #0x20
	bl memset
	ldr r0, _021E83C0 ; =0x000018A2
	ldr r2, _021E83C4 ; =0x0000019D
	ldrh r1, [r5, r0]
	cmp r1, r2
	bgt _021E82A4
	sub r3, r2, #1
	cmp r1, r3
	blt _021E8280
	add r0, r3, #0
	cmp r1, r0
	beq _021E82FA
	cmp r1, r2
	beq _021E82FA
	b _021E838C
_021E8280:
	cmp r1, #0xc9
	bgt _021E828C
	bge _021E82FA
	cmp r1, #0xac
	beq _021E82FA
	b _021E838C
_021E828C:
	add r3, r2, #0
	sub r3, #0x3e
	cmp r1, r3
	bgt _021E829C
	sub r2, #0x3e
	cmp r1, r2
	beq _021E8334
	b _021E838C
_021E829C:
	sub r2, #0x1b
	cmp r1, r2
	beq _021E82FA
	b _021E838C
_021E82A4:
	add r3, r2, #0
	add r3, #0x42
	cmp r1, r3
	bgt _021E82E4
	add r3, r2, #0
	add r3, #0x42
	cmp r1, r3
	bge _021E82FA
	add r3, r2, #0
	add r3, #8
	cmp r1, r3
	bgt _021E82C4
	add r2, #8
	cmp r1, r2
	beq _021E8360
	b _021E838C
_021E82C4:
	add r0, r2, #0
	add r0, #0xa
	cmp r1, r0
	bgt _021E838C
	add r0, r2, #0
	add r0, #9
	cmp r1, r0
	blt _021E838C
	add r0, r2, #0
	add r0, #9
	cmp r1, r0
	beq _021E82FA
	add r2, #0xa
	cmp r1, r2
	beq _021E82FA
	b _021E838C
_021E82E4:
	add r0, r2, #0
	add r0, #0x4a
	cmp r1, r0
	bgt _021E82F4
	add r2, #0x4a
	cmp r1, r2
	beq _021E82FA
	b _021E838C
_021E82F4:
	add r2, #0x4f
	cmp r1, r2
	bne _021E838C
_021E82FA:
	ldr r0, [r5]
	ldr r0, [r0]
	bl Pokedex_GetSeenFormeNum
	ldr r1, _021E83C8 ; =0x000018C4
	mov r4, #0
	strb r0, [r5, r1]
	ldrsb r0, [r5, r1]
	cmp r0, #0
	bls _021E83B8
	add r7, r1, #0
	sub r7, #0x20
	add r6, r1, #0
_021E8314:
	ldr r1, _021E83C0 ; =0x000018A2
	ldr r0, [r5]
	ldrh r1, [r5, r1]
	ldr r0, [r0]
	add r2, r4, #0
	bl Pokedex_GetSeenFormeByIdx
	mov r1, #0x80
	orr r1, r0
	add r0, r5, r4
	strb r1, [r0, r7]
	ldrsb r0, [r5, r6]
	add r4, r4, #1
	cmp r4, r0
	blo _021E8314
	pop {r3, r4, r5, r6, r7, pc}
_021E8334:
	add r1, r0, #0
	mov r2, #4
	add r1, #0x22
	strb r2, [r5, r1]
	add r0, #0x22
	ldrsb r0, [r5, r0]
	mov r1, #0
	cmp r0, #0
	bls _021E83B8
	ldr r2, _021E83BC ; =0x000018A4
	mov r0, #0x80
	add r3, r2, #0
	add r3, #0x20
_021E834E:
	add r6, r1, #0
	add r4, r5, r1
	orr r6, r0
	strb r6, [r4, r2]
	ldrsb r4, [r5, r3]
	add r1, r1, #1
	cmp r1, r4
	blo _021E834E
	pop {r3, r4, r5, r6, r7, pc}
_021E8360:
	add r1, r0, #0
	mov r2, #2
	add r1, #0x22
	strb r2, [r5, r1]
	add r0, #0x22
	ldrsb r0, [r5, r0]
	mov r1, #0
	cmp r0, #0
	bls _021E83B8
	ldr r2, _021E83BC ; =0x000018A4
	mov r0, #0x80
	add r3, r2, #0
	add r3, #0x20
_021E837A:
	add r6, r1, #0
	add r4, r5, r1
	orr r6, r0
	strb r6, [r4, r2]
	ldrsb r4, [r5, r3]
	add r1, r1, #1
	cmp r1, r4
	blo _021E837A
	pop {r3, r4, r5, r6, r7, pc}
_021E838C:
	add r0, r5, #0
	mov r1, #0
	bl ov18_021E83D0
	ldr r1, _021E83BC ; =0x000018A4
	strb r0, [r5, r1]
	add r0, r5, #0
	mov r1, #1
	bl ov18_021E83D0
	ldr r1, _021E83CC ; =0x000018A5
	strb r0, [r5, r1]
	ldrb r0, [r5, r1]
	cmp r0, #0
	bne _021E83B2
	mov r0, #1
	add r1, #0x1f
	strb r0, [r5, r1]
	pop {r3, r4, r5, r6, r7, pc}
_021E83B2:
	mov r0, #2
	add r1, #0x1f
	strb r0, [r5, r1]
_021E83B8:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E83BC: .word 0x000018A4
_021E83C0: .word 0x000018A2
_021E83C4: .word 0x0000019D
_021E83C8: .word 0x000018C4
_021E83CC: .word 0x000018A5
	thumb_func_end ov18_021E8254

	thumb_func_start ov18_021E83D0
ov18_021E83D0: ; 0x021E83D0
	push {r4, lr}
	add r2, r0, #0
	add r4, r1, #0
	ldr r1, _021E840C ; =0x000018A2
	ldr r0, [r2]
	ldrh r1, [r2, r1]
	ldr r0, [r0]
	add r2, r4, #0
	bl Pokedex_SpeciesGetLastSeenGender
	cmp r0, #0
	beq _021E83F2
	cmp r0, #1
	beq _021E83F6
	cmp r0, #2
	beq _021E83FA
	b _021E83FE
_021E83F2:
	mov r0, #1
	pop {r4, pc}
_021E83F6:
	mov r0, #2
	pop {r4, pc}
_021E83FA:
	mov r0, #3
	pop {r4, pc}
_021E83FE:
	cmp r4, #0
	bne _021E8406
	mov r0, #3
	pop {r4, pc}
_021E8406:
	mov r0, #0
	pop {r4, pc}
	nop
_021E840C: .word 0x000018A2
	thumb_func_end ov18_021E83D0

	thumb_func_start ov18_021E8410
ov18_021E8410: ; 0x021E8410
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r0, #0
	ldr r0, _021E84E0 ; =0x000018CC
	add r5, r6, r0
	bl GetDexZknDataNarcID
	mov r1, #0x25
	bl NARC_ctor
	add r4, r0, #0
	ldr r0, [r6]
	ldr r0, [r0, #4]
	bl PlayerProfile_GetTrainerGender
	cmp r0, #0
	bne _021E8472
	mov r2, #0
	str r2, [sp]
	add r0, r4, #0
	mov r1, #9
	mov r3, #0x25
	bl GfGfxLoader_LoadFromOpenNarc
	str r0, [r5]
	mov r2, #0
	str r2, [sp]
	add r0, r4, #0
	mov r1, #5
	mov r3, #0x25
	bl GfGfxLoader_LoadFromOpenNarc
	str r0, [r5, #4]
	mov r2, #0
	str r2, [sp]
	add r0, r4, #0
	mov r1, #0xa
	mov r3, #0x25
	bl GfGfxLoader_LoadFromOpenNarc
	str r0, [r5, #8]
	mov r2, #0
	add r0, r4, #0
	mov r1, #6
	mov r3, #0x25
	str r2, [sp]
	bl GfGfxLoader_LoadFromOpenNarc
	b _021E84B0
_021E8472:
	mov r2, #0
	str r2, [sp]
	add r0, r4, #0
	mov r1, #7
	mov r3, #0x25
	bl GfGfxLoader_LoadFromOpenNarc
	str r0, [r5]
	mov r2, #0
	str r2, [sp]
	add r0, r4, #0
	mov r1, #3
	mov r3, #0x25
	bl GfGfxLoader_LoadFromOpenNarc
	str r0, [r5, #4]
	mov r2, #0
	str r2, [sp]
	add r0, r4, #0
	mov r1, #8
	mov r3, #0x25
	bl GfGfxLoader_LoadFromOpenNarc
	str r0, [r5, #8]
	mov r2, #0
	add r0, r4, #0
	mov r1, #4
	mov r3, #0x25
	str r2, [sp]
	bl GfGfxLoader_LoadFromOpenNarc
_021E84B0:
	mov r1, #0
	str r0, [r5, #0xc]
	add r0, r4, #0
	add r2, r1, #0
	mov r3, #0x25
	str r1, [sp]
	bl GfGfxLoader_LoadFromOpenNarc
	ldr r1, _021E84E4 ; =0x00001848
	mov r2, #0
	str r0, [r6, r1]
	add r0, r4, #0
	mov r1, #1
	mov r3, #0x25
	str r2, [sp]
	bl GfGfxLoader_LoadFromOpenNarc
	ldr r1, _021E84E8 ; =0x0000184C
	str r0, [r6, r1]
	add r0, r4, #0
	bl NARC_dtor
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021E84E0: .word 0x000018CC
_021E84E4: .word 0x00001848
_021E84E8: .word 0x0000184C
	thumb_func_end ov18_021E8410

	thumb_func_start ov18_021E84EC
ov18_021E84EC: ; 0x021E84EC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021E8520 ; =0x000018CC
	add r4, r5, r0
	sub r0, #0x84
	ldr r0, [r5, r0]
	bl FreeToHeap
	ldr r0, _021E8524 ; =0x0000184C
	ldr r0, [r5, r0]
	bl FreeToHeap
	ldr r0, _021E8520 ; =0x000018CC
	ldr r0, [r5, r0]
	bl FreeToHeap
	ldr r0, [r4, #4]
	bl FreeToHeap
	ldr r0, [r4, #8]
	bl FreeToHeap
	ldr r0, [r4, #0xc]
	bl FreeToHeap
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E8520: .word 0x000018CC
_021E8524: .word 0x0000184C
	thumb_func_end ov18_021E84EC

	thumb_func_start ov18_021E8528
ov18_021E8528: ; 0x021E8528
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r1, #0
	ldr r1, _021E862C ; =0x000018DC
	add r5, r0, #0
	add r0, r5, r1
	sub r1, #0x3a
	add r4, r2, #0
	ldrh r1, [r5, r1]
	add r2, r6, #4
	bl ov18_021E8698
	ldr r1, _021E8630 ; =0x000018E4
	mov r2, #7
	add r0, r5, r1
	sub r1, #0x42
	ldrh r1, [r5, r1]
	bl ov18_021E8698
	ldr r1, _021E8634 ; =0x000018EC
	add r2, r6, #0
	add r0, r5, r1
	sub r1, #0x4a
	ldrh r1, [r5, r1]
	bl ov18_021E8698
	ldr r1, _021E8638 ; =0x000018F4
	mov r2, #3
	add r0, r5, r1
	sub r1, #0x52
	ldrh r1, [r5, r1]
	bl ov18_021E8698
	ldr r1, _021E863C ; =0x000018E0
	mov r2, #1
	ldr r0, [r5, r1]
	sub r0, r0, #1
	add r2, r2, r0
	add r0, r1, #0
	add r0, #8
	ldr r0, [r5, r0]
	sub r0, r0, #1
	add r2, r2, r0
	add r0, r1, #0
	add r0, #0x10
	ldr r0, [r5, r0]
	add r1, #0x18
	sub r0, r0, #1
	add r2, r2, r0
	ldr r0, [r5, r1]
	sub r0, r0, #1
	add r0, r2, r0
	lsl r6, r0, #2
	mov r0, #0x25
	add r1, r6, #0
	bl AllocFromHeap
	ldr r1, _021E8640 ; =0x000018FC
	str r0, [r5, r1]
	mov r0, #0x25
	add r1, r6, #0
	bl AllocFromHeap
	ldr r1, _021E8644 ; =0x00001904
	add r2, r6, #0
	str r0, [r5, r1]
	sub r1, #8
	ldr r1, [r5, r1]
	mov r0, #0
	bl MIi_CpuClear32
	ldr r1, _021E8644 ; =0x00001904
	mov r0, #0
	ldr r1, [r5, r1]
	add r2, r6, #0
	bl MIi_CpuClear32
	ldr r1, _021E8640 ; =0x000018FC
	mov r2, #1
	ldr r0, [r5, r1]
	mvn r2, r2
	str r2, [r0]
	mov r2, #1
	add r0, r1, #4
	str r2, [r5, r0]
	add r0, r1, #0
	add r0, #8
	sub r1, #0x20
	ldr r0, [r5, r0]
	mov r3, #0
	str r3, [r0]
	add r0, r5, #0
	add r1, r5, r1
	add r2, r4, #0
	bl ov18_021E8714
	ldr r1, _021E8630 ; =0x000018E4
	add r0, r5, #0
	add r1, r5, r1
	add r2, r4, #0
	mov r3, #1
	bl ov18_021E8714
	mov r1, #0x19
	lsl r1, r1, #8
	ldr r6, [r5, r1]
	mov r0, #0
	sub r1, #0x14
	str r0, [sp]
	add r0, r5, #0
	add r1, r5, r1
	add r2, r4, #0
	add r3, r6, #0
	bl ov18_021E8878
	ldr r1, _021E8638 ; =0x000018F4
	mov r0, #1
	str r0, [sp]
	add r0, r5, #0
	add r1, r5, r1
	add r2, r4, #0
	add r3, r6, #0
	bl ov18_021E8878
	add r0, r5, #0
	bl ov18_021E8A00
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_021E862C: .word 0x000018DC
_021E8630: .word 0x000018E4
_021E8634: .word 0x000018EC
_021E8638: .word 0x000018F4
_021E863C: .word 0x000018E0
_021E8640: .word 0x000018FC
_021E8644: .word 0x00001904
	thumb_func_end ov18_021E8528

	thumb_func_start ov18_021E8648
ov18_021E8648: ; 0x021E8648
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E8680 ; =0x000018DC
	ldr r0, [r4, r0]
	bl FreeToHeap
	ldr r0, _021E8684 ; =0x000018E4
	ldr r0, [r4, r0]
	bl FreeToHeap
	ldr r0, _021E8688 ; =0x000018EC
	ldr r0, [r4, r0]
	bl FreeToHeap
	ldr r0, _021E868C ; =0x000018F4
	ldr r0, [r4, r0]
	bl FreeToHeap
	ldr r0, _021E8690 ; =0x000018FC
	ldr r0, [r4, r0]
	bl FreeToHeap
	ldr r0, _021E8694 ; =0x00001904
	ldr r0, [r4, r0]
	bl FreeToHeap
	pop {r4, pc}
	nop
_021E8680: .word 0x000018DC
_021E8684: .word 0x000018E4
_021E8688: .word 0x000018EC
_021E868C: .word 0x000018F4
_021E8690: .word 0x000018FC
_021E8694: .word 0x00001904
	thumb_func_end ov18_021E8648

	thumb_func_start ov18_021E8698
ov18_021E8698: ; 0x021E8698
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	cmp r2, #7
	bhi _021E86DE
	add r0, r2, r2
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E86AE: ; jump table
	.short _021E86BE - _021E86AE - 2 ; case 0
	.short _021E86C2 - _021E86AE - 2 ; case 1
	.short _021E86C6 - _021E86AE - 2 ; case 2
	.short _021E86CC - _021E86AE - 2 ; case 3
	.short _021E86D0 - _021E86AE - 2 ; case 4
	.short _021E86D4 - _021E86AE - 2 ; case 5
	.short _021E86D8 - _021E86AE - 2 ; case 6
	.short _021E86DC - _021E86AE - 2 ; case 7
_021E86BE:
	mov r3, #2
	b _021E86DE
_021E86C2:
	ldr r3, _021E86FC ; =0x000001F1
	b _021E86DE
_021E86C6:
	mov r3, #0x3e
	lsl r3, r3, #4
	b _021E86DE
_021E86CC:
	ldr r3, _021E8700 ; =0x00000B9C
	b _021E86DE
_021E86D0:
	ldr r3, _021E8704 ; =0x000005CF
	b _021E86DE
_021E86D4:
	ldr r3, _021E8708 ; =0x000007BE
	b _021E86DE
_021E86D8:
	ldr r3, _021E870C ; =0x000009AD
	b _021E86DE
_021E86DC:
	ldr r3, _021E8710 ; =0x00000D8B
_021E86DE:
	mov r2, #0
	str r2, [sp]
	add r0, sp, #8
	str r0, [sp, #4]
	add r1, r3, r1
	mov r0, #0x85
	mov r3, #0x25
	bl GfGfxLoader_LoadFromNarc_GetSizeOut
	str r0, [r4]
	ldr r0, [sp, #8]
	lsr r0, r0, #2
	str r0, [r4, #4]
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_021E86FC: .word 0x000001F1
_021E8700: .word 0x00000B9C
_021E8704: .word 0x000005CF
_021E8708: .word 0x000007BE
_021E870C: .word 0x000009AD
_021E8710: .word 0x00000D8B
	thumb_func_end ov18_021E8698

	thumb_func_start ov18_021E8714
ov18_021E8714: ; 0x021E8714
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	str r1, [sp]
	cmp r2, #0
	bne _021E87BE
	add r0, r1, #0
	ldr r0, [r0, #4]
	mov r7, #0
	sub r0, r0, #1
	cmp r0, #0
	bgt _021E872E
	b _021E886C
_021E872E:
	mov r0, #1
	lsl r0, r3
	mov ip, r0
_021E8734:
	ldr r0, [sp]
	ldr r2, [r0]
	lsl r0, r7, #2
	str r0, [sp, #4]
	ldr r3, [sp, #4]
	ldr r0, _021E8870 ; =0x0000190C
	ldr r2, [r2, r3]
	mov r3, #0x24
	ldr r1, [r4, r0]
	mul r3, r2
	ldrb r1, [r1, r3]
	cmp r1, #0x16
	bhs _021E87AA
	add r3, r0, #0
	sub r3, #0xc
	ldr r5, [r4, r3]
	mov r1, #0
	cmp r5, #0
	ble _021E877E
	sub r0, #0x10
	ldr r3, [r4, r0]
_021E875E:
	lsl r6, r1, #2
	ldr r0, [r3, r6]
	cmp r0, r2
	bne _021E8774
	ldr r0, _021E8874 ; =0x00001904
	ldr r3, [r4, r0]
	mov r0, ip
	ldr r2, [r3, r6]
	orr r0, r2
	str r0, [r3, r6]
	b _021E877E
_021E8774:
	add r0, r1, #1
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	cmp r1, r5
	blt _021E875E
_021E877E:
	mov r2, #0x19
	lsl r2, r2, #8
	ldr r0, [r4, r2]
	cmp r1, r0
	bne _021E87AA
	ldr r1, [sp]
	lsl r0, r0, #2
	ldr r3, [r1]
	ldr r1, [sp, #4]
	ldr r3, [r3, r1]
	sub r1, r2, #4
	ldr r1, [r4, r1]
	str r3, [r1, r0]
	add r0, r2, #4
	ldr r1, [r4, r2]
	ldr r0, [r4, r0]
	lsl r3, r1, #2
	mov r1, ip
	str r1, [r0, r3]
	ldr r0, [r4, r2]
	add r0, r0, #1
	str r0, [r4, r2]
_021E87AA:
	add r0, r7, #1
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	ldr r0, [sp]
	ldr r0, [r0, #4]
	sub r0, r0, #1
	cmp r7, r0
	blt _021E8734
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_021E87BE:
	add r0, r1, #0
	ldr r0, [r0, #4]
	mov r7, #0
	sub r0, r0, #1
	cmp r0, #0
	ble _021E886C
	mov r0, #1
	lsl r0, r3
	str r0, [sp, #8]
_021E87D0:
	ldr r0, [sp]
	ldr r1, [r0]
	lsl r0, r7, #2
	ldr r5, [r1, r0]
	ldr r0, _021E8870 ; =0x0000190C
	ldr r1, [r4, r0]
	mov r0, #0x24
	mul r0, r5
	ldrb r0, [r1, r0]
	cmp r0, #0x16
	blo _021E885C
	add r0, r5, #0
	bl ov18_021E8B24
	cmp r0, #1
	bne _021E87F8
	bl ov18_021E8B40
	add r5, r0, #0
	b _021E8808
_021E87F8:
	add r0, r5, #0
	bl ov18_021E8B5C
	cmp r0, #1
	bne _021E8808
	bl ov18_021E8B78
	add r5, r0, #0
_021E8808:
	mov r0, #0x19
	lsl r0, r0, #8
	ldr r3, [r4, r0]
	mov r6, #0
	cmp r3, #0
	ble _021E8838
	sub r0, r0, #4
	ldr r2, [r4, r0]
_021E8818:
	lsl r1, r6, #2
	ldr r0, [r2, r1]
	cmp r5, r0
	bne _021E882E
	ldr r0, _021E8874 ; =0x00001904
	ldr r3, [r4, r0]
	ldr r0, [sp, #8]
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	b _021E8838
_021E882E:
	add r0, r6, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	cmp r6, r3
	blt _021E8818
_021E8838:
	mov r0, #0x19
	lsl r0, r0, #8
	ldr r1, [r4, r0]
	cmp r6, r1
	bne _021E885C
	sub r2, r0, #4
	ldr r2, [r4, r2]
	lsl r1, r1, #2
	str r5, [r2, r1]
	add r1, r0, #4
	ldr r3, [r4, r1]
	ldr r1, [r4, r0]
	lsl r2, r1, #2
	ldr r1, [sp, #8]
	str r1, [r3, r2]
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
_021E885C:
	add r0, r7, #1
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	ldr r0, [sp]
	ldr r0, [r0, #4]
	sub r0, r0, #1
	cmp r7, r0
	blt _021E87D0
_021E886C:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E8870: .word 0x0000190C
_021E8874: .word 0x00001904
	thumb_func_end ov18_021E8714

	thumb_func_start ov18_021E8878
ov18_021E8878: ; 0x021E8878
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r1, [sp]
	str r3, [sp, #4]
	cmp r2, #0
	bne _021E892C
	ldr r1, [r1, #4]
	mov r7, #0
	sub r1, r1, #1
	cmp r1, #0
	bgt _021E8890
	b _021E89CE
_021E8890:
	ldr r2, [sp, #0x30]
	mov r1, #1
	lsl r1, r2
	mov r2, #2
	lsl r2, r2, #0x1e
	str r1, [sp, #0x14]
	sub r1, r1, r2
	str r1, [sp, #0x10]
_021E88A0:
	ldr r1, [sp]
	ldr r3, [r1]
	lsl r1, r7, #2
	str r1, [sp, #0xc]
	ldr r2, [sp, #0xc]
	ldr r1, _021E89D4 ; =0x00001908
	ldr r3, [r3, r2]
	ldr r4, [r0, r1]
	lsl r2, r3, #2
	ldrb r2, [r4, r2]
	cmp r2, #0x16
	bhs _021E8918
	ldr r2, [sp, #4]
	lsl r2, r2, #0x10
	lsr r6, r2, #0x10
	add r2, r1, #0
	sub r2, #8
	ldr r5, [r0, r2]
	cmp r6, r5
	bge _021E88EC
	sub r1, #0xc
	ldr r4, [r0, r1]
_021E88CC:
	lsl r2, r6, #2
	ldr r1, [r4, r2]
	cmp r1, r3
	bne _021E88E2
	ldr r1, _021E89D8 ; =0x00001904
	ldr r3, [sp, #0x14]
	ldr r1, [r0, r1]
	ldr r4, [r1, r2]
	orr r3, r4
	str r3, [r1, r2]
	b _021E88EC
_021E88E2:
	add r1, r6, #1
	lsl r1, r1, #0x10
	lsr r6, r1, #0x10
	cmp r6, r5
	blt _021E88CC
_021E88EC:
	mov r1, #0x19
	lsl r1, r1, #8
	ldr r3, [r0, r1]
	cmp r6, r3
	bne _021E8918
	ldr r2, [sp]
	lsl r3, r3, #2
	ldr r4, [r2]
	ldr r2, [sp, #0xc]
	ldr r2, [r4, r2]
	sub r4, r1, #4
	ldr r4, [r0, r4]
	str r2, [r4, r3]
	add r2, r1, #4
	ldr r4, [r0, r2]
	ldr r2, [r0, r1]
	lsl r3, r2, #2
	ldr r2, [sp, #0x10]
	str r2, [r4, r3]
	ldr r2, [r0, r1]
	add r2, r2, #1
	str r2, [r0, r1]
_021E8918:
	add r1, r7, #1
	lsl r1, r1, #0x10
	lsr r7, r1, #0x10
	ldr r1, [sp]
	ldr r1, [r1, #4]
	sub r1, r1, #1
	cmp r7, r1
	blt _021E88A0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_021E892C:
	ldr r1, [r1, #4]
	mov r7, #0
	sub r1, r1, #1
	cmp r1, #0
	ble _021E89CE
	ldr r2, [sp, #0x30]
	mov r1, #1
	lsl r1, r2
	mov r2, #2
	lsl r2, r2, #0x1e
	mov ip, r1
	sub r1, r1, r2
	mov lr, r1
_021E8946:
	ldr r1, [sp]
	ldr r4, [r1]
	lsl r1, r7, #2
	str r1, [sp, #8]
	ldr r3, [sp, #8]
	ldr r1, _021E89D4 ; =0x00001908
	ldr r5, [r4, r3]
	ldr r2, [r0, r1]
	lsl r3, r5, #2
	ldrb r2, [r2, r3]
	cmp r2, #0x16
	blo _021E89BE
	ldr r2, [sp, #4]
	lsl r2, r2, #0x10
	lsr r4, r2, #0x10
	add r2, r1, #0
	sub r2, #8
	ldr r3, [r0, r2]
	cmp r4, r3
	bge _021E8992
	sub r1, #0xc
	ldr r2, [r0, r1]
_021E8972:
	lsl r6, r4, #2
	ldr r1, [r2, r6]
	cmp r1, r5
	bne _021E8988
	ldr r1, _021E89D8 ; =0x00001904
	ldr r3, [r0, r1]
	mov r1, ip
	ldr r2, [r3, r6]
	orr r1, r2
	str r1, [r3, r6]
	b _021E8992
_021E8988:
	add r1, r4, #1
	lsl r1, r1, #0x10
	lsr r4, r1, #0x10
	cmp r4, r3
	blt _021E8972
_021E8992:
	mov r2, #0x19
	lsl r2, r2, #8
	ldr r1, [r0, r2]
	cmp r4, r1
	bne _021E89BE
	ldr r3, [sp]
	lsl r1, r1, #2
	ldr r4, [r3]
	ldr r3, [sp, #8]
	ldr r4, [r4, r3]
	sub r3, r2, #4
	ldr r3, [r0, r3]
	str r4, [r3, r1]
	add r1, r2, #4
	ldr r4, [r0, r1]
	ldr r1, [r0, r2]
	lsl r3, r1, #2
	mov r1, lr
	str r1, [r4, r3]
	ldr r1, [r0, r2]
	add r1, r1, #1
	str r1, [r0, r2]
_021E89BE:
	add r1, r7, #1
	lsl r1, r1, #0x10
	lsr r7, r1, #0x10
	ldr r1, [sp]
	ldr r1, [r1, #4]
	sub r1, r1, #1
	cmp r7, r1
	blt _021E8946
_021E89CE:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E89D4: .word 0x00001908
_021E89D8: .word 0x00001904
	thumb_func_end ov18_021E8878

	thumb_func_start ov18_021E89DC
ov18_021E89DC: ; 0x021E89DC
	push {r3, lr}
	ldr r3, _021E89FC ; =_021F99E0
	mov r2, #0
_021E89E2:
	ldr r1, [r3]
	cmp r0, r1
	bne _021E89EC
	add r0, r2, #0
	pop {r3, pc}
_021E89EC:
	add r2, r2, #1
	add r3, r3, #4
	cmp r2, #0x8e
	blo _021E89E2
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_021E89FC: .word _021F99E0
	thumb_func_end ov18_021E89DC

	thumb_func_start ov18_021E8A00
ov18_021E8A00: ; 0x021E8A00
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x19
	lsl r0, r0, #8
	ldr r0, [r5, r0]
	sub r0, r0, #1
	cmp r0, #1
	ble _021E8AA2
_021E8A16:
	ldr r1, [sp, #4]
	add r0, r5, #0
	bl ov18_021E8AE0
	add r6, r0, #0
	ldr r0, [sp, #4]
	add r0, r0, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	mov r0, #0x19
	lsl r0, r0, #8
	ldr r0, [r5, r0]
	cmp r4, r0
	bge _021E8A90
	ldr r0, [sp, #4]
	lsl r0, r0, #2
	str r0, [sp]
_021E8A38:
	add r0, r5, #0
	add r1, r4, #0
	bl ov18_021E8AE0
	add r7, r0, #0
	add r0, r6, #0
	bl ov18_021E89DC
	str r0, [sp, #8]
	add r0, r7, #0
	bl ov18_021E89DC
	ldr r1, [sp, #8]
	cmp r1, r0
	bls _021E8A80
	ldr r0, _021E8AA8 ; =0x000018FC
	ldr r1, [sp]
	ldr r6, [r5, r0]
	ldr r0, [sp]
	ldr r3, [r0, r6]
	lsl r0, r4, #2
	ldr r2, [r6, r0]
	str r2, [r1, r6]
	ldr r1, _021E8AA8 ; =0x000018FC
	ldr r1, [r5, r1]
	str r3, [r1, r0]
	ldr r1, _021E8AAC ; =0x00001904
	ldr r6, [r5, r1]
	ldr r1, [sp]
	ldr r2, [r6, r0]
	ldr r3, [r1, r6]
	str r2, [r1, r6]
	ldr r1, _021E8AAC ; =0x00001904
	add r6, r7, #0
	ldr r1, [r5, r1]
	str r3, [r1, r0]
_021E8A80:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	mov r0, #0x19
	lsl r0, r0, #8
	ldr r0, [r5, r0]
	cmp r4, r0
	blt _021E8A38
_021E8A90:
	ldr r1, [sp, #4]
	add r1, r1, #1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	str r1, [sp, #4]
	sub r1, r0, #1
	ldr r0, [sp, #4]
	cmp r0, r1
	blt _021E8A16
_021E8AA2:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_021E8AA8: .word 0x000018FC
_021E8AAC: .word 0x00001904
	thumb_func_end ov18_021E8A00

	thumb_func_start ov18_021E8AB0
ov18_021E8AB0: ; 0x021E8AB0
	ldr r2, _021E8AC8 ; =0x00001904
	ldr r2, [r0, r2]
	lsl r0, r1, #2
	ldr r1, [r2, r0]
	mov r0, #2
	lsl r0, r0, #0x1e
	tst r0, r1
	beq _021E8AC4
	mov r0, #1
	bx lr
_021E8AC4:
	mov r0, #0
	bx lr
	.balign 4, 0
_021E8AC8: .word 0x00001904
	thumb_func_end ov18_021E8AB0

	thumb_func_start ov18_021E8ACC
ov18_021E8ACC: ; 0x021E8ACC
	mov r3, #1
	lsl r3, r2
	ldr r2, _021E8ADC ; =0x00001904
	ldr r2, [r0, r2]
	lsl r0, r1, #2
	ldr r0, [r2, r0]
	and r0, r3
	bx lr
	.balign 4, 0
_021E8ADC: .word 0x00001904
	thumb_func_end ov18_021E8ACC

	thumb_func_start ov18_021E8AE0
ov18_021E8AE0: ; 0x021E8AE0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov18_021E8AB0
	cmp r0, #0
	ldr r0, _021E8B08 ; =0x000018FC
	bne _021E8AFC
	ldr r1, [r5, r0]
	lsl r0, r4, #2
	ldr r0, [r1, r0]
	bl ov18_021E8B0C
	pop {r3, r4, r5, pc}
_021E8AFC:
	ldr r1, [r5, r0]
	lsl r0, r4, #2
	ldr r0, [r1, r0]
	bl ov18_021E8B18
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E8B08: .word 0x000018FC
	thumb_func_end ov18_021E8AE0

	thumb_func_start ov18_021E8B0C
ov18_021E8B0C: ; 0x021E8B0C
	lsl r1, r0, #1
	ldr r0, _021E8B14 ; =_021F9954
	ldrh r0, [r0, r1]
	bx lr
	.balign 4, 0
_021E8B14: .word _021F9954
	thumb_func_end ov18_021E8B0C

	thumb_func_start ov18_021E8B18
ov18_021E8B18: ; 0x021E8B18
	lsl r1, r0, #1
	ldr r0, _021E8B20 ; =_021F98D8
	ldrh r0, [r0, r1]
	bx lr
	.balign 4, 0
_021E8B20: .word _021F98D8
	thumb_func_end ov18_021E8B18

	thumb_func_start ov18_021E8B24
ov18_021E8B24: ; 0x021E8B24
	push {r3, lr}
	bl ov18_021E8B0C
	cmp r0, #0xa
	beq _021E8B34
	ldr r1, _021E8B3C ; =0x0000019E
	cmp r0, r1
	bne _021E8B38
_021E8B34:
	mov r0, #1
	pop {r3, pc}
_021E8B38:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_021E8B3C: .word 0x0000019E
	thumb_func_end ov18_021E8B24

	thumb_func_start ov18_021E8B40
ov18_021E8B40: ; 0x021E8B40
	ldr r2, _021E8B58 ; =_021F9954
	mov r0, #0
_021E8B44:
	ldrh r1, [r2]
	cmp r1, #0xa
	beq _021E8B54
	add r0, r0, #1
	add r2, r2, #2
	cmp r0, #0x46
	blo _021E8B44
	mov r0, #1
_021E8B54:
	bx lr
	nop
_021E8B58: .word _021F9954
	thumb_func_end ov18_021E8B40

	thumb_func_start ov18_021E8B5C
ov18_021E8B5C: ; 0x021E8B5C
	push {r3, lr}
	bl ov18_021E8B0C
	ldr r1, _021E8B74 ; =0x000001A6
	cmp r0, r1
	beq _021E8B6C
	cmp r0, #0x18
	bne _021E8B70
_021E8B6C:
	mov r0, #1
	pop {r3, pc}
_021E8B70:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_021E8B74: .word 0x000001A6
	thumb_func_end ov18_021E8B5C

	thumb_func_start ov18_021E8B78
ov18_021E8B78: ; 0x021E8B78
	ldr r2, _021E8B90 ; =_021F9954
	mov r0, #0
_021E8B7C:
	ldrh r1, [r2]
	cmp r1, #0x18
	beq _021E8B8C
	add r0, r0, #1
	add r2, r2, #2
	cmp r0, #0x46
	blo _021E8B7C
	mov r0, #1
_021E8B8C:
	bx lr
	nop
_021E8B90: .word _021F9954
	thumb_func_end ov18_021E8B78

	thumb_func_start ov18_021E8B94
ov18_021E8B94: ; 0x021E8B94
	push {r3, r4, lr}
	sub sp, #0xc
	mov r2, #0
	add r4, r0, #0
	str r2, [sp]
	add r0, sp, #8
	str r0, [sp, #4]
	mov r0, #0x85
	mov r1, #1
	mov r3, #0x25
	bl GfGfxLoader_LoadFromNarc_GetSizeOut
	ldr r1, _021E8BCC ; =0x0000190C
	mov r3, #0x25
	str r0, [r4, r1]
	mov r1, #0
	str r1, [sp]
	add r0, sp, #8
	str r0, [sp, #4]
	mov r0, #0x85
	add r2, r1, #0
	bl GfGfxLoader_LoadFromNarc_GetSizeOut
	ldr r1, _021E8BD0 ; =0x00001908
	str r0, [r4, r1]
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_021E8BCC: .word 0x0000190C
_021E8BD0: .word 0x00001908
	thumb_func_end ov18_021E8B94

	thumb_func_start ov18_021E8BD4
ov18_021E8BD4: ; 0x021E8BD4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E8BEC ; =0x0000190C
	ldr r0, [r4, r0]
	bl FreeToHeap
	ldr r0, _021E8BF0 ; =0x00001908
	ldr r0, [r4, r0]
	bl FreeToHeap
	pop {r4, pc}
	nop
_021E8BEC: .word 0x0000190C
_021E8BF0: .word 0x00001908
	thumb_func_end ov18_021E8BD4

	thumb_func_start ov18_021E8BF4
ov18_021E8BF4: ; 0x021E8BF4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, [r4]
	add r5, r0, #0
	lsl r2, r1, #2
	ldr r1, _021E8C28 ; =_021F9C3C
	ldr r1, [r1, r2]
	blx r1
	str r0, [r4]
	cmp r0, #0x5d
	bne _021E8C0E
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E8C0E:
	ldr r0, [r5, #8]
	bl sub_02019934
	add r0, r5, #0
	bl ov18_021F1004
	ldr r0, _021E8C2C ; =0x0000066C
	ldr r0, [r5, r0]
	bl sub_0200D020
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_021E8C28: .word _021F9C3C
_021E8C2C: .word 0x0000066C
	thumb_func_end ov18_021E8BF4

	thumb_func_start ov18_021E8C30
ov18_021E8C30: ; 0x021E8C30
	push {r4, lr}
	sub sp, #0x20
	add r4, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	mov r0, #0
	bl GX_EngineASetLayers
	mov r0, #0
	bl GX_EngineBSetLayers
	ldr r0, _021E8D18 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	ldr r0, _021E8D1C ; =0x04001050
	strh r1, [r0]
	bl sub_020210BC
	mov r0, #4
	bl sub_02021148
	ldr r2, _021E8D20 ; =0x04000304
	ldr r0, _021E8D24 ; =0xFFFF7FFF
	ldrh r1, [r2]
	and r0, r1
	strh r0, [r2]
	mov r0, #4
	mov r1, #8
	bl SetKeyRepeatTimers
	add r0, r4, #0
	bl ov18_021E62A8
	add r0, r4, #0
	bl ov18_021E8410
	mov r0, #0
	mov r1, #0x25
	bl sub_020880CC
	mov r0, #4
	mov r1, #0x25
	bl FontID_Alloc
	mov r0, #0x44
	mov r1, #0x25
	bl NARC_ctor
	ldr r1, _021E8D28 ; =0x00000854
	str r0, [r4, r1]
	add r0, r4, #0
	bl ov18_021E6FFC
	mov r0, #0x11
	str r0, [sp]
	str r0, [sp, #4]
	mov r2, #0
	str r2, [sp, #8]
	mov r0, #0x98
	str r0, [sp, #0xc]
	str r2, [sp, #0x10]
	str r0, [sp, #0x14]
	mov r0, #8
	str r0, [sp, #0x18]
	mov r0, #0xe
	str r0, [sp, #0x1c]
	ldr r1, _021E8D2C ; =0x00001858
	add r0, r4, #0
	ldrb r1, [r4, r1]
	mov r3, #0x1a
	bl ov18_021F7ED4
	add r0, r4, #0
	mov r1, #1
	bl ov18_021F8884
	add r0, r4, #0
	bl ov18_021EDDB4
	bl ov18_021E5C74
	add r0, r4, #0
	bl ov18_021E5C84
	add r0, r4, #0
	bl ov18_021E6308
	add r0, r4, #0
	bl ov18_021E61A4
	add r0, r4, #0
	bl ov18_021E6244
	add r0, r4, #0
	bl ov18_021F0FC8
	bl ov18_021E6174
	mov r1, #0
	mov r0, #0x36
	add r2, r1, #0
	bl sub_02004EC4
	ldr r0, _021E8D30 ; =ov18_021E5C40
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	ldr r0, _021E8D34 ; =0x0000085C
	ldr r0, [r4, r0]
	add sp, #0x20
	pop {r4, pc}
	nop
_021E8D18: .word 0x04000050
_021E8D1C: .word 0x04001050
_021E8D20: .word 0x04000304
_021E8D24: .word 0xFFFF7FFF
_021E8D28: .word 0x00000854
_021E8D2C: .word 0x00001858
_021E8D30: .word ov18_021E5C40
_021E8D34: .word 0x0000085C
	thumb_func_end ov18_021E8C30

	thumb_func_start ov18_021E8D38
ov18_021E8D38: ; 0x021E8D38
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	add r0, r4, #0
	bl ov18_021EE388
	add r0, r4, #0
	bl ov18_021F0FEC
	add r0, r4, #0
	bl ov18_021E6280
	add r0, r4, #0
	bl ov18_021E6204
	add r0, r4, #0
	bl ov18_021E6540
	add r0, r4, #0
	bl ov18_021E5F58
	ldr r0, _021E8DA0 ; =0x00000854
	ldr r0, [r4, r0]
	bl NARC_dtor
	mov r0, #4
	bl FontID_Release
	add r0, r4, #0
	bl ov18_021E84EC
	add r0, r4, #0
	bl ov18_021E62E8
	bl sub_02021238
	ldr r1, _021E8DA4 ; =0x04000050
	mov r0, #0
	strh r0, [r1]
	ldr r1, _021E8DA8 ; =0x04001050
	strh r0, [r1]
	bl GX_EngineASetLayers
	mov r0, #0
	bl GX_EngineBSetLayers
	ldr r0, _021E8DAC ; =0x0000085C
	ldr r0, [r4, r0]
	pop {r4, pc}
	.balign 4, 0
_021E8DA0: .word 0x00000854
_021E8DA4: .word 0x04000050
_021E8DA8: .word 0x04001050
_021E8DAC: .word 0x0000085C
	thumb_func_end ov18_021E8D38

	thumb_func_start ov18_021E8DB0
ov18_021E8DB0: ; 0x021E8DB0
	push {r4, lr}
	add r4, r0, #0
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E8DC4
	mov r0, #0x86
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	pop {r4, pc}
_021E8DC4:
	mov r0, #2
	pop {r4, pc}
	thumb_func_end ov18_021E8DB0

	thumb_func_start ov18_021E8DC8
ov18_021E8DC8: ; 0x021E8DC8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x85
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02003B44
	cmp r0, #0
	bne _021E8DE0
	ldr r0, _021E8DE4 ; =0x0000085C
	ldr r0, [r4, r0]
	pop {r4, pc}
_021E8DE0:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_021E8DE4: .word 0x0000085C
	thumb_func_end ov18_021E8DC8

	thumb_func_start ov18_021E8DE8
ov18_021E8DE8: ; 0x021E8DE8
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, _021E8E84 ; =0x00000868
	add r4, r5, r0
	ldrb r0, [r4, #5]
	cmp r0, #0
	beq _021E8E02
	cmp r0, #1
	beq _021E8E2E
	cmp r0, #2
	beq _021E8E6A
	b _021E8E7C
_021E8E02:
	ldrb r0, [r4, #2]
	str r0, [sp]
	ldrb r0, [r4, #3]
	str r0, [sp, #4]
	ldrb r0, [r4, #7]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	str r0, [sp, #8]
	ldrb r1, [r4, #4]
	ldrb r2, [r4]
	ldrb r3, [r4, #1]
	ldr r0, [r5, #4]
	bl BgTilemapRectChangePalette
	ldrb r1, [r4, #4]
	ldr r0, [r5, #4]
	bl ScheduleBgTilemapBufferTransfer
	ldrb r0, [r4, #5]
	add r0, r0, #1
	strb r0, [r4, #5]
	b _021E8E7C
_021E8E2E:
	ldrb r0, [r4, #6]
	add r0, r0, #1
	strb r0, [r4, #6]
	ldrb r0, [r4, #6]
	cmp r0, #4
	bne _021E8E7C
	ldrb r0, [r4, #2]
	str r0, [sp]
	ldrb r0, [r4, #3]
	str r0, [sp, #4]
	ldrb r0, [r4, #7]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	str r0, [sp, #8]
	ldrb r1, [r4, #4]
	ldrb r2, [r4]
	ldrb r3, [r4, #1]
	ldr r0, [r5, #4]
	bl BgTilemapRectChangePalette
	ldrb r1, [r4, #4]
	ldr r0, [r5, #4]
	bl ScheduleBgTilemapBufferTransfer
	mov r0, #0
	strb r0, [r4, #6]
	ldrb r0, [r4, #5]
	add r0, r0, #1
	strb r0, [r4, #5]
	b _021E8E7C
_021E8E6A:
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x10
	bl MI_CpuFill8
	ldr r0, _021E8E88 ; =0x0000085C
	add sp, #0xc
	ldr r0, [r5, r0]
	pop {r4, r5, pc}
_021E8E7C:
	mov r0, #4
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_021E8E84: .word 0x00000868
_021E8E88: .word 0x0000085C
	thumb_func_end ov18_021E8DE8

	thumb_func_start ov18_021E8E8C
ov18_021E8E8C: ; 0x021E8E8C
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r2, _021E8EC4 ; =0x0000185B
	add r4, r0, #0
	mov r1, #0
	strb r1, [r4, r2]
	bl ov18_021E67C8
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x85
	lsl r0, r0, #4
	mov r1, #0xf
	add r3, r1, #0
	ldr r0, [r4, r0]
	ldr r2, _021E8EC8 ; =0x0000FFFF
	sub r3, #0x8e
	bl sub_02003370
	mov r0, #0x86
	mov r1, #6
	lsl r0, r0, #4
	str r1, [r4, r0]
	mov r0, #2
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_021E8EC4: .word 0x0000185B
_021E8EC8: .word 0x0000FFFF
	thumb_func_end ov18_021E8E8C

	thumb_func_start ov18_021E8ECC
ov18_021E8ECC: ; 0x021E8ECC
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r0, #0
	bl ov18_021F6B00
	cmp r0, #6
	bhi _021E8FB0
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E8EE6: ; jump table
	.short _021E8EF4 - _021E8EE6 - 2 ; case 0
	.short _021E8F0A - _021E8EE6 - 2 ; case 1
	.short _021E8F20 - _021E8EE6 - 2 ; case 2
	.short _021E8F54 - _021E8EE6 - 2 ; case 3
	.short _021E8F64 - _021E8EE6 - 2 ; case 4
	.short _021E8F74 - _021E8EE6 - 2 ; case 5
	.short _021E8F94 - _021E8EE6 - 2 ; case 6
_021E8EF4:
	ldr r0, _021E8FB8 ; =0x000008F2
	bl PlaySE
	add r0, r4, #0
	mov r1, #8
	mov r2, #0x10
	mov r3, #9
	bl ov18_021EDBB8
	add sp, #8
	pop {r3, r4, r5, pc}
_021E8F0A:
	ldr r0, _021E8FBC ; =0x000008E9
	bl PlaySE
	add r0, r4, #0
	mov r1, #0
	mov r2, #8
	mov r3, #0xa
	bl ov18_021EDBB8
	add sp, #8
	pop {r3, r4, r5, pc}
_021E8F20:
	ldr r0, _021E8FC0 ; =0x00000864
	ldr r0, [r4, r0]
	cmp r0, #0
	ldr r0, [r4]
	bne _021E8F34
	ldr r0, [r0, #0xc]
	mov r1, #1
	bl sub_02018410
	b _021E8F3C
_021E8F34:
	ldr r0, [r0, #0xc]
	mov r1, #0
	bl sub_02018410
_021E8F3C:
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	mov r1, #0x18
	mov r2, #8
	mov r3, #0x5c
	bl ov18_021EDBB8
	add sp, #8
	pop {r3, r4, r5, pc}
_021E8F54:
	ldr r0, _021E8FC4 ; =0x000008F1
	bl PlaySE
	add r0, r4, #0
	mov r1, #1
	bl ov18_021EDDA4
	b _021E8FB0
_021E8F64:
	ldr r0, _021E8FC4 ; =0x000008F1
	bl PlaySE
	add r0, r4, #0
	mov r1, #0
	bl ov18_021EDDA4
	b _021E8FB0
_021E8F74:
	ldr r0, _021E8FC8 ; =0x00000868
	add r5, r4, r0
	add r0, r5, #0
	add r1, r5, #4
	bl sub_02025380
	add r0, r4, #0
	bl ov18_021F2B9C
	strh r0, [r5, #8]
	ldr r0, _021E8FB8 ; =0x000008F2
	bl PlaySE
	add sp, #8
	mov r0, #8
	pop {r3, r4, r5, pc}
_021E8F94:
	add r0, sp, #4
	add r1, sp, #0
	bl sub_02025380
	ldr r1, [sp, #4]
	ldr r2, [sp]
	add r0, r4, #0
	bl ov18_021F2AF8
	cmp r0, #1
	bne _021E8FB0
	add sp, #8
	mov r0, #7
	pop {r3, r4, r5, pc}
_021E8FB0:
	mov r0, #6
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_021E8FB8: .word 0x000008F2
_021E8FBC: .word 0x000008E9
_021E8FC0: .word 0x00000864
_021E8FC4: .word 0x000008F1
_021E8FC8: .word 0x00000868
	thumb_func_end ov18_021E8ECC

	thumb_func_start ov18_021E8FCC
ov18_021E8FCC: ; 0x021E8FCC
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	add r0, sp, #4
	add r1, sp, #0
	bl sub_02025364
	cmp r0, #0
	bne _021E8FEA
	add r0, r4, #0
	bl ov18_021EDCD4
	add sp, #8
	mov r0, #6
	pop {r4, pc}
_021E8FEA:
	ldr r0, [sp, #4]
	cmp r0, #0x5c
	blo _021E9056
	cmp r0, #0xa4
	bhs _021E9056
	ldr r1, [sp]
	cmp r1, #0x70
	blo _021E9056
	cmp r1, #0x90
	bhs _021E9056
	cmp r0, #0x60
	bhs _021E9008
	mov r0, #0x60
	str r0, [sp, #4]
	b _021E9010
_021E9008:
	cmp r0, #0x9f
	bls _021E9010
	mov r0, #0x9f
	str r0, [sp, #4]
_021E9010:
	cmp r1, #0x78
	bhs _021E901A
	mov r0, #0x78
	str r0, [sp]
	b _021E9022
_021E901A:
	cmp r1, #0x87
	bls _021E9022
	mov r0, #0x87
	str r0, [sp]
_021E9022:
	ldr r1, [sp, #4]
	ldr r2, [sp]
	add r0, r4, #0
	bl ov18_021F2AF8
	cmp r0, #0
	bne _021E9062
	ldr r0, _021E9068 ; =0x00001858
	ldrb r0, [r4, r0]
	cmp r0, #1
	ldr r0, _021E906C ; =0x000008F1
	bne _021E9048
	bl PlaySE
	add r0, r4, #0
	mov r1, #0
	bl ov18_021EDC74
	b _021E9062
_021E9048:
	bl PlaySE
	add r0, r4, #0
	mov r1, #1
	bl ov18_021EDC74
	b _021E9062
_021E9056:
	add r0, r4, #0
	bl ov18_021EDCD4
	add sp, #8
	mov r0, #6
	pop {r4, pc}
_021E9062:
	mov r0, #7
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_021E9068: .word 0x00001858
_021E906C: .word 0x000008F1
	thumb_func_end ov18_021E8FCC

	thumb_func_start ov18_021E9070
ov18_021E9070: ; 0x021E9070
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _021E9188 ; =0x00000868
	add r4, r5, r0
	ldrh r0, [r4, #0xa]
	cmp r0, #0
	beq _021E9086
	cmp r0, #1
	beq _021E9118
	b _021E9180
_021E9086:
	add r0, sp, #4
	add r1, sp, #0
	bl sub_02025364
	cmp r0, #0
	bne _021E90B8
	ldr r0, [r5, #4]
	mov r1, #0
	bl Bg_GetXpos
	cmp r0, #0x40
	blt _021E90B0
	ldr r0, _021E9188 ; =0x00000868
	mov r1, #0
	add r0, r5, r0
	mov r2, #0x10
	bl MI_CpuFill8
	add sp, #8
	mov r0, #9
	pop {r4, r5, r6, pc}
_021E90B0:
	ldrh r0, [r4, #0xa]
	add r0, r0, #1
	strh r0, [r4, #0xa]
	b _021E9180
_021E90B8:
	ldr r1, [r4]
	ldr r0, [sp, #4]
	sub r3, r1, r0
	ldr r0, [r5, #4]
	bpl _021E90E6
	mov r1, #0
	add r2, r1, #0
	add r3, r1, #0
	bl ScheduleSetBgPosText
	mov r2, #0
	ldr r0, [r5, #4]
	mov r1, #4
	add r3, r2, #0
	bl ScheduleSetBgPosText
	mov r2, #8
	ldrsh r2, [r4, r2]
	add r0, r5, #0
	mov r1, #0
	bl ov18_021F2B70
	b _021E9180
_021E90E6:
	mov r1, #0
	add r2, r1, #0
	bl ScheduleSetBgPosText
	ldr r6, [r4]
	ldr r3, [sp, #4]
	ldr r0, [r5, #4]
	mov r1, #4
	mov r2, #0
	sub r3, r6, r3
	bl ScheduleSetBgPosText
	mov r2, #8
	add r0, r5, #0
	ldrsh r5, [r4, r2]
	ldr r3, [r4]
	ldr r2, [sp, #4]
	mov r1, #0
	sub r2, r3, r2
	sub r2, r5, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl ov18_021F2B70
	b _021E9180
_021E9118:
	ldr r0, [r5, #4]
	mov r1, #0
	mov r2, #2
	mov r3, #0x10
	bl ScheduleSetBgPosText
	ldr r0, [r5, #4]
	mov r1, #4
	mov r2, #2
	mov r3, #0x10
	bl ScheduleSetBgPosText
	add r0, r5, #0
	mov r1, #0
	mov r2, #0x10
	bl ov18_021F2B3C
	ldr r0, [r5, #4]
	mov r1, #0
	bl Bg_GetXpos
	cmp r0, #0
	bgt _021E9180
	mov r1, #0
	ldr r0, [r5, #4]
	add r2, r1, #0
	add r3, r1, #0
	bl ScheduleSetBgPosText
	mov r2, #0
	ldr r0, [r5, #4]
	mov r1, #4
	add r3, r2, #0
	bl ScheduleSetBgPosText
	add r0, r5, #0
	bl ov18_021F2B9C
	add r2, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl ov18_021F2B70
	ldr r0, _021E9188 ; =0x00000868
	mov r1, #0
	add r0, r5, r0
	mov r2, #0x10
	bl MI_CpuFill8
	add sp, #8
	mov r0, #6
	pop {r4, r5, r6, pc}
_021E9180:
	mov r0, #8
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_021E9188: .word 0x00000868
	thumb_func_end ov18_021E9070

	thumb_func_start ov18_021E918C
ov18_021E918C: ; 0x021E918C
	push {r4, r5, r6, lr}
	ldr r1, _021E92A8 ; =0x00000868
	add r5, r0, #0
	add r4, r5, r1
	ldrh r1, [r4]
	cmp r1, #0
	beq _021E91A4
	cmp r1, #1
	beq _021E91AE
	cmp r1, #2
	beq _021E924A
	b _021E92A2
_021E91A4:
	bl ov18_021E6574
	ldrh r0, [r4]
	add r0, r0, #1
	strh r0, [r4]
_021E91AE:
	ldr r0, [r5, #4]
	mov r1, #0
	mov r2, #1
	mov r3, #0x10
	bl ScheduleSetBgPosText
	ldr r0, [r5, #4]
	mov r1, #4
	mov r2, #1
	mov r3, #0x10
	bl ScheduleSetBgPosText
	mov r1, #0
	add r2, r1, #0
	add r0, r5, #0
	sub r2, #0x10
	bl ov18_021F2B3C
	ldr r0, [r5, #4]
	mov r1, #0
	bl Bg_GetXpos
	add r6, r0, #0
	ldrb r0, [r4, #3]
	cmp r0, #0
	bne _021E9202
	cmp r6, #0xc0
	blt _021E9202
	ldr r0, [r5, #8]
	mov r1, #0
	bl sub_020199E4
	cmp r0, #0
	bne _021E9202
	mov r0, #1
	strb r0, [r4, #3]
	add r0, r5, #0
	bl ov18_021E65AC
	add r0, r5, #0
	bl ov18_021EDE64
_021E9202:
	mov r3, #1
	lsl r3, r3, #8
	cmp r6, r3
	blt _021E92A2
	mov r1, #0
	ldr r0, [r5, #4]
	add r2, r1, #0
	bl ScheduleSetBgPosText
	mov r1, #4
	add r3, r1, #0
	ldr r0, [r5, #4]
	mov r2, #0
	add r3, #0xfc
	bl ScheduleSetBgPosText
	add r0, r5, #0
	bl ov18_021F2B9C
	mov r2, #1
	add r3, r0, #0
	lsl r2, r2, #8
	sub r2, r3, r2
	lsl r2, r2, #0x10
	add r0, r5, #0
	mov r1, #0
	asr r2, r2, #0x10
	bl ov18_021F2B70
	ldrb r0, [r4, #3]
	cmp r0, #1
	bne _021E92A2
	ldrh r0, [r4]
	add r0, r0, #1
	strh r0, [r4]
	b _021E92A2
_021E924A:
	ldr r0, [r5, #8]
	mov r1, #1
	bl sub_020199E4
	cmp r0, #0
	bne _021E92A2
	add r0, r5, #0
	bl ov18_021F8838
	add r4, r0, #0
	add r0, r5, #0
	bl ov18_021E659C
	cmp r4, #0
	beq _021E9288
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #8
	bl ov18_021F24E0
	add r0, r5, #0
	add r1, r4, #0
	bl ov18_021E6D38
	cmp r0, #1
	bne _021E9288
	add r0, r5, #0
	mov r1, #6
	mov r2, #1
	bl ov18_021F2A2C
_021E9288:
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #6
	bl ov18_021EE638
	ldr r0, _021E92A8 ; =0x00000868
	mov r1, #0
	add r0, r5, r0
	mov r2, #0x10
	bl MI_CpuFill8
	mov r0, #0xb
	pop {r4, r5, r6, pc}
_021E92A2:
	mov r0, #9
	pop {r4, r5, r6, pc}
	nop
_021E92A8: .word 0x00000868
	thumb_func_end ov18_021E918C

	thumb_func_start ov18_021E92AC
ov18_021E92AC: ; 0x021E92AC
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r1, _021E93CC ; =0x00000868
	add r4, r0, #0
	ldrb r2, [r4, r1]
	cmp r2, #0
	beq _021E92C4
	cmp r2, #1
	beq _021E9302
	cmp r2, #2
	beq _021E9380
	b _021E93C4
_021E92C4:
	bl ov18_021E6574
	mov r3, #0
	str r3, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0x85
	str r3, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r2, _021E93D0 ; =0x0000FFFE
	mov r1, #1
	bl sub_02003370
	mov r3, #0
	str r3, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0x85
	str r3, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r2, _021E93D4 ; =0x0000FFFF
	mov r1, #0xe
	bl sub_02003370
	ldr r0, _021E93CC ; =0x00000868
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _021E93C4
_021E9302:
	sub r1, #0x18
	ldr r0, [r4, r1]
	bl sub_02003B44
	cmp r0, #0
	bne _021E9318
	ldr r0, _021E93CC ; =0x00000868
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _021E93C4
_021E9318:
	ldr r0, [r4, #4]
	mov r1, #0
	bl Bg_GetXpos
	mov r3, #1
	lsl r3, r3, #8
	cmp r0, r3
	ldr r0, [r4, #4]
	blt _021E935C
	mov r1, #0
	add r2, r1, #0
	bl ScheduleSetBgPosText
	mov r1, #4
	add r3, r1, #0
	ldr r0, [r4, #4]
	mov r2, #0
	add r3, #0xfc
	bl ScheduleSetBgPosText
	add r0, r4, #0
	bl ov18_021F2B9C
	mov r2, #1
	add r3, r0, #0
	lsl r2, r2, #8
	sub r2, r3, r2
	lsl r2, r2, #0x10
	add r0, r4, #0
	mov r1, #0
	asr r2, r2, #0x10
	bl ov18_021F2B70
	b _021E93C4
_021E935C:
	mov r1, #0
	mov r2, #1
	mov r3, #0x10
	bl ScheduleSetBgPosText
	ldr r0, [r4, #4]
	mov r1, #4
	mov r2, #1
	mov r3, #0x10
	bl ScheduleSetBgPosText
	mov r1, #0
	add r2, r1, #0
	add r0, r4, #0
	sub r2, #0x10
	bl ov18_021F2B3C
	b _021E93C4
_021E9380:
	ldr r0, [r4, #8]
	mov r1, #0
	bl sub_020199E4
	cmp r0, #0
	bne _021E93C4
	mov r1, #0
	ldr r0, [r4, #4]
	add r2, r1, #0
	add r3, r1, #0
	bl ScheduleSetBgPosText
	mov r2, #0
	ldr r0, [r4, #4]
	mov r1, #4
	add r3, r2, #0
	bl ScheduleSetBgPosText
	mov r0, #0xf
	mov r1, #0x25
	bl sub_02003BA8
	add r0, r4, #0
	bl ov18_021EE388
	add r0, r4, #0
	bl ov18_021F2F00
	ldr r0, _021E93CC ; =0x00000868
	mov r1, #0
	strb r1, [r4, r0]
	add sp, #0xc
	mov r0, #0x15
	pop {r3, r4, pc}
_021E93C4:
	mov r0, #0xa
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_021E93CC: .word 0x00000868
_021E93D0: .word 0x0000FFFE
_021E93D4: .word 0x0000FFFF
	thumb_func_end ov18_021E92AC

	thumb_func_start ov18_021E93D8
ov18_021E93D8: ; 0x021E93D8
	push {r4, lr}
	sub sp, #8
	mov r1, #1
	add r4, r0, #0
	bl ov18_021F6BBC
	cmp r0, #0xe
	bhi _021E9468
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E93F4: ; jump table
	.short _021E9412 - _021E93F4 - 2 ; case 0
	.short _021E9428 - _021E93F4 - 2 ; case 1
	.short _021E942E - _021E93F4 - 2 ; case 2
	.short _021E9444 - _021E93F4 - 2 ; case 3
	.short _021E945E - _021E93F4 - 2 ; case 4
	.short _021E9486 - _021E93F4 - 2 ; case 5
	.short _021E94A0 - _021E93F4 - 2 ; case 6
	.short _021E94BA - _021E93F4 - 2 ; case 7
	.short _021E94CE - _021E93F4 - 2 ; case 8
	.short _021E94E0 - _021E93F4 - 2 ; case 9
	.short _021E9500 - _021E93F4 - 2 ; case 10
	.short _021E9526 - _021E93F4 - 2 ; case 11
	.short _021E9550 - _021E93F4 - 2 ; case 12
	.short _021E9580 - _021E93F4 - 2 ; case 13
	.short _021E95B0 - _021E93F4 - 2 ; case 14
_021E9412:
	add r0, r4, #0
	mov r1, #5
	bl ov18_021F2BB0
	add r0, r4, #0
	bl ov18_021E6E44
	add r0, r4, #0
	bl ov18_021EDE64
	b _021E95E4
_021E9428:
	add sp, #8
	mov r0, #0xc
	pop {r4, pc}
_021E942E:
	ldr r0, _021E95EC ; =0x0000185B
	mov r1, #5
	strb r1, [r4, r0]
	add r0, r4, #0
	mov r1, #0
	mov r2, #8
	mov r3, #0x12
	bl ov18_021EDBB8
	add sp, #8
	pop {r4, pc}
_021E9444:
	add r0, r4, #0
	bl ov18_021EDE04
	cmp r0, #1
	bne _021E9468
	mov r1, #8
	add r0, r4, #0
	add r2, r1, #0
	mov r3, #0xb
	bl ov18_021EDBB8
	add sp, #8
	pop {r4, pc}
_021E945E:
	add r0, r4, #0
	bl ov18_021F8838
	cmp r0, #0
	bne _021E946A
_021E9468:
	b _021E95E4
_021E946A:
	ldr r0, _021E95F0 ; =0x000008E9
	bl PlaySE
	ldr r0, _021E95EC ; =0x0000185B
	mov r1, #1
	strb r1, [r4, r0]
	add r0, r4, #0
	mov r1, #0x10
	mov r2, #8
	mov r3, #0x12
	bl ov18_021EDBB8
	add sp, #8
	pop {r4, pc}
_021E9486:
	ldr r0, [r4]
	mov r1, #1
	ldr r0, [r0, #0xc]
	bl sub_02018410
	add r0, r4, #0
	mov r1, #0x18
	mov r2, #8
	mov r3, #0x14
	bl ov18_021EDBB8
	add sp, #8
	pop {r4, pc}
_021E94A0:
	ldr r0, [r4]
	mov r1, #0
	ldr r0, [r0, #0xc]
	bl sub_02018410
	add r0, r4, #0
	mov r1, #0x18
	mov r2, #8
	mov r3, #0x14
	bl ov18_021EDBB8
	add sp, #8
	pop {r4, pc}
_021E94BA:
	add r0, r4, #0
	bl ov18_021F8838
	mov r2, #0
	add r1, r0, #0
	add r0, r4, #0
	mvn r2, r2
	bl ov18_021E6D68
	b _021E95E4
_021E94CE:
	add r0, r4, #0
	bl ov18_021F8838
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #1
	bl ov18_021E6D68
	b _021E95E4
_021E94E0:
	ldr r0, _021E95F4 ; =0x00001859
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _021E95E4
	ldr r0, _021E95F0 ; =0x000008E9
	bl PlaySE
	ldr r0, _021E95F8 ; =0x00000868
	mov r1, #0
	add r0, r4, r0
	mov r2, #0x10
	bl MI_CpuFill8
	add sp, #8
	mov r0, #0xd
	pop {r4, pc}
_021E9500:
	ldr r0, _021E95F4 ; =0x00001859
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _021E95E4
	ldr r0, _021E95F0 ; =0x000008E9
	bl PlaySE
	ldr r0, _021E95F8 ; =0x00000868
	mov r1, #0
	add r0, r4, r0
	mov r2, #0x10
	bl MI_CpuFill8
	ldr r0, _021E95FC ; =0x0000086F
	mov r1, #1
	strb r1, [r4, r0]
	add sp, #8
	mov r0, #0xd
	pop {r4, pc}
_021E9526:
	add r0, r4, #0
	mov r1, #1
	bl ov18_021F8950
	ldr r1, _021E95F4 ; =0x00001859
	ldrb r1, [r4, r1]
	add r1, r1, #1
	cmp r1, r0
	bhi _021E95E4
	ldr r0, _021E95F0 ; =0x000008E9
	bl PlaySE
	ldr r0, _021E95F8 ; =0x00000868
	mov r1, #0
	add r0, r4, r0
	mov r2, #0x10
	bl MI_CpuFill8
	add sp, #8
	mov r0, #0xe
	pop {r4, pc}
_021E9550:
	add r0, r4, #0
	mov r1, #1
	bl ov18_021F8950
	ldr r1, _021E95F4 ; =0x00001859
	ldrb r1, [r4, r1]
	add r1, r1, #1
	cmp r1, r0
	bhi _021E95E4
	ldr r0, _021E95F0 ; =0x000008E9
	bl PlaySE
	ldr r0, _021E95F8 ; =0x00000868
	mov r1, #0
	add r0, r4, r0
	mov r2, #0x10
	bl MI_CpuFill8
	ldr r0, _021E95FC ; =0x0000086F
	mov r1, #1
	strb r1, [r4, r0]
	add sp, #8
	mov r0, #0xe
	pop {r4, pc}
_021E9580:
	add r0, sp, #4
	add r1, sp, #0
	bl sub_02025364
	ldr r2, [sp, #4]
	ldr r3, [sp]
	add r0, r4, #0
	mov r1, #1
	bl ov18_021F2CD0
	cmp r0, #1
	bne _021E959E
	add sp, #8
	mov r0, #0xf
	pop {r4, pc}
_021E959E:
	ldr r0, _021E95F8 ; =0x00000868
	add r1, r4, r0
	ldr r0, [sp, #4]
	strh r0, [r1]
	ldr r0, [sp]
	add sp, #8
	strh r0, [r1, #2]
	mov r0, #0x10
	pop {r4, pc}
_021E95B0:
	ldr r0, _021E95F8 ; =0x00000868
	add r0, r4, r0
	add r1, r0, #4
	bl sub_02025380
	ldr r0, [r4, #8]
	mov r1, #4
	bl sub_0201980C
	add r0, r4, #0
	mov r1, #6
	mov r2, #0
	bl ov18_021F2A2C
	add r0, r4, #0
	mov r1, #8
	mov r2, #0
	bl ov18_021F2A84
	add r4, #0x6c
	add r0, r4, #0
	bl ClearWindowTilemapAndScheduleTransfer
	add sp, #8
	mov r0, #0x11
	pop {r4, pc}
_021E95E4:
	mov r0, #0xb
	add sp, #8
	pop {r4, pc}
	nop
_021E95EC: .word 0x0000185B
_021E95F0: .word 0x000008E9
_021E95F4: .word 0x00001859
_021E95F8: .word 0x00000868
_021E95FC: .word 0x0000086F
	thumb_func_end ov18_021E93D8

	thumb_func_start ov18_021E9600
ov18_021E9600: ; 0x021E9600
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _021E96F0 ; =0x00000868
	add r4, r5, r0
	ldrh r0, [r4]
	cmp r0, #0
	beq _021E9618
	cmp r0, #1
	beq _021E9648
	cmp r0, #2
	beq _021E96CE
	b _021E96EA
_021E9618:
	ldr r0, [r5, #8]
	mov r1, #4
	bl sub_0201980C
	add r0, r5, #0
	mov r1, #6
	mov r2, #0
	bl ov18_021F2A2C
	add r0, r5, #0
	mov r1, #8
	mov r2, #0
	bl ov18_021F2A84
	add r0, r5, #0
	add r0, #0x6c
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r5, #0
	bl ov18_021E65D4
	ldrh r0, [r4]
	add r0, r0, #1
	strh r0, [r4]
_021E9648:
	ldr r0, [r5, #4]
	mov r1, #0
	mov r2, #2
	mov r3, #0x10
	bl ScheduleSetBgPosText
	ldr r0, [r5, #4]
	mov r1, #4
	mov r2, #2
	mov r3, #0x10
	bl ScheduleSetBgPosText
	add r0, r5, #0
	mov r1, #0
	mov r2, #0x10
	bl ov18_021F2B3C
	ldr r0, [r5, #4]
	mov r1, #0
	bl Bg_GetXpos
	add r6, r0, #0
	ldrb r0, [r4, #3]
	cmp r0, #0
	bne _021E9694
	cmp r6, #0x40
	bge _021E9694
	ldr r0, [r5, #8]
	mov r1, #1
	bl sub_020199E4
	cmp r0, #0
	bne _021E9694
	mov r0, #1
	strb r0, [r4, #3]
	add r0, r5, #0
	bl ov18_021E654C
_021E9694:
	cmp r6, #0
	bgt _021E96EA
	mov r1, #0
	ldr r0, [r5, #4]
	add r2, r1, #0
	add r3, r1, #0
	bl ScheduleSetBgPosText
	mov r2, #0
	ldr r0, [r5, #4]
	mov r1, #4
	add r3, r2, #0
	bl ScheduleSetBgPosText
	add r0, r5, #0
	bl ov18_021F2B9C
	add r2, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl ov18_021F2B70
	ldrb r0, [r4, #3]
	cmp r0, #1
	bne _021E96EA
	ldrh r0, [r4]
	add r0, r0, #1
	strh r0, [r4]
	b _021E96EA
_021E96CE:
	ldr r0, [r5, #8]
	mov r1, #0
	bl sub_020199E4
	cmp r0, #0
	bne _021E96EA
	ldr r0, _021E96F0 ; =0x00000868
	mov r1, #0
	add r0, r5, r0
	mov r2, #0x10
	bl MI_CpuFill8
	mov r0, #6
	pop {r4, r5, r6, pc}
_021E96EA:
	mov r0, #0xc
	pop {r4, r5, r6, pc}
	nop
_021E96F0: .word 0x00000868
	thumb_func_end ov18_021E9600

	thumb_func_start ov18_021E96F4
ov18_021E96F4: ; 0x021E96F4
	push {r3, r4, r5, lr}
	ldr r1, _021E9814 ; =0x00000868
	add r5, r0, #0
	add r4, r5, r1
	ldrb r1, [r4, #4]
	cmp r1, #0
	beq _021E970C
	cmp r1, #1
	beq _021E976C
	cmp r1, #2
	beq _021E97BA
	b _021E980E
_021E970C:
	bl ov18_021F2BFC
	add r0, r5, #0
	mov r1, #2
	mov r2, #6
	bl ov18_021F118C
	add r0, r5, #0
	mov r1, #6
	mov r2, #0
	bl ov18_021F2A2C
	add r0, r5, #0
	mov r1, #8
	mov r2, #0
	bl ov18_021F2A84
	add r0, r5, #0
	add r0, #0x6c
	bl ClearWindowTilemapAndScheduleTransfer
	ldr r1, _021E9818 ; =0x00001859
	add r0, r5, #0
	ldrb r1, [r5, r1]
	sub r2, r1, #1
	mov r1, #0xf
	mul r1, r2
	bl ov18_021E6AEC
	str r0, [r4]
	ldr r1, _021E9818 ; =0x00001859
	mov r2, #1
	ldrb r1, [r5, r1]
	add r0, r5, #0
	add r3, r2, #0
	sub r1, r1, #1
	bl ov18_021F2DD4
	add r2, r0, #0
	add r0, r5, #0
	mov r1, #1
	mov r3, #0xf
	bl ov18_021F2E14
	strb r0, [r4, #6]
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
_021E976C:
	ldrb r0, [r4, #5]
	add r0, r0, #1
	strb r0, [r4, #5]
	ldrb r2, [r4, #5]
	ldr r1, [r4]
	add r0, r5, #0
	lsl r3, r2, #5
	mov r2, #0x1e
	lsl r2, r2, #4
	sub r2, r2, r3
	lsl r2, r2, #1
	add r1, r1, r2
	bl ov18_021E6CE8
	ldrb r0, [r4, #5]
	mov r1, #5
	bl _s32_div_f
	add r3, r0, #0
	lsl r3, r3, #0x18
	add r0, r5, #0
	mov r1, #0x18
	mov r2, #8
	lsr r3, r3, #0x18
	bl ov18_021F16C4
	ldrb r2, [r4, #6]
	add r0, r5, #0
	mov r1, #1
	neg r2, r2
	bl ov18_021F2E4C
	ldrb r0, [r4, #5]
	cmp r0, #0xf
	bne _021E980E
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _021E980E
_021E97BA:
	ldrb r0, [r4, #7]
	cmp r0, #1
	bne _021E97C8
	ldr r0, _021E981C ; =0x0000185A
	ldrb r1, [r5, r0]
	add r1, #0xa
	strb r1, [r5, r0]
_021E97C8:
	ldr r0, _021E9818 ; =0x00001859
	ldrb r1, [r5, r0]
	sub r1, r1, #1
	strb r1, [r5, r0]
	add r0, r5, #0
	mov r1, #5
	bl ov18_021F2BB0
	ldr r0, [r4]
	bl ov18_021E6C90
	add r0, r5, #0
	bl ov18_021E6E44
	add r0, r5, #0
	mov r1, #2
	mov r2, #1
	bl ov18_021F2C10
	mov r1, #1
	add r0, r5, #0
	add r2, r1, #0
	bl ov18_021F2E80
	add r0, r5, #0
	bl ov18_021EDE64
	ldr r0, _021E9814 ; =0x00000868
	mov r1, #0
	add r0, r5, r0
	mov r2, #0x10
	bl MI_CpuFill8
	mov r0, #0xb
	pop {r3, r4, r5, pc}
_021E980E:
	mov r0, #0xd
	pop {r3, r4, r5, pc}
	nop
_021E9814: .word 0x00000868
_021E9818: .word 0x00001859
_021E981C: .word 0x0000185A
	thumb_func_end ov18_021E96F4

	thumb_func_start ov18_021E9820
ov18_021E9820: ; 0x021E9820
	push {r3, r4, r5, lr}
	ldr r1, _021E9934 ; =0x00000868
	add r5, r0, #0
	add r4, r5, r1
	ldrb r1, [r4, #4]
	cmp r1, #0
	beq _021E9838
	cmp r1, #1
	beq _021E9896
	cmp r1, #2
	beq _021E98DC
	b _021E9930
_021E9838:
	bl ov18_021F2BFC
	add r0, r5, #0
	mov r1, #3
	mov r2, #9
	bl ov18_021F118C
	add r0, r5, #0
	mov r1, #6
	mov r2, #0
	bl ov18_021F2A2C
	add r0, r5, #0
	mov r1, #8
	mov r2, #0
	bl ov18_021F2A84
	add r0, r5, #0
	add r0, #0x6c
	bl ClearWindowTilemapAndScheduleTransfer
	ldr r1, _021E9938 ; =0x00001859
	add r0, r5, #0
	ldrb r2, [r5, r1]
	mov r1, #0xf
	mul r1, r2
	bl ov18_021E6AEC
	str r0, [r4]
	ldr r1, _021E9938 ; =0x00001859
	mov r2, #1
	ldrb r1, [r5, r1]
	add r0, r5, #0
	add r3, r2, #0
	add r1, r1, #1
	bl ov18_021F2DD4
	add r2, r0, #0
	add r0, r5, #0
	mov r1, #1
	mov r3, #0xf
	bl ov18_021F2E14
	strb r0, [r4, #6]
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
_021E9896:
	ldrb r0, [r4, #5]
	add r0, r0, #1
	strb r0, [r4, #5]
	ldrb r1, [r4, #5]
	ldr r2, [r4]
	add r0, r5, #0
	lsl r1, r1, #6
	add r1, r2, r1
	bl ov18_021E6CE8
	ldrb r0, [r4, #5]
	mov r1, #5
	bl _s32_div_f
	add r3, r0, #0
	mov r1, #0x18
	add r2, r1, #0
	lsl r3, r3, #0x18
	add r0, r5, #0
	sub r2, #0x20
	lsr r3, r3, #0x18
	bl ov18_021F1760
	ldrb r2, [r4, #6]
	add r0, r5, #0
	mov r1, #1
	bl ov18_021F2E4C
	ldrb r0, [r4, #5]
	cmp r0, #0xf
	bne _021E9930
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _021E9930
_021E98DC:
	ldrb r0, [r4, #7]
	cmp r0, #1
	bne _021E98EA
	ldr r0, _021E993C ; =0x0000185A
	ldrb r1, [r5, r0]
	sub r1, #0xa
	strb r1, [r5, r0]
_021E98EA:
	ldr r0, _021E9938 ; =0x00001859
	ldrb r1, [r5, r0]
	add r1, r1, #1
	strb r1, [r5, r0]
	add r0, r5, #0
	mov r1, #5
	bl ov18_021F2BB0
	ldr r0, [r4]
	bl ov18_021E6C90
	add r0, r5, #0
	bl ov18_021E6E44
	add r0, r5, #0
	mov r1, #2
	mov r2, #1
	bl ov18_021F2C10
	mov r1, #1
	add r0, r5, #0
	add r2, r1, #0
	bl ov18_021F2E80
	add r0, r5, #0
	bl ov18_021EDE64
	ldr r0, _021E9934 ; =0x00000868
	mov r1, #0
	add r0, r5, r0
	mov r2, #0x10
	bl MI_CpuFill8
	mov r0, #0xb
	pop {r3, r4, r5, pc}
_021E9930:
	mov r0, #0xe
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E9934: .word 0x00000868
_021E9938: .word 0x00001859
_021E993C: .word 0x0000185A
	thumb_func_end ov18_021E9820

	thumb_func_start ov18_021E9940
ov18_021E9940: ; 0x021E9940
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r0, sp, #8
	add r1, sp, #4
	bl sub_02025364
	cmp r0, #0
	bne _021E9958
	add sp, #0xc
	mov r0, #0xb
	pop {r4, r5, pc}
_021E9958:
	mov r1, #1
	str r1, [sp]
	ldr r2, [sp, #8]
	ldr r3, [sp, #4]
	add r0, r5, #0
	bl ov18_021F2D24
	cmp r0, #1
	bne _021E99B6
	ldr r1, _021E99BC ; =0x00001859
	add r0, r5, #0
	ldrb r2, [r5, r1]
	mov r1, #0xf
	mul r1, r2
	bl ov18_021E6AEC
	ldr r1, _021E99C0 ; =0x0000185E
	add r4, r0, #0
	ldrb r2, [r5, r1]
	mov r0, #1
	eor r0, r2
	strb r0, [r5, r1]
	add r0, r5, #0
	add r1, r4, #0
	bl ov18_021E6CE8
	add r0, r4, #0
	bl ov18_021E6C90
	add r0, r5, #0
	mov r1, #0x18
	bl ov18_021F1620
	add r0, r5, #0
	bl ov18_021E6E44
	add r0, r5, #0
	mov r1, #2
	mov r2, #1
	bl ov18_021F2C10
	add r0, r5, #0
	bl ov18_021EDE64
	ldr r0, _021E99C4 ; =0x000008E8
	bl PlaySE
_021E99B6:
	mov r0, #0xf
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_021E99BC: .word 0x00001859
_021E99C0: .word 0x0000185E
_021E99C4: .word 0x000008E8
	thumb_func_end ov18_021E9940

	thumb_func_start ov18_021E99C8
ov18_021E99C8: ; 0x021E99C8
	push {r3, r4, r5, lr}
	ldr r1, _021E9A3C ; =0x00000868
	add r5, r0, #0
	add r3, r5, r1
	mov r1, #1
	str r1, [sp]
	ldrh r2, [r3]
	ldrh r3, [r3, #2]
	bl ov18_021F2D24
	cmp r0, #1
	bne _021E9A38
	ldr r1, _021E9A40 ; =0x00001859
	add r0, r5, #0
	ldrb r2, [r5, r1]
	mov r1, #0xf
	mul r1, r2
	bl ov18_021E6AEC
	ldr r1, _021E9A44 ; =0x0000185E
	add r4, r0, #0
	ldrb r2, [r5, r1]
	mov r0, #1
	eor r0, r2
	strb r0, [r5, r1]
	add r0, r5, #0
	add r1, r4, #0
	bl ov18_021E6CE8
	add r0, r4, #0
	bl ov18_021E6C90
	add r0, r5, #0
	mov r1, #0x18
	bl ov18_021F1620
	add r0, r5, #0
	bl ov18_021E6E44
	add r0, r5, #0
	mov r1, #2
	mov r2, #1
	bl ov18_021F2C10
	add r0, r5, #0
	bl ov18_021EDE64
	ldr r0, _021E9A3C ; =0x00000868
	mov r1, #0
	add r0, r5, r0
	mov r2, #0x10
	bl MI_CpuFill8
	ldr r0, _021E9A48 ; =0x000008E8
	bl PlaySE
_021E9A38:
	mov r0, #0xb
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E9A3C: .word 0x00000868
_021E9A40: .word 0x00001859
_021E9A44: .word 0x0000185E
_021E9A48: .word 0x000008E8
	thumb_func_end ov18_021E99C8

	thumb_func_start ov18_021E9A4C
ov18_021E9A4C: ; 0x021E9A4C
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _021E9BDC ; =0x00000868
	add r4, r5, r0
	ldrh r0, [r4, #0xa]
	cmp r0, #0
	beq _021E9A62
	cmp r0, #1
	beq _021E9B1C
	b _021E9BD4
_021E9A62:
	add r0, sp, #4
	add r1, sp, #0
	bl sub_02025364
	cmp r0, #0
	bne _021E9A94
	ldr r0, [r5, #4]
	mov r1, #0
	bl Bg_GetXpos
	cmp r0, #0xc0
	bge _021E9A8C
	ldr r0, _021E9BDC ; =0x00000868
	mov r1, #0
	add r0, r5, r0
	mov r2, #0x10
	bl MI_CpuFill8
	add sp, #8
	mov r0, #0xc
	pop {r4, r5, r6, pc}
_021E9A8C:
	ldrh r0, [r4, #0xa]
	add r0, r0, #1
	strh r0, [r4, #0xa]
	b _021E9BD4
_021E9A94:
	mov r3, #1
	ldr r0, [r4]
	lsl r3, r3, #8
	add r1, r0, r3
	ldr r0, [sp, #4]
	sub r6, r1, r0
	cmp r6, r3
	ldr r0, [r5, #4]
	ble _021E9AD8
	mov r1, #0
	add r2, r1, #0
	bl ScheduleSetBgPosText
	mov r1, #4
	add r3, r1, #0
	ldr r0, [r5, #4]
	mov r2, #0
	add r3, #0xfc
	bl ScheduleSetBgPosText
	add r0, r5, #0
	bl ov18_021F2B9C
	mov r2, #1
	add r3, r0, #0
	lsl r2, r2, #8
	sub r2, r3, r2
	lsl r2, r2, #0x10
	add r0, r5, #0
	mov r1, #0
	asr r2, r2, #0x10
	bl ov18_021F2B70
	b _021E9BD4
_021E9AD8:
	mov r1, #0
	add r2, r1, #0
	add r3, r6, #0
	bl ScheduleSetBgPosText
	mov r1, #4
	add r3, r1, #0
	ldr r6, [r4]
	add r3, #0xfc
	add r6, r6, r3
	ldr r3, [sp, #4]
	ldr r0, [r5, #4]
	mov r2, #0
	sub r3, r6, r3
	bl ScheduleSetBgPosText
	add r0, r5, #0
	bl ov18_021F2B9C
	mov r2, #1
	add r3, r0, #0
	lsl r2, r2, #8
	add r0, r5, #0
	sub r5, r3, r2
	ldr r3, [r4]
	ldr r2, [sp, #4]
	mov r1, #0
	sub r2, r3, r2
	sub r2, r5, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl ov18_021F2B70
	b _021E9BD4
_021E9B1C:
	ldr r0, [r5, #4]
	mov r1, #0
	mov r2, #1
	mov r3, #0x10
	bl ScheduleSetBgPosText
	ldr r0, [r5, #4]
	mov r1, #4
	mov r2, #1
	mov r3, #0x10
	bl ScheduleSetBgPosText
	mov r1, #0
	add r2, r1, #0
	add r0, r5, #0
	sub r2, #0x10
	bl ov18_021F2B3C
	ldr r0, [r5, #4]
	mov r1, #0
	bl Bg_GetXpos
	mov r1, #1
	lsl r1, r1, #8
	cmp r0, r1
	ble _021E9BD4
	add r0, r5, #0
	bl ov18_021F8838
	add r4, r0, #0
	add r0, r5, #0
	bl ov18_021E659C
	cmp r4, #0
	beq _021E9B82
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #8
	bl ov18_021F24E0
	add r0, r5, #0
	add r1, r4, #0
	bl ov18_021E6D38
	cmp r0, #1
	bne _021E9B82
	add r0, r5, #0
	mov r1, #6
	mov r2, #1
	bl ov18_021F2A2C
_021E9B82:
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #6
	bl ov18_021EE638
	mov r1, #0
	mov r3, #1
	ldr r0, [r5, #4]
	add r2, r1, #0
	lsl r3, r3, #8
	bl ScheduleSetBgPosText
	mov r1, #4
	add r3, r1, #0
	ldr r0, [r5, #4]
	mov r2, #0
	add r3, #0xfc
	bl ScheduleSetBgPosText
	add r0, r5, #0
	bl ov18_021F2B9C
	mov r2, #1
	add r3, r0, #0
	lsl r2, r2, #8
	sub r2, r3, r2
	lsl r2, r2, #0x10
	add r0, r5, #0
	mov r1, #0
	asr r2, r2, #0x10
	bl ov18_021F2B70
	ldr r0, _021E9BDC ; =0x00000868
	mov r1, #0
	add r0, r5, r0
	mov r2, #0x10
	bl MI_CpuFill8
	add sp, #8
	mov r0, #0xb
	pop {r4, r5, r6, pc}
_021E9BD4:
	mov r0, #0x11
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_021E9BDC: .word 0x00000868
	thumb_func_end ov18_021E9A4C

	thumb_func_start ov18_021E9BE0
ov18_021E9BE0: ; 0x021E9BE0
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, _021E9CC4 ; =0x00000868
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _021E9BF4
	cmp r0, #1
	beq _021E9C66
	b _021E9CBC
_021E9BF4:
	ldr r0, [r4, #8]
	mov r1, #4
	bl sub_0201980C
	add r0, r4, #0
	mov r1, #6
	mov r2, #0
	bl ov18_021F2A2C
	add r0, r4, #0
	mov r1, #8
	mov r2, #0
	bl ov18_021F2A84
	add r0, r4, #0
	add r0, #0x6c
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	bl ov18_021E65D4
	mov r3, #0
	str r3, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0x85
	str r3, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r2, _021E9CC8 ; =0x0000FFFE
	mov r1, #1
	bl sub_02003370
	mov r3, #0
	str r3, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0x85
	str r3, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r2, _021E9CCC ; =0x0000FFFF
	mov r1, #0xe
	bl sub_02003370
	ldr r1, _021E9CD0 ; =0x0000085C
	mov r0, #0x12
	str r0, [r4, r1]
	add r0, r1, #0
	add r0, #0xc
	ldrb r0, [r4, r0]
	add r1, #0xc
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r4, r1]
	mov r0, #3
	pop {r3, r4, pc}
_021E9C66:
	ldr r0, [r4, #8]
	mov r1, #1
	bl sub_020199E4
	cmp r0, #0
	bne _021E9CBC
	mov r1, #0
	ldr r0, [r4, #4]
	add r2, r1, #0
	add r3, r1, #0
	bl ScheduleSetBgPosText
	mov r2, #0
	ldr r0, [r4, #4]
	mov r1, #4
	add r3, r2, #0
	bl ScheduleSetBgPosText
	mov r0, #0xf
	mov r1, #0x25
	bl sub_02003BA8
	add r0, r4, #0
	bl ov18_021EE388
	add r0, r4, #0
	bl ov18_021F2F00
	ldr r0, _021E9CC4 ; =0x00000868
	mov r2, #0
	strb r2, [r4, r0]
	ldr r0, _021E9CD4 ; =0x0000185B
	ldrb r1, [r4, r0]
	cmp r1, #5
	bne _021E9CB2
	add sp, #0xc
	mov r0, #0x15
	pop {r3, r4, pc}
_021E9CB2:
	add r0, #0x45
	strb r2, [r4, r0]
	add sp, #0xc
	mov r0, #0x42
	pop {r3, r4, pc}
_021E9CBC:
	mov r0, #0x12
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_021E9CC4: .word 0x00000868
_021E9CC8: .word 0x0000FFFE
_021E9CCC: .word 0x0000FFFF
_021E9CD0: .word 0x0000085C
_021E9CD4: .word 0x0000185B
	thumb_func_end ov18_021E9BE0

	thumb_func_start ov18_021E9CD8
ov18_021E9CD8: ; 0x021E9CD8
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r1, _021E9D64 ; =0x00000868
	add r4, r0, #0
	ldrb r1, [r4, r1]
	cmp r1, #0
	beq _021E9CEC
	cmp r1, #1
	beq _021E9D44
	b _021E9D5C
_021E9CEC:
	mov r1, #5
	bl ov18_021E67C8
	add r0, r4, #0
	bl ov18_021E65FC
	add r0, r4, #0
	mov r1, #0
	bl ov18_021F6DE0
	mov r0, #0x10
	str r0, [sp]
	mov r3, #0
	str r3, [sp, #4]
	mov r0, #0x85
	str r3, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r2, _021E9D68 ; =0x0000FFEF
	mov r1, #1
	bl sub_02003370
	mov r0, #0x10
	str r0, [sp]
	mov r3, #0
	str r3, [sp, #4]
	mov r0, #0x85
	str r3, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r2, _021E9D6C ; =0x0000FFFF
	mov r1, #0xe
	bl sub_02003370
	ldr r0, _021E9D64 ; =0x00000868
	add sp, #0xc
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	mov r1, #0x15
	sub r0, #0xc
	str r1, [r4, r0]
	mov r0, #3
	pop {r3, r4, pc}
_021E9D44:
	ldr r0, [r4, #8]
	mov r1, #6
	bl sub_020199E4
	cmp r0, #0
	bne _021E9D5C
	ldr r0, _021E9D64 ; =0x00000868
	mov r1, #0
	strb r1, [r4, r0]
	add sp, #0xc
	mov r0, #0x16
	pop {r3, r4, pc}
_021E9D5C:
	mov r0, #0x15
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_021E9D64: .word 0x00000868
_021E9D68: .word 0x0000FFEF
_021E9D6C: .word 0x0000FFFF
	thumb_func_end ov18_021E9CD8

	thumb_func_start ov18_021E9D70
ov18_021E9D70: ; 0x021E9D70
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	bl ov18_021F6E2C
	mov r2, #2
	mvn r2, r2
	cmp r0, r2
	bhi _021E9DB0
	bhs _021E9DBA
	cmp r0, #9
	bhi _021E9DA8
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E9D94: ; jump table
	.short _021E9DC2 - _021E9D94 - 2 ; case 0
	.short _021E9DE8 - _021E9D94 - 2 ; case 1
	.short _021E9E0E - _021E9D94 - 2 ; case 2
	.short _021E9E34 - _021E9D94 - 2 ; case 3
	.short _021E9E5A - _021E9D94 - 2 ; case 4
	.short _021E9E80 - _021E9D94 - 2 ; case 5
	.short _021E9EA6 - _021E9D94 - 2 ; case 6
	.short _021E9ECA - _021E9D94 - 2 ; case 7
	.short _021E9EE8 - _021E9D94 - 2 ; case 8
	.short _021E9F06 - _021E9D94 - 2 ; case 9
_021E9DA8:
	mov r1, #3
	mvn r1, r1
	cmp r0, r1
	b _021E9F1E
_021E9DB0:
	add r1, r2, #1
	cmp r0, r1
	bhi _021E9DBC
	bne _021E9DBA
	b _021E9F06
_021E9DBA:
	b _021E9F1E
_021E9DBC:
	add r1, r2, #2
	cmp r0, r1
	b _021E9F1E
_021E9DC2:
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_020183F0
	ldr r0, _021E9F24 ; =0x000008E9
	bl PlaySE
	mov r0, #2
	str r0, [sp]
	mov r0, #0x1c
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0x10
	mov r2, #1
	mov r3, #0xb
	bl ov18_021EDC00
	add sp, #8
	pop {r4, pc}
_021E9DE8:
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_020183F0
	ldr r0, _021E9F24 ; =0x000008E9
	bl PlaySE
	mov r0, #2
	str r0, [sp]
	mov r0, #0x1f
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #7
	mov r2, #4
	mov r3, #9
	bl ov18_021EDC00
	add sp, #8
	pop {r4, pc}
_021E9E0E:
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_020183F0
	ldr r0, _021E9F24 ; =0x000008E9
	bl PlaySE
	mov r0, #2
	str r0, [sp]
	mov r0, #0x22
	mov r1, #7
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r1, #0
	mov r3, #0x10
	bl ov18_021EDC00
	add sp, #8
	pop {r4, pc}
_021E9E34:
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_020183F0
	ldr r0, _021E9F24 ; =0x000008E9
	bl PlaySE
	mov r0, #2
	str r0, [sp]
	mov r0, #0x25
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #7
	mov r2, #0xa
	mov r3, #0xe
	bl ov18_021EDC00
	add sp, #8
	pop {r4, pc}
_021E9E5A:
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_020183F0
	ldr r0, _021E9F24 ; =0x000008E9
	bl PlaySE
	mov r0, #2
	str r0, [sp]
	mov r0, #0x2c
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #7
	mov r2, #0xd
	mov r3, #0x14
	bl ov18_021EDC00
	add sp, #8
	pop {r4, pc}
_021E9E80:
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_020183F0
	ldr r0, _021E9F24 ; =0x000008E9
	bl PlaySE
	mov r0, #2
	str r0, [sp]
	mov r0, #0x33
	mov r1, #7
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0x10
	add r3, r1, #0
	bl ov18_021EDC00
	add sp, #8
	pop {r4, pc}
_021E9EA6:
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_020183F0
	ldr r0, _021E9F24 ; =0x000008E9
	bl PlaySE
	mov r3, #4
	str r3, [sp]
	mov r0, #0x36
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0x1a
	mov r2, #7
	bl ov18_021EDC00
	add sp, #8
	pop {r4, pc}
_021E9ECA:
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_020183F0
	ldr r0, _021E9F24 ; =0x000008E9
	bl PlaySE
	add r0, r4, #0
	mov r1, #0
	mov r2, #0xa
	mov r3, #0x18
	bl ov18_021EDBDC
	add sp, #8
	pop {r4, pc}
_021E9EE8:
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_020183F0
	ldr r0, _021E9F24 ; =0x000008E9
	bl PlaySE
	add r0, r4, #0
	mov r1, #0xb
	mov r2, #0xa
	mov r3, #0x17
	bl ov18_021EDBDC
	add sp, #8
	pop {r4, pc}
_021E9F06:
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	mov r1, #0x16
	mov r2, #0xa
	mov r3, #0x19
	bl ov18_021EDBDC
	add sp, #8
	pop {r4, pc}
_021E9F1E:
	mov r0, #0x16
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_021E9F24: .word 0x000008E9
	thumb_func_end ov18_021E9D70

	thumb_func_start ov18_021E9F28
ov18_021E9F28: ; 0x021E9F28
	push {r3, r4, r5, lr}
	sub sp, #0x20
	ldr r1, _021EA274 ; =0x00000868
	add r4, r0, #0
	add r5, r4, r1
	ldrh r2, [r5]
	cmp r2, #0x12
	bls _021E9F3A
	b _021EA33C
_021E9F3A:
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_021E9F46: ; jump table
	.short _021E9F6C - _021E9F46 - 2 ; case 0
	.short _021E9FA2 - _021E9F46 - 2 ; case 1
	.short _021EA028 - _021E9F46 - 2 ; case 2
	.short _021EA036 - _021E9F46 - 2 ; case 3
	.short _021EA044 - _021E9F46 - 2 ; case 4
	.short _021EA052 - _021E9F46 - 2 ; case 5
	.short _021EA060 - _021E9F46 - 2 ; case 6
	.short _021EA06A - _021E9F46 - 2 ; case 7
	.short _021EA07C - _021E9F46 - 2 ; case 8
	.short _021EA0D0 - _021E9F46 - 2 ; case 9
	.short _021EA0F4 - _021E9F46 - 2 ; case 10
	.short _021EA1A0 - _021E9F46 - 2 ; case 11
	.short _021EA1C4 - _021E9F46 - 2 ; case 12
	.short _021EA22A - _021E9F46 - 2 ; case 13
	.short _021EA23E - _021E9F46 - 2 ; case 14
	.short _021EA29C - _021E9F46 - 2 ; case 15
	.short _021EA2C0 - _021E9F46 - 2 ; case 16
	.short _021EA2DE - _021E9F46 - 2 ; case 17
	.short _021EA314 - _021E9F46 - 2 ; case 18
_021E9F6C:
	mov r1, #0x1b
	mov r2, #2
	bl ov18_021F118C
	add r0, r4, #0
	mov r1, #0x1b
	mov r2, #1
	bl ov18_021F11C0
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #9
	bl ov18_021EEED0
	add r0, r4, #0
	bl ov18_021E6624
	ldr r0, _021EA278 ; =0x000005FE
	bl PlaySE
	mov r0, #1
	strh r0, [r5]
	b _021EA33C
_021E9FA2:
	ldr r3, _021EA27C ; =0x00001870
	mov r2, #1
	ldr r1, [r4, r3]
	str r1, [sp]
	add r1, r3, #4
	ldr r1, [r4, r1]
	str r1, [sp, #4]
	add r1, r3, #0
	add r1, #8
	ldr r1, [r4, r1]
	str r1, [sp, #8]
	add r1, r3, #0
	add r1, #0xc
	ldr r1, [r4, r1]
	str r1, [sp, #0xc]
	add r1, r3, #0
	add r1, #0x10
	ldr r1, [r4, r1]
	str r1, [sp, #0x10]
	add r1, r3, #0
	add r1, #0x14
	ldr r1, [r4, r1]
	str r1, [sp, #0x14]
	add r1, r3, #0
	add r1, #0x18
	ldr r1, [r4, r1]
	lsl r2, r1
	add r1, r3, #0
	str r2, [sp, #0x18]
	add r1, #0x1c
	ldr r1, [r4, r1]
	add r2, r3, #0
	str r1, [sp, #0x1c]
	add r1, r3, #0
	sub r1, #0x18
	sub r2, #8
	sub r3, r3, #4
	ldrb r1, [r4, r1]
	ldr r2, [r4, r2]
	ldr r3, [r4, r3]
	bl ov18_021F7ED4
	ldr r0, _021EA280 ; =0x0000102E
	ldrh r1, [r4, r0]
	cmp r1, #0
	bne _021EA00C
	sub r0, r0, #2
	ldrh r0, [r4, r0]
	cmp r0, #0
	bne _021EA00C
	mov r0, #0xf
	strh r0, [r5]
	b _021EA33C
_021EA00C:
	add r0, r4, #0
	mov r1, #0
	bl ov18_021F8884
	ldr r0, _021EA284 ; =0x0000185A
	mov r2, #0
	strb r2, [r4, r0]
	sub r1, r0, #1
	strb r2, [r4, r1]
	mov r1, #2
	add r0, r0, #2
	strb r1, [r4, r0]
	strh r1, [r5]
	b _021EA33C
_021EA028:
	mov r1, #0
	mov r2, #9
	bl ov18_021EA350
	mov r0, #3
	strh r0, [r5]
	b _021EA33C
_021EA036:
	mov r1, #2
	mov r2, #0xa
	bl ov18_021EA350
	mov r0, #4
	strh r0, [r5]
	b _021EA33C
_021EA044:
	mov r1, #0
	mov r2, #0xb
	bl ov18_021EA350
	mov r0, #5
	strh r0, [r5]
	b _021EA33C
_021EA052:
	mov r1, #2
	mov r2, #0xc
	bl ov18_021EA350
	mov r0, #6
	strh r0, [r5]
	b _021EA33C
_021EA060:
	bl ov18_021EFEC4
	mov r0, #7
	strh r0, [r5]
	b _021EA33C
_021EA06A:
	mov r1, #0x3b
	bl ov18_021F1620
	add r0, r4, #0
	bl ov18_021E6CC0
	mov r0, #8
	strh r0, [r5]
	b _021EA33C
_021EA07C:
	mov r1, #0x12
	mov r2, #1
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #0x13
	mov r2, #1
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #0x14
	mov r2, #1
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #0x15
	mov r2, #1
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #0x19
	mov r2, #1
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #0x12
	mov r2, #0
	bl ov18_021F2C5C
	add r0, r4, #0
	mov r1, #0x12
	mov r2, #0
	bl ov18_021F2E80
	add r0, r4, #0
	mov r1, #0x13
	mov r2, #0
	bl ov18_021F2C10
	mov r0, #9
	strh r0, [r5]
	b _021EA33C
_021EA0D0:
	mov r1, #0x1b
	bl ov18_021F11AC
	cmp r0, #0
	bne _021EA100
	add r0, r4, #0
	mov r1, #0x1a
	mov r2, #1
	bl ov18_021F118C
	add r0, r4, #0
	mov r1, #0x1b
	mov r2, #0
	bl ov18_021F11C0
	mov r0, #0xa
	strh r0, [r5]
	b _021EA33C
_021EA0F4:
	ldrh r1, [r5, #2]
	add r1, r1, #1
	strh r1, [r5, #2]
	ldrh r1, [r5, #2]
	cmp r1, #0x20
	beq _021EA102
_021EA100:
	b _021EA33C
_021EA102:
	mov r1, #1
	bl ov18_021EEED0
	add r0, r4, #0
	bl ov18_021F3BA4
	mov r1, #7
	add r0, r4, #0
	mvn r1, r1
	bl ov18_021F3BD4
	mov r0, #1
	bl ov18_021E7B6C
	mov r2, #0
	ldr r0, [r4, #8]
	mov r1, #9
	add r3, r2, #0
	bl sub_020196E8
	mov r2, #0
	ldr r0, [r4, #8]
	mov r1, #0xa
	add r3, r2, #0
	bl sub_020196E8
	ldr r0, [r4, #8]
	mov r1, #0xb
	mov r2, #0
	mov r3, #0x18
	bl sub_020196E8
	ldr r0, [r4, #8]
	mov r1, #0xc
	mov r2, #0
	mov r3, #0x18
	bl sub_020196E8
	mov r0, #0x18
	str r0, [sp]
	mov r2, #0
	ldr r0, [r4, #8]
	mov r1, #9
	sub r3, r2, #1
	bl sub_020198FC
	mov r0, #0x18
	str r0, [sp]
	mov r2, #0
	ldr r0, [r4, #8]
	mov r1, #0xa
	sub r3, r2, #1
	bl sub_020198FC
	mov r0, #0x18
	str r0, [sp]
	mov r2, #0
	ldr r0, [r4, #8]
	mov r1, #0xb
	sub r3, r2, #1
	bl sub_020198FC
	mov r0, #0x18
	str r0, [sp]
	mov r2, #0
	ldr r0, [r4, #8]
	mov r1, #0xc
	sub r3, r2, #1
	bl sub_020198FC
	mov r0, #0x8f
	lsl r0, r0, #4
	bl PlaySE
	mov r0, #0
	strh r0, [r5, #2]
	mov r0, #0xb
	strh r0, [r5]
	b _021EA33C
_021EA1A0:
	ldr r0, [r4, #8]
	mov r1, #9
	bl sub_020199E4
	cmp r0, #0
	bne _021EA1B8
	mov r0, #0
	bl ov18_021E7B6C
	mov r0, #0xc
	strh r0, [r5]
	b _021EA33C
_021EA1B8:
	mov r1, #7
	add r0, r4, #0
	mvn r1, r1
	bl ov18_021F3BD4
	b _021EA33C
_021EA1C4:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	sub r1, #0x14
	ldr r0, [r4, r1]
	ldr r2, [r4, #4]
	mov r1, #4
	mov r3, #2
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021EA288 ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x13
	mov r3, #7
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021EA288 ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x14
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add r0, r4, #0
	bl ov18_021E669C
	add r0, r4, #0
	bl ov18_021F3448
	mov r0, #0xd
	strh r0, [r5]
	b _021EA33C
_021EA22A:
	ldr r0, [r4, #8]
	mov r1, #8
	bl sub_020199E4
	cmp r0, #0
	beq _021EA238
	b _021EA33C
_021EA238:
	mov r0, #0xe
	strh r0, [r5]
	b _021EA33C
_021EA23E:
	bl ov18_021F7B74
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #0
	bl ov18_021F2BB0
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	bl ov18_021F118C
	add r0, r4, #0
	bl ov18_021F3190
	add r0, r4, #0
	bl ov18_021EDEB0
	add r0, r4, #0
	bl ov18_021E659C
	ldr r0, _021EA274 ; =0x00000868
	b _021EA28C
	.balign 4, 0
_021EA274: .word 0x00000868
_021EA278: .word 0x000005FE
_021EA27C: .word 0x00001870
_021EA280: .word 0x0000102E
_021EA284: .word 0x0000185A
_021EA288: .word 0x00000854
_021EA28C:
	mov r1, #0
	add r0, r4, r0
	mov r2, #0x10
	bl MI_CpuFill8
	add sp, #0x20
	mov r0, #0x39
	pop {r3, r4, r5, pc}
_021EA29C:
	mov r1, #0x1b
	bl ov18_021F11AC
	cmp r0, #0
	bne _021EA33C
	add r0, r4, #0
	mov r1, #0x1a
	mov r2, #3
	bl ov18_021F118C
	add r0, r4, #0
	mov r1, #0x1b
	mov r2, #0
	bl ov18_021F11C0
	mov r0, #0x10
	strh r0, [r5]
	b _021EA33C
_021EA2C0:
	mov r1, #0x1a
	bl ov18_021F11AC
	cmp r0, #0
	bne _021EA33C
	add r0, r4, #0
	mov r1, #0xa
	bl ov18_021EEED0
	ldr r0, _021EA344 ; =0x000005F2
	bl PlaySE
	mov r0, #0x11
	strh r0, [r5]
	b _021EA33C
_021EA2DE:
	ldrh r0, [r5, #2]
	add r0, r0, #1
	strh r0, [r5, #2]
	ldr r0, _021EA348 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	bne _021EA2FC
	bl System_GetTouchNew
	cmp r0, #1
	beq _021EA2FC
	ldrh r0, [r5, #2]
	cmp r0, #0x3c
	bne _021EA33C
_021EA2FC:
	add r0, r4, #0
	mov r1, #0
	bl ov18_021EEED0
	add r0, r4, #0
	bl ov18_021E65FC
	mov r0, #0
	strh r0, [r5, #2]
	mov r0, #0x12
	strh r0, [r5]
	b _021EA33C
_021EA314:
	ldr r0, [r4, #8]
	mov r1, #6
	bl sub_020199E4
	cmp r0, #0
	bne _021EA33C
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	bl ov18_021F11C0
	ldr r0, _021EA34C ; =0x00000868
	mov r1, #0
	add r0, r4, r0
	mov r2, #0x10
	bl MI_CpuFill8
	add sp, #0x20
	mov r0, #0x16
	pop {r3, r4, r5, pc}
_021EA33C:
	mov r0, #0x17
	add sp, #0x20
	pop {r3, r4, r5, pc}
	nop
_021EA344: .word 0x000005F2
_021EA348: .word gSystem
_021EA34C: .word 0x00000868
	thumb_func_end ov18_021E9F28

	thumb_func_start ov18_021EA350
ov18_021EA350: ; 0x021EA350
	push {r3, r4, r5, lr}
	add r5, r0, #0
	lsl r1, r1, #0x18
	ldr r0, [r5, #4]
	lsr r1, r1, #0x18
	add r4, r2, #0
	bl GetBgTilemapBuffer
	add r2, r0, #0
	ldr r0, [r5, #8]
	add r1, r4, #0
	bl sub_02019668
	pop {r3, r4, r5, pc}
	thumb_func_end ov18_021EA350

	thumb_func_start ov18_021EA36C
ov18_021EA36C: ; 0x021EA36C
	push {r4, lr}
	add r4, r0, #0
	bl ov18_021E6FFC
	add r0, r4, #0
	bl ov18_021EF528
	add r0, r4, #0
	bl ov18_021F3494
	mov r0, #0x16
	pop {r4, pc}
	thumb_func_end ov18_021EA36C

	thumb_func_start ov18_021EA384
ov18_021EA384: ; 0x021EA384
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r1, _021EA420 ; =0x00000868
	add r4, r0, #0
	ldrb r1, [r4, r1]
	cmp r1, #0
	beq _021EA398
	cmp r1, #1
	beq _021EA3EE
	b _021EA41A
_021EA398:
	mov r1, #0
	add r2, r1, #0
	bl ov18_021F11C0
	add r0, r4, #0
	bl ov18_021E6624
	mov r3, #0
	str r3, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0x85
	str r3, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r2, _021EA424 ; =0x0000FFEF
	mov r1, #1
	bl sub_02003370
	mov r3, #0
	str r3, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0x85
	str r3, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r2, _021EA428 ; =0x0000FFFF
	mov r1, #0xe
	bl sub_02003370
	ldr r1, _021EA42C ; =0x0000085C
	mov r0, #0x19
	str r0, [r4, r1]
	add r0, r1, #0
	add r0, #0xc
	ldrb r0, [r4, r0]
	add r1, #0xc
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r4, r1]
	mov r0, #3
	pop {r3, r4, pc}
_021EA3EE:
	mov r0, #0xf
	mov r1, #0x25
	bl sub_02003BA8
	add r0, r4, #0
	bl ov18_021F7B74
	add r0, r4, #0
	bl ov18_021EE388
	add r0, r4, #0
	bl ov18_021F3438
	add r0, r4, #0
	bl ov18_021F3448
	ldr r0, _021EA420 ; =0x00000868
	mov r1, #0
	strb r1, [r4, r0]
	add sp, #0xc
	mov r0, #0x13
	pop {r3, r4, pc}
_021EA41A:
	mov r0, #0x19
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_021EA420: .word 0x00000868
_021EA424: .word 0x0000FFEF
_021EA428: .word 0x0000FFFF
_021EA42C: .word 0x0000085C
	thumb_func_end ov18_021EA384

	thumb_func_start ov18_021EA430
ov18_021EA430: ; 0x021EA430
	push {r3, r4, r5, lr}
	sub sp, #0x20
	ldr r1, _021EA590 ; =0x00000868
	add r4, r0, #0
	ldrb r1, [r4, r1]
	cmp r1, #0
	beq _021EA448
	cmp r1, #1
	beq _021EA47E
	cmp r1, #2
	beq _021EA536
	b _021EA588
_021EA448:
	mov r1, #0x11
	str r1, [sp]
	str r1, [sp, #4]
	mov r2, #0
	str r2, [sp, #8]
	mov r1, #0x98
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	str r1, [sp, #0x14]
	mov r1, #8
	str r1, [sp, #0x18]
	mov r1, #0xe
	str r1, [sp, #0x1c]
	ldr r1, _021EA594 ; =0x00001858
	mov r3, #0x1a
	ldrb r1, [r4, r1]
	bl ov18_021F7ED4
	add r0, r4, #0
	mov r1, #1
	bl ov18_021F8884
	ldr r0, _021EA590 ; =0x00000868
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _021EA588
_021EA47E:
	mov r1, #0
	bl ov18_021E67C8
	add r0, r4, #0
	bl ov18_021F8824
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl ov18_021F891C
	cmp r5, r0
	blo _021EA4B8
	ldr r2, _021EA598 ; =0x00000854
	ldr r0, [r4, #4]
	ldr r2, [r4, r2]
	mov r1, #7
	mov r3, #0x25
	bl ov18_021E6FB8
	add r0, r4, #0
	add r0, #0x7c
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	mov r1, #0xa
	mov r2, #0
	bl ov18_021F11C0
_021EA4B8:
	ldr r0, [r4, #8]
	mov r1, #0
	bl sub_0201980C
	add r0, r4, #0
	bl ov18_021E65AC
	mov r1, #0
	mov r3, #1
	ldr r0, [r4, #4]
	add r2, r1, #0
	lsl r3, r3, #8
	bl ScheduleSetBgPosText
	mov r1, #4
	add r3, r1, #0
	ldr r0, [r4, #4]
	mov r2, #0
	add r3, #0xfc
	bl ScheduleSetBgPosText
	mov r2, #0xff
	add r0, r4, #0
	mov r1, #0
	mvn r2, r2
	bl ov18_021F2B3C
	mov r0, #0x10
	str r0, [sp]
	mov r3, #0
	str r3, [sp, #4]
	mov r0, #0x85
	str r3, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r2, _021EA59C ; =0x0000FFFE
	mov r1, #1
	bl sub_02003370
	mov r0, #0x10
	str r0, [sp]
	mov r3, #0
	str r3, [sp, #4]
	mov r0, #0x85
	str r3, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r2, _021EA5A0 ; =0x0000FFFF
	mov r1, #0xe
	bl sub_02003370
	ldr r1, _021EA5A4 ; =0x0000085C
	mov r0, #0x13
	str r0, [r4, r1]
	add r0, r1, #0
	add r0, #0xc
	ldrb r0, [r4, r0]
	add r1, #0xc
	add sp, #0x20
	add r0, r0, #1
	strb r0, [r4, r1]
	mov r0, #3
	pop {r3, r4, r5, pc}
_021EA536:
	bl ov18_021F8838
	add r5, r0, #0
	add r0, r4, #0
	bl ov18_021E659C
	cmp r5, #0
	beq _021EA552
	add r0, r4, #0
	mov r1, #8
	mov r2, #1
	bl ov18_021F2A84
	b _021EA55C
_021EA552:
	add r0, r4, #0
	mov r1, #8
	mov r2, #0
	bl ov18_021F2A84
_021EA55C:
	add r0, r4, #0
	add r1, r5, #0
	bl ov18_021E6D38
	cmp r0, #1
	bne _021EA572
	add r0, r4, #0
	mov r1, #6
	mov r2, #1
	bl ov18_021F2A2C
_021EA572:
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #6
	bl ov18_021EE638
	ldr r0, _021EA590 ; =0x00000868
	mov r1, #0
	strb r1, [r4, r0]
	add sp, #0x20
	mov r0, #0xb
	pop {r3, r4, r5, pc}
_021EA588:
	mov r0, #0x13
	add sp, #0x20
	pop {r3, r4, r5, pc}
	nop
_021EA590: .word 0x00000868
_021EA594: .word 0x00001858
_021EA598: .word 0x00000854
_021EA59C: .word 0x0000FFFE
_021EA5A0: .word 0x0000FFFF
_021EA5A4: .word 0x0000085C
	thumb_func_end ov18_021EA430

	thumb_func_start ov18_021EA5A8
ov18_021EA5A8: ; 0x021EA5A8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021EA680 ; =0x00000868
	add r4, r5, r0
	ldrh r0, [r4]
	cmp r0, #0
	beq _021EA5BC
	cmp r0, #1
	beq _021EA5F0
	b _021EA67C
_021EA5BC:
	ldr r0, [r5, #8]
	mov r1, #4
	bl sub_0201980C
	add r0, r5, #0
	mov r1, #6
	mov r2, #0
	bl ov18_021F2A2C
	add r0, r5, #0
	mov r1, #8
	mov r2, #0
	bl ov18_021F2A84
	add r0, r5, #0
	add r0, #0x6c
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r5, #0
	bl ov18_021E65D4
	mov r0, #0
	strb r0, [r4, #2]
	ldrh r0, [r4]
	add r0, r0, #1
	strh r0, [r4]
_021EA5F0:
	ldrb r0, [r4, #2]
	cmp r0, #0xa
	bne _021EA600
	add r0, r5, #0
	mov r1, #0x5d
	bl ov18_021EDB3C
	b _021EA620
_021EA600:
	bls _021EA620
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021EA620
	ldr r0, _021EA680 ; =0x00000868
	mov r1, #0
	add r0, r5, r0
	mov r2, #0x10
	bl MI_CpuFill8
	ldr r0, _021EA684 ; =0x0000085C
	mov r1, #0x5d
	str r1, [r5, r0]
	mov r0, #1
	pop {r3, r4, r5, pc}
_021EA620:
	ldrb r0, [r4, #2]
	mov r1, #0
	add r0, r0, #1
	strb r0, [r4, #2]
	ldr r0, [r5, #4]
	bl Bg_GetXpos
	cmp r0, #0
	ldr r0, [r5, #4]
	bne _021EA65C
	mov r1, #0
	add r2, r1, #0
	add r3, r1, #0
	bl ScheduleSetBgPosText
	mov r2, #0
	ldr r0, [r5, #4]
	mov r1, #4
	add r3, r2, #0
	bl ScheduleSetBgPosText
	add r0, r5, #0
	bl ov18_021F2B9C
	add r2, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl ov18_021F2B70
	b _021EA67C
_021EA65C:
	mov r1, #0
	mov r2, #2
	mov r3, #0x10
	bl ScheduleSetBgPosText
	ldr r0, [r5, #4]
	mov r1, #4
	mov r2, #2
	mov r3, #0x10
	bl ScheduleSetBgPosText
	add r0, r5, #0
	mov r1, #0
	mov r2, #0x10
	bl ov18_021F2B3C
_021EA67C:
	mov r0, #0x14
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EA680: .word 0x00000868
_021EA684: .word 0x0000085C
	thumb_func_end ov18_021EA5A8

	thumb_func_start ov18_021EA688
ov18_021EA688: ; 0x021EA688
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r1, _021EA750 ; =0x00000868
	add r5, r0, #0
	add r4, r5, r1
	ldrb r1, [r4, #2]
	cmp r1, #0
	beq _021EA69E
	cmp r1, #1
	beq _021EA6EE
	b _021EA74A
_021EA69E:
	mov r1, #0
	add r2, r1, #0
	bl ov18_021F11C0
	add r0, r5, #0
	bl ov18_021E6624
	mov r3, #0
	str r3, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0x85
	str r3, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	ldr r2, _021EA754 ; =0x0000FFEF
	mov r1, #1
	bl sub_02003370
	mov r3, #0
	str r3, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0x85
	str r3, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	ldr r2, _021EA758 ; =0x0000FFFF
	mov r1, #0xe
	bl sub_02003370
	ldr r0, _021EA75C ; =0x0000085C
	mov r1, #0x1a
	str r1, [r5, r0]
	ldrb r0, [r4, #2]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r4, #2]
	mov r0, #3
	pop {r4, r5, pc}
_021EA6EE:
	bl ov18_021F7B74
	add r0, r5, #0
	bl ov18_021E664C
	ldrb r1, [r4]
	ldrb r2, [r4, #3]
	add r0, r5, #0
	bl ov18_021E71D0
	mov r0, #0x10
	str r0, [sp]
	mov r3, #0
	str r3, [sp, #4]
	mov r0, #0x85
	str r3, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	ldr r2, _021EA754 ; =0x0000FFEF
	mov r1, #1
	bl sub_02003370
	mov r0, #0x10
	str r0, [sp]
	mov r3, #0
	str r3, [sp, #4]
	mov r0, #0x85
	str r3, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	ldr r2, _021EA758 ; =0x0000FFFF
	mov r1, #0xe
	bl sub_02003370
	ldrb r1, [r4, #1]
	ldr r0, _021EA75C ; =0x0000085C
	mov r2, #0x10
	str r1, [r5, r0]
	add r0, #0xc
	add r0, r5, r0
	mov r1, #0
	bl MI_CpuFill8
	add sp, #0xc
	mov r0, #3
	pop {r4, r5, pc}
_021EA74A:
	mov r0, #0x1a
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_021EA750: .word 0x00000868
_021EA754: .word 0x0000FFEF
_021EA758: .word 0x0000FFFF
_021EA75C: .word 0x0000085C
	thumb_func_end ov18_021EA688

	thumb_func_start ov18_021EA760
ov18_021EA760: ; 0x021EA760
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r1, _021EA828 ; =0x00000868
	add r5, r0, #0
	add r4, r5, r1
	ldrb r1, [r4, #2]
	cmp r1, #0
	beq _021EA776
	cmp r1, #1
	beq _021EA7C6
	b _021EA822
_021EA776:
	mov r1, #0
	add r2, r1, #0
	bl ov18_021F11C0
	add r0, r5, #0
	bl ov18_021E6674
	mov r3, #0
	str r3, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0x85
	str r3, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	ldr r2, _021EA82C ; =0x0000FFEF
	mov r1, #1
	bl sub_02003370
	mov r3, #0
	str r3, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0x85
	str r3, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	ldr r2, _021EA830 ; =0x0000FFFF
	mov r1, #0xe
	bl sub_02003370
	ldr r0, _021EA834 ; =0x0000085C
	mov r1, #0x1b
	str r1, [r5, r0]
	ldrb r0, [r4, #2]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r4, #2]
	mov r0, #3
	pop {r4, r5, pc}
_021EA7C6:
	bl ov18_021F7B74
	add r0, r5, #0
	bl ov18_021E65FC
	ldrb r2, [r4, #3]
	add r0, r5, #0
	mov r1, #0
	bl ov18_021E71D0
	mov r0, #0x10
	str r0, [sp]
	mov r3, #0
	str r3, [sp, #4]
	mov r0, #0x85
	str r3, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	ldr r2, _021EA82C ; =0x0000FFEF
	mov r1, #1
	bl sub_02003370
	mov r0, #0x10
	str r0, [sp]
	mov r3, #0
	str r3, [sp, #4]
	mov r0, #0x85
	str r3, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	ldr r2, _021EA830 ; =0x0000FFFF
	mov r1, #0xe
	bl sub_02003370
	ldrb r1, [r4, #1]
	ldr r0, _021EA834 ; =0x0000085C
	mov r2, #0x10
	str r1, [r5, r0]
	add r0, #0xc
	add r0, r5, r0
	mov r1, #0
	bl MI_CpuFill8
	add sp, #0xc
	mov r0, #3
	pop {r4, r5, pc}
_021EA822:
	mov r0, #0x1b
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_021EA828: .word 0x00000868
_021EA82C: .word 0x0000FFEF
_021EA830: .word 0x0000FFFF
_021EA834: .word 0x0000085C
	thumb_func_end ov18_021EA760

	thumb_func_start ov18_021EA838
ov18_021EA838: ; 0x021EA838
	push {r3, lr}
	ldr r1, _021EA850 ; =0x00001868
	mov r3, #0x1d
	ldr r2, [r0, r1]
	add r1, #0x28
	str r2, [r0, r1]
	mov r1, #1
	mov r2, #0
	bl ov18_021EDE4C
	mov r0, #0x1a
	pop {r3, pc}
	.balign 4, 0
_021EA850: .word 0x00001868
	thumb_func_end ov18_021EA838

	thumb_func_start ov18_021EA854
ov18_021EA854: ; 0x021EA854
	push {r4, lr}
	add r4, r0, #0
	bl ov18_021F6F08
	cmp r0, #7
	bhi _021EA87C
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021EA86C: ; jump table
	.short _021EA886 - _021EA86C - 2 ; case 0
	.short _021EA89E - _021EA86C - 2 ; case 1
	.short _021EA8B6 - _021EA86C - 2 ; case 2
	.short _021EA8CE - _021EA86C - 2 ; case 3
	.short _021EA8E6 - _021EA86C - 2 ; case 4
	.short _021EA8FE - _021EA86C - 2 ; case 5
	.short _021EA916 - _021EA86C - 2 ; case 6
	.short _021EA932 - _021EA86C - 2 ; case 7
_021EA87C:
	mov r1, #1
	mvn r1, r1
	cmp r0, r1
	beq _021EA932
	b _021EA950
_021EA886:
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_020183F0
	ldr r0, _021EA954 ; =0x000008E9
	bl PlaySE
	add r0, r4, #0
	mov r1, #0
	bl ov18_021E74B8
	b _021EA950
_021EA89E:
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_020183F0
	ldr r0, _021EA954 ; =0x000008E9
	bl PlaySE
	add r0, r4, #0
	mov r1, #1
	bl ov18_021E74B8
	b _021EA950
_021EA8B6:
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_020183F0
	ldr r0, _021EA954 ; =0x000008E9
	bl PlaySE
	add r0, r4, #0
	mov r1, #2
	bl ov18_021E74B8
	b _021EA950
_021EA8CE:
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_020183F0
	ldr r0, _021EA954 ; =0x000008E9
	bl PlaySE
	add r0, r4, #0
	mov r1, #3
	bl ov18_021E74B8
	b _021EA950
_021EA8E6:
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_020183F0
	ldr r0, _021EA954 ; =0x000008E9
	bl PlaySE
	add r0, r4, #0
	mov r1, #4
	bl ov18_021E74B8
	b _021EA950
_021EA8FE:
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_020183F0
	ldr r0, _021EA954 ; =0x000008E9
	bl PlaySE
	add r0, r4, #0
	mov r1, #5
	bl ov18_021E74B8
	b _021EA950
_021EA916:
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_020183F0
	ldr r0, _021EA954 ; =0x000008E9
	bl PlaySE
	add r0, r4, #0
	mov r1, #0
	mov r2, #0xa
	mov r3, #0x1e
	bl ov18_021EDBDC
	pop {r4, pc}
_021EA932:
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	ldr r0, _021EA958 ; =0x00001890
	mov r2, #0xa
	ldr r1, [r4, r0]
	sub r0, #0x28
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #0x16
	mov r3, #0x1e
	bl ov18_021EDBDC
	pop {r4, pc}
_021EA950:
	mov r0, #0x1d
	pop {r4, pc}
	.balign 4, 0
_021EA954: .word 0x000008E9
_021EA958: .word 0x00001890
	thumb_func_end ov18_021EA854

	thumb_func_start ov18_021EA95C
ov18_021EA95C: ; 0x021EA95C
	push {r3, lr}
	mov r1, #0
	add r2, r1, #0
	mov r3, #0x16
	bl ov18_021EDE4C
	mov r0, #0x1b
	pop {r3, pc}
	thumb_func_end ov18_021EA95C

	thumb_func_start ov18_021EA96C
ov18_021EA96C: ; 0x021EA96C
	push {r3, lr}
	ldr r1, _021EA984 ; =0x0000186C
	mov r3, #0x20
	ldr r2, [r0, r1]
	add r1, #0x24
	str r2, [r0, r1]
	mov r1, #2
	mov r2, #0
	bl ov18_021EDE4C
	mov r0, #0x1a
	pop {r3, pc}
	.balign 4, 0
_021EA984: .word 0x0000186C
	thumb_func_end ov18_021EA96C

	thumb_func_start ov18_021EA988
ov18_021EA988: ; 0x021EA988
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov18_021F6FE8
	mov r1, #3
	add r4, r0, #0
	mvn r1, r1
	cmp r4, r1
	bhi _021EA9AC
	bhs _021EAA12
	cmp r4, #0x1c
	bhi _021EA9FC
	cmp r4, #0x1b
	blo _021EA9FC
	beq _021EA9C2
	cmp r4, #0x1c
	beq _021EA9DE
	b _021EA9FC
_021EA9AC:
	add r0, r1, #1
	cmp r4, r0
	blo _021EA9FC
	beq _021EAA12
	add r0, r1, #2
	cmp r4, r0
	beq _021EA9DE
	add r0, r1, #3
	cmp r4, r0
	beq _021EAA12
	b _021EA9FC
_021EA9C2:
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_020183F0
	ldr r0, _021EAA18 ; =0x000008E9
	bl PlaySE
	add r0, r5, #0
	mov r1, #0
	mov r2, #0xa
	mov r3, #0x21
	bl ov18_021EDBDC
	pop {r3, r4, r5, pc}
_021EA9DE:
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	ldr r0, _021EAA1C ; =0x00001890
	mov r2, #0xa
	ldr r1, [r5, r0]
	sub r0, #0x24
	str r1, [r5, r0]
	add r0, r5, #0
	mov r1, #0x16
	mov r3, #0x21
	bl ov18_021EDBDC
	pop {r3, r4, r5, pc}
_021EA9FC:
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_020183F0
	ldr r0, _021EAA18 ; =0x000008E9
	bl PlaySE
	add r0, r5, #0
	add r1, r4, #0
	bl ov18_021E76EC
_021EAA12:
	mov r0, #0x20
	pop {r3, r4, r5, pc}
	nop
_021EAA18: .word 0x000008E9
_021EAA1C: .word 0x00001890
	thumb_func_end ov18_021EA988

	thumb_func_start ov18_021EAA20
ov18_021EAA20: ; 0x021EAA20
	push {r3, lr}
	mov r1, #0
	mov r2, #1
	mov r3, #0x16
	bl ov18_021EDE4C
	mov r0, #0x1b
	pop {r3, pc}
	thumb_func_end ov18_021EAA20

	thumb_func_start ov18_021EAA30
ov18_021EAA30: ; 0x021EAA30
	push {r3, lr}
	ldr r2, _021EAA54 ; =0x00001870
	add r1, r2, #0
	ldr r3, [r0, r2]
	add r1, #0x20
	str r3, [r0, r1]
	add r1, r2, #4
	ldr r1, [r0, r1]
	add r2, #0x24
	str r1, [r0, r2]
	mov r1, #3
	mov r2, #0
	mov r3, #0x23
	bl ov18_021EDE4C
	mov r0, #0x1a
	pop {r3, pc}
	nop
_021EAA54: .word 0x00001870
	thumb_func_end ov18_021EAA30

	thumb_func_start ov18_021EAA58
ov18_021EAA58: ; 0x021EAA58
	push {r4, lr}
	add r4, r0, #0
	bl ov18_021F716C
	mov r2, #3
	mvn r2, r2
	cmp r0, r2
	bhi _021EAA7A
	bhs _021EAB68
	cmp r0, #0x13
	bhi _021EAAE6
	cmp r0, #0x12
	blo _021EAAE6
	beq _021EAA90
	cmp r0, #0x13
	beq _021EAABE
	b _021EAAE6
_021EAA7A:
	add r1, r2, #1
	cmp r0, r1
	blo _021EAAE6
	beq _021EAB68
	add r1, r2, #2
	cmp r0, r1
	beq _021EAABE
	add r1, r2, #3
	cmp r0, r1
	beq _021EAB68
	b _021EAAE6
_021EAA90:
	ldr r0, _021EAB6C ; =0x00001870
	add r1, r0, #4
	ldr r2, [r4, r0]
	ldr r1, [r4, r1]
	cmp r2, r1
	bne _021EAAA2
	mov r1, #0x11
	add r0, r0, #4
	str r1, [r4, r0]
_021EAAA2:
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_020183F0
	ldr r0, _021EAB70 ; =0x000008E9
	bl PlaySE
	add r0, r4, #0
	mov r1, #0
	mov r2, #0xa
	mov r3, #0x24
	bl ov18_021EDBDC
	pop {r4, pc}
_021EAABE:
	ldr r1, _021EAB74 ; =0x00001890
	add r0, r1, #0
	ldr r2, [r4, r1]
	sub r0, #0x20
	str r2, [r4, r0]
	add r0, r1, #4
	ldr r0, [r4, r0]
	sub r1, #0x1c
	str r0, [r4, r1]
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	mov r1, #0x16
	mov r2, #0xa
	mov r3, #0x24
	bl ov18_021EDBDC
	pop {r4, pc}
_021EAAE6:
	cmp r0, #0x11
	bne _021EAAFC
	ldr r1, _021EAB78 ; =0x00001874
	ldr r2, [r4, r1]
	cmp r2, #0x11
	beq _021EAAF6
	str r0, [r4, r1]
	b _021EAB24
_021EAAF6:
	sub r1, r1, #4
	str r0, [r4, r1]
	b _021EAB24
_021EAAFC:
	ldr r2, _021EAB6C ; =0x00001870
	ldr r3, [r4, r2]
	cmp r3, #0x11
	bne _021EAB08
	str r0, [r4, r2]
	b _021EAB24
_021EAB08:
	add r1, r2, #4
	ldr r1, [r4, r1]
	cmp r1, #0x11
	bne _021EAB1A
	cmp r3, r0
	beq _021EAB68
	add r1, r2, #4
	str r0, [r4, r1]
	b _021EAB24
_021EAB1A:
	cmp r1, r0
	beq _021EAB68
	str r1, [r4, r2]
	add r1, r2, #4
	str r0, [r4, r1]
_021EAB24:
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_020183F0
	ldr r0, _021EAB70 ; =0x000008E9
	bl PlaySE
	add r0, r4, #0
	bl ov18_021E74E4
	ldr r1, _021EAB6C ; =0x00001870
	add r0, r4, #0
	ldr r1, [r4, r1]
	mov r2, #0x2d
	mov r3, #0x1d
	bl ov18_021EFC9C
	ldr r1, _021EAB78 ; =0x00001874
	add r0, r4, #0
	ldr r1, [r4, r1]
	mov r2, #0x2e
	mov r3, #0x23
	bl ov18_021EFC9C
	mov r0, #0xb7
	lsl r0, r0, #2
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	mov r0, #0xbb
	lsl r0, r0, #2
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
_021EAB68:
	mov r0, #0x23
	pop {r4, pc}
	.balign 4, 0
_021EAB6C: .word 0x00001870
_021EAB70: .word 0x000008E9
_021EAB74: .word 0x00001890
_021EAB78: .word 0x00001874
	thumb_func_end ov18_021EAA58

	thumb_func_start ov18_021EAB7C
ov18_021EAB7C: ; 0x021EAB7C
	push {r3, lr}
	mov r1, #0
	mov r2, #2
	mov r3, #0x16
	bl ov18_021EDE4C
	mov r0, #0x1b
	pop {r3, pc}
	thumb_func_end ov18_021EAB7C

	thumb_func_start ov18_021EAB8C
ov18_021EAB8C: ; 0x021EAB8C
	push {r3, lr}
	ldr r2, _021EABB0 ; =0x00001878
	add r1, r2, #0
	ldr r3, [r0, r2]
	add r1, #0x18
	str r3, [r0, r1]
	add r1, r2, #4
	ldr r1, [r0, r1]
	add r2, #0x1c
	str r1, [r0, r2]
	mov r1, #4
	mov r2, #0
	mov r3, #0x26
	bl ov18_021EDE4C
	mov r0, #0x1a
	pop {r3, pc}
	nop
_021EABB0: .word 0x00001878
	thumb_func_end ov18_021EAB8C

	thumb_func_start ov18_021EABB4
ov18_021EABB4: ; 0x021EABB4
	push {r3, r4, r5, lr}
	ldr r1, _021EAD5C ; =0x00000868
	add r4, r0, #0
	add r5, r4, r1
	bl ov18_021F739C
	mov r1, #1
	mvn r1, r1
	cmp r0, r1
	bhi _021EABEA
	bhs _021EAC4E
	cmp r0, #7
	bhi _021EABF4
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021EABDA: ; jump table
	.short _021EABF6 - _021EABDA - 2 ; case 0
	.short _021EAC0E - _021EABDA - 2 ; case 1
	.short _021EAC26 - _021EABDA - 2 ; case 2
	.short _021EAC4E - _021EABDA - 2 ; case 3
	.short _021EAC82 - _021EABDA - 2 ; case 4
	.short _021EACAE - _021EABDA - 2 ; case 5
	.short _021EACDE - _021EABDA - 2 ; case 6
	.short _021EAD0E - _021EABDA - 2 ; case 7
_021EABEA:
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _021EABF4
	b _021EAD3A
_021EABF4:
	b _021EAD56
_021EABF6:
	ldr r0, _021EAD60 ; =0x0000187C
	mov r1, #0
	ldr r0, [r4, r0]
	mov r2, #5
	str r0, [r5]
	add r0, r4, #0
	mov r3, #1
	str r1, [r5, #4]
	bl ov18_021F36D4
	mov r0, #0x28
	pop {r3, r4, r5, pc}
_021EAC0E:
	ldr r0, _021EAD64 ; =0x00001878
	mov r1, #0
	ldr r0, [r4, r0]
	mov r2, #0xb
	str r0, [r5]
	add r0, r4, #0
	mov r3, #1
	str r1, [r5, #4]
	bl ov18_021F36D4
	mov r0, #0x29
	pop {r3, r4, r5, pc}
_021EAC26:
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_020183F0
	ldr r0, _021EAD68 ; =0x000008E9
	bl PlaySE
	ldr r0, _021EAD5C ; =0x00000868
	mov r1, #0
	add r0, r4, r0
	mov r2, #0x10
	bl MI_CpuFill8
	add r0, r4, #0
	mov r1, #0
	mov r2, #0xa
	mov r3, #0x27
	bl ov18_021EDBDC
	pop {r3, r4, r5, pc}
_021EAC4E:
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	ldr r1, _021EAD6C ; =0x00001890
	add r0, r1, #0
	ldr r2, [r4, r1]
	sub r0, #0x18
	str r2, [r4, r0]
	add r0, r1, #4
	ldr r0, [r4, r0]
	sub r1, #0x14
	str r0, [r4, r1]
	ldr r0, _021EAD5C ; =0x00000868
	mov r1, #0
	add r0, r4, r0
	mov r2, #0x10
	bl MI_CpuFill8
	add r0, r4, #0
	mov r1, #0x16
	mov r2, #0xa
	mov r3, #0x27
	bl ov18_021EDBDC
	pop {r3, r4, r5, pc}
_021EAC82:
	ldr r0, _021EAD60 ; =0x0000187C
	ldr r0, [r4, r0]
	cmp r0, #0x98
	beq _021EAD56
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_020183F0
	ldr r0, _021EAD68 ; =0x000008E9
	bl PlaySE
	mov r0, #2
	strh r0, [r5, #8]
	mov r0, #1
	strh r0, [r5, #0xa]
	ldrh r1, [r5, #8]
	add r0, r4, #0
	mov r2, #0x36
	bl ov18_021F118C
	mov r0, #0x2a
	pop {r3, r4, r5, pc}
_021EACAE:
	ldr r0, _021EAD60 ; =0x0000187C
	ldr r1, [r4, r0]
	sub r0, r0, #4
	ldr r0, [r4, r0]
	cmp r1, r0
	bls _021EAD56
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_020183F0
	ldr r0, _021EAD68 ; =0x000008E9
	bl PlaySE
	mov r0, #1
	strh r0, [r5, #8]
	sub r0, r0, #2
	strh r0, [r5, #0xa]
	ldrh r1, [r5, #8]
	add r0, r4, #0
	mov r2, #0x39
	bl ov18_021F118C
	mov r0, #0x2a
	pop {r3, r4, r5, pc}
_021EACDE:
	ldr r0, _021EAD64 ; =0x00001878
	ldr r1, [r4, r0]
	add r0, r0, #4
	ldr r0, [r4, r0]
	cmp r1, r0
	bhs _021EAD56
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_020183F0
	ldr r0, _021EAD68 ; =0x000008E9
	bl PlaySE
	mov r0, #4
	strh r0, [r5, #8]
	mov r0, #1
	strh r0, [r5, #0xa]
	ldrh r1, [r5, #8]
	add r0, r4, #0
	mov r2, #0x36
	bl ov18_021F118C
	mov r0, #0x2b
	pop {r3, r4, r5, pc}
_021EAD0E:
	ldr r0, _021EAD64 ; =0x00001878
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021EAD56
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_020183F0
	ldr r0, _021EAD68 ; =0x000008E9
	bl PlaySE
	mov r0, #3
	strh r0, [r5, #8]
	sub r0, r0, #4
	strh r0, [r5, #0xa]
	ldrh r1, [r5, #8]
	add r0, r4, #0
	mov r2, #0x39
	bl ov18_021F118C
	mov r0, #0x2b
	pop {r3, r4, r5, pc}
_021EAD3A:
	ldr r0, _021EAD70 ; =gSystem
	ldr r1, [r0, #0x44]
	mov r0, #0x20
	tst r0, r1
	bne _021EAD56
	mov r0, #0x10
	tst r0, r1
	bne _021EAD56
	bl System_GetTouchHeld
	cmp r0, #0
	bne _021EAD56
	mov r0, #0
	str r0, [r5, #4]
_021EAD56:
	mov r0, #0x26
	pop {r3, r4, r5, pc}
	nop
_021EAD5C: .word 0x00000868
_021EAD60: .word 0x0000187C
_021EAD64: .word 0x00001878
_021EAD68: .word 0x000008E9
_021EAD6C: .word 0x00001890
_021EAD70: .word gSystem
	thumb_func_end ov18_021EABB4

	thumb_func_start ov18_021EAD74
ov18_021EAD74: ; 0x021EAD74
	push {r4, r5}
	ldr r4, [r3]
	cmp r4, #0x18
	beq _021EAD80
	add r4, r4, #1
	str r4, [r3]
_021EAD80:
	ldr r3, [r3]
	cmp r3, #0x18
	blo _021EAD8A
	mov r5, #0x20
	b _021EAD9C
_021EAD8A:
	cmp r3, #0x10
	blo _021EAD92
	mov r5, #0x10
	b _021EAD9C
_021EAD92:
	cmp r3, #8
	blo _021EAD9A
	mov r5, #8
	b _021EAD9C
_021EAD9A:
	mov r5, #1
_021EAD9C:
	ldr r3, [sp, #8]
	ldr r4, [r0]
	mul r3, r5
	add r3, r4, r3
	cmp r3, r1
	bge _021EADAC
	add r3, r1, #0
	b _021EADB2
_021EADAC:
	cmp r3, r2
	ble _021EADB2
	add r3, r2, #0
_021EADB2:
	str r3, [r0]
	pop {r4, r5}
	bx lr
	thumb_func_end ov18_021EAD74

	thumb_func_start ov18_021EADB8
ov18_021EADB8: ; 0x021EADB8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	add r6, r3, #0
	ldr r4, [sp, #0x18]
	cmp r2, #0
	bne _021EAE00
	bl ov18_021F3AD0
	add r1, r0, #0
	add r0, r5, #0
	add r2, r6, #0
	mov r3, #1
	bl ov18_021F36D4
	ldr r2, _021EAE40 ; =0x00001850
	lsl r7, r7, #2
	ldr r2, [r5, r2]
	add r0, r5, #0
	ldrh r2, [r2, r7]
	add r1, r6, #1
	bl ov18_021F38F0
	ldr r1, _021EAE40 ; =0x00001850
	add r0, r5, #0
	ldr r1, [r5, r1]
	add r2, r4, #0
	ldrh r1, [r1, r7]
	bl ov18_021EFD00
	add r5, #0xc
	lsl r0, r4, #4
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	pop {r3, r4, r5, r6, r7, pc}
_021EAE00:
	bl ov18_021F3AD0
	add r1, r0, #0
	add r0, r5, #0
	add r2, r6, #0
	mov r3, #1
	bl ov18_021F37D4
	ldr r2, _021EAE40 ; =0x00001850
	lsl r7, r7, #2
	ldr r2, [r5, r2]
	add r0, r5, #0
	add r2, r2, r7
	ldrh r2, [r2, #2]
	add r1, r6, #1
	bl ov18_021F39C4
	ldr r1, _021EAE40 ; =0x00001850
	add r0, r5, #0
	ldr r1, [r5, r1]
	add r2, r4, #0
	add r1, r1, r7
	ldrh r1, [r1, #2]
	bl ov18_021EFDB4
	add r5, #0xc
	lsl r0, r4, #4
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EAE40: .word 0x00001850
	thumb_func_end ov18_021EADB8

	thumb_func_start ov18_021EAE44
ov18_021EAE44: ; 0x021EAE44
	push {r3, lr}
	mov r1, #0
	mov r2, #3
	mov r3, #0x16
	bl ov18_021EDE4C
	mov r0, #0x1b
	pop {r3, pc}
	thumb_func_end ov18_021EAE44

	thumb_func_start ov18_021EAE54
ov18_021EAE54: ; 0x021EAE54
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, sp, #4
	ldr r4, _021EAF04 ; =0x00000868
	bl ov18_021F765C
	cmp r0, #0
	ldr r0, _021EAF08 ; =0x0000187C
	bne _021EAE9A
	sub r1, r0, #4
	ldr r2, [r5, r0]
	ldr r1, [r5, r1]
	cmp r2, r1
	bhs _021EAE76
	ldr r1, [r5, r4]
	str r1, [r5, r0]
_021EAE76:
	mov r0, #0x46
	str r0, [sp]
	ldr r1, _021EAF08 ; =0x0000187C
	add r0, r5, #0
	ldr r1, [r5, r1]
	mov r2, #0
	mov r3, #5
	bl ov18_021EADB8
	ldr r1, _021EAF08 ; =0x0000187C
	add r0, r5, #0
	ldr r1, [r5, r1]
	mov r2, #1
	bl ov18_021F3A64
	add sp, #8
	mov r0, #0x26
	pop {r3, r4, r5, pc}
_021EAE9A:
	ldr r1, [sp, #4]
	ldr r4, [r5, r0]
	add r0, r5, #0
	mov r2, #5
	mov r3, #1
	bl ov18_021F36D4
	add r0, r5, #0
	mov r1, #5
	bl ov18_021F3AB0
	ldr r3, _021EAF08 ; =0x0000187C
	mov r1, #6
	add r2, r3, #0
	str r0, [r5, r3]
	sub r2, #0x2c
	ldr r3, [r5, r3]
	ldr r2, [r5, r2]
	lsl r3, r3, #2
	ldrh r2, [r2, r3]
	add r0, r5, #0
	bl ov18_021F38F0
	ldr r1, _021EAF0C ; =0x00001850
	add r0, r5, #0
	ldr r2, [r5, r1]
	add r1, #0x2c
	ldr r1, [r5, r1]
	lsl r1, r1, #2
	ldrh r1, [r2, r1]
	mov r2, #0x46
	bl ov18_021EFD00
	ldr r0, _021EAF10 ; =0x0000046C
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	ldr r1, _021EAF08 ; =0x0000187C
	add r0, r5, #0
	ldr r1, [r5, r1]
	mov r2, #1
	bl ov18_021F3A64
	ldr r0, _021EAF08 ; =0x0000187C
	ldr r0, [r5, r0]
	cmp r4, r0
	beq _021EAEFE
	ldr r0, _021EAF14 ; =0x000008E8
	bl PlaySE
_021EAEFE:
	mov r0, #0x28
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EAF04: .word 0x00000868
_021EAF08: .word 0x0000187C
_021EAF0C: .word 0x00001850
_021EAF10: .word 0x0000046C
_021EAF14: .word 0x000008E8
	thumb_func_end ov18_021EAE54

	thumb_func_start ov18_021EAF18
ov18_021EAF18: ; 0x021EAF18
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, sp, #4
	ldr r4, _021EAFC8 ; =0x00000868
	bl ov18_021F765C
	cmp r0, #0
	ldr r0, _021EAFCC ; =0x00001878
	bne _021EAF5E
	add r1, r0, #4
	ldr r2, [r5, r0]
	ldr r1, [r5, r1]
	cmp r2, r1
	bls _021EAF3A
	ldr r1, [r5, r4]
	str r1, [r5, r0]
_021EAF3A:
	mov r0, #0x45
	str r0, [sp]
	ldr r1, _021EAFCC ; =0x00001878
	add r0, r5, #0
	ldr r1, [r5, r1]
	mov r2, #0
	mov r3, #0xb
	bl ov18_021EADB8
	ldr r1, _021EAFCC ; =0x00001878
	add r0, r5, #0
	ldr r1, [r5, r1]
	mov r2, #3
	bl ov18_021F3A64
	add sp, #8
	mov r0, #0x26
	pop {r3, r4, r5, pc}
_021EAF5E:
	ldr r1, [sp, #4]
	ldr r4, [r5, r0]
	add r0, r5, #0
	mov r2, #0xb
	mov r3, #1
	bl ov18_021F36D4
	add r0, r5, #0
	mov r1, #0xb
	bl ov18_021F3AB0
	ldr r3, _021EAFCC ; =0x00001878
	mov r1, #0xc
	add r2, r3, #0
	str r0, [r5, r3]
	sub r2, #0x28
	ldr r3, [r5, r3]
	ldr r2, [r5, r2]
	lsl r3, r3, #2
	ldrh r2, [r2, r3]
	add r0, r5, #0
	bl ov18_021F38F0
	ldr r1, _021EAFD0 ; =0x00001850
	add r0, r5, #0
	ldr r2, [r5, r1]
	add r1, #0x28
	ldr r1, [r5, r1]
	lsl r1, r1, #2
	ldrh r1, [r2, r1]
	mov r2, #0x45
	bl ov18_021EFD00
	ldr r0, _021EAFD4 ; =0x0000045C
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	ldr r1, _021EAFCC ; =0x00001878
	add r0, r5, #0
	ldr r1, [r5, r1]
	mov r2, #3
	bl ov18_021F3A64
	ldr r0, _021EAFCC ; =0x00001878
	ldr r0, [r5, r0]
	cmp r4, r0
	beq _021EAFC2
	ldr r0, _021EAFD8 ; =0x000008E8
	bl PlaySE
_021EAFC2:
	mov r0, #0x29
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EAFC8: .word 0x00000868
_021EAFCC: .word 0x00001878
_021EAFD0: .word 0x00001850
_021EAFD4: .word 0x0000045C
_021EAFD8: .word 0x000008E8
	thumb_func_end ov18_021EAF18

	thumb_func_start ov18_021EAFDC
ov18_021EAFDC: ; 0x021EAFDC
	push {r3, r4, r5, lr}
	ldr r1, _021EB02C ; =0x00000868
	add r5, r0, #0
	add r4, r5, r1
	ldrh r1, [r4, #8]
	bl ov18_021F11AC
	cmp r0, #0
	bne _021EB026
	mov r0, #0xa
	ldrsh r0, [r4, r0]
	ldr r1, _021EB030 ; =0x0000187C
	mov r2, #0x98
	str r0, [sp]
	add r0, r5, r1
	sub r1, r1, #4
	ldr r1, [r5, r1]
	add r3, r4, #4
	bl ov18_021EAD74
	mov r0, #0x46
	str r0, [sp]
	ldr r1, _021EB030 ; =0x0000187C
	add r0, r5, #0
	ldr r1, [r5, r1]
	mov r2, #0
	mov r3, #5
	bl ov18_021EADB8
	ldr r1, _021EB030 ; =0x0000187C
	add r0, r5, #0
	ldr r1, [r5, r1]
	mov r2, #1
	bl ov18_021F3A64
	mov r0, #0x26
	pop {r3, r4, r5, pc}
_021EB026:
	mov r0, #0x2a
	pop {r3, r4, r5, pc}
	nop
_021EB02C: .word 0x00000868
_021EB030: .word 0x0000187C
	thumb_func_end ov18_021EAFDC

	thumb_func_start ov18_021EB034
ov18_021EB034: ; 0x021EB034
	push {r3, r4, r5, lr}
	ldr r1, _021EB084 ; =0x00000868
	add r5, r0, #0
	add r4, r5, r1
	ldrh r1, [r4, #8]
	bl ov18_021F11AC
	cmp r0, #0
	bne _021EB07E
	mov r0, #0xa
	ldrsh r0, [r4, r0]
	ldr r2, _021EB088 ; =0x00001878
	mov r1, #0
	str r0, [sp]
	add r0, r5, r2
	add r2, r2, #4
	ldr r2, [r5, r2]
	add r3, r4, #4
	bl ov18_021EAD74
	mov r0, #0x45
	str r0, [sp]
	ldr r1, _021EB088 ; =0x00001878
	add r0, r5, #0
	ldr r1, [r5, r1]
	mov r2, #0
	mov r3, #0xb
	bl ov18_021EADB8
	ldr r1, _021EB088 ; =0x00001878
	add r0, r5, #0
	ldr r1, [r5, r1]
	mov r2, #3
	bl ov18_021F3A64
	mov r0, #0x26
	pop {r3, r4, r5, pc}
_021EB07E:
	mov r0, #0x2b
	pop {r3, r4, r5, pc}
	nop
_021EB084: .word 0x00000868
_021EB088: .word 0x00001878
	thumb_func_end ov18_021EB034

	thumb_func_start ov18_021EB08C
ov18_021EB08C: ; 0x021EB08C
	push {r3, lr}
	mov r2, #0x62
	lsl r2, r2, #6
	add r1, r2, #0
	ldr r3, [r0, r2]
	add r1, #0x10
	str r3, [r0, r1]
	add r1, r2, #4
	ldr r1, [r0, r1]
	add r2, #0x14
	str r1, [r0, r2]
	mov r1, #5
	mov r2, #0
	mov r3, #0x2d
	bl ov18_021EDE4C
	mov r0, #0x1a
	pop {r3, pc}
	thumb_func_end ov18_021EB08C

	thumb_func_start ov18_021EB0B0
ov18_021EB0B0: ; 0x021EB0B0
	push {r3, r4, r5, lr}
	ldr r1, _021EB25C ; =0x00000868
	add r4, r0, #0
	add r5, r4, r1
	bl ov18_021F7520
	mov r1, #1
	mvn r1, r1
	cmp r0, r1
	bhi _021EB0E6
	bhs _021EB14C
	cmp r0, #7
	bhi _021EB0F0
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021EB0D6: ; jump table
	.short _021EB0F2 - _021EB0D6 - 2 ; case 0
	.short _021EB10A - _021EB0D6 - 2 ; case 1
	.short _021EB124 - _021EB0D6 - 2 ; case 2
	.short _021EB14C - _021EB0D6 - 2 ; case 3
	.short _021EB180 - _021EB0D6 - 2 ; case 4
	.short _021EB1AC - _021EB0D6 - 2 ; case 5
	.short _021EB1DC - _021EB0D6 - 2 ; case 6
	.short _021EB20E - _021EB0D6 - 2 ; case 7
_021EB0E6:
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _021EB0F0
	b _021EB23C
_021EB0F0:
	b _021EB258
_021EB0F2:
	ldr r0, _021EB260 ; =0x00001884
	mov r1, #0
	ldr r0, [r4, r0]
	mov r2, #5
	str r0, [r5]
	add r0, r4, #0
	mov r3, #1
	str r1, [r5, #4]
	bl ov18_021F37D4
	mov r0, #0x2f
	pop {r3, r4, r5, pc}
_021EB10A:
	mov r0, #0x62
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0
	str r0, [r5]
	add r0, r4, #0
	mov r2, #0xb
	mov r3, #1
	str r1, [r5, #4]
	bl ov18_021F37D4
	mov r0, #0x30
	pop {r3, r4, r5, pc}
_021EB124:
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_020183F0
	ldr r0, _021EB264 ; =0x000008E9
	bl PlaySE
	ldr r0, _021EB25C ; =0x00000868
	mov r1, #0
	add r0, r4, r0
	mov r2, #0x10
	bl MI_CpuFill8
	add r0, r4, #0
	mov r1, #0
	mov r2, #0xa
	mov r3, #0x2e
	bl ov18_021EDBDC
	pop {r3, r4, r5, pc}
_021EB14C:
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	ldr r1, _021EB268 ; =0x00001890
	add r0, r1, #0
	ldr r2, [r4, r1]
	sub r0, #0x10
	str r2, [r4, r0]
	add r0, r1, #4
	ldr r0, [r4, r0]
	sub r1, #0xc
	str r0, [r4, r1]
	ldr r0, _021EB25C ; =0x00000868
	mov r1, #0
	add r0, r4, r0
	mov r2, #0x10
	bl MI_CpuFill8
	add r0, r4, #0
	mov r1, #0x16
	mov r2, #0xa
	mov r3, #0x2e
	bl ov18_021EDBDC
	pop {r3, r4, r5, pc}
_021EB180:
	ldr r0, _021EB260 ; =0x00001884
	ldr r0, [r4, r0]
	cmp r0, #0x98
	beq _021EB258
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_020183F0
	ldr r0, _021EB264 ; =0x000008E9
	bl PlaySE
	mov r0, #2
	strh r0, [r5, #8]
	mov r0, #1
	strh r0, [r5, #0xa]
	ldrh r1, [r5, #8]
	add r0, r4, #0
	mov r2, #0x36
	bl ov18_021F118C
	mov r0, #0x31
	pop {r3, r4, r5, pc}
_021EB1AC:
	ldr r0, _021EB260 ; =0x00001884
	ldr r1, [r4, r0]
	sub r0, r0, #4
	ldr r0, [r4, r0]
	cmp r1, r0
	bls _021EB258
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_020183F0
	ldr r0, _021EB264 ; =0x000008E9
	bl PlaySE
	mov r0, #1
	strh r0, [r5, #8]
	sub r0, r0, #2
	strh r0, [r5, #0xa]
	ldrh r1, [r5, #8]
	add r0, r4, #0
	mov r2, #0x39
	bl ov18_021F118C
	mov r0, #0x31
	pop {r3, r4, r5, pc}
_021EB1DC:
	mov r0, #0x62
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	add r0, r0, #4
	ldr r0, [r4, r0]
	cmp r1, r0
	bhs _021EB258
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_020183F0
	ldr r0, _021EB264 ; =0x000008E9
	bl PlaySE
	mov r0, #4
	strh r0, [r5, #8]
	mov r0, #1
	strh r0, [r5, #0xa]
	ldrh r1, [r5, #8]
	add r0, r4, #0
	mov r2, #0x36
	bl ov18_021F118C
	mov r0, #0x32
	pop {r3, r4, r5, pc}
_021EB20E:
	mov r0, #0x62
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021EB258
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_020183F0
	ldr r0, _021EB264 ; =0x000008E9
	bl PlaySE
	mov r0, #3
	strh r0, [r5, #8]
	sub r0, r0, #4
	strh r0, [r5, #0xa]
	ldrh r1, [r5, #8]
	add r0, r4, #0
	mov r2, #0x39
	bl ov18_021F118C
	mov r0, #0x32
	pop {r3, r4, r5, pc}
_021EB23C:
	ldr r0, _021EB26C ; =gSystem
	ldr r1, [r0, #0x44]
	mov r0, #0x20
	tst r0, r1
	bne _021EB258
	mov r0, #0x10
	tst r0, r1
	bne _021EB258
	bl System_GetTouchHeld
	cmp r0, #0
	bne _021EB258
	mov r0, #0
	str r0, [r5, #4]
_021EB258:
	mov r0, #0x2d
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EB25C: .word 0x00000868
_021EB260: .word 0x00001884
_021EB264: .word 0x000008E9
_021EB268: .word 0x00001890
_021EB26C: .word gSystem
	thumb_func_end ov18_021EB0B0

	thumb_func_start ov18_021EB270
ov18_021EB270: ; 0x021EB270
	push {r3, lr}
	mov r1, #0
	mov r2, #4
	mov r3, #0x16
	bl ov18_021EDE4C
	mov r0, #0x1b
	pop {r3, pc}
	thumb_func_end ov18_021EB270

	thumb_func_start ov18_021EB280
ov18_021EB280: ; 0x021EB280
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, sp, #4
	ldr r4, _021EB334 ; =0x00000868
	bl ov18_021F765C
	cmp r0, #0
	ldr r0, _021EB338 ; =0x00001884
	bne _021EB2C6
	sub r1, r0, #4
	ldr r2, [r5, r0]
	ldr r1, [r5, r1]
	cmp r2, r1
	bhs _021EB2A2
	ldr r1, [r5, r4]
	str r1, [r5, r0]
_021EB2A2:
	mov r0, #0x49
	str r0, [sp]
	ldr r1, _021EB338 ; =0x00001884
	add r0, r5, #0
	ldr r1, [r5, r1]
	mov r2, #1
	mov r3, #5
	bl ov18_021EADB8
	ldr r1, _021EB338 ; =0x00001884
	add r0, r5, #0
	ldr r1, [r5, r1]
	mov r2, #1
	bl ov18_021F3A64
	add sp, #8
	mov r0, #0x2d
	pop {r3, r4, r5, pc}
_021EB2C6:
	ldr r1, [sp, #4]
	ldr r4, [r5, r0]
	add r0, r5, #0
	mov r2, #5
	mov r3, #1
	bl ov18_021F37D4
	add r0, r5, #0
	mov r1, #5
	bl ov18_021F3AB0
	ldr r3, _021EB338 ; =0x00001884
	mov r1, #6
	add r2, r3, #0
	str r0, [r5, r3]
	sub r2, #0x34
	ldr r3, [r5, r3]
	ldr r2, [r5, r2]
	lsl r3, r3, #2
	add r2, r2, r3
	ldrh r2, [r2, #2]
	add r0, r5, #0
	bl ov18_021F39C4
	ldr r1, _021EB33C ; =0x00001850
	add r0, r5, #0
	ldr r2, [r5, r1]
	add r1, #0x34
	ldr r1, [r5, r1]
	lsl r1, r1, #2
	add r1, r2, r1
	ldrh r1, [r1, #2]
	mov r2, #0x49
	bl ov18_021EFDB4
	ldr r0, _021EB340 ; =0x0000049C
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	ldr r1, _021EB338 ; =0x00001884
	add r0, r5, #0
	ldr r1, [r5, r1]
	mov r2, #1
	bl ov18_021F3A64
	ldr r0, _021EB338 ; =0x00001884
	ldr r0, [r5, r0]
	cmp r4, r0
	beq _021EB32E
	ldr r0, _021EB344 ; =0x000008E8
	bl PlaySE
_021EB32E:
	mov r0, #0x2f
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EB334: .word 0x00000868
_021EB338: .word 0x00001884
_021EB33C: .word 0x00001850
_021EB340: .word 0x0000049C
_021EB344: .word 0x000008E8
	thumb_func_end ov18_021EB280

	thumb_func_start ov18_021EB348
ov18_021EB348: ; 0x021EB348
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, sp, #4
	ldr r4, _021EB40C ; =0x00000868
	bl ov18_021F765C
	cmp r0, #0
	bne _021EB394
	mov r0, #0x62
	lsl r0, r0, #6
	add r1, r0, #4
	ldr r2, [r5, r0]
	ldr r1, [r5, r1]
	cmp r2, r1
	bls _021EB36C
	ldr r1, [r5, r4]
	str r1, [r5, r0]
_021EB36C:
	mov r0, #0x48
	mov r1, #0x62
	str r0, [sp]
	lsl r1, r1, #6
	ldr r1, [r5, r1]
	add r0, r5, #0
	mov r2, #1
	mov r3, #0xb
	bl ov18_021EADB8
	mov r1, #0x62
	lsl r1, r1, #6
	ldr r1, [r5, r1]
	add r0, r5, #0
	mov r2, #3
	bl ov18_021F3A64
	add sp, #8
	mov r0, #0x2d
	pop {r3, r4, r5, pc}
_021EB394:
	mov r0, #0x62
	lsl r0, r0, #6
	ldr r4, [r5, r0]
	ldr r1, [sp, #4]
	add r0, r5, #0
	mov r2, #0xb
	mov r3, #1
	bl ov18_021F37D4
	add r0, r5, #0
	mov r1, #0xb
	bl ov18_021F3AB0
	mov r3, #0x62
	lsl r3, r3, #6
	add r2, r3, #0
	str r0, [r5, r3]
	sub r2, #0x30
	ldr r3, [r5, r3]
	ldr r2, [r5, r2]
	lsl r3, r3, #2
	add r2, r2, r3
	ldrh r2, [r2, #2]
	add r0, r5, #0
	mov r1, #0xc
	bl ov18_021F39C4
	ldr r1, _021EB410 ; =0x00001850
	add r0, r5, #0
	ldr r2, [r5, r1]
	add r1, #0x30
	ldr r1, [r5, r1]
	lsl r1, r1, #2
	add r1, r2, r1
	ldrh r1, [r1, #2]
	mov r2, #0x48
	bl ov18_021EFDB4
	ldr r0, _021EB414 ; =0x0000048C
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	mov r1, #0x62
	lsl r1, r1, #6
	ldr r1, [r5, r1]
	add r0, r5, #0
	mov r2, #3
	bl ov18_021F3A64
	mov r0, #0x62
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	cmp r4, r0
	beq _021EB406
	ldr r0, _021EB418 ; =0x000008E8
	bl PlaySE
_021EB406:
	mov r0, #0x30
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EB40C: .word 0x00000868
_021EB410: .word 0x00001850
_021EB414: .word 0x0000048C
_021EB418: .word 0x000008E8
	thumb_func_end ov18_021EB348

	thumb_func_start ov18_021EB41C
ov18_021EB41C: ; 0x021EB41C
	push {r3, r4, r5, lr}
	ldr r1, _021EB46C ; =0x00000868
	add r5, r0, #0
	add r4, r5, r1
	ldrh r1, [r4, #8]
	bl ov18_021F11AC
	cmp r0, #0
	bne _021EB466
	mov r0, #0xa
	ldrsh r0, [r4, r0]
	ldr r1, _021EB470 ; =0x00001884
	mov r2, #0x98
	str r0, [sp]
	add r0, r5, r1
	sub r1, r1, #4
	ldr r1, [r5, r1]
	add r3, r4, #4
	bl ov18_021EAD74
	mov r0, #0x49
	str r0, [sp]
	ldr r1, _021EB470 ; =0x00001884
	add r0, r5, #0
	ldr r1, [r5, r1]
	mov r2, #1
	mov r3, #5
	bl ov18_021EADB8
	ldr r1, _021EB470 ; =0x00001884
	add r0, r5, #0
	ldr r1, [r5, r1]
	mov r2, #1
	bl ov18_021F3A64
	mov r0, #0x2d
	pop {r3, r4, r5, pc}
_021EB466:
	mov r0, #0x31
	pop {r3, r4, r5, pc}
	nop
_021EB46C: .word 0x00000868
_021EB470: .word 0x00001884
	thumb_func_end ov18_021EB41C

	thumb_func_start ov18_021EB474
ov18_021EB474: ; 0x021EB474
	push {r3, r4, r5, lr}
	ldr r1, _021EB4C8 ; =0x00000868
	add r5, r0, #0
	add r4, r5, r1
	ldrh r1, [r4, #8]
	bl ov18_021F11AC
	cmp r0, #0
	bne _021EB4C4
	mov r0, #0xa
	ldrsh r0, [r4, r0]
	mov r2, #0x62
	lsl r2, r2, #6
	str r0, [sp]
	add r0, r5, r2
	add r2, r2, #4
	ldr r2, [r5, r2]
	mov r1, #0
	add r3, r4, #4
	bl ov18_021EAD74
	mov r0, #0x48
	mov r1, #0x62
	str r0, [sp]
	lsl r1, r1, #6
	ldr r1, [r5, r1]
	add r0, r5, #0
	mov r2, #1
	mov r3, #0xb
	bl ov18_021EADB8
	mov r1, #0x62
	lsl r1, r1, #6
	ldr r1, [r5, r1]
	add r0, r5, #0
	mov r2, #3
	bl ov18_021F3A64
	mov r0, #0x2d
	pop {r3, r4, r5, pc}
_021EB4C4:
	mov r0, #0x32
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EB4C8: .word 0x00000868
	thumb_func_end ov18_021EB474

	thumb_func_start ov18_021EB4CC
ov18_021EB4CC: ; 0x021EB4CC
	push {r3, lr}
	ldr r1, _021EB4E4 ; =0x00001888
	mov r3, #0x34
	ldr r2, [r0, r1]
	add r1, #8
	str r2, [r0, r1]
	mov r1, #6
	mov r2, #0
	bl ov18_021EDE4C
	mov r0, #0x1a
	pop {r3, pc}
	.balign 4, 0
_021EB4E4: .word 0x00001888
	thumb_func_end ov18_021EB4CC

	thumb_func_start ov18_021EB4E8
ov18_021EB4E8: ; 0x021EB4E8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov18_021F76B0
	mov r1, #3
	add r4, r0, #0
	mvn r1, r1
	cmp r4, r1
	bhi _021EB50C
	bhs _021EB572
	cmp r4, #5
	bhi _021EB55C
	cmp r4, #4
	blo _021EB55C
	beq _021EB522
	cmp r4, #5
	beq _021EB53E
	b _021EB55C
_021EB50C:
	add r0, r1, #1
	cmp r4, r0
	blo _021EB55C
	beq _021EB572
	add r0, r1, #2
	cmp r4, r0
	beq _021EB53E
	add r0, r1, #3
	cmp r4, r0
	beq _021EB572
	b _021EB55C
_021EB522:
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_020183F0
	ldr r0, _021EB578 ; =0x000008E9
	bl PlaySE
	add r0, r5, #0
	mov r1, #0
	mov r2, #0xa
	mov r3, #0x35
	bl ov18_021EDBDC
	pop {r3, r4, r5, pc}
_021EB53E:
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	ldr r0, _021EB57C ; =0x00001890
	mov r2, #0xa
	ldr r1, [r5, r0]
	sub r0, #8
	str r1, [r5, r0]
	add r0, r5, #0
	mov r1, #0x16
	mov r3, #0x35
	bl ov18_021EDBDC
	pop {r3, r4, r5, pc}
_021EB55C:
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_020183F0
	ldr r0, _021EB578 ; =0x000008E9
	bl PlaySE
	add r0, r5, #0
	add r1, r4, #0
	bl ov18_021E7534
_021EB572:
	mov r0, #0x34
	pop {r3, r4, r5, pc}
	nop
_021EB578: .word 0x000008E9
_021EB57C: .word 0x00001890
	thumb_func_end ov18_021EB4E8

	thumb_func_start ov18_021EB580
ov18_021EB580: ; 0x021EB580
	push {r3, lr}
	mov r1, #0
	mov r2, #5
	mov r3, #0x16
	bl ov18_021EDE4C
	mov r0, #0x1b
	pop {r3, pc}
	thumb_func_end ov18_021EB580

	thumb_func_start ov18_021EB590
ov18_021EB590: ; 0x021EB590
	push {r3, lr}
	ldr r1, _021EB5A8 ; =0x0000188C
	mov r3, #0x37
	ldr r2, [r0, r1]
	add r1, r1, #4
	str r2, [r0, r1]
	mov r1, #7
	mov r2, #0
	bl ov18_021EDE4C
	mov r0, #0x1a
	pop {r3, pc}
	.balign 4, 0
_021EB5A8: .word 0x0000188C
	thumb_func_end ov18_021EB590

	thumb_func_start ov18_021EB5AC
ov18_021EB5AC: ; 0x021EB5AC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov18_021F7790
	mov r1, #3
	add r4, r0, #0
	mvn r1, r1
	cmp r4, r1
	bhi _021EB5D0
	bhs _021EB636
	cmp r4, #0x10
	bhi _021EB620
	cmp r4, #0xf
	blo _021EB620
	beq _021EB5E6
	cmp r4, #0x10
	beq _021EB602
	b _021EB620
_021EB5D0:
	add r0, r1, #1
	cmp r4, r0
	blo _021EB620
	beq _021EB636
	add r0, r1, #2
	cmp r4, r0
	beq _021EB602
	add r0, r1, #3
	cmp r4, r0
	beq _021EB636
	b _021EB620
_021EB5E6:
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_020183F0
	ldr r0, _021EB63C ; =0x000008E9
	bl PlaySE
	add r0, r5, #0
	mov r1, #0
	mov r2, #0xa
	mov r3, #0x38
	bl ov18_021EDBDC
	pop {r3, r4, r5, pc}
_021EB602:
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	ldr r0, _021EB640 ; =0x00001890
	mov r2, #0xa
	ldr r1, [r5, r0]
	sub r0, r0, #4
	str r1, [r5, r0]
	add r0, r5, #0
	mov r1, #0x16
	mov r3, #0x38
	bl ov18_021EDBDC
	pop {r3, r4, r5, pc}
_021EB620:
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_020183F0
	ldr r0, _021EB63C ; =0x000008E9
	bl PlaySE
	add r0, r5, #0
	add r1, r4, #0
	bl ov18_021E766C
_021EB636:
	mov r0, #0x37
	pop {r3, r4, r5, pc}
	nop
_021EB63C: .word 0x000008E9
_021EB640: .word 0x00001890
	thumb_func_end ov18_021EB5AC

	thumb_func_start ov18_021EB644
ov18_021EB644: ; 0x021EB644
	push {r3, lr}
	mov r1, #0
	mov r2, #6
	mov r3, #0x16
	bl ov18_021EDE4C
	mov r0, #0x1b
	pop {r3, pc}
	thumb_func_end ov18_021EB644

	thumb_func_start ov18_021EB654
ov18_021EB654: ; 0x021EB654
	push {r4, lr}
	sub sp, #8
	mov r1, #0
	add r4, r0, #0
	bl ov18_021F7974
	cmp r0, #0xd
	bhi _021EB6EA
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021EB670: ; jump table
	.short _021EB68C - _021EB670 - 2 ; case 0
	.short _021EB81E - _021EB670 - 2 ; case 1
	.short _021EB6A2 - _021EB670 - 2 ; case 2
	.short _021EB6B2 - _021EB670 - 2 ; case 3
	.short _021EB6D6 - _021EB670 - 2 ; case 4
	.short _021EB708 - _021EB670 - 2 ; case 5
	.short _021EB718 - _021EB670 - 2 ; case 6
	.short _021EB728 - _021EB670 - 2 ; case 7
	.short _021EB73C - _021EB670 - 2 ; case 8
	.short _021EB74E - _021EB670 - 2 ; case 9
	.short _021EB76E - _021EB670 - 2 ; case 10
	.short _021EB794 - _021EB670 - 2 ; case 11
	.short _021EB7BE - _021EB670 - 2 ; case 12
	.short _021EB7EE - _021EB670 - 2 ; case 13
_021EB68C:
	add r0, r4, #0
	mov r1, #0
	bl ov18_021F2BB0
	add r0, r4, #0
	bl ov18_021E78AC
	add r0, r4, #0
	bl ov18_021EDEB0
	b _021EB81E
_021EB6A2:
	add r0, r4, #0
	mov r1, #0
	mov r2, #8
	mov r3, #0x3e
	bl ov18_021EDBB8
	add sp, #8
	pop {r4, pc}
_021EB6B2:
	add r0, r4, #0
	bl ov18_021F8824
	cmp r0, #0
	beq _021EB6EA
	add r0, r4, #0
	bl ov18_021EDE04
	cmp r0, #1
	bne _021EB6EA
	mov r1, #8
	add r0, r4, #0
	add r2, r1, #0
	mov r3, #0x39
	bl ov18_021EDBB8
	add sp, #8
	pop {r4, pc}
_021EB6D6:
	add r0, r4, #0
	bl ov18_021F8824
	cmp r0, #0
	beq _021EB6EA
	add r0, r4, #0
	bl ov18_021F8838
	cmp r0, #0
	bne _021EB6EC
_021EB6EA:
	b _021EB81E
_021EB6EC:
	ldr r0, _021EB824 ; =0x000008E9
	bl PlaySE
	ldr r0, _021EB828 ; =0x0000185B
	mov r1, #1
	strb r1, [r4, r0]
	add r0, r4, #0
	mov r1, #0x10
	mov r2, #8
	mov r3, #0x40
	bl ov18_021EDBB8
	add sp, #8
	pop {r4, pc}
_021EB708:
	add r0, r4, #0
	mov r1, #0x18
	mov r2, #8
	mov r3, #0x3f
	bl ov18_021EDBB8
	add sp, #8
	pop {r4, pc}
_021EB718:
	add r0, r4, #0
	mov r1, #0x18
	mov r2, #8
	mov r3, #0x3f
	bl ov18_021EDBB8
	add sp, #8
	pop {r4, pc}
_021EB728:
	add r0, r4, #0
	bl ov18_021F8838
	mov r2, #0
	add r1, r0, #0
	add r0, r4, #0
	mvn r2, r2
	bl ov18_021E7A80
	b _021EB81E
_021EB73C:
	add r0, r4, #0
	bl ov18_021F8838
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #1
	bl ov18_021E7A80
	b _021EB81E
_021EB74E:
	ldr r0, _021EB82C ; =0x00001859
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _021EB81E
	ldr r0, _021EB824 ; =0x000008E9
	bl PlaySE
	ldr r0, _021EB830 ; =0x00000868
	mov r1, #0
	add r0, r4, r0
	mov r2, #0x10
	bl MI_CpuFill8
	add sp, #8
	mov r0, #0x3a
	pop {r4, pc}
_021EB76E:
	ldr r0, _021EB82C ; =0x00001859
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _021EB81E
	ldr r0, _021EB824 ; =0x000008E9
	bl PlaySE
	ldr r0, _021EB830 ; =0x00000868
	mov r1, #0
	add r0, r4, r0
	mov r2, #0x10
	bl MI_CpuFill8
	ldr r0, _021EB834 ; =0x0000086F
	mov r1, #1
	strb r1, [r4, r0]
	add sp, #8
	mov r0, #0x3a
	pop {r4, pc}
_021EB794:
	add r0, r4, #0
	mov r1, #0
	bl ov18_021F8950
	ldr r1, _021EB82C ; =0x00001859
	ldrb r1, [r4, r1]
	add r1, r1, #1
	cmp r1, r0
	bhi _021EB81E
	ldr r0, _021EB824 ; =0x000008E9
	bl PlaySE
	ldr r0, _021EB830 ; =0x00000868
	mov r1, #0
	add r0, r4, r0
	mov r2, #0x10
	bl MI_CpuFill8
	add sp, #8
	mov r0, #0x3b
	pop {r4, pc}
_021EB7BE:
	add r0, r4, #0
	mov r1, #0
	bl ov18_021F8950
	ldr r1, _021EB82C ; =0x00001859
	ldrb r1, [r4, r1]
	add r1, r1, #1
	cmp r1, r0
	bhi _021EB81E
	ldr r0, _021EB824 ; =0x000008E9
	bl PlaySE
	ldr r0, _021EB830 ; =0x00000868
	mov r1, #0
	add r0, r4, r0
	mov r2, #0x10
	bl MI_CpuFill8
	ldr r0, _021EB834 ; =0x0000086F
	mov r1, #1
	strb r1, [r4, r0]
	add sp, #8
	mov r0, #0x3b
	pop {r4, pc}
_021EB7EE:
	add r0, sp, #4
	add r1, sp, #0
	bl sub_02025364
	ldr r2, [sp, #4]
	ldr r3, [sp]
	add r0, r4, #0
	mov r1, #0x12
	bl ov18_021F2CD0
	cmp r0, #1
	bne _021EB80C
	add sp, #8
	mov r0, #0x3c
	pop {r4, pc}
_021EB80C:
	ldr r0, _021EB830 ; =0x00000868
	add r1, r4, r0
	ldr r0, [sp, #4]
	strh r0, [r1]
	ldr r0, [sp]
	add sp, #8
	strh r0, [r1, #2]
	mov r0, #0x3d
	pop {r4, pc}
_021EB81E:
	mov r0, #0x39
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_021EB824: .word 0x000008E9
_021EB828: .word 0x0000185B
_021EB82C: .word 0x00001859
_021EB830: .word 0x00000868
_021EB834: .word 0x0000086F
	thumb_func_end ov18_021EB654

	thumb_func_start ov18_021EB838
ov18_021EB838: ; 0x021EB838
	push {r3, r4, r5, lr}
	ldr r1, _021EB978 ; =0x00000868
	add r5, r0, #0
	add r4, r5, r1
	ldrb r1, [r4, #4]
	cmp r1, #0
	beq _021EB850
	cmp r1, #1
	beq _021EB8C2
	cmp r1, #2
	beq _021EB920
	b _021EB974
_021EB850:
	mov r1, #0
	add r2, r1, #0
	bl ov18_021F11C0
	add r0, r5, #0
	mov r1, #0x13
	mov r2, #6
	bl ov18_021F118C
	add r0, r5, #0
	mov r1, #0x16
	mov r2, #0
	bl ov18_021F2A2C
	add r0, r5, #0
	mov r1, #0x18
	mov r2, #0
	bl ov18_021F2A84
	ldr r0, _021EB97C ; =0x000005EC
	add r0, r5, r0
	bl ClearWindowTilemapAndScheduleTransfer
	ldr r1, _021EB980 ; =0x00001859
	add r0, r5, #0
	ldrb r1, [r5, r1]
	sub r2, r1, #1
	mov r1, #0xf
	mul r1, r2
	bl ov18_021E6BB8
	str r0, [r4]
	ldr r1, _021EB980 ; =0x00001859
	add r0, r5, #0
	ldrb r1, [r5, r1]
	mov r2, #0x12
	mov r3, #0
	sub r1, r1, #1
	bl ov18_021F2DD4
	add r2, r0, #0
	add r0, r5, #0
	mov r1, #0x12
	mov r3, #0xf
	bl ov18_021F2E14
	strb r0, [r4, #6]
	ldr r0, _021EB980 ; =0x00001859
	ldrb r0, [r5, r0]
	cmp r0, #1
	bne _021EB8BC
	add r0, r5, #0
	bl ov18_021F3C30
_021EB8BC:
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
_021EB8C2:
	ldrb r0, [r4, #5]
	add r0, r0, #1
	strb r0, [r4, #5]
	ldrb r2, [r4, #5]
	ldr r1, [r4]
	add r0, r5, #0
	lsl r3, r2, #5
	mov r2, #0x1e
	lsl r2, r2, #4
	sub r2, r2, r3
	lsl r2, r2, #1
	add r1, r1, r2
	bl ov18_021E6CE8
	ldrb r0, [r4, #5]
	mov r1, #5
	bl _s32_div_f
	add r3, r0, #0
	lsl r3, r3, #0x18
	add r0, r5, #0
	mov r1, #0x3b
	mov r2, #8
	lsr r3, r3, #0x18
	bl ov18_021F16C4
	ldrb r2, [r4, #6]
	add r0, r5, #0
	mov r1, #0x12
	neg r2, r2
	bl ov18_021F2E4C
	ldr r0, _021EB980 ; =0x00001859
	ldrb r0, [r5, r0]
	cmp r0, #1
	bne _021EB912
	add r0, r5, #0
	mov r1, #8
	bl ov18_021F3C54
_021EB912:
	ldrb r0, [r4, #5]
	cmp r0, #0xf
	bne _021EB974
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _021EB974
_021EB920:
	ldrb r0, [r4, #7]
	cmp r0, #1
	bne _021EB92E
	ldr r0, _021EB984 ; =0x0000185A
	ldrb r1, [r5, r0]
	add r1, #0xa
	strb r1, [r5, r0]
_021EB92E:
	ldr r0, _021EB980 ; =0x00001859
	ldrb r1, [r5, r0]
	sub r1, r1, #1
	strb r1, [r5, r0]
	add r0, r5, #0
	mov r1, #0
	bl ov18_021F2BB0
	ldr r0, [r4]
	bl ov18_021E6C90
	add r0, r5, #0
	bl ov18_021E78AC
	add r0, r5, #0
	bl ov18_021EDEB0
	add r0, r5, #0
	mov r1, #0x13
	mov r2, #0
	bl ov18_021F2C10
	add r0, r5, #0
	mov r1, #0x12
	mov r2, #0
	bl ov18_021F2E80
	ldr r0, _021EB978 ; =0x00000868
	mov r1, #0
	add r0, r5, r0
	mov r2, #0x10
	bl MI_CpuFill8
	mov r0, #0x39
	pop {r3, r4, r5, pc}
_021EB974:
	mov r0, #0x3a
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EB978: .word 0x00000868
_021EB97C: .word 0x000005EC
_021EB980: .word 0x00001859
_021EB984: .word 0x0000185A
	thumb_func_end ov18_021EB838

	thumb_func_start ov18_021EB988
ov18_021EB988: ; 0x021EB988
	push {r3, r4, r5, lr}
	ldr r1, _021EBAB4 ; =0x00000868
	add r5, r0, #0
	add r4, r5, r1
	ldrb r1, [r4, #4]
	cmp r1, #0
	beq _021EB9A0
	cmp r1, #1
	beq _021EBA02
	cmp r1, #2
	beq _021EBA5A
	b _021EBAAE
_021EB9A0:
	mov r1, #0
	add r2, r1, #0
	bl ov18_021F11C0
	add r0, r5, #0
	mov r1, #0x14
	mov r2, #9
	bl ov18_021F118C
	add r0, r5, #0
	mov r1, #0x16
	mov r2, #0
	bl ov18_021F2A2C
	add r0, r5, #0
	mov r1, #0x18
	mov r2, #0
	bl ov18_021F2A84
	ldr r0, _021EBAB8 ; =0x000005EC
	add r0, r5, r0
	bl ClearWindowTilemapAndScheduleTransfer
	ldr r1, _021EBABC ; =0x00001859
	add r0, r5, #0
	ldrb r2, [r5, r1]
	mov r1, #0xf
	mul r1, r2
	bl ov18_021E6BB8
	str r0, [r4]
	ldr r1, _021EBABC ; =0x00001859
	add r0, r5, #0
	ldrb r1, [r5, r1]
	mov r2, #0x12
	mov r3, #0
	add r1, r1, #1
	bl ov18_021F2DD4
	add r2, r0, #0
	add r0, r5, #0
	mov r1, #0x12
	mov r3, #0xf
	bl ov18_021F2E14
	strb r0, [r4, #6]
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
_021EBA02:
	ldrb r0, [r4, #5]
	add r0, r0, #1
	strb r0, [r4, #5]
	ldrb r1, [r4, #5]
	ldr r2, [r4]
	add r0, r5, #0
	lsl r1, r1, #6
	add r1, r2, r1
	bl ov18_021E6CE8
	ldrb r0, [r4, #5]
	mov r1, #5
	bl _s32_div_f
	add r3, r0, #0
	mov r1, #0x3b
	add r2, r1, #0
	lsl r3, r3, #0x18
	add r0, r5, #0
	sub r2, #0x43
	lsr r3, r3, #0x18
	bl ov18_021F1760
	ldrb r2, [r4, #6]
	add r0, r5, #0
	mov r1, #0x12
	bl ov18_021F2E4C
	ldr r0, _021EBABC ; =0x00001859
	ldrb r0, [r5, r0]
	cmp r0, #0
	bne _021EBA4C
	mov r1, #7
	add r0, r5, #0
	mvn r1, r1
	bl ov18_021F3C54
_021EBA4C:
	ldrb r0, [r4, #5]
	cmp r0, #0xf
	bne _021EBAAE
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _021EBAAE
_021EBA5A:
	ldrb r0, [r4, #7]
	cmp r0, #1
	bne _021EBA68
	ldr r0, _021EBAC0 ; =0x0000185A
	ldrb r1, [r5, r0]
	sub r1, #0xa
	strb r1, [r5, r0]
_021EBA68:
	ldr r0, _021EBABC ; =0x00001859
	ldrb r1, [r5, r0]
	add r1, r1, #1
	strb r1, [r5, r0]
	add r0, r5, #0
	mov r1, #0
	bl ov18_021F2BB0
	ldr r0, [r4]
	bl ov18_021E6C90
	add r0, r5, #0
	bl ov18_021E78AC
	add r0, r5, #0
	bl ov18_021EDEB0
	add r0, r5, #0
	mov r1, #0x13
	mov r2, #0
	bl ov18_021F2C10
	add r0, r5, #0
	mov r1, #0x12
	mov r2, #0
	bl ov18_021F2E80
	ldr r0, _021EBAB4 ; =0x00000868
	mov r1, #0
	add r0, r5, r0
	mov r2, #0x10
	bl MI_CpuFill8
	mov r0, #0x39
	pop {r3, r4, r5, pc}
_021EBAAE:
	mov r0, #0x3b
	pop {r3, r4, r5, pc}
	nop
_021EBAB4: .word 0x00000868
_021EBAB8: .word 0x000005EC
_021EBABC: .word 0x00001859
_021EBAC0: .word 0x0000185A
	thumb_func_end ov18_021EB988

	thumb_func_start ov18_021EBAC4
ov18_021EBAC4: ; 0x021EBAC4
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r0, sp, #8
	add r1, sp, #4
	bl sub_02025364
	cmp r0, #0
	bne _021EBADC
	add sp, #0xc
	mov r0, #0x39
	pop {r4, r5, pc}
_021EBADC:
	mov r0, #0
	str r0, [sp]
	ldr r2, [sp, #8]
	ldr r3, [sp, #4]
	add r0, r5, #0
	mov r1, #0x12
	bl ov18_021F2D24
	cmp r0, #1
	bne _021EBB56
	ldr r1, _021EBB5C ; =0x00001859
	add r0, r5, #0
	ldrb r2, [r5, r1]
	mov r1, #0xf
	mul r1, r2
	bl ov18_021E6BB8
	ldr r1, _021EBB60 ; =0x0000185E
	add r4, r0, #0
	ldrb r2, [r5, r1]
	mov r0, #1
	eor r0, r2
	strb r0, [r5, r1]
	add r0, r5, #0
	add r1, r4, #0
	bl ov18_021E6CE8
	add r0, r4, #0
	bl ov18_021E6C90
	add r0, r5, #0
	mov r1, #0x3b
	bl ov18_021F1620
	ldr r0, _021EBB5C ; =0x00001859
	ldrb r0, [r5, r0]
	cmp r0, #0
	bne _021EBB30
	add r0, r5, #0
	bl ov18_021F3C88
	b _021EBB3A
_021EBB30:
	add r0, r5, #0
	mov r1, #0x19
	mov r2, #0
	bl ov18_021F11C0
_021EBB3A:
	add r0, r5, #0
	bl ov18_021E78AC
	add r0, r5, #0
	bl ov18_021EDEB0
	add r0, r5, #0
	mov r1, #0x13
	mov r2, #0
	bl ov18_021F2C10
	ldr r0, _021EBB64 ; =0x000008E8
	bl PlaySE
_021EBB56:
	mov r0, #0x3c
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_021EBB5C: .word 0x00001859
_021EBB60: .word 0x0000185E
_021EBB64: .word 0x000008E8
	thumb_func_end ov18_021EBAC4

	thumb_func_start ov18_021EBB68
ov18_021EBB68: ; 0x021EBB68
	push {r3, r4, r5, lr}
	ldr r1, _021EBBF8 ; =0x00000868
	add r5, r0, #0
	add r3, r5, r1
	mov r1, #0
	str r1, [sp]
	ldrh r2, [r3]
	ldrh r3, [r3, #2]
	mov r1, #0x12
	bl ov18_021F2D24
	cmp r0, #1
	bne _021EBBF4
	ldr r1, _021EBBFC ; =0x00001859
	add r0, r5, #0
	ldrb r2, [r5, r1]
	mov r1, #0xf
	mul r1, r2
	bl ov18_021E6BB8
	ldr r1, _021EBC00 ; =0x0000185E
	add r4, r0, #0
	ldrb r2, [r5, r1]
	mov r0, #1
	eor r0, r2
	strb r0, [r5, r1]
	add r0, r5, #0
	add r1, r4, #0
	bl ov18_021E6CE8
	add r0, r4, #0
	bl ov18_021E6C90
	add r0, r5, #0
	mov r1, #0x3b
	bl ov18_021F1620
	ldr r0, _021EBBFC ; =0x00001859
	ldrb r0, [r5, r0]
	cmp r0, #0
	bne _021EBBC2
	add r0, r5, #0
	bl ov18_021F3C88
	b _021EBBCC
_021EBBC2:
	add r0, r5, #0
	mov r1, #0x19
	mov r2, #0
	bl ov18_021F11C0
_021EBBCC:
	add r0, r5, #0
	bl ov18_021E78AC
	add r0, r5, #0
	bl ov18_021EDEB0
	add r0, r5, #0
	mov r1, #0x13
	mov r2, #1
	bl ov18_021F2C10
	ldr r0, _021EBC04 ; =0x000008E8
	bl PlaySE
	ldr r0, _021EBBF8 ; =0x00000868
	mov r1, #0
	add r0, r5, r0
	mov r2, #0x10
	bl MI_CpuFill8
_021EBBF4:
	mov r0, #0x39
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EBBF8: .word 0x00000868
_021EBBFC: .word 0x00001859
_021EBC00: .word 0x0000185E
_021EBC04: .word 0x000008E8
	thumb_func_end ov18_021EBB68

	thumb_func_start ov18_021EBC08
ov18_021EBC08: ; 0x021EBC08
	push {r4, lr}
	sub sp, #0x20
	ldr r1, _021EBD10 ; =0x00000868
	add r4, r0, #0
	ldrb r1, [r4, r1]
	cmp r1, #0
	beq _021EBC1C
	cmp r1, #1
	beq _021EBCD8
	b _021EBD0A
_021EBC1C:
	bl ov18_021F8838
	add r1, r0, #0
	beq _021EBC30
	ldr r2, _021EBD14 ; =0x00001858
	ldr r0, [r4]
	ldrb r2, [r4, r2]
	ldr r0, [r0, #8]
	bl sub_02092BD8
_021EBC30:
	mov r0, #0x11
	str r0, [sp]
	str r0, [sp, #4]
	mov r2, #0
	str r2, [sp, #8]
	mov r0, #0x98
	str r0, [sp, #0xc]
	str r2, [sp, #0x10]
	str r0, [sp, #0x14]
	mov r0, #8
	str r0, [sp, #0x18]
	mov r0, #0xe
	str r0, [sp, #0x1c]
	ldr r1, _021EBD14 ; =0x00001858
	add r0, r4, #0
	ldrb r1, [r4, r1]
	mov r3, #0x1a
	bl ov18_021F7ED4
	add r0, r4, #0
	mov r1, #1
	bl ov18_021F8884
	add r0, r4, #0
	bl ov18_021EDDB4
	add r0, r4, #0
	bl ov18_021EDE64
	ldr r0, [r4, #8]
	mov r1, #4
	bl sub_0201980C
	add r0, r4, #0
	mov r1, #0x16
	mov r2, #0
	bl ov18_021F2A2C
	add r0, r4, #0
	mov r1, #0x18
	mov r2, #0
	bl ov18_021F2A84
	ldr r0, _021EBD18 ; =0x000005EC
	add r0, r4, r0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r3, #0
	str r3, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0x85
	str r3, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r2, _021EBD1C ; =0x0000FFFE
	mov r1, #1
	bl sub_02003370
	mov r3, #0
	str r3, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0x85
	str r3, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r2, _021EBD20 ; =0x0000FFFF
	mov r1, #0xe
	bl sub_02003370
	ldr r0, _021EBD24 ; =0x0000085C
	mov r1, #0x3e
	str r1, [r4, r0]
	add r0, r4, #0
	bl ov18_021E66C4
	ldr r0, _021EBD10 ; =0x00000868
	add sp, #0x20
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	mov r0, #3
	pop {r4, pc}
_021EBCD8:
	ldr r0, [r4, #8]
	mov r1, #8
	bl sub_020199E4
	cmp r0, #0
	bne _021EBD0A
	mov r0, #0xf
	mov r1, #0x25
	bl sub_02003BA8
	add r0, r4, #0
	bl ov18_021EE388
	add r0, r4, #0
	bl ov18_021F3294
	add r0, r4, #0
	bl ov18_021F3438
	ldr r0, _021EBD10 ; =0x00000868
	mov r1, #0
	strb r1, [r4, r0]
	add sp, #0x20
	mov r0, #0x15
	pop {r4, pc}
_021EBD0A:
	mov r0, #0x3e
	add sp, #0x20
	pop {r4, pc}
	.balign 4, 0
_021EBD10: .word 0x00000868
_021EBD14: .word 0x00001858
_021EBD18: .word 0x000005EC
_021EBD1C: .word 0x0000FFFE
_021EBD20: .word 0x0000FFFF
_021EBD24: .word 0x0000085C
	thumb_func_end ov18_021EBC08

	thumb_func_start ov18_021EBD28
ov18_021EBD28: ; 0x021EBD28
	push {r4, lr}
	sub sp, #0x20
	ldr r1, _021EBEB8 ; =0x00000868
	add r4, r0, #0
	ldrb r2, [r4, r1]
	cmp r2, #0
	beq _021EBD44
	cmp r2, #1
	bne _021EBD3C
	b _021EBE62
_021EBD3C:
	cmp r2, #2
	bne _021EBD42
	b _021EBE82
_021EBD42:
	b _021EBEB2
_021EBD44:
	bl ov18_021F8838
	add r1, r0, #0
	beq _021EBD58
	ldr r2, _021EBEBC ; =0x00001858
	ldr r0, [r4]
	ldrb r2, [r4, r2]
	ldr r0, [r0, #8]
	bl sub_02092BD8
_021EBD58:
	mov r0, #0x11
	str r0, [sp]
	str r0, [sp, #4]
	mov r2, #0
	str r2, [sp, #8]
	mov r0, #0x98
	str r0, [sp, #0xc]
	str r2, [sp, #0x10]
	str r0, [sp, #0x14]
	mov r0, #8
	str r0, [sp, #0x18]
	mov r0, #0xe
	str r0, [sp, #0x1c]
	ldr r1, _021EBEBC ; =0x00001858
	add r0, r4, #0
	ldrb r1, [r4, r1]
	mov r3, #0x1a
	bl ov18_021F7ED4
	add r0, r4, #0
	mov r1, #1
	bl ov18_021F8884
	add r0, r4, #0
	bl ov18_021EDDB4
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021EBEC0 ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021EBEC0 ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x11
	mov r3, #4
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	add r0, r4, #0
	bl ov18_021E7724
	mov r1, #0xd
	add r2, r1, #0
	ldr r0, [r4, #8]
	sub r2, #0x31
	mov r3, #0
	bl sub_020196E8
	mov r1, #0xf
	add r2, r1, #0
	ldr r0, [r4, #8]
	sub r2, #0x33
	mov r3, #0
	bl sub_020196E8
	mov r1, #0xe
	add r2, r1, #0
	ldr r0, [r4, #8]
	sub r2, #0x12
	mov r3, #0
	bl sub_020196E8
	mov r0, #0x12
	str r0, [sp]
	ldr r0, [r4, #8]
	mov r1, #0xd
	mov r2, #2
	mov r3, #0
	bl sub_020198FC
	mov r0, #0x12
	str r0, [sp]
	ldr r0, [r4, #8]
	mov r1, #0xf
	mov r2, #2
	mov r3, #0
	bl sub_020198FC
	mov r0, #0x12
	str r0, [sp]
	ldr r0, [r4, #8]
	mov r1, #0xe
	mov r2, #2
	mov r3, #0
	bl sub_020198FC
	ldr r0, [r4, #8]
	mov r1, #4
	bl sub_0201980C
	add r0, r4, #0
	mov r1, #0x16
	mov r2, #0
	bl ov18_021F2A2C
	add r0, r4, #0
	mov r1, #0x18
	mov r2, #0
	bl ov18_021F2A84
	ldr r0, _021EBEC4 ; =0x000005EC
	add r0, r4, r0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov18_021F11C0
	add r0, r4, #0
	bl ov18_021F3AD8
	add r0, r4, #0
	bl ov18_021E66C4
	ldr r0, _021EBEB8 ; =0x00000868
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
_021EBE62:
	ldr r0, [r4, #8]
	mov r1, #0xd
	bl sub_020199E4
	cmp r0, #0
	bne _021EBE78
	ldr r0, _021EBEB8 ; =0x00000868
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _021EBEB2
_021EBE78:
	add r0, r4, #0
	mov r1, #0x10
	bl ov18_021F3B2C
	b _021EBEB2
_021EBE82:
	mov r2, #0
	strb r2, [r4, r1]
	bl ov18_021EE388
	add r0, r4, #0
	bl ov18_021F3294
	add r0, r4, #0
	bl ov18_021F3438
	add r0, r4, #0
	mov r1, #0
	bl ov18_021E67C8
	ldr r0, [r4, #8]
	mov r1, #0
	bl sub_0201980C
	ldr r0, _021EBEB8 ; =0x00000868
	mov r1, #1
	strh r1, [r4, r0]
	add sp, #0x20
	mov r0, #9
	pop {r4, pc}
_021EBEB2:
	mov r0, #0x3f
	add sp, #0x20
	pop {r4, pc}
	.balign 4, 0
_021EBEB8: .word 0x00000868
_021EBEBC: .word 0x00001858
_021EBEC0: .word 0x00000854
_021EBEC4: .word 0x000005EC
	thumb_func_end ov18_021EBD28

	thumb_func_start ov18_021EBEC8
ov18_021EBEC8: ; 0x021EBEC8
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r1, _021EBFA4 ; =0x00000868
	add r4, r0, #0
	ldrb r1, [r4, r1]
	cmp r1, #0
	beq _021EBEDC
	cmp r1, #1
	beq _021EBF6C
	b _021EBF9C
_021EBEDC:
	bl ov18_021F8838
	add r1, r0, #0
	beq _021EBEF0
	ldr r2, _021EBFA8 ; =0x00001858
	ldr r0, [r4]
	ldrb r2, [r4, r2]
	ldr r0, [r0, #8]
	bl sub_02092BD8
_021EBEF0:
	ldr r0, [r4, #8]
	mov r1, #4
	bl sub_0201980C
	add r0, r4, #0
	mov r1, #0x16
	mov r2, #0
	bl ov18_021F2A2C
	add r0, r4, #0
	mov r1, #0x18
	mov r2, #0
	bl ov18_021F2A84
	ldr r0, _021EBFAC ; =0x000005EC
	add r0, r4, r0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov18_021F11C0
	add r0, r4, #0
	bl ov18_021E66C4
	mov r3, #0
	str r3, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0x85
	str r3, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r2, _021EBFB0 ; =0x0000FFFE
	mov r1, #1
	bl sub_02003370
	mov r3, #0
	str r3, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0x85
	str r3, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r2, _021EBFB4 ; =0x0000FFFF
	mov r1, #0xe
	bl sub_02003370
	ldr r1, _021EBFB8 ; =0x0000085C
	mov r0, #0x40
	str r0, [r4, r1]
	add r0, r1, #0
	add r0, #0xc
	ldrb r0, [r4, r0]
	add r1, #0xc
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r4, r1]
	mov r0, #3
	pop {r3, r4, pc}
_021EBF6C:
	ldr r0, [r4, #8]
	mov r1, #8
	bl sub_020199E4
	cmp r0, #0
	bne _021EBF9C
	ldr r0, _021EBFA4 ; =0x00000868
	mov r1, #0
	strb r1, [r4, r0]
	add r0, r4, #0
	bl ov18_021EE388
	add r0, r4, #0
	bl ov18_021F3294
	add r0, r4, #0
	bl ov18_021F3438
	ldr r0, _021EBFBC ; =0x000018A0
	mov r1, #5
	strb r1, [r4, r0]
	add sp, #0xc
	mov r0, #0x42
	pop {r3, r4, pc}
_021EBF9C:
	mov r0, #0x40
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_021EBFA4: .word 0x00000868
_021EBFA8: .word 0x00001858
_021EBFAC: .word 0x000005EC
_021EBFB0: .word 0x0000FFFE
_021EBFB4: .word 0x0000FFFF
_021EBFB8: .word 0x0000085C
_021EBFBC: .word 0x000018A0
	thumb_func_end ov18_021EBEC8

	thumb_func_start ov18_021EBFC0
ov18_021EBFC0: ; 0x021EBFC0
	push {r4, lr}
	sub sp, #0x10
	ldr r1, _021EC1C8 ; =0x00000868
	add r4, r0, #0
	ldrb r1, [r4, r1]
	cmp r1, #0
	beq _021EBFD6
	cmp r1, #1
	bne _021EBFD4
	b _021EC1AA
_021EBFD4:
	b _021EC1C2
_021EBFD6:
	mov r1, #5
	bl ov18_021E67C8
	add r0, r4, #0
	mov r1, #0
	mov r2, #9
	bl ov18_021EA350
	add r0, r4, #0
	mov r1, #2
	mov r2, #0xa
	bl ov18_021EA350
	add r0, r4, #0
	mov r1, #0
	mov r2, #0xb
	bl ov18_021EA350
	add r0, r4, #0
	mov r1, #2
	mov r2, #0xc
	bl ov18_021EA350
	add r0, r4, #0
	bl ov18_021EFEC4
	add r0, r4, #0
	mov r1, #0x3b
	bl ov18_021F1620
	add r0, r4, #0
	bl ov18_021E6CC0
	add r0, r4, #0
	mov r1, #0x12
	mov r2, #1
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #0x13
	mov r2, #1
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #0x14
	mov r2, #1
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #0x15
	mov r2, #1
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #0x19
	mov r2, #1
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #0x12
	mov r2, #0
	bl ov18_021F2C5C
	add r0, r4, #0
	mov r1, #0x12
	mov r2, #0
	bl ov18_021F2E80
	add r0, r4, #0
	mov r1, #0x13
	mov r2, #0
	bl ov18_021F2C10
	add r0, r4, #0
	mov r1, #1
	bl ov18_021EEED0
	add r0, r4, #0
	bl ov18_021F3BA4
	mov r1, #0xbf
	add r0, r4, #0
	mvn r1, r1
	bl ov18_021F3BD4
	mov r2, #0
	ldr r0, [r4, #8]
	mov r1, #9
	add r3, r2, #0
	bl sub_020196E8
	mov r2, #0
	ldr r0, [r4, #8]
	mov r1, #0xa
	add r3, r2, #0
	bl sub_020196E8
	mov r2, #0
	ldr r0, [r4, #8]
	mov r1, #0xb
	add r3, r2, #0
	bl sub_020196E8
	mov r2, #0
	ldr r0, [r4, #8]
	mov r1, #0xc
	add r3, r2, #0
	bl sub_020196E8
	ldr r0, [r4, #8]
	mov r1, #9
	bl sub_0201980C
	ldr r0, [r4, #8]
	mov r1, #0xa
	bl sub_0201980C
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021EC1CC ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #4
	mov r3, #2
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021EC1CC ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x13
	mov r3, #7
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x25
	str r0, [sp, #0xc]
	ldr r0, _021EC1CC ; =0x00000854
	ldr r2, [r4, #4]
	ldr r0, [r4, r0]
	mov r1, #0x14
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add r0, r4, #0
	bl ov18_021E669C
	add r0, r4, #0
	bl ov18_021F3448
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #0
	bl ov18_021F2BB0
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	bl ov18_021F118C
	add r0, r4, #0
	bl ov18_021F3190
	add r0, r4, #0
	bl ov18_021E78AC
	add r0, r4, #0
	bl ov18_021EDEB0
	add r0, r4, #0
	bl ov18_021E659C
	ldr r0, _021EC1D0 ; =0x00001859
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _021EC166
	mov r1, #0x27
	add r0, r4, #0
	mvn r1, r1
	bl ov18_021F3C54
_021EC166:
	mov r0, #0x10
	str r0, [sp]
	mov r3, #0
	str r3, [sp, #4]
	mov r0, #0x85
	str r3, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r2, _021EC1D4 ; =0x0000FFEF
	mov r1, #1
	bl sub_02003370
	mov r0, #0x10
	str r0, [sp]
	mov r3, #0
	str r3, [sp, #4]
	mov r0, #0x85
	str r3, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r2, _021EC1D8 ; =0x0000FFFF
	mov r1, #0xe
	bl sub_02003370
	ldr r0, _021EC1C8 ; =0x00000868
	add sp, #0x10
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	mov r1, #0x41
	sub r0, #0xc
	str r1, [r4, r0]
	mov r0, #3
	pop {r4, pc}
_021EC1AA:
	ldr r0, [r4, #8]
	mov r1, #8
	bl sub_020199E4
	cmp r0, #0
	bne _021EC1C2
	ldr r0, _021EC1C8 ; =0x00000868
	mov r1, #0
	strb r1, [r4, r0]
	add sp, #0x10
	mov r0, #0x39
	pop {r4, pc}
_021EC1C2:
	mov r0, #0x41
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_021EC1C8: .word 0x00000868
_021EC1CC: .word 0x00000854
_021EC1D0: .word 0x00001859
_021EC1D4: .word 0x0000FFEF
_021EC1D8: .word 0x0000FFFF
	thumb_func_end ov18_021EBFC0

	thumb_func_start ov18_021EC1DC
ov18_021EC1DC: ; 0x021EC1DC
	push {r4, r5, r6, lr}
	add r4, r2, #0
	ldr r2, _021EC278 ; =0x00000868
	add r5, r0, #0
	add r2, r5, r2
	mov r6, #0
	strh r6, [r2]
	strb r1, [r2, #2]
	cmp r4, #0xff
	bne _021EC202
	mov r1, #3
	bl ov18_021F3D80
	add r0, r5, #0
	mov r1, #0x18
	mov r2, #0x43
	bl ov18_021EDC28
	pop {r4, r5, r6, pc}
_021EC202:
	cmp r4, #1
	bne _021EC20E
	add r1, r6, #0
	bl ov18_021F3D80
	b _021EC232
_021EC20E:
	cmp r4, #2
	bne _021EC21C
	mov r1, #1
	mov r6, #8
	bl ov18_021F3D80
	b _021EC232
_021EC21C:
	cmp r4, #3
	bne _021EC22A
	mov r1, #2
	mov r6, #0x10
	bl ov18_021F3D80
	b _021EC232
_021EC22A:
	mov r1, #3
	mov r6, #0x18
	bl ov18_021F3D80
_021EC232:
	ldr r0, _021EC27C ; =0x0000185B
	ldrb r1, [r5, r0]
	cmp r1, #1
	bne _021EC248
	strb r4, [r5, r0]
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0x46
	bl ov18_021EDC28
	pop {r4, r5, r6, pc}
_021EC248:
	cmp r1, #2
	bne _021EC25A
	strb r4, [r5, r0]
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0x4e
	bl ov18_021EDC28
	pop {r4, r5, r6, pc}
_021EC25A:
	cmp r1, #3
	strb r4, [r5, r0]
	bne _021EC26C
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0x51
	bl ov18_021EDC28
	pop {r4, r5, r6, pc}
_021EC26C:
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0x5b
	bl ov18_021EDC28
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021EC278: .word 0x00000868
_021EC27C: .word 0x0000185B
	thumb_func_end ov18_021EC1DC

	thumb_func_start ov18_021EC280
ov18_021EC280: ; 0x021EC280
	push {r4, lr}
	add r4, r0, #0
	bl ov18_021F8838
	ldr r1, _021EC2C0 ; =0x000018A2
	mov r2, #0
	strh r0, [r4, r1]
	add r0, r1, #0
	add r0, #0x27
	strb r2, [r4, r0]
	add r0, r1, #0
	add r0, #0x28
	strb r2, [r4, r0]
	add r1, #0x26
	add r0, r4, #0
	strb r2, [r4, r1]
	bl ov18_021E8254
	add r0, r4, #0
	bl ov18_021E673C
	add r0, r4, #0
	bl ov18_021E66EC
	add r0, r4, #0
	bl ov18_021F3D34
	add r0, r4, #0
	bl ov18_021EC3E8
	pop {r4, pc}
	nop
_021EC2C0: .word 0x000018A2
	thumb_func_end ov18_021EC280

	thumb_func_start ov18_021EC2C4
ov18_021EC2C4: ; 0x021EC2C4
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r1, _021EC3D0 ; =0x00000868
	add r5, r0, #0
	add r4, r5, r1
	ldrh r1, [r4]
	cmp r1, #0
	beq _021EC2DA
	cmp r1, #1
	beq _021EC32E
	b _021EC3CA
_021EC2DA:
	mov r1, #0
	add r2, r1, #0
	bl ov18_021F11C0
	add r0, r5, #0
	bl ov18_021E6714
	ldrb r0, [r4, #2]
	mov r3, #0
	ldr r2, _021EC3D4 ; =0x0000F7BE
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0x85
	str r3, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_02003370
	ldrb r0, [r4, #2]
	mov r3, #0
	ldr r2, _021EC3D8 ; =0x0000FFFF
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0x85
	str r3, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0xe
	bl sub_02003370
	ldrh r0, [r4]
	mov r1, #0x43
	add sp, #0xc
	add r0, r0, #1
	strh r0, [r4]
	ldr r0, _021EC3DC ; =0x0000085C
	str r1, [r5, r0]
	mov r0, #3
	pop {r4, r5, pc}
_021EC32E:
	ldr r0, [r5, #8]
	mov r1, #0x10
	bl sub_020199E4
	cmp r0, #0
	bne _021EC3CA
	mov r0, #0xf
	mov r1, #0x25
	bl sub_02003BA8
	ldr r0, _021EC3E0 ; =0x0000185B
	ldrb r0, [r5, r0]
	cmp r0, #3
	bne _021EC358
	add r0, r5, #0
	bl ov18_021F0918
	add r0, r5, #0
	bl ov18_021F5DE0
	b _021EC39C
_021EC358:
	cmp r0, #2
	bne _021EC372
	add r0, r5, #0
	bl ov18_021F0838
	add r0, r5, #0
	bl ov18_021F4A50
	add r0, r5, #0
	mov r1, #0
	bl ov18_021E5E70
	b _021EC39C
_021EC372:
	cmp r0, #1
	bne _021EC396
	add r0, r5, #0
	bl ov18_021F03C0
	add r0, r5, #0
	bl ov18_021F3E08
	add r0, r5, #0
	bl ov18_021E8648
	add r0, r5, #0
	bl ov18_021E8BD4
	add r0, r5, #0
	bl ov18_021EE20C
	b _021EC39C
_021EC396:
	add r0, r5, #0
	bl ov18_021F08E0
_021EC39C:
	add r0, r5, #0
	bl ov18_021F3D6C
	ldr r0, _021EC3D0 ; =0x00000868
	mov r1, #0
	add r0, r5, r0
	mov r2, #0x10
	bl MI_CpuFill8
	ldr r1, _021EC3E4 ; =0x000018A0
	add r0, r1, #0
	ldrb r2, [r5, r1]
	sub r0, #0x45
	strb r2, [r5, r0]
	ldrb r0, [r5, r1]
	cmp r0, #0
	bne _021EC3C4
	add sp, #0xc
	mov r0, #0x13
	pop {r4, r5, pc}
_021EC3C4:
	add sp, #0xc
	mov r0, #0x41
	pop {r4, r5, pc}
_021EC3CA:
	mov r0, #0x43
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_021EC3D0: .word 0x00000868
_021EC3D4: .word 0x0000F7BE
_021EC3D8: .word 0x0000FFFF
_021EC3DC: .word 0x0000085C
_021EC3E0: .word 0x0000185B
_021EC3E4: .word 0x000018A0
	thumb_func_end ov18_021EC2C4

	thumb_func_start ov18_021EC3E8
ov18_021EC3E8: ; 0x021EC3E8
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r1, _021EC4E4 ; =0x00000868
	add r4, r0, #0
	ldrb r1, [r4, r1]
	cmp r1, #0
	beq _021EC3FC
	cmp r1, #1
	beq _021EC4B6
	b _021EC4DE
_021EC3FC:
	ldr r1, _021EC4E8 ; =0x000018C9
	mov r3, #0
	strb r3, [r4, r1]
	sub r2, r1, #1
	strb r3, [r4, r2]
	add r1, r1, #1
	strb r3, [r4, r1]
	bl ov18_021E8B94
	ldr r2, _021EC4E8 ; =0x000018C9
	add r0, r4, #0
	ldrsb r1, [r4, r2]
	sub r2, r2, #1
	ldrsb r2, [r4, r2]
	bl ov18_021E8528
	add r0, r4, #0
	bl ov18_021F018C
	add r0, r4, #0
	mov r1, #1
	bl ov18_021E67C8
	add r0, r4, #0
	bl ov18_021EE170
	add r0, r4, #0
	bl ov18_021EE1F8
	add r0, r4, #0
	bl ov18_021F4384
	add r0, r4, #0
	bl ov18_021EE314
	mov r0, #0x19
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _021EC452
	add r0, r4, #0
	bl ov18_021E6794
_021EC452:
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x85
	lsl r0, r0, #4
	mov r1, #1
	ldr r0, [r4, r0]
	ldr r2, _021EC4EC ; =0x0000F7BE
	sub r3, r1, #3
	bl sub_02003370
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x85
	lsl r0, r0, #4
	mov r1, #4
	ldr r0, [r4, r0]
	ldr r2, _021EC4F0 ; =0x0000FFEF
	sub r3, r1, #6
	bl sub_02003370
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x85
	lsl r0, r0, #4
	mov r1, #0xa
	add r3, r1, #0
	ldr r0, [r4, r0]
	ldr r2, _021EC4F4 ; =0x0000FFFF
	sub r3, #0xc
	bl sub_02003370
	ldr r0, _021EC4E4 ; =0x00000868
	add sp, #0xc
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	mov r1, #0x44
	sub r0, #0xc
	str r1, [r4, r0]
	mov r0, #3
	pop {r3, r4, pc}
_021EC4B6:
	ldr r0, [r4, #8]
	mov r1, #0x10
	bl sub_020199E4
	cmp r0, #0
	bne _021EC4DE
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	bl ov18_021F11C0
	ldr r0, _021EC4F8 ; =0x0000185B
	mov r1, #1
	strb r1, [r4, r0]
	ldr r0, _021EC4E4 ; =0x00000868
	mov r1, #0
	strb r1, [r4, r0]
	add sp, #0xc
	mov r0, #0x45
	pop {r3, r4, pc}
_021EC4DE:
	mov r0, #0x44
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_021EC4E4: .word 0x00000868
_021EC4E8: .word 0x000018C9
_021EC4EC: .word 0x0000F7BE
_021EC4F0: .word 0x0000FFEF
_021EC4F4: .word 0x0000FFFF
_021EC4F8: .word 0x0000185B
	thumb_func_end ov18_021EC3E8

	thumb_func_start ov18_021EC4FC
ov18_021EC4FC: ; 0x021EC4FC
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl ov18_021EE26C
	add r0, r4, #0
	add r1, sp, #8
	bl ov18_021F7C14
	cmp r0, #0x10
	bls _021EC514
	b _021EC79A
_021EC514:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021EC520: ; jump table
	.short _021EC542 - _021EC520 - 2 ; case 0
	.short _021EC564 - _021EC520 - 2 ; case 1
	.short _021EC586 - _021EC520 - 2 ; case 2
	.short _021EC5A8 - _021EC520 - 2 ; case 3
	.short _021EC5BE - _021EC520 - 2 ; case 4
	.short _021EC5EE - _021EC520 - 2 ; case 5
	.short _021EC61E - _021EC520 - 2 ; case 6
	.short _021EC64C - _021EC520 - 2 ; case 7
	.short _021EC5EE - _021EC520 - 2 ; case 8
	.short _021EC64C - _021EC520 - 2 ; case 9
	.short _021EC67A - _021EC520 - 2 ; case 10
	.short _021EC6A8 - _021EC520 - 2 ; case 11
	.short _021EC6CE - _021EC520 - 2 ; case 12
	.short _021EC6F4 - _021EC520 - 2 ; case 13
	.short _021EC720 - _021EC520 - 2 ; case 14
	.short _021EC74C - _021EC520 - 2 ; case 15
	.short _021EC778 - _021EC520 - 2 ; case 16
_021EC542:
	ldr r0, [sp, #8]
	cmp r0, #1
	bne _021EC550
	ldr r0, _021EC7A0 ; =0x000008E9
	bl PlaySE
	b _021EC556
_021EC550:
	ldr r0, _021EC7A4 ; =0x000008E8
	bl PlaySE
_021EC556:
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x45
	bl ov18_021EDC28
	add sp, #0xc
	pop {r3, r4, pc}
_021EC564:
	ldr r0, [sp, #8]
	cmp r0, #1
	bne _021EC572
	ldr r0, _021EC7A0 ; =0x000008E9
	bl PlaySE
	b _021EC578
_021EC572:
	ldr r0, _021EC7A4 ; =0x000008E8
	bl PlaySE
_021EC578:
	add r0, r4, #0
	mov r1, #0
	mov r2, #2
	bl ov18_021EC1DC
	add sp, #0xc
	pop {r3, r4, pc}
_021EC586:
	ldr r0, [sp, #8]
	cmp r0, #1
	bne _021EC594
	ldr r0, _021EC7A0 ; =0x000008E9
	bl PlaySE
	b _021EC59A
_021EC594:
	ldr r0, _021EC7A4 ; =0x000008E8
	bl PlaySE
_021EC59A:
	add r0, r4, #0
	mov r1, #0
	mov r2, #3
	bl ov18_021EC1DC
	add sp, #0xc
	pop {r3, r4, pc}
_021EC5A8:
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	mov r1, #0
	mov r2, #0xff
	bl ov18_021EC1DC
	add sp, #0xc
	pop {r3, r4, pc}
_021EC5BE:
	mov r1, #1
	add r0, r4, #0
	mvn r1, r1
	mov r2, #2
	bl ov18_021EE0F0
	cmp r0, #1
	bne _021EC5E8
	ldr r0, [sp, #8]
	cmp r0, #1
	bne _021EC5DC
	ldr r0, _021EC7A0 ; =0x000008E9
	bl PlaySE
	b _021EC5E2
_021EC5DC:
	ldr r0, _021EC7A4 ; =0x000008E8
	bl PlaySE
_021EC5E2:
	add sp, #0xc
	mov r0, #0x47
	pop {r3, r4, pc}
_021EC5E8:
	add sp, #0xc
	mov r0, #0x45
	pop {r3, r4, pc}
_021EC5EE:
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	mov r2, #1
	bl ov18_021EE0F0
	cmp r0, #1
	bne _021EC618
	ldr r0, [sp, #8]
	cmp r0, #1
	bne _021EC60C
	ldr r0, _021EC7A0 ; =0x000008E9
	bl PlaySE
	b _021EC612
_021EC60C:
	ldr r0, _021EC7A4 ; =0x000008E8
	bl PlaySE
_021EC612:
	add sp, #0xc
	mov r0, #0x47
	pop {r3, r4, pc}
_021EC618:
	add sp, #0xc
	mov r0, #0x45
	pop {r3, r4, pc}
_021EC61E:
	mov r1, #2
	add r0, r4, #0
	add r2, r1, #0
	bl ov18_021EE0F0
	cmp r0, #1
	bne _021EC646
	ldr r0, [sp, #8]
	cmp r0, #1
	bne _021EC63A
	ldr r0, _021EC7A0 ; =0x000008E9
	bl PlaySE
	b _021EC640
_021EC63A:
	ldr r0, _021EC7A4 ; =0x000008E8
	bl PlaySE
_021EC640:
	add sp, #0xc
	mov r0, #0x48
	pop {r3, r4, pc}
_021EC646:
	add sp, #0xc
	mov r0, #0x45
	pop {r3, r4, pc}
_021EC64C:
	mov r1, #1
	add r0, r4, #0
	add r2, r1, #0
	bl ov18_021EE0F0
	cmp r0, #1
	bne _021EC674
	ldr r0, [sp, #8]
	cmp r0, #1
	bne _021EC668
	ldr r0, _021EC7A0 ; =0x000008E9
	bl PlaySE
	b _021EC66E
_021EC668:
	ldr r0, _021EC7A4 ; =0x000008E8
	bl PlaySE
_021EC66E:
	add sp, #0xc
	mov r0, #0x48
	pop {r3, r4, pc}
_021EC674:
	add sp, #0xc
	mov r0, #0x45
	pop {r3, r4, pc}
_021EC67A:
	add r0, sp, #4
	add r1, sp, #0
	bl sub_02025364
	ldr r1, [sp, #4]
	ldr r2, [sp]
	add r0, r4, #0
	bl ov18_021F62B4
	cmp r0, #1
	bne _021EC696
	add sp, #0xc
	mov r0, #0x49
	pop {r3, r4, pc}
_021EC696:
	ldr r0, _021EC7A8 ; =0x00000868
	add r1, r4, r0
	ldr r0, [sp, #4]
	strh r0, [r1]
	ldr r0, [sp]
	add sp, #0xc
	strh r0, [r1, #2]
	mov r0, #0x4a
	pop {r3, r4, pc}
_021EC6A8:
	add r0, r4, #0
	mov r1, #0
	bl ov18_021EE140
	cmp r0, #1
	bne _021EC79A
	ldr r0, [sp, #8]
	cmp r0, #1
	bne _021EC6C2
	ldr r0, _021EC7A0 ; =0x000008E9
	bl PlaySE
	b _021EC6C8
_021EC6C2:
	ldr r0, _021EC7A4 ; =0x000008E8
	bl PlaySE
_021EC6C8:
	add sp, #0xc
	mov r0, #0x4b
	pop {r3, r4, pc}
_021EC6CE:
	add r0, r4, #0
	mov r1, #1
	bl ov18_021EE140
	cmp r0, #1
	bne _021EC79A
	ldr r0, [sp, #8]
	cmp r0, #1
	bne _021EC6E8
	ldr r0, _021EC7A0 ; =0x000008E9
	bl PlaySE
	b _021EC6EE
_021EC6E8:
	ldr r0, _021EC7A4 ; =0x000008E8
	bl PlaySE
_021EC6EE:
	add sp, #0xc
	mov r0, #0x4b
	pop {r3, r4, pc}
_021EC6F4:
	add r0, r4, #0
	mov r1, #0
	bl ov18_021EE124
	cmp r0, #1
	bne _021EC79A
	ldr r0, [sp, #8]
	cmp r0, #1
	bne _021EC70E
	ldr r0, _021EC7A0 ; =0x000008E9
	bl PlaySE
	b _021EC714
_021EC70E:
	ldr r0, _021EC7A4 ; =0x000008E8
	bl PlaySE
_021EC714:
	add r0, r4, #0
	bl ov18_021F4080
	add sp, #0xc
	mov r0, #0x4b
	pop {r3, r4, pc}
_021EC720:
	add r0, r4, #0
	mov r1, #1
	bl ov18_021EE124
	cmp r0, #1
	bne _021EC79A
	ldr r0, [sp, #8]
	cmp r0, #1
	bne _021EC73A
	ldr r0, _021EC7A0 ; =0x000008E9
	bl PlaySE
	b _021EC740
_021EC73A:
	ldr r0, _021EC7A4 ; =0x000008E8
	bl PlaySE
_021EC740:
	add r0, r4, #0
	bl ov18_021F4080
	add sp, #0xc
	mov r0, #0x4b
	pop {r3, r4, pc}
_021EC74C:
	add r0, r4, #0
	mov r1, #2
	bl ov18_021EE124
	cmp r0, #1
	bne _021EC79A
	ldr r0, [sp, #8]
	cmp r0, #1
	bne _021EC766
	ldr r0, _021EC7A0 ; =0x000008E9
	bl PlaySE
	b _021EC76C
_021EC766:
	ldr r0, _021EC7A4 ; =0x000008E8
	bl PlaySE
_021EC76C:
	add r0, r4, #0
	bl ov18_021F4080
	add sp, #0xc
	mov r0, #0x4b
	pop {r3, r4, pc}
_021EC778:
	ldr r0, [sp, #8]
	cmp r0, #1
	bne _021EC786
	ldr r0, _021EC7A0 ; =0x000008E9
	bl PlaySE
	b _021EC78C
_021EC786:
	ldr r0, _021EC7A4 ; =0x000008E8
	bl PlaySE
_021EC78C:
	add r0, r4, #0
	mov r1, #0
	mov r2, #4
	bl ov18_021EC1DC
	add sp, #0xc
	pop {r3, r4, pc}
_021EC79A:
	mov r0, #0x45
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_021EC7A0: .word 0x000008E9
_021EC7A4: .word 0x000008E8
_021EC7A8: .word 0x00000868
	thumb_func_end ov18_021EC4FC

	thumb_func_start ov18_021EC7AC
ov18_021EC7AC: ; 0x021EC7AC
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r1, _021EC874 ; =0x00000868
	add r5, r0, #0
	add r4, r5, r1
	ldrh r2, [r4]
	cmp r2, #0
	beq _021EC7C2
	cmp r2, #1
	beq _021EC828
	b _021EC86E
_021EC7C2:
	ldrb r0, [r4, #2]
	sub r1, #0x18
	ldr r2, _021EC878 ; =0x0000F7BE
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	mov r1, #1
	sub r3, r1, #3
	bl sub_02003370
	ldrb r0, [r4, #2]
	mov r1, #4
	ldr r2, _021EC87C ; =0x0000FFEF
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #0x85
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	sub r3, r1, #6
	bl sub_02003370
	ldrb r0, [r4, #2]
	mov r1, #0xa
	add r3, r1, #0
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #0x85
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	ldr r2, _021EC880 ; =0x0000FFFF
	sub r3, #0xc
	bl sub_02003370
	ldrh r0, [r4]
	mov r1, #0x46
	add sp, #0xc
	add r0, r0, #1
	strh r0, [r4]
	ldr r0, _021EC884 ; =0x0000085C
	str r1, [r5, r0]
	mov r0, #3
	pop {r4, r5, pc}
_021EC828:
	bl ov18_021F03C0
	add r0, r5, #0
	bl ov18_021F3E08
	add r0, r5, #0
	bl ov18_021E8648
	add r0, r5, #0
	bl ov18_021E8BD4
	add r0, r5, #0
	bl ov18_021EE20C
	ldr r0, _021EC874 ; =0x00000868
	mov r1, #0
	add r0, r5, r0
	mov r2, #0x10
	bl MI_CpuFill8
	ldr r0, _021EC888 ; =0x0000185B
	ldrb r0, [r5, r0]
	cmp r0, #2
	bne _021EC85E
	add sp, #0xc
	mov r0, #0x4c
	pop {r4, r5, pc}
_021EC85E:
	cmp r0, #3
	bne _021EC868
	add sp, #0xc
	mov r0, #0x4f
	pop {r4, r5, pc}
_021EC868:
	add sp, #0xc
	mov r0, #0x59
	pop {r4, r5, pc}
_021EC86E:
	mov r0, #0x46
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_021EC874: .word 0x00000868
_021EC878: .word 0x0000F7BE
_021EC87C: .word 0x0000FFEF
_021EC880: .word 0x0000FFFF
_021EC884: .word 0x0000085C
_021EC888: .word 0x0000185B
	thumb_func_end ov18_021EC7AC

	thumb_func_start ov18_021EC88C
ov18_021EC88C: ; 0x021EC88C
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _021EC954 ; =0x00000868
	add r5, r0, #0
	add r6, r5, r1
	ldrb r1, [r6]
	cmp r1, #0
	beq _021EC8A0
	cmp r1, #1
	beq _021EC8F0
	b _021EC950
_021EC8A0:
	ldr r1, _021EC958 ; =0x000018CA
	ldrsb r2, [r5, r1]
	sub r2, r2, #1
	strb r2, [r5, r1]
	mov r1, #6
	add r2, r1, #0
	bl ov18_021F118C
	add r0, r5, #0
	mov r1, #1
	bl ov18_021F0504
	mov r4, #0
	mov r7, #3
_021EC8BC:
	str r7, [sp]
	add r1, r4, #0
	ldr r0, [r5, #8]
	add r1, #0x11
	mov r2, #0
	mov r3, #1
	bl sub_020198FC
	add r4, r4, #1
	cmp r4, #6
	blo _021EC8BC
	ldr r1, _021EC958 ; =0x000018CA
	add r0, r5, #0
	ldrsb r1, [r5, r1]
	bl ov18_021F64F4
	add r2, r0, #0
	add r0, r5, #0
	mov r1, #5
	mov r3, #3
	bl ov18_021F6540
	strb r0, [r6, #3]
	ldrb r0, [r6]
	add r0, r0, #1
	strb r0, [r6]
_021EC8F0:
	ldrb r2, [r6, #3]
	add r0, r5, #0
	mov r1, #5
	neg r2, r2
	bl ov18_021F6578
	ldrb r0, [r6, #1]
	add r0, r0, #1
	strb r0, [r6, #1]
	ldrb r0, [r6, #1]
	cmp r0, #3
	bne _021EC950
	mov r0, #0
	strb r0, [r6]
	strb r0, [r6, #1]
	ldrb r0, [r6, #2]
	sub r0, r0, #1
	strb r0, [r6, #2]
	ldrb r0, [r6, #2]
	cmp r0, #0
	bne _021EC950
	add r0, r5, #0
	bl ov18_021F65EC
	ldr r2, _021EC958 ; =0x000018CA
	add r0, r5, #0
	ldrsb r1, [r5, r2]
	add r2, #0x36
	ldr r2, [r5, r2]
	mov r3, #6
	lsl r2, r2, #0x18
	asr r2, r2, #0x18
	bl ov18_021F619C
	add r0, r5, #0
	bl ov18_021F4384
	add r0, r5, #0
	bl ov18_021F463C
	ldr r0, _021EC954 ; =0x00000868
	mov r1, #0
	add r0, r5, r0
	mov r2, #0x10
	bl MI_CpuFill8
	mov r0, #0x45
	pop {r3, r4, r5, r6, r7, pc}
_021EC950:
	mov r0, #0x47
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021EC954: .word 0x00000868
_021EC958: .word 0x000018CA
	thumb_func_end ov18_021EC88C

	thumb_func_start ov18_021EC95C
ov18_021EC95C: ; 0x021EC95C
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _021ECA24 ; =0x00000868
	add r5, r0, #0
	add r6, r5, r1
	ldrb r1, [r6]
	cmp r1, #0
	beq _021EC970
	cmp r1, #1
	beq _021EC9C2
	b _021ECA20
_021EC970:
	ldr r1, _021ECA28 ; =0x000018CA
	ldrsb r2, [r5, r1]
	add r2, r2, #1
	strb r2, [r5, r1]
	mov r1, #7
	mov r2, #9
	bl ov18_021F118C
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	bl ov18_021F0504
	mov r4, #0
	mov r7, #3
_021EC98E:
	str r7, [sp]
	add r1, r4, #0
	mov r2, #0
	ldr r0, [r5, #8]
	add r1, #0x11
	sub r3, r2, #1
	bl sub_020198FC
	add r4, r4, #1
	cmp r4, #6
	blo _021EC98E
	ldr r1, _021ECA28 ; =0x000018CA
	add r0, r5, #0
	ldrsb r1, [r5, r1]
	bl ov18_021F64F4
	add r2, r0, #0
	add r0, r5, #0
	mov r1, #5
	mov r3, #3
	bl ov18_021F6540
	strb r0, [r6, #3]
	ldrb r0, [r6]
	add r0, r0, #1
	strb r0, [r6]
_021EC9C2:
	ldrb r2, [r6, #3]
	add r0, r5, #0
	mov r1, #5
	bl ov18_021F6578
	ldrb r0, [r6, #1]
	add r0, r0, #1
	strb r0, [r6, #1]
	ldrb r0, [r6, #1]
	cmp r0, #3
	bne _021ECA20
	mov r0, #0
	strb r0, [r6]
	strb r0, [r6, #1]
	ldrb r0, [r6, #2]
	sub r0, r0, #1
	strb r0, [r6, #2]
	ldrb r0, [r6, #2]
	cmp r0, #0
	bne _021ECA20
	add r0, r5, #0
	bl ov18_021F65EC
	ldr r2, _021ECA28 ; =0x000018CA
	add r0, r5, #0
	ldrsb r1, [r5, r2]
	add r2, #0x36
	ldr r2, [r5, r2]
	mov r3, #6
	lsl r2, r2, #0x18
	asr r2, r2, #0x18
	bl ov18_021F619C
	add r0, r5, #0
	bl ov18_021F4384
	add r0, r5, #0
	bl ov18_021F463C
	ldr r0, _021ECA24 ; =0x00000868
	mov r1, #0
	add r0, r5, r0
	mov r2, #0x10
	bl MI_CpuFill8
	mov r0, #0x45
	pop {r3, r4, r5, r6, r7, pc}
_021ECA20:
	mov r0, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021ECA24: .word 0x00000868
_021ECA28: .word 0x000018CA
	thumb_func_end ov18_021EC95C

	thumb_func_start ov18_021ECA2C
ov18_021ECA2C: ; 0x021ECA2C
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	bl ov18_021EE26C
	add r0, sp, #4
	add r1, sp, #0
	bl sub_02025364
	cmp r0, #0
	bne _021ECA48
	add sp, #8
	mov r0, #0x45
	pop {r4, pc}
_021ECA48:
	ldr r1, [sp, #4]
	ldr r2, [sp]
	add r0, r4, #0
	bl ov18_021F63DC
	cmp r0, #1
	bne _021ECA82
	ldr r2, _021ECA88 ; =0x000018CA
	add r0, r4, #0
	ldrsb r1, [r4, r2]
	add r2, #0x36
	ldr r2, [r4, r2]
	mov r3, #6
	lsl r2, r2, #0x18
	asr r2, r2, #0x18
	bl ov18_021F619C
	add r0, r4, #0
	bl ov18_021F4384
	add r0, r4, #0
	bl ov18_021F463C
	add r0, r4, #0
	bl ov18_021F0428
	ldr r0, _021ECA8C ; =0x000008E8
	bl PlaySE
_021ECA82:
	mov r0, #0x49
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_021ECA88: .word 0x000018CA
_021ECA8C: .word 0x000008E8
	thumb_func_end ov18_021ECA2C

	thumb_func_start ov18_021ECA90
ov18_021ECA90: ; 0x021ECA90
	push {r4, lr}
	ldr r1, _021ECAE0 ; =0x00000868
	add r4, r0, #0
	add r2, r4, r1
	ldrh r1, [r2]
	ldrh r2, [r2, #2]
	bl ov18_021F63DC
	cmp r0, #1
	bne _021ECADC
	ldr r2, _021ECAE4 ; =0x000018CA
	add r0, r4, #0
	ldrsb r1, [r4, r2]
	add r2, #0x36
	ldr r2, [r4, r2]
	mov r3, #6
	lsl r2, r2, #0x18
	asr r2, r2, #0x18
	bl ov18_021F619C
	add r0, r4, #0
	bl ov18_021F4384
	add r0, r4, #0
	bl ov18_021F463C
	add r0, r4, #0
	bl ov18_021F0428
	ldr r0, _021ECAE8 ; =0x000008E8
	bl PlaySE
	ldr r0, _021ECAE0 ; =0x00000868
	mov r1, #0
	add r0, r4, r0
	mov r2, #0x10
	bl MI_CpuFill8
_021ECADC:
	mov r0, #0x45
	pop {r4, pc}
	.balign 4, 0
_021ECAE0: .word 0x00000868
_021ECAE4: .word 0x000018CA
_021ECAE8: .word 0x000008E8
	thumb_func_end ov18_021ECA90

	thumb_func_start ov18_021ECAEC
ov18_021ECAEC: ; 0x021ECAEC
	push {r3, r4, r5, lr}
	ldr r1, _021ECBF8 ; =0x00000868
	add r5, r0, #0
	add r4, r5, r1
	bl ov18_021EE21C
	ldr r1, _021ECBF8 ; =0x00000868
	ldrh r1, [r5, r1]
	cmp r1, #4
	bhi _021ECBF2
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021ECB0C: ; jump table
	.short _021ECB16 - _021ECB0C - 2 ; case 0
	.short _021ECB38 - _021ECB0C - 2 ; case 1
	.short _021ECB5E - _021ECB0C - 2 ; case 2
	.short _021ECB92 - _021ECB0C - 2 ; case 3
	.short _021ECBBC - _021ECB0C - 2 ; case 4
_021ECB16:
	add r0, r5, #0
	bl ov18_021E6794
	add r0, r5, #0
	bl ov18_021E67B0
	add r0, r5, #0
	mov r1, #2
	mov r2, #0
	bl ov18_021F11C0
	add r0, r5, #0
	bl ov18_021F4620
	ldrh r0, [r4]
	add r0, r0, #1
	strh r0, [r4]
_021ECB38:
	ldrh r0, [r4, #2]
	add r0, r0, #2
	strh r0, [r4, #2]
	ldrh r1, [r4, #2]
	mov r0, #0x1f
	sub r0, r0, r1
	lsl r0, r0, #0x18
	lsl r1, r1, #0x18
	lsr r0, r0, #0x18
	lsr r1, r1, #0x18
	bl ov18_021E618C
	ldrh r0, [r4, #2]
	cmp r0, #0x10
	bne _021ECBF2
	ldrh r0, [r4]
	add r0, r0, #1
	strh r0, [r4]
	b _021ECBF2
_021ECB5E:
	add r0, r5, #0
	bl ov18_021E8648
	ldr r2, _021ECBFC ; =0x000018C9
	add r0, r5, #0
	ldrsb r1, [r5, r2]
	sub r2, r2, #1
	ldrsb r2, [r5, r2]
	bl ov18_021E8528
	add r0, r5, #0
	bl ov18_021F40A0
	add r0, r5, #0
	bl ov18_021F03E0
	add r0, r5, #0
	bl ov18_021F0428
	add r0, r5, #0
	bl ov18_021EE170
	ldrh r0, [r4]
	add r0, r0, #1
	strh r0, [r4]
	b _021ECBF2
_021ECB92:
	ldrh r0, [r4, #2]
	sub r0, r0, #2
	strh r0, [r4, #2]
	ldrh r1, [r4, #2]
	mov r0, #0x1f
	sub r0, r0, r1
	lsl r0, r0, #0x18
	lsl r1, r1, #0x18
	lsr r0, r0, #0x18
	lsr r1, r1, #0x18
	bl ov18_021E618C
	ldrh r0, [r4, #2]
	cmp r0, #0
	bne _021ECBF2
	bl ov18_021E6174
	ldrh r0, [r4]
	add r0, r0, #1
	strh r0, [r4]
	b _021ECBF2
_021ECBBC:
	cmp r0, #0
	bne _021ECBF2
	add r0, r5, #0
	bl ov18_021F4134
	add r0, r5, #0
	bl ov18_021F4384
	add r0, r5, #0
	bl ov18_021EE314
	mov r0, #0x19
	lsl r0, r0, #8
	ldr r0, [r5, r0]
	cmp r0, #1
	bne _021ECBE2
	add r0, r5, #0
	bl ov18_021E6794
_021ECBE2:
	ldr r0, _021ECBF8 ; =0x00000868
	mov r1, #0
	add r0, r5, r0
	mov r2, #0x10
	bl MI_CpuFill8
	mov r0, #0x45
	pop {r3, r4, r5, pc}
_021ECBF2:
	mov r0, #0x4b
	pop {r3, r4, r5, pc}
	nop
_021ECBF8: .word 0x00000868
_021ECBFC: .word 0x000018C9
	thumb_func_end ov18_021ECAEC

	thumb_func_start ov18_021ECC00
ov18_021ECC00: ; 0x021ECC00
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r1, _021ECC9C ; =0x00000868
	add r4, r0, #0
	ldrb r2, [r4, r1]
	cmp r2, #0
	beq _021ECC14
	cmp r2, #1
	beq _021ECC86
	b _021ECC96
_021ECC14:
	mov r1, #1
	bl ov18_021E5E70
	add r0, r4, #0
	mov r1, #2
	bl ov18_021E67C8
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x85
	lsl r0, r0, #4
	mov r1, #1
	ldr r0, [r4, r0]
	ldr r2, _021ECCA0 ; =0x0000F7BE
	sub r3, r1, #3
	bl sub_02003370
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x85
	lsl r0, r0, #4
	mov r1, #4
	ldr r0, [r4, r0]
	ldr r2, _021ECCA4 ; =0x0000FFEF
	sub r3, r1, #6
	bl sub_02003370
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x85
	lsl r0, r0, #4
	mov r1, #0xa
	add r3, r1, #0
	ldr r0, [r4, r0]
	ldr r2, _021ECCA8 ; =0x0000FFFF
	sub r3, #0xc
	bl sub_02003370
	ldr r0, _021ECC9C ; =0x00000868
	add sp, #0xc
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	mov r1, #0x4c
	sub r0, #0xc
	str r1, [r4, r0]
	mov r0, #3
	pop {r3, r4, pc}
_021ECC86:
	ldr r0, _021ECCAC ; =0x0000185B
	mov r2, #2
	strb r2, [r4, r0]
	mov r0, #0
	strb r0, [r4, r1]
	add sp, #0xc
	mov r0, #0x4d
	pop {r3, r4, pc}
_021ECC96:
	mov r0, #0x4c
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_021ECC9C: .word 0x00000868
_021ECCA0: .word 0x0000F7BE
_021ECCA4: .word 0x0000FFEF
_021ECCA8: .word 0x0000FFFF
_021ECCAC: .word 0x0000185B
	thumb_func_end ov18_021ECC00

	thumb_func_start ov18_021ECCB0
ov18_021ECCB0: ; 0x021ECCB0
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	bl ov18_021EE068
	add r0, r4, #0
	add r1, sp, #0
	bl ov18_021F7D00
	cmp r0, #3
	bhi _021ECD6E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021ECCD2: ; jump table
	.short _021ECCDA - _021ECCD2 - 2 ; case 0
	.short _021ECD02 - _021ECCD2 - 2 ; case 1
	.short _021ECD2A - _021ECCD2 - 2 ; case 2
	.short _021ECD52 - _021ECCD2 - 2 ; case 3
_021ECCDA:
	ldr r0, [sp]
	cmp r0, #1
	bne _021ECCE8
	ldr r0, _021ECDBC ; =0x000008E9
	bl PlaySE
	b _021ECCEE
_021ECCE8:
	ldr r0, _021ECDC0 ; =0x000008E8
	bl PlaySE
_021ECCEE:
	add r0, r4, #0
	bl ov18_021EE0CC
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	bl ov18_021EC1DC
	add sp, #4
	pop {r3, r4, pc}
_021ECD02:
	ldr r0, [sp]
	cmp r0, #1
	bne _021ECD10
	ldr r0, _021ECDBC ; =0x000008E9
	bl PlaySE
	b _021ECD16
_021ECD10:
	ldr r0, _021ECDC0 ; =0x000008E8
	bl PlaySE
_021ECD16:
	add r0, r4, #0
	bl ov18_021EE0CC
	add r0, r4, #0
	mov r1, #0
	mov r2, #2
	bl ov18_021EC1DC
	add sp, #4
	pop {r3, r4, pc}
_021ECD2A:
	ldr r0, [sp]
	cmp r0, #1
	bne _021ECD38
	ldr r0, _021ECDBC ; =0x000008E9
	bl PlaySE
	b _021ECD3E
_021ECD38:
	ldr r0, _021ECDC0 ; =0x000008E8
	bl PlaySE
_021ECD3E:
	add r0, r4, #0
	bl ov18_021EE0CC
	add r0, r4, #0
	mov r1, #0
	mov r2, #3
	bl ov18_021EC1DC
	add sp, #4
	pop {r3, r4, pc}
_021ECD52:
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	bl ov18_021EE0CC
	add r0, r4, #0
	mov r1, #0
	mov r2, #0xff
	bl ov18_021EC1DC
	add sp, #4
	pop {r3, r4, pc}
_021ECD6E:
	ldr r0, _021ECDC4 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _021ECD92
	ldr r0, _021ECDC0 ; =0x000008E8
	bl PlaySE
	add r0, r4, #0
	bl ov18_021EE0CC
	add r0, r4, #0
	mov r1, #0
	mov r2, #2
	bl ov18_021EC1DC
	add sp, #4
	pop {r3, r4, pc}
_021ECD92:
	bl System_GetTouchNew
	cmp r0, #1
	bne _021ECDB4
	ldr r0, _021ECDBC ; =0x000008E9
	bl PlaySE
	add r0, r4, #0
	bl ov18_021EE0CC
	add r0, r4, #0
	mov r1, #0
	mov r2, #2
	bl ov18_021EC1DC
	add sp, #4
	pop {r3, r4, pc}
_021ECDB4:
	mov r0, #0x4d
	add sp, #4
	pop {r3, r4, pc}
	nop
_021ECDBC: .word 0x000008E9
_021ECDC0: .word 0x000008E8
_021ECDC4: .word gSystem
	thumb_func_end ov18_021ECCB0

	thumb_func_start ov18_021ECDC8
ov18_021ECDC8: ; 0x021ECDC8
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r1, _021ECE88 ; =0x00000868
	add r5, r0, #0
	add r4, r5, r1
	ldrh r2, [r4]
	cmp r2, #0
	beq _021ECDDE
	cmp r2, #1
	beq _021ECE44
	b _021ECE80
_021ECDDE:
	ldrb r0, [r4, #2]
	sub r1, #0x18
	ldr r2, _021ECE8C ; =0x0000F7BE
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	mov r1, #1
	sub r3, r1, #3
	bl sub_02003370
	ldrb r0, [r4, #2]
	mov r1, #4
	ldr r2, _021ECE90 ; =0x0000FFEF
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #0x85
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	sub r3, r1, #6
	bl sub_02003370
	ldrb r0, [r4, #2]
	mov r1, #0xa
	add r3, r1, #0
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #0x85
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	ldr r2, _021ECE94 ; =0x0000FFFF
	sub r3, #0xc
	bl sub_02003370
	ldrh r0, [r4]
	mov r1, #0x4e
	add sp, #0xc
	add r0, r0, #1
	strh r0, [r4]
	ldr r0, _021ECE98 ; =0x0000085C
	str r1, [r5, r0]
	mov r0, #3
	pop {r4, r5, pc}
_021ECE44:
	bl ov18_021F0838
	add r0, r5, #0
	bl ov18_021F4A50
	add r0, r5, #0
	mov r1, #0
	bl ov18_021E5E70
	ldr r0, _021ECE88 ; =0x00000868
	mov r1, #0
	add r0, r5, r0
	mov r2, #0x10
	bl MI_CpuFill8
	ldr r0, _021ECE9C ; =0x0000185B
	ldrb r0, [r5, r0]
	cmp r0, #1
	bne _021ECE70
	add sp, #0xc
	mov r0, #0x44
	pop {r4, r5, pc}
_021ECE70:
	cmp r0, #2
	bne _021ECE7A
	add sp, #0xc
	mov r0, #0x4c
	pop {r4, r5, pc}
_021ECE7A:
	add sp, #0xc
	mov r0, #0x4f
	pop {r4, r5, pc}
_021ECE80:
	mov r0, #0x4e
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_021ECE88: .word 0x00000868
_021ECE8C: .word 0x0000F7BE
_021ECE90: .word 0x0000FFEF
_021ECE94: .word 0x0000FFFF
_021ECE98: .word 0x0000085C
_021ECE9C: .word 0x0000185B
	thumb_func_end ov18_021ECDC8

	thumb_func_start ov18_021ECEA0
ov18_021ECEA0: ; 0x021ECEA0
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r1, _021ECF40 ; =0x00000868
	add r4, r0, #0
	ldrb r2, [r4, r1]
	cmp r2, #0
	beq _021ECEB4
	cmp r2, #1
	beq _021ECF2A
	b _021ECF3A
_021ECEB4:
	ldr r1, _021ECF44 ; =0x000018C5
	mov r2, #0
	strb r2, [r4, r1]
	bl ov18_021F01D4
	add r0, r4, #0
	mov r1, #3
	bl ov18_021E67C8
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x85
	lsl r0, r0, #4
	mov r1, #1
	ldr r0, [r4, r0]
	ldr r2, _021ECF48 ; =0x0000F7BE
	sub r3, r1, #3
	bl sub_02003370
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x85
	lsl r0, r0, #4
	mov r1, #4
	ldr r0, [r4, r0]
	ldr r2, _021ECF4C ; =0x0000FFEF
	sub r3, r1, #6
	bl sub_02003370
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x85
	lsl r0, r0, #4
	mov r1, #0xa
	add r3, r1, #0
	ldr r0, [r4, r0]
	ldr r2, _021ECF50 ; =0x0000FFFF
	sub r3, #0xc
	bl sub_02003370
	ldr r0, _021ECF40 ; =0x00000868
	add sp, #0xc
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	mov r1, #0x4f
	sub r0, #0xc
	str r1, [r4, r0]
	mov r0, #3
	pop {r3, r4, pc}
_021ECF2A:
	ldr r0, _021ECF54 ; =0x0000185B
	mov r2, #3
	strb r2, [r4, r0]
	mov r0, #0
	strb r0, [r4, r1]
	add sp, #0xc
	mov r0, #0x50
	pop {r3, r4, pc}
_021ECF3A:
	mov r0, #0x4f
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_021ECF40: .word 0x00000868
_021ECF44: .word 0x000018C5
_021ECF48: .word 0x0000F7BE
_021ECF4C: .word 0x0000FFEF
_021ECF50: .word 0x0000FFFF
_021ECF54: .word 0x0000185B
	thumb_func_end ov18_021ECEA0

	thumb_func_start ov18_021ECF58
ov18_021ECF58: ; 0x021ECF58
	push {r4, lr}
	sub sp, #0x18
	add r1, sp, #0x14
	add r4, r0, #0
	bl ov18_021F7D30
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _021ECF70
	cmp r0, #0xc
	bls _021ECF72
_021ECF70:
	b _021ED144
_021ECF72:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021ECF7E: ; jump table
	.short _021ECF98 - _021ECF7E - 2 ; case 0
	.short _021ECFBA - _021ECF7E - 2 ; case 1
	.short _021ECFDC - _021ECF7E - 2 ; case 2
	.short _021ECFFE - _021ECF7E - 2 ; case 3
	.short _021ED014 - _021ECF7E - 2 ; case 4
	.short _021ED042 - _021ECF7E - 2 ; case 5
	.short _021ED06E - _021ECF7E - 2 ; case 6
	.short _021ED09C - _021ECF7E - 2 ; case 7
	.short _021ED042 - _021ECF7E - 2 ; case 8
	.short _021ED09C - _021ECF7E - 2 ; case 9
	.short _021ED0CA - _021ECF7E - 2 ; case 10
	.short _021ED0F8 - _021ECF7E - 2 ; case 11
	.short _021ED122 - _021ECF7E - 2 ; case 12
_021ECF98:
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bne _021ECFA6
	ldr r0, _021ED14C ; =0x000008E9
	bl PlaySE
	b _021ECFAC
_021ECFA6:
	ldr r0, _021ED150 ; =0x000008E8
	bl PlaySE
_021ECFAC:
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	bl ov18_021EC1DC
	add sp, #0x18
	pop {r4, pc}
_021ECFBA:
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bne _021ECFC8
	ldr r0, _021ED14C ; =0x000008E9
	bl PlaySE
	b _021ECFCE
_021ECFC8:
	ldr r0, _021ED150 ; =0x000008E8
	bl PlaySE
_021ECFCE:
	add r0, r4, #0
	mov r1, #0
	mov r2, #2
	bl ov18_021EC1DC
	add sp, #0x18
	pop {r4, pc}
_021ECFDC:
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bne _021ECFEA
	ldr r0, _021ED14C ; =0x000008E9
	bl PlaySE
	b _021ECFF0
_021ECFEA:
	ldr r0, _021ED150 ; =0x000008E8
	bl PlaySE
_021ECFF0:
	add r0, r4, #0
	mov r1, #0x10
	mov r2, #0x50
	bl ov18_021EDC28
	add sp, #0x18
	pop {r4, pc}
_021ECFFE:
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	mov r1, #0
	mov r2, #0xff
	bl ov18_021EC1DC
	add sp, #0x18
	pop {r4, pc}
_021ED014:
	add r0, r4, #0
	sub r1, r1, #1
	mov r2, #2
	bl ov18_021EDF14
	cmp r0, #1
	bne _021ED03C
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bne _021ED030
	ldr r0, _021ED14C ; =0x000008E9
	bl PlaySE
	b _021ED036
_021ED030:
	ldr r0, _021ED150 ; =0x000008E8
	bl PlaySE
_021ED036:
	add sp, #0x18
	mov r0, #0x52
	pop {r4, pc}
_021ED03C:
	add sp, #0x18
	mov r0, #0x50
	pop {r4, pc}
_021ED042:
	add r0, r4, #0
	mov r2, #1
	bl ov18_021EDF14
	cmp r0, #1
	bne _021ED068
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bne _021ED05C
	ldr r0, _021ED14C ; =0x000008E9
	bl PlaySE
	b _021ED062
_021ED05C:
	ldr r0, _021ED150 ; =0x000008E8
	bl PlaySE
_021ED062:
	add sp, #0x18
	mov r0, #0x52
	pop {r4, pc}
_021ED068:
	add sp, #0x18
	mov r0, #0x50
	pop {r4, pc}
_021ED06E:
	mov r1, #2
	add r0, r4, #0
	add r2, r1, #0
	bl ov18_021EDF14
	cmp r0, #1
	bne _021ED096
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bne _021ED08A
	ldr r0, _021ED14C ; =0x000008E9
	bl PlaySE
	b _021ED090
_021ED08A:
	ldr r0, _021ED150 ; =0x000008E8
	bl PlaySE
_021ED090:
	add sp, #0x18
	mov r0, #0x53
	pop {r4, pc}
_021ED096:
	add sp, #0x18
	mov r0, #0x50
	pop {r4, pc}
_021ED09C:
	mov r1, #1
	add r0, r4, #0
	add r2, r1, #0
	bl ov18_021EDF14
	cmp r0, #1
	bne _021ED0C4
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bne _021ED0B8
	ldr r0, _021ED14C ; =0x000008E9
	bl PlaySE
	b _021ED0BE
_021ED0B8:
	ldr r0, _021ED150 ; =0x000008E8
	bl PlaySE
_021ED0BE:
	add sp, #0x18
	mov r0, #0x53
	pop {r4, pc}
_021ED0C4:
	add sp, #0x18
	mov r0, #0x50
	pop {r4, pc}
_021ED0CA:
	add r0, sp, #0x10
	add r1, sp, #0xc
	bl sub_02025364
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	add r0, r4, #0
	bl ov18_021F6258
	cmp r0, #1
	bne _021ED0E6
	add sp, #0x18
	mov r0, #0x54
	pop {r4, pc}
_021ED0E6:
	ldr r0, _021ED154 ; =0x00000868
	add r1, r4, r0
	ldr r0, [sp, #0x10]
	strh r0, [r1]
	ldr r0, [sp, #0xc]
	add sp, #0x18
	strh r0, [r1, #2]
	mov r0, #0x55
	pop {r4, pc}
_021ED0F8:
	ldr r0, _021ED158 ; =0x000018C4
	ldrsb r0, [r4, r0]
	cmp r0, #1
	beq _021ED144
	ldr r0, _021ED14C ; =0x000008E9
	bl PlaySE
	mov r0, #0xf
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x56
	mov r2, #0x11
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0
	add r3, r2, #0
	bl ov18_021EDC50
	add sp, #0x18
	pop {r4, pc}
_021ED122:
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bne _021ED130
	ldr r0, _021ED14C ; =0x000008E9
	bl PlaySE
	b _021ED136
_021ED130:
	ldr r0, _021ED150 ; =0x000008E8
	bl PlaySE
_021ED136:
	add r0, r4, #0
	mov r1, #0
	mov r2, #4
	bl ov18_021EC1DC
	add sp, #0x18
	pop {r4, pc}
_021ED144:
	mov r0, #0x50
	add sp, #0x18
	pop {r4, pc}
	nop
_021ED14C: .word 0x000008E9
_021ED150: .word 0x000008E8
_021ED154: .word 0x00000868
_021ED158: .word 0x000018C4
	thumb_func_end ov18_021ECF58

	thumb_func_start ov18_021ED15C
ov18_021ED15C: ; 0x021ED15C
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r1, _021ED20C ; =0x00000868
	add r5, r0, #0
	add r4, r5, r1
	ldrh r2, [r4]
	cmp r2, #0
	beq _021ED172
	cmp r2, #1
	beq _021ED1D8
	b _021ED204
_021ED172:
	ldrb r0, [r4, #2]
	sub r1, #0x18
	ldr r2, _021ED210 ; =0x0000F7BE
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	mov r1, #1
	sub r3, r1, #3
	bl sub_02003370
	ldrb r0, [r4, #2]
	mov r1, #4
	ldr r2, _021ED214 ; =0x0000FFEF
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #0x85
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	sub r3, r1, #6
	bl sub_02003370
	ldrb r0, [r4, #2]
	mov r1, #0xa
	add r3, r1, #0
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #0x85
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	ldr r2, _021ED218 ; =0x0000FFFF
	sub r3, #0xc
	bl sub_02003370
	ldrh r0, [r4]
	mov r1, #0x51
	add sp, #0xc
	add r0, r0, #1
	strh r0, [r4]
	ldr r0, _021ED21C ; =0x0000085C
	str r1, [r5, r0]
	mov r0, #3
	pop {r4, r5, pc}
_021ED1D8:
	bl ov18_021F0918
	add r0, r5, #0
	bl ov18_021F5DE0
	mov r0, #0
	strh r0, [r4]
	ldr r0, _021ED220 ; =0x0000185B
	ldrb r0, [r5, r0]
	cmp r0, #1
	bne _021ED1F4
	add sp, #0xc
	mov r0, #0x44
	pop {r4, r5, pc}
_021ED1F4:
	cmp r0, #2
	bne _021ED1FE
	add sp, #0xc
	mov r0, #0x4c
	pop {r4, r5, pc}
_021ED1FE:
	add sp, #0xc
	mov r0, #0x59
	pop {r4, r5, pc}
_021ED204:
	mov r0, #0x51
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_021ED20C: .word 0x00000868
_021ED210: .word 0x0000F7BE
_021ED214: .word 0x0000FFEF
_021ED218: .word 0x0000FFFF
_021ED21C: .word 0x0000085C
_021ED220: .word 0x0000185B
	thumb_func_end ov18_021ED15C

	thumb_func_start ov18_021ED224
ov18_021ED224: ; 0x021ED224
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _021ED2FC ; =0x00000868
	add r5, r0, #0
	add r6, r5, r1
	ldrb r1, [r6]
	cmp r1, #0
	beq _021ED238
	cmp r1, #1
	beq _021ED290
	b _021ED2F8
_021ED238:
	ldr r1, _021ED300 ; =0x000018C5
	ldrsb r2, [r5, r1]
	sub r2, r2, #1
	strb r2, [r5, r1]
	mov r1, #1
	bl ov18_021F609C
	mov r1, #6
	add r0, r5, #0
	add r2, r1, #0
	bl ov18_021F118C
	add r0, r5, #0
	mov r1, #1
	bl ov18_021F0B70
	mov r4, #0
	mov r7, #3
_021ED25C:
	str r7, [sp]
	add r1, r4, #0
	ldr r0, [r5, #8]
	add r1, #0x11
	mov r2, #0
	mov r3, #1
	bl sub_020198FC
	add r4, r4, #1
	cmp r4, #6
	blo _021ED25C
	ldr r1, _021ED300 ; =0x000018C5
	add r0, r5, #0
	ldrsb r1, [r5, r1]
	bl ov18_021F64A4
	add r2, r0, #0
	add r0, r5, #0
	mov r1, #5
	mov r3, #3
	bl ov18_021F6540
	strb r0, [r6, #3]
	ldrb r0, [r6]
	add r0, r0, #1
	strb r0, [r6]
_021ED290:
	add r0, r5, #0
	mov r1, #8
	bl ov18_021F6178
	ldrb r2, [r6, #3]
	add r0, r5, #0
	mov r1, #5
	neg r2, r2
	bl ov18_021F6578
	ldrb r0, [r6, #1]
	add r0, r0, #1
	strb r0, [r6, #1]
	ldrb r0, [r6, #1]
	cmp r0, #3
	bne _021ED2F8
	mov r0, #0
	strb r0, [r6]
	strb r0, [r6, #1]
	ldrb r0, [r6, #2]
	sub r0, r0, #1
	strb r0, [r6, #2]
	ldrb r0, [r6, #2]
	cmp r0, #0
	bne _021ED2F8
	ldr r1, _021ED300 ; =0x000018C5
	add r0, r5, #0
	ldrsb r1, [r5, r1]
	bl ov18_021F5EF0
	add r0, r5, #0
	bl ov18_021F65AC
	ldr r2, _021ED300 ; =0x000018C5
	add r0, r5, #0
	ldrsb r1, [r5, r2]
	sub r2, r2, #1
	ldrsb r2, [r5, r2]
	mov r3, #6
	bl ov18_021F619C
	add r0, r5, #0
	bl ov18_021F0D2C
	ldr r0, _021ED2FC ; =0x00000868
	mov r1, #0
	add r0, r5, r0
	mov r2, #0x10
	bl MI_CpuFill8
	mov r0, #0x50
	pop {r3, r4, r5, r6, r7, pc}
_021ED2F8:
	mov r0, #0x52
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021ED2FC: .word 0x00000868
_021ED300: .word 0x000018C5
	thumb_func_end ov18_021ED224

	thumb_func_start ov18_021ED304
ov18_021ED304: ; 0x021ED304
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _021ED3E0 ; =0x00000868
	add r5, r0, #0
	add r6, r5, r1
	ldrb r1, [r6]
	cmp r1, #0
	beq _021ED318
	cmp r1, #1
	beq _021ED374
	b _021ED3DC
_021ED318:
	ldr r1, _021ED3E4 ; =0x000018C5
	ldrsb r2, [r5, r1]
	add r2, r2, #1
	strb r2, [r5, r1]
	mov r1, #0
	mvn r1, r1
	bl ov18_021F609C
	add r0, r5, #0
	mov r1, #7
	mov r2, #9
	bl ov18_021F118C
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	bl ov18_021F0B70
	mov r4, #0
	mov r7, #3
_021ED340:
	str r7, [sp]
	add r1, r4, #0
	mov r2, #0
	ldr r0, [r5, #8]
	add r1, #0x11
	sub r3, r2, #1
	bl sub_020198FC
	add r4, r4, #1
	cmp r4, #6
	blo _021ED340
	ldr r1, _021ED3E4 ; =0x000018C5
	add r0, r5, #0
	ldrsb r1, [r5, r1]
	bl ov18_021F64A4
	add r2, r0, #0
	add r0, r5, #0
	mov r1, #5
	mov r3, #3
	bl ov18_021F6540
	strb r0, [r6, #3]
	ldrb r0, [r6]
	add r0, r0, #1
	strb r0, [r6]
_021ED374:
	mov r1, #7
	add r0, r5, #0
	mvn r1, r1
	bl ov18_021F6178
	ldrb r2, [r6, #3]
	add r0, r5, #0
	mov r1, #5
	bl ov18_021F6578
	ldrb r0, [r6, #1]
	add r0, r0, #1
	strb r0, [r6, #1]
	ldrb r0, [r6, #1]
	cmp r0, #3
	bne _021ED3DC
	mov r0, #0
	strb r0, [r6]
	strb r0, [r6, #1]
	ldrb r0, [r6, #2]
	sub r0, r0, #1
	strb r0, [r6, #2]
	ldrb r0, [r6, #2]
	cmp r0, #0
	bne _021ED3DC
	ldr r1, _021ED3E4 ; =0x000018C5
	add r0, r5, #0
	ldrsb r1, [r5, r1]
	bl ov18_021F5EF0
	add r0, r5, #0
	bl ov18_021F65AC
	ldr r2, _021ED3E4 ; =0x000018C5
	add r0, r5, #0
	ldrsb r1, [r5, r2]
	sub r2, r2, #1
	ldrsb r2, [r5, r2]
	mov r3, #6
	bl ov18_021F619C
	add r0, r5, #0
	bl ov18_021F0D2C
	ldr r0, _021ED3E0 ; =0x00000868
	mov r1, #0
	add r0, r5, r0
	mov r2, #0x10
	bl MI_CpuFill8
	mov r0, #0x50
	pop {r3, r4, r5, r6, r7, pc}
_021ED3DC:
	mov r0, #0x53
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021ED3E0: .word 0x00000868
_021ED3E4: .word 0x000018C5
	thumb_func_end ov18_021ED304

	thumb_func_start ov18_021ED3E8
ov18_021ED3E8: ; 0x021ED3E8
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	add r0, sp, #4
	add r1, sp, #0
	bl sub_02025364
	cmp r0, #0
	bne _021ED400
	add sp, #8
	mov r0, #0x50
	pop {r4, pc}
_021ED400:
	ldr r1, [sp, #4]
	ldr r2, [sp]
	add r0, r4, #0
	bl ov18_021F6310
	cmp r0, #1
	bne _021ED440
	add r0, r4, #0
	bl ov18_021F6038
	ldr r1, _021ED448 ; =0x000018C5
	add r0, r4, #0
	ldrsb r1, [r4, r1]
	bl ov18_021F5EF0
	ldr r2, _021ED448 ; =0x000018C5
	add r0, r4, #0
	ldrsb r1, [r4, r2]
	sub r2, r2, #1
	ldrsb r2, [r4, r2]
	mov r3, #6
	bl ov18_021F619C
	add r0, r4, #0
	bl ov18_021F0940
	add r0, r4, #0
	bl ov18_021F0D2C
	ldr r0, _021ED44C ; =0x000008E8
	bl PlaySE
_021ED440:
	mov r0, #0x54
	add sp, #8
	pop {r4, pc}
	nop
_021ED448: .word 0x000018C5
_021ED44C: .word 0x000008E8
	thumb_func_end ov18_021ED3E8

	thumb_func_start ov18_021ED450
ov18_021ED450: ; 0x021ED450
	push {r4, lr}
	ldr r1, _021ED4A8 ; =0x00000868
	add r4, r0, #0
	add r2, r4, r1
	ldrh r1, [r2]
	ldrh r2, [r2, #2]
	bl ov18_021F6310
	cmp r0, #1
	bne _021ED4A2
	add r0, r4, #0
	bl ov18_021F6038
	ldr r1, _021ED4AC ; =0x000018C5
	add r0, r4, #0
	ldrsb r1, [r4, r1]
	bl ov18_021F5EF0
	ldr r2, _021ED4AC ; =0x000018C5
	add r0, r4, #0
	ldrsb r1, [r4, r2]
	sub r2, r2, #1
	ldrsb r2, [r4, r2]
	mov r3, #6
	bl ov18_021F619C
	add r0, r4, #0
	bl ov18_021F0940
	add r0, r4, #0
	bl ov18_021F0D2C
	ldr r0, _021ED4B0 ; =0x000008E8
	bl PlaySE
	ldr r0, _021ED4A8 ; =0x00000868
	mov r1, #0
	add r0, r4, r0
	mov r2, #0x10
	bl MI_CpuFill8
_021ED4A2:
	mov r0, #0x50
	pop {r4, pc}
	nop
_021ED4A8: .word 0x00000868
_021ED4AC: .word 0x000018C5
_021ED4B0: .word 0x000008E8
	thumb_func_end ov18_021ED450

	thumb_func_start ov18_021ED4B4
ov18_021ED4B4: ; 0x021ED4B4
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r1, _021ED5E8 ; =0x00000868
	add r4, r0, #0
	ldrb r1, [r4, r1]
	cmp r1, #0
	beq _021ED4C8
	cmp r1, #1
	beq _021ED532
	b _021ED5E2
_021ED4C8:
	mov r1, #0
	add r2, r1, #0
	bl ov18_021F11C0
	add r0, r4, #0
	bl ov18_021E6714
	mov r3, #0
	str r3, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0x85
	str r3, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r2, _021ED5EC ; =0x0000F7BE
	mov r1, #1
	bl sub_02003370
	mov r3, #0
	str r3, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0x85
	str r3, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r2, _021ED5F0 ; =0x0000FFEF
	mov r1, #4
	bl sub_02003370
	mov r3, #0
	str r3, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0x85
	str r3, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r2, _021ED5F4 ; =0x0000FFFF
	mov r1, #0xa
	bl sub_02003370
	ldr r0, _021ED5E8 ; =0x00000868
	add sp, #0xc
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	mov r1, #0x56
	sub r0, #0xc
	str r1, [r4, r0]
	mov r0, #3
	pop {r3, r4, pc}
_021ED532:
	ldr r0, [r4, #8]
	mov r1, #0x10
	bl sub_020199E4
	cmp r0, #0
	bne _021ED5E2
	ldr r3, _021ED5F8 ; =0x000018C7
	mov r0, #0x1f
	ldrb r1, [r4, r3]
	bic r1, r0
	strb r1, [r4, r3]
	ldrb r1, [r4, r3]
	mov r0, #0x80
	bic r1, r0
	strb r1, [r4, r3]
	mov r1, #0
	sub r0, r3, #1
	strb r1, [r4, r0]
	sub r0, r3, #2
	ldrsb r1, [r4, r0]
	sub r0, r3, #1
	ldrsb r0, [r4, r0]
	cmp r1, r0
	bne _021ED570
	sub r0, r3, #1
	sub r3, r3, #3
	ldrb r3, [r4, r3]
	add r0, r4, r0
	mov r2, #1
	bl ov18_021EDF48
_021ED570:
	add r0, r4, #0
	bl ov18_021E81A8
	add r0, r4, #0
	bl ov18_021F0DD0
	add r0, r4, #0
	bl ov18_021F6684
	add r0, r4, #0
	bl ov18_021F6714
	mov r0, #0x10
	str r0, [sp]
	mov r3, #0
	str r3, [sp, #4]
	mov r0, #0x85
	str r3, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r2, _021ED5EC ; =0x0000F7BE
	mov r1, #1
	bl sub_02003370
	mov r0, #0x10
	str r0, [sp]
	mov r3, #0
	str r3, [sp, #4]
	mov r0, #0x85
	str r3, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r2, _021ED5F0 ; =0x0000FFEF
	mov r1, #4
	bl sub_02003370
	mov r0, #0x10
	str r0, [sp]
	mov r3, #0
	str r3, [sp, #4]
	mov r0, #0x85
	str r3, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r2, _021ED5F4 ; =0x0000FFFF
	mov r1, #0xa
	bl sub_02003370
	ldr r0, _021ED5E8 ; =0x00000868
	mov r1, #0
	strb r1, [r4, r0]
	mov r1, #0x57
	sub r0, #0xc
	str r1, [r4, r0]
	add sp, #0xc
	mov r0, #3
	pop {r3, r4, pc}
_021ED5E2:
	mov r0, #0x56
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_021ED5E8: .word 0x00000868
_021ED5EC: .word 0x0000F7BE
_021ED5F0: .word 0x0000FFEF
_021ED5F4: .word 0x0000FFFF
_021ED5F8: .word 0x000018C7
	thumb_func_end ov18_021ED4B4

	thumb_func_start ov18_021ED5FC
ov18_021ED5FC: ; 0x021ED5FC
	push {r4, lr}
	sub sp, #0x10
	add r1, sp, #0xc
	add r4, r0, #0
	bl ov18_021F7DCC
	cmp r0, #7
	bhi _021ED67C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021ED618: ; jump table
	.short _021ED628 - _021ED618 - 2 ; case 0
	.short _021ED64C - _021ED618 - 2 ; case 1
	.short _021ED66E - _021ED618 - 2 ; case 2
	.short _021ED694 - _021ED618 - 2 ; case 3
	.short _021ED6B6 - _021ED618 - 2 ; case 4
	.short _021ED70A - _021ED618 - 2 ; case 5
	.short _021ED72C - _021ED618 - 2 ; case 6
	.short _021ED764 - _021ED618 - 2 ; case 7
_021ED628:
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	bl ov18_021EDF84
	cmp r0, #1
	bne _021ED67C
	ldr r0, [sp, #0xc]
	cmp r0, #1
	bne _021ED644
	ldr r0, _021ED7A8 ; =0x000008E9
	bl PlaySE
	b _021ED7A0
_021ED644:
	ldr r0, _021ED7AC ; =0x000008E8
	bl PlaySE
	b _021ED7A0
_021ED64C:
	add r0, r4, #0
	mov r1, #1
	bl ov18_021EDF84
	cmp r0, #1
	bne _021ED67C
	ldr r0, [sp, #0xc]
	cmp r0, #1
	bne _021ED666
	ldr r0, _021ED7A8 ; =0x000008E9
	bl PlaySE
	b _021ED7A0
_021ED666:
	ldr r0, _021ED7AC ; =0x000008E8
	bl PlaySE
	b _021ED7A0
_021ED66E:
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	bl ov18_021EDFF4
	cmp r0, #1
	beq _021ED67E
_021ED67C:
	b _021ED7A0
_021ED67E:
	ldr r0, [sp, #0xc]
	cmp r0, #1
	bne _021ED68C
	ldr r0, _021ED7A8 ; =0x000008E9
	bl PlaySE
	b _021ED7A0
_021ED68C:
	ldr r0, _021ED7AC ; =0x000008E8
	bl PlaySE
	b _021ED7A0
_021ED694:
	add r0, r4, #0
	mov r1, #1
	bl ov18_021EDFF4
	cmp r0, #1
	bne _021ED7A0
	ldr r0, [sp, #0xc]
	cmp r0, #1
	bne _021ED6AE
	ldr r0, _021ED7A8 ; =0x000008E9
	bl PlaySE
	b _021ED7A0
_021ED6AE:
	ldr r0, _021ED7AC ; =0x000008E8
	bl PlaySE
	b _021ED7A0
_021ED6B6:
	ldr r0, _021ED7A8 ; =0x000008E9
	bl PlaySE
	ldr r3, _021ED7B0 ; =0x000018C7
	mov r1, #0x80
	ldrb r2, [r4, r3]
	add r0, r2, #0
	bic r0, r1
	lsl r1, r2, #0x18
	lsr r2, r1, #0x1f
	mov r1, #1
	eor r2, r1
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	lsl r2, r2, #0x1f
	lsr r2, r2, #0x18
	orr r0, r2
	strb r0, [r4, r3]
	sub r2, r3, #2
	ldrsb r2, [r4, r2]
	add r0, r4, #0
	bl ov18_021F6984
	ldr r2, _021ED7B4 ; =0x000018C6
	add r0, r4, #0
	ldrsb r2, [r4, r2]
	mov r1, #2
	bl ov18_021F6984
	mov r0, #0xe
	str r0, [sp]
	mov r1, #3
	str r1, [sp, #4]
	mov r0, #0x57
	str r0, [sp, #8]
	add r0, r4, #0
	mov r2, #1
	mov r3, #0x14
	bl ov18_021EDC50
	add sp, #0x10
	pop {r4, pc}
_021ED70A:
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	mov r0, #0xf
	str r0, [sp]
	mov r1, #3
	str r1, [sp, #4]
	mov r0, #0x58
	str r0, [sp, #8]
	add r0, r4, #0
	mov r2, #0x10
	mov r3, #0x14
	bl ov18_021EDC50
	add sp, #0x10
	pop {r4, pc}
_021ED72C:
	ldr r0, _021ED7B8 ; =0x000018C4
	ldrsb r1, [r4, r0]
	cmp r1, #3
	blt _021ED7A0
	add r0, r0, #3
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1b
	beq _021ED7A0
	ldr r0, [sp, #0xc]
	cmp r0, #1
	bne _021ED74C
	ldr r0, _021ED7A8 ; =0x000008E9
	bl PlaySE
	b _021ED752
_021ED74C:
	ldr r0, _021ED7AC ; =0x000008E8
	bl PlaySE
_021ED752:
	ldr r1, _021ED7B0 ; =0x000018C7
	mov r0, #0x1f
	ldrb r2, [r4, r1]
	bic r2, r0
	add r0, r4, #0
	strb r2, [r4, r1]
	bl ov18_021F6990
	b _021ED7A0
_021ED764:
	ldr r0, _021ED7B8 ; =0x000018C4
	ldrsb r1, [r4, r0]
	cmp r1, #3
	blt _021ED7A0
	add r0, r0, #3
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1b
	cmp r0, #1
	beq _021ED7A0
	ldr r0, [sp, #0xc]
	cmp r0, #1
	bne _021ED786
	ldr r0, _021ED7A8 ; =0x000008E9
	bl PlaySE
	b _021ED78C
_021ED786:
	ldr r0, _021ED7AC ; =0x000008E8
	bl PlaySE
_021ED78C:
	ldr r1, _021ED7B0 ; =0x000018C7
	mov r0, #0x1f
	ldrb r2, [r4, r1]
	bic r2, r0
	mov r0, #1
	orr r0, r2
	strb r0, [r4, r1]
	add r0, r4, #0
	bl ov18_021F6990
_021ED7A0:
	mov r0, #0x57
	add sp, #0x10
	pop {r4, pc}
	nop
_021ED7A8: .word 0x000008E9
_021ED7AC: .word 0x000008E8
_021ED7B0: .word 0x000018C7
_021ED7B4: .word 0x000018C6
_021ED7B8: .word 0x000018C4
	thumb_func_end ov18_021ED5FC

	thumb_func_start ov18_021ED7BC
ov18_021ED7BC: ; 0x021ED7BC
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r1, _021ED8D4 ; =0x00000868
	add r4, r0, #0
	ldrb r2, [r4, r1]
	cmp r2, #0
	beq _021ED7D4
	cmp r2, #1
	beq _021ED82E
	cmp r2, #2
	beq _021ED8AC
	b _021ED8CE
_021ED7D4:
	mov r3, #0
	str r3, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	str r3, [sp, #8]
	sub r1, #0x18
	ldr r0, [r4, r1]
	ldr r2, _021ED8D8 ; =0x0000F7BE
	mov r1, #1
	bl sub_02003370
	mov r3, #0
	str r3, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0x85
	str r3, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r2, _021ED8DC ; =0x0000FFEF
	mov r1, #4
	bl sub_02003370
	mov r3, #0
	str r3, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0x85
	str r3, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r2, _021ED8E0 ; =0x0000FFFF
	mov r1, #0xa
	bl sub_02003370
	ldr r0, _021ED8D4 ; =0x00000868
	add sp, #0xc
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	mov r1, #0x58
	sub r0, #0xc
	str r1, [r4, r0]
	mov r0, #3
	pop {r3, r4, pc}
_021ED82E:
	bl ov18_021F67D0
	add r0, r4, #0
	bl ov18_021F0F2C
	add r0, r4, #0
	bl ov18_021E800C
	add r0, r4, #0
	bl ov18_021F662C
	add r0, r4, #0
	bl ov18_021F0928
	add r0, r4, #0
	bl ov18_021E66EC
	mov r0, #0x10
	str r0, [sp]
	mov r3, #0
	str r3, [sp, #4]
	mov r0, #0x85
	str r3, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r2, _021ED8D8 ; =0x0000F7BE
	mov r1, #1
	bl sub_02003370
	mov r0, #0x10
	str r0, [sp]
	mov r3, #0
	str r3, [sp, #4]
	mov r0, #0x85
	str r3, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r2, _021ED8DC ; =0x0000FFEF
	mov r1, #4
	bl sub_02003370
	mov r0, #0x10
	str r0, [sp]
	mov r3, #0
	str r3, [sp, #4]
	mov r0, #0x85
	str r3, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r2, _021ED8E0 ; =0x0000FFFF
	mov r1, #0xa
	bl sub_02003370
	ldr r0, _021ED8D4 ; =0x00000868
	add sp, #0xc
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	mov r1, #0x58
	sub r0, #0xc
	str r1, [r4, r0]
	mov r0, #3
	pop {r3, r4, pc}
_021ED8AC:
	ldr r0, [r4, #8]
	mov r1, #0x10
	bl sub_020199E4
	cmp r0, #0
	bne _021ED8CE
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	bl ov18_021F11C0
	ldr r0, _021ED8D4 ; =0x00000868
	mov r1, #0
	strb r1, [r4, r0]
	add sp, #0xc
	mov r0, #0x50
	pop {r3, r4, pc}
_021ED8CE:
	mov r0, #0x58
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_021ED8D4: .word 0x00000868
_021ED8D8: .word 0x0000F7BE
_021ED8DC: .word 0x0000FFEF
_021ED8E0: .word 0x0000FFFF
	thumb_func_end ov18_021ED7BC

	thumb_func_start ov18_021ED8E4
ov18_021ED8E4: ; 0x021ED8E4
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r1, _021ED978 ; =0x00000868
	add r4, r0, #0
	ldrb r2, [r4, r1]
	cmp r2, #0
	beq _021ED8F8
	cmp r2, #1
	beq _021ED962
	b _021ED972
_021ED8F8:
	mov r1, #4
	bl ov18_021E67C8
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x85
	lsl r0, r0, #4
	mov r1, #1
	ldr r0, [r4, r0]
	ldr r2, _021ED97C ; =0x0000F7BE
	sub r3, r1, #3
	bl sub_02003370
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x85
	lsl r0, r0, #4
	mov r1, #4
	ldr r0, [r4, r0]
	ldr r2, _021ED980 ; =0x0000FFEF
	sub r3, r1, #6
	bl sub_02003370
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x85
	lsl r0, r0, #4
	mov r1, #0xa
	add r3, r1, #0
	ldr r0, [r4, r0]
	ldr r2, _021ED984 ; =0x0000FFFF
	sub r3, #0xc
	bl sub_02003370
	ldr r0, _021ED978 ; =0x00000868
	add sp, #0xc
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	mov r1, #0x59
	sub r0, #0xc
	str r1, [r4, r0]
	mov r0, #3
	pop {r3, r4, pc}
_021ED962:
	ldr r0, _021ED988 ; =0x0000185B
	mov r2, #4
	strb r2, [r4, r0]
	mov r0, #0
	strb r0, [r4, r1]
	add sp, #0xc
	mov r0, #0x5a
	pop {r3, r4, pc}
_021ED972:
	mov r0, #0x59
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_021ED978: .word 0x00000868
_021ED97C: .word 0x0000F7BE
_021ED980: .word 0x0000FFEF
_021ED984: .word 0x0000FFFF
_021ED988: .word 0x0000185B
	thumb_func_end ov18_021ED8E4

	thumb_func_start ov18_021ED98C
ov18_021ED98C: ; 0x021ED98C
	push {r4, lr}
	sub sp, #0x10
	add r1, sp, #0xc
	add r4, r0, #0
	bl ov18_021F7E70
	cmp r0, #4
	bhi _021EDA52
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021ED9A8: ; jump table
	.short _021ED9B2 - _021ED9A8 - 2 ; case 0
	.short _021ED9D4 - _021ED9A8 - 2 ; case 1
	.short _021ED9F6 - _021ED9A8 - 2 ; case 2
	.short _021EDA18 - _021ED9A8 - 2 ; case 3
	.short _021EDA2E - _021ED9A8 - 2 ; case 4
_021ED9B2:
	ldr r0, [sp, #0xc]
	cmp r0, #1
	bne _021ED9C0
	ldr r0, _021EDA58 ; =0x000008E9
	bl PlaySE
	b _021ED9C6
_021ED9C0:
	ldr r0, _021EDA5C ; =0x000008E8
	bl PlaySE
_021ED9C6:
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	bl ov18_021EC1DC
	add sp, #0x10
	pop {r4, pc}
_021ED9D4:
	ldr r0, [sp, #0xc]
	cmp r0, #1
	bne _021ED9E2
	ldr r0, _021EDA58 ; =0x000008E9
	bl PlaySE
	b _021ED9E8
_021ED9E2:
	ldr r0, _021EDA5C ; =0x000008E8
	bl PlaySE
_021ED9E8:
	add r0, r4, #0
	mov r1, #0
	mov r2, #2
	bl ov18_021EC1DC
	add sp, #0x10
	pop {r4, pc}
_021ED9F6:
	ldr r0, [sp, #0xc]
	cmp r0, #1
	bne _021EDA04
	ldr r0, _021EDA58 ; =0x000008E9
	bl PlaySE
	b _021EDA0A
_021EDA04:
	ldr r0, _021EDA5C ; =0x000008E8
	bl PlaySE
_021EDA0A:
	add r0, r4, #0
	mov r1, #0
	mov r2, #3
	bl ov18_021EC1DC
	add sp, #0x10
	pop {r4, pc}
_021EDA18:
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	mov r1, #0
	mov r2, #0xff
	bl ov18_021EC1DC
	add sp, #0x10
	pop {r4, pc}
_021EDA2E:
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	mov r0, #0x14
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #0x43
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #3
	mov r2, #6
	mov r3, #9
	bl ov18_021EDC50
	add sp, #0x10
	pop {r4, pc}
_021EDA52:
	mov r0, #0x5a
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_021EDA58: .word 0x000008E9
_021EDA5C: .word 0x000008E8
	thumb_func_end ov18_021ED98C

	thumb_func_start ov18_021EDA60
ov18_021EDA60: ; 0x021EDA60
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r1, _021EDB10 ; =0x00000868
	add r5, r0, #0
	add r4, r5, r1
	ldrh r2, [r4]
	cmp r2, #0
	beq _021EDA76
	cmp r2, #1
	beq _021EDADC
	b _021EDB0A
_021EDA76:
	ldrb r0, [r4, #2]
	sub r1, #0x18
	ldr r2, _021EDB14 ; =0x0000F7BE
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	mov r1, #1
	sub r3, r1, #3
	bl sub_02003370
	ldrb r0, [r4, #2]
	mov r1, #4
	ldr r2, _021EDB18 ; =0x0000FFEF
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #0x85
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	sub r3, r1, #6
	bl sub_02003370
	ldrb r0, [r4, #2]
	mov r1, #0xa
	add r3, r1, #0
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #0x85
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	ldr r2, _021EDB1C ; =0x0000FFFF
	sub r3, #0xc
	bl sub_02003370
	ldrh r0, [r4]
	mov r1, #0x5b
	add sp, #0xc
	add r0, r0, #1
	strh r0, [r4]
	ldr r0, _021EDB20 ; =0x0000085C
	str r1, [r5, r0]
	mov r0, #3
	pop {r4, r5, pc}
_021EDADC:
	bl ov18_021F08E0
	ldr r0, _021EDB10 ; =0x00000868
	mov r1, #0
	add r0, r5, r0
	mov r2, #0x10
	bl MI_CpuFill8
	ldr r0, _021EDB24 ; =0x0000185B
	ldrb r0, [r5, r0]
	cmp r0, #2
	bne _021EDAFA
	add sp, #0xc
	mov r0, #0x4c
	pop {r4, r5, pc}
_021EDAFA:
	cmp r0, #3
	bne _021EDB04
	add sp, #0xc
	mov r0, #0x4f
	pop {r4, r5, pc}
_021EDB04:
	add sp, #0xc
	mov r0, #0x44
	pop {r4, r5, pc}
_021EDB0A:
	mov r0, #0x5b
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_021EDB10: .word 0x00000868
_021EDB14: .word 0x0000F7BE
_021EDB18: .word 0x0000FFEF
_021EDB1C: .word 0x0000FFFF
_021EDB20: .word 0x0000085C
_021EDB24: .word 0x0000185B
	thumb_func_end ov18_021EDA60

	thumb_func_start ov18_021EDB28
ov18_021EDB28: ; 0x021EDB28
	ldr r1, _021EDB34 ; =0x0000085C
	mov r2, #0x5d
	str r2, [r0, r1]
	ldr r3, _021EDB38 ; =ov18_021EDB3C
	mov r1, #1
	bx r3
	.balign 4, 0
_021EDB34: .word 0x0000085C
_021EDB38: .word ov18_021EDB3C
	thumb_func_end ov18_021EDB28

	thumb_func_start ov18_021EDB3C
ov18_021EDB3C: ; 0x021EDB3C
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x25
	str r0, [sp, #8]
	mov r0, #0
	add r4, r1, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #0x86
	lsl r0, r0, #4
	str r4, [r5, r0]
	mov r0, #2
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov18_021EDB3C

	thumb_func_start ov18_021EDB68
ov18_021EDB68: ; 0x021EDB68
	push {r3, r4, r5, r6}
	ldr r5, _021EDBB4 ; =0x00000868
	add r4, r0, #0
	add r0, r4, r5
	strb r2, [r0]
	add r2, sp, #0
	strb r3, [r0, #1]
	ldrb r3, [r2, #0x10]
	sub r5, #0xc
	strb r3, [r0, #2]
	ldrb r3, [r2, #0x14]
	strb r3, [r0, #3]
	strb r1, [r0, #4]
	mov r1, #0
	strb r1, [r0, #5]
	strb r1, [r0, #6]
	ldrb r1, [r0, #7]
	mov r3, #0xf
	ldrb r6, [r2, #0x18]
	bic r1, r3
	mov r3, #0xf
	and r3, r6
	orr r1, r3
	strb r1, [r0, #7]
	ldrb r2, [r2, #0x1c]
	ldrb r1, [r0, #7]
	mov r3, #0xf0
	lsl r2, r2, #0x1c
	bic r1, r3
	lsr r2, r2, #0x18
	orr r1, r2
	strb r1, [r0, #7]
	ldr r0, [sp, #0x20]
	str r0, [r4, r5]
	mov r0, #4
	pop {r3, r4, r5, r6}
	bx lr
	nop
_021EDBB4: .word 0x00000868
	thumb_func_end ov18_021EDB68

	thumb_func_start ov18_021EDBB8
ov18_021EDBB8: ; 0x021EDBB8
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r1, #0
	str r2, [sp]
	mov r1, #5
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	mov r1, #6
	str r1, [sp, #0xc]
	str r3, [sp, #0x10]
	mov r1, #2
	add r2, r4, #0
	mov r3, #0x13
	bl ov18_021EDB68
	add sp, #0x14
	pop {r3, r4, pc}
	thumb_func_end ov18_021EDBB8

	thumb_func_start ov18_021EDBDC
ov18_021EDBDC: ; 0x021EDBDC
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r1, #0
	str r2, [sp]
	mov r1, #4
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #5
	str r1, [sp, #0xc]
	str r3, [sp, #0x10]
	mov r1, #1
	add r2, r4, #0
	mov r3, #0x14
	bl ov18_021EDB68
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov18_021EDBDC

	thumb_func_start ov18_021EDC00
ov18_021EDC00: ; 0x021EDC00
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r1, #0
	str r3, [sp]
	add r1, sp, #0x10
	ldrb r1, [r1, #0x10]
	add r4, r2, #0
	mov r2, #3
	str r1, [sp, #4]
	mov r1, #2
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	ldr r2, [sp, #0x24]
	add r3, r4, #0
	str r2, [sp, #0x10]
	add r2, r5, #0
	bl ov18_021EDB68
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov18_021EDC00

	thumb_func_start ov18_021EDC28
ov18_021EDC28: ; 0x021EDC28
	push {lr}
	sub sp, #0x14
	add r3, r1, #0
	mov r1, #8
	str r1, [sp]
	mov r1, #4
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	mov r1, #6
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	add r2, r3, #0
	mov r1, #1
	mov r3, #0x14
	bl ov18_021EDB68
	add sp, #0x14
	pop {pc}
	.balign 4, 0
	thumb_func_end ov18_021EDC28

	thumb_func_start ov18_021EDC50
ov18_021EDC50: ; 0x021EDC50
	push {r4, r5, lr}
	sub sp, #0x14
	add r4, sp, #0x10
	ldrb r5, [r4, #0x10]
	str r5, [sp]
	ldrb r4, [r4, #0x14]
	str r4, [sp, #4]
	mov r4, #0xa
	str r4, [sp, #8]
	mov r4, #0xb
	str r4, [sp, #0xc]
	ldr r4, [sp, #0x28]
	str r4, [sp, #0x10]
	bl ov18_021EDB68
	add sp, #0x14
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov18_021EDC50

	thumb_func_start ov18_021EDC74
ov18_021EDC74: ; 0x021EDC74
	push {r3, r4, r5, lr}
	sub sp, #0x20
	add r5, r0, #0
	add r4, r1, #0
	bl ov18_021F8838
	ldr r2, _021EDCD0 ; =0x00001858
	add r1, r0, #0
	ldr r0, [r5]
	ldrb r2, [r5, r2]
	ldr r0, [r0, #8]
	bl sub_02092BD8
	ldr r0, _021EDCD0 ; =0x00001858
	strb r4, [r5, r0]
	add r0, r5, #0
	bl ov18_021E6A70
	add r0, r5, #0
	mov r1, #0
	bl ov18_021F2AC0
	mov r0, #0x11
	str r0, [sp]
	str r0, [sp, #4]
	mov r2, #0
	str r2, [sp, #8]
	mov r0, #0x98
	str r0, [sp, #0xc]
	str r2, [sp, #0x10]
	str r0, [sp, #0x14]
	mov r0, #8
	str r0, [sp, #0x18]
	mov r0, #0xe
	str r0, [sp, #0x1c]
	ldr r1, _021EDCD0 ; =0x00001858
	add r0, r5, #0
	ldrb r1, [r5, r1]
	mov r3, #0x1a
	bl ov18_021F7ED4
	add r0, r5, #0
	bl ov18_021EE5FC
	add sp, #0x20
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EDCD0: .word 0x00001858
	thumb_func_end ov18_021EDC74

	thumb_func_start ov18_021EDCD4
ov18_021EDCD4: ; 0x021EDCD4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl ov18_021EDDB4
	add r0, r5, #0
	mov r1, #1
	bl ov18_021F8884
	add r0, r5, #0
	bl ov18_021F8838
	add r4, r0, #0
	add r0, r5, #0
	bl ov18_021F8824
	ldr r2, _021EDD9C ; =0x0000185C
	add r6, r0, #0
	ldrb r2, [r5, r2]
	add r0, r5, #0
	add r1, r4, #0
	bl ov18_021E6D10
	cmp r0, #0
	bne _021EDD0C
	ldr r0, _021EDD9C ; =0x0000185C
	mov r1, #2
	strb r1, [r5, r0]
_021EDD0C:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov18_021EE6BC
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov18_021EE8B8
	add r0, r5, #0
	mov r1, #0x18
	bl ov18_021F1620
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0xb
	mov r3, #0xa
	bl ov18_021F1CAC
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #0xe
	bl ov18_021F209C
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x12
	bl ov18_021F2530
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #0xd
	bl ov18_021F1DE4
	add r0, r5, #0
	mov r1, #5
	bl ov18_021F2BB0
	add r0, r5, #0
	mov r1, #2
	mov r2, #1
	bl ov18_021F2C10
	mov r1, #1
	add r0, r5, #0
	add r2, r1, #0
	bl ov18_021F2C5C
	mov r1, #1
	add r0, r5, #0
	add r2, r1, #0
	bl ov18_021F2E80
	mov r0, #0x25
	str r0, [sp]
	ldr r2, _021EDD9C ; =0x0000185C
	ldr r3, _021EDDA0 ; =0x00000854
	ldrb r2, [r5, r2]
	ldr r0, [r5, #4]
	ldr r3, [r5, r3]
	mov r1, #7
	bl ov18_021E6F6C
	add r0, r5, #0
	bl ov18_021E6C98
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_021EDD9C: .word 0x0000185C
_021EDDA0: .word 0x00000854
	thumb_func_end ov18_021EDCD4

	thumb_func_start ov18_021EDDA4
ov18_021EDDA4: ; 0x021EDDA4
	push {r4, lr}
	add r4, r0, #0
	bl ov18_021EDC74
	add r0, r4, #0
	bl ov18_021EDCD4
	pop {r4, pc}
	thumb_func_end ov18_021EDDA4

	thumb_func_start ov18_021EDDB4
ov18_021EDDB4: ; 0x021EDDB4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl sub_02092BE4
	add r1, r0, #0
	ldr r0, _021EDDF4 ; =0x00000878
	lsl r1, r1, #0x10
	add r0, r5, r0
	lsr r1, r1, #0x10
	bl ov18_021F8850
	add r1, r0, #0
	ldr r0, _021EDDF8 ; =0x00001858
	ldrb r0, [r5, r0]
	bl Pokedex_ConvertToCurrentDexNo
	sub r4, r0, #1
	add r0, r4, #0
	mov r1, #0xf
	bl _u32_div_f
	ldr r0, _021EDDFC ; =0x0000185A
	strb r1, [r5, r0]
	add r0, r4, #0
	mov r1, #0xf
	bl _u32_div_f
	ldr r1, _021EDE00 ; =0x00001859
	strb r0, [r5, r1]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EDDF4: .word 0x00000878
_021EDDF8: .word 0x00001858
_021EDDFC: .word 0x0000185A
_021EDE00: .word 0x00001859
	thumb_func_end ov18_021EDDB4

	thumb_func_start ov18_021EDE04
ov18_021EDE04: ; 0x021EDE04
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov18_021F8838
	add r4, r0, #0
	bne _021EDE14
	mov r0, #0
	pop {r3, r4, r5, pc}
_021EDE14:
	ldr r0, [r5]
	add r1, r4, #0
	ldr r0, [r0]
	mov r2, #0
	bl Pokedex_GetSeenFormeByIdx
	add r5, r0, #0
	cmp r4, #0xac
	bne _021EDE30
	cmp r5, #2
	bne _021EDE2E
	mov r5, #1
	b _021EDE30
_021EDE2E:
	mov r5, #0
_021EDE30:
	mov r0, #1
	bl sub_02006E3C
	lsl r1, r5, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	bl PlayCry
	mov r0, #0
	bl sub_02006E3C
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov18_021EDE04

	thumb_func_start ov18_021EDE4C
ov18_021EDE4C: ; 0x021EDE4C
	push {r3, r4}
	ldr r4, _021EDE60 ; =0x00000868
	add r4, r0, r4
	strb r1, [r4]
	strb r3, [r4, #1]
	strb r2, [r4, #3]
	mov r0, #0
	strb r0, [r4, #2]
	pop {r3, r4}
	bx lr
	.balign 4, 0
_021EDE60: .word 0x00000868
	thumb_func_end ov18_021EDE4C

	thumb_func_start ov18_021EDE64
ov18_021EDE64: ; 0x021EDE64
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl ov18_021F8838
	cmp r0, #0
	bne _021EDE76
	mov r4, #0xb
	b _021EDE78
_021EDE76:
	mov r4, #0
_021EDE78:
	mov r0, #0x10
	str r0, [sp]
	mov r0, #5
	str r0, [sp, #4]
	str r4, [sp, #8]
	ldr r0, [r5, #8]
	mov r1, #1
	mov r2, #8
	mov r3, #0
	bl sub_020199F4
	mov r0, #0x10
	str r0, [sp]
	mov r0, #5
	str r0, [sp, #4]
	str r4, [sp, #8]
	ldr r0, [r5, #4]
	mov r1, #2
	mov r2, #8
	mov r3, #0x13
	bl BgTilemapRectChangePalette
	ldr r0, [r5, #4]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov18_021EDE64

	thumb_func_start ov18_021EDEB0
ov18_021EDEB0: ; 0x021EDEB0
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, _021EDF10 ; =0x0000185A
	ldrb r1, [r5, r0]
	cmp r1, #0
	bne _021EDEC6
	sub r0, r0, #1
	ldrb r0, [r5, r0]
	cmp r0, #0
	beq _021EDED0
_021EDEC6:
	add r0, r5, #0
	bl ov18_021F8838
	cmp r0, #0
	bne _021EDED4
_021EDED0:
	mov r4, #0xb
	b _021EDED6
_021EDED4:
	mov r4, #0
_021EDED6:
	mov r0, #0x10
	str r0, [sp]
	mov r0, #5
	str r0, [sp, #4]
	str r4, [sp, #8]
	mov r1, #8
	ldr r0, [r5, #8]
	add r2, r1, #0
	mov r3, #0
	bl sub_020199F4
	mov r0, #0x10
	str r0, [sp]
	mov r0, #5
	str r0, [sp, #4]
	str r4, [sp, #8]
	ldr r0, [r5, #4]
	mov r1, #2
	mov r2, #8
	mov r3, #0x13
	bl BgTilemapRectChangePalette
	ldr r0, [r5, #4]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_021EDF10: .word 0x0000185A
	thumb_func_end ov18_021EDEB0

	thumb_func_start ov18_021EDF14
ov18_021EDF14: ; 0x021EDF14
	push {r3, r4}
	ldr r3, _021EDF40 ; =0x000018C5
	ldrsb r4, [r0, r3]
	add r4, r4, r1
	bmi _021EDF26
	sub r1, r3, #1
	ldrsb r1, [r0, r1]
	cmp r4, r1
	blt _021EDF2C
_021EDF26:
	mov r0, #0
	pop {r3, r4}
	bx lr
_021EDF2C:
	ldr r1, _021EDF44 ; =0x00000868
	add r1, r0, r1
	mov r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r2, [r1, #2]
	mov r0, #1
	pop {r3, r4}
	bx lr
	nop
_021EDF40: .word 0x000018C5
_021EDF44: .word 0x00000868
	thumb_func_end ov18_021EDF14

	thumb_func_start ov18_021EDF48
ov18_021EDF48: ; 0x021EDF48
	push {r4, r5, r6, r7}
	mov r6, #0
	cmp r3, #0
	bls _021EDF80
	sub r5, r3, #1
	lsl r5, r5, #0x18
	add r4, r6, #0
	asr r5, r5, #0x18
_021EDF58:
	mov r7, #0
	ldrsb r7, [r0, r7]
	add r7, r7, r2
	strb r7, [r0]
	mov r7, #0
	ldrsb r7, [r0, r7]
	cmp r7, #0
	bge _021EDF6C
	strb r5, [r0]
	b _021EDF72
_021EDF6C:
	cmp r7, r3
	blt _021EDF72
	strb r4, [r0]
_021EDF72:
	mov r7, #0
	ldrsb r7, [r0, r7]
	cmp r7, r1
	bne _021EDF80
	add r6, r6, #1
	cmp r6, r3
	blo _021EDF58
_021EDF80:
	pop {r4, r5, r6, r7}
	bx lr
	thumb_func_end ov18_021EDF48

	thumb_func_start ov18_021EDF84
ov18_021EDF84: ; 0x021EDF84
	push {r4, r5, r6, lr}
	ldr r2, _021EDFEC ; =0x000018C4
	add r5, r0, #0
	add r6, r1, #0
	ldrsb r1, [r5, r2]
	cmp r1, #3
	bge _021EDF96
	mov r0, #0
	pop {r4, r5, r6, pc}
_021EDF96:
	add r1, r2, #3
	ldrb r3, [r5, r1]
	mov r1, #0x1f
	bic r3, r1
	add r1, r2, #3
	strb r3, [r5, r1]
	bl ov18_021F6990
	ldr r3, _021EDFF0 ; =0x000018C5
	add r2, r6, #0
	add r1, r3, #1
	ldrsb r4, [r5, r3]
	add r0, r5, r3
	sub r3, r3, #1
	ldrsb r1, [r5, r1]
	ldrb r3, [r5, r3]
	bl ov18_021EDF48
	ldr r0, _021EDFF0 ; =0x000018C5
	ldrsb r2, [r5, r0]
	cmp r2, r4
	bne _021EDFC6
	mov r0, #0
	pop {r4, r5, r6, pc}
_021EDFC6:
	add r0, r5, #0
	mov r1, #0xe
	bl ov18_021F6844
	ldr r2, _021EDFF0 ; =0x000018C5
	add r0, r5, #0
	ldrsb r2, [r5, r2]
	mov r1, #1
	bl ov18_021F6984
	ldr r2, _021EDFF0 ; =0x000018C5
	add r0, r5, #0
	ldrsb r2, [r5, r2]
	mov r1, #6
	bl ov18_021F0F68
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_021EDFEC: .word 0x000018C4
_021EDFF0: .word 0x000018C5
	thumb_func_end ov18_021EDF84

	thumb_func_start ov18_021EDFF4
ov18_021EDFF4: ; 0x021EDFF4
	push {r4, r5, r6, lr}
	ldr r2, _021EE060 ; =0x000018C4
	add r5, r0, #0
	add r6, r1, #0
	ldrsb r1, [r5, r2]
	cmp r1, #3
	bge _021EE006
	mov r0, #0
	pop {r4, r5, r6, pc}
_021EE006:
	add r1, r2, #3
	ldrb r3, [r5, r1]
	mov r1, #0x1f
	bic r3, r1
	mov r1, #1
	orr r3, r1
	add r1, r2, #3
	strb r3, [r5, r1]
	bl ov18_021F6990
	ldr r3, _021EE064 ; =0x000018C6
	add r2, r6, #0
	sub r1, r3, #1
	ldrsb r4, [r5, r3]
	add r0, r5, r3
	sub r3, r3, #2
	ldrsb r1, [r5, r1]
	ldrb r3, [r5, r3]
	bl ov18_021EDF48
	ldr r0, _021EE064 ; =0x000018C6
	ldrsb r2, [r5, r0]
	cmp r2, r4
	bne _021EE03A
	mov r0, #0
	pop {r4, r5, r6, pc}
_021EE03A:
	add r0, r5, #0
	mov r1, #0xf
	bl ov18_021F6844
	ldr r2, _021EE064 ; =0x000018C6
	add r0, r5, #0
	ldrsb r2, [r5, r2]
	mov r1, #2
	bl ov18_021F6984
	ldr r2, _021EE064 ; =0x000018C6
	add r0, r5, #0
	ldrsb r2, [r5, r2]
	mov r1, #7
	bl ov18_021F0F68
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_021EE060: .word 0x000018C4
_021EE064: .word 0x000018C6
	thumb_func_end ov18_021EDFF4

	thumb_func_start ov18_021EE068
ov18_021EE068: ; 0x021EE068
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021EE0C4 ; =0x00000868
	add r4, r5, r0
	ldr r0, [r4]
	cmp r0, #0
	beq _021EE080
	cmp r0, #1
	beq _021EE09E
	cmp r0, #2
	beq _021EE0B0
	pop {r3, r4, r5, pc}
_021EE080:
	mov r0, #0x25
	mov r1, #0x20
	bl AllocFromHeap
	str r0, [r4, #4]
	ldr r1, [r4, #4]
	add r0, r5, #0
	bl ov18_021F504C
	ldr r0, _021EE0C8 ; =0x00000884
	bl PlaySE
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_021EE09E:
	ldr r0, [r4, #4]
	bl ov18_021F50C0
	cmp r0, #0
	bne _021EE0C0
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, pc}
_021EE0B0:
	ldr r0, [r4, #4]
	bl ov18_021F516C
	cmp r0, #0
	bne _021EE0C0
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_021EE0C0:
	pop {r3, r4, r5, pc}
	nop
_021EE0C4: .word 0x00000868
_021EE0C8: .word 0x00000884
	thumb_func_end ov18_021EE068

	thumb_func_start ov18_021EE0CC
ov18_021EE0CC: ; 0x021EE0CC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021EE0E8 ; =0x0000086C
	ldr r0, [r4, r0]
	bl FreeToHeap
	ldr r0, _021EE0EC ; =0x00000868
	mov r1, #0
	add r0, r4, r0
	mov r2, #0x10
	bl MI_CpuFill8
	pop {r4, pc}
	nop
_021EE0E8: .word 0x0000086C
_021EE0EC: .word 0x00000868
	thumb_func_end ov18_021EE0CC

	thumb_func_start ov18_021EE0F0
ov18_021EE0F0: ; 0x021EE0F0
	push {r3, r4}
	ldr r3, _021EE11C ; =0x000018CA
	ldrsb r4, [r0, r3]
	add r4, r4, r1
	bmi _021EE102
	add r3, #0x36
	ldr r1, [r0, r3]
	cmp r4, r1
	blt _021EE108
_021EE102:
	mov r0, #0
	pop {r3, r4}
	bx lr
_021EE108:
	ldr r1, _021EE120 ; =0x00000868
	add r1, r0, r1
	mov r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r2, [r1, #2]
	mov r0, #1
	pop {r3, r4}
	bx lr
	nop
_021EE11C: .word 0x000018CA
_021EE120: .word 0x00000868
	thumb_func_end ov18_021EE0F0

	thumb_func_start ov18_021EE124
ov18_021EE124: ; 0x021EE124
	ldr r2, _021EE13C ; =0x000018C9
	ldrsb r3, [r0, r2]
	cmp r3, r1
	bne _021EE130
	mov r0, #0
	bx lr
_021EE130:
	strb r1, [r0, r2]
	mov r3, #0
	add r1, r2, #1
	strb r3, [r0, r1]
	mov r0, #1
	bx lr
	.balign 4, 0
_021EE13C: .word 0x000018C9
	thumb_func_end ov18_021EE124

	thumb_func_start ov18_021EE140
ov18_021EE140: ; 0x021EE140
	ldr r3, _021EE16C ; =0x00001860
	ldr r2, [r0, r3]
	cmp r2, #0
	bne _021EE14C
	mov r0, #0
	bx lr
_021EE14C:
	add r2, r3, #0
	add r2, #0x68
	ldrsb r2, [r0, r2]
	cmp r2, r1
	bne _021EE15A
	mov r0, #0
	bx lr
_021EE15A:
	add r2, r3, #0
	add r2, #0x68
	strb r1, [r0, r2]
	mov r1, #0
	add r3, #0x6a
	strb r1, [r0, r3]
	mov r0, #1
	bx lr
	nop
_021EE16C: .word 0x00001860
	thumb_func_end ov18_021EE140

	thumb_func_start ov18_021EE170
ov18_021EE170: ; 0x021EE170
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, _021EE1F4 ; =0x00001860
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _021EE1F0
	add r0, #0x68
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _021EE1B8
	mov r0, #7
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0xc
	str r0, [sp, #8]
	ldr r0, [r4, #4]
	mov r1, #0
	mov r2, #9
	mov r3, #1
	bl BgTilemapRectChangePalette
	mov r0, #7
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0xa
	str r0, [sp, #8]
	ldr r0, [r4, #4]
	mov r1, #0
	mov r2, #0x18
	mov r3, #1
	bl BgTilemapRectChangePalette
	b _021EE1E8
_021EE1B8:
	mov r0, #7
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0xa
	str r0, [sp, #8]
	ldr r0, [r4, #4]
	mov r1, #0
	mov r2, #9
	mov r3, #1
	bl BgTilemapRectChangePalette
	mov r0, #7
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0xc
	str r0, [sp, #8]
	ldr r0, [r4, #4]
	mov r1, #0
	mov r2, #0x18
	mov r3, #1
	bl BgTilemapRectChangePalette
_021EE1E8:
	ldr r0, [r4, #4]
	mov r1, #0
	bl ScheduleBgTilemapBufferTransfer
_021EE1F0:
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_021EE1F4: .word 0x00001860
	thumb_func_end ov18_021EE170

	thumb_func_start ov18_021EE1F8
ov18_021EE1F8: ; 0x021EE1F8
	push {r3, lr}
	mov r2, #0
	add r3, r2, #0
	ldr r0, [r0, #4]
	mov r1, #4
	sub r3, #0x48
	bl ScheduleSetBgPosText
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov18_021EE1F8

	thumb_func_start ov18_021EE20C
ov18_021EE20C: ; 0x021EE20C
	push {r3, lr}
	mov r2, #0
	ldr r0, [r0, #4]
	mov r1, #4
	add r3, r2, #0
	bl ScheduleSetBgPosText
	pop {r3, pc}
	thumb_func_end ov18_021EE20C

	thumb_func_start ov18_021EE21C
ov18_021EE21C: ; 0x021EE21C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021EE268 ; =0x000018C8
	ldrsb r0, [r4, r0]
	cmp r0, #0
	ldr r0, [r4, #4]
	bne _021EE24A
	mov r1, #4
	bl GetBgHOffset
	mov r1, #0x47
	mvn r1, r1
	cmp r0, r1
	bne _021EE23C
	mov r0, #0
	pop {r4, pc}
_021EE23C:
	ldr r0, [r4, #4]
	mov r1, #4
	mov r2, #2
	mov r3, #8
	bl ScheduleSetBgPosText
	b _021EE264
_021EE24A:
	mov r1, #4
	bl GetBgHOffset
	cmp r0, #0x68
	bne _021EE258
	mov r0, #0
	pop {r4, pc}
_021EE258:
	ldr r0, [r4, #4]
	mov r1, #4
	mov r2, #1
	mov r3, #8
	bl ScheduleSetBgPosText
_021EE264:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_021EE268: .word 0x000018C8
	thumb_func_end ov18_021EE21C

	thumb_func_start ov18_021EE26C
ov18_021EE26C: ; 0x021EE26C
	push {r3, r4, r5, lr}
	ldr r1, _021EE30C ; =0x000018CB
	add r4, r0, #0
	ldrb r3, [r4, r1]
	lsl r2, r3, #0x18
	lsr r2, r2, #0x1f
	beq _021EE280
	cmp r2, #1
	beq _021EE2AA
	b _021EE2F0
_021EE280:
	mov r2, #0x3f
	add r0, r3, #0
	bic r0, r2
	lsl r2, r3, #0x1a
	lsr r2, r2, #0x1a
	add r2, r2, #1
	lsl r2, r2, #0x18
	lsr r3, r2, #0x18
	mov r2, #0x3f
	and r2, r3
	orr r0, r2
	strb r0, [r4, r1]
	ldrb r2, [r4, r1]
	lsl r0, r2, #0x1a
	lsr r0, r0, #0x1a
	cmp r0, #0xf
	bne _021EE2F0
	mov r0, #0x80
	orr r0, r2
	strb r0, [r4, r1]
	b _021EE2F0
_021EE2AA:
	add r2, r3, #0
	lsl r3, r3, #0x1a
	lsr r3, r3, #0x1a
	add r3, #0xff
	mov r5, #0x3f
	lsl r3, r3, #0x18
	bic r2, r5
	lsr r5, r3, #0x18
	mov r3, #0x3f
	and r3, r5
	orr r2, r3
	strb r2, [r4, r1]
	ldrb r3, [r4, r1]
	lsl r2, r3, #0x1a
	lsr r2, r2, #0x1a
	bne _021EE2F0
	mov r2, #0x80
	bic r3, r2
	strb r3, [r4, r1]
	ldrb r5, [r4, r1]
	mov r3, #0x40
	add r2, r5, #0
	bic r2, r3
	lsl r3, r5, #0x19
	lsr r5, r3, #0x1f
	mov r3, #1
	eor r3, r5
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	lsl r3, r3, #0x1f
	lsr r3, r3, #0x19
	orr r2, r3
	strb r2, [r4, r1]
	bl ov18_021F463C
_021EE2F0:
	ldr r0, _021EE30C ; =0x000018CB
	mov r1, #0
	ldrb r0, [r4, r0]
	mov r2, #1
	lsl r0, r0, #0x1a
	lsr r3, r0, #0x1a
	mov r0, #0x1f
	sub r0, r0, r3
	str r0, [sp]
	ldr r0, _021EE310 ; =0x04001050
	bl G2x_SetBlendAlpha_
	pop {r3, r4, r5, pc}
	nop
_021EE30C: .word 0x000018CB
_021EE310: .word 0x04001050
	thumb_func_end ov18_021EE26C

	thumb_func_start ov18_021EE314
ov18_021EE314: ; 0x021EE314
	push {r3, r4, lr}
	sub sp, #4
	ldr r2, _021EE354 ; =0x000018CB
	add r4, r0, #0
	ldrb r3, [r4, r2]
	mov r1, #0x80
	bic r3, r1
	strb r3, [r4, r2]
	ldrb r3, [r4, r2]
	mov r1, #0x3f
	bic r3, r1
	strb r3, [r4, r2]
	ldrb r3, [r4, r2]
	mov r1, #0x40
	bic r3, r1
	strb r3, [r4, r2]
	bl ov18_021F463C
	ldr r0, _021EE354 ; =0x000018CB
	mov r1, #0
	ldrb r0, [r4, r0]
	mov r2, #1
	lsl r0, r0, #0x1a
	lsr r3, r0, #0x1a
	mov r0, #0x1f
	sub r0, r0, r3
	str r0, [sp]
	ldr r0, _021EE358 ; =0x04001050
	bl G2x_SetBlendAlpha_
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_021EE354: .word 0x000018CB
_021EE358: .word 0x04001050
	thumb_func_end ov18_021EE314

	thumb_func_start ov18_021EE35C
ov18_021EE35C: ; 0x021EE35C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	mov r6, #0
	str r2, [sp]
	add r0, r2, #0
	beq _021EE384
	add r4, r7, #0
	add r4, #0xc
_021EE36E:
	ldr r0, [r7, #4]
	add r1, r4, #0
	add r2, r5, #0
	bl AddWindow
	ldr r0, [sp]
	add r6, r6, #1
	add r5, #8
	add r4, #0x10
	cmp r6, r0
	blo _021EE36E
_021EE384:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov18_021EE35C

	thumb_func_start ov18_021EE388
ov18_021EE388: ; 0x021EE388
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r5, #0
	mov r6, #0
	add r4, #0xc
_021EE392:
	ldr r0, [r5, #0x18]
	cmp r0, #0
	beq _021EE39E
	add r0, r4, #0
	bl RemoveWindow
_021EE39E:
	add r6, r6, #1
	add r5, #0x10
	add r4, #0x10
	cmp r6, #0x65
	blo _021EE392
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov18_021EE388

	thumb_func_start ov18_021EE3AC
ov18_021EE3AC: ; 0x021EE3AC
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r0, r1, #0
	add r1, r3, #0
	add r4, r2, #0
	bl NewString_ReadMsgData
	mov r1, #0x66
	add r6, r0, #0
	lsl r1, r1, #4
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r6, #0
	bl StringExpandPlaceholders
	ldr r0, [sp, #0x28]
	add r1, r5, #0
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	add r1, #0xc
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	ldr r2, [sp, #0x20]
	str r0, [sp, #8]
	lsl r0, r4, #4
	add r0, r1, r0
	ldr r1, _021EE3F8 ; =0x00000664
	ldr r3, [sp, #0x24]
	ldr r1, [r5, r1]
	bl ov18_021F95FC
	add r0, r6, #0
	bl String_dtor
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021EE3F8: .word 0x00000664
	thumb_func_end ov18_021EE3AC

	thumb_func_start ov18_021EE3FC
ov18_021EE3FC: ; 0x021EE3FC
	push {r4, r5, r6, lr}
	ldr r1, _021EE448 ; =_021F9F3C
	mov r2, #0x14
	add r5, r0, #0
	bl ov18_021EE35C
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	bl ov18_021EE508
	mov r1, #1
	add r0, r5, #0
	add r2, r1, #0
	bl ov18_021EE508
	add r0, r5, #0
	bl ov18_021EE5FC
	add r0, r5, #0
	bl ov18_021F8824
	add r4, r0, #0
	add r0, r5, #0
	bl ov18_021F8838
	add r6, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	bl ov18_021EE6BC
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	bl ov18_021EE8B8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021EE448: .word _021F9F3C
	thumb_func_end ov18_021EE3FC

	thumb_func_start ov18_021EE44C
ov18_021EE44C: ; 0x021EE44C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	str r0, [sp, #0x1c]
	mov r0, #0x25
	add r4, r1, #0
	str r0, [sp]
	ldr r1, _021EE4FC ; =0x00000854
	ldr r0, [sp, #0x1c]
	str r2, [sp, #0x20]
	ldr r0, [r0, r1]
	mov r1, #1
	add r2, r1, #0
	add r3, sp, #0x2c
	bl GfGfxLoader_GetCharDataFromOpenNarc
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x2c]
	lsl r6, r4, #4
	ldr r7, [r0, #0x14]
	ldr r4, [sp, #0x1c]
	mov r5, #0
	str r5, [sp, #0x24]
	add r4, #0xc
	add r7, #0x20
_021EE47C:
	mov r0, #8
	str r0, [sp]
	str r0, [sp, #4]
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #8
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	mov r0, #0xff
	mov r2, #0
	str r0, [sp, #0x18]
	add r0, r4, r6
	add r1, r7, #0
	add r3, r2, #0
	bl BlitBitmapRect
	mov r0, #8
	str r0, [sp]
	str r0, [sp, #4]
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #8
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	mov r0, #0xff
	mov r2, #0
	str r0, [sp, #0x18]
	add r0, r4, r6
	add r1, r7, #0
	add r3, r2, #0
	bl BlitBitmapRect
	ldr r0, [sp, #0x24]
	add r5, #8
	add r0, r0, #1
	str r0, [sp, #0x24]
	cmp r0, #0xc
	blo _021EE47C
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021EE500 ; =0x000F0800
	ldr r2, _021EE504 ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x1c]
	add r0, r4, r6
	ldr r1, [r1, r2]
	ldr r2, [sp, #0x20]
	mov r3, #0x60
	bl ov18_021F9648
	ldr r0, [sp, #0x28]
	bl FreeToHeap
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EE4FC: .word 0x00000854
_021EE500: .word 0x000F0800
_021EE504: .word 0x0000065C
	thumb_func_end ov18_021EE44C

	thumb_func_start ov18_021EE508
ov18_021EE508: ; 0x021EE508
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	bl ov18_021EE44C
	add r4, #0xc
	lsl r0, r5, #4
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov18_021EE508

	thumb_func_start ov18_021EE520
ov18_021EE520: ; 0x021EE520
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r5, r0, #0
	mov r0, #0x25
	str r0, [sp]
	ldr r0, _021EE5E0 ; =0x00000854
	str r1, [sp, #0x1c]
	ldr r0, [r5, r0]
	mov r1, #1
	str r2, [sp, #0x20]
	add r2, r1, #0
	add r3, sp, #0x2c
	bl GfGfxLoader_GetCharDataFromOpenNarc
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x2c]
	mov r6, #0
	ldr r7, [r0, #0x14]
	ldr r0, [sp, #0x1c]
	add r5, #0xc
	lsl r0, r0, #4
	add r5, r5, r0
	add r0, r7, #0
	str r0, [sp, #0x28]
	add r0, #0x20
	add r4, r6, #0
	str r0, [sp, #0x28]
_021EE556:
	mov r0, #8
	str r0, [sp]
	str r0, [sp, #4]
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #8
	str r0, [sp, #0x10]
	mov r1, #3
	str r0, [sp, #0x14]
	mov r0, #0xff
	lsl r1, r1, #8
	mov r2, #0
	str r0, [sp, #0x18]
	add r0, r5, #0
	add r1, r7, r1
	add r3, r2, #0
	bl BlitBitmapRect
	mov r0, #8
	str r0, [sp]
	str r0, [sp, #4]
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #8
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	mov r0, #0xff
	mov r2, #0
	str r0, [sp, #0x18]
	ldr r1, [sp, #0x28]
	add r0, r5, #0
	add r3, r2, #0
	bl BlitBitmapRect
	add r6, r6, #1
	add r4, #8
	cmp r6, #3
	blo _021EE556
	ldr r0, [sp, #0x24]
	bl FreeToHeap
	mov r0, #0xf
	mov r1, #8
	mov r2, #7
	mov r3, #0x25
	bl MessagePrinter_new
	str r5, [sp]
	mov r1, #0
	str r1, [sp, #4]
	mov r1, #4
	str r1, [sp, #8]
	ldr r1, [sp, #0x20]
	add r4, r0, #0
	mov r2, #3
	mov r3, #2
	bl sub_0200CDF0
	add r0, r4, #0
	bl MessagePrinter_delete
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EE5E0: .word 0x00000854
	thumb_func_end ov18_021EE520

	thumb_func_start ov18_021EE5E4
ov18_021EE5E4: ; 0x021EE5E4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	bl ov18_021EE520
	add r4, #0xc
	lsl r0, r5, #4
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov18_021EE5E4

	thumb_func_start ov18_021EE5FC
ov18_021EE5FC: ; 0x021EE5FC
	push {r4, lr}
	ldr r1, _021EE62C ; =0x0000185D
	add r4, r0, #0
	ldr r2, _021EE630 ; =0x0000102C
	ldrb r1, [r4, r1]
	ldrh r2, [r4, r2]
	add r1, r1, #2
	bl ov18_021EE5E4
	ldr r1, _021EE62C ; =0x0000185D
	ldr r2, _021EE634 ; =0x0000102E
	ldrb r1, [r4, r1]
	ldrh r2, [r4, r2]
	add r0, r4, #0
	add r1, r1, #4
	bl ov18_021EE5E4
	ldr r1, _021EE62C ; =0x0000185D
	mov r0, #1
	ldrb r2, [r4, r1]
	eor r0, r2
	strb r0, [r4, r1]
	pop {r4, pc}
	nop
_021EE62C: .word 0x0000185D
_021EE630: .word 0x0000102C
_021EE634: .word 0x0000102E
	thumb_func_end ov18_021EE5FC

	thumb_func_start ov18_021EE638
ov18_021EE638: ; 0x021EE638
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r7, r1, #0
	beq _021EE6A6
	add r4, r5, #0
	add r4, #0xc
	lsl r6, r2, #4
	add r0, r4, r6
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r1, _021EE6B4 ; =0x0000185C
	add r0, r7, #0
	ldrb r1, [r5, r1]
	mov r2, #0x25
	bl ov18_021E590C
	add r7, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl Pokedex_GetInternationalViewFlag
	cmp r0, #1
	ldr r0, _021EE6B8 ; =0x00020100
	bne _021EE682
	mov r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	add r0, r4, r6
	add r1, r7, #0
	mov r2, #0x38
	bl ov18_021F95FC
	b _021EE696
_021EE682:
	mov r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	add r0, r4, r6
	add r1, r7, #0
	mov r2, #0x2c
	bl ov18_021F95FC
_021EE696:
	add r0, r7, #0
	bl String_dtor
	add r0, r4, r6
	bl ScheduleWindowCopyToVram
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_021EE6A6:
	add r5, #0xc
	lsl r0, r2, #4
	add r0, r5, r0
	bl ClearWindowTilemapAndScheduleTransfer
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021EE6B4: .word 0x0000185C
_021EE6B8: .word 0x00020100
	thumb_func_end ov18_021EE638

	thumb_func_start ov18_021EE6BC
ov18_021EE6BC: ; 0x021EE6BC
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	mov r1, #7
	add r6, r2, #0
	bl ov18_021EE71C
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #8
	bl ov18_021EE75C
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #9
	bl ov18_021EE7DC
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #0xa
	bl ov18_021EE834
	pop {r4, r5, r6, pc}
	thumb_func_end ov18_021EE6BC

	thumb_func_start ov18_021EE6EC
ov18_021EE6EC: ; 0x021EE6EC
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	mov r1, #0x51
	add r6, r2, #0
	bl ov18_021EE71C
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x52
	bl ov18_021EE75C
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x53
	bl ov18_021EE7DC
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #0x54
	bl ov18_021EE834
	pop {r4, r5, r6, pc}
	thumb_func_end ov18_021EE6EC

	thumb_func_start ov18_021EE71C
ov18_021EE71C: ; 0x021EE71C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r0, #0
	add r5, r6, #0
	lsl r4, r1, #4
	add r5, #0xc
	add r0, r5, r4
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r3, #0
	str r3, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _021EE754 ; =0x00020100
	ldr r1, _021EE758 ; =0x0000065C
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r1, [r6, r1]
	add r0, r5, r4
	mov r2, #8
	bl ov18_021F9648
	add r0, r5, r4
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021EE754: .word 0x00020100
_021EE758: .word 0x0000065C
	thumb_func_end ov18_021EE71C

	thumb_func_start ov18_021EE75C
ov18_021EE75C: ; 0x021EE75C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	add r4, r5, #0
	add r0, r2, #0
	add r7, r1, #0
	add r4, #0xc
	lsl r6, r0, #4
	add r0, r4, r6
	mov r1, #0
	str r2, [sp, #0x14]
	bl FillWindowPixelBuffer
	cmp r7, #0
	beq _021EE7C6
	ldr r0, _021EE7D0 ; =0x00001858
	add r1, r7, #0
	ldrb r0, [r5, r0]
	bl Pokedex_ConvertToCurrentDexNo
	add r2, r0, #0
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x66
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	mov r3, #3
	bl BufferIntegerAsString
	mov r0, #1
	str r0, [sp]
	mov r1, #0
	str r1, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	ldr r0, _021EE7D4 ; =0x00020100
	ldr r2, [sp, #0x14]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r1, _021EE7D8 ; =0x0000065C
	add r0, r5, #0
	ldr r1, [r5, r1]
	mov r3, #9
	bl ov18_021EE3AC
	add r0, r4, r6
	bl ScheduleWindowCopyToVram
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_021EE7C6:
	add r0, r4, r6
	bl ClearWindowTilemapAndScheduleTransfer
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021EE7D0: .word 0x00001858
_021EE7D4: .word 0x00020100
_021EE7D8: .word 0x0000065C
	thumb_func_end ov18_021EE75C

	thumb_func_start ov18_021EE7DC
ov18_021EE7DC: ; 0x021EE7DC
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r4, r0, #0
	lsl r5, r2, #4
	add r4, #0xc
	add r6, r1, #0
	add r0, r4, r5
	mov r1, #0
	bl FillWindowPixelBuffer
	cmp r6, #0
	beq _021EE826
	add r0, r6, #0
	mov r1, #2
	mov r2, #0x25
	bl ov18_021E590C
	add r6, r0, #0
	mov r0, #4
	str r0, [sp]
	ldr r0, _021EE830 ; =0x00020100
	mov r2, #0
	str r0, [sp, #4]
	add r0, r4, r5
	add r1, r6, #0
	add r3, r2, #0
	str r2, [sp, #8]
	bl ov18_021F95FC
	add r0, r6, #0
	bl String_dtor
	add r0, r4, r5
	bl ScheduleWindowCopyToVram
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_021EE826:
	add r0, r4, r5
	bl ClearWindowTilemapAndScheduleTransfer
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021EE830: .word 0x00020100
	thumb_func_end ov18_021EE7DC

	thumb_func_start ov18_021EE834
ov18_021EE834: ; 0x021EE834
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r0, #0
	add r4, r6, #0
	lsl r5, r3, #4
	add r4, #0xc
	add r7, r1, #0
	add r0, r4, r5
	mov r1, #0
	str r2, [sp, #0xc]
	bl FillWindowPixelBuffer
	cmp r7, #0
	beq _021EE8A6
	ldr r0, [sp, #0xc]
	lsl r0, r0, #2
	add r1, r6, r0
	ldr r0, _021EE8B0 ; =0x00001032
	ldrh r0, [r1, r0]
	cmp r0, #2
	bne _021EE86A
	add r0, r7, #0
	mov r1, #2
	mov r2, #0x25
	bl ov18_021E595C
	b _021EE874
_021EE86A:
	mov r0, #0
	mov r1, #2
	mov r2, #0x25
	bl ov18_021E595C
_021EE874:
	add r6, r0, #0
	add r0, r4, r5
	bl GetWindowWidth
	lsl r0, r0, #3
	sub r2, r0, #4
	mov r0, #4
	str r0, [sp]
	ldr r0, _021EE8B4 ; =0x00020100
	add r1, r6, #0
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	add r0, r4, r5
	mov r3, #0
	bl ov18_021F95FC
	add r0, r6, #0
	bl String_dtor
	add r0, r4, r5
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_021EE8A6:
	add r0, r4, r5
	bl ClearWindowTilemapAndScheduleTransfer
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021EE8B0: .word 0x00001032
_021EE8B4: .word 0x00020100
	thumb_func_end ov18_021EE834

	thumb_func_start ov18_021EE8B8
ov18_021EE8B8: ; 0x021EE8B8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0xcc
	add r4, r1, #0
	add r6, r2, #0
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r5, #0
	add r0, #0xec
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r5, #0
	add r0, #0xbc
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r5, #0
	add r0, #0xdc
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r5, #0
	add r0, #0xfc
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x47
	lsl r0, r0, #2
	add r0, r5, r0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x4b
	lsl r0, r0, #2
	add r0, r5, r0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x4f
	lsl r0, r0, #2
	add r0, r5, r0
	bl ClearWindowTilemapAndScheduleTransfer
	cmp r4, #0
	beq _021EE97C
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #0xb
	bl ov18_021EE984
	ldr r0, _021EE980 ; =0x0000185C
	ldrb r0, [r5, r0]
	cmp r0, #2
	bne _021EE950
	add r0, r5, #0
	mov r1, #0xc
	bl ov18_021EE9FC
	add r0, r5, #0
	mov r1, #0xe
	bl ov18_021EEA40
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #0xd
	bl ov18_021EEAE4
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #0xf
	bl ov18_021EEB94
	pop {r4, r5, r6, pc}
_021EE950:
	add r0, r5, #0
	mov r1, #0x10
	bl ov18_021EEBE4
	ldr r3, _021EE980 ; =0x0000185C
	add r0, r5, #0
	ldrb r3, [r5, r3]
	add r1, r4, #0
	mov r2, #0x11
	bl ov18_021EEC34
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x12
	bl ov18_021EECB0
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #0x13
	bl ov18_021EED00
_021EE97C:
	pop {r4, r5, r6, pc}
	nop
_021EE980: .word 0x0000185C
	thumb_func_end ov18_021EE8B8

	thumb_func_start ov18_021EE984
ov18_021EE984: ; 0x021EE984
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	lsl r0, r2, #2
	add r7, r1, #0
	add r1, r6, r0
	ldr r0, _021EE9F0 ; =0x00001032
	ldrh r0, [r1, r0]
	cmp r0, #2
	bne _021EE9EC
	add r5, r6, #0
	add r5, #0xc
	lsl r4, r3, #4
	add r0, r5, r4
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r1, _021EE9F4 ; =0x0000185C
	add r0, r7, #0
	ldrb r1, [r6, r1]
	mov r2, #0
	mov r3, #0x25
	bl ov18_021E59A8
	add r6, r0, #0
	add r0, r5, r4
	bl GetWindowWidth
	add r7, r0, #0
	mov r0, #0
	add r1, r6, #0
	add r2, r0, #0
	bl FontID_String_GetWidthMultiline
	lsl r1, r7, #3
	sub r0, r1, r0
	lsr r2, r0, #1
	mov r3, #0
	ldr r0, _021EE9F8 ; =0x00020100
	str r3, [sp]
	str r0, [sp, #4]
	add r0, r5, r4
	add r1, r6, #0
	str r3, [sp, #8]
	bl ov18_021F95FC
	add r0, r6, #0
	bl String_dtor
	add r0, r5, r4
	bl ScheduleWindowCopyToVram
_021EE9EC:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021EE9F0: .word 0x00001032
_021EE9F4: .word 0x0000185C
_021EE9F8: .word 0x00020100
	thumb_func_end ov18_021EE984

	thumb_func_start ov18_021EE9FC
ov18_021EE9FC: ; 0x021EE9FC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r0, #0
	add r5, r6, #0
	lsl r4, r1, #4
	add r5, #0xc
	add r0, r5, r4
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021EEA38 ; =0x00020100
	ldr r1, _021EEA3C ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r1, [r6, r1]
	add r0, r5, r4
	mov r2, #0xa
	mov r3, #0x14
	bl ov18_021F9648
	add r0, r5, r4
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021EEA38: .word 0x00020100
_021EEA3C: .word 0x0000065C
	thumb_func_end ov18_021EE9FC

	thumb_func_start ov18_021EEA40
ov18_021EEA40: ; 0x021EEA40
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r0, #0
	add r5, r6, #0
	lsl r4, r1, #4
	add r5, #0xc
	add r0, r5, r4
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021EEA7C ; =0x00020100
	ldr r1, _021EEA80 ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r1, [r6, r1]
	add r0, r5, r4
	mov r2, #0xb
	mov r3, #0x14
	bl ov18_021F9648
	add r0, r5, r4
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021EEA7C: .word 0x00020100
_021EEA80: .word 0x0000065C
	thumb_func_end ov18_021EEA40

	thumb_func_start ov18_021EEA84
ov18_021EEA84: ; 0x021EEA84
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r7, r1, #0
	add r5, r2, #0
	add r6, r3, #0
	bl GetDexHeightMsgBank
	add r2, r0, #0
	mov r0, #0
	mov r1, #0x1b
	mov r3, #0x25
	bl NewMsgDataFromNarc
	str r0, [sp, #0xc]
	cmp r5, #2
	bne _021EEAAE
	add r1, r7, #0
	bl NewString_ReadMsgData
	b _021EEAB4
_021EEAAE:
	mov r1, #0
	bl NewString_ReadMsgData
_021EEAB4:
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x30]
	add r4, #0xc
	str r0, [sp, #4]
	ldr r0, [sp, #0x34]
	ldr r2, [sp, #0x28]
	str r0, [sp, #8]
	lsl r0, r6, #4
	ldr r3, [sp, #0x2c]
	add r0, r4, r0
	add r1, r5, #0
	bl ov18_021F95FC
	add r0, r5, #0
	bl String_dtor
	ldr r0, [sp, #0xc]
	bl DestroyMsgData
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov18_021EEA84

	thumb_func_start ov18_021EEAE4
ov18_021EEAE4: ; 0x021EEAE4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	add r4, r5, #0
	add r0, r3, #0
	str r1, [sp, #0x10]
	add r4, #0xc
	lsl r6, r0, #4
	add r0, r4, r6
	mov r1, #0
	add r7, r2, #0
	str r3, [sp, #0x14]
	bl FillWindowPixelBuffer
	mov r0, #4
	str r0, [sp]
	mov r1, #0
	lsl r2, r7, #2
	add r3, r5, r2
	ldr r0, _021EEB2C ; =0x00020100
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, _021EEB30 ; =0x00001032
	ldr r1, [sp, #0x10]
	ldrh r2, [r3, r2]
	ldr r3, [sp, #0x14]
	add r0, r5, #0
	bl ov18_021EEA84
	add r0, r4, r6
	bl ScheduleWindowCopyToVram
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EEB2C: .word 0x00020100
_021EEB30: .word 0x00001032
	thumb_func_end ov18_021EEAE4

	thumb_func_start ov18_021EEB34
ov18_021EEB34: ; 0x021EEB34
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r7, r1, #0
	add r5, r2, #0
	add r6, r3, #0
	bl GetDexWeightMsgBank
	add r2, r0, #0
	mov r0, #0
	mov r1, #0x1b
	mov r3, #0x25
	bl NewMsgDataFromNarc
	str r0, [sp, #0xc]
	cmp r5, #2
	bne _021EEB5E
	add r1, r7, #0
	bl NewString_ReadMsgData
	b _021EEB64
_021EEB5E:
	mov r1, #0
	bl NewString_ReadMsgData
_021EEB64:
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x30]
	add r4, #0xc
	str r0, [sp, #4]
	ldr r0, [sp, #0x34]
	ldr r2, [sp, #0x28]
	str r0, [sp, #8]
	lsl r0, r6, #4
	ldr r3, [sp, #0x2c]
	add r0, r4, r0
	add r1, r5, #0
	bl ov18_021F95FC
	add r0, r5, #0
	bl String_dtor
	ldr r0, [sp, #0xc]
	bl DestroyMsgData
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov18_021EEB34

	thumb_func_start ov18_021EEB94
ov18_021EEB94: ; 0x021EEB94
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	add r4, r5, #0
	add r0, r3, #0
	str r1, [sp, #0x10]
	add r4, #0xc
	lsl r6, r0, #4
	add r0, r4, r6
	mov r1, #0
	add r7, r2, #0
	str r3, [sp, #0x14]
	bl FillWindowPixelBuffer
	mov r0, #4
	str r0, [sp]
	mov r1, #0
	lsl r2, r7, #2
	add r3, r5, r2
	ldr r0, _021EEBDC ; =0x00020100
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, _021EEBE0 ; =0x00001032
	ldr r1, [sp, #0x10]
	ldrh r2, [r3, r2]
	ldr r3, [sp, #0x14]
	add r0, r5, #0
	bl ov18_021EEB34
	add r0, r4, r6
	bl ScheduleWindowCopyToVram
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EEBDC: .word 0x00020100
_021EEBE0: .word 0x00001032
	thumb_func_end ov18_021EEB94

	thumb_func_start ov18_021EEBE4
ov18_021EEBE4: ; 0x021EEBE4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r0, #0
	add r5, r6, #0
	lsl r4, r1, #4
	add r5, #0xc
	add r0, r5, r4
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _021EEC28 ; =0x0000185C
	ldrb r0, [r6, r0]
	bl LanguageToDexFlag
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021EEC2C ; =0x00020100
	ldr r1, _021EEC30 ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r1, [r6, r1]
	add r0, r5, r4
	add r2, #0x7a
	mov r3, #0x38
	bl ov18_021F9648
	add r0, r5, r4
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021EEC28: .word 0x0000185C
_021EEC2C: .word 0x00020100
_021EEC30: .word 0x0000065C
	thumb_func_end ov18_021EEBE4

	thumb_func_start ov18_021EEC34
ov18_021EEC34: ; 0x021EEC34
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	add r6, r2, #0
	add r7, r5, #0
	lsl r0, r6, #4
	str r1, [sp, #0x14]
	add r7, #0xc
	str r0, [sp, #0x18]
	add r0, r7, r0
	mov r1, #0
	add r4, r3, #0
	bl FillWindowPixelBuffer
	cmp r4, #1
	bne _021EEC58
	mov r4, #0
	b _021EEC5A
_021EEC58:
	mov r4, #1
_021EEC5A:
	ldr r0, _021EECA4 ; =0x00001858
	ldr r1, [sp, #0x14]
	ldrb r0, [r5, r0]
	bl Pokedex_ConvertToCurrentDexNo
	add r2, r0, #0
	mov r0, #2
	str r0, [sp]
	mov r0, #0x66
	str r4, [sp, #4]
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	mov r3, #3
	bl BufferIntegerAsString
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, _021EECA8 ; =0x00020100
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r1, _021EECAC ; =0x0000065C
	add r0, r5, #0
	ldr r1, [r5, r1]
	add r2, r6, #0
	mov r3, #9
	bl ov18_021EE3AC
	ldr r0, [sp, #0x18]
	add r0, r7, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_021EECA4: .word 0x00001858
_021EECA8: .word 0x00020100
_021EECAC: .word 0x0000065C
	thumb_func_end ov18_021EEC34

	thumb_func_start ov18_021EECB0
ov18_021EECB0: ; 0x021EECB0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	add r5, r6, #0
	add r5, #0xc
	lsl r4, r2, #4
	add r7, r1, #0
	add r0, r5, r4
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r1, _021EECF8 ; =0x0000185C
	add r0, r7, #0
	ldrb r1, [r6, r1]
	mov r2, #0x25
	bl ov18_021E590C
	add r6, r0, #0
	mov r2, #0
	ldr r0, _021EECFC ; =0x00020100
	str r2, [sp]
	str r0, [sp, #4]
	add r0, r5, r4
	add r1, r6, #0
	add r3, r2, #0
	str r2, [sp, #8]
	bl ov18_021F95FC
	add r0, r6, #0
	bl String_dtor
	add r0, r5, r4
	bl ScheduleWindowCopyToVram
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021EECF8: .word 0x0000185C
_021EECFC: .word 0x00020100
	thumb_func_end ov18_021EECB0

	thumb_func_start ov18_021EED00
ov18_021EED00: ; 0x021EED00
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r6, r5, #0
	lsl r4, r3, #4
	add r6, #0xc
	str r1, [sp, #0xc]
	add r7, r2, #0
	add r0, r6, r4
	mov r1, #0
	bl FillWindowPixelBuffer
	lsl r0, r7, #2
	add r1, r5, r0
	ldr r0, _021EED64 ; =0x00001032
	ldrh r0, [r1, r0]
	ldr r1, _021EED68 ; =0x0000185C
	cmp r0, #2
	bne _021EED32
	ldrb r1, [r5, r1]
	ldr r0, [sp, #0xc]
	mov r2, #0x25
	bl ov18_021E595C
	b _021EED3C
_021EED32:
	ldrb r1, [r5, r1]
	mov r0, #0
	mov r2, #0x25
	bl ov18_021E595C
_021EED3C:
	add r5, r0, #0
	mov r3, #0
	ldr r0, _021EED6C ; =0x00020100
	str r3, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	add r0, r6, r4
	add r1, r5, #0
	mov r2, #0x7c
	bl ov18_021F95FC
	add r0, r5, #0
	bl String_dtor
	add r0, r6, r4
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021EED64: .word 0x00001032
_021EED68: .word 0x0000185C
_021EED6C: .word 0x00020100
	thumb_func_end ov18_021EED00

	thumb_func_start ov18_021EED70
ov18_021EED70: ; 0x021EED70
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _021EEE30 ; =0x0000056C
	add r4, r1, #0
	add r0, r5, r0
	add r6, r2, #0
	bl ClearWindowTilemapAndScheduleTransfer
	ldr r0, _021EEE34 ; =0x0000058C
	add r0, r5, r0
	bl ClearWindowTilemapAndScheduleTransfer
	ldr r0, _021EEE38 ; =0x0000055C
	add r0, r5, r0
	bl ClearWindowTilemapAndScheduleTransfer
	ldr r0, _021EEE3C ; =0x0000057C
	add r0, r5, r0
	bl ClearWindowTilemapAndScheduleTransfer
	ldr r0, _021EEE40 ; =0x0000059C
	add r0, r5, r0
	bl ClearWindowTilemapAndScheduleTransfer
	ldr r0, _021EEE44 ; =0x000005AC
	add r0, r5, r0
	bl ClearWindowTilemapAndScheduleTransfer
	ldr r0, _021EEE48 ; =0x000005BC
	add r0, r5, r0
	bl ClearWindowTilemapAndScheduleTransfer
	ldr r0, _021EEE4C ; =0x000005CC
	add r0, r5, r0
	bl ClearWindowTilemapAndScheduleTransfer
	ldr r0, _021EEE50 ; =0x000005DC
	add r0, r5, r0
	bl ClearWindowTilemapAndScheduleTransfer
	cmp r4, #0
	beq _021EEE2E
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #0x55
	bl ov18_021EE984
	ldr r0, _021EEE54 ; =0x0000185C
	ldrb r0, [r5, r0]
	cmp r0, #2
	bne _021EEE02
	add r0, r5, #0
	mov r1, #0x56
	bl ov18_021EE9FC
	add r0, r5, #0
	mov r1, #0x58
	bl ov18_021EEA40
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #0x57
	bl ov18_021EEAE4
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #0x59
	bl ov18_021EEB94
	pop {r4, r5, r6, pc}
_021EEE02:
	add r0, r5, #0
	mov r1, #0x5a
	bl ov18_021EEBE4
	ldr r3, _021EEE54 ; =0x0000185C
	add r0, r5, #0
	ldrb r3, [r5, r3]
	add r1, r4, #0
	mov r2, #0x5b
	bl ov18_021EEC34
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x5c
	bl ov18_021EECB0
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #0x5d
	bl ov18_021EED00
_021EEE2E:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021EEE30: .word 0x0000056C
_021EEE34: .word 0x0000058C
_021EEE38: .word 0x0000055C
_021EEE3C: .word 0x0000057C
_021EEE40: .word 0x0000059C
_021EEE44: .word 0x000005AC
_021EEE48: .word 0x000005BC
_021EEE4C: .word 0x000005CC
_021EEE50: .word 0x000005DC
_021EEE54: .word 0x0000185C
	thumb_func_end ov18_021EED70

	thumb_func_start ov18_021EEE58
ov18_021EEE58: ; 0x021EEE58
	push {r4, lr}
	ldr r1, _021EEE80 ; =_021F9FDC
	add r4, r0, #0
	mov r2, #0x65
	bl ov18_021EE35C
	add r0, r4, #0
	mov r1, #0
	bl ov18_021EEED0
	add r0, r4, #0
	bl ov18_021EF45C
	add r0, r4, #0
	bl ov18_021EF528
	add r0, r4, #0
	bl ov18_021EEE84
	pop {r4, pc}
	.balign 4, 0
_021EEE80: .word _021F9FDC
	thumb_func_end ov18_021EEE58

	thumb_func_start ov18_021EEE84
ov18_021EEE84: ; 0x021EEE84
	push {r4, lr}
	add r4, r0, #0
	mov r2, #0x47
	lsl r2, r2, #2
	ldr r0, [r4, #8]
	mov r1, #6
	add r2, r4, r2
	bl sub_02019A60
	mov r2, #0x4b
	lsl r2, r2, #2
	ldr r0, [r4, #8]
	mov r1, #6
	add r2, r4, r2
	bl sub_02019A60
	mov r2, #0x4f
	lsl r2, r2, #2
	ldr r0, [r4, #8]
	mov r1, #6
	add r2, r4, r2
	bl sub_02019A60
	mov r2, #0x47
	lsl r2, r2, #2
	ldr r0, [r4, #8]
	mov r1, #7
	add r2, r4, r2
	bl sub_02019A60
	mov r2, #0x4f
	lsl r2, r2, #2
	ldr r0, [r4, #8]
	mov r1, #7
	add r2, r4, r2
	bl sub_02019A60
	pop {r4, pc}
	thumb_func_end ov18_021EEE84

	thumb_func_start ov18_021EEED0
ov18_021EEED0: ; 0x021EEED0
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r4, r0, #0
	add r5, r4, #0
	add r5, #0xc
	add r6, r1, #0
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	cmp r6, #0xa
	bls _021EEEEA
	b _021EF1CE
_021EEEEA:
	add r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021EEEF6: ; jump table
	.short _021EEF0C - _021EEEF6 - 2 ; case 0
	.short _021EEF4A - _021EEEF6 - 2 ; case 1
	.short _021EEFA4 - _021EEEF6 - 2 ; case 2
	.short _021EEFE2 - _021EEEF6 - 2 ; case 3
	.short _021EF020 - _021EEEF6 - 2 ; case 4
	.short _021EF05E - _021EEEF6 - 2 ; case 5
	.short _021EF09C - _021EEEF6 - 2 ; case 6
	.short _021EF0DA - _021EEEF6 - 2 ; case 7
	.short _021EF116 - _021EEEF6 - 2 ; case 8
	.short _021EF154 - _021EEEF6 - 2 ; case 9
	.short _021EF192 - _021EEEF6 - 2 ; case 10
_021EEF0C:
	mov r0, #6
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _021EF1D8 ; =0x00020100
	ldr r1, _021EF1DC ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0xc
	mov r3, #0x70
	bl ov18_021F9648
	mov r0, #0x16
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _021EF1D8 ; =0x00020100
	ldr r1, _021EF1DC ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0xd
	mov r3, #0x70
	bl ov18_021F9648
	b _021EF1CE
_021EEF4A:
	mov r0, #6
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _021EF1D8 ; =0x00020100
	ldr r1, _021EF1DC ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0xe
	mov r3, #0x70
	bl ov18_021F9648
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r2, _021EF1E0 ; =0x0000102C
	mov r0, #0x66
	lsl r0, r0, #4
	ldrh r2, [r4, r2]
	ldr r0, [r4, r0]
	mov r1, #0
	mov r3, #3
	bl BufferIntegerAsString
	mov r0, #0x70
	str r0, [sp]
	mov r0, #0x16
	str r0, [sp, #4]
	mov r2, #0
	ldr r0, _021EF1D8 ; =0x00020100
	str r2, [sp, #8]
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	ldr r1, _021EF1DC ; =0x0000065C
	add r0, r4, #0
	ldr r1, [r4, r1]
	mov r3, #0xf
	bl ov18_021EE3AC
	b _021EF1CE
_021EEFA4:
	mov r0, #6
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _021EF1D8 ; =0x00020100
	ldr r1, _021EF1DC ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0xc
	mov r3, #0x70
	bl ov18_021F9648
	mov r0, #0x16
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _021EF1D8 ; =0x00020100
	ldr r1, _021EF1DC ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0x10
	mov r3, #0x70
	bl ov18_021F9648
	b _021EF1CE
_021EEFE2:
	mov r0, #6
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _021EF1D8 ; =0x00020100
	ldr r1, _021EF1DC ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0xc
	mov r3, #0x70
	bl ov18_021F9648
	mov r0, #0x16
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _021EF1D8 ; =0x00020100
	ldr r1, _021EF1DC ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0x11
	mov r3, #0x70
	bl ov18_021F9648
	b _021EF1CE
_021EF020:
	mov r0, #6
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _021EF1D8 ; =0x00020100
	ldr r1, _021EF1DC ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0xc
	mov r3, #0x70
	bl ov18_021F9648
	mov r0, #0x16
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _021EF1D8 ; =0x00020100
	ldr r1, _021EF1DC ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0x12
	mov r3, #0x70
	bl ov18_021F9648
	b _021EF1CE
_021EF05E:
	mov r0, #6
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _021EF1D8 ; =0x00020100
	ldr r1, _021EF1DC ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0xc
	mov r3, #0x70
	bl ov18_021F9648
	mov r0, #0x16
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _021EF1D8 ; =0x00020100
	ldr r1, _021EF1DC ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0x14
	mov r3, #0x70
	bl ov18_021F9648
	b _021EF1CE
_021EF09C:
	mov r0, #6
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _021EF1D8 ; =0x00020100
	ldr r1, _021EF1DC ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0xc
	mov r3, #0x70
	bl ov18_021F9648
	mov r0, #0x16
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _021EF1D8 ; =0x00020100
	ldr r1, _021EF1DC ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0x13
	mov r3, #0x70
	bl ov18_021F9648
	b _021EF1CE
_021EF0DA:
	mov r0, #6
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _021EF1D8 ; =0x00020100
	ldr r1, _021EF1DC ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0xc
	mov r3, #0x70
	bl ov18_021F9648
	mov r2, #0x16
	str r2, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _021EF1D8 ; =0x00020100
	ldr r1, _021EF1DC ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r1, [r4, r1]
	add r0, r5, #0
	mov r3, #0x70
	bl ov18_021F9648
	b _021EF1CE
_021EF116:
	mov r0, #6
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _021EF1D8 ; =0x00020100
	ldr r1, _021EF1DC ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0xc
	mov r3, #0x70
	bl ov18_021F9648
	mov r0, #0x16
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _021EF1D8 ; =0x00020100
	ldr r1, _021EF1DC ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0x15
	mov r3, #0x70
	bl ov18_021F9648
	b _021EF1CE
_021EF154:
	mov r0, #6
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _021EF1D8 ; =0x00020100
	ldr r1, _021EF1DC ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0xc
	mov r3, #0x70
	bl ov18_021F9648
	mov r0, #0x16
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _021EF1D8 ; =0x00020100
	ldr r1, _021EF1DC ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0x19
	mov r3, #0x70
	bl ov18_021F9648
	b _021EF1CE
_021EF192:
	mov r0, #6
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _021EF1D8 ; =0x00020100
	ldr r1, _021EF1DC ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0x17
	mov r3, #0x70
	bl ov18_021F9648
	mov r0, #0x16
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _021EF1D8 ; =0x00020100
	ldr r1, _021EF1DC ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0x18
	mov r3, #0x70
	bl ov18_021F9648
_021EF1CE:
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021EF1D8: .word 0x00020100
_021EF1DC: .word 0x0000065C
_021EF1E0: .word 0x0000102C
	thumb_func_end ov18_021EEED0

	thumb_func_start ov18_021EF1E4
ov18_021EF1E4: ; 0x021EF1E4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r0, #0
	add r5, r6, #0
	lsl r4, r1, #4
	add r5, #0xc
	add r0, r5, r4
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021EF218 ; =0x00020100
	ldr r1, _021EF21C ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r1, [r6, r1]
	add r0, r5, r4
	mov r2, #0x1a
	mov r3, #0x24
	bl ov18_021F9648
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021EF218: .word 0x00020100
_021EF21C: .word 0x0000065C
	thumb_func_end ov18_021EF1E4

	thumb_func_start ov18_021EF220
ov18_021EF220: ; 0x021EF220
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r0, #0
	add r5, r6, #0
	lsl r4, r1, #4
	add r5, #0xc
	add r0, r5, r4
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021EF254 ; =0x00020100
	ldr r1, _021EF258 ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r1, [r6, r1]
	add r0, r5, r4
	mov r2, #0x1b
	mov r3, #0x14
	bl ov18_021F9648
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021EF254: .word 0x00020100
_021EF258: .word 0x0000065C
	thumb_func_end ov18_021EF220

	thumb_func_start ov18_021EF25C
ov18_021EF25C: ; 0x021EF25C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r0, #0
	add r5, r6, #0
	lsl r4, r1, #4
	add r5, #0xc
	add r0, r5, r4
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021EF290 ; =0x00020100
	ldr r1, _021EF294 ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r1, [r6, r1]
	add r0, r5, r4
	mov r2, #0x1c
	mov r3, #0x14
	bl ov18_021F9648
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021EF290: .word 0x00020100
_021EF294: .word 0x0000065C
	thumb_func_end ov18_021EF25C

	thumb_func_start ov18_021EF298
ov18_021EF298: ; 0x021EF298
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r0, #0
	add r5, r6, #0
	lsl r4, r1, #4
	add r5, #0xc
	add r0, r5, r4
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021EF2CC ; =0x00020100
	ldr r1, _021EF2D0 ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r1, [r6, r1]
	add r0, r5, r4
	mov r2, #0x1d
	mov r3, #0x14
	bl ov18_021F9648
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021EF2CC: .word 0x00020100
_021EF2D0: .word 0x0000065C
	thumb_func_end ov18_021EF298

	thumb_func_start ov18_021EF2D4
ov18_021EF2D4: ; 0x021EF2D4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r0, #0
	add r5, r6, #0
	lsl r4, r1, #4
	add r5, #0xc
	add r0, r5, r4
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021EF308 ; =0x00020100
	ldr r1, _021EF30C ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r1, [r6, r1]
	add r0, r5, r4
	mov r2, #0x1e
	mov r3, #0x14
	bl ov18_021F9648
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021EF308: .word 0x00020100
_021EF30C: .word 0x0000065C
	thumb_func_end ov18_021EF2D4

	thumb_func_start ov18_021EF310
ov18_021EF310: ; 0x021EF310
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r0, #0
	add r5, r6, #0
	lsl r4, r1, #4
	add r5, #0xc
	add r0, r5, r4
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021EF344 ; =0x00020100
	ldr r1, _021EF348 ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r1, [r6, r1]
	add r0, r5, r4
	mov r2, #0x1f
	mov r3, #0x14
	bl ov18_021F9648
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021EF344: .word 0x00020100
_021EF348: .word 0x0000065C
	thumb_func_end ov18_021EF310

	thumb_func_start ov18_021EF34C
ov18_021EF34C: ; 0x021EF34C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r0, #0
	add r5, r6, #0
	lsl r4, r1, #4
	add r5, #0xc
	add r0, r5, r4
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021EF380 ; =0x00020100
	ldr r1, _021EF384 ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r1, [r6, r1]
	add r0, r5, r4
	mov r2, #0x20
	mov r3, #0x18
	bl ov18_021F9648
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021EF380: .word 0x00020100
_021EF384: .word 0x0000065C
	thumb_func_end ov18_021EF34C

	thumb_func_start ov18_021EF388
ov18_021EF388: ; 0x021EF388
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r4, r0, #0
	str r0, [sp, #0x1c]
	mov r0, #0x25
	lsl r6, r1, #4
	str r0, [sp]
	str r2, [sp, #0x20]
	ldr r1, _021EF450 ; =0x00000854
	ldr r0, [sp, #0x1c]
	mov r2, #1
	ldr r0, [r0, r1]
	mov r1, #4
	add r3, sp, #0x2c
	add r4, #0xc
	bl GfGfxLoader_GetCharDataFromOpenNarc
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x2c]
	mov r5, #0
	ldr r7, [r0, #0x14]
	str r5, [sp, #0x24]
_021EF3B4:
	mov r0, #8
	str r0, [sp]
	str r0, [sp, #4]
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #8
	str r0, [sp, #0x10]
	mov r1, #0x31
	str r0, [sp, #0x14]
	mov r0, #0xff
	lsl r1, r1, #6
	mov r2, #0
	str r0, [sp, #0x18]
	add r0, r4, r6
	add r1, r7, r1
	add r3, r2, #0
	bl BlitBitmapRect
	mov r0, #8
	str r0, [sp]
	str r0, [sp, #4]
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #8
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	mov r1, #0xca
	str r0, [sp, #0x14]
	mov r0, #0xff
	lsl r1, r1, #4
	mov r2, #0
	str r0, [sp, #0x18]
	add r0, r4, r6
	add r1, r7, r1
	add r3, r2, #0
	bl BlitBitmapRect
	ldr r0, [sp, #0x24]
	add r5, #8
	add r0, r0, #1
	str r0, [sp, #0x24]
	cmp r0, #8
	blo _021EF3B4
	ldr r0, [sp, #0x28]
	bl FreeToHeap
	add r0, r4, r6
	bl GetWindowWidth
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _021EF454 ; =0x00020100
	lsl r5, r3, #3
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	lsr r3, r5, #0x1f
	add r3, r5, r3
	ldr r2, _021EF458 ; =0x0000065C
	ldr r1, [sp, #0x1c]
	add r0, r4, r6
	ldr r1, [r1, r2]
	ldr r2, [sp, #0x20]
	asr r3, r3, #1
	bl ov18_021F9648
	add r0, r4, r6
	bl CopyWindowPixelsToVram_TextMode
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021EF450: .word 0x00000854
_021EF454: .word 0x00020100
_021EF458: .word 0x0000065C
	thumb_func_end ov18_021EF388

	thumb_func_start ov18_021EF45C
ov18_021EF45C: ; 0x021EF45C
	push {r3, r4, r5, lr}
	mov r1, #0
	add r5, r0, #0
	bl ov18_021E613C
	mov r0, #0x53
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x57
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x5b
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x5f
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x63
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x67
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x6b
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	mov r1, #0x14
	bl ov18_021EF1E4
	add r0, r5, #0
	mov r1, #0x15
	bl ov18_021EF220
	add r0, r5, #0
	mov r1, #0x16
	bl ov18_021EF25C
	add r0, r5, #0
	mov r1, #0x17
	bl ov18_021EF298
	add r0, r5, #0
	mov r1, #0x18
	bl ov18_021EF2D4
	add r0, r5, #0
	mov r1, #0x19
	bl ov18_021EF310
	add r0, r5, #0
	mov r1, #0x1a
	bl ov18_021EF34C
	add r0, r5, #0
	mov r1, #0x11
	mov r2, #0x23
	bl ov18_021EF388
	add r0, r5, #0
	mov r1, #0x12
	mov r2, #0x24
	bl ov18_021EF388
	add r0, r5, #0
	mov r1, #0x13
	mov r2, #0x25
	bl ov18_021EF388
	mov r0, #0x53
	lsl r0, r0, #2
	mov r4, #0x14
	add r5, r5, r0
_021EF518:
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #0x1a
	bls _021EF518
	pop {r3, r4, r5, pc}
	thumb_func_end ov18_021EF45C

	thumb_func_start ov18_021EF528
ov18_021EF528: ; 0x021EF528
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r1, #0x1b
	bl ov18_021EFBE8
	add r0, r5, #0
	mov r1, #0x1c
	bl ov18_021EFC3C
	ldr r1, _021EF5CC ; =0x00001870
	mov r2, #0x1d
	ldr r1, [r5, r1]
	add r0, r5, #0
	add r3, r2, #0
	bl ov18_021EFC9C
	ldr r1, _021EF5D0 ; =0x00001874
	add r0, r5, #0
	ldr r1, [r5, r1]
	mov r2, #0x1e
	mov r3, #0x1d
	bl ov18_021EFC9C
	ldr r1, _021EF5D4 ; =0x00001850
	add r0, r5, #0
	ldr r2, [r5, r1]
	add r1, #0x28
	ldr r1, [r5, r1]
	lsl r1, r1, #2
	ldrh r1, [r2, r1]
	mov r2, #0x1f
	bl ov18_021EFD00
	ldr r1, _021EF5D4 ; =0x00001850
	add r0, r5, #0
	ldr r2, [r5, r1]
	add r1, #0x2c
	ldr r1, [r5, r1]
	lsl r1, r1, #2
	ldrh r1, [r2, r1]
	mov r2, #0x20
	bl ov18_021EFD00
	ldr r1, _021EF5D4 ; =0x00001850
	add r0, r5, #0
	ldr r2, [r5, r1]
	add r1, #0x30
	ldr r1, [r5, r1]
	lsl r1, r1, #2
	add r1, r2, r1
	ldrh r1, [r1, #2]
	mov r2, #0x21
	bl ov18_021EFDB4
	ldr r1, _021EF5D4 ; =0x00001850
	add r0, r5, #0
	ldr r2, [r5, r1]
	add r1, #0x34
	ldr r1, [r5, r1]
	lsl r1, r1, #2
	add r1, r2, r1
	ldrh r1, [r1, #2]
	mov r2, #0x22
	bl ov18_021EFDB4
	add r0, r5, #0
	mov r1, #0x23
	bl ov18_021EFE70
	mov r0, #0x6f
	lsl r0, r0, #2
	mov r4, #0x1b
	add r5, r5, r0
_021EF5BA:
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #0x23
	bls _021EF5BA
	pop {r3, r4, r5, pc}
	nop
_021EF5CC: .word 0x00001870
_021EF5D0: .word 0x00001874
_021EF5D4: .word 0x00001850
	thumb_func_end ov18_021EF528

	thumb_func_start ov18_021EF5D8
ov18_021EF5D8: ; 0x021EF5D8
	push {r3, r4, r5, lr}
	sub sp, #0x10
	mov r1, #0
	add r5, r0, #0
	bl ov18_021E613C
	mov r0, #0x93
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x9b
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x9f
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0xa3
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0xa7
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0xab
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0xaf
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021EF75C ; =0x00020100
	ldr r1, _021EF760 ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0x93
	lsl r0, r0, #2
	ldr r1, [r5, r1]
	add r0, r5, r0
	mov r2, #0x1a
	mov r3, #0x2c
	bl ov18_021F9648
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _021EF75C ; =0x00020100
	ldr r1, _021EF760 ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0x9b
	lsl r0, r0, #2
	ldr r1, [r5, r1]
	add r0, r5, r0
	mov r2, #0x29
	mov r3, #0x2c
	bl ov18_021F9648
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _021EF75C ; =0x00020100
	ldr r1, _021EF760 ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0x9f
	lsl r0, r0, #2
	ldr r1, [r5, r1]
	add r0, r5, r0
	mov r2, #0x2a
	mov r3, #0x2c
	bl ov18_021F9648
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _021EF75C ; =0x00020100
	ldr r1, _021EF760 ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0xa3
	lsl r0, r0, #2
	ldr r1, [r5, r1]
	add r0, r5, r0
	mov r2, #0x2b
	mov r3, #0x2c
	bl ov18_021F9648
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _021EF75C ; =0x00020100
	ldr r1, _021EF760 ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0xa7
	lsl r0, r0, #2
	mov r2, #0x2c
	ldr r1, [r5, r1]
	add r0, r5, r0
	add r3, r2, #0
	bl ov18_021F9648
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _021EF75C ; =0x00020100
	ldr r1, _021EF760 ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0xab
	lsl r0, r0, #2
	ldr r1, [r5, r1]
	add r0, r5, r0
	mov r2, #0x2d
	mov r3, #0x2c
	bl ov18_021F9648
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _021EF75C ; =0x00020100
	ldr r1, _021EF760 ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0xaf
	lsl r0, r0, #2
	ldr r1, [r5, r1]
	add r0, r5, r0
	mov r2, #0x2e
	mov r3, #0x2c
	bl ov18_021F9648
	add r0, r5, #0
	mov r1, #0x11
	mov r2, #0x27
	bl ov18_021EF388
	add r0, r5, #0
	mov r1, #0x13
	mov r2, #0x28
	bl ov18_021EF388
	add r0, r5, #0
	mov r1, #0x25
	bl ov18_021EFBE8
	mov r0, #0x93
	lsl r0, r0, #2
	mov r4, #0x24
	add r5, r5, r0
_021EF748:
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #0x2b
	bls _021EF748
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_021EF75C: .word 0x00020100
_021EF760: .word 0x0000065C
	thumb_func_end ov18_021EF5D8

	thumb_func_start ov18_021EF764
ov18_021EF764: ; 0x021EF764
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	mov r1, #0
	add r5, r0, #0
	bl ov18_021E613C
	ldr r0, _021EF834 ; =0x0000041C
	mov r1, #0
	add r0, r5, r0
	bl FillWindowPixelBuffer
	ldr r0, _021EF838 ; =0x0000043C
	mov r1, #0
	add r0, r5, r0
	bl FillWindowPixelBuffer
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021EF83C ; =0x00020100
	ldr r1, _021EF840 ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r0, _021EF834 ; =0x0000041C
	ldr r1, [r5, r1]
	add r0, r5, r0
	mov r2, #0x1b
	mov r3, #0x18
	bl ov18_021F9648
	mov r4, #0
_021EF7A4:
	add r0, r4, #0
	bl ov18_021E7698
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	cmp r4, #0x1a
	bne _021EF7B6
	mov r6, #0x71
	b _021EF7BA
_021EF7B6:
	add r6, r4, #0
	add r6, #0x45
_021EF7BA:
	add r0, r7, #0
	mov r1, #7
	bl _s32_div_f
	str r1, [sp, #0x10]
	add r0, r7, #0
	mov r1, #7
	bl _s32_div_f
	lsl r0, r0, #5
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _021EF83C ; =0x00020100
	ldr r3, [sp, #0x10]
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r1, _021EF840 ; =0x0000065C
	ldr r0, _021EF838 ; =0x0000043C
	lsl r3, r3, #5
	ldr r1, [r5, r1]
	add r0, r5, r0
	add r2, r6, #0
	add r3, #0x18
	bl ov18_021F9648
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #0x1b
	blo _021EF7A4
	add r0, r5, #0
	mov r1, #0x11
	mov r2, #0x27
	bl ov18_021EF388
	add r0, r5, #0
	mov r1, #0x13
	mov r2, #0x28
	bl ov18_021EF388
	add r0, r5, #0
	mov r1, #0x42
	bl ov18_021EFC3C
	ldr r0, _021EF834 ; =0x0000041C
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	ldr r0, _021EF838 ; =0x0000043C
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	ldr r0, _021EF844 ; =0x0000042C
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_021EF834: .word 0x0000041C
_021EF838: .word 0x0000043C
_021EF83C: .word 0x00020100
_021EF840: .word 0x0000065C
_021EF844: .word 0x0000042C
	thumb_func_end ov18_021EF764

	thumb_func_start ov18_021EF848
ov18_021EF848: ; 0x021EF848
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	mov r1, #0
	add r6, r0, #0
	bl ov18_021E613C
	mov r0, #0xb3
	lsl r0, r0, #2
	add r0, r6, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021EF908 ; =0x00020100
	mov r2, #0x1c
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r1, _021EF90C ; =0x0000065C
	mov r0, #0xb3
	lsl r0, r0, #2
	ldr r1, [r6, r1]
	add r0, r6, r0
	add r3, r2, #0
	bl ov18_021F9648
	mov r0, #0xbf
	lsl r0, r0, #2
	ldr r5, _021EF910 ; =_021F9E1E
	mov r7, #0x2f
	add r4, r6, r0
_021EF88A:
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _021EF908 ; =0x00020100
	add r2, r5, #0
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r1, _021EF90C ; =0x0000065C
	sub r2, #0x5e
	ldrh r2, [r2]
	ldr r1, [r6, r1]
	add r0, r4, #0
	mov r3, #0x20
	bl ov18_021F9648
	add r7, r7, #1
	add r4, #0x10
	add r5, r5, #2
	cmp r7, #0x40
	bls _021EF88A
	add r0, r6, #0
	mov r1, #0x11
	mov r2, #0x27
	bl ov18_021EF388
	add r0, r6, #0
	mov r1, #0x13
	mov r2, #0x28
	bl ov18_021EF388
	ldr r1, _021EF914 ; =0x00001870
	add r0, r6, #0
	ldr r1, [r6, r1]
	mov r2, #0x2d
	mov r3, #0x1d
	bl ov18_021EFC9C
	ldr r1, _021EF918 ; =0x00001874
	add r0, r6, #0
	ldr r1, [r6, r1]
	mov r2, #0x2e
	mov r3, #0x23
	bl ov18_021EFC9C
	mov r0, #0xb3
	lsl r0, r0, #2
	mov r4, #0x2c
	add r5, r6, r0
_021EF8F6:
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #0x40
	bls _021EF8F6
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021EF908: .word 0x00020100
_021EF90C: .word 0x0000065C
_021EF910: .word _021F9E1E
_021EF914: .word 0x00001870
_021EF918: .word 0x00001874
	thumb_func_end ov18_021EF848

	thumb_func_start ov18_021EF91C
ov18_021EF91C: ; 0x021EF91C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	mov r1, #0
	add r5, r0, #0
	bl ov18_021E613C
	ldr r0, _021EF9A4 ; =0x0000044C
	mov r1, #0
	add r0, r5, r0
	bl FillWindowPixelBuffer
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021EF9A8 ; =0x00020100
	ldr r1, _021EF9AC ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r0, _021EF9A4 ; =0x0000044C
	ldr r1, [r5, r1]
	add r0, r5, r0
	mov r2, #0x1d
	mov r3, #0x14
	bl ov18_021F9648
	add r0, r5, #0
	mov r1, #0x11
	mov r2, #0x27
	bl ov18_021EF388
	add r0, r5, #0
	mov r1, #0x13
	mov r2, #0x28
	bl ov18_021EF388
	ldr r1, _021EF9B0 ; =0x00001850
	add r0, r5, #0
	ldr r2, [r5, r1]
	add r1, #0x28
	ldr r1, [r5, r1]
	lsl r1, r1, #2
	ldrh r1, [r2, r1]
	mov r2, #0x45
	bl ov18_021EFD00
	ldr r1, _021EF9B0 ; =0x00001850
	add r0, r5, #0
	ldr r2, [r5, r1]
	add r1, #0x2c
	ldr r1, [r5, r1]
	lsl r1, r1, #2
	ldrh r1, [r2, r1]
	mov r2, #0x46
	bl ov18_021EFD00
	ldr r0, _021EF9A4 ; =0x0000044C
	mov r4, #0x44
	add r5, r5, r0
_021EF992:
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #0x46
	bls _021EF992
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EF9A4: .word 0x0000044C
_021EF9A8: .word 0x00020100
_021EF9AC: .word 0x0000065C
_021EF9B0: .word 0x00001850
	thumb_func_end ov18_021EF91C

	thumb_func_start ov18_021EF9B4
ov18_021EF9B4: ; 0x021EF9B4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	mov r1, #0
	add r5, r0, #0
	bl ov18_021E613C
	ldr r0, _021EFA40 ; =0x0000047C
	mov r1, #0
	add r0, r5, r0
	bl FillWindowPixelBuffer
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021EFA44 ; =0x00020100
	ldr r1, _021EFA48 ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r0, _021EFA40 ; =0x0000047C
	ldr r1, [r5, r1]
	add r0, r5, r0
	mov r2, #0x1e
	mov r3, #0x18
	bl ov18_021F9648
	add r0, r5, #0
	mov r1, #0x11
	mov r2, #0x27
	bl ov18_021EF388
	add r0, r5, #0
	mov r1, #0x13
	mov r2, #0x28
	bl ov18_021EF388
	ldr r1, _021EFA4C ; =0x00001850
	add r0, r5, #0
	ldr r2, [r5, r1]
	add r1, #0x30
	ldr r1, [r5, r1]
	lsl r1, r1, #2
	add r1, r2, r1
	ldrh r1, [r1, #2]
	mov r2, #0x48
	bl ov18_021EFDB4
	ldr r1, _021EFA4C ; =0x00001850
	add r0, r5, #0
	ldr r2, [r5, r1]
	add r1, #0x34
	ldr r1, [r5, r1]
	lsl r1, r1, #2
	add r1, r2, r1
	ldrh r1, [r1, #2]
	mov r2, #0x49
	bl ov18_021EFDB4
	ldr r0, _021EFA40 ; =0x0000047C
	mov r4, #0x47
	add r5, r5, r0
_021EFA2E:
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #0x49
	bls _021EFA2E
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EFA40: .word 0x0000047C
_021EFA44: .word 0x00020100
_021EFA48: .word 0x0000065C
_021EFA4C: .word 0x00001850
	thumb_func_end ov18_021EF9B4

	thumb_func_start ov18_021EFA50
ov18_021EFA50: ; 0x021EFA50
	push {r3, r4, r5, lr}
	sub sp, #0x10
	mov r1, #0
	add r5, r0, #0
	bl ov18_021E613C
	ldr r0, _021EFB68 ; =0x000004AC
	mov r1, #0
	add r0, r5, r0
	bl FillWindowPixelBuffer
	ldr r0, _021EFB6C ; =0x000004CC
	mov r1, #0
	add r0, r5, r0
	bl FillWindowPixelBuffer
	ldr r0, _021EFB70 ; =0x000004DC
	mov r1, #0
	add r0, r5, r0
	bl FillWindowPixelBuffer
	ldr r0, _021EFB74 ; =0x000004EC
	mov r1, #0
	add r0, r5, r0
	bl FillWindowPixelBuffer
	ldr r0, _021EFB78 ; =0x000004FC
	mov r1, #0
	add r0, r5, r0
	bl FillWindowPixelBuffer
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021EFB7C ; =0x00020100
	ldr r1, _021EFB80 ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r0, _021EFB68 ; =0x000004AC
	ldr r1, [r5, r1]
	add r0, r5, r0
	mov r2, #0x1f
	mov r3, #0x18
	bl ov18_021F9648
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _021EFB7C ; =0x00020100
	ldr r1, _021EFB80 ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r0, _021EFB6C ; =0x000004CC
	ldr r1, [r5, r1]
	add r0, r5, r0
	mov r2, #0x41
	mov r3, #0x1c
	bl ov18_021F9648
	ldr r0, _021EFB84 ; =0x00001860
	ldr r0, [r5, r0]
	cmp r0, #1
	bne _021EFAF4
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _021EFB7C ; =0x00020100
	ldr r1, _021EFB80 ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r0, _021EFB70 ; =0x000004DC
	ldr r1, [r5, r1]
	add r0, r5, r0
	mov r2, #0x42
	mov r3, #0x1c
	bl ov18_021F9648
_021EFAF4:
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _021EFB7C ; =0x00020100
	ldr r1, _021EFB80 ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r0, _021EFB74 ; =0x000004EC
	ldr r1, [r5, r1]
	add r0, r5, r0
	mov r2, #0x43
	mov r3, #0x1c
	bl ov18_021F9648
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _021EFB7C ; =0x00020100
	ldr r1, _021EFB80 ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r0, _021EFB78 ; =0x000004FC
	ldr r1, [r5, r1]
	add r0, r5, r0
	mov r2, #0x44
	mov r3, #0x1c
	bl ov18_021F9648
	add r0, r5, #0
	mov r1, #0x11
	mov r2, #0x27
	bl ov18_021EF388
	add r0, r5, #0
	mov r1, #0x13
	mov r2, #0x28
	bl ov18_021EF388
	add r0, r5, #0
	mov r1, #0x4b
	bl ov18_021EFE70
	ldr r0, _021EFB68 ; =0x000004AC
	mov r4, #0x4a
	add r5, r5, r0
_021EFB56:
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #0x4f
	bls _021EFB56
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EFB68: .word 0x000004AC
_021EFB6C: .word 0x000004CC
_021EFB70: .word 0x000004DC
_021EFB74: .word 0x000004EC
_021EFB78: .word 0x000004FC
_021EFB7C: .word 0x00020100
_021EFB80: .word 0x0000065C
_021EFB84: .word 0x00001860
	thumb_func_end ov18_021EFA50

	thumb_func_start ov18_021EFB88
ov18_021EFB88: ; 0x021EFB88
	push {r4, lr}
	sub sp, #0x10
	mov r1, #0
	add r4, r0, #0
	bl ov18_021E613C
	ldr r0, _021EFBDC ; =0x0000050C
	mov r1, #0
	add r0, r4, r0
	bl FillWindowPixelBuffer
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021EFBE0 ; =0x00020100
	ldr r1, _021EFBE4 ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r0, _021EFBDC ; =0x0000050C
	ldr r1, [r4, r1]
	add r0, r4, r0
	mov r2, #0x20
	mov r3, #0x18
	bl ov18_021F9648
	add r0, r4, #0
	mov r1, #0x11
	mov r2, #0x27
	bl ov18_021EF388
	add r0, r4, #0
	mov r1, #0x13
	mov r2, #0x28
	bl ov18_021EF388
	ldr r0, _021EFBDC ; =0x0000050C
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_021EFBDC: .word 0x0000050C
_021EFBE0: .word 0x00020100
_021EFBE4: .word 0x0000065C
	thumb_func_end ov18_021EFB88

	thumb_func_start ov18_021EFBE8
ov18_021EFBE8: ; 0x021EFBE8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r0, #0
	add r5, r6, #0
	lsl r4, r1, #4
	add r5, #0xc
	add r0, r5, r4
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, r4
	bl GetWindowWidth
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _021EFC30 ; =0x00020100
	ldr r2, _021EFC34 ; =0x00001868
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r5, r4
	ldr r1, _021EFC38 ; =0x0000065C
	lsl r4, r3, #3
	ldr r2, [r6, r2]
	lsr r3, r4, #0x1f
	add r3, r4, r3
	ldr r1, [r6, r1]
	add r2, #0x29
	asr r3, r3, #1
	bl ov18_021F9648
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021EFC30: .word 0x00020100
_021EFC34: .word 0x00001868
_021EFC38: .word 0x0000065C
	thumb_func_end ov18_021EFBE8

	thumb_func_start ov18_021EFC3C
ov18_021EFC3C: ; 0x021EFC3C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r7, r5, #0
	lsl r6, r1, #4
	add r7, #0xc
	add r0, r7, r6
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _021EFC90 ; =0x0000186C
	ldr r4, [r5, r0]
	cmp r4, #0x1a
	bne _021EFC5C
	mov r4, #0x71
	b _021EFC5E
_021EFC5C:
	add r4, #0x45
_021EFC5E:
	add r0, r7, r6
	bl GetWindowWidth
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _021EFC94 ; =0x00020100
	add r2, r4, #0
	str r0, [sp, #8]
	mov r0, #2
	lsl r4, r3, #3
	str r0, [sp, #0xc]
	ldr r1, _021EFC98 ; =0x0000065C
	lsr r3, r4, #0x1f
	add r3, r4, r3
	ldr r1, [r5, r1]
	add r0, r7, r6
	asr r3, r3, #1
	bl ov18_021F9648
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EFC90: .word 0x0000186C
_021EFC94: .word 0x00020100
_021EFC98: .word 0x0000065C
	thumb_func_end ov18_021EFC3C

	thumb_func_start ov18_021EFC9C
ov18_021EFC9C: ; 0x021EFC9C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r0, #0
	add r5, r7, #0
	add r5, #0xc
	lsl r4, r2, #4
	str r1, [sp, #0x10]
	add r0, r5, r4
	mov r1, #0
	add r6, r3, #0
	bl FillWindowPixelBuffer
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	bne _021EFCCA
	add r0, r5, r4
	bl GetWindowWidth
	lsl r1, r0, #3
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r6, r0, #1
_021EFCCA:
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	ldr r2, [sp, #0x10]
	str r0, [sp, #4]
	ldr r0, _021EFCF4 ; =0x00020100
	lsl r3, r2, #1
	ldr r2, _021EFCF8 ; =_021F9DC0
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r1, _021EFCFC ; =0x0000065C
	ldrh r2, [r2, r3]
	ldr r1, [r7, r1]
	add r0, r5, r4
	add r3, r6, #0
	bl ov18_021F9648
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_021EFCF4: .word 0x00020100
_021EFCF8: .word _021F9DC0
_021EFCFC: .word 0x0000065C
	thumb_func_end ov18_021EFC9C

	thumb_func_start ov18_021EFD00
ov18_021EFD00: ; 0x021EFD00
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	ldr r4, _021EFDA4 ; =0x000003E7
	add r5, r0, #0
	add r6, r2, #0
	cmp r1, r4
	bne _021EFD12
	add r4, #0xbd
	b _021EFD26
_021EFD12:
	ldr r0, _021EFDA8 ; =0x00002710
	mul r0, r1
	mov r1, #0xfe
	bl _u32_div_f
	add r0, r0, #5
	mov r1, #0xa
	bl _u32_div_f
	add r4, r0, #0
_021EFD26:
	add r7, r5, #0
	lsl r0, r6, #4
	add r7, #0xc
	str r0, [sp, #0x14]
	add r0, r7, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	mov r1, #0xc
	bl _u32_div_f
	mov r1, #0
	add r2, r0, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x66
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r3, #3
	bl BufferIntegerAsString
	add r0, r4, #0
	mov r1, #0xc
	bl _u32_div_f
	mov r3, #2
	add r2, r1, #0
	mov r0, #0x66
	str r3, [sp]
	mov r1, #1
	str r1, [sp, #4]
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl BufferIntegerAsString
	ldr r0, [sp, #0x14]
	add r0, r7, r0
	bl GetWindowWidth
	lsl r1, r0, #3
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	ldr r0, _021EFDAC ; =0x00020100
	ldr r1, _021EFDB0 ; =0x0000065C
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	ldr r1, [r5, r1]
	add r0, r5, #0
	add r2, r6, #0
	mov r3, #0xaf
	bl ov18_021EE3AC
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021EFDA4: .word 0x000003E7
_021EFDA8: .word 0x00002710
_021EFDAC: .word 0x00020100
_021EFDB0: .word 0x0000065C
	thumb_func_end ov18_021EFD00

	thumb_func_start ov18_021EFDB4
ov18_021EFDB4: ; 0x021EFDB4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldr r0, _021EFE58 ; =0x0000270F
	add r4, r2, #0
	cmp r1, r0
	bne _021EFDC6
	ldr r6, _021EFE5C ; =0x00018696
	b _021EFDD6
_021EFDC6:
	ldr r0, _021EFE60 ; =0x00035D2E
	mul r0, r1
	ldr r1, _021EFE64 ; =0x0000C350
	add r0, r0, r1
	lsl r1, r1, #1
	bl _u32_div_f
	add r6, r0, #0
_021EFDD6:
	add r7, r5, #0
	lsl r0, r4, #4
	add r7, #0xc
	str r0, [sp, #0x14]
	add r0, r7, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r6, #0
	mov r1, #0xa
	bl _u32_div_f
	mov r1, #0
	add r2, r0, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x66
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r3, #4
	bl BufferIntegerAsString
	add r0, r6, #0
	mov r1, #0xa
	bl _u32_div_f
	mov r0, #2
	add r2, r1, #0
	str r0, [sp]
	mov r1, #1
	mov r0, #0x66
	str r1, [sp, #4]
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r3, r1, #0
	bl BufferIntegerAsString
	ldr r0, [sp, #0x14]
	add r0, r7, r0
	bl GetWindowWidth
	lsl r1, r0, #3
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	ldr r0, _021EFE68 ; =0x00020100
	ldr r1, _021EFE6C ; =0x0000065C
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	ldr r1, [r5, r1]
	add r0, r5, #0
	add r2, r4, #0
	mov r3, #0x26
	bl ov18_021EE3AC
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EFE58: .word 0x0000270F
_021EFE5C: .word 0x00018696
_021EFE60: .word 0x00035D2E
_021EFE64: .word 0x0000C350
_021EFE68: .word 0x00020100
_021EFE6C: .word 0x0000065C
	thumb_func_end ov18_021EFDB4

	thumb_func_start ov18_021EFE70
ov18_021EFE70: ; 0x021EFE70
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r0, #0
	add r5, r6, #0
	lsl r4, r1, #4
	add r5, #0xc
	add r0, r5, r4
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, r4
	bl GetWindowWidth
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _021EFEB8 ; =0x00020100
	ldr r2, _021EFEBC ; =0x00001888
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r5, r4
	ldr r1, _021EFEC0 ; =0x0000065C
	lsl r4, r3, #3
	ldr r2, [r6, r2]
	lsr r3, r4, #0x1f
	add r3, r4, r3
	ldr r1, [r6, r1]
	add r2, #0x41
	asr r3, r3, #1
	bl ov18_021F9648
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021EFEB8: .word 0x00020100
_021EFEBC: .word 0x00001888
_021EFEC0: .word 0x0000065C
	thumb_func_end ov18_021EFE70

	thumb_func_start ov18_021EFEC4
ov18_021EFEC4: ; 0x021EFEC4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r0, #0x1c
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x2c
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x3c
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x4c
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x5c
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x6c
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x7c
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	mov r1, #1
	bl ov18_021EF1E4
	add r0, r4, #0
	mov r1, #2
	bl ov18_021EF220
	add r0, r4, #0
	mov r1, #3
	bl ov18_021EF25C
	add r0, r4, #0
	mov r1, #4
	bl ov18_021EF298
	add r0, r4, #0
	mov r1, #5
	bl ov18_021EF2D4
	add r0, r4, #0
	mov r1, #6
	bl ov18_021EF310
	add r0, r4, #0
	mov r1, #7
	bl ov18_021EF34C
	add r0, r4, #0
	mov r1, #8
	bl ov18_021EFBE8
	add r0, r4, #0
	mov r1, #9
	bl ov18_021EFC3C
	ldr r1, _021EFFE0 ; =0x00001870
	add r0, r4, #0
	ldr r1, [r4, r1]
	mov r2, #0xa
	mov r3, #0x1d
	bl ov18_021EFC9C
	ldr r1, _021EFFE4 ; =0x00001874
	add r0, r4, #0
	ldr r1, [r4, r1]
	mov r2, #0xb
	mov r3, #0x1d
	bl ov18_021EFC9C
	ldr r1, _021EFFE8 ; =0x00001850
	add r0, r4, #0
	ldr r2, [r4, r1]
	add r1, #0x28
	ldr r1, [r4, r1]
	lsl r1, r1, #2
	ldrh r1, [r2, r1]
	mov r2, #0xc
	bl ov18_021EFD00
	ldr r1, _021EFFE8 ; =0x00001850
	add r0, r4, #0
	ldr r2, [r4, r1]
	add r1, #0x2c
	ldr r1, [r4, r1]
	lsl r1, r1, #2
	ldrh r1, [r2, r1]
	mov r2, #0xd
	bl ov18_021EFD00
	ldr r1, _021EFFE8 ; =0x00001850
	add r0, r4, #0
	ldr r2, [r4, r1]
	add r1, #0x30
	ldr r1, [r4, r1]
	lsl r1, r1, #2
	add r1, r2, r1
	ldrh r1, [r1, #2]
	mov r2, #0xe
	bl ov18_021EFDB4
	ldr r1, _021EFFE8 ; =0x00001850
	add r0, r4, #0
	ldr r2, [r4, r1]
	add r1, #0x34
	ldr r1, [r4, r1]
	lsl r1, r1, #2
	add r1, r2, r1
	ldrh r1, [r1, #2]
	mov r2, #0xf
	bl ov18_021EFDB4
	add r0, r4, #0
	mov r1, #0x10
	bl ov18_021EFE70
	mov r5, #1
	add r4, #0x1c
_021EFFD0:
	add r0, r4, #0
	bl CopyWindowPixelsToVram_TextMode
	add r5, r5, #1
	add r4, #0x10
	cmp r5, #0x10
	bls _021EFFD0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EFFE0: .word 0x00001870
_021EFFE4: .word 0x00001874
_021EFFE8: .word 0x00001850
	thumb_func_end ov18_021EFEC4

	thumb_func_start ov18_021EFFEC
ov18_021EFFEC: ; 0x021EFFEC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #8]
	mov r1, #0xf
	bl sub_02019B08
	add r0, r4, #0
	mov r1, #0x5f
	mov r2, #0
	bl ov18_021EE44C
	add r0, r4, #0
	mov r1, #0x60
	mov r2, #1
	bl ov18_021EE44C
	ldr r1, _021F0060 ; =0x0000185D
	ldr r2, _021F0064 ; =0x0000102C
	ldrb r1, [r4, r1]
	ldrh r2, [r4, r2]
	add r0, r4, #0
	add r1, #0x61
	bl ov18_021EE520
	ldr r1, _021F0060 ; =0x0000185D
	ldr r2, _021F0068 ; =0x0000102E
	ldrb r1, [r4, r1]
	ldrh r2, [r4, r2]
	add r0, r4, #0
	add r1, #0x63
	bl ov18_021EE520
	add r0, r4, #0
	mov r1, #0x5f
	bl ov18_021F006C
	add r0, r4, #0
	mov r1, #0x60
	bl ov18_021F006C
	ldr r1, _021F0060 ; =0x0000185D
	add r0, r4, #0
	ldrb r1, [r4, r1]
	add r1, #0x61
	bl ov18_021F006C
	ldr r1, _021F0060 ; =0x0000185D
	add r0, r4, #0
	ldrb r1, [r4, r1]
	add r1, #0x63
	bl ov18_021F006C
	ldr r1, _021F0060 ; =0x0000185D
	mov r0, #1
	ldrb r2, [r4, r1]
	eor r0, r2
	strb r0, [r4, r1]
	pop {r4, pc}
	.balign 4, 0
_021F0060: .word 0x0000185D
_021F0064: .word 0x0000102C
_021F0068: .word 0x0000102E
	thumb_func_end ov18_021EFFEC

	thumb_func_start ov18_021F006C
ov18_021F006C: ; 0x021F006C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp]
	add r4, r1, #0
	ldr r0, [r0, #8]
	mov r1, #0xf
	bl sub_02019B08
	str r0, [sp, #0xc]
	ldr r0, [sp]
	add r0, #0xc
	str r0, [sp]
	lsl r0, r4, #4
	ldr r1, [sp]
	str r0, [sp, #0x10]
	add r0, r1, r0
	bl GetWindowBaseTile
	add r5, r0, #0
	ldr r1, [sp]
	ldr r0, [sp, #0x10]
	add r0, r1, r0
	bl GetWindowX
	add r6, r0, #0
	ldr r1, [sp]
	ldr r0, [sp, #0x10]
	add r0, r1, r0
	bl GetWindowY
	add r7, r0, #0
	ldr r1, [sp]
	ldr r0, [sp, #0x10]
	add r0, r1, r0
	bl GetWindowWidth
	add r4, r0, #0
	ldr r1, [sp]
	ldr r0, [sp, #0x10]
	add r0, r1, r0
	bl GetWindowHeight
	str r0, [sp, #4]
	mov r0, #0
	mov ip, r0
	ldr r0, [sp, #4]
	cmp r0, #0
	bls _021F010A
	ldr r0, [sp, #0xc]
	lsl r2, r6, #1
	add r0, r0, r2
	mov r6, #0xf
	mov r1, ip
	str r0, [sp, #8]
	lsl r6, r6, #0xc
_021F00DA:
	mov r0, #0
	cmp r4, #0
	bls _021F00FA
	ldr r2, [sp, #8]
	lsl r3, r7, #6
	add r2, r2, r3
_021F00E6:
	ldrh r3, [r2]
	and r3, r6
	add r3, r5, r3
	add r3, r1, r3
	add r3, r0, r3
	strh r3, [r2]
	add r0, r0, #1
	add r2, r2, #2
	cmp r0, r4
	blo _021F00E6
_021F00FA:
	mov r0, ip
	add r2, r0, #1
	ldr r0, [sp, #4]
	add r7, r7, #1
	add r1, r1, r4
	mov ip, r2
	cmp r2, r0
	blo _021F00DA
_021F010A:
	ldr r1, [sp]
	ldr r0, [sp, #0x10]
	add r0, r1, r0
	bl CopyWindowPixelsToVram_TextMode
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov18_021F006C

	thumb_func_start ov18_021F0118
ov18_021F0118: ; 0x021F0118
	push {r3, r4, r5, lr}
	cmp r1, #1
	bne _021F0134
	add r5, r0, #0
	mov r4, #0
	add r5, #0xc
_021F0124:
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #0x10
	bls _021F0124
	pop {r3, r4, r5, pc}
_021F0134:
	add r4, r0, #0
	mov r5, #0
	add r4, #0xc
_021F013A:
	add r0, r4, #0
	bl ClearWindowTilemapAndScheduleTransfer
	add r5, r5, #1
	add r4, #0x10
	cmp r5, #0x10
	bls _021F013A
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov18_021F0118

	thumb_func_start ov18_021F014C
ov18_021F014C: ; 0x021F014C
	push {r3, r4, r5, lr}
	ldr r1, _021F0164 ; =0x0000051C
	mov r4, #0x51
	add r5, r0, r1
_021F0154:
	add r0, r5, #0
	bl ClearWindowTilemapAndScheduleTransfer
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #0x5d
	bls _021F0154
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021F0164: .word 0x0000051C
	thumb_func_end ov18_021F014C

	thumb_func_start ov18_021F0168
ov18_021F0168: ; 0x021F0168
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r4, #0
	mov r6, #2
	mov r7, #0x12
_021F0172:
	str r6, [sp]
	add r1, r4, #0
	ldr r0, [r5, #8]
	add r1, #0x11
	add r2, r6, #0
	add r3, r7, #0
	bl sub_020195F4
	add r4, r4, #1
	cmp r4, #6
	blo _021F0172
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov18_021F0168

	thumb_func_start ov18_021F018C
ov18_021F018C: ; 0x021F018C
	push {r3, r4, r5, r6, r7, lr}
	mov r5, #1
	add r7, r0, #0
	mov r4, #0
	lsl r5, r5, #0xc
_021F0196:
	add r1, r4, #0
	ldr r0, [r7, #8]
	add r1, #0x11
	bl sub_02019B08
	add r2, r0, #0
	ldr r0, _021F01D0 ; =_021F9E4C
	lsl r1, r4, #3
	add r0, r0, r1
	add r0, #0x46
	ldrh r6, [r0]
	mov r3, #0
_021F01AE:
	add r0, r6, r3
	add r1, r0, #0
	orr r1, r5
	lsl r0, r3, #1
	strh r1, [r2, r0]
	add r0, r3, #1
	lsl r0, r0, #0x10
	lsr r3, r0, #0x10
	cmp r3, #0x24
	blo _021F01AE
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #6
	blo _021F0196
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F01D0: .word _021F9E4C
	thumb_func_end ov18_021F018C

	thumb_func_start ov18_021F01D4
ov18_021F01D4: ; 0x021F01D4
	push {r3, r4, r5, r6, r7, lr}
	mov r5, #1
	add r7, r0, #0
	mov r4, #0
	lsl r5, r5, #0xc
_021F01DE:
	add r1, r4, #0
	ldr r0, [r7, #8]
	add r1, #0x11
	bl sub_02019B08
	add r2, r0, #0
	ldr r0, _021F0218 ; =_021F9EBC
	lsl r1, r4, #3
	add r0, r0, r1
	add r0, #0x56
	ldrh r6, [r0]
	mov r3, #0
_021F01F6:
	add r0, r6, r3
	add r1, r0, #0
	orr r1, r5
	lsl r0, r3, #1
	strh r1, [r2, r0]
	add r0, r3, #1
	lsl r0, r0, #0x10
	lsr r3, r0, #0x10
	cmp r3, #0x24
	blo _021F01F6
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #6
	blo _021F01DE
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F0218: .word _021F9EBC
	thumb_func_end ov18_021F01D4

	thumb_func_start ov18_021F021C
ov18_021F021C: ; 0x021F021C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	ldr r1, _021F03A4 ; =_021F9E4C
	add r5, r0, #0
	mov r2, #0xe
	bl ov18_021EE35C
	add r0, r5, #0
	add r0, #0xc
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r0, #0x2c
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r0, #0x4c
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r3, #0
	str r3, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _021F03A8 ; =0x00020100
	ldr r1, _021F03AC ; =0x0000065C
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	add r0, r5, #0
	ldr r1, [r5, r1]
	add r0, #0xc
	mov r2, #0x8e
	bl ov18_021F9648
	ldr r0, _021F03B0 ; =0x000018A2
	mov r1, #2
	ldrh r0, [r5, r0]
	mov r2, #0x25
	bl ov18_021E590C
	add r4, r0, #0
	mov r3, #0
	ldr r0, _021F03A8 ; =0x00020100
	str r3, [sp]
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x2c
	add r1, r4, #0
	mov r2, #0x24
	bl ov18_021F95FC
	add r0, r4, #0
	bl String_dtor
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021F03B4 ; =0x00050900
	ldr r1, _021F03AC ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r5, #0
	ldr r1, [r5, r1]
	add r0, #0x4c
	mov r2, #0x84
	mov r3, #0x18
	bl ov18_021F9648
	add r0, r5, #0
	add r0, #0xc
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	add r0, #0x2c
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	add r0, #0x4c
	bl ScheduleWindowCopyToVram
	ldr r0, _021F03B8 ; =0x00001860
	ldr r0, [r5, r0]
	cmp r0, #1
	bne _021F0334
	add r0, r5, #0
	add r0, #0x5c
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r0, #0x7c
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _021F03BC ; =0x000F0C00
	ldr r1, _021F03AC ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r5, #0
	ldr r1, [r5, r1]
	add r0, #0x5c
	mov r2, #0x41
	mov r3, #0x1c
	bl ov18_021F9648
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _021F03BC ; =0x000F0C00
	ldr r1, _021F03AC ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r5, #0
	ldr r1, [r5, r1]
	add r0, #0x7c
	mov r2, #0x42
	mov r3, #0x1c
	bl ov18_021F9648
	add r0, r5, #0
	add r0, #0x5c
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	add r0, #0x7c
	bl ScheduleWindowCopyToVram
	b _021F0364
_021F0334:
	add r0, r5, #0
	add r0, #0x6c
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021F03B4 ; =0x00050900
	ldr r1, _021F03AC ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r5, #0
	ldr r1, [r5, r1]
	add r0, #0x6c
	mov r2, #0x41
	mov r3, #0x1c
	bl ov18_021F9648
	add r0, r5, #0
	add r0, #0x6c
	bl ScheduleWindowCopyToVram
_021F0364:
	add r0, r5, #0
	add r0, #0x3c
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021F03A8 ; =0x00020100
	ldr r1, _021F03AC ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r5, #0
	ldr r1, [r5, r1]
	add r0, #0x3c
	mov r2, #0x80
	mov r3, #0x38
	bl ov18_021F9648
	add r0, r5, #0
	add r0, #0x3c
	bl CopyWindowPixelsToVram_TextMode
	add r0, r5, #0
	bl ov18_021F03E0
	add r0, r5, #0
	bl ov18_021F0428
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021F03A4: .word _021F9E4C
_021F03A8: .word 0x00020100
_021F03AC: .word 0x0000065C
_021F03B0: .word 0x000018A2
_021F03B4: .word 0x00050900
_021F03B8: .word 0x00001860
_021F03BC: .word 0x000F0C00
	thumb_func_end ov18_021F021C

	thumb_func_start ov18_021F03C0
ov18_021F03C0: ; 0x021F03C0
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r6, #0
	mov r4, #0
	add r5, #0xc
_021F03CA:
	add r0, r5, #0
	bl ClearWindowTilemapAndScheduleTransfer
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #0xe
	blo _021F03CA
	add r0, r6, #0
	bl ov18_021EE388
	pop {r4, r5, r6, pc}
	thumb_func_end ov18_021F03C0

	thumb_func_start ov18_021F03E0
ov18_021F03E0: ; 0x021F03E0
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r0, #0x1c
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021F041C ; =0x00020100
	ldr r2, _021F0420 ; =0x000018C9
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r1, _021F0424 ; =0x0000065C
	ldrsb r2, [r4, r2]
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0x1c
	add r2, #0x81
	mov r3, #0x1c
	bl ov18_021F9648
	add r4, #0x1c
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_021F041C: .word 0x00020100
_021F0420: .word 0x000018C9
_021F0424: .word 0x0000065C
	thumb_func_end ov18_021F03E0

	thumb_func_start ov18_021F0428
ov18_021F0428: ; 0x021F0428
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	add r6, r5, #0
	mov r4, #0
	add r6, #0xc
_021F0434:
	add r0, r4, #0
	add r0, #8
	lsl r7, r0, #4
	add r0, r6, r7
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _021F04B4 ; =0x000018CA
	ldrsb r0, [r5, r0]
	add r0, r0, r4
	sub r1, r0, #2
	bmi _021F0480
	mov r0, #0x19
	lsl r0, r0, #8
	ldr r0, [r5, r0]
	cmp r1, r0
	bge _021F0480
	add r0, r5, #0
	bl ov18_021F04C0
	add r3, r0, #0
	mov r0, #0x48
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	ldr r0, _021F04B8 ; =0x000F0C00
	add r2, r4, #0
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	ldr r1, _021F04BC ; =0x0000065C
	add r0, r5, #0
	ldr r1, [r5, r1]
	add r2, #8
	bl ov18_021EE3AC
_021F0480:
	add r0, r6, r7
	bl CopyWindowPixelsToVram_TextMode
	add r0, r6, r7
	bl GetWindowX
	str r0, [sp, #0x14]
	add r0, r6, r7
	bl GetWindowY
	add r3, r0, #0
	ldr r2, [sp, #0x14]
	add r1, r4, #0
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	ldr r0, [r5, #8]
	add r1, #0x11
	asr r2, r2, #0x18
	asr r3, r3, #0x18
	bl sub_020196E8
	add r4, r4, #1
	cmp r4, #6
	blo _021F0434
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F04B4: .word 0x000018CA
_021F04B8: .word 0x000F0C00
_021F04BC: .word 0x0000065C
	thumb_func_end ov18_021F0428

	thumb_func_start ov18_021F04C0
ov18_021F04C0: ; 0x021F04C0
	push {r3, r4, r5, lr}
	ldr r2, _021F0500 ; =0x000018FC
	add r4, r0, #0
	ldr r5, [r4, r2]
	lsl r3, r1, #2
	ldr r5, [r5, r3]
	mov r3, #1
	mvn r3, r3
	cmp r5, r3
	bne _021F04E4
	sub r2, #0x34
	ldrsb r0, [r4, r2]
	cmp r0, #0
	bne _021F04E0
	mov r0, #0x86
	pop {r3, r4, r5, pc}
_021F04E0:
	mov r0, #0x87
	pop {r3, r4, r5, pc}
_021F04E4:
	bl ov18_021E8AE0
	bl MapHeader_GetMapSec
	add r2, r0, #0
	mov r0, #0x66
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl BufferLandmarkName
	mov r0, #0x85
	pop {r3, r4, r5, pc}
	nop
_021F0500: .word 0x000018FC
	thumb_func_end ov18_021F04C0

	thumb_func_start ov18_021F0504
ov18_021F0504: ; 0x021F0504
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	mov r4, #0
	add r5, r0, #0
	str r1, [sp, #0x14]
	add r6, sp, #0x18
	add r7, r4, #0
_021F0512:
	add r1, r4, #0
	add r2, sp, #0x18
	ldr r0, [r5, #8]
	add r1, #0x11
	add r2, #1
	add r3, sp, #0x18
	bl sub_02019B1C
	ldrsb r0, [r6, r7]
	cmp r0, #2
	beq _021F0532
	cmp r0, #0x14
	beq _021F0532
	add r4, r4, #1
	cmp r4, #6
	blo _021F0512
_021F0532:
	add r0, r4, #0
	add r6, r5, #0
	add r0, #8
	add r6, #0xc
	lsl r7, r0, #4
	add r0, r6, r7
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x14]
	cmp r0, #0
	ldr r0, [r5, #8]
	bge _021F0592
	add r1, r4, #0
	add r1, #0x11
	mov r2, #0xa
	mov r3, #0x14
	bl sub_020196E8
	ldr r0, _021F05DC ; =0x000018CA
	ldrsb r1, [r5, r0]
	add r0, #0x36
	ldr r0, [r5, r0]
	add r1, r1, #2
	cmp r1, r0
	bge _021F05D0
	add r0, r5, #0
	bl ov18_021F04C0
	add r3, r0, #0
	mov r0, #0x48
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	ldr r0, _021F05E0 ; =0x000F0C00
	add r4, #8
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	ldr r1, _021F05E4 ; =0x0000065C
	add r0, r5, #0
	ldr r1, [r5, r1]
	add r2, r4, #0
	bl ov18_021EE3AC
	b _021F05D0
_021F0592:
	add r1, r4, #0
	add r1, #0x11
	mov r2, #0xa
	mov r3, #2
	bl sub_020196E8
	ldr r0, _021F05DC ; =0x000018CA
	ldrsb r0, [r5, r0]
	sub r1, r0, #2
	bmi _021F05D0
	add r0, r5, #0
	bl ov18_021F04C0
	add r3, r0, #0
	mov r0, #0x48
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	ldr r0, _021F05E0 ; =0x000F0C00
	add r4, #8
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	ldr r1, _021F05E4 ; =0x0000065C
	add r0, r5, #0
	ldr r1, [r5, r1]
	add r2, r4, #0
	bl ov18_021EE3AC
_021F05D0:
	add r0, r6, r7
	bl CopyWindowPixelsToVram_TextMode
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_021F05DC: .word 0x000018CA
_021F05E0: .word 0x000F0C00
_021F05E4: .word 0x0000065C
	thumb_func_end ov18_021F0504

	thumb_func_start ov18_021F05E8
ov18_021F05E8: ; 0x021F05E8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r1, _021F0820 ; =_021F9DE4
	mov r2, #0xd
	add r5, r0, #0
	bl ov18_021EE35C
	mov r6, #0
	add r4, r5, #0
	add r4, #0xc
	add r7, r6, #0
_021F05FE:
	add r0, r4, #0
	add r1, r7, #0
	bl FillWindowPixelBuffer
	add r6, r6, #1
	add r4, #0x10
	cmp r6, #0xd
	blo _021F05FE
	ldr r1, _021F0824 ; =0x000018A2
	ldr r0, [r5]
	ldrh r1, [r5, r1]
	ldr r0, [r0]
	bl Pokedex_CheckMonCaughtFlag
	cmp r0, #0
	beq _021F0622
	mov r4, #2
	b _021F0624
_021F0622:
	mov r4, #1
_021F0624:
	mov r3, #0
	str r3, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _021F0828 ; =0x00020100
	ldr r1, _021F082C ; =0x0000065C
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	add r0, r5, #0
	ldr r1, [r5, r1]
	add r0, #0xc
	mov r2, #0x8f
	bl ov18_021F9648
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021F0828 ; =0x00020100
	ldr r1, _021F082C ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r5, #0
	ldr r1, [r5, r1]
	add r0, #0x3c
	mov r2, #0x88
	mov r3, #0x30
	bl ov18_021F9648
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021F0828 ; =0x00020100
	ldr r1, _021F082C ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r5, #0
	ldr r1, [r5, r1]
	add r0, #0x4c
	mov r2, #0xa
	mov r3, #0x10
	bl ov18_021F9648
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021F0828 ; =0x00020100
	ldr r1, _021F082C ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r5, #0
	ldr r1, [r5, r1]
	add r0, #0x6c
	mov r2, #0xa
	mov r3, #0x10
	bl ov18_021F9648
	ldr r0, _021F0824 ; =0x000018A2
	mov r1, #2
	ldrh r0, [r5, r0]
	mov r2, #0x25
	bl ov18_021E590C
	add r6, r0, #0
	mov r3, #0
	ldr r0, _021F0828 ; =0x00020100
	str r3, [sp]
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x1c
	add r1, r6, #0
	mov r2, #0x20
	bl ov18_021F95FC
	add r0, r6, #0
	bl String_dtor
	ldr r0, [r5]
	mov r1, #0x25
	ldr r0, [r0, #4]
	bl PlayerProfile_GetPlayerName_NewString
	add r6, r0, #0
	mov r3, #0
	ldr r0, _021F0828 ; =0x00020100
	str r3, [sp]
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x2c
	add r1, r6, #0
	mov r2, #0x20
	bl ov18_021F95FC
	add r0, r6, #0
	bl String_dtor
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _021F0828 ; =0x00020100
	ldr r1, _021F0824 ; =0x000018A2
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldrh r1, [r5, r1]
	add r0, r5, #0
	add r2, r4, #0
	mov r3, #5
	bl ov18_021EEA84
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021F0830 ; =0x00050900
	ldr r1, _021F082C ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r5, #0
	ldr r1, [r5, r1]
	add r0, #0x8c
	mov r2, #0x89
	mov r3, #0x30
	bl ov18_021F9648
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021F0834 ; =0x000F0500
	ldr r1, _021F082C ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r5, #0
	ldr r1, [r5, r1]
	add r0, #0x9c
	mov r2, #0xb
	mov r3, #0x10
	bl ov18_021F9648
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021F0834 ; =0x000F0500
	ldr r1, _021F082C ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r5, #0
	ldr r1, [r5, r1]
	add r0, #0xbc
	mov r2, #0xb
	mov r3, #0x10
	bl ov18_021F9648
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _021F0834 ; =0x000F0500
	ldr r1, _021F0824 ; =0x000018A2
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldrh r1, [r5, r1]
	add r0, r5, #0
	add r2, r4, #0
	mov r3, #0xa
	bl ov18_021EEB34
	ldr r0, [r5]
	ldr r0, [r0, #4]
	bl PlayerProfile_GetTrainerGender
	cmp r0, #0
	ldr r1, _021F082C ; =0x0000065C
	bne _021F07D0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021F0828 ; =0x00020100
	mov r2, #0x8a
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r5, #0
	ldr r1, [r5, r1]
	add r0, #0x7c
	mov r3, #0x20
	bl ov18_021F9648
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021F0834 ; =0x000F0500
	ldr r1, _021F082C ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r5, #0
	ldr r1, [r5, r1]
	add r0, #0xcc
	mov r2, #0x8c
	mov r3, #0x20
	bl ov18_021F9648
	b _021F080A
_021F07D0:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021F0828 ; =0x00020100
	mov r2, #0x8b
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r5, #0
	ldr r1, [r5, r1]
	add r0, #0x7c
	mov r3, #0x20
	bl ov18_021F9648
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021F0834 ; =0x000F0500
	ldr r1, _021F082C ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r5, #0
	ldr r1, [r5, r1]
	add r0, #0xcc
	mov r2, #0x8d
	mov r3, #0x20
	bl ov18_021F9648
_021F080A:
	mov r4, #0
	add r5, #0xc
_021F080E:
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #0xd
	blo _021F080E
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F0820: .word _021F9DE4
_021F0824: .word 0x000018A2
_021F0828: .word 0x00020100
_021F082C: .word 0x0000065C
_021F0830: .word 0x00050900
_021F0834: .word 0x000F0500
	thumb_func_end ov18_021F05E8

	thumb_func_start ov18_021F0838
ov18_021F0838: ; 0x021F0838
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r6, #0
	mov r4, #0
	add r5, #0xc
_021F0842:
	add r0, r5, #0
	bl ClearWindowTilemapAndScheduleTransfer
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #0xd
	blo _021F0842
	add r0, r6, #0
	bl ov18_021EE388
	pop {r4, r5, r6, pc}
	thumb_func_end ov18_021F0838

	thumb_func_start ov18_021F0858
ov18_021F0858: ; 0x021F0858
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r1, _021F08D0 ; =_021F9DB0
	mov r2, #2
	add r5, r0, #0
	bl ov18_021EE35C
	mov r6, #0
	add r4, r5, #0
	add r4, #0xc
	add r7, r6, #0
_021F086E:
	add r0, r4, #0
	add r1, r7, #0
	bl FillWindowPixelBuffer
	add r6, r6, #1
	add r4, #0x10
	cmp r6, #2
	blo _021F086E
	mov r3, #0
	str r3, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _021F08D4 ; =0x00020100
	ldr r1, _021F08D8 ; =0x0000065C
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	add r0, r5, #0
	ldr r1, [r5, r1]
	add r0, #0xc
	mov r2, #0xad
	bl ov18_021F9648
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _021F08DC ; =0x000F0C00
	ldr r1, _021F08D8 ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r5, #0
	ldr r1, [r5, r1]
	add r0, #0x1c
	mov r2, #0xae
	mov r3, #0x3c
	bl ov18_021F9648
	mov r4, #0
	add r5, #0xc
_021F08BE:
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #2
	blo _021F08BE
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F08D0: .word _021F9DB0
_021F08D4: .word 0x00020100
_021F08D8: .word 0x0000065C
_021F08DC: .word 0x000F0C00
	thumb_func_end ov18_021F0858

	thumb_func_start ov18_021F08E0
ov18_021F08E0: ; 0x021F08E0
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r6, #0
	mov r4, #0
	add r5, #0xc
_021F08EA:
	add r0, r5, #0
	bl ClearWindowTilemapAndScheduleTransfer
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #2
	blo _021F08EA
	add r0, r6, #0
	bl ov18_021EE388
	pop {r4, r5, r6, pc}
	thumb_func_end ov18_021F08E0

	thumb_func_start ov18_021F0900
ov18_021F0900: ; 0x021F0900
	push {r4, lr}
	ldr r1, _021F0914 ; =_021F9EBC
	add r4, r0, #0
	mov r2, #0x10
	bl ov18_021EE35C
	add r0, r4, #0
	bl ov18_021F0928
	pop {r4, pc}
	.balign 4, 0
_021F0914: .word _021F9EBC
	thumb_func_end ov18_021F0900

	thumb_func_start ov18_021F0918
ov18_021F0918: ; 0x021F0918
	push {r4, lr}
	add r4, r0, #0
	bl ov18_021F0D7C
	add r0, r4, #0
	bl ov18_021EE388
	pop {r4, pc}
	thumb_func_end ov18_021F0918

	thumb_func_start ov18_021F0928
ov18_021F0928: ; 0x021F0928
	push {r4, lr}
	add r4, r0, #0
	bl ov18_021F0940
	add r0, r4, #0
	bl ov18_021F0C50
	add r0, r4, #0
	bl ov18_021F0D2C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov18_021F0928

	thumb_func_start ov18_021F0940
ov18_021F0940: ; 0x021F0940
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	add r6, r5, #0
	mov r4, #0
	add r6, #0xc
_021F094C:
	add r0, r4, #0
	add r0, #0xa
	lsl r7, r0, #4
	add r0, r6, r7
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _021F09C8 ; =0x000018C5
	ldrsb r0, [r5, r0]
	add r0, r0, r4
	sub r1, r0, #2
	bmi _021F0994
	ldr r0, _021F09CC ; =0x000018C4
	ldrsb r0, [r5, r0]
	cmp r1, r0
	bge _021F0994
	add r0, r5, #0
	bl ov18_021F09D8
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	ldr r0, _021F09D0 ; =0x000F0C00
	add r2, r4, #0
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r1, _021F09D4 ; =0x0000065C
	add r0, r5, #0
	ldr r1, [r5, r1]
	add r2, #0xa
	bl ov18_021EE3AC
_021F0994:
	add r0, r6, r7
	bl CopyWindowPixelsToVram_TextMode
	add r0, r6, r7
	bl GetWindowX
	str r0, [sp, #0x14]
	add r0, r6, r7
	bl GetWindowY
	add r3, r0, #0
	ldr r2, [sp, #0x14]
	add r1, r4, #0
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	ldr r0, [r5, #8]
	add r1, #0x11
	asr r2, r2, #0x18
	asr r3, r3, #0x18
	bl sub_020196E8
	add r4, r4, #1
	cmp r4, #6
	blo _021F094C
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F09C8: .word 0x000018C5
_021F09CC: .word 0x000018C4
_021F09D0: .word 0x000F0C00
_021F09D4: .word 0x0000065C
	thumb_func_end ov18_021F0940

	thumb_func_start ov18_021F09D8
ov18_021F09D8: ; 0x021F09D8
	push {r3, r4, r5, lr}
	sub sp, #8
	ldr r2, _021F0B64 ; =0x000018A2
	add r4, r0, #0
	ldrh r0, [r4, r2]
	ldr r3, _021F0B68 ; =0x0000019D
	cmp r0, r3
	bgt _021F0A1E
	sub r5, r3, #1
	cmp r0, r5
	blt _021F09FA
	add r2, r5, #0
	cmp r0, r2
	beq _021F0A8C
	cmp r0, r3
	beq _021F0A8C
	b _021F0B1E
_021F09FA:
	cmp r0, #0xc9
	bgt _021F0A06
	bge _021F0A76
	cmp r0, #0xac
	beq _021F0AFC
	b _021F0B1E
_021F0A06:
	add r5, r3, #0
	sub r5, #0x3e
	cmp r0, r5
	bgt _021F0A16
	sub r3, #0x3e
	cmp r0, r3
	beq _021F0ADC
	b _021F0B1E
_021F0A16:
	sub r3, #0x1b
	cmp r0, r3
	beq _021F0A9C
	b _021F0B1E
_021F0A1E:
	add r5, r3, #0
	add r5, #0x42
	cmp r0, r5
	bgt _021F0A5E
	add r5, r3, #0
	add r5, #0x42
	cmp r0, r5
	bge _021F0ACC
	add r5, r3, #0
	add r5, #8
	cmp r0, r5
	bgt _021F0A3E
	add r3, #8
	cmp r0, r3
	beq _021F0AEC
	b _021F0B1E
_021F0A3E:
	add r2, r3, #0
	add r2, #0xa
	cmp r0, r2
	bgt _021F0B1E
	add r2, r3, #0
	add r2, #9
	cmp r0, r2
	blt _021F0B1E
	add r2, r3, #0
	add r2, #9
	cmp r0, r2
	beq _021F0A7C
	add r3, #0xa
	cmp r0, r3
	beq _021F0A7C
	b _021F0B1E
_021F0A5E:
	add r5, r3, #0
	add r5, #0x4a
	cmp r0, r5
	bgt _021F0A6E
	add r3, #0x4a
	cmp r0, r3
	beq _021F0ABC
	b _021F0B1E
_021F0A6E:
	add r3, #0x4f
	cmp r0, r3
	beq _021F0AAC
	b _021F0B1E
_021F0A76:
	add sp, #8
	mov r0, #0x79
	pop {r3, r4, r5, pc}
_021F0A7C:
	ldr r0, _021F0B6C ; =0x000018A4
	add r1, r4, r1
	ldrb r1, [r1, r0]
	mov r0, #0x80
	add sp, #8
	eor r0, r1
	add r0, #0x74
	pop {r3, r4, r5, pc}
_021F0A8C:
	ldr r0, _021F0B6C ; =0x000018A4
	add r1, r4, r1
	ldrb r1, [r1, r0]
	mov r0, #0x80
	add sp, #8
	eor r0, r1
	add r0, #0x76
	pop {r3, r4, r5, pc}
_021F0A9C:
	add r1, r4, r1
	add r0, r2, #2
	ldrb r1, [r1, r0]
	mov r0, #0x80
	add sp, #8
	eor r0, r1
	add r0, #0x91
	pop {r3, r4, r5, pc}
_021F0AAC:
	add r1, r4, r1
	add r0, r2, #2
	ldrb r1, [r1, r0]
	mov r0, #0x80
	add sp, #8
	eor r0, r1
	add r0, #0x95
	pop {r3, r4, r5, pc}
_021F0ABC:
	add r1, r4, r1
	add r0, r2, #2
	ldrb r1, [r1, r0]
	mov r0, #0x80
	add sp, #8
	eor r0, r1
	add r0, #0x97
	pop {r3, r4, r5, pc}
_021F0ACC:
	add r1, r4, r1
	add r0, r2, #2
	ldrb r1, [r1, r0]
	mov r0, #0x80
	add sp, #8
	eor r0, r1
	add r0, #0x99
	pop {r3, r4, r5, pc}
_021F0ADC:
	add r1, r4, r1
	add r0, r2, #2
	ldrb r1, [r1, r0]
	mov r0, #0x80
	add sp, #8
	eor r0, r1
	add r0, #0xa0
	pop {r3, r4, r5, pc}
_021F0AEC:
	add r1, r4, r1
	add r0, r2, #2
	ldrb r1, [r1, r0]
	mov r0, #0x80
	add sp, #8
	eor r0, r1
	add r0, #0xa4
	pop {r3, r4, r5, pc}
_021F0AFC:
	add r1, r4, r1
	add r0, r2, #2
	ldrb r1, [r1, r0]
	mov r0, #0x80
	eor r0, r1
	bne _021F0B0E
	add sp, #8
	mov r0, #0x72
	pop {r3, r4, r5, pc}
_021F0B0E:
	cmp r0, #1
	bne _021F0B18
	add sp, #8
	mov r0, #0x73
	pop {r3, r4, r5, pc}
_021F0B18:
	add sp, #8
	mov r0, #0xa6
	pop {r3, r4, r5, pc}
_021F0B1E:
	add r2, r4, r1
	ldr r1, _021F0B6C ; =0x000018A4
	ldrb r1, [r2, r1]
	cmp r1, #1
	bne _021F0B2E
	add sp, #8
	mov r0, #0x72
	pop {r3, r4, r5, pc}
_021F0B2E:
	cmp r1, #2
	bne _021F0B38
	add sp, #8
	mov r0, #0x73
	pop {r3, r4, r5, pc}
_021F0B38:
	mov r1, #2
	mov r2, #0x25
	bl ov18_021E590C
	add r5, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r3, #2
	mov r0, #0x66
	str r3, [sp, #4]
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	add r2, r5, #0
	bl BufferString
	add r0, r5, #0
	bl String_dtor
	mov r0, #0x9f
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021F0B64: .word 0x000018A2
_021F0B68: .word 0x0000019D
_021F0B6C: .word 0x000018A4
	thumb_func_end ov18_021F09D8

	thumb_func_start ov18_021F0B70
ov18_021F0B70: ; 0x021F0B70
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	mov r4, #0
	add r5, r0, #0
	str r1, [sp, #0x14]
	add r6, sp, #0x18
	sub r7, r4, #2
_021F0B7E:
	add r1, r4, #0
	add r2, sp, #0x18
	ldr r0, [r5, #8]
	add r1, #0x11
	add r2, #1
	add r3, sp, #0x18
	bl sub_02019B1C
	mov r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, r7
	beq _021F0BA0
	cmp r0, #0x10
	beq _021F0BA0
	add r4, r4, #1
	cmp r4, #6
	blo _021F0B7E
_021F0BA0:
	add r0, r4, #0
	add r6, r5, #0
	add r0, #0xa
	add r6, #0xc
	lsl r7, r0, #4
	add r0, r6, r7
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x14]
	cmp r0, #0
	ldr r0, [r5, #8]
	bge _021F0BFC
	add r1, r4, #0
	add r1, #0x11
	mov r2, #8
	mov r3, #0x10
	bl sub_020196E8
	ldr r0, _021F0C44 ; =0x000018C5
	ldrsb r1, [r5, r0]
	sub r0, r0, #1
	ldrsb r0, [r5, r0]
	add r1, r1, #2
	cmp r1, r0
	bge _021F0C38
	add r0, r5, #0
	bl ov18_021F09D8
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	add r4, #0xa
	str r0, [sp, #4]
	mov r1, #4
	str r1, [sp, #8]
	ldr r1, _021F0C48 ; =0x000F0C00
	add r2, r4, #0
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r1, _021F0C4C ; =0x0000065C
	add r0, r5, #0
	ldr r1, [r5, r1]
	bl ov18_021EE3AC
	b _021F0C38
_021F0BFC:
	mov r2, #8
	add r1, r4, #0
	add r3, r2, #0
	add r1, #0x11
	sub r3, #0xa
	bl sub_020196E8
	ldr r0, _021F0C44 ; =0x000018C5
	ldrsb r0, [r5, r0]
	sub r1, r0, #2
	bmi _021F0C38
	add r0, r5, #0
	bl ov18_021F09D8
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	add r4, #0xa
	str r0, [sp, #4]
	mov r1, #4
	str r1, [sp, #8]
	ldr r1, _021F0C48 ; =0x000F0C00
	add r2, r4, #0
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r1, _021F0C4C ; =0x0000065C
	add r0, r5, #0
	ldr r1, [r5, r1]
	bl ov18_021EE3AC
_021F0C38:
	add r0, r6, r7
	bl CopyWindowPixelsToVram_TextMode
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_021F0C44: .word 0x000018C5
_021F0C48: .word 0x000F0C00
_021F0C4C: .word 0x0000065C
	thumb_func_end ov18_021F0B70

	thumb_func_start ov18_021F0C50
ov18_021F0C50: ; 0x021F0C50
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r0, #0xc
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r0, #0x4c
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r0, #0x1c
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r3, #0
	str r3, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _021F0D18 ; =0x00020100
	ldr r1, _021F0D1C ; =0x0000065C
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	add r0, r5, #0
	ldr r1, [r5, r1]
	add r0, #0xc
	mov r2, #0xaa
	bl ov18_021F9648
	ldr r0, _021F0D20 ; =0x000018C4
	ldrsb r0, [r5, r0]
	cmp r0, #1
	beq _021F0CB2
	mov r3, #0
	str r3, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _021F0D24 ; =0x000F0C00
	ldr r1, _021F0D1C ; =0x0000065C
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	add r0, r5, #0
	ldr r1, [r5, r1]
	add r0, #0x4c
	mov r2, #0xa8
	bl ov18_021F9648
_021F0CB2:
	ldr r0, _021F0D28 ; =0x000018A2
	mov r1, #2
	ldrh r0, [r5, r0]
	mov r2, #0x25
	bl ov18_021E590C
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r3, #2
	mov r0, #0x66
	str r3, [sp, #4]
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	add r2, r4, #0
	bl BufferString
	add r0, r4, #0
	bl String_dtor
	mov r0, #0x48
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _021F0D18 ; =0x00020100
	mov r2, #1
	str r0, [sp, #0xc]
	ldr r1, _021F0D1C ; =0x0000065C
	str r2, [sp, #0x10]
	ldr r1, [r5, r1]
	add r0, r5, #0
	mov r3, #0xa7
	bl ov18_021EE3AC
	add r0, r5, #0
	add r0, #0xc
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	add r0, #0x4c
	bl ScheduleWindowCopyToVram
	add r5, #0x1c
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r4, r5, pc}
	nop
_021F0D18: .word 0x00020100
_021F0D1C: .word 0x0000065C
_021F0D20: .word 0x000018C4
_021F0D24: .word 0x000F0C00
_021F0D28: .word 0x000018A2
	thumb_func_end ov18_021F0C50

	thumb_func_start ov18_021F0D2C
ov18_021F0D2C: ; 0x021F0D2C
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	add r0, #0x2c
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r1, _021F0D70 ; =0x000018C5
	add r0, r4, #0
	ldrsb r1, [r4, r1]
	bl ov18_021F09D8
	add r3, r0, #0
	mov r0, #0x3c
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _021F0D74 ; =0x00020100
	mov r2, #2
	str r0, [sp, #0xc]
	ldr r1, _021F0D78 ; =0x0000065C
	str r2, [sp, #0x10]
	ldr r1, [r4, r1]
	add r0, r4, #0
	bl ov18_021EE3AC
	add r4, #0x2c
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r3, r4, pc}
	nop
_021F0D70: .word 0x000018C5
_021F0D74: .word 0x00020100
_021F0D78: .word 0x0000065C
	thumb_func_end ov18_021F0D2C

	thumb_func_start ov18_021F0D7C
ov18_021F0D7C: ; 0x021F0D7C
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xc
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	add r0, #0x1c
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	add r0, #0x2c
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	add r0, #0x4c
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	add r0, #0xac
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	add r0, #0xbc
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	add r0, #0xcc
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	add r0, #0xdc
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	add r0, #0xec
	bl ClearWindowTilemapAndScheduleTransfer
	add r4, #0xfc
	add r0, r4, #0
	bl ClearWindowTilemapAndScheduleTransfer
	pop {r4, pc}
	thumb_func_end ov18_021F0D7C

	thumb_func_start ov18_021F0DD0
ov18_021F0DD0: ; 0x021F0DD0
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	bl ov18_021F0D7C
	add r0, r5, #0
	add r0, #0xc
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r0, #0x3c
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r0, #0x5c
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r0, #0x8c
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r0, #0x9c
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r3, #0
	str r3, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _021F0F10 ; =0x00020100
	ldr r1, _021F0F14 ; =0x0000065C
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	add r0, r5, #0
	ldr r1, [r5, r1]
	add r0, #0xc
	mov r2, #0xaa
	bl ov18_021F9648
	ldr r0, _021F0F18 ; =0x000018A2
	mov r1, #2
	ldrh r0, [r5, r0]
	mov r2, #0x25
	bl ov18_021E590C
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r3, #2
	mov r0, #0x66
	str r3, [sp, #4]
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	add r2, r4, #0
	bl BufferString
	add r0, r4, #0
	bl String_dtor
	mov r0, #0x48
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _021F0F10 ; =0x00020100
	ldr r1, _021F0F14 ; =0x0000065C
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	ldr r1, [r5, r1]
	add r0, r5, #0
	mov r2, #3
	mov r3, #0xa9
	bl ov18_021EE3AC
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021F0F1C ; =0x00050900
	ldr r1, _021F0F14 ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r5, #0
	ldr r1, [r5, r1]
	add r0, #0x5c
	mov r2, #0xaa
	mov r3, #0x18
	bl ov18_021F9648
	mov r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021F0F20 ; =0x000F0C00
	ldr r1, _021F0F14 ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r5, #0
	ldr r1, [r5, r1]
	add r0, #0x8c
	mov r2, #0xab
	mov r3, #0x30
	bl ov18_021F9648
	mov r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021F0F20 ; =0x000F0C00
	ldr r1, _021F0F14 ; =0x0000065C
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r5, #0
	ldr r1, [r5, r1]
	add r0, #0x9c
	mov r2, #0xac
	mov r3, #0x30
	bl ov18_021F9648
	add r0, r5, #0
	add r0, #0xc
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	add r0, #0x3c
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	add r0, #0x5c
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	add r0, #0x8c
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	add r0, #0x9c
	bl ScheduleWindowCopyToVram
	ldr r2, _021F0F24 ; =0x000018C5
	add r0, r5, #0
	ldrsb r2, [r5, r2]
	mov r1, #6
	bl ov18_021F0F68
	ldr r2, _021F0F28 ; =0x000018C6
	add r0, r5, #0
	ldrsb r2, [r5, r2]
	mov r1, #7
	bl ov18_021F0F68
	add sp, #0x14
	pop {r4, r5, pc}
	.balign 4, 0
_021F0F10: .word 0x00020100
_021F0F14: .word 0x0000065C
_021F0F18: .word 0x000018A2
_021F0F1C: .word 0x00050900
_021F0F20: .word 0x000F0C00
_021F0F24: .word 0x000018C5
_021F0F28: .word 0x000018C6
	thumb_func_end ov18_021F0DD0

	thumb_func_start ov18_021F0F2C
ov18_021F0F2C: ; 0x021F0F2C
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xc
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	add r0, #0x3c
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	add r0, #0x5c
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	add r0, #0x8c
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	add r0, #0x9c
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	add r0, #0x6c
	bl ClearWindowTilemapAndScheduleTransfer
	add r4, #0x7c
	add r0, r4, #0
	bl ClearWindowTilemapAndScheduleTransfer
	pop {r4, pc}
	thumb_func_end ov18_021F0F2C

	thumb_func_start ov18_021F0F68
ov18_021F0F68: ; 0x021F0F68
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r6, r0, #0
	add r7, r1, #0
	add r5, r6, #0
	add r5, #0xc
	lsl r4, r7, #4
	str r2, [sp, #0x14]
	add r0, r5, r4
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r1, [sp, #0x14]
	add r0, r6, #0
	bl ov18_021F09D8
	str r0, [sp, #0x18]
	add r0, r5, r4
	bl GetWindowWidth
	lsl r1, r0, #3
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _021F0FC0 ; =0x00050900
	ldr r1, _021F0FC4 ; =0x0000065C
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	ldr r1, [r6, r1]
	ldr r3, [sp, #0x18]
	add r0, r6, #0
	add r2, r7, #0
	bl ov18_021EE3AC
	add r0, r5, r4
	bl ScheduleWindowCopyToVram
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021F0FC0: .word 0x00050900
_021F0FC4: .word 0x0000065C
	thumb_func_end ov18_021F0F68

	thumb_func_start ov18_021F0FC8
ov18_021F0FC8: ; 0x021F0FC8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	add r0, r4, #0
	bl ov18_021F12FC
	add r0, r4, #0
	bl ov18_021F1024
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov18_021F0FC8

	thumb_func_start ov18_021F0FEC
ov18_021F0FEC: ; 0x021F0FEC
	push {r4, lr}
	add r4, r0, #0
	bl ov18_021F1104
	add r0, r4, #0
	bl ov18_021F10C8
	add r0, r4, #0
	bl ov18_021F1314
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov18_021F0FEC

	thumb_func_start ov18_021F1004
ov18_021F1004: ; 0x021F1004
	push {r4, r5, r6, lr}
	mov r6, #0x67
	add r5, r0, #0
	mov r4, #0
	lsl r6, r6, #4
_021F100E:
	ldr r0, [r5, r6]
	cmp r0, #0
	beq _021F1018
	bl sub_0200DC18
_021F1018:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x78
	blo _021F100E
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov18_021F1004

	thumb_func_start ov18_021F1024
ov18_021F1024: ; 0x021F1024
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	add r4, r0, #0
	mov r0, #0x25
	bl sub_0200CF18
	ldr r1, _021F10B4 ; =0x00000668
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	bl sub_0200CF38
	ldr r7, _021F10B8 ; =0x0000066C
	add r2, sp, #0x2c
	ldr r3, _021F10BC ; =_021FA3C8
	str r0, [r4, r7]
	ldmia r3!, {r0, r1}
	add r6, r2, #0
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	ldr r5, _021F10C0 ; =_021FA36C
	stmia r2!, {r0, r1}
	add r3, sp, #0x18
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	add r1, r6, #0
	str r0, [r3]
	sub r0, r7, #4
	ldr r0, [r4, r0]
	mov r3, #0x20
	bl sub_0200CF70
	ldr r3, _021F10C4 ; =_021FA380
	add r2, sp, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r1, r7, #4
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #0x78
	bl sub_0200CFF4
	sub r1, r7, #4
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	add r2, sp, #0
	bl sub_0200D3F8
	sub r0, r7, #4
	ldr r0, [r4, r0]
	bl sub_0200CF6C
	mov r2, #2
	mov r1, #0
	lsl r2, r2, #0x14
	bl G2dRenderer_SetSubSurfaceCoords
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021F10B4: .word 0x00000668
_021F10B8: .word 0x0000066C
_021F10BC: .word _021FA3C8
_021F10C0: .word _021FA36C
_021F10C4: .word _021FA380
	thumb_func_end ov18_021F1024

	thumb_func_start ov18_021F10C8
ov18_021F10C8: ; 0x021F10C8
	push {r4, lr}
	ldr r1, _021F10E4 ; =0x00000668
	add r4, r0, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl sub_0200D998
	ldr r0, _021F10E4 ; =0x00000668
	ldr r0, [r4, r0]
	bl sub_0200D108
	pop {r4, pc}
	nop
_021F10E4: .word 0x00000668
	thumb_func_end ov18_021F10C8

	thumb_func_start ov18_021F10E8
ov18_021F10E8: ; 0x021F10E8
	push {r3, r4, r5, lr}
	lsl r5, r1, #2
	mov r1, #0x67
	lsl r1, r1, #4
	add r4, r0, r1
	ldr r0, [r4, r5]
	cmp r0, #0
	beq _021F1100
	bl sub_0200D9DC
	mov r0, #0
	str r0, [r4, r5]
_021F1100:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov18_021F10E8

	thumb_func_start ov18_021F1104
ov18_021F1104: ; 0x021F1104
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_021F110A:
	add r0, r5, #0
	add r1, r4, #0
	bl ov18_021F10E8
	add r4, r4, #1
	cmp r4, #0x78
	blo _021F110A
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov18_021F1104

	thumb_func_start ov18_021F111C
ov18_021F111C: ; 0x021F111C
	push {r4, r5, r6, lr}
	lsl r1, r1, #2
	add r1, r0, r1
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	add r5, r2, #0
	ldr r0, [r0]
	add r4, r3, #0
	bl sub_02024B1C
	ldr r1, [sp, #0x10]
	bl NNS_G2dGetImageLocation
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl DC_FlushRange
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bne _021F1154
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	bl GX_LoadOBJ
	pop {r4, r5, r6, pc}
_021F1154:
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	bl GXS_LoadOBJ
	pop {r4, r5, r6, pc}
	thumb_func_end ov18_021F111C

	thumb_func_start ov18_021F1160
ov18_021F1160: ; 0x021F1160
	push {r3, lr}
	cmp r2, #1
	bne _021F1178
	lsl r1, r1, #2
	add r1, r0, r1
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #1
	bl sub_0200E0FC
	pop {r3, pc}
_021F1178:
	lsl r1, r1, #2
	add r1, r0, r1
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0200E0FC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov18_021F1160

	thumb_func_start ov18_021F118C
ov18_021F118C: ; 0x021F118C
	push {r4, r5, r6, lr}
	add r6, r2, #0
	mov r2, #0x67
	lsl r2, r2, #4
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
	thumb_func_end ov18_021F118C

	thumb_func_start ov18_021F11AC
ov18_021F11AC: ; 0x021F11AC
	lsl r1, r1, #2
	add r1, r0, r1
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r3, _021F11BC ; =sub_0200DCA0
	ldr r0, [r1, r0]
	bx r3
	nop
_021F11BC: .word sub_0200DCA0
	thumb_func_end ov18_021F11AC

	thumb_func_start ov18_021F11C0
ov18_021F11C0: ; 0x021F11C0
	push {r3, lr}
	cmp r2, #1
	bne _021F11D8
	lsl r1, r1, #2
	add r1, r0, r1
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #1
	bl sub_0200DCE8
	pop {r3, pc}
_021F11D8:
	lsl r1, r1, #2
	add r1, r0, r1
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0200DCE8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov18_021F11C0

	thumb_func_start ov18_021F11EC
ov18_021F11EC: ; 0x021F11EC
	push {r3, lr}
	add r2, r1, #0
	add r3, r0, #0
	ldr r0, [r2, #0x10]
	ldr r1, _021F1218 ; =0x00000668
	cmp r0, #1
	bne _021F1206
	ldr r0, [r3, r1]
	add r1, r1, #4
	ldr r1, [r3, r1]
	bl sub_0200D734
	pop {r3, pc}
_021F1206:
	ldr r0, [r3, r1]
	add r1, r1, #4
	ldr r1, [r3, r1]
	mov r3, #2
	lsl r3, r3, #0x14
	bl sub_0200D740
	pop {r3, pc}
	nop
_021F1218: .word 0x00000668
	thumb_func_end ov18_021F11EC

	thumb_func_start ov18_021F121C
ov18_021F121C: ; 0x021F121C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r2, #0
	ldr r2, [sp, #0x18]
	add r6, r3, #0
	cmp r2, #0
	bne _021F125A
	mov r2, #0x67
	lsl r2, r2, #4
	add r5, r0, r2
	lsl r7, r1, #2
	add r1, sp, #0
	ldr r0, [r5, r7]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	add r2, sp, #0
	mov r1, #2
	ldrsh r1, [r2, r1]
	mov r3, #0
	ldrsh r2, [r2, r3]
	add r1, r1, r4
	lsl r1, r1, #0x10
	add r2, r2, r6
	lsl r2, r2, #0x10
	ldr r0, [r5, r7]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl sub_0200DDB8
	pop {r3, r4, r5, r6, r7, pc}
_021F125A:
	mov r2, #0x67
	lsl r2, r2, #4
	add r5, r0, r2
	lsl r7, r1, #2
	add r1, sp, #0
	mov r3, #2
	ldr r0, [r5, r7]
	add r1, #2
	add r2, sp, #0
	lsl r3, r3, #0x14
	bl sub_0200DE94
	add r2, sp, #0
	mov r3, #2
	ldrsh r1, [r2, r3]
	ldr r0, [r5, r7]
	lsl r3, r3, #0x14
	add r1, r1, r4
	mov r4, #0
	ldrsh r2, [r2, r4]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add r2, r2, r6
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl sub_0200DDF4
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov18_021F121C

	thumb_func_start ov18_021F1294
ov18_021F1294: ; 0x021F1294
	push {r4, lr}
	ldr r4, [sp, #8]
	cmp r4, #0
	bne _021F12B0
	lsl r1, r1, #2
	add r1, r0, r1
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	add r1, r2, #0
	add r2, r3, #0
	bl sub_0200DDB8
	pop {r4, pc}
_021F12B0:
	lsl r1, r1, #2
	add r1, r0, r1
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	add r1, r2, #0
	add r2, r3, #0
	mov r3, #2
	lsl r3, r3, #0x14
	bl sub_0200DDF4
	pop {r4, pc}
	thumb_func_end ov18_021F1294

	thumb_func_start ov18_021F12C8
ov18_021F12C8: ; 0x021F12C8
	push {r4, lr}
	ldr r4, [sp, #8]
	cmp r4, #0
	bne _021F12E4
	lsl r1, r1, #2
	add r1, r0, r1
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	add r1, r2, #0
	add r2, r3, #0
	bl sub_0200DE44
	pop {r4, pc}
_021F12E4:
	lsl r1, r1, #2
	add r1, r0, r1
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	add r1, r2, #0
	add r2, r3, #0
	mov r3, #2
	lsl r3, r3, #0x14
	bl sub_0200DE94
	pop {r4, pc}
	thumb_func_end ov18_021F12C8

	thumb_func_start ov18_021F12FC
ov18_021F12FC: ; 0x021F12FC
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x14
	mov r1, #0x25
	bl NARC_ctor
	ldr r1, _021F1310 ; =0x00000858
	str r0, [r4, r1]
	pop {r4, pc}
	nop
_021F1310: .word 0x00000858
	thumb_func_end ov18_021F12FC

	thumb_func_start ov18_021F1314
ov18_021F1314: ; 0x021F1314
	ldr r1, _021F131C ; =0x00000858
	ldr r3, _021F1320 ; =NARC_dtor
	ldr r0, [r0, r1]
	bx r3
	.balign 4, 0
_021F131C: .word 0x00000858
_021F1320: .word NARC_dtor
	thumb_func_end ov18_021F1314

	thumb_func_start ov18_021F1324
ov18_021F1324: ; 0x021F1324
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	add r6, r1, #0
	ldr r4, _021F13C4 ; =0x00000000
	beq _021F1354
	mov r7, #1
_021F1332:
	ldr r0, _021F13C8 ; =0x0000C550
	str r7, [sp]
	str r7, [sp, #4]
	add r0, r4, r0
	str r0, [sp, #8]
	ldr r0, _021F13CC ; =0x00000668
	ldr r1, _021F13D0 ; =0x0000066C
	ldr r2, _021F13D4 ; =0x00000854
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	mov r3, #0x4c
	bl sub_0200D504
	add r4, r4, #1
	cmp r4, r6
	blo _021F1332
_021F1354:
	bl sub_02074490
	ldr r1, _021F13D8 ; =0x00000858
	ldr r3, _021F13CC ; =0x00000668
	ldr r2, [r5, r1]
	sub r1, #8
	str r2, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #3
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, _021F13C8 ; =0x0000C550
	str r0, [sp, #0x14]
	ldr r2, [r5, r3]
	add r3, r3, #4
	ldr r0, [r5, r1]
	ldr r3, [r5, r3]
	mov r1, #2
	bl sub_0200D68C
	bl sub_0207449C
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _021F13C8 ; =0x0000C550
	ldr r1, _021F13CC ; =0x00000668
	str r0, [sp, #4]
	ldr r2, _021F13D8 ; =0x00000858
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl sub_0200D6EC
	bl sub_020744A8
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _021F13C8 ; =0x0000C550
	ldr r1, _021F13CC ; =0x00000668
	str r0, [sp, #4]
	ldr r2, _021F13D8 ; =0x00000858
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl sub_0200D71C
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F13C4: .word 0x00000000
_021F13C8: .word 0x0000C550
_021F13CC: .word 0x00000668
_021F13D0: .word 0x0000066C
_021F13D4: .word 0x00000854
_021F13D8: .word 0x00000858
	thumb_func_end ov18_021F1324

	thumb_func_start ov18_021F13DC
ov18_021F13DC: ; 0x021F13DC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	ldr r4, _021F1418 ; =0x00000000
	beq _021F13F8
	ldr r7, _021F141C ; =0x0000C550
_021F13E8:
	ldr r0, _021F1420 ; =0x0000066C
	add r1, r4, r7
	ldr r0, [r5, r0]
	bl sub_0200D958
	add r4, r4, #1
	cmp r4, r6
	blo _021F13E8
_021F13F8:
	ldr r0, _021F1420 ; =0x0000066C
	ldr r1, _021F141C ; =0x0000C550
	ldr r0, [r5, r0]
	bl sub_0200D968
	ldr r0, _021F1420 ; =0x0000066C
	ldr r1, _021F141C ; =0x0000C550
	ldr r0, [r5, r0]
	bl sub_0200D978
	ldr r0, _021F1420 ; =0x0000066C
	ldr r1, _021F141C ; =0x0000C550
	ldr r0, [r5, r0]
	bl sub_0200D988
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F1418: .word 0x00000000
_021F141C: .word 0x0000C550
_021F1420: .word 0x0000066C
	thumb_func_end ov18_021F13DC

	thumb_func_start ov18_021F1424
ov18_021F1424: ; 0x021F1424
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x68
	add r7, r0, #0
	lsl r0, r1, #2
	ldr r3, _021F147C ; =_021FA3E8
	mov r4, #0
	add r5, r7, r0
	add r2, sp, #0
	mov r6, #6
_021F1436:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r6, r6, #1
	bne _021F1436
	ldr r0, [r3]
	str r0, [r2]
_021F1442:
	add r6, sp, #0
	add r3, sp, #0x34
	mov r2, #6
_021F1448:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021F1448
	ldr r0, [r6]
	ldr r1, _021F1480 ; =0x0000066C
	str r0, [r3]
	ldr r0, _021F1484 ; =0x0000C550
	add r2, sp, #0x34
	add r0, r4, r0
	str r0, [sp, #0x48]
	ldr r0, _021F1488 ; =0x00000668
	ldr r1, [r7, r1]
	ldr r0, [r7, r0]
	bl sub_0200D734
	mov r1, #0x67
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x3c
	blo _021F1442
	add sp, #0x68
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F147C: .word _021FA3E8
_021F1480: .word 0x0000066C
_021F1484: .word 0x0000C550
_021F1488: .word 0x00000668
	thumb_func_end ov18_021F1424

	thumb_func_start ov18_021F148C
ov18_021F148C: ; 0x021F148C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r1, #0
	mov r1, #0
	add r4, r3, #0
	bl GetBattleMonIconNaixEx
	add r1, r0, #0
	mov r0, #0x25
	str r0, [sp]
	ldr r0, _021F14B0 ; =0x00000858
	mov r2, #0
	ldr r0, [r5, r0]
	add r3, r4, #0
	bl GfGfxLoader_GetCharDataFromOpenNarc
	pop {r3, r4, r5, pc}
	nop
_021F14B0: .word 0x00000858
	thumb_func_end ov18_021F148C

	thumb_func_start ov18_021F14B4
ov18_021F14B4: ; 0x021F14B4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _021F14F4 ; =0x0000066C
	str r1, [sp, #4]
	add r4, r2, #0
	ldr r0, [r5, r0]
	ldr r1, _021F14F8 ; =0x0000C550
	mov r2, #1
	add r6, r3, #0
	bl sub_0200D944
	mov r3, #1
	add r7, r0, #0
	str r3, [sp]
	ldr r2, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	lsl r3, r3, #9
	bl ov18_021F111C
	lsl r0, r4, #2
	add r1, r5, r0
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	add r1, r7, r6
	bl sub_0200DD10
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F14F4: .word 0x0000066C
_021F14F8: .word 0x0000C550
	thumb_func_end ov18_021F14B4

	thumb_func_start ov18_021F14FC
ov18_021F14FC: ; 0x021F14FC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r3, [sp]
	add r4, r1, #0
	add r6, r2, #0
	add r3, sp, #4
	add r5, r0, #0
	bl ov18_021F148C
	add r7, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	mov r2, #0
	bl GetBattleMonIconPaletteEx
	ldr r1, [sp, #4]
	add r3, r0, #0
	ldr r1, [r1, #0x14]
	ldr r2, [sp]
	add r0, r5, #0
	bl ov18_021F14B4
	add r0, r7, #0
	bl FreeToHeap
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov18_021F14FC

	thumb_func_start ov18_021F1534
ov18_021F1534: ; 0x021F1534
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r3, #0
	add r3, sp, #0xc
	add r5, r0, #0
	add r7, r1, #0
	str r2, [sp, #4]
	bl ov18_021F148C
	mov r3, #2
	str r3, [sp]
	ldr r2, [sp, #0xc]
	str r0, [sp, #8]
	ldr r2, [r2, #0x14]
	add r0, r5, #0
	add r1, r4, #0
	lsl r3, r3, #8
	bl ov18_021F111C
	ldr r0, _021F1590 ; =0x0000066C
	ldr r1, _021F1594 ; =0x0000C551
	ldr r0, [r5, r0]
	mov r2, #2
	bl sub_0200D944
	add r6, r0, #0
	ldr r1, [sp, #4]
	add r0, r7, #0
	mov r2, #0
	bl GetBattleMonIconPaletteEx
	add r1, r0, #0
	lsl r0, r4, #2
	add r2, r5, r0
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r2, r0]
	add r1, r6, r1
	bl sub_0200DD10
	ldr r0, [sp, #8]
	bl FreeToHeap
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F1590: .word 0x0000066C
_021F1594: .word 0x0000C551
	thumb_func_end ov18_021F1534

	thumb_func_start ov18_021F1598
ov18_021F1598: ; 0x021F1598
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0x67
	lsl r0, r0, #4
	add r6, r2, #0
	add r7, r5, r0
	lsl r0, r6, #2
	str r0, [sp]
	add r4, r1, #0
	ldr r0, [r7, r0]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, _021F1618 ; =0x00001030
	lsl r4, r4, #2
	add r0, r5, r0
	ldrh r1, [r0, r4]
	str r0, [sp, #4]
	cmp r1, #0
	beq _021F1614
	ldr r0, [r5]
	mov r2, #0
	ldr r0, [r0]
	bl Pokedex_GetSeenFormeByIdx
	add r2, r0, #0
	ldr r0, [sp, #4]
	ldrh r1, [r0, r4]
	cmp r1, #0xac
	bne _021F15E0
	cmp r2, #2
	bne _021F15DE
	mov r2, #1
	b _021F15E0
_021F15DE:
	mov r2, #0
_021F15E0:
	add r0, r5, #0
	add r3, r6, #0
	bl ov18_021F14FC
	ldr r0, [sp]
	mov r1, #1
	ldr r0, [r7, r0]
	bl sub_0200DCE8
	ldr r0, _021F161C ; =0x00001032
	add r1, r5, r4
	ldrh r0, [r1, r0]
	cmp r0, #1
	bne _021F160A
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #1
	bl ov18_021F1160
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_021F160A:
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0
	bl ov18_021F1160
_021F1614:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F1618: .word 0x00001030
_021F161C: .word 0x00001032
	thumb_func_end ov18_021F1598

	thumb_func_start ov18_021F1620
ov18_021F1620: ; 0x021F1620
	push {r3, r4, r5, r6, r7, lr}
	mov r6, #0x67
	add r5, r0, #0
	add r7, r1, #0
	mov r4, #0
	lsl r6, r6, #4
_021F162C:
	ldr r1, _021F16BC ; =0x0000185E
	add r0, r7, r4
	ldrb r2, [r5, r1]
	mov r1, #1
	eor r2, r1
	mov r1, #0x1e
	mul r1, r2
	add r0, r0, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0xe
	add r0, r5, r0
	ldr r0, [r0, r6]
	mov r1, #0
	bl sub_0200DCE8
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #0x1e
	blo _021F162C
	mov r4, #0
_021F1656:
	ldr r1, _021F16BC ; =0x0000185E
	add r0, r7, r4
	ldrb r2, [r5, r1]
	mov r1, #0x1e
	mul r1, r2
	add r0, r0, r1
	ldr r1, _021F16C0 ; =0x00001859
	lsl r0, r0, #0x10
	ldrb r2, [r5, r1]
	mov r1, #0xf
	lsr r6, r0, #0x10
	mul r1, r2
	add r0, r5, #0
	add r1, r4, r1
	add r2, r6, #0
	bl ov18_021F1598
	add r0, r4, #0
	mov r1, #5
	bl _s32_div_f
	str r1, [sp]
	add r0, r4, #0
	mov r1, #5
	bl _s32_div_f
	add r2, r0, #0
	lsl r0, r6, #2
	add r1, r5, r0
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	ldr r3, [sp]
	mov r1, #0x28
	mul r1, r3
	mov r3, #0x28
	mul r3, r2
	add r1, #0x30
	add r3, #0x18
	lsl r1, r1, #0x10
	lsl r2, r3, #0x10
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl sub_0200DDB8
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #0x1e
	blo _021F1656
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F16BC: .word 0x0000185E
_021F16C0: .word 0x00001859
	thumb_func_end ov18_021F1620

	thumb_func_start ov18_021F16C4
ov18_021F16C4: ; 0x021F16C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r1, [sp]
	add r1, r3, #1
	add r5, r0, #0
	lsl r0, r1, #2
	mov r6, #0
	add r0, r1, r0
	str r2, [sp, #4]
	add r7, r6, #0
	str r0, [sp, #0xc]
	add r4, sp, #0x14
_021F16DC:
	ldr r1, _021F1758 ; =0x0000185E
	ldr r0, [sp]
	ldrb r2, [r5, r1]
	mov r1, #0x1e
	add r0, r0, r7
	mul r1, r2
	add r0, r0, r1
	str r0, [sp, #0x10]
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x67
	lsl r0, r0, #4
	str r1, [sp, #8]
	ldr r0, [r1, r0]
	add r1, sp, #0x14
	add r1, #2
	add r2, sp, #0x14
	bl sub_0200DE44
	mov r0, #0
	ldrsh r0, [r4, r0]
	cmp r0, #0xe0
	bne _021F172C
	mov r0, #0xf
	mvn r0, r0
	strh r0, [r4]
	ldr r1, _021F175C ; =0x00001859
	mov r2, #0xf
	ldrb r1, [r5, r1]
	add r0, r5, #0
	mul r2, r1
	ldr r1, [sp, #0xc]
	sub r1, r2, r1
	ldr r2, [sp, #0x10]
	add r1, r6, r1
	bl ov18_021F1598
	add r0, r6, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
_021F172C:
	mov r0, #0
	ldrsh r1, [r4, r0]
	ldr r0, [sp, #4]
	mov r2, #0
	add r0, r1, r0
	strh r0, [r4]
	mov r0, #0x67
	ldr r1, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #2
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	bl sub_0200DDB8
	add r0, r7, #1
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	cmp r7, #0x1e
	blo _021F16DC
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F1758: .word 0x0000185E
_021F175C: .word 0x00001859
	thumb_func_end ov18_021F16C4

	thumb_func_start ov18_021F1760
ov18_021F1760: ; 0x021F1760
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r1, [sp]
	add r1, r3, #5
	add r5, r0, #0
	lsl r0, r1, #2
	mov r6, #0
	add r0, r1, r0
	str r2, [sp, #4]
	add r7, r6, #0
	str r0, [sp, #0xc]
	add r4, sp, #0x14
_021F1778:
	ldr r1, _021F17F4 ; =0x0000185E
	ldr r0, [sp]
	ldrb r2, [r5, r1]
	mov r1, #0x1e
	add r0, r0, r7
	mul r1, r2
	add r0, r0, r1
	str r0, [sp, #0x10]
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x67
	lsl r0, r0, #4
	str r1, [sp, #8]
	ldr r0, [r1, r0]
	add r1, sp, #0x14
	add r1, #2
	add r2, sp, #0x14
	bl sub_0200DE44
	mov r0, #0
	ldrsh r1, [r4, r0]
	sub r0, #0x10
	cmp r1, r0
	bne _021F17C8
	mov r0, #0xe0
	strh r0, [r4]
	ldr r1, _021F17F8 ; =0x00001859
	mov r2, #0xf
	ldrb r1, [r5, r1]
	add r0, r5, #0
	mul r2, r1
	ldr r1, [sp, #0xc]
	add r1, r2, r1
	ldr r2, [sp, #0x10]
	add r1, r6, r1
	bl ov18_021F1598
	add r0, r6, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
_021F17C8:
	mov r0, #0
	ldrsh r1, [r4, r0]
	ldr r0, [sp, #4]
	mov r2, #0
	add r0, r1, r0
	strh r0, [r4]
	mov r0, #0x67
	ldr r1, [sp, #8]
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #2
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	bl sub_0200DDB8
	add r0, r7, #1
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	cmp r7, #0x1e
	blo _021F1778
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F17F4: .word 0x0000185E
_021F17F8: .word 0x00001859
	thumb_func_end ov18_021F1760

	thumb_func_start ov18_021F17FC
ov18_021F17FC: ; 0x021F17FC
	push {r4, lr}
	sub sp, #0x18
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _021F18C8 ; =0x0000C58C
	ldr r1, _021F18CC ; =0x00000668
	str r0, [sp, #8]
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #8
	mov r3, #0x4c
	bl sub_0200D4A4
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _021F18D0 ; =0x0000C58D
	ldr r1, _021F18CC ; =0x00000668
	str r0, [sp, #8]
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #8
	mov r3, #0x4c
	bl sub_0200D4A4
	mov r0, #8
	str r0, [sp]
	mov r0, #0x4b
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	ldr r0, _021F18D4 ; =0x0000C552
	ldr r3, _021F18CC ; =0x00000668
	str r0, [sp, #0x14]
	mov r0, #0x85
	lsl r0, r0, #4
	ldr r2, [r4, r3]
	add r3, r3, #4
	ldr r0, [r4, r0]
	ldr r3, [r4, r3]
	mov r1, #3
	bl sub_0200D644
	mov r0, #8
	str r0, [sp]
	mov r0, #0x4b
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	ldr r0, _021F18D8 ; =0x0000C553
	ldr r3, _021F18CC ; =0x00000668
	str r0, [sp, #0x14]
	mov r0, #0x85
	lsl r0, r0, #4
	ldr r2, [r4, r3]
	add r3, r3, #4
	ldr r0, [r4, r0]
	ldr r3, [r4, r3]
	mov r1, #3
	bl sub_0200D644
	mov r0, #0
	str r0, [sp]
	ldr r0, _021F18DC ; =0x0000C551
	ldr r1, _021F18CC ; =0x00000668
	str r0, [sp, #4]
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #8
	mov r3, #0x4d
	bl sub_0200D6D4
	mov r0, #0
	str r0, [sp]
	ldr r0, _021F18DC ; =0x0000C551
	ldr r1, _021F18CC ; =0x00000668
	str r0, [sp, #4]
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #8
	mov r3, #0x4e
	bl sub_0200D704
	add sp, #0x18
	pop {r4, pc}
	nop
_021F18C8: .word 0x0000C58C
_021F18CC: .word 0x00000668
_021F18D0: .word 0x0000C58D
_021F18D4: .word 0x0000C552
_021F18D8: .word 0x0000C553
_021F18DC: .word 0x0000C551
	thumb_func_end ov18_021F17FC

	thumb_func_start ov18_021F18E0
ov18_021F18E0: ; 0x021F18E0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021F1924 ; =0x0000066C
	ldr r1, _021F1928 ; =0x0000C58C
	ldr r0, [r4, r0]
	bl sub_0200D958
	ldr r0, _021F1924 ; =0x0000066C
	ldr r1, _021F192C ; =0x0000C58D
	ldr r0, [r4, r0]
	bl sub_0200D958
	ldr r0, _021F1924 ; =0x0000066C
	ldr r1, _021F1930 ; =0x0000C552
	ldr r0, [r4, r0]
	bl sub_0200D968
	ldr r0, _021F1924 ; =0x0000066C
	ldr r1, _021F1934 ; =0x0000C553
	ldr r0, [r4, r0]
	bl sub_0200D968
	ldr r0, _021F1924 ; =0x0000066C
	ldr r1, _021F1938 ; =0x0000C551
	ldr r0, [r4, r0]
	bl sub_0200D978
	ldr r0, _021F1924 ; =0x0000066C
	ldr r1, _021F1938 ; =0x0000C551
	ldr r0, [r4, r0]
	bl sub_0200D988
	pop {r4, pc}
	nop
_021F1924: .word 0x0000066C
_021F1928: .word 0x0000C58C
_021F192C: .word 0x0000C58D
_021F1930: .word 0x0000C552
_021F1934: .word 0x0000C553
_021F1938: .word 0x0000C551
	thumb_func_end ov18_021F18E0

	thumb_func_start ov18_021F193C
ov18_021F193C: ; 0x021F193C
	push {r4, lr}
	sub sp, #0x18
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _021F19D8 ; =0x0000C58E
	ldr r1, _021F19DC ; =0x00000668
	str r0, [sp, #8]
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #8
	mov r3, #0x4c
	bl sub_0200D4A4
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _021F19E0 ; =0x0000C58F
	ldr r1, _021F19DC ; =0x00000668
	str r0, [sp, #8]
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #8
	mov r3, #0x4c
	bl sub_0200D4A4
	mov r0, #8
	str r0, [sp]
	mov r0, #0x4b
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	ldr r0, _021F19E4 ; =0x0000C554
	ldr r3, _021F19DC ; =0x00000668
	str r0, [sp, #0x14]
	mov r0, #0x85
	lsl r0, r0, #4
	ldr r2, [r4, r3]
	add r3, r3, #4
	ldr r0, [r4, r0]
	ldr r3, [r4, r3]
	mov r1, #3
	bl sub_0200D644
	mov r0, #8
	str r0, [sp]
	mov r0, #0x4b
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	ldr r0, _021F19E8 ; =0x0000C555
	ldr r3, _021F19DC ; =0x00000668
	str r0, [sp, #0x14]
	mov r0, #0x85
	lsl r0, r0, #4
	ldr r2, [r4, r3]
	add r3, r3, #4
	ldr r0, [r4, r0]
	ldr r3, [r4, r3]
	mov r1, #3
	bl sub_0200D644
	add sp, #0x18
	pop {r4, pc}
	nop
_021F19D8: .word 0x0000C58E
_021F19DC: .word 0x00000668
_021F19E0: .word 0x0000C58F
_021F19E4: .word 0x0000C554
_021F19E8: .word 0x0000C555
	thumb_func_end ov18_021F193C

	thumb_func_start ov18_021F19EC
ov18_021F19EC: ; 0x021F19EC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021F1A1C ; =0x0000066C
	ldr r1, _021F1A20 ; =0x0000C58E
	ldr r0, [r4, r0]
	bl sub_0200D958
	ldr r0, _021F1A1C ; =0x0000066C
	ldr r1, _021F1A24 ; =0x0000C58F
	ldr r0, [r4, r0]
	bl sub_0200D958
	ldr r0, _021F1A1C ; =0x0000066C
	ldr r1, _021F1A28 ; =0x0000C554
	ldr r0, [r4, r0]
	bl sub_0200D968
	ldr r0, _021F1A1C ; =0x0000066C
	ldr r1, _021F1A2C ; =0x0000C555
	ldr r0, [r4, r0]
	bl sub_0200D968
	pop {r4, pc}
	nop
_021F1A1C: .word 0x0000066C
_021F1A20: .word 0x0000C58E
_021F1A24: .word 0x0000C58F
_021F1A28: .word 0x0000C554
_021F1A2C: .word 0x0000C555
	thumb_func_end ov18_021F19EC

	thumb_func_start ov18_021F1A30
ov18_021F1A30: ; 0x021F1A30
	push {r3, r4, r5, lr}
	lsl r4, r1, #2
	ldr r1, _021F1A6C ; =0x00000668
	add r5, r0, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	mov r3, #2
	ldr r1, [r5, r1]
	ldr r2, _021F1A70 ; =_021FABC0
	lsl r3, r3, #0x14
	bl sub_0200D740
	mov r1, #0x67
	mov r3, #2
	add r2, r5, r4
	lsl r1, r1, #4
	str r0, [r2, r1]
	add r0, r1, #0
	sub r0, #8
	sub r1, r1, #4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, _021F1A74 ; =_021FABF4
	lsl r3, r3, #0x14
	bl sub_0200D740
	ldr r1, _021F1A78 ; =0x00000674
	add r2, r5, r4
	str r0, [r2, r1]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021F1A6C: .word 0x00000668
_021F1A70: .word _021FABC0
_021F1A74: .word _021FABF4
_021F1A78: .word 0x00000674
	thumb_func_end ov18_021F1A30

	thumb_func_start ov18_021F1A7C
ov18_021F1A7C: ; 0x021F1A7C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	str r2, [sp, #0x14]
	str r3, [sp, #0x18]
	ldr r3, _021F1BC0 ; =_021FA328
	add r2, sp, #0x20
	add r5, r0, #0
	add r4, r1, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	mov r1, #0x32
	mov r0, #0x25
	lsl r1, r1, #6
	bl AllocFromHeapAtEnd
	add r7, r0, #0
	mov r0, #0
	add r1, sp, #0x30
	mov r2, #0x10
	bl MIi_CpuClearFast
	ldr r0, _021F1BC4 ; =0x00000147
	cmp r4, r0
	bne _021F1AC6
	add r0, sp, #0x48
	ldrb r0, [r0, #0x10]
	cmp r0, #2
	bne _021F1AC6
	ldr r0, [r5]
	mov r1, #0
	ldr r0, [r0]
	bl Pokedex_GetSeenSpindaPersonality
	add r6, r0, #0
	b _021F1AC8
_021F1AC6:
	mov r6, #0
_021F1AC8:
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x14]
	add r3, sp, #0x48
	str r0, [sp, #4]
	str r6, [sp, #8]
	ldrb r3, [r3, #0x10]
	ldr r2, [sp, #0x18]
	add r0, sp, #0x30
	add r1, r4, #0
	bl GetMonSpriteCharAndPlttNarcIdsEx
	str r7, [sp]
	str r6, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	add r0, sp, #0x48
	ldrb r0, [r0, #0x10]
	add r1, sp, #0x20
	mov r2, #0x25
	str r0, [sp, #0xc]
	str r4, [sp, #0x10]
	ldrh r0, [r1, #0x10]
	ldrh r1, [r1, #0x12]
	add r3, sp, #0x20
	bl sub_02014510
	mov r0, #0x67
	lsl r0, r0, #4
	add r4, r5, r0
	ldr r0, [sp, #0x5c]
	lsl r6, r0, #2
	ldr r0, [r4, r6]
	ldr r0, [r0]
	bl sub_02024B1C
	mov r1, #2
	bl NNS_G2dGetImageLocation
	mov r1, #0x32
	str r0, [sp, #0x1c]
	add r0, r7, #0
	lsl r1, r1, #6
	bl DC_FlushRange
	mov r2, #0x32
	ldr r1, [sp, #0x1c]
	add r0, r7, #0
	lsl r2, r2, #6
	bl GXS_LoadOBJ
	ldr r0, [r4, r6]
	ldr r0, [r0]
	bl sub_02024B34
	mov r1, #2
	bl NNS_G2dGetImagePaletteLocation
	add r4, r0, #0
	ldr r0, [sp, #0x60]
	cmp r0, #0
	bne _021F1B6E
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x25
	str r0, [sp, #4]
	add r1, sp, #0x20
	ldrh r0, [r1, #0x10]
	ldrh r1, [r1, #0x14]
	mov r2, #5
	add r3, r4, #0
	bl GfGfxLoader_GXLoadPal
	mov r0, #0x85
	lsl r0, r0, #4
	lsl r2, r4, #0xf
	ldr r0, [r5, r0]
	mov r1, #3
	lsr r2, r2, #0x10
	mov r3, #0x20
	bl sub_020032A4
	b _021F1BB4
_021F1B6E:
	cmp r0, #1
	bne _021F1B94
	mov r0, #3
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	lsl r0, r4, #0xf
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #0x85
	add r2, sp, #0x20
	lsl r0, r0, #4
	ldrh r1, [r2, #0x10]
	ldrh r2, [r2, #0x14]
	ldr r0, [r5, r0]
	mov r3, #0x25
	bl PaletteData_LoadNarc
	b _021F1BB4
_021F1B94:
	lsr r1, r4, #1
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	add r1, #0x10
	str r0, [sp]
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #4]
	mov r0, #0x85
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #3
	mov r2, #2
	mov r3, #0
	bl sub_02003D5C
_021F1BB4:
	add r0, r7, #0
	bl FreeToHeap
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F1BC0: .word _021FA328
_021F1BC4: .word 0x00000147
	thumb_func_end ov18_021F1A7C

	thumb_func_start ov18_021F1BC8
ov18_021F1BC8: ; 0x021F1BC8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, _021F1CA8 ; =0x0000185F
	add r4, r2, #0
	ldrb r0, [r5, r0]
	add r6, r1, #0
	add r7, r3, #0
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	add r0, r4, r0
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0200DCE8
	ldr r3, _021F1CA8 ; =0x0000185F
	mov r1, #0xf
	ldrb r2, [r5, r3]
	add r0, r2, #0
	bic r0, r1
	lsl r1, r2, #0x1c
	lsr r2, r1, #0x1c
	mov r1, #1
	eor r1, r2
	lsl r1, r1, #0x18
	lsr r2, r1, #0x18
	mov r1, #0xf
	and r1, r2
	orr r0, r1
	strb r0, [r5, r3]
	ldrb r0, [r5, r3]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	add r4, r4, r0
	cmp r6, #0
	bne _021F1C3C
	lsl r0, r7, #2
	add r1, r5, r0
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #1
	bl sub_0200DCE8
	lsl r0, r4, #2
	add r1, r5, r0
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0200DCE8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_021F1C3C:
	lsl r0, r7, #2
	add r1, r5, r0
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0200DCE8
	lsl r0, r4, #2
	add r1, r5, r0
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #1
	bl sub_0200DCE8
	ldr r0, [r5]
	add r1, r6, #0
	ldr r0, [r0]
	mov r2, #0
	bl Pokedex_SpeciesGetLastSeenGender
	add r7, r0, #0
	ldr r0, [r5]
	add r1, r6, #0
	ldr r0, [r0]
	mov r2, #0
	bl Pokedex_GetSeenFormeByIdx
	add r2, r0, #0
	cmp r6, #0xac
	bne _021F1C88
	cmp r2, #2
	bne _021F1C86
	mov r2, #1
	add r7, r2, #0
	b _021F1C88
_021F1C86:
	mov r2, #0
_021F1C88:
	mov r0, #2
	str r0, [sp]
	lsl r2, r2, #0x18
	lsl r3, r7, #0x18
	str r4, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r1, r6, #0
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl ov18_021F1A7C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_021F1CA8: .word 0x0000185F
	thumb_func_end ov18_021F1BC8

	thumb_func_start ov18_021F1CAC
ov18_021F1CAC: ; 0x021F1CAC
	push {r3, lr}
	bl ov18_021F1BC8
	pop {r3, pc}
	thumb_func_end ov18_021F1CAC

	thumb_func_start ov18_021F1CB4
ov18_021F1CB4: ; 0x021F1CB4
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r5, r0, #0
	bl ov18_021E5900
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _021F1D44 ; =0x0000C599
	ldr r1, _021F1D48 ; =0x00000668
	str r0, [sp, #8]
	ldr r2, _021F1D4C ; =0x00000854
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	mov r3, #0x4d
	bl sub_0200D504
	bl ov18_021E5908
	str r4, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	ldr r0, _021F1D50 ; =0x0000C55B
	ldr r3, _021F1D48 ; =0x00000668
	str r0, [sp, #0x14]
	mov r0, #0x85
	lsl r0, r0, #4
	ldr r2, [r5, r3]
	add r3, r3, #4
	ldr r0, [r5, r0]
	ldr r3, [r5, r3]
	mov r1, #3
	bl sub_0200D644
	mov r0, #1
	str r0, [sp]
	ldr r0, _021F1D54 ; =0x0000C558
	ldr r1, _021F1D48 ; =0x00000668
	str r0, [sp, #4]
	ldr r2, _021F1D4C ; =0x00000854
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	mov r3, #0x4e
	bl sub_0200D6EC
	mov r0, #1
	str r0, [sp]
	ldr r0, _021F1D54 ; =0x0000C558
	ldr r1, _021F1D48 ; =0x00000668
	str r0, [sp, #4]
	ldr r2, _021F1D4C ; =0x00000854
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	mov r3, #0x4f
	bl sub_0200D71C
	add sp, #0x18
	pop {r3, r4, r5, pc}
	nop
_021F1D44: .word 0x0000C599
_021F1D48: .word 0x00000668
_021F1D4C: .word 0x00000854
_021F1D50: .word 0x0000C55B
_021F1D54: .word 0x0000C558
	thumb_func_end ov18_021F1CB4

	thumb_func_start ov18_021F1D58
ov18_021F1D58: ; 0x021F1D58
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021F1D88 ; =0x0000066C
	ldr r1, _021F1D8C ; =0x0000C599
	ldr r0, [r4, r0]
	bl sub_0200D958
	ldr r0, _021F1D88 ; =0x0000066C
	ldr r1, _021F1D90 ; =0x0000C55B
	ldr r0, [r4, r0]
	bl sub_0200D968
	ldr r0, _021F1D88 ; =0x0000066C
	ldr r1, _021F1D94 ; =0x0000C558
	ldr r0, [r4, r0]
	bl sub_0200D978
	ldr r0, _021F1D88 ; =0x0000066C
	ldr r1, _021F1D94 ; =0x0000C558
	ldr r0, [r4, r0]
	bl sub_0200D988
	pop {r4, pc}
	nop
_021F1D88: .word 0x0000066C
_021F1D8C: .word 0x0000C599
_021F1D90: .word 0x0000C55B
_021F1D94: .word 0x0000C558
	thumb_func_end ov18_021F1D58

	thumb_func_start ov18_021F1D98
ov18_021F1D98: ; 0x021F1D98
	push {r4, r5, r6, lr}
	mov r2, #0x67
	lsl r2, r2, #4
	add r6, r0, #0
	add r0, r2, #0
	lsl r4, r1, #2
	sub r0, #8
	sub r1, r2, #4
	add r5, r6, r2
	mov r3, #2
	ldr r0, [r6, r0]
	ldr r1, [r6, r1]
	ldr r2, _021F1DD8 ; =_021FA450
	lsl r3, r3, #0x14
	bl sub_0200D740
	str r0, [r5, r4]
	ldr r0, _021F1DDC ; =0x0000066C
	ldr r1, _021F1DE0 ; =0x0000C55B
	ldr r0, [r6, r0]
	mov r2, #2
	bl sub_0200D944
	add r1, r0, #0
	ldr r0, [r5, r4]
	bl sub_0200DD10
	ldr r0, [r5, r4]
	mov r1, #0
	bl sub_0200DCE8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021F1DD8: .word _021FA450
_021F1DDC: .word 0x0000066C
_021F1DE0: .word 0x0000C55B
	thumb_func_end ov18_021F1D98

	thumb_func_start ov18_021F1DE4
ov18_021F1DE4: ; 0x021F1DE4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	ldr r0, _021F1E64 ; =0x0000185C
	add r4, r1, #0
	ldrb r0, [r5, r0]
	add r6, r3, #0
	cmp r0, #2
	bne _021F1E1A
	cmp r4, #0
	beq _021F1E1A
	lsl r0, r2, #2
	add r2, r5, r0
	ldr r0, _021F1E68 ; =0x00001032
	ldrh r0, [r2, r0]
	cmp r0, #1
	beq _021F1E1A
	ldr r0, _021F1E6C ; =0x000001E7
	cmp r4, r0
	bne _021F1E2E
	ldr r0, [r5]
	mov r2, #0
	ldr r0, [r0]
	bl Pokedex_GetSeenFormeByIdx
	cmp r0, #1
	bne _021F1E2E
_021F1E1A:
	lsl r0, r6, #2
	add r1, r5, r0
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0200DCE8
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_021F1E2E:
	lsl r0, r6, #2
	add r1, r5, r0
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #1
	bl sub_0200DCE8
	add r0, r4, #0
	mov r1, #0x25
	bl ov18_021F9694
	add r4, r0, #0
	mov r0, #2
	str r0, [sp]
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	mov r3, #0x80
	bl ov18_021F111C
	add r0, r4, #0
	bl FreeToHeap
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_021F1E64: .word 0x0000185C
_021F1E68: .word 0x00001032
_021F1E6C: .word 0x000001E7
	thumb_func_end ov18_021F1DE4

	thumb_func_start ov18_021F1E70
ov18_021F1E70: ; 0x021F1E70
	push {r4, lr}
	sub sp, #0x18
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _021F1F54 ; =0x0000C593
	ldr r1, _021F1F58 ; =0x00000668
	str r0, [sp, #8]
	ldr r2, _021F1F5C ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x24
	bl sub_0200D504
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _021F1F60 ; =0x0000C594
	ldr r1, _021F1F58 ; =0x00000668
	str r0, [sp, #8]
	ldr r2, _021F1F5C ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x24
	bl sub_0200D504
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _021F1F64 ; =0x0000C595
	ldr r1, _021F1F58 ; =0x00000668
	str r0, [sp, #8]
	ldr r2, _021F1F5C ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x24
	bl sub_0200D504
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _021F1F68 ; =0x0000C596
	ldr r1, _021F1F58 ; =0x00000668
	str r0, [sp, #8]
	ldr r2, _021F1F5C ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x24
	bl sub_0200D504
	ldr r0, _021F1F5C ; =0x00000854
	ldr r3, _021F1F58 ; =0x00000668
	ldr r1, [r4, r0]
	sub r0, r0, #4
	str r1, [sp]
	mov r1, #0x23
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	mov r1, #4
	str r1, [sp, #0xc]
	mov r1, #2
	str r1, [sp, #0x10]
	ldr r1, _021F1F6C ; =0x0000C558
	str r1, [sp, #0x14]
	ldr r2, [r4, r3]
	add r3, r3, #4
	ldr r0, [r4, r0]
	ldr r3, [r4, r3]
	mov r1, #3
	bl sub_0200D68C
	mov r0, #1
	str r0, [sp]
	ldr r0, _021F1F70 ; =0x0000C555
	ldr r1, _021F1F58 ; =0x00000668
	str r0, [sp, #4]
	ldr r2, _021F1F5C ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x21
	bl sub_0200D6EC
	mov r0, #1
	str r0, [sp]
	ldr r0, _021F1F70 ; =0x0000C555
	ldr r1, _021F1F58 ; =0x00000668
	str r0, [sp, #4]
	ldr r2, _021F1F5C ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x22
	bl sub_0200D71C
	add sp, #0x18
	pop {r4, pc}
	nop
_021F1F54: .word 0x0000C593
_021F1F58: .word 0x00000668
_021F1F5C: .word 0x00000854
_021F1F60: .word 0x0000C594
_021F1F64: .word 0x0000C595
_021F1F68: .word 0x0000C596
_021F1F6C: .word 0x0000C558
_021F1F70: .word 0x0000C555
	thumb_func_end ov18_021F1E70

	thumb_func_start ov18_021F1F74
ov18_021F1F74: ; 0x021F1F74
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021F1FC0 ; =0x0000066C
	ldr r1, _021F1FC4 ; =0x0000C593
	ldr r0, [r4, r0]
	bl sub_0200D958
	ldr r0, _021F1FC0 ; =0x0000066C
	ldr r1, _021F1FC8 ; =0x0000C594
	ldr r0, [r4, r0]
	bl sub_0200D958
	ldr r0, _021F1FC0 ; =0x0000066C
	ldr r1, _021F1FCC ; =0x0000C595
	ldr r0, [r4, r0]
	bl sub_0200D958
	ldr r0, _021F1FC0 ; =0x0000066C
	ldr r1, _021F1FD0 ; =0x0000C596
	ldr r0, [r4, r0]
	bl sub_0200D958
	ldr r0, _021F1FC0 ; =0x0000066C
	ldr r1, _021F1FD4 ; =0x0000C558
	ldr r0, [r4, r0]
	bl sub_0200D968
	ldr r0, _021F1FC0 ; =0x0000066C
	ldr r1, _021F1FD8 ; =0x0000C555
	ldr r0, [r4, r0]
	bl sub_0200D978
	ldr r0, _021F1FC0 ; =0x0000066C
	ldr r1, _021F1FD8 ; =0x0000C555
	ldr r0, [r4, r0]
	bl sub_0200D988
	pop {r4, pc}
	.balign 4, 0
_021F1FC0: .word 0x0000066C
_021F1FC4: .word 0x0000C593
_021F1FC8: .word 0x0000C594
_021F1FCC: .word 0x0000C595
_021F1FD0: .word 0x0000C596
_021F1FD4: .word 0x0000C558
_021F1FD8: .word 0x0000C555
	thumb_func_end ov18_021F1F74

	thumb_func_start ov18_021F1FDC
ov18_021F1FDC: ; 0x021F1FDC
	push {r3, r4, r5, r6, lr}
	sub sp, #0x34
	ldr r6, _021F207C ; =_021FA41C
	add r4, r0, #0
	add r2, r1, #0
	add r5, sp, #0
	mov r3, #6
_021F1FEA:
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	sub r3, r3, #1
	bne _021F1FEA
	ldr r0, [r6]
	ldr r1, _021F2080 ; =0x00000668
	str r0, [r5]
	ldr r0, [r4, r1]
	add r1, r1, #4
	mov r3, #2
	lsl r5, r2, #2
	ldr r1, [r4, r1]
	add r2, sp, #0
	lsl r3, r3, #0x14
	bl sub_0200D740
	mov r1, #0x67
	mov r3, #2
	add r2, r4, r5
	lsl r1, r1, #4
	str r0, [r2, r1]
	ldr r0, _021F2084 ; =0x0000C595
	add r2, sp, #0
	str r0, [sp, #0x14]
	add r0, r1, #0
	sub r0, #8
	sub r1, r1, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	lsl r3, r3, #0x14
	bl sub_0200D740
	mov r3, #2
	ldr r1, _021F2088 ; =0x00000678
	add r2, r4, r5
	str r0, [r2, r1]
	add r2, sp, #0
	mov r0, #0
	ldrsh r0, [r2, r0]
	lsl r3, r3, #0x14
	add r0, #0x31
	strh r0, [r2]
	ldr r0, _021F208C ; =0x0000C594
	add r2, sp, #0
	str r0, [sp, #0x14]
	add r0, r1, #0
	sub r0, #0x10
	sub r1, #0xc
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	bl sub_0200D740
	mov r3, #2
	ldr r1, _021F2090 ; =0x00000674
	add r2, r4, r5
	str r0, [r2, r1]
	ldr r0, _021F2094 ; =0x0000C596
	add r2, sp, #0
	str r0, [sp, #0x14]
	add r0, r1, #0
	sub r0, #0xc
	sub r1, #8
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	lsl r3, r3, #0x14
	bl sub_0200D740
	ldr r1, _021F2098 ; =0x0000067C
	add r2, r4, r5
	str r0, [r2, r1]
	add sp, #0x34
	pop {r3, r4, r5, r6, pc}
	nop
_021F207C: .word _021FA41C
_021F2080: .word 0x00000668
_021F2084: .word 0x0000C595
_021F2088: .word 0x00000678
_021F208C: .word 0x0000C594
_021F2090: .word 0x00000674
_021F2094: .word 0x0000C596
_021F2098: .word 0x0000067C
	thumb_func_end ov18_021F1FDC

	thumb_func_start ov18_021F209C
ov18_021F209C: ; 0x021F209C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r1, #0
	ldr r1, _021F21E4 ; =0x0000185C
	add r5, r0, #0
	ldrb r0, [r5, r1]
	add r4, r3, #0
	cmp r0, #2
	bne _021F20BE
	cmp r6, #0
	beq _021F20BE
	lsl r0, r2, #2
	add r2, r5, r0
	ldr r0, _021F21E8 ; =0x00001032
	ldrh r0, [r2, r0]
	cmp r0, #1
	bne _021F20F6
_021F20BE:
	lsl r4, r4, #2
	mov r0, #0x67
	add r1, r5, r4
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, _021F21EC ; =0x00000674
	add r1, r5, r4
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, _021F21F0 ; =0x00000678
	add r1, r5, r4
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, _021F21F4 ; =0x0000067C
	add r1, r5, r4
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0200DCE8
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_021F20F6:
	add r0, r1, #3
	ldrb r0, [r5, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	bne _021F2120
	lsl r7, r4, #2
	mov r0, #0x67
	add r1, r5, r7
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, _021F21EC ; =0x00000674
	add r1, r5, r7
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0200DCE8
	add r4, r4, #2
	b _021F213A
_021F2120:
	lsl r7, r4, #2
	ldr r0, _021F21F0 ; =0x00000678
	add r1, r5, r7
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, _021F21F4 ; =0x0000067C
	add r1, r5, r7
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0200DCE8
_021F213A:
	ldr r0, _021F21F8 ; =0x0000185F
	mov r2, #0xf0
	ldrb r3, [r5, r0]
	add r1, r3, #0
	bic r1, r2
	lsl r2, r3, #0x18
	lsr r3, r2, #0x1c
	mov r2, #1
	eor r2, r3
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	lsl r2, r2, #0x1c
	lsr r2, r2, #0x18
	orr r1, r2
	strb r1, [r5, r0]
	ldr r0, [r5]
	add r1, r6, #0
	ldr r0, [r0]
	mov r2, #0
	bl Pokedex_GetSeenFormeByIdx
	add r7, r0, #0
	cmp r6, #0xac
	bne _021F2174
	cmp r7, #2
	bne _021F2172
	mov r7, #1
	b _021F2174
_021F2172:
	mov r7, #0
_021F2174:
	add r0, r6, #0
	add r1, r7, #0
	mov r2, #6
	bl GetMonBaseStat_HandleAlternateForme
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #4]
	ldr r2, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	bl ov18_021F21FC
	lsl r0, r4, #2
	str r0, [sp]
	add r1, r5, r0
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #1
	bl sub_0200DCE8
	add r0, r6, #0
	add r1, r7, #0
	mov r2, #7
	bl GetMonBaseStat_HandleAlternateForme
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
	beq _021F21B6
	ldr r0, [sp, #4]
	cmp r0, r2
	bne _021F21C8
_021F21B6:
	ldr r0, [sp]
	add r1, r5, r0
	ldr r0, _021F21EC ; =0x00000674
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0200DCE8
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_021F21C8:
	add r0, r5, #0
	add r1, r4, #1
	bl ov18_021F21FC
	ldr r0, [sp]
	add r1, r5, r0
	ldr r0, _021F21EC ; =0x00000674
	ldr r0, [r1, r0]
	mov r1, #1
	bl sub_0200DCE8
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F21E4: .word 0x0000185C
_021F21E8: .word 0x00001032
_021F21EC: .word 0x00000674
_021F21F0: .word 0x00000678
_021F21F4: .word 0x0000067C
_021F21F8: .word 0x0000185F
	thumb_func_end ov18_021F209C

	thumb_func_start ov18_021F21FC
ov18_021F21FC: ; 0x021F21FC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r0, r2, #0
	add r4, r1, #0
	str r2, [sp, #4]
	bl ov18_021F967C
	add r1, r0, #0
	mov r0, #0x25
	str r0, [sp]
	ldr r0, _021F2264 ; =0x00000854
	mov r2, #1
	ldr r0, [r5, r0]
	add r3, sp, #8
	bl GfGfxLoader_GetCharDataFromOpenNarc
	add r7, r0, #0
	mov r0, #2
	str r0, [sp]
	ldr r2, [sp, #8]
	mov r3, #6
	ldr r2, [r2, #0x14]
	add r0, r5, #0
	add r1, r4, #0
	lsl r3, r3, #6
	bl ov18_021F111C
	ldr r0, _021F2268 ; =0x0000066C
	ldr r1, _021F226C ; =0x0000C558
	ldr r0, [r5, r0]
	mov r2, #2
	bl sub_0200D944
	add r6, r0, #0
	ldr r0, [sp, #4]
	bl ov18_021F9688
	add r1, r0, #0
	lsl r0, r4, #2
	add r2, r5, r0
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r2, r0]
	add r1, r6, r1
	bl sub_0200DD10
	add r0, r7, #0
	bl FreeToHeap
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021F2264: .word 0x00000854
_021F2268: .word 0x0000066C
_021F226C: .word 0x0000C558
	thumb_func_end ov18_021F21FC

	thumb_func_start ov18_021F2270
ov18_021F2270: ; 0x021F2270
	push {r4, lr}
	sub sp, #0x18
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021F22F4 ; =0x0000C597
	ldr r1, _021F22F8 ; =0x00000668
	str r0, [sp, #8]
	ldr r2, _021F22FC ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x35
	bl sub_0200D504
	ldr r0, _021F22FC ; =0x00000854
	ldr r3, _021F22F8 ; =0x00000668
	ldr r1, [r4, r0]
	sub r0, r0, #4
	str r1, [sp]
	mov r1, #0x38
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	mov r1, #1
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r1, _021F2300 ; =0x0000C559
	str r1, [sp, #0x14]
	ldr r2, [r4, r3]
	add r3, r3, #4
	ldr r0, [r4, r0]
	ldr r3, [r4, r3]
	mov r1, #2
	bl sub_0200D68C
	mov r0, #1
	str r0, [sp]
	ldr r0, _021F2304 ; =0x0000C556
	ldr r1, _021F22F8 ; =0x00000668
	str r0, [sp, #4]
	ldr r2, _021F22FC ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x36
	bl sub_0200D6EC
	mov r0, #1
	str r0, [sp]
	ldr r0, _021F2304 ; =0x0000C556
	ldr r1, _021F22F8 ; =0x00000668
	str r0, [sp, #4]
	ldr r2, _021F22FC ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x37
	bl sub_0200D71C
	add sp, #0x18
	pop {r4, pc}
	.balign 4, 0
_021F22F4: .word 0x0000C597
_021F22F8: .word 0x00000668
_021F22FC: .word 0x00000854
_021F2300: .word 0x0000C559
_021F2304: .word 0x0000C556
	thumb_func_end ov18_021F2270

	thumb_func_start ov18_021F2308
ov18_021F2308: ; 0x021F2308
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021F2338 ; =0x0000066C
	ldr r1, _021F233C ; =0x0000C597
	ldr r0, [r4, r0]
	bl sub_0200D958
	ldr r0, _021F2338 ; =0x0000066C
	ldr r1, _021F2340 ; =0x0000C559
	ldr r0, [r4, r0]
	bl sub_0200D968
	ldr r0, _021F2338 ; =0x0000066C
	ldr r1, _021F2344 ; =0x0000C556
	ldr r0, [r4, r0]
	bl sub_0200D978
	ldr r0, _021F2338 ; =0x0000066C
	ldr r1, _021F2344 ; =0x0000C556
	ldr r0, [r4, r0]
	bl sub_0200D988
	pop {r4, pc}
	nop
_021F2338: .word 0x0000066C
_021F233C: .word 0x0000C597
_021F2340: .word 0x0000C559
_021F2344: .word 0x0000C556
	thumb_func_end ov18_021F2308

	thumb_func_start ov18_021F2348
ov18_021F2348: ; 0x021F2348
	push {r4, lr}
	sub sp, #0x18
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _021F23D0 ; =0x0000C598
	ldr r1, _021F23D4 ; =0x00000668
	str r0, [sp, #8]
	ldr r2, _021F23D8 ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x35
	bl sub_0200D504
	ldr r0, _021F23D8 ; =0x00000854
	ldr r3, _021F23D4 ; =0x00000668
	ldr r1, [r4, r0]
	sub r0, r0, #4
	str r1, [sp]
	mov r1, #0x38
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	mov r1, #1
	str r1, [sp, #0xc]
	mov r1, #2
	str r1, [sp, #0x10]
	ldr r1, _021F23DC ; =0x0000C55A
	str r1, [sp, #0x14]
	ldr r2, [r4, r3]
	add r3, r3, #4
	ldr r0, [r4, r0]
	ldr r3, [r4, r3]
	mov r1, #3
	bl sub_0200D68C
	mov r0, #1
	str r0, [sp]
	ldr r0, _021F23E0 ; =0x0000C557
	ldr r1, _021F23D4 ; =0x00000668
	str r0, [sp, #4]
	ldr r2, _021F23D8 ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x36
	bl sub_0200D6EC
	mov r0, #1
	str r0, [sp]
	ldr r0, _021F23E0 ; =0x0000C557
	ldr r1, _021F23D4 ; =0x00000668
	str r0, [sp, #4]
	ldr r2, _021F23D8 ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x37
	bl sub_0200D71C
	add sp, #0x18
	pop {r4, pc}
	.balign 4, 0
_021F23D0: .word 0x0000C598
_021F23D4: .word 0x00000668
_021F23D8: .word 0x00000854
_021F23DC: .word 0x0000C55A
_021F23E0: .word 0x0000C557
	thumb_func_end ov18_021F2348

	thumb_func_start ov18_021F23E4
ov18_021F23E4: ; 0x021F23E4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021F2414 ; =0x0000066C
	ldr r1, _021F2418 ; =0x0000C598
	ldr r0, [r4, r0]
	bl sub_0200D958
	ldr r0, _021F2414 ; =0x0000066C
	ldr r1, _021F241C ; =0x0000C55A
	ldr r0, [r4, r0]
	bl sub_0200D968
	ldr r0, _021F2414 ; =0x0000066C
	ldr r1, _021F2420 ; =0x0000C557
	ldr r0, [r4, r0]
	bl sub_0200D978
	ldr r0, _021F2414 ; =0x0000066C
	ldr r1, _021F2420 ; =0x0000C557
	ldr r0, [r4, r0]
	bl sub_0200D988
	pop {r4, pc}
	nop
_021F2414: .word 0x0000066C
_021F2418: .word 0x0000C598
_021F241C: .word 0x0000C55A
_021F2420: .word 0x0000C557
	thumb_func_end ov18_021F23E4

	thumb_func_start ov18_021F2424
ov18_021F2424: ; 0x021F2424
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r2, #0x30]
	add r4, r1, #0
	cmp r0, #1
	ldr r1, _021F2464 ; =0x00000668
	bne _021F2448
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl sub_0200D734
	lsl r1, r4, #2
	add r2, r5, r1
	mov r1, #0x67
	lsl r1, r1, #4
	str r0, [r2, r1]
	pop {r3, r4, r5, pc}
_021F2448:
	ldr r0, [r5, r1]
	add r1, r1, #4
	mov r3, #2
	ldr r1, [r5, r1]
	lsl r3, r3, #0x14
	bl sub_0200D740
	lsl r1, r4, #2
	add r2, r5, r1
	mov r1, #0x67
	lsl r1, r1, #4
	str r0, [r2, r1]
	pop {r3, r4, r5, pc}
	nop
_021F2464: .word 0x00000668
	thumb_func_end ov18_021F2424

	thumb_func_start ov18_021F2468
ov18_021F2468: ; 0x021F2468
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	ldr r4, _021F24D0 ; =_021FA484
	add r7, r0, #0
	add r3, sp, #0
	mov r2, #6
_021F2474:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021F2474
	ldr r0, [r4]
	mov r4, #0x1b
	add r5, r7, #0
	str r0, [r3]
	mov r6, #0x12
	lsl r4, r4, #4
	add r5, #0x48
_021F248A:
	mov r0, #0x4d
	lsl r0, r0, #2
	sub r1, r4, r0
	add r0, sp, #0
	strh r1, [r0]
	add r0, r7, #0
	add r1, r6, #0
	add r2, sp, #0
	bl ov18_021F2424
	ldr r0, _021F24D4 ; =0x0000066C
	ldr r1, _021F24D8 ; =0x0000C55A
	ldr r0, [r7, r0]
	mov r2, #2
	bl sub_0200D944
	add r1, r0, #0
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_0200DD10
	add r6, r6, #1
	add r4, #0x18
	add r5, r5, #4
	cmp r6, #0x17
	bls _021F248A
	ldr r2, _021F24DC ; =_021FAB24
	add r0, r7, #0
	mov r1, #8
	bl ov18_021F2424
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_021F24D0: .word _021FA484
_021F24D4: .word 0x0000066C
_021F24D8: .word 0x0000C55A
_021F24DC: .word _021FAB24
	thumb_func_end ov18_021F2468

	thumb_func_start ov18_021F24E0
ov18_021F24E0: ; 0x021F24E0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	cmp r1, #0
	beq _021F24F6
	ldr r0, [r5]
	ldr r0, [r0]
	bl Pokedex_GetInternationalViewFlag
	cmp r0, #0
	bne _021F2508
_021F24F6:
	lsl r0, r4, #2
	add r1, r5, r0
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0200DCE8
	pop {r3, r4, r5, pc}
_021F2508:
	ldr r0, _021F252C ; =0x0000185C
	ldrb r0, [r5, r0]
	bl LanguageToDexFlag
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov18_021F118C
	lsl r0, r4, #2
	add r1, r5, r0
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #1
	bl sub_0200DCE8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021F252C: .word 0x0000185C
	thumb_func_end ov18_021F24E0

	thumb_func_start ov18_021F2530
ov18_021F2530: ; 0x021F2530
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r1, [sp]
	add r6, r0, #0
	ldr r0, [sp]
	str r2, [sp, #4]
	cmp r0, #0
	beq _021F254C
	ldr r0, [r6]
	ldr r0, [r0]
	bl Pokedex_GetInternationalViewFlag
	cmp r0, #0
	bne _021F257A
_021F254C:
	ldr r0, [sp, #4]
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	ldr r0, [sp, #4]
	add r7, r0, #6
	cmp r4, r7
	bhs _021F263E
	lsl r0, r4, #2
	add r5, r6, r0
	mov r6, #0x67
	lsl r6, r6, #4
_021F2562:
	ldr r0, [r5, r6]
	mov r1, #0
	bl sub_0200DCE8
	add r0, r4, #1
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	add r5, r5, #4
	cmp r4, r7
	blo _021F2562
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_021F257A:
	ldr r0, [sp, #4]
	mov r7, #0
	add r0, r0, #5
	lsl r0, r0, #0x10
	asr r5, r0, #0x10
	ldr r0, [sp, #4]
	cmp r5, r0
	blo _021F263E
	lsl r0, r5, #2
	add r4, r6, r0
_021F258E:
	ldr r0, [sp, #4]
	sub r0, r5, r0
	str r0, [sp, #8]
	bl sub_020912AC
	bl sub_02091294
	str r0, [sp, #0xc]
	ldr r2, [sp, #0xc]
	ldr r1, [sp]
	lsl r2, r2, #0x10
	add r0, r6, #0
	lsr r2, r2, #0x10
	bl ov18_021E6D10
	cmp r0, #1
	beq _021F25B6
	ldr r0, [sp, #0xc]
	cmp r0, #2
	bne _021F2624
_021F25B6:
	ldr r0, _021F2644 ; =0x0000185C
	ldrb r0, [r6, r0]
	bl LanguageToDexFlag
	str r0, [sp, #0x10]
	ldr r0, [sp, #8]
	bl sub_020912AC
	add r2, r0, #0
	ldr r0, [sp, #0x10]
	cmp r2, r0
	bne _021F25D8
	add r0, r6, #0
	add r1, r5, #0
	bl ov18_021F118C
	b _021F25E2
_021F25D8:
	add r0, r6, #0
	add r1, r5, #0
	add r2, r2, #6
	bl ov18_021F118C
_021F25E2:
	mov r0, #0x67
	lsl r0, r0, #4
	add r1, sp, #0x14
	ldr r0, [r4, r0]
	add r1, #2
	add r2, sp, #0x14
	bl sub_0200DE44
	mov r1, #5
	sub r2, r1, r7
	mov r1, #0x18
	mul r1, r2
	mov r0, #0x67
	lsl r0, r0, #4
	add r1, #0x7c
	lsl r1, r1, #0x10
	add r3, sp, #0x14
	mov r2, #0
	ldrsh r2, [r3, r2]
	ldr r0, [r4, r0]
	asr r1, r1, #0x10
	bl sub_0200DDB8
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_0200DCE8
	add r0, r7, #1
	lsl r0, r0, #0x10
	asr r7, r0, #0x10
	b _021F2630
_021F2624:
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DCE8
_021F2630:
	sub r0, r5, #1
	lsl r0, r0, #0x10
	asr r5, r0, #0x10
	ldr r0, [sp, #4]
	sub r4, r4, #4
	cmp r5, r0
	bhs _021F258E
_021F263E:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F2644: .word 0x0000185C
	thumb_func_end ov18_021F2530

	thumb_func_start ov18_021F2648
ov18_021F2648: ; 0x021F2648
	push {r4, lr}
	sub sp, #0x18
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021F26D0 ; =0x0000C590
	ldr r1, _021F26D4 ; =0x00000668
	str r0, [sp, #8]
	ldr r2, _021F26D8 ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0xc
	bl sub_0200D504
	ldr r0, _021F26D8 ; =0x00000854
	ldr r3, _021F26D4 ; =0x00000668
	ldr r1, [r4, r0]
	sub r0, r0, #4
	str r1, [sp]
	mov r1, #0xf
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	mov r1, #5
	str r1, [sp, #0xc]
	mov r1, #1
	str r1, [sp, #0x10]
	ldr r1, _021F26DC ; =0x0000C556
	str r1, [sp, #0x14]
	ldr r2, [r4, r3]
	add r3, r3, #4
	ldr r0, [r4, r0]
	ldr r3, [r4, r3]
	mov r1, #2
	bl sub_0200D68C
	mov r0, #1
	str r0, [sp]
	ldr r0, _021F26E0 ; =0x0000C552
	ldr r1, _021F26D4 ; =0x00000668
	str r0, [sp, #4]
	ldr r2, _021F26D8 ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0xd
	bl sub_0200D6EC
	mov r0, #1
	str r0, [sp]
	ldr r0, _021F26E0 ; =0x0000C552
	ldr r1, _021F26D4 ; =0x00000668
	str r0, [sp, #4]
	ldr r2, _021F26D8 ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0xe
	bl sub_0200D71C
	add sp, #0x18
	pop {r4, pc}
	nop
_021F26D0: .word 0x0000C590
_021F26D4: .word 0x00000668
_021F26D8: .word 0x00000854
_021F26DC: .word 0x0000C556
_021F26E0: .word 0x0000C552
	thumb_func_end ov18_021F2648

	thumb_func_start ov18_021F26E4
ov18_021F26E4: ; 0x021F26E4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021F2714 ; =0x0000066C
	ldr r1, _021F2718 ; =0x0000C590
	ldr r0, [r4, r0]
	bl sub_0200D958
	ldr r0, _021F2714 ; =0x0000066C
	ldr r1, _021F271C ; =0x0000C556
	ldr r0, [r4, r0]
	bl sub_0200D968
	ldr r0, _021F2714 ; =0x0000066C
	ldr r1, _021F2720 ; =0x0000C552
	ldr r0, [r4, r0]
	bl sub_0200D978
	ldr r0, _021F2714 ; =0x0000066C
	ldr r1, _021F2720 ; =0x0000C552
	ldr r0, [r4, r0]
	bl sub_0200D988
	pop {r4, pc}
	nop
_021F2714: .word 0x0000066C
_021F2718: .word 0x0000C590
_021F271C: .word 0x0000C556
_021F2720: .word 0x0000C552
	thumb_func_end ov18_021F26E4

	thumb_func_start ov18_021F2724
ov18_021F2724: ; 0x021F2724
	push {r4, lr}
	sub sp, #0x18
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _021F2800 ; =0x0000C591
	ldr r1, _021F2804 ; =0x00000668
	str r0, [sp, #8]
	ldr r2, _021F2808 ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x1a
	bl sub_0200D504
	ldr r0, _021F2808 ; =0x00000854
	ldr r3, _021F2804 ; =0x00000668
	ldr r1, [r4, r0]
	sub r0, r0, #4
	str r1, [sp]
	mov r1, #0x20
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	mov r1, #1
	str r1, [sp, #0xc]
	mov r1, #2
	str r1, [sp, #0x10]
	ldr r1, _021F280C ; =0x0000C557
	str r1, [sp, #0x14]
	ldr r2, [r4, r3]
	add r3, r3, #4
	ldr r0, [r4, r0]
	ldr r3, [r4, r3]
	mov r1, #3
	bl sub_0200D68C
	mov r0, #1
	str r0, [sp]
	ldr r0, _021F2810 ; =0x0000C553
	ldr r1, _021F2804 ; =0x00000668
	str r0, [sp, #4]
	ldr r2, _021F2808 ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x1b
	bl sub_0200D6EC
	mov r0, #1
	str r0, [sp]
	ldr r0, _021F2810 ; =0x0000C553
	ldr r1, _021F2804 ; =0x00000668
	str r0, [sp, #4]
	ldr r2, _021F2808 ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x1c
	bl sub_0200D71C
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _021F2814 ; =0x0000C592
	ldr r1, _021F2804 ; =0x00000668
	str r0, [sp, #8]
	ldr r2, _021F2808 ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x1d
	bl sub_0200D504
	mov r0, #1
	str r0, [sp]
	ldr r0, _021F2818 ; =0x0000C554
	ldr r1, _021F2804 ; =0x00000668
	str r0, [sp, #4]
	ldr r2, _021F2808 ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x1e
	bl sub_0200D6EC
	mov r0, #1
	str r0, [sp]
	ldr r0, _021F2818 ; =0x0000C554
	ldr r1, _021F2804 ; =0x00000668
	str r0, [sp, #4]
	ldr r2, _021F2808 ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x1f
	bl sub_0200D71C
	add sp, #0x18
	pop {r4, pc}
	nop
_021F2800: .word 0x0000C591
_021F2804: .word 0x00000668
_021F2808: .word 0x00000854
_021F280C: .word 0x0000C557
_021F2810: .word 0x0000C553
_021F2814: .word 0x0000C592
_021F2818: .word 0x0000C554
	thumb_func_end ov18_021F2724

	thumb_func_start ov18_021F281C
ov18_021F281C: ; 0x021F281C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021F2868 ; =0x0000066C
	ldr r1, _021F286C ; =0x0000C591
	ldr r0, [r4, r0]
	bl sub_0200D958
	ldr r0, _021F2868 ; =0x0000066C
	ldr r1, _021F2870 ; =0x0000C557
	ldr r0, [r4, r0]
	bl sub_0200D968
	ldr r0, _021F2868 ; =0x0000066C
	ldr r1, _021F2874 ; =0x0000C553
	ldr r0, [r4, r0]
	bl sub_0200D978
	ldr r0, _021F2868 ; =0x0000066C
	ldr r1, _021F2874 ; =0x0000C553
	ldr r0, [r4, r0]
	bl sub_0200D988
	ldr r0, _021F2868 ; =0x0000066C
	ldr r1, _021F2878 ; =0x0000C592
	ldr r0, [r4, r0]
	bl sub_0200D958
	ldr r0, _021F2868 ; =0x0000066C
	ldr r1, _021F287C ; =0x0000C554
	ldr r0, [r4, r0]
	bl sub_0200D978
	ldr r0, _021F2868 ; =0x0000066C
	ldr r1, _021F287C ; =0x0000C554
	ldr r0, [r4, r0]
	bl sub_0200D988
	pop {r4, pc}
	.balign 4, 0
_021F2868: .word 0x0000066C
_021F286C: .word 0x0000C591
_021F2870: .word 0x0000C557
_021F2874: .word 0x0000C553
_021F2878: .word 0x0000C592
_021F287C: .word 0x0000C554
	thumb_func_end ov18_021F281C

	thumb_func_start ov18_021F2880
ov18_021F2880: ; 0x021F2880
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ov18_021F2964
	add r0, r5, #0
	mov r1, #0x18
	bl ov18_021F1424
	add r0, r5, #0
	mov r1, #0x18
	bl ov18_021F1620
	add r0, r5, #0
	bl ov18_021F299C
	ldr r0, _021F2960 ; =0x00001860
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _021F28B4
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_0200DCE8
	b _021F28BC
_021F28B4:
	add r0, r5, #0
	mov r1, #0
	bl ov18_021F2AC0
_021F28BC:
	add r0, r5, #0
	mov r1, #5
	bl ov18_021F2BB0
	add r0, r5, #0
	mov r1, #2
	mov r2, #1
	bl ov18_021F2C10
	mov r1, #1
	add r0, r5, #0
	add r2, r1, #0
	bl ov18_021F2C5C
	mov r1, #1
	add r0, r5, #0
	add r2, r1, #0
	bl ov18_021F2E80
	add r0, r5, #0
	bl ov18_021F8838
	add r4, r0, #0
	add r0, r5, #0
	bl ov18_021F8824
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0xb
	bl ov18_021F1A30
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0xb
	mov r3, #0xa
	bl ov18_021F1CAC
	add r0, r5, #0
	mov r1, #0xe
	bl ov18_021F1FDC
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #0xe
	bl ov18_021F209C
	add r0, r5, #0
	mov r1, #0xd
	bl ov18_021F1D98
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #0xd
	bl ov18_021F1DE4
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #9
	bl ov18_021F2EC8
	add r0, r5, #0
	bl ov18_021F2468
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x12
	bl ov18_021F2530
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #8
	bl ov18_021F24E0
	mov r0, #0x69
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_0200DCE8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021F2960: .word 0x00001860
	thumb_func_end ov18_021F2880

	thumb_func_start ov18_021F2964
ov18_021F2964: ; 0x021F2964
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0x3c
	bl ov18_021F1324
	add r0, r4, #0
	bl ov18_021F2648
	add r0, r4, #0
	bl ov18_021F2270
	add r0, r4, #0
	bl ov18_021F17FC
	add r0, r4, #0
	bl ov18_021F1CB4
	add r0, r4, #0
	bl ov18_021F1E70
	add r0, r4, #0
	bl ov18_021F2724
	add r0, r4, #0
	bl ov18_021F2348
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov18_021F2964

	thumb_func_start ov18_021F299C
ov18_021F299C: ; 0x021F299C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r6, _021F2A0C ; =_021FA984
	mov r7, #0
	add r4, r5, #0
_021F29A6:
	ldr r0, _021F2A10 ; =0x00000668
	ldr r1, _021F2A14 ; =0x0000066C
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r6, #0
	bl sub_0200D734
	mov r1, #0x67
	lsl r1, r1, #4
	str r0, [r4, r1]
	add r7, r7, #1
	add r6, #0x34
	add r4, r4, #4
	cmp r7, #7
	bls _021F29A6
	add r0, r1, #0
	add r0, #0x18
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, _021F2A18 ; =0x0000068C
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_0200DCE8
	ldr r1, _021F2A10 ; =0x00000668
	mov r3, #2
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	ldr r2, _021F2A1C ; =_021FAB58
	lsl r3, r3, #0x14
	bl sub_0200D740
	ldr r1, _021F2A20 ; =0x00000694
	mov r3, #2
	str r0, [r5, r1]
	add r0, r1, #0
	sub r0, #0x2c
	sub r1, #0x28
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, _021F2A24 ; =_021FAB8C
	lsl r3, r3, #0x14
	bl sub_0200D740
	ldr r1, _021F2A28 ; =0x00000698
	str r0, [r5, r1]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F2A0C: .word _021FA984
_021F2A10: .word 0x00000668
_021F2A14: .word 0x0000066C
_021F2A18: .word 0x0000068C
_021F2A1C: .word _021FAB58
_021F2A20: .word 0x00000694
_021F2A24: .word _021FAB8C
_021F2A28: .word 0x00000698
	thumb_func_end ov18_021F299C

	thumb_func_start ov18_021F2A2C
ov18_021F2A2C: ; 0x021F2A2C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	cmp r2, #1
	bne _021F2A60
	ldr r0, [r4]
	ldr r0, [r0]
	bl Pokedex_GetInternationalViewFlag
	cmp r0, #1
	bne _021F2A60
	lsl r5, r5, #2
	mov r0, #0x67
	add r1, r4, r5
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #1
	bl sub_0200DCE8
	ldr r0, _021F2A80 ; =0x00000674
	add r1, r4, r5
	ldr r0, [r1, r0]
	mov r1, #1
	bl sub_0200DCE8
	pop {r3, r4, r5, pc}
_021F2A60:
	lsl r5, r5, #2
	mov r0, #0x67
	add r1, r4, r5
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, _021F2A80 ; =0x00000674
	add r1, r4, r5
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0200DCE8
	pop {r3, r4, r5, pc}
	nop
_021F2A80: .word 0x00000674
	thumb_func_end ov18_021F2A2C

	thumb_func_start ov18_021F2A84
ov18_021F2A84: ; 0x021F2A84
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r2, #1
	bne _021F2AAC
	ldr r0, [r5]
	ldr r0, [r0]
	bl Pokedex_GetInternationalViewFlag
	cmp r0, #1
	bne _021F2AAC
	lsl r0, r4, #2
	add r1, r5, r0
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #1
	bl sub_0200DCE8
	pop {r3, r4, r5, pc}
_021F2AAC:
	lsl r0, r4, #2
	add r1, r5, r0
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0200DCE8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov18_021F2A84

	thumb_func_start ov18_021F2AC0
ov18_021F2AC0: ; 0x021F2AC0
	push {r3, lr}
	ldr r2, _021F2AF4 ; =0x00001858
	ldrb r2, [r0, r2]
	cmp r2, #0
	bne _021F2ADE
	lsl r1, r1, #2
	add r1, r0, r1
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #0x90
	mov r2, #0x80
	bl sub_0200DDB8
	pop {r3, pc}
_021F2ADE:
	lsl r1, r1, #2
	add r1, r0, r1
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #0x70
	mov r2, #0x80
	bl sub_0200DDB8
	pop {r3, pc}
	nop
_021F2AF4: .word 0x00001858
	thumb_func_end ov18_021F2AC0

	thumb_func_start ov18_021F2AF8
ov18_021F2AF8: ; 0x021F2AF8
	push {r3, r4, r5, lr}
	add r5, r1, #0
	mov r1, #0x67
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	add r1, sp, #0
	add r4, r2, #0
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	add r1, sp, #0
	mov r0, #2
	ldrsh r2, [r1, r0]
	add r0, r2, #0
	sub r0, #0x10
	cmp r5, r0
	blo _021F2B38
	add r2, #0x10
	cmp r5, r2
	bhs _021F2B38
	mov r0, #0
	ldrsh r1, [r1, r0]
	add r0, r1, #0
	sub r0, #0x10
	cmp r4, r0
	blo _021F2B38
	add r1, #0x10
	cmp r4, r1
	bhs _021F2B38
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F2B38:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov18_021F2AF8

	thumb_func_start ov18_021F2B3C
ov18_021F2B3C: ; 0x021F2B3C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r2, #0
	mov r2, #0x67
	lsl r2, r2, #4
	add r5, r0, r2
	lsl r4, r1, #2
	add r1, sp, #0
	ldr r0, [r5, r4]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	add r3, sp, #0
	mov r1, #2
	ldrsh r1, [r3, r1]
	mov r2, #0
	ldrsh r2, [r3, r2]
	add r1, r1, r6
	lsl r1, r1, #0x10
	ldr r0, [r5, r4]
	asr r1, r1, #0x10
	bl sub_0200DDB8
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov18_021F2B3C

	thumb_func_start ov18_021F2B70
ov18_021F2B70: ; 0x021F2B70
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r2, #0
	mov r2, #0x67
	lsl r2, r2, #4
	add r5, r0, r2
	lsl r4, r1, #2
	add r1, sp, #0
	ldr r0, [r5, r4]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	add r3, sp, #0
	mov r2, #0
	ldrsh r2, [r3, r2]
	ldr r0, [r5, r4]
	add r1, r6, #0
	bl sub_0200DDB8
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov18_021F2B70

	thumb_func_start ov18_021F2B9C
ov18_021F2B9C: ; 0x021F2B9C
	ldr r1, _021F2BAC ; =0x00001858
	ldrb r0, [r0, r1]
	cmp r0, #0
	bne _021F2BA8
	mov r0, #0x90
	bx lr
_021F2BA8:
	mov r0, #0x70
	bx lr
	.balign 4, 0
_021F2BAC: .word 0x00001858
	thumb_func_end ov18_021F2B9C

	thumb_func_start ov18_021F2BB0
ov18_021F2BB0: ; 0x021F2BB0
	push {r3, r4, r5, r6, r7, lr}
	ldr r2, _021F2BF8 ; =0x0000185A
	lsl r4, r1, #2
	ldrb r6, [r0, r2]
	mov r2, #0x67
	lsl r2, r2, #4
	add r5, r0, r2
	add r0, r6, #0
	mov r1, #5
	bl _s32_div_f
	add r7, r1, #0
	add r0, r6, #0
	mov r1, #5
	bl _s32_div_f
	add r3, r0, #0
	mov r2, #0x28
	add r1, r7, #0
	mul r1, r2
	mul r2, r3
	add r1, #0x30
	add r2, #0x18
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	ldr r0, [r5, r4]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl sub_0200DDB8
	ldr r0, [r5, r4]
	mov r1, #1
	bl sub_0200DCE8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F2BF8: .word 0x0000185A
	thumb_func_end ov18_021F2BB0

	thumb_func_start ov18_021F2BFC
ov18_021F2BFC: ; 0x021F2BFC
	ldr r1, _021F2C08 ; =0x00000684
	ldr r3, _021F2C0C ; =sub_0200DCE8
	ldr r0, [r0, r1]
	mov r1, #0
	bx r3
	nop
_021F2C08: .word 0x00000684
_021F2C0C: .word sub_0200DCE8
	thumb_func_end ov18_021F2BFC

	thumb_func_start ov18_021F2C10
ov18_021F2C10: ; 0x021F2C10
	push {r4, r5, r6, lr}
	add r6, r2, #0
	ldr r2, _021F2C58 ; =0x00001859
	add r5, r0, #0
	ldrb r2, [r5, r2]
	add r4, r1, #0
	cmp r2, #0
	bne _021F2C28
	mov r2, #7
	bl ov18_021F118C
	b _021F2C2E
_021F2C28:
	mov r2, #5
	bl ov18_021F118C
_021F2C2E:
	add r0, r5, #0
	add r1, r6, #0
	bl ov18_021F8950
	ldr r1, _021F2C58 ; =0x00001859
	ldrb r1, [r5, r1]
	cmp r1, r0
	bne _021F2C4A
	add r0, r5, #0
	add r1, r4, #1
	mov r2, #0xa
	bl ov18_021F118C
	pop {r4, r5, r6, pc}
_021F2C4A:
	add r0, r5, #0
	add r1, r4, #1
	mov r2, #8
	bl ov18_021F118C
	pop {r4, r5, r6, pc}
	nop
_021F2C58: .word 0x00001859
	thumb_func_end ov18_021F2C10

	thumb_func_start ov18_021F2C5C
ov18_021F2C5C: ; 0x021F2C5C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r1, r2, #0
	bl ov18_021F2C74
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov18_021F118C
	pop {r3, r4, r5, pc}
	thumb_func_end ov18_021F2C5C

	thumb_func_start ov18_021F2C74
ov18_021F2C74: ; 0x021F2C74
	push {r3, lr}
	bl ov18_021F891C
	ldr r3, _021F2C94 ; =_021FA398
	mov r2, #0
_021F2C7E:
	ldrh r1, [r3]
	cmp r0, r1
	bls _021F2C8C
	add r2, r2, #1
	add r3, r3, #2
	cmp r2, #0xc
	blo _021F2C7E
_021F2C8C:
	add r2, #0xb
	add r0, r2, #0
	pop {r3, pc}
	nop
_021F2C94: .word _021FA398
	thumb_func_end ov18_021F2C74

	thumb_func_start ov18_021F2C98
ov18_021F2C98: ; 0x021F2C98
	push {r3, lr}
	lsl r1, r1, #2
	add r1, r0, r1
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	bl sub_0200DC64
	ldr r1, _021F2CB0 ; =_021FA311
	ldrb r0, [r1, r0]
	pop {r3, pc}
	nop
_021F2CB0: .word _021FA311
	thumb_func_end ov18_021F2C98

	thumb_func_start ov18_021F2CB4
ov18_021F2CB4: ; 0x021F2CB4
	push {r3, lr}
	bl ov18_021F2C98
	lsr r0, r0, #1
	add r0, #0x15
	pop {r3, pc}
	thumb_func_end ov18_021F2CB4

	thumb_func_start ov18_021F2CC0
ov18_021F2CC0: ; 0x021F2CC0
	push {r3, lr}
	bl ov18_021F2C98
	lsr r1, r0, #1
	mov r0, #0x83
	sub r0, r0, r1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov18_021F2CC0

	thumb_func_start ov18_021F2CD0
ov18_021F2CD0: ; 0x021F2CD0
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	add r6, r0, #0
	lsl r0, r7, #2
	add r1, r6, r0
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	add r1, sp, #0
	add r5, r2, #0
	add r1, #2
	add r2, sp, #0
	add r4, r3, #0
	bl sub_0200DE44
	add r0, r6, #0
	add r1, r7, #0
	bl ov18_021F2C98
	add r2, sp, #0
	mov r1, #2
	ldrsh r3, [r2, r1]
	add r1, r3, #0
	sub r1, #0xb
	cmp r5, r1
	blo _021F2D20
	add r3, #0xb
	cmp r5, r3
	bhi _021F2D20
	lsr r3, r0, #1
	mov r0, #0
	ldrsh r1, [r2, r0]
	sub r0, r1, r3
	cmp r4, r0
	blo _021F2D20
	add r0, r1, r3
	cmp r4, r0
	bhi _021F2D20
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021F2D20:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov18_021F2CD0

	thumb_func_start ov18_021F2D24
ov18_021F2D24: ; 0x021F2D24
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0x67
	add r4, r1, #0
	lsl r0, r0, #4
	add r7, r5, r0
	lsl r0, r4, #2
	str r0, [sp, #4]
	add r1, sp, #8
	ldr r0, [r7, r0]
	add r1, #2
	add r2, sp, #8
	add r6, r3, #0
	bl sub_0200DE44
	add r0, r5, #0
	add r1, r4, #0
	bl ov18_021F2CB4
	cmp r6, r0
	bhs _021F2D52
	add r6, r0, #0
_021F2D52:
	add r0, r5, #0
	add r1, r4, #0
	bl ov18_021F2CC0
	cmp r6, r0
	bls _021F2D60
	add r6, r0, #0
_021F2D60:
	ldr r0, [sp, #4]
	add r2, sp, #8
	mov r1, #2
	ldrsh r1, [r2, r1]
	lsl r2, r6, #0x10
	ldr r0, [r7, r0]
	asr r2, r2, #0x10
	bl sub_0200DDB8
	add r0, r5, #0
	add r1, r4, #0
	bl ov18_021F2CB4
	add r7, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov18_021F2CC0
	sub r0, r0, r7
	str r0, [sp]
	ldr r1, [sp, #0x20]
	add r0, r5, #0
	bl ov18_021F8950
	add r4, r0, #0
	ldr r0, [sp]
	add r1, r4, #0
	lsl r0, r0, #8
	bl _u32_div_f
	sub r1, r6, r7
	mov r3, #0
	lsl r2, r1, #8
	add r6, r3, #0
	add r7, r3, #0
_021F2DA6:
	cmp r2, r6
	blo _021F2DC0
	add r1, r7, r0
	cmp r2, r1
	bhs _021F2DC0
	ldr r0, _021F2DD0 ; =0x00001859
	ldrb r1, [r5, r0]
	cmp r1, r3
	beq _021F2DCA
	add sp, #0xc
	strb r3, [r5, r0]
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_021F2DC0:
	add r3, r3, #1
	add r6, r6, r0
	add r7, r7, r0
	cmp r3, r4
	bls _021F2DA6
_021F2DCA:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021F2DD0: .word 0x00001859
	thumb_func_end ov18_021F2D24

	thumb_func_start ov18_021F2DD4
ov18_021F2DD4: ; 0x021F2DD4
	push {r3, r4, r5, r6, r7, lr}
	add r4, r2, #0
	add r5, r1, #0
	add r7, r0, #0
	add r1, r4, #0
	str r3, [sp]
	bl ov18_021F2CB4
	add r6, r0, #0
	add r0, r7, #0
	add r1, r4, #0
	bl ov18_021F2CC0
	add r4, r0, #0
	ldr r1, [sp]
	add r0, r7, #0
	bl ov18_021F8950
	add r1, r0, #0
	cmp r5, r1
	beq _021F2E0E
	sub r0, r4, r6
	lsl r0, r0, #8
	bl _u32_div_f
	add r1, r0, #0
	mul r1, r5
	lsr r0, r1, #8
	add r4, r6, r0
_021F2E0E:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov18_021F2DD4

	thumb_func_start ov18_021F2E14
ov18_021F2E14: ; 0x021F2E14
	push {r3, r4, r5, lr}
	lsl r1, r1, #2
	add r1, r0, r1
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	add r1, sp, #0
	add r5, r2, #0
	add r1, #2
	add r2, sp, #0
	add r4, r3, #0
	bl sub_0200DE44
	add r1, sp, #0
	mov r0, #0
	ldrsh r0, [r1, r0]
	cmp r5, r0
	blo _021F2E42
	sub r0, r5, r0
	add r1, r4, #0
	bl _u32_div_f
	pop {r3, r4, r5, pc}
_021F2E42:
	sub r0, r0, r5
	add r1, r4, #0
	bl _u32_div_f
	pop {r3, r4, r5, pc}
	thumb_func_end ov18_021F2E14

	thumb_func_start ov18_021F2E4C
ov18_021F2E4C: ; 0x021F2E4C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r2, #0
	mov r2, #0x67
	lsl r2, r2, #4
	add r5, r0, r2
	lsl r4, r1, #2
	add r1, sp, #0
	ldr r0, [r5, r4]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	add r3, sp, #0
	mov r2, #0
	ldrsh r2, [r3, r2]
	mov r1, #2
	ldrsh r1, [r3, r1]
	add r2, r2, r6
	lsl r2, r2, #0x10
	ldr r0, [r5, r4]
	asr r2, r2, #0x10
	bl sub_0200DDB8
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov18_021F2E4C

	thumb_func_start ov18_021F2E80
ov18_021F2E80: ; 0x021F2E80
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0x67
	lsl r0, r0, #4
	add r1, sp, #4
	str r2, [sp]
	add r6, r5, r0
	lsl r7, r4, #2
	ldr r0, [r6, r7]
	add r1, #2
	add r2, sp, #4
	bl sub_0200DE44
	ldr r1, _021F2EC4 ; =0x00001859
	ldr r3, [sp]
	ldrb r1, [r5, r1]
	add r0, r5, #0
	add r2, r4, #0
	bl ov18_021F2DD4
	add r3, r0, #0
	add r2, sp, #4
	mov r1, #2
	ldrsh r1, [r2, r1]
	lsl r2, r3, #0x10
	ldr r0, [r6, r7]
	asr r2, r2, #0x10
	bl sub_0200DDB8
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F2EC4: .word 0x00001859
	thumb_func_end ov18_021F2E80

	thumb_func_start ov18_021F2EC8
ov18_021F2EC8: ; 0x021F2EC8
	push {r3, lr}
	lsl r1, r1, #2
	add r3, r0, r1
	ldr r1, _021F2EFC ; =0x00001032
	ldrh r1, [r3, r1]
	cmp r1, #2
	bne _021F2EE8
	lsl r1, r2, #2
	add r1, r0, r1
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #1
	bl sub_0200DCE8
	pop {r3, pc}
_021F2EE8:
	lsl r1, r2, #2
	add r1, r0, r1
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0200DCE8
	pop {r3, pc}
	nop
_021F2EFC: .word 0x00001032
	thumb_func_end ov18_021F2EC8

	thumb_func_start ov18_021F2F00
ov18_021F2F00: ; 0x021F2F00
	push {r4, lr}
	add r4, r0, #0
	bl ov18_021F1104
	add r0, r4, #0
	mov r1, #0x3c
	bl ov18_021F13DC
	add r0, r4, #0
	bl ov18_021F26E4
	add r0, r4, #0
	bl ov18_021F2308
	add r0, r4, #0
	bl ov18_021F18E0
	add r0, r4, #0
	bl ov18_021F1D58
	add r0, r4, #0
	bl ov18_021F1F74
	add r0, r4, #0
	bl ov18_021F281C
	add r0, r4, #0
	bl ov18_021F23E4
	pop {r4, pc}
	thumb_func_end ov18_021F2F00

	thumb_func_start ov18_021F2F3C
ov18_021F2F3C: ; 0x021F2F3C
	push {r4, lr}
	add r4, r0, #0
	bl ov18_021F2F4C
	add r0, r4, #0
	bl ov18_021F32B8
	pop {r4, pc}
	thumb_func_end ov18_021F2F3C

	thumb_func_start ov18_021F2F4C
ov18_021F2F4C: ; 0x021F2F4C
	push {r4, lr}
	sub sp, #0x18
	add r4, r0, #0
	mov r1, #0x3c
	bl ov18_021F1324
	add r0, r4, #0
	bl ov18_021F2648
	add r0, r4, #0
	bl ov18_021F2270
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021F30E0 ; =0x0000C5A0
	ldr r1, _021F30E4 ; =0x00000668
	str r0, [sp, #8]
	ldr r2, _021F30E8 ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x48
	bl sub_0200D504
	ldr r0, _021F30E8 ; =0x00000854
	ldr r3, _021F30E4 ; =0x00000668
	ldr r1, [r4, r0]
	sub r0, r0, #4
	str r1, [sp]
	mov r1, #0x4b
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	mov r1, #1
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r1, _021F30EC ; =0x0000C561
	str r1, [sp, #0x14]
	ldr r2, [r4, r3]
	add r3, r3, #4
	ldr r0, [r4, r0]
	ldr r3, [r4, r3]
	mov r1, #2
	bl sub_0200D68C
	mov r0, #1
	str r0, [sp]
	ldr r0, _021F30F0 ; =0x0000C55E
	ldr r1, _021F30E4 ; =0x00000668
	str r0, [sp, #4]
	ldr r2, _021F30E8 ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x49
	bl sub_0200D6EC
	mov r0, #1
	str r0, [sp]
	ldr r0, _021F30F0 ; =0x0000C55E
	ldr r1, _021F30E4 ; =0x00000668
	str r0, [sp, #4]
	ldr r2, _021F30E8 ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x4a
	bl sub_0200D71C
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _021F30F4 ; =0x0000C59F
	ldr r1, _021F30E4 ; =0x00000668
	str r0, [sp, #8]
	ldr r2, _021F30E8 ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x48
	bl sub_0200D504
	ldr r0, _021F30E8 ; =0x00000854
	ldr r3, _021F30E4 ; =0x00000668
	ldr r1, [r4, r0]
	sub r0, r0, #4
	str r1, [sp]
	mov r1, #0x4b
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	mov r1, #1
	str r1, [sp, #0xc]
	mov r1, #2
	str r1, [sp, #0x10]
	ldr r1, _021F30F8 ; =0x0000C560
	str r1, [sp, #0x14]
	ldr r2, [r4, r3]
	add r3, r3, #4
	ldr r0, [r4, r0]
	ldr r3, [r4, r3]
	mov r1, #3
	bl sub_0200D68C
	mov r0, #1
	str r0, [sp]
	ldr r0, _021F30FC ; =0x0000C55D
	ldr r1, _021F30E4 ; =0x00000668
	str r0, [sp, #4]
	ldr r2, _021F30E8 ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x49
	bl sub_0200D6EC
	mov r0, #1
	str r0, [sp]
	ldr r0, _021F30FC ; =0x0000C55D
	ldr r1, _021F30E4 ; =0x00000668
	str r0, [sp, #4]
	ldr r2, _021F30E8 ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x4a
	bl sub_0200D71C
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _021F3100 ; =0x0000C59E
	ldr r1, _021F30E4 ; =0x00000668
	str r0, [sp, #8]
	ldr r2, _021F30E8 ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x17
	bl sub_0200D504
	ldr r0, _021F30E8 ; =0x00000854
	ldr r3, _021F30E4 ; =0x00000668
	ldr r1, [r4, r0]
	sub r0, r0, #4
	str r1, [sp]
	mov r1, #0x20
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	mov r1, #1
	str r1, [sp, #0xc]
	mov r1, #2
	str r1, [sp, #0x10]
	ldr r1, _021F3104 ; =0x0000C55F
	str r1, [sp, #0x14]
	ldr r2, [r4, r3]
	add r3, r3, #4
	ldr r0, [r4, r0]
	ldr r3, [r4, r3]
	mov r1, #3
	bl sub_0200D68C
	mov r0, #1
	str r0, [sp]
	ldr r0, _021F3108 ; =0x0000C55C
	ldr r1, _021F30E4 ; =0x00000668
	str r0, [sp, #4]
	ldr r2, _021F30E8 ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x18
	bl sub_0200D6EC
	mov r0, #1
	str r0, [sp]
	ldr r0, _021F3108 ; =0x0000C55C
	ldr r1, _021F30E4 ; =0x00000668
	str r0, [sp, #4]
	ldr r2, _021F30E8 ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x19
	bl sub_0200D71C
	add sp, #0x18
	pop {r4, pc}
	nop
_021F30E0: .word 0x0000C5A0
_021F30E4: .word 0x00000668
_021F30E8: .word 0x00000854
_021F30EC: .word 0x0000C561
_021F30F0: .word 0x0000C55E
_021F30F4: .word 0x0000C59F
_021F30F8: .word 0x0000C560
_021F30FC: .word 0x0000C55D
_021F3100: .word 0x0000C59E
_021F3104: .word 0x0000C55F
_021F3108: .word 0x0000C55C
	thumb_func_end ov18_021F2F4C

	thumb_func_start ov18_021F310C
ov18_021F310C: ; 0x021F310C
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0x3c
	bl ov18_021F13DC
	add r0, r4, #0
	bl ov18_021F26E4
	add r0, r4, #0
	bl ov18_021F2308
	ldr r0, _021F3174 ; =0x0000066C
	ldr r1, _021F3178 ; =0x0000C59F
	ldr r0, [r4, r0]
	bl sub_0200D958
	ldr r0, _021F3174 ; =0x0000066C
	ldr r1, _021F317C ; =0x0000C560
	ldr r0, [r4, r0]
	bl sub_0200D968
	ldr r0, _021F3174 ; =0x0000066C
	ldr r1, _021F3180 ; =0x0000C55D
	ldr r0, [r4, r0]
	bl sub_0200D978
	ldr r0, _021F3174 ; =0x0000066C
	ldr r1, _021F3180 ; =0x0000C55D
	ldr r0, [r4, r0]
	bl sub_0200D988
	ldr r0, _021F3174 ; =0x0000066C
	ldr r1, _021F3184 ; =0x0000C5A0
	ldr r0, [r4, r0]
	bl sub_0200D958
	ldr r0, _021F3174 ; =0x0000066C
	ldr r1, _021F3188 ; =0x0000C561
	ldr r0, [r4, r0]
	bl sub_0200D968
	ldr r0, _021F3174 ; =0x0000066C
	ldr r1, _021F318C ; =0x0000C55E
	ldr r0, [r4, r0]
	bl sub_0200D978
	ldr r0, _021F3174 ; =0x0000066C
	ldr r1, _021F318C ; =0x0000C55E
	ldr r0, [r4, r0]
	bl sub_0200D988
	pop {r4, pc}
	.balign 4, 0
_021F3174: .word 0x0000066C
_021F3178: .word 0x0000C59F
_021F317C: .word 0x0000C560
_021F3180: .word 0x0000C55D
_021F3184: .word 0x0000C5A0
_021F3188: .word 0x0000C561
_021F318C: .word 0x0000C55E
	thumb_func_end ov18_021F310C

	thumb_func_start ov18_021F3190
ov18_021F3190: ; 0x021F3190
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	add r5, r0, #0
	bl ov18_021F17FC
	add r0, r5, #0
	bl ov18_021F1CB4
	add r0, r5, #0
	bl ov18_021F1E70
	add r0, r5, #0
	bl ov18_021F2724
	add r0, r5, #0
	bl ov18_021F2348
	ldr r1, _021F3270 ; =0x00000668
	mov r3, #2
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	ldr r2, _021F3274 ; =_021FAB58
	lsl r3, r3, #0x14
	bl sub_0200D740
	mov r1, #0x72
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r1, #0
	sub r0, #0xb8
	sub r1, #0xb4
	mov r3, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, _021F3278 ; =_021FAB8C
	lsl r3, r3, #0x14
	bl sub_0200D740
	ldr r1, _021F327C ; =0x00000724
	str r0, [r5, r1]
	add r0, r5, #0
	mov r1, #0x2e
	bl ov18_021F1A30
	add r0, r5, #0
	mov r1, #0x30
	bl ov18_021F1D98
	add r0, r5, #0
	mov r1, #0x31
	bl ov18_021F1FDC
	ldr r4, _021F3280 ; =_021FA484
	add r3, sp, #0
	mov r2, #6
_021F3200:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021F3200
	ldr r0, [r4]
	add r4, r5, #0
	ldr r6, _021F3284 ; =0x000004F8
	str r0, [r3]
	mov r7, #0x35
	add r4, #0xd4
_021F3214:
	ldr r0, _021F3288 ; =0x0000047C
	add r2, sp, #0
	sub r1, r6, r0
	add r0, sp, #0
	strh r1, [r0]
	add r0, r5, #0
	add r1, r7, #0
	bl ov18_021F2424
	ldr r0, _021F328C ; =0x0000066C
	ldr r1, _021F3290 ; =0x0000C55A
	ldr r0, [r5, r0]
	mov r2, #2
	bl sub_0200D944
	add r1, r0, #0
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_0200DD10
	add r7, r7, #1
	add r6, #0x18
	add r4, r4, #4
	cmp r7, #0x3a
	bls _021F3214
	mov r7, #0x67
	lsl r7, r7, #4
	mov r4, #0x2c
	add r5, #0xb0
	add r6, r7, #0
_021F3252:
	ldr r0, [r5, r7]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r5, r6]
	mov r1, #2
	bl sub_0200DD54
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x3a
	bls _021F3252
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_021F3270: .word 0x00000668
_021F3274: .word _021FAB58
_021F3278: .word _021FAB8C
_021F327C: .word 0x00000724
_021F3280: .word _021FA484
_021F3284: .word 0x000004F8
_021F3288: .word 0x0000047C
_021F328C: .word 0x0000066C
_021F3290: .word 0x0000C55A
	thumb_func_end ov18_021F3190

	thumb_func_start ov18_021F3294
ov18_021F3294: ; 0x021F3294
	push {r4, lr}
	add r4, r0, #0
	bl ov18_021F18E0
	add r0, r4, #0
	bl ov18_021F1D58
	add r0, r4, #0
	bl ov18_021F1F74
	add r0, r4, #0
	bl ov18_021F281C
	add r0, r4, #0
	bl ov18_021F23E4
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov18_021F3294

	thumb_func_start ov18_021F32B8
ov18_021F32B8: ; 0x021F32B8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	mov r7, #0x67
	ldr r6, _021F340C ; =_021FB004
	add r5, r0, #0
	mov r4, #0
	lsl r7, r7, #4
_021F32C6:
	ldr r0, _021F3410 ; =0x00000668
	ldr r1, _021F3414 ; =0x0000066C
	mov r2, #0x34
	mul r2, r4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r6, r2
	bl sub_0200D734
	lsl r1, r4, #2
	add r1, r5, r1
	str r0, [r1, r7]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl ov18_021F11C0
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #0x19
	bls _021F32C6
	ldr r1, _021F3410 ; =0x00000668
	mov r3, #2
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	ldr r2, _021F3418 ; =_021FA520
	lsl r3, r3, #0x14
	bl sub_0200D740
	ldr r1, _021F341C ; =0x0000071C
	mov r2, #0
	str r0, [r5, r1]
	add r0, r5, #0
	mov r1, #0x2b
	bl ov18_021F11C0
	ldr r1, _021F3410 ; =0x00000668
	mov r3, #2
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	ldr r2, _021F3420 ; =_021FB54C
	lsl r3, r3, #0x14
	bl sub_0200D740
	ldr r1, _021F3424 ; =0x000006D8
	mov r3, #2
	str r0, [r5, r1]
	add r0, r1, #0
	sub r0, #0x70
	sub r1, #0x6c
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, _021F3428 ; =_021FB580
	lsl r3, r3, #0x14
	bl sub_0200D740
	ldr r1, _021F342C ; =0x000006DC
	mov r2, #0
	str r0, [r5, r1]
	add r0, r5, #0
	mov r1, #0x1b
	bl ov18_021F11C0
	ldr r4, _021F3430 ; =_021FA4EC
	add r3, sp, #0
	mov r2, #6
_021F3350:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021F3350
	ldr r0, [r4]
	mov r4, #0x1c
	str r0, [r3]
	add r7, sp, #0
_021F3360:
	cmp r4, #0x1c
	bne _021F33A2
	mov r0, #0xe0
	strh r0, [r7]
	mov r0, #0x48
	strh r0, [r7, #2]
	ldr r0, _021F3410 ; =0x00000668
	ldr r1, _021F3414 ; =0x0000066C
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, sp, #0
	bl sub_0200D734
	lsl r1, r4, #2
	add r2, r5, r1
	mov r1, #0x67
	lsl r1, r1, #4
	str r0, [r2, r1]
	ldr r0, _021F3434 ; =0x0000188C
	ldr r2, [r5, r0]
	cmp r2, #0xe
	bne _021F3398
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl ov18_021F11C0
	b _021F33F6
_021F3398:
	add r0, r5, #0
	add r1, r4, #0
	bl ov18_021F118C
	b _021F33F6
_021F33A2:
	add r0, r4, #0
	sub r0, #0x1d
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	add r0, r6, #0
	mov r1, #5
	bl _s32_div_f
	mov r0, #0x30
	mul r0, r1
	add r0, #0x20
	strh r0, [r7]
	add r0, r6, #0
	mov r1, #5
	bl _s32_div_f
	mov r1, #0x28
	mul r1, r0
	add r1, #0x38
	strh r1, [r7, #2]
	ldr r0, _021F3410 ; =0x00000668
	ldr r1, _021F3414 ; =0x0000066C
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, sp, #0
	bl sub_0200D734
	lsl r1, r4, #2
	add r2, r5, r1
	mov r1, #0x67
	lsl r1, r1, #4
	str r0, [r2, r1]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov18_021F118C
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl ov18_021F11C0
_021F33F6:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #0x2a
	bls _021F3360
	add r0, r5, #0
	mov r1, #0x3b
	bl ov18_021F1424
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021F340C: .word _021FB004
_021F3410: .word 0x00000668
_021F3414: .word 0x0000066C
_021F3418: .word _021FA520
_021F341C: .word 0x0000071C
_021F3420: .word _021FB54C
_021F3424: .word 0x000006D8
_021F3428: .word _021FB580
_021F342C: .word 0x000006DC
_021F3430: .word _021FA4EC
_021F3434: .word 0x0000188C
	thumb_func_end ov18_021F32B8

	thumb_func_start ov18_021F3438
ov18_021F3438: ; 0x021F3438
	push {r4, lr}
	add r4, r0, #0
	bl ov18_021F1104
	add r0, r4, #0
	bl ov18_021F310C
	pop {r4, pc}
	thumb_func_end ov18_021F3438

	thumb_func_start ov18_021F3448
ov18_021F3448: ; 0x021F3448
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0x1a
	bl ov18_021F10E8
	add r0, r4, #0
	mov r1, #0x1b
	bl ov18_021F10E8
	ldr r0, _021F3484 ; =0x0000066C
	ldr r1, _021F3488 ; =0x0000C59E
	ldr r0, [r4, r0]
	bl sub_0200D958
	ldr r0, _021F3484 ; =0x0000066C
	ldr r1, _021F348C ; =0x0000C55F
	ldr r0, [r4, r0]
	bl sub_0200D968
	ldr r0, _021F3484 ; =0x0000066C
	ldr r1, _021F3490 ; =0x0000C55C
	ldr r0, [r4, r0]
	bl sub_0200D978
	ldr r0, _021F3484 ; =0x0000066C
	ldr r1, _021F3490 ; =0x0000C55C
	ldr r0, [r4, r0]
	bl sub_0200D988
	pop {r4, pc}
	.balign 4, 0
_021F3484: .word 0x0000066C
_021F3488: .word 0x0000C59E
_021F348C: .word 0x0000C55F
_021F3490: .word 0x0000C55C
	thumb_func_end ov18_021F3448

	thumb_func_start ov18_021F3494
ov18_021F3494: ; 0x021F3494
	push {r4, lr}
	ldr r1, _021F34C0 ; =0x0000188C
	add r4, r0, #0
	ldr r1, [r4, r1]
	cmp r1, #0xe
	bne _021F34AA
	mov r1, #0x1c
	mov r2, #0
	bl ov18_021F11C0
	pop {r4, pc}
_021F34AA:
	mov r1, #0x1c
	mov r2, #1
	bl ov18_021F11C0
	ldr r2, _021F34C0 ; =0x0000188C
	add r0, r4, #0
	ldr r2, [r4, r2]
	mov r1, #0x1c
	bl ov18_021F118C
	pop {r4, pc}
	.balign 4, 0
_021F34C0: .word 0x0000188C
	thumb_func_end ov18_021F3494

	thumb_func_start ov18_021F34C4
ov18_021F34C4: ; 0x021F34C4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	cmp r1, #1
	bne _021F34D4
	mov r1, #0x1c
	mov r2, #0
	bl ov18_021F11C0
_021F34D4:
	mov r4, #0x1d
	mov r6, #0
_021F34D8:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov18_021F11C0
	add r4, r4, #1
	cmp r4, #0x2a
	bls _021F34D8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov18_021F34C4

	thumb_func_start ov18_021F34EC
ov18_021F34EC: ; 0x021F34EC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov18_021F3494
	cmp r4, #1
	bne _021F351E
	mov r0, #0x6e
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0xe0
	mov r2, #0x48
	bl sub_0200DDB8
	mov r4, #0x1d
	mov r6, #0
_021F350C:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov18_021F11C0
	add r4, r4, #1
	cmp r4, #0x2a
	bls _021F350C
	pop {r4, r5, r6, pc}
_021F351E:
	mov r0, #0x6e
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x98
	mov r2, #0x14
	bl sub_0200DDB8
	mov r4, #0x1d
	mov r6, #1
_021F3530:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov18_021F11C0
	add r4, r4, #1
	cmp r4, #0x2a
	bls _021F3530
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov18_021F34EC

	thumb_func_start ov18_021F3544
ov18_021F3544: ; 0x021F3544
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r4, #1
_021F354C:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov18_021F11C0
	add r4, r4, #1
	cmp r4, #0x10
	bls _021F354C
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov18_021F3544

	thumb_func_start ov18_021F3560
ov18_021F3560: ; 0x021F3560
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	cmp r3, #0
	bne _021F35B4
	add r1, r6, #0
	bl ov18_021F3AD0
	add r1, r0, #0
	add r0, r5, #0
	mov r2, #5
	mov r3, #1
	bl ov18_021F36D4
	add r0, r5, #0
	add r1, r4, #0
	bl ov18_021F3AD0
	add r1, r0, #0
	add r0, r5, #0
	mov r2, #0xb
	mov r3, #0
	bl ov18_021F36D4
	ldr r2, _021F3614 ; =0x00001850
	add r0, r5, #0
	ldr r3, [r5, r2]
	lsl r2, r6, #2
	ldrh r2, [r3, r2]
	mov r1, #6
	bl ov18_021F38F0
	ldr r2, _021F3614 ; =0x00001850
	add r0, r5, #0
	ldr r3, [r5, r2]
	lsl r2, r4, #2
	ldrh r2, [r3, r2]
	mov r1, #0xc
	bl ov18_021F38F0
	b _021F35FE
_021F35B4:
	add r1, r6, #0
	bl ov18_021F3AD0
	add r1, r0, #0
	add r0, r5, #0
	mov r2, #5
	mov r3, #1
	bl ov18_021F37D4
	add r0, r5, #0
	add r1, r4, #0
	bl ov18_021F3AD0
	add r1, r0, #0
	add r0, r5, #0
	mov r2, #0xb
	mov r3, #0
	bl ov18_021F37D4
	ldr r2, _021F3614 ; =0x00001850
	add r0, r5, #0
	ldr r3, [r5, r2]
	lsl r2, r6, #2
	add r2, r3, r2
	ldrh r2, [r2, #2]
	mov r1, #6
	bl ov18_021F39C4
	ldr r2, _021F3614 ; =0x00001850
	add r0, r5, #0
	ldr r3, [r5, r2]
	lsl r2, r4, #2
	add r2, r3, r2
	ldrh r2, [r2, #2]
	mov r1, #0xc
	bl ov18_021F39C4
_021F35FE:
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #1
	bl ov18_021F3A64
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #3
	bl ov18_021F3A64
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021F3614: .word 0x00001850
	thumb_func_end ov18_021F3560

	thumb_func_start ov18_021F3618
ov18_021F3618: ; 0x021F3618
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #3
	bhi _021F36BE
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F362C: ; jump table
	.short _021F3634 - _021F362C - 2 ; case 0
	.short _021F3644 - _021F362C - 2 ; case 1
	.short _021F3654 - _021F362C - 2 ; case 2
	.short _021F3688 - _021F362C - 2 ; case 3
_021F3634:
	mov r1, #1
	bl ov18_021F34EC
	add r0, r4, #0
	mov r1, #0
	bl ov18_021F3544
	pop {r4, pc}
_021F3644:
	mov r1, #0
	bl ov18_021F34EC
	add r0, r4, #0
	mov r1, #0
	bl ov18_021F3544
	pop {r4, pc}
_021F3654:
	mov r1, #1
	bl ov18_021F34C4
	add r0, r4, #0
	mov r1, #1
	bl ov18_021F3544
	add r0, r4, #0
	mov r1, #5
	mov r2, #0x43
	bl ov18_021F118C
	add r0, r4, #0
	mov r1, #0xb
	mov r2, #0x44
	bl ov18_021F118C
	ldr r2, _021F36D0 ; =0x00001878
	add r0, r4, #0
	ldr r1, [r4, r2]
	add r2, r2, #4
	ldr r2, [r4, r2]
	mov r3, #0
	bl ov18_021F3560
	pop {r4, pc}
_021F3688:
	mov r1, #1
	bl ov18_021F34C4
	add r0, r4, #0
	mov r1, #1
	bl ov18_021F3544
	add r0, r4, #0
	mov r1, #5
	mov r2, #0x29
	bl ov18_021F118C
	add r0, r4, #0
	mov r1, #0xb
	mov r2, #0x2a
	bl ov18_021F118C
	mov r2, #0x62
	lsl r2, r2, #6
	ldr r1, [r4, r2]
	add r2, r2, #4
	ldr r2, [r4, r2]
	add r0, r4, #0
	mov r3, #1
	bl ov18_021F3560
	pop {r4, pc}
_021F36BE:
	add r0, r4, #0
	mov r1, #1
	bl ov18_021F34C4
	add r0, r4, #0
	mov r1, #0
	bl ov18_021F3544
	pop {r4, pc}
	.balign 4, 0
_021F36D0: .word 0x00001878
	thumb_func_end ov18_021F3618

	thumb_func_start ov18_021F36D4
ov18_021F36D4: ; 0x021F36D4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	lsl r6, r2, #2
	mov r0, #0x67
	add r4, r1, #0
	add r1, r5, r6
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	add r1, sp, #4
	add r1, #2
	add r2, sp, #4
	str r3, [sp]
	bl sub_0200DE44
	cmp r4, #0
	bne _021F36FE
	add r1, sp, #4
	mov r0, #2
	ldrsh r4, [r1, r0]
	b _021F370C
_021F36FE:
	cmp r4, #0x34
	bhs _021F3706
	mov r4, #0x34
	b _021F370C
_021F3706:
	cmp r4, #0xcc
	bls _021F370C
	mov r4, #0xcc
_021F370C:
	mov r0, #0x67
	lsl r0, r0, #4
	add r7, r5, r0
	add r1, sp, #4
	ldr r0, [r7, r6]
	add r1, #2
	add r2, sp, #4
	bl sub_0200DE44
	lsl r1, r4, #0x10
	add r3, sp, #4
	mov r2, #0
	ldrsh r2, [r3, r2]
	ldr r0, [r7, r6]
	asr r1, r1, #0x10
	bl sub_0200DDB8
	ldr r0, _021F37C8 ; =0x00000674
	add r1, sp, #4
	add r7, r5, r0
	ldr r0, [r7, r6]
	add r1, #2
	add r2, sp, #4
	bl sub_0200DE44
	add r1, r4, #0
	sub r1, #0x14
	lsl r1, r1, #0x10
	add r3, sp, #4
	mov r2, #0
	ldrsh r2, [r3, r2]
	ldr r0, [r7, r6]
	asr r1, r1, #0x10
	bl sub_0200DDB8
	ldr r0, _021F37CC ; =0x00000678
	add r1, r5, r6
	ldr r0, [r1, r0]
	add r1, r4, #0
	sub r1, #0xc
	lsl r1, r1, #0x10
	add r3, sp, #4
	mov r2, #0
	ldrsh r2, [r3, r2]
	asr r1, r1, #0x10
	bl sub_0200DDB8
	ldr r0, _021F37D0 ; =0x0000067C
	add r1, r5, r6
	ldr r0, [r1, r0]
	add r1, r4, #4
	lsl r1, r1, #0x10
	add r3, sp, #4
	mov r2, #0
	ldrsh r2, [r3, r2]
	asr r1, r1, #0x10
	bl sub_0200DDB8
	mov r0, #0x1a
	add r1, r5, r6
	lsl r0, r0, #6
	ldr r0, [r1, r0]
	add r1, r4, #0
	add r1, #0xc
	lsl r1, r1, #0x10
	add r3, sp, #4
	mov r2, #0
	ldrsh r2, [r3, r2]
	asr r1, r1, #0x10
	bl sub_0200DDB8
	ldr r0, [sp]
	cmp r0, #1
	bne _021F37C4
	mov r0, #0x67
	lsl r0, r0, #4
	add r1, sp, #4
	ldr r0, [r5, r0]
	add r1, #2
	add r2, sp, #4
	bl sub_0200DE44
	mov r0, #0x67
	lsl r0, r0, #4
	lsl r1, r4, #0x10
	add r3, sp, #4
	mov r2, #0
	ldrsh r2, [r3, r2]
	ldr r0, [r5, r0]
	asr r1, r1, #0x10
	bl sub_0200DDB8
_021F37C4:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F37C8: .word 0x00000674
_021F37CC: .word 0x00000678
_021F37D0: .word 0x0000067C
	thumb_func_end ov18_021F36D4

	thumb_func_start ov18_021F37D4
ov18_021F37D4: ; 0x021F37D4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	lsl r6, r2, #2
	mov r0, #0x67
	add r4, r1, #0
	add r1, r5, r6
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	add r1, sp, #4
	add r1, #2
	add r2, sp, #4
	str r3, [sp]
	bl sub_0200DE44
	cmp r4, #0
	bne _021F37FE
	add r1, sp, #4
	mov r0, #2
	ldrsh r4, [r1, r0]
	b _021F380C
_021F37FE:
	cmp r4, #0x34
	bhs _021F3806
	mov r4, #0x34
	b _021F380C
_021F3806:
	cmp r4, #0xcc
	bls _021F380C
	mov r4, #0xcc
_021F380C:
	mov r0, #0x67
	lsl r0, r0, #4
	add r7, r5, r0
	add r1, sp, #4
	ldr r0, [r7, r6]
	add r1, #2
	add r2, sp, #4
	bl sub_0200DE44
	lsl r1, r4, #0x10
	add r3, sp, #4
	mov r2, #0
	ldrsh r2, [r3, r2]
	ldr r0, [r7, r6]
	asr r1, r1, #0x10
	bl sub_0200DDB8
	ldr r0, _021F38E0 ; =0x00000674
	add r1, sp, #4
	add r7, r5, r0
	ldr r0, [r7, r6]
	add r1, #2
	add r2, sp, #4
	bl sub_0200DE44
	add r1, r4, #0
	sub r1, #0x14
	lsl r1, r1, #0x10
	add r3, sp, #4
	mov r2, #0
	ldrsh r2, [r3, r2]
	ldr r0, [r7, r6]
	asr r1, r1, #0x10
	bl sub_0200DDB8
	ldr r0, _021F38E4 ; =0x00000678
	add r1, r5, r6
	ldr r0, [r1, r0]
	add r1, r4, #0
	sub r1, #0xc
	lsl r1, r1, #0x10
	add r3, sp, #4
	mov r2, #0
	ldrsh r2, [r3, r2]
	asr r1, r1, #0x10
	bl sub_0200DDB8
	ldr r0, _021F38E8 ; =0x0000067C
	add r1, r5, r6
	ldr r0, [r1, r0]
	sub r1, r4, #4
	lsl r1, r1, #0x10
	add r3, sp, #4
	mov r2, #0
	ldrsh r2, [r3, r2]
	asr r1, r1, #0x10
	bl sub_0200DDB8
	mov r0, #0x1a
	add r1, r5, r6
	lsl r0, r0, #6
	ldr r0, [r1, r0]
	add r1, r4, #4
	lsl r1, r1, #0x10
	add r3, sp, #4
	mov r2, #0
	ldrsh r2, [r3, r2]
	asr r1, r1, #0x10
	bl sub_0200DDB8
	ldr r0, _021F38EC ; =0x00000684
	add r1, r5, r6
	ldr r0, [r1, r0]
	add r1, r4, #0
	add r1, #0x14
	lsl r1, r1, #0x10
	add r3, sp, #4
	mov r2, #0
	ldrsh r2, [r3, r2]
	asr r1, r1, #0x10
	bl sub_0200DDB8
	ldr r0, [sp]
	cmp r0, #1
	bne _021F38DA
	mov r0, #0x67
	lsl r0, r0, #4
	add r1, sp, #4
	ldr r0, [r5, r0]
	add r1, #2
	add r2, sp, #4
	bl sub_0200DE44
	mov r0, #0x67
	lsl r0, r0, #4
	lsl r1, r4, #0x10
	add r3, sp, #4
	mov r2, #0
	ldrsh r2, [r3, r2]
	ldr r0, [r5, r0]
	asr r1, r1, #0x10
	bl sub_0200DDB8
_021F38DA:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F38E0: .word 0x00000674
_021F38E4: .word 0x00000678
_021F38E8: .word 0x0000067C
_021F38EC: .word 0x00000684
	thumb_func_end ov18_021F37D4

	thumb_func_start ov18_021F38F0
ov18_021F38F0: ; 0x021F38F0
	push {r3, r4, r5, r6, r7, lr}
	ldr r6, _021F39BC ; =0x000003E7
	add r5, r0, #0
	add r4, r1, #0
	cmp r2, r6
	bne _021F3900
	add r6, #0xbd
	b _021F3914
_021F3900:
	ldr r0, _021F39C0 ; =0x00002710
	mov r1, #0xfe
	mul r0, r2
	bl _u32_div_f
	add r0, r0, #5
	mov r1, #0xa
	bl _u32_div_f
	add r6, r0, #0
_021F3914:
	add r0, r6, #0
	mov r1, #0xc
	bl _u32_div_f
	add r7, r0, #0
	add r0, r6, #0
	mov r1, #0xc
	bl _u32_div_f
	add r6, r1, #0
	cmp r7, #0xa
	blo _021F394C
	add r0, r7, #0
	mov r1, #0xa
	bl _u32_div_f
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	add r2, #0x2b
	bl ov18_021F118C
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	bl ov18_021F11C0
	b _021F3956
_021F394C:
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl ov18_021F11C0
_021F3956:
	add r0, r7, #0
	mov r1, #0xa
	bl _u32_div_f
	add r2, r1, #0
	add r0, r5, #0
	add r1, r4, #1
	add r2, #0x2b
	bl ov18_021F118C
	add r0, r5, #0
	add r1, r4, #1
	mov r2, #1
	bl ov18_021F11C0
	add r0, r6, #0
	mov r1, #0xa
	bl _u32_div_f
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #2
	add r2, #0x2b
	bl ov18_021F118C
	add r0, r5, #0
	add r1, r4, #2
	mov r2, #1
	bl ov18_021F11C0
	add r0, r6, #0
	mov r1, #0xa
	bl _u32_div_f
	add r2, r1, #0
	add r0, r5, #0
	add r1, r4, #3
	add r2, #0x2b
	bl ov18_021F118C
	add r0, r5, #0
	add r1, r4, #3
	mov r2, #1
	bl ov18_021F11C0
	add r0, r5, #0
	add r1, r4, #4
	mov r2, #0
	bl ov18_021F11C0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F39BC: .word 0x000003E7
_021F39C0: .word 0x00002710
	thumb_func_end ov18_021F38F0

	thumb_func_start ov18_021F39C4
ov18_021F39C4: ; 0x021F39C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r1, #0
	add r7, r0, #0
	ldr r1, _021F3A50 ; =0x0000270F
	add r0, r2, #0
	str r2, [sp]
	cmp r0, r1
	bne _021F39DC
	ldr r0, _021F3A54 ; =0x00018696
	str r0, [sp]
	b _021F39EC
_021F39DC:
	ldr r1, _021F3A58 ; =0x00035D2E
	mul r2, r1
	ldr r1, _021F3A5C ; =0x0000C350
	add r0, r2, r1
	lsl r1, r1, #1
	bl _u32_div_f
	str r0, [sp]
_021F39EC:
	mov r0, #0
	ldr r5, _021F3A60 ; =0x00002710
	str r0, [sp, #4]
	add r4, r0, #0
_021F39F4:
	ldr r0, [sp]
	add r1, r5, #0
	bl _u32_div_f
	add r2, r0, #0
	bne _021F3A06
	ldr r0, [sp, #4]
	cmp r0, #1
	bne _021F3A20
_021F3A06:
	mov r0, #1
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r6, r4
	add r2, #0x2b
	bl ov18_021F118C
	add r0, r7, #0
	add r1, r6, r4
	mov r2, #1
	bl ov18_021F11C0
	b _021F3A2A
_021F3A20:
	add r0, r7, #0
	add r1, r6, r4
	mov r2, #0
	bl ov18_021F11C0
_021F3A2A:
	ldr r0, [sp]
	add r1, r5, #0
	bl _u32_div_f
	str r1, [sp]
	add r0, r5, #0
	mov r1, #0xa
	bl _u32_div_f
	add r5, r0, #0
	cmp r4, #2
	bne _021F3A46
	mov r0, #1
	str r0, [sp, #4]
_021F3A46:
	add r4, r4, #1
	cmp r4, #5
	blo _021F39F4
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F3A50: .word 0x0000270F
_021F3A54: .word 0x00018696
_021F3A58: .word 0x00035D2E
_021F3A5C: .word 0x0000C350
_021F3A60: .word 0x00002710
	thumb_func_end ov18_021F39C4

	thumb_func_start ov18_021F3A64
ov18_021F3A64: ; 0x021F3A64
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	cmp r1, #0
	bne _021F3A82
	add r1, r4, #0
	mov r2, #0x3a
	bl ov18_021F118C
	add r0, r5, #0
	add r1, r4, #1
	mov r2, #0x35
	bl ov18_021F118C
	pop {r3, r4, r5, pc}
_021F3A82:
	cmp r1, #0x98
	bne _021F3A9A
	add r1, r4, #0
	mov r2, #0x38
	bl ov18_021F118C
	add r0, r5, #0
	add r1, r4, #1
	mov r2, #0x37
	bl ov18_021F118C
	pop {r3, r4, r5, pc}
_021F3A9A:
	add r1, r4, #0
	mov r2, #0x38
	bl ov18_021F118C
	add r0, r5, #0
	add r1, r4, #1
	mov r2, #0x35
	bl ov18_021F118C
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov18_021F3A64

	thumb_func_start ov18_021F3AB0
ov18_021F3AB0: ; 0x021F3AB0
	push {r3, lr}
	lsl r1, r1, #2
	add r1, r0, r1
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	add r1, sp, #0
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	add r1, sp, #0
	mov r0, #2
	ldrsh r0, [r1, r0]
	sub r0, #0x34
	pop {r3, pc}
	thumb_func_end ov18_021F3AB0

	thumb_func_start ov18_021F3AD0
ov18_021F3AD0: ; 0x021F3AD0
	add r1, #0x34
	add r0, r1, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov18_021F3AD0

	thumb_func_start ov18_021F3AD8
ov18_021F3AD8: ; 0x021F3AD8
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _021F3B24 ; =0x00001860
	add r4, r0, #0
	ldr r1, [r4, r1]
	cmp r1, #1
	bne _021F3B20
	mov r1, #0x11
	mov r2, #1
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #0x11
	bl ov18_021F2AC0
	ldr r0, _021F3B28 ; =0x000006B4
	add r1, sp, #0
	ldr r0, [r4, r0]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	ldr r0, _021F3B28 ; =0x000006B4
	add r3, sp, #0
	mov r1, #2
	ldrsh r2, [r3, r1]
	mov r1, #0x12
	lsl r1, r1, #4
	sub r1, r2, r1
	mov r2, #0
	lsl r1, r1, #0x10
	ldrsh r2, [r3, r2]
	ldr r0, [r4, r0]
	asr r1, r1, #0x10
	bl sub_0200DDB8
_021F3B20:
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_021F3B24: .word 0x00001860
_021F3B28: .word 0x000006B4
	thumb_func_end ov18_021F3AD8

	thumb_func_start ov18_021F3B2C
ov18_021F3B2C: ; 0x021F3B2C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021F3B5C ; =0x000006B4
	add r4, r1, #0
	add r1, sp, #0
	ldr r0, [r5, r0]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	ldr r0, _021F3B5C ; =0x000006B4
	add r3, sp, #0
	mov r1, #2
	ldrsh r1, [r3, r1]
	mov r2, #0
	ldrsh r2, [r3, r2]
	add r1, r1, r4
	lsl r1, r1, #0x10
	ldr r0, [r5, r0]
	asr r1, r1, #0x10
	bl sub_0200DDB8
	pop {r3, r4, r5, pc}
	nop
_021F3B5C: .word 0x000006B4
	thumb_func_end ov18_021F3B2C

	thumb_func_start ov18_021F3B60
ov18_021F3B60: ; 0x021F3B60
	push {r4, r5, r6, lr}
	add r5, r0, #0
	cmp r1, #1
	bne _021F3B88
	mov r4, #0x2c
	mov r6, #1
_021F3B6C:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov18_021F11C0
	add r4, r4, #1
	cmp r4, #0x3a
	bls _021F3B6C
	add r0, r5, #0
	mov r1, #0x2b
	mov r2, #0
	bl ov18_021F11C0
	pop {r4, r5, r6, pc}
_021F3B88:
	mov r4, #0x2c
	mov r6, #0
_021F3B8C:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov18_021F11C0
	add r4, r4, #1
	cmp r4, #0x3a
	bls _021F3B8C
	add r0, r5, #0
	bl ov18_021F3BA4
	pop {r4, r5, r6, pc}
	thumb_func_end ov18_021F3B60

	thumb_func_start ov18_021F3BA4
ov18_021F3BA4: ; 0x021F3BA4
	push {r4, lr}
	ldr r1, _021F3BD0 ; =0x0000188C
	add r4, r0, #0
	ldr r1, [r4, r1]
	cmp r1, #0xe
	bne _021F3BBA
	mov r1, #0x2b
	mov r2, #0
	bl ov18_021F11C0
	pop {r4, pc}
_021F3BBA:
	mov r1, #0x2b
	mov r2, #1
	bl ov18_021F11C0
	ldr r2, _021F3BD0 ; =0x0000188C
	add r0, r4, #0
	ldr r2, [r4, r2]
	mov r1, #0x2b
	bl ov18_021F118C
	pop {r4, pc}
	.balign 4, 0
_021F3BD0: .word 0x0000188C
	thumb_func_end ov18_021F3BA4

	thumb_func_start ov18_021F3BD4
ov18_021F3BD4: ; 0x021F3BD4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x6e
	lsl r0, r0, #4
	add r4, r1, #0
	add r1, sp, #0
	ldr r0, [r5, r0]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	mov r0, #0x6e
	lsl r0, r0, #4
	add r3, sp, #0
	mov r2, #0
	ldrsh r2, [r3, r2]
	mov r1, #2
	ldrsh r1, [r3, r1]
	add r2, r2, r4
	lsl r2, r2, #0x10
	ldr r0, [r5, r0]
	asr r2, r2, #0x10
	bl sub_0200DDB8
	ldr r0, _021F3C2C ; =0x0000071C
	add r1, sp, #0
	ldr r0, [r5, r0]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	ldr r0, _021F3C2C ; =0x0000071C
	add r3, sp, #0
	mov r2, #0
	ldrsh r2, [r3, r2]
	mov r1, #2
	ldrsh r1, [r3, r1]
	add r2, r2, r4
	lsl r2, r2, #0x10
	ldr r0, [r5, r0]
	asr r2, r2, #0x10
	bl sub_0200DDB8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021F3C2C: .word 0x0000071C
	thumb_func_end ov18_021F3BD4

	thumb_func_start ov18_021F3C30
ov18_021F3C30: ; 0x021F3C30
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021F3C50 ; =0x000006D4
	mov r1, #0x30
	add r2, r1, #0
	ldr r0, [r4, r0]
	sub r2, #0x90
	bl sub_0200DDB8
	add r0, r4, #0
	mov r1, #0x19
	mov r2, #1
	bl ov18_021F11C0
	pop {r4, pc}
	nop
_021F3C50: .word 0x000006D4
	thumb_func_end ov18_021F3C30

	thumb_func_start ov18_021F3C54
ov18_021F3C54: ; 0x021F3C54
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021F3C84 ; =0x000006D4
	add r4, r1, #0
	add r1, sp, #0
	ldr r0, [r5, r0]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	ldr r0, _021F3C84 ; =0x000006D4
	add r3, sp, #0
	mov r2, #0
	ldrsh r2, [r3, r2]
	mov r1, #2
	ldrsh r1, [r3, r1]
	add r2, r2, r4
	lsl r2, r2, #0x10
	ldr r0, [r5, r0]
	asr r2, r2, #0x10
	bl sub_0200DDB8
	pop {r3, r4, r5, pc}
	nop
_021F3C84: .word 0x000006D4
	thumb_func_end ov18_021F3C54

	thumb_func_start ov18_021F3C88
ov18_021F3C88: ; 0x021F3C88
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021F3CA4 ; =0x000006D4
	mov r1, #0x30
	ldr r0, [r4, r0]
	mov r2, #0x18
	bl sub_0200DDB8
	add r0, r4, #0
	mov r1, #0x19
	mov r2, #1
	bl ov18_021F11C0
	pop {r4, pc}
	.balign 4, 0
_021F3CA4: .word 0x000006D4
	thumb_func_end ov18_021F3C88

	thumb_func_start ov18_021F3CA8
ov18_021F3CA8: ; 0x021F3CA8
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r0, r2, #0
	ldr r2, _021F3D30 ; =0x000018A4
	add r5, r3, #0
	add r6, r4, r2
	ldrb r3, [r6, r1]
	mov r7, #0x80
	add r2, r3, #0
	tst r2, r7
	beq _021F3D0C
	ldr r1, _021F3D30 ; =0x000018A4
	sub r1, r1, #2
	ldrh r1, [r4, r1]
	cmp r1, #0xac
	bne _021F3CF2
	add r1, r3, #0
	eor r1, r7
	beq _021F3CD8
	cmp r1, #1
	beq _021F3CE0
	cmp r1, #2
	beq _021F3CEA
	pop {r3, r4, r5, r6, r7, pc}
_021F3CD8:
	mov r1, #0
	strb r1, [r0]
	strb r1, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_021F3CE0:
	mov r1, #0
	strb r1, [r0]
	mov r0, #1
	strb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_021F3CEA:
	mov r1, #1
	strb r1, [r0]
	strb r1, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_021F3CF2:
	add r1, r3, #0
	eor r1, r7
	strb r1, [r0]
	ldr r1, _021F3D30 ; =0x000018A4
	ldr r0, [r4]
	sub r1, r1, #2
	ldrh r1, [r4, r1]
	ldr r0, [r0]
	mov r2, #0
	bl Pokedex_SpeciesGetLastSeenGender
	strb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_021F3D0C:
	mov r2, #0
	strb r2, [r0]
	ldrb r0, [r6, r1]
	cmp r0, #1
	beq _021F3D1E
	cmp r0, #2
	beq _021F3D22
	cmp r0, #3
	b _021F3D28
_021F3D1E:
	strb r2, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_021F3D22:
	mov r0, #1
	strb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_021F3D28:
	mov r0, #2
	strb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F3D30: .word 0x000018A4
	thumb_func_end ov18_021F3CA8

	thumb_func_start ov18_021F3D34
ov18_021F3D34: ; 0x021F3D34
	push {r4, lr}
	add r4, r0, #0
	bl ov18_021F2648
	ldr r1, _021F3D64 ; =0x00000668
	ldr r2, _021F3D68 ; =_021FA554
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl sub_0200D734
	mov r1, #0x67
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #4
	bl sub_0200DD10
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov18_021F11C0
	pop {r4, pc}
	.balign 4, 0
_021F3D64: .word 0x00000668
_021F3D68: .word _021FA554
	thumb_func_end ov18_021F3D34

	thumb_func_start ov18_021F3D6C
ov18_021F3D6C: ; 0x021F3D6C
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	bl ov18_021F10E8
	add r0, r4, #0
	bl ov18_021F26E4
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov18_021F3D6C

	thumb_func_start ov18_021F3D80
ov18_021F3D80: ; 0x021F3D80
	push {r3, lr}
	add r2, r1, #0
	lsl r2, r2, #6
	add r2, #0x20
	lsl r2, r2, #0x10
	mov r1, #0
	asr r2, r2, #0x10
	mov r3, #0xb0
	str r1, [sp]
	bl ov18_021F1294
	pop {r3, pc}
	thumb_func_end ov18_021F3D80

	thumb_func_start ov18_021F3D98
ov18_021F3D98: ; 0x021F3D98
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	bl ov18_021F3E24
	mov r6, #1
	mov r4, #0x34
	add r5, r7, #4
_021F3DA6:
	add r2, r4, #0
	ldr r1, _021F3E00 ; =_021FA610
	sub r2, #0x34
	add r0, r7, #0
	add r1, r1, r2
	bl ov18_021F11EC
	mov r1, #0x67
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r6, r6, #1
	add r4, #0x34
	add r5, r5, #4
	cmp r6, #8
	bls _021F3DA6
	add r0, r7, #0
	mov r1, #1
	bl ov18_021F69C0
	add r2, sp, #0
	add r0, r7, #0
	mov r1, #0
	add r2, #1
	add r3, sp, #0
	bl ov18_021F3CA8
	ldr r1, _021F3E04 ; =0x000018A2
	add r2, sp, #0
	ldrh r1, [r7, r1]
	ldrb r2, [r2, #1]
	add r0, r7, #0
	mov r3, #1
	bl ov18_021F1534
	add r0, r7, #0
	bl ov18_021F40E4
	add r0, r7, #0
	bl ov18_021F40A0
	add r0, r7, #0
	bl ov18_021F4188
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F3E00: .word _021FA610
_021F3E04: .word 0x000018A2
	thumb_func_end ov18_021F3D98

	thumb_func_start ov18_021F3E08
ov18_021F3E08: ; 0x021F3E08
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #1
_021F3E0E:
	add r0, r5, #0
	add r1, r4, #0
	bl ov18_021F10E8
	add r4, r4, #1
	cmp r4, #0x3b
	blo _021F3E0E
	add r0, r5, #0
	bl ov18_021F3FDC
	pop {r3, r4, r5, pc}
	thumb_func_end ov18_021F3E08

	thumb_func_start ov18_021F3E24
ov18_021F3E24: ; 0x021F3E24
	push {r4, lr}
	sub sp, #0x18
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _021F3FB0 ; =0x0000C550
	ldr r1, _021F3FB4 ; =0x00000668
	str r0, [sp, #8]
	ldr r2, _021F3FB8 ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x4c
	bl sub_0200D504
	bl sub_02074490
	ldr r2, _021F3FBC ; =0x00000858
	ldr r3, _021F3FB4 ; =0x00000668
	ldr r1, [r4, r2]
	sub r2, #8
	str r1, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r1, #3
	str r1, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	ldr r0, _021F3FC0 ; =0x0000C551
	str r0, [sp, #0x14]
	ldr r0, [r4, r2]
	ldr r2, [r4, r3]
	add r3, r3, #4
	ldr r3, [r4, r3]
	bl sub_0200D68C
	bl sub_0207449C
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _021F3FB0 ; =0x0000C550
	ldr r1, _021F3FB4 ; =0x00000668
	str r0, [sp, #4]
	ldr r2, _021F3FBC ; =0x00000858
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	bl sub_0200D6EC
	bl sub_020744A8
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _021F3FB0 ; =0x0000C550
	ldr r1, _021F3FB4 ; =0x00000668
	str r0, [sp, #4]
	ldr r2, _021F3FBC ; =0x00000858
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	bl sub_0200D71C
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _021F3FC4 ; =0x0000C59C
	ldr r1, _021F3FB4 ; =0x00000668
	str r0, [sp, #8]
	ldr r2, _021F3FB8 ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x73
	bl sub_0200D504
	ldr r0, _021F3FB8 ; =0x00000854
	ldr r3, _021F3FB4 ; =0x00000668
	ldr r1, [r4, r0]
	sub r0, r0, #4
	str r1, [sp]
	mov r1, #0x76
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	mov r1, #1
	str r1, [sp, #0xc]
	mov r1, #2
	str r1, [sp, #0x10]
	ldr r1, _021F3FC8 ; =0x0000C55E
	str r1, [sp, #0x14]
	ldr r2, [r4, r3]
	add r3, r3, #4
	ldr r0, [r4, r0]
	ldr r3, [r4, r3]
	mov r1, #3
	bl sub_0200D68C
	mov r0, #1
	str r0, [sp]
	ldr r0, _021F3FCC ; =0x0000C55A
	ldr r1, _021F3FB4 ; =0x00000668
	str r0, [sp, #4]
	ldr r2, _021F3FB8 ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x74
	bl sub_0200D6EC
	mov r0, #1
	str r0, [sp]
	ldr r0, _021F3FCC ; =0x0000C55A
	ldr r1, _021F3FB4 ; =0x00000668
	str r0, [sp, #4]
	ldr r2, _021F3FB8 ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x75
	bl sub_0200D71C
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _021F3FD0 ; =0x0000C59A
	ldr r1, _021F3FB4 ; =0x00000668
	str r0, [sp, #8]
	ldr r2, _021F3FB8 ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x77
	bl sub_0200D504
	ldr r0, _021F3FB8 ; =0x00000854
	ldr r3, _021F3FB4 ; =0x00000668
	ldr r1, [r4, r0]
	sub r0, r0, #4
	str r1, [sp]
	mov r1, #0x7a
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	mov r1, #2
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r1, _021F3FD4 ; =0x0000C55C
	str r1, [sp, #0x14]
	ldr r2, [r4, r3]
	add r3, r3, #4
	ldr r0, [r4, r0]
	ldr r3, [r4, r3]
	mov r1, #3
	bl sub_0200D68C
	mov r0, #1
	str r0, [sp]
	ldr r0, _021F3FD8 ; =0x0000C559
	ldr r1, _021F3FB4 ; =0x00000668
	str r0, [sp, #4]
	ldr r2, _021F3FB8 ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x78
	bl sub_0200D6EC
	mov r0, #1
	str r0, [sp]
	ldr r0, _021F3FD8 ; =0x0000C559
	ldr r1, _021F3FB4 ; =0x00000668
	str r0, [sp, #4]
	ldr r2, _021F3FB8 ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x79
	bl sub_0200D71C
	add sp, #0x18
	pop {r4, pc}
	nop
_021F3FB0: .word 0x0000C550
_021F3FB4: .word 0x00000668
_021F3FB8: .word 0x00000854
_021F3FBC: .word 0x00000858
_021F3FC0: .word 0x0000C551
_021F3FC4: .word 0x0000C59C
_021F3FC8: .word 0x0000C55E
_021F3FCC: .word 0x0000C55A
_021F3FD0: .word 0x0000C59A
_021F3FD4: .word 0x0000C55C
_021F3FD8: .word 0x0000C559
	thumb_func_end ov18_021F3E24

	thumb_func_start ov18_021F3FDC
ov18_021F3FDC: ; 0x021F3FDC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021F405C ; =0x0000066C
	ldr r1, _021F4060 ; =0x0000C550
	ldr r0, [r4, r0]
	bl sub_0200D958
	ldr r0, _021F405C ; =0x0000066C
	ldr r1, _021F4064 ; =0x0000C551
	ldr r0, [r4, r0]
	bl sub_0200D968
	ldr r0, _021F405C ; =0x0000066C
	ldr r1, _021F4060 ; =0x0000C550
	ldr r0, [r4, r0]
	bl sub_0200D978
	ldr r0, _021F405C ; =0x0000066C
	ldr r1, _021F4060 ; =0x0000C550
	ldr r0, [r4, r0]
	bl sub_0200D988
	ldr r0, _021F405C ; =0x0000066C
	ldr r1, _021F4068 ; =0x0000C59C
	ldr r0, [r4, r0]
	bl sub_0200D958
	ldr r0, _021F405C ; =0x0000066C
	ldr r1, _021F406C ; =0x0000C55E
	ldr r0, [r4, r0]
	bl sub_0200D968
	ldr r0, _021F405C ; =0x0000066C
	ldr r1, _021F4070 ; =0x0000C55A
	ldr r0, [r4, r0]
	bl sub_0200D978
	ldr r0, _021F405C ; =0x0000066C
	ldr r1, _021F4070 ; =0x0000C55A
	ldr r0, [r4, r0]
	bl sub_0200D988
	ldr r0, _021F405C ; =0x0000066C
	ldr r1, _021F4074 ; =0x0000C59A
	ldr r0, [r4, r0]
	bl sub_0200D958
	ldr r0, _021F405C ; =0x0000066C
	ldr r1, _021F4078 ; =0x0000C55C
	ldr r0, [r4, r0]
	bl sub_0200D968
	ldr r0, _021F405C ; =0x0000066C
	ldr r1, _021F407C ; =0x0000C559
	ldr r0, [r4, r0]
	bl sub_0200D978
	ldr r0, _021F405C ; =0x0000066C
	ldr r1, _021F407C ; =0x0000C559
	ldr r0, [r4, r0]
	bl sub_0200D988
	pop {r4, pc}
	nop
_021F405C: .word 0x0000066C
_021F4060: .word 0x0000C550
_021F4064: .word 0x0000C551
_021F4068: .word 0x0000C59C
_021F406C: .word 0x0000C55E
_021F4070: .word 0x0000C55A
_021F4074: .word 0x0000C59A
_021F4078: .word 0x0000C55C
_021F407C: .word 0x0000C559
	thumb_func_end ov18_021F3FDC

	thumb_func_start ov18_021F4080
ov18_021F4080: ; 0x021F4080
	push {r3, lr}
	mov r1, #1
	str r1, [sp]
	ldr r3, _021F409C ; =0x000018C9
	mov r1, #4
	ldrsb r3, [r0, r3]
	mov r2, #0x20
	lsl r3, r3, #5
	add r3, #0x4c
	lsl r3, r3, #0x10
	asr r3, r3, #0x10
	bl ov18_021F1294
	pop {r3, pc}
	.balign 4, 0
_021F409C: .word 0x000018C9
	thumb_func_end ov18_021F4080

	thumb_func_start ov18_021F40A0
ov18_021F40A0: ; 0x021F40A0
	push {r3, r4, lr}
	sub sp, #4
	mov r1, #9
	mov r2, #0x19
	str r1, [sp]
	add r4, r0, #0
	lsl r2, r2, #8
	ldr r2, [r4, r2]
	ldr r3, _021F40DC ; =_021FA35A
	lsl r2, r2, #0x18
	mov r1, #5
	asr r2, r2, #0x18
	bl ov18_021F61DC
	add r0, r4, #0
	bl ov18_021F65EC
	ldr r2, _021F40E0 ; =0x000018CA
	add r0, r4, #0
	ldrsb r1, [r4, r2]
	add r2, #0x36
	ldr r2, [r4, r2]
	mov r3, #6
	lsl r2, r2, #0x18
	asr r2, r2, #0x18
	bl ov18_021F619C
	add sp, #4
	pop {r3, r4, pc}
	nop
_021F40DC: .word _021FA35A
_021F40E0: .word 0x000018CA
	thumb_func_end ov18_021F40A0

	thumb_func_start ov18_021F40E4
ov18_021F40E4: ; 0x021F40E4
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r3, [r4]
	ldr r1, [r3, #0x10]
	asr r0, r1, #4
	lsr r0, r0, #0x1b
	add r0, r1, r0
	lsl r0, r0, #0xb
	ldr r1, [r3, #0x14]
	lsr r2, r0, #0x10
	asr r0, r1, #4
	lsr r0, r0, #0x1b
	add r0, r1, r0
	lsl r0, r0, #0xb
	lsr r3, r0, #0x10
	cmp r2, #0x17
	blo _021F410E
	sub r2, #0x16
	lsl r0, r2, #0x10
	lsr r2, r0, #0x10
_021F410E:
	lsl r2, r2, #3
	lsl r3, r3, #3
	add r2, #0x44
	add r3, #0x2c
	lsl r2, r2, #0x10
	lsl r3, r3, #0x10
	mov r1, #2
	add r0, r4, #0
	asr r2, r2, #0x10
	asr r3, r3, #0x10
	str r1, [sp]
	bl ov18_021F1294
	add r0, r4, #0
	bl ov18_021F4134
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov18_021F40E4

	thumb_func_start ov18_021F4134
ov18_021F4134: ; 0x021F4134
	push {r3, lr}
	ldr r1, _021F4184 ; =0x000018C8
	ldrsb r1, [r0, r1]
	cmp r1, #0
	ldr r1, [r0]
	bne _021F4162
	ldr r2, [r1, #0x10]
	asr r1, r2, #4
	lsr r1, r1, #0x1b
	add r1, r2, r1
	asr r1, r1, #5
	cmp r1, #0x17
	blt _021F4158
	mov r1, #2
	mov r2, #0
	bl ov18_021F11C0
	pop {r3, pc}
_021F4158:
	mov r1, #2
	mov r2, #1
	bl ov18_021F11C0
	pop {r3, pc}
_021F4162:
	ldr r2, [r1, #0x10]
	asr r1, r2, #4
	lsr r1, r1, #0x1b
	add r1, r2, r1
	asr r1, r1, #5
	cmp r1, #0x17
	blt _021F417A
	mov r1, #2
	mov r2, #1
	bl ov18_021F11C0
	pop {r3, pc}
_021F417A:
	mov r1, #2
	mov r2, #0
	bl ov18_021F11C0
	pop {r3, pc}
	.balign 4, 0
_021F4184: .word 0x000018C8
	thumb_func_end ov18_021F4134

	thumb_func_start ov18_021F4188
ov18_021F4188: ; 0x021F4188
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r5, #0
	mov r7, #0x67
	mov r4, #9
	add r6, #0x24
	lsl r7, r7, #4
_021F4196:
	ldr r1, _021F41C0 ; =_021FA4B8
	add r0, r5, #0
	bl ov18_021F11EC
	str r0, [r6, r7]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	bl ov18_021F1160
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl ov18_021F11C0
	add r4, r4, #1
	add r6, r6, #4
	cmp r4, #0x3b
	blo _021F4196
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F41C0: .word _021FA4B8
	thumb_func_end ov18_021F4188

	thumb_func_start ov18_021F41C4
ov18_021F41C4: ; 0x021F41C4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r0, r5, #0
	add r7, r2, #0
	str r3, [sp]
	ldr r4, [sp, #0x18]
	bl ov18_021E8B24
	cmp r0, #1
	bne _021F41E4
	mov r0, #0x20
	mov r1, #4
	mov r2, #1
	mov r3, #3
	b _021F422C
_021F41E4:
	add r0, r5, #0
	bl ov18_021E8B0C
	cmp r0, #0x12
	bne _021F4204
	mov r0, #0x24
	add r1, r5, #0
	mul r1, r0
	ldr r0, _021F42DC ; =0x0000190C
	mov r3, #2
	ldr r2, [r6, r0]
	ldrb r0, [r2, r1]
	add r1, r2, r1
	ldrb r1, [r1, #1]
	mov r2, #1
	b _021F422C
_021F4204:
	add r0, r5, #0
	bl ov18_021E8B5C
	cmp r0, #1
	bne _021F4218
	mov r0, #0x23
	mov r1, #8
	mov r2, #2
	mov r3, #1
	b _021F422C
_021F4218:
	mov r0, #0x24
	add r1, r5, #0
	mul r1, r0
	ldr r0, _021F42DC ; =0x0000190C
	ldr r2, [r6, r0]
	add r3, r2, r1
	ldrb r0, [r2, r1]
	ldrb r1, [r3, #1]
	ldrb r2, [r3, #2]
	ldrb r3, [r3, #3]
_021F422C:
	cmp r2, #1
	bne _021F4262
	cmp r3, #1
	bne _021F423A
	mov r5, #0
	strb r5, [r4]
	b _021F42AC
_021F423A:
	cmp r3, #2
	bne _021F4244
	mov r5, #6
	strb r5, [r4]
	b _021F42AC
_021F4244:
	cmp r3, #3
	bne _021F424E
	mov r5, #7
	strb r5, [r4]
	b _021F42AC
_021F424E:
	cmp r3, #4
	bne _021F4258
	mov r5, #8
	strb r5, [r4]
	b _021F42AC
_021F4258:
	cmp r3, #5
	bne _021F42AC
	mov r5, #9
	strb r5, [r4]
	b _021F42AC
_021F4262:
	cmp r2, #2
	bne _021F4276
	cmp r3, #1
	bne _021F4270
	mov r5, #1
	strb r5, [r4]
	b _021F42AC
_021F4270:
	mov r5, #0xa
	strb r5, [r4]
	b _021F42AC
_021F4276:
	cmp r2, #3
	bne _021F428A
	cmp r3, #1
	bne _021F4284
	mov r5, #2
	strb r5, [r4]
	b _021F42AC
_021F4284:
	mov r5, #0xb
	strb r5, [r4]
	b _021F42AC
_021F428A:
	cmp r2, #4
	bne _021F4294
	mov r5, #3
	strb r5, [r4]
	b _021F42AC
_021F4294:
	cmp r2, #5
	bne _021F429E
	mov r5, #4
	strb r5, [r4]
	b _021F42AC
_021F429E:
	cmp r2, #6
	bne _021F42A8
	mov r5, #5
	strb r5, [r4]
	b _021F42AC
_021F42A8:
	mov r5, #0
	strb r5, [r4]
_021F42AC:
	lsl r4, r2, #3
	lsr r2, r4, #0x1f
	add r2, r4, r2
	ldr r4, _021F42E0 ; =0x000018C8
	asr r2, r2, #1
	ldrsb r5, [r6, r4]
	mov r4, #0x16
	mul r4, r5
	sub r0, r0, r4
	lsl r0, r0, #3
	add r0, r2, r0
	add r0, #0x40
	lsl r2, r1, #3
	lsl r1, r3, #3
	strh r0, [r7]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	add r1, r2, r0
	ldr r0, [sp]
	add r1, #0x28
	strh r1, [r0]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F42DC: .word 0x0000190C
_021F42E0: .word 0x000018C8
	thumb_func_end ov18_021F41C4

	thumb_func_start ov18_021F42E4
ov18_021F42E4: ; 0x021F42E4
	push {r3, r4, r5, r6, r7, lr}
	add r6, r2, #0
	ldr r2, _021F437C ; =0x00001908
	mov ip, r1
	ldr r2, [r0, r2]
	lsl r1, r1, #2
	ldrb r7, [r2, r1]
	ldr r2, _021F437C ; =0x00001908
	add r4, r3, #0
	sub r2, #0x40
	ldrsb r3, [r0, r2]
	mov r2, #0x16
	ldr r5, [sp, #0x18]
	mul r2, r3
	sub r2, r7, r2
	lsl r2, r2, #3
	add r2, #0x44
	strh r2, [r6]
	ldr r2, _021F437C ; =0x00001908
	ldr r0, [r0, r2]
	add r0, r0, r1
	ldrb r0, [r0, #1]
	lsl r0, r0, #3
	add r0, #0x2c
	strh r0, [r4]
	mov r0, ip
	bl ov18_021E8B18
	cmp r0, #0x7c
	beq _021F4328
	add r1, r0, #0
	sub r1, #0xb2
	cmp r1, #1
	bhi _021F4336
_021F4328:
	mov r0, #6
	strb r0, [r5]
	mov r0, #0
	ldrsh r0, [r4, r0]
	add r0, r0, #4
	strh r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_021F4336:
	cmp r0, #0x60
	beq _021F4340
	ldr r2, _021F4380 ; =0x000001E7
	cmp r0, r2
	bne _021F4352
_021F4340:
	mov r1, #0
	strb r1, [r5]
	ldrsh r0, [r6, r1]
	add r0, r0, #4
	strh r0, [r6]
	ldrsh r0, [r4, r1]
	add r0, r0, #4
	strh r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_021F4352:
	cmp r0, #0x71
	beq _021F4366
	add r1, r2, #0
	sub r1, #0xac
	cmp r0, r1
	beq _021F4366
	add r1, r2, #3
	sub r0, r0, r1
	cmp r0, #2
	bhi _021F4374
_021F4366:
	mov r0, #6
	strb r0, [r5]
	mov r0, #0
	ldrsh r0, [r4, r0]
	add r0, r0, #4
	strh r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_021F4374:
	mov r0, #0
	strb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F437C: .word 0x00001908
_021F4380: .word 0x000001E7
	thumb_func_end ov18_021F42E4

	thumb_func_start ov18_021F4384
ov18_021F4384: ; 0x021F4384
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	mov r1, #0
	add r3, sp, #0xc
	str r1, [sp, #4]
	mov r1, #2
	add r2, sp, #0x10
	add r3, #2
	add r5, r0, #0
	str r1, [sp]
	bl ov18_021F12C8
	mov r0, #0
	str r0, [sp, #0x14]
	ldr r0, _021F4610 ; =0x000018CA
	ldrsb r1, [r5, r0]
	cmp r1, #0
	bne _021F44A8
	add r0, #0x36
	ldr r0, [r5, r0]
	mov r4, #1
	cmp r0, #1
	ble _021F4478
	add r6, sp, #8
_021F43B4:
	add r0, r5, #0
	add r1, r4, #0
	bl ov18_021E8AB0
	cmp r0, #0
	add r0, sp, #8
	bne _021F43DA
	ldr r1, _021F4614 ; =0x000018FC
	str r0, [sp]
	ldr r2, [r5, r1]
	lsl r1, r4, #2
	ldr r1, [r2, r1]
	add r3, sp, #8
	add r0, r5, #0
	add r2, sp, #0xc
	add r3, #2
	bl ov18_021F41C4
	b _021F4400
_021F43DA:
	ldr r1, _021F4614 ; =0x000018FC
	str r0, [sp]
	ldr r1, [r5, r1]
	lsl r7, r4, #2
	add r3, sp, #8
	ldr r1, [r1, r7]
	add r0, r5, #0
	add r2, sp, #0xc
	add r3, #2
	bl ov18_021F42E4
	ldr r0, _021F4614 ; =0x000018FC
	ldr r0, [r5, r0]
	ldr r0, [r0, r7]
	bl ov18_021E8B18
	add r1, sp, #0x14
	bl ov18_021F47C0
_021F4400:
	mov r0, #2
	str r0, [sp]
	mov r2, #4
	mov r3, #2
	add r7, r4, #0
	add r7, #8
	ldrsh r2, [r6, r2]
	ldrsh r3, [r6, r3]
	add r0, r5, #0
	add r1, r7, #0
	bl ov18_021F1294
	ldrb r2, [r6]
	add r0, r5, #0
	add r1, r7, #0
	bl ov18_021F118C
	add r0, r5, #0
	add r1, r7, #0
	mov r2, #1
	bl ov18_021F11C0
	ldrb r0, [r6]
	lsl r1, r0, #1
	ldr r0, _021F4618 ; =_021FA3B0
	add r3, r0, r1
	ldrb r0, [r0, r1]
	lsr r2, r0, #1
	mov r0, #4
	ldrsh r1, [r6, r0]
	mov r0, #8
	ldrsh r7, [r6, r0]
	sub r0, r1, r2
	cmp r7, r0
	blt _021F4468
	add r0, r1, r2
	cmp r7, r0
	bge _021F4468
	ldrb r0, [r3, #1]
	lsr r2, r0, #1
	mov r0, #2
	ldrsh r1, [r6, r0]
	mov r0, #6
	ldrsh r0, [r6, r0]
	sub r3, r1, r2
	cmp r0, r3
	blt _021F4468
	add r1, r1, r2
	cmp r0, r1
	bge _021F4468
	mov r0, #1
	str r0, [sp, #4]
_021F4468:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	mov r0, #0x19
	lsl r0, r0, #8
	ldr r0, [r5, r0]
	cmp r4, r0
	blt _021F43B4
_021F4478:
	add r4, #8
	ldr r1, [sp, #0x14]
	add r0, r5, #0
	add r2, r4, #0
	bl ov18_021F47F8
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _021F4490
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _021F4492
_021F4490:
	b _021F4602
_021F4492:
	add r1, r4, #0
	add r4, sp, #8
	mov r2, #8
	mov r3, #6
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	add r0, r5, #0
	bl ov18_021F4974
	str r0, [sp, #4]
	b _021F4602
_021F44A8:
	add r0, r5, #0
	bl ov18_021F4620
	ldr r1, _021F4610 ; =0x000018CA
	add r0, r5, #0
	ldrsb r1, [r5, r1]
	bl ov18_021E8AB0
	cmp r0, #0
	add r0, sp, #8
	ldr r1, _021F4614 ; =0x000018FC
	bne _021F4542
	str r0, [sp]
	ldr r2, [r5, r1]
	sub r1, #0x32
	ldrsb r1, [r5, r1]
	add r3, sp, #8
	add r0, r5, #0
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	add r2, sp, #0xc
	add r3, #2
	bl ov18_021F41C4
	mov r4, #2
	str r4, [sp]
	add r3, sp, #8
	mov r2, #4
	ldrsh r2, [r3, r2]
	ldrsh r3, [r3, r4]
	add r0, r5, #0
	mov r1, #9
	bl ov18_021F1294
	add r2, sp, #8
	ldrb r2, [r2]
	add r0, r5, #0
	mov r1, #9
	bl ov18_021F118C
	add r0, r5, #0
	mov r1, #9
	mov r2, #1
	bl ov18_021F11C0
	add r0, sp, #8
	ldrb r1, [r0]
	lsl r4, r1, #1
	ldr r1, _021F4618 ; =_021FA3B0
	ldrb r1, [r1, r4]
	lsr r3, r1, #1
	mov r1, #4
	ldrsh r2, [r0, r1]
	mov r1, #8
	ldrsh r1, [r0, r1]
	sub r6, r2, r3
	cmp r1, r6
	blt _021F4602
	add r2, r2, r3
	cmp r1, r2
	bge _021F4602
	ldr r1, _021F461C ; =_021FA3B1
	mov r2, #2
	ldrb r1, [r1, r4]
	ldrsh r3, [r0, r2]
	mov r2, #6
	ldrsh r2, [r0, r2]
	lsr r1, r1, #1
	sub r0, r3, r1
	cmp r2, r0
	blt _021F4602
	add r0, r3, r1
	cmp r2, r0
	bge _021F4602
	mov r0, #1
	str r0, [sp, #4]
	b _021F4602
_021F4542:
	str r0, [sp]
	ldr r2, [r5, r1]
	sub r1, #0x32
	ldrsb r1, [r5, r1]
	add r3, sp, #8
	add r0, r5, #0
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	add r2, sp, #0xc
	add r3, #2
	bl ov18_021F42E4
	ldr r0, _021F4614 ; =0x000018FC
	ldr r1, [r5, r0]
	sub r0, #0x32
	ldrsb r0, [r5, r0]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl ov18_021E8B18
	add r1, sp, #0x14
	bl ov18_021F47C0
	mov r4, #2
	str r4, [sp]
	add r3, sp, #8
	mov r2, #4
	ldrsh r2, [r3, r2]
	ldrsh r3, [r3, r4]
	add r0, r5, #0
	mov r1, #9
	bl ov18_021F1294
	add r2, sp, #8
	ldrb r2, [r2]
	add r0, r5, #0
	mov r1, #9
	bl ov18_021F118C
	add r0, r5, #0
	mov r1, #9
	mov r2, #1
	bl ov18_021F11C0
	add r0, sp, #8
	ldrb r1, [r0]
	lsl r4, r1, #1
	ldr r1, _021F4618 ; =_021FA3B0
	ldrb r1, [r1, r4]
	lsr r3, r1, #1
	mov r1, #4
	ldrsh r2, [r0, r1]
	mov r1, #8
	ldrsh r1, [r0, r1]
	sub r6, r2, r3
	cmp r1, r6
	blt _021F45D8
	add r2, r2, r3
	cmp r1, r2
	bge _021F45D8
	ldr r1, _021F461C ; =_021FA3B1
	mov r2, #2
	ldrb r1, [r1, r4]
	ldrsh r3, [r0, r2]
	mov r2, #6
	ldrsh r2, [r0, r2]
	lsr r1, r1, #1
	sub r0, r3, r1
	cmp r2, r0
	blt _021F45D8
	add r0, r3, r1
	cmp r2, r0
	bge _021F45D8
	mov r0, #1
	str r0, [sp, #4]
_021F45D8:
	ldr r1, [sp, #0x14]
	add r0, r5, #0
	mov r2, #0xa
	bl ov18_021F47F8
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _021F4602
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _021F4602
	add r4, sp, #8
	mov r2, #8
	mov r3, #6
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	add r0, r5, #0
	mov r1, #0xa
	bl ov18_021F4974
	str r0, [sp, #4]
_021F4602:
	ldr r1, [sp, #4]
	add r0, r5, #0
	bl ov18_021F69C0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F4610: .word 0x000018CA
_021F4614: .word 0x000018FC
_021F4618: .word _021FA3B0
_021F461C: .word _021FA3B1
	thumb_func_end ov18_021F4384

	thumb_func_start ov18_021F4620
ov18_021F4620: ; 0x021F4620
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r4, #9
	mov r6, #0
_021F4628:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov18_021F11C0
	add r4, r4, #1
	cmp r4, #0x3b
	blo _021F4628
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov18_021F4620

	thumb_func_start ov18_021F463C
ov18_021F463C: ; 0x021F463C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	mov r1, #0
	str r1, [sp, #8]
	str r1, [sp, #4]
	ldr r1, _021F47B0 ; =0x000018CA
	add r5, r0, #0
	ldrsb r2, [r5, r1]
	cmp r2, #0
	bne _021F470A
	add r1, #0x36
	ldr r0, [r5, r1]
	mov r4, #1
	cmp r0, #1
	ble _021F46EC
	ldr r7, _021F47B4 ; =0x000018CB
	add r6, r7, #0
_021F465E:
	ldrb r2, [r5, r6]
	add r0, r5, #0
	add r1, r4, #0
	lsl r2, r2, #0x19
	lsr r2, r2, #0x1f
	bl ov18_021E8ACC
	cmp r0, #0
	beq _021F4694
	lsl r0, r4, #2
	add r1, r5, r0
	mov r0, #0x69
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	ldrb r1, [r5, r7]
	lsl r1, r1, #0x19
	lsr r1, r1, #0x1f
	add r1, r1, #4
	bl sub_0200DD10
	add r1, r4, #0
	add r0, r5, #0
	add r1, #8
	mov r2, #1
	bl ov18_021F11C0
	b _021F46BE
_021F4694:
	add r1, r4, #0
	add r0, r5, #0
	add r1, #8
	mov r2, #0
	bl ov18_021F11C0
	add r0, r5, #0
	add r1, r4, #0
	bl ov18_021E8AB0
	cmp r0, #0
	beq _021F46BE
	ldr r0, _021F47B8 ; =0x000018FC
	ldr r1, [r5, r0]
	lsl r0, r4, #2
	ldr r0, [r1, r0]
	bl ov18_021E8B18
	add r1, sp, #4
	bl ov18_021F47C0
_021F46BE:
	add r0, r5, #0
	add r1, r4, #0
	bl ov18_021E8AB0
	cmp r0, #0
	beq _021F46DC
	ldr r0, _021F47B8 ; =0x000018FC
	ldr r1, [r5, r0]
	lsl r0, r4, #2
	ldr r0, [r1, r0]
	bl ov18_021E8B18
	add r1, sp, #8
	bl ov18_021F47C0
_021F46DC:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	mov r0, #0x19
	lsl r0, r0, #8
	ldr r0, [r5, r0]
	cmp r4, r0
	blt _021F465E
_021F46EC:
	ldr r0, _021F47B4 ; =0x000018CB
	add r4, #8
	ldrb r0, [r5, r0]
	add r3, r4, #0
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1f
	add r0, r0, #4
	str r0, [sp]
	ldr r1, [sp, #8]
	ldr r2, [sp, #4]
	add r0, r5, #0
	bl ov18_021F48AC
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_021F470A:
	bl ov18_021F4620
	ldr r2, _021F47B0 ; =0x000018CA
	add r0, r5, #0
	ldrsb r1, [r5, r2]
	add r2, r2, #1
	ldrb r2, [r5, r2]
	lsl r2, r2, #0x19
	lsr r2, r2, #0x1f
	bl ov18_021E8ACC
	cmp r0, #0
	beq _021F4742
	ldr r1, _021F47B4 ; =0x000018CB
	ldr r0, _021F47BC ; =0x00000694
	ldrb r1, [r5, r1]
	ldr r0, [r5, r0]
	lsl r1, r1, #0x19
	lsr r1, r1, #0x1f
	add r1, r1, #4
	bl sub_0200DD10
	add r0, r5, #0
	mov r1, #9
	mov r2, #1
	bl ov18_021F11C0
	b _021F4770
_021F4742:
	add r0, r5, #0
	mov r1, #9
	mov r2, #0
	bl ov18_021F11C0
	ldr r1, _021F47B0 ; =0x000018CA
	add r0, r5, #0
	ldrsb r1, [r5, r1]
	bl ov18_021E8AB0
	cmp r0, #0
	beq _021F4770
	ldr r0, _021F47B8 ; =0x000018FC
	ldr r1, [r5, r0]
	sub r0, #0x32
	ldrsb r0, [r5, r0]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl ov18_021E8B18
	add r1, sp, #4
	bl ov18_021F47C0
_021F4770:
	ldr r1, _021F47B0 ; =0x000018CA
	add r0, r5, #0
	ldrsb r1, [r5, r1]
	bl ov18_021E8AB0
	cmp r0, #0
	beq _021F4794
	ldr r0, _021F47B8 ; =0x000018FC
	ldr r1, [r5, r0]
	sub r0, #0x32
	ldrsb r0, [r5, r0]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl ov18_021E8B18
	add r1, sp, #8
	bl ov18_021F47C0
_021F4794:
	ldr r0, _021F47B4 ; =0x000018CB
	mov r3, #0xa
	ldrb r0, [r5, r0]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1f
	add r0, r0, #4
	str r0, [sp]
	ldr r1, [sp, #8]
	ldr r2, [sp, #4]
	add r0, r5, #0
	bl ov18_021F48AC
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021F47B0: .word 0x000018CA
_021F47B4: .word 0x000018CB
_021F47B8: .word 0x000018FC
_021F47BC: .word 0x00000694
	thumb_func_end ov18_021F463C

	thumb_func_start ov18_021F47C0
ov18_021F47C0: ; 0x021F47C0
	cmp r0, #0x6a
	bne _021F47CE
	ldr r2, [r1]
	mov r0, #1
	orr r0, r2
	str r0, [r1]
	bx lr
_021F47CE:
	cmp r0, #0x78
	beq _021F47DA
	add r2, r0, #0
	sub r2, #0xed
	cmp r2, #2
	bhi _021F47E4
_021F47DA:
	ldr r2, [r1]
	mov r0, #2
	orr r0, r2
	str r0, [r1]
	bx lr
_021F47E4:
	cmp r0, #0x7b
	beq _021F47EC
	cmp r0, #0xb0
	bne _021F47F4
_021F47EC:
	ldr r2, [r1]
	mov r0, #4
	orr r0, r2
	str r0, [r1]
_021F47F4:
	bx lr
	.balign 4, 0
	thumb_func_end ov18_021F47C0

	thumb_func_start ov18_021F47F8
ov18_021F47F8: ; 0x021F47F8
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r1, #0
	mov r1, #1
	add r5, r0, #0
	add r4, r2, #0
	tst r1, r6
	beq _021F482C
	mov r1, #2
	str r1, [sp]
	add r1, r4, #0
	mov r2, #0x94
	mov r3, #0x4c
	bl ov18_021F1294
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl ov18_021F118C
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	bl ov18_021F11C0
	add r4, r4, #1
_021F482C:
	mov r0, #2
	add r1, r6, #0
	tst r1, r0
	beq _021F4858
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0xec
	mov r3, #0x4c
	bl ov18_021F1294
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl ov18_021F118C
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	bl ov18_021F11C0
	add r4, r4, #1
_021F4858:
	mov r0, #4
	tst r0, r6
	beq _021F48A6
	mov r0, #2
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0xe4
	mov r3, #0x5c
	bl ov18_021F1294
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl ov18_021F118C
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	bl ov18_021F11C0
	mov r0, #2
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #1
	mov r2, #0xdc
	mov r3, #0x7c
	bl ov18_021F1294
	add r0, r5, #0
	add r1, r4, #1
	mov r2, #0
	bl ov18_021F118C
	add r0, r5, #0
	add r1, r4, #1
	mov r2, #1
	bl ov18_021F11C0
_021F48A6:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov18_021F47F8

	thumb_func_start ov18_021F48AC
ov18_021F48AC: ; 0x021F48AC
	push {r3, r4, r5, r6, r7, lr}
	add r7, r2, #0
	mov r2, #1
	add r5, r0, #0
	add r6, r1, #0
	add r4, r3, #0
	tst r1, r2
	beq _021F48E4
	add r1, r7, #0
	tst r1, r2
	beq _021F48CC
	add r1, r4, #0
	mov r2, #0
	bl ov18_021F11C0
	b _021F48E2
_021F48CC:
	add r1, r4, #0
	bl ov18_021F11C0
	lsl r0, r4, #2
	add r1, r5, r0
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	ldr r1, [sp, #0x18]
	bl sub_0200DD10
_021F48E2:
	add r4, r4, #1
_021F48E4:
	mov r0, #2
	add r1, r6, #0
	tst r1, r0
	beq _021F4918
	tst r0, r7
	beq _021F48FC
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl ov18_021F11C0
	b _021F4916
_021F48FC:
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	bl ov18_021F11C0
	lsl r0, r4, #2
	add r1, r5, r0
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	ldr r1, [sp, #0x18]
	bl sub_0200DD10
_021F4916:
	add r4, r4, #1
_021F4918:
	mov r0, #4
	add r1, r6, #0
	tst r1, r0
	beq _021F496C
	tst r0, r7
	beq _021F493A
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl ov18_021F11C0
	add r0, r5, #0
	add r1, r4, #1
	mov r2, #0
	bl ov18_021F11C0
	pop {r3, r4, r5, r6, r7, pc}
_021F493A:
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	bl ov18_021F11C0
	add r0, r5, #0
	add r1, r4, #1
	mov r2, #1
	bl ov18_021F11C0
	lsl r4, r4, #2
	mov r0, #0x67
	ldr r6, [sp, #0x18]
	add r1, r5, r4
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	add r1, r6, #0
	bl sub_0200DD10
	ldr r0, _021F4970 ; =0x00000674
	add r1, r5, r4
	ldr r0, [r1, r0]
	add r1, r6, #0
	bl sub_0200DD10
_021F496C:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F4970: .word 0x00000674
	thumb_func_end ov18_021F48AC

	thumb_func_start ov18_021F4974
ov18_021F4974: ; 0x021F4974
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r1, #0
	str r0, [sp, #4]
	add r0, r5, #4
	add r6, r2, #0
	add r7, r3, #0
	str r0, [sp, #8]
	cmp r5, r0
	bhs _021F49EE
	ldr r0, [sp, #4]
	lsl r1, r5, #2
	add r4, r0, r1
_021F498E:
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_0200DCFC
	cmp r0, #0
	beq _021F49E4
	mov r0, #2
	str r0, [sp]
	add r2, sp, #0xc
	ldr r0, [sp, #4]
	add r1, r5, #0
	add r2, #2
	add r3, sp, #0xc
	bl ov18_021F12C8
	ldr r0, _021F49F4 ; =_021FA3B0
	add r2, sp, #0xc
	ldrb r0, [r0]
	mov r1, #2
	ldrsh r2, [r2, r1]
	lsr r0, r0, #1
	sub r1, r2, r0
	cmp r6, r1
	blt _021F49E4
	add r0, r2, r0
	cmp r6, r0
	bge _021F49E4
	ldr r0, _021F49F4 ; =_021FA3B0
	add r2, sp, #0xc
	ldrb r0, [r0, #1]
	mov r1, #0
	ldrsh r2, [r2, r1]
	lsr r0, r0, #1
	sub r1, r2, r0
	cmp r7, r1
	blt _021F49E4
	add r0, r2, r0
	cmp r7, r0
	bge _021F49E4
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021F49E4:
	ldr r0, [sp, #8]
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, r0
	blo _021F498E
_021F49EE:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F49F4: .word _021FA3B0
	thumb_func_end ov18_021F4974

	thumb_func_start ov18_021F49F8
ov18_021F49F8: ; 0x021F49F8
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	bl ov18_021F4A6C
	mov r6, #1
	mov r4, #0x34
	add r5, r7, #4
_021F4A06:
	add r2, r4, #0
	ldr r1, _021F4A4C ; =_021FA7B0
	sub r2, #0x34
	add r0, r7, #0
	add r1, r1, r2
	bl ov18_021F11EC
	mov r1, #0x67
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r6, r6, #1
	add r4, #0x34
	add r5, r5, #4
	cmp r6, #0xa
	blo _021F4A06
	add r0, r7, #0
	bl ov18_021F4D64
	add r0, r7, #0
	bl ov18_021F4DDC
	add r0, r7, #0
	bl ov18_021F4E28
	add r0, r7, #0
	mov r1, #3
	mov r2, #0
	bl ov18_021F11C0
	add r0, r7, #0
	mov r1, #5
	mov r2, #0
	bl ov18_021F11C0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F4A4C: .word _021FA7B0
	thumb_func_end ov18_021F49F8

	thumb_func_start ov18_021F4A50
ov18_021F4A50: ; 0x021F4A50
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #1
_021F4A56:
	add r0, r5, #0
	add r1, r4, #0
	bl ov18_021F10E8
	add r4, r4, #1
	cmp r4, #0xa
	blo _021F4A56
	add r0, r5, #0
	bl ov18_021F4CC4
	pop {r3, r4, r5, pc}
	thumb_func_end ov18_021F4A50

	thumb_func_start ov18_021F4A6C
ov18_021F4A6C: ; 0x021F4A6C
	push {r4, lr}
	sub sp, #0x18
	mov r1, #1
	add r4, r0, #0
	bl ov18_021F1324
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _021F4C98 ; =0x0000C551
	ldr r1, _021F4C9C ; =0x00000668
	str r0, [sp, #8]
	ldr r2, _021F4CA0 ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x4c
	bl sub_0200D504
	bl sub_02074490
	ldr r2, _021F4CA4 ; =0x00000858
	ldr r3, _021F4C9C ; =0x00000668
	ldr r1, [r4, r2]
	sub r2, #8
	str r1, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r1, #3
	str r1, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	ldr r0, _021F4C98 ; =0x0000C551
	str r0, [sp, #0x14]
	ldr r0, [r4, r2]
	ldr r2, [r4, r3]
	add r3, r3, #4
	ldr r3, [r4, r3]
	bl sub_0200D68C
	mov r0, #1
	str r0, [sp]
	ldr r0, _021F4CA8 ; =0x0000C55A
	ldr r1, _021F4C9C ; =0x00000668
	str r0, [sp, #4]
	ldr r2, _021F4CA0 ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x6a
	bl sub_0200D6EC
	mov r0, #1
	str r0, [sp]
	ldr r0, _021F4CA8 ; =0x0000C55A
	ldr r1, _021F4C9C ; =0x00000668
	str r0, [sp, #4]
	ldr r2, _021F4CA0 ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x6b
	bl sub_0200D71C
	mov r0, #1
	str r0, [sp]
	ldr r0, _021F4CAC ; =0x0000C55B
	ldr r1, _021F4C9C ; =0x00000668
	str r0, [sp, #4]
	ldr r2, _021F4CA0 ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x70
	bl sub_0200D6EC
	mov r0, #1
	str r0, [sp]
	ldr r0, _021F4CAC ; =0x0000C55B
	ldr r1, _021F4C9C ; =0x00000668
	str r0, [sp, #4]
	ldr r2, _021F4CA0 ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x71
	bl sub_0200D71C
	ldr r0, [r4]
	ldr r0, [r0, #4]
	bl PlayerProfile_GetTrainerGender
	cmp r0, #0
	ldr r1, _021F4C9C ; =0x00000668
	bne _021F4BE8
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021F4CB0 ; =0x0000C59B
	ldr r2, _021F4CA0 ; =0x00000854
	str r0, [sp, #8]
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x69
	bl sub_0200D504
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _021F4CB4 ; =0x0000C59C
	ldr r1, _021F4C9C ; =0x00000668
	str r0, [sp, #8]
	ldr r2, _021F4CA0 ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x69
	bl sub_0200D504
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _021F4CB8 ; =0x0000C59D
	ldr r1, _021F4C9C ; =0x00000668
	str r0, [sp, #8]
	ldr r2, _021F4CA0 ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x6f
	bl sub_0200D504
	ldr r0, _021F4CA0 ; =0x00000854
	ldr r3, _021F4C9C ; =0x00000668
	ldr r1, [r4, r0]
	sub r0, r0, #4
	str r1, [sp]
	mov r1, #0x6c
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	mov r1, #1
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r1, _021F4CBC ; =0x0000C55D
	str r1, [sp, #0x14]
	ldr r2, [r4, r3]
	add r3, r3, #4
	ldr r0, [r4, r0]
	ldr r3, [r4, r3]
	mov r1, #2
	bl sub_0200D68C
	ldr r0, _021F4CA0 ; =0x00000854
	ldr r3, _021F4C9C ; =0x00000668
	ldr r1, [r4, r0]
	sub r0, r0, #4
	str r1, [sp]
	mov r1, #0x6c
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	mov r1, #1
	str r1, [sp, #0xc]
	mov r1, #2
	str r1, [sp, #0x10]
	ldr r1, _021F4CC0 ; =0x0000C55E
	str r1, [sp, #0x14]
	ldr r2, [r4, r3]
	add r3, r3, #4
	ldr r0, [r4, r0]
	ldr r3, [r4, r3]
	mov r1, #3
	bl sub_0200D68C
	add sp, #0x18
	pop {r4, pc}
_021F4BE8:
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021F4CB0 ; =0x0000C59B
	ldr r2, _021F4CA0 ; =0x00000854
	str r0, [sp, #8]
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x6d
	bl sub_0200D504
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _021F4CB4 ; =0x0000C59C
	ldr r1, _021F4C9C ; =0x00000668
	str r0, [sp, #8]
	ldr r2, _021F4CA0 ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x6d
	bl sub_0200D504
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _021F4CB8 ; =0x0000C59D
	ldr r1, _021F4C9C ; =0x00000668
	str r0, [sp, #8]
	ldr r2, _021F4CA0 ; =0x00000854
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	mov r3, #0x72
	bl sub_0200D504
	ldr r0, _021F4CA0 ; =0x00000854
	ldr r3, _021F4C9C ; =0x00000668
	ldr r1, [r4, r0]
	sub r0, r0, #4
	str r1, [sp]
	mov r1, #0x6e
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	mov r1, #1
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r1, _021F4CBC ; =0x0000C55D
	str r1, [sp, #0x14]
	ldr r2, [r4, r3]
	add r3, r3, #4
	ldr r0, [r4, r0]
	ldr r3, [r4, r3]
	mov r1, #2
	bl sub_0200D68C
	ldr r0, _021F4CA0 ; =0x00000854
	ldr r3, _021F4C9C ; =0x00000668
	ldr r1, [r4, r0]
	sub r0, r0, #4
	str r1, [sp]
	mov r1, #0x6e
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	mov r1, #1
	str r1, [sp, #0xc]
	mov r1, #2
	str r1, [sp, #0x10]
	ldr r1, _021F4CC0 ; =0x0000C55E
	str r1, [sp, #0x14]
	ldr r2, [r4, r3]
	add r3, r3, #4
	ldr r0, [r4, r0]
	ldr r3, [r4, r3]
	mov r1, #3
	bl sub_0200D68C
	add sp, #0x18
	pop {r4, pc}
	.balign 4, 0
_021F4C98: .word 0x0000C551
_021F4C9C: .word 0x00000668
_021F4CA0: .word 0x00000854
_021F4CA4: .word 0x00000858
_021F4CA8: .word 0x0000C55A
_021F4CAC: .word 0x0000C55B
_021F4CB0: .word 0x0000C59B
_021F4CB4: .word 0x0000C59C
_021F4CB8: .word 0x0000C59D
_021F4CBC: .word 0x0000C55D
_021F4CC0: .word 0x0000C55E
	thumb_func_end ov18_021F4A6C

	thumb_func_start ov18_021F4CC4
ov18_021F4CC4: ; 0x021F4CC4
	push {r4, lr}
	mov r1, #1
	add r4, r0, #0
	bl ov18_021F13DC
	ldr r0, _021F4D40 ; =0x0000066C
	ldr r1, _021F4D44 ; =0x0000C551
	ldr r0, [r4, r0]
	bl sub_0200D958
	ldr r0, _021F4D40 ; =0x0000066C
	ldr r1, _021F4D44 ; =0x0000C551
	ldr r0, [r4, r0]
	bl sub_0200D968
	ldr r0, _021F4D40 ; =0x0000066C
	ldr r1, _021F4D48 ; =0x0000C55A
	ldr r0, [r4, r0]
	bl sub_0200D978
	ldr r0, _021F4D40 ; =0x0000066C
	ldr r1, _021F4D48 ; =0x0000C55A
	ldr r0, [r4, r0]
	bl sub_0200D988
	ldr r0, _021F4D40 ; =0x0000066C
	ldr r1, _021F4D4C ; =0x0000C55B
	ldr r0, [r4, r0]
	bl sub_0200D978
	ldr r0, _021F4D40 ; =0x0000066C
	ldr r1, _021F4D4C ; =0x0000C55B
	ldr r0, [r4, r0]
	bl sub_0200D988
	ldr r0, _021F4D40 ; =0x0000066C
	ldr r1, _021F4D50 ; =0x0000C59B
	ldr r0, [r4, r0]
	bl sub_0200D958
	ldr r0, _021F4D40 ; =0x0000066C
	ldr r1, _021F4D54 ; =0x0000C59C
	ldr r0, [r4, r0]
	bl sub_0200D958
	ldr r0, _021F4D40 ; =0x0000066C
	ldr r1, _021F4D58 ; =0x0000C59D
	ldr r0, [r4, r0]
	bl sub_0200D958
	ldr r0, _021F4D40 ; =0x0000066C
	ldr r1, _021F4D5C ; =0x0000C55D
	ldr r0, [r4, r0]
	bl sub_0200D968
	ldr r0, _021F4D40 ; =0x0000066C
	ldr r1, _021F4D60 ; =0x0000C55E
	ldr r0, [r4, r0]
	bl sub_0200D968
	pop {r4, pc}
	nop
_021F4D40: .word 0x0000066C
_021F4D44: .word 0x0000C551
_021F4D48: .word 0x0000C55A
_021F4D4C: .word 0x0000C55B
_021F4D50: .word 0x0000C59B
_021F4D54: .word 0x0000C59C
_021F4D58: .word 0x0000C59D
_021F4D5C: .word 0x0000C55D
_021F4D60: .word 0x0000C55E
	thumb_func_end ov18_021F4CC4

	thumb_func_start ov18_021F4D64
ov18_021F4D64: ; 0x021F4D64
	push {r3, r4, r5, lr}
	ldr r1, _021F4DD0 ; =0x000018A4
	add r5, r0, #0
	ldrb r3, [r5, r1]
	mov r0, #0x80
	add r2, r3, #0
	tst r2, r0
	beq _021F4D8E
	eor r0, r3
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	sub r0, r1, #2
	ldrh r0, [r5, r0]
	cmp r0, #0xac
	bne _021F4D90
	cmp r4, #2
	bne _021F4D8A
	mov r4, #1
	b _021F4D90
_021F4D8A:
	mov r4, #0
	b _021F4D90
_021F4D8E:
	mov r4, #0
_021F4D90:
	ldr r1, _021F4DD4 ; =0x000018A2
	add r0, r5, #0
	ldrh r1, [r5, r1]
	add r2, r4, #0
	mov r3, #2
	bl ov18_021F14FC
	ldr r1, _021F4DD4 ; =0x000018A2
	add r0, r5, #0
	ldrh r1, [r5, r1]
	add r2, r4, #0
	mov r3, #3
	bl ov18_021F1534
	ldr r0, _021F4DD8 ; =0x0000068C
	mov r1, #2
	ldr r0, [r5, r0]
	bl sub_0200DF98
	ldr r0, _021F4DD8 ; =0x0000068C
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_0200E074
	ldr r0, _021F4DD8 ; =0x0000068C
	mov r1, #0
	ldr r0, [r5, r0]
	sub r2, r1, #4
	bl sub_0200E0CC
	pop {r3, r4, r5, pc}
	nop
_021F4DD0: .word 0x000018A4
_021F4DD4: .word 0x000018A2
_021F4DD8: .word 0x0000068C
	thumb_func_end ov18_021F4D64

	thumb_func_start ov18_021F4DDC
ov18_021F4DDC: ; 0x021F4DDC
	push {r3, r4, r5, lr}
	sub sp, #8
	add r2, sp, #4
	mov r1, #0
	add r2, #1
	add r3, sp, #4
	add r5, r0, #0
	bl ov18_021F3CA8
	ldr r1, _021F4E20 ; =0x000018CC
	mov r0, #2
	add r4, r5, r1
	str r0, [sp]
	sub r1, #0x2a
	add r3, sp, #4
	ldrb r2, [r3, #1]
	ldrh r1, [r5, r1]
	ldrb r3, [r3]
	add r0, r5, #0
	bl ov18_021F69E8
	ldr r0, _021F4E24 ; =0x000018A2
	ldr r1, [r4, #8]
	ldrh r0, [r5, r0]
	ldr r2, [r4, #0xc]
	lsl r3, r0, #1
	ldrsh r1, [r1, r3]
	ldrsh r2, [r2, r3]
	add r0, r5, #0
	bl ov18_021F6AB0
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_021F4E20: .word 0x000018CC
_021F4E24: .word 0x000018A2
	thumb_func_end ov18_021F4DDC

	thumb_func_start ov18_021F4E28
ov18_021F4E28: ; 0x021F4E28
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r1, _021F4EA4 ; =0x000018CC
	add r4, r0, #0
	add r2, r4, r1
	sub r1, #0x2a
	ldrh r1, [r4, r1]
	ldr r2, [r2, #4]
	mov r0, #1
	lsl r1, r1, #1
	ldrsh r1, [r2, r1]
	lsl r0, r0, #0x14
	lsl r1, r1, #0xc
	bl FX_Div
	bl _fflt
	ldr r1, _021F4EA8 ; =0x45800000
	bl _fdiv
	add r5, r0, #0
	ldr r0, _021F4EAC ; =0x00000674
	mov r1, #2
	ldr r0, [r4, r0]
	bl sub_0200DF98
	ldr r0, _021F4EAC ; =0x00000674
	add r1, r5, #0
	ldr r0, [r4, r0]
	add r2, r5, #0
	bl sub_0200E024
	mov r0, #2
	add r2, sp, #4
	str r0, [sp]
	add r0, r4, #0
	mov r1, #1
	add r2, #2
	add r3, sp, #4
	bl ov18_021F12C8
	mov r2, #2
	ldr r6, _021F4EA4 ; =0x000018CC
	str r2, [sp]
	add r5, sp, #4
	mov r3, #0
	ldrsh r2, [r5, r2]
	ldrsh r5, [r5, r3]
	ldr r3, [r4, r6]
	sub r6, #0x2a
	add r0, r4, #0
	ldrh r4, [r4, r6]
	mov r1, #1
	lsl r4, r4, #1
	ldrsh r3, [r3, r4]
	add r3, r5, r3
	lsl r3, r3, #0x10
	asr r3, r3, #0x10
	bl ov18_021F1294
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021F4EA4: .word 0x000018CC
_021F4EA8: .word 0x45800000
_021F4EAC: .word 0x00000674
	thumb_func_end ov18_021F4E28

	thumb_func_start ov18_021F4EB0
ov18_021F4EB0: ; 0x021F4EB0
	push {r3, r4, r5, r6, r7, lr}
	asr r0, r0, #4
	lsl r6, r0, #1
	add r5, r1, #0
	ldr r0, _021F4F90 ; =FX_SinCosTable_
	lsl r1, r6, #1
	ldrsh r7, [r0, r1]
	add r4, r2, #0
	add r0, r7, #0
	bl _fflt
	ldr r1, _021F4F94 ; =0x45800000
	bl _fdiv
	mov r1, #0
	bl _fgr
	bls _021F4EF4
	add r0, r7, #0
	bl _fflt
	ldr r1, _021F4F94 ; =0x45800000
	bl _fdiv
	add r1, r0, #0
	ldr r0, _021F4F94 ; =0x45800000
	bl _fmul
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _021F4F10
_021F4EF4:
	add r0, r7, #0
	bl _fflt
	ldr r1, _021F4F94 ; =0x45800000
	bl _fdiv
	add r1, r0, #0
	ldr r0, _021F4F94 ; =0x45800000
	bl _fmul
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_021F4F10:
	bl _ffix
	add r7, r0, #0
	add r0, r6, #1
	lsl r1, r0, #1
	ldr r0, _021F4F90 ; =FX_SinCosTable_
	ldrsh r6, [r0, r1]
	add r0, r6, #0
	bl _fflt
	ldr r1, _021F4F94 ; =0x45800000
	bl _fdiv
	mov r1, #0
	bl _fgr
	bls _021F4F52
	add r0, r6, #0
	bl _fflt
	ldr r1, _021F4F94 ; =0x45800000
	bl _fdiv
	add r1, r0, #0
	ldr r0, _021F4F94 ; =0x45800000
	bl _fmul
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _021F4F6E
_021F4F52:
	add r0, r6, #0
	bl _fflt
	ldr r1, _021F4F94 ; =0x45800000
	bl _fdiv
	add r1, r0, #0
	ldr r0, _021F4F94 ; =0x45800000
	bl _fmul
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_021F4F6E:
	bl _ffix
	mov r2, #0
	ldrsh r1, [r5, r2]
	mov r3, #0x38
	add r6, r7, #0
	mul r6, r3
	asr r6, r6, #0xc
	add r1, r1, r6
	strh r1, [r5]
	add r1, r0, #0
	mul r1, r3
	ldrsh r2, [r4, r2]
	asr r0, r1, #0xc
	add r0, r2, r0
	strh r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F4F90: .word FX_SinCosTable_
_021F4F94: .word 0x45800000
	thumb_func_end ov18_021F4EB0

	thumb_func_start ov18_021F4F98
ov18_021F4F98: ; 0x021F4F98
	push {r0, r1, r2, r3}
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r0, r2, #0
	add r1, sp, #0x1c
	add r2, sp, #0x20
	bl ov18_021F4EB0
	mov r0, #1
	str r0, [sp]
	add r1, r4, #0
	add r4, sp, #0x10
	mov r2, #0xc
	mov r3, #0x10
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	add r0, r5, #0
	bl ov18_021F1294
	pop {r3, r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
	thumb_func_end ov18_021F4F98

	thumb_func_start ov18_021F4FC8
ov18_021F4FC8: ; 0x021F4FC8
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r1, #0
	mov r1, #1
	str r1, [sp]
	add r1, r2, #0
	add r2, sp, #4
	add r2, #2
	add r3, sp, #4
	add r5, r0, #0
	bl ov18_021F12C8
	add r6, sp, #4
	mov r3, #0
	ldrsh r0, [r6, r3]
	mov r2, #2
	add r1, r4, #0
	sub r0, #0x10
	strh r0, [r6]
	mov r0, #1
	str r0, [sp]
	ldrsh r2, [r6, r2]
	ldrsh r3, [r6, r3]
	add r0, r5, #0
	bl ov18_021F1294
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ov18_021F4FC8

	thumb_func_start ov18_021F5000
ov18_021F5000: ; 0x021F5000
	push {r3, r4, r5, lr}
	ldr r2, _021F5048 ; =0xFFFFC000
	add r4, r1, #0
	sub r2, r2, r4
	mov r1, #0x68
	lsl r2, r2, #0x10
	str r1, [sp]
	mov r1, #8
	lsr r2, r2, #0x10
	mov r3, #0x80
	add r5, r0, #0
	bl ov18_021F4F98
	mov r2, #1
	lsl r2, r2, #0xe
	sub r2, r2, r4
	mov r0, #0x68
	lsl r2, r2, #0x10
	str r0, [sp]
	add r0, r5, #0
	mov r1, #9
	lsr r2, r2, #0x10
	mov r3, #0x80
	bl ov18_021F4F98
	add r0, r5, #0
	mov r1, #2
	mov r2, #8
	bl ov18_021F4FC8
	add r0, r5, #0
	mov r1, #4
	mov r2, #9
	bl ov18_021F4FC8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021F5048: .word 0xFFFFC000
	thumb_func_end ov18_021F5000

	thumb_func_start ov18_021F504C
ov18_021F504C: ; 0x021F504C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	str r5, [r4]
	mov r0, #0
	str r0, [r4, #4]
	strb r0, [r4, #0xb]
	ldr r0, [r5]
	ldr r0, [r0, #4]
	bl PlayerProfile_GetTrainerGender
	cmp r0, #0
	bne _021F506C
	mov r0, #0x19
	lsl r0, r0, #4
	b _021F506E
_021F506C:
	ldr r0, _021F50B4 ; =0x0000019A
_021F506E:
	ldr r1, _021F50B8 ; =0x0000184C
	ldr r2, [r5, r1]
	add r1, #0x56
	ldrh r1, [r5, r1]
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	cmp r1, r0
	blo _021F5086
	add r2, r0, #0
	add r0, r1, #0
	mov r1, #0
	b _021F508A
_021F5086:
	add r2, r1, #0
	mov r1, #1
_021F508A:
	strb r1, [r4, #0xa]
	sub r0, r0, r2
	mov r1, #0xa
	bl _u32_div_f
	ldr r3, _021F50BC ; =_021FA5CC
	mov r2, #0
_021F5098:
	ldrh r1, [r3]
	cmp r0, r1
	blo _021F50A8
	ldrh r1, [r3, #2]
	cmp r0, r1
	bhi _021F50A8
	strh r2, [r4, #8]
	pop {r3, r4, r5, pc}
_021F50A8:
	add r2, r2, #1
	add r3, r3, #4
	cmp r2, #0x11
	blo _021F5098
	pop {r3, r4, r5, pc}
	nop
_021F50B4: .word 0x0000019A
_021F50B8: .word 0x0000184C
_021F50BC: .word _021FA5CC
	thumb_func_end ov18_021F504C

	thumb_func_start ov18_021F50C0
ov18_021F50C0: ; 0x021F50C0
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	add r2, sp, #8
	ldr r0, [r4]
	mov r1, #2
	add r2, #2
	add r3, sp, #8
	bl ov18_021F12C8
	mov r0, #1
	str r0, [sp]
	add r2, sp, #4
	ldr r0, [r4]
	mov r1, #4
	add r2, #2
	add r3, sp, #4
	bl ov18_021F12C8
	mov r0, #1
	ldr r1, [r4, #4]
	lsl r0, r0, #0xa
	add r0, r1, r0
	str r0, [r4, #4]
	add r2, sp, #4
	mov r1, #4
	ldrsh r3, [r2, r1]
	asr r0, r0, #0xc
	add r0, r3, r0
	strh r0, [r2, #4]
	mov r0, #0
	ldrsh r3, [r2, r0]
	ldr r0, [r4, #4]
	asr r0, r0, #0xc
	add r0, r3, r0
	strh r0, [r2]
	ldrsh r3, [r2, r1]
	cmp r3, #0x58
	blt _021F513E
	mov r0, #1
	str r0, [sp]
	mov r3, #6
	ldrsh r2, [r2, r3]
	ldr r0, [r4]
	mov r1, #2
	mov r3, #0x58
	bl ov18_021F1294
	mov r0, #1
	str r0, [sp]
	add r3, sp, #4
	mov r2, #2
	ldrsh r2, [r3, r2]
	ldr r0, [r4]
	mov r1, #4
	mov r3, #0x58
	bl ov18_021F1294
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, pc}
_021F513E:
	mov r0, #1
	str r0, [sp]
	mov r5, #6
	ldrsh r2, [r2, r5]
	ldr r0, [r4]
	mov r1, #2
	bl ov18_021F1294
	mov r0, #1
	str r0, [sp]
	ldr r0, [r4]
	add r4, sp, #4
	mov r2, #2
	mov r3, #0
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	mov r1, #4
	bl ov18_021F1294
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov18_021F50C0

	thumb_func_start ov18_021F516C
ov18_021F516C: ; 0x021F516C
	push {r3, lr}
	ldrh r1, [r0, #8]
	lsl r2, r1, #2
	ldr r1, _021F517C ; =_021FA588
	ldr r1, [r1, r2]
	blx r1
	pop {r3, pc}
	nop
_021F517C: .word _021FA588
	thumb_func_end ov18_021F516C

	thumb_func_start ov18_021F5180
ov18_021F5180: ; 0x021F5180
	ldrb r3, [r0, #0xa]
	cmp r3, #0
	bne _021F518E
	neg r1, r1
	str r1, [r0, #0xc]
	str r2, [r0, #0x10]
	bx lr
_021F518E:
	str r1, [r0, #0xc]
	neg r1, r2
	str r1, [r0, #0x10]
	bx lr
	.balign 4, 0
	thumb_func_end ov18_021F5180

	thumb_func_start ov18_021F5198
ov18_021F5198: ; 0x021F5198
	push {r3, r4}
	ldrb r4, [r0, #0xa]
	cmp r4, #0
	bne _021F51B0
	neg r1, r1
	str r1, [r0, #0xc]
	neg r1, r2
	str r1, [r0, #0x10]
	neg r1, r3
	str r1, [r0, #0x14]
	pop {r3, r4}
	bx lr
_021F51B0:
	str r1, [r0, #0xc]
	str r2, [r0, #0x10]
	str r3, [r0, #0x14]
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov18_021F5198

	thumb_func_start ov18_021F51BC
ov18_021F51BC: ; 0x021F51BC
	push {r3, lr}
	ldr r0, _021F51C8 ; =0x000008EB
	bl PlaySE
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_021F51C8: .word 0x000008EB
	thumb_func_end ov18_021F51BC

	thumb_func_start ov18_021F51CC
ov18_021F51CC: ; 0x021F51CC
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	beq _021F51DC
	cmp r0, #1
	beq _021F51FA
	b _021F522A
_021F51DC:
	ldr r0, _021F5230 ; =0x000008EB
	bl PlaySE
	mov r2, #0x1f
	mvn r2, r2
	mov r1, #1
	add r3, r2, #0
	add r0, r4, #0
	lsl r1, r1, #8
	sub r3, #0xc0
	bl ov18_021F5198
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
_021F51FA:
	ldr r1, [r4]
	ldr r0, _021F5234 ; =0x0000068C
	ldr r0, [r1, r0]
	ldr r1, [r4, #0xc]
	bl sub_0200E098
	ldr r1, [r4]
	ldr r0, _021F5234 ; =0x0000068C
	ldr r0, [r1, r0]
	bl sub_0200E0AC
	add r1, r0, #0
	ldr r0, [r4]
	bl ov18_021F5000
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x10]
	add r1, r1, r0
	str r1, [r4, #0xc]
	ldr r0, [r4, #0x14]
	cmp r1, r0
	bne _021F522A
	mov r0, #0
	pop {r4, pc}
_021F522A:
	mov r0, #1
	pop {r4, pc}
	nop
_021F5230: .word 0x000008EB
_021F5234: .word 0x0000068C
	thumb_func_end ov18_021F51CC

	thumb_func_start ov18_021F5238
ov18_021F5238: ; 0x021F5238
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	beq _021F5248
	cmp r0, #1
	beq _021F5266
	b _021F5296
_021F5248:
	ldr r0, _021F529C ; =0x000008EB
	bl PlaySE
	mov r2, #0x1f
	mvn r2, r2
	mov r1, #0x12
	add r3, r2, #0
	add r0, r4, #0
	lsl r1, r1, #4
	sub r3, #0xe0
	bl ov18_021F5198
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
_021F5266:
	ldr r1, [r4]
	ldr r0, _021F52A0 ; =0x0000068C
	ldr r0, [r1, r0]
	ldr r1, [r4, #0xc]
	bl sub_0200E098
	ldr r1, [r4]
	ldr r0, _021F52A0 ; =0x0000068C
	ldr r0, [r1, r0]
	bl sub_0200E0AC
	add r1, r0, #0
	ldr r0, [r4]
	bl ov18_021F5000
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x10]
	add r1, r1, r0
	str r1, [r4, #0xc]
	ldr r0, [r4, #0x14]
	cmp r1, r0
	bne _021F5296
	mov r0, #0
	pop {r4, pc}
_021F5296:
	mov r0, #1
	pop {r4, pc}
	nop
_021F529C: .word 0x000008EB
_021F52A0: .word 0x0000068C
	thumb_func_end ov18_021F5238

	thumb_func_start ov18_021F52A4
ov18_021F52A4: ; 0x021F52A4
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	beq _021F52B4
	cmp r0, #1
	beq _021F52D0
	b _021F5300
_021F52B4:
	ldr r0, _021F5304 ; =0x000008EB
	bl PlaySE
	mov r1, #5
	mov r2, #0x1f
	ldr r3, _021F5308 ; =0xFFFFFEE0
	add r0, r4, #0
	lsl r1, r1, #6
	mvn r2, r2
	bl ov18_021F5198
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
_021F52D0:
	ldr r1, [r4]
	ldr r0, _021F530C ; =0x0000068C
	ldr r0, [r1, r0]
	ldr r1, [r4, #0xc]
	bl sub_0200E098
	ldr r1, [r4]
	ldr r0, _021F530C ; =0x0000068C
	ldr r0, [r1, r0]
	bl sub_0200E0AC
	add r1, r0, #0
	ldr r0, [r4]
	bl ov18_021F5000
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x10]
	add r1, r1, r0
	str r1, [r4, #0xc]
	ldr r0, [r4, #0x14]
	cmp r1, r0
	bne _021F5300
	mov r0, #0
	pop {r4, pc}
_021F5300:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_021F5304: .word 0x000008EB
_021F5308: .word 0xFFFFFEE0
_021F530C: .word 0x0000068C
	thumb_func_end ov18_021F52A4

	thumb_func_start ov18_021F5310
ov18_021F5310: ; 0x021F5310
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	beq _021F5320
	cmp r0, #1
	beq _021F533C
	b _021F536C
_021F5320:
	ldr r0, _021F5370 ; =0x000008EB
	bl PlaySE
	mov r1, #0x16
	mov r2, #0x1f
	ldr r3, _021F5374 ; =0xFFFFFEC0
	add r0, r4, #0
	lsl r1, r1, #4
	mvn r2, r2
	bl ov18_021F5198
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
_021F533C:
	ldr r1, [r4]
	ldr r0, _021F5378 ; =0x0000068C
	ldr r0, [r1, r0]
	ldr r1, [r4, #0xc]
	bl sub_0200E098
	ldr r1, [r4]
	ldr r0, _021F5378 ; =0x0000068C
	ldr r0, [r1, r0]
	bl sub_0200E0AC
	add r1, r0, #0
	ldr r0, [r4]
	bl ov18_021F5000
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x10]
	add r1, r1, r0
	str r1, [r4, #0xc]
	ldr r0, [r4, #0x14]
	cmp r1, r0
	bne _021F536C
	mov r0, #0
	pop {r4, pc}
_021F536C:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_021F5370: .word 0x000008EB
_021F5374: .word 0xFFFFFEC0
_021F5378: .word 0x0000068C
	thumb_func_end ov18_021F5310

	thumb_func_start ov18_021F537C
ov18_021F537C: ; 0x021F537C
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	beq _021F538C
	cmp r0, #1
	beq _021F53A8
	b _021F53D8
_021F538C:
	ldr r0, _021F53DC ; =0x000008EB
	bl PlaySE
	mov r1, #6
	mov r2, #0x1f
	ldr r3, _021F53E0 ; =0xFFFFFEA0
	add r0, r4, #0
	lsl r1, r1, #6
	mvn r2, r2
	bl ov18_021F5198
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
_021F53A8:
	ldr r1, [r4]
	ldr r0, _021F53E4 ; =0x0000068C
	ldr r0, [r1, r0]
	ldr r1, [r4, #0xc]
	bl sub_0200E098
	ldr r1, [r4]
	ldr r0, _021F53E4 ; =0x0000068C
	ldr r0, [r1, r0]
	bl sub_0200E0AC
	add r1, r0, #0
	ldr r0, [r4]
	bl ov18_021F5000
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x10]
	add r1, r1, r0
	str r1, [r4, #0xc]
	ldr r0, [r4, #0x14]
	cmp r1, r0
	bne _021F53D8
	mov r0, #0
	pop {r4, pc}
_021F53D8:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_021F53DC: .word 0x000008EB
_021F53E0: .word 0xFFFFFEA0
_021F53E4: .word 0x0000068C
	thumb_func_end ov18_021F537C

	thumb_func_start ov18_021F53E8
ov18_021F53E8: ; 0x021F53E8
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	beq _021F53F8
	cmp r0, #1
	beq _021F5414
	b _021F5444
_021F53F8:
	ldr r0, _021F5448 ; =0x000008EB
	bl PlaySE
	mov r1, #7
	mov r2, #0x3f
	ldr r3, _021F544C ; =0xFFFFFEC0
	add r0, r4, #0
	lsl r1, r1, #6
	mvn r2, r2
	bl ov18_021F5198
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
_021F5414:
	ldr r1, [r4]
	ldr r0, _021F5450 ; =0x0000068C
	ldr r0, [r1, r0]
	ldr r1, [r4, #0xc]
	bl sub_0200E098
	ldr r1, [r4]
	ldr r0, _021F5450 ; =0x0000068C
	ldr r0, [r1, r0]
	bl sub_0200E0AC
	add r1, r0, #0
	ldr r0, [r4]
	bl ov18_021F5000
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x10]
	add r1, r1, r0
	str r1, [r4, #0xc]
	ldr r0, [r4, #0x14]
	cmp r1, r0
	bne _021F5444
	mov r0, #0
	pop {r4, pc}
_021F5444:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_021F5448: .word 0x000008EB
_021F544C: .word 0xFFFFFEC0
_021F5450: .word 0x0000068C
	thumb_func_end ov18_021F53E8

	thumb_func_start ov18_021F5454
ov18_021F5454: ; 0x021F5454
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #0xb]
	cmp r0, #0
	beq _021F5464
	cmp r0, #1
	beq _021F5480
	b _021F54B0
_021F5464:
	ldr r0, _021F54B4 ; =0x000008EB
	bl PlaySE
	mov r1, #2
	mov r2, #0x3f
	ldr r3, _021F54B8 ; =0xFFFFFE80
	add r0, r4, #0
	lsl r1, r1, #8
	mvn r2, r2
	bl ov18_021F5198
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
_021F5480:
	ldr r1, [r4]
	ldr r0, _021F54BC ; =0x0000068C
	ldr r0, [r1, r0]
	ldr r1, [r4, #0xc]
	bl sub_0200E098
	ldr r1, [r4]
	ldr r0, _021F54BC ; =0x0000068C
	ldr r0, [r1, r0]
	bl sub_0200E0AC
	add r1, r0, #0
	ldr r0, [r4]
	bl ov18_021F5000
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x10]
	add r1, r1, r0
	str r1, [r4, #0xc]
	ldr r0, [r4, #0x14]
	cmp r1, r0
	bne _021F54B0
	mov r0, #0
	pop {r4, pc}
_021F54B0:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_021F54B4: .word 0x000008EB
_021F54B8: .word 0xFFFFFE80
_021F54BC: .word 0x0000068C
	thumb_func_end ov18_021F5454

	thumb_func_start ov18_021F54C0
ov18_021F54C0: ; 0x021F54C0
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	strh r1, [r4, #0x18]
	strh r2, [r4, #0x1a]
	mov r0, #1
	str r0, [sp]
	add r2, sp, #8
	ldr r0, [r4]
	mov r1, #2
	add r2, #2
	add r3, sp, #8
	bl ov18_021F12C8
	mov r0, #1
	str r0, [sp]
	add r2, sp, #4
	ldr r0, [r4]
	mov r1, #4
	add r2, #2
	add r3, sp, #4
	bl ov18_021F12C8
	add r1, sp, #4
	mov r2, #4
	mov r0, #0
	ldrsh r3, [r1, r2]
	ldrsh r0, [r1, r0]
	cmp r3, r0
	bge _021F552E
	mov r0, #2
	strh r0, [r4, #0x1c]
	mov r0, #8
	strh r0, [r4, #0x1e]
	ldr r0, [r4]
	mov r1, #3
	mov r2, #1
	bl ov18_021F11C0
	mov r0, #2
	str r0, [sp]
	ldr r0, [r4]
	add r4, sp, #4
	mov r3, #4
	ldrsh r3, [r4, r3]
	mov r2, #6
	ldrsh r2, [r4, r2]
	add r3, #0xc0
	lsl r3, r3, #0x10
	mov r1, #3
	asr r3, r3, #0x10
	bl ov18_021F1294
	add sp, #0xc
	pop {r3, r4, pc}
_021F552E:
	strh r2, [r4, #0x1c]
	mov r0, #9
	strh r0, [r4, #0x1e]
	ldr r0, [r4]
	mov r1, #5
	mov r2, #1
	bl ov18_021F11C0
	mov r2, #2
	str r2, [sp]
	ldr r0, [r4]
	add r4, sp, #4
	mov r3, #0
	ldrsh r3, [r4, r3]
	ldrsh r2, [r4, r2]
	mov r1, #5
	add r3, #0xc0
	lsl r3, r3, #0x10
	asr r3, r3, #0x10
	bl ov18_021F1294
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov18_021F54C0

	thumb_func_start ov18_021F555C
ov18_021F555C: ; 0x021F555C
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	add r2, sp, #4
	ldrh r1, [r4, #0x1c]
	ldr r0, [r4]
	add r2, #2
	add r3, sp, #4
	bl ov18_021F12C8
	mov r0, #0x18
	add r5, sp, #4
	mov r3, #0
	ldrsh r1, [r5, r3]
	ldrsh r0, [r4, r0]
	mov r2, #2
	add r0, r1, r0
	strh r0, [r5]
	mov r0, #1
	str r0, [sp]
	ldrh r1, [r4, #0x1c]
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	ldr r0, [r4]
	bl ov18_021F1294
	mov r0, #2
	str r0, [sp]
	ldrh r1, [r4, #0x1c]
	add r2, sp, #4
	ldr r0, [r4]
	add r1, r1, #1
	add r2, #2
	add r3, sp, #4
	bl ov18_021F12C8
	mov r3, #0
	mov r0, #0x18
	ldrsh r1, [r5, r3]
	ldrsh r0, [r4, r0]
	mov r2, #2
	add r0, r1, r0
	strh r0, [r5]
	str r2, [sp]
	ldrh r1, [r4, #0x1c]
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	ldr r0, [r4]
	add r1, r1, #1
	bl ov18_021F1294
	mov r0, #0x18
	ldrsh r1, [r4, r0]
	mov r0, #0x1a
	ldrsh r0, [r4, r0]
	add r0, r1, r0
	strh r0, [r4, #0x18]
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov18_021F555C

	thumb_func_start ov18_021F55D8
ov18_021F55D8: ; 0x021F55D8
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl ov18_021F555C
	mov r0, #1
	str r0, [sp]
	add r2, sp, #8
	ldrh r1, [r4, #0x1c]
	ldr r0, [r4]
	add r2, #2
	add r3, sp, #8
	bl ov18_021F12C8
	mov r0, #1
	str r0, [sp]
	add r2, sp, #4
	ldrh r1, [r4, #0x1e]
	ldr r0, [r4]
	add r2, #2
	add r3, sp, #4
	bl ov18_021F12C8
	add r2, sp, #4
	mov r0, #0
	ldrsh r3, [r2, r0]
	mov r0, #4
	ldrsh r0, [r2, r0]
	sub r3, #0x10
	cmp r0, r3
	blt _021F5630
	mov r0, #1
	str r0, [sp]
	ldr r0, [r4]
	ldrh r1, [r4, #0x1c]
	mov r4, #2
	lsl r3, r3, #0x10
	ldrsh r2, [r2, r4]
	asr r3, r3, #0x10
	bl ov18_021F1294
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, pc}
_021F5630:
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov18_021F55D8

	thumb_func_start ov18_021F5638
ov18_021F5638: ; 0x021F5638
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldrb r0, [r5, #0xb]
	cmp r0, #0
	beq _021F5648
	cmp r0, #1
	beq _021F5660
	b _021F56CE
_021F5648:
	ldr r0, _021F56D4 ; =0x000008EB
	bl PlaySE
	mov r1, #3
	add r0, r5, #0
	lsl r1, r1, #8
	mov r2, #0
	bl ov18_021F5180
	ldrb r0, [r5, #0xb]
	add r0, r0, #1
	strb r0, [r5, #0xb]
_021F5660:
	ldr r1, [r5]
	ldr r0, _021F56D8 ; =0x0000068C
	ldr r0, [r1, r0]
	ldr r1, [r5, #0xc]
	bl sub_0200E098
	ldr r1, [r5]
	ldr r0, _021F56D8 ; =0x0000068C
	ldr r0, [r1, r0]
	bl sub_0200E0AC
	add r4, r0, #0
	ldr r0, [r5]
	add r1, r4, #0
	bl ov18_021F5000
	ldr r1, [r5, #0xc]
	ldr r0, [r5, #0x10]
	add r0, r1, r0
	str r0, [r5, #0xc]
	ldrb r0, [r5, #0xa]
	cmp r0, #0
	bne _021F56AE
	mov r1, #0xf6
	lsl r1, r1, #8
	cmp r4, r1
	bhi _021F56CE
	ldr r2, [r5]
	ldr r0, _021F56D8 ; =0x0000068C
	ldr r0, [r2, r0]
	bl sub_0200E074
	mov r1, #0xf6
	ldr r0, [r5]
	lsl r1, r1, #8
	bl ov18_021F5000
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F56AE:
	mov r1, #0xa
	lsl r1, r1, #8
	cmp r4, r1
	blo _021F56CE
	ldr r2, [r5]
	ldr r0, _021F56D8 ; =0x0000068C
	ldr r0, [r2, r0]
	bl sub_0200E074
	mov r1, #0xa
	ldr r0, [r5]
	lsl r1, r1, #8
	bl ov18_021F5000
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F56CE:
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_021F56D4: .word 0x000008EB
_021F56D8: .word 0x0000068C
	thumb_func_end ov18_021F5638

	thumb_func_start ov18_021F56DC
ov18_021F56DC: ; 0x021F56DC
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldrb r0, [r4, #0xb]
	cmp r0, #3
	bhi _021F57A6
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F56F2: ; jump table
	.short _021F56FA - _021F56F2 - 2 ; case 0
	.short _021F5712 - _021F56F2 - 2 ; case 1
	.short _021F5786 - _021F56F2 - 2 ; case 2
	.short _021F5798 - _021F56F2 - 2 ; case 3
_021F56FA:
	ldr r0, _021F57AC ; =0x000008EC
	bl PlaySE
	mov r1, #3
	add r0, r4, #0
	lsl r1, r1, #8
	mov r2, #0
	bl ov18_021F5180
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
_021F5712:
	ldr r1, [r4]
	ldr r0, _021F57B0 ; =0x0000068C
	ldr r0, [r1, r0]
	ldr r1, [r4, #0xc]
	bl sub_0200E098
	ldr r1, [r4]
	ldr r0, _021F57B0 ; =0x0000068C
	ldr r0, [r1, r0]
	bl sub_0200E0AC
	add r5, r0, #0
	ldr r0, [r4]
	add r1, r5, #0
	bl ov18_021F5000
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x10]
	add r0, r1, r0
	str r0, [r4, #0xc]
	ldrb r0, [r4, #0xa]
	cmp r0, #0
	bne _021F5764
	mov r1, #0xf6
	lsl r1, r1, #8
	cmp r5, r1
	bhi _021F57A6
	ldr r2, [r4]
	ldr r0, _021F57B0 ; =0x0000068C
	ldr r0, [r2, r0]
	bl sub_0200E074
	mov r1, #0xf6
	ldr r0, [r4]
	lsl r1, r1, #8
	bl ov18_021F5000
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
	b _021F5786
_021F5764:
	mov r1, #0xa
	lsl r1, r1, #8
	cmp r5, r1
	blo _021F57A6
	ldr r2, [r4]
	ldr r0, _021F57B0 ; =0x0000068C
	ldr r0, [r2, r0]
	bl sub_0200E074
	mov r1, #0xa
	ldr r0, [r4]
	lsl r1, r1, #8
	bl ov18_021F5000
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
_021F5786:
	mov r1, #3
	add r0, r4, #0
	mvn r1, r1
	mov r2, #1
	bl ov18_021F54C0
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
_021F5798:
	add r0, r4, #0
	bl ov18_021F55D8
	cmp r0, #0
	bne _021F57A6
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F57A6:
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_021F57AC: .word 0x000008EC
_021F57B0: .word 0x0000068C
	thumb_func_end ov18_021F56DC

	thumb_func_start ov18_021F57B4
ov18_021F57B4: ; 0x021F57B4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldrb r0, [r4, #0xb]
	cmp r0, #3
	bhi _021F587E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F57CA: ; jump table
	.short _021F57D2 - _021F57CA - 2 ; case 0
	.short _021F57EA - _021F57CA - 2 ; case 1
	.short _021F585E - _021F57CA - 2 ; case 2
	.short _021F5870 - _021F57CA - 2 ; case 3
_021F57D2:
	ldr r0, _021F5884 ; =0x000008EC
	bl PlaySE
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xa
	mov r2, #0
	bl ov18_021F5180
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
_021F57EA:
	ldr r1, [r4]
	ldr r0, _021F5888 ; =0x0000068C
	ldr r0, [r1, r0]
	ldr r1, [r4, #0xc]
	bl sub_0200E098
	ldr r1, [r4]
	ldr r0, _021F5888 ; =0x0000068C
	ldr r0, [r1, r0]
	bl sub_0200E0AC
	add r5, r0, #0
	ldr r0, [r4]
	add r1, r5, #0
	bl ov18_021F5000
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x10]
	add r0, r1, r0
	str r0, [r4, #0xc]
	ldrb r0, [r4, #0xa]
	cmp r0, #0
	bne _021F583C
	mov r1, #0xf6
	lsl r1, r1, #8
	cmp r5, r1
	bhi _021F587E
	ldr r2, [r4]
	ldr r0, _021F5888 ; =0x0000068C
	ldr r0, [r2, r0]
	bl sub_0200E074
	mov r1, #0xf6
	ldr r0, [r4]
	lsl r1, r1, #8
	bl ov18_021F5000
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
	b _021F585E
_021F583C:
	mov r1, #0xa
	lsl r1, r1, #8
	cmp r5, r1
	blo _021F587E
	ldr r2, [r4]
	ldr r0, _021F5888 ; =0x0000068C
	ldr r0, [r2, r0]
	bl sub_0200E074
	mov r1, #0xa
	ldr r0, [r4]
	lsl r1, r1, #8
	bl ov18_021F5000
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
_021F585E:
	mov r1, #7
	add r0, r4, #0
	mvn r1, r1
	mov r2, #1
	bl ov18_021F54C0
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
_021F5870:
	add r0, r4, #0
	bl ov18_021F55D8
	cmp r0, #0
	bne _021F587E
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F587E:
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_021F5884: .word 0x000008EC
_021F5888: .word 0x0000068C
	thumb_func_end ov18_021F57B4

	thumb_func_start ov18_021F588C
ov18_021F588C: ; 0x021F588C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldrb r0, [r4, #0xb]
	cmp r0, #3
	bhi _021F5956
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F58A2: ; jump table
	.short _021F58AA - _021F58A2 - 2 ; case 0
	.short _021F58C2 - _021F58A2 - 2 ; case 1
	.short _021F5936 - _021F58A2 - 2 ; case 2
	.short _021F5948 - _021F58A2 - 2 ; case 3
_021F58AA:
	ldr r0, _021F595C ; =0x000008EC
	bl PlaySE
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xa
	mov r2, #0
	bl ov18_021F5180
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
_021F58C2:
	ldr r1, [r4]
	ldr r0, _021F5960 ; =0x0000068C
	ldr r0, [r1, r0]
	ldr r1, [r4, #0xc]
	bl sub_0200E098
	ldr r1, [r4]
	ldr r0, _021F5960 ; =0x0000068C
	ldr r0, [r1, r0]
	bl sub_0200E0AC
	add r5, r0, #0
	ldr r0, [r4]
	add r1, r5, #0
	bl ov18_021F5000
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x10]
	add r0, r1, r0
	str r0, [r4, #0xc]
	ldrb r0, [r4, #0xa]
	cmp r0, #0
	bne _021F5914
	mov r1, #0xf6
	lsl r1, r1, #8
	cmp r5, r1
	bhi _021F5956
	ldr r2, [r4]
	ldr r0, _021F5960 ; =0x0000068C
	ldr r0, [r2, r0]
	bl sub_0200E074
	mov r1, #0xf6
	ldr r0, [r4]
	lsl r1, r1, #8
	bl ov18_021F5000
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
	b _021F5936
_021F5914:
	mov r1, #0xa
	lsl r1, r1, #8
	cmp r5, r1
	blo _021F5956
	ldr r2, [r4]
	ldr r0, _021F5960 ; =0x0000068C
	ldr r0, [r2, r0]
	bl sub_0200E074
	mov r1, #0xa
	ldr r0, [r4]
	lsl r1, r1, #8
	bl ov18_021F5000
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
_021F5936:
	mov r1, #0xb
	add r0, r4, #0
	mvn r1, r1
	mov r2, #1
	bl ov18_021F54C0
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
_021F5948:
	add r0, r4, #0
	bl ov18_021F55D8
	cmp r0, #0
	bne _021F5956
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F5956:
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_021F595C: .word 0x000008EC
_021F5960: .word 0x0000068C
	thumb_func_end ov18_021F588C

	thumb_func_start ov18_021F5964
ov18_021F5964: ; 0x021F5964
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldrb r0, [r4, #0xb]
	cmp r0, #3
	bhi _021F5A2E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F597A: ; jump table
	.short _021F5982 - _021F597A - 2 ; case 0
	.short _021F599A - _021F597A - 2 ; case 1
	.short _021F5A0E - _021F597A - 2 ; case 2
	.short _021F5A20 - _021F597A - 2 ; case 3
_021F5982:
	ldr r0, _021F5A34 ; =0x000008ED
	bl PlaySE
	mov r1, #5
	add r0, r4, #0
	lsl r1, r1, #8
	mov r2, #0
	bl ov18_021F5180
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
_021F599A:
	ldr r1, [r4]
	ldr r0, _021F5A38 ; =0x0000068C
	ldr r0, [r1, r0]
	ldr r1, [r4, #0xc]
	bl sub_0200E098
	ldr r1, [r4]
	ldr r0, _021F5A38 ; =0x0000068C
	ldr r0, [r1, r0]
	bl sub_0200E0AC
	add r5, r0, #0
	ldr r0, [r4]
	add r1, r5, #0
	bl ov18_021F5000
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x10]
	add r0, r1, r0
	str r0, [r4, #0xc]
	ldrb r0, [r4, #0xa]
	cmp r0, #0
	bne _021F59EC
	mov r1, #0xf6
	lsl r1, r1, #8
	cmp r5, r1
	bhi _021F5A2E
	ldr r2, [r4]
	ldr r0, _021F5A38 ; =0x0000068C
	ldr r0, [r2, r0]
	bl sub_0200E074
	mov r1, #0xf6
	ldr r0, [r4]
	lsl r1, r1, #8
	bl ov18_021F5000
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
	b _021F5A0E
_021F59EC:
	mov r1, #0xa
	lsl r1, r1, #8
	cmp r5, r1
	blo _021F5A2E
	ldr r2, [r4]
	ldr r0, _021F5A38 ; =0x0000068C
	ldr r0, [r2, r0]
	bl sub_0200E074
	mov r1, #0xa
	ldr r0, [r4]
	lsl r1, r1, #8
	bl ov18_021F5000
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
_021F5A0E:
	mov r1, #0xd
	add r0, r4, #0
	mvn r1, r1
	mov r2, #1
	bl ov18_021F54C0
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
_021F5A20:
	add r0, r4, #0
	bl ov18_021F55D8
	cmp r0, #0
	bne _021F5A2E
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F5A2E:
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_021F5A34: .word 0x000008ED
_021F5A38: .word 0x0000068C
	thumb_func_end ov18_021F5964

	thumb_func_start ov18_021F5A3C
ov18_021F5A3C: ; 0x021F5A3C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldrb r0, [r4, #0xb]
	cmp r0, #3
	bhi _021F5B06
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F5A52: ; jump table
	.short _021F5A5A - _021F5A52 - 2 ; case 0
	.short _021F5A72 - _021F5A52 - 2 ; case 1
	.short _021F5AE6 - _021F5A52 - 2 ; case 2
	.short _021F5AF8 - _021F5A52 - 2 ; case 3
_021F5A5A:
	ldr r0, _021F5B0C ; =0x000008ED
	bl PlaySE
	mov r1, #5
	add r0, r4, #0
	lsl r1, r1, #8
	mov r2, #0
	bl ov18_021F5180
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
_021F5A72:
	ldr r1, [r4]
	ldr r0, _021F5B10 ; =0x0000068C
	ldr r0, [r1, r0]
	ldr r1, [r4, #0xc]
	bl sub_0200E098
	ldr r1, [r4]
	ldr r0, _021F5B10 ; =0x0000068C
	ldr r0, [r1, r0]
	bl sub_0200E0AC
	add r5, r0, #0
	ldr r0, [r4]
	add r1, r5, #0
	bl ov18_021F5000
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x10]
	add r0, r1, r0
	str r0, [r4, #0xc]
	ldrb r0, [r4, #0xa]
	cmp r0, #0
	bne _021F5AC4
	mov r1, #0xf6
	lsl r1, r1, #8
	cmp r5, r1
	bhi _021F5B06
	ldr r2, [r4]
	ldr r0, _021F5B10 ; =0x0000068C
	ldr r0, [r2, r0]
	bl sub_0200E074
	mov r1, #0xf6
	ldr r0, [r4]
	lsl r1, r1, #8
	bl ov18_021F5000
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
	b _021F5AE6
_021F5AC4:
	mov r1, #0xa
	lsl r1, r1, #8
	cmp r5, r1
	blo _021F5B06
	ldr r2, [r4]
	ldr r0, _021F5B10 ; =0x0000068C
	ldr r0, [r2, r0]
	bl sub_0200E074
	mov r1, #0xa
	ldr r0, [r4]
	lsl r1, r1, #8
	bl ov18_021F5000
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
_021F5AE6:
	mov r1, #0x11
	add r0, r4, #0
	mvn r1, r1
	mov r2, #1
	bl ov18_021F54C0
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
_021F5AF8:
	add r0, r4, #0
	bl ov18_021F55D8
	cmp r0, #0
	bne _021F5B06
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F5B06:
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_021F5B0C: .word 0x000008ED
_021F5B10: .word 0x0000068C
	thumb_func_end ov18_021F5A3C

	thumb_func_start ov18_021F5B14
ov18_021F5B14: ; 0x021F5B14
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldrb r0, [r4, #0xb]
	cmp r0, #3
	bhi _021F5BDE
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F5B2A: ; jump table
	.short _021F5B32 - _021F5B2A - 2 ; case 0
	.short _021F5B4A - _021F5B2A - 2 ; case 1
	.short _021F5BBE - _021F5B2A - 2 ; case 2
	.short _021F5BD0 - _021F5B2A - 2 ; case 3
_021F5B32:
	ldr r0, _021F5BE4 ; =0x000008ED
	bl PlaySE
	mov r1, #6
	add r0, r4, #0
	lsl r1, r1, #8
	mov r2, #0
	bl ov18_021F5180
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
_021F5B4A:
	ldr r1, [r4]
	ldr r0, _021F5BE8 ; =0x0000068C
	ldr r0, [r1, r0]
	ldr r1, [r4, #0xc]
	bl sub_0200E098
	ldr r1, [r4]
	ldr r0, _021F5BE8 ; =0x0000068C
	ldr r0, [r1, r0]
	bl sub_0200E0AC
	add r5, r0, #0
	ldr r0, [r4]
	add r1, r5, #0
	bl ov18_021F5000
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x10]
	add r0, r1, r0
	str r0, [r4, #0xc]
	ldrb r0, [r4, #0xa]
	cmp r0, #0
	bne _021F5B9C
	mov r1, #0xf6
	lsl r1, r1, #8
	cmp r5, r1
	bhi _021F5BDE
	ldr r2, [r4]
	ldr r0, _021F5BE8 ; =0x0000068C
	ldr r0, [r2, r0]
	bl sub_0200E074
	mov r1, #0xf6
	ldr r0, [r4]
	lsl r1, r1, #8
	bl ov18_021F5000
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
	b _021F5BBE
_021F5B9C:
	mov r1, #0xa
	lsl r1, r1, #8
	cmp r5, r1
	blo _021F5BDE
	ldr r2, [r4]
	ldr r0, _021F5BE8 ; =0x0000068C
	ldr r0, [r2, r0]
	bl sub_0200E074
	mov r1, #0xa
	ldr r0, [r4]
	lsl r1, r1, #8
	bl ov18_021F5000
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
_021F5BBE:
	mov r1, #0x14
	add r0, r4, #0
	mvn r1, r1
	mov r2, #1
	bl ov18_021F54C0
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
_021F5BD0:
	add r0, r4, #0
	bl ov18_021F55D8
	cmp r0, #0
	bne _021F5BDE
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F5BDE:
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_021F5BE4: .word 0x000008ED
_021F5BE8: .word 0x0000068C
	thumb_func_end ov18_021F5B14

	thumb_func_start ov18_021F5BEC
ov18_021F5BEC: ; 0x021F5BEC
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldrb r0, [r4, #0xb]
	cmp r0, #3
	bhi _021F5CB6
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F5C02: ; jump table
	.short _021F5C0A - _021F5C02 - 2 ; case 0
	.short _021F5C22 - _021F5C02 - 2 ; case 1
	.short _021F5C96 - _021F5C02 - 2 ; case 2
	.short _021F5CA8 - _021F5C02 - 2 ; case 3
_021F5C0A:
	ldr r0, _021F5CBC ; =0x000008ED
	bl PlaySE
	mov r1, #7
	add r0, r4, #0
	lsl r1, r1, #8
	mov r2, #0
	bl ov18_021F5180
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
_021F5C22:
	ldr r1, [r4]
	ldr r0, _021F5CC0 ; =0x0000068C
	ldr r0, [r1, r0]
	ldr r1, [r4, #0xc]
	bl sub_0200E098
	ldr r1, [r4]
	ldr r0, _021F5CC0 ; =0x0000068C
	ldr r0, [r1, r0]
	bl sub_0200E0AC
	add r5, r0, #0
	ldr r0, [r4]
	add r1, r5, #0
	bl ov18_021F5000
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x10]
	add r0, r1, r0
	str r0, [r4, #0xc]
	ldrb r0, [r4, #0xa]
	cmp r0, #0
	bne _021F5C74
	mov r1, #0xf6
	lsl r1, r1, #8
	cmp r5, r1
	bhi _021F5CB6
	ldr r2, [r4]
	ldr r0, _021F5CC0 ; =0x0000068C
	ldr r0, [r2, r0]
	bl sub_0200E074
	mov r1, #0xf6
	ldr r0, [r4]
	lsl r1, r1, #8
	bl ov18_021F5000
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
	b _021F5C96
_021F5C74:
	mov r1, #0xa
	lsl r1, r1, #8
	cmp r5, r1
	blo _021F5CB6
	ldr r2, [r4]
	ldr r0, _021F5CC0 ; =0x0000068C
	ldr r0, [r2, r0]
	bl sub_0200E074
	mov r1, #0xa
	ldr r0, [r4]
	lsl r1, r1, #8
	bl ov18_021F5000
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
_021F5C96:
	mov r1, #0x17
	add r0, r4, #0
	mvn r1, r1
	mov r2, #1
	bl ov18_021F54C0
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
_021F5CA8:
	add r0, r4, #0
	bl ov18_021F55D8
	cmp r0, #0
	bne _021F5CB6
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F5CB6:
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_021F5CBC: .word 0x000008ED
_021F5CC0: .word 0x0000068C
	thumb_func_end ov18_021F5BEC

	thumb_func_start ov18_021F5CC4
ov18_021F5CC4: ; 0x021F5CC4
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r0, #0
	ldrb r0, [r4, #0xb]
	cmp r0, #3
	bhi _021F5DB2
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F5CDC: ; jump table
	.short _021F5CE4 - _021F5CDC - 2 ; case 0
	.short _021F5CFC - _021F5CDC - 2 ; case 1
	.short _021F5D70 - _021F5CDC - 2 ; case 2
	.short _021F5D82 - _021F5CDC - 2 ; case 3
_021F5CE4:
	ldr r0, _021F5DB8 ; =0x000008EE
	bl PlaySE
	mov r1, #2
	add r0, r4, #0
	lsl r1, r1, #0xa
	mov r2, #0
	bl ov18_021F5180
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
_021F5CFC:
	ldr r1, [r4]
	ldr r0, _021F5DBC ; =0x0000068C
	ldr r0, [r1, r0]
	ldr r1, [r4, #0xc]
	bl sub_0200E098
	ldr r1, [r4]
	ldr r0, _021F5DBC ; =0x0000068C
	ldr r0, [r1, r0]
	bl sub_0200E0AC
	add r5, r0, #0
	ldr r0, [r4]
	add r1, r5, #0
	bl ov18_021F5000
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x10]
	add r0, r1, r0
	str r0, [r4, #0xc]
	ldrb r0, [r4, #0xa]
	cmp r0, #0
	bne _021F5D4E
	mov r1, #0xf6
	lsl r1, r1, #8
	cmp r5, r1
	bhi _021F5DB2
	ldr r2, [r4]
	ldr r0, _021F5DBC ; =0x0000068C
	ldr r0, [r2, r0]
	bl sub_0200E074
	mov r1, #0xf6
	ldr r0, [r4]
	lsl r1, r1, #8
	bl ov18_021F5000
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
	b _021F5D70
_021F5D4E:
	mov r1, #0xa
	lsl r1, r1, #8
	cmp r5, r1
	blo _021F5DB2
	ldr r2, [r4]
	ldr r0, _021F5DBC ; =0x0000068C
	ldr r0, [r2, r0]
	bl sub_0200E074
	mov r1, #0xa
	ldr r0, [r4]
	lsl r1, r1, #8
	bl ov18_021F5000
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
_021F5D70:
	mov r1, #0x17
	add r0, r4, #0
	mvn r1, r1
	mov r2, #0
	bl ov18_021F54C0
	ldrb r0, [r4, #0xb]
	add r0, r0, #1
	strb r0, [r4, #0xb]
_021F5D82:
	add r0, r4, #0
	bl ov18_021F55D8
	cmp r0, #0
	bne _021F5D92
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F5D92:
	mov r0, #1
	str r0, [sp]
	ldrh r1, [r4, #0x1c]
	add r2, sp, #4
	ldr r0, [r4]
	add r2, #2
	add r3, sp, #4
	bl ov18_021F12C8
	add r1, sp, #4
	mov r0, #0
	ldrsh r2, [r1, r0]
	mov r1, #0xff
	mvn r1, r1
	cmp r2, r1
	ble _021F5DB4
_021F5DB2:
	mov r0, #1
_021F5DB4:
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021F5DB8: .word 0x000008EE
_021F5DBC: .word 0x0000068C
	thumb_func_end ov18_021F5CC4

	thumb_func_start ov18_021F5DC0
ov18_021F5DC0: ; 0x021F5DC0
	push {r4, lr}
	add r4, r0, #0
	mov r1, #6
	bl ov18_021F1324
	add r0, r4, #0
	bl ov18_021F17FC
	add r0, r4, #0
	bl ov18_021F193C
	add r0, r4, #0
	bl ov18_021F5E0C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov18_021F5DC0

	thumb_func_start ov18_021F5DE0
ov18_021F5DE0: ; 0x021F5DE0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #1
_021F5DE6:
	add r0, r5, #0
	add r1, r4, #0
	bl ov18_021F10E8
	add r4, r4, #1
	cmp r4, #0x14
	blo _021F5DE6
	add r0, r5, #0
	mov r1, #6
	bl ov18_021F13DC
	add r0, r5, #0
	bl ov18_021F18E0
	add r0, r5, #0
	bl ov18_021F19EC
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov18_021F5DE0

	thumb_func_start ov18_021F5E0C
ov18_021F5E0C: ; 0x021F5E0C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r7, #1
	mov r6, #0x34
	add r4, r5, #4
_021F5E16:
	ldr r0, _021F5ED8 ; =0x00000668
	ldr r1, _021F5EDC ; =0x0000066C
	add r3, r6, #0
	ldr r2, _021F5EE0 ; =_021FAC28
	sub r3, #0x34
	add r2, r2, r3
	mov r3, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	lsl r3, r3, #0x14
	bl sub_0200D740
	mov r1, #0x67
	lsl r1, r1, #4
	str r0, [r4, r1]
	add r7, r7, #1
	add r6, #0x34
	add r4, r4, #4
	cmp r7, #4
	bls _021F5E16
	mov r7, #5
	add r6, r7, #0
	add r4, r5, #0
	add r6, #0xff
	add r4, #0x14
_021F5E48:
	ldr r0, _021F5ED8 ; =0x00000668
	ldr r1, _021F5EDC ; =0x0000066C
	add r3, r6, #0
	ldr r2, _021F5EE0 ; =_021FAC28
	sub r3, #0x34
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r2, r3
	bl sub_0200D734
	mov r1, #0x67
	lsl r1, r1, #4
	str r0, [r4, r1]
	add r7, r7, #1
	add r6, #0x34
	add r4, r4, #4
	cmp r7, #0x14
	blo _021F5E48
	add r0, r5, #0
	mov r1, #9
	mov r2, #0
	bl ov18_021F11C0
	add r0, r5, #0
	mov r1, #0xa
	mov r2, #0
	bl ov18_021F11C0
	add r0, r5, #0
	mov r1, #0xb
	mov r2, #0
	bl ov18_021F11C0
	add r0, r5, #0
	mov r1, #0xc
	mov r2, #0
	bl ov18_021F11C0
	add r0, r5, #0
	mov r1, #0xd
	mov r2, #0
	bl ov18_021F11C0
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	bl ov18_021F5EFC
	add r0, r5, #0
	bl ov18_021F6038
	mov r0, #9
	str r0, [sp]
	ldr r2, _021F5EE4 ; =0x000018C4
	ldr r3, _021F5EE8 ; =_021FA348
	ldrsb r2, [r5, r2]
	add r0, r5, #0
	mov r1, #5
	bl ov18_021F61DC
	add r0, r5, #0
	bl ov18_021F65AC
	ldr r2, _021F5EEC ; =0x000018C5
	add r0, r5, #0
	ldrsb r1, [r5, r2]
	sub r2, r2, #1
	ldrsb r2, [r5, r2]
	mov r3, #6
	bl ov18_021F619C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F5ED8: .word 0x00000668
_021F5EDC: .word 0x0000066C
_021F5EE0: .word _021FAC28
_021F5EE4: .word 0x000018C4
_021F5EE8: .word _021FA348
_021F5EEC: .word 0x000018C5
	thumb_func_end ov18_021F5E0C

	thumb_func_start ov18_021F5EF0
ov18_021F5EF0: ; 0x021F5EF0
	ldr r3, _021F5EF8 ; =ov18_021F5EFC
	mov r2, #0
	bx r3
	nop
_021F5EF8: .word ov18_021F5EFC
	thumb_func_end ov18_021F5EF0

	thumb_func_start ov18_021F5EFC
ov18_021F5EFC: ; 0x021F5EFC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r3, sp, #0xc
	add r7, r2, #0
	add r2, sp, #0xc
	add r3, #1
	add r5, r0, #0
	bl ov18_021F3CA8
	ldr r0, _021F5FF4 ; =0x000018C7
	ldrb r0, [r5, r0]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1f
	bne _021F5F32
	add r0, r5, #0
	mov r1, #3
	mov r2, #0
	mov r6, #1
	mov r4, #2
	bl ov18_021F11C0
	add r0, r5, #0
	mov r1, #4
	mov r2, #0
	bl ov18_021F11C0
	b _021F5F4A
_021F5F32:
	add r0, r5, #0
	mov r1, #1
	mov r2, #0
	mov r6, #3
	mov r4, #4
	bl ov18_021F11C0
	add r0, r5, #0
	mov r1, #2
	mov r2, #0
	bl ov18_021F11C0
_021F5F4A:
	ldr r1, _021F5FF4 ; =0x000018C7
	mov r2, #0x20
	ldrb r3, [r5, r1]
	add r0, r3, #0
	bic r0, r2
	lsl r2, r3, #0x1a
	lsr r3, r2, #0x1f
	mov r2, #1
	eor r2, r3
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	lsl r2, r2, #0x1f
	lsr r2, r2, #0x1a
	orr r0, r2
	strb r0, [r5, r1]
	mov r0, #2
	str r0, [sp]
	str r6, [sp, #4]
	str r7, [sp, #8]
	sub r1, #0x25
	add r3, sp, #0xc
	ldrb r2, [r3]
	ldrh r1, [r5, r1]
	ldrb r3, [r3, #1]
	add r0, r5, #0
	bl ov18_021F1A7C
	lsl r0, r6, #2
	add r1, r5, r0
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #0x40
	mov r2, #0x78
	lsl r3, r1, #0xf
	bl sub_0200DDF4
	mov r0, #0
	str r0, [sp]
	str r4, [sp, #4]
	ldr r1, _021F5FF8 ; =0x000018A2
	str r7, [sp, #8]
	add r3, sp, #0xc
	ldrb r2, [r3]
	ldrh r1, [r5, r1]
	ldrb r3, [r3, #1]
	add r0, r5, #0
	bl ov18_021F1A7C
	mov r2, #0
	ldr r0, _021F5FF8 ; =0x000018A2
	str r2, [sp]
	add r3, sp, #0xc
	ldrb r1, [r3, #1]
	ldrh r0, [r5, r0]
	ldrb r3, [r3]
	bl sub_020708D8
	add r2, r0, #0
	lsl r0, r4, #2
	add r1, r5, r0
	mov r0, #0x67
	lsl r0, r0, #4
	add r2, #0x78
	ldr r0, [r1, r0]
	lsl r2, r2, #0x10
	mov r3, #2
	mov r1, #0xc0
	asr r2, r2, #0x10
	lsl r3, r3, #0x14
	bl sub_0200DDF4
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #1
	bl ov18_021F11C0
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	bl ov18_021F11C0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F5FF4: .word 0x000018C7
_021F5FF8: .word 0x000018A2
	thumb_func_end ov18_021F5EFC

	thumb_func_start ov18_021F5FFC
ov18_021F5FFC: ; 0x021F5FFC
	push {r3, r4, r5, lr}
	add r3, r1, #0
	ldr r1, _021F6030 ; =0x000018A4
	add r2, r0, r2
	ldrb r5, [r2, r1]
	mov r2, #0x80
	add r4, r5, #0
	tst r4, r2
	beq _021F6024
	sub r1, r1, #2
	ldrh r1, [r0, r1]
	eor r2, r5
	cmp r1, #0xac
	bne _021F6026
	cmp r2, #2
	bne _021F6020
	mov r2, #1
	b _021F6026
_021F6020:
	mov r2, #0
	b _021F6026
_021F6024:
	mov r2, #0
_021F6026:
	ldr r1, _021F6034 ; =0x000018A2
	ldrh r1, [r0, r1]
	bl ov18_021F14FC
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021F6030: .word 0x000018A4
_021F6034: .word 0x000018A2
	thumb_func_end ov18_021F5FFC

	thumb_func_start ov18_021F6038
ov18_021F6038: ; 0x021F6038
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r4, #0
	mov r6, #0xe
_021F6040:
	ldr r0, _021F6094 ; =0x000018C5
	ldrsb r0, [r5, r0]
	add r0, r0, r4
	sub r7, r0, #2
	ldr r0, _021F6098 ; =0x000018C4
	ldrsb r0, [r5, r0]
	cmp r7, r0
	blo _021F605E
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0xe
	mov r2, #0
	bl ov18_021F11C0
	b _021F6076
_021F605E:
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0xe
	mov r2, #1
	bl ov18_021F11C0
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0xe
	add r2, r7, #0
	bl ov18_021F5FFC
_021F6076:
	mov r0, #0
	add r1, r4, #0
	lsl r3, r6, #0x10
	str r0, [sp]
	add r0, r5, #0
	add r1, #0xe
	mov r2, #0x30
	asr r3, r3, #0x10
	bl ov18_021F1294
	add r4, r4, #1
	add r6, #0x18
	cmp r4, #6
	blo _021F6040
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F6094: .word 0x000018C5
_021F6098: .word 0x000018C4
	thumb_func_end ov18_021F6038

	thumb_func_start ov18_021F609C
ov18_021F609C: ; 0x021F609C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	mov r4, #0
	add r5, r0, #0
	str r1, [sp, #4]
	add r6, r4, #0
	add r7, sp, #8
_021F60AA:
	add r1, r4, #0
	add r2, sp, #8
	add r0, r5, #0
	add r1, #0xe
	add r2, #2
	add r3, sp, #8
	str r6, [sp]
	bl ov18_021F12C8
	mov r0, #0
	ldrsh r1, [r7, r0]
	sub r0, #0xa
	cmp r1, r0
	beq _021F60D0
	cmp r1, #0x86
	beq _021F60D0
	add r4, r4, #1
	cmp r4, #6
	blo _021F60AA
_021F60D0:
	ldr r0, [sp, #4]
	cmp r0, #0
	bge _021F6126
	mov r0, #0
	add r1, r4, #0
	str r0, [sp]
	add r0, r5, #0
	add r1, #0xe
	mov r2, #0x30
	mov r3, #0x86
	bl ov18_021F1294
	ldr r0, _021F6174 ; =0x000018C5
	ldrsb r1, [r5, r0]
	sub r0, r0, #1
	ldrsb r0, [r5, r0]
	add r1, r1, #2
	cmp r1, r0
	blt _021F6106
	add r4, #0xe
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl ov18_021F11C0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_021F6106:
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0xe
	mov r2, #1
	bl ov18_021F11C0
	ldr r2, _021F6174 ; =0x000018C5
	add r4, #0xe
	ldrsb r2, [r5, r2]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r2, #2
	bl ov18_021F5FFC
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_021F6126:
	mov r2, #0x30
	mov r0, #0
	add r1, r4, #0
	add r3, r2, #0
	str r0, [sp]
	add r0, r5, #0
	add r1, #0xe
	sub r3, #0x3a
	bl ov18_021F1294
	ldr r0, _021F6174 ; =0x000018C5
	ldrsb r0, [r5, r0]
	sub r0, r0, #2
	bpl _021F6152
	add r4, #0xe
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl ov18_021F11C0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_021F6152:
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0xe
	mov r2, #1
	bl ov18_021F11C0
	ldr r2, _021F6174 ; =0x000018C5
	add r4, #0xe
	ldrsb r2, [r5, r2]
	add r0, r5, #0
	add r1, r4, #0
	sub r2, r2, #2
	bl ov18_021F5FFC
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_021F6174: .word 0x000018C5
	thumb_func_end ov18_021F609C

	thumb_func_start ov18_021F6178
ov18_021F6178: ; 0x021F6178
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	add r5, r0, #0
	add r6, r1, #0
	add r7, r4, #0
_021F6182:
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0xe
	add r2, r7, #0
	add r3, r6, #0
	str r7, [sp]
	bl ov18_021F121C
	add r4, r4, #1
	cmp r4, #6
	blo _021F6182
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov18_021F6178

	thumb_func_start ov18_021F619C
ov18_021F619C: ; 0x021F619C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r7, r2, #0
	add r4, r3, #0
	cmp r5, #0
	bne _021F61B4
	add r1, r4, #0
	mov r2, #7
	bl ov18_021F118C
	b _021F61BC
_021F61B4:
	add r1, r4, #0
	mov r2, #5
	bl ov18_021F118C
_021F61BC:
	sub r0, r7, #1
	cmp r5, r0
	bne _021F61CE
	add r0, r6, #0
	add r1, r4, #1
	mov r2, #0xa
	bl ov18_021F118C
	pop {r3, r4, r5, r6, r7, pc}
_021F61CE:
	add r0, r6, #0
	add r1, r4, #1
	mov r2, #8
	bl ov18_021F118C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov18_021F619C

	thumb_func_start ov18_021F61DC
ov18_021F61DC: ; 0x021F61DC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r1, r2, #0
	add r2, r3, #0
	ldr r3, [sp, #0x10]
	add r5, r0, #0
	bl ov18_021F61F8
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov18_021F118C
	pop {r3, r4, r5, pc}
	thumb_func_end ov18_021F61DC

	thumb_func_start ov18_021F61F8
ov18_021F61F8: ; 0x021F61F8
	push {r3, r4}
	mov r0, #0
	cmp r3, #0
	bls _021F620E
_021F6200:
	ldrh r4, [r2]
	cmp r1, r4
	ble _021F620E
	add r0, r0, #1
	add r2, r2, #2
	cmp r0, r3
	blo _021F6200
_021F620E:
	add r0, #0xe
	pop {r3, r4}
	bx lr
	thumb_func_end ov18_021F61F8

	thumb_func_start ov18_021F6214
ov18_021F6214: ; 0x021F6214
	push {r4, lr}
	lsl r1, r1, #2
	add r1, r0, r1
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	add r4, r2, #0
	bl sub_0200DC64
	add r0, r4, r0
	sub r0, #0xe
	ldrb r0, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov18_021F6214

	thumb_func_start ov18_021F6230
ov18_021F6230: ; 0x021F6230
	push {r4, lr}
	add r4, r3, #0
	bl ov18_021F6214
	lsr r1, r0, #1
	ldr r0, [sp, #8]
	lsr r0, r0, #1
	sub r0, r4, r0
	add r0, r1, r0
	pop {r4, pc}
	thumb_func_end ov18_021F6230

	thumb_func_start ov18_021F6244
ov18_021F6244: ; 0x021F6244
	push {r4, lr}
	add r4, r3, #0
	bl ov18_021F6214
	ldr r1, [sp, #8]
	lsr r0, r0, #1
	lsr r1, r1, #1
	add r1, r4, r1
	sub r0, r1, r0
	pop {r4, pc}
	thumb_func_end ov18_021F6244

	thumb_func_start ov18_021F6258
ov18_021F6258: ; 0x021F6258
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r0, #0
	ldr r0, _021F62AC ; =0x00000684
	add r5, r1, #0
	add r1, sp, #0
	add r4, r2, #0
	ldr r0, [r6, r0]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	ldr r2, _021F62B0 ; =_021FA310
	add r0, r6, #0
	mov r1, #5
	bl ov18_021F6214
	add r2, sp, #0
	mov r1, #2
	ldrsh r3, [r2, r1]
	add r1, r3, #0
	sub r1, #0xb
	cmp r5, r1
	blo _021F62A6
	add r3, #0xb
	cmp r5, r3
	bhi _021F62A6
	lsr r3, r0, #1
	mov r0, #0
	ldrsh r1, [r2, r0]
	sub r0, r1, r3
	cmp r4, r0
	blo _021F62A6
	add r0, r1, r3
	cmp r4, r0
	bhi _021F62A6
	add sp, #4
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_021F62A6:
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021F62AC: .word 0x00000684
_021F62B0: .word _021FA310
	thumb_func_end ov18_021F6258

	thumb_func_start ov18_021F62B4
ov18_021F62B4: ; 0x021F62B4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r0, #0
	ldr r0, _021F6308 ; =0x00000684
	add r5, r1, #0
	add r1, sp, #0
	add r4, r2, #0
	ldr r0, [r6, r0]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	ldr r2, _021F630C ; =_021FA304
	add r0, r6, #0
	mov r1, #5
	bl ov18_021F6214
	add r2, sp, #0
	mov r1, #2
	ldrsh r3, [r2, r1]
	add r1, r3, #0
	sub r1, #0xb
	cmp r5, r1
	blo _021F6302
	add r3, #0xb
	cmp r5, r3
	bhi _021F6302
	lsr r3, r0, #1
	mov r0, #0
	ldrsh r1, [r2, r0]
	sub r0, r1, r3
	cmp r4, r0
	blo _021F6302
	add r0, r1, r3
	cmp r4, r0
	bhi _021F6302
	add sp, #4
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_021F6302:
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021F6308: .word 0x00000684
_021F630C: .word _021FA304
	thumb_func_end ov18_021F62B4

	thumb_func_start ov18_021F6310
ov18_021F6310: ; 0x021F6310
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _021F63CC ; =0x00000684
	add r1, sp, #4
	add r6, r2, #0
	ldr r0, [r5, r0]
	add r1, #2
	add r2, sp, #4
	bl sub_0200DE44
	mov r0, #0x56
	str r0, [sp]
	ldr r2, _021F63D0 ; =_021FA310
	add r0, r5, #0
	mov r1, #5
	mov r3, #0x40
	bl ov18_021F6230
	cmp r6, r0
	bhs _021F633C
	add r6, r0, #0
_021F633C:
	mov r0, #0x56
	str r0, [sp]
	ldr r2, _021F63D0 ; =_021FA310
	add r0, r5, #0
	mov r1, #5
	mov r3, #0x40
	bl ov18_021F6244
	cmp r6, r0
	bls _021F6352
	add r6, r0, #0
_021F6352:
	ldr r0, _021F63CC ; =0x00000684
	add r2, sp, #4
	mov r1, #2
	ldrsh r1, [r2, r1]
	lsl r2, r6, #0x10
	ldr r0, [r5, r0]
	asr r2, r2, #0x10
	bl sub_0200DDB8
	mov r0, #0x56
	str r0, [sp]
	ldr r2, _021F63D0 ; =_021FA310
	add r0, r5, #0
	mov r1, #5
	mov r3, #0x40
	bl ov18_021F6230
	add r7, r0, #0
	mov r0, #0x56
	str r0, [sp]
	ldr r2, _021F63D0 ; =_021FA310
	add r0, r5, #0
	mov r1, #5
	mov r3, #0x40
	bl ov18_021F6244
	sub r1, r0, r7
	ldr r0, _021F63D4 ; =0x000018C4
	ldrsb r0, [r5, r0]
	sub r4, r0, #1
	lsl r0, r1, #8
	add r1, r4, #0
	bl _u32_div_f
	sub r1, r6, r7
	mov r3, #0
	lsl r2, r1, #8
	add r6, r3, #0
	add r7, r3, #0
_021F63A0:
	cmp r2, r6
	blo _021F63BA
	add r1, r7, r0
	cmp r2, r1
	bhs _021F63BA
	ldr r0, _021F63D8 ; =0x000018C5
	ldrsb r1, [r5, r0]
	cmp r1, r3
	beq _021F63C4
	add sp, #8
	strb r3, [r5, r0]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021F63BA:
	add r3, r3, #1
	add r6, r6, r0
	add r7, r7, r0
	cmp r3, r4
	bls _021F63A0
_021F63C4:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F63CC: .word 0x00000684
_021F63D0: .word _021FA310
_021F63D4: .word 0x000018C4
_021F63D8: .word 0x000018C5
	thumb_func_end ov18_021F6310

	thumb_func_start ov18_021F63DC
ov18_021F63DC: ; 0x021F63DC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _021F6498 ; =0x00000684
	add r1, sp, #4
	add r6, r2, #0
	ldr r0, [r5, r0]
	add r1, #2
	add r2, sp, #4
	bl sub_0200DE44
	mov r0, #0x56
	str r0, [sp]
	ldr r2, _021F649C ; =_021FA304
	add r0, r5, #0
	mov r1, #5
	mov r3, #0x60
	bl ov18_021F6230
	cmp r6, r0
	bhs _021F6408
	add r6, r0, #0
_021F6408:
	mov r0, #0x56
	str r0, [sp]
	ldr r2, _021F649C ; =_021FA304
	add r0, r5, #0
	mov r1, #5
	mov r3, #0x60
	bl ov18_021F6244
	cmp r6, r0
	bls _021F641E
	add r6, r0, #0
_021F641E:
	ldr r0, _021F6498 ; =0x00000684
	add r2, sp, #4
	mov r1, #2
	ldrsh r1, [r2, r1]
	lsl r2, r6, #0x10
	ldr r0, [r5, r0]
	asr r2, r2, #0x10
	bl sub_0200DDB8
	mov r0, #0x56
	str r0, [sp]
	ldr r2, _021F649C ; =_021FA304
	add r0, r5, #0
	mov r1, #5
	mov r3, #0x60
	bl ov18_021F6230
	add r7, r0, #0
	mov r0, #0x56
	str r0, [sp]
	ldr r2, _021F649C ; =_021FA304
	add r0, r5, #0
	mov r1, #5
	mov r3, #0x60
	bl ov18_021F6244
	sub r1, r0, r7
	mov r0, #0x19
	lsl r0, r0, #8
	ldr r0, [r5, r0]
	sub r4, r0, #1
	lsl r0, r1, #8
	add r1, r4, #0
	bl _u32_div_f
	sub r1, r6, r7
	mov r3, #0
	lsl r2, r1, #8
	add r6, r3, #0
	add r7, r3, #0
_021F646E:
	cmp r2, r6
	blo _021F6488
	add r1, r7, r0
	cmp r2, r1
	bhs _021F6488
	ldr r0, _021F64A0 ; =0x000018CA
	ldrsb r1, [r5, r0]
	cmp r1, r3
	beq _021F6492
	add sp, #8
	strb r3, [r5, r0]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021F6488:
	add r3, r3, #1
	add r6, r6, r0
	add r7, r7, r0
	cmp r3, r4
	bls _021F646E
_021F6492:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F6498: .word 0x00000684
_021F649C: .word _021FA304
_021F64A0: .word 0x000018CA
	thumb_func_end ov18_021F63DC

	thumb_func_start ov18_021F64A4
ov18_021F64A4: ; 0x021F64A4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r1, #0
	mov r1, #0x56
	str r1, [sp]
	ldr r2, _021F64EC ; =_021FA310
	mov r1, #5
	mov r3, #0x40
	add r6, r0, #0
	bl ov18_021F6230
	add r4, r0, #0
	mov r0, #0x56
	str r0, [sp]
	ldr r2, _021F64EC ; =_021FA310
	add r0, r6, #0
	mov r1, #5
	mov r3, #0x40
	bl ov18_021F6244
	ldr r1, _021F64F0 ; =0x000018C4
	ldrsb r1, [r6, r1]
	sub r1, r1, #1
	cmp r5, r1
	beq _021F64E6
	sub r0, r0, r4
	lsl r0, r0, #8
	bl _u32_div_f
	add r1, r0, #0
	mul r1, r5
	lsr r0, r1, #8
	add r0, r4, r0
_021F64E6:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_021F64EC: .word _021FA310
_021F64F0: .word 0x000018C4
	thumb_func_end ov18_021F64A4

	thumb_func_start ov18_021F64F4
ov18_021F64F4: ; 0x021F64F4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r1, #0
	mov r1, #0x56
	str r1, [sp]
	ldr r2, _021F653C ; =_021FA304
	mov r1, #5
	mov r3, #0x60
	add r6, r0, #0
	bl ov18_021F6230
	add r4, r0, #0
	mov r0, #0x56
	str r0, [sp]
	ldr r2, _021F653C ; =_021FA304
	add r0, r6, #0
	mov r1, #5
	mov r3, #0x60
	bl ov18_021F6244
	mov r1, #0x19
	lsl r1, r1, #8
	ldr r1, [r6, r1]
	sub r1, r1, #1
	cmp r5, r1
	beq _021F6538
	sub r0, r0, r4
	lsl r0, r0, #8
	bl _u32_div_f
	add r1, r0, #0
	mul r1, r5
	lsr r0, r1, #8
	add r0, r4, r0
_021F6538:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021F653C: .word _021FA304
	thumb_func_end ov18_021F64F4

	thumb_func_start ov18_021F6540
ov18_021F6540: ; 0x021F6540
	push {r3, r4, r5, lr}
	lsl r1, r1, #2
	add r1, r0, r1
	mov r0, #0x67
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	add r1, sp, #0
	add r5, r2, #0
	add r1, #2
	add r2, sp, #0
	add r4, r3, #0
	bl sub_0200DE44
	add r1, sp, #0
	mov r0, #0
	ldrsh r0, [r1, r0]
	cmp r5, r0
	blo _021F656E
	sub r0, r5, r0
	add r1, r4, #0
	bl _u32_div_f
	pop {r3, r4, r5, pc}
_021F656E:
	sub r0, r0, r5
	add r1, r4, #0
	bl _u32_div_f
	pop {r3, r4, r5, pc}
	thumb_func_end ov18_021F6540

	thumb_func_start ov18_021F6578
ov18_021F6578: ; 0x021F6578
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r2, #0
	mov r2, #0x67
	lsl r2, r2, #4
	add r5, r0, r2
	lsl r4, r1, #2
	add r1, sp, #0
	ldr r0, [r5, r4]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	add r3, sp, #0
	mov r2, #0
	ldrsh r2, [r3, r2]
	mov r1, #2
	ldrsh r1, [r3, r1]
	add r2, r2, r6
	lsl r2, r2, #0x10
	ldr r0, [r5, r4]
	asr r2, r2, #0x10
	bl sub_0200DDB8
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov18_021F6578

	thumb_func_start ov18_021F65AC
ov18_021F65AC: ; 0x021F65AC
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, _021F65E4 ; =0x00000684
	add r1, sp, #0
	ldr r0, [r4, r0]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	ldr r1, _021F65E8 ; =0x000018C5
	add r0, r4, #0
	ldrsb r1, [r4, r1]
	bl ov18_021F64A4
	add r3, r0, #0
	ldr r0, _021F65E4 ; =0x00000684
	add r2, sp, #0
	mov r1, #2
	ldrsh r1, [r2, r1]
	lsl r2, r3, #0x10
	ldr r0, [r4, r0]
	asr r2, r2, #0x10
	bl sub_0200DDB8
	add sp, #4
	pop {r3, r4, pc}
	nop
_021F65E4: .word 0x00000684
_021F65E8: .word 0x000018C5
	thumb_func_end ov18_021F65AC

	thumb_func_start ov18_021F65EC
ov18_021F65EC: ; 0x021F65EC
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, _021F6624 ; =0x00000684
	add r1, sp, #0
	ldr r0, [r4, r0]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	ldr r1, _021F6628 ; =0x000018CA
	add r0, r4, #0
	ldrsb r1, [r4, r1]
	bl ov18_021F64F4
	add r3, r0, #0
	ldr r0, _021F6624 ; =0x00000684
	add r2, sp, #0
	mov r1, #2
	ldrsh r1, [r2, r1]
	lsl r2, r3, #0x10
	ldr r0, [r4, r0]
	asr r2, r2, #0x10
	bl sub_0200DDB8
	add sp, #4
	pop {r3, r4, pc}
	nop
_021F6624: .word 0x00000684
_021F6628: .word 0x000018CA
	thumb_func_end ov18_021F65EC

	thumb_func_start ov18_021F662C
ov18_021F662C: ; 0x021F662C
	push {r4, lr}
	ldr r1, _021F6680 ; =0x000018C5
	add r4, r0, #0
	ldrsb r1, [r4, r1]
	mov r2, #1
	bl ov18_021F5EFC
	add r0, r4, #0
	bl ov18_021F6038
	add r0, r4, #0
	bl ov18_021F65AC
	ldr r2, _021F6680 ; =0x000018C5
	add r0, r4, #0
	ldrsb r1, [r4, r2]
	sub r2, r2, #1
	ldrsb r2, [r4, r2]
	mov r3, #6
	bl ov18_021F619C
	add r0, r4, #0
	mov r1, #5
	mov r2, #1
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #6
	mov r2, #1
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #7
	mov r2, #1
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #8
	mov r2, #1
	bl ov18_021F11C0
	pop {r4, pc}
	.balign 4, 0
_021F6680: .word 0x000018C5
	thumb_func_end ov18_021F662C

	thumb_func_start ov18_021F6684
ov18_021F6684: ; 0x021F6684
	push {r4, lr}
	add r4, r0, #0
	mov r1, #5
	mov r2, #0
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #6
	mov r2, #0
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #7
	mov r2, #0
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #8
	mov r2, #0
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #0xe
	mov r2, #0
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #0xf
	mov r2, #0
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #0x10
	mov r2, #0
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #0x11
	mov r2, #0
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #0x12
	mov r2, #0
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #0x13
	mov r2, #0
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #1
	mov r2, #0
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #2
	mov r2, #0
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #3
	mov r2, #0
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #4
	mov r2, #0
	bl ov18_021F11C0
	pop {r4, pc}
	thumb_func_end ov18_021F6684

	thumb_func_start ov18_021F6714
ov18_021F6714: ; 0x021F6714
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _021F67C4 ; =0x000018C4
	add r4, r0, #0
	ldrsb r1, [r4, r1]
	cmp r1, #3
	blt _021F6752
	mov r1, #9
	mov r2, #1
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #0xa
	mov r2, #1
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #0xb
	mov r2, #1
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #0xc
	mov r2, #1
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #0xd
	mov r2, #1
	bl ov18_021F11C0
_021F6752:
	ldr r2, _021F67C8 ; =0x000018C5
	add r0, r4, #0
	ldrsb r2, [r4, r2]
	mov r1, #0xe
	bl ov18_021F6844
	ldr r2, _021F67CC ; =0x000018C6
	add r0, r4, #0
	ldrsb r2, [r4, r2]
	mov r1, #0xf
	bl ov18_021F6844
	mov r0, #0
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0xe
	mov r2, #0x40
	mov r3, #0x50
	bl ov18_021F1294
	mov r0, #0
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0xf
	mov r2, #0xc0
	mov r3, #0x50
	bl ov18_021F1294
	ldr r2, _021F67C8 ; =0x000018C5
	mov r1, #1
	ldrsb r2, [r4, r2]
	add r0, r4, #0
	add r3, r1, #0
	bl ov18_021F684C
	ldr r2, _021F67CC ; =0x000018C6
	add r0, r4, #0
	ldrsb r2, [r4, r2]
	mov r1, #2
	mov r3, #1
	bl ov18_021F684C
	add r0, r4, #0
	bl ov18_021F6990
	add r0, r4, #0
	mov r1, #0xe
	mov r2, #1
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #0xf
	mov r2, #1
	bl ov18_021F11C0
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_021F67C4: .word 0x000018C4
_021F67C8: .word 0x000018C5
_021F67CC: .word 0x000018C6
	thumb_func_end ov18_021F6714

	thumb_func_start ov18_021F67D0
ov18_021F67D0: ; 0x021F67D0
	push {r4, lr}
	add r4, r0, #0
	mov r1, #9
	mov r2, #0
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #0xa
	mov r2, #0
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #0xb
	mov r2, #0
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #0xc
	mov r2, #0
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #0xd
	mov r2, #0
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #0xe
	mov r2, #0
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #0xf
	mov r2, #0
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #1
	mov r2, #0
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #2
	mov r2, #0
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #3
	mov r2, #0
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #4
	mov r2, #0
	bl ov18_021F11C0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov18_021F67D0

	thumb_func_start ov18_021F6844
ov18_021F6844: ; 0x021F6844
	ldr r3, _021F6848 ; =ov18_021F5FFC
	bx r3
	.balign 4, 0
_021F6848: .word ov18_021F5FFC
	thumb_func_end ov18_021F6844

	thumb_func_start ov18_021F684C
ov18_021F684C: ; 0x021F684C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r3, [sp, #0xc]
	add r3, sp, #0x14
	add r4, r1, #0
	add r1, r2, #0
	add r2, sp, #0x14
	add r3, #1
	add r5, r0, #0
	bl ov18_021F3CA8
	ldr r0, _021F697C ; =0x000018C7
	ldrb r1, [r5, r0]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1f
	bne _021F6872
	mov r6, #2
	mov r0, #0
	b _021F6886
_021F6872:
	mov r6, #0
	str r6, [sp]
	sub r0, #0x25
	add r3, sp, #0x14
	ldrb r1, [r3, #1]
	ldrh r0, [r5, r0]
	ldrb r3, [r3]
	add r2, r6, #0
	bl sub_020708D8
_021F6886:
	cmp r4, #1
	bne _021F68EC
	add r0, #0x78
	lsl r0, r0, #0x18
	mov r1, #0x40
	lsr r7, r0, #0x18
	ldr r0, _021F697C ; =0x000018C7
	str r1, [sp, #0x10]
	ldrb r0, [r5, r0]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _021F68B8
	mov r4, #3
	add r0, r5, #0
	mov r1, #1
	mov r2, #0
	bl ov18_021F11C0
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	bl ov18_021F11C0
	b _021F68CC
_021F68B8:
	mov r1, #1
	add r0, r5, #0
	add r2, r1, #0
	bl ov18_021F11C0
	add r0, r5, #0
	mov r1, #3
	mov r2, #0
	bl ov18_021F11C0
_021F68CC:
	ldr r3, _021F697C ; =0x000018C7
	mov r1, #0x20
	ldrb r2, [r5, r3]
	add r0, r2, #0
	bic r0, r1
	lsl r1, r2, #0x1a
	lsr r2, r1, #0x1f
	mov r1, #1
	eor r1, r2
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1a
	orr r0, r1
	strb r0, [r5, r3]
	b _021F6950
_021F68EC:
	cmp r4, #2
	bne _021F6950
	add r0, #0x78
	lsl r0, r0, #0x18
	mov r1, #0xc0
	lsr r7, r0, #0x18
	ldr r0, _021F697C ; =0x000018C7
	str r1, [sp, #0x10]
	ldrb r0, [r5, r0]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _021F691E
	mov r4, #4
	add r0, r5, #0
	mov r1, #2
	mov r2, #0
	bl ov18_021F11C0
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	bl ov18_021F11C0
	b _021F6932
_021F691E:
	add r0, r5, #0
	mov r1, #2
	mov r2, #1
	bl ov18_021F11C0
	add r0, r5, #0
	mov r1, #4
	mov r2, #0
	bl ov18_021F11C0
_021F6932:
	ldr r3, _021F697C ; =0x000018C7
	mov r1, #0x40
	ldrb r2, [r5, r3]
	add r0, r2, #0
	bic r0, r1
	lsl r1, r2, #0x19
	lsr r2, r1, #0x1f
	mov r1, #1
	eor r1, r2
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x19
	orr r0, r1
	strb r0, [r5, r3]
_021F6950:
	str r6, [sp]
	ldr r0, [sp, #0xc]
	str r4, [sp, #4]
	str r0, [sp, #8]
	ldr r1, _021F6980 ; =0x000018A2
	add r3, sp, #0x14
	ldrb r2, [r3]
	ldrh r1, [r5, r1]
	ldrb r3, [r3, #1]
	add r0, r5, #0
	bl ov18_021F1A7C
	mov r0, #1
	str r0, [sp]
	ldr r2, [sp, #0x10]
	add r0, r5, #0
	add r1, r4, #0
	add r3, r7, #0
	bl ov18_021F1294
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F697C: .word 0x000018C7
_021F6980: .word 0x000018A2
	thumb_func_end ov18_021F684C

	thumb_func_start ov18_021F6984
ov18_021F6984: ; 0x021F6984
	push {r3, lr}
	mov r3, #0
	bl ov18_021F684C
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov18_021F6984

	thumb_func_start ov18_021F6990
ov18_021F6990: ; 0x021F6990
	push {r3, lr}
	ldr r1, _021F69BC ; =0x000018C7
	ldrb r1, [r0, r1]
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x1b
	bne _021F69AC
	mov r1, #0
	str r1, [sp]
	mov r1, #0xd
	mov r2, #0x40
	mov r3, #0x58
	bl ov18_021F1294
	pop {r3, pc}
_021F69AC:
	mov r1, #0
	str r1, [sp]
	mov r1, #0xd
	mov r2, #0xc0
	mov r3, #0x58
	bl ov18_021F1294
	pop {r3, pc}
	.balign 4, 0
_021F69BC: .word 0x000018C7
	thumb_func_end ov18_021F6990

	thumb_func_start ov18_021F69C0
ov18_021F69C0: ; 0x021F69C0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	ldr r0, [r0, #4]
	bl PlayerProfile_GetTrainerGender
	cmp r0, #0
	bne _021F69D6
	mov r2, #0
	b _021F69D8
_021F69D6:
	mov r2, #1
_021F69D8:
	cmp r4, #1
	bne _021F69DE
	add r2, r2, #2
_021F69DE:
	add r0, r5, #0
	mov r1, #2
	bl ov18_021F118C
	pop {r3, r4, r5, pc}
	thumb_func_end ov18_021F69C0

	thumb_func_start ov18_021F69E8
ov18_021F69E8: ; 0x021F69E8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	str r2, [sp, #0x14]
	str r3, [sp, #0x18]
	ldr r3, _021F6AA4 ; =_021FA338
	add r2, sp, #0x1c
	add r5, r0, #0
	add r4, r1, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	mov r1, #0x32
	mov r0, #0x25
	lsl r1, r1, #6
	bl AllocFromHeapAtEnd
	add r7, r0, #0
	ldr r0, _021F6AA8 ; =0x00000147
	cmp r4, r0
	bne _021F6A20
	ldr r0, [r5]
	mov r1, #0
	ldr r0, [r0]
	bl Pokedex_GetSeenSpindaPersonality
	add r6, r0, #0
	b _021F6A22
_021F6A20:
	mov r6, #0
_021F6A22:
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x14]
	add r3, sp, #0x40
	str r0, [sp, #4]
	str r6, [sp, #8]
	ldrb r3, [r3, #0x10]
	ldr r2, [sp, #0x18]
	add r0, sp, #0x2c
	add r1, r4, #0
	bl GetMonSpriteCharAndPlttNarcIdsEx
	str r7, [sp]
	str r6, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	str r4, [sp, #0x10]
	add r1, sp, #0x1c
	ldrh r0, [r1, #0x10]
	ldrh r1, [r1, #0x12]
	mov r2, #0x25
	add r3, sp, #0x1c
	bl sub_02014510
	mov r1, #0x32
	add r0, r7, #0
	lsl r1, r1, #6
	mov r2, #0xf
	mov r3, #0x25
	bl Convert4bppTo8bpp
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r3, #0x19
	ldr r0, [r5, #4]
	mov r1, #7
	add r2, r4, #0
	lsl r3, r3, #8
	bl BG_LoadCharTilesData
	add r0, r4, #0
	bl FreeToHeap
	add r0, r7, #0
	bl FreeToHeap
	mov r3, #0xb
	str r3, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5, #4]
	ldr r2, _021F6AAC ; =_021FB5B4
	mov r1, #7
	bl LoadRectToBgTilemapRect
	ldr r0, [r5, #4]
	mov r1, #7
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021F6AA4: .word _021FA338
_021F6AA8: .word 0x00000147
_021F6AAC: .word _021FB5B4
	thumb_func_end ov18_021F69E8

	thumb_func_start ov18_021F6AB0
ov18_021F6AB0: ; 0x021F6AB0
	push {r4, r5, lr}
	sub sp, #0x1c
	add r5, r0, #0
	mov r0, #1
	add r4, r1, #0
	lsl r0, r0, #0x14
	lsl r1, r2, #0xc
	bl FX_Div
	bl FX_Inv
	mov r2, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x18]
	str r2, [sp, #0x10]
	str r2, [sp, #0x14]
	add r0, sp, #0xc
	str r0, [sp]
	mov r0, #0x80
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5, #4]
	mov r1, #7
	mov r3, #0x38
	bl Bg_SetTextDimAndAffineParams
	add r0, sp, #0xc
	str r0, [sp]
	mov r0, #0x80
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r3, #0x10
	ldr r0, [r5, #4]
	mov r1, #7
	mov r2, #3
	sub r3, r3, r4
	bl Bg_SetTextDimAndAffineParams
	add sp, #0x1c
	pop {r4, r5, pc}
	thumb_func_end ov18_021F6AB0

	thumb_func_start ov18_021F6B00
ov18_021F6B00: ; 0x021F6B00
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021F6BA8 ; =0x00000864
	mov r1, #0
	str r1, [r4, r0]
	bl System_GetTouchNew
	cmp r0, #1
	bne _021F6B3A
	ldr r0, _021F6BAC ; =_021FB72C
	bl sub_02025224
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _021F6B24
	add r0, r1, #0
	pop {r4, pc}
_021F6B24:
	lsl r1, r0, #2
	ldr r0, _021F6BB0 ; =_021FB6F0
	ldr r0, [r0, r1]
	cmp r0, #6
	bne _021F6BA4
	ldr r1, _021F6BB4 ; =0x00001860
	ldr r1, [r4, r1]
	cmp r1, #0
	bne _021F6BA4
	mov r0, #5
	pop {r4, pc}
_021F6B3A:
	ldr r0, _021F6BA8 ; =0x00000864
	mov r1, #1
	str r1, [r4, r0]
	ldr r1, _021F6BB4 ; =0x00001860
	ldr r0, [r4, r1]
	cmp r0, #1
	bne _021F6B7C
	ldr r0, _021F6BB8 ; =gSystem
	ldr r3, [r0, #0x48]
	mov r0, #0x20
	add r2, r3, #0
	tst r2, r0
	beq _021F6B64
	sub r1, #8
	ldrb r1, [r4, r1]
	cmp r1, #0
	bne _021F6B60
	mov r0, #3
	pop {r4, pc}
_021F6B60:
	sub r0, #0x21
	pop {r4, pc}
_021F6B64:
	mov r0, #0x10
	add r2, r3, #0
	tst r2, r0
	beq _021F6B7C
	sub r1, #8
	ldrb r1, [r4, r1]
	cmp r1, #1
	bne _021F6B78
	mov r0, #4
	pop {r4, pc}
_021F6B78:
	sub r0, #0x11
	pop {r4, pc}
_021F6B7C:
	ldr r0, _021F6BB8 ; =gSystem
	mov r1, #1
	ldr r3, [r0, #0x48]
	add r0, r3, #0
	tst r0, r1
	bne _021F6B8E
	mov r0, #8
	tst r0, r3
	beq _021F6B92
_021F6B8E:
	mov r0, #0
	pop {r4, pc}
_021F6B92:
	mov r0, #2
	add r2, r3, #0
	tst r2, r0
	bne _021F6BA4
	lsl r2, r0, #0xa
	tst r2, r3
	bne _021F6BA2
	sub r1, r0, #3
_021F6BA2:
	add r0, r1, #0
_021F6BA4:
	pop {r4, pc}
	nop
_021F6BA8: .word 0x00000864
_021F6BAC: .word _021FB72C
_021F6BB0: .word _021FB6F0
_021F6BB4: .word 0x00001860
_021F6BB8: .word gSystem
	thumb_func_end ov18_021F6B00

	thumb_func_start ov18_021F6BBC
ov18_021F6BBC: ; 0x021F6BBC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	ldr r0, _021F6DBC ; =0x00000864
	mov r1, #0
	str r1, [r5, r0]
	add r0, sp, #4
	add r1, sp, #0
	bl sub_02025380
	cmp r0, #1
	bne _021F6C5C
	ldr r0, _021F6DC0 ; =_021FB8A4
	bl sub_02025224
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _021F6BEA
	add sp, #8
	add r0, r1, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F6BEA:
	lsl r1, r0, #2
	ldr r0, _021F6DC4 ; =_021FB84C
	ldr r4, [r0, r1]
	cmp r4, #0
	bne _021F6C32
	ldr r1, [sp]
	ldr r0, [sp, #4]
	sub r1, r1, #4
	sub r0, #0x1b
	str r1, [sp]
	mov r1, #0x28
	str r0, [sp, #4]
	bl _u32_div_f
	add r6, r0, #0
	ldr r0, [sp]
	mov r1, #0x28
	bl _u32_div_f
	lsl r1, r0, #2
	add r0, r0, r1
	add r0, r6, r0
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	ldr r0, _021F6DC8 ; =0x0000185A
	ldrb r1, [r5, r0]
	cmp r2, r1
	bne _021F6C28
	add sp, #8
	mov r0, #4
	pop {r3, r4, r5, r6, r7, pc}
_021F6C28:
	strb r2, [r5, r0]
	ldr r0, _021F6DCC ; =0x000008E9
	bl PlaySE
	b _021F6C56
_021F6C32:
	cmp r4, #0xe
	bne _021F6C3E
	ldr r0, _021F6DD0 ; =0x000008F2
	bl PlaySE
	b _021F6C56
_021F6C3E:
	cmp r4, #2
	bne _021F6C4A
	ldr r0, _021F6DCC ; =0x000008E9
	bl PlaySE
	b _021F6C56
_021F6C4A:
	cmp r4, #5
	bne _021F6C56
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
_021F6C56:
	add sp, #8
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F6C5C:
	ldr r2, _021F6DBC ; =0x00000864
	mov r6, #1
	ldr r7, _021F6DD4 ; =gSystem
	str r6, [r5, r2]
	ldr r3, [r7, #0x4c]
	mov r0, #0x40
	tst r0, r3
	beq _021F6C8C
	ldr r0, _021F6DC8 ; =0x0000185A
	ldrb r1, [r5, r0]
	cmp r1, #5
	bhs _021F6C7A
	add sp, #8
	mov r0, #0xa
	pop {r3, r4, r5, r6, r7, pc}
_021F6C7A:
	sub r1, r1, #5
	add r2, #0x84
	strb r1, [r5, r0]
	add r0, r2, #0
	bl PlaySE
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F6C8C:
	mov r0, #0x80
	tst r0, r3
	beq _021F6CB8
	ldr r0, _021F6DC8 ; =0x0000185A
	ldrb r0, [r5, r0]
	cmp r0, #0xa
	blo _021F6CA4
	cmp r0, #0xf
	bhs _021F6CA4
	add sp, #8
	mov r0, #0xc
	pop {r3, r4, r5, r6, r7, pc}
_021F6CA4:
	ldr r0, _021F6DC8 ; =0x0000185A
	ldrb r1, [r5, r0]
	add r1, r1, #5
	strb r1, [r5, r0]
	ldr r0, _021F6DD8 ; =0x000008E8
	bl PlaySE
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F6CB8:
	mov r0, #0x20
	add r1, r3, #0
	tst r1, r0
	beq _021F6CF2
	ldr r3, _021F6DC8 ; =0x0000185A
	ldrb r1, [r5, r3]
	cmp r1, #0
	beq _021F6CDA
	sub r0, r1, #1
	add r2, #0x84
	strb r0, [r5, r3]
	add r0, r2, #0
	bl PlaySE
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F6CDA:
	sub r1, r3, #1
	ldrb r1, [r5, r1]
	cmp r1, #0
	beq _021F6CEC
	mov r0, #0xe
	strb r0, [r5, r3]
	add sp, #8
	mov r0, #9
	pop {r3, r4, r5, r6, r7, pc}
_021F6CEC:
	add sp, #8
	sub r0, #0x21
	pop {r3, r4, r5, r6, r7, pc}
_021F6CF2:
	mov r0, #0x10
	tst r0, r3
	beq _021F6D36
	ldr r0, _021F6DC8 ; =0x0000185A
	ldrb r1, [r5, r0]
	add r1, r1, #1
	cmp r1, #0xf
	beq _021F6D12
	add r2, #0x84
	strb r1, [r5, r0]
	add r0, r2, #0
	bl PlaySE
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F6D12:
	add r0, r5, #0
	add r1, r4, #0
	bl ov18_021F8950
	ldr r1, _021F6DDC ; =0x00001859
	ldrb r2, [r5, r1]
	add r2, r2, #1
	cmp r2, r0
	bhi _021F6D30
	mov r2, #0
	add r0, r1, #1
	strb r2, [r5, r0]
	add sp, #8
	mov r0, #0xb
	pop {r3, r4, r5, r6, r7, pc}
_021F6D30:
	add sp, #8
	sub r0, r6, #2
	pop {r3, r4, r5, r6, r7, pc}
_021F6D36:
	ldr r1, [r7, #0x48]
	add r0, r1, #0
	tst r0, r6
	beq _021F6D44
	add sp, #8
	mov r0, #4
	pop {r3, r4, r5, r6, r7, pc}
_021F6D44:
	mov r4, #2
	add r0, r1, #0
	tst r0, r4
	beq _021F6D5A
	add r2, #0xdc
	add r0, r2, #0
	bl PlaySE
	add sp, #8
	mov r0, #6
	pop {r3, r4, r5, r6, r7, pc}
_021F6D5A:
	lsl r0, r4, #9
	tst r0, r1
	beq _021F6D66
	add sp, #8
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_021F6D66:
	lsl r0, r4, #0xa
	tst r0, r1
	beq _021F6D7A
	add r2, #0x85
	add r0, r2, #0
	bl PlaySE
	add sp, #8
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F6D7A:
	lsl r0, r4, #8
	tst r0, r3
	beq _021F6D86
	add sp, #8
	mov r0, #9
	pop {r3, r4, r5, r6, r7, pc}
_021F6D86:
	add r4, #0xfe
	add r0, r3, #0
	tst r0, r4
	beq _021F6D94
	add sp, #8
	mov r0, #0xb
	pop {r3, r4, r5, r6, r7, pc}
_021F6D94:
	mov r0, #4
	tst r0, r1
	beq _021F6DA0
	add sp, #8
	mov r0, #8
	pop {r3, r4, r5, r6, r7, pc}
_021F6DA0:
	mov r0, #8
	tst r1, r0
	beq _021F6DB4
	add r2, #0x8e
	add r0, r2, #0
	bl PlaySE
	add sp, #8
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F6DB4:
	sub r0, #9
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F6DBC: .word 0x00000864
_021F6DC0: .word _021FB8A4
_021F6DC4: .word _021FB84C
_021F6DC8: .word 0x0000185A
_021F6DCC: .word 0x000008E9
_021F6DD0: .word 0x000008F2
_021F6DD4: .word gSystem
_021F6DD8: .word 0x000008E8
_021F6DDC: .word 0x00001859
	thumb_func_end ov18_021F6BBC

	thumb_func_start ov18_021F6DE0
ov18_021F6DE0: ; 0x021F6DE0
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #1
	str r0, [sp]
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	mov r0, #0x25
	str r0, [sp, #8]
	ldr r0, _021F6E1C ; =_021FB878
	ldr r1, _021F6E20 ; =_021FB9F0
	ldr r2, _021F6E24 ; =_021FB688
	add r3, r5, #0
	bl sub_02019BA4
	ldr r1, _021F6E28 ; =0x00001864
	mov r2, #1
	str r0, [r5, r1]
	add r0, r5, #0
	mov r1, #0
	bl ov18_021F11C0
	add r0, r5, #0
	add r1, r4, #0
	bl ov18_021F6E58
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_021F6E1C: .word _021FB878
_021F6E20: .word _021FB9F0
_021F6E24: .word _021FB688
_021F6E28: .word 0x00001864
	thumb_func_end ov18_021F6DE0

	thumb_func_start ov18_021F6E2C
ov18_021F6E2C: ; 0x021F6E2C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	mov r1, #0
	ldr r0, [r0, #0xc]
	bl sub_02018410
	ldr r0, _021F6E50 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #8
	tst r1, r0
	bne _021F6E4C
	ldr r0, _021F6E54 ; =0x00001864
	ldr r0, [r4, r0]
	bl sub_02019D18
_021F6E4C:
	pop {r4, pc}
	nop
_021F6E50: .word gSystem
_021F6E54: .word 0x00001864
	thumb_func_end ov18_021F6E2C

	thumb_func_start ov18_021F6E58
ov18_021F6E58: ; 0x021F6E58
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021F6E90 ; =0x00001864
	add r4, r1, #0
	ldr r0, [r5, r0]
	bl sub_0201A018
	add r1, sp, #0
	add r1, #1
	add r2, sp, #0
	bl sub_02020A0C
	mov r0, #0x67
	add r2, sp, #0
	lsl r0, r0, #4
	ldrb r1, [r2, #1]
	ldrb r2, [r2]
	ldr r0, [r5, r0]
	bl sub_0200DDB8
	ldr r2, _021F6E94 ; =_021FBD1C
	add r0, r5, #0
	ldrb r2, [r2, r4]
	mov r1, #0
	bl ov18_021F118C
	pop {r3, r4, r5, pc}
	nop
_021F6E90: .word 0x00001864
_021F6E94: .word _021FBD1C
	thumb_func_end ov18_021F6E58

	thumb_func_start ov18_021F6E98
ov18_021F6E98: ; 0x021F6E98
	push {r3, lr}
	bl ov18_021F6E58
	ldr r0, _021F6EA8 ; =0x000008E8
	bl PlaySE
	pop {r3, pc}
	nop
_021F6EA8: .word 0x000008E8
	thumb_func_end ov18_021F6E98

	thumb_func_start ov18_021F6EAC
ov18_021F6EAC: ; 0x021F6EAC
	push {r4, lr}
	add r4, r0, #0
	bl ov18_021F6E58
	ldr r0, [r4]
	mov r1, #1
	ldr r0, [r0, #0xc]
	bl sub_02018410
	pop {r4, pc}
	thumb_func_end ov18_021F6EAC

	thumb_func_start ov18_021F6EC0
ov18_021F6EC0: ; 0x021F6EC0
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0x25
	str r0, [sp, #8]
	ldr r0, _021F6EF8 ; =_021FB828
	ldr r1, _021F6EFC ; =_021FB968
	ldr r2, _021F6F00 ; =_021FB668
	add r3, r4, #0
	bl sub_02019BA4
	ldr r1, _021F6F04 ; =0x00001864
	mov r2, #1
	str r0, [r4, r1]
	add r0, r4, #0
	mov r1, #0
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #0
	bl ov18_021F6F38
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_021F6EF8: .word _021FB828
_021F6EFC: .word _021FB968
_021F6F00: .word _021FB668
_021F6F04: .word 0x00001864
	thumb_func_end ov18_021F6EC0

	thumb_func_start ov18_021F6F08
ov18_021F6F08: ; 0x021F6F08
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	mov r1, #0
	ldr r0, [r0, #0xc]
	bl sub_02018410
	ldr r0, _021F6F30 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #8
	tst r0, r1
	beq _021F6F24
	mov r0, #6
	pop {r4, pc}
_021F6F24:
	ldr r0, _021F6F34 ; =0x00001864
	ldr r0, [r4, r0]
	bl sub_02019D18
	pop {r4, pc}
	nop
_021F6F30: .word gSystem
_021F6F34: .word 0x00001864
	thumb_func_end ov18_021F6F08

	thumb_func_start ov18_021F6F38
ov18_021F6F38: ; 0x021F6F38
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021F6F70 ; =0x00001864
	add r4, r1, #0
	ldr r0, [r5, r0]
	bl sub_0201A018
	add r1, sp, #0
	add r1, #1
	add r2, sp, #0
	bl sub_02020A0C
	mov r0, #0x67
	add r2, sp, #0
	lsl r0, r0, #4
	ldrb r1, [r2, #1]
	ldrb r2, [r2]
	ldr r0, [r5, r0]
	bl sub_0200DDB8
	ldr r2, _021F6F74 ; =_021FB628
	add r0, r5, #0
	ldrb r2, [r2, r4]
	mov r1, #0
	bl ov18_021F118C
	pop {r3, r4, r5, pc}
	nop
_021F6F70: .word 0x00001864
_021F6F74: .word _021FB628
	thumb_func_end ov18_021F6F38

	thumb_func_start ov18_021F6F78
ov18_021F6F78: ; 0x021F6F78
	push {r3, lr}
	bl ov18_021F6F38
	ldr r0, _021F6F88 ; =0x000008E8
	bl PlaySE
	pop {r3, pc}
	nop
_021F6F88: .word 0x000008E8
	thumb_func_end ov18_021F6F78

	thumb_func_start ov18_021F6F8C
ov18_021F6F8C: ; 0x021F6F8C
	push {r4, lr}
	add r4, r0, #0
	bl ov18_021F6F38
	ldr r0, [r4]
	mov r1, #1
	ldr r0, [r0, #0xc]
	bl sub_02018410
	pop {r4, pc}
	thumb_func_end ov18_021F6F8C

	thumb_func_start ov18_021F6FA0
ov18_021F6FA0: ; 0x021F6FA0
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0x25
	str r0, [sp, #8]
	ldr r0, _021F6FD8 ; =_021FBA94
	ldr r1, _021F6FDC ; =_021FBC34
	ldr r2, _021F6FE0 ; =_021FB6A8
	add r3, r4, #0
	bl sub_02019BA4
	ldr r1, _021F6FE4 ; =0x00001864
	mov r2, #1
	str r0, [r4, r1]
	add r0, r4, #0
	mov r1, #0
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #0
	bl ov18_021F7018
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_021F6FD8: .word _021FBA94
_021F6FDC: .word _021FBC34
_021F6FE0: .word _021FB6A8
_021F6FE4: .word 0x00001864
	thumb_func_end ov18_021F6FA0

	thumb_func_start ov18_021F6FE8
ov18_021F6FE8: ; 0x021F6FE8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	mov r1, #0
	ldr r0, [r0, #0xc]
	bl sub_02018410
	ldr r0, _021F7010 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #8
	tst r0, r1
	beq _021F7004
	mov r0, #0x1b
	pop {r4, pc}
_021F7004:
	ldr r0, _021F7014 ; =0x00001864
	ldr r0, [r4, r0]
	bl sub_02019D18
	pop {r4, pc}
	nop
_021F7010: .word gSystem
_021F7014: .word 0x00001864
	thumb_func_end ov18_021F6FE8

	thumb_func_start ov18_021F7018
ov18_021F7018: ; 0x021F7018
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021F705C ; =0x00001864
	add r4, r1, #0
	ldr r0, [r5, r0]
	bl sub_0201A018
	add r1, sp, #0
	add r1, #1
	add r2, sp, #0
	bl sub_02020A0C
	mov r0, #0x67
	add r2, sp, #0
	lsl r0, r0, #4
	ldrb r1, [r2, #1]
	ldrb r2, [r2]
	ldr r0, [r5, r0]
	bl sub_0200DDB8
	cmp r4, #0x1b
	blt _021F7050
	add r0, r5, #0
	mov r1, #0
	mov r2, #0x23
	bl ov18_021F118C
	pop {r3, r4, r5, pc}
_021F7050:
	add r0, r5, #0
	mov r1, #0
	mov r2, #0x28
	bl ov18_021F118C
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021F705C: .word 0x00001864
	thumb_func_end ov18_021F7018

	thumb_func_start ov18_021F7060
ov18_021F7060: ; 0x021F7060
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r5, r0, #0
	add r0, r6, #0
	sub r0, #0x1b
	add r4, r1, #0
	cmp r0, #1
	bhi _021F70DA
	ldr r0, _021F70F0 ; =0x0000189C
	ldr r0, [r5, r0]
	lsl r1, r0, #3
	ldr r0, _021F70F4 ; =_021FBC34
	cmp r4, #0
	ldrb r0, [r0, r1]
	beq _021F7082
	cmp r4, #6
	bne _021F70AC
_021F7082:
	ldr r3, _021F70F4 ; =_021FBC34
	mov r1, #0
_021F7086:
	ldrb r2, [r3]
	cmp r0, r2
	bne _021F70A2
	ldr r0, _021F70F8 ; =0x00001864
	lsl r2, r6, #0x18
	add r4, r1, #0
	lsl r1, r1, #0x18
	lsr r2, r2, #0x18
	ldr r0, [r5, r0]
	lsr r1, r1, #0x18
	add r3, r2, #0
	bl sub_02019F88
	b _021F70DA
_021F70A2:
	add r1, r1, #1
	add r3, #8
	cmp r1, #0x1a
	ble _021F7086
	b _021F70DA
_021F70AC:
	cmp r4, #0x15
	beq _021F70B4
	cmp r4, #0x1a
	bne _021F70DA
_021F70B4:
	ldr r3, _021F70FC ; =_021FBD04
	mov r1, #0x1a
_021F70B8:
	ldrb r2, [r3]
	cmp r0, r2
	bne _021F70D4
	ldr r0, _021F70F8 ; =0x00001864
	lsl r2, r6, #0x18
	add r4, r1, #0
	lsl r1, r1, #0x18
	lsr r2, r2, #0x18
	ldr r0, [r5, r0]
	lsr r1, r1, #0x18
	add r3, r2, #0
	bl sub_02019F88
	b _021F70DA
_021F70D4:
	sub r3, #8
	sub r1, r1, #1
	bpl _021F70B8
_021F70DA:
	add r0, r5, #0
	add r1, r4, #0
	bl ov18_021F7018
	ldr r0, _021F70F0 ; =0x0000189C
	str r6, [r5, r0]
	ldr r0, _021F7100 ; =0x000008E8
	bl PlaySE
	pop {r4, r5, r6, pc}
	nop
_021F70F0: .word 0x0000189C
_021F70F4: .word _021FBC34
_021F70F8: .word 0x00001864
_021F70FC: .word _021FBD04
_021F7100: .word 0x000008E8
	thumb_func_end ov18_021F7060

	thumb_func_start ov18_021F7104
ov18_021F7104: ; 0x021F7104
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	bl ov18_021F7018
	ldr r0, [r5]
	mov r1, #1
	ldr r0, [r0, #0xc]
	bl sub_02018410
	ldr r0, _021F7120 ; =0x0000189C
	str r4, [r5, r0]
	pop {r3, r4, r5, pc}
	nop
_021F7120: .word 0x0000189C
	thumb_func_end ov18_021F7104

	thumb_func_start ov18_021F7124
ov18_021F7124: ; 0x021F7124
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0x25
	str r0, [sp, #8]
	ldr r0, _021F715C ; =_021FBA40
	ldr r1, _021F7160 ; =_021FBB94
	ldr r2, _021F7164 ; =_021FB638
	add r3, r4, #0
	bl sub_02019BA4
	ldr r1, _021F7168 ; =0x00001864
	mov r2, #1
	str r0, [r4, r1]
	add r0, r4, #0
	mov r1, #0
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #0
	bl ov18_021F719C
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_021F715C: .word _021FBA40
_021F7160: .word _021FBB94
_021F7164: .word _021FB638
_021F7168: .word 0x00001864
	thumb_func_end ov18_021F7124

	thumb_func_start ov18_021F716C
ov18_021F716C: ; 0x021F716C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	mov r1, #0
	ldr r0, [r0, #0xc]
	bl sub_02018410
	ldr r0, _021F7194 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #8
	tst r0, r1
	beq _021F7188
	mov r0, #0x12
	pop {r4, pc}
_021F7188:
	ldr r0, _021F7198 ; =0x00001864
	ldr r0, [r4, r0]
	bl sub_02019D18
	pop {r4, pc}
	nop
_021F7194: .word gSystem
_021F7198: .word 0x00001864
	thumb_func_end ov18_021F716C

	thumb_func_start ov18_021F719C
ov18_021F719C: ; 0x021F719C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021F71D4 ; =0x00001864
	add r4, r1, #0
	ldr r0, [r5, r0]
	bl sub_0201A018
	add r1, sp, #0
	add r1, #1
	add r2, sp, #0
	bl sub_02020A0C
	mov r0, #0x67
	add r2, sp, #0
	lsl r0, r0, #4
	ldrb r1, [r2, #1]
	ldrb r2, [r2]
	ldr r0, [r5, r0]
	bl sub_0200DDB8
	ldr r2, _021F71D8 ; =_021FBD3C
	add r0, r5, #0
	ldrb r2, [r2, r4]
	mov r1, #0
	bl ov18_021F118C
	pop {r3, r4, r5, pc}
	nop
_021F71D4: .word 0x00001864
_021F71D8: .word _021FBD3C
	thumb_func_end ov18_021F719C

	thumb_func_start ov18_021F71DC
ov18_021F71DC: ; 0x021F71DC
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r5, r0, #0
	add r4, r1, #0
	cmp r6, #0x12
	bne _021F727C
	cmp r4, #0
	bne _021F7236
	ldr r0, _021F7328 ; =0x0000189C
	ldr r1, [r5, r0]
	cmp r1, #0x10
	blt _021F7218
	cmp r1, #0x11
	bgt _021F7218
	lsr r3, r1, #0x1f
	lsl r2, r1, #0x1e
	sub r2, r2, r3
	mov r1, #0x1e
	ror r2, r1
	add r4, r3, r2
	sub r0, #0x38
	lsl r1, r4, #0x18
	lsl r2, r6, #0x18
	ldr r0, [r5, r0]
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	mov r3, #0x12
	bl sub_02019F88
	b _021F7312
_021F7218:
	cmp r1, #0
	blt _021F7312
	cmp r1, #1
	bgt _021F7312
	ldr r0, _021F732C ; =0x00001864
	add r4, r1, #0
	lsl r1, r1, #0x18
	lsl r2, r6, #0x18
	ldr r0, [r5, r0]
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	mov r3, #0x12
	bl sub_02019F88
	b _021F7312
_021F7236:
	cmp r4, #0x10
	bne _021F7312
	ldr r0, _021F7328 ; =0x0000189C
	ldr r1, [r5, r0]
	cmp r1, #0
	blt _021F725E
	cmp r1, #1
	bgt _021F725E
	add r4, r1, #0
	add r4, #0x10
	sub r0, #0x38
	lsl r1, r4, #0x18
	lsl r2, r6, #0x18
	ldr r0, [r5, r0]
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	mov r3, #0x12
	bl sub_02019F88
	b _021F7312
_021F725E:
	cmp r1, #0x10
	blt _021F7312
	cmp r1, #0x11
	bgt _021F7312
	ldr r0, _021F732C ; =0x00001864
	add r4, r1, #0
	lsl r1, r1, #0x18
	lsl r2, r6, #0x18
	ldr r0, [r5, r0]
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	mov r3, #0x12
	bl sub_02019F88
	b _021F7312
_021F727C:
	cmp r6, #0x13
	bne _021F7312
	cmp r4, #3
	bne _021F72CE
	ldr r0, _021F7328 ; =0x0000189C
	ldr r1, [r5, r0]
	cmp r1, #0xe
	blt _021F72B0
	cmp r1, #0xf
	bgt _021F72B0
	lsr r3, r1, #0x1f
	lsl r2, r1, #0x1e
	sub r2, r2, r3
	mov r1, #0x1e
	ror r2, r1
	add r4, r3, r2
	sub r0, #0x38
	lsl r1, r4, #0x18
	lsl r2, r6, #0x18
	ldr r0, [r5, r0]
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	mov r3, #0x13
	bl sub_02019F88
	b _021F7312
_021F72B0:
	cmp r1, #2
	blt _021F7312
	cmp r1, #3
	bgt _021F7312
	ldr r0, _021F732C ; =0x00001864
	add r4, r1, #0
	lsl r1, r1, #0x18
	lsl r2, r6, #0x18
	ldr r0, [r5, r0]
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	mov r3, #0x13
	bl sub_02019F88
	b _021F7312
_021F72CE:
	cmp r4, #0xf
	bne _021F7312
	ldr r0, _021F7328 ; =0x0000189C
	ldr r1, [r5, r0]
	cmp r1, #2
	blt _021F72F6
	cmp r1, #3
	bgt _021F72F6
	add r4, r1, #0
	add r4, #0xc
	sub r0, #0x38
	lsl r1, r4, #0x18
	lsl r2, r6, #0x18
	ldr r0, [r5, r0]
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	mov r3, #0x13
	bl sub_02019F88
	b _021F7312
_021F72F6:
	cmp r1, #0xe
	blt _021F7312
	cmp r1, #0xf
	bgt _021F7312
	ldr r0, _021F732C ; =0x00001864
	add r4, r1, #0
	lsl r1, r1, #0x18
	lsl r2, r6, #0x18
	ldr r0, [r5, r0]
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	mov r3, #0x13
	bl sub_02019F88
_021F7312:
	add r0, r5, #0
	add r1, r4, #0
	bl ov18_021F719C
	ldr r0, _021F7328 ; =0x0000189C
	str r6, [r5, r0]
	ldr r0, _021F7330 ; =0x000008E8
	bl PlaySE
	pop {r4, r5, r6, pc}
	nop
_021F7328: .word 0x0000189C
_021F732C: .word 0x00001864
_021F7330: .word 0x000008E8
	thumb_func_end ov18_021F71DC

	thumb_func_start ov18_021F7334
ov18_021F7334: ; 0x021F7334
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	bl ov18_021F719C
	ldr r0, [r5]
	mov r1, #1
	ldr r0, [r0, #0xc]
	bl sub_02018410
	ldr r0, _021F7350 ; =0x0000189C
	str r4, [r5, r0]
	pop {r3, r4, r5, pc}
	nop
_021F7350: .word 0x0000189C
	thumb_func_end ov18_021F7334

	thumb_func_start ov18_021F7354
ov18_021F7354: ; 0x021F7354
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0x25
	str r0, [sp, #8]
	ldr r0, _021F738C ; =_021FB6C8
	ldr r1, _021F7390 ; =_021FB780
	ldr r2, _021F7394 ; =_021FB648
	add r3, r4, #0
	bl sub_02019BA4
	ldr r1, _021F7398 ; =0x00001864
	mov r2, #1
	str r0, [r4, r1]
	add r0, r4, #0
	mov r1, #0
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #0
	bl ov18_021F7444
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_021F738C: .word _021FB6C8
_021F7390: .word _021FB780
_021F7394: .word _021FB648
_021F7398: .word 0x00001864
	thumb_func_end ov18_021F7354

	thumb_func_start ov18_021F739C
ov18_021F739C: ; 0x021F739C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _021F7438 ; =0x00001864
	ldr r0, [r5, r0]
	bl sub_02019F74
	add r4, r0, #0
	ldr r0, [r5]
	mov r1, #0
	ldr r0, [r0, #0xc]
	bl sub_02018410
	ldr r1, _021F743C ; =gSystem
	mov r0, #8
	ldr r2, [r1, #0x48]
	tst r0, r2
	beq _021F73C2
	mov r0, #2
	pop {r4, r5, r6, pc}
_021F73C2:
	cmp r4, #0
	bne _021F73DC
	ldr r1, [r1, #0x4c]
	mov r0, #0x20
	tst r0, r1
	beq _021F73D2
	mov r0, #5
	pop {r4, r5, r6, pc}
_021F73D2:
	mov r0, #0x10
	tst r0, r1
	beq _021F73DC
	mov r0, #4
	pop {r4, r5, r6, pc}
_021F73DC:
	cmp r4, #1
	bne _021F73F8
	ldr r0, _021F743C ; =gSystem
	ldr r1, [r0, #0x4c]
	mov r0, #0x20
	tst r0, r1
	beq _021F73EE
	mov r0, #7
	pop {r4, r5, r6, pc}
_021F73EE:
	mov r0, #0x10
	tst r0, r1
	beq _021F73F8
	mov r0, #6
	pop {r4, r5, r6, pc}
_021F73F8:
	ldr r0, _021F7440 ; =_021FB718
	bl sub_02025204
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	beq _021F742C
	ldr r0, [r5]
	mov r1, #1
	ldr r0, [r0, #0xc]
	bl sub_02018410
	ldr r0, _021F7438 ; =0x00001864
	lsr r4, r6, #1
	lsl r1, r4, #0x18
	ldr r0, [r5, r0]
	lsr r1, r1, #0x18
	bl sub_02019F7C
	add r0, r5, #0
	add r1, r4, #0
	bl ov18_021F7444
	add r0, r6, #4
	pop {r4, r5, r6, pc}
_021F742C:
	ldr r0, _021F7438 ; =0x00001864
	ldr r0, [r5, r0]
	bl sub_02019D18
	pop {r4, r5, r6, pc}
	nop
_021F7438: .word 0x00001864
_021F743C: .word gSystem
_021F7440: .word _021FB718
	thumb_func_end ov18_021F739C

	thumb_func_start ov18_021F7444
ov18_021F7444: ; 0x021F7444
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021F74A0 ; =0x00001864
	add r4, r1, #0
	ldr r0, [r5, r0]
	bl sub_0201A018
	add r1, sp, #0
	add r1, #1
	add r2, sp, #0
	bl sub_02020A0C
	cmp r4, #0
	bne _021F7470
	ldr r1, _021F74A4 ; =0x0000187C
	add r0, r5, #0
	ldr r1, [r5, r1]
	bl ov18_021F3AD0
	add r1, sp, #0
	strb r0, [r1, #1]
	b _021F7482
_021F7470:
	cmp r4, #1
	bne _021F7482
	ldr r1, _021F74A8 ; =0x00001878
	add r0, r5, #0
	ldr r1, [r5, r1]
	bl ov18_021F3AD0
	add r1, sp, #0
	strb r0, [r1, #1]
_021F7482:
	mov r0, #0x67
	add r2, sp, #0
	lsl r0, r0, #4
	ldrb r1, [r2, #1]
	ldrb r2, [r2]
	ldr r0, [r5, r0]
	bl sub_0200DDB8
	ldr r2, _021F74AC ; =_021FB618
	add r0, r5, #0
	ldrb r2, [r2, r4]
	mov r1, #0
	bl ov18_021F118C
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021F74A0: .word 0x00001864
_021F74A4: .word 0x0000187C
_021F74A8: .word 0x00001878
_021F74AC: .word _021FB618
	thumb_func_end ov18_021F7444

	thumb_func_start ov18_021F74B0
ov18_021F74B0: ; 0x021F74B0
	push {r3, lr}
	bl ov18_021F7444
	ldr r0, _021F74C0 ; =0x000008E8
	bl PlaySE
	pop {r3, pc}
	nop
_021F74C0: .word 0x000008E8
	thumb_func_end ov18_021F74B0

	thumb_func_start ov18_021F74C4
ov18_021F74C4: ; 0x021F74C4
	push {r4, lr}
	add r4, r0, #0
	bl ov18_021F7444
	ldr r0, [r4]
	mov r1, #1
	ldr r0, [r0, #0xc]
	bl sub_02018410
	pop {r4, pc}
	thumb_func_end ov18_021F74C4

	thumb_func_start ov18_021F74D8
ov18_021F74D8: ; 0x021F74D8
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0x25
	str r0, [sp, #8]
	ldr r0, _021F7510 ; =_021FB6DC
	ldr r1, _021F7514 ; =_021FB7A0
	ldr r2, _021F7518 ; =_021FB678
	add r3, r4, #0
	bl sub_02019BA4
	ldr r1, _021F751C ; =0x00001864
	mov r2, #1
	str r0, [r4, r1]
	add r0, r4, #0
	mov r1, #0
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #0
	bl ov18_021F75C8
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_021F7510: .word _021FB6DC
_021F7514: .word _021FB7A0
_021F7518: .word _021FB678
_021F751C: .word 0x00001864
	thumb_func_end ov18_021F74D8

	thumb_func_start ov18_021F7520
ov18_021F7520: ; 0x021F7520
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _021F75BC ; =0x00001864
	ldr r0, [r5, r0]
	bl sub_02019F74
	add r4, r0, #0
	ldr r0, [r5]
	mov r1, #0
	ldr r0, [r0, #0xc]
	bl sub_02018410
	ldr r1, _021F75C0 ; =gSystem
	mov r0, #8
	ldr r2, [r1, #0x48]
	tst r0, r2
	beq _021F7546
	mov r0, #2
	pop {r4, r5, r6, pc}
_021F7546:
	cmp r4, #0
	bne _021F7560
	ldr r1, [r1, #0x4c]
	mov r0, #0x20
	tst r0, r1
	beq _021F7556
	mov r0, #5
	pop {r4, r5, r6, pc}
_021F7556:
	mov r0, #0x10
	tst r0, r1
	beq _021F7560
	mov r0, #4
	pop {r4, r5, r6, pc}
_021F7560:
	cmp r4, #1
	bne _021F757C
	ldr r0, _021F75C0 ; =gSystem
	ldr r1, [r0, #0x4c]
	mov r0, #0x20
	tst r0, r1
	beq _021F7572
	mov r0, #7
	pop {r4, r5, r6, pc}
_021F7572:
	mov r0, #0x10
	tst r0, r1
	beq _021F757C
	mov r0, #6
	pop {r4, r5, r6, pc}
_021F757C:
	ldr r0, _021F75C4 ; =_021FB718
	bl sub_02025204
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	beq _021F75B0
	ldr r0, [r5]
	mov r1, #1
	ldr r0, [r0, #0xc]
	bl sub_02018410
	ldr r0, _021F75BC ; =0x00001864
	lsr r4, r6, #1
	lsl r1, r4, #0x18
	ldr r0, [r5, r0]
	lsr r1, r1, #0x18
	bl sub_02019F7C
	add r0, r5, #0
	add r1, r4, #0
	bl ov18_021F75C8
	add r0, r6, #4
	pop {r4, r5, r6, pc}
_021F75B0:
	ldr r0, _021F75BC ; =0x00001864
	ldr r0, [r5, r0]
	bl sub_02019D18
	pop {r4, r5, r6, pc}
	nop
_021F75BC: .word 0x00001864
_021F75C0: .word gSystem
_021F75C4: .word _021FB718
	thumb_func_end ov18_021F7520

	thumb_func_start ov18_021F75C8
ov18_021F75C8: ; 0x021F75C8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021F7628 ; =0x00001864
	add r4, r1, #0
	ldr r0, [r5, r0]
	bl sub_0201A018
	add r1, sp, #0
	add r1, #1
	add r2, sp, #0
	bl sub_02020A0C
	cmp r4, #0
	bne _021F75F4
	ldr r1, _021F762C ; =0x00001884
	add r0, r5, #0
	ldr r1, [r5, r1]
	bl ov18_021F3AD0
	add r1, sp, #0
	strb r0, [r1, #1]
	b _021F7608
_021F75F4:
	cmp r4, #1
	bne _021F7608
	mov r1, #0x62
	lsl r1, r1, #6
	ldr r1, [r5, r1]
	add r0, r5, #0
	bl ov18_021F3AD0
	add r1, sp, #0
	strb r0, [r1, #1]
_021F7608:
	mov r0, #0x67
	add r2, sp, #0
	lsl r0, r0, #4
	ldrb r1, [r2, #1]
	ldrb r2, [r2]
	ldr r0, [r5, r0]
	bl sub_0200DDB8
	ldr r2, _021F7630 ; =_021FB61C
	add r0, r5, #0
	ldrb r2, [r2, r4]
	mov r1, #0
	bl ov18_021F118C
	pop {r3, r4, r5, pc}
	nop
_021F7628: .word 0x00001864
_021F762C: .word 0x00001884
_021F7630: .word _021FB61C
	thumb_func_end ov18_021F75C8

	thumb_func_start ov18_021F7634
ov18_021F7634: ; 0x021F7634
	push {r3, lr}
	bl ov18_021F75C8
	ldr r0, _021F7644 ; =0x000008E8
	bl PlaySE
	pop {r3, pc}
	nop
_021F7644: .word 0x000008E8
	thumb_func_end ov18_021F7634

	thumb_func_start ov18_021F7648
ov18_021F7648: ; 0x021F7648
	push {r4, lr}
	add r4, r0, #0
	bl ov18_021F75C8
	ldr r0, [r4]
	mov r1, #1
	ldr r0, [r0, #0xc]
	bl sub_02018410
	pop {r4, pc}
	thumb_func_end ov18_021F7648

	thumb_func_start ov18_021F765C
ov18_021F765C: ; 0x021F765C
	push {r3, lr}
	add r1, sp, #0
	bl sub_02025364
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov18_021F765C

	thumb_func_start ov18_021F7668
ov18_021F7668: ; 0x021F7668
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0x25
	str r0, [sp, #8]
	ldr r0, _021F76A0 ; =_021FB744
	ldr r1, _021F76A4 ; =_021FB8D4
	ldr r2, _021F76A8 ; =_021FB6B8
	add r3, r4, #0
	bl sub_02019BA4
	ldr r1, _021F76AC ; =0x00001864
	mov r2, #1
	str r0, [r4, r1]
	add r0, r4, #0
	mov r1, #0
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #0
	bl ov18_021F76E0
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_021F76A0: .word _021FB744
_021F76A4: .word _021FB8D4
_021F76A8: .word _021FB6B8
_021F76AC: .word 0x00001864
	thumb_func_end ov18_021F7668

	thumb_func_start ov18_021F76B0
ov18_021F76B0: ; 0x021F76B0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	mov r1, #0
	ldr r0, [r0, #0xc]
	bl sub_02018410
	ldr r0, _021F76D8 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #8
	tst r0, r1
	beq _021F76CC
	mov r0, #4
	pop {r4, pc}
_021F76CC:
	ldr r0, _021F76DC ; =0x00001864
	ldr r0, [r4, r0]
	bl sub_02019D18
	pop {r4, pc}
	nop
_021F76D8: .word gSystem
_021F76DC: .word 0x00001864
	thumb_func_end ov18_021F76B0

	thumb_func_start ov18_021F76E0
ov18_021F76E0: ; 0x021F76E0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021F7718 ; =0x00001864
	add r4, r1, #0
	ldr r0, [r5, r0]
	bl sub_0201A018
	add r1, sp, #0
	add r1, #1
	add r2, sp, #0
	bl sub_02020A0C
	mov r0, #0x67
	add r2, sp, #0
	lsl r0, r0, #4
	ldrb r1, [r2, #1]
	ldrb r2, [r2]
	ldr r0, [r5, r0]
	bl sub_0200DDB8
	ldr r2, _021F771C ; =_021FB620
	add r0, r5, #0
	ldrb r2, [r2, r4]
	mov r1, #0
	bl ov18_021F118C
	pop {r3, r4, r5, pc}
	nop
_021F7718: .word 0x00001864
_021F771C: .word _021FB620
	thumb_func_end ov18_021F76E0

	thumb_func_start ov18_021F7720
ov18_021F7720: ; 0x021F7720
	push {r3, lr}
	bl ov18_021F76E0
	ldr r0, _021F7730 ; =0x000008E8
	bl PlaySE
	pop {r3, pc}
	nop
_021F7730: .word 0x000008E8
	thumb_func_end ov18_021F7720

	thumb_func_start ov18_021F7734
ov18_021F7734: ; 0x021F7734
	push {r4, lr}
	add r4, r0, #0
	bl ov18_021F76E0
	ldr r0, [r4]
	mov r1, #1
	ldr r0, [r0, #0xc]
	bl sub_02018410
	pop {r4, pc}
	thumb_func_end ov18_021F7734

	thumb_func_start ov18_021F7748
ov18_021F7748: ; 0x021F7748
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0x25
	str r0, [sp, #8]
	ldr r0, _021F7780 ; =_021FB9A8
	ldr r1, _021F7784 ; =_021FBB0C
	ldr r2, _021F7788 ; =_021FB658
	add r3, r4, #0
	bl sub_02019BA4
	ldr r1, _021F778C ; =0x00001864
	mov r2, #1
	str r0, [r4, r1]
	add r0, r4, #0
	mov r1, #0
	bl ov18_021F11C0
	add r0, r4, #0
	mov r1, #0
	bl ov18_021F77C0
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_021F7780: .word _021FB9A8
_021F7784: .word _021FBB0C
_021F7788: .word _021FB658
_021F778C: .word 0x00001864
	thumb_func_end ov18_021F7748

	thumb_func_start ov18_021F7790
ov18_021F7790: ; 0x021F7790
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	mov r1, #0
	ldr r0, [r0, #0xc]
	bl sub_02018410
	ldr r0, _021F77B8 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #8
	tst r0, r1
	beq _021F77AC
	mov r0, #0xf
	pop {r4, pc}
_021F77AC:
	ldr r0, _021F77BC ; =0x00001864
	ldr r0, [r4, r0]
	bl sub_02019D18
	pop {r4, pc}
	nop
_021F77B8: .word gSystem
_021F77BC: .word 0x00001864
	thumb_func_end ov18_021F7790

	thumb_func_start ov18_021F77C0
ov18_021F77C0: ; 0x021F77C0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021F77F8 ; =0x00001864
	add r4, r1, #0
	ldr r0, [r5, r0]
	bl sub_0201A018
	add r1, sp, #0
	add r1, #1
	add r2, sp, #0
	bl sub_02020A0C
	mov r0, #0x67
	add r2, sp, #0
	lsl r0, r0, #4
	ldrb r1, [r2, #1]
	ldrb r2, [r2]
	ldr r0, [r5, r0]
	bl sub_0200DDB8
	ldr r2, _021F77FC ; =_021FBD28
	add r0, r5, #0
	ldrb r2, [r2, r4]
	mov r1, #0
	bl ov18_021F118C
	pop {r3, r4, r5, pc}
	nop
_021F77F8: .word 0x00001864
_021F77FC: .word _021FBD28
	thumb_func_end ov18_021F77C0

	thumb_func_start ov18_021F7800
ov18_021F7800: ; 0x021F7800
	push {r4, r5, r6, lr}
	add r4, r2, #0
	add r5, r0, #0
	add r6, r1, #0
	cmp r4, #0xf
	bne _021F789E
	cmp r6, #0
	bne _021F7858
	ldr r0, _021F7948 ; =0x0000189C
	ldr r1, [r5, r0]
	cmp r1, #0
	blt _021F7832
	cmp r1, #2
	bgt _021F7832
	sub r0, #0x38
	add r6, r1, #0
	lsl r1, r1, #0x18
	lsl r2, r4, #0x18
	ldr r0, [r5, r0]
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	mov r3, #0xf
	bl sub_02019F88
	b _021F7932
_021F7832:
	cmp r1, #0xa
	blt _021F7932
	cmp r1, #0xc
	bgt _021F7932
	add r0, r1, #0
	mov r1, #5
	bl _s32_div_f
	ldr r0, _021F794C ; =0x00001864
	add r6, r1, #0
	lsl r1, r6, #0x18
	lsl r2, r4, #0x18
	ldr r0, [r5, r0]
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	mov r3, #0xf
	bl sub_02019F88
	b _021F7932
_021F7858:
	cmp r6, #0xa
	bne _021F7932
	ldr r0, _021F7948 ; =0x0000189C
	ldr r1, [r5, r0]
	cmp r1, #0
	blt _021F7880
	cmp r1, #2
	bgt _021F7880
	add r6, r1, #0
	add r6, #0xa
	sub r0, #0x38
	lsl r1, r6, #0x18
	lsl r2, r4, #0x18
	ldr r0, [r5, r0]
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	mov r3, #0xf
	bl sub_02019F88
	b _021F7932
_021F7880:
	cmp r1, #0xa
	blt _021F7932
	cmp r1, #0xc
	bgt _021F7932
	ldr r0, _021F794C ; =0x00001864
	add r6, r1, #0
	lsl r1, r1, #0x18
	lsl r2, r4, #0x18
	ldr r0, [r5, r0]
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	mov r3, #0xf
	bl sub_02019F88
	b _021F7932
_021F789E:
	cmp r4, #0x10
	bne _021F7932
	cmp r6, #4
	bne _021F78EE
	ldr r0, _021F7948 ; =0x0000189C
	ldr r1, [r5, r0]
	cmp r1, #3
	blt _021F78C8
	cmp r1, #4
	bgt _021F78C8
	sub r0, #0x38
	add r6, r1, #0
	lsl r1, r1, #0x18
	lsl r2, r4, #0x18
	ldr r0, [r5, r0]
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	mov r3, #0x10
	bl sub_02019F88
	b _021F7932
_021F78C8:
	cmp r1, #0xd
	blt _021F7932
	cmp r1, #0xe
	bgt _021F7932
	add r0, r1, #0
	mov r1, #5
	bl _s32_div_f
	ldr r0, _021F794C ; =0x00001864
	add r6, r1, #0
	lsl r1, r6, #0x18
	lsl r2, r4, #0x18
	ldr r0, [r5, r0]
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	mov r3, #0x10
	bl sub_02019F88
	b _021F7932
_021F78EE:
	cmp r6, #0xe
	bne _021F7932
	ldr r0, _021F7948 ; =0x0000189C
	ldr r1, [r5, r0]
	cmp r1, #3
	blt _021F7916
	cmp r1, #4
	bgt _021F7916
	add r6, r1, #0
	add r6, #0xa
	sub r0, #0x38
	lsl r1, r6, #0x18
	lsl r2, r4, #0x18
	ldr r0, [r5, r0]
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	mov r3, #0x10
	bl sub_02019F88
	b _021F7932
_021F7916:
	cmp r1, #0xd
	blt _021F7932
	cmp r1, #0xe
	bgt _021F7932
	ldr r0, _021F794C ; =0x00001864
	add r6, r1, #0
	lsl r1, r1, #0x18
	lsl r2, r4, #0x18
	ldr r0, [r5, r0]
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	mov r3, #0x10
	bl sub_02019F88
_021F7932:
	add r0, r5, #0
	add r1, r6, #0
	bl ov18_021F77C0
	ldr r0, _021F7948 ; =0x0000189C
	str r4, [r5, r0]
	ldr r0, _021F7950 ; =0x000008E8
	bl PlaySE
	pop {r4, r5, r6, pc}
	nop
_021F7948: .word 0x0000189C
_021F794C: .word 0x00001864
_021F7950: .word 0x000008E8
	thumb_func_end ov18_021F7800

	thumb_func_start ov18_021F7954
ov18_021F7954: ; 0x021F7954
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	bl ov18_021F77C0
	ldr r0, [r5]
	mov r1, #1
	ldr r0, [r0, #0xc]
	bl sub_02018410
	ldr r0, _021F7970 ; =0x0000189C
	str r4, [r5, r0]
	pop {r3, r4, r5, pc}
	nop
_021F7970: .word 0x0000189C
	thumb_func_end ov18_021F7954

	thumb_func_start ov18_021F7974
ov18_021F7974: ; 0x021F7974
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	add r0, sp, #4
	add r1, sp, #0
	bl sub_02025380
	cmp r0, #1
	bne _021F7A1A
	ldr r0, _021F7B58 ; =_021FB8A4
	bl sub_02025224
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _021F799C
	add sp, #8
	add r0, r1, #0
	pop {r4, r5, r6, pc}
_021F799C:
	lsl r1, r0, #2
	ldr r0, _021F7B5C ; =_021FB84C
	ldr r4, [r0, r1]
	cmp r4, #0
	bne _021F79FC
	ldr r1, [sp]
	ldr r0, [sp, #4]
	sub r1, r1, #4
	sub r0, #0x1b
	str r1, [sp]
	mov r1, #0x28
	str r0, [sp, #4]
	bl _u32_div_f
	add r6, r0, #0
	ldr r0, [sp]
	mov r1, #0x28
	bl _u32_div_f
	lsl r1, r0, #2
	add r0, r0, r1
	add r0, r6, r0
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	ldr r0, _021F7B60 ; =0x0000185A
	ldrb r1, [r5, r0]
	cmp r2, r1
	bne _021F79F2
	cmp r1, #0
	bne _021F79EC
	sub r0, r0, #1
	ldrb r0, [r5, r0]
	cmp r0, #0
	bne _021F79EC
	ldr r0, _021F7B64 ; =0x000008E9
	bl PlaySE
	add sp, #8
	mov r0, #2
	pop {r4, r5, r6, pc}
_021F79EC:
	add sp, #8
	mov r0, #4
	pop {r4, r5, r6, pc}
_021F79F2:
	strb r2, [r5, r0]
	ldr r0, _021F7B64 ; =0x000008E9
	bl PlaySE
	b _021F7A14
_021F79FC:
	cmp r4, #2
	bne _021F7A08
	ldr r0, _021F7B64 ; =0x000008E9
	bl PlaySE
	b _021F7A14
_021F7A08:
	cmp r4, #5
	bne _021F7A14
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
_021F7A14:
	add sp, #8
	add r0, r4, #0
	pop {r4, r5, r6, pc}
_021F7A1A:
	ldr r1, _021F7B68 ; =gSystem
	mov r0, #0x40
	ldr r2, [r1, #0x4c]
	tst r0, r2
	beq _021F7A42
	ldr r0, _021F7B60 ; =0x0000185A
	ldrb r1, [r5, r0]
	cmp r1, #5
	bhs _021F7A32
	add sp, #8
	mov r0, #0xa
	pop {r4, r5, r6, pc}
_021F7A32:
	sub r1, r1, #5
	strb r1, [r5, r0]
	ldr r0, _021F7B6C ; =0x000008E8
	bl PlaySE
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F7A42:
	mov r0, #0x80
	tst r0, r2
	beq _021F7A6E
	ldr r0, _021F7B60 ; =0x0000185A
	ldrb r0, [r5, r0]
	cmp r0, #0xa
	blo _021F7A5A
	cmp r0, #0xf
	bhs _021F7A5A
	add sp, #8
	mov r0, #0xc
	pop {r4, r5, r6, pc}
_021F7A5A:
	ldr r0, _021F7B60 ; =0x0000185A
	ldrb r1, [r5, r0]
	add r1, r1, #5
	strb r1, [r5, r0]
	ldr r0, _021F7B6C ; =0x000008E8
	bl PlaySE
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F7A6E:
	mov r0, #0x20
	add r3, r2, #0
	tst r3, r0
	beq _021F7AA6
	ldr r2, _021F7B60 ; =0x0000185A
	ldrb r1, [r5, r2]
	cmp r1, #0
	beq _021F7A8E
	sub r0, r1, #1
	strb r0, [r5, r2]
	ldr r0, _021F7B6C ; =0x000008E8
	bl PlaySE
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F7A8E:
	sub r1, r2, #1
	ldrb r1, [r5, r1]
	cmp r1, #0
	beq _021F7AA0
	mov r0, #0xe
	strb r0, [r5, r2]
	add sp, #8
	mov r0, #9
	pop {r4, r5, r6, pc}
_021F7AA0:
	add sp, #8
	sub r0, #0x21
	pop {r4, r5, r6, pc}
_021F7AA6:
	mov r0, #0x10
	tst r0, r2
	beq _021F7AEA
	ldr r0, _021F7B60 ; =0x0000185A
	ldrb r1, [r5, r0]
	add r1, r1, #1
	cmp r1, #0xf
	beq _021F7AC4
	strb r1, [r5, r0]
	ldr r0, _021F7B6C ; =0x000008E8
	bl PlaySE
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F7AC4:
	add r0, r5, #0
	add r1, r4, #0
	bl ov18_021F8950
	ldr r1, _021F7B70 ; =0x00001859
	ldrb r2, [r5, r1]
	add r2, r2, #1
	cmp r2, r0
	bhi _021F7AE2
	mov r2, #0
	add r0, r1, #1
	strb r2, [r5, r0]
	add sp, #8
	mov r0, #0xb
	pop {r4, r5, r6, pc}
_021F7AE2:
	mov r0, #0
	add sp, #8
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021F7AEA:
	ldr r0, [r1, #0x48]
	mov r1, #1
	tst r1, r0
	beq _021F7AF8
	add sp, #8
	mov r0, #4
	pop {r4, r5, r6, pc}
_021F7AF8:
	mov r3, #2
	add r1, r0, #0
	tst r1, r3
	beq _021F7B0E
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add sp, #8
	mov r0, #6
	pop {r4, r5, r6, pc}
_021F7B0E:
	lsl r1, r3, #9
	tst r1, r0
	beq _021F7B1A
	add sp, #8
	mov r0, #3
	pop {r4, r5, r6, pc}
_021F7B1A:
	lsl r1, r3, #0xa
	tst r1, r0
	beq _021F7B2C
	ldr r0, _021F7B64 ; =0x000008E9
	bl PlaySE
	add sp, #8
	mov r0, #2
	pop {r4, r5, r6, pc}
_021F7B2C:
	lsl r1, r3, #8
	tst r1, r2
	beq _021F7B38
	add sp, #8
	mov r0, #9
	pop {r4, r5, r6, pc}
_021F7B38:
	add r3, #0xfe
	add r1, r2, #0
	tst r1, r3
	beq _021F7B46
	add sp, #8
	mov r0, #0xb
	pop {r4, r5, r6, pc}
_021F7B46:
	mov r1, #4
	tst r0, r1
	beq _021F7B52
	add sp, #8
	mov r0, #8
	pop {r4, r5, r6, pc}
_021F7B52:
	sub r0, r1, #5
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021F7B58: .word _021FB8A4
_021F7B5C: .word _021FB84C
_021F7B60: .word 0x0000185A
_021F7B64: .word 0x000008E9
_021F7B68: .word gSystem
_021F7B6C: .word 0x000008E8
_021F7B70: .word 0x00001859
	thumb_func_end ov18_021F7974

	thumb_func_start ov18_021F7B74
ov18_021F7B74: ; 0x021F7B74
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021F7B8C ; =0x00001864
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021F7B8A
	bl sub_02019BDC
	ldr r0, _021F7B8C ; =0x00001864
	mov r1, #0
	str r1, [r4, r0]
_021F7B8A:
	pop {r4, pc}
	.balign 4, 0
_021F7B8C: .word 0x00001864
	thumb_func_end ov18_021F7B74

	thumb_func_start ov18_021F7B90
ov18_021F7B90: ; 0x021F7B90
	bx lr
	.balign 4, 0
	thumb_func_end ov18_021F7B90

	thumb_func_start ov18_021F7B94
ov18_021F7B94: ; 0x021F7B94
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	bl System_GetTouchNew
	cmp r0, #1
	bne _021F7BE8
	ldr r0, _021F7C04 ; =_021FB704
	bl sub_02025224
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	beq _021F7BFE
	add r0, sp, #4
	add r1, sp, #0
	bl sub_02025380
	ldr r0, _021F7C08 ; =_021FB698
	lsl r1, r6, #2
	ldr r6, [r0, r1]
	cmp r6, #1
	bne _021F7BDE
	ldr r1, _021F7C0C ; =0x000018A2
	ldr r0, [r5]
	ldrh r1, [r5, r1]
	ldr r0, [r0]
	bl Pokedex_CheckMonCaughtFlag
	cmp r0, #0
	bne _021F7BDE
	mov r0, #0
	add sp, #8
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021F7BDE:
	mov r0, #1
	str r0, [r4]
	add sp, #8
	add r0, r6, #0
	pop {r4, r5, r6, pc}
_021F7BE8:
	ldr r0, _021F7C10 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #2
	tst r1, r0
	beq _021F7BFC
	mov r0, #0
	str r0, [r4]
	add sp, #8
	mov r0, #3
	pop {r4, r5, r6, pc}
_021F7BFC:
	sub r0, r0, #3
_021F7BFE:
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_021F7C04: .word _021FB704
_021F7C08: .word _021FB698
_021F7C0C: .word 0x000018A2
_021F7C10: .word gSystem
	thumb_func_end ov18_021F7B94

	thumb_func_start ov18_021F7C14
ov18_021F7C14: ; 0x021F7C14
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	bl ov18_021F7B94
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _021F7CE6
	bl System_GetTouchNew
	cmp r0, #1
	bne _021F7C4C
	ldr r0, _021F7CE8 ; =_021FB934
	bl sub_0202529C
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _021F7C40
	add r0, r1, #0
	pop {r3, r4, r5, pc}
_021F7C40:
	mov r1, #1
	str r1, [r5]
	lsl r1, r0, #2
	ldr r0, _021F7CEC ; =_021FB904
	ldr r0, [r0, r1]
	pop {r3, r4, r5, pc}
_021F7C4C:
	mov r0, #0
	str r0, [r5]
	ldr r2, _021F7CF0 ; =gSystem
	mov r0, #0x40
	ldr r1, [r2, #0x4c]
	tst r0, r1
	beq _021F7C5E
	mov r0, #5
	pop {r3, r4, r5, pc}
_021F7C5E:
	mov r0, #0x80
	tst r0, r1
	beq _021F7C68
	mov r0, #7
	pop {r3, r4, r5, pc}
_021F7C68:
	ldr r0, [r2, #0x48]
	mov r2, #1
	tst r2, r0
	beq _021F7C88
	ldr r0, _021F7CF4 ; =0x000018C9
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _021F7C7C
	mov r0, #0xe
	pop {r3, r4, r5, pc}
_021F7C7C:
	cmp r0, #1
	bne _021F7C84
	mov r0, #0xf
	pop {r3, r4, r5, pc}
_021F7C84:
	mov r0, #0xd
	pop {r3, r4, r5, pc}
_021F7C88:
	mov r3, #4
	add r2, r0, #0
	tst r2, r3
	beq _021F7CA0
	ldr r0, _021F7CF8 ; =0x000018C8
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _021F7C9C
	mov r0, #0xc
	pop {r3, r4, r5, pc}
_021F7C9C:
	mov r0, #0xb
	pop {r3, r4, r5, pc}
_021F7CA0:
	ldr r2, _021F7CF8 ; =0x000018C8
	ldrsb r2, [r4, r2]
	cmp r2, #0
	bne _021F7CB2
	add r3, #0xfc
	tst r0, r3
	beq _021F7CBC
	mov r0, #0xc
	pop {r3, r4, r5, pc}
_021F7CB2:
	lsl r2, r3, #7
	tst r0, r2
	beq _021F7CBC
	mov r0, #0xb
	pop {r3, r4, r5, pc}
_021F7CBC:
	mov r0, #0x20
	tst r0, r1
	beq _021F7CC6
	mov r0, #0x10
	pop {r3, r4, r5, pc}
_021F7CC6:
	mov r0, #0x10
	tst r1, r0
	beq _021F7CE4
	ldr r1, _021F7CFC ; =0x000018A2
	ldr r0, [r4]
	ldrh r1, [r4, r1]
	ldr r0, [r0]
	bl Pokedex_CheckMonCaughtFlag
	cmp r0, #0
	beq _021F7CE0
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F7CE0:
	mov r0, #2
	pop {r3, r4, r5, pc}
_021F7CE4:
	sub r0, #0x11
_021F7CE6:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021F7CE8: .word _021FB934
_021F7CEC: .word _021FB904
_021F7CF0: .word gSystem
_021F7CF4: .word 0x000018C9
_021F7CF8: .word 0x000018C8
_021F7CFC: .word 0x000018A2
	thumb_func_end ov18_021F7C14

	thumb_func_start ov18_021F7D00
ov18_021F7D00: ; 0x021F7D00
	push {r4, lr}
	add r4, r1, #0
	bl ov18_021F7B94
	mov r3, #0
	mvn r3, r3
	cmp r0, r3
	bne _021F7D28
	mov r0, #0
	ldr r1, _021F7D2C ; =gSystem
	str r0, [r4]
	ldr r2, [r1, #0x4c]
	mov r1, #0x20
	tst r1, r2
	bne _021F7D28
	mov r0, #0x10
	tst r0, r2
	beq _021F7D26
	mov r3, #2
_021F7D26:
	add r0, r3, #0
_021F7D28:
	pop {r4, pc}
	nop
_021F7D2C: .word gSystem
	thumb_func_end ov18_021F7D00

	thumb_func_start ov18_021F7D30
ov18_021F7D30: ; 0x021F7D30
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	bl ov18_021F7B94
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _021F7DBA
	bl System_GetTouchNew
	cmp r0, #1
	bne _021F7D68
	ldr r0, _021F7DBC ; =_021FB804
	bl sub_02025224
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _021F7D5C
	add r0, r1, #0
	pop {r3, r4, r5, pc}
_021F7D5C:
	mov r1, #1
	str r1, [r5]
	lsl r1, r0, #2
	ldr r0, _021F7DC0 ; =_021FB760
	ldr r0, [r0, r1]
	pop {r3, r4, r5, pc}
_021F7D68:
	ldr r2, _021F7DC4 ; =gSystem
	mov r0, #0
	str r0, [r5]
	ldr r0, [r2, #0x4c]
	mov r1, #0x40
	tst r1, r0
	beq _021F7D7A
	mov r0, #5
	pop {r3, r4, r5, pc}
_021F7D7A:
	mov r1, #0x80
	tst r1, r0
	beq _021F7D84
	mov r0, #7
	pop {r3, r4, r5, pc}
_021F7D84:
	mov r1, #0x20
	tst r1, r0
	beq _021F7DA2
	ldr r1, _021F7DC8 ; =0x000018A2
	ldr r0, [r4]
	ldrh r1, [r4, r1]
	ldr r0, [r0]
	bl Pokedex_CheckMonCaughtFlag
	cmp r0, #0
	beq _021F7D9E
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F7D9E:
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F7DA2:
	mov r1, #0x10
	tst r0, r1
	beq _021F7DAC
	mov r0, #0xc
	pop {r3, r4, r5, pc}
_021F7DAC:
	ldr r1, [r2, #0x48]
	mov r0, #1
	tst r1, r0
	beq _021F7DB8
	mov r0, #0xb
	pop {r3, r4, r5, pc}
_021F7DB8:
	sub r0, r0, #2
_021F7DBA:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021F7DBC: .word _021FB804
_021F7DC0: .word _021FB760
_021F7DC4: .word gSystem
_021F7DC8: .word 0x000018A2
	thumb_func_end ov18_021F7D30

	thumb_func_start ov18_021F7DCC
ov18_021F7DCC: ; 0x021F7DCC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl System_GetTouchNew
	cmp r0, #1
	bne _021F7DF8
	ldr r0, _021F7E60 ; =_021FB7E0
	bl sub_02025224
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _021F7DEC
	add r0, r1, #0
	pop {r3, r4, r5, pc}
_021F7DEC:
	mov r1, #1
	str r1, [r4]
	lsl r1, r0, #2
	ldr r0, _021F7E64 ; =_021FB7C0
	ldr r0, [r0, r1]
	pop {r3, r4, r5, pc}
_021F7DF8:
	mov r0, #0
	ldr r2, _021F7E68 ; =gSystem
	str r0, [r4]
	ldr r3, [r2, #0x4c]
	mov r1, #0x40
	tst r1, r3
	beq _021F7E14
	ldr r1, _021F7E6C ; =0x000018C7
	ldrb r1, [r5, r1]
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x1b
	beq _021F7E5C
	mov r0, #2
	pop {r3, r4, r5, pc}
_021F7E14:
	mov r0, #0x80
	tst r0, r3
	beq _021F7E2C
	ldr r0, _021F7E6C ; =0x000018C7
	ldrb r0, [r5, r0]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1b
	bne _021F7E28
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F7E28:
	mov r0, #3
	pop {r3, r4, r5, pc}
_021F7E2C:
	ldr r2, [r2, #0x48]
	mov r0, #0x20
	tst r0, r2
	beq _021F7E38
	mov r0, #6
	pop {r3, r4, r5, pc}
_021F7E38:
	mov r0, #0x10
	add r1, r2, #0
	tst r1, r0
	beq _021F7E44
	mov r0, #7
	pop {r3, r4, r5, pc}
_021F7E44:
	lsl r0, r0, #6
	tst r0, r2
	beq _021F7E4E
	mov r0, #4
	pop {r3, r4, r5, pc}
_021F7E4E:
	mov r0, #3
	add r1, r2, #0
	tst r1, r0
	beq _021F7E5A
	mov r0, #5
	pop {r3, r4, r5, pc}
_021F7E5A:
	sub r0, r0, #4
_021F7E5C:
	pop {r3, r4, r5, pc}
	nop
_021F7E60: .word _021FB7E0
_021F7E64: .word _021FB7C0
_021F7E68: .word gSystem
_021F7E6C: .word 0x000018C7
	thumb_func_end ov18_021F7DCC

	thumb_func_start ov18_021F7E70
ov18_021F7E70: ; 0x021F7E70
	push {r4, lr}
	add r4, r1, #0
	bl ov18_021F7B94
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _021F7EC8
	bl System_GetTouchNew
	cmp r0, #1
	bne _021F7EA2
	ldr r0, _021F7ECC ; =_021FB630
	bl sub_0202529C
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _021F7E9A
	add r0, r1, #0
	pop {r4, pc}
_021F7E9A:
	mov r0, #1
	str r0, [r4]
	mov r0, #4
	pop {r4, pc}
_021F7EA2:
	mov r0, #0
	ldr r2, _021F7ED0 ; =gSystem
	str r0, [r4]
	ldr r3, [r2, #0x4c]
	mov r1, #0x20
	tst r1, r3
	beq _021F7EB4
	mov r0, #2
	pop {r4, pc}
_021F7EB4:
	mov r1, #0x10
	tst r1, r3
	bne _021F7EC8
	ldr r1, [r2, #0x48]
	mov r0, #1
	tst r1, r0
	beq _021F7EC6
	mov r0, #3
	pop {r4, pc}
_021F7EC6:
	sub r0, r0, #2
_021F7EC8:
	pop {r4, pc}
	nop
_021F7ECC: .word _021FB630
_021F7ED0: .word gSystem
	thumb_func_end ov18_021F7E70

	thumb_func_start ov18_021F7ED4
ov18_021F7ED4: ; 0x021F7ED4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	str r2, [sp, #0x10]
	add r5, r0, #0
	ldr r2, _021F815C ; =0x00000878
	add r7, r1, #0
	add r1, r5, r2
	mov r0, #0
	sub r2, #0xc0
	str r3, [sp, #0x14]
	bl MIi_CpuClear32
	ldr r1, _021F8160 ; =0x000003DA
	mov r0, #0x25
	bl AllocFromHeapAtEnd
	add r6, r0, #0
	bne _021F7EFC
	bl GF_AssertFail
_021F7EFC:
	ldr r2, _021F8160 ; =0x000003DA
	add r0, r6, #0
	mov r1, #0
	bl memset
	mov r0, #0
	str r0, [sp, #0x1c]
	ldr r1, _021F8160 ; =0x000003DA
	mov r0, #0x25
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	bne _021F7F1A
	bl GF_AssertFail
_021F7F1A:
	ldr r2, _021F8160 ; =0x000003DA
	add r0, r4, #0
	mov r1, #0
	bl memset
	mov r0, #0
	str r0, [sp, #0x18]
	cmp r7, #0
	add r1, sp, #0x20
	bne _021F7F36
	mov r0, #1
	bl ov18_021F8168
	b _021F7F3A
_021F7F36:
	bl ov18_021F8168
_021F7F3A:
	add r7, r0, #0
	ldr r0, [sp, #0x20]
	add r1, sp, #0x1c
	str r0, [sp]
	ldr r2, [r5]
	add r0, r6, #0
	ldr r2, [r2]
	add r3, r7, #0
	bl ov18_021F8198
	ldr r0, [sp, #0x1c]
	add r1, r4, #0
	str r0, [sp]
	ldr r0, [r5]
	add r2, sp, #0x18
	ldr r0, [r0]
	add r3, r6, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	bl ov18_021F822C
	ldr r2, [sp, #0x18]
	add r0, r6, #0
	add r1, r4, #0
	lsl r2, r2, #1
	bl memcpy
	ldr r2, [sp, #0x18]
	add r0, r4, #0
	str r2, [sp, #0x1c]
	mov r1, #0
	lsl r2, r2, #1
	bl memset
	mov r0, #0
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	add r1, r4, #0
	str r0, [sp]
	ldr r0, [r5]
	add r2, sp, #0x18
	ldr r0, [r0]
	add r3, r6, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	bl ov18_021F82CC
	ldr r2, [sp, #0x18]
	cmp r2, #0
	beq _021F8090
	add r0, r6, #0
	add r1, r4, #0
	lsl r2, r2, #1
	bl memcpy
	ldr r2, [sp, #0x18]
	add r0, r4, #0
	str r2, [sp, #0x1c]
	mov r1, #0
	lsl r2, r2, #1
	bl memset
	mov r0, #0
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	add r1, r4, #0
	str r0, [sp]
	ldr r0, [r5]
	add r2, sp, #0x18
	ldr r0, [r0]
	add r3, r6, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x38]
	bl ov18_021F831C
	ldr r2, [sp, #0x18]
	cmp r2, #0
	beq _021F8090
	add r0, r6, #0
	add r1, r4, #0
	lsl r2, r2, #1
	bl memcpy
	ldr r2, [sp, #0x18]
	add r0, r4, #0
	str r2, [sp, #0x1c]
	mov r1, #0
	lsl r2, r2, #1
	bl memset
	mov r0, #0
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	add r1, r4, #0
	str r0, [sp]
	ldr r0, [r5]
	add r2, sp, #0x18
	ldr r0, [r0]
	add r3, r6, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x3c]
	bl ov18_021F831C
	ldr r2, [sp, #0x18]
	cmp r2, #0
	beq _021F8090
	add r0, r6, #0
	add r1, r4, #0
	lsl r2, r2, #1
	bl memcpy
	ldr r2, [sp, #0x18]
	add r0, r4, #0
	str r2, [sp, #0x1c]
	mov r1, #0
	lsl r2, r2, #1
	bl memset
	mov r0, #0
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	add r1, r4, #0
	str r0, [sp]
	ldr r0, [r5]
	add r2, sp, #0x18
	ldr r0, [r0]
	add r3, r6, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x54]
	bl ov18_021F8468
	ldr r2, [sp, #0x18]
	cmp r2, #0
	beq _021F8142
	add r0, r6, #0
	add r1, r4, #0
	lsl r2, r2, #1
	bl memcpy
	ldr r2, [sp, #0x18]
	add r0, r4, #0
	str r2, [sp, #0x1c]
	mov r1, #0
	lsl r2, r2, #1
	bl memset
	mov r0, #0
	str r0, [sp, #0x18]
	ldr r0, _021F8164 ; =0x00001860
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _021F8092
	ldr r1, [sp, #0x50]
	mov r0, #4
	tst r0, r1
	beq _021F8092
	str r6, [sp]
	ldr r0, [sp, #0x1c]
	mov r1, #6
	str r0, [sp, #4]
	ldr r0, [r5]
	add r2, r4, #0
	ldr r0, [r0]
	add r3, sp, #0x18
	str r0, [sp, #8]
	add r0, r5, #0
	bl ov18_021F8584
	ldr r2, [sp, #0x18]
	cmp r2, #0
	bne _021F80B0
_021F8090:
	b _021F8142
_021F8092:
	str r6, [sp]
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x50]
	str r0, [sp, #4]
	ldr r0, [r5]
	add r2, r4, #0
	ldr r0, [r0]
	add r3, sp, #0x18
	str r0, [sp, #8]
	add r0, r5, #0
	bl ov18_021F8584
	ldr r2, [sp, #0x18]
	cmp r2, #0
	beq _021F8142
_021F80B0:
	add r0, r6, #0
	add r1, r4, #0
	lsl r2, r2, #1
	bl memcpy
	ldr r2, [sp, #0x18]
	add r0, r4, #0
	str r2, [sp, #0x1c]
	mov r1, #0
	lsl r2, r2, #1
	bl memset
	mov r0, #0
	str r0, [sp, #0x18]
	add r0, sp, #0x18
	str r0, [sp]
	str r6, [sp, #4]
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x40]
	str r0, [sp, #8]
	ldr r0, [r5]
	ldr r2, [sp, #0x44]
	ldr r0, [r0]
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	str r0, [sp, #0xc]
	add r0, r5, #0
	lsr r1, r1, #0x10
	lsr r2, r2, #0x10
	add r3, r4, #0
	bl ov18_021F8640
	ldr r2, [sp, #0x18]
	add r0, r6, #0
	add r1, r4, #0
	lsl r2, r2, #1
	bl memcpy
	ldr r2, [sp, #0x18]
	add r0, r4, #0
	str r2, [sp, #0x1c]
	mov r1, #0
	lsl r2, r2, #1
	bl memset
	mov r0, #0
	str r0, [sp, #0x18]
	add r0, sp, #0x18
	str r0, [sp]
	str r6, [sp, #4]
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x48]
	str r0, [sp, #8]
	ldr r0, [r5]
	ldr r2, [sp, #0x4c]
	ldr r0, [r0]
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	str r0, [sp, #0xc]
	add r0, r5, #0
	lsr r1, r1, #0x10
	lsr r2, r2, #0x10
	add r3, r4, #0
	bl ov18_021F86D0
	ldr r1, [r5]
	ldr r0, _021F815C ; =0x00000878
	ldr r1, [r1]
	ldr r3, [sp, #0x18]
	add r0, r5, r0
	add r2, r4, #0
	bl ov18_021F81D8
_021F8142:
	add r0, r7, #0
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	add r0, r6, #0
	bl FreeToHeap
	mov r0, #1
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_021F815C: .word 0x00000878
_021F8160: .word 0x000003DA
_021F8164: .word 0x00001860
	thumb_func_end ov18_021F7ED4

	thumb_func_start ov18_021F8168
ov18_021F8168: ; 0x021F8168
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	; u32 size;
	; void * ret;
	; GF_ASSERT(a < 82);
	cmp r5, #0x52
	blo _021F8178
	bl GF_AssertFail
_021F8178:
	; ret = GfGfxLoader_LoadFromNarc_GetSizeOut(GetDexZknDataNarcID(), a0 + 11, FALSE, 37, FALSE, &size);
	bl GetDexZknDataNarcID
	mov r2, #0
	str r2, [sp]
	add r1, sp, #8
	add r5, #0xb
	str r1, [sp, #4]
	add r1, r5, #0
	mov r3, #0x25
	bl GfGfxLoader_LoadFromNarc_GetSizeOut
	; *a1 = size / 2;
	ldr r1, [sp, #8]
	lsr r1, r1, #1
	str r1, [r4]
	; return ret;
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov18_021F8168

	thumb_func_start ov18_021F8198
ov18_021F8198: ; 0x021F8198
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r7, [sp, #0x20]
	add r5, r1, #0
	mov r6, #0
	add r4, r3, #0
	str r0, [sp]
	str r2, [sp, #4]
	str r6, [r5]
	cmp r7, #0
	bls _021F81D2
_021F81AE:
	ldrh r1, [r4]
	ldr r0, [sp, #4]
	bl Pokedex_CheckMonSeenFlag
	cmp r0, #0
	beq _021F81CA
	ldr r1, [r5]
	ldrh r0, [r4]
	lsl r2, r1, #1
	ldr r1, [sp]
	strh r0, [r1, r2]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
_021F81CA:
	add r6, r6, #1
	add r4, r4, #2
	cmp r6, r7
	blo _021F81AE
_021F81D2:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov18_021F8198

	thumb_func_start ov18_021F81D8
ov18_021F81D8: ; 0x021F81D8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r1, [sp]
	add r5, r0, #0
	ldr r1, _021F8228 ; =0x000007B4
	add r0, r3, #0
	strh r0, [r5, r1]
	mov r7, #0
	add r0, r1, #2
	add r4, r2, #0
	strh r7, [r5, r0]
	str r3, [sp, #4]
	add r0, r3, #0
	beq _021F8224
	add r0, r1, #2
	add r6, r5, r0
_021F81F8:
	ldrh r0, [r4]
	strh r0, [r5]
	ldrh r1, [r4]
	ldr r0, [sp]
	bl Pokedex_CheckMonCaughtFlag
	cmp r0, #0
	beq _021F8214
	mov r0, #2
	strh r0, [r5, #2]
	ldrh r0, [r6]
	add r0, r0, #1
	strh r0, [r6]
	b _021F8218
_021F8214:
	mov r0, #1
	strh r0, [r5, #2]
_021F8218:
	ldr r0, [sp, #4]
	add r7, r7, #1
	add r4, r4, #2
	add r5, r5, #4
	cmp r7, r0
	blo _021F81F8
_021F8224:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F8228: .word 0x000007B4
	thumb_func_end ov18_021F81D8

	thumb_func_start ov18_021F822C
ov18_021F822C: ; 0x021F822C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r7, r1, #0
	add r5, r2, #0
	mov r4, #0
	str r3, [sp, #0x10]
	cmp r0, #5
	bhi _021F82A6
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F8248: ; jump table
	.short _021F8254 - _021F8248 - 2 ; case 0
	.short _021F8268 - _021F8248 - 2 ; case 1
	.short _021F8276 - _021F8248 - 2 ; case 2
	.short _021F8282 - _021F8248 - 2 ; case 3
	.short _021F828E - _021F8248 - 2 ; case 4
	.short _021F829A - _021F8248 - 2 ; case 5
_021F8254:
	ldr r2, [sp, #0x30]
	add r0, r7, #0
	add r1, r3, #0
	lsl r2, r2, #1
	bl memcpy
	ldr r0, [sp, #0x30]
	add sp, #0x18
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_021F8268:
	mov r0, #2
	add r1, sp, #0x14
	bl ov18_021F8168
	add r6, r0, #0
	mov r4, #1
	b _021F82AA
_021F8276:
	mov r0, #3
	add r1, sp, #0x14
	bl ov18_021F8168
	add r6, r0, #0
	b _021F82AA
_021F8282:
	mov r0, #4
	add r1, sp, #0x14
	bl ov18_021F8168
	add r6, r0, #0
	b _021F82AA
_021F828E:
	mov r0, #5
	add r1, sp, #0x14
	bl ov18_021F8168
	add r6, r0, #0
	b _021F82AA
_021F829A:
	mov r0, #6
	add r1, sp, #0x14
	bl ov18_021F8168
	add r6, r0, #0
	b _021F82AA
_021F82A6:
	bl GF_AssertFail
_021F82AA:
	str r6, [sp]
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0x10]
	str r0, [sp, #4]
	ldr r0, [sp, #0x34]
	str r4, [sp, #8]
	str r0, [sp, #0xc]
	ldr r3, [sp, #0x30]
	add r0, r7, #0
	add r1, r5, #0
	bl ov18_021F8764
	add r0, r6, #0
	bl FreeToHeap
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov18_021F822C

	thumb_func_start ov18_021F82CC
ov18_021F82CC: ; 0x021F82CC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r6, r1, #0
	add r5, r2, #0
	add r4, r3, #0
	cmp r0, #0x1a
	bne _021F82EE
	ldr r2, [sp, #0x28]
	add r0, r6, #0
	add r1, r4, #0
	lsl r2, r2, #1
	bl memcpy
	ldr r0, [sp, #0x28]
	add sp, #0x14
	str r0, [r5]
	pop {r4, r5, r6, r7, pc}
_021F82EE:
	add r0, r0, #7
	add r1, sp, #0x10
	bl ov18_021F8168
	add r7, r0, #0
	ldr r0, [sp, #0x28]
	str r4, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [sp, #0x2c]
	add r1, r5, #0
	str r0, [sp, #0xc]
	ldr r3, [sp, #0x10]
	add r0, r6, #0
	add r2, r7, #0
	bl ov18_021F8764
	add r0, r7, #0
	bl FreeToHeap
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov18_021F82CC

	thumb_func_start ov18_021F831C
ov18_021F831C: ; 0x021F831C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r1, #0
	add r4, r2, #0
	add r6, r3, #0
	bl ov18_021F8970
	cmp r0, #0x11
	bls _021F8330
	b _021F843E
_021F8330:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F833C: ; jump table
	.short _021F8372 - _021F833C - 2 ; case 0
	.short _021F837E - _021F833C - 2 ; case 1
	.short _021F838A - _021F833C - 2 ; case 2
	.short _021F8396 - _021F833C - 2 ; case 3
	.short _021F83A2 - _021F833C - 2 ; case 4
	.short _021F83AE - _021F833C - 2 ; case 5
	.short _021F83BA - _021F833C - 2 ; case 6
	.short _021F83C6 - _021F833C - 2 ; case 7
	.short _021F83D2 - _021F833C - 2 ; case 8
	.short _021F83DE - _021F833C - 2 ; case 9
	.short _021F83EA - _021F833C - 2 ; case 10
	.short _021F83F6 - _021F833C - 2 ; case 11
	.short _021F8402 - _021F833C - 2 ; case 12
	.short _021F840E - _021F833C - 2 ; case 13
	.short _021F841A - _021F833C - 2 ; case 14
	.short _021F8426 - _021F833C - 2 ; case 15
	.short _021F8432 - _021F833C - 2 ; case 16
	.short _021F8360 - _021F833C - 2 ; case 17
_021F8360:
	ldr r5, [sp, #0x28]
	add r0, r7, #0
	add r1, r6, #0
	lsl r2, r5, #1
	bl memcpy
	add sp, #0x14
	str r5, [r4]
	pop {r4, r5, r6, r7, pc}
_021F8372:
	mov r0, #0x33
	add r1, sp, #0x10
	bl ov18_021F8168
	add r5, r0, #0
	b _021F8442
_021F837E:
	mov r0, #0x34
	add r1, sp, #0x10
	bl ov18_021F8168
	add r5, r0, #0
	b _021F8442
_021F838A:
	mov r0, #0x35
	add r1, sp, #0x10
	bl ov18_021F8168
	add r5, r0, #0
	b _021F8442
_021F8396:
	mov r0, #0x36
	add r1, sp, #0x10
	bl ov18_021F8168
	add r5, r0, #0
	b _021F8442
_021F83A2:
	mov r0, #0x37
	add r1, sp, #0x10
	bl ov18_021F8168
	add r5, r0, #0
	b _021F8442
_021F83AE:
	mov r0, #0x38
	add r1, sp, #0x10
	bl ov18_021F8168
	add r5, r0, #0
	b _021F8442
_021F83BA:
	mov r0, #0x39
	add r1, sp, #0x10
	bl ov18_021F8168
	add r5, r0, #0
	b _021F8442
_021F83C6:
	mov r0, #0x3a
	add r1, sp, #0x10
	bl ov18_021F8168
	add r5, r0, #0
	b _021F8442
_021F83D2:
	mov r0, #0x3b
	add r1, sp, #0x10
	bl ov18_021F8168
	add r5, r0, #0
	b _021F8442
_021F83DE:
	mov r0, #0x3c
	add r1, sp, #0x10
	bl ov18_021F8168
	add r5, r0, #0
	b _021F8442
_021F83EA:
	mov r0, #0x3d
	add r1, sp, #0x10
	bl ov18_021F8168
	add r5, r0, #0
	b _021F8442
_021F83F6:
	mov r0, #0x3e
	add r1, sp, #0x10
	bl ov18_021F8168
	add r5, r0, #0
	b _021F8442
_021F8402:
	mov r0, #0x3f
	add r1, sp, #0x10
	bl ov18_021F8168
	add r5, r0, #0
	b _021F8442
_021F840E:
	mov r0, #0x40
	add r1, sp, #0x10
	bl ov18_021F8168
	add r5, r0, #0
	b _021F8442
_021F841A:
	mov r0, #0x41
	add r1, sp, #0x10
	bl ov18_021F8168
	add r5, r0, #0
	b _021F8442
_021F8426:
	mov r0, #0x42
	add r1, sp, #0x10
	bl ov18_021F8168
	add r5, r0, #0
	b _021F8442
_021F8432:
	mov r0, #0x43
	add r1, sp, #0x10
	bl ov18_021F8168
	add r5, r0, #0
	b _021F8442
_021F843E:
	bl GF_AssertFail
_021F8442:
	ldr r0, [sp, #0x28]
	str r6, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x2c]
	add r1, r4, #0
	str r0, [sp, #0xc]
	ldr r3, [sp, #0x10]
	add r0, r7, #0
	add r2, r5, #0
	bl ov18_021F8764
	add r0, r5, #0
	bl FreeToHeap
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov18_021F831C

	thumb_func_start ov18_021F8468
ov18_021F8468: ; 0x021F8468
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r6, r1, #0
	add r4, r2, #0
	add r5, r3, #0
	cmp r0, #0xe
	bhi _021F855C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F8482: ; jump table
	.short _021F8544 - _021F8482 - 2 ; case 0
	.short _021F8514 - _021F8482 - 2 ; case 1
	.short _021F8520 - _021F8482 - 2 ; case 2
	.short _021F852C - _021F8482 - 2 ; case 3
	.short _021F84E4 - _021F8482 - 2 ; case 4
	.short _021F84D8 - _021F8482 - 2 ; case 5
	.short _021F8508 - _021F8482 - 2 ; case 6
	.short _021F84B4 - _021F8482 - 2 ; case 7
	.short _021F8550 - _021F8482 - 2 ; case 8
	.short _021F84FC - _021F8482 - 2 ; case 9
	.short _021F8538 - _021F8482 - 2 ; case 10
	.short _021F84CC - _021F8482 - 2 ; case 11
	.short _021F84F0 - _021F8482 - 2 ; case 12
	.short _021F84C0 - _021F8482 - 2 ; case 13
	.short _021F84A0 - _021F8482 - 2 ; case 14
_021F84A0:
	ldr r2, [sp, #0x28]
	add r0, r6, #0
	add r1, r5, #0
	lsl r2, r2, #1
	bl memcpy
	ldr r0, [sp, #0x28]
	add sp, #0x14
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_021F84B4:
	mov r0, #0x44
	add r1, sp, #0x10
	bl ov18_021F8168
	add r7, r0, #0
	b _021F8560
_021F84C0:
	mov r0, #0x45
	add r1, sp, #0x10
	bl ov18_021F8168
	add r7, r0, #0
	b _021F8560
_021F84CC:
	mov r0, #0x46
	add r1, sp, #0x10
	bl ov18_021F8168
	add r7, r0, #0
	b _021F8560
_021F84D8:
	mov r0, #0x47
	add r1, sp, #0x10
	bl ov18_021F8168
	add r7, r0, #0
	b _021F8560
_021F84E4:
	mov r0, #0x48
	add r1, sp, #0x10
	bl ov18_021F8168
	add r7, r0, #0
	b _021F8560
_021F84F0:
	mov r0, #0x49
	add r1, sp, #0x10
	bl ov18_021F8168
	add r7, r0, #0
	b _021F8560
_021F84FC:
	mov r0, #0x4a
	add r1, sp, #0x10
	bl ov18_021F8168
	add r7, r0, #0
	b _021F8560
_021F8508:
	mov r0, #0x4b
	add r1, sp, #0x10
	bl ov18_021F8168
	add r7, r0, #0
	b _021F8560
_021F8514:
	mov r0, #0x4c
	add r1, sp, #0x10
	bl ov18_021F8168
	add r7, r0, #0
	b _021F8560
_021F8520:
	mov r0, #0x4d
	add r1, sp, #0x10
	bl ov18_021F8168
	add r7, r0, #0
	b _021F8560
_021F852C:
	mov r0, #0x4e
	add r1, sp, #0x10
	bl ov18_021F8168
	add r7, r0, #0
	b _021F8560
_021F8538:
	mov r0, #0x4f
	add r1, sp, #0x10
	bl ov18_021F8168
	add r7, r0, #0
	b _021F8560
_021F8544:
	mov r0, #0x50
	add r1, sp, #0x10
	bl ov18_021F8168
	add r7, r0, #0
	b _021F8560
_021F8550:
	mov r0, #0x51
	add r1, sp, #0x10
	bl ov18_021F8168
	add r7, r0, #0
	b _021F8560
_021F855C:
	bl GF_AssertFail
_021F8560:
	ldr r0, [sp, #0x28]
	str r5, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [sp, #0x2c]
	add r1, r4, #0
	str r0, [sp, #0xc]
	ldr r3, [sp, #0x10]
	add r0, r6, #0
	add r2, r7, #0
	bl ov18_021F8764
	add r0, r7, #0
	bl FreeToHeap
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov18_021F8468

	thumb_func_start ov18_021F8584
ov18_021F8584: ; 0x021F8584
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	ldr r0, [sp, #0x30]
	add r7, r1, #0
	str r0, [sp, #0x30]
	mov r0, #8
	add r4, r3, #0
	str r2, [sp, #4]
	ldr r6, [sp, #0x2c]
	tst r0, r7
	beq _021F85AC
	ldr r1, [sp, #0x28]
	add r0, r2, #0
	lsl r2, r6, #1
	bl memcpy
	add sp, #0x10
	str r6, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_021F85AC:
	cmp r7, #6
	bne _021F85FA
	mov r0, #0
	str r0, [sp, #0xc]
	cmp r6, #0
	bls _021F8638
	ldr r5, [sp, #0x28]
_021F85BA:
	ldr r2, [sp]
	ldr r0, _021F863C ; =0x00001854
	ldrh r1, [r5]
	ldr r0, [r2, r0]
	add r2, r7, #0
	ldrb r0, [r0, r1]
	tst r2, r0
	beq _021F85EA
	mov r2, #1
	tst r0, r2
	bne _021F85EA
	ldr r0, [sp, #0x30]
	bl Pokedex_CheckMonSeenFlag
	cmp r0, #0
	beq _021F85EA
	ldr r1, [r4]
	ldrh r0, [r5]
	lsl r2, r1, #1
	ldr r1, [sp, #4]
	strh r0, [r1, r2]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_021F85EA:
	ldr r0, [sp, #0xc]
	add r5, r5, #2
	add r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, r6
	blo _021F85BA
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_021F85FA:
	mov r0, #0
	str r0, [sp, #8]
	cmp r6, #0
	bls _021F8638
	ldr r5, [sp, #0x28]
_021F8604:
	ldr r2, [sp]
	ldr r0, _021F863C ; =0x00001854
	ldrh r1, [r5]
	ldr r0, [r2, r0]
	ldrb r0, [r0, r1]
	tst r0, r7
	beq _021F862C
	ldr r0, [sp, #0x30]
	bl Pokedex_CheckMonSeenFlag
	cmp r0, #0
	beq _021F862C
	ldr r1, [r4]
	ldrh r0, [r5]
	lsl r2, r1, #1
	ldr r1, [sp, #4]
	strh r0, [r1, r2]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_021F862C:
	ldr r0, [sp, #8]
	add r5, r5, #2
	add r0, r0, #1
	str r0, [sp, #8]
	cmp r0, r6
	blo _021F8604
_021F8638:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F863C: .word 0x00001854
	thumb_func_end ov18_021F8584

	thumb_func_start ov18_021F8640
ov18_021F8640: ; 0x021F8640
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	ldr r0, [sp, #0x28]
	str r3, [sp]
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x2c]
	ldr r5, [sp, #0x20]
	str r0, [sp, #0x2c]
	cmp r1, #0
	bne _021F866E
	cmp r2, #0x98
	bne _021F866E
	ldr r2, [sp, #0x28]
	ldr r1, [sp, #0x24]
	add r0, r3, #0
	lsl r2, r2, #1
	bl memcpy
	ldr r0, [sp, #0x28]
	add sp, #0xc
	str r0, [r5]
	pop {r4, r5, r6, r7, pc}
_021F866E:
	ldr r0, [sp, #0x28]
	mov r7, #0
	cmp r0, #0
	bls _021F86C4
	lsl r0, r1, #2
	str r0, [sp, #8]
	lsl r0, r2, #2
	ldr r4, [sp, #0x24]
	str r0, [sp, #4]
_021F8680:
	ldr r0, _021F86C8 ; =0x00001848
	ldrh r2, [r4]
	ldr r1, [r6, r0]
	ldr r3, [sp, #8]
	lsl r0, r2, #2
	ldr r1, [r1, r0]
	ldr r0, _021F86CC ; =0x00001850
	ldr r0, [r6, r0]
	ldrh r3, [r3, r0]
	cmp r1, r3
	blt _021F86BA
	ldr r3, [sp, #4]
	ldrh r0, [r3, r0]
	cmp r1, r0
	bgt _021F86BA
	ldr r0, [sp, #0x2c]
	add r1, r2, #0
	bl Pokedex_CheckMonCaughtFlag
	cmp r0, #0
	beq _021F86BA
	ldr r1, [r5]
	ldrh r0, [r4]
	lsl r2, r1, #1
	ldr r1, [sp]
	strh r0, [r1, r2]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
_021F86BA:
	ldr r0, [sp, #0x28]
	add r7, r7, #1
	add r4, r4, #2
	cmp r7, r0
	blo _021F8680
_021F86C4:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021F86C8: .word 0x00001848
_021F86CC: .word 0x00001850
	thumb_func_end ov18_021F8640

	thumb_func_start ov18_021F86D0
ov18_021F86D0: ; 0x021F86D0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	ldr r0, [sp, #0x28]
	str r3, [sp]
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x2c]
	ldr r5, [sp, #0x20]
	str r0, [sp, #0x2c]
	cmp r1, #0
	bne _021F86FE
	cmp r2, #0x98
	bne _021F86FE
	ldr r2, [sp, #0x28]
	ldr r1, [sp, #0x24]
	add r0, r3, #0
	lsl r2, r2, #1
	bl memcpy
	ldr r0, [sp, #0x28]
	add sp, #0xc
	str r0, [r5]
	pop {r4, r5, r6, r7, pc}
_021F86FE:
	ldr r0, [sp, #0x28]
	mov r7, #0
	cmp r0, #0
	bls _021F8758
	lsl r0, r1, #2
	str r0, [sp, #8]
	lsl r0, r2, #2
	ldr r4, [sp, #0x24]
	str r0, [sp, #4]
_021F8710:
	ldr r0, _021F875C ; =0x0000184C
	ldrh r2, [r4]
	ldr r1, [r6, r0]
	ldr r3, [sp, #8]
	lsl r0, r2, #2
	ldr r1, [r1, r0]
	ldr r0, _021F8760 ; =0x00001850
	ldr r0, [r6, r0]
	add r3, r3, r0
	ldrh r3, [r3, #2]
	cmp r1, r3
	blt _021F874E
	ldr r3, [sp, #4]
	add r0, r3, r0
	ldrh r0, [r0, #2]
	cmp r1, r0
	bgt _021F874E
	ldr r0, [sp, #0x2c]
	add r1, r2, #0
	bl Pokedex_CheckMonCaughtFlag
	cmp r0, #0
	beq _021F874E
	ldr r1, [r5]
	ldrh r0, [r4]
	lsl r2, r1, #1
	ldr r1, [sp]
	strh r0, [r1, r2]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
_021F874E:
	ldr r0, [sp, #0x28]
	add r7, r7, #1
	add r4, r4, #2
	cmp r7, r0
	blo _021F8710
_021F8758:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021F875C: .word 0x0000184C
_021F8760: .word 0x00001850
	thumb_func_end ov18_021F86D0

	thumb_func_start ov18_021F8764
ov18_021F8764: ; 0x021F8764
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	str r1, [sp, #4]
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x34]
	mov r1, #0
	str r0, [sp, #0x34]
	ldr r0, [sp, #4]
	str r2, [sp, #8]
	str r1, [r0]
	ldr r0, [sp, #0x30]
	add r5, r3, #0
	str r1, [sp, #0xc]
	cmp r0, #1
	bne _021F87D0
	ldr r0, [sp, #0x2c]
	cmp r0, #0
	bls _021F8820
	ldr r1, [sp, #0x28]
	mov r0, #0
_021F8790:
	add r4, r0, #0
	cmp r5, #0
	bls _021F87BE
	ldrh r2, [r1]
	ldr r6, [sp, #8]
_021F879A:
	ldrh r3, [r6]
	cmp r2, r3
	bne _021F87B6
	ldr r3, [sp, #4]
	ldr r3, [r3]
	lsl r4, r3, #1
	ldr r3, [sp]
	strh r2, [r3, r4]
	ldr r2, [sp, #4]
	ldr r2, [r2]
	add r3, r2, #1
	ldr r2, [sp, #4]
	str r3, [r2]
	b _021F87BE
_021F87B6:
	add r4, r4, #1
	add r6, r6, #2
	cmp r4, r5
	blo _021F879A
_021F87BE:
	ldr r2, [sp, #0xc]
	add r1, r1, #2
	add r3, r2, #1
	ldr r2, [sp, #0x2c]
	str r3, [sp, #0xc]
	cmp r3, r2
	blo _021F8790
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_021F87D0:
	ldr r0, [sp, #0x2c]
	cmp r0, #0
	bls _021F8820
	ldr r7, [sp, #0x28]
_021F87D8:
	mov r6, #0
	cmp r5, #0
	bls _021F8812
	ldr r4, [sp, #8]
_021F87E0:
	ldrh r1, [r7]
	ldrh r0, [r4]
	cmp r1, r0
	bne _021F880A
	ldr r0, [sp, #0x34]
	bl Pokedex_CheckMonCaughtFlag
	cmp r0, #0
	beq _021F880A
	ldr r0, [sp, #4]
	ldrh r2, [r7]
	ldr r0, [r0]
	lsl r1, r0, #1
	ldr r0, [sp]
	strh r2, [r0, r1]
	ldr r0, [sp, #4]
	ldr r0, [r0]
	add r1, r0, #1
	ldr r0, [sp, #4]
	str r1, [r0]
	b _021F8812
_021F880A:
	add r6, r6, #1
	add r4, r4, #2
	cmp r6, r5
	blo _021F87E0
_021F8812:
	ldr r0, [sp, #0xc]
	add r7, r7, #2
	add r1, r0, #1
	ldr r0, [sp, #0x2c]
	str r1, [sp, #0xc]
	cmp r1, r0
	blo _021F87D8
_021F8820:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov18_021F8764

	thumb_func_start ov18_021F8824
ov18_021F8824: ; 0x021F8824
	ldr r1, _021F8834 ; =0x0000185A
	ldrb r2, [r0, r1]
	sub r1, r1, #1
	ldrb r1, [r0, r1]
	mov r0, #0xf
	mul r0, r1
	add r0, r2, r0
	bx lr
	.balign 4, 0
_021F8834: .word 0x0000185A
	thumb_func_end ov18_021F8824

	thumb_func_start ov18_021F8838
ov18_021F8838: ; 0x021F8838
	push {r4, lr}
	add r4, r0, #0
	bl ov18_021F8824
	lsl r0, r0, #2
	add r1, r4, r0
	ldr r0, _021F884C ; =0x00001030
	ldrh r0, [r1, r0]
	pop {r4, pc}
	nop
_021F884C: .word 0x00001030
	thumb_func_end ov18_021F8838

	thumb_func_start ov18_021F8850
ov18_021F8850: ; 0x021F8850
	push {r4, r5}
	ldr r2, _021F8880 ; =0x000007B4
	mov r4, #0
	ldrh r5, [r0, r2]
	add r3, r4, #0
	cmp r5, #0
	bls _021F8878
_021F885E:
	cmp r4, #0
	bne _021F8864
	ldrh r4, [r0]
_021F8864:
	ldrh r2, [r0]
	cmp r1, r2
	bne _021F8870
	add r0, r1, #0
	pop {r4, r5}
	bx lr
_021F8870:
	add r3, r3, #1
	add r0, r0, #4
	cmp r3, r5
	blo _021F885E
_021F8878:
	add r0, r4, #0
	pop {r4, r5}
	bx lr
	nop
_021F8880: .word 0x000007B4
	thumb_func_end ov18_021F8850

	thumb_func_start ov18_021F8884
ov18_021F8884: ; 0x021F8884
	push {r3, r4, r5, r6, r7, lr}
	ldr r2, _021F8900 ; =0x00001030
	add r5, r0, #0
	add r4, r1, #0
	add r1, r5, r2
	mov r0, #0
	lsr r2, r2, #1
	bl MIi_CpuClear32
	cmp r4, #1
	ldr r0, _021F8904 ; =0x0000102C
	bne _021F88D6
	ldrh r0, [r5, r0]
	mov r6, #0
	cmp r0, #0
	bls _021F88FE
	ldr r7, _021F8904 ; =0x0000102C
	add r4, r5, #0
_021F88A8:
	ldr r0, _021F8908 ; =0x00001858
	ldr r1, _021F890C ; =0x00000878
	ldrb r0, [r5, r0]
	ldrh r1, [r4, r1]
	bl Pokedex_ConvertToCurrentDexNo
	ldr r1, _021F890C ; =0x00000878
	sub r0, r0, #1
	ldrh r2, [r4, r1]
	lsl r0, r0, #2
	ldr r1, _021F8900 ; =0x00001030
	add r0, r5, r0
	strh r2, [r0, r1]
	ldr r1, _021F8910 ; =0x0000087A
	add r6, r6, #1
	ldrh r2, [r4, r1]
	ldr r1, _021F8914 ; =0x00001032
	add r4, r4, #4
	strh r2, [r0, r1]
	ldrh r0, [r5, r7]
	cmp r6, r0
	blo _021F88A8
	pop {r3, r4, r5, r6, r7, pc}
_021F88D6:
	ldrh r0, [r5, r0]
	mov r1, #0
	cmp r0, #0
	bls _021F88FE
	ldr r3, _021F8918 ; =0x00001034
	ldr r4, _021F8910 ; =0x0000087A
	add r7, r3, #0
	add r0, r5, #0
	add r6, r3, #2
	sub r7, #8
_021F88EA:
	ldr r2, _021F890C ; =0x00000878
	add r1, r1, #1
	ldrh r2, [r0, r2]
	strh r2, [r0, r3]
	ldrh r2, [r0, r4]
	strh r2, [r0, r6]
	ldrh r2, [r5, r7]
	add r0, r0, #4
	cmp r1, r2
	blo _021F88EA
_021F88FE:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F8900: .word 0x00001030
_021F8904: .word 0x0000102C
_021F8908: .word 0x00001858
_021F890C: .word 0x00000878
_021F8910: .word 0x0000087A
_021F8914: .word 0x00001032
_021F8918: .word 0x00001034
	thumb_func_end ov18_021F8884

	thumb_func_start ov18_021F891C
ov18_021F891C: ; 0x021F891C
	push {r3, lr}
	add r2, r0, #0
	cmp r1, #0
	bne _021F892A
	ldr r0, _021F8944 ; =0x0000102C
	ldrh r0, [r2, r0]
	pop {r3, pc}
_021F892A:
	ldr r1, _021F8944 ; =0x0000102C
	ldr r0, _021F8948 ; =0x00001858
	ldrh r1, [r2, r1]
	ldrb r0, [r2, r0]
	sub r1, r1, #1
	lsl r1, r1, #2
	add r2, r2, r1
	ldr r1, _021F894C ; =0x00000878
	ldrh r1, [r2, r1]
	bl Pokedex_ConvertToCurrentDexNo
	pop {r3, pc}
	nop
_021F8944: .word 0x0000102C
_021F8948: .word 0x00001858
_021F894C: .word 0x00000878
	thumb_func_end ov18_021F891C

	thumb_func_start ov18_021F8950
ov18_021F8950: ; 0x021F8950
	push {r3, lr}
	cmp r1, #0
	bne _021F8962
	bl ov18_021F891C
	mov r1, #0xf
	bl _u32_div_f
	pop {r3, pc}
_021F8962:
	bl ov18_021F891C
	sub r0, r0, #1
	mov r1, #0xf
	bl _u32_div_f
	pop {r3, pc}
	thumb_func_end ov18_021F8950

	thumb_func_start ov18_021F8970
ov18_021F8970: ; 0x021F8970
	bx lr
	.balign 4, 0
	thumb_func_end ov18_021F8970

	thumb_func_start ov18_021F8974
ov18_021F8974: ; 0x021F8974
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r1, #0x96
	ldr r0, [r5, #0x14]
	lsl r1, r1, #2
	bl AllocFromHeap
	mov r2, #0x96
	mov r1, #0
	lsl r2, r2, #2
	add r4, r0, #0
	bl memset
	add r2, r4, #0
	mov r1, #0x18
_021F8992:
	ldrb r0, [r5]
	add r5, r5, #1
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _021F8992
	ldr r1, [r4, #0x14]
	mov r0, #0x44
	bl NARC_ctor
	str r0, [r4, #0x1c]
	mov r0, #9
	mov r2, #0
	lsl r0, r0, #6
	strh r2, [r4, r0]
	add r0, #0x14
	str r2, [r4, r0]
	ldr r0, _021F89C4 ; =ov18_021F89F8
	add r1, r4, #0
	bl CreateSysTask
	str r0, [r4, #0x18]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021F89C4: .word ov18_021F89F8
	thumb_func_end ov18_021F8974

	thumb_func_start ov18_021F89C8
ov18_021F89C8: ; 0x021F89C8
	mov r1, #0x95
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end ov18_021F89C8

	thumb_func_start ov18_021F89D0
ov18_021F89D0: ; 0x021F89D0
	push {r4, lr}
	add r4, r0, #0
	bl ov18_021F91F0
	add r0, r4, #0
	bl ov18_021F8F10
	add r0, r4, #0
	bl ov18_021F8BEC
	ldr r0, [r4, #0x1c]
	bl NARC_dtor
	ldr r0, [r4, #0x18]
	bl DestroySysTask
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov18_021F89D0

	thumb_func_start ov18_021F89F8
ov18_021F89F8: ; 0x021F89F8
	push {r4, lr}
	sub sp, #8
	add r4, r1, #0
	mov r1, #9
	lsl r1, r1, #6
	ldrh r0, [r4, r1]
	cmp r0, #4
	bhi _021F8AA0
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F8A14: ; jump table
	.short _021F8A1E - _021F8A14 - 2 ; case 0
	.short _021F8A52 - _021F8A14 - 2 ; case 1
	.short _021F8A66 - _021F8A14 - 2 ; case 2
	.short _021F8A8A - _021F8A14 - 2 ; case 3
	.short _021F8AA0 - _021F8A14 - 2 ; case 4
_021F8A1E:
	ldr r0, _021F8AB4 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	add r0, r4, #0
	bl ov18_021F8AB8
	add r0, r4, #0
	bl ov18_021F8B10
	add r0, r4, #0
	bl ov18_021F8CCC
	add r0, r4, #0
	bl ov18_021F8FA0
	add r0, r4, #0
	bl ov18_021F95CC
	add r0, r4, #0
	bl ov18_021F8C0C
	mov r0, #9
	mov r1, #1
	lsl r0, r0, #6
	strh r1, [r4, r0]
	b _021F8AA0
_021F8A52:
	add r0, r4, #0
	bl ov18_021F8C48
	cmp r0, #1
	bne _021F8AA0
	mov r0, #9
	mov r1, #2
	lsl r0, r0, #6
	strh r1, [r4, r0]
	b _021F8AA0
_021F8A66:
	add r2, r1, #0
	sub r2, #0x41
	str r2, [sp]
	mov r0, #0
	str r0, [sp, #4]
	add r1, r1, #4
	ldr r1, [r4, r1]
	mov r0, #0xe
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	add r3, r2, #0
	bl PlayCryEx
	mov r0, #9
	mov r1, #3
	lsl r0, r0, #6
	strh r1, [r4, r0]
	b _021F8AA0
_021F8A8A:
	bl IsCryFinished
	cmp r0, #0
	bne _021F8AA0
	mov r0, #0x95
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r1, #4
	sub r0, #0x14
	strh r1, [r4, r0]
_021F8AA0:
	add r0, r4, #0
	add r0, #0xb4
	ldr r0, [r0]
	bl sub_0202457C
	add r0, r4, #0
	bl ov18_021F8C68
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_021F8AB4: .word 0x04000050
	thumb_func_end ov18_021F89F8

	thumb_func_start ov18_021F8AB8
ov18_021F8AB8: ; 0x021F8AB8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	bl AcquireMonLock
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	mov r1, #5
	mov r2, #0
	bl GetMonData
	mov r1, #0x91
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r5, #0xc]
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r5, #0xc]
	mov r1, #0xb1
	mov r2, #0
	bl GetMonData
	mov r1, #0x93
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r5, #0xc]
	mov r1, #0xb2
	mov r2, #0
	bl GetMonData
	mov r1, #0x25
	lsl r1, r1, #4
	str r0, [r5, r1]
	ldr r0, [r5, #0xc]
	add r1, r4, #0
	bl ReleaseMonLock
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov18_021F8AB8

	thumb_func_start ov18_021F8B10
ov18_021F8B10: ; 0x021F8B10
	push {r4, r5, lr}
	sub sp, #0x64
	add r4, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl SetBgPriority
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	ldr r5, _021F8BE0 ; =_021FBD7C
	add r3, sp, #0x48
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
	ldr r0, [r4]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r3, [r4, #0x14]
	mov r0, #1
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	ldr r5, _021F8BE4 ; =_021FBD60
	add r3, sp, #0x2c
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
	ldr r0, [r4]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r5, _021F8BE8 ; =_021FBD98
	add r3, sp, #0x10
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #3
	str r0, [r3]
	ldr r0, [r4]
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r4, #0x14]
	mov r1, #0x13
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x1c]
	ldr r2, [r4]
	mov r3, #2
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r4, #0x14]
	mov r1, #0x14
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x1c]
	ldr r2, [r4]
	mov r3, #2
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4, #4]
	ldr r1, [r4, #0x1c]
	ldr r3, [r4, #0x14]
	mov r2, #0x12
	bl sub_02003284
	add sp, #0x64
	pop {r4, r5, pc}
	nop
_021F8BE0: .word _021FBD7C
_021F8BE4: .word _021FBD60
_021F8BE8: .word _021FBD98
	thumb_func_end ov18_021F8B10

	thumb_func_start ov18_021F8BEC
ov18_021F8BEC: ; 0x021F8BEC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	mov r1, #3
	bl FreeBgTilemapBuffer
	ldr r0, [r4]
	mov r1, #2
	bl FreeBgTilemapBuffer
	ldr r0, [r4]
	mov r1, #1
	bl FreeBgTilemapBuffer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov18_021F8BEC

	thumb_func_start ov18_021F8C0C
ov18_021F8C0C: ; 0x021F8C0C
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4, #4]
	ldr r2, _021F8C44 ; =0x0000FFFF
	mov r1, #5
	mov r3, #1
	bl sub_02003370
	mov r2, #0
	str r2, [sp]
	ldr r0, [r4, #0x20]
	mov r1, #0x10
	add r3, r2, #0
	bl sub_020090B4
	ldr r0, [r4, #4]
	mov r1, #0
	bl sub_02003B50
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_021F8C44: .word 0x0000FFFF
	thumb_func_end ov18_021F8C0C

	thumb_func_start ov18_021F8C48
ov18_021F8C48: ; 0x021F8C48
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	bl sub_02003B44
	cmp r0, #0
	bne _021F8C64
	ldr r0, [r4, #0x20]
	bl sub_02009138
	cmp r0, #0
	bne _021F8C64
	mov r0, #1
	pop {r4, pc}
_021F8C64:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov18_021F8C48

	thumb_func_start ov18_021F8C68
ov18_021F8C68: ; 0x021F8C68
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, _021F8CC8 ; =0x00000242
	ldrh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, r0]
	ldrh r0, [r4, r0]
	cmp r0, #0x10
	bne _021F8C9E
	mov r0, #0x20
	str r0, [sp]
	mov r1, #2
	mov r2, #0
	str r1, [sp, #4]
	mov r0, #7
	str r0, [sp, #8]
	ldr r0, [r4]
	add r3, r2, #0
	bl BgTilemapRectChangePalette
	ldr r0, [r4]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0xc
	pop {r3, r4, pc}
_021F8C9E:
	cmp r0, #0x20
	bne _021F8CC4
	mov r0, #0x20
	str r0, [sp]
	mov r1, #2
	mov r2, #0
	str r1, [sp, #4]
	str r2, [sp, #8]
	ldr r0, [r4]
	add r3, r2, #0
	bl BgTilemapRectChangePalette
	ldr r0, [r4]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, _021F8CC8 ; =0x00000242
	mov r1, #0
	strh r1, [r4, r0]
_021F8CC4:
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_021F8CC8: .word 0x00000242
	thumb_func_end ov18_021F8C68

	thumb_func_start ov18_021F8CCC
ov18_021F8CCC: ; 0x021F8CCC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	add r4, r5, #0
	ldr r6, _021F8F04 ; =_021FBDB4
	mov r7, #0
	add r4, #0x24
_021F8CDA:
	ldr r0, [r5]
	add r1, r4, #0
	add r2, r6, #0
	bl AddWindow
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r7, r7, #1
	add r6, #8
	add r4, #0x10
	cmp r7, #9
	blo _021F8CDA
	ldr r2, _021F8F08 ; =0x00000322
	ldr r3, [r5, #0x14]
	mov r0, #0
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	add r4, r0, #0
	ldr r0, [r5, #0x14]
	bl ScrStrBufs_new
	add r6, r0, #0
	mov r0, #1
	ldr r1, [r5, #0x14]
	lsl r0, r0, #0xa
	bl String_ctor
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _021F8F0C ; =0x00020100
	add r1, r4, #0
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r0, #0x24
	mov r2, #0x90
	mov r3, #0x70
	bl ov18_021F9648
	mov r1, #0x91
	lsl r1, r1, #2
	ldr r0, [r5, #0x10]
	ldr r1, [r5, r1]
	bl Pokedex_ConvertToCurrentDexNo
	add r2, r0, #0
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r6, #0
	mov r1, #0
	mov r3, #3
	bl BufferIntegerAsString
	add r0, r4, #0
	mov r1, #9
	bl NewString_ReadMsgData
	add r7, r0, #0
	ldr r1, [sp, #0x10]
	add r0, r6, #0
	add r2, r7, #0
	bl StringExpandPlaceholders
	mov r0, #4
	str r0, [sp]
	ldr r0, _021F8F0C ; =0x00020100
	ldr r1, [sp, #0x10]
	str r0, [sp, #4]
	add r0, r5, #0
	mov r3, #0
	add r0, #0x34
	mov r2, #1
	str r3, [sp, #8]
	bl ov18_021F95FC
	add r0, r7, #0
	bl String_dtor
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x14]
	mov r1, #2
	bl ov18_021E590C
	add r7, r0, #0
	mov r0, #4
	str r0, [sp]
	ldr r0, _021F8F0C ; =0x00020100
	mov r2, #0
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x44
	add r1, r7, #0
	add r3, r2, #0
	str r2, [sp, #8]
	bl ov18_021F95FC
	add r0, r7, #0
	bl String_dtor
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x14]
	mov r1, #2
	bl ov18_021E595C
	add r7, r0, #0
	add r0, r5, #0
	add r0, #0x54
	bl GetWindowWidth
	lsl r0, r0, #3
	sub r2, r0, #4
	mov r0, #4
	str r0, [sp]
	ldr r0, _021F8F0C ; =0x00020100
	add r1, r7, #0
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x54
	mov r3, #0
	bl ov18_021F95FC
	add r0, r7, #0
	bl String_dtor
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r3, [r5, #0x14]
	mov r1, #2
	mov r2, #0
	bl ov18_021E59A8
	add r7, r0, #0
	add r0, r5, #0
	add r0, #0x64
	bl GetWindowWidth
	str r0, [sp, #0x14]
	mov r0, #0
	add r1, r7, #0
	add r2, r0, #0
	bl FontID_String_GetWidthMultiline
	ldr r1, [sp, #0x14]
	mov r3, #0
	lsl r1, r1, #3
	sub r0, r1, r0
	lsr r2, r0, #1
	ldr r0, _021F8F0C ; =0x00020100
	str r3, [sp]
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x64
	add r1, r7, #0
	str r3, [sp, #8]
	bl ov18_021F95FC
	add r0, r7, #0
	bl String_dtor
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021F8F0C ; =0x00020100
	add r1, r4, #0
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r0, #0x74
	mov r2, #0xa
	mov r3, #0x14
	bl ov18_021F9648
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021F8F0C ; =0x00020100
	add r1, r4, #0
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r0, #0x94
	mov r2, #0xb
	mov r3, #0x14
	bl ov18_021F9648
	add r0, r6, #0
	bl ScrStrBufs_delete
	add r0, r4, #0
	bl DestroyMsgData
	bl GetDexHeightMsgBank
	add r2, r0, #0
	ldr r3, [r5, #0x14]
	mov r0, #0
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	mov r1, #0
	add r4, r0, #0
	str r1, [sp]
	mov r2, #0x91
	ldr r0, _021F8F0C ; =0x00020100
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsl r2, r2, #2
	add r0, r5, #0
	ldr r2, [r5, r2]
	add r0, #0x84
	add r1, r4, #0
	mov r3, #4
	bl ov18_021F9648
	add r0, r4, #0
	bl DestroyMsgData
	bl GetDexWeightMsgBank
	add r2, r0, #0
	ldr r3, [r5, #0x14]
	mov r0, #0
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	mov r1, #0
	add r4, r0, #0
	str r1, [sp]
	mov r2, #0x91
	ldr r0, _021F8F0C ; =0x00020100
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsl r2, r2, #2
	add r0, r5, #0
	ldr r2, [r5, r2]
	add r0, #0xa4
	add r1, r4, #0
	mov r3, #4
	bl ov18_021F9648
	add r0, r4, #0
	bl DestroyMsgData
	ldr r0, [sp, #0x10]
	bl String_dtor
	mov r4, #0
	add r5, #0x24
_021F8EF2:
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #9
	blo _021F8EF2
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F8F04: .word _021FBDB4
_021F8F08: .word 0x00000322
_021F8F0C: .word 0x00020100
	thumb_func_end ov18_021F8CCC

	thumb_func_start ov18_021F8F10
ov18_021F8F10: ; 0x021F8F10
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
	add r5, #0x24
_021F8F18:
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #9
	blo _021F8F18
	pop {r3, r4, r5, pc}
	thumb_func_end ov18_021F8F10

	thumb_func_start ov18_021F8F28
ov18_021F8F28: ; 0x021F8F28
	push {r3, r4, r5, lr}
	sub sp, #0x10
	ldr r4, _021F8F50 ; =_021FBD50
	add r3, sp, #0
	add r5, r0, #0
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5, #0x14]
	ldr r1, _021F8F54 ; =0x00100010
	str r0, [sp, #0xc]
	add r0, r2, #0
	mov r2, #0x10
	bl sub_020215C0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_021F8F50: .word _021FBD50
_021F8F54: .word 0x00100010
	thumb_func_end ov18_021F8F28

	thumb_func_start ov18_021F8F58
ov18_021F8F58: ; 0x021F8F58
	ldr r3, _021F8F5C ; =sub_0202168C
	bx r3
	.balign 4, 0
_021F8F5C: .word sub_0202168C
	thumb_func_end ov18_021F8F58

	thumb_func_start ov18_021F8F60
ov18_021F8F60: ; 0x021F8F60
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r7, #0x1e
	mov r4, #0
	add r5, r6, #0
	lsl r7, r7, #4
_021F8F6C:
	ldr r2, [r6, #0x14]
	mov r0, #8
	add r1, r4, #0
	bl Create2DGfxResObjMan
	str r0, [r5, r7]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _021F8F6C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov18_021F8F60

	thumb_func_start ov18_021F8F84
ov18_021F8F84: ; 0x021F8F84
	push {r4, r5, r6, lr}
	mov r6, #0x1e
	add r5, r0, #0
	mov r4, #0
	lsl r6, r6, #4
_021F8F8E:
	ldr r0, [r5, r6]
	bl Destroy2DGfxResObjMan
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _021F8F8E
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov18_021F8F84

	thumb_func_start ov18_021F8FA0
ov18_021F8FA0: ; 0x021F8FA0
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	ldr r2, [r4, #0x14]
	mov r0, #0x20
	add r1, #0xb8
	bl G2dRenderer_Init
	add r1, r4, #0
	add r1, #0xb4
	str r0, [r1]
	ldr r0, [r4, #0x14]
	bl sub_02024BBC
	add r0, r4, #0
	bl ov18_021F8F28
	add r0, r4, #0
	bl ov18_021F8F60
	add r0, r4, #0
	bl ov18_021F8FF8
	add r0, r4, #0
	bl ov18_021F9068
	add r0, r4, #0
	bl ov18_021F9150
	add r0, r4, #0
	bl ov18_021F94BC
	add r0, r4, #0
	bl ov18_021F9370
	add r0, r4, #0
	bl ov18_021F9518
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov18_021F8FA0

	thumb_func_start ov18_021F8FF8
ov18_021F8FF8: ; 0x021F8FF8
	push {r3, r4, lr}
	sub sp, #0x24
	add r4, r0, #0
	mov r0, #0x1d
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x1e
	str r0, [sp, #8]
	mov r0, #0x1f
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	ldr r0, _021F9050 ; =0x0000C618
	mov r1, #0x7d
	str r0, [sp, #0x14]
	str r0, [sp, #0x18]
	str r0, [sp, #0x1c]
	str r0, [sp, #0x20]
	lsl r1, r1, #2
	add r0, r4, r1
	sub r1, #0x14
	ldr r2, [r4, #0x14]
	ldr r3, [r4, #0x1c]
	add r1, r4, r1
	bl ov18_021F922C
	mov r0, #0x7e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_0200B12C
	add r2, r0, #0
	lsl r2, r2, #0x14
	ldr r0, [r4, #4]
	mov r1, #2
	lsr r2, r2, #0x10
	mov r3, #0x40
	bl sub_020032A4
	add sp, #0x24
	pop {r3, r4, pc}
	nop
_021F9050: .word 0x0000C618
	thumb_func_end ov18_021F8FF8

	thumb_func_start ov18_021F9054
ov18_021F9054: ; 0x021F9054
	mov r1, #0x7d
	add r2, r0, #0
	lsl r1, r1, #2
	add r0, r2, r1
	sub r1, #0x14
	ldr r3, _021F9064 ; =ov18_021F92DC
	add r1, r2, r1
	bx r3
	.balign 4, 0
_021F9064: .word ov18_021F92DC
	thumb_func_end ov18_021F9054

	thumb_func_start ov18_021F9068
ov18_021F9068: ; 0x021F9068
	push {r3, r4, lr}
	sub sp, #0x24
	add r4, r0, #0
	mov r0, #0x93
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov18_021F967C
	str r0, [sp]
	mov r0, #0x23
	str r0, [sp, #4]
	mov r0, #0x21
	str r0, [sp, #8]
	mov r0, #0x22
	str r0, [sp, #0xc]
	mov r0, #4
	str r0, [sp, #0x10]
	ldr r0, _021F9100 ; =0x0000C619
	mov r1, #0x82
	str r0, [sp, #0x14]
	str r0, [sp, #0x18]
	str r0, [sp, #0x1c]
	str r0, [sp, #0x20]
	lsl r1, r1, #2
	add r0, r4, r1
	sub r1, #0x28
	ldr r2, [r4, #0x14]
	ldr r3, [r4, #0x1c]
	add r1, r4, r1
	bl ov18_021F922C
	mov r0, #0x25
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ov18_021F967C
	str r0, [sp]
	mov r0, #0
	mvn r0, r0
	str r0, [sp, #4]
	mov r0, #0x21
	str r0, [sp, #8]
	mov r0, #0x22
	str r0, [sp, #0xc]
	mov r0, #4
	str r0, [sp, #0x10]
	ldr r0, _021F9104 ; =0x0000C61A
	mov r1, #0x87
	str r0, [sp, #0x14]
	str r0, [sp, #0x18]
	str r0, [sp, #0x1c]
	str r0, [sp, #0x20]
	lsl r1, r1, #2
	add r0, r4, r1
	sub r1, #0x3c
	ldr r2, [r4, #0x14]
	ldr r3, [r4, #0x1c]
	add r1, r4, r1
	bl ov18_021F922C
	mov r0, #0x83
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_0200B12C
	add r2, r0, #0
	lsl r2, r2, #0x14
	ldr r0, [r4, #4]
	mov r1, #2
	lsr r2, r2, #0x10
	mov r3, #0x80
	bl sub_020032A4
	add sp, #0x24
	pop {r3, r4, pc}
	.balign 4, 0
_021F9100: .word 0x0000C619
_021F9104: .word 0x0000C61A
	thumb_func_end ov18_021F9068

	thumb_func_start ov18_021F9108
ov18_021F9108: ; 0x021F9108
	push {r4, lr}
	mov r1, #0x82
	add r4, r0, #0
	lsl r1, r1, #2
	add r0, r4, r1
	sub r1, #0x28
	add r1, r4, r1
	bl ov18_021F92DC
	mov r0, #0x87
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200AEB0
	mov r1, #0x1e
	lsl r1, r1, #4
	ldr r0, [r4, r1]
	add r1, #0x3c
	ldr r1, [r4, r1]
	bl DestroySingle2DGfxResObj
	mov r1, #0x7a
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, #0x3c
	ldr r1, [r4, r1]
	bl DestroySingle2DGfxResObj
	mov r1, #0x7b
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, #0x3c
	ldr r1, [r4, r1]
	bl DestroySingle2DGfxResObj
	pop {r4, pc}
	thumb_func_end ov18_021F9108

	thumb_func_start ov18_021F9150
ov18_021F9150: ; 0x021F9150
	push {r4, r5, lr}
	sub sp, #0x24
	add r5, r0, #0
	bl ov18_021E5900
	ldr r1, [r5, #0x14]
	bl NARC_ctor
	add r4, r0, #0
	mov r0, #0x4d
	str r0, [sp]
	sub r0, #0x4e
	str r0, [sp, #4]
	mov r0, #0x4e
	str r0, [sp, #8]
	mov r0, #0x4f
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, _021F91D8 ; =0x0000C61B
	mov r1, #0x23
	str r0, [sp, #0x14]
	str r0, [sp, #0x18]
	str r0, [sp, #0x1c]
	str r0, [sp, #0x20]
	lsl r1, r1, #4
	add r0, r5, r1
	sub r1, #0x50
	ldr r2, [r5, #0x14]
	ldr r3, [r5, #0x1c]
	add r1, r5, r1
	bl ov18_021F922C
	bl ov18_021E5908
	add r3, r0, #0
	mov r0, #1
	str r0, [sp]
	ldr r0, _021F91D8 ; =0x0000C61B
	add r2, r4, #0
	str r0, [sp, #4]
	mov r0, #0x79
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, #0x14]
	bl ov18_021F92AC
	mov r1, #0x8d
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	mov r1, #1
	bl sub_0200B12C
	add r2, r0, #0
	lsl r2, r2, #0x14
	ldr r0, [r5, #4]
	mov r1, #2
	lsr r2, r2, #0x10
	mov r3, #0x20
	bl sub_020032A4
	add r0, r4, #0
	bl NARC_dtor
	add sp, #0x24
	pop {r4, r5, pc}
	nop
_021F91D8: .word 0x0000C61B
	thumb_func_end ov18_021F9150

	thumb_func_start ov18_021F91DC
ov18_021F91DC: ; 0x021F91DC
	mov r1, #0x23
	add r2, r0, #0
	lsl r1, r1, #4
	add r0, r2, r1
	sub r1, #0x50
	ldr r3, _021F91EC ; =ov18_021F92DC
	add r1, r2, r1
	bx r3
	.balign 4, 0
_021F91EC: .word ov18_021F92DC
	thumb_func_end ov18_021F91DC

	thumb_func_start ov18_021F91F0
ov18_021F91F0: ; 0x021F91F0
	push {r4, lr}
	add r4, r0, #0
	bl ov18_021F959C
	add r0, r4, #0
	bl ov18_021F94A0
	add r0, r4, #0
	bl ov18_021F9508
	add r0, r4, #0
	bl ov18_021F91DC
	add r0, r4, #0
	bl ov18_021F9108
	add r0, r4, #0
	bl ov18_021F9054
	add r0, r4, #0
	bl ov18_021F8F84
	bl ov18_021F8F58
	add r4, #0xb4
	ldr r0, [r4]
	bl sub_02024504
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov18_021F91F0

	thumb_func_start ov18_021F922C
ov18_021F922C: ; 0x021F922C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [sp, #0x34]
	add r7, r3, #0
	add r6, r2, #0
	add r4, r1, #0
	str r0, [sp]
	mov r3, #1
	str r3, [sp, #4]
	str r6, [sp, #8]
	ldr r0, [r4]
	ldr r2, [sp, #0x20]
	add r1, r7, #0
	bl AddCharResObjFromOpenNarc
	str r0, [r5]
	bl sub_0200ADA4
	ldr r0, [r5]
	bl sub_0200A740
	mov r0, #0
	ldr r3, [sp, #0x24]
	mvn r0, r0
	cmp r3, r0
	beq _021F9276
	ldr r0, [sp, #0x30]
	add r1, r6, #0
	str r0, [sp]
	ldr r0, [sp, #0x38]
	add r2, r7, #0
	str r0, [sp, #4]
	ldr r0, [r4, #4]
	bl ov18_021F92AC
	str r0, [r5, #4]
_021F9276:
	ldr r0, [sp, #0x3c]
	ldr r2, [sp, #0x28]
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	str r6, [sp, #8]
	ldr r0, [r4, #8]
	add r1, r7, #0
	mov r3, #1
	bl AddCellOrAnimResObjFromOpenNarc
	str r0, [r5, #8]
	ldr r0, [sp, #0x40]
	ldr r2, [sp, #0x2c]
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	str r6, [sp, #8]
	ldr r0, [r4, #0xc]
	add r1, r7, #0
	mov r3, #1
	bl AddCellOrAnimResObjFromOpenNarc
	str r0, [r5, #0xc]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov18_021F922C

	thumb_func_start ov18_021F92AC
ov18_021F92AC: ; 0x021F92AC
	push {r4, lr}
	sub sp, #0x10
	ldr r4, [sp, #0x1c]
	str r4, [sp]
	mov r4, #1
	str r4, [sp, #4]
	ldr r4, [sp, #0x18]
	str r4, [sp, #8]
	str r1, [sp, #0xc]
	add r1, r2, #0
	add r2, r3, #0
	mov r3, #0
	bl AddPlttResObjFromOpenNarc
	add r4, r0, #0
	bl sub_0200B00C
	add r0, r4, #0
	bl sub_0200A740
	add r0, r4, #0
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov18_021F92AC

	thumb_func_start ov18_021F92DC
ov18_021F92DC: ; 0x021F92DC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	bl sub_0200AEB0
	ldr r0, [r5, #4]
	bl sub_0200B0A8
	ldr r0, [r4]
	ldr r1, [r5]
	bl DestroySingle2DGfxResObj
	ldr r0, [r4, #4]
	ldr r1, [r5, #4]
	bl DestroySingle2DGfxResObj
	ldr r0, [r4, #8]
	ldr r1, [r5, #8]
	bl DestroySingle2DGfxResObj
	ldr r0, [r4, #0xc]
	ldr r1, [r5, #0xc]
	bl DestroySingle2DGfxResObj
	pop {r3, r4, r5, pc}
	thumb_func_end ov18_021F92DC

	thumb_func_start ov18_021F9310
ov18_021F9310: ; 0x021F9310
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	add r7, r2, #0
	add r6, r3, #0
	bl sub_0200A7FC
	str r0, [sp, #0x2c]
	ldr r0, [r5, #4]
	bl sub_0200A7FC
	str r0, [sp, #0x30]
	ldr r0, [r5, #8]
	bl sub_0200A7FC
	str r0, [sp, #0x34]
	ldr r0, [r5, #0xc]
	bl sub_0200A7FC
	str r0, [sp]
	mov r0, #0
	mvn r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r6, [sp, #0x10]
	ldr r1, [r4]
	ldr r2, [sp, #0x30]
	str r1, [sp, #0x14]
	ldr r1, [r4, #4]
	ldr r3, [sp, #0x34]
	str r1, [sp, #0x18]
	ldr r1, [r4, #8]
	str r1, [sp, #0x1c]
	ldr r1, [r4, #0xc]
	str r1, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	ldr r1, [sp, #0x2c]
	add r0, r7, #0
	bl CreateSpriteResourcesHeader
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov18_021F9310

	thumb_func_start ov18_021F9370
ov18_021F9370: ; 0x021F9370
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x70
	mov r1, #0x82
	add r5, r0, #0
	lsl r1, r1, #2
	add r0, r5, r1
	sub r1, #0x28
	add r1, r5, r1
	add r2, sp, #0x2c
	mov r3, #1
	bl ov18_021F9310
	add r0, r5, #0
	add r0, #0xb4
	ldr r0, [r0]
	str r0, [sp, #0x50]
	add r0, sp, #0x2c
	str r0, [sp, #0x54]
	mov r0, #1
	str r0, [sp, #0x68]
	mov r0, #0
	str r0, [sp, #0x64]
	ldr r0, [r5, #0x14]
	str r0, [sp, #0x6c]
	mov r0, #0x2a
	lsl r0, r0, #0xe
	str r0, [sp, #0x58]
	mov r0, #0x12
	lsl r0, r0, #0xe
	str r0, [sp, #0x5c]
	add r0, sp, #0x50
	bl sub_02024714
	mov r1, #0x81
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r1, #0x48
	ldr r0, [r5, r1]
	bl ov18_021F9688
	add r1, r0, #0
	mov r0, #0x81
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02024A48
	mov r0, #0x87
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200A7FC
	add r4, r0, #0
	mov r0, #0x83
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200A7FC
	add r6, r0, #0
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200A7FC
	add r7, r0, #0
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200A7FC
	str r0, [sp]
	mov r0, #0
	mvn r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	mov r0, #0x1e
	lsl r0, r0, #4
	ldr r2, [r5, r0]
	add r3, r7, #0
	str r2, [sp, #0x14]
	add r2, r0, #4
	ldr r2, [r5, r2]
	str r2, [sp, #0x18]
	add r2, r0, #0
	add r2, #8
	ldr r2, [r5, r2]
	add r0, #0xc
	str r2, [sp, #0x1c]
	ldr r0, [r5, r0]
	add r2, r6, #0
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	str r1, [sp, #0x28]
	add r0, sp, #0x2c
	add r1, r4, #0
	bl CreateSpriteResourcesHeader
	add r0, r5, #0
	add r0, #0xb4
	ldr r0, [r0]
	str r0, [sp, #0x50]
	add r0, sp, #0x2c
	str r0, [sp, #0x54]
	mov r0, #1
	str r0, [sp, #0x68]
	mov r0, #0
	str r0, [sp, #0x64]
	ldr r0, [r5, #0x14]
	str r0, [sp, #0x6c]
	mov r0, #0xd9
	lsl r0, r0, #0xc
	str r0, [sp, #0x58]
	mov r0, #0x12
	lsl r0, r0, #0xe
	str r0, [sp, #0x5c]
	add r0, sp, #0x50
	bl sub_02024714
	mov r1, #0x86
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #0
	add r0, #0x38
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _021F947A
	add r1, #0x34
	ldr r1, [r5, r1]
	cmp r1, r0
	bne _021F948A
_021F947A:
	mov r0, #0x86
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add sp, #0x70
	pop {r3, r4, r5, r6, r7, pc}
_021F948A:
	bl ov18_021F9688
	add r1, r0, #0
	mov r0, #0x86
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02024A48
	add sp, #0x70
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov18_021F9370

	thumb_func_start ov18_021F94A0
ov18_021F94A0: ; 0x021F94A0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x81
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02024758
	mov r0, #0x86
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02024758
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov18_021F94A0

	thumb_func_start ov18_021F94BC
ov18_021F94BC: ; 0x021F94BC
	push {r3, r4, lr}
	sub sp, #0x44
	mov r1, #0x7d
	add r4, r0, #0
	lsl r1, r1, #2
	add r0, r4, r1
	sub r1, #0x14
	add r1, r4, r1
	add r2, sp, #0
	mov r3, #1
	bl ov18_021F9310
	add r0, r4, #0
	add r0, #0xb4
	ldr r0, [r0]
	mov r1, #1
	str r0, [sp, #0x24]
	add r0, sp, #0
	str r0, [sp, #0x28]
	mov r0, #0
	str r1, [sp, #0x3c]
	str r0, [sp, #0x38]
	ldr r0, [r4, #0x14]
	str r0, [sp, #0x40]
	mov r0, #7
	lsl r0, r0, #0x10
	str r0, [sp, #0x2c]
	lsl r0, r1, #0x11
	str r0, [sp, #0x30]
	add r0, sp, #0x24
	bl sub_02024714
	mov r1, #0x1f
	lsl r1, r1, #4
	str r0, [r4, r1]
	add sp, #0x44
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov18_021F94BC

	thumb_func_start ov18_021F9508
ov18_021F9508: ; 0x021F9508
	mov r1, #0x1f
	lsl r1, r1, #4
	ldr r3, _021F9514 ; =sub_02024758
	ldr r0, [r0, r1]
	bx r3
	nop
_021F9514: .word sub_02024758
	thumb_func_end ov18_021F9508

	thumb_func_start ov18_021F9518
ov18_021F9518: ; 0x021F9518
	push {r4, r5, lr}
	sub sp, #0x44
	mov r1, #0x23
	add r5, r0, #0
	lsl r1, r1, #4
	add r0, r5, r1
	sub r1, #0x50
	add r1, r5, r1
	add r2, sp, #0
	mov r3, #1
	bl ov18_021F9310
	add r0, r5, #0
	add r0, #0xb4
	ldr r0, [r0]
	str r0, [sp, #0x24]
	add r0, sp, #0
	str r0, [sp, #0x28]
	mov r0, #1
	str r0, [sp, #0x3c]
	mov r0, #0
	str r0, [sp, #0x38]
	ldr r0, [r5, #0x14]
	str r0, [sp, #0x40]
	mov r0, #0x1e
	lsl r0, r0, #0xe
	str r0, [sp, #0x2c]
	mov r0, #5
	lsl r0, r0, #0x10
	str r0, [sp, #0x30]
	add r0, sp, #0x24
	bl sub_02024714
	mov r1, #0x8b
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r1, #0x18
	ldr r0, [r5, r1]
	ldr r1, [r5, #0x14]
	bl ov18_021F9694
	add r4, r0, #0
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02024B1C
	mov r1, #1
	bl NNS_G2dGetImageLocation
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #0x80
	bl DC_FlushRange
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0x80
	bl GX_LoadOBJ
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x44
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov18_021F9518

	thumb_func_start ov18_021F959C
ov18_021F959C: ; 0x021F959C
	mov r1, #0x8b
	lsl r1, r1, #2
	ldr r3, _021F95A8 ; =sub_02024758
	ldr r0, [r0, r1]
	bx r3
	nop
_021F95A8: .word sub_02024758
	thumb_func_end ov18_021F959C

	thumb_func_start ov18_021F95AC
ov18_021F95AC: ; 0x021F95AC
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	mov r6, #0x1f
	add r5, r0, #0
	add r7, r4, #0
	lsl r6, r6, #4
_021F95B8:
	ldr r0, [r5, r6]
	add r1, r7, #0
	bl Set2dSpriteVisibleFlag
	add r4, r4, #1
	add r5, #0x14
	cmp r4, #4
	blo _021F95B8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov18_021F95AC

	thumb_func_start ov18_021F95CC
ov18_021F95CC: ; 0x021F95CC
	push {r4, lr}
	sub sp, #0x20
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	add r0, sp, #0x10
	mov r2, #2
	bl GetPokemonSpriteCharAndPlttNarcIds
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r4, #8]
	add r1, sp, #0x10
	mov r2, #0x30
	mov r3, #0x48
	bl sub_020085EC
	str r0, [r4, #0x20]
	add sp, #0x20
	pop {r4, pc}
	thumb_func_end ov18_021F95CC

	thumb_func_start ov18_021F95F8
ov18_021F95F8: ; 0x021F95F8
	ldr r0, [r0, #0x20]
	bx lr
	thumb_func_end ov18_021F95F8

	thumb_func_start ov18_021F95FC
ov18_021F95FC: ; 0x021F95FC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r0, #0
	ldr r0, [sp, #0x30]
	add r7, r1, #0
	add r5, r2, #0
	add r4, r3, #0
	cmp r0, #1
	bne _021F961A
	ldr r0, [sp, #0x28]
	mov r2, #0
	bl FontID_String_GetWidth
	sub r5, r5, r0
	b _021F962A
_021F961A:
	cmp r0, #2
	bne _021F962A
	ldr r0, [sp, #0x28]
	mov r2, #0
	bl FontID_String_GetWidth
	lsr r0, r0, #1
	sub r5, r5, r0
_021F962A:
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
	thumb_func_end ov18_021F95FC

	thumb_func_start ov18_021F9648
ov18_021F9648: ; 0x021F9648
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	add r6, r3, #0
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r0, [sp, #0x24]
	ldr r3, [sp, #0x20]
	str r0, [sp]
	ldr r0, [sp, #0x28]
	add r1, r4, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	add r2, r6, #0
	str r0, [sp, #8]
	add r0, r5, #0
	bl ov18_021F95FC
	add r0, r4, #0
	bl String_dtor
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov18_021F9648

	thumb_func_start ov18_021F967C
ov18_021F967C: ; 0x021F967C
	lsl r1, r0, #2
	ldr r0, _021F9684 ; =_021FBE10
	ldr r0, [r0, r1]
	bx lr
	.balign 4, 0
_021F9684: .word _021FBE10
	thumb_func_end ov18_021F967C

	thumb_func_start ov18_021F9688
ov18_021F9688: ; 0x021F9688
	ldr r1, _021F9690 ; =_021FBDFC
	ldrb r0, [r1, r0]
	bx lr
	nop
_021F9690: .word _021FBDFC
	thumb_func_end ov18_021F9688

	thumb_func_start ov18_021F9694
ov18_021F9694: ; 0x021F9694
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	bl ov18_021E5900
	add r6, r0, #0
	add r0, r5, #0
	bl ov18_021E5904
	add r1, r0, #0
	str r4, [sp]
	add r0, r6, #0
	mov r2, #1
	add r3, sp, #4
	bl GfGfxLoader_GetCharData
	add r6, r0, #0
	ldr r0, [sp, #4]
	mov r1, #0x80
	ldr r5, [r0, #0x14]
	add r0, r4, #0
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x80
	add r4, r0, #0
	bl memset
	add r1, r5, #0
	add r0, r4, #0
	add r1, #0x80
	mov r2, #0x40
	bl memcpy
	add r0, r4, #0
	add r0, #0x40
	add r1, r5, #0
	mov r2, #0x40
	bl memcpy
	add r0, r6, #0
	bl FreeToHeap
	add r0, r4, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov18_021F9694

	.rodata

_021F96F4:
	.byte 0x36, 0x03, 0x00, 0x00, 0x31, 0x03, 0x00, 0x00, 0x32, 0x03, 0x00, 0x00
	.byte 0x33, 0x03, 0x00, 0x00, 0x34, 0x03, 0x00, 0x00, 0x35, 0x03, 0x00, 0x00
_021F970C:
	.byte 0x3C, 0x03, 0x00, 0x00
	.byte 0x37, 0x03, 0x00, 0x00, 0x38, 0x03, 0x00, 0x00, 0x39, 0x03, 0x00, 0x00, 0x3A, 0x03, 0x00, 0x00
	.byte 0x3B, 0x03, 0x00, 0x00
_021F9724:
	.byte 0x2A, 0x03, 0x00, 0x00, 0x25, 0x03, 0x00, 0x00, 0x26, 0x03, 0x00, 0x00
	.byte 0x27, 0x03, 0x00, 0x00, 0x28, 0x03, 0x00, 0x00, 0x29, 0x03, 0x00, 0x00
_021F973C:
	.byte 0x64, 0x0A, 0x01, 0x00
_021F9740:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021F9750:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021F9760:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021F9770:
	.byte 0x06, 0x08, 0x07, 0x02
_021F9774:
	.byte 0x13, 0x08, 0x07, 0x02, 0x06, 0x0F, 0x07, 0x02, 0x13, 0x0F, 0x07, 0x02
_021F9780:
	.byte 0x03, 0x06, 0x0B, 0x02, 0x12, 0x06, 0x0B, 0x02, 0x03, 0x0A, 0x0B, 0x02, 0x12, 0x0A, 0x0B, 0x02
	.byte 0x03, 0x0E, 0x0B, 0x02, 0x12, 0x0E, 0x0B, 0x02
_021F9798:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x05, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_021F97B4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021F97D0:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1B, 0x06, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021F97EC:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x1E, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021F9808:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x1B, 0x06, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_021F9824:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1B, 0x06, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021F9840:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x1E, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021F985C:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021F9878:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1B, 0x06, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_021F9894:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x05, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021F98B0:
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
_021F98D8:
	.byte 0xFF, 0xFF, 0x9B, 0x00, 0x71, 0x00, 0x63, 0x00
	.byte 0xB1, 0x00, 0x75, 0x00, 0x60, 0x00, 0x07, 0x00, 0x4C, 0x01, 0x79, 0x00, 0x77, 0x00, 0x78, 0x00
	.byte 0xFD, 0x00, 0xB0, 0x00, 0xC1, 0x01, 0x92, 0x00, 0xCE, 0x01, 0x17, 0x01, 0x56, 0x01, 0xF0, 0x00
	.byte 0x6C, 0x00, 0x7C, 0x00, 0x7E, 0x00, 0x6A, 0x00, 0x93, 0x00, 0x91, 0x00
_021F990C:
	.byte 0x00, 0x05, 0x08, 0x02
	.byte 0x08, 0x05, 0x08, 0x02, 0x10, 0x05, 0x08, 0x02, 0x18, 0x05, 0x08, 0x02, 0x00, 0x08, 0x08, 0x02
	.byte 0x08, 0x08, 0x08, 0x02, 0x10, 0x08, 0x08, 0x02, 0x18, 0x08, 0x08, 0x02, 0x00, 0x0B, 0x08, 0x02
	.byte 0x08, 0x0B, 0x08, 0x02, 0x10, 0x0B, 0x08, 0x02, 0x18, 0x0B, 0x08, 0x02, 0x00, 0x0E, 0x08, 0x02
	.byte 0x08, 0x0E, 0x08, 0x02, 0x10, 0x0E, 0x08, 0x02, 0x18, 0x0E, 0x08, 0x02, 0x00, 0x11, 0x08, 0x02
	.byte 0x08, 0x11, 0x08, 0x02
_021F9954:
	.byte 0xFF, 0xFF, 0x3C, 0x00, 0x21, 0x00, 0x43, 0x00, 0x22, 0x00, 0x23, 0x00
	.byte 0x49, 0x00, 0x24, 0x00, 0x25, 0x00, 0x26, 0x00, 0x27, 0x00, 0x28, 0x00, 0x29, 0x00, 0x4E, 0x00
	.byte 0x2A, 0x00, 0x2B, 0x00, 0x4D, 0x00, 0x5E, 0x00, 0x5F, 0x00, 0x4B, 0x00, 0x2C, 0x00, 0x2D, 0x00
	.byte 0x58, 0x00, 0x2E, 0x00, 0x59, 0x00, 0x2F, 0x00, 0x30, 0x00, 0x97, 0x00, 0x5A, 0x00, 0x14, 0x00
	.byte 0x5B, 0x00, 0x5C, 0x00, 0x31, 0x00, 0x32, 0x00, 0x34, 0x00, 0x36, 0x00, 0x37, 0x00, 0x38, 0x00
	.byte 0x39, 0x00, 0x98, 0x00, 0x1E, 0x00, 0x1F, 0x00, 0x20, 0x00, 0x09, 0x00, 0x0A, 0x00, 0x0B, 0x00
	.byte 0x0C, 0x00, 0x0D, 0x00, 0x0E, 0x00, 0x0F, 0x00, 0x10, 0x00, 0x11, 0x00, 0x12, 0x00, 0x13, 0x00
	.byte 0x15, 0x00, 0x16, 0x00, 0x17, 0x00, 0xA6, 0x01, 0x19, 0x00, 0x1A, 0x00, 0x5D, 0x00, 0x1B, 0x00
	.byte 0x1C, 0x00, 0x1D, 0x00, 0x9E, 0x01, 0x33, 0x00, 0x4A, 0x00, 0xAE, 0x00, 0x18, 0x00, 0xFF, 0xFF
_021F99E0:
	.byte 0x09, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x9E, 0x01, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00
	.byte 0xA6, 0x01, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00
	.byte 0x5B, 0x00, 0x00, 0x00, 0x5C, 0x00, 0x00, 0x00, 0x5D, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00
	.byte 0x1C, 0x00, 0x00, 0x00, 0x1D, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x21, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00, 0x23, 0x00, 0x00, 0x00
	.byte 0x24, 0x00, 0x00, 0x00, 0x25, 0x00, 0x00, 0x00, 0x26, 0x00, 0x00, 0x00, 0x27, 0x00, 0x00, 0x00
	.byte 0x28, 0x00, 0x00, 0x00, 0x29, 0x00, 0x00, 0x00, 0x2A, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x00, 0x00
	.byte 0x5E, 0x00, 0x00, 0x00, 0x5F, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x2D, 0x00, 0x00, 0x00
	.byte 0x2E, 0x00, 0x00, 0x00, 0x2F, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x97, 0x00, 0x00, 0x00
	.byte 0x98, 0x00, 0x00, 0x00, 0x4A, 0x00, 0x00, 0x00, 0x4C, 0x01, 0x00, 0x00, 0x4D, 0x01, 0x00, 0x00
	.byte 0x4E, 0x01, 0x00, 0x00, 0x4F, 0x01, 0x00, 0x00, 0x50, 0x01, 0x00, 0x00, 0x51, 0x01, 0x00, 0x00
	.byte 0x52, 0x01, 0x00, 0x00, 0x53, 0x01, 0x00, 0x00, 0x55, 0x01, 0x00, 0x00, 0x59, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0xD9, 0x00, 0x00, 0x00, 0x37, 0x00, 0x00, 0x00, 0x91, 0x00, 0x00, 0x00
	.byte 0xC2, 0x01, 0x00, 0x00, 0xC3, 0x01, 0x00, 0x00, 0x34, 0x00, 0x00, 0x00, 0x43, 0x00, 0x00, 0x00
	.byte 0x4B, 0x00, 0x00, 0x00, 0x39, 0x00, 0x00, 0x00, 0x56, 0x01, 0x00, 0x00, 0x17, 0x01, 0x00, 0x00
	.byte 0x6A, 0x00, 0x00, 0x00, 0x7B, 0x00, 0x00, 0x00, 0xB0, 0x00, 0x00, 0x00, 0xFD, 0x00, 0x00, 0x00
	.byte 0x4E, 0x00, 0x00, 0x00, 0x38, 0x00, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00, 0xED, 0x00, 0x00, 0x00
	.byte 0xEE, 0x00, 0x00, 0x00, 0xEF, 0x00, 0x00, 0x00, 0x75, 0x00, 0x00, 0x00, 0x58, 0x00, 0x00, 0x00
	.byte 0x6B, 0x00, 0x00, 0x00, 0xC0, 0x01, 0x00, 0x00, 0xC1, 0x01, 0x00, 0x00, 0x01, 0x02, 0x00, 0x00
	.byte 0x77, 0x00, 0x00, 0x00, 0xFA, 0x00, 0x00, 0x00, 0xFB, 0x00, 0x00, 0x00, 0xFC, 0x00, 0x00, 0x00
	.byte 0x5A, 0x00, 0x00, 0x00, 0x7A, 0x00, 0x00, 0x00, 0xCB, 0x01, 0x00, 0x00, 0xCC, 0x01, 0x00, 0x00
	.byte 0xCD, 0x01, 0x00, 0x00, 0xCE, 0x01, 0x00, 0x00, 0xCF, 0x01, 0x00, 0x00, 0xD0, 0x01, 0x00, 0x00
	.byte 0x60, 0x00, 0x00, 0x00, 0xE7, 0x01, 0x00, 0x00, 0x3C, 0x00, 0x00, 0x00, 0xF0, 0x00, 0x00, 0x00
	.byte 0x4D, 0x00, 0x00, 0x00, 0x31, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x00, 0x6C, 0x00, 0x00, 0x00
	.byte 0xC4, 0x01, 0x00, 0x00, 0x71, 0x00, 0x00, 0x00, 0x3B, 0x01, 0x00, 0x00, 0xEA, 0x01, 0x00, 0x00
	.byte 0xEB, 0x01, 0x00, 0x00, 0xEC, 0x01, 0x00, 0x00, 0xB1, 0x00, 0x00, 0x00, 0xB5, 0x00, 0x00, 0x00
	.byte 0x65, 0x01, 0x00, 0x00, 0xAE, 0x00, 0x00, 0x00, 0x92, 0x00, 0x00, 0x00, 0xC5, 0x01, 0x00, 0x00
	.byte 0xC6, 0x01, 0x00, 0x00, 0xC7, 0x01, 0x00, 0x00, 0xC8, 0x01, 0x00, 0x00, 0x9B, 0x00, 0x00, 0x00
	.byte 0x9C, 0x00, 0x00, 0x00, 0x7E, 0x00, 0x00, 0x00, 0x2A, 0x01, 0x00, 0x00, 0x63, 0x00, 0x00, 0x00
	.byte 0x99, 0x00, 0x00, 0x00, 0x9A, 0x00, 0x00, 0x00, 0x36, 0x00, 0x00, 0x00, 0x7C, 0x00, 0x00, 0x00
	.byte 0xB2, 0x00, 0x00, 0x00, 0xB3, 0x00, 0x00, 0x00, 0x49, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00
	.byte 0x93, 0x00, 0x00, 0x00, 0x79, 0x00, 0x00, 0x00, 0xF2, 0x00, 0x00, 0x00, 0xF3, 0x00, 0x00, 0x00
	.byte 0xE6, 0x01, 0x00, 0x00, 0xF4, 0x00, 0x00, 0x00
_021F9C18:
	.byte 0x01, 0x02, 0x03, 0x04, 0x05, 0x07, 0x00, 0x00
_021F9C20:
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F
	.byte 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1B, 0x00
_021F9C3C:
	.word ov18_021E8C30
	.word ov18_021E8D38
	.word ov18_021E8DB0
	.word ov18_021E8DC8
	.word ov18_021E8DE8
	.word ov18_021E8E8C
	.word ov18_021E8ECC
	.word ov18_021E8FCC
	.word ov18_021E9070
	.word ov18_021E918C
	.word ov18_021E92AC
	.word ov18_021E93D8
	.word ov18_021E9600
	.word ov18_021E96F4
	.word ov18_021E9820
	.word ov18_021E9940
	.word ov18_021E99C8
	.word ov18_021E9A4C
	.word ov18_021E9BE0
	.word ov18_021EA430
	.word ov18_021EA5A8
	.word ov18_021E9CD8
	.word ov18_021E9D70
	.word ov18_021E9F28
	.word ov18_021EA36C
	.word ov18_021EA384
	.word ov18_021EA688
	.word ov18_021EA760
	.word ov18_021EA838
	.word ov18_021EA854
	.word ov18_021EA95C
	.word ov18_021EA96C
	.word ov18_021EA988
	.word ov18_021EAA20
	.word ov18_021EAA30
	.word ov18_021EAA58
	.word ov18_021EAB7C
	.word ov18_021EAB8C
	.word ov18_021EABB4
	.word ov18_021EAE44
	.word ov18_021EAE54
	.word ov18_021EAF18
	.word ov18_021EAFDC
	.word ov18_021EB034
	.word ov18_021EB08C
	.word ov18_021EB0B0
	.word ov18_021EB270
	.word ov18_021EB280
	.word ov18_021EB348
	.word ov18_021EB41C
	.word ov18_021EB474
	.word ov18_021EB4CC
	.word ov18_021EB4E8
	.word ov18_021EB580
	.word ov18_021EB590
	.word ov18_021EB5AC
	.word ov18_021EB644
	.word ov18_021EB654
	.word ov18_021EB838
	.word ov18_021EB988
	.word ov18_021EBAC4
	.word ov18_021EBB68
	.word ov18_021EBC08
	.word ov18_021EBD28
	.word ov18_021EBEC8
	.word ov18_021EBFC0
	.word ov18_021EC280
	.word ov18_021EC2C4
	.word ov18_021EC3E8
	.word ov18_021EC4FC
	.word ov18_021EC7AC
	.word ov18_021EC88C
	.word ov18_021EC95C
	.word ov18_021ECA2C
	.word ov18_021ECA90
	.word ov18_021ECAEC
	.word ov18_021ECC00
	.word ov18_021ECCB0
	.word ov18_021ECDC8
	.word ov18_021ECEA0
	.word ov18_021ECF58
	.word ov18_021ED15C
	.word ov18_021ED224
	.word ov18_021ED304
	.word ov18_021ED3E8
	.word ov18_021ED450
	.word ov18_021ED4B4
	.word ov18_021ED5FC
	.word ov18_021ED7BC
	.word ov18_021ED8E4
	.word ov18_021ED98C
	.word ov18_021EDA60
	.word ov18_021EDB28
_021F9DB0:
	.byte 0x05, 0x02, 0x00, 0x09, 0x02, 0x02, 0xEE, 0x03, 0x01, 0x0A, 0x0A, 0x0F, 0x02, 0x01, 0xE2, 0x01
_021F9DC0:
	.byte 0x3A, 0x00, 0x32, 0x00, 0x3C, 0x00, 0x38, 0x00, 0x36, 0x00, 0x30, 0x00, 0x3F, 0x00, 0x35, 0x00
	.byte 0x3B, 0x00, 0x3D, 0x00, 0x3E, 0x00, 0x33, 0x00, 0x37, 0x00, 0x31, 0x00, 0x34, 0x00, 0x39, 0x00
	.byte 0x2F, 0x00, 0x40, 0x00
_021F9DE4:
	.byte 0x05, 0x02, 0x00, 0x09, 0x02, 0x02, 0xEE, 0x03, 0x05, 0x04, 0x03, 0x08
	.byte 0x02, 0x01, 0xDE, 0x03, 0x05, 0x14, 0x03, 0x08, 0x02, 0x01, 0xCE, 0x03, 0x05, 0x0A, 0x06, 0x0C
	.byte 0x02, 0x01, 0xB6, 0x03, 0x05, 0x02, 0x15, 0x04, 0x02, 0x02, 0xAE, 0x03, 0x05, 0x07, 0x15, 0x08
	.byte 0x02, 0x02, 0x9E, 0x03, 0x05, 0x11, 0x15, 0x04, 0x02, 0x02, 0x96, 0x03, 0x05, 0x16
_021F9E1E:
	.byte 0x15, 0x08
	.byte 0x02, 0x02, 0x86, 0x03, 0x01, 0x0A, 0x01, 0x0C, 0x02, 0x01, 0xE8, 0x01, 0x01, 0x02, 0x11, 0x04
	.byte 0x02, 0x01, 0xE0, 0x01, 0x01, 0x07, 0x11, 0x08, 0x02, 0x01, 0xD0, 0x01, 0x01, 0x11, 0x11, 0x04
	.byte 0x02, 0x01, 0xC8, 0x01, 0x01, 0x16, 0x11, 0x08, 0x02, 0x01, 0xB0, 0x01
_021F9E4C:
	.byte 0x05, 0x02, 0x00, 0x09
	.byte 0x02, 0x02, 0xEE, 0x01, 0x05, 0x01, 0x03, 0x07, 0x02, 0x01, 0xE0, 0x01, 0x05, 0x00, 0x10, 0x09
	.byte 0x02, 0x01, 0xCE, 0x01, 0x05, 0x0D, 0x0C, 0x0E, 0x02, 0x01, 0xB2, 0x01, 0x01, 0x01, 0x05, 0x06
	.byte 0x02, 0x01, 0xF4, 0x01, 0x01, 0x09, 0x01, 0x07, 0x02, 0x01, 0xE6, 0x01, 0x01, 0x12, 0x01, 0x07
	.byte 0x02, 0x01, 0xE6, 0x01, 0x01, 0x18, 0x01, 0x07, 0x02, 0x01, 0xD8, 0x01, 0x02, 0x0A, 0x05, 0x12
	.byte 0x02, 0x01, 0xDC, 0x01, 0x02, 0x0A, 0x08, 0x12, 0x02, 0x01, 0xB8, 0x01, 0x02, 0x0A, 0x0B, 0x12
	.byte 0x02, 0x01, 0x94, 0x01, 0x02, 0x0A, 0x0E, 0x12, 0x02, 0x01, 0x70, 0x01, 0x02, 0x0A, 0x11, 0x12
	.byte 0x02, 0x01, 0x4C, 0x01, 0x02, 0x0A, 0x14, 0x12, 0x02, 0x01, 0x28, 0x01
_021F9EBC:
	.byte 0x05, 0x02, 0x00, 0x09
	.byte 0x02, 0x02, 0xEE, 0x03, 0x05, 0x04, 0x05, 0x09, 0x02, 0x01, 0xDC, 0x03, 0x05, 0x0D, 0x05, 0x0F
	.byte 0x02, 0x01, 0xBE, 0x03, 0x05, 0x07, 0x05, 0x12, 0x02, 0x01, 0x9A, 0x03, 0x01, 0x15, 0x11, 0x0A
	.byte 0x02, 0x01, 0xEC, 0x01, 0x01, 0x0D, 0x02, 0x06, 0x02, 0x01, 0xE0, 0x01, 0x01, 0x00, 0x0C, 0x10
	.byte 0x02, 0x01, 0xC0, 0x01, 0x01, 0x10, 0x0C, 0x10, 0x02, 0x01, 0xA0, 0x01, 0x01, 0x03, 0x14, 0x0C
	.byte 0x03, 0x01, 0x7C, 0x01, 0x01, 0x12, 0x14, 0x0C, 0x03, 0x01, 0x58, 0x01, 0x02, 0x08, 0x01, 0x12
	.byte 0x02, 0x01, 0xDC, 0x01, 0x02, 0x08, 0x04, 0x12, 0x02, 0x01, 0xB8, 0x01, 0x02, 0x08, 0x07, 0x12
	.byte 0x02, 0x01, 0x94, 0x01, 0x02, 0x08, 0x0A, 0x12, 0x02, 0x01, 0x70, 0x01, 0x02, 0x08, 0x0D, 0x12
	.byte 0x02, 0x01, 0x4C, 0x01, 0x02, 0x08, 0x10, 0x12, 0x02, 0x01, 0x28, 0x01
_021F9F3C:
	.byte 0x00, 0x02, 0x09, 0x0C
	.byte 0x02, 0x09, 0xE8, 0x03, 0x00, 0x12, 0x09, 0x0C, 0x02, 0x09, 0xD0, 0x03, 0x00, 0x0B, 0x0B, 0x03
	.byte 0x02, 0x09, 0xCA, 0x03, 0x00, 0x0B, 0x0B, 0x03, 0x02, 0x09, 0xC4, 0x03, 0x00, 0x1B, 0x0B, 0x03
	.byte 0x02, 0x09, 0xBE, 0x03, 0x00, 0x1B, 0x0B, 0x03, 0x02, 0x09, 0xB8, 0x03, 0x01, 0x0A, 0x10, 0x0B
	.byte 0x02, 0x00, 0xEA, 0x01, 0x05, 0x02, 0x00, 0x08, 0x02, 0x02, 0xF0, 0x03, 0x05, 0x0F, 0x03, 0x04
	.byte 0x02, 0x00, 0xE8, 0x03, 0x05, 0x13, 0x03, 0x09, 0x02, 0x00, 0xD6, 0x03, 0x05, 0x0D, 0x05, 0x12
	.byte 0x02, 0x00, 0xB2, 0x03, 0x05, 0x02, 0x11, 0x1C, 0x06, 0x01, 0x0A, 0x03, 0x05, 0x12, 0x0B, 0x05
	.byte 0x02, 0x01, 0x00, 0x03, 0x05, 0x17, 0x0B, 0x08, 0x02, 0x01, 0xF0, 0x02, 0x05, 0x12, 0x0D, 0x05
	.byte 0x02, 0x01, 0xE6, 0x02, 0x05, 0x17, 0x0D, 0x08, 0x02, 0x01, 0xD6, 0x02, 0x05, 0x10, 0x08, 0x0E
	.byte 0x02, 0x01, 0xB6, 0x02, 0x05, 0x10, 0x0B, 0x03, 0x02, 0x01, 0xB0, 0x02, 0x05, 0x14, 0x0B, 0x08
	.byte 0x02, 0x01, 0xA0, 0x02, 0x05, 0x0F, 0x0D, 0x10, 0x02, 0x01, 0x80, 0x02
_021F9FDC:
	.byte 0x05, 0x02, 0x13, 0x1C
	.byte 0x05, 0x02, 0x74, 0x01, 0x05, 0x04, 0x01, 0x09, 0x02, 0x02, 0x62, 0x01, 0x05, 0x01, 0x04, 0x05
	.byte 0x02, 0x02, 0x58, 0x01, 0x05, 0x01, 0x07, 0x05, 0x02, 0x02, 0x4E, 0x01, 0x05, 0x01, 0x0A, 0x05
	.byte 0x02, 0x02, 0x44, 0x01, 0x05, 0x01, 0x0D, 0x05, 0x02, 0x02, 0x3A, 0x01, 0x05, 0x01, 0x10, 0x05
	.byte 0x02, 0x02, 0x30, 0x01, 0x05, 0x19, 0x04, 0x06, 0x02, 0x02, 0x24, 0x01, 0x05, 0x10, 0x01, 0x0B
	.byte 0x02, 0x02, 0x0E, 0x01, 0x05, 0x07, 0x04, 0x09, 0x02, 0x02, 0xFC, 0x00, 0x05, 0x07, 0x07, 0x08
	.byte 0x02, 0x02, 0xEC, 0x00, 0x05, 0x0F, 0x07, 0x08, 0x02, 0x02, 0xDC, 0x00, 0x05, 0x07, 0x0A, 0x06
	.byte 0x02, 0x02, 0xD0, 0x00, 0x05, 0x0F, 0x0A, 0x06, 0x02, 0x02, 0xC4, 0x00, 0x05, 0x07, 0x0D, 0x09
	.byte 0x02, 0x02, 0xB2, 0x00, 0x05, 0x12, 0x0D, 0x09, 0x02, 0x02, 0xA0, 0x00, 0x05, 0x07, 0x10, 0x07
	.byte 0x02, 0x02, 0x92, 0x00, 0x01, 0x01, 0x01, 0x08, 0x02, 0x04, 0xF0, 0x01, 0x01, 0x0C, 0x01, 0x08
	.byte 0x02, 0x04, 0xE0, 0x01, 0x01, 0x17, 0x01, 0x08, 0x02, 0x04, 0xD0, 0x01, 0x00, 0x04, 0x01, 0x09
	.byte 0x02, 0x02, 0x62, 0x01, 0x00, 0x01, 0x04, 0x05, 0x02, 0x02, 0x58, 0x01, 0x00, 0x01, 0x07, 0x05
	.byte 0x02, 0x02, 0x4E, 0x01, 0x00, 0x01, 0x0A, 0x05, 0x02, 0x02, 0x44, 0x01, 0x00, 0x01, 0x0D, 0x05
	.byte 0x02, 0x02, 0x3A, 0x01, 0x00, 0x01, 0x10, 0x05, 0x02, 0x02, 0x30, 0x01, 0x00, 0x19, 0x04, 0x06
	.byte 0x02, 0x02, 0x24, 0x01, 0x00, 0x10, 0x01, 0x0B, 0x02, 0x02, 0x0E, 0x01, 0x00, 0x07, 0x04, 0x09
	.byte 0x02, 0x02, 0xFC, 0x00, 0x00, 0x07, 0x07, 0x08, 0x02, 0x02, 0xEC, 0x00, 0x00, 0x0F, 0x07, 0x08
	.byte 0x02, 0x02, 0xDC, 0x00, 0x00, 0x07, 0x0A, 0x06, 0x02, 0x02, 0xD0, 0x00, 0x00, 0x0F, 0x0A, 0x06
	.byte 0x02, 0x02, 0xC4, 0x00, 0x00, 0x07, 0x0D, 0x09, 0x02, 0x02, 0xB2, 0x00, 0x00, 0x12, 0x0D, 0x09
	.byte 0x02, 0x02, 0xA0, 0x00, 0x00, 0x07, 0x10, 0x07, 0x02, 0x02, 0x92, 0x00, 0x00, 0x03, 0x01, 0x0B
	.byte 0x02, 0x02, 0xEA, 0x01, 0x00, 0x12, 0x01, 0x0B, 0x02, 0x02, 0xD4, 0x01, 0x00, 0x03, 0x06, 0x0B
	.byte 0x02, 0x02, 0xBE, 0x01, 0x00, 0x12, 0x06, 0x0B, 0x02, 0x02, 0xA8, 0x01, 0x00, 0x03, 0x0A, 0x0B
	.byte 0x02, 0x02, 0x92, 0x01, 0x00, 0x12, 0x0A, 0x0B, 0x02, 0x02, 0x7C, 0x01, 0x00, 0x03, 0x0E, 0x0B
	.byte 0x02, 0x02, 0x66, 0x01, 0x00, 0x12, 0x0E, 0x0B, 0x02, 0x02, 0x50, 0x01, 0x00, 0x03, 0x01, 0x07
	.byte 0x02, 0x02, 0xF2, 0x01, 0x00, 0x0D, 0x01, 0x08, 0x02, 0x02, 0xE2, 0x01, 0x00, 0x15, 0x01, 0x08
	.byte 0x02, 0x02, 0xD2, 0x01, 0x00, 0x00, 0x05, 0x08, 0x02, 0x02, 0xC2, 0x01, 0x00, 0x08, 0x05, 0x08
	.byte 0x02, 0x02, 0xB2, 0x01, 0x00, 0x10, 0x05, 0x08, 0x02, 0x02, 0xA2, 0x01, 0x00, 0x18, 0x05, 0x08
	.byte 0x02, 0x02, 0x92, 0x01, 0x00, 0x00, 0x08, 0x08, 0x02, 0x02, 0x82, 0x01, 0x00, 0x08, 0x08, 0x08
	.byte 0x02, 0x02, 0x72, 0x01, 0x00, 0x10, 0x08, 0x08, 0x02, 0x02, 0x62, 0x01, 0x00, 0x18, 0x08, 0x08
	.byte 0x02, 0x02, 0x52, 0x01, 0x00, 0x00, 0x0B, 0x08, 0x02, 0x02, 0x42, 0x01, 0x00, 0x08, 0x0B, 0x08
	.byte 0x02, 0x02, 0x32, 0x01, 0x00, 0x10, 0x0B, 0x08, 0x02, 0x02, 0x22, 0x01, 0x00, 0x18, 0x0B, 0x08
	.byte 0x02, 0x02, 0x12, 0x01, 0x00, 0x00, 0x0E, 0x08, 0x02, 0x02, 0x02, 0x01, 0x00, 0x08, 0x0E, 0x08
	.byte 0x02, 0x02, 0xF2, 0x00, 0x00, 0x10, 0x0E, 0x08, 0x02, 0x02, 0xE2, 0x00, 0x00, 0x18, 0x0E, 0x08
	.byte 0x02, 0x02, 0xD2, 0x00, 0x00, 0x00, 0x11, 0x08, 0x02, 0x02, 0xC2, 0x00, 0x00, 0x08, 0x11, 0x08
	.byte 0x02, 0x02, 0xB2, 0x00, 0x00, 0x07, 0x01, 0x06, 0x02, 0x02, 0xF4, 0x01, 0x00, 0x0F, 0x01, 0x09
	.byte 0x02, 0x02, 0xE2, 0x01, 0x00, 0x01, 0x05, 0x1D, 0x0E, 0x02, 0x4C, 0x00, 0x00, 0x03, 0x01, 0x05
	.byte 0x02, 0x02, 0xF6, 0x01, 0x00, 0x0A, 0x01, 0x07, 0x02, 0x02, 0xE8, 0x01, 0x00, 0x13, 0x01, 0x07
	.byte 0x02, 0x02, 0xDA, 0x01, 0x00, 0x01, 0x01, 0x06, 0x02, 0x02, 0xF4, 0x01, 0x00, 0x08, 0x01, 0x09
	.byte 0x02, 0x02, 0xE2, 0x01, 0x00, 0x13, 0x01, 0x09, 0x02, 0x02, 0xD0, 0x01, 0x00, 0x07, 0x01, 0x06
	.byte 0x02, 0x02, 0xF4, 0x01, 0x00, 0x10, 0x01, 0x07, 0x02, 0x02, 0xE6, 0x01, 0x00, 0x06, 0x08, 0x07
	.byte 0x02, 0x02, 0xD8, 0x01, 0x00, 0x13, 0x08, 0x07, 0x02, 0x02, 0xCA, 0x01, 0x00, 0x06, 0x0F, 0x07
	.byte 0x02, 0x02, 0xBC, 0x01, 0x00, 0x13, 0x0F, 0x07, 0x02, 0x02, 0xAE, 0x01, 0x00, 0x08, 0x01, 0x06
	.byte 0x03, 0x02, 0xEE, 0x01, 0x05, 0x02, 0x00, 0x08, 0x02, 0x02, 0xF0, 0x03, 0x05, 0x0F, 0x03, 0x04
	.byte 0x02, 0x00, 0xE8, 0x03, 0x05, 0x13, 0x03, 0x09, 0x02, 0x00, 0xD6, 0x03, 0x05, 0x0D, 0x05, 0x12
	.byte 0x02, 0x00, 0xB2, 0x03, 0x05, 0x02, 0x11, 0x1C, 0x06, 0x01, 0x0A, 0x03, 0x05, 0x12, 0x0B, 0x05
	.byte 0x02, 0x01, 0x00, 0x03, 0x05, 0x17, 0x0B, 0x08, 0x02, 0x01, 0xF0, 0x02, 0x05, 0x12, 0x0D, 0x05
	.byte 0x02, 0x01, 0xE6, 0x02, 0x05, 0x17, 0x0D, 0x08, 0x02, 0x01, 0xD6, 0x02, 0x05, 0x10, 0x08, 0x0E
	.byte 0x02, 0x01, 0xB6, 0x02, 0x05, 0x10, 0x0B, 0x03, 0x02, 0x01, 0xB0, 0x02, 0x05, 0x14, 0x0B, 0x08
	.byte 0x02, 0x01, 0xA0, 0x02, 0x05, 0x0F, 0x0D, 0x10, 0x02, 0x01, 0x80, 0x02, 0x01, 0x0A, 0x10, 0x0B
	.byte 0x02, 0x00, 0xBA, 0x01, 0x00, 0x02, 0x09, 0x0C, 0x02, 0x09, 0xE8, 0x03, 0x00, 0x12, 0x09, 0x0C
	.byte 0x02, 0x09, 0xD0, 0x03, 0x00, 0x0B, 0x0B, 0x03, 0x02, 0x09, 0xCA, 0x03, 0x00, 0x0B, 0x0B, 0x03
	.byte 0x02, 0x09, 0xC4, 0x03, 0x00, 0x1B, 0x0B, 0x03, 0x02, 0x09, 0xBE, 0x03, 0x00, 0x1B, 0x0B, 0x03
	.byte 0x02, 0x09, 0xB8, 0x03
_021FA304:
	.byte 0x56, 0x4E, 0x46, 0x3E, 0x36, 0x2E, 0x26, 0x1E, 0x16, 0x00, 0x00, 0x00
_021FA310:
	.byte 0x56
_021FA311:
	.byte 0x4E, 0x46, 0x3E, 0x36, 0x2E, 0x26, 0x1E, 0x16, 0x00, 0x00, 0x00, 0x6E, 0x66, 0x5E, 0x56
	.byte 0x4E, 0x46, 0x3E, 0x36, 0x2E, 0x26, 0x1E, 0x16
_021FA328:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
_021FA338:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
_021FA348:
	.byte 0x01, 0x00, 0x04, 0x00, 0x07, 0x00, 0x0A, 0x00
	.byte 0x0D, 0x00, 0x10, 0x00, 0x14, 0x00, 0x18, 0x00, 0x1C, 0x00
_021FA35A:
	.byte 0x01, 0x00, 0x04, 0x00, 0x07, 0x00
	.byte 0x0A, 0x00, 0x0D, 0x00, 0x10, 0x00, 0x14, 0x00, 0x18, 0x00, 0xFF, 0x00
_021FA36C:
	.byte 0x00, 0x04, 0x00, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x10, 0x00, 0x10, 0x00, 0x10, 0x00
_021FA380:
	.byte 0x51, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021FA398:
	.byte 0x0F, 0x00, 0x2D, 0x00, 0x5A, 0x00, 0x87, 0x00
	.byte 0xB4, 0x00, 0xE1, 0x00, 0x0E, 0x01, 0x3B, 0x01, 0x68, 0x01, 0x95, 0x01, 0xC2, 0x01, 0xEF, 0x01
_021FA3B0:
	.byte 0x08
_021FA3B1:
	.byte 0x08, 0x10, 0x08, 0x18, 0x08, 0x20, 0x08, 0x28, 0x08, 0x30, 0x08, 0x08, 0x10, 0x08, 0x18
	.byte 0x08, 0x20, 0x08, 0x28, 0x10, 0x10, 0x18, 0x10
_021FA3C8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
_021FA3E8:
	.byte 0x30, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x50, 0xC5, 0x00, 0x00
	.byte 0x50, 0xC5, 0x00, 0x00, 0x50, 0xC5, 0x00, 0x00, 0x50, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021FA41C:
	.byte 0xA8, 0x00, 0x48, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x93, 0xC5, 0x00, 0x00, 0x58, 0xC5, 0x00, 0x00, 0x55, 0xC5, 0x00, 0x00, 0x55, 0xC5, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021FA450:
	.byte 0x78, 0x00, 0x50, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x99, 0xC5, 0x00, 0x00, 0x5B, 0xC5, 0x00, 0x00, 0x58, 0xC5, 0x00, 0x00
	.byte 0x58, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_021FA484:
	.byte 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x98, 0xC5, 0x00, 0x00, 0x5A, 0xC5, 0x00, 0x00
	.byte 0x57, 0xC5, 0x00, 0x00, 0x57, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021FA4B8:
	.byte 0xC0, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x9A, 0xC5, 0x00, 0x00
	.byte 0x5C, 0xC5, 0x00, 0x00, 0x59, 0xC5, 0x00, 0x00, 0x59, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021FA4EC:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xA0, 0xC5, 0x00, 0x00, 0x61, 0xC5, 0x00, 0x00, 0x5E, 0xC5, 0x00, 0x00, 0x5E, 0xC5, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021FA520:
	.byte 0xE0, 0x00, 0x08, 0x01, 0x00, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x9F, 0xC5, 0x00, 0x00, 0x60, 0xC5, 0x00, 0x00, 0x5D, 0xC5, 0x00, 0x00
	.byte 0x5D, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_021FA554:
	.byte 0x20, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x03, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00
	.byte 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021FA588:
	.word ov18_021F51BC
	.word ov18_021F51CC
	.word ov18_021F5238
	.word ov18_021F52A4
	.word ov18_021F5310
	.word ov18_021F537C
	.word ov18_021F53E8
	.word ov18_021F5454
	.word ov18_021F5638
	.word ov18_021F56DC
	.word ov18_021F57B4
	.word ov18_021F588C
	.word ov18_021F5964
	.word ov18_021F5A3C
	.word ov18_021F5B14
	.word ov18_021F5BEC
	.word ov18_021F5CC4
_021FA5CC:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0x02, 0x00, 0x02, 0x00, 0x03, 0x00, 0x03, 0x00, 0x04, 0x00, 0x04, 0x00
	.byte 0x05, 0x00, 0x05, 0x00, 0x06, 0x00, 0x06, 0x00, 0x07, 0x00, 0x07, 0x00, 0x08, 0x00, 0x0F, 0x00
	.byte 0x10, 0x00, 0x1E, 0x00, 0x1F, 0x00, 0x32, 0x00, 0x33, 0x00, 0x4B, 0x00, 0x4C, 0x00, 0x69, 0x00
	.byte 0x6A, 0x00, 0x9B, 0x00, 0x9C, 0x00, 0xEB, 0x00, 0xEC, 0x00, 0x5E, 0x01, 0x5F, 0x01, 0xFF, 0xFF
_021FA610:
	.byte 0x24, 0x00, 0x70, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x50, 0xC5, 0x00, 0x00, 0x51, 0xC5, 0x00, 0x00, 0x50, 0xC5, 0x00, 0x00
	.byte 0x50, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x9C, 0xC5, 0x00, 0x00, 0x5E, 0xC5, 0x00, 0x00
	.byte 0x5A, 0xC5, 0x00, 0x00, 0x5A, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x6C, 0x00, 0x00, 0x00, 0x1A, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00
	.byte 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x4C, 0x00
	.byte 0x00, 0x00, 0x1B, 0x00, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x90, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xF2, 0x00, 0x60, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00
	.byte 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xF2, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x05, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00
	.byte 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF2, 0x00, 0x94, 0x00, 0x00, 0x00, 0x08, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00
	.byte 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF2, 0x00, 0x60, 0x00
	.byte 0x00, 0x00, 0x3F, 0x00, 0x14, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x90, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021FA7B0:
	.byte 0xB8, 0x00, 0x70, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x9D, 0xC5, 0x00, 0x00, 0x5E, 0xC5, 0x00, 0x00, 0x5B, 0xC5, 0x00, 0x00
	.byte 0x5B, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x48, 0x00, 0xF0, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x50, 0xC5, 0x00, 0x00, 0x50, 0xC5, 0x00, 0x00
	.byte 0x50, 0xC5, 0x00, 0x00, 0x50, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x48, 0x00, 0x50, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x51, 0xC5, 0x00, 0x00
	.byte 0x51, 0xC5, 0x00, 0x00, 0x50, 0xC5, 0x00, 0x00, 0x50, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xB8, 0x00, 0xF0, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x9B, 0xC5, 0x00, 0x00, 0x5D, 0xC5, 0x00, 0x00, 0x5A, 0xC5, 0x00, 0x00, 0x5A, 0xC5, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x9C, 0xC5, 0x00, 0x00, 0x5E, 0xC5, 0x00, 0x00, 0x5A, 0xC5, 0x00, 0x00
	.byte 0x5A, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x68, 0x00, 0x00, 0x00, 0x21, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00
	.byte 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x68, 0x00, 0x00, 0x00, 0x1F, 0x00
	.byte 0x0F, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00
	.byte 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x48, 0x00, 0x68, 0x00
	.byte 0x00, 0x00, 0x20, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x90, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xB8, 0x00, 0x68, 0x00, 0x00, 0x00, 0x20, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00
	.byte 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_021FA984:
	.byte 0x80, 0x00, 0x80, 0x00, 0x00, 0x00, 0x17, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00
	.byte 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF2, 0x00, 0x40, 0x00, 0x00, 0x00, 0x10, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00
	.byte 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF2, 0x00, 0x0C, 0x00
	.byte 0x00, 0x00, 0x05, 0x00, 0x14, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x90, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xF2, 0x00, 0x8C, 0x00, 0x00, 0x00, 0x08, 0x00, 0x14, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00
	.byte 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xF2, 0x00, 0x4C, 0x00, 0x00, 0x00, 0x04, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00
	.byte 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0x18, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00
	.byte 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x88, 0x00
	.byte 0x00, 0x00, 0x18, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x90, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xB8, 0x00, 0x88, 0x00, 0x00, 0x00, 0x19, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00
	.byte 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_021FAB24:
	.byte 0x5C, 0x00, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x97, 0xC5, 0x00, 0x00, 0x59, 0xC5, 0x00, 0x00
	.byte 0x56, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021FAB58:
	.byte 0x70, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x92, 0xC5, 0x00, 0x00
	.byte 0x57, 0xC5, 0x00, 0x00, 0x54, 0xC5, 0x00, 0x00, 0x54, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021FAB8C:
	.byte 0x30, 0x00, 0x48, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x91, 0xC5, 0x00, 0x00, 0x57, 0xC5, 0x00, 0x00, 0x53, 0xC5, 0x00, 0x00, 0x53, 0xC5, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021FABC0:
	.byte 0x30, 0x00, 0x48, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x8C, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0x51, 0xC5, 0x00, 0x00
	.byte 0x51, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_021FABF4:
	.byte 0x30, 0x00, 0x48, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x8D, 0xC5, 0x00, 0x00, 0x53, 0xC5, 0x00, 0x00
	.byte 0x51, 0xC5, 0x00, 0x00, 0x51, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021FAC28:
	.byte 0x40, 0x00, 0x78, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x8C, 0xC5, 0x00, 0x00
	.byte 0x52, 0xC5, 0x00, 0x00, 0x51, 0xC5, 0x00, 0x00, 0x51, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x78, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x8D, 0xC5, 0x00, 0x00, 0x53, 0xC5, 0x00, 0x00, 0x51, 0xC5, 0x00, 0x00, 0x51, 0xC5, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x78, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x8E, 0xC5, 0x00, 0x00, 0x54, 0xC5, 0x00, 0x00, 0x51, 0xC5, 0x00, 0x00
	.byte 0x51, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x78, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x8F, 0xC5, 0x00, 0x00, 0x55, 0xC5, 0x00, 0x00
	.byte 0x51, 0xC5, 0x00, 0x00, 0x51, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF2, 0x00, 0x40, 0x00, 0x00, 0x00, 0x0E, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00
	.byte 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF2, 0x00, 0x0C, 0x00
	.byte 0x00, 0x00, 0x05, 0x00, 0x14, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x90, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xF2, 0x00, 0x74, 0x00, 0x00, 0x00, 0x08, 0x00, 0x14, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00
	.byte 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xF2, 0x00, 0x40, 0x00, 0x00, 0x00, 0x3F, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00
	.byte 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x38, 0x00, 0x00, 0x00, 0x40, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00
	.byte 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x80, 0x00
	.byte 0x00, 0x00, 0x41, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x90, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xC0, 0x00, 0x38, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00
	.byte 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x80, 0x00, 0x00, 0x00, 0x41, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00
	.byte 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x50, 0x00, 0x00, 0x00, 0x42, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00
	.byte 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x50, 0xC5, 0x00, 0x00, 0x50, 0xC5, 0x00, 0x00, 0x50, 0xC5, 0x00, 0x00, 0x50, 0xC5, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x51, 0xC5, 0x00, 0x00, 0x50, 0xC5, 0x00, 0x00, 0x50, 0xC5, 0x00, 0x00
	.byte 0x50, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0x50, 0xC5, 0x00, 0x00
	.byte 0x50, 0xC5, 0x00, 0x00, 0x50, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x53, 0xC5, 0x00, 0x00
	.byte 0x50, 0xC5, 0x00, 0x00, 0x50, 0xC5, 0x00, 0x00, 0x50, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x54, 0xC5, 0x00, 0x00, 0x50, 0xC5, 0x00, 0x00, 0x50, 0xC5, 0x00, 0x00, 0x50, 0xC5, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x55, 0xC5, 0x00, 0x00, 0x50, 0xC5, 0x00, 0x00, 0x50, 0xC5, 0x00, 0x00
	.byte 0x50, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_021FB004:
	.byte 0xAC, 0x00, 0x10, 0x00, 0x00, 0x00, 0x27, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00
	.byte 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x12, 0x00, 0x3C, 0x00, 0x00, 0x00, 0x38, 0x00
	.byte 0x23, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00
	.byte 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEE, 0x00, 0x3C, 0x00
	.byte 0x00, 0x00, 0x35, 0x00, 0x23, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x90, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x12, 0x00, 0x84, 0x00, 0x00, 0x00, 0x38, 0x00, 0x23, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00
	.byte 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xEE, 0x00, 0x84, 0x00, 0x00, 0x00, 0x35, 0x00, 0x23, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00
	.byte 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x34, 0x00, 0x44, 0x00, 0x00, 0x00, 0x29, 0x00
	.byte 0x1E, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00
	.byte 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x34, 0x00, 0x40, 0x00
	.byte 0x00, 0x00, 0x2B, 0x00, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x90, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x34, 0x00, 0x40, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00
	.byte 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x34, 0x00, 0x40, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00
	.byte 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x34, 0x00, 0x40, 0x00, 0x00, 0x00, 0x2B, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00
	.byte 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x34, 0x00, 0x40, 0x00
	.byte 0x00, 0x00, 0x2B, 0x00, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x90, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xCC, 0x00, 0x84, 0x00, 0x00, 0x00, 0x2A, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00
	.byte 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xCC, 0x00, 0x88, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00
	.byte 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xCC, 0x00, 0x88, 0x00, 0x00, 0x00, 0x2B, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00
	.byte 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xCC, 0x00, 0x88, 0x00
	.byte 0x00, 0x00, 0x2B, 0x00, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x90, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xCC, 0x00, 0x88, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00
	.byte 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xCC, 0x00, 0x88, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00
	.byte 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x80, 0x00, 0x00, 0x00, 0x17, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00
	.byte 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF2, 0x00, 0x40, 0x00
	.byte 0x00, 0x00, 0x10, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x90, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xF2, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x05, 0x00, 0x14, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00
	.byte 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xF2, 0x00, 0x8C, 0x00, 0x00, 0x00, 0x08, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00
	.byte 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF2, 0x00, 0x4C, 0x00, 0x00, 0x00, 0x04, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00
	.byte 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x88, 0x00
	.byte 0x00, 0x00, 0x18, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x90, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xB8, 0x00, 0x88, 0x00, 0x00, 0x00, 0x19, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00
	.byte 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x5C, 0x00, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x97, 0xC5, 0x00, 0x00, 0x59, 0xC5, 0x00, 0x00
	.byte 0x56, 0xC5, 0x00, 0x00, 0x56, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0x18, 0x00, 0x00, 0x00, 0x1C, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x90, 0xC5, 0x00, 0x00
	.byte 0x56, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0x52, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021FB54C:
	.byte 0x80, 0x00, 0x50, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x9E, 0xC5, 0x00, 0x00, 0x5F, 0xC5, 0x00, 0x00, 0x5C, 0xC5, 0x00, 0x00, 0x5C, 0xC5, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021FB580:
	.byte 0x80, 0x00, 0x50, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x9E, 0xC5, 0x00, 0x00, 0x5F, 0xC5, 0x00, 0x00, 0x5C, 0xC5, 0x00, 0x00
	.byte 0x5C, 0xC5, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_021FB5B4:
	.byte 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x41, 0x42, 0x09, 0x0A
	.byte 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10, 0x43, 0x44, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18
	.byte 0x45, 0x46, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F, 0x20, 0x47, 0x48, 0x21, 0x22, 0x23, 0x24
	.byte 0x25, 0x26, 0x27, 0x28, 0x49, 0x4A, 0x29, 0x2A, 0x2B, 0x2C, 0x2D, 0x2E, 0x2F, 0x30, 0x4B, 0x4C
	.byte 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x4D, 0x4E, 0x39, 0x3A, 0x3B, 0x3C, 0x3D, 0x3E
	.byte 0x3F, 0x40, 0x4F, 0x50, 0x51, 0x52, 0x53, 0x54, 0x59, 0x5A, 0x5B, 0x5C, 0x61, 0x62, 0x55, 0x56
	.byte 0x57, 0x58, 0x5D, 0x5E, 0x5F, 0x60, 0x63, 0x64
_021FB618:
	.byte 0x3E, 0x3E, 0x23, 0x23
_021FB61C:
	.byte 0x3E, 0x3E, 0x23, 0x23
_021FB620:
	.byte 0x26, 0x26, 0x26, 0x26, 0x23, 0x23, 0x00, 0x00
_021FB628:
	.byte 0x27, 0x27, 0x27, 0x27, 0x27, 0x27, 0x23, 0x23
_021FB630:
	.byte 0x48, 0x67, 0x30, 0xCF, 0xFF, 0x00, 0x00, 0x00
_021FB638:
	.word ov18_021F7B90
	.word ov18_021F7B90
	.word ov18_021F71DC
	.word ov18_021F7334
_021FB648:
	.word ov18_021F7B90
	.word ov18_021F7B90
	.word ov18_021F74B0
	.word ov18_021F74C4
_021FB658:
	.word ov18_021F7B90
	.word ov18_021F7B90
	.word ov18_021F7800
	.word ov18_021F7954
_021FB668:
	.word ov18_021F7B90
	.word ov18_021F7B90
	.word ov18_021F6F78
	.word ov18_021F6F8C
_021FB678:
	.word ov18_021F7B90
	.word ov18_021F7B90
	.word ov18_021F7634
	.word ov18_021F7648
_021FB688:
	.word ov18_021F7B90
	.word ov18_021F7B90
	.word ov18_021F6E98
	.word ov18_021F6EAC
_021FB698:
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
_021FB6A8:
	.word ov18_021F7B90
	.word ov18_021F7B90
	.word ov18_021F7060
	.word ov18_021F7104
_021FB6B8:
	.word ov18_021F7B90
	.word ov18_021F7B90
	.word ov18_021F7720
	.word ov18_021F7734
_021FB6C8:
	.byte 0x2E, 0x49, 0x1A, 0xE5, 0x76, 0x91, 0x1A, 0xE5
	.byte 0xA4, 0xBB, 0x04, 0x4B, 0xA4, 0xBB, 0xB4, 0xFB, 0xFF, 0x00, 0x00, 0x00
_021FB6DC:
	.byte 0x2E, 0x49, 0x1A, 0xE5
	.byte 0x76, 0x91, 0x1A, 0xE5, 0xA4, 0xBB, 0x04, 0x4B, 0xA4, 0xBB, 0xB4, 0xFB, 0xFF, 0x00, 0x00, 0x00
_021FB6F0:
	.byte 0x06, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00
_021FB704:
	.byte 0xA8, 0xB7, 0x07, 0x39, 0xA8, 0xB7, 0x47, 0x79, 0xA8, 0xB7, 0x87, 0xB9
	.byte 0xA8, 0xB7, 0xC7, 0xF9, 0xFF, 0x00, 0x00, 0x00
_021FB718:
	.byte 0x31, 0x46, 0xE6, 0xF5, 0x31, 0x46, 0x0A, 0x19
	.byte 0x79, 0x8E, 0xE6, 0xF5, 0x79, 0x8E, 0x0A, 0x19, 0xFF, 0x00, 0x00, 0x00
_021FB72C:
	.byte 0x70, 0x8F, 0x60, 0xA0
	.byte 0x00, 0x97, 0x00, 0xFF, 0x98, 0xBB, 0x00, 0x3F, 0x98, 0xBB, 0x40, 0xBF, 0x98, 0xBB, 0xC0, 0xFF
	.byte 0xFF, 0x00, 0x00, 0x00
_021FB744:
	.byte 0x40, 0x4F, 0x30, 0x67, 0x40, 0x4F, 0x98, 0xCF, 0x78, 0x87, 0x30, 0x67
	.byte 0x78, 0x87, 0x98, 0xCF, 0xA4, 0xBB, 0x04, 0x4B, 0xA4, 0xBB, 0xB4, 0xFB, 0xFF, 0x00, 0x00, 0x00
_021FB760:
	.byte 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
_021FB780:
	.byte 0x34, 0x3C, 0x00, 0x00, 0x02, 0x01, 0x00, 0x00, 0xCC, 0x84, 0x00, 0x00, 0x00, 0x82, 0x01, 0x01
	.byte 0x28, 0xB0, 0x00, 0x00, 0x01, 0x00, 0x03, 0x03, 0xD8, 0xB0, 0x00, 0x00, 0x01, 0x00, 0x02, 0x02
_021FB7A0:
	.byte 0x34, 0x3C, 0x00, 0x00, 0x02, 0x01, 0x00, 0x00, 0xCC, 0x84, 0x00, 0x00, 0x00, 0x82, 0x01, 0x01
	.byte 0x28, 0xB0, 0x00, 0x00, 0x01, 0x00, 0x03, 0x03, 0xD8, 0xB0, 0x00, 0x00, 0x01, 0x00, 0x02, 0x02
_021FB7C0:
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
_021FB7E0:
	.byte 0x30, 0x3F, 0x38, 0x47, 0x78, 0x88, 0x38, 0x47, 0x30, 0x3F, 0xB8, 0xC7, 0x78, 0x88, 0xB8, 0xC7
	.byte 0xA0, 0xB7, 0x08, 0x77, 0xA0, 0xB7, 0x80, 0xFF, 0x43, 0x74, 0x02, 0x72, 0x43, 0x74, 0x82, 0xFD
	.byte 0xFF, 0x00, 0x00, 0x00
_021FB804:
	.byte 0x08, 0x17, 0x22, 0xD5, 0x20, 0x2F, 0x22, 0xD5, 0x68, 0x77, 0x22, 0xD5
	.byte 0x50, 0x5F, 0x22, 0xD5, 0x05, 0x14, 0xE7, 0xFC, 0x6B, 0x7A, 0xE7, 0xFC, 0x15, 0x6A, 0xE7, 0xFC
	.byte 0x86, 0x9A, 0x86, 0xFF, 0xFF, 0x00, 0x00, 0x00
_021FB828:
	.byte 0x30, 0x3F, 0x18, 0x6F, 0x30, 0x3F, 0x90, 0xE7
	.byte 0x50, 0x5F, 0x18, 0x6F, 0x50, 0x5F, 0x90, 0xE7, 0x70, 0x7F, 0x18, 0x6F, 0x70, 0x7F, 0x90, 0xE7
	.byte 0xA4, 0xBB, 0x04, 0x4B, 0xA4, 0xBB, 0xB4, 0xFB, 0xFF, 0x00, 0x00, 0x00
_021FB84C:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x0E, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
_021FB878:
	.byte 0x08, 0x17, 0x80, 0xD7, 0x20, 0x2F, 0x38, 0x7F
	.byte 0x38, 0x47, 0x38, 0xB1, 0x50, 0x5F, 0x38, 0xB7, 0x68, 0x77, 0x38, 0xEF, 0x80, 0x8F, 0x38, 0x6F
	.byte 0x38, 0x57, 0xD0, 0xEF, 0xA4, 0xBB, 0x04, 0x4B, 0xA4, 0xBB, 0x5C, 0xA3, 0xA4, 0xBB, 0xB4, 0xFB
	.byte 0xFF, 0x00, 0x00, 0x00
_021FB8A4:
	.byte 0x04, 0x7B, 0x1B, 0xE2, 0x00, 0x7C, 0x00, 0x17, 0x05, 0x14, 0xE7, 0xFC
	.byte 0x83, 0x92, 0xE7, 0xFC, 0x15, 0x82, 0xE7, 0xFC, 0x80, 0x8F, 0x30, 0x4F, 0x80, 0x8F, 0xA8, 0xC7
	.byte 0x98, 0xBB, 0x00, 0x3F, 0x98, 0xBB, 0x40, 0x7F, 0x98, 0xBB, 0x80, 0xBF, 0x98, 0xBB, 0xC0, 0xFF
	.byte 0xFF, 0x00, 0x00, 0x00
_021FB8D4:
	.byte 0x4C, 0x48, 0x00, 0x00, 0x04, 0x02, 0x01, 0x01, 0xB4, 0x48, 0x00, 0x00
	.byte 0x05, 0x03, 0x00, 0x00, 0x4C, 0x80, 0x00, 0x00, 0x00, 0x04, 0x03, 0x03, 0xB4, 0x80, 0x00, 0x00
	.byte 0x01, 0x05, 0x02, 0x02, 0x28, 0xB0, 0x00, 0x00, 0x02, 0x00, 0x05, 0x05, 0xD8, 0xB0, 0x00, 0x00
	.byte 0x03, 0x01, 0x04, 0x04
_021FB904:
	.byte 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00
	.byte 0x0F, 0x00, 0x00, 0x00
_021FB934:
	.byte 0x28, 0x37, 0x52, 0xDD, 0x40, 0x4F, 0x52, 0xDD, 0x88, 0x97, 0x52, 0xDD
	.byte 0x70, 0x7F, 0x52, 0xDD, 0x25, 0x34, 0xE7, 0xFC, 0x8B, 0x9A, 0xE7, 0xFC, 0x35, 0x8A, 0xE7, 0xFC
	.byte 0x06, 0x19, 0x46, 0x81, 0x06, 0x19, 0xBE, 0xF7, 0xFE, 0x21, 0x4D, 0x0D, 0xFE, 0x21, 0x6D, 0x0D
	.byte 0xFE, 0x21, 0x8D, 0x0D, 0xFF, 0x00, 0x00, 0x00
_021FB968:
	.byte 0x44, 0x38, 0x00, 0x00, 0x06, 0x02, 0x01, 0x01
	.byte 0xBC, 0x38, 0x00, 0x00, 0x07, 0x03, 0x00, 0x00, 0x44, 0x58, 0x00, 0x00, 0x00, 0x04, 0x03, 0x03
	.byte 0xBC, 0x58, 0x00, 0x00, 0x01, 0x05, 0x02, 0x02, 0x44, 0x78, 0x00, 0x00, 0x02, 0x06, 0x05, 0x05
	.byte 0xBC, 0x78, 0x00, 0x00, 0x03, 0x07, 0x04, 0x04, 0x28, 0xB0, 0x00, 0x00, 0x04, 0x00, 0x07, 0x07
	.byte 0xD8, 0xB0, 0x00, 0x00, 0x05, 0x01, 0x06, 0x06
_021FB9A8:
	.byte 0x28, 0x47, 0x10, 0x2F, 0x28, 0x47, 0x40, 0x5F
	.byte 0x28, 0x47, 0x70, 0x8F, 0x28, 0x47, 0xA0, 0xBF, 0x28, 0x47, 0xD0, 0xEF, 0x50, 0x6F, 0x10, 0x2F
	.byte 0x50, 0x6F, 0x40, 0x5F, 0x50, 0x6F, 0x70, 0x8F, 0x50, 0x6F, 0xA0, 0xBF, 0x50, 0x6F, 0xD0, 0xEF
	.byte 0x78, 0x97, 0x10, 0x2F, 0x78, 0x97, 0x40, 0x5F, 0x78, 0x97, 0x70, 0x8F, 0x78, 0x97, 0xA0, 0xBF
	.byte 0x78, 0x97, 0xD0, 0xEF, 0xA4, 0xBB, 0x04, 0x4B, 0xA4, 0xBB, 0xB4, 0xFB, 0xFF, 0x00, 0x00, 0x00
_021FB9F0:
	.byte 0xAC, 0x10, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x5C, 0x28, 0x00, 0x00, 0x00, 0x02, 0x01, 0x06
	.byte 0x74, 0x40, 0x00, 0x00, 0x01, 0x03, 0x02, 0x06, 0x70, 0x58, 0x00, 0x00, 0x02, 0x04, 0x03, 0x06
	.byte 0x88, 0x70, 0x00, 0x00, 0x03, 0x05, 0x04, 0x04, 0x54, 0x88, 0x00, 0x00, 0x04, 0x88, 0x05, 0x05
	.byte 0xE0, 0x48, 0x00, 0x00, 0x00, 0x04, 0x81, 0x06, 0x28, 0xB0, 0x00, 0x00, 0x05, 0x07, 0x07, 0x08
	.byte 0x80, 0xB0, 0x00, 0x00, 0x05, 0x08, 0x07, 0x09, 0xD8, 0xB0, 0x00, 0x00, 0x05, 0x09, 0x08, 0x09
_021FBA40:
	.byte 0x28, 0x37, 0x03, 0x3C, 0x28, 0x37, 0x43, 0x7C, 0x28, 0x37, 0x83, 0xBC, 0x28, 0x37, 0xC3, 0xFC
	.byte 0x40, 0x4F, 0x03, 0x3C, 0x40, 0x4F, 0x43, 0x7C, 0x40, 0x4F, 0x83, 0xBC, 0x40, 0x4F, 0xC3, 0xFC
	.byte 0x58, 0x68, 0x03, 0x3C, 0x58, 0x68, 0x43, 0x7C, 0x58, 0x68, 0x83, 0xBC, 0x58, 0x68, 0xC3, 0xFC
	.byte 0x70, 0x7F, 0x03, 0x3C, 0x70, 0x7F, 0x43, 0x7C, 0x70, 0x7F, 0x83, 0xBC, 0x70, 0x7F, 0xC3, 0xFC
	.byte 0x88, 0x97, 0x03, 0x3C, 0x88, 0x97, 0x43, 0x7C, 0xA4, 0xBB, 0x04, 0x4B, 0xA4, 0xBB, 0xB4, 0xFB
	.byte 0xFF, 0x00, 0x00, 0x00
_021FBA94:
	.byte 0x28, 0x37, 0x18, 0x27, 0x28, 0x37, 0x38, 0x47, 0x28, 0x37, 0x58, 0x67
	.byte 0x28, 0x37, 0x78, 0x87, 0x28, 0x37, 0x98, 0xA7, 0x28, 0x37, 0xB8, 0xC7, 0x28, 0x37, 0xD8, 0xE7
	.byte 0x48, 0x57, 0x18, 0x27, 0x48, 0x57, 0x38, 0x47, 0x48, 0x57, 0x58, 0x67, 0x48, 0x57, 0x78, 0x87
	.byte 0x48, 0x57, 0x98, 0xA7, 0x48, 0x57, 0xB8, 0xC7, 0x48, 0x57, 0xD8, 0xE7, 0x68, 0x77, 0x18, 0x27
	.byte 0x68, 0x77, 0x38, 0x47, 0x68, 0x77, 0x58, 0x67, 0x68, 0x77, 0x78, 0x87, 0x68, 0x77, 0x98, 0xA7
	.byte 0x68, 0x77, 0xB8, 0xC7, 0x68, 0x77, 0xD8, 0xE7, 0x88, 0x97, 0x18, 0x27, 0x88, 0x97, 0x38, 0x47
	.byte 0x88, 0x97, 0x58, 0x67, 0x88, 0x97, 0x78, 0x87, 0x88, 0x97, 0x98, 0xA7, 0x88, 0x97, 0xD8, 0xE7
	.byte 0xA4, 0xBB, 0x04, 0x4B, 0xA4, 0xBB, 0xB4, 0xFB, 0xFF, 0x00, 0x00, 0x00
_021FBB0C:
	.byte 0x20, 0x38, 0x00, 0x00
	.byte 0x0F, 0x05, 0x04, 0x01, 0x50, 0x38, 0x00, 0x00, 0x0F, 0x06, 0x00, 0x02, 0x80, 0x38, 0x00, 0x00
	.byte 0x0F, 0x07, 0x01, 0x03, 0xB0, 0x38, 0x00, 0x00, 0x10, 0x08, 0x02, 0x04, 0xE0, 0x38, 0x00, 0x00
	.byte 0x10, 0x09, 0x03, 0x00, 0x20, 0x60, 0x00, 0x00, 0x00, 0x0A, 0x09, 0x06, 0x50, 0x60, 0x00, 0x00
	.byte 0x01, 0x0B, 0x05, 0x07, 0x80, 0x60, 0x00, 0x00, 0x02, 0x0C, 0x06, 0x08, 0xB0, 0x60, 0x00, 0x00
	.byte 0x03, 0x0D, 0x07, 0x09, 0xE0, 0x60, 0x00, 0x00, 0x04, 0x0E, 0x08, 0x05, 0x20, 0x88, 0x00, 0x00
	.byte 0x05, 0x0F, 0x0E, 0x0B, 0x50, 0x88, 0x00, 0x00, 0x06, 0x0F, 0x0A, 0x0C, 0x80, 0x88, 0x00, 0x00
	.byte 0x07, 0x0F, 0x0B, 0x0D, 0xB0, 0x88, 0x00, 0x00, 0x08, 0x10, 0x0C, 0x0E, 0xE0, 0x88, 0x00, 0x00
	.byte 0x09, 0x10, 0x0D, 0x0A, 0x28, 0xB0, 0x00, 0x00, 0x0A, 0x00, 0x10, 0x10, 0xD8, 0xB0, 0x00, 0x00
	.byte 0x0E, 0x04, 0x0F, 0x0F
_021FBB94:
	.byte 0x20, 0x30, 0x00, 0x00, 0x12, 0x04, 0x03, 0x01, 0x60, 0x30, 0x00, 0x00
	.byte 0x12, 0x05, 0x00, 0x02, 0xA0, 0x30, 0x00, 0x00, 0x13, 0x06, 0x01, 0x03, 0xE0, 0x30, 0x00, 0x00
	.byte 0x13, 0x07, 0x02, 0x00, 0x20, 0x48, 0x00, 0x00, 0x00, 0x08, 0x07, 0x05, 0x60, 0x48, 0x00, 0x00
	.byte 0x01, 0x09, 0x04, 0x06, 0xA0, 0x48, 0x00, 0x00, 0x02, 0x0A, 0x05, 0x07, 0xE0, 0x48, 0x00, 0x00
	.byte 0x03, 0x0B, 0x06, 0x04, 0x20, 0x60, 0x00, 0x00, 0x04, 0x0C, 0x0B, 0x09, 0x60, 0x60, 0x00, 0x00
	.byte 0x05, 0x0D, 0x08, 0x0A, 0xA0, 0x60, 0x00, 0x00, 0x06, 0x0E, 0x09, 0x0B, 0xE0, 0x60, 0x00, 0x00
	.byte 0x07, 0x0F, 0x0A, 0x08, 0x20, 0x78, 0x00, 0x00, 0x08, 0x10, 0x0F, 0x0D, 0x60, 0x78, 0x00, 0x00
	.byte 0x09, 0x11, 0x0C, 0x0E, 0xA0, 0x78, 0x00, 0x00, 0x0A, 0x13, 0x0D, 0x0F, 0xE0, 0x78, 0x00, 0x00
	.byte 0x0B, 0x13, 0x0E, 0x0C, 0x20, 0x90, 0x00, 0x00, 0x0C, 0x12, 0x11, 0x11, 0x60, 0x90, 0x00, 0x00
	.byte 0x0D, 0x12, 0x10, 0x10, 0x28, 0xB0, 0x00, 0x00, 0x10, 0x00, 0x13, 0x13, 0xD8, 0xB0, 0x00, 0x00
	.byte 0x0F, 0x03, 0x12, 0x12
_021FBC34:
	.byte 0x20, 0x30, 0x00, 0x00, 0x1B, 0x07, 0x06, 0x01, 0x40, 0x30, 0x00, 0x00
	.byte 0x1B, 0x08, 0x00, 0x02, 0x60, 0x30, 0x00, 0x00, 0x1B, 0x09, 0x01, 0x03, 0x80, 0x30, 0x00, 0x00
	.byte 0x1B, 0x0A, 0x02, 0x04, 0xA0, 0x30, 0x00, 0x00, 0x1C, 0x0B, 0x03, 0x05, 0xC0, 0x30, 0x00, 0x00
	.byte 0x1C, 0x0C, 0x04, 0x06, 0xE0, 0x30, 0x00, 0x00, 0x1C, 0x0D, 0x05, 0x00, 0x20, 0x50, 0x00, 0x00
	.byte 0x00, 0x0E, 0x0D, 0x08, 0x40, 0x50, 0x00, 0x00, 0x01, 0x0F, 0x07, 0x09, 0x60, 0x50, 0x00, 0x00
	.byte 0x02, 0x10, 0x08, 0x0A, 0x80, 0x50, 0x00, 0x00, 0x03, 0x11, 0x09, 0x0B, 0xA0, 0x50, 0x00, 0x00
	.byte 0x04, 0x12, 0x0A, 0x0C, 0xC0, 0x50, 0x00, 0x00, 0x05, 0x13, 0x0B, 0x0D, 0xE0, 0x50, 0x00, 0x00
	.byte 0x06, 0x14, 0x0C, 0x07, 0x20, 0x70, 0x00, 0x00, 0x07, 0x15, 0x14, 0x0F, 0x40, 0x70, 0x00, 0x00
	.byte 0x08, 0x16, 0x0E, 0x10, 0x60, 0x70, 0x00, 0x00, 0x09, 0x17, 0x0F, 0x11, 0x80, 0x70, 0x00, 0x00
	.byte 0x0A, 0x18, 0x10, 0x12, 0xA0, 0x70, 0x00, 0x00, 0x0B, 0x19, 0x11, 0x13, 0xC0, 0x70, 0x00, 0x00
	.byte 0x0C, 0x1C, 0x12, 0x14, 0xE0, 0x70, 0x00, 0x00, 0x0D, 0x1A, 0x13, 0x0E, 0x20, 0x90, 0x00, 0x00
	.byte 0x0E, 0x1B, 0x1A, 0x16, 0x40, 0x90, 0x00, 0x00, 0x0F, 0x1B, 0x15, 0x17, 0x60, 0x90, 0x00, 0x00
	.byte 0x10, 0x1B, 0x16, 0x18, 0x80, 0x90, 0x00, 0x00, 0x11, 0x1B, 0x17, 0x19, 0xA0, 0x90, 0x00, 0x00
	.byte 0x12, 0x1C, 0x18, 0x1A
_021FBD04:
	.byte 0xE0, 0x90, 0x00, 0x00, 0x14, 0x1C, 0x19, 0x15, 0x28, 0xB0, 0x00, 0x00
	.byte 0x15, 0x00, 0x1C, 0x1C, 0xD8, 0xB0, 0x00, 0x00, 0x1A, 0x06, 0x1B, 0x1B
_021FBD1C:
	.byte 0x27, 0x23, 0x24, 0x3B
	.byte 0x3C, 0x26, 0x22, 0x23, 0x23, 0x23, 0x00, 0x00
_021FBD28:
	.byte 0x22, 0x22, 0x22, 0x22, 0x22, 0x22, 0x22, 0x22
	.byte 0x22, 0x22, 0x22, 0x22, 0x22, 0x22, 0x22, 0x23, 0x23, 0x00, 0x00, 0x00
_021FBD3C:
	.byte 0x26, 0x26, 0x26, 0x26
	.byte 0x26, 0x26, 0x26, 0x26, 0x26, 0x26, 0x26, 0x26, 0x26, 0x26, 0x26, 0x26, 0x26, 0x26, 0x23, 0x23
_021FBD50:
	.byte 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021FBD60:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x04, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021FBD7C:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021FBD98:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x04, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_021FBDB4:
	.byte 0x01, 0x02, 0x00, 0x1C, 0x02, 0x02, 0xC8, 0x03, 0x01, 0x0F, 0x03, 0x04
	.byte 0x02, 0x00, 0xC0, 0x03, 0x01, 0x13, 0x03, 0x09, 0x02, 0x00, 0xAE, 0x03, 0x01, 0x0D, 0x05, 0x12
	.byte 0x02, 0x00, 0x8A, 0x03, 0x01, 0x02, 0x11, 0x1C, 0x06, 0x01, 0xE2, 0x02, 0x01, 0x12, 0x0B, 0x05
	.byte 0x02, 0x01, 0xD8, 0x02, 0x01, 0x17, 0x0B, 0x08, 0x02, 0x01, 0xC8, 0x02, 0x01, 0x12, 0x0D, 0x05
	.byte 0x02, 0x01, 0xBE, 0x02, 0x01, 0x17, 0x0D, 0x08, 0x02, 0x01, 0xAE, 0x02
_021FBDFC:
	.byte 0x00, 0x02, 0x00, 0x03
	.byte 0x01, 0x01, 0x03, 0x02, 0x00, 0x00, 0x02, 0x02, 0x01, 0x01, 0x01, 0x00, 0x02, 0x03, 0x00, 0x00
_021FBE10:
	.byte 0x24, 0x00, 0x00, 0x00, 0x2A, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00, 0x2E, 0x00, 0x00, 0x00
	.byte 0x2C, 0x00, 0x00, 0x00, 0x29, 0x00, 0x00, 0x00, 0x2F, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x00, 0x00
	.byte 0x2D, 0x00, 0x00, 0x00, 0x24, 0x00, 0x00, 0x00, 0x25, 0x00, 0x00, 0x00, 0x27, 0x00, 0x00, 0x00
	.byte 0x26, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x00, 0x31, 0x00, 0x00, 0x00
	.byte 0x34, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00
