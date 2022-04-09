#include "fielddata/script/scr_seq/event_T27GYM0101.h"
#include "constants/sndseq.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov04_02253E20
ov04_02253E20: ; 0x02253E20
	push {r3, r4, r5, r6, lr}
	sub sp, #0x24
	add r5, r0, #0
	bl Fsys_GetSaveDataPtr
	bl Sav2_GetGymmickPtr
	mov r1, #4
	bl SavGymmick_AssertMagic_GetData
	add r3, sp, #0x18
	ldr r6, _02253ECC ; =_02257328
	add r4, r0, #0
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	mov r1, #0x6f
	str r0, [r3]
	ldr r0, [r5, #0x54]
	mov r3, #0
	str r0, [sp]
	add r0, r5, #0
	add r0, #0x9c
	ldr r0, [r0]
	bl ov01_021F3C0C
	mov r3, #3
	mov r0, #2
	str r3, [sp]
	lsl r0, r0, #0x10
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x98
	ldr r0, [r0]
	mov r1, #0xe
	str r0, [sp, #8]
	mov r0, #0
	mov r2, #0x13
	bl ov01_021FB3E4
	ldr r0, [r4]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	beq _02253E80
	cmp r0, #1
	beq _02253E86
	b _02253E8C
_02253E80:
	mov r4, #2
	lsl r4, r4, #0x10
	b _02253E94
_02253E86:
	mov r4, #0x1f
	lsl r4, r4, #0x10
	b _02253E94
_02253E8C:
	bl GF_AssertFail
	mov r4, #2
	lsl r4, r4, #0x10
_02253E94:
	add r0, r5, #0
	add r0, #0x9c
	ldr r0, [r0]
	mov r1, #0x6f
	bl ov01_021F3B4C
	add r6, r0, #0
	add r0, sp, #0xc
	add r1, r6, #0
	bl ov01_021F3B0C
	add r0, r6, #0
	add r1, sp, #0xc
	str r4, [sp, #0x10]
	bl ov01_021F3B1C
	add r5, #0x98
	ldr r2, [r5]
	mov r0, #0
	add r1, r4, #0
	bl ov01_021FB4A0
	ldr r0, _02253ED0 ; =ov04_02257334
	bl G3X_SetEdgeColorTable
	add sp, #0x24
	pop {r3, r4, r5, r6, pc}
	nop
_02253ECC: .word _02257328
_02253ED0: .word ov04_02257334
	thumb_func_end ov04_02253E20

	thumb_func_start ov04_02253ED4
ov04_02253ED4: ; 0x02253ED4
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0xb
	mov r1, #8
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	mov r0, #0
	str r0, [r4]
	add r0, r5, #0
	str r5, [r4, #4]
	bl Fsys_GetSaveDataPtr
	bl Sav2_GetGymmickPtr
	mov r1, #4
	bl SavGymmick_AssertMagic_GetData
	add r6, r0, #0
	ldr r0, [r5, #0x40]
	add r1, sp, #0
	bl PlayerAvatar_GetPositionVec
	mov r0, #2
	ldr r1, [sp, #4]
	lsl r0, r0, #0x10
	cmp r1, r0
	ldr r0, [r5, #0x10]
	bne _02253F20
	ldr r1, _02253F30 ; =ov04_02253F38
	add r2, r4, #0
	bl TaskManager_Call
	mov r0, #1
	add sp, #0xc
	str r0, [r6]
	pop {r3, r4, r5, r6, pc}
_02253F20:
	ldr r1, _02253F34 ; =ov04_02253F94
	add r2, r4, #0
	bl TaskManager_Call
	mov r0, #0
	str r0, [r6]
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02253F30: .word ov04_02253F38
_02253F34: .word ov04_02253F94
	thumb_func_end ov04_02253ED4

	thumb_func_start ov04_02253F38
ov04_02253F38: ; 0x02253F38
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r1, [r4]
	cmp r1, #0
	beq _02253F5A
	cmp r1, #1
	beq _02253F6C
	cmp r1, #5
	beq _02253F7E
	b _02253F86
_02253F5A:
	ldr r0, [r5, #0x10]
	ldr r1, _02253F8C ; =ov01_02205A60
	mov r2, #0
	bl TaskManager_Call
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02253F86
_02253F6C:
	ldr r0, _02253F90 ; =ov04_02253FF0
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02253F86
_02253F7E:
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
_02253F86:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_02253F8C: .word ov01_02205A60
_02253F90: .word ov04_02253FF0
	thumb_func_end ov04_02253F38

	thumb_func_start ov04_02253F94
ov04_02253F94: ; 0x02253F94
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r1, [r4]
	cmp r1, #0
	beq _02253FB6
	cmp r1, #1
	beq _02253FC8
	cmp r1, #5
	beq _02253FDA
	b _02253FE2
_02253FB6:
	ldr r0, [r5, #0x10]
	ldr r1, _02253FE8 ; =ov01_02205A60
	mov r2, #0
	bl TaskManager_Call
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02253FE2
_02253FC8:
	ldr r0, _02253FEC ; =ov04_022540C0
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02253FE2
_02253FDA:
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
_02253FE2:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_02253FE8: .word ov01_02205A60
_02253FEC: .word ov04_022540C0
	thumb_func_end ov04_02253F94

	thumb_func_start ov04_02253FF0
ov04_02253FF0: ; 0x02253FF0
	push {r4, r5, r6, lr}
	sub sp, #0x18
	add r5, r1, #0
	add r6, r0, #0
	ldr r0, [r5]
	ldr r4, [r5, #4]
	cmp r0, #2
	beq _0225400C
	cmp r0, #3
	beq _02254026
	cmp r0, #4
	beq _0225408C
	add sp, #0x18
	pop {r4, r5, r6, pc}
_0225400C:
	ldr r0, [r4, #0x40]
	mov r1, #0
	bl sub_0205C858
	mov r0, #SEQ_SE_DP_ELEBETA>>4
	lsl r0, r0, #4
	bl PlaySE
	ldr r0, [r5]
	add sp, #0x18
	add r0, r0, #1
	str r0, [r5]
	pop {r4, r5, r6, pc}
_02254026:
	add r0, r4, #0
	add r0, #0x9c
	ldr r0, [r0]
	mov r1, #0x6f
	bl ov01_021F3B4C
	add r6, r0, #0
	add r0, sp, #0xc
	add r1, r6, #0
	bl ov01_021F3B0C
	mov r0, #1
	ldr r1, [sp, #0x10]
	lsl r0, r0, #0x10
	add r1, r1, r0
	mov r0, #0x1f
	lsl r0, r0, #0x10
	str r1, [sp, #0x10]
	cmp r1, r0
	blt _02254060
	str r0, [sp, #0x10]
	mov r0, #0x61
	lsl r0, r0, #4
	mov r1, #0
	bl StopSE
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
_02254060:
	ldr r0, [r4, #0x40]
	add r1, sp, #0
	bl PlayerAvatar_GetPositionVec
	mov r0, #1
	ldr r1, [sp, #4]
	lsl r0, r0, #0x10
	add r1, r1, r0
	str r1, [sp, #4]
	ldr r0, [r4, #0x40]
	bl sub_0205C838
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl ov01_02205A34
	add r0, r6, #0
	add r1, sp, #0xc
	bl ov01_021F3B1C
	add sp, #0x18
	pop {r4, r5, r6, pc}
_0225408C:
	add r2, r4, #0
	add r2, #0x98
	mov r1, #0x1f
	ldr r2, [r2]
	mov r0, #0
	lsl r1, r1, #0x10
	bl ov01_021FB4A0
	ldr r0, [r4, #0x40]
	mov r1, #1
	bl sub_0205C874
	ldr r0, _022540BC ; =SEQ_SE_DP_KI_GASYAN
	bl PlaySE
	add r0, r6, #0
	bl DestroySysTask
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	add sp, #0x18
	pop {r4, r5, r6, pc}
	nop
_022540BC: .word SEQ_SE_DP_KI_GASYAN
	thumb_func_end ov04_02253FF0

	thumb_func_start ov04_022540C0
ov04_022540C0: ; 0x022540C0
	push {r4, r5, r6, lr}
	sub sp, #0x18
	add r5, r1, #0
	add r6, r0, #0
	ldr r0, [r5]
	ldr r4, [r5, #4]
	cmp r0, #2
	beq _022540DC
	cmp r0, #3
	beq _022540F6
	cmp r0, #4
	beq _0225415C
	add sp, #0x18
	pop {r4, r5, r6, pc}
_022540DC:
	ldr r0, [r4, #0x40]
	mov r1, #0
	bl sub_0205C858
	mov r0, #SEQ_SE_DP_ELEBETA>>4
	lsl r0, r0, #4
	bl PlaySE
	ldr r0, [r5]
	add sp, #0x18
	add r0, r0, #1
	str r0, [r5]
	pop {r4, r5, r6, pc}
_022540F6:
	add r0, r4, #0
	add r0, #0x9c
	ldr r0, [r0]
	mov r1, #0x6f
	bl ov01_021F3B4C
	add r6, r0, #0
	add r0, sp, #0xc
	add r1, r6, #0
	bl ov01_021F3B0C
	mov r0, #1
	ldr r1, [sp, #0x10]
	lsl r0, r0, #0x10
	sub r2, r1, r0
	lsl r1, r0, #1
	str r2, [sp, #0x10]
	cmp r2, r1
	bgt _02254130
	lsl r0, r0, #1
	str r0, [sp, #0x10]
	mov r0, #0x61
	lsl r0, r0, #4
	mov r1, #0
	bl StopSE
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
_02254130:
	ldr r0, [r4, #0x40]
	add r1, sp, #0
	bl PlayerAvatar_GetPositionVec
	mov r0, #1
	ldr r1, [sp, #4]
	lsl r0, r0, #0x10
	sub r1, r1, r0
	str r1, [sp, #4]
	ldr r0, [r4, #0x40]
	bl sub_0205C838
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl ov01_02205A34
	add r0, r6, #0
	add r1, sp, #0xc
	bl ov01_021F3B1C
	add sp, #0x18
	pop {r4, r5, r6, pc}
_0225415C:
	add r2, r4, #0
	add r2, #0x98
	mov r1, #2
	ldr r2, [r2]
	mov r0, #0
	lsl r1, r1, #0x10
	bl ov01_021FB4A0
	ldr r0, [r4, #0x40]
	mov r1, #1
	bl sub_0205C874
	ldr r0, _0225418C ; =SEQ_SE_DP_KI_GASYAN
	bl PlaySE
	add r0, r6, #0
	bl DestroySysTask
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	add sp, #0x18
	pop {r4, r5, r6, pc}
	nop
_0225418C: .word SEQ_SE_DP_KI_GASYAN
	thumb_func_end ov04_022540C0

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
	bl ov01_021F3C0C
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
	ldr r1, _02254690 ; =ov01_02205A60
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
_02254690: .word ov01_02205A60
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
	bl ov01_021F3B1C
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

	thumb_func_start ov04_02254CBC
ov04_02254CBC: ; 0x02254CBC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	add r5, r0, #0
	bl Fsys_GetSaveDataPtr
	bl Sav2_GetGymmickPtr
	mov r1, #1
	bl SavGymmick_AssertMagic_GetData
	add r7, r0, #0
	mov r0, #4
	mov r1, #0x1c
	bl AllocFromHeap
	ldr r1, [r5, #4]
	mov r2, #0x1c
	str r0, [r1, #0x24]
	ldr r0, [r5, #4]
	mov r1, #0
	ldr r0, [r0, #0x24]
	bl MI_CpuFill8
	ldr r0, [r5, #4]
	mov r1, #1
	lsl r1, r1, #8
	ldr r4, [r0, #0x24]
	add r0, r1, #0
	add r0, #0x1c
	str r1, [r5, r0]
	mov r0, #0xa
	mov r3, #0
	str r0, [sp]
	str r3, [sp, #4]
	ldr r0, [r5, #0x4c]
	sub r1, r3, #1
	mov r2, #1
	bl ov01_021EA864
	mov r1, #0
	ldr r0, [r5, #0x4c]
	mvn r1, r1
	mov r2, #0
	mov r3, #0x1f
	bl ov01_021EA89C
	mov r1, #0
	add r2, sp, #0x14
	sub r0, r1, #1
_02254D1E:
	add r1, r1, #1
	strb r0, [r2]
	add r2, r2, #1
	cmp r1, #0x20
	blt _02254D1E
	ldr r0, [r5, #0x4c]
	add r1, sp, #0x14
	bl ov01_021EA8C4
	add r0, r5, #0
	bl ov04_02254F44
	mov r6, #0
_02254D38:
	ldr r0, [r5, #0x3c]
	add r1, r6, #2
	bl GetMapObjectByID
	add r1, sp, #8
	bl MapObject_GetPositionVec
	ldr r0, [r5, #0x54]
	mov r1, #0x80
	str r0, [sp]
	add r0, r5, #0
	add r0, #0x9c
	ldr r0, [r0]
	add r2, sp, #8
	mov r3, #0
	bl ov01_021F3C0C
	str r0, [r4]
	ldrb r0, [r7, r6]
	cmp r0, #0
	beq _02254D78
	add r0, r5, #0
	ldr r1, [r4]
	add r0, #0x9c
	lsl r1, r1, #0x18
	ldr r0, [r0]
	lsr r1, r1, #0x18
	bl ov01_021F3B44
	mov r1, #1
	bl ov01_021F3B2C
_02254D78:
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #4
	blt _02254D38
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov04_02254CBC

	thumb_func_start ov04_02254D84
ov04_02254D84: ; 0x02254D84
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x24]
	bl FreeToHeap
	ldr r0, [r4, #4]
	mov r1, #0
	str r1, [r0, #0x24]
	pop {r4, pc}
	thumb_func_end ov04_02254D84

	thumb_func_start ov04_02254D98
ov04_02254D98: ; 0x02254D98
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r1, [r6, #4]
	ldr r5, [r1, #0x24]
	mov r1, #0x1e
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	ldr r0, [r4]
	bl ov04_MortyGymTrainerObjectToCandleIdx
	cmp r0, #4
	bne _02254DB8
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
_02254DB8:
	str r0, [r5, #0x10]
	ldr r0, [r4]
	add r1, r6, #0
	str r0, [r5, #0x18]
	ldr r0, _02254DCC ; =ov04_02254E20
	mov r2, #0
	bl CreateSysTask
	str r0, [r5, #0x14]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02254DCC: .word ov04_02254E20
	thumb_func_end ov04_02254D98

	thumb_func_start ov04_02254DD0
ov04_02254DD0: ; 0x02254DD0
	ldr r0, [r0, #4]
	ldr r3, _02254DDC ; =sub_0200E390
	ldr r0, [r0, #0x24]
	ldr r0, [r0, #0x14]
	bx r3
	nop
_02254DDC: .word DestroySysTask
	thumb_func_end ov04_02254DD0

	thumb_func_start ov04_02254DE0
ov04_02254DE0: ; 0x02254DE0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r2, [r5, #4]
	ldr r4, [r2, #0x24]
	bl FieldSysGetAttrAddr
	add r6, r0, #0
	ldr r0, [r6]
	bl ov04_MortyGymTrainerObjectToCandleIdx
	str r0, [r4, #0x10]
	ldr r0, [r6]
	mov r1, #0x10
	str r0, [r4, #0x18]
	mov r0, #0xb
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	mov r1, #0
	str r1, [r2]
	mov r0, #1
	str r0, [r2, #4]
	str r1, [r2, #8]
	str r5, [r2, #0xc]
	ldr r0, [r5, #0x10]
	ldr r1, _02254E1C ; =ov04_02254E50
	bl TaskManager_Call
	pop {r4, r5, r6, pc}
	nop
_02254E1C: .word ov04_02254E50
	thumb_func_end ov04_02254DE0

	thumb_func_start ov04_02254E20
ov04_02254E20: ; 0x02254E20
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r1, #0
	ldr r0, [r5, #4]
	add r1, sp, #0
	ldr r4, [r0, #0x24]
	ldr r0, [r4, #0x18]
	bl MapObject_GetPositionVec
	ldr r1, [r4, #0x10]
	add r5, #0x9c
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldr r0, [r5]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov01_021F3B44
	add r1, sp, #0
	bl ov01_021F3B1C
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov04_02254E20

	thumb_func_start ov04_02254E50
ov04_02254E50: ; 0x02254E50
	push {r4, r5, r6, lr}
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	ldr r0, [r1, #4]
	ldr r5, [r0, #0x24]
	ldr r0, [r4]
	cmp r0, #0
	beq _02254E6E
	cmp r0, #1
	beq _02254E86
	cmp r0, #2
	beq _02254EFE
	b _02254F18
_02254E6E:
	ldr r1, [r4, #8]
	add r0, r1, #1
	str r0, [r4, #8]
	cmp r1, #0x1e
	blt _02254F18
	ldr r0, _02254F1C ; =SEQ_SE_GS_ROUSOKU_KIERU
	bl PlaySE
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02254F18
_02254E86:
	add r1, #0x9c
	ldr r0, [r1]
	ldr r1, [r5, #0x10]
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov01_021F3B44
	ldr r1, [r4, #4]
	add r6, r0, #0
	cmp r1, #4
	blt _02254ECC
	mov r1, #1
	bl ov01_021F3B2C
	ldr r0, [r4, #0xc]
	bl Fsys_GetSaveDataPtr
	bl Sav2_GetGymmickPtr
	mov r1, #1
	bl SavGymmick_AssertMagic_GetData
	ldr r1, [r5, #0x10]
	mov r2, #1
	strb r2, [r0, r1]
	ldr r0, [r5, #0x18]
	mov r1, #0xfa
	bl ov01_021FA930
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02254ED0
_02254ECC:
	add r0, r1, #1
	str r0, [r4, #4]
_02254ED0:
	add r0, r6, #0
	bl ov01_021F3B04
	add r5, r0, #0
	mov r0, #1
	ldr r1, [r4, #4]
	lsl r0, r0, #0xc
	bl _s32_div_f
	str r0, [r5]
	mov r0, #1
	ldr r1, [r4, #4]
	lsl r0, r0, #0xc
	bl _s32_div_f
	str r0, [r5, #4]
	mov r0, #1
	ldr r1, [r4, #4]
	lsl r0, r0, #0xc
	bl _s32_div_f
	str r0, [r5, #8]
	b _02254F18
_02254EFE:
	ldr r0, [r5, #0x18]
	bl ov01_021FA2D4
	cmp r0, #0
	bne _02254F18
	ldr r0, [r4, #0xc]
	bl ov04_02254F44
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r4, r5, r6, pc}
_02254F18:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02254F1C: .word SEQ_SE_GS_ROUSOKU_KIERU
	thumb_func_end ov04_02254E50

	thumb_func_start ov04_MortyGymTrainerObjectToCandleIdx
ov04_MortyGymTrainerObjectToCandleIdx: ; 0x02254F20
	push {r3, lr}
	bl MapObject_GetID
	ldr r2, _02254F40 ; =sMortyGymTrainerObjectIds
	mov r3, #0
_02254F2A:
	lsl r1, r3, #2
	ldr r1, [r2, r1]
	cmp r0, r1
	beq _02254F3C
	add r1, r3, #1
	lsl r1, r1, #0x18
	lsr r3, r1, #0x18
	cmp r3, #4
	blo _02254F2A
_02254F3C:
	add r0, r3, #0
	pop {r3, pc}
	.balign 4, 0
_02254F40: .word sMortyGymTrainerObjectIds
	thumb_func_end ov04_MortyGymTrainerObjectToCandleIdx

	thumb_func_start ov04_02254F44
ov04_02254F44: ; 0x02254F44
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x3c]
	bl MapObjectMan_GetCount
	add r5, r0, #0
	ldr r0, [r4, #0x3c]
	bl MapObjectMan_GetArray
	mov r4, #0
	str r0, [sp]
	cmp r5, #0
	ble _02254F88
	add r6, r4, #0
	add r7, sp, #0
_02254F62:
	ldr r0, [sp]
	bl MapObject_IsInUse
	cmp r0, #1
	bne _02254F7C
	ldr r0, [sp]
	bl ov01_021F72DC
	bl sub_02023F90
	add r1, r6, #0
	bl NNS_G3dMdlSetMdlFogEnableFlagAll
_02254F7C:
	add r0, r7, #0
	bl sub_0205F1D0
	add r4, r4, #1
	cmp r4, r5
	blt _02254F62
_02254F88:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov04_02254F44

	thumb_func_start ov04_02254F8C
ov04_02254F8C: ; 0x02254F8C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	ldr r3, _02255070 ; =ov04_0225762C
	str r0, [sp, #4]
	ldmia r3!, {r0, r1}
	add r2, sp, #0x38
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [sp, #4]
	bl Fsys_GetSaveDataPtr
	bl Sav2_GetGymmickPtr
	mov r1, #6
	bl SavGymmick_AssertMagic_GetData
	str r0, [sp, #0x10]
	ldr r1, _02255074 ; =0x00000754
	mov r0, #4
	bl AllocFromHeap
	ldr r1, [sp, #4]
	ldr r2, _02255074 ; =0x00000754
	ldr r1, [r1, #4]
	str r0, [r1, #0x24]
	ldr r0, [sp, #4]
	mov r1, #0
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x24]
	bl MI_CpuFill8
	ldr r0, [sp, #4]
	ldr r2, _02255078 ; =ov04_02257620
	ldr r0, [r0, #4]
	add r3, sp, #0x14
	ldr r6, [r0, #0x24]
	ldr r0, [sp, #4]
	ldr r4, [sp, #0x10]
	str r0, [r6]
	add r0, sp, #0x38
	str r0, [sp, #0xc]
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	mov r5, #0
	add r7, r6, #4
	str r0, [r3]
_02254FEC:
	add r3, sp, #0x14
	ldmia r3!, {r0, r1}
	add r2, sp, #0x2c
	mov ip, r2
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r1, #0
	str r0, [r2]
	add r0, sp, #0x20
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	ldr r0, [sp, #0x10]
	mov r2, ip
	add r0, r0, r5
	str r0, [sp, #8]
	ldrb r0, [r0, #0xc]
	add r3, sp, #0x20
	lsl r0, r0, #0xe
	neg r0, r0
	str r0, [sp, #0x24]
	ldrh r0, [r4]
	lsl r1, r0, #0x10
	mov r0, #2
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [sp, #0x2c]
	ldrh r0, [r4, #6]
	lsl r1, r0, #0x10
	mov r0, #2
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [sp, #0x34]
	ldr r0, [sp, #4]
	ldr r1, [sp, #0xc]
	ldr r0, [r0, #0x54]
	str r0, [sp]
	ldr r0, [sp, #4]
	ldr r1, [r1]
	add r0, #0x9c
	ldr r0, [r0]
	bl ov01_021F3C0C
	strb r0, [r6, #0xb]
	str r7, [sp]
	ldr r1, [sp, #8]
	lsl r0, r5, #0x18
	ldrb r1, [r1, #0xc]
	ldrh r2, [r4]
	ldrh r3, [r4, #6]
	lsr r0, r0, #0x18
	bl ov04_02255140
	ldr r0, [sp, #0xc]
	add r5, r5, #1
	add r0, r0, #4
	str r0, [sp, #0xc]
	mov r0, #0x27
	lsl r0, r0, #4
	add r4, r4, #2
	add r6, r6, r0
	add r7, r7, r0
	cmp r5, #3
	blt _02254FEC
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02255070: .word ov04_0225762C
_02255074: .word 0x00000754
_02255078: .word ov04_02257620
	thumb_func_end ov04_02254F8C

	thumb_func_start ov04_0225507C
ov04_0225507C: ; 0x0225507C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x24]
	bl FreeToHeap
	ldr r0, [r4, #4]
	mov r1, #0
	str r1, [r0, #0x24]
	pop {r4, pc}
	thumb_func_end ov04_0225507C

	thumb_func_start ov04_02255090
ov04_02255090: ; 0x02255090
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl Fsys_GetSaveDataPtr
	bl Sav2_GetGymmickPtr
	bl SavGymmick_GetType
	cmp r0, #6
	beq _022550A8
	mov r0, #0
	pop {r4, r5, r6, pc}
_022550A8:
	ldr r0, [r5, #4]
	ldr r4, [r0, #0x24]
	cmp r4, #0
	bne _022550B4
	mov r0, #0
	pop {r4, r5, r6, pc}
_022550B4:
	ldr r0, [r5, #0x40]
	bl GetPlayerXCoord
	add r6, r0, #0
	ldr r0, [r5, #0x40]
	bl GetPlayerYCoord
	add r2, r0, #0
	lsl r1, r6, #0x10
	lsl r2, r2, #0x10
	add r0, r4, #0
	lsr r1, r1, #0x10
	lsr r2, r2, #0x10
	bl ov04_02255708
	pop {r4, r5, r6, pc}
	thumb_func_end ov04_02255090

	thumb_func_start ov04_022550D4
ov04_022550D4: ; 0x022550D4
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	ldr r0, [sp, #0x18]
	mov r6, #0x79
	str r0, [sp, #0x18]
	mov r0, #0
	mov ip, r0
	ldr r0, [sp]
	lsl r6, r6, #2
	ldr r0, [r0, #4]
	add r3, r1, #0
	ldr r0, [r0, #0x24]
	sub r4, r6, #4
	add r7, r0, #4
_022550F0:
	mov r0, #0
	add r1, r7, #0
_022550F4:
	ldr r5, [r1, r4]
	cmp r3, r5
	bne _0225510A
	ldr r5, [r1, r6]
	cmp r2, r5
	bne _0225510A
	ldr r0, [sp, #0x18]
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225510A:
	add r0, r0, #1
	add r1, #8
	cmp r0, #0x12
	blt _022550F4
	mov r0, #0x27
	lsl r0, r0, #4
	add r7, r7, r0
	mov r0, ip
	add r0, r0, #1
	mov ip, r0
	cmp r0, #3
	blt _022550F0
	ldr r0, [sp]
	add r1, r3, #0
	bl GetMetatileBehaviorAt
	bl sub_0205BAC4
	cmp r0, #0
	beq _0225513A
	ldr r1, [sp, #0x18]
	mov r0, #1
	str r0, [r1]
	pop {r3, r4, r5, r6, r7, pc}
_0225513A:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov04_022550D4

	thumb_func_start ov04_02255140
ov04_02255140: ; 0x02255140
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	str r1, [sp]
	str r2, [sp, #4]
	str r3, [sp, #8]
	ldr r1, [sp, #0x38]
	ldr r2, [sp, #4]
	str r1, [sp, #0x38]
	str r2, [r1, #8]
	ldr r2, [sp, #8]
	str r2, [r1, #0xc]
	ldr r1, [sp, #4]
	add r2, r1, #1
	ldr r1, [sp, #0x38]
	str r2, [r1, #0x10]
	ldr r2, [sp, #8]
	str r2, [r1, #0x14]
	ldr r1, [sp, #4]
	sub r7, r1, #1
	ldr r1, [sp, #0x38]
	cmp r0, #1
	str r7, [r1, #0x18]
	ldr r2, [sp, #8]
	str r2, [r1, #0x1c]
	ldr r2, [sp, #4]
	str r2, [r1, #0x20]
	ldr r2, [sp, #8]
	str r2, [r1, #0x24]
	bne _0225517C
	b _022552D6
_0225517C:
	mov r0, #0
	str r0, [r1]
	mov r2, #5
	strb r2, [r1, #4]
	mov r2, #7
	strb r2, [r1, #5]
	ldr r1, [sp, #4]
	ldr r4, [sp, #0x38]
	str r1, [sp, #0x1c]
	ldr r1, [sp, #8]
	str r1, [sp, #0x20]
	ldr r1, [sp, #4]
	add r3, r1, #3
	ldr r1, [sp, #8]
	str r3, [sp, #0x1c]
	sub r2, r1, #2
	str r2, [sp, #0x20]
_0225519E:
	add r1, r2, r0
	str r3, [r4, #0x28]
	str r1, [r4, #0x2c]
	add r0, r0, #1
	add r4, #8
	cmp r0, #7
	blt _0225519E
	ldr r0, [sp, #4]
	ldr r3, [sp, #0x38]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #8]
	mov r4, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #4]
	sub r2, r0, #3
	ldr r0, [sp, #8]
	str r2, [sp, #0x1c]
	sub r1, r0, #2
	str r1, [sp, #0x20]
_022551C4:
	add r0, r1, r4
	str r2, [r3, #0x68]
	str r0, [r3, #0x6c]
	add r4, r4, #1
	add r3, #8
	cmp r4, #7
	blt _022551C4
	ldr r0, [sp, #4]
	ldr r2, [sp, #0x38]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #8]
	mov r3, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #4]
	sub r1, r0, #2
	ldr r0, [sp, #8]
	str r1, [sp, #0x1c]
	add r0, r0, #5
	str r0, [sp, #0x20]
_022551EA:
	add r4, r2, #0
	add r4, #0xa8
	str r1, [r4]
	add r4, r2, #0
	add r4, #0xac
	str r0, [r4]
	add r4, r2, #0
	add r4, #0xa8
	ldr r4, [r4]
	add r5, r4, r3
	add r4, r2, #0
	add r4, #0xa8
	add r3, r3, #1
	add r2, #8
	str r5, [r4]
	cmp r3, #5
	blt _022551EA
	ldr r0, [sp, #4]
	ldr r2, [sp, #0x38]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #8]
	mov r3, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #4]
	sub r1, r0, #2
	ldr r0, [sp, #8]
	str r1, [sp, #0x1c]
	sub r0, r0, #3
	str r0, [sp, #0x20]
_02255224:
	add r4, r2, #0
	add r4, #0xd0
	str r1, [r4]
	add r4, r2, #0
	add r4, #0xd4
	str r0, [r4]
	add r4, r2, #0
	add r4, #0xd0
	ldr r4, [r4]
	add r5, r4, r3
	add r4, r2, #0
	add r4, #0xd0
	add r3, r3, #1
	add r2, #8
	str r5, [r4]
	cmp r3, #5
	blt _02255224
	ldr r0, [sp, #4]
	mov r6, #0
	sub r0, r0, #4
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	str r6, [sp, #0x10]
	add r4, r0, #4
_02255254:
	ldr r0, [sp, #0xc]
	str r4, [sp, #0x20]
	str r0, [sp, #0x1c]
	sub r2, r0, r6
	ldr r0, [sp, #0x10]
	str r2, [sp, #0x1c]
	lsl r1, r0, #3
	ldr r0, [sp, #0x38]
	mov r3, #0
	add r5, r0, r1
_02255268:
	add r0, r5, #0
	add r0, #0xf8
	str r2, [r0]
	add r0, r5, #0
	add r0, #0xfc
	str r4, [r0]
	add r0, r5, #0
	add r0, #0xfc
	ldr r0, [r0]
	sub r1, r0, r3
	add r0, r5, #0
	add r0, #0xfc
	add r3, r3, #1
	add r5, #8
	str r1, [r0]
	cmp r3, #7
	blt _02255268
	ldr r0, [sp, #0x10]
	add r6, r6, #1
	add r0, r0, #7
	str r0, [sp, #0x10]
	cmp r6, #2
	blt _02255254
	ldr r0, [sp, #0x38]
	mov r4, #0
	ldrb r3, [r0, #4]
	cmp r3, #0
	ble _022552D4
	ldr r0, [sp, #4]
	add r2, r0, #3
	ldr r0, [sp, #8]
	str r2, [sp, #0x1c]
	sub r1, r0, #2
	str r1, [sp, #0x20]
	cmp r3, #0
	ble _022552D4
	mov r6, #0x6f
	lsl r6, r6, #2
	ldr r3, [sp, #0x38]
	add r0, r6, #0
_022552B8:
	mov r5, #0x6e
	lsl r5, r5, #2
	str r2, [r3, r5]
	add r5, r5, #4
	str r1, [r3, r5]
	ldr r5, [r3, r6]
	add r5, r5, r4
	str r5, [r3, r0]
	ldr r5, [sp, #0x38]
	add r4, r4, #1
	ldrb r5, [r5, #4]
	add r3, #8
	cmp r4, r5
	blt _022552B8
_022552D4:
	b _02255432
_022552D6:
	ldr r0, [sp, #0x38]
	mov r1, #1
	str r1, [r0]
	mov r1, #4
	strb r1, [r0, #4]
	mov r1, #8
	strb r1, [r0, #5]
	ldr r0, [sp, #4]
	ldr r4, [sp, #0x38]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #8]
	mov r3, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #4]
	add r2, r0, #2
	ldr r0, [sp, #8]
	str r2, [sp, #0x1c]
	sub r1, r0, #2
	str r1, [sp, #0x20]
_022552FC:
	add r0, r1, r3
	str r2, [r4, #0x28]
	str r0, [r4, #0x2c]
	add r3, r3, #1
	add r4, #8
	cmp r3, #8
	blt _022552FC
	ldr r0, [sp, #4]
	ldr r3, [sp, #0x38]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #8]
	mov r4, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #4]
	sub r2, r0, #3
	ldr r0, [sp, #8]
	str r2, [sp, #0x1c]
	sub r1, r0, #2
	str r1, [sp, #0x20]
_02255322:
	add r0, r1, r4
	str r2, [r3, #0x68]
	str r0, [r3, #0x6c]
	add r4, r4, #1
	add r3, #8
	cmp r4, #8
	blt _02255322
	ldr r0, [sp, #4]
	ldr r2, [sp, #0x38]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #8]
	mov r3, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #4]
	sub r1, r0, #2
	ldr r0, [sp, #8]
	str r1, [sp, #0x1c]
	add r0, r0, #6
	str r0, [sp, #0x20]
_02255348:
	add r4, r2, #0
	add r4, #0xa8
	str r1, [r4]
	add r4, r2, #0
	add r4, #0xac
	str r0, [r4]
	add r4, r2, #0
	add r4, #0xa8
	ldr r4, [r4]
	add r5, r4, r3
	add r4, r2, #0
	add r4, #0xa8
	add r3, r3, #1
	add r2, #8
	str r5, [r4]
	cmp r3, #4
	blt _02255348
	ldr r0, [sp, #4]
	ldr r2, [sp, #0x38]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #8]
	mov r3, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #4]
	sub r1, r0, #2
	ldr r0, [sp, #8]
	str r1, [sp, #0x1c]
	sub r0, r0, #3
	str r0, [sp, #0x20]
_02255382:
	add r4, r2, #0
	add r4, #0xd0
	str r1, [r4]
	add r4, r2, #0
	add r4, #0xd4
	str r0, [r4]
	add r4, r2, #0
	add r4, #0xd0
	ldr r4, [r4]
	add r5, r4, r3
	add r4, r2, #0
	add r4, #0xd0
	add r3, r3, #1
	add r2, #8
	str r5, [r4]
	cmp r3, #4
	blt _02255382
	ldr r0, [sp, #4]
	mov r6, #0
	sub r0, r0, #4
	str r0, [sp, #0x14]
	ldr r0, [sp, #8]
	str r6, [sp, #0x18]
	add r4, r0, #5
_022553B2:
	ldr r0, [sp, #0x14]
	str r4, [sp, #0x20]
	str r0, [sp, #0x1c]
	sub r2, r0, r6
	ldr r0, [sp, #0x18]
	str r2, [sp, #0x1c]
	lsl r1, r0, #3
	ldr r0, [sp, #0x38]
	mov r3, #0
	add r5, r0, r1
_022553C6:
	add r0, r5, #0
	add r0, #0xf8
	str r2, [r0]
	add r0, r5, #0
	add r0, #0xfc
	str r4, [r0]
	add r0, r5, #0
	add r0, #0xfc
	ldr r0, [r0]
	sub r1, r0, r3
	add r0, r5, #0
	add r0, #0xfc
	add r3, r3, #1
	add r5, #8
	str r1, [r0]
	cmp r3, #8
	blt _022553C6
	ldr r0, [sp, #0x18]
	add r6, r6, #1
	add r0, #8
	str r0, [sp, #0x18]
	cmp r6, #3
	blt _022553B2
	ldr r0, [sp, #0x38]
	mov r4, #0
	ldrb r3, [r0, #4]
	cmp r3, #0
	ble _02255432
	ldr r0, [sp, #4]
	add r2, r0, #3
	ldr r0, [sp, #8]
	str r2, [sp, #0x1c]
	sub r1, r0, #2
	str r1, [sp, #0x20]
	cmp r3, #0
	ble _02255432
	mov r6, #0x6f
	lsl r6, r6, #2
	ldr r3, [sp, #0x38]
	add r0, r6, #0
_02255416:
	mov r5, #0x6e
	lsl r5, r5, #2
	str r2, [r3, r5]
	add r5, r5, #4
	str r1, [r3, r5]
	ldr r5, [r3, r6]
	add r5, r5, r4
	str r5, [r3, r0]
	ldr r5, [sp, #0x38]
	add r4, r4, #1
	ldrb r5, [r5, #4]
	add r3, #8
	cmp r4, r5
	blt _02255416
_02255432:
	ldr r0, [sp, #8]
	mov r6, #0x1e
	sub r2, r0, #1
	mov r1, #0
	lsl r6, r6, #4
	str r7, [sp, #0x1c]
	str r2, [sp, #0x20]
	mov ip, r1
	add r4, r6, #4
_02255444:
	ldr r3, [sp, #0x38]
	lsl r5, r1, #3
	mov r0, #0
	add r5, r3, r5
_0225544C:
	add r3, r7, r0
	str r3, [r5, r6]
	str r2, [r5, r4]
	add r0, r0, #1
	add r5, #8
	cmp r0, #3
	blt _0225544C
	mov r0, ip
	add r0, r0, #1
	add r1, r1, #3
	add r2, r2, #1
	mov ip, r0
	cmp r0, #6
	blt _02255444
	ldr r1, [sp]
	ldr r0, [sp, #0x38]
	ldr r3, [sp, #0x38]
	strb r1, [r0, #6]
	ldr r0, [sp]
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	bl ov04_022554FC
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov04_02255140

	thumb_func_start ov04_02255480
ov04_02255480: ; 0x02255480
	push {r4, r5}
	ldr r4, [r3]
	ldr r3, [r3, #4]
	ldr r5, [sp, #8]
	sub r4, r4, r1
	sub r3, r3, r2
	cmp r0, #1
	beq _0225549C
	cmp r0, #2
	beq _022554A4
	cmp r0, #3
	beq _022554AE
	pop {r4, r5}
	bx lr
_0225549C:
	neg r0, r3
	str r0, [r5]
	str r4, [r5, #4]
	b _022554B4
_022554A4:
	neg r0, r4
	str r0, [r5]
	neg r0, r3
	str r0, [r5, #4]
	b _022554B4
_022554AE:
	str r3, [r5]
	neg r0, r4
	str r0, [r5, #4]
_022554B4:
	ldr r0, [r5]
	add r0, r0, r1
	str r0, [r5]
	ldr r0, [r5, #4]
	add r0, r0, r2
	str r0, [r5, #4]
	pop {r4, r5}
	bx lr
	thumb_func_end ov04_02255480

	thumb_func_start ov04_022554C4
ov04_022554C4: ; 0x022554C4
	push {r3, r4}
	mov r4, #0
	cmp r1, #0
	ble _022554DA
_022554CC:
	ldr r3, [r2]
	add r4, r4, #1
	add r3, r3, r0
	str r3, [r2]
	add r2, #8
	cmp r4, r1
	blt _022554CC
_022554DA:
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov04_022554C4

	thumb_func_start ov04_022554E0
ov04_022554E0: ; 0x022554E0
	push {r3, r4}
	mov r4, #0
	cmp r1, #0
	ble _022554F6
_022554E8:
	ldr r3, [r2, #4]
	add r4, r4, #1
	add r3, r3, r0
	str r3, [r2, #4]
	add r2, #8
	cmp r4, r1
	blt _022554E8
_022554F6:
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov04_022554E0

	thumb_func_start ov04_022554FC
ov04_022554FC: ; 0x022554FC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	add r5, r0, #0
	ldr r0, [r3]
	add r4, r1, #0
	add r6, r2, #0
	str r3, [sp, #4]
	cmp r0, #0
	bne _0225551C
	mov r0, #0xe
	str r0, [sp, #0x44]
	mov r0, #5
	str r0, [sp, #0x20]
	mov r0, #7
	str r0, [sp, #0x24]
	b _02255528
_0225551C:
	mov r0, #0x18
	str r0, [sp, #0x44]
	mov r0, #4
	str r0, [sp, #0x20]
	mov r0, #8
	str r0, [sp, #0x24]
_02255528:
	ldr r3, [sp, #4]
	add r0, r5, #0
	add r3, #0x10
	add r1, r4, #0
	add r2, r6, #0
	str r3, [sp]
	bl ov04_02255480
	ldr r3, [sp, #4]
	add r0, r5, #0
	add r3, #0x18
	add r1, r4, #0
	add r2, r6, #0
	str r3, [sp]
	bl ov04_02255480
	mov r0, #0
	str r0, [sp, #0x48]
	ldr r0, [sp, #0x24]
	cmp r0, #0
	ble _0225557A
	ldr r7, [sp, #4]
	add r7, #0x28
	str r7, [sp, #0x28]
_02255558:
	ldr r3, [sp, #0x28]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	str r7, [sp]
	bl ov04_02255480
	ldr r0, [sp, #0x28]
	add r7, #8
	add r0, #8
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x48]
	add r1, r0, #1
	ldr r0, [sp, #0x24]
	str r1, [sp, #0x48]
	cmp r1, r0
	blt _02255558
_0225557A:
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x24]
	cmp r0, #0
	ble _022555AC
	ldr r7, [sp, #4]
	add r7, #0x68
	str r7, [sp, #0x2c]
_0225558A:
	ldr r3, [sp, #0x2c]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	str r7, [sp]
	bl ov04_02255480
	ldr r0, [sp, #0x2c]
	add r7, #8
	add r0, #8
	str r0, [sp, #0x2c]
	ldr r0, [sp, #8]
	add r1, r0, #1
	ldr r0, [sp, #0x24]
	str r1, [sp, #8]
	cmp r1, r0
	blt _0225558A
_022555AC:
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x20]
	cmp r0, #0
	ble _022555DE
	ldr r7, [sp, #4]
	add r7, #0xa8
	str r7, [sp, #0x30]
_022555BC:
	ldr r3, [sp, #0x30]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	str r7, [sp]
	bl ov04_02255480
	ldr r0, [sp, #0x30]
	add r7, #8
	add r0, #8
	str r0, [sp, #0x30]
	ldr r0, [sp, #0xc]
	add r1, r0, #1
	ldr r0, [sp, #0x20]
	str r1, [sp, #0xc]
	cmp r1, r0
	blt _022555BC
_022555DE:
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x20]
	cmp r0, #0
	ble _02255610
	ldr r7, [sp, #4]
	add r7, #0xd0
	str r7, [sp, #0x34]
_022555EE:
	ldr r3, [sp, #0x34]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	str r7, [sp]
	bl ov04_02255480
	ldr r0, [sp, #0x34]
	add r7, #8
	add r0, #8
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x10]
	add r1, r0, #1
	ldr r0, [sp, #0x20]
	str r1, [sp, #0x10]
	cmp r1, r0
	blt _022555EE
_02255610:
	mov r0, #0
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x44]
	cmp r0, #0
	ble _02255642
	ldr r7, [sp, #4]
	add r7, #0xf8
	str r7, [sp, #0x38]
_02255620:
	ldr r3, [sp, #0x38]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	str r7, [sp]
	bl ov04_02255480
	ldr r0, [sp, #0x38]
	add r7, #8
	add r0, #8
	str r0, [sp, #0x38]
	ldr r0, [sp, #0x14]
	add r1, r0, #1
	ldr r0, [sp, #0x44]
	str r1, [sp, #0x14]
	cmp r1, r0
	blt _02255620
_02255642:
	mov r0, #0
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x20]
	cmp r0, #0
	ble _02255678
	mov r1, #0x6e
	ldr r0, [sp, #4]
	lsl r1, r1, #2
	add r7, r0, r1
	str r7, [sp, #0x3c]
_02255656:
	ldr r3, [sp, #0x3c]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	str r7, [sp]
	bl ov04_02255480
	ldr r0, [sp, #0x3c]
	add r7, #8
	add r0, #8
	str r0, [sp, #0x3c]
	ldr r0, [sp, #0x18]
	add r1, r0, #1
	ldr r0, [sp, #0x20]
	str r1, [sp, #0x18]
	cmp r1, r0
	blt _02255656
_02255678:
	mov r0, #0
	str r0, [sp, #0x1c]
	mov r1, #0x1e
	ldr r0, [sp, #4]
	lsl r1, r1, #4
	add r7, r0, r1
	str r7, [sp, #0x40]
_02255686:
	ldr r3, [sp, #0x40]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	str r7, [sp]
	bl ov04_02255480
	ldr r0, [sp, #0x40]
	add r7, #8
	add r0, #8
	str r0, [sp, #0x40]
	ldr r0, [sp, #0x1c]
	add r0, r0, #1
	str r0, [sp, #0x1c]
	cmp r0, #0x12
	blt _02255686
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov04_022554FC

	thumb_func_start ov04_022556AC
ov04_022556AC: ; 0x022556AC
	push {r4, r5, r6, r7}
	mov r6, #0x27
	mov r4, #0
	lsl r6, r6, #4
_022556B4:
	add r5, r4, #0
	mul r5, r6
	add r5, r0, r5
	ldr r7, [r5, #0xc]
	cmp r1, r7
	bne _022556CE
	ldr r7, [r5, #0x10]
	cmp r2, r7
	bne _022556CE
	strb r4, [r3]
	mov r0, #1
	pop {r4, r5, r6, r7}
	bx lr
_022556CE:
	ldr r7, [r5, #0x14]
	cmp r1, r7
	bne _022556E2
	ldr r7, [r5, #0x18]
	cmp r2, r7
	bne _022556E2
	strb r4, [r3]
	mov r0, #2
	pop {r4, r5, r6, r7}
	bx lr
_022556E2:
	ldr r7, [r5, #0x1c]
	cmp r1, r7
	bne _022556F6
	ldr r5, [r5, #0x20]
	cmp r2, r5
	bne _022556F6
	strb r4, [r3]
	mov r0, #3
	pop {r4, r5, r6, r7}
	bx lr
_022556F6:
	add r4, r4, #1
	lsl r4, r4, #0x18
	lsr r4, r4, #0x18
	cmp r4, #3
	blo _022556B4
	mov r0, #0
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end ov04_022556AC

	thumb_func_start ov04_02255708
ov04_02255708: ; 0x02255708
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r3, sp, #0
	add r5, r0, #0
	bl ov04_022556AC
	add r6, r0, #0
	bne _0225571E
	add sp, #4
	mov r0, #0
	pop {r3, r4, r5, r6, pc}
_0225571E:
	mov r0, #0xb
	mov r1, #0x74
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	ldr r0, [r5]
	add r2, r4, #0
	str r0, [r4, #0x70]
	mov r1, #0
	add r2, #0x4c
	str r1, [r4]
	add r0, sp, #0
	ldrb r3, [r0]
	cmp r6, #1
	strb r3, [r2]
	str r6, [r4, #0x50]
	beq _0225574A
	cmp r6, #2
	beq _02255762
	cmp r6, #3
	beq _022557AA
	b _022557F2
_0225574A:
	mov r0, #8
	str r0, [r4]
	ldr r0, _022557F8 ; =SEQ_SE_GS_GONDORA_IDOU
	bl PlaySE
	ldr r0, [r5]
	ldr r1, _022557FC ; =ov04_02255AC4
	add r2, r4, #0
	bl FieldSys_CreateTask
	mov r1, #1
	b _022557F2
_02255762:
	add r2, r4, #0
	str r1, [r4]
	add r2, #0x4d
	strb r1, [r2]
	ldrb r2, [r0]
	mov r3, #0x27
	lsl r3, r3, #4
	add r6, r2, #0
	mul r6, r3
	add r2, r5, r6
	ldrb r6, [r2, #8]
	add r2, r4, #0
	add r2, #0x4e
	strb r6, [r2]
	ldrb r0, [r0]
	add r2, r0, #0
	mul r2, r3
	add r0, r5, r2
	ldrb r0, [r0, #0xa]
	bl ov04_022558B4
	add r1, r4, #0
	add r1, #0x58
	str r0, [r4, #0x54]
	bl ov04_022558D0
	ldr r0, _022557F8 ; =SEQ_SE_GS_GONDORA_IDOU
	bl PlaySE
	ldr r0, [r5]
	ldr r1, _02255800 ; =ov04_022559C8
	add r2, r4, #0
	bl FieldSys_CreateTask
	mov r1, #1
	b _022557F2
_022557AA:
	add r2, r4, #0
	str r1, [r4]
	add r2, #0x4d
	strb r1, [r2]
	ldrb r1, [r0]
	mov r2, #0x27
	lsl r2, r2, #4
	add r3, r1, #0
	mul r3, r2
	add r1, r5, r3
	ldrb r3, [r1, #8]
	add r1, r4, #0
	add r1, #0x4e
	strb r3, [r1]
	ldrb r0, [r0]
	add r1, r0, #0
	mul r1, r2
	add r0, r5, r1
	ldrb r0, [r0, #0xa]
	mov r1, #1
	bl ov04_022558B4
	add r1, r4, #0
	add r1, #0x58
	str r0, [r4, #0x54]
	bl ov04_022558D0
	ldr r0, _022557F8 ; =SEQ_SE_GS_GONDORA_IDOU
	bl PlaySE
	ldr r0, [r5]
	ldr r1, _02255800 ; =ov04_022559C8
	add r2, r4, #0
	bl FieldSys_CreateTask
	mov r1, #1
_022557F2:
	add r0, r1, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_022557F8: .word SEQ_SE_GS_GONDORA_IDOU
_022557FC: .word ov04_02255AC4
_02255800: .word ov04_022559C8
	thumb_func_end ov04_02255708

	thumb_func_start ov04_02255804
ov04_02255804: ; 0x02255804
	push {r4, r5}
	ldr r2, [r1, #0x50]
	cmp r2, #2
	beq _02255814
	cmp r2, #3
	beq _02255836
	pop {r4, r5}
	bx lr
_02255814:
	ldrb r2, [r0, #5]
	mov r4, #0
	cmp r2, #0
	ble _02255854
	add r5, r0, #0
_0225581E:
	ldr r3, [r5, #0x28]
	ldr r2, [r5, #0x2c]
	add r4, r4, #1
	str r3, [r1, #4]
	str r2, [r1, #8]
	ldrb r2, [r0, #5]
	add r5, #8
	add r1, #8
	cmp r4, r2
	blt _0225581E
	pop {r4, r5}
	bx lr
_02255836:
	ldrb r2, [r0, #5]
	mov r5, #0
	cmp r2, #0
	ble _02255854
	add r4, r0, #0
_02255840:
	ldr r3, [r4, #0x68]
	ldr r2, [r4, #0x6c]
	add r5, r5, #1
	str r3, [r1, #4]
	str r2, [r1, #8]
	ldrb r2, [r0, #5]
	add r4, #8
	add r1, #8
	cmp r5, r2
	blt _02255840
_02255854:
	pop {r4, r5}
	bx lr
	thumb_func_end ov04_02255804

	thumb_func_start ov04_02255858
ov04_02255858: ; 0x02255858
	push {r3, lr}
	add r2, r1, #0
	add r3, r0, #0
	ldr r0, [r2, #0x54]
	cmp r0, #3
	bhi _022558B2
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02255870: ; jump table
	.short _02255878 - _02255870 - 2 ; case 0
	.short _02255886 - _02255870 - 2 ; case 1
	.short _02255894 - _02255870 - 2 ; case 2
	.short _022558A4 - _02255870 - 2 ; case 3
_02255878:
	lsl r1, r3, #0x18
	mov r0, #1
	lsr r1, r1, #0x18
	add r2, r2, #4
	bl ov04_022554C4
	pop {r3, pc}
_02255886:
	lsl r1, r3, #0x18
	mov r0, #1
	lsr r1, r1, #0x18
	add r2, r2, #4
	bl ov04_022554E0
	pop {r3, pc}
_02255894:
	mov r0, #0
	lsl r1, r3, #0x18
	mvn r0, r0
	lsr r1, r1, #0x18
	add r2, r2, #4
	bl ov04_022554C4
	pop {r3, pc}
_022558A4:
	mov r0, #0
	lsl r1, r3, #0x18
	mvn r0, r0
	lsr r1, r1, #0x18
	add r2, r2, #4
	bl ov04_022554E0
_022558B2:
	pop {r3, pc}
	thumb_func_end ov04_02255858

	thumb_func_start ov04_022558B4
ov04_022558B4: ; 0x022558B4
	cmp r1, #0
	bne _022558BC
	mov r1, #0
	b _022558BE
_022558BC:
	mov r1, #2
_022558BE:
	add r0, r1, r0
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1e
	sub r1, r1, r2
	mov r0, #0x1e
	ror r1, r0
	add r0, r2, r1
	bx lr
	.balign 4, 0
	thumb_func_end ov04_022558B4

	thumb_func_start ov04_022558D0
ov04_022558D0: ; 0x022558D0
	mov r2, #0
	str r2, [r1]
	str r2, [r1, #4]
	str r2, [r1, #8]
	cmp r0, #3
	bhi _0225590A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022558E8: ; jump table
	.short _022558F0 - _022558E8 - 2 ; case 0
	.short _022558F8 - _022558E8 - 2 ; case 1
	.short _02255900 - _022558E8 - 2 ; case 2
	.short _02255906 - _022558E8 - 2 ; case 3
_022558F0:
	mov r0, #2
	lsl r0, r0, #0xe
	str r0, [r1]
	bx lr
_022558F8:
	mov r0, #2
	lsl r0, r0, #0xe
	str r0, [r1, #8]
	bx lr
_02255900:
	ldr r0, _0225590C ; =0xFFFF8000
	str r0, [r1]
	bx lr
_02255906:
	ldr r0, _0225590C ; =0xFFFF8000
	str r0, [r1, #8]
_0225590A:
	bx lr
	.balign 4, 0
_0225590C: .word 0xFFFF8000
	thumb_func_end ov04_022558D0

	thumb_func_start ov04_02255910
ov04_02255910: ; 0x02255910
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0xff
	add r7, r1, #0
	add r4, r2, #0
	mov r6, #0
	str r0, [sp]
	cmp r7, #0
	ble _0225595A
_02255922:
	ldr r1, [r4]
	ldr r2, [r4, #4]
	add r0, r5, #0
	bl sub_020548C0
	cmp r0, #0
	beq _02255938
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	b _0225595A
_02255938:
	ldr r1, [r4]
	ldr r2, [r4, #4]
	add r0, r5, #0
	bl GetMetatileBehaviorAt
	bl sub_0205BAC4
	cmp r0, #0
	bne _02255952
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	b _0225595A
_02255952:
	add r6, r6, #1
	add r4, #8
	cmp r6, r7
	blt _02255922
_0225595A:
	ldr r0, [sp]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov04_02255910

	thumb_func_start ov04_02255960
ov04_02255960: ; 0x02255960
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	mov r0, #1
	lsl r0, r0, #0xe
	add r7, r1, #0
	add r5, r2, #0
	mov r4, #0
	str r3, [sp]
	str r0, [sp, #4]
	cmp r7, #0
	ble _022559C0
_02255978:
	ldr r1, [r5]
	ldr r2, [r5, #4]
	add r0, r6, #0
	bl sub_020548C0
	cmp r0, #0
	bne _0225599E
	ldr r1, [r5]
	ldr r2, [r5, #4]
	add r0, r6, #0
	bl GetMetatileBehaviorAt
	bl sub_0205BAC4
	cmp r0, #0
	bne _0225599C
	mov r0, #1
	b _0225599E
_0225599C:
	mov r0, #0
_0225599E:
	cmp r0, #0
	beq _022559B8
	ldr r0, [sp]
	ldrb r0, [r0, r4]
	lsl r1, r0, #8
	mov r0, #1
	lsl r0, r0, #0xe
	cmp r1, r0
	bge _022559B8
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #4]
	b _022559C0
_022559B8:
	add r4, r4, #1
	add r5, #8
	cmp r4, r7
	blt _02255978
_022559C0:
	ldr r0, [sp, #4]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov04_02255960

	thumb_func_start ov04_022559C8
ov04_022559C8: ; 0x022559C8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r4, r0, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r0, [r6, #4]
	ldr r5, [r0, #0x24]
	ldr r0, [r4]
	cmp r0, #0
	beq _022559F0
	cmp r0, #3
	beq _02255A16
	cmp r0, #7
	beq _02255AA2
	b _02255AB6
_022559F0:
	add r0, r4, #0
	add r0, #0x4c
	ldrb r1, [r0]
	mov r0, #0x27
	lsl r0, r0, #4
	mul r0, r1
	add r2, r5, #4
	add r0, r2, r0
	add r1, r4, #0
	bl ov04_02255804
	ldr r0, _02255ABC ; =ov04_02255D88
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	mov r0, #1
	str r0, [r4]
	b _02255AB6
_02255A16:
	add r1, r4, #0
	add r1, #0x4c
	ldrb r2, [r1]
	mov r1, #0x27
	lsl r1, r1, #4
	mul r1, r2
	add r0, r6, #0
	add r1, r5, r1
	add r0, #0x9c
	ldrb r1, [r1, #0xb]
	ldr r0, [r0]
	bl ov01_021F3B44
	add r1, r0, #0
	add r0, sp, #8
	bl ov01_021F3B0C
	ldr r1, [sp, #8]
	asr r0, r1, #0xf
	lsr r0, r0, #0x10
	add r0, r1, r0
	asr r0, r0, #0x10
	ldr r1, [sp, #0x10]
	str r0, [sp, #4]
	asr r0, r1, #0xf
	lsr r0, r0, #0x10
	add r0, r1, r0
	add r1, r4, #0
	add r1, #0x4c
	ldrb r2, [r1]
	mov r1, #0x27
	lsl r1, r1, #4
	asr r7, r0, #0x10
	add r0, r5, #4
	mul r1, r2
	add r5, r0, r1
	add r0, r6, #0
	bl Fsys_GetSaveDataPtr
	bl Sav2_GetGymmickPtr
	mov r1, #6
	bl SavGymmick_AssertMagic_GetData
	ldr r1, [sp, #4]
	lsl r1, r1, #0x10
	lsr r2, r1, #0x10
	add r1, r4, #0
	add r1, #0x4c
	ldrb r1, [r1]
	lsl r1, r1, #1
	strh r2, [r0, r1]
	lsl r1, r7, #0x10
	lsr r3, r1, #0x10
	add r1, r4, #0
	add r1, #0x4c
	ldrb r1, [r1]
	lsl r1, r1, #1
	add r0, r0, r1
	strh r3, [r0, #6]
	add r0, r4, #0
	str r5, [sp]
	add r0, #0x4c
	ldrb r0, [r0]
	ldrb r1, [r5, #6]
	bl ov04_02255140
	mov r0, #7
	str r0, [r4]
	b _02255AB6
_02255AA2:
	ldr r0, _02255AC0 ; =SEQ_SE_GS_GONDORA_IDOU
	mov r1, #0
	bl StopSE
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x14
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02255AB6:
	mov r0, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02255ABC: .word ov04_02255D88
_02255AC0: .word SEQ_SE_GS_GONDORA_IDOU
	thumb_func_end ov04_022559C8

	thumb_func_start ov04_02255AC4
ov04_02255AC4: ; 0x02255AC4
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r0, [r5, #4]
	ldr r6, [r0, #0x24]
	ldr r0, [r4]
	sub r0, #8
	cmp r0, #4
	bhi _02255BA4
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02255AEE: ; jump table
	.short _02255AF8 - _02255AEE - 2 ; case 0
	.short _02255B64 - _02255AEE - 2 ; case 1
	.short _02255C26 - _02255AEE - 2 ; case 2
	.short _02255C64 - _02255AEE - 2 ; case 3
	.short _02255C9E - _02255AEE - 2 ; case 4
_02255AF8:
	add r0, r4, #0
	add r0, #0x4c
	ldrb r3, [r0]
	mov r0, #0x27
	lsl r0, r0, #4
	add r1, r3, #0
	mul r1, r0
	add r0, r4, #0
	add r2, r6, #4
	add r1, r2, r1
	mov r3, #0
	add r0, #0x4f
	strb r3, [r0]
	add r0, r5, #0
	add r2, sp, #0
	bl ov04_02255CBC
	cmp r0, #2
	bne _02255B24
	mov r0, #9
	str r0, [r4]
	b _02255CB0
_02255B24:
	cmp r0, #1
	bne _02255B5E
	add r1, r4, #0
	add r1, #0x4c
	ldrb r2, [r1]
	mov r1, #0x27
	lsl r1, r1, #4
	mul r1, r2
	add r1, r6, r1
	add r5, #0x9c
	ldrb r1, [r1, #0xb]
	ldr r0, [r5]
	bl ov01_021F3B44
	bl ov01_021F3B08
	add r1, sp, #0
	ldrh r1, [r1]
	str r1, [r4, #0x68]
	ldr r0, [r0, #4]
	str r0, [r4, #0x6c]
	mov r0, #0
	str r0, [r4, #0x64]
	mov r0, #0xa
	str r0, [r4]
	ldr r0, _02255CB4 ; =SEQ_SE_GS_GONDORA_KABEHIT
	bl PlaySE
	b _02255CB0
_02255B5E:
	mov r0, #0xc
	str r0, [r4]
	b _02255CB0
_02255B64:
	add r1, r4, #0
	add r1, #0x4c
	ldrb r2, [r1]
	mov r1, #0x27
	lsl r1, r1, #4
	mul r1, r2
	add r0, r5, #0
	add r1, r6, r1
	add r0, #0x9c
	ldrb r1, [r1, #0xb]
	ldr r0, [r0]
	bl ov01_021F3B44
	bl ov01_021F3B08
	mov r1, #1
	ldr r2, [r0, #4]
	lsl r1, r1, #0xa
	sub r1, r2, r1
	str r1, [r0, #4]
	add r0, r4, #0
	add r0, #0x4f
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x4f
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x4f
	ldrb r0, [r0]
	cmp r0, #0x10
	bhs _02255BA6
_02255BA4:
	b _02255CB0
_02255BA6:
	add r0, r4, #0
	add r0, #0x4c
	ldrb r1, [r0]
	mov r0, #0x27
	lsl r0, r0, #4
	mul r0, r1
	add r2, r6, #4
	add r7, r2, r0
	add r0, r4, #0
	mov r1, #0
	add r0, #0x4f
	strb r1, [r0]
	add r0, r5, #0
	bl Fsys_GetSaveDataPtr
	bl Sav2_GetGymmickPtr
	mov r1, #6
	bl SavGymmick_AssertMagic_GetData
	add r3, r0, #0
	mov ip, r0
	add r0, r4, #0
	add r0, #0x4c
	ldrb r2, [r0]
	add r3, #0xc
	ldrb r0, [r3, r2]
	add r0, r0, #1
	lsr r1, r0, #0x1f
	lsl r6, r0, #0x1e
	sub r6, r6, r1
	mov r0, #0x1e
	ror r6, r0
	add r0, r1, r6
	strb r0, [r3, r2]
	add r0, r4, #0
	add r0, #0x4c
	ldrb r1, [r0]
	mov r0, ip
	add r0, r0, r1
	ldrb r0, [r0, #0xc]
	strb r0, [r7, #6]
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	add r6, r0, #0
	bl MapObject_GetCurrentX
	add r5, r0, #0
	add r0, r6, #0
	bl MapObject_GetCurrentY
	add r2, r0, #0
	lsl r1, r5, #0x10
	lsl r2, r2, #0x10
	mov r0, #1
	lsr r1, r1, #0x10
	lsr r2, r2, #0x10
	add r3, r7, #0
	bl ov04_022554FC
	mov r0, #0xc
	str r0, [r4]
	b _02255CB0
_02255C26:
	add r1, r4, #0
	add r1, #0x4c
	ldrb r2, [r1]
	mov r1, #0x27
	lsl r1, r1, #4
	mul r1, r2
	add r1, r6, r1
	add r5, #0x9c
	ldrb r1, [r1, #0xb]
	ldr r0, [r5]
	bl ov01_021F3B44
	bl ov01_021F3B08
	mov r1, #1
	ldr r2, [r0, #4]
	lsl r1, r1, #0xa
	sub r2, r2, r1
	str r2, [r0, #4]
	ldr r2, [r4, #0x64]
	add r1, r2, r1
	str r1, [r4, #0x64]
	ldr r2, [r4, #0x68]
	cmp r1, r2
	blt _02255CB0
	ldr r1, [r4, #0x6c]
	sub r1, r1, r2
	str r1, [r0, #4]
	mov r0, #0xb
	str r0, [r4]
	b _02255CB0
_02255C64:
	add r1, r4, #0
	add r1, #0x4c
	ldrb r2, [r1]
	mov r1, #0x27
	lsl r1, r1, #4
	mul r1, r2
	add r1, r6, r1
	add r5, #0x9c
	ldrb r1, [r1, #0xb]
	ldr r0, [r5]
	bl ov01_021F3B44
	bl ov01_021F3B08
	mov r1, #1
	ldr r2, [r0, #4]
	lsl r1, r1, #0xa
	add r2, r2, r1
	str r2, [r0, #4]
	ldr r2, [r4, #0x64]
	sub r1, r2, r1
	str r1, [r4, #0x64]
	cmp r1, #0
	bgt _02255CB0
	ldr r1, [r4, #0x6c]
	str r1, [r0, #4]
	mov r0, #0xc
	str r0, [r4]
	b _02255CB0
_02255C9E:
	ldr r0, _02255CB8 ; =SEQ_SE_GS_GONDORA_IDOU
	mov r1, #0
	bl StopSE
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02255CB0:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02255CB4: .word SEQ_SE_GS_GONDORA_KABEHIT
_02255CB8: .word SEQ_SE_GS_GONDORA_IDOU
	thumb_func_end ov04_02255AC4

	thumb_func_start ov04_02255CBC
ov04_02255CBC: ; 0x02255CBC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	ldrb r1, [r4, #4]
	add r6, r2, #0
	add r5, r0, #0
	sub r2, r1, #1
	lsl r2, r2, #0x18
	lsr r7, r2, #0x18
	add r2, r4, #0
	add r2, #0xa8
	bl ov04_02255910
	cmp r0, #0xff
	beq _02255CDC
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02255CDC:
	ldrb r1, [r4, #4]
	add r2, r4, #0
	add r0, r5, #0
	add r2, #0xd0
	bl ov04_02255910
	cmp r0, #0xff
	beq _02255CF0
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02255CF0:
	ldrb r1, [r4, #5]
	add r2, r4, #0
	add r0, r5, #0
	add r2, #0x68
	bl ov04_02255910
	cmp r0, #0xff
	beq _02255D04
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02255D04:
	add r2, r4, #0
	add r0, r5, #0
	add r1, r7, #0
	add r2, #0x28
	bl ov04_02255910
	cmp r0, #0xff
	beq _02255D18
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02255D18:
	add r0, r5, #0
	add r1, r4, #0
	bl ov04_02255D34
	mov r1, #1
	lsl r1, r1, #0xe
	cmp r0, r1
	bhs _02255D2E
	strh r0, [r6]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02255D2E:
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov04_02255CBC

	thumb_func_start ov04_02255D34
ov04_02255D34: ; 0x02255D34
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	ldr r0, [r5]
	cmp r0, #0
	bne _02255D48
	mov r1, #0xe
	ldr r3, _02255D78 ; =ov04_02257638
	ldr r4, _02255D7C ; =ov04_02257618
	b _02255D4E
_02255D48:
	ldr r3, _02255D80 ; =ov04_02257648
	ldr r4, _02255D84 ; =ov04_02257614
	mov r1, #0x18
_02255D4E:
	ldrb r0, [r5, #4]
	add r2, r5, #0
	add r2, #0xf8
	str r0, [sp]
	add r0, r7, #0
	bl ov04_02255960
	mov r2, #0x6e
	lsl r2, r2, #2
	add r6, r0, #0
	ldr r1, [sp]
	add r0, r7, #0
	add r2, r5, r2
	add r3, r4, #0
	bl ov04_02255960
	cmp r6, r0
	bhi _02255D74
	add r0, r6, #0
_02255D74:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02255D78: .word ov04_02257638
_02255D7C: .word ov04_02257618
_02255D80: .word ov04_02257648
_02255D84: .word ov04_02257614
	thumb_func_end ov04_02255D34

	thumb_func_start ov04_02255D88
ov04_02255D88: ; 0x02255D88
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	add r4, r1, #0
	ldr r6, [r4, #0x70]
	add r7, r0, #0
	ldr r1, [r6, #4]
	ldr r5, [r1, #0x24]
	ldr r1, [r4]
	cmp r1, #6
	bhi _02255E5C
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02255DA8: ; jump table
	.short _02255FB8 - _02255DA8 - 2 ; case 0
	.short _02255DB6 - _02255DA8 - 2 ; case 1
	.short _02255DEA - _02255DA8 - 2 ; case 2
	.short _02255FB8 - _02255DA8 - 2 ; case 3
	.short _02255EDE - _02255DA8 - 2 ; case 4
	.short _02255EEC - _02255DA8 - 2 ; case 5
	.short _02255F1C - _02255DA8 - 2 ; case 6
_02255DB6:
	add r0, r4, #0
	mov r1, #0
	add r0, #0x4f
	strb r1, [r0]
	add r1, r4, #0
	add r1, #0x4c
	ldrb r2, [r1]
	mov r1, #0x27
	lsl r1, r1, #4
	mul r1, r2
	add r1, r5, r1
	ldrb r1, [r1, #9]
	add r0, r6, #0
	add r2, r4, #4
	bl ov04_02255910
	cmp r0, #0xff
	bne _02255DE2
	mov r0, #2
	add sp, #0x40
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02255DE2:
	mov r0, #4
	add sp, #0x40
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02255DEA:
	add r1, r4, #0
	add r1, #0x4c
	ldrb r2, [r1]
	mov r1, #0x27
	lsl r1, r1, #4
	mul r1, r2
	add r0, r6, #0
	add r1, r5, r1
	add r0, #0x9c
	ldrb r1, [r1, #0xb]
	ldr r0, [r0]
	bl ov01_021F3B44
	str r0, [sp]
	ldr r1, [sp]
	add r0, sp, #0x34
	bl ov01_021F3B0C
	add r0, sp, #0x34
	add r1, r4, #0
	add r1, #0x58
	add r2, r0, #0
	bl VEC_Add
	ldr r0, [sp]
	add r1, sp, #0x34
	bl ov01_021F3B1C
	ldr r0, [r6, #0x40]
	bl PlayerAvatar_GetMapObject
	add r1, sp, #0x28
	add r6, r0, #0
	bl MapObject_GetPositionVec
	add r0, sp, #0x28
	add r1, r4, #0
	add r1, #0x58
	add r2, r0, #0
	bl VEC_Add
	add r0, r6, #0
	add r1, sp, #0x28
	bl MapObject_SetPositionVec
	add r0, r4, #0
	add r0, #0x4f
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x4f
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x4f
	ldrb r0, [r0]
	cmp r0, #2
	bhs _02255E5E
_02255E5C:
	b _02255FB8
_02255E5E:
	add r0, r4, #0
	mov r1, #0
	add r0, #0x4f
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x4c
	ldrb r1, [r0]
	mov r0, #0x27
	lsl r0, r0, #4
	mul r0, r1
	add r0, r5, r0
	ldrb r0, [r0, #9]
	add r1, r4, #0
	bl ov04_02255858
	add r0, r4, #0
	add r0, #0x4d
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x4d
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x4d
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0x4e
	ldrb r0, [r0]
	cmp r1, r0
	blo _02255ED6
	add r0, r6, #0
	add r1, sp, #0x1c
	bl MapObject_GetPositionVec
	ldr r2, [sp, #0x1c]
	add r0, r6, #0
	asr r1, r2, #0xf
	lsr r1, r1, #0x10
	add r1, r2, r1
	asr r1, r1, #0x10
	bl MapObject_SetCurrentX
	ldr r2, [sp, #0x24]
	add r0, r6, #0
	asr r1, r2, #0xf
	lsr r1, r1, #0x10
	add r1, r2, r1
	asr r1, r1, #0x10
	bl MapObject_SetCurrentY
	add r0, r6, #0
	bl sub_02060F78
	add r0, r7, #0
	bl DestroySysTask
	mov r0, #3
	add sp, #0x40
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02255ED6:
	mov r0, #1
	add sp, #0x40
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02255EDE:
	ldr r0, _02255FBC ; =SEQ_SE_GS_GONDORA_KABEHIT
	bl PlaySE
	mov r0, #5
	add sp, #0x40
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02255EEC:
	add r1, r4, #0
	add r1, #0x4d
	ldrb r1, [r1]
	cmp r1, #0
	bne _02255F02
	bl DestroySysTask
	mov r0, #7
	add sp, #0x40
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02255F02:
	ldr r1, [r4, #0x58]
	mov r0, #0
	mvn r0, r0
	add r2, r1, #0
	mul r2, r0
	str r2, [r4, #0x58]
	ldr r1, [r4, #0x60]
	add sp, #0x40
	mul r0, r1
	str r0, [r4, #0x60]
	mov r0, #6
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02255F1C:
	add r1, r4, #0
	add r1, #0x4c
	ldrb r2, [r1]
	mov r1, #0x27
	lsl r1, r1, #4
	mul r1, r2
	add r0, r6, #0
	add r1, r5, r1
	add r0, #0x9c
	ldrb r1, [r1, #0xb]
	ldr r0, [r0]
	bl ov01_021F3B44
	add r5, r0, #0
	add r0, sp, #0x10
	add r1, r5, #0
	bl ov01_021F3B0C
	add r0, sp, #0x10
	add r1, r4, #0
	add r1, #0x58
	add r2, r0, #0
	bl VEC_Add
	add r0, r5, #0
	add r1, sp, #0x10
	bl ov01_021F3B1C
	ldr r0, [r6, #0x40]
	bl PlayerAvatar_GetMapObject
	add r1, sp, #4
	add r5, r0, #0
	bl MapObject_GetPositionVec
	add r0, sp, #4
	add r1, r4, #0
	add r1, #0x58
	add r2, r0, #0
	bl VEC_Add
	add r0, r5, #0
	add r1, sp, #4
	bl MapObject_SetPositionVec
	add r0, r4, #0
	add r0, #0x4f
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x4f
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x4f
	ldrb r0, [r0]
	cmp r0, #2
	blo _02255FB8
	add r0, r4, #0
	mov r1, #0
	add r0, #0x4f
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x4d
	ldrb r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x4d
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x4d
	ldrb r0, [r0]
	cmp r0, #0
	bne _02255FB8
	add r0, r7, #0
	bl DestroySysTask
	mov r0, #7
	str r0, [r4]
_02255FB8:
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02255FBC: .word SEQ_SE_GS_GONDORA_KABEHIT
	thumb_func_end ov04_02255D88

	thumb_func_start ov04_02255FC0
ov04_02255FC0: ; 0x02255FC0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl Fsys_GetSaveDataPtr
	bl Sav2_GetGymmickPtr
	mov r1, #2
	bl SavGymmick_AssertMagic_GetData
	add r4, r0, #0
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
	ldr r0, [r4]
	cmp r0, #0
	beq _0225603E
	add r0, r5, #0
	bl ov04_02256278
	add r7, r0, #0
	ldr r4, _02256040 ; =0x00000000
	beq _02256026
_02256004:
	ldr r2, [r5, #0x54]
	mov r0, #0xae
	add r1, r4, #0
	bl ov01_021E8B04
	add r6, r0, #0
	mov r1, #1
	bl ov01_021E8B60
	add r0, r6, #0
	bl ov01_021E8B78
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, r7
	blo _02256004
_02256026:
	ldr r2, [r5, #0x54]
	mov r0, #0xaf
	mov r1, #0
	bl ov01_021E8B04
	add r4, r0, #0
	mov r1, #1
	bl ov01_021E8B60
	add r0, r4, #0
	bl ov01_021E8B78
_0225603E:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02256040: .word 0x00000000
	thumb_func_end ov04_02255FC0

	thumb_func_start ov04_02256044
ov04_02256044: ; 0x02256044
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x24]
	bl FreeToHeap
	ldr r0, [r4, #4]
	mov r1, #0
	str r1, [r0, #0x24]
	pop {r4, pc}
	thumb_func_end ov04_02256044

	thumb_func_start ov04_02256058
ov04_02256058: ; 0x02256058
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl Fsys_GetSaveDataPtr
	bl Sav2_GetGymmickPtr
	add r4, r0, #0
	bl SavGymmick_GetType
	cmp r0, #2
	beq _02256072
	mov r0, #0
	pop {r3, r4, r5, pc}
_02256072:
	add r0, r4, #0
	mov r1, #2
	bl SavGymmick_AssertMagic_GetData
	ldr r1, [r5, #4]
	ldr r1, [r1, #0x24]
	cmp r1, #0
	bne _02256086
	mov r0, #0
	pop {r3, r4, r5, pc}
_02256086:
	ldr r0, [r0]
	cmp r0, #0
	bne _02256096
	add r0, r1, #0
	bl ov04_0225609C
	mov r0, #1
	pop {r3, r4, r5, pc}
_02256096:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov04_02256058

	thumb_func_start ov04_0225609C
ov04_0225609C: ; 0x0225609C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	bl Fsys_GetSaveDataPtr
	bl Sav2_GetGymmickPtr
	mov r1, #2
	bl SavGymmick_AssertMagic_GetData
	add r4, r0, #0
	mov r0, #0xb
	mov r1, #0xc
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	mov r0, #0
	str r0, [r2]
	mov r0, #1
	str r0, [r4]
	ldr r0, [r5]
	ldr r1, _022560D0 ; =ov04_022560D4
	ldr r0, [r0, #0x10]
	bl TaskManager_Call
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022560D0: .word ov04_022560D4
	thumb_func_end ov04_0225609C

	thumb_func_start ov04_022560D4
ov04_022560D4: ; 0x022560D4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x58
	add r4, r0, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r0, [r6, #0x40]
	bl PlayerAvatar_GetMapObject
	ldr r0, [r4]
	cmp r0, #6
	bls _022560F6
	b _0225626C
_022560F6:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02256102: ; jump table
	.short _02256110 - _02256102 - 2 ; case 0
	.short _02256168 - _02256102 - 2 ; case 1
	.short _02256180 - _02256102 - 2 ; case 2
	.short _022561CE - _02256102 - 2 ; case 3
	.short _022561E8 - _02256102 - 2 ; case 4
	.short _02256248 - _02256102 - 2 ; case 5
	.short _02256260 - _02256102 - 2 ; case 6
_02256110:
	ldr r1, [r6, #0x24]
	add r0, sp, #0xc
	bl GF_Camera_GetAngle
	add r0, sp, #4
	ldrh r1, [r0, #8]
	strh r1, [r0, #0x18]
	ldrh r1, [r0, #0xa]
	strh r1, [r0, #0x1a]
	ldrh r1, [r0, #0xc]
	strh r1, [r0, #0x1c]
	ldrh r1, [r0, #0xe]
	strh r1, [r0, #0x1e]
	ldrh r1, [r0, #0x18]
	add r0, sp, #0x44
	strh r1, [r0]
	ldr r0, [r6, #0x24]
	bl GF_Camera_GetPerspectiveAngle
	add r1, sp, #0x44
	ldr r3, _02256274 ; =ov04_02257660
	strh r0, [r1, #2]
	ldmia r3!, {r0, r1}
	add r2, sp, #0x48
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r6, #0x24]
	bl GF_Camera_GetDistance
	str r0, [sp, #0x54]
	ldr r1, [r6, #0x24]
	mov r0, #4
	bl CreateCameraTranslationWrapper
	str r0, [r4, #8]
	add r1, sp, #0x44
	mov r2, #0x18
	bl SetCameraTranslationPath
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0225626C
_02256168:
	ldr r0, [r4, #8]
	bl IsCameraTranslationFinished
	cmp r0, #0
	beq _0225626C
	ldr r0, [r4, #8]
	bl DeleteCameraTranslationWrapper
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0225626C
_02256180:
	add r0, r6, #0
	bl ov04_02256278
	mov r5, #0
	str r0, [sp]
	cmp r0, #0
	ble _022561AE
_0225618E:
	ldr r2, [r6, #0x54]
	mov r0, #0xae
	add r1, r5, #0
	bl ov01_021E8B04
	add r7, r0, #0
	mov r1, #1
	bl ov01_021E8B84
	add r0, r7, #0
	bl ov01_021E8B6C
	ldr r0, [sp]
	add r5, r5, #1
	cmp r5, r0
	blt _0225618E
_022561AE:
	ldr r2, [r6, #0x54]
	mov r0, #0xaf
	mov r1, #0
	bl ov01_021E8B04
	add r5, r0, #0
	mov r1, #1
	bl ov01_021E8B84
	add r0, r5, #0
	bl ov01_021E8B6C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0225626C
_022561CE:
	ldr r2, [r6, #0x54]
	mov r0, #0xaf
	mov r1, #0
	bl ov01_021E8B04
	bl ov01_021E8B90
	cmp r0, #0
	beq _0225626C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0225626C
_022561E8:
	add r1, sp, #0x24
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldr r1, [r6, #0x24]
	add r0, sp, #4
	bl GF_Camera_GetAngle
	add r0, sp, #4
	ldrh r1, [r0]
	strh r1, [r0, #0x10]
	ldrh r1, [r0, #2]
	strh r1, [r0, #0x12]
	ldrh r1, [r0, #4]
	strh r1, [r0, #0x14]
	ldrh r1, [r0, #6]
	strh r1, [r0, #0x16]
	ldrh r1, [r0, #0x10]
	strh r1, [r0, #0x2c]
	ldr r0, [r6, #0x24]
	bl GF_Camera_GetPerspectiveAngle
	add r1, sp, #4
	add r3, sp, #0x24
	strh r0, [r1, #0x2e]
	ldmia r3!, {r0, r1}
	add r2, sp, #0x34
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r6, #0x24]
	bl GF_Camera_GetDistance
	str r0, [sp, #0x40]
	ldr r1, [r6, #0x24]
	mov r0, #4
	bl CreateCameraTranslationWrapper
	str r0, [r4, #8]
	add r1, sp, #0x30
	mov r2, #0x18
	bl SetCameraTranslationPath
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0225626C
_02256248:
	ldr r0, [r4, #8]
	bl IsCameraTranslationFinished
	cmp r0, #0
	beq _0225626C
	ldr r0, [r4, #8]
	bl DeleteCameraTranslationWrapper
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0225626C
_02256260:
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x58
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225626C:
	mov r0, #0
	add sp, #0x58
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02256274: .word ov04_02257660
	thumb_func_end ov04_022560D4

	thumb_func_start ov04_02256278
ov04_02256278: ; 0x02256278
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	add r0, #0xc0
	ldr r0, [r0]
	mov r1, #0xad
	bl ov01_022040D0
	add r6, r0, #0
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	mov r1, #0xae
	bl ov01_022040D0
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	mov r1, #0xaf
	bl ov01_022040D0
	str r0, [sp, #4]
	ldr r0, [r4, #0x54]
	mov r1, #0xad
	bl ov01_021E8BAC
	add r7, r0, #0
	mov r5, #0
	cmp r7, #0
	ble _022562C6
_022562B4:
	ldr r0, [r4, #0x54]
	add r1, r6, #0
	mov r2, #0xad
	add r3, r5, #0
	bl ov01_021E8A8C
	add r5, r5, #1
	cmp r5, r7
	blt _022562B4
_022562C6:
	ldr r0, [r4, #0x54]
	mov r1, #0xae
	bl ov01_021E8BAC
	add r7, r0, #0
	mov r5, #0
	cmp r7, #0
	ble _022562EC
_022562D6:
	ldr r0, [r4, #0x54]
	add r1, r5, #0
	str r0, [sp]
	mov r0, #0xae
	mov r2, #1
	add r3, r6, #0
	bl ov01_021E8970
	add r5, r5, #1
	cmp r5, r7
	blt _022562D6
_022562EC:
	ldr r0, [r4, #0x54]
	ldr r3, [sp, #4]
	str r0, [sp]
	mov r0, #0xaf
	mov r1, #0
	mov r2, #1
	bl ov01_021E8970
	add r0, r7, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov04_02256278

	thumb_func_start ov04_02256304
ov04_02256304: ; 0x02256304
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
	thumb_func_end ov04_02256304

	thumb_func_start ov04_022563B0
ov04_022563B0: ; 0x022563B0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x24]
	bl FreeToHeap
	ldr r0, [r4, #4]
	mov r1, #0
	str r1, [r0, #0x24]
	pop {r4, pc}
	thumb_func_end ov04_022563B0

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

	thumb_func_start ov04_02256650
ov04_02256650: ; 0x02256650
	push {r4, lr}
	add r4, r0, #0
	bl Fsys_GetSaveDataPtr
	bl Sav2_GetGymmickPtr
	mov r1, #7
	bl SavGymmick_AssertMagic_GetData
	ldr r1, _02256698 ; =0x00001DD8
	mov r0, #4
	bl AllocFromHeap
	ldr r1, [r4, #4]
	ldr r2, _02256698 ; =0x00001DD8
	str r0, [r1, #0x24]
	ldr r0, [r4, #4]
	mov r1, #0
	ldr r0, [r0, #0x24]
	bl MI_CpuFill8
	ldr r0, [r4, #4]
	mov r1, #4
	ldr r4, [r0, #0x24]
	add r0, r4, #0
	bl ov04_02256758
	mov r2, #0
	ldr r0, _0225669C ; =0x00001DB6
	sub r1, r2, #1
_0225668C:
	add r2, r2, #1
	strh r1, [r4, r0]
	add r4, #0xc
	cmp r2, #3
	blt _0225668C
	pop {r4, pc}
	.balign 4, 0
_02256698: .word 0x00001DD8
_0225669C: .word 0x00001DB6
	thumb_func_end ov04_02256650

	thumb_func_start ov04_022566A0
ov04_022566A0: ; 0x022566A0
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	ldr r0, [r0, #4]
	ldr r5, [r0, #0x24]
	add r0, r5, #0
	bl ov04_0225686C
	ldr r6, _022566E4 ; =0x00001DB4
	mov r4, #0
	mov r7, #0xc
_022566B4:
	add r0, r4, #0
	mul r0, r7
	add r1, r5, r0
	ldrh r0, [r1, r6]
	cmp r0, #0
	beq _022566C8
	ldr r0, _022566E8 ; =0x00001DBC
	ldr r0, [r1, r0]
	bl DestroySysTask
_022566C8:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #3
	blo _022566B4
	add r0, r5, #0
	bl FreeToHeap
	ldr r0, [sp]
	mov r1, #0
	ldr r0, [r0, #4]
	str r1, [r0, #0x24]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022566E4: .word 0x00001DB4
_022566E8: .word 0x00001DBC
	thumb_func_end ov04_022566A0

	thumb_func_start ov04_022566EC
ov04_022566EC: ; 0x022566EC
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, [r6, #4]
	ldr r5, [r0, #0x24]
	add r0, r1, #0
	add r1, r2, #0
	bl ov04_022568F0
	add r4, r0, #0
	bpl _0225670A
	mov r0, #SEQ_SE_DP_WALL_HIT>>8
	lsl r0, r0, #8
	bl PlaySE
	pop {r4, r5, r6, pc}
_0225670A:
	ldr r0, _0225672C ; =0x00001DB4
	add r1, r4, #0
	add r0, r5, r0
	bl ov04_02256920
	cmp r0, #0
	bne _0225672A
	lsl r2, r4, #0x18
	add r0, r5, #0
	add r1, r6, #0
	lsr r2, r2, #0x18
	bl ov04_02256950
	ldr r0, _02256730 ; =SEQ_SE_GS_TOUMEINAKABEHIT
	bl PlaySE
_0225672A:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0225672C: .word 0x00001DB4
_02256730: .word SEQ_SE_GS_TOUMEINAKABEHIT
	thumb_func_end ov04_022566EC

	thumb_func_start ov04_02256734
ov04_02256734: ; 0x02256734
	push {r3, r4, r5, lr}
	add r5, r1, #0
	ldr r4, [r5, #4]
	mov r1, #4
	add r0, r4, #4
	bl ov04_02256A54
	cmp r0, #0
	beq _0225674E
	add r0, r5, #0
	bl ov04_02256B3C
	pop {r3, r4, r5, pc}
_0225674E:
	add r4, #0x54
	add r0, r4, #0
	bl ov01_021FBF68
	pop {r3, r4, r5, pc}
	thumb_func_end ov04_02256734

	thumb_func_start ov04_02256758
ov04_02256758: ; 0x02256758
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	mov r2, #0x20
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	bl GF_ExpHeap_FndInitAllocator
	mov r0, #0
	str r0, [sp, #0x14]
_0225676A:
	ldr r0, [sp, #0x14]
	mov r1, #0x9a
	add r4, r0, #0
	lsl r1, r1, #2
	mul r4, r1
	ldr r0, [sp, #8]
	mov r1, #0
	add r0, r0, r4
	add r0, #0xd4
	str r1, [r0]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #8]
	lsl r0, r0, #4
	add r1, #0x10
	str r0, [sp, #0x10]
	add r0, r1, r0
	ldr r2, [sp, #0x14]
	ldr r3, [sp, #0xc]
	mov r1, #0xf8
	bl ov01_021FBCD8
	mov r0, #0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #8]
	add r0, #0xd8
	add r0, r0, r4
	str r0, [sp, #0x18]
	ldr r0, [sp, #8]
	str r0, [sp, #0x24]
	add r0, #0x10
	str r0, [sp, #0x24]
_022567A8:
	ldr r1, [sp, #0x1c]
	mov r0, #0xcc
	add r2, r1, #0
	mul r2, r0
	ldr r0, [sp, #0x18]
	mov r1, #0
	add r0, r0, r2
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x18]
	add r5, r1, #0
	str r1, [r0, r2]
	ldr r0, [sp, #0x20]
	add r4, r0, #4
_022567C2:
	ldr r0, [sp, #0xc]
	add r3, r5, #1
	str r0, [sp]
	ldr r0, [sp, #8]
	mov r6, #0xc
	str r0, [sp, #4]
	mov r0, #0x14
	mul r6, r3
	ldr r3, [sp, #0x14]
	mul r0, r5
	ldr r2, [sp, #0x24]
	ldr r1, [sp, #0x10]
	add r0, r4, r0
	add r1, r2, r1
	mov r2, #0xf8
	add r3, r6, r3
	bl ov01_021FBE44
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #4
	blo _022567C2
	ldr r0, [sp, #0x20]
	ldr r2, [sp, #0x24]
	ldr r1, [sp, #0x10]
	add r0, #0x54
	add r1, r2, r1
	bl ov01_021FBF2C
	ldr r0, [sp, #0x20]
	mov r5, #0
	add r7, r0, #0
	add r4, r0, #4
	add r7, #0x54
_02256808:
	mov r0, #0x14
	add r6, r5, #0
	mul r6, r0
	add r0, r7, #0
	add r1, r4, r6
	bl ov01_021FBF50
	add r0, r4, r6
	mov r1, #0
	bl ov01_021FBF20
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #4
	blo _02256808
	mov r1, #0
	add r0, sp, #0x28
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	add r0, #0x54
	bl ov01_021FC00C
	ldr r0, [sp, #0x20]
	mov r1, #0
	add r0, #0x54
	str r0, [sp, #0x20]
	bl ov01_021FC004
	ldr r0, [sp, #0x1c]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x1c]
	cmp r0, #3
	blo _022567A8
	ldr r0, [sp, #0x14]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x14]
	cmp r0, #0xc
	blo _0225676A
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov04_02256758

	thumb_func_start ov04_0225686C
ov04_0225686C: ; 0x0225686C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r6, r0, #0
	mov r0, #0
	str r0, [sp, #8]
	add r0, r6, #0
	str r0, [sp, #0xc]
	add r0, #0x10
	str r0, [sp, #0xc]
	add r0, r6, #0
	str r0, [sp, #0x10]
	add r0, #0xd8
	str r0, [sp, #0x10]
	mov r7, #0x14
_02256888:
	ldr r0, [sp, #8]
	lsl r1, r0, #4
	ldr r0, [sp, #0xc]
	add r0, r0, r1
	bl ov01_021FBDA8
	mov r0, #0
	str r0, [sp, #4]
	ldr r1, [sp, #8]
	mov r0, #0x9a
	lsl r0, r0, #2
	add r2, r1, #0
	mul r2, r0
	ldr r0, [sp, #0x10]
	add r0, r0, r2
	str r0, [sp]
_022568A8:
	ldr r1, [sp, #4]
	mov r0, #0xcc
	add r2, r1, #0
	mul r2, r0
	ldr r0, [sp]
	mov r5, #0
	add r0, r0, r2
	add r4, r0, #4
_022568B8:
	add r0, r5, #0
	mul r0, r7
	add r0, r4, r0
	add r1, r6, #0
	bl ov01_021FBE80
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #4
	blo _022568B8
	ldr r0, [sp, #4]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	cmp r0, #3
	blo _022568A8
	ldr r0, [sp, #8]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	cmp r0, #0xc
	blo _02256888
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov04_0225686C

	thumb_func_start ov04_022568F0
ov04_022568F0: ; 0x022568F0
	push {r3, r4}
	ldr r4, _0225691C ; =ov04_0225766C
	mov r3, #0
_022568F6:
	ldr r2, [r4]
	cmp r0, r2
	bne _02256908
	ldr r2, [r4, #4]
	cmp r1, r2
	bne _02256908
	add r0, r3, #0
	pop {r3, r4}
	bx lr
_02256908:
	add r2, r3, #1
	lsl r2, r2, #0x10
	asr r3, r2, #0x10
	add r4, #0x14
	cmp r3, #0x3c
	blt _022568F6
	mov r0, #0
	mvn r0, r0
	pop {r3, r4}
	bx lr
	.balign 4, 0
_0225691C: .word ov04_0225766C
	thumb_func_end ov04_022568F0

	thumb_func_start ov04_02256920
ov04_02256920: ; 0x02256920
	push {r3, r4, r5, r6}
	mov r2, #0
	mov r3, #2
	mov r4, #0xc
_02256928:
	add r5, r2, #0
	mul r5, r4
	add r6, r0, r5
	ldrh r5, [r0, r5]
	cmp r5, #0
	beq _02256940
	ldrsh r5, [r6, r3]
	cmp r1, r5
	bne _02256940
	mov r0, #1
	pop {r3, r4, r5, r6}
	bx lr
_02256940:
	add r2, r2, #1
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	cmp r2, #3
	blo _02256928
	mov r0, #0
	pop {r3, r4, r5, r6}
	bx lr
	thumb_func_end ov04_02256920

	thumb_func_start ov04_02256950
ov04_02256950: ; 0x02256950
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r0, #0
	add r7, r2, #0
	add r2, r6, #0
	add r2, #0xd0
	str r1, [sp]
	ldr r1, _02256A38 ; =0x00001DB4
	ldr r3, [r2]
	mov r2, #0xc
	add r1, r6, r1
	mul r2, r3
	add r5, r1, r2
	ldrh r1, [r1, r2]
	cmp r1, #0
	beq _02256978
	bl GF_AssertFail
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_02256978:
	add r1, r7, #0
	bl ov04_02256AC4
	mov r0, #1
	strh r0, [r5]
	mov r0, #0x14
	add r4, r7, #0
	mul r4, r0
	ldr r1, _02256A3C ; =ov04_02257674
	add r0, r6, #0
	ldrh r1, [r1, r4]
	add r0, #0xd4
	strh r7, [r5, #2]
	lsl r1, r1, #0x18
	lsr r2, r1, #0x18
	mov r1, #0x9a
	lsl r1, r1, #2
	mul r1, r2
	add r0, r0, r1
	bl ov04_02256A90
	str r0, [r5, #4]
	ldr r0, _02256A40 ; =ov04_02256734
	add r1, r5, #0
	mov r2, #0
	bl CreateSysTask
	str r0, [r5, #8]
	ldr r0, [r5, #4]
	mov r1, #1
	add r0, #0x54
	bl ov01_021FC004
	add r1, sp, #4
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldr r0, [sp]
	ldr r0, [r0, #0x40]
	bl PlayerAvatar_GetMapObject
	add r1, sp, #4
	bl MapObject_GetPositionVec
	ldr r0, _02256A44 ; =ov04_0225766C
	ldr r2, _02256A48 ; =ov04_02257677
	ldr r0, [r0, r4]
	ldrsb r2, [r2, r4]
	lsl r1, r0, #4
	ldr r0, _02256A4C ; =ov04_02257676
	add r1, #8
	ldrsb r0, [r0, r4]
	lsl r2, r2, #4
	lsl r0, r0, #4
	add r0, r1, r0
	lsl r1, r0, #0xc
	ldr r0, _02256A50 ; =ov04_02257670
	str r1, [sp, #4]
	ldr r0, [r0, r4]
	lsl r0, r0, #4
	add r0, #8
	add r0, r0, r2
	lsl r3, r0, #0xc
	str r3, [sp, #0xc]
	ldr r0, [r5, #4]
	ldr r2, [sp, #8]
	add r0, #0x54
	bl ov01_021FC00C
	mov r4, #0
	mov r7, #0x14
_02256A08:
	ldr r0, [r5, #4]
	add r1, r0, #4
	add r0, r4, #0
	mul r0, r7
	add r0, r1, r0
	mov r1, #0
	bl ov01_021FBF20
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _02256A08
	add r0, r6, #0
	add r0, #0xd0
	ldr r0, [r0]
	mov r1, #3
	add r0, r0, #1
	bl _s32_div_f
	add r6, #0xd0
	str r1, [r6]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02256A38: .word 0x00001DB4
_02256A3C: .word ov04_02257674
_02256A40: .word ov04_02256734
_02256A44: .word ov04_0225766C
_02256A48: .word ov04_02257677
_02256A4C: .word ov04_02257676
_02256A50: .word ov04_02257670
	thumb_func_end ov04_02256950

	thumb_func_start ov04_02256A54
ov04_02256A54: ; 0x02256A54
	push {r3, r4, r5, r6, r7, lr}
	mov r5, #0
	add r6, r1, #0
	add r7, r0, #0
	add r4, r5, #0
	cmp r6, #0
	bls _02256A84
_02256A62:
	mov r0, #0x14
	mul r0, r4
	mov r1, #1
	add r0, r7, r0
	lsl r1, r1, #0xc
	bl ov01_021FBEE4
	cmp r0, #0
	beq _02256A7A
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
_02256A7A:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, r6
	blo _02256A62
_02256A84:
	cmp r5, r6
	bne _02256A8C
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02256A8C:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov04_02256A54

	thumb_func_start ov04_02256A90
ov04_02256A90: ; 0x02256A90
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #0xcc
	mul r0, r1
	add r0, r5, r0
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _02256AA6
	bl GF_AssertFail
_02256AA6:
	ldr r1, [r5]
	mov r0, #0xcc
	add r6, r1, #0
	mul r6, r0
	add r4, r5, #4
	mov r0, #1
	str r0, [r4, r6]
	ldr r0, [r5]
	mov r1, #3
	add r0, r0, #1
	bl _s32_div_f
	str r1, [r5]
	add r0, r4, r6
	pop {r4, r5, r6, pc}
	thumb_func_end ov04_02256A90

	thumb_func_start ov04_02256AC4
ov04_02256AC4: ; 0x02256AC4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0x14
	ldr r2, _02256B30 ; =ov04_0225766C
	mul r0, r1
	add r0, r2, r0
	str r0, [sp]
	ldr r0, _02256B34 ; =0x00001DB4
	ldr r5, _02256B34 ; =0x00001DB4
	add r0, r4, r0
	str r0, [sp, #8]
	mov r7, #0xc
_02256AE2:
	ldr r1, [sp]
	ldr r0, [sp, #4]
	add r0, r1, r0
	mov r1, #0xc
	ldrsb r1, [r0, r1]
	cmp r1, #0
	blt _02256B2C
	mov r1, #0xc
	ldrsb r6, [r0, r1]
	mov r2, #0
_02256AF6:
	add r1, r2, #0
	mul r1, r7
	add r0, r4, r1
	ldrh r3, [r0, r5]
	cmp r3, #0
	beq _02256B14
	ldr r3, _02256B38 ; =0x00001DB6
	ldrsh r0, [r0, r3]
	cmp r0, r6
	bne _02256B14
	ldr r0, [sp, #8]
	add r0, r0, r1
	bl ov04_02256B3C
	b _02256B1E
_02256B14:
	add r0, r2, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	cmp r2, #3
	blo _02256AF6
_02256B1E:
	ldr r0, [sp, #4]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	cmp r0, #6
	blo _02256AE2
_02256B2C:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02256B30: .word ov04_0225766C
_02256B34: .word 0x00001DB4
_02256B38: .word 0x00001DB6
	thumb_func_end ov04_02256AC4

	thumb_func_start ov04_02256B3C
ov04_02256B3C: ; 0x02256B3C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	mov r1, #0
	add r0, #0x54
	bl ov01_021FC004
	ldr r0, [r4, #4]
	mov r1, #0
	str r1, [r0]
	strh r1, [r4]
	sub r0, r1, #1
	strh r0, [r4, #2]
	str r1, [r4, #4]
	ldr r0, [r4, #8]
	bl DestroySysTask
	mov r0, #0
	str r0, [r4, #8]
	pop {r4, pc}
	thumb_func_end ov04_02256B3C

	thumb_func_start ov04_02256B64
ov04_02256B64: ; 0x02256B64
	push {r4, lr}
	add r4, r0, #0
	bl Fsys_GetSaveDataPtr
	bl Sav2_GetGymmickPtr
	mov r1, #8
	bl SavGymmick_AssertMagic_GetData
	ldr r1, _02256B9C ; =0x00000708
	mov r0, #4
	bl AllocFromHeap
	ldr r1, [r4, #4]
	ldr r2, _02256B9C ; =0x00000708
	str r0, [r1, #0x24]
	ldr r0, [r4, #4]
	mov r1, #0
	ldr r0, [r0, #0x24]
	bl MI_CpuFill8
	ldr r0, [r4, #4]
	mov r1, #4
	ldr r0, [r0, #0x24]
	bl ov04_02256C20
	pop {r4, pc}
	nop
_02256B9C: .word 0x00000708
	thumb_func_end ov04_02256B64

	thumb_func_start ov04_02256BA0
ov04_02256BA0: ; 0x02256BA0
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	ldr r0, [r0, #4]
	ldr r5, [r0, #0x24]
	add r0, r5, #0
	bl ov04_02256D00
	mov r7, #0xa3
	lsl r7, r7, #2
	add r6, r7, #0
	mov r4, #0
	sub r6, #0x50
_02256BB8:
	add r0, r4, #0
	mul r0, r6
	add r1, r5, r0
	ldr r0, [r1, #0x54]
	cmp r0, #0
	beq _02256BCA
	ldr r0, [r1, r7]
	bl DestroySysTask
_02256BCA:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #3
	blo _02256BB8
	add r0, r5, #0
	bl FreeToHeap
	ldr r0, [sp]
	mov r1, #0
	ldr r0, [r0, #4]
	str r1, [r0, #0x24]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov04_02256BA0

	thumb_func_start ov04_02256BE4
ov04_02256BE4: ; 0x02256BE4
	push {r4, r5, r6, lr}
	add r3, r0, #0
	ldr r0, [r3, #4]
	add r2, r1, #0
	ldr r4, [r0, #0x24]
	mov r1, #0x8f
	ldr r5, [r4, #0x50]
	add r0, r4, #0
	lsl r1, r1, #2
	add r6, r5, #0
	add r0, #0x54
	mul r6, r1
	ldr r1, [r0, r6]
	cmp r1, #0
	bne _02256C18
	add r0, r0, r6
	add r1, r3, #0
	bl ov04_02256D68
	ldr r0, [r4, #0x50]
	mov r1, #3
	add r0, r0, #1
	bl _s32_div_f
	str r1, [r4, #0x50]
	pop {r4, r5, r6, pc}
_02256C18:
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov04_02256BE4

	thumb_func_start ov04_02256C20
ov04_02256C20: ; 0x02256C20
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	mov r2, #0x20
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	bl GF_ExpHeap_FndInitAllocator
	ldr r4, [sp, #8]
	ldr r6, _02256CFC ; =0x00000101
	mov r5, #0
	add r4, #0x10
_02256C36:
	lsl r0, r5, #4
	ldr r3, [sp, #0xc]
	add r0, r4, r0
	add r1, r6, #0
	add r2, r5, #4
	bl ov01_021FBCD8
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #4
	blo _02256C36
	mov r0, #0
	str r0, [sp, #0x14]
_02256C52:
	ldr r0, [sp, #8]
	mov r4, #0
	add r2, r0, #0
	str r4, [r0, #0x50]
	mov r1, #0x8f
	ldr r0, [sp, #0x14]
	lsl r1, r1, #2
	add r2, #0x54
	mul r1, r0
	add r7, r2, r1
	str r4, [r2, r1]
	str r4, [r7, #4]
	add r6, r7, #0
	ldr r0, [sp, #0x14]
	mov r1, #0x8c
	mul r1, r0
	ldr r0, [sp, #8]
	add r6, #0x1c
	str r0, [sp, #0x1c]
	add r0, #0x10
	str r1, [sp, #0x18]
	add r7, #8
	str r0, [sp, #0x1c]
_02256C80:
	lsl r0, r4, #4
	str r0, [sp, #0x10]
	mov r0, #0x8c
	add r5, r4, #0
	mul r5, r0
	ldr r0, [sp, #0xc]
	ldr r2, [sp, #0x1c]
	ldr r1, [sp, #0x10]
	str r0, [sp]
	ldr r0, [sp, #8]
	add r1, r2, r1
	str r0, [sp, #4]
	ldr r2, _02256CFC ; =0x00000101
	add r0, r7, r5
	add r3, r4, #0
	bl ov01_021FBE44
	ldr r2, [sp, #0x1c]
	ldr r1, [sp, #0x10]
	add r0, r6, r5
	add r1, r2, r1
	bl ov01_021FBF2C
	add r0, r6, r5
	add r1, r7, r5
	bl ov01_021FBF50
	add r0, r7, r5
	mov r1, #0
	bl ov01_021FBF20
	mov r1, #0
	add r0, sp, #0x20
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x20]
	ldr r2, [sp, #0x24]
	ldr r3, [sp, #0x28]
	add r0, r6, r0
	bl ov01_021FC00C
	add r0, r6, r5
	mov r1, #0
	bl ov01_021FC004
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _02256C80
	ldr r0, [sp, #0x14]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x14]
	cmp r0, #3
	blo _02256C52
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_02256CFC: .word 0x00000101
	thumb_func_end ov04_02256C20

	thumb_func_start ov04_02256D00
ov04_02256D00: ; 0x02256D00
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	add r5, r6, #0
	mov r4, #0
	add r5, #0x10
_02256D0C:
	lsl r0, r4, #4
	add r0, r5, r0
	bl ov01_021FBDA8
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _02256D0C
	mov r0, #0
	str r0, [sp]
	add r0, r6, #0
	str r0, [sp, #4]
	add r0, #0x54
	str r0, [sp, #4]
	mov r7, #0x8c
_02256D2C:
	ldr r1, [sp]
	mov r0, #0x8f
	lsl r0, r0, #2
	add r2, r1, #0
	mul r2, r0
	ldr r0, [sp, #4]
	mov r5, #0
	add r4, r0, r2
	add r4, #8
_02256D3E:
	add r0, r5, #0
	mul r0, r7
	add r0, r4, r0
	add r1, r6, #0
	bl ov01_021FBE80
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #4
	blo _02256D3E
	ldr r0, [sp]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	cmp r0, #3
	blo _02256D2C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov04_02256D00

	thumb_func_start ov04_02256D68
ov04_02256D68: ; 0x02256D68
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r5, #1
	sub r2, #0x40
	add r7, r1, #0
	str r5, [r4]
	cmp r2, #3
	bhi _02256D9A
	add r0, r2, r2
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02256D86: ; jump table
	.short _02256D8E - _02256D86 - 2 ; case 0
	.short _02256D92 - _02256D86 - 2 ; case 1
	.short _02256D96 - _02256D86 - 2 ; case 2
	.short _02256D98 - _02256D86 - 2 ; case 3
_02256D8E:
	mov r5, #2
	b _02256DA2
_02256D92:
	mov r5, #0
	b _02256DA2
_02256D96:
	mov r5, #3
_02256D98:
	b _02256DA2
_02256D9A:
	bl GF_AssertFail
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_02256DA2:
	ldr r0, _02256DF8 ; =ov04_02256DFC
	add r1, r4, #0
	mov r2, #0
	str r5, [r4, #4]
	bl CreateSysTask
	mov r1, #0x8e
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r6, r5, #0
	mov r0, #0x8c
	add r5, r4, #0
	mul r6, r0
	add r5, #0x1c
	add r0, r5, r6
	mov r1, #1
	bl ov01_021FC004
	add r1, sp, #0
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldr r0, [r7, #0x40]
	bl PlayerAvatar_GetMapObject
	add r1, sp, #0
	bl MapObject_GetPositionVec
	ldr r1, [sp]
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	add r0, r5, r6
	bl ov01_021FC00C
	add r4, #8
	add r0, r4, r6
	mov r1, #0
	bl ov01_021FBF20
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02256DF8: .word ov04_02256DFC
	thumb_func_end ov04_02256D68

	thumb_func_start ov04_02256DFC
ov04_02256DFC: ; 0x02256DFC
	push {r3, r4, r5, lr}
	add r5, r1, #0
	ldr r0, [r5, #4]
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	mov r0, #0x8c
	add r4, r1, #0
	mul r4, r0
	add r0, r5, #0
	add r0, #8
	add r0, r0, r4
	bl ov04_02256E48
	cmp r0, #0
	beq _02256E3E
	add r0, r5, #0
	add r0, #0x1c
	add r0, r0, r4
	mov r1, #0
	bl ov01_021FC004
	mov r0, #0
	str r0, [r5]
	mov r0, #0x8e
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl DestroySysTask
	mov r0, #0x8e
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
	pop {r3, r4, r5, pc}
_02256E3E:
	add r5, #0x1c
	add r0, r5, r4
	bl ov01_021FBF68
	pop {r3, r4, r5, pc}
	thumb_func_end ov04_02256DFC

	thumb_func_start ov04_02256E48
ov04_02256E48: ; 0x02256E48
	push {r3, lr}
	mov r1, #1
	lsl r1, r1, #0xc
	bl ov01_021FBEE4
	cmp r0, #0
	beq _02256E5A
	mov r0, #1
	pop {r3, pc}
_02256E5A:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov04_02256E48

	thumb_func_start ov04_02256E60
ov04_02256E60: ; 0x02256E60
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl Fsys_GetSaveDataPtr
	bl Sav2_GetGymmickPtr
	mov r1, #9
	bl SavGymmick_AssertMagic_GetData
	mov r1, #0x8e
	mov r0, #4
	lsl r1, r1, #2
	bl AllocFromHeap
	ldr r1, [r5, #4]
	mov r2, #0x8e
	str r0, [r1, #0x24]
	ldr r0, [r5, #4]
	mov r1, #0
	ldr r0, [r0, #0x24]
	lsl r2, r2, #2
	bl MI_CpuFill8
	ldr r0, [r5, #4]
	ldr r4, [r0, #0x24]
	add r0, r4, #0
	str r5, [r4]
	bl ov04_02256F50
	ldr r0, _02256EAC ; =ov04_02257148
	add r1, r4, #0
	mov r2, #1
	bl CreateSysTask
	mov r1, #0x8d
	lsl r1, r1, #2
	str r0, [r4, r1]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02256EAC: .word ov04_02257148
	thumb_func_end ov04_02256E60

	thumb_func_start ov04_02256EB0
ov04_02256EB0: ; 0x02256EB0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	ldr r4, [r0, #0x24]
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl DestroySysTask
	add r0, r4, #0
	bl ov04_022570EC
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, [r5, #4]
	mov r1, #0
	str r1, [r0, #0x24]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov04_02256EB0

	thumb_func_start ov04_02256ED8
ov04_02256ED8: ; 0x02256ED8
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, [r0, #4]
	mov r5, #0
	ldr r4, [r0, #0x24]
	add r7, r5, #0
	add r4, #0x4c
	mov r6, #0xb4
_02256EE6:
	add r0, r5, #0
	mul r0, r6
	add r0, r4, r0
	add r1, r7, #0
	bl ov01_021FC004
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #3
	blo _02256EE6
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov04_02256ED8

	thumb_func_start ov04_02256F00
ov04_02256F00: ; 0x02256F00
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	add r6, r1, #0
	ldr r4, [r0, #0x24]
	cmp r6, #3
	bls _02256F14
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
_02256F14:
	add r0, r4, #0
	add r0, #0x4c
	bl ov01_021FC008
	cmp r0, #0
	bne _02256F24
	bl GF_AssertFail
_02256F24:
	add r0, r5, #0
	bl Fsys_GetSaveDataPtr
	bl Sav2_GetGymmickPtr
	mov r1, #9
	bl SavGymmick_AssertMagic_GetData
	str r6, [r0]
	mov r0, #0x23
	mov r1, #1
	lsl r0, r0, #4
	str r1, [r4, r0]
	ldr r0, [r5, #0x10]
	ldr r1, _02256F4C ; =ov04_02257308
	add r2, r4, #0
	bl TaskManager_Call
	pop {r4, r5, r6, pc}
	nop
_02256F4C: .word ov04_02257308
	thumb_func_end ov04_02256F00

	thumb_func_start ov04_02256F50
ov04_02256F50: ; 0x02256F50
	push {r4, r5, r6, r7, lr}
	sub sp, #0x6c
	ldr r3, _022570E0 ; =ov04_02257B28
	str r0, [sp, #8]
	ldmia r3!, {r0, r1}
	add r2, sp, #0x54
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r3, _022570E4 ; =ov04_02257B1C
	add r2, sp, #0x48
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r1, #4
	str r0, [r2]
	ldr r0, [sp, #8]
	mov r2, #0x20
	add r0, r0, #4
	bl GF_ExpHeap_FndInitAllocator
	ldr r4, [sp, #8]
	mov r5, #0
	add r4, #0x14
	add r6, sp, #0x48
	mov r7, #0xb4
_02256F88:
	add r0, r5, #0
	lsl r2, r5, #2
	mul r0, r7
	ldr r2, [r6, r2]
	add r0, r4, r0
	mov r1, #0xae
	mov r3, #4
	bl ov01_021FBCD8
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #3
	blo _02256F88
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [sp, #8]
	add r0, r0, #4
	str r0, [sp, #0x1c]
	ldr r0, [sp, #8]
	str r0, [sp, #0x14]
	add r0, #0x14
	str r0, [sp, #0x14]
	ldr r0, [sp, #8]
	str r0, [sp, #0x18]
	add r0, #0x24
	str r0, [sp, #0x18]
_02256FBE:
	ldr r0, [sp, #0x10]
	mov r5, #0
	lsl r1, r0, #3
	add r0, sp, #0x54
	add r6, r0, r1
	ldr r1, [sp, #0x10]
	mov r0, #0xb4
	add r7, r1, #0
	mul r7, r0
	ldr r0, [sp, #0x18]
	add r4, r0, r7
_02256FD4:
	mov r0, #4
	str r0, [sp]
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x14]
	str r0, [sp, #4]
	mov r0, #0x14
	lsl r3, r5, #2
	mul r0, r5
	ldr r3, [r6, r3]
	add r0, r4, r0
	add r1, r1, r7
	mov r2, #0xae
	bl ov01_021FBE44
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #2
	blo _02256FD4
	ldr r0, [sp, #0x10]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x10]
	cmp r0, #3
	blo _02256FBE
	ldr r4, [sp, #8]
	ldr r6, [sp, #8]
	mov r5, #0
	add r4, #0x4c
	add r6, #0x14
	mov r7, #0xb4
_02257014:
	add r1, r5, #0
	mul r1, r7
	add r0, r4, r1
	add r1, r6, r1
	bl ov01_021FBF2C
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #3
	blo _02257014
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	ldr r7, [sp, #8]
	str r0, [sp, #0x20]
	add r0, #0x24
	str r0, [sp, #0x20]
	add r7, #0x4c
_0225703A:
	ldr r1, [sp, #0xc]
	mov r0, #0xb4
	add r6, r1, #0
	mul r6, r0
	ldr r0, [sp, #0x20]
	mov r5, #0
	add r4, r0, r6
_02257048:
	mov r1, #0x14
	mul r1, r5
	add r0, r7, r6
	add r1, r4, r1
	bl ov01_021FBF50
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #2
	blo _02257048
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0xc]
	cmp r0, #3
	blo _0225703A
	ldr r6, [sp, #8]
	ldr r7, [sp, #8]
	mov r5, #0
	add r6, #0x4c
	add r7, #0x24
_02257076:
	mov r0, #0xb4
	add r4, r5, #0
	mul r4, r0
	add r0, r6, r4
	mov r1, #1
	bl ov01_021FC004
	add r0, r7, r4
	mov r1, #2
	mov r2, #0
	bl ov04_022572E0
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #3
	blo _02257076
	ldr r4, _022570E8 ; =ov04_02257B40
	add r3, sp, #0x24
	mov r2, #4
_0225709E:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0225709E
	ldr r0, [r4]
	mov r5, #0
	str r0, [r3]
	ldr r0, [sp, #8]
	add r4, sp, #0x24
	add r0, #0x4c
	str r0, [sp, #8]
	mov r7, #0xc
	mov r6, #0xb4
_022570B8:
	add r1, r5, #0
	mul r1, r7
	add r2, r5, #0
	add r3, r4, r1
	ldr r0, [sp, #8]
	mul r2, r6
	add r0, r0, r2
	ldr r2, [r3, #4]
	ldr r1, [r4, r1]
	ldr r3, [r3, #8]
	bl ov01_021FC00C
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #3
	blo _022570B8
	add sp, #0x6c
	pop {r4, r5, r6, r7, pc}
	nop
_022570E0: .word ov04_02257B28
_022570E4: .word ov04_02257B1C
_022570E8: .word ov04_02257B40
	thumb_func_end ov04_02256F50

	thumb_func_start ov04_022570EC
ov04_022570EC: ; 0x022570EC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r0, #0
	mov r0, #0
	str r0, [sp, #4]
	add r0, r6, #0
	str r0, [sp, #0xc]
	add r0, #0x14
	str r0, [sp, #0xc]
	add r0, r6, #0
	str r0, [sp, #8]
	add r0, #0x24
	str r0, [sp, #8]
	mov r7, #0x14
_02257108:
	ldr r1, [sp, #4]
	mov r0, #0xb4
	mul r0, r1
	ldr r1, [sp, #8]
	mov r4, #0
	str r0, [sp]
	add r5, r1, r0
_02257116:
	add r0, r4, #0
	mul r0, r7
	add r0, r5, r0
	add r1, r6, #4
	bl ov01_021FBE80
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #2
	blo _02257116
	ldr r1, [sp, #0xc]
	ldr r0, [sp]
	add r0, r1, r0
	bl ov01_021FBDA8
	ldr r0, [sp, #4]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	cmp r0, #3
	blo _02257108
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov04_022570EC

	thumb_func_start ov04_02257148
ov04_02257148: ; 0x02257148
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r1, #0
	add r1, sp, #4
	mov r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	ldr r0, [r7]
	bl Fsys_GetSaveDataPtr
	bl Sav2_GetGymmickPtr
	mov r1, #9
	bl SavGymmick_AssertMagic_GetData
	ldr r0, [r0]
	cmp r0, #3
	bhi _0225719A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225717A: ; jump table
	.short _0225719E - _0225717A - 2 ; case 0
	.short _02257182 - _0225717A - 2 ; case 1
	.short _0225718A - _0225717A - 2 ; case 2
	.short _02257192 - _0225717A - 2 ; case 3
_02257182:
	mov r1, #1
	add r0, sp, #4
	strb r1, [r0]
	b _0225719E
_0225718A:
	mov r1, #1
	add r0, sp, #4
	strb r1, [r0, #1]
	b _0225719E
_02257192:
	mov r1, #1
	add r0, sp, #4
	strb r1, [r0, #2]
	b _0225719E
_0225719A:
	bl GF_AssertFail
_0225719E:
	add r4, r7, #0
	mov r5, #0
	add r4, #0x14
	add r6, sp, #4
_022571A6:
	mov r0, #0xb4
	mul r0, r5
	ldrb r2, [r6, r5]
	add r0, r4, r0
	mov r1, #2
	bl ov04_02257240
	str r0, [sp]
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #3
	blo _022571A6
	add r4, r7, #0
	mov r5, #0
	add r4, #0x4c
	mov r6, #0xb4
_022571C8:
	add r0, r5, #0
	mul r0, r6
	add r0, r4, r0
	bl ov01_021FBF68
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #3
	blo _022571C8
	ldr r0, [sp]
	cmp r0, #0
	beq _022571EA
	mov r0, #0x23
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r7, r0]
_022571EA:
	mov r5, #0
	add r6, sp, #8
	add r7, #0x14
_022571F0:
	mov r0, #0xb4
	mul r0, r5
	add r0, r7, r0
	add r0, #0x10
	lsl r4, r5, #2
	bl ov01_021FBF28
	asr r1, r0, #0xb
	lsr r1, r1, #0x14
	add r1, r0, r1
	asr r0, r1, #0xc
	str r0, [r6, r4]
	ldr r0, [r6, r4]
	mov r1, #0x1e
	bl _s32_div_f
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	str r1, [r6, r4]
	cmp r5, #3
	blo _022571F0
	ldr r4, [sp, #0xc]
	ldr r0, [sp, #8]
	cmp r0, r4
	beq _02257228
	bl GF_AssertFail
_02257228:
	ldr r5, [sp, #0x10]
	cmp r4, r5
	beq _02257232
	bl GF_AssertFail
_02257232:
	ldr r0, [sp, #8]
	cmp r5, r0
	beq _0225723C
	bl GF_AssertFail
_0225723C:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov04_02257148

	thumb_func_start ov04_02257240
ov04_02257240: ; 0x02257240
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r1, [sp, #4]
	str r0, [sp]
	str r2, [sp, #8]
	add r0, #0xb0
	ldr r0, [r0]
	mov r6, #0
	cmp r0, #0
	beq _0225725C
	mov r0, #0xf
	lsl r0, r0, #0xe
	str r0, [sp, #0xc]
	b _02257262
_0225725C:
	mov r0, #0x1e
	lsl r0, r0, #0xc
	str r0, [sp, #0xc]
_02257262:
	ldr r0, [sp, #4]
	mov r5, #0
	cmp r0, #0
	bls _022572CE
	ldr r4, [sp]
	add r4, #0x10
_0225726E:
	mov r0, #0x14
	add r7, r5, #0
	mul r7, r0
	add r0, r4, r7
	bl ov01_021FBF28
	mov r1, #1
	lsl r1, r1, #0xc
	add r1, r0, r1
	ldr r0, [sp, #0xc]
	cmp r1, r0
	blt _02257294
	cmp r5, #0
	beq _02257292
	cmp r6, #0
	bne _02257292
	bl GF_AssertFail
_02257292:
	mov r6, #1
_02257294:
	mov r1, #1
	add r0, r4, r7
	lsl r1, r1, #0xc
	bl ov01_021FBEAC
	cmp r6, #0
	beq _022572C2
	ldr r1, [sp]
	ldr r0, [sp, #8]
	add r1, #0xb0
	str r0, [r1]
	ldr r0, [sp]
	add r0, #0xb0
	ldr r0, [r0]
	cmp r0, #0
	beq _022572BA
	mov r1, #0x1e
	lsl r1, r1, #0xc
	b _022572BC
_022572BA:
	mov r1, #0
_022572BC:
	add r0, r4, r7
	bl ov01_021FBF20
_022572C2:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	ldr r0, [sp, #4]
	cmp r5, r0
	blo _0225726E
_022572CE:
	cmp r6, #0
	beq _022572D8
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_022572D8:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov04_02257240

	thumb_func_start ov04_022572E0
ov04_022572E0: ; 0x022572E0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r7, r2, #0
	mov r4, #0
	cmp r5, #0
	bls _02257304
_022572EE:
	mov r0, #0x14
	mul r0, r4
	add r0, r6, r0
	add r1, r7, #0
	bl ov01_021FBF20
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, r5
	blo _022572EE
_02257304:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov04_022572E0

	thumb_func_start ov04_02257308
ov04_02257308: ; 0x02257308
	push {r4, lr}
	add r4, r0, #0
	bl TaskManager_GetSys
	add r0, r4, #0
	bl TaskManager_GetEnv
	mov r1, #0x23
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	cmp r0, #0
	bne _02257324
	mov r0, #1
	pop {r4, pc}
_02257324:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov04_02257308

	.rodata

_02257328:
	.byte 0x00, 0x80, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x80, 0x14, 0x00

ov04_02257334: ; 0x02257334
	.byte 0x00, 0x00, 0x29, 0x25, 0x70, 0x11, 0x94, 0x7F, 0x84, 0x10, 0x84, 0x10
	.byte 0x84, 0x10, 0x84, 0x10

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

sMortyGymTrainerObjectIds: ; 0x02257604
	.word obj_T27GYM0101_itako
	.word obj_T27GYM0101_itako_2
	.word obj_T27GYM0101_itako_3
	.word obj_T27GYM0101_itako_4

ov04_02257614: ; 0x02257614
	.byte 0x40, 0x14, 0x1E, 0x2E

ov04_02257618: ; 0x02257618
	.byte 0x40, 0x40, 0x40, 0x40, 0x2A, 0x00, 0x00, 0x00

ov04_02257620: ; 0x02257620
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00

ov04_0225762C: ; 0x0225762C
	.byte 0x78, 0x00, 0x00, 0x00
	.byte 0x79, 0x00, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00

ov04_02257638: ; 0x02257638
	.byte 0x0A, 0x0A, 0x0D, 0x12, 0x19, 0x26, 0x33, 0x40
	.byte 0x40, 0x17, 0x1C, 0x23, 0x2D, 0x37, 0x00, 0x00

ov04_02257648: ; 0x02257648
	.byte 0x08, 0x09, 0x0A, 0x0E, 0x13, 0x1A, 0x25, 0x33
	.byte 0x40, 0x11, 0x13, 0x17, 0x1C, 0x23, 0x2E, 0x37, 0x40, 0x40, 0x40, 0x1E, 0x23, 0x29, 0x31, 0x39

ov04_02257660: ; 0x02257660
	.byte 0x00, 0x20, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x03, 0x00

ov04_0225766C: ; 0x0225766C
	.byte 0x04, 0x00, 0x00, 0x00

ov04_02257670: ; 0x02257670
	.byte 0x04, 0x00, 0x00, 0x00

ov04_02257674: ; 0x02257674
	.byte 0x00, 0x00

ov04_02257676: ; 0x02257676
	.byte 0x00

ov04_02257677: ; 0x02257677
	.byte 0x00, 0x01, 0x02, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x03, 0xFF
	.byte 0xFF, 0xFF, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x03, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x01, 0x02, 0x05, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x07, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x03, 0x06, 0x08, 0xFF
	.byte 0xFF, 0xFF, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x03, 0x05, 0x08, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x04, 0x09, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x05, 0x06, 0x0D, 0x0F, 0xFF, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x07, 0x0E, 0x10
	.byte 0xFF, 0xFF, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0B, 0x0C, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x0A, 0x0B, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x0A, 0x0B, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x0D, 0x0F, 0x11
	.byte 0xFF, 0xFF, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x07, 0x10, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x08, 0x0D, 0x11, 0x12, 0xFF, 0xFF, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0xFF, 0x09, 0x0E, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0D, 0x12, 0x13, 0xFF
	.byte 0xFF, 0xFF, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x0F, 0x11, 0x13, 0x14, 0xFF, 0xFF, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x11, 0x12, 0x14, 0x19, 0xFF, 0xFF, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x12, 0x13, 0x19, 0x1B, 0xFF, 0xFF, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x1A, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x17, 0x18, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x16, 0x18, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x16, 0x17, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x13, 0x14, 0x1B, 0x1C
	.byte 0xFF, 0xFF, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0xFF
	.byte 0x15, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x14, 0x19, 0x1C, 0x23, 0xFF, 0xFF, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x19, 0x1B, 0x23, 0x25, 0x22, 0xFF, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x1A, 0x1E, 0x1F, 0xFF
	.byte 0xFF, 0xFF, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x24, 0x1D, 0x1F, 0x20, 0x20, 0xFF, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x1D, 0x1E, 0x20, 0x21, 0xFF, 0xFF, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x0D, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x1E, 0x1F, 0x21, 0x22, 0xFF, 0xFF, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x1F, 0x20, 0x22, 0x23
	.byte 0xFF, 0xFF, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x20, 0x21, 0x23, 0x1C, 0x25, 0xFF, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x1B, 0x1C, 0x25, 0x22, 0xFF, 0xFF, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x0E, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0xFF, 0x1D, 0x1E, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0xFF, 0x1C, 0x22, 0x23, 0x25
	.byte 0xFF, 0xFF, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x27, 0x2C, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x26, 0x2C, 0x2E, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x29, 0x2A, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x28, 0x2A, 0x2B, 0x2D
	.byte 0xFF, 0xFF, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x28, 0x29, 0x2B, 0x2D, 0xFF, 0xFF, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x29, 0x2D, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x11, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x26, 0x27, 0x2E, 0x30, 0xFF, 0xFF, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x29, 0x2B, 0x2A, 0x2F
	.byte 0x34, 0xFF, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x27, 0x2C, 0x30, 0x3B, 0xFF, 0xFF, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x2A, 0x2D, 0x33, 0x34, 0x35, 0xFF, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x13, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x2C, 0x2E, 0x3B, 0x3A, 0xFF, 0xFF, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x32, 0x33, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x31, 0x33, 0x34, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x31, 0x32, 0x34, 0x35, 0x2F, 0xFF, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x32, 0x33, 0x2D, 0x2F, 0x35, 0x36, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x2F, 0x33, 0x34, 0x36
	.byte 0x37, 0xFF, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x34, 0x35, 0x37, 0x38, 0xFF, 0xFF, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x35, 0x36, 0x38, 0x39, 0xFF, 0xFF, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x36, 0x37, 0x39, 0x3A, 0x3B, 0xFF, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x37, 0x38, 0x3A, 0x3B
	.byte 0xFF, 0xFF, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x38, 0x39, 0x3B, 0x30, 0xFF, 0xFF, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x3A, 0x30, 0x39, 0x2E, 0xFF, 0xFF, 0x00, 0x00

ov04_02257B1C: ; 0x02257B1C
	.byte 0x65, 0x00, 0x00, 0x00
	.byte 0x68, 0x00, 0x00, 0x00, 0x6B, 0x00, 0x00, 0x00

ov04_02257B28: ; 0x02257B28
	.byte 0x66, 0x00, 0x00, 0x00, 0x67, 0x00, 0x00, 0x00
	.byte 0x69, 0x00, 0x00, 0x00, 0x6A, 0x00, 0x00, 0x00, 0x6C, 0x00, 0x00, 0x00, 0x6D, 0x00, 0x00, 0x00

ov04_02257B40: ; 0x02257B40
	.byte 0x00, 0x80, 0x0C, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x80, 0x0F, 0x00, 0x00, 0x80, 0x14, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x00, 0x80, 0x0F, 0x00, 0x00, 0x80, 0x10, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x80, 0x08, 0x00
	; 0x02257B80
