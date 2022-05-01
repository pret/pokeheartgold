	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov71_02246960
ov71_02246960: ; 0x02246960
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	bl IsPaletteFadeFinished
	cmp r0, #0
	bne _02246970
	b _02246B0C
_02246970:
	mov r0, #3
	mov r1, #0x38
	lsl r2, r0, #0xf
	bl CreateHeap
	mov r0, #3
	mov r1, #0x39
	lsl r2, r0, #0xf
	bl CreateHeap
	bl ov71_022473E4
	mov r1, #0xfd
	mov r0, #3
	lsl r1, r1, #2
	mov r2, #1
	bl sub_02004EC4
	mov r1, #0x56
	add r0, r5, #0
	lsl r1, r1, #2
	mov r2, #0x38
	bl OverlayManager_CreateAndGetData
	add r4, r0, #0
	bne _022469A6
	b _02246B06
_022469A6:
	add r0, r5, #0
	bl OverlayManager_GetParentWork
	str r0, [r4]
	mov r0, #0
	str r0, [r4, #4]
	mov r0, #0x38
	bl BgConfig_Alloc
	str r0, [r4, #8]
	mov r0, #0x19
	lsl r0, r0, #4
	mov r1, #0x38
	bl String_ctor
	str r0, [r4, #0x14]
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xb3
	mov r3, #0x38
	bl NewMsgDataFromNarc
	str r0, [r4, #0x10]
	mov r0, #0x38
	bl ScrStrBufs_new
	str r0, [r4, #0xc]
	ldr r2, [r4]
	ldr r0, [r2, #0x10]
	cmp r0, #1
	beq _022469EE
	cmp r0, #2
	beq _02246A20
	cmp r0, #4
	beq _02246A2C
	b _02246A44
_022469EE:
	ldr r0, [r4, #0xc]
	ldr r2, [r2]
	mov r1, #0
	bl BufferBoxMonNickname
	ldr r2, [r4]
	ldr r0, [r4, #0xc]
	ldr r2, [r2, #4]
	mov r1, #1
	bl BufferBoxMonNickname
	ldr r2, [r4]
	ldr r0, [r4, #0xc]
	ldr r2, [r2, #8]
	mov r1, #2
	bl BufferPlayersName
	ldr r0, [r4]
	ldr r0, [r0, #4]
	bl ov71_02246B28
	mov r1, #0x52
	lsl r1, r1, #2
	str r0, [r4, r1]
	b _02246A44
_02246A20:
	ldr r0, [r4, #0xc]
	ldr r2, [r2]
	mov r1, #0
	bl BufferBoxMonNickname
	b _02246A44
_02246A2C:
	ldr r0, [r4, #0xc]
	ldr r2, [r2, #4]
	mov r1, #1
	bl BufferBoxMonNickname
	ldr r0, [r4]
	ldr r0, [r0, #4]
	bl ov71_02246B28
	mov r1, #0x52
	lsl r1, r1, #2
	str r0, [r4, r1]
_02246A44:
	bl NNS_G2dInitOamManagerModule
	mov r0, #1
	str r0, [sp]
	mov r0, #0x7f
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r3, #0x20
	str r3, [sp, #0xc]
	mov r1, #0x38
	str r1, [sp, #0x10]
	mov r1, #0x80
	add r2, r0, #0
	bl OamManager_Create
	add r1, r4, #0
	mov r0, #0x40
	add r1, #0x1c
	mov r2, #0x38
	bl G2dRenderer_Init
	str r0, [r4, #0x18]
	add r0, r4, #0
	mov r2, #0x3a
	add r0, #0x1c
	mov r1, #0
	lsl r2, r2, #0xe
	bl G2dRenderer_SetSubSurfaceCoords
	ldr r0, [r4]
	mov r1, #5
	ldr r0, [r0]
	mov r2, #0
	bl GetBoxMonData
	mov r1, #0x53
	lsl r1, r1, #2
	strh r0, [r4, r1]
	ldr r0, [r4]
	mov r1, #5
	ldr r0, [r0, #4]
	mov r2, #0
	bl GetBoxMonData
	mov r1, #0x15
	lsl r1, r1, #4
	strh r0, [r4, r1]
	ldr r0, [r4]
	mov r1, #0x70
	ldr r0, [r0]
	mov r2, #0
	bl GetBoxMonData
	ldr r1, _02246B14 ; =0x0000014E
	mov r2, #0
	strh r0, [r4, r1]
	ldr r0, [r4]
	mov r1, #0x70
	ldr r0, [r0, #4]
	bl GetBoxMonData
	ldr r1, _02246B18 ; =0x00000152
	strh r0, [r4, r1]
	mov r0, #0
	add r1, r1, #2
	str r0, [r4, r1]
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _02246B1C ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _02246B20 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	ldr r0, _02246B24 ; =ov71_02246C48
	add r1, r4, #0
	mov r2, #1
	bl sub_0200E358
	mov r1, #0x51
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0
	add r1, #0x10
	str r0, [r4, r1]
_02246B06:
	add sp, #0x14
	mov r0, #1
	pop {r4, r5, pc}
_02246B0C:
	mov r0, #0
	add sp, #0x14
	pop {r4, r5, pc}
	nop
_02246B14: .word 0x0000014E
_02246B18: .word 0x00000152
_02246B1C: .word 0xFFFFE0FF
_02246B20: .word 0x04001000
_02246B24: .word ov71_02246C48
	thumb_func_end ov71_02246960

	thumb_func_start ov71_02246B28
ov71_02246B28: ; 0x02246B28
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0x70
	mov r2, #0
	bl GetBoxMonData
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #0x1c
	bl GetMonBaseStat_HandleAlternateForme
	cmp r0, #0
	bne _02246B52
	mov r0, #1
	pop {r3, r4, r5, pc}
_02246B52:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov71_02246B28

	thumb_func_start ov71_02246B58
ov71_02246B58: ; 0x02246B58
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl OS_DisableInterrupts
	add r6, r0, #0
	add r0, r5, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl DestroySysTask
	bl sub_0203A914
	ldr r0, [r4, #0xc]
	bl ScrStrBufs_delete
	ldr r0, [r4, #0x10]
	bl DestroyMsgData
	ldr r0, [r4, #0x14]
	bl String_dtor
	ldr r0, [r4, #8]
	bl FreeToHeap
	ldr r0, [r4, #0x18]
	bl sub_02024504
	bl OamManager_Free
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0x38
	bl DestroyHeap
	mov r0, #0x39
	bl DestroyHeap
	add r0, r6, #0
	bl OS_RestoreInterrupts
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov71_02246B58

	thumb_func_start ov71_02246BB8
ov71_02246BB8: ; 0x02246BB8
	push {r4, r5, r6, lr}
	add r5, r1, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	ldr r3, [r4, #4]
	cmp r3, #7
	bhs _02246C34
	ldr r1, [r4]
	ldr r6, _02246C38 ; =ov71_0224BBF8
	lsl r2, r3, #4
	ldr r1, [r1, #0x10]
	ldr r6, [r6, r2]
	tst r1, r6
	beq _02246C24
	mov r1, #0x55
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	cmp r1, #0
	bne _02246BEC
	ldr r1, _02246C3C ; =ov71_0224BBEC
	ldr r1, [r1, r2]
	blx r1
	mov r1, #0x55
	lsl r1, r1, #2
	str r0, [r4, r1]
_02246BEC:
	ldr r2, [r4, #4]
	mov r0, #0x55
	lsl r3, r2, #4
	ldr r2, _02246C40 ; =ov71_0224BBF0
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r2, [r2, r3]
	add r1, r5, #0
	blx r2
	cmp r0, #0
	beq _02246C2C
	ldr r1, [r4, #4]
	mov r0, #0x55
	lsl r2, r1, #4
	ldr r1, _02246C44 ; =ov71_0224BBF4
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [r1, r2]
	blx r1
	mov r0, #0x55
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	str r1, [r5]
	b _02246C2C
_02246C24:
	add r0, r3, #1
	str r0, [r4, #4]
	mov r0, #0
	str r0, [r5]
_02246C2C:
	bl ov71_022473F0
	mov r0, #0
	pop {r4, r5, r6, pc}
_02246C34:
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02246C38: .word ov71_0224BBF8
_02246C3C: .word ov71_0224BBEC
_02246C40: .word ov71_0224BBF0
_02246C44: .word ov71_0224BBF4
	thumb_func_end ov71_02246BB8

	thumb_func_start ov71_02246C48
ov71_02246C48: ; 0x02246C48
	push {r3, lr}
	ldr r0, [r1, #0x18]
	bl sub_0202457C
	bl OamManager_ApplyAndResetBuffers
	ldr r3, _02246C64 ; =0x027E0000
	ldr r1, _02246C68 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r3, pc}
	nop
_02246C64: .word 0x027E0000
_02246C68: .word 0x00003FF8
	thumb_func_end ov71_02246C48

	thumb_func_start ov71_02246C6C
ov71_02246C6C: ; 0x02246C6C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0x38
	add r6, r1, #0
	add r1, r0, #0
	add r1, #0xc8
	bl AllocFromHeap
	add r4, r0, #0
	ldr r0, _02246D30 ; =0x00000000
	str r0, [r5]
	beq _02246D28
	mov r0, #0x59
	mov r1, #6
	add r2, sp, #4
	mov r3, #0x38
	bl GfGfxLoader_GetPlttData
	add r7, r0, #0
	beq _02246CA6
	mov r0, #0
	add r1, r4, #0
	mov r2, #0x60
	bl MIi_CpuClear16
	add r0, r7, #0
	bl FreeToHeap
_02246CA6:
	add r1, r4, #0
	mov r0, #0
	add r1, #0xec
	str r0, [r1]
	add r1, r4, #0
	add r1, #0xe8
	str r0, [r1]
	add r1, r4, #0
	add r1, #0xf0
	str r0, [r1]
	add r1, r4, #0
	add r1, #0xf4
	str r0, [r1]
	add r1, r4, #0
	add r1, #0xe4
	str r5, [r1]
	add r1, r4, #0
	add r1, #0xf8
	str r0, [r1]
	add r1, r4, #0
	add r1, #0xfc
	str r6, [r1]
	add r3, r4, #0
	add r2, r0, #0
_02246CD6:
	add r1, r3, #0
	add r1, #0xc4
	add r0, r0, #1
	add r3, r3, #4
	str r2, [r1]
	cmp r0, #8
	blt _02246CD6
	mov r0, #8
	str r0, [sp]
	ldr r0, _02246D34 ; =0x04000050
	mov r1, #4
	mov r2, #0xc
	mov r3, #0x10
	bl G2x_SetBlendAlpha_
	mov r0, #8
	str r0, [sp]
	ldr r0, _02246D38 ; =0x04001050
	mov r1, #4
	mov r2, #0xc
	mov r3, #0x10
	bl G2x_SetBlendAlpha_
	ldr r0, _02246D3C ; =ov71_02246D9C
	add r1, r4, #0
	mov r2, #0x14
	bl sub_0200E374
	add r1, r4, #0
	add r1, #0xc0
	str r0, [r1]
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	cmp r0, #0
	beq _02246D28
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	mov r1, #1
	str r1, [r0]
_02246D28:
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02246D30: .word 0x00000000
_02246D34: .word 0x04000050
_02246D38: .word 0x04001050
_02246D3C: .word ov71_02246D9C
	thumb_func_end ov71_02246C6C

	thumb_func_start ov71_02246D40
ov71_02246D40: ; 0x02246D40
	add r1, r0, #0
	add r1, #0xe4
	ldr r1, [r1]
	ldr r1, [r1]
	cmp r1, #1
	bne _02246D52
	mov r1, #1
	add r0, #0xe8
	str r1, [r0]
_02246D52:
	bx lr
	thumb_func_end ov71_02246D40

	thumb_func_start ov71_02246D54
ov71_02246D54: ; 0x02246D54
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r0, #0xe4
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #1
	bne _02246D9A
	mov r4, #0
	add r5, r6, #0
_02246D66:
	add r0, r5, #0
	add r0, #0xc4
	ldr r0, [r0]
	cmp r0, #0
	beq _02246D78
	add r0, r6, #0
	add r1, r4, #0
	bl ov71_02246F60
_02246D78:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #8
	blt _02246D66
	add r0, r6, #0
	add r0, #0xe4
	ldr r0, [r0]
	mov r1, #0
	str r1, [r0]
	add r0, r6, #0
	add r0, #0xc0
	ldr r0, [r0]
	bl DestroySysTask
	add r0, r6, #0
	bl FreeToHeap
_02246D9A:
	pop {r4, r5, r6, pc}
	thumb_func_end ov71_02246D54

	thumb_func_start ov71_02246D9C
ov71_02246D9C: ; 0x02246D9C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0xe8
	ldr r0, [r0]
	cmp r0, #0
	bne _02246E1A
	add r0, r4, #0
	add r0, #0xf0
	ldr r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0xf0
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xf0
	ldr r0, [r0]
	cmp r0, #0
	bgt _02246DD8
	ldr r0, _02246E80 ; =0x000006AD
	bl PlaySE
	add r0, r4, #0
	mov r1, #0x1e
	add r0, #0xf0
	str r1, [r0]
	add r0, r4, #0
	bl ov71_02246EAC
_02246DD8:
	add r0, r4, #0
	add r0, #0xec
	ldr r0, [r0]
	cmp r0, #0
	beq _02246E7C
	bl GX_BeginLoadBGExtPltt
	bl GXS_BeginLoadBGExtPltt
	add r0, r4, #0
	mov r1, #0x60
	bl DC_FlushRange
	mov r1, #6
	add r0, r4, #0
	lsl r1, r1, #0xc
	mov r2, #0x60
	bl GX_LoadBGExtPltt
	mov r1, #6
	add r0, r4, #0
	lsl r1, r1, #0xc
	mov r2, #0x60
	bl GXS_LoadBGExtPltt
	bl GX_EndLoadBGExtPltt
	bl GXS_EndLoadBGExtPltt
	mov r0, #0
	add r4, #0xec
	str r0, [r4]
	pop {r3, r4, r5, pc}
_02246E1A:
	add r0, r4, #0
	add r0, #0xec
	ldr r0, [r0]
	cmp r0, #0
	beq _02246E5C
	bl GX_BeginLoadBGExtPltt
	bl GXS_BeginLoadBGExtPltt
	add r0, r4, #0
	mov r1, #0x60
	bl DC_FlushRange
	mov r1, #6
	add r0, r4, #0
	lsl r1, r1, #0xc
	mov r2, #0x60
	bl GX_LoadBGExtPltt
	mov r1, #6
	add r0, r4, #0
	lsl r1, r1, #0xc
	mov r2, #0x60
	bl GXS_LoadBGExtPltt
	bl GX_EndLoadBGExtPltt
	bl GXS_EndLoadBGExtPltt
	add r0, r4, #0
	mov r1, #0
	add r0, #0xec
	str r1, [r0]
_02246E5C:
	add r0, r4, #0
	add r0, #0xf4
	ldr r0, [r0]
	cmp r0, #0
	bne _02246E7C
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	mov r1, #0
	str r1, [r0]
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
_02246E7C:
	pop {r3, r4, r5, pc}
	nop
_02246E80: .word 0x000006AD
	thumb_func_end ov71_02246D9C

	thumb_func_start ov71_02246E84
ov71_02246E84: ; 0x02246E84
	push {r3, r4}
	cmp r1, #0
	blt _02246E94
	cmp r1, #0x60
	bge _02246E94
	mov r4, #0
	lsl r1, r1, #1
	strh r4, [r0, r1]
_02246E94:
	cmp r2, #0
	blt _02246EA0
	cmp r2, #0x60
	bge _02246EA0
	lsl r1, r2, #1
	strh r3, [r0, r1]
_02246EA0:
	mov r1, #1
	add r0, #0xec
	str r1, [r0]
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov71_02246E84

	thumb_func_start ov71_02246EAC
ov71_02246EAC: ; 0x02246EAC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0xf8
	ldr r0, [r0]
	lsl r0, r0, #2
	add r0, r5, r0
	add r0, #0xc4
	ldr r0, [r0]
	cmp r0, #0
	bne _02246F58
	mov r0, #0x38
	mov r1, #0x18
	bl AllocFromHeap
	add r4, r0, #0
	beq _02246F58
	add r0, r5, #0
	str r5, [r4]
	add r0, #0xfc
	ldr r0, [r0]
	cmp r0, #1
	bne _02246EDE
	mov r0, #0
	mvn r0, r0
	b _02246EE0
_02246EDE:
	mov r0, #0xf
_02246EE0:
	str r0, [r4, #4]
	mov r0, #0
	str r0, [r4, #0xc]
	mov r0, #2
	str r0, [r4, #8]
	add r0, r5, #0
	add r0, #0xf8
	ldr r0, [r0]
	add r1, r4, #0
	str r0, [r4, #0x10]
	add r0, r5, #0
	add r0, #0xfc
	ldr r0, [r0]
	mov r2, #0xa
	str r0, [r4, #0x14]
	ldr r0, _02246F5C ; =ov71_02246F90
	bl CreateSysTask
	add r1, r5, #0
	add r1, #0xf8
	ldr r1, [r1]
	lsl r1, r1, #2
	add r1, r5, r1
	add r1, #0xc4
	str r0, [r1]
	add r0, r5, #0
	add r0, #0xf8
	ldr r0, [r0]
	lsl r0, r0, #2
	add r0, r5, r0
	add r0, #0xc4
	ldr r0, [r0]
	cmp r0, #0
	beq _02246F52
	add r0, r5, #0
	add r0, #0xf4
	ldr r0, [r0]
	add r1, r0, #1
	add r0, r5, #0
	add r0, #0xf4
	str r1, [r0]
	add r0, r5, #0
	add r0, #0xf8
	ldr r0, [r0]
	add r1, r0, #1
	add r0, r5, #0
	add r0, #0xf8
	str r1, [r0]
	add r0, r5, #0
	add r0, #0xf8
	ldr r0, [r0]
	cmp r0, #8
	blt _02246F58
	mov r0, #0
	add r5, #0xf8
	str r0, [r5]
	pop {r3, r4, r5, pc}
_02246F52:
	add r0, r4, #0
	bl FreeToHeap
_02246F58:
	pop {r3, r4, r5, pc}
	nop
_02246F5C: .word ov71_02246F90
	thumb_func_end ov71_02246EAC

	thumb_func_start ov71_02246F60
ov71_02246F60: ; 0x02246F60
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r5, #0
	lsl r4, r1, #2
	add r6, #0xc4
	ldr r0, [r6, r4]
	cmp r0, #0
	beq _02246F8E
	bl sub_0201F988
	bl FreeToHeap
	ldr r0, [r6, r4]
	bl DestroySysTask
	mov r0, #0
	str r0, [r6, r4]
	add r0, r5, #0
	add r0, #0xf4
	ldr r0, [r0]
	add r5, #0xf4
	sub r0, r0, #1
	str r0, [r5]
_02246F8E:
	pop {r4, r5, r6, pc}
	thumb_func_end ov71_02246F60

	thumb_func_start ov71_02246F90
ov71_02246F90: ; 0x02246F90
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4, #0xc]
	add r1, r0, #1
	str r1, [r4, #0xc]
	ldr r0, [r4, #8]
	cmp r1, r0
	blt _02246FF8
	mov r3, #0
	str r3, [r4, #0xc]
	ldr r0, [r4, #0x14]
	cmp r0, #1
	bne _02246FD0
	ldr r1, [r4, #4]
	ldr r0, [r4]
	add r2, r1, #1
	cmp r2, #0xf
	blt _02246FC2
	bl ov71_02246E84
	ldr r0, [r4]
	ldr r1, [r4, #0x10]
	bl ov71_02246F60
	pop {r4, pc}
_02246FC2:
	ldr r3, _02246FFC ; =0x00007FFF
	bl ov71_02246E84
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	pop {r4, pc}
_02246FD0:
	ldr r2, [r4, #4]
	ldr r0, [r4]
	cmp r2, #0
	bge _02246FEA
	add r1, r2, #0
	add r2, r2, #1
	bl ov71_02246E84
	ldr r0, [r4]
	ldr r1, [r4, #0x10]
	bl ov71_02246F60
	pop {r4, pc}
_02246FEA:
	ldr r3, _02246FFC ; =0x00007FFF
	add r1, r2, #1
	bl ov71_02246E84
	ldr r0, [r4, #4]
	sub r0, r0, #1
	str r0, [r4, #4]
_02246FF8:
	pop {r4, pc}
	nop
_02246FFC: .word 0x00007FFF
	thumb_func_end ov71_02246F90

	thumb_func_start ov71_02247000
ov71_02247000: ; 0x02247000
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	add r6, r1, #0
	mov r0, #0x38
	mov r1, #0x24
	add r7, r2, #0
	str r3, [sp, #4]
	ldr r5, [sp, #0x28]
	bl AllocFromHeap
	add r4, r0, #0
	ldr r0, _02247060 ; =0x00000001
	str r0, [r5]
	beq _02247058
	ldr r1, [sp]
	str r1, [r4]
	str r6, [r4, #8]
	ldr r1, [sp, #4]
	str r7, [r4, #0xc]
	str r1, [r4, #0x10]
	ldr r1, [sp, #0x20]
	str r1, [r4, #0x14]
	cmp r6, r7
	bge _02247034
	mov r0, #0
_02247034:
	str r0, [r4, #0x18]
	ldr r0, [sp, #0x24]
	mov r2, #0
	str r0, [r4, #0x1c]
	str r5, [r4, #4]
	ldr r0, _02247064 ; =ov71_02247068
	add r1, r4, #0
	str r2, [r5]
	bl sub_0200E33C
	str r0, [r4, #0x20]
	cmp r0, #0
	bne _02247058
	mov r0, #1
	str r0, [r5]
	add r0, r4, #0
	bl FreeToHeap
_02247058:
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02247060: .word 0x00000001
_02247064: .word ov71_02247068
	thumb_func_end ov71_02247000

	thumb_func_start ov71_02247068
ov71_02247068: ; 0x02247068
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #8]
	ldr r1, [r4, #0x10]
	mul r1, r0
	asr r2, r1, #0xc
	asr r1, r2, #4
	lsr r1, r1, #0x1b
	add r1, r2, r1
	asr r2, r1, #5
	ldr r1, [r4, #0x18]
	cmp r1, #0
	beq _0224708A
	cmp r1, #1
	beq _022470A0
	b _022470B4
_0224708A:
	ldr r1, [r4, #0xc]
	add r0, r0, r2
	cmp r0, r1
	bge _02247096
	str r0, [r4, #8]
	b _022470B4
_02247096:
	str r1, [r4, #8]
	ldr r0, [r4, #4]
	mov r1, #1
	str r1, [r0]
	b _022470B4
_022470A0:
	ldr r1, [r4, #0xc]
	sub r0, r0, r2
	cmp r0, r1
	ble _022470AC
	str r0, [r4, #8]
	b _022470B4
_022470AC:
	str r1, [r4, #8]
	ldr r0, [r4, #4]
	mov r1, #1
	str r1, [r0]
_022470B4:
	add r0, r4, #0
	bl ov71_022470DC
	ldr r0, [r4, #4]
	ldr r0, [r0]
	cmp r0, #0
	beq _022470D0
	add r0, r4, #0
	bl ov71_02247424
	add r0, r5, #0
	bl DestroySysTask
	pop {r3, r4, r5, pc}
_022470D0:
	ldr r1, [r4, #0x10]
	ldr r0, [r4, #0x14]
	add r0, r1, r0
	str r0, [r4, #0x10]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov71_02247068

	thumb_func_start ov71_022470DC
ov71_022470DC: ; 0x022470DC
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	ldr r0, [r4, #8]
	add r2, sp, #4
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r4, #8]
	mov r3, #0x80
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x1c]
	lsl r1, r0, #2
	ldr r0, _02247120 ; =_0224BBD4
	ldr r0, [r0, r1]
	mov r1, #2
	str r0, [sp]
	ldr r0, [r4]
	bl SetBgAffine
	ldr r0, [r4, #0x1c]
	add r2, sp, #4
	lsl r1, r0, #2
	ldr r0, _02247120 ; =_0224BBD4
	mov r3, #0x80
	ldr r0, [r0, r1]
	mov r1, #6
	str r0, [sp]
	ldr r0, [r4]
	bl SetBgAffine
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
_02247120: .word _0224BBD4
	thumb_func_end ov71_022470DC

	thumb_func_start ov71_02247124
ov71_02247124: ; 0x02247124
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x48
	add r5, r0, #0
	ldr r0, [sp, #0x60]
	add r4, r1, #0
	str r2, [sp, #0x14]
	str r3, [sp, #0x18]
	cmp r0, #0
	beq _0224713C
	mov r7, #0x19
	lsl r7, r7, #8
	b _02247140
_0224713C:
	mov r7, #0x32
	lsl r7, r7, #6
_02247140:
	mov r0, #0x38
	add r1, r7, #0
	bl AllocFromHeapAtEnd
	str r0, [sp, #0x24]
	cmp r0, #0
	beq _02247202
	ldr r3, _02247228 ; =ov71_0224BBDC
	add r2, sp, #0x28
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	cmp r4, #0
	ldr r0, [r5]
	bne _02247164
	ldr r4, [r0]
	b _02247166
_02247164:
	ldr r4, [r0, #4]
_02247166:
	add r0, r4, #0
	bl AcquireBoxMonLock
	str r0, [sp, #0x20]
	add r0, sp, #0x38
	add r1, r4, #0
	mov r2, #2
	mov r3, #0
	bl GetBoxmonSpriteCharAndPlttNarcIds
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl GetBoxMonData
	str r0, [sp, #0x1c]
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	ldr r0, [sp, #0x60]
	cmp r0, #0
	beq _022471A0
	ldr r0, [sp, #0x30]
	lsl r0, r0, #1
	str r0, [sp, #0x30]
_022471A0:
	add r0, r4, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #1
	bne _022471B8
	ldr r0, _0224722C ; =0x00000147
	cmp r6, r0
	bne _022471B8
	add r6, r0, #0
	add r6, #0xa7
_022471B8:
	ldr r0, [sp, #0x24]
	add r1, sp, #0x28
	str r0, [sp]
	ldr r0, [sp, #0x1c]
	mov r2, #0x38
	str r0, [sp, #4]
	ldr r0, [sp, #0x60]
	add r3, sp, #0x28
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	str r6, [sp, #0x10]
	ldrh r0, [r1, #0x10]
	ldrh r1, [r1, #0x12]
	bl sub_02014510
	ldr r0, [sp, #0x24]
	add r1, r7, #0
	bl DC_FlushRange
	ldr r1, [sp, #0x14]
	mov r0, #0
	str r0, [sp]
	lsl r1, r1, #0x18
	ldr r0, [r5, #8]
	ldr r2, [sp, #0x24]
	lsr r1, r1, #0x18
	add r3, r7, #0
	bl BG_LoadCharTilesData
	ldr r1, [sp, #0x20]
	add r0, r4, #0
	bl ReleaseBoxMonLock
	ldr r0, [sp, #0x24]
	bl FreeToHeap
_02247202:
	ldr r0, [sp, #0x14]
	cmp r0, #4
	blo _0224720C
	mov r2, #4
	b _0224720E
_0224720C:
	mov r2, #0
_0224720E:
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x38
	ldr r3, [sp, #0x18]
	str r0, [sp, #4]
	add r1, sp, #0x28
	ldrh r0, [r1, #0x10]
	ldrh r1, [r1, #0x14]
	lsl r3, r3, #5
	bl GfGfxLoader_GXLoadPal
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02247228: .word ov71_0224BBDC
_0224722C: .word 0x00000147
	thumb_func_end ov71_02247124

	thumb_func_start ov71_02247230
ov71_02247230: ; 0x02247230
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	add r4, r2, #0
	add r6, r3, #0
	cmp r1, #0
	bne _02247242
	ldr r1, _022472C0 ; =0x0000010A
	b _02247252
_02247242:
	mov r1, #0x52
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	cmp r0, #0
	beq _02247250
	sub r1, #0x3d
	b _02247252
_02247250:
	sub r1, #0x3e
_02247252:
	mov r0, #0x38
	str r0, [sp]
	mov r0, #7
	mov r2, #0
	add r3, sp, #0x1c
	bl GfGfxLoader_GetScrnData
	add r7, r0, #0
	beq _022472BA
	mov r0, #0xa
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0x1c]
	ldr r2, [sp, #0x38]
	add r0, #0xc
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	mov r0, #0x20
	ldr r3, [sp, #0x3c]
	str r0, [sp, #0x14]
	str r0, [sp, #0x18]
	lsl r1, r4, #0x18
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	ldr r0, [r5, #8]
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl CopyToBgTilemapRect
	mov r0, #0xa
	str r0, [sp]
	str r0, [sp, #4]
	lsl r0, r6, #0x18
	ldr r2, [sp, #0x38]
	ldr r3, [sp, #0x3c]
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	lsl r1, r4, #0x18
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	ldr r0, [r5, #8]
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl BgTilemapRectChangePalette
	add r0, r7, #0
	bl FreeToHeap
_022472BA:
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022472C0: .word 0x0000010A
	thumb_func_end ov71_02247230

	thumb_func_start ov71_022472C4
ov71_022472C4: ; 0x022472C4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	add r4, r1, #0
	add r6, r3, #0
	mov r0, #0x39
	add r3, r5, #0
	str r0, [sp]
	add r1, r2, #0
	add r0, r4, #0
	mov r2, #1
	add r3, #8
	bl GfGfxLoader_GetCellBank
	str r0, [r5]
	mov r0, #0x39
	add r3, r5, #0
	str r0, [sp]
	add r0, r4, #0
	add r1, r6, #0
	mov r2, #1
	add r3, #0xc
	bl GfGfxLoader_GetAnimBank
	str r0, [r5, #4]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov71_022472C4

	thumb_func_start ov71_022472FC
ov71_022472FC: ; 0x022472FC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _0224730E
	bl FreeToHeap
	mov r0, #0
	str r0, [r4]
_0224730E:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0224731C
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #4]
_0224731C:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov71_022472FC

	thumb_func_start ov71_02247320
ov71_02247320: ; 0x02247320
	str r2, [r0]
	str r3, [r0, #8]
	ldr r2, [r1, #8]
	str r2, [r0, #0xc]
	ldr r1, [r1, #0xc]
	ldr r2, [sp]
	str r1, [r0, #0x10]
	add r1, r0, #0
	add r1, #0x20
	strb r2, [r1]
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	str r1, [r0, #0x1c]
	bx lr
	thumb_func_end ov71_02247320

	thumb_func_start ov71_02247340
ov71_02247340: ; 0x02247340
	push {r4, lr}
	sub sp, #0x20
	ldr r0, [r0, #0x18]
	str r0, [sp]
	lsl r0, r2, #0xc
	str r0, [sp, #8]
	lsl r0, r3, #0xc
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x28]
	str r1, [sp, #4]
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x18]
	mov r0, #0x38
	str r0, [sp, #0x1c]
	add r0, sp, #0
	bl sub_02024714
	add r4, r0, #0
	beq _0224737C
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xc
	bl sub_02024868
_0224737C:
	add r0, r4, #0
	add sp, #0x20
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov71_02247340

	thumb_func_start ov71_02247384
ov71_02247384: ; 0x02247384
	ldr r0, [r0, #8]
	bx lr
	thumb_func_end ov71_02247384

	thumb_func_start ov71_02247388
ov71_02247388: ; 0x02247388
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end ov71_02247388

	thumb_func_start ov71_0224738C
ov71_0224738C: ; 0x0224738C
	ldr r0, [r0, #0x10]
	bx lr
	thumb_func_end ov71_0224738C

	thumb_func_start ov71_02247390
ov71_02247390: ; 0x02247390
	ldr r0, [r0]
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov71_02247390

	thumb_func_start ov71_02247398
ov71_02247398: ; 0x02247398
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bx lr
	.balign 4, 0
	thumb_func_end ov71_02247398

	thumb_func_start ov71_022473A0
ov71_022473A0: ; 0x022473A0
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bx lr
	.balign 4, 0
	thumb_func_end ov71_022473A0

	thumb_func_start ov71_022473A8
ov71_022473A8: ; 0x022473A8
	mov r1, #0x53
	lsl r1, r1, #2
	ldrh r0, [r0, r1]
	bx lr
	thumb_func_end ov71_022473A8

	thumb_func_start ov71_022473B0
ov71_022473B0: ; 0x022473B0
	ldr r1, _022473B8 ; =0x0000014E
	ldrh r0, [r0, r1]
	bx lr
	nop
_022473B8: .word 0x0000014E
	thumb_func_end ov71_022473B0

	thumb_func_start ov71_022473BC
ov71_022473BC: ; 0x022473BC
	mov r1, #0x15
	lsl r1, r1, #4
	ldrh r0, [r0, r1]
	bx lr
	thumb_func_end ov71_022473BC

	thumb_func_start ov71_022473C4
ov71_022473C4: ; 0x022473C4
	ldr r1, _022473CC ; =0x00000152
	ldrh r0, [r0, r1]
	bx lr
	nop
_022473CC: .word 0x00000152
	thumb_func_end ov71_022473C4

	thumb_func_start ov71_022473D0
ov71_022473D0: ; 0x022473D0
	ldr r0, [r0]
	ldr r3, _022473D8 ; =Options_GetFrame
	ldr r0, [r0, #0x14]
	bx r3
	.balign 4, 0
_022473D8: .word Options_GetFrame
	thumb_func_end ov71_022473D0

	thumb_func_start ov71_022473DC
ov71_022473DC: ; 0x022473DC
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bx lr
	.balign 4, 0
	thumb_func_end ov71_022473DC

	thumb_func_start ov71_022473E4
ov71_022473E4: ; 0x022473E4
	ldr r0, _022473EC ; =_0224C040
	mov r1, #0
	str r1, [r0]
	bx lr
	.balign 4, 0
_022473EC: .word _0224C040
	thumb_func_end ov71_022473E4

	thumb_func_start ov71_022473F0
ov71_022473F0: ; 0x022473F0
	push {r4, r5, r6, lr}
	ldr r6, _0224741C ; =_0224C040
	ldr r0, [r6]
	cmp r0, #0
	beq _02247418
	mov r4, #0
	cmp r0, #0
	ble _02247412
	ldr r5, _02247420 ; =ov71_0224C044
_02247402:
	ldr r0, [r5]
	bl FreeToHeap
	ldr r0, [r6]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r0
	blt _02247402
_02247412:
	ldr r0, _0224741C ; =_0224C040
	mov r1, #0
	str r1, [r0]
_02247418:
	pop {r4, r5, r6, pc}
	nop
_0224741C: .word _0224C040
_02247420: .word ov71_0224C044
	thumb_func_end ov71_022473F0

	thumb_func_start ov71_02247424
ov71_02247424: ; 0x02247424
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02247444 ; =_0224C040
	ldr r0, [r0]
	cmp r0, #0x20
	blt _02247434
	bl GF_AssertFail
_02247434:
	ldr r0, _02247444 ; =_0224C040
	ldr r2, [r0]
	add r1, r2, #1
	str r1, [r0]
	ldr r0, _02247448 ; =ov71_0224C044
	lsl r1, r2, #2
	str r4, [r0, r1]
	pop {r4, pc}
	.balign 4, 0
_02247444: .word _0224C040
_02247448: .word ov71_0224C044
	thumb_func_end ov71_02247424

	thumb_func_start ov71_0224744C
ov71_0224744C: ; 0x0224744C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r4, r1, #0
	mov r0, #0x39
	mov r1, #0x20
	add r5, r2, #0
	str r3, [sp]
	bl AllocFromHeap
	add r6, r0, #0
	beq _02247492
	ldr r3, [sp]
	add r1, r4, #0
	add r2, r5, #0
	bl ov71_0224784C
	mov r1, #0x8c
	mov r0, #0x39
	mul r1, r7
	bl AllocFromHeap
	str r0, [r6, #0x18]
	mov r4, #0
	str r7, [r6, #0x1c]
	cmp r7, #0
	bls _02247492
	add r5, r4, #0
_02247482:
	ldr r0, [r6, #0x18]
	add r0, r0, r5
	bl ov71_022475C4
	add r4, r4, #1
	add r5, #0x8c
	cmp r4, r7
	blo _02247482
_02247492:
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov71_0224744C

	thumb_func_start ov71_02247498
ov71_02247498: ; 0x02247498
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x1c]
	mov r6, #0
	cmp r0, #0
	bls _022474B8
	add r4, r6, #0
_022474A6:
	ldr r0, [r5, #0x18]
	add r0, r0, r4
	bl ov71_022475F8
	ldr r0, [r5, #0x1c]
	add r6, r6, #1
	add r4, #0x8c
	cmp r6, r0
	blo _022474A6
_022474B8:
	ldr r0, [r5, #0x18]
	bl FreeToHeap
	add r0, r5, #0
	bl ov71_022478B8
	add r0, r5, #0
	bl FreeToHeap
	pop {r4, r5, r6, pc}
	thumb_func_end ov71_02247498

	thumb_func_start ov71_022474CC
ov71_022474CC: ; 0x022474CC
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	mov r1, #0
	add r5, r0, #0
	mov r0, #0x11
	add r2, r1, #0
	bl NNS_G3dGeBufferOP_N
	bl sub_02023154
	ldr r0, [r5, #0x1c]
	mov r6, #0
	cmp r0, #0
	bls _02247502
	add r4, r6, #0
_022474EA:
	ldr r0, [r5, #0x18]
	add r0, r0, r4
	ldr r1, [r0, #0x64]
	cmp r1, #0
	beq _022474F8
	bl ov71_02247514
_022474F8:
	ldr r0, [r5, #0x1c]
	add r6, r6, #1
	add r4, #0x8c
	cmp r6, r0
	blo _022474EA
_02247502:
	mov r2, #1
	mov r0, #0x12
	add r1, sp, #0
	str r2, [sp]
	bl NNS_G3dGeBufferOP_N
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov71_022474CC

	thumb_func_start ov71_02247514
ov71_02247514: ; 0x02247514
	push {r4, lr}
	sub sp, #0x50
	add r4, r0, #0
	add r0, sp, #0x2c
	bl MTX_Identity33_
	add r0, r4, #0
	add r0, #0x80
	ldrh r0, [r0]
	ldr r3, _022475C0 ; =FX_SinCosTable_
	asr r0, r0, #4
	lsl r2, r0, #1
	lsl r1, r2, #1
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #8
	bl MTX_RotX33_
	add r1, sp, #0x2c
	add r0, sp, #8
	add r2, r1, #0
	bl MTX_Concat33
	add r0, r4, #0
	add r0, #0x82
	ldrh r0, [r0]
	ldr r3, _022475C0 ; =FX_SinCosTable_
	asr r0, r0, #4
	lsl r2, r0, #1
	lsl r1, r2, #1
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #8
	bl MTX_RotY33_
	add r1, sp, #0x2c
	add r0, sp, #8
	add r2, r1, #0
	bl MTX_Concat33
	add r0, r4, #0
	add r0, #0x84
	ldrh r0, [r0]
	ldr r3, _022475C0 ; =FX_SinCosTable_
	asr r0, r0, #4
	lsl r2, r0, #1
	lsl r1, r2, #1
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #8
	bl MTX_RotZ33_
	add r1, sp, #0x2c
	add r0, sp, #8
	add r2, r1, #0
	bl MTX_Concat33
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	cmp r0, #0x1f
	beq _022475AC
	str r0, [sp]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	str r0, [sp, #4]
	bl NNS_G3dGlbPolygonAttr
_022475AC:
	add r1, r4, #0
	add r0, r4, #4
	add r4, #0x74
	add r1, #0x68
	add r2, sp, #0x2c
	add r3, r4, #0
	bl Draw3dModel
	add sp, #0x50
	pop {r4, pc}
	.balign 4, 0
_022475C0: .word FX_SinCosTable_
	thumb_func_end ov71_02247514

	thumb_func_start ov71_022475C4
ov71_022475C4: ; 0x022475C4
	mov r1, #0
	str r1, [r0, #0x64]
	add r2, r0, #0
	str r1, [r0]
	add r2, #0x84
	strh r1, [r2]
	mov r2, #0x84
	ldrsh r3, [r0, r2]
	add r2, r0, #0
	add r2, #0x82
	strh r3, [r2]
	mov r2, #0x82
	ldrsh r3, [r0, r2]
	add r2, r0, #0
	add r2, #0x80
	strh r3, [r2]
	mov r2, #1
	lsl r2, r2, #0xc
	str r2, [r0, #0x7c]
	str r2, [r0, #0x78]
	str r2, [r0, #0x74]
	str r1, [r0, #0x70]
	str r1, [r0, #0x6c]
	str r1, [r0, #0x68]
	bx lr
	.balign 4, 0
	thumb_func_end ov71_022475C4

	thumb_func_start ov71_022475F8
ov71_022475F8: ; 0x022475F8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _0224760C
	bl FreeToHeap
	mov r0, #0
	str r0, [r4]
	str r0, [r4, #0x64]
_0224760C:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov71_022475F8

	thumb_func_start ov71_02247610
ov71_02247610: ; 0x02247610
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r4, [r0, #0x18]
	add r6, r1, #0
	mov r0, #0x8c
	mul r6, r0
	add r7, r2, #0
	mov r0, #1
	str r0, [sp]
	str r3, [sp, #4]
	add r1, r3, #0
	add r0, r7, #0
	mov r2, #0
	mov r3, #0x39
	add r5, r4, r6
	bl GfGfxLoader_LoadFromNarc
	str r0, [r4, r6]
	ldr r1, [sp, #4]
	add r0, r7, #0
	bl GetNarcMemberSizeByIdPair
	add r1, r0, #0
	ldr r0, [r4, r6]
	bl DC_FlushRange
	ldr r0, [r4, r6]
	cmp r0, #0
	beq _022476AC
	bl NNS_G3dGetMdlSet
	str r0, [r5, #0x58]
	cmp r0, #0
	beq _02247674
	add r2, r0, #0
	add r2, #8
	beq _02247668
	ldrb r1, [r0, #9]
	cmp r1, #0
	bls _02247668
	ldrh r1, [r0, #0xe]
	add r1, r2, r1
	add r1, r1, #4
	b _0224766A
_02247668:
	mov r1, #0
_0224766A:
	cmp r1, #0
	beq _02247674
	ldr r1, [r1]
	add r0, r0, r1
	b _02247676
_02247674:
	mov r0, #0
_02247676:
	str r0, [r5, #0x5c]
	ldr r0, [r5]
	bl NNS_G3dGetTex
	str r0, [r5, #0x60]
	bl AllocAndLoad3dTexResources
	ldr r0, [r5]
	ldr r1, [r5, #0x60]
	bl Bind3dModelSet
	ldr r1, [r5, #0x5c]
	add r0, r5, #4
	bl NNS_G3dRenderObjInit
	ldr r0, [sp, #0x20]
	mov r1, #0x1f
	str r0, [r5, #0x68]
	ldr r0, [sp, #0x24]
	str r0, [r5, #0x6c]
	ldr r0, [sp, #0x28]
	str r0, [r5, #0x70]
	add r0, r5, #0
	add r0, #0x88
	str r1, [r0]
	ldr r0, [sp, #0x2c]
	str r0, [r5, #0x64]
_022476AC:
	add r0, r5, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov71_02247610

	thumb_func_start ov71_022476B4
ov71_022476B4: ; 0x022476B4
	add r2, r0, #0
	add r2, #0x68
	add r3, r1, #0
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	bx lr
	thumb_func_end ov71_022476B4

	thumb_func_start ov71_022476C4
ov71_022476C4: ; 0x022476C4
	add r3, r1, #0
	add r2, r0, #0
	ldmia r3!, {r0, r1}
	add r2, #0x68
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	bx lr
	thumb_func_end ov71_022476C4

	thumb_func_start ov71_022476D4
ov71_022476D4: ; 0x022476D4
	add r2, r0, #0
	add r2, #0x80
	ldrh r2, [r2]
	strh r2, [r1]
	add r2, r0, #0
	add r2, #0x82
	ldrh r2, [r2]
	add r0, #0x84
	strh r2, [r1, #2]
	ldrh r0, [r0]
	strh r0, [r1, #4]
	bx lr
	thumb_func_end ov71_022476D4

	thumb_func_start ov71_022476EC
ov71_022476EC: ; 0x022476EC
	ldrh r3, [r1]
	add r2, r0, #0
	add r2, #0x80
	strh r3, [r2]
	add r2, r0, #0
	ldrh r3, [r1, #2]
	add r2, #0x82
	add r0, #0x84
	strh r3, [r2]
	ldrh r1, [r1, #4]
	strh r1, [r0]
	bx lr
	thumb_func_end ov71_022476EC

	thumb_func_start ov71_02247704
ov71_02247704: ; 0x02247704
	str r1, [r0, #0x64]
	bx lr
	thumb_func_end ov71_02247704

	thumb_func_start ov71_02247708
ov71_02247708: ; 0x02247708
	push {r3, lr}
	add r2, r0, #0
	add r2, #0x88
	str r1, [r2]
	cmp r1, #0x1f
	ldr r0, [r0, #0x5c]
	beq _02247722
	mov r2, #0x1f
	mov r1, #0
	lsl r2, r2, #0x10
	bl NNSi_G3dModifyPolygonAttrMask
	pop {r3, pc}
_02247722:
	mov r2, #0x1f
	mov r1, #1
	lsl r2, r2, #0x10
	bl NNSi_G3dModifyPolygonAttrMask
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov71_02247708

	thumb_func_start ov71_02247730
ov71_02247730: ; 0x02247730
	str r1, [r0, #0x74]
	str r1, [r0, #0x78]
	str r1, [r0, #0x7c]
	bx lr
	thumb_func_end ov71_02247730

	thumb_func_start ov71_02247738
ov71_02247738: ; 0x02247738
	push {r3, r4, lr}
	sub sp, #0x4c
	add r4, r0, #0
	add r0, sp, #0x28
	bl MTX_Identity33_
	add r0, r4, #0
	add r0, #0x80
	ldrh r0, [r0]
	ldr r3, _022477E8 ; =FX_SinCosTable_
	asr r0, r0, #4
	lsl r2, r0, #1
	lsl r1, r2, #1
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #4
	bl MTX_RotX33_
	add r1, sp, #0x28
	add r0, sp, #4
	add r2, r1, #0
	bl MTX_Concat33
	add r0, r4, #0
	add r0, #0x82
	ldrh r0, [r0]
	ldr r3, _022477E8 ; =FX_SinCosTable_
	asr r0, r0, #4
	lsl r2, r0, #1
	lsl r1, r2, #1
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #4
	bl MTX_RotY33_
	add r1, sp, #0x28
	add r0, sp, #4
	add r2, r1, #0
	bl MTX_Concat33
	add r0, r4, #0
	add r0, #0x84
	ldrh r0, [r0]
	ldr r3, _022477E8 ; =FX_SinCosTable_
	asr r0, r0, #4
	lsl r2, r0, #1
	lsl r1, r2, #1
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #4
	bl MTX_RotZ33_
	add r1, sp, #0x28
	add r0, sp, #4
	add r2, r1, #0
	bl MTX_Concat33
	mov r1, #0
	mov r0, #0x11
	add r2, r1, #0
	bl NNS_G3dGeBufferOP_N
	bl sub_02023154
	add r1, r4, #0
	ldr r0, [r4, #0x5c]
	add r4, #0x74
	add r1, #0x68
	add r2, sp, #0x28
	add r3, r4, #0
	bl sub_0201F990
	add r4, r0, #0
	mov r2, #1
	mov r0, #0x12
	add r1, sp, #0
	str r2, [sp]
	bl NNS_G3dGeBufferOP_N
	add r0, r4, #0
	add sp, #0x4c
	pop {r3, r4, pc}
	.balign 4, 0
_022477E8: .word FX_SinCosTable_
	thumb_func_end ov71_02247738

	thumb_func_start ov71_022477EC
ov71_022477EC: ; 0x022477EC
	push {r3, r4, lr}
	sub sp, #0xc
	add r2, r0, #0
	add r4, r1, #0
	ldr r1, [r2]
	add r0, sp, #0
	bl sub_02023640
	add r2, sp, #0
	ldmia r2!, {r0, r1}
	stmia r4!, {r0, r1}
	ldr r0, [r2]
	str r0, [r4]
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov71_022477EC

	thumb_func_start ov71_0224780C
ov71_0224780C: ; 0x0224780C
	ldr r3, _02247818 ; =GF_Camera_SetAngle
	add r2, r0, #0
	add r0, r1, #0
	ldr r1, [r2]
	bx r3
	nop
_02247818: .word GF_Camera_SetAngle
	thumb_func_end ov71_0224780C

	thumb_func_start ov71_0224781C
ov71_0224781C: ; 0x0224781C
	ldr r3, _02247828 ; =sub_0202357C
	add r2, r0, #0
	add r0, r1, #0
	ldr r1, [r2]
	bx r3
	nop
_02247828: .word sub_0202357C
	thumb_func_end ov71_0224781C

	thumb_func_start ov71_0224782C
ov71_0224782C: ; 0x0224782C
	ldr r3, _02247838 ; =sub_020233D8
	add r2, r0, #0
	add r0, r1, #0
	ldr r1, [r2]
	bx r3
	nop
_02247838: .word sub_020233D8
	thumb_func_end ov71_0224782C

	thumb_func_start ov71_0224783C
ov71_0224783C: ; 0x0224783C
	ldr r3, _02247848 ; =GF_Camera_SetPerspectiveAngle
	add r2, r0, #0
	add r0, r1, #0
	ldr r1, [r2]
	bx r3
	nop
_02247848: .word GF_Camera_SetPerspectiveAngle
	thumb_func_end ov71_0224783C

	thumb_func_start ov71_0224784C
ov71_0224784C: ; 0x0224784C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	mov r0, #0x39
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl GF_Camera_Create
	str r0, [r5]
	str r4, [r5, #4]
	str r6, [r5, #8]
	mov r1, #0x4b
	add r2, r5, #0
	str r7, [r5, #0xc]
	mov r0, #0
	strh r0, [r5, #0x10]
	strh r0, [r5, #0x12]
	strh r0, [r5, #0x14]
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5]
	ldr r3, _022478B4 ; =0x00000FA4
	str r0, [sp, #8]
	add r0, r5, #4
	lsl r1, r1, #0xe
	add r2, #0x10
	bl GF_Camera_InitFromTargetDistanceAndAngle
	mov r1, #0
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [sp, #0x10]
	str r1, [sp, #0xc]
	str r1, [sp, #0x14]
	ldr r1, [r5]
	add r0, sp, #0xc
	bl GF_Camera_SetBindTarget
	ldr r0, [r5]
	bl GF_Camera_RegisterToStaticPtr
	mov r1, #0xfa
	ldr r2, [r5]
	mov r0, #0
	lsl r1, r1, #0xe
	bl GF_Camera_SetClipBounds
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022478B4: .word 0x00000FA4
	thumb_func_end ov71_0224784C

	thumb_func_start ov71_022478B8
ov71_022478B8: ; 0x022478B8
	push {r4, lr}
	add r4, r0, #0
	bl sub_02023148
	ldr r0, [r4]
	bl sub_02023120
	pop {r4, pc}
	thumb_func_end ov71_022478B8

	thumb_func_start ov71_022478C8
ov71_022478C8: ; 0x022478C8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x39
	mov r1, #0x84
	bl AllocFromHeap
	add r4, r0, #0
	beq _0224791E
	str r5, [r4]
	mov r0, #0
	str r0, [r4, #4]
	add r0, r5, #0
	bl ov71_02247384
	str r0, [r4, #0x54]
	mov r0, #0x39
	bl sub_02007FD4
	str r0, [r4, #0xc]
	mov r0, #0
	str r0, [r4, #0x10]
	mov r0, #0x4b
	lsl r0, r0, #2
	mov r1, #0x39
	bl String_ctor
	str r0, [r4, #0x68]
	mov r0, #0x4b
	lsl r0, r0, #2
	mov r1, #0x39
	bl String_ctor
	str r0, [r4, #0x6c]
	mov r0, #0
	str r0, [r4, #0x78]
	str r0, [r4, #0x7c]
	mov r0, #0xb4
	mov r1, #0x39
	bl NARC_ctor
	add r1, r4, #0
	add r1, #0x80
	str r0, [r1]
_0224791E:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov71_022478C8

	thumb_func_start ov71_02247924
ov71_02247924: ; 0x02247924
	push {r4, lr}
	add r4, r0, #0
	beq _0224798C
	bl ov71_02248120
	add r0, r4, #0
	bl ov71_022481EC
	add r0, r4, #0
	bl ov71_0224809C
	ldr r0, [r4, #0x68]
	bl String_dtor
	ldr r0, [r4, #0x6c]
	bl String_dtor
	ldr r0, [r4, #0x70]
	bl ov71_02247498
	ldr r0, [r4, #0x54]
	mov r1, #1
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x54]
	mov r1, #2
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x54]
	mov r1, #6
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	add r0, #0x58
	bl RemoveWindow
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl NARC_dtor
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _02247980
	bl sub_02008780
_02247980:
	ldr r0, [r4, #0xc]
	bl sub_02008524
	add r0, r4, #0
	bl FreeToHeap
_0224798C:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov71_02247924

	thumb_func_start ov71_02247990
ov71_02247990: ; 0x02247990
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r2, [r4]
	add r5, r0, #0
	cmp r2, #4
	bhs _022479BE
	lsl r3, r2, #2
	ldr r2, _022479C4 ; =ov71_0224BC64
	add r1, r5, #4
	ldr r2, [r2, r3]
	blx r2
	cmp r0, #0
	beq _022479B4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #0
	str r0, [r5, #4]
_022479B4:
	add r0, r5, #0
	bl ov71_022479C8
	mov r0, #0
	pop {r3, r4, r5, pc}
_022479BE:
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_022479C4: .word ov71_0224BC64
	thumb_func_end ov71_02247990

	thumb_func_start ov71_022479C8
ov71_022479C8: ; 0x022479C8
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	bl G3X_Reset
	mov r1, #0
	mov r0, #0x11
	add r2, r1, #0
	bl NNS_G3dGeBufferOP_N
	bl NNS_G3dGeFlushBuffer
	bl NNS_G2dSetupSoftwareSpriteCamera
	ldr r0, [r4, #0xc]
	bl sub_02009418
	ldr r0, [r4, #0xc]
	bl sub_02008120
	mov r2, #1
	str r2, [sp]
	mov r0, #0x12
	add r1, sp, #0
	bl NNS_G3dGeBufferOP_N
	ldr r0, [r4, #0x70]
	bl ov71_022474CC
	mov r0, #0
	add r1, r0, #0
	bl sub_02026E50
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov71_022479C8

	thumb_func_start ov71_02247A10
ov71_02247A10: ; 0x02247A10
	push {r3, r4, lr}
	sub sp, #0x1c
	add r4, r0, #0
	ldr r0, _02247C0C ; =ov71_0224BCBC
	bl GX_SetBanks
	ldr r2, _02247C10 ; =0x04000304
	ldr r0, _02247C14 ; =0xFFFF7FFF
	ldrh r1, [r2]
	and r0, r1
	strh r0, [r2]
	ldr r0, _02247C18 ; =ov71_0224BC74
	bl SetBothScreensModesAndDisable
	ldr r0, [r4, #0x54]
	ldr r2, _02247C1C ; =ov71_0224BC84
	mov r1, #1
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x54]
	ldr r2, _02247C20 ; =ov71_0224BCA0
	mov r1, #2
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x54]
	ldr r2, _02247C20 ; =ov71_0224BCA0
	mov r1, #6
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	ldr r2, _02247C24 ; =0x04000008
	mov r0, #3
	ldrh r3, [r2]
	mov r1, #1
	bic r3, r0
	add r0, r3, #0
	orr r0, r1
	strh r0, [r2]
	mov r2, #0
	str r2, [sp]
	ldr r0, [r4, #0x54]
	add r3, r1, #0
	bl BG_FillCharDataRange
	mov r2, #0
	str r2, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [r4, #0x54]
	mov r1, #1
	add r3, r2, #0
	bl FillBgTilemapRect
	ldr r0, [r4]
	bl ov71_022473D0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x39
	str r0, [sp, #4]
	ldr r0, [r4, #0x54]
	mov r1, #1
	mov r2, #0x6d
	mov r3, #2
	bl LoadUserFrameGfx2
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #4
	add r1, r4, #0
	str r0, [sp, #8]
	mov r2, #1
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	ldr r0, [r4, #0x54]
	add r1, #0x58
	mov r3, #2
	bl AddWindowParameterized
	add r0, r4, #0
	add r0, #0x58
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r3, #0x20
	str r3, [sp]
	mov r0, #0x39
	str r0, [sp, #4]
	mov r0, #0x10
	mov r1, #8
	mov r2, #0
	bl GfGfxLoader_GXLoadPal
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x54]
	mov r0, #0x59
	mov r1, #0x16
	mov r3, #2
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x54]
	mov r0, #0x59
	mov r1, #0x15
	mov r3, #2
	bl GfGfxLoader_LoadScrnData
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x39
	mov r2, #0
	str r0, [sp, #4]
	mov r0, #0x59
	mov r1, #0x17
	add r3, r2, #0
	bl GfGfxLoader_GXLoadPal
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x54]
	mov r0, #0x59
	mov r1, #0x16
	mov r3, #6
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x54]
	mov r0, #0x59
	mov r1, #0x15
	mov r3, #6
	bl GfGfxLoader_LoadScrnData
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x39
	str r0, [sp, #4]
	mov r0, #0x59
	mov r1, #0x17
	mov r2, #4
	mov r3, #0
	bl GfGfxLoader_GXLoadPal
	ldr r0, [r4, #0x54]
	mov r1, #1
	bl BgCommitTilemapBufferToVram
	add r0, r4, #0
	bl ov71_02247ED0
	mov r1, #0
	mov r0, #1
	add r2, r1, #0
	add r3, r1, #0
	bl ov71_0224744C
	str r0, [r4, #0x70]
	add r0, r4, #0
	bl ov71_02247F9C
	str r0, [r4, #0x10]
	mov r1, #0
	mov r0, #0x6a
	str r1, [sp]
	lsl r0, r0, #0xa
	str r0, [sp, #4]
	ldr r0, _02247C28 ; =0x00073800
	mov r2, #0x59
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r4, #0x70]
	mov r3, #0x1b
	bl ov71_02247610
	ldr r2, _02247C2C ; =ov71_0224BC5C
	str r0, [r4, #0x74]
	ldrh r3, [r2]
	add r0, sp, #0x14
	add r1, sp, #0x14
	strh r3, [r0]
	ldrh r3, [r2, #2]
	ldrh r2, [r2, #4]
	strh r3, [r0, #2]
	strh r2, [r0, #4]
	ldr r0, [r4, #0x74]
	bl ov71_022476EC
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	add r0, r4, #0
	bl ov71_02247FF8
	ldr r0, _02247C30 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	bl sub_0203A880
	mov r0, #1
	mov r1, #0x38
	bl sub_0203A948
	mov r0, #0x10
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x39
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #1
	add sp, #0x1c
	pop {r3, r4, pc}
	.balign 4, 0
_02247C0C: .word ov71_0224BCBC
_02247C10: .word 0x04000304
_02247C14: .word 0xFFFF7FFF
_02247C18: .word ov71_0224BC74
_02247C1C: .word ov71_0224BC84
_02247C20: .word ov71_0224BCA0
_02247C24: .word 0x04000008
_02247C28: .word 0x00073800
_02247C2C: .word ov71_0224BC5C
_02247C30: .word 0x04000050
	thumb_func_end ov71_02247A10

	thumb_func_start ov71_02247C34
ov71_02247C34: ; 0x02247C34
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r1]
	cmp r0, #0
	bne _02247C5A
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02247C5A
	ldr r0, [r4, #0x3c]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r4, #0x3c]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #1
	pop {r4, pc}
_02247C5A:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov71_02247C34

	thumb_func_start ov71_02247C60
ov71_02247C60: ; 0x02247C60
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r1, #0
	add r4, r0, #0
	ldr r0, [r5]
	cmp r0, #4
	bhi _02247C9A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02247C7A: ; jump table
	.short _02247C84 - _02247C7A - 2 ; case 0
	.short _02247C90 - _02247C7A - 2 ; case 1
	.short _02247D04 - _02247C7A - 2 ; case 2
	.short _02247DB4 - _02247C7A - 2 ; case 3
	.short _02247DD4 - _02247C7A - 2 ; case 4
_02247C84:
	mov r0, #0
	str r0, [r4, #8]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02247DE4
_02247C90:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0xa
	bgt _02247C9C
_02247C9A:
	b _02247DE4
_02247C9C:
	ldr r0, [r4]
	bl ov71_0224738C
	str r0, [sp, #0xc]
	ldr r0, [r4]
	bl ov71_02247388
	add r7, r0, #0
	ldr r0, [r4]
	bl ov71_022473DC
	cmp r0, #1
	bne _02247CBC
	mov r1, #0
	mov r6, #2
	b _02247CC0
_02247CBC:
	mov r1, #4
	mov r6, #3
_02247CC0:
	ldr r0, [sp, #0xc]
	ldr r2, [r4, #0x68]
	bl ReadMsgDataIntoString
	ldr r1, [r4, #0x6c]
	ldr r2, [r4, #0x68]
	add r0, r7, #0
	bl StringExpandPlaceholders
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	str r3, [sp, #8]
	add r0, r4, #0
	ldr r2, [r4, #0x6c]
	add r0, #0x58
	mov r1, #1
	bl AddTextPrinterParameterized
	add r0, r4, #0
	add r0, #0x58
	mov r1, #0x6d
	mov r2, #2
	bl sub_0200E948
	add r0, r4, #0
	add r0, #0x58
	bl CopyWindowToVram
	mov r0, #0
	str r0, [r4, #8]
	str r6, [r5]
	b _02247DE4
_02247D04:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0x3c
	ble _02247DE4
	ldr r0, [r4]
	bl ov71_0224738C
	add r6, r0, #0
	ldr r0, [r4]
	bl ov71_02247388
	add r7, r0, #0
	ldr r2, [r4, #0x68]
	add r0, r6, #0
	mov r1, #1
	bl ReadMsgDataIntoString
	ldr r1, [r4, #0x6c]
	ldr r2, [r4, #0x68]
	add r0, r7, #0
	bl StringExpandPlaceholders
	ldr r0, [r4]
	bl ov71_02247390
	mov r1, #0x4c
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	bne _02247D80
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl sub_02008550
	ldr r0, [r4]
	bl ov71_022473A8
	add r2, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	add r1, sp, #0x10
	mov r3, #1
	bl sub_020729A4
	ldr r0, [r4]
	bl ov71_022473A8
	add r6, r0, #0
	ldr r0, [r4]
	bl ov71_022473B0
	add r2, r0, #0
	add r1, sp, #0x10
	lsl r2, r2, #0x18
	ldrb r1, [r1]
	add r0, r6, #0
	lsr r2, r2, #0x18
	bl sub_020062E0
_02247D80:
	add r0, r4, #0
	add r0, #0x58
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	str r3, [sp, #8]
	add r0, r4, #0
	ldr r2, [r4, #0x6c]
	add r0, #0x58
	mov r1, #1
	bl AddTextPrinterParameterized
	add r0, r4, #0
	add r0, #0x58
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0
	str r0, [r4, #8]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02247DE4
_02247DB4:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0x3c
	ble _02247DE4
	add r0, r4, #0
	add r0, #0x58
	mov r1, #0
	bl ClearFrameAndWindow2
	mov r0, #0
	str r0, [r4, #8]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02247DE4
_02247DD4:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0x14
	ble _02247DE4
	add sp, #0x14
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02247DE4:
	mov r0, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov71_02247C60

	thumb_func_start ov71_02247DEC
ov71_02247DEC: ; 0x02247DEC
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	ldr r1, [r4]
	add r5, r0, #0
	cmp r1, #4
	bhi _02247EC6
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02247E06: ; jump table
	.short _02247E10 - _02247E06 - 2 ; case 0
	.short _02247E2A - _02247E06 - 2 ; case 1
	.short _02247E50 - _02247E06 - 2 ; case 2
	.short _02247E7C - _02247E06 - 2 ; case 3
	.short _02247EAE - _02247E06 - 2 ; case 4
_02247E10:
	ldr r0, _02247ECC ; =0x000006A7
	bl PlaySE
	add r0, r5, #0
	mov r1, #0
	mov r2, #0x10
	mov r3, #0xc
	bl ov71_022480C0
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02247EC6
_02247E2A:
	bl ov71_02248110
	cmp r0, #0
	beq _02247EC6
	ldr r0, [r5, #0x10]
	bl sub_02008780
	ldr r0, [r5, #0x40]
	mov r1, #0
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r5, #0x40]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02247EC6
_02247E50:
	ldr r0, [r5, #0x40]
	bl sub_02024B68
	cmp r0, #0
	bne _02247EC6
	ldr r0, [r5, #0x74]
	mov r1, #1
	bl ov71_02247704
	mov r1, #0x10
	add r0, r5, #0
	mov r2, #0
	add r3, r1, #0
	bl ov71_022480C0
	add r0, r5, #0
	bl ov71_0224817C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02247EC6
_02247E7C:
	bl ov71_022481D8
	cmp r0, #2
	bge _02247E8E
	add r0, r5, #0
	bl ov71_022481C8
	cmp r0, #1
	bne _02247EC6
_02247E8E:
	mov r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x39
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02247EC6
_02247EAE:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02247EC6
	add r0, r5, #0
	bl ov71_022481C8
	cmp r0, #0
	beq _02247EC6
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_02247EC6:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_02247ECC: .word 0x000006A7
	thumb_func_end ov71_02247DEC

	thumb_func_start ov71_02247ED0
ov71_02247ED0: ; 0x02247ED0
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl NNS_G3dInit
	bl G3X_InitMtxStack
	ldr r0, _02247F78 ; =0x04000060
	ldr r2, _02247F7C ; =0xFFFFCFFD
	ldrh r1, [r0]
	and r1, r2
	strh r1, [r0]
	ldrh r3, [r0]
	add r1, r2, #2
	and r3, r1
	mov r1, #0x10
	orr r1, r3
	strh r1, [r0]
	ldrh r3, [r0]
	ldr r1, _02247F80 ; =0x0000CFFB
	and r1, r3
	strh r1, [r0]
	add r1, r2, #2
	ldrh r3, [r0]
	lsr r2, r2, #0x11
	and r3, r1
	mov r1, #8
	orr r1, r3
	strh r1, [r0]
	mov r0, #0
	add r1, r0, #0
	mov r3, #0x3f
	str r0, [sp]
	bl G3X_SetClearColor
	ldr r1, _02247F84 ; =0x04000540
	mov r0, #2
	str r0, [r1]
	ldr r0, _02247F88 ; =0xBFFF0000
	str r0, [r1, #0x40]
	mov r0, #1
	add r1, r0, #0
	bl GF_3DVramMan_InitFrameTexVramManager
	mov r0, #1
	lsl r0, r0, #0xe
	mov r1, #1
	bl GF_3DVramMan_InitFramePlttVramManager
	ldr r3, _02247F8C ; =NNS_GfdDefaultFuncAllocTexVram
	mov r0, #1
	mov r1, #0
	ldr r3, [r3]
	lsl r0, r0, #0xe
	add r2, r1, #0
	blx r3
	ldr r3, _02247F90 ; =NNS_GfdDefaultFuncAllocPlttVram
	add r4, r0, #0
	ldr r3, [r3]
	mov r0, #0x80
	mov r1, #0
	mov r2, #1
	blx r3
	ldr r2, _02247F94 ; =0x7FFF0000
	add r6, r0, #0
	and r2, r4
	lsl r1, r4, #0x10
	lsr r2, r2, #0x10
	ldr r0, [r5, #0xc]
	lsr r1, r1, #0xd
	lsl r2, r2, #4
	bl sub_020093FC
	ldr r2, _02247F98 ; =0xFFFF0000
	lsl r1, r6, #0x10
	and r2, r6
	lsr r2, r2, #0x10
	ldr r0, [r5, #0xc]
	lsr r1, r1, #0xd
	lsl r2, r2, #3
	bl sub_02009408
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02247F78: .word 0x04000060
_02247F7C: .word 0xFFFFCFFD
_02247F80: .word 0x0000CFFB
_02247F84: .word 0x04000540
_02247F88: .word 0xBFFF0000
_02247F8C: .word NNS_GfdDefaultFuncAllocTexVram
_02247F90: .word NNS_GfdDefaultFuncAllocPlttVram
_02247F94: .word 0x7FFF0000
_02247F98: .word 0xFFFF0000
	thumb_func_end ov71_02247ED0

	thumb_func_start ov71_02247F9C
ov71_02247F9C: ; 0x02247F9C
	push {r3, r4, r5, lr}
	sub sp, #0x20
	add r5, r0, #0
	ldr r0, [r5]
	bl ov71_02247390
	add r4, r0, #0
	add r0, sp, #0x10
	add r1, r4, #0
	mov r2, #2
	mov r3, #0
	bl GetBoxmonSpriteCharAndPlttNarcIds
	ldr r0, [r5]
	bl ov71_022473A8
	add r2, r0, #0
	add r0, r5, #0
	add r0, #0x80
	add r1, r5, #0
	ldr r0, [r0]
	add r1, #0x14
	mov r3, #1
	bl sub_02072914
	add r0, r4, #0
	mov r1, #2
	mov r2, #0
	bl sub_02070854
	add r3, r0, #0
	mov r1, #0
	str r1, [sp]
	add r0, r5, #0
	str r1, [sp, #4]
	add r0, #0x14
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r5, #0xc]
	add r3, #0x50
	add r1, sp, #0x10
	mov r2, #0x80
	bl sub_020085EC
	add sp, #0x20
	pop {r3, r4, r5, pc}
	thumb_func_end ov71_02247F9C

	thumb_func_start ov71_02247FF8
ov71_02247FF8: ; 0x02247FF8
	push {r4, lr}
	sub sp, #0x70
	add r4, r0, #0
	add r0, #0x44
	mov r1, #0x59
	mov r2, #7
	mov r3, #8
	bl ov71_022472C4
	add r0, sp, #0x5c
	bl NNS_G2dInitImagePaletteProxy
	add r0, sp, #0x38
	bl NNS_G2dInitImageProxy
	mov r3, #0
	str r3, [sp]
	mov r2, #1
	str r2, [sp, #4]
	str r3, [sp, #8]
	mov r0, #0x39
	str r0, [sp, #0xc]
	add r0, sp, #0x38
	str r0, [sp, #0x10]
	mov r0, #0x59
	mov r1, #9
	bl GfGfxLoader_LoadImageMapping
	mov r0, #0x39
	str r0, [sp]
	add r0, sp, #0x5c
	str r0, [sp, #4]
	mov r0, #0x59
	mov r1, #0xa
	mov r2, #1
	mov r3, #0
	bl GfGfxLoader_PartiallyLoadPalette
	mov r0, #2
	add r1, r4, #0
	str r0, [sp]
	add r0, sp, #0x14
	add r1, #0x44
	add r2, sp, #0x38
	add r3, sp, #0x5c
	bl ov71_02247320
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	add r1, sp, #0x14
	mov r2, #0x80
	mov r3, #0x64
	bl ov71_02247340
	str r0, [r4, #0x3c]
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	add r1, sp, #0x14
	mov r2, #0x80
	mov r3, #0x5a
	bl ov71_02247340
	str r0, [r4, #0x40]
	mov r1, #1
	bl sub_02024A04
	ldr r0, [r4, #0x3c]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r4, #0x40]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add sp, #0x70
	pop {r4, pc}
	thumb_func_end ov71_02247FF8

	thumb_func_start ov71_0224809C
ov71_0224809C: ; 0x0224809C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r4, #0
	add r5, r6, #0
_022480A4:
	ldr r0, [r5, #0x3c]
	cmp r0, #0
	beq _022480AE
	bl sub_02024758
_022480AE:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #2
	blt _022480A4
	add r6, #0x44
	add r0, r6, #0
	bl ov71_022472FC
	pop {r4, r5, r6, pc}
	thumb_func_end ov71_0224809C

	thumb_func_start ov71_022480C0
ov71_022480C0: ; 0x022480C0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0x39
	mov r1, #0x14
	str r2, [sp]
	add r7, r3, #0
	bl AllocFromHeap
	add r4, r0, #0
	beq _02248106
	str r5, [r4]
	lsl r0, r6, #0xc
	str r0, [r4, #4]
	ldr r0, [sp]
	lsl r1, r0, #0xc
	str r1, [r4, #8]
	ldr r0, [r4, #4]
	sub r0, r1, r0
	add r1, r7, #0
	bl _s32_div_f
	str r0, [r4, #0xc]
	ldr r0, _02248108 ; =ov71_02248140
	str r7, [r4, #0x10]
	add r1, r4, #0
	mov r2, #0
	bl sub_0200E33C
	str r0, [r5, #0x78]
	ldr r0, _0224810C ; =0x04000050
	mov r1, #1
	add r2, r6, #0
	bl G2x_SetBlendBrightness_
_02248106:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02248108: .word ov71_02248140
_0224810C: .word 0x04000050
	thumb_func_end ov71_022480C0

	thumb_func_start ov71_02248110
ov71_02248110: ; 0x02248110
	ldr r0, [r0, #0x78]
	cmp r0, #0
	bne _0224811A
	mov r0, #1
	bx lr
_0224811A:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov71_02248110

	thumb_func_start ov71_02248120
ov71_02248120: ; 0x02248120
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x78]
	cmp r0, #0
	beq _0224813C
	bl sub_0201F988
	bl ov71_02247424
	ldr r0, [r4, #0x78]
	bl DestroySysTask
	mov r0, #0
	str r0, [r4, #0x78]
_0224813C:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov71_02248120

	thumb_func_start ov71_02248140
ov71_02248140: ; 0x02248140
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4, #0x10]
	sub r0, r0, #1
	str r0, [r4, #0x10]
	cmp r0, #0
	ble _02248162
	ldr r1, [r4, #4]
	ldr r0, [r4, #0xc]
	add r2, r1, r0
	str r2, [r4, #4]
	ldr r0, _02248178 ; =0x04000050
	mov r1, #1
	asr r2, r2, #0xc
	bl G2x_SetBlendBrightness_
	pop {r4, pc}
_02248162:
	ldr r2, [r4, #8]
	ldr r0, _02248178 ; =0x04000050
	mov r1, #1
	asr r2, r2, #0xc
	bl G2x_SetBlendBrightness_
	ldr r0, [r4]
	bl ov71_02248120
	pop {r4, pc}
	nop
_02248178: .word 0x04000050
	thumb_func_end ov71_02248140

	thumb_func_start ov71_0224817C
ov71_0224817C: ; 0x0224817C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x39
	mov r1, #0x30
	bl AllocFromHeap
	add r4, r0, #0
	beq _022481BC
	str r5, [r4]
	ldr r0, [r5, #0x74]
	add r1, r4, #0
	str r0, [r4, #4]
	add r1, #8
	bl ov71_022476B4
	add r1, r4, #0
	ldr r0, [r4, #4]
	add r1, #0x14
	bl ov71_022476D4
	ldr r0, _022481C0 ; =0x00002F60
	mov r2, #0
	str r0, [r4, #0x1c]
	str r2, [r4, #0x20]
	strh r2, [r4, #0x2c]
	str r2, [r4, #0x24]
	ldr r0, _022481C4 ; =ov71_0224820C
	add r1, r4, #0
	str r2, [r4, #0x28]
	bl CreateSysTask
	str r0, [r5, #0x7c]
_022481BC:
	pop {r3, r4, r5, pc}
	nop
_022481C0: .word 0x00002F60
_022481C4: .word ov71_0224820C
	thumb_func_end ov71_0224817C

	thumb_func_start ov71_022481C8
ov71_022481C8: ; 0x022481C8
	ldr r0, [r0, #0x7c]
	cmp r0, #0
	bne _022481D2
	mov r0, #1
	bx lr
_022481D2:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov71_022481C8

	thumb_func_start ov71_022481D8
ov71_022481D8: ; 0x022481D8
	push {r3, lr}
	ldr r0, [r0, #0x7c]
	cmp r0, #0
	beq _022481E8
	bl sub_0201F988
	ldr r0, [r0, #0x20]
	pop {r3, pc}
_022481E8:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov71_022481D8

	thumb_func_start ov71_022481EC
ov71_022481EC: ; 0x022481EC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x7c]
	cmp r0, #0
	beq _02248208
	bl sub_0201F988
	bl FreeToHeap
	ldr r0, [r4, #0x7c]
	bl DestroySysTask
	mov r0, #0
	str r0, [r4, #0x7c]
_02248208:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov71_022481EC

	thumb_func_start ov71_0224820C
ov71_0224820C: ; 0x0224820C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r0, [r4, #0x24]
	cmp r0, #0
	bne _02248280
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x1c]
	add r0, r1, r0
	str r0, [r4, #0xc]
	ldr r1, [r4, #0x1c]
	cmp r1, #0
	blt _0224822E
	mov r0, #0x1e
	lsl r0, r0, #6
	sub r0, r1, r0
	str r0, [r4, #0x1c]
	b _02248280
_0224822E:
	mov r0, #0x1e
	lsl r0, r0, #6
	sub r0, r1, r0
	str r0, [r4, #0x1c]
	ldr r1, [r4, #0xc]
	ldr r0, _022482E4 ; =0xFFFFC000
	cmp r1, r0
	bgt _02248280
	str r0, [r4, #0xc]
	ldr r1, [r4, #0x1c]
	mov r0, #0x2c
	mul r0, r1
	mov r1, #0x64
	bl _s32_div_f
	neg r1, r0
	mov r0, #0xfa
	lsl r0, r0, #4
	str r1, [r4, #0x1c]
	cmp r1, r0
	bge _0224825C
	mov r0, #1
	str r0, [r4, #0x24]
_0224825C:
	ldr r0, _022482E8 ; =0x000005E6
	bl PlaySE
	ldr r0, [r4, #0x20]
	add r0, r0, #1
	str r0, [r4, #0x20]
	cmp r0, #1
	beq _02248272
	cmp r0, #3
	beq _02248278
	b _02248280
_02248272:
	mov r0, #0xb0
	strh r0, [r4, #0x2c]
	b _02248280
_02248278:
	mov r0, #0x2c
	ldrsh r0, [r4, r0]
	add r0, #0x50
	strh r0, [r4, #0x2c]
_02248280:
	mov r0, #0x14
	mov r2, #0x2c
	ldrsh r3, [r4, r0]
	ldrsh r0, [r4, r2]
	add r1, r4, #0
	add r1, #0x14
	add r0, r3, r0
	strh r0, [r4, #0x14]
	mov r0, #0x18
	ldrsh r3, [r4, r0]
	ldrsh r0, [r4, r2]
	sub r0, r3, r0
	strh r0, [r4, #0x18]
	ldr r0, [r4, #4]
	bl ov71_022476EC
	mov r2, #0x2c
	ldrsh r3, [r4, r2]
	ldr r5, [r4, #8]
	add r1, r4, #0
	lsl r0, r3, #2
	add r0, r3, r0
	add r0, r5, r0
	str r0, [r4, #8]
	ldrsh r2, [r4, r2]
	ldr r3, [r4, #0x10]
	add r1, #8
	lsl r0, r2, #2
	add r0, r2, r0
	add r0, r3, r0
	str r0, [r4, #0x10]
	ldr r0, [r4, #4]
	bl ov71_022476C4
	ldr r0, [r4, #0x24]
	cmp r0, #0
	beq _022482E2
	mov r0, #0x2c
	ldrsh r0, [r4, r0]
	sub r0, #0xe
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x28]
	add r0, r0, #1
	str r0, [r4, #0x28]
	cmp r0, #0x1e
	ble _022482E2
	ldr r0, [r4]
	bl ov71_022481EC
_022482E2:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022482E4: .word 0xFFFFC000
_022482E8: .word 0x000005E6
	thumb_func_end ov71_0224820C

	thumb_func_start ov71_022482EC
ov71_022482EC: ; 0x022482EC
	push {r3, r4, r5, lr}
	mov r1, #0x5b
	add r5, r0, #0
	mov r0, #0x39
	lsl r1, r1, #2
	bl AllocFromHeap
	add r4, r0, #0
	beq _0224834E
	str r5, [r4]
	mov r0, #0
	str r0, [r4, #4]
	add r0, r5, #0
	bl ov71_02247384
	add r1, r4, #0
	add r1, #0xc0
	str r0, [r1]
	add r0, r4, #0
	mov r1, #0
	add r0, #0xd4
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xc4
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xcc
	str r1, [r0]
	mov r0, #0x16
	lsl r0, r0, #4
	str r1, [r4, r0]
	add r0, r0, #4
	str r1, [r4, r0]
	bl MTRandom
	add r1, r4, #0
	add r1, #0xbc
	str r0, [r1]
	add r0, r4, #0
	mov r2, #0
	add r0, #0xd0
	str r2, [r0]
	mov r0, #0x5a
	lsl r0, r0, #2
	str r2, [r4, r0]
	ldr r0, _02248354 ; =ov71_02248B60
	add r1, r4, #0
	bl sub_0200E374
_0224834E:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_02248354: .word ov71_02248B60
	thumb_func_end ov71_022482EC

	thumb_func_start ov71_02248358
ov71_02248358: ; 0x02248358
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OS_DisableInterrupts
	add r4, r0, #0
	cmp r5, #0
	beq _022483A4
	add r0, r5, #0
	bl ov71_0224889C
	add r0, r5, #0
	bl ov71_022489F8
	add r0, r5, #0
	bl ov71_02248B24
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02248386
	bl DestroySysTask
_02248386:
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02248394
	bl ov71_02248E04
_02248394:
	add r0, r5, #0
	add r0, #0xbc
	ldr r0, [r0]
	bl SetMTRNGSeed
	add r0, r5, #0
	bl FreeToHeap
_022483A4:
	add r0, r4, #0
	bl OS_RestoreInterrupts
	pop {r3, r4, r5, pc}
	thumb_func_end ov71_02248358

	thumb_func_start ov71_022483AC
ov71_022483AC: ; 0x022483AC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r2, [r4]
	add r5, r0, #0
	cmp r2, #4
	bhs _022483DA
	lsl r3, r2, #2
	ldr r2, _022483E0 ; =ov71_0224BCFC
	add r1, r5, #4
	ldr r2, [r2, r3]
	blx r2
	cmp r0, #0
	beq _022483D0
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #0
	str r0, [r5, #4]
_022483D0:
	add r0, r5, #0
	bl ov71_022483E4
	mov r0, #0
	pop {r3, r4, r5, pc}
_022483DA:
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_022483E0: .word ov71_0224BCFC
	thumb_func_end ov71_022483AC

	thumb_func_start ov71_022483E4
ov71_022483E4: ; 0x022483E4
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xd4
	ldr r0, [r0]
	cmp r0, #0
	beq _02248404
	bl G3X_Reset
	add r4, #0xd4
	ldr r0, [r4]
	bl ov71_022474CC
	mov r0, #0
	add r1, r0, #0
	bl sub_02026E50
_02248404:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov71_022483E4

	thumb_func_start ov71_02248408
ov71_02248408: ; 0x02248408
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl ov71_02248604
	add r0, r4, #0
	bl ov71_022488E4
	add r0, r4, #0
	bl ov71_02248A08
	mov r0, #8
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x39
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov71_02248408

	thumb_func_start ov71_0224843C
ov71_0224843C: ; 0x0224843C
	push {r4, lr}
	add r4, r1, #0
	ldr r1, [r4]
	cmp r1, #0
	beq _0224844C
	cmp r1, #1
	beq _02248462
	b _0224847A
_0224844C:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0224847A
	ldr r0, _02248480 ; =ov71_0224C0C4
	mov r1, #0
	str r1, [r0]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0224847A
_02248462:
	ldr r1, _02248480 ; =ov71_0224C0C4
	ldr r2, [r1]
	cmp r2, #0x1e
	bge _0224846E
	add r2, r2, #1
	str r2, [r1]
_0224846E:
	add r0, #0xd0
	ldr r0, [r0]
	cmp r0, #0
	beq _0224847A
	mov r0, #1
	pop {r4, pc}
_0224847A:
	mov r0, #0
	pop {r4, pc}
	nop
_02248480: .word ov71_0224C0C4
	thumb_func_end ov71_0224843C

	thumb_func_start ov71_02248484
ov71_02248484: ; 0x02248484
	push {r3, r4, r5, lr}
	add r5, r1, #0
	ldr r1, [r5]
	add r4, r0, #0
	cmp r1, #4
	bhi _0224852A
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0224849C: ; jump table
	.short _022484A6 - _0224849C - 2 ; case 0
	.short _022484B2 - _0224849C - 2 ; case 1
	.short _022484F6 - _0224849C - 2 ; case 2
	.short _0224850C - _0224849C - 2 ; case 3
	.short _02248522 - _0224849C - 2 ; case 4
_022484A6:
	mov r0, #0
	str r0, [r4, #8]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224852A
_022484B2:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #8
	ble _0224852A
	add r0, r4, #0
	add r0, #0xd8
	ldr r0, [r0]
	mov r1, #0
	mov r2, #0x1f
	mov r3, #0x18
	bl ov71_02248E30
	add r0, r4, #0
	bl ov71_02248EB4
	mov r1, #0x16
	lsl r1, r1, #4
	str r0, [r4, r1]
	add r0, r4, #0
	add r0, #0xd8
	ldr r0, [r0]
	mov r1, #0
	bl ov71_02247708
	add r4, #0xd8
	ldr r0, [r4]
	mov r1, #1
	bl ov71_02247704
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224852A
_022484F6:
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ov71_02249260
	cmp r0, #0
	beq _0224852A
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224852A
_0224850C:
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ov71_02249254
	cmp r0, #0
	beq _0224852A
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224852A
_02248522:
	bl ov71_02248B54
	mov r0, #1
	pop {r3, r4, r5, pc}
_0224852A:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov71_02248484

	thumb_func_start ov71_02248530
ov71_02248530: ; 0x02248530
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r1, #0
	ldr r1, [r5]
	add r4, r0, #0
	cmp r1, #4
	bhi _022485F4
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0224854A: ; jump table
	.short _02248554 - _0224854A - 2 ; case 0
	.short _0224856A - _0224854A - 2 ; case 1
	.short _02248588 - _0224854A - 2 ; case 2
	.short _022485A4 - _0224854A - 2 ; case 3
	.short _022485E6 - _0224854A - 2 ; case 4
_02248554:
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ov71_0224926C
	mov r0, #0
	str r0, [r4, #8]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _022485F4
_0224856A:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #2
	ble _022485F4
	mov r0, #0
	str r0, [r4, #8]
	add r4, #0xc4
	ldr r0, [r4]
	bl ov71_02246D40
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _022485F4
_02248588:
	add r1, r4, #0
	add r1, #0xc8
	ldr r1, [r1]
	cmp r1, #0
	bne _022485F4
	mov r1, #0x59
	lsl r1, r1, #2
	add r1, r4, r1
	bl ov71_02248D0C
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _022485F4
_022485A4:
	ldr r0, [r4, #8]
	cmp r0, #0x28
	bge _022485B8
	add r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0x28
	bne _022485B8
	ldr r0, _022485FC ; =0x000006AF
	bl PlaySE
_022485B8:
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ov71_02249254
	cmp r0, #0
	beq _022485F4
	mov r0, #4
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x39
	str r0, [sp, #8]
	mov r0, #0
	ldr r3, _02248600 ; =0x00007FFF
	add r1, r0, #0
	add r2, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _022485F4
_022485E6:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _022485F4
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_022485F4:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_022485FC: .word 0x000006AF
_02248600: .word 0x00007FFF
	thumb_func_end ov71_02248530

	thumb_func_start ov71_02248604
ov71_02248604: ; 0x02248604
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r0, _02248880 ; =ov71_0224BD54
	bl GX_SetBanks
	ldr r2, _02248884 ; =0x04000304
	ldr r0, _02248888 ; =0xFFFF7FFF
	ldrh r1, [r2]
	and r0, r1
	strh r0, [r2]
	ldr r0, _0224888C ; =ov71_0224BCEC
	bl SetBothScreensModesAndDisable
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	ldr r2, _02248890 ; =ov71_0224BD1C
	mov r1, #2
	mov r3, #1
	bl InitBgFromTemplate
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	ldr r2, _02248890 ; =ov71_0224BD1C
	mov r1, #6
	mov r3, #1
	bl InitBgFromTemplate
	bl OS_DisableInterrupts
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	ldr r2, _02248894 ; =ov71_0224BD38
	mov r1, #3
	mov r3, #2
	bl InitBgFromTemplate
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	ldr r2, _02248894 ; =ov71_0224BD38
	mov r1, #7
	mov r3, #2
	bl InitBgFromTemplate
	add r0, r5, #0
	bl OS_RestoreInterrupts
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x39
	add r2, r4, #0
	str r0, [sp, #0xc]
	add r2, #0xc0
	mov r1, #2
	ldr r2, [r2]
	mov r0, #0x59
	add r3, r1, #0
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x39
	add r2, r4, #0
	str r0, [sp, #0xc]
	add r2, #0xc0
	ldr r2, [r2]
	mov r0, #0x59
	mov r1, #2
	mov r3, #6
	bl GfGfxLoader_LoadCharData
	mov r1, #0
	str r1, [sp]
	add r2, r4, #0
	str r1, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x39
	str r0, [sp, #0xc]
	add r2, #0xc0
	ldr r2, [r2]
	mov r0, #0x59
	mov r3, #2
	bl GfGfxLoader_LoadScrnData
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x39
	add r2, r4, #0
	str r0, [sp, #0xc]
	add r2, #0xc0
	ldr r2, [r2]
	mov r0, #0x59
	mov r3, #6
	bl GfGfxLoader_LoadScrnData
	ldr r0, [r4]
	bl ov71_022473A0
	add r5, r0, #0
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x39
	mov r2, #0
	str r0, [sp, #4]
	mov r0, #0x59
	mov r1, #3
	add r3, r2, #0
	bl GfGfxLoader_GXLoadPal
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x39
	str r0, [sp, #4]
	mov r0, #0x59
	mov r1, #3
	mov r2, #4
	mov r3, #0
	bl GfGfxLoader_GXLoadPal
	ldr r0, _02248898 ; =ov71_0224BCE4
	lsl r1, r5, #1
	ldrh r5, [r0, r1]
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x40
	str r0, [sp, #4]
	mov r0, #0x39
	str r0, [sp, #8]
	mov r0, #0x59
	mov r1, #3
	mov r2, #0
	add r3, r5, #0
	bl GfGfxLoader_GXLoadPalWithSrcOffset
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x40
	str r0, [sp, #4]
	mov r0, #0x39
	str r0, [sp, #8]
	mov r0, #0x59
	mov r1, #3
	mov r2, #4
	add r3, r5, #0
	bl GfGfxLoader_GXLoadPalWithSrcOffset
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x39
	add r2, r4, #0
	str r0, [sp, #0xc]
	add r2, #0xc0
	ldr r2, [r2]
	mov r0, #0x59
	mov r1, #5
	mov r3, #3
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x39
	add r2, r4, #0
	str r0, [sp, #0xc]
	add r2, #0xc0
	ldr r2, [r2]
	mov r0, #0x59
	mov r1, #5
	mov r3, #7
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x39
	add r2, r4, #0
	str r0, [sp, #0xc]
	add r2, #0xc0
	ldr r2, [r2]
	mov r0, #0x59
	mov r1, #4
	mov r3, #3
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x39
	add r2, r4, #0
	str r0, [sp, #0xc]
	add r2, #0xc0
	ldr r2, [r2]
	mov r0, #0x59
	mov r1, #4
	mov r3, #7
	bl GfGfxLoader_LoadScrnData
	mov r0, #0x39
	mov r1, #0x60
	bl AllocFromHeap
	add r5, r0, #0
	beq _0224880A
	mov r0, #0
	add r1, r5, #0
	mov r2, #0x60
	bl MIi_CpuClear32
	add r0, r5, #0
	mov r1, #0x60
	bl DC_FlushRange
	bl GX_BeginLoadBGExtPltt
	bl GXS_BeginLoadBGExtPltt
	mov r1, #6
	add r0, r5, #0
	lsl r1, r1, #0xc
	mov r2, #0x60
	bl GX_LoadBGExtPltt
	mov r1, #6
	add r0, r5, #0
	lsl r1, r1, #0xc
	mov r2, #0x60
	bl GXS_LoadBGExtPltt
	bl GX_EndLoadBGExtPltt
	bl GXS_EndLoadBGExtPltt
	add r0, r5, #0
	bl FreeToHeap
_0224880A:
	add r0, r4, #0
	add r0, #0xc0
	mov r3, #0xff
	ldr r0, [r0]
	mov r1, #6
	mov r2, #3
	mvn r3, r3
	bl BgSetPosTextAndCommit
	mov r0, #7
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	add r0, r4, #0
	add r0, #0xc0
	mov r1, #3
	ldr r0, [r0]
	add r2, r1, #0
	mov r3, #0
	bl BgSetPosTextAndCommit
	add r0, r4, #0
	add r0, #0xc8
	mov r1, #1
	bl ov71_02246C6C
	add r1, r4, #0
	add r1, #0xc4
	str r0, [r1]
	mov r0, #0x4a
	lsl r0, r0, #2
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0xd0
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0xc0
	mov r1, #0x12
	mov r2, #1
	ldr r0, [r0]
	lsl r1, r1, #6
	lsl r2, r2, #0xc
	mov r3, #1
	bl ov71_02247000
	add r4, #0xcc
	str r0, [r4]
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02248880: .word ov71_0224BD54
_02248884: .word 0x04000304
_02248888: .word 0xFFFF7FFF
_0224888C: .word ov71_0224BCEC
_02248890: .word ov71_0224BD1C
_02248894: .word ov71_0224BD38
_02248898: .word ov71_0224BCE4
	thumb_func_end ov71_02248604

	thumb_func_start ov71_0224889C
ov71_0224889C: ; 0x0224889C
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xc8
	ldr r0, [r0]
	cmp r0, #0
	beq _022488B2
	add r0, r4, #0
	add r0, #0xc4
	ldr r0, [r0]
	bl ov71_02246D54
_022488B2:
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	mov r1, #2
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	mov r1, #6
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	mov r1, #3
	bl FreeBgTilemapBuffer
	add r4, #0xc0
	ldr r0, [r4]
	mov r1, #7
	bl FreeBgTilemapBuffer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov71_0224889C

	thumb_func_start ov71_022488E4
ov71_022488E4: ; 0x022488E4
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	bl NNS_G3dInit
	bl G3X_InitMtxStack
	ldr r0, _022489C4 ; =0x04000060
	ldr r1, _022489C8 ; =0xFFFFCFFD
	ldrh r2, [r0]
	and r2, r1
	strh r2, [r0]
	ldrh r3, [r0]
	add r2, r1, #2
	and r3, r2
	mov r2, #0x10
	orr r2, r3
	strh r2, [r0]
	ldrh r3, [r0]
	ldr r2, _022489CC ; =0x0000CFFB
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
	ldr r0, _022489D0 ; =ov71_0224BD0C
	bl G3X_SetEdgeColorTable
	mov r1, #0
	ldr r0, _022489D4 ; =0x000043FF
	ldr r2, _022489D8 ; =0x00007FFF
	mov r3, #0x3f
	str r1, [sp]
	bl G3X_SetClearColor
	ldr r1, _022489DC ; =0x04000540
	mov r0, #2
	str r0, [r1]
	ldr r0, _022489E0 ; =0xBFFF0000
	str r0, [r1, #0x40]
	mov r0, #1
	add r1, r0, #0
	bl GF_3DVramMan_InitFrameTexVramManager
	mov r0, #1
	lsl r0, r0, #0xe
	mov r1, #1
	bl GF_3DVramMan_InitFramePlttVramManager
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	ldr r1, _022489E4 ; =0x04000008
	mov r0, #3
	ldrh r2, [r1]
	bic r2, r0
	strh r2, [r1]
	mov r1, #0
	mov r0, #1
	add r2, r1, #0
	add r3, r1, #0
	bl ov71_0224744C
	add r1, r4, #0
	add r1, #0xd4
	str r0, [r1]
	mov r1, #0
	ldr r0, _022489E8 ; =0xFFFC8800
	str r1, [sp]
	str r0, [sp, #4]
	str r1, [sp, #8]
	add r0, r4, #0
	str r1, [sp, #0xc]
	add r0, #0xd4
	ldr r0, [r0]
	mov r2, #0x59
	mov r3, #0x1b
	bl ov71_02247610
	add r1, r4, #0
	add r1, #0xd8
	str r0, [r1]
	ldr r1, _022489EC ; =0x0000EBE0
	ldr r0, _022489F0 ; =ov71_0224C0C4
	strh r1, [r0, #4]
	mov r1, #0
	strh r1, [r0, #6]
	strh r1, [r0, #8]
	add r0, r4, #0
	add r0, #0xd4
	ldr r0, [r0]
	ldr r1, _022489F4 ; =ov71_0224C0C8
	bl ov71_0224780C
	add r4, #0xd8
	mov r1, #7
	ldr r0, [r4]
	lsl r1, r1, #0xa
	bl ov71_02247730
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_022489C4: .word 0x04000060
_022489C8: .word 0xFFFFCFFD
_022489CC: .word 0x0000CFFB
_022489D0: .word ov71_0224BD0C
_022489D4: .word 0x000043FF
_022489D8: .word 0x00007FFF
_022489DC: .word 0x04000540
_022489E0: .word 0xBFFF0000
_022489E4: .word 0x04000008
_022489E8: .word 0xFFFC8800
_022489EC: .word 0x0000EBE0
_022489F0: .word ov71_0224C0C4
_022489F4: .word ov71_0224C0C8
	thumb_func_end ov71_022488E4

	thumb_func_start ov71_022489F8
ov71_022489F8: ; 0x022489F8
	push {r3, lr}
	add r0, #0xd4
	ldr r0, [r0]
	cmp r0, #0
	beq _02248A06
	bl ov71_02247498
_02248A06:
	pop {r3, pc}
	thumb_func_end ov71_022489F8

	thumb_func_start ov71_02248A08
ov71_02248A08: ; 0x02248A08
	push {r4, r5, r6, r7, lr}
	sub sp, #0x74
	add r7, r0, #0
	add r0, #0xc
	mov r1, #0x59
	mov r2, #0xb
	mov r3, #0xc
	bl ov71_022472C4
	add r0, sp, #0x60
	bl NNS_G2dInitImagePaletteProxy
	add r0, sp, #0x3c
	bl NNS_G2dInitImageProxy
	mov r3, #0
	str r3, [sp]
	mov r2, #1
	str r2, [sp, #4]
	str r3, [sp, #8]
	mov r0, #0x39
	str r0, [sp, #0xc]
	add r0, sp, #0x3c
	str r0, [sp, #0x10]
	mov r0, #0x59
	mov r1, #0xd
	bl GfGfxLoader_LoadImageMapping
	mov r3, #0
	str r3, [sp]
	mov r0, #2
	str r0, [sp, #4]
	str r3, [sp, #8]
	mov r0, #0x39
	str r0, [sp, #0xc]
	add r0, sp, #0x3c
	str r0, [sp, #0x10]
	mov r0, #0x59
	mov r1, #0xd
	mov r2, #1
	bl GfGfxLoader_LoadImageMapping
	mov r0, #0x39
	str r0, [sp]
	add r0, sp, #0x60
	str r0, [sp, #4]
	mov r0, #0x59
	mov r1, #0xe
	mov r2, #1
	mov r3, #0
	bl GfGfxLoader_PartiallyLoadPalette
	mov r0, #0x39
	str r0, [sp]
	add r0, sp, #0x60
	str r0, [sp, #4]
	mov r0, #0x59
	mov r1, #0xe
	mov r2, #2
	mov r3, #0
	bl GfGfxLoader_PartiallyLoadPalette
	mov r0, #1
	add r1, r7, #0
	str r0, [sp]
	add r0, sp, #0x18
	add r1, #0xc
	add r2, sp, #0x3c
	add r3, sp, #0x60
	bl ov71_02247320
	ldr r0, _02248B20 ; =0x035947D1
	bl SetMTRNGSeed
	mov r0, #0
	str r0, [sp, #0x14]
	add r4, r7, #0
_02248AA2:
	bl MTRandom
	mov r1, #0xe8
	bl _u32_div_f
	add r6, r1, #0
	add r6, #0xc
	bl MTRandom
	mov r1, #0x71
	lsl r1, r1, #2
	bl _u32_div_f
	add r5, r1, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	sub r5, #0x1c
	str r0, [sp, #4]
	ldr r0, [r7]
	add r1, sp, #0x18
	add r2, r6, #0
	add r3, r5, #0
	bl ov71_02247340
	str r0, [r4, #0x1c]
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r5, #0x38
	ldr r0, [r7]
	add r1, sp, #0x18
	add r2, r6, #0
	add r3, r5, #0
	bl ov71_02247340
	str r0, [r4, #0x20]
	ldr r0, [r4, #0x1c]
	mov r1, #0
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r4, #0x20]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r4, #0x1c]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r4, #0x20]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [sp, #0x14]
	add r4, #8
	add r0, r0, #1
	str r0, [sp, #0x14]
	cmp r0, #0x14
	blt _02248AA2
	add sp, #0x74
	pop {r4, r5, r6, r7, pc}
	nop
_02248B20: .word 0x035947D1
	thumb_func_end ov71_02248A08

	thumb_func_start ov71_02248B24
ov71_02248B24: ; 0x02248B24
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r4, #0
	add r5, r6, #0
_02248B2C:
	ldr r0, [r5, #0x1c]
	cmp r0, #0
	beq _02248B36
	bl sub_02024758
_02248B36:
	ldr r0, [r5, #0x20]
	cmp r0, #0
	beq _02248B40
	bl sub_02024758
_02248B40:
	add r4, r4, #1
	add r5, #8
	cmp r4, #0x14
	blt _02248B2C
	add r6, #0xc
	add r0, r6, #0
	bl ov71_022472FC
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov71_02248B24

	thumb_func_start ov71_02248B54
ov71_02248B54: ; 0x02248B54
	mov r1, #0x5a
	mov r2, #1
	lsl r1, r1, #2
	str r2, [r0, r1]
	bx lr
	.balign 4, 0
	thumb_func_end ov71_02248B54

	thumb_func_start ov71_02248B60
ov71_02248B60: ; 0x02248B60
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x5a
	add r4, r1, #0
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _02248BB4
	mov r1, #0
	str r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xc0
	mov r3, #0xff
	ldr r0, [r0]
	mov r1, #2
	mov r2, #3
	mvn r3, r3
	bl BgSetPosTextAndCommit
	add r4, #0xc0
	ldr r0, [r4]
	mov r1, #6
	mov r2, #3
	mov r3, #0
	bl BgSetPosTextAndCommit
	mov r0, #3
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #7
	mov r1, #1
	bl ToggleBgLayer
	ldr r2, _02248BB8 ; =0x04000304
	ldrh r1, [r2]
	lsr r0, r2, #0xb
	orr r0, r1
	strh r0, [r2]
	add r0, r5, #0
	bl DestroySysTask
_02248BB4:
	pop {r3, r4, r5, pc}
	nop
_02248BB8: .word 0x04000304
	thumb_func_end ov71_02248B60

	thumb_func_start ov71_02248BBC
ov71_02248BBC: ; 0x02248BBC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	str r5, [r2, #4]
	add r0, r2, #0
	str r1, [r0]
	mov r1, #0x52
	mov r7, #0
	lsl r1, r1, #2
	str r7, [r0, r1]
	add r1, r1, #4
	str r2, [sp]
	str r7, [r0, r1]
	add r4, r2, #0
	add r6, r2, #0
_02248BD8:
	mov r0, #0
	str r0, [r4, #8]
	ldr r0, [r5, #0x1c]
	bl sub_020248AC
	add r2, r6, #0
	add r3, r0, #0
	ldmia r3!, {r0, r1}
	add r2, #0x58
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r7, r7, #1
	str r0, [r2]
	add r4, r4, #4
	add r5, #8
	add r6, #0xc
	cmp r7, #0x14
	blt _02248BD8
	ldr r0, _02248C20 ; =ov71_02248C24
	ldr r1, [sp]
	mov r2, #0
	bl CreateSysTask
	ldr r1, [sp]
	ldr r1, [r1]
	str r0, [r1]
	ldr r0, [sp]
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #0
	bne _02248C1C
	ldr r0, [sp]
	bl FreeToHeap
_02248C1C:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02248C20: .word ov71_02248C24
	thumb_func_end ov71_02248BBC

	thumb_func_start ov71_02248C24
ov71_02248C24: ; 0x02248C24
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r1, #0
	mov r1, #0x52
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	add r0, r0, #1
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	cmp r0, #0xc
	ble _02248C58
	mov r0, #0
	str r0, [r5, r1]
	add r0, r1, #4
	ldr r0, [r5, r0]
	cmp r0, #0x14
	bge _02248C58
	lsl r0, r0, #2
	mov r2, #1
	add r0, r5, r0
	str r2, [r0, #8]
	add r0, r1, #4
	ldr r0, [r5, r0]
	add r2, r0, #1
	add r0, r1, #4
	str r2, [r5, r0]
_02248C58:
	mov r0, #0
	add r7, r5, #0
	str r0, [sp, #4]
	add r6, r5, #0
	str r5, [sp]
	add r4, r0, #0
	add r7, #0x58
_02248C66:
	mov r1, #0x21
	ldr r2, [r6, #0x5c]
	lsl r1, r1, #0xc
	add r2, r2, r1
	mov r1, #0x6a
	add r0, r6, #0
	lsl r1, r1, #0xe
	add r0, #0x5c
	str r2, [r6, #0x5c]
	cmp r2, r1
	blt _02248CA6
	mov r1, #0x71
	ldr r2, [r0]
	lsl r1, r1, #0xe
	sub r1, r2, r1
	str r1, [r0]
	ldr r0, [sp]
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _02248CA6
	ldr r0, [r5, #4]
	mov r1, #1
	add r0, r0, r4
	ldr r0, [r0, #0x1c]
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #4]
	mov r1, #1
	add r0, r0, r4
	ldr r0, [r0, #0x20]
	bl Set2dSpriteVisibleFlag
_02248CA6:
	ldr r0, [r5, #4]
	add r1, r7, #0
	add r0, r0, r4
	ldr r0, [r0, #0x1c]
	bl sub_020247D4
	add r2, r6, #0
	add r2, #0x58
	add r3, sp, #8
	ldmia r2!, {r0, r1}
	mov ip, r3
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	mov r0, #0xe
	ldr r1, [sp, #0xc]
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [sp, #0xc]
	ldr r0, [r5, #4]
	mov r1, ip
	add r0, r0, r4
	ldr r0, [r0, #0x20]
	bl sub_020247D4
	ldr r0, [sp]
	add r6, #0xc
	add r0, r0, #4
	str r0, [sp]
	ldr r0, [sp, #4]
	add r4, #8
	add r0, r0, #1
	add r7, #0xc
	str r0, [sp, #4]
	cmp r0, #0x14
	blt _02248C66
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov71_02248C24

	thumb_func_start ov71_02248CF4
ov71_02248CF4: ; 0x02248CF4
	push {r4, lr}
	add r4, r0, #0
	beq _02248D0A
	bl sub_0201F988
	ldr r0, [r0]
	mov r1, #0
	str r1, [r0]
	add r0, r4, #0
	bl DestroySysTask
_02248D0A:
	pop {r4, pc}
	thumb_func_end ov71_02248CF4

	thumb_func_start ov71_02248D0C
ov71_02248D0C: ; 0x02248D0C
	push {r4, r5, r6, lr}
	add r5, r1, #0
	mov r1, #0x17
	add r6, r0, #0
	mov r0, #0x39
	lsl r1, r1, #4
	bl AllocFromHeap
	add r4, r0, #0
	beq _02248D78
	str r6, [r4]
	add r6, #0xc0
	mov r0, #0x55
	ldr r1, [r6]
	lsl r0, r0, #2
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	mov r1, #2
	bl Bg_GetYpos
	lsl r1, r0, #0xc
	mov r0, #0x56
	lsl r0, r0, #2
	str r1, [r4, r0]
	sub r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #6
	bl Bg_GetYpos
	mov r1, #0x57
	lsl r0, r0, #0xc
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r2, #0
	add r0, r1, #4
	str r2, [r4, r0]
	add r0, r1, #0
	add r0, #8
	str r2, [r4, r0]
	add r0, r1, #0
	add r0, #0xc
	str r5, [r4, r0]
	add r1, #0x10
	str r2, [r4, r1]
	ldr r0, _02248D7C ; =ov71_02248D80
	add r1, r4, #0
	bl sub_0200E33C
	str r0, [r5]
	cmp r0, #0
	bne _02248D78
	add r0, r4, #0
	bl FreeToHeap
_02248D78:
	pop {r4, r5, r6, pc}
	nop
_02248D7C: .word ov71_02248D80
	thumb_func_end ov71_02248D0C

	thumb_func_start ov71_02248D80
ov71_02248D80: ; 0x02248D80
	push {r4, r5, r6, lr}
	mov r3, #0x59
	add r4, r1, #0
	lsl r3, r3, #2
	mov r0, #2
	ldr r1, [r4, r3]
	lsl r0, r0, #0x14
	cmp r1, r0
	bge _02248E02
	sub r0, r3, #4
	ldr r1, [r4, r0]
	add r0, r3, #0
	sub r0, #0x44
	add r1, r1, r0
	sub r0, r3, #4
	str r1, [r4, r0]
	add r5, r3, #0
	ldr r1, [r4, r3]
	ldr r0, [r4, r0]
	sub r5, #0xc
	add r0, r1, r0
	str r0, [r4, r3]
	add r0, r3, #0
	sub r0, #0x10
	ldr r5, [r4, r5]
	ldr r3, [r4, r3]
	ldr r0, [r4, r0]
	sub r3, r5, r3
	mov r1, #2
	mov r2, #3
	asr r3, r3, #0xc
	bl BgSetPosTextAndCommit
	mov r5, #0x55
	lsl r5, r5, #2
	add r3, r5, #0
	ldr r0, [r4, r5]
	add r3, #8
	add r5, #0x10
	ldr r6, [r4, r3]
	ldr r3, [r4, r5]
	mov r1, #6
	sub r3, r6, r3
	mov r2, #3
	asr r3, r3, #0xc
	bl BgSetPosTextAndCommit
	mov r1, #0x59
	lsl r1, r1, #2
	mov r0, #2
	ldr r2, [r4, r1]
	lsl r0, r0, #0x12
	cmp r2, r0
	blt _02248E02
	add r0, r1, #0
	add r0, #8
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _02248E02
	add r1, #8
	ldr r0, [r4]
	add r1, r4, r1
	add r2, r4, #4
	bl ov71_02248BBC
_02248E02:
	pop {r4, r5, r6, pc}
	thumb_func_end ov71_02248D80

	thumb_func_start ov71_02248E04
ov71_02248E04: ; 0x02248E04
	push {r3, r4, r5, lr}
	add r5, r0, #0
	beq _02248E2E
	bl sub_0201F988
	add r4, r0, #0
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	mov r2, #0
	str r2, [r1]
	add r0, r0, #4
	ldr r0, [r4, r0]
	bl ov71_02248CF4
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
_02248E2E:
	pop {r3, r4, r5, pc}
	thumb_func_end ov71_02248E04

	thumb_func_start ov71_02248E30
ov71_02248E30: ; 0x02248E30
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	add r5, r1, #0
	mov r0, #0x39
	mov r1, #0x14
	add r7, r2, #0
	add r6, r3, #0
	bl AllocFromHeap
	add r4, r0, #0
	beq _02248E70
	lsl r0, r5, #0xc
	str r0, [r4]
	lsl r1, r7, #0xc
	str r1, [r4, #8]
	ldr r0, [r4]
	sub r0, r1, r0
	add r1, r6, #0
	bl _s32_div_f
	str r0, [r4, #4]
	ldr r0, [sp]
	str r6, [r4, #0xc]
	add r1, r5, #0
	str r0, [r4, #0x10]
	bl ov71_02247708
	ldr r0, _02248E74 ; =ov71_02248E78
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
_02248E70:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02248E74: .word ov71_02248E78
	thumb_func_end ov71_02248E30

	thumb_func_start ov71_02248E78
ov71_02248E78: ; 0x02248E78
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	sub r0, r0, #1
	str r0, [r4, #0xc]
	cmp r0, #0
	ble _02248E9A
	ldr r1, [r4]
	ldr r0, [r4, #4]
	add r1, r1, r0
	str r1, [r4]
	ldr r0, [r4, #0x10]
	asr r1, r1, #0xc
	bl ov71_02247708
	pop {r3, r4, r5, pc}
_02248E9A:
	ldr r1, [r4, #8]
	ldr r0, [r4, #0x10]
	asr r1, r1, #0xc
	bl ov71_02247708
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov71_02248E78

	thumb_func_start ov71_02248EB4
ov71_02248EB4: ; 0x02248EB4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0xdc
	add r0, #0xd8
	add r1, r4, #0
	ldr r0, [r0]
	add r1, #8
	bl ov71_022476B4
	add r0, r5, #0
	add r0, #0xd8
	add r1, r4, #0
	ldr r0, [r0]
	add r1, #0x20
	bl ov71_022476D4
	add r3, r4, #0
	add r3, #8
	add r2, r4, #0
	ldmia r3!, {r0, r1}
	add r2, #0x14
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	add r0, r5, #0
	add r0, #0xd4
	ldr r0, [r0]
	str r0, [r4, #4]
	add r0, r5, #0
	add r0, #0xd8
	ldr r0, [r0]
	add r5, #0xdc
	str r0, [r5]
	ldr r0, [r4, #0xc]
	str r0, [r4, #0x28]
	ldr r1, [r4, #0xc]
	ldr r0, _02248F84 ; =0xFFFF8000
	sub r0, r0, r1
	mov r1, #0x1e
	bl _s32_div_f
	str r0, [r4, #0x2c]
	add r0, r4, #0
	mov r2, #1
	mov r1, #0x1e
	add r0, #0x80
	str r1, [r0]
	mov r1, #0
	str r1, [r4, #0x38]
	str r1, [r4, #0x3c]
	str r1, [r4, #0x40]
	add r0, r4, #0
	str r1, [r4, #0x44]
	add r0, #0x54
	strh r1, [r0]
	add r0, r4, #0
	lsl r2, r2, #0xe
	add r0, #0x56
	strh r2, [r0]
	add r0, r4, #0
	add r0, #0x5a
	strh r1, [r0]
	str r1, [r4, #0x7c]
	add r2, r4, #0
	add r0, r1, #0
_02248F38:
	add r3, r2, #0
	add r3, #0x5c
	strh r0, [r3]
	add r3, r2, #0
	add r3, #0x5e
	strh r0, [r3]
	add r3, r2, #0
	add r3, #0x60
	strh r0, [r3]
	add r3, r2, #0
	add r3, #0x62
	add r1, r1, #1
	add r2, #8
	strh r0, [r3]
	cmp r1, #3
	blt _02248F38
	mov r1, #0xd
	str r0, [r4, #0x78]
	add r0, r4, #0
	lsl r1, r1, #8
	mov r2, #0x1e
	bl ov71_02248F8C
	mov r1, #0x29
	mov r2, #5
	add r0, r4, #0
	lsl r1, r1, #0xc
	lsl r2, r2, #0xe
	mov r3, #0x1e
	bl ov71_02248FC8
	ldr r0, _02248F88 ; =ov71_02249184
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	pop {r3, r4, r5, pc}
	nop
_02248F84: .word 0xFFFF8000
_02248F88: .word ov71_02249184
	thumb_func_end ov71_02248EB4

	thumb_func_start ov71_02248F8C
ov71_02248F8C: ; 0x02248F8C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	beq _02248FBA
	mov r0, #0x56
	ldrsh r0, [r5, r0]
	add r1, r6, #0
	sub r0, r4, r0
	bl _s32_div_f
	add r1, r5, #0
	add r1, #0x5a
	strh r0, [r1]
	mov r0, #0x56
	ldrsh r1, [r5, r0]
	mov r0, #0x5a
	ldrsh r0, [r5, r0]
	add r1, r1, r0
	add r0, r5, #0
	add r0, #0x56
	strh r1, [r0]
	b _02248FBE
_02248FBA:
	add r0, #0x56
	strh r4, [r0]
_02248FBE:
	add r0, r5, #0
	add r0, #0x58
	strh r4, [r0]
	str r6, [r5, #0x74]
	pop {r4, r5, r6, pc}
	thumb_func_end ov71_02248F8C

	thumb_func_start ov71_02248FC8
ov71_02248FC8: ; 0x02248FC8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	beq _02249000
	ldr r0, [r5, #0x38]
	add r1, r7, #0
	sub r0, r4, r0
	bl _s32_div_f
	str r0, [r5, #0x40]
	ldr r0, [r5, #0x3c]
	add r1, r7, #0
	sub r0, r6, r0
	bl _s32_div_f
	str r0, [r5, #0x44]
	ldr r1, [r5, #0x38]
	ldr r0, [r5, #0x40]
	add r0, r1, r0
	str r0, [r5, #0x38]
	ldr r1, [r5, #0x3c]
	ldr r0, [r5, #0x44]
	add r0, r1, r0
	str r0, [r5, #0x3c]
	str r4, [r5, #0x48]
	str r6, [r5, #0x4c]
_02249000:
	str r7, [r5, #0x50]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov71_02248FC8

	thumb_func_start ov71_02249004
ov71_02249004: ; 0x02249004
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	beq _0224902A
	lsl r0, r4, #3
	str r0, [sp]
	add r1, r5, r0
	mov r0, #0x5c
	ldrsh r0, [r1, r0]
	add r1, r7, #0
	sub r0, r6, r0
	bl _s32_div_f
	ldr r1, [sp]
	add r1, r5, r1
	add r1, #0x5e
	strh r0, [r1]
_0224902A:
	lsl r1, r4, #3
	add r0, r5, r1
	add r0, #0x60
	strh r6, [r0]
	add r0, r5, r1
	add r0, #0x62
	strh r7, [r0]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov71_02249004

	thumb_func_start ov71_0224903C
ov71_0224903C: ; 0x0224903C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x74]
	cmp r0, #0
	beq _02249068
	sub r0, r0, #1
	str r0, [r5, #0x74]
	beq _0224905E
	mov r0, #0x56
	ldrsh r1, [r5, r0]
	mov r0, #0x5a
	ldrsh r0, [r5, r0]
	add r1, r1, r0
	add r0, r5, #0
	add r0, #0x56
	strh r1, [r0]
	b _02249068
_0224905E:
	mov r0, #0x58
	ldrsh r1, [r5, r0]
	add r0, r5, #0
	add r0, #0x56
	strh r1, [r0]
_02249068:
	mov r0, #0x54
	ldrsh r1, [r5, r0]
	mov r0, #0x56
	ldrsh r0, [r5, r0]
	add r1, r1, r0
	add r0, r5, #0
	add r0, #0x54
	strh r1, [r0]
	add r0, r5, #0
	add r0, #0x54
	ldrh r0, [r0]
	mov r1, #0xb6
	bl _s32_div_f
	add r4, r0, #0
	mov r0, #0x5a
	lsl r0, r0, #2
	cmp r4, r0
	blt _02249090
	sub r4, r4, r0
_02249090:
	ldr r0, [r5, #0x50]
	cmp r0, #0
	beq _022490B6
	ldr r1, [r5, #0x38]
	ldr r0, [r5, #0x40]
	add r0, r1, r0
	str r0, [r5, #0x38]
	ldr r1, [r5, #0x3c]
	ldr r0, [r5, #0x44]
	add r0, r1, r0
	str r0, [r5, #0x3c]
	ldr r0, [r5, #0x50]
	sub r0, r0, #1
	str r0, [r5, #0x50]
	bne _022490B6
	ldr r0, [r5, #0x48]
	str r0, [r5, #0x38]
	ldr r0, [r5, #0x4c]
	str r0, [r5, #0x3c]
_022490B6:
	lsl r0, r4, #0x10
	ldr r6, [r5, #0x38]
	lsr r0, r0, #0x10
	bl GF_CosDegNoWrap
	asr r1, r0, #0x1f
	asr r3, r6, #0x1f
	add r2, r6, #0
	bl _ll_mul
	mov r3, #2
	mov r6, #0
	lsl r3, r3, #0xa
	add r3, r0, r3
	adc r1, r6
	lsl r0, r1, #0x14
	lsr r1, r3, #0xc
	ldr r2, [r5, #8]
	orr r1, r0
	add r0, r2, r1
	str r0, [r5, #0x14]
	lsl r0, r4, #0x10
	ldr r6, [r5, #0x3c]
	lsr r0, r0, #0x10
	bl GF_SinDegNoWrap
	asr r1, r0, #0x1f
	asr r3, r6, #0x1f
	add r2, r6, #0
	bl _ll_mul
	mov r4, #2
	mov r3, #0
	lsl r4, r4, #0xa
	add r4, r0, r4
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r4, #0xc
	ldr r2, [r5, #0x10]
	orr r1, r0
	add r0, r2, r1
	str r0, [r5, #0x1c]
	mov r0, #0x22
	ldrsh r1, [r5, r0]
	mov r0, #0x56
	ldrsh r0, [r5, r0]
	mov r2, #0x5e
	mov r6, #0x60
	add r0, r1, r0
	strh r0, [r5, #0x22]
	add r0, r5, #0
	mov r1, #0x5c
_0224911E:
	add r4, r0, #0
	add r4, #0x62
	ldrh r4, [r4]
	cmp r4, #0
	beq _02249156
	add r4, r0, #0
	add r4, #0x62
	ldrh r4, [r4]
	sub r7, r4, #1
	add r4, r0, #0
	add r4, #0x62
	strh r7, [r4]
	add r4, r0, #0
	add r4, #0x62
	ldrh r4, [r4]
	cmp r4, #0
	bne _0224914A
	ldrsh r7, [r0, r6]
	add r4, r0, #0
	add r4, #0x5c
	strh r7, [r4]
	b _02249156
_0224914A:
	ldrsh r7, [r0, r1]
	ldrsh r4, [r0, r2]
	add r7, r7, r4
	add r4, r0, #0
	add r4, #0x5c
	strh r7, [r4]
_02249156:
	add r3, r3, #1
	add r0, #8
	cmp r3, #3
	blt _0224911E
	mov r0, #0x20
	ldrsh r1, [r5, r0]
	mov r0, #0x5c
	ldrsh r0, [r5, r0]
	add r0, r1, r0
	strh r0, [r5, #0x20]
	mov r0, #0x22
	ldrsh r1, [r5, r0]
	mov r0, #0x64
	ldrsh r0, [r5, r0]
	add r0, r1, r0
	strh r0, [r5, #0x22]
	mov r0, #0x24
	ldrsh r1, [r5, r0]
	mov r0, #0x6c
	ldrsh r0, [r5, r0]
	add r0, r1, r0
	strh r0, [r5, #0x24]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov71_0224903C

	thumb_func_start ov71_02249184
ov71_02249184: ; 0x02249184
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	cmp r0, #0
	beq _022491E4
	ldr r1, [r4, #0x28]
	ldr r0, [r4, #0x2c]
	add r0, r1, r0
	str r0, [r4, #0x28]
	str r0, [r4, #0x18]
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x80
	str r1, [r0]
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	cmp r0, #0
	bgt _022491E4
	mov r1, #2
	lsl r1, r1, #8
	str r1, [r4, #0x30]
	mov r0, #0
	lsl r1, r1, #5
	str r0, [r4, #0x2c]
	add r0, r4, #0
	add r2, r1, #0
	mov r3, #0x3c
	bl ov71_02248FC8
	ldr r2, _02249200 ; =0xFFFFF800
	add r0, r4, #0
	mov r1, #0
	mov r3, #0x1e
	bl ov71_02249004
	mov r0, #1
	str r0, [r4, #0x7c]
	ldr r1, _02249204 ; =ov71_02249208
	add r0, r5, #0
	bl sub_0201F984
_022491E4:
	add r0, r4, #0
	bl ov71_0224903C
	add r1, r4, #0
	ldr r0, [r4]
	add r1, #0x14
	bl ov71_022476C4
	ldr r0, [r4]
	add r4, #0x20
	add r1, r4, #0
	bl ov71_022476EC
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02249200: .word 0xFFFFF800
_02249204: .word ov71_02249208
	thumb_func_end ov71_02249184

	thumb_func_start ov71_02249208
ov71_02249208: ; 0x02249208
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4, #0x78]
	cmp r0, #0
	bne _02249252
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x30]
	add r1, r1, r0
	str r1, [r4, #0x2c]
	ldr r0, [r4, #0x28]
	add r0, r0, r1
	str r0, [r4, #0x28]
	str r0, [r4, #0x18]
	add r0, r4, #0
	bl ov71_0224903C
	add r1, r4, #0
	ldr r0, [r4]
	add r1, #0x14
	bl ov71_022476C4
	add r1, r4, #0
	ldr r0, [r4]
	add r1, #0x20
	bl ov71_022476EC
	ldr r0, [r4]
	bl ov71_02247738
	cmp r0, #0
	bne _02249252
	ldr r0, [r4]
	mov r1, #0
	bl ov71_02247704
	mov r0, #1
	str r0, [r4, #0x78]
_02249252:
	pop {r4, pc}
	thumb_func_end ov71_02249208

	thumb_func_start ov71_02249254
ov71_02249254: ; 0x02249254
	push {r3, lr}
	bl sub_0201F988
	ldr r0, [r0, #0x78]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov71_02249254

	thumb_func_start ov71_02249260
ov71_02249260: ; 0x02249260
	push {r3, lr}
	bl sub_0201F988
	ldr r0, [r0, #0x7c]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov71_02249260

	thumb_func_start ov71_0224926C
ov71_0224926C: ; 0x0224926C
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	bl sub_0201F988
	add r4, r0, #0
	mov r1, #0
	str r1, [r4, #0x78]
	add r0, sp, #0
	strh r1, [r0, #4]
	ldrh r1, [r0, #4]
	strh r1, [r0, #2]
	strh r1, [r0]
	ldr r0, [r4, #4]
	mov r1, #1
	bl ov71_0224782C
	ldr r0, [r4, #4]
	add r1, sp, #0
	bl ov71_0224780C
	ldr r1, _022492F4 ; =0x000058CC
	mov r0, #2
	lsl r0, r0, #0x12
	str r1, [r4, #0x2c]
	sub r0, r1, r0
	str r0, [r4, #0x28]
	add r0, r4, #0
	mov r1, #0
	mov r3, #0x14
	add r0, #0x80
	str r3, [r0]
	ldr r0, [r4, #0x28]
	add r2, r1, #0
	str r0, [r4, #0x18]
	add r0, r4, #0
	bl ov71_02248FC8
	mov r2, #0x56
	ldrsh r2, [r4, r2]
	add r0, r4, #0
	mov r1, #1
	neg r2, r2
	mov r3, #0x1e
	bl ov71_02249004
	mov r1, #2
	add r2, r1, #0
	add r0, r4, #0
	add r2, #0xfe
	mov r3, #0x32
	bl ov71_02249004
	mov r1, #2
	ldr r0, [r4]
	lsl r1, r1, #0xc
	bl ov71_02247730
	ldr r0, [r4]
	mov r1, #1
	bl ov71_02247704
	ldr r1, _022492F8 ; =ov71_022492FC
	add r0, r5, #0
	bl sub_0201F984
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022492F4: .word 0x000058CC
_022492F8: .word ov71_022492FC
	thumb_func_end ov71_0224926C

	thumb_func_start ov71_022492FC
ov71_022492FC: ; 0x022492FC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl ov71_0224903C
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	cmp r0, #0
	beq _0224933C
	ldr r1, [r4, #0x28]
	ldr r0, [r4, #0x2c]
	add r0, r1, r0
	str r0, [r4, #0x28]
	str r0, [r4, #0x18]
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x80
	str r1, [r0]
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	cmp r0, #0
	bne _0224933C
	ldr r1, _02249354 ; =ov71_02249358
	add r0, r5, #0
	bl sub_0201F984
_0224933C:
	add r1, r4, #0
	ldr r0, [r4]
	add r1, #0x14
	bl ov71_022476C4
	ldr r0, [r4]
	add r4, #0x20
	add r1, r4, #0
	bl ov71_022476EC
	pop {r3, r4, r5, pc}
	nop
_02249354: .word ov71_02249358
	thumb_func_end ov71_022492FC

	thumb_func_start ov71_02249358
ov71_02249358: ; 0x02249358
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl ov71_0224903C
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x80
	str r1, [r0]
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	cmp r0, #0x6e
	ble _0224939A
	ldr r1, [r4, #0x28]
	ldr r0, _022493B0 ; =0xFFFC5800
	sub r0, r0, r1
	mov r1, #0x35
	bl _s32_div_f
	str r0, [r4, #0x2c]
	add r0, r4, #0
	mov r1, #0x35
	add r0, #0x80
	str r1, [r0]
	ldr r1, _022493B4 ; =ov71_022493B8
	add r0, r5, #0
	bl sub_0201F984
_0224939A:
	add r1, r4, #0
	ldr r0, [r4]
	add r1, #0x14
	bl ov71_022476C4
	ldr r0, [r4]
	add r4, #0x20
	add r1, r4, #0
	bl ov71_022476EC
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022493B0: .word 0xFFFC5800
_022493B4: .word ov71_022493B8
	thumb_func_end ov71_02249358

	thumb_func_start ov71_022493B8
ov71_022493B8: ; 0x022493B8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl ov71_0224903C
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	cmp r0, #0
	beq _022493F8
	ldr r1, [r4, #0x28]
	ldr r0, [r4, #0x2c]
	add r0, r1, r0
	str r0, [r4, #0x28]
	str r0, [r4, #0x18]
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x80
	str r1, [r0]
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	cmp r0, #0
	bne _022493F8
	ldr r1, _02249410 ; =ov71_02249414
	add r0, r5, #0
	bl sub_0201F984
_022493F8:
	add r1, r4, #0
	ldr r0, [r4]
	add r1, #0x14
	bl ov71_022476C4
	ldr r0, [r4]
	add r4, #0x20
	add r1, r4, #0
	bl ov71_022476EC
	pop {r3, r4, r5, pc}
	nop
_02249410: .word ov71_02249414
	thumb_func_end ov71_022493B8

	thumb_func_start ov71_02249414
ov71_02249414: ; 0x02249414
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl ov71_0224903C
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x80
	str r1, [r0]
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	cmp r0, #1
	ble _02249446
	mov r0, #2
	lsl r0, r0, #0x10
	str r0, [r4, #0x2c]
	ldr r1, _0224945C ; =ov71_02249460
	add r0, r5, #0
	bl sub_0201F984
_02249446:
	add r1, r4, #0
	ldr r0, [r4]
	add r1, #0x14
	bl ov71_022476C4
	ldr r0, [r4]
	add r4, #0x20
	add r1, r4, #0
	bl ov71_022476EC
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0224945C: .word ov71_02249460
	thumb_func_end ov71_02249414

	thumb_func_start ov71_02249460
ov71_02249460: ; 0x02249460
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4, #0x78]
	cmp r0, #0
	bne _0224949C
	add r0, r4, #0
	bl ov71_0224903C
	ldr r1, [r4, #0x28]
	ldr r0, [r4, #0x2c]
	add r0, r1, r0
	str r0, [r4, #0x28]
	str r0, [r4, #0x18]
	add r1, r4, #0
	ldr r0, [r4]
	add r1, #0x14
	bl ov71_022476C4
	add r1, r4, #0
	ldr r0, [r4]
	add r1, #0x20
	bl ov71_022476EC
	ldr r0, [r4]
	bl ov71_02247738
	cmp r0, #0
	bne _0224949C
	mov r0, #1
	str r0, [r4, #0x78]
_0224949C:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov71_02249460

	thumb_func_start ov71_022494A0
ov71_022494A0: ; 0x022494A0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x39
	mov r1, #0xa4
	bl AllocFromHeap
	add r4, r0, #0
	beq _022494CA
	str r5, [r4]
	mov r0, #0
	str r0, [r4, #4]
	add r0, r5, #0
	bl ov71_02247384
	str r0, [r4, #0x24]
	mov r0, #0
	str r0, [r4, #0x28]
	add r0, r4, #0
	add r0, #0x34
	bl ov71_02249988
_022494CA:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov71_022494A0

	thumb_func_start ov71_022494D0
ov71_022494D0: ; 0x022494D0
	push {r4, lr}
	add r4, r0, #0
	beq _022494FE
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	add r0, r4, #0
	bl ov71_022497C8
	add r0, r4, #0
	bl ov71_022498E0
	add r0, r4, #0
	bl ov71_02249970
	add r0, r4, #0
	add r0, #0x34
	bl ov71_02249990
	add r0, r4, #0
	bl FreeToHeap
_022494FE:
	pop {r4, pc}
	thumb_func_end ov71_022494D0

	thumb_func_start ov71_02249500
ov71_02249500: ; 0x02249500
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r2, [r4]
	add r5, r0, #0
	cmp r2, #2
	bhs _0224952E
	lsl r3, r2, #2
	ldr r2, _02249534 ; =ov71_0224BD7C
	add r1, r5, #4
	ldr r2, [r2, r3]
	blx r2
	cmp r0, #0
	beq _02249524
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #0
	str r0, [r5, #4]
_02249524:
	add r0, r5, #0
	bl ov71_02249538
	mov r0, #0
	pop {r3, r4, r5, pc}
_0224952E:
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_02249534: .word ov71_0224BD7C
	thumb_func_end ov71_02249500

	thumb_func_start ov71_02249538
ov71_02249538: ; 0x02249538
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x28]
	cmp r0, #0
	beq _02249554
	bl G3X_Reset
	ldr r0, [r4, #0x28]
	bl ov71_022474CC
	mov r0, #0
	add r1, r0, #0
	bl sub_02026E50
_02249554:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov71_02249538

	thumb_func_start ov71_02249558
ov71_02249558: ; 0x02249558
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl ov71_02249670
	add r0, r4, #0
	bl ov71_022497E0
	add r0, r4, #0
	bl ov71_022498F0
	mov r2, #0
	ldr r0, _02249598 ; =ov71_02249C98
	add r1, r4, #0
	str r2, [r4, #0xc]
	bl sub_0200E374
	mov r0, #3
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x39
	str r0, [sp, #8]
	ldr r3, _0224959C ; =0x00007FFF
	mov r0, #0
	add r2, r1, #0
	bl BeginNormalPaletteFade
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_02249598: .word ov71_02249C98
_0224959C: .word 0x00007FFF
	thumb_func_end ov71_02249558

	thumb_func_start ov71_022495A0
ov71_022495A0: ; 0x022495A0
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4]
	cmp r0, #4
	bhi _0224965C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022495BA: ; jump table
	.short _022495C4 - _022495BA - 2 ; case 0
	.short _022495D0 - _022495BA - 2 ; case 1
	.short _022495FA - _022495BA - 2 ; case 2
	.short _02249624 - _022495BA - 2 ; case 3
	.short _0224964E - _022495BA - 2 ; case 4
_022495C4:
	mov r0, #0
	str r0, [r5, #8]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0224965C
_022495D0:
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	cmp r0, #0xa
	ble _0224965C
	ldr r0, _02249664 ; =0x000006AB
	bl PlaySE
	add r1, r5, #0
	add r0, r5, #0
	add r1, #0x34
	bl ov71_022499A4
	ldr r0, [r5, #0x2c]
	mov r1, #1
	bl ov71_02247704
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0224965C
_022495FA:
	add r0, r5, #0
	add r0, #0x34
	bl ov71_02249A50
	cmp r0, #0
	beq _0224965C
	ldr r0, _02249668 ; =0x000006AC
	bl PlaySE
	ldr r0, [r5, #0x20]
	mov r1, #3
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r5, #0x20]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0224965C
_02249624:
	ldr r0, [r5, #0x20]
	bl sub_02024B68
	cmp r0, #0
	bne _0224965C
	mov r0, #0x10
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x39
	str r0, [sp, #8]
	mov r0, #0
	ldr r3, _0224966C ; =0x00007FFF
	add r1, r0, #0
	add r2, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0224965C
_0224964E:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0224965C
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_0224965C:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02249664: .word 0x000006AB
_02249668: .word 0x000006AC
_0224966C: .word 0x00007FFF
	thumb_func_end ov71_022495A0

	thumb_func_start ov71_02249670
ov71_02249670: ; 0x02249670
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r4, r0, #0
	ldr r0, _022497B4 ; =ov71_0224BDC0
	bl GX_SetBanks
	ldr r2, _022497B8 ; =0x04000304
	ldr r0, _022497BC ; =0xFFFF7FFF
	ldrh r1, [r2]
	and r0, r1
	strh r0, [r2]
	ldr r0, _022497C0 ; =ov71_0224BD84
	bl SetBothScreensModesAndDisable
	ldr r0, [r4, #0x24]
	ldr r2, _022497C4 ; =ov71_0224BDA4
	mov r1, #3
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x24]
	ldr r2, _022497C4 ; =ov71_0224BDA4
	mov r1, #7
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4]
	bl ov71_022473A0
	cmp r0, #3
	bhi _022496C2
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022496BA: ; jump table
	.short _022496C2 - _022496BA - 2 ; case 0
	.short _022496CE - _022496BA - 2 ; case 1
	.short _022496DA - _022496BA - 2 ; case 2
	.short _022496E6 - _022496BA - 2 ; case 3
_022496C2:
	mov r0, #0xf
	str r0, [sp, #0x10]
	mov r7, #0x10
	mov r6, #0x11
	mov r5, #0
	b _022496F0
_022496CE:
	mov r0, #0xf
	str r0, [sp, #0x10]
	mov r7, #0x10
	mov r6, #0x11
	mov r5, #0x20
	b _022496F0
_022496DA:
	mov r0, #0xf
	str r0, [sp, #0x10]
	mov r7, #0x10
	mov r6, #0x11
	mov r5, #0x40
	b _022496F0
_022496E6:
	mov r0, #0x18
	str r0, [sp, #0x10]
	mov r7, #0x19
	mov r6, #0x1a
	mov r5, #0
_022496F0:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x24]
	mov r0, #0x59
	add r1, r7, #0
	mov r3, #3
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x24]
	mov r0, #0x59
	add r1, r7, #0
	mov r3, #7
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x39
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	ldr r2, [r4, #0x24]
	mov r0, #0x59
	mov r3, #3
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x39
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	ldr r2, [r4, #0x24]
	mov r0, #0x59
	mov r3, #7
	bl GfGfxLoader_LoadScrnData
	mov r2, #0
	str r2, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x39
	str r0, [sp, #8]
	mov r0, #0x59
	add r1, r6, #0
	add r3, r5, #0
	bl GfGfxLoader_GXLoadPalWithSrcOffset
	mov r0, #0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x39
	str r0, [sp, #8]
	mov r0, #0x59
	add r1, r6, #0
	mov r2, #4
	add r3, r5, #0
	bl GfGfxLoader_GXLoadPalWithSrcOffset
	mov r1, #3
	add r3, r1, #0
	ldr r0, [r4, #0x24]
	add r2, r1, #0
	add r3, #0xfd
	bl BgSetPosTextAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #7
	mov r2, #3
	mov r3, #0
	bl BgSetPosTextAndCommit
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022497B4: .word ov71_0224BDC0
_022497B8: .word 0x04000304
_022497BC: .word 0xFFFF7FFF
_022497C0: .word ov71_0224BD84
_022497C4: .word ov71_0224BDA4
	thumb_func_end ov71_02249670

	thumb_func_start ov71_022497C8
ov71_022497C8: ; 0x022497C8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x24]
	mov r1, #3
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x24]
	mov r1, #7
	bl FreeBgTilemapBuffer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov71_022497C8

	thumb_func_start ov71_022497E0
ov71_022497E0: ; 0x022497E0
	push {r3, r4, lr}
	sub sp, #0x24
	add r4, r0, #0
	bl NNS_G3dInit
	bl G3X_InitMtxStack
	ldr r0, _022498B4 ; =0x04000060
	ldr r1, _022498B8 ; =0xFFFFCFFD
	ldrh r2, [r0]
	and r2, r1
	strh r2, [r0]
	ldrh r3, [r0]
	add r2, r1, #2
	and r3, r2
	mov r2, #0x10
	orr r2, r3
	strh r2, [r0]
	ldrh r3, [r0]
	ldr r2, _022498BC ; =0x0000CFFB
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
	ldr r0, _022498C0 ; =ov71_0224BD94
	bl G3X_SetEdgeColorTable
	mov r1, #0
	ldr r0, _022498C4 ; =0x000043FF
	ldr r2, _022498C8 ; =0x00007FFF
	mov r3, #0x3f
	str r1, [sp]
	bl G3X_SetClearColor
	ldr r1, _022498CC ; =0x04000540
	mov r0, #2
	str r0, [r1]
	ldr r0, _022498D0 ; =0xBFFF0000
	str r0, [r1, #0x40]
	mov r0, #1
	add r1, r0, #0
	bl GF_3DVramMan_InitFrameTexVramManager
	mov r0, #1
	lsl r0, r0, #0xe
	mov r1, #1
	bl GF_3DVramMan_InitFramePlttVramManager
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	ldr r1, _022498D4 ; =0x04000008
	mov r0, #3
	ldrh r2, [r1]
	bic r2, r0
	strh r2, [r1]
	mov r1, #0
	mov r0, #1
	add r2, r1, #0
	add r3, r1, #0
	bl ov71_0224744C
	str r0, [r4, #0x28]
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r4, #0x28]
	mov r2, #0x59
	mov r3, #0x1b
	bl ov71_02247610
	ldr r1, _022498D8 ; =0x000018E3
	str r0, [r4, #0x2c]
	add r0, sp, #0x10
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	ldr r0, [r4, #0x28]
	add r1, sp, #0x10
	bl ov71_0224780C
	ldr r0, [r4, #0x28]
	ldr r1, _022498DC ; =0x000007D2
	bl ov71_0224783C
	ldr r0, [r4, #0x28]
	add r1, sp, #0x18
	bl ov71_022477EC
	add sp, #0x24
	pop {r3, r4, pc}
	nop
_022498B4: .word 0x04000060
_022498B8: .word 0xFFFFCFFD
_022498BC: .word 0x0000CFFB
_022498C0: .word ov71_0224BD94
_022498C4: .word 0x000043FF
_022498C8: .word 0x00007FFF
_022498CC: .word 0x04000540
_022498D0: .word 0xBFFF0000
_022498D4: .word 0x04000008
_022498D8: .word 0x000018E3
_022498DC: .word 0x000007D2
	thumb_func_end ov71_022497E0

	thumb_func_start ov71_022498E0
ov71_022498E0: ; 0x022498E0
	push {r3, lr}
	ldr r0, [r0, #0x28]
	cmp r0, #0
	beq _022498EC
	bl ov71_02247498
_022498EC:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov71_022498E0

	thumb_func_start ov71_022498F0
ov71_022498F0: ; 0x022498F0
	push {r4, lr}
	sub sp, #0x70
	add r4, r0, #0
	add r0, #0x10
	mov r1, #0x59
	mov r2, #7
	mov r3, #8
	bl ov71_022472C4
	add r0, sp, #0x5c
	bl NNS_G2dInitImagePaletteProxy
	add r0, sp, #0x38
	bl NNS_G2dInitImageProxy
	mov r3, #0
	str r3, [sp]
	mov r2, #1
	str r2, [sp, #4]
	str r3, [sp, #8]
	mov r0, #0x39
	str r0, [sp, #0xc]
	add r0, sp, #0x38
	str r0, [sp, #0x10]
	mov r0, #0x59
	mov r1, #9
	bl GfGfxLoader_LoadImageMapping
	mov r0, #0x39
	str r0, [sp]
	add r0, sp, #0x5c
	str r0, [sp, #4]
	mov r0, #0x59
	mov r1, #0xa
	mov r2, #1
	mov r3, #0
	bl GfGfxLoader_PartiallyLoadPalette
	mov r0, #0
	add r1, r4, #0
	str r0, [sp]
	add r0, sp, #0x14
	add r1, #0x10
	add r2, sp, #0x38
	add r3, sp, #0x5c
	bl ov71_02247320
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	add r1, sp, #0x14
	mov r2, #0x80
	mov r3, #0x60
	bl ov71_02247340
	mov r1, #0
	str r0, [r4, #0x20]
	bl Set2dSpriteVisibleFlag
	add sp, #0x70
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov71_022498F0

	thumb_func_start ov71_02249970
ov71_02249970: ; 0x02249970
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _0224997E
	bl sub_02024758
_0224997E:
	add r4, #0x10
	add r0, r4, #0
	bl ov71_022472FC
	pop {r4, pc}
	thumb_func_end ov71_02249970

	thumb_func_start ov71_02249988
ov71_02249988: ; 0x02249988
	mov r1, #0
	str r1, [r0, #4]
	bx lr
	.balign 4, 0
	thumb_func_end ov71_02249988

	thumb_func_start ov71_02249990
ov71_02249990: ; 0x02249990
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _022499A2
	bl DestroySysTask
	mov r0, #0
	str r0, [r4, #4]
_022499A2:
	pop {r4, pc}
	thumb_func_end ov71_02249990

	thumb_func_start ov71_022499A4
ov71_022499A4: ; 0x022499A4
	push {r4, lr}
	add r4, r1, #0
	str r0, [r4]
	ldr r1, [r0, #0x2c]
	ldr r2, _02249A34 ; =0xFFFFD870
	str r1, [r4, #0xc]
	ldr r0, [r0, #0x28]
	ldr r1, _02249A38 ; =0xFFF50E00
	str r0, [r4, #8]
	mov r0, #0
	str r0, [r4, #0x10]
	str r1, [r4, #0x14]
	mov r1, #0xe2
	lsl r1, r1, #0xc
	str r1, [r4, #0x18]
	add r1, r4, #0
	add r1, #0x6c
	strh r2, [r1]
	add r1, r4, #0
	ldr r2, _02249A3C ; =0xFFFFF550
	add r1, #0x6e
	strh r2, [r1]
	ldr r1, _02249A40 ; =0x000134C4
	str r1, [r4, #0x3c]
	ldr r1, _02249A44 ; =0xFFFF4D56
	str r1, [r4, #0x40]
	str r0, [r4, #0x60]
	str r0, [r4, #0x64]
	mov r1, #2
	str r0, [r4, #0x68]
	lsl r1, r1, #0xc
	strh r1, [r4, #0x34]
	ldr r1, _02249A48 ; =0xFFFFE000
	strh r1, [r4, #0x36]
	strh r0, [r4, #0x38]
	add r1, r4, #0
	ldr r0, [r4, #0xc]
	add r1, #0x34
	bl ov71_022476EC
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [r4, #0x54]
	mov r0, #0x4a
	lsl r0, r0, #0xa
	str r0, [r4, #0x44]
	mov r0, #0x63
	lsl r0, r0, #0xa
	str r0, [r4, #0x48]
	mov r0, #0
	str r0, [r4, #0x5c]
	add r0, r4, #0
	bl ov71_02249A98
	add r1, r4, #0
	ldr r0, [r4, #0xc]
	add r1, #0x28
	bl ov71_022476C4
	add r1, r4, #0
	ldr r0, [r4, #0xc]
	add r1, #0x34
	bl ov71_022476D4
	ldr r0, _02249A4C ; =ov71_02249B64
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	str r0, [r4, #4]
	pop {r4, pc}
	nop
_02249A34: .word 0xFFFFD870
_02249A38: .word 0xFFF50E00
_02249A3C: .word 0xFFFFF550
_02249A40: .word 0x000134C4
_02249A44: .word 0xFFFF4D56
_02249A48: .word 0xFFFFE000
_02249A4C: .word ov71_02249B64
	thumb_func_end ov71_022499A4

	thumb_func_start ov71_02249A50
ov71_02249A50: ; 0x02249A50
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _02249A5A
	mov r0, #1
	bx lr
_02249A5A:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov71_02249A50

	thumb_func_start ov71_02249A60
ov71_02249A60: ; 0x02249A60
	push {r3, r4, r5, r6, r7, lr}
	ldr r4, [sp, #0x18]
	add r5, r0, #0
	add r6, r2, #0
	add r7, r3, #0
	cmp r4, #0
	beq _02249A96
	ldr r0, [r5, #0x44]
	sub r0, r1, r0
	add r1, r4, #0
	bl _s32_div_f
	str r0, [r5, #0x4c]
	ldr r0, [r5, #0x48]
	add r1, r4, #0
	sub r0, r6, r0
	bl _s32_div_f
	str r0, [r5, #0x50]
	ldr r0, [r5, #0x54]
	add r1, r4, #0
	sub r0, r7, r0
	bl _s32_div_f
	str r0, [r5, #0x58]
	ldr r0, [sp, #0x18]
	str r0, [r5, #0x5c]
_02249A96:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov71_02249A60

	thumb_func_start ov71_02249A98
ov71_02249A98: ; 0x02249A98
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x6c
	ldrh r0, [r0]
	mov r1, #0xb6
	bl _s32_div_f
	add r4, r0, #0
	mov r0, #0x5a
	lsl r0, r0, #2
	cmp r4, r0
	blt _02249AB2
	sub r4, r4, r0
_02249AB2:
	mov r0, #0x6c
	ldrsh r1, [r5, r0]
	mov r0, #0x6e
	ldrsh r0, [r5, r0]
	add r1, r1, r0
	add r0, r5, #0
	add r0, #0x6c
	strh r1, [r0]
	ldr r0, [r5, #0x5c]
	cmp r0, #0
	beq _02249AEC
	ldr r1, [r5, #0x44]
	ldr r0, [r5, #0x4c]
	add r0, r1, r0
	str r0, [r5, #0x44]
	ldr r1, [r5, #0x48]
	ldr r0, [r5, #0x50]
	add r0, r1, r0
	str r0, [r5, #0x48]
	ldr r1, [r5, #0x54]
	ldr r0, [r5, #0x58]
	add r1, r1, r0
	str r1, [r5, #0x54]
	ldr r0, [r5, #0xc]
	bl ov71_02247730
	ldr r0, [r5, #0x5c]
	sub r0, r0, #1
	str r0, [r5, #0x5c]
_02249AEC:
	lsl r0, r4, #0x10
	ldr r6, [r5, #0x44]
	lsr r0, r0, #0x10
	bl GF_CosDegNoWrap
	asr r1, r0, #0x1f
	asr r3, r6, #0x1f
	add r2, r6, #0
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	str r1, [r5, #0x1c]
	lsl r0, r4, #0x10
	ldr r6, [r5, #0x48]
	lsr r0, r0, #0x10
	bl GF_SinDegNoWrap
	asr r1, r0, #0x1f
	asr r3, r6, #0x1f
	add r2, r6, #0
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	str r1, [r5, #0x20]
	add r1, r5, #0
	str r3, [r5, #0x24]
	mov r0, #0x34
	ldrsh r2, [r5, r0]
	mov r0, #3
	lsl r0, r0, #8
	add r0, r2, r0
	strh r0, [r5, #0x34]
	ldr r0, [r5, #0xc]
	add r1, #0x34
	bl ov71_022476EC
	add r0, r5, #0
	add r1, r5, #0
	add r5, #0x28
	add r0, #0x1c
	add r1, #0x10
	add r2, r5, #0
	bl VEC_Add
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov71_02249A98

	thumb_func_start ov71_02249B64
ov71_02249B64: ; 0x02249B64
	push {r3, r4, lr}
	sub sp, #4
	add r4, r1, #0
	ldr r1, [r4, #0x68]
	cmp r1, #0x3c
	bge _02249B74
	add r1, r1, #1
	str r1, [r4, #0x68]
_02249B74:
	ldr r1, [r4, #0x60]
	cmp r1, #4
	bls _02249B7C
	b _02249C8C
_02249B7C:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02249B88: ; jump table
	.short _02249B92 - _02249B88 - 2 ; case 0
	.short _02249BC6 - _02249B88 - 2 ; case 1
	.short _02249C04 - _02249B88 - 2 ; case 2
	.short _02249C4A - _02249B88 - 2 ; case 3
	.short _02249C7A - _02249B88 - 2 ; case 4
_02249B92:
	ldr r1, [r4, #0x14]
	ldr r0, [r4, #0x3c]
	add r0, r1, r0
	str r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	ldr r0, [r4, #0x40]
	add r0, r1, r0
	str r0, [r4, #0x18]
	add r0, r4, #0
	bl ov71_02249A98
	add r1, r4, #0
	ldr r0, [r4, #0xc]
	add r1, #0x28
	bl ov71_022476C4
	ldr r0, [r4, #0xc]
	bl ov71_02247738
	cmp r0, #0
	beq _02249C8C
	ldr r0, [r4, #0x60]
	add sp, #4
	add r0, r0, #1
	str r0, [r4, #0x60]
	pop {r3, r4, pc}
_02249BC6:
	ldr r0, [r4, #0xc]
	bl ov71_02247738
	cmp r0, #0
	bne _02249BE0
	ldr r0, [r4]
	bl ov71_02249C90
	ldr r0, [r4, #0x60]
	add sp, #4
	add r0, r0, #1
	str r0, [r4, #0x60]
	pop {r3, r4, pc}
_02249BE0:
	ldr r1, [r4, #0x14]
	ldr r0, [r4, #0x3c]
	add r0, r1, r0
	str r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	ldr r0, [r4, #0x40]
	add r0, r1, r0
	str r0, [r4, #0x18]
	add r0, r4, #0
	bl ov71_02249A98
	ldr r0, [r4, #0xc]
	add r4, #0x28
	add r1, r4, #0
	bl ov71_022476C4
	add sp, #4
	pop {r3, r4, pc}
_02249C04:
	ldr r1, [r4, #0x14]
	ldr r0, [r4, #0x3c]
	add r0, r1, r0
	str r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	ldr r0, [r4, #0x40]
	add r0, r1, r0
	str r0, [r4, #0x18]
	add r0, r4, #0
	bl ov71_02249A98
	add r1, r4, #0
	ldr r0, [r4, #0xc]
	add r1, #0x28
	bl ov71_022476C4
	ldr r0, [r4, #0x68]
	cmp r0, #0x3c
	blt _02249C8C
	mov r1, #2
	lsl r1, r1, #0xa
	mov r0, #0xc
	str r0, [sp]
	add r0, r4, #0
	add r2, r1, #0
	lsr r3, r1, #2
	bl ov71_02249A60
	mov r0, #0
	str r0, [r4, #0x64]
	ldr r0, [r4, #0x60]
	add sp, #4
	add r0, r0, #1
	str r0, [r4, #0x60]
	pop {r3, r4, pc}
_02249C4A:
	add r0, r4, #0
	bl ov71_02249A98
	add r1, r4, #0
	ldr r0, [r4, #0xc]
	add r1, #0x28
	bl ov71_022476C4
	ldr r0, [r4, #0x64]
	add r0, r0, #1
	str r0, [r4, #0x64]
	cmp r0, #0xc
	blt _02249C8C
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl ov71_02247704
	mov r0, #0
	str r0, [r4, #0x64]
	ldr r0, [r4, #0x60]
	add sp, #4
	add r0, r0, #1
	str r0, [r4, #0x60]
	pop {r3, r4, pc}
_02249C7A:
	ldr r1, [r4, #0x64]
	add r1, r1, #1
	str r1, [r4, #0x64]
	cmp r1, #8
	ble _02249C8C
	mov r1, #0
	str r1, [r4, #4]
	bl DestroySysTask
_02249C8C:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov71_02249B64

	thumb_func_start ov71_02249C90
ov71_02249C90: ; 0x02249C90
	mov r1, #1
	str r1, [r0, #0xc]
	bx lr
	.balign 4, 0
	thumb_func_end ov71_02249C90

	thumb_func_start ov71_02249C98
ov71_02249C98: ; 0x02249C98
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _02249CE4
	mov r3, #0
	ldr r1, _02249CE8 ; =0x00001150
	str r3, [r4, #0xc]
	add r0, sp, #0
	strh r1, [r0]
	strh r3, [r0, #2]
	strh r3, [r0, #4]
	mov r1, #3
	ldr r0, [r4, #0x24]
	add r2, r1, #0
	bl BgSetPosTextAndCommit
	mov r2, #3
	add r3, r2, #0
	ldr r0, [r4, #0x24]
	mov r1, #7
	add r3, #0xfd
	bl BgSetPosTextAndCommit
	ldr r0, [r4, #0x28]
	add r1, sp, #0
	bl ov71_0224781C
	ldr r2, _02249CEC ; =0x04000304
	ldrh r1, [r2]
	lsr r0, r2, #0xb
	orr r0, r1
	strh r0, [r2]
	add r0, r5, #0
	bl DestroySysTask
_02249CE4:
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02249CE8: .word 0x00001150
_02249CEC: .word 0x04000304
	thumb_func_end ov71_02249C98

	thumb_func_start ov71_02249CF0
ov71_02249CF0: ; 0x02249CF0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x39
	mov r1, #0x24
	bl AllocFromHeap
	add r4, r0, #0
	beq _02249D0E
	str r5, [r4]
	mov r0, #0
	str r0, [r4, #4]
	add r0, r5, #0
	bl ov71_02247384
	str r0, [r4, #0xc]
_02249D0E:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov71_02249CF0

	thumb_func_start ov71_02249D14
ov71_02249D14: ; 0x02249D14
	push {r4, lr}
	add r4, r0, #0
	beq _02249D24
	bl ov71_0224A080
	add r0, r4, #0
	bl FreeToHeap
_02249D24:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov71_02249D14

	thumb_func_start ov71_02249D28
ov71_02249D28: ; 0x02249D28
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r2, [r4]
	add r5, r0, #0
	cmp r2, #2
	bhs _02249D50
	lsl r3, r2, #2
	ldr r2, _02249D54 ; =ov71_0224BDE8
	add r1, r5, #4
	ldr r2, [r2, r3]
	blx r2
	cmp r0, #0
	beq _02249D4C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #0
	str r0, [r5, #4]
_02249D4C:
	mov r0, #0
	pop {r3, r4, r5, pc}
_02249D50:
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02249D54: .word ov71_0224BDE8
	thumb_func_end ov71_02249D28

	thumb_func_start ov71_02249D58
ov71_02249D58: ; 0x02249D58
	push {lr}
	sub sp, #0xc
	bl ov71_02249E6C
	mov r0, #8
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x39
	str r0, [sp, #8]
	ldr r3, _02249D7C ; =0x00007FFF
	mov r0, #0
	add r2, r1, #0
	bl BeginNormalPaletteFade
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
_02249D7C: .word 0x00007FFF
	thumb_func_end ov71_02249D58

	thumb_func_start ov71_02249D80
ov71_02249D80: ; 0x02249D80
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _02249D98
	cmp r0, #1
	beq _02249DCA
	cmp r0, #2
	beq _02249DF6
	b _02249E04
_02249D98:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02249E04
	ldr r0, _02249E0C ; =0xFFE80000
	mov r2, #0
	str r0, [r5, #0x10]
	mov r0, #5
	lsl r0, r0, #0x10
	str r0, [r5, #0x14]
	ldr r0, _02249E10 ; =0x00005999
	add r1, r5, #0
	str r0, [r5, #0x18]
	ldr r0, _02249E14 ; =0xFFFFDDDE
	str r0, [r5, #0x1c]
	mov r0, #0x3c
	str r0, [r5, #8]
	ldr r0, _02249E18 ; =ov71_02249E24
	str r2, [r5, #0x20]
	bl sub_0200E33C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02249E04
_02249DCA:
	ldr r0, [r5, #0x20]
	cmp r0, #0
	beq _02249E04
	ldr r0, _02249E1C ; =0x000006A8
	bl PlaySE
	mov r0, #0x10
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x39
	str r0, [sp, #8]
	mov r0, #0
	ldr r3, _02249E20 ; =0x00007FFF
	add r1, r0, #0
	add r2, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02249E04
_02249DF6:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02249E04
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_02249E04:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02249E0C: .word 0xFFE80000
_02249E10: .word 0x00005999
_02249E14: .word 0xFFFFDDDE
_02249E18: .word ov71_02249E24
_02249E1C: .word 0x000006A8
_02249E20: .word 0x00007FFF
	thumb_func_end ov71_02249D80

	thumb_func_start ov71_02249E24
ov71_02249E24: ; 0x02249E24
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _02249E52
	sub r0, r0, #1
	str r0, [r4, #8]
	ldr r1, [r4, #0x10]
	ldr r0, [r4, #0x18]
	add r0, r1, r0
	str r0, [r4, #0x10]
	ldr r1, [r4, #0x14]
	ldr r0, [r4, #0x1c]
	add r2, r1, r0
	str r2, [r4, #0x14]
	ldr r1, [r4, #0x10]
	ldr r0, [r4, #0xc]
	asr r1, r1, #0xc
	asr r2, r2, #0xc
	bl ov71_0224A0B8
	pop {r3, r4, r5, pc}
_02249E52:
	mov r1, #0x2f
	mvn r1, r1
	ldr r0, [r4, #0xc]
	add r2, r1, #0
	bl ov71_0224A0B8
	mov r0, #1
	str r0, [r4, #0x20]
	add r0, r5, #0
	bl DestroySysTask
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov71_02249E24

	thumb_func_start ov71_02249E6C
ov71_02249E6C: ; 0x02249E6C
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r0, _0224A064 ; =ov71_0224BE54
	bl GX_SetBanks
	ldr r2, _0224A068 ; =0x04000304
	ldrh r1, [r2]
	lsr r0, r2, #0xb
	orr r0, r1
	strh r0, [r2]
	ldr r0, _0224A06C ; =ov71_0224BDF0
	bl SetBothScreensModesAndDisable
	ldr r0, [r4, #0xc]
	ldr r2, _0224A070 ; =ov71_0224BE00
	mov r1, #1
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0xc]
	ldr r2, _0224A070 ; =ov71_0224BE00
	mov r1, #5
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0xc]
	ldr r2, _0224A074 ; =ov71_0224BE1C
	mov r1, #2
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0xc]
	ldr r2, _0224A078 ; =ov71_0224BE38
	mov r1, #3
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0xc]
	ldr r2, _0224A078 ; =ov71_0224BE38
	mov r1, #7
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0xc]
	mov r0, #0x59
	mov r1, #0x13
	mov r3, #3
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0xc]
	mov r0, #0x59
	mov r1, #0x13
	mov r3, #7
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0xc]
	mov r0, #0x59
	mov r1, #0x12
	mov r3, #3
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0xc]
	mov r0, #0x59
	mov r1, #0x12
	mov r3, #7
	bl GfGfxLoader_LoadScrnData
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x39
	mov r2, #0
	str r0, [sp, #4]
	mov r0, #0x59
	mov r1, #0x14
	add r3, r2, #0
	bl GfGfxLoader_GXLoadPal
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x39
	str r0, [sp, #4]
	mov r0, #0x59
	mov r1, #0x14
	mov r2, #4
	mov r3, #0
	bl GfGfxLoader_GXLoadPal
	mov r0, #0xc8
	str r0, [sp]
	mov r1, #1
	ldr r0, [r4, #0xc]
	mov r2, #0
	add r3, r1, #0
	bl BG_FillCharDataRange
	mov r0, #0xc8
	str r0, [sp]
	ldr r0, [r4, #0xc]
	mov r1, #5
	mov r2, #0
	mov r3, #1
	bl BG_FillCharDataRange
	mov r0, #0xc8
	str r0, [sp]
	ldr r0, [r4, #0xc]
	mov r1, #2
	mov r2, #0
	mov r3, #1
	bl BG_FillCharDataRange
	mov r1, #0
	str r1, [sp]
	ldr r0, [r4]
	mov r2, #1
	mov r3, #0xe
	bl ov71_02247124
	mov r1, #0
	str r1, [sp]
	ldr r0, [r4]
	mov r2, #5
	mov r3, #0xe
	bl ov71_02247124
	mov r0, #0
	str r0, [sp]
	ldr r0, [r4]
	mov r1, #1
	mov r2, #2
	mov r3, #0xf
	bl ov71_02247124
	mov r3, #0
	str r3, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x40
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r0, [r4, #0xc]
	mov r1, #1
	mov r2, #0xc8
	bl FillBgTilemapRect
	mov r3, #0
	str r3, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x40
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r0, [r4, #0xc]
	mov r1, #5
	mov r2, #0xc8
	bl FillBgTilemapRect
	mov r3, #0
	str r3, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x40
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r0, [r4, #0xc]
	mov r1, #2
	mov r2, #0xc8
	bl FillBgTilemapRect
	mov r0, #0x14
	str r0, [sp]
	mov r1, #0
	str r1, [sp, #4]
	ldr r0, [r4]
	mov r2, #1
	mov r3, #0xe
	bl ov71_02247230
	mov r0, #0x14
	str r0, [sp]
	mov r1, #0
	str r1, [sp, #4]
	ldr r0, [r4]
	mov r2, #5
	mov r3, #0xe
	bl ov71_02247230
	mov r2, #2
	str r2, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r4]
	mov r1, #1
	mov r3, #0xf
	bl ov71_02247230
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl BgCommitTilemapBufferToVram
	ldr r0, [r4, #0xc]
	mov r1, #5
	bl BgCommitTilemapBufferToVram
	ldr r0, [r4, #0xc]
	mov r1, #2
	bl BgCommitTilemapBufferToVram
	ldr r0, [r4, #0xc]
	ldr r2, _0224A07C ; =0xFFFFFE80
	mov r1, #0x50
	bl ov71_0224A0B8
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_0224A064: .word ov71_0224BE54
_0224A068: .word 0x04000304
_0224A06C: .word ov71_0224BDF0
_0224A070: .word ov71_0224BE00
_0224A074: .word ov71_0224BE1C
_0224A078: .word ov71_0224BE38
_0224A07C: .word 0xFFFFFE80
	thumb_func_end ov71_02249E6C

	thumb_func_start ov71_0224A080
ov71_0224A080: ; 0x0224A080
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #3
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0xc]
	mov r1, #7
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0xc]
	mov r1, #2
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0xc]
	mov r1, #6
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0xc]
	mov r1, #5
	bl FreeBgTilemapBuffer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov71_0224A080

	thumb_func_start ov71_0224A0B8
ov71_0224A0B8: ; 0x0224A0B8
	push {r4, r5, r6, lr}
	ldr r3, _0224A0EC ; =0x000001FF
	add r4, r1, #0
	add r6, r2, #0
	and r4, r3
	add r5, r0, #0
	mov r1, #2
	mov r2, #3
	and r3, r6
	bl BgSetPosTextAndCommit
	add r0, r5, #0
	mov r1, #1
	mov r2, #3
	add r3, r4, #0
	bl BgSetPosTextAndCommit
	add r4, #0xc0
	add r0, r5, #0
	mov r1, #5
	mov r2, #3
	add r3, r4, #0
	bl BgSetPosTextAndCommit
	pop {r4, r5, r6, pc}
	nop
_0224A0EC: .word 0x000001FF
	thumb_func_end ov71_0224A0B8

	thumb_func_start ov71_0224A0F0
ov71_0224A0F0: ; 0x0224A0F0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x39
	mov r1, #0xb0
	bl AllocFromHeap
	add r4, r0, #0
	beq _0224A124
	str r5, [r4]
	mov r0, #0
	str r0, [r4, #4]
	add r0, r5, #0
	bl ov71_02247384
	str r0, [r4, #0x24]
	mov r0, #0
	str r0, [r4, #0x28]
	str r0, [r4, #0xc]
	add r0, r4, #0
	add r0, #0x34
	bl ov71_0224A5A8
	ldr r0, _0224A128 ; =ov71_0224A8B0
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
_0224A124:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0224A128: .word ov71_0224A8B0
	thumb_func_end ov71_0224A0F0

	thumb_func_start ov71_0224A12C
ov71_0224A12C: ; 0x0224A12C
	push {r4, lr}
	add r4, r0, #0
	beq _0224A15A
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	add r0, r4, #0
	bl ov71_0224A3D8
	add r0, r4, #0
	bl ov71_0224A500
	add r0, r4, #0
	bl ov71_0224A590
	add r0, r4, #0
	add r0, #0x34
	bl ov71_0224A5B0
	add r0, r4, #0
	bl FreeToHeap
_0224A15A:
	pop {r4, pc}
	thumb_func_end ov71_0224A12C

	thumb_func_start ov71_0224A15C
ov71_0224A15C: ; 0x0224A15C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r2, [r4]
	add r5, r0, #0
	cmp r2, #2
	bhs _0224A184
	lsl r3, r2, #2
	ldr r2, _0224A188 ; =ov71_0224BE7C
	add r1, r5, #4
	ldr r2, [r2, r3]
	blx r2
	cmp r0, #0
	beq _0224A180
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #0
	str r0, [r5, #4]
_0224A180:
	mov r0, #0
	pop {r3, r4, r5, pc}
_0224A184:
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0224A188: .word ov71_0224BE7C
	thumb_func_end ov71_0224A15C

	thumb_func_start ov71_0224A18C
ov71_0224A18C: ; 0x0224A18C
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl ov71_0224A278
	add r0, r4, #0
	bl ov71_0224A3F0
	add r0, r4, #0
	bl ov71_0224A510
	mov r0, #8
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x39
	str r0, [sp, #8]
	ldr r3, _0224A1C0 ; =0x00007FFF
	mov r0, #0
	add r2, r1, #0
	bl BeginNormalPaletteFade
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0224A1C0: .word 0x00007FFF
	thumb_func_end ov71_0224A18C

	thumb_func_start ov71_0224A1C4
ov71_0224A1C4: ; 0x0224A1C4
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4]
	cmp r0, #3
	bhi _0224A26A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0224A1DE: ; jump table
	.short _0224A1E6 - _0224A1DE - 2 ; case 0
	.short _0224A206 - _0224A1DE - 2 ; case 1
	.short _0224A230 - _0224A1DE - 2 ; case 2
	.short _0224A25C - _0224A1DE - 2 ; case 3
_0224A1E6:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0224A26A
	ldr r0, [r5, #0x20]
	mov r1, #3
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r5, #0x20]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0224A26A
_0224A206:
	ldr r0, [r5, #0x20]
	bl sub_02024B68
	cmp r0, #0
	bne _0224A26A
	ldr r0, _0224A270 ; =0x000006AA
	bl PlaySE
	add r1, r5, #0
	add r0, r5, #0
	add r1, #0x34
	bl ov71_0224A5C4
	ldr r0, [r5, #0x2c]
	mov r1, #1
	bl ov71_02247704
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0224A26A
_0224A230:
	add r5, #0x34
	add r0, r5, #0
	bl ov71_0224A684
	cmp r0, #0
	beq _0224A26A
	mov r0, #0x10
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x39
	str r0, [sp, #8]
	mov r0, #0
	ldr r3, _0224A274 ; =0x00007FFF
	add r1, r0, #0
	add r2, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0224A26A
_0224A25C:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0224A26A
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_0224A26A:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_0224A270: .word 0x000006AA
_0224A274: .word 0x00007FFF
	thumb_func_end ov71_0224A1C4

	thumb_func_start ov71_0224A278
ov71_0224A278: ; 0x0224A278
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r4, r0, #0
	ldr r0, _0224A3C8 ; =ov71_0224BEC0
	bl GX_SetBanks
	ldr r2, _0224A3CC ; =0x04000304
	ldrh r1, [r2]
	lsr r0, r2, #0xb
	orr r0, r1
	strh r0, [r2]
	ldr r0, _0224A3D0 ; =ov71_0224BE84
	bl SetBothScreensModesAndDisable
	ldr r0, [r4, #0x24]
	ldr r2, _0224A3D4 ; =ov71_0224BEA4
	mov r1, #3
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x24]
	ldr r2, _0224A3D4 ; =ov71_0224BEA4
	mov r1, #7
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4]
	bl ov71_022473A0
	cmp r0, #3
	bhi _0224A2CA
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0224A2C2: ; jump table
	.short _0224A2CA - _0224A2C2 - 2 ; case 0
	.short _0224A2D6 - _0224A2C2 - 2 ; case 1
	.short _0224A2E2 - _0224A2C2 - 2 ; case 2
	.short _0224A2EE - _0224A2C2 - 2 ; case 3
_0224A2CA:
	mov r0, #0xf
	str r0, [sp, #0x10]
	mov r7, #0x10
	mov r6, #0x11
	mov r5, #0
	b _0224A2F8
_0224A2D6:
	mov r0, #0xf
	str r0, [sp, #0x10]
	mov r7, #0x10
	mov r6, #0x11
	mov r5, #0x20
	b _0224A2F8
_0224A2E2:
	mov r0, #0xf
	str r0, [sp, #0x10]
	mov r7, #0x10
	mov r6, #0x11
	mov r5, #0x40
	b _0224A2F8
_0224A2EE:
	mov r0, #0x18
	str r0, [sp, #0x10]
	mov r7, #0x19
	mov r6, #0x1a
	mov r5, #0
_0224A2F8:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x24]
	mov r0, #0x59
	add r1, r7, #0
	mov r3, #3
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x24]
	mov r0, #0x59
	add r1, r7, #0
	mov r3, #7
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x39
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	ldr r2, [r4, #0x24]
	mov r0, #0x59
	mov r3, #3
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x39
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	ldr r2, [r4, #0x24]
	mov r0, #0x59
	mov r3, #7
	bl GfGfxLoader_LoadScrnData
	mov r2, #0
	str r2, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x39
	str r0, [sp, #8]
	mov r0, #0x59
	add r1, r6, #0
	add r3, r5, #0
	bl GfGfxLoader_GXLoadPalWithSrcOffset
	mov r0, #0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x39
	str r0, [sp, #8]
	mov r0, #0x59
	add r1, r6, #0
	mov r2, #4
	add r3, r5, #0
	bl GfGfxLoader_GXLoadPalWithSrcOffset
	mov r1, #3
	ldr r0, [r4, #0x24]
	add r2, r1, #0
	mov r3, #0
	bl BgSetPosTextAndCommit
	mov r2, #3
	add r3, r2, #0
	ldr r0, [r4, #0x24]
	mov r1, #7
	add r3, #0xfd
	bl BgSetPosTextAndCommit
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	bl sub_0203A880
	mov r0, #1
	mov r1, #0x38
	bl sub_0203A948
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0224A3C8: .word ov71_0224BEC0
_0224A3CC: .word 0x04000304
_0224A3D0: .word ov71_0224BE84
_0224A3D4: .word ov71_0224BEA4
	thumb_func_end ov71_0224A278

	thumb_func_start ov71_0224A3D8
ov71_0224A3D8: ; 0x0224A3D8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x24]
	mov r1, #3
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x24]
	mov r1, #7
	bl FreeBgTilemapBuffer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov71_0224A3D8

	thumb_func_start ov71_0224A3F0
ov71_0224A3F0: ; 0x0224A3F0
	push {r3, r4, lr}
	sub sp, #0x24
	add r4, r0, #0
	bl NNS_G3dInit
	bl G3X_InitMtxStack
	ldr r0, _0224A4D0 ; =0x04000060
	ldr r1, _0224A4D4 ; =0xFFFFCFFD
	ldrh r2, [r0]
	and r2, r1
	strh r2, [r0]
	ldrh r3, [r0]
	add r2, r1, #2
	and r3, r2
	mov r2, #0x10
	orr r2, r3
	strh r2, [r0]
	ldrh r3, [r0]
	ldr r2, _0224A4D8 ; =0x0000CFFB
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
	ldr r0, _0224A4DC ; =ov71_0224BE94
	bl G3X_SetEdgeColorTable
	mov r1, #0
	ldr r0, _0224A4E0 ; =0x000043FF
	ldr r2, _0224A4E4 ; =0x00007FFF
	mov r3, #0x3f
	str r1, [sp]
	bl G3X_SetClearColor
	ldr r1, _0224A4E8 ; =0x04000540
	mov r0, #2
	str r0, [r1]
	ldr r0, _0224A4EC ; =0xBFFF0000
	str r0, [r1, #0x40]
	mov r0, #1
	add r1, r0, #0
	bl GF_3DVramMan_InitFrameTexVramManager
	mov r0, #1
	lsl r0, r0, #0xe
	mov r1, #1
	bl GF_3DVramMan_InitFramePlttVramManager
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	ldr r1, _0224A4F0 ; =0x04000008
	mov r0, #3
	ldrh r2, [r1]
	bic r2, r0
	strh r2, [r1]
	mov r1, #0
	mov r0, #1
	add r2, r1, #0
	add r3, r1, #0
	bl ov71_0224744C
	str r0, [r4, #0x28]
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r4, #0x28]
	mov r2, #0x59
	mov r3, #0x1b
	bl ov71_02247610
	ldr r1, _0224A4F4 ; =0x000018E3
	str r0, [r4, #0x2c]
	add r0, sp, #0x10
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	ldr r0, [r4, #0x28]
	add r1, sp, #0x10
	bl ov71_0224780C
	ldr r1, _0224A4F8 ; =0x00001150
	add r0, sp, #0x10
	strh r1, [r0]
	ldr r0, [r4, #0x28]
	add r1, sp, #0x10
	bl ov71_0224781C
	ldr r0, [r4, #0x28]
	ldr r1, _0224A4FC ; =0x000007D2
	bl ov71_0224783C
	ldr r0, [r4, #0x28]
	add r1, sp, #0x18
	bl ov71_022477EC
	add sp, #0x24
	pop {r3, r4, pc}
	.balign 4, 0
_0224A4D0: .word 0x04000060
_0224A4D4: .word 0xFFFFCFFD
_0224A4D8: .word 0x0000CFFB
_0224A4DC: .word ov71_0224BE94
_0224A4E0: .word 0x000043FF
_0224A4E4: .word 0x00007FFF
_0224A4E8: .word 0x04000540
_0224A4EC: .word 0xBFFF0000
_0224A4F0: .word 0x04000008
_0224A4F4: .word 0x000018E3
_0224A4F8: .word 0x00001150
_0224A4FC: .word 0x000007D2
	thumb_func_end ov71_0224A3F0

	thumb_func_start ov71_0224A500
ov71_0224A500: ; 0x0224A500
	push {r3, lr}
	ldr r0, [r0, #0x28]
	cmp r0, #0
	beq _0224A50C
	bl ov71_02247498
_0224A50C:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov71_0224A500

	thumb_func_start ov71_0224A510
ov71_0224A510: ; 0x0224A510
	push {r4, lr}
	sub sp, #0x70
	add r4, r0, #0
	add r0, #0x10
	mov r1, #0x59
	mov r2, #7
	mov r3, #8
	bl ov71_022472C4
	add r0, sp, #0x5c
	bl NNS_G2dInitImagePaletteProxy
	add r0, sp, #0x38
	bl NNS_G2dInitImageProxy
	mov r3, #0
	str r3, [sp]
	mov r2, #1
	str r2, [sp, #4]
	str r3, [sp, #8]
	mov r0, #0x39
	str r0, [sp, #0xc]
	add r0, sp, #0x38
	str r0, [sp, #0x10]
	mov r0, #0x59
	mov r1, #9
	bl GfGfxLoader_LoadImageMapping
	mov r0, #0x39
	str r0, [sp]
	add r0, sp, #0x5c
	str r0, [sp, #4]
	mov r0, #0x59
	mov r1, #0xa
	mov r2, #1
	mov r3, #0
	bl GfGfxLoader_PartiallyLoadPalette
	mov r0, #1
	add r1, r4, #0
	str r0, [sp]
	add r0, sp, #0x14
	add r1, #0x10
	add r2, sp, #0x38
	add r3, sp, #0x5c
	bl ov71_02247320
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	add r1, sp, #0x14
	mov r2, #0x80
	mov r3, #0x60
	bl ov71_02247340
	mov r1, #0
	str r0, [r4, #0x20]
	bl Set2dSpriteVisibleFlag
	add sp, #0x70
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov71_0224A510

	thumb_func_start ov71_0224A590
ov71_0224A590: ; 0x0224A590
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _0224A59E
	bl sub_02024758
_0224A59E:
	add r4, #0x10
	add r0, r4, #0
	bl ov71_022472FC
	pop {r4, pc}
	thumb_func_end ov71_0224A590

	thumb_func_start ov71_0224A5A8
ov71_0224A5A8: ; 0x0224A5A8
	mov r1, #0
	str r1, [r0, #4]
	bx lr
	.balign 4, 0
	thumb_func_end ov71_0224A5A8

	thumb_func_start ov71_0224A5B0
ov71_0224A5B0: ; 0x0224A5B0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0224A5C2
	bl DestroySysTask
	mov r0, #0
	str r0, [r4, #4]
_0224A5C2:
	pop {r4, pc}
	thumb_func_end ov71_0224A5B0

	thumb_func_start ov71_0224A5C4
ov71_0224A5C4: ; 0x0224A5C4
	push {r3, r4, lr}
	sub sp, #4
	add r4, r1, #0
	str r0, [r4]
	ldr r1, [r0, #0x2c]
	ldr r2, _0224A664 ; =0xFFFFD870
	str r1, [r4, #0xc]
	ldr r0, [r0, #0x28]
	ldr r1, _0224A668 ; =0x003D6C00
	str r0, [r4, #8]
	mov r0, #0
	str r0, [r4, #0x10]
	str r1, [r4, #0x14]
	ldr r1, _0224A66C ; =0xFFE44000
	str r1, [r4, #0x18]
	add r1, r4, #0
	add r1, #0x78
	strh r2, [r1]
	add r1, r4, #0
	ldr r2, _0224A670 ; =0xFFFFF550
	add r1, #0x7a
	strh r2, [r1]
	ldr r1, _0224A674 ; =0xFFFEF2C6
	str r1, [r4, #0x3c]
	ldr r1, _0224A678 ; =0x0000936D
	str r1, [r4, #0x40]
	str r0, [r4, #0x6c]
	str r0, [r4, #0x70]
	mov r1, #2
	str r0, [r4, #0x74]
	lsl r1, r1, #0xc
	strh r1, [r4, #0x34]
	ldr r1, _0224A67C ; =0xFFFFE000
	strh r1, [r4, #0x36]
	strh r0, [r4, #0x38]
	add r1, r4, #0
	ldr r0, [r4, #0xc]
	add r1, #0x34
	bl ov71_022476EC
	mov r3, #2
	lsl r3, r3, #8
	mov r1, #0x4a
	mov r2, #0x63
	str r3, [r4, #0x5c]
	lsl r0, r3, #2
	str r0, [r4, #0x44]
	str r0, [r4, #0x48]
	mov r0, #0
	str r0, [r4, #0x68]
	mov r0, #0xc
	str r0, [sp]
	add r0, r4, #0
	lsl r1, r1, #0xa
	lsl r2, r2, #0xa
	lsl r3, r3, #3
	bl ov71_0224A694
	add r0, r4, #0
	bl ov71_0224A6D8
	add r1, r4, #0
	ldr r0, [r4, #0xc]
	add r1, #0x28
	bl ov71_022476C4
	add r1, r4, #0
	ldr r0, [r4, #0xc]
	add r1, #0x34
	bl ov71_022476D4
	ldr r0, _0224A680 ; =ov71_0224A7D0
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	str r0, [r4, #4]
	add sp, #4
	pop {r3, r4, pc}
	nop
_0224A664: .word 0xFFFFD870
_0224A668: .word 0x003D6C00
_0224A66C: .word 0xFFE44000
_0224A670: .word 0xFFFFF550
_0224A674: .word 0xFFFEF2C6
_0224A678: .word 0x0000936D
_0224A67C: .word 0xFFFFE000
_0224A680: .word ov71_0224A7D0
	thumb_func_end ov71_0224A5C4

	thumb_func_start ov71_0224A684
ov71_0224A684: ; 0x0224A684
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _0224A68E
	mov r0, #1
	bx lr
_0224A68E:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov71_0224A684

	thumb_func_start ov71_0224A694
ov71_0224A694: ; 0x0224A694
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [sp, #0x18]
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	str r0, [sp]
	cmp r0, #0
	beq _0224A6D4
	ldr r0, [r5, #0x44]
	ldr r1, [sp]
	sub r0, r4, r0
	bl _s32_div_f
	str r0, [r5, #0x4c]
	ldr r0, [r5, #0x48]
	ldr r1, [sp]
	sub r0, r6, r0
	bl _s32_div_f
	str r0, [r5, #0x50]
	ldr r0, [r5, #0x5c]
	ldr r1, [sp]
	sub r0, r7, r0
	bl _s32_div_f
	str r0, [r5, #0x60]
	str r4, [r5, #0x54]
	str r6, [r5, #0x58]
	ldr r0, [sp, #0x18]
	str r7, [r5, #0x64]
	str r0, [r5, #0x68]
_0224A6D4:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov71_0224A694

	thumb_func_start ov71_0224A6D8
ov71_0224A6D8: ; 0x0224A6D8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0224A7CC ; =_0224C020
	ldr r0, [r0]
	cmp r0, #0
	beq _0224A7BA
	add r0, r5, #0
	add r0, #0x78
	ldrh r0, [r0]
	mov r1, #0xb6
	bl _s32_div_f
	add r4, r0, #0
	mov r0, #0x5a
	lsl r0, r0, #2
	cmp r4, r0
	blt _0224A6FC
	sub r4, r4, r0
_0224A6FC:
	mov r0, #0x78
	ldrsh r1, [r5, r0]
	mov r0, #0x7a
	ldrsh r0, [r5, r0]
	sub r1, r1, r0
	add r0, r5, #0
	add r0, #0x78
	strh r1, [r0]
	ldr r0, [r5, #0x68]
	cmp r0, #0
	beq _0224A744
	sub r0, r0, #1
	str r0, [r5, #0x68]
	beq _0224A730
	ldr r1, [r5, #0x44]
	ldr r0, [r5, #0x4c]
	add r0, r1, r0
	str r0, [r5, #0x44]
	ldr r1, [r5, #0x48]
	ldr r0, [r5, #0x50]
	add r0, r1, r0
	str r0, [r5, #0x48]
	ldr r1, [r5, #0x5c]
	ldr r0, [r5, #0x60]
	add r0, r1, r0
	b _0224A73A
_0224A730:
	ldr r0, [r5, #0x54]
	str r0, [r5, #0x44]
	ldr r0, [r5, #0x58]
	str r0, [r5, #0x48]
	ldr r0, [r5, #0x64]
_0224A73A:
	str r0, [r5, #0x5c]
	ldr r0, [r5, #0xc]
	ldr r1, [r5, #0x5c]
	bl ov71_02247730
_0224A744:
	lsl r0, r4, #0x10
	ldr r6, [r5, #0x44]
	lsr r0, r0, #0x10
	bl GF_CosDegNoWrap
	asr r1, r0, #0x1f
	asr r3, r6, #0x1f
	add r2, r6, #0
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	str r1, [r5, #0x1c]
	lsl r0, r4, #0x10
	ldr r6, [r5, #0x48]
	lsr r0, r0, #0x10
	bl GF_SinDegNoWrap
	asr r1, r0, #0x1f
	asr r3, r6, #0x1f
	add r2, r6, #0
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	str r1, [r5, #0x20]
	add r1, r5, #0
	str r3, [r5, #0x24]
	mov r0, #0x34
	ldrsh r2, [r5, r0]
	mov r0, #3
	lsl r0, r0, #8
	sub r0, r2, r0
	strh r0, [r5, #0x34]
	ldr r0, [r5, #0xc]
	add r1, #0x34
	bl ov71_022476EC
	add r0, r5, #0
	add r1, r5, #0
	add r5, #0x28
	add r0, #0x1c
	add r1, #0x10
	add r2, r5, #0
	bl VEC_Add
	pop {r4, r5, r6, pc}
_0224A7BA:
	add r2, r5, #0
	add r2, #0x10
	ldmia r2!, {r0, r1}
	add r5, #0x28
	stmia r5!, {r0, r1}
	ldr r0, [r2]
	str r0, [r5]
	pop {r4, r5, r6, pc}
	nop
_0224A7CC: .word _0224C020
	thumb_func_end ov71_0224A6D8

	thumb_func_start ov71_0224A7D0
ov71_0224A7D0: ; 0x0224A7D0
	push {r4, lr}
	add r4, r1, #0
	ldr r1, [r4, #0x74]
	cmp r1, #0x46
	bge _0224A7DE
	add r1, r1, #1
	str r1, [r4, #0x74]
_0224A7DE:
	ldr r1, [r4, #0x6c]
	cmp r1, #3
	bhi _0224A8A4
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0224A7F0: ; jump table
	.short _0224A7F8 - _0224A7F0 - 2 ; case 0
	.short _0224A81E - _0224A7F0 - 2 ; case 1
	.short _0224A858 - _0224A7F0 - 2 ; case 2
	.short _0224A892 - _0224A7F0 - 2 ; case 3
_0224A7F8:
	add r0, r4, #0
	bl ov71_0224A6D8
	add r1, r4, #0
	ldr r0, [r4, #0xc]
	add r1, #0x28
	bl ov71_022476C4
	ldr r0, [r4, #0x74]
	add r0, r0, #1
	str r0, [r4, #0x74]
	cmp r0, #0xc
	blt _0224A8A4
	mov r0, #0
	str r0, [r4, #0x74]
	ldr r0, [r4, #0x6c]
	add r0, r0, #1
	str r0, [r4, #0x6c]
	pop {r4, pc}
_0224A81E:
	ldr r0, [r4, #0xc]
	bl ov71_02247738
	cmp r0, #0
	bne _0224A836
	ldr r0, [r4]
	bl ov71_0224A8A8
	ldr r0, [r4, #0x6c]
	add r0, r0, #1
	str r0, [r4, #0x6c]
	pop {r4, pc}
_0224A836:
	ldr r1, [r4, #0x14]
	ldr r0, [r4, #0x3c]
	add r0, r1, r0
	str r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	ldr r0, [r4, #0x40]
	add r0, r1, r0
	str r0, [r4, #0x18]
	add r0, r4, #0
	bl ov71_0224A6D8
	ldr r0, [r4, #0xc]
	add r4, #0x28
	add r1, r4, #0
	bl ov71_022476C4
	pop {r4, pc}
_0224A858:
	ldr r1, [r4, #0x14]
	ldr r0, [r4, #0x3c]
	add r0, r1, r0
	str r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	ldr r0, [r4, #0x40]
	add r0, r1, r0
	str r0, [r4, #0x18]
	add r0, r4, #0
	bl ov71_0224A6D8
	add r1, r4, #0
	ldr r0, [r4, #0xc]
	add r1, #0x28
	bl ov71_022476C4
	ldr r0, [r4, #0x74]
	cmp r0, #0x46
	blt _0224A8A4
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl ov71_02247704
	mov r0, #0
	str r0, [r4, #0x70]
	ldr r0, [r4, #0x6c]
	add r0, r0, #1
	str r0, [r4, #0x6c]
	pop {r4, pc}
_0224A892:
	ldr r1, [r4, #0x70]
	add r1, r1, #1
	str r1, [r4, #0x70]
	cmp r1, #8
	ble _0224A8A4
	mov r1, #0
	str r1, [r4, #4]
	bl DestroySysTask
_0224A8A4:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov71_0224A7D0

	thumb_func_start ov71_0224A8A8
ov71_0224A8A8: ; 0x0224A8A8
	mov r1, #1
	str r1, [r0, #0xc]
	bx lr
	.balign 4, 0
	thumb_func_end ov71_0224A8A8

	thumb_func_start ov71_0224A8B0
ov71_0224A8B0: ; 0x0224A8B0
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, [r4, #0x28]
	cmp r0, #0
	beq _0224A8CE
	bl G3X_Reset
	ldr r0, [r4, #0x28]
	bl ov71_022474CC
	mov r0, #0
	add r1, r0, #0
	bl sub_02026E50
_0224A8CE:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _0224A910
	ldr r1, _0224A914 ; =0x0000EEB0
	add r0, sp, #0
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	mov r1, #3
	add r3, r1, #0
	ldr r0, [r4, #0x24]
	add r2, r1, #0
	add r3, #0xfd
	bl BgSetPosTextAndCommit
	ldr r0, [r4, #0x24]
	mov r1, #7
	mov r2, #3
	mov r3, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r4, #0x28]
	add r1, sp, #0
	bl ov71_0224781C
	ldr r2, _0224A918 ; =0x04000304
	ldr r0, _0224A91C ; =0xFFFF7FFF
	ldrh r1, [r2]
	and r0, r1
	strh r0, [r2]
	mov r0, #0
	str r0, [r4, #0xc]
_0224A910:
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_0224A914: .word 0x0000EEB0
_0224A918: .word 0x04000304
_0224A91C: .word 0xFFFF7FFF
	thumb_func_end ov71_0224A8B0

	thumb_func_start ov71_0224A920
ov71_0224A920: ; 0x0224A920
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x39
	mov r1, #0x3c
	bl AllocFromHeap
	add r4, r0, #0
	beq _0224A94E
	str r5, [r4]
	mov r0, #0
	str r0, [r4, #4]
	add r0, r5, #0
	bl ov71_02247384
	str r0, [r4, #0xc]
	mov r0, #0
	str r0, [r4, #0x20]
	str r0, [r4, #0x10]
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	str r0, [r4, #0x30]
	str r0, [r4, #0x34]
	str r0, [r4, #0x38]
_0224A94E:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov71_0224A920

	thumb_func_start ov71_0224A954
ov71_0224A954: ; 0x0224A954
	push {r4, lr}
	add r4, r0, #0
	beq _0224A988
	bl ov71_0224ADB0
	add r0, r4, #0
	bl ov71_0224AEF4
	ldr r0, [r4, #0x30]
	cmp r0, #0
	beq _0224A96E
	bl ov71_0224B068
_0224A96E:
	ldr r0, [r4, #0x34]
	cmp r0, #0
	beq _0224A978
	bl ov71_0224AFB8
_0224A978:
	ldr r0, [r4, #0x38]
	cmp r0, #0
	beq _0224A982
	bl ov71_0224B11C
_0224A982:
	add r0, r4, #0
	bl FreeToHeap
_0224A988:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov71_0224A954

	thumb_func_start ov71_0224A98C
ov71_0224A98C: ; 0x0224A98C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r2, [r4]
	add r5, r0, #0
	cmp r2, #3
	bhs _0224A9BA
	lsl r3, r2, #2
	ldr r2, _0224A9C0 ; =ov71_0224BEF0
	add r1, r5, #4
	ldr r2, [r2, r3]
	blx r2
	cmp r0, #0
	beq _0224A9B0
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #0
	str r0, [r5, #4]
_0224A9B0:
	add r0, r5, #0
	bl ov71_0224A9C4
	mov r0, #0
	pop {r3, r4, r5, pc}
_0224A9BA:
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_0224A9C0: .word ov71_0224BEF0
	thumb_func_end ov71_0224A98C

	thumb_func_start ov71_0224A9C4
ov71_0224A9C4: ; 0x0224A9C4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _0224A9F6
	mov r0, #0x2a
	ldrsh r1, [r4, r0]
	mov r0, #1
	lsl r0, r0, #0xc
	add r0, r1, r0
	strh r0, [r4, #0x2a]
	add r1, r4, #0
	ldr r0, [r4, #0x24]
	add r1, #0x28
	bl ov71_022476EC
	bl G3X_Reset
	ldr r0, [r4, #0x20]
	bl ov71_022474CC
	mov r0, #0
	add r1, r0, #0
	bl sub_02026E50
_0224A9F6:
	pop {r4, pc}
	thumb_func_end ov71_0224A9C4

	thumb_func_start ov71_0224A9F8
ov71_0224A9F8: ; 0x0224A9F8
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl ov71_0224AB7C
	add r0, r4, #0
	bl ov71_0224ADE4
	mov r0, #8
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x39
	str r0, [sp, #8]
	ldr r3, _0224AA24 ; =0x00007FFF
	mov r0, #0
	add r2, r1, #0
	bl BeginNormalPaletteFade
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_0224AA24: .word 0x00007FFF
	thumb_func_end ov71_0224A9F8

	thumb_func_start ov71_0224AA28
ov71_0224AA28: ; 0x0224AA28
	push {r3, r4, r5, lr}
	add r5, r1, #0
	ldr r1, [r5]
	add r4, r0, #0
	cmp r1, #6
	bhi _0224AAF2
	add r2, r1, r1
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0224AA40: ; jump table
	.short _0224AA4E - _0224AA40 - 2 ; case 0
	.short _0224AA6C - _0224AA40 - 2 ; case 1
	.short _0224AA86 - _0224AA40 - 2 ; case 2
	.short _0224AA98 - _0224AA40 - 2 ; case 3
	.short _0224AAB0 - _0224AA40 - 2 ; case 4
	.short _0224AAD4 - _0224AA40 - 2 ; case 5
	.short _0224AAE8 - _0224AA40 - 2 ; case 6
_0224AA4E:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0224AAF2
	mov r0, #0
	str r0, [r4, #8]
	add r0, r4, #0
	add r4, #0x30
	add r1, r4, #0
	bl ov71_0224AFD4
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224AAF2
_0224AA6C:
	ldr r1, [r4, #8]
	add r1, r1, #1
	str r1, [r4, #8]
	cmp r1, #8
	ble _0224AAF2
	add r4, #0x34
	add r1, r4, #0
	bl ov71_0224AF08
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224AAF2
_0224AA86:
	ldr r0, [r4, #0x34]
	cmp r0, #0
	bne _0224AAF2
	ldr r0, [r4, #0x30]
	cmp r0, #0
	bne _0224AAF2
	add r0, r1, #1
	str r0, [r5]
	b _0224AAF2
_0224AA98:
	mov r1, #0
	add r0, #0x14
	mvn r1, r1
	bl ov71_02246C6C
	str r0, [r4, #0x10]
	mov r0, #0
	str r0, [r4, #8]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224AAF2
_0224AAB0:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0x1e
	ble _0224AAF2
	add r0, r4, #0
	add r0, #0x38
	str r0, [sp]
	ldr r0, [r4, #0x24]
	mov r1, #0x1f
	mov r2, #0
	mov r3, #0x28
	bl ov71_0224B084
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224AAF2
_0224AAD4:
	ldr r0, [r4, #0x38]
	cmp r0, #0
	bne _0224AAF2
	ldr r0, [r4, #0x10]
	bl ov71_02246D40
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224AAF2
_0224AAE8:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _0224AAF2
	mov r0, #1
	pop {r3, r4, r5, pc}
_0224AAF2:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov71_0224AA28

	thumb_func_start ov71_0224AAF8
ov71_0224AAF8: ; 0x0224AAF8
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _0224AB10
	cmp r0, #1
	beq _0224AB38
	cmp r0, #2
	beq _0224AB62
	b _0224AB76
_0224AB10:
	mov r0, #0x4a
	lsl r0, r0, #2
	mov r3, #1
	str r0, [sp]
	add r0, r5, #0
	str r3, [sp, #4]
	add r0, #0x1c
	str r0, [sp, #8]
	ldr r0, [r5, #0xc]
	lsl r1, r3, #0xc
	lsl r2, r3, #0xa
	bl ov71_02247000
	str r0, [r5, #0x18]
	mov r0, #0
	str r0, [r5, #8]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0224AB76
_0224AB38:
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	cmp r0, #0xd
	ble _0224AB76
	mov r0, #8
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x39
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0224AB76
_0224AB62:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0224AB76
	ldr r0, [r5, #0x1c]
	cmp r0, #0
	beq _0224AB76
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_0224AB76:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov71_0224AAF8

	thumb_func_start ov71_0224AB7C
ov71_0224AB7C: ; 0x0224AB7C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r0, _0224AD94 ; =ov71_0224BF54
	bl GX_SetBanks
	ldr r2, _0224AD98 ; =0x04000304
	ldrh r1, [r2]
	lsr r0, r2, #0xb
	orr r0, r1
	strh r0, [r2]
	ldr r0, _0224AD9C ; =ov71_0224BEFC
	bl SetBothScreensModesAndDisable
	ldr r0, [r4, #0xc]
	ldr r2, _0224ADA0 ; =ov71_0224BF1C
	mov r1, #2
	mov r3, #1
	bl InitBgFromTemplate
	ldr r0, [r4, #0xc]
	ldr r2, _0224ADA0 ; =ov71_0224BF1C
	mov r1, #6
	mov r3, #1
	bl InitBgFromTemplate
	bl OS_DisableInterrupts
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	ldr r2, _0224ADA4 ; =ov71_0224BF38
	mov r1, #3
	mov r3, #2
	bl InitBgFromTemplate
	ldr r0, [r4, #0xc]
	ldr r2, _0224ADA4 ; =ov71_0224BF38
	mov r1, #7
	mov r3, #2
	bl InitBgFromTemplate
	add r0, r5, #0
	bl OS_RestoreInterrupts
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x39
	str r0, [sp, #0xc]
	mov r1, #2
	ldr r2, [r4, #0xc]
	mov r0, #0x59
	add r3, r1, #0
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0xc]
	mov r0, #0x59
	mov r1, #2
	mov r3, #6
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0xc]
	mov r0, #0x59
	mov r3, #2
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0xc]
	mov r0, #0x59
	mov r3, #6
	bl GfGfxLoader_LoadScrnData
	ldr r0, [r4]
	bl ov71_022473A0
	add r5, r0, #0
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x39
	mov r2, #0
	str r0, [sp, #4]
	mov r0, #0x59
	mov r1, #3
	add r3, r2, #0
	bl GfGfxLoader_GXLoadPal
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x39
	str r0, [sp, #4]
	mov r0, #0x59
	mov r1, #3
	mov r2, #4
	mov r3, #0
	bl GfGfxLoader_GXLoadPal
	ldr r0, _0224ADA8 ; =ov71_0224BEE8
	lsl r1, r5, #1
	ldrh r5, [r0, r1]
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x40
	str r0, [sp, #4]
	mov r0, #0x39
	str r0, [sp, #8]
	mov r0, #0x59
	mov r1, #3
	mov r2, #0
	add r3, r5, #0
	bl GfGfxLoader_GXLoadPalWithSrcOffset
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x40
	str r0, [sp, #4]
	mov r0, #0x39
	str r0, [sp, #8]
	mov r0, #0x59
	mov r1, #3
	mov r2, #4
	add r3, r5, #0
	bl GfGfxLoader_GXLoadPalWithSrcOffset
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0xc]
	mov r0, #0x59
	mov r1, #5
	mov r3, #3
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0xc]
	mov r0, #0x59
	mov r1, #5
	mov r3, #7
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0xc]
	mov r0, #0x59
	mov r1, #4
	mov r3, #3
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0xc]
	mov r0, #0x59
	mov r1, #4
	mov r3, #7
	bl GfGfxLoader_LoadScrnData
	mov r0, #0x39
	mov r1, #0x60
	bl AllocFromHeap
	add r5, r0, #0
	beq _0224AD52
	mov r0, #0
	add r1, r5, #0
	mov r2, #0x60
	bl MIi_CpuClear32
	add r0, r5, #0
	mov r1, #0x60
	bl DC_FlushRange
	bl GX_BeginLoadBGExtPltt
	bl GXS_BeginLoadBGExtPltt
	mov r1, #6
	add r0, r5, #0
	lsl r1, r1, #0xc
	mov r2, #0x60
	bl GX_LoadBGExtPltt
	mov r1, #6
	add r0, r5, #0
	lsl r1, r1, #0xc
	mov r2, #0x60
	bl GXS_LoadBGExtPltt
	bl GX_EndLoadBGExtPltt
	bl GXS_EndLoadBGExtPltt
	add r0, r5, #0
	bl FreeToHeap
_0224AD52:
	ldr r0, [r4, #0xc]
	ldr r3, _0224ADAC ; =0xFFFFFE80
	mov r1, #2
	mov r2, #3
	bl BgSetPosTextAndCommit
	mov r2, #3
	add r3, r2, #0
	ldr r0, [r4, #0xc]
	mov r1, #6
	sub r3, #0xc3
	bl BgSetPosTextAndCommit
	mov r1, #3
	ldr r0, [r4, #0xc]
	add r2, r1, #0
	mov r3, #0x43
	bl BgSetPosTextAndCommit
	mov r0, #7
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0224AD94: .word ov71_0224BF54
_0224AD98: .word 0x04000304
_0224AD9C: .word ov71_0224BEFC
_0224ADA0: .word ov71_0224BF1C
_0224ADA4: .word ov71_0224BF38
_0224ADA8: .word ov71_0224BEE8
_0224ADAC: .word 0xFFFFFE80
	thumb_func_end ov71_0224AB7C

	thumb_func_start ov71_0224ADB0
ov71_0224ADB0: ; 0x0224ADB0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _0224ADC0
	ldr r0, [r4, #0x10]
	bl ov71_02246D54
_0224ADC0:
	ldr r0, [r4, #0xc]
	mov r1, #2
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0xc]
	mov r1, #6
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0xc]
	mov r1, #3
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0xc]
	mov r1, #7
	bl FreeBgTilemapBuffer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov71_0224ADB0

	thumb_func_start ov71_0224ADE4
ov71_0224ADE4: ; 0x0224ADE4
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	bl NNS_G3dInit
	bl G3X_InitMtxStack
	ldr r0, _0224AEC8 ; =0x04000060
	ldr r1, _0224AECC ; =0xFFFFCFFD
	ldrh r2, [r0]
	and r2, r1
	strh r2, [r0]
	ldrh r3, [r0]
	add r2, r1, #2
	and r3, r2
	mov r2, #0x10
	orr r2, r3
	strh r2, [r0]
	ldrh r3, [r0]
	ldr r2, _0224AED0 ; =0x0000CFFB
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
	ldr r0, _0224AED4 ; =ov71_0224BF0C
	bl G3X_SetEdgeColorTable
	mov r1, #0
	ldr r0, _0224AED8 ; =0x000043FF
	ldr r2, _0224AEDC ; =0x00007FFF
	mov r3, #0x3f
	str r1, [sp]
	bl G3X_SetClearColor
	ldr r1, _0224AEE0 ; =0x04000540
	mov r0, #2
	str r0, [r1]
	ldr r0, _0224AEE4 ; =0xBFFF0000
	str r0, [r1, #0x40]
	mov r0, #1
	add r1, r0, #0
	bl GF_3DVramMan_InitFrameTexVramManager
	mov r0, #1
	lsl r0, r0, #0xe
	mov r1, #1
	bl GF_3DVramMan_InitFramePlttVramManager
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	ldr r1, _0224AEE8 ; =0x04000008
	mov r0, #3
	ldrh r2, [r1]
	bic r2, r0
	strh r2, [r1]
	mov r1, #0
	mov r0, #1
	add r2, r1, #0
	add r3, r1, #0
	bl ov71_0224744C
	str r0, [r4, #0x20]
	mov r1, #0
	mov r0, #0x23
	str r1, [sp]
	lsl r0, r0, #0xe
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x20]
	mov r2, #0x59
	mov r3, #0x1b
	bl ov71_02247610
	str r0, [r4, #0x24]
	ldr r0, _0224AEEC ; =ov71_0224C0D0
	mov r1, #0
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	ldr r0, [r4, #0x20]
	ldr r1, _0224AEF0 ; =ov71_0224C0D0
	bl ov71_0224780C
	ldr r0, [r4, #0x20]
	mov r1, #1
	bl ov71_0224782C
	mov r1, #2
	ldr r0, [r4, #0x24]
	lsl r1, r1, #0xc
	bl ov71_02247730
	ldr r0, [r4, #0x24]
	add r4, #0x28
	add r1, r4, #0
	bl ov71_022476D4
	add sp, #0x10
	pop {r4, pc}
	nop
_0224AEC8: .word 0x04000060
_0224AECC: .word 0xFFFFCFFD
_0224AED0: .word 0x0000CFFB
_0224AED4: .word ov71_0224BF0C
_0224AED8: .word 0x000043FF
_0224AEDC: .word 0x00007FFF
_0224AEE0: .word 0x04000540
_0224AEE4: .word 0xBFFF0000
_0224AEE8: .word 0x04000008
_0224AEEC: .word ov71_0224C0D0
_0224AEF0: .word ov71_0224C0D0
	thumb_func_end ov71_0224ADE4

	thumb_func_start ov71_0224AEF4
ov71_0224AEF4: ; 0x0224AEF4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _0224AF06
	bl ov71_02247498
	mov r0, #0
	str r0, [r4, #0x20]
_0224AF06:
	pop {r4, pc}
	thumb_func_end ov71_0224AEF4

	thumb_func_start ov71_0224AF08
ov71_0224AF08: ; 0x0224AF08
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	mov r0, #0x39
	mov r1, #0x24
	bl AllocFromHeap
	add r4, r0, #0
	beq _0224AF48
	str r6, [r4]
	ldr r0, [r6, #0xc]
	add r1, r4, #0
	str r0, [r4, #4]
	ldr r0, _0224AF4C ; =0xFFE80000
	mov r2, #0
	str r0, [r4, #0xc]
	asr r0, r0, #1
	str r0, [r4, #0x10]
	ldr r0, _0224AF50 ; =0x00009999
	str r0, [r4, #0x14]
	mov r0, #0x28
	str r0, [r4, #8]
	ldr r0, _0224AF54 ; =ov71_0224AF58
	str r5, [r4, #0x1c]
	bl sub_0200E33C
	str r0, [r5]
	cmp r0, #0
	bne _0224AF48
	add r0, r4, #0
	bl FreeToHeap
_0224AF48:
	pop {r4, r5, r6, pc}
	nop
_0224AF4C: .word 0xFFE80000
_0224AF50: .word 0x00009999
_0224AF54: .word ov71_0224AF58
	thumb_func_end ov71_0224AF08

	thumb_func_start ov71_0224AF58
ov71_0224AF58: ; 0x0224AF58
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224AF98
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x14]
	mov r2, #3
	add r0, r1, r0
	str r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	ldr r0, [r4, #0x14]
	add r0, r1, r0
	str r0, [r4, #0x10]
	ldr r3, [r4, #0xc]
	ldr r0, [r4, #4]
	mov r1, #2
	asr r3, r3, #0xc
	bl BgSetPosTextAndCommit
	ldr r3, [r4, #0x10]
	ldr r0, [r4, #4]
	mov r1, #6
	mov r2, #3
	asr r3, r3, #0xc
	bl BgSetPosTextAndCommit
	ldr r0, [r4, #8]
	sub r0, r0, #1
	str r0, [r4, #8]
	pop {r3, r4, r5, pc}
_0224AF98:
	ldr r0, [r4, #4]
	mov r1, #2
	mov r2, #3
	mov r3, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r4, #4]
	mov r1, #6
	mov r2, #3
	mov r3, #0xc0
	bl BgSetPosTextAndCommit
	add r0, r5, #0
	bl ov71_0224AFB8
	pop {r3, r4, r5, pc}
	thumb_func_end ov71_0224AF58

	thumb_func_start ov71_0224AFB8
ov71_0224AFB8: ; 0x0224AFB8
	push {r4, lr}
	add r4, r0, #0
	beq _0224AFD2
	bl sub_0201F988
	ldr r1, [r0, #0x1c]
	mov r2, #0
	str r2, [r1]
	bl ov71_02247424
	add r0, r4, #0
	bl DestroySysTask
_0224AFD2:
	pop {r4, pc}
	thumb_func_end ov71_0224AFB8

	thumb_func_start ov71_0224AFD4
ov71_0224AFD4: ; 0x0224AFD4
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	mov r0, #0x39
	mov r1, #0x1c
	bl AllocFromHeap
	add r4, r0, #0
	beq _0224B020
	str r5, [r4]
	ldr r0, [r6, #0x24]
	add r1, r4, #0
	str r0, [r4, #8]
	add r1, #0xc
	bl ov71_022476B4
	mov r0, #0x32
	ldr r1, [r4, #0x10]
	lsl r0, r0, #0xc
	sub r1, r0, r1
	asr r0, r1, #3
	lsr r0, r0, #0x1c
	add r0, r1, r0
	asr r0, r0, #4
	str r0, [r4, #0x18]
	mov r0, #0x10
	str r0, [r4, #4]
	ldr r0, _0224B024 ; =ov71_0224B028
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	str r0, [r5]
	cmp r0, #0
	bne _0224B020
	add r0, r4, #0
	bl FreeToHeap
_0224B020:
	pop {r4, r5, r6, pc}
	nop
_0224B024: .word ov71_0224B028
	thumb_func_end ov71_0224AFD4

	thumb_func_start ov71_0224B028
ov71_0224B028: ; 0x0224B028
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0224B04E
	ldr r1, [r4, #0x10]
	ldr r0, [r4, #0x18]
	add r0, r1, r0
	str r0, [r4, #0x10]
	add r1, r4, #0
	ldr r0, [r4, #8]
	add r1, #0xc
	bl ov71_022476C4
	ldr r0, [r4, #4]
	sub r0, r0, #1
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
_0224B04E:
	mov r0, #0x32
	lsl r0, r0, #0xc
	str r0, [r4, #0x10]
	ldr r0, [r4, #8]
	add r4, #0xc
	add r1, r4, #0
	bl ov71_022476C4
	add r0, r5, #0
	bl ov71_0224B068
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov71_0224B028

	thumb_func_start ov71_0224B068
ov71_0224B068: ; 0x0224B068
	push {r4, lr}
	add r4, r0, #0
	beq _0224B082
	bl sub_0201F988
	ldr r1, [r0]
	mov r2, #0
	str r2, [r1]
	bl FreeToHeap
	add r0, r4, #0
	bl DestroySysTask
_0224B082:
	pop {r4, pc}
	thumb_func_end ov71_0224B068

	thumb_func_start ov71_0224B084
ov71_0224B084: ; 0x0224B084
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	add r6, r1, #0
	mov r0, #0x39
	mov r1, #0x18
	str r2, [sp, #4]
	add r7, r3, #0
	ldr r5, [sp, #0x20]
	bl AllocFromHeap
	add r4, r0, #0
	beq _0224B0DC
	str r5, [r4]
	lsl r0, r6, #0xc
	str r0, [r4, #4]
	ldr r0, [sp, #4]
	lsl r1, r0, #0xc
	str r1, [r4, #0xc]
	ldr r0, [r4, #4]
	sub r0, r1, r0
	add r1, r7, #0
	bl _s32_div_f
	str r0, [r4, #8]
	ldr r0, [sp]
	str r7, [r4, #0x10]
	add r1, r6, #0
	str r0, [r4, #0x14]
	bl ov71_02247708
	ldr r0, _0224B0E4 ; =ov71_0224B0E8
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	str r0, [r5]
	cmp r0, #0
	bne _0224B0E0
	add r0, r4, #0
	bl FreeToHeap
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0224B0DC:
	mov r0, #0
	str r0, [r5]
_0224B0E0:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224B0E4: .word ov71_0224B0E8
	thumb_func_end ov71_0224B084

	thumb_func_start ov71_0224B0E8
ov71_0224B0E8: ; 0x0224B0E8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r1, #0x10]
	sub r0, r0, #1
	str r0, [r1, #0x10]
	cmp r0, #0
	ble _0224B108
	ldr r2, [r1, #4]
	ldr r0, [r1, #8]
	add r2, r2, r0
	str r2, [r1, #4]
	ldr r0, [r1, #0x14]
	asr r1, r2, #0xc
	bl ov71_02247708
	pop {r4, pc}
_0224B108:
	ldr r0, [r1, #0x14]
	ldr r1, [r1, #0xc]
	asr r1, r1, #0xc
	bl ov71_02247708
	add r0, r4, #0
	bl ov71_0224B11C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov71_0224B0E8

	thumb_func_start ov71_0224B11C
ov71_0224B11C: ; 0x0224B11C
	push {r4, lr}
	add r4, r0, #0
	beq _0224B136
	bl sub_0201F988
	ldr r1, [r0]
	mov r2, #0
	str r2, [r1]
	bl FreeToHeap
	add r0, r4, #0
	bl DestroySysTask
_0224B136:
	pop {r4, pc}
	thumb_func_end ov71_0224B11C

	thumb_func_start ov71_0224B138
ov71_0224B138: ; 0x0224B138
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x39
	mov r1, #0x88
	bl AllocFromHeap
	add r4, r0, #0
	beq _0224B194
	str r5, [r4]
	mov r0, #0
	str r0, [r4, #4]
	add r0, r5, #0
	bl ov71_02247384
	str r0, [r4, #0x58]
	mov r0, #0x39
	bl sub_02007FD4
	str r0, [r4, #0x10]
	mov r0, #0
	str r0, [r4, #0x14]
	mov r0, #0x4b
	lsl r0, r0, #2
	mov r1, #0x39
	bl String_ctor
	str r0, [r4, #0x6c]
	mov r0, #0x4b
	lsl r0, r0, #2
	mov r1, #0x39
	bl String_ctor
	str r0, [r4, #0x70]
	mov r1, #0
	add r0, r4, #0
	str r1, [r4, #0x7c]
	add r0, #0x80
	str r1, [r0]
	str r1, [r4, #0x74]
	mov r0, #0xb4
	mov r1, #0x39
	bl NARC_ctor
	add r1, r4, #0
	add r1, #0x84
	str r0, [r1]
_0224B194:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov71_0224B138

	thumb_func_start ov71_0224B198
ov71_0224B198: ; 0x0224B198
	push {r4, lr}
	add r4, r0, #0
	beq _0224B1F8
	bl ov71_0224B970
	add r0, r4, #0
	bl ov71_0224B8EC
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl ov71_0224BA48
	ldr r0, [r4, #0x6c]
	bl String_dtor
	ldr r0, [r4, #0x70]
	bl String_dtor
	ldr r0, [r4, #0x74]
	cmp r0, #0
	beq _0224B1C8
	bl ov71_02247498
_0224B1C8:
	ldr r0, [r4, #0x58]
	mov r1, #1
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	add r0, #0x5c
	bl RemoveWindow
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _0224B1E2
	bl sub_02008780
_0224B1E2:
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	bl NARC_dtor
	ldr r0, [r4, #0x10]
	bl sub_02008524
	add r0, r4, #0
	bl FreeToHeap
_0224B1F8:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov71_0224B198

	thumb_func_start ov71_0224B1FC
ov71_0224B1FC: ; 0x0224B1FC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r2, [r4]
	add r5, r0, #0
	cmp r2, #4
	bhs _0224B22A
	lsl r3, r2, #2
	ldr r2, _0224B230 ; =ov71_0224BF84
	add r1, r5, #4
	ldr r2, [r2, r3]
	blx r2
	cmp r0, #0
	beq _0224B220
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #0
	str r0, [r5, #4]
_0224B220:
	add r0, r5, #0
	bl ov71_0224B234
	mov r0, #0
	pop {r3, r4, r5, pc}
_0224B22A:
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_0224B230: .word ov71_0224BF84
	thumb_func_end ov71_0224B1FC

	thumb_func_start ov71_0224B234
ov71_0224B234: ; 0x0224B234
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	bl G3X_Reset
	mov r1, #0
	mov r0, #0x11
	add r2, r1, #0
	bl NNS_G3dGeBufferOP_N
	bl NNS_G3dGeFlushBuffer
	bl NNS_G2dSetupSoftwareSpriteCamera
	ldr r0, [r4, #0x10]
	bl sub_02009418
	ldr r0, [r4, #0x10]
	bl sub_02008120
	mov r2, #1
	str r2, [sp]
	mov r0, #0x12
	add r1, sp, #0
	bl NNS_G3dGeBufferOP_N
	ldr r0, [r4, #0x74]
	cmp r0, #0
	beq _0224B272
	bl ov71_022474CC
_0224B272:
	mov r0, #0
	add r1, r0, #0
	bl sub_02026E50
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov71_0224B234

	thumb_func_start ov71_0224B280
ov71_0224B280: ; 0x0224B280
	push {r3, r4, lr}
	sub sp, #0x1c
	add r4, r0, #0
	ldr r0, _0224B430 ; =ov71_0224BFDC
	bl GX_SetBanks
	ldr r2, _0224B434 ; =0x04000304
	ldrh r1, [r2]
	lsr r0, r2, #0xb
	orr r0, r1
	strh r0, [r2]
	ldr r0, _0224B438 ; =ov71_0224BF94
	bl SetBothScreensModesAndDisable
	ldr r0, [r4, #0x58]
	ldr r2, _0224B43C ; =ov71_0224BFA4
	mov r1, #1
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x58]
	ldr r2, _0224B440 ; =ov71_0224BFC0
	mov r1, #2
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	ldr r2, _0224B444 ; =0x04000008
	mov r0, #3
	ldrh r3, [r2]
	mov r1, #1
	bic r3, r0
	add r0, r3, #0
	orr r0, r1
	strh r0, [r2]
	mov r2, #0
	str r2, [sp]
	ldr r0, [r4, #0x58]
	add r3, r1, #0
	bl BG_FillCharDataRange
	mov r2, #0
	str r2, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [r4, #0x58]
	mov r1, #1
	add r3, r2, #0
	bl FillBgTilemapRect
	ldr r0, [r4]
	bl ov71_022473D0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x39
	str r0, [sp, #4]
	ldr r0, [r4, #0x58]
	mov r1, #1
	mov r2, #0x6d
	mov r3, #2
	bl LoadUserFrameGfx2
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #4
	add r1, r4, #0
	str r0, [sp, #8]
	mov r2, #1
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	ldr r0, [r4, #0x58]
	add r1, #0x5c
	mov r3, #2
	bl AddWindowParameterized
	add r0, r4, #0
	add r0, #0x5c
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r3, #0x20
	str r3, [sp]
	mov r0, #0x39
	str r0, [sp, #4]
	mov r0, #0x10
	mov r1, #8
	mov r2, #0
	bl GfGfxLoader_GXLoadPal
	ldr r0, [r4, #0x58]
	mov r1, #1
	bl BgCommitTilemapBufferToVram
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x58]
	mov r0, #0x59
	mov r1, #0x16
	mov r3, #2
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x39
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x58]
	mov r0, #0x59
	mov r1, #0x15
	mov r3, #2
	bl GfGfxLoader_LoadScrnData
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x39
	mov r2, #0
	str r0, [sp, #4]
	mov r0, #0x59
	mov r1, #0x17
	add r3, r2, #0
	bl GfGfxLoader_GXLoadPal
	add r0, r4, #0
	bl ov71_0224B720
	mov r1, #0
	mov r0, #1
	add r2, r1, #0
	add r3, r1, #0
	bl ov71_0224744C
	str r0, [r4, #0x74]
	add r0, r4, #0
	bl ov71_0224B7EC
	mov r1, #6
	mov r2, #1
	str r0, [r4, #0x14]
	bl sub_020087A4
	mov r1, #0
	mov r0, #0x13
	str r1, [sp]
	lsl r0, r0, #0xc
	str r0, [sp, #4]
	mov r0, #0x1e
	lsl r0, r0, #0xe
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r4, #0x74]
	mov r2, #0x59
	mov r3, #0x1b
	bl ov71_02247610
	ldr r2, _0224B448 ; =ov71_0224BF7C
	str r0, [r4, #0x78]
	ldrh r3, [r2]
	add r0, sp, #0x14
	add r1, sp, #0x14
	strh r3, [r0]
	ldrh r3, [r2, #2]
	ldrh r2, [r2, #4]
	strh r3, [r0, #2]
	strh r2, [r0, #4]
	ldr r0, [r4, #0x78]
	bl ov71_022476EC
	add r0, r4, #0
	bl ov71_0224B848
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #0
	str r0, [sp]
	ldr r0, _0224B44C ; =0x04000050
	mov r1, #1
	mov r2, #4
	mov r3, #0x10
	bl G2x_SetBlendAlpha_
	mov r0, #0x10
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x39
	str r0, [sp, #8]
	mov r0, #3
	add r2, r1, #0
	mov r3, #0
	bl BeginNormalPaletteFade
	mov r0, #1
	add sp, #0x1c
	pop {r3, r4, pc}
	.balign 4, 0
_0224B430: .word ov71_0224BFDC
_0224B434: .word 0x04000304
_0224B438: .word ov71_0224BF94
_0224B43C: .word ov71_0224BFA4
_0224B440: .word ov71_0224BFC0
_0224B444: .word 0x04000008
_0224B448: .word ov71_0224BF7C
_0224B44C: .word 0x04000050
	thumb_func_end ov71_0224B280

	thumb_func_start ov71_0224B450
ov71_0224B450: ; 0x0224B450
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r1]
	cmp r0, #0
	bne _0224B476
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0224B476
	ldr r0, [r4, #0x40]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r4, #0x40]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #1
	pop {r4, pc}
_0224B476:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov71_0224B450

	thumb_func_start ov71_0224B47C
ov71_0224B47C: ; 0x0224B47C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r1, #0
	ldr r1, [r5]
	add r4, r0, #0
	cmp r1, #4
	bhi _0224B576
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0224B496: ; jump table
	.short _0224B4A0 - _0224B496 - 2 ; case 0
	.short _0224B4AE - _0224B496 - 2 ; case 1
	.short _0224B4DC - _0224B496 - 2 ; case 2
	.short _0224B504 - _0224B496 - 2 ; case 3
	.short _0224B566 - _0224B496 - 2 ; case 4
_0224B4A0:
	add r1, r4, #0
	add r1, #0x80
	bl ov71_0224B9CC
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
_0224B4AE:
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	cmp r0, #0
	bne _0224B576
	ldr r0, [r4, #0x44]
	mov r1, #2
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r4, #0x44]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, [r4, #0x78]
	mov r1, #0
	bl ov71_02247704
	mov r0, #0
	str r0, [r4, #8]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224B576
_0224B4DC:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0xa
	ble _0224B576
	ldr r0, [r4, #0x14]
	mov r1, #6
	mov r2, #0
	bl sub_020087A4
	add r0, r4, #0
	mov r1, #0x10
	mov r2, #0
	mov r3, #0xc
	bl ov71_0224B910
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _0224B576
_0224B504:
	bl ov71_0224B960
	cmp r0, #0
	beq _0224B576
	ldr r0, [r4]
	bl ov71_02247398
	mov r1, #0x4c
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	bne _0224B55A
	ldr r0, [r4]
	bl ov71_022473BC
	add r2, r0, #0
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	add r1, sp, #0
	mov r3, #1
	bl sub_020729A4
	ldr r0, [r4]
	bl ov71_022473BC
	add r6, r0, #0
	ldr r0, [r4]
	bl ov71_022473C4
	add r2, r0, #0
	add r1, sp, #0
	lsl r2, r2, #0x18
	ldrb r1, [r1]
	add r0, r6, #0
	lsr r2, r2, #0x18
	bl sub_020062E0
	ldr r0, [r4, #0x14]
	mov r1, #1
	bl sub_02008550
_0224B55A:
	mov r0, #0
	str r0, [r4, #8]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224B576
_0224B566:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0x1e
	ble _0224B576
	add sp, #4
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_0224B576:
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov71_0224B47C

	thumb_func_start ov71_0224B57C
ov71_0224B57C: ; 0x0224B57C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r1, #0
	ldr r1, [r5]
	add r4, r0, #0
	cmp r1, #5
	bhi _0224B5B8
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0224B596: ; jump table
	.short _0224B5A2 - _0224B596 - 2 ; case 0
	.short _0224B5AE - _0224B596 - 2 ; case 1
	.short _0224B62C - _0224B596 - 2 ; case 2
	.short _0224B68E - _0224B596 - 2 ; case 3
	.short _0224B6AE - _0224B596 - 2 ; case 4
	.short _0224B6D8 - _0224B596 - 2 ; case 5
_0224B5A2:
	mov r0, #0
	str r0, [r4, #8]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224B6E6
_0224B5AE:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0xa
	bgt _0224B5BA
_0224B5B8:
	b _0224B6E6
_0224B5BA:
	ldr r0, [r4]
	bl ov71_0224738C
	str r0, [sp, #0xc]
	ldr r0, [r4]
	bl ov71_02247388
	add r7, r0, #0
	ldr r0, [r4]
	bl ov71_022473DC
	cmp r0, #1
	bne _0224B5DA
	mov r1, #2
	add r6, r1, #0
	b _0224B5DE
_0224B5DA:
	mov r1, #5
	mov r6, #3
_0224B5DE:
	ldr r0, [sp, #0xc]
	ldr r2, [r4, #0x6c]
	bl ReadMsgDataIntoString
	ldr r1, [r4, #0x70]
	ldr r2, [r4, #0x6c]
	add r0, r7, #0
	bl StringExpandPlaceholders
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	str r3, [sp, #8]
	add r0, r4, #0
	ldr r2, [r4, #0x70]
	add r0, #0x5c
	mov r1, #1
	bl AddTextPrinterParameterized
	add r0, r4, #0
	add r0, #0x5c
	mov r1, #0x6d
	mov r2, #2
	bl sub_0200E948
	add r0, r4, #0
	add r0, #0x5c
	bl CopyWindowToVram
	ldr r0, _0224B6EC ; =0x000004A4
	bl PlayFanfare
	mov r0, #0
	str r0, [r4, #8]
	mov r0, #1
	str r0, [r4, #0xc]
	str r6, [r5]
	b _0224B6E6
_0224B62C:
	mov r1, #0x3c
	bl ov71_0224B6F0
	cmp r0, #0
	beq _0224B6E6
	ldr r0, [r4]
	bl ov71_0224738C
	add r6, r0, #0
	ldr r0, [r4]
	bl ov71_02247388
	add r7, r0, #0
	ldr r2, [r4, #0x6c]
	add r0, r6, #0
	mov r1, #3
	bl ReadMsgDataIntoString
	ldr r1, [r4, #0x70]
	ldr r2, [r4, #0x6c]
	add r0, r7, #0
	bl StringExpandPlaceholders
	add r0, r4, #0
	add r0, #0x5c
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	str r3, [sp, #8]
	add r0, r4, #0
	ldr r2, [r4, #0x70]
	add r0, #0x5c
	mov r1, #1
	bl AddTextPrinterParameterized
	add r0, r4, #0
	add r0, #0x5c
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0
	str r0, [r4, #8]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224B6E6
_0224B68E:
	mov r1, #0x3c
	bl ov71_0224B6F0
	cmp r0, #0
	beq _0224B6E6
	add r0, r4, #0
	add r0, #0x5c
	mov r1, #0
	bl ClearFrameAndWindow2
	mov r0, #0
	str r0, [r4, #8]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224B6E6
_0224B6AE:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0xa
	ble _0224B6E6
	mov r0, #0x10
	str r0, [sp]
	mov r1, #0
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x39
	str r0, [sp, #8]
	mov r0, #3
	add r2, r1, #0
	add r3, r1, #0
	bl BeginNormalPaletteFade
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224B6E6
_0224B6D8:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0224B6E6
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224B6E6:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224B6EC: .word 0x000004A4
	thumb_func_end ov71_0224B57C

	thumb_func_start ov71_0224B6F0
ov71_0224B6F0: ; 0x0224B6F0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r4, r1, #0
	cmp r0, #0
	beq _0224B702
	bl IsFanfarePlaying
	str r0, [r5, #0xc]
_0224B702:
	ldr r0, [r5, #8]
	cmp r0, r4
	bge _0224B710
	add r0, r0, #1
	str r0, [r5, #8]
	mov r0, #0
	pop {r3, r4, r5, pc}
_0224B710:
	ldr r0, [r5, #0xc]
	cmp r0, #0
	bne _0224B71A
	mov r0, #1
	pop {r3, r4, r5, pc}
_0224B71A:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov71_0224B6F0

	thumb_func_start ov71_0224B720
ov71_0224B720: ; 0x0224B720
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl NNS_G3dInit
	bl G3X_InitMtxStack
	ldr r0, _0224B7C8 ; =0x04000060
	ldr r2, _0224B7CC ; =0xFFFFCFFD
	ldrh r1, [r0]
	and r1, r2
	strh r1, [r0]
	ldrh r3, [r0]
	add r1, r2, #2
	and r3, r1
	mov r1, #0x10
	orr r1, r3
	strh r1, [r0]
	ldrh r3, [r0]
	ldr r1, _0224B7D0 ; =0x0000CFFB
	and r1, r3
	strh r1, [r0]
	add r1, r2, #2
	ldrh r3, [r0]
	lsr r2, r2, #0x11
	and r3, r1
	mov r1, #8
	orr r1, r3
	strh r1, [r0]
	mov r0, #0
	add r1, r0, #0
	mov r3, #0x3f
	str r0, [sp]
	bl G3X_SetClearColor
	ldr r1, _0224B7D4 ; =0x04000540
	mov r0, #2
	str r0, [r1]
	ldr r0, _0224B7D8 ; =0xBFFF0000
	str r0, [r1, #0x40]
	mov r0, #1
	add r1, r0, #0
	bl GF_3DVramMan_InitFrameTexVramManager
	mov r0, #1
	lsl r0, r0, #0xe
	mov r1, #1
	bl GF_3DVramMan_InitFramePlttVramManager
	ldr r3, _0224B7DC ; =NNS_GfdDefaultFuncAllocTexVram
	mov r0, #1
	mov r1, #0
	ldr r3, [r3]
	lsl r0, r0, #0xe
	add r2, r1, #0
	blx r3
	ldr r3, _0224B7E0 ; =NNS_GfdDefaultFuncAllocPlttVram
	add r4, r0, #0
	ldr r3, [r3]
	mov r0, #0x80
	mov r1, #0
	mov r2, #1
	blx r3
	ldr r2, _0224B7E4 ; =0x7FFF0000
	add r6, r0, #0
	and r2, r4
	lsl r1, r4, #0x10
	lsr r2, r2, #0x10
	ldr r0, [r5, #0x10]
	lsr r1, r1, #0xd
	lsl r2, r2, #4
	bl sub_020093FC
	ldr r2, _0224B7E8 ; =0xFFFF0000
	lsl r1, r6, #0x10
	and r2, r6
	lsr r2, r2, #0x10
	ldr r0, [r5, #0x10]
	lsr r1, r1, #0xd
	lsl r2, r2, #3
	bl sub_02009408
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0224B7C8: .word 0x04000060
_0224B7CC: .word 0xFFFFCFFD
_0224B7D0: .word 0x0000CFFB
_0224B7D4: .word 0x04000540
_0224B7D8: .word 0xBFFF0000
_0224B7DC: .word NNS_GfdDefaultFuncAllocTexVram
_0224B7E0: .word NNS_GfdDefaultFuncAllocPlttVram
_0224B7E4: .word 0x7FFF0000
_0224B7E8: .word 0xFFFF0000
	thumb_func_end ov71_0224B720

	thumb_func_start ov71_0224B7EC
ov71_0224B7EC: ; 0x0224B7EC
	push {r3, r4, r5, lr}
	sub sp, #0x20
	add r5, r0, #0
	ldr r0, [r5]
	bl ov71_02247398
	add r4, r0, #0
	add r0, sp, #0x10
	add r1, r4, #0
	mov r2, #2
	mov r3, #0
	bl GetBoxmonSpriteCharAndPlttNarcIds
	ldr r0, [r5]
	bl ov71_022473BC
	add r2, r0, #0
	add r0, r5, #0
	add r0, #0x84
	add r1, r5, #0
	ldr r0, [r0]
	add r1, #0x18
	mov r3, #1
	bl sub_02072914
	add r0, r4, #0
	mov r1, #2
	mov r2, #0
	bl sub_02070854
	add r3, r0, #0
	mov r1, #0
	str r1, [sp]
	add r0, r5, #0
	str r1, [sp, #4]
	add r0, #0x18
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r5, #0x10]
	add r3, #0x50
	add r1, sp, #0x10
	mov r2, #0x80
	bl sub_020085EC
	add sp, #0x20
	pop {r3, r4, r5, pc}
	thumb_func_end ov71_0224B7EC

	thumb_func_start ov71_0224B848
ov71_0224B848: ; 0x0224B848
	push {r4, lr}
	sub sp, #0x70
	add r4, r0, #0
	add r0, #0x48
	mov r1, #0x59
	mov r2, #7
	mov r3, #8
	bl ov71_022472C4
	add r0, sp, #0x5c
	bl NNS_G2dInitImagePaletteProxy
	add r0, sp, #0x38
	bl NNS_G2dInitImageProxy
	mov r3, #0
	str r3, [sp]
	mov r2, #1
	str r2, [sp, #4]
	str r3, [sp, #8]
	mov r0, #0x39
	str r0, [sp, #0xc]
	add r0, sp, #0x38
	str r0, [sp, #0x10]
	mov r0, #0x59
	mov r1, #9
	bl GfGfxLoader_LoadImageMapping
	mov r0, #0x39
	str r0, [sp]
	add r0, sp, #0x5c
	str r0, [sp, #4]
	mov r0, #0x59
	mov r1, #0xa
	mov r2, #1
	mov r3, #0
	bl GfGfxLoader_PartiallyLoadPalette
	mov r0, #2
	add r1, r4, #0
	str r0, [sp]
	add r0, sp, #0x14
	add r1, #0x48
	add r2, sp, #0x38
	add r3, sp, #0x5c
	bl ov71_02247320
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	add r1, sp, #0x14
	mov r2, #0x80
	mov r3, #0x64
	bl ov71_02247340
	str r0, [r4, #0x40]
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	add r1, sp, #0x14
	mov r2, #0x80
	mov r3, #0x5a
	bl ov71_02247340
	str r0, [r4, #0x44]
	mov r1, #1
	bl sub_02024A04
	ldr r0, [r4, #0x40]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r4, #0x44]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add sp, #0x70
	pop {r4, pc}
	thumb_func_end ov71_0224B848

	thumb_func_start ov71_0224B8EC
ov71_0224B8EC: ; 0x0224B8EC
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r4, #0
	add r5, r6, #0
_0224B8F4:
	ldr r0, [r5, #0x40]
	cmp r0, #0
	beq _0224B8FE
	bl sub_02024758
_0224B8FE:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #2
	blt _0224B8F4
	add r6, #0x48
	add r0, r6, #0
	bl ov71_022472FC
	pop {r4, r5, r6, pc}
	thumb_func_end ov71_0224B8EC

	thumb_func_start ov71_0224B910
ov71_0224B910: ; 0x0224B910
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0x39
	mov r1, #0x14
	str r2, [sp]
	add r7, r3, #0
	bl AllocFromHeap
	add r4, r0, #0
	beq _0224B956
	str r5, [r4]
	lsl r0, r6, #0xc
	str r0, [r4, #4]
	ldr r0, [sp]
	lsl r1, r0, #0xc
	str r1, [r4, #8]
	ldr r0, [r4, #4]
	sub r0, r1, r0
	add r1, r7, #0
	bl _s32_div_f
	str r0, [r4, #0xc]
	ldr r0, _0224B958 ; =ov71_0224B990
	str r7, [r4, #0x10]
	add r1, r4, #0
	mov r2, #0
	bl sub_0200E33C
	str r0, [r5, #0x7c]
	ldr r0, _0224B95C ; =0x04000050
	mov r1, #1
	add r2, r6, #0
	bl G2x_SetBlendBrightness_
_0224B956:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224B958: .word ov71_0224B990
_0224B95C: .word 0x04000050
	thumb_func_end ov71_0224B910

	thumb_func_start ov71_0224B960
ov71_0224B960: ; 0x0224B960
	ldr r0, [r0, #0x7c]
	cmp r0, #0
	bne _0224B96A
	mov r0, #1
	bx lr
_0224B96A:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov71_0224B960

	thumb_func_start ov71_0224B970
ov71_0224B970: ; 0x0224B970
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x7c]
	cmp r0, #0
	beq _0224B98C
	bl sub_0201F988
	bl ov71_02247424
	ldr r0, [r4, #0x7c]
	bl DestroySysTask
	mov r0, #0
	str r0, [r4, #0x7c]
_0224B98C:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov71_0224B970

	thumb_func_start ov71_0224B990
ov71_0224B990: ; 0x0224B990
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4, #0x10]
	sub r0, r0, #1
	str r0, [r4, #0x10]
	cmp r0, #0
	ble _0224B9B2
	ldr r1, [r4, #4]
	ldr r0, [r4, #0xc]
	add r2, r1, r0
	str r2, [r4, #4]
	ldr r0, _0224B9C8 ; =0x04000050
	mov r1, #1
	asr r2, r2, #0xc
	bl G2x_SetBlendBrightness_
	pop {r4, pc}
_0224B9B2:
	ldr r2, [r4, #8]
	ldr r0, _0224B9C8 ; =0x04000050
	mov r1, #1
	asr r2, r2, #0xc
	bl G2x_SetBlendBrightness_
	ldr r0, [r4]
	bl ov71_0224B970
	pop {r4, pc}
	nop
_0224B9C8: .word 0x04000050
	thumb_func_end ov71_0224B990

	thumb_func_start ov71_0224B9CC
ov71_0224B9CC: ; 0x0224B9CC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0x39
	mov r1, #0x44
	bl AllocFromHeap
	add r4, r0, #0
	beq _0224BA3A
	mov r1, #0
	str r1, [r4, #4]
	str r6, [r4]
	ldr r0, [r5, #0x74]
	str r0, [r4, #0x10]
	ldr r0, [r5, #0x78]
	str r0, [r4, #0x14]
	str r5, [r4, #8]
	ldr r0, _0224BA40 ; =0x000018CC
	str r1, [r4, #0x18]
	str r0, [r4, #0x1c]
	mov r0, #0x14
	str r0, [r4, #0x20]
	mov r0, #1
	lsl r0, r0, #0xc
	strh r0, [r4, #0x3a]
	str r1, [r4, #0x40]
	ldr r0, [r4, #0x14]
	bl ov71_02247708
	ldr r0, [r4, #0x14]
	mov r1, #1
	bl ov71_02247704
	add r1, r4, #0
	ldr r0, [r4, #0x14]
	add r1, #0x24
	bl ov71_022476B4
	add r1, r4, #0
	ldr r0, [r4, #0x14]
	add r1, #0x34
	bl ov71_022476D4
	ldr r0, _0224BA44 ; =ov71_0224BABC
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	str r0, [r6]
	cmp r0, #0
	bne _0224BA3E
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, r5, r6, pc}
_0224BA3A:
	mov r0, #0
	str r0, [r6]
_0224BA3E:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0224BA40: .word 0x000018CC
_0224BA44: .word ov71_0224BABC
	thumb_func_end ov71_0224B9CC

	thumb_func_start ov71_0224BA48
ov71_0224BA48: ; 0x0224BA48
	push {r4, lr}
	add r4, r0, #0
	beq _0224BA62
	bl sub_0201F988
	ldr r1, [r0]
	mov r2, #0
	str r2, [r1]
	bl FreeToHeap
	add r0, r4, #0
	bl DestroySysTask
_0224BA62:
	pop {r4, pc}
	thumb_func_end ov71_0224BA48

	thumb_func_start ov71_0224BA64
ov71_0224BA64: ; 0x0224BA64
	add r1, r0, #0
	ldr r0, [r1, #0x40]
	cmp r0, #0
	beq _0224BA86
	mov r0, #0x3a
	ldrsh r2, [r1, r0]
	mov r0, #0x3c
	ldrsh r0, [r1, r0]
	add r0, r2, r0
	strh r0, [r1, #0x3a]
	ldr r0, [r1, #0x40]
	sub r0, r0, #1
	str r0, [r1, #0x40]
	bne _0224BA86
	mov r0, #0x3e
	ldrsh r0, [r1, r0]
	strh r0, [r1, #0x3a]
_0224BA86:
	mov r0, #0x36
	ldrsh r2, [r1, r0]
	mov r0, #0x3a
	ldrsh r0, [r1, r0]
	ldr r3, _0224BA9C ; =ov71_022476EC
	add r0, r2, r0
	strh r0, [r1, #0x36]
	ldr r0, [r1, #0x14]
	add r1, #0x34
	bx r3
	nop
_0224BA9C: .word ov71_022476EC
	thumb_func_end ov71_0224BA64

	thumb_func_start ov71_0224BAA0
ov71_0224BAA0: ; 0x0224BAA0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	beq _0224BAB8
	mov r0, #0x3a
	ldrsh r0, [r5, r0]
	sub r0, r1, r0
	add r1, r4, #0
	bl _s32_div_f
	strh r0, [r5, #0x3c]
	str r4, [r5, #0x40]
_0224BAB8:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov71_0224BAA0

	thumb_func_start ov71_0224BABC
ov71_0224BABC: ; 0x0224BABC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl ov71_0224BA64
	ldr r0, [r4, #4]
	cmp r0, #5
	bhi _0224BBCA
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0224BADA: ; jump table
	.short _0224BAE6 - _0224BADA - 2 ; case 0
	.short _0224BB16 - _0224BADA - 2 ; case 1
	.short _0224BB2E - _0224BADA - 2 ; case 2
	.short _0224BB44 - _0224BADA - 2 ; case 3
	.short _0224BB8C - _0224BADA - 2 ; case 4
	.short _0224BBBA - _0224BADA - 2 ; case 5
_0224BAE6:
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _0224BB06
	ldr r1, [r4, #0x18]
	ldr r0, [r4, #0x1c]
	add r0, r1, r0
	str r0, [r4, #0x18]
	ldr r0, [r4, #0x20]
	sub r0, r0, #1
	str r0, [r4, #0x20]
	ldr r1, [r4, #0x18]
	ldr r0, [r4, #0x14]
	asr r1, r1, #0xc
	bl ov71_02247708
	pop {r3, r4, r5, pc}
_0224BB06:
	ldr r0, [r4, #0x14]
	mov r1, #0x1f
	bl ov71_02247708
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
_0224BB16:
	mov r1, #6
	add r0, r4, #0
	lsl r1, r1, #6
	mov r2, #0x1e
	bl ov71_0224BAA0
	mov r0, #0
	str r0, [r4, #0xc]
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
_0224BB2E:
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	cmp r0, #0xa
	ble _0224BBCA
	mov r0, #0
	str r0, [r4, #0x30]
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
_0224BB44:
	ldr r1, [r4, #0x28]
	ldr r0, [r4, #0x30]
	add r0, r1, r0
	str r0, [r4, #0x28]
	mov r0, #0x1e
	ldr r1, [r4, #0x30]
	lsl r0, r0, #6
	sub r0, r1, r0
	str r0, [r4, #0x30]
	add r1, r4, #0
	ldr r0, [r4, #0x14]
	add r1, #0x24
	bl ov71_022476C4
	ldr r1, [r4, #0x28]
	ldr r0, _0224BBCC ; =0xFFFF5000
	cmp r1, r0
	bge _0224BBCA
	ldr r0, _0224BBD0 ; =0x000005E6
	bl PlaySE
	mov r0, #0
	ldr r1, [r4, #0x30]
	mvn r0, r0
	mul r0, r1
	str r0, [r4, #0x30]
	ldr r0, [r4, #8]
	mov r1, #0
	mov r2, #0x10
	mov r3, #8
	bl ov71_0224B910
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
_0224BB8C:
	ldr r1, [r4, #0x28]
	ldr r0, [r4, #0x30]
	add r1, r1, r0
	mov r0, #0x13
	lsl r0, r0, #0xc
	str r1, [r4, #0x28]
	cmp r1, r0
	blt _0224BB9E
	str r0, [r4, #0x28]
_0224BB9E:
	add r1, r4, #0
	ldr r0, [r4, #0x14]
	add r1, #0x24
	bl ov71_022476C4
	mov r0, #0x13
	ldr r1, [r4, #0x28]
	lsl r0, r0, #0xc
	cmp r1, r0
	bne _0224BBCA
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
_0224BBBA:
	ldr r0, [r4, #8]
	bl ov71_0224B960
	cmp r0, #0
	beq _0224BBCA
	add r0, r5, #0
	bl ov71_0224BA48
_0224BBCA:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0224BBCC: .word 0xFFFF5000
_0224BBD0: .word 0x000005E6
	thumb_func_end ov71_0224BABC

	.rodata

_0224BBD4:
	.byte 0x90, 0x00, 0x00, 0x00, 0x38, 0x00, 0x00, 0x00

ov71_0224BBDC: ; 0x0224BBDC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00

ov71_0224BBEC: ; 0x0224BBEC
	.word ov71_022478C8

ov71_0224BBF0: ; 0x0224BBF0
	.word ov71_02247990

ov71_0224BBF4: ; 0x0224BBF4
	.word ov71_02247924

ov71_0224BBF8: ; 0x0224BBF8
	.byte 0x03, 0x00, 0x00, 0x00
	.word ov71_022482EC
	.word ov71_022483AC
	.word ov71_02248358
	.byte 0x03, 0x00, 0x00, 0x00
	.word ov71_022494A0
	.word ov71_02249500
	.word ov71_022494D0
	.byte 0x03, 0x00, 0x00, 0x00
	.word ov71_02249CF0
	.word ov71_02249D28
	.word ov71_02249D14
	.byte 0x01, 0x00, 0x00, 0x00
	.word ov71_0224A0F0
	.word ov71_0224A15C
	.word ov71_0224A12C
	.byte 0x05, 0x00, 0x00, 0x00
	.word ov71_0224A920
	.word ov71_0224A98C
	.word ov71_0224A954
	.byte 0x05, 0x00, 0x00, 0x00
	.word ov71_0224B138
	.word ov71_0224B1FC
	.word ov71_0224B198
	.byte 0x05, 0x00, 0x00, 0x00

ov71_0224BC5C: ; 0x0224BC5C
	.byte 0x00, 0x00, 0x00, 0xF0
	.byte 0x00, 0x00, 0x00, 0x00

ov71_0224BC64: ; 0x0224BC64
	.word ov71_02247A10
	.word ov71_02247C34
	.word ov71_02247C60
	.word ov71_02247DEC

ov71_0224BC74: ; 0x0224BC74
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00

ov71_0224BC84: ; 0x0224BC84
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov71_0224BCA0: ; 0x0224BCA0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov71_0224BCBC: ; 0x0224BCBC
	.byte 0x02, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00

ov71_0224BCE4: ; 0x0224BCE4
	.byte 0x20, 0x00, 0x60, 0x00, 0xA0, 0x00, 0xE0, 0x00

ov71_0224BCEC: ; 0x0224BCEC
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

ov71_0224BCFC: ; 0x0224BCFC
	.word ov71_02248408
	.word ov71_0224843C
	.word ov71_02248484
	.word ov71_02248530

ov71_0224BD0C: ; 0x0224BD0C
	.byte 0x84, 0x10, 0x84, 0x10
	.byte 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10

ov71_0224BD1C: ; 0x0224BD1C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x01, 0x16, 0x00
	.byte 0x00, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00

ov71_0224BD38: ; 0x0224BD38
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x1E, 0x04, 0x00, 0x03, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov71_0224BD54: ; 0x0224BD54
	.byte 0x02, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00

ov71_0224BD7C: ; 0x0224BD7C
	.word ov71_02249558
	.word ov71_022495A0

ov71_0224BD84: ; 0x0224BD84
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00

ov71_0224BD94: ; 0x0224BD94
	.byte 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10
	.byte 0x84, 0x10, 0x84, 0x10

ov71_0224BDA4: ; 0x0224BDA4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x1E, 0x00, 0x00, 0x03, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00

ov71_0224BDC0: ; 0x0224BDC0
	.byte 0x02, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00

ov71_0224BDE8: ; 0x0224BDE8
	.word ov71_02249D58
	.word ov71_02249D80

ov71_0224BDF0: ; 0x0224BDF0
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

ov71_0224BE00: ; 0x0224BE00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x1A, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00

ov71_0224BE1C: ; 0x0224BE1C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x1C, 0x04
	.byte 0x00, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00

ov71_0224BE38: ; 0x0224BE38
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x01, 0x00, 0x03, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov71_0224BE54: ; 0x0224BE54
	.byte 0x02, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00

ov71_0224BE7C: ; 0x0224BE7C
	.word ov71_0224A18C
	.word ov71_0224A1C4

ov71_0224BE84: ; 0x0224BE84
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00

ov71_0224BE94: ; 0x0224BE94
	.byte 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10
	.byte 0x84, 0x10, 0x84, 0x10

ov71_0224BEA4: ; 0x0224BEA4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x1E, 0x00, 0x00, 0x03, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00

ov71_0224BEC0: ; 0x0224BEC0
	.byte 0x02, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00

ov71_0224BEE8: ; 0x0224BEE8
	.byte 0x20, 0x00, 0x60, 0x00, 0xA0, 0x00, 0xE0, 0x00

ov71_0224BEF0: ; 0x0224BEF0
	.word ov71_0224A9F8
	.word ov71_0224AA28
	.word ov71_0224AAF8

ov71_0224BEFC: ; 0x0224BEFC
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

ov71_0224BF0C: ; 0x0224BF0C
	.byte 0x84, 0x10, 0x84, 0x10
	.byte 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10

ov71_0224BF1C: ; 0x0224BF1C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x01, 0x16, 0x00
	.byte 0x00, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00

ov71_0224BF38: ; 0x0224BF38
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x1E, 0x04, 0x00, 0x03, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov71_0224BF54: ; 0x0224BF54
	.byte 0x02, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00

ov71_0224BF7C: ; 0x0224BF7C
	.byte 0x00, 0x00, 0x00, 0xF0
	.byte 0x00, 0x00, 0x00, 0x00

ov71_0224BF84: ; 0x0224BF84
	.word ov71_0224B280
	.word ov71_0224B450
	.word ov71_0224B47C
	.word ov71_0224B57C

ov71_0224BF94: ; 0x0224BF94
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00

ov71_0224BFA4: ; 0x0224BFA4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov71_0224BFC0: ; 0x0224BFC0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov71_0224BFDC: ; 0x0224BFDC
	.byte 0x02, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00

	.data

_0224C020:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.bss

_0224C040:
	.space 0x4

ov71_0224C044: ; 0x0224C044
	.space 0x80

ov71_0224C0C4: ; 0x0224C0C4
	.space 0x4

ov71_0224C0C8: ; 0x0224C0C8
	.space 0x8

ov71_0224C0D0: ; 0x0224C0D0
	.space 0x10
