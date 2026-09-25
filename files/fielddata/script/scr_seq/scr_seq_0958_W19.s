#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_W19.h"
#include "msgdata/msg/msg_0740_W19.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_W19_000
	ScrDef scr_seq_W19_001
	ScrDef scr_seq_W19_002
	ScrDef scr_seq_W19_003
	ScrDef scr_seq_W19_004
	ScrDef scr_seq_W19_005
	ScrDefEnd

scr_seq_W19_000:
	SimpleNPCMsg msg_0740_W19_00000
	End

scr_seq_W19_001:
	SimpleNPCMsg msg_0740_W19_00002
	End

scr_seq_W19_002:
	SimpleNPCMsg msg_0740_W19_00001
	End

scr_seq_W19_003:
	SimpleNPCMsg msg_0740_W19_00003
	End

scr_seq_W19_004:
	DirectionSignpostEx 1, 4, msg_0740_W19_00004
	End

scr_seq_W19_005:
	TrainerTipsEx 3, msg_0740_W19_00005
	End
	.balign 4, 0
