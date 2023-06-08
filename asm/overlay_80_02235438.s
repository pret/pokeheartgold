	.include "asm/macros.inc"
	.include "overlay_80_02235438.inc"
	.include "global.inc"

    .text

	thumb_func_start ov80_02235438
ov80_02235438: ; 0x02235438
	push {r3, lr}
	bl ov80_0222AC58
	bl GF_GetCurrentPlayingBGM
	mov r1, #0
	bl StopBGM
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov80_02235438

	thumb_func_start ov80_0223544C
ov80_0223544C: ; 0x0223544C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r0, [r7]
	ldr r0, [r0]
	bl sub_02096808
	add r5, r0, #0
	add r0, r7, #0
	bl ov80_0222AC58
	add r6, r0, #0
	add r0, r7, #0
	bl ov80_0222BE10
	str r0, [sp]
	add r0, r7, #0
	bl ov80_0222BDF4
	add r4, r0, #0
	ldr r0, [r7]
	ldr r0, [r0]
	bl sub_02096810
	cmp r6, #0x3b
	bgt _022354CC
	add r1, r6, #0
	sub r1, #0x21
	bmi _022354C6
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02235490: ; jump table
	.short _022354FC - _02235490 - 2 ; case 0
	.short _02235504 - _02235490 - 2 ; case 1
	.short _0223550C - _02235490 - 2 ; case 2
	.short _02235514 - _02235490 - 2 ; case 3
	.short _0223553E - _02235490 - 2 ; case 4
	.short _02235546 - _02235490 - 2 ; case 5
	.short _0223554E - _02235490 - 2 ; case 6
	.short _02235524 - _02235490 - 2 ; case 7
	.short _0223552C - _02235490 - 2 ; case 8
	.short _0223557A - _02235490 - 2 ; case 9
	.short _0223551C - _02235490 - 2 ; case 10
	.short _02235536 - _02235490 - 2 ; case 11
	.short _0223557A - _02235490 - 2 ; case 12
	.short _022354D8 - _02235490 - 2 ; case 13
	.short _0223557A - _02235490 - 2 ; case 14
	.short _0223557A - _02235490 - 2 ; case 15
	.short _0223557A - _02235490 - 2 ; case 16
	.short _0223557A - _02235490 - 2 ; case 17
	.short _0223557A - _02235490 - 2 ; case 18
	.short _0223557A - _02235490 - 2 ; case 19
	.short _0223557A - _02235490 - 2 ; case 20
	.short _0223557A - _02235490 - 2 ; case 21
	.short _022354EE - _02235490 - 2 ; case 22
	.short _0223557A - _02235490 - 2 ; case 23
	.short _0223557A - _02235490 - 2 ; case 24
	.short _02235554 - _02235490 - 2 ; case 25
	.short _02235562 - _02235490 - 2 ; case 26
_022354C6:
	cmp r6, #2
	beq _022354D2
	b _0223557A
_022354CC:
	cmp r6, #0x64
	beq _0223556A
	b _0223557A
_022354D2:
	bl sub_0204A68C
	b _0223557E
