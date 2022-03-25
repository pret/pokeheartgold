#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_W19R0101.h"
#include "msgdata/msg/msg_0741_W19R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_W19R0101_000
	scrdef_end

scr_seq_W19R0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge BADGE_VOLCANO, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _002C
	npc_msg msg_0741_W19R0101_00000
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_002C:
	npc_msg msg_0741_W19R0101_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
