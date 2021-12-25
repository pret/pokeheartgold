#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000197_00000046 ; 000
	scrdef scr_seq_00000197_00000012 ; 001
	scrdef scr_seq_00000197_000000C0 ; 002
	scrdef scr_seq_00000197_000000D7 ; 003
	scrdef_end

scr_seq_00000197_00000012:
	checkflag FLAG_UNK_0A4
	gotoif eq, scr_seq_00000197_0000002A
	checkflag FLAG_UNK_0F9
	gotoif eq, scr_seq_00000197_00000044
	end

scr_seq_00000197_0000002A:
	setflag FLAG_UNK_261
	scrcmd_101 4
	scrcmd_101 8
	scrcmd_101 7
	scrcmd_101 9
	clearflag FLAG_UNK_0A4
	end

scr_seq_00000197_00000044:
	end

scr_seq_00000197_00000046:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_779 5, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000197_0000006A
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000197_0000006A:
	scrcmd_076 143, 0
	msgbox 3
	scrcmd_077
	closemsg
	setflag FLAG_UNK_0A4
	scrcmd_589 143, 50, 0
	clearflag FLAG_UNK_0A4
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000197_000000B4
	scrcmd_683 16389
	comparevartovalue VAR_TEMP_x4005, 4
	callif eq, scr_seq_00000197_000000BA
	setflag FLAG_UNK_998
	setflag FLAG_UNK_0F9
	releaseall
	end

scr_seq_00000197_000000B4:
	scrcmd_219
	releaseall
	end

scr_seq_00000197_000000BA:
	setflag FLAG_UNK_173
	return

scr_seq_00000197_000000C0:
	scrcmd_055 0, 1, 2, 32780
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 32780
	callstd 2000
	end

scr_seq_00000197_000000D7:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 1, 32780
	callstd 2000
	end
	.balign 4, 0
