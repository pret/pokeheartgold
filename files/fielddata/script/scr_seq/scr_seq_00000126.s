#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000126_00000076 ; 000
	scrdef scr_seq_00000126_00000089 ; 001
	scrdef scr_seq_00000126_000000B2 ; 002
	scrdef scr_seq_00000126_000000C5 ; 003
	scrdef scr_seq_00000126_000000D8 ; 004
	scrdef scr_seq_00000126_000000EB ; 005
	scrdef scr_seq_00000126_000000FC ; 006
	scrdef scr_seq_00000126_00000117 ; 007
	scrdef scr_seq_00000126_00000148 ; 008
	scrdef scr_seq_00000126_00000171 ; 009
	scrdef scr_seq_00000126_0000019A ; 010
	scrdef scr_seq_00000126_00000055 ; 011
	scrdef scr_seq_00000126_0000003A ; 012
	scrdef scr_seq_00000126_000001C3 ; 013
	scrdef_end

scr_seq_00000126_0000003A:
	checkflag FLAG_UNK_0F0
	gotoif eq, scr_seq_00000126_0000004D
	setvar VAR_TEMP_x400C, 0
	end

scr_seq_00000126_0000004D:
	setvar VAR_TEMP_x400C, 1
	end

scr_seq_00000126_00000055:
	comparevartovalue VAR_TEMP_x400C, 1
	gotoif ne, scr_seq_00000126_00000074
	scrcmd_339 1, 2, 1, 3, 3
	setvar VAR_TEMP_x400C, 0
scr_seq_00000126_00000074:
	end

scr_seq_00000126_00000076:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000126_00000089:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0F0
	gotoif eq, scr_seq_00000126_000000A7
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000126_000000A7:
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000126_000000B2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000126_000000C5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000126_000000D8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000126_000000EB:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000126_000000FC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 147, 0
	msgbox 15
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000126_00000117:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_190 0
	msgbox 6
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_712 1
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000126_00000148:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_2D6
	gotoif lt, scr_seq_00000126_00000166
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000126_00000166:
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000126_00000171:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_2D5
	gotoif lt, scr_seq_00000126_0000018F
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000126_0000018F:
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000126_0000019A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_2D7
	gotoif lt, scr_seq_00000126_000001B8
	msgbox 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000126_000001B8:
	msgbox 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000126_000001C3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 13
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
