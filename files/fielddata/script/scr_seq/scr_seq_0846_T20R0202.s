#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0846_T20R0202_000A ; 000
	scrdef scr_seq_0846_T20R0202_0056 ; 001
	scrdef_end

scr_seq_0846_T20R0202_000A:
	scrcmd_609
	lockall
	play_se SEQ_SE_DP_PC_ON
	buffer_players_name 0
	npc_msg 0
	closemsg
	scrcmd_377 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0846_T20R0202_004B
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_376
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0846_T20R0202_004B:
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0846_T20R0202_0056:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
