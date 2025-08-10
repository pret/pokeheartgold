	.include "asm/macros.inc"
	.include "unk_02033AE0.inc"
	.include "global.inc"

	.bss

_021D412C:
	.space 0x4

	.rodata

_020F692C:
	.byte 0x01, 0x01, 0x01, 0x01
	.byte 0x03, 0x03, 0x03, 0x04, 0x03, 0x04, 0x07, 0x03, 0x07, 0x04, 0x01, 0x04, 0x01, 0x01, 0x04, 0x01
	.byte 0x01, 0x01, 0x01, 0x03, 0x00, 0x00, 0x04, 0x01, 0x01, 0x02, 0x01, 0x01, 0x01, 0x03, 0x01, 0x03
	.byte 0x00, 0x01, 0x01, 0x01, 0x03
_020F6955:
	.byte 0x01, 0x01, 0x01, 0x01, 0x03, 0x03, 0x01, 0x01, 0x01, 0x01, 0x01
	.byte 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x01
	.byte 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00
_020F6980:
	.word 0, sub_020342C0, 0
	.word 0, sub_020342C0, 0
	.word sub_0203776C, sub_020342C0, 0
	.word sub_020345D0, sub_02034520, 0
	.word sub_0203453C, sub_02034520, 0
	.word sub_02034524, sub_020342C0, 0
	.word sub_02038B3C, sub_02038C18, 0
	.word sub_02038B9C, sub_02038C18, 0
	.word 0, 0, 0
	.word 0, 0, 0
	.word sub_02037618, sub_020342C4, 0
	.word sub_02037640, sub_020342C4, 0
	.word sub_02037668, sub_020342C4, 0
	.word sub_020342CC, sub_020342C0, 0
	.word sub_02034310, sub_020342C0, 0
	.word sub_02034338, sub_020342C0, 0
	.word sub_02037A24, sub_020342C4, 0
	.word sub_02037AAC, sub_020342C4, 0
	.word sub_02037A98, sub_020342C8, 0
	.word sub_02037B6C, sub_02037B88, 0
	.word sub_02037C68, sub_02037C94, 0
	.word sub_02039220, sub_020342C0, 0

	.text

	thumb_func_start sub_02033AE0
