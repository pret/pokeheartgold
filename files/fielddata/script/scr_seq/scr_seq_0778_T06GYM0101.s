#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T06GYM0101.h"
#include "msgdata/msg/msg_0485_T06GYM0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T06GYM0101_000
	ScrDef scr_seq_T06GYM0101_001
	ScrDef scr_seq_T06GYM0101_002
	ScrDef scr_seq_T06GYM0101_003
	ScrDef scr_seq_T06GYM0101_004
	ScrDef scr_seq_T06GYM0101_005
	ScrDef scr_seq_T06GYM0101_006
	ScrDef scr_seq_T06GYM0101_007
	ScrDef scr_seq_T06GYM0101_008
	ScrDef scr_seq_T06GYM0101_009
	ScrDef scr_seq_T06GYM0101_010
	ScrDef scr_seq_T06GYM0101_011
	ScrDef scr_seq_T06GYM0101_012
	ScrDef scr_seq_T06GYM0101_013
	ScrDef scr_seq_T06GYM0101_014
	ScrDef scr_seq_T06GYM0101_015
	ScrDef scr_seq_T06GYM0101_016
	ScrDef scr_seq_T06GYM0101_017
	ScrDef scr_seq_T06GYM0101_018
	ScrDef scr_seq_T06GYM0101_019
	ScrDef scr_seq_T06GYM0101_020
	ScrDef scr_seq_T06GYM0101_021
	ScrDef scr_seq_T06GYM0101_022
	ScrDef scr_seq_T06GYM0101_023
	ScrDef scr_seq_T06GYM0101_024
	ScrDef scr_seq_T06GYM0101_025
	ScrDefEnd

scr_seq_T06GYM0101_021:
	GoToIfSet FLAG_HIDE_VERMILION_GYM_STOPS, _0079
	ClearFlag FLAG_SYS_SOLVED_LT_SURGE_GYM
_0079:
	VermilionGymInit
	GetPhoneBookRematch PHONE_CONTACT_LT__SURGE, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _014A
	GoToIfUnset FLAG_CAUGHT_ZAPDOS, _0144
	CheckRegisteredPhoneNumber PHONE_CONTACT_LT__SURGE, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _00FB
	ScrCmd_522 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 9
	GoToIfNe _00C7
	SetFlag FLAG_HIDE_VERMILION_GYM_LT_SURGE
	GoTo _00F9

_00C7:
	Compare VAR_TEMP_x4000, 10
	GoToIfNe _00DE
	SetFlag FLAG_HIDE_VERMILION_GYM_LT_SURGE
	GoTo _00F9

_00DE:
	Compare VAR_TEMP_x4000, 11
	GoToIfNe _00F5
	SetFlag FLAG_HIDE_VERMILION_GYM_LT_SURGE
	GoTo _00F9

_00F5:
	ClearFlag FLAG_HIDE_VERMILION_GYM_LT_SURGE
_00F9:
	End

_00FB:
	GoToIfSet FLAG_TRADE_LT_SURGE_PIKACHU, _010C
	SetFlag FLAG_HIDE_VERMILION_GYM_LT_SURGE
	End

_010C:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 5
	GoToIfNe _0127
	SetFlag FLAG_HIDE_VERMILION_GYM_LT_SURGE
	GoTo _0142

_0127:
	Compare VAR_TEMP_x4000, 6
	GoToIfNe _013E
	SetFlag FLAG_HIDE_VERMILION_GYM_LT_SURGE
	GoTo _0142

_013E:
	ClearFlag FLAG_HIDE_VERMILION_GYM_LT_SURGE
_0142:
	End

_0144:
	ClearFlag FLAG_HIDE_VERMILION_GYM_LT_SURGE
	End

_014A:
	SetFlag FLAG_HIDE_VERMILION_GYM_LT_SURGE
	End

scr_seq_T06GYM0101_022:
	GoToIfSet FLAG_HIDE_VERMILION_GYM_STOPS, _0175
	MakeObjectVisible obj_T06GYM0101_stop
	MakeObjectVisible obj_T06GYM0101_stop_2
	MakeObjectVisible obj_T06GYM0101_stop_3
	MakeObjectVisible obj_T06GYM0101_stop_4
	MakeObjectVisible obj_T06GYM0101_stop_5
	MakeObjectVisible obj_T06GYM0101_stop_6
	End

_0175:
	End

scr_seq_T06GYM0101_000:
	VermilionGymCanCheck 0, VAR_SPECIAL_RESULT
	GoTo _023A
	End

scr_seq_T06GYM0101_001:
	VermilionGymCanCheck 1, VAR_SPECIAL_RESULT
	GoTo _023A
	End

scr_seq_T06GYM0101_002:
	VermilionGymCanCheck 2, VAR_SPECIAL_RESULT
	GoTo _023A
	End

scr_seq_T06GYM0101_003:
	VermilionGymCanCheck 3, VAR_SPECIAL_RESULT
	GoTo _023A
	End

scr_seq_T06GYM0101_004:
	VermilionGymCanCheck 4, VAR_SPECIAL_RESULT
	GoTo _023A
	End

