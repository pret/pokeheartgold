	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020F6288:
	.word ov39_02228140, ov39_02228308, ov39_02228370, 0xFFFFFFFF
_020F6298:
	.word sub_02019BA0, BgCommitTilemapBufferToVram, ScheduleBgTilemapBufferTransfer

	.bss

_021D1108:
	.space 0x4

	.text

	thumb_func_start sub_020192D0
sub_020192D0: ; 0x020192D0
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r1, #1
	lsl r1, r1, #0x1a
	ldr r0, [r1]
	ldr r2, _0201934C ; =0xFFFFE0FF
	and r0, r2
	str r0, [r1]
	ldr r0, _02019350 ; =0x04001000
	ldr r3, [r0]
	and r2, r3
	str r2, [r0]
	ldr r3, [r1]
	ldr r2, _02019354 ; =0xFFFF1FFF
	and r3, r2
	str r3, [r1]
	ldr r3, [r0]
	add r1, #0x50
	and r2, r3
	str r2, [r0]
	mov r2, #0
	strh r2, [r1]
	add r0, #0x50
	strh r2, [r0]
	mov r2, #0xa
	mov r0, #3
	mov r1, #0x7b
	lsl r2, r2, #0xe
	bl CreateHeap
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #0x7b
	bl OverlayManager_CreateAndGetData
	mov r1, #0
	mov r2, #0x80
	add r5, r0, #0
	bl MI_CpuFill8
	add r0, r4, #0
	bl OverlayManager_GetParentWork
	str r0, [r5]
	ldr r1, _02019358 ; =0x0000047D
	mov r0, #0xb
	mov r2, #1
	bl sub_02004EC4
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_0201934C: .word 0xFFFFE0FF
_02019350: .word 0x04001000
_02019354: .word 0xFFFF1FFF
_02019358: .word 0x0000047D
	thumb_func_end sub_020192D0

	thumb_func_start sub_0201935C
sub_0201935C: ; 0x0201935C
	push {r3, r4, r5, lr}
	add r5, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r5]
	add r4, r0, #0
	cmp r1, #8
	bhi _0201945A
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02019378: ; jump table
	.short _0201938A - _02019378 - 2 ; case 0
	.short _02019394 - _02019378 - 2 ; case 1
	.short _020193B6 - _02019378 - 2 ; case 2
	.short _020193CA - _02019378 - 2 ; case 3
	.short _020193F2 - _02019378 - 2 ; case 4
	.short _0201940E - _02019378 - 2 ; case 5
	.short _02019426 - _02019378 - 2 ; case 6
	.short _0201943A - _02019378 - 2 ; case 7
	.short _02019456 - _02019378 - 2 ; case 8
_0201938A:
	bl sub_020194B4
	mov r0, #1
	str r0, [r5]
	b _0201945A
