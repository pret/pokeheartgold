#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R07R0101.h"
#include "msgdata/msg/msg_0337_R07R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R07R0101_000
	scrdef_end

scr_seq_R07R0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_RESTORED_POWER, _0024
	npc_msg msg_0337_R07R0101_00000
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0024:
	npc_msg msg_0337_R07R0101_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
