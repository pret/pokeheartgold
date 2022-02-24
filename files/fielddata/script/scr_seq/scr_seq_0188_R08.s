#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R08.h"
#include "msgdata/msg/msg_0338_R08.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R08_000
	scrdef scr_seq_R08_001
	scrdef_end

scr_seq_R08_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0338_R08_00000
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_R08_001:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0338_R08_00001, VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0
