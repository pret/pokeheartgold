#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D24R0102.h"
#include "msgdata/msg/msg_0073_D24R0102.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D24R0102_000
	ScrDef scr_seq_D24R0102_001
	ScrDef scr_seq_D24R0102_002
	ScrDef scr_seq_D24R0102_003
	ScrDef scr_seq_D24R0102_004
	ScrDef scr_seq_D24R0102_005
	ScrDefEnd

scr_seq_D24R0102_005:
	ClearFlag FLAG_UNK_10F
	End

scr_seq_D24R0102_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	ScrCmd_545 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 28
	GoToIfEq _0093
	Compare VAR_UNK_40EC, 1
	GoToIfGe _008A
	GoToIfSet FLAG_UNK_10F, _0081
	NPCMsg msg_0073_D24R0102_00000
	SetFlag FLAG_UNK_10F
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0077
	ApplyMovement obj_D24R0102_suit, _009C
	GoTo _007F

_0077:
	ApplyMovement obj_D24R0102_suit, _00E4
_007F:
	WaitMovement
_0081:
	NPCMsg msg_0073_D24R0102_00001
	GoTo _0366

_008A:
	NPCMsg msg_0073_D24R0102_00002
	GoTo _0366

_0093:
	NPCMsg msg_0073_D24R0102_00003
	GoTo _0366

	.balign 4, 0
_009C:
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_00E4:
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	EmoteExclamationMark
	EndMovement

scr_seq_D24R0102_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNOWN_REPORT_LEVEL, 8
	GoToIfEq _033C
	Compare VAR_UNOWN_REPORT_LEVEL, 7
	GoToIfEq _02C4
	Compare VAR_UNOWN_REPORT_LEVEL, 4
	GoToIfGe _0277
	ScrCmd_545 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _02DB
	CheckSeenAllLetterUnown VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0223
	Compare VAR_UNK_40EC, 4
	GoToIfEq _01F6
	Compare VAR_UNK_40EC, 3
	GoToIfEq _01D6
	Compare VAR_UNK_40EC, 2
	GoToIfEq _01C3
	Compare VAR_UNK_40EC, 1
	GoToIfEq _01BA
_01B1:
	NPCMsg msg_0073_D24R0102_00004
	GoTo _0366

_01BA:
	NPCMsg msg_0073_D24R0102_00005
	GoTo _0366

_01C3:
	Compare VAR_UNOWN_REPORT_LEVEL, 1
	GoToIfEq _035D
	GoTo _02FA

_01D6:
	Compare VAR_UNOWN_REPORT_LEVEL, 2
	GoToIfEq _035D
	Compare VAR_UNOWN_REPORT_LEVEL, 1
	GoToIfEq _0303
	GoTo _02FA

_01F6:
	Compare VAR_UNOWN_REPORT_LEVEL, 3
	GoToIfEq _035D
	Compare VAR_UNOWN_REPORT_LEVEL, 2
	GoToIfEq _030C
	Compare VAR_UNOWN_REPORT_LEVEL, 1
	GoToIfEq _0303
	GoTo _02FA

_0223:
	Compare VAR_UNK_40EC, 0
	GoToIfEq _01B1
	Compare VAR_UNK_40EC, 1
	GoToIfEq _01BA
	Compare VAR_UNOWN_REPORT_LEVEL, 4
	GoToIfEq _035D
	Compare VAR_UNOWN_REPORT_LEVEL, 3
	GoToIfEq _0315
	Compare VAR_UNOWN_REPORT_LEVEL, 2
	GoToIfEq _030C
	Compare VAR_UNOWN_REPORT_LEVEL, 1
	GoToIfEq _0303
	GoTo _02FA

_0277:
	Compare VAR_UNOWN_REPORT_LEVEL, 6
	GoToIfEq _035D
	Compare VAR_UNK_40F1, 4
	GoToIfEq _02B1
	Compare VAR_UNOWN_REPORT_LEVEL, 5
	GoToIfEq _035D
	Compare VAR_UNK_40F1, 1
	GoToIfGe _0321
	GoTo _035D

_02B1:
	Compare VAR_UNOWN_REPORT_LEVEL, 5
	GoToIfEq _032A
	GoTo _0321

_02C4:
	ScrCmd_545 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 28
	GoToIfEq _0333
	GoTo _035D

_02DB:
	Compare VAR_UNK_40EC, 1
	GoToIfEq _02F1
	NPCMsg msg_0073_D24R0102_00004
	GoTo _0366

_02F1:
	NPCMsg msg_0073_D24R0102_00009
	GoTo _0366

_02FA:
	NPCMsg msg_0073_D24R0102_00006
	GoTo _0345

_0303:
	NPCMsg msg_0073_D24R0102_00007
	GoTo _0345

_030C:
	NPCMsg msg_0073_D24R0102_00008
	GoTo _0345

_0315:
	NPCMsg msg_0073_D24R0102_00010
	NPCMsg msg_0073_D24R0102_00011
	GoTo _0345

_0321:
	NPCMsg msg_0073_D24R0102_00012
	GoTo _0345

_032A:
	NPCMsg msg_0073_D24R0102_00013
	GoTo _0345

_0333:
	NPCMsg msg_0073_D24R0102_00014
	GoTo _0345

_033C:
	NPCMsg msg_0073_D24R0102_00017
	GoTo _0366

_0345:
	BufferPlayersName 0
	NPCMsg msg_0073_D24R0102_00016
	PlayFanfare SEQ_ME_LVUP
	WaitFanfare
	AddVar VAR_UNOWN_REPORT_LEVEL, 1
	GoTo _0366

_035D:
	NPCMsg msg_0073_D24R0102_00015
	GoTo _0366

_0366:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D24R0102_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckSeenAllLetterUnown VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _03AA
	ScrCmd_545 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _03A1
	NPCMsg msg_0073_D24R0102_00019
	GoTo _0366

_03A1:
	NPCMsg msg_0073_D24R0102_00018
	GoTo _0366

_03AA:
	NPCMsg msg_0073_D24R0102_00020
	GoTo _0366

scr_seq_D24R0102_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNOWN_REPORT_LEVEL, 7
	GoToIfGe _03EB
	CheckSeenAllLetterUnown VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _03E2
	NPCMsg msg_0073_D24R0102_00021
	GoTo _0366

_03E2:
	NPCMsg msg_0073_D24R0102_00022
	GoTo _0366

_03EB:
	NPCMsg msg_0073_D24R0102_00023
	GoTo _0366

scr_seq_D24R0102_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0073_D24R0102_00024
	GoTo _0366
	.balign 4, 0
