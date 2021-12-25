#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000920_00000046 ; 000
	scrdef scr_seq_00000920_00000390 ; 001
	scrdef scr_seq_00000920_000003A7 ; 002
	scrdef scr_seq_00000920_000003BC ; 003
	scrdef scr_seq_00000920_000003D1 ; 004
	scrdef scr_seq_00000920_000000DC ; 005
	scrdef scr_seq_00000920_00000474 ; 006
	scrdef scr_seq_00000920_000004B3 ; 007
	scrdef scr_seq_00000920_000003FB ; 008
	scrdef scr_seq_00000920_00000422 ; 009
	scrdef scr_seq_00000920_0000044B ; 010
	scrdef scr_seq_00000920_000004C6 ; 011
	scrdef scr_seq_00000920_0000007A ; 012
	scrdef scr_seq_00000920_000001FC ; 013
	scrdef scr_seq_00000920_0000020F ; 014
	scrdef scr_seq_00000920_00000048 ; 015
	scrdef scr_seq_00000920_000003E6 ; 016
	scrdef_end

scr_seq_00000920_00000046:
	end

scr_seq_00000920_00000048:
	checkflag FLAG_UNK_189
	gotoif lt, scr_seq_00000920_00000059
	clearflag FLAG_UNK_189
	end

scr_seq_00000920_00000059:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_00000920_00000074
	clearflag FLAG_UNK_27E
	goto scr_seq_00000920_00000078

scr_seq_00000920_00000074:
	setflag FLAG_UNK_27E
scr_seq_00000920_00000078:
	end

scr_seq_00000920_0000007A:
	scrcmd_609
	lockall
	scrcmd_307 11, 5, 25, 23, 1
	scrcmd_310 1
	scrcmd_308 1
	apply_movement 255, scr_seq_00000920_000000D0
	wait_movement
	scrcmd_098 253
	scrcmd_596 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000920_000000B6
	scrcmd_606
	goto scr_seq_00000920_000000B8

scr_seq_00000920_000000B6:
	scrcmd_607
scr_seq_00000920_000000B8:
	scrcmd_099 253
	setvar VAR_UNK_4079, 0
	scrcmd_311 1
	scrcmd_308 1
	scrcmd_309 1
	releaseall
	end

scr_seq_00000920_000000CF:
	.byte 0x00

scr_seq_00000920_000000D0:
	.short 17, 2
	.short 63, 1
	.short 254, 0
scr_seq_00000920_000000DC:
	scrcmd_609
	lockall
	clearflag FLAG_UNK_23F
	scrcmd_100 6
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	apply_movement 6, scr_seq_00000920_0000019C
	apply_movement 255, scr_seq_00000920_000001B0
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	play_se SEQ_SE_DP_WALL_HIT2
	msgbox 16
	wait 30, VAR_SPECIAL_x800C
	scrcmd_191 1
	msgbox 17
	closemsg
	apply_movement 6, scr_seq_00000920_000001C4
	wait_movement
	scrcmd_190 0
	scrcmd_191 1
	msgbox 18
	closemsg
	play_se SEQ_SE_DP_WALL_HIT2
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	apply_movement 6, scr_seq_00000920_000001D4
	apply_movement 255, scr_seq_00000920_000001B0
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 6, scr_seq_00000920_000001E0
	apply_movement 255, scr_seq_00000920_000001F0
	wait_movement
	hide_person 6
	setflag FLAG_UNK_23F
	releaseall
	setvar VAR_UNK_4079, 4
	setvar VAR_UNK_410C, 4
	clearflag FLAG_UNK_23C
	setflag FLAG_UNK_241
	end

scr_seq_00000920_00000194:
	.byte 0x4b, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_00000920_0000019C:
	.short 71, 1
	.short 17, 1
	.short 36, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000920_000001B0:
	.short 0, 1
	.short 71, 1
	.short 17, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000920_000001C4:
	.short 75, 1
	.short 63, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000920_000001D4:
	.short 17, 1
	.short 37, 1
	.short 254, 0

scr_seq_00000920_000001E0:
	.short 10, 3
	.short 63, 3
	.short 18, 6
	.short 254, 0

scr_seq_00000920_000001F0:
	.short 63, 3
	.short 34, 1
	.short 254, 0
scr_seq_00000920_000001FC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 19
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000920_0000020F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000920_00000314
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000920_00000328
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000920_00000288
	apply_movement 255, scr_seq_00000920_0000033C
	apply_movement 8, scr_seq_00000920_00000374
	goto scr_seq_00000920_000002B3

scr_seq_00000920_00000288:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000920_000002A3
	apply_movement 255, scr_seq_00000920_00000354
	goto scr_seq_00000920_000002B3

scr_seq_00000920_000002A3:
	apply_movement 255, scr_seq_00000920_00000360
	apply_movement 8, scr_seq_00000920_00000374
scr_seq_00000920_000002B3:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000920_000002DA
	apply_movement 253, scr_seq_00000920_00000380
	wait_movement
scr_seq_00000920_000002DA:
	setflag FLAG_UNK_189
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_615 19
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

scr_seq_00000920_00000314:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000920_00000328:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end


scr_seq_00000920_0000033C:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000920_00000354:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000920_00000360:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000920_00000374:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000920_00000380:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_00000920_00000390:
	scrcmd_055 11, 0, 18, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000920_000003A7:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 12, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000920_000003BC:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 13, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000920_000003D1:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 14, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000920_000003E6:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 15, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000920_000003FB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_96A
	gotoif eq, scr_seq_00000920_00000417
	msgbox 8
	goto scr_seq_00000920_0000041A

scr_seq_00000920_00000417:
	msgbox 9
scr_seq_00000920_0000041A:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000920_00000422:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_964
	gotoif eq, scr_seq_00000920_00000440
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000920_00000440:
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000920_0000044B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_410C, 2
	gotoif gt, scr_seq_00000920_00000469
	msgbox 2
	goto scr_seq_00000920_0000046C

scr_seq_00000920_00000469:
	msgbox 3
scr_seq_00000920_0000046C:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000920_00000474:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_964
	gotoif eq, scr_seq_00000920_000004A8
	comparevartovalue VAR_UNK_40A1, 0
	gotoif ne, scr_seq_00000920_0000049D
	msgbox 5
	goto scr_seq_00000920_000004A0

scr_seq_00000920_0000049D:
	msgbox 6
scr_seq_00000920_000004A0:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000920_000004A8:
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000920_000004B3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000920_000004C6:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
