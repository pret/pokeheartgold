#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T01R0202.h"
#include "msgdata/msg/msg_0450_T01R0202.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T01R0202_000
	scrdef scr_seq_T01R0202_001
	scrdef_end

scr_seq_T01R0202_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0450_T01R0202_00000
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T01R0202_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0450_T01R0202_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
