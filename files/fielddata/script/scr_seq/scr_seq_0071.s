#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0071.h"
#include "msgdata/msg/msg_0003_EVERYWHERE.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_0071_000
	ScrDef scr_seq_0071_001
	ScrDef scr_seq_0071_002
	ScrDefEnd

scr_seq_0071_000:
	End

scr_seq_0071_001:
	Compare VAR_UNK_414E, 0
	CallIfNe _001F
	End

_001F:
	MakeObjectVisible obj_player
	Return

scr_seq_0071_002:
	ScrCmd_609
	LockAll
	Call _0090
	Random VAR_SPECIAL_RESULT, 4
	Switch VAR_SPECIAL_RESULT
	Case 1, _00F2
	Case 2, _010C
	Case 3, _0126
	GoTo _00D8

_0068:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_BATTLE_TOWER_UNUSED_3, 0, 7, 6, DIR_NORTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_0090:
	ScrCmd_307 0, 0, 2, 2, 77
	ScrCmd_310 77
	ScrCmd_308 77
	ApplyMovement 0, _0140
	WaitMovement
	ScrCmd_374 obj_player
	ApplyMovement obj_player, _014C
	WaitMovement
	ScrCmd_311 77
	ScrCmd_308 77
	ScrCmd_309 77
	Return

_00C4:
	ApplyMovement 0, _0154
	ApplyMovement obj_player, _0164
	WaitMovement
	Return

_00D8:
	ApplyMovement 0, _0178
	ApplyMovement obj_player, _0188
	WaitMovement
	GoTo _0068
	End

_00F2:
	ApplyMovement 0, _019C
	ApplyMovement obj_player, _01AC
	WaitMovement
	GoTo _0068
	End

_010C:
	ApplyMovement 0, _01C0
	ApplyMovement obj_player, _01D0
	WaitMovement
	GoTo _0068
	End

_0126:
	ApplyMovement 0, _01E4
	ApplyMovement obj_player, _01F4
	WaitMovement
	GoTo _0068
	End

	.balign 4, 0
_0140:
	WalkNormalSouth 3
	FaceNorth
	EndMovement

	.balign 4, 0
_014C:
	WalkNormalSouth 2
	EndMovement

	.balign 4, 0
_0154:
	FaceNorth
	WalkNormalNorth 2
	SetInvisible
	EndMovement

	.balign 4, 0
_0164:
	WalkNormalEast
	FaceNorth
	WalkFasterNorth
	SetInvisible
	EndMovement

	.balign 4, 0
_0178:
	WalkNormalEast 4
	WalkNormalNorth 2
	SetInvisible
	EndMovement

	.balign 4, 0
_0188:
	WalkNormalSouth
	WalkNormalEast 4
	WalkNormalNorth 2
	SetInvisible
	EndMovement

	.balign 4, 0
_019C:
	WalkNormalEast 8
	WalkNormalNorth 2
	SetInvisible
	EndMovement

	.balign 4, 0
_01AC:
	WalkNormalSouth
	WalkNormalEast 8
	WalkNormalNorth 2
	SetInvisible
	EndMovement

	.balign 4, 0
_01C0:
	WalkNormalEast 12
	WalkNormalNorth 2
	SetInvisible
	EndMovement

	.balign 4, 0
_01D0:
	WalkNormalSouth
	WalkNormalEast 12
	WalkNormalNorth 2
	SetInvisible
	EndMovement

	.balign 4, 0
_01E4:
	WalkNormalEast 16
	WalkNormalNorth 2
	SetInvisible
	EndMovement

	.balign 4, 0
_01F4:
	WalkNormalSouth
	WalkNormalEast 16
	WalkNormalNorth 2
	SetInvisible
	EndMovement
	.balign 4, 0
