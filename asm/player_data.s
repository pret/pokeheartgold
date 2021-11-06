	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start Sav2_PlayerData_sizeof
Sav2_PlayerData_sizeof: ; 0x02028E6C
	mov r0, #0x2c
	bx lr
	thumb_func_end Sav2_PlayerData_sizeof

	thumb_func_start Sav2_PlayerData_init
Sav2_PlayerData_init: ; 0x02028E70
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0
	add r1, r4, #0
	mov r2, #0x2c
	bl MIi_CpuClearFast
	add r0, r4, #0
	bl Options_init
	add r0, r4, #4
	bl PlayerProfile_init
	add r0, r4, #0
	add r0, #0x24
	bl InitCoins
	add r4, #0x26
	add r0, r4, #0
	bl InitIGT
	pop {r4, pc}
	thumb_func_end Sav2_PlayerData_init

	thumb_func_start Sav2_PlayerData_GetProfileAddr
Sav2_PlayerData_GetProfileAddr: ; 0x02028E9C
	push {r3, lr}
	mov r1, #1
	bl SavArray_get
	add r0, r0, #4
	pop {r3, pc}
	thumb_func_end Sav2_PlayerData_GetProfileAddr

	thumb_func_start Sav2_PlayerData_GetOptionsAddr
Sav2_PlayerData_GetOptionsAddr: ; 0x02028EA8
	ldr r3, _02028EB0 ; =SavArray_get
	mov r1, #1
	bx r3
	nop
_02028EB0: .word SavArray_get
	thumb_func_end Sav2_PlayerData_GetOptionsAddr

	thumb_func_start Sav2_PlayerData_GetCoinsAddr
Sav2_PlayerData_GetCoinsAddr: ; 0x02028EB4
	push {r3, lr}
	mov r1, #1
	bl SavArray_get
	add r0, #0x24
	pop {r3, pc}
	thumb_func_end Sav2_PlayerData_GetCoinsAddr

	thumb_func_start Sav2_PlayerData_GetIGTAddr
Sav2_PlayerData_GetIGTAddr: ; 0x02028EC0
	push {r3, lr}
	mov r1, #1
	bl SavArray_get
	add r0, #0x26
	pop {r3, pc}
	thumb_func_end Sav2_PlayerData_GetIGTAddr

	thumb_func_start PlayerProfile_sizeof
PlayerProfile_sizeof: ; 0x02028ECC
	mov r0, #0x20
	bx lr
	thumb_func_end PlayerProfile_sizeof

	thumb_func_start PlayerProfile_new
PlayerProfile_new: ; 0x02028ED0
	push {r4, lr}
	mov r1, #0x20
	bl AllocFromHeap
	add r4, r0, #0
	bl PlayerProfile_init
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end PlayerProfile_new

	thumb_func_start PlayerProfile_Copy
PlayerProfile_Copy: ; 0x02028EE4
	ldr r3, _02028EEC ; =MI_CpuCopy8
	mov r2, #0x20
	bx r3
	nop
_02028EEC: .word MI_CpuCopy8
	thumb_func_end PlayerProfile_Copy

	thumb_func_start PlayerProfile_init
