#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0126_0076 ; 000
	scrdef scr_seq_0126_0089 ; 001
	scrdef scr_seq_0126_00B2 ; 002
	scrdef scr_seq_0126_00C5 ; 003
	scrdef scr_seq_0126_00D8 ; 004
	scrdef scr_seq_0126_00EB ; 005
	scrdef scr_seq_0126_00FC ; 006
	scrdef scr_seq_0126_0117 ; 007
	scrdef scr_seq_0126_0148 ; 008
	scrdef scr_seq_0126_0171 ; 009
	scrdef scr_seq_0126_019A ; 010
	scrdef scr_seq_0126_0055 ; 011
	scrdef scr_seq_0126_003A ; 012
	scrdef scr_seq_0126_01C3 ; 013
	scrdef_end

scr_seq_0126_003A:
	checkflag FLAG_UNK_0F0
	gotoif TRUE, scr_seq_0126_004D
	setvar VAR_TEMP_x400C, 0
	end

scr_seq_0126_004D:
	setvar VAR_TEMP_x400C, 1
	end

scr_seq_0126_0055:
	comparevartovalue VAR_TEMP_x400C, 1
	gotoif ne, scr_seq_0126_0074
	show_person_at 1, 2, 1, 3, 3
	setvar VAR_TEMP_x400C, 0
scr_seq_0126_0074:
	end

scr_seq_0126_0076:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0126_0089:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0F0
	gotoif TRUE, scr_seq_0126_00A7
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0126_00A7:
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0126_00B2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0126_00C5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0126_00D8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0126_00EB:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0126_00FC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 147, 0
	npc_msg 15
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0126_0117:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	buffer_players_name 0
	npc_msg 6
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_712 1
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0126_0148:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_2D6
	gotoif FALSE, scr_seq_0126_0166
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0126_0166:
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0126_0171:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_2D5
	gotoif FALSE, scr_seq_0126_018F
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0126_018F:
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0126_019A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_2D7
	gotoif FALSE, scr_seq_0126_01B8
	npc_msg 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0126_01B8:
	npc_msg 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0126_01C3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 13
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
