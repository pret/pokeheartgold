	.include "asm/macros.inc"
	.include "unk_0202FBCC.inc"
	.include "global.inc"

	.bss

	.public _021D2AF8
_021D2AF8:
	.space 0x4

	.rodata

_020F68C4:
	.byte 0x00, 0x02, 0x01, 0x03
_020F68C8:
	.byte 0x00, 0x02, 0x03, 0x01, 0x03, 0x01, 0x00, 0x02

	.text

	thumb_func_start sub_0202FBCC
sub_0202FBCC: ; 0x0202FBCC
	ldr r0, _0202FBD0 ; =0x00001D50
	bx lr
	.balign 4, 0
_0202FBD0: .word 0x00001D50
	thumb_func_end sub_0202FBCC

	thumb_func_start sub_0202FBD4
sub_0202FBD4: ; 0x0202FBD4
	push {r4, lr}
	add r4, r0, #0
	ldr r2, _0202FBEC ; =0x00001D50
	mov r0, #0
	add r1, r4, #0
	bl MIi_CpuClear32
	mov r0, #0
	mvn r0, r0
	str r0, [r4]
	pop {r4, pc}
	nop
_0202FBEC: .word 0x00001D50
	thumb_func_end sub_0202FBD4

	thumb_func_start sub_0202FBF0
sub_0202FBF0: ; 0x0202FBF0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0202FC20 ; =_021D2AF8
	add r4, r1, #0
	ldr r0, [r0]
	add r6, r2, #0
	cmp r0, #0
	beq _0202FC0A
	bl FreeToHeap
	ldr r0, _0202FC20 ; =_021D2AF8
	mov r1, #0
	str r1, [r0]
_0202FC0A:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #0
	bl sub_0202711C
	ldr r1, _0202FC20 ; =_021D2AF8
	str r0, [r1]
	bl sub_0202FBD4
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0202FC20: .word _021D2AF8
	thumb_func_end sub_0202FBF0

	thumb_func_start sub_0202FC24
sub_0202FC24: ; 0x0202FC24
	push {r3, lr}
	ldr r0, _0202FC44 ; =_021D2AF8
	ldr r0, [r0]
	cmp r0, #0
	bne _0202FC32
	bl GF_AssertFail
_0202FC32:
	ldr r0, _0202FC44 ; =_021D2AF8
	ldr r0, [r0]
	bl FreeToHeap
	ldr r0, _0202FC44 ; =_021D2AF8
	mov r1, #0
	str r1, [r0]
	pop {r3, pc}
	nop
_0202FC44: .word _021D2AF8
	thumb_func_end sub_0202FC24

	thumb_func_start sub_0202FC48
sub_0202FC48: ; 0x0202FC48
	ldr r0, _0202FC58 ; =_021D2AF8
	ldr r0, [r0]
	cmp r0, #0
	beq _0202FC54
	mov r0, #1
	bx lr
_0202FC54:
	mov r0, #0
	bx lr
	.balign 4, 0
_0202FC58: .word _021D2AF8
	thumb_func_end sub_0202FC48

	thumb_func_start sub_0202FC5C
sub_0202FC5C: ; 0x0202FC5C
	push {r3, lr}
	ldr r0, _0202FC70 ; =_021D2AF8
	ldr r0, [r0]
	cmp r0, #0
	bne _0202FC6A
	bl GF_AssertFail
_0202FC6A:
	ldr r0, _0202FC70 ; =_021D2AF8
	ldr r0, [r0]
	pop {r3, pc}
	.balign 4, 0
_0202FC70: .word _021D2AF8
	thumb_func_end sub_0202FC5C

	thumb_func_start sub_0202FC74
sub_0202FC74: ; 0x0202FC74
	push {r3, lr}
	ldr r0, _0202FC8C ; =_021D2AF8
	ldr r0, [r0]
	cmp r0, #0
	bne _0202FC82
	bl GF_AssertFail
_0202FC82:
	ldr r0, _0202FC8C ; =_021D2AF8
	ldr r0, [r0]
	add r0, r0, #4
	pop {r3, pc}
	nop
_0202FC8C: .word _021D2AF8
	thumb_func_end sub_0202FC74

	thumb_func_start sub_0202FC90
sub_0202FC90: ; 0x0202FC90
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0202FD1C ; =_021D2AF8
	add r7, r1, #0
	ldr r0, [r0]
	add r4, r2, #0
	add r6, r3, #0
	cmp r0, #0
	beq _0202FCAC
	bl FreeToHeap
	ldr r0, _0202FD1C ; =_021D2AF8
	mov r1, #0
	str r1, [r0]
