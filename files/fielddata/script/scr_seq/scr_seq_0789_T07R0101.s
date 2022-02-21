#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07R0101.h"
#include "msgdata/msg/msg_0494_T07R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T07R0101_000
	scrdef scr_seq_T07R0101_001
	scrdef scr_seq_T07R0101_002
	scrdef scr_seq_T07R0101_003
	scrdef_end

scr_seq_T07R0101_000:
	simple_npc_msg msg_0494_T07R0101_00000
	end

scr_seq_T07R0101_001:
	simple_npc_msg msg_0494_T07R0101_00001
	end

scr_seq_T07R0101_002:
	simple_npc_msg msg_0494_T07R0101_00002
	end

scr_seq_T07R0101_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0494_T07R0101_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
