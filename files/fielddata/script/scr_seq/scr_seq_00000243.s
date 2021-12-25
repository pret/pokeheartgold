#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000243_0000006A ; 000
	scrdef scr_seq_00000243_000003BC ; 001
	scrdef scr_seq_00000243_0000002E ; 002
	scrdef scr_seq_00000243_000005B9 ; 003
	scrdef scr_seq_00000243_000005D0 ; 004
	scrdef scr_seq_00000243_000005E5 ; 005
	scrdef scr_seq_00000243_000005FA ; 006
	scrdef scr_seq_00000243_0000050A ; 007
	scrdef scr_seq_00000243_00000544 ; 008
	scrdef scr_seq_00000243_00000592 ; 009
	scrdef scr_seq_00000243_0000004F ; 010
	scrdef_end

scr_seq_00000243_0000002E:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, scr_seq_00000243_00000049
	clearflag FLAG_UNK_1C4
	goto scr_seq_00000243_0000004D

scr_seq_00000243_00000049:
	setflag FLAG_UNK_1C4
scr_seq_00000243_0000004D:
	end

scr_seq_00000243_0000004F:
	checkflag FLAG_UNK_0A4
	gotoif eq, scr_seq_00000243_0000005C
	end

scr_seq_00000243_0000005C:
	setflag FLAG_UNK_1C2
	hide_person 4
	clearflag FLAG_UNK_0A4
	end

scr_seq_00000243_0000006A:
	play_se SEQ_SE_DP_SELECT
	lockall
	checkflag FLAG_UNK_1D0
	gotoif lt, scr_seq_00000243_00000261
	hasitem ITEM_SQUIRTBOTTLE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000243_0000009A
	apply_movement 5, scr_seq_00000243_0000053C
	wait_movement
scr_seq_00000243_0000009A:
	play_se SEQ_SE_GS_KI_UGOKU
	apply_movement 4, scr_seq_00000243_0000038C
	wait_movement
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000243_000000B9
	releaseall
	end

scr_seq_00000243_000000B9:
	msgbox 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000243_000000E0
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000243_0000025B
	end

scr_seq_00000243_000000E0:
	scrcmd_190 0
	msgbox 1
	play_se SEQ_SE_GS_ZENIGAME_JOURO
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000243_00000109
	apply_movement 255, scr_seq_00000243_0000039C
	goto scr_seq_00000243_0000012C

scr_seq_00000243_00000109:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000243_00000124
	apply_movement 255, scr_seq_00000243_000003AC
	goto scr_seq_00000243_0000012C

scr_seq_00000243_00000124:
	apply_movement 255, scr_seq_00000243_000003A4
scr_seq_00000243_0000012C:
	wait_movement
	setflag FLAG_UNK_0B4
	msgbox 2
	closemsg
	play_se SEQ_SE_GS_KI_UGOKU
	apply_movement 4, scr_seq_00000243_00000394
	wait_movement
	setflag FLAG_UNK_0A4
	scrcmd_589 185, 20, 0
	clearflag FLAG_UNK_0A4
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000243_00000255
	scrcmd_683 16385
	comparevartovalue VAR_TEMP_x4001, 3
	gotoif eq, scr_seq_00000243_00000251
	comparevartovalue VAR_TEMP_x4001, 4
	callif eq, scr_seq_00000243_0000023F
	setflag FLAG_UNK_0B5
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000243_000001BC
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000243_000003B4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	goto scr_seq_00000243_000001C6

scr_seq_00000243_000001BC:
	apply_movement 5, scr_seq_00000243_00000360
	wait_movement
scr_seq_00000243_000001C6:
	msgbox 15
	setvar VAR_SPECIAL_x8004, 470
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	msgbox 16
	msgbox 17
	setvar VAR_SPECIAL_x8004, 155
	setvar VAR_SPECIAL_x8005, 3
	callstd 2033
	setvar VAR_SPECIAL_x8004, 151
	setvar VAR_SPECIAL_x8005, 3
	callstd 2033
	msgbox 18
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000243_00000225
	apply_movement 5, scr_seq_00000243_00000378
	wait_movement
	goto scr_seq_00000243_0000022F

scr_seq_00000243_00000225:
	apply_movement 5, scr_seq_00000243_00000380
	wait_movement
scr_seq_00000243_0000022F:
	hide_person 5
	setflag FLAG_UNK_1CF
	clearflag FLAG_UNK_1D0
	releaseall
	end

scr_seq_00000243_0000023F:
	setflag FLAG_UNK_169
	return

scr_seq_00000243_00000245:
	.byte 0x14, 0x00, 0xd9, 0x07, 0x35, 0x00, 0x16, 0x00, 0xb3, 0xff, 0xff
	.byte 0xff
scr_seq_00000243_00000251:
	releaseall
	end

scr_seq_00000243_00000255:
	scrcmd_219
	releaseall
	end

scr_seq_00000243_0000025B:
	closemsg
	releaseall
	end

scr_seq_00000243_00000261:
	play_se SEQ_SE_GS_KI_UGOKU
	apply_movement 4, scr_seq_00000243_0000038C
	wait_movement
	msgbox 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000243_00000296
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000243_0000025B
	end

