#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0163.h"
#include "msgdata/msg/msg_0266.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_0163_000
	ScrDefEnd

scr_seq_0163_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FollowMonFacePlayer
	FollowMonInteract
	GoTo _00F0

_0016:
	GetPartyLeadAlive VAR_TEMP_x4000
	GetPartyMonSpecies VAR_TEMP_x4000, VAR_TEMP_x4001
	Random VAR_SPECIAL_RESULT, 3
	CopyVar VAR_SPECIAL_x8008, VAR_SPECIAL_RESULT
	CompareVarToValue VAR_SPECIAL_x8008, 0
	GoToIfEq _0060
	CompareVarToValue VAR_SPECIAL_x8008, 1
	GoToIfEq _0060
	GoTo _0060

_004C:
	PlayCry VAR_TEMP_x4001, 0
	GoTo _00F0

_0058:
	ScrCmd_597
	GoTo _00F0

_0060:
	PlayCry VAR_TEMP_x4001, 0
	ScrCmd_622 obj_partner_poke, VAR_SPECIAL_RESULT
	CompareVarToValue VAR_SPECIAL_RESULT, DIR_NORTH
	CallIfEq _00F4
	CompareVarToValue VAR_SPECIAL_RESULT, DIR_SOUTH
	CallIfEq _00FE
	CompareVarToValue VAR_SPECIAL_RESULT, DIR_WEST
	CallIfEq _0108
	CompareVarToValue VAR_SPECIAL_RESULT, DIR_EAST
	CallIfEq _0112
	WaitMovement
	ScrCmd_597
	GoTo _00F0

_00AA:
	PlayCry VAR_TEMP_x4001, 0
	GetPlayerFacing VAR_SPECIAL_RESULT
	CompareVarToValue VAR_SPECIAL_RESULT, DIR_NORTH
	CallIfEq _011C
	CompareVarToValue VAR_SPECIAL_RESULT, DIR_SOUTH
	CallIfEq _0126
	CompareVarToValue VAR_SPECIAL_RESULT, DIR_WEST
	CallIfEq _0130
	CompareVarToValue VAR_SPECIAL_RESULT, DIR_EAST
	CallIfEq _013A
	WaitMovement
	GoTo _00F0

_00F0:
	ReleaseAll
	End

_00F4:
	ApplyMovement obj_partner_poke, _016C
	Return

_00FE:
	ApplyMovement obj_partner_poke, _0158
	Return

_0108:
	ApplyMovement obj_partner_poke, _0194
	Return

_0112:
	ApplyMovement obj_partner_poke, _0180
	Return

_011C:
	ApplyMovement obj_partner_poke, _01A8
	Return

_0126:
	ApplyMovement obj_partner_poke, _01C8
	Return

_0130:
	ApplyMovement obj_partner_poke, _01E8
	Return

_013A:
	ApplyMovement obj_partner_poke, _0208
	Return

	.balign 4, 0
_0144:
	PauseAnimation
	EmoteExclamationMark
	Delay2
	ResumeAnimation
	EndMovement

	.balign 4, 0
_0158:
	PauseAnimation
	JumpOnSpotFastSouth
	Delay4
	ResumeAnimation
	EndMovement

	.balign 4, 0
_016C:
	PauseAnimation
	JumpOnSpotFastNorth
	Delay4
	ResumeAnimation
	EndMovement

	.balign 4, 0
_0180:
	PauseAnimation
	JumpOnSpotFastEast
	Delay4
	ResumeAnimation
	EndMovement

	.balign 4, 0
_0194:
	PauseAnimation
	JumpOnSpotFastWest
	Delay4
	ResumeAnimation
	EndMovement

	.balign 4, 0
_01A8:
	PauseAnimation
	WalkOnSpotFasterSouth
	WalkOnSpotFasterWest
	WalkOnSpotFasterNorth
	WalkOnSpotFasterEast
	WalkOnSpotFasterSouth
	ResumeAnimation
	EndMovement

	.balign 4, 0
_01C8:
	PauseAnimation
	WalkOnSpotFasterNorth
	WalkOnSpotFasterEast
	WalkOnSpotFasterSouth
	WalkOnSpotFasterWest
	WalkOnSpotFasterNorth
	ResumeAnimation
	EndMovement

	.balign 4, 0
_01E8:
	PauseAnimation
	WalkOnSpotFasterEast
	WalkOnSpotFasterSouth
	WalkOnSpotFasterWest
	WalkOnSpotFasterNorth
	WalkOnSpotFasterEast
	ResumeAnimation
	EndMovement

	.balign 4, 0
_0208:
	PauseAnimation
	WalkOnSpotFasterWest
	WalkOnSpotFasterNorth
	WalkOnSpotFasterEast
	WalkOnSpotFasterSouth
	WalkOnSpotFasterWest
	ResumeAnimation
	EndMovement
	.balign 4, 0
