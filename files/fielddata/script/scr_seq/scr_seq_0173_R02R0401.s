#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R02R0401.h"
#include "msgdata/msg/msg_0324_R02R0401.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R02R0401_000
	ScrDefEnd

scr_seq_R02R0401_000:
	SimpleNPCMsg msg_0324_R02R0401_00000
	End
	.balign 4, 0
