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
	DirectionSignpost msg_0475_T05_00004, 0, 5, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T05_005:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0475_T05_00005, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T05_006:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0475_T05_00006, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T05_007:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0475_T05_00007, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
