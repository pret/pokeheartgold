#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D45R0101.h"
#include "msgdata/msg/msg_0003_EVERYWHERE.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D45R0101_000
	ScrDefEnd

scr_seq_D45R0101_000:
	MakeObjectVisible obj_D45R0101_stop
	End
	.balign 4, 0
