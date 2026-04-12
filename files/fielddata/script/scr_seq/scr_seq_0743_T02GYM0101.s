#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T02GYM0101.h"
#include "msgdata/msg/msg_0454_T02GYM0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T02GYM0101_000
	ScrDef scr_seq_T02GYM0101_001
	ScrDef scr_seq_T02GYM0101_002
	ScrDef scr_seq_T02GYM0101_003
	ScrDef scr_seq_T02GYM0101_004
	ScrDefEnd

scr_seq_T02GYM0101_002:
	ViridianGymInit
	SetVar VAR_UNK_4127, 0
	GetPhoneBookRematch PHONE_CONTACT_BLUE, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _0065
	Compare VAR_UNK_40FD, 0
	GoToIfEq _005F
	GetWeekday VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 5
	GoToIfNe _0059
	SetFlag FLAG_HIDE_VIRIDIAN_GYM_BLUE
	GoTo _005D

_0059:
	ClearFlag FLAG_HIDE_VIRIDIAN_GYM_BLUE
_005D:
	End

_005F:
	ClearFlag FLAG_HIDE_VIRIDIAN_GYM_BLUE
	End

_0065:
	SetFlag FLAG_HIDE_VIRIDIAN_GYM_BLUE
	End

scr_seq_T02GYM0101_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_EARTH, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0131
	NPCMsg msg_0454_T02GYM0101_00000
	CloseMsg
	TrainerBattle TRAINER_LEADER_BLUE_BLUE, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0147
	GiveBadge BADGE_EARTH
	AddVar VAR_UNK_4135, 1
	SetFlag FLAG_UNK_998
	AddSpecialGameStat SCORE_EVENT_BADGE_GET
	SetTrainerFlag TRAINER_ACE_TRAINER_M_ARABELLA
	SetTrainerFlag TRAINER_ACE_TRAINER_F_SALMA
	SetTrainerFlag TRAINER_ACE_TRAINER_M_BONITA
	SetTrainerFlag TRAINER_DOUBLE_TEAM_ELAN_AND_IDA
	SetFlag FLAG_UNK_97F
	ClearFlag FLAG_HIDE_ROUTE_10_ZAPDOS
	SetFlag FLAG_HIDE_CERULEAN_CITY_MAN_OUTSIDE_CAVE
	SetVar VAR_UNK_4096, 1
	NPCMsg msg_0454_T02GYM0101_00001
	BufferPlayersName 0
	NPCMsg msg_0454_T02GYM0101_00002
	PlayFanfare SEQ_ME_BADGE
	WaitFanfare
	NPCMsg msg_0454_T02GYM0101_00003
	GoTo _00F0

_00F0:
	GoToIfNoItemSpace ITEM_TM92, 1, _0127
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_TM92_FROM_BLUE
	BufferPlayersName 0
	NPCMsg msg_0454_T02GYM0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0127:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_0131:
	GoToIfUnset FLAG_GOT_TM92_FROM_BLUE, _00F0
	NPCMsg msg_0454_T02GYM0101_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0147:
	WhiteOut
	ReleaseAll
	End

scr_seq_T02GYM0101_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_EARTH, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0186
	NPCMsg msg_0454_T02GYM0101_00006
	ScrCmd_600
	SetFollowMonInhibitState 1
	ScrCmd_607
	ScrCmd_109 253, 56
	SetVar VAR_UNK_4127, 1
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0186:
	NPCMsg msg_0454_T02GYM0101_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T02GYM0101_003:
	ScrCmd_609
	LockAll
	GoToIfSet FLAG_UNK_13A, _037D
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4000, 1
	GoToIfNe _01C9
	ApplyMovement obj_T02GYM0101_sunglasses, _0394
	ApplyMovement obj_player, _040C
	GoTo _02AB

_01C9:
	Compare VAR_TEMP_x4000, 2
	GoToIfNe _01EC
	ApplyMovement obj_T02GYM0101_sunglasses, _03A4
	ApplyMovement obj_player, _040C
	GoTo _02AB

_01EC:
	Compare VAR_TEMP_x4000, 3
	GoToIfNe _020F
	ApplyMovement obj_T02GYM0101_sunglasses, _03B4
	ApplyMovement obj_player, _040C
	GoTo _02AB

_020F:
	Compare VAR_TEMP_x4000, 4
	GoToIfNe _0232
	ApplyMovement obj_T02GYM0101_sunglasses, _03C4
	ApplyMovement obj_player, _0418
	GoTo _02AB

_0232:
	Compare VAR_TEMP_x4000, 5
	GoToIfNe _0255
	ApplyMovement obj_T02GYM0101_sunglasses, _03D4
	ApplyMovement obj_player, _0418
	GoTo _02AB

