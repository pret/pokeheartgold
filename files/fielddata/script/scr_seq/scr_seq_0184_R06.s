#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R06.h"
#include "msgdata/msg/msg_0334_R06.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R06_000
	scrdef scr_seq_R06_001
	scrdef_end

scr_seq_R06_000:
	simple_npc_msg msg_0334_R06_00000
	end

scr_seq_R06_001:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0334_R06_00001, VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0
