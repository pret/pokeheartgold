#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T08GYM0101.h"
#include "msgdata/msg/msg_0514_T08GYM0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T08GYM0101_000
	ScrDef scr_seq_T08GYM0101_001
	ScrDef scr_seq_T08GYM0101_002
	ScrDef scr_seq_T08GYM0101_003
	ScrDef scr_seq_T08GYM0101_004
	ScrDef scr_seq_T08GYM0101_005
	ScrDef scr_seq_T08GYM0101_006
	ScrDef scr_seq_T08GYM0101_007
	ScrDef scr_seq_T08GYM0101_008
	ScrDefEnd

scr_seq_T08GYM0101_000:
	FuchsiaGymInit
	GetPhoneBookRematch PHONE_CONTACT_JANINE, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _00EF
	CheckRegisteredPhoneNumber PHONE_CONTACT_JANINE, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _00AF
	CheckBadge BADGE_SOUL, VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 0
	GoToIfNe _006D
	GoTo _00E9

_0067:
	GoTo _0073

_006D:
	GoTo _0075

_0073:
	End

_0075:
	ScrCmd_522 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 16
	GoToIfNe _0090
	SetFlag FLAG_HIDE_FUCHSIA_GYM_JANINE
	GoTo _00AD

_0090:
	Compare VAR_TEMP_x4000, 17
	GoToIfNe _00A7
	SetFlag FLAG_HIDE_FUCHSIA_GYM_JANINE
	GoTo _00AD

_00A7:
	GoTo _00E9

_00AD:
	End

_00AF:
	ScrCmd_522 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 18
	GoToIfNe _00CA
	SetFlag FLAG_HIDE_FUCHSIA_GYM_JANINE
	GoTo _00E7

_00CA:
	Compare VAR_TEMP_x4000, 19
	GoToIfNe _00E1
	SetFlag FLAG_HIDE_FUCHSIA_GYM_JANINE
	GoTo _00E7

_00E1:
	GoTo _00E9

_00E7:
	End

_00E9:
	ClearFlag FLAG_HIDE_FUCHSIA_GYM_JANINE
	End

_00EF:
	SetFlag FLAG_HIDE_FUCHSIA_GYM_JANINE
	End

scr_seq_T08GYM0101_008:
	Compare VAR_TEMP_x400B, 111
	GoToIfNe _012E
	CallIfNotDefeated TRAINER_LASS_LINDA, _0130
	CallIfNotDefeated TRAINER_CAMPER_BARRY, _0142
	CallIfNotDefeated TRAINER_LASS_ALICE, _0154
	CallIfNotDefeated TRAINER_PICNICKER_CINDY, _0166
_012E:
	End

_0130:
	ClearFlag FLAG_HIDE_FUCHSIA_GYM_LASS_LINDA_REVEALED
	ShowPerson obj_T08GYM0101_gsgirl1
	SetFlag FLAG_HIDE_FUCHSIA_GYM_LASS_LINDA_DISGUISED
	HidePerson obj_T08GYM0101_gsleader13_4
	Return

_0142:
	ClearFlag FLAG_HIDE_FUCHSIA_GYM_CAMPER_BARRY_REVEALED
	ShowPerson obj_T08GYM0101_campboy_2
	SetFlag FLAG_HIDE_FUCHSIA_GYM_CAMPER_BARRY_DISGUISED
	HidePerson obj_T08GYM0101_gsleader13_3
	Return

_0154:
	ClearFlag FLAG_HIDE_FUCHSIA_GYM_LASS_ALICE_REVEALED
	ShowPerson obj_T08GYM0101_gsgirl1_2
	SetFlag FLAG_HIDE_FUCHSIA_GYM_LASS_ALICE_DISGUISED
	HidePerson obj_T08GYM0101_gsleader13_5
	Return

_0166:
	ClearFlag FLAG_HIDE_FUCHSIA_GYM_PICNICKER_CINDY_REVEALED
	ShowPerson obj_T08GYM0101_picnicgirl_2
	SetFlag FLAG_HIDE_FUCHSIA_GYM_PICNICKER_CINDY_DISGUISED
	HidePerson obj_T08GYM0101_gsleader13_2
	Return

scr_seq_T08GYM0101_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfDefeated TRAINER_LASS_LINDA, _0277
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _01AA
	ApplyMovement obj_T08GYM0101_gsleader13_4, _0620
	GoTo _01E8

_01AA:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _01C5
	ApplyMovement obj_T08GYM0101_gsleader13_4, _05E4
	GoTo _01E8

_01C5:
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfNe _01E0
	ApplyMovement obj_T08GYM0101_gsleader13_4, _0604
	GoTo _01E8

_01E0:
	ApplyMovement obj_T08GYM0101_gsleader13_4, _0638
_01E8:
	WaitMovement
	ClearFlag FLAG_HIDE_FUCHSIA_GYM_LASS_LINDA_REVEALED
	ShowPerson obj_T08GYM0101_gsgirl1
	SetFlag FLAG_HIDE_FUCHSIA_GYM_LASS_LINDA_DISGUISED
	HidePerson obj_T08GYM0101_gsleader13_4
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0215
	ApplyMovement obj_T08GYM0101_gsgirl1, _0698
	GoTo _0253

