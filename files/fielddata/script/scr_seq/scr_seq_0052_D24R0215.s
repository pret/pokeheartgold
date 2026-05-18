#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D24R0215.h"
#include "msgdata/msg/msg_0083_D24R0215.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D24R0215_000
	ScrDef scr_seq_D24R0215_001
	ScrDefEnd

scr_seq_D24R0215_000:
	ScrCmd_609
	LockAll
	SetVar VAR_UNK_40D5, 1
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0034
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _007E
	End

_0034:
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0053
	ApplyMovement obj_player, _0108
	GoTo _0076

_0053:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _006E
	ApplyMovement obj_player, _0140
	GoTo _0076

_006E:
	ApplyMovement obj_player, _0124
_0076:
	WaitMovement
	GoTo _00DA

_007E:
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _00A5
	ApplyMovement obj_player, _0108
	ApplyMovement obj_partner_poke, _0114
	GoTo _00D8

_00A5:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _00C8
	ApplyMovement obj_player, _0140
	ApplyMovement obj_partner_poke, _014C
	GoTo _00D8

_00C8:
	ApplyMovement obj_player, _0124
	ApplyMovement obj_partner_poke, _0130
_00D8:
	WaitMovement
_00DA:
	PlaySE SEQ_SE_GS_RAKKA01
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_RUINS_OF_ALPH_SOUTHWEST_HIDDEN_ROOM, 0, 11, 7, VAR_SPECIAL_RESULT
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

	.balign 4, 0
_0108:
	WalkOnSpotFasterNorth 4
	SetInvisible
	EndMovement

	.balign 4, 0
_0114:
	Delay4 3
	WalkFasterNorth
	SetInvisible
	EndMovement

	.balign 4, 0
_0124:
	WalkOnSpotFasterWest 4
	SetInvisible
	EndMovement

	.balign 4, 0
_0130:
	Delay4 3
	WalkFasterWest
	SetInvisible
	EndMovement

	.balign 4, 0
_0140:
	WalkOnSpotFasterEast 4
	SetInvisible
	EndMovement

	.balign 4, 0
_014C:
	Delay4 3
	WalkFasterEast
	SetInvisible
	EndMovement

scr_seq_D24R0215_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0083_D24R0215_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
