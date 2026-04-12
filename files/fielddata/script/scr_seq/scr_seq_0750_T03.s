#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T03.h"
#include "msgdata/msg/msg_0460_T03.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T03_000
	ScrDef scr_seq_T03_001
	ScrDef scr_seq_T03_002
	ScrDef scr_seq_T03_003
	ScrDef scr_seq_T03_004
	ScrDef scr_seq_T03_005
	ScrDef scr_seq_T03_006
	ScrDef scr_seq_T03_007
	ScrDef scr_seq_T03_008
	ScrDef scr_seq_T03_009
	ScrDef scr_seq_T03_010
	ScrDef scr_seq_T03_011
	ScrDef scr_seq_T03_012
	ScrDef scr_seq_T03_013
	ScrDefEnd

scr_seq_T03_008:
	GoToIfUnset FLAG_UNK_189, _004B
	ClearFlag FLAG_UNK_189
	End

_004B:
	GoTo _030E

_0051:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 2
	GoToIfEq _0075
	Compare VAR_TEMP_x4000, 6
	GoToIfEq _0075
	SetFlag FLAG_HIDE_CAMERON
	End

_0075:
	ClearFlag FLAG_HIDE_CAMERON
	End

scr_seq_T03_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetGameVersion VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 7
	GoToIfNe _00A5
	GoToIfSet FLAG_UNK_094, _0108
	GoTo _00B0

_00A5:
	GoToIfSet FLAG_UNK_093, _0108
_00B0:
	NPCMsg msg_0460_T03_00002
	GetGameVersion VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 7
	GoToIfNe _00E6
	SetVar VAR_SPECIAL_x8004, ITEM_SILVER_WING
	SetVar VAR_SPECIAL_x8005, 1
	CallStd std_obtain_item_verbose
	SetFlag FLAG_UNK_094
	ClearFlag FLAG_HIDE_WHIRL_ISLAND_LUGIA
	SetFlag FLAG_HIDE_WHIRL_ISLANDS_BOTTOM_KIMONO_GIRLS
	GoTo _0102

_00E6:
	SetVar VAR_SPECIAL_x8004, ITEM_RAINBOW_WING
	SetVar VAR_SPECIAL_x8005, 1
	CallStd std_obtain_item_verbose
	SetFlag FLAG_UNK_093
	ClearFlag FLAG_HIDE_BELL_TOWER_HO_OH
	SetFlag FLAG_HIDE_BELL_TOWER_SUMMIT_KIMONO_GIRLS
_0102:
	CloseMsg
	ReleaseAll
	End

_0108:
	NPCMsg msg_0460_T03_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T03_007:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0218
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _022C
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0184
	ApplyMovement obj_player, _0240
	GoTo _01B7

_0184:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _01A7
	ApplyMovement obj_player, _0260
	ApplyMovement obj_T03_gsmiddleman1, _0274
	GoTo _01B7

_01A7:
	ApplyMovement obj_player, _024C
	ApplyMovement obj_T03_gsmiddleman1, _0274
_01B7:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _01DE
	ApplyMovement obj_partner_poke, _0280
	WaitMovement
_01DE:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 66
	LockAll
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ClearFlag FLAG_UNK_189
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 2
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0218:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_022C:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0240:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_024C:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0260:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0274:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0280:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_T03_001:
	SimpleNPCMsg msg_0460_T03_00000
	End

scr_seq_T03_002:
	SimpleNPCMsg msg_0460_T03_00001
	End

scr_seq_T03_003:
	DirectionSignpost msg_0460_T03_00020, 0, 3, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T03_004:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0460_T03_00021, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T03_005:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0460_T03_00022, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T03_006:
	DirectionSignpost msg_0460_T03_00023, 2, 0, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

_030E:
	Compare VAR_UNK_4083, 4
	GoToIfEq _0341
	Compare VAR_UNK_4083, 2
	GoToIfEq _033D
	Compare VAR_UNK_4083, 3
	GoToIfEq _033D
	GoTo _0051
	End

_033D:
	ClearFlag FLAG_HIDE_PEWTER_CITY_STEVEN
_0341:
	GetGameVersion VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 7
	GoToIfNe _035C
	ClearFlag FLAG_HIDE_PEWTER_CITY_LATIOS
	GoTo _0360

_035C:
	ClearFlag FLAG_HIDE_PEWTER_CITY_LATIAS
_0360:
	End

scr_seq_T03_011:
	Compare VAR_UNK_4083, 2
	GoToIfEq _0371
	End

_0371:
	MovePersonFacing obj_T03_daigo, 1047, 6, 81, DIR_WEST
	End

scr_seq_T03_013:
	GoToIfSet FLAG_ENGAGING_STATIC_POKEMON, _038C
	End

_038C:
	GetGameVersion VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 7
	GoToIfNe _03AB
	SetFlag FLAG_HIDE_PEWTER_CITY_LATIOS
	HidePerson obj_T03_tsure_poke_static_latios
	GoTo _03B3

