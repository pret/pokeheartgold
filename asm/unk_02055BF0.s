	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020FC724:
	.byte 0x31, 0x65, 0x05, 0x02, 0xFD, 0x65, 0x05, 0x02, 0x81, 0x66, 0x05, 0x02
	.byte 0xF9, 0x66, 0x05, 0x02, 0xFD, 0x65, 0x05, 0x02, 0xB5, 0x67, 0x05, 0x02, 0xFD, 0x65, 0x05, 0x02
	.byte 0x1D, 0x68, 0x05, 0x02, 0x39, 0x69, 0x05, 0x02
_020FC748:
	.byte 0x05, 0x60, 0x05, 0x02, 0x41, 0x60, 0x05, 0x02
	.byte 0xC5, 0x60, 0x05, 0x02, 0x3D, 0x61, 0x05, 0x02, 0x21, 0x62, 0x05, 0x02, 0x69, 0x62, 0x05, 0x02
	.byte 0x05, 0x60, 0x05, 0x02, 0xB1, 0x62, 0x05, 0x02, 0x25, 0x64, 0x05, 0x02
_020FC76C:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x55, 0x6A, 0x05, 0x02, 0xED, 0x6A, 0x05, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC9, 0x6B, 0x05, 0x02, 0x65, 0x6C, 0x05, 0x02

	.text

	thumb_func_start sub_02055BF0
