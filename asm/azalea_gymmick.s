#include "fielddata/script/scr_seq/event_T27GYM0101.h"
#include "constants/sndseq.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov04_02254190
ov04_02254190: ; 0x02254190
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r0, #0
	bl Fsys_GetSaveDataPtr
	bl Sav2_GetGymmickPtr
	mov r1, #5
	bl SavGymmick_AssertMagic_GetData
	add r7, r0, #0
	mov r0, #4
	mov r1, #0x54
	bl AllocFromHeap
	ldr r1, [r4, #4]
	mov r2, #0x54
	str r0, [r1, #0x24]
	ldr r0, [r4, #4]
	mov r1, #0
	ldr r0, [r0, #0x24]
	bl MI_CpuFill8
	ldr r0, [r4, #4]
	mov r6, #0
	ldr r5, [r0, #0x24]
_022541C4:
	mov r1, #0
	add r0, sp, #4
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	ldrb r0, [r7, r6]
	ldr r1, _02254400 ; =ov04_022575D4
	mov r3, #0
	lsl r2, r0, #2
	ldr r0, _02254400 ; =ov04_022575D4
	ldrh r1, [r1, r2]
	add r0, r0, r2
	ldrh r0, [r0, #2]
	lsl r2, r1, #0x10
	mov r1, #2
	lsl r1, r1, #0xe
	lsl r0, r0, #0x10
	str r2, [sp, #4]
	add r1, r2, r1
	str r1, [sp, #4]
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x54]
	mov r1, #0x76
	str r0, [sp]
	add r0, r4, #0
	add r0, #0x9c
	ldr r0, [r0]
	add r2, sp, #4
	bl AddBgModelFromTemplate
	str r0, [r5, #4]
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #4
	blt _022541C4
	ldr r0, [r7, #4]
	cmp r0, #3
	bls _02254212
	b _022543F6
_02254212:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225421E: ; jump table
	.short _02254226 - _0225421E - 2 ; case 0
	.short _0225429A - _0225421E - 2 ; case 1
	.short _0225430E - _0225421E - 2 ; case 2
	.short _02254382 - _0225421E - 2 ; case 3
_02254226:
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	mov r1, #0x73
	bl ov01_022040D0
	add r3, r0, #0
	ldr r0, [r4, #0x54]
	mov r1, #0
	str r0, [sp]
	mov r0, #0x73
	mov r2, #1
	bl ov01_021E8970
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	mov r1, #0x74
	bl ov01_022040D0
	add r3, r0, #0
	ldr r0, [r4, #0x54]
	mov r1, #0
	str r0, [sp]
	mov r0, #0x74
	mov r2, #1
	bl ov01_021E8970
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	mov r1, #0x7a
	bl ov01_022040D0
	add r3, r0, #0
	ldr r0, [r4, #0x54]
	mov r1, #0
	str r0, [sp]
	mov r0, #0x7a
	mov r2, #1
	bl ov01_021E8970
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	mov r1, #0x75
	bl ov01_022040D0
	add r3, r0, #0
	ldr r0, [r4, #0x54]
	mov r1, #0
	str r0, [sp]
	mov r0, #0x75
	mov r2, #1
	bl ov01_021E8970
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_0225429A:
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	mov r1, #0x73
	bl ov01_022040D0
	add r3, r0, #0
	ldr r0, [r4, #0x54]
	mov r1, #0
	str r0, [sp]
	mov r0, #0x73
	mov r2, #1
	bl ov01_021E8970
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	mov r1, #0x74
	bl ov01_022040D0
	add r3, r0, #0
	ldr r0, [r4, #0x54]
	mov r1, #1
	str r0, [sp]
	mov r0, #0x74
	add r2, r1, #0
	bl ov01_021E8970
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	mov r1, #0x7a
	bl ov01_022040D0
	add r3, r0, #0
	ldr r0, [r4, #0x54]
	mov r1, #0
	str r0, [sp]
	mov r0, #0x7a
	mov r2, #1
	bl ov01_021E8970
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	mov r1, #0x75
	bl ov01_022040D0
	add r3, r0, #0
	ldr r0, [r4, #0x54]
	mov r1, #1
	str r0, [sp]
	mov r0, #0x75
	add r2, r1, #0
	bl ov01_021E8970
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_0225430E:
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	mov r1, #0x73
	bl ov01_022040D0
	add r3, r0, #0
	ldr r0, [r4, #0x54]
	mov r1, #1
	str r0, [sp]
	mov r0, #0x73
	add r2, r1, #0
	bl ov01_021E8970
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	mov r1, #0x74
	bl ov01_022040D0
	add r3, r0, #0
	ldr r0, [r4, #0x54]
	mov r1, #0
	str r0, [sp]
	mov r0, #0x74
	mov r2, #1
	bl ov01_021E8970
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	mov r1, #0x7a
	bl ov01_022040D0
	add r3, r0, #0
	ldr r0, [r4, #0x54]
	mov r1, #1
	str r0, [sp]
	mov r0, #0x7a
	add r2, r1, #0
	bl ov01_021E8970
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	mov r1, #0x75
	bl ov01_022040D0
	add r3, r0, #0
	ldr r0, [r4, #0x54]
	mov r1, #0
	str r0, [sp]
	mov r0, #0x75
	mov r2, #1
	bl ov01_021E8970
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_02254382:
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	mov r1, #0x73
	bl ov01_022040D0
	add r3, r0, #0
	ldr r0, [r4, #0x54]
	mov r1, #1
	str r0, [sp]
	mov r0, #0x73
	add r2, r1, #0
	bl ov01_021E8970
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	mov r1, #0x74
	bl ov01_022040D0
	add r3, r0, #0
	ldr r0, [r4, #0x54]
	mov r1, #1
	str r0, [sp]
	mov r0, #0x74
	add r2, r1, #0
	bl ov01_021E8970
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	mov r1, #0x7a
	bl ov01_022040D0
	add r3, r0, #0
	ldr r0, [r4, #0x54]
	mov r1, #1
	str r0, [sp]
	mov r0, #0x7a
	add r2, r1, #0
	bl ov01_021E8970
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	mov r1, #0x75
	bl ov01_022040D0
	add r3, r0, #0
	ldr r0, [r4, #0x54]
	mov r1, #1
	str r0, [sp]
	mov r0, #0x75
	add r2, r1, #0
	bl ov01_021E8970
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_022543F6:
	bl GF_AssertFail
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02254400: .word ov04_022575D4
	thumb_func_end ov04_02254190

	thumb_func_start Fsys_FlipAzaleaGymSwitch
Fsys_FlipAzaleaGymSwitch: ; 0x02254404
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r6, r1, #0
	bl Fsys_GetSaveDataPtr
	bl Sav2_GetGymmickPtr
	mov r1, #5
	bl SavGymmick_AssertMagic_GetData
	add r4, r0, #0
	ldr r0, _02254560 ; =SEQ_SE_DP_KI_GASYAN
	bl PlaySE
	cmp r6, #0
	bne _022544B6
	ldr r2, [r4, #4]
	mov r1, #1
	add r0, r2, #0
	and r0, r1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	add r0, r2, #0
	eor r0, r1
	str r0, [r4, #4]
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	mov r1, #0x74
	bl ov01_022040D0
	add r7, r0, #0
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	mov r1, #0x75
	bl ov01_022040D0
	str r0, [sp, #4]
	ldr r0, [r5, #0x54]
	add r1, r7, #0
	mov r2, #0x74
	add r3, r6, #0
	bl ov01_021E8A8C
	ldr r0, [r5, #0x54]
	ldr r1, [sp, #4]
	mov r2, #0x75
	add r3, r6, #0
	bl ov01_021E8A8C
	ldr r0, [r4, #4]
	mov r2, #1
	and r0, r2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	ldr r0, [r5, #0x54]
	beq _02254498
	str r0, [sp]
	mov r0, #0x74
	add r1, r2, #0
	add r3, r7, #0
	bl ov01_021E8970
	ldr r0, [r5, #0x54]
	mov r1, #1
	str r0, [sp]
	ldr r3, [sp, #4]
	mov r0, #0x75
	add r2, r1, #0
	bl ov01_021E8970
	b _02254550
_02254498:
	str r0, [sp]
	mov r0, #0x74
	mov r1, #0
	add r3, r7, #0
	bl ov01_021E8970
	ldr r0, [r5, #0x54]
	ldr r3, [sp, #4]
	str r0, [sp]
	mov r0, #0x75
	mov r1, #0
	mov r2, #1
	bl ov01_021E8970
	b _02254550
_022544B6:
	cmp r6, #1
	bne _0225454C
	ldr r1, [r4, #4]
	mov r0, #1
	asr r2, r1, #1
	and r0, r2
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	mov r0, #2
	eor r0, r1
	str r0, [r4, #4]
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	mov r1, #0x73
	bl ov01_022040D0
	add r7, r0, #0
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	mov r1, #0x7a
	bl ov01_022040D0
	str r0, [sp, #8]
	ldr r0, [r5, #0x54]
	add r1, r7, #0
	mov r2, #0x73
	add r3, r6, #0
	bl ov01_021E8A8C
	ldr r0, [r5, #0x54]
	ldr r1, [sp, #8]
	mov r2, #0x7a
	add r3, r6, #0
	bl ov01_021E8A8C
	ldr r0, [r4, #4]
	mov r2, #1
	asr r0, r0, #1
	and r0, r2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	ldr r0, [r5, #0x54]
	beq _0225452E
	str r0, [sp]
	mov r0, #0x73
	add r1, r2, #0
	add r3, r7, #0
	bl ov01_021E8970
	ldr r0, [r5, #0x54]
	mov r1, #1
	str r0, [sp]
	ldr r3, [sp, #8]
	mov r0, #0x7a
	add r2, r1, #0
	bl ov01_021E8970
	b _02254550
_0225452E:
	str r0, [sp]
	mov r0, #0x73
	mov r1, #0
	add r3, r7, #0
	bl ov01_021E8970
	ldr r0, [r5, #0x54]
	ldr r3, [sp, #8]
	str r0, [sp]
	mov r0, #0x7a
	mov r1, #0
	mov r2, #1
	bl ov01_021E8970
	b _02254550
_0225454C:
	bl GF_AssertFail
_02254550:
	ldr r0, [r5, #0x10]
	ldr r1, _02254564 ; =ov04_02254CA4
	mov r2, #0
	bl TaskManager_Call
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02254560: .word SEQ_SE_DP_KI_GASYAN
_02254564: .word ov04_02254CA4
	thumb_func_end Fsys_FlipAzaleaGymSwitch

	thumb_func_start Fsys_BeginAzaleaGymSpinarakRide
Fsys_BeginAzaleaGymSpinarakRide: ; 0x02254568
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6, #4]
	add r5, r1, #0
	ldr r4, [r0, #0x24]
	mov r0, #0xb
	mov r1, #8
	bl AllocFromHeapAtEnd
	add r7, r0, #0
	mov r1, #0
	str r1, [r7]
	str r6, [r7, #4]
	strb r5, [r4, #0x18]
	str r1, [r4, #0x30]
	strb r1, [r4, #0x14]
	mov r0, #1
	strb r0, [r4, #0x16]
	add r0, r6, #0
	str r1, [r4, #0x1c]
	bl Fsys_GetSaveDataPtr
	bl Sav2_GetGymmickPtr
	mov r1, #5
	bl SavGymmick_AssertMagic_GetData
	add r2, r0, #0
	ldr r0, [r2, #4]
	mov r1, #0
	strb r0, [r4, #0x15]
_022545A6:
	ldrb r0, [r2, r1]
	cmp r5, r0
	bne _022545B0
	strb r1, [r4, #0x17]
	b _022545B6
_022545B0:
	add r1, r1, #1
	cmp r1, #4
	blt _022545A6
_022545B6:
	cmp r1, #4
	bne _022545C0
	bl GF_AssertFail
	pop {r3, r4, r5, r6, r7, pc}
_022545C0:
	cmp r5, #0xb
	bhi _02254600
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022545D0: ; jump table
	.short _02254600 - _022545D0 - 2 ; case 0
	.short _02254600 - _022545D0 - 2 ; case 1
	.short _02254600 - _022545D0 - 2 ; case 2
	.short _022545E8 - _022545D0 - 2 ; case 3
	.short _022545E8 - _022545D0 - 2 ; case 4
	.short _022545E8 - _022545D0 - 2 ; case 5
	.short _02254600 - _022545D0 - 2 ; case 6
	.short _02254600 - _022545D0 - 2 ; case 7
	.short _02254600 - _022545D0 - 2 ; case 8
	.short _022545E8 - _022545D0 - 2 ; case 9
	.short _022545E8 - _022545D0 - 2 ; case 10
	.short _022545E8 - _022545D0 - 2 ; case 11
_022545E8:
	mov r1, #1
	ldr r0, _02254634 ; =ov04_022575A4
	lsl r2, r5, #2
	strb r1, [r4, #0x19]
	ldr r0, [r0, r2]
	ldrb r2, [r4, #0x15]
	lsl r2, r2, #3
	ldrh r0, [r0, r2]
	sub r0, r0, #1
	strb r0, [r4, #0x1a]
	strb r1, [r4, #0x1b]
	b _02254608
_02254600:
	mov r0, #0
	strb r0, [r4, #0x19]
	strb r0, [r4, #0x1a]
	strb r0, [r4, #0x1b]
_02254608:
	ldr r0, _02254634 ; =ov04_022575A4
	lsl r1, r5, #2
	ldr r1, [r0, r1]
	ldrb r0, [r4, #0x15]
	lsl r0, r0, #3
	add r0, r1, r0
	ldr r2, [r0, #4]
	ldrb r0, [r4, #0x1a]
	lsl r1, r0, #2
	add r0, r2, r1
	ldrh r1, [r2, r1]
	add r2, r7, #0
	lsl r1, r1, #0x10
	str r1, [r4, #0x2c]
	ldrh r0, [r0, #2]
	ldr r1, _02254638 ; =ov04_0225463C
	lsl r0, r0, #0x10
	str r0, [r4, #0x34]
	ldr r0, [r6, #0x10]
	bl TaskManager_Call
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02254634: .word ov04_022575A4
_02254638: .word ov04_0225463C
	thumb_func_end Fsys_BeginAzaleaGymSpinarakRide

	thumb_func_start ov04_0225463C
ov04_0225463C: ; 0x0225463C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r1, [r4]
	cmp r1, #0
	beq _0225465E
	cmp r1, #1
	beq _02254670
	cmp r1, #0xa
	beq _02254682
	b _0225468A
_0225465E:
	ldr r0, [r5, #0x10]
	ldr r1, _02254690 ; =Task_WaitFollowingPokeSituatedOnMovingPlatform
	mov r2, #0
	bl TaskManager_Call
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0225468A
_02254670:
	ldr r0, _02254694 ; =ov04_02254724
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0225468A
_02254682:
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
_0225468A:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_02254690: .word Task_WaitFollowingPokeSituatedOnMovingPlatform
_02254694: .word ov04_02254724
	thumb_func_end ov04_0225463C

	thumb_func_start ov04_02254698
ov04_02254698: ; 0x02254698
	push {r4}
	sub sp, #0xc
	add r3, r0, #0
	ldrh r4, [r2]
	ldrh r0, [r1]
	ldrh r2, [r2, #2]
	sub r0, r4, r0
	lsl r0, r0, #0xc
	str r0, [sp]
	ldrh r0, [r1, #2]
	sub r0, r2, r0
	lsl r0, r0, #0xc
	str r0, [sp, #8]
	mov r0, #0
	add r2, sp, #0
	str r0, [sp, #4]
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	add sp, #0xc
	pop {r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov04_02254698

	thumb_func_start ov04_022546C8
ov04_022546C8: ; 0x022546C8
	ldr r2, [r0]
	cmp r2, #0
	blt _022546D2
	mov r2, #1
	b _022546D4
_022546D2:
	mov r2, #0
_022546D4:
	str r2, [r1]
	ldr r0, [r0, #8]
	cmp r0, #0
	blt _022546E2
	mov r0, #1
	str r0, [r1, #4]
	bx lr
_022546E2:
	mov r0, #0
	str r0, [r1, #4]
	bx lr
	thumb_func_end ov04_022546C8

	thumb_func_start ov04_022546E8
ov04_022546E8: ; 0x022546E8
	push {r3, r4}
	lsl r3, r3, #0x10
	add r1, r1, r2
	mov r4, #0
	cmp r3, r1
	bne _022546F8
	mov r4, #1
	b _0225470A
_022546F8:
	cmp r0, #0
	beq _02254704
	cmp r1, r3
	ble _0225470A
	mov r4, #2
	b _0225470A
_02254704:
	cmp r1, r3
	bge _0225470A
	mov r4, #2
_0225470A:
	add r0, r4, #0
	pop {r3, r4}
	bx lr
	thumb_func_end ov04_022546E8

	thumb_func_start ov04_02254710
ov04_02254710: ; 0x02254710
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x24]
	bl FreeToHeap
	ldr r0, [r4, #4]
	mov r1, #0
	str r1, [r0, #0x24]
	pop {r4, pc}
	thumb_func_end ov04_02254710

	thumb_func_start ov04_02254724
ov04_02254724: ; 0x02254724
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x98
	add r6, r1, #0
	ldr r5, [r6, #4]
	str r0, [sp, #0x18]
	ldr r0, [r5, #4]
	ldr r4, [r0, #0x24]
	ldr r0, [r6]
	cmp r0, #9
	bhi _02254828
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02254744: ; jump table
	.short _02254C9E - _02254744 - 2 ; case 0
	.short _02254C9E - _02254744 - 2 ; case 1
	.short _02254758 - _02254744 - 2 ; case 2
	.short _022547BA - _02254744 - 2 ; case 3
	.short _0225481E - _02254744 - 2 ; case 4
	.short _02254886 - _02254744 - 2 ; case 5
	.short _02254AE0 - _02254744 - 2 ; case 6
	.short _02254B76 - _02254744 - 2 ; case 7
	.short _02254BD4 - _02254744 - 2 ; case 8
	.short _02254C44 - _02254744 - 2 ; case 9
_02254758:
	add r0, r5, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	ldr r0, [r5, #0x40]
	beq _0225479C
	bl PlayerAvatar_GetMapObject
	add r7, r0, #0
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	str r0, [sp, #0x28]
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	beq _0225478A
	add r0, r7, #0
	mov r1, #0xd
	bl MapObject_SetHeldMovement
	ldr r0, [sp, #0x28]
	mov r1, #0xd
	bl MapObject_SetHeldMovement
	b _022547B4
_0225478A:
	add r0, r7, #0
	mov r1, #0xc
	bl MapObject_SetHeldMovement
	ldr r0, [sp, #0x28]
	mov r1, #0xc
	bl MapObject_SetHeldMovement
	b _022547B4
_0225479C:
	bl PlayerAvatar_GetMapObject
	ldrb r1, [r4, #0x19]
	cmp r1, #0
	beq _022547AE
	mov r1, #0xd
	bl MapObject_SetHeldMovement
	b _022547B4
_022547AE:
	mov r1, #0xc
	bl MapObject_SetHeldMovement
_022547B4:
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
_022547BA:
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	add r7, r0, #0
	add r0, r5, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _022547FE
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	add r5, r0, #0
	add r0, r7, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #0
	beq _02254828
	add r0, r5, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #0
	beq _02254828
	add r0, r7, #0
	mov r1, #0x49
	bl MapObject_SetHeldMovement
	mov r0, #0
	str r0, [r4, #0x50]
	ldr r0, [r6]
	add sp, #0x98
	add r0, r0, #1
	str r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
_022547FE:
	add r0, r7, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #0
	beq _02254828
	add r0, r7, #0
	mov r1, #0x49
	bl MapObject_SetHeldMovement
	mov r0, #0
	str r0, [r4, #0x50]
	ldr r0, [r6]
	add sp, #0x98
	add r0, r0, #1
	str r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
_0225481E:
	ldr r1, [r4, #0x50]
	add r0, r1, #1
	str r0, [r4, #0x50]
	cmp r1, #4
	bge _0225482A
_02254828:
	b _02254C9E
_0225482A:
	add r0, r5, #0
	add r0, #0x9c
	ldrb r1, [r4, #0x17]
	ldr r0, [r0]
	bl ov01_021F3B44
	add r4, r0, #0
	ldr r0, [r5, #0x34]
	bl ov01_021FB9E0
	add r7, r0, #0
	add r0, r4, #0
	bl ov01_021F3B38
	str r0, [sp, #0x2c]
	add r0, r4, #0
	bl ov01_021F3B3C
	ldr r1, [sp, #0x2c]
	mov r2, #1
	str r1, [sp]
	str r0, [sp, #4]
	str r7, [sp, #8]
	str r2, [sp, #0xc]
	mov r0, #0xff
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0x14]
	ldr r0, [r5, #0x54]
	ldr r1, [r5, #0x58]
	mov r3, #0x76
	bl ov01_021E8DE8
	ldr r0, [r5, #0x58]
	mov r1, #1
	mov r2, #0
	bl ov01_021E8E70
	ldr r0, _02254B9C ; =SEQ_SE_GS_ITOMARU_ROBO
	bl PlaySE
	ldr r0, [r6]
	add sp, #0x98
	add r0, r0, #1
	str r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
_02254886:
	ldrb r0, [r4, #0x18]
	str r0, [sp, #0x24]
	ldrb r0, [r4, #0x16]
	ldrb r7, [r4, #0x15]
	cmp r0, #0
	beq _02254962
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	beq _022548B0
	ldr r0, [sp, #0x24]
	lsl r1, r0, #2
	ldr r0, _02254BA0 ; =ov04_022575A4
	ldr r1, [r0, r1]
	lsl r0, r7, #3
	add r0, r1, r0
	ldr r2, [r0, #4]
	ldrb r0, [r4, #0x1a]
	lsl r1, r0, #2
	add r1, r2, r1
	sub r0, r0, #1
	b _022548C6
_022548B0:
	ldr r0, [sp, #0x24]
	lsl r1, r0, #2
	ldr r0, _02254BA0 ; =ov04_022575A4
	ldr r1, [r0, r1]
	lsl r0, r7, #3
	add r0, r1, r0
	ldr r2, [r0, #4]
	ldrb r0, [r4, #0x1a]
	lsl r1, r0, #2
	add r1, r2, r1
	add r0, r0, #1
_022548C6:
	lsl r0, r0, #2
	add r0, r2, r0
	str r0, [r4, #0x28]
	ldr r2, [r4, #0x28]
	add r0, sp, #0x38
	bl ov04_02254698
	add r3, sp, #0x38
	add r2, r4, #0
	add r2, #0x38
	ldmia r3!, {r0, r1}
	str r2, [sp, #0x30]
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r1, r4, #0
	str r0, [r2]
	ldr r0, [sp, #0x30]
	add r1, #0x20
	bl ov04_022546C8
	add r0, r4, #0
	add r0, #0x38
	add r1, r0, #0
	bl VEC_Normalize
	ldr r2, _02254BA4 ; =ov04_02257350
	add r3, sp, #0x8c
	ldmia r2!, {r0, r1}
	mov ip, r3
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	mov r1, ip
	str r0, [r3]
	add r0, r4, #0
	add r0, #0x38
	bl VEC_DotProduct
	str r0, [sp, #0x34]
	add r1, r4, #0
	add r1, #0x38
	add r2, sp, #0x80
	mov r0, #0
	str r0, [r2]
	str r0, [r2, #4]
	str r0, [r2, #8]
	mov r0, #2
	lsl r0, r0, #0xc
	add r3, r1, #0
	bl VEC_MultAdd
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	bne _0225494A
	ldr r1, [sp, #0x34]
	cmp r1, #0
	beq _0225494A
	mov r2, #1
	lsl r2, r2, #0xc
	cmp r1, r2
	beq _0225494A
	mov r0, #1
	str r0, [r4, #0x1c]
	ldr r0, [r5, #0x2c]
	bl ov01_021F6304
	b _0225495E
_0225494A:
	cmp r0, #1
	bne _0225495E
	mov r0, #0
	str r0, [r4, #0x1c]
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetPositionVecConst
	ldr r1, [r5, #0x2c]
	bl ov01_021F62E8
_0225495E:
	mov r0, #0
	strb r0, [r4, #0x16]
_02254962:
	ldr r3, [r4, #0x28]
	ldr r0, [r4, #0x20]
	ldrh r3, [r3]
	ldr r1, [r4, #0x2c]
	ldr r2, [r4, #0x38]
	bl ov04_022546E8
	ldr r3, [r4, #0x28]
	str r0, [sp, #0x20]
	ldrh r3, [r3, #2]
	ldr r0, [r4, #0x24]
	ldr r1, [r4, #0x34]
	ldr r2, [r4, #0x40]
	bl ov04_022546E8
	ldr r1, [sp, #0x20]
	cmp r1, #2
	bne _0225498A
	mov r1, #0
	str r1, [r4, #0x38]
_0225498A:
	cmp r0, #2
	bne _02254992
	mov r1, #0
	str r1, [r4, #0x40]
_02254992:
	ldr r1, [sp, #0x20]
	cmp r1, #0
	beq _02254A14
	cmp r0, #0
	beq _02254A14
	ldr r0, [r4, #0x28]
	lsl r7, r7, #3
	ldrh r0, [r0]
	lsl r0, r0, #0x10
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x28]
	ldrh r0, [r0, #2]
	lsl r0, r0, #0x10
	str r0, [r4, #0x34]
	ldrb r0, [r4, #0x14]
	add r0, r0, #1
	strb r0, [r4, #0x14]
	ldr r0, [sp, #0x24]
	lsl r1, r0, #2
	ldr r0, _02254BA0 ; =ov04_022575A4
	ldr r0, [r0, r1]
	str r0, [sp, #0x1c]
	ldr r1, [sp, #0x1c]
	ldrb r0, [r4, #0x14]
	ldrh r1, [r1, r7]
	sub r1, r1, #1
	cmp r0, r1
	blt _022549FE
	add r0, r5, #0
	bl Fsys_GetSaveDataPtr
	bl Sav2_GetGymmickPtr
	mov r1, #5
	bl SavGymmick_AssertMagic_GetData
	ldr r1, [sp, #0x1c]
	add r1, r1, r7
	ldrh r2, [r1, #2]
	ldrb r1, [r4, #0x17]
	strb r2, [r0, r1]
	ldr r0, [r5, #0x54]
	ldr r1, [r5, #0x58]
	mov r2, #1
	bl ov01_021E8ED0
	ldr r0, _02254B9C ; =SEQ_SE_GS_ITOMARU_ROBO
	mov r1, #1
	bl StopSE
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _02254A22
_022549FE:
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	ldrb r0, [r4, #0x1a]
	beq _02254A0A
	sub r0, r0, #1
	b _02254A0C
_02254A0A:
	add r0, r0, #1
_02254A0C:
	strb r0, [r4, #0x1a]
	mov r0, #1
	strb r0, [r4, #0x16]
	b _02254A22
_02254A14:
	add r0, r4, #0
	add r0, #0x2c
	add r1, r4, #0
	add r1, #0x38
	add r2, r0, #0
	bl VEC_Add
_02254A22:
	ldrb r1, [r4, #0x17]
	add r0, r5, #0
	add r0, #0x9c
	lsl r1, r1, #2
	add r1, r4, r1
	ldr r1, [r1, #4]
	ldr r0, [r0]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov01_021F3B44
	add r3, r4, #0
	add r2, sp, #0x74
	add r3, #0x2c
	add r6, r0, #0
	ldmia r3!, {r0, r1}
	add r7, r2, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	mov r0, #2
	ldr r1, [sp, #0x74]
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [sp, #0x74]
	add r0, r6, #0
	add r1, r7, #0
	bl BgModel_SetPosition
	ldr r3, _02254BA8 ; =ov04_02257344
	add r2, sp, #0x5c
	add r6, r4, #0
	ldmia r3!, {r0, r1}
	add r7, r2, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r6, #0x2c
	str r0, [r2]
	add r3, sp, #0x68
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	add r1, r7, #0
	str r0, [r3]
	add r0, r2, #0
	bl VEC_Add
	mov r0, #0x1b
	ldrsb r0, [r4, r0]
	ldr r1, [sp, #0x70]
	lsl r0, r0, #0x10
	add r0, r1, r0
	str r0, [sp, #0x70]
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	add r1, sp, #0x68
	bl MapObject_SetPositionVec
	add r0, r5, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	bne _02254AA6
	b _02254C9E
_02254AA6:
	mov r0, #0x1b
	ldrsb r1, [r4, r0]
	mov r0, #1
	add r3, sp, #0x50
	sub r0, r0, r1
	lsl r0, r0, #0x18
	add r4, #0x2c
	asr r6, r0, #0x18
	ldmia r4!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	add r1, r7, #0
	str r0, [r3]
	add r0, r2, #0
	bl VEC_Add
	ldr r1, [sp, #0x58]
	lsl r0, r6, #0x10
	add r0, r1, r0
	str r0, [sp, #0x58]
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	add r1, sp, #0x50
	bl MapObject_SetPositionVec
	add sp, #0x98
	pop {r3, r4, r5, r6, r7, pc}
_02254AE0:
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	ldr r1, [r4, #0x28]
	add r7, r0, #0
	ldrh r1, [r1]
	bl MapObject_SetCurrentX
	add r0, r7, #0
	mov r1, #0
	bl MapObject_SetCurrentHeight
	ldr r1, [r4, #0x28]
	mov r2, #0x1b
	ldrh r1, [r1, #2]
	ldrsb r2, [r4, r2]
	add r0, r7, #0
	add r1, r1, r2
	bl MapObject_SetCurrentY
	add r0, r7, #0
	bl sub_02060F78
	add r0, r7, #0
	mov r1, #0x4a
	bl MapObject_SetHeldMovement
	add r0, r5, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _02254B52
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	ldr r1, [r4, #0x28]
	add r7, r0, #0
	ldrh r1, [r1]
	bl MapObject_SetCurrentX
	add r0, r7, #0
	mov r1, #0
	bl MapObject_SetCurrentHeight
	ldr r1, [r4, #0x28]
	add r0, r7, #0
	ldrh r3, [r1, #2]
	mov r1, #0x1b
	ldrsb r2, [r4, r1]
	mov r1, #1
	sub r1, r1, r2
	add r1, r3, r1
	bl MapObject_SetCurrentY
	add r0, r7, #0
	bl sub_02060F78
_02254B52:
	mov r0, #0
	str r0, [r4, #0x44]
	str r0, [r4, #0x48]
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetFacingDirection
	cmp r0, #1
	bne _02254B68
	mov r0, #1
	lsl r0, r0, #0xc
	b _02254B6A
_02254B68:
	ldr r0, _02254BAC ; =0xFFFFF000
_02254B6A:
	str r0, [r4, #0x4c]
	ldr r0, [r6]
	add sp, #0x98
	add r0, r0, #1
	str r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
_02254B76:
	add r0, sp, #0x44
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	ldr r2, [r4, #0x4c]
	str r2, [sp, #0x4c]
	ldr r3, [r4, #0x48]
	add r2, r3, #1
	str r2, [r4, #0x48]
	cmp r3, #0
	bne _02254BB0
	ldr r1, [r5, #0x24]
	bl GF_Camera_ShiftBy
	ldr r0, [r4, #0x44]
	add r0, r0, #1
	str r0, [r4, #0x44]
	b _02254BC0
	.balign 4, 0
_02254B9C: .word SEQ_SE_GS_ITOMARU_ROBO
_02254BA0: .word ov04_022575A4
_02254BA4: .word ov04_02257350
_02254BA8: .word ov04_02257344
_02254BAC: .word 0xFFFFF000
_02254BB0:
	ldr r0, [r4, #0x48]
	cmp r0, #1
	ble _02254BC0
	str r1, [r4, #0x48]
	ldr r2, [r4, #0x4c]
	sub r0, r1, #1
	mul r0, r2
	str r0, [r4, #0x4c]
_02254BC0:
	ldr r0, [r4, #0x44]
	cmp r0, #4
	blt _02254C9E
	mov r0, #0
	str r0, [r4, #0x50]
	ldr r0, [r6]
	add sp, #0x98
	add r0, r0, #1
	str r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
_02254BD4:
	ldr r1, [r4, #0x50]
	add r0, r1, #1
	str r0, [r4, #0x50]
	cmp r1, #8
	blt _02254C9E
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	add r7, r0, #0
	add r0, r5, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _02254C22
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	add r5, r0, #0
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	beq _02254C10
	add r0, r7, #0
	mov r1, #0xd
	bl MapObject_SetHeldMovement
	add r0, r5, #0
	mov r1, #0xd
	bl MapObject_SetHeldMovement
	b _02254C3A
_02254C10:
	add r0, r7, #0
	mov r1, #0xc
	bl MapObject_SetHeldMovement
	add r0, r5, #0
	mov r1, #0xc
	bl MapObject_SetHeldMovement
	b _02254C3A
_02254C22:
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	beq _02254C32
	add r0, r7, #0
	mov r1, #0xd
	bl MapObject_SetHeldMovement
	b _02254C3A
_02254C32:
	add r0, r7, #0
	mov r1, #0xc
	bl MapObject_SetHeldMovement
_02254C3A:
	ldr r0, [r6]
	add sp, #0x98
	add r0, r0, #1
	str r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
_02254C44:
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	add r7, r0, #0
	add r0, r5, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _02254C88
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	add r4, r0, #0
	add r0, r7, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #0
	beq _02254C9E
	add r0, r4, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #0
	beq _02254C9E
	add r0, r4, #0
	bl MapObject_ClearHeldMovement
	ldr r0, [sp, #0x18]
	bl DestroySysTask
	ldr r0, [r6]
	add sp, #0x98
	add r0, r0, #1
	str r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
_02254C88:
	add r0, r7, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #0
	beq _02254C9E
	ldr r0, [sp, #0x18]
	bl DestroySysTask
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
_02254C9E:
	add sp, #0x98
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov04_02254724

	thumb_func_start ov04_02254CA4
ov04_02254CA4: ; 0x02254CA4
	push {r3, lr}
	ldr r0, _02254CB8 ; =SEQ_SE_DP_KI_GASYAN
	bl IsSEPlaying
	cmp r0, #0
	bne _02254CB4
	mov r0, #1
	pop {r3, pc}
_02254CB4:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_02254CB8: .word SEQ_SE_DP_KI_GASYAN
	thumb_func_end ov04_02254CA4

	.rodata

ov04_02257344: ; 0x02257344
	.byte 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00

ov04_02257350: ; 0x02257350
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov04_0225735C:
	.byte 0x09, 0x00, 0x10, 0x00
	.byte 0x09, 0x00, 0x0E, 0x00, 0x0F, 0x00, 0x0E, 0x00, 0x0F, 0x00, 0x09, 0x00

ov04_0225736C:
	.byte 0x03, 0x00, 0x10, 0x00
	.byte 0x03, 0x00, 0x0C, 0x00, 0x09, 0x00, 0x0D, 0x00, 0x09, 0x00, 0x09, 0x00

ov04_0225737C:
	.byte 0x0F, 0x00, 0x1F, 0x00
	.byte 0x0F, 0x00, 0x1C, 0x00, 0x09, 0x00, 0x1B, 0x00, 0x09, 0x00, 0x1A, 0x00, 0x03, 0x00, 0x1B, 0x00
	.byte 0x03, 0x00, 0x18, 0x00

ov04_02257394:
	.byte 0x03, 0x00, 0x10, 0x00, 0x03, 0x00, 0x0C, 0x00, 0x09, 0x00, 0x0D, 0x00
	.byte 0x09, 0x00, 0x0A, 0x00, 0x03, 0x00, 0x0A, 0x00, 0x03, 0x00, 0x09, 0x00

ov04_022573AC:
	.byte 0x09, 0x00, 0x10, 0x00
	.byte 0x09, 0x00, 0x0E, 0x00, 0x0F, 0x00, 0x0E, 0x00, 0x0F, 0x00, 0x0B, 0x00, 0x09, 0x00, 0x0C, 0x00
	.byte 0x09, 0x00, 0x09, 0x00

ov04_022573C4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov04_022573E4:
	.byte 0x08, 0x00, 0x07, 0x00
	.word ov04_02257504
	.byte 0x06, 0x00, 0x06, 0x00
	.word ov04_02257394
	.byte 0x00, 0x00, 0x00, 0x00
	.word 0
	.byte 0x00, 0x00, 0x00, 0x00
	.word 0

ov04_02257404:
	.byte 0x03, 0x00, 0x1F, 0x00, 0x03, 0x00, 0x1D, 0x00, 0x09, 0x00, 0x1D, 0x00
	.byte 0x09, 0x00, 0x1B, 0x00, 0x0F, 0x00, 0x1C, 0x00, 0x0F, 0x00, 0x19, 0x00, 0x09, 0x00, 0x19, 0x00
	.byte 0x09, 0x00, 0x18, 0x00

ov04_02257424:
	.byte 0x06, 0x00, 0x02, 0x00
	.word ov04_0225737C
	.byte 0x06, 0x00, 0x02, 0x00
	.word ov04_0225737C
	.byte 0x06, 0x00, 0x02, 0x00
	.word ov04_0225737C
	.byte 0x06, 0x00, 0x02, 0x00
	.word ov04_0225737C

ov04_02257444:
	.byte 0x06, 0x00, 0x03, 0x00
	.word ov04_0225737C
	.byte 0x06, 0x00, 0x03, 0x00
	.word ov04_0225737C
	.byte 0x06, 0x00, 0x03, 0x00
	.word ov04_0225737C
	.byte 0x06, 0x00, 0x03, 0x00
	.word ov04_0225737C

ov04_02257464:
	.byte 0x08, 0x00, 0x05, 0x00
	.word ov04_02257584
	.byte 0x08, 0x00, 0x05, 0x00
	.word ov04_02257584
	.byte 0x08, 0x00, 0x05, 0x00
	.word ov04_02257584
	.byte 0x08, 0x00, 0x05, 0x00
	.word ov04_02257584

ov04_02257484:
	.byte 0x08, 0x00, 0x04, 0x00
	.word ov04_02257404
	.byte 0x08, 0x00, 0x04, 0x00
	.word ov04_02257404
	.byte 0x08, 0x00, 0x04, 0x00
	.word ov04_02257404
	.byte 0x08, 0x00, 0x04, 0x00
	.word ov04_02257404

ov04_022574A4:
	.byte 0x08, 0x00, 0x00, 0x00
	.word ov04_02257404
	.byte 0x08, 0x00, 0x00, 0x00
	.word ov04_02257404
	.byte 0x08, 0x00, 0x00, 0x00
	.word ov04_02257404
	.byte 0x08, 0x00, 0x00, 0x00
	.word ov04_02257404

ov04_022574C4:
	.byte 0x08, 0x00, 0x01, 0x00
	.word ov04_02257584
	.byte 0x08, 0x00, 0x01, 0x00
	.word ov04_02257584
	.byte 0x08, 0x00, 0x01, 0x00
	.word ov04_02257584
	.byte 0x08, 0x00, 0x01, 0x00
	.word ov04_02257584

ov04_022574E4:
	.byte 0x00, 0x00, 0x00, 0x00
	.word 0
	.byte 0x00, 0x00, 0x00, 0x00
	.word 0
	.byte 0x06, 0x00, 0x07, 0x00
	.word ov04_022573AC
	.byte 0x04, 0x00, 0x06, 0x00
	.word ov04_0225736C

ov04_02257504:
	.byte 0x09, 0x00, 0x10, 0x00, 0x09, 0x00, 0x0E, 0x00, 0x0F, 0x00, 0x0E, 0x00
	.byte 0x0F, 0x00, 0x0B, 0x00, 0x09, 0x00, 0x0C, 0x00, 0x09, 0x00, 0x0A, 0x00, 0x03, 0x00, 0x0A, 0x00
	.byte 0x03, 0x00, 0x09, 0x00

ov04_02257524:
	.byte 0x00, 0x00, 0x00, 0x00
	.word 0
	.byte 0x06, 0x00, 0x09, 0x00
	.word ov04_02257394
	.byte 0x00, 0x00, 0x00, 0x00
	.word 0
	.byte 0x04, 0x00, 0x0A, 0x00
	.word ov04_0225736C

ov04_02257544:
	.byte 0x08, 0x00, 0x09, 0x00
	.word ov04_02257504
	.byte 0x04, 0x00, 0x0B, 0x00
	.word ov04_0225735C
	.byte 0x06, 0x00, 0x0A, 0x00
	.word ov04_022573AC
	.byte 0x04, 0x00, 0x0B, 0x00
	.word ov04_0225735C

ov04_02257564:
	.byte 0x00, 0x00, 0x00, 0x00
	.word 0
	.byte 0x04, 0x00, 0x07, 0x00
	.word ov04_0225735C
	.byte 0x00, 0x00, 0x00, 0x00
	.word 0
	.byte 0x04, 0x00, 0x07, 0x00
	.word ov04_0225735C

ov04_02257584:
	.byte 0x09, 0x00, 0x1F, 0x00, 0x09, 0x00, 0x1D, 0x00, 0x03, 0x00, 0x1D, 0x00
	.byte 0x03, 0x00, 0x1B, 0x00, 0x09, 0x00, 0x1A, 0x00, 0x09, 0x00, 0x19, 0x00, 0x0F, 0x00, 0x19, 0x00
	.byte 0x0F, 0x00, 0x18, 0x00

ov04_022575A4: ; 0x022575A4
	.word ov04_02257484
	.word ov04_02257464
	.word ov04_02257444
	.word ov04_02257424
	.word ov04_022574A4
	.word ov04_022574C4
	.word ov04_02257524
	.word ov04_02257544
	.word ov04_022573C4
	.word ov04_022573E4
	.word ov04_022574E4
	.word ov04_02257564

ov04_022575D4: ; 0x022575D4
	.byte 0x03, 0x00, 0x1F, 0x00, 0x09, 0x00, 0x1F, 0x00, 0x0F, 0x00, 0x1F, 0x00
	.byte 0x03, 0x00, 0x18, 0x00, 0x09, 0x00, 0x18, 0x00, 0x0F, 0x00, 0x18, 0x00, 0x03, 0x00, 0x10, 0x00
	.byte 0x09, 0x00, 0x10, 0x00, 0x0F, 0x00, 0x10, 0x00, 0x03, 0x00, 0x09, 0x00, 0x09, 0x00, 0x09, 0x00
	.byte 0x0F, 0x00, 0x09, 0x00
