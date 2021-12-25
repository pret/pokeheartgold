#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000758_00000075 ; 000
	scrdef scr_seq_00000758_0000009E ; 001
	scrdef scr_seq_00000758_000000B1 ; 002
	scrdef scr_seq_00000758_000000C4 ; 003
	scrdef scr_seq_00000758_000000E2 ; 004
	scrdef scr_seq_00000758_00000137 ; 005
	scrdef scr_seq_00000758_00000160 ; 006
	scrdef scr_seq_00000758_00000177 ; 007
	scrdef scr_seq_00000758_0000018C ; 008
	scrdef scr_seq_00000758_000001A1 ; 009
	scrdef scr_seq_00000758_000001B6 ; 010
	scrdef scr_seq_00000758_000001CD ; 011
	scrdef scr_seq_00000758_0000003A ; 012
	scrdef scr_seq_00000758_0000014D ; 013
	scrdef_end

scr_seq_00000758_0000003A:
	checkflag FLAG_UNK_189
	gotoif lt, scr_seq_00000758_0000004B
	clearflag FLAG_UNK_189
	end

scr_seq_00000758_0000004B:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, scr_seq_00000758_0000006F
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_00000758_0000006F
	setflag FLAG_UNK_27E
	end

scr_seq_00000758_0000006F:
	clearflag FLAG_UNK_27E
	end

scr_seq_00000758_00000075:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_118
	gotoif eq, scr_seq_00000758_00000093
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000758_00000093:
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000758_0000009E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000758_000000B1:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000758_000000C4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 3
	scrcmd_076 80, 0
	scrcmd_077
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000758_000000E2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4087, 3
	gotoif ge, scr_seq_00000758_0000012C
	comparevartovalue VAR_UNK_411C, 2
	gotoif eq, scr_seq_00000758_00000123
	comparevartovalue VAR_UNK_411C, 1
	gotoif eq, scr_seq_00000758_0000011A
	msgbox 6
	goto scr_seq_00000758_0000012F

scr_seq_00000758_0000011A:
	msgbox 7
	goto scr_seq_00000758_0000012F

scr_seq_00000758_00000123:
	msgbox 8
	goto scr_seq_00000758_0000012F

scr_seq_00000758_0000012C:
	msgbox 9
scr_seq_00000758_0000012F:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000758_00000137:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 10
	msgbox 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000758_0000014D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000758_00000160:
	scrcmd_055 13, 0, 4, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000758_00000177:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 14, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000758_0000018C:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 15, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000758_000001A1:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 16, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000758_000001B6:
	scrcmd_055 17, 1, 14, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000758_000001CD:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000758_000002F5
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000758_00000309
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000758_00000246
	apply_movement 255, scr_seq_00000758_00000320
	apply_movement 6, scr_seq_00000758_0000036C
	goto scr_seq_00000758_00000294

scr_seq_00000758_00000246:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000758_00000261
	apply_movement 255, scr_seq_00000758_00000338
	goto scr_seq_00000758_00000294

scr_seq_00000758_00000261:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000758_00000284
	apply_movement 255, scr_seq_00000758_00000358
	apply_movement 6, scr_seq_00000758_0000036C
	goto scr_seq_00000758_00000294

scr_seq_00000758_00000284:
	apply_movement 255, scr_seq_00000758_00000344
	apply_movement 6, scr_seq_00000758_0000036C
scr_seq_00000758_00000294:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000758_000002BB
	apply_movement 253, scr_seq_00000758_00000378
	wait_movement
scr_seq_00000758_000002BB:
	setflag FLAG_UNK_189
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_615 55
	lockall
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	clearflag FLAG_UNK_189
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000758_000002F5:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000758_00000309:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000758_0000031D:
	.byte 0x00, 0x00, 0x00

scr_seq_00000758_00000320:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000758_00000338:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000758_00000344:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000758_00000358:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000758_0000036C:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000758_00000378:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
	.balign 4, 0
