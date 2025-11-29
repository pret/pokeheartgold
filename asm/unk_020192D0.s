	.include "asm/macros.inc"
	.include "unk_020192D0.inc"
	.include "global.inc"

	.rodata

_020F6288:
	.word ov39_02228140, ov39_02228308, ov39_02228370, 0xFFFFFFFF

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
	bl GfGfx_DisableEngineAPlanes
	bl GfGfx_DisableEngineBPlanes
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
	bl Heap_Create
	add r0, r4, #0
	mov r1, #0x80
	mov r2, #0x7b
	bl OverlayManager_CreateAndGetData
	mov r1, #0
	mov r2, #0x80
	add r5, r0, #0
	bl MI_CpuFill8
	add r0, r4, #0
	bl OverlayManager_GetArgs
	str r0, [r5]
	ldr r1, _02019358 ; =0x0000047D
	mov r0, #0xb
	mov r2, #1
	bl Sound_SetSceneAndPlayBGM
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
	bl OverlayManager_New
	str r0, [r4, #8]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0201945A
_020193CA:
	ldr r0, [r4, #8]
	bl OverlayManager_Run
	cmp r0, #1
	bne _0201945A
	ldr r0, [r4, #8]
	bl OverlayManager_Delete
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
	bl OverlayManager_New
	str r0, [r4, #8]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0201945A
_0201940E:
	ldr r0, [r4, #8]
	bl OverlayManager_Run
	cmp r0, #1
	bne _0201945A
	ldr r0, [r4, #8]
	bl OverlayManager_Delete
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0201945A
_02019426:
	ldr r0, _0201948C ; =_020F6288
	add r1, r4, #0
	mov r2, #0x7b
	bl OverlayManager_New
	str r0, [r4, #8]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0201945A
_0201943A:
	ldr r0, [r4, #8]
	bl OverlayManager_Run
	cmp r0, #1
	bne _0201945A
	ldr r0, [r4, #8]
	bl OverlayManager_Delete
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
	bl Heap_Free
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0x7b
	bl Heap_Destroy
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
	bl Heap_Alloc
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
	bl Heap_Free
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
