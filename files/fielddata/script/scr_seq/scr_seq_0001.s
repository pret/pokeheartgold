#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0001.h"
#include "msgdata/msg/msg_0020.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0001_000
	scrdef scr_seq_0001_001
	scrdef scr_seq_0001_002
	scrdef scr_seq_0001_003
	scrdef scr_seq_0001_004
	scrdef scr_seq_0001_005
	scrdef scr_seq_0001_006
	scrdef scr_seq_0001_007
	scrdef scr_seq_0001_008
	scrdef_end

scr_seq_0001_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0020_00000
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_0001_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0020_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_0001_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0020_00002
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_0001_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0020_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_0001_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0020_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_0001_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0020_00005
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_0001_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0020_00006
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_0001_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0020_00007
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_0001_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	town_map
	restore_overworld
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end
	.balign 4, 0
