#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D23R0102.h"
#include "msgdata/msg/msg_0066_D23R0102.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D23R0102_000
	ScrDef scr_seq_D23R0102_001
	ScrDef scr_seq_D23R0102_002
	ScrDef scr_seq_D23R0102_003
	ScrDef scr_seq_D23R0102_004
	ScrDef scr_seq_D23R0102_005
	ScrDef scr_seq_D23R0102_006
	ScrDef scr_seq_D23R0102_007
	ScrDef scr_seq_D23R0102_008
	ScrDef scr_seq_D23R0102_009
	ScrDef scr_seq_D23R0102_010
	ScrDefEnd

scr_seq_D23R0102_007:
	SetFlag FLAG_HIDE_ROCKET_TAKEOVER_1
	SetFlag FLAG_HIDE_ROCKET_TAKEOVER_2
	Compare VAR_SCENE_ROCKET_TAKEOVER, 4
	GoToIfNe _004D
	ClearFlag FLAG_HIDE_ROCKET_TAKEOVER_1
	GoTo _0068

_004D:
	Compare VAR_SCENE_ROCKET_TAKEOVER, 2
	GoToIfGe _0064
	ClearFlag FLAG_HIDE_ROCKET_TAKEOVER_2
	GoTo _0068

_0064:
	ClearFlag FLAG_HIDE_ROCKET_TAKEOVER_2
_0068:
	End

scr_seq_D23R0102_008:
	Compare VAR_SCENE_ROCKET_TAKEOVER, 5
	GoToIfNe _0083
	MovePersonFacing obj_D23R0102_policeman, 2, 1, 7, DIR_EAST
_0083:
	End

scr_seq_D23R0102_000:
	SimpleNPCMsg msg_0066_D23R0102_00006
	End

scr_seq_D23R0102_001:
	SimpleNPCMsg msg_0066_D23R0102_00007
	End

scr_seq_D23R0102_002:
	SimpleNPCMsg msg_0066_D23R0102_00008
	End

scr_seq_D23R0102_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_JIGGLYPUFF, 0
	NPCMsg msg_0066_D23R0102_00003
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D23R0102_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 4
	GoToIfNe _00F7
	NPCMsg msg_0066_D23R0102_00002
	GoTo _00FA

_00F7:
	NPCMsg msg_0066_D23R0102_00001
_00FA:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D23R0102_005:
	SimpleNPCMsg msg_0066_D23R0102_00000
	End

scr_seq_D23R0102_006:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 5
	GoToIfNe _0133
	NPCMsg msg_0066_D23R0102_00005
	GoTo _0136

_0133:
	NPCMsg msg_0066_D23R0102_00004
_0136:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D23R0102_009:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 4
	GoToIfNe _015C
	NPCMsg msg_0066_D23R0102_00009
	GoTo _0162

_015C:
	GoTo _016A

_0162:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_016A:
	HasItem ITEM_BLUE_CARD, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfGe _01B5
	NPCMsg msg_0066_D23R0102_00010
	CloseMsg
	GoToIfNoItemSpace ITEM_BLUE_CARD, 1, _0539
	CallStd std_give_item_verbose
	CloseMsg
	AddVar VAR_NUM_TIMES_GIVEN_BLUE_CARD, 1
	ReleaseAll
	End

_01B5:
	Compare VAR_NUM_TIMES_GIVEN_BLUE_CARD, 2
	GoToIfLt _01CF
	BufferPlayersName 0
	GenderMsgBox msg_0066_D23R0102_00012, msg_0066_D23R0102_00013
	GoTo _01D2

_01CF:
	NPCMsg msg_0066_D23R0102_00011
_01D2:
	CloseMsg
	GoToIfSet FLAG_DAILY_HEARD_BUENAS_PASSWORD, _01EA
	NPCMsg msg_0066_D23R0102_00028
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01EA:
	GoToIfSet FLAG_DAILY_BUENAS_PASSWORD, _0547
	NPCMsg msg_0066_D23R0102_00014
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0552
	BufferPlayersName 0
	Compare VAR_NUM_TIMES_GIVEN_BLUE_CARD, 2
	GoToIfLt _0227
	GenderMsgBox msg_0066_D23R0102_00017, msg_0066_D23R0102_00018
	GoTo _022B

