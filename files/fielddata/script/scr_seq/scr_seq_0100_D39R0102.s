#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D39R0102.h"
#include "msgdata/msg/msg_0003_EVERYWHERE.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D39R0102_000
	ScrDef scr_seq_D39R0102_001
	ScrDef scr_seq_D39R0102_002
	ScrDef scr_seq_D39R0102_003
	ScrDefEnd

scr_seq_D39R0102_000:
	SetVar VAR_TEMP_x4000, 12
	SetVar VAR_TEMP_x4001, 12
	GoTo _0062
	End

scr_seq_D39R0102_001:
	SetVar VAR_TEMP_x4000, 10
	SetVar VAR_TEMP_x4001, 21
	GoTo _0062
	End

scr_seq_D39R0102_002:
	SetVar VAR_TEMP_x4000, 20
	SetVar VAR_TEMP_x4001, 10
	GoTo _0062
	End

scr_seq_D39R0102_003:
	SetVar VAR_TEMP_x4000, 21
	SetVar VAR_TEMP_x4001, 23
	GoTo _0062
	End

_0062:
	ScrCmd_609
	LockAll
	SetVar VAR_UNK_40AB, 1
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0093
	ApplyMovement obj_player, _0118
	ApplyMovement obj_partner_poke, _0124
	GoTo _00E9

_0093:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _00B6
	ApplyMovement obj_player, _0134
	ApplyMovement obj_partner_poke, _0140
	GoTo _00E9

_00B6:
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfNe _00D9
	ApplyMovement obj_player, _0150
	ApplyMovement obj_partner_poke, _015C
	GoTo _00E9

_00D9:
	ApplyMovement obj_player, _016C
	ApplyMovement obj_partner_poke, _0178
_00E9:
	WaitMovement
	PlaySE SEQ_SE_GS_RAKKA01
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_ICE_PATH_B2F, 0, VAR_TEMP_x4000, VAR_TEMP_x4001, VAR_SPECIAL_RESULT
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

	.balign 4, 0
_0118:
	WalkOnSpotFasterNorth 4
	SetInvisible
	EndMovement

	.balign 4, 0
_0124:
	Delay4 3
	WalkFasterNorth
	SetInvisible
	EndMovement

	.balign 4, 0
_0134:
	WalkOnSpotFasterSouth 4
	SetInvisible
	EndMovement

	.balign 4, 0
_0140:
	Delay4 3
	WalkFasterSouth
	SetInvisible
	EndMovement

	.balign 4, 0
_0150:
	WalkOnSpotFasterWest 4
	SetInvisible
	EndMovement

	.balign 4, 0
_015C:
	Delay4 3
	WalkFasterWest
	SetInvisible
	EndMovement

	.balign 4, 0
_016C:
	WalkOnSpotFasterEast 4
	SetInvisible
	EndMovement

	.balign 4, 0
_0178:
	Delay4 3
	WalkFasterEast
	SetInvisible
	EndMovement
	.balign 4, 0
