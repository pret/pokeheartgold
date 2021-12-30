#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0125_D49R0104_0076 ; 000
	scrdef scr_seq_0125_D49R0104_0089 ; 001
	scrdef scr_seq_0125_D49R0104_00B2 ; 002
	scrdef scr_seq_0125_D49R0104_00C5 ; 003
	scrdef scr_seq_0125_D49R0104_00F8 ; 004
	scrdef scr_seq_0125_D49R0104_010B ; 005
	scrdef scr_seq_0125_D49R0104_0126 ; 006
	scrdef scr_seq_0125_D49R0104_0141 ; 007
	scrdef scr_seq_0125_D49R0104_0172 ; 008
	scrdef scr_seq_0125_D49R0104_0185 ; 009
	scrdef scr_seq_0125_D49R0104_0198 ; 010
	scrdef scr_seq_0125_D49R0104_0055 ; 011
	scrdef scr_seq_0125_D49R0104_003A ; 012
	scrdef scr_seq_0125_D49R0104_01AB ; 013
	scrdef_end

scr_seq_0125_D49R0104_003A:
	checkflag FLAG_UNK_0EF
	gotoif TRUE, scr_seq_0125_D49R0104_004D
	setvar VAR_TEMP_x400B, 0
	end

scr_seq_0125_D49R0104_004D:
	setvar VAR_TEMP_x400B, 1
	end

scr_seq_0125_D49R0104_0055:
	comparevartovalue VAR_TEMP_x400B, 1
	gotoif ne, scr_seq_0125_D49R0104_0074
	move_person 2, 2, 1, 3, 3
	setvar VAR_TEMP_x400B, 0
scr_seq_0125_D49R0104_0074:
	end

scr_seq_0125_D49R0104_0076:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0125_D49R0104_0089:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0EF
	gotoif TRUE, scr_seq_0125_D49R0104_00A7
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0125_D49R0104_00A7:
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0125_D49R0104_00B2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0125_D49R0104_00C5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 4
	closemsg
	apply_movement 4, scr_seq_0125_D49R0104_00F0
	wait_movement
	scrcmd_076 19, 0
	npc_msg 11
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0125_D49R0104_00EF:
	.byte 0x00

scr_seq_0125_D49R0104_00F0:
	step 48, 2
	step_end
scr_seq_0125_D49R0104_00F8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0125_D49R0104_010B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 19, 0
	npc_msg 10
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0125_D49R0104_0126:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 41, 0
	npc_msg 12
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0125_D49R0104_0141:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	buffer_players_name 0
	npc_msg 6
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_712 0
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0125_D49R0104_0172:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0125_D49R0104_0185:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0125_D49R0104_0198:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0125_D49R0104_01AB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 13
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
