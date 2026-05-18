#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D11R0106.h"
#include "msgdata/msg/msg_0053_D11R0106.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D11R0106_000
	ScrDef scr_seq_D11R0106_001
	ScrDef scr_seq_D11R0106_002
	ScrDef scr_seq_D11R0106_003
	ScrDef scr_seq_D11R0106_004
	ScrDef scr_seq_D11R0106_005
	ScrDef scr_seq_D11R0106_006
	ScrDef scr_seq_D11R0106_007
	ScrDef scr_seq_D11R0106_008
	ScrDef scr_seq_D11R0106_009
	ScrDefEnd

scr_seq_D11R0106_009:
	GetPhoneBookRematch PHONE_CONTACT_BLAINE, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _00AB
	CheckRegisteredPhoneNumber PHONE_CONTACT_BLAINE, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _008A
	CheckBadge BADGE_EARTH, VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 1
	GoToIfEq _0069
	ClearFlag FLAG_HIDE_SEAFOAM_GYM_BLAINE
	End

_0069:
	GetWeekday VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 2
	GoToIfNe _0084
	SetFlag FLAG_HIDE_SEAFOAM_GYM_BLAINE
	GoTo _0088

_0084:
	ClearFlag FLAG_HIDE_SEAFOAM_GYM_BLAINE
_0088:
	End

_008A:
	GetWeekday VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 4
	GoToIfNe _00A5
	SetFlag FLAG_HIDE_SEAFOAM_GYM_BLAINE
	GoTo _00A9

_00A5:
	ClearFlag FLAG_HIDE_SEAFOAM_GYM_BLAINE
_00A9:
	End

_00AB:
	SetFlag FLAG_HIDE_SEAFOAM_GYM_BLAINE
	End

scr_seq_D11R0106_008:
	CallIfSet FLAG_UNK_13B, _00D4
	CallIfSet FLAG_UNK_13D, _00E2
	CallIfSet FLAG_UNK_13E, _00F0
	End

_00D4:
	MovePersonFacing obj_D11R0106_gsassistantm, 21, 0, 14, DIR_WEST
	Return

_00E2:
	MovePersonFacing obj_D11R0106_gsassistantm_3, 9, 0, 13, DIR_NORTH
	Return

_00F0:
	MovePersonFacing obj_D11R0106_assistantm, 15, 0, 16, DIR_SOUTH
	Return

scr_seq_D11R0106_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_VOLCANO, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _01B6
	NPCMsg msg_0053_D11R0106_00000
	CloseMsg
	TrainerBattle TRAINER_LEADER_BLAINE_BLAINE, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01CC
	GiveBadge BADGE_VOLCANO
	AddVar VAR_UNK_4135, 1
	SetFlag FLAG_UNK_265
	SetFlag FLAG_HIDE_ROUTE_19_WORKMEN_CLOSED
	ClearFlag FLAG_HIDE_ROUTE_19_WORKMEN_OPEN
	AddSpecialGameStat SCORE_EVENT_BADGE_GET
	SetFlag FLAG_UNK_13F
	SetFlag FLAG_UNK_140
	SetFlag FLAG_UNK_13C
	NPCMsg msg_0053_D11R0106_00001
	BufferPlayersName 0
	NPCMsg msg_0053_D11R0106_00002
	PlayFanfare SEQ_ME_BADGE
	WaitFanfare
	NPCMsg msg_0053_D11R0106_00003
	GoTo _0175

_0175:
	GoToIfNoItemSpace ITEM_TM50, 1, _01AC
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_TM50_FROM_BLAINE
	BufferPlayersName 0
	NPCMsg msg_0053_D11R0106_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01AC:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_01B6:
	GoToIfUnset FLAG_GOT_TM50_FROM_BLAINE, _0175
	NPCMsg msg_0053_D11R0106_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01CC:
	WhiteOut
	ReleaseAll
	End

scr_seq_D11R0106_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_13B, _021A
	NPCMsg msg_0053_D11R0106_00006
	CloseMsg
	TrainerBattle TRAINER_SUPER_NERD_CARY, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01CC
	NPCMsg msg_0053_D11R0106_00008
	CloseMsg
	ApplyMovement obj_D11R0106_gsassistantm, _0424
	WaitMovement
	SetFlag FLAG_UNK_13B
	ReleaseAll
	End

