#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R0801.h"
#include "msgdata/msg/msg_0590_T25R0801.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T25R0801_000
	scrdef scr_seq_T25R0801_001
	scrdef_end

scr_seq_T25R0801_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0590_T25R0801_00000
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T25R0801_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0590_T25R0801_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