_03AB:
	SetFlag FLAG_HIDE_PEWTER_CITY_LATIAS
	HidePerson obj_T03_tsure_poke_static_latias
_03B3:
	End

scr_seq_T03_012:
	ScrCmd_609
	LockAll
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0440
	WaitMovement
	ApplyMovement obj_T03_daigo, _045C
	WaitMovement
	GetGameVersion VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 7
	GoToIfNe _03F1
	NPCMsg msg_0460_T03_00006
	GoTo _03F4

_03F1:
	NPCMsg msg_0460_T03_00007
_03F4:
	CloseMsg
	ApplyMovement obj_T03_daigo, _0464
	ApplyMovement obj_player, _0464
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	GetGameVersion VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 7
	GoToIfNe _042C
	NPCMsg msg_0460_T03_00008
	GoTo _042F

_042C:
	NPCMsg msg_0460_T03_00009
_042F:
	WaitButton
	CloseMsg
	SetVar VAR_UNK_4083, 3
	ReleaseAll
	End

	.balign 4, 0
_0440:
	WalkNormalSouth 4
	FaceWest
	EndMovement

	.balign 4, 0
_044C:
	Delay8
	WalkNormalEast 2
	Delay8
	EndMovement

	.balign 4, 0
_045C:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0464:
	WalkNormalWest 3
	EndMovement

	.balign 4, 0
_046C:
	WalkNormalSouth 2
	WalkNormalWest
	EndMovement

	.balign 4, 0
_0478:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0480:
	WalkNormalEast 8
	EndMovement

scr_seq_T03_010:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	ScrCmd_546 0, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfEq _0649
	GetGameVersion VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 7
	GoToIfNe _04C8
	SetVar VAR_TEMP_x400A, SPECIES_LATIOS
	PlayCry VAR_TEMP_x400A, 0
	NPCMsg msg_0460_T03_00010
	GoTo _04D7

_04C8:
	SetVar VAR_TEMP_x400A, SPECIES_LATIAS
	PlayCry VAR_TEMP_x400A, 0
	NPCMsg msg_0460_T03_00011
_04D7:
	WaitCry
	CloseMsg
	SetFlag FLAG_ENGAGING_STATIC_POKEMON
	WildBattle VAR_TEMP_x400A, 40, 0
	ClearFlag FLAG_ENGAGING_STATIC_POKEMON
	GetStaticEncounterOutcome VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 2
	GoToIfEq _057B
	Compare VAR_TEMP_x4000, 3
	GoToIfEq _057B
	LatiCaughtCheck VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0526
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _055A
_0526:
	GetGameVersion VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 7
	GoToIfNe _0540
	NPCMsg msg_0460_T03_00012
	GoTo _0543

_0540:
	NPCMsg msg_0460_T03_00013
_0543:
	CloseMsg
	Compare VAR_UNK_4083, 4
	GoToIfEq _0649
	GoTo _0585
	End

_055A:
	CopyVar VAR_TEMP_x4009, VAR_UNK_4083
	SetVar VAR_UNK_4083, 5
	Compare VAR_TEMP_x4009, 4
	GoToIfEq _0649
	GoTo _0585
	End

_057B:
	WhiteOut
	GoTo _0649
	End

_0585:
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_T03_daigo, _046C
	ApplyMovement obj_player, _044C
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	Compare VAR_TEMP_x4000, 5
	GoToIfEq _060C
	Compare VAR_TEMP_x4000, 1
	GoToIfEq _05D2
	Compare VAR_TEMP_x4000, 4
	GoToIfEq _05FF
_05D2:
	GetGameVersion VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 7
	GoToIfNe _05EC
	NPCMsg msg_0460_T03_00016
	GoTo _05EF

_05EC:
	NPCMsg msg_0460_T03_00017
_05EF:
	CloseMsg
	SetVar VAR_UNK_4083, 4
	GoTo _061F
	End

_05FF:
	NPCMsg msg_0460_T03_00014
	CloseMsg
	GoTo _061F
	End

_060C:
	NPCMsg msg_0460_T03_00018
	CloseMsg
	SetVar VAR_UNK_4083, 4
	GoTo _061F
	End

_061F:
	ApplyMovement obj_T03_daigo, _0478
	WaitMovement
	NPCMsg msg_0460_T03_00015
	CloseMsg
	ApplyMovement obj_T03_daigo, _0480
	WaitMovement
	HidePerson obj_T03_daigo
	Compare VAR_UNK_4130, 4
	CallIfEq _064D
_0649:
	ReleaseAll
	End

_064D:
	ClearFlag FLAG_HIDE_STEVEN_IN_HOUSE_AFTER_LATIS
	Return

scr_seq_T03_009:
	SimpleNPCMsg msg_0460_T03_00019
	End
	.balign 4, 0
