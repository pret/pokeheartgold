#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T06R0601.h"
#include "msgdata/msg/msg_0490_T06R0601.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T06R0601_000
	scrdef_end

scr_seq_T06R0601_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0490_T06R0601_00000
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
