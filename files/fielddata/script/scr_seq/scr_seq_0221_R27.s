#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R27.h"
#include "msgdata/msg/msg_0369_R27.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R27_000
	ScrDef scr_seq_R27_001
	ScrDef scr_seq_R27_002
	ScrDef scr_seq_R27_003
	ScrDef scr_seq_R27_004
	ScrDefEnd

scr_seq_R27_003:
	GoToIfSet FLAG_UNK_168, _0026
	ScrCmd_804 1
	End

_0026:
	End

scr_seq_R27_000:
	SimpleNPCMsg msg_0369_R27_00001
	End

scr_seq_R27_001:
	ScrCmd_609
	LockAll
	ApplyMovement obj_R27_gsbigman, _00A8
	WaitMovement
	NPCMsg msg_0369_R27_00000
	CloseMsg
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 402
	GoToIfNe _006F
	ApplyMovement obj_R27_gsbigman, _00C4
	GoTo _0092

_006F:
	Compare VAR_TEMP_x4001, 403
	GoToIfNe _008A
	ApplyMovement obj_R27_gsbigman, _00B0
	GoTo _0092

_008A:
	ApplyMovement obj_R27_gsbigman, _00B8
_0092:
	WaitMovement
	NPCMsg msg_0369_R27_00001
	WaitButton
	CloseMsg
	ReleaseAll
	SetVar VAR_UNK_408A, 1
	End

	.balign 4, 0
_00A8:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_00B0:
	WalkNormalWest 4
	EndMovement

	.balign 4, 0
_00B8:
	WalkNormalSouth
	WalkNormalWest 4
	EndMovement

	.balign 4, 0
_00C4:
	WalkNormalNorth
	WalkNormalWest 4
	EndMovement

scr_seq_R27_002:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0369_R27_00002, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_R27_004:
	DirectionSignpost msg_0369_R27_00003, 1, 5, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
