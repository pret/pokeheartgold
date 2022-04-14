	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov27_02259F80
ov27_02259F80: ; 0x02259F80
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r2, #0
	add r6, r0, #0
	str r1, [sp, #0x10]
	ldr r2, _0225A170 ; =0x00018D00
	mov r0, #3
	mov r1, #8
	bl CreateHeap
	mov r0, #0
	bl GXS_SetGraphicsMode
	mov r0, #0x80
	bl GX_SetBankForSubBG
	mov r0, #1
	lsl r0, r0, #8
	bl GX_SetBankForSubOBJ
	ldr r2, _0225A174 ; =0x04001000
	ldr r0, _0225A178 ; =0xFFCFFFEF
	ldr r1, [r2]
	mov r3, #0
	and r1, r0
	mov r0, #0x10
	orr r0, r1
	str r0, [r2]
	ldr r2, _0225A17C ; =ov27_0225D000
	add r0, r6, #0
	mov r1, #4
	bl InitBgFromTemplate
	ldr r2, _0225A180 ; =ov27_0225D01C
	add r0, r6, #0
	mov r1, #5
	mov r3, #0
	bl InitBgFromTemplate
	mov r1, #0x15
	ldr r0, _0225A184 ; =ov27_0225A320
	lsl r1, r1, #6
	mov r2, #0xa
	mov r3, #8
	bl sub_02007200
	add r7, r0, #0
	bl sub_0201F988
	add r4, r0, #0
	str r7, [r4, #8]
	mov r0, #0
	str r0, [r4]
	ldr r0, [sp, #0x10]
	str r6, [r4, #4]
	str r0, [r4, #0xc]
	add r0, r5, #0
	str r5, [r4, #0x10]
	bl ov27_0225BD50
	ldr r3, _0225A188 ; =0x0000051C
	add r2, r0, #0
	ldr r1, [r4, r3]
	mov r0, #0x1e
	bic r1, r0
	lsl r0, r2, #0x1c
	lsr r0, r0, #0x1b
	orr r0, r1
	str r0, [r4, r3]
	ldr r1, [r4, r3]
	mov r0, #0x20
	bic r1, r0
	str r1, [r4, r3]
	mov r3, #0x3f
	lsl r3, r3, #4
	add r0, r4, r3
	str r0, [sp]
	add r2, r3, #0
	sub r2, #0x20
	sub r3, #0x10
	ldr r1, [r4]
	add r0, r6, #0
	add r2, r4, r2
	add r3, r4, r3
	bl ov27_0225AC00
	mov r0, #4
	mov r1, #8
	bl FontID_Alloc
	mov r0, #8
	bl ScrStrBufs_new
	ldr r1, _0225A18C ; =0x000004AC
	mov r2, #0xc4
	str r0, [r4, r1]
	mov r0, #0
	mov r1, #0x1b
	mov r3, #8
	bl NewMsgDataFromNarc
	ldr r1, _0225A190 ; =0x000004A8
	str r0, [r4, r1]
	add r0, r4, #0
	bl ov27_0225C10C
	add r1, r5, #0
	add r1, #0xd3
	ldrb r1, [r1]
	add r0, r4, #0
	bl ov27_0225C1AC
	str r0, [r4, #0x14]
	add r0, r4, #0
	bl ov27_0225C1EC
	add r0, r4, #0
	bl ov27_0225AD0C
	add r0, r4, #0
	bl ov27_0225B010
	ldr r1, [r4, #0x10]
	add r0, r4, #0
	add r1, #0xd2
	ldrb r1, [r1]
	lsl r1, r1, #0x1a
	lsr r1, r1, #0x1a
	bl ov27_0225BB6C
	mov r3, #0
	str r3, [sp]
	mov r2, #0x3d
	ldr r0, _0225A194 ; =0x000F0100
	str r3, [sp, #4]
	str r0, [sp, #8]
	lsl r2, r2, #4
	add r0, r4, r2
	str r3, [sp, #0xc]
	add r2, #0xe4
	ldr r2, [r4, r2]
	mov r1, #4
	bl AddTextPrinterParameterized2
	mov r1, #0
	mov r2, #0x3e
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225A194 ; =0x000F0100
	lsl r2, r2, #4
	str r0, [sp, #8]
	add r0, r4, r2
	str r1, [sp, #0xc]
	add r2, #0xe4
	ldr r2, [r4, r2]
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl ov27_0225BCE8
	add r0, r4, #0
	bl ov27_0225BC84
	add r0, r4, #0
	mov r1, #1
	bl ov27_0225A690
	add r0, r4, #0
	bl ov27_0225C0E0
	mov r0, #0x52
	lsl r0, r0, #4
	add r0, r4, r0
	add r1, r4, #0
	bl ov27_0225BDDC
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	bl sub_020183F0
	cmp r0, #0
	bne _0225A102
	add r0, r5, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x80
	add r5, #0xd2
	bic r1, r0
	strb r1, [r5]
	b _0225A11A
_0225A102:
	add r0, r5, #0
	bl Fsys_TaskIsRunning
	cmp r0, #0
	bne _0225A11A
	add r0, r5, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x80
	add r5, #0xd2
	orr r0, r1
	strb r0, [r5]
_0225A11A:
	add r0, r4, #0
	bl ov27_0225A714
	cmp r0, #0
	bne _0225A12A
	add sp, #0x14
	add r0, r7, #0
	pop {r4, r5, r6, r7, pc}
_0225A12A:
	add r0, r4, #0
	bl ov27_0225A7FC
	ldr r0, [r4, #0x18]
	bl sub_0202457C
	ldr r2, _0225A174 ; =0x04001000
	ldr r0, _0225A198 ; =0xFFFF1FFF
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r0, #1
	add r1, r0, #0
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
	add r0, r7, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0225A170: .word 0x00018D00
_0225A174: .word 0x04001000
_0225A178: .word 0xFFCFFFEF
_0225A17C: .word ov27_0225D000
_0225A180: .word ov27_0225D01C
_0225A184: .word ov27_0225A320
_0225A188: .word 0x0000051C
_0225A18C: .word 0x000004AC
_0225A190: .word 0x000004A8
_0225A194: .word 0x000F0100
_0225A198: .word 0xFFFF1FFF
	thumb_func_end ov27_02259F80

	thumb_func_start ov27_0225A19C
ov27_0225A19C: ; 0x0225A19C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	add r0, r1, #0
	str r1, [sp, #4]
	bl sub_0201F988
	add r6, r0, #0
	ldr r1, _0225A2B0 ; =FS_OVERLAY_ID(OVY_123)
	mov r0, #0
	bl FS_LoadOverlay
	ldr r0, _0225A2B4 ; =ov27_0225C238
	blx ov123_0225F430
	cmp r0, #0
	beq _0225A1C8
	mov r1, #0xfa
	mov r0, #3
	lsl r1, r1, #2
	bl AllocFromHeapAtEnd
_0225A1C8:
	mov r0, #0x52
	lsl r0, r0, #4
	add r0, r6, r0
	bl ov27_0225BEB0
	ldr r0, _0225A2B8 ; =0x000004A8
	ldr r0, [r6, r0]
	bl DestroyMsgData
	ldr r0, _0225A2BC ; =0x000004AC
	ldr r0, [r6, r0]
	bl ScrStrBufs_delete
	mov r7, #0x55
	mov r4, #0
	add r5, r6, #0
	lsl r7, r7, #2
_0225A1EA:
	ldr r0, [r5, r7]
	bl sub_0200AEB0
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #0xb
	blt _0225A1EA
	mov r7, #0x56
	mov r5, #0
	add r4, r6, #0
	lsl r7, r7, #2
_0225A200:
	ldr r0, [r4, r7]
	bl sub_0200B0A8
	add r5, r5, #1
	add r4, #0x10
	cmp r5, #0xb
	blt _0225A200
	mov r7, #0x51
	mov r5, #0
	add r4, r6, #0
	lsl r7, r7, #2
_0225A216:
	ldr r0, [r4, r7]
	bl Destroy2DGfxResObjMan
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #4
	blt _0225A216
	ldr r0, _0225A2C0 ; =ov27_0225C248
	blx ov123_0225F598
	cmp r0, #0
	bne _0225A238
	mov r1, #0xfa
	mov r0, #3
	lsl r1, r1, #2
	bl AllocFromHeapAtEnd
_0225A238:
	ldr r0, [r6, #0x18]
	bl sub_02024504
	mov r0, #0x3f
	lsl r0, r0, #4
	mov r5, #0
	add r4, r6, r0
_0225A246:
	add r0, r4, #0
	bl RemoveWindow
	add r5, r5, #1
	add r4, #0x10
	cmp r5, #8
	blt _0225A246
	mov r0, #0x3e
	lsl r0, r0, #4
	add r0, r6, r0
	bl RemoveWindow
	mov r0, #0x3d
	lsl r0, r0, #4
	add r0, r6, r0
	bl RemoveWindow
	add r0, r6, #0
	bl ov27_0225BC34
	mov r0, #4
	bl FontID_Release
	ldr r0, [sp, #4]
	bl sub_02007234
	ldr r0, [sp]
	mov r1, #5
	bl FreeBgTilemapBuffer
	ldr r0, [sp]
	mov r1, #4
	bl FreeBgTilemapBuffer
	mov r0, #8
	bl DestroyHeap
	ldr r0, _0225A2C4 ; =ov27_0225C24C
	blx ov123_0225F688
	cmp r0, #0
	bne _0225A2A4
	mov r1, #0xfa
	mov r0, #3
	lsl r1, r1, #2
	bl AllocFromHeapAtEnd
_0225A2A4:
	ldr r1, _0225A2B0 ; =FS_OVERLAY_ID(OVY_123)
	mov r0, #0
	bl FS_UnloadOverlay
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225A2B0: .word FS_OVERLAY_ID(OVY_123)
_0225A2B4: .word ov27_0225C238
_0225A2B8: .word 0x000004A8
_0225A2BC: .word 0x000004AC
_0225A2C0: .word ov27_0225C248
_0225A2C4: .word ov27_0225C24C
	thumb_func_end ov27_0225A19C

	thumb_func_start ov27_0225A2C8
ov27_0225A2C8: ; 0x0225A2C8
	mov r0, #1
	bx lr
	thumb_func_end ov27_0225A2C8

	thumb_func_start ov27_0225A2CC
ov27_0225A2CC: ; 0x0225A2CC
	push {r4, lr}
	bl sub_0201F988
	add r4, r0, #0
	bne _0225A2DA
	bl GF_AssertFail
_0225A2DA:
	ldr r1, _0225A2E8 ; =0x0000051C
	mov r0, #0x20
	ldr r2, [r4, r1]
	orr r0, r2
	str r0, [r4, r1]
	pop {r4, pc}
	nop
_0225A2E8: .word 0x0000051C
	thumb_func_end ov27_0225A2CC

	thumb_func_start ov27_0225A2EC
ov27_0225A2EC: ; 0x0225A2EC
	push {r3, r4, r5, lr}
	add r5, r1, #0
	bl sub_0201F988
	add r4, r0, #0
	bne _0225A2FC
	bl GF_AssertFail
_0225A2FC:
	cmp r5, #1
	beq _0225A308
	cmp r5, #2
	beq _0225A308
	bl GF_AssertFail
_0225A308:
	ldr r1, _0225A31C ; =0x0000051C
	mov r0, #0xc0
	ldr r2, [r4, r1]
	bic r2, r0
	lsl r0, r5, #0x1e
	lsr r0, r0, #0x18
	orr r0, r2
	str r0, [r4, r1]
	pop {r3, r4, r5, pc}
	nop
_0225A31C: .word 0x0000051C
	thumb_func_end ov27_0225A2EC

	thumb_func_start ov27_0225A320
ov27_0225A320: ; 0x0225A320
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	ldr r0, [r5, #0x10]
	bl ov27_0225A89C
	add r4, r0, #0
	ldr r0, [r5, #0x10]
	bl sub_0203E13C
	add r6, r0, #0
	ldr r0, [r5, #0x10]
	add r0, #0xd2
	ldrb r0, [r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	beq _0225A366
	cmp r6, #0
	beq _0225A35E
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0225A35E
	ldr r2, [r5, #0x10]
	add r0, r2, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x80
	add r2, #0xd2
	bic r1, r0
	strb r1, [r2]
	b _0225A36E
_0225A35E:
	ldr r0, _0225A45C ; =0x04001050
	mov r1, #0
	strh r1, [r0]
	b _0225A36E
_0225A366:
	add r0, r5, #0
	add r1, r4, #0
	bl ov27_0225A8E8
_0225A36E:
	ldr r0, _0225A460 ; =0x0000051C
	ldr r0, [r5, r0]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1f
	beq _0225A38A
	ldr r0, [r5, #0x14]
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x39
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #2
	bl sub_02024950
_0225A38A:
	ldr r0, _0225A460 ; =0x0000051C
	ldr r0, [r5, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1e
	cmp r0, #1
	bne _0225A3AE
	mov r0, #0xeb
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #2
	bl Set2dSpriteAnimSeqNo
	ldr r1, _0225A460 ; =0x0000051C
	mov r0, #0xc0
	ldr r2, [r5, r1]
	bic r2, r0
	str r2, [r5, r1]
	b _0225A3C8
_0225A3AE:
	cmp r0, #2
	bne _0225A3C8
	mov r0, #0x3b
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #2
	bl Set2dSpriteAnimSeqNo
	ldr r1, _0225A460 ; =0x0000051C
	mov r0, #0xc0
	ldr r2, [r5, r1]
	bic r2, r0
	str r2, [r5, r1]
_0225A3C8:
	ldr r0, [r5, #0x10]
	bl Fsys_TaskIsRunning
	cmp r0, #0
	beq _0225A3DA
	add r0, r5, #0
	bl ov27_0225A7FC
	b _0225A412
_0225A3DA:
	ldr r0, [r5, #0x10]
	add r0, #0xd2
	ldrb r0, [r0]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1a
	cmp r0, #2
	bne _0225A3FE
	add r0, r5, #0
	bl ov27_0225A86C
	ldr r2, [r5, #0x10]
	add r0, r2, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x3f
	add r2, #0xd2
	bic r1, r0
	strb r1, [r2]
_0225A3FE:
	cmp r6, #0
	beq _0225A408
	add r0, r5, #0
	bl ov27_0225A66C
_0225A408:
	cmp r4, #0
	bne _0225A412
	add r0, r5, #0
	bl ov27_0225B4D8
_0225A412:
	ldr r0, _0225A464 ; =ov27_0225CECC
	bl sub_02025204
	add r6, r0, #0
	ldr r0, _0225A464 ; =ov27_0225CECC
	bl sub_02025224
	add r7, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl ov27_0225A530
	ldr r0, _0225A460 ; =0x0000051C
	ldr r0, [r5, r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _0225A44A
	add r0, r5, #0
	bl ov27_0225A4D0
	cmp r0, #0
	beq _0225A44A
	cmp r4, #0
	bne _0225A44A
	add r0, r5, #0
	add r1, r7, #0
	bl ov27_0225A48C
_0225A44A:
	mov r0, #0x52
	lsl r0, r0, #4
	add r0, r5, r0
	bl ov27_0225BDFC
	ldr r0, [r5, #0x18]
	bl sub_0202457C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225A45C: .word 0x04001050
_0225A460: .word 0x0000051C
_0225A464: .word ov27_0225CECC
	thumb_func_end ov27_0225A320

	thumb_func_start ov27_0225A468
ov27_0225A468: ; 0x0225A468
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0xf1
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	lsl r2, r4, #2
	mov r1, #0xb
	sub r1, r1, r2
	bl Set2dSpriteAnimSeqNo
	mov r0, #0xef
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #3
	bl Set2dSpriteAnimSeqNo
	pop {r3, r4, r5, pc}
	thumb_func_end ov27_0225A468

	thumb_func_start ov27_0225A48C
ov27_0225A48C: ; 0x0225A48C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	cmp r1, #0
	bne _0225A4B6
	ldr r0, [r5, #0x10]
	bl FieldSys_GetPlayerAvatar
	add r6, r0, #0
	bl sub_0205CB38
	add r4, r0, #0
	mov r1, #1
	eor r4, r1
	add r0, r5, #0
	add r1, r4, #0
	bl ov27_0225A468
	add r0, r6, #0
	add r1, r4, #0
	bl sub_0205CB40
_0225A4B6:
	pop {r4, r5, r6, pc}
	thumb_func_end ov27_0225A48C

	thumb_func_start ov27_0225A4B8
ov27_0225A4B8: ; 0x0225A4B8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	bl FieldSys_GetPlayerAvatar
	bl sub_0205CB38
	add r1, r0, #0
	add r0, r4, #0
	bl ov27_0225A468
	pop {r4, pc}
	thumb_func_end ov27_0225A4B8

	thumb_func_start ov27_0225A4D0
ov27_0225A4D0: ; 0x0225A4D0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov27_0225BDC8
	add r4, r0, #0
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x40]
	bl PlayerAvatar_GetState
	cmp r0, #1
	beq _0225A4F2
	ldr r0, [r5, #0x10]
	add r0, #0xd2
	ldrb r0, [r0]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1a
	beq _0225A4F4
_0225A4F2:
	mov r4, #0
_0225A4F4:
	cmp r4, #0
	beq _0225A512
	mov r0, #0xef
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0xf1
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	b _0225A52A
_0225A512:
	mov r0, #0xef
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0xf1
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
_0225A52A:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov27_0225A4D0

	thumb_func_start ov27_0225A530
ov27_0225A530: ; 0x0225A530
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0xf
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	add r4, r1, #0
	bl sub_020249A8
	add r6, r0, #0
	mov r0, #0xf
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl sub_020248B8
	cmp r0, #0
	beq _0225A58C
	cmp r4, #1
	bne _0225A570
	bl System_GetTouchNew
	cmp r0, #0
	beq _0225A570
	ldr r0, _0225A590 ; =gSystem
	mov r1, #1
	str r1, [r0, #0x5c]
	mov r0, #0xf
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #6
	bl Set2dSpriteAnimSeqNo
	pop {r4, r5, r6, pc}
_0225A570:
	cmp r4, #1
	bne _0225A580
	cmp r6, #6
	bne _0225A580
	ldr r0, _0225A590 ; =gSystem
	mov r1, #1
	str r1, [r0, #0x5c]
	pop {r4, r5, r6, pc}
_0225A580:
	mov r0, #0xf
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #5
	bl Set2dSpriteAnimSeqNo
_0225A58C:
	pop {r4, r5, r6, pc}
	nop
_0225A590: .word gSystem
	thumb_func_end ov27_0225A530

	thumb_func_start ov27_0225A594
ov27_0225A594: ; 0x0225A594
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r4, [r5, #0x10]
	add r0, r4, #0
	bl ov27_0225BD44
	cmp r0, #0
	beq _0225A5A8
	mov r0, #4
	pop {r3, r4, r5, r6, r7, pc}
_0225A5A8:
	add r0, r4, #0
	bl sub_0203E13C
	cmp r0, #0
	bne _0225A5E6
	add r0, r4, #0
	bl FieldSys_GetPlayerAvatar
	bl PlayerAvatar_GetMapObject
	add r7, r0, #0
	bl sub_0205F330
	add r6, r0, #0
	add r0, r7, #0
	bl MapObject_GetGfxID
	sub r0, #0xbc
	cmp r0, #1
	bhi _0225A5DC
	cmp r6, #1
	bne _0225A5D8
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_0225A5D8:
	mov r0, #4
	pop {r3, r4, r5, r6, r7, pc}
_0225A5DC:
	mov r0, #0x51
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #4
	bne _0225A61A
_0225A5E6:
	add r0, r4, #0
	bl ov01_021E7F54
	add r5, r0, #0
	cmp r5, #1
	bne _0225A618
	add r0, r4, #0
	add r1, sp, #0
	bl Fsys_GetFacingObject
	ldr r0, [sp]
	bl MapObject_GetScript
	bl ov01_021F6BD0
	cmp r0, #0
	bne _0225A616
	ldr r0, [sp]
	bl MapObject_GetGfxID
	bl ov01_021F6BB0
	cmp r0, #0
	beq _0225A618
_0225A616:
	mov r5, #0
_0225A618:
	add r0, r5, #0
_0225A61A:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov27_0225A594

	thumb_func_start ov27_0225A61C
ov27_0225A61C: ; 0x0225A61C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x3d
	lsl r0, r0, #4
	add r4, r1, #0
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r6, _0225A664 ; =ov27_0225D108
	mov r3, #0
	ldrb r4, [r6, r4]
	str r3, [sp]
	mov r2, #0x3d
	lsl r4, r4, #2
	ldr r0, _0225A668 ; =0x000F0100
	str r3, [sp, #4]
	str r0, [sp, #8]
	lsl r2, r2, #4
	add r0, r5, r2
	str r3, [sp, #0xc]
	add r4, r5, r4
	add r2, #0xe0
	ldr r2, [r4, r2]
	mov r1, #4
	bl AddTextPrinterParameterized2
	mov r0, #0xf
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0225A664: .word ov27_0225D108
_0225A668: .word 0x000F0100
	thumb_func_end ov27_0225A61C

	thumb_func_start ov27_0225A66C
ov27_0225A66C: ; 0x0225A66C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov27_0225A594
	add r4, r0, #0
	mov r0, #0x51
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, r4
	beq _0225A68E
	add r0, r5, #0
	add r1, r4, #0
	bl ov27_0225A61C
	mov r0, #0x51
	lsl r0, r0, #4
	str r4, [r5, r0]
_0225A68E:
	pop {r3, r4, r5, pc}
	thumb_func_end ov27_0225A66C

	thumb_func_start ov27_0225A690
ov27_0225A690: ; 0x0225A690
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #0
	beq _0225A6C0
	ldr r2, _0225A710 ; =0x0000051C
	mov r1, #1
	ldr r3, [r4, r2]
	bic r3, r1
	mov r1, #1
	orr r1, r3
	str r1, [r4, r2]
	bl ov27_0225A4D0
	add r0, r4, #0
	mov r1, #1
	bl ov27_0225A9C0
	mov r0, #0xf
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	pop {r4, pc}
_0225A6C0:
	ldr r1, _0225A710 ; =0x0000051C
	mov r0, #1
	ldr r2, [r4, r1]
	bic r2, r0
	mov r0, #0x3d
	lsl r0, r0, #4
	str r2, [r4, r1]
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x3d
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowToVram
	mov r0, #0xf
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0xef
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0xf1
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	mov r1, #0
	bl ov27_0225A9C0
	pop {r4, pc}
	nop
_0225A710: .word 0x0000051C
	thumb_func_end ov27_0225A690

	thumb_func_start ov27_0225A714
ov27_0225A714: ; 0x0225A714
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	cmp r0, #0
	bne _0225A722
	bl GF_AssertFail
_0225A722:
	ldr r4, [r5, #0x10]
	ldr r6, [r5, #0xc]
	add r0, r4, #0
	add r0, #0xd2
	ldrb r0, [r0]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1a
	cmp r0, #4
	bne _0225A75C
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r4, r0
	bl sub_020183F0
	cmp r0, #0
	bne _0225A74C
	add r0, r5, #0
	mov r1, #1
	bl ov27_0225A8E8
	b _0225A7AC
_0225A74C:
	add r0, r4, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x3f
	add r4, #0xd2
	bic r1, r0
	strb r1, [r4]
	b _0225A7AC
_0225A75C:
	cmp r0, #3
	bne _0225A7AC
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r4, r0
	bl sub_020183F0
	cmp r0, #1
	bne _0225A792
	mov r0, #1
	strh r0, [r6]
	add r0, r4, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x3f
	bic r1, r0
	add r0, r4, #0
	add r0, #0xd2
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x80
	add r4, #0xd2
	orr r0, r1
	strb r0, [r4]
	b _0225A7AC
_0225A792:
	ldr r1, [r5, #0x14]
	add r0, r5, #0
	bl ov27_0225B398
	add r0, r4, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x3f
	add r4, #0xd2
	bic r1, r0
	mov r0, #1
	orr r0, r1
	strb r0, [r4]
_0225A7AC:
	mov r0, #1
	pop {r4, r5, r6, pc}
	thumb_func_end ov27_0225A714

	thumb_func_start ov27_0225A7B0
ov27_0225A7B0: ; 0x0225A7B0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	bl sub_0203DF8C
	cmp r0, #1
	bne _0225A7C4
	add r0, r4, #0
	bl ov27_0225A66C
_0225A7C4:
	ldr r0, _0225A7D8 ; =0x0000051C
	ldr r0, [r4, r0]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1c
	bne _0225A7D4
	add r0, r4, #0
	bl ov27_0225AAD4
_0225A7D4:
	pop {r4, pc}
	nop
_0225A7D8: .word 0x0000051C
	thumb_func_end ov27_0225A7B0

	thumb_func_start ov27_0225A7DC
ov27_0225A7DC: ; 0x0225A7DC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x14]
	cmp r0, #7
	blt _0225A7EA
	bl GF_AssertFail
_0225A7EA:
	ldr r1, [r4, #0x14]
	add r0, r4, #0
	bl ov27_0225B398
	add r0, r4, #0
	mov r1, #0
	bl ov27_0225A690
	pop {r4, pc}
	thumb_func_end ov27_0225A7DC

	thumb_func_start ov27_0225A7FC
ov27_0225A7FC: ; 0x0225A7FC
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x10]
	add r2, r1, #0
	add r2, #0xd2
	ldrb r2, [r2]
	lsl r2, r2, #0x1a
	lsr r2, r2, #0x1a
	cmp r2, #4
	bhi _0225A866
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0225A81C: ; jump table
	.short _0225A826 - _0225A81C - 2 ; case 0
	.short _0225A82C - _0225A81C - 2 ; case 1
	.short _0225A846 - _0225A81C - 2 ; case 2
	.short _0225A866 - _0225A81C - 2 ; case 3
	.short _0225A866 - _0225A81C - 2 ; case 4
_0225A826:
	bl ov27_0225A7B0
	pop {r4, pc}
_0225A82C:
	bl ov27_0225A7DC
	ldr r2, [r4, #0x10]
	add r0, r2, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x3f
	add r2, #0xd2
	bic r1, r0
	mov r0, #2
	orr r0, r1
	strb r0, [r2]
	pop {r4, pc}
_0225A846:
	ldr r0, [r1, #0x6c]
	cmp r0, #0
	beq _0225A86A
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0225A86A
	add r0, r4, #0
	bl ov27_0225B4D8
	cmp r0, #0
	beq _0225A86A
	add r0, r4, #0
	bl ov27_0225B404
	pop {r4, pc}
_0225A866:
	bl GF_AssertFail
_0225A86A:
	pop {r4, pc}
	thumb_func_end ov27_0225A7FC

	thumb_func_start ov27_0225A86C
ov27_0225A86C: ; 0x0225A86C
	push {r4, lr}
	add r4, r0, #0
	bl ov27_0225A594
	add r1, r0, #0
	add r0, r4, #0
	bl ov27_0225A61C
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	bl ov27_0225B398
	mov r0, #0x3d
	lsl r0, r0, #4
	add r0, r4, r0
	bl CopyWindowToVram
	add r0, r4, #0
	mov r1, #1
	bl ov27_0225A690
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov27_0225A86C

	thumb_func_start ov27_0225A89C
ov27_0225A89C: ; 0x0225A89C
	push {r4, lr}
	add r4, r0, #0
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0225A8E0
	ldr r0, [r4, #0x6c]
	cmp r0, #0
	beq _0225A8E0
	add r0, r4, #0
	add r0, #0xd2
	ldrb r0, [r0]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1a
	bne _0225A8E0
	add r0, r4, #0
	bl sub_0203E13C
	cmp r0, #0
	beq _0225A8E0
	add r0, r4, #0
	bl ov27_0225BD44
	cmp r0, #0
	bne _0225A8E0
	add r0, r4, #0
	bl MapSceneScriptCheck
	cmp r0, #0
	bne _0225A8E0
	bl sub_02058AA0
	cmp r0, #0
	beq _0225A8E4
_0225A8E0:
	mov r0, #1
	pop {r4, pc}
_0225A8E4:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov27_0225A89C

	thumb_func_start ov27_0225A8E8
ov27_0225A8E8: ; 0x0225A8E8
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	cmp r1, #0
	beq _0225A9AE
	ldr r1, _0225A9B8 ; =0x0000051C
	ldr r1, [r4, r1]
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x1c
	cmp r1, #5
	bne _0225A912
	ldr r1, [r4, #0x10]
	add r1, #0xd2
	ldrb r1, [r1]
	lsl r1, r1, #0x1a
	lsr r1, r1, #0x1a
	bne _0225A912
	mov r1, #0
	mvn r1, r1
	bl ov27_0225B398
_0225A912:
	mov r0, #0xef
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_02024B78
	mov r0, #0xf1
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_02024B78
	mov r0, #0xeb
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_02024B78
	mov r0, #0xed
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_02024B78
	mov r0, #0x3b
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_02024B78
	mov r0, #0xee
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_02024B78
	ldr r0, [r4, #0x10]
	add r0, #0xd2
	ldrb r0, [r0]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1a
	beq _0225A974
	mov r0, #0x39
	lsl r0, r0, #4
	ldr r1, [r4, #0x14]
	add r0, r4, r0
	bl ov27_0225B4AC
	b _0225A982
_0225A974:
	mov r0, #0x39
	lsl r0, r0, #4
	mov r1, #0
	add r0, r4, r0
	mvn r1, r1
	bl ov27_0225B4AC
_0225A982:
	ldr r0, _0225A9B8 ; =0x0000051C
	ldr r0, [r4, r0]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1c
	cmp r0, #2
	bne _0225A99A
	mov r0, #0xea
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_02024B78
_0225A99A:
	mov r0, #9
	str r0, [sp]
	ldr r0, _0225A9BC ; =0x04001050
	mov r1, #0
	mov r2, #0x23
	mov r3, #6
	bl G2x_SetBlendAlpha_
	add sp, #4
	pop {r3, r4, pc}
_0225A9AE:
	ldr r0, _0225A9BC ; =0x04001050
	mov r1, #0
	strh r1, [r0]
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0225A9B8: .word 0x0000051C
_0225A9BC: .word 0x04001050
	thumb_func_end ov27_0225A8E8

	thumb_func_start ov27_0225A9C0
ov27_0225A9C0: ; 0x0225A9C0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov27_0225BDAC
	cmp r0, #0
	bne _0225A9D0
	mov r4, #0
_0225A9D0:
	cmp r4, #0
	beq _0225AA2E
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0xc]
	bl Sav2_Bag_get
	add r4, r0, #0
	bl Bag_GetRegisteredItemSlot1
	cmp r0, #0
	beq _0225A9EA
	mov r6, #1
	b _0225A9EC
_0225A9EA:
	mov r6, #0
_0225A9EC:
	add r0, r4, #0
	bl Bag_GetRegisteredItemSlot2
	cmp r0, #0
	beq _0225A9FA
	mov r4, #1
	b _0225A9FC
_0225A9FA:
	mov r4, #0
_0225A9FC:
	mov r0, #0xeb
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r6, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0xed
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r6, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x3b
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0xee
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl Set2dSpriteVisibleFlag
	pop {r4, r5, r6, pc}
_0225AA2E:
	mov r0, #0xeb
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0xed
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x3b
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0xee
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	pop {r4, r5, r6, pc}
	thumb_func_end ov27_0225A9C0

	thumb_func_start ov27_0225AA60
ov27_0225AA60: ; 0x0225AA60
	push {r3, r4}
	mov r4, #0
	add r3, r4, #0
	cmp r1, #0
	ble _0225AA74
_0225AA6A:
	ldrb r2, [r0, r3]
	add r3, r3, #1
	add r4, r4, r2
	cmp r3, r1
	blt _0225AA6A
_0225AA74:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4}
	bx lr
	thumb_func_end ov27_0225AA60

	thumb_func_start ov27_0225AA7C
ov27_0225AA7C: ; 0x0225AA7C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r7, _0225AACC ; =0x00000514
	mov r4, #0
	add r5, r6, #0
_0225AA86:
	mov r0, #0x39
	add r1, r6, r4
	lsl r0, r0, #4
	ldrb r1, [r1, r7]
	ldr r0, [r5, r0]
	bl Set2dSpriteVisibleFlag
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #7
	blt _0225AA86
	ldr r0, _0225AAD0 ; =0x0000050C
	mov r1, #1
	strb r1, [r6, r0]
	add r0, r6, #0
	bl ov27_0225BDC8
	cmp r0, #0
	bne _0225AACA
	mov r0, #0xef
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0xf1
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, _0225AAD0 ; =0x0000050C
	mov r1, #0
	strb r1, [r6, r0]
_0225AACA:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225AACC: .word 0x00000514
_0225AAD0: .word 0x0000050C
	thumb_func_end ov27_0225AA7C

	thumb_func_start ov27_0225AAD4
ov27_0225AAD4: ; 0x0225AAD4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, _0225ABF4 ; =0x00000514
	mov r1, #7
	add r0, r5, r0
	bl ov27_0225AA60
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x3f
	lsl r0, r0, #4
	add r0, r5, r0
	ldr r4, _0225ABF8 ; =ov27_0225CF10
	mov r6, #0
	add r7, r5, #0
	str r0, [sp, #0xc]
_0225AAF6:
	ldr r0, [r5, #0x10]
	add r1, r6, #0
	bl sub_0203C3CC
	cmp r0, #1
	bne _0225AB62
	ldr r0, _0225ABF4 ; =0x00000514
	add r1, r5, r6
	ldrb r0, [r1, r0]
	str r1, [sp]
	cmp r0, #0
	bne _0225AB62
	ldrh r0, [r4]
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x39
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldrh r0, [r4]
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x39
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	ldrh r1, [r4, #2]
	bl Set2dSpriteAnimSeqNo
	ldrb r0, [r4, #4]
	lsl r1, r0, #4
	ldr r0, [sp, #0xc]
	add r0, r0, r1
	bl CopyWindowToVram
	ldr r1, [sp]
	ldr r0, _0225ABF4 ; =0x00000514
	mov r2, #1
	strb r2, [r1, r0]
	add r1, r2, #0
	sub r0, #0xa4
	strb r1, [r7, r0]
	ldr r0, [r5, #0x10]
	add r1, r0, #0
	add r1, #0xd2
	ldrb r2, [r1]
	mov r1, #0x80
	add r0, #0xd2
	orr r1, r2
	strb r1, [r0]
	ldr r0, [sp, #8]
	add r0, r0, #1
	str r0, [sp, #8]
_0225AB62:
	add r6, r6, #1
	add r4, r4, #6
	add r7, #8
	cmp r6, #7
	blt _0225AAF6
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _0225AB8E
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _0225AB8E
	mov r0, #0xf2
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x3e
	lsl r0, r0, #4
	add r0, r5, r0
	bl CopyWindowToVram
_0225AB8E:
	ldr r1, [sp, #4]
	ldr r0, [sp, #8]
	cmp r1, r0
	beq _0225ABB2
	ldr r0, [r5, #0x10]
	mov r1, #0
	add r0, #0xd3
	strb r1, [r0]
	ldr r1, [r5, #0x10]
	add r0, r5, #0
	add r1, #0xd3
	ldrb r1, [r1]
	bl ov27_0225C1AC
	str r0, [r5, #0x14]
	add r0, r5, #0
	bl ov27_0225C1EC
_0225ABB2:
	add r0, r5, #0
	bl ov27_0225BDC8
	cmp r0, #1
	bne _0225ABEE
	ldr r0, _0225ABFC ; =0x0000050C
	ldrb r0, [r5, r0]
	cmp r0, #0
	bne _0225ABEE
	mov r0, #0xef
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0xf1
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0xef
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0xa
	bl Set2dSpriteAnimSeqNo
	ldr r0, _0225ABFC ; =0x0000050C
	mov r1, #1
	strb r1, [r5, r0]
_0225ABEE:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225ABF4: .word 0x00000514
_0225ABF8: .word ov27_0225CF10
_0225ABFC: .word 0x0000050C
	thumb_func_end ov27_0225AAD4

	thumb_func_start ov27_0225AC00
ov27_0225AC00: ; 0x0225AC00
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp, #0x14]
	add r4, r1, #0
	mov r0, #0xc
	mul r4, r0
	mov r0, #0
	str r0, [sp]
	ldr r1, _0225ACFC ; =ov27_0225CEF0
	str r0, [sp, #4]
	mov r0, #1
	add r5, r2, #0
	str r0, [sp, #8]
	mov r0, #8
	add r6, r3, #0
	str r0, [sp, #0xc]
	ldr r1, [r1, r4]
	ldr r2, [sp, #0x14]
	mov r0, #0xe
	mov r3, #4
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	ldr r1, _0225AD00 ; =ov27_0225CEF4
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #8
	str r0, [sp, #0xc]
	ldr r1, [r1, r4]
	ldr r2, [sp, #0x14]
	mov r0, #0xe
	mov r3, #4
	bl GfGfxLoader_LoadScrnData
	mov r0, #2
	ldr r1, _0225AD04 ; =ov27_0225CEEC
	lsl r0, r0, #8
	str r0, [sp]
	mov r0, #8
	str r0, [sp, #4]
	ldr r1, [r1, r4]
	mov r0, #0xe
	mov r2, #4
	mov r3, #0
	bl GfGfxLoader_GXLoadPal
	mov r0, #0x14
	str r0, [sp]
	mov r0, #8
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #4
	str r0, [sp, #0xc]
	mov r0, #0xd2
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	add r1, r5, #0
	mov r2, #5
	mov r3, #0x18
	bl AddWindowParameterized
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0
	str r0, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #4
	str r0, [sp, #0xc]
	mov r0, #0xe2
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	add r1, r6, #0
	mov r2, #5
	mov r3, #9
	bl AddWindowParameterized
	add r0, r6, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r4, _0225AD08 ; =ov27_0225D074
	ldr r5, [sp, #0x30]
	mov r7, #0
	mov r6, #0xf6
_0225ACB8:
	ldr r0, [r4, #4]
	add r1, r5, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #9
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #4
	str r0, [sp, #0xc]
	lsl r0, r6, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r3, [r4]
	ldr r0, [sp, #0x14]
	lsl r3, r3, #0x18
	mov r2, #5
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r7, r7, #1
	add r6, #0x12
	add r4, #8
	add r5, #0x10
	cmp r7, #8
	blt _0225ACB8
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225ACFC: .word ov27_0225CEF0
_0225AD00: .word ov27_0225CEF4
_0225AD04: .word ov27_0225CEEC
_0225AD08: .word ov27_0225D074
	thumb_func_end ov27_0225AC00

	thumb_func_start ov27_0225AD0C
ov27_0225AD0C: ; 0x0225AD0C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r1, r5, #0
	mov r0, #0x10
	add r1, #0x1c
	mov r2, #8
	bl G2dRenderer_Init
	str r0, [r5, #0x18]
	add r0, r5, #0
	mov r2, #1
	add r0, #0x1c
	mov r1, #0
	lsl r2, r2, #0x14
	bl G2dRenderer_SetSubSurfaceCoords
	mov r7, #0x51
	mov r6, #0
	add r4, r5, #0
	lsl r7, r7, #2
_0225AD36:
	mov r0, #0xb
	add r1, r6, #0
	mov r2, #8
	bl Create2DGfxResObjMan
	str r0, [r4, r7]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #4
	blt _0225AD36
	mov r0, #0x55
	lsl r0, r0, #2
	mov r4, #0
	add r6, r5, r0
_0225AD52:
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	bl PlayerProfile_GetTrainerGender
	add r7, r0, #0
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0xc]
	bl Sav2_Bag_get
	add r1, r4, #0
	add r1, #0x64
	str r1, [sp]
	str r7, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _0225AE84 ; =0x0000051C
	mov r1, #0x51
	ldr r0, [r5, r0]
	lsl r1, r1, #2
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1c
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x10]
	add r1, r5, r1
	add r2, r6, #0
	add r3, r4, #0
	bl ov27_0225AEA8
	add r4, r4, #1
	add r6, #0x10
	cmp r4, #0xb
	blt _0225AD52
	mov r1, #0x64
	str r1, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #8
	add r1, #0xe8
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	mov r1, #0xe
	mov r2, #0x10
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x57
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r1, #0x64
	str r1, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #8
	add r1, #0xec
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	mov r1, #0xe
	mov r2, #0x11
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x16
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r1, #0x65
	str r1, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #8
	add r1, #0xe7
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	mov r1, #0xe
	mov r2, #0x44
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x5b
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r1, #0x65
	str r1, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #8
	add r1, #0xeb
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	mov r1, #0xe
	mov r2, #0x45
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x17
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r1, #0x66
	str r1, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #8
	add r1, #0xe6
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	mov r1, #0xe
	mov r2, #0x36
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x5f
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r1, #0x66
	str r1, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #8
	add r1, #0xea
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	mov r1, #0xe
	mov r2, #0x37
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	mov r1, #6
	lsl r1, r1, #6
	str r0, [r5, r1]
	mov r0, #0xe
	add r1, r0, #0
	add r2, sp, #0x10
	mov r3, #8
	bl GfGfxLoader_GetPlttData
	add r4, r0, #0
	ldr r0, [sp, #0x10]
	mov r1, #0x40
	ldr r0, [r0, #0xc]
	bl DC_FlushRange
	ldr r0, [sp, #0x10]
	ldr r1, _0225AE88 ; =0x000004CC
	ldr r0, [r0, #0xc]
	add r1, r5, r1
	mov r2, #0x40
	bl MIi_CpuCopyFast
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0225AE84: .word 0x0000051C
_0225AE88: .word 0x000004CC
	thumb_func_end ov27_0225AD0C

	thumb_func_start ov27_0225AE8C
ov27_0225AE8C: ; 0x0225AE8C
	cmp r0, #1
	bne _0225AE94
	mov r0, #5
	bx lr
_0225AE94:
	cmp r0, #3
	bne _0225AE9E
	mov r0, #0x7d
	lsl r0, r0, #2
	bx lr
_0225AE9E:
	ldr r0, _0225AEA4 ; =0x000001F3
	bx lr
	nop
_0225AEA4: .word 0x000001F3
	thumb_func_end ov27_0225AE8C

	thumb_func_start ov27_0225AEA8
ov27_0225AEA8: ; 0x0225AEA8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	mov ip, r0
	ldr r0, [sp, #0x44]
	str r1, [sp, #0x10]
	lsl r1, r0, #3
	ldr r0, _0225B004 ; =ov27_0225CFC8
	add r5, r3, #0
	add r0, r0, r1
	ldrb r1, [r5, r0]
	mov r0, #1
	mov r6, #0xe ; NARC_a_0_1_4
	add r4, r2, #0
	mov r2, #0x12
	ldr r7, [sp, #0x40]
	str r6, [sp, #0x20]
	str r0, [sp, #0x1c]
	str r0, [sp, #0x18]
	cmp r1, #0xd
	beq _0225AF22
	cmp r1, #2
	bne _0225AEDE
	ldr r0, [sp, #0x3c]
	cmp r0, #1
	bne _0225AEDE
	mov r2, #0x1b
	b _0225AF22
_0225AEDE:
	ldr r0, _0225B008 ; =ov27_0225CF94
	lsl r1, r1, #2
	ldrh r2, [r0, r1]
	ldr r0, _0225B00C ; =0x0000FFFF
	cmp r2, r0
	bne _0225AF22
	mov r0, ip
	bl FieldSys_BugContest_get
	str r0, [sp, #0x14]
	cmp r0, #0
	bne _0225AEFA
	bl GF_AssertFail
_0225AEFA:
	ldr r0, [sp, #0x14]
	ldrb r0, [r0, #0x17]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _0225AF20
	mov r0, #0
	str r0, [sp, #0x1c]
	mov r0, #3
	mov r6, #0x14 ; NARC_a_0_2_0
	str r0, [sp, #0x18]
	bl sub_02074490
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x14]
	ldr r0, [r0, #0x10]
	bl Pokemon_GetIconNaix
	add r2, r0, #0
	b _0225AF22
_0225AF20:
	mov r2, #0x12
_0225AF22:
	cmp r5, #7
	bne _0225AF4A
	mov r0, #0
	str r0, [sp, #0x1c]
	add r0, r7, #0
	mov r6, #0x12 ; NARC_itemtool_itemdata_item_icon
	bl Bag_GetRegisteredItemSlot1
	mov r1, #2
	bl GetItemIndexMapping
	str r0, [sp, #0x20]
	add r0, r7, #0
	bl Bag_GetRegisteredItemSlot1
	mov r1, #1
	bl GetItemIndexMapping
	add r2, r0, #0
	b _0225AFAC
_0225AF4A:
	cmp r5, #8
	bne _0225AF72
	mov r0, #0
	str r0, [sp, #0x1c]
	add r0, r7, #0
	mov r6, #0x12 ; NARC_itemtool_itemdata_item_icon
	bl Bag_GetRegisteredItemSlot2
	mov r1, #2
	bl GetItemIndexMapping
	str r0, [sp, #0x20]
	add r0, r7, #0
	bl Bag_GetRegisteredItemSlot2
	mov r1, #1
	bl GetItemIndexMapping
	add r2, r0, #0
	b _0225AFAC
_0225AF72:
	cmp r5, #9
	bne _0225AF82
	mov r0, #7
	str r0, [sp, #0x20]
	mov r0, #4
	mov r2, #0x46
	str r0, [sp, #0x18]
	b _0225AFAC
_0225AF82:
	cmp r5, #0xa
	bne _0225AFAC
	ldr r0, [sp, #0x44]
	bl ov27_0225AE8C
	add r5, r0, #0
	mov r0, #0
	str r0, [sp, #0x1c]
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	mov r1, #2
	mov r6, #0x12 ; NARC_itemtool_itemdata_item_icon
	bl GetItemIndexMapping
	str r0, [sp, #0x20]
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	mov r1, #1
	bl GetItemIndexMapping
	add r2, r0, #0
_0225AFAC:
	ldr r0, [sp, #0x38]
	ldr r3, [sp, #0x1c]
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #8
	str r0, [sp, #8]
	ldr r0, [sp, #0x10]
	add r1, r6, #0
	ldr r0, [r0]
	bl AddCharResObjFromNarc
	str r0, [r4]
	ldr r0, [sp, #0x38]
	ldr r2, [sp, #0x20]
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	add r1, r6, #0
	str r0, [sp, #8]
	mov r0, #8
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	mov r3, #0
	ldr r0, [r0, #4]
	bl AddPlttResObjFromNarc
	str r0, [r4, #4]
	ldr r0, [r4]
	bl sub_0200ADA4
	ldr r0, [r4]
	bl sub_0200A740
	ldr r0, [r4, #4]
	bl sub_0200B00C
	ldr r0, [r4, #4]
	bl sub_0200A740
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_0225B004: .word ov27_0225CFC8
_0225B008: .word ov27_0225CF94
_0225B00C: .word 0x0000FFFF
	thumb_func_end ov27_0225AEA8

	thumb_func_start ov27_0225B010
ov27_0225B010: ; 0x0225B010
	push {r4, r5, r6, r7, lr}
	sub sp, #0x6c
	add r5, r0, #0
	mov r0, #0x81
	lsl r0, r0, #2
	ldr r4, _0225B350 ; =ov27_0225CF3C
	mov r7, #0
	add r6, r5, r0
_0225B020:
	ldr r3, [r4]
	mov r0, #0
	str r3, [sp]
	mvn r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r7, #0
	str r0, [sp, #0x14]
	mov r0, #0x52
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, #0x64
	str r0, [sp, #0x18]
	mov r0, #0x53
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r2, r1, #0
	str r0, [sp, #0x1c]
	mov r0, #0x15
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	str r0, [sp, #0x20]
	mov r0, #0
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, r6, #0
	bl CreateSpriteResourcesHeader
	add r7, r7, #1
	add r4, r4, #4
	add r6, #0x24
	cmp r7, #0xb
	blt _0225B020
	ldr r0, [r5, #0x18]
	add r1, sp, #0x3c
	str r0, [sp, #0x3c]
	mov r0, #0x81
	lsl r0, r0, #2
	add r7, r5, r0
	mov r0, #0
	str r0, [sp, #0x2c]
	str r0, [sp, #0x4c]
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [sp, #0x50]
	str r0, [sp, #0x54]
	str r0, [sp, #0x58]
	ldr r0, [sp, #0x2c]
	str r7, [sp, #0x40]
	strh r0, [r1, #0x20]
	mov r0, #1
	str r0, [sp, #0x60]
	mov r0, #2
	str r0, [sp, #0x64]
	mov r0, #8
	ldr r6, _0225B354 ; =ov27_0225D038
	str r0, [sp, #0x68]
	add r4, r5, #0
_0225B0A0:
	ldrh r0, [r6]
	str r7, [sp, #0x40]
	cmp r0, #0
	beq _0225B0BA
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0225B0C8
_0225B0BA:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0225B0C8:
	bl _ffix
	str r0, [sp, #0x44]
	ldrh r0, [r6, #2]
	cmp r0, #0
	beq _0225B0E6
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0225B0F4
_0225B0E6:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0225B0F4:
	bl _ffix
	mov r1, #1
	lsl r1, r1, #0x14
	add r0, r0, r1
	str r0, [sp, #0x48]
	add r0, sp, #0x3c
	bl CreateSprite
	mov r1, #0x39
	lsl r1, r1, #4
	str r0, [r4, r1]
	add r0, r1, #0
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #0x39
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_02024A04
	mov r0, #0x39
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_0202487C
	ldr r0, [sp, #0x2c]
	add r7, #0x24
	add r0, r0, #1
	add r6, r6, #4
	add r4, r4, #4
	str r0, [sp, #0x2c]
	cmp r0, #9
	blt _0225B0A0
	mov r0, #9
	str r0, [sp, #0x30]
	mov r0, #0xd2
	lsl r0, r0, #2
	add r4, r5, #0
	mov r7, #0x3f
	add r0, r5, r0
	ldr r6, _0225B358 ; =ov27_0225D05C
	add r4, #0x24
	lsl r7, r7, #0x18
	str r0, [sp, #0x38]
_0225B154:
	ldr r0, [sp, #0x38]
	str r0, [sp, #0x40]
	ldrh r0, [r6]
	cmp r0, #0
	beq _0225B16E
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	add r0, r7, #0
	bl _fadd
	b _0225B17A
_0225B16E:
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r7, #0
	bl _fsub
_0225B17A:
	bl _ffix
	str r0, [sp, #0x44]
	ldrh r0, [r6, #2]
	cmp r0, #0
	beq _0225B196
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	add r0, r7, #0
	bl _fadd
	b _0225B1A2
_0225B196:
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r7, #0
	bl _fsub
_0225B1A2:
	bl _ffix
	mov r1, #1
	lsl r1, r1, #0x14
	add r0, r0, r1
	str r0, [sp, #0x48]
	add r0, sp, #0x3c
	bl CreateSprite
	mov r1, #0x39
	lsl r1, r1, #4
	str r0, [r4, r1]
	add r0, r1, #0
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #0x39
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #2
	bl sub_02024A04
	ldr r0, [sp, #0x30]
	add r6, r6, #4
	add r0, r0, #1
	add r4, r4, #4
	str r0, [sp, #0x30]
	cmp r0, #0xf
	blt _0225B154
	ldr r0, _0225B35C ; =0x0000051C
	ldr r0, [r5, r0]
	lsl r0, r0, #0x1b
	lsr r1, r0, #0x1c
	sub r0, r1, #1
	cmp r0, #2
	bhi _0225B27E
	cmp r1, #1
	bne _0225B1F6
	mov r0, #0x90
	str r0, [sp, #0x34]
	b _0225B200
_0225B1F6:
	sub r0, r1, #2
	cmp r0, #1
	bhi _0225B200
	mov r0, #0x68
	str r0, [sp, #0x34]
_0225B200:
	mov r0, #0xdb
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [sp, #0x40]
	mov r0, #0x19
	lsl r0, r0, #0xe
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	bl _ffix
	str r0, [sp, #0x44]
	ldr r0, [sp, #0x34]
	cmp r0, #0
	ble _0225B238
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0225B246
_0225B238:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0225B246:
	bl _ffix
	mov r1, #1
	lsl r1, r1, #0x14
	add r0, r0, r1
	str r0, [sp, #0x48]
	add r0, sp, #0x3c
	bl CreateSprite
	mov r1, #0xf3
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #0xf3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_02024A04
	mov r0, #0xf3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #6
	bl Set2dSpriteAnimSeqNo
_0225B27E:
	ldr r0, _0225B35C ; =0x0000051C
	ldr r0, [r5, r0]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1c
	cmp r0, #2
	bne _0225B2D2
	ldr r0, [r5, #0x10]
	bl FieldSys_BugContest_get
	add r4, r0, #0
	bne _0225B298
	bl GF_AssertFail
_0225B298:
	ldrb r0, [r4, #0x17]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _0225B2E2
	mov r0, #0xea
	lsl r0, r0, #2
	mov r3, #1
	ldr r0, [r5, r0]
	mov r1, #0x68
	mov r2, #0x88
	lsl r3, r3, #0x14
	bl sub_0200DDC4
	ldr r0, [r4, #0x10]
	bl Pokemon_GetIconPalette
	add r1, r0, #0
	mov r0, #0xea
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02024AA8
	mov r0, #0xea
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #6
	bl Set2dSpriteAnimSeqNo
	b _0225B2E2
_0225B2D2:
	cmp r0, #3
	bne _0225B2E2
	mov r0, #0xea
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
_0225B2E2:
	mov r0, #0xed
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteAnimSeqNo
	mov r0, #0xee
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #8
	bl Set2dSpriteAnimSeqNo
	mov r0, #0xef
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #3
	bl Set2dSpriteAnimSeqNo
	mov r0, #0xf
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #5
	bl Set2dSpriteAnimSeqNo
	mov r0, #0xf2
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0xc
	bl Set2dSpriteAnimSeqNo
	mov r0, #0xf2
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0xf1
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_02024A04
	add r0, r5, #0
	bl ov27_0225A4B8
	add r0, r5, #0
	mov r1, #1
	bl ov27_0225A9C0
	add r0, r5, #0
	bl ov27_0225AA7C
	add sp, #0x6c
	pop {r4, r5, r6, r7, pc}
	nop
_0225B350: .word ov27_0225CF3C
_0225B354: .word ov27_0225D038
_0225B358: .word ov27_0225D05C
_0225B35C: .word 0x0000051C
	thumb_func_end ov27_0225B010

	thumb_func_start ov27_0225B360
ov27_0225B360: ; 0x0225B360
	push {r3, r4, r5, r6}
	mov r5, #0xc
	mul r5, r0
	ldr r6, _0225B394 ; =ov27_0225D0B4
	lsl r0, r1, #1
	mov r4, #0
	add r5, r6, r5
	add r0, r1, r0
	mvn r4, r4
	mov r3, #0
	add r5, r5, r0
_0225B376:
	ldrb r1, [r5]
	lsl r0, r1, #3
	ldrb r0, [r2, r0]
	cmp r0, #0
	beq _0225B384
	add r4, r1, #0
	b _0225B38C
_0225B384:
	add r3, r3, #1
	add r5, r5, #1
	cmp r3, #3
	blt _0225B376
_0225B38C:
	add r0, r4, #0
	pop {r3, r4, r5, r6}
	bx lr
	nop
_0225B394: .word ov27_0225D0B4
	thumb_func_end ov27_0225B360

	thumb_func_start ov27_0225B398
ov27_0225B398: ; 0x0225B398
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	str r1, [sp]
	cmp r1, #7
	blt _0225B3A6
	bl GF_AssertFail
_0225B3A6:
	ldr r0, _0225B3F0 ; =0x000004CC
	mov r4, #0
	add r5, r4, #0
	add r7, r6, r0
_0225B3AE:
	ldr r0, _0225B3F4 ; =0x0000051C
	ldr r0, [r6, r0]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1c
	lsl r1, r0, #3
	ldr r0, _0225B3F8 ; =ov27_0225CFC8
	add r0, r0, r1
	ldrb r1, [r4, r0]
	ldr r0, _0225B3FC ; =ov27_0225CF94
	lsl r2, r1, #2
	ldrh r0, [r0, r2]
	mov r2, #0
	cmp r1, #0xd
	beq _0225B3E4
	ldr r1, _0225B400 ; =0x0000FFFF
	cmp r0, r1
	beq _0225B3E4
	ldr r0, [sp]
	cmp r4, r0
	bne _0225B3D8
	mov r2, #0x10
_0225B3D8:
	lsl r0, r2, #1
	add r0, r7, r0
	add r1, r5, #0
	mov r2, #0x20
	bl GXS_LoadOBJPltt
_0225B3E4:
	add r4, r4, #1
	add r5, #0x20
	cmp r4, #7
	blt _0225B3AE
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225B3F0: .word 0x000004CC
_0225B3F4: .word 0x0000051C
_0225B3F8: .word ov27_0225CFC8
_0225B3FC: .word ov27_0225CF94
_0225B400: .word 0x0000FFFF
	thumb_func_end ov27_0225B398

	thumb_func_start ov27_0225B404
ov27_0225B404: ; 0x0225B404
	push {r3, r4, r5, lr}
	ldr r1, _0225B4A8 ; =gSystem
	add r5, r0, #0
	ldr r1, [r1, #0x48]
	mov r4, #0
	mov r2, #0x40
	mvn r4, r4
	ldr r0, [r5, #0x14]
	tst r2, r1
	beq _0225B41C
	mov r4, #0
	b _0225B438
_0225B41C:
	mov r2, #0x80
	tst r2, r1
	beq _0225B426
	mov r4, #1
	b _0225B438
_0225B426:
	mov r2, #0x20
	tst r2, r1
	beq _0225B430
	mov r4, #2
	b _0225B438
_0225B430:
	mov r2, #0x10
	tst r1, r2
	beq _0225B438
	mov r4, #3
_0225B438:
	cmp r4, #0
	blt _0225B448
	mov r2, #0x47
	lsl r2, r2, #4
	add r1, r4, #0
	add r2, r5, r2
	bl ov27_0225B360
_0225B448:
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0225B4A6
	ldr r1, [r5, #0x14]
	cmp r1, r0
	beq _0225B4A6
	str r0, [r5, #0x14]
	mov r0, #0x5e
	lsl r0, r0, #4
	bl PlaySE
	cmp r4, #1
	bhi _0225B478
	ldr r0, [r5, #0x14]
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x39
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #3
	bl Set2dSpriteAnimSeqNo
	b _0225B490
_0225B478:
	sub r0, r4, #2
	cmp r0, #1
	bhi _0225B490
	ldr r0, [r5, #0x14]
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x39
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
_0225B490:
	ldr r1, [r5, #0x14]
	add r0, r5, #0
	bl ov27_0225B398
	ldr r1, [r5, #0x14]
	add r0, r5, #0
	bl ov27_0225C170
	ldr r1, [r5, #0x10]
	add r1, #0xd3
	strb r0, [r1]
_0225B4A6:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0225B4A8: .word gSystem
	thumb_func_end ov27_0225B404

	thumb_func_start ov27_0225B4AC
ov27_0225B4AC: ; 0x0225B4AC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r4, #0
	mov r7, #1
_0225B4B6:
	ldr r0, [r5]
	cmp r0, #0
	beq _0225B4CE
	cmp r6, r4
	beq _0225B4C8
	add r1, r7, #0
	bl sub_02024B78
	b _0225B4CE
_0225B4C8:
	mov r1, #0
	bl sub_02024B78
_0225B4CE:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #9
	blt _0225B4B6
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov27_0225B4AC

	thumb_func_start ov27_0225B4D8
ov27_0225B4D8: ; 0x0225B4D8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x40]
	bl sub_0205C6D4
	cmp r0, #0
	bne _0225B4F2
	ldr r0, _0225B624 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #0xf0
	tst r0, r1
	beq _0225B4F6
_0225B4F2:
	mov r0, #1
	pop {r4, r5, r6, pc}
_0225B4F6:
	ldr r0, _0225B628 ; =0x0000051C
	ldr r0, [r5, r0]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1c
	cmp r0, #5
	bne _0225B53E
	bl sub_0203769C
	add r4, r0, #0
	bl sub_02058740
	cmp r0, #0
	beq _0225B53A
	bl sub_02058258
	cmp r0, #0
	beq _0225B53A
	bl sub_02056EE0
	cmp r0, #0
	beq _0225B53A
	bl sub_02057A0C
	cmp r0, #0
	beq _0225B53A
	add r0, r4, #0
	bl sub_02057F18
	cmp r0, #0
	bne _0225B53A
	bl sub_02037958
	cmp r0, #0
	beq _0225B53E
_0225B53A:
	mov r0, #1
	pop {r4, r5, r6, pc}
_0225B53E:
	bl IsPaletteFadeFinished
	cmp r0, #0
	bne _0225B54A
	mov r0, #1
	pop {r4, r5, r6, pc}
_0225B54A:
	ldr r0, _0225B628 ; =0x0000051C
	ldr r0, [r5, r0]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0225B55A
	mov r0, #1
	pop {r4, r5, r6, pc}
_0225B55A:
	ldr r0, _0225B62C ; =ov27_0225CF68
	bl sub_02025224
	add r4, r0, #0
	cmp r4, #0
	ble _0225B57E
	cmp r4, #8
	bge _0225B57E
	sub r0, r4, #1
	lsl r0, r0, #3
	add r1, r5, r0
	mov r0, #0x47
	lsl r0, r0, #4
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _0225B57E
	mov r0, #0
	pop {r4, r5, r6, pc}
_0225B57E:
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0xc]
	bl Sav2_Bag_get
	add r6, r0, #0
	add r0, r4, #0
	sub r0, #8
	cmp r0, #1
	bhi _0225B5AC
	ldr r0, _0225B628 ; =0x0000051C
	ldr r0, [r5, r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bne _0225B59E
	mov r0, #1
	pop {r4, r5, r6, pc}
_0225B59E:
	add r0, r5, #0
	bl ov27_0225BDAC
	cmp r0, #0
	bne _0225B5AC
	mov r0, #1
	pop {r4, r5, r6, pc}
_0225B5AC:
	cmp r4, #8
	bne _0225B5BE
	add r0, r6, #0
	bl Bag_GetRegisteredItemSlot1
	cmp r0, #0
	bne _0225B5D0
	mov r0, #1
	pop {r4, r5, r6, pc}
_0225B5BE:
	cmp r4, #9
	bne _0225B5D0
	add r0, r6, #0
	bl Bag_GetRegisteredItemSlot2
	cmp r0, #0
	bne _0225B5D0
	mov r0, #1
	pop {r4, r5, r6, pc}
_0225B5D0:
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _0225B620
	cmp r4, #0
	bne _0225B5E4
	ldr r0, [r5, #0xc]
	mov r1, #1
	strh r1, [r0]
	b _0225B61C
_0225B5E4:
	sub r1, r4, #1
	lsl r0, r1, #2
	add r2, r5, r0
	mov r0, #0x39
	lsl r0, r0, #4
	ldr r0, [r2, r0]
	cmp r0, #0
	beq _0225B61C
	cmp r4, #8
	bge _0225B60E
	str r1, [r5, #0x14]
	add r0, r5, #0
	bl ov27_0225C170
	ldr r1, [r5, #0x10]
	add r1, #0xd3
	strb r0, [r1]
	ldr r1, [r5, #0x14]
	add r0, r5, #0
	bl ov27_0225B398
_0225B60E:
	add r0, r5, #0
	sub r1, r4, #1
	bl ov27_0225C170
	add r1, r0, #2
	ldr r0, [r5, #0xc]
	strh r1, [r0]
_0225B61C:
	mov r0, #0
	pop {r4, r5, r6, pc}
_0225B620:
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0225B624: .word gSystem
_0225B628: .word 0x0000051C
_0225B62C: .word ov27_0225CF68
	thumb_func_end ov27_0225B4D8

	thumb_func_start ov27_0225B630
ov27_0225B630: ; 0x0225B630
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r7, r0, #0
	str r1, [sp, #0x10]
	ldr r6, [r7]
	bl GetWindowX
	add r5, r0, #0
	add r0, r7, #0
	bl GetWindowY
	add r4, r0, #0
	add r0, r7, #0
	bl GetWindowWidth
	str r0, [sp, #0x14]
	add r0, r7, #0
	bl GetWindowHeight
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x10]
	cmp r0, #1
	beq _0225B666
	cmp r0, #2
	bne _0225B664
	b _0225B8C2
_0225B664:
	b _0225BB1E
_0225B666:
	sub r0, r4, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	sub r3, r5, #3
	str r0, [sp, #8]
	mov r0, #2
	lsl r3, r3, #0x18
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #4
	mov r2, #0xa9
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	sub r0, r4, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	sub r3, r5, #2
	str r0, [sp, #8]
	mov r0, #2
	lsl r3, r3, #0x18
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #4
	mov r2, #0xaa
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	sub r0, r4, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	sub r3, r5, #1
	str r0, [sp, #8]
	mov r0, #2
	lsl r3, r3, #0x18
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #4
	mov r2, #0xab
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	sub r0, r4, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x14]
	lsl r3, r5, #0x18
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #5
	mov r2, #0xac
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [sp, #0x14]
	mov r1, #5
	add r7, r5, r0
	sub r0, r4, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #2
	lsl r3, r7, #0x18
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r2, #0xad
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	sub r3, r5, #3
	str r0, [sp, #8]
	mov r0, #2
	lsl r3, r3, #0x18
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #4
	mov r2, #0x64
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	sub r3, r5, #2
	str r0, [sp, #8]
	mov r0, #2
	lsl r3, r3, #0x18
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #4
	mov r2, #0x65
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	sub r3, r5, #1
	str r0, [sp, #8]
	mov r0, #2
	lsl r3, r3, #0x18
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #4
	mov r2, #0x66
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #2
	lsl r3, r7, #0x18
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #5
	mov r2, #0x68
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	sub r3, r5, #3
	str r0, [sp, #8]
	mov r0, #2
	lsl r3, r3, #0x18
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #4
	mov r2, #0x84
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	sub r3, r5, #2
	str r0, [sp, #8]
	mov r0, #2
	lsl r3, r3, #0x18
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #4
	mov r2, #0x85
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	sub r3, r5, #1
	str r0, [sp, #8]
	mov r0, #2
	lsl r3, r3, #0x18
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #4
	mov r2, #0x86
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #2
	lsl r3, r7, #0x18
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #5
	mov r2, #0x88
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [sp, #0x18]
	sub r3, r5, #3
	add r4, r4, r0
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #2
	lsl r3, r3, #0x18
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #4
	mov r2, #0xa4
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	sub r3, r5, #2
	str r0, [sp, #8]
	mov r0, #2
	lsl r3, r3, #0x18
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #4
	mov r2, #0xa5
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	sub r3, r5, #1
	str r0, [sp, #8]
	mov r0, #2
	lsl r3, r3, #0x18
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #4
	mov r2, #0xa6
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x14]
	lsl r3, r5, #0x18
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #5
	mov r2, #0xa7
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #2
	lsl r3, r7, #0x18
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #5
	mov r2, #0xa8
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	b _0225BB22
_0225B8C2:
	sub r0, r4, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	sub r3, r5, #3
	str r0, [sp, #8]
	mov r0, #0
	lsl r3, r3, #0x18
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #4
	mov r2, #7
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	sub r0, r4, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	sub r3, r5, #2
	str r0, [sp, #8]
	mov r0, #0
	lsl r3, r3, #0x18
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #4
	mov r2, #7
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	sub r0, r4, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	sub r3, r5, #1
	str r0, [sp, #8]
	mov r0, #0
	lsl r3, r3, #0x18
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #4
	mov r2, #7
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	sub r0, r4, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x14]
	lsl r3, r5, #0x18
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #5
	mov r2, #0
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [sp, #0x14]
	mov r1, #5
	add r7, r5, r0
	sub r0, r4, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #2
	lsl r3, r7, #0x18
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r2, #0
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	sub r3, r5, #3
	str r0, [sp, #8]
	mov r0, #0
	lsl r3, r3, #0x18
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #4
	mov r2, #7
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	sub r3, r5, #2
	str r0, [sp, #8]
	mov r0, #0
	lsl r3, r3, #0x18
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #4
	mov r2, #7
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	sub r3, r5, #1
	str r0, [sp, #8]
	mov r0, #0
	lsl r3, r3, #0x18
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #4
	mov r2, #7
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #2
	lsl r3, r7, #0x18
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #5
	mov r2, #0
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	sub r3, r5, #3
	str r0, [sp, #8]
	mov r0, #0
	lsl r3, r3, #0x18
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #4
	mov r2, #7
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	sub r3, r5, #2
	str r0, [sp, #8]
	mov r0, #0
	lsl r3, r3, #0x18
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #4
	mov r2, #7
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	sub r3, r5, #1
	str r0, [sp, #8]
	mov r0, #0
	lsl r3, r3, #0x18
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #4
	mov r2, #7
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #2
	lsl r3, r7, #0x18
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #5
	mov r2, #0
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [sp, #0x18]
	sub r3, r5, #3
	add r4, r4, r0
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	lsl r3, r3, #0x18
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #4
	mov r2, #7
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	sub r3, r5, #2
	str r0, [sp, #8]
	mov r0, #0
	lsl r3, r3, #0x18
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #4
	mov r2, #7
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	sub r3, r5, #1
	str r0, [sp, #8]
	mov r0, #0
	lsl r3, r3, #0x18
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #4
	mov r2, #7
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x14]
	lsl r3, r5, #0x18
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #5
	mov r2, #0
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #2
	lsl r3, r7, #0x18
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #5
	mov r2, #0
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	b _0225BB22
_0225BB1E:
	bl GF_AssertFail
_0225BB22:
	add r0, r6, #0
	mov r1, #4
	bl ScheduleBgTilemapBufferTransfer
	add r0, r6, #0
	mov r1, #5
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov27_0225B630

	thumb_func_start ov27_0225BB38
ov27_0225BB38: ; 0x0225BB38
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r1, #0
	ldr r1, _0225BB68 ; =ov27_0225CEC4
	lsl r2, r2, #2
	ldr r4, [r1, r2]
	add r5, r0, #0
	lsl r1, r4, #0x18
	lsr r1, r1, #0x18
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r4, [sp, #8]
	add r0, r5, #0
	add r2, r6, #0
	mov r3, #3
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0225BB68: .word ov27_0225CEC4
	thumb_func_end ov27_0225BB38

	thumb_func_start ov27_0225BB6C
ov27_0225BB6C: ; 0x0225BB6C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	add r2, r0, #0
	ldr r0, _0225BC10 ; =0x000004AC
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferPlayersName
	ldr r7, _0225BC14 ; =ov27_0225CFC8
	mov r4, #0
	add r6, r5, #0
_0225BB8A:
	ldr r0, _0225BC18 ; =0x0000051C
	ldr r0, [r5, r0]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1c
	lsl r0, r0, #3
	add r0, r7, r0
	ldrb r2, [r4, r0]
	cmp r2, #0xd
	beq _0225BBBA
	lsl r3, r2, #2
	ldr r2, _0225BC1C ; =ov27_0225CF94
	ldr r0, _0225BC10 ; =0x000004AC
	add r2, r2, r3
	ldrh r2, [r2, #2]
	ldr r1, _0225BC20 ; =0x000004A8
	ldr r0, [r5, r0]
	lsl r2, r2, #0x11
	ldr r1, [r5, r1]
	lsr r2, r2, #0x11
	mov r3, #8
	bl ReadMsgData_ExpandPlaceholders
	ldr r1, _0225BC24 ; =0x00000474
	str r0, [r6, r1]
_0225BBBA:
	add r4, r4, #1
	add r6, #8
	cmp r4, #7
	blt _0225BB8A
	ldr r4, _0225BC28 ; =ov27_0225CED8
	mov r7, #0
	add r6, r5, #0
_0225BBC8:
	ldr r0, _0225BC20 ; =0x000004A8
	ldr r1, [r4]
	ldr r0, [r5, r0]
	bl NewString_ReadMsgData
	mov r1, #0x4b
	lsl r1, r1, #4
	str r0, [r6, r1]
	add r7, r7, #1
	add r4, r4, #4
	add r6, r6, #4
	cmp r7, #5
	blt _0225BBC8
	sub r1, r1, #4
	ldr r0, [r5, r1]
	sub r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0xc
	mov r3, #8
	bl ReadMsgData_ExpandPlaceholders
	ldr r1, _0225BC2C ; =0x000004C4
	mov r2, #0xd
	str r0, [r5, r1]
	add r0, r1, #0
	sub r0, #0x18
	sub r1, #0x1c
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	mov r3, #8
	bl ReadMsgData_ExpandPlaceholders
	ldr r1, _0225BC30 ; =0x000004C8
	str r0, [r5, r1]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225BC10: .word 0x000004AC
_0225BC14: .word ov27_0225CFC8
_0225BC18: .word 0x0000051C
_0225BC1C: .word ov27_0225CF94
_0225BC20: .word 0x000004A8
_0225BC24: .word 0x00000474
_0225BC28: .word ov27_0225CED8
_0225BC2C: .word 0x000004C4
_0225BC30: .word 0x000004C8
	thumb_func_end ov27_0225BB6C

	thumb_func_start ov27_0225BC34
ov27_0225BC34: ; 0x0225BC34
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0225BC78 ; =0x000004C8
	ldr r0, [r5, r0]
	bl String_dtor
	ldr r0, _0225BC7C ; =0x000004C4
	ldr r0, [r5, r0]
	bl String_dtor
	mov r7, #0x4b
	mov r6, #0
	add r4, r5, #0
	lsl r7, r7, #4
_0225BC50:
	ldr r0, [r4, r7]
	bl String_dtor
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #5
	blt _0225BC50
	ldr r6, _0225BC80 ; =0x00000474
	mov r4, #0
_0225BC62:
	ldr r0, [r5, r6]
	cmp r0, #0
	beq _0225BC6C
	bl String_dtor
_0225BC6C:
	add r4, r4, #1
	add r5, #8
	cmp r4, #7
	blt _0225BC62
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225BC78: .word 0x000004C8
_0225BC7C: .word 0x000004C4
_0225BC80: .word 0x00000474
	thumb_func_end ov27_0225BC34

	thumb_func_start ov27_0225BC84
ov27_0225BC84: ; 0x0225BC84
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	mov r7, #0
	str r0, [sp]
	add r4, r7, #0
	add r5, sp, #4
_0225BC90:
	ldr r0, [sp]
	add r1, r4, #0
	ldr r0, [r0, #0x10]
	bl sub_0203C3CC
	add r4, r4, #1
	stmia r5!, {r0}
	cmp r4, #8
	blt _0225BC90
	mov r1, #0x3f
	ldr r0, [sp]
	lsl r1, r1, #4
	mov r6, #0
	add r4, sp, #4
	add r5, r0, r1
_0225BCAE:
	ldr r0, [r4]
	cmp r0, #0
	beq _0225BCBC
	add r0, r5, #0
	bl CopyWindowToVram
	add r7, r7, #1
_0225BCBC:
	add r6, r6, #1
	add r4, r4, #4
	add r5, #0x10
	cmp r6, #8
	blt _0225BCAE
	cmp r7, #0
	beq _0225BCE4
	mov r1, #0xf2
	ldr r0, [sp]
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r1, #0x3e
	ldr r0, [sp]
	lsl r1, r1, #4
	add r0, r0, r1
	bl CopyWindowToVram
_0225BCE4:
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov27_0225BC84

	thumb_func_start ov27_0225BCE8
ov27_0225BCE8: ; 0x0225BCE8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #4
	mov r6, #0
	add r4, r5, r0
_0225BCF6:
	ldr r0, _0225BD3C ; =0x00000474
	ldr r1, [r5, r0]
	cmp r1, #0
	beq _0225BD2C
	mov r0, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	mov r1, #0x48
	sub r3, r1, r0
	mov r0, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225BD40 ; =0x000E0200
	lsr r7, r3, #0x1f
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r2, _0225BD3C ; =0x00000474
	add r7, r3, r7
	ldr r2, [r5, r2]
	add r0, r4, #0
	mov r1, #0
	asr r3, r7, #1
	bl AddTextPrinterParameterized2
_0225BD2C:
	add r6, r6, #1
	add r5, #8
	add r4, #0x10
	cmp r6, #7
	blt _0225BCF6
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225BD3C: .word 0x00000474
_0225BD40: .word 0x000E0200
	thumb_func_end ov27_0225BCE8

	thumb_func_start ov27_0225BD44
ov27_0225BD44: ; 0x0225BD44
	add r0, #0xd2
	ldrb r0, [r0]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1f
	bx lr
	.balign 4, 0
	thumb_func_end ov27_0225BD44

	thumb_func_start ov27_0225BD50
ov27_0225BD50: ; 0x0225BD50
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl SavArray_Flags_get
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02067584
	cmp r0, #0
	beq _0225BD6A
	mov r0, #6
	pop {r3, r4, r5, pc}
_0225BD6A:
	add r0, r5, #0
	bl ScriptState_CheckSafariSysFlag
	cmp r0, #0
	beq _0225BD78
	mov r0, #1
	pop {r3, r4, r5, pc}
_0225BD78:
	add r0, r5, #0
	bl CheckFlag996
	cmp r0, #0
	beq _0225BD86
	mov r0, #2
	pop {r3, r4, r5, pc}
_0225BD86:
	add r0, r5, #0
	bl ScriptState_CheckPalParkSysFlag
	cmp r0, #0
	beq _0225BD94
	mov r0, #3
	pop {r3, r4, r5, pc}
_0225BD94:
	ldr r0, [r4, #0x18]
	cmp r0, #3
	bne _0225BD9E
	mov r0, #4
	pop {r3, r4, r5, pc}
_0225BD9E:
	ldr r0, [r4, #0x70]
	cmp r0, #3
	bne _0225BDA8
	mov r0, #5
	pop {r3, r4, r5, pc}
_0225BDA8:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov27_0225BD50

	thumb_func_start ov27_0225BDAC
ov27_0225BDAC: ; 0x0225BDAC
	ldr r1, _0225BDC4 ; =0x0000051C
	ldr r0, [r0, r1]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1c
	sub r0, r0, #2
	cmp r0, #4
	bls _0225BDBE
	mov r0, #1
	bx lr
_0225BDBE:
	mov r0, #0
	bx lr
	nop
_0225BDC4: .word 0x0000051C
	thumb_func_end ov27_0225BDAC

	thumb_func_start ov27_0225BDC8
ov27_0225BDC8: ; 0x0225BDC8
	push {r3, lr}
	ldr r0, [r0, #0x10]
	ldr r0, [r0, #0xc]
	bl Save_FlyPoints_get
	bl SaveFlyPoints_GetPlayerSub
	bl FlypointsPlayerSub_CheckRunningShoes
	pop {r3, pc}
	thumb_func_end ov27_0225BDC8

	thumb_func_start ov27_0225BDDC
ov27_0225BDDC: ; 0x0225BDDC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x10]
	bl Fsys_GetGearPhoneRingManager
	str r0, [r5, #4]
	mov r0, #0xe7
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	str r0, [r5, #8]
	ldr r0, [r4, #4]
	str r0, [r5]
	mov r0, #0
	str r0, [r5, #0x1c]
	pop {r3, r4, r5, pc}
	thumb_func_end ov27_0225BDDC

	thumb_func_start ov27_0225BDFC
ov27_0225BDFC: ; 0x0225BDFC
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, [r5, #4]
	bl sub_02092E08
	ldr r1, [r5, #0x1c]
	cmp r1, #0
	bne _0225BE8A
	cmp r0, #1
	bne _0225BEAA
	cmp r1, #0
	bne _0225BEAA
	ldr r0, [r5, #4]
	mov r1, #8
	bl GetPhoneBookEntryName
	add r4, r0, #0
	mov r0, #0
	add r1, r4, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	asr r1, r0, #2
	lsr r1, r1, #0x1d
	add r1, r0, r1
	asr r0, r1, #3
	add r1, r0, #2
	cmp r1, #9
	ble _0225BE3A
	mov r1, #9
_0225BE3A:
	mov r0, #0x13
	str r0, [sp]
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #4
	str r0, [sp, #0xc]
	mov r0, #0xc0
	str r0, [sp, #0x10]
	add r1, r5, #0
	ldr r0, [r5]
	add r1, #0xc
	mov r2, #5
	mov r3, #0xb
	bl AddWindowParameterized
	add r0, r5, #0
	add r0, #0xc
	mov r1, #1
	bl ov27_0225B630
	add r0, r5, #0
	add r0, #0xc
	add r1, r4, #0
	mov r2, #1
	bl ov27_0225BB38
	add r0, r4, #0
	bl String_dtor
	ldr r0, [r5, #8]
	mov r1, #5
	bl sub_02024950
	mov r0, #1
	add sp, #0x14
	str r0, [r5, #0x1c]
	pop {r4, r5, pc}
_0225BE8A:
	cmp r0, #0
	ldr r0, [r5, #8]
	beq _0225BE9A
	mov r1, #5
	bl sub_02024950
	add sp, #0x14
	pop {r4, r5, pc}
_0225BE9A:
	mov r1, #0
	bl sub_02024950
	add r0, r5, #0
	bl ov27_0225BEB0
	mov r0, #0
	str r0, [r5, #0x1c]
_0225BEAA:
	add sp, #0x14
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov27_0225BDFC

	thumb_func_start ov27_0225BEB0
ov27_0225BEB0: ; 0x0225BEB0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _0225BED4
	add r0, r4, #0
	add r0, #0xc
	mov r1, #2
	bl ov27_0225B630
	add r0, r4, #0
	add r0, #0xc
	bl ClearWindowTilemapAndCopyToVram
	add r4, #0xc
	add r0, r4, #0
	bl RemoveWindow
_0225BED4:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov27_0225BEB0

	thumb_func_start ov27_0225BED8
ov27_0225BED8: ; 0x0225BED8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	ldr r5, [sp, #0x44]
	add r4, r0, #0
	str r3, [sp]
	add r0, sp, #0x28
	add r7, r1, #0
	ldrb r1, [r0, #0x10]
	add r6, r2, #0
	mov r2, #5
	str r1, [sp, #4]
	ldrb r0, [r0, #0x14]
	add r1, sp, #0x14
	add r3, r6, #0
	str r0, [sp, #8]
	mov r0, #4
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x40]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	bl AddWindowParameterized
	add r0, sp, #0x14
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r1, _0225BF7C ; =0x000004AC
	add r2, r7, #0
	ldr r0, [r4, r1]
	sub r1, r1, #4
	ldr r1, [r4, r1]
	mov r3, #8
	bl ReadMsgData_ExpandPlaceholders
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r5, r0
	bne _0225BF48
	mov r0, #0
	add r1, r4, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r1, sp, #0x28
	ldrb r1, [r1, #0x10]
	lsl r1, r1, #3
	sub r0, r1, r0
	lsl r0, r0, #0x10
	asr r1, r0, #0x10
	lsr r0, r1, #0x1f
	add r0, r1, r0
	lsl r0, r0, #0xf
	asr r5, r0, #0x10
_0225BF48:
	add r1, sp, #0x28
	mov r0, #0x20
	ldrsh r0, [r1, r0]
	mov r1, #0
	add r2, r4, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225BF80 ; =0x000E0200
	add r3, r5, #0
	str r0, [sp, #8]
	add r0, sp, #0x14
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl String_dtor
	add r0, sp, #0x14
	bl CopyWindowToVram
	add r0, sp, #0x14
	bl RemoveWindow
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0225BF7C: .word 0x000004AC
_0225BF80: .word 0x000E0200
	thumb_func_end ov27_0225BED8

	thumb_func_start ov27_0225BF84
ov27_0225BF84: ; 0x0225BF84
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r4, r1, #0
	mov r1, #0
	add r5, r0, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0225BFC4 ; =0x000004AC
	add r6, r2, #0
	add r2, r3, #0
	ldr r0, [r5, r0]
	mov r3, #2
	bl BufferIntegerAsString
	mov r0, #6
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _0225BFC8 ; =0x00000186
	mov r1, #0x1f
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r2, r4, #0
	add r3, r6, #0
	bl ov27_0225BED8
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0225BFC4: .word 0x000004AC
_0225BFC8: .word 0x00000186
	thumb_func_end ov27_0225BF84

	thumb_func_start ov27_0225BFCC
ov27_0225BFCC: ; 0x0225BFCC
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	ldr r0, [r1, #0x10]
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	mov r1, #0
	add r2, r0, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0225C014 ; =0x000004AC
	mov r3, #3
	ldr r0, [r4, r0]
	bl BufferIntegerAsString
	mov r0, #6
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _0225C018 ; =0x00000192
	mov r1, #0x21
	str r0, [sp, #8]
	mov r0, #4
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	add r0, r4, #0
	mov r2, #0xc
	mov r3, #0x15
	bl ov27_0225BED8
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
_0225C014: .word 0x000004AC
_0225C018: .word 0x00000192
	thumb_func_end ov27_0225BFCC

	thumb_func_start ov27_0225C01C
ov27_0225C01C: ; 0x0225C01C
	push {lr}
	sub sp, #0x14
	mov r1, #9
	str r1, [sp]
	mov r2, #2
	mov r1, #0x5d
	str r2, [sp, #4]
	lsl r1, r1, #2
	str r1, [sp, #8]
	sub r1, r2, #3
	str r1, [sp, #0xc]
	mov r1, #0
	str r1, [sp, #0x10]
	mov r1, #0x20
	mov r2, #0xb
	mov r3, #0x15
	bl ov27_0225BED8
	add sp, #0x14
	pop {pc}
	thumb_func_end ov27_0225C01C

	thumb_func_start ov27_0225C044
ov27_0225C044: ; 0x0225C044
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0xc]
	bl Save_FlyPoints_get
	bl FlyPoints_GetSafariBallsCounter
	add r3, r0, #0
	ldrh r3, [r3]
	add r0, r4, #0
	mov r1, #0xe
	mov r2, #0x13
	bl ov27_0225BF84
	add r0, r4, #0
	bl ov27_0225C01C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov27_0225C044

	thumb_func_start ov27_0225C06C
ov27_0225C06C: ; 0x0225C06C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	bl sub_020558BC
	add r3, r0, #0
	mov r1, #0xe
	lsl r3, r3, #0x10
	add r0, r4, #0
	add r2, r1, #0
	lsr r3, r3, #0x10
	bl ov27_0225BF84
	pop {r4, pc}
	thumb_func_end ov27_0225C06C

	thumb_func_start ov27_0225C088
ov27_0225C088: ; 0x0225C088
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x10]
	bl FieldSys_BugContest_get
	add r4, r0, #0
	bne _0225C09A
	bl GF_AssertFail
_0225C09A:
	add r0, r4, #0
	bl BugContest_GetSportBallsAddr
	add r3, r0, #0
	mov r1, #0xe
	ldrh r3, [r3]
	add r0, r5, #0
	add r2, r1, #0
	bl ov27_0225BF84
	ldrb r0, [r4, #0x17]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _0225C0BE
	add r0, r5, #0
	add r1, r4, #0
	bl ov27_0225BFCC
_0225C0BE:
	ldrb r1, [r4, #0x17]
	mov r0, #0xea
	lsl r0, r0, #2
	lsl r1, r1, #0x1f
	ldr r0, [r5, r0]
	lsr r1, r1, #0x1f
	bl Set2dSpriteVisibleFlag
	ldr r0, _0225C0DC ; =0x0000051A
	mov r1, #0
	strb r1, [r5, r0]
	sub r0, #0x7a
	strb r1, [r5, r0]
	pop {r3, r4, r5, pc}
	nop
_0225C0DC: .word 0x0000051A
	thumb_func_end ov27_0225C088

	thumb_func_start ov27_0225C0E0
ov27_0225C0E0: ; 0x0225C0E0
	push {r3, lr}
	ldr r1, _0225C108 ; =0x0000051C
	ldr r1, [r0, r1]
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x1c
	cmp r1, #1
	bne _0225C0F4
	bl ov27_0225C044
	pop {r3, pc}
_0225C0F4:
	cmp r1, #2
	bne _0225C0FE
	bl ov27_0225C088
	pop {r3, pc}
_0225C0FE:
	cmp r1, #3
	bne _0225C106
	bl ov27_0225C06C
_0225C106:
	pop {r3, pc}
	.balign 4, 0
_0225C108: .word 0x0000051C
	thumb_func_end ov27_0225C0E0

	thumb_func_start ov27_0225C10C
ov27_0225C10C: ; 0x0225C10C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r7, _0225C160 ; =ov27_0225CFC8
	mov r4, #0
	add r6, r5, #0
_0225C116:
	ldr r0, _0225C164 ; =0x0000051C
	ldr r0, [r5, r0]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1c
	lsl r0, r0, #3
	add r0, r7, r0
	ldrb r1, [r4, r0]
	cmp r1, #0xd
	beq _0225C14C
	cmp r1, #7
	bge _0225C13A
	ldr r0, [r5, #0x10]
	bl sub_0203C3CC
	ldr r1, _0225C168 ; =0x00000514
	add r2, r5, r4
	strb r0, [r2, r1]
	b _0225C14C
_0225C13A:
	ldr r0, _0225C16C ; =ov27_0225CF94
	lsl r1, r1, #2
	add r0, r0, r1
	ldrh r0, [r0, #2]
	add r1, r5, r4
	lsl r0, r0, #0x10
	lsr r2, r0, #0x1f
	ldr r0, _0225C168 ; =0x00000514
	strb r2, [r1, r0]
_0225C14C:
	ldr r0, _0225C168 ; =0x00000514
	add r1, r5, r4
	ldrb r1, [r1, r0]
	sub r0, #0xa4
	add r4, r4, #1
	strb r1, [r6, r0]
	add r6, #8
	cmp r4, #7
	blt _0225C116
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225C160: .word ov27_0225CFC8
_0225C164: .word 0x0000051C
_0225C168: .word 0x00000514
_0225C16C: .word ov27_0225CF94
	thumb_func_end ov27_0225C10C

	thumb_func_start ov27_0225C170
ov27_0225C170: ; 0x0225C170
	push {r3, r4, r5, lr}
	mov r4, #0
	sub r2, r1, #7
	mvn r4, r4
	cmp r2, #1
	bhi _0225C180
	add r0, r1, #0
	pop {r3, r4, r5, pc}
_0225C180:
	add r3, r1, #1
	mov r5, #0
	cmp r3, #0
	ble _0225C19C
	mov r1, #0x47
	lsl r1, r1, #4
_0225C18C:
	ldrb r2, [r0, r1]
	cmp r2, #0
	beq _0225C194
	add r4, r4, #1
_0225C194:
	add r5, r5, #1
	add r0, #8
	cmp r5, r3
	blt _0225C18C
_0225C19C:
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _0225C1A8
	bl GF_AssertFail
_0225C1A8:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov27_0225C170

	thumb_func_start ov27_0225C1AC
ov27_0225C1AC: ; 0x0225C1AC
	push {r4, r5, r6, r7}
	mov r5, #0
	mov r6, #0
	mov r2, #0x47
	mvn r5, r5
	add r4, r6, #0
	add r7, r0, #0
	lsl r2, r2, #4
_0225C1BC:
	ldrb r3, [r7, r2]
	cmp r3, #0
	beq _0225C1CC
	cmp r1, r6
	bne _0225C1CA
	add r5, r4, #0
	b _0225C1D4
_0225C1CA:
	add r6, r6, #1
_0225C1CC:
	add r4, r4, #1
	add r7, #8
	cmp r4, #7
	blt _0225C1BC
_0225C1D4:
	mov r1, #0
	mvn r1, r1
	cmp r5, r1
	bne _0225C1E4
	ldr r0, [r0, #0x10]
	mov r5, #0
	add r0, #0xd3
	strb r5, [r0]
_0225C1E4:
	add r0, r5, #0
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end ov27_0225C1AC

	thumb_func_start ov27_0225C1EC
ov27_0225C1EC: ; 0x0225C1EC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _0225C1FA
	bl GF_AssertFail
_0225C1FA:
	ldr r0, [r4, #0x14]
	lsl r0, r0, #3
	add r1, r4, r0
	mov r0, #0x47
	lsl r0, r0, #4
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _0225C236
	mov r0, #0x47
	mov r2, #0
	add r3, r4, #0
	lsl r0, r0, #4
_0225C212:
	ldrb r1, [r3, r0]
	cmp r1, #0
	beq _0225C22E
	ldr r0, [r4, #0x10]
	add r0, #0xd3
	strb r2, [r0]
	ldr r1, [r4, #0x10]
	add r0, r4, #0
	add r1, #0xd3
	ldrb r1, [r1]
	bl ov27_0225C1AC
	str r0, [r4, #0x14]
	pop {r4, pc}
_0225C22E:
	add r2, r2, #1
	add r3, #8
	cmp r2, #7
	blt _0225C212
_0225C236:
	pop {r4, pc}
	thumb_func_end ov27_0225C1EC

	thumb_func_start ov27_0225C238
ov27_0225C238: ; 0x0225C238
	ldr r3, _0225C244 ; =AllocFromHeapAtEnd
	mov r1, #0xfa
	mov r0, #3
	lsl r1, r1, #2
	bx r3
	nop
_0225C244: .word AllocFromHeapAtEnd
	thumb_func_end ov27_0225C238

	thumb_func_start ov27_0225C248
ov27_0225C248: ; 0x0225C248
	bx lr
	.balign 4, 0
	thumb_func_end ov27_0225C248

	thumb_func_start ov27_0225C24C
ov27_0225C24C: ; 0x0225C24C
	bx lr
	.balign 4, 0
	thumb_func_end ov27_0225C24C

	thumb_func_start ov27_0225C250
ov27_0225C250: ; 0x0225C250
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r7, r1, #0
	mov r0, #3
	str r2, [sp]
	mov r1, #8
	lsl r2, r0, #0xf
	str r3, [sp, #4]
	bl CreateHeap
	mov r0, #0
	bl GXS_SetGraphicsMode
	mov r0, #0x80
	bl GX_SetBankForSubBG
	mov r0, #1
	lsl r0, r0, #8
	bl GX_SetBankForSubOBJ
	ldr r2, _0225C37C ; =0x04001000
	ldr r0, _0225C380 ; =0xFFCFFFEF
	ldr r1, [r2]
	mov r3, #0
	and r1, r0
	mov r0, #0x10
	orr r0, r1
	str r0, [r2]
	ldr r2, _0225C384 ; =ov27_0225D370
	add r0, r5, #0
	mov r1, #4
	bl InitBgFromTemplate
	ldr r2, _0225C388 ; =ov27_0225D38C
	add r0, r5, #0
	mov r1, #5
	mov r3, #0
	bl InitBgFromTemplate
	ldr r2, _0225C38C ; =ov27_0225D3A8
	add r0, r5, #0
	mov r1, #6
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	add r3, r0, #0
	bl BG_ClearCharDataRange
	mov r0, #5
	mov r1, #0x20
	mov r2, #0
	mov r3, #4
	bl BG_ClearCharDataRange
	mov r0, #6
	mov r1, #0x20
	mov r2, #0
	mov r3, #4
	bl BG_ClearCharDataRange
	add r0, r5, #0
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	add r0, r5, #0
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	mov r1, #0xe9
	ldr r0, _0225C390 ; =ov27_0225C434
	lsl r1, r1, #2
	mov r2, #0xa
	mov r3, #8
	bl sub_02007200
	add r6, r0, #0
	bl sub_0201F988
	add r4, r0, #0
	str r6, [r4, #0x1c]
	mov r0, #0
	str r0, [r4, #0x14]
	str r5, [r4, #0x18]
	ldr r1, [sp]
	str r7, [r4, #0x20]
	str r1, [r4, #0x24]
	str r0, [r4, #0x48]
	ldr r1, [sp, #4]
	str r0, [r4]
	str r1, [r4, #4]
	mov r1, #0xe7
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r1, r1, #4
	str r0, [r4, r1]
	str r0, [r4, #0x34]
	str r0, [r4, #0x44]
	mov r0, #4
	mov r1, #8
	bl FontID_Alloc
	ldr r1, [r4, #0x24]
	add r0, r4, #0
	add r1, #0xd2
	ldrb r1, [r1]
	lsl r1, r1, #0x1a
	lsr r1, r1, #0x1a
	bl ov27_0225C914
	add r0, r4, #0
	bl ov27_0225C4AC
	add r0, r4, #0
	bl ov27_0225C72C
	add r0, r4, #0
	mov r1, #0
	bl ov27_0225C80C
	ldr r2, _0225C37C ; =0x04001000
	ldr r0, _0225C394 ; =0xFFFF1FFF
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineBToggleLayers
	mov r0, #2
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #1
	bl sub_02002B8C
	add r0, r6, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225C37C: .word 0x04001000
_0225C380: .word 0xFFCFFFEF
_0225C384: .word ov27_0225D370
_0225C388: .word ov27_0225D38C
_0225C38C: .word ov27_0225D3A8
_0225C390: .word ov27_0225C434
_0225C394: .word 0xFFFF1FFF
	thumb_func_end ov27_0225C250

	thumb_func_start ov27_0225C398
ov27_0225C398: ; 0x0225C398
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	add r0, r1, #0
	str r1, [sp, #4]
	bl sub_0201F988
	add r7, r0, #0
	mov r0, #0xd5
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	bl sub_0200AEB0
	mov r0, #0xd6
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	bl sub_0200B0A8
	mov r6, #0xd1
	mov r4, #0
	add r5, r7, #0
	lsl r6, r6, #2
_0225C3C4:
	ldr r0, [r5, r6]
	bl Destroy2DGfxResObjMan
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0225C3C4
	mov r0, #0x86
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	bl sub_02024504
	mov r0, #0
	bl sub_02002B8C
	add r0, r7, #0
	bl ov27_0225C930
	mov r0, #4
	bl FontID_Release
	ldr r0, [sp, #4]
	bl sub_02007234
	ldr r0, [sp]
	mov r1, #6
	bl FreeBgTilemapBuffer
	ldr r0, [sp]
	mov r1, #5
	bl FreeBgTilemapBuffer
	ldr r0, [sp]
	mov r1, #4
	bl FreeBgTilemapBuffer
	mov r0, #8
	bl DestroyHeap
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov27_0225C398

	thumb_func_start ov27_0225C418
ov27_0225C418: ; 0x0225C418
	mov r0, #1
	bx lr
	thumb_func_end ov27_0225C418

	thumb_func_start ov27_0225C41C
ov27_0225C41C: ; 0x0225C41C
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl sub_0201F988
	mov r1, #0xe7
	lsl r1, r1, #2
	str r5, [r0, r1]
	add r1, r1, #4
	str r4, [r0, r1]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov27_0225C41C

	thumb_func_start ov27_0225C434
ov27_0225C434: ; 0x0225C434
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4, #0x24]
	bl Fsys_TaskIsRunning
	cmp r0, #0
	bne _0225C46C
	ldr r0, [r4, #0x24]
	add r1, r0, #0
	add r1, #0xd2
	ldrb r1, [r1]
	lsl r1, r1, #0x1a
	lsr r1, r1, #0x1a
	cmp r1, #2
	bne _0225C464
	add r1, r0, #0
	add r1, #0xd2
	ldrb r2, [r1]
	mov r1, #0x3f
	add r0, #0xd2
	bic r2, r1
	mov r1, #3
	orr r1, r2
	strb r1, [r0]
_0225C464:
	ldr r0, _0225C4A4 ; =0x04001050
	mov r1, #0
	strh r1, [r0]
	b _0225C496
_0225C46C:
	ldr r1, [r4]
	add r0, r4, #0
	lsl r2, r1, #2
	ldr r1, _0225C4A8 ; =ov27_0225D4D4
	ldr r1, [r1, r2]
	blx r1
	cmp r0, #1
	bne _0225C496
	ldr r2, [r4, #0x24]
	add r0, r2, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x3f
	add r2, #0xd2
	bic r1, r0
	strb r1, [r2]
	mov r1, #0
	ldr r0, [r4, #0x24]
	add r2, r1, #0
	bl ov01_021F6A9C
_0225C496:
	mov r0, #0x86
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0202457C
	pop {r4, pc}
	nop
_0225C4A4: .word 0x04001050
_0225C4A8: .word ov27_0225D4D4
	thumb_func_end ov27_0225C434

	thumb_func_start ov27_0225C4AC
ov27_0225C4AC: ; 0x0225C4AC
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0xef
	mov r1, #8
	bl NARC_ctor
	mov r1, #0
	ldr r2, _0225C53C ; =0x04001050
	add r3, r1, #0
	strh r1, [r2]
	mov r2, #0xa0
	str r2, [sp]
	mov r2, #8
	str r2, [sp, #4]
	mov r2, #4
	add r4, r0, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #8
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x18]
	add r0, r4, #0
	mov r1, #1
	mov r3, #6
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #8
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x18]
	add r0, r4, #0
	mov r1, #9
	mov r3, #6
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #8
	str r0, [sp]
	add r0, r4, #0
	mov r1, #9
	mov r2, #0
	add r3, sp, #0x10
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	ldr r3, [sp, #0x10]
	add r6, r0, #0
	add r2, r3, #0
	ldr r0, [r5, #0x18]
	ldr r3, [r3, #8]
	mov r1, #6
	add r2, #0xc
	bl BG_LoadScreenTilemapData
	ldr r0, [r5, #0x18]
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
	add r0, r6, #0
	bl FreeToHeap
	add r0, r4, #0
	bl NARC_dtor
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0225C53C: .word 0x04001050
	thumb_func_end ov27_0225C4AC

	thumb_func_start ov27_0225C540
ov27_0225C540: ; 0x0225C540
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0xef
	mov r1, #8
	bl NARC_ctor
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #8
	str r1, [sp, #0xc]
	ldr r2, [r5, #0x18]
	mov r1, #1
	mov r3, #4
	add r4, r0, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #8
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x18]
	add r0, r4, #0
	mov r1, #0xa
	mov r3, #4
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add r0, r4, #0
	bl NARC_dtor
	mov r0, #8
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #4
	str r0, [sp, #0xc]
	mov r0, #0x80
	str r0, [sp, #0x10]
	add r1, r5, #0
	ldr r0, [r5, #0x18]
	add r1, #0x28
	mov r2, #5
	mov r3, #0xc
	bl AddWindowParameterized
	mov r0, #0xe
	str r0, [sp]
	mov r0, #8
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #4
	str r0, [sp, #0xc]
	mov r0, #0x90
	str r0, [sp, #0x10]
	add r1, r5, #0
	ldr r0, [r5, #0x18]
	add r1, #0x38
	mov r2, #5
	mov r3, #0xc
	bl AddWindowParameterized
	add r0, r5, #0
	ldr r1, [r5, #0x4c]
	add r0, #0x28
	mov r2, #0x2e
	bl ov27_0225C8D0
	add r0, r5, #0
	ldr r1, [r5, #0x4c]
	add r0, #0x38
	mov r2, #0x2f
	bl ov27_0225C8D0
	add sp, #0x14
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov27_0225C540

	thumb_func_start ov27_0225C5E4
ov27_0225C5E4: ; 0x0225C5E4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x18]
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x34]
	cmp r0, #0
	beq _0225C606
	add r0, r4, #0
	add r0, #0x28
	bl RemoveWindow
_0225C606:
	ldr r0, [r4, #0x44]
	cmp r0, #0
	beq _0225C614
	add r4, #0x38
	add r0, r4, #0
	bl RemoveWindow
_0225C614:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov27_0225C5E4

	thumb_func_start ov27_0225C618
ov27_0225C618: ; 0x0225C618
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r0, [sp, #0x10]
	ldr r0, [r0, #0xc]
	bl ov01_021EEF58
	add r7, r0, #0
	ldr r0, [sp, #0x10]
	ldr r0, [r0, #0xc]
	bl ov01_021EEF60
	add r6, r0, #0
	mov r0, #0xef
	mov r1, #8
	bl NARC_ctor
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #8
	str r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	mov r1, #1
	ldr r2, [r2, #0x18]
	mov r3, #4
	add r4, r0, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #8
	str r0, [sp, #0xc]
	ldr r2, [sp, #0x10]
	add r0, r4, #0
	ldr r2, [r2, #0x18]
	add r1, r6, #0
	mov r3, #4
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add r0, r4, #0
	bl NARC_dtor
	mov r0, #0
	str r0, [sp, #0x14]
	cmp r6, #0
	ble _0225C6A6
	add r4, r0, #0
	ldr r5, [sp, #0x10]
	sub r0, r6, #2
	lsl r0, r0, #2
	add r5, #0x54
	str r0, [sp, #0x18]
_0225C686:
	ldr r3, _0225C6F0 ; =ov27_0225D4B8
	ldr r2, [sp, #0x18]
	ldr r0, [sp, #0x10]
	ldr r2, [r3, r2]
	ldr r0, [r0, #0x18]
	add r1, r5, #0
	add r2, r2, r4
	bl AddWindow
	ldr r0, [sp, #0x14]
	add r4, #8
	add r0, r0, #1
	add r5, #0x10
	str r0, [sp, #0x14]
	cmp r0, r6
	blt _0225C686
_0225C6A6:
	mov r5, #0
	cmp r6, #0
	ble _0225C6E4
	ldr r4, [sp, #0x10]
	add r4, #0x54
_0225C6B0:
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225C6F4 ; =0x00020100
	mov r1, #4
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r2, [r7]
	add r0, r4, #0
	mov r3, #0
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add r5, r5, #1
	add r4, #0x10
	add r7, #8
	cmp r5, r6
	blt _0225C6B0
_0225C6E4:
	mov r1, #0x85
	ldr r0, [sp, #0x10]
	lsl r1, r1, #2
	str r6, [r0, r1]
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0225C6F0: .word ov27_0225D4B8
_0225C6F4: .word 0x00020100
	thumb_func_end ov27_0225C618

	thumb_func_start ov27_0225C6F8
ov27_0225C6F8: ; 0x0225C6F8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	bl ov01_021EEF60
	add r6, r0, #0
	ldr r0, [r5, #0x18]
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x18]
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	mov r4, #0
	cmp r6, #0
	ble _0225C72A
	add r5, #0x54
_0225C71C:
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, r6
	blt _0225C71C
_0225C72A:
	pop {r4, r5, r6, pc}
	thumb_func_end ov27_0225C6F8

	thumb_func_start ov27_0225C72C
ov27_0225C72C: ; 0x0225C72C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	mov r1, #0x87
	add r6, r0, #0
	lsl r1, r1, #2
	mov r0, #0x15
	add r1, r6, r1
	mov r2, #8
	bl G2dRenderer_Init
	mov r1, #0x86
	lsl r1, r1, #2
	str r0, [r6, r1]
	add r0, r1, #4
	mov r2, #1
	add r0, r6, r0
	mov r1, #0
	lsl r2, r2, #0x14
	bl G2dRenderer_SetSubSurfaceCoords
	mov r7, #0xd1
	mov r4, #0
	add r5, r6, #0
	lsl r7, r7, #2
_0225C75C:
	mov r0, #0xa
	add r1, r4, #0
	mov r2, #8
	bl Create2DGfxResObjMan
	str r0, [r5, r7]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0225C75C
	mov r0, #0xa
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #8
	str r0, [sp, #8]
	mov r0, #0xd1
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r1, #0xef
	mov r2, #0xc
	mov r3, #0
	bl AddCharResObjFromNarc
	mov r1, #0xd5
	lsl r1, r1, #2
	str r0, [r6, r1]
	mov r0, #0xa
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #8
	sub r1, #0xc
	str r0, [sp, #0xc]
	ldr r0, [r6, r1]
	mov r1, #0xef
	mov r2, #0xb
	mov r3, #0
	bl AddPlttResObjFromNarc
	mov r1, #0xd6
	lsl r1, r1, #2
	str r0, [r6, r1]
	mov r0, #0xa
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #8
	sub r1, #0xc
	str r0, [sp, #8]
	ldr r0, [r6, r1]
	mov r1, #0xef
	mov r2, #0xd
	mov r3, #0
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0xd7
	lsl r1, r1, #2
	str r0, [r6, r1]
	mov r0, #0xa
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #8
	sub r1, #0xc
	str r0, [sp, #8]
	ldr r0, [r6, r1]
	mov r1, #0xef
	mov r2, #0xe
	mov r3, #0
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x36
	lsl r1, r1, #4
	str r0, [r6, r1]
	sub r1, #0xc
	ldr r0, [r6, r1]
	bl sub_0200ADA4
	mov r0, #0xd6
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl sub_0200B00C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov27_0225C72C

	thumb_func_start ov27_0225C80C
ov27_0225C80C: ; 0x0225C80C
	push {r4, r5, lr}
	sub sp, #0x5c
	add r4, r1, #0
	mov r1, #0xa
	add r5, r0, #0
	add r0, r1, #0
	str r1, [sp]
	sub r0, #0xb
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	mov r0, #0xd1
	str r2, [sp, #0x10]
	lsl r0, r0, #2
	ldr r3, [r5, r0]
	str r3, [sp, #0x14]
	add r3, r0, #4
	ldr r3, [r5, r3]
	str r3, [sp, #0x18]
	add r3, r0, #0
	add r3, #8
	ldr r3, [r5, r3]
	str r3, [sp, #0x1c]
	add r3, r0, #0
	add r3, #0xc
	ldr r3, [r5, r3]
	add r0, #0x20
	str r3, [sp, #0x20]
	str r2, [sp, #0x24]
	str r2, [sp, #0x28]
	add r0, r5, r0
	add r2, r1, #0
	add r3, r1, #0
	bl CreateSpriteResourcesHeader
	mov r0, #0x86
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, _0225C8C8 ; =ov27_0225D118
	lsl r2, r4, #2
	ldrh r1, [r1, r2]
	str r0, [sp, #0x2c]
	mov r0, #0xd9
	lsl r1, r1, #0xc
	str r1, [sp, #0x34]
	ldr r1, _0225C8CC ; =ov27_0225D11A
	lsl r0, r0, #2
	ldrh r2, [r1, r2]
	mov r1, #1
	lsl r1, r1, #8
	add r2, r2, r1
	lsl r1, r1, #4
	add r0, r5, r0
	str r0, [sp, #0x30]
	mov r0, #0
	lsl r2, r2, #0xc
	str r0, [sp, #0x3c]
	str r2, [sp, #0x38]
	str r1, [sp, #0x40]
	str r1, [sp, #0x44]
	str r1, [sp, #0x48]
	add r1, sp, #0x2c
	strh r0, [r1, #0x20]
	mov r0, #1
	str r0, [sp, #0x50]
	mov r0, #2
	str r0, [sp, #0x54]
	mov r0, #8
	str r0, [sp, #0x58]
	add r0, sp, #0x2c
	bl CreateSprite
	mov r1, #0xe2
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add sp, #0x5c
	pop {r4, r5, pc}
	.balign 4, 0
_0225C8C8: .word ov27_0225D118
_0225C8CC: .word ov27_0225D11A
	thumb_func_end ov27_0225C80C

	thumb_func_start ov27_0225C8D0
ov27_0225C8D0: ; 0x0225C8D0
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225C910 ; =0x00020100
	mov r1, #4
	str r0, [sp, #8]
	add r0, r5, #0
	add r2, r4, #0
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	bl String_dtor
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0225C910: .word 0x00020100
	thumb_func_end ov27_0225C8D0

	thumb_func_start ov27_0225C914
ov27_0225C914: ; 0x0225C914
	push {r4, lr}
	add r4, r0, #0
	mov r0, #8
	bl ScrStrBufs_new
	str r0, [r4, #0x50]
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xbf
	mov r3, #8
	bl NewMsgDataFromNarc
	str r0, [r4, #0x4c]
	pop {r4, pc}
	thumb_func_end ov27_0225C914

	thumb_func_start ov27_0225C930
ov27_0225C930: ; 0x0225C930
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x4c]
	bl DestroyMsgData
	ldr r0, [r4, #0x50]
	bl ScrStrBufs_delete
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov27_0225C930

	thumb_func_start ov27_0225C944
ov27_0225C944: ; 0x0225C944
	mov r1, #1
	str r1, [r0]
	mov r0, #0
	bx lr
	thumb_func_end ov27_0225C944

	thumb_func_start ov27_0225C94C
ov27_0225C94C: ; 0x0225C94C
	push {r4, lr}
	mov r1, #0xe5
	add r4, r0, #0
	mov r2, #0
	lsl r1, r1, #2
	str r2, [r4, r1]
	bl ov27_0225C540
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r1, #0xe5
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, r4, #0
	bl ov27_0225CCE0
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	mov r0, #4
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov27_0225C94C

	thumb_func_start ov27_0225C988
ov27_0225C988: ; 0x0225C988
	push {r3, lr}
	bl ov27_0225CD94
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov27_0225C988

	thumb_func_start ov27_0225C994
ov27_0225C994: ; 0x0225C994
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02024B68
	cmp r0, #0
	bne _0225C9C6
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	bl ov27_0225C5E4
	mov r0, #0xe5
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	ldr r0, [r4, #4]
	strh r1, [r0]
	mov r0, #6
	str r0, [r4]
_0225C9C6:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov27_0225C994

	thumb_func_start ov27_0225C9CC
ov27_0225C9CC: ; 0x0225C9CC
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #1
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov27_0225C9CC

	thumb_func_start ov27_0225C9E4
ov27_0225C9E4: ; 0x0225C9E4
	ldr r1, [r0, #0x10]
	add r1, r1, #1
	str r1, [r0, #0x10]
	cmp r1, #0x14
	ble _0225C9F2
	mov r0, #1
	bx lr
_0225C9F2:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov27_0225C9E4

	thumb_func_start ov27_0225C9F8
ov27_0225C9F8: ; 0x0225C9F8
	ldr r0, _0225CA0C ; =gSystem + 0x40
	ldrh r0, [r0, #0x26]
	cmp r0, #0
	beq _0225CA06
	ldr r0, _0225CA10 ; =gSystem
	mov r1, #1
	str r1, [r0, #0x5c]
_0225CA06:
	mov r0, #0
	bx lr
	nop
_0225CA0C: .word gSystem + 0x40
_0225CA10: .word gSystem
	thumb_func_end ov27_0225C9F8

	thumb_func_start ov27_0225CA14
ov27_0225CA14: ; 0x0225CA14
	push {r4, lr}
	add r4, r0, #0
	mov r1, #8
	str r1, [r4]
	mov r1, #0xe5
	mov r2, #0
	lsl r1, r1, #2
	str r2, [r4, r1]
	bl ov27_0225C618
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r1, #0x85
	mov r2, #0xe5
	lsl r1, r1, #2
	lsl r2, r2, #2
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	add r0, r4, #0
	bl ov27_0225CD18
	mov r1, #0xe7
	lsl r1, r1, #2
	ldr r2, [r4, r1]
	cmp r2, #0
	beq _0225CA5A
	add r0, r1, #4
	sub r1, #8
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	blx r2
_0225CA5A:
	ldr r1, _0225CA64 ; =0x0000EEEE
	ldr r0, [r4, #4]
	strh r1, [r0]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0225CA64: .word 0x0000EEEE
	thumb_func_end ov27_0225CA14

	thumb_func_start ov27_0225CA68
ov27_0225CA68: ; 0x0225CA68
	push {r3, r4}
	sub r1, r1, #2
	lsl r4, r1, #2
	ldr r1, _0225CA94 ; =ov27_0225D480
	ldr r3, [r0]
	ldr r4, [r1, r4]
	lsl r1, r3, #2
	add r1, r4, r1
	ldrsb r2, [r2, r1]
	mov r1, #0
	mvn r1, r1
	cmp r2, r1
	beq _0225CA86
	cmp r3, r2
	bne _0225CA8C
_0225CA86:
	mov r0, #0
	pop {r3, r4}
	bx lr
_0225CA8C:
	str r2, [r0]
	mov r0, #1
	pop {r3, r4}
	bx lr
	.balign 4, 0
_0225CA94: .word ov27_0225D480
	thumb_func_end ov27_0225CA68

	thumb_func_start ov27_0225CA98
ov27_0225CA98: ; 0x0225CA98
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x85
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	sub r0, r0, #2
	lsl r1, r0, #2
	ldr r0, _0225CC84 ; =ov27_0225D49C
	ldr r0, [r0, r1]
	bl sub_02025224
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0225CAF6
	mov r2, #0xe5
	lsl r2, r2, #2
	str r0, [r4, r2]
	mov r1, #0x85
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	add r0, r4, #0
	bl ov27_0225CD18
	ldr r0, _0225CC88 ; =0x000005DC
	bl PlaySE
	mov r0, #9
	mov r1, #0x85
	str r0, [r4]
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, r4, #0
	bl ov27_0225CD74
	mov r1, #0xe7
	lsl r1, r1, #2
	ldr r2, [r4, r1]
	cmp r2, #0
	beq _0225CB60
	add r0, r1, #4
	sub r1, #8
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	blx r2
	b _0225CC80
_0225CAF6:
	ldr r0, _0225CC8C ; =gSystem
	mov r1, #0x40
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _0225CB44
	mov r1, #0x85
	mov r0, #0xe5
	lsl r1, r1, #2
	lsl r0, r0, #2
	ldr r1, [r4, r1]
	add r0, r4, r0
	mov r2, #0
	bl ov27_0225CA68
	cmp r0, #0
	beq _0225CB60
	mov r1, #0x85
	mov r2, #0xe5
	lsl r1, r1, #2
	lsl r2, r2, #2
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	add r0, r4, #0
	bl ov27_0225CD18
	ldr r0, _0225CC88 ; =0x000005DC
	bl PlaySE
	mov r1, #0xe7
	lsl r1, r1, #2
	ldr r2, [r4, r1]
	cmp r2, #0
	beq _0225CB60
	add r0, r1, #4
	sub r1, #8
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	blx r2
	b _0225CC80
_0225CB44:
	mov r1, #0x80
	tst r1, r0
	beq _0225CB90
	mov r1, #0x85
	mov r0, #0xe5
	lsl r1, r1, #2
	lsl r0, r0, #2
	ldr r1, [r4, r1]
	add r0, r4, r0
	mov r2, #1
	bl ov27_0225CA68
	cmp r0, #0
	bne _0225CB62
_0225CB60:
	b _0225CC80
_0225CB62:
	mov r1, #0x85
	mov r2, #0xe5
	lsl r1, r1, #2
	lsl r2, r2, #2
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	add r0, r4, #0
	bl ov27_0225CD18
	ldr r0, _0225CC88 ; =0x000005DC
	bl PlaySE
	mov r1, #0xe7
	lsl r1, r1, #2
	ldr r2, [r4, r1]
	cmp r2, #0
	beq _0225CC80
	add r0, r1, #4
	sub r1, #8
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	blx r2
	b _0225CC80
_0225CB90:
	mov r1, #0x20
	tst r1, r0
	beq _0225CBDA
	mov r1, #0x85
	mov r0, #0xe5
	lsl r1, r1, #2
	lsl r0, r0, #2
	ldr r1, [r4, r1]
	add r0, r4, r0
	mov r2, #2
	bl ov27_0225CA68
	cmp r0, #0
	beq _0225CC80
	mov r1, #0x85
	mov r2, #0xe5
	lsl r1, r1, #2
	lsl r2, r2, #2
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	add r0, r4, #0
	bl ov27_0225CD18
	ldr r0, _0225CC88 ; =0x000005DC
	bl PlaySE
	mov r1, #0xe7
	lsl r1, r1, #2
	ldr r2, [r4, r1]
	cmp r2, #0
	beq _0225CC80
	add r0, r1, #4
	sub r1, #8
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	blx r2
	b _0225CC80
_0225CBDA:
	mov r1, #0x10
	tst r1, r0
	beq _0225CC24
	mov r1, #0x85
	mov r0, #0xe5
	lsl r1, r1, #2
	lsl r0, r0, #2
	ldr r1, [r4, r1]
	add r0, r4, r0
	mov r2, #3
	bl ov27_0225CA68
	cmp r0, #0
	beq _0225CC80
	mov r1, #0x85
	mov r2, #0xe5
	lsl r1, r1, #2
	lsl r2, r2, #2
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	add r0, r4, #0
	bl ov27_0225CD18
	ldr r0, _0225CC88 ; =0x000005DC
	bl PlaySE
	mov r1, #0xe7
	lsl r1, r1, #2
	ldr r2, [r4, r1]
	cmp r2, #0
	beq _0225CC80
	add r0, r1, #4
	sub r1, #8
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	blx r2
	b _0225CC80
_0225CC24:
	mov r1, #1
	tst r1, r0
	beq _0225CC42
	mov r1, #0x85
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, r4, #0
	bl ov27_0225CD74
	mov r0, #9
	str r0, [r4]
	ldr r0, _0225CC88 ; =0x000005DC
	bl PlaySE
	b _0225CC80
_0225CC42:
	mov r1, #2
	tst r0, r1
	beq _0225CC80
	ldr r0, [r4, #0xc]
	bl ov01_021EF00C
	cmp r0, #0
	beq _0225CC80
	mov r1, #0x85
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	mov r2, #0xe5
	sub r0, r0, #1
	lsl r2, r2, #2
	str r0, [r4, r2]
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	add r0, r4, #0
	bl ov27_0225CD18
	mov r1, #0x85
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, r4, #0
	bl ov27_0225CD74
	mov r0, #9
	str r0, [r4]
	ldr r0, _0225CC88 ; =0x000005DC
	bl PlaySE
_0225CC80:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0225CC84: .word ov27_0225D49C
_0225CC88: .word 0x000005DC
_0225CC8C: .word gSystem
	thumb_func_end ov27_0225CA98

	thumb_func_start ov27_0225CC90
ov27_0225CC90: ; 0x0225CC90
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02024B68
	cmp r0, #0
	bne _0225CCB8
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	bl ov27_0225C6F8
	mov r0, #0xa
	str r0, [r4]
_0225CCB8:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov27_0225CC90

	thumb_func_start ov27_0225CCBC
ov27_0225CCBC: ; 0x0225CCBC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl ov01_021EEF58
	mov r1, #0xe5
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	lsl r1, r1, #3
	add r0, r0, r1
	ldr r1, [r0, #4]
	ldr r0, [r4, #4]
	strh r1, [r0]
	mov r0, #1
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov27_0225CCBC

	thumb_func_start ov27_0225CCE0
ov27_0225CCE0: ; 0x0225CCE0
	push {lr}
	sub sp, #0xc
	lsl r2, r1, #2
	ldr r1, _0225CD10 ; =ov27_0225D118
	ldrh r1, [r1, r2]
	lsl r1, r1, #0xc
	str r1, [sp]
	ldr r1, _0225CD14 ; =ov27_0225D11A
	ldrh r2, [r1, r2]
	mov r1, #1
	lsl r1, r1, #8
	add r1, r2, r1
	lsl r1, r1, #0xc
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	mov r1, #0xe2
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	add r1, sp, #0
	bl sub_020247D4
	add sp, #0xc
	pop {pc}
	.balign 4, 0
_0225CD10: .word ov27_0225D118
_0225CD14: .word ov27_0225D11A
	thumb_func_end ov27_0225CCE0

	thumb_func_start ov27_0225CD18
ov27_0225CD18: ; 0x0225CD18
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	lsl r0, r2, #1
	sub r3, r1, #2
	add r2, r2, r0
	add r1, r3, #0
	mov r0, #0x18
	mul r1, r0
	ldr r3, _0225CD68 ; =ov27_0225D3C4
	add r0, #0xe8
	add r3, r3, r1
	ldrb r3, [r2, r3]
	lsl r3, r3, #0xc
	str r3, [sp]
	ldr r3, _0225CD6C ; =ov27_0225D3C5
	add r3, r3, r1
	ldrb r3, [r2, r3]
	add r0, r3, r0
	lsl r0, r0, #0xc
	ldr r3, _0225CD70 ; =ov27_0225D3C6
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #0xe2
	add r1, r3, r1
	lsl r0, r0, #2
	ldrb r1, [r2, r1]
	ldr r0, [r4, r0]
	bl Set2dSpriteAnimSeqNo
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0
	bl sub_020247D4
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0225CD68: .word ov27_0225D3C4
_0225CD6C: .word ov27_0225D3C5
_0225CD70: .word ov27_0225D3C6
	thumb_func_end ov27_0225CD18

	thumb_func_start ov27_0225CD74
ov27_0225CD74: ; 0x0225CD74
	mov r2, #0xe2
	lsl r2, r2, #2
	ldr r0, [r0, r2]
	sub r2, r1, #2
	mov r1, #0x18
	add r3, r2, #0
	mul r3, r1
	ldr r1, _0225CD8C ; =ov27_0225D3C6
	ldrb r1, [r1, r3]
	ldr r3, _0225CD90 ; =sub_020248F0
	add r1, r1, #2
	bx r3
	.balign 4, 0
_0225CD8C: .word ov27_0225D3C6
_0225CD90: .word Set2dSpriteAnimSeqNo
	thumb_func_end ov27_0225CD74

	thumb_func_start ov27_0225CD94
ov27_0225CD94: ; 0x0225CD94
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0225CEA0 ; =ov27_0225D120
	bl sub_02025224
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0225CDFE
	cmp r0, #0
	bne _0225CDD2
	mov r1, #0xe5
	mov r0, #0
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r1, [r4, r1]
	add r0, r4, #0
	bl ov27_0225CCE0
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #3
	bl Set2dSpriteAnimSeqNo
	ldr r0, _0225CEA4 ; =0x000005DC
	bl PlaySE
	mov r0, #5
	str r0, [r4]
	b _0225CE9C
_0225CDD2:
	cmp r0, #1
	bne _0225CE9C
	mov r1, #0xe5
	mov r0, #1
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r1, [r4, r1]
	add r0, r4, #0
	bl ov27_0225CCE0
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #3
	bl Set2dSpriteAnimSeqNo
	ldr r0, _0225CEA4 ; =0x000005DC
	bl PlaySE
	mov r0, #5
	str r0, [r4]
	b _0225CE9C
_0225CDFE:
	ldr r0, _0225CEA8 ; =gSystem
	mov r1, #0x40
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _0225CE2A
	mov r0, #0xe5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _0225CE18
	ldr r0, _0225CEA4 ; =0x000005DC
	bl PlaySE
_0225CE18:
	mov r1, #0xe5
	mov r0, #0
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r1, [r4, r1]
	add r0, r4, #0
	bl ov27_0225CCE0
	b _0225CE9C
_0225CE2A:
	mov r1, #0x80
	tst r1, r0
	beq _0225CE52
	mov r0, #0xe5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0225CE40
	ldr r0, _0225CEA4 ; =0x000005DC
	bl PlaySE
_0225CE40:
	mov r1, #0xe5
	mov r0, #1
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r1, [r4, r1]
	add r0, r4, #0
	bl ov27_0225CCE0
	b _0225CE9C
_0225CE52:
	mov r2, #1
	add r1, r0, #0
	tst r1, r2
	beq _0225CE72
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #3
	bl Set2dSpriteAnimSeqNo
	mov r0, #5
	str r0, [r4]
	ldr r0, _0225CEA4 ; =0x000005DC
	bl PlaySE
	b _0225CE9C
_0225CE72:
	mov r1, #2
	tst r0, r1
	beq _0225CE9C
	mov r1, #0xe5
	lsl r1, r1, #2
	str r2, [r4, r1]
	ldr r1, [r4, r1]
	add r0, r4, #0
	bl ov27_0225CCE0
	mov r0, #0xe2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #3
	bl Set2dSpriteAnimSeqNo
	ldr r0, _0225CEA4 ; =0x000005DC
	bl PlaySE
	mov r0, #5
	str r0, [r4]
_0225CE9C:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0225CEA0: .word ov27_0225D120
_0225CEA4: .word 0x000005DC
_0225CEA8: .word gSystem
	thumb_func_end ov27_0225CD94

	thumb_func_start ov27_0225CEAC
ov27_0225CEAC: ; 0x0225CEAC
	push {r4, lr}
	add r4, r0, #0
	bl ov27_0225C5E4
	add r0, r4, #0
	bl ov27_0225C9CC
	pop {r4, pc}
	thumb_func_end ov27_0225CEAC

	.rodata

_0225CEBC:
	.byte 0x07, 0x04, 0x02, 0x05
	.byte 0x00, 0x00, 0x00, 0x00

ov27_0225CEC4: ; 0x0225CEC4
	.byte 0x0F, 0x07, 0x0E, 0x00, 0x03, 0x04, 0x05, 0x00

ov27_0225CECC: ; 0x0225CECC
	.byte 0x56, 0x86, 0xB8, 0xFC
	.byte 0x90, 0xBC, 0xA8, 0xFF, 0xFF, 0x00, 0x00, 0x00

ov27_0225CED8: ; 0x0225CED8
	.word 0x00000011
	.word 0x00000012
	.word 0x00000013
	.word 0x00000016
	.word 0x00000017

ov27_0225CEEC: ; 0x0225CEEC
	.byte 0x07, 0x00, 0x00, 0x00

ov27_0225CEF0: ; 0x0225CEF0
	.byte 0x08, 0x00, 0x00, 0x00

ov27_0225CEF4: ; 0x0225CEF4
	.byte 0x09, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00

ov27_0225CF10: ; 0x0225CF10
	.byte 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x04, 0x00, 0x01, 0x00, 0x02, 0x00, 0x04, 0x00
	.byte 0x02, 0x00, 0x03, 0x00, 0x04, 0x00, 0x03, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x05, 0x00
	.byte 0x04, 0x00, 0x05, 0x00, 0x06, 0x00, 0x04, 0x00, 0x06, 0x00, 0x00, 0x00

ov27_0225CF3C: ; 0x0225CF3C
	.word 0x00000064
	.word 0x00000064
	.word 0x00000064
	.word 0x00000064
	.word 0x00000064
	.word 0x00000064
	.word 0x00000064
	.word 0x00000066
	.word 0x00000066
	.word 0x00000065
	.word 0x00000064

ov27_0225CF68: ; 0x0225CF68
	.byte 0x00, 0x10, 0x08, 0xA0, 0x16, 0x36, 0x10, 0x4C
	.byte 0x3E, 0x5E, 0x10, 0x4C, 0x66, 0x86, 0x10, 0x4C, 0x8E, 0xAE, 0x10, 0x4C, 0x16, 0x36, 0x60, 0x9C
	.byte 0x3E, 0x5E, 0x60, 0x9C, 0x66, 0x86, 0x60, 0x9C, 0x08, 0x27, 0xCB, 0xFF, 0x2E, 0x4D, 0xCB, 0xFF
	.byte 0xFF, 0x00, 0x00, 0x00

ov27_0225CF94: ; 0x0225CF94
	.short 0x0012, 0x0000 | 0x8000
	.short 0x0015, 0x0001 | 0x8000
	.short 0x0018, 0x0002 | 0x8000
	.short 0x001E, 0x000E | 0x8000
	.short 0x0021, 0x0003 | 0x8000
	.short 0x0024, 0x0004 | 0x8000
	.short 0x0027, 0x0005 | 0x8000
	.short 0x002A, 0x0008 | 0x8000
	.short 0x0012, 0x0020 | 0x0000
	.short 0x0012, 0x0020 | 0x0000
	.short 0xFFFF, 0x0020 | 0x0000
	.short 0x002D, 0x0022 | 0x8000
	.short 0x0030, 0x0023 | 0x8000

ov27_0225CFC8: ; 0x0225CFC8
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x0D
	.byte 0x07, 0x00, 0x01, 0x02, 0x03, 0x04, 0x06, 0x08
	.byte 0x07, 0x00, 0x01, 0x03, 0x04, 0x06, 0x0A, 0x0D
	.byte 0x07, 0x00, 0x01, 0x03, 0x04, 0x06, 0x09, 0x0D
	.byte 0x0B, 0x00, 0x01, 0x02, 0x0C, 0x04, 0x06, 0x0D
	.byte 0x01, 0x02, 0x04, 0x06, 0x0D, 0x0D, 0x0D, 0x0D
	.byte 0x01, 0x04, 0x06, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D

ov27_0225D000: ; 0x0225D000
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0D, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov27_0225D01C: ; 0x0225D01C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0E, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov27_0225D038: ; 0x0225D038
	.byte 0x18, 0x00, 0x16, 0x00, 0x18, 0x00, 0x3E, 0x00
	.byte 0x18, 0x00, 0x66, 0x00, 0x18, 0x00, 0x8E, 0x00, 0x68, 0x00, 0x16, 0x00, 0x68, 0x00, 0x3E, 0x00
	.byte 0x68, 0x00, 0x66, 0x00, 0xDC, 0x00, 0x0B, 0x00, 0xDC, 0x00, 0x33, 0x00

ov27_0225D05C: ; 0x0225D05C
	.byte 0xC8, 0x00, 0x08, 0x00
	.byte 0xC8, 0x00, 0x30, 0x00, 0xB8, 0x00, 0x56, 0x00, 0xA8, 0x00, 0x90, 0x00, 0xD2, 0x00, 0x5E, 0x00
	.byte 0x36, 0x00, 0x00, 0x00

ov27_0225D074: ; 0x0225D074
	.byte 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x15, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x15, 0x00, 0x00, 0x00

ov27_0225D0B4: ; 0x0225D0B4
	.byte 0x03, 0x02, 0x01, 0x01, 0x02, 0x03, 0x04, 0x00, 0x00, 0x04, 0x00, 0x00
	.byte 0x00, 0x03, 0x02, 0x02, 0x03, 0x00, 0x05, 0x01, 0x00, 0x05, 0x01, 0x00, 0x01, 0x00, 0x03, 0x03
	.byte 0x00, 0x01, 0x06, 0x02, 0x00, 0x06, 0x02, 0x00, 0x02, 0x01, 0x00, 0x00, 0x01, 0x02, 0x06, 0x03
	.byte 0x00, 0x06, 0x03, 0x00, 0x06, 0x05, 0x04, 0x05, 0x06, 0x04, 0x00, 0x04, 0x00, 0x00, 0x04, 0x00
	.byte 0x04, 0x06, 0x05, 0x06, 0x04, 0x05, 0x01, 0x05, 0x00, 0x01, 0x05, 0x00, 0x05, 0x04, 0x06, 0x04
	.byte 0x05, 0x06, 0x02, 0x06, 0x00, 0x02, 0x06, 0x00

ov27_0225D108: ; 0x0225D108
	.byte 0x01, 0x00, 0x01, 0x03, 0x04, 0x00, 0x00, 0x00

ov27_0225D110:
	.byte 0x00, 0x01, 0xFF, 0xFF, 0x00, 0x01, 0xFF, 0xFF

ov27_0225D118: ; 0x0225D118
	.byte 0x80, 0x00

ov27_0225D11A: ; 0x0225D11A
	.byte 0x48, 0x00, 0x80, 0x00, 0x78, 0x00

ov27_0225D120: ; 0x0225D120
	.byte 0x32, 0x5C, 0x03, 0xFB, 0x63, 0x8C, 0x03, 0xFB, 0xFF, 0x00, 0x00, 0x00

ov27_0225D12C:
	.byte 0x32, 0x5C, 0x03, 0xFB
	.byte 0x63, 0x8C, 0x03, 0xFB, 0xFF, 0x00, 0x00, 0x00

ov27_0225D138:
	.byte 0x00, 0x01, 0xFF, 0xFF, 0x00, 0x02, 0xFF, 0xFF
	.byte 0x01, 0x02, 0xFF, 0xFF

ov27_0225D144:
	.byte 0x00, 0x01, 0xFF, 0xFF, 0x00, 0x02, 0xFF, 0xFF, 0x01, 0x03, 0xFF, 0xFF
	.byte 0x02, 0x03, 0xFF, 0xFF

ov27_0225D154:
	.byte 0x1B, 0x44, 0x03, 0xFB, 0x4A, 0x73, 0x03, 0xFB, 0x7B, 0xA4, 0x03, 0xFB
	.byte 0xFF, 0x00, 0x00, 0x00

ov27_0225D164:
	.byte 0x05, 0x02, 0x08, 0x1C, 0x02, 0x04, 0x80, 0x00, 0x05, 0x02, 0x0E, 0x1C
	.byte 0x02, 0x04, 0xB8, 0x00

ov27_0225D174:
	.byte 0x00, 0x02, 0x00, 0x01, 0x01, 0x03, 0x00, 0x01, 0x00, 0x04, 0x02, 0x03
	.byte 0x01, 0x04, 0x02, 0x03, 0x03, 0x04, 0xFF, 0xFF

ov27_0225D188:
	.byte 0x02, 0x2B, 0x03, 0xFB, 0x34, 0x5C, 0x03, 0xFB
	.byte 0x63, 0x8C, 0x03, 0xFB, 0x94, 0xBC, 0x03, 0xFB, 0xFF, 0x00, 0x00, 0x00

ov27_0225D19C:
	.byte 0x19, 0x44, 0x03, 0x7B
	.byte 0x19, 0x44, 0x83, 0xFC, 0x4B, 0x73, 0x03, 0x7B, 0x4B, 0x73, 0x83, 0xFC, 0x7B, 0xA3, 0x83, 0xFC
	.byte 0xFF, 0x00, 0x00, 0x00

ov27_0225D1B4:
	.byte 0x00, 0x02, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x04, 0x02, 0x03
	.byte 0x01, 0x05, 0x02, 0x03, 0x02, 0x04, 0x04, 0x05, 0x03, 0x05, 0x04, 0x05

ov27_0225D1CC:
	.byte 0x05, 0x02, 0x05, 0x1C
	.byte 0x02, 0x04, 0x80, 0x00, 0x05, 0x02, 0x0B, 0x1C, 0x02, 0x04, 0xB8, 0x00, 0x05, 0x02, 0x11, 0x1C
	.byte 0x02, 0x04, 0xF0, 0x00

ov27_0225D1E4:
	.byte 0x19, 0x44, 0x03, 0x7B, 0x19, 0x44, 0x83, 0xFC, 0x4B, 0x73, 0x03, 0x7B
	.byte 0x4B, 0x73, 0x83, 0xFC, 0x7B, 0xA3, 0x03, 0x7B, 0x7B, 0xA3, 0x83, 0xFC, 0xFF, 0x00, 0x00, 0x00

ov27_0225D200:
	.byte 0x00, 0x02, 0x00, 0x01, 0x01, 0x03, 0x00, 0x01, 0x00, 0x04, 0x02, 0x03, 0x01, 0x05, 0x02, 0x03
	.byte 0x02, 0x06, 0x04, 0x05, 0x03, 0x06, 0x04, 0x05, 0x05, 0x06, 0xFF, 0xFF

ov27_0225D21C:
	.byte 0x03, 0x2C, 0x03, 0x7B
	.byte 0x03, 0x2C, 0x83, 0xFC, 0x33, 0x5B, 0x03, 0x7B, 0x33, 0x5B, 0x83, 0xFC, 0x64, 0x8B, 0x03, 0x7B
	.byte 0x64, 0x8B, 0x83, 0xFC, 0x93, 0xBC, 0x83, 0xFC, 0xFF, 0x00, 0x00, 0x00

ov27_0225D23C:
	.byte 0x05, 0x02, 0x02, 0x1C
	.byte 0x02, 0x04, 0x80, 0x00, 0x05, 0x02, 0x08, 0x1C, 0x02, 0x04, 0xB8, 0x00, 0x05, 0x02, 0x0E, 0x1C
	.byte 0x02, 0x04, 0xF0, 0x00, 0x05, 0x02, 0x14, 0x1C, 0x02, 0x04, 0x28, 0x01

ov27_0225D25C:
	.byte 0x00, 0x02, 0x00, 0x01
	.byte 0x00, 0x03, 0x00, 0x01, 0x00, 0x04, 0x02, 0x03, 0x01, 0x05, 0x02, 0x03, 0x02, 0x06, 0x04, 0x05
	.byte 0x03, 0x07, 0x04, 0x05, 0x04, 0x06, 0x06, 0x07, 0x05, 0x07, 0x06, 0x07

ov27_0225D27C:
	.byte 0x03, 0x2C, 0x03, 0x7B
	.byte 0x03, 0x2C, 0x83, 0xFC, 0x33, 0x5B, 0x03, 0x7B, 0x33, 0x5B, 0x83, 0xFC, 0x64, 0x8B, 0x03, 0x7B
	.byte 0x64, 0x8B, 0x83, 0xFC, 0x93, 0xBC, 0x03, 0x7B, 0x93, 0xBC, 0x83, 0xFC, 0xFF, 0x00, 0x00, 0x00

ov27_0225D2A0:
	.byte 0x05, 0x02, 0x04, 0x0D, 0x04, 0x04, 0x80, 0x00, 0x05, 0x12, 0x04, 0x0D, 0x04, 0x04, 0xB4, 0x00
	.byte 0x05, 0x02, 0x0A, 0x0D, 0x04, 0x04, 0xE8, 0x00, 0x05, 0x12, 0x0A, 0x0D, 0x04, 0x04, 0x1C, 0x01
	.byte 0x05, 0x12, 0x10, 0x0D, 0x04, 0x04, 0x50, 0x01

ov27_0225D2C8:
	.byte 0x05, 0x02, 0x04, 0x0C, 0x04, 0x04, 0x80, 0x00
	.byte 0x05, 0x12, 0x04, 0x0C, 0x04, 0x04, 0xB0, 0x00, 0x05, 0x02, 0x0A, 0x0C, 0x04, 0x04, 0xE0, 0x00
	.byte 0x05, 0x12, 0x0A, 0x0C, 0x04, 0x04, 0x10, 0x01, 0x05, 0x02, 0x10, 0x0C, 0x04, 0x04, 0x40, 0x01
	.byte 0x05, 0x12, 0x10, 0x0C, 0x04, 0x04, 0x70, 0x01

ov27_0225D2F8:
	.byte 0x05, 0x02, 0x01, 0x0C, 0x04, 0x04, 0x80, 0x00
	.byte 0x05, 0x12, 0x01, 0x0C, 0x04, 0x04, 0xB0, 0x00, 0x05, 0x02, 0x07, 0x0C, 0x04, 0x04, 0xE0, 0x00
	.byte 0x05, 0x12, 0x07, 0x0C, 0x04, 0x04, 0x10, 0x01, 0x05, 0x02, 0x0D, 0x0C, 0x04, 0x04, 0x40, 0x01
	.byte 0x05, 0x12, 0x0D, 0x0C, 0x04, 0x04, 0x70, 0x01, 0x05, 0x12, 0x13, 0x0C, 0x04, 0x04, 0xA0, 0x01

ov27_0225D330:
	.byte 0x05, 0x02, 0x01, 0x0C, 0x04, 0x04, 0x80, 0x00, 0x05, 0x12, 0x01, 0x0C, 0x04, 0x04, 0xB0, 0x00
	.byte 0x05, 0x02, 0x07, 0x0C, 0x04, 0x04, 0xE0, 0x00, 0x05, 0x12, 0x07, 0x0C, 0x04, 0x04, 0x10, 0x01
	.byte 0x05, 0x02, 0x0D, 0x0C, 0x04, 0x04, 0x40, 0x01, 0x05, 0x12, 0x0D, 0x0C, 0x04, 0x04, 0x70, 0x01
	.byte 0x05, 0x02, 0x13, 0x0C, 0x04, 0x04, 0xA0, 0x01, 0x05, 0x12, 0x13, 0x0C, 0x04, 0x04, 0xD0, 0x01

ov27_0225D370: ; 0x0225D370
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0D, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov27_0225D38C: ; 0x0225D38C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0E, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov27_0225D3A8: ; 0x0225D3A8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0C, 0x01, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov27_0225D3C4: ; 0x0225D3C4
	.byte 0x80

ov27_0225D3C5: ; 0x0225D3C5
	.byte 0x48

ov27_0225D3C6: ; 0x0225D3C6
	.byte 0x01, 0x80, 0x78, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x30, 0x01, 0x80
	.byte 0x60, 0x01, 0x80, 0x90, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x18, 0x01, 0x80, 0x48, 0x01, 0x80, 0x78, 0x01, 0x80, 0xA8, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x30, 0x00, 0xC0
	.byte 0x30, 0x00, 0x40, 0x60, 0x00, 0xC0, 0x60, 0x00, 0xC0, 0x90, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x40, 0x30, 0x00, 0xC0, 0x30, 0x00, 0x40, 0x60, 0x00, 0xC0, 0x60, 0x00
	.byte 0x40, 0x90, 0x00, 0xC0, 0x90, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x18, 0x00, 0xC0
	.byte 0x18, 0x00, 0x40, 0x48, 0x00, 0xC0, 0x48, 0x00, 0x40, 0x78, 0x00, 0xC0, 0x78, 0x00, 0xC0, 0xA8
	.byte 0x00, 0x00, 0x00, 0x00, 0x40, 0x18, 0x00, 0xC0, 0x18, 0x00, 0x40, 0x48, 0x00, 0xC0, 0x48, 0x00
	.byte 0x40, 0x78, 0x00, 0xC0, 0x78, 0x00, 0x40, 0xA8, 0x00, 0xC0, 0xA8, 0x00

	.data

ov27_0225D480:
	.word ov27_0225D110
	.word ov27_0225D138
	.word ov27_0225D144
	.word ov27_0225D174
	.word ov27_0225D1B4
	.word ov27_0225D200
	.word ov27_0225D25C

ov27_0225D49C: ; 0x0225D49C
	.word ov27_0225D12C
	.word ov27_0225D154
	.word ov27_0225D188
	.word ov27_0225D19C
	.word ov27_0225D1E4
	.word ov27_0225D21C
	.word ov27_0225D27C

ov27_0225D4B8: ; 0x0225D4B8
	.word ov27_0225D164
	.word ov27_0225D1CC
	.word ov27_0225D23C
	.word ov27_0225D2A0
	.word ov27_0225D2C8
	.word ov27_0225D2F8
	.word ov27_0225D330

ov27_0225D4D4: ; 0x0225D4D4
	.word ov27_0225C944
	.word ov27_0225C9F8
	.word ov27_0225C9E4
	.word ov27_0225C94C
	.word ov27_0225C988
	.word ov27_0225C994
	.word ov27_0225C9CC
	.word ov27_0225CA14
	.word ov27_0225CA98
	.word ov27_0225CC90
	.word ov27_0225CCBC
	.word ov27_0225CEAC
