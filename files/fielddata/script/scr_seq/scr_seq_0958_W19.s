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
	DirectionSignpost msg_0740_W19_00004, 1, 4, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_W19_005:
	ScrCmd_055 3, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0740_W19_00005, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
