#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_HIROBA.h"
#include "msgdata/msg/msg_0212_HIROBA.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_HIROBA_000
	ScrDefEnd

scr_seq_HIROBA_000:
	ScrCmd_609
	LockAll
	Random VAR_SPECIAL_x8000, 5
	Switch VAR_SPECIAL_x8000
	Case 0, _0059
	Case 1, _0073
	Case 2, _008D
	Case 3, _00A7
	Case 4, _00C1
	End

_0059:
	ApplyMovement obj_player, _014C
	ApplyMovement obj_HIROBA_wifisf, _01F4
	WaitMovement
	GoTo _00DB
	End

_0073:
	ApplyMovement obj_player, _0158
	ApplyMovement obj_HIROBA_wifisf, _0204
	WaitMovement
	GoTo _00DB
	End

_008D:
	ApplyMovement obj_player, _0164
	ApplyMovement obj_HIROBA_wifisf, _0214
	WaitMovement
	GoTo _00DB
	End

_00A7:
	ApplyMovement obj_player, _0170
	ApplyMovement obj_HIROBA_wifisf, _0224
	WaitMovement
	GoTo _00DB
	End

_00C1:
	ApplyMovement obj_player, _017C
	ApplyMovement obj_HIROBA_wifisf, _0234
	WaitMovement
	GoTo _00DB
	End

_00DB:
	NPCMsg msg_0212_HIROBA_00000
	WaitABPress
	CloseMsg
	ApplyMovement obj_player, _0188
	ApplyMovement obj_HIROBA_wifisf, _0244
	WaitMovement
	PlaySE SEQ_SE_DP_TELE2
	ApplyMovement obj_player, _01EC
	WaitMovement
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	SetVar VAR_TEMP_x4003, 1
	Warp VAR_UNK_4056, 0, 5, 2, DIR_SOUTH
	ScrCmd_436
	ScrCmd_166 VAR_SPECIAL_RESULT
	CopyVar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	ScrCmd_663 VAR_SPECIAL_x8004
	RestoreOverworld
	SetVar VAR_UNK_4137, 1
	MakeObjectVisible obj_player
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

	.balign 4, 0
_014C:
	WalkNormalNorth 7
	WalkNormalWest 11
	EndMovement

	.balign 4, 0
_0158:
	WalkNormalNorth 7
	WalkNormalWest 9
	EndMovement

	.balign 4, 0
_0164:
	WalkNormalNorth 7
	WalkNormalWest 7
	EndMovement

	.balign 4, 0
_0170:
	WalkNormalNorth 7
	WalkNormalWest 5
	EndMovement

	.balign 4, 0
_017C:
	WalkNormalNorth 7
	WalkNormalWest 3
	EndMovement

	.balign 4, 0
_0188:
	WalkNormalNorth
	FaceWest
	Delay2
	FaceSouth
	Delay2
	FaceEast
	Delay2
	FaceNorth
	Delay2
	FaceWest
	Delay2
	FaceSouth
	Delay2
	FaceEast
	Delay2
	FaceNorth
	Delay2
	FaceWest
	Delay2
	FaceSouth
	Delay2
	FaceEast
	Delay2
	FaceNorth
	EndMovement

	.balign 4, 0
_01EC:
	WarpOut
	EndMovement

	.balign 4, 0
_01F4:
	WalkNormalNorth 6
	WalkNormalWest 12
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0204:
	WalkNormalNorth 6
	WalkNormalWest 10
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0214:
	WalkNormalNorth 6
	WalkNormalWest 8
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0224:
	WalkNormalNorth 6
	WalkNormalWest 6
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0234:
	WalkNormalNorth 6
	WalkNormalWest 4
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0244:
	WalkOnSpotNormalNorth
	EndMovement
	.balign 4, 0
