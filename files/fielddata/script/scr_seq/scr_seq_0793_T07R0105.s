#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07R0105.h"
#include "msgdata/msg/msg_0498_T07R0105.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T07R0105_000
	scrdef scr_seq_T07R0105_001
	scrdef scr_seq_T07R0105_002
	scrdef scr_seq_T07R0105_003
	scrdef scr_seq_T07R0105_004
	scrdef scr_seq_T07R0105_005
	scrdef_end

scr_seq_T07R0105_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd std_mart_intro
	holdmsg
	setvar VAR_SPECIAL_x8004, 22
	callstd std_special_mart
	releaseall
	end

scr_seq_T07R0105_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd std_mart_intro
	holdmsg
	setvar VAR_SPECIAL_x8004, 23
	callstd std_special_mart
	releaseall
	end

scr_seq_T07R0105_002:
	simple_npc_msg msg_0498_T07R0105_00000
	end

scr_seq_T07R0105_003:
	simple_npc_msg msg_0498_T07R0105_00001
	end

scr_seq_T07R0105_004:
	simple_npc_msg msg_0498_T07R0105_00002
	end

scr_seq_T07R0105_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0498_T07R0105_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
