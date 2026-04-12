#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T23GYM0102.h"
#include "msgdata/msg/msg_0567_T23GYM0102.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T23GYM0102_000
	ScrDef scr_seq_T23GYM0102_001
	ScrDef scr_seq_T23GYM0102_002
	ScrDef scr_seq_T23GYM0102_003
	ScrDef scr_seq_T23GYM0102_004
	ScrDef scr_seq_T23GYM0102_005
	ScrDef scr_seq_T23GYM0102_006
	ScrDef scr_seq_T23GYM0102_007
	ScrDef scr_seq_T23GYM0102_008
	ScrDef scr_seq_T23GYM0102_009
	ScrDef scr_seq_T23GYM0102_010
	ScrDef scr_seq_T23GYM0102_011
	ScrDef scr_seq_T23GYM0102_012
	ScrDef scr_seq_T23GYM0102_013
	ScrDef scr_seq_T23GYM0102_014
	ScrDef scr_seq_T23GYM0102_015
	ScrDef scr_seq_T23GYM0102_016
	ScrDefEnd

scr_seq_T23GYM0102_016:
	AzaleaGymInit
	GetPhoneBookRematch PHONE_CONTACT_BUGSY, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _00CD
	GoToIfSet FLAG_GAME_CLEAR, _006C
	ClearFlag FLAG_HIDE_AZALEA_GYM_BUGSY
	End

_006C:
	CheckRegisteredPhoneNumber PHONE_CONTACT_BUGSY, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _0096
	GetWeekday VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 4
	GoToIfNe _0096
	SetFlag FLAG_HIDE_AZALEA_GYM_BUGSY
	End

_0096:
	GetWeekday VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _00C7
	Compare VAR_TEMP_x4001, 3
	GoToIfEq _00C7
	Compare VAR_TEMP_x4001, 5
	GoToIfEq _00C7
	ClearFlag FLAG_HIDE_AZALEA_GYM_BUGSY
	End

_00C7:
	SetFlag FLAG_HIDE_AZALEA_GYM_BUGSY
	End

_00CD:
	SetFlag FLAG_HIDE_AZALEA_GYM_BUGSY
	End

scr_seq_T23GYM0102_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_HIVE, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _017A
	NPCMsg msg_0567_T23GYM0102_00000
	CloseMsg
	TrainerBattle TRAINER_LEADER_BUGSY_BUGSY, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0174
	NPCMsg msg_0567_T23GYM0102_00001
	BufferPlayersName 0
	NPCMsg msg_0567_T23GYM0102_00002
	PlayFanfare SEQ_ME_BADGE
	WaitFanfare
	GiveBadge BADGE_HIVE
	SetTrainerFlag TRAINER_BUG_CATCHER_AL
	SetTrainerFlag TRAINER_BUG_CATCHER_BENNY
	SetTrainerFlag TRAINER_BUG_CATCHER_JOSH
	SetTrainerFlag TRAINER_TWINS_AMY_AND_MIMI
	AddSpecialGameStat SCORE_EVENT_BADGE_GET
	NPCMsg msg_0567_T23GYM0102_00003
_0136:
	GoToIfNoItemSpace ITEM_TM89, 1, _016A
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_TM89_FROM_BUGSY
	NPCMsg msg_0567_T23GYM0102_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_016A:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_0174:
	WhiteOut
	ReleaseAll
	End

_017A:
	GoToIfUnset FLAG_GOT_TM89_FROM_BUGSY, _0136
	NPCMsg msg_0567_T23GYM0102_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T23GYM0102_000:
	End

scr_seq_T23GYM0102_002:
	AzaleaGymSpinarak 0
	End

scr_seq_T23GYM0102_003:
	AzaleaGymSpinarak 1
	End

scr_seq_T23GYM0102_004:
	AzaleaGymSpinarak 2
	End

scr_seq_T23GYM0102_005:
	AzaleaGymSpinarak 3
	End

scr_seq_T23GYM0102_006:
	AzaleaGymSpinarak 4
	End

scr_seq_T23GYM0102_007:
	AzaleaGymSpinarak 5
	End

scr_seq_T23GYM0102_008:
	AzaleaGymSpinarak 6
	End

scr_seq_T23GYM0102_009:
	AzaleaGymSpinarak 7
	End

scr_seq_T23GYM0102_010:
	AzaleaGymSpinarak 8
	End

scr_seq_T23GYM0102_011:
	AzaleaGymSpinarak 9
	End

scr_seq_T23GYM0102_012:
	AzaleaGymSpinarak 10
	End

scr_seq_T23GYM0102_013:
	AzaleaGymSpinarak 11
	End

scr_seq_T23GYM0102_014:
	AzaleaGymSwitch 0
	End

scr_seq_T23GYM0102_015:
	AzaleaGymSwitch 1
	End
	.balign 4, 0