PlayerProfile_init: ; 0x02028EF0
	push {r4, lr}
	mov r1, #0
	mov r2, #0x20
	add r4, r0, #0
	bl memset
	mov r0, #2
	strb r0, [r4, #0x19]
	add r0, r4, #0
	mov r1, #GAME_VERSION
	bl PlayerProfile_SetVersion
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end PlayerProfile_init

	thumb_func_start PlayerProfile_IsNameEmpty
PlayerProfile_IsNameEmpty: ; 0x02028F0C
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
	thumb_func_end PlayerProfile_IsNameEmpty

	thumb_func_start Sav2_Profile_PlayerName_set
Sav2_Profile_PlayerName_set: ; 0x02028F24
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
	thumb_func_end Sav2_Profile_PlayerName_set

	thumb_func_start PlayerName_StringToFlat
PlayerName_StringToFlat: ; 0x02028F44
	ldr r3, _02028F50 ; =CopyStringToU16Array
	add r2, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	mov r2, #8
	bx r3
	.balign 4, 0
_02028F50: .word CopyStringToU16Array
	thumb_func_end PlayerName_StringToFlat

	thumb_func_start PlayerProfile_GetNamePtr
PlayerProfile_GetNamePtr: ; 0x02028F54
	bx lr
	.balign 4, 0
	thumb_func_end PlayerProfile_GetNamePtr

	thumb_func_start PlayerName_FlatToString
PlayerName_FlatToString: ; 0x02028F58
	ldr r3, _02028F64 ; =CopyU16ArrayToString
	add r2, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	bx r3
	nop
_02028F64: .word CopyU16ArrayToString
	thumb_func_end PlayerName_FlatToString

	thumb_func_start PlayerProfile_GetPlayerName_NewString
PlayerProfile_GetPlayerName_NewString: ; 0x02028F68
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #8
	bl String_ctor
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl PlayerName_FlatToString
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end PlayerProfile_GetPlayerName_NewString

	thumb_func_start PlayerProfile_SetTrainerID
PlayerProfile_SetTrainerID: ; 0x02028F80
	str r1, [r0, #0x10]
	bx lr
	thumb_func_end PlayerProfile_SetTrainerID

	thumb_func_start PlayerProfile_GetTrainerID
PlayerProfile_GetTrainerID: ; 0x02028F84
	ldr r0, [r0, #0x10]
	bx lr
	thumb_func_end PlayerProfile_GetTrainerID

	thumb_func_start PlayerProfile_GetTrainerID_VisibleHalf
PlayerProfile_GetTrainerID_VisibleHalf: ; 0x02028F88
	ldr r0, [r0, #0x10]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
	thumb_func_end PlayerProfile_GetTrainerID_VisibleHalf

	thumb_func_start PlayerProfile_SetTrainerGender
PlayerProfile_SetTrainerGender: ; 0x02028F90
	strb r1, [r0, #0x18]
	bx lr
	thumb_func_end PlayerProfile_SetTrainerGender

	thumb_func_start PlayerProfile_GetTrainerGender
PlayerProfile_GetTrainerGender: ; 0x02028F94
	ldrb r0, [r0, #0x18]
	bx lr
	thumb_func_end PlayerProfile_GetTrainerGender

	thumb_func_start PlayerProfile_TestBadgeFlag
PlayerProfile_TestBadgeFlag: ; 0x02028F98
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
	thumb_func_end PlayerProfile_TestBadgeFlag

	thumb_func_start PlayerProfile_SetBadgeFlag
PlayerProfile_SetBadgeFlag: ; 0x02028FC8
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
	thumb_func_end PlayerProfile_SetBadgeFlag

	thumb_func_start PlayerProfile_CountBadges
PlayerProfile_CountBadges: ; 0x02028FF0
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
	thumb_func_end PlayerProfile_CountBadges

	thumb_func_start PlayerProfile_GetMoney
PlayerProfile_GetMoney: ; 0x02029024
	ldr r0, [r0, #0x14]
	bx lr
	thumb_func_end PlayerProfile_GetMoney

	thumb_func_start PlayerProfile_SetMoney
PlayerProfile_SetMoney: ; 0x02029028
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
	thumb_func_end PlayerProfile_SetMoney

	thumb_func_start PlayerProfile_GetAvatar
PlayerProfile_GetAvatar: ; 0x0202903C
	ldrb r0, [r0, #0x1b]
	bx lr
	thumb_func_end PlayerProfile_GetAvatar

	thumb_func_start PlayerProfile_SetAvatar
PlayerProfile_SetAvatar: ; 0x02029040
	strb r1, [r0, #0x1b]
	bx lr
	thumb_func_end PlayerProfile_SetAvatar

	thumb_func_start PlayerProfile_AddMoney
PlayerProfile_AddMoney: ; 0x02029044
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
	thumb_func_end PlayerProfile_AddMoney

	thumb_func_start PlayerProfile_SubMoney
PlayerProfile_SubMoney: ; 0x02029068
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
	thumb_func_end PlayerProfile_SubMoney

	thumb_func_start PlayerProfile_GetVersion
PlayerProfile_GetVersion: ; 0x0202907C
	ldrb r0, [r0, #0x1c]
	bx lr
	thumb_func_end PlayerProfile_GetVersion

	thumb_func_start PlayerProfile_SetVersion
PlayerProfile_SetVersion: ; 0x02029080
	strb r1, [r0, #0x1c]
	bx lr
	thumb_func_end PlayerProfile_SetVersion

	thumb_func_start sub_02029084
sub_02029084: ; 0x02029084
	mov r0, #0
	bx lr
	thumb_func_end sub_02029084

	thumb_func_start PlayerProfile_GetLanguage
PlayerProfile_GetLanguage: ; 0x02029088
	ldrb r0, [r0, #0x19]
	bx lr
	thumb_func_end PlayerProfile_GetLanguage

	thumb_func_start PlayerProfile_SetLanguage
PlayerProfile_SetLanguage: ; 0x0202908C
	strb r1, [r0, #0x19]
	bx lr
	thumb_func_end PlayerProfile_SetLanguage

	thumb_func_start PlayerProfile_SetGameClearFlag
PlayerProfile_SetGameClearFlag: ; 0x02029090
	ldrb r2, [r0, #0x1d]
	mov r1, #1
	bic r2, r1
	mov r1, #1
	orr r1, r2
	strb r1, [r0, #0x1d]
	bx lr
	.balign 4, 0
	thumb_func_end PlayerProfile_SetGameClearFlag

	thumb_func_start PlayerProfile_GetGameClearFlag
PlayerProfile_GetGameClearFlag: ; 0x020290A0
	ldrb r0, [r0, #0x1d]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bx lr
	thumb_func_end PlayerProfile_GetGameClearFlag

	thumb_func_start PlayerProfile_SetNatDexFlag
PlayerProfile_SetNatDexFlag: ; 0x020290A8
	ldrb r2, [r0, #0x1d]
	mov r1, #2
	orr r1, r2
	strb r1, [r0, #0x1d]
	bx lr
	.balign 4, 0
	thumb_func_end PlayerProfile_SetNatDexFlag
