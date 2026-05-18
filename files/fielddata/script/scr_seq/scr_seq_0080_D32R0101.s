#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D32R0101.h"
#include "msgdata/msg/msg_0103_D32R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D32R0101_000
	ScrDef scr_seq_D32R0101_001
	ScrDef scr_seq_D32R0101_002
	ScrDef scr_seq_D32R0101_003
	ScrDef scr_seq_D32R0101_004
	ScrDef scr_seq_D32R0101_005
	ScrDef scr_seq_D32R0101_006
	ScrDef scr_seq_D32R0101_007
	ScrDef scr_seq_D32R0101_008
	ScrDef scr_seq_D32R0101_009
	ScrDef scr_seq_D32R0101_010
	ScrDef scr_seq_D32R0101_011
	ScrDefEnd

scr_seq_D32R0101_011:
	SetFlag FLAG_SYS_FLYPOINT_UNION_CAVE
	SetVar VAR_UNK_40E5, 2
	End

scr_seq_D32R0101_000:
	ScrCmd_609
	LockAll
	SetVar VAR_UNK_40E6, 1
	Call _02FF
	NPCMsg msg_0103_D32R0101_00000
	CloseMsg
	Call _0333
	GoToIfSet FLAG_UNK_176, _0077
	NPCMsg msg_0103_D32R0101_00001
	BufferPlayersName 0
	PlayFanfare SEQ_ME_ITEM
	NPCMsg msg_0103_D32R0101_00002
	WaitFanfare
	SetFlag FLAG_UNK_176
_0077:
	NPCMsg msg_0103_D32R0101_00003
	Call _00A6
	TouchscreenMenuShow
	NPCMsg msg_0103_D32R0101_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D32R0101_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0103_D32R0101_00004
	Call _00A6
	GoTo _012B
	End

_00A6:
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 451, 255, 0
	MenuItemAdd 452, 255, 1
	MenuItemAdd 453, 255, 2
	MenuItemAdd 454, 255, 3
	MenuItemAdd 455, 255, 4
	MenuItemAdd 456, 255, 5
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _0138
	Case 1, _0170
	Case 2, _0146
	Case 3, _0154
	Case 4, _0162
	Return

_012B:
	TouchscreenMenuShow
	NPCMsg msg_0103_D32R0101_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0138:
	NPCMsg msg_0103_D32R0101_00005
	NPCMsg msg_0103_D32R0101_00004
	GoTo _00A6
	End

_0146:
	NPCMsg msg_0103_D32R0101_00007
	NPCMsg msg_0103_D32R0101_00004
	GoTo _00A6
	End

_0154:
	NPCMsg msg_0103_D32R0101_00008
	NPCMsg msg_0103_D32R0101_00004
	GoTo _00A6
	End

_0162:
	NPCMsg msg_0103_D32R0101_00009
	NPCMsg msg_0103_D32R0101_00004
	GoTo _00A6
	End

_0170:
	NPCMsg msg_0103_D32R0101_00006
	NPCMsg msg_0103_D32R0101_00004
	GoTo _00A6
	End

scr_seq_D32R0101_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0103_D32R0101_00017
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01AD
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _01B8
	End

_01AD:
	NPCMsg msg_0103_D32R0101_00018
	GoTo _01B8
	End

_01B8:
	NPCMsg msg_0103_D32R0101_00019
	GoTo _01C3
	End

_01C3:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D32R0101_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0103_D32R0101_00020
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01FA
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0205
	End

_01FA:
	NPCMsg msg_0103_D32R0101_00021
	GoTo _0205
	End

_0205:
	NPCMsg msg_0103_D32R0101_00022
	GoTo _0210
	End

_0210:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D32R0101_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0103_D32R0101_00023
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0247
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0252
	End

_0247:
	NPCMsg msg_0103_D32R0101_00024
	GoTo _0252
	End

_0252:
	NPCMsg msg_0103_D32R0101_00025
	GoTo _025D
	End

_025D:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D32R0101_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0103_D32R0101_00026
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0294
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _029F
	End

_0294:
	NPCMsg msg_0103_D32R0101_00027
	GoTo _029F
	End

_029F:
	NPCMsg msg_0103_D32R0101_00028
	GoTo _02AA
	End

_02AA:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D32R0101_006:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0103_D32R0101_00029
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _02E1
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _02EC
	End

_02E1:
	NPCMsg msg_0103_D32R0101_00030
	GoTo _02EC
	End

_02EC:
	NPCMsg msg_0103_D32R0101_00031
	GoTo _02F7
	End

_02F7:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_02FF:
	ApplyMovement obj_D32R0101_bfsw2, _0384
	ApplyMovement obj_D32R0101_bfsw2_2, _0384
	ApplyMovement obj_D32R0101_bfsw2_3, _0384
	ApplyMovement obj_D32R0101_bfsw2_4, _0384
	ApplyMovement obj_D32R0101_bfsw2_5, _0384
	ApplyMovement obj_D32R0101_bfsw2_6, _0384
	WaitMovement
	Return

_0333:
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_D32R0101_bfsw2, _038C
	ApplyMovement obj_D32R0101_bfsw2_2, _038C
	ApplyMovement obj_D32R0101_bfsw2_3, _038C
	ApplyMovement obj_D32R0101_bfsw2_4, _0394
	ApplyMovement obj_D32R0101_bfsw2_5, _0394
	ApplyMovement obj_D32R0101_bfsw2_6, _0394
	ApplyMovement obj_player, _039C
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	Return

	.balign 4, 0
_0384:
	FaceSouth
	EndMovement

	.balign 4, 0
_038C:
	FaceEast
	EndMovement

	.balign 4, 0
_0394:
	FaceWest
	EndMovement

	.balign 4, 0
_039C:
	WalkNormalNorth 3
	WalkOnSpotNormalWest
	EndMovement

scr_seq_D32R0101_007:
	SimpleNPCMsg msg_0103_D32R0101_00032
	End

scr_seq_D32R0101_008:
	SimpleNPCMsg msg_0103_D32R0101_00033
	End

scr_seq_D32R0101_009:
	SimpleNPCMsg msg_0103_D32R0101_00034
	End

scr_seq_D32R0101_010:
	SimpleNPCMsg msg_0103_D32R0101_00035
	End
	.balign 4, 0