_021A:
	NPCMsg msg_0053_D11R0106_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D11R0106_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_13C, _028C
	NPCMsg msg_0053_D11R0106_00009
	CloseMsg
	TrainerBattle TRAINER_SUPER_NERD_WALDO, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01CC
	NPCMsg msg_0053_D11R0106_00011
	CloseMsg
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _027A
	ApplyMovement obj_D11R0106_gsassistantm_2, _043C
	GoTo _0282

_027A:
	ApplyMovement obj_D11R0106_gsassistantm_2, _0430
_0282:
	WaitMovement
	SetFlag FLAG_UNK_13C
	ReleaseAll
	End

_028C:
	NPCMsg msg_0053_D11R0106_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D11R0106_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_13D, _02DF
	NPCMsg msg_0053_D11R0106_00012
	CloseMsg
	TrainerBattle TRAINER_SUPER_NERD_MERLE, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01CC
	NPCMsg msg_0053_D11R0106_00014
	CloseMsg
	ApplyMovement obj_D11R0106_gsassistantm_3, _0448
	WaitMovement
	SetFlag FLAG_UNK_13D
	ReleaseAll
	End

_02DF:
	NPCMsg msg_0053_D11R0106_00013
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D11R0106_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_13E, _0332
	NPCMsg msg_0053_D11R0106_00015
	CloseMsg
	TrainerBattle TRAINER_SCIENTIST_GS_LOWELL, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01CC
	NPCMsg msg_0053_D11R0106_00017
	CloseMsg
	ApplyMovement obj_D11R0106_assistantm, _0454
	WaitMovement
	SetFlag FLAG_UNK_13E
	ReleaseAll
	End

_0332:
	NPCMsg msg_0053_D11R0106_00016
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D11R0106_006:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_13F, _03A4
	NPCMsg msg_0053_D11R0106_00018
	CloseMsg
	TrainerBattle TRAINER_SCIENTIST_GS_LINDEN, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01CC
	NPCMsg msg_0053_D11R0106_00020
	CloseMsg
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _0392
	ApplyMovement obj_D11R0106_assistantm_2, _046C
	GoTo _039A

_0392:
	ApplyMovement obj_D11R0106_assistantm_2, _0460
_039A:
	WaitMovement
	SetFlag FLAG_UNK_13F
	ReleaseAll
	End

_03A4:
	NPCMsg msg_0053_D11R0106_00019
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D11R0106_007:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_140, _0416
	NPCMsg msg_0053_D11R0106_00021
	CloseMsg
	TrainerBattle TRAINER_SCIENTIST_GS_DANIEL, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01CC
	NPCMsg msg_0053_D11R0106_00023
	CloseMsg
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfNe _0404
	ApplyMovement obj_D11R0106_assistantm_3, _0478
	GoTo _040C

_0404:
	ApplyMovement obj_D11R0106_assistantm_3, _0484
_040C:
	WaitMovement
	SetFlag FLAG_UNK_140
	ReleaseAll
	End

_0416:
	NPCMsg msg_0053_D11R0106_00022
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0424:
	WalkNormalEast
	FaceWest
	EndMovement

	.balign 4, 0
_0430:
	WalkNormalSouth
	FaceNorth
	EndMovement

	.balign 4, 0
_043C:
	WalkNormalNorth
	FaceSouth
	EndMovement

	.balign 4, 0
_0448:
	WalkNormalSouth
	FaceNorth
	EndMovement

	.balign 4, 0
_0454:
	WalkNormalNorth
	FaceSouth
	EndMovement

	.balign 4, 0
_0460:
	WalkNormalWest
	FaceEast
	EndMovement

	.balign 4, 0
_046C:
	WalkNormalEast
	FaceWest
	EndMovement

	.balign 4, 0
_0478:
	WalkNormalWest
	FaceEast
	EndMovement

	.balign 4, 0
_0484:
	WalkNormalEast
	FaceWest
	EndMovement

scr_seq_D11R0106_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_VOLCANO, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _04B6
	NPCMsg msg_0053_D11R0106_00024
	WaitButton
	CloseMsg
	ReleaseAll
	End

_04B6:
	NPCMsg msg_0053_D11R0106_00025
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
