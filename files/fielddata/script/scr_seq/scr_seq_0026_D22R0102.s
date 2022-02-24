#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D22R0102.h"
#include "msgdata/msg/msg_0063_D22R0102.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D22R0102_000
	scrdef scr_seq_D22R0102_001
	scrdef scr_seq_D22R0102_002
	scrdef scr_seq_D22R0102_003
	scrdef scr_seq_D22R0102_004
	scrdef scr_seq_D22R0102_005
	scrdef scr_seq_D22R0102_006
	scrdef scr_seq_D22R0102_007
	scrdef scr_seq_D22R0102_008
	scrdef scr_seq_D22R0102_009
	scrdef scr_seq_D22R0102_010
	scrdef scr_seq_D22R0102_011
	scrdef scr_seq_D22R0102_012
	scrdef_end

scr_seq_D22R0102_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0063_D22R0102_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D22R0102_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0063_D22R0102_00006
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D22R0102_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0063_D22R0102_00009
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D22R0102_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0063_D22R0102_00012
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D22R0102_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0063_D22R0102_00015
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D22R0102_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0063_D22R0102_00018
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D22R0102_009:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0063_D22R0102_00021
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D22R0102_010:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0063_D22R0102_00024
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D22R0102_011:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0063_D22R0102_00027
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D22R0102_012:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0063_D22R0102_00030
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D22R0102_000:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0063_D22R0102_00000, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_D22R0102_001:
	scrcmd_055 3, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0063_D22R0102_00001, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_D22R0102_002:
	scrcmd_055 3, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0063_D22R0102_00002, VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0
