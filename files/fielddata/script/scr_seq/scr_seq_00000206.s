#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000206_00000089 ; 000
	scrdef scr_seq_00000206_0000000A ; 001
	scrdef_end

scr_seq_00000206_0000000A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_ABA
	gotoif eq, scr_seq_00000206_00000068
	scrcmd_540 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000206_0000007E
	msgbox 1
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000206_00000073
	scrcmd_538 32780, 0
	comparevartovalue VAR_SPECIAL_x800C, 65535
	gotoif eq, scr_seq_00000206_0000007E
	setflag FLAG_UNK_ABA
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000206_00000068:
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000206_00000073:
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000206_0000007E:
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000206_00000089:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
