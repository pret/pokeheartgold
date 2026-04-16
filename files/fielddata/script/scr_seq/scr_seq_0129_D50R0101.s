#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D50R0101.h"
#include "msgdata/msg/msg_0144_D50R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D50R0101_000
	ScrDef scr_seq_D50R0101_001
	ScrDefEnd

scr_seq_D50R0101_001:
	NatDexFlagAction 2, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1
	GoToIfEq _0064
	MovePersonFacing obj_D50R0101_breakrock, 30, 1, 30, DIR_NORTH
	MovePersonFacing obj_D50R0101_breakrock_2, 30, 1, 30, DIR_NORTH
	MovePersonFacing obj_D50R0101_breakrock_3, 30, 1, 30, DIR_NORTH
	MovePersonFacing obj_D50R0101_breakrock_4, 30, 1, 30, DIR_NORTH
	MovePersonFacing obj_D50R0101_breakrock_5, 30, 1, 30, DIR_NORTH
	MovePersonFacing obj_D50R0101_breakrock_6, 30, 1, 30, DIR_NORTH
_0064:
	End

scr_seq_D50R0101_000:
	SimpleNPCMsg msg_0144_D50R0101_00000
	End
	.balign 4, 0
