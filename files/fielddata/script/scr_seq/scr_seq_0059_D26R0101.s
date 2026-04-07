#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D26R0101.h"
#include "msgdata/msg/msg_0090_D26R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D26R0101_000
	ScrDef scr_seq_D26R0101_001
	ScrDef scr_seq_D26R0101_002
	ScrDefEnd

scr_seq_D26R0101_002:
	GoToIfUnset FLAG_UNK_189, _001F
	ClearFlag FLAG_UNK_189
	End

_001F:
	CheckBadge BADGE_PLAIN, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfEq _005D
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1
	GoToIfEq _0063
	Compare VAR_TEMP_x4000, 3
	GoToIfEq _0063
	Compare VAR_TEMP_x4000, 5
	GoToIfEq _0063
_005D:
	SetFlag FLAG_HIDE_CAMERON
	End

_0063:
	ClearFlag FLAG_HIDE_CAMERON
	End

scr_seq_D26R0101_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	BufferPlayersName 0
	NPCMsg msg_0090_D26R0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D26R0101_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0184
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0198
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _00F0
	ApplyMovement obj_player, _01AC
	GoTo _0123

_00F0:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _0113
	ApplyMovement obj_player, _01CC
	ApplyMovement obj_D26R0101_gsmiddleman1, _01E0
	GoTo _0123

_0113:
	ApplyMovement obj_player, _01B8
	ApplyMovement obj_D26R0101_gsmiddleman1, _01E0
_0123:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _014A
	ApplyMovement obj_partner_poke, _01EC
	WaitMovement
_014A:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 6
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

_0184:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0198:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_01AC:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01B8:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01CC:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01E0:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_01EC:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement
	.balign 4, 0
