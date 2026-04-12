#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R22.h"
#include "msgdata/msg/msg_0360_R22.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R22_000
	ScrDef scr_seq_R22_001
	ScrDef scr_seq_R22_002
	ScrDef scr_seq_R22_003
	ScrDef scr_seq_R22_004
	ScrDefEnd

scr_seq_R22_001:
	GoToIfUnset FLAG_UNK_189, _0027
	ClearFlag FLAG_UNK_189
	End

_0027:
	Compare VAR_UNK_40FE, 1
	GoToIfEq _005E
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 4
	GoToIfEq _0058
	Compare VAR_TEMP_x4000, 0
	GoToIfEq _0058
	SetFlag FLAG_HIDE_CAMERON
	End

_0058:
	ClearFlag FLAG_HIDE_CAMERON
	End

_005E:
	SetFlag FLAG_HIDE_CAMERON
	End

scr_seq_R22_004:
	Compare VAR_UNK_40FE, 1
	GoToIfEq _0073
	End

_0073:
	MovePersonFacing obj_R22_sakaki, 947, 1, 266, DIR_WEST
	MovePersonFacing obj_R22_gsrivel, 950, 1, 266, DIR_WEST
	MovePersonFacing obj_R22_var_1, 952, 1, 280, DIR_EAST
	End

scr_seq_R22_003:
	ScrCmd_609
	LockAll
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _037C
	WaitMovement
	ApplyMovement obj_R22_var_1, _02CC
	WaitMovement
	GenderMsgBox msg_0360_R22_00012, msg_0360_R22_00011
	CloseMsg
	ApplyMovement obj_R22_var_1, _02E0
	WaitMovement
	BufferPlayersName 0
	GenderMsgBox msg_0360_R22_00014, msg_0360_R22_00013
	CloseMsg
	ApplyMovement obj_R22_var_1, _02FC
	WaitMovement
	GenderMsgBox msg_0360_R22_00016, msg_0360_R22_00015
	CloseMsg
	ApplyMovement obj_R22_var_1, _0304
	ApplyMovement obj_player, _03D0
	WaitMovement
	GenderMsgBox msg_0360_R22_00018, msg_0360_R22_00017
	CloseMsg
	ApplyMovement obj_R22_var_1, _0338
	WaitMovement
	BufferPlayersName 0
	GenderMsgBox msg_0360_R22_00020, msg_0360_R22_00019
	CloseMsg
	ApplyMovement obj_player, _03A0
	ApplyMovement obj_R22_var_1, _0310
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	GetPlayerCoords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	ScrCmd_102 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	ApplyMovement 241, _03DC
	WaitMovement
	FadeOutBGM 0, 30
	ApplyMovement obj_R22_gsrivel, _03F4
	WaitMovement
	BufferRivalsName 0
	NPCMsg msg_0360_R22_00002
	CloseMsg
	ApplyMovement obj_R22_sakaki, _0438
	WaitMovement
	NPCMsg msg_0360_R22_00008
	CloseMsg
	ApplyMovement obj_R22_gsrivel, _03FC
	WaitMovement
	BufferRivalsName 0
	NPCMsg msg_0360_R22_00003
	CloseMsg
	ApplyMovement obj_R22_sakaki, _0444
	WaitMovement
	NPCMsg msg_0360_R22_00009
	CloseMsg
	ApplyMovement obj_R22_gsrivel, _03F4
	WaitMovement
	BufferRivalsName 0
	NPCMsg msg_0360_R22_00004
	CloseMsg
	ApplyMovement obj_R22_sakaki, _044C
	WaitMovement
	NPCMsg msg_0360_R22_00010
	CloseMsg
	ApplyMovement obj_R22_sakaki, _0454
	WaitMovement
	ApplyMovement obj_R22_gsrivel, _03F4
	WaitMovement
	BufferRivalsName 0
	NPCMsg msg_0360_R22_00005
	CloseMsg
	ApplyMovement obj_R22_gsrivel, _03F4
	WaitMovement
	NPCMsg msg_0360_R22_00006
	CloseMsg
	CallStd std_play_rival_intro_music
	ApplyMovement 241, _03E8
	ApplyMovement obj_R22_gsrivel, _0404
	WaitMovement
	ScrCmd_103
	BufferRivalsName 0
	NPCMsg msg_0360_R22_00007
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 56
	ApplyMovement obj_R22_gsrivel, _0420
	PlaySE SEQ_SE_DP_WALL_HIT2
	ApplyMovement obj_player, _03B0
	ApplyMovement obj_R22_var_1, _03D0
	WaitMovement
	ApplyMovement obj_R22_gsrivel, _042C
	ApplyMovement obj_player, _03D0
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	HidePerson obj_R22_sakaki
	HidePerson obj_R22_gsrivel
	SetFlag FLAG_HIDE_ROUTE_22_GIOVANNI_RIVAL
	CallStd std_fade_end_rival_intro_music
	GenderMsgBox msg_0360_R22_00022, msg_0360_R22_00021
	CloseMsg
	FadeOutBGM 20, 30
	ApplyMovement obj_partner_poke, _0350
	WaitMovement
	PlaySE SEQ_SE_GS_SUZUSYUTUGEN_HO
	FadeScreen 6, 6, 0, RGB_WHITE
	WaitFade
	Wait 15, VAR_SPECIAL_RESULT
	FadeScreen 6, 6, 1, RGB_WHITE
	WaitFade
	ApplyMovement obj_player, _03C4
	ApplyMovement obj_R22_var_1, _0320
	WaitMovement
	GenderMsgBox msg_0360_R22_00024, msg_0360_R22_00023
	CloseMsg
	PlaySE SEQ_SE_GS_TIMESLIP
	ScrCmd_810
	SetVar VAR_UNK_40FE, 2
	ClearFlag FLAG_HIDE_TOHJO_FALLS_GIOVANNI
	ClearFlag FLAG_HIDE_TOHJO_FALLS_FRIEND
	Warp MAP_TOHJO_FALLS_HIDDEN_ROOM, 0, 6, 8, DIR_SOUTH
	FadeScreen 6, 15, 1, RGB_WHITE
	WaitFade
	ReleaseAll
	End

	.balign 4, 0
