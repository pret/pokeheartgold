	.include "asm/macros.inc"
	.include "overlay_80_0222F608.inc"
	.include "global.inc"

    .text

	thumb_func_start ov80_0222F608
ov80_0222F608: ; 0x0222F608
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ov80_0222BE10
	add r7, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	lsl r2, r4, #0x18
	lsl r3, r6, #0x18
	ldr r0, [r0, #8]
	add r1, r7, #0
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl ov80_0222FD08
	add r1, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096818
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_0222F608

	thumb_func_start ov80_0222F648
ov80_0222F648: ; 0x0222F648
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0222BE10
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096810
	add r1, r4, #0
	bl ov80_0222FEEC
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222F648

	thumb_func_start ov80_0222F664
ov80_0222F664: ; 0x0222F664
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096810
	bl ov80_02230424
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222F664

	thumb_func_start ov80_0222F678
ov80_0222F678: ; 0x0222F678
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_02096808
	add r7, r0, #0
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_02096810
	add r5, r0, #0
	mov r0, #0xb
	mov r1, #0x24
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x24
	add r4, r0, #0
	bl MI_CpuFill8
	ldr r0, [r7, #8]
	mov r3, #0
	str r0, [r4]
	ldrb r0, [r5, #4]
	add r2, r4, #0
	strb r0, [r4, #4]
	ldrb r0, [r5, #5]
	strb r0, [r4, #5]
	ldr r0, _0222F6D4 ; =0x000004D4
	strb r3, [r4, #6]
	ldr r1, [r5, r0]
	add r0, r0, #4
	str r1, [r4, #8]
	ldr r0, [r5, r0]
	ldr r1, _0222F6D8 ; =ov80_0223BDB4
	str r0, [r4, #0xc]
	ldr r0, _0222F6DC ; =ov80_0222F7CC
	str r5, [r4, #0x1c]
	str r0, [sp]
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_02096820
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222F6D4: .word 0x000004D4
_0222F6D8: .word ov80_0223BDB4
_0222F6DC: .word ov80_0222F7CC
	thumb_func_end ov80_0222F678

	thumb_func_start ov80_0222F6E0
ov80_0222F6E0: ; 0x0222F6E0
	push {r3, r4, r5, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096810
	add r4, r0, #0
	ldr r0, _0222F704 ; =0x000004FC
	ldr r5, [r4, r0]
	ldr r0, [r5, #0x14]
	bl IsBattleResultWin
	str r0, [r4, #0x14]
	add r0, r5, #0
	bl BattleSetup_Delete
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0222F704: .word 0x000004FC
	thumb_func_end ov80_0222F6E0

	thumb_func_start ov80_0222F708
ov80_0222F708: ; 0x0222F708
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
	bl ov80_02236F24
	add r2, r0, #0
	ldr r0, _0222F744 ; =0x000004FC
	mov r3, #0
	str r2, [r4, r0]
	str r3, [sp]
	ldr r0, [r5]
	ldr r1, _0222F748 ; =_020FA484
	ldr r0, [r0]
	bl sub_02096820
	mov r0, #1
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_0222F744: .word 0x000004FC
_0222F748: .word _020FA484
	thumb_func_end ov80_0222F708

	thumb_func_start ov80_0222F74C
ov80_0222F74C: ; 0x0222F74C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_02096808
	add r7, r0, #0
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_02096810
	add r5, r0, #0
	mov r2, #0
	ldr r0, _0222F7BC ; =0x000004DC
	add r3, r5, #0
	add r1, r2, #0
_0222F76C:
	add r2, r2, #1
	strh r1, [r3, r0]
	add r3, r3, #2
	cmp r2, #6
	blt _0222F76C
	mov r0, #0xb
	mov r1, #0x24
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x24
	add r4, r0, #0
	bl MI_CpuFill8
	ldr r0, [r7, #8]
	add r2, r4, #0
	str r0, [r4]
	ldrb r0, [r5, #4]
	mov r3, #0
	strb r0, [r4, #4]
	ldrb r0, [r5, #5]
	strb r0, [r4, #5]
	mov r0, #1
	strb r0, [r4, #6]
	ldr r0, _0222F7C0 ; =0x000004D4
	ldr r1, [r5, r0]
	add r0, r0, #4
	str r1, [r4, #8]
	ldr r0, [r5, r0]
	ldr r1, _0222F7C4 ; =ov80_0223BDC4
	str r0, [r4, #0xc]
	ldr r0, _0222F7C8 ; =ov80_0222F7CC
	str r5, [r4, #0x1c]
	str r0, [sp]
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_02096820
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222F7BC: .word 0x000004DC
_0222F7C0: .word 0x000004D4
_0222F7C4: .word ov80_0223BDC4
_0222F7C8: .word ov80_0222F7CC
	thumb_func_end ov80_0222F74C

	thumb_func_start ov80_0222F7CC
ov80_0222F7CC: ; 0x0222F7CC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x1c]
	add r1, r4, #0
	bl ov80_02230460
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov80_0222F7CC

	thumb_func_start ov80_0222F7E0
ov80_0222F7E0: ; 0x0222F7E0
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096810
	bl ov80_022307F0
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222F7E0

	thumb_func_start ov80_0222F7F4
ov80_0222F7F4: ; 0x0222F7F4
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096810
	bl ov80_022308C4
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222F7F4

	thumb_func_start ov80_0222F808
ov80_0222F808: ; 0x0222F808
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096810
	bl ov80_022309F8
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222F808

	thumb_func_start ov80_0222F81C
ov80_0222F81C: ; 0x0222F81C
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096810
	bl ov80_02230A60
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222F81C

	thumb_func_start ov80_0222F830
ov80_0222F830: ; 0x0222F830
	push {r4, r5, r6, r7, lr}
	sub sp, #0x6c
	add r6, r0, #0
	ldr r2, [r6, #0x1c]
	add r1, r2, #1
	str r1, [r6, #0x1c]
	ldrb r7, [r2]
	add r2, r1, #1
	str r2, [r6, #0x1c]
	ldrb r5, [r1]
	add r1, r2, #1
	str r1, [r6, #0x1c]
	ldrb r1, [r2]
	str r1, [sp, #0x1c]
	bl ov80_0222BDF4
	str r0, [sp, #0x18]
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_02096810
	add r4, r0, #0
	ldr r0, [r6]
	bl ov80_0222AB34
	str r0, [sp, #0x20]
	cmp r7, #0x29
	bhi _0222F8F2
	add r0, r7, r7
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222F874: ; jump table
	.short _0222F8C8 - _0222F874 - 2 ; case 0
	.short _0222F8CC - _0222F874 - 2 ; case 1
	.short _0222F8D0 - _0222F874 - 2 ; case 2
	.short _0222F8D4 - _0222F874 - 2 ; case 3
	.short _0222F8E2 - _0222F874 - 2 ; case 4
	.short _0222F8EA - _0222F874 - 2 ; case 5
	.short _0222FBE6 - _0222F874 - 2 ; case 6
	.short _0222F8FA - _0222F874 - 2 ; case 7
	.short _0222FBE6 - _0222F874 - 2 ; case 8
	.short _0222F902 - _0222F874 - 2 ; case 9
	.short _0222F910 - _0222F874 - 2 ; case 10
	.short _0222FBE6 - _0222F874 - 2 ; case 11
	.short _0222FBE6 - _0222F874 - 2 ; case 12
	.short _0222FBE6 - _0222F874 - 2 ; case 13
	.short _0222F91A - _0222F874 - 2 ; case 14
	.short _0222F926 - _0222F874 - 2 ; case 15
	.short _0222F93C - _0222F874 - 2 ; case 16
	.short _0222F954 - _0222F874 - 2 ; case 17
	.short _0222F98C - _0222F874 - 2 ; case 18
	.short _0222FA4C - _0222F874 - 2 ; case 19
	.short _0222FA58 - _0222F874 - 2 ; case 20
	.short _0222FA66 - _0222F874 - 2 ; case 21
	.short _0222FA6E - _0222F874 - 2 ; case 22
	.short _0222FA76 - _0222F874 - 2 ; case 23
	.short _0222FA82 - _0222F874 - 2 ; case 24
	.short _0222FBE6 - _0222F874 - 2 ; case 25
	.short _0222FA8C - _0222F874 - 2 ; case 26
	.short _0222FA96 - _0222F874 - 2 ; case 27
	.short _0222FA9E - _0222F874 - 2 ; case 28
	.short _0222FAAA - _0222F874 - 2 ; case 29
	.short _0222FAB2 - _0222F874 - 2 ; case 30
	.short _0222FAD6 - _0222F874 - 2 ; case 31
	.short _0222FAEE - _0222F874 - 2 ; case 32
	.short _0222FB06 - _0222F874 - 2 ; case 33
	.short _0222FB34 - _0222F874 - 2 ; case 34
	.short _0222FB64 - _0222F874 - 2 ; case 35
	.short _0222FB70 - _0222F874 - 2 ; case 36
	.short _0222FB78 - _0222F874 - 2 ; case 37
	.short _0222FBA0 - _0222F874 - 2 ; case 38
	.short _0222FBA8 - _0222F874 - 2 ; case 39
	.short _0222FBD4 - _0222F874 - 2 ; case 40
	.short _0222FBDC - _0222F874 - 2 ; case 41
_0222F8C8:
	strb r5, [r4, #7]
	b _0222FBE6
_0222F8CC:
	strb r5, [r4, #5]
	b _0222FBE6
_0222F8D0:
	strb r5, [r4, #4]
	b _0222FBE6
_0222F8D4:
	lsl r0, r5, #1
	add r1, r4, r0
	ldr r0, _0222FBEC ; =0x000004DC
	ldrh r1, [r1, r0]
	ldr r0, [sp, #0x18]
	strh r1, [r0]
	b _0222FBE6
_0222F8E2:
	ldrh r1, [r4, #0xc]
	ldr r0, [sp, #0x18]
	strh r1, [r0]
	b _0222FBE6
_0222F8EA:
	ldrh r1, [r4, #0xc]
	ldr r0, _0222FBF0 ; =0x0000270F
	cmp r1, r0
	blo _0222F8F4
_0222F8F2:
	b _0222FBE6
_0222F8F4:
	add r0, r1, #1
	strh r0, [r4, #0xc]
	b _0222FBE6
_0222F8FA:
	mov r0, #0
	bl OS_ResetSystem
	b _0222FBE6
_0222F902:
	ldr r0, _0222FBF4 ; =0x000004F4
	ldr r0, [r4, r0]
	bl sub_0203095C
	ldr r1, [sp, #0x18]
	strh r0, [r1]
	b _0222FBE6
_0222F910:
	add r0, r4, #0
	mov r1, #2
	bl ov80_0223049C
	b _0222FBE6
_0222F91A:
	add r0, r4, #0
	bl ov80_02230784
	ldr r1, [sp, #0x18]
	strh r0, [r1]
	b _0222FBE6
_0222F926:
	mov r0, #0x38
	mul r0, r5
	add r1, r4, r0
	mov r0, #0x3f
	lsl r0, r0, #4
	ldrh r0, [r1, r0]
	lsl r0, r0, #0x15
	lsr r1, r0, #0x15
	ldr r0, [sp, #0x18]
	strh r1, [r0]
	b _0222FBE6
_0222F93C:
	mov r0, #0x38
	mul r0, r5
	add r1, r4, r0
	ldr r0, [sp, #0x1c]
	lsl r0, r0, #1
	add r1, r1, r0
	mov r0, #0xfd
	lsl r0, r0, #2
	ldrh r1, [r1, r0]
	ldr r0, [sp, #0x18]
	strh r1, [r0]
	b _0222FBE6
_0222F954:
	mov r0, #0xb
	bl AllocMonZeroed
	add r6, r0, #0
	add r0, r4, #0
	bl ov80_02237120
	add r2, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #4
	add r1, r4, r0
	mov r0, #0x38
	mul r0, r5
	add r0, r1, r0
	add r1, r6, #0
	bl ov80_0222A140
	add r0, r6, #0
	mov r1, #0xb1
	mov r2, #0
	bl GetMonData
	ldr r1, [sp, #0x18]
	strh r0, [r1]
	add r0, r6, #0
	bl FreeToHeap
	b _0222FBE6
_0222F98C:
	ldrb r0, [r4, #4]
	mov r1, #1
	bl ov80_02236DF8
	mov r1, #0
	str r0, [sp, #0x14]
	add r2, sp, #0x24
	add r0, r1, #0
_0222F99C:
	add r1, r1, #1
	stmia r2!, {r0}
	cmp r1, #0x12
	blt _0222F99C
	mov r0, #0xb
	bl AllocMonZeroed
	add r5, r0, #0
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	cmp r0, #0
	ble _0222FA12
	mov r0, #0x3f
	lsl r0, r0, #4
	add r6, r4, r0
_0222F9BC:
	add r0, r4, #0
	bl ov80_02237120
	add r2, r0, #0
	add r0, r6, #0
	add r1, r5, #0
	bl ov80_0222A140
	add r0, r5, #0
	mov r1, #0xb1
	mov r2, #0
	bl GetMonData
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #0xb2
	mov r2, #0
	bl GetMonData
	cmp r7, r0
	bne _0222F9E8
	mov r0, #0xff
_0222F9E8:
	lsl r1, r7, #2
	add r2, sp, #0x24
	ldr r2, [r2, r1]
	add r3, r2, #1
	add r2, sp, #0x24
	str r3, [r2, r1]
	cmp r0, #0xff
	beq _0222FA04
	lsl r0, r0, #2
	add r1, r2, #0
	ldr r1, [r1, r0]
	add r2, r1, #1
	add r1, sp, #0x24
	str r2, [r1, r0]
_0222FA04:
	ldr r0, [sp, #0x10]
	add r6, #0x38
	add r1, r0, #1
	ldr r0, [sp, #0x14]
	str r1, [sp, #0x10]
	cmp r1, r0
	blt _0222F9BC
_0222FA12:
	add r0, r5, #0
	bl FreeToHeap
	mov r0, #0
	add r4, sp, #0x24
	add r5, r0, #0
	add r3, r4, #0
_0222FA20:
	lsl r1, r0, #2
	ldr r2, [r3, r1]
	ldr r1, [r4]
	cmp r2, r1
	bge _0222FA2C
	add r0, r5, #0
_0222FA2C:
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #0x12
	blt _0222FA20
	lsl r2, r0, #2
	add r1, sp, #0x24
	ldr r1, [r1, r2]
	cmp r1, #1
	bgt _0222FA46
	ldr r0, [sp, #0x18]
	mov r1, #0xff
	strh r1, [r0]
	b _0222FBE6
_0222FA46:
	ldr r1, [sp, #0x18]
	strh r0, [r1]
	b _0222FBE6
_0222FA4C:
	add r0, r4, #0
	bl ov80_022372B4
	ldr r1, [sp, #0x18]
	strh r0, [r1]
	b _0222FBE6
_0222FA58:
	add r0, r4, #0
	add r1, r5, #0
	bl ov80_02230794
	ldr r1, [sp, #0x18]
	strh r0, [r1]
	b _0222FBE6
_0222FA66:
	add r0, r4, #0
	bl ov80_022307C8
	b _0222FBE6
_0222FA6E:
	add r0, r4, #0
	bl ov80_022307D4
	b _0222FBE6
_0222FA76:
	add r0, r4, #0
	bl ov80_02230790
	ldr r1, [sp, #0x18]
	strh r0, [r1]
	b _0222FBE6
_0222FA82:
	ldr r0, _0222FBF8 ; =0x0000057C
	ldrb r1, [r4, r0]
	ldr r0, [sp, #0x18]
	strh r1, [r0]
	b _0222FBE6
_0222FA8C:
	ldr r0, _0222FBFC ; =0x0000057D
	ldrb r1, [r4, r0]
	ldr r0, [sp, #0x18]
	strh r1, [r0]
	b _0222FBE6
_0222FA96:
	add r0, r4, #0
	bl sub_02096910
	b _0222FBE6
_0222FA9E:
	ldrb r0, [r4, #4]
	bl ov80_02237254
	ldr r1, [sp, #0x18]
	strh r0, [r1]
	b _0222FBE6
_0222FAAA:
	ldrb r1, [r4, #4]
	ldr r0, [sp, #0x18]
	strh r1, [r0]
	b _0222FBE6
_0222FAB2:
	mov r0, #0x1a
	str r0, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	mov r1, #3
	ldr r0, [sp, #0x20]
	str r5, [sp, #8]
	ldr r0, [r0]
	add r2, r1, #0
	mov r3, #0xa
	bl BgTilemapRectChangePalette
	ldr r0, [sp, #0x20]
	mov r1, #3
	ldr r0, [r0]
	bl ScheduleBgTilemapBufferTransfer
	b _0222FBE6
_0222FAD6:
	ldr r0, [r6]
	bl ov80_0222AB34
	add r1, r0, #0
	ldr r0, _0222FC00 ; =ov80_0222FC08
	mov r2, #5
	bl CreateSysTask
	mov r1, #5
	lsl r1, r1, #8
	str r0, [r4, r1]
	b _0222FBE6
_0222FAEE:
	mov r0, #5
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222FBE6
	bl DestroySysTask
	mov r0, #5
	mov r1, #0
	lsl r0, r0, #8
	str r1, [r4, r0]
	b _0222FBE6
_0222FB06:
	ldrb r1, [r4, #6]
	add r0, r4, #0
	add r0, #0x34
	lsl r1, r1, #1
	add r1, r4, r1
	ldrh r1, [r1, #0x18]
	mov r2, #0xb
	mov r3, #0xcc
	bl ov80_0222A474
	ldrb r1, [r4, #6]
	mov r0, #0x51
	lsl r0, r0, #2
	add r1, r1, #7
	lsl r1, r1, #1
	add r1, r4, r1
	ldrh r1, [r1, #0x18]
	add r0, r4, r0
	mov r2, #0xb
	mov r3, #0xcc
	bl ov80_0222A474
	b _0222FBE6
_0222FB34:
	ldrb r0, [r4, #4]
	bl ov80_02236DD4
	add r7, r0, #0
	mov r5, #0
	cmp r7, #0
	ble _0222FBE6
_0222FB42:
	ldr r0, _0222FC04 ; =0x000004D4
	add r1, r5, #0
	ldr r0, [r4, r0]
	bl Party_GetMonByIndex
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, [r6]
	add r1, r5, #0
	ldr r0, [r0, #0x44]
	bl BufferBoxMonSpeciesName
	add r5, r5, #1
	cmp r5, r7
	blt _0222FB42
	b _0222FBE6
_0222FB64:
	add r0, r4, #0
	bl ov80_02230B4C
	ldr r1, [sp, #0x18]
	strh r0, [r1]
	b _0222FBE6
_0222FB70:
	add r0, r4, #0
	bl ov80_02230AE4
	b _0222FBE6
_0222FB78:
	ldr r0, [sp, #0x18]
	mov r1, #0
	strh r1, [r0]
	ldrb r0, [r4, #4]
	cmp r0, #0
	bne _0222FBE6
	ldrh r0, [r4, #0xc]
	add r0, r0, #1
	cmp r0, #0x15
	bne _0222FB94
	ldr r0, [sp, #0x18]
	mov r1, #1
	strh r1, [r0]
	b _0222FBE6
_0222FB94:
	cmp r0, #0x31
	bne _0222FBE6
	ldr r0, [sp, #0x18]
	mov r1, #2
	strh r1, [r0]
	b _0222FBE6
_0222FBA0:
	add r0, r4, #0
	bl ov80_022371B0
	b _0222FBE6
_0222FBA8:
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	mov r3, #0x3f
	lsl r3, r3, #4
	str r0, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	mov r0, #0xcd
	add r1, r3, #0
	add r2, r3, #0
	str r0, [sp, #0xc]
	add r0, r4, r3
	sub r1, #0x1e
	sub r2, #0x16
	sub r3, #0x10
	add r1, r4, r1
	add r2, r4, r2
	add r3, r4, r3
	bl ov80_0222A52C
	b _0222FBE6
_0222FBD4:
	add r0, r4, #0
	bl ov80_02237130
	b _0222FBE6
_0222FBDC:
	ldrb r1, [r4, #0xb]
	ldr r0, [sp, #0x18]
	strh r1, [r0]
	mov r0, #1
	strb r0, [r4, #0xb]
_0222FBE6:
	mov r0, #0
	add sp, #0x6c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222FBEC: .word 0x000004DC
_0222FBF0: .word 0x0000270F
_0222FBF4: .word 0x000004F4
_0222FBF8: .word 0x0000057C
_0222FBFC: .word 0x0000057D
_0222FC00: .word ov80_0222FC08
_0222FC04: .word 0x000004D4
	thumb_func_end ov80_0222F830

	thumb_func_start ov80_0222FC08
ov80_0222FC08: ; 0x0222FC08
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4]
	mov r1, #2
	bl Bg_GetYpos
	cmp r0, #0xff
	ldr r0, [r4]
	blt _0222FC26
	mov r1, #2
	mov r2, #3
	mov r3, #0
	bl ScheduleSetBgPosText
	pop {r4, pc}
_0222FC26:
	mov r1, #2
	mov r2, #4
	mov r3, #1
	bl ScheduleSetBgPosText
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0222FC08

	thumb_func_start ov80_0222FC34
ov80_0222FC34: ; 0x0222FC34
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
	thumb_func_end ov80_0222FC34

	thumb_func_start ov80_0222FC50
ov80_0222FC50: ; 0x0222FC50
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
	bl ov80_02230AF8
	strh r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_0222FC50

	thumb_func_start ov80_0222FC80
ov80_0222FC80: ; 0x0222FC80
	push {r4, lr}
	add r4, r0, #0
	bl ov80_0222AC58
	add r1, r4, #0
	add r1, #0x78
	strh r0, [r1]
	ldr r1, _0222FC9C ; =ov80_0222FCA0
	add r0, r4, #0
	bl ov80_0222AB84
	mov r0, #1
	pop {r4, pc}
	nop
_0222FC9C: .word ov80_0222FCA0
	thumb_func_end ov80_0222FC80

	thumb_func_start ov80_0222FCA0
ov80_0222FCA0: ; 0x0222FCA0
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x78
	ldrh r1, [r1]
	bl ov80_0222BE9C
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_02096810
	ldr r1, _0222FCCC ; =0x00000702
	ldrb r2, [r0, r1]
	cmp r2, #2
	blo _0222FCC6
	mov r2, #0
	strb r2, [r0, r1]
	mov r0, #1
	pop {r4, pc}
_0222FCC6:
	mov r0, #0
	pop {r4, pc}
	nop
_0222FCCC: .word 0x00000702
	thumb_func_end ov80_0222FCA0

	thumb_func_start ov80_0222FCD0
ov80_0222FCD0: ; 0x0222FCD0
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
	bne _0222FCF4
	mov r0, #0
	pop {r3, r4, r5, pc}
_0222FCF4:
	lsl r1, r4, #4
	add r1, r4, r1
	add r2, #0x4c
	lsl r1, r1, #4
	add r0, r5, #0
	add r1, r2, r1
	bl ov80_0222F44C
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222FCD0
