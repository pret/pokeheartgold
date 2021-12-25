#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000125_00000076 ; 000
	scrdef scr_seq_00000125_00000089 ; 001
	scrdef scr_seq_00000125_000000B2 ; 002
	scrdef scr_seq_00000125_000000C5 ; 003
	scrdef scr_seq_00000125_000000F8 ; 004
	scrdef scr_seq_00000125_0000010B ; 005
	scrdef scr_seq_00000125_00000126 ; 006
	scrdef scr_seq_00000125_00000141 ; 007
	scrdef scr_seq_00000125_00000172 ; 008
	scrdef scr_seq_00000125_00000185 ; 009
	scrdef scr_seq_00000125_00000198 ; 010
	scrdef scr_seq_00000125_00000055 ; 011
	scrdef scr_seq_00000125_0000003A ; 012
	scrdef scr_seq_00000125_000001AB ; 013
	scrdef_end

scr_seq_00000125_0000003A:
	checkflag FLAG_UNK_0EF
	gotoif eq, scr_seq_00000125_0000004D
	setvar VAR_TEMP_x400B, 0
	end

scr_seq_00000125_0000004D:
	setvar VAR_TEMP_x400B, 1
	end

scr_seq_00000125_00000055:
	comparevartovalue VAR_TEMP_x400B, 1
	gotoif ne, scr_seq_00000125_00000074
	scrcmd_339 2, 2, 1, 3, 3
	setvar VAR_TEMP_x400B, 0
scr_seq_00000125_00000074:
	end

scr_seq_00000125_00000076:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000125_00000089:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0EF
	gotoif eq, scr_seq_00000125_000000A7
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000125_000000A7:
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000125_000000B2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000125_000000C5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 4
	closemsg
	apply_movement 4, scr_seq_00000125_000000F0
	wait_movement
	scrcmd_076 19, 0
	msgbox 11
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000125_000000EF:
	.byte 0x00

scr_seq_00000125_000000F0:
	.short 48, 2
	.short 254, 0
scr_seq_00000125_000000F8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000125_0000010B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 19, 0
	msgbox 10
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000125_00000126:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 41, 0
	msgbox 12
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000125_00000141:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_190 0
	msgbox 6
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_712 0
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000125_00000172:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000125_00000185:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000125_00000198:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000125_000001AB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 13
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
