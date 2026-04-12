#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D48R0101.h"
#include "msgdata/msg/msg_0136_D48R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D48R0101_000
	ScrDef scr_seq_D48R0101_001
	ScrDef scr_seq_D48R0101_002
	ScrDef scr_seq_D48R0101_003
	ScrDef scr_seq_D48R0101_004
	ScrDef scr_seq_D48R0101_005
	ScrDef scr_seq_D48R0101_006
	ScrDefEnd

scr_seq_D48R0101_005:
	Compare VAR_SCENE_EMBEDDED_TOWER, 2
	GoToIfEq _0031
	SetFlag FLAG_HIDE_CLIFFS_EDGE_GATE_CHUCK
	End

_0031:
	ClearFlag FLAG_HIDE_CLIFFS_EDGE_GATE_CHUCK
	End

scr_seq_D48R0101_006:
	Compare VAR_SCENE_EMBEDDED_TOWER, 2
	GoToIfEq _0046
	End

_0046:
	GetPlayerFacing VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 2
	GoToIfEq _0065
	MovePersonFacing obj_D48R0101_gsleader5, 19, 0, 40, DIR_SOUTH
	End

_0065:
	End

scr_seq_D48R0101_004:
	ScrCmd_609
	LockAll
	Compare VAR_TEMP_x4001, 2
	GoToIfNe _0086
	ApplyMovement obj_D48R0101_gsleader5, _0130
	GoTo _008E

_0086:
	ApplyMovement obj_D48R0101_gsleader5, _0148
_008E:
	WaitMovement
	BufferPlayersName 0
	NPCMsg msg_0136_D48R0101_00007
	CloseMsg
	Compare VAR_TEMP_x4001, 2
	GoToIfNe _00B3
	ApplyMovement obj_D48R0101_gsleader5, _0160
	GoTo _00BB

_00B3:
	ApplyMovement obj_D48R0101_gsleader5, _016C
_00BB:
	WaitMovement
	NPCMsg msg_0136_D48R0101_00008
	CloseMsg
	Compare VAR_TEMP_x4001, 2
	GoToIfNe _00DD
	ApplyMovement obj_D48R0101_gsleader5, _0178
	GoTo _00E5

_00DD:
	ApplyMovement obj_D48R0101_gsleader5, _0180
_00E5:
	WaitMovement
	NPCMsg msg_0136_D48R0101_00009
	CloseMsg
	Compare VAR_TEMP_x4001, 2
	GoToIfNe _010F
	ApplyMovement obj_player, _01A8
	ApplyMovement obj_D48R0101_gsleader5, _0188
	GoTo _0117

_010F:
	ApplyMovement obj_D48R0101_gsleader5, _0194
_0117:
	WaitMovement
	PlaySE SEQ_SE_DP_KAIDAN2
	SetFlag FLAG_HIDE_CLIFFS_EDGE_GATE_CHUCK
	HidePerson obj_D48R0101_gsleader5
	SetVar VAR_SCENE_EMBEDDED_TOWER, 3
	ReleaseAll
	End

	.balign 4, 0
_0130:
	WalkOnSpotNormalEast
	Delay8
	WalkNormalEast 2
	WalkNormalSouth
	WalkNormalEast
	EndMovement

	.balign 4, 0
_0148:
	WalkOnSpotNormalSouth
	Delay8
	WalkNormalSouth 3
	WalkNormalWest
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_0160:
	EmoteExclamationMark
	Delay8
	EndMovement

	.balign 4, 0
_016C:
	EmoteExclamationMark
	Delay8
	EndMovement

	.balign 4, 0
_0178:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0180:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0188:
	Delay8
	WalkNormalEast 2
	EndMovement

	.balign 4, 0
_0194:
	Delay8
	WalkNormalNorth 4
	WalkNormalEast 2
	WalkNormalNorth 9
	EndMovement

	.balign 4, 0
_01A8:
	LockDir
	WalkNormalNorth
	UnlockDir
	WalkOnSpotNormalSouth
	EndMovement

scr_seq_D48R0101_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNK_40EB, 1
	GoToIfEq _0215
	GoToIfSet FLAG_UNK_0F5, _01E7
	NPCMsg msg_0136_D48R0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01E7:
	NPCMsg msg_0136_D48R0101_00001
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _020A
	NPCMsg msg_0136_D48R0101_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_020A:
	NPCMsg msg_0136_D48R0101_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0215:
	NPCMsg msg_0136_D48R0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0220:
	WalkOnSpotFastNorth
	EndMovement

	.balign 4, 0
_0228:
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_0230:
	WalkNormalNorth 2
	EndMovement

scr_seq_D48R0101_001:
	SimpleNPCMsg msg_0136_D48R0101_00005
	End

scr_seq_D48R0101_002:
	SimpleNPCMsg msg_0136_D48R0101_00006
	End

scr_seq_D48R0101_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_0F5, _027C
	NPCMsg msg_0136_D48R0101_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

_027C:
	NPCMsg msg_0136_D48R0101_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
