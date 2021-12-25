#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000010_0000001A ; 000
	scrdef scr_seq_00000010_000007C0 ; 001
	scrdef scr_seq_00000010_00000143 ; 002
	scrdef scr_seq_00000010_000007D5 ; 003
	scrdef scr_seq_00000010_0000087E ; 004
	scrdef scr_seq_00000010_000000A6 ; 005
	scrdef_end

scr_seq_00000010_0000001A:
	setflag FLAG_UNK_298
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_00000010_0000003B
	goto scr_seq_00000010_00000060

scr_seq_00000010_00000035:
	.byte 0x16, 0x00, 0x23, 0x00, 0x00, 0x00
scr_seq_00000010_0000003B:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_00000010_00000054
	goto scr_seq_00000010_0000007D

scr_seq_00000010_0000004E:
	.byte 0x16, 0x00
	.byte 0x0a, 0x00, 0x00, 0x00
scr_seq_00000010_00000054:
	setvar VAR_UNK_40F6, 1
	setflag FLAG_UNK_26E
	end

scr_seq_00000010_00000060:
	scrcmd_379 VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 3
	gotoif eq, scr_seq_00000010_0000009A
	setvar VAR_UNK_40F6, 1
	setflag FLAG_UNK_26E
	end

scr_seq_00000010_0000007D:
	scrcmd_379 VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 4
	gotoif eq, scr_seq_00000010_0000009A
	setvar VAR_UNK_40F6, 1
	setflag FLAG_UNK_26E
	end

scr_seq_00000010_0000009A:
	setvar VAR_UNK_40F6, 0
	clearflag FLAG_UNK_26E
	end

scr_seq_00000010_000000A6:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_00000010_000000C3
	goto scr_seq_00000010_00000113

scr_seq_00000010_000000BD:
	.byte 0x16, 0x00, 0x1f
	.byte 0x00, 0x00, 0x00
scr_seq_00000010_000000C3:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_00000010_000000DC
	goto scr_seq_00000010_0000012A

scr_seq_00000010_000000D6:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_00000010_000000DC:
	goto scr_seq_00000010_000000E2

scr_seq_00000010_000000E2:
	comparevartovalue VAR_UNK_40F6, 1
	gotoif eq, scr_seq_00000010_00000141
	setflag FLAG_UNK_26E
	hide_person 0
	hide_person 1
	hide_person 2
	hide_person 3
	hide_person 4
	hide_person 5
	setvar VAR_UNK_40F6, 1
	end

scr_seq_00000010_00000113:
	scrcmd_379 VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 3
	gotoif eq, scr_seq_00000010_00000141
	goto scr_seq_00000010_000000E2

scr_seq_00000010_0000012A:
	scrcmd_379 VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 4
	gotoif eq, scr_seq_00000010_00000141
	goto scr_seq_00000010_000000E2

scr_seq_00000010_00000141:
	end

