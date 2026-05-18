#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T21R0401.h"
#include "msgdata/msg/msg_0554_T21R0401.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T21R0401_000
	ScrDef scr_seq_T21R0401_001
	ScrDefEnd

scr_seq_T21R0401_000:
	End

scr_seq_T21R0401_001:
	SimpleNPCMsg msg_0554_T21R0401_00000
	End
	.balign 4, 0