_0215:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0230
	ApplyMovement obj_T08GYM0101_gsgirl1, _065C
	GoTo _0253

_0230:
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfNe _024B
	ApplyMovement obj_T08GYM0101_gsgirl1, _0680
	GoTo _0253

_024B:
	ApplyMovement obj_T08GYM0101_gsgirl1, _06B4
_0253:
	WaitMovement
	NPCMsg msg_0514_T08GYM0101_00007
	CloseMsg
	TrainerBattle TRAINER_LASS_LINDA, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0282
	SetTrainerFlag TRAINER_LASS_LINDA
_0277:
	NPCMsg msg_0514_T08GYM0101_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0282:
	WhiteOut
	ReleaseAll
	SetFlag FLAG_HIDE_FUCHSIA_GYM_LASS_LINDA_REVEALED
	ClearFlag FLAG_HIDE_FUCHSIA_GYM_LASS_LINDA_DISGUISED
	End

scr_seq_T08GYM0101_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfDefeated TRAINER_CAMPER_BARRY, _038F
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _02C2
	ApplyMovement obj_T08GYM0101_gsleader13_3, _0620
	GoTo _0300

_02C2:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _02DD
	ApplyMovement obj_T08GYM0101_gsleader13_3, _05E4
	GoTo _0300

_02DD:
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfNe _02F8
	ApplyMovement obj_T08GYM0101_gsleader13_3, _0604
	GoTo _0300

_02F8:
	ApplyMovement obj_T08GYM0101_gsleader13_3, _0638
_0300:
	WaitMovement
	ClearFlag FLAG_HIDE_FUCHSIA_GYM_CAMPER_BARRY_REVEALED
	ShowPerson obj_T08GYM0101_campboy_2
	SetFlag FLAG_HIDE_FUCHSIA_GYM_CAMPER_BARRY_DISGUISED
	HidePerson obj_T08GYM0101_gsleader13_3
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _032D
	ApplyMovement obj_T08GYM0101_campboy_2, _0698
	GoTo _036B

_032D:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0348
	ApplyMovement obj_T08GYM0101_campboy_2, _065C
	GoTo _036B

_0348:
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfNe _0363
	ApplyMovement obj_T08GYM0101_campboy_2, _0680
	GoTo _036B

_0363:
	ApplyMovement obj_T08GYM0101_campboy_2, _06B4
_036B:
	WaitMovement
	NPCMsg msg_0514_T08GYM0101_00009
	CloseMsg
	TrainerBattle TRAINER_CAMPER_BARRY, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _039A
	SetTrainerFlag TRAINER_CAMPER_BARRY
_038F:
	NPCMsg msg_0514_T08GYM0101_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

_039A:
	WhiteOut
	ReleaseAll
	SetFlag FLAG_HIDE_FUCHSIA_GYM_CAMPER_BARRY_REVEALED
	ClearFlag FLAG_HIDE_FUCHSIA_GYM_CAMPER_BARRY_DISGUISED
	End

scr_seq_T08GYM0101_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfDefeated TRAINER_LASS_ALICE, _04AC
	NPCMsg msg_0514_T08GYM0101_00011
	CloseMsg
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _03DF
	ApplyMovement obj_T08GYM0101_gsleader13_5, _0620
	GoTo _041D

_03DF:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _03FA
	ApplyMovement obj_T08GYM0101_gsleader13_5, _05E4
	GoTo _041D

_03FA:
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfNe _0415
	ApplyMovement obj_T08GYM0101_gsleader13_5, _0604
	GoTo _041D

_0415:
	ApplyMovement obj_T08GYM0101_gsleader13_5, _0638
_041D:
	WaitMovement
	ClearFlag FLAG_HIDE_FUCHSIA_GYM_LASS_ALICE_REVEALED
	ShowPerson obj_T08GYM0101_gsgirl1_2
	SetFlag FLAG_HIDE_FUCHSIA_GYM_LASS_ALICE_DISGUISED
	HidePerson obj_T08GYM0101_gsleader13_5
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _044A
	ApplyMovement obj_T08GYM0101_gsgirl1_2, _0698
	GoTo _0488

_044A:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0465
	ApplyMovement obj_T08GYM0101_gsgirl1_2, _065C
	GoTo _0488

_0465:
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfNe _0480
	ApplyMovement obj_T08GYM0101_gsgirl1_2, _0680
	GoTo _0488

_0480:
	ApplyMovement obj_T08GYM0101_gsgirl1_2, _06B4
_0488:
	WaitMovement
	NPCMsg msg_0514_T08GYM0101_00012
	CloseMsg
	TrainerBattle TRAINER_LASS_ALICE, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _04B7
	SetTrainerFlag TRAINER_LASS_ALICE
