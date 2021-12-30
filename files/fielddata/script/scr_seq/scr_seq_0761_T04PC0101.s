#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0761_T04PC0101_000E ; 000
	scrdef scr_seq_0761_T04PC0101_001A ; 001
	scrdef scr_seq_0761_T04PC0101_002D ; 002
	scrdef_end

scr_seq_0761_T04PC0101_000E:
	setvar VAR_SPECIAL_x8007, 0
	callstd std_nurse_joy
	end

scr_seq_0761_T04PC0101_001A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0761_T04PC0101_002D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
