#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T30GYM0101.h"
#include "msgdata/msg/msg_0631_T30GYM0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T30GYM0101_000
	ScrDef scr_seq_T30GYM0101_001
	ScrDef scr_seq_T30GYM0101_002
	ScrDef scr_seq_T30GYM0101_003
	ScrDef scr_seq_T30GYM0101_004
	ScrDef scr_seq_T30GYM0101_005
	ScrDefEnd

scr_seq_T30GYM0101_001:
	BlackthornGymInit
	SetVar VAR_UNK_4120, 0
	GetPhoneBookRematch PHONE_CONTACT_CLAIR, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _010C
	Compare VAR_UNK_40FC, 2
	GoToIfGe _0044
	End

_0044:
	CheckRegisteredPhoneNumber PHONE_CONTACT_CLAIR, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _00BD
	ScrCmd_522 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 6
	GoToIfNe _0072
	SetFlag FLAG_HIDE_BLACKTHORN_GYM_CLAIR
	GoTo _00BB

_0072:
	Compare VAR_TEMP_x4000, 7
	GoToIfNe _0089
	SetFlag FLAG_HIDE_BLACKTHORN_GYM_CLAIR
	GoTo _00BB

_0089:
	Compare VAR_TEMP_x4000, 8
	GoToIfNe _00A0
	SetFlag FLAG_HIDE_BLACKTHORN_GYM_CLAIR
	GoTo _00BB

_00A0:
	Compare VAR_TEMP_x4000, 9
	GoToIfNe _00B7
	SetFlag FLAG_HIDE_BLACKTHORN_GYM_CLAIR
	GoTo _00BB

_00B7:
	ClearFlag FLAG_HIDE_BLACKTHORN_GYM_CLAIR
_00BB:
	End

_00BD:
	ScrCmd_522 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 16
	GoToIfNe _00D8
	SetFlag FLAG_HIDE_BLACKTHORN_GYM_CLAIR
	GoTo _010A

_00D8:
	Compare VAR_TEMP_x4000, 17
	GoToIfNe _00EF
	SetFlag FLAG_HIDE_BLACKTHORN_GYM_CLAIR
	GoTo _010A

_00EF:
	Compare VAR_TEMP_x4000, 18
	GoToIfNe _0106
	SetFlag FLAG_HIDE_BLACKTHORN_GYM_CLAIR
	GoTo _010A

_0106:
	ClearFlag FLAG_HIDE_BLACKTHORN_GYM_CLAIR
_010A:
	End

_010C:
	SetFlag FLAG_HIDE_BLACKTHORN_GYM_CLAIR
	End

scr_seq_T30GYM0101_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_0EA, _018E
	GoToIfSet FLAG_UNK_0D1, _017D
	NPCMsg msg_0631_T30GYM0101_00003
	CloseMsg
	TrainerBattle TRAINER_LEADER_CLAIR_CLAIR, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0188
	SetTrainerFlag TRAINER_ACE_TRAINER_M_PAULO
	SetTrainerFlag TRAINER_ACE_TRAINER_M_CODY
	SetTrainerFlag TRAINER_ACE_TRAINER_M_MIKE
	SetTrainerFlag TRAINER_ACE_TRAINER_F_FRAN
	SetTrainerFlag TRAINER_ACE_TRAINER_F_LOLA
	AddSpecialGameStat SCORE_EVENT_BADGE_GET
	SetFlag FLAG_UNK_0D1
	SetFlag FLAG_HIDE_BLACKTHORN_DEN_GUARD_INFRONT
	ClearFlag FLAG_HIDE_BLACKTHRON_DEN_GUARD_ASIDE
	NPCMsg msg_0631_T30GYM0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_017D:
	NPCMsg msg_0631_T30GYM0101_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0188:
	WhiteOut
	ReleaseAll
	End

_018E:
	GoToIfSet FLAG_GOT_TM59_FROM_CLAIR, _01C8
	NPCMsg msg_0631_T30GYM0101_00006
	GoToIfNoItemSpace ITEM_TM59, 1, _01D3
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_TM59_FROM_CLAIR
	NPCMsg msg_0631_T30GYM0101_00007
_01C8:
	NPCMsg msg_0631_T30GYM0101_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01D3:
	NPCMsg msg_0631_T30GYM0101_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T30GYM0101_002:
	ScrCmd_609
	LockAll
	PlaySE SEQ_SE_DP_GYURU
	ApplyMovement obj_player, _0218
	WaitMovement
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_BLACKTHORN_GYM, 0, 8, 83, DIR_NORTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

	.balign 4, 0
_0218:
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

scr_seq_T30GYM0101_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_0D1, _0291
	NPCMsg msg_0631_T30GYM0101_00000
	ScrCmd_600
	SetFollowMonInhibitState 1
	ScrCmd_607
	ScrCmd_109 253, 56
	SetVar VAR_UNK_4120, 1
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0291:
	NPCMsg msg_0631_T30GYM0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T30GYM0101_004:
	ScrCmd_609
	LockAll
	GoToIfSet FLAG_UNK_138, _0352
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4000, 12
	GoToIfNe _02D4
	ApplyMovement obj_T30GYM0101_sunglasses, _0370
	ApplyMovement obj_player, _039C
	GoTo _0307

_02D4:
	Compare VAR_TEMP_x4000, 13
	GoToIfNe _02F7
	ApplyMovement obj_T30GYM0101_sunglasses, _0380
	ApplyMovement obj_player, _03A8
	GoTo _0307

_02F7:
	ApplyMovement obj_T30GYM0101_sunglasses, _0390
	ApplyMovement obj_player, _03B4
_0307:
	WaitMovement
	NPCMsg msg_0631_T30GYM0101_00002
	CloseMsg
	SetFlag FLAG_UNK_138
	Compare VAR_TEMP_x4000, 12
	GoToIfNe _032D
	ApplyMovement obj_T30GYM0101_sunglasses, _03C0
	GoTo _0350

_032D:
	Compare VAR_TEMP_x4000, 13
	GoToIfNe _0348
	ApplyMovement obj_T30GYM0101_sunglasses, _03CC
	GoTo _0350

_0348:
	ApplyMovement obj_T30GYM0101_sunglasses, _03D8
_0350:
	WaitMovement
_0352:
	ScrCmd_600
	SetFollowMonInhibitState 1
	ScrCmd_607
	ScrCmd_109 253, 56
	SetVar VAR_UNK_4120, 1
	SetVar VAR_UNK_4120, 1
	ReleaseAll
	End

	.balign 4, 0
_0370:
	FaceWest
	EmoteExclamationMark
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_0380:
	FaceWest
	EmoteExclamationMark
	WalkNormalWest
	EndMovement

	.balign 4, 0
_0390:
	FaceWest
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_039C:
	Delay8 5
	FaceEast
	EndMovement

	.balign 4, 0
_03A8:
	Delay8 4
	FaceEast
	EndMovement

	.balign 4, 0
_03B4:
	Delay8 2
	FaceEast
	EndMovement

	.balign 4, 0
_03C0:
	WalkNormalEast 2
	FaceSouth
	EndMovement

	.balign 4, 0
_03CC:
	WalkNormalEast
	FaceSouth
	EndMovement

	.balign 4, 0
_03D8:
	FaceSouth
	EndMovement

scr_seq_T30GYM0101_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_RISING, VAR_SPECIAL_RESULT
	BufferPlayersName 0
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0407
	NPCMsg msg_0631_T30GYM0101_00010
	GoTo _040A

_0407:
	NPCMsg msg_0631_T30GYM0101_00011
_040A:
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
