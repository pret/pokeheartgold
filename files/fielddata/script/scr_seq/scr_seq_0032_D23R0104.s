#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D23R0104.h"
#include "msgdata/msg/msg_0068_D23R0104.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D23R0104_000
	ScrDef scr_seq_D23R0104_001
	ScrDef scr_seq_D23R0104_002
	ScrDef scr_seq_D23R0104_003
	ScrDef scr_seq_D23R0104_004
	ScrDef scr_seq_D23R0104_005
	ScrDef scr_seq_D23R0104_006
	ScrDef scr_seq_D23R0104_007
	ScrDef scr_seq_D23R0104_008
	ScrDefEnd

scr_seq_D23R0104_000:
	SetFlag FLAG_HIDE_ROCKET_TAKEOVER_1
	SetFlag FLAG_HIDE_ROCKET_TAKEOVER_2
	Compare VAR_SCENE_ROCKET_TAKEOVER, 4
	GoToIfNe _0045
	ClearFlag FLAG_HIDE_ROCKET_TAKEOVER_1
	GoTo _0056

_0045:
	Compare VAR_SCENE_ROCKET_TAKEOVER, 5
	GoToIfNe _0056
	ClearFlag FLAG_HIDE_ROCKET_TAKEOVER_2
_0056:
	End

scr_seq_D23R0104_008:
	Compare VAR_SCENE_ROCKET_TAKEOVER, 4
	GoToIfNe _0089
	MovePersonFacing obj_D23R0104_kurumi, 18, 1, 12, DIR_EAST
	MovePersonFacing obj_D23R0104_tsure_poke_static_meowth, 19, 1, 12, DIR_SOUTH
	MovePersonFacing obj_D23R0104_gsman2, 20, 1, 12, DIR_SOUTH
_0089:
	End

scr_seq_D23R0104_001:
	SimpleNPCMsg msg_0068_D23R0104_00008
	End

scr_seq_D23R0104_002:
	SimpleNPCMsg msg_0068_D23R0104_00009
	End

scr_seq_D23R0104_003:
	SimpleNPCMsg msg_0068_D23R0104_00000
	End

scr_seq_D23R0104_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 4
	GoToIfNe _00E2
	NPCMsg msg_0068_D23R0104_00001
	GoTo _00E8

_00E2:
	GoTo _00F0

_00E8:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00F0:
	GoToIfSet FLAG_GOT_BRIGHTPOWDER_FROM_MARY, _013D
	NPCMsg msg_0068_D23R0104_00002
	GoToIfNoItemSpace ITEM_BRIGHTPOWDER, 1, _0132
	CallStd std_give_item_verbose
	NPCMsg msg_0068_D23R0104_00004
	WaitButton
	CloseMsg
	ReleaseAll
	SetFlag FLAG_GOT_BRIGHTPOWDER_FROM_MARY
	End

_0132:
	NPCMsg msg_0068_D23R0104_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_013D:
	NPCMsg msg_0068_D23R0104_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D23R0104_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_MEOWTH, 0
	NPCMsg msg_0068_D23R0104_00007
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D23R0104_006:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 4
	GoToIfNe _0181
	NPCMsg msg_0068_D23R0104_00010
	GoTo _0184

_0181:
	NPCMsg msg_0068_D23R0104_00011
_0184:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D23R0104_007:
	GoToIfDefeated TRAINER_TEAM_ROCKET_F_GRUNT_4, _01F6
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0068_D23R0104_00012
	GetPlayerFacing VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 2
	GoToIfNe _01BF
	ApplyMovement obj_D23R0104_rocketw, _0210
	GoTo _01C7

_01BF:
	ApplyMovement obj_D23R0104_rocketw, _021C
_01C7:
	WaitMovement
	NPCMsg msg_0068_D23R0104_00013
	CloseMsg
	TrainerBattle TRAINER_TEAM_ROCKET_F_GRUNT_4, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0209
	SetTrainerFlag TRAINER_TEAM_ROCKET_F_GRUNT_4
	NPCMsg msg_0068_D23R0104_00014
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01F6:
	SimpleNPCMsg msg_0068_D23R0104_00014
	End

_0209:
	WhiteOut
	ReleaseAll
	End

	.balign 4, 0
_0210:
	EmoteExclamationMark
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_021C:
	EmoteExclamationMark
	WalkOnSpotNormalSouth
	EndMovement
	.balign 4, 0