_02019394:
	bl sub_02034DB8
	cmp r0, #0
	beq _0201945A
	ldr r1, [r4, #0x10]
	ldr r0, _02019480 ; =_021D1108
	str r1, [r0]
	ldr r0, _02019484 ; =sub_02019520
	ldr r1, _02019488 ; =sub_02019548
	bl ov00_021EC294
	mov r0, #1
	str r0, [r4, #0x78]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0201945A
_020193B6:
	ldr r0, _0201948C ; =_020F6288
	add r1, r4, #0
	mov r2, #0x7b
	bl OverlayManager_new
	str r0, [r4, #8]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0201945A
_020193CA:
	ldr r0, [r4, #8]
	bl OverlayManager_run
	cmp r0, #1
	bne _0201945A
	ldr r0, [r4, #8]
	bl OverlayManager_delete
	ldr r0, [r4, #0x7c]
	cmp r0, #1
	bne _020193EC
	mov r0, #1
	str r0, [r4, #4]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0201945A
_020193EC:
	mov r0, #8
	str r0, [r5]
	b _0201945A
_020193F2:
	ldr r0, [r4]
	ldrb r0, [r0, #0xc]
	bl sub_02087E10
	ldr r1, [r4]
	mov r2, #0x7b
	ldr r1, [r1]
	bl OverlayManager_new
	str r0, [r4, #8]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0201945A
_0201940E:
	ldr r0, [r4, #8]
	bl OverlayManager_run
	cmp r0, #1
	bne _0201945A
	ldr r0, [r4, #8]
	bl OverlayManager_delete
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0201945A
_02019426:
	ldr r0, _0201948C ; =_020F6288
	add r1, r4, #0
	mov r2, #0x7b
	bl OverlayManager_new
	str r0, [r4, #8]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0201945A
_0201943A:
	ldr r0, [r4, #8]
	bl OverlayManager_run
	cmp r0, #1
	bne _0201945A
	ldr r0, [r4, #8]
	bl OverlayManager_delete
	mov r0, #0
	str r0, [r4, #4]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0201945A
_02019456:
	mov r0, #1
	pop {r3, r4, r5, pc}
_0201945A:
	ldr r0, [r4, #0x78]
	cmp r0, #1
	bne _0201947C
	ldr r0, [r4, #4]
	cmp r0, #1
	bne _0201947C
	ldr r0, [r4, #0x7c]
	cmp r0, #1
	bne _0201947C
	bl ov00_021ECB40
	bl ov00_021EC9D4
	mov r1, #3
	sub r0, r1, r0
	bl sub_0203A930
_0201947C:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02019480: .word _021D1108
_02019484: .word sub_02019520
_02019488: .word sub_02019548
_0201948C: .word _020F6288
	thumb_func_end sub_0201935C

	thumb_func_start sub_02019490
sub_02019490: ; 0x02019490
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	bl sub_020194F8
	ldr r0, [r4]
	bl FreeToHeap
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0x7b
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02019490

	thumb_func_start sub_020194B4
sub_020194B4: ; 0x020194B4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x78]
	cmp r0, #0
	bne _020194F2
	bl LoadDwcOverlay
	bl LoadOVY38
	mov r0, #0x7b
	bl sub_02039FD8
	ldr r1, _020194F4 ; =0x00020020
	mov r0, #0x7b
	bl AllocFromHeap
	str r0, [r4, #0xc]
	add r0, #0x1f
	mov r1, #0x1f
	bic r0, r1
	mov r1, #2
	lsl r1, r1, #0x10
	mov r2, #0
	bl NNS_FndCreateExpHeapEx
	str r0, [r4, #0x10]
	bl sub_02034D8C
	mov r0, #4
	bl Sys_ClearSleepDisableFlag
_020194F2:
	pop {r4, pc}
	.balign 4, 0
_020194F4: .word 0x00020020
	thumb_func_end sub_020194B4

	thumb_func_start sub_020194F8
sub_020194F8: ; 0x020194F8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x78]
	cmp r0, #1
	bne _0201951E
	ldr r0, [r4, #0x10]
	bl NNS_FndDestroyExpHeap
	ldr r0, [r4, #0xc]
	bl FreeToHeap
	bl UnloadOVY38
	bl UnloadDwcOverlay
	bl sub_02034DE0
	mov r0, #0
	str r0, [r4, #0x78]
_0201951E:
	pop {r4, pc}
	thumb_func_end sub_020194F8

	thumb_func_start sub_02019520
sub_02019520: ; 0x02019520
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl OS_DisableInterrupts
	add r6, r0, #0
	ldr r0, _02019544 ; =_021D1108
	add r1, r5, #0
	ldr r0, [r0]
	add r2, r4, #0
	bl NNS_FndAllocFromExpHeapEx
	add r4, r0, #0
	add r0, r6, #0
	bl OS_RestoreInterrupts
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02019544: .word _021D1108
	thumb_func_end sub_02019520

	thumb_func_start sub_02019548
sub_02019548: ; 0x02019548
	push {r3, r4, r5, lr}
	add r5, r1, #0
	beq _02019564
	bl OS_DisableInterrupts
	add r4, r0, #0
	ldr r0, _02019568 ; =_021D1108
	add r1, r5, #0
	ldr r0, [r0]
	bl NNS_FndFreeToExpHeap
	add r0, r4, #0
	bl OS_RestoreInterrupts
_02019564:
	pop {r3, r4, r5, pc}
	nop
_02019568: .word _021D1108
	thumb_func_end sub_02019548

	thumb_func_start sub_0201956C
sub_0201956C: ; 0x0201956C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r7, r1, #0
	add r0, r3, #0
	mov r1, #0x10
	add r5, r2, #0
	str r3, [sp]
	bl AllocFromHeap
	add r4, r0, #0
	str r6, [r4]
	strh r5, [r4, #8]
	ldr r0, [sp]
	lsl r2, r7, #0x10
	str r0, [r4, #0xc]
	ldrh r0, [r4, #0xa]
	ldr r1, _020195BC ; =0xFFFF8000
	lsr r3, r2, #0x10
	lsr r2, r1, #0x11
	and r0, r1
	and r2, r3
	orr r0, r2
	strh r0, [r4, #0xa]
	ldrh r2, [r4, #0xa]
	sub r0, r1, #1
	lsl r5, r5, #4
	and r0, r2
	strh r0, [r4, #0xa]
	ldr r0, [sp]
	add r1, r5, #0
	bl AllocFromHeap
	mov r1, #0
	add r2, r5, #0
	str r0, [r4, #4]
	bl MI_CpuFill8
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020195BC: .word 0xFFFF8000
	thumb_func_end sub_0201956C

	thumb_func_start sub_020195C0
sub_020195C0: ; 0x020195C0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldrh r0, [r5, #8]
	mov r6, #0
	cmp r0, #0
	bls _020195E4
	add r4, r6, #0
_020195CE:
	ldr r0, [r5, #4]
	ldr r0, [r0, r4]
	cmp r0, #0
	beq _020195DA
	bl FreeToHeap
_020195DA:
	ldrh r0, [r5, #8]
	add r6, r6, #1
	add r4, #0x10
	cmp r6, r0
	blo _020195CE
_020195E4:
	ldr r0, [r5, #4]
	bl FreeToHeap
	add r0, r5, #0
	bl FreeToHeap
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020195C0

	thumb_func_start sub_020195F4
sub_020195F4: ; 0x020195F4
	push {r3, r4, r5, r6, r7, lr}
	lsl r7, r1, #4
	ldr r4, [r0, #4]
	ldr r1, [sp, #0x18]
	add r6, r3, #0
	mul r1, r6
	ldr r0, [r0, #0xc]
	add r5, r4, r7
	lsl r1, r1, #1
	str r2, [sp]
	bl AllocFromHeap
	str r0, [r4, r7]
	ldrh r0, [r5, #4]
	mov r1, #0x3f
	bic r0, r1
	lsl r1, r6, #0x10
	lsr r2, r1, #0x10
	mov r1, #0x3f
	and r1, r2
	orr r0, r1
	strh r0, [r5, #4]
	ldrh r1, [r5, #4]
	ldr r0, _02019660 ; =0xFFFFF03F
	and r1, r0
	ldr r0, [sp, #0x18]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x14
	orr r0, r1
	strh r0, [r5, #4]
	ldr r0, [sp]
	ldr r1, _02019664 ; =0xFFFF1FFF
	strb r0, [r5, #0xa]
	mov r0, #0
	strb r0, [r5, #6]
	strb r0, [r5, #7]
	ldrh r2, [r5, #4]
	and r1, r2
	strh r1, [r5, #4]
	mov r1, #1
	ldrh r2, [r5, #4]
	lsl r1, r1, #0xc
	orr r1, r2
	strh r1, [r5, #4]
	strb r0, [r5, #0xc]
	mov r1, #0x20
	strb r1, [r5, #0xd]
	strb r0, [r5, #0xe]
	mov r0, #0x18
	strb r0, [r5, #0xf]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02019660: .word 0xFFFFF03F
_02019664: .word 0xFFFF1FFF
	thumb_func_end sub_020195F4

	thumb_func_start sub_02019668
sub_02019668: ; 0x02019668
	push {r4, lr}
	ldr r3, [r0, #4]
	lsl r1, r1, #4
	add r4, r3, r1
	add r0, r2, #0
	ldrh r2, [r4, #4]
	ldr r1, [r3, r1]
	lsl r3, r2, #0x1a
	lsl r2, r2, #0x14
	lsr r3, r3, #0x1a
	lsr r2, r2, #0x1a
	mul r2, r3
	lsl r2, r2, #1
	bl MIi_CpuCopy16
	pop {r4, pc}
	thumb_func_end sub_02019668

	thumb_func_start sub_02019688
sub_02019688: ; 0x02019688
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r4, r1, #0
	str r0, [sp]
	add r0, r2, #0
	add r1, r3, #0
	ldr r2, [sp, #0x18]
	add r3, sp, #4
	bl GfGfxLoader_GetScrnData
	ldr r2, [sp, #4]
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	add r2, #0xc
	bl sub_02019668
	add r0, r6, #0
	bl FreeToHeap
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02019688

	thumb_func_start sub_020196B8
sub_020196B8: ; 0x020196B8
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r4, r1, #0
	str r0, [sp]
	add r0, r2, #0
	add r1, r3, #0
	ldr r2, [sp, #0x18]
	add r3, sp, #4
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	ldr r2, [sp, #4]
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	add r2, #0xc
	bl sub_02019668
	add r0, r6, #0
	bl FreeToHeap
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020196B8

	thumb_func_start sub_020196E8
sub_020196E8: ; 0x020196E8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	str r0, [sp, #0x1c]
	add r0, r2, #0
	ldr r2, [sp, #0x1c]
	lsl r1, r1, #4
	ldr r2, [r2, #4]
	add r4, r2, r1
	strb r0, [r4, #6]
	strb r3, [r4, #7]
	mov r1, #0xd
	ldrsb r1, [r4, r1]
	str r1, [sp, #0x28]
	cmp r0, r1
	bge _020197E6
	mov r1, #0xf
	ldrsb r1, [r4, r1]
	str r1, [sp, #0x20]
	cmp r3, r1
	bge _020197E6
	ldrh r1, [r4, #4]
	lsl r2, r1, #0x1a
	lsr r2, r2, #0x1a
	str r2, [sp, #0x2c]
	add r7, r0, r2
	mov r2, #0xc
	ldrsb r2, [r4, r2]
	mov ip, r2
	cmp r7, r2
	blt _020197E6
	lsl r1, r1, #0x14
	lsr r1, r1, #0x1a
	str r1, [sp, #0x24]
	add r6, r3, r1
	mov r1, #0xe
	ldrsb r2, [r4, r1]
	cmp r6, r2
	blt _020197E6
	lsl r1, r0, #0x18
	lsr r1, r1, #0x18
	str r1, [sp, #0x34]
	ldr r1, [sp, #0x2c]
	mov r5, #0
	lsl r1, r1, #0x18
	str r5, [sp, #0x30]
	mov r5, ip
	lsr r1, r1, #0x18
	cmp r0, r5
	bge _02019762
	mov r5, ip
	lsl r5, r5, #0x18
	lsr r5, r5, #0x18
	str r5, [sp, #0x34]
	mov r5, ip
	sub r0, r5, r0
	sub r1, r1, r0
	lsl r0, r0, #0x18
	lsl r1, r1, #0x18
	lsr r0, r0, #0x18
	lsr r1, r1, #0x18
	str r0, [sp, #0x30]
_02019762:
	ldr r0, [sp, #0x28]
	cmp r7, r0
	blt _02019770
	sub r0, r7, r0
	sub r0, r1, r0
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
_02019770:
	lsl r0, r3, #0x18
	lsr r7, r0, #0x18
	ldr r0, [sp, #0x24]
	mov r5, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r3, r2
	bge _02019790
	lsl r5, r2, #0x18
	sub r2, r2, r3
	sub r0, r0, r2
	lsl r0, r0, #0x18
	lsl r2, r2, #0x18
	lsr r7, r5, #0x18
	lsr r0, r0, #0x18
	lsr r5, r2, #0x18
_02019790:
	ldr r2, [sp, #0x20]
	cmp r6, r2
	blt _0201979E
	sub r2, r6, r2
	sub r0, r0, r2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
_0201979E:
	str r1, [sp]
	str r0, [sp, #4]
	ldr r0, [r4]
	add r3, r7, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x30]
	str r0, [sp, #0xc]
	str r5, [sp, #0x10]
	ldr r0, [sp, #0x2c]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x24]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	ldrb r1, [r4, #0xa]
	ldr r0, [r0]
	ldr r2, [sp, #0x34]
	bl CopyToBgTilemapRect
	ldr r2, [sp, #0x1c]
	ldr r0, [sp, #0x1c]
	ldrh r2, [r2, #0xa]
	ldrb r1, [r4, #0xa]
	ldr r0, [r0]
	lsl r2, r2, #0x11
	lsr r3, r2, #0xf
	ldr r2, _020197EC ; =_020F6298
	ldr r2, [r2, r3]
	blx r2
	ldrh r1, [r4, #4]
	ldr r0, _020197F0 ; =0xFFFFEFFF
	and r0, r1
	strh r0, [r4, #4]
_020197E6:
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020197EC: .word _020F6298
_020197F0: .word 0xFFFFEFFF
	thumb_func_end sub_020196E8

	thumb_func_start sub_020197F4
sub_020197F4: ; 0x020197F4
	push {r4, lr}
	ldr r2, [r0, #4]
	lsl r3, r1, #4
	add r4, r2, r3
	mov r2, #6
	mov r3, #7
	ldrsb r2, [r4, r2]
	ldrsb r3, [r4, r3]
	bl sub_020196E8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020197F4

	thumb_func_start sub_0201980C
sub_0201980C: ; 0x0201980C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	ldr r2, [r0, #4]
	str r0, [sp, #0x10]
	lsl r0, r1, #4
	add r4, r2, r0
	mov r0, #1
	ldrh r1, [r4, #4]
	lsl r0, r0, #0xc
	orr r0, r1
	strh r0, [r4, #4]
	mov r0, #0xd
	ldrsb r6, [r4, r0]
	mov r0, #6
	ldrsb r0, [r4, r0]
	cmp r0, r6
	bge _020198F4
	mov r1, #0xf
	ldrsb r1, [r4, r1]
	str r1, [sp, #0x28]
	mov r1, #7
	ldrsb r3, [r4, r1]
	ldr r1, [sp, #0x28]
	cmp r3, r1
	bge _020198F4
	ldrh r2, [r4, #4]
	lsl r1, r2, #0x1a
	lsr r1, r1, #0x1a
	str r1, [sp, #0x24]
	add r7, r0, r1
	mov r1, #0xc
	ldrsb r1, [r4, r1]
	mov ip, r1
	cmp r7, r1
	blt _020198F4
	lsl r1, r2, #0x14
	lsr r1, r1, #0x1a
	str r1, [sp, #0x1c]
	ldr r1, [sp, #0x1c]
	str r3, [sp, #0x18]
	add r2, r3, r1
	mov r1, #0xe
	ldrsb r1, [r4, r1]
	str r1, [sp, #0x14]
	cmp r2, r1
	blt _020198F4
	ldr r1, [sp, #0x24]
	mov r5, ip
	lsl r1, r1, #0x18
	str r0, [sp, #0x20]
	asr r1, r1, #0x18
	cmp r0, r5
	bge _02019884
	mov r5, ip
	str r5, [sp, #0x20]
	mov r5, ip
	sub r0, r5, r0
	sub r0, r1, r0
	lsl r0, r0, #0x18
	asr r1, r0, #0x18
_02019884:
	cmp r7, r6
	blt _02019890
	sub r0, r7, r6
	sub r0, r1, r0
	lsl r0, r0, #0x18
	asr r1, r0, #0x18
_02019890:
	ldr r0, [sp, #0x1c]
	ldr r5, [sp, #0x14]
	lsl r0, r0, #0x18
	asr r0, r0, #0x18
	cmp r3, r5
	bge _020198AA
	add r3, r5, #0
	add r6, r5, #0
	ldr r5, [sp, #0x18]
	sub r5, r6, r5
	sub r0, r0, r5
	lsl r0, r0, #0x18
	asr r0, r0, #0x18
_020198AA:
	ldr r5, [sp, #0x28]
	cmp r2, r5
	blt _020198B8
	sub r2, r2, r5
	sub r0, r0, r2
	lsl r0, r0, #0x18
	asr r0, r0, #0x18
_020198B8:
	lsl r2, r3, #0x18
	lsr r2, r2, #0x18
	lsl r1, r1, #0x18
	str r2, [sp]
	lsr r1, r1, #0x18
	lsl r0, r0, #0x18
	str r1, [sp, #4]
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	ldr r3, [sp, #0x20]
	ldrb r1, [r4, #0xa]
	lsl r3, r3, #0x18
	ldr r0, [r0]
	mov r2, #0
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r2, [sp, #0x10]
	ldr r0, [sp, #0x10]
	ldrh r2, [r2, #0xa]
	ldrb r1, [r4, #0xa]
	ldr r0, [r0]
	lsl r2, r2, #0x11
	lsr r3, r2, #0xf
	ldr r2, _020198F8 ; =_020F6298
	ldr r2, [r2, r3]
	blx r2
_020198F4:
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_020198F8: .word _020F6298
	thumb_func_end sub_0201980C

	thumb_func_start sub_020198FC
sub_020198FC: ; 0x020198FC
	push {r3, r4}
	ldr r4, [r0, #4]
	lsl r1, r1, #4
	add r1, r4, r1
	strb r2, [r1, #8]
	ldr r2, _0201992C ; =0xFFFFFFF8
	strb r3, [r1, #9]
	add r2, sp
	ldrb r2, [r2, #0x10]
	strb r2, [r1, #0xb]
	ldrh r3, [r1, #4]
	ldr r2, _02019930 ; =0xFFFF1FFF
	and r3, r2
	mov r2, #2
	lsl r2, r2, #0xc
	orr r3, r2
	strh r3, [r1, #4]
	ldrh r3, [r0, #0xa]
	lsl r1, r2, #2
	orr r1, r3
	strh r1, [r0, #0xa]
	pop {r3, r4}
	bx lr
	nop
_0201992C: .word 0xFFFFFFF8
_02019930: .word 0xFFFF1FFF
	thumb_func_end sub_020198FC

	thumb_func_start sub_02019934
sub_02019934: ; 0x02019934
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrh r1, [r5, #0xa]
	lsl r0, r1, #0x10
	lsr r0, r0, #0x1f
	beq _02019970
	ldr r0, _02019974 ; =0xFFFF7FFF
	add r6, r5, #0
	and r0, r1
	strh r0, [r5, #0xa]
	ldrh r0, [r5, #8]
	add r6, #0xa
	mov r4, #0
	cmp r0, #0
	bls _02019970
	mov r7, #2
	lsl r7, r7, #0xe
_02019956:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02019978
	cmp r0, #1
	bne _02019968
	ldrh r0, [r6]
	orr r0, r7
	strh r0, [r6]
_02019968:
	ldrh r0, [r5, #8]
	add r4, r4, #1
	cmp r4, r0
	blo _02019956
_02019970:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02019974: .word 0xFFFF7FFF
	thumb_func_end sub_02019934

	thumb_func_start sub_02019978
sub_02019978: ; 0x02019978
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	ldr r2, [r5, #4]
	lsl r4, r6, #4
	add r2, r2, r4
	ldrh r2, [r2, #4]
	lsl r2, r2, #0x10
	lsr r2, r2, #0x1d
	bne _02019990
	mov r0, #0
	pop {r4, r5, r6, pc}
_02019990:
	bl sub_0201980C
	ldr r2, [r5, #4]
	add r1, r2, #6
	add r3, r2, r4
	mov r2, #8
	ldrsb r0, [r1, r4]
	ldrsb r2, [r3, r2]
	add r0, r0, r2
	strb r0, [r1, r4]
	ldr r2, [r5, #4]
	add r1, r2, #7
	add r3, r2, r4
	mov r2, #9
	ldrsb r0, [r1, r4]
	ldrsb r2, [r3, r2]
	add r0, r0, r2
	strb r0, [r1, r4]
	add r0, r5, #0
	add r1, r6, #0
	bl sub_020197F4
	ldr r1, [r5, #4]
	add r1, #0xb
	ldrb r0, [r1, r4]
	sub r0, r0, #1
	strb r0, [r1, r4]
	ldr r0, [r5, #4]
	add r2, r0, r4
	ldrb r0, [r2, #0xb]
	cmp r0, #0
	bne _020199DC
	ldrh r1, [r2, #4]
	ldr r0, _020199E0 ; =0xFFFF1FFF
	and r0, r1
	strh r0, [r2, #4]
	mov r0, #0
	pop {r4, r5, r6, pc}
_020199DC:
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_020199E0: .word 0xFFFF1FFF
	thumb_func_end sub_02019978

	thumb_func_start sub_020199E4
sub_020199E4: ; 0x020199E4
	ldr r2, [r0, #4]
	lsl r0, r1, #4
	add r0, r2, r0
	ldrh r0, [r0, #4]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x1d
	bx lr
	.balign 4, 0
	thumb_func_end sub_020199E4

	thumb_func_start sub_020199F4
sub_020199F4: ; 0x020199F4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r2, [sp]
	ldr r2, [r0, #4]
	lsl r0, r1, #4
	add r1, r2, r0
	ldr r0, [r2, r0]
	add r7, r3, #0
	mov ip, r0
	ldrh r0, [r1, #4]
	add r1, sp, #0x10
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1a
	mov lr, r0
	ldrb r0, [r1, #0x14]
	add r0, r7, r0
	str r0, [sp, #4]
	cmp r7, r0
	bge _02019A58
	ldrb r0, [r1, #0x18]
	ldrb r1, [r1, #0x10]
	ldr r6, _02019A5C ; =0x00000FFF
	lsl r5, r0, #0xc
	ldr r0, [sp]
	add r2, r0, r1
_02019A26:
	ldr r1, [sp]
	add r0, r1, #0
	cmp r0, r2
	bge _02019A4C
	mov r0, lr
	mul r0, r7
	lsl r3, r0, #1
	mov r0, ip
	add r3, r0, r3
_02019A38:
	lsl r0, r1, #1
	ldrh r4, [r3, r0]
	and r4, r6
	orr r4, r5
	strh r4, [r3, r0]
	add r0, r1, #1
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	cmp r1, r2
	blt _02019A38
_02019A4C:
	add r0, r7, #1
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	ldr r0, [sp, #4]
	cmp r7, r0
	blt _02019A26
_02019A58:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02019A5C: .word 0x00000FFF
	thumb_func_end sub_020199F4

	thumb_func_start sub_02019A60
sub_02019A60: ; 0x02019A60
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	lsl r0, r1, #4
	str r0, [sp, #0xc]
	ldr r0, [sp]
	mov r6, #0
	ldr r1, [r0, #4]
	ldr r0, [sp, #0xc]
	add r3, r1, r0
	ldr r0, [r1, r0]
	mov ip, r0
	ldrh r0, [r3, #4]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1a
	mov lr, r0
	ldrh r0, [r2, #0xa]
	lsl r0, r0, #0x11
	lsr r7, r0, #0x11
	ldrb r0, [r2, #9]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	ldrb r0, [r2, #8]
	cmp r0, #0
	ble _02019B04
_02019A94:
	ldrb r0, [r2, #6]
	add r3, r0, r6
	ldr r0, [sp]
	ldr r1, [r0, #4]
	ldr r0, [sp, #0xc]
	add r0, r1, r0
	ldrh r0, [r0, #4]
	lsl r0, r0, #0x14
	lsr r0, r0, #0x1a
	cmp r3, r0
	bge _02019B04
	ldrb r0, [r2, #7]
	mov r1, #0
	str r0, [sp, #4]
	cmp r0, #0
	ble _02019AF0
_02019AB4:
	ldr r0, [sp]
	ldrb r5, [r2, #5]
	ldr r3, [r0, #4]
	ldr r0, [sp, #0xc]
	add r4, r5, r1
	add r0, r3, r0
	ldrh r0, [r0, #4]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1a
	cmp r4, r0
	bge _02019AF0
	ldr r0, [sp, #8]
	add r3, r7, r1
	add r0, r0, r3
	ldrb r3, [r2, #6]
	add r4, r3, r6
	mov r3, lr
	mul r4, r3
	add r3, r5, r4
	add r3, r1, r3
	lsl r4, r3, #1
	mov r3, ip
	strh r0, [r3, r4]
	add r0, r1, #1
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	ldrb r0, [r2, #7]
	str r0, [sp, #4]
	cmp r1, r0
	blt _02019AB4
_02019AF0:
	ldr r0, [sp, #4]
	add r0, r7, r0
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	add r0, r6, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	ldrb r0, [r2, #8]
	cmp r6, r0
	blt _02019A94
_02019B04:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02019A60

	thumb_func_start sub_02019B08
sub_02019B08: ; 0x02019B08
	ldr r2, [r0, #4]
	lsl r0, r1, #4
	ldr r0, [r2, r0]
	bx lr
	thumb_func_end sub_02019B08

	thumb_func_start sub_02019B10
sub_02019B10: ; 0x02019B10
	ldr r2, [r0, #4]
	lsl r0, r1, #4
	add r0, r2, r0
	ldrb r0, [r0, #0xa]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02019B10

	thumb_func_start sub_02019B1C
sub_02019B1C: ; 0x02019B1C
	push {r4, r5}
	cmp r2, #0
	beq _02019B2E
	ldr r5, [r0, #4]
	lsl r4, r1, #4
	add r5, r5, r4
	mov r4, #6
	ldrsb r4, [r5, r4]
	strb r4, [r2]
_02019B2E:
	cmp r3, #0
	beq _02019B3E
	ldr r2, [r0, #4]
	lsl r0, r1, #4
	add r1, r2, r0
	mov r0, #7
	ldrsb r0, [r1, r0]
	strb r0, [r3]
_02019B3E:
	pop {r4, r5}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02019B1C

	thumb_func_start sub_02019B44
sub_02019B44: ; 0x02019B44
	push {r4, r5}
	cmp r2, #0
	beq _02019B58
	ldr r5, [r0, #4]
	lsl r4, r1, #4
	add r4, r5, r4
	ldrh r4, [r4, #4]
	lsl r4, r4, #0x1a
	lsr r4, r4, #0x1a
	strh r4, [r2]
_02019B58:
	cmp r3, #0
	beq _02019B6A
	ldr r2, [r0, #4]
	lsl r0, r1, #4
	add r0, r2, r0
	ldrh r0, [r0, #4]
	lsl r0, r0, #0x14
	lsr r0, r0, #0x1a
	strh r0, [r3]
_02019B6A:
	pop {r4, r5}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02019B44

	thumb_func_start sub_02019B70
sub_02019B70: ; 0x02019B70
	push {r3, r4}
	ldr r4, [r0, #4]
	lsl r1, r1, #4
	add r4, r4, r1
	strb r2, [r4, #0xc]
	ldr r2, [r0, #4]
	add r2, r2, r1
	strb r3, [r2, #0xd]
	ldr r3, _02019B9C ; =0xFFFFFFF8
	mov r2, #0x10
	add r3, sp
	ldrsb r4, [r3, r2]
	ldr r2, [r0, #4]
	add r2, r2, r1
	strb r4, [r2, #0xe]
	mov r2, #0x14
	ldr r0, [r0, #4]
	ldrsb r2, [r3, r2]
	add r0, r0, r1
	strb r2, [r0, #0xf]
	pop {r3, r4}
	bx lr
	.balign 4, 0
_02019B9C: .word 0xFFFFFFF8
	thumb_func_end sub_02019B70

	thumb_func_start sub_02019BA0
sub_02019BA0: ; 0x02019BA0
	bx lr
	.balign 4, 0
	thumb_func_end sub_02019BA0

	thumb_func_start sub_02019BA4
sub_02019BA4: ; 0x02019BA4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r0, [sp, #0x20]
	mov r1, #0x20
	add r6, r2, #0
	add r7, r3, #0
	bl AllocFromHeap
	str r5, [r0]
	str r4, [r0, #4]
	str r6, [r0, #0x18]
	str r7, [r0, #0x1c]
	mov r2, #0
	ldr r1, [sp, #0x18]
	strb r2, [r0, #0xc]
	str r1, [r0, #8]
	add r1, sp, #8
	ldrb r1, [r1, #0x14]
	strb r1, [r0, #0xd]
	mov r1, #0xff
	strb r1, [r0, #0xe]
	strb r1, [r0, #0xf]
	sub r1, r2, #1
	str r1, [r0, #0x10]
	str r1, [r0, #0x14]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02019BA4

	thumb_func_start sub_02019BDC
sub_02019BDC: ; 0x02019BDC
	ldr r3, _02019BE0 ; =FreeToHeap
	bx r3
	.balign 4, 0
_02019BE0: .word FreeToHeap
	thumb_func_end sub_02019BDC

	thumb_func_start sub_02019BE4
sub_02019BE4: ; 0x02019BE4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	mov r4, #0
	add r5, r0, #0
	add r6, r4, #0
	sub r7, r4, #1
_02019BF0:
	ldr r2, [r5]
	lsl r1, r4, #2
	ldrb r0, [r2, r1]
	cmp r0, #0xff
	beq _02019C1A
	add r0, r2, r1
	bl sub_02025320
	cmp r0, #1
	bne _02019C12
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02019E4C
	cmp r0, r7
	bne _02019D0E
	mov r6, #1
_02019C12:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	b _02019BF0
_02019C1A:
	cmp r6, #0
	beq _02019C26
	mov r0, #0
	add sp, #0x10
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02019C26:
	ldr r0, [r5, #8]
	cmp r0, #0
	bne _02019C4C
	ldrb r0, [r5, #0xc]
	cmp r0, #1
	bne _02019C4C
	ldr r0, _02019D14 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #0xf3
	tst r1, r0
	beq _02019C46
	add r0, r5, #0
	bl sub_02019E98
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_02019C46:
	add sp, #0x10
	sub r0, #0xf4
	pop {r3, r4, r5, r6, r7, pc}
_02019C4C:
	ldr r0, _02019D14 ; =gSystem
	mov r1, #0x40
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _02019C72
	mov r1, #0
	str r1, [sp]
	ldrb r0, [r5, #0xd]
	add r2, r1, #0
	add r3, r1, #0
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r5, #4]
	bl sub_02020A24
	add r2, r0, #0
	mov r0, #0
	str r0, [sp, #0xc]
	b _02019CE0
_02019C72:
	mov r1, #0x80
	tst r1, r0
	beq _02019C96
	mov r1, #0
	str r1, [sp]
	ldrb r0, [r5, #0xd]
	add r2, r1, #0
	add r3, r1, #0
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r5, #4]
	bl sub_02020A24
	add r2, r0, #0
	mov r0, #1
	str r0, [sp, #0xc]
	b _02019CE0
_02019C96:
	mov r1, #0x20
	tst r1, r0
	beq _02019CBA
	mov r1, #0
	str r1, [sp]
	ldrb r0, [r5, #0xd]
	add r2, r1, #0
	add r3, r1, #0
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	ldr r0, [r5, #4]
	bl sub_02020A24
	add r2, r0, #0
	mov r0, #2
	str r0, [sp, #0xc]
	b _02019CE0
_02019CBA:
	mov r1, #0x10
	tst r0, r1
	beq _02019CDE
	mov r1, #0
	str r1, [sp]
	ldrb r0, [r5, #0xd]
	add r2, r1, #0
	add r3, r1, #0
	str r0, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	ldr r0, [r5, #4]
	bl sub_02020A24
	add r2, r0, #0
	mov r0, #3
	str r0, [sp, #0xc]
	b _02019CE0
_02019CDE:
	mov r2, #0xff
_02019CE0:
	cmp r2, #0xff
	beq _02019CF0
	ldr r1, [sp, #0xc]
	add r0, r5, #0
	bl sub_02019EB8
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_02019CF0:
	ldr r0, _02019D14 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _02019D00
	add sp, #0x10
	ldrb r0, [r5, #0xd]
	pop {r3, r4, r5, r6, r7, pc}
_02019D00:
	mov r0, #2
	tst r1, r0
	beq _02019D0C
	add sp, #0x10
	sub r0, r0, #4
	pop {r3, r4, r5, r6, r7, pc}
_02019D0C:
	sub r0, r0, #3
_02019D0E:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02019D14: .word gSystem
	thumb_func_end sub_02019BE4

	thumb_func_start sub_02019D18
sub_02019D18: ; 0x02019D18
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	mov r4, #0
	add r5, r0, #0
	add r6, r4, #0
	sub r7, r4, #1
_02019D24:
	ldr r2, [r5]
	lsl r1, r4, #2
	ldrb r0, [r2, r1]
	cmp r0, #0xff
	beq _02019D4E
	add r0, r2, r1
	bl sub_02025320
	cmp r0, #1
	bne _02019D46
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02019E4C
	cmp r0, r7
	bne _02019E42
	mov r6, #1
_02019D46:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	b _02019D24
_02019D4E:
	cmp r6, #0
	beq _02019D5A
	mov r0, #0
	add sp, #0x10
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02019D5A:
	ldr r0, [r5, #8]
	cmp r0, #0
	bne _02019D80
	ldrb r0, [r5, #0xc]
	cmp r0, #1
	bne _02019D80
	ldr r0, _02019E48 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #0xf3
	tst r1, r0
	beq _02019D7A
	add r0, r5, #0
	bl sub_02019E98
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_02019D7A:
	add sp, #0x10
	sub r0, #0xf4
	pop {r3, r4, r5, r6, r7, pc}
_02019D80:
	ldr r0, _02019E48 ; =gSystem
	mov r1, #0x40
	ldr r0, [r0, #0x4c]
	tst r1, r0
	beq _02019DA6
	mov r1, #0
	str r1, [sp]
	ldrb r0, [r5, #0xd]
	add r2, r1, #0
	add r3, r1, #0
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r5, #4]
	bl sub_02020A24
	add r2, r0, #0
	mov r0, #0
	str r0, [sp, #0xc]
	b _02019E14
_02019DA6:
	mov r1, #0x80
	tst r1, r0
	beq _02019DCA
	mov r1, #0
	str r1, [sp]
	ldrb r0, [r5, #0xd]
	add r2, r1, #0
	add r3, r1, #0
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r5, #4]
	bl sub_02020A24
	add r2, r0, #0
	mov r0, #1
	str r0, [sp, #0xc]
	b _02019E14
_02019DCA:
	mov r1, #0x20
	tst r1, r0
	beq _02019DEE
	mov r1, #0
	str r1, [sp]
	ldrb r0, [r5, #0xd]
	add r2, r1, #0
	add r3, r1, #0
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	ldr r0, [r5, #4]
	bl sub_02020A24
	add r2, r0, #0
	mov r0, #2
	str r0, [sp, #0xc]
	b _02019E14
_02019DEE:
	mov r1, #0x10
	tst r0, r1
	beq _02019E12
	mov r1, #0
	str r1, [sp]
	ldrb r0, [r5, #0xd]
	add r2, r1, #0
	add r3, r1, #0
	str r0, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	ldr r0, [r5, #4]
	bl sub_02020A24
	add r2, r0, #0
	mov r0, #3
	str r0, [sp, #0xc]
	b _02019E14
_02019E12:
	mov r2, #0xff
_02019E14:
	cmp r2, #0xff
	beq _02019E24
	ldr r1, [sp, #0xc]
	add r0, r5, #0
	bl sub_02019EB8
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_02019E24:
	ldr r0, _02019E48 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _02019E34
	add sp, #0x10
	ldrb r0, [r5, #0xd]
	pop {r3, r4, r5, r6, r7, pc}
_02019E34:
	mov r0, #2
	tst r1, r0
	beq _02019E40
	add sp, #0x10
	sub r0, r0, #4
	pop {r3, r4, r5, r6, r7, pc}
_02019E40:
	sub r0, r0, #3
_02019E42:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02019E48: .word gSystem
	thumb_func_end sub_02019D18

	thumb_func_start sub_02019E4C
sub_02019E4C: ; 0x02019E4C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x10
	add r4, r1, #0
	bl sub_0201A06C
	cmp r0, #1
	bne _02019E90
	strb r4, [r5, #0xd]
	mov r0, #0xff
	strb r0, [r5, #0xe]
	strb r0, [r5, #0xf]
	ldr r0, [r5, #8]
	cmp r0, #1
	bne _02019E80
	ldrb r0, [r5, #0xc]
	cmp r0, #1
	bne _02019E80
	mov r0, #0
	str r0, [r5, #8]
	ldr r3, [r5, #0x18]
	ldrb r1, [r5, #0xd]
	ldrb r2, [r5, #0xe]
	ldr r0, [r5, #0x1c]
	ldr r3, [r3, #4]
	blx r3
_02019E80:
	ldr r3, [r5, #0x18]
	ldrb r1, [r5, #0xd]
	ldrb r2, [r5, #0xe]
	ldr r0, [r5, #0x1c]
	ldr r3, [r3, #0xc]
	blx r3
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_02019E90:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02019E4C

	thumb_func_start sub_02019E98
sub_02019E98: ; 0x02019E98
	push {r3, lr}
	add r3, r0, #0
	mov r0, #1
	str r0, [r3, #8]
	mov r0, #0xff
	strb r0, [r3, #0xe]
	strb r0, [r3, #0xf]
	ldr r0, [r3, #0x1c]
	ldrb r1, [r3, #0xd]
	ldrb r2, [r3, #0xe]
	ldr r3, [r3, #0x18]
	ldr r3, [r3]
	blx r3
	mov r0, #3
	mvn r0, r0
	pop {r3, pc}
	thumb_func_end sub_02019E98

	thumb_func_start sub_02019EB8
sub_02019EB8: ; 0x02019EB8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r2, #0
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0x80
	add r1, r4, #0
	tst r1, r0
	beq _02019EDA
	ldrb r1, [r5, #0xf]
	cmp r1, #0xff
	beq _02019ED4
	add r4, r1, #0
	b _02019EDA
_02019ED4:
	eor r0, r4
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_02019EDA:
	mov r0, #1
	str r0, [sp, #0xc]
	mov r7, #0
_02019EE0:
	lsr r2, r4, #0x1f
	lsl r1, r4, #0x1b
	sub r1, r1, r2
	mov r0, #0x1b
	ror r1, r0
	add r1, r2, r1
	mov r0, #1
	lsl r0, r1
	lsr r1, r4, #5
	lsl r1, r1, #2
	add r1, r5, r1
	ldr r1, [r1, #0x10]
	tst r0, r1
	bne _02019F2A
	str r7, [sp, #0xc]
	str r7, [sp]
	str r4, [sp, #4]
	str r6, [sp, #8]
	ldr r0, [r5, #4]
	add r1, r7, #0
	add r2, r7, #0
	add r3, r7, #0
	bl sub_02020A24
	mov r1, #0x7f
	and r0, r1
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	cmp r1, r4
	beq _02019F22
	ldrb r0, [r5, #0xd]
	cmp r1, r0
	bne _02019F26
_02019F22:
	ldrb r4, [r5, #0xd]
	b _02019F2A
_02019F26:
	add r4, r1, #0
	b _02019EE0
_02019F2A:
	ldrb r0, [r5, #0xd]
	cmp r0, r4
	beq _02019F6A
	ldr r1, [r5, #4]
	lsl r0, r4, #3
	add r0, r1, r0
	add r1, r6, #0
	bl sub_0201A020
	cmp r0, #1
	bne _02019F4C
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _02019F4C
	ldrb r0, [r5, #0xd]
	strb r0, [r5, #0xf]
	b _02019F50
_02019F4C:
	mov r0, #0xff
	strb r0, [r5, #0xf]
_02019F50:
	ldrb r0, [r5, #0xd]
	strb r0, [r5, #0xe]
	strb r4, [r5, #0xd]
	ldr r3, [r5, #0x18]
	ldrb r1, [r5, #0xd]
	ldrb r2, [r5, #0xe]
	ldr r0, [r5, #0x1c]
	ldr r3, [r3, #8]
	blx r3
	mov r0, #2
	add sp, #0x10
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02019F6A:
	mov r0, #0
	mvn r0, r0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02019EB8

	thumb_func_start sub_02019F74
sub_02019F74: ; 0x02019F74
	ldrb r0, [r0, #0xd]
	bx lr
	thumb_func_end sub_02019F74

	thumb_func_start sub_02019F78
sub_02019F78: ; 0x02019F78
	ldrb r0, [r0, #0xf]
	bx lr
	thumb_func_end sub_02019F78

	thumb_func_start sub_02019F7C
sub_02019F7C: ; 0x02019F7C
	strb r1, [r0, #0xd]
	mov r1, #0xff
	strb r1, [r0, #0xe]
	strb r1, [r0, #0xf]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02019F7C

	thumb_func_start sub_02019F88
sub_02019F88: ; 0x02019F88
	strb r1, [r0, #0xd]
	strb r2, [r0, #0xe]
	strb r3, [r0, #0xf]
	bx lr
	thumb_func_end sub_02019F88

	thumb_func_start sub_02019F90
sub_02019F90: ; 0x02019F90
	ldr r0, [r0, #8]
	bx lr
	thumb_func_end sub_02019F90

	thumb_func_start sub_02019F94
sub_02019F94: ; 0x02019F94
	push {r3, lr}
	add r3, r0, #0
	str r1, [r3, #8]
	cmp r1, #1
	bne _02019FB4
	mov r0, #0xff
	strb r0, [r3, #0xe]
	strb r0, [r3, #0xf]
	ldr r0, [r3, #0x1c]
	ldrb r1, [r3, #0xd]
	ldr r3, [r3, #0x18]
	mov r2, #0
	ldr r3, [r3]
	mvn r2, r2
	blx r3
	pop {r3, pc}
_02019FB4:
	ldr r0, [r3, #0x1c]
	ldrb r1, [r3, #0xd]
	ldr r3, [r3, #0x18]
	mov r2, #0
	ldr r3, [r3, #4]
	mvn r2, r2
	blx r3
	pop {r3, pc}
	thumb_func_end sub_02019F94

	thumb_func_start sub_02019FC4
sub_02019FC4: ; 0x02019FC4
	mov r1, #0
	mvn r1, r1
	str r1, [r0, #0x10]
	str r1, [r0, #0x14]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02019FC4

	thumb_func_start sub_02019FD0
sub_02019FD0: ; 0x02019FD0
	push {r4, r5}
	mov r4, #1
	lsr r2, r1, #5
	mov r3, #0x1f
	and r1, r3
	add r5, r4, #0
	lsl r5, r1
	add r0, #0x10
	lsl r2, r2, #2
	ldr r4, [r0, r2]
	add r1, r5, #0
	tst r1, r4
	beq _02019FF4
	sub r3, #0x20
	add r1, r5, #0
	eor r1, r3
	and r1, r4
	str r1, [r0, r2]
_02019FF4:
	pop {r4, r5}
	bx lr
	thumb_func_end sub_02019FD0

	thumb_func_start sub_02019FF8
sub_02019FF8: ; 0x02019FF8
	push {r3, r4}
	mov r3, #0x1f
	lsr r2, r1, #5
	mov r4, #1
	and r1, r3
	lsl r4, r1
	add r0, #0x10
	lsl r2, r2, #2
	ldr r1, [r0, r2]
	add r3, r4, #0
	tst r3, r1
	bne _0201A014
	eor r1, r4
	str r1, [r0, r2]
_0201A014:
	pop {r3, r4}
	bx lr
	thumb_func_end sub_02019FF8

	thumb_func_start sub_0201A018
sub_0201A018: ; 0x0201A018
	ldr r2, [r0, #4]
	lsl r0, r1, #3
	add r0, r2, r0
	bx lr
	thumb_func_end sub_0201A018

	thumb_func_start sub_0201A020
sub_0201A020: ; 0x0201A020
	cmp r1, #3
	bhi _0201A068
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0201A030: ; jump table
	.short _0201A038 - _0201A030 - 2 ; case 0
	.short _0201A044 - _0201A030 - 2 ; case 1
	.short _0201A050 - _0201A030 - 2 ; case 2
	.short _0201A05C - _0201A030 - 2 ; case 3
_0201A038:
	ldrb r1, [r0, #5]
	mov r0, #0x80
	tst r0, r1
	beq _0201A068
	mov r0, #1
	bx lr
_0201A044:
	ldrb r1, [r0, #4]
	mov r0, #0x80
	tst r0, r1
	beq _0201A068
	mov r0, #1
	bx lr
_0201A050:
	ldrb r1, [r0, #7]
	mov r0, #0x80
	tst r0, r1
	beq _0201A068
	mov r0, #1
	bx lr
_0201A05C:
	ldrb r1, [r0, #6]
	mov r0, #0x80
	tst r0, r1
	beq _0201A068
	mov r0, #1
	bx lr
_0201A068:
	mov r0, #0
	bx lr
	thumb_func_end sub_0201A020

	thumb_func_start sub_0201A06C
sub_0201A06C: ; 0x0201A06C
	push {r3, r4}
	mov r3, #0x1f
	mov r2, #1
	and r3, r1
	lsr r1, r1, #5
	add r4, r2, #0
	lsl r1, r1, #2
	lsl r4, r3
	ldr r0, [r0, r1]
	tst r0, r4
	bne _0201A084
	mov r2, #0
_0201A084:
	add r0, r2, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_0201A06C
