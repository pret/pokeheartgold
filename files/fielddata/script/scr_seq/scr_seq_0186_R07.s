#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R07.h"
#include "msgdata/msg/msg_0336_R07.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R07_000
	scrdef scr_seq_R07_001
	scrdef_end

scr_seq_R07_000:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0336_R07_00000, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_R07_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0336_R07_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
