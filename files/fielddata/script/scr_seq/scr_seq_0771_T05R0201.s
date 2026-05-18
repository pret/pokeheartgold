#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T05R0201.h"
#include "msgdata/msg/msg_0478_T05R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T05R0201_000
	ScrDef scr_seq_T05R0201_001
	ScrDef scr_seq_T05R0201_002
	ScrDef scr_seq_T05R0201_003
	ScrDef scr_seq_T05R0201_004
	ScrDefEnd

scr_seq_T05R0201_000:
	SimpleNPCMsg msg_0478_T05R0201_00000
	End

scr_seq_T05R0201_001:
	SimpleNPCMsg msg_0478_T05R0201_00001
	End

scr_seq_T05R0201_002:
	PlayCry SPECIES_PSYDUCK, 0
	SimpleNPCMsg msg_0478_T05R0201_00002
	WaitCry
	End

scr_seq_T05R0201_003:
	PlayCry SPECIES_NIDORINO, 0
	SimpleNPCMsg msg_0478_T05R0201_00003
	WaitCry
	End

scr_seq_T05R0201_004:
	PlayCry SPECIES_PIDGEY, 0
	SimpleNPCMsg msg_0478_T05R0201_00004
	WaitCry
	End
	.balign 4, 0
