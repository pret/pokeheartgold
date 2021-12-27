#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0001_0026 ; 000
	scrdef scr_seq_0001_0037 ; 001
	scrdef scr_seq_0001_0048 ; 002
	scrdef scr_seq_0001_0059 ; 003
	scrdef scr_seq_0001_006A ; 004
	scrdef scr_seq_0001_007B ; 005
	scrdef scr_seq_0001_008C ; 006
	scrdef scr_seq_0001_009D ; 007
	scrdef scr_seq_0001_00AE ; 008
	scrdef_end

scr_seq_0001_0026:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0001_0037:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0001_0048:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0001_0059:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0001_006A:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0001_007B:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0001_008C:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0001_009D:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0001_00AE:
	play_se SEQ_SE_DP_SELECT
	lockall
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_157
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end
	.balign 4, 0
