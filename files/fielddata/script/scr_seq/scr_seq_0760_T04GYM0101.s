#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T04GYM0101.h"
#include "msgdata/msg/msg_0469_T04GYM0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T04GYM0101_000
	ScrDef scr_seq_T04GYM0101_001
	ScrDef scr_seq_T04GYM0101_002
	ScrDef scr_seq_T04GYM0101_003
	ScrDef scr_seq_T04GYM0101_004
	ScrDef scr_seq_T04GYM0101_005
	ScrDef scr_seq_T04GYM0101_006
	ScrDef scr_seq_T04GYM0101_007
	ScrDefEnd

scr_seq_T04GYM0101_007:
	GetPhoneBookRematch PHONE_CONTACT_MISTY, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _00ED
	CheckBadge BADGE_EARTH, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfEq _00E5
	Compare VAR_SCENE_ROUTE_25, 1
	GoToIfEq _00E7
	Compare VAR_SCENE_ROUTE_25, 2
	GoToIfEq _00E7
	CheckRegisteredPhoneNumber PHONE_CONTACT_MISTY, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _00AD
	ScrCmd_522 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 16
	GoToIfNe _0090
	SetFlag FLAG_HIDE_CERULEAN_GYM_POPULATION
	GoTo _00AB

_0090:
	Compare VAR_TEMP_x4000, 17
	GoToIfNe _00A7
	SetFlag FLAG_HIDE_CERULEAN_GYM_POPULATION
	GoTo _00AB

_00A7:
	ClearFlag FLAG_HIDE_CERULEAN_GYM_POPULATION
_00AB:
	End

_00AD:
	ScrCmd_522 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 14
	GoToIfNe _00C8
	SetFlag FLAG_HIDE_CERULEAN_GYM_POPULATION
	GoTo _00E3

_00C8:
	Compare VAR_TEMP_x4000, 15
	GoToIfNe _00DF
	SetFlag FLAG_HIDE_CERULEAN_GYM_POPULATION
	GoTo _00E3

_00DF:
	ClearFlag FLAG_HIDE_CERULEAN_GYM_POPULATION
_00E3:
	End

_00E5:
	End

_00E7:
	ClearFlag FLAG_HIDE_CERULEAN_GYM_POPULATION
	End

_00ED:
	SetFlag FLAG_HIDE_CERULEAN_GYM_POPULATION
	End

scr_seq_T04GYM0101_004:
	ScrCmd_609
	LockAll
	StopBGM SEQ_GS_GYM
	PlayBGM SEQ_GS_EYE_ROCKET
	ApplyMovement obj_T04GYM0101_rocketm, _01C8
	WaitMovement
	PlaySE SEQ_SE_DP_WALL_HIT2
	NPCMsg msg_0469_T04GYM0101_00000
	ApplyMovement obj_T04GYM0101_rocketm, _01D0
	WaitMovement
	NPCMsg msg_0469_T04GYM0101_00001
	ApplyMovement obj_T04GYM0101_rocketm, _01E4
	WaitMovement
	NPCMsg msg_0469_T04GYM0101_00002
	ApplyMovement obj_T04GYM0101_rocketm, _01F4
	WaitMovement
	NPCMsg msg_0469_T04GYM0101_00003
	CloseMsg
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0179
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0159
	End

_0159:
	ApplyMovement obj_T04GYM0101_rocketm, _01FC
	ApplyMovement obj_player, _0204
	ApplyMovement obj_partner_poke, _0210
	WaitMovement
	GoTo _018B

_0179:
	ApplyMovement obj_T04GYM0101_rocketm, _01FC
	ApplyMovement obj_player, _0204
	WaitMovement
_018B:
	PlaySE SEQ_SE_DP_KAIDAN2
	HidePerson obj_T04GYM0101_rocketm
	WaitSE SEQ_SE_DP_KAIDAN2
	StopBGM SEQ_GS_EYE_ROCKET
	PlayBGM SEQ_GS_GYM
	SetFlag FLAG_HIDE_CERULEAN_GYM_ROCKET
	ClearFlag FLAG_HIDE_ROUTE_24_ROCKET
	ClearFlag FLAG_HIDE_ROUTE_25_MISTY
	ClearFlag FLAG_HIDE_ROUTE_25_MISTYS_BOYFRIEND
	SetVar VAR_UNK_411C, 2
	SetVar VAR_SCENE_ROUTE_24_ROCKET, 1
	SetVar VAR_UNK_4088, 1
	ReleaseAll
	End

	.balign 4, 0
_01C8:
	WalkFasterSouth 5
	EndMovement

	.balign 4, 0