_0202FCAC:
	ldr r3, [sp, #0x18]
	add r0, r5, #0
	add r1, r7, #0
	add r2, r4, #0
	bl sub_0202711C
	ldr r1, _0202FD1C ; =_021D2AF8
	str r0, [r1]
	ldr r1, [r4]
	cmp r1, #1
	beq _0202FCCA
	mov r0, #3
	str r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0202FCCA:
	ldr r1, _0202FD20 ; =0x00001C64
	add r0, #0xe8
	ldrh r2, [r0, r1]
	ldr r3, _0202FD24 ; =0x0000FFFF
	eor r3, r2
	lsl r3, r3, #0x10
	add r2, r2, r3
	bl sub_02030258
	ldr r1, _0202FD1C ; =_021D2AF8
	add r0, r5, #0
	ldr r1, [r1]
	bl sub_02030154
	cmp r0, #1
	bne _0202FCF2
	mov r0, #0
	str r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0202FCF2:
	ldr r1, _0202FD1C ; =_021D2AF8
	add r0, r5, #0
	ldr r1, [r1]
	bl sub_0203018C
	cmp r0, #0
	bne _0202FD08
	mov r0, #2
	str r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0202FD08:
	cmp r6, #0
	beq _0202FD14
	add r0, r6, #0
	add r1, r5, #0
	bl sub_020304F0
_0202FD14:
	mov r0, #1
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0202FD1C: .word _021D2AF8
_0202FD20: .word 0x00001C64
_0202FD24: .word 0x0000FFFF
	thumb_func_end sub_0202FC90

	thumb_func_start sub_0202FD28
sub_0202FD28: ; 0x0202FD28
	push {r4, r5, r6, lr}
	add r5, r2, #0
	add r6, r0, #0
	bl sub_0202711C
	ldr r1, [r5]
	add r4, r0, #0
	cmp r1, #1
	beq _0202FD46
	mov r1, #3
	str r1, [r5]
	bl FreeToHeap
	mov r0, #0
	pop {r4, r5, r6, pc}
_0202FD46:
	ldr r1, _0202FD9C ; =0x00001C64
	add r0, #0xe8
	ldrh r2, [r0, r1]
	ldr r3, _0202FDA0 ; =0x0000FFFF
	eor r3, r2
	lsl r3, r3, #0x10
	add r2, r2, r3
	bl sub_02030258
	add r0, r6, #0
	add r1, r4, #0
	bl sub_02030154
	cmp r0, #1
	bne _0202FD72
	mov r0, #0
	str r0, [r5]
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0
	pop {r4, r5, r6, pc}
_0202FD72:
	add r0, r6, #0
	add r1, r4, #0
	bl sub_0203018C
	cmp r0, #0
	bne _0202FD8C
	mov r0, #2
	str r0, [r5]
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0
	pop {r4, r5, r6, pc}
_0202FD8C:
	mov r0, #1
	str r0, [r5]
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_0202FD9C: .word 0x00001C64
_0202FDA0: .word 0x0000FFFF
	thumb_func_end sub_0202FD28

	thumb_func_start sub_0202FDA4
sub_0202FDA4: ; 0x0202FDA4
	push {r3, r4, r5, r6, r7, lr}
	add r4, r3, #0
	add r6, r1, #0
	ldrh r1, [r4]
	add r5, r0, #0
	add r7, r2, #0
	cmp r1, #0
	beq _0202FDBA
	cmp r1, #1
	beq _0202FDF2
	b _0202FE10
_0202FDBA:
	mov r0, #8
	bl sub_0201A728
	mov r0, #0xb
	bl sub_0201A748
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl sub_02027134
	add r6, r0, #0
	cmp r6, #2
	bne _0202FDE8
	add r0, r5, #0
	mov r1, #2
	bl Save_PrepareForAsyncWrite
	ldrh r0, [r4]
	add r0, r0, #1
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0202FDE8:
	mov r0, #8
	bl sub_0201A738
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_0202FDF2:
	bl Save_WriteFileAsync
	add r5, r0, #0
	sub r0, r5, #2
	cmp r0, #1
	bhi _0202FE0C
	mov r0, #0
	strh r0, [r4]
	bl sub_0201A774
	mov r0, #8
	bl sub_0201A738
_0202FE0C:
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0202FE10:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0202FDA4

	thumb_func_start sub_0202FE14
sub_0202FE14: ; 0x0202FE14
	push {r3, r4, r5, r6, r7, lr}
	ldr r6, [sp, #0x18]
	mov ip, r1
	add r1, r2, #0
	ldrh r2, [r6]
	add r7, r0, #0
	cmp r2, #0
	beq _0202FE2A
	cmp r2, #1
	beq _0202FE90
	b _0202FE9E
_0202FE2A:
	ldr r2, _0202FEA4 ; =_021D2AF8
	ldr r4, [r2]
	cmp r4, #0
	bne _0202FE36
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_0202FE36:
	add r5, r4, #0
	add r4, #0xe8
	add r5, #0x84
	str r1, [sp]
	add r1, r5, #0
	add r2, r4, #0
	mov r3, ip
	bl sub_0202FF08
	add r0, r5, #0
	ldr r1, _0202FEA8 ; =0x0000E281
	add r0, #0x48
	strh r1, [r0]
	add r0, r7, #0
	add r1, r5, #0
	mov r2, #0x58
	bl SaveArray_CalcCRC16
	add r5, #0x60
	strh r0, [r5]
	ldr r0, _0202FEA8 ; =0x0000E281
	ldr r2, _0202FEAC ; =0x00001C62
	add r1, r4, #0
	strh r0, [r4, r2]
	add r0, r7, #0
	add r2, r2, #2
	bl SaveArray_CalcCRC16
	ldr r1, _0202FEB0 ; =0x00001C64
	ldr r3, _0202FEB4 ; =0x0000FFFF
	strh r0, [r4, r1]
	ldrh r2, [r4, r1]
	add r0, r4, #0
	eor r3, r2
	lsl r3, r3, #0x10
	add r2, r2, r3
	bl sub_02030250
	ldr r0, [sp, #0x1c]
	mov r1, #0
	strh r1, [r0]
	ldrh r0, [r6]
	add r0, r0, #1
	strh r0, [r6]
	b _0202FE9E
_0202FE90:
	ldr r1, _0202FEA4 ; =_021D2AF8
	add r2, r3, #0
	ldr r1, [r1]
	ldr r3, [sp, #0x1c]
	bl sub_0202FDA4
	pop {r3, r4, r5, r6, r7, pc}
_0202FE9E:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0202FEA4: .word _021D2AF8
_0202FEA8: .word 0x0000E281
_0202FEAC: .word 0x00001C62
_0202FEB0: .word 0x00001C64
_0202FEB4: .word 0x0000FFFF
	thumb_func_end sub_0202FE14

	thumb_func_start sub_0202FEB8
sub_0202FEB8: ; 0x0202FEB8
	cmp r0, #0x1a
	bgt _0202FEE6
	bge _0202FEF2
	add r3, r0, #0
	sub r3, #0xe
	cmp r3, #9
	bhi _0202FEFC
	add r3, r3, r3
	add r3, pc
	ldrh r3, [r3, #6]
	lsl r3, r3, #0x10
	asr r3, r3, #0x10
	add pc, r3
_0202FED2: ; jump table
	.short _0202FEF2 - _0202FED2 - 2 ; case 0
	.short _0202FEFC - _0202FED2 - 2 ; case 1
	.short _0202FEFC - _0202FED2 - 2 ; case 2
	.short _0202FEF2 - _0202FED2 - 2 ; case 3
	.short _0202FEFC - _0202FED2 - 2 ; case 4
	.short _0202FEFC - _0202FED2 - 2 ; case 5
	.short _0202FEF2 - _0202FED2 - 2 ; case 6
	.short _0202FEFC - _0202FED2 - 2 ; case 7
	.short _0202FEFC - _0202FED2 - 2 ; case 8
	.short _0202FEF2 - _0202FED2 - 2 ; case 9
_0202FEE6:
	cmp r0, #0x1d
	bgt _0202FEEE
	beq _0202FEF2
	b _0202FEFC
_0202FEEE:
	cmp r0, #0x20
	bne _0202FEFC
_0202FEF2:
	mov r0, #4
	str r0, [r1]
	mov r0, #3
	str r0, [r2]
	bx lr
_0202FEFC:
	mov r0, #2
	str r0, [r1]
	mov r0, #6
	str r0, [r2]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202FEB8

	thumb_func_start sub_0202FF08
sub_0202FF08: ; 0x0202FF08
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	str r3, [sp, #8]
	add r7, r1, #0
	str r2, [sp, #4]
	ldr r3, _02030148 ; =_020F68C8
	str r0, [sp]
	add r2, sp, #0x1c
	mov r1, #8
_0202FF1A:
	ldrb r0, [r3]
	add r3, r3, #1
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _0202FF1A
	ldr r1, _0203014C ; =_020F68C4
	add r0, sp, #0x18
	ldrb r2, [r1]
	strb r2, [r0]
	ldrb r2, [r1, #1]
	strb r2, [r0, #1]
	ldrb r2, [r1, #2]
	ldrb r1, [r1, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	add r0, r7, #0
	mov r1, #0
	mov r2, #0x64
	bl MI_CpuFill8
	ldr r0, [sp, #8]
	add r1, sp, #0x28
	add r2, sp, #0x24
	bl sub_0202FEB8
	ldr r0, [sp, #4]
	mov r2, #0
	ldr r3, [r0]
	mov r0, #4
	tst r0, r3
	beq _0202FF74
	mov r1, #0x80
	add r0, r3, #0
	tst r0, r1
	beq _0202FF6C
	ldr r0, [sp, #4]
	add r1, #0xc4
	ldrh r0, [r0, r1]
	lsl r4, r0, #1
	b _0202FF76
_0202FF6C:
	ldr r0, [sp, #4]
	add r1, #0xc4
	ldrh r4, [r0, r1]
	b _0202FF76
_0202FF74:
	add r4, r2, #0
_0202FF76:
	ldr r5, [sp, #0x28]
	mov r0, #0
	mov ip, r0
	cmp r5, #0
	ble _0203004E
	add r0, sp, #0x18
	str r0, [sp, #0x14]
	ldr r0, [sp, #4]
	lsl r1, r4, #2
	add r0, r0, r1
	str r0, [sp, #0x10]
	mov r0, #1
	and r0, r4
	add r3, r7, #0
	str r0, [sp, #0xc]
_0202FF94:
	ldr r0, [sp, #4]
	mov r1, #8
	ldr r0, [r0]
	add r6, r0, #0
	and r6, r1
	beq _0202FFD6
	mov r4, #0x80
	add r1, r0, #0
	tst r1, r4
	bne _0202FFD6
	mov r6, #0
	cmp r5, #0
	ble _0202FFF6
	ldr r1, [sp, #0x10]
	add r4, #0xb4
	ldr r1, [r1, r4]
	ldr r0, [sp, #4]
	lsl r1, r1, #0x1f
	lsr r4, r1, #0x1d
	add r1, sp, #0x1c
	add r4, r1, r4
	mov r1, ip
	ldrb r1, [r1, r4]
_0202FFC2:
	mov r4, #0x4d
	lsl r4, r4, #2
	ldr r4, [r0, r4]
	cmp r4, r1
	beq _0202FFF6
	add r6, r6, #1
	add r0, r0, #4
	cmp r6, r5
	blt _0202FFC2
	b _0202FFF6
_0202FFD6:
	cmp r6, #0
	beq _0202FFE6
	mov r1, #0x80
	tst r0, r1
	beq _0202FFE6
	ldr r0, [sp, #0x14]
	ldrb r6, [r0]
	b _0202FFF6
_0202FFE6:
	ldr r0, [sp, #0xc]
	mov r6, ip
	cmp r0, #0
	beq _0202FFF6
	mov r0, ip
	mov r1, #1
	add r6, r0, #0
	eor r6, r1
_0202FFF6:
	ldr r0, [sp, #0x24]
	mov r5, #0
	cmp r0, #0
	ble _0203003C
	ldr r1, _02030150 ; =0x00001154
	ldr r0, [sp, #4]
	add r1, r0, r1
	mov r0, #0xa9
	lsl r0, r0, #2
	mul r0, r6
	add r4, r1, r0
_0203000C:
	ldr r0, [r4, #0x2c]
	lsl r0, r0, #1
	lsr r0, r0, #0x1f
	bne _0203002E
	ldrh r0, [r4, #4]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	bne _0203002E
	ldrh r0, [r4, #6]
	strh r0, [r3]
	add r0, r4, #0
	add r0, #0x30
	ldrb r0, [r0]
	lsl r0, r0, #0x18
	lsr r1, r0, #0x1b
	add r0, r7, r2
	strb r1, [r0, #0x18]
_0203002E:
	ldr r0, [sp, #0x24]
	add r5, r5, #1
	add r3, r3, #2
	add r2, r2, #1
	add r4, #0x70
	cmp r5, r0
	blt _0203000C
_0203003C:
	ldr r0, [sp, #0x14]
	ldr r5, [sp, #0x28]
	add r0, r0, #1
	str r0, [sp, #0x14]
	mov r0, ip
	add r0, r0, #1
	mov ip, r0
	cmp r0, r5
	blt _0202FF94
_0203004E:
	ldr r0, [sp, #8]
	cmp r0, #0xd
	bhi _02030124
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02030060: ; jump table
	.short _02030124 - _02030060 - 2 ; case 0
	.short _0203007C - _02030060 - 2 ; case 1
	.short _02030098 - _02030060 - 2 ; case 2
	.short _020300B4 - _02030060 - 2 ; case 3
	.short _020300D0 - _02030060 - 2 ; case 4
	.short _020300EC - _02030060 - 2 ; case 5
	.short _02030108 - _02030060 - 2 ; case 6
	.short _02030124 - _02030060 - 2 ; case 7
	.short _0203007C - _02030060 - 2 ; case 8
	.short _02030098 - _02030060 - 2 ; case 9
	.short _020300B4 - _02030060 - 2 ; case 10
	.short _020300D0 - _02030060 - 2 ; case 11
	.short _020300EC - _02030060 - 2 ; case 12
	.short _02030108 - _02030060 - 2 ; case 13
_0203007C:
	ldr r0, [sp]
	mov r1, #0
	bl sub_020291E8
	add r3, r7, #0
	add r3, #0x28
	mov r2, #0x10
_0203008A:
	ldrh r1, [r0]
	add r0, r0, #2
	strh r1, [r3]
	add r3, r3, #2
	sub r2, r2, #1
	bne _0203008A
	b _0203013A
_02030098:
	ldr r0, [sp]
	mov r1, #1
	bl sub_020291E8
	add r3, r7, #0
	add r3, #0x28
	mov r2, #0x10
_020300A6:
	ldrh r1, [r0]
	add r0, r0, #2
	strh r1, [r3]
	add r3, r3, #2
	sub r2, r2, #1
	bne _020300A6
	b _0203013A
_020300B4:
	ldr r0, [sp]
	mov r1, #2
	bl sub_020291E8
	add r3, r7, #0
	add r3, #0x28
	mov r2, #0x10
_020300C2:
	ldrh r1, [r0]
	add r0, r0, #2
	strh r1, [r3]
	add r3, r3, #2
	sub r2, r2, #1
	bne _020300C2
	b _0203013A
_020300D0:
	ldr r0, [sp]
	mov r1, #3
	bl sub_020291E8
	add r3, r7, #0
	add r3, #0x28
	mov r2, #0x10
_020300DE:
	ldrh r1, [r0]
	add r0, r0, #2
	strh r1, [r3]
	add r3, r3, #2
	sub r2, r2, #1
	bne _020300DE
	b _0203013A
_020300EC:
	ldr r0, [sp]
	mov r1, #4
	bl sub_020291E8
	add r3, r7, #0
	add r3, #0x28
	mov r2, #0x10
_020300FA:
	ldrh r1, [r0]
	add r0, r0, #2
	strh r1, [r3]
	add r3, r3, #2
	sub r2, r2, #1
	bne _020300FA
	b _0203013A
_02030108:
	ldr r0, [sp]
	mov r1, #5
	bl sub_020291E8
	add r3, r7, #0
	add r3, #0x28
	mov r2, #0x10
_02030116:
	ldrh r1, [r0]
	add r0, r0, #2
	strh r1, [r3]
	add r3, r3, #2
	sub r2, r2, #1
	bne _02030116
	b _0203013A
_02030124:
	bl sub_0202925C
	add r3, r7, #0
	add r3, #0x28
	mov r2, #0x10
_0203012E:
	ldrh r1, [r0]
	add r0, r0, #2
	strh r1, [r3]
	add r3, r3, #2
	sub r2, r2, #1
	bne _0203012E
_0203013A:
	ldr r0, [sp, #0x40]
	strh r0, [r7, #0x24]
	ldr r0, [sp, #8]
	add r7, #0x26
	strb r0, [r7]
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02030148: .word _020F68C8
_0203014C: .word _020F68C4
_02030150: .word 0x00001154
	thumb_func_end sub_0202FF08

	thumb_func_start sub_02030154
sub_02030154: ; 0x02030154
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r1, #0
	add r4, #0xe8
	add r5, #0x84
	bl Save_CheckExtraChunksExist
	cmp r0, #0
	bne _0203016A
	mov r0, #1
	pop {r3, r4, r5, pc}
_0203016A:
	ldr r0, _02030184 ; =0x00001C62
	ldrh r1, [r4, r0]
	ldr r0, _02030188 ; =0x0000E281
	cmp r1, r0
	bne _0203017C
	add r5, #0x48
	ldrh r1, [r5]
	cmp r1, r0
	beq _02030180
_0203017C:
	mov r0, #1
	pop {r3, r4, r5, pc}
_02030180:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02030184: .word 0x00001C62
_02030188: .word 0x0000E281
	thumb_func_end sub_02030154

	thumb_func_start sub_0203018C
sub_0203018C: ; 0x0203018C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r1, #0
	ldr r1, _0203023C ; =0x00001C62
	add r4, #0xe8
	ldrh r1, [r4, r1]
	ldr r2, _02030240 ; =0x0000E281
	add r6, r0, #0
	add r5, #0x84
	cmp r1, r2
	bne _020301AC
	add r1, r5, #0
	add r1, #0x48
	ldrh r1, [r1]
	cmp r1, r2
	beq _020301B0
_020301AC:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020301B0:
	add r1, r5, #0
	mov r2, #0x58
	bl SaveArray_CalcCRC16
	add r5, #0x60
	ldrh r1, [r5]
	cmp r0, r1
	beq _020301C4
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020301C4:
	ldr r2, _02030244 ; =0x00001C64
	add r0, r6, #0
	add r1, r4, #0
	bl SaveArray_CalcCRC16
	ldr r1, _02030244 ; =0x00001C64
	ldrh r1, [r4, r1]
	cmp r0, r1
	beq _020301DA
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020301DA:
	mov r0, #0
	mov ip, r0
	ldr r0, _02030248 ; =0x00001154
	add r0, r4, r0
	str r0, [sp]
	ldr r0, _0203024C ; =0x000001D3
	add r7, r0, #0
	add r6, r0, #0
	add r7, #0x45
	add r6, #0x1c
_020301EE:
	ldr r4, [sp]
	mov r2, #0
_020301F2:
	ldrh r1, [r4, #6]
	cmp r1, r6
	bls _020301FC
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020301FC:
	ldrh r1, [r4, #8]
	cmp r1, r7
	bls _02030206
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02030206:
	mov r3, #0
	add r5, r4, #0
_0203020A:
	ldrh r1, [r5, #0x1c]
	cmp r1, r0
	bls _02030214
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02030214:
	add r3, r3, #1
	add r5, r5, #2
	cmp r3, #4
	blt _0203020A
	add r2, r2, #1
	add r4, #0x70
	cmp r2, #6
	blt _020301F2
	mov r1, #0xa9
	ldr r2, [sp]
	lsl r1, r1, #2
	add r1, r2, r1
	str r1, [sp]
	mov r1, ip
	add r1, r1, #1
	mov ip, r1
	cmp r1, #4
	blt _020301EE
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0203023C: .word 0x00001C62
_02030240: .word 0x0000E281
_02030244: .word 0x00001C64
_02030248: .word 0x00001154
_0203024C: .word 0x000001D3
	thumb_func_end sub_0203018C

	thumb_func_start sub_02030250
sub_02030250: ; 0x02030250
	ldr r3, _02030254 ; =_MonEncryptSegment
	bx r3
	.balign 4, 0
_02030254: .word _MonEncryptSegment
	thumb_func_end sub_02030250

	thumb_func_start sub_02030258
sub_02030258: ; 0x02030258
	ldr r3, _0203025C ; =_MonDecryptSegment
	bx r3
	.balign 4, 0
_0203025C: .word _MonDecryptSegment
	thumb_func_end sub_02030258

	thumb_func_start sub_02030260
sub_02030260: ; 0x02030260
	ldr r3, _02030278 ; =_021D2AF8
	ldr r3, [r3]
	cmp r3, #0
	beq _02030274
	lsl r0, r0, #0xa
	add r0, r3, r0
	add r1, r0, r1
	mov r0, #0x8e
	lsl r0, r0, #2
	strb r2, [r1, r0]
_02030274:
	bx lr
	nop
_02030278: .word _021D2AF8
	thumb_func_end sub_02030260

	thumb_func_start sub_0203027C
sub_0203027C: ; 0x0203027C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _020302A0 ; =_021D2AF8
	add r4, r1, #0
	ldr r0, [r0]
	cmp r0, #0
	bne _0203028E
	bl GF_AssertFail
_0203028E:
	ldr r0, _020302A0 ; =_021D2AF8
	ldr r1, [r0]
	lsl r0, r5, #0xa
	add r0, r1, r0
	add r1, r0, r4
	mov r0, #0x8e
	lsl r0, r0, #2
	ldrb r0, [r1, r0]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020302A0: .word _021D2AF8
	thumb_func_end sub_0203027C

	thumb_func_start sub_020302A4
sub_020302A4: ; 0x020302A4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	ldr r0, _0203048C ; =_021D2AF8
	ldr r1, [r0]
	cmp r1, #0
	bne _020302B4
	b _02030488
_020302B4:
	ldr r0, [sp]
	add r7, r1, #0
	ldr r0, [r0]
	add r1, #0xe8
	str r0, [r1]
	ldr r0, [sp]
	add r7, #0xe8
	ldr r0, [r0, #0x14]
	ldr r1, [sp]
	str r0, [r7, #4]
	mov r0, #0x53
	lsl r0, r0, #2
	ldr r2, [r1, r0]
	add r1, r7, #0
	add r1, #0xe8
	str r2, [r1]
	ldr r1, [sp]
	add r2, r0, #4
	ldr r2, [r1, r2]
	add r1, r7, #0
	add r1, #0xec
	str r2, [r1]
	add r2, r0, #0
	ldr r1, [sp]
	add r2, #8
	ldr r2, [r1, r2]
	add r1, r7, #0
	add r1, #0xf0
	str r2, [r1]
	add r2, r0, #0
	ldr r1, [sp]
	add r2, #0xc
	ldr r2, [r1, r2]
	add r1, r7, #0
	add r1, #0xf4
	str r2, [r1]
	add r2, r0, #0
	ldr r1, [sp]
	add r2, #0x10
	ldr r2, [r1, r2]
	add r1, r7, #0
	add r1, #0xf8
	str r2, [r1]
	add r2, r0, #0
	ldr r1, [sp]
	add r2, #0x14
	ldr r2, [r1, r2]
	add r1, r7, #0
	add r1, #0xfc
	str r2, [r1]
	add r2, r0, #0
	ldr r1, [sp]
	add r2, #0x18
	ldr r2, [r1, r2]
	add r1, r0, #0
	sub r1, #0x4c
	str r2, [r7, r1]
	add r2, r0, #0
	ldr r1, [sp]
	add r2, #0x1c
	ldr r2, [r1, r2]
	add r1, r0, #0
	sub r1, #0x48
	str r2, [r7, r1]
	add r2, r0, #0
	ldr r1, [sp]
	add r2, #0x24
	ldr r2, [r1, r2]
	add r1, r0, #0
	sub r1, #0x44
	str r2, [r7, r1]
	add r2, r0, #0
	ldr r1, [sp]
	add r2, #0x28
	ldr r2, [r1, r2]
	add r1, r0, #0
	sub r1, #0x40
	str r2, [r7, r1]
	add r2, r0, #0
	ldr r1, [sp]
	add r2, #0x2c
	ldr r2, [r1, r2]
	add r1, r0, #0
	sub r1, #0x3c
	str r2, [r7, r1]
	add r2, r0, #0
	ldr r1, [sp]
	add r2, #0x40
	ldr r2, [r1, r2]
	add r1, r0, #0
	sub r1, #0x28
	str r2, [r7, r1]
	add r2, r0, #0
	ldr r1, [sp]
	add r2, #0x44
	ldr r2, [r1, r2]
	add r1, r0, #0
	sub r1, #0x24
	str r2, [r7, r1]
	add r2, r0, #0
	ldr r1, [sp]
	add r2, #0x48
	ldr r2, [r1, r2]
	add r1, r0, #0
	sub r1, #0x20
	str r2, [r7, r1]
	add r2, r0, #0
	ldr r1, [sp]
	add r2, #0x50
	ldr r2, [r1, r2]
	add r1, r0, #0
	sub r1, #0x1c
	str r2, [r7, r1]
	add r2, r0, #0
	ldr r1, [sp]
	add r2, #0x64
	ldrh r2, [r1, r2]
	add r1, r0, #0
	sub r1, #8
	strh r2, [r7, r1]
	add r2, r0, #0
	ldr r1, [sp]
	add r2, #0x67
	ldrb r2, [r1, r2]
	sub r1, r0, #6
	ldr r4, [sp]
	strh r2, [r7, r1]
	add r2, r0, #0
	ldr r1, [sp]
	add r2, #0x68
	ldr r1, [r1, r2]
	sub r0, r0, #4
	str r1, [r7, r0]
	add r0, r4, #0
	mov r3, #0
	add r5, r7, #0
	str r0, [sp, #8]
	str r7, [sp, #4]
_020303C8:
	ldr r0, [r4, #0x18]
	ldr r2, [sp, #8]
	ldr r6, [sp, #4]
	str r0, [r5, #8]
	mov r0, #6
	add r2, #0x28
	add r6, #0x18
	mov ip, r0
_020303D8:
	ldmia r2!, {r0, r1}
	stmia r6!, {r0, r1}
	mov r0, ip
	sub r0, r0, #1
	mov ip, r0
	bne _020303D8
	ldr r0, [r2]
	mov r1, #0x5f
	lsl r1, r1, #2
	str r0, [r6]
	ldr r0, [r4, r1]
	cmp r0, #0
	bne _020303FA
	mov r0, #5
	sub r1, #0x68
	lsl r0, r0, #6
	b _020303FC
_020303FA:
	sub r1, #0x68
_020303FC:
	str r0, [r5, r1]
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r2, [r4, r0]
	add r1, r0, #0
	sub r1, #0x6c
	str r2, [r5, r1]
	ldr r1, [sp]
	add r4, r4, #4
	add r2, r1, r3
	add r1, r0, #0
	add r1, #0x1c
	ldrb r2, [r2, r1]
	add r1, r7, r3
	sub r0, #0x54
	strb r2, [r1, r0]
	ldr r0, [sp, #8]
	add r3, r3, #1
	add r0, #0x34
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	add r5, r5, #4
	add r0, #0x34
	str r0, [sp, #4]
	cmp r3, #4
	blt _020303C8
	ldr r0, _02030490 ; =0x00001150
	ldr r4, [sp]
	add r0, r7, r0
	str r0, [sp, #0xc]
	ldr r0, _02030494 ; =0x00001BE0
	mov r5, #0
	add r6, r7, r0
_0203043E:
	ldr r0, [r4, #4]
	ldr r1, [sp, #0xc]
	bl sub_020306DC
	add r0, r4, #0
	add r0, #0xf8
	ldr r0, [r0]
	add r1, r6, #0
	bl PlayerProfile_Copy
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02006EFC
	mov r1, #0x53
	add r2, r7, r5
	lsl r1, r1, #2
	strb r0, [r2, r1]
	mov r0, #0xa9
	ldr r1, [sp, #0xc]
	lsl r0, r0, #2
	add r0, r1, r0
	add r5, r5, #1
	str r0, [sp, #0xc]
	add r4, r4, #4
	add r6, #0x20
	cmp r5, #4
	blt _0203043E
	mov r1, #0x13
	ldr r0, [sp]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	ldr r1, _02030498 ; =0x00001C60
	add r1, r7, r1
	bl Options_Copy
_02030488:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0203048C: .word _021D2AF8
_02030490: .word 0x00001150
_02030494: .word 0x00001BE0
_02030498: .word 0x00001C60
	thumb_func_end sub_020302A4

	thumb_func_start sub_0203049C
sub_0203049C: ; 0x0203049C
	ldr r2, _020304B0 ; =_021D2AF8
	ldr r2, [r2]
	cmp r2, #0
	beq _020304AE
	lsl r0, r0, #2
	add r2, r2, r0
	mov r0, #0x7f
	lsl r0, r0, #2
	str r1, [r2, r0]
_020304AE:
	bx lr
	.balign 4, 0
_020304B0: .word _021D2AF8
	thumb_func_end sub_0203049C

	thumb_func_start sub_020304B4
sub_020304B4: ; 0x020304B4
	push {r3, r4}
	ldr r0, _020304EC ; =_021D2AF8
	ldr r4, [r0]
	cmp r4, #0
	bne _020304C4
	mov r0, #1
	pop {r3, r4}
	bx lr
_020304C4:
	mov r0, #0x45
	lsl r0, r0, #2
	add r1, r0, #0
	mov r3, #0
	add r4, #0xe8
	add r1, #0x2c
_020304D0:
	ldr r2, [r4, r0]
	cmp r2, r1
	bls _020304DC
	mov r0, #0
	pop {r3, r4}
	bx lr
_020304DC:
	add r3, r3, #1
	add r4, r4, #4
	cmp r3, #4
	blt _020304D0
	mov r0, #1
	pop {r3, r4}
	bx lr
	nop
_020304EC: .word _021D2AF8
	thumb_func_end sub_020304B4

	thumb_func_start sub_020304F0
sub_020304F0: ; 0x020304F0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r6, r0, #0
	ldr r0, _020306C8 ; =_021D2AF8
	str r1, [sp]
	ldr r1, [r0]
	add r0, r1, #0
	str r0, [sp, #0x14]
	add r0, #0xe8
	add r1, #0xe8
	str r0, [sp, #0x14]
	ldr r0, [r1]
	str r0, [r6]
	ldr r0, [sp, #0x14]
	add r0, #0xe8
	ldr r1, [r0]
	mov r0, #0x53
	lsl r0, r0, #2
	str r1, [r6, r0]
	ldr r1, [sp, #0x14]
	add r1, #0xec
	ldr r2, [r1]
	add r1, r0, #4
	str r2, [r6, r1]
	ldr r1, [sp, #0x14]
	add r1, #0xf0
	ldr r2, [r1]
	add r1, r0, #0
	add r1, #8
	str r2, [r6, r1]
	ldr r1, [sp, #0x14]
	add r1, #0xf4
	ldr r2, [r1]
	add r1, r0, #0
	add r1, #0xc
	str r2, [r6, r1]
	ldr r1, [sp, #0x14]
	add r1, #0xf8
	ldr r2, [r1]
	add r1, r0, #0
	add r1, #0x10
	str r2, [r6, r1]
	ldr r1, [sp, #0x14]
	add r1, #0xfc
	ldr r2, [r1]
	add r1, r0, #0
	add r1, #0x14
	str r2, [r6, r1]
	add r2, r0, #0
	ldr r1, [sp, #0x14]
	sub r2, #0x4c
	ldr r2, [r1, r2]
	add r1, r0, #0
	add r1, #0x18
	str r2, [r6, r1]
	add r2, r0, #0
	ldr r1, [sp, #0x14]
	sub r2, #0x48
	ldr r2, [r1, r2]
	add r1, r0, #0
	add r1, #0x1c
	str r2, [r6, r1]
	add r2, r0, #0
	ldr r1, [sp, #0x14]
	sub r2, #0x44
	ldr r2, [r1, r2]
	add r1, r0, #0
	add r1, #0x24
	str r2, [r6, r1]
	add r2, r0, #0
	ldr r1, [sp, #0x14]
	sub r2, #0x40
	ldr r2, [r1, r2]
	add r1, r0, #0
	add r1, #0x28
	str r2, [r6, r1]
	add r2, r0, #0
	ldr r1, [sp, #0x14]
	sub r2, #0x28
	ldr r2, [r1, r2]
	mov r1, #0x10
	orr r2, r1
	add r1, r0, #0
	add r1, #0x40
	str r2, [r6, r1]
	add r2, r0, #0
	ldr r1, [sp, #0x14]
	sub r2, #0x24
	ldr r2, [r1, r2]
	add r1, r0, #0
	add r1, #0x44
	str r2, [r6, r1]
	add r2, r0, #0
	ldr r1, [sp, #0x14]
	sub r2, #0x20
	ldr r2, [r1, r2]
	add r1, r0, #0
	add r1, #0x48
	str r2, [r6, r1]
	add r2, r0, #0
	ldr r1, [sp, #0x14]
	sub r2, #0x1c
	ldr r2, [r1, r2]
	add r1, r0, #0
	add r1, #0x50
	str r2, [r6, r1]
	add r2, r0, #0
	ldr r1, [sp, #0x14]
	sub r2, #8
	ldrh r2, [r1, r2]
	add r1, r0, #0
	add r1, #0x64
	strh r2, [r6, r1]
	mov r1, #0
	str r1, [r6, #0x14]
	add r0, #0x2c
	str r1, [r6, r0]
	ldr r0, [sp]
	bl Save_Pokedex_Get
	mov r1, #0x11
	lsl r1, r1, #4
	ldr r1, [r6, r1]
	bl Pokedex_Copy
	ldr r5, [sp, #0x14]
	ldr r1, _020306CC ; =0x00001150
	add r0, r5, #0
	str r0, [sp, #0x10]
	add r0, r0, r1
	str r0, [sp, #8]
	ldr r1, _020306D0 ; =0x00001BE0
	add r0, r5, #0
	add r0, r0, r1
	mov r7, #0
	add r4, r6, #0
	str r6, [sp, #0xc]
	str r0, [sp, #4]
_02030604:
	ldr r0, [r5, #8]
	ldr r3, [sp, #0x10]
	ldr r2, [sp, #0xc]
	str r0, [r4, #0x18]
	mov r0, #6
	add r3, #0x18
	add r2, #0x28
	mov ip, r0
_02030614:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	mov r0, ip
	sub r0, r0, #1
	mov ip, r0
	bne _02030614
	ldr r0, [r3]
	mov r1, #0x45
	lsl r1, r1, #2
	str r0, [r2]
	add r0, r1, #0
	ldr r2, [r5, r1]
	add r0, #0x68
	str r2, [r4, r0]
	add r0, r1, #0
	add r0, #0x20
	ldr r0, [r5, r0]
	add r1, #0x8c
	str r0, [r4, r1]
	ldr r0, [sp, #8]
	ldr r1, [r4, #4]
	bl sub_02030724
	add r1, r4, #0
	add r1, #0xf8
	ldr r0, [sp, #4]
	ldr r1, [r1]
	bl PlayerProfile_Copy
	ldr r0, [sp, #0x14]
	add r5, r5, #4
	add r1, r0, r7
	mov r0, #0x53
	lsl r0, r0, #2
	ldrb r2, [r1, r0]
	add r1, r6, r7
	add r0, #0x70
	strb r2, [r1, r0]
	ldr r0, [sp, #0x10]
	mov r1, #0xa9
	add r0, #0x34
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	lsl r1, r1, #2
	add r0, #0x34
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	add r7, r7, #1
	add r0, r0, r1
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	add r4, r4, #4
	add r0, #0x20
	str r0, [sp, #4]
	cmp r7, #4
	blt _02030604
	ldr r0, [sp]
	bl Save_PlayerData_GetOptionsAddr
	mov r1, #0x13
	lsl r1, r1, #4
	ldr r1, [r6, r1]
	bl Options_Copy
	mov r5, #0x13
	lsl r5, r5, #4
	ldr r1, [r6, r5]
	ldr r4, _020306D4 ; =0x00001C60
	ldr r2, [sp, #0x14]
	ldrh r0, [r1]
	ldrh r2, [r2, r4]
	ldr r3, _020306D8 ; =0xFFFF83FF
	lsl r2, r2, #0x11
	lsr r2, r2, #0x1b
	lsl r2, r2, #0x1b
	and r0, r3
	lsr r2, r2, #0x11
	orr r0, r2
	strh r0, [r1]
	ldr r2, [r6, r5]
	ldrh r0, [r2]
	lsl r1, r0, #0x11
	lsr r1, r1, #0x1b
	cmp r1, #0x14
	blo _020306C2
	and r0, r3
	strh r0, [r2]
_020306C2:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020306C8: .word _021D2AF8
_020306CC: .word 0x00001150
_020306D0: .word 0x00001BE0
_020306D4: .word 0x00001C60
_020306D8: .word 0xFFFF83FF
	thumb_func_end sub_020304F0

	thumb_func_start sub_020306DC
sub_020306DC: ; 0x020306DC
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	mov r2, #0xa9
	add r7, r0, #0
	add r0, r6, #0
	mov r1, #0
	lsl r2, r2, #2
	bl MI_CpuFill8
	add r0, r7, #0
	bl Party_GetMaxCount
	strh r0, [r6]
	add r0, r7, #0
	bl Party_GetCount
	strh r0, [r6, #2]
	ldrh r0, [r6, #2]
	mov r4, #0
	cmp r0, #0
	ble _02030720
	add r5, r6, #4
_02030708:
	add r0, r7, #0
	add r1, r4, #0
	bl Party_GetMonByIndex
	add r1, r5, #0
	bl sub_02072A98
	ldrh r0, [r6, #2]
	add r4, r4, #1
	add r5, #0x70
	cmp r4, r0
	blt _02030708
_02030720:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020306DC

	thumb_func_start sub_02030724
sub_02030724: ; 0x02030724
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r0, #0
	str r1, [sp]
	mov r1, #0
	add r0, sp, #4
	strb r1, [r0]
	mov r0, #0xb
	bl AllocMonZeroed
	add r4, r0, #0
	ldrh r1, [r7]
	ldr r0, [sp]
	bl Party_InitWithMaxSize
	ldrh r0, [r7, #2]
	mov r6, #0
	cmp r0, #0
	ble _02030770
	add r5, r7, #4
_0203074C:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02072D64
	add r0, r4, #0
	mov r1, #0xa2
	add r2, sp, #4
	bl SetMonData
	ldr r0, [sp]
	add r1, r4, #0
	bl Party_AddMon
	ldrh r0, [r7, #2]
	add r6, r6, #1
	add r5, #0x70
	cmp r6, r0
	blt _0203074C
_02030770:
	add r0, r4, #0
	bl FreeToHeap
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02030724

	thumb_func_start sub_0203077C
sub_0203077C: ; 0x0203077C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _020307A8 ; =_021D2AF8
	ldr r0, [r0]
	cmp r0, #0
	bne _0203078C
	bl GF_AssertFail
_0203078C:
	add r0, r4, #0
	mov r1, #0x64
	bl AllocFromHeap
	add r4, r0, #0
	ldr r0, _020307A8 ; =_021D2AF8
	add r1, r4, #0
	ldr r0, [r0]
	mov r2, #0x64
	add r0, #0x84
	bl MIi_CpuCopy32
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_020307A8: .word _021D2AF8
	thumb_func_end sub_0203077C

	thumb_func_start sub_020307AC
sub_020307AC: ; 0x020307AC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _020307D8 ; =_021D2AF8
	ldr r0, [r0]
	cmp r0, #0
	bne _020307BC
	bl GF_AssertFail
_020307BC:
	add r0, r4, #0
	mov r1, #0x80
	bl AllocFromHeap
	add r4, r0, #0
	ldr r0, _020307D8 ; =_021D2AF8
	add r1, r4, #0
	ldr r0, [r0]
	mov r2, #0x80
	add r0, r0, #4
	bl MIi_CpuCopy32
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_020307D8: .word _021D2AF8
	thumb_func_end sub_020307AC

	thumb_func_start sub_020307DC
sub_020307DC: ; 0x020307DC
	push {r3, lr}
	ldr r0, _020307F4 ; =_021D2AF8
	ldr r0, [r0]
	cmp r0, #0
	bne _020307EA
	bl GF_AssertFail
_020307EA:
	ldr r0, _020307F4 ; =_021D2AF8
	ldr r0, [r0]
	add r0, r0, #4
	pop {r3, pc}
	nop
_020307F4: .word _021D2AF8
	thumb_func_end sub_020307DC

	thumb_func_start sub_020307F8
sub_020307F8: ; 0x020307F8
	push {r3, lr}
	ldr r0, _02030810 ; =_021D2AF8
	ldr r0, [r0]
	cmp r0, #0
	bne _02030806
	bl GF_AssertFail
_02030806:
	ldr r0, _02030810 ; =_021D2AF8
	ldr r0, [r0]
	add r0, #0x84
	pop {r3, pc}
	nop
_02030810: .word _021D2AF8
	thumb_func_end sub_020307F8

	thumb_func_start sub_02030814
sub_02030814: ; 0x02030814
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0203087C ; =_021D2AF8
	add r6, r1, #0
	ldr r0, [r0]
	add r7, r2, #0
	add r4, r3, #0
	cmp r0, #0
	bne _0203082A
	bl GF_AssertFail
_0203082A:
	ldr r1, _0203087C ; =_021D2AF8
	add r0, r6, #0
	ldr r1, [r1]
	mov r2, #0x64
	add r1, #0x84
	bl MI_CpuCopy8
	ldr r1, _0203087C ; =_021D2AF8
	ldr r2, _02030880 ; =0x00001C68
	ldr r1, [r1]
	add r0, r7, #0
	add r1, #0xe8
	bl MI_CpuCopy8
	ldr r1, _0203087C ; =_021D2AF8
	add r0, r5, #0
	ldr r1, [r1]
	mov r2, #0x80
	add r1, r1, #4
	bl MI_CpuCopy8
	ldr r0, _0203087C ; =_021D2AF8
	ldr r1, _02030884 ; =0x00001D4C
	ldr r0, [r0]
	ldr r2, _02030888 ; =0x0000FFFF
	ldrh r3, [r0, r1]
	add r0, #0xe8
	sub r1, #0xe8
	eor r2, r3
	lsl r2, r2, #0x10
	add r2, r3, r2
	bl sub_02030258
	cmp r4, #0
	beq _02030878
	ldr r1, [sp, #0x18]
	add r0, r4, #0
	bl sub_020304F0
_02030878:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0203087C: .word _021D2AF8
_02030880: .word 0x00001C68
_02030884: .word 0x00001D4C
_02030888: .word 0x0000FFFF
	thumb_func_end sub_02030814

	thumb_func_start sub_0203088C
sub_0203088C: ; 0x0203088C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r2, #0
	cmp r1, #5
	bhi _0203090C
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_020308A2: ; jump table
	.short _020308AE - _020308A2 - 2 ; case 0
	.short _020308CA - _020308A2 - 2 ; case 1
	.short _020308DA - _020308A2 - 2 ; case 2
	.short _020308EC - _020308A2 - 2 ; case 3
	.short _020308FE - _020308A2 - 2 ; case 4
	.short _02030904 - _020308A2 - 2 ; case 5
_020308AE:
	cmp r5, #0xc
	blt _020308B6
	bl GF_AssertFail
_020308B6:
	lsl r0, r5, #1
	ldrh r0, [r4, r0]
	ldr r1, _02030918 ; =0x000001ED
	cmp r0, r1
	bls _020308C6
	mov r0, #0
	add r1, r0, #0
	pop {r3, r4, r5, pc}
_020308C6:
	mov r1, #0
	pop {r3, r4, r5, pc}
_020308CA:
	cmp r5, #0xc
	blt _020308D2
	bl GF_AssertFail
_020308D2:
	add r0, r4, r5
	ldrb r0, [r0, #0x18]
	mov r1, #0
	pop {r3, r4, r5, pc}
_020308DA:
	ldrh r1, [r4, #0x24]
	ldr r0, _0203091C ; =0x0000270F
	cmp r1, r0
	bls _020308E6
	mov r1, #0
	pop {r3, r4, r5, pc}
_020308E6:
	add r0, r1, #0
	mov r1, #0
	pop {r3, r4, r5, pc}
_020308EC:
	add r4, #0x26
	ldrb r0, [r4]
	cmp r0, #0x21
	blo _020308FA
	mov r0, #0
	add r1, r0, #0
	pop {r3, r4, r5, pc}
_020308FA:
	mov r1, #0
	pop {r3, r4, r5, pc}
_020308FE:
	ldr r0, [r4, #0x58]
	ldr r1, [r4, #0x5c]
	pop {r3, r4, r5, pc}
_02030904:
	add r4, #0x27
	ldrb r0, [r4]
	mov r1, #0
	pop {r3, r4, r5, pc}
_0203090C:
	bl GF_AssertFail
	mov r0, #0
	add r1, r0, #0
	pop {r3, r4, r5, pc}
	nop
_02030918: .word 0x000001ED
_0203091C: .word 0x0000270F
	thumb_func_end sub_0203088C

	thumb_func_start sub_02030920
sub_02030920: ; 0x02030920
	push {r4, lr}
	mov r1, #0x64
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x64
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02030920

	thumb_func_start sub_02030938
sub_02030938: ; 0x02030938
	ldr r3, _0203093C ; =FreeToHeap
	bx r3
	.balign 4, 0
_0203093C: .word FreeToHeap
	thumb_func_end sub_02030938

	thumb_func_start sub_02030940
sub_02030940: ; 0x02030940
	ldr r3, _02030948 ; =MI_CpuFill8
	mov r1, #0
	mov r2, #0x58
	bx r3
	.balign 4, 0
_02030948: .word MI_CpuFill8
	thumb_func_end sub_02030940

	thumb_func_start sub_0203094C
sub_0203094C: ; 0x0203094C
	push {r3, lr}
	bl sub_0203107C
	mov r1, #0x8e
	lsl r1, r1, #4
	add r0, r0, r1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0203094C

	thumb_func_start sub_0203095C
sub_0203095C: ; 0x0203095C
	ldrb r0, [r0]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1f
	bx lr
	thumb_func_end sub_0203095C

	thumb_func_start sub_02030964
sub_02030964: ; 0x02030964
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1f
	ldrb r3, [r0]
	mov r2, #0x10
	lsr r1, r1, #0x1b
	bic r3, r2
	orr r1, r3
	strb r1, [r0]
	bx lr
	thumb_func_end sub_02030964

	thumb_func_start sub_02030978
sub_02030978: ; 0x02030978
	push {r3, r4}
	cmp r1, #9
	bhi _02030A1E
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0203098A: ; jump table
	.short _0203099E - _0203098A - 2 ; case 0
	.short _020309B2 - _0203098A - 2 ; case 1
	.short _020309C6 - _0203098A - 2 ; case 2
	.short _020309CE - _0203098A - 2 ; case 3
	.short _020309DA - _0203098A - 2 ; case 4
	.short _020309E6 - _0203098A - 2 ; case 5
	.short _020309F2 - _0203098A - 2 ; case 6
	.short _020309FE - _0203098A - 2 ; case 7
	.short _02030A0A - _0203098A - 2 ; case 8
	.short _02030A16 - _0203098A - 2 ; case 9
_0203099E:
	ldrb r4, [r0]
	ldrb r2, [r3]
	mov r1, #1
	bic r4, r1
	mov r1, #1
	and r1, r2
	orr r1, r4
	strb r1, [r0]
	pop {r3, r4}
	bx lr
_020309B2:
	ldrb r2, [r0]
	mov r1, #0xe
	bic r2, r1
	ldrb r1, [r3]
	lsl r1, r1, #0x1d
	lsr r1, r1, #0x1c
	orr r1, r2
	strb r1, [r0]
	pop {r3, r4}
	bx lr
_020309C6:
	ldrb r1, [r3]
	strb r1, [r0, #1]
	pop {r3, r4}
	bx lr
_020309CE:
	ldrh r3, [r3]
	lsl r1, r2, #1
	add r0, r0, r1
	strh r3, [r0, #4]
	pop {r3, r4}
	bx lr
_020309DA:
	ldrh r3, [r3]
	lsl r1, r2, #1
	add r0, r0, r1
	strh r3, [r0, #0x20]
	pop {r3, r4}
	bx lr
_020309E6:
	ldrb r1, [r3]
	add r0, r0, r2
	add r0, #0x28
	strb r1, [r0]
	pop {r3, r4}
	bx lr
_020309F2:
	lsl r1, r2, #2
	ldr r3, [r3]
	add r0, r0, r1
	str r3, [r0, #0x2c]
	pop {r3, r4}
	bx lr
_020309FE:
	ldrh r3, [r3]
	lsl r1, r2, #1
	add r0, r0, r1
	strh r3, [r0, #0x3c]
	pop {r3, r4}
	bx lr
_02030A0A:
	ldrb r1, [r3]
	add r0, r0, r2
	add r0, #0x44
	strb r1, [r0]
	pop {r3, r4}
	bx lr
_02030A16:
	lsl r1, r2, #2
	ldr r3, [r3]
	add r0, r0, r1
	str r3, [r0, #0x48]
_02030A1E:
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02030978

	thumb_func_start sub_02030A24
sub_02030A24: ; 0x02030A24
	cmp r1, #9
	bhi _02030A94
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02030A34: ; jump table
	.short _02030A50 - _02030A34 - 2 ; case 0
	.short _02030A48 - _02030A34 - 2 ; case 1
	.short _02030A58 - _02030A34 - 2 ; case 2
	.short _02030A5C - _02030A34 - 2 ; case 3
	.short _02030A64 - _02030A34 - 2 ; case 4
	.short _02030A6C - _02030A34 - 2 ; case 5
	.short _02030A74 - _02030A34 - 2 ; case 6
	.short _02030A7C - _02030A34 - 2 ; case 7
	.short _02030A84 - _02030A34 - 2 ; case 8
	.short _02030A8C - _02030A34 - 2 ; case 9
_02030A48:
	ldrb r0, [r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1d
	bx lr
_02030A50:
	ldrb r0, [r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bx lr
_02030A58:
	ldrb r0, [r0, #1]
	bx lr
_02030A5C:
	lsl r1, r2, #1
	add r0, r0, r1
	ldrh r0, [r0, #4]
	bx lr
_02030A64:
	lsl r1, r2, #1
	add r0, r0, r1
	ldrh r0, [r0, #0x20]
	bx lr
_02030A6C:
	add r0, r0, r2
	add r0, #0x28
	ldrb r0, [r0]
	bx lr
_02030A74:
	lsl r1, r2, #2
	add r0, r0, r1
	ldr r0, [r0, #0x2c]
	bx lr
_02030A7C:
	lsl r1, r2, #1
	add r0, r0, r1
	ldrh r0, [r0, #0x3c]
	bx lr
_02030A84:
	add r0, r0, r2
	add r0, #0x44
	ldrb r0, [r0]
	bx lr
_02030A8C:
	lsl r1, r2, #2
	add r0, r0, r1
	ldr r0, [r0, #0x48]
	bx lr
_02030A94:
	mov r0, #0
	bx lr
	thumb_func_end sub_02030A24
