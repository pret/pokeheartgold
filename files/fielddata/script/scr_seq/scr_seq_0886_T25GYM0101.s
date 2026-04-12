#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25GYM0101.h"
#include "msgdata/msg/msg_0582_T25GYM0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T25GYM0101_000
	ScrDef scr_seq_T25GYM0101_001
	ScrDef scr_seq_T25GYM0101_002
	ScrDef scr_seq_T25GYM0101_003
	ScrDef scr_seq_T25GYM0101_004
	ScrDefEnd

scr_seq_T25GYM0101_004:
	GetPhoneBookRematch PHONE_CONTACT_WHITNEY, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _0106
	GoToIfUnset FLAG_GAME_CLEAR, _0100
	CheckRegisteredPhoneNumber PHONE_CONTACT_WHITNEY, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _00AF
	ScrCmd_522 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 12
	GoToIfNe _0062
	SetFlag FLAG_HIDE_GOLDENROD_GYM_WHITNEY
	GoTo _00AD

_0062:
	Compare VAR_TEMP_x4000, 13
	GoToIfNe _0079
	SetFlag FLAG_HIDE_GOLDENROD_GYM_WHITNEY
	GoTo _00AD

_0079:
	Compare VAR_TEMP_x4000, 14
	GoToIfNe _0090
	SetFlag FLAG_HIDE_GOLDENROD_GYM_WHITNEY
	GoTo _00AD

_0090:
	Compare VAR_TEMP_x4000, 15
	GoToIfNe _00A7
	SetFlag FLAG_HIDE_GOLDENROD_GYM_WHITNEY
	GoTo _00AD

_00A7:
	GoTo _0100

_00AD:
	End

_00AF:
	ScrCmd_522 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 18
	GoToIfNe _00CA
	SetFlag FLAG_HIDE_GOLDENROD_GYM_WHITNEY
	GoTo _00FE

_00CA:
	Compare VAR_TEMP_x4000, 19
	GoToIfNe _00E1
	SetFlag FLAG_HIDE_GOLDENROD_GYM_WHITNEY
	GoTo _00FE

_00E1:
	Compare VAR_TEMP_x4000, 20
	GoToIfNe _00F8
	SetFlag FLAG_HIDE_GOLDENROD_GYM_WHITNEY
	GoTo _00FE

_00F8:
	GoTo _0100

_00FE:
	End

_0100:
	ClearFlag FLAG_HIDE_GOLDENROD_GYM_WHITNEY
	End

_0106:
	SetFlag FLAG_HIDE_GOLDENROD_GYM_WHITNEY
	End

scr_seq_T25GYM0101_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_PLAIN, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0202
	GoToIfSet FLAG_UNK_0B7, _01A0
	Compare VAR_UNK_410A, 1
	GoToIfEq _017D
	NPCMsg msg_0582_T25GYM0101_00000
	CloseMsg
	TrainerBattle TRAINER_LEADER_WHITNEY, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0218
	SetTrainerFlag TRAINER_LASS_CARRIE
	SetTrainerFlag TRAINER_LASS_CATHY
	SetTrainerFlag TRAINER_BEAUTY_VICTORIA
	SetTrainerFlag TRAINER_BEAUTY_SAMANTHA
	AddSpecialGameStat SCORE_EVENT_BADGE_GET
	MovePersonFacing obj_T25GYM0101_gsgirl1, 13, 0, 15, DIR_NORTH
_017D:
	NPCMsg msg_0582_T25GYM0101_00002
	WaitButton
	CloseMsg
	ReleaseAll
	SetVar VAR_UNK_410A, 1
	SetFlag FLAG_UNK_084
	SetVar VAR_UNK_40DA, 1
	ClearFlag FLAG_HIDE_PARK_SOUTH_GATE_POKEATHLON_ENTHUSIASTS_UNLOCKED
	SetFlag FLAG_HIDE_PARK_SOUTH_GATE_POKEATHLON_ENTHUSIASTS_LOCKED
	End

_01A0:
	NPCMsg msg_0582_T25GYM0101_00003
	BufferPlayersName 0
	NPCMsg msg_0582_T25GYM0101_00004
	PlayFanfare SEQ_ME_BADGE
	WaitFanfare
	GiveBadge BADGE_PLAIN
	SetVar VAR_UNK_410A, 2
	ClearFlag FLAG_UNK_084
	SetFlag FLAG_UNK_998
	NPCMsg msg_0582_T25GYM0101_00005
_01C4:
	GoToIfNoItemSpace ITEM_TM45, 1, _01F8
	CallStd std_give_item_verbose
	NPCMsg msg_0582_T25GYM0101_00007
	WaitButton
	CloseMsg
	SetFlag FLAG_GOT_TM45_FROM_WHITNEY
	ReleaseAll
	End

_01F8:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_0202:
	GoToIfUnset FLAG_GOT_TM45_FROM_WHITNEY, _01C4
	NPCMsg msg_0582_T25GYM0101_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0218:
	WhiteOut
	ReleaseAll
	End

scr_seq_T25GYM0101_001:
	ScrCmd_609
	LockAll
	ApplyMovement obj_T25GYM0101_gsgirl1, _0260
	WaitMovement
	NPCMsg msg_0582_T25GYM0101_00009
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_T25GYM0101_gsgirl1, _026C
	ApplyMovement obj_player, _0278
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	SetFlag FLAG_UNK_0B7
	ReleaseAll
	End

	.balign 4, 0
_0260:
	EmoteExclamationMark
	WalkNormalNorth 3
	EndMovement

	.balign 4, 0
_026C:
	WalkNormalSouth 3
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0278:
	Delay8
	WalkNormalNorth
	EndMovement

scr_seq_T25GYM0101_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_PLAIN, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _02AA
	NPCMsg msg_0582_T25GYM0101_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

_02AA:
	NPCMsg msg_0582_T25GYM0101_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25GYM0101_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_PLAIN, VAR_SPECIAL_RESULT
	BufferPlayersName 0
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _02DC
	NPCMsg msg_0582_T25GYM0101_00012
	GoTo _02DF

_02DC:
	NPCMsg msg_0582_T25GYM0101_00013
_02DF:
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