scr_seq_00000243_00000296:
	scrcmd_190 0
	msgbox 1
	play_se SEQ_SE_GS_ZENIGAME_JOURO
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000243_000002BF
	apply_movement 255, scr_seq_00000243_0000039C
	goto scr_seq_00000243_000002E2

scr_seq_00000243_000002BF:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000243_000002DA
	apply_movement 255, scr_seq_00000243_000003AC
	goto scr_seq_00000243_000002E2

scr_seq_00000243_000002DA:
	apply_movement 255, scr_seq_00000243_000003A4
scr_seq_00000243_000002E2:
	wait_movement
	msgbox 2
	closemsg
	play_se SEQ_SE_GS_KI_UGOKU
	apply_movement 4, scr_seq_00000243_00000394
	wait_movement
	setflag FLAG_UNK_0A4
	scrcmd_589 185, 20, 0
	clearflag FLAG_UNK_0A4
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000243_00000255
	scrcmd_683 16385
	comparevartovalue VAR_TEMP_x4001, 4
	callif eq, scr_seq_00000243_0000023F
	scrcmd_221 16384, 0
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_00000243_00000251
	releaseall
	end

scr_seq_00000243_0000033E:
	.byte 0x00, 0x00
	.byte 0x0c, 0x00, 0x02, 0x00, 0x01, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x3e, 0x00, 0x05, 0x00
	.byte 0x24, 0x00, 0x02, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x0c, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_00000243_00000360:
	.short 12, 3
	.short 3, 1
	.short 254, 0
	.byte 0x3f, 0x00, 0x01, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_00000243_00000378:
	.short 14, 10
	.short 254, 0

scr_seq_00000243_00000380:
	.short 13, 2
	.short 14, 10
	.short 254, 0

scr_seq_00000243_0000038C:
	.short 32, 3
	.short 254, 0

scr_seq_00000243_00000394:
	.short 36, 6
	.short 254, 0

scr_seq_00000243_0000039C:
	.short 30, 4
	.short 254, 0

scr_seq_00000243_000003A4:
	.short 28, 4
	.short 254, 0

scr_seq_00000243_000003AC:
	.short 29, 4
	.short 254, 0

scr_seq_00000243_000003B4:
	.short 13, 1
	.short 254, 0
scr_seq_00000243_000003BC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_529 VAR_SPECIAL_x8002
	scrcmd_480 32780, 32770, 62
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000243_000004E2
	checkflag FLAG_UNK_ABC
	gotoif eq, scr_seq_00000243_000004F6
	comparevartovalue VAR_UNK_4094, 7
	gotoif eq, scr_seq_00000243_00000490
	checkflag FLAG_UNK_0B1
	gotoif eq, scr_seq_00000243_00000472
	scrcmd_484 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, scr_seq_00000243_00000423
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 15
	goto scr_seq_00000243_0000046A

scr_seq_00000243_00000423:
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 12
	setvar VAR_SPECIAL_x8004, 238
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000243_00000486
	callstd 2033
	setflag FLAG_UNK_0B1
	addvar VAR_UNK_4094, 1
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 13
scr_seq_00000243_0000046A:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000243_00000472:
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000243_00000486:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000243_00000490:
	scrcmd_484 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, scr_seq_00000243_000004B3
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 15
	goto scr_seq_00000243_0000046A

scr_seq_00000243_000004B3:
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 40
	scrcmd_193 0, 32770
	scrcmd_440 VAR_SPECIAL_x800C, 42
	scrcmd_481 32770, 62
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setflag FLAG_UNK_ABC
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000243_000004E2:
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 41
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000243_000004F6:
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 43
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000243_0000050A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	hasitem ITEM_SQUIRTBOTTLE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000243_00000530
	msgbox 13
	goto scr_seq_00000243_00000533

scr_seq_00000243_00000530:
	msgbox 14
scr_seq_00000243_00000533:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000243_0000053B:
	.byte 0x00

scr_seq_00000243_0000053C:
	.short 0, 1
	.short 254, 0
scr_seq_00000243_00000544:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	getitemquantity 425, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000243_00000572
	msgbox 3
	setvar VAR_SPECIAL_x8004, 425
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
scr_seq_00000243_00000572:
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000243_0000057D:
	.byte 0x2d, 0x00, 0x05
	.byte 0x32, 0x00, 0x35, 0x00, 0x61, 0x00, 0x02, 0x00, 0x14, 0x00, 0xd9, 0x07, 0x35, 0x00, 0x61, 0x00
	.byte 0x02, 0x00
scr_seq_00000243_00000592:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_1C2
	gotoif eq, scr_seq_00000243_000005AE
	msgbox 7
	goto scr_seq_00000243_000005B1

scr_seq_00000243_000005AE:
	msgbox 8
scr_seq_00000243_000005B1:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000243_000005B9:
	scrcmd_055 9, 1, 15, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000243_000005D0:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 10, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000243_000005E5:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 11, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000243_000005FA:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 12, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
