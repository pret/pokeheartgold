	.include "asm/macros.inc"
	.include "global.inc"

	.bss

_021D2AF0:
	.space 0x4

	.text

	thumb_func_start Sav2_FriendGroup_sizeof
Sav2_FriendGroup_sizeof: ; 0x0202C730
	mov r0, #0x42
	lsl r0, r0, #2
	bx lr
	.balign 4, 0
	thumb_func_end Sav2_FriendGroup_sizeof

	thumb_func_start sub_0202C738
sub_0202C738: ; 0x0202C738
	push {r4, r5}
	add r5, r2, #0
	mov r3, #0x2c
	add r2, r1, #0
	mul r2, r3
	mul r5, r3
	add r4, r0, r2
	add r3, r0, r5
	mov r2, #5
_0202C74A:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0202C74A
	ldr r0, [r4]
	str r0, [r3]
	pop {r4, r5}
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202C738

	thumb_func_start Sav2_FriendGroup_init
Sav2_FriendGroup_init: ; 0x0202C75C
	push {r4, lr}
	add r4, r0, #0
	mov r2, #0x42
	mov r0, #0
	add r1, r4, #0
	lsl r2, r2, #2
	bl MIi_CpuClearFast
	ldr r0, _0202C784 ; =0x0000FFFF
	mov r1, #0
	add r2, r4, #0
