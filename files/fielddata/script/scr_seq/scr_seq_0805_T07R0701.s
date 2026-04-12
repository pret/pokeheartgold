#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07R0701.h"
#include "msgdata/msg/msg_0510_T07R0701.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T07R0701_000
	ScrDef scr_seq_T07R0701_001
	ScrDef scr_seq_T07R0701_002
	ScrDef scr_seq_T07R0701_003
	ScrDef scr_seq_T07R0701_004
	ScrDef scr_seq_T07R0701_005
	ScrDef scr_seq_T07R0701_006
	ScrDefEnd

scr_seq_T07R0701_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0510_T07R0701_00006
	CloseMsg
	ApplyMovement obj_T07R0701_leader4, _003C
	WaitMovement
	ReleaseAll
	End

	.balign 4, 0
_003C:
	WalkOnSpotNormalEast
	EndMovement

scr_seq_T07R0701_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	HasItem ITEM_COIN_CASE, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0074
	NPCMsg msg_0510_T07R0701_00004
	CloseMsg
	ApplyMovement obj_T07R0701_gswoman1, _00D8
	WaitMovement
	ReleaseAll
	End

_0074:
	NPCMsg msg_0510_T07R0701_00005
	CloseMsg
	ApplyMovement obj_T07R0701_gswoman1, _00D8
	WaitMovement
	ReleaseAll
	End

scr_seq_T07R0701_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0510_T07R0701_00001
	CloseMsg
	ApplyMovement obj_T07R0701_gsbigman_3, _00E0
	WaitMovement
	ReleaseAll
	End

scr_seq_T07R0701_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0510_T07R0701_00002
	CloseMsg
	ApplyMovement obj_T07R0701_gsbigman_2, _00E0
	WaitMovement
	ReleaseAll
	End

scr_seq_T07R0701_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0510_T07R0701_00003
	CloseMsg
	ApplyMovement obj_T07R0701_gsbigman, _00D8
	WaitMovement
	ReleaseAll
	End

	.balign 4, 0
_00D8:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_00E0:
	WalkOnSpotNormalNorth
	EndMovement

scr_seq_T07R0701_000:
	SimpleNPCMsg msg_0510_T07R0701_00000
	End

scr_seq_T07R0701_006:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0510_T07R0701_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
