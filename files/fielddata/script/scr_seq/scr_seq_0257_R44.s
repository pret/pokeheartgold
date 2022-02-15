#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R44.h"
#include "msgdata/msg/msg_0404_R44.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R44_000
	scrdef scr_seq_R44_001
	scrdef scr_seq_R44_002
	scrdef_end

scr_seq_R44_000:
	end

scr_seq_R44_001:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0404_R44_00000, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_R44_002:
	direction_signpost msg_0404_R44_00001, 1, 1, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0
