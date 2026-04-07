#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D37R0103.h"
#include "msgdata/msg/msg_0118_D37R0103.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D37R0103_000
	ScrDef scr_seq_D37R0103_001
	ScrDef scr_seq_D37R0103_002
	ScrDef scr_seq_D37R0103_003
	ScrDefEnd

scr_seq_D37R0103_003:
	MakeObjectVisible obj_D37R0103_stop
	MakeObjectVisible obj_D37R0103_stop_2
	MakeObjectVisible obj_D37R0103_stop_3
	MakeObjectVisible obj_D37R0103_stop_4
	MakeObjectVisible obj_D37R0103_stop_5
	MakeObjectVisible obj_D37R0103_stop_6
	MakeObjectVisible obj_D37R0103_stop_7
	MakeObjectVisible obj_D37R0103_stop_8
	MakeObjectVisible obj_D37R0103_stop_9
	GoToIfSet FLAG_UNK_096, _0059
	GoToIfSet FLAG_UNK_097, _01BE
	GoToIfSet FLAG_UNK_098, _0207
	End

_0059:
	GoToIfSet FLAG_UNK_097, _00B3
	GoToIfSet FLAG_UNK_098, _013E
	ScrCmd_109 0, 9
	MovePersonFacing obj_D37R0103_tsure_poke_static_machoke, 19, 0, 16, DIR_SOUTH
	MovePersonFacing obj_D37R0103_babyboy1_5_3, 19, 0, 18, DIR_NORTH
	MovePersonFacing obj_D37R0103_stop, 19, 0, 17, DIR_NORTH
	MovePersonFacing obj_D37R0103_stop_2, 20, 0, 17, DIR_NORTH
	MovePersonFacing obj_D37R0103_stop_3, 20, 0, 18, DIR_NORTH
	End

_00B3:
	GoToIfSet FLAG_UNK_098, _02BF
	ScrCmd_109 0, 9
	MovePersonFacing obj_D37R0103_tsure_poke_static_machoke, 19, 0, 16, DIR_SOUTH
	MovePersonFacing obj_D37R0103_babyboy1_5_3, 19, 0, 18, DIR_NORTH
	MovePersonFacing obj_D37R0103_stop, 19, 0, 17, DIR_NORTH
	MovePersonFacing obj_D37R0103_stop_2, 20, 0, 17, DIR_NORTH
	MovePersonFacing obj_D37R0103_stop_3, 20, 0, 18, DIR_NORTH
	MovePersonFacing obj_D37R0103_tsure_poke_static_machoke_2, 3, 0, 14, DIR_WEST
	MovePersonFacing obj_D37R0103_babyboy1_5_2, 1, 0, 14, DIR_NORTH
	MovePersonFacing obj_D37R0103_stop_4, 1, 0, 13, DIR_NORTH
	MovePersonFacing obj_D37R0103_stop_5, 2, 0, 13, DIR_NORTH
	MovePersonFacing obj_D37R0103_stop_6, 2, 0, 14, DIR_NORTH
	End

_013E:
	ScrCmd_109 0, 9
	MovePersonFacing obj_D37R0103_tsure_poke_static_machoke, 19, 0, 16, DIR_SOUTH
	MovePersonFacing obj_D37R0103_babyboy1_5_3, 19, 0, 18, DIR_NORTH
	MovePersonFacing obj_D37R0103_stop, 19, 0, 17, DIR_NORTH
	MovePersonFacing obj_D37R0103_stop_2, 20, 0, 17, DIR_NORTH
	MovePersonFacing obj_D37R0103_stop_3, 20, 0, 18, DIR_NORTH
	MovePersonFacing obj_D37R0103_tsure_poke_static_machoke_3, 7, 0, 17, DIR_EAST
	MovePersonFacing obj_D37R0103_babyboy1_5, 8, 0, 18, DIR_NORTH
	MovePersonFacing obj_D37R0103_stop_7, 8, 0, 17, DIR_NORTH
	MovePersonFacing obj_D37R0103_stop_8, 9, 0, 17, DIR_NORTH
	MovePersonFacing obj_D37R0103_stop_9, 9, 0, 18, DIR_NORTH
	End

_01BE:
	GoToIfSet FLAG_UNK_098, _0245
	MovePersonFacing obj_D37R0103_tsure_poke_static_machoke_2, 3, 0, 14, DIR_WEST
	MovePersonFacing obj_D37R0103_babyboy1_5_2, 1, 0, 14, DIR_NORTH
	MovePersonFacing obj_D37R0103_stop_4, 1, 0, 13, DIR_NORTH
	MovePersonFacing obj_D37R0103_stop_5, 2, 0, 13, DIR_NORTH
	MovePersonFacing obj_D37R0103_stop_6, 2, 0, 14, DIR_NORTH
	End

_0207:
	MovePersonFacing obj_D37R0103_tsure_poke_static_machoke_3, 7, 0, 17, DIR_EAST
	MovePersonFacing obj_D37R0103_babyboy1_5, 8, 0, 18, DIR_NORTH
	MovePersonFacing obj_D37R0103_stop_7, 8, 0, 17, DIR_NORTH
	MovePersonFacing obj_D37R0103_stop_8, 9, 0, 17, DIR_NORTH
	MovePersonFacing obj_D37R0103_stop_9, 9, 0, 18, DIR_NORTH
	End