scr_seq_00000010_00000143:
	scrcmd_609
	lockall
	clearflag FLAG_UNK_298
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_102 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	apply_movement 241, scr_seq_00000010_00000330
	apply_movement 0, scr_seq_00000010_00000344
	apply_movement 1, scr_seq_00000010_00000350
	apply_movement 2, scr_seq_00000010_0000035C
	apply_movement 3, scr_seq_00000010_00000368
	apply_movement 4, scr_seq_00000010_00000374
	apply_movement 5, scr_seq_00000010_0000037C
	wait_movement
	scrcmd_076 35, 0
	apply_movement 0, scr_seq_00000010_00000384
	apply_movement 1, scr_seq_00000010_00000394
	apply_movement 2, scr_seq_00000010_000003A4
	apply_movement 3, scr_seq_00000010_000003B4
	apply_movement 4, scr_seq_00000010_000003C4
	apply_movement 5, scr_seq_00000010_000003CC
	wait_movement
	scrcmd_076 35, 0
	apply_movement 0, scr_seq_00000010_000003D4
	apply_movement 1, scr_seq_00000010_000003F0
	apply_movement 2, scr_seq_00000010_0000040C
	apply_movement 3, scr_seq_00000010_00000428
	apply_movement 4, scr_seq_00000010_00000444
	apply_movement 5, scr_seq_00000010_00000468
	wait_movement
	scrcmd_076 35, 0
	apply_movement 0, scr_seq_00000010_0000048C
	apply_movement 1, scr_seq_00000010_000004A8
	apply_movement 2, scr_seq_00000010_000004C4
	apply_movement 3, scr_seq_00000010_000004E0
	apply_movement 4, scr_seq_00000010_000004FC
	apply_movement 5, scr_seq_00000010_00000520
	wait_movement
	scrcmd_076 35, 0
	apply_movement 0, scr_seq_00000010_00000544
	apply_movement 1, scr_seq_00000010_00000560
	apply_movement 2, scr_seq_00000010_0000057C
	apply_movement 3, scr_seq_00000010_00000598
	apply_movement 4, scr_seq_00000010_000005B4
	apply_movement 5, scr_seq_00000010_000005D8
	wait_movement
	scrcmd_076 35, 0
	apply_movement 0, scr_seq_00000010_000005FC
	apply_movement 1, scr_seq_00000010_00000614
	apply_movement 2, scr_seq_00000010_00000630
	apply_movement 3, scr_seq_00000010_0000064C
	apply_movement 4, scr_seq_00000010_00000668
	apply_movement 5, scr_seq_00000010_0000068C
	wait_movement
	scrcmd_076 35, 0
	apply_movement 0, scr_seq_00000010_000006B0
	apply_movement 1, scr_seq_00000010_000006D4
	apply_movement 2, scr_seq_00000010_000006F8
	apply_movement 3, scr_seq_00000010_00000720
	apply_movement 4, scr_seq_00000010_00000744
	apply_movement 5, scr_seq_00000010_00000760
	wait_movement
	scrcmd_100 6
	apply_movement 3, scr_seq_00000010_0000077C
	apply_movement 5, scr_seq_00000010_00000798
	wait_movement
	hide_person 0
	hide_person 1
	hide_person 2
	hide_person 3
	hide_person 4
	hide_person 5
	setflag FLAG_UNK_26E
	setvar VAR_UNK_40F6, 1
	setflag FLAG_UNK_AB5
	apply_movement 241, scr_seq_00000010_00000338
	wait_movement
	scrcmd_103
	releaseall
	end

scr_seq_00000010_0000032D:
	.byte 0x00, 0x00, 0x00

scr_seq_00000010_00000330:
	.short 76, 2
	.short 254, 0

scr_seq_00000010_00000338:
	.short 65, 1
	.short 77, 2
	.short 254, 0

scr_seq_00000010_00000344:
	.short 32, 5
	.short 35, 1
	.short 254, 0

scr_seq_00000010_00000350:
	.short 34, 5
	.short 32, 1
	.short 254, 0

scr_seq_00000010_0000035C:
	.short 33, 5
	.short 34, 1
	.short 254, 0

scr_seq_00000010_00000368:
	.short 35, 5
	.short 33, 1
	.short 254, 0

scr_seq_00000010_00000374:
	.short 34, 6
	.short 254, 0

scr_seq_00000010_0000037C:
	.short 35, 6
	.short 254, 0

scr_seq_00000010_00000384:
	.short 35, 6
	.short 15, 1
	.short 59, 1
	.short 254, 0

scr_seq_00000010_00000394:
	.short 32, 6
	.short 12, 1
	.short 56, 1
	.short 254, 0

scr_seq_00000010_000003A4:
	.short 34, 6
	.short 14, 1
	.short 58, 1
	.short 254, 0

scr_seq_00000010_000003B4:
	.short 33, 6
	.short 13, 1
	.short 57, 1
	.short 254, 0

scr_seq_00000010_000003C4:
	.short 34, 8
	.short 254, 0

scr_seq_00000010_000003CC:
	.short 35, 8
	.short 254, 0

scr_seq_00000010_000003D4:
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 12, 4
	.short 56, 1
	.short 254, 0

scr_seq_00000010_000003F0:
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 14, 4
	.short 58, 1
	.short 254, 0

scr_seq_00000010_0000040C:
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 13, 4
	.short 57, 1
	.short 254, 0

scr_seq_00000010_00000428:
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 15, 4
	.short 59, 1
	.short 254, 0

scr_seq_00000010_00000444:
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000010_00000468:
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000010_0000048C:
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 14, 4
	.short 58, 1
	.short 254, 0

scr_seq_00000010_000004A8:
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 13, 4
	.short 57, 1
	.short 254, 0

