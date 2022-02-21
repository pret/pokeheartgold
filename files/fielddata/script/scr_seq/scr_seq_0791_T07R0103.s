#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07R0103.h"
#include "msgdata/msg/msg_0496_T07R0103.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T07R0103_000
	scrdef scr_seq_T07R0103_001
	scrdef scr_seq_T07R0103_002
	scrdef scr_seq_T07R0103_003
	scrdef scr_seq_T07R0103_004
	scrdef scr_seq_T07R0103_005
	scrdef_end

scr_seq_T07R0103_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd std_mart_intro
	holdmsg
	setvar VAR_SPECIAL_x8004, 20
	callstd std_special_mart
	releaseall
	end

scr_seq_T07R0103_001:
	simple_npc_msg msg_0496_T07R0103_00000
	end

scr_seq_T07R0103_002:
	simple_npc_msg msg_0496_T07R0103_00001
	end

scr_seq_T07R0103_003:
	simple_npc_msg msg_0496_T07R0103_00002
	end

scr_seq_T07R0103_004:
	simple_npc_msg msg_0496_T07R0103_00003
	end

scr_seq_T07R0103_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0496_T07R0103_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
