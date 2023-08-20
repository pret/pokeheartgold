	.include "asm/macros.inc"
	.include "overlay_80_02230B8C.inc"
	.include "global.inc"

    .text

	thumb_func_start ov80_02230B8C
ov80_02230B8C: ; 0x02230B8C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	bl ov80_0222BE10
	str r0, [sp, #4]
	add r0, r5, #0
	bl ov80_0222BE10
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	add r6, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	add r7, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	lsl r1, r7, #0x18
	lsr r1, r1, #0x18
	str r1, [sp]
	lsl r2, r4, #0x18
	lsl r3, r6, #0x18
	ldr r0, [r0, #8]
	ldr r1, [sp, #4]
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl ov80_022310C4
	add r1, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096818
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_02230B8C

	thumb_func_start ov80_02230BE0
ov80_02230BE0: ; 0x02230BE0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0222BE10
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096810
	add r1, r4, #0
	bl ov80_022313C0
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_02230BE0

	thumb_func_start ov80_02230BFC
ov80_02230BFC: ; 0x02230BFC
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096810
	bl ov80_022314A0
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02230BFC

	thumb_func_start ov80_02230C10
ov80_02230C10: ; 0x02230C10
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_02096808
	add r7, r0, #0
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_02096810
	add r4, r0, #0
	mov r0, #0xb
	mov r1, #0x20
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x20
	add r5, r0, #0
	bl MI_CpuFill8
	ldr r0, [r7, #8]
	ldr r1, _02230CD0 ; =0x00000704
	str r0, [r5]
	ldrb r0, [r4, #4]
	add r3, r4, r1
	sub r1, #0xf
	strb r0, [r5, #4]
	str r4, [r5, #0x10]
	ldrb r2, [r4, #4]
	lsl r0, r2, #3
	add r0, r2, r0
	add r0, r3, r0
	str r0, [r5, #8]
	mov r0, #0x99
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	str r0, [r5, #0xc]
	ldrh r0, [r4, #8]
	strh r0, [r5, #0x18]
	ldrb r0, [r4, r1]
	strb r0, [r5, #5]
	ldr r0, _02230CD4 ; =0x00000D84
	add r0, r4, r0
	str r0, [r5, #0x14]
	ldr r0, [r5, #0xc]
	bl SaveArray_Party_Init
	ldr r0, [r7, #8]
	bl SaveArray_Party_Get
	mov r1, #0x26
	lsl r1, r1, #4
	ldrb r1, [r4, r1]
	add r7, r0, #0
	bl Party_GetMonByIndex
	add r1, r0, #0
	ldr r0, [r5, #0xc]
	bl Party_AddMon
	ldrb r0, [r5, #4]
	cmp r0, #1
	bne _02230CA4
	ldr r1, _02230CD8 ; =0x00000261
	add r0, r7, #0
	ldrb r1, [r4, r1]
	bl Party_GetMonByIndex
	add r1, r0, #0
	ldr r0, [r5, #0xc]
	bl Party_AddMon
	b _02230CB8
_02230CA4:
	add r0, #0xfe
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _02230CB8
	ldr r1, _02230CDC ; =0x00000D8C
	ldr r0, [r5, #0xc]
	ldr r1, [r4, r1]
	bl Party_AddMon
_02230CB8:
	ldr r0, _02230CE0 ; =ov80_02230D5C
	ldr r1, _02230CE4 ; =ov80_0223BDEC
	str r0, [sp]
	ldr r0, [r6]
	add r2, r5, #0
	ldr r0, [r0]
	mov r3, #0
	bl sub_02096820
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02230CD0: .word 0x00000704
_02230CD4: .word 0x00000D84
_02230CD8: .word 0x00000261
_02230CDC: .word 0x00000D8C
_02230CE0: .word ov80_02230D5C
_02230CE4: .word ov80_0223BDEC
	thumb_func_end ov80_02230C10

	thumb_func_start ov80_02230CE8
ov80_02230CE8: ; 0x02230CE8
	push {r3, r4, r5, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096810
	add r4, r0, #0
	mov r0, #7
	lsl r0, r0, #8
	ldr r5, [r4, r0]
	ldr r0, [r5, #0x14]
	bl IsBattleResultWin
	str r0, [r4, #0x14]
	add r0, r5, #0
	bl BattleSetup_Delete
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_02230CE8

	thumb_func_start ov80_02230D0C
ov80_02230D0C: ; 0x02230D0C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096810
	add r1, r6, #0
	add r4, r0, #0
	bl ov80_022375D0
	add r6, r0, #0
	mov r0, #7
	lsl r0, r0, #8
	str r6, [r4, r0]
	ldr r1, _02230D54 ; =0x0000045D
	mov r0, #5
	mov r2, #1
	bl sub_02004EC4
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5]
	ldr r1, _02230D58 ; =_020FA484
	ldr r0, [r0]
	add r2, r6, #0
	bl sub_02096820
	mov r0, #1
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02230D54: .word 0x0000045D
_02230D58: .word _020FA484
	thumb_func_end ov80_02230D0C

	thumb_func_start ov80_02230D5C
ov80_02230D5C: ; 0x02230D5C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	add r1, r4, #0
	bl ov80_022314DC
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov80_02230D5C

	thumb_func_start ov80_02230D70
ov80_02230D70: ; 0x02230D70
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r1, [r4, #0x1c]
	add r2, r1, #1
	str r2, [r4, #0x1c]
	ldrb r7, [r1]
	add r1, r2, #1
	str r1, [r4, #0x1c]
	ldrb r6, [r2]
	add r1, r1, #1
	str r1, [r4, #0x1c]
	bl ov80_0222BDF4
	add r5, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_02096808
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_02096810
	add r4, r0, #0
	cmp r7, #0x26
	bls _02230DA8
	b _02230FB6
_02230DA8:
	add r1, r7, r7
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02230DB4: ; jump table
	.short _02230FB6 - _02230DB4 - 2 ; case 0
	.short _02230FB6 - _02230DB4 - 2 ; case 1
	.short _02230E02 - _02230DB4 - 2 ; case 2
	.short _02230E06 - _02230DB4 - 2 ; case 3
	.short _02230E0E - _02230DB4 - 2 ; case 4
	.short _02230E14 - _02230DB4 - 2 ; case 5
	.short _02230FB6 - _02230DB4 - 2 ; case 6
	.short _02230E22 - _02230DB4 - 2 ; case 7
	.short _02230FB6 - _02230DB4 - 2 ; case 8
	.short _02230E2A - _02230DB4 - 2 ; case 9
	.short _02230E36 - _02230DB4 - 2 ; case 10
	.short _02230FB6 - _02230DB4 - 2 ; case 11
	.short _02230FB6 - _02230DB4 - 2 ; case 12
	.short _02230FB6 - _02230DB4 - 2 ; case 13
	.short _02230E3E - _02230DB4 - 2 ; case 14
	.short _02230F6C - _02230DB4 - 2 ; case 15
	.short _02230FB6 - _02230DB4 - 2 ; case 16
	.short _02230F00 - _02230DB4 - 2 ; case 17
	.short _02230FB6 - _02230DB4 - 2 ; case 18
	.short _02230E46 - _02230DB4 - 2 ; case 19
	.short _02230E58 - _02230DB4 - 2 ; case 20
	.short _02230E62 - _02230DB4 - 2 ; case 21
	.short _02230E68 - _02230DB4 - 2 ; case 22
	.short _02230E6E - _02230DB4 - 2 ; case 23
	.short _02230E76 - _02230DB4 - 2 ; case 24
	.short _02230FB6 - _02230DB4 - 2 ; case 25
	.short _02230FB6 - _02230DB4 - 2 ; case 26
	.short _02230E7E - _02230DB4 - 2 ; case 27
	.short _02230EBA - _02230DB4 - 2 ; case 28
	.short _02230EF0 - _02230DB4 - 2 ; case 29
	.short _02230EF6 - _02230DB4 - 2 ; case 30
	.short _02230F06 - _02230DB4 - 2 ; case 31
	.short _02230F1E - _02230DB4 - 2 ; case 32
	.short _02230F4C - _02230DB4 - 2 ; case 33
	.short _02230F64 - _02230DB4 - 2 ; case 34
	.short _02230F8A - _02230DB4 - 2 ; case 35
	.short _02230F90 - _02230DB4 - 2 ; case 36
	.short _02230F96 - _02230DB4 - 2 ; case 37
	.short _02230FB6 - _02230DB4 - 2 ; case 38
_02230E02:
	strb r6, [r4, #4]
	b _02230FB6
_02230E06:
	ldr r0, _02230FBC ; =0x000006F2
	ldrh r0, [r4, r0]
	strh r0, [r5]
	b _02230FB6
_02230E0E:
	ldrh r0, [r4, #8]
	strh r0, [r5]
	b _02230FB6
_02230E14:
	ldrh r1, [r4, #8]
	ldr r0, _02230FC0 ; =0x0000270F
	cmp r1, r0
	bhs _02230EB8
	add r0, r1, #1
	strh r0, [r4, #8]
	b _02230FB6
_02230E22:
	mov r0, #0
	bl OS_ResetSystem
	b _02230FB6
_02230E2A:
	ldr r0, _02230FC4 ; =0x000006F8
	ldr r0, [r4, r0]
	bl sub_02030B14
	strh r0, [r5]
	b _02230FB6
_02230E36:
	mov r1, #2
	bl ov80_0223157C
	b _02230FB6
_02230E3E:
	bl ov80_022317C0
	strh r0, [r5]
	b _02230FB6
_02230E46:
	ldrb r0, [r4, #4]
	cmp r0, #2
	bne _02230E52
	mov r0, #0xa
	strh r0, [r5]
	b _02230FB6
_02230E52:
	ldrh r0, [r4, #0xa]
	strh r0, [r5]
	b _02230FB6
_02230E58:
	add r1, r6, #0
	bl ov80_022317D0
	strh r0, [r5]
	b _02230FB6
_02230E62:
	bl ov80_02231804
	b _02230FB6
_02230E68:
	bl ov80_02231828
	b _02230FB6
_02230E6E:
	bl ov80_022317CC
	strh r0, [r5]
	b _02230FB6
_02230E76:
	ldr r0, _02230FC8 ; =0x00000D88
	ldrb r0, [r4, r0]
	strh r0, [r5]
	b _02230FB6
_02230E7E:
	ldr r0, [sp, #4]
	ldr r0, [r0, #8]
	bl SaveArray_Party_Get
	str r0, [sp]
	ldrb r0, [r4, #4]
	bl ov80_0223787C
	add r7, r0, #0
	mov r5, #0
	cmp r7, #0
	ble _02230EB8
	ldr r0, _02230FCC ; =0x00000728
	add r6, r4, r0
_02230E9A:
	mov r1, #0x26
	add r2, r4, r5
	lsl r1, r1, #4
	ldrb r1, [r2, r1]
	ldr r0, [sp]
	bl Party_GetMonByIndex
	mov r1, #6
	add r2, r6, #0
	bl SetMonData
	add r5, r5, #1
	add r6, r6, #2
	cmp r5, r7
	blt _02230E9A
_02230EB8:
	b _02230FB6
_02230EBA:
	ldr r1, _02230FD0 ; =0x000006F5
	ldrb r2, [r4, #4]
	ldrb r0, [r4, r1]
	add r1, #0xf
	add r3, r4, r1
	lsl r1, r2, #3
	add r1, r2, r1
	add r1, r3, r1
	bl sub_02030BD0
	add r2, r0, #0
	cmp r2, #0xa
	bhs _02230FB6
	ldr r1, _02230FD0 ; =0x000006F5
	ldrb r3, [r4, #4]
	ldrb r0, [r4, r1]
	add r1, #0xf
	add r5, r4, r1
	lsl r1, r3, #3
	add r2, r2, #1
	add r1, r3, r1
	lsl r2, r2, #0x18
	add r1, r5, r1
	lsr r2, r2, #0x18
	bl sub_02030BF4
	b _02230FB6
_02230EF0:
	bl sub_02096910
	b _02230FB6
_02230EF6:
	ldrb r0, [r4, #4]
	bl ov80_0223792C
	strh r0, [r5]
	b _02230FB6
_02230F00:
	ldrb r0, [r4, #4]
	strh r0, [r5]
	b _02230FB6
_02230F06:
	cmp r6, #0
	bne _02230F14
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	b _02230FB6
_02230F14:
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	b _02230FB6
_02230F1E:
	ldrb r1, [r4, #5]
	add r0, #0x40
	mov r2, #0xb
	lsl r1, r1, #2
	add r1, r4, r1
	ldrh r1, [r1, #0x18]
	mov r3, #0xcc
	bl ov80_0222A474
	ldrb r1, [r4, #5]
	mov r0, #0x15
	lsl r0, r0, #4
	lsl r1, r1, #1
	add r1, r1, #1
	lsl r1, r1, #1
	add r1, r4, r1
	ldrh r1, [r1, #0x18]
	add r0, r4, r0
	mov r2, #0xb
	mov r3, #0xcc
	bl ov80_0222A474
	b _02230FB6
_02230F4C:
	ldr r1, _02230FD0 ; =0x000006F5
	ldrb r2, [r4, #4]
	ldrb r0, [r4, r1]
	add r1, #0xf
	add r3, r4, r1
	lsl r1, r2, #3
	add r1, r2, r1
	add r1, r3, r1
	bl sub_02030BD0
	strh r0, [r5]
	b _02230FB6
_02230F64:
	bl ov80_02231888
	strh r0, [r5]
	b _02230FB6
_02230F6C:
	ldr r0, [sp, #4]
	ldr r0, [r0, #8]
	bl SaveArray_Party_Get
	mov r1, #0x26
	lsl r1, r1, #4
	ldrb r1, [r4, r1]
	bl Party_GetMonByIndex
	mov r1, #5
	mov r2, #0
	bl GetMonData
	strh r0, [r5]
	b _02230FB6
_02230F8A:
	bl ov80_022319B0
	b _02230FB6
_02230F90:
	bl ov80_02231A04
	b _02230FB6
_02230F96:
	mov r0, #0
	strh r0, [r5]
	ldrb r0, [r4, #4]
	cmp r0, #0
	bne _02230FB6
	ldrh r0, [r4, #8]
	add r0, r0, #1
	cmp r0, #0x32
	bne _02230FAE
	mov r0, #1
	strh r0, [r5]
	b _02230FB6
_02230FAE:
	cmp r0, #0xaa
	bne _02230FB6
	mov r0, #2
	strh r0, [r5]
_02230FB6:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02230FBC: .word 0x000006F2
_02230FC0: .word 0x0000270F
_02230FC4: .word 0x000006F8
_02230FC8: .word 0x00000D88
_02230FCC: .word 0x00000728
_02230FD0: .word 0x000006F5
	thumb_func_end ov80_02230D70

	thumb_func_start ov80_02230FD4
ov80_02230FD4: ; 0x02230FD4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0222BDF4
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096810
	ldr r0, [r0, #0x14]
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_02230FD4

	thumb_func_start ov80_02230FF0
ov80_02230FF0: ; 0x02230FF0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ov80_0222BE10
	add r6, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	add r7, r0, #0
	add r0, r5, #0
	bl ov80_0222BDF4
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096810
	add r1, r6, #0
	add r2, r7, #0
	bl ov80_02231844
	strh r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_02230FF0

	thumb_func_start ov80_02231020
ov80_02231020: ; 0x02231020
	push {r4, lr}
	add r4, r0, #0
	bl ov80_0222AC58
	add r1, r4, #0
	add r1, #0x78
	strh r0, [r1]
	ldr r1, _0223103C ; =ov80_02231040
	add r0, r4, #0
	bl ov80_0222AB84
	mov r0, #1
	pop {r4, pc}
	nop
_0223103C: .word ov80_02231040
	thumb_func_end ov80_02231020

	thumb_func_start ov80_02231040
ov80_02231040: ; 0x02231040
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x78
	ldrh r1, [r1]
	bl ov80_0222BE9C
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_02096810
	mov r1, #0xd9
	lsl r1, r1, #4
	ldrb r2, [r0, r1]
	cmp r2, #2
	blo _02231068
	mov r2, #0
	strb r2, [r0, r1]
	mov r0, #1
	pop {r4, pc}
_02231068:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov80_02231040

	thumb_func_start ov80_0223106C
ov80_0223106C: ; 0x0223106C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	ldr r1, [r5, #0x1c]
	add r0, r1, #1
	str r0, [r5, #0x1c]
	ldr r0, [r5]
	ldrb r4, [r1]
	ldr r0, [r0]
	bl sub_02096810
	add r2, r0, #0
	bne _02231090
	mov r0, #0
	pop {r3, r4, r5, pc}
_02231090:
	lsl r1, r4, #4
	add r1, r4, r1
	add r2, #0x58
	lsl r1, r1, #4
	add r0, r5, #0
	add r1, r2, r1
	bl ov80_0222F44C
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0223106C

	thumb_func_start ov80_022310A4
ov80_022310A4: ; 0x022310A4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0222BDF4
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096810
	add r1, r4, #0
	bl ov80_0223151C
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_022310A4

	thumb_func_start ov80_022310C0
ov80_022310C0: ; 0x022310C0
	mov r0, #0
	bx lr
	thumb_func_end ov80_022310C0
