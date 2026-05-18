#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T22.h"
#include "msgdata/msg/msg_0556_T22.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T22_000
	ScrDef scr_seq_T22_001
	ScrDef scr_seq_T22_002
	ScrDef scr_seq_T22_003
	ScrDef scr_seq_T22_004
	ScrDef scr_seq_T22_005
	ScrDef scr_seq_T22_006
	ScrDef scr_seq_T22_007
	ScrDef scr_seq_T22_008
	ScrDef scr_seq_T22_009
	ScrDef scr_seq_T22_010
	ScrDef scr_seq_T22_011
	ScrDef scr_seq_T22_012
	ScrDef scr_seq_T22_013
	ScrDef scr_seq_T22_014
	ScrDefEnd

scr_seq_T22_000:
	SetFlag FLAG_GOT_PICK_UP_EGG_CALL_FROM_ELM
	PhoneCall PHONE_CONTACT_PROF__ELM, 2, 1
	SetVar VAR_SCENE_VIOLET_CITY_OW, 2
	ClearFlag FLAG_HIDE_VIOLET_SHOP_LAB_AIDE
	SetFlag FLAG_HIDE_ELMS_LAB_AIDE
	End

scr_seq_T22_004:
	ScrCmd_609
	LockAll
	CallStd std_play_kimono_girl_music
	ApplyMovement obj_T22_dancer, _00CC
	WaitMovement
	NPCMsg msg_0556_T22_00013
	CloseMsg
	ApplyMovement obj_T22_dancer, _00DC
	WaitMovement
	NPCMsg msg_0556_T22_00014
	CloseMsg
	ApplyMovement obj_T22_dancer, _00E4
	WaitMovement
	NPCMsg msg_0556_T22_00015
	CloseMsg
	ApplyMovement obj_T22_dancer, _0104
	WaitMovement
	NPCMsg msg_0556_T22_00016
	CloseMsg
	ApplyMovement obj_T22_dancer, _00F4
	WaitMovement
	CallStd std_fade_end_kimono_girl_music
	HidePerson obj_T22_dancer
	SetFlag FLAG_HIDE_VIOLET_KIMONO_GIRL
	ReleaseAll
	SetVar VAR_SCENE_VIOLET_CITY_OW, 4
	End

	.balign 4, 0
_00CC:
	EmoteExclamationMark
	WalkNormalWest 5
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_00DC:
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_00E4:
	LockDir
	WalkSlowSouth
	UnlockDir
	EndMovement

	.balign 4, 0
_00F4:
	WalkNormalSouth 2
	WalkNormalWest
	WalkNormalSouth 7
	EndMovement

	.balign 4, 0
_0104:
	FaceEast
	Delay2
	FaceSouth
	Delay2
	FaceWest
	Delay2
	FaceNorth
	Delay2
	FaceEast
	Delay2
	FaceSouth
	Delay2
	FaceWest
	Delay2
	FaceNorth
	Delay2
	EndMovement

scr_seq_T22_005:
	SimpleNPCMsg msg_0556_T22_00026
	End

scr_seq_T22_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfNe _0182
	ApplyMovement obj_T22_gsbigman, _0388
	GoTo _01C0

_0182:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _019D
	ApplyMovement obj_T22_gsbigman, _03AC
	GoTo _01C0

_019D:
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _01B8
	ApplyMovement obj_T22_gsbigman, _03D0
	GoTo _01C0

_01B8:
	ApplyMovement obj_T22_gsbigman, _03F4
_01C0:
	WaitMovement
	NPCMsg msg_0556_T22_00001
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01E9
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _01F4
	End

_01E9:
	NPCMsg msg_0556_T22_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01F4:
	NPCMsg msg_0556_T22_00003
	CloseMsg
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfNe _0218
	ApplyMovement obj_T22_gsbigman, _0418
	GoTo _0256

_0218:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _0233
	ApplyMovement obj_T22_gsbigman, _0440
	GoTo _0256

_0233:
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _024E
	ApplyMovement obj_T22_gsbigman, _0460
	GoTo _0256

_024E:
	ApplyMovement obj_T22_gsbigman, _0484
_0256:
	WaitMovement
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfEq _028B
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfEq _02B9
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _02E7
	GoTo _0315
	End

_028B:
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_T22_gsbigman, _04B0
	ApplyMovement obj_player, _05FC
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	GoTo _0343
	End

_02B9:
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_T22_gsbigman, _04B0
	ApplyMovement obj_player, _061C
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	GoTo _0343
	End

_02E7:
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_T22_gsbigman, _04FC
	ApplyMovement obj_player, _063C
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	GoTo _0343
	End

_0315:
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_T22_gsbigman, _04B0
	ApplyMovement obj_player, _0670
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	GoTo _0343
	End

