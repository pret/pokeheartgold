#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R08R0201.h"
#include "msgdata/msg/msg_0339_R08R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R08R0201_000
	ScrDefEnd

scr_seq_R08R0201_000:
	SimpleNPCMsg msg_0339_R08R0201_00000
	End
	.balign 4, 0
