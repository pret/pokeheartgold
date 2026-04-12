#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D31R0202.h"
#include "msgdata/msg/msg_0003_EVERYWHERE.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D31R0202_000
	ScrDef scr_seq_D31R0202_001
	ScrDef scr_seq_D31R0202_002
	ScrDef scr_seq_D31R0202_003
	ScrDefEnd

scr_seq_D31R0202_000:
	Compare VAR_UNK_414D, 0
	CallIfNe _008A
	ScrCmd_412 43, 0, VAR_TEMP_x400A
	Call _008E
	Compare VAR_TEMP_x400A, 2
	CallIfEq _009E
	Compare VAR_TEMP_x400A, 3
	CallIfEq _009E
	Compare VAR_TEMP_x400A, 0
	CallIfEq _008E
	Compare VAR_TEMP_x400A, 1
	CallIfEq _008E
	Compare VAR_TEMP_x400A, 4
	CallIfEq _0096
	Compare VAR_TEMP_x400A, 5
	CallIfEq _0096
	Compare VAR_TEMP_x400A, 6
	CallIfEq _0096
	End

_008A:
	ScrCmd_520
	Return

_008E:
	SetVar VAR_OBJ_10, 282
	Return

_0096:
	SetVar VAR_OBJ_10, 286
	Return

_009E:
	SetVar VAR_OBJ_10, 283
	Return

_00A6:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_412 43, 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 4
	GoToIfEq _0200
	Compare VAR_SPECIAL_RESULT, 5
	GoToIfEq _0200
	ScrCmd_436
	ScrCmd_627 5
	RestoreOverworld
	Warp MAP_BATTLE_TOWER, 0, 15, 6, DIR_NORTH
	End

_00E9:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_436
	ScrCmd_627 6
	RestoreOverworld
	Warp MAP_BATTLE_TOWER, 0, 11, 6, DIR_NORTH
	End

_010A:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_BATTLE_TOWER_PARTNER_ROOM, 0, 8, 2, DIR_SOUTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_0132:
	Call _018E
	ElevatorAnim VAR_TEMP_x4000, 3
	Call _019A
	Return

scr_seq_D31R0202_001:
	ScrCmd_609
	LockAll
	SetVar VAR_TEMP_x4000, 0
	Call _0132
	GoTo _00A6
	End

scr_seq_D31R0202_002:
	ScrCmd_609
	LockAll
	SetVar VAR_TEMP_x4000, 0
	Call _0132
	GoTo _00E9
	End

scr_seq_D31R0202_003:
	ScrCmd_609
	LockAll
	SetVar VAR_TEMP_x4000, 1
	Call _0132
	GoTo _010A
	End

_018E:
	ApplyMovement obj_player, _01C4
	WaitMovement
	Return

_019A:
	ApplyMovement obj_D31R0202_var_11, _01D0
	ApplyMovement obj_player, _01EC
	WaitMovement
	Return

	.balign 4, 0
_01B0:
	WalkNormalNorth 2
	FaceEast
	WalkNormalEast
	FaceSouth
	EndMovement

	.balign 4, 0
_01C4:
	WalkNormalNorth 2
	FaceSouth
	EndMovement

	.balign 4, 0
_01D0:
	WalkNormalSouth
	FaceWest
	WalkNormalWest
	FaceSouth
	WalkNormalSouth
	SetInvisible
	EndMovement

	.balign 4, 0
_01EC:
	Delay8 2
	Delay2
	WalkNormalSouth 2
	SetInvisible
	EndMovement

_0200:
	ScrCmd_436
	ScrCmd_627 5
	RestoreOverworld
	Warp MAP_BATTLE_TOWER, 0, 19, 6, DIR_NORTH
	End
	.balign 4, 0
