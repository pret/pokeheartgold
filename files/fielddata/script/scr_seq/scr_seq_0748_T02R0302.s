#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T02R0302.h"
#include "msgdata/msg/msg_0458_T02R0302.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T02R0302_000
	ScrDef scr_seq_T02R0302_001
	ScrDef scr_seq_T02R0302_002
	ScrDef scr_seq_T02R0302_003
	ScrDefEnd

scr_seq_T02R0302_002:
	ScrCmd_609
	LockAll
	SetVar VAR_UNK_412E, 2
	NPCMsg msg_0458_T02R0302_00007
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0070
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	NPCMsg msg_0458_T02R0302_00008
	GoToIfSet FLAG_UNK_176, _0063
	NPCMsg msg_0458_T02R0302_00009
	SetFlag FLAG_UNK_25B
	Dummy486
	SetVar VAR_UNK_40E5, 2
	NPCMsg msg_0458_T02R0302_00011
	SetFlag FLAG_UNK_176
_0063:
	NPCMsg msg_0458_T02R0302_00012
	GoTo _0091

_006C:
	ReleaseAll
	End

	.balign 4, 0
_0070:
	WalkNormalWest 2
	WalkNormalSouth
	WalkNormalWest 2
	EndMovement

scr_seq_T02R0302_000:
scr_seq_T02R0302_003:
	ScrCmd_609
	LockAll
	ApplyMovement obj_player, _0120
	WaitMovement
	NPCMsg msg_0458_T02R0302_00000
_0091:
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _00ED
	SetFollowMonInhibitState 1
	SetVar VAR_UNK_412E, 5
	CallStd std_prompt_save
	CopyVar VAR_SPECIAL_RESULT, VAR_TEMP_x4000
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _00ED
	TouchscreenMenuShow
	ScrCmd_600
	HealParty
	NPCMsg msg_0458_T02R0302_00002
	CloseMsg
	ApplyMovement obj_player, _017C
	WaitMovement
	ScrCmd_607
	ScrCmd_109 253, 56
	SetVar VAR_UNK_412E, 4
	ReleaseAll
	End

_00ED:
	SetFollowMonInhibitState 0
	NPCMsg msg_0458_T02R0302_00003
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0184
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	SetVar VAR_UNK_412E, 3
	ReleaseAll
	End

	.balign 4, 0
_0120:
	WalkOnSpotNormalWest
	EndMovement

scr_seq_T02R0302_001:
	ScrCmd_609
	LockAll
	NPCMsg msg_0458_T02R0302_00004
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0168
	NPCMsg msg_0458_T02R0302_00005
	CloseMsg
	ApplyMovement obj_player, _0184
	WaitMovement
	SetFollowMonInhibitState 0
	ScrCmd_606
	ScrCmd_109 253, 48
	SetVar VAR_UNK_412E, 3
	ReleaseAll
	End

_0168:
	NPCMsg msg_0458_T02R0302_00006
	CloseMsg
	ApplyMovement obj_player, _017C
	WaitMovement
	ReleaseAll
	End

	.balign 4, 0
_017C:
	WalkNormalSouth 3
	EndMovement

	.balign 4, 0
_0184:
	WalkNormalEast
	EndMovement
	.balign 4, 0
