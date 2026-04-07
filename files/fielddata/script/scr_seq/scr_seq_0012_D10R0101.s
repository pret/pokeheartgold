#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D10R0101.h"
#include "msgdata/msg/msg_0052_D10R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D10R0101_000
	ScrDef scr_seq_D10R0101_001
	ScrDef scr_seq_D10R0101_002
	ScrDef scr_seq_D10R0101_003
	ScrDef scr_seq_D10R0101_004
	ScrDef scr_seq_D10R0101_005
	ScrDefEnd

scr_seq_D10R0101_000:
	PalParkAction 2
	End

scr_seq_D10R0101_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NonNPCMsg msg_0052_D10R0101_00006
	Wait 30, VAR_SPECIAL_RESULT
	NonNPCMsg msg_0052_D10R0101_00007
	PlaySE SEQ_SE_DP_DECIDE
	Wait 30, VAR_SPECIAL_RESULT
	NonNPCMsg msg_0052_D10R0101_00008
	PlaySE SEQ_SE_DP_DECIDE
	Wait 30, VAR_SPECIAL_RESULT
	NonNPCMsg msg_0052_D10R0101_00009
	PlaySE SEQ_SE_DP_DECIDE
	Wait 30, VAR_SPECIAL_RESULT
	NonNPCMsg msg_0052_D10R0101_00010
	PlaySE SEQ_SE_DP_CON_016
	Wait 30, VAR_SPECIAL_RESULT
	PalParkAction 0
	SetVar VAR_UNK_4124, 1
	CloseMsg
	ReleaseAll
	End

	; unreferenced
	PalParkAction 0
	SetVar VAR_UNK_4124, 1
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D10R0101_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	PlaySE SEQ_SE_DP_PINPON
	BufferPlayersName 0
	NPCMsg msg_0052_D10R0101_00004
	PlayBGM SEQ_SILENCE_DUNGEON
	PlayFanfare SEQ_ME_ITEM
	WaitFanfare
	CloseMsg
	ReleaseAll
	SetVar VAR_UNK_4124, 1
	Call _01D4
	End

scr_seq_D10R0101_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0052_D10R0101_00005
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	CloseMsg
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _00D5
	ReleaseAll
	End

_00D5:
	SetVar VAR_UNK_4124, 2
	ReleaseAll
	Call _01D4
	End

scr_seq_D10R0101_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Call _0180
	CloseMsg
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0110
	SetVar VAR_UNK_4124, 2
	ReleaseAll
	Call _01D4
	End

_0110:
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0134
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ReleaseAll
	End

	.balign 4, 0
_0134:
	WalkNormalNorth
	EndMovement

scr_seq_D10R0101_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Call _0180
	CloseMsg
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0169
	SetVar VAR_UNK_4124, 2
	ReleaseAll
	Call _01D4
	End

_0169:
	ApplyMovement obj_D10R0101_mount_2, _0178
	WaitMovement
	ReleaseAll
	End

	.balign 4, 0
_0178:
	WalkOnSpotNormalWest
	EndMovement

_0180:
	NPCMsg msg_0052_D10R0101_00000
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01C9
	GetPlayerGender VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _01B9
	BufferPlayersName 0
	NPCMsg msg_0052_D10R0101_00002
	WaitButton
	SetVar VAR_SPECIAL_RESULT, 0
	Return

_01B9:
	BufferPlayersName 0
	NPCMsg msg_0052_D10R0101_00003
	WaitButton
	SetVar VAR_SPECIAL_RESULT, 0
	Return

_01C9:
	NPCMsg msg_0052_D10R0101_00001
	SetVar VAR_SPECIAL_RESULT, 1
	Return

_01D4:
	PalParkAction 1
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_FUCHSIA_PAL_PARK_ENTRANCE, 0, 7, 7, DIR_SOUTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Return
	.balign 4, 0