_0255:
	Compare VAR_TEMP_x4000, 6
	GoToIfNe _0278
	ApplyMovement obj_T02GYM0101_sunglasses, _03E4
	ApplyMovement obj_player, _0418
	GoTo _02AB

_0278:
	Compare VAR_TEMP_x4000, 8
	GoToIfNe _029B
	ApplyMovement obj_T02GYM0101_sunglasses, _03F0
	ApplyMovement obj_player, _0424
	GoTo _02AB

_029B:
	ApplyMovement obj_T02GYM0101_sunglasses, _03FC
	ApplyMovement obj_player, _0424
_02AB:
	WaitMovement
	NPCMsg msg_0454_T02GYM0101_00008
	CloseMsg
	SetFlag FLAG_UNK_13A
	Compare VAR_TEMP_x4000, 1
	GoToIfNe _02D1
	ApplyMovement obj_T02GYM0101_sunglasses, _0430
	GoTo _037B

_02D1:
	Compare VAR_TEMP_x4000, 2
	GoToIfNe _02EC
	ApplyMovement obj_T02GYM0101_sunglasses, _043C
	GoTo _037B

_02EC:
	Compare VAR_TEMP_x4000, 3
	GoToIfNe _0307
	ApplyMovement obj_T02GYM0101_sunglasses, _0448
	GoTo _037B

_0307:
	Compare VAR_TEMP_x4000, 4
	GoToIfNe _0322
	ApplyMovement obj_T02GYM0101_sunglasses, _0454
	GoTo _037B

_0322:
	Compare VAR_TEMP_x4000, 5
	GoToIfNe _033D
	ApplyMovement obj_T02GYM0101_sunglasses, _0460
	GoTo _037B

_033D:
	Compare VAR_TEMP_x4000, 6
	GoToIfNe _0358
	ApplyMovement obj_T02GYM0101_sunglasses, _046C
	GoTo _037B

_0358:
	Compare VAR_TEMP_x4000, 8
	GoToIfNe _0373
	ApplyMovement obj_T02GYM0101_sunglasses, _046C
	GoTo _037B

_0373:
	ApplyMovement obj_T02GYM0101_sunglasses, _0474
_037B:
	WaitMovement
_037D:
	ScrCmd_600
	SetFollowMonInhibitState 1
	ScrCmd_607
	ScrCmd_109 253, 56
	SetVar VAR_UNK_4127, 1
	ReleaseAll
	End

	.balign 4, 0
_0394:
	FaceWest
	EmoteExclamationMark
	WalkNormalWest 5
	EndMovement

	.balign 4, 0
_03A4:
	FaceWest
	EmoteExclamationMark
	WalkNormalWest 4
	EndMovement

	.balign 4, 0
_03B4:
	FaceWest
	EmoteExclamationMark
	WalkNormalWest 3
	EndMovement

	.balign 4, 0
_03C4:
	FaceWest
	EmoteExclamationMark
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_03D4:
	FaceWest
	EmoteExclamationMark
	WalkNormalWest
	EndMovement

	.balign 4, 0
_03E4:
	FaceWest
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_03F0:
	FaceEast
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_03FC:
	FaceEast
	EmoteExclamationMark
	WalkNormalEast
	EndMovement

	.balign 4, 0
_040C:
	Delay16 2
	FaceEast
	EndMovement

	.balign 4, 0
_0418:
	Delay8 2
	FaceEast
	EndMovement

	.balign 4, 0
_0424:
	Delay8 2
	FaceWest
	EndMovement

	.balign 4, 0
_0430:
	WalkNormalEast 5
	FaceSouth
	EndMovement

	.balign 4, 0
_043C:
	WalkNormalEast 4
	FaceSouth
	EndMovement

	.balign 4, 0
_0448:
	WalkNormalEast 3
	FaceSouth
	EndMovement

	.balign 4, 0
_0454:
	WalkNormalEast 2
	FaceSouth
	EndMovement

	.balign 4, 0
_0460:
	WalkNormalEast
	FaceSouth
	EndMovement

	.balign 4, 0
_046C:
	FaceSouth
	EndMovement

	.balign 4, 0
_0474:
	WalkNormalWest
	FaceSouth
	EndMovement

scr_seq_T02GYM0101_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_EARTH, VAR_SPECIAL_RESULT
	BufferPlayersName 0
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _04A7
	NPCMsg msg_0454_T02GYM0101_00009
	GoTo _04AA

_04A7:
	NPCMsg msg_0454_T02GYM0101_00010
_04AA:
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
