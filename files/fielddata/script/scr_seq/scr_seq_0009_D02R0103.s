#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D02R0103.h"
#include "msgdata/msg/msg_0050_D02R0103.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D02R0103_000
	ScrDef scr_seq_D02R0103_001
	ScrDef scr_seq_D02R0103_002
	ScrDefEnd

scr_seq_D02R0103_002:
	MakeObjectVisible obj_D02R0103_stop
	ScrCmd_379 VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 3
	GoToIfNe _003D
	MovePersonFacing obj_D02R0103_stop, 18, 0, 10, DIR_SOUTH
	MoveWarp 2, 20, 3
	GoTo _005E

_003D:
	Compare VAR_TEMP_x4001, 4
	GoToIfNe _005E
	MovePersonFacing obj_D02R0103_stop, 18, 0, 10, DIR_SOUTH
	MoveWarp 2, 20, 3
_005E:
	End

scr_seq_D02R0103_000:
	TrainerTipsEx 2, msg_0050_D02R0103_00000
	End

scr_seq_D02R0103_001:
	SimpleNPCMsg msg_0050_D02R0103_00001
	End
	.balign 4, 0
