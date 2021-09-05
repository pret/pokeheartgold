	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02028E6C
sub_02028E6C: ; 0x02028E6C
	mov r0, #0x2c
	bx lr
	thumb_func_end sub_02028E6C

	thumb_func_start sub_02028E70
sub_02028E70: ; 0x02028E70
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0
	add r1, r4, #0
	mov r2, #0x2c
	bl MIi_CpuClearFast
	add r0, r4, #0
	bl sub_0202ACA8
	add r0, r4, #4
	bl sub_02028EF0
	add r0, r4, #0
	add r0, #0x24
	bl sub_0202C948
	add r4, #0x26
	add r0, r4, #0
	bl sub_0202CDB0
	pop {r4, pc}
	thumb_func_end sub_02028E70

	thumb_func_start sub_02028E9C
sub_02028E9C: ; 0x02028E9C
	push {r3, lr}
	mov r1, #1
	bl SavArray_get
	add r0, r0, #4
	pop {r3, pc}
	thumb_func_end sub_02028E9C

	thumb_func_start Sav2_PlayerData_GetOptionsAddr
Sav2_PlayerData_GetOptionsAddr: ; 0x02028EA8
	ldr r3, _02028EB0 ; =SavArray_get
	mov r1, #1
	bx r3
	nop
_02028EB0: .word SavArray_get
	thumb_func_end Sav2_PlayerData_GetOptionsAddr

	thumb_func_start sub_02028EB4
sub_02028EB4: ; 0x02028EB4
	push {r3, lr}
	mov r1, #1
	bl SavArray_get
	add r0, #0x24
	pop {r3, pc}
	thumb_func_end sub_02028EB4

	thumb_func_start sub_02028EC0
sub_02028EC0: ; 0x02028EC0
	push {r3, lr}
	mov r1, #1
	bl SavArray_get
	add r0, #0x26
	pop {r3, pc}
	thumb_func_end sub_02028EC0

	thumb_func_start sub_02028ECC
sub_02028ECC: ; 0x02028ECC
	mov r0, #0x20
	bx lr
	thumb_func_end sub_02028ECC

	thumb_func_start sub_02028ED0
sub_02028ED0: ; 0x02028ED0
	push {r4, lr}
	mov r1, #0x20
	bl AllocFromHeap
	add r4, r0, #0
	bl sub_02028EF0
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02028ED0

	thumb_func_start sub_02028EE4
sub_02028EE4: ; 0x02028EE4
	ldr r3, _02028EEC ; =sub_020D4A50
	mov r2, #0x20
	bx r3
	nop
_02028EEC: .word sub_020D4A50
	thumb_func_end sub_02028EE4

	thumb_func_start sub_02028EF0
