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
	ldr r6, _02253ECC ; =ov04_02257328
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
_02253ECC: .word ov04_02257328
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

	.rodata

ov04_02257328:
	.byte 0x00, 0x80, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x80, 0x14, 0x00

ov04_02257334: ; 0x02257334
	.byte 0x00, 0x00, 0x29, 0x25, 0x70, 0x11, 0x94, 0x7F, 0x84, 0x10, 0x84, 0x10
	.byte 0x84, 0x10, 0x84, 0x10
