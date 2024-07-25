	.include "asm/macros.inc"
	.include "unk_0202E4B0.inc"
	.include "global.inc"

	.rodata

	.balign 4, 0
	.text

	.extern sub_0202E4C8
	.extern sub_0202E4E0
	.extern sub_0202E594
	.extern sub_0202E6F0
	.extern sub_0202E708
	.extern sub_0202E72C
	.extern sub_0202E75C
	.extern sub_0202E920

	thumb_func_start sub_0202E9FC
sub_0202E9FC: ; 0x0202E9FC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r2, [sp]
	add r4, r0, #0
	add r5, r1, #0
	bl Save_PlayerData_GetProfileAddr
	str r0, [sp, #4]
	ldr r0, [sp]
	mov r1, #0x4c
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x4c
	add r7, r0, #0
	bl MI_CpuFill8
	add r0, r4, #0
	bl Save_FriendGroup_Get
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
	bl String_New
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
	bl String_Delete
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