_022354D8:
	bl sub_0204B068
	strh r0, [r4]
	ldr r0, [r5, #8]
	bl Save_GameStats_Get
	ldrh r2, [r4]
	mov r1, #0x45
	bl GameStats_Add
	b _0223557E
_022354EE:
	ldr r1, [sp]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov80_0223558C
	strh r0, [r4]
	b _0223557E
_022354FC:
	bl sub_0204AC78
	strh r0, [r4]
	b _0223557E
_02235504:
	bl ov80_022358C4
	strh r0, [r4]
	b _0223557E
_0223550C:
	bl sub_0204AC7C
	strh r0, [r4]
	b _0223557E
_02235514:
	bl ov80_022358E8
	strh r0, [r4]
	b _0223557E
_0223551C:
	bl sub_0204B05C
	strh r0, [r4]
	b _0223557E
_02235524:
	ldr r1, [r5, #8]
	bl ov80_022357B4
	b _0223557E
_0223552C:
	ldr r1, [sp]
	bl ov80_02235898
	strh r0, [r4]
	b _0223557E
_02235536:
	ldr r1, [sp]
	bl ov80_022358B0
	b _0223557E
_0223553E:
	ldr r1, [r5, #8]
	bl sub_0204AD04
	b _0223557E
_02235546:
	ldr r1, [r5, #8]
	bl sub_0204AE20
	b _0223557E
_0223554E:
	bl sub_0204AF2C
	b _0223557E
_02235554:
	ldr r1, _02235584 ; =0x00000884
	mov r2, #0x46
	add r0, r0, r1
	mov r1, #0
	bl MI_CpuFill8
	b _0223557E
_02235562:
	ldr r1, _02235588 ; =0x000008D6
	mov r2, #1
	strb r2, [r0, r1]
	b _0223557E
_0223556A:
	cmp r0, #0
	bne _02235574
	mov r0, #1
	strh r0, [r4]
	b _0223557E
_02235574:
	mov r0, #0
	strh r0, [r4]
	b _0223557E
_0223557A:
	bl GF_AssertFail
_0223557E:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02235584: .word 0x00000884
_02235588: .word 0x000008D6
	thumb_func_end ov80_0223544C

	thumb_func_start ov80_0223558C
ov80_0223558C: ; 0x0223558C
	cmp r1, #2
	bne _02235598
	ldrb r0, [r0, #0x10]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1d
	bx lr
_02235598:
	cmp r1, #1
	bne _022355BE
	ldrb r1, [r0, #0xf]
	cmp r1, #2
	bne _022355B0
	ldrb r0, [r0, #0x10]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1d
	lsl r1, r0, #1
	ldr r0, _022355CC ; =ov80_0223C034
	ldrh r0, [r0, r1]
	bx lr
_022355B0:
	ldrb r0, [r0, #0x12]
	cmp r0, #0
	beq _022355BA
	mov r0, #0x61
	bx lr
_022355BA:
	mov r0, #0
	bx lr
_022355BE:
	ldrb r0, [r0, #0x11]
	cmp r0, #0
	beq _022355C8
	mov r0, #0x61
	bx lr
_022355C8:
	mov r0, #0
	bx lr
	.balign 4, 0
_022355CC: .word ov80_0223C034
	thumb_func_end ov80_0223558C

	thumb_func_start ov80_022355D0
ov80_022355D0: ; 0x022355D0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	ldr r1, [r5, #0x1c]
	add r0, r1, #1
	str r0, [r5, #0x1c]
	ldr r0, [r5]
	ldrb r6, [r1]
	ldr r0, [r0]
	bl sub_02096810
	add r4, r0, #0
	bne _022355F4
	mov r0, #0
	pop {r4, r5, r6, pc}
_022355F4:
	ldrb r0, [r4, #0xf]
	bl ov80_02236B18
	lsl r1, r6, #4
	add r1, r6, r1
	add r2, r0, #0
	add r4, #0x90
	lsl r1, r1, #4
	add r0, r5, #0
	add r1, r4, r1
	bl ov80_0222F458
	mov r0, #1
	pop {r4, r5, r6, pc}
	thumb_func_end ov80_022355D0

	thumb_func_start ov80_02235610
ov80_02235610: ; 0x02235610
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096810
	bl sub_0204AA2C
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02235610

	thumb_func_start ov80_02235624
ov80_02235624: ; 0x02235624
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
	bl ov80_0223690C
	add r6, r0, #0
	mov r0, #0x8d
	lsl r0, r0, #4
	str r6, [r4, r0]
	ldr r1, _0223566C ; =0x0000045D
	mov r0, #5
	mov r2, #1
	bl sub_02004EC4
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5]
	ldr r1, _02235670 ; =_020FA484
	ldr r0, [r0]
	add r2, r6, #0
	bl sub_02096820
	mov r0, #1
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0223566C: .word 0x0000045D
_02235670: .word _020FA484
	thumb_func_end ov80_02235624

	thumb_func_start ov80_02235674
ov80_02235674: ; 0x02235674
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096810
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BDF4
	add r6, r0, #0
	mov r0, #0x8d
	lsl r0, r0, #4
	ldr r5, [r4, r0]
	ldr r0, [r5, #0x14]
	bl IsBattleResultWin
	ldr r1, _022356A8 ; =0x000008CC
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	strh r0, [r6]
	add r0, r5, #0
	bl BattleSetup_Delete
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_022356A8: .word 0x000008CC
	thumb_func_end ov80_02235674

	thumb_func_start ov80_022356AC
ov80_022356AC: ; 0x022356AC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_02096808
	add r0, r4, #0
	bl ov80_0222BE10
	add r6, r0, #0
	add r0, r4, #0
	bl ov80_0222BE10
	add r7, r0, #0
	add r0, r4, #0
	bl ov80_0222BDF4
	add r5, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_02096810
	add r4, r0, #0
	cmp r6, #2
	bne _022356E6
	add r1, r7, #0
	bl ov80_02236ABC
	b _022356EA
_022356E6:
	bl GF_AssertFail
_022356EA:
	bl sub_0203769C
	ldr r1, _0223570C ; =0x0000083E
	add r1, r4, r1
	bl sub_02037C0C
	cmp r0, #1
	bne _02235700
	mov r0, #1
	strh r0, [r5]
	b _02235708
_02235700:
	mov r0, #0
	strh r0, [r5]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02235708:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223570C: .word 0x0000083E
	thumb_func_end ov80_022356AC

	thumb_func_start ov80_02235710
ov80_02235710: ; 0x02235710
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0222AC58
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222AC58
	add r1, r5, #0
	add r1, #0x78
	strh r4, [r1]
	add r1, r5, #0
	add r1, #0x7a
	strh r0, [r1]
	ldr r1, _02235738 ; =ov80_0223573C
	add r0, r5, #0
	bl ov80_0222AB84
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02235738: .word ov80_0223573C
	thumb_func_end ov80_02235710

	thumb_func_start ov80_0223573C
ov80_0223573C: ; 0x0223573C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096810
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x7a
	ldrh r0, [r0]
	str r0, [sp]
	add r0, r5, #0
	add r5, #0x78
	ldrh r3, [r5]
	ldr r2, [r4, #8]
	bl ov80_02235774
	cmp r0, #1
	bne _02235770
	mov r0, #1
	pop {r3, r4, r5, pc}
_02235770:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0223573C

	thumb_func_start ov80_02235774
ov80_02235774: ; 0x02235774
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r6, r1, #0
	add r5, r3, #0
	bl sub_0203769C
	mov r1, #1
	sub r0, r1, r0
	bl sub_02037C44
	add r7, r0, #0
	bne _02235790
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02235790:
	add r1, sp, #8
	ldrh r1, [r1, #0x10]
	add r0, r4, #0
	bl ov80_0222BE24
	add r4, r0, #0
	cmp r5, #2
	bne _022357AC
	add r0, r6, #0
	add r1, r7, #0
	bl ov80_02236AD8
	strh r0, [r4]
	b _022357B0
_022357AC:
	bl GF_AssertFail
_022357B0:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_02235774