_0202C772:
	strh r0, [r2]
	strh r0, [r2, #0x10]
	add r1, r1, #1
	add r2, #0x2c
	cmp r1, #6
	blt _0202C772
	ldr r0, _0202C788 ; =_021D2AF0
	str r4, [r0]
	pop {r4, pc}
	.balign 4, 0
_0202C784: .word 0x0000FFFF
_0202C788: .word _021D2AF0
	thumb_func_end Sav2_FriendGroup_init

	thumb_func_start sub_0202C78C
sub_0202C78C: ; 0x0202C78C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r7, #0
_0202C794:
	mov r4, #0
	cmp r6, #0
	bls _0202C7A8
_0202C79A:
	ldr r0, [r5, #0x28]
	bl PRandom
	add r4, r4, #1
	str r0, [r5, #0x28]
	cmp r4, r6
	blo _0202C79A
_0202C7A8:
	add r7, r7, #1
	add r5, #0x2c
	cmp r7, #6
	blo _0202C794
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0202C78C

	thumb_func_start sub_0202C7B4
sub_0202C7B4: ; 0x0202C7B4
	mov r2, #0x2c
	mul r2, r1
	add r0, r0, r2
	ldr r0, [r0, #0x24]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202C7B4

	thumb_func_start sub_0202C7C0
sub_0202C7C0: ; 0x0202C7C0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x2c
	add r4, r1, #0
	mul r4, r0
	add r0, r5, r4
	str r2, [r0, #0x24]
	add r0, r2, #0
	bl PRandom
	add r1, r5, r4
	str r0, [r1, #0x28]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0202C7C0

	thumb_func_start sub_0202C7DC
sub_0202C7DC: ; 0x0202C7DC
	ldr r0, [r0, #0x54]
	bx lr
	thumb_func_end sub_0202C7DC

	thumb_func_start sub_0202C7E0
sub_0202C7E0: ; 0x0202C7E0
	cmp r2, #0
	bne _0202C7EC
	mov r2, #0x2c
	mul r2, r1
	add r0, r0, r2
	bx lr
_0202C7EC:
	mov r2, #0x2c
	mul r2, r1
	add r0, r0, r2
	add r0, #0x10
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202C7E0

	thumb_func_start sub_0202C7F8
sub_0202C7F8: ; 0x0202C7F8
	push {r4, lr}
	add r4, r0, #0
	cmp r2, #0
	bne _0202C810
	mov r2, #0x2c
	mul r2, r1
	add r1, r4, r2
	add r0, r3, #0
	mov r2, #8
	bl CopyStringToU16Array
	pop {r4, pc}
_0202C810:
	mov r2, #0x2c
	mul r2, r1
	add r1, r4, r2
	add r0, r3, #0
	add r1, #0x10
	mov r2, #8
	bl CopyStringToU16Array
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0202C7F8

	thumb_func_start sub_0202C824
sub_0202C824: ; 0x0202C824
	mov r3, #0x2c
	mul r3, r1
	add r0, r0, r3
	add r0, #0x20
	strb r2, [r0]
	bx lr
	thumb_func_end sub_0202C824

	thumb_func_start sub_0202C830
sub_0202C830: ; 0x0202C830
	mov r2, #0x2c
	mul r2, r1
	add r0, r0, r2
	add r0, #0x20
	ldrb r0, [r0]
	bx lr
	thumb_func_end sub_0202C830

	thumb_func_start sub_0202C83C
sub_0202C83C: ; 0x0202C83C
	mov r2, #0x2c
	mul r2, r1
	add r0, r0, r2
	add r0, #0x21
	ldrb r0, [r0]
	bx lr
	thumb_func_end sub_0202C83C

	thumb_func_start sub_0202C848
sub_0202C848: ; 0x0202C848
	mov r3, #0x2c
	mul r3, r1
	add r0, r0, r3
	add r0, #0x21
	strb r2, [r0]
	bx lr
	thumb_func_end sub_0202C848

	thumb_func_start Save_FriendGroup_get
Save_FriendGroup_get: ; 0x0202C854
	ldr r3, _0202C85C ; =SavArray_get
	mov r1, #0xe
	bx r3
	nop
_0202C85C: .word SavArray_get
	thumb_func_end Save_FriendGroup_get

	thumb_func_start sub_0202C860
sub_0202C860: ; 0x0202C860
	push {r3, lr}
	mov r2, #0x2c
	mul r2, r1
	add r0, r0, r2
	bl sub_0202C8C4
	cmp r0, #0
	bne _0202C874
	mov r0, #1
	pop {r3, pc}
_0202C874:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0202C860

	thumb_func_start sub_0202C878
sub_0202C878: ; 0x0202C878
	mov r2, #0x2c
	add r3, r0, #0
	mul r2, r1
	add r1, r3, r2
	ldr r3, _0202C888 ; =sub_0202C8E4
	add r0, #0x2c
	bx r3
	nop
_0202C888: .word sub_0202C8E4
	thumb_func_end sub_0202C878

	thumb_func_start sub_0202C88C
sub_0202C88C: ; 0x0202C88C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	ldrh r1, [r6]
	add r5, r0, #0
	ldr r0, _0202C8C0 ; =0x0000FFFF
	cmp r1, r0
	bne _0202C89E
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0202C89E:
	mov r4, #0
	mov r7, #8
_0202C8A2:
	add r0, r6, #0
	add r1, r5, #0
	add r2, r7, #0
	bl StringNotEqualN
	cmp r0, #0
	bne _0202C8B4
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0202C8B4:
	add r4, r4, #1
	add r5, #0x2c
	cmp r4, #6
	blt _0202C8A2
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0202C8C0: .word 0x0000FFFF
	thumb_func_end sub_0202C88C

	thumb_func_start sub_0202C8C4
sub_0202C8C4: ; 0x0202C8C4
	ldrh r2, [r0]
	ldr r1, _0202C8E0 ; =0x0000FFFF
	cmp r2, r1
	bne _0202C8D0
	mov r0, #1
	bx lr
_0202C8D0:
	ldrh r0, [r0, #0x10]
	cmp r0, r1
	bne _0202C8DA
	mov r0, #1
	bx lr
_0202C8DA:
	mov r0, #0
	bx lr
	nop
_0202C8E0: .word 0x0000FFFF
	thumb_func_end sub_0202C8C4

	thumb_func_start sub_0202C8E4
sub_0202C8E4: ; 0x0202C8E4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r0, #0x10
	add r1, #0x10
	mov r2, #8
	bl StringNotEqualN
	cmp r0, #0
	beq _0202C8FC
	mov r0, #0
	pop {r3, r4, r5, pc}
_0202C8FC:
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #8
	bl StringNotEqualN
	cmp r0, #0
	beq _0202C90E
	mov r0, #0
	pop {r3, r4, r5, pc}
_0202C90E:
	add r0, r5, #0
	add r0, #0x20
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0x20
	ldrb r0, [r0]
	cmp r1, r0
	beq _0202C922
	mov r0, #0
	pop {r3, r4, r5, pc}
_0202C922:
	add r0, r5, #0
	add r0, #0x21
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0x21
	ldrb r0, [r0]
	cmp r1, r0
	beq _0202C936
	mov r0, #0
	pop {r3, r4, r5, pc}
_0202C936:
	ldr r1, [r5, #0x24]
	ldr r0, [r4, #0x24]
	cmp r1, r0
	bne _0202C942
	mov r0, #1
	pop {r3, r4, r5, pc}
_0202C942:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0202C8E4
