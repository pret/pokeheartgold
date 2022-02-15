#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T10.h"
#include "msgdata/msg/msg_0521_T10.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T10_000
	scrdef_end

scr_seq_T10_000:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0521_T10_00000, VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0
