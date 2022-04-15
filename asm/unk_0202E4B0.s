	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020F684C:
	.byte 0x06
_020F684D:
	.byte 0x00
	.byte 0x04, 0x06
	.byte 0x03, 0x0A
	.balign 4, 0
_020F6854:
	.word 0x00000000
	.word 0x00000002
	.word 0x00000004
	.word 0x00000006
	.word 0x00000008
	.word 0x0000001E
	.word 0x0000002A
	.word 0x0000000A
	.word 0x0000000C
	.word 0x0000000B
	.word 0x0000005D
	.word 0x0000005B
	.word 0x0000005F

	.text

	thumb_func_start sub_0202E4B0
sub_0202E4B0: ; 0x0202E4B0
	lsl r1, r0, #1
	ldr r0, _0202E4B8 ; =_020F684C
	ldrb r0, [r0, r1]
	bx lr
	.balign 4, 0
_0202E4B8: .word _020F684C
	thumb_func_end sub_0202E4B0

	thumb_func_start sub_0202E4BC
sub_0202E4BC: ; 0x0202E4BC
	lsl r1, r0, #1
	ldr r0, _0202E4C4 ; =_020F684D
	ldrb r0, [r0, r1]
	bx lr
	.balign 4, 0
_0202E4C4: .word _020F684D
	thumb_func_end sub_0202E4BC

	thumb_func_start sub_0202E4C8
sub_0202E4C8: ; 0x0202E4C8
	push {r3, lr}
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	add r0, #8
	mov r1, #8
	bl StringFillEOS
	mov r0, #0x18
	bl SaveSubstruct_UpdateCRC
	pop {r3, pc}
	thumb_func_end sub_0202E4C8

	thumb_func_start sub_0202E4E0
sub_0202E4E0: ; 0x0202E4E0
	push {r3, lr}
	add r0, #8
	bl StringLength
	cmp r0, #0
	beq _0202E4F0
	mov r0, #1
	pop {r3, pc}
_0202E4F0:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0202E4E0

	thumb_func_start sub_0202E4F4
sub_0202E4F4: ; 0x0202E4F4
	mov r0, #0xea
	lsl r0, r0, #4
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202E4F4

	thumb_func_start sub_0202E4FC
sub_0202E4FC: ; 0x0202E4FC
	push {r3, r4, r5, r6, r7, lr}
	mov r2, #0xea
	mov r1, #0
	lsl r2, r2, #4
	add r6, r0, #0
	bl MI_CpuFill8
	mov r7, #0
_0202E50C:
	mov r4, #0
	add r5, r6, #0
_0202E510:
	add r0, r5, #0
	bl sub_0202E4C8
	add r4, r4, #1
	add r5, #0x18
	cmp r4, #6
	blt _0202E510
	add r7, r7, #1
	add r6, #0x90
	cmp r7, #0x1a
	blt _0202E50C
	mov r0, #0x18
	bl SaveSubstruct_UpdateCRC
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0202E4FC

	thumb_func_start sub_0202E530
sub_0202E530: ; 0x0202E530
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x18
	bl SaveSubstruct_AssertCRC
	add r0, r4, #0
	mov r1, #0x18
	bl SavArray_get
	pop {r4, pc}
	thumb_func_end sub_0202E530

	thumb_func_start sub_0202E544
sub_0202E544: ; 0x0202E544
	push {r4, r5, r6, lr}
	cmp r2, #6
	blo _0202E552
	blo _0202E58A
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
_0202E552:
	mov r3, #0x90
	mul r3, r1
	add r3, r0, r3
	cmp r2, #5
	bge _0202E57C
	mov r0, #0x18
	mul r0, r2
	add r6, r3, r0
_0202E562:
	add r5, r6, #0
	add r5, #0x18
	add r4, r6, #0
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	add r2, r2, #1
	add r6, #0x18
	stmia r4!, {r0, r1}
	cmp r2, #5
	blt _0202E562
_0202E57C:
	add r3, #0x78
	add r0, r3, #0
	bl sub_0202E4C8
	mov r0, #0x18
	bl SaveSubstruct_UpdateCRC
_0202E58A:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0202E544

	thumb_func_start sub_0202E58C
sub_0202E58C: ; 0x0202E58C
	mov r0, #0x4e
	lsl r0, r0, #2
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202E58C

	thumb_func_start sub_0202E594