_01D0:
	LockDir
	JumpFarNorth
	Delay8 2
	WalkFastSouth 2
	EndMovement

	.balign 4, 0
_01E4:
	EmoteExclamationMark
	LockDir
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_01F4:
	WalkNormalSouth 2
	EndMovement

	.balign 4, 0
_01FC:
	WalkFastSouth
	EndMovement

	.balign 4, 0
_0204:
	WalkFastWest
	FaceEast
	EndMovement

	.balign 4, 0
_0210:
	WalkFastWest
	EndMovement

scr_seq_T04GYM0101_006:
	ScrCmd_814
	GoToIfSet FLAG_HIDE_CERULEAN_GYM_MACHINE_PART, _022F
	MakeObjectVisible obj_T04GYM0101_stop
	MakeObjectVisible obj_T04GYM0101_stop_2
	End

_022F:
	End

scr_seq_T04GYM0101_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	BufferPlayersName 0
	NPCMsg msg_0469_T04GYM0101_00016
	GoToIfNoItemSpace ITEM_MACHINE_PART, 1, _027C
	CallStd std_obtain_item_verbose
	HidePerson obj_T04GYM0101_stop
	HidePerson obj_T04GYM0101_stop_2
	SetFlag FLAG_HIDE_CERULEAN_GYM_MACHINE_PART
	SetVar VAR_SCENE_ROUTE_24_ROCKET, 4
	CloseMsg
	ReleaseAll
	End

_027C:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

scr_seq_T04GYM0101_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_CASCADE, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0348
	NPCMsg msg_0469_T04GYM0101_00008
	CloseMsg
	TrainerBattle TRAINER_LEADER_MISTY_MISTY, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _035E
	GiveBadge BADGE_CASCADE
	AddVar VAR_UNK_4135, 1
	AddSpecialGameStat SCORE_EVENT_BADGE_GET
	SetTrainerFlag TRAINER_SWIMMER_F_DIANA
	SetTrainerFlag TRAINER_SWIMMER_F_BRIANA
	SetTrainerFlag TRAINER_SWIMMER_F_JOY
	SetTrainerFlag TRAINER_SAILOR_PARKER
	SetTrainerFlag TRAINER_SAILOR_EDDIE
	NPCMsg msg_0469_T04GYM0101_00009
	BufferPlayersName 0
	NPCMsg msg_0469_T04GYM0101_00010
	PlayFanfare SEQ_ME_BADGE
	WaitFanfare
	CallIfSet FLAG_UNK_14D, _0364
	BufferPlayersName 0
	NPCMsg msg_0469_T04GYM0101_00011
	GoTo _0307

_0307:
	GoToIfNoItemSpace ITEM_TM03, 1, _033E
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_TM03_FROM_MISTY
	BufferPlayersName 0
	NPCMsg msg_0469_T04GYM0101_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

_033E:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_0348:
	GoToIfUnset FLAG_GOT_TM03_FROM_MISTY, _0307
	NPCMsg msg_0469_T04GYM0101_00013
	WaitButton
	CloseMsg
	ReleaseAll
	End

_035E:
	WhiteOut
	ReleaseAll
	End

_0364:
	ClearFlag FLAG_HIDE_ROUTE_25_SUICUNE
	SetVar VAR_SCENE_ROUTE_25, 1
	Return

scr_seq_T04GYM0101_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNK_4088, 2
	GoToIfNe _03AD
	CheckBadge BADGE_CASCADE, VAR_SPECIAL_RESULT
	BufferPlayersName 0
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _03A4
	NPCMsg msg_0469_T04GYM0101_00006
	GoTo _03A7

_03A4:
	NPCMsg msg_0469_T04GYM0101_00007
_03A7:
	GoTo _03F6

_03AD:
	NPCMsg msg_0469_T04GYM0101_00004
	GoTo _03F6

scr_seq_T04GYM0101_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNK_4088, 2
	GoToIfNe _03F3
	CheckBadge BADGE_CASCADE, VAR_SPECIAL_RESULT
	BufferPlayersName 0
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _03EA
	NPCMsg msg_0469_T04GYM0101_00006
	GoTo _03ED

_03EA:
	NPCMsg msg_0469_T04GYM0101_00007
_03ED:
	GoTo _03F6

_03F3:
	NPCMsg msg_0469_T04GYM0101_00005
_03F6:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T04GYM0101_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_CASCADE, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0424
	NPCMsg msg_0469_T04GYM0101_00014
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0424:
	NPCMsg msg_0469_T04GYM0101_00015
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
