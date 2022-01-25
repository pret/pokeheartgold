#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R43.h"
#include "msgdata/msg/msg_0401_R43.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R43_000
	scrdef scr_seq_R43_001
	scrdef scr_seq_R43_002
	scrdef scr_seq_R43_003
	scrdef_end

scr_seq_R43_000:
	end

scr_seq_R43_001:
	direction_signpost msg_0401_R43_00018, 1, 3, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_R43_002:
	scrcmd_055 3, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0401_R43_00019, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_R43_003:
	direction_signpost msg_0401_R43_00020, 1, 6, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0
