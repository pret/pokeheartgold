	.include "asm/macros.inc"
	.include "unk_0202D230.inc"
	.include "global.inc"

	.rodata

_020F682C:
	.byte 0x00, 0x00, 0x04, 0xFF
	.short 0x0007, 0x0000
	.byte 0x01, 0x00, 0x04, 0xFF
	.short 0x0021, 0x0000
	.byte 0x02, 0x00, 0x08, 0xFF
	.short 0x000A, 0x0000
	.byte 0x01, 0x04, 0x04, 0xFF
	.short 0x0001, 0x0000

	.text

	thumb_func_start sub_0202D230
sub_0202D230: ; 0x0202D230
	mov r0, #0xe4
	bx lr
	thumb_func_end sub_0202D230

	thumb_func_start sub_0202D234
sub_0202D234: ; 0x0202D234
	ldr r3, _0202D23C ; =MI_CpuFill8
	mov r1, #0
	mov r2, #0x3c
	bx r3
	.balign 4, 0
_0202D23C: .word MI_CpuFill8
	thumb_func_end sub_0202D234

	thumb_func_start sub_0202D240
sub_0202D240: ; 0x0202D240
	push {r4, lr}
	mov r2, #0x5a
	mov r1, #0
	lsl r2, r2, #2
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #1
	strb r0, [r4, #3]
	pop {r4, pc}
	thumb_func_end sub_0202D240

	thumb_func_start sub_0202D254
sub_0202D254: ; 0x0202D254
	push {r4, r5, r6, lr}
	ldr r4, _0202D270 ; =_020F682C
	add r5, r0, #0
	mov r6, #0
_0202D25C:
	add r0, r5, #0
	add r1, r4, #0
	bl MailMsg_Init_FromTemplate
	add r6, r6, #1
	add r4, #8
	add r5, #8
	cmp r6, #4
	blt _0202D25C
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0202D270: .word _020F682C
	thumb_func_end sub_0202D254

	thumb_func_start sub_0202D274
sub_0202D274: ; 0x0202D274
	ldr r3, _0202D27C ; =MI_CpuFill8
	mov r1, #0
	ldr r2, _0202D280 ; =0x00000B3C
	bx r3
	.balign 4, 0
_0202D27C: .word MI_CpuFill8
_0202D280: .word 0x00000B3C
	thumb_func_end sub_0202D274

	thumb_func_start sub_0202D284
sub_0202D284: ; 0x0202D284
	push {r3, lr}
	cmp r1, #0xa
	bhi _0202D302
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0202D296: ; jump table
	.short _0202D2AC - _0202D296 - 2 ; case 0
	.short _0202D2B4 - _0202D296 - 2 ; case 1
	.short _0202D2B8 - _0202D296 - 2 ; case 2
	.short _0202D2BC - _0202D296 - 2 ; case 3
	.short _0202D2C0 - _0202D296 - 2 ; case 4
	.short _0202D2C4 - _0202D296 - 2 ; case 5
	.short _0202D2D2 - _0202D296 - 2 ; case 6
	.short _0202D2E0 - _0202D296 - 2 ; case 7
	.short _0202D2E8 - _0202D296 - 2 ; case 8
	.short _0202D2F6 - _0202D296 - 2 ; case 9
	.short _0202D2FE - _0202D296 - 2 ; case 10
_0202D2AC:
	ldrb r0, [r0]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1d
	pop {r3, pc}
_0202D2B4:
	ldrb r0, [r0, #2]
	pop {r3, pc}
_0202D2B8:
	ldrb r0, [r0, #3]
	pop {r3, pc}
_0202D2BC:
	ldrh r0, [r0, #4]
	pop {r3, pc}
_0202D2C0:
	ldrh r0, [r0, #6]
	pop {r3, pc}
_0202D2C4:
	add r1, r2, #0
	add r0, #8
	mov r2, #4
	bl MI_CpuCopy8
	mov r0, #0
	pop {r3, pc}
_0202D2D2:
	add r1, r2, #0
	add r0, #0x2c
	mov r2, #0x10
	bl MI_CpuCopy8
	mov r0, #0
	pop {r3, pc}
_0202D2E0:
	ldrb r0, [r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	pop {r3, pc}
_0202D2E8:
	add r1, r2, #0
	add r0, #0xc
	mov r2, #0x1c
	bl MI_CpuCopy8
	mov r0, #0
	pop {r3, pc}
_0202D2F6:
	ldrb r0, [r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1d
	pop {r3, pc}
_0202D2FE:
	ldr r0, [r0, #0x28]
	pop {r3, pc}
_0202D302:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0202D284

	thumb_func_start sub_0202D308
sub_0202D308: ; 0x0202D308
	push {r4, lr}
	add r3, r0, #0
	cmp r1, #0xa
	bhi _0202D3AE
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0202D31C: ; jump table
	.short _0202D332 - _0202D31C - 2 ; case 0
	.short _0202D344 - _0202D31C - 2 ; case 1
	.short _0202D34A - _0202D31C - 2 ; case 2
	.short _0202D350 - _0202D31C - 2 ; case 3
	.short _0202D356 - _0202D31C - 2 ; case 4
	.short _0202D35C - _0202D31C - 2 ; case 5
	.short _0202D36A - _0202D31C - 2 ; case 6
	.short _0202D378 - _0202D31C - 2 ; case 7
	.short _0202D38A - _0202D31C - 2 ; case 8
	.short _0202D39E - _0202D31C - 2 ; case 9
	.short _0202D398 - _0202D31C - 2 ; case 10
_0202D332:
	ldrb r1, [r3]
	mov r0, #0x1c
	bic r1, r0
	ldrb r0, [r2]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1b
	orr r0, r1
	strb r0, [r3]
	pop {r4, pc}
_0202D344:
	ldrb r0, [r2]
	strb r0, [r3, #2]
	pop {r4, pc}
_0202D34A:
	ldrb r0, [r2]
	strb r0, [r3, #3]
	pop {r4, pc}
_0202D350:
	ldrh r0, [r2]
	strh r0, [r3, #4]
	pop {r4, pc}
_0202D356:
	ldrh r0, [r2]
	strh r0, [r3, #6]
	pop {r4, pc}
_0202D35C:
	add r3, #8
	add r0, r2, #0
	add r1, r3, #0
	mov r2, #4
	bl MI_CpuCopy8
	pop {r4, pc}
_0202D36A:
	add r3, #0x2c
	add r0, r2, #0
	add r1, r3, #0
	mov r2, #0x10
	bl MI_CpuCopy8
	pop {r4, pc}
_0202D378:
	ldrb r4, [r3]
	ldrb r1, [r2]
	mov r0, #1
	bic r4, r0
	mov r0, #1
	and r0, r1
	orr r0, r4
	strb r0, [r3]
	pop {r4, pc}
_0202D38A:
	add r3, #0xc
	add r0, r2, #0
	add r1, r3, #0
	mov r2, #0x1c
	bl MI_CpuCopy8
	pop {r4, pc}
_0202D398:
	ldr r0, [r2]
	str r0, [r3, #0x28]
	pop {r4, pc}
_0202D39E:
	ldrb r1, [r3]
	mov r0, #0xe0
	bic r1, r0
	ldrb r0, [r2]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x18
	orr r0, r1
	strb r0, [r3]
_0202D3AE:
	pop {r4, pc}
	thumb_func_end sub_0202D308

	thumb_func_start sub_0202D3B0
sub_0202D3B0: ; 0x0202D3B0
	push {r3, r4}
	ldrb r4, [r0, #3]
	add r1, r4, r1
	cmp r1, #0xff
	bge _0202D3BC
	strb r1, [r0, #3]
_0202D3BC:
	ldrh r1, [r0, #4]
	add r2, r1, r2
	ldr r1, _0202D3D8 ; =0x0000FFFF
	cmp r2, r1
	bge _0202D3C8
	strh r2, [r0, #4]
_0202D3C8:
	ldrh r1, [r0, #6]
	add r2, r1, r3
	ldr r1, _0202D3D8 ; =0x0000FFFF
	cmp r2, r1
	bge _0202D3D4
	strh r2, [r0, #6]
_0202D3D4:
	pop {r3, r4}
	bx lr
	.balign 4, 0
_0202D3D8: .word 0x0000FFFF
	thumb_func_end sub_0202D3B0

	thumb_func_start sub_0202D3DC
sub_0202D3DC: ; 0x0202D3DC
	ldrb r0, [r0]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	bx lr
	thumb_func_end sub_0202D3DC

	thumb_func_start sub_0202D3E4
sub_0202D3E4: ; 0x0202D3E4
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1f
	ldrb r3, [r0]
	mov r2, #2
	lsr r1, r1, #0x1e
	bic r3, r2
	orr r1, r3
	strb r1, [r0]
	bx lr
	thumb_func_end sub_0202D3E4

	thumb_func_start FrontierData_BattlePointAction
FrontierData_BattlePointAction: ; 0x0202D3F8
	cmp r2, #6
	bhi _0202D446
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0202D408: ; jump table
	.short _0202D446 - _0202D408 - 2 ; case 0
	.short _0202D416 - _0202D408 - 2 ; case 1
	.short _0202D446 - _0202D408 - 2 ; case 2
	.short _0202D446 - _0202D408 - 2 ; case 3
	.short _0202D446 - _0202D408 - 2 ; case 4
	.short _0202D424 - _0202D408 - 2 ; case 5
	.short _0202D436 - _0202D408 - 2 ; case 6
_0202D416:
	ldr r2, _0202D44C ; =0x0000270F
	cmp r1, r2
	bls _0202D420
	strh r2, [r0]
	b _0202D446
_0202D420:
	strh r1, [r0]
	b _0202D446
_0202D424:
	ldrh r2, [r0]
	add r2, r2, r1
	ldr r1, _0202D44C ; =0x0000270F
	cmp r2, r1
	ble _0202D432
	strh r1, [r0]
	b _0202D446
_0202D432:
	strh r2, [r0]
	b _0202D446
_0202D436:
	ldrh r2, [r0]
	cmp r2, r1
	bhs _0202D442
	mov r1, #0
	strh r1, [r0]
	b _0202D446
_0202D442:
	sub r1, r2, r1
	strh r1, [r0]
_0202D446:
	ldrh r0, [r0]
	bx lr
	nop
_0202D44C: .word 0x0000270F
	thumb_func_end FrontierData_BattlePointAction

	thumb_func_start sub_0202D450
sub_0202D450: ; 0x0202D450
	cmp r1, #2
	beq _0202D45A
	cmp r1, #3
	beq _0202D468
	b _0202D484
_0202D45A:
	mov r1, #0
	strb r1, [r0, #2]
	ldrh r2, [r0, #8]
	mov r1, #0x10
	bic r2, r1
	strh r2, [r0, #8]
	b _0202D484
_0202D468:
	ldrh r1, [r0, #8]
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x1f
	beq _0202D478
	ldrb r1, [r0, #2]
	add r1, r1, #1
	strb r1, [r0, #2]
	b _0202D484
_0202D478:
	mov r1, #1
	strb r1, [r0, #2]
	ldrh r2, [r0, #8]
	mov r1, #0x10
	orr r1, r2
	strh r1, [r0, #8]
_0202D484:
	ldrb r0, [r0, #2]
	bx lr
	thumb_func_end sub_0202D450

	thumb_func_start sub_0202D488
sub_0202D488: ; 0x0202D488
	cmp r1, #2
	beq _0202D496
	cmp r1, #3
	beq _0202D49C
	cmp r1, #4
	beq _0202D4A8
	b _0202D4B2
_0202D496:
	mov r1, #1
	strb r1, [r0, #3]
	b _0202D4B2
_0202D49C:
	ldrb r1, [r0, #3]
	cmp r1, #0xa
	bhs _0202D4B2
	add r1, r1, #1
	strb r1, [r0, #3]
	b _0202D4B2
_0202D4A8:
	ldrb r1, [r0, #3]
	cmp r1, #1
	bls _0202D4B2
	sub r1, r1, #1
	strb r1, [r0, #3]
_0202D4B2:
	ldrb r0, [r0, #3]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202D488

	thumb_func_start sub_0202D4B8
sub_0202D4B8: ; 0x0202D4B8
	push {r3, lr}
	add r3, r0, #0
	cmp r1, #0
	bne _0202D4CE
	add r3, #0xc0
	add r0, r2, #0
	add r1, r3, #0
	mov r2, #0xa8
	bl MI_CpuCopy8
	pop {r3, pc}
_0202D4CE:
	add r3, #0x18
	add r0, r2, #0
	add r1, r3, #0
	mov r2, #0xa8
	bl MI_CpuCopy8
	pop {r3, pc}
	thumb_func_end sub_0202D4B8

	thumb_func_start sub_0202D4DC
sub_0202D4DC: ; 0x0202D4DC
	push {r3, lr}
	cmp r1, #0
	bne _0202D4EE
	add r1, r2, #0
	add r0, #0xc0
	mov r2, #0xa8
	bl MI_CpuCopy8
	pop {r3, pc}
_0202D4EE:
	add r1, r2, #0
	add r0, #0x18
	mov r2, #0xa8
	bl MI_CpuCopy8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0202D4DC

	thumb_func_start sub_0202D4FC
sub_0202D4FC: ; 0x0202D4FC
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldrb r0, [r1, #2]
	mov r2, #0xfa
	lsl r2, r2, #2
	sub r0, r0, #1
	add r3, r0, #0
	mul r3, r2
	lsl r0, r3, #0x10
	lsr r4, r0, #0x10
	ldrh r3, [r1, #4]
	mov r0, #0xa
	ldrb r5, [r1, #3]
	mul r0, r3
	mov r3, #0x14
	mul r3, r5
	lsl r0, r0, #0x10
	lsl r3, r3, #0x10
	lsr r0, r0, #0x10
	lsr r3, r3, #0x10
	add r3, r0, r3
	add r0, r2, #0
	sub r0, #0x32
	cmp r3, r0
	ble _0202D532
	mov r5, #0
	b _0202D53A
_0202D532:
	sub r2, #0x32
	sub r0, r2, r3
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
_0202D53A:
	ldrh r1, [r1, #6]
	ldr r0, _0202D560 ; =0x000003CA
	cmp r1, r0
	bls _0202D546
	mov r1, #0
	b _0202D554
_0202D546:
	add r0, #0x1e
	sub r0, r0, r1
	mov r1, #0x1e
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
_0202D554:
	add r0, r4, r5
	add r0, r1, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	strh r0, [r6, #0x16]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0202D560: .word 0x000003CA
	thumb_func_end sub_0202D4FC

	thumb_func_start sub_0202D564
sub_0202D564: ; 0x0202D564
	ldrh r0, [r0, #0x16]
	bx lr
	thumb_func_end sub_0202D564

	thumb_func_start sub_0202D568
sub_0202D568: ; 0x0202D568
	push {r3, lr}
	ldrh r0, [r0, #0x16]
	mov r1, #0xfa
	lsl r1, r1, #2
	bl _s32_div_f
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0202D568

	thumb_func_start sub_0202D57C
sub_0202D57C: ; 0x0202D57C
	push {r4, r5}
	cmp r1, #5
	bne _0202D588
	mov r0, #0
	pop {r4, r5}
	bx lr
_0202D588:
	cmp r1, #6
	bne _0202D58E
	mov r1, #5
_0202D58E:
	cmp r2, #2
	beq _0202D598
	cmp r2, #3
	beq _0202D5A2
	b _0202D5B4
_0202D598:
	lsl r2, r1, #1
	mov r3, #0
	add r2, r0, r2
	strh r3, [r2, #0xa]
	b _0202D5B4
_0202D5A2:
	add r5, r0, #0
	add r5, #0xa
	lsl r4, r1, #1
	ldrh r3, [r5, r4]
	ldr r2, _0202D5C0 ; =0x0000FFFE
	cmp r3, r2
	bhs _0202D5B4
	add r2, r3, #1
	strh r2, [r5, r4]
_0202D5B4:
	lsl r1, r1, #1
	add r0, r0, r1
	ldrh r0, [r0, #0xa]
	pop {r4, r5}
	bx lr
	nop
_0202D5C0: .word 0x0000FFFE
	thumb_func_end sub_0202D57C

	thumb_func_start sub_0202D5C4
sub_0202D5C4: ; 0x0202D5C4
	cmp r1, #5
	bne _0202D5CC
	mov r0, #0
	bx lr
_0202D5CC:
	cmp r1, #6
	bne _0202D5D2
	mov r1, #5
_0202D5D2:
	add r0, #0xa
	lsl r1, r1, #1
	strh r2, [r0, r1]
	ldrh r0, [r0, r1]
	bx lr
	thumb_func_end sub_0202D5C4

	thumb_func_start sub_0202D5DC
sub_0202D5DC: ; 0x0202D5DC
	push {r4, lr}
	mov r3, #1
	cmp r1, #0x10
	blo _0202D5EC
	bl GF_AssertFail
	mov r0, #0
	pop {r4, pc}
_0202D5EC:
	mov r4, #0
	cmp r1, #0
	bls _0202D600
_0202D5F2:
	add r4, r4, #1
	lsl r4, r4, #0x10
	lsl r3, r3, #0x11
	lsr r4, r4, #0x10
	lsr r3, r3, #0x10
	cmp r4, r1
	blo _0202D5F2
_0202D600:
	cmp r2, #0
	beq _0202D624
	cmp r2, #1
	beq _0202D61C
	cmp r2, #2
	bne _0202D630
	ldr r1, _0202D634 ; =0x0000FFFF
	eor r1, r3
	lsl r1, r1, #0x10
	lsr r2, r1, #0x10
	ldrh r1, [r0, #8]
	and r1, r2
	strh r1, [r0, #8]
	b _0202D630
_0202D61C:
	ldrh r1, [r0, #8]
	orr r1, r3
	strh r1, [r0, #8]
	b _0202D630
_0202D624:
	ldrh r0, [r0, #8]
	add r2, r0, #0
	asr r2, r1
	mov r0, #1
	and r0, r2
	pop {r4, pc}
_0202D630:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0202D634: .word 0x0000FFFF
	thumb_func_end sub_0202D5DC

	thumb_func_start sub_0202D638
sub_0202D638: ; 0x0202D638
	str r1, [r0, #4]
	bx lr
	thumb_func_end sub_0202D638

	thumb_func_start sub_0202D63C
sub_0202D63C: ; 0x0202D63C
	ldr r0, [r0, #4]
	bx lr
	thumb_func_end sub_0202D63C

	thumb_func_start sub_0202D640
sub_0202D640: ; 0x0202D640
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl sub_0203107C
	ldr r1, _0202D65C ; =0x00000ABC
	add r1, r0, r1
	lsl r0, r5, #3
	add r0, r1, r0
	add r1, r4, #0
	bl MailMsg_Copy
	pop {r3, r4, r5, pc}
	nop
_0202D65C: .word 0x00000ABC
	thumb_func_end sub_0202D640

	thumb_func_start sub_0202D660
sub_0202D660: ; 0x0202D660
	push {r4, lr}
	add r4, r1, #0
	bl sub_0203107C
	ldr r1, _0202D674 ; =0x00000ABC
	add r1, r0, r1
	lsl r0, r4, #3
	add r0, r1, r0
	pop {r4, pc}
	nop
_0202D674: .word 0x00000ABC
	thumb_func_end sub_0202D660

	thumb_func_start sub_0202D678
sub_0202D678: ; 0x0202D678
	push {r3, r4, r5, r6}
	add r4, r3, #0
	mov r3, #1
	cmp r2, #0
	beq _0202D6D8
	cmp r2, #0xc8
	bhi _0202D6D8
	cmp r1, #0
	beq _0202D6D8
	cmp r1, #0xa
	bhi _0202D6D8
	sub r5, r2, #1
	sub r2, r1, #1
	mov r1, #0xc8
	mul r1, r2
	add r1, r5, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	lsr r6, r1, #0x1f
	lsl r5, r1, #0x1d
	sub r5, r5, r6
	mov r2, #0x1d
	ror r5, r2
	add r2, r6, r5
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	lsl r3, r2
	lsl r2, r3, #0x18
	lsl r1, r1, #0x15
	lsr r5, r2, #0x18
	add r3, r0, #4
	lsr r2, r1, #0x18
	ldrb r1, [r3, r2]
	orr r1, r5
	strb r1, [r3, r2]
	ldr r3, [r4]
	ldr r1, [r4, #8]
	lsl r5, r3, #0x18
	ldr r3, [r4, #4]
	lsl r1, r1, #0x18
	lsl r3, r3, #0x18
	lsr r3, r3, #8
	ldr r2, [r4, #0xc]
	lsr r1, r1, #0x10
	orr r3, r5
	orr r1, r3
	orr r1, r2
	str r1, [r0]
_0202D6D8:
	pop {r3, r4, r5, r6}
	bx lr
	thumb_func_end sub_0202D678

	thumb_func_start sub_0202D6DC
sub_0202D6DC: ; 0x0202D6DC
	push {r4, lr}
	add r4, r0, #0
	add r0, r4, #4
	mov r1, #0
	mov r2, #0xfa
	bl MI_CpuFill8
	add r0, r4, #0
	mov r1, #0
	mov r2, #4
	bl MI_CpuFill8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0202D6DC

	thumb_func_start sub_0202D6F8
sub_0202D6F8: ; 0x0202D6F8
	ldr r3, [r0]
	ldr r2, [r1]
	cmp r3, r2
	bls _0202D704
	mov r0, #1
	bx lr
_0202D704:
	ldr r3, [r0, #4]
	ldr r2, [r1, #4]
	cmp r3, r2
	bls _0202D710
	mov r0, #1
	bx lr
_0202D710:
	ldr r2, [r0, #8]
	ldr r0, [r1, #8]
	cmp r2, r0
	bls _0202D71C
	mov r0, #1
	bx lr
_0202D71C:
	mov r0, #0
	bx lr
	thumb_func_end sub_0202D6F8

	thumb_func_start sub_0202D720
sub_0202D720: ; 0x0202D720
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r2, #0
	add r5, r0, #0
	add r4, r1, #0
	mov r7, #1
	cmp r6, #0xc8
	bhi _0202D734
	cmp r4, #0xa
	bls _0202D73A
_0202D734:
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0202D73A:
	ldr r0, [r5]
	lsr r1, r0, #0x18
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	str r1, [sp]
	lsr r1, r0, #0x10
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	str r1, [sp, #4]
	lsr r1, r0, #8
	lsl r1, r1, #0x18
	lsl r0, r0, #0x18
	lsr r1, r1, #0x18
	lsr r0, r0, #0x18
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	add r0, r3, #0
	add r1, sp, #0
	bl sub_0202D6F8
	cmp r0, #0
	beq _0202D772
	add r0, r5, #0
	bl sub_0202D6DC
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0202D772:
	sub r1, r4, #1
	mov r0, #0xc8
	mul r0, r1
	sub r2, r6, #1
	add r0, r2, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsr r3, r0, #0x1f
	lsl r2, r0, #0x1d
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	add r0, r5, r0
	sub r2, r2, r3
	mov r1, #0x1d
	ror r2, r1
	add r1, r3, r2
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	add r2, r7, #0
	lsl r2, r1
	lsl r1, r2, #0x18
	ldrb r0, [r0, #4]
	lsr r1, r1, #0x18
	tst r0, r1
	beq _0202D7AA
	add sp, #0x10
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
_0202D7AA:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0202D720

	thumb_func_start sub_0202D7B0
sub_0202D7B0: ; 0x0202D7B0
	add r0, #0xfe
	ldrb r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202D7B0

	thumb_func_start sub_0202D7B8
sub_0202D7B8: ; 0x0202D7B8
	add r0, #0xff
	ldrb r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202D7B8

	thumb_func_start sub_0202D7C0
sub_0202D7C0: ; 0x0202D7C0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, r1, #0
	mov r1, #0x41
	add r4, r2, #0
	lsl r1, r1, #2
	ldr r2, _0202D7E8 ; =0x0000063C
	add r1, r5, r1
	add r6, r3, #0
	bl MI_CpuCopy8
	ldr r0, _0202D7EC ; =0x00000101
	strb r4, [r5, r0]
	sub r0, r0, #1
	strb r6, [r5, r0]
	mov r0, #1
	add r5, #0xfe
	strb r0, [r5]
	pop {r4, r5, r6, pc}
	nop
_0202D7E8: .word 0x0000063C
_0202D7EC: .word 0x00000101
	thumb_func_end sub_0202D7C0

	thumb_func_start sub_0202D7F0
sub_0202D7F0: ; 0x0202D7F0
	ldr r2, _0202D800 ; =0x00000101
	ldrb r3, [r0, r2]
	sub r2, r2, #1
	strb r3, [r1]
	ldrb r0, [r0, r2]
	strb r0, [r1, #1]
	bx lr
	nop
_0202D800: .word 0x00000101
	thumb_func_end sub_0202D7F0

	thumb_func_start sub_0202D804
sub_0202D804: ; 0x0202D804
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	mov r1, #0x41
	lsl r1, r1, #2
	add r5, r0, r1
	mov r0, #0xe4
	add r4, r2, #0
	mul r4, r0
	ldr r0, _0202D8A0 ; =0x00002710
	add r7, r6, #0
	str r0, [r6]
	add r0, r5, r4
	add r0, #0xc9
	ldrb r0, [r0]
	add r7, #0x30
	strh r0, [r6, #4]
	add r0, r5, r4
	add r0, #0xc8
	ldrb r0, [r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _0202D85A
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0x1c
	mov r3, #0xb
	bl NewMsgDataFromNarc
	add r1, r5, r4
	add r1, #0xc8
	ldrb r1, [r1]
	add r2, r6, #0
	str r0, [sp]
	lsl r1, r1, #0x1e
	lsr r1, r1, #0x1f
	add r1, #0x21
	add r2, #8
	bl ReadMsgDataIntoU16Array
	ldr r0, [sp]
	bl DestroyMsgData
	b _0202D868
_0202D85A:
	add r0, r5, r4
	add r1, r6, #0
	add r0, #0xa8
	add r1, #8
	mov r2, #0x10
	bl MI_CpuCopy8
_0202D868:
	add r0, r5, r4
	add r1, r6, #0
	add r0, #0xca
	add r1, #0x18
	mov r2, #8
	bl MI_CpuCopy8
	add r0, r5, r4
	add r1, r6, #0
	add r0, #0xd2
	add r1, #0x20
	mov r2, #8
	bl MI_CpuCopy8
	add r0, r5, r4
	add r6, #0x28
	add r0, #0xda
	add r1, r6, #0
	mov r2, #8
	bl MI_CpuCopy8
	add r0, r5, r4
	add r1, r7, #0
	mov r2, #0xa8
	bl MI_CpuCopy8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0202D8A0: .word 0x00002710
	thumb_func_end sub_0202D804

	thumb_func_start sub_0202D8A4
sub_0202D8A4: ; 0x0202D8A4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, r1, #0
	mov r1, #0x1d
	add r4, r2, #0
	lsl r1, r1, #6
	mov r2, #0xff
	add r1, r5, r1
	lsl r2, r2, #2
	add r6, r3, #0
	bl MI_CpuCopy8
	ldr r0, _0202D8CC ; =0x00000103
	strb r4, [r5, r0]
	sub r0, r0, #1
	strb r6, [r5, r0]
	mov r0, #1
	add r5, #0xff
	strb r0, [r5]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0202D8CC: .word 0x00000103
	thumb_func_end sub_0202D8A4

	thumb_func_start sub_0202D8D0
sub_0202D8D0: ; 0x0202D8D0
	ldr r2, _0202D8E0 ; =0x00000103
	ldrb r3, [r0, r2]
	sub r2, r2, #1
	strb r3, [r1]
	ldrb r0, [r0, r2]
	strb r0, [r1, #1]
	bx lr
	nop
_0202D8E0: .word 0x00000103
	thumb_func_end sub_0202D8D0

	thumb_func_start sub_0202D8E4
sub_0202D8E4: ; 0x0202D8E4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r1, #0
	mov r1, #0xff
	lsl r1, r1, #2
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0x1d
	lsl r0, r0, #6
	mov r2, #0xff
	add r0, r5, r0
	add r1, r4, #0
	lsl r2, r2, #2
	bl MI_CpuCopy8
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0202D8E4

	thumb_func_start sub_0202D908
sub_0202D908: ; 0x0202D908
	push {r3, lr}
	bl sub_0203107C
	mov r1, #0x8e
	lsl r1, r1, #4
	add r0, r0, r1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0202D908

	thumb_func_start Save_FrontierData_Get
Save_FrontierData_Get: ; 0x0202D918
	push {r3, lr}
	bl sub_0203107C
	ldr r1, _0202D924 ; =0x00000954
	add r0, r0, r1
	pop {r3, pc}
	.balign 4, 0
_0202D924: .word 0x00000954
	thumb_func_end Save_FrontierData_Get

	thumb_func_start sub_0202D928
sub_0202D928: ; 0x0202D928
	push {r3, lr}
	bl sub_0203107C
	ldr r1, _0202D934 ; =0x00000ADC
	add r0, r0, r1
	pop {r3, pc}
	.balign 4, 0
_0202D934: .word 0x00000ADC
	thumb_func_end sub_0202D928