sub_0202E594: ; 0x0202E594
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r6, r1, #0
	bl Sav2_GameStats_get
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0203107C
	str r0, [sp, #4]
	add r0, r6, #0
	mov r1, #0x34
	bl AllocFromHeapAtEnd
	ldr r7, _0202E668 ; =_020F6854
	str r0, [sp]
	mov r6, #0
	add r5, r0, #0
_0202E5BA:
	cmp r6, #5
	beq _0202E5C8
	cmp r6, #0xa
	beq _0202E5EC
	cmp r6, #0xb
	beq _0202E606
	b _0202E630
_0202E5C8:
	add r0, r4, #0
	mov r1, #0x10
	bl GameStats_GetCapped
	str r0, [sp, #8]
	cmp r0, #0
	beq _0202E5E6
	add r0, r4, #0
	mov r1, #0x1e
	bl GameStats_GetCapped
	ldr r1, [sp, #8]
	bl _u32_div_f
	str r0, [sp, #8]
_0202E5E6:
	ldr r0, [sp, #8]
	str r0, [r5]
	b _0202E650
_0202E5EC:
	add r0, r4, #0
	mov r1, #0x5d
	bl GameStats_GetCapped
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #0x5e
	bl GameStats_GetCapped
	ldr r1, [sp, #0xc]
	add r0, r1, r0
	str r0, [r5]
	b _0202E650
_0202E606:
	add r0, r4, #0
	mov r1, #0x5b
	bl GameStats_GetCapped
	str r0, [sp, #0x10]
	add r0, r4, #0
	mov r1, #0x5c
	bl GameStats_GetCapped
	ldr r1, [sp, #0x10]
	add r1, r1, r0
	beq _0202E62C
	ldr r0, [sp]
	ldr r2, [r0, #0x28]
	mov r0, #0x64
	mul r0, r2
	bl _u32_div_f
	add r1, r0, #0
_0202E62C:
	str r1, [r5]
	b _0202E650
_0202E630:
	cmp r6, #0
	blt _0202E646
	cmp r6, #4
	bgt _0202E646
	ldr r0, [sp, #4]
	ldr r1, [r7]
	mov r2, #0xff
	bl sub_020310BC
	str r0, [r5]
	b _0202E650
_0202E646:
	ldr r1, [r7]
	add r0, r4, #0
	bl GameStats_GetCapped
	str r0, [r5]
_0202E650:
	add r6, r6, #1
	add r5, r5, #4
	add r7, r7, #4
	cmp r6, #0xd
	blt _0202E5BA
	mov r0, #0x18
	bl SaveSubstruct_UpdateCRC
	ldr r0, [sp]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0202E668: .word _020F6854
	thumb_func_end sub_0202E594

	thumb_func_start sub_0202E66C
sub_0202E66C: ; 0x0202E66C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	bl Sav2_PlayerData_GetProfileAddr
	mov r1, #0x4e
	add r6, r0, #0
	add r0, r4, #0
	lsl r1, r1, #2
	bl AllocFromHeapAtEnd
	mov r2, #0x4e
	mov r1, #0
	lsl r2, r2, #2
	str r0, [sp, #4]
	bl MI_CpuFill8
	add r0, r5, #0
	bl Save_FriendGroup_get
	mov r1, #1
	bl sub_0202C7B4
	str r0, [sp, #8]
	add r0, r6, #0
	add r1, r4, #0
	bl PlayerProfile_GetPlayerName_NewString
	add r7, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202E594
	ldr r4, [sp, #4]
	str r0, [sp]
	mov r6, #0
	add r5, r0, #0
_0202E6B8:
	ldr r0, [sp, #8]
	add r1, r4, #0
	str r0, [r4]
	add r0, r7, #0
	add r1, #8
	mov r2, #8
	bl CopyStringToU16Array
	ldr r0, [r5]
	add r6, r6, #1
	str r0, [r4, #4]
	add r4, #0x18
	add r5, r5, #4
	cmp r6, #0xd
	blt _0202E6B8
	ldr r0, [sp]
	bl FreeToHeap
	add r0, r7, #0
	bl String_dtor
	mov r0, #0x18
	bl SaveSubstruct_UpdateCRC
	ldr r0, [sp, #4]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0202E66C

	thumb_func_start sub_0202E6F0
sub_0202E6F0: ; 0x0202E6F0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_0202E6F6:
	add r0, r5, #0
	bl sub_0202E4C8
	add r4, r4, #1
	add r5, #0x18
	cmp r4, #6
	blt _0202E6F6
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0202E6F0

	thumb_func_start sub_0202E708
sub_0202E708: ; 0x0202E708
	push {r3, lr}
	ldr r3, [r0]
	ldr r2, [r1]
	cmp r3, r2
	beq _0202E716
	mov r0, #0
	pop {r3, pc}
_0202E716:
	add r0, #8
	add r1, #8
	bl StringNotEqual
	cmp r0, #0
	bne _0202E726
	mov r0, #1
	pop {r3, pc}
_0202E726:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0202E708

	thumb_func_start sub_0202E72C
sub_0202E72C: ; 0x0202E72C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6, #4]
	add r7, r1, #0
	mov r4, #0
	cmp r0, #0
	ble _0202E756
	add r5, r6, #0
_0202E73C:
	ldr r0, [r5, #0xc]
	add r1, r7, #0
	bl sub_0202E708
	cmp r0, #0
	beq _0202E74C
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0202E74C:
	ldr r0, [r6, #4]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r0
	blt _0202E73C
_0202E756:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0202E72C

	thumb_func_start sub_0202E75C
sub_0202E75C: ; 0x0202E75C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r1, #0
	add r5, r0, #0
	str r2, [sp]
	add r0, r6, #0
	mov r1, #0
	mov r2, #0xe0
	add r4, r3, #0
	bl MI_CpuFill8
	add r0, sp, #0x10
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	bne _0202E7EC
	mov r2, #0x90
	add r0, r4, #0
	mul r0, r2
	add r1, r6, #0
	add r0, r5, r0
	add r1, #0x50
	str r0, [sp, #8]
	bl MI_CpuCopy8
	add r1, sp, #0x10
	ldrb r3, [r1, #0x18]
	mov r0, #0
	cmp r3, #0
	ble _0202E7B6
	mov r2, #0x18
	ldr r1, [sp, #0x24]
	mul r2, r4
_0202E79C:
	ldr r5, [r6, #4]
	add r0, r0, #1
	add r4, r5, #0
	add r4, r4, #1
	str r4, [r6, #4]
	ldr r4, [r1]
	lsl r5, r5, #2
	add r4, r4, r2
	add r5, r6, r5
	str r4, [r5, #0xc]
	add r1, r1, #4
	cmp r0, r3
	blt _0202E79C
_0202E7B6:
	add r4, r6, #0
	add r4, #0x50
	mov r7, #0
	add r5, r4, #0
_0202E7BE:
	add r0, r4, #0
	bl sub_0202E4E0
	cmp r0, #0
	beq _0202E7E0
	add r0, r6, #0
	add r1, r5, #0
	bl sub_0202E72C
	cmp r0, #0
	bne _0202E7E0
	ldr r1, [r6]
	add r0, r1, #1
	str r0, [r6]
	lsl r0, r1, #2
	add r0, r6, r0
	str r4, [r0, #0x38]
_0202E7E0:
	add r7, r7, #1
	add r4, #0x18
	add r5, #0x18
	cmp r7, #6
	blt _0202E7BE
	b _0202E880
_0202E7EC:
	add r0, r4, #0
	add r0, #0xd
	mov r2, #0x90
	add r1, r0, #0
	mul r1, r2
	add r0, r5, r1
	add r1, r6, #0
	add r1, #0x50
	str r0, [sp, #8]
	bl MI_CpuCopy8
	add r0, sp, #0x10
	ldrb r2, [r0, #0x18]
	mov r3, #0
	cmp r2, #0
	ble _0202E83A
	mov r1, #0x18
	ldr r0, [sp, #0x24]
	mul r1, r4
_0202E812:
	ldr r4, [r0]
	ldr r5, [r1, r4]
	cmp r5, #0
	beq _0202E832
	ldr r4, [sp]
	cmp r4, r5
	bne _0202E832
	ldr r5, [r6, #4]
	add r4, r5, #0
	add r4, r4, #1
	str r4, [r6, #4]
	ldr r4, [r0]
	lsl r5, r5, #2
	add r4, r4, r1
	add r5, r6, r5
	str r4, [r5, #0xc]
_0202E832:
	add r3, r3, #1
	add r0, r0, #4
	cmp r3, r2
	blt _0202E812
_0202E83A:
	add r4, r6, #0
	mov r0, #0
	add r4, #0x50
	str r0, [sp, #4]
	add r5, r6, #0
	add r7, r4, #0
_0202E846:
	add r0, r4, #0
	bl sub_0202E4E0
	cmp r0, #0
	beq _0202E870
	ldr r1, [r5, #0x50]
	ldr r0, [sp]
	cmp r0, r1
	bne _0202E870
	add r0, r6, #0
	add r1, r7, #0
	bl sub_0202E72C
	cmp r0, #0
	bne _0202E870
	ldr r1, [r6]
	add r0, r1, #1
	str r0, [r6]
	lsl r0, r1, #2
	add r0, r6, r0
	str r4, [r0, #0x38]
_0202E870:
	ldr r0, [sp, #4]
	add r4, #0x18
	add r0, r0, #1
	add r5, #0x18
	add r7, #0x18
	str r0, [sp, #4]
	cmp r0, #6
	blt _0202E846
_0202E880:
	ldr r1, [r6, #4]
	ldr r0, [r6]
	mov r2, #0
	add r0, r1, r0
	str r0, [r6, #8]
	ldr r0, [r6]
	cmp r0, #0
	ble _0202E8A8
	add r1, r6, #0
_0202E892:
	ldr r3, [r6, #4]
	ldr r0, [r1, #0x38]
	add r3, r2, r3
	lsl r3, r3, #2
	add r3, r6, r3
	str r0, [r3, #0xc]
	ldr r0, [r6]
	add r2, r2, #1
	add r1, r1, #4
	cmp r2, r0
	blt _0202E892
_0202E8A8:
	mov r0, #0
	mov ip, r0
	ldr r0, [r6, #8]
	sub r5, r0, #1
	cmp r5, #0
	ble _0202E8EC
	add r3, r6, #0
_0202E8B6:
	mov r0, ip
	cmp r5, r0
	ble _0202E8DA
	lsl r0, r5, #2
	add r4, r6, r0
_0202E8C0:
	ldr r2, [r4, #0xc]
	ldr r7, [r3, #0xc]
	ldr r0, [r2, #4]
	ldr r1, [r7, #4]
	cmp r1, r0
	bhs _0202E8D0
	str r2, [r3, #0xc]
	str r7, [r4, #0xc]
_0202E8D0:
	sub r5, r5, #1
	mov r0, ip
	sub r4, r4, #4
	cmp r5, r0
	bgt _0202E8C0
_0202E8DA:
	mov r0, ip
	add r0, r0, #1
	mov ip, r0
	ldr r0, [r6, #8]
	add r3, r3, #4
	sub r5, r0, #1
	mov r0, ip
	cmp r0, r5
	blt _0202E8B6
_0202E8EC:
	ldr r0, [sp, #8]
	bl sub_0202E6F0
	mov r3, #0
	add r2, r6, #0
	b _0202E912
_0202E8F8:
	ldr r5, [r2, #0xc]
	ldr r4, [sp, #8]
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldr r0, [sp, #8]
	add r2, r2, #4
	add r0, #0x18
	str r0, [sp, #8]
	add r3, r3, #1
_0202E912:
	cmp r3, #6
	bge _0202E91C
	ldr r0, [r6, #8]
	cmp r3, r0
	blt _0202E8F8
_0202E91C:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_0202E75C

	thumb_func_start sub_0202E920
sub_0202E920: ; 0x0202E920
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r0, #0
	add r5, r1, #0
	ldr r0, [sp, #0x2c]
	mov r1, #0xe0
	str r2, [sp, #0x10]
	add r4, r3, #0
	bl AllocFromHeapAtEnd
	add r6, r0, #0
	mov r0, #0
	str r0, [sp]
	str r4, [sp, #4]
	add r0, sp, #0x18
	ldrb r0, [r0, #0x10]
	add r1, r6, #0
	add r2, r5, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0xc]
	ldr r3, [sp, #0x10]
	add r0, r7, #0
	bl sub_0202E75C
	cmp r5, #0
	beq _0202E972
	mov r0, #1
	str r0, [sp]
	str r4, [sp, #4]
	add r0, sp, #0x18
	ldrb r0, [r0, #0x10]
	add r1, r6, #0
	add r2, r5, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0xc]
	ldr r3, [sp, #0x10]
	add r0, r7, #0
	bl sub_0202E75C
_0202E972:
	add r0, r6, #0
	bl FreeToHeap
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_0202E920

	thumb_func_start sub_0202E97C
sub_0202E97C: ; 0x0202E97C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r6, r1, #0
	ldr r1, [sp, #0x38]
	add r4, r0, #0
	add r5, r2, #0
	add r7, r3, #0
	str r1, [sp, #0x38]
	bl sub_0202E530
	str r0, [sp, #8]
	add r0, r4, #0
	bl Save_FriendGroup_get
	mov r1, #1
	bl sub_0202C7B4
	mov r4, #0
	add r3, r4, #0
	str r0, [sp, #0xc]
	cmp r5, #0
	bls _0202E9CC
_0202E9A8:
	cmp r3, r6
	beq _0202E9C2
	lsl r0, r3, #2
	ldr r2, [r7, r0]
	cmp r2, #0
	beq _0202E9C2
	add r1, r4, #1
	add r0, r4, #0
	lsl r1, r1, #0x18
	lsr r4, r1, #0x18
	lsl r1, r0, #2
	add r0, sp, #0x10
	str r2, [r0, r1]
_0202E9C2:
	add r0, r3, #1
	lsl r0, r0, #0x18
	lsr r3, r0, #0x18
	cmp r3, r5
	blo _0202E9A8
_0202E9CC:
	cmp r4, #0
	beq _0202E9F6
	mov r5, #0
	add r6, sp, #0x10
_0202E9D4:
	ldr r0, [sp, #0x38]
	str r4, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	add r2, r5, #0
	add r3, r6, #0
	bl sub_0202E920
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #0xd
	blo _0202E9D4
	mov r0, #0x18
	bl SaveSubstruct_UpdateCRC
_0202E9F6:
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0202E97C

	thumb_func_start sub_0202E9FC
sub_0202E9FC: ; 0x0202E9FC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r2, [sp]
	add r4, r0, #0
	add r5, r1, #0
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [sp, #4]
	ldr r0, [sp]
	mov r1, #0x4c
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x4c
	add r7, r0, #0
	bl MI_CpuFill8
	add r0, r4, #0
	bl Save_FriendGroup_get
	mov r1, #1
	bl sub_0202C7B4
	str r0, [sp, #0xc]
	ldr r1, [sp]
	add r0, r4, #0
	bl sub_0202E594
	str r0, [sp, #8]
	add r0, r5, #0
	bl sub_0202E4B0
	str r0, [r7]
	add r0, r5, #0
	bl sub_0202E4BC
	ldr r1, [r7]
	mov r6, #0
	cmp r1, #0
	ble _0202EA72
	lsl r1, r0, #2
	ldr r0, [sp, #8]
	add r4, r7, #0
	add r5, r0, r1
_0202EA54:
	ldr r0, [sp, #0xc]
	ldr r1, [sp]
	str r0, [r4, #4]
	ldr r0, [r5]
	str r0, [r4, #8]
	ldr r0, [sp, #4]
	bl PlayerProfile_GetPlayerName_NewString
	str r0, [r4, #0xc]
	ldr r0, [r7]
	add r6, r6, #1
	add r4, #0xc
	add r5, r5, #4
	cmp r6, r0
	blt _0202EA54
_0202EA72:
	ldr r0, [sp, #8]
	bl FreeToHeap
	add r0, r7, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0202E9FC

	thumb_func_start sub_0202EA80
sub_0202EA80: ; 0x0202EA80
	push {r3, r4, r5, r6, r7, lr}
	add r7, r2, #0
	add r5, r0, #0
	str r1, [sp]
	add r0, r7, #0
	mov r1, #0x4c
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x4c
	add r4, r0, #0
	bl MI_CpuFill8
	ldr r0, [sp]
	mov r1, #0x90
	mul r1, r0
	mov r6, #0
	add r5, r5, r1
_0202EAA4:
	add r0, r5, #0
	bl sub_0202E4E0
	cmp r0, #0
	beq _0202EAF0
	ldr r2, [r4]
	mov r1, #0xc
	mul r1, r2
	ldr r0, [r5]
	add r1, r4, r1
	str r0, [r1, #4]
	ldr r2, [r4]
	mov r1, #0xc
	mul r1, r2
	ldr r0, [r5, #4]
	add r1, r4, r1
	str r0, [r1, #8]
	mov r0, #8
	add r1, r7, #0
	bl String_ctor
	ldr r2, [r4]
	mov r1, #0xc
	mul r1, r2
	add r1, r4, r1
	str r0, [r1, #0xc]
	ldr r1, [r4]
	mov r0, #0xc
	mul r0, r1
	add r0, r4, r0
	add r1, r5, #0
	ldr r0, [r0, #0xc]
	add r1, #8
	bl CopyU16ArrayToString
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_0202EAF0:
	add r6, r6, #1
	add r5, #0x18
	cmp r6, #6
	blt _0202EAA4
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0202EA80

	thumb_func_start sub_0202EAFC
sub_0202EAFC: ; 0x0202EAFC
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r4, #0
	add r5, r6, #0
_0202EB04:
	ldr r0, [r5, #0xc]
	cmp r0, #0
	beq _0202EB0E
	bl String_dtor
_0202EB0E:
	add r4, r4, #1
	add r5, #0xc
	cmp r4, #6
	blt _0202EB04
	add r0, r6, #0
	mov r1, #0
	mov r2, #0x4c
	bl MI_CpuFill8
	add r0, r6, #0
	bl FreeToHeap
	mov r0, #0x18
	bl SaveSubstruct_UpdateCRC
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0202EAFC
