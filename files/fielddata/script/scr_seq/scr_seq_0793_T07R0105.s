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
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 22
	callstd 2052
	releaseall
	end

scr_seq_T07R0105_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 23
	callstd 2052
	releaseall
	end

scr_seq_T07R0105_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0498_T07R0105_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07R0105_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0498_T07R0105_00001
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07R0105_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0498_T07R0105_00002
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07R0105_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0498_T07R0105_00003
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