_02CC:
	EmoteExclamationMark
	Delay8
	WalkOnSpotNormalEast
	Delay16
	EndMovement

	.balign 4, 0
_02E0:
	WalkFastNorth 2
	Delay8
	WalkOnSpotNormalWest
	Delay16
	WalkOnSpotNormalEast
	Delay16
	EndMovement

	.balign 4, 0
_02FC:
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_0304:
	WalkNormalSouth
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0310:
	WalkNormalNorth 2
	WalkNormalWest 2
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_0320:
	WalkOnSpotNormalWest
	Delay16
	WalkOnSpotNormalEast
	Delay16
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0338:
	EmoteExclamationMark
	Delay8
	WalkNormalNorth 2
	WalkNormalEast
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_0350:
	FaceSouth
	JumpFarSouth
	LockDir
	JumpNearFastNorth
	LockDir
	EndMovement

	.balign 4, 0
_0368:
	LockDir
	WalkFastEast 2
	UnlockDir
	FaceWest
	EndMovement

	.balign 4, 0
_037C:
	WalkOnSpotNormalNorth
	WalkNormalNorth
	Delay8
	WalkOnSpotNormalWest
	Delay16
	WalkOnSpotNormalEast
	Delay16
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_03A0:
	WalkNormalNorth 5
	WalkNormalWest 2
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_03B0:
	Delay4
	LockDir
	JumpNearFastSouth
	UnlockDir
	EndMovement

	.balign 4, 0
_03C4:
	EmoteExclamationMark
	Delay8
	EndMovement

	.balign 4, 0
_03D0:
	Delay16
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_03DC:
	WalkNormalNorth 5
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_03E8:
	WalkFastEast 2
	WalkFastSouth 4
	EndMovement

	.balign 4, 0
_03F4:
	WalkNormalWest
	EndMovement

	.balign 4, 0
_03FC:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0404:
	Delay32
	WalkFastEast 6
	WalkFastSouth 4
	Delay8
	EmoteExclamationMark
	Delay8
	EndMovement

	.balign 4, 0
_0420:
	WalkFastSouth 2
	Delay16
	EndMovement

	.balign 4, 0
_042C:
	WalkFastEast
	WalkFastSouth 8
	EndMovement

	.balign 4, 0
_0438:
	WalkOnSpotNormalEast
	Delay8
	EndMovement

	.balign 4, 0
_0444:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_044C:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0454:
	WalkNormalWest 6
	EndMovement

scr_seq_R22_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0584
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0598
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _04D5
	ApplyMovement obj_player, _05AC
	ApplyMovement obj_R22_gsmiddleman1, _05F8
	GoTo _0523

_04D5:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _04F0
	ApplyMovement obj_player, _05C4
	GoTo _0523

_04F0:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _0513
	ApplyMovement obj_player, _05E4
	ApplyMovement obj_R22_gsmiddleman1, _05F8
	GoTo _0523

_0513:
	ApplyMovement obj_player, _05D0
	ApplyMovement obj_R22_gsmiddleman1, _05F8
_0523:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _054A
	ApplyMovement obj_partner_poke, _0604
	WaitMovement
_054A:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 71
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

_0584:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0598:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_05AC:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_05C4:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_05D0:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_05E4:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_05F8:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0604:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_R22_002:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0360_R22_00000, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