sub_02055BF0: ; 0x02055BF0
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	ldr r0, [sp, #0x24]
	mov r1, #0x20
	add r4, r2, #0
	add r6, r3, #0
	bl AllocFromHeap
	add r2, r0, #0
	str r5, [r2, #4]
	str r4, [r2, #8]
	str r6, [r2, #0xc]
	add r0, sp, #8
	ldrh r0, [r0, #0x10]
	ldr r1, _02055C2C ; =sub_02055C30
	strh r0, [r2, #0x10]
	ldr r0, [sp, #0x1c]
	str r0, [r2, #0x14]
	ldr r0, [sp, #0x20]
	str r0, [r2, #0x18]
	ldr r0, [sp, #0x24]
	str r0, [r2, #0x1c]
	mov r0, #0
	str r0, [r2]
	add r0, r7, #0
	bl sub_02050530
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02055C2C: .word sub_02055C30
	thumb_func_end sub_02055BF0

	thumb_func_start sub_02055C30
sub_02055C30: ; 0x02055C30
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02050650
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _02055C50
	cmp r0, #1
	beq _02055C78
	b _02055C94
_02055C50:
	ldr r0, [r5, #4]
	ldr r0, [r0, #0x1c]
	bl ov01_021FB514
	ldr r0, [r4, #0x14]
	str r0, [sp]
	ldr r0, [r4, #0x18]
	str r0, [sp, #4]
	ldr r0, [r4, #0x1c]
	str r0, [sp, #8]
	ldrh r3, [r4, #0x10]
	ldr r0, [r4, #4]
	ldr r1, [r4, #8]
	ldr r2, [r4, #0xc]
	bl sub_0200FA24
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02055C94
_02055C78:
	bl sub_0200FB5C
	cmp r0, #0
	beq _02055C94
	ldr r0, [r5, #4]
	ldr r0, [r0, #0x1c]
	bl ov01_021FB4F4
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_02055C94:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02055C30

	thumb_func_start sub_02055C9C
sub_02055C9C: ; 0x02055C9C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	mov r0, #0xb
	mov r1, #0x28
	add r4, r2, #0
	add r6, r3, #0
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	mov r0, #0
	strb r0, [r2]
	strh r0, [r2, #2]
	strb r0, [r2, #1]
	str r5, [r2, #4]
	str r4, [r2, #8]
	ldr r0, [sp, #0x18]
	str r6, [r2, #0xc]
	str r0, [r2, #0x10]
	ldr r0, [sp, #0x1c]
	ldr r1, _02055CD4 ; =sub_02055DBC
	str r0, [r2, #0x14]
	ldr r0, [sp, #0x20]
	str r0, [r2, #0x1c]
	add r0, r7, #0
	bl sub_020504F0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02055CD4: .word sub_02055DBC
	thumb_func_end sub_02055C9C

	thumb_func_start sub_02055CD8
sub_02055CD8: ; 0x02055CD8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r0, #0
	add r5, r1, #0
	mov r0, #0xb
	mov r1, #0x28
	str r2, [sp]
	str r3, [sp, #4]
	bl AllocFromHeapAtEnd
	add r6, r0, #0
	mov r4, #0
	strb r4, [r6]
	strh r4, [r6, #2]
	strb r4, [r6, #1]
	ldr r0, [sp]
	str r5, [r6, #4]
	str r0, [r6, #8]
	ldr r0, [sp, #4]
	str r0, [r6, #0xc]
	ldr r0, [sp, #0x20]
	str r0, [r6, #0x10]
	ldr r0, [sp, #0x24]
	str r0, [r6, #0x14]
	ldr r0, [r7, #0x20]
	ldr r0, [r0]
	str r0, [sp, #8]
	bl MapHeader_IsCave
	cmp r0, #0
	beq _02055D46
	add r0, r5, #0
	bl MapHeader_IsCave
	cmp r0, #0
	beq _02055D24
	mov r4, #6
	b _02055DA8
_02055D24:
	add r0, r5, #0
	bl sub_0203B5AC
	cmp r0, #0
	beq _02055D32
	mov r4, #5
	b _02055DA8
_02055D32:
	add r0, r5, #0
	bl sub_0203B58C
	cmp r0, #0
	beq _02055D40
	mov r4, #6
	b _02055DA8
_02055D40:
	bl GF_AssertFail
	b _02055DA8
_02055D46:
	ldr r0, [sp, #8]
	bl sub_0203B5AC
	cmp r0, #0
	beq _02055D72
	add r0, r5, #0
	bl MapHeader_IsCave
	cmp r0, #0
	beq _02055D5E
	mov r4, #4
	b _02055DA8
_02055D5E:
	add r0, r5, #0
	bl sub_0203B58C
	cmp r0, #0
	beq _02055D6C
	mov r4, #6
	b _02055DA8
_02055D6C:
	bl GF_AssertFail
	b _02055DA8
_02055D72:
	ldr r0, [sp, #8]
	bl sub_0203B58C
	cmp r0, #0
	beq _02055DA4
	add r0, r5, #0
	bl sub_0203B5AC
	cmp r0, #0
	bne _02055DA8
	add r0, r5, #0
	bl sub_0203B58C
	cmp r0, #0
	beq _02055D94
	mov r4, #6
	b _02055DA8
_02055D94:
	add r0, r5, #0
	bl MapHeader_IsCave
	cmp r0, #0
	bne _02055DA8
	bl GF_AssertFail
	b _02055DA8
_02055DA4:
	bl GF_AssertFail
_02055DA8:
	ldr r1, _02055DB8 ; =sub_02055DBC
	add r0, r7, #0
	add r2, r6, #0
	str r4, [r6, #0x1c]
	bl sub_020504F0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02055DB8: .word sub_02055DBC
	thumb_func_end sub_02055CD8

	thumb_func_start sub_02055DBC
sub_02055DBC: ; 0x02055DBC
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r6, #0
	bl sub_02050650
	add r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #9
	bhi _02055E74
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02055DE0: ; jump table
	.short _02055DF4 - _02055DE0 - 2 ; case 0
	.short _02055E20 - _02055DE0 - 2 ; case 1
	.short _02055E66 - _02055DE0 - 2 ; case 2
	.short _02055ED0 - _02055DE0 - 2 ; case 3
	.short _02055EDE - _02055DE0 - 2 ; case 4
	.short _02055EEE - _02055DE0 - 2 ; case 5
	.short _02055EFC - _02055DE0 - 2 ; case 6
	.short _02055F24 - _02055DE0 - 2 ; case 7
	.short _02055FD0 - _02055DE0 - 2 ; case 8
	.short _02055FE2 - _02055DE0 - 2 ; case 9
_02055DF4:
	mov r0, #0
	strh r0, [r4, #2]
	str r0, [r4, #0x24]
	strb r0, [r4, #1]
	add r0, r5, #0
	bl sub_02069F88
	cmp r0, #0
	beq _02055E20
	add r0, r5, #0
	bl ov01_022057C4
	cmp r0, #0
	beq _02055E20
	ldr r0, [r5, #0x40]
	bl sub_0205C700
	cmp r0, #1
	beq _02055E20
	mov r0, #9
	strb r0, [r4]
	b _02055FF2
_02055E20:
	add r0, r5, #0
	bl sub_02069F88
	cmp r0, #0
	beq _02055E5E
	add r0, r5, #0
	bl ov01_022057C4
	cmp r0, #0
	bne _02055E5E
	ldr r0, [r5, #0x40]
	bl sub_0205C700
	cmp r0, #1
	beq _02055E5E
	add r0, r5, #0
	bl sub_02069D68
	add r5, r0, #0
	bl sub_02069F7C
	ldr r1, [r4, #4]
	bl sub_02069FF4
	cmp r0, #0
	bne _02055E5E
	add r0, r5, #0
	mov r1, #1
	bl ov01_0220329C
	str r0, [r4, #0x24]
_02055E5E:
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02055FF2
_02055E66:
	ldr r0, [r4, #0x24]
	cmp r0, #0
	beq _02055E76
	bl sub_02068CCC
	cmp r0, #0
	beq _02055E76
_02055E74:
	b _02055FF2
_02055E76:
	ldr r1, [r4, #4]
	add r0, r5, #0
	bl sub_020550E4
	ldr r1, [r4, #0x1c]
	add r0, r6, #0
	lsl r2, r1, #2
	ldr r1, _02055FF8 ; =_020FC748
	ldr r1, [r1, r2]
	add r2, r4, #0
	bl sub_02050530
	add r0, r5, #0
	bl sub_02069F88
	cmp r0, #0
	beq _02055EB2
	add r0, r5, #0
	bl ov01_022057C4
	cmp r0, #0
	beq _02055EB2
	add r0, r5, #0
	bl sub_02069FD4
	cmp r0, #0
	bne _02055EB2
	add r0, r5, #0
	bl ov01_022057D0
_02055EB2:
	ldr r0, [r5, #0xc]
	bl sub_0202ED34
	add r1, r0, #0
	ldr r0, [r5, #0x20]
	ldr r0, [r0]
	bl sub_0202ED40
	ldr r0, [r5, #0x20]
	ldr r0, [r0]
	str r0, [r4, #0x20]
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02055FF2
_02055ED0:
	add r0, r6, #0
	bl sub_0205525C
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02055FF2
_02055EDE:
	add r0, r6, #0
	add r1, r4, #4
	bl sub_020537A8
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02055FF2
_02055EEE:
	add r0, r6, #0
	bl sub_020552A4
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02055FF2
_02055EFC:
	ldr r0, [r4, #0x1c]
	lsl r1, r0, #2
	ldr r0, _02055FFC ; =_020FC76C
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _02055F1C
	ldr r0, [r5, #0x24]
	mov r1, #0
	bl sub_0202367C
	ldr r1, [r4, #0x1c]
	add r0, r5, #0
	lsl r2, r1, #2
	ldr r1, _02055FFC ; =_020FC76C
	ldr r1, [r1, r2]
	blx r1
_02055F1C:
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02055FF2
_02055F24:
	bl GF_SndGetFadeTimer
	cmp r0, #0
	bne _02055FF2
	ldr r1, [r4, #4]
	add r0, r5, #0
	mov r2, #1
	bl sub_02055110
	ldr r0, [r4, #0x20]
	bl MapHeader_IsCave
	cmp r0, #0
	bne _02055F78
	ldr r0, [r4, #4]
	bl sub_0206A360
	str r0, [sp]
	cmp r0, #0xff
	beq _02055F78
	ldr r0, [r4, #0x1c]
	mov r7, #0
	cmp r0, #8
	bne _02055F56
	mov r7, #1
_02055F56:
	bl GF_RTC_GetTimeOfDay
	add r2, r0, #0
	lsl r2, r2, #0x18
	ldr r1, [sp]
	add r0, r6, #0
	lsr r2, r2, #0x18
	add r3, r7, #0
	bl sub_0206A388
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	add r0, r5, #0
	bl ov01_021EFAF8
	b _02055FF2
_02055F78:
	add r0, r5, #0
	bl ov01_021EFAF8
	mov r0, #0
	strh r0, [r4, #2]
	ldr r1, [r4, #0x1c]
	add r0, r6, #0
	lsl r2, r1, #2
	ldr r1, _02056000 ; =_020FC724
	ldr r1, [r1, r2]
	add r2, r4, #0
	bl sub_02050530
	add r0, r5, #0
	bl sub_02069D68
	add r6, r0, #0
	add r0, r5, #0
	bl sub_02069F88
	cmp r0, #0
	beq _02055FC8
	add r0, r5, #0
	bl sub_02069FD4
	cmp r0, #0
	bne _02055FC8
	add r0, r6, #0
	mov r1, #1
	bl sub_02069E84
	ldr r0, [r5, #0x40]
	bl sub_0205C654
	add r1, r0, #0
	lsl r1, r1, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ov01_02205790
_02055FC8:
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02055FF2
_02055FD0:
	ldr r0, [r5, #0x24]
	mov r1, #1
	bl sub_0202367C
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02055FE2:
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
	ldrb r0, [r4, #1]
	cmp r0, #2
	blo _02055FF2
	mov r0, #1
	strb r0, [r4]
_02055FF2:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02055FF8: .word _020FC748
_02055FFC: .word _020FC76C
_02056000: .word _020FC724
	thumb_func_end sub_02055DBC

	thumb_func_start sub_02056004
sub_02056004: ; 0x02056004
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0205064C
	add r0, r5, #0
	bl sub_02050650
	add r4, r0, #0
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _02056020
	cmp r0, #1
	beq _02056034
	b _02056038
_02056020:
	ldr r0, _0205603C ; =0x00000602
	bl PlaySE
	add r0, r5, #0
	bl sub_020552E8
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	b _02056038
_02056034:
	mov r0, #1
	pop {r3, r4, r5, pc}
_02056038:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0205603C: .word 0x00000602
	thumb_func_end sub_02056004

	thumb_func_start sub_02056040
sub_02056040: ; 0x02056040
	push {r4, r5, r6, lr}
	add r6, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r6, #0
	bl sub_02050650
	add r4, r0, #0
	ldrh r0, [r4, #2]
	cmp r0, #3
	bhi _020560BE
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02056064: ; jump table
	.short _0205606C - _02056064 - 2 ; case 0
	.short _02056092 - _02056064 - 2 ; case 1
	.short _020560AC - _02056064 - 2 ; case 2
	.short _020560BA - _02056064 - 2 ; case 3
_0205606C:
	bl ov01_021E90C0
	str r0, [r4, #0x18]
	ldr r0, [r5, #0x40]
	bl sub_0205C67C
	add r6, r0, #0
	ldr r0, [r5, #0x40]
	bl sub_0205C688
	add r1, r0, #0
	ldr r2, [r4, #0x18]
	add r0, r6, #0
	bl ov01_021E90DC
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	b _020560BE
_02056092:
	ldr r1, [r4, #0x18]
	add r0, r5, #0
	bl ov01_021E90E4
	cmp r0, #0
	beq _020560BE
	ldr r0, [r4, #0x18]
	bl ov01_021E90D4
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	b _020560BE
_020560AC:
	add r0, r6, #0
	bl sub_020552E8
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	b _020560BE
_020560BA:
	mov r0, #1
	pop {r4, r5, r6, pc}
_020560BE:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02056040

	thumb_func_start sub_020560C4
sub_020560C4: ; 0x020560C4
	push {r4, r5, r6, lr}
	add r4, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02050650
	add r4, r0, #0
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _020560E6
	cmp r0, #1
	beq _0205610C
	cmp r0, #2
	beq _02056134
	b _02056138
_020560E6:
	bl ov01_021E90C0
	str r0, [r4, #0x18]
	ldr r0, [r5, #0x40]
	bl sub_0205C67C
	add r6, r0, #0
	ldr r0, [r5, #0x40]
	bl sub_0205C688
	add r1, r0, #0
	ldr r2, [r4, #0x18]
	add r0, r6, #0
	bl ov01_021E90DC
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	b _02056138
_0205610C:
	ldr r0, [r5, #0x40]
	ldr r6, [r4, #0x18]
	bl sub_0205C654
	add r2, r0, #0
	lsl r2, r2, #0x18
	add r0, r5, #0
	add r1, r6, #0
	lsr r2, r2, #0x18
	bl ov01_021E98F0
	cmp r0, #0
	beq _02056138
	ldr r0, [r4, #0x18]
	bl ov01_021E90D4
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	b _02056138
_02056134:
	mov r0, #1
	pop {r4, r5, r6, pc}
_02056138:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020560C4

	thumb_func_start sub_0205613C
sub_0205613C: ; 0x0205613C
	push {r4, r5, r6, lr}
	add r4, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02050650
	add r4, r0, #0
	ldrh r0, [r4, #2]
	cmp r0, #4
	bhi _02056218
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02056160: ; jump table
	.short _0205616A - _02056160 - 2 ; case 0
	.short _020561A8 - _02056160 - 2 ; case 1
	.short _020561DA - _02056160 - 2 ; case 2
	.short _020561F8 - _02056160 - 2 ; case 3
	.short _0205620C - _02056160 - 2 ; case 4
_0205616A:
	add r0, r5, #0
	bl sub_02069F88
	cmp r0, #0
	beq _020561A0
	add r0, r5, #0
	bl sub_02069FB0
	cmp r0, #0
	beq _020561A0
	add r0, r5, #0
	bl sub_02069D68
	bl sub_02062198
	cmp r0, #0
	beq _02056218
	add r0, r5, #0
	bl sub_02069D68
	mov r1, #0x37
	bl sub_0205FC94
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	b _02056218
_020561A0:
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	b _02056218
_020561A8:
	ldr r0, [r5, #0x40]
	bl sub_0205C654
	add r6, r0, #0
	ldr r0, [r5, #0x40]
	bl sub_0205C6DC
	cmp r6, #2
	bne _020561C2
	mov r1, #0xa
	bl sub_0206214C
	b _020561D2
_020561C2:
	cmp r6, #3
	bne _020561CE
	mov r1, #0xb
	bl sub_0206214C
	b _020561D2
_020561CE:
	bl GF_AssertFail
_020561D2:
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	b _02056218
_020561DA:
	ldr r0, [r5, #0x40]
	bl sub_0205C6DC
	add r5, r0, #0
	bl sub_02062198
	cmp r0, #1
	bne _02056218
	add r0, r5, #0
	bl sub_020621C0
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	b _02056218
_020561F8:
	ldr r0, _0205621C ; =0x00000602
	bl PlaySE
	mov r0, #0
	bl ov01_021E636C
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	b _02056218
_0205620C:
	bl sub_0200FB5C
	cmp r0, #0
	beq _02056218
	mov r0, #1
	pop {r4, r5, r6, pc}
_02056218:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0205621C: .word 0x00000602
	thumb_func_end sub_0205613C

	thumb_func_start sub_02056220
sub_02056220: ; 0x02056220
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_0205064C
	add r6, r0, #0
	add r0, r5, #0
	bl sub_02050650
	add r4, r0, #0
	ldr r0, [r6, #0x40]
	bl sub_0205C6DC
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _02056244
	cmp r0, #1
	beq _0205625A
	b _0205625E
_02056244:
	bl ov01_021E9C30
	add r2, r0, #0
	ldr r1, _02056264 ; =ov01_021E9F78
	add r0, r5, #0
	bl sub_02050530
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	b _0205625E
_0205625A:
	mov r0, #1
	pop {r4, r5, r6, pc}
_0205625E:
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_02056264: .word ov01_021E9F78
	thumb_func_end sub_02056220

	thumb_func_start sub_02056268
sub_02056268: ; 0x02056268
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_0205064C
	add r6, r0, #0
	add r0, r5, #0
	bl sub_02050650
	add r4, r0, #0
	ldr r0, [r6, #0x40]
	bl sub_0205C6DC
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _0205628C
	cmp r0, #1
	beq _020562A2
	b _020562A6
_0205628C:
	bl ov01_021E9C30
	add r2, r0, #0
	ldr r1, _020562AC ; =ov01_021E9EEC
	add r0, r5, #0
	bl sub_02050530
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	b _020562A6
_020562A2:
	mov r0, #1
	pop {r4, r5, r6, pc}
_020562A6:
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_020562AC: .word ov01_021E9EEC
	thumb_func_end sub_02056268

	thumb_func_start sub_020562B0
sub_020562B0: ; 0x020562B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	bl sub_0205064C
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02050650
	add r5, r0, #0
	ldrh r0, [r5, #2]
	cmp r0, #3
	bls _020562CC
	b _02056418
_020562CC:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_020562D8: ; jump table
	.short _020562E0 - _020562D8 - 2 ; case 0
	.short _02056396 - _020562D8 - 2 ; case 1
	.short _020563E8 - _020562D8 - 2 ; case 2
	.short _020563FC - _020562D8 - 2 ; case 3
_020562E0:
	ldr r0, [r4, #0x40]
	bl sub_0205C6DC
	str r0, [sp]
	bl sub_020621C0
	mov r1, #2
	ldr r0, [r4, #0x40]
	lsl r1, r1, #8
	bl ov01_021F1AFC
	ldr r0, [r4, #0x40]
	bl ov01_021F1B04
	ldr r0, [sp]
	mov r1, #0
	bl sub_0205F328
	mov r0, #0xb
	mov r1, #8
	bl AllocFromHeapAtEnd
	str r0, [r5, #0x18]
	add r7, r0, #0
	mov r0, #0
	str r0, [r7]
	ldr r0, [r4, #0x40]
	bl sub_0205C654
	str r0, [r7, #4]
	ldr r0, [r4, #0x40]
	mov r1, #0
	bl sub_0205C858
	ldr r0, [r4, #0x2c]
	bl ov01_021F6304
	add r0, r4, #0
	bl sub_02069F88
	cmp r0, #0
	beq _0205638E
	add r0, r4, #0
	mov r7, #1
	bl sub_02069D68
	bl sub_0205F2A8
	cmp r0, #3
	bhi _02056368
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02056350: ; jump table
	.short _02056358 - _02056350 - 2 ; case 0
	.short _0205635C - _02056350 - 2 ; case 1
	.short _02056360 - _02056350 - 2 ; case 2
	.short _02056364 - _02056350 - 2 ; case 3
_02056358:
	mov r6, #0xc
	b _0205636E
_0205635C:
	mov r6, #0xd
	b _0205636E
_02056360:
	mov r6, #0xe
	b _0205636E
_02056364:
	mov r6, #0xf
	b _0205636E
_02056368:
	bl GF_AssertFail
	mov r7, #0
_0205636E:
	cmp r7, #0
	beq _0205638E
	ldr r0, [sp]
	bl sub_0205F8FC
	add r7, r0, #0
	ldr r0, [sp]
	bl sub_0205F90C
	add r4, #0xe4
	add r2, r0, #0
	add r0, r6, #0
	add r1, r7, #0
	add r3, r4, #0
	bl ov01_02205990
_0205638E:
	ldrh r0, [r5, #2]
	add r0, r0, #1
	strh r0, [r5, #2]
	b _02056418
_02056396:
	ldr r0, [r4, #0x40]
	bl sub_0205C6DC
	ldr r4, [r5, #0x18]
	add r6, r0, #0
	ldr r1, [r4]
	add r1, r1, #1
	str r1, [r4]
	add r1, sp, #4
	bl sub_0205F944
	ldr r0, [r4, #4]
	cmp r0, #1
	bne _020563C8
	mov r0, #2
	ldr r1, [sp, #8]
	lsl r0, r0, #0xa
	add r0, r1, r0
	str r0, [sp, #8]
	mov r0, #6
	ldr r1, [sp, #0xc]
	lsl r0, r0, #0xa
	sub r0, r1, r0
	str r0, [sp, #0xc]
	b _020563D2
_020563C8:
	mov r0, #2
	ldr r1, [sp, #8]
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [sp, #8]
_020563D2:
	add r0, r6, #0
	add r1, sp, #4
	bl sub_0205F954
	ldr r0, [r4]
	cmp r0, #0x10
	blt _02056418
	ldrh r0, [r5, #2]
	add r0, r0, #1
	strh r0, [r5, #2]
	b _02056418
_020563E8:
	ldr r0, _02056420 ; =0x00000602
	bl PlaySE
	mov r0, #0
	bl ov01_021E636C
	ldrh r0, [r5, #2]
	add r0, r0, #1
	strh r0, [r5, #2]
	b _02056418
_020563FC:
	bl sub_0200FB5C
	cmp r0, #0
	beq _02056418
	ldr r0, [r4, #0x40]
	mov r1, #1
	bl sub_0205C874
	ldr r0, [r5, #0x18]
	bl FreeToHeap
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02056418:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02056420: .word 0x00000602
	thumb_func_end sub_020562B0

	thumb_func_start sub_02056424
sub_02056424: ; 0x02056424
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02050650
	add r4, r0, #0
	ldrh r0, [r4, #2]
	cmp r0, #4
	bhi _02056524
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0205644A: ; jump table
	.short _02056454 - _0205644A - 2 ; case 0
	.short _02056474 - _0205644A - 2 ; case 1
	.short _020564BE - _0205644A - 2 ; case 2
	.short _020564F4 - _0205644A - 2 ; case 3
	.short _02056508 - _0205644A - 2 ; case 4
_02056454:
	ldr r0, [r5, #0x40]
	bl sub_0205C6DC
	add r5, r0, #0
	bl sub_02062108
	cmp r0, #0
	beq _02056524
	add r0, r5, #0
	mov r1, #0
	bl sub_0206214C
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	b _02056524
_02056474:
	ldr r0, [r5, #0x40]
	bl sub_0205C6DC
	add r6, r0, #0
	bl sub_02062108
	cmp r0, #0
	beq _02056524
	add r0, r6, #0
	bl sub_020621C0
	mov r1, #2
	ldr r0, [r5, #0x40]
	lsl r1, r1, #8
	bl ov01_021F1AFC
	ldr r0, [r5, #0x40]
	bl ov01_021F1B04
	add r0, r6, #0
	mov r1, #0
	bl sub_0205F328
	mov r0, #0xb
	mov r1, #8
	bl AllocFromHeapAtEnd
	str r0, [r4, #0x18]
	mov r1, #0
	str r1, [r0]
	ldr r0, [r5, #0x40]
	bl sub_0205C858
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	b _02056524
_020564BE:
	ldr r0, [r5, #0x40]
	bl sub_0205C6DC
	ldr r5, [r4, #0x18]
	add r6, r0, #0
	ldr r1, [r5]
	add r1, r1, #1
	str r1, [r5]
	add r1, sp, #0
	bl sub_0205F944
	mov r0, #2
	ldr r1, [sp, #4]
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [sp, #4]
	add r0, r6, #0
	add r1, sp, #0
	bl sub_0205F954
	ldr r0, [r5]
	cmp r0, #0x10
	blt _02056524
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	b _02056524
_020564F4:
	ldr r0, _0205652C ; =0x00000602
	bl PlaySE
	mov r0, #0
	bl ov01_021E636C
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	b _02056524
_02056508:
	bl sub_0200FB5C
	cmp r0, #0
	beq _02056524
	ldr r0, [r5, #0x40]
	mov r1, #1
	bl sub_0205C874
	ldr r0, [r4, #0x18]
	bl FreeToHeap
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_02056524:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_0205652C: .word 0x00000602
	thumb_func_end sub_02056424

	thumb_func_start sub_02056530
sub_02056530: ; 0x02056530
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	bl sub_0205064C
	add r4, r0, #0
	add r0, r6, #0
	bl sub_02050650
	add r5, r0, #0
	ldrh r0, [r5, #2]
	cmp r0, #3
	bhi _020565F4
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02056554: ; jump table
	.short _0205655C - _02056554 - 2 ; case 0
	.short _020565A6 - _02056554 - 2 ; case 1
	.short _020565CC - _02056554 - 2 ; case 2
	.short _020565F0 - _02056554 - 2 ; case 3
_0205655C:
	ldr r0, [r4, #0x40]
	bl sub_0205C6DC
	add r7, r0, #0
	ldr r0, [r4, #0x40]
	bl sub_0205C67C
	str r0, [sp]
	ldr r0, [r4, #0x40]
	bl sub_0205C688
	add r2, r0, #0
	ldr r1, [sp]
	add r0, r4, #0
	bl sub_02054918
	bl sub_0205B70C
	cmp r0, #0
	beq _02056592
	add r0, r7, #0
	mov r1, #1
	bl sub_0205F690
	mov r0, #1
	strh r0, [r5, #2]
	b _020565F4
_02056592:
	bl ov01_021E9C30
	add r2, r0, #0
	ldr r1, _020565F8 ; =ov01_021E9FF8
	add r0, r6, #0
	bl sub_02050530
	mov r0, #3
	strh r0, [r5, #2]
	b _020565F4
_020565A6:
	bl ov01_021E90C0
	str r0, [r5, #0x18]
	ldr r0, [r4, #0x40]
	bl sub_0205C67C
	add r6, r0, #0
	ldr r0, [r4, #0x40]
	bl sub_0205C688
	add r1, r0, #0
	ldr r2, [r5, #0x18]
	add r0, r6, #0
	bl ov01_021E90DC
	ldrh r0, [r5, #2]
	add r0, r0, #1
	strh r0, [r5, #2]
	b _020565F4
_020565CC:
	ldr r5, [r5, #0x18]
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_021E9374
	cmp r0, #0
	beq _020565F4
	add r0, r5, #0
	bl ov01_021E90D4
	ldr r0, [r4, #0x40]
	bl sub_0205C6DC
	mov r1, #0
	bl sub_0205F690
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_020565F0:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_020565F4:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020565F8: .word ov01_021E9FF8
	thumb_func_end sub_02056530

	thumb_func_start sub_020565FC
sub_020565FC: ; 0x020565FC
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r6, #0
	bl sub_02050650
	add r4, r0, #0
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _0205661A
	cmp r0, #1
	beq _02056670
	b _02056674
_0205661A:
	ldr r0, [r5, #0x40]
	bl sub_0205C6DC
	add r7, r0, #0
	ldr r0, [r5, #0x40]
	bl sub_0205C67C
	str r0, [sp]
	ldr r0, [r5, #0x40]
	bl sub_0205C688
	add r2, r0, #0
	ldr r1, [sp]
	add r0, r5, #0
	bl sub_02054918
	bl sub_0205B70C
	cmp r0, #0
	beq _0205665A
	add r0, r7, #0
	mov r1, #1
	bl sub_0205F690
	mov r0, #1
	strh r0, [r4, #2]
	ldr r1, _02056678 ; =sub_02056530
	add r0, r6, #0
	add r2, r4, #0
	bl sub_02050510
	b _02056674
_0205665A:
	bl ov01_021E9C30
	add r2, r0, #0
	ldr r1, _0205667C ; =ov01_021EA128
	add r0, r6, #0
	bl sub_02050530
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	b _02056674
_02056670:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02056674:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02056678: .word sub_02056530
_0205667C: .word ov01_021EA128
	thumb_func_end sub_020565FC
