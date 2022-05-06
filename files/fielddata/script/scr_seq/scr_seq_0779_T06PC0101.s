#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T06PC0101.h"
#include "msgdata/msg/msg_0486_T06PC0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T06PC0101_000
	scrdef scr_seq_T06PC0101_001
	scrdef scr_seq_T06PC0101_002
	scrdef scr_seq_T06PC0101_003
	scrdef_end

scr_seq_T06PC0101_000:
	setvar VAR_SPECIAL_x8007, 0
	callstd std_nurse_joy
	end

scr_seq_T06PC0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_CAUGHT_SNORLAX, _003C
	npc_msg msg_0486_T06PC0101_00000
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_003C:
	npc_msg msg_0486_T06PC0101_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T06PC0101_002:
	simple_npc_msg msg_0486_T06PC0101_00002
	end

scr_seq_T06PC0101_003:
	simple_npc_msg msg_0486_T06PC0101_00003
	end
	.balign 4, 0
