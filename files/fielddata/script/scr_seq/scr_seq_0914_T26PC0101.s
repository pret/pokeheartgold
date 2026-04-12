#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T26PC0101.h"
#include "msgdata/msg/msg_0607_T26PC0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T26PC0101_000
	ScrDef scr_seq_T26PC0101_001
	ScrDef scr_seq_T26PC0101_002
	ScrDef scr_seq_T26PC0101_003
	ScrDef scr_seq_T26PC0101_004
	ScrDefEnd

scr_seq_T26PC0101_000:
	SetVar VAR_SPECIAL_x8007, 0
	CallStd std_nurse_joy
	End

scr_seq_T26PC0101_004:
	GoToIfDefeated TRAINER_BEAUTY_CHARLOTTE, _00E6
	Compare VAR_TEMP_x4007, 77
	GoToIfEq _00C4
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0607_T26PC0101_00003
	SetVar VAR_TEMP_x4007, 77
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfNe _0068
	ApplyMovement obj_T26PC0101_gswoman2, _00FC
	GoTo _007D

_0068:
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _007D
	ApplyMovement obj_T26PC0101_gswoman2, _0104
_007D:
	WaitMovement
	NPCMsg msg_0607_T26PC0101_00004
_0082:
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _00D5
	NPCMsg msg_0607_T26PC0101_00005
	CloseMsg
	TrainerBattle TRAINER_BEAUTY_CHARLOTTE, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _00E0
	SetTrainerFlag TRAINER_BEAUTY_CHARLOTTE
	NPCMsg msg_0607_T26PC0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00C4:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0607_T26PC0101_00008
	GoTo _0082

_00D5:
	NPCMsg msg_0607_T26PC0101_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00E0:
	WhiteOut
	ReleaseAll
	End

_00E6:
	SimpleNPCMsg msg_0607_T26PC0101_00006
	End

	.balign 4, 0
_00FC:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0104:
	WalkOnSpotNormalSouth
	EndMovement

scr_seq_T26PC0101_001:
	SimpleNPCMsg msg_0607_T26PC0101_00000
	End

scr_seq_T26PC0101_002:
	SimpleNPCMsg msg_0607_T26PC0101_00001
	End

scr_seq_T26PC0101_003:
	SimpleNPCMsg msg_0607_T26PC0101_00002
	End
	.balign 4, 0
