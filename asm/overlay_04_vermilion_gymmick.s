#include "fielddata/script/scr_seq/event_T27GYM0101.h"
#include "constants/sndseq.h"
	.include "asm/macros.inc"
	.include "overlay_04.inc"
	.include "global.inc"

	.text

	thumb_func_start ov04_022564A0
ov04_022564A0: ; 0x022564A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	bl TaskManager_GetFieldSystem
	add r6, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnvironment
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetStatePtr
	str r0, [sp, #0xc]
	ldr r0, [r0]
	cmp r0, #6
	bls _022564C4
	b _02256642
_022564C4:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022564D0: ; jump table
	.short _022564DE - _022564D0 - 2 ; case 0
	.short _0225652A - _022564D0 - 2 ; case 1
	.short _0225654A - _022564D0 - 2 ; case 2
	.short _0225656A - _022564D0 - 2 ; case 3
	.short _022565B2 - _022564D0 - 2 ; case 4
	.short _022565F2 - _022564D0 - 2 ; case 5
	.short _02256636 - _022564D0 - 2 ; case 6
_022564DE:
	ldr r0, [r4, #0x10]
	cmp r0, #0xc7
	ldr r0, [r6, #0x3c]
	bne _02256502
	mov r1, #3
	bl MapObjectManager_GetFirstActiveObjectByID
	str r0, [r4, #4]
	ldr r0, [r6, #0x3c]
	mov r1, #4
	bl MapObjectManager_GetFirstActiveObjectByID
	str r0, [r4, #8]
	ldr r0, [r6, #0x3c]
	mov r1, #5
	bl MapObjectManager_GetFirstActiveObjectByID
	b _0225651C
_02256502:
	mov r1, #0
	bl MapObjectManager_GetFirstActiveObjectByID
	str r0, [r4, #4]
	ldr r0, [r6, #0x3c]
	mov r1, #1
	bl MapObjectManager_GetFirstActiveObjectByID
	str r0, [r4, #8]
	ldr r0, [r6, #0x3c]
	mov r1, #2
	bl MapObjectManager_GetFirstActiveObjectByID
_0225651C:
	str r0, [r4, #0xc]
	mov r0, #0
	strh r0, [r4, #0x14]
	ldrb r1, [r4, #0x16]
	ldr r0, [sp, #0xc]
	str r1, [r0]
	b _02256642
_0225652A:
	ldr r0, [r4, #4]
	mov r1, #0x16
	bl MapObject_SetHeldMovement
	ldr r0, [r4, #8]
	mov r1, #0x16
	bl MapObject_SetHeldMovement
	ldr r0, [r4, #0xc]
	mov r1, #0x17
	bl MapObject_SetHeldMovement
	ldr r0, [sp, #0xc]
	mov r1, #3
	str r1, [r0]
	b _02256642
_0225654A:
	ldr r0, [r4, #4]
	mov r1, #0x17
	bl MapObject_SetHeldMovement
	ldr r0, [r4, #8]
	mov r1, #0x17
	bl MapObject_SetHeldMovement
	ldr r0, [r4, #0xc]
	mov r1, #0x16
	bl MapObject_SetHeldMovement
	ldr r0, [sp, #0xc]
	mov r1, #3
	str r1, [r0]
	b _02256642
_0225656A:
	mov r5, #0
_0225656C:
	lsl r0, r5, #2
	add r0, r4, r0
	ldr r0, [r0, #4]
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #0
	beq _02256584
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #3
	blo _0225656C
_02256584:
	cmp r5, #3
	bne _02256642
	ldrh r0, [r4, #0x14]
	add r0, r0, #1
	strh r0, [r4, #0x14]
	ldrh r0, [r4, #0x14]
	cmp r0, #2
	blo _022565AA
	ldrb r0, [r4, #0x16]
	cmp r0, #1
	bne _022565A2
	ldr r0, [sp, #0xc]
	mov r1, #4
	str r1, [r0]
	b _02256642
_022565A2:
	ldr r0, [sp, #0xc]
	mov r1, #5
	str r1, [r0]
	b _02256642
_022565AA:
	ldrb r1, [r4, #0x16]
	ldr r0, [sp, #0xc]
	str r1, [r0]
	b _02256642
_022565B2:
	add r0, r6, #0
	add r0, #0xc0
	ldr r0, [r0]
	ldr r1, [r4, #0x10]
	bl Field3dObjectList_GetRenderObjectByID
	str r0, [sp, #8]
	ldr r0, [r6, #0x54]
	ldr r1, [r4, #0x10]
	bl MapPropAnimationManager_GetPropAnimationCount
	add r7, r0, #0
	ldr r5, _02256648 ; =0x00000000
	beq _022565E4
_022565CE:
	ldr r0, [r6, #0x54]
	ldr r1, [sp, #8]
	ldr r2, [r4, #0x10]
	add r3, r5, #0
	bl MapPropAnimationManager_RemoveAnimationFromRenderObj
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, r7
	blo _022565CE
_022565E4:
	ldr r0, _0225664C ; =SEQ_SE_DP_UG_020
	bl PlaySE
	ldr r0, [sp, #0xc]
	mov r1, #6
	str r1, [r0]
	b _02256642
_022565F2:
	add r0, r6, #0
	add r0, #0xc0
	ldr r0, [r0]
	ldr r1, [r4, #0x10]
	bl Field3dObjectList_GetRenderObjectByID
	str r0, [sp, #4]
	ldr r0, [r6, #0x54]
	ldr r1, [r4, #0x10]
	bl MapPropAnimationManager_GetPropAnimationCount
	add r7, r0, #0
	ldr r5, _02256648 ; =0x00000000
	beq _02256628
_0225660E:
	ldr r0, [r6, #0x54]
	ldr r3, [sp, #4]
	str r0, [sp]
	ldr r0, [r4, #0x10]
	add r1, r5, #0
	mov r2, #0
	bl MapPropAnimationManager_AddAnimationToRenderObj
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, r7
	blo _0225660E
_02256628:
	ldr r0, _0225664C ; =SEQ_SE_DP_UG_020
	bl PlaySE
	ldr r0, [sp, #0xc]
	mov r1, #6
	str r1, [r0]
	b _02256642
_02256636:
	add r0, r4, #0
	bl Heap_Free
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02256642:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02256648: .word 0x00000000
_0225664C: .word SEQ_SE_DP_UG_020
	thumb_func_end ov04_022564A0
