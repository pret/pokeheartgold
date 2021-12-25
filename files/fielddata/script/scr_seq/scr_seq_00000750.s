#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000750_0000007B ; 000
	scrdef scr_seq_00000750_00000290 ; 001
	scrdef scr_seq_00000750_000002A3 ; 002
	scrdef scr_seq_00000750_000002B6 ; 003
	scrdef scr_seq_00000750_000002CD ; 004
	scrdef scr_seq_00000750_000002E2 ; 005
	scrdef scr_seq_00000750_000002F7 ; 006
	scrdef scr_seq_00000750_00000113 ; 007
	scrdef scr_seq_00000750_0000003A ; 008
	scrdef scr_seq_00000750_00000653 ; 009
	scrdef scr_seq_00000750_00000488 ; 010
	scrdef scr_seq_00000750_00000362 ; 011
	scrdef scr_seq_00000750_000003B5 ; 012
	scrdef scr_seq_00000750_0000037F ; 013
	scrdef_end

scr_seq_00000750_0000003A:
	checkflag FLAG_UNK_189
	gotoif lt, scr_seq_00000750_0000004B
	clearflag FLAG_UNK_189
	end

scr_seq_00000750_0000004B:
	goto scr_seq_00000750_0000030E

scr_seq_00000750_00000051:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, scr_seq_00000750_00000075
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif eq, scr_seq_00000750_00000075
	setflag FLAG_UNK_27E
	end

scr_seq_00000750_00000075:
	clearflag FLAG_UNK_27E
	end

scr_seq_00000750_0000007B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_00000750_000000A5
	checkflag FLAG_UNK_094
	gotoif eq, scr_seq_00000750_00000108
	goto scr_seq_00000750_000000B0

scr_seq_00000750_000000A5:
	checkflag FLAG_UNK_093
	gotoif eq, scr_seq_00000750_00000108
scr_seq_00000750_000000B0:
	msgbox 2
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_00000750_000000E6
	setvar VAR_SPECIAL_x8004, 482
	setvar VAR_SPECIAL_x8005, 1
	callstd 2008
	setflag FLAG_UNK_094
	clearflag FLAG_UNK_243
	setflag FLAG_UNK_245
	goto scr_seq_00000750_00000102

scr_seq_00000750_000000E6:
	setvar VAR_SPECIAL_x8004, 483
	setvar VAR_SPECIAL_x8005, 1
	callstd 2008
	setflag FLAG_UNK_093
	clearflag FLAG_UNK_242
	setflag FLAG_UNK_244
scr_seq_00000750_00000102:
	closemsg
	releaseall
	end

scr_seq_00000750_00000108:
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000750_00000113:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000750_00000218
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000750_0000022C
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000750_00000184
	apply_movement 255, scr_seq_00000750_00000240
	goto scr_seq_00000750_000001B7

scr_seq_00000750_00000184:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000750_000001A7
	apply_movement 255, scr_seq_00000750_00000260
	apply_movement 7, scr_seq_00000750_00000274
	goto scr_seq_00000750_000001B7

scr_seq_00000750_000001A7:
	apply_movement 255, scr_seq_00000750_0000024C
	apply_movement 7, scr_seq_00000750_00000274
scr_seq_00000750_000001B7:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000750_000001DE
	apply_movement 253, scr_seq_00000750_00000280
	wait_movement
scr_seq_00000750_000001DE:
	setflag FLAG_UNK_189
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_615 66
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

scr_seq_00000750_00000218:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000750_0000022C:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end


scr_seq_00000750_00000240:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000750_0000024C:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000750_00000260:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000750_00000274:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000750_00000280:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_00000750_00000290:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000750_000002A3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000750_000002B6:
	scrcmd_055 20, 0, 3, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000750_000002CD:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 21, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000750_000002E2:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 22, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000750_000002F7:
	scrcmd_055 23, 2, 0, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000750_0000030E:
	comparevartovalue VAR_UNK_4083, 4
	gotoif eq, scr_seq_00000750_00000341
	comparevartovalue VAR_UNK_4083, 2
	gotoif eq, scr_seq_00000750_0000033D
	comparevartovalue VAR_UNK_4083, 3
	gotoif eq, scr_seq_00000750_0000033D
	goto scr_seq_00000750_00000051

scr_seq_00000750_0000033B:
	.byte 0x02, 0x00
scr_seq_00000750_0000033D:
	clearflag FLAG_UNK_30C
scr_seq_00000750_00000341:
	scrcmd_495 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_00000750_0000035C
	clearflag FLAG_UNK_30D
	goto scr_seq_00000750_00000360

scr_seq_00000750_0000035C:
	clearflag FLAG_UNK_312
scr_seq_00000750_00000360:
	end

scr_seq_00000750_00000362:
	comparevartovalue VAR_UNK_4083, 2
	gotoif eq, scr_seq_00000750_00000371
	end

scr_seq_00000750_00000371:
	show_person_at 8, 1047, 6, 81, 2
	end

scr_seq_00000750_0000037F:
	checkflag FLAG_UNK_0A4
	gotoif eq, scr_seq_00000750_0000038C
	end

scr_seq_00000750_0000038C:
	scrcmd_495 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_00000750_000003AB
	setflag FLAG_UNK_30D
	hide_person 9
	goto scr_seq_00000750_000003B3

