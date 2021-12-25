#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000111_0000019C ; 000
	scrdef scr_seq_00000111_00000318 ; 001
	scrdef scr_seq_00000111_0000001A ; 002
	scrdef scr_seq_00000111_0000034E ; 003
	scrdef scr_seq_00000111_00000473 ; 004
	scrdef scr_seq_00000111_00000788 ; 005
	scrdef_end

scr_seq_00000111_0000001A:
	checkflag FLAG_UNK_189
	gotoif lt, scr_seq_00000111_0000002B
	clearflag FLAG_UNK_189
	end

scr_seq_00000111_0000002B:
	comparevartovalue VAR_UNK_40FC, 2
	gotoif ge, scr_seq_00000111_00000047
	comparevartovalue VAR_UNK_40FC, 1
	callif eq, scr_seq_00000111_0000015E
	end

scr_seq_00000111_00000047:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_00000111_00000062
	clearflag FLAG_UNK_20F
	goto scr_seq_00000111_0000007D

scr_seq_00000111_00000062:
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, scr_seq_00000111_00000079
	clearflag FLAG_UNK_20F
	goto scr_seq_00000111_0000007D

scr_seq_00000111_00000079:
	setflag FLAG_UNK_20F
scr_seq_00000111_0000007D:
	scrcmd_147 27, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000111_000000F6
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_00000111_000000AB
	clearflag FLAG_UNK_209
	goto scr_seq_00000111_000000F4

scr_seq_00000111_000000AB:
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_00000111_000000C2
	clearflag FLAG_UNK_209
	goto scr_seq_00000111_000000F4

scr_seq_00000111_000000C2:
	comparevartovalue VAR_TEMP_x4000, 8
	gotoif ne, scr_seq_00000111_000000D9
	clearflag FLAG_UNK_209
	goto scr_seq_00000111_000000F4

scr_seq_00000111_000000D9:
	comparevartovalue VAR_TEMP_x4000, 9
	gotoif ne, scr_seq_00000111_000000F0
	clearflag FLAG_UNK_209
	goto scr_seq_00000111_000000F4

scr_seq_00000111_000000F0:
	setflag FLAG_UNK_209
scr_seq_00000111_000000F4:
	end

scr_seq_00000111_000000F6:
	scrcmd_142 27, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000111_00000158
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 16
	gotoif ne, scr_seq_00000111_00000124
	clearflag FLAG_UNK_209
	goto scr_seq_00000111_00000156

scr_seq_00000111_00000124:
	comparevartovalue VAR_TEMP_x4000, 17
	gotoif ne, scr_seq_00000111_0000013B
	clearflag FLAG_UNK_209
	goto scr_seq_00000111_00000156

scr_seq_00000111_0000013B:
	comparevartovalue VAR_TEMP_x4000, 18
	gotoif ne, scr_seq_00000111_00000152
	clearflag FLAG_UNK_209
	goto scr_seq_00000111_00000156

scr_seq_00000111_00000152:
	setflag FLAG_UNK_209
scr_seq_00000111_00000156:
	end

scr_seq_00000111_00000158:
	setflag FLAG_UNK_209
	end

scr_seq_00000111_0000015E:
	get_starter_choice VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 152
	gotoif ne, scr_seq_00000111_0000017B
	setvar VAR_OBJ_0, 1048
	goto scr_seq_00000111_0000019A

scr_seq_00000111_0000017B:
	comparevartovalue VAR_TEMP_x4000, 155
	gotoif ne, scr_seq_00000111_00000194
	setvar VAR_OBJ_0, 1049
	goto scr_seq_00000111_0000019A

scr_seq_00000111_00000194:
	setvar VAR_OBJ_0, 1047
scr_seq_00000111_0000019A:
	return

scr_seq_00000111_0000019C:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000111_000002C0
	wait_movement
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 26
	gotoif ne, scr_seq_00000111_000001D5
	apply_movement 0, scr_seq_00000111_000002C8
	goto scr_seq_00000111_000001F8

scr_seq_00000111_000001D5:
	comparevartovalue VAR_TEMP_x4000, 27
	gotoif ne, scr_seq_00000111_000001F0
	apply_movement 0, scr_seq_00000111_000002D0
	goto scr_seq_00000111_000001F8

scr_seq_00000111_000001F0:
	apply_movement 0, scr_seq_00000111_000002D8
scr_seq_00000111_000001F8:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	msgbox 0
	msgbox 1
	setvar VAR_SPECIAL_x8004, 386
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000111_000002A7
	callstd 2033
	setflag FLAG_UNK_0DA
	msgbox 3
