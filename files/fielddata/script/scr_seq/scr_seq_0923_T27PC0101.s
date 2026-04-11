#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T27PC0101.h"
#include "msgdata/msg/msg_0615_T27PC0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T27PC0101_000
	ScrDef scr_seq_T27PC0101_001
	ScrDef scr_seq_T27PC0101_002
	ScrDef scr_seq_T27PC0101_003
	ScrDef scr_seq_T27PC0101_004
	ScrDefEnd

scr_seq_T27PC0101_000:
	SetVar VAR_SPECIAL_x8007, 0
	CallStd std_nurse_joy
	End

scr_seq_T27PC0101_001:
	ScrCmd_609
	LockAll
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_T27PC0101_masaki, _0084
	ApplyMovement obj_player, _00A0
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	BufferPlayersName 0
	NPCMsg msg_0615_T27PC0101_00000
	NPCMsg msg_0615_T27PC0101_00001
	CloseMsg
	ApplyMovement obj_T27PC0101_masaki, _00AC
	ApplyMovement obj_player, _00C0
	WaitMovement
	HidePerson obj_T27PC0101_masaki
	SetFlag FLAG_UNK_1C5
	ClearFlag FLAG_HIDE_GOLDENROD_BILL
	SetFlag FLAG_SYS_MET_BILL
	SetVar VAR_UNK_410D, 1
	ReleaseAll
	End

	.balign 4, 0
_0084:
	WalkNormalSouth 4
	WalkNormalEast 6
	WalkNormalNorth 2
	Delay4 12
	FaceSouth
	Delay4 4
	EndMovement

	.balign 4, 0
_00A0:
	Delay4 20
	WalkNormalNorth 4
	EndMovement

	.balign 4, 0
_00AC:
	WalkNormalEast
	WalkNormalSouth 4
	WalkNormalWest
	WalkNormalSouth 2
	EndMovement

	.balign 4, 0
_00C0:
	Delay4 6
	FaceSouth
	EndMovement

scr_seq_T27PC0101_002:
	SimpleNPCMsg msg_0615_T27PC0101_00002
	End

scr_seq_T27PC0101_003:
	SimpleNPCMsg msg_0615_T27PC0101_00003
	End

scr_seq_T27PC0101_004:
	SimpleNPCMsg msg_0615_T27PC0101_00004
	End
	.balign 4, 0
