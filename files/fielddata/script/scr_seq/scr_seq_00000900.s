#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000900_0000001A ; 000
	scrdef scr_seq_00000900_00000036 ; 001
	scrdef scr_seq_00000900_00000052 ; 002
	scrdef scr_seq_00000900_0000007B ; 003
	scrdef scr_seq_00000900_000000A4 ; 004
	scrdef scr_seq_00000900_000000CD ; 005
	scrdef_end

scr_seq_00000900_0000001A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 3
	callstd 2052
	releaseall
	end

scr_seq_00000900_00000036:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 4
	callstd 2052
	releaseall
	end

scr_seq_00000900_00000052:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_00000900_00000070
	msgbox 1
	goto scr_seq_00000900_00000073

scr_seq_00000900_00000070:
	msgbox 0
scr_seq_00000900_00000073:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000900_0000007B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_00000900_00000099
	msgbox 5
	goto scr_seq_00000900_0000009C

scr_seq_00000900_00000099:
	msgbox 4
scr_seq_00000900_0000009C:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000900_000000A4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_00000900_000000C2
	msgbox 3
	goto scr_seq_00000900_000000C5

scr_seq_00000900_000000C2:
	msgbox 2
scr_seq_00000900_000000C5:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000900_000000CD:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
