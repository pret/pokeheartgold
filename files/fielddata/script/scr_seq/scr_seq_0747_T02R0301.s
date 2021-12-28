#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0747_T02R0301_0022 ; 000
	scrdef scr_seq_0747_T02R0301_0035 ; 001
	scrdef scr_seq_0747_T02R0301_0048 ; 002
	scrdef scr_seq_0747_T02R0301_005B ; 003
	scrdef scr_seq_0747_T02R0301_006E ; 004
	scrdef scr_seq_0747_T02R0301_0081 ; 005
	scrdef scr_seq_0747_T02R0301_0092 ; 006
	scrdef scr_seq_0747_T02R0301_00A3 ; 007
	scrdef_end

scr_seq_0747_T02R0301_0022:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0747_T02R0301_0035:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0747_T02R0301_0048:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0747_T02R0301_005B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0747_T02R0301_006E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0747_T02R0301_0081:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0747_T02R0301_0092:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0747_T02R0301_00A3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
