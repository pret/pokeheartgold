	.include "asm/macros.inc"
	.include "global.inc"

	.text

	.public sub_0201A08C
	.public CallHBlankIntrCallback
	.public sub_0201A1B4

	thumb_func_start InitKeypadAndTouchpad
InitKeypadAndTouchpad: ; 0x0201A458
	push {r3, lr}
	sub sp, #8
	ldr r0, _0201A4A4 ; =gSystem
	mov r2, #0
	str r2, [r0, #0x34]
	str r2, [r0, #0x38]
	str r2, [r0, #0x3c]
	str r2, [r0, #0x40]
	str r2, [r0, #0x44]
	str r2, [r0, #0x48]
	str r2, [r0, #0x4c]
	str r2, [r0, #0x50]
	mov r1, #4
	str r1, [r0, #0x54]
	mov r1, #8
	str r1, [r0, #0x58]
	ldr r0, _0201A4A8 ; =gSystem + 0x40
	strh r2, [r0, #0x20]
	strh r2, [r0, #0x22]
	strh r2, [r0, #0x24]
	strh r2, [r0, #0x26]
	ldr r0, _0201A4AC ; =gSystem + 0x60
	strb r2, [r0, #8]
	bl TP_Init
	bl GF_TouchpadInit
	add r0, sp, #0
	bl TP_GetUserInfo
	cmp r0, #1
	bne _0201A49E
	add r0, sp, #0
	bl TP_SetCalibrateParam
_0201A49E:
	add sp, #8
	pop {r3, pc}
	nop
_0201A4A4: .word gSystem
_0201A4A8: .word gSystem + 0x40
_0201A4AC: .word gSystem + 0x60
	thumb_func_end InitKeypadAndTouchpad

	thumb_func_start sub_0201A4B0
sub_0201A4B0: ; 0x0201A4B0
	ldr r1, _0201A4B8 ; =gSystem + 0x60
	strb r0, [r1, #0xa]
	bx lr
	nop
_0201A4B8: .word gSystem + 0x60
	thumb_func_end sub_0201A4B0

	thumb_func_start sub_0201A4BC
sub_0201A4BC: ; 0x0201A4BC
	ldr r1, _0201A4C8 ; =gSystem + 0x60
	ldrb r2, [r1, #0xb]
	orr r0, r2
	strb r0, [r1, #0xb]
	bx lr
	nop
_0201A4C8: .word gSystem + 0x60
	thumb_func_end sub_0201A4BC

	thumb_func_start sub_0201A4CC
sub_0201A4CC: ; 0x0201A4CC
	ldr r1, _0201A4D8 ; =gSystem + 0x60
	mvn r0, r0
	ldrb r2, [r1, #0xb]
	and r0, r2
	strb r0, [r1, #0xb]
	bx lr
	.balign 4, 0
_0201A4D8: .word gSystem + 0x60
	thumb_func_end sub_0201A4CC

	thumb_func_start ReadKeypadAndTouchpad
ReadKeypadAndTouchpad: ; 0x0201A4DC
	push {r4, lr}
	sub sp, #0x10
	ldr r2, _0201A5D0 ; =0x027FFFA8
	mov r0, #2
	ldrh r1, [r2]
	lsl r0, r0, #0xe
	and r0, r1
	asr r0, r0, #0xf
	beq _0201A502
	ldr r0, _0201A5D4 ; =gSystem
	mov r1, #0
	str r1, [r0, #0x48]
	str r1, [r0, #0x44]
	str r1, [r0, #0x4c]
	ldr r0, _0201A5D8 ; =gSystem + 0x40
	add sp, #0x10
	strh r1, [r0, #0x24]
	strh r1, [r0, #0x26]
	pop {r4, pc}
_0201A502:
	ldr r0, _0201A5DC ; =0x04000130
	ldrh r1, [r0]
	ldrh r0, [r2]
	orr r1, r0
	ldr r0, _0201A5E0 ; =0x00002FFF
	eor r1, r0
	and r0, r1
	lsl r0, r0, #0x10
	ldr r1, _0201A5D4 ; =gSystem
	lsr r2, r0, #0x10
	ldr r0, [r1, #0x5c]
	orr r0, r2
	mov r2, #0
	str r2, [r1, #0x5c]
	ldr r2, [r1, #0x38]
	add r3, r0, #0
	eor r3, r2
	and r3, r0
	str r3, [r1, #0x3c]
	str r3, [r1, #0x40]
	cmp r0, #0
	beq _0201A542
	cmp r2, r0
	bne _0201A542
	ldr r2, [r1, #0x50]
	sub r2, r2, #1
	str r2, [r1, #0x50]
	bne _0201A548
	str r0, [r1, #0x40]
	ldr r2, [r1, #0x54]
	str r2, [r1, #0x50]
	b _0201A548
_0201A542:
	ldr r1, _0201A5D4 ; =gSystem
	ldr r2, [r1, #0x58]
	str r2, [r1, #0x50]
_0201A548:
	ldr r1, _0201A5D4 ; =gSystem
	str r0, [r1, #0x38]
	ldr r2, [r1, #0x3c]
	str r2, [r1, #0x48]
	str r0, [r1, #0x44]
	ldr r0, [r1, #0x40]
	str r0, [r1, #0x4c]
	bl sub_0201A5E8
	ldr r0, _0201A5E4 ; =gSystem + 0x60
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0201A574
	add r4, sp, #8
_0201A564:
	bl TP_RequestSamplingAsync
	add r0, r4, #0
	bl TP_WaitRawResult
	cmp r0, #0
	bne _0201A564
	b _0201A57A
_0201A574:
	add r0, sp, #8
	bl TP_GetLatestRawPointInAuto
_0201A57A:
	add r0, sp, #0
	add r1, sp, #8
	bl TP_GetCalibratedPoint
	add r1, sp, #0
	ldrh r3, [r1, #6]
	cmp r3, #0
	bne _0201A596
	ldrh r2, [r1]
	ldr r0, _0201A5D8 ; =gSystem + 0x40
	strh r2, [r0, #0x20]
	ldrh r1, [r1, #2]
	strh r1, [r0, #0x22]
	b _0201A5BA
_0201A596:
	ldr r0, _0201A5D8 ; =gSystem + 0x40
	ldrh r2, [r0, #0x26]
	cmp r2, #0
	beq _0201A5B6
	cmp r3, #1
	beq _0201A5AA
	cmp r3, #2
	beq _0201A5B0
	cmp r3, #3
	b _0201A5BA
_0201A5AA:
	ldrh r1, [r1, #2]
	strh r1, [r0, #0x22]
	b _0201A5BA
_0201A5B0:
	ldrh r1, [r1]
	strh r1, [r0, #0x20]
	b _0201A5BA
_0201A5B6:
	mov r0, #0
	strh r0, [r1, #4]
_0201A5BA:
	add r0, sp, #0
	ldrh r2, [r0, #4]
	ldr r0, _0201A5D8 ; =gSystem + 0x40
	ldrh r1, [r0, #0x26]
	eor r1, r2
	and r1, r2
	strh r1, [r0, #0x24]
	strh r2, [r0, #0x26]
	add sp, #0x10
	pop {r4, pc}
	nop
_0201A5D0: .word 0x027FFFA8
_0201A5D4: .word gSystem
_0201A5D8: .word gSystem + 0x40
_0201A5DC: .word 0x04000130
_0201A5E0: .word 0x00002FFF
_0201A5E4: .word gSystem + 0x60
	thumb_func_end ReadKeypadAndTouchpad

	thumb_func_start sub_0201A5E8
sub_0201A5E8: ; 0x0201A5E8
	ldr r0, _0201A710 ; =gSystem
	ldr r1, [r0, #0x34]
	cmp r1, #3
	bls _0201A5F2
	b _0201A70C
_0201A5F2:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0201A5FE: ; jump table
	.short _0201A70C - _0201A5FE - 2 ; case 0
	.short _0201A606 - _0201A5FE - 2 ; case 1
	.short _0201A63C - _0201A5FE - 2 ; case 2
	.short _0201A6C2 - _0201A5FE - 2 ; case 3
_0201A606:
	ldr r2, [r0, #0x48]
	mov r1, #8
	add r3, r2, #0
	tst r3, r1
	beq _0201A616
	lsl r1, r1, #7
	orr r1, r2
	str r1, [r0, #0x48]
_0201A616:
	ldr r1, _0201A710 ; =gSystem
	mov r0, #8
	ldr r2, [r1, #0x44]
	add r3, r2, #0
	tst r3, r0
	beq _0201A628
	lsl r0, r0, #7
	orr r0, r2
	str r0, [r1, #0x44]
_0201A628:
	ldr r1, _0201A710 ; =gSystem
	mov r0, #8
	ldr r2, [r1, #0x4c]
	add r3, r2, #0
	tst r3, r0
	beq _0201A70C
	lsl r0, r0, #7
	orr r0, r2
	str r0, [r1, #0x4c]
	bx lr
_0201A63C:
	ldr r3, [r0, #0x48]
	mov r0, #1
	lsl r0, r0, #0xa
	add r2, r3, #0
	mov r1, #0
	tst r2, r0
	beq _0201A64E
	lsl r0, r0, #1
	orr r1, r0
_0201A64E:
	mov r0, #2
	lsl r0, r0, #0xa
	add r2, r3, #0
	tst r2, r0
	beq _0201A65C
	lsr r0, r0, #1
	orr r1, r0
_0201A65C:
	ldr r2, _0201A710 ; =gSystem
	ldr r0, _0201A714 ; =0x0000F3FF
	ldr r3, [r2, #0x48]
	and r0, r3
	orr r0, r1
	str r0, [r2, #0x48]
	ldr r3, [r2, #0x44]
	mov r1, #1
	lsl r1, r1, #0xa
	add r2, r3, #0
	mov r0, #0
	tst r2, r1
	beq _0201A67A
	lsl r1, r1, #1
	orr r0, r1
_0201A67A:
	mov r1, #2
	lsl r1, r1, #0xa
	add r2, r3, #0
	tst r2, r1
	beq _0201A688
	lsr r1, r1, #1
	orr r0, r1
_0201A688:
	ldr r2, _0201A710 ; =gSystem
	ldr r1, _0201A714 ; =0x0000F3FF
	ldr r3, [r2, #0x44]
	and r1, r3
	orr r0, r1
	str r0, [r2, #0x44]
	ldr r3, [r2, #0x4c]
	mov r1, #1
	lsl r1, r1, #0xa
	add r2, r3, #0
	mov r0, #0
	tst r2, r1
	beq _0201A6A6
	lsl r1, r1, #1
	orr r0, r1
_0201A6A6:
	mov r1, #2
	lsl r1, r1, #0xa
	add r2, r3, #0
	tst r2, r1
	beq _0201A6B4
	lsr r1, r1, #1
	orr r0, r1
_0201A6B4:
	ldr r2, _0201A710 ; =gSystem
	ldr r1, _0201A714 ; =0x0000F3FF
	ldr r3, [r2, #0x4c]
	and r1, r3
	orr r0, r1
	str r0, [r2, #0x4c]
	bx lr
_0201A6C2:
	mov r1, #2
	ldr r2, [r0, #0x48]
	lsl r1, r1, #8
	tst r1, r2
	beq _0201A6D2
	mov r1, #1
	orr r1, r2
	str r1, [r0, #0x48]
_0201A6D2:
	ldr r1, _0201A710 ; =gSystem
	mov r0, #2
	ldr r2, [r1, #0x44]
	lsl r0, r0, #8
	tst r0, r2
	beq _0201A6E4
	mov r0, #1
	orr r0, r2
	str r0, [r1, #0x44]
_0201A6E4:
	ldr r1, _0201A710 ; =gSystem
	mov r0, #2
	ldr r2, [r1, #0x4c]
	lsl r0, r0, #8
	tst r0, r2
	beq _0201A6F6
	mov r0, #1
	orr r0, r2
	str r0, [r1, #0x4c]
_0201A6F6:
	ldr r1, _0201A710 ; =gSystem
	ldr r0, _0201A718 ; =0x0000FCFF
	ldr r2, [r1, #0x48]
	and r2, r0
	str r2, [r1, #0x48]
	ldr r2, [r1, #0x44]
	and r2, r0
	str r2, [r1, #0x44]
	ldr r2, [r1, #0x4c]
	and r0, r2
	str r0, [r1, #0x4c]
_0201A70C:
	bx lr
	nop
_0201A710: .word gSystem
_0201A714: .word 0x0000F3FF
_0201A718: .word 0x0000FCFF
	thumb_func_end sub_0201A5E8

	thumb_func_start SetKeyRepeatTimers
SetKeyRepeatTimers: ; 0x0201A71C
	ldr r2, _0201A724 ; =gSystem
	str r0, [r2, #0x54]
	str r1, [r2, #0x58]
	bx lr
	.balign 4, 0
_0201A724: .word gSystem
	thumb_func_end SetKeyRepeatTimers

	thumb_func_start sub_0201A728
sub_0201A728: ; 0x0201A728
	ldr r1, _0201A734 ; =gSystem + 0x60
	ldrb r2, [r1, #0xc]
	orr r0, r2
	strb r0, [r1, #0xc]
	bx lr
	nop
_0201A734: .word gSystem + 0x60
	thumb_func_end sub_0201A728

	thumb_func_start sub_0201A738
sub_0201A738: ; 0x0201A738
	ldr r1, _0201A744 ; =gSystem + 0x60
	mvn r0, r0
	ldrb r2, [r1, #0xc]
	and r0, r2
	strb r0, [r1, #0xc]
	bx lr
	.balign 4, 0
_0201A744: .word gSystem + 0x60
	thumb_func_end sub_0201A738

	thumb_func_start sub_0201A748
sub_0201A748: ; 0x0201A748
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0201A76C ; =gSystem
	ldr r0, [r0, #0x74]
	cmp r0, #0
	beq _0201A758
	bl GF_AssertFail
_0201A758:
	add r0, r4, #0
	mov r1, #4
	bl AllocFromHeapAtEnd
	ldr r1, _0201A76C ; =gSystem
	str r0, [r1, #0x74]
	ldr r1, _0201A770 ; =0x2F93A1BC
	str r1, [r0]
	pop {r4, pc}
	nop
_0201A76C: .word gSystem
_0201A770: .word 0x2F93A1BC
	thumb_func_end sub_0201A748

	thumb_func_start sub_0201A774
sub_0201A774: ; 0x0201A774
	push {r3, lr}
	ldr r0, _0201A798 ; =gSystem
	ldr r0, [r0, #0x74]
	cmp r0, #0
	bne _0201A782
	bl GF_AssertFail
_0201A782:
	ldr r0, _0201A798 ; =gSystem
	mov r2, #0
	ldr r1, [r0, #0x74]
	str r2, [r1]
	ldr r0, [r0, #0x74]
	bl FreeToHeap
	ldr r0, _0201A798 ; =gSystem
	mov r1, #0
	str r1, [r0, #0x74]
	pop {r3, pc}
	.balign 4, 0
_0201A798: .word gSystem
	thumb_func_end sub_0201A774

	thumb_func_start sub_0201A79C
sub_0201A79C: ; 0x0201A79C
	ldr r0, _0201A7B4 ; =gSystem
	ldr r0, [r0, #0x74]
	cmp r0, #0
	beq _0201A7B0
	ldr r1, [r0]
	ldr r0, _0201A7B8 ; =0x2F93A1BC
	cmp r1, r0
	bne _0201A7B0
	mov r0, #1
	bx lr
_0201A7B0:
	mov r0, #0
	bx lr
	.balign 4, 0
_0201A7B4: .word gSystem
_0201A7B8: .word 0x2F93A1BC
	thumb_func_end sub_0201A79C
