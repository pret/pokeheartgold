#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0793_T07R0105_0036 ; 000
	scrdef scr_seq_0793_T07R0105_001A ; 001
	scrdef scr_seq_0793_T07R0105_0052 ; 002
	scrdef scr_seq_0793_T07R0105_0065 ; 003
	scrdef scr_seq_0793_T07R0105_0078 ; 004
	scrdef scr_seq_0793_T07R0105_008B ; 005
	scrdef_end

scr_seq_0793_T07R0105_001A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 22
	callstd 2052
	releaseall
	end

scr_seq_0793_T07R0105_0036:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 23
	callstd 2052
	releaseall
	end

scr_seq_0793_T07R0105_0052:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0793_T07R0105_0065:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0793_T07R0105_0078:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0793_T07R0105_008B:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