_0227:
	GenderMsgBox msg_0066_D23R0102_00015, msg_0066_D23R0102_00016
_022B:
	CloseMsg
	ApplyMovement obj_D23R0102_gswoman1, _0620
	WaitMovement
	GenderMsgBox msg_0066_D23R0102_00020, msg_0066_D23R0102_00021
	CloseMsg
	GetPlayerFacing VAR_TEMP_x4000
	ScrCmd_729 VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 0
	GoToIfEq _0295
	Release obj_partner_poke
	Compare VAR_TEMP_x4000, 2
	GoToIfNe _0279
	ApplyMovement obj_player, _05CC
	ApplyMovement obj_partner_poke, _05E0
	GoTo _0289

_0279:
	ApplyMovement obj_player, _05F0
	ApplyMovement obj_partner_poke, _0600
_0289:
	WaitMovement
	Lock obj_partner_poke
	GoTo _02BA

_0295:
	Compare VAR_TEMP_x4000, 2
	GoToIfNe _02B0
	ApplyMovement obj_player, _05CC
	GoTo _02B8

_02B0:
	ApplyMovement obj_player, _05F0
_02B8:
	WaitMovement
_02BA:
	GetBuenasPassword VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	TouchscreenMenuHide
	MenuInit 1, 1, 0, 0, VAR_SPECIAL_RESULT
	MenuItemAdd VAR_SPECIAL_x8000, 255, 0
	AddVar VAR_SPECIAL_x8000, 1
	MenuItemAdd VAR_SPECIAL_x8000, 255, 1
	AddVar VAR_SPECIAL_x8000, 1
	MenuItemAdd VAR_SPECIAL_x8000, 255, 2
	MenuExec
	TouchscreenMenuShow
	SetFlag FLAG_UNK_102
	SetFlag FLAG_DAILY_BUENAS_PASSWORD
	ApplyMovement obj_D23R0102_gswoman1, _0628
	WaitMovement
	Compare VAR_SPECIAL_RESULT, VAR_SPECIAL_x8001
	GoToIfNe _055D
	NPCMsg msg_0066_D23R0102_00022
	ApplyMovement obj_D23R0102_gswoman1, _0630
	WaitMovement
	ApplyMovement obj_player, _060C
	WaitMovement
	PlaySE SEQ_SE_GS_OKOZUKAI
	Compare VAR_BLUE_CARD_POINTS, 30
	GoToIfGe _033F
	AddVar VAR_BLUE_CARD_POINTS, 1
_033F:
	Compare VAR_BLUE_CARD_POINTS, 30
	GoToIfLt _0387
	Compare VAR_NUM_TIMES_GIVEN_BLUE_CARD, 2
	GoToIfGe _0387
	ApplyMovement obj_D23R0102_gswoman1, _0628
	WaitMovement
	GenderMsgBox msg_0066_D23R0102_00024, msg_0066_D23R0102_00025
	CloseMsg
	RegisterGearNumber PHONE_CONTACT_BUENA
	NPCMsg msg_0066_D23R0102_00026
	PlayFanfare SEQ_ME_POKEGEAR_REGIST
	WaitFanfare
	CloseMsg
	ApplyMovement obj_D23R0102_gswoman1, _0628
	WaitMovement
	NPCMsg msg_0066_D23R0102_00027
	CloseMsg
_0387:
	Compare VAR_BLUE_CARD_POINTS, 1
	GoToIfEq _0499
	Compare VAR_BLUE_CARD_POINTS, 3
	GoToIfEq _04AD
	Compare VAR_BLUE_CARD_POINTS, 5
	GoToIfEq _04C1
	Compare VAR_BLUE_CARD_POINTS, 10
	GoToIfEq _04D5
	Compare VAR_BLUE_CARD_POINTS, 15
	GoToIfEq _04E9
	Compare VAR_BLUE_CARD_POINTS, 20
	GoToIfEq _04FD
	Compare VAR_BLUE_CARD_POINTS, 25
	GoToIfEq _0511
	Compare VAR_BLUE_CARD_POINTS, 30
	GoToIfEq _0525
	GoTo _0568

