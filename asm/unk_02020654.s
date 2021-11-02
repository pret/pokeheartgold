	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02020654
sub_02020654: ; 0x02020654
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r0, r1, #0
	mov r1, #0x30
	mul r1, r4
	bl AllocFromHeap
	ldr r2, _02020670 ; =sub_02020684
	add r1, r4, #0
	add r5, r0, #0
	bl NNS_G2dInitCellTransferStateManager
	add r0, r5, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02020670: .word sub_02020684
	thumb_func_end sub_02020654

	thumb_func_start sub_02020674
sub_02020674: ; 0x02020674
	ldr r3, _02020678 ; =NNS_G2dUpdateCellTransferStateManager
	bx r3
	.balign 4, 0
_02020678: .word NNS_G2dUpdateCellTransferStateManager
	thumb_func_end sub_02020674

	thumb_func_start sub_0202067C
sub_0202067C: ; 0x0202067C
	ldr r3, _02020680 ; =FreeToHeap
	bx r3
	.balign 4, 0
_02020680: .word FreeToHeap
	thumb_func_end sub_0202067C

	thumb_func_start sub_02020684
sub_02020684: ; 0x02020684
	push {r3, lr}
	bl sub_020205D8
	pop {r3, pc}
	thumb_func_end sub_02020684

	thumb_func_start sub_0202068C