_0245:
	MovePersonFacing obj_D37R0103_tsure_poke_static_machoke_2, 3, 0, 14, DIR_WEST
	MovePersonFacing obj_D37R0103_babyboy1_5_2, 1, 0, 14, DIR_NORTH
	MovePersonFacing obj_D37R0103_stop_4, 1, 0, 13, DIR_NORTH
	MovePersonFacing obj_D37R0103_stop_5, 2, 0, 13, DIR_NORTH
	MovePersonFacing obj_D37R0103_stop_6, 2, 0, 14, DIR_NORTH
	MovePersonFacing obj_D37R0103_tsure_poke_static_machoke_3, 7, 0, 17, DIR_EAST
	MovePersonFacing obj_D37R0103_babyboy1_5, 8, 0, 18, DIR_NORTH
	MovePersonFacing obj_D37R0103_stop_7, 8, 0, 17, DIR_NORTH
	MovePersonFacing obj_D37R0103_stop_8, 9, 0, 17, DIR_NORTH
	MovePersonFacing obj_D37R0103_stop_9, 9, 0, 18, DIR_NORTH
	End

_02BF:
	ScrCmd_109 0, 9
	MovePersonFacing obj_D37R0103_tsure_poke_static_machoke, 19, 0, 16, DIR_SOUTH
	MovePersonFacing obj_D37R0103_babyboy1_5_3, 19, 0, 18, DIR_NORTH
	MovePersonFacing obj_D37R0103_stop, 19, 0, 17, DIR_NORTH
	MovePersonFacing obj_D37R0103_stop_2, 20, 0, 17, DIR_NORTH
	MovePersonFacing obj_D37R0103_stop_3, 20, 0, 18, DIR_NORTH
	MovePersonFacing obj_D37R0103_tsure_poke_static_machoke_2, 3, 0, 14, DIR_WEST
	MovePersonFacing obj_D37R0103_babyboy1_5_2, 1, 0, 14, DIR_NORTH
	MovePersonFacing obj_D37R0103_stop_4, 1, 0, 13, DIR_NORTH
	MovePersonFacing obj_D37R0103_stop_5, 2, 0, 13, DIR_NORTH
	MovePersonFacing obj_D37R0103_stop_6, 2, 0, 14, DIR_NORTH
	MovePersonFacing obj_D37R0103_tsure_poke_static_machoke_3, 7, 0, 17, DIR_EAST
	MovePersonFacing obj_D37R0103_babyboy1_5, 8, 0, 18, DIR_NORTH
	MovePersonFacing obj_D37R0103_stop_7, 8, 0, 17, DIR_NORTH
	MovePersonFacing obj_D37R0103_stop_8, 9, 0, 17, DIR_NORTH
	MovePersonFacing obj_D37R0103_stop_9, 9, 0, 18, DIR_NORTH
	End

scr_seq_D37R0103_000:
	GoToIfSet FLAG_UNK_096, _03C9
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0118_D37R0103_00000
	CloseMsg
	ApplyMovement obj_D37R0103_tsure_poke_static_machoke, _0504
	ApplyMovement obj_D37R0103_babyboy1_5_3, _0504
	ApplyMovement obj_D37R0103_stop, _0504
	ApplyMovement obj_D37R0103_stop_2, _0504
	ApplyMovement obj_D37R0103_stop_3, _0504
	WaitMovement
	SetFlag FLAG_UNK_096
	ScrCmd_109 0, 9
	ReleaseAll
	End

_03C9:
	SimpleNPCMsg msg_0118_D37R0103_00001
	End

scr_seq_D37R0103_001:
	GetPersonCoords 4, VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 15
	GoToIfNe _03FD
	GoTo _041C

_03F7:
	GoTo _041C

_03FD:
	Compare VAR_TEMP_x4001, 16
	GoToIfNe _0416
	GoTo _0483

_0410:
	GoTo _041C

_0416:
	GoTo _03C9

_041C:
	GoToIfSet FLAG_UNK_097, _03C9
	ScrCmd_622 4, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfNe _0440
	GoTo _0446

_0440:
	GoTo _03C9

_0446:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0118_D37R0103_00000
	CloseMsg
	ApplyMovement obj_D37R0103_tsure_poke_static_machoke_2, _050C
	ApplyMovement obj_D37R0103_babyboy1_5_2, _050C
	ApplyMovement obj_D37R0103_stop_4, _050C
	ApplyMovement obj_D37R0103_stop_5, _050C
	ApplyMovement obj_D37R0103_stop_6, _050C
	WaitMovement
	SetFlag FLAG_UNK_097
	ReleaseAll
	End

_0483:
	GoToIfSet FLAG_UNK_098, _03C9
	ScrCmd_622 4, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1
	GoToIfNe _04A7
	GoTo _04AD

_04A7:
	GoTo _03C9

_04AD:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0118_D37R0103_00000
	CloseMsg
	ApplyMovement obj_D37R0103_tsure_poke_static_machoke_3, _0514
	ApplyMovement obj_D37R0103_babyboy1_5, _0514
	ApplyMovement obj_D37R0103_stop_7, _0514
	ApplyMovement obj_D37R0103_stop_8, _0514
	ApplyMovement obj_D37R0103_stop_9, _0514
	WaitMovement
	SetFlag FLAG_UNK_098
	ReleaseAll
	End

scr_seq_D37R0103_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	PlayCry SPECIES_MACHOKE, 0
	NPCMsg msg_0118_D37R0103_00002
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0504:
	WalkSlowSouth 2
	EndMovement

	.balign 4, 0
_050C:
	WalkSlowWest 2
	EndMovement

	.balign 4, 0
_0514:
	WalkSlowEast 2
	EndMovement
	.balign 4, 0
