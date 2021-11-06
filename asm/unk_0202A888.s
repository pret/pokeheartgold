	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020F677C:
	.byte 0x00
_020F677D:
	.byte 0x04, 0x04, 0x02
	.byte 0x06, 0x02, 0x00, 0x00

	.text

	thumb_func_start sub_0202A888
sub_0202A888: ; 0x0202A888
	push {r4, lr}
	mov r1, #0
	mov r2, #0x30
	add r4, r0, #0
	bl MI_CpuFill8
	mov r1, #0
	add r0, r1, #0
_0202A898:
	strb r0, [r4, #1]
	strb r0, [r4]
	add r1, r1, #1
	add r4, #0xc
	cmp r1, #4
	blt _0202A898
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0202A888

	thumb_func_start sub_0202A8A8
sub_0202A8A8: ; 0x0202A8A8
	ldr r3, _0202A8B0 ; =GF_RTC_CopyDateTime
	add r1, r0, #0
	add r1, #0x10
	bx r3
	.balign 4, 0
_0202A8B0: .word GF_RTC_CopyDateTime
	thumb_func_end sub_0202A8A8

	thumb_func_start sub_0202A8B4
sub_0202A8B4: ; 0x0202A8B4
	mov r0, #0x2e
	lsl r0, r0, #4
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202A8B4

	thumb_func_start sub_0202A8BC
sub_0202A8BC: ; 0x0202A8BC
	push {r4, lr}
	add r4, r0, #0
	mov r2, #0x2e
	mov r0, #0
	add r1, r4, #0
	lsl r2, r2, #4
	bl MIi_CpuClearFast
	add r0, r4, #0
	bl sub_0202ADEC
	mov r0, #2
	lsl r0, r0, #8
	add r0, r4, r0
	bl sub_0202A888
	mov r0, #0x23
	lsl r0, r0, #4
	add r0, r4, r0
	bl sub_0202A8A8
	mov r0, #0x93
	lsl r0, r0, #2
	add r0, r4, r0
	bl sub_0202AE8C
	mov r1, #0x27
	lsl r1, r1, #4
	ldr r0, _0202A948 ; =0x0000FFFF
	add r1, r4, r1
	mov r2, #8
	bl MIi_CpuClear16
	mov r0, #0xa
	lsl r0, r0, #6
	add r0, r4, r0
	mov r1, #0xff
	mov r2, #8
	bl MI_CpuFill8
	mov r0, #0x2a
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #4
	bl MailMsg_init_withBank
	ldr r0, _0202A94C ; =0x000002A2
	mov r1, #0
	strh r1, [r4, r0]
	ldr r0, _0202A950 ; =0x0000011F
	mov r1, #0x63
	bl GetECWordIndexByPair
	mov r1, #0xa9
	lsl r1, r1, #2
	strh r0, [r4, r1]
	ldr r2, _0202A948 ; =0x0000FFFF
	add r0, r1, #2
	strh r2, [r4, r0]
	mov r3, #0
	add r0, r1, #4
	sub r2, r3, #1
	add r1, #0x18
_0202A93A:
	str r2, [r4, r0]
	str r2, [r4, r1]
	add r3, r3, #1
	add r4, r4, #4
	cmp r3, #5
	blt _0202A93A
	pop {r4, pc}
	.balign 4, 0
_0202A948: .word 0x0000FFFF
_0202A94C: .word 0x000002A2
_0202A950: .word 0x0000011F
	thumb_func_end sub_0202A8BC

	thumb_func_start Sav2_Misc_get
Sav2_Misc_get: ; 0x0202A954
	ldr r3, _0202A95C ; =SavArray_get
	mov r1, #9
	bx r3
	nop
_0202A95C: .word SavArray_get
	thumb_func_end Sav2_Misc_get

	thumb_func_start Sav2_Misc_const_get
Sav2_Misc_const_get: ; 0x0202A960
	ldr r3, _0202A968 ; =SavArray_const_get
	mov r1, #9
	bx r3
	nop
_0202A968: .word SavArray_const_get
	thumb_func_end Sav2_Misc_const_get

	thumb_func_start sub_0202A96C
sub_0202A96C: ; 0x0202A96C
	ldr r3, _0202A974 ; =SavArray_get
	mov r1, #9
	bx r3
	nop
_0202A974: .word SavArray_get
	thumb_func_end sub_0202A96C

	thumb_func_start sub_0202A978
sub_0202A978: ; 0x0202A978
	push {r3, lr}
	mov r1, #9
	bl SavArray_get
	mov r1, #2
	lsl r1, r1, #8
	add r0, r0, r1
	pop {r3, pc}
	thumb_func_end sub_0202A978

	thumb_func_start sub_0202A988
sub_0202A988: ; 0x0202A988
	push {r3, lr}
	mov r1, #9
	bl SavArray_get
	mov r1, #0x23
	lsl r1, r1, #4
	add r0, r0, r1
	pop {r3, pc}
	thumb_func_end sub_0202A988

	thumb_func_start sub_0202A998
sub_0202A998: ; 0x0202A998
	push {r3, lr}
	mov r1, #9
	bl SavArray_get
	mov r1, #0x93
	lsl r1, r1, #2
	add r0, r0, r1
	pop {r3, pc}
	thumb_func_end sub_0202A998

	thumb_func_start Sav2_Misc_RivalName_get
Sav2_Misc_RivalName_get: ; 0x0202A9A8
	mov r1, #0x27
	lsl r1, r1, #4
	add r0, r0, r1
	bx lr
	thumb_func_end Sav2_Misc_RivalName_get

	thumb_func_start Sav2_Misc_RivalName_set
Sav2_Misc_RivalName_set: ; 0x0202A9B0
	add r2, r0, #0
	add r0, r1, #0
	mov r1, #0x27
	lsl r1, r1, #4
	add r1, r2, r1
	ldr r3, _0202A9C0 ; =CopyStringToU16Array
	mov r2, #8
	bx r3
	.balign 4, 0
_0202A9C0: .word CopyStringToU16Array
	thumb_func_end Sav2_Misc_RivalName_set

	thumb_func_start sub_0202A9C4
sub_0202A9C4: ; 0x0202A9C4
	ldr r2, _0202A9D4 ; =0x0000029B
	mov r1, #1
	ldrb r3, [r0, r2]
	bic r3, r1
	mov r1, #1
	orr r1, r3
	strb r1, [r0, r2]
	bx lr
	.balign 4, 0
_0202A9D4: .word 0x0000029B
	thumb_func_end sub_0202A9C4

	thumb_func_start sub_0202A9D8
sub_0202A9D8: ; 0x0202A9D8
	ldr r1, _0202A9E4 ; =0x0000029B
	ldrb r0, [r0, r1]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bx lr
	nop
_0202A9E4: .word 0x0000029B
	thumb_func_end sub_0202A9D8

	thumb_func_start sub_0202A9E8
sub_0202A9E8: ; 0x0202A9E8
	push {r4, r5}
	mov r4, #0xa6
	lsl r4, r4, #2
	strh r1, [r0, r4]
	add r1, r4, #2
	ldrb r1, [r0, r1]
	mov r5, #0x7f
	lsl r2, r2, #0x18
	bic r1, r5
	lsr r5, r2, #0x18
	mov r2, #0x7f
	and r2, r5
	orr r2, r1
	add r1, r4, #2
	strb r2, [r0, r1]
	ldrb r1, [r0, r1]
	mov r2, #0x80
	bic r1, r2
	lsl r2, r3, #0x18
	lsr r2, r2, #0x18
	lsl r2, r2, #0x1f
	lsr r2, r2, #0x18
	orr r2, r1
	add r1, r4, #2
	strb r2, [r0, r1]
	pop {r4, r5}
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202A9E8

	thumb_func_start sub_0202AA20
sub_0202AA20: ; 0x0202AA20
	push {r4, r5}
	mov r4, #0xa6
	lsl r4, r4, #2
	ldrh r5, [r0, r4]
	str r5, [r1]
	add r1, r4, #2
	ldrb r1, [r0, r1]
	lsl r1, r1, #0x19
	lsr r1, r1, #0x19
	str r1, [r2]
	add r1, r4, #2
	ldrb r0, [r0, r1]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	str r0, [r3]
	pop {r4, r5}
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202AA20

	thumb_func_start sub_0202AA44
sub_0202AA44: ; 0x0202AA44
	push {r4, r5, r6, r7}
	add r4, r2, #0
	cmp r1, #2
	bls _0202AA52
	mov r0, #0
	pop {r4, r5, r6, r7}
	bx lr
_0202AA52:
	ldr r3, _0202AA94 ; =_020F677D
	lsl r1, r1, #1
	ldrb r3, [r3, r1]
	mov r2, #0
	cmp r3, #0
	ble _0202AA8E
	ldr r5, _0202AA98 ; =_020F677C
	ldrb r3, [r5, r1]
	add r5, r5, r1
	ldrb r1, [r5]
	add r3, r0, r3
	ldrb r6, [r5, #1]
	add r0, r0, r1
	mov r1, #0xa
	lsl r1, r1, #6
	add r5, r1, #0
_0202AA72:
	ldrb r7, [r3, r5]
	cmp r7, #0xff
	beq _0202AA8E
	add r7, r2, r0
	ldrb r7, [r7, r1]
	cmp r4, r7
	bne _0202AA86
	mov r0, #1
	pop {r4, r5, r6, r7}
	bx lr
_0202AA86:
	add r2, r2, #1
	add r3, r3, #1
	cmp r2, r6
	blt _0202AA72
_0202AA8E:
	mov r0, #0
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
_0202AA94: .word _020F677D
_0202AA98: .word _020F677C
	thumb_func_end sub_0202AA44

	thumb_func_start sub_0202AA9C
sub_0202AA9C: ; 0x0202AA9C
	push {r4, r5}
	cmp r1, #2
	bhi _0202AAC8
	lsl r4, r1, #1
	ldr r1, _0202AACC ; =_020F677D
	mov r2, #0
	ldrb r1, [r1, r4]
	cmp r1, #0
	ble _0202AAC8
	ldr r3, _0202AAD0 ; =_020F677C
	ldrb r1, [r3, r4]
	add r4, r3, r4
	mov r3, #0xff
	add r5, r0, r1
	mov r0, #0xa
	lsl r0, r0, #6
_0202AABC:
	strb r3, [r5, r0]
	ldrb r1, [r4, #1]
	add r2, r2, #1
	add r5, r5, #1
	cmp r2, r1
	blt _0202AABC
_0202AAC8:
	pop {r4, r5}
	bx lr
	.balign 4, 0
_0202AACC: .word _020F677D
_0202AAD0: .word _020F677C
	thumb_func_end sub_0202AA9C

	thumb_func_start sub_0202AAD4
sub_0202AAD4: ; 0x0202AAD4
	push {r4, r5}
	mov r2, #0
	cmp r1, #2
	bls _0202AAE2
	add r0, r2, #0
	pop {r4, r5}
	bx lr
_0202AAE2:
	lsl r4, r1, #1
	ldr r1, _0202AB10 ; =_020F677C
	ldr r3, _0202AB14 ; =_020F677D
	ldrb r1, [r1, r4]
	ldrb r3, [r3, r4]
	add r3, r1, r3
	sub r5, r3, #1
	cmp r1, r5
	bgt _0202AB08
	mov r3, #0xa
	lsl r3, r3, #6
_0202AAF8:
	add r4, r0, r1
	ldrb r4, [r4, r3]
	cmp r4, #0xff
	beq _0202AB02
	add r2, r2, #1
_0202AB02:
	add r1, r1, #1
	cmp r1, r5
	ble _0202AAF8
_0202AB08:
	lsl r0, r2, #0x18
	lsr r0, r0, #0x18
	pop {r4, r5}
	bx lr
	.balign 4, 0
_0202AB10: .word _020F677C
_0202AB14: .word _020F677D
	thumb_func_end sub_0202AAD4

	thumb_func_start sub_0202AB18
sub_0202AB18: ; 0x0202AB18
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r1, [sp]
	str r3, [sp, #4]
	add r4, r0, #0
	ldr r0, [sp]
	mov ip, r2
	cmp r0, #2
	bhi _0202ABA2
	lsl r7, r0, #1
	ldr r0, _0202ABA8 ; =_020F677D
	ldrb r6, [r0, r7]
	ldr r0, _0202ABAC ; =_020F677C
	ldrb r0, [r0, r7]
	str r0, [sp, #8]
	add r0, r0, r6
	ldr r3, [sp, #8]
	sub r5, r0, #1
	add r0, r3, #0
	cmp r0, r5
	bgt _0202AB60
	mov r0, #0xa
	lsl r0, r0, #6
_0202AB46:
	add r2, r4, r3
	ldrb r1, [r2, r0]
	cmp r1, #0xff
	bne _0202AB5A
	mov r1, #0xa
	ldr r0, [sp, #4]
	lsl r1, r1, #6
	strb r0, [r2, r1]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0202AB5A:
	add r3, r3, #1
	cmp r3, r5
	ble _0202AB46
_0202AB60:
	add r1, r6, #1
	mov r0, ip
	cmp r0, r1
	bne _0202AB80
	ldr r1, [sp]
	add r0, r4, #0
	bl sub_0202AA9C
	ldr r0, [sp, #8]
	mov r1, #0xa
	add r2, r4, r0
	ldr r0, [sp, #4]
	lsl r1, r1, #6
	strb r0, [r2, r1]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0202AB80:
	mov r0, #0xa
	ldr r2, _0202ABAC ; =_020F677C
	lsl r0, r0, #6
	add r1, r4, r0
	ldr r0, [sp, #8]
	ldrb r2, [r2, r7]
	add r0, r0, #1
	add r0, r1, r0
	add r1, r1, r2
	sub r2, r6, #1
	bl MI_CpuCopy8
	mov r1, #0xa
	ldr r0, [sp, #4]
	add r2, r4, r5
	lsl r1, r1, #6
	strb r0, [r2, r1]
_0202ABA2:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0202ABA8: .word _020F677D
_0202ABAC: .word _020F677C
	thumb_func_end sub_0202AB18

	thumb_func_start sub_0202ABB0
sub_0202ABB0: ; 0x0202ABB0
	mov r3, #0xb6
	lsl r3, r3, #2
	str r1, [r0, r3]
	add r1, r3, #4
	strb r2, [r0, r1]
	bx lr
	thumb_func_end sub_0202ABB0

	thumb_func_start sub_0202ABBC
sub_0202ABBC: ; 0x0202ABBC
	push {r3, r4}
	mov r3, #0xb6
	lsl r3, r3, #2
	ldr r4, [r0, r3]
	str r4, [r1]
	add r1, r3, #4
	ldrb r0, [r0, r1]
	strb r0, [r2]
	pop {r3, r4}
	bx lr
	thumb_func_end sub_0202ABBC

	thumb_func_start sub_0202ABD0
sub_0202ABD0: ; 0x0202ABD0
	mov r2, #0x2a
	lsl r2, r2, #4
	ldrh r3, [r0, r2]
	strh r3, [r1]
	add r3, r2, #2
	ldrh r3, [r0, r3]
	strh r3, [r1, #2]
	add r3, r2, #4
	ldrh r3, [r0, r3]
	add r2, r2, #6
	strh r3, [r1, #4]
	ldrh r0, [r0, r2]
	strh r0, [r1, #6]
	bx lr
	thumb_func_end sub_0202ABD0

	thumb_func_start sub_0202ABEC
sub_0202ABEC: ; 0x0202ABEC
	push {r3, r4}
	ldrh r3, [r1]
	mov r2, #0x2a
	lsl r2, r2, #4
	strh r3, [r0, r2]
	ldrh r4, [r1, #2]
	add r3, r2, #2
	strh r4, [r0, r3]
	ldrh r4, [r1, #4]
	add r3, r2, #4
	strh r4, [r0, r3]
	ldrh r3, [r1, #6]
	add r1, r2, #6
	strh r3, [r0, r1]
	pop {r3, r4}
	bx lr
	thumb_func_end sub_0202ABEC

	thumb_func_start sub_0202AC0C
sub_0202AC0C: ; 0x0202AC0C
	ldr r2, _0202AC18 ; =0x0000029B
	ldrb r0, [r0, r2]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1c
	strb r0, [r1]
	bx lr
	.balign 4, 0
_0202AC18: .word 0x0000029B
	thumb_func_end sub_0202AC0C

	thumb_func_start sub_0202AC1C
sub_0202AC1C: ; 0x0202AC1C
	push {r3, r4}
	ldr r3, _0202AC34 ; =0x0000029B
	lsl r1, r1, #0x1c
	ldrb r4, [r0, r3]
	mov r2, #0x1e
	lsr r1, r1, #0x1b
	bic r4, r2
	orr r1, r4
	strb r1, [r0, r3]
	pop {r3, r4}
	bx lr
	nop
_0202AC34: .word 0x0000029B
	thumb_func_end sub_0202AC1C

	thumb_func_start sub_0202AC38
sub_0202AC38: ; 0x0202AC38
	push {r3, r4, r5, r6}
	sub r4, r1, #1
	lsl r1, r4, #2
	mov r5, #0xaa
	add r1, r0, r1
	lsl r5, r5, #2
	ldr r6, [r1, r5]
	add r0, r0, r4
	str r6, [r2]
	add r2, r5, #0
	add r2, #0x14
	ldr r1, [r1, r2]
	add r5, #0x28
	str r1, [r3]
	ldrb r1, [r0, r5]
	ldr r0, [sp, #0x10]
	strb r1, [r0]
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202AC38

	thumb_func_start sub_0202AC60
sub_0202AC60: ; 0x0202AC60
	push {r4, r5}
	sub r1, r1, #1
	lsl r4, r1, #2
	add r5, r0, r4
	mov r4, #0xaa
	lsl r4, r4, #2
	str r2, [r5, r4]
	add r2, r4, #0
	add r2, #0x14
	str r3, [r5, r2]
	ldr r2, _0202AC84 ; =0xFFFFFFF8
	add r0, r0, r1
	add r2, sp
	ldrb r2, [r2, #0x10]
	add r4, #0x28
	strb r2, [r0, r4]
	pop {r4, r5}
	bx lr
	.balign 4, 0
_0202AC84: .word 0xFFFFFFF8
	thumb_func_end sub_0202AC60
