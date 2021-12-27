#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0791_001A ; 000
	scrdef scr_seq_0791_0036 ; 001
	scrdef scr_seq_0791_0049 ; 002
	scrdef scr_seq_0791_005C ; 003
	scrdef scr_seq_0791_006F ; 004
	scrdef scr_seq_0791_0082 ; 005
	scrdef_end

scr_seq_0791_001A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 20
	callstd 2052
	releaseall
	end

scr_seq_0791_0036:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0791_0049:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0791_005C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0791_006F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0791_0082:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
