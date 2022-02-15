#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R02.h"
#include "msgdata/msg/msg_0320_R02.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R02_000
	scrdef_end

scr_seq_R02_000:
	direction_signpost msg_0320_R02_00000, 1, 3, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0
