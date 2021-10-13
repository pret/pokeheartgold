	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020F62A4:
	.byte 0x00, 0xD2, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x36, 0x02, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD0, 0x11, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

	.bss

gMain: ; 0x021D110C
	.space 0x478

	.text

	thumb_func_start sub_0201A08C
sub_0201A08C: ; 0x0201A08C
	push {r3, lr}
	ldr r3, _0201A0B4 ; =OS_IRQTable
	ldr r1, _0201A0B8 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	mov r0, #3
	bl MI_WaitDma
	ldr r0, _0201A0BC ; =gMain
	ldr r0, [r0, #0x1c]
	bl sub_0201F880
	ldr r0, _0201A0BC ; =gMain
	ldr r1, [r0, #0x30]
	add r1, r1, #1
	str r1, [r0, #0x30]
	pop {r3, pc}
	nop
_0201A0B4: .word OS_IRQTable
_0201A0B8: .word 0x00003FF8
_0201A0BC: .word gMain
	thumb_func_end sub_0201A08C

	thumb_func_start sub_0201A0C0
sub_0201A0C0: ; 0x0201A0C0
	ldr r3, _0201A0D4 ; =OS_IRQTable
	ldr r1, _0201A0D8 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	ldr r3, _0201A0DC ; =MI_WaitDma
	mov r0, #3
	bx r3
	nop
_0201A0D4: .word OS_IRQTable
_0201A0D8: .word 0x00003FF8
_0201A0DC: .word MI_WaitDma
	thumb_func_end sub_0201A0C0

	thumb_func_start sub_0201A0E0
sub_0201A0E0: ; 0x0201A0E0
	push {r3, lr}
	mov r0, #1
	bl OS_DisableIrqMask
	ldr r1, _0201A0F8 ; =sub_0201A0C0
	mov r0, #1
	bl OS_SetIrqFunction
	mov r0, #1
	bl OS_EnableIrqMask
	pop {r3, pc}
	.balign 4, 0
_0201A0F8: .word sub_0201A0C0
	thumb_func_end sub_0201A0E0

	thumb_func_start Main_SetVBlankIntrCB
Main_SetVBlankIntrCB: ; 0x0201A0FC
	ldr r2, _0201A104 ; =gMain
	str r0, [r2]
	str r1, [r2, #4]
	bx lr
	.balign 4, 0
_0201A104: .word gMain
	thumb_func_end Main_SetVBlankIntrCB

	thumb_func_start sub_0201A108
sub_0201A108: ; 0x0201A108
	push {r3, lr}
	mov r0, #0
	bl sub_0201A16C
	ldr r0, _0201A11C ; =gMain
	mov r1, #0
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	pop {r3, pc}
	nop
_0201A11C: .word gMain
	thumb_func_end sub_0201A108

	thumb_func_start sub_0201A120
sub_0201A120: ; 0x0201A120
	push {r3, lr}
	cmp r0, #0
	bne _0201A138
	mov r0, #0
	bl sub_0201A16C
	ldr r0, _0201A154 ; =gMain
	mov r1, #0
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	mov r0, #1
	pop {r3, pc}
_0201A138:
	ldr r2, _0201A154 ; =gMain
	ldr r3, [r2, #8]
	cmp r3, #0
	bne _0201A14E
	str r1, [r2, #0xc]
	str r0, [r2, #8]
	mov r0, #1
	bl sub_0201A16C
	mov r0, #1
	pop {r3, pc}
_0201A14E:
	mov r0, #0
	pop {r3, pc}
	nop
_0201A154: .word gMain
	thumb_func_end sub_0201A120

	thumb_func_start sub_0201A158
sub_0201A158: ; 0x0201A158
	push {r3, lr}
	ldr r0, _0201A168 ; =gMain
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _0201A166
	ldr r0, [r0, #0xc]
	blx r1
_0201A166:
	pop {r3, pc}
	.balign 4, 0
_0201A168: .word gMain
	thumb_func_end sub_0201A158

	thumb_func_start sub_0201A16C
sub_0201A16C: ; 0x0201A16C
	push {r3, lr}
	ldr r2, _0201A1AC ; =0x04000208
	ldrh r1, [r2]
	mov r1, #0
	strh r1, [r2]
	cmp r0, #0
	bne _0201A18A
	ldr r0, [r2, #8]
	mov r0, #2
	bl OS_DisableIrqMask
	mov r0, #0
	bl GX_HBlankIntr
	b _0201A1A0
_0201A18A:
	ldr r0, [r2, #8]
	ldr r1, _0201A1B0 ; =sub_0201A158
	mov r0, #2
	bl OS_SetIrqFunction
	mov r0, #2
	bl OS_EnableIrqMask
	mov r0, #1
	bl GX_HBlankIntr
_0201A1A0:
	ldr r1, _0201A1AC ; =0x04000208
	ldrh r0, [r1]
	mov r0, #1
	strh r0, [r1]
	pop {r3, pc}
	nop
_0201A1AC: .word 0x04000208
_0201A1B0: .word sub_0201A158
	thumb_func_end sub_0201A16C

	thumb_func_start sub_0201A1B4
sub_0201A1B4: ; 0x0201A1B4
	push {r3, lr}
	sub sp, #0x30
	add r0, sp, #0x10
	bl OS_GetLowEntropyData
	add r0, sp, #0
	add r1, sp, #0x10
	mov r2, #0x20
	bl MATH_CalcMD5
	mov r3, #0
	add r1, r3, #0
	add r2, sp, #0
_0201A1CE:
	ldrb r0, [r2]
	add r1, r1, #1
	add r2, r2, #1
	add r3, r3, r0
	cmp r1, #0x10
	blo _0201A1CE
	lsl r0, r3, #0x18
	lsr r3, r0, #0x18
	mov r0, #3
	tst r0, r3
	beq _0201A1EE
	mov r0, #3
_0201A1E6:
	add r3, r3, #1
	add r1, r3, #0
	tst r1, r0
	bne _0201A1E6
_0201A1EE:
	ldr r0, _0201A1FC ; =_020F62A4
	mov r1, #4
	mov r2, #0xa1
	bl InitHeapSystem
	add sp, #0x30
	pop {r3, pc}
	.balign 4, 0
_0201A1FC: .word _020F62A4
	thumb_func_end sub_0201A1B4

	thumb_func_start InitSystemForTheGame
InitSystemForTheGame: ; 0x0201A200
	push {r3, r4, r5, lr}
	bl OS_Init
	bl FX_Init
	ldr r2, _0201A324 ; =0x04000304
	ldr r0, _0201A328 ; =0xFFFFFDF1
	ldrh r1, [r2]
	and r1, r0
	ldr r0, _0201A32C ; =0x0000020E
	orr r0, r1
	strh r0, [r2]
	bl GX_Init
	bl OS_InitTick
	bl sub_0201A1B4
	mov r0, #0xa0
	bl sub_0201F82C
	add r1, r0, #0
	mov r0, #0
	mov r2, #4
	bl OS_AllocFromArenaLo
	add r1, r0, #0
	mov r0, #0xa0
	bl sub_0201F834
	ldr r1, _0201A330 ; =gMain
	str r0, [r1, #0x18]
	mov r0, #0x20
	bl sub_0201F82C
	add r1, r0, #0
	mov r0, #0
	mov r2, #4
	bl OS_AllocFromArenaLo
	add r1, r0, #0
	mov r0, #0x20
	bl sub_0201F834
	ldr r1, _0201A330 ; =gMain
	str r0, [r1, #0x1c]
	mov r0, #0x20
	bl sub_0201F82C
	add r1, r0, #0
	mov r0, #0
	mov r2, #4
	bl OS_AllocFromArenaLo
	add r1, r0, #0
	mov r0, #0x20
	bl sub_0201F834
	ldr r1, _0201A330 ; =gMain
	str r0, [r1, #0x20]
	mov r0, #4
	bl sub_0201F82C
	add r1, r0, #0
	mov r0, #0
	mov r2, #4
	bl OS_AllocFromArenaLo
	add r1, r0, #0
	mov r0, #4
	bl sub_0201F834
	ldr r1, _0201A330 ; =gMain
	str r0, [r1, #0x24]
	bl GX_DispOff
	ldr r2, _0201A334 ; =0x04001000
	ldr r0, _0201A338 ; =0xFFFEFFFF
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	ldr r2, _0201A324 ; =0x04000304
	ldrh r1, [r2]
	lsr r0, r2, #0xb
	orr r0, r1
	strh r0, [r2]
	ldr r1, _0201A33C ; =sub_0201A08C
	mov r0, #1
	bl OS_SetIrqFunction
	mov r0, #1
	bl OS_EnableIrqMask
	mov r0, #1
	lsl r0, r0, #0x12
	bl OS_EnableIrqMask
	ldr r1, _0201A340 ; =0x04000208
	ldrh r0, [r1]
	mov r0, #1
	strh r0, [r1]
	bl GX_VBlankIntr
	mov r0, #1
	bl FS_Init
	bl sub_02027010
	mov r0, #0
	add r1, r0, #0
	bl FS_TryLoadTable
	add r4, r0, #0
	mov r0, #0
	add r1, r4, #0
	mov r2, #4
	bl OS_AllocFromArenaLo
	add r5, r0, #0
	bne _0201A2F4
	bl GF_AssertFail
_0201A2F4:
	add r0, r5, #0
	add r1, r4, #0
	bl FS_TryLoadTable
	ldr r0, _0201A330 ; =gMain
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #8]
	str r1, [r0, #0x10]
	str r1, [r0, #0x14]
	str r1, [r0, #0x74]
	str r1, [r0, #0x2c]
	ldr r0, _0201A344 ; =gMain + 0x60
	strb r1, [r0, #9]
	mov r0, #5
	mov r1, #9
	lsl r0, r0, #8
	lsl r1, r1, #0xa
	bl CARD_SetCacheFlushThreshold
	mov r0, #0
	bl GF_CRC16Init
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0201A324: .word 0x04000304
_0201A328: .word 0xFFFFFDF1
_0201A32C: .word 0x0000020E
_0201A330: .word gMain
_0201A334: .word 0x04001000
_0201A338: .word 0xFFFEFFFF
_0201A33C: .word sub_0201A08C
_0201A340: .word 0x04000208
_0201A344: .word gMain + 0x60
	thumb_func_end InitSystemForTheGame

	thumb_func_start InitGraphicMemory
InitGraphicMemory: ; 0x0201A348
	push {r3, lr}
	ldr r0, _0201A398 ; =0x000001FF
	bl GX_SetBankForLCDC
	mov r1, #0x1a
	mov r2, #0x29
	mov r0, #0
	lsl r1, r1, #0x16
	lsl r2, r2, #0xe
	bl MIi_CpuClearFast
	bl GX_DisableBankForLCDC
	mov r1, #7
	mov r2, #1
	mov r0, #0xc0
	lsl r1, r1, #0x18
	lsl r2, r2, #0xa
	bl MIi_CpuClearFast
	mov r2, #1
	ldr r1, _0201A39C ; =0x07000400
	mov r0, #0xc0
	lsl r2, r2, #0xa
	bl MIi_CpuClearFast
	mov r1, #5
	mov r2, #1
	mov r0, #0
	lsl r1, r1, #0x18
	lsl r2, r2, #0xa
	bl MIi_CpuClearFast
	mov r2, #1
	ldr r1, _0201A3A0 ; =0x05000400
	mov r0, #0
	lsl r2, r2, #0xa
	bl MIi_CpuClearFast
	pop {r3, pc}
	.balign 4, 0
_0201A398: .word 0x000001FF
_0201A39C: .word 0x07000400
_0201A3A0: .word 0x05000400
	thumb_func_end InitGraphicMemory

	thumb_func_start sub_0201A3A4
sub_0201A3A4: ; 0x0201A3A4
	push {r4, r5, r6, lr}
	sub sp, #0x48
	add r6, r0, #0
	add r4, r1, #0
	add r0, sp, #0
	bl FS_InitFile
	add r0, sp, #0
	add r1, r4, #0
	bl FS_OpenFile
	cmp r0, #0
	beq _0201A3F0
	ldr r1, [sp, #0x28]
	ldr r0, [sp, #0x24]
	sub r5, r1, r0
	add r0, r6, #0
	add r1, r5, #0
	bl AllocFromHeap
	add r4, r0, #0
	beq _0201A3E8
	add r0, sp, #0
	add r1, r4, #0
	add r2, r5, #0
	bl FS_ReadFile
	cmp r5, r0
	beq _0201A3E8
	add r0, r6, #0
	add r1, r4, #0
	bl FreeToHeapExplicit
	mov r4, #0
_0201A3E8:
	add r0, sp, #0
	bl FS_CloseFile
	b _0201A3F2
_0201A3F0:
	mov r4, #0
_0201A3F2:
	add r0, r4, #0
	add sp, #0x48
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0201A3A4

	thumb_func_start sub_0201A3F8
sub_0201A3F8: ; 0x0201A3F8
	push {r3, r4, r5, lr}
	sub sp, #0x48
	add r5, r0, #0
	add r0, sp, #0
	add r4, r1, #0
	bl FS_InitFile
	add r0, sp, #0
	add r1, r5, #0
	bl FS_OpenFile
	cmp r0, #0
	beq _0201A42A
	ldr r1, [sp, #0x28]
	ldr r0, [sp, #0x24]
	sub r2, r1, r0
	ldr r1, [r4]
	cmp r1, #0
	beq _0201A424
	add r0, sp, #0
	bl FS_ReadFile
_0201A424:
	add r0, sp, #0
	bl FS_CloseFile
_0201A42A:
	add sp, #0x48
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0201A3F8

	thumb_func_start sub_0201A430
sub_0201A430: ; 0x0201A430
	push {r3, r4, r5, r6, r7, lr}
	mov r6, #0
	ldr r5, _0201A454 ; =gMain + 0x470
	mov r4, #0x7f
	sub r7, r6, #1
_0201A43A:
	ldr r0, [r5]
	cmp r0, #0
	beq _0201A448
	bl FreeToHeap
	str r6, [r5]
	str r6, [r5, #4]
_0201A448:
	sub r4, r4, #1
	sub r5, #8
	cmp r4, r7
	bgt _0201A43A
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0201A454: .word gMain + 0x470
	thumb_func_end sub_0201A430

	thumb_func_start InitKeypadAndTouchpad
InitKeypadAndTouchpad: ; 0x0201A458
	push {r3, lr}
	sub sp, #8
	ldr r0, _0201A4A4 ; =gMain
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
	ldr r0, _0201A4A8 ; =gMain + 0x40
	strh r2, [r0, #0x20]
	strh r2, [r0, #0x22]
	strh r2, [r0, #0x24]
	strh r2, [r0, #0x26]
	ldr r0, _0201A4AC ; =gMain + 0x60
	strb r2, [r0, #8]
	bl TP_Init
	bl sub_020210A0
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
_0201A4A4: .word gMain
_0201A4A8: .word gMain + 0x40
_0201A4AC: .word gMain + 0x60
	thumb_func_end InitKeypadAndTouchpad

	thumb_func_start sub_0201A4B0
sub_0201A4B0: ; 0x0201A4B0
	ldr r1, _0201A4B8 ; =gMain + 0x60
	strb r0, [r1, #0xa]
	bx lr
	nop
_0201A4B8: .word gMain + 0x60
	thumb_func_end sub_0201A4B0

	thumb_func_start sub_0201A4BC
sub_0201A4BC: ; 0x0201A4BC
	ldr r1, _0201A4C8 ; =gMain + 0x60
	ldrb r2, [r1, #0xb]
	orr r0, r2
	strb r0, [r1, #0xb]
	bx lr
	nop
_0201A4C8: .word gMain + 0x60
	thumb_func_end sub_0201A4BC

	thumb_func_start sub_0201A4CC
sub_0201A4CC: ; 0x0201A4CC
	ldr r1, _0201A4D8 ; =gMain + 0x60
	mvn r0, r0
	ldrb r2, [r1, #0xb]
	and r0, r2
	strb r0, [r1, #0xb]
	bx lr
	.balign 4, 0
_0201A4D8: .word gMain + 0x60
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
	ldr r0, _0201A5D4 ; =gMain
	mov r1, #0
	str r1, [r0, #0x48]
	str r1, [r0, #0x44]
	str r1, [r0, #0x4c]
	ldr r0, _0201A5D8 ; =gMain + 0x40
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
	ldr r1, _0201A5D4 ; =gMain
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
	ldr r1, _0201A5D4 ; =gMain
	ldr r2, [r1, #0x58]
	str r2, [r1, #0x50]
_0201A548:
	ldr r1, _0201A5D4 ; =gMain
	str r0, [r1, #0x38]
	ldr r2, [r1, #0x3c]
	str r2, [r1, #0x48]
	str r0, [r1, #0x44]
	ldr r0, [r1, #0x40]
	str r0, [r1, #0x4c]
	bl sub_0201A5E8
	ldr r0, _0201A5E4 ; =gMain + 0x60
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
	ldr r0, _0201A5D8 ; =gMain + 0x40
	strh r2, [r0, #0x20]
	ldrh r1, [r1, #2]
	strh r1, [r0, #0x22]
	b _0201A5BA
_0201A596:
	ldr r0, _0201A5D8 ; =gMain + 0x40
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
	ldr r0, _0201A5D8 ; =gMain + 0x40
	ldrh r1, [r0, #0x26]
	eor r1, r2
	and r1, r2
	strh r1, [r0, #0x24]
	strh r2, [r0, #0x26]
	add sp, #0x10
	pop {r4, pc}
	nop
_0201A5D0: .word 0x027FFFA8
_0201A5D4: .word gMain
_0201A5D8: .word gMain + 0x40
_0201A5DC: .word 0x04000130
_0201A5E0: .word 0x00002FFF
_0201A5E4: .word gMain + 0x60
	thumb_func_end ReadKeypadAndTouchpad

	thumb_func_start sub_0201A5E8
sub_0201A5E8: ; 0x0201A5E8
	ldr r0, _0201A710 ; =gMain
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
	ldr r1, _0201A710 ; =gMain
	mov r0, #8
	ldr r2, [r1, #0x44]
	add r3, r2, #0
	tst r3, r0
	beq _0201A628
	lsl r0, r0, #7
	orr r0, r2
	str r0, [r1, #0x44]
_0201A628:
	ldr r1, _0201A710 ; =gMain
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
	ldr r2, _0201A710 ; =gMain
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
	ldr r2, _0201A710 ; =gMain
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
	ldr r2, _0201A710 ; =gMain
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
	ldr r1, _0201A710 ; =gMain
	mov r0, #2
	ldr r2, [r1, #0x44]
	lsl r0, r0, #8
	tst r0, r2
	beq _0201A6E4
	mov r0, #1
	orr r0, r2
	str r0, [r1, #0x44]
_0201A6E4:
	ldr r1, _0201A710 ; =gMain
	mov r0, #2
	ldr r2, [r1, #0x4c]
	lsl r0, r0, #8
	tst r0, r2
	beq _0201A6F6
	mov r0, #1
	orr r0, r2
	str r0, [r1, #0x4c]
_0201A6F6:
	ldr r1, _0201A710 ; =gMain
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
_0201A710: .word gMain
_0201A714: .word 0x0000F3FF
_0201A718: .word 0x0000FCFF
	thumb_func_end sub_0201A5E8

	thumb_func_start SetKeyRepeatTimers
SetKeyRepeatTimers: ; 0x0201A71C
	ldr r2, _0201A724 ; =gMain
	str r0, [r2, #0x54]
	str r1, [r2, #0x58]
	bx lr
	.balign 4, 0
_0201A724: .word gMain
	thumb_func_end SetKeyRepeatTimers

	thumb_func_start sub_0201A728
sub_0201A728: ; 0x0201A728
	ldr r1, _0201A734 ; =gMain + 0x60
	ldrb r2, [r1, #0xc]
	orr r0, r2
	strb r0, [r1, #0xc]
	bx lr
	nop
_0201A734: .word gMain + 0x60
	thumb_func_end sub_0201A728

	thumb_func_start sub_0201A738
sub_0201A738: ; 0x0201A738
	ldr r1, _0201A744 ; =gMain + 0x60
	mvn r0, r0
	ldrb r2, [r1, #0xc]
	and r0, r2
	strb r0, [r1, #0xc]
	bx lr
	.balign 4, 0
_0201A744: .word gMain + 0x60
	thumb_func_end sub_0201A738

	thumb_func_start sub_0201A748
sub_0201A748: ; 0x0201A748
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0201A76C ; =gMain
	ldr r0, [r0, #0x74]
	cmp r0, #0
	beq _0201A758
	bl GF_AssertFail
_0201A758:
	add r0, r4, #0
	mov r1, #4
	bl AllocFromHeapAtEnd
	ldr r1, _0201A76C ; =gMain
	str r0, [r1, #0x74]
	ldr r1, _0201A770 ; =0x2F93A1BC
	str r1, [r0]
	pop {r4, pc}
	nop
_0201A76C: .word gMain
_0201A770: .word 0x2F93A1BC
	thumb_func_end sub_0201A748

	thumb_func_start sub_0201A774
sub_0201A774: ; 0x0201A774
	push {r3, lr}
	ldr r0, _0201A798 ; =gMain
	ldr r0, [r0, #0x74]
	cmp r0, #0
	bne _0201A782
	bl GF_AssertFail
_0201A782:
	ldr r0, _0201A798 ; =gMain
	mov r2, #0
	ldr r1, [r0, #0x74]
	str r2, [r1]
	ldr r0, [r0, #0x74]
	bl FreeToHeap
	ldr r0, _0201A798 ; =gMain
	mov r1, #0
	str r1, [r0, #0x74]
	pop {r3, pc}
	.balign 4, 0
_0201A798: .word gMain
	thumb_func_end sub_0201A774

	thumb_func_start sub_0201A79C
sub_0201A79C: ; 0x0201A79C
	ldr r0, _0201A7B4 ; =gMain
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
_0201A7B4: .word gMain
_0201A7B8: .word 0x2F93A1BC
	thumb_func_end sub_0201A79C
