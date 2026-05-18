#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07SP0101.h"
#include "msgdata/msg/msg_0511_T07SP0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T07SP0101_000
	ScrDef scr_seq_T07SP0101_001
	ScrDef scr_seq_T07SP0101_002
	ScrDef scr_seq_T07SP0101_003
	ScrDefEnd

scr_seq_T07SP0101_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	HasItem ITEM_COIN_CASE, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0066
	ApplyMovement obj_T07SP0101_suit, _007C
	WaitMovement
	NPCMsg msg_0511_T07SP0101_00012
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CasinoGame 0, 0
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	SetVar VAR_TEMP_x4001, 2
	ReleaseAll
	End

_0066:
	NPCMsg msg_0511_T07SP0101_00010
	ApplyMovement obj_T07SP0101_suit, _007C
	WaitMovement
	NPCMsg msg_0511_T07SP0101_00011
	GoTo _00E4

	.balign 4, 0
_007C:
	FaceSouth
	EndMovement

	.balign 4, 0
_0084:
	FaceWest
	EndMovement

	.balign 4, 0
_008C:
	FaceEast
	EndMovement

scr_seq_T07SP0101_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetPlayerFacing VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 1
	GoToIfNe _00B9
	Call _00EC
	GoTo _00C1

_00B9:
	ApplyMovement obj_T07SP0101_suit, _007C
_00C1:
	WaitMovement
	HasItem ITEM_COIN_CASE, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _00E1
	NPCMsg msg_0511_T07SP0101_00013
	GoTo _00E4

_00E1:
	NPCMsg msg_0511_T07SP0101_00011
_00E4:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00EC:
	GetPlayerCoords VAR_TEMP_x4002, VAR_TEMP_x4003
	GetPlayerCoords VAR_TEMP_x4002, VAR_TEMP_x4003
	Compare VAR_TEMP_x4002, 6
	GoToIfNe _0113
	ApplyMovement obj_T07SP0101_suit, _0084
	GoTo _0128

_0113:
	Compare VAR_TEMP_x4002, 8
	GoToIfNe _0128
	ApplyMovement obj_T07SP0101_suit, _008C
_0128:
	Return

scr_seq_T07SP0101_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	HasItem ITEM_COIN_CASE, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0184
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _0163
	NPCMsg msg_0511_T07SP0101_00006
	SetVar VAR_TEMP_x4001, 1
	GoTo _017C

_0163:
	Compare VAR_TEMP_x4001, 1
	GoToIfNe _0179
	NPCMsg msg_0511_T07SP0101_00007
	GoTo _017C

_0179:
	NPCMsg msg_0511_T07SP0101_00008
_017C:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0184:
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _019A
	NPCMsg msg_0511_T07SP0101_00000
	GoTo _019D

_019A:
	NPCMsg msg_0511_T07SP0101_00009
_019D:
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _01D4
	NPCMsg msg_0511_T07SP0101_00003
	SetVar VAR_TEMP_x4001, 1
	GiveItemNoCheck ITEM_COIN_CASE, 1
	NPCMsg msg_0511_T07SP0101_00004
	GoTo _00E4

_01D4:
	SetVar VAR_TEMP_x4001, 1
	NPCMsg msg_0511_T07SP0101_00005
	GoTo _00E4

scr_seq_T07SP0101_001:
	SimpleNPCMsg msg_0511_T07SP0101_00014
	End
	.balign 4, 0
