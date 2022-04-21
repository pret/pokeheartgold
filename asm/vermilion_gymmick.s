#include "fielddata/script/scr_seq/event_T27GYM0101.h"
#include "constants/sndseq.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start InitVermilionPuzzleGimmick
InitVermilionPuzzleGimmick: ; 0x02256304
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl Fsys_GetSaveDataPtr
	bl Sav2_GetGymmickPtr
	mov r1, #3
	bl SavGymmick_AssertMagic_GetData
	str r0, [sp]
	mov r0, #4
	add r1, r0, #0
	bl AllocFromHeap
	ldr r1, [r5, #4]
	mov r2, #4
	str r0, [r1, #0x24]
	ldr r0, [r5, #4]
	mov r1, #0
	ldr r0, [r0, #0x24]
	bl MI_CpuFill8
	ldr r0, [r5, #4]
	ldr r0, [r0, #0x24]
	str r5, [r0]
	ldr r0, [sp]
	ldrb r0, [r0, #2]
	cmp r0, #0
	beq _02256370
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	mov r1, #0xc7
	bl ov01_022040D0
	add r7, r0, #0
	ldr r0, [r5, #0x54]
	mov r1, #0xc7
	bl ov01_021E8BAC
	add r6, r0, #0
	ldr r4, _022563AC ; =0x00000000
	beq _02256370
_0225635A:
	ldr r0, [r5, #0x54]
	add r1, r7, #0
	mov r2, #0xc7
	add r3, r4, #0
	bl ov01_021E8A8C
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, r6
	blo _0225635A
_02256370:
	ldr r0, [sp]
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _022563AA
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	mov r1, #0xc8
	bl ov01_022040D0
	add r7, r0, #0
	ldr r0, [r5, #0x54]
	mov r1, #0xc8
	bl ov01_021E8BAC
	add r6, r0, #0
	ldr r4, _022563AC ; =0x00000000
	beq _022563AA
_02256394:
	ldr r0, [r5, #0x54]
	add r1, r7, #0
	mov r2, #0xc8
	add r3, r4, #0
	bl ov01_021E8A8C
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, r6
	blo _02256394
_022563AA:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022563AC: .word 0x00000000
	thumb_func_end InitVermilionPuzzleGimmick

	thumb_func_start DeleteVermilionPuzzleGimmick
DeleteVermilionPuzzleGimmick: ; 0x022563B0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x24]
	bl FreeToHeap
	ldr r0, [r4, #4]
	mov r1, #0
	str r1, [r0, #0x24]
	pop {r4, pc}
	thumb_func_end DeleteVermilionPuzzleGimmick

	thumb_func_start ov04_022563C4
ov04_022563C4: ; 0x022563C4
	push {r4, lr}
	add r4, r1, #0
	bl Fsys_GetSaveDataPtr
	bl Sav2_GetGymmickPtr
	mov r1, #3
	bl SavGymmick_AssertMagic_GetData
	ldrb r2, [r0, #2]
	cmp r2, #0
	beq _022563E6
	ldrb r1, [r0, #3]
	cmp r1, #0
	beq _022563E6
	mov r0, #4
	pop {r4, pc}
_022563E6:
	cmp r2, #0
	beq _022563F8
	ldrb r0, [r0, #1]
	cmp r4, r0
	bne _022563F4
	mov r0, #2
	pop {r4, pc}
_022563F4:
	mov r0, #3
	pop {r4, pc}
_022563F8:
	ldrb r0, [r0]
	cmp r4, r0
	bne _02256402
	mov r0, #1
	b _02256404
_02256402:
	mov r0, #0
_02256404:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov04_022563C4

	thumb_func_start ov04_0225640C
ov04_0225640C: ; 0x0225640C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	str r2, [sp]
	bl Fsys_GetSaveDataPtr
	bl Sav2_GetGymmickPtr
	mov r1, #3
	bl SavGymmick_AssertMagic_GetData
	add r6, r0, #0
	mov r0, #0xb
	mov r1, #0x18
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	cmp r7, #0
	beq _02256438
	cmp r7, #1
	beq _0225646A
	b _02256494
_02256438:
	mov r0, #0xc7
	str r0, [r4, #0x10]
	ldr r0, [sp]
	cmp r0, #0
	beq _02256456
	mov r0, #2
	strb r0, [r4, #0x16]
	ldr r0, [r5, #0x10]
	ldr r1, _0225649C ; =ov04_022564A0
	add r2, r4, #0
	bl TaskManager_Call
	mov r0, #0
	strb r0, [r6, #2]
	pop {r3, r4, r5, r6, r7, pc}
_02256456:
	mov r0, #1
	strb r0, [r4, #0x16]
	ldr r0, [r5, #0x10]
	ldr r1, _0225649C ; =ov04_022564A0
	add r2, r4, #0
	bl TaskManager_Call
	mov r0, #1
	strb r0, [r6, #2]
	pop {r3, r4, r5, r6, r7, pc}
_0225646A:
	mov r0, #0xc8
	str r0, [r4, #0x10]
	ldr r0, [sp]
	cmp r0, #0
	beq _02256480
	bl GF_AssertFail
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
_02256480:
	mov r0, #1
	strb r0, [r4, #0x16]
	ldr r0, [r5, #0x10]
	ldr r1, _0225649C ; =ov04_022564A0
	add r2, r4, #0
	bl TaskManager_Call
	mov r0, #1
	strb r0, [r6, #3]
	pop {r3, r4, r5, r6, r7, pc}
_02256494:
	bl GF_AssertFail
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225649C: .word ov04_022564A0
	thumb_func_end ov04_0225640C

	thumb_func_start ov04_022564A0
ov04_022564A0: ; 0x022564A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnv
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
	bl GetMapObjectByID
	str r0, [r4, #4]
	ldr r0, [r6, #0x3c]
	mov r1, #4
	bl GetMapObjectByID
	str r0, [r4, #8]
	ldr r0, [r6, #0x3c]
	mov r1, #5
	bl GetMapObjectByID
	b _0225651C
_02256502:
	mov r1, #0
	bl GetMapObjectByID
	str r0, [r4, #4]
	ldr r0, [r6, #0x3c]
	mov r1, #1
	bl GetMapObjectByID
	str r0, [r4, #8]
	ldr r0, [r6, #0x3c]
	mov r1, #2
	bl GetMapObjectByID
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
	bl ov01_022040D0
	str r0, [sp, #8]
	ldr r0, [r6, #0x54]
	ldr r1, [r4, #0x10]
	bl ov01_021E8BAC
	add r7, r0, #0
	ldr r5, _02256648 ; =0x00000000
	beq _022565E4
_022565CE:
	ldr r0, [r6, #0x54]
	ldr r1, [sp, #8]
	ldr r2, [r4, #0x10]
	add r3, r5, #0
	bl ov01_021E8A8C
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
	bl ov01_022040D0
	str r0, [sp, #4]
	ldr r0, [r6, #0x54]
	ldr r1, [r4, #0x10]
	bl ov01_021E8BAC
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
	bl ov01_021E8970
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
	bl FreeToHeap
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