sub_02028EF0: ; 0x02028EF0
	push {r4, lr}
	mov r1, #0
	mov r2, #0x20
	add r4, r0, #0
	bl memset
	mov r0, #2
	strb r0, [r4, #0x19]
	add r0, r4, #0
	mov r1, #GAME_VERSION
	bl sub_02029080
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02028EF0

	thumb_func_start sub_02028F0C
sub_02028F0C: ; 0x02028F0C
	mov r2, #0
_02028F0E:
	ldrh r1, [r0]
	cmp r1, #0
	beq _02028F18
	mov r0, #0
	bx lr
_02028F18:
	add r2, r2, #1
	add r0, r0, #2
	cmp r2, #8
	blt _02028F0E
	mov r0, #1
	bx lr
	thumb_func_end sub_02028F0C

	thumb_func_start sub_02028F24
sub_02028F24: ; 0x02028F24
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl StringLength
	cmp r0, #8
	blt _02028F38
	bl GF_AssertFail
_02028F38:
	add r0, r5, #0
	add r1, r4, #0
	bl CopyU16StringArray
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02028F24

	thumb_func_start sub_02028F44
sub_02028F44: ; 0x02028F44
	ldr r3, _02028F50 ; =CopyStringToU16Array
	add r2, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	mov r2, #8
	bx r3
	.balign 4, 0
_02028F50: .word CopyStringToU16Array
	thumb_func_end sub_02028F44

	thumb_func_start PlayerProfile_GetNamePtr
PlayerProfile_GetNamePtr: ; 0x02028F54
	bx lr
	.balign 4, 0
	thumb_func_end PlayerProfile_GetNamePtr

	thumb_func_start sub_02028F58
sub_02028F58: ; 0x02028F58
	ldr r3, _02028F64 ; =CopyU16ArrayToString
	add r2, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	bx r3
	nop
_02028F64: .word CopyU16ArrayToString
	thumb_func_end sub_02028F58

	thumb_func_start sub_02028F68
sub_02028F68: ; 0x02028F68
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #8
	bl String_ctor
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02028F58
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02028F68

	thumb_func_start sub_02028F80
sub_02028F80: ; 0x02028F80
	str r1, [r0, #0x10]
	bx lr
	thumb_func_end sub_02028F80

	thumb_func_start sub_02028F84
sub_02028F84: ; 0x02028F84
	ldr r0, [r0, #0x10]
	bx lr
	thumb_func_end sub_02028F84

	thumb_func_start sub_02028F88
sub_02028F88: ; 0x02028F88
	ldr r0, [r0, #0x10]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
	thumb_func_end sub_02028F88

	thumb_func_start sub_02028F90
sub_02028F90: ; 0x02028F90
	strb r1, [r0, #0x18]
	bx lr
	thumb_func_end sub_02028F90

	thumb_func_start PlayerProfile_GetTrainerGender
PlayerProfile_GetTrainerGender: ; 0x02028F94
	ldrb r0, [r0, #0x18]
	bx lr
	thumb_func_end PlayerProfile_GetTrainerGender

	thumb_func_start sub_02028F98
sub_02028F98: ; 0x02028F98
	cmp r1, #0x10
	blt _02028FA0
	mov r0, #0
	bx lr
_02028FA0:
	cmp r1, #8
	bge _02028FB4
	ldrb r3, [r0, #0x1a]
	mov r0, #1
	add r2, r0, #0
	lsl r2, r1
	add r1, r3, #0
	tst r1, r2
	beq _02028FC4
	bx lr
_02028FB4:
	ldrb r3, [r0, #0x1f]
	mov r0, #1
	sub r1, #8
	add r2, r0, #0
	lsl r2, r1
	add r1, r3, #0
	tst r1, r2
	bne _02028FC6
_02028FC4:
	mov r0, #0
_02028FC6:
	bx lr
	thumb_func_end sub_02028F98

	thumb_func_start sub_02028FC8
sub_02028FC8: ; 0x02028FC8
	cmp r1, #0x10
	bge _02028FEC
	cmp r1, #8
	bge _02028FDE
	ldrb r3, [r0, #0x1a]
	mov r2, #1
	lsl r2, r1
	add r1, r3, #0
	orr r1, r2
	strb r1, [r0, #0x1a]
	bx lr
_02028FDE:
	ldrb r3, [r0, #0x1f]
	mov r2, #1
	sub r1, #8
	lsl r2, r1
	add r1, r3, #0
	orr r1, r2
	strb r1, [r0, #0x1f]
_02028FEC:
	bx lr
	.balign 4, 0
	thumb_func_end sub_02028FC8

	thumb_func_start sub_02028FF0
sub_02028FF0: ; 0x02028FF0
	push {r3, r4}
	ldrb r4, [r0, #0x1a]
	mov r3, #0
	cmp r4, #0
	beq _02029008
	mov r1, #1
_02028FFC:
	add r2, r4, #0
	tst r2, r1
	beq _02029004
	add r3, r3, #1
_02029004:
	lsr r4, r4, #1
	bne _02028FFC
_02029008:
	ldrb r2, [r0, #0x1f]
	cmp r2, #0
	beq _0202901C
	mov r0, #1
_02029010:
	add r1, r2, #0
	tst r1, r0
	beq _02029018
	add r3, r3, #1
_02029018:
	lsr r2, r2, #1
	bne _02029010
_0202901C:
	add r0, r3, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02028FF0

	thumb_func_start sub_02029024
sub_02029024: ; 0x02029024
	ldr r0, [r0, #0x14]
	bx lr
	thumb_func_end sub_02029024

	thumb_func_start sub_02029028
sub_02029028: ; 0x02029028
	ldr r2, _02029038 ; =0x000F423F
	cmp r1, r2
	bls _02029030
	add r1, r2, #0
_02029030:
	str r1, [r0, #0x14]
	add r0, r1, #0
	bx lr
	nop
_02029038: .word 0x000F423F
	thumb_func_end sub_02029028

	thumb_func_start sub_0202903C
sub_0202903C: ; 0x0202903C
	ldrb r0, [r0, #0x1b]
	bx lr
	thumb_func_end sub_0202903C

	thumb_func_start sub_02029040
sub_02029040: ; 0x02029040
	strb r1, [r0, #0x1b]
	bx lr
	thumb_func_end sub_02029040

	thumb_func_start sub_02029044
sub_02029044: ; 0x02029044
	ldr r2, _02029064 ; =0x000F423F
	cmp r1, r2
	bls _0202904E
	str r2, [r0, #0x14]
	b _02029054
_0202904E:
	ldr r2, [r0, #0x14]
	add r1, r2, r1
	str r1, [r0, #0x14]
_02029054:
	ldr r2, [r0, #0x14]
	ldr r1, _02029064 ; =0x000F423F
	cmp r2, r1
	bls _0202905E
	str r1, [r0, #0x14]
_0202905E:
	ldr r0, [r0, #0x14]
	bx lr
	nop
_02029064: .word 0x000F423F
	thumb_func_end sub_02029044

	thumb_func_start sub_02029068
sub_02029068: ; 0x02029068
	ldr r2, [r0, #0x14]
	cmp r2, r1
	bhs _02029072
	mov r1, #0
	b _02029074
_02029072:
	sub r1, r2, r1
_02029074:
	str r1, [r0, #0x14]
	ldr r0, [r0, #0x14]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02029068

	thumb_func_start sub_0202907C
sub_0202907C: ; 0x0202907C
	ldrb r0, [r0, #0x1c]
	bx lr
	thumb_func_end sub_0202907C

	thumb_func_start sub_02029080
sub_02029080: ; 0x02029080
	strb r1, [r0, #0x1c]
	bx lr
	thumb_func_end sub_02029080

	thumb_func_start sub_02029084
sub_02029084: ; 0x02029084
	mov r0, #0
	bx lr
	thumb_func_end sub_02029084

	thumb_func_start sub_02029088
sub_02029088: ; 0x02029088
	ldrb r0, [r0, #0x19]
	bx lr
	thumb_func_end sub_02029088

	thumb_func_start sub_0202908C
sub_0202908C: ; 0x0202908C
	strb r1, [r0, #0x19]
	bx lr
	thumb_func_end sub_0202908C

	thumb_func_start sub_02029090
sub_02029090: ; 0x02029090
	ldrb r2, [r0, #0x1d]
	mov r1, #1
	bic r2, r1
	mov r1, #1
	orr r1, r2
	strb r1, [r0, #0x1d]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02029090

	thumb_func_start sub_020290A0
sub_020290A0: ; 0x020290A0
	ldrb r0, [r0, #0x1d]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bx lr
	thumb_func_end sub_020290A0

	thumb_func_start sub_020290A8
sub_020290A8: ; 0x020290A8
	ldrb r2, [r0, #0x1d]
	mov r1, #2
	orr r1, r2
	strb r1, [r0, #0x1d]
	bx lr
	.balign 4, 0
	thumb_func_end sub_020290A8
