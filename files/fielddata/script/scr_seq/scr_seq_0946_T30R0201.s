#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T30R0201.h"
#include "msgdata/msg/msg_0633_T30R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T30R0201_000
	ScrDef scr_seq_T30R0201_001
	ScrDefEnd

scr_seq_T30R0201_000:
	SimpleNPCMsg msg_0633_T30R0201_00000
	End

scr_seq_T30R0201_001:
	PlayCry SPECIES_DRATINI, 0
	SimpleNPCMsg msg_0633_T30R0201_00002
	WaitCry
	End
	.balign 4, 0
