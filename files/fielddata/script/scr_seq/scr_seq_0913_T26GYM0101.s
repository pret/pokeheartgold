#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T26GYM0101.h"
#include "msgdata/msg/msg_0606_T26GYM0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T26GYM0101_000
	ScrDef scr_seq_T26GYM0101_001
	ScrDef scr_seq_T26GYM0101_002
	ScrDef scr_seq_T26GYM0101_003
	ScrDef scr_seq_T26GYM0101_004
	ScrDef scr_seq_T26GYM0101_005
	ScrDef scr_seq_T26GYM0101_006
	ScrDef scr_seq_T26GYM0101_007
	ScrDefEnd

scr_seq_T26GYM0101_007:
	GetPhoneBookRematch PHONE_CONTACT_JASMINE, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _015C
	GoToIfUnset FLAG_GAME_CLEAR, _015A
	ClearFlag FLAG_HIDE_JASMINE_IN_GYM
	CheckRegisteredPhoneNumber PHONE_CONTACT_JASMINE, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _007A
	ScrCmd_522 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 13
	GoToIfNe _0072
	SetFlag FLAG_HIDE_JASMINE_IN_GYM
	GoTo _0078

_0072:
	GoTo _009D

_0078:
	End

_007A:
	ScrCmd_522 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 12
	GoToIfNe _0095
	SetFlag FLAG_HIDE_JASMINE_IN_GYM
	GoTo _009B

_0095:
	GoTo _009D

_009B:
	End

_009D:
	CheckRegisteredPhoneNumber PHONE_CONTACT_ERIKA, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _015A
	CheckBadge BADGE_EARTH, VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 1
	GoToIfEq _00CB
	GoTo _015A
	End

_00CB:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 6
	GoToIfNe _00E8
	GoTo _0109

_00E2:
	GoTo _0107

_00E8:
	Compare VAR_TEMP_x4000, 0
	GoToIfNe _0101
	GoTo _0109

_00FB:
	GoTo _0107

_0101:
	GoTo _015A

_0107:
	End

_0109:
	ScrCmd_522 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 14
	GoToIfNe _0124
	SetFlag FLAG_HIDE_JASMINE_IN_GYM
	GoTo _0158

_0124:
	Compare VAR_TEMP_x4000, 15
	GoToIfNe _013B
	SetFlag FLAG_HIDE_JASMINE_IN_GYM
	GoTo _0158

_013B:
	Compare VAR_TEMP_x4000, 16
	GoToIfNe _0152
	SetFlag FLAG_HIDE_JASMINE_IN_GYM
	GoTo _0158

_0152:
	GoTo _015A

_0158:
	End

_015A:
	End

_015C:
	SetFlag FLAG_HIDE_JASMINE_IN_GYM
	End

scr_seq_T26GYM0101_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_MINERAL, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _020C
	NPCMsg msg_0606_T26GYM0101_00000
	CloseMsg
	TrainerBattle TRAINER_LEADER_JASMINE_JASMINE, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0235
	NPCMsg msg_0606_T26GYM0101_00001
	BufferPlayersName 0
	NPCMsg msg_0606_T26GYM0101_00002
	PlayFanfare SEQ_ME_BADGE
	WaitFanfare
	GiveBadge BADGE_MINERAL
	AddVar VAR_MIDGAME_BADGES, 1
	AddSpecialGameStat SCORE_EVENT_BADGE_GET
	Compare VAR_MIDGAME_BADGES, 3
	GoToIfNe _01CB
	SetVar VAR_SCENE_ROCKET_TAKEOVER, 1
_01CB:
	NPCMsg msg_0606_T26GYM0101_00003
_01CE:
	GoToIfNoItemSpace ITEM_TM23, 1, _0202
	CallStd std_give_item_verbose
	NPCMsg msg_0606_T26GYM0101_00005
	WaitButton
	CloseMsg
	ReleaseAll
	SetFlag FLAG_GOT_TM23_FROM_JASMINE
	End

_0202:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_020C:
	GoToIfUnset FLAG_GOT_TM23_FROM_JASMINE, _01CE
	CheckRegisteredPhoneNumber PHONE_CONTACT_JASMINE, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _023B
	NPCMsg msg_0606_T26GYM0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0235:
	WhiteOut
	ReleaseAll
	End

_023B:
	GoToIfSet FLAG_TRADE_JASMINE_STEELIX, _036F
	Compare VAR_TEMP_x4000, 77
	GoToIfEq _0264
	SetVar VAR_TEMP_x4000, 77
	NPCMsg msg_0606_T26GYM0101_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0264:
	NPCMsg msg_0606_T26GYM0101_00008
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _034B
	NPCMsg msg_0606_T26GYM0101_00009
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_566
	GetPartySelection VAR_SPECIAL_RESULT
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _034B
	CopyVar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	GetPartyMonSpecies VAR_SPECIAL_x8004, VAR_TEMP_x4003
	GetPartyMonForm2 VAR_SPECIAL_x8004, VAR_TEMP_x4004
	Compare VAR_TEMP_x4003, 0
	GoToIfEq _0356
	Compare VAR_TEMP_x4004, 0
	GoToIfEq _030E
	Compare VAR_TEMP_x4003, 487
	GoToIfEq _0364
	Compare VAR_TEMP_x4003, 492
	GoToIfEq _0364
	Compare VAR_TEMP_x4003, 172
	GoToIfEq _0364
	Compare VAR_TEMP_x4003, 479
	GoToIfEq _0364
