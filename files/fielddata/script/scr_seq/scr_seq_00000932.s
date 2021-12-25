#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000932_000000BE ; 000
	scrdef scr_seq_00000932_0000000A ; 001
	scrdef_end

scr_seq_00000932_0000000A:
	checkflag FLAG_UNK_189
	gotoif lt, scr_seq_00000932_0000001B
	clearflag FLAG_UNK_189
	end

scr_seq_00000932_0000001B:
	scrcmd_142 39, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000932_000000B8
	checkflag FLAG_UNK_964
	gotoif lt, scr_seq_00000932_000000B2
	scrcmd_147 39, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000932_000000B2
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_00000932_00000067
	setflag FLAG_UNK_2EE
	goto scr_seq_00000932_000000B0

scr_seq_00000932_00000067:
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_00000932_0000007E
	setflag FLAG_UNK_2EE
	goto scr_seq_00000932_000000B0

scr_seq_00000932_0000007E:
	comparevartovalue VAR_TEMP_x4000, 8
	gotoif ne, scr_seq_00000932_00000095
	setflag FLAG_UNK_2EE
	goto scr_seq_00000932_000000B0

scr_seq_00000932_00000095:
	comparevartovalue VAR_TEMP_x4000, 9
	gotoif ne, scr_seq_00000932_000000AC
	setflag FLAG_UNK_2EE
	goto scr_seq_00000932_000000B0

scr_seq_00000932_000000AC:
	clearflag FLAG_UNK_2EE
scr_seq_00000932_000000B0:
	end

scr_seq_00000932_000000B2:
	clearflag FLAG_UNK_2EE
	end

scr_seq_00000932_000000B8:
	setflag FLAG_UNK_2EE
	end

scr_seq_00000932_000000BE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 6, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000932_00000178
	msgbox 0
	closemsg
	scrcmd_213 32, 0, 0, 0
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000932_00000172
	settrainerflag 482
	settrainerflag 484
	settrainerflag 481
	settrainerflag 480
	settrainerflag 483
	msgbox 1
	scrcmd_295 6
	addvar VAR_UNK_4134, 1
	scrcmd_515 22
	comparevartovalue VAR_UNK_4134, 3
	gotoif ne, scr_seq_00000932_0000012F
	setvar VAR_UNK_4077, 1
scr_seq_00000932_0000012F:
	scrcmd_190 0
	msgbox 2
	scrcmd_078 1189
	scrcmd_079
	msgbox 3
	setvar VAR_SPECIAL_x8004, 334
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000932_0000018E
	callstd 2033
	setflag FLAG_UNK_0D2
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000932_00000172:
	scrcmd_219
	releaseall
	end

scr_seq_00000932_00000178:
	checkflag FLAG_UNK_964
	gotoif eq, scr_seq_00000932_00000198
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000932_0000018E:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000932_00000198:
	msgbox 6
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000932_000001F9
	scrcmd_618 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000932_00000204
	msgbox 7
	closemsg
	setflag FLAG_UNK_189
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_615 40
	faceplayer
	lockall
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	clearflag FLAG_UNK_189
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000932_000001F9:
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000932_00000204:
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
