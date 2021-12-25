#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000112_00000458 ; 000
	scrdef scr_seq_00000112_00000550 ; 001
	scrdef scr_seq_00000112_00000563 ; 002
	scrdef scr_seq_00000112_0000007B ; 003
	scrdef scr_seq_00000112_0000001A ; 004
	scrdef scr_seq_00000112_00000576 ; 005
	scrdef_end

scr_seq_00000112_0000001A:
	checkflag FLAG_UNK_189
	gotoif lt, scr_seq_00000112_0000002B
	clearflag FLAG_UNK_189
	end

scr_seq_00000112_0000002B:
	checkflag FLAG_UNK_0EA
	gotoif eq, scr_seq_00000112_0000003C
	goto scr_seq_00000112_0000005A

scr_seq_00000112_0000003C:
	scrcmd_484 16384
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_00000112_00000064
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, scr_seq_00000112_00000064
scr_seq_00000112_0000005A:
	setflag FLAG_UNK_27E
	goto scr_seq_00000112_00000068

scr_seq_00000112_00000064:
	clearflag FLAG_UNK_27E
scr_seq_00000112_00000068:
	checkflag FLAG_UNK_0DC
	gotoif eq, scr_seq_00000112_00000075
	end

scr_seq_00000112_00000075:
	setflag FLAG_UNK_0DD
	end

scr_seq_00000112_0000007B:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000112_00000370
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	msgbox 0
scr_seq_00000112_000000A0:
	setvar VAR_SPECIAL_x8004, 0
	msgbox 1
	scrcmd_746
	scrcmd_749 1, 1, 0, 0, VAR_SPECIAL_x800C
	scrcmd_751 280, 255, 0
	scrcmd_751 281, 255, 1
	scrcmd_751 282, 255, 0
	scrcmd_752
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000112_00000310
	msgbox 9
scr_seq_00000112_000000DF:
	setvar VAR_SPECIAL_x8004, 1
	msgbox 2
	scrcmd_746
	scrcmd_749 1, 1, 0, 0, VAR_SPECIAL_x800C
	scrcmd_751 283, 255, 0
	scrcmd_751 284, 255, 0
	scrcmd_751 285, 255, 1
	scrcmd_752
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000112_00000310
	msgbox 9
scr_seq_00000112_0000011E:
	setvar VAR_SPECIAL_x8004, 2
	msgbox 3
	scrcmd_746
	scrcmd_749 1, 1, 0, 0, VAR_SPECIAL_x800C
	scrcmd_751 286, 255, 1
	scrcmd_751 287, 255, 0
	scrcmd_751 288, 255, 0
	scrcmd_752
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000112_00000310
	msgbox 9
scr_seq_00000112_0000015D:
	setvar VAR_SPECIAL_x8004, 3
	msgbox 4
	scrcmd_746
	scrcmd_749 1, 1, 0, 0, VAR_SPECIAL_x800C
	scrcmd_751 289, 255, 0
	scrcmd_751 290, 255, 1
	scrcmd_751 291, 255, 0
	scrcmd_752
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000112_00000310
	msgbox 9
scr_seq_00000112_0000019C:
	setvar VAR_SPECIAL_x8004, 4
	msgbox 5
	scrcmd_746
	scrcmd_749 1, 1, 0, 0, VAR_SPECIAL_x800C
	scrcmd_751 292, 255, 1
	scrcmd_751 293, 255, 0
	scrcmd_751 294, 255, 0
	scrcmd_752
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000112_00000310
	scrcmd_190 0
	msgbox 6
	closemsg
	scrcmd_339 3, 6, 0, 21, 0
	wait 10, VAR_SPECIAL_x8004
	play_se SEQ_SE_DP_DOOR
	wait 5, VAR_SPECIAL_x8004
	callstd 2044
	apply_movement 255, scr_seq_00000112_00000390
	apply_movement 3, scr_seq_00000112_000003A8
	wait_movement
	msgbox 10
	apply_movement 3, scr_seq_00000112_000003C0
	wait_movement
	msgbox 11
	apply_movement 3, scr_seq_00000112_000003D0
	wait_movement
	msgbox 12
	apply_movement 0, scr_seq_00000112_000003DC
	wait_movement
	msgbox 13
	apply_movement 3, scr_seq_00000112_000003EC
	wait_movement
	msgbox 14
	apply_movement 3, scr_seq_00000112_000003F4
	apply_movement 0, scr_seq_00000112_000003FC
	wait_movement
	msgbox 15
	scrcmd_190 0
	msgbox 16
	scrcmd_078 1189
	scrcmd_079
	scrcmd_295 7
	msgbox 17
	apply_movement 0, scr_seq_00000112_00000408
	apply_movement 255, scr_seq_00000112_00000418
	apply_movement 3, scr_seq_00000112_00000424
	wait_movement
	msgbox 18
	closemsg
	wait 15, VAR_SPECIAL_x8005
	msgbox 19
	closemsg
	apply_movement 3, scr_seq_00000112_00000434
	wait_movement
	scrcmd_101 3
	callstd 2045
	scrcmd_079
	apply_movement 0, scr_seq_00000112_00000450
	wait_movement
	scrcmd_495 32780
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_00000112_000002D3
	msgbox 20
	goto scr_seq_00000112_000002D6

scr_seq_00000112_000002D3:
	msgbox 21
scr_seq_00000112_000002D6:
	waitbutton
	closemsg
	releaseall
	setflag FLAG_UNK_998
	setflag FLAG_UNK_0EA
	clearflag FLAG_UNK_209
	setvar VAR_UNK_40C4, 1
	setflag FLAG_UNK_2E5
	setvar VAR_UNK_40C3, 1
	setvar VAR_UNK_407B, 1
	setvar VAR_UNK_4108, 8
	clearflag FLAG_UNK_1A6
	setvar VAR_UNK_4081, 1
	end

