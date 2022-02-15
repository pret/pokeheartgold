#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_W20.h"
#include "msgdata/msg/msg_0742_W20.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_W20_000
	scrdef scr_seq_W20_001
	scrdef_end

scr_seq_W20_000:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0742_W20_00000, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_W20_001:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0742_W20_00001, VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0
