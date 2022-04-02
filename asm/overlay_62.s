	.include "asm/macros.inc"
	.include "global.inc"
	.public ov60_021EAFE0

	.text

	thumb_func_start ov62_021E5900
ov62_021E5900: ; 0x021E5900
	push {r4, lr}
	add r4, r0, #0
	mov r0, #3
	mov r1, #0x62
	lsl r2, r0, #0x10
	bl CreateHeap
	mov r1, #0x4f
	add r0, r4, #0
	lsl r1, r1, #2
	mov r2, #0x62
	bl OverlayManager_CreateAndGetData
	mov r2, #0x4f
	mov r1, #0
	lsl r2, r2, #2
	add r4, r0, #0
	bl MI_CpuFill8
	mov r1, #0x62
	add r0, r1, #0
	add r0, #0xd6
	str r1, [r4, r0]
	add r1, #0xd6
	ldr r0, [r4, r1]
	bl ov62_021E5C34
	bl ov62_021E5CB8
	ldr r0, _021E59B4 ; =ov62_021E5CC8
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	mov r0, #4
	mov r1, #0x62
	bl FontID_Alloc
	mov r1, #0x4e
	lsl r1, r1, #2
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0xb8
	bl ov62_021E5FD4
	mov r1, #0x4e
	lsl r1, r1, #2
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0xb8
	bl ov62_021E604C
	mov r1, #0x4e
	lsl r1, r1, #2
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0xb8
	bl ov62_021E60E4
	mov r1, #0x4e
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, r4, #0
	bl ov62_021E5CF4
	add r0, r4, #0
	bl ov62_021E5D88
	mov r1, #0x4e
	lsl r1, r1, #2
	add r0, r4, #0
	ldr r1, [r4, r1]
	ldr r2, _021E59B8 ; =ov62_021E62B8
	add r0, #0xf0
	add r3, r4, #0
	bl ov62_021E61AC
	mov r0, #0x4a
	lsl r0, r0, #2
	ldr r2, _021E59BC ; =ov62_021E5A9C
	add r0, r4, r0
	add r1, r4, #0
	bl ov62_021E5A5C
	mov r0, #0
	mov r1, #0xa
	bl GF_SndStartFadeOutBGM
	mov r0, #1
	pop {r4, pc}
	nop
_021E59B4: .word ov62_021E5CC8
_021E59B8: .word ov62_021E62B8
_021E59BC: .word ov62_021E5A9C
	thumb_func_end ov62_021E5900

	thumb_func_start ov62_021E59C0
ov62_021E59C0: ; 0x021E59C0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	add r0, #0xf0
	bl ov62_021E61FC
	add r0, r4, #0
	bl ov62_021E5FA0
	add r0, r4, #0
	bl ov62_021E5D54
	add r0, r4, #0
	add r0, #0xb8
	bl ov62_021E6178
	add r0, r4, #0
	add r0, #0xb8
	bl ov62_021E6024
	bl ov62_021E5C80
	mov r0, #4
	bl FontID_Release
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl DestroyHeap
	ldr r0, _021E5A14 ; =FS_OVERLAY_ID(OVY_60)
	ldr r1, _021E5A18 ; =ov60_021EAFE0
	bl RegisterMainOverlay
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_021E5A14: .word FS_OVERLAY_ID(OVY_60)
_021E5A18: .word ov60_021EAFE0
	thumb_func_end ov62_021E59C0

	thumb_func_start ov62_021E5A1C
ov62_021E5A1C: ; 0x021E5A1C
	push {r4, lr}
	bl OverlayManager_GetData
	add r4, r0, #0
	mov r0, #0x4a
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov62_021E5A90
	cmp r0, #0
	beq _021E5A36
	mov r0, #1
	pop {r4, pc}
_021E5A36:
	mov r0, #0x4a
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov62_021E5A6C
	add r0, r4, #0
	bl ov62_021E5D64
	add r0, r4, #0
	add r0, #0xb8
	bl ov62_021E6048
	add r4, #0xf0
	add r0, r4, #0
	bl ov62_021E620C
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov62_021E5A1C

	thumb_func_start ov62_021E5A5C