_03F5:
	NPCMsg msg_0066_D23R0102_00032
	CloseMsg
	ApplyMovement obj_D23R0102_gswoman1, _0638
	WaitMovement
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_D23R0102_gswoman2_2, _0648
	ApplyMovement obj_player, _0614
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	BufferInt 0, VAR_BLUE_CARD_POINTS
	BufferItemName 1, VAR_SPECIAL_x8004
	NPCMsg msg_0066_D23R0102_00035
	HasSpaceForItem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0539
	CallStd std_give_item_verbose
_0450:
	Compare VAR_BLUE_CARD_POINTS, 30
	GoToIfLt _0486
	NPCMsg msg_0066_D23R0102_00036
	CloseMsg
	PlayFanfare SEQ_ME_KEYITEM
	NPCMsg msg_0066_D23R0102_00037
	WaitFanfare
	CloseMsg
	Compare VAR_NUM_TIMES_GIVEN_BLUE_CARD, 255
	GoToIfGe _0480
	AddVar VAR_NUM_TIMES_GIVEN_BLUE_CARD, 1
_0480:
	SetVar VAR_BLUE_CARD_POINTS, 0
_0486:
	NPCMsg msg_0066_D23R0102_00038
	CloseMsg
	ApplyMovement obj_D23R0102_gswoman2_2, _0654
	WaitMovement
	ReleaseAll
	End

_0499:
	SetVar VAR_SPECIAL_x8004, 4
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _03F5
	End

_04AD:
	SetVar VAR_SPECIAL_x8004, 23
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _03F5
	End

_04C1:
	SetVar VAR_SPECIAL_x8004, 46
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _03F5
	End

_04D5:
	SetVar VAR_SPECIAL_x8004, 47
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _03F5
	End

_04E9:
	SetVar VAR_SPECIAL_x8004, 48
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _03F5
	End

_04FD:
	SetVar VAR_SPECIAL_x8004, 92
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _03F5
	End

_0511:
	SetVar VAR_SPECIAL_x8004, 50
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _03F5
	End

_0525:
	SetVar VAR_SPECIAL_x8004, 45
	SetVar VAR_SPECIAL_x8005, 1
	GoTo _03F5
	End

_0539:
	CallStd std_bag_is_full
	CloseMsg
	GoTo _0450
	End

_0547:
	NPCMsg msg_0066_D23R0102_00029
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0552:
	NPCMsg msg_0066_D23R0102_00019
	WaitButton
	CloseMsg
	ReleaseAll
	End

_055D:
	NPCMsg msg_0066_D23R0102_00023
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0568:
	NPCMsg msg_0066_D23R0102_00032
	CloseMsg
	ApplyMovement obj_D23R0102_gswoman1, _0638
	WaitMovement
	ReleaseAll
	End

scr_seq_D23R0102_010:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 4
	GoToIfEq _05C0
	HasItem ITEM_BLUE_CARD, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfGe _05B0
	NPCMsg msg_0066_D23R0102_00033
	WaitButton
	CloseMsg
	ReleaseAll
	End

_05B0:
	BufferInt 0, VAR_BLUE_CARD_POINTS
	NPCMsg msg_0066_D23R0102_00034
	WaitButton
	CloseMsg
	ReleaseAll
	End

_05C0:
	NPCMsg msg_0066_D23R0102_00039
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_05CC:
	FaceSouth
	WalkNormalSouth 2
	WalkNormalWest
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_05E0:
	WalkNormalSouth 2
	WalkNormalWest
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_05F0:
	FaceSouth
	WalkNormalSouth
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0600:
	WalkNormalSouth
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_060C:
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0614:
	WalkNormalSouth
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_0620:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0628:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0630:
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_0638:
	FaceNorth
	WalkNormalNorth
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0648:
	WalkNormalSouth 2
	WalkNormalEast 3
	EndMovement

	.balign 4, 0
_0654:
	WalkNormalWest 3
	WalkNormalNorth 2
	WalkOnSpotNormalSouth
	EndMovement
	.balign 4, 0