_0343:
	NPCMsg msg_0556_T22_00004
	CloseMsg
	ApplyMovement obj_T22_gsbigman, _05EC
	WaitMovement
	ScrCmd_307 15, 8, 15, 1, 77
	ScrCmd_310 77
	ScrCmd_308 77
	ApplyMovement obj_T22_gsbigman, _05F4
	WaitMovement
	ScrCmd_311 77
	ScrCmd_308 77
	ScrCmd_309 77
	HidePerson obj_T22_gsbigman
	SetFlag FLAG_UNK_19A
	ClearFlag FLAG_HIDE_EARL_IN_SCHOOL
	ReleaseAll
	End

	.balign 4, 0
_0388:
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	EndMovement

	.balign 4, 0
_03AC:
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
_03D0:
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	EndMovement

	.balign 4, 0
_03F4:
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
_0418:
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	EndMovement

	.balign 4, 0
_0440:
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	EndMovement

	.balign 4, 0
_0460:
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	EndMovement

	.balign 4, 0
_0484:
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	EndMovement

	.balign 4, 0
_04B0:
	WalkFastSouth 8
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	WalkFastEast 21
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	WalkFastNorth
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_04FC:
	WalkFastWest 2
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	WalkFastSouth 3
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	WalkFastEast 2
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	WalkFastSouth 5
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	WalkFastEast 21
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	WalkFastNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	EndMovement

	.balign 4, 0
_05EC:
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_05F4:
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_05FC:
	Delay8
	RunWest
	RunSouth 8
	WalkOnSpotNormalEast
	Delay4
	RunEast 21
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_061C:
	Delay8
	RunEast
	RunSouth 8
	WalkOnSpotNormalEast
	Delay4
	RunEast 21
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_063C:
	WalkFastSouth
	WalkFastEast
	WalkOnSpotFastWest
	Delay8 2
	WalkOnSpotFastSouth
	Delay8 2
	WalkFastWest
	RunSouth 6
	WalkOnSpotNormalEast
	Delay4
	RunEast 21
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0670:
	Delay8
	RunSouth 9
	WalkOnSpotNormalEast
	Delay4
	RunEast 21
	WalkOnSpotNormalNorth
	EndMovement

scr_seq_T22_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Call _0ADD
	Call _0A57
	Compare VAR_SPECIAL_x8006, 1
	GoToIfEq _06BC
	NPCMsg msg_0556_T22_00017
	CloseMsg
	Call _0ADD
	ReleaseAll
	End

_06BC:
	NPCMsg msg_0556_T22_00018
_06BF:
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_x8000, 1
	GoToIfNe _06DE
	MenuItemAdd 205, 255, 0
_06DE:
	Compare VAR_SPECIAL_x8001, 1
	GoToIfNe _06F3
	MenuItemAdd 206, 255, 1
_06F3:
	Compare VAR_SPECIAL_x8002, 1
	GoToIfNe _0708
	MenuItemAdd 207, 255, 2
_0708:
	Compare VAR_SPECIAL_x8003, 1
	GoToIfNe _071D
	MenuItemAdd 208, 255, 3
_071D:
	MenuItemAdd 126, 255, 4
	MenuExec
	TouchscreenMenuShow
	Switch VAR_SPECIAL_RESULT
	Case 0, _0769
	Case 1, _080D
	Case 2, _08B1
	Case 3, _0955
	GoTo _09F9

_0769:
	NPCMsg msg_0556_T22_00021
	GoToIfNoItemSpace ITEM_CHERI_BERRY, 1, _0A08
	GoToIfNoItemSpace ITEM_PECHA_BERRY, 1, _0A08
	GoToIfNoItemSpace ITEM_LEPPA_BERRY, 1, _0A08
	GiveItemNoCheck ITEM_CHERI_BERRY, 1
	GiveItemNoCheck ITEM_PECHA_BERRY, 1
	GiveItemNoCheck ITEM_LEPPA_BERRY, 1
	TakeItem ITEM_RED_SHARD, 1, VAR_SPECIAL_RESULT
	GoTo _0A17

_080D:
	NPCMsg msg_0556_T22_00022
	GoToIfNoItemSpace ITEM_ORAN_BERRY, 1, _0A08
	GoToIfNoItemSpace ITEM_CHESTO_BERRY, 1, _0A08
	GoToIfNoItemSpace ITEM_WIKI_BERRY, 1, _0A08
	GiveItemNoCheck ITEM_ORAN_BERRY, 1
	GiveItemNoCheck ITEM_CHESTO_BERRY, 1
	GiveItemNoCheck ITEM_WIKI_BERRY, 1
	TakeItem ITEM_BLUE_SHARD, 1, VAR_SPECIAL_RESULT
	GoTo _0A17

