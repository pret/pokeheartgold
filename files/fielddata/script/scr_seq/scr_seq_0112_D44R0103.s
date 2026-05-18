#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D44R0103.h"
#include "msgdata/msg/msg_0130_D44R0103.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D44R0103_000
	ScrDef scr_seq_D44R0103_001
	ScrDef scr_seq_D44R0103_002
	ScrDef scr_seq_D44R0103_003
	ScrDef scr_seq_D44R0103_004
	ScrDef scr_seq_D44R0103_005
	ScrDefEnd

scr_seq_D44R0103_004:
	GoToIfUnset FLAG_UNK_189, _002B
	ClearFlag FLAG_UNK_189
	End

_002B:
	GoToIfSet FLAG_UNK_0EA, _003C
	GoTo _005A

_003C:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1
	GoToIfEq _0064
	Compare VAR_TEMP_x4000, 4
	GoToIfEq _0064
_005A:
	SetFlag FLAG_HIDE_CAMERON
	GoTo _0068

_0064:
	ClearFlag FLAG_HIDE_CAMERON
_0068:
	GoToIfSet FLAG_GOT_DRATINI_FROM_MASTER_JUST_NOW, _0075
	End

_0075:
	SetFlag FLAG_GOT_DRATINI_FROM_MASTER_LONG_AGO
	End

scr_seq_D44R0103_003:
	ScrCmd_609
	LockAll
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0370
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	NPCMsg msg_0130_D44R0103_00000
_00A0:
	SetVar VAR_SPECIAL_x8004, 0
	NPCMsg msg_0130_D44R0103_00001
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 0, VAR_SPECIAL_RESULT
	MenuItemAdd 280, 255, 0
	MenuItemAdd 281, 255, 1
	MenuItemAdd 282, 255, 0
	MenuExec
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0310
	NPCMsg msg_0130_D44R0103_00009
_00DF:
	SetVar VAR_SPECIAL_x8004, 1
	NPCMsg msg_0130_D44R0103_00002
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 0, VAR_SPECIAL_RESULT
	MenuItemAdd 283, 255, 0
	MenuItemAdd 284, 255, 0
	MenuItemAdd 285, 255, 1
	MenuExec
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0310
	NPCMsg msg_0130_D44R0103_00009
_011E:
	SetVar VAR_SPECIAL_x8004, 2
	NPCMsg msg_0130_D44R0103_00003
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 0, VAR_SPECIAL_RESULT
	MenuItemAdd 286, 255, 1
	MenuItemAdd 287, 255, 0
	MenuItemAdd 288, 255, 0
	MenuExec
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0310
	NPCMsg msg_0130_D44R0103_00009
_015D:
	SetVar VAR_SPECIAL_x8004, 3
	NPCMsg msg_0130_D44R0103_00004
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 0, VAR_SPECIAL_RESULT
	MenuItemAdd 289, 255, 0
	MenuItemAdd 290, 255, 1
	MenuItemAdd 291, 255, 0
	MenuExec
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0310
	NPCMsg msg_0130_D44R0103_00009