scr_seq_00000750_000003AB:
	setflag FLAG_UNK_312
	hide_person 10
scr_seq_00000750_000003B3:
	end

scr_seq_00000750_000003B5:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000750_00000440
	wait_movement
	apply_movement 8, scr_seq_00000750_0000045C
	wait_movement
	scrcmd_495 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_00000750_000003F1
	msgbox 6
	goto scr_seq_00000750_000003F4

scr_seq_00000750_000003F1:
	msgbox 7
scr_seq_00000750_000003F4:
	closemsg
	apply_movement 8, scr_seq_00000750_00000464
	apply_movement 255, scr_seq_00000750_00000464
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_495 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_00000750_0000042C
	msgbox 8
	goto scr_seq_00000750_0000042F

scr_seq_00000750_0000042C:
	msgbox 9
scr_seq_00000750_0000042F:
	waitbutton
	closemsg
	setvar VAR_UNK_4083, 3
	releaseall
	end

scr_seq_00000750_0000043D:
	.byte 0x00, 0x00, 0x00

scr_seq_00000750_00000440:
	.short 13, 4
	.short 2, 1
	.short 254, 0

scr_seq_00000750_0000044C:
	.short 63, 1
	.short 15, 2
	.short 63, 1
	.short 254, 0

scr_seq_00000750_0000045C:
	.short 33, 1
	.short 254, 0

scr_seq_00000750_00000464:
	.short 14, 3
	.short 254, 0

scr_seq_00000750_0000046C:
	.short 13, 2
	.short 14, 1
	.short 254, 0

scr_seq_00000750_00000478:
	.short 34, 1
	.short 254, 0

scr_seq_00000750_00000480:
	.short 15, 8
	.short 254, 0
scr_seq_00000750_00000488:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_546 0, 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_00000750_00000649
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_00000750_000004C8
	setvar VAR_TEMP_x400A, 381
	scrcmd_076 16394, 0
	msgbox 10
	goto scr_seq_00000750_000004D7

scr_seq_00000750_000004C8:
	setvar VAR_TEMP_x400A, 380
	scrcmd_076 16394, 0
	msgbox 11
scr_seq_00000750_000004D7:
	scrcmd_077
	closemsg
	setflag FLAG_UNK_0A4
	scrcmd_589 16394, 40, 0
	clearflag FLAG_UNK_0A4
	scrcmd_683 16384
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, scr_seq_00000750_0000057B
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, scr_seq_00000750_0000057B
	scrcmd_588 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000750_00000526
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000750_0000055A
scr_seq_00000750_00000526:
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_00000750_00000540
	msgbox 12
	goto scr_seq_00000750_00000543

scr_seq_00000750_00000540:
	msgbox 13
scr_seq_00000750_00000543:
	closemsg
	comparevartovalue VAR_UNK_4083, 4
	gotoif eq, scr_seq_00000750_00000649
	goto scr_seq_00000750_00000585

scr_seq_00000750_00000558:
	.byte 0x02, 0x00
scr_seq_00000750_0000055A:
	copyvar VAR_TEMP_x4009, VAR_UNK_4083
	setvar VAR_UNK_4083, 5
	comparevartovalue VAR_TEMP_x4009, 4
	gotoif eq, scr_seq_00000750_00000649
	goto scr_seq_00000750_00000585

scr_seq_00000750_00000579:
	.byte 0x02, 0x00
scr_seq_00000750_0000057B:
	scrcmd_219
	goto scr_seq_00000750_00000649

scr_seq_00000750_00000583:
	.byte 0x02, 0x00
scr_seq_00000750_00000585:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 8, scr_seq_00000750_0000046C
	apply_movement 255, scr_seq_00000750_0000044C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, scr_seq_00000750_0000060C
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_00000750_000005D2
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, scr_seq_00000750_000005FF
scr_seq_00000750_000005D2:
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_00000750_000005EC
	msgbox 16
	goto scr_seq_00000750_000005EF

scr_seq_00000750_000005EC:
	msgbox 17
scr_seq_00000750_000005EF:
	closemsg
	setvar VAR_UNK_4083, 4
	goto scr_seq_00000750_0000061F

scr_seq_00000750_000005FD:
	.byte 0x02, 0x00
scr_seq_00000750_000005FF:
	msgbox 14
	closemsg
	goto scr_seq_00000750_0000061F

scr_seq_00000750_0000060A:
	.byte 0x02, 0x00
scr_seq_00000750_0000060C:
	msgbox 18
	closemsg
	setvar VAR_UNK_4083, 4
	goto scr_seq_00000750_0000061F

scr_seq_00000750_0000061D:
	.byte 0x02, 0x00
scr_seq_00000750_0000061F:
	apply_movement 8, scr_seq_00000750_00000478
	wait_movement
	msgbox 15
	closemsg
	apply_movement 8, scr_seq_00000750_00000480
	wait_movement
	hide_person 8
	comparevartovalue VAR_UNK_4130, 4
	callif eq, scr_seq_00000750_0000064D
scr_seq_00000750_00000649:
	releaseall
	end

scr_seq_00000750_0000064D:
	clearflag FLAG_UNK_317
	return

scr_seq_00000750_00000653:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 19
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