sub_0202068C: ; 0x0202068C
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	mov r1, #8
	bl AllocFromHeap
	mov r1, #0x14
	add r4, r0, #0
	add r0, r6, #0
	mul r1, r5
	bl AllocFromHeap
	str r0, [r4]
	mov r6, #0
	str r5, [r4, #4]
	cmp r5, #0
	ble _020206C4
	add r5, r6, #0
_020206B2:
	ldr r0, [r4]
	add r0, r0, r5
	bl sub_02020770
	ldr r0, [r4, #4]
	add r6, r6, #1
	add r5, #0x14
	cmp r6, r0
	blt _020206B2
_020206C4:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0202068C

	thumb_func_start sub_020206C8
sub_020206C8: ; 0x020206C8
	push {r4, lr}
	add r4, r0, #0
	bl sub_02020740
	ldr r0, [r4]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020206C8

	thumb_func_start sub_020206E0
sub_020206E0: ; 0x020206E0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	mov r4, #0
	add r7, r2, #0
	mov ip, r1
	add r6, r3, #0
	add r2, r4, #0
	cmp r0, #0
	ble _0202070E
	ldr r5, [r5]
	add r3, r5, #0
_020206F8:
	ldr r1, [r3]
	cmp r1, #0
	bne _02020706
	mov r0, #0x14
	mul r0, r2
	add r4, r5, r0
	b _0202070E
_02020706:
	add r2, r2, #1
	add r3, #0x14
	cmp r2, r0
	blt _020206F8
_0202070E:
	cmp r4, #0
	bne _02020716
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02020716:
	mov r0, ip
	str r0, [r4]
	str r7, [r4, #4]
	ldr r1, [sp, #0x1c]
	ldr r0, [sp, #0x18]
	str r6, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0xff
	strb r0, [r4, #0x10]
	lsl r1, r1, #4
	strb r0, [r4, #0x11]
	add r0, r4, #0
	lsr r1, r1, #0x10
	bl sub_02020780
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020206E0

	thumb_func_start sub_02020738
sub_02020738: ; 0x02020738
	ldr r3, _0202073C ; =sub_02020770
	bx r3
	.balign 4, 0
_0202073C: .word sub_02020770
	thumb_func_end sub_02020738

	thumb_func_start sub_02020740
sub_02020740: ; 0x02020740
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	mov r6, #0
	cmp r0, #0
	ble _02020760
	add r4, r6, #0
_0202074E:
	ldr r0, [r5]
	add r0, r0, r4
	bl sub_02020770
	ldr r0, [r5, #4]
	add r6, r6, #1
	add r4, #0x14
	cmp r6, r0
	blt _0202074E
_02020760:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02020740

	thumb_func_start sub_02020764
sub_02020764: ; 0x02020764
	ldr r3, _0202076C ; =sub_02020780
	lsl r1, r1, #4
	lsr r1, r1, #0x10
	bx r3
	.balign 4, 0
_0202076C: .word sub_02020780
	thumb_func_end sub_02020764

	thumb_func_start sub_02020770
sub_02020770: ; 0x02020770
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	strb r1, [r0, #0x10]
	strb r1, [r0, #0x11]
	bx lr
	thumb_func_end sub_02020770

	thumb_func_start sub_02020780
sub_02020780: ; 0x02020780
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, [r4]
	bl sub_02026DE0
	add r2, sp, #0
	strb r0, [r2]
	lsr r0, r0, #8
	strb r0, [r2, #1]
	ldrb r0, [r2]
	add r1, sp, #0
	add r1, #2
	strb r0, [r2, #2]
	ldrb r0, [r2, #1]
	strb r0, [r2, #3]
	ldrb r3, [r4, #0x10]
	ldrb r0, [r2, #2]
	cmp r3, r0
	beq _020207AE
	add r0, r4, #0
	bl sub_020207C8
_020207AE:
	add r0, sp, #0
	ldrb r1, [r4, #0x11]
	ldrb r0, [r0, #3]
	cmp r1, r0
	beq _020207C2
	add r1, sp, #0
	add r0, r4, #0
	add r1, #2
	bl sub_020207F4
_020207C2:
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_02020780

	thumb_func_start sub_020207C8
sub_020207C8: ; 0x020207C8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02020820
	ldr r3, [r5, #8]
	add r2, r0, #0
	lsl r1, r3, #0x10
	ldr r6, _020207F0 ; =0x7FFF0000
	mov r0, #0
	and r3, r6
	lsr r3, r3, #0x10
	lsr r1, r1, #0xd
	lsl r3, r3, #4
	bl sub_020205D8
	ldrb r0, [r4]
	strb r0, [r5, #0x10]
	pop {r4, r5, r6, pc}
	nop
_020207F0: .word 0x7FFF0000
	thumb_func_end sub_020207C8

	thumb_func_start sub_020207F4
sub_020207F4: ; 0x020207F4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0202082C
	ldr r3, [r5, #0xc]
	add r2, r0, #0
	lsl r1, r3, #0x10
	ldr r6, _0202081C ; =0xFFFF0000
	mov r0, #1
	and r3, r6
	lsr r3, r3, #0x10
	lsr r1, r1, #0xd
	lsl r3, r3, #3
	bl sub_020205D8
	ldrb r0, [r4, #1]
	strb r0, [r5, #0x11]
	pop {r4, r5, r6, pc}
	nop
_0202081C: .word 0xFFFF0000
	thumb_func_end sub_020207F4

	thumb_func_start sub_02020820
sub_02020820: ; 0x02020820
	ldr r3, _02020828 ; =sub_02020838
	ldr r0, [r0, #4]
	ldrb r1, [r1]
	bx r3
	.balign 4, 0
_02020828: .word sub_02020838
	thumb_func_end sub_02020820

	thumb_func_start sub_0202082C
sub_0202082C: ; 0x0202082C
	ldr r3, _02020834 ; =sub_02020888
	ldr r0, [r0, #4]
	ldrb r1, [r1, #1]
	bx r3
	.balign 4, 0
_02020834: .word sub_02020888
	thumb_func_end sub_0202082C

	thumb_func_start sub_02020838
sub_02020838: ; 0x02020838
	push {r3, r4}
	cmp r0, #0
	beq _02020864
	add r2, r0, #0
	add r2, #0x3c
	beq _02020860
	add r3, r0, #0
	add r3, #0x3d
	ldrb r3, [r3]
	cmp r1, r3
	bhs _02020860
	add r3, r0, #0
	add r3, #0x42
	ldrh r4, [r3]
	add r3, r2, r4
	ldrh r2, [r2, r4]
	add r3, r3, #4
	mul r1, r2
	add r3, r3, r1
	b _02020866
_02020860:
	mov r3, #0
	b _02020866
_02020864:
	mov r3, #0
_02020866:
	cmp r3, #0
	bne _02020870
	mov r0, #0
	pop {r3, r4}
	bx lr
_02020870:
	ldr r1, [r0, #0x14]
	add r2, r0, r1
	ldr r1, [r3]
	ldr r0, [r0, #8]
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	add r0, r1, r0
	lsl r0, r0, #3
	add r0, r2, r0
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02020838

	thumb_func_start sub_02020888
sub_02020888: ; 0x02020888
	push {r3, r4}
	cmp r0, #0
	beq _020208B0
	ldrh r2, [r0, #0x34]
	cmp r2, #0
	beq _020208B0
	add r4, r0, r2
	beq _020208AC
	ldrb r2, [r4, #1]
	cmp r1, r2
	bhs _020208AC
	ldrh r2, [r4, #6]
	add r3, r4, r2
	ldrh r2, [r4, r2]
	add r3, r3, #4
	mul r1, r2
	add r2, r3, r1
	b _020208B2
_020208AC:
	mov r2, #0
	b _020208B2
_020208B0:
	mov r2, #0
_020208B2:
	cmp r2, #0
	bne _020208BC
	mov r0, #0
	pop {r3, r4}
	bx lr
_020208BC:
	ldr r1, [r0, #0x38]
	add r1, r0, r1
	ldrh r0, [r2]
	lsl r0, r0, #3
	add r0, r1, r0
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02020888

	thumb_func_start sub_020208CC
sub_020208CC: ; 0x020208CC
	ldr r1, [r1]
	ldr r0, [r0, #8]
	lsl r1, r1, #0x10
	lsl r0, r0, #0x10
	lsr r1, r1, #0xd
	lsr r0, r0, #0xd
	add r0, r1, r0
	bx lr
	thumb_func_end sub_020208CC

	thumb_func_start sub_020208DC
sub_020208DC: ; 0x020208DC
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r0, sp, #0
	bl sub_02020B3C
	cmp r4, #0
	beq _020208FA
	add r0, r4, #0
	add r0, #0x3c
	add r1, sp, #0
	bl NNS_G3dGetResDataByName
	add r1, r0, #0
	b _020208FC
_020208FA:
	mov r1, #0
_020208FC:
	cmp r1, #0
	bne _02020906
	add sp, #0x10
	mov r0, #0
	pop {r4, pc}
_02020906:
	add r0, r4, #0
	bl sub_020208CC
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end sub_020208DC

	thumb_func_start sub_02020910
sub_02020910: ; 0x02020910
	push {r4, lr}
	cmp r0, #0
	beq _0202093C
	add r2, r0, #0
	add r2, #0x3c
	beq _02020938
	add r3, r0, #0
	add r3, #0x3d
	ldrb r3, [r3]
	cmp r1, r3
	bhs _02020938
	add r3, r0, #0
	add r3, #0x42
	ldrh r4, [r3]
	add r3, r2, r4
	ldrh r2, [r2, r4]
	add r3, r3, #4
	mul r1, r2
	add r1, r3, r1
	b _0202093E
_02020938:
	mov r1, #0
	b _0202093E
_0202093C:
	mov r1, #0
_0202093E:
	cmp r1, #0
	bne _02020946
	mov r0, #0
	pop {r4, pc}
_02020946:
	bl sub_020208CC
	pop {r4, pc}
	thumb_func_end sub_02020910

	thumb_func_start sub_0202094C
sub_0202094C: ; 0x0202094C
	push {r3, lr}
	ldr r0, [r1]
	mov r1, #7
	lsl r1, r1, #0x1a
	and r1, r0
	lsr r1, r1, #0x1a
	cmp r1, #6
	bhi _0202098A
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02020968: ; jump table
	.short _0202098A - _02020968 - 2 ; case 0
	.short _02020982 - _02020968 - 2 ; case 1
	.short _02020976 - _02020968 - 2 ; case 2
	.short _0202097A - _02020968 - 2 ; case 3
	.short _0202097E - _02020968 - 2 ; case 4
	.short _0202098A - _02020968 - 2 ; case 5
	.short _02020986 - _02020968 - 2 ; case 6
_02020976:
	mov r1, #4
	b _0202098E
_0202097A:
	mov r1, #2
	b _0202098E
_0202097E:
	mov r1, #1
	b _0202098E
_02020982:
	mov r1, #1
	b _0202098E
_02020986:
	mov r1, #1
	b _0202098E
_0202098A:
	mov r0, #0
	pop {r3, pc}
_0202098E:
	mov r3, #7
	lsl r3, r3, #0x14
	add r2, r0, #0
	and r2, r3
	lsl r3, r3, #3
	and r0, r3
	lsr r2, r2, #0x14
	lsr r0, r0, #0x17
	lsl r2, r2, #4
	lsl r0, r0, #4
	mul r0, r2
	bl _u32_div_f
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0202094C

	thumb_func_start sub_020209AC
sub_020209AC: ; 0x020209AC
	push {r4, lr}
	cmp r0, #0
	beq _020209D8
	add r2, r0, #0
	add r2, #0x3c
	beq _020209D4
	add r3, r0, #0
	add r3, #0x3d
	ldrb r3, [r3]
	cmp r1, r3
	bhs _020209D4
	add r3, r0, #0
	add r3, #0x42
	ldrh r4, [r3]
	add r3, r2, r4
	ldrh r2, [r2, r4]
	add r3, r3, #4
	mul r1, r2
	add r1, r3, r1
	b _020209DA
_020209D4:
	mov r1, #0
	b _020209DA
_020209D8:
	mov r1, #0
_020209DA:
	bl sub_0202094C
	pop {r4, pc}
	thumb_func_end sub_020209AC

	thumb_func_start sub_020209E0
sub_020209E0: ; 0x020209E0
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r0, sp, #0
	bl sub_02020B3C
	cmp r4, #0
	beq _020209FE
	add r0, r4, #0
	add r0, #0x3c
	add r1, sp, #0
	bl NNS_G3dGetResDataByName
	add r1, r0, #0
	b _02020A00
_020209FE:
	mov r1, #0
_02020A00:
	add r0, r4, #0
	bl sub_0202094C
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020209E0

	thumb_func_start sub_02020A0C
sub_02020A0C: ; 0x02020A0C
	ldrb r3, [r0]
	strb r3, [r1]
	ldrb r0, [r0, #1]
	strb r0, [r2]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02020A0C

	thumb_func_start sub_02020A18
sub_02020A18: ; 0x02020A18
	ldrb r3, [r0, #2]
	strb r3, [r1]
	ldrb r0, [r0, #3]
	strb r0, [r2]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02020A18

	thumb_func_start sub_02020A24
sub_02020A24: ; 0x02020A24
	push {r4, r5}
	ldr r5, _02020A9C ; =0xFFFFFFF8
	ldr r4, [sp, #0xc]
	add r5, sp
	ldrb r5, [r5, #0x18]
	cmp r5, #3
	bhi _02020A64
	add r5, r5, r5
	add r5, pc
	ldrh r5, [r5, #6]
	lsl r5, r5, #0x10
	asr r5, r5, #0x10
	add pc, r5
_02020A3E: ; jump table
	.short _02020A46 - _02020A3E - 2 ; case 0
	.short _02020A4E - _02020A3E - 2 ; case 1
	.short _02020A56 - _02020A3E - 2 ; case 2
	.short _02020A5E - _02020A3E - 2 ; case 3
_02020A46:
	lsl r4, r4, #3
	add r4, r0, r4
	ldrb r4, [r4, #4]
	b _02020A64
_02020A4E:
	lsl r4, r4, #3
	add r4, r0, r4
	ldrb r4, [r4, #5]
	b _02020A64
_02020A56:
	lsl r4, r4, #3
	add r4, r0, r4
	ldrb r4, [r4, #6]
	b _02020A64
_02020A5E:
	lsl r4, r4, #3
	add r4, r0, r4
	ldrb r4, [r4, #7]
_02020A64:
	cmp r1, #0
	beq _02020A6E
	lsl r5, r4, #3
	ldrb r5, [r0, r5]
	strb r5, [r1]
_02020A6E:
	cmp r2, #0
	beq _02020A7A
	lsl r1, r4, #3
	add r1, r0, r1
	ldrb r1, [r1, #1]
	strb r1, [r2]
_02020A7A:
	cmp r3, #0
	beq _02020A86
	lsl r1, r4, #3
	add r1, r0, r1
	ldrb r1, [r1, #2]
	strb r1, [r3]
_02020A86:
	ldr r2, [sp, #8]
	cmp r2, #0
	beq _02020A94
	lsl r1, r4, #3
	add r0, r0, r1
	ldrb r0, [r0, #3]
	strb r0, [r2]
_02020A94:
	add r0, r4, #0
	pop {r4, r5}
	bx lr
	nop
_02020A9C: .word 0xFFFFFFF8
	thumb_func_end sub_02020A24

	thumb_func_start Ascii_StrLen
Ascii_StrLen: ; 0x02020AA0
	mov r2, #0
	ldrsb r1, [r0, r2]
	cmp r1, #0
	beq _02020AB0
_02020AA8:
	add r2, r2, #1
	ldrsb r1, [r0, r2]
	cmp r1, #0
	bne _02020AA8
_02020AB0:
	add r0, r2, #0
	bx lr
	thumb_func_end Ascii_StrLen

	thumb_func_start Ascii_GetDelim
Ascii_GetDelim: ; 0x02020AB4
	push {r4, r5}
	mov r4, #1
	mov r3, #0
	lsl r4, r4, #8
_02020ABC:
	ldrsb r5, [r0, r3]
	strb r5, [r1, r3]
	ldrsb r5, [r0, r3]
	cmp r2, r5
	beq _02020ACA
	cmp r5, #0
	bne _02020AEA
_02020ACA:
	mov r4, #0
	strb r4, [r1, r3]
	cmp r2, #0xd
	bne _02020AE2
	add r1, r3, #1
	ldrsb r1, [r0, r1]
	cmp r1, #0xa
	bne _02020AE2
	add r1, r3, #2
	add r0, r0, r1
	pop {r4, r5}
	bx lr
_02020AE2:
	add r1, r3, #1
	add r0, r0, r1
	pop {r4, r5}
	bx lr
_02020AEA:
	add r3, r3, #1
	cmp r3, r4
	blt _02020ABC
	mov r0, #0
	pop {r4, r5}
	bx lr
	.balign 4, 0
	thumb_func_end Ascii_GetDelim

	thumb_func_start Ascii_StrToL
Ascii_StrToL: ; 0x02020AF8
	push {r4, r5, r6, lr}
	add r4, r0, #0
	bl Ascii_StrLen
	mov r5, #1
	mov r6, #0
	sub r3, r0, #1
	bmi _02020B36
	sub r1, r6, #1
	mov r0, #0xa
_02020B0C:
	ldrsb r2, [r4, r3]
	cmp r2, #0x30
	blt _02020B1E
	cmp r2, #0x39
	bgt _02020B1E
	sub r2, #0x30
	mul r2, r5
	add r6, r6, r2
	b _02020B30
_02020B1E:
	cmp r3, #0
	bne _02020B2A
	cmp r2, #0x2d
	bne _02020B30
	mul r6, r1
	b _02020B30
_02020B2A:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
_02020B30:
	mul r5, r0
	sub r3, r3, #1
	bpl _02020B0C
_02020B36:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end Ascii_StrToL

	thumb_func_start sub_02020B3C
sub_02020B3C: ; 0x02020B3C
	push {r3, r4, r5, lr}
	mov r2, #0
	add r4, r1, #0
	add r5, r0, #0
	add r1, r2, #0
_02020B46:
	lsl r0, r2, #2
	str r1, [r5, r0]
	add r0, r2, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	cmp r2, #4
	blo _02020B46
	add r0, r4, #0
	bl Ascii_StrLen
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	ldr r2, _02020B74 ; =0x00000000
	beq _02020B70
_02020B62:
	ldrsb r0, [r4, r2]
	strb r0, [r5, r2]
	add r0, r2, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	cmp r2, r1
	blo _02020B62
_02020B70:
	pop {r3, r4, r5, pc}
	nop
_02020B74: .word 0x00000000
	thumb_func_end sub_02020B3C

	thumb_func_start sub_02020B78
sub_02020B78: ; 0x02020B78
	ldr r1, _02020B88 ; =0x00000121
	cmp r0, r1
	bhs _02020B82
	mov r0, #1
	bx lr
_02020B82:
	mov r0, #0
	bx lr
	nop
_02020B88: .word 0x00000121
	thumb_func_end sub_02020B78

	thumb_func_start sub_02020B8C
sub_02020B8C: ; 0x02020B8C
	cmp r0, r1
	blt _02020B92
	add r0, r1, #0
_02020B92:
	bx lr
	thumb_func_end sub_02020B8C

	thumb_func_start sub_02020B94
sub_02020B94: ; 0x02020B94
	cmp r0, r1
	bgt _02020B9A
	add r0, r1, #0
_02020B9A:
	bx lr
	thumb_func_end sub_02020B94

	thumb_func_start sub_02020B9C
sub_02020B9C: ; 0x02020B9C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x50
	add r5, r0, #0
	add r3, sp, #0x14
	mov r0, #0
	str r0, [r3]
	str r0, [r3, #4]
	str r0, [r3, #8]
	add r0, r2, #0
	add r4, r1, #0
	add r2, sp, #0x44
	bl VEC_Subtract
	add r0, r5, #0
	add r1, r4, #0
	add r2, sp, #0x38
	bl VEC_Subtract
	ldr r0, [sp, #0x48]
	ldr r5, [sp, #0x4c]
	str r0, [sp]
	asr r0, r0, #0x1f
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x44]
	asr r4, r5, #0x1f
	str r0, [sp, #4]
	asr r7, r0, #0x1f
	add r0, sp, #0x44
	add r1, sp, #0x38
	bl VEC_DotProduct
	str r0, [sp, #8]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r5, #0
	add r3, r4, #0
	bl _ll_mul
	add r6, r0, #0
	ldr r0, [sp, #4]
	add r4, r1, #0
	add r1, r7, #0
	add r2, r0, #0
	add r3, r7, #0
	bl _ll_mul
	str r0, [sp, #0xc]
	add r5, r1, #0
	ldr r0, [sp]
	ldr r1, [sp, #0x10]
	add r2, r0, #0
	add r3, r1, #0
	bl _ll_mul
	mov r2, #2
	add r3, r1, #0
	add r7, r0, #0
	mov r1, #0
	lsl r2, r2, #0xa
	add r2, r6, r2
	adc r4, r1
	lsl r4, r4, #0x14
	lsr r2, r2, #0xc
	orr r2, r4
	mov r4, #2
	ldr r6, [sp, #0xc]
	lsl r4, r4, #0xa
	add r4, r6, r4
	adc r5, r1
	lsl r5, r5, #0x14
	lsr r4, r4, #0xc
	orr r4, r5
	mov r5, #2
	lsl r5, r5, #0xa
	add r5, r7, r5
	adc r3, r1
	lsl r1, r3, #0x14
	lsr r3, r5, #0xc
	orr r3, r1
	add r1, r4, r3
	ldr r0, [sp, #8]
	add r1, r2, r1
	bl FX_Div
	add r1, sp, #0x44
	add r2, sp, #0x14
	add r3, sp, #0x20
	bl VEC_MultAdd
	add r0, sp, #0x20
	add r1, sp, #0x38
	add r2, sp, #0x2c
	bl VEC_Subtract
	add r0, sp, #0x2c
	bl VEC_Mag
	add sp, #0x50
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02020B9C

	thumb_func_start sub_02020C64
sub_02020C64: ; 0x02020C64
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r4, r1, #0
	add r1, sp, #0x24
	bl VEC_Normalize
	add r0, r4, #0
	add r1, sp, #0x18
	bl VEC_Normalize
	ldr r0, [sp, #0x24]
	ldr r4, [sp, #0x18]
	str r0, [sp]
	asr r0, r0, #0x1f
	str r0, [sp, #4]
	ldr r0, [sp, #0x20]
	asr r6, r4, #0x1f
	str r0, [sp, #8]
	asr r0, r0, #0x1f
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x2c]
	ldr r2, [sp, #8]
	asr r7, r0, #0x1f
	ldr r3, [sp, #0xc]
	add r1, r7, #0
	str r0, [sp, #0x10]
	bl _ll_mul
	str r0, [sp, #0x14]
	add r5, r1, #0
	ldr r0, [sp]
	ldr r1, [sp, #4]
	add r2, r4, #0
	add r3, r6, #0
	bl _ll_mul
	mov r2, #2
	ldr r3, [sp, #0x14]
	lsl r2, r2, #0xa
	add r3, r3, r2
	ldr r2, _02020D28 ; =0x00000000
	adc r5, r2
	lsl r2, r5, #0x14
	lsr r3, r3, #0xc
	orr r3, r2
	mov r2, #2
	lsl r2, r2, #0xa
	add r0, r0, r2
	ldr r2, _02020D28 ; =0x00000000
	adc r1, r2
	lsl r1, r1, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	add r5, r3, r0
	ldr r0, [sp, #0x10]
	add r1, r7, #0
	add r2, r4, #0
	add r3, r6, #0
	bl _ll_mul
	add r6, r0, #0
	add r4, r1, #0
	ldr r0, [sp]
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r6, r6, r2
	adc r4, r3
	lsl r4, r4, #0x14
	lsr r6, r6, #0xc
	orr r6, r4
	add r4, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r4, #0xc
	orr r1, r0
	sub r0, r6, r1
	cmp r5, #0
	bne _02020D1E
	cmp r0, #0
	ble _02020D16
	add sp, #0x30
	lsl r0, r2, #3
	pop {r3, r4, r5, r6, r7, pc}
_02020D16:
	mov r0, #3
	add sp, #0x30
	lsl r0, r0, #0xe
	pop {r3, r4, r5, r6, r7, pc}
_02020D1E:
	add r1, r5, #0
	bl FX_Atan2Idx
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02020D28: .word 0x00000000
	thumb_func_end sub_02020C64

	thumb_func_start sub_02020D2C
sub_02020D2C: ; 0x02020D2C
	push {r4, r5, lr}
	sub sp, #0x24
	add r4, r1, #0
	ldr r1, [r4]
	ldr r3, _02020DA0 ; =0x021094DC
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	asr r1, r1, #4
	lsl r2, r1, #1
	lsl r1, r2, #1
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r5, r0, #0
	bl MTX_RotX33_
	ldr r0, [r4, #4]
	ldr r3, _02020DA0 ; =0x021094DC
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	asr r0, r0, #4
	lsl r2, r0, #1
	lsl r1, r2, #1
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #0
	bl MTX_RotY33_
	add r0, r5, #0
	add r1, sp, #0
	add r2, r5, #0
	bl MTX_Concat33
	ldr r0, [r4, #8]
	ldr r3, _02020DA0 ; =0x021094DC
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	asr r0, r0, #4
	lsl r2, r0, #1
	lsl r1, r2, #1
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #0
	bl MTX_RotZ33_
	add r0, r5, #0
	add r1, sp, #0
	add r2, r5, #0
	bl MTX_Concat33
	add sp, #0x24
	pop {r4, r5, pc}
	nop
_02020DA0: .word 0x021094DC
	thumb_func_end sub_02020D2C

	thumb_func_start sub_02020DA4
sub_02020DA4: ; 0x02020DA4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r1, #0
	str r0, [sp]
	add r0, r5, #0
	add r4, r2, #0
	add r6, r3, #0
	bl sub_0201FC30
	add r7, r0, #0
	add r0, r5, #0
	bl sub_0201FBB8
	add r1, r0, #0
	ldr r0, [sp]
	add r2, r7, #0
	bl MTX_RotX33_
	add r0, r4, #0
	bl sub_0201FC30
	add r5, r0, #0
	add r0, r4, #0
	bl sub_0201FBB8
	add r1, r0, #0
	add r0, sp, #4
	add r2, r5, #0
	bl MTX_RotY33_
	ldr r0, [sp]
	add r1, sp, #4
	add r2, r0, #0
	bl MTX_Concat33
	add r0, r6, #0
	bl sub_0201FC30
	add r4, r0, #0
	add r0, r6, #0
	bl sub_0201FBB8
	add r1, r0, #0
	add r0, sp, #4
	add r2, r4, #0
	bl MTX_RotZ33_
	ldr r0, [sp]
	add r1, sp, #4
	add r2, r0, #0
	bl MTX_Concat33
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02020DA4

	thumb_func_start sub_02020E10
sub_02020E10: ; 0x02020E10
	push {r3, r4, r5, r6, r7, lr}
	asr r0, r0, #4
	add r7, r2, #0
	lsl r2, r0, #1
	add r6, r1, #0
	lsl r0, r2, #1
	ldr r1, _02020E7C ; =0x021094DC
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r0, [r1, r0]
	ldrsh r1, [r1, r2]
	add r5, r3, #0
	ldr r4, [sp, #0x18]
	bl FX_Div
	add r2, r0, #0
	asr r1, r6, #0x1f
	add r0, r6, #0
	asr r3, r2, #0x1f
	bl _ll_mul
	mov r6, #2
	mov r2, #0
	lsl r6, r6, #0xa
	add r0, r0, r6
	adc r1, r2
	lsl r1, r1, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	asr r3, r0, #0x1f
	lsr r1, r0, #0x13
	lsl r3, r3, #0xd
	orr r3, r1
	lsl r0, r0, #0xd
	add r0, r0, r6
	adc r3, r2
	lsl r1, r3, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	asr r1, r0, #0x1f
	asr r3, r7, #0x1f
	add r2, r7, #0
	str r0, [r4]
	bl _ll_mul
	mov r3, #0
	add r2, r6, #0
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	str r1, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02020E7C: .word 0x021094DC
	thumb_func_end sub_02020E10

	thumb_func_start sub_02020E80
sub_02020E80: ; 0x02020E80
	push {r4, r5, r6, r7}
	ldr r6, [r2, #4]
	ldr r7, [r1]
	ldr r4, [r0, #4]
	ldr r5, [r1, #4]
	sub r1, r6, r4
	add r3, r7, #0
	mul r3, r1
	ldr r2, [r2]
	sub r1, r4, r5
	mul r1, r2
	ldr r2, [r0]
	sub r0, r5, r6
	mul r0, r2
	add r0, r1, r0
	add r0, r3, r0
	bmi _02020EA8
	mov r0, #1
	pop {r4, r5, r6, r7}
	bx lr
_02020EA8:
	mov r0, #0
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02020E80

	thumb_func_start sub_02020EB0
sub_02020EB0: ; 0x02020EB0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	add r4, r3, #0
	str r2, [sp]
	bl sub_02020E80
	add r6, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	add r2, r4, #0
	bl sub_02020E80
	eor r0, r6
	cmp r0, #1
	bne _02020EF0
	ldr r0, [sp]
	add r1, r4, #0
	add r2, r5, #0
	bl sub_02020E80
	add r5, r0, #0
	ldr r0, [sp]
	add r1, r4, #0
	add r2, r7, #0
	bl sub_02020E80
	eor r0, r5
	cmp r0, #1
	bne _02020EF0
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02020EF0:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02020EB0

	thumb_func_start sub_02020EF4
sub_02020EF4: ; 0x02020EF4
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	sub r1, r3, r4
	ldr r0, [sp, #0x18]
	add r6, r2, #0
	sub r0, r0, r6
	lsl r0, r0, #0x10
	lsl r1, r1, #0x10
	asr r0, r0, #0x10
	asr r1, r1, #0x10
	beq _02020F1A
	lsl r0, r0, #0xc
	lsl r1, r1, #0xc
	bl FX_Div
	str r0, [sp]
	b _02020F20
_02020F1A:
	mov r0, #0xff
	lsl r0, r0, #0xc
	str r0, [sp]
_02020F20:
	ldr r0, [sp]
	lsl r2, r4, #0xc
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	mov r3, #2
	mov r4, #0
	lsl r3, r3, #0xa
	lsl r2, r6, #0xc
	add r3, r0, r3
	adc r1, r4
	lsl r0, r1, #0x14
	lsr r1, r3, #0xc
	orr r1, r0
	ldr r0, [sp]
	sub r1, r2, r1
	str r0, [r5]
	str r1, [sp, #4]
	str r1, [r5, #4]
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02020EF4

	thumb_func_start sub_02020F4C
sub_02020F4C: ; 0x02020F4C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	ldr r4, [sp, #0x48]
	add r7, r0, #0
	add r5, r1, #0
	add r6, r3, #0
	str r2, [sp, #4]
	cmp r4, #0
	beq _02020F64
	ldr r0, _0202109C ; =0x0000FFFF
	str r0, [r4]
	str r0, [r4, #4]
_02020F64:
	ldr r2, [sp, #4]
	add r0, r7, #0
	add r1, r5, #0
	add r3, r6, #0
	bl sub_02020EB0
	cmp r0, #0
	bne _02020F7A
	add sp, #0x34
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02020F7A:
	ldr r0, [r5, #4]
	str r0, [sp]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	ldr r3, [r5]
	add r0, sp, #0x24
	bl sub_02020EF4
	ldr r0, [r6, #4]
	ldr r1, [sp, #4]
	str r0, [sp]
	ldr r2, [sp, #4]
	ldr r1, [r1]
	ldr r2, [r2, #4]
	ldr r3, [r6]
	add r0, sp, #0x1c
	bl sub_02020EF4
	ldr r1, [sp, #0x1c]
	ldr r3, [sp, #0x24]
	cmp r3, r1
	bne _02020FAC
	add sp, #0x34
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02020FAC:
	ldr r2, [sp, #0x20]
	ldr r0, [sp, #0x28]
	sub r1, r3, r1
	sub r0, r2, r0
	bl FX_Div
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x1c]
	ldr r2, [sp, #0xc]
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	add r2, r0, #0
	ldr r0, [sp, #0x20]
	mov r3, #0
	str r0, [sp, #0x10]
	mov r0, #2
	lsl r0, r0, #0xa
	add r0, r2, r0
	adc r1, r3
	lsr r0, r0, #0xc
	lsl r1, r1, #0x14
	str r0, [sp, #0x14]
	orr r0, r1
	str r0, [sp, #0x14]
	ldr r0, [sp, #0xc]
	add r1, sp, #0x30
	bl FX_Modf
	mov r1, #2
	lsl r1, r1, #0xa
	cmp r0, r1
	blt _02020FF8
	ldr r2, [sp, #0x30]
	lsl r0, r1, #1
	add r0, r2, r0
	str r0, [sp, #0x30]
_02020FF8:
	ldr r0, [sp, #0x30]
	ldr r1, [sp, #0x10]
	asr r0, r0, #0xc
	str r0, [r4]
	ldr r0, [sp, #0x14]
	add r0, r1, r0
	add r1, sp, #0x2c
	bl FX_Modf
	mov r1, #2
	lsl r1, r1, #0xa
	cmp r0, r1
	blt _0202101A
	ldr r2, [sp, #0x2c]
	lsl r0, r1, #1
	add r0, r2, r0
	str r0, [sp, #0x2c]
_0202101A:
	ldr r0, [sp, #0x2c]
	asr r0, r0, #0xc
	str r0, [r4, #4]
	ldr r1, [r5]
	ldr r0, [r7]
	cmp r0, r1
	blt _0202102C
	mov ip, r0
	b _02021030
_0202102C:
	mov ip, r1
	add r1, r0, #0
_02021030:
	ldr r2, [r5, #4]
	ldr r0, [r7, #4]
	cmp r0, r2
	blt _0202103C
	str r0, [sp, #8]
	b _02021040
_0202103C:
	str r2, [sp, #8]
	add r2, r0, #0
_02021040:
	ldr r0, [sp, #4]
	ldr r3, [r6]
	ldr r0, [r0]
	cmp r0, r3
	blt _0202104E
	str r0, [sp, #0x18]
	b _02021052
_0202104E:
	str r3, [sp, #0x18]
	add r3, r0, #0
_02021052:
	ldr r0, [sp, #4]
	ldr r5, [r6, #4]
	ldr r0, [r0, #4]
	cmp r0, r5
	blt _02021060
	add r7, r0, #0
	b _02021064
_02021060:
	add r7, r5, #0
	add r5, r0, #0
_02021064:
	ldr r0, [r4]
	mov r6, ip
	cmp r6, r0
	blt _02021094
	cmp r1, r0
	bgt _02021094
	ldr r1, [r4, #4]
	ldr r4, [sp, #8]
	cmp r4, r1
	blt _02021094
	cmp r2, r1
	bgt _02021094
	ldr r2, [sp, #0x18]
	cmp r2, r0
	blt _02021094
	cmp r3, r0
	bgt _02021094
	cmp r7, r1
	blt _02021094
	cmp r5, r1
	bgt _02021094
	add sp, #0x34
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02021094:
	mov r0, #0
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_0202109C: .word 0x0000FFFF
	thumb_func_end sub_02020F4C