scr_seq_T06GYM0101_005:
	VermilionGymCanCheck 5, VAR_SPECIAL_RESULT
	GoTo _023A
	End

scr_seq_T06GYM0101_006:
	VermilionGymCanCheck 6, VAR_SPECIAL_RESULT
	GoTo _023A
	End

scr_seq_T06GYM0101_007:
	VermilionGymCanCheck 7, VAR_SPECIAL_RESULT
	GoTo _023A
	End

scr_seq_T06GYM0101_008:
	VermilionGymCanCheck 8, VAR_SPECIAL_RESULT
	GoTo _023A
	End

scr_seq_T06GYM0101_009:
	VermilionGymCanCheck 9, VAR_SPECIAL_RESULT
	GoTo _023A
	End

scr_seq_T06GYM0101_010:
	VermilionGymCanCheck 10, VAR_SPECIAL_RESULT
	GoTo _023A
	End

scr_seq_T06GYM0101_011:
	VermilionGymCanCheck 11, VAR_SPECIAL_RESULT
	GoTo _023A
	End

scr_seq_T06GYM0101_012:
	VermilionGymCanCheck 12, VAR_SPECIAL_RESULT
	GoTo _023A
	End

scr_seq_T06GYM0101_013:
	VermilionGymCanCheck 13, VAR_SPECIAL_RESULT
	GoTo _023A
	End

scr_seq_T06GYM0101_014:
	VermilionGymCanCheck 14, VAR_SPECIAL_RESULT
	GoTo _023A
	End

_023A:
	Compare VAR_SPECIAL_RESULT, 4
	GoToIfEq _027D
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfEq _02AA
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _028E
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfEq _02CE
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _02E5
	End

_027D:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0485_T06GYM0101_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_028E:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0485_T06GYM0101_00009
	WaitButton
	CloseMsg
	VermilionGymLockAction 0, 0
	NPCMsg msg_0485_T06GYM0101_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

_02AA:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0485_T06GYM0101_00009
	WaitButton
	CloseMsg
	VermilionGymLockAction 1, 0
	SetFlag FLAG_SYS_SOLVED_LT_SURGE_GYM
	StopSE SEQ_SE_GS_DENGEKIBARIA
	NPCMsg msg_0485_T06GYM0101_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

_02CE:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0485_T06GYM0101_00010
	WaitButton
	CloseMsg
	VermilionGymLockAction 0, 1
	ResampleVermilionGymCans
	ReleaseAll
	End

_02E5:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0485_T06GYM0101_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T06GYM0101_015:
	End

scr_seq_T06GYM0101_016:
	End

scr_seq_T06GYM0101_017:
	End

scr_seq_T06GYM0101_018:
	End

scr_seq_T06GYM0101_019:
	End

scr_seq_T06GYM0101_020:
	End

scr_seq_T06GYM0101_023:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_THUNDER, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _03C7
	NPCMsg msg_0485_T06GYM0101_00000
	CloseMsg
	TrainerBattle TRAINER_LEADER_LT_SURGE_LT__SURGE, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _03DD
	GiveBadge BADGE_THUNDER
	AddVar VAR_UNK_4135, 1
	AddSpecialGameStat SCORE_EVENT_BADGE_GET
	SetFlag FLAG_HIDE_VERMILION_GYM_STOPS
	HidePerson obj_T06GYM0101_stop
	HidePerson obj_T06GYM0101_stop_2
	HidePerson obj_T06GYM0101_stop_3
	HidePerson obj_T06GYM0101_stop_4
	HidePerson obj_T06GYM0101_stop_5
	HidePerson obj_T06GYM0101_stop_6
	SetTrainerFlag TRAINER_GUITARIST_VINCENT
	SetTrainerFlag TRAINER_GENTLEMAN_GREGORY
	SetTrainerFlag TRAINER_JUGGLER_HORTON
	NPCMsg msg_0485_T06GYM0101_00001
	BufferPlayersName 0
	NPCMsg msg_0485_T06GYM0101_00002
	PlayFanfare SEQ_ME_BADGE
	WaitFanfare
	NPCMsg msg_0485_T06GYM0101_00003
	GoTo _0389

_0389:
	GoToIfNoItemSpace ITEM_TM34, 1, _03BD
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_TM34_FROM_LT_SURGE
	NPCMsg msg_0485_T06GYM0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_03BD:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_03C7:
	GoToIfUnset FLAG_GOT_TM34_FROM_LT_SURGE, _0389
	NPCMsg msg_0485_T06GYM0101_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_03DD:
	WhiteOut
	ReleaseAll
	End

scr_seq_T06GYM0101_024:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_THUNDER, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0409
	NPCMsg msg_0485_T06GYM0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0409:
	NPCMsg msg_0485_T06GYM0101_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T06GYM0101_025:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_THUNDER, VAR_SPECIAL_RESULT
	BufferPlayersName 0
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _043B
	NPCMsg msg_0485_T06GYM0101_00013
	GoTo _043E

_043B:
	NPCMsg msg_0485_T06GYM0101_00014
_043E:
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