scr_seq_00000112_00000310:
	setflag FLAG_UNK_0DB
	apply_movement 0, scr_seq_00000112_00000378
	wait_movement
	msgbox 7
	apply_movement 0, scr_seq_00000112_00000388
	wait_movement
	msgbox 8
	scrcmd_049
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8004
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000112_000000A0
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000112_000000DF
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000112_0000011E
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000112_0000015D
	goto scr_seq_00000112_0000019C


scr_seq_00000112_00000370:
	.short 12, 8
	.short 254, 0

scr_seq_00000112_00000378:
	.short 63, 2
	.short 3, 1
	.short 63, 2
	.short 254, 0

scr_seq_00000112_00000388:
	.short 1, 1
	.short 254, 0

scr_seq_00000112_00000390:
	.short 63, 1
	.short 75, 1
	.short 1, 1
	.short 63, 8
	.short 2, 1
	.short 254, 0

scr_seq_00000112_000003A8:
	.short 63, 4
	.short 12, 8
	.short 14, 1
	.short 12, 2
	.short 3, 1
	.short 254, 0

scr_seq_00000112_000003C0:
	.short 63, 1
	.short 71, 1
	.short 18, 1
	.short 254, 0

scr_seq_00000112_000003D0:
	.short 63, 1
	.short 10, 1
	.short 254, 0

scr_seq_00000112_000003DC:
	.short 63, 1
	.short 9, 1
	.short 10, 1
	.short 254, 0

scr_seq_00000112_000003EC:
	.short 75, 1
	.short 254, 0

scr_seq_00000112_000003F4:
	.short 15, 2
	.short 254, 0

scr_seq_00000112_000003FC:
	.short 63, 2
	.short 3, 1
	.short 254, 0

scr_seq_00000112_00000408:
	.short 8, 1
	.short 11, 1
	.short 1, 1
	.short 254, 0

scr_seq_00000112_00000418:
	.short 65, 2
	.short 0, 1
	.short 254, 0

scr_seq_00000112_00000424:
	.short 72, 1
	.short 65, 2
	.short 0, 1
	.short 254, 0

scr_seq_00000112_00000434:
	.short 71, 1
	.short 13, 1
	.short 72, 1
	.short 21, 3
	.short 23, 1
	.short 21, 4
	.short 254, 0

scr_seq_00000112_00000450:
	.short 33, 1
	.short 254, 0
scr_seq_00000112_00000458:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0DD
	gotoif eq, scr_seq_00000112_0000053D
	checkflag FLAG_UNK_0DC
	gotoif eq, scr_seq_00000112_0000052E
	checkflag FLAG_UNK_0DA
	gotoif eq, scr_seq_00000112_000004A6
	scrcmd_495 32780
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_00000112_0000049B
	msgbox 20
	goto scr_seq_00000112_0000049E

scr_seq_00000112_0000049B:
	msgbox 22
scr_seq_00000112_0000049E:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000112_000004A6:
	msgbox 26
	scrcmd_332 32773
	comparevartovalue VAR_SPECIAL_x8005, 6
	gotoif ne, scr_seq_00000112_000004C3
	msgbox 28
	goto scr_seq_00000112_00000548

scr_seq_00000112_000004C3:
	scrcmd_190 0
	msgbox 27
	scrcmd_078 1188
	scrcmd_079
	scrcmd_137 147, 15, 0, 0, 0, 32780
	checkflag FLAG_UNK_0DB
	gotoif eq, scr_seq_00000112_000004F0
	scrcmd_139 32773, 0, 245
scr_seq_00000112_000004F0:
	msgbox 32
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000112_0000050E
	goto scr_seq_00000112_0000052E

scr_seq_00000112_0000050E:
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_173 32773, 32780
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000112_0000052E:
	setflag FLAG_UNK_0DC
	msgbox 29
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000112_0000053D:
	msgbox 30
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000112_00000548:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000112_00000550:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 24
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000112_00000563:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 25
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000112_00000576:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, 32780
	scrcmd_440 32780, 0
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000112_0000069E
	scrcmd_618 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000112_000006B2
	scrcmd_438 2, 32780
	scrcmd_440 32780, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000112_000005EF
	apply_movement 255, scr_seq_00000112_000006C8
	apply_movement 4, scr_seq_00000112_00000714
	goto scr_seq_00000112_0000063D

scr_seq_00000112_000005EF:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000112_0000060A
	apply_movement 255, scr_seq_00000112_000006E0
	goto scr_seq_00000112_0000063D

scr_seq_00000112_0000060A:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000112_0000062D
	apply_movement 255, scr_seq_00000112_00000700
	apply_movement 4, scr_seq_00000112_00000714
	goto scr_seq_00000112_0000063D

scr_seq_00000112_0000062D:
	apply_movement 255, scr_seq_00000112_000006EC
	apply_movement 4, scr_seq_00000112_00000714
scr_seq_00000112_0000063D:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000112_00000664
	apply_movement 253, scr_seq_00000112_00000720
	wait_movement
scr_seq_00000112_00000664:
	setflag FLAG_UNK_189
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_615 46
	lockall
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	clearflag FLAG_UNK_189
	scrcmd_438 2, 32780
	scrcmd_440 32780, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000112_0000069E:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000112_000006B2:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000112_000006C6:
	.byte 0x00, 0x00

scr_seq_00000112_000006C8:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000112_000006E0:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000112_000006EC:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000112_00000700:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000112_00000714:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000112_00000720:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
	.balign 4, 0
