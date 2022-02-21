#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_W41.h"
#include "msgdata/msg/msg_0746_W41.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_W41_000
	scrdef scr_seq_W41_001
	scrdef scr_seq_W41_002
	scrdef scr_seq_W41_003
	scrdef scr_seq_W41_004
	scrdef scr_seq_W41_005
	scrdef scr_seq_W41_006
	scrdef scr_seq_W41_007
	scrdef scr_seq_W41_008
	scrdef scr_seq_W41_009
	scrdef scr_seq_W41_010
	scrdef_end

scr_seq_W41_000:
	end

scr_seq_W41_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0746_W41_00000
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_W41_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0746_W41_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_W41_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0746_W41_00006
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_W41_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0746_W41_00012
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_W41_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0746_W41_00009
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_W41_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0746_W41_00015
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_W41_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0746_W41_00018
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_W41_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0746_W41_00021
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_W41_009:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0746_W41_00024
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_W41_010:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0746_W41_00027
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
