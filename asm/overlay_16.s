	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov16_022014A0
ov16_022014A0: ; 0x022014A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r0, #0
	bl ov16_02201840
	str r0, [sp]
	add r0, r7, #0
	mov r1, #0xc0
	bl AllocFromHeap
	str r0, [sp, #4]
	mov r6, #0
	add r5, r0, #0
_022014BA:
	ldr r0, [sp]
	add r1, r6, #0
	add r2, r7, #0
	bl ov16_0220184C
	add r4, r0, #0
	mov r1, #3
	bl ov16_0220185C
	strb r0, [r5]
	add r0, r4, #0
	mov r1, #4
	bl ov16_0220185C
	strb r0, [r5, #1]
	add r0, r4, #0
	mov r1, #2
	bl ov16_0220185C
	strb r0, [r5, #2]
	add r0, r4, #0
	bl FreeToHeap
	add r6, r6, #1
	add r5, r5, #3
	cmp r6, #0x40
	blt _022014BA
	ldr r0, [sp]
	bl ov16_02201854
	ldr r0, [sp, #4]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov16_022014A0

	thumb_func_start ov16_022014FC
ov16_022014FC: ; 0x022014FC
	mov r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	strb r1, [r0, #8]
	strh r1, [r0, #6]
	strb r1, [r0, #9]
	strb r1, [r0, #0xa]
	strb r1, [r0, #0xb]
	bx lr
	.balign 4, 0
	thumb_func_end ov16_022014FC

	thumb_func_start ov16_02201514
ov16_02201514: ; 0x02201514
	ldrb r2, [r0, #0xa]
	ldrb r0, [r0]
	sub r3, r0, #1
	lsl r0, r3, #1
	add r0, r3, r0
	add r0, r1, r0
	ldrb r0, [r0, #2]
	mul r0, r2
	bx lr
	.balign 4, 0
	thumb_func_end ov16_02201514

	thumb_func_start ov16_02201528
ov16_02201528: ; 0x02201528
	sub r3, r1, #1
	lsl r1, r3, #1
	add r1, r3, r1
	ldrb r1, [r0, r1]
	mov r0, #0x3c
	mul r0, r1
	cmp r2, #1
	bne _02201546
	lsl r1, r0, #1
	add r1, r0, r1
	asr r0, r1, #1
	lsr r0, r0, #0x1e
	add r0, r1, r0
	asr r0, r0, #2
	bx lr
_02201546:
	cmp r2, #2
	bne _02201552
	lsr r1, r0, #0x1f
	add r1, r0, r1
	asr r1, r1, #1
	add r0, r0, r1
_02201552:
	bx lr
	thumb_func_end ov16_02201528

	thumb_func_start ov16_02201554
ov16_02201554: ; 0x02201554
	sub r3, r1, #1
	lsl r1, r3, #1
	add r1, r3, r1
	add r0, r0, r1
	ldrb r0, [r0, #1]
	cmp r2, #2
	bne _0220156A
	lsr r1, r0, #0x1f
	add r1, r0, r1
	asr r0, r1, #1
	bx lr
_0220156A:
	cmp r2, #1
	bne _02201576
	lsr r1, r0, #0x1f
	add r1, r0, r1
	asr r1, r1, #1
	add r0, r0, r1
_02201576:
	bx lr
	thumb_func_end ov16_02201554

	thumb_func_start ov16_02201578
ov16_02201578: ; 0x02201578
	ldrb r0, [r0, #0xb]
	cmp r0, #3
	bne _02201582
	mov r0, #6
	bx lr
_02201582:
	mov r0, #4
	bx lr
	.balign 4, 0
	thumb_func_end ov16_02201578

	thumb_func_start ov16_02201588
ov16_02201588: ; 0x02201588
	ldrb r0, [r0, #0xb]
	cmp r0, #4
	bne _02201592
	mov r0, #0xf
	bx lr
_02201592:
	mov r0, #0xa
	bx lr
	.balign 4, 0
	thumb_func_end ov16_02201588

	thumb_func_start ov16_02201598
ov16_02201598: ; 0x02201598
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov16_02201578
	add r4, r0, #0
	add r0, r5, #0
	bl ov16_02201588
	add r1, r4, #3
	mul r0, r1
	add r0, r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov16_02201598

	thumb_func_start ov16_022015B0
ov16_022015B0: ; 0x022015B0
	mov r2, #0xc
	mul r2, r1
	add r0, r0, r2
	ldrb r0, [r0, #1]
	bx lr
	.balign 4, 0
	thumb_func_end ov16_022015B0

	thumb_func_start ov16_022015BC
ov16_022015BC: ; 0x022015BC
	mov r2, #0xc
	mul r2, r1
	ldrb r0, [r0, r2]
	bx lr
	thumb_func_end ov16_022015BC

	thumb_func_start ov16_022015C4
ov16_022015C4: ; 0x022015C4
	mov r2, #0xc
	mul r2, r1
	add r0, r0, r2
	ldrb r0, [r0, #9]
	cmp r0, #0
	bne _022015D4
	mov r0, #0
	bx lr
_022015D4:
	cmp r0, #0x32
	bgt _022015DC
	mov r0, #1
	bx lr
_022015DC:
	mov r0, #2
	bx lr
	thumb_func_end ov16_022015C4

	thumb_func_start ov16_022015E0
ov16_022015E0: ; 0x022015E0
	mov r2, #0xc
	mul r2, r1
	add r0, r0, r2
	ldrb r0, [r0, #9]
	bx lr
	.balign 4, 0
	thumb_func_end ov16_022015E0

	thumb_func_start ov16_022015EC
ov16_022015EC: ; 0x022015EC
	mov r2, #0xc
	mul r2, r1
	add r0, r0, r2
	ldrb r0, [r0, #0xa]
	bx lr
	.balign 4, 0
	thumb_func_end ov16_022015EC

	thumb_func_start ov16_022015F8
ov16_022015F8: ; 0x022015F8
	mov r2, #0xc
	mul r2, r1
	add r0, r0, r2
	ldrh r0, [r0, #2]
	bx lr
	.balign 4, 0
	thumb_func_end ov16_022015F8

	thumb_func_start ov16_02201604
ov16_02201604: ; 0x02201604
	mov r2, #0xc
	mul r2, r1
	add r0, r0, r2
	ldrh r0, [r0, #4]
	bx lr
	.balign 4, 0
	thumb_func_end ov16_02201604

	thumb_func_start ov16_02201610
ov16_02201610: ; 0x02201610
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0xc
	mul r4, r0
	strb r3, [r5, r4]
	mov r0, #1
	add r6, r5, r4
	strb r0, [r6, #1]
	add r0, r2, #0
	ldrb r2, [r6, #0xb]
	add r1, r3, #0
	bl ov16_02201528
	add r1, r6, #0
	strh r0, [r1, #2]
	mov r0, #0
	strh r0, [r1, #4]
	strb r0, [r1, #8]
	strh r0, [r1, #6]
	mov r0, #0x64
	strb r0, [r1, #9]
	mov r0, #5
	strb r0, [r1, #0xa]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov16_02201610

	thumb_func_start ov16_02201644
ov16_02201644: ; 0x02201644
	mov r2, #0xc
	mul r2, r1
	mov r3, #0x64
	add r0, r0, r2
	strb r3, [r0, #9]
	bx lr
	thumb_func_end ov16_02201644

	thumb_func_start ov16_02201650
ov16_02201650: ; 0x02201650
	mov r2, #0xc
	mul r2, r1
	add r0, r0, r2
	ldrb r0, [r0, #0xb]
	bx lr
	.balign 4, 0
	thumb_func_end ov16_02201650

	thumb_func_start ov16_0220165C
ov16_0220165C: ; 0x0220165C
	mov r3, #0xc
	mul r3, r1
	add r0, r0, r3
	strb r2, [r0, #0xb]
	bx lr
	.balign 4, 0
	thumb_func_end ov16_0220165C

	thumb_func_start ov16_02201668
ov16_02201668: ; 0x02201668
	mov r2, #0xc
	mul r2, r1
	add r0, r0, r2
	ldrh r0, [r0, #6]
	bx lr
	.balign 4, 0
	thumb_func_end ov16_02201668

	thumb_func_start ov16_02201674
ov16_02201674: ; 0x02201674
	push {r4, lr}
	mov r2, #0xc
	mul r2, r1
	add r0, r0, r2
	ldrh r4, [r0, #6]
	bl ov16_022014FC
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov16_02201674

	thumb_func_start ov16_02201688
ov16_02201688: ; 0x02201688
	push {r4, lr}
	add r4, r0, #0
	ldrb r2, [r4, #1]
	cmp r2, #5
	bhi _022016F0
	add r3, r2, r2
	add r3, pc
	ldrh r3, [r3, #6]
	lsl r3, r3, #0x10
	asr r3, r3, #0x10
	add pc, r3
_0220169E: ; jump table
	.short _022016AA - _0220169E - 2 ; case 0
	.short _022016B0 - _0220169E - 2 ; case 1
	.short _022016B0 - _0220169E - 2 ; case 2
	.short _022016B0 - _0220169E - 2 ; case 3
	.short _022016B6 - _0220169E - 2 ; case 4
	.short _022016CE - _0220169E - 2 ; case 5
_022016AA:
	bl GF_AssertFail
	pop {r4, pc}
_022016B0:
	add r0, r2, #1
	strb r0, [r4, #1]
	pop {r4, pc}
_022016B6:
	bl ov16_02201514
	strh r0, [r4, #6]
	ldrh r0, [r4, #6]
	cmp r0, #2
	bhs _022016C6
	mov r0, #2
	strh r0, [r4, #6]
_022016C6:
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
	pop {r4, pc}
_022016CE:
	mov r1, #0
	strh r1, [r4, #6]
	mov r1, #2
	strb r1, [r4, #1]
	mov r1, #5
	strb r1, [r4, #0xa]
	ldrb r1, [r4, #8]
	add r1, r1, #1
	strb r1, [r4, #8]
	bl ov16_02201588
	ldrb r1, [r4, #8]
	cmp r1, r0
	bne _022016F0
	add r0, r4, #0
	bl ov16_022014FC
_022016F0:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov16_02201688

	thumb_func_start ov16_022016F4
ov16_022016F4: ; 0x022016F4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrb r0, [r5, #1]
	add r7, r2, #0
	cmp r0, #5
	beq _0220175E
	add r0, r1, #0
	ldrb r1, [r5]
	ldrb r2, [r5, #0xb]
	bl ov16_02201554
	add r6, r0, #0
	ldrh r0, [r5, #4]
	mov r1, #0x3c
	str r0, [sp]
	add r0, r7, r0
	bl _s32_div_f
	add r4, r0, #0
	ldr r0, [sp]
	mov r1, #0x3c
	add r0, r7, r0
	bl _s32_div_f
	strh r1, [r5, #4]
	cmp r4, #0
	beq _0220175E
	ldrb r1, [r5, #9]
	add r0, r6, #0
	mul r0, r4
	cmp r1, r0
	blt _0220173A
	sub r0, r1, r0
	strb r0, [r5, #9]
	pop {r3, r4, r5, r6, r7, pc}
_0220173A:
	cmp r1, #0
	beq _0220174E
	sub r0, r6, #1
	add r0, r1, r0
	add r1, r6, #0
	bl _s32_div_f
	sub r4, r4, r0
	mov r0, #0
	strb r0, [r5, #9]
_0220174E:
	ldrb r0, [r5, #0xa]
	cmp r0, r4
	ble _0220175A
	sub r0, r0, r4
	strb r0, [r5, #0xa]
	pop {r3, r4, r5, r6, r7, pc}
_0220175A:
	mov r0, #0
	strb r0, [r5, #0xa]
_0220175E:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov16_022016F4

	thumb_func_start ov16_02201760
ov16_02201760: ; 0x02201760
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	mov r0, #0
	add r6, r1, #0
	add r7, r2, #0
	str r0, [sp]
_0220176C:
	ldrb r1, [r4]
	cmp r1, #0
	beq _022017EE
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _022017EE
	ldrb r2, [r4, #0xb]
	add r0, r6, #0
	bl ov16_02201528
	add r5, r0, #0
	add r0, r4, #0
	bl ov16_02201598
	mul r0, r5
	cmp r7, r0
	blt _02201796
	add r0, r4, #0
	bl ov16_022014FC
	b _022017EE
_02201796:
	add r5, r7, #0
	b _022017E4
_0220179A:
	ldrh r2, [r4, #2]
	cmp r2, r5
	ble _022017B2
	add r0, r4, #0
	add r1, r6, #0
	add r2, r5, #0
	bl ov16_022016F4
	ldrh r0, [r4, #2]
	sub r0, r0, r5
	strh r0, [r4, #2]
	b _022017EE
_022017B2:
	add r0, r4, #0
	add r1, r6, #0
	bl ov16_022016F4
	add r0, r4, #0
	add r1, r6, #0
	bl ov16_02201688
	ldrh r0, [r4, #2]
	ldrb r1, [r4]
	ldrb r2, [r4, #0xb]
	sub r5, r5, r0
	add r0, r6, #0
	bl ov16_02201528
	strh r0, [r4, #2]
	ldrb r0, [r4, #1]
	cmp r0, #5
	bne _022017E4
	add r0, r4, #0
	bl ov16_02201578
	ldrh r1, [r4, #2]
	mul r0, r1
	strh r0, [r4, #2]
_022017E4:
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _022017EE
	cmp r5, #0
	bne _0220179A
_022017EE:
	ldr r0, [sp]
	add r4, #0xc
	add r0, r0, #1
	str r0, [sp]
	cmp r0, #4
	blt _0220176C
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov16_02201760

	thumb_func_start ov16_022017FC
ov16_022017FC: ; 0x022017FC
	push {r0, r1, r2, r3}
	push {r3, r4}
	add r4, r0, #0
	add r3, sp, #0xc
	add r2, r4, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	add r2, sp, #0x1c
	ldmia r2!, {r0, r1}
	add r4, #0x10
	stmia r4!, {r0, r1}
	ldr r0, [r2]
	str r0, [r4]
	pop {r3, r4}
	add sp, #0x10
	bx lr
	thumb_func_end ov16_022017FC

	thumb_func_start ov16_02201820
ov16_02201820: ; 0x02201820
	push {r4, r5}
	add r5, r0, #0
	add r3, r5, #0
	add r4, r1, #0
	ldmia r3!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r3!, {r0, r1}
	add r5, #0x10
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r5]
	str r0, [r2]
	pop {r4, r5}
	bx lr
	.balign 4, 0
	thumb_func_end ov16_02201820

	thumb_func_start ov16_02201840
ov16_02201840: ; 0x02201840
	ldr r3, _02201848 ; =NARC_ctor
	add r1, r0, #0
	mov r0, #0x42
	bx r3
	.balign 4, 0
_02201848: .word NARC_ctor
	thumb_func_end ov16_02201840

	thumb_func_start ov16_0220184C
ov16_0220184C: ; 0x0220184C
	ldr r3, _02201850 ; =NARC_AllocAndReadWholeMember
	bx r3
	.balign 4, 0
_02201850: .word NARC_AllocAndReadWholeMember
	thumb_func_end ov16_0220184C

	thumb_func_start ov16_02201854
ov16_02201854: ; 0x02201854
	ldr r3, _02201858 ; =NARC_dtor
	bx r3
	.balign 4, 0
_02201858: .word NARC_dtor
	thumb_func_end ov16_02201854

	thumb_func_start ov16_0220185C
ov16_0220185C: ; 0x0220185C
	cmp r1, #0xa
	bhi _022018AE
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0220186C: ; jump table
	.short _02201882 - _0220186C - 2 ; case 0
	.short _02201886 - _0220186C - 2 ; case 1
	.short _0220188A - _0220186C - 2 ; case 2
	.short _0220188E - _0220186C - 2 ; case 3
	.short _02201892 - _0220186C - 2 ; case 4
	.short _02201896 - _0220186C - 2 ; case 5
	.short _0220189A - _0220186C - 2 ; case 6
	.short _0220189E - _0220186C - 2 ; case 7
	.short _022018A2 - _0220186C - 2 ; case 8
	.short _022018A6 - _0220186C - 2 ; case 9
	.short _022018AA - _0220186C - 2 ; case 10
_02201882:
	ldrh r0, [r0]
	bx lr
_02201886:
	ldrb r0, [r0, #2]
	bx lr
_0220188A:
	ldrb r0, [r0, #3]
	bx lr
_0220188E:
	ldrb r0, [r0, #4]
	bx lr
_02201892:
	ldrb r0, [r0, #5]
	bx lr
_02201896:
	ldrb r0, [r0, #6]
	bx lr
_0220189A:
	ldrb r0, [r0, #7]
	bx lr
_0220189E:
	ldrb r0, [r0, #8]
	bx lr
_022018A2:
	ldrb r0, [r0, #9]
	bx lr
_022018A6:
	ldrb r0, [r0, #0xa]
	bx lr
_022018AA:
	ldrb r0, [r0, #0xb]
	bx lr
_022018AE:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov16_0220185C

	thumb_func_start ov16_022018B4
ov16_022018B4: ; 0x022018B4
	cmp r0, #0
	bne _022018BC
	mov r0, #0
	bx lr
_022018BC:
	add r0, #0x94
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
	thumb_func_end ov16_022018B4

	thumb_func_start ov16_022018C4
ov16_022018C4: ; 0x022018C4
	cmp r0, #0
	bne _022018CC
	mov r0, #0
	bx lr
_022018CC:
	sub r0, #0x94
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
	thumb_func_end ov16_022018C4

	thumb_func_start ov16_022018D4
ov16_022018D4: ; 0x022018D4
	cmp r0, #0
	bne _022018DC
	mov r0, #0
	bx lr
_022018DC:
	add r0, #0x5e
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
	thumb_func_end ov16_022018D4

	thumb_func_start ov16_022018E4
ov16_022018E4: ; 0x022018E4
	cmp r0, #0
	bne _022018EC
	mov r0, #0
	bx lr
_022018EC:
	sub r0, #0x5e
	bx lr
	thumb_func_end ov16_022018E4

	thumb_func_start ov16_022018F0
ov16_022018F0: ; 0x022018F0
	push {r3, r4, r5, r6, r7, lr}
	mov r5, #0
	add r6, r0, #0
	add r7, r1, #0
	add r4, r5, #0
_022018FA:
	add r1, r4, #0
	add r1, #0x95
	lsl r1, r1, #0x10
	add r0, r6, #0
	lsr r1, r1, #0x10
	add r2, r7, #0
	bl Bag_GetQuantity
	add r0, r5, r0
	lsl r0, r0, #0x10
	add r4, r4, #1
	lsr r5, r0, #0x10
	cmp r4, #0x40
	blt _022018FA
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov16_022018F0

	thumb_func_start ov16_0220191C
ov16_0220191C: ; 0x0220191C
	push {r3, r4, r5, r6, r7, lr}
	mov r5, #0
	add r6, r0, #0
	add r7, r1, #0
	add r4, r5, #0
_02201926:
	add r1, r4, #0
	add r1, #0x5f
	lsl r1, r1, #0x10
	add r0, r6, #0
	lsr r1, r1, #0x10
	add r2, r7, #0
	bl Bag_GetQuantity
	add r0, r5, r0
	lsl r0, r0, #0x10
	add r4, r4, #1
	lsr r5, r0, #0x10
	cmp r4, #4
	blt _02201926
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov16_0220191C

	thumb_func_start ov16_02201948
ov16_02201948: ; 0x02201948
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _02201968
	bl OverlayManager_run
	cmp r0, #0
	beq _02201968
	ldr r0, [r4]
	bl OverlayManager_delete
	mov r0, #0
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
_02201968:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov16_02201948

	thumb_func_start ov16_0220196C
ov16_0220196C: ; 0x0220196C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _022019B4 ; =SDK_OVERLAY_OVY_17_ID
	mov r1, #2
	bl HandleLoadOverlay
	bl ov17_02201BC0
	mov r2, #2
	mov r0, #3
	mov r1, #0x82
	lsl r2, r2, #0x10
	bl CreateHeap
	add r0, r5, #0
	mov r1, #0x20
	mov r2, #0x82
	bl OverlayManager_CreateAndGetData
	mov r1, #0
	mov r2, #0x20
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #0x82
	str r0, [r4]
	add r0, r5, #0
	bl OverlayManager_GetField18
	str r0, [r4, #4]
	add r0, r4, #0
	bl ov16_02201A34
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_022019B4: .word SDK_OVERLAY_OVY_17_ID
	thumb_func_end ov16_0220196C

	thumb_func_start ov16_022019B8
ov16_022019B8: ; 0x022019B8
	push {r4, lr}
	add r4, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r4]
	cmp r1, #4
	bhi _02201A00
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022019D2: ; jump table
	.short _022019DC - _022019D2 - 2 ; case 0
	.short _022019E4 - _022019D2 - 2 ; case 1
	.short _022019EC - _022019D2 - 2 ; case 2
	.short _022019F4 - _022019D2 - 2 ; case 3
	.short _022019FC - _022019D2 - 2 ; case 4
_022019DC:
	bl ov16_02201A60
	str r0, [r4]
	b _02201A00
_022019E4:
	bl ov16_02201A78
	str r0, [r4]
	b _02201A00
_022019EC:
	bl ov16_02201AA0
	str r0, [r4]
	b _02201A00
_022019F4:
	bl ov16_02201B24
	str r0, [r4]
	b _02201A00
_022019FC:
	mov r0, #1
	pop {r4, pc}
_02201A00:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov16_022019B8

	thumb_func_start ov16_02201A04
ov16_02201A04: ; 0x02201A04
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	bl ov17_02201BC0
	add r0, r4, #0
	bl ov16_02201A4C
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0x82
	bl DestroyHeap
	ldr r0, _02201A30 ; =SDK_OVERLAY_OVY_17_ID
	bl UnloadOverlayByID
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_02201A30: .word SDK_OVERLAY_OVY_17_ID
	thumb_func_end ov16_02201A04

	thumb_func_start ov16_02201A34
ov16_02201A34: ; 0x02201A34
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl BagCursor_new
	str r0, [r4, #0x18]
	ldr r0, [r4]
	bl BagCursor_new
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov16_02201A34

	thumb_func_start ov16_02201A4C
ov16_02201A4C: ; 0x02201A4C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x1c]
	bl FreeToHeap
	ldr r0, [r4, #0x18]
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov16_02201A4C

	thumb_func_start ov16_02201A60
ov16_02201A60: ; 0x02201A60
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02201A74 ; =0x02201B68
	ldr r2, [r4]
	add r1, r4, #0
	bl OverlayManager_new
	str r0, [r4, #8]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_02201A74: .word 0x02201B68
	thumb_func_end ov16_02201A60

	thumb_func_start ov16_02201A78
ov16_02201A78: ; 0x02201A78
	push {r4, lr}
	add r4, r0, #0
	add r0, #8
	bl ov16_02201948
	cmp r0, #0
	bne _02201A8A
	mov r0, #1
	pop {r4, pc}
_02201A8A:
	ldrb r0, [r4, #0x14]
	add r0, #0xff
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _02201A9A
	mov r0, #2
	pop {r4, pc}
_02201A9A:
	mov r0, #4
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov16_02201A78

	thumb_func_start ov16_02201AA0
ov16_02201AA0: ; 0x02201AA0
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl Sav2_Bag_get
	ldrb r1, [r4, #0x14]
	cmp r1, #1
	beq _02201ABA
	cmp r1, #2
	beq _02201ADC
	b _02201AFE
_02201ABA:
	ldr r1, _02201B14 ; =_02201B60
	ldr r2, _02201B18 ; =0x02201BA0
	str r1, [r2]
	ldr r2, [r4]
	bl CreateBagView
	str r0, [r4, #0x10]
	ldr r1, [r4, #4]
	mov r2, #6
	ldr r0, [r1, #4]
	str r0, [sp]
	ldr r0, [r4, #0x10]
	ldr r1, [r1, #0xc]
	ldr r3, [r4, #0x1c]
	bl sub_0207789C
	b _02201B02
_02201ADC:
	ldr r1, _02201B1C ; =0x02201B64
	ldr r2, _02201B18 ; =0x02201BA0
	str r1, [r2]
	ldr r2, [r4]
	bl CreateBagView
	str r0, [r4, #0x10]
	ldr r1, [r4, #4]
	mov r2, #6
	ldr r0, [r1, #4]
	str r0, [sp]
	ldr r0, [r4, #0x10]
	ldr r1, [r1, #0xc]
	ldr r3, [r4, #0x18]
	bl sub_0207789C
	b _02201B02
_02201AFE:
	bl GF_AssertFail
_02201B02:
	ldr r0, _02201B20 ; =0x02201B78
	ldr r1, [r4, #0x10]
	ldr r2, [r4]
	bl OverlayManager_new
	str r0, [r4, #8]
	mov r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_02201B14: .word _02201B60
_02201B18: .word 0x02201BA0
_02201B1C: .word 0x02201B64
_02201B20: .word 0x02201B78
	thumb_func_end ov16_02201AA0

	thumb_func_start ov16_02201B24
ov16_02201B24: ; 0x02201B24
	push {r4, lr}
	add r4, r0, #0
	add r0, #8
	bl ov16_02201948
	cmp r0, #0
	bne _02201B36
	mov r0, #3
	pop {r4, pc}
_02201B36:
	ldr r0, [r4, #0x10]
	bl sub_0207790C
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #4
	bne _02201B4C
	ldr r0, [r4, #0x10]
	bl sub_02077904
	b _02201B4E
_02201B4C:
	ldr r0, _02201B5C ; =0x0000FFFF
_02201B4E:
	strh r0, [r4, #0x16]
	ldr r0, [r4, #0x10]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x10]
	pop {r4, pc}
	.balign 4, 0
_02201B5C: .word 0x0000FFFF
	thumb_func_end ov16_02201B24

	.rodata

_02201B60:
	.byte 0x00, 0xFF, 0x00, 0x00, 0x04, 0xFF, 0x00, 0x00, 0x11, 0x1C, 0x20, 0x02, 0x79, 0x1C, 0x20, 0x02
	.byte 0x05, 0x1D, 0x20, 0x02, 0xFF, 0xFF, 0xFF, 0xFF, 0x81, 0x93, 0x1F, 0x02, 0x09, 0x96, 0x1F, 0x02
	.byte 0x2D, 0x98, 0x1F, 0x02, 0x0F, 0x00, 0x00, 0x00,

	.data

_02201BA0:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	; 0x02201BC0
