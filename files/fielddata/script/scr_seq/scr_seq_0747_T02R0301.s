#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T02R0301.h"
#include "msgdata/msg/msg_0457_T02R0301.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T02R0301_000
	scrdef scr_seq_T02R0301_001
	scrdef scr_seq_T02R0301_002
	scrdef scr_seq_T02R0301_003
	scrdef scr_seq_T02R0301_004
	scrdef scr_seq_T02R0301_005
	scrdef scr_seq_T02R0301_006
	scrdef scr_seq_T02R0301_007
	scrdef_end

scr_seq_T02R0301_000:
	simple_npc_msg msg_0457_T02R0301_00000
	end

scr_seq_T02R0301_001:
	simple_npc_msg msg_0457_T02R0301_00001
	end

scr_seq_T02R0301_002:
	simple_npc_msg msg_0457_T02R0301_00002
	end

scr_seq_T02R0301_003:
	simple_npc_msg msg_0457_T02R0301_00003
	end

scr_seq_T02R0301_004:
	simple_npc_msg msg_0457_T02R0301_00004
	end

scr_seq_T02R0301_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0457_T02R0301_00005
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T02R0301_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0457_T02R0301_00006
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T02R0301_007:
	simple_npc_msg msg_0457_T02R0301_00007
	end
	.balign 4, 0