scr_seq_00000010_000004C4:
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 15, 4
	.short 59, 1
	.short 254, 0

scr_seq_00000010_000004E0:
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 12, 4
	.short 56, 1
	.short 254, 0

scr_seq_00000010_000004FC:
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000010_00000520:
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000010_00000544:
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 13, 4
	.short 57, 1
	.short 254, 0

scr_seq_00000010_00000560:
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 15, 4
	.short 59, 1
	.short 254, 0

scr_seq_00000010_0000057C:
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 12, 4
	.short 56, 1
	.short 254, 0

scr_seq_00000010_00000598:
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 14, 4
	.short 58, 1
	.short 254, 0

scr_seq_00000010_000005B4:
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000010_000005D8:
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000010_000005FC:
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 75, 1
	.short 254, 0

scr_seq_00000010_00000614:
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 12, 2
	.short 56, 1
	.short 254, 0

scr_seq_00000010_00000630:
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 14, 2
	.short 58, 1
	.short 254, 0

scr_seq_00000010_0000064C:
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 13, 2
	.short 57, 1
	.short 254, 0

scr_seq_00000010_00000668:
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000010_0000068C:
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000010_000006B0:
	.short 48, 3
	.short 19, 6
	.short 16, 3
	.short 19, 3
	.short 17, 3
	.short 19, 1
	.short 59, 1
	.short 19, 2
	.short 254, 0

scr_seq_00000010_000006D4:
	.short 33, 1
	.short 75, 1
	.short 17, 1
	.short 19, 3
	.short 17, 2
	.short 19, 1
	.short 59, 1
	.short 19, 2
	.short 254, 0

scr_seq_00000010_000006F8:
	.short 33, 1
	.short 75, 1
	.short 19, 4
	.short 17, 3
	.short 19, 3
	.short 17, 2
	.short 19, 1
	.short 59, 1
	.short 19, 2
	.short 254, 0

scr_seq_00000010_00000720:
	.short 33, 1
	.short 75, 1
	.short 17, 2
	.short 19, 6
	.short 16, 3
	.short 19, 2
	.short 17, 3
	.short 50, 2
	.short 254, 0

scr_seq_00000010_00000744:
	.short 33, 1
	.short 75, 1
	.short 17, 2
	.short 19, 2
	.short 59, 1
	.short 19, 3
	.short 254, 0

scr_seq_00000010_00000760:
	.short 33, 1
	.short 75, 1
	.short 15, 2
	.short 13, 3
	.short 15, 5
	.short 51, 2
	.short 254, 0

scr_seq_00000010_0000077C:
	.short 38, 2
	.short 36, 4
	.short 48, 2
	.short 19, 2
	.short 59, 1
	.short 19, 3
	.short 254, 0

scr_seq_00000010_00000798:
	.short 15, 1
	.short 12, 3
	.short 15, 3
	.short 13, 3
	.short 15, 1
	.short 59, 1
	.short 15, 3
	.short 254, 0
	.byte 0x46, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_00000010_000007C0:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 1, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000010_000007D5:
	setvar VAR_SPECIAL_x8008, 81
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_00000010_000007E9

scr_seq_00000010_000007E7:
	.byte 0x02, 0x00
scr_seq_00000010_000007E9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	wait_se SEQ_SE_DP_SELECT
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x8008
	copyvar VAR_SPECIAL_x8005, VAR_SPECIAL_x8009
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000010_00000825
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000010_00000866
	end

scr_seq_00000010_00000825:
	callstd 2001
	hide_person VAR_SPECIAL_x800D
	giveitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	scrcmd_190 0
	scrcmd_194 1, 32772
	msgbox 2
	wait_fanfare
	scrcmd_190 0
	scrcmd_194 1, 32772
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 2, 32780
	msgbox 3
	waitbutton
	setvar VAR_SPECIAL_x800C, 1
scr_seq_00000010_00000860:
	closemsg
	releaseall
	end

scr_seq_00000010_00000866:
	scrcmd_194 0, 32772
	msgbox 4
	waitbutton
	setvar VAR_SPECIAL_x800C, 0
	goto scr_seq_00000010_00000860

scr_seq_00000010_0000087C:
	.byte 0x02, 0x00
scr_seq_00000010_0000087E:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
