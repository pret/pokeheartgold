	.include "asm/macros.inc"
	.include "unk_02020654.inc"
	.include "global.inc"

	.text
	.public sub_02020B3C

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

	thumb_func_start thunk_UpdateCellTransferStateManager
thunk_UpdateCellTransferStateManager: ; 0x02020674
	ldr r3, _02020678 ; =NNS_G2dUpdateCellTransferStateManager
	bx r3
	.balign 4, 0
_02020678: .word NNS_G2dUpdateCellTransferStateManager
	thumb_func_end thunk_UpdateCellTransferStateManager

	thumb_func_start sub_0202067C
sub_0202067C: ; 0x0202067C
	ldr r3, _02020680 ; =Heap_Free
	bx r3
	.balign 4, 0
_02020680: .word Heap_Free
	thumb_func_end sub_0202067C

	thumb_func_start sub_02020684
sub_02020684: ; 0x02020684
	push {r3, lr}
	bl GF_CreateNewVramTransferTask
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
	bl Heap_Free
	add r0, r4, #0
	bl Heap_Free
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
	bl GF_CreateNewVramTransferTask
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
	bl GF_CreateNewVramTransferTask
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