scr_seq_00000111_00000236:
	msgbox 5
	closemsg
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 26
	gotoif ne, scr_seq_00000111_00000264
	apply_movement 0, scr_seq_00000111_000002E0
	apply_movement 255, scr_seq_00000111_00000310
	goto scr_seq_00000111_00000297

scr_seq_00000111_00000264:
	comparevartovalue VAR_TEMP_x4000, 27
	gotoif ne, scr_seq_00000111_00000287
	apply_movement 0, scr_seq_00000111_000002F0
	apply_movement 255, scr_seq_00000111_00000310
	goto scr_seq_00000111_00000297

scr_seq_00000111_00000287:
	apply_movement 0, scr_seq_00000111_00000300
	apply_movement 255, scr_seq_00000111_00000310
scr_seq_00000111_00000297:
	wait_movement
	hide_person 0
	setvar VAR_UNK_40C4, 2
	releaseall
	end

scr_seq_00000111_000002A7:
	msgbox 4
	closemsg
	goto scr_seq_00000111_00000236

scr_seq_00000111_000002B2:
	.byte 0x02, 0x00, 0x4b, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_00000111_000002C0:
	.short 14, 1
	.short 254, 0

scr_seq_00000111_000002C8:
	.short 15, 1
	.short 254, 0

scr_seq_00000111_000002D0:
	.short 15, 2
	.short 254, 0

scr_seq_00000111_000002D8:
	.short 15, 3
	.short 254, 0

scr_seq_00000111_000002E0:
	.short 12, 1
	.short 15, 3
	.short 12, 7
	.short 254, 0

scr_seq_00000111_000002F0:
	.short 12, 1
	.short 15, 2
	.short 12, 7
	.short 254, 0

scr_seq_00000111_00000300:
	.short 12, 1
	.short 15, 1
	.short 12, 7
	.short 254, 0

scr_seq_00000111_00000310:
	.short 0, 1
	.short 254, 0
scr_seq_00000111_00000318:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0E2
	gotoif eq, scr_seq_00000111_00000340
	scrcmd_190 0
	scrcmd_191 1
	msgbox 7
	waitbutton
	closemsg
	setflag FLAG_UNK_0E2
	releaseall
	end

scr_seq_00000111_00000340:
	scrcmd_191 1
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000111_0000034E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_147 27, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000111_000003FC
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ge, scr_seq_00000111_000003F1
	msgbox 9
scr_seq_00000111_00000379:
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000111_0000039D
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_00000111_000003E0
	end

scr_seq_00000111_0000039D:
	scrcmd_190 0
	msgbox 10
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	scrcmd_146 27
	msgbox 11
	waitbutton
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	setflag FLAG_UNK_209
	hide_person 0
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000111_000003E0:
	setvar VAR_TEMP_x4002, 1
	msgbox 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000111_000003F1:
	msgbox 13
	goto scr_seq_00000111_00000379

scr_seq_00000111_000003FA:
	.byte 0x02, 0x00
scr_seq_00000111_000003FC:
	msgbox 29
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000111_0000045D
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000111_00000468
	msgbox 30
	closemsg
	setflag FLAG_UNK_189
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_615 83
	faceplayer
	lockall
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	clearflag FLAG_UNK_189
	msgbox 31
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000111_0000045D:
	msgbox 32
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000111_00000468:
	msgbox 33
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000111_00000473:
	scrcmd_609
	lockall
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 9, scr_seq_00000111_00000674
	comparevartovalue VAR_TEMP_x4000, 24
	gotoif ne, scr_seq_00000111_000004AA
	apply_movement 255, scr_seq_00000111_00000688
	goto scr_seq_00000111_000004B2

scr_seq_00000111_000004AA:
	apply_movement 255, scr_seq_00000111_00000694
scr_seq_00000111_000004B2:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	callstd 2031
	scrcmd_191 1
	msgbox 14
	closemsg
	show_person_at 11, 28, 0, 34, 1
	show_person_at 12, 28, 0, 33, 1
	callstd 2032
	apply_movement 9, scr_seq_00000111_00000674
	apply_movement 255, scr_seq_00000111_000006A8
	apply_movement 11, scr_seq_00000111_000006E4
	apply_movement 12, scr_seq_00000111_00000704
	apply_movement 253, scr_seq_00000111_000006C8
	wait_movement
	scrcmd_190 0
	scrcmd_132 15, 16
	apply_movement 9, scr_seq_00000111_00000680
	wait_movement
	scrcmd_191 1
	msgbox 17
	msgbox 18
	apply_movement 9, scr_seq_00000111_0000073C
	wait_movement
	scrcmd_190 0
	scrcmd_191 1
	msgbox 19
	scrcmd_132 20, 21
	apply_movement 12, scr_seq_00000111_00000718
	wait_movement
	msgbox 22
	scrcmd_191 1
	msgbox 23
	apply_movement 9, scr_seq_00000111_00000744
	apply_movement 12, scr_seq_00000111_00000758
	apply_movement 255, scr_seq_00000111_00000764
	wait_movement
	scrcmd_190 0
	msgbox 24
	closemsg
	apply_movement 9, scr_seq_00000111_00000770
	apply_movement 255, scr_seq_00000111_00000770
	apply_movement 12, scr_seq_00000111_00000718
	wait_movement
	comparevartovalue VAR_OBJ_0, 1048
	gotoif ne, scr_seq_00000111_000005AC
	scrcmd_562 736, 733, 734, 1
	goto scr_seq_00000111_000005D1