_04AC:
	NPCMsg msg_0514_T08GYM0101_00013
	WaitButton
	CloseMsg
	ReleaseAll
	End

_04B7:
	WhiteOut
	ReleaseAll
	SetFlag FLAG_HIDE_FUCHSIA_GYM_LASS_ALICE_REVEALED
	ClearFlag FLAG_HIDE_FUCHSIA_GYM_LASS_ALICE_DISGUISED
	End

scr_seq_T08GYM0101_006:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfDefeated TRAINER_PICNICKER_CINDY, _05C9
	NPCMsg msg_0514_T08GYM0101_00014
	CloseMsg
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _04FC
	ApplyMovement obj_T08GYM0101_gsleader13_2, _0620
	GoTo _053A

_04FC:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0517
	ApplyMovement obj_T08GYM0101_gsleader13_2, _05E4
	GoTo _053A

_0517:
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfNe _0532
	ApplyMovement obj_T08GYM0101_gsleader13_2, _0604
	GoTo _053A

_0532:
	ApplyMovement obj_T08GYM0101_gsleader13_2, _0638
_053A:
	WaitMovement
	ClearFlag FLAG_HIDE_FUCHSIA_GYM_PICNICKER_CINDY_REVEALED
	ShowPerson obj_T08GYM0101_picnicgirl_2
	SetFlag FLAG_HIDE_FUCHSIA_GYM_PICNICKER_CINDY_DISGUISED
	HidePerson obj_T08GYM0101_gsleader13_2
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0567
	ApplyMovement obj_T08GYM0101_picnicgirl_2, _0698
	GoTo _05A5

_0567:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0582
	ApplyMovement obj_T08GYM0101_picnicgirl_2, _065C
	GoTo _05A5

_0582:
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfNe _059D
	ApplyMovement obj_T08GYM0101_picnicgirl_2, _0680
	GoTo _05A5

_059D:
	ApplyMovement obj_T08GYM0101_picnicgirl_2, _06B4
_05A5:
	WaitMovement
	NPCMsg msg_0514_T08GYM0101_00015
	CloseMsg
	TrainerBattle TRAINER_PICNICKER_CINDY, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _05D4
	SetTrainerFlag TRAINER_PICNICKER_CINDY
_05C9:
	NPCMsg msg_0514_T08GYM0101_00016
	WaitButton
	CloseMsg
	ReleaseAll
	End

_05D4:
	WhiteOut
	ReleaseAll
	SetFlag FLAG_HIDE_FUCHSIA_GYM_PICNICKER_CINDY_REVEALED
	ClearFlag FLAG_HIDE_FUCHSIA_GYM_PICNICKER_CINDY_DISGUISED
	End

	.balign 4, 0
_05E4:
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	EndMovement

	.balign 4, 0
_0604:
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	EndMovement

	.balign 4, 0
_0620:
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	EndMovement

	.balign 4, 0
_0638:
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	EndMovement

	.balign 4, 0
_065C:
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	EndMovement

	.balign 4, 0
_0680:
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	EndMovement

	.balign 4, 0
_0698:
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	EndMovement

	.balign 4, 0
_06B4:
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	EndMovement

scr_seq_T08GYM0101_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_SOUL, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0778
	NPCMsg msg_0514_T08GYM0101_00000
	CloseMsg
	SetVar VAR_TEMP_x400B, 111
	TrainerBattle TRAINER_LEADER_JANINE_JANINE, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _078E
	SetVar VAR_TEMP_x400B, 0
	GiveBadge BADGE_SOUL
	AddVar VAR_UNK_4135, 1
	AddSpecialGameStat SCORE_EVENT_BADGE_GET
	SetTrainerFlag TRAINER_PICNICKER_CINDY
	SetTrainerFlag TRAINER_CAMPER_BARRY
	SetTrainerFlag TRAINER_LASS_LINDA
	SetTrainerFlag TRAINER_LASS_ALICE
	NPCMsg msg_0514_T08GYM0101_00001
	BufferPlayersName 0
	NPCMsg msg_0514_T08GYM0101_00002
	PlayFanfare SEQ_ME_BADGE
	WaitFanfare
	NPCMsg msg_0514_T08GYM0101_00003
	GoTo _074F

_074F:
	GoToIfNoItemSpace ITEM_TM84, 1, _0794
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_TM84_FROM_JANINE
_0778:
	GoToIfUnset FLAG_GOT_TM84_FROM_JANINE, _074F
	NPCMsg msg_0514_T08GYM0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_078E:
	WhiteOut
	ReleaseAll
	End

_0794:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

scr_seq_T08GYM0101_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_SOUL, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _07C4
	NPCMsg msg_0514_T08GYM0101_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_07C4:
	NPCMsg msg_0514_T08GYM0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T08GYM0101_007:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_SOUL, VAR_SPECIAL_RESULT
	BufferPlayersName 0
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _07F6
	NPCMsg msg_0514_T08GYM0101_00017
	GoTo _07F9

_07F6:
	NPCMsg msg_0514_T08GYM0101_00018
_07F9:
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
