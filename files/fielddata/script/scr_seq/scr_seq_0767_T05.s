#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T05.h"
#include "msgdata/msg/msg_0475_T05.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T05_000
	ScrDef scr_seq_T05_001
	ScrDef scr_seq_T05_002
	ScrDef scr_seq_T05_003
	ScrDef scr_seq_T05_004
	ScrDef scr_seq_T05_005
	ScrDef scr_seq_T05_006
	ScrDef scr_seq_T05_007
	ScrDefEnd

scr_seq_T05_000:
	SimpleNPCMsg msg_0475_T05_00000
	End

scr_seq_T05_001:
	SimpleNPCMsg msg_0475_T05_00001
	End

scr_seq_T05_002:
	SimpleNPCMsg msg_0475_T05_00002
	End

scr_seq_T05_003:
	SimpleNPCMsg msg_0475_T05_00003
	End

scr_seq_T05_004:
	DirectionSignpostEx 0, 5, msg_0475_T05_00004
	End

scr_seq_T05_005:
	TrainerTipsEx 2, msg_0475_T05_00005
	End

scr_seq_T05_006:
	TrainerTipsEx 2, msg_0475_T05_00006
	End

scr_seq_T05_007:
	TrainerTipsEx 2, msg_0475_T05_00007
	End
	.balign 4, 0