_030E:
	BufferPartyMonNick 1, VAR_SPECIAL_x8004
	NPCMsg msg_0606_T26GYM0101_00013
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _034B
	CloseMsg
	LoadNPCTrade 5
	NPCTradeExec VAR_SPECIAL_x8004
	NPCTradeEnd
	SetFlag FLAG_TRADE_JASMINE_STEELIX
	SetVar VAR_TEMP_x4000, 55
	NPCMsg msg_0606_T26GYM0101_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

_034B:
	NPCMsg msg_0606_T26GYM0101_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0356:
	BufferPlayersName 0
	NPCMsg msg_0606_T26GYM0101_00014
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0364:
	NPCMsg msg_0606_T26GYM0101_00015
	WaitButton
	CloseMsg
	ReleaseAll
	End

_036F:
	Compare VAR_TEMP_x4000, 55
	GoToIfNe _0385
	NPCMsg msg_0606_T26GYM0101_00011
	GoTo _0388

_0385:
	NPCMsg msg_0606_T26GYM0101_00012
_0388:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T26GYM0101_001:
	ScrCmd_609
	LockAll
	ApplyMovement obj_T26GYM0101_gsgentleman, _040C
	WaitMovement
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4000, 5
	GoToIfNe _03BF
	ApplyMovement obj_T26GYM0101_gsgentleman, _0414
	GoTo _03E2

_03BF:
	Compare VAR_TEMP_x4000, 6
	GoToIfNe _03DA
	ApplyMovement obj_T26GYM0101_gsgentleman, _041C
	GoTo _03E2

_03DA:
	ApplyMovement obj_T26GYM0101_gsgentleman, _0424
_03E2:
	ApplyMovement obj_player, _042C
	WaitMovement
	NPCMsg msg_0606_T26GYM0101_00019
	WaitButton
	CloseMsg
	ReleaseAll
	Compare VAR_UNK_410E, 1
	GoToIfNe _0408
	SetVar VAR_UNK_410E, 2
_0408:
	End

	.balign 4, 0
_040C:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0414:
	WalkNormalEast
	EndMovement

	.balign 4, 0
_041C:
	WalkNormalEast 2
	EndMovement

	.balign 4, 0
_0424:
	WalkNormalEast 3
	EndMovement

	.balign 4, 0
_042C:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0434:
	WalkOnSpotNormalEast
	EndMovement

scr_seq_T26GYM0101_002:
	ScrCmd_609
	LockAll
	ApplyMovement obj_T26GYM0101_gsgirl1, _040C
	WaitMovement
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4000, 5
	GoToIfNe _046B
	ApplyMovement obj_T26GYM0101_gsgirl1, _04B8
	GoTo _048E

_046B:
	Compare VAR_TEMP_x4000, 6
	GoToIfNe _0486
	ApplyMovement obj_T26GYM0101_gsgirl1, _04C0
	GoTo _048E

_0486:
	ApplyMovement obj_T26GYM0101_gsgirl1, _04C8
_048E:
	ApplyMovement obj_player, _0434
	WaitMovement
	NPCMsg msg_0606_T26GYM0101_00021
	WaitButton
	CloseMsg
	ReleaseAll
	Compare VAR_UNK_410E, 2
	GoToIfNe _04B4
	SetVar VAR_UNK_410E, 3
_04B4:
	End

	.balign 4, 0
_04B8:
	WalkNormalWest 3
	EndMovement

	.balign 4, 0
_04C0:
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_04C8:
	WalkNormalWest
	EndMovement

scr_seq_T26GYM0101_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_MINERAL, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _04F4
	NPCMsg msg_0606_T26GYM0101_00020
	GoTo _04F7

_04F4:
	NPCMsg msg_0606_T26GYM0101_00019
_04F7:
	WaitButton
	CloseMsg
	ReleaseAll
	Compare VAR_UNK_410E, 1
	GoToIfNe _0510
	SetVar VAR_UNK_410E, 2
_0510:
	End

scr_seq_T26GYM0101_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_MINERAL, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0536
	NPCMsg msg_0606_T26GYM0101_00022
	GoTo _0539

_0536:
	NPCMsg msg_0606_T26GYM0101_00021
_0539:
	WaitButton
	CloseMsg
	ReleaseAll
	Compare VAR_UNK_410E, 2
	GoToIfNe _0552
	SetVar VAR_UNK_410E, 3
_0552:
	End

scr_seq_T26GYM0101_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_MINERAL, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0590
	Compare VAR_UNK_410E, 0
	GoToIfNe _0585
	NPCMsg msg_0606_T26GYM0101_00016
	GoTo _0588

_0585:
	NPCMsg msg_0606_T26GYM0101_00017
_0588:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0590:
	NPCMsg msg_0606_T26GYM0101_00018
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T26GYM0101_006:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_MINERAL, VAR_SPECIAL_RESULT
	BufferPlayersName 0
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _05C2
	NPCMsg msg_0606_T26GYM0101_00023
	GoTo _05C5

_05C2:
	NPCMsg msg_0606_T26GYM0101_00024
_05C5:
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
