#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R09.h"
#include "msgdata/msg/msg_0340_R09.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R09_000
	scrdef_end

scr_seq_R09_000:
	direction_signpost msg_0340_R09_00000, 1, 1, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0