ov62_021E5A5C: ; 0x021E5A5C
	ldr r3, _021E5A68 ; =ov62_021E5A84
	str r1, [r0]
	mov r1, #0
	str r1, [r0, #0xc]
	add r1, r2, #0
	bx r3
	.balign 4, 0
_021E5A68: .word ov62_021E5A84
	thumb_func_end ov62_021E5A5C

	thumb_func_start ov62_021E5A6C
ov62_021E5A6C: ; 0x021E5A6C
	push {r4, lr}
	add r4, r0, #0
	bl ov62_021E5A90
	cmp r0, #0
	bne _021E5A82
	add r1, r4, #0
	ldr r2, [r4, #4]
	add r0, r4, #0
	add r1, #8
	blx r2
_021E5A82:
	pop {r4, pc}
	thumb_func_end ov62_021E5A6C

	thumb_func_start ov62_021E5A84
ov62_021E5A84: ; 0x021E5A84
	str r1, [r0, #4]
	mov r1, #0
	str r1, [r0, #8]
	bx lr
	thumb_func_end ov62_021E5A84

	thumb_func_start ov62_021E5A8C
ov62_021E5A8C: ; 0x021E5A8C
	ldr r0, [r0]
	bx lr
	thumb_func_end ov62_021E5A8C

	thumb_func_start ov62_021E5A90
ov62_021E5A90: ; 0x021E5A90
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end ov62_021E5A90

	thumb_func_start ov62_021E5A94
ov62_021E5A94: ; 0x021E5A94
	mov r1, #1
	str r1, [r0, #0xc]
	bx lr
	.balign 4, 0
	thumb_func_end ov62_021E5A94

	thumb_func_start ov62_021E5A9C
ov62_021E5A9C: ; 0x021E5A9C
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	bl ov62_021E5A8C
	ldr r1, [r4]
	cmp r1, #0
	beq _021E5AB8
	cmp r1, #1
	beq _021E5ADA
	cmp r1, #2
	beq _021E5AEA
	b _021E5AF6
_021E5AB8:
	mov r1, #6
	str r1, [sp]
	mov r1, #1
	mov r2, #0x4e
	str r1, [sp, #4]
	lsl r2, r2, #2
	ldr r0, [r0, r2]
	add r2, r1, #0
	str r0, [sp, #8]
	mov r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #1
	add sp, #0xc
	str r0, [r4]
	pop {r4, r5, pc}
_021E5ADA:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E5AFA
	mov r0, #2
	add sp, #0xc
	str r0, [r4]
	pop {r4, r5, pc}
_021E5AEA:
	ldr r1, _021E5B00 ; =ov62_021E5B04
	add r0, r5, #0
	bl ov62_021E5A84
	add sp, #0xc
	pop {r4, r5, pc}
_021E5AF6:
	bl GF_AssertFail
_021E5AFA:
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_021E5B00: .word ov62_021E5B04
	thumb_func_end ov62_021E5A9C

	thumb_func_start ov62_021E5B04
ov62_021E5B04: ; 0x021E5B04
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	bl ov62_021E5A8C
	ldr r1, [r4]
	cmp r1, #3
	bhi _021E5B5E
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E5B20: ; jump table
	.short _021E5B28 - _021E5B20 - 2 ; case 0
	.short _021E5B34 - _021E5B20 - 2 ; case 1
	.short _021E5B48 - _021E5B20 - 2 ; case 2
	.short _021E5B54 - _021E5B20 - 2 ; case 3
_021E5B28:
	add r0, #0xf0
	bl ov62_021E625C
	mov r0, #1
	str r0, [r4]
	pop {r3, r4, r5, pc}
_021E5B34:
	bl ov62_021E6630
	cmp r0, #0
	beq _021E5B62
	ldr r0, _021E5B64 ; =0x000005DC
	bl PlaySE
	mov r0, #2
	str r0, [r4]
	pop {r3, r4, r5, pc}
_021E5B48:
	add r0, #0xf0
	bl ov62_021E6278
	mov r0, #3
	str r0, [r4]
	pop {r3, r4, r5, pc}
_021E5B54:
	ldr r1, _021E5B68 ; =ov62_021E5B6C
	add r0, r5, #0
	bl ov62_021E5A84
	pop {r3, r4, r5, pc}
_021E5B5E:
	bl GF_AssertFail
_021E5B62:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E5B64: .word 0x000005DC
_021E5B68: .word ov62_021E5B6C
	thumb_func_end ov62_021E5B04

	thumb_func_start ov62_021E5B6C
ov62_021E5B6C: ; 0x021E5B6C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	bl ov62_021E5A8C
	ldr r1, [r4]
	cmp r1, #0
	beq _021E5B86
	cmp r1, #1
	beq _021E5B94
	cmp r1, #2
	beq _021E5BA4
	b _021E5BAE
_021E5B86:
	ldr r0, [r0, #0x14]
	mov r1, #1
	bl sub_0200DC4C
	mov r0, #1
	str r0, [r4]
	pop {r3, r4, r5, pc}
_021E5B94:
	ldr r0, [r0, #0x14]
	bl sub_0200DCA0
	cmp r0, #0
	bne _021E5BB2
	mov r0, #2
	str r0, [r4]
	pop {r3, r4, r5, pc}
_021E5BA4:
	ldr r1, _021E5BB4 ; =ov62_021E5BB8
	add r0, r5, #0
	bl ov62_021E5A84
	pop {r3, r4, r5, pc}
_021E5BAE:
	bl GF_AssertFail
_021E5BB2:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E5BB4: .word ov62_021E5BB8
	thumb_func_end ov62_021E5B6C

	thumb_func_start ov62_021E5BB8
ov62_021E5BB8: ; 0x021E5BB8
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	bl ov62_021E5A8C
	ldr r1, [r4]
	cmp r1, #0
	beq _021E5BD4
	cmp r1, #1
	beq _021E5BF8
	cmp r1, #2
	beq _021E5C08
	b _021E5C14
_021E5BD4:
	mov r1, #6
	str r1, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r1, #0x4e
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #1
	add sp, #0xc
	str r0, [r4]
	pop {r4, r5, pc}
_021E5BF8:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E5C18
	mov r0, #2
	add sp, #0xc
	str r0, [r4]
	pop {r4, r5, pc}
_021E5C08:
	ldr r1, _021E5C1C ; =ov62_021E5C20
	add r0, r5, #0
	bl ov62_021E5A84
	add sp, #0xc
	pop {r4, r5, pc}
_021E5C14:
	bl GF_AssertFail
_021E5C18:
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_021E5C1C: .word ov62_021E5C20
	thumb_func_end ov62_021E5BB8

	thumb_func_start ov62_021E5C20
ov62_021E5C20: ; 0x021E5C20
	push {r4, lr}
	add r4, r0, #0
	bl ov62_021E5A8C
	bl ov62_021E6600
	add r0, r4, #0
	bl ov62_021E5A94
	pop {r4, pc}
	thumb_func_end ov62_021E5C20

	thumb_func_start ov62_021E5C34
ov62_021E5C34: ; 0x021E5C34
	push {r4, lr}
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
	ldr r0, _021E5C78 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _021E5C7C ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r0, #0
	bl sub_0200FBDC
	mov r0, #1
	bl sub_0200FBDC
	mov r0, #0x20
	add r1, r4, #0
	bl GF_CreateVramTransferManager
	pop {r4, pc}
	nop
_021E5C78: .word 0xFFFFE0FF
_021E5C7C: .word 0x04001000
	thumb_func_end ov62_021E5C34

	thumb_func_start ov62_021E5C80
ov62_021E5C80: ; 0x021E5C80
	push {r3, lr}
	bl GF_DestroyVramTransferManager
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E5CB0 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _021E5CB4 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	pop {r3, pc}
	.balign 4, 0
_021E5CB0: .word 0xFFFFE0FF
_021E5CB4: .word 0x04001000
	thumb_func_end ov62_021E5C80

	thumb_func_start ov62_021E5CB8
ov62_021E5CB8: ; 0x021E5CB8
	ldr r3, _021E5CC0 ; =GX_SetBanks
	ldr r0, _021E5CC4 ; =ov62_021E66D0
	bx r3
	nop
_021E5CC0: .word GX_SetBanks
_021E5CC4: .word ov62_021E66D0
	thumb_func_end ov62_021E5CB8

	thumb_func_start ov62_021E5CC8
ov62_021E5CC8: ; 0x021E5CC8
	push {r4, lr}
	add r4, r0, #0
	bl NNS_GfdDoVramTransfer
	add r0, r4, #0
	bl ov62_021E5FC4
	add r4, #0xb8
	add r0, r4, #0
	bl ov62_021E60D4
	ldr r3, _021E5CEC ; =0x027E0000
	ldr r1, _021E5CF0 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.balign 4, 0
_021E5CEC: .word 0x027E0000
_021E5CF0: .word 0x00003FF8
	thumb_func_end ov62_021E5CC8

	thumb_func_start ov62_021E5CF4
ov62_021E5CF4: ; 0x021E5CF4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl sub_0200CF18
	ldr r1, _021E5D48 ; =ov62_021E66B0
	ldr r2, _021E5D4C ; =ov62_021E6668
	mov r3, #0x20
	str r0, [r5]
	bl sub_0200CF70
	add r0, r4, #0
	bl sub_0200B2E0
	add r0, r4, #0
	bl sub_0200B2E8
	ldr r0, [r5]
	bl sub_0200CF38
	str r0, [r5, #4]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	mov r2, #7
	bl sub_0200CFF4
	ldr r0, [r5]
	ldr r1, [r5, #4]
	ldr r2, _021E5D50 ; =ov62_021E667C
	bl sub_0200D3F8
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	pop {r3, r4, r5, pc}
	nop
_021E5D48: .word ov62_021E66B0
_021E5D4C: .word ov62_021E6668
_021E5D50: .word ov62_021E667C
	thumb_func_end ov62_021E5CF4

	thumb_func_start ov62_021E5D54
ov62_021E5D54: ; 0x021E5D54
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl sub_0200D108
	mov r0, #0
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end ov62_021E5D54

	thumb_func_start ov62_021E5D64
ov62_021E5D64: ; 0x021E5D64
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_021E5D6A:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, #8]
	bl sub_0200DC18
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #7
	blo _021E5D6A
	ldr r0, [r5, #4]
	bl sub_0200D020
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov62_021E5D64

	thumb_func_start ov62_021E5D88
ov62_021E5D88: ; 0x021E5D88
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _021E5F58 ; =0x00000A03
	mov r2, #0xb0
	str r0, [sp, #0xc]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	mov r3, #6
	bl sub_0200D564
	mov r0, #0
	str r0, [sp]
	ldr r0, _021E5F5C ; =0x00000A02
	mov r2, #0xb0
	str r0, [sp, #4]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	mov r3, #8
	bl sub_0200D6D4
	mov r0, #0
	str r0, [sp]
	ldr r0, _021E5F60 ; =0x00000A04
	mov r2, #0xb0
	str r0, [sp, #4]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	mov r3, #9
	bl sub_0200D704
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _021E5F64 ; =0x00000A01
	mov r2, #0xb0
	str r0, [sp, #8]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	mov r3, #7
	bl sub_0200D4A4
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _021E5F68 ; =0x00000B03
	mov r2, #0xb0
	str r0, [sp, #0xc]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	mov r3, #0xa
	bl sub_0200D564
	mov r0, #0
	str r0, [sp]
	ldr r0, _021E5F6C ; =0x00000B02
	mov r2, #0xb0
	str r0, [sp, #4]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	mov r3, #0xc
	bl sub_0200D6D4
	mov r0, #0
	str r0, [sp]
	ldr r0, _021E5F70 ; =0x00000B04
	mov r2, #0xb0
	str r0, [sp, #4]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	mov r3, #0xd
	bl sub_0200D704
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _021E5F74 ; =0x00000B01
	mov r2, #0xb0
	str r0, [sp, #8]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	mov r3, #0xb
	bl sub_0200D4A4
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	ldr r0, _021E5F78 ; =0x00000D03
	mov r2, #0xb0
	str r0, [sp, #0xc]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	mov r3, #0x12
	bl sub_0200D564
	mov r0, #0
	str r0, [sp]
	ldr r0, _021E5F7C ; =0x00000D02
	mov r2, #0xb0
	str r0, [sp, #4]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	mov r3, #0x14
	bl sub_0200D6D4
	mov r0, #0
	str r0, [sp]
	ldr r0, _021E5F80 ; =0x00000D04
	mov r2, #0xb0
	str r0, [sp, #4]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	mov r3, #0x15
	bl sub_0200D704
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _021E5F84 ; =0x00000D01
	mov r2, #0xb0
	str r0, [sp, #8]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	mov r3, #0x13
	bl sub_0200D4A4
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _021E5F88 ; =0x00000C03
	mov r2, #0xb0
	str r0, [sp, #0xc]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	mov r3, #0xe
	bl sub_0200D564
	mov r0, #0
	str r0, [sp]
	ldr r0, _021E5F8C ; =0x00000C02
	mov r2, #0xb0
	str r0, [sp, #4]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	mov r3, #0x10
	bl sub_0200D6D4
	mov r0, #0
	str r0, [sp]
	ldr r0, _021E5F90 ; =0x00000C04
	mov r2, #0xb0
	str r0, [sp, #4]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	mov r3, #0x11
	bl sub_0200D704
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _021E5F94 ; =0x00000C01
	mov r2, #0xb0
	str r0, [sp, #8]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	mov r3, #0xf
	bl sub_0200D4A4
	ldr r7, _021E5F98 ; =ov62_021E67C8
	mov r4, #0
_021E5EFC:
	ldr r2, _021E5F9C ; =ov62_021E6694
	lsl r3, r4, #2
	add r6, r5, r3
	ldr r3, [r2, r3]
	mov r2, #0x34
	mul r2, r3
	ldr r0, [r5]
	ldr r1, [r5, #4]
	add r2, r7, r2
	bl sub_0200D734
	mov r1, #1
	str r0, [r6, #8]
	bl sub_0200DC78
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #7
	blo _021E5EFC
	mov r4, #0
	add r6, r4, #0
_021E5F28:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, #0x18]
	add r1, r6, #0
	bl sub_0200DCE8
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #3
	blo _021E5F28
	ldr r0, [r5, #8]
	mov r1, #1
	bl sub_0200E0C0
	ldr r0, [r5, #0x14]
	mov r1, #1
	bl sub_0200DD54
	mov r0, #0xa
	add r5, #0xb4
	str r0, [r5]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E5F58: .word 0x00000A03
_021E5F5C: .word 0x00000A02
_021E5F60: .word 0x00000A04
_021E5F64: .word 0x00000A01
_021E5F68: .word 0x00000B03
_021E5F6C: .word 0x00000B02
_021E5F70: .word 0x00000B04
_021E5F74: .word 0x00000B01
_021E5F78: .word 0x00000D03
_021E5F7C: .word 0x00000D02
_021E5F80: .word 0x00000D04
_021E5F84: .word 0x00000D01
_021E5F88: .word 0x00000C03
_021E5F8C: .word 0x00000C02
_021E5F90: .word 0x00000C04
_021E5F94: .word 0x00000C01
_021E5F98: .word ov62_021E67C8
_021E5F9C: .word ov62_021E6694
	thumb_func_end ov62_021E5D88

	thumb_func_start ov62_021E5FA0
ov62_021E5FA0: ; 0x021E5FA0
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r4, #0
	add r5, r6, #0
_021E5FA8:
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _021E5FB2
	bl sub_0200D9DC
_021E5FB2:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #7
	blt _021E5FA8
	ldr r0, [r6]
	ldr r1, [r6, #4]
	bl sub_0200D998
	pop {r4, r5, r6, pc}
	thumb_func_end ov62_021E5FA0

	thumb_func_start ov62_021E5FC4
ov62_021E5FC4: ; 0x021E5FC4
	push {r3, lr}
	ldr r0, [r0]
	cmp r0, #0
	beq _021E5FD0
	bl sub_0200D034
_021E5FD0:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov62_021E5FC4

	thumb_func_start ov62_021E5FD4
ov62_021E5FD4: ; 0x021E5FD4
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r0, r1, #0
	str r1, [sp]
	bl BgConfig_Alloc
	str r0, [r6]
	ldr r0, _021E601C ; =ov62_021E6658
	bl SetBothScreensModesAndDisable
	ldr r4, _021E6020 ; =ov62_021E6728
	mov r7, #0
	add r5, r4, #0
_021E5FEE:
	ldrb r1, [r4, #0x1c]
	ldrb r3, [r4, #0x1d]
	ldr r0, [r6]
	add r2, r5, #0
	bl InitBgFromTemplate
	ldrb r1, [r4, #0x1c]
	ldr r0, [r6]
	bl BgClearTilemapBufferAndCommit
	ldrb r0, [r4, #0x1c]
	ldr r3, [sp]
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	add r7, r7, #1
	add r4, #0x20
	add r5, #0x20
	cmp r7, #5
	blo _021E5FEE
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E601C: .word ov62_021E6658
_021E6020: .word ov62_021E6728
	thumb_func_end ov62_021E5FD4

	thumb_func_start ov62_021E6024
ov62_021E6024: ; 0x021E6024
	push {r4, r5, r6, lr}
	ldr r5, _021E6044 ; =ov62_021E6728
	add r6, r0, #0
	mov r4, #0
_021E602C:
	ldrb r1, [r5, #0x1c]
	ldr r0, [r6]
	bl FreeBgTilemapBuffer
	add r4, r4, #1
	add r5, #0x20
	cmp r4, #5
	blo _021E602C
	ldr r0, [r6]
	bl FreeToHeap
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E6044: .word ov62_021E6728
	thumb_func_end ov62_021E6024

	thumb_func_start ov62_021E6048
ov62_021E6048: ; 0x021E6048
	bx lr
	.balign 4, 0
	thumb_func_end ov62_021E6048

	thumb_func_start ov62_021E604C
ov62_021E604C: ; 0x021E604C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r1, #0
	mov r1, #0
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0xb0
	add r2, r1, #0
	add r3, r1, #0
	str r4, [sp, #4]
	bl GfGfxLoader_GXLoadPal
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldr r2, [r5]
	mov r0, #0xb0
	mov r1, #4
	mov r3, #5
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	mov r1, #5
	ldr r2, [r5]
	mov r0, #0xb0
	add r3, r1, #0
	bl GfGfxLoader_LoadScrnData
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0xb0
	mov r1, #1
	mov r2, #4
	mov r3, #0
	str r4, [sp, #4]
	bl GfGfxLoader_GXLoadPal
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldr r2, [r5]
	mov r0, #0xb0
	mov r1, #2
	mov r3, #1
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldr r2, [r5]
	mov r0, #0xb0
	mov r1, #3
	mov r3, #1
	bl GfGfxLoader_LoadScrnData
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov62_021E604C

	thumb_func_start ov62_021E60D4
ov62_021E60D4: ; 0x021E60D4
	push {r3, lr}
	ldr r0, [r0]
	cmp r0, #0
	beq _021E60E0
	bl BgConfig_HandleScheduledScrollAndTransferOps
_021E60E0:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov62_021E60D4

	thumb_func_start ov62_021E60E4
ov62_021E60E4: ; 0x021E60E4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp, #0x14]
	add r3, r1, #0
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xea
	bl NewMsgDataFromNarc
	ldr r1, [sp, #0x14]
	ldr r4, _021E6174 ; =ov62_021E66F8
	str r0, [r1, #0x34]
	add r0, r1, #0
	mov r6, #0
	add r5, r0, #4
_021E6102:
	ldrb r0, [r4, #2]
	add r1, r5, #0
	str r0, [sp]
	ldrb r0, [r4, #3]
	str r0, [sp, #4]
	ldrb r0, [r4, #4]
	str r0, [sp, #8]
	ldrb r0, [r4, #5]
	str r0, [sp, #0xc]
	ldrh r0, [r4, #6]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldrb r2, [r4]
	ldrb r3, [r4, #1]
	ldr r0, [r0]
	bl AddWindowParameterized
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	bl ClearWindowTilemap
	ldr r0, [sp, #0x14]
	add r1, r6, #0
	ldr r0, [r0, #0x34]
	bl NewString_ReadMsgData
	add r7, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [r4, #0xc]
	add r2, r7, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldrb r1, [r4, #8]
	add r0, r5, #0
	mov r3, #0
	bl AddTextPrinterParameterized2
	add r0, r7, #0
	bl String_dtor
	add r0, r5, #0
	bl CopyWindowToVram
	add r6, r6, #1
	add r4, #0x10
	add r5, #0x10
	cmp r6, #3
	blt _021E6102
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E6174: .word ov62_021E66F8
	thumb_func_end ov62_021E60E4

	thumb_func_start ov62_021E6178
ov62_021E6178: ; 0x021E6178
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r4, #0
	add r5, r7, #4
	add r6, r4, #0
_021E6182:
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	add r1, r6, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	bl ClearWindowTilemap
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #3
	blt _021E6182
	ldr r0, [r7, #0x34]
	bl DestroyMsgData
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov62_021E6178

	thumb_func_start ov62_021E61AC
ov62_021E61AC: ; 0x021E61AC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #8
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl Sys_SetSleepDisableFlag
	mov r1, #0x12
	add r0, r4, #0
	lsl r1, r1, #4
	bl AllocFromHeap
	mov r2, #0x12
	add r4, r0, #0
	mov r1, #0
	lsl r2, r2, #4
	bl MI_CpuFill8
	str r4, [r5, #0x1c]
	mov r0, #0
	str r0, [r5]
	add r4, #0x1f
	mov r0, #0x1f
	bic r4, r0
	mov r0, #1
	str r4, [r5, #4]
	lsl r0, r0, #8
	str r0, [r5, #8]
	mov r0, #0x41
	lsl r0, r0, #6
	str r0, [r5, #0xc]
	mov r0, #1
	str r0, [r5, #0x10]
	str r6, [r5, #0x14]
	str r7, [r5, #0x18]
	bl sub_02005518
	str r0, [r5, #0x34]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov62_021E61AC

	thumb_func_start ov62_021E61FC
ov62_021E61FC: ; 0x021E61FC
	push {r3, lr}
	ldr r0, [r0, #0x1c]
	bl FreeToHeap
	mov r0, #8
	bl Sys_ClearSleepDisableFlag
	pop {r3, pc}
	thumb_func_end ov62_021E61FC

	thumb_func_start ov62_021E620C
ov62_021E620C: ; 0x021E620C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_02005518
	add r4, r0, #0
	beq _021E621E
	ldr r0, [r5, #0x34]
	cmp r0, #0
	bne _021E6256
_021E621E:
	ldr r0, [r5, #0x30]
	cmp r0, #0
	bne _021E6238
	ldr r0, [r5, #0x28]
	cmp r0, #0
	beq _021E6234
	add r0, r5, #0
	bl ov62_021E6278
	mov r0, #1
	str r0, [r5, #0x2c]
_021E6234:
	mov r0, #1
	str r0, [r5, #0x30]
_021E6238:
	cmp r4, #0
	beq _021E6256
	ldr r0, [r5, #0x34]
	cmp r0, #0
	bne _021E6256
	mov r0, #0
	str r0, [r5, #0x30]
	ldr r0, [r5, #0x2c]
	cmp r0, #0
	beq _021E6256
	add r0, r5, #0
	bl ov62_021E625C
	mov r0, #0
	str r0, [r5, #0x2c]
_021E6256:
	str r4, [r5, #0x34]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov62_021E620C

	thumb_func_start ov62_021E625C
ov62_021E625C: ; 0x021E625C
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x30]
	cmp r1, #0
	bne _021E6270
	bl GF_MIC_StartAutoSampling
	mov r0, #1
	str r0, [r4, #0x28]
	pop {r4, pc}
_021E6270:
	mov r0, #1
	str r0, [r4, #0x2c]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov62_021E625C

	thumb_func_start ov62_021E6278
ov62_021E6278: ; 0x021E6278
	push {r4, lr}
	add r4, r0, #0
	bl GF_MIC_StopAutoSampling
	mov r0, #0
	str r0, [r4, #0x28]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov62_021E6278

	thumb_func_start ov62_021E6288
ov62_021E6288: ; 0x021E6288
	push {r3, r4, r5, lr}
	ldr r1, [r0, #8]
	mov r2, #0
	sub r1, r1, #1
	add r4, r2, #0
	ldr r5, [r0, #4]
	cmp r1, #0
	ble _021E62AE
	mov r0, #1
	lsl r0, r0, #8
_021E629C:
	ldrb r3, [r5, r4]
	cmp r3, #0x80
	bhs _021E62A6
	sub r3, r0, r3
	b _021E62A6
_021E62A6:
	add r4, r4, #1
	add r2, r2, r3
	cmp r4, r1
	blt _021E629C
_021E62AE:
	add r0, r2, #0
	bl _s32_div_f
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov62_021E6288

	thumb_func_start ov62_021E62B8
ov62_021E62B8: ; 0x021E62B8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	cmp r0, #0
	bne _021E638A
	add r4, r5, #0
	add r4, #0xf0
	add r0, r4, #0
	bl ov62_021E6288
	add r7, r0, #0
	ldr r0, [r4, #0x20]
	cmp r0, r7
	bge _021E62E4
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	bl ov62_021E6390
	add r6, r0, #0
	str r7, [r4, #0x20]
	mov r0, #1
	str r0, [r4, #0x24]
	b _021E62F4
_021E62E4:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl ov62_021E6390
	add r6, r0, #0
	ldr r0, [r4, #0x20]
	sub r0, r0, #2
	str r0, [r4, #0x20]
_021E62F4:
	cmp r6, #0
	beq _021E6368
	ldr r0, [r4, #0x24]
	cmp r0, #0
	beq _021E630A
	ldr r0, [r5, #0x10]
	mov r1, #1
	bl sub_0200DC4C
	mov r0, #0
	str r0, [r4, #0x24]
_021E630A:
	add r0, r5, #0
	bl ov62_021E63D0
	cmp r0, #0
	beq _021E6326
	mov r1, #0x4e
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	add r0, r5, #0
	mov r2, #0x80
	mov r3, #0x40
	bl ov62_021E63E8
	b _021E6356
_021E6326:
	add r0, r5, #0
	add r0, #0xb4
	ldr r0, [r0]
	sub r1, r0, #1
	add r0, r5, #0
	add r0, #0xb4
	str r1, [r0]
	add r0, r5, #0
	add r0, #0xb4
	ldr r0, [r0]
	cmp r0, #0
	bne _021E6356
	mov r1, #0x4e
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	add r0, r5, #0
	mov r2, #0x80
	mov r3, #0x40
	bl ov62_021E63E8
	add r0, r5, #0
	mov r1, #0xa
	add r0, #0xb4
	str r1, [r0]
_021E6356:
	ldr r0, [r5, #8]
	add r1, r6, #0
	bl sub_0200DC4C
	ldr r0, [r5, #0xc]
	add r1, r6, #0
	bl sub_0200DC4C
	b _021E6382
_021E6368:
	bne _021E6382
	ldr r0, [r5, #0x10]
	mov r1, #0
	bl sub_0200DC4C
	ldr r0, [r5, #8]
	mov r1, #0
	bl sub_0200DC4C
	ldr r0, [r5, #0xc]
	mov r1, #0
	bl sub_0200DC4C
_021E6382:
	ldr r0, _021E638C ; =_021E68E0
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
_021E638A:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E638C: .word _021E68E0
	thumb_func_end ov62_021E62B8

	thumb_func_start ov62_021E6390
ov62_021E6390: ; 0x021E6390
	push {r4, lr}
	cmp r0, #0x8c
	bhi _021E639A
	mov r4, #0
	b _021E63CA
_021E639A:
	cmp r0, #0x8d
	blo _021E63A6
	cmp r0, #0x98
	bhi _021E63A6
	mov r4, #1
	b _021E63CA
_021E63A6:
	cmp r0, #0x99
	blo _021E63B2
	cmp r0, #0xa6
	bhi _021E63B2
	mov r4, #2
	b _021E63CA
_021E63B2:
	cmp r0, #0xa7
	blo _021E63BE
	cmp r0, #0xbb
	bhi _021E63BE
	mov r4, #3
	b _021E63CA
_021E63BE:
	cmp r0, #0xbc
	blo _021E63C6
	mov r4, #4
	b _021E63CA
_021E63C6:
	bl GF_AssertFail
_021E63CA:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov62_021E6390

	thumb_func_start ov62_021E63D0
ov62_021E63D0: ; 0x021E63D0
	mov r2, #0
_021E63D2:
	ldr r1, [r0, #0x50]
	cmp r1, #0
	beq _021E63DC
	mov r0, #0
	bx lr
_021E63DC:
	add r2, r2, #1
	add r0, #0x30
	cmp r2, #3
	blt _021E63D2
	mov r0, #1
	bx lr
	thumb_func_end ov62_021E63D0

	thumb_func_start ov62_021E63E8
ov62_021E63E8: ; 0x021E63E8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	mov r4, #0
	str r3, [sp, #0x10]
	add r7, r2, #0
	str r4, [sp, #0x14]
	add r1, r4, #0
	add r3, r0, #0
_021E63F8:
	ldr r2, [r3, #0x50]
	cmp r2, #0
	bne _021E6414
	mov r2, #0x30
	mul r2, r1
	add r1, r1, #4
	add r3, r0, #0
	lsl r1, r1, #2
	add r0, r0, r1
	ldr r0, [r0, #8]
	add r3, #0x24
	add r4, r3, r2
	str r0, [sp, #0x14]
	b _021E641C
_021E6414:
	add r1, r1, #1
	add r3, #0x30
	cmp r1, #3
	blt _021E63F8
_021E641C:
	cmp r4, #0
	beq _021E6472
	bl LCRandom
	ldr r1, _021E6478 ; =0x00001002
	mul r1, r0
	asr r0, r1, #0xf
	lsr r0, r0, #0x10
	add r0, r1, r0
	asr r1, r0, #0x10
	ldr r0, _021E647C ; =0x00001333
	add r6, r1, r0
	bl LCRandom
	mov r1, #0x3e
	mul r1, r0
	asr r0, r1, #0xf
	lsr r0, r0, #0x10
	add r0, r1, r0
	asr r5, r0, #0x10
	add r5, #0x3c
	bl LCRandom
	lsl r1, r0, #4
	asr r0, r1, #0xf
	lsr r0, r0, #0x10
	add r0, r1, r0
	asr r0, r0, #0x10
	str r6, [sp]
	add r0, r0, #6
	str r5, [sp, #4]
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x14]
	ldr r3, [sp, #0x10]
	add r1, r4, #0
	add r2, r7, #0
	bl ov62_021E6480
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E6472:
	mov r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E6478: .word 0x00001002
_021E647C: .word 0x00001333
	thumb_func_end ov62_021E63E8

	thumb_func_start ov62_021E6480
ov62_021E6480: ; 0x021E6480
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r2, #0
	ldr r0, _021E656C ; =ov62_021E6570
	add r4, r1, #0
	mov r2, #0
	add r6, r3, #0
	bl CreateSysTask
	str r0, [r4, #0x2c]
	bl sub_0201F988
	add r4, r0, #0
	ldr r0, [sp, #0x24]
	str r7, [r4]
	str r0, [r4, #4]
	cmp r5, #0
	ble _021E64B6
	lsl r0, r5, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _021E64C4
_021E64B6:
	lsl r0, r5, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_021E64C4:
	bl _ffix
	str r0, [r4, #8]
	cmp r6, #0
	ble _021E64E0
	lsl r0, r6, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _021E64EE
_021E64E0:
	lsl r0, r6, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_021E64EE:
	bl _ffix
	str r0, [r4, #0xc]
	mov r0, #0
	str r0, [r4, #0x10]
	ldr r0, [sp, #0x1c]
	add r0, #0x5a
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl GF_SinDegNoWrap
	add r2, r0, #0
	ldr r0, [sp, #0x18]
	asr r3, r2, #0x1f
	asr r7, r0, #0x1f
	add r1, r7, #0
	str r0, [sp]
	bl _ll_mul
	add r2, r0, #0
	mov r0, #2
	mov r3, #0
	lsl r0, r0, #0xa
	add r0, r2, r0
	adc r1, r3
	lsl r1, r1, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	str r0, [r4, #0x14]
	ldr r0, [sp, #0x1c]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl GF_SinDegNoWrap
	add r2, r0, #0
	ldr r0, [sp]
	add r1, r7, #0
	asr r3, r2, #0x1f
	bl _ll_mul
	mov r3, #2
	mov r2, #0
	lsl r3, r3, #0xa
	add r3, r0, r3
	adc r1, r2
	lsl r0, r1, #0x14
	lsr r1, r3, #0xc
	orr r1, r0
	neg r0, r1
	str r0, [r4, #0x18]
	str r2, [r4, #0x1c]
	mov r0, #6
	str r2, [r4, #0x20]
	lsl r0, r0, #0xc
	str r0, [r4, #0x24]
	ldr r0, [sp, #0x20]
	add r1, r5, #0
	str r0, [r4, #0x28]
	ldr r0, [r4]
	add r2, r6, #0
	bl sub_0200DDB8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E656C: .word ov62_021E6570
	thumb_func_end ov62_021E6480

	thumb_func_start ov62_021E6570
ov62_021E6570: ; 0x021E6570
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021E658C
	sub r0, r0, #1
	str r0, [r5, #4]
	bne _021E65FC
	ldr r0, [r5]
	mov r1, #1
	bl sub_0200DCE8
	pop {r3, r4, r5, r6, r7, pc}
_021E658C:
	add r0, r5, #0
	add r0, #8
	add r1, #0x14
	add r2, r0, #0
	bl VEC_Add
	ldr r0, [r5, #8]
	ldr r2, [r5, #0x20]
	lsl r0, r0, #4
	asr r6, r0, #0x10
	ldr r0, [r5, #0xc]
	ldr r1, [r5, #0x24]
	lsl r0, r0, #4
	add r3, r2, r1
	mov r1, #0x5a
	asr r4, r0, #0x10
	add r0, r5, #0
	lsl r1, r1, #0xe
	add r0, #0x20
	str r3, [r5, #0x20]
	cmp r3, r1
	ble _021E65C6
	add r2, r1, #0
_021E65BA:
	ldr r3, [r0]
	sub r3, r3, r1
	str r3, [r0]
	ldr r3, [r5, #0x20]
	cmp r3, r2
	bgt _021E65BA
_021E65C6:
	lsl r0, r3, #4
	lsr r0, r0, #0x10
	bl GF_SinDegNoWrap
	ldr r1, [r5, #0x28]
	add r2, r4, #0
	mul r0, r1
	asr r0, r0, #0xc
	add r0, r6, r0
	lsl r0, r0, #0x10
	asr r1, r0, #0x10
	ldr r0, [r5]
	bl sub_0200DDB8
	mov r0, #0xf
	mvn r0, r0
	cmp r4, r0
	bge _021E65FC
	ldr r0, [r5]
	mov r1, #0
	bl sub_0200DCE8
	add r0, r7, #0
	bl DestroySysTask
	mov r0, #0
	str r0, [r5, #0x2c]
_021E65FC:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov62_021E6570

	thumb_func_start ov62_021E6600
ov62_021E6600: ; 0x021E6600
	push {r4, r5, r6, lr}
	mov r4, #0
	add r5, r0, #0
	add r6, r4, #0
_021E6608:
	ldr r0, [r5, #0x50]
	cmp r0, #0
	beq _021E6614
	bl DestroySysTask
	str r6, [r5, #0x50]
_021E6614:
	add r4, r4, #1
	add r5, #0x30
	cmp r4, #3
	blt _021E6608
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov62_021E6600

	thumb_func_start ov62_021E6620
ov62_021E6620: ; 0x021E6620
	ldr r3, _021E6628 ; =sub_02025224
	ldr r0, _021E662C ; =_021E6650
	bx r3
	nop
_021E6628: .word sub_02025224
_021E662C: .word _021E6650
	thumb_func_end ov62_021E6620

	thumb_func_start ov62_021E6630
ov62_021E6630: ; 0x021E6630
	push {r3, lr}
	bl ov62_021E6620
	cmp r0, #0
	beq _021E6644
	ldr r0, _021E664C ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #2
	tst r0, r1
	beq _021E6648
_021E6644:
	mov r0, #1
	pop {r3, pc}
_021E6648:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_021E664C: .word gSystem
	thumb_func_end ov62_021E6630

	.rodata

_021E6650:
	.byte 0xA0, 0xC0, 0xB8, 0xF8, 0xFF, 0x00, 0x00, 0x00

ov62_021E6658: ; 0x021E6658
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov62_021E6668: ; 0x021E6668
	.byte 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00
	.byte 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00

ov62_021E667C: ; 0x021E667C
	.byte 0x20, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov62_021E6694: ; 0x021E6694
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00

ov62_021E66B0: ; 0x021E66B0
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00

ov62_021E66D0: ; 0x021E66D0
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov62_021E66F8: ; 0x021E66F8
	.byte 0x00, 0x01, 0x01, 0x09, 0x03, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x0F, 0x00, 0x04, 0x05, 0x08, 0x16, 0x05, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x0F, 0x00, 0x04, 0x18, 0x15, 0x06, 0x02, 0x00, 0x6F, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x0E, 0x00

ov62_021E6728: ; 0x021E6728
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x01, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x02, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x01, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00

ov62_021E67C8: ; 0x021E67C8
	.byte 0x40, 0x00, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x0A, 0x00, 0x00
	.byte 0x03, 0x0A, 0x00, 0x00, 0x02, 0x0A, 0x00, 0x00, 0x04, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x60, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x0A, 0x00, 0x00, 0x03, 0x0A, 0x00, 0x00, 0x02, 0x0A, 0x00, 0x00, 0x04, 0x0A, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x0B, 0x00, 0x00, 0x03, 0x0B, 0x00, 0x00, 0x02, 0x0B, 0x00, 0x00
	.byte 0x04, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xD8, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x0D, 0x00, 0x00, 0x03, 0x0D, 0x00, 0x00
	.byte 0x02, 0x0D, 0x00, 0x00, 0x04, 0x0D, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x0C, 0x00, 0x00
	.byte 0x03, 0x0C, 0x00, 0x00, 0x02, 0x0C, 0x00, 0x00, 0x04, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.public ov62_021E68CC
ov62_021E68CC:
	.word ov62_021E5900, ov62_021E5A1C, ov62_021E59C0, 0xFFFFFFFF

	.bss

_021E68E0:
	.space 0x20
