#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R42R0101.h"
#include "msgdata/msg/msg_0400_R42R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R42R0101_000
	scrdef scr_seq_R42R0101_001
	scrdef_end

scr_seq_R42R0101_000:
	end

scr_seq_R42R0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0400_R42R0101_00000
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
