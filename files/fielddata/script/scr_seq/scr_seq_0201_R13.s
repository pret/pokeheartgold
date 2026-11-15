#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R13.h"
#include "msgdata/msg/msg_0350_R13.h"
#include "macros/script.inc"


	ScrDef scr_seq_R13_000
	ScrDef scr_seq_R13_001
	ScrDef scr_seq_R13_002
	ScrDefEnd

scr_seq_R13_000:
	TrainerTipsEx SIGNPOST_TYPE_SCROLLING, msg_0350_R13_00000
	End

scr_seq_R13_001:
	DirectionSignpostEx SIGNPOST_TYPE_ARROW, 10, msg_0350_R13_00001
	End

scr_seq_R13_002:
	DirectionSignpostEx SIGNPOST_TYPE_ARROW, 14, msg_0350_R13_00002
	End
	.balign 4, 0