_019C:
	SetVar VAR_SPECIAL_x8004, 4
	NPCMsg msg_0130_D44R0103_00005
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 0, VAR_SPECIAL_RESULT
	MenuItemAdd 292, 255, 1
	MenuItemAdd 293, 255, 0
	MenuItemAdd 294, 255, 0
	MenuExec
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0310
	BufferPlayersName 0
	NPCMsg msg_0130_D44R0103_00006
	CloseMsg
	MovePersonFacing obj_D44R0103_gsleader8, 6, 0, 21, DIR_NORTH
	Wait 10, VAR_SPECIAL_x8004
	PlaySE SEQ_SE_DP_DOOR
	Wait 5, VAR_SPECIAL_x8004
	CallStd std_play_clair_music
	ApplyMovement obj_player, _0390
	ApplyMovement obj_D44R0103_gsleader8, _03A8
	WaitMovement
	NPCMsg msg_0130_D44R0103_00010
	ApplyMovement obj_D44R0103_gsleader8, _03C0
	WaitMovement
	NPCMsg msg_0130_D44R0103_00011
	ApplyMovement obj_D44R0103_gsleader8, _03D0
	WaitMovement
	NPCMsg msg_0130_D44R0103_00012
	ApplyMovement obj_D44R0103_chourou, _03DC
	WaitMovement
	NPCMsg msg_0130_D44R0103_00013
	ApplyMovement obj_D44R0103_gsleader8, _03EC
	WaitMovement
	NPCMsg msg_0130_D44R0103_00014
	ApplyMovement obj_D44R0103_gsleader8, _03F4
	ApplyMovement obj_D44R0103_chourou, _03FC
	WaitMovement
	NPCMsg msg_0130_D44R0103_00015
	BufferPlayersName 0
	NPCMsg msg_0130_D44R0103_00016
	PlayFanfare SEQ_ME_BADGE
	WaitFanfare
	GiveBadge BADGE_RISING
	NPCMsg msg_0130_D44R0103_00017
	ApplyMovement obj_D44R0103_chourou, _0408
	ApplyMovement obj_player, _0418
	ApplyMovement obj_D44R0103_gsleader8, _0424
	WaitMovement
	NPCMsg msg_0130_D44R0103_00018
	CloseMsg
	Wait 15, VAR_SPECIAL_x8005
	NPCMsg msg_0130_D44R0103_00019
	CloseMsg
	ApplyMovement obj_D44R0103_gsleader8, _0434
	WaitMovement
	HidePerson obj_D44R0103_gsleader8
	CallStd std_fade_end_clair_music
	WaitFanfare
	ApplyMovement obj_D44R0103_chourou, _0450
	WaitMovement
	GetGameVersion VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 7
	GoToIfNe _02D3
	NPCMsg msg_0130_D44R0103_00020
	GoTo _02D6

_02D3:
	NPCMsg msg_0130_D44R0103_00021
_02D6:
	WaitButton
	CloseMsg
	ReleaseAll
	SetFlag FLAG_UNK_998
	SetFlag FLAG_UNK_0EA
	ClearFlag FLAG_HIDE_VICTORY_ROAD_CLAIR
	SetVar VAR_UNK_40C4, 1
	SetFlag FLAG_HIDE_NEW_BARK_FRIENDS_ROOM_FRIEND
	SetVar VAR_UNK_40C3, 1
	SetVar VAR_UNK_407B, 1
	SetVar VAR_SCENE_ELMS_LAB, 8
	ClearFlag FLAG_HIDE_ELMS_LAB_FRIEND
	SetVar VAR_SCENE_NEW_BARK_EAST_EXIT, 1
	End

_0310:
	SetFlag FLAG_FAILED_DRAGONS_DEN_QUIZ
	ApplyMovement obj_D44R0103_chourou, _0378
	WaitMovement
	NPCMsg msg_0130_D44R0103_00007
	ApplyMovement obj_D44R0103_chourou, _0388
	WaitMovement
	NPCMsg msg_0130_D44R0103_00008
	WaitABPress
	Switch VAR_SPECIAL_x8004
	Case 0, _00A0
	Case 1, _00DF
	Case 2, _011E
	Case 3, _015D
	GoTo _019C

	.balign 4, 0
_0370:
	WalkNormalNorth 8
	EndMovement

	.balign 4, 0
_0378:
	Delay8 2
	FaceEast
	Delay8 2
	EndMovement

	.balign 4, 0
_0388:
	FaceSouth
	EndMovement

	.balign 4, 0
_0390:
	Delay8
	EmoteExclamationMark
	FaceSouth
	Delay8 8
	FaceWest
	EndMovement

	.balign 4, 0
_03A8:
	Delay8 4
	WalkNormalNorth 8
	WalkNormalWest
	WalkNormalNorth 2
	FaceEast
	EndMovement

	.balign 4, 0
