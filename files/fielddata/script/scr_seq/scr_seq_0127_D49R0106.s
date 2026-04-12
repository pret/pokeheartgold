#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D49R0106.h"
#include "msgdata/msg/msg_0142_D49R0106.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D49R0106_000
	ScrDef scr_seq_D49R0106_001
	ScrDef scr_seq_D49R0106_002
	ScrDef scr_seq_D49R0106_003
	ScrDef scr_seq_D49R0106_004
	ScrDef scr_seq_D49R0106_005
	ScrDef scr_seq_D49R0106_006
	ScrDef scr_seq_D49R0106_007
	ScrDef scr_seq_D49R0106_008
	ScrDefEnd

scr_seq_D49R0106_008:
	GoToIfSet FLAG_UNK_0F1, _0039
	SetVar VAR_TEMP_x400D, 0
	End

_0039:
	SetVar VAR_TEMP_x400D, 1
	End

scr_seq_D49R0106_007:
	Compare VAR_TEMP_x400D, 1
	GoToIfNe _0060
	MovePersonFacing obj_D49R0106_pcwoman2, 6, 1, 3, DIR_EAST
	SetVar VAR_TEMP_x400D, 0
_0060:
	End

scr_seq_D49R0106_000:
	SimpleNPCMsg msg_0142_D49R0106_00000
	End

scr_seq_D49R0106_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_0F1, _0093
	NPCMsg msg_0142_D49R0106_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0093:
	NPCMsg msg_0142_D49R0106_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D49R0106_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0142_D49R0106_00003
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _03AC
_00BC:
	NPCMsg msg_0142_D49R0106_00006
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 308, 255, 0
	MenuItemAdd 309, 255, 1
	MenuItemAdd 310, 255, 2
	MenuItemAdd 311, 255, 3
	MenuItemAdd 312, 255, 4
	MenuItemAdd 135, 255, 5
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 5, _03AC
	NPCMsg msg_0142_D49R0106_00007
	Case 0, _014D
	Case 1, _0187
	Case 2, _01C1
	Case 3, _01FB
	GoTo _0235
	End

_014D:
	SetVar VAR_TEMP_x4007, 0
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 298, 255, 0
	MenuItemAdd 299, 255, 1
	MenuItemAdd 304, 255, 6
	MenuItemAdd 13, 255, 10
	MenuExec
	GoTo _026F
	End

_0187:
	SetVar VAR_TEMP_x4007, 1
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 301, 255, 3
	MenuItemAdd 300, 255, 2
	MenuItemAdd 307, 255, 9
	MenuItemAdd 13, 255, 10
	MenuExec
	GoTo _026F
	End

_01C1:
	SetVar VAR_TEMP_x4007, 2
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 306, 255, 8
	MenuItemAdd 307, 255, 9
	MenuItemAdd 299, 255, 1
	MenuItemAdd 13, 255, 10
	MenuExec
	GoTo _026F
	End

_01FB:
	SetVar VAR_TEMP_x4007, 3
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 305, 255, 7
	MenuItemAdd 304, 255, 6
	MenuItemAdd 301, 255, 3
	MenuItemAdd 13, 255, 10
	MenuExec
	GoTo _026F
	End

_0235:
	SetVar VAR_TEMP_x4007, 4
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 303, 255, 5
	MenuItemAdd 302, 255, 4
	MenuItemAdd 298, 255, 0
	MenuItemAdd 13, 255, 10
	MenuExec
	GoTo _026F
	End

_026F:
	Switch VAR_SPECIAL_RESULT
	Case 0, _02FF
	Case 1, _030A
	Case 2, _0315
	Case 3, _0320
	Case 4, _032B
	Case 5, _0336
	Case 6, _0341
	Case 7, _034C
	Case 8, _0357
	Case 9, _0362
	GoTo _00BC
	End

_02FF:
	NPCMsg msg_0142_D49R0106_00008
	GoTo _036D
	End

_030A:
	NPCMsg msg_0142_D49R0106_00009
	GoTo _036D
	End

_0315:
	NPCMsg msg_0142_D49R0106_00010
	GoTo _036D
	End

_0320:
	NPCMsg msg_0142_D49R0106_00011
	GoTo _036D
	End

_032B:
	NPCMsg msg_0142_D49R0106_00012
	GoTo _036D
	End

_0336:
	NPCMsg msg_0142_D49R0106_00013
	GoTo _036D
	End

_0341:
	NPCMsg msg_0142_D49R0106_00014
	GoTo _036D
	End

_034C:
	NPCMsg msg_0142_D49R0106_00015
	GoTo _036D
	End

_0357:
	NPCMsg msg_0142_D49R0106_00016
	GoTo _036D
	End

_0362:
	NPCMsg msg_0142_D49R0106_00017
	GoTo _036D
	End

_036D:
	NPCMsg msg_0142_D49R0106_00007
	Compare VAR_TEMP_x4007, 0
	GoToIfEq _014D
	Compare VAR_TEMP_x4007, 1
	GoToIfEq _0187
	Compare VAR_TEMP_x4007, 2
	GoToIfEq _01C1
	Compare VAR_TEMP_x4007, 3
	GoToIfEq _01FB
	GoTo _0235
	End

_03AC:
	NPCMsg msg_0142_D49R0106_00018
	WaitButton
	CloseMsg
	TouchscreenMenuShow
	ReleaseAll
	End

scr_seq_D49R0106_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _03E0
	ApplyMovement obj_D49R0106_tsure_poke_static_dodrio, _043C
	GoTo _041E

_03E0:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _03FB
	ApplyMovement obj_D49R0106_tsure_poke_static_dodrio, _0434
	GoTo _041E

_03FB:
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfNe _0416
	ApplyMovement obj_D49R0106_tsure_poke_static_dodrio, _044C
	GoTo _041E

_0416:
	ApplyMovement obj_D49R0106_tsure_poke_static_dodrio, _0444
_041E:
	WaitMovement
	PlayCry SPECIES_DODRIO, 0
	NPCMsg msg_0142_D49R0106_00024
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0434:
	JumpOnSpotFastNorth 2
	EndMovement

	.balign 4, 0
_043C:
	JumpOnSpotFastSouth 2
	EndMovement

	.balign 4, 0
_0444:
	JumpOnSpotFastWest 2
	EndMovement

	.balign 4, 0
_044C:
	JumpOnSpotFastEast 2
	EndMovement

scr_seq_D49R0106_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	BufferPlayersName 0
	NPCMsg msg_0142_D49R0106_00023
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_712 2
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

scr_seq_D49R0106_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfUnset FLAG_HIDE_POKEATHLON_POKEGEAR_SIGN, _04A3
	NPCMsg msg_0142_D49R0106_00019
	WaitButton
	CloseMsg
	ReleaseAll
	End

_04A3:
	NPCMsg msg_0142_D49R0106_00020
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D49R0106_006:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfUnset FLAG_HIDE_POKEATHLON_BALL_SIGN, _04CC
	NPCMsg msg_0142_D49R0106_00021
	WaitButton
	CloseMsg
	ReleaseAll
	End

_04CC:
	NPCMsg msg_0142_D49R0106_00022
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
