#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T20R0202.h"
#include "msgdata/msg/msg_0546_T20R0202.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T20R0202_000
	scrdef scr_seq_T20R0202_001
	scrdef_end

scr_seq_T20R0202_000:
	scrcmd_609
	lockall
	play_se SEQ_SE_DP_PC_ON
	buffer_players_name 0
	npc_msg msg_0546_T20R0202_00000
	closemsg
	scrcmd_377 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _004B
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_376
	restore_overworld
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

_004B:
	npc_msg msg_0546_T20R0202_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T20R0202_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0546_T20R0202_00002
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