sub_02033AE0: ; 0x02033AE0
	str r1, [r0]
	strh r2, [r0, #0xa]
	mov r1, #0
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	strh r1, [r0, #8]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02033AE0

	thumb_func_start sub_02033AF0
sub_02033AF0: ; 0x02033AF0
	push {r3, r4, r5, r6, r7, lr}
	str r2, [sp]
	add r5, r0, #0
	add r7, r1, #0
	bl sub_02033BF4
	ldr r1, [sp]
	cmp r0, r1
	bgt _02033B08
	bl sub_02037974
	pop {r3, r4, r5, r6, r7, pc}
_02033B08:
	mov r0, #8
	ldrsh r4, [r5, r0]
	ldrsh r1, [r5, r0]
	ldr r0, [sp]
	mov r6, #0
	add r0, r1, r0
	cmp r4, r0
	bge _02033B3E
_02033B18:
	cmp r7, #0
	bne _02033B20
	bl GF_AssertFail
_02033B20:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02033C14
	ldrb r2, [r7, r6]
	ldr r1, [r5]
	add r4, r4, #1
	strb r2, [r1, r0]
	mov r0, #8
	ldrsh r1, [r5, r0]
	ldr r0, [sp]
	add r6, r6, #1
	add r0, r1, r0
	cmp r4, r0
	blt _02033B18
_02033B3E:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02033C14
	strh r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02033AF0

	thumb_func_start sub_02033B4C
sub_02033B4C: ; 0x02033B4C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_02033B78
	mov r1, #4
	add r4, r0, #0
	ldrsh r1, [r5, r1]
	add r0, r5, #0
	add r1, r1, r4
	bl sub_02033C14
	strh r0, [r5, #4]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02033B4C

	thumb_func_start sub_02033B68
sub_02033B68: ; 0x02033B68
	push {r3, lr}
	add r1, sp, #0
	mov r2, #1
	bl sub_02033B4C
	add r0, sp, #0
	ldrb r0, [r0]
	pop {r3, pc}
	thumb_func_end sub_02033B68

	thumb_func_start sub_02033B78
sub_02033B78: ; 0x02033B78
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #4
	ldrsh r4, [r5, r0]
	add r7, r2, #0
	str r1, [sp]
	add r0, r4, r7
	mov r6, #0
	cmp r4, r0
	bge _02033BBE
_02033B8C:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02033C14
	mov r1, #6
	ldrsh r1, [r5, r1]
	cmp r1, r0
	bne _02033BA0
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_02033BA0:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02033C14
	ldr r1, [r5]
	add r4, r4, #1
	ldrb r1, [r1, r0]
	ldr r0, [sp]
	strb r1, [r0, r6]
	mov r0, #4
	ldrsh r0, [r5, r0]
	add r6, r6, #1
	add r0, r0, r7
	cmp r4, r0
	blt _02033B8C
_02033BBE:
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02033B78

	thumb_func_start sub_02033BC4
sub_02033BC4: ; 0x02033BC4
	mov r1, #4
	mov r3, #6
	ldrsh r1, [r0, r1]
	ldrsh r2, [r0, r3]
	cmp r1, r2
	ble _02033BDC
	mov r2, #0xa
	ldrsh r2, [r0, r2]
	ldrsh r0, [r0, r3]
	add r0, r2, r0
	sub r0, r0, r1
	bx lr
_02033BDC:
	ldrsh r0, [r0, r3]
	sub r0, r0, r1
	bx lr
	.balign 4, 0
	thumb_func_end sub_02033BC4

	thumb_func_start sub_02033BE4
sub_02033BE4: ; 0x02033BE4
	push {r4, lr}
	add r4, r0, #0
	bl sub_02033BC4
	mov r1, #0xa
	ldrsh r1, [r4, r1]
	sub r0, r1, r0
	pop {r4, pc}
	thumb_func_end sub_02033BE4

	thumb_func_start sub_02033BF4
sub_02033BF4: ; 0x02033BF4
	mov r1, #4
	mov r2, #8
	ldrsh r3, [r0, r1]
	ldrsh r1, [r0, r2]
	cmp r3, r1
	ble _02033C06
	ldrsh r0, [r0, r2]
	sub r0, r3, r0
	bx lr
_02033C06:
	mov r1, #0xa
	ldrsh r1, [r0, r1]
	ldrsh r0, [r0, r2]
	sub r0, r0, r3
	sub r0, r1, r0
	bx lr
	.balign 4, 0
	thumb_func_end sub_02033BF4

	thumb_func_start sub_02033C14
sub_02033C14: ; 0x02033C14
	push {r3, lr}
	add r2, r0, #0
	add r0, r1, #0
	mov r1, #0xa
	ldrsh r1, [r2, r1]
	bl _s32_div_f
	add r0, r1, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02033C14

	thumb_func_start sub_02033C28
sub_02033C28: ; 0x02033C28
	mov r1, #8
	ldrsh r1, [r0, r1]
	strh r1, [r0, #6]
	bx lr
	thumb_func_end sub_02033C28

	thumb_func_start sub_02033C30
sub_02033C30: ; 0x02033C30
	ldr r3, [r0, #0x1c]
	mov r2, #0
	ldr r1, [r0, #0x18]
	cmp r3, #0
	ble _02033C4C
_02033C3A:
	ldrb r0, [r1, #0xe]
	cmp r0, #0
	bne _02033C44
	add r0, r1, #0
	bx lr
_02033C44:
	add r2, r2, #1
	add r1, #0x10
	cmp r2, r3
	blt _02033C3A
_02033C4C:
	mov r0, #0
	bx lr
	thumb_func_end sub_02033C30

	thumb_func_start sub_02033C50
sub_02033C50: ; 0x02033C50
	ldr r3, [r0, #0x1c]
	mov r2, #0
	ldr r1, [r0, #0x18]
	cmp r3, #0
	ble _02033C6C
_02033C5A:
	ldrb r0, [r1, #0xe]
	cmp r0, #0
	beq _02033C64
	mov r0, #0
	bx lr
_02033C64:
	add r2, r2, #1
	add r1, #0x10
	cmp r2, r3
	blt _02033C5A
_02033C6C:
	mov r0, #1
	bx lr
	thumb_func_end sub_02033C50

	thumb_func_start sub_02033C70
sub_02033C70: ; 0x02033C70
	ldr r1, [r0]
	cmp r1, #0
	beq _02033C8E
	ldr r1, [r1, #8]
	cmp r1, #0
	beq _02033C84
	str r1, [r0]
	mov r0, #0
	str r0, [r1, #4]
	b _02033C8A
_02033C84:
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #4]
_02033C8A:
	mov r0, #1
	bx lr
_02033C8E:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_02033C70

	thumb_func_start sub_02033C94
sub_02033C94: ; 0x02033C94
	ldr r2, [r0]
	strb r1, [r2]
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
	ldr r1, [r0, #4]
	sub r1, r1, #1
	str r1, [r0, #4]
	bne _02033CAA
	mov r0, #1
	bx lr
_02033CAA:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_02033C94

	thumb_func_start sub_02033CB0
sub_02033CB0: ; 0x02033CB0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldrb r0, [r5, #0xe]
	add r4, r1, #0
	bl sub_020341DC
	add r6, r0, #0
	ldr r0, _02033D24 ; =0x0000FFFF
	cmp r6, r0
	ldr r0, [r4, #4]
	bne _02033CD6
	cmp r0, #3
	bge _02033CE6
	ldrb r1, [r5, #0xf]
	mov r0, #1
	bic r1, r0
	strb r1, [r5, #0xf]
	mov r0, #1
	pop {r4, r5, r6, pc}
_02033CD6:
	cmp r0, #1
	bge _02033CE6
	ldrb r1, [r5, #0xf]
	mov r0, #1
	bic r1, r0
	strb r1, [r5, #0xf]
	mov r0, #1
	pop {r4, r5, r6, pc}
_02033CE6:
	ldrb r1, [r5, #0xe]
	add r0, r4, #0
	bl sub_02033C94
	ldr r0, _02033D24 ; =0x0000FFFF
	cmp r6, r0
	bne _02033D10
	ldrh r1, [r5, #0xc]
	add r0, r4, #0
	asr r1, r1, #8
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_02033C94
	ldrh r1, [r5, #0xc]
	add r0, r4, #0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_02033C94
	b _02033D12
_02033D10:
	strh r6, [r5, #0xc]
_02033D12:
	ldrb r1, [r5, #0xf]
	mov r0, #1
	bic r1, r0
	mov r0, #1
	orr r0, r1
	strb r0, [r5, #0xf]
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_02033D24: .word 0x0000FFFF
	thumb_func_end sub_02033CB0

	thumb_func_start sub_02033D28
sub_02033D28: ; 0x02033D28
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrb r0, [r5, #0xe]
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl sub_020341DC
	ldr r1, _02033DEC ; =0x0000FFFF
	cmp r0, r1
	bne _02033D42
	mov r2, #3
	b _02033D44
_02033D42:
	mov r2, #1
_02033D44:
	ldrh r0, [r5, #0xc]
	ldr r1, [r4, #4]
	add r0, r0, r2
	cmp r1, r0
	bge _02033D56
	cmp r7, #0
	bne _02033D56
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02033D56:
	ldrb r0, [r5, #0xf]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	cmp r0, #1
	beq _02033D70
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02033CB0
	cmp r0, #0
	beq _02033D70
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02033D70:
	ldrh r3, [r5, #0xc]
	ldr r2, [r4, #4]
	cmp r2, r3
	ldrb r0, [r5, #0xf]
	bge _02033DBA
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	beq _02033D8A
	ldr r1, [r4]
	add r0, r6, #0
	bl sub_02033B4C
	b _02033DA0
_02033D8A:
	mov r3, #0
	cmp r2, #0
	ble _02033DA0
_02033D90:
	ldr r0, [r5]
	ldrb r1, [r0, r3]
	ldr r0, [r4]
	strb r1, [r0, r3]
	ldr r0, [r4, #4]
	add r3, r3, #1
	cmp r3, r0
	blt _02033D90
_02033DA0:
	ldr r1, [r5]
	ldr r0, [r4, #4]
	add r0, r1, r0
	str r0, [r5]
	ldrh r1, [r5, #0xc]
	ldr r0, [r4, #4]
	sub r0, r1, r0
	strh r0, [r5, #0xc]
	mov r0, #0
	mvn r0, r0
	str r0, [r4, #4]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02033DBA:
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	beq _02033DCC
	ldr r1, [r4]
	add r0, r6, #0
	add r2, r3, #0
	bl sub_02033B4C
	b _02033DD6
_02033DCC:
	ldr r0, [r5]
	ldr r1, [r4]
	add r2, r3, #0
	bl MI_CpuCopy8
_02033DD6:
	ldrh r0, [r5, #0xc]
	ldr r1, [r4]
	add r0, r1, r0
	str r0, [r4]
	ldrh r0, [r5, #0xc]
	ldr r1, [r4, #4]
	sub r0, r1, r0
	str r0, [r4, #4]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02033DEC: .word 0x0000FFFF
	thumb_func_end sub_02033D28

	thumb_func_start sub_02033DF0
sub_02033DF0: ; 0x02033DF0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	str r1, [sp]
	str r2, [sp, #4]
	add r7, r3, #0
	bl sub_02033C30
	add r4, r0, #0
	bne _02033E0A
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02033E0A:
	ldr r0, _02033E7C ; =0x0000FFFE
	cmp r7, r0
	blt _02033E14
	bl GF_AssertFail
_02033E14:
	ldr r0, [sp]
	bl sub_020341DC
	add r6, r0, #0
	ldr r0, _02033E80 ; =0x0000FFFF
	cmp r6, r0
	bne _02033E24
	add r6, r7, #0
_02033E24:
	ldr r0, [sp, #0x24]
	cmp r0, #0
	beq _02033E56
	ldr r0, [r5, #0x14]
	bl sub_02033BE4
	add r1, r6, #3
	cmp r1, r0
	blt _02033E3C
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02033E3C:
	ldr r0, [r5, #0x14]
	ldr r1, [sp, #4]
	ldr r3, _02033E84 ; =0x00000109
	add r2, r6, #0
	bl sub_02033AF0
	ldr r0, [r5, #0x14]
	bl sub_02033C28
	ldrb r1, [r4, #0xf]
	mov r0, #2
	orr r0, r1
	strb r0, [r4, #0xf]
_02033E56:
	ldr r0, [sp]
	strh r6, [r4, #0xc]
	strb r0, [r4, #0xe]
	ldr r0, [sp, #4]
	str r0, [r4]
	ldr r0, [r5, #4]
	cmp r0, #0
	bne _02033E6C
	str r4, [r5, #4]
	str r4, [r5]
	b _02033E74
_02033E6C:
	str r4, [r0, #8]
	ldr r0, [r5, #4]
	str r0, [r4, #4]
	str r4, [r5, #4]
_02033E74:
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02033E7C: .word 0x0000FFFE
_02033E80: .word 0x0000FFFF
_02033E84: .word 0x00000109
	thumb_func_end sub_02033DF0

	thumb_func_start sub_02033E88
sub_02033E88: ; 0x02033E88
	ldr r1, [r0, #0x10]
	cmp r1, #0
	beq _02033E92
	add r0, r1, #0
	bx lr
_02033E92:
	ldr r1, [r0]
	cmp r1, #0
	beq _02033E9C
	add r0, r1, #0
	bx lr
_02033E9C:
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _02033EA4
	mov r0, #0
_02033EA4:
	bx lr
	.balign 4, 0
	thumb_func_end sub_02033E88

	thumb_func_start sub_02033EA8
sub_02033EA8: ; 0x02033EA8
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x10]
	cmp r1, #0
	beq _02033EB8
	mov r0, #0
	str r0, [r4, #0x10]
	pop {r4, pc}
_02033EB8:
	bl sub_02033C70
	cmp r0, #0
	bne _02033EC8
	add r4, #8
	add r0, r4, #0
	bl sub_02033C70
_02033EC8:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02033EA8

	thumb_func_start sub_02033ECC
sub_02033ECC: ; 0x02033ECC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #4]
	mov r7, #1
	str r2, [sp]
	cmp r0, #0
	ble _02033F22
_02033EDC:
	add r0, r5, #0
	bl sub_02033E88
	add r6, r0, #0
	beq _02033F22
	add r0, r5, #0
	bl sub_02033EA8
	ldr r2, [r5, #0x14]
	add r0, r6, #0
	add r1, r4, #0
	add r3, r7, #0
	bl sub_02033D28
	cmp r0, #0
	bne _02033F00
	str r6, [r5, #0x10]
	b _02033F22
_02033F00:
	mov r0, #0
	ldr r1, [r4, #4]
	mvn r0, r0
	cmp r1, r0
	bne _02033F10
	str r6, [r5, #0x10]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02033F10:
	add r0, r6, #0
	mov r1, #0
	mov r2, #0x10
	bl MI_CpuFill8
	ldr r0, [r4, #4]
	ldr r7, [sp]
	cmp r0, #0
	bgt _02033EDC
_02033F22:
	ldr r0, [r4, #4]
	mov r2, #0
	cmp r0, #0
	ble _02033F3E
	mov r1, #0xee
_02033F2C:
	ldr r0, [r4]
	add r2, r2, #1
	strb r1, [r0]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	ldr r0, [r4, #4]
	cmp r2, r0
	blt _02033F2C
_02033F3E:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02033ECC

	thumb_func_start sub_02033F44
sub_02033F44: ; 0x02033F44
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r6, r2, #0
	mov r1, #0
	mov r2, #0x20
	add r5, r0, #0
	bl MI_CpuFill8
	lsl r7, r4, #4
	mov r0, #0xf
	add r1, r7, #0
	bl AllocFromHeap
	mov r1, #0
	add r2, r7, #0
	str r0, [r5, #0x18]
	bl MI_CpuFill8
	str r4, [r5, #0x1c]
	str r6, [r5, #0x14]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02033F44

	thumb_func_start sub_02033F70
sub_02033F70: ; 0x02033F70
	push {r4, lr}
	add r4, r0, #0
	ldr r2, [r4, #0x1c]
	ldr r0, [r4, #0x18]
	mov r1, #0
	lsl r2, r2, #4
	bl MI_CpuFill8
	mov r0, #0
	str r0, [r4]
	str r0, [r4, #4]
	str r0, [r4, #8]
	str r0, [r4, #0xc]
	str r0, [r4, #0x10]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02033F70

	thumb_func_start sub_02033F90
sub_02033F90: ; 0x02033F90
	ldr r3, _02033F98 ; =Heap_Free
	ldr r0, [r0, #0x18]
	bx r3
	nop
_02033F98: .word Heap_Free
	thumb_func_end sub_02033F90

	thumb_func_start sub_02033F9C
sub_02033F9C: ; 0x02033F9C
	push {r3, r4}
	ldr r4, [r0, #0x1c]
	mov r2, #0
	ldr r3, [r0, #0x18]
	cmp r4, #0
	ble _02033FBC
_02033FA8:
	ldrb r0, [r3, #0xe]
	cmp r0, r1
	bne _02033FB4
	mov r0, #1
	pop {r3, r4}
	bx lr
_02033FB4:
	add r2, r2, #1
	add r3, #0x10
	cmp r2, r4
	blt _02033FA8
_02033FBC:
	mov r0, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02033F9C

	thumb_func_start sub_02033FC4
sub_02033FC4: ; 0x02033FC4
	push {r3, r4, lr}
	sub sp, #0x2c
	ldr r3, _02033FEC ; =_020F692C
	add r4, r0, #0
	add r2, sp, #0
	mov r1, #0x29
_02033FD0:
	ldrb r0, [r3]
	add r3, r3, #1
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _02033FD0
	cmp r4, #0x29
	blo _02033FE4
	bl GF_AssertFail
_02033FE4:
	add r0, sp, #0
	ldrb r0, [r0, r4]
	add sp, #0x2c
	pop {r3, r4, pc}
	.balign 4, 0
_02033FEC: .word _020F692C
	thumb_func_end sub_02033FC4

	thumb_func_start sub_02033FF0
sub_02033FF0: ; 0x02033FF0
	push {r3, r4, lr}
	sub sp, #0x2c
	ldr r3, _02034018 ; =_020F6955
	add r4, r0, #0
	add r2, sp, #0
	mov r1, #0x29
_02033FFC:
	ldrb r0, [r3]
	add r3, r3, #1
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _02033FFC
	cmp r4, #0x29
	blo _02034010
	bl GF_AssertFail
_02034010:
	add r0, sp, #0
	ldrb r0, [r0, r4]
	add sp, #0x2c
	pop {r3, r4, pc}
	.balign 4, 0
_02034018: .word _020F6955
	thumb_func_end sub_02033FF0

	thumb_func_start sub_0203401C
sub_0203401C: ; 0x0203401C
	cmp r0, #0x12
	bgt _02034036
	bge _0203403A
	cmp r0, #0xd
	bgt _0203403E
	cmp r0, #7
	blt _0203403E
	beq _0203403A
	cmp r0, #9
	beq _0203403A
	cmp r0, #0xd
	beq _0203403A
	b _0203403E
_02034036:
	cmp r0, #0x1a
	bne _0203403E
_0203403A:
	mov r0, #1
	bx lr
_0203403E:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203401C

	thumb_func_start sub_02034044
sub_02034044: ; 0x02034044
	sub r0, #0x13
	cmp r0, #0x11
	bhi _0203407E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02034056: ; jump table
	.short _0203407A - _02034056 - 2 ; case 0
	.short _0203407A - _02034056 - 2 ; case 1
	.short _0203407A - _02034056 - 2 ; case 2
	.short _0203407A - _02034056 - 2 ; case 3
	.short _0203407A - _02034056 - 2 ; case 4
	.short _0203407A - _02034056 - 2 ; case 5
	.short _0203407A - _02034056 - 2 ; case 6
	.short _0203407E - _02034056 - 2 ; case 7
	.short _0203407E - _02034056 - 2 ; case 8
	.short _0203407E - _02034056 - 2 ; case 9
	.short _0203407A - _02034056 - 2 ; case 10
	.short _0203407E - _02034056 - 2 ; case 11
	.short _0203407E - _02034056 - 2 ; case 12
	.short _0203407E - _02034056 - 2 ; case 13
	.short _0203407A - _02034056 - 2 ; case 14
	.short _0203407A - _02034056 - 2 ; case 15
	.short _0203407A - _02034056 - 2 ; case 16
	.short _0203407A - _02034056 - 2 ; case 17
_0203407A:
	mov r0, #1
	bx lr
_0203407E:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_02034044

	thumb_func_start sub_02034084
sub_02034084: ; 0x02034084
	cmp r0, #0x1d
	beq _02034090
	cmp r0, #0x21
	beq _02034090
	cmp r0, #0x23
	bne _02034094
_02034090:
	mov r0, #1
	bx lr
_02034094:
	mov r0, #0
	bx lr
	thumb_func_end sub_02034084

	thumb_func_start sub_02034098
sub_02034098: ; 0x02034098
	cmp r0, #0x17
	bgt _020340B8
	add r1, r0, #0
	sub r1, #0x13
	bmi _020340C0
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_020340AE: ; jump table
	.short _020340BC - _020340AE - 2 ; case 0
	.short _020340BC - _020340AE - 2 ; case 1
	.short _020340BC - _020340AE - 2 ; case 2
	.short _020340BC - _020340AE - 2 ; case 3
	.short _020340BC - _020340AE - 2 ; case 4
_020340B8:
	cmp r0, #0x22
	bne _020340C0
_020340BC:
	mov r0, #1
	bx lr
_020340C0:
	mov r0, #0
	bx lr
	thumb_func_end sub_02034098

	thumb_func_start sub_020340C4
sub_020340C4: ; 0x020340C4
	cmp r0, #0x26
	bgt _020340F6
	bge _02034102
	cmp r0, #8
	bgt _020340F0
	cmp r0, #0
	blt _02034106
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_020340DE: ; jump table
	.short _02034106 - _020340DE - 2 ; case 0
	.short _02034102 - _020340DE - 2 ; case 1
	.short _02034102 - _020340DE - 2 ; case 2
	.short _02034102 - _020340DE - 2 ; case 3
	.short _02034102 - _020340DE - 2 ; case 4
	.short _02034102 - _020340DE - 2 ; case 5
	.short _02034106 - _020340DE - 2 ; case 6
	.short _02034106 - _020340DE - 2 ; case 7
	.short _02034102 - _020340DE - 2 ; case 8
_020340F0:
	cmp r0, #0x25
	beq _02034102
	b _02034106
_020340F6:
	cmp r0, #0x27
	bgt _020340FE
	beq _02034102
	b _02034106
_020340FE:
	cmp r0, #0x28
	bne _02034106
_02034102:
	mov r0, #1
	bx lr
_02034106:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_020340C4

	thumb_func_start sub_0203410C
sub_0203410C: ; 0x0203410C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _02034150 ; =_021D412C
	add r4, r1, #0
	ldr r0, [r0]
	add r6, r2, #0
	cmp r0, #0
	bne _02034128
	mov r0, #0xf
	mov r1, #0x18
	bl AllocFromHeap
	ldr r1, _02034150 ; =_021D412C
	str r0, [r1]
_02034128:
	ldr r0, _02034150 ; =_021D412C
	mov r3, #0
	ldr r1, [r0]
	add r2, r3, #0
	str r5, [r1]
	ldr r1, [r0]
	str r4, [r1, #4]
	ldr r1, [r0]
	str r6, [r1, #8]
_0203413A:
	ldr r1, [r0]
	add r1, r1, r3
	add r3, r3, #1
	strb r2, [r1, #0xc]
	cmp r3, #8
	blt _0203413A
	ldr r0, _02034150 ; =_021D412C
	ldr r0, [r0]
	strb r2, [r0, #0x14]
	pop {r4, r5, r6, pc}
	nop
_02034150: .word _021D412C
	thumb_func_end sub_0203410C

	thumb_func_start sub_02034154
sub_02034154: ; 0x02034154
	push {r3, lr}
	ldr r0, _0203416C ; =_021D412C
	ldr r0, [r0]
	cmp r0, #0
	beq _02034168
	bl Heap_Free
	ldr r0, _0203416C ; =_021D412C
	mov r1, #0
	str r1, [r0]
_02034168:
	pop {r3, pc}
	nop
_0203416C: .word _021D412C
	thumb_func_end sub_02034154

	thumb_func_start sub_02034170
sub_02034170: ; 0x02034170
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	add r7, r3, #0
	cmp r4, #0x16
	bge _02034188
	mov r0, #0xc
	mul r1, r0
	ldr r0, _020341D4 ; =_020F6980
	ldr r4, [r0, r1]
	b _020341B0
_02034188:
	ldr r0, _020341D8 ; =_021D412C
	ldr r0, [r0]
	cmp r0, #0
	bne _02034194
	bl GF_AssertFail
_02034194:
	ldr r0, _020341D8 ; =_021D412C
	ldr r1, [r0]
	ldr r0, [r1, #4]
	add r0, #0x16
	cmp r4, r0
	ble _020341A6
	bl sub_02037974
	pop {r3, r4, r5, r6, r7, pc}
_020341A6:
	ldr r1, [r1]
	sub r4, #0x16
	mov r0, #0xc
	mul r0, r4
	ldr r4, [r1, r0]
_020341B0:
	cmp r4, #0
	beq _020341D2
	ldr r0, _020341D8 ; =_021D412C
	ldr r3, [r0]
	cmp r3, #0
	beq _020341C8
	ldr r3, [r3, #8]
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	blx r4
	pop {r3, r4, r5, r6, r7, pc}
_020341C8:
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	mov r3, #0
	blx r4
_020341D2:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020341D4: .word _020F6980
_020341D8: .word _021D412C
	thumb_func_end sub_02034170

	thumb_func_start sub_020341DC
sub_020341DC: ; 0x020341DC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
	cmp r5, #0x16
	bge _020341F2
	mov r0, #0xc
	add r1, r5, #0
	mul r1, r0
	ldr r0, _0203423C ; =_020F6980 + 4
	ldr r0, [r0, r1]
	b _0203422E
_020341F2:
	ldr r0, _02034240 ; =_021D412C
	ldr r0, [r0]
	cmp r0, #0
	bne _020341FE
	bl GF_AssertFail
_020341FE:
	ldr r0, _02034240 ; =_021D412C
	ldr r1, [r0]
	cmp r1, #0
	bne _0203420E
	bl sub_02037974
	mov r0, #0
	pop {r3, r4, r5, pc}
_0203420E:
	ldr r0, [r1, #4]
	add r0, #0x16
	cmp r5, r0
	ble _02034222
	bl GF_AssertFail
	bl sub_02037974
	mov r0, #0
	pop {r3, r4, r5, pc}
_02034222:
	ldr r1, [r1]
	sub r5, #0x16
	mov r0, #0xc
	mul r0, r5
	add r0, r1, r0
	ldr r0, [r0, #4]
_0203422E:
	cmp r0, #0
	beq _02034236
	blx r0
	add r4, r0, #0
_02034236:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_0203423C: .word _020F6980 + 4
_02034240: .word _021D412C
	thumb_func_end sub_020341DC

	thumb_func_start sub_02034244
sub_02034244: ; 0x02034244
	cmp r0, #0x16
	bge _0203425C
	mov r1, #0xc
	mul r1, r0
	ldr r0, _02034278 ; =_020F6980 + 8
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _02034258
	mov r0, #1
	bx lr
_02034258:
	mov r0, #0
	bx lr
_0203425C:
	ldr r1, _0203427C ; =_021D412C
	sub r0, #0x16
	ldr r1, [r1]
	ldr r2, [r1]
	mov r1, #0xc
	mul r1, r0
	add r0, r2, r1
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _02034274
	mov r0, #1
	bx lr
_02034274:
	mov r0, #0
	bx lr
	.balign 4, 0
_02034278: .word _020F6980 + 8
_0203427C: .word _021D412C
	thumb_func_end sub_02034244

	thumb_func_start sub_02034280
sub_02034280: ; 0x02034280
	push {r3, r4, r5, lr}
	add r3, r0, #0
	cmp r3, #0x16
	bge _02034298
	mov r4, #0xc
	mul r4, r3
	ldr r3, _020342B0 ; =_020F6980 + 8
	add r0, r1, #0
	ldr r3, [r3, r4]
	mov r1, #0
	blx r3
	pop {r3, r4, r5, pc}
_02034298:
	ldr r0, _020342B4 ; =_021D412C
	sub r3, #0x16
	ldr r4, [r0]
	add r0, r1, #0
	ldr r1, [r4, #8]
	ldr r5, [r4]
	mov r4, #0xc
	mul r4, r3
	add r3, r5, r4
	ldr r3, [r3, #8]
	blx r3
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020342B0: .word _020F6980 + 8
_020342B4: .word _021D412C
	thumb_func_end sub_02034280

	thumb_func_start sub_020342B8
sub_020342B8: ; 0x020342B8
	ldr r0, _020342BC ; =0x0000FFFF
	bx lr
	.balign 4, 0
_020342BC: .word 0x0000FFFF
	thumb_func_end sub_020342B8

	thumb_func_start sub_020342C0
sub_020342C0: ; 0x020342C0
	mov r0, #0
	bx lr
	thumb_func_end sub_020342C0

	thumb_func_start sub_020342C4
sub_020342C4: ; 0x020342C4
	mov r0, #1
	bx lr
	thumb_func_end sub_020342C4

	thumb_func_start sub_020342C8
sub_020342C8: ; 0x020342C8
	mov r0, #2
	bx lr
	thumb_func_end sub_020342C8

	thumb_func_start sub_020342CC
sub_020342CC: ; 0x020342CC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0203769C
	cmp r0, #0
	bne _0203430A
	ldr r4, _0203430C ; =_021D412C
	mov r1, #1
	ldr r0, [r4]
	add r0, r0, r5
	strb r1, [r0, #0xc]
	mov r5, #0
_020342E4:
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	bl sub_020373B4
	cmp r0, #0
	beq _020342FA
	ldr r0, [r4]
	add r0, r0, r5
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	beq _0203430A
_020342FA:
	add r5, r5, #1
	cmp r5, #8
	blt _020342E4
	mov r1, #0
	mov r0, #0xe
	add r2, r1, #0
	bl sub_02037108
_0203430A:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0203430C: .word _021D412C
	thumb_func_end sub_020342CC

	thumb_func_start sub_02034310
sub_02034310: ; 0x02034310
	ldr r0, _02034330 ; =_021D412C
	mov r3, #0
	ldr r1, [r0]
	str r3, [r1]
	ldr r1, [r0]
	str r3, [r1, #4]
	ldr r1, [r0]
	str r3, [r1, #8]
	ldr r0, [r0]
	mov r1, #1
	strb r1, [r0, #0x14]
	ldr r3, _02034334 ; =sub_020376E0
	mov r0, #0xf
	add r1, r2, #0
	bx r3
	nop
_02034330: .word _021D412C
_02034334: .word sub_020376E0
	thumb_func_end sub_02034310

	thumb_func_start sub_02034338
sub_02034338: ; 0x02034338
	push {r4, lr}
	add r4, r0, #0
	bl sub_0203769C
	cmp r0, #0
	bne _0203434E
	ldr r0, _02034350 ; =_021D412C
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, r4
	strb r1, [r0, #0xc]
_0203434E:
	pop {r4, pc}
	.balign 4, 0
_02034350: .word _021D412C
	thumb_func_end sub_02034338
