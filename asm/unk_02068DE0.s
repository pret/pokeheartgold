	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020FE82C:
	.byte 0x02, 0x00, 0x00, 0x00
	.byte 0x01, 0x05, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x02, 0x06, 0xFF, 0x03, 0x00, 0x00, 0x00
	.byte 0x01, 0x03, 0x07, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x02, 0x04, 0x08, 0xFF, 0x02, 0x00, 0x00, 0x00
	.byte 0x03, 0x09, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x06, 0x0A, 0xFF, 0x04, 0x00, 0x00, 0x00
	.byte 0x01, 0x05, 0x07, 0x0B, 0x04, 0x00, 0x00, 0x00, 0x02, 0x06, 0x08, 0x0C, 0x04, 0x00, 0x00, 0x00
	.byte 0x03, 0x07, 0x09, 0x0D, 0x03, 0x00, 0x00, 0x00, 0x04, 0x08, 0x0E, 0xFF, 0x02, 0x00, 0x00, 0x00
	.byte 0x05, 0x0B, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x06, 0x0A, 0x0C, 0xFF, 0x03, 0x00, 0x00, 0x00
	.byte 0x07, 0x0B, 0x0D, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x08, 0x0C, 0x0E, 0xFF, 0x02, 0x00, 0x00, 0x00
	.byte 0x09, 0x0D, 0xFF, 0xFF

	.text

	thumb_func_start sub_02068DE0
sub_02068DE0: ; 0x02068DE0
	push {r4, lr}
	bl ScriptEnvironment_GetSav2Ptr
	bl sub_0202A998
	add r4, r0, #0
	mov r1, #1
	bl sub_0202AE98
	add r0, r4, #0
	mov r1, #1
	bl sub_0202AEA8
	mov r2, #0
	add r1, r2, #0
_02068DFE:
	strb r1, [r0, r2]
	add r2, r2, #1
	cmp r2, #4
	blt _02068DFE
	pop {r4, pc}
	thumb_func_end sub_02068DE0

	thumb_func_start sub_02068E08
sub_02068E08: ; 0x02068E08
	push {r4, lr}
	bl ScriptEnvironment_GetSav2Ptr
	bl sub_0202A998
	add r4, r0, #0
	mov r1, #2
	bl sub_0202AE98
	add r0, r4, #0
	mov r1, #2
	bl sub_0202AEA8
	pop {r4, pc}
	thumb_func_end sub_02068E08

	thumb_func_start sub_02068E24
sub_02068E24: ; 0x02068E24
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptEnvironment_GetSav2Ptr
	bl sub_0202A998
	add r4, r0, #0
	mov r1, #3
	bl sub_0202AE98
	add r0, r4, #0
	mov r1, #3
	bl sub_0202AEA8
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	mov r1, #0xa
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	beq _02068E60
	mov r0, #0
	strb r0, [r4]
	strb r0, [r4, #1]
	mov r0, #1
	strb r0, [r4, #2]
	strb r0, [r4, #3]
	pop {r3, r4, r5, pc}
_02068E60:
	add r0, r5, #0
	bl sub_02068E70
	mov r0, #0
	strb r0, [r4, #2]
	strb r0, [r4, #3]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02068E24

	thumb_func_start sub_02068E70
sub_02068E70: ; 0x02068E70
	push {r3, r4, r5, r6, r7, lr}
	bl ScriptEnvironment_GetSav2Ptr
	bl sub_0202A998
	mov r1, #3
	bl sub_0202AEA8
	add r5, r0, #0
	bl LCRandom
	mov r1, #0xf
	bl _s32_div_f
	strb r1, [r5]
	ldrb r0, [r5]
	ldr r7, _02068EAC ; =0x020FE82C
	lsl r4, r0, #3
	add r6, r7, r4
	bl LCRandom
	ldr r1, [r7, r4]
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	add r0, r6, r0
	ldrb r0, [r0, #4]
	strb r0, [r5, #1]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02068EAC: .word 0x020FE82C
	thumb_func_end sub_02068E70

	thumb_func_start sub_02068EB0
sub_02068EB0: ; 0x02068EB0
	push {r4, lr}
	bl ScriptEnvironment_GetSav2Ptr
	bl sub_0202A998
	add r4, r0, #0
	mov r1, #4
	bl sub_0202AE98
	add r0, r4, #0
	mov r1, #4
	bl sub_0202AEA8
	mov r1, #0
	str r1, [r0]
	pop {r4, pc}
	thumb_func_end sub_02068EB0

	thumb_func_start sub_02068ED0
sub_02068ED0: ; 0x02068ED0
	push {r4, lr}
	bl ScriptEnvironment_GetSav2Ptr
	bl sub_0202A998
	add r4, r0, #0
	mov r1, #5
	bl sub_0202AE98
	add r0, r4, #0
	mov r1, #5
	bl sub_0202AEA8
	mov r2, #0
	strb r2, [r0]
	mov r1, #1
	strb r1, [r0, #1]
	mov r1, #2
	strb r1, [r0, #2]
	mov r1, #7
	strb r1, [r0, #3]
	str r2, [r0, #4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02068ED0

	thumb_func_start sub_02068F00
sub_02068F00: ; 0x02068F00
	push {r4, lr}
	bl ScriptEnvironment_GetSav2Ptr
	bl sub_0202A998
	add r4, r0, #0
	mov r1, #6
	bl sub_0202AE98
	add r0, r4, #0
	mov r1, #6
	bl sub_0202AEA8
	mov r1, #0xd
	strh r1, [r0]
	mov r1, #0x4b
	strh r1, [r0, #6]
	mov r2, #0
	strb r2, [r0, #0xc]
	mov r1, #9
	strh r1, [r0, #2]
	mov r1, #0x3a
	strh r1, [r0, #8]
	mov r1, #1
	strb r1, [r0, #0xd]
	mov r1, #0xe
	strh r1, [r0, #4]
	mov r1, #0x20
	strh r1, [r0, #0xa]
	strb r2, [r0, #0xe]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02068F00

	thumb_func_start sub_02068F40
sub_02068F40: ; 0x02068F40
	push {r3, lr}
	bl ScriptEnvironment_GetSav2Ptr
	bl sub_0202A998
	mov r1, #7
	bl sub_0202AE98
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02068F40

	thumb_func_start sub_02068F54
sub_02068F54: ; 0x02068F54
	push {r3, lr}
	bl ScriptEnvironment_GetSav2Ptr
	bl sub_0202A998
	mov r1, #8
	bl sub_0202AE98
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02068F54

	thumb_func_start sub_02068F68
sub_02068F68: ; 0x02068F68
	push {r4, lr}
	add r4, r1, #0
	bl ScriptEnvironment_GetSav2Ptr
	bl sub_0202A998
	bl sub_0202AEBC
	cmp r4, r0
	bne _02068F80
	mov r0, #1
	pop {r4, pc}
_02068F80:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02068F68
