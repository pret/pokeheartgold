#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R28.h"
#include "msgdata/msg/msg_0371_R28.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R28_000
	scrdef scr_seq_R28_001
	scrdef_end

scr_seq_R28_000:
	setvar VAR_UNK_4126, 0
	end

scr_seq_R28_001:
	direction_signpost msg_0371_R28_00000, 1, 2, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0
