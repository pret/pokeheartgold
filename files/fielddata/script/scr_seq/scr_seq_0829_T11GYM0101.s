#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T11GYM0101.h"
#include "msgdata/msg/msg_0531_T11GYM0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T11GYM0101_000
	ScrDef scr_seq_T11GYM0101_001
	ScrDef scr_seq_T11GYM0101_002
	ScrDef scr_seq_T11GYM0101_003
	ScrDef scr_seq_T11GYM0101_004
	ScrDefEnd

scr_seq_T11GYM0101_004:
	GetPhoneBookRematch PHONE_CONTACT_SABRINA, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _0089
	CheckRegisteredPhoneNumber PHONE_CONTACT_SABRINA, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _006C
	CheckBadge BADGE_MARSH, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1
	GoToIfEq _0055
	GoTo _0083

_0055:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 5
	GoToIfNe _0083
	SetFlag FLAG_HIDE_SAFFRON_GYM_SABRINA
	End

_006C:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1
	GoToIfNe _0083
	SetFlag FLAG_HIDE_SAFFRON_GYM_SABRINA
	End

_0083:
	ClearFlag FLAG_HIDE_SAFFRON_GYM_SABRINA
	End

_0089:
	SetFlag FLAG_HIDE_SAFFRON_GYM_SABRINA
	End

scr_seq_T11GYM0101_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_MARSH, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0140
	NPCMsg msg_0531_T11GYM0101_00000
	CloseMsg
	TrainerBattle TRAINER_LEADER_SABRINA_SABRINA, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0156
	GiveBadge BADGE_MARSH
	AddVar VAR_UNK_4135, 1
	AddSpecialGameStat SCORE_EVENT_BADGE_GET
	SetFlag FLAG_UNK_998
	SetTrainerFlag TRAINER_PSYCHIC_M_FRANKLIN
	SetTrainerFlag TRAINER_PSYCHIC_M_JARED
	SetTrainerFlag TRAINER_MEDIUM_REBECCA
	SetTrainerFlag TRAINER_MEDIUM_DARCY
	NPCMsg msg_0531_T11GYM0101_00001
	BufferPlayersName 0
	NPCMsg msg_0531_T11GYM0101_00002
	PlayFanfare SEQ_ME_BADGE
	WaitFanfare
	NPCMsg msg_0531_T11GYM0101_00003
	GoTo _0102

_0102:
	GoToIfNoItemSpace ITEM_TM48, 1, _0136
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_TM48_FROM_SABRINA
	NPCMsg msg_0531_T11GYM0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0136:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_0140:
	GoToIfUnset FLAG_GOT_TM48_FROM_SABRINA, _0102
	NPCMsg msg_0531_T11GYM0101_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0156:
	WhiteOut
	ReleaseAll
	End

scr_seq_T11GYM0101_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_MARSH, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0182
	NPCMsg msg_0531_T11GYM0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0182:
	NPCMsg msg_0531_T11GYM0101_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T11GYM0101_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_MARSH, VAR_SPECIAL_RESULT
	BufferPlayersName 0
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _01B4
	NPCMsg msg_0531_T11GYM0101_00008
	GoTo _01B7

_01B4:
	NPCMsg msg_0531_T11GYM0101_00009
_01B7:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T11GYM0101_003:
	ScrCmd_609
	LockAll
	ScrCmd_600
	PlaySE SEQ_SE_PL_BOWABOWA
	ApplyMovement obj_player, _01FC
	WaitMovement
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_SAFFRON_GYM, 0, 15, 23, DIR_SOUTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

	.balign 4, 0
_01FC:
	FaceSouth 2
	FaceWest 2
	FaceNorth 2
	FaceEast 2
	FaceSouth 2
	FaceWest 2
	FaceNorth 2
	FaceEast 2
	FaceSouth 2
	FaceWest 2
	FaceNorth 2
	FaceEast 2
	FaceSouth 2
	FaceWest 2
	FaceNorth 2
	FaceEast
	SetInvisible 0
	EndMovement
	.balign 4, 0