_03C0:
	Delay8
	LockDir
	WalkFastWest
	EndMovement

	.balign 4, 0
_03D0:
	Delay8
	WalkSlowWest
	EndMovement

	.balign 4, 0
_03DC:
	Delay8
	WalkSlowSouth
	WalkSlowWest
	EndMovement

	.balign 4, 0
_03EC:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_03F4:
	WalkNormalEast 2
	EndMovement

	.balign 4, 0
_03FC:
	Delay8 2
	FaceEast
	EndMovement

	.balign 4, 0
_0408:
	WalkSlowNorth
	WalkSlowEast
	FaceSouth
	EndMovement

	.balign 4, 0
_0418:
	Delay16 2
	FaceNorth
	EndMovement

	.balign 4, 0
_0424:
	UnlockDir
	Delay16 2
	FaceNorth
	EndMovement

	.balign 4, 0
_0434:
	LockDir
	WalkNormalSouth
	UnlockDir
	WalkFasterSouth 3
	WalkFasterEast
	WalkFasterSouth 4
	EndMovement

	.balign 4, 0
_0450:
	WalkOnSpotNormalSouth
	EndMovement

scr_seq_D44R0103_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GOT_DRATINI_FROM_MASTER_LONG_AGO, _053D
	GoToIfSet FLAG_GOT_DRATINI_FROM_MASTER_JUST_NOW, _052E
	GoToIfSet FLAG_GOT_TM59_FROM_CLAIR, _04A6
	GetGameVersion VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 7
	GoToIfNe _049B
	NPCMsg msg_0130_D44R0103_00020
	GoTo _049E

_049B:
	NPCMsg msg_0130_D44R0103_00022
_049E:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_04A6:
	NPCMsg msg_0130_D44R0103_00026
	GetPartyCount VAR_SPECIAL_x8005
	Compare VAR_SPECIAL_x8005, 6
	GoToIfNe _04C3
	NPCMsg msg_0130_D44R0103_00028
	GoTo _0548

_04C3:
	BufferPlayersName 0
	NPCMsg msg_0130_D44R0103_00027
	PlayFanfare SEQ_ME_SHINKAOME
	WaitFanfare
	GiveMon SPECIES_DRATINI, 15, 0, 0, 0, VAR_SPECIAL_RESULT
	GoToIfSet FLAG_FAILED_DRAGONS_DEN_QUIZ, _04F0
	SetMonMove VAR_SPECIAL_x8005, 0, MOVE_EXTREME_SPEED
_04F0:
	NPCMsg msg_0130_D44R0103_00032
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _050E
	GoTo _052E

_050E:
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	NicknameInput VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_052E:
	SetFlag FLAG_GOT_DRATINI_FROM_MASTER_JUST_NOW
	NPCMsg msg_0130_D44R0103_00029
	WaitButton
	CloseMsg
	ReleaseAll
	End

_053D:
	NPCMsg msg_0130_D44R0103_00030
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0548:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D44R0103_001:
	SimpleNPCMsg msg_0130_D44R0103_00024
	End

scr_seq_D44R0103_002:
	SimpleNPCMsg msg_0130_D44R0103_00025
	End

scr_seq_D44R0103_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _069E
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _06B2
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _05EF
	ApplyMovement obj_player, _06C8
	ApplyMovement obj_D44R0103_gsmiddleman1, _0714
	GoTo _063D

_05EF:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _060A
	ApplyMovement obj_player, _06E0
	GoTo _063D

_060A:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _062D
	ApplyMovement obj_player, _0700
	ApplyMovement obj_D44R0103_gsmiddleman1, _0714
	GoTo _063D

_062D:
	ApplyMovement obj_player, _06EC
	ApplyMovement obj_D44R0103_gsmiddleman1, _0714
_063D:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0664
	ApplyMovement obj_partner_poke, _0720
	WaitMovement
_0664:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 46
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

_069E:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_06B2:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_06C8:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_06E0:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_06EC:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0700:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0714:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0720:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement
	.balign 4, 0
