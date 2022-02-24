#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R11R0101.h"
#include "msgdata/msg/msg_0347_R11R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R11R0101_000
	scrdef scr_seq_R11R0101_001
	scrdef_end

scr_seq_R11R0101_000:
	setvar VAR_UNK_4085, 0
	end

scr_seq_R11R0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_SNORLAX_MEET, _0030
	npc_msg msg_0347_R11R0101_00000
_0028:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0030:
	npc_msg msg_0347_R11R0101_00001
	goto _0028
	.balign 4, 0