scr_seq_00000111_000005AC:
	comparevartovalue VAR_OBJ_0, 1049
	gotoif ne, scr_seq_00000111_000005C8
	scrcmd_562 737, 733, 734, 1
	goto scr_seq_00000111_000005D1

scr_seq_00000111_000005C8:
	scrcmd_562 735, 733, 734, 1
scr_seq_00000111_000005D1:
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000111_0000066C
	scrcmd_190 0
	scrcmd_132 25, 26
	closemsg
	apply_movement 11, scr_seq_00000111_000006F4
	wait_movement
	hide_person 11
	scrcmd_190 0
	msgbox 27
	closemsg
	apply_movement 12, scr_seq_00000111_00000720
	wait_movement
	hide_person 12
	apply_movement 9, scr_seq_00000111_00000778
	apply_movement 255, scr_seq_00000111_00000780
	wait_movement
	scrcmd_190 0
	scrcmd_191 1
	msgbox 28
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	hide_person 9
	hide_person 10
	wait 20, VAR_SPECIAL_x8004
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	apply_movement 253, scr_seq_00000111_000006DC
	wait_movement
	setvar VAR_UNK_40FC, 2
	setvar VAR_UNK_4119, 1
	releaseall
	end

scr_seq_00000111_0000066C:
	scrcmd_219
	releaseall
	end

scr_seq_00000111_00000672:
	.byte 0x00, 0x00

scr_seq_00000111_00000674:
	.short 0, 1
	.short 75, 1
	.short 254, 0

scr_seq_00000111_00000680:
	.short 75, 1
	.short 254, 0

scr_seq_00000111_00000688:
	.short 65, 2
	.short 13, 2
	.short 254, 0

scr_seq_00000111_00000694:
	.short 65, 1
	.short 13, 1
	.short 14, 1
	.short 13, 1
	.short 254, 0

scr_seq_00000111_000006A8:
	.short 65, 1
	.short 0, 1
	.short 75, 1
	.short 65, 2
	.short 15, 1
	.short 13, 2
	.short 0, 1
	.short 254, 0

scr_seq_00000111_000006C8:
	.short 65, 4
	.short 19, 1
	.short 17, 5
	.short 0, 1
	.short 254, 0

scr_seq_00000111_000006DC:
	.short 12, 1
	.short 254, 0

scr_seq_00000111_000006E4:
	.short 13, 7
	.short 14, 3
	.short 13, 3
	.short 254, 0

scr_seq_00000111_000006F4:
	.short 12, 4
	.short 15, 3
	.short 12, 7
	.short 254, 0

scr_seq_00000111_00000704:
	.short 63, 1
	.short 13, 7
	.short 14, 4
	.short 13, 4
	.short 254, 0

scr_seq_00000111_00000718:
	.short 13, 1
	.short 254, 0

scr_seq_00000111_00000720:
	.short 71, 1
	.short 8, 1
	.short 72, 1
	.short 16, 2
	.short 19, 4
	.short 16, 7
	.short 254, 0

scr_seq_00000111_0000073C:
	.short 36, 2
	.short 254, 0

scr_seq_00000111_00000744:
	.short 20, 1
	.short 63, 1
	.short 13, 1
	.short 35, 1
	.short 254, 0

scr_seq_00000111_00000758:
	.short 71, 1
	.short 20, 2
	.short 254, 0

scr_seq_00000111_00000764:
	.short 65, 2
	.short 34, 1
	.short 254, 0

scr_seq_00000111_00000770:
	.short 32, 1
	.short 254, 0

scr_seq_00000111_00000778:
	.short 3, 1
	.short 254, 0

scr_seq_00000111_00000780:
	.short 2, 1
	.short 254, 0
scr_seq_00000111_00000788:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 6, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
