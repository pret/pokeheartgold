#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D51R0301.h"
#include "msgdata/msg/msg_0147_D51R0301.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D51R0301_000
	ScrDef scr_seq_D51R0301_001
	ScrDef scr_seq_D51R0301_002
	ScrDef scr_seq_D51R0301_003
	ScrDefEnd

scr_seq_D51R0301_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_09E, _002E
	NPCMsg msg_0147_D51R0301_00000
	CloseMsg
	SetFlag FLAG_UNK_09E
_002E:
	PlayerHasSpecies VAR_SPECIAL_RESULT, SPECIES_ARCEUS
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _004C
	NPCMsg msg_0147_D51R0301_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_004C:
	ApplyMovement obj_D51R0301_champion, _0188
	WaitMovement
	NPCMsg msg_0147_D51R0301_00001
	CloseMsg
	GetPlayerFacing VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 0
	GoToIfNe _0078
	GoTo _0107

_0072:
	GoTo _0097

_0078:
	Compare VAR_TEMP_x4002, 1
	GoToIfNe _0091
	GoTo _00CF

_008B:
	GoTo _0097

_0091:
	GoTo _0097

_0097:
	ApplyMovement obj_D51R0301_champion, _0194
	WaitMovement
	ApplyMovement obj_D51R0301_champion, _01A0
	WaitMovement
	NPCMsg msg_0147_D51R0301_00003
	CloseMsg
	ApplyMovement obj_D51R0301_champion, _01A8
	WaitMovement
	NPCMsg msg_0147_D51R0301_00004
	CloseMsg
	ApplyMovement obj_D51R0301_champion, _01B4
	WaitMovement
	GoTo _0167

_00CF:
	ApplyMovement obj_D51R0301_champion, _01C4
	WaitMovement
	ApplyMovement obj_D51R0301_champion, _01D0
	WaitMovement
	NPCMsg msg_0147_D51R0301_00003
	CloseMsg
	ApplyMovement obj_D51R0301_champion, _01D8
	WaitMovement
	NPCMsg msg_0147_D51R0301_00004
	CloseMsg
	ApplyMovement obj_D51R0301_champion, _01E0
	WaitMovement
	GoTo _0167

_0107:
	ApplyMovement obj_D51R0301_champion, _01F0
	WaitMovement
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _01FC
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ApplyMovement obj_D51R0301_champion, _0204
	WaitMovement
	NPCMsg msg_0147_D51R0301_00003
	CloseMsg
	ApplyMovement obj_D51R0301_champion, _020C
	WaitMovement
	ApplyMovement obj_player, _022C
	WaitMovement
	NPCMsg msg_0147_D51R0301_00004
	CloseMsg
	ApplyMovement obj_D51R0301_champion, _021C
	WaitMovement
	GoTo _0167

_0167:
	PlaySE SEQ_SE_DP_KAIDAN2
	SetFlag FLAG_UNK_2DD
	HidePerson obj_D51R0301_champion
	ClearFlag FLAG_HIDE_SINJOH_MYSTRI_SHRINE_CYNTHIA
	WaitSE SEQ_SE_DP_KAIDAN2
	SetVar VAR_SCENE_SINJOH_MYSTRI_ROOM, 7
	ReleaseAll
	End

	.balign 4, 0
_0188:
	EmoteExclamationMark
	Delay8
	EndMovement

	.balign 4, 0
_0194:
	WalkOnSpotNormalNorth
	WalkSlowNorth 2
	EndMovement

	.balign 4, 0
_01A0:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01A8:
	WalkNormalSouth 2
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_01B4:
	WalkNormalSouth 2
	WalkNormalWest 4
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01C4:
	WalkOnSpotNormalSouth
	WalkSlowSouth
	EndMovement

	.balign 4, 0
_01D0:
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_01D8:
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_01E0:
	WalkNormalSouth 2
	WalkNormalWest 4
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01F0:
	WalkOnSpotNormalNorth
	WalkSlowNorth 2
	EndMovement

	.balign 4, 0
_01FC:
	WalkSlowNorth
	EndMovement

	.balign 4, 0
_0204:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_020C:
	WalkNormalEast
	WalkNormalSouth 2
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_021C:
	WalkNormalSouth 2
	WalkNormalWest 5
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_022C:
	WalkOnSpotNormalEast
	EndMovement

scr_seq_D51R0301_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_SINJOH_MYSTRI_ROOM, 13
	GoToIfGe _026E
	GoToIfSet FLAG_UNK_09D, _0263
	NPCMsg msg_0147_D51R0301_00007
	WaitButton
	CloseMsg
	SetFlag FLAG_UNK_09D
	ReleaseAll
	End

_0263:
	NPCMsg msg_0147_D51R0301_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_026E:
	NPCMsg msg_0147_D51R0301_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D51R0301_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0147_D51R0301_00010
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _02A6
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfGe _030C
_02A6:
	NPCMsg msg_0147_D51R0301_00011
	CloseMsg
	PlaySE SEQ_SE_DP_TELE
	ApplyMovement obj_player, _0318
	WaitMovement
	Compare VAR_SCENE_SINJOH_MYSTRI_ROOM, 13
	GoToIfNe _02D2
	SetVar VAR_SCENE_SINJOH_MYSTRI_ROOM, 10
	GoTo _02E4

_02D2:
	SetVar VAR_SCENE_SINJOH_MYSTRI_ROOM, 1
	SetFlag FLAG_HIDE_SINJOH_MYSTRI_SHRINE_CYNTHIA
	ClearFlag FLAG_UNK_2DD
	ClearFlag FLAG_UNK_2DB
_02E4:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_NEW_BARK, 0, 695, 397, DIR_SOUTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_030C:
	NPCMsg msg_0147_D51R0301_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0318:
	FaceEast
	Delay4
	FaceSouth
	Delay4
	FaceWest
	Delay4
	FaceNorth
	Delay4
	FaceEast
	Delay2
	FaceSouth
	Delay2
	FaceWest
	Delay2
	FaceNorth
	Delay2
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
	EndMovement

scr_seq_D51R0301_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_ABRA, 0
	NPCMsg msg_0147_D51R0301_00013
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
