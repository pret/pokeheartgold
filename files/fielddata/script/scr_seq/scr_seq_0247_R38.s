#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R38.h"
#include "msgdata/msg/msg_0394_R38.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R38_000
	scrdef scr_seq_R38_001
	scrdef scr_seq_R38_002
	scrdef_end

scr_seq_R38_000:
	end

scr_seq_R38_001:
	direction_signpost msg_0394_R38_00015, 1, 8, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_R38_002:
	scrcmd_055 3, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0394_R38_00016, VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0
