#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D45R0101.h"
#include "msgdata/msg/msg_0003_EVERYWHERE.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D45R0101_000
	scrdef_end

scr_seq_D45R0101_000:
	make_object_visible obj_D45R0101_stop
	end
	.balign 4, 0
