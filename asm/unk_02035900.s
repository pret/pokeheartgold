	.include "asm/macros.inc"
	.include "global.inc"

	.data

_0210F900:
	.byte 0x04, 0x04

	.bss

_021D4140:
	.space 0xC

	.text

	thumb_func_start sub_02035900
sub_02035900: ; 0x02035900
	push {r4, r5, r6, lr}
	add r5, r1, #0
	mov r4, #0
	ldr r1, _02035AB8 ; =_021D4140
	cmp r0, #0
	strb r4, [r1, #1]
	bne _02035910
	b _02035A58
_02035910:
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02033FC4
	add r6, r0, #1
	ldr r0, _02035AB8 ; =_021D4140
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _0203592A
	mov r0, #1
	pop {r4, r5, r6, pc}
_0203592A:
	mov r0, #0xf
	bl sub_020379A0
	mov r1, #0x6e
	mov r0, #0xf
	lsl r1, r1, #4
	bl AllocFromHeap
	ldr r2, _02035AB8 ; =_021D4140
	mov r1, #0x1f
	add r3, r0, #0
	and r3, r1
	mov r1, #0x20
	sub r1, r1, r3
	str r0, [r2, #4]
	add r0, r1, r0
	str r0, [r2, #8]
	mov r2, #0x1b
	add r1, r4, #0
	lsl r2, r2, #6
	bl MI_CpuFill8
	bl sub_0203993C
	bl sub_02034044
	cmp r0, #0
	beq _02035972
	ldr r0, _02035AB8 ; =_021D4140
	lsl r2, r5, #1
	ldr r1, [r0, #8]
	mov r0, #0x69
	add r2, #0x40
	lsl r0, r0, #4
	str r2, [r1, r0]
	b _0203597E
_02035972:
	ldr r0, _02035AB8 ; =_021D4140
	add r5, #0x40
	ldr r1, [r0, #8]
	mov r0, #0x69
	lsl r0, r0, #4
	str r5, [r1, r0]
_0203597E:
	ldr r2, _02035AB8 ; =_021D4140
	mov r1, #0x69
	ldr r0, [r2, #8]
	lsl r1, r1, #4
	ldr r3, [r0, r1]
	add r5, r3, #0
	mul r5, r6
	sub r3, r1, #4
	str r5, [r0, r3]
	add r0, r1, #0
	ldr r3, [r2, #8]
	mov r5, #0
	add r0, #0x1d
	strb r5, [r3, r0]
	add r0, r1, #0
	ldr r3, [r2, #8]
	mov r5, #0x2a
	add r0, #0x1e
	strb r5, [r3, r0]
	ldr r2, [r2, #8]
	mov r0, #0xf
	ldr r1, [r2, r1]
	lsl r1, r1, #1
	bl AllocFromHeap
	ldr r2, _02035AB8 ; =_021D4140
	mov r1, #0x49
	ldr r3, [r2, #8]
	lsl r1, r1, #4
	str r0, [r3, r1]
	mov r1, #0x69
	ldr r2, [r2, #8]
	lsl r1, r1, #4
	ldr r1, [r2, r1]
	mov r0, #0xf
	bl AllocFromHeap
	ldr r2, _02035AB8 ; =_021D4140
	ldr r1, _02035ABC ; =0x00000494
	ldr r3, [r2, #8]
	str r0, [r3, r1]
	ldr r2, [r2, #8]
	ldr r1, _02035AC0 ; =0x0000068C
	mov r0, #0xf
	ldr r1, [r2, r1]
	bl AllocFromHeap
	ldr r2, _02035AB8 ; =_021D4140
	ldr r1, _02035AC4 ; =0x0000048C
	ldr r3, [r2, #8]
	str r0, [r3, r1]
	ldr r2, [r2, #8]
	ldr r1, _02035AC0 ; =0x0000068C
	mov r0, #0xf
	ldr r1, [r2, r1]
	bl AllocFromHeap
	ldr r1, _02035AB8 ; =_021D4140
	ldr r2, [r1, #8]
	ldr r1, _02035AC8 ; =0x00000488
	str r0, [r2, r1]
	bl sub_0203993C
	cmp r0, #0xa
	bne _02035A2C
	ldr r0, _02035AB8 ; =_021D4140
	mov r2, #0x16
	ldr r3, [r0, #8]
	lsl r2, r2, #6
	add r0, r3, r2
	sub r2, #0xe8
	mov r1, #0x64
	add r2, r3, r2
	bl sub_02033F44
	ldr r0, _02035AB8 ; =_021D4140
	mov r2, #0x5a
	mov r1, #0x32
	ldr r3, [r0, #8]
	lsl r2, r2, #4
	add r0, r3, r2
	sub r2, #0x90
	lsl r1, r1, #4
	add r2, r3, r2
	bl sub_02033F44
	b _02035A64
_02035A2C:
	ldr r0, _02035AB8 ; =_021D4140
	mov r2, #0x16
	ldr r3, [r0, #8]
	lsl r2, r2, #6
	add r0, r3, r2
	sub r2, #0xe8
	mov r1, #0x14
	add r2, r3, r2
	bl sub_02033F44
	ldr r0, _02035AB8 ; =_021D4140
	mov r2, #0x5a
	add r1, r5, #0
	ldr r3, [r0, #8]
	lsl r2, r2, #4
	add r0, r3, r2
	sub r2, #0x90
	add r1, #0xee
	add r2, r3, r2
	bl sub_02033F44
	b _02035A64
_02035A58:
	ldr r0, [r1, #8]
	mov r4, #1
	cmp r0, #0
	bne _02035A64
	bl GF_AssertFail
_02035A64:
	ldr r2, _02035AB8 ; =_021D4140
	ldr r1, _02035ACC ; =0x00000694
	ldr r3, [r2, #8]
	mov r0, #0
	strh r0, [r3, r1]
	mov r5, #0xff
	add r1, #0x12
_02035A72:
	ldr r3, [r2, #8]
	add r3, r3, r0
	add r0, r0, #1
	strb r5, [r3, r1]
	cmp r0, #4
	blt _02035A72
	cmp r4, #0
	bne _02035A86
	bl sub_02035DA4
_02035A86:
	ldr r0, _02035AB8 ; =_021D4140
	ldr r1, [r0, #8]
	ldr r0, _02035AD0 ; =0x0000062C
	add r0, r1, r0
	bl sub_0203778C
	cmp r4, #0
	bne _02035AA8
	mov r1, #0
	ldr r0, _02035AD4 ; =sub_020360EC
	add r2, r1, #0
	bl sub_0200E33C
	ldr r1, _02035AB8 ; =_021D4140
	ldr r2, [r1, #8]
	ldr r1, _02035AD8 ; =0x0000057C
	str r0, [r2, r1]
_02035AA8:
	ldr r0, _02035AB8 ; =_021D4140
	mov r2, #0
	ldr r1, [r0, #8]
	ldr r0, _02035ADC ; =0x000006B6
	strb r2, [r1, r0]
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_02035AB8: .word _021D4140
_02035ABC: .word 0x00000494
_02035AC0: .word 0x0000068C
_02035AC4: .word 0x0000048C
_02035AC8: .word 0x00000488
_02035ACC: .word 0x00000694
_02035AD0: .word 0x0000062C
_02035AD4: .word sub_020360EC
_02035AD8: .word 0x0000057C
_02035ADC: .word 0x000006B6
	thumb_func_end sub_02035900

	thumb_func_start sub_02035AE0
sub_02035AE0: ; 0x02035AE0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02033FC4
	mov r2, #0x66
	ldr r3, _02035D5C ; =_021D4140
	add r7, r0, #1
	ldr r0, [r3, #8]
	mov r1, #0
	lsl r2, r2, #4
	strb r1, [r0, r2]
	add r0, r2, #1
	ldr r4, [r3, #8]
	add r2, #0x2c
	strb r1, [r4, r0]
	ldr r3, [r3, #8]
	ldr r0, _02035D60 ; =0x0000048C
	ldr r2, [r3, r2]
	ldr r0, [r3, r0]
	bl MI_CpuFill8
	ldr r0, _02035D5C ; =_021D4140
	mov r2, #0x60
	ldr r1, [r0, #8]
	ldr r0, _02035D64 ; =0x0000051C
	add r0, r1, r0
	mov r1, #0
	bl MI_CpuFill8
	ldr r0, _02035D5C ; =_021D4140
	ldr r1, [r0, #8]
	ldr r0, _02035D68 ; =0x0000068C
	ldr r0, [r1, r0]
	add r1, r7, #0
	bl _s32_div_f
	add r4, r0, #0
	mov r0, #0
	str r0, [sp, #4]
	cmp r7, #0
	ble _02035B62
	add r6, r0, #0
	add r5, r0, #0
_02035B3E:
	ldr r0, _02035D5C ; =_021D4140
	ldr r2, _02035D60 ; =0x0000048C
	ldr r1, [r0, #8]
	ldr r0, _02035D64 ; =0x0000051C
	add r0, r1, r0
	ldr r1, [r1, r2]
	add r0, r0, r5
	add r1, r1, r6
	add r2, r4, #0
	bl sub_02033AE0
	ldr r0, [sp, #4]
	add r6, r6, r4
	add r0, r0, #1
	add r5, #0xc
	str r0, [sp, #4]
	cmp r0, r7
	blt _02035B3E
_02035B62:
	ldr r0, _02035D5C ; =_021D4140
	ldr r2, _02035D68 ; =0x0000068C
	ldr r3, [r0, #8]
	ldr r0, _02035D6C ; =0x00000488
	ldr r2, [r3, r2]
	ldr r0, [r3, r0]
	mov r1, #0
	bl MI_CpuFill8
	ldr r0, _02035D5C ; =_021D4140
	mov r2, #0x60
	ldr r1, [r0, #8]
	mov r0, #0x4b
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	bl MI_CpuFill8
	mov r0, #0
	str r0, [sp]
	cmp r7, #0
	ble _02035BB8
	add r6, r0, #0
	add r5, r0, #0
_02035B92:
	ldr r0, _02035D5C ; =_021D4140
	ldr r2, _02035D6C ; =0x00000488
	ldr r1, [r0, #8]
	mov r0, #0x4b
	lsl r0, r0, #4
	add r0, r1, r0
	ldr r1, [r1, r2]
	add r0, r0, r5
	add r1, r1, r6
	add r2, r4, #0
	bl sub_02033AE0
	ldr r0, [sp]
	add r6, r6, r4
	add r0, r0, #1
	add r5, #0xc
	str r0, [sp]
	cmp r0, r7
	blt _02035B92
_02035BB8:
	ldr r0, _02035D5C ; =_021D4140
	mov r2, #6
	ldr r1, [r0, #8]
	mov r0, #0xc2
	lsl r0, r0, #2
	add r0, r1, r0
	mov r1, #0
	lsl r2, r2, #6
	bl MI_CpuFill8
	ldr r0, _02035D5C ; =_021D4140
	mov r1, #0xc2
	ldr r2, [r0, #8]
	mov r0, #0x51
	lsl r0, r0, #4
	lsl r1, r1, #2
	add r0, r2, r0
	add r1, r2, r1
	mov r2, #6
	lsl r2, r2, #6
	bl sub_02033AE0
	ldr r0, _02035D5C ; =_021D4140
	mov r1, #0xee
	ldr r0, [r0, #8]
	add r2, r1, #0
	add r0, #0x80
	add r2, #0x92
	bl MI_CpuFill8
	ldr r0, _02035D5C ; =_021D4140
	ldr r1, [r0, #8]
	mov r0, #5
	lsl r0, r0, #6
	add r0, r1, r0
	mov r1, #0xee
	add r2, r1, #0
	add r2, #0x92
	bl MI_CpuFill8
	ldr r0, _02035D5C ; =_021D4140
	mov r2, #2
	ldr r0, [r0, #8]
	lsl r2, r2, #8
	add r0, r0, r2
	mov r1, #0
	sub r2, #0xf8
	bl MI_CpuFill8
	ldr r0, _02035D5C ; =_021D4140
	mov r2, #2
	ldr r1, [r0, #8]
	ldr r0, _02035D70 ; =0x00000498
	lsl r2, r2, #8
	add r0, r1, r0
	add r1, r1, r2
	sub r2, #0xf8
	bl sub_02033AE0
	ldr r0, _02035D5C ; =_021D4140
	mov r1, #0xee
	ldr r0, [r0, #8]
	mov r2, #0x26
	bl MI_CpuFill8
	ldr r0, _02035D5C ; =_021D4140
	mov r1, #0xee
	ldr r0, [r0, #8]
	mov r2, #0x26
	add r0, #0x40
	bl MI_CpuFill8
	ldr r0, _02035D5C ; =_021D4140
	mov r2, #0xff
	ldr r1, [r0, #8]
	strb r2, [r1]
	ldr r1, [r0, #8]
	add r1, #0x40
	strb r2, [r1]
	ldr r3, [r0, #8]
	mov r2, #0x69
	mov r0, #0x49
	lsl r2, r2, #4
	lsl r0, r0, #4
	ldr r2, [r3, r2]
	ldr r0, [r3, r0]
	mov r1, #0
	lsl r2, r2, #1
	bl MI_CpuFill8
	ldr r0, _02035D5C ; =_021D4140
	mov r2, #0x69
	ldr r3, [r0, #8]
	ldr r1, _02035D74 ; =0x000004A4
	lsl r2, r2, #4
	add r0, r3, r1
	sub r1, #0x14
	ldr r2, [r3, r2]
	ldr r1, [r3, r1]
	lsl r2, r2, #1
	bl sub_02033AE0
	ldr r0, _02035D5C ; =_021D4140
	mov r2, #0
	ldr r3, [r0, #8]
	ldr r1, _02035D78 ; =0x000006B4
	mov ip, r2
	strb r2, [r3, r1]
	ldr r3, [r0, #8]
	add r1, r1, #1
	strb r2, [r3, r1]
	add r1, r2, #0
	add r7, r2, #0
	add r6, r2, #0
_02035C9C:
	ldr r3, [r0, #8]
	add r4, r3, r2
	ldr r3, _02035D7C ; =0x00000696
	strb r6, [r4, r3]
	ldr r3, [r0, #8]
	ldr r4, _02035D80 ; =0x0000069E
	add r5, r3, r2
	mov r3, #1
	strb r3, [r5, r4]
	ldr r4, [r0, #8]
	mov r3, ip
	add r4, r4, r3
	ldr r3, _02035D84 ; =0x00000644
	add r2, r2, #1
	strh r6, [r4, r3]
	ldr r3, [r0, #8]
	mov r4, #0xee
	add r5, r3, r1
	ldr r3, _02035D88 ; =0x000005CA
	strb r4, [r5, r3]
	ldr r3, [r0, #8]
	ldr r4, _02035D8C ; =0x0000FFFF
	add r5, r3, r1
	ldr r3, _02035D90 ; =0x000005C8
	strh r4, [r5, r3]
	ldr r3, [r0, #8]
	add r4, r3, r1
	ldr r3, _02035D94 ; =0x000005C4
	str r6, [r4, r3]
	ldr r3, [r0, #8]
	add r4, r3, r1
	mov r3, #0x17
	lsl r3, r3, #6
	str r6, [r4, r3]
	ldr r3, [r0, #8]
	add r1, #0xc
	add r4, r3, r7
	ldr r3, _02035D98 ; =0x0000066C
	add r7, r7, #4
	str r6, [r4, r3]
	mov r3, ip
	add r3, r3, #2
	mov ip, r3
	cmp r2, #8
	blt _02035C9C
	ldr r1, _02035D5C ; =_021D4140
	ldr r0, _02035D9C ; =0x00000668
	ldr r2, [r1, #8]
	add r3, r0, #0
	str r6, [r2, r0]
	ldr r4, [r1, #8]
	sub r3, #0x3e
	mov r2, #0xee
	strb r2, [r4, r3]
	add r3, r0, #0
	ldr r4, [r1, #8]
	ldr r2, _02035D8C ; =0x0000FFFF
	sub r3, #0x40
	strh r2, [r4, r3]
	add r2, r0, #0
	ldr r3, [r1, #8]
	sub r2, #0x44
	str r6, [r3, r2]
	add r2, r0, #0
	ldr r3, [r1, #8]
	sub r2, #0x48
	str r6, [r3, r2]
	add r3, r0, #0
	ldr r4, [r1, #8]
	add r3, #0x4a
	mov r2, #1
	strb r2, [r4, r3]
	add r3, r0, #0
	ldr r4, [r1, #8]
	add r3, #0x4b
	strb r2, [r4, r3]
	strb r6, [r1]
	ldr r1, [r1, #8]
	sub r0, #0xe8
	add r0, r1, r0
	bl sub_02033F70
	ldr r0, _02035D5C ; =_021D4140
	ldr r1, [r0, #8]
	mov r0, #0x5a
	lsl r0, r0, #4
	add r0, r1, r0
	bl sub_02033F70
	ldr r0, _02035D5C ; =_021D4140
	mov r2, #0
	ldr r1, [r0, #8]
	ldr r0, _02035DA0 ; =0x000006B7
	strb r2, [r1, r0]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02035D5C: .word _021D4140
_02035D60: .word 0x0000048C
_02035D64: .word 0x0000051C
_02035D68: .word 0x0000068C
_02035D6C: .word 0x00000488
_02035D70: .word 0x00000498
_02035D74: .word 0x000004A4
_02035D78: .word 0x000006B4
_02035D7C: .word 0x00000696
_02035D80: .word 0x0000069E
_02035D84: .word 0x00000644
_02035D88: .word 0x000005CA
_02035D8C: .word 0x0000FFFF
_02035D90: .word 0x000005C8
_02035D94: .word 0x000005C4
_02035D98: .word 0x0000066C
_02035D9C: .word 0x00000668
_02035DA0: .word 0x000006B7
	thumb_func_end sub_02035AE0

	thumb_func_start sub_02035DA4
sub_02035DA4: ; 0x02035DA4
	push {r4, lr}
	ldr r2, _02035DCC ; =_021D4140
	ldr r1, _02035DD0 ; =0x000006AF
	ldr r0, [r2, #8]
	mov r4, #0
	strb r4, [r0, r1]
	ldr r3, [r2, #8]
	add r0, r1, #1
	strb r4, [r3, r0]
	ldr r0, [r2, #8]
	mov r3, #1
	sub r1, #0x4b
	str r3, [r0, r1]
	bl sub_02035AE0
	ldr r0, _02035DD4 ; =_0210F900
	mov r1, #4
	strb r1, [r0]
	strb r1, [r0, #1]
	pop {r4, pc}
	.balign 4, 0
_02035DCC: .word _021D4140
_02035DD0: .word 0x000006AF
_02035DD4: .word _0210F900
	thumb_func_end sub_02035DA4

	thumb_func_start sub_02035DD8
sub_02035DD8: ; 0x02035DD8
	ldr r3, _02035DDC ; =sub_02035AE0
	bx r3
	.balign 4, 0
_02035DDC: .word sub_02035AE0
	thumb_func_end sub_02035DD8

	thumb_func_start sub_02035DE0
sub_02035DE0: ; 0x02035DE0
	push {r3, r4, r5, r6, r7, lr}
	ldr r4, _02035E84 ; =_021D4140
	add r5, r0, #0
	ldr r0, [r4, #8]
	ldr r3, _02035E88 ; =0x00000696
	mov r1, #0
	add r0, r0, r5
	strb r1, [r0, r3]
	ldr r2, [r4, #8]
	mov r0, #1
	add r6, r2, r5
	add r2, r3, #0
	add r2, #8
	strb r0, [r6, r2]
	ldr r2, [r4, #8]
	lsl r0, r5, #2
	add r0, r2, r0
	sub r3, #0x2a
	str r1, [r0, r3]
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02033FC4
	add r1, r0, #0
	add r0, r4, #0
	ldr r6, [r0, #8]
	ldr r0, _02035E8C ; =0x0000068C
	add r1, r1, #1
	ldr r0, [r6, r0]
	bl _s32_div_f
	add r7, r5, #0
	mov r1, #0x4b
	str r0, [sp]
	mul r7, r0
	mov r0, #0xc
	add r4, r5, #0
	lsl r1, r1, #4
	mul r4, r0
	add r0, r6, r1
	sub r1, #0x28
	ldr r1, [r6, r1]
	ldr r2, [sp]
	add r0, r0, r4
	add r1, r1, r7
	bl sub_02033AE0
	ldr r0, _02035E84 ; =_021D4140
	ldr r1, _02035E90 ; =0x0000051C
	ldr r2, [r0, #8]
	add r0, r2, r1
	sub r1, #0x90
	ldr r1, [r2, r1]
	ldr r2, [sp]
	add r0, r0, r4
	add r1, r1, r7
	bl sub_02033AE0
	ldr r3, _02035E84 ; =_021D4140
	ldr r2, _02035E94 ; =0x000005CA
	ldr r0, [r3, #8]
	mov r1, #0xee
	add r0, r0, r4
	strb r1, [r0, r2]
	ldr r0, [r3, #8]
	ldr r5, _02035E98 ; =0x0000FFFF
	add r1, r0, r4
	sub r0, r2, #2
	strh r5, [r1, r0]
	ldr r1, [r3, #8]
	mov r0, #0
	add r5, r1, r4
	sub r1, r2, #6
	str r0, [r5, r1]
	ldr r1, [r3, #8]
	sub r2, #0xa
	add r1, r1, r4
	str r0, [r1, r2]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02035E84: .word _021D4140
_02035E88: .word 0x00000696
_02035E8C: .word 0x0000068C
_02035E90: .word 0x0000051C
_02035E94: .word 0x000005CA
_02035E98: .word 0x0000FFFF
	thumb_func_end sub_02035DE0

	thumb_func_start sub_02035E9C
sub_02035E9C: ; 0x02035E9C
	push {r4, r5, r6, lr}
	ldr r4, _02035EC8 ; =_021D4140
	ldr r6, _02035ECC ; =0x0000069E
	mov r5, #1
_02035EA4:
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	bl sub_020373B4
	cmp r0, #0
	bne _02035EC0
	ldr r0, [r4, #8]
	add r0, r0, r5
	ldrb r0, [r0, r6]
	cmp r0, #0
	bne _02035EC0
	add r0, r5, #0
	bl sub_02035DE0
_02035EC0:
	add r5, r5, #1
	cmp r5, #8
	blt _02035EA4
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02035EC8: .word _021D4140
_02035ECC: .word 0x0000069E
	thumb_func_end sub_02035E9C

	thumb_func_start sub_02035ED0
sub_02035ED0: ; 0x02035ED0
	ldr r3, _02035ED4 ; =sub_02035DE0
	bx r3
	.balign 4, 0
_02035ED4: .word sub_02035DE0
	thumb_func_end sub_02035ED0

	thumb_func_start sub_02035ED8
sub_02035ED8: ; 0x02035ED8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	str r3, [sp]
	mov r4, #1
	bl sub_0203993C
	bl sub_02034044
	cmp r0, #0
	bne _02035F02
	ldr r2, [sp]
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02034EF0
	add r4, r0, #0
	ldr r0, _02035F10 ; =sub_02035ED0
	bl sub_02033A90
_02035F02:
	add r0, r5, #0
	add r1, r7, #0
	bl sub_02035900
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02035F10: .word sub_02035ED0
	thumb_func_end sub_02035ED8

	thumb_func_start sub_02035F14
sub_02035F14: ; 0x02035F14
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	mov r4, #1
	bl sub_0203993C
	bl sub_02034044
	cmp r0, #0
	bne _02035F34
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02034F64
	add r4, r0, #0
_02035F34:
	add r0, r5, #0
	add r1, r7, #0
	bl sub_02035900
	ldr r0, _02035F48 ; =_0210F900
	mov r1, #4
	strb r1, [r0, #1]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02035F48: .word _0210F900
	thumb_func_end sub_02035F14

	thumb_func_start sub_02035F4C
sub_02035F4C: ; 0x02035F4C
	push {r4, lr}
	mov r4, #0
	bl sub_0203769C
	cmp r0, #0
	bne _02035F62
	ldr r0, _02035F9C ; =_0210F900
	ldrb r0, [r0]
	cmp r0, #4
	beq _02035F6A
	pop {r4, pc}
_02035F62:
	ldr r0, _02035F9C ; =_0210F900
	ldrb r0, [r0, #1]
	cmp r0, #4
	bne _02035F98
_02035F6A:
	ldr r0, _02035FA0 ; =_021D4140
	ldr r2, [r0, #8]
	ldr r0, _02035FA4 ; =0x000006AD
	ldrb r1, [r2, r0]
	cmp r1, #2
	bne _02035F7C
	mov r1, #0
	strb r1, [r2, r0]
	mov r4, #1
_02035F7C:
	ldr r0, _02035FA0 ; =_021D4140
	ldr r2, [r0, #8]
	ldr r0, _02035FA4 ; =0x000006AD
	ldrb r1, [r2, r0]
	cmp r1, #3
	bne _02035F8C
	mov r4, #1
	strb r4, [r2, r0]
_02035F8C:
	cmp r4, #0
	beq _02035F94
	bl sub_02035DD8
_02035F94:
	bl sub_02037594
_02035F98:
	pop {r4, pc}
	nop
_02035F9C: .word _0210F900
_02035FA0: .word _021D4140
_02035FA4: .word 0x000006AD
	thumb_func_end sub_02035F4C

	thumb_func_start sub_02035FA8
sub_02035FA8: ; 0x02035FA8
	ldr r1, _02035FD0 ; =_021D4140
	ldr r3, [r1, #8]
	ldr r1, _02035FD4 ; =0x000006AD
	ldrb r2, [r3, r1]
	cmp r2, #0
	bne _02035FBE
	cmp r0, #1
	bne _02035FBE
	mov r0, #3
	strb r0, [r3, r1]
	bx lr
_02035FBE:
	cmp r2, #1
	bne _02035FCC
	cmp r0, #0
	bne _02035FCC
	ldr r0, _02035FD4 ; =0x000006AD
	mov r1, #2
	strb r1, [r3, r0]
_02035FCC:
	bx lr
	nop
_02035FD0: .word _021D4140
_02035FD4: .word 0x000006AD
	thumb_func_end sub_02035FA8

	thumb_func_start sub_02035FD8
sub_02035FD8: ; 0x02035FD8
	ldr r3, _02035FE0 ; =sub_02035FA8
	mov r0, #1
	bx r3
	nop
_02035FE0: .word sub_02035FA8
	thumb_func_end sub_02035FD8

	thumb_func_start sub_02035FE4
sub_02035FE4: ; 0x02035FE4
	ldr r3, _02035FEC ; =sub_02035FA8
	mov r0, #0
	bx r3
	nop
_02035FEC: .word sub_02035FA8
	thumb_func_end sub_02035FE4

	thumb_func_start sub_02035FF0
sub_02035FF0: ; 0x02035FF0
	ldr r0, _02036008 ; =_021D4140
	ldr r1, [r0, #8]
	ldr r0, _0203600C ; =0x000006AD
	ldrb r0, [r1, r0]
	cmp r0, #2
	bne _02036000
	mov r0, #1
	bx lr
_02036000:
	cmp r0, #3
	bne _02036006
	mov r0, #0
_02036006:
	bx lr
	.balign 4, 0
_02036008: .word _021D4140
_0203600C: .word 0x000006AD
	thumb_func_end sub_02035FF0

	thumb_func_start sub_02036010
sub_02036010: ; 0x02036010
	push {r3, lr}
	bl sub_02035FF0
	cmp r0, #1
	bne _0203601E
	mov r0, #1
	pop {r3, pc}
_0203601E:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02036010

	thumb_func_start sub_02036024
sub_02036024: ; 0x02036024
	push {r4, lr}
	ldr r0, _020360D0 ; =_021D4140
	mov r4, #0
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _0203604E
	bl sub_0203993C
	bl sub_02034044
	cmp r0, #0
	beq _02036044
	bl ov00_021E6CB8
	mov r4, #1
	b _0203604E
_02036044:
	bl sub_0203507C
	cmp r0, #0
	beq _0203604E
	mov r4, #1
_0203604E:
	cmp r4, #0
	beq _020360CE
	bl sub_020379F8
	bl sub_020343E4
	ldr r0, _020360D0 ; =_021D4140
	mov r1, #0
	strb r1, [r0, #1]
	ldr r1, [r0, #8]
	ldr r0, _020360D4 ; =0x0000057C
	ldr r0, [r1, r0]
	bl DestroySysTask
	ldr r1, _020360D0 ; =_021D4140
	ldr r0, _020360D4 ; =0x0000057C
	ldr r2, [r1, #8]
	mov r3, #0
	str r3, [r2, r0]
	ldr r1, [r1, #8]
	sub r0, #0xec
	ldr r0, [r1, r0]
	bl FreeToHeap
	ldr r0, _020360D0 ; =_021D4140
	ldr r1, [r0, #8]
	ldr r0, _020360D8 ; =0x00000494
	ldr r0, [r1, r0]
	bl FreeToHeap
	ldr r0, _020360D0 ; =_021D4140
	ldr r1, [r0, #8]
	ldr r0, _020360DC ; =0x0000048C
	ldr r0, [r1, r0]
	bl FreeToHeap
	ldr r0, _020360D0 ; =_021D4140
	ldr r1, [r0, #8]
	ldr r0, _020360E0 ; =0x00000488
	ldr r0, [r1, r0]
	bl FreeToHeap
	ldr r0, _020360D0 ; =_021D4140
	ldr r1, [r0, #8]
	mov r0, #0x5a
	lsl r0, r0, #4
	add r0, r1, r0
	bl sub_02033F90
	ldr r0, _020360D0 ; =_021D4140
	ldr r1, [r0, #8]
	mov r0, #0x16
	lsl r0, r0, #6
	add r0, r1, r0
	bl sub_02033F90
	ldr r0, _020360D0 ; =_021D4140
	ldr r0, [r0, #4]
	bl FreeToHeap
	ldr r0, _020360D0 ; =_021D4140
	mov r1, #0
	str r1, [r0, #8]
	str r1, [r0, #4]
_020360CE:
	pop {r4, pc}
	.balign 4, 0
_020360D0: .word _021D4140
_020360D4: .word 0x0000057C
_020360D8: .word 0x00000494
_020360DC: .word 0x0000048C
_020360E0: .word 0x00000488
	thumb_func_end sub_02036024

	thumb_func_start sub_020360E4
sub_020360E4: ; 0x020360E4
	ldr r3, _020360E8 ; =sub_02035218
	bx r3
	.balign 4, 0
_020360E8: .word sub_02035218
	thumb_func_end sub_020360E4

	thumb_func_start sub_020360EC
sub_020360EC: ; 0x020360EC
	push {r3, lr}
	ldr r0, _02036118 ; =_021D4140
	ldrb r0, [r0, #1]
	cmp r0, #0
	beq _02036116
	bl sub_02036AD8
	bl sub_0203769C
	cmp r0, #0
	bne _02036110
	mov r0, #0
	bl sub_020373B4
	cmp r0, #0
	beq _02036110
	bl sub_02036508
_02036110:
	ldr r0, _02036118 ; =_021D4140
	mov r1, #0
	strb r1, [r0, #1]
_02036116:
	pop {r3, pc}
	.balign 4, 0
_02036118: .word _021D4140
	thumb_func_end sub_020360EC

	thumb_func_start sub_0203611C
sub_0203611C: ; 0x0203611C
	push {r3, lr}
	bl sub_020357FC
	cmp r0, #0
	beq _02036140
	bl sub_0203769C
	cmp r0, #0
	bne _0203613C
	bl sub_0203567C
	cmp r0, #0
	bne _02036140
	bl sub_02036024
	pop {r3, pc}
_0203613C:
	bl sub_02036024
_02036140:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0203611C

	thumb_func_start sub_02036144
sub_02036144: ; 0x02036144
	push {r4, lr}
	bl sub_0203817C
	ldr r3, _02036214 ; =_021D4140
	ldr r0, [r3, #8]
	cmp r0, #0
	beq _020361FE
	ldr r2, _02036218 ; =0x000006B9
	ldrb r1, [r0, r2]
	cmp r1, #0
	bne _020361E0
	add r1, r2, #3
	ldrb r1, [r0, r1]
	add r4, r1, #1
	add r1, r2, #3
	strb r4, [r0, r1]
	mov r0, #0
	strb r0, [r3, #1]
	bl sub_02035F4C
	ldr r0, _02036214 ; =_021D4140
	ldr r1, _0203621C ; =gSystem
	ldr r0, [r0, #8]
	ldr r2, _02036220 ; =0x0000065C
	ldr r3, [r1, #0x44]
	ldr r1, _02036224 ; =0x00007FFF
	ldrh r4, [r0, r2]
	and r1, r3
	orr r1, r4
	strh r1, [r0, r2]
	bl sub_02036BE4
	bl sub_02036298
	ldr r0, _02036214 ; =_021D4140
	ldr r1, _02036220 ; =0x0000065C
	ldr r3, [r0, #8]
	mov r0, #2
	ldrh r2, [r3, r1]
	lsl r0, r0, #0xe
	and r0, r2
	strh r0, [r3, r1]
	bl sub_02035FF0
	cmp r0, #0
	bne _020361A4
	bl sub_020372E4
_020361A4:
	bl sub_0203769C
	cmp r0, #0
	bne _020361C6
	mov r0, #0
	bl sub_020373B4
	cmp r0, #0
	beq _020361C6
	bl sub_0203993C
	bl sub_02034084
	cmp r0, #0
	bne _020361C6
	bl sub_0203667C
_020361C6:
	bl sub_0203769C
	cmp r0, #0
	beq _020361D6
	bl sub_02035FF0
	cmp r0, #1
	bne _020361DA
_020361D6:
	bl sub_02037334
_020361DA:
	ldr r0, _02036214 ; =_021D4140
	mov r1, #1
	strb r1, [r0, #1]
_020361E0:
	ldr r0, _02036214 ; =_021D4140
	ldr r1, [r0, #8]
	ldr r0, _02036228 ; =0x00000694
	ldrh r0, [r1, r0]
	bl sub_020355C8
	bl sub_0203769C
	cmp r0, #0
	bne _020361F8
	bl sub_02035E9C
_020361F8:
	bl sub_0203611C
	b _02036204
_020361FE:
	mov r0, #0
	bl sub_020355C8
_02036204:
	mov r0, #0
	bl sub_02039A00
	bl sub_02037ADC
	mov r0, #1
	pop {r4, pc}
	nop
_02036214: .word _021D4140
_02036218: .word 0x000006B9
_0203621C: .word gSystem
_02036220: .word 0x0000065C
_02036224: .word 0x00007FFF
_02036228: .word 0x00000694
	thumb_func_end sub_02036144

	thumb_func_start sub_0203622C
sub_0203622C: ; 0x0203622C
	push {r4, lr}
	ldr r0, _02036248 ; =_021D4140
	mov r1, #0
	ldrb r4, [r0, #1]
	strb r1, [r0, #1]
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _02036240
	bl sub_02035DA4
_02036240:
	ldr r0, _02036248 ; =_021D4140
	strb r4, [r0, #1]
	pop {r4, pc}
	nop
_02036248: .word _021D4140
	thumb_func_end sub_0203622C

	thumb_func_start sub_0203624C
sub_0203624C: ; 0x0203624C
	push {r4, lr}
	ldr r0, _0203626C ; =_021D4140
	mov r1, #0
	ldrb r4, [r0, #1]
	strb r1, [r0, #1]
	ldr r2, [r0, #8]
	cmp r2, #0
	beq _02036266
	ldr r0, _02036270 ; =0x000006AD
	mov r1, #1
	strb r1, [r2, r0]
	bl sub_02035DA4
_02036266:
	ldr r0, _0203626C ; =_021D4140
	strb r4, [r0, #1]
	pop {r4, pc}
	.balign 4, 0
_0203626C: .word _021D4140
_02036270: .word 0x000006AD
	thumb_func_end sub_0203624C

	thumb_func_start sub_02036274
sub_02036274: ; 0x02036274
	push {r4, lr}
	ldr r0, _02036294 ; =_021D4140
	mov r1, #0
	ldrb r4, [r0, #1]
	strb r1, [r0, #1]
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _0203628C
	bl sub_02035DA4
	bl sub_02034E2C
_0203628C:
	ldr r0, _02036294 ; =_021D4140
	strb r4, [r0, #1]
	pop {r4, pc}
	nop
_02036294: .word _021D4140
	thumb_func_end sub_02036274

	thumb_func_start sub_02036298
sub_02036298: ; 0x02036298
	push {r3, r4, r5, r6, r7, lr}
	bl sub_0203993C
	bl sub_02034084
	cmp r0, #0
	beq _0203634C
	ldr r0, _02036420 ; =_021D4140
	ldr r1, _02036424 ; =0x000006B6
	ldr r0, [r0, #8]
	ldrb r2, [r0, r1]
	cmp r2, #0
	beq _02036308
	sub r1, #0x52
	ldr r1, [r0, r1]
	cmp r1, #0
	beq _020362DA
	bl sub_02036630
	cmp r0, #0
	beq _020362F8
	ldr r0, _02036428 ; =_0210F900
	ldrb r0, [r0, #1]
	cmp r0, #4
	bne _020362F0
	ldr r0, _02036420 ; =_021D4140
	ldr r0, [r0, #8]
	bl sub_02036E60
	ldr r0, _02036428 ; =_0210F900
	mov r1, #2
	strb r1, [r0, #1]
	b _020362F0
_020362DA:
	ldr r1, _02036428 ; =_0210F900
	ldrb r1, [r1, #1]
	cmp r1, #4
	bne _020362F0
	bl sub_02036E60
	cmp r0, #0
	beq _020362F8
	ldr r0, _02036428 ; =_0210F900
	mov r1, #2
	strb r1, [r0, #1]
_020362F0:
	bl sub_02036FA8
	cmp r0, #0
	beq _020362FA
_020362F8:
	b _0203641C
_020362FA:
	ldr r0, _02036420 ; =_021D4140
	mov r1, #0x26
	ldr r0, [r0, #8]
	bl ov00_021E60E8
	cmp r0, #0
	bne _0203630A
_02036308:
	b _0203641C
_0203630A:
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02033FC4
	add r6, r0, #1
	mov r4, #0
	cmp r6, #0
	ble _02036344
	ldr r7, _02036420 ; =_021D4140
	add r5, r4, #0
_02036322:
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl sub_020373B4
	cmp r0, #0
	beq _0203633C
	ldr r0, [r7, #8]
	ldr r1, _0203642C ; =0x0000066C
	add r0, r0, r5
	ldr r1, [r0, r1]
	add r2, r1, #1
	ldr r1, _0203642C ; =0x0000066C
	str r2, [r0, r1]
_0203633C:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r6
	blt _02036322
_02036344:
	ldr r0, _02036428 ; =_0210F900
	mov r1, #4
	strb r1, [r0, #1]
	pop {r3, r4, r5, r6, r7, pc}
_0203634C:
	bl sub_0203993C
	bl sub_02034044
	cmp r0, #0
	beq _020363CA
	ldr r0, _02036420 ; =_021D4140
	ldr r2, _02036424 ; =0x000006B6
	ldr r0, [r0, #8]
	ldrb r1, [r0, r2]
	cmp r1, #0
	beq _0203641C
	add r1, r2, #0
	sub r1, #0x52
	ldr r1, [r0, r1]
	cmp r1, #0
	beq _0203638A
	sub r2, #0x4e
	ldr r1, [r0, r2]
	cmp r1, #3
	bgt _0203641C
	ldr r1, _02036428 ; =_0210F900
	ldrb r1, [r1, #1]
	cmp r1, #4
	bne _020363A0
	bl sub_02036E60
	ldr r0, _02036428 ; =_0210F900
	mov r1, #2
	strb r1, [r0, #1]
	b _020363A0
_0203638A:
	ldr r1, _02036428 ; =_0210F900
	ldrb r1, [r1, #1]
	cmp r1, #4
	bne _020363A0
	bl sub_02036E60
	cmp r0, #0
	beq _0203641C
	ldr r0, _02036428 ; =_0210F900
	mov r1, #2
	strb r1, [r0, #1]
_020363A0:
	bl sub_02036FA8
	cmp r0, #0
	bne _0203641C
	ldr r0, _02036420 ; =_021D4140
	mov r1, #0x26
	ldr r0, [r0, #8]
	bl ov00_021E5F84
	cmp r0, #0
	beq _0203641C
	ldr r0, _02036428 ; =_0210F900
	mov r1, #4
	strb r1, [r0, #1]
	ldr r0, _02036420 ; =_021D4140
	ldr r2, [r0, #8]
	ldr r0, _02036430 ; =0x00000668
	ldr r1, [r2, r0]
	add r1, r1, #1
	str r1, [r2, r0]
	pop {r3, r4, r5, r6, r7, pc}
_020363CA:
	bl sub_02033298
	cmp r0, #4
	bne _0203641C
	bl sub_0203769C
	bl sub_020373B4
	cmp r0, #0
	beq _0203641C
	ldr r0, _02036428 ; =_0210F900
	ldrb r0, [r0, #1]
	cmp r0, #4
	bne _02036418
	ldr r0, _02036420 ; =_021D4140
	ldr r2, [r0, #8]
	ldr r0, _02036430 ; =0x00000668
	ldr r1, [r2, r0]
	cmp r1, #3
	bgt _02036418
	add r0, #0x47
	ldrb r0, [r2, r0]
	lsl r0, r0, #6
	add r0, r2, r0
	bl sub_02036E60
	ldr r0, _02036420 ; =_021D4140
	ldr r2, [r0, #8]
	ldr r0, _02036434 ; =0x000006AF
	ldrb r1, [r2, r0]
	mov r0, #1
	sub r0, r0, r1
	lsl r0, r0, #6
	add r0, r2, r0
	bl sub_02036E60
	ldr r0, _02036428 ; =_0210F900
	mov r1, #0
	strb r1, [r0, #1]
_02036418:
	bl sub_02036AD8
_0203641C:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02036420: .word _021D4140
_02036424: .word 0x000006B6
_02036428: .word _0210F900
_0203642C: .word 0x0000066C
_02036430: .word 0x00000668
_02036434: .word 0x000006AF
	thumb_func_end sub_02036298

	thumb_func_start sub_02036438
sub_02036438: ; 0x02036438
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	mov r7, #0
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_0203772C
	str r0, [sp, #0xc]
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02033FC4
	add r0, r0, #1
	str r0, [sp, #8]
	add r0, r7, #0
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	cmp r0, #0
	ble _020364F0
	ldr r0, [sp]
	ldr r6, [sp, #4]
	mov r1, #0xc0
	add r5, r0, #0
	add r4, r6, #0
	mul r5, r1
_02036474:
	ldr r0, _02036504 ; =_021D4140
	ldr r1, [r0, #8]
	mov r0, #0x4b
	lsl r0, r0, #4
	add r0, r1, r0
	add r0, r0, r6
	bl sub_02033C28
	ldr r0, [sp, #4]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_020373B4
	cmp r0, #0
	beq _020364A2
	ldr r0, _02036504 ; =_021D4140
	ldr r0, [r0, #8]
	add r0, r5, r0
	add r1, r4, r0
	add r1, #0x80
	mov r0, #0xe
	strb r0, [r1]
	b _020364B4
_020364A2:
	ldr r0, _02036504 ; =_021D4140
	add r7, r7, #1
	ldr r0, [r0, #8]
	add r0, r5, r0
	add r1, r4, r0
	add r1, #0x80
	mov r0, #0xff
	strb r0, [r1]
	b _020364DE
_020364B4:
	ldr r0, _02036504 ; =_021D4140
	ldr r2, [sp, #0xc]
	ldr r1, [r0, #8]
	mov r0, #0x4b
	lsl r0, r0, #4
	add r0, r1, r0
	add r1, #0x80
	add r1, r1, r5
	add r0, r0, r6
	add r1, r1, r4
	bl sub_02033B4C
	ldr r0, _02036504 ; =_021D4140
	ldr r0, [r0, #8]
	add r0, r5, r0
	add r0, r4, r0
	add r0, #0x80
	ldrb r0, [r0]
	cmp r0, #0xe
	bne _020364DE
	add r7, r7, #1
_020364DE:
	ldr r0, [sp, #0xc]
	add r6, #0xc
	add r4, r4, r0
	ldr r0, [sp, #4]
	add r1, r0, #1
	ldr r0, [sp, #8]
	str r1, [sp, #4]
	cmp r1, r0
	blt _02036474
_020364F0:
	ldr r0, [sp, #8]
	cmp r7, r0
	bne _020364FC
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020364FC:
	mov r0, #1
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02036504: .word _021D4140
	thumb_func_end sub_02036438

	thumb_func_start sub_02036508
sub_02036508: ; 0x02036508
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, _02036620 ; =_021D4140
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _02036514
	b _0203661C
_02036514:
	bl sub_0203993C
	bl sub_02034044
	cmp r0, #0
	bne _0203661C
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_0203772C
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02033FC4
	add r6, r0, #1
	ldr r0, _02036624 ; =_0210F900
	ldrb r1, [r0]
	cmp r1, #2
	beq _02036548
	ldrb r0, [r0]
	cmp r0, #0
	bne _0203661C
_02036548:
	ldr r0, _02036624 ; =_0210F900
	ldrb r1, [r0]
	add r1, r1, #1
	strb r1, [r0]
	bl sub_02035FF0
	cmp r0, #1
	bne _02036572
	ldr r0, _02036620 ; =_021D4140
	ldrb r1, [r0]
	cmp r1, #0
	bne _02036572
	ldr r1, [r0, #8]
	mov r0, #0x6b
	lsl r0, r0, #4
	ldrb r0, [r1, r0]
	bl sub_02036438
	ldr r0, _02036620 ; =_021D4140
	mov r1, #1
	strb r1, [r0]
_02036572:
	bl sub_02033298
	cmp r0, #4
	bne _020365A4
	ldr r0, _02036620 ; =_021D4140
	ldr r1, [r0, #8]
	mov r0, #0x6b
	lsl r0, r0, #4
	ldrb r0, [r1, r0]
	add r3, r1, #0
	mov r1, #0xc0
	add r2, r0, #0
	add r3, #0x80
	mul r2, r1
	add r0, r3, r2
	ldr r3, _02036628 ; =sub_02036ABC
	mov r2, #0xe
	bl sub_02033800
	cmp r0, #0
	bne _020365A4
	ldr r0, _02036624 ; =_0210F900
	ldrb r1, [r0]
	sub r1, r1, #1
	strb r1, [r0]
_020365A4:
	ldr r0, _02036624 ; =_0210F900
	ldrb r1, [r0]
	cmp r1, #1
	beq _020365B2
	ldrb r0, [r0]
	cmp r0, #3
	bne _0203660C
_020365B2:
	ldr r7, _02036620 ; =_021D4140
	mov r4, #0
	strb r4, [r7]
	cmp r6, #0
	ble _020365E0
	add r5, r4, #0
_020365BE:
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl sub_020373B4
	cmp r0, #0
	beq _020365D8
	ldr r0, [r7, #8]
	ldr r1, _0203662C ; =0x0000066C
	add r0, r0, r5
	ldr r1, [r0, r1]
	add r2, r1, #1
	ldr r1, _0203662C ; =0x0000066C
	str r2, [r0, r1]
_020365D8:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r6
	blt _020365BE
_020365E0:
	ldr r0, _02036620 ; =_021D4140
	mov r1, #0x6b
	ldr r2, [r0, #8]
	lsl r1, r1, #4
	ldrb r1, [r2, r1]
	add r4, r2, #0
	mov r2, #0xc0
	add r3, r1, #0
	add r4, #0x80
	mul r3, r2
	mov r0, #0
	add r1, r4, r3
	bl sub_020367B0
	ldr r0, _02036620 ; =_021D4140
	mov r1, #0x6b
	ldr r3, [r0, #8]
	lsl r1, r1, #4
	ldrb r2, [r3, r1]
	mov r0, #1
	sub r0, r0, r2
	strb r0, [r3, r1]
_0203660C:
	bl sub_02033298
	cmp r0, #4
	beq _0203661C
	ldr r0, _02036624 ; =_0210F900
	ldrb r1, [r0]
	add r1, r1, #1
	strb r1, [r0]
_0203661C:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02036620: .word _021D4140
_02036624: .word _0210F900
_02036628: .word sub_02036ABC
_0203662C: .word 0x0000066C
	thumb_func_end sub_02036508

	thumb_func_start sub_02036630
sub_02036630: ; 0x02036630
	push {r3, r4, r5, r6, r7, lr}
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02033FC4
	add r6, r0, #1
	mov r4, #1
	cmp r6, #1
	ble _0203666E
	ldr r7, _02036674 ; =_021D4140
	mov r5, #4
_0203664A:
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl sub_020373B4
	cmp r0, #0
	beq _02036666
	ldr r0, [r7, #8]
	add r1, r0, r5
	ldr r0, _02036678 ; =0x0000066C
	ldr r0, [r1, r0]
	cmp r0, #3
	ble _02036666
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02036666:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r6
	blt _0203664A
_0203666E:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02036674: .word _021D4140
_02036678: .word 0x0000066C
	thumb_func_end sub_02036630

	thumb_func_start sub_0203667C
sub_0203667C: ; 0x0203667C
	push {r3, r4, r5, r6, r7, lr}
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02033FC4
	add r6, r0, #1
	bl sub_0203993C
	bl sub_02034044
	cmp r0, #0
	beq _02036738
	mov r0, #0
	bl sub_020373B4
	cmp r0, #0
	beq _02036796
	ldr r0, _02036798 ; =_021D4140
	ldr r1, [r0, #8]
	ldr r0, _0203679C ; =0x00000664
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _020366D4
	bl sub_02036630
	cmp r0, #0
	beq _02036796
	ldr r0, _020367A0 ; =_0210F900
	ldrb r0, [r0]
	cmp r0, #4
	bne _020366F4
	bl sub_02035FF0
	cmp r0, #1
	bne _020366CC
	mov r0, #0
	bl sub_02036438
_020366CC:
	ldr r0, _020367A0 ; =_0210F900
	mov r1, #2
	strb r1, [r0]
	b _020366F4
_020366D4:
	ldr r0, _020367A0 ; =_0210F900
	ldrb r0, [r0]
	cmp r0, #4
	bne _020366EE
	bl sub_02035FF0
	cmp r0, #1
	bne _020366EE
	mov r0, #0
	bl sub_02036438
	cmp r0, #0
	beq _02036796
_020366EE:
	ldr r0, _020367A0 ; =_0210F900
	mov r1, #2
	strb r1, [r0]
_020366F4:
	ldr r0, _02036798 ; =_021D4140
	mov r1, #0xc0
	ldr r0, [r0, #8]
	add r0, #0x80
	bl ov00_021E602C
	cmp r0, #0
	beq _02036796
	ldr r0, _020367A0 ; =_0210F900
	mov r1, #4
	mov r4, #0
	strb r1, [r0]
	cmp r6, #0
	ble _02036796
	ldr r7, _02036798 ; =_021D4140
	add r5, r4, #0
_02036714:
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl sub_020373B4
	cmp r0, #0
	beq _0203672E
	ldr r0, [r7, #8]
	ldr r1, _020367A4 ; =0x0000066C
	add r0, r0, r5
	ldr r1, [r0, r1]
	add r2, r1, #1
	ldr r1, _020367A4 ; =0x0000066C
	str r2, [r0, r1]
_0203672E:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r6
	blt _02036714
	pop {r3, r4, r5, r6, r7, pc}
_02036738:
	bl sub_02033298
	cmp r0, #4
	bne _02036796
	ldr r0, _020367A0 ; =_0210F900
	ldrb r0, [r0]
	cmp r0, #4
	bne _02036796
	bl sub_02036630
	cmp r0, #0
	beq _02036796
	bl sub_02035FF0
	cmp r0, #0
	bne _0203678C
	ldr r0, _02036798 ; =_021D4140
	ldr r1, [r0, #8]
	mov r0, #0x6b
	add r2, r1, #0
	lsl r0, r0, #4
	ldrb r1, [r1, r0]
	mov r0, #0xc0
	add r2, #0x80
	mul r0, r1
	add r0, r2, r0
	bl sub_02036F30
	ldr r0, _02036798 ; =_021D4140
	ldr r1, [r0, #8]
	mov r0, #0x6b
	add r2, r1, #0
	lsl r0, r0, #4
	ldrb r1, [r1, r0]
	mov r0, #1
	add r2, #0x80
	sub r1, r0, r1
	mov r0, #0xc0
	mul r0, r1
	add r0, r2, r0
	bl sub_02036F30
_0203678C:
	ldr r0, _020367A0 ; =_0210F900
	mov r1, #0
	strb r1, [r0]
	bl sub_02036508
_02036796:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02036798: .word _021D4140
_0203679C: .word 0x00000664
_020367A0: .word _0210F900
_020367A4: .word 0x0000066C
	thumb_func_end sub_0203667C

	thumb_func_start sub_020367A8
sub_020367A8: ; 0x020367A8
	ldr r3, _020367AC ; =sub_020367B0
	bx r3
	.balign 4, 0
_020367AC: .word sub_020367B0
	thumb_func_end sub_020367A8

	thumb_func_start sub_020367B0
sub_020367B0: ; 0x020367B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r0, _020368E4 ; =_021D4140
	add r5, r1, #0
	ldr r2, [r0, #8]
	ldr r0, _020368E8 ; =0x00000668
	ldr r1, [r2, r0]
	sub r1, r1, #1
	str r1, [r2, r0]
	cmp r5, #0
	beq _020367D4
	ldrb r0, [r5]
	cmp r0, #0xb
	bne _020367DA
	bl sub_02035FF0
	cmp r0, #1
	bne _020367D6
_020367D4:
	b _020368E0
_020367D6:
	add r5, r5, #1
	b _020367E2
_020367DA:
	bl sub_02035FF0
	cmp r0, #0
	beq _020368E0
_020367E2:
	ldr r0, _020368E4 ; =_021D4140
	ldr r1, _020368EC ; =0x000006B2
	ldr r0, [r0, #8]
	ldrb r1, [r0, r1]
	cmp r1, #0
	beq _020367F6
	ldrb r2, [r5]
	mov r1, #1
	tst r1, r2
	bne _020368E0
_020367F6:
	ldr r1, _020368EC ; =0x000006B2
	mov r2, #0
	strb r2, [r0, r1]
	bl sub_02035FF0
	cmp r0, #1
	bne _020368B4
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_0203772C
	add r6, r0, #0
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02033FC4
	add r0, r0, #1
	mov r4, #0
	str r0, [sp, #4]
	cmp r0, #0
	ble _020368E0
	sub r0, r6, #1
	add r7, r4, #0
	str r0, [sp]
_0203682E:
	ldrb r0, [r5]
	cmp r0, #0xff
	bne _02036846
	ldr r0, _020368E4 ; =_021D4140
	mov r2, #1
	ldr r1, [r0, #8]
	ldr r0, _020368F0 ; =0x00000694
	lsl r2, r4
	ldrh r0, [r1, r0]
	mvn r2, r2
	and r2, r0
	b _02036854
_02036846:
	ldr r0, _020368E4 ; =_021D4140
	mov r2, #1
	ldr r1, [r0, #8]
	ldr r0, _020368F0 ; =0x00000694
	lsl r2, r4
	ldrh r0, [r1, r0]
	orr r2, r0
_02036854:
	ldr r0, _020368F0 ; =0x00000694
	strh r2, [r1, r0]
	ldrb r2, [r5]
	cmp r2, #0xff
	bne _02036862
	add r5, r5, r6
	b _020368A6
_02036862:
	cmp r2, #0xe
	bne _0203686A
	add r5, r5, r6
	b _020368A6
_0203686A:
	ldr r0, _020368E4 ; =_021D4140
	ldr r3, [r0, #8]
	ldr r0, _020368F4 ; =0x0000069E
	add r1, r3, r4
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _02036882
	mov r0, #1
	tst r0, r2
	beq _02036882
	add r5, r5, r6
	b _020368A6
_02036882:
	ldr r0, _020368F8 ; =0x0000051C
	add r5, r5, #1
	add r0, r3, r0
	ldr r3, _020368FC ; =0x0000054C
	ldr r2, [sp]
	add r0, r0, r7
	add r1, r5, #0
	add r3, r4, r3
	bl sub_02033AF0
	ldr r0, [sp]
	mov r1, #0
	add r5, r5, r0
	ldr r0, _020368E4 ; =_021D4140
	ldr r0, [r0, #8]
	add r2, r0, r4
	ldr r0, _020368F4 ; =0x0000069E
	strb r1, [r2, r0]
_020368A6:
	ldr r0, [sp, #4]
	add r4, r4, #1
	add r7, #0xc
	cmp r4, r0
	blt _0203682E
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_020368B4:
	ldr r1, _020368E4 ; =_021D4140
	ldrb r3, [r5, #1]
	ldr r2, [r1, #8]
	ldr r0, _020368F0 ; =0x00000694
	strh r3, [r2, r0]
	ldr r3, [r1, #8]
	ldrh r2, [r3, r0]
	lsl r2, r2, #8
	strh r2, [r3, r0]
	ldr r4, [r1, #8]
	ldrb r2, [r5, #2]
	ldrh r3, [r4, r0]
	add r2, r3, r2
	strh r2, [r4, r0]
	ldr r0, [r1, #8]
	ldr r3, _02036900 ; =0x000004A4
	ldrb r2, [r5, #3]
	add r0, r0, r3
	add r1, r5, #4
	add r3, #0xbc
	bl sub_02033AF0
_020368E0:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020368E4: .word _021D4140
_020368E8: .word 0x00000668
_020368EC: .word 0x000006B2
_020368F0: .word 0x00000694
_020368F4: .word 0x0000069E
_020368F8: .word 0x0000051C
_020368FC: .word 0x0000054C
_02036900: .word 0x000004A4
	thumb_func_end sub_020367B0

	thumb_func_start sub_02036904
sub_02036904: ; 0x02036904
	ldr r3, _02036908 ; =sub_0203690C
	bx r3
	.balign 4, 0
_02036908: .word sub_0203690C
	thumb_func_end sub_02036904

	thumb_func_start sub_0203690C
sub_0203690C: ; 0x0203690C
	push {r4, r5, r6, lr}
	ldr r3, _020369BC ; =_021D4140
	add r5, r0, #0
	ldr r0, [r3, #8]
	ldr r2, _020369C0 ; =0x0000066C
	add r4, r1, #0
	add r1, r0, r2
	lsl r0, r5, #2
	ldr r6, [r1, r0]
	sub r6, r6, #1
	str r6, [r1, r0]
	cmp r4, #0
	beq _020369BA
	ldr r0, [r3, #8]
	add r2, #0x32
	add r0, r0, r2
	ldrb r1, [r0, r5]
	cmp r1, #0
	beq _0203693A
	ldrb r2, [r4]
	mov r1, #1
	tst r1, r2
	bne _020369BA
_0203693A:
	mov r1, #0
	strb r1, [r0, r5]
	bl sub_02035FF0
	cmp r0, #1
	bne _02036992
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_0203772C
	add r6, r0, #0
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02033FC4
	ldrb r1, [r4]
	mov r0, #2
	tst r0, r1
	bne _02036982
	ldr r0, _020369BC ; =_021D4140
	mov r3, #0x4b
	ldr r0, [r0, #8]
	lsl r3, r3, #4
	add r1, r0, r3
	mov r0, #0xc
	mul r0, r5
	add r0, r1, r0
	add r1, r4, #0
	add r2, r6, #0
	add r3, #0xf5
	bl sub_02033AF0
_02036982:
	ldr r0, _020369BC ; =_021D4140
	ldr r1, [r0, #8]
	ldr r0, _020369C4 ; =0x00000696
	add r1, r1, r0
	ldrb r0, [r1, r5]
	add r0, r0, #1
	strb r0, [r1, r5]
	pop {r4, r5, r6, pc}
_02036992:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02036D14
	ldrb r1, [r4]
	mov r0, #2
	tst r0, r1
	bne _020369BA
	ldr r0, _020369BC ; =_021D4140
	ldr r3, _020369C8 ; =0x0000051C
	ldr r0, [r0, #8]
	mov r2, #0xb
	add r1, r0, r3
	mov r0, #0xc
	mul r0, r5
	add r0, r1, r0
	add r1, r4, #1
	add r3, #0x92
	bl sub_02033AF0
_020369BA:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_020369BC: .word _021D4140
_020369C0: .word 0x0000066C
_020369C4: .word 0x00000696
_020369C8: .word 0x0000051C
	thumb_func_end sub_0203690C

	thumb_func_start sub_020369CC
sub_020369CC: ; 0x020369CC
	push {r4, r5, r6, lr}
	ldr r3, _02036A8C ; =_021D4140
	add r5, r0, #0
	ldr r0, [r3, #8]
	ldr r2, _02036A90 ; =0x0000066C
	add r4, r1, #0
	add r1, r0, r2
	lsl r0, r5, #2
	ldr r6, [r1, r0]
	sub r6, r6, #1
	str r6, [r1, r0]
	cmp r4, #0
	beq _02036A88
	ldr r0, [r3, #8]
	add r2, #0x32
	add r0, r0, r2
	ldrb r1, [r0, r5]
	cmp r1, #0
	beq _020369FA
	ldrb r2, [r4]
	mov r1, #1
	tst r1, r2
	bne _02036A88
_020369FA:
	mov r1, #0
	strb r1, [r0, r5]
	bl sub_02035FF0
	cmp r0, #1
	bne _02036A88
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_0203772C
	add r6, r0, #0
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02033FC4
	ldrb r0, [r4]
	ldr r2, _02036A94 ; =0x00000694
	cmp r0, #0xff
	bne _02036A38
	ldr r0, _02036A8C ; =_021D4140
	mov r3, #1
	ldr r1, [r0, #8]
	lsl r3, r5
	ldrh r0, [r1, r2]
	mvn r3, r3
	and r0, r3
	b _02036A44
_02036A38:
	ldr r0, _02036A8C ; =_021D4140
	mov r3, #1
	ldr r1, [r0, #8]
	lsl r3, r5
	ldrh r0, [r1, r2]
	orr r0, r3
_02036A44:
	strh r0, [r1, r2]
	ldrb r0, [r4]
	cmp r0, #0xff
	beq _02036A88
	cmp r0, #2
	beq _02036A88
	cmp r0, #0xe
	beq _02036A88
	ldr r1, _02036A8C ; =_021D4140
	ldr r2, _02036A98 ; =0x0000069E
	ldr r1, [r1, #8]
	add r3, r1, r5
	ldrb r2, [r3, r2]
	cmp r2, #0
	beq _02036A68
	mov r2, #1
	tst r0, r2
	bne _02036A88
_02036A68:
	ldr r3, _02036A9C ; =0x0000051C
	mov r0, #0xc
	add r1, r1, r3
	mul r0, r5
	add r0, r1, r0
	add r1, r4, #1
	sub r2, r6, #1
	add r3, #0xcb
	bl sub_02033AF0
	ldr r0, _02036A8C ; =_021D4140
	mov r2, #0
	ldr r0, [r0, #8]
	add r1, r0, r5
	ldr r0, _02036A98 ; =0x0000069E
	strb r2, [r1, r0]
_02036A88:
	pop {r4, r5, r6, pc}
	nop
_02036A8C: .word _021D4140
_02036A90: .word 0x0000066C
_02036A94: .word 0x00000694
_02036A98: .word 0x0000069E
_02036A9C: .word 0x0000051C
	thumb_func_end sub_020369CC

	thumb_func_start sub_02036AA0
sub_02036AA0: ; 0x02036AA0
	push {r3, lr}
	cmp r0, #0
	beq _02036AB0
	ldr r0, _02036AB8 ; =_0210F900
	ldrb r1, [r0, #1]
	add r1, r1, #1
	strb r1, [r0, #1]
	pop {r3, pc}
_02036AB0:
	bl GF_AssertFail
	pop {r3, pc}
	nop
_02036AB8: .word _0210F900
	thumb_func_end sub_02036AA0

	thumb_func_start sub_02036ABC
sub_02036ABC: ; 0x02036ABC
	push {r3, lr}
	cmp r0, #0
	beq _02036ACC
	ldr r0, _02036AD4 ; =_0210F900
	ldrb r1, [r0]
	add r1, r1, #1
	strb r1, [r0]
	pop {r3, pc}
_02036ACC:
	bl GF_AssertFail
	pop {r3, pc}
	nop
_02036AD4: .word _0210F900
	thumb_func_end sub_02036ABC

	thumb_func_start sub_02036AD8
sub_02036AD8: ; 0x02036AD8
	push {r4, lr}
	ldr r0, _02036BD0 ; =_021D4140
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _02036BCE
	bl sub_0203993C
	bl sub_02034044
	cmp r0, #0
	bne _02036BCE
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_0203772C
	add r4, r0, #0
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02033FC4
	bl sub_02033298
	cmp r0, #4
	bne _02036BCE
	bl sub_0203769C
	bl sub_020373B4
	cmp r0, #0
	bne _02036B22
	bl sub_0203769C
	pop {r4, pc}
_02036B22:
	ldr r0, _02036BD4 ; =_0210F900
	ldrb r1, [r0, #1]
	cmp r1, #2
	beq _02036B30
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _02036BCE
_02036B30:
	bl sub_0203769C
	cmp r0, #0
	beq _02036B84
	ldr r0, _02036BD4 ; =_0210F900
	ldr r3, _02036BD8 ; =sub_02036AA0
	ldrb r1, [r0, #1]
	mov r2, #0xe
	add r1, r1, #1
	strb r1, [r0, #1]
	ldr r0, _02036BD0 ; =_021D4140
	ldr r1, [r0, #8]
	ldr r0, _02036BDC ; =0x000006AF
	ldrb r0, [r1, r0]
	lsl r0, r0, #6
	add r0, r1, r0
	lsl r1, r4, #0x10
	lsr r1, r1, #0x10
	bl sub_02033800
	cmp r0, #0
	bne _02036B66
	ldr r0, _02036BD4 ; =_0210F900
	ldrb r1, [r0, #1]
	sub r1, r1, #1
	strb r1, [r0, #1]
	pop {r4, pc}
_02036B66:
	ldr r2, _02036BD0 ; =_021D4140
	ldr r1, _02036BDC ; =0x000006AF
	ldr r4, [r2, #8]
	mov r0, #1
	ldrb r3, [r4, r1]
	sub r0, r0, r3
	strb r0, [r4, r1]
	add r0, r1, #0
	ldr r2, [r2, #8]
	sub r0, #0x47
	ldr r0, [r2, r0]
	sub r1, #0x47
	add r0, r0, #1
	str r0, [r2, r1]
	pop {r4, pc}
_02036B84:
	bl sub_02033250
	ldr r1, _02036BE0 ; =0x0000FFFE
	tst r0, r1
	beq _02036BCE
	ldr r0, _02036BD4 ; =_0210F900
	ldrb r1, [r0, #1]
	add r1, r1, #1
	strb r1, [r0, #1]
	mov r0, #1
	bl sub_02036AA0
	ldr r0, _02036BD0 ; =_021D4140
	ldr r1, _02036BDC ; =0x000006AF
	ldr r2, [r0, #8]
	mov r0, #0
	ldrb r1, [r2, r1]
	lsl r1, r1, #6
	add r1, r2, r1
	lsl r2, r4, #0x10
	lsr r2, r2, #0x10
	bl sub_0203690C
	ldr r2, _02036BD0 ; =_021D4140
	ldr r1, _02036BDC ; =0x000006AF
	ldr r4, [r2, #8]
	mov r0, #1
	ldrb r3, [r4, r1]
	sub r0, r0, r3
	strb r0, [r4, r1]
	add r0, r1, #0
	ldr r2, [r2, #8]
	sub r0, #0x47
	ldr r0, [r2, r0]
	sub r1, #0x47
	add r0, r0, #1
	str r0, [r2, r1]
_02036BCE:
	pop {r4, pc}
	.balign 4, 0
_02036BD0: .word _021D4140
_02036BD4: .word _0210F900
_02036BD8: .word sub_02036AA0
_02036BDC: .word 0x000006AF
_02036BE0: .word 0x0000FFFE
	thumb_func_end sub_02036AD8

	thumb_func_start sub_02036BE4
sub_02036BE4: ; 0x02036BE4
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, _02036D08 ; =_021D4140
	mov r2, #0x66
	ldr r5, [r7, #8]
	lsl r2, r2, #4
	ldrb r0, [r5, r2]
	mov r6, #0
	add r4, r6, #0
	cmp r0, #0
	beq _02036C02
	sub r1, r2, #4
	ldrh r1, [r5, r1]
	mov r3, #0xf0
	tst r3, r1
	bne _02036C04
_02036C02:
	b _02036D06
_02036C04:
	cmp r0, #2
	bne _02036C42
	mov r0, #0x20
	tst r0, r1
	beq _02036C16
	mov r0, #0x10
	orr r0, r6
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_02036C16:
	mov r0, #0x10
	tst r0, r1
	beq _02036C24
	mov r0, #0x20
	orr r0, r4
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_02036C24:
	mov r0, #0x40
	tst r0, r1
	beq _02036C32
	mov r0, #0x80
	orr r0, r4
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_02036C32:
	mov r0, #0x80
	tst r0, r1
	beq _02036CF0
	mov r0, #0x40
	orr r0, r4
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	b _02036CF0
_02036C42:
	add r0, r2, #2
	ldrh r0, [r5, r0]
	cmp r0, #0
	beq _02036C64
	add r4, r0, #0
	add r0, r2, #1
	ldrsb r0, [r5, r0]
	sub r1, r0, #1
	add r0, r2, #1
	strb r1, [r5, r0]
	ldr r1, [r7, #8]
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _02036CF0
	add r0, r2, #2
	strh r6, [r1, r0]
	b _02036CF0
_02036C64:
	add r0, r2, #0
	sub r0, #0x34
	add r6, r5, r0
	sub r2, #0x34
	ldr r0, [r6, #8]
	ldr r1, [r6, #0xc]
	ldr r2, [r5, r2]
	ldr r3, [r6, #4]
	bl _ll_mul
	add r3, r0, #0
	add r2, r1, #0
	ldr r0, [r6, #0x10]
	ldr r1, [r6, #0x14]
	add r0, r0, r3
	adc r1, r2
	ldr r2, _02036D0C ; =0x0000062C
	str r0, [r5, r2]
	mov r2, #0
	str r1, [r6, #4]
	lsr r0, r1, #0x1e
	lsl r1, r2, #2
	orr r1, r0
	cmp r1, #3
	bhi _02036CB8
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02036CA2: ; jump table
	.short _02036CAA - _02036CA2 - 2 ; case 0
	.short _02036CAE - _02036CA2 - 2 ; case 1
	.short _02036CB2 - _02036CA2 - 2 ; case 2
	.short _02036CB6 - _02036CA2 - 2 ; case 3
_02036CAA:
	mov r4, #0x20
	b _02036CB8
_02036CAE:
	mov r4, #0x10
	b _02036CB8
_02036CB2:
	mov r4, #0x40
	b _02036CB8
_02036CB6:
	mov r4, #0x80
_02036CB8:
	ldr r0, _02036D08 ; =_021D4140
	ldr r5, [r0, #8]
	ldr r0, _02036D0C ; =0x0000062C
	add r6, r5, r0
	ldr r0, [r6, #8]
	ldr r1, [r6, #0xc]
	ldr r2, [r6]
	ldr r3, [r6, #4]
	bl _ll_mul
	ldr r3, [r6, #0x10]
	ldr r2, [r6, #0x14]
	add r0, r3, r0
	adc r2, r1
	ldr r1, _02036D0C ; =0x0000062C
	mov r3, #0
	str r0, [r5, r1]
	str r2, [r6, #4]
	lsr r0, r2, #0x1c
	lsl r2, r3, #4
	orr r2, r0
	add r0, r1, #0
	add r0, #0x35
	strb r2, [r5, r0]
	ldr r0, _02036D08 ; =_021D4140
	add r1, #0x36
	ldr r0, [r0, #8]
	strh r4, [r0, r1]
_02036CF0:
	ldr r2, _02036D08 ; =_021D4140
	ldr r1, _02036D10 ; =0x0000065C
	ldr r5, [r2, #8]
	mov r0, #0xf0
	ldrh r3, [r5, r1]
	bic r3, r0
	strh r3, [r5, r1]
	ldr r2, [r2, #8]
	ldrh r0, [r2, r1]
	add r0, r0, r4
	strh r0, [r2, r1]
_02036D06:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02036D08: .word _021D4140
_02036D0C: .word 0x0000062C
_02036D10: .word 0x0000065C
	thumb_func_end sub_02036BE4

	thumb_func_start sub_02036D14
sub_02036D14: ; 0x02036D14
	push {r4, r5, r6, r7}
	ldr r4, _02036D94 ; =_021D4140
	lsl r6, r1, #1
	ldr r2, [r4, #8]
	mov r5, #0
	add r3, r2, r6
	ldr r2, _02036D98 ; =0x00000644
	strh r5, [r3, r2]
	ldrb r5, [r0]
	mov r3, #0x10
	add r7, r5, #0
	and r7, r3
	cmp r7, #0x10
	bne _02036D8C
	mov r7, #0xc
	and r5, r7
	lsl r5, r5, #0x18
	lsr r5, r5, #0x18
	bne _02036D48
	ldr r3, [r4, #8]
	add r4, r3, r2
	ldrh r3, [r4, r6]
	mov r2, #0x40
	orr r2, r3
	strh r2, [r4, r6]
	b _02036D7A
_02036D48:
	cmp r5, #4
	bne _02036D5A
	ldr r3, [r4, #8]
	add r4, r3, r2
	ldrh r3, [r4, r6]
	mov r2, #0x80
	orr r2, r3
	strh r2, [r4, r6]
	b _02036D7A
_02036D5A:
	cmp r5, #8
	bne _02036D6C
	ldr r3, [r4, #8]
	add r4, r3, r2
	ldrh r3, [r4, r6]
	mov r2, #0x20
	orr r2, r3
	strh r2, [r4, r6]
	b _02036D7A
_02036D6C:
	cmp r5, #0xc
	bne _02036D7A
	ldr r4, [r4, #8]
	add r4, r4, r2
	ldrh r2, [r4, r6]
	orr r2, r3
	strh r2, [r4, r6]
_02036D7A:
	ldrb r0, [r0]
	asr r2, r0, #5
	mov r0, #7
	and r2, r0
	ldr r0, _02036D94 ; =_021D4140
	ldr r0, [r0, #8]
	add r1, r0, r1
	ldr r0, _02036D9C ; =0x00000654
	strb r2, [r1, r0]
_02036D8C:
	mov r0, #1
	pop {r4, r5, r6, r7}
	bx lr
	nop
_02036D94: .word _021D4140
_02036D98: .word 0x00000644
_02036D9C: .word 0x00000654
	thumb_func_end sub_02036D14

	thumb_func_start sub_02036DA0
sub_02036DA0: ; 0x02036DA0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02036E4C ; =_021D4140
	ldr r1, [r0, #8]
	ldr r0, _02036E50 ; =0x0000065E
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _02036DB4
	mov r0, #0
	pop {r4, pc}
_02036DB4:
	bl sub_0203751C
	cmp r0, #0
	bne _02036DC0
	mov r0, #0
	pop {r4, pc}
_02036DC0:
	ldr r0, _02036E4C ; =_021D4140
	ldr r2, [r0, #8]
	ldr r0, _02036E54 ; =0x000006B1
	ldrb r1, [r2, r0]
	cmp r1, #0
	beq _02036DD0
	sub r1, r1, #1
	strb r1, [r2, r0]
_02036DD0:
	ldr r1, _02036E4C ; =_021D4140
	ldr r0, _02036E58 ; =0x0000065C
	ldr r2, [r1, #8]
	mov r3, #0x40
	ldrh r2, [r2, r0]
	tst r3, r2
	beq _02036DF0
	ldrb r3, [r4]
	mov r2, #0x10
	add r0, #0x55
	orr r2, r3
	strb r2, [r4]
	ldr r1, [r1, #8]
	mov r2, #8
	strb r2, [r1, r0]
	b _02036E36
_02036DF0:
	mov r3, #0x80
	tst r3, r2
	beq _02036E08
	ldrb r3, [r4]
	mov r2, #0x14
	add r0, #0x55
	orr r2, r3
	strb r2, [r4]
	ldr r1, [r1, #8]
	mov r2, #8
	strb r2, [r1, r0]
	b _02036E36
_02036E08:
	mov r3, #0x20
	tst r3, r2
	beq _02036E20
	ldrb r3, [r4]
	mov r2, #0x18
	add r0, #0x55
	orr r2, r3
	strb r2, [r4]
	ldr r1, [r1, #8]
	mov r2, #8
	strb r2, [r1, r0]
	b _02036E36
_02036E20:
	mov r3, #0x10
	tst r2, r3
	beq _02036E36
	ldrb r3, [r4]
	mov r2, #0x1c
	add r0, #0x55
	orr r2, r3
	strb r2, [r4]
	ldr r1, [r1, #8]
	mov r2, #8
	strb r2, [r1, r0]
_02036E36:
	ldr r0, _02036E4C ; =_021D4140
	ldrb r2, [r4]
	ldr r1, [r0, #8]
	ldr r0, _02036E5C ; =0x0000065F
	ldrb r0, [r1, r0]
	lsl r0, r0, #5
	orr r0, r2
	strb r0, [r4]
	mov r0, #0
	pop {r4, pc}
	nop
_02036E4C: .word _021D4140
_02036E50: .word 0x0000065E
_02036E54: .word 0x000006B1
_02036E58: .word 0x0000065C
_02036E5C: .word 0x0000065F
	thumb_func_end sub_02036DA0

	thumb_func_start sub_02036E60
sub_02036E60: ; 0x02036E60
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r0, #0
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_0203772C
	add r5, r0, #0
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02033FC4
	ldr r0, _02036F24 ; =_021D4140
	ldr r1, [r0, #8]
	ldr r0, _02036F28 ; =0x000006B4
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _02036E90
	mov r0, #0
	b _02036E92
_02036E90:
	mov r0, #1
_02036E92:
	strb r0, [r4]
	bl sub_02035FF0
	cmp r0, #0
	bne _02036EA2
	add r0, r4, #0
	bl sub_02036DA0
_02036EA2:
	ldr r1, _02036F24 ; =_021D4140
	ldr r0, _02036F28 ; =0x000006B4
	ldr r2, [r1, #8]
	mov r3, #0
	strb r3, [r2, r0]
	mov r0, #0x16
	ldr r1, [r1, #8]
	lsl r0, r0, #6
	add r0, r1, r0
	bl sub_02033C50
	cmp r0, #0
	beq _02036ED0
	ldrb r1, [r4]
	mov r0, #2
	orr r0, r1
	strb r0, [r4]
	ldrb r0, [r4]
	cmp r0, #2
	bne _02036F1C
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, pc}
_02036ED0:
	sub r0, r5, #1
	str r0, [sp, #4]
	add r0, r4, #1
	str r0, [sp]
	ldr r0, _02036F24 ; =_021D4140
	mov r2, #1
	ldr r1, [r0, #8]
	mov r0, #0x16
	lsl r0, r0, #6
	add r0, r1, r0
	add r1, sp, #0
	bl sub_02033ECC
	cmp r0, #0
	bne _02036EF8
	ldr r0, _02036F24 ; =_021D4140
	mov r2, #1
	ldr r1, [r0, #8]
	ldr r0, _02036F28 ; =0x000006B4
	strb r2, [r1, r0]
_02036EF8:
	bl sub_02035FF0
	cmp r0, #1
	bne _02036F1C
	ldr r2, _02036F24 ; =_021D4140
	ldr r1, _02036F2C ; =0x000006AA
	ldr r3, [r2, #8]
	ldrb r0, [r3, r1]
	add r0, r0, #1
	strb r0, [r3, r1]
	ldr r2, [r2, #8]
	ldrb r0, [r4]
	ldrb r1, [r2, r1]
	lsl r2, r1, #4
	mov r1, #0xf0
	and r1, r2
	orr r0, r1
	strb r0, [r4]
_02036F1C:
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_02036F24: .word _021D4140
_02036F28: .word 0x000006B4
_02036F2C: .word 0x000006AA
	thumb_func_end sub_02036E60

	thumb_func_start sub_02036F30
sub_02036F30: ; 0x02036F30
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #0xb
	strb r0, [r4]
	ldr r0, _02036FA0 ; =_021D4140
	ldr r1, [r0, #8]
	ldr r0, _02036FA4 ; =0x000006B5
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _02036F4A
	mov r0, #0
	b _02036F4C
_02036F4A:
	mov r0, #1
_02036F4C:
	strb r0, [r4, #1]
	bl sub_02033250
	asr r1, r0, #8
	strb r1, [r4, #2]
	strb r0, [r4, #3]
	mov r0, #0xbb
	str r0, [sp, #4]
	add r0, r4, #5
	str r0, [sp]
	ldr r0, _02036FA0 ; =_021D4140
	mov r2, #0
	ldr r1, [r0, #8]
	mov r0, #0x5a
	lsl r0, r0, #4
	add r0, r1, r0
	add r1, sp, #0
	bl sub_02033ECC
	cmp r0, #0
	beq _02036F8C
	ldr r0, _02036FA0 ; =_021D4140
	mov r2, #0
	ldr r1, [r0, #8]
	ldr r0, _02036FA4 ; =0x000006B5
	strb r2, [r1, r0]
	ldr r1, [sp, #4]
	mov r0, #0xbb
	sub r0, r0, r1
	add sp, #8
	strb r0, [r4, #4]
	pop {r4, pc}
_02036F8C:
	ldr r0, _02036FA0 ; =_021D4140
	mov r2, #1
	ldr r1, [r0, #8]
	ldr r0, _02036FA4 ; =0x000006B5
	strb r2, [r1, r0]
	mov r0, #0xbb
	strb r0, [r4, #4]
	add sp, #8
	pop {r4, pc}
	nop
_02036FA0: .word _021D4140
_02036FA4: .word 0x000006B5
	thumb_func_end sub_02036F30

	thumb_func_start sub_02036FA8
sub_02036FA8: ; 0x02036FA8
	push {r3, lr}
	ldr r0, _02036FD0 ; =_021D4140
	ldr r2, [r0, #8]
	ldr r0, _02036FD4 ; =0x000006BB
	ldrb r1, [r2, r0]
	cmp r1, #0
	bne _02036FBA
	mov r0, #0
	pop {r3, pc}
_02036FBA:
	add r0, r0, #1
	ldrb r0, [r2, r0]
	bl _s32_div_f
	cmp r1, #0
	bne _02036FCA
	mov r0, #1
	pop {r3, pc}
_02036FCA:
	mov r0, #0
	pop {r3, pc}
	nop
_02036FD0: .word _021D4140
_02036FD4: .word 0x000006BB
	thumb_func_end sub_02036FA8

	thumb_func_start sub_02036FD8
sub_02036FD8: ; 0x02036FD8
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl sub_0203769C
	bl sub_020373B4
	cmp r0, #0
	bne _02036FF4
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_02036FF4:
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _0203702C ; =_021D4140
	add r2, r4, #0
	ldr r1, [r0, #8]
	mov r0, #0x16
	lsl r0, r0, #6
	add r0, r1, r0
	add r1, r5, #0
	add r3, r6, #0
	bl sub_02033DF0
	cmp r0, #0
	beq _0203701A
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_0203701A:
	bl sub_0203993C
	cmp r0, #0xa
	bne _02037026
	bl sub_02037974
_02037026:
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0203702C: .word _021D4140
	thumb_func_end sub_02036FD8

	thumb_func_start sub_02037030
sub_02037030: ; 0x02037030
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl sub_0203769C
	bl sub_020373B4
	cmp r0, #0
	bne _0203704C
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_0203704C:
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02037084 ; =_021D4140
	add r2, r4, #0
	ldr r1, [r0, #8]
	mov r0, #0x16
	lsl r0, r0, #6
	add r0, r1, r0
	add r1, r5, #0
	add r3, r6, #0
	bl sub_02033DF0
	cmp r0, #0
	beq _02037070
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_02037070:
	bl sub_0203993C
	cmp r0, #0xa
	bne _0203707C
	bl sub_02037974
_0203707C:
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_02037084: .word _021D4140
	thumb_func_end sub_02037030

	thumb_func_start sub_02037088
sub_02037088: ; 0x02037088
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl sub_0203769C
	cmp r0, #0
	beq _020370A4
	bl GF_AssertFail
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_020370A4:
	mov r0, #0
	bl sub_020373B4
	cmp r0, #0
	bne _020370B4
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_020370B4:
	bl sub_02035FF0
	cmp r0, #1
	bne _020370CA
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_02036FD8
	add sp, #8
	pop {r4, r5, r6, pc}
_020370CA:
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _02037104 ; =_021D4140
	add r2, r4, #0
	ldr r1, [r0, #8]
	mov r0, #0x5a
	lsl r0, r0, #4
	add r0, r1, r0
	add r1, r5, #0
	add r3, r6, #0
	bl sub_02033DF0
	cmp r0, #0
	beq _020370F0
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_020370F0:
	bl sub_0203993C
	cmp r0, #0xa
	bne _020370FC
	bl sub_02037974
_020370FC:
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_02037104: .word _021D4140
	thumb_func_end sub_02037088

	thumb_func_start sub_02037108
sub_02037108: ; 0x02037108
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl sub_0203769C
	cmp r0, #0
	beq _02037124
	bl sub_02037974
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_02037124:
	mov r0, #0
	bl sub_020373B4
	cmp r0, #0
	bne _02037134
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_02037134:
	bl sub_02035FF0
	cmp r0, #1
	bne _0203714A
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_02037030
	add sp, #8
	pop {r4, r5, r6, pc}
_0203714A:
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02037180 ; =_021D4140
	add r2, r4, #0
	ldr r1, [r0, #8]
	mov r0, #0x5a
	lsl r0, r0, #4
	add r0, r1, r0
	add r1, r5, #0
	add r3, r6, #0
	bl sub_02033DF0
	cmp r0, #0
	beq _0203716E
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_0203716E:
	bl sub_0203993C
	cmp r0, #0xa
	bne _0203717A
	bl sub_02037974
_0203717A:
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02037180: .word _021D4140
	thumb_func_end sub_02037108

	thumb_func_start sub_02037184
sub_02037184: ; 0x02037184
	ldr r3, _0203718C ; =sub_02037108
	mov r2, #0
	bx r3
	nop
_0203718C: .word sub_02037108
	thumb_func_end sub_02037184

	thumb_func_start sub_02037190
sub_02037190: ; 0x02037190
	ldr r0, _0203719C ; =_021D4140
	ldr r3, _020371A0 ; =sub_02033BE4
	ldr r1, [r0, #8]
	ldr r0, _020371A4 ; =0x00000498
	add r0, r1, r0
	bx r3
	.balign 4, 0
_0203719C: .word _021D4140
_020371A0: .word sub_02033BE4
_020371A4: .word 0x00000498
	thumb_func_end sub_02037190

	thumb_func_start sub_020371A8
sub_020371A8: ; 0x020371A8
	push {r4, lr}
	ldr r4, [sp, #8]
	bl sub_02034170
	mov r0, #0xee
	strb r0, [r4, #0xa]
	ldr r0, _020371C0 ; =0x0000FFFF
	strh r0, [r4, #8]
	mov r0, #0
	str r0, [r4, #4]
	str r0, [r4]
	pop {r4, pc}
	.balign 4, 0
_020371C0: .word 0x0000FFFF
	thumb_func_end sub_020371A8

	thumb_func_start sub_020371C4
sub_020371C4: ; 0x020371C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	str r1, [sp, #4]
	str r2, [sp, #8]
	add r4, r3, #0
	bl sub_02033BC4
	cmp r0, #0
	beq _020372D4
_020371D8:
	ldrb r7, [r4, #0xa]
	cmp r7, #0xee
	bne _020371EA
	add r0, r5, #0
	bl sub_02033B68
	add r7, r0, #0
	cmp r7, #0xee
	beq _020372CA
_020371EA:
	mov r0, #4
	ldrsh r0, [r5, r0]
	strb r7, [r4, #0xa]
	ldrh r6, [r4, #8]
	str r0, [sp, #0x10]
	ldr r0, _020372D8 ; =0x0000FFFF
	cmp r6, r0
	bne _0203723E
	add r0, r7, #0
	bl sub_020341DC
	add r6, r0, #0
	ldr r0, _020372DC ; =_021D4140
	ldr r1, [r0, #8]
	ldr r0, _020372E0 ; =0x000006B8
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _020372D4
	ldr r0, _020372D8 ; =0x0000FFFF
	cmp r6, r0
	bne _0203723C
	add r0, r5, #0
	bl sub_02033BC4
	cmp r0, #1
	bge _02037226
	ldr r0, [sp, #0x10]
	add sp, #0x14
	strh r0, [r5, #4]
	pop {r4, r5, r6, r7, pc}
_02037226:
	add r0, r5, #0
	bl sub_02033B68
	lsl r6, r0, #8
	add r0, r5, #0
	bl sub_02033B68
	add r6, r6, r0
	mov r0, #4
	ldrsh r0, [r5, r0]
	str r0, [sp, #0x10]
_0203723C:
	strh r6, [r4, #8]
_0203723E:
	add r0, r7, #0
	bl sub_02034244
	cmp r0, #0
	beq _0203729A
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _0203725A
	ldrh r2, [r4, #8]
	ldr r1, [sp, #4]
	add r0, r7, #0
	bl sub_02034280
	str r0, [r4, #4]
_0203725A:
	ldr r2, [r4]
	ldr r1, [sp, #8]
	add r0, r5, #0
	sub r2, r6, r2
	bl sub_02033B4C
	ldr r2, [r4, #4]
	str r0, [sp, #0xc]
	cmp r2, #0
	beq _0203727A
	ldr r1, [r4]
	ldr r0, [sp, #8]
	add r1, r2, r1
	ldr r2, [sp, #0xc]
	bl MI_CpuCopy8
_0203727A:
	ldr r1, [r4]
	ldr r0, [sp, #0xc]
	add r0, r1, r0
	str r0, [r4]
	cmp r0, r6
	blt _020372CA
	str r4, [sp]
	ldr r0, [sp, #4]
	ldr r3, [r4, #4]
	add r1, r7, #0
	add r2, r6, #0
	bl sub_020371A8
	cmp r7, #0x11
	beq _020372D4
	b _020372CA
_0203729A:
	add r0, r5, #0
	bl sub_02033BC4
	cmp r0, r6
	blt _020372C2
	ldr r1, [sp, #8]
	add r0, r5, #0
	add r2, r6, #0
	bl sub_02033B4C
	ldr r0, [sp, #4]
	ldr r3, [sp, #8]
	add r1, r7, #0
	add r2, r6, #0
	str r4, [sp]
	bl sub_020371A8
	cmp r7, #0x11
	beq _020372D4
	b _020372CA
_020372C2:
	ldr r0, [sp, #0x10]
	add sp, #0x14
	strh r0, [r5, #4]
	pop {r4, r5, r6, r7, pc}
_020372CA:
	add r0, r5, #0
	bl sub_02033BC4
	cmp r0, #0
	bne _020371D8
_020372D4:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_020372D8: .word 0x0000FFFF
_020372DC: .word _021D4140
_020372E0: .word 0x000006B8
	thumb_func_end sub_020371C4

	thumb_func_start sub_020372E4
sub_020372E4: ; 0x020372E4
	push {r4, lr}
	ldr r0, _02037328 ; =_021D4140
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _02037326
	ldr r0, _0203732C ; =0x000006BA
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _02037326
	ldr r0, _02037330 ; =0x000004A4
	add r0, r1, r0
	bl sub_02033C28
	ldr r0, _02037328 ; =_021D4140
	ldr r1, [r0, #8]
	ldr r0, _02037330 ; =0x000004A4
	add r0, r1, r0
	bl sub_02033BC4
	cmp r0, #0
	ble _02037326
	ldr r0, _02037328 ; =_021D4140
	mov r3, #0x62
	ldr r4, [r0, #8]
	ldr r2, _02037330 ; =0x000004A4
	lsl r3, r3, #4
	add r0, r4, r2
	sub r2, #0x10
	ldr r2, [r4, r2]
	mov r1, #0
	add r3, r4, r3
	bl sub_020371C4
_02037326:
	pop {r4, pc}
	.balign 4, 0
_02037328: .word _021D4140
_0203732C: .word 0x000006BA
_02037330: .word 0x000004A4
	thumb_func_end sub_020372E4

	thumb_func_start sub_02037334
sub_02037334: ; 0x02037334
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, _020373A4 ; =_021D4140
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _020373A0
	ldr r0, _020373A8 ; =0x000006BA
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _020373A0
	bl sub_0203993C
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02033FC4
	add r0, r0, #1
	mov r4, #0
	str r0, [sp]
	cmp r0, #0
	ble _020373A0
	ldr r7, _020373A4 ; =_021D4140
	add r5, r4, #0
_02037360:
	ldr r1, [r7, #8]
	ldr r0, _020373AC ; =0x0000051C
	add r0, r1, r0
	add r0, r0, r5
	bl sub_02033C28
	ldr r1, [r7, #8]
	ldr r0, _020373AC ; =0x0000051C
	add r0, r1, r0
	add r0, r0, r5
	bl sub_02033BC4
	cmp r0, #0
	ble _02037396
	mov r3, #0x17
	ldr r6, [r7, #8]
	ldr r0, _020373AC ; =0x0000051C
	ldr r2, _020373B0 ; =0x00000494
	lsl r3, r3, #6
	add r0, r6, r0
	add r3, r6, r3
	ldr r2, [r6, r2]
	add r0, r0, r5
	add r1, r4, #0
	add r3, r3, r5
	bl sub_020371C4
_02037396:
	ldr r0, [sp]
	add r4, r4, #1
	add r5, #0xc
	cmp r4, r0
	blt _02037360
_020373A0:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020373A4: .word _021D4140
_020373A8: .word 0x000006BA
_020373AC: .word 0x0000051C
_020373B0: .word 0x00000494
	thumb_func_end sub_02037334

	thumb_func_start sub_020373B4
sub_020373B4: ; 0x020373B4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02037448 ; =_021D4140
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _020373C4
	mov r0, #0
	pop {r4, pc}
_020373C4:
	bl sub_0203993C
	bl sub_02034044
	cmp r0, #0
	beq _020373F2
	ldr r0, _02037448 ; =_021D4140
	ldr r1, [r0, #8]
	ldr r0, _0203744C ; =0x000006B6
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _020373EE
	bl ov00_021EE4FC
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
	mov r0, #1
	add r1, r0, #0
	lsl r1, r4
	tst r1, r2
	bne _02037444
_020373EE:
	mov r0, #0
	pop {r4, pc}
_020373F2:
	bl sub_02037474
	cmp r0, #0
	bne _020373FE
	mov r0, #0
	pop {r4, pc}
_020373FE:
	bl sub_02033298
	cmp r0, #4
	beq _0203740A
	mov r0, #0
	pop {r4, pc}
_0203740A:
	bl sub_0203769C
	cmp r4, r0
	bne _02037416
	mov r0, #1
	pop {r4, pc}
_02037416:
	bl sub_0203769C
	cmp r0, #0
	bne _02037430
	bl sub_02033250
	mov r1, #1
	add r2, r1, #0
	lsl r2, r4
	tst r0, r2
	beq _02037442
	add r0, r1, #0
	pop {r4, pc}
_02037430:
	ldr r0, _02037448 ; =_021D4140
	ldr r1, [r0, #8]
	ldr r0, _02037450 ; =0x00000694
	ldrh r2, [r1, r0]
	mov r0, #1
	add r1, r0, #0
	lsl r1, r4
	tst r1, r2
	bne _02037444
_02037442:
	mov r0, #0
_02037444:
	pop {r4, pc}
	nop
_02037448: .word _021D4140
_0203744C: .word 0x000006B6
_02037450: .word 0x00000694
	thumb_func_end sub_020373B4

	thumb_func_start sub_02037454
sub_02037454: ; 0x02037454
	push {r3, r4, r5, lr}
	mov r4, #0
	add r5, r4, #0
_0203745A:
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	bl sub_020373B4
	cmp r0, #0
	beq _02037468
	add r4, r4, #1
_02037468:
	add r5, r5, #1
	cmp r5, #8
	blt _0203745A
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02037454

	thumb_func_start sub_02037474
sub_02037474: ; 0x02037474
	push {r3, lr}
	ldr r0, _02037494 ; =_021D4140
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _0203748E
	bl sub_0203993C
	bl sub_02034044
	cmp r0, #0
	beq _0203748E
	mov r0, #1
	pop {r3, pc}
_0203748E:
	bl sub_02035650
	pop {r3, pc}
	.balign 4, 0
_02037494: .word _021D4140
	thumb_func_end sub_02037474

	thumb_func_start sub_02037498
sub_02037498: ; 0x02037498
	ldr r1, _020374A4 ; =_021D4140
	ldr r2, [r1, #8]
	ldr r1, _020374A8 ; =0x0000065F
	strb r0, [r2, r1]
	bx lr
	nop
_020374A4: .word _021D4140
_020374A8: .word 0x0000065F
	thumb_func_end sub_02037498

	thumb_func_start sub_020374AC
sub_020374AC: ; 0x020374AC
	ldr r1, _020374B8 ; =_021D4140
	ldr r1, [r1, #8]
	add r1, r1, r0
	ldr r0, _020374BC ; =0x00000654
	ldrb r0, [r1, r0]
	bx lr
	.balign 4, 0
_020374B8: .word _021D4140
_020374BC: .word 0x00000654
	thumb_func_end sub_020374AC

	thumb_func_start sub_020374C0
sub_020374C0: ; 0x020374C0
	ldr r1, _020374DC ; =_021D4140
	ldr r2, [r1, #8]
	cmp r2, #0
	bne _020374CC
	mov r0, #0
	bx lr
_020374CC:
	ldr r1, _020374E0 ; =0x00000644
	add r3, r2, r1
	lsl r2, r0, #1
	ldrh r0, [r3, r2]
	mov r1, #0
	strh r1, [r3, r2]
	bx lr
	nop
_020374DC: .word _021D4140
_020374E0: .word 0x00000644
	thumb_func_end sub_020374C0

	thumb_func_start sub_020374E4
sub_020374E4: ; 0x020374E4
	ldr r0, _020374FC ; =_021D4140
	ldr r3, [r0, #8]
	cmp r3, #0
	beq _020374F8
	ldr r1, _02037500 ; =0x0000065C
	mov r0, #2
	ldrh r2, [r3, r1]
	lsl r0, r0, #0xe
	orr r0, r2
	strh r0, [r3, r1]
_020374F8:
	bx lr
	nop
_020374FC: .word _021D4140
_02037500: .word 0x0000065C
	thumb_func_end sub_020374E4

	thumb_func_start sub_02037504
sub_02037504: ; 0x02037504
	ldr r0, _02037514 ; =_021D4140
	ldr r2, [r0, #8]
	cmp r2, #0
	beq _02037512
	ldr r0, _02037518 ; =0x0000065C
	mov r1, #0
	strh r1, [r2, r0]
_02037512:
	bx lr
	.balign 4, 0
_02037514: .word _021D4140
_02037518: .word 0x0000065C
	thumb_func_end sub_02037504

	thumb_func_start sub_0203751C
sub_0203751C: ; 0x0203751C
	ldr r0, _02037534 ; =_021D4140
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _02037530
	ldr r0, _02037538 ; =0x0000065C
	ldrh r1, [r1, r0]
	mov r0, #2
	lsl r0, r0, #0xe
	and r0, r1
	bx lr
_02037530:
	mov r0, #1
	bx lr
	.balign 4, 0
_02037534: .word _021D4140
_02037538: .word 0x0000065C
	thumb_func_end sub_0203751C

	thumb_func_start sub_0203753C
sub_0203753C: ; 0x0203753C
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl sub_02035FF0
	cmp r0, #1
	bne _0203756E
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _02037590 ; =_021D4140
	add r2, r4, #0
	ldr r1, [r0, #8]
	mov r0, #0x16
	lsl r0, r0, #6
	add r0, r1, r0
	add r1, r5, #0
	add r3, r6, #0
	bl sub_02033DF0
	add sp, #8
	pop {r4, r5, r6, pc}
_0203756E:
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _02037590 ; =_021D4140
	add r2, r4, #0
	ldr r1, [r0, #8]
	mov r0, #0x5a
	lsl r0, r0, #4
	add r0, r1, r0
	add r1, r5, #0
	add r3, r6, #0
	bl sub_02033DF0
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_02037590: .word _021D4140
	thumb_func_end sub_0203753C

	thumb_func_start sub_02037594
sub_02037594: ; 0x02037594
	push {r3, lr}
	ldr r0, _0203760C ; =_021D4140
	ldr r2, [r0, #8]
	cmp r2, #0
	beq _02037608
	ldr r1, _02037610 ; =0x000006AB
	ldrb r0, [r2, r1]
	cmp r0, #1
	beq _020375AC
	cmp r0, #3
	beq _020375E4
	pop {r3, pc}
_020375AC:
	bl sub_02035FF0
	cmp r0, #1
	bne _020375C4
	ldr r1, _0203760C ; =_021D4140
	mov r0, #0xb
	ldr r2, [r1, #8]
	ldr r1, _02037614 ; =0x000006AC
	add r1, r2, r1
	bl sub_020376E0
	b _020375D4
_020375C4:
	ldr r1, _0203760C ; =_021D4140
	mov r0, #0xb
	ldr r2, [r1, #8]
	ldr r1, _02037614 ; =0x000006AC
	add r1, r2, r1
	mov r2, #1
	bl sub_02037108
_020375D4:
	cmp r0, #0
	beq _02037608
	ldr r0, _0203760C ; =_021D4140
	mov r2, #2
	ldr r1, [r0, #8]
	ldr r0, _02037610 ; =0x000006AB
	strb r2, [r1, r0]
	pop {r3, pc}
_020375E4:
	add r1, r1, #1
	mov r0, #0xc
	add r1, r2, r1
	bl sub_020376E0
	cmp r0, #0
	beq _02037608
	ldr r0, _0203760C ; =_021D4140
	ldr r1, [r0, #8]
	ldr r0, _02037614 ; =0x000006AC
	ldrb r0, [r1, r0]
	bl sub_02035FA8
	ldr r0, _0203760C ; =_021D4140
	mov r2, #0
	ldr r1, [r0, #8]
	ldr r0, _02037610 ; =0x000006AB
	strb r2, [r1, r0]
_02037608:
	pop {r3, pc}
	nop
_0203760C: .word _021D4140
_02037610: .word 0x000006AB
_02037614: .word 0x000006AC
	thumb_func_end sub_02037594

	thumb_func_start sub_02037618
sub_02037618: ; 0x02037618
	push {r4, lr}
	add r4, r2, #0
	bl sub_0203769C
	cmp r0, #0
	bne _02037636
	ldr r1, _02037638 ; =_021D4140
	ldr r0, _0203763C ; =0x000006AB
	ldr r2, [r1, #8]
	mov r3, #1
	strb r3, [r2, r0]
	ldrb r2, [r4]
	ldr r1, [r1, #8]
	add r0, r0, #1
	strb r2, [r1, r0]
_02037636:
	pop {r4, pc}
	.balign 4, 0
_02037638: .word _021D4140
_0203763C: .word 0x000006AB
	thumb_func_end sub_02037618

	thumb_func_start sub_02037640
sub_02037640: ; 0x02037640
	push {r4, lr}
	add r4, r2, #0
	bl sub_0203769C
	cmp r0, #0
	beq _0203765E
	ldr r1, _02037660 ; =_021D4140
	ldrb r3, [r4]
	ldr r2, [r1, #8]
	ldr r0, _02037664 ; =0x000006AC
	strb r3, [r2, r0]
	ldr r1, [r1, #8]
	mov r2, #3
	sub r0, r0, #1
	strb r2, [r1, r0]
_0203765E:
	pop {r4, pc}
	.balign 4, 0
_02037660: .word _021D4140
_02037664: .word 0x000006AC
	thumb_func_end sub_02037640

	thumb_func_start sub_02037668
sub_02037668: ; 0x02037668
	push {r4, lr}
	add r4, r2, #0
	bl sub_0203769C
	cmp r0, #0
	bne _02037690
	ldr r0, _02037694 ; =_021D4140
	ldr r1, [r0, #8]
	ldr r0, _02037698 ; =0x000006AB
	ldrb r0, [r1, r0]
	cmp r0, #2
	bne _02037690
	ldrb r0, [r4]
	bl sub_02035FA8
	ldr r0, _02037694 ; =_021D4140
	mov r2, #0
	ldr r1, [r0, #8]
	ldr r0, _02037698 ; =0x000006AB
	strb r2, [r1, r0]
_02037690:
	pop {r4, pc}
	nop
_02037694: .word _021D4140
_02037698: .word 0x000006AB
	thumb_func_end sub_02037668

	thumb_func_start sub_0203769C
sub_0203769C: ; 0x0203769C
	push {r3, lr}
	ldr r0, _020376D0 ; =_021D4140
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _020376CA
	bl sub_0203993C
	bl sub_02034044
	cmp r0, #0
	beq _020376C4
	bl ov00_021E6964
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _020376CA
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r3, pc}
_020376C4:
	bl sub_020338F4
	pop {r3, pc}
_020376CA:
	mov r0, #0
	pop {r3, pc}
	nop
_020376D0: .word _021D4140
	thumb_func_end sub_0203769C

	thumb_func_start sub_020376D4
sub_020376D4: ; 0x020376D4
	ldr r3, _020376DC ; =sub_02036FD8
	mov r2, #0
	bx r3
	nop
_020376DC: .word sub_02036FD8
	thumb_func_end sub_020376D4

	thumb_func_start sub_020376E0
sub_020376E0: ; 0x020376E0
	ldr r3, _020376E8 ; =sub_02037030
	mov r2, #0
	bx r3
	nop
_020376E8: .word sub_02037030
	thumb_func_end sub_020376E0

	thumb_func_start sub_020376EC
sub_020376EC: ; 0x020376EC
	ldr r3, _020376F4 ; =sub_02037030
	mov r1, #0
	add r2, r1, #0
	bx r3
	.balign 4, 0
_020376F4: .word sub_02037030
	thumb_func_end sub_020376EC

	thumb_func_start sub_020376F8
sub_020376F8: ; 0x020376F8
	ldr r3, _020376FC ; =sub_0203567C
	bx r3
	.balign 4, 0
_020376FC: .word sub_0203567C
	thumb_func_end sub_020376F8

	thumb_func_start sub_02037700
sub_02037700: ; 0x02037700
	push {r3, lr}
	ldr r0, _02037724 ; =_021D4140
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _0203771E
	ldr r0, _02037728 ; =0x000006B8
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _0203771E
	mov r0, #1
	add r1, r0, #0
	bl sub_020398D4
	mov r0, #1
	pop {r3, pc}
_0203771E:
	bl sub_0203569C
	pop {r3, pc}
	.balign 4, 0
_02037724: .word _021D4140
_02037728: .word 0x000006B8
	thumb_func_end sub_02037700

	thumb_func_start sub_0203772C
sub_0203772C: ; 0x0203772C
	push {r3, lr}
	bl sub_02033FC4
	cmp r0, #5
	blo _0203773A
	mov r0, #0xc
	pop {r3, pc}
_0203773A:
	bl sub_02035FF0
	cmp r0, #0
	bne _02037746
	mov r0, #0xc
	pop {r3, pc}
_02037746:
	mov r0, #0x26
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0203772C

	thumb_func_start sub_0203774C
sub_0203774C: ; 0x0203774C
	push {r3, lr}
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02033FC4
	add r0, r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0203774C

	thumb_func_start sub_0203775C
sub_0203775C: ; 0x0203775C
	push {r3, lr}
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02033FF0
	add r0, r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0203775C

	thumb_func_start sub_0203776C
sub_0203776C: ; 0x0203776C
	push {r3, lr}
	bl sub_020357FC
	cmp r0, #0
	bne _02037786
	bl sub_0203769C
	cmp r0, #0
	bne _02037786
	mov r0, #2
	add r1, sp, #0
	bl sub_02037184
_02037786:
	bl sub_0203581C
	pop {r3, pc}
	thumb_func_end sub_0203776C

	thumb_func_start sub_0203778C
sub_0203778C: ; 0x0203778C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r4, r0, #0
	add r0, sp, #0x10
	add r1, sp, #4
	bl GF_RTC_CopyDateTime
	ldr r0, _02037810 ; =gSystem
	ldr r6, [sp, #0x10]
	mov r5, #0
	lsr r7, r6, #0x1c
	lsl r5, r5, #4
	ldr r1, [sp, #0xc]
	ldr r0, [r0, #0x2c]
	lsl r6, r6, #4
	add r3, r1, r0
	ldr r0, [sp, #0x18]
	orr r5, r7
	str r0, [sp]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #4]
	add r6, r0, r6
	ldr r0, _02037814 ; =0x00000000
	ldr r2, [sp, #8]
	adc r0, r5
	lsr r5, r6, #0x1b
	lsl r0, r0, #5
	orr r0, r5
	ldr r5, [sp]
	lsl r6, r6, #5
	add r6, r5, r6
	ldr r5, _02037814 ; =0x00000000
	adc r5, r0
	lsr r0, r6, #0x1b
	lsl r5, r5, #5
	orr r5, r0
	lsl r0, r6, #5
	add r6, r1, r0
	ldr r1, _02037814 ; =0x00000000
	adc r1, r5
	lsr r0, r6, #0x1a
	lsl r1, r1, #6
	orr r1, r0
	lsl r0, r6, #6
	add r5, r2, r0
	ldr r2, _02037814 ; =0x00000000
	adc r2, r1
	lsr r0, r5, #0x1a
	lsl r1, r2, #6
	orr r1, r0
	lsl r0, r5, #6
	add r2, r3, r0
	ldr r0, _02037814 ; =0x00000000
	str r2, [r4]
	adc r0, r1
	str r0, [r4, #4]
	ldr r1, _02037818 ; =0x6C078965
	ldr r0, _0203781C ; =0x5D588B65
	str r1, [r4, #8]
	str r0, [r4, #0xc]
	ldr r0, _02037820 ; =0x00269EC3
	str r0, [r4, #0x10]
	mov r0, #0
	str r0, [r4, #0x14]
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02037810: .word gSystem
_02037814: .word 0x00000000
_02037818: .word 0x6C078965
_0203781C: .word 0x5D588B65
_02037820: .word 0x00269EC3
	thumb_func_end sub_0203778C

	thumb_func_start sub_02037824
sub_02037824: ; 0x02037824
	add r1, r0, #0
	ldr r0, _02037834 ; =_021D4140
	ldr r3, _02037838 ; =sub_02033F9C
	ldr r2, [r0, #8]
	mov r0, #0x5a
	lsl r0, r0, #4
	add r0, r2, r0
	bx r3
	.balign 4, 0
_02037834: .word _021D4140
_02037838: .word sub_02033F9C
	thumb_func_end sub_02037824

	thumb_func_start sub_0203783C
sub_0203783C: ; 0x0203783C
	ldr r0, _0203784C ; =_021D4140
	ldr r3, _02037850 ; =sub_02033C50
	ldr r1, [r0, #8]
	mov r0, #0x5a
	lsl r0, r0, #4
	add r0, r1, r0
	bx r3
	nop
_0203784C: .word _021D4140
_02037850: .word sub_02033C50
	thumb_func_end sub_0203783C

	thumb_func_start sub_02037854
sub_02037854: ; 0x02037854
	ldr r0, _02037864 ; =_021D4140
	ldr r3, _02037868 ; =sub_02033C50
	ldr r1, [r0, #8]
	mov r0, #0x16
	lsl r0, r0, #6
	add r0, r1, r0
	bx r3
	nop
_02037864: .word _021D4140
_02037868: .word sub_02033C50
	thumb_func_end sub_02037854

	thumb_func_start sub_0203786C
sub_0203786C: ; 0x0203786C
	ldr r1, _02037878 ; =_021D4140
	ldr r2, [r1, #8]
	ldr r1, _0203787C ; =0x000006B6
	strb r0, [r2, r1]
	bx lr
	nop
_02037878: .word _021D4140
_0203787C: .word 0x000006B6
	thumb_func_end sub_0203786C

	thumb_func_start sub_02037880
sub_02037880: ; 0x02037880
	ldr r0, _0203788C ; =_021D4140
	ldr r1, [r0, #8]
	ldr r0, _02037890 ; =0x000006B6
	ldrb r0, [r1, r0]
	bx lr
	nop
_0203788C: .word _021D4140
_02037890: .word 0x000006B6
	thumb_func_end sub_02037880

	thumb_func_start sub_02037894
sub_02037894: ; 0x02037894
	ldr r2, _020378A4 ; =_021D4140
	ldr r2, [r2, #8]
	cmp r2, #0
	beq _020378A2
	add r2, r2, r1
	ldr r1, _020378A8 ; =0x000006A6
	strb r0, [r2, r1]
_020378A2:
	bx lr
	.balign 4, 0
_020378A4: .word _021D4140
_020378A8: .word 0x000006A6
	thumb_func_end sub_02037894

	thumb_func_start sub_020378AC
sub_020378AC: ; 0x020378AC
	ldr r1, _020378C4 ; =_021D4140
	ldr r1, [r1, #8]
	cmp r1, #0
	beq _020378C0
	add r2, r1, r0
	ldr r1, _020378C8 ; =0x000006A6
	ldrb r1, [r2, r1]
	cmp r1, #0xff
	beq _020378C0
	add r0, r1, #0
_020378C0:
	bx lr
	nop
_020378C4: .word _021D4140
_020378C8: .word 0x000006A6
	thumb_func_end sub_020378AC

	thumb_func_start sub_020378CC
sub_020378CC: ; 0x020378CC
	push {r3, lr}
	bl sub_0203993C
	bl sub_02034044
	cmp r0, #0
	beq _020378E0
	bl ov00_021E7080
	pop {r3, pc}
_020378E0:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_020378CC

	thumb_func_start sub_020378E4
sub_020378E4: ; 0x020378E4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl sub_0203993C
	bl sub_02034044
	cmp r0, #0
	beq _02037922
	ldr r2, _02037924 ; =_021D4140
	ldr r1, _02037928 ; =0x00000664
	ldr r3, [r2, #8]
	ldr r0, [r3, r1]
	cmp r0, r4
	beq _02037922
	str r4, [r3, r1]
	cmp r4, #0
	beq _02037922
	ldr r3, [r2, #8]
	mov r0, #0
	add r1, r1, #4
	str r0, [r3, r1]
	ldr r1, _0203792C ; =0x0000066C
	add r5, r0, #0
	add r4, r0, #0
_02037914:
	ldr r3, [r2, #8]
	add r0, r0, #1
	add r3, r3, r5
	add r5, r5, #4
	str r4, [r3, r1]
	cmp r0, #8
	blt _02037914
_02037922:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02037924: .word _021D4140
_02037928: .word 0x00000664
_0203792C: .word 0x0000066C
	thumb_func_end sub_020378E4

	thumb_func_start sub_02037930
sub_02037930: ; 0x02037930
	push {r4, lr}
	add r4, r0, #0
	bl sub_020378E4
	bl sub_0203993C
	bl sub_02034044
	cmp r0, #0
	beq _02037956
	cmp r4, #0
	beq _02037950
	mov r0, #0
	bl ov00_021E70CC
	pop {r4, pc}
_02037950:
	mov r0, #1
	bl ov00_021E70CC
_02037956:
	pop {r4, pc}
	thumb_func_end sub_02037930

	thumb_func_start sub_02037958
sub_02037958: ; 0x02037958
	ldr r0, _0203796C ; =_021D4140
	ldr r1, [r0, #8]
	ldr r0, _02037970 ; =0x000006B1
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _02037968
	mov r0, #1
	bx lr
_02037968:
	mov r0, #0
	bx lr
	.balign 4, 0
_0203796C: .word _021D4140
_02037970: .word 0x000006B1
	thumb_func_end sub_02037958

	thumb_func_start sub_02037974
sub_02037974: ; 0x02037974
	ldr r0, _02037980 ; =_021D4140
	mov r2, #1
	ldr r1, [r0, #8]
	ldr r0, _02037984 ; =0x000006B8
	strb r2, [r1, r0]
	bx lr
	.balign 4, 0
_02037980: .word _021D4140
_02037984: .word 0x000006B8
	thumb_func_end sub_02037974

	thumb_func_start sub_02037988
sub_02037988: ; 0x02037988
	ldr r0, _02037998 ; =_021D4140
	ldr r2, [r0, #8]
	cmp r2, #0
	beq _02037996
	ldr r0, _0203799C ; =0x000006B9
	mov r1, #1
	strb r1, [r2, r0]
_02037996:
	bx lr
	.balign 4, 0
_02037998: .word _021D4140
_0203799C: .word 0x000006B9
	thumb_func_end sub_02037988
