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
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0457_T02R0301_00000
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T02R0301_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0457_T02R0301_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T02R0301_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0457_T02R0301_00002
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T02R0301_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0457_T02R0301_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T02R0301_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0457_T02R0301_00004
	wait_button_or_walk_away
	closemsg
	releaseall
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
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0457_T02R0301_00007
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
