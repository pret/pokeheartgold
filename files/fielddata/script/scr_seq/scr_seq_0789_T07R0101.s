#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0789_T07R0101_0012 ; 000
	scrdef scr_seq_0789_T07R0101_0025 ; 001
	scrdef scr_seq_0789_T07R0101_0038 ; 002
	scrdef scr_seq_0789_T07R0101_004B ; 003
	scrdef_end

scr_seq_0789_T07R0101_0012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0789_T07R0101_0025:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0789_T07R0101_0038:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0789_T07R0101_004B:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
