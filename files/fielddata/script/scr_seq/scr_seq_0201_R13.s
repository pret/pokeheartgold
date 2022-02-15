#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R13.h"
#include "msgdata/msg/msg_0350_R13.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R13_000
	scrdef scr_seq_R13_001
	scrdef scr_seq_R13_002
	scrdef_end

scr_seq_R13_000:
	scrcmd_055 3, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0350_R13_00000, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_R13_001:
	direction_signpost msg_0350_R13_00001, 1, 10, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_R13_002:
	direction_signpost msg_0350_R13_00002, 1, 14, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0
