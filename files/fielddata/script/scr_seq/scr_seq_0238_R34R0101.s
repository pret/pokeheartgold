#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R34R0101.h"
#include "msgdata/msg/msg_0385_R34R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R34R0101_000
	ScrDef scr_seq_R34R0101_001
	ScrDefEnd

scr_seq_R34R0101_001:
	ScrCmd_609
	LockAll
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_R34R0101_var_1, _0140
	ApplyMovement obj_R34R0101_tsure_poke_static_marill, _014C
	ApplyMovement obj_player, _0158
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	BufferPlayersName 0
	GenderMsgBox msg_0385_R34R0101_00000, msg_0385_R34R0101_00010
	CloseMsg
	GenderMsgBox msg_0385_R34R0101_00001, msg_0385_R34R0101_00011
	CloseMsg
	ApplyMovement obj_R34R0101_var_1, _0138
	WaitMovement
	GenderMsgBox msg_0385_R34R0101_00002, msg_0385_R34R0101_00012
	CloseMsg
	GenderMsgBox msg_0385_R34R0101_00003, msg_0385_R34R0101_00013
	CloseMsg
	ApplyMovement obj_R34R0101_var_1, _0164
	WaitMovement
	GenderMsgBox msg_0385_R34R0101_00004, msg_0385_R34R0101_00014
	CloseMsg
	ApplyMovement obj_R34R0101_var_1, _016C
	ApplyMovement obj_R34R0101_tsure_poke_static_marill, _0184
	WaitMovement
	GenderMsgBox msg_0385_R34R0101_00005, msg_0385_R34R0101_00015
	CloseMsg
	ApplyMovement obj_R34R0101_var_1, _0198
	ApplyMovement obj_R34R0101_tsure_poke_static_marill, _01A8
	WaitMovement
	ApplyMovement obj_player, _0190
	WaitMovement
	GenderMsgBox msg_0385_R34R0101_00006, msg_0385_R34R0101_00016
	CloseMsg
	GetPlayerGender VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _00C6
	RegisterGearNumber PHONE_CONTACT_LYRA
	GoTo _00CA

_00C6:
	RegisterGearNumber PHONE_CONTACT_ETHAN
_00CA:
	BufferPlayersName 0
	GenderMsgBox msg_0385_R34R0101_00007, msg_0385_R34R0101_00017
	PlayFanfare SEQ_ME_POKEGEAR_REGIST
	WaitFanfare
	ApplyMovement obj_R34R0101_var_1, _01BC
	WaitMovement
	GenderMsgBox msg_0385_R34R0101_00008, msg_0385_R34R0101_00018
	CloseMsg
	ApplyMovement obj_R34R0101_var_1, _01C4
	ApplyMovement obj_R34R0101_tsure_poke_static_marill, _01CC
	WaitMovement
	GenderMsgBox msg_0385_R34R0101_00009, msg_0385_R34R0101_00019
	CloseMsg
	ApplyMovement obj_R34R0101_var_1, _01D4
	ApplyMovement obj_R34R0101_tsure_poke_static_marill, _01E8
	ApplyMovement obj_player, _0204
	WaitMovement
	PlaySE SEQ_SE_DP_KAIDAN2
	HidePerson obj_R34R0101_var_1
	HidePerson obj_R34R0101_tsure_poke_static_marill
	WaitSE SEQ_SE_DP_KAIDAN2
	SetVar VAR_UNK_408E, 2
	SetFlag FLAG_UNK_22D
	ReleaseAll
	End

	.balign 4, 0
_0138:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0140:
	Delay8
	WalkNormalNorth 3
	EndMovement

	.balign 4, 0
_014C:
	WalkFastNorth 3
	JumpOnSpotFastNorth 2
	EndMovement

	.balign 4, 0
_0158:
	Delay8
	WalkNormalNorth 3
	EndMovement

	.balign 4, 0
_0164:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_016C:
	WalkNormalWest
	WalkNormalSouth 3
	Delay8
	EmoteExclamationMark
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0184:
	WalkNormalWest 2
	WalkNormalSouth 2
	EndMovement

	.balign 4, 0
_0190:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0198:
	Delay8
	WalkNormalNorth
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_01A8:
	WalkOnSpotNormalEast
	LockDir
	JumpNearFastWest
	UnlockDir
	EndMovement

	.balign 4, 0
_01BC:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_01C4:
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_01CC:
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_01D4:
	WalkNormalSouth 2
	WalkNormalEast
	WalkNormalSouth
	SetInvisible
	EndMovement

	.balign 4, 0
_01E8:
	Delay8
	JumpOnSpotFastNorth 2
	Delay8
	WalkFastSouth 3
	WalkFastEast 2
	WalkOnSpotFastSouth
	EndMovement

	.balign 4, 0
_0204:
	Delay8 2
	WalkOnSpotNormalSouth
	EndMovement

scr_seq_R34R0101_000:
	UpdateDaycareMonObjects
	End
	.balign 4, 0
