	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020FC4C0:
	.word 0x00000000
	.word 0x00000007
	.word 0x00000009
	.word 0x00000002
	.word 0x00000004
	.word 0x00000006
	.word 0x00000009
	.word 0x00000009
	.word 0x00000009
	.word 0x00000005
	.word 0x00000005
	.word 0x00000005
	.word 0x0000000C
	.word 0x0000000D
	.word 0x0000000E
	.word 0x0000000F
	.word 0x00000010
	.word 0x00000011
	.word 0x00000012
	.word 0x00000013
	.word 0x00000014
	.word 0x00000015
	.word 0x00000016

	.text

	thumb_func_start BattleStruct_new
BattleStruct_new: ; 0x020518D8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r1, #0
	mov r1, #0x75
	lsl r1, r1, #2
	add r6, r0, #0
	bl AllocFromHeap
	mov r2, #0x75
	mov r1, #0
	lsl r2, r2, #2
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #0x63
	str r5, [r4]
	lsl r0, r0, #2
	mov r7, #0
	str r7, [r4, r0]
	add r1, r0, #0
	str r7, [r4, #0x14]
	sub r1, #0x40
	str r7, [r4, r1]
	add r1, r0, #0
	mov r2, #0x18
	sub r1, #0x3c
	str r2, [r4, r1]
	add r1, r0, #0
	sub r1, #0x38
	str r7, [r4, r1]
	add r1, r0, #0
	sub r1, #0x30
	str r7, [r4, r1]
	add r1, r0, #0
	sub r1, #0x2c
	str r7, [r4, r1]
	add r1, r0, #0
	mov r2, #1
	sub r1, #0x28
	str r2, [r4, r1]
	add r1, r0, #0
	sub r1, #0x24
	str r2, [r4, r1]
	sub r0, #0x18
	str r7, [r4, r0]
	add r0, r4, #0
	str r0, [sp]
	add r0, #0x28
	add r5, r4, #0
	str r0, [sp]
_0205193C:
	ldr r1, [sp]
	mov r0, #0
	mov r2, #0x34
	str r0, [r5, #0x18]
	bl MIi_CpuClear32
	add r0, r6, #0
	bl SavArray_Party_alloc
	str r0, [r5, #4]
	add r0, r6, #0
	bl PlayerProfile_new
	add r1, r5, #0
	add r1, #0xf8
	str r0, [r1]
	add r0, r6, #0
	bl Chatot_new
	mov r1, #0x46
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r1, #0xff
	add r0, r1, #0
	add r2, r4, r7
	add r0, #0xcd
	strb r1, [r2, r0]
	ldr r0, [sp]
	add r7, r7, #1
	add r0, #0x34
	add r5, r5, #4
	str r0, [sp]
	cmp r7, #4
	blt _0205193C
	add r0, r6, #0
	bl Sav2_Bag_new
	mov r1, #0x42
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r6, #0
	bl Pokedex_new
	mov r1, #0x11
	lsl r1, r1, #4
	str r0, [r4, r1]
	add r0, r6, #0
	bl Options_new
	mov r1, #0x13
	lsl r1, r1, #4
	str r0, [r4, r1]
	add r0, r6, #0
	bl sub_02067A60
	mov r1, #0x4d
	lsl r1, r1, #2
	add r2, r1, #0
	str r0, [r4, r1]
	mov r0, #0
	sub r2, #0x28
	str r0, [r4, r2]
	add r2, r1, #0
	add r2, #0x84
	str r0, [r4, r2]
	add r2, r1, #0
	add r2, #0x5c
	str r0, [r4, r2]
	add r2, r1, #0
	sub r2, #8
	str r0, [r4, r2]
	add r2, r1, #0
	add r2, #0x10
	str r0, [r4, r2]
	add r1, #0x60
	str r0, [r4, r1]
	add r0, r6, #0
	bl AllocMonZeroed
	mov r1, #0x72
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, sp, #0x10
	add r1, sp, #4
	bl GF_RTC_CopyDateTime
	ldr r0, _02051A5C ; =gSystem
	ldr r6, [sp, #0x14]
	ldr r5, [r0, #0x2c]
	ldr r1, [sp, #8]
	ldr r0, [sp, #0xc]
	lsl r6, r6, #8
	add r0, r1, r0
	lsl r3, r0, #0x18
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x10]
	lsl r2, r0, #0x10
	ldr r0, [sp, #0x18]
	mul r6, r0
	lsl r0, r6, #0x10
	add r0, r1, r0
	add r0, r2, r0
	add r0, r3, r0
	add r1, r5, r0
	mov r0, #0x67
	lsl r0, r0, #2
	str r1, [r4, r0]
	bl sub_02037474
	cmp r0, #1
	bne _02051A48
	mov r5, #0
	bl sub_02037454
	cmp r0, #0
	ble _02051A3E
	mov r7, #0x1a
	add r6, r4, #0
	lsl r7, r7, #4
_02051A2A:
	add r0, r5, #0
	bl sub_020378AC
	str r0, [r6, r7]
	add r6, r6, #4
	add r5, r5, #1
	bl sub_02037454
	cmp r5, r0
	blt _02051A2A
_02051A3E:
	bl sub_0203769C
	mov r1, #0x1b
	lsl r1, r1, #4
	strh r0, [r4, r1]
_02051A48:
	mov r0, #0x4e
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	mov r2, #0xc
	bl MI_CpuFill8
	add r0, r4, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02051A5C: .word gSystem
	thumb_func_end BattleStruct_new

	thumb_func_start sub_02051A60
sub_02051A60: ; 0x02051A60
	push {r4, lr}
	add r4, r1, #0
	mov r1, #0x20
	bl BattleStruct_new
	mov r1, #0x19
	lsl r1, r1, #4
	str r4, [r0, r1]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02051A60

	thumb_func_start sub_02051A74
sub_02051A74: ; 0x02051A74
	push {r4, r5, r6, lr}
	add r5, r1, #0
	mov r1, #1
	lsl r1, r1, #0xc
	add r6, r2, #0
	bl BattleStruct_new
	mov r1, #0x19
	add r4, r0, #0
	lsl r1, r1, #4
	str r5, [r4, r1]
	add r1, #0x38
	ldr r1, [r4, r1]
	add r0, r6, #0
	bl CopyPokemonToPokemon
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02051A74

	thumb_func_start sub_02051A98
sub_02051A98: ; 0x02051A98
	push {r4, lr}
	add r4, r1, #0
	mov r1, #2
	lsl r1, r1, #8
	bl BattleStruct_new
	mov r1, #0x19
	lsl r1, r1, #4
	str r4, [r0, r1]
	pop {r4, pc}
	thumb_func_end sub_02051A98

	thumb_func_start sub_02051AAC
sub_02051AAC: ; 0x02051AAC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r1, #0
	add r6, r0, #0
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [sp, #0x10]
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	mov r1, #1
	str r0, [sp, #0x14]
	add r0, r6, #0
	lsl r1, r1, #0xa
	bl BattleStruct_new
	add r4, r0, #0
	mov r2, #7
	ldr r0, [r5, #0xc]
	lsl r2, r2, #6
	str r0, [r4, r2]
	mov r0, #1
	mov r1, #0x1b
	sub r2, r2, #3
	add r3, r6, #0
	bl NewMsgDataFromNarc
	str r0, [sp, #0x18]
	mov r0, #8
	add r1, r6, #0
	bl String_ctor
	add r7, r0, #0
	ldr r0, [sp, #0x10]
	bl PlayerProfile_GetTrainerGender
	add r2, r0, #0
	mov r1, #1
	eor r1, r2
	ldr r0, [sp, #0x18]
	add r2, r7, #0
	bl ReadMsgDataIntoString
	add r0, r7, #0
	bl String_c_str
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0xf8
	ldr r0, [r0]
	bl Sav2_Profile_PlayerName_set
	add r0, r7, #0
	bl String_dtor
	ldr r0, [sp, #0x18]
	bl DestroyMsgData
	ldr r0, [sp, #0x10]
	bl PlayerProfile_GetTrainerGender
	add r2, r0, #0
	add r0, r4, #0
	add r0, #0xf8
	mov r1, #1
	ldr r0, [r0]
	eor r1, r2
	bl PlayerProfile_SetTrainerGender
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02052504
	mov r1, #0x13
	lsl r1, r1, #4
	ldr r0, [sp, #0x14]
	ldr r1, [r4, r1]
	bl Options_copy
	add r0, r5, #0
	bl Field_GetTimeOfDay
	mov r1, #0x57
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, #0x54
	ldr r0, [r4, r1]
	mov r1, #4
	mov r2, #0x14
	add r3, r6, #0
	bl Bag_AddItem
	add r0, r6, #0
	bl AllocMonZeroed
	mov r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	mov r1, #2
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	mov r1, #0xb7
	mov r2, #5
	mov r3, #0x20
	add r6, r0, #0
	bl CreateMon
	ldr r0, [r4, #4]
	add r1, r6, #0
	bl AddMonToParty
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r2, #2
	str r2, [sp, #8]
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #0x13
	mov r3, #0x20
	bl CreateMon
	ldr r0, [r4, #8]
	add r1, r6, #0
	bl AddMonToParty
	add r0, r6, #0
	bl FreeToHeap
	mov r0, #0x73
	mov r1, #0
	lsl r0, r0, #2
	strb r1, [r4, r0]
	ldr r0, [r5, #0xc]
	bl GetStoragePCPointer
	mov r1, #0x45
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r5, #0
	add r0, #0x94
	ldr r2, [r0]
	add r0, r1, #0
	sub r0, #8
	str r2, [r4, r0]
	mov r0, #0
	add r1, #0xa4
	str r0, [r4, r1]
	ldr r0, [r5, #0xc]
	bl Sav2_GameStats_get
	mov r1, #0x51
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r5, #0x20]
	add r1, #0x14
	ldr r0, [r0]
	str r0, [r4, r1]
	add r0, r4, #0
	bl sub_02052580
	add r0, r4, #0
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02051AAC

	thumb_func_start sub_02051BF8
sub_02051BF8: ; 0x02051BF8
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r4, #0
	add r5, r6, #0
_02051C00:
	ldr r0, [r5, #4]
	cmp r0, #0
	bne _02051C0A
	bl GF_AssertFail
_02051C0A:
	ldr r0, [r5, #4]
	bl FreeToHeap
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _02051C00
	mov r5, #0
	add r4, r6, #0
_02051C1C:
	add r0, r4, #0
	add r0, #0xf8
	ldr r0, [r0]
	cmp r0, #0
	bne _02051C2A
	bl GF_AssertFail
_02051C2A:
	add r0, r4, #0
	add r0, #0xf8
	ldr r0, [r0]
	bl FreeToHeap
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #4
	blt _02051C1C
	mov r7, #0x46
	mov r5, #0
	add r4, r6, #0
	lsl r7, r7, #2
_02051C44:
	ldr r0, [r4, r7]
	cmp r0, #0
	bne _02051C4E
	bl GF_AssertFail
_02051C4E:
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #4
	blt _02051C44
	mov r0, #0x42
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl FreeToHeap
	mov r0, #0x11
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	bl FreeToHeap
	mov r0, #0x13
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	bl FreeToHeap
	mov r0, #0x4d
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl sub_02067A78
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl FreeToHeap
	add r0, r6, #0
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02051BF8

	thumb_func_start sub_02051C9C
sub_02051C9C: ; 0x02051C9C
	push {r4, r5, r6, lr}
	add r4, r2, #0
	add r5, r0, #0
	add r6, r1, #0
	cmp r4, #4
	blt _02051CAC
	bl GF_AssertFail
_02051CAC:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, #4]
	add r1, r6, #0
	bl AddMonToParty
	cmp r0, #0
	bne _02051CC0
	bl GF_AssertFail
_02051CC0:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02051C9C

	thumb_func_start sub_02051CC4
sub_02051CC4: ; 0x02051CC4
	push {r4, r5, r6, lr}
	add r4, r2, #0
	add r5, r0, #0
	add r6, r1, #0
	cmp r4, #4
	blt _02051CD4
	bl GF_AssertFail
_02051CD4:
	lsl r1, r4, #2
	add r1, r5, r1
	ldr r1, [r1, #4]
	add r0, r6, #0
	bl Party_copy
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02051CC4

	thumb_func_start sub_02051CE4
sub_02051CE4: ; 0x02051CE4
	push {r4, r5, r6, lr}
	add r4, r2, #0
	add r5, r0, #0
	add r6, r1, #0
	cmp r4, #4
	blt _02051CF4
	bl GF_AssertFail
_02051CF4:
	lsl r1, r4, #2
	add r1, r5, r1
	add r1, #0xf8
	ldr r1, [r1]
	add r0, r6, #0
	bl PlayerProfile_copy
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02051CE4

	thumb_func_start sub_02051D04
sub_02051D04: ; 0x02051D04
	lsl r2, r2, #2
	add r2, r0, r2
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r3, _02051D14 ; =Chatot_copy
	ldr r0, [r2, r0]
	bx r3
	nop
_02051D14: .word Chatot_copy
	thumb_func_end sub_02051D04

	thumb_func_start sub_02051D18
sub_02051D18: ; 0x02051D18
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r4, r2, #0
	add r5, r0, #0
	add r0, r4, #0
	add r6, r1, #0
	add r7, r3, #0
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [sp, #0x1c]
	add r0, r4, #0
	bl SavArray_PlayerParty_get
	str r0, [sp, #0x18]
	add r0, r4, #0
	bl Sav2_Bag_get
	str r0, [sp, #0x14]
	add r0, r4, #0
	bl Sav2_Pokedex_get
	str r0, [sp, #0x10]
	add r0, r4, #0
	bl Sav2_Chatot_get
	str r0, [sp, #0xc]
	add r0, r4, #0
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [sp, #8]
	add r0, r4, #0
	bl Save_FlyPoints_get
	str r0, [sp, #4]
	cmp r6, #0
	beq _02051DB6
	mov r0, #0
	str r0, [sp]
	ldr r0, [r6, #0x20]
	ldr r0, [r0]
	bl MapHeader_GetBattleBg
	sub r0, #9
	cmp r0, #2
	bhi _02051D76
	mov r0, #1
	str r0, [sp]
_02051D76:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02052504
	add r0, r6, #0
	bl Field_GetTimeOfDay
	mov r1, #0x57
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [sp]
	cmp r0, #0
	beq _02051D94
	mov r0, #3
	str r0, [r5, r1]
_02051D94:
	add r0, r6, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _02051DDA
	add r0, r6, #0
	bl sub_02069FB0
	cmp r0, #0
	beq _02051DDA
	add r0, r4, #0
	bl Save_GetPartyLeadAlive
	mov r1, #0x73
	lsl r1, r1, #2
	strb r0, [r5, r1]
	b _02051DDA
_02051DB6:
	add r0, r7, #0
	bl MapHeader_GetBattleBg
	mov r1, #0x53
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r2, #9
	add r0, r1, #4
	str r2, [r5, r0]
	add r0, r4, #0
	bl Sav2_SysInfo_RTC_get
	ldr r0, [r0, #0x14]
	bl GF_RTC_GetTimeOfDayByHour
	mov r1, #0x57
	lsl r1, r1, #2
	str r0, [r5, r1]
_02051DDA:
	ldr r1, [sp, #0x1c]
	add r0, r5, #0
	mov r2, #0
	bl sub_02051CE4
	mov r0, #1
	ldr r1, [r5]
	lsl r0, r0, #0xc
	tst r0, r1
	beq _02051E0A
	ldr r0, [r5, #4]
	mov r1, #1
	bl InitPartyWithMaxSize
	ldr r0, [sp, #0x18]
	mov r1, #0
	bl GetPartyMonByIndex
	add r1, r0, #0
	add r0, r5, #0
	mov r2, #0
	bl sub_02051C9C
	b _02051E14
_02051E0A:
	ldr r1, [sp, #0x18]
	add r0, r5, #0
	mov r2, #0
	bl sub_02051CC4
_02051E14:
	mov r1, #0x42
	lsl r1, r1, #2
	ldr r0, [sp, #0x14]
	ldr r1, [r5, r1]
	bl Sav2_Bag_copy
	mov r1, #0x11
	lsl r1, r1, #4
	ldr r0, [sp, #0x10]
	ldr r1, [r5, r1]
	bl Pokedex_copy
	mov r1, #0x13
	lsl r1, r1, #4
	ldr r0, [sp, #8]
	ldr r1, [r5, r1]
	bl Options_copy
	ldr r1, [sp, #0xc]
	add r0, r5, #0
	mov r2, #0
	bl sub_02051D04
	add r0, r4, #0
	bl GetStoragePCPointer
	mov r1, #0x45
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r7, #0
	bl MapHeader_GetMapSec
	mov r1, #0x55
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r7, #0
	bl MapHeader_GetMapEvolutionMethod
	mov r1, #0x16
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r4, #0
	bl sub_02088288
	mov r1, #0x59
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r4, #0
	bl SavArray_Flags_get
	bl CheckMetBill
	mov r1, #0x5a
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r4, #0
	bl SaveData_GetMomsSavingsAddr
	mov r1, #0
	add r2, r1, #0
	bl MomSavingsBalanceAction
	ldr r1, _02051EFC ; =0x000F423F
	cmp r0, r1
	bhs _02051EA8
	add r0, r4, #0
	bl SavArray_Flags_get
	bl ScriptState_MomsSavingsFlagCheck
	mov r1, #0x5b
	lsl r1, r1, #2
	str r0, [r5, r1]
	b _02051EB0
_02051EA8:
	mov r0, #0x5b
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
_02051EB0:
	ldr r0, [sp, #4]
	bl FlyPoints_GetWeatherType
	mov r1, #0x5d
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r2, [sp, #0x38]
	sub r0, #0x68
	str r2, [r5, r0]
	ldr r0, [sp, #0x3c]
	add r1, #0x44
	str r0, [r5, r1]
	add r0, r4, #0
	bl sub_0202CA44
	mov r1, #0x4b
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r4, #0
	bl Sav2_GameStats_get
	mov r1, #0x51
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r4, #0
	bl Save_PalPad_get
	mov r1, #0x52
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #0
	add r0, #0x10
	str r7, [r5, r0]
	add r1, #0x78
	str r4, [r5, r1]
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02051EFC: .word 0x000F423F
	thumb_func_end sub_02051D18

	thumb_func_start BattleStruct_InitFromFsys
BattleStruct_InitFromFsys: ; 0x02051F00
	push {r4, lr}
	sub sp, #8
	add r2, r1, #0
	add r2, #0x94
	ldr r2, [r2]
	add r4, r0, #0
	str r2, [sp]
	add r2, r1, #0
	add r2, #0xb0
	ldr r2, [r2]
	str r2, [sp, #4]
	ldr r3, [r1, #0x20]
	ldr r2, [r1, #0xc]
	ldr r3, [r3]
	bl sub_02051D18
	add r0, r4, #0
	bl sub_02052580
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end BattleStruct_InitFromFsys

	thumb_func_start sub_02051F2C
sub_02051F2C: ; 0x02051F2C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	add r0, r1, #0
	ldr r0, [r0, #0xc]
	str r1, [sp]
	add r6, r2, #0
	bl Sav2_PlayerData_GetProfileAddr
	add r4, r0, #0
	ldr r0, [sp]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [sp, #0x14]
	ldr r0, [sp]
	ldr r0, [r0, #0xc]
	bl Sav2_Bag_get
	str r0, [sp, #0x10]
	ldr r0, [sp]
	ldr r0, [r0, #0xc]
	bl Sav2_Pokedex_get
	str r0, [sp, #0xc]
	ldr r0, [sp]
	ldr r0, [r0, #0xc]
	bl Sav2_Chatot_get
	str r0, [sp, #8]
	ldr r0, [sp]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [sp, #4]
	mov r0, #0x53
	mov r1, #6
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r1, #9
	add r0, r0, #4
	str r1, [r5, r0]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl sub_02051CE4
	mov r0, #0xb
	bl AllocMonZeroed
	add r4, r0, #0
	ldr r0, [sp, #0x14]
	bl GetPartyCount
	add r1, r0, #0
	ldr r0, [r5, #4]
	bl InitPartyWithMaxSize
	ldr r0, [sp, #0x14]
	mov r7, #0
	bl GetPartyCount
	cmp r0, #0
	ble _02052004
_02051FAC:
	ldr r0, [sp, #0x14]
	add r1, r7, #0
	bl GetPartyMonByIndex
	add r1, r4, #0
	bl CopyPokemonToPokemon
	add r0, r4, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	cmp r6, r0
	beq _02051FEE
	cmp r6, #0
	beq _02051FEE
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r1, r6, #0
	bl GetMonExpBySpeciesAndLevel
	str r0, [sp, #0x18]
	add r0, r4, #0
	mov r1, #8
	add r2, sp, #0x18
	bl SetMonData
	add r0, r4, #0
	bl CalcMonLevelAndStats
_02051FEE:
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl sub_02051C9C
	ldr r0, [sp, #0x14]
	add r7, r7, #1
	bl GetPartyCount
	cmp r7, r0
	blt _02051FAC
_02052004:
	add r0, r4, #0
	bl FreeToHeap
	mov r1, #0x42
	lsl r1, r1, #2
	ldr r0, [sp, #0x10]
	ldr r1, [r5, r1]
	bl Sav2_Bag_copy
	mov r1, #0x11
	lsl r1, r1, #4
	ldr r0, [sp, #0xc]
	ldr r1, [r5, r1]
	bl Pokedex_copy
	mov r1, #0x13
	lsl r1, r1, #4
	ldr r0, [sp, #4]
	ldr r1, [r5, r1]
	bl Options_copy
	ldr r1, [sp, #8]
	add r0, r5, #0
	mov r2, #0
	bl sub_02051D04
	ldr r0, [sp]
	ldr r0, [r0, #0xc]
	bl GetStoragePCPointer
	mov r1, #0x45
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [sp]
	bl Field_GetTimeOfDay
	mov r1, #0x57
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [sp]
	add r0, #0x94
	ldr r2, [r0]
	add r0, r1, #0
	sub r0, #0x50
	str r2, [r5, r0]
	ldr r0, [sp]
	add r1, #0x5c
	add r0, #0xb0
	ldr r0, [r0]
	str r0, [r5, r1]
	ldr r0, [sp]
	ldr r0, [r0, #0xc]
	bl sub_0202CA44
	mov r1, #0x4b
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [sp]
	ldr r0, [r0, #0xc]
	bl Sav2_GameStats_get
	mov r1, #0x51
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [sp]
	ldr r0, [r0, #0xc]
	bl Save_PalPad_get
	mov r1, #0x52
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [sp]
	ldr r0, [r0, #0x20]
	ldr r2, [r0]
	add r0, r1, #0
	add r0, #0x10
	str r2, [r5, r0]
	ldr r0, [sp]
	add r1, #0x78
	ldr r0, [r0, #0xc]
	str r0, [r5, r1]
	add r0, r5, #0
	bl sub_02052580
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_02051F2C

	thumb_func_start sub_020520B0
sub_020520B0: ; 0x020520B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r5, r0, #0
	add r0, r1, #0
	ldr r0, [r0, #0xc]
	str r1, [sp]
	str r2, [sp, #4]
	add r4, r3, #0
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [sp, #0x20]
	ldr r0, [sp]
	ldr r0, [r0, #0xc]
	bl Sav2_Bag_get
	str r0, [sp, #0x1c]
	ldr r0, [sp]
	ldr r0, [r0, #0xc]
	bl Sav2_Pokedex_get
	str r0, [sp, #0x18]
	ldr r0, [sp]
	ldr r0, [r0, #0xc]
	bl Sav2_Chatot_get
	str r0, [sp, #0x14]
	ldr r0, [sp]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [sp, #0x10]
	ldr r0, [sp]
	mov r1, #6
	add r0, #0xa4
	ldr r0, [r0]
	mov r2, #0
	str r0, [sp, #0xc]
	mov r0, #0x53
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r1, #9
	add r0, r0, #4
	str r1, [r5, r0]
	ldr r1, [sp, #0x20]
	add r0, r5, #0
	bl sub_02051CE4
	cmp r4, #0
	bne _0205211E
	ldr r1, [sp, #4]
	add r0, r5, #0
	mov r2, #0
	bl sub_02051CC4
	b _020521DE
_0205211E:
	add r0, r4, #0
	add r1, sp, #0x28
	mov r2, #6
	bl MI_CpuCopy8
	mov r6, #0
	add r1, r6, #0
	add r2, sp, #0x28
_0205212E:
	ldrb r0, [r2]
	cmp r0, #0
	beq _02052136
	add r6, r6, #1
_02052136:
	add r1, r1, #1
	add r2, r2, #1
	cmp r1, #6
	blt _0205212E
	cmp r6, #0
	bne _02052158
	mov r1, #0
	add r0, sp, #0x28
_02052146:
	add r1, r1, #1
	strb r1, [r0]
	add r0, r0, #1
	cmp r1, #6
	blt _02052146
	ldr r0, [sp, #4]
	bl GetPartyCount
	add r6, r0, #0
_02052158:
	mov r0, #0xb
	bl AllocMonZeroed
	add r4, r0, #0
	ldr r0, [r5, #4]
	add r1, r6, #0
	bl InitPartyWithMaxSize
	mov r0, #0
	str r0, [sp, #8]
	cmp r6, #0
	ble _020521D8
	add r7, sp, #0x28
_02052172:
	ldrb r1, [r7]
	ldr r0, [sp, #4]
	sub r1, r1, #1
	bl GetPartyMonByIndex
	add r1, r4, #0
	bl CopyPokemonToPokemon
	add r0, r4, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	cmp r0, #0x32
	bls _020521C2
	bl sub_0203993C
	cmp r0, #0x25
	beq _020521A0
	bl sub_0203993C
	cmp r0, #0x26
	bne _020521C2
_020521A0:
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	mov r1, #0x32
	bl GetMonExpBySpeciesAndLevel
	str r0, [sp, #0x24]
	add r0, r4, #0
	mov r1, #8
	add r2, sp, #0x24
	bl SetMonData
	add r0, r4, #0
	bl CalcMonLevelAndStats
_020521C2:
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl sub_02051C9C
	ldr r0, [sp, #8]
	add r7, r7, #1
	add r0, r0, #1
	str r0, [sp, #8]
	cmp r0, r6
	blt _02052172
_020521D8:
	add r0, r4, #0
	bl FreeToHeap
_020521DE:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _020521F6
	mov r1, #0xc
	bl sub_020290FC
	cmp r0, #0
	beq _020521F6
	mov r0, #0x65
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r5, r0]
_020521F6:
	mov r1, #0x42
	lsl r1, r1, #2
	ldr r0, [sp, #0x1c]
	ldr r1, [r5, r1]
	bl Sav2_Bag_copy
	mov r1, #0x11
	lsl r1, r1, #4
	ldr r0, [sp, #0x18]
	ldr r1, [r5, r1]
	bl Pokedex_copy
	mov r1, #0x13
	lsl r1, r1, #4
	ldr r0, [sp, #0x10]
	ldr r1, [r5, r1]
	bl Options_copy
	ldr r1, [sp, #0x14]
	add r0, r5, #0
	mov r2, #0
	bl sub_02051D04
	ldr r0, [sp]
	ldr r0, [r0, #0xc]
	bl GetStoragePCPointer
	mov r1, #0x45
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [sp]
	bl Field_GetTimeOfDay
	mov r1, #0x57
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [sp]
	add r0, #0x94
	ldr r2, [r0]
	add r0, r1, #0
	sub r0, #0x50
	str r2, [r5, r0]
	ldr r0, [sp]
	add r1, #0x5c
	add r0, #0xb0
	ldr r0, [r0]
	str r0, [r5, r1]
	ldr r0, [sp]
	ldr r0, [r0, #0xc]
	bl sub_0202CA44
	mov r1, #0x4b
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [sp]
	ldr r0, [r0, #0xc]
	bl Sav2_GameStats_get
	mov r1, #0x51
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [sp]
	add r1, #0x14
	ldr r0, [r0, #0x20]
	ldr r0, [r0]
	str r0, [r5, r1]
	ldr r0, [sp]
	ldr r0, [r0, #0xc]
	bl Save_PalPad_get
	mov r1, #0x52
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [sp]
	add r1, #0x78
	ldr r0, [r0, #0xc]
	str r0, [r5, r1]
	bl sub_0203993C
	bl sub_0203401C
	cmp r0, #0
	beq _020522E4
	ldr r0, [sp, #0x20]
	bl PlayerProfile_GetAvatar
	add r4, r0, #0
	ldr r0, [sp, #0x20]
	bl PlayerProfile_GetTrainerGender
	add r1, r4, #0
	mov r2, #1
	bl sub_0205B46C
	add r1, r5, #0
	add r1, #0x29
	strb r0, [r1]
	add r0, r5, #0
	add r0, #0xf8
	ldr r0, [r0]
	bl PlayerProfile_GetNamePtr
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x3c
	bl CopyU16StringArray
	add r3, r5, #0
	add r3, #0x28
	add r5, #0x90
	mov r2, #6
_020522D4:
	ldmia r3!, {r0, r1}
	stmia r5!, {r0, r1}
	sub r2, r2, #1
	bne _020522D4
	ldr r0, [r3]
	add sp, #0x30
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_020522E4:
	add r0, r5, #0
	bl sub_02052580
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020520B0

	thumb_func_start sub_020522F0
sub_020522F0: ; 0x020522F0
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	add r6, r2, #0
	bl SavArray_PlayerParty_get
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	add r3, r6, #0
	bl sub_020520B0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020522F0

	thumb_func_start sub_0205230C
sub_0205230C: ; 0x0205230C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	ldr r0, [r6, #0xc]
	add r5, r1, #0
	str r2, [sp]
	bl SavArray_Flags_get
	add r4, r0, #0
	ldr r0, [r6, #0xc]
	bl SaveData_GetMomsSavingsAddr
	str r0, [sp, #4]
	add r0, r4, #0
	bl ScriptState_MomsSavingsFlagCheck
	cmp r0, #0
	beq _02052394
	ldr r0, [sp]
	bl PlayerProfile_GetMoney
	add r7, r0, #0
	add r0, r5, #0
	bl PlayerProfile_GetMoney
	sub r1, r7, r0
	asr r0, r1, #1
	lsr r0, r0, #0x1e
	add r0, r1, r0
	asr r4, r0, #2
	mov r1, #0
	ldr r0, [sp, #4]
	add r2, r1, #0
	bl MomSavingsBalanceAction
	add r5, r0, #0
	cmp r4, #0
	ble _02052378
	ldr r0, _02052398 ; =0x000F423F
	add r1, r5, r4
	cmp r1, r0
	blo _02052362
	sub r4, r0, r5
_02052362:
	ldr r0, [sp]
	sub r1, r7, r4
	bl PlayerProfile_SetMoney
	ldr r0, [sp, #4]
	mov r1, #2
	add r2, r4, #0
	bl MomSavingsBalanceAction
	add r1, r0, #0
	b _0205237A
_02052378:
	add r1, r5, #0
_0205237A:
	ldr r0, [sp, #4]
	add r2, r5, #0
	bl sub_0209322C
	cmp r0, #0
	beq _02052394
	add r0, r6, #0
	bl Fsys_GetGearPhoneRingManager
	mov r1, #0xc
	mov r2, #1
	bl sub_02092E14
_02052394:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02052398: .word 0x000F423F
	thumb_func_end sub_0205230C

	thumb_func_start sub_0205239C
sub_0205239C: ; 0x0205239C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	add r6, r0, #0
	ldr r0, [r4, #0xc]
	bl SavArray_PlayerParty_get
	add r7, r0, #0
	ldr r0, [r4, #0xc]
	bl Sav2_Bag_get
	str r0, [sp]
	ldr r0, [r4, #0xc]
	bl Sav2_Pokedex_get
	add r2, r5, #0
	add r2, #0xf8
	str r0, [sp, #4]
	ldr r2, [r2]
	add r0, r4, #0
	add r1, r6, #0
	bl sub_0205230C
	add r0, r5, #0
	add r0, #0xf8
	ldr r0, [r0]
	add r1, r6, #0
	bl PlayerProfile_copy
	ldr r0, [r5, #4]
	add r1, r7, #0
	bl Party_copy
	mov r0, #0x42
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [sp]
	bl Sav2_Bag_copy
	mov r0, #0x11
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	ldr r1, [sp, #4]
	bl Pokedex_copy
	ldr r0, [r4, #0xc]
	mov r6, #0
	bl SavArray_Flags_get
	add r7, r0, #0
	bl ScriptState_CheckSafariSysFlag
	cmp r0, #0
	beq _0205241E
	ldr r0, [r4, #0xc]
	bl Save_FlyPoints_get
	bl FlyPoints_GetSafariBallsCounter
	add r6, r0, #0
	b _02052434
_0205241E:
	add r0, r7, #0
	bl CheckFlag996
	cmp r0, #0
	beq _02052434
	add r0, r4, #0
	bl FieldSys_BugContest_get
	bl BugContest_GetSportBallsAddr
	add r6, r0, #0
_02052434:
	cmp r6, #0
	beq _02052440
	mov r0, #0x19
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	strh r0, [r6]
_02052440:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205239C

	thumb_func_start sub_02052444
sub_02052444: ; 0x02052444
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	ldr r0, [r5, #0xc]
	bl Sav2_Bag_get
	ldr r0, [r5, #0xc]
	bl Sav2_Pokedex_get
	add r1, r0, #0
	mov r0, #0x11
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl Pokedex_copy
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02052444

	thumb_func_start sub_02052470
sub_02052470: ; 0x02052470
	push {r3, r4, r5, lr}
	ldr r2, [r0, #0x20]
	add r4, r1, #0
	ldr r1, [r2, #8]
	ldr r2, [r2, #0xc]
	bl GetMetatileBehaviorAt
	add r5, r0, #0
	bl sub_0205B828
	cmp r0, #0
	beq _0205248C
	mov r0, #8
	pop {r3, r4, r5, pc}
_0205248C:
	add r0, r5, #0
	bl sub_0205B6E8
	cmp r0, #0
	bne _020524A0
	add r0, r5, #0
	bl sub_0205B6F4
	cmp r0, #0
	beq _020524A4
_020524A0:
	mov r0, #2
	pop {r3, r4, r5, pc}
_020524A4:
	add r0, r5, #0
	bl sub_0205B798
	cmp r0, #0
	beq _020524B2
	mov r0, #1
	pop {r3, r4, r5, pc}
_020524B2:
	add r0, r5, #0
	bl sub_0205B8B8
	cmp r0, #0
	beq _020524C0
	mov r0, #6
	pop {r3, r4, r5, pc}
_020524C0:
	add r0, r5, #0
	bl sub_0205B8AC
	cmp r0, #0
	beq _020524CE
	mov r0, #0xa
	pop {r3, r4, r5, pc}
_020524CE:
	add r0, r5, #0
	bl sub_0205B8D0
	cmp r0, #0
	beq _020524DC
	mov r0, #5
	pop {r3, r4, r5, pc}
_020524DC:
	add r0, r5, #0
	bl sub_0205B778
	cmp r0, #0
	beq _020524EA
	mov r0, #7
	pop {r3, r4, r5, pc}
_020524EA:
	cmp r4, #0x17
	bhs _020524F6
	ldr r0, _02052500 ; =_020FC4C0
	lsl r1, r4, #2
	ldr r0, [r0, r1]
	pop {r3, r4, r5, pc}
_020524F6:
	bl GF_AssertFail
	mov r0, #0x18
	pop {r3, r4, r5, pc}
	nop
_02052500: .word _020FC4C0
	thumb_func_end sub_02052470

	thumb_func_start sub_02052504
sub_02052504: ; 0x02052504
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	bl Save_FlyPoints_get
	bl SaveFlyPoints_GetPlayerSub
	add r6, r0, #0
	ldr r0, [r4, #0x20]
	ldr r0, [r0]
	bl MapHeader_GetBattleBg
	mov r1, #0x53
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r6, #4]
	cmp r0, #2
	bne _0205252E
	mov r0, #1
	str r0, [r5, r1]
_0205252E:
	mov r1, #0x53
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	add r0, r4, #0
	bl sub_02052470
	mov r1, #0x15
	lsl r1, r1, #4
	str r0, [r5, r1]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02052504

	thumb_func_start sub_02052544
sub_02052544: ; 0x02052544
	mov r1, #0x15
	mov r2, #7
	lsl r1, r1, #4
	str r2, [r0, r1]
	mov r2, #1
	add r1, #0x80
	str r2, [r0, r1]
	bx lr
	thumb_func_end sub_02052544

	thumb_func_start IsBattleResultWin
IsBattleResultWin: ; 0x02052554
	cmp r0, #2
	beq _0205255C
	cmp r0, #3
	bne _02052560
_0205255C:
	mov r0, #0
	bx lr
_02052560:
	mov r0, #1
	bx lr
	thumb_func_end IsBattleResultWin

	thumb_func_start sub_02052564
sub_02052564: ; 0x02052564
	cmp r0, #1
	beq _0205256C
	cmp r0, #4
	bne _02052570
_0205256C:
	mov r0, #0
	bx lr
_02052570:
	mov r0, #1
	bx lr
	thumb_func_end sub_02052564

	thumb_func_start sub_02052574
sub_02052574: ; 0x02052574
	cmp r0, #4
	bne _0205257C
	mov r0, #0
	bx lr
_0205257C:
	mov r0, #1
	bx lr
	thumb_func_end sub_02052574

	thumb_func_start sub_02052580
sub_02052580: ; 0x02052580
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xf8
	ldr r0, [r0]
	bl PlayerProfile_GetTrainerGender
	add r1, r4, #0
	add r1, #0x29
	strb r0, [r1]
	add r0, r4, #0
	add r0, #0xf8
	ldr r0, [r0]
	bl PlayerProfile_GetNamePtr
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x3c
	bl CopyU16StringArray
	add r3, r4, #0
	add r3, #0x28
	add r4, #0x90
	mov r2, #6
_020525AE:
	ldmia r3!, {r0, r1}
	stmia r4!, {r0, r1}
	sub r2, r2, #1
	bne _020525AE
	ldr r0, [r3]
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end sub_02052580
