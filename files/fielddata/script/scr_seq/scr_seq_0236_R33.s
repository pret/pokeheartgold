#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R33.h"
#include "msgdata/msg/msg_0383_R33.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R33_000
	scrdef scr_seq_R33_001
	scrdef_end

scr_seq_R33_000:
	simple_npc_msg msg_0383_R33_00000
	end

scr_seq_R33_001:
	direction_signpost msg_0383_R33_00001, 1, 2, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0
