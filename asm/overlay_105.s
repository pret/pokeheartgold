	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov105_021E5900
ov105_021E5900: ; 0x021E5900
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	mov r2, #0x31
	add r5, r0, #0
	mov r0, #3
	mov r1, #0x97
	lsl r2, r2, #0xc
	bl CreateHeap
	add r0, r5, #0
	mov r1, #0xa8
	mov r2, #0x97
	bl OverlayManager_CreateAndGetData
	mov r1, #0
	mov r2, #0xa8
	add r4, r0, #0
	bl memset
	add r0, r5, #0
	bl OverlayManager_GetParentWork
	add r5, r0, #0
	add r0, r4, #0
	ldrb r1, [r5]
	add r0, #0x9c
	strb r1, [r0]
	add r0, r4, #0
	ldrb r1, [r5, #1]
	add r0, #0x9d
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #0
	add r0, #0x9e
	strb r1, [r0]
	mov r0, #0x97
	bl GF_Camera_Create
	str r0, [r4]
	bl ov105_021E5B68
	add r0, r4, #0
	bl ov105_021E5CA4
	add r0, r4, #0
	bl ov105_021E5BCC
	mov r4, #0
	mov r7, #2
	mov r6, #4
_021E5964:
	ldr r2, [r5, #4]
	mov r0, #6
	add r1, r4, #0
	mul r1, r0
	add r3, r2, r1
	ldrsh r1, [r2, r1]
	ldrsh r2, [r3, r7]
	ldrsh r3, [r3, r6]
	add r0, r4, #0
	bl NNS_G3dGlbLightVector
	ldr r2, [r5, #4]
	lsl r1, r4, #1
	add r1, r2, r1
	ldrh r1, [r1, #0x18]
	add r0, r4, #0
	bl NNS_G3dGlbLightColor
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _021E5964
	ldr r2, [r5, #4]
	ldrh r0, [r2, #0x20]
	ldrh r1, [r2, #0x22]
	ldr r2, [r2, #0x28]
	bl NNS_G3dGlbMaterialColorDiffAmb
	ldr r2, [r5, #4]
	ldrh r0, [r2, #0x24]
	ldrh r1, [r2, #0x26]
	ldr r2, [r2, #0x2c]
	bl NNS_G3dGlbMaterialColorSpecEmi
	ldr r3, [r5, #4]
	ldr r0, [r3, #0x40]
	str r0, [sp]
	ldr r0, [r3, #0x44]
	str r0, [sp, #4]
	ldr r0, [r3, #0x30]
	ldr r1, [r3, #0x34]
	ldr r2, [r3, #0x38]
	ldr r3, [r3, #0x3c]
	bl NNS_G3dGlbPolygonAttr
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x97
	str r0, [sp, #8]
	mov r0, #3
	add r2, r1, #0
	mov r3, #0
	bl BeginNormalPaletteFade
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov105_021E5900

	thumb_func_start ov105_021E59DC
ov105_021E59DC: ; 0x021E59DC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	add r6, r1, #0
	bl OverlayManager_GetData
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x9f
	ldrb r2, [r1]
	mov r1, #0x7c
	add r0, r5, #4
	mul r1, r2
	add r4, r0, r1
	ldr r0, [r6]
	mov r7, #0
	cmp r0, #0
	beq _021E5A04
	cmp r0, #1
	beq _021E5A28
	b _021E5A6C
_021E5A04:
	ldr r1, [r4, #0x6c]
	mov r0, #1
	ldr r2, [r1]
	ldr r1, [r1, #8]
	lsl r0, r0, #0xc
	ldrh r1, [r1, #4]
	add r0, r2, r0
	lsl r1, r1, #0xc
	cmp r0, r1
	bne _021E5A6C
	mov r0, #1
	mov r1, #0x97
	bl sub_020880CC
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _021E5A6C
_021E5A28:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E5A6C
	add r0, r5, #0
	add r0, #0x9f
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r5, #0
	add r0, #0x9f
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0xa0
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r5, #0
	add r0, #0xa0
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0xa0
	ldrb r0, [r0]
	cmp r0, #1
	blo _021E5A5A
	mov r7, #1
	b _021E5A6C
_021E5A5A:
	add r0, r5, #0
	bl ov105_021E5BCC
	add r0, r7, #0
	mov r1, #0x97
	bl sub_020880CC
	add r0, r7, #0
	str r0, [r6]
_021E5A6C:
	add r0, r5, #0
	add r0, #0xa1
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r5, #0
	add r0, #0xa1
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0xa1
	ldrb r0, [r0]
	cmp r0, #0x1e
	bne _021E5A9A
	add r0, r5, #0
	add r0, #0xa4
	add r5, #0x9f
	ldr r1, [r0]
	ldrb r0, [r5]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl PlaySE
_021E5A9A:
	mov r3, #1
	mov r2, #0
	lsl r3, r3, #0xc
_021E5AA0:
	lsl r0, r2, #2
	add r0, r4, r0
	ldr r1, [r0, #0x6c]
	ldr r5, [r1, #8]
	ldr r0, [r1]
	ldrh r5, [r5, #4]
	add r0, r0, r3
	lsl r5, r5, #0xc
	cmp r0, r5
	bge _021E5AB6
	str r0, [r1]
_021E5AB6:
	add r0, r2, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	cmp r2, #4
	blo _021E5AA0
	ldr r5, _021E5B0C ; =ov105_021E5E08
	add r3, sp, #0x18
	mov r2, #4
_021E5AC6:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E5AC6
	ldr r0, [r5]
	add r2, sp, #0xc
	str r0, [r3]
	ldr r3, _021E5B10 ; =ov105_021E5DD4
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r1, sp, #0
	str r0, [r2]
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	bl sub_02026E48
	bl sub_02023154
	add r0, r4, #0
	add r1, sp, #0
	add r2, sp, #0x18
	add r3, sp, #0xc
	bl Draw3dModel
	mov r0, #1
	add r1, r0, #0
	bl sub_02026E50
	add r0, r7, #0
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	nop
_021E5B0C: .word ov105_021E5E08
_021E5B10: .word ov105_021E5DD4
	thumb_func_end ov105_021E59DC

	thumb_func_start ov105_021E5B14
ov105_021E5B14: ; 0x021E5B14
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	bl OverlayManager_GetData
	add r7, r0, #0
	str r0, [sp, #4]
	add r6, r0, #4
	mov r4, #0
	add r7, #0x80
_021E5B28:
	lsl r0, r4, #2
	add r5, r6, r0
	ldr r1, [r5, #0x6c]
	add r0, r7, #0
	bl NNS_G3dFreeAnmObj
	ldr r0, [r5, #0x5c]
	bl FreeToHeap
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _021E5B28
	ldr r0, [r6, #0x58]
	bl FreeToHeap
	ldr r0, [sp, #4]
	ldr r0, [r0]
	bl sub_02023120
	ldr r0, [sp]
	bl OverlayManager_FreeData
	bl sub_0201F63C
	mov r0, #0x97
	bl DestroyHeap
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov105_021E5B14

	thumb_func_start ov105_021E5B68
ov105_021E5B68: ; 0x021E5B68
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
	ldr r0, _021E5BB8 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _021E5BBC ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	bl ov105_021E5C84
	mov r0, #0x97
	bl sub_0201F590
	ldr r2, _021E5BC0 ; =0x04000060
	ldr r0, _021E5BC4 ; =0xFFFFCFFF
	ldrh r1, [r2]
	and r1, r0
	mov r0, #0x20
	orr r0, r1
	strh r0, [r2]
	ldr r0, _021E5BC8 ; =ov105_021E5DE0
	bl G3X_SetEdgeColorTable
	bl GX_SwapDisplay
	pop {r3, pc}
	nop
_021E5BB8: .word 0xFFFFE0FF
_021E5BBC: .word 0x04001000
_021E5BC0: .word 0x04000060
_021E5BC4: .word 0xFFFFCFFF
_021E5BC8: .word ov105_021E5DE0
	thumb_func_end ov105_021E5B68

	thumb_func_start ov105_021E5BCC
ov105_021E5BCC: ; 0x021E5BCC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r4, r0, #0
	add r5, sp, #0xc
	mov r0, #0
	str r0, [r5]
	str r0, [r5, #4]
	str r0, [r5, #8]
	add r2, r4, #0
	add r2, #0x90
	ldmia r5!, {r0, r1}
	add r3, r2, #0
	stmia r2!, {r0, r1}
	ldr r0, [r5]
	mov r1, #0x14
	str r0, [r2]
	add r0, r4, #0
	add r0, #0x9f
	ldrb r7, [r0]
	add r0, r4, #0
	add r0, #0x9c
	ldrb r0, [r0]
	add r6, r7, #0
	mul r6, r1
	add r5, r0, #0
	ldr r0, _021E5C6C ; =ov105_021E5E2C
	mul r5, r1
	add r1, r0, r5
	ldr r0, _021E5C70 ; =ov105_021E5E38
	add r2, r1, r6
	add r0, r0, r5
	ldrb r0, [r6, r0]
	add r2, r2, #4
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	str r0, [sp, #8]
	add r0, r3, #0
	ldr r3, _021E5C74 ; =ov105_021E5E3A
	ldr r1, [r1, r6]
	add r3, r3, r5
	ldrh r3, [r6, r3]
	bl GF_Camera_InitFromTargetDistanceAndAngle
	add r0, r4, #0
	add r0, #0x9c
	ldrb r1, [r0]
	ldr r3, _021E5C78 ; =ov105_021E5DF0
	mov r0, #0xc
	add r2, r1, #0
	mul r2, r0
	add r1, r3, r2
	mul r0, r7
	add r0, r1, r0
	ldr r1, [r4]
	bl GF_Camera_ShiftBy
	add r0, r4, #0
	add r0, #0x9c
	ldrb r0, [r0]
	ldr r3, _021E5C7C ; =ov105_021E5DCE
	lsl r2, r7, #2
	lsl r1, r0, #2
	ldr r0, _021E5C80 ; =ov105_021E5DCC
	add r0, r0, r1
	add r1, r3, r1
	ldrh r0, [r2, r0]
	ldrh r1, [r2, r1]
	ldr r2, [r4]
	lsl r0, r0, #0xc
	lsl r1, r1, #0xc
	bl GF_Camera_SetClipBounds
	ldr r0, [r4]
	bl GF_Camera_RegisterToStaticPtr
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E5C6C: .word ov105_021E5E2C
_021E5C70: .word ov105_021E5E38
_021E5C74: .word ov105_021E5E3A
_021E5C78: .word ov105_021E5DF0
_021E5C7C: .word ov105_021E5DCE
_021E5C80: .word ov105_021E5DCC
	thumb_func_end ov105_021E5BCC

	thumb_func_start ov105_021E5C84
ov105_021E5C84: ; 0x021E5C84
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E5CA0 ; =ov105_021E5E54
	add r3, sp, #0
	mov r2, #5
_021E5C8E:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E5C8E
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_021E5CA0: .word ov105_021E5E54
	thumb_func_end ov105_021E5C84

	thumb_func_start ov105_021E5CA4
ov105_021E5CA4: ; 0x021E5CA4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r0, #0
	mov r0, #0xf0
	mov r1, #0x97
	bl NARC_ctor
	str r0, [sp, #4]
	add r0, r7, #0
	add r0, #0x80
	mov r1, #0x97
	mov r2, #4
	bl GF_ExpHeap_FndInitAllocator
	add r0, r7, #0
	add r0, #0x9c
	ldrb r0, [r0]
	cmp r0, #0
	bne _021E5CE8
	add r0, r7, #0
	add r0, #0x9d
	ldrb r0, [r0]
	cmp r0, #0
	bne _021E5CDA
	ldr r0, _021E5DAC ; =ov105_021E5E8C
	str r0, [sp]
	b _021E5CDE
_021E5CDA:
	ldr r0, _021E5DB0 ; =_021E5E80
	str r0, [sp]
_021E5CDE:
	add r0, r7, #0
	ldr r1, _021E5DB4 ; =ov105_021E5DC8
	add r0, #0xa4
	str r1, [r0]
	b _021E5D04
_021E5CE8:
	add r0, r7, #0
	add r0, #0x9d
	ldrb r0, [r0]
	cmp r0, #0
	bne _021E5CF8
	ldr r0, _021E5DB8 ; =ov105_021E5EA4
	str r0, [sp]
	b _021E5CFC
_021E5CF8:
	ldr r0, _021E5DBC ; =ov105_021E5E98
	str r0, [sp]
_021E5CFC:
	add r0, r7, #0
	ldr r1, _021E5DC0 ; =_021E5DC4
	add r0, #0xa4
	str r1, [r0]
_021E5D04:
	ldr r1, [sp]
	ldr r0, [sp, #4]
	ldr r1, [r1]
	add r5, r7, #4
	mov r2, #0x97
	bl NARC_AllocAndReadWholeMember
	add r1, r5, #0
	add r2, r5, #0
	str r0, [r5, #0x58]
	add r0, r5, #0
	add r1, #0x54
	add r2, #0x58
	bl sub_0201F51C
	ldr r0, [r7, #0x5c]
	bl NNS_G3dGetTex
	str r0, [sp, #8]
	ldr r0, [r5, #0x54]
	mov r1, #0
	mov r2, #0x40
	bl NNSi_G3dModifyMatFlag
	ldr r0, [r5, #0x54]
	mov r1, #0
	mov r2, #0x80
	bl NNSi_G3dModifyMatFlag
	mov r2, #2
	ldr r0, [r5, #0x54]
	mov r1, #0
	lsl r2, r2, #8
	bl NNSi_G3dModifyMatFlag
	mov r2, #1
	ldr r0, [r5, #0x54]
	mov r1, #0
	lsl r2, r2, #0xa
	bl NNSi_G3dModifyMatFlag
	mov r4, #0
	add r7, #0x80
_021E5D5A:
	ldr r1, [sp]
	lsl r2, r4, #1
	add r1, r1, r2
	lsl r0, r4, #2
	add r6, r5, r0
	ldrh r1, [r1, #4]
	ldr r0, [sp, #4]
	mov r2, #0x97
	bl NARC_AllocAndReadWholeMember
	mov r1, #0
	str r0, [r6, #0x5c]
	bl NNS_G3dGetAnmByIdx
	str r0, [sp, #0xc]
	ldr r1, [sp, #0xc]
	ldr r2, [r5, #0x54]
	add r0, r7, #0
	bl NNS_G3dAllocAnmObj
	str r0, [r6, #0x6c]
	ldr r1, [sp, #0xc]
	ldr r2, [r5, #0x54]
	ldr r3, [sp, #8]
	bl NNS_G3dAnmObjInit
	ldr r1, [r6, #0x6c]
	add r0, r5, #0
	bl NNS_G3dRenderObjAddAnmObj
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _021E5D5A
	ldr r0, [sp, #4]
	bl NARC_dtor
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E5DAC: .word ov105_021E5E8C
_021E5DB0: .word _021E5E80
_021E5DB4: .word ov105_021E5DC8
_021E5DB8: .word ov105_021E5EA4
_021E5DBC: .word ov105_021E5E98
_021E5DC0: .word _021E5DC4
	thumb_func_end ov105_021E5CA4

	.rodata

_021E5DC4:
	.byte 0x5C, 0x08, 0x00, 0x00

ov105_021E5DC8: ; 0x021E5DC8
	.byte 0x5C, 0x08, 0x00, 0x00

ov105_021E5DCC: ; 0x021E5DCC
	.byte 0x96, 0x00

ov105_021E5DCE: ; 0x021E5DCE
	.byte 0xA4, 0x06
	.byte 0x96, 0x00, 0xA4, 0x06

ov105_021E5DD4: ; 0x021E5DD4
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00

ov105_021E5DE0: ; 0x021E5DE0
	.byte 0x00, 0x00, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10

ov105_021E5DF0: ; 0x021E5DF0
	.byte 0x79, 0xF2, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x4F, 0x27, 0x00, 0x00, 0x79, 0xF2, 0x10, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x4F, 0x27, 0x00, 0x00

ov105_021E5E08: ; 0x021E5E08
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00

ov105_021E5E2C: ; 0x021E5E2C
	.byte 0x52, 0x71, 0x1B, 0x00
	.byte 0x62, 0xE1, 0x60, 0x13, 0x00, 0x00, 0x00, 0x00

ov105_021E5E38: ; 0x021E5E38
	.byte 0x00, 0x00

ov105_021E5E3A: ; 0x021E5E3A
	.byte 0x81, 0x0B, 0x00, 0x00, 0x00, 0x00
	.byte 0x52, 0x71, 0x1B, 0x00, 0x62, 0xE1, 0x60, 0x13, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x81, 0x0B
	.byte 0x00, 0x00, 0x00, 0x00

ov105_021E5E54: ; 0x021E5E54
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00

	.data

_021E5E80:
	.byte 0x05, 0x00, 0x00, 0x00, 0x06, 0x00, 0x07, 0x00, 0x08, 0x00, 0x09, 0x00

ov105_021E5E8C: ; 0x021E5E8C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x02, 0x00, 0x03, 0x00, 0x04, 0x00

ov105_021E5E98: ; 0x021E5E98
	.byte 0x0F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x11, 0x00
	.byte 0x12, 0x00, 0x13, 0x00

ov105_021E5EA4: ; 0x021E5EA4
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x0C, 0x00, 0x0D, 0x00, 0x0E, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	; 0x021E5EC0
