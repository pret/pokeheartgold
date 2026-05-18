#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R0401.h"
#include "msgdata/msg/msg_0586_T25R0401.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T25R0401_000
	ScrDef scr_seq_T25R0401_001
	ScrDef scr_seq_T25R0401_002
	ScrDefEnd

scr_seq_T25R0401_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GOT_EEVEE_FROM_BILL, _00E9
	BufferPlayersName 0
	NPCMsg msg_0586_T25R0401_00000
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _004B
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _00D3
	End

_004B:
	GetPartyCount VAR_SPECIAL_x8005
	Compare VAR_SPECIAL_x8005, 6
	GoToIfEq _00DE
	NPCMsg msg_0586_T25R0401_00001
	GiveMon SPECIES_EEVEE, 5, 0, 0, 0, VAR_SPECIAL_RESULT
	SetFlag FLAG_GOT_EEVEE_FROM_BILL
	BufferPlayersName 0
	NPCMsg msg_0586_T25R0401_00002
	PlayFanfare SEQ_ME_POKEGET
	WaitFanfare
	NPCMsg msg_0586_T25R0401_00007
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _00A0
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfGe _00C6
_00A0:
	CloseMsg
	SetVar VAR_TEMP_x4000, 0
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	NicknameInput VAR_SPECIAL_x8005, VAR_TEMP_x4000
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_00C6:
	NPCMsg msg_0586_T25R0401_00003
	WaitButton
	CloseMsg
	TouchscreenMenuShow
	ReleaseAll
	End

_00D3:
	NPCMsg msg_0586_T25R0401_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00DE:
	NPCMsg msg_0586_T25R0401_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00E9:
	NPCMsg msg_0586_T25R0401_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25R0401_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNK_410D, 1
	GoToIfEq _0114
	NPCMsg msg_0586_T25R0401_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0114:
	NPCMsg msg_0586_T25R0401_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25R0401_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckRegisteredPhoneNumber PHONE_CONTACT_BILL, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _019C
	Compare VAR_UNK_410D, 1
	GoToIfEq _0152
	NPCMsg msg_0586_T25R0401_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0152:
	NPCMsg msg_0586_T25R0401_00012
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0179
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0191
	End

_0179:
	BufferPlayersName 0
	NPCMsg msg_0586_T25R0401_00013
	RegisterGearNumber PHONE_CONTACT_BILL
	PlayFanfare SEQ_ME_POKEGEAR_REGIST
	WaitFanfare
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0191:
	NPCMsg msg_0586_T25R0401_00015
	WaitButton
	CloseMsg
	ReleaseAll
	End

_019C:
	NPCMsg msg_0586_T25R0401_00015
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
