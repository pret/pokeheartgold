	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_0202CBC0
sub_0202CBC0: ; 0x0202CBC0
	mov r0, #0x17
	lsl r0, r0, #4
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202CBC0

	thumb_func_start sub_0202CBC8
sub_0202CBC8: ; 0x0202CBC8
	push {r4, lr}
	add r4, r0, #0
	bl sub_0202CBC0
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0
	bl MI_CpuFill8
	pop {r4, pc}
	thumb_func_end sub_0202CBC8

	thumb_func_start sub_0202CBDC
sub_0202CBDC: ; 0x0202CBDC
	ldr r3, _0202CBE4 ; =MIi_CpuCopy8
	mov r2, #0x18
	bx r3
	nop
_0202CBE4: .word MIi_CpuCopy8
	thumb_func_end sub_0202CBDC

	thumb_func_start Sav2_SealCase_get
Sav2_SealCase_get: ; 0x0202CBE8
	ldr r3, _0202CBF0 ; =SavArray_get
	mov r1, #0x11
	bx r3
	nop
_0202CBF0: .word SavArray_get
	thumb_func_end Sav2_SealCase_get

	thumb_func_start sub_0202CBF4
sub_0202CBF4: ; 0x0202CBF4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0xc
	blt _0202CC02
	bl GF_AssertFail
_0202CC02:
	mov r0, #0x18
	mul r0, r4
	add r0, r5, r0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0202CBF4

	thumb_func_start sub_0202CC0C
sub_0202CC0C: ; 0x0202CC0C
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r5, r0, #0
	add r4, r1, #0
	cmp r6, #0xc
	blt _0202CC1C
	bl GF_AssertFail
_0202CC1C:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0202CBF4
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0202CBDC
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0202CC0C

	thumb_func_start sub_0202CC30
sub_0202CC30: ; 0x0202CC30
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #8
	blt _0202CC3E
	bl GF_AssertFail
_0202CC3E:
	lsl r0, r4, #1
	add r0, r4, r0
	add r0, r5, r0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0202CC30

	thumb_func_start sub_0202CC48
sub_0202CC48: ; 0x0202CC48
	ldrb r0, [r0]
	bx lr
	thumb_func_end sub_0202CC48

	thumb_func_start sub_0202CC4C
sub_0202CC4C: ; 0x0202CC4C
	ldrb r0, [r0, #1]
	bx lr
	thumb_func_end sub_0202CC4C

	thumb_func_start sub_0202CC50
sub_0202CC50: ; 0x0202CC50
	ldrb r0, [r0, #2]
	bx lr
	thumb_func_end sub_0202CC50