_08B1:
	NPCMsg msg_0556_T22_00023
	GoToIfNoItemSpace ITEM_ASPEAR_BERRY, 1, _0A08
	GoToIfNoItemSpace ITEM_SITRUS_BERRY, 1, _0A08
	GoToIfNoItemSpace ITEM_IAPAPA_BERRY, 1, _0A08
	GiveItemNoCheck ITEM_ASPEAR_BERRY, 1
	GiveItemNoCheck ITEM_SITRUS_BERRY, 1
	GiveItemNoCheck ITEM_IAPAPA_BERRY, 1
	TakeItem ITEM_YELLOW_SHARD, 1, VAR_SPECIAL_RESULT
	GoTo _0A17

_0955:
	NPCMsg msg_0556_T22_00024
	GoToIfNoItemSpace ITEM_RAWST_BERRY, 1, _0A08
	GoToIfNoItemSpace ITEM_LUM_BERRY, 1, _0A08
	GoToIfNoItemSpace ITEM_AGUAV_BERRY, 1, _0A08
	GiveItemNoCheck ITEM_RAWST_BERRY, 1
	GiveItemNoCheck ITEM_LUM_BERRY, 1
	GiveItemNoCheck ITEM_AGUAV_BERRY, 1
	TakeItem ITEM_GREEN_SHARD, 1, VAR_SPECIAL_RESULT
	GoTo _0A17

_09F9:
	NPCMsg msg_0556_T22_00020
	CloseMsg
	Call _0ADD
	ReleaseAll
	End

_0A08:
	NPCMsg msg_0556_T22_00025
	CloseMsg
	Call _0ADD
	ReleaseAll
	End

_0A17:
	SetVar VAR_SPECIAL_x8000, 0
	SetVar VAR_SPECIAL_x8001, 0
	SetVar VAR_SPECIAL_x8002, 0
	SetVar VAR_SPECIAL_x8003, 0
	SetVar VAR_SPECIAL_x8006, 0
	Call _0A57
	Compare VAR_SPECIAL_x8006, 1
	GoToIfNe _0A51
	NPCMsg msg_0556_T22_00019
	GoTo _06BF

_0A51:
	GoTo _09F9

_0A57:
	HasItem ITEM_RED_SHARD, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0A78
	SetVar VAR_SPECIAL_x8000, 1
	SetVar VAR_SPECIAL_x8006, 1
_0A78:
	HasItem ITEM_BLUE_SHARD, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0A99
	SetVar VAR_SPECIAL_x8001, 1
	SetVar VAR_SPECIAL_x8006, 1
_0A99:
	HasItem ITEM_YELLOW_SHARD, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0ABA
	SetVar VAR_SPECIAL_x8002, 1
	SetVar VAR_SPECIAL_x8006, 1
_0ABA:
	HasItem ITEM_GREEN_SHARD, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0ADB
	SetVar VAR_SPECIAL_x8003, 1
	SetVar VAR_SPECIAL_x8006, 1
_0ADB:
	Return

_0ADD:
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0AFE
	ApplyMovement obj_T22_juggrer, _0B28
	WaitMovement
	GoTo _0B25

_0AFE:
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfNe _0B1B
	ApplyMovement obj_T22_juggrer, _0B6C
	WaitMovement
	GoTo _0B25

_0B1B:
	ApplyMovement obj_T22_juggrer, _0BB0
	WaitMovement
_0B25:
	Return

	.balign 4, 0
_0B28:
	FaceEast
	FaceNorth
	FaceWest
	FaceSouth
	FaceEast
	FaceNorth
	FaceWest
	FaceSouth
	FaceEast
	FaceNorth
	FaceWest
	FaceSouth
	FaceEast
	FaceNorth
	FaceWest
	FaceSouth
	EndMovement

	.balign 4, 0
_0B6C:
	FaceNorth
	FaceWest
	FaceSouth
	FaceEast
	FaceNorth
	FaceWest
	FaceSouth
	FaceEast
	FaceNorth
	FaceWest
	FaceSouth
	FaceEast
	FaceNorth
	FaceWest
	FaceSouth
	FaceEast
	EndMovement

	.balign 4, 0
_0BB0:
	FaceSouth
	FaceEast
	FaceNorth
	FaceWest
	FaceSouth
	FaceEast
	FaceNorth
	FaceWest
	FaceSouth
	FaceEast
	FaceNorth
	FaceWest
	FaceSouth
	FaceEast
	FaceNorth
	FaceWest
	EndMovement

scr_seq_T22_002:
	End

scr_seq_T22_006:
	SimpleNPCMsg msg_0556_T22_00027
	End

scr_seq_T22_007:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0556_T22_00012, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T22_008:
	DirectionSignpost msg_0556_T22_00009, 0, 13, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T22_009:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0556_T22_00010, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T22_010:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0556_T22_00011, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T22_011:
	SimpleNPCMsg msg_0556_T22_00005
	End

scr_seq_T22_012:
	SimpleNPCMsg msg_0556_T22_00006
	End

scr_seq_T22_013:
	SimpleNPCMsg msg_0556_T22_00007
	End

scr_seq_T22_014:
	SimpleNPCMsg msg_0556_T22_00008
	End
	.balign 4, 0
