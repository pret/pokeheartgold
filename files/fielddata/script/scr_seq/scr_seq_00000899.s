#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000899_00000016 ; 000
	scrdef scr_seq_00000899_00000029 ; 001
	scrdef scr_seq_00000899_00000052 ; 002
	scrdef scr_seq_00000899_0000007B ; 003
	scrdef scr_seq_00000899_000000A4 ; 004
	scrdef_end

scr_seq_00000899_00000016:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000899_00000029:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_00000899_00000047
	msgbox 2
	goto scr_seq_00000899_0000004A

scr_seq_00000899_00000047:
	msgbox 1
scr_seq_00000899_0000004A:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000899_00000052:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_00000899_00000070
	msgbox 4
	goto scr_seq_00000899_00000073

scr_seq_00000899_00000070:
	msgbox 3
scr_seq_00000899_00000073:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000899_0000007B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_00000899_00000099
	msgbox 6
	goto scr_seq_00000899_0000009C

scr_seq_00000899_00000099:
	msgbox 5
scr_seq_00000899_0000009C:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000899_000000A4:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
