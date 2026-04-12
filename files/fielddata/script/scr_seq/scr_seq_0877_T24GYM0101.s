#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T24GYM0101.h"
#include "msgdata/msg/msg_0574_T24GYM0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T24GYM0101_000
	ScrDef scr_seq_T24GYM0101_001
	ScrDef scr_seq_T24GYM0101_002
	ScrDef scr_seq_T24GYM0101_003
	ScrDefEnd

scr_seq_T24GYM0101_001:
	CianwoodGymInit
	ClearFlag FLAG_SYS_CIANWOOD_WATERFALL_DISABLE
	End

scr_seq_T24GYM0101_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_TEMP_x4000, 0
	GoToIfEq _010A
	CheckBadge BADGE_STORM, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _00EE
	NPCMsg msg_0574_T24GYM0101_00000
	CloseMsg
	TrainerBattle TRAINER_LEADER_CHUCK_CHUCK, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0104
	NPCMsg msg_0574_T24GYM0101_00003
	SetTrainerFlag TRAINER_BLACK_BELT_YOSHI
	SetTrainerFlag TRAINER_BLACK_BELT_LAO
	SetTrainerFlag TRAINER_BLACK_BELT_NOB
	SetTrainerFlag TRAINER_BLACK_BELT_LUNG
	BufferPlayersName 0
	NPCMsg msg_0574_T24GYM0101_00004
	GiveBadge BADGE_STORM
	PlayFanfare SEQ_ME_BADGE
	WaitFanfare
	AddVar VAR_MIDGAME_BADGES, 1
	AddSpecialGameStat SCORE_EVENT_BADGE_GET
	SetVar VAR_UNK_4116, 1
	Compare VAR_MIDGAME_BADGES, 3
	GoToIfNe _00A6
	SetVar VAR_SCENE_ROCKET_TAKEOVER, 1
_00A6:
	NPCMsg msg_0574_T24GYM0101_00005
	GoTo _00AF

_00AF:
	GoToIfNoItemSpace ITEM_TM01, 1, _00E3
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_TM01_FROM_CHUCK
	NPCMsg msg_0574_T24GYM0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00E3:
	NPCMsg msg_0574_T24GYM0101_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00EE:
	GoToIfUnset FLAG_GOT_TM01_FROM_CHUCK, _00AF
	NPCMsg msg_0574_T24GYM0101_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0104:
	WhiteOut
	ReleaseAll
	End

_010A:
	NPCMsg msg_0574_T24GYM0101_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T24GYM0101_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_TEMP_x4000, 0
	GoToIfEq _0135
	NPCMsg msg_0574_T24GYM0101_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0135:
	NPCMsg msg_0574_T24GYM0101_00010
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0153
	CloseMsg
	ReleaseAll
	End

_0153:
	BufferPlayersName 0
	NPCMsg msg_0574_T24GYM0101_00011
	CloseMsg
	SetFlag FLAG_SYS_CIANWOOD_WATERFALL_DISABLE
	StopSE SEQ_SE_GS_N_TAKI
	PlaySE SEQ_SE_DP_SHIP03
	PlaySE SEQ_SE_GS_TAKI2
	CianwoodGymTurnWinch VAR_TEMP_x4000
	ReleaseAll
	End

scr_seq_T24GYM0101_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_STORM, VAR_SPECIAL_RESULT
	BufferPlayersName 0
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _019A
	NPCMsg msg_0574_T24GYM0101_00013
	GoTo _019D

_019A:
	NPCMsg msg_0574_T24GYM0101_00014
_019D:
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
