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
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 20
	callstd 2052
	releaseall
	end

scr_seq_T07R0103_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0496_T07R0103_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07R0103_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0496_T07R0103_00001
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07R0103_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0496_T07R0103_00002
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07R0103_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0496_T07R0103_00003
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07R0103_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0496_T07R0103_00004
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
