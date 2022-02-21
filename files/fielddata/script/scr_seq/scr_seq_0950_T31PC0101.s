#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T31PC0101.h"
#include "msgdata/msg/msg_0637_T31PC0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T31PC0101_000
	scrdef scr_seq_T31PC0101_001
	scrdef_end

scr_seq_T31PC0101_000:
	setvar VAR_SPECIAL_x8007, 0
	callstd std_nurse_joy
	end

scr_seq_T31PC0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0637_T31PC0101_00000
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
