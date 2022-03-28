#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T23GYM0101.h"
#include "msgdata/msg/msg_0566_T23GYM0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T23GYM0101_000
	scrdef scr_seq_T23GYM0101_001
	scrdef_end

scr_seq_T23GYM0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge BADGE_HIVE, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0030
	npc_msg msg_0566_T23GYM0101_00000
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0030:
	npc_msg msg_0566_T23GYM0101_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T23GYM0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge BADGE_HIVE, VAR_SPECIAL_RESULT
	buffer_players_name 0
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0062
	npc_msg msg_0566_T23GYM0101_00002
	goto _0065

_0062:
	npc_msg msg_0566_T23GYM0101_00003
_0065:
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
