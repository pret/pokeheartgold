#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000776_000001A0 ; 000
	scrdef scr_seq_00000776_000006C0 ; 001
	scrdef scr_seq_00000776_000006D3 ; 002
	scrdef scr_seq_00000776_000006E6 ; 003
	scrdef scr_seq_00000776_000006F9 ; 004
	scrdef scr_seq_00000776_00000714 ; 005
	scrdef scr_seq_00000776_0000072B ; 006
	scrdef scr_seq_00000776_00000740 ; 007
	scrdef scr_seq_00000776_00000755 ; 008
	scrdef scr_seq_00000776_0000003A ; 009
	scrdef scr_seq_00000776_0000076A ; 010
	scrdef scr_seq_00000776_0000024B ; 011
	scrdef scr_seq_00000776_0000050C ; 012
	scrdef scr_seq_00000776_00000089 ; 013
	scrdef_end

scr_seq_00000776_0000003A:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_00000776_0000004B
	clearflag FLAG_UNK_189
	end

scr_seq_00000776_0000004B:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, scr_seq_00000776_00000066
	clearflag FLAG_UNK_27E
	goto scr_seq_00000776_00000081

scr_seq_00000776_00000066:
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_00000776_0000007D
	clearflag FLAG_UNK_27E
	goto scr_seq_00000776_00000081

scr_seq_00000776_0000007D:
	setflag FLAG_UNK_27E
scr_seq_00000776_00000081:
	setvar VAR_UNK_4085, 0
	end

scr_seq_00000776_00000089:
	scrcmd_609
	lockall
	apply_movement 18, scr_seq_00000776_0000016C
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000776_00000190
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	msgbox 16
	closemsg
	apply_movement 18, scr_seq_00000776_00000180
	wait_movement
	scrcmd_495 VAR_TEMP_x4004
	comparevartovalue VAR_TEMP_x4004, 8
	gotoif eq, scr_seq_00000776_00000109
	scrcmd_452 380, 1
	msgbox 17
	closemsg
	scrcmd_464 2
	scrcmd_453
	apply_movement 18, scr_seq_00000776_00000180
	wait_movement
	msgbox 19
	closemsg
	apply_movement 18, scr_seq_00000776_00000180
	wait_movement
	msgbox 21
	closemsg
	goto scr_seq_00000776_0000013F

scr_seq_00000776_00000107:
	.byte 0x02, 0x00
scr_seq_00000776_00000109:
	scrcmd_452 381, 0
	msgbox 18
	closemsg
	scrcmd_464 3
	scrcmd_453
	apply_movement 18, scr_seq_00000776_00000180
	wait_movement
	msgbox 20
	closemsg
	apply_movement 18, scr_seq_00000776_00000180
	wait_movement
	msgbox 22
	closemsg
	goto scr_seq_00000776_0000013F

scr_seq_00000776_0000013D:
	.byte 0x02, 0x00
scr_seq_00000776_0000013F:
	apply_movement 18, scr_seq_00000776_00000180
	wait_movement
	msgbox 23
	closemsg
	apply_movement 18, scr_seq_00000776_00000188
	wait_movement
	setvar VAR_UNK_4130, 2
	hide_person 18
	setflag FLAG_UNK_2FD
	releaseall
	end

scr_seq_00000776_0000016A:
	.byte 0x00, 0x00

scr_seq_00000776_0000016C:
	.short 75, 1
	.short 63, 1
	.short 14, 4
	.short 34, 1
	.short 254, 0

scr_seq_00000776_00000180:
	.short 34, 1
	.short 254, 0

scr_seq_00000776_00000188:
	.short 15, 10
	.short 254, 0

scr_seq_00000776_00000190:
	.short 65, 4
	.short 13, 1
	.short 35, 1
	.short 254, 0
scr_seq_00000776_000001A0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_491 247
	checkflag FLAG_UNK_0F7
	gotoif TRUE, scr_seq_00000776_000001FF
	comparevartovalue VAR_UNK_4135, 8
	gotoif ge, scr_seq_00000776_0000020A
	comparevartovalue VAR_UNK_4135, 5
	gotoif ge, scr_seq_00000776_000001F4
	comparevartovalue VAR_UNK_4135, 1
	gotoif ge, scr_seq_00000776_000001E9
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000776_000001E9:
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000776_000001F4:
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000776_000001FF:
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000776_0000020A:
	msgbox 7
	setvar VAR_SPECIAL_x8004, 53
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000776_00000241
	callstd 2033
	setflag FLAG_UNK_0F7
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000776_00000241:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000776_0000024B:
	scrcmd_609
	lockall
	clearflag FLAG_UNK_2A4
	scrcmd_100 16
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 1334
	gotoif ne, scr_seq_00000776_00000270
	goto scr_seq_00000776_0000037F

scr_seq_00000776_00000270:
	apply_movement 255, scr_seq_00000776_0000040C
	wait_movement
	scrcmd_076 245, 0
	scrcmd_099 15
	scrcmd_523 15, 2, 90, 2, 0
	scrcmd_098 15
	scrcmd_077
	callstd 2042
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 331
	gotoif ne, scr_seq_00000776_000002D5
	apply_movement 255, scr_seq_00000776_00000460
	apply_movement 16, scr_seq_00000776_00000490
	apply_movement 15, scr_seq_00000776_00000414
	goto scr_seq_00000776_00000318

scr_seq_00000776_000002D5:
	comparevartovalue VAR_TEMP_x4001, 332
	gotoif ne, scr_seq_00000776_00000300
	apply_movement 255, scr_seq_00000776_00000470
	apply_movement 16, scr_seq_00000776_000004A0
	apply_movement 15, scr_seq_00000776_00000420
	goto scr_seq_00000776_00000318

scr_seq_00000776_00000300:
	apply_movement 255, scr_seq_00000776_00000480
	apply_movement 16, scr_seq_00000776_000004B0
	apply_movement 15, scr_seq_00000776_0000042C
scr_seq_00000776_00000318:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	msgbox 14
	closemsg
	apply_movement 16, scr_seq_00000776_000004D0
	wait_movement
	buffer_players_name 0
	msgbox 15
	closemsg
	apply_movement 16, scr_seq_00000776_000004E8
	apply_movement 255, scr_seq_00000776_000004F0
	wait_movement
scr_seq_00000776_0000034D:
	callstd 2043
	hide_person 16
	hide_person 15
	setflag FLAG_UNK_2A4
	setflag FLAG_UNK_2B4
	setflag FLAG_UNK_29F
	setvar VAR_UNK_4070, 0
	setvar VAR_UNK_4071, 0
	clearflag FLAG_UNK_2A0
	setvar VAR_UNK_4086, 1
	releaseall
	end

scr_seq_00000776_0000037F:
	apply_movement 255, scr_seq_00000776_0000040C
	apply_movement 15, scr_seq_00000776_00000458
	wait_movement
	scrcmd_076 245, 0
	scrcmd_099 15
	scrcmd_523 15, 2, 90, 2, 0
	scrcmd_098 15
	scrcmd_077
	callstd 2042
	apply_movement 15, scr_seq_00000776_00000438
	apply_movement 16, scr_seq_00000776_000004C0
	apply_movement 255, scr_seq_00000776_000004F8
	wait_movement
	apply_movement 16, scr_seq_00000776_000004E0
	apply_movement 255, scr_seq_00000776_00000504
	wait_movement
	msgbox 14
	closemsg
	apply_movement 16, scr_seq_00000776_000004D8
	wait_movement
	msgbox 15
	closemsg
	apply_movement 16, scr_seq_00000776_000004E8
	apply_movement 255, scr_seq_00000776_000004F0
	wait_movement
	goto scr_seq_00000776_0000034D

scr_seq_00000776_00000409:
	.byte 0x00, 0x00, 0x00

scr_seq_00000776_0000040C:
	.short 75, 1
	.short 254, 0

scr_seq_00000776_00000414:
	.short 62, 9
	.short 112, 1
	.short 254, 0

scr_seq_00000776_00000420:
	.short 62, 11
	.short 112, 1
	.short 254, 0

scr_seq_00000776_0000042C:
	.short 62, 13
	.short 112, 1
	.short 254, 0

scr_seq_00000776_00000438:
	.short 62, 4
	.short 21, 2
	.short 53, 1
	.short 57, 1
	.short 21, 2
	.short 53, 1
	.short 57, 2
	.short 254, 0

scr_seq_00000776_00000458:
	.short 35, 1
	.short 254, 0

scr_seq_00000776_00000460:
	.short 15, 2
	.short 12, 2
	.short 15, 1
	.short 254, 0

scr_seq_00000776_00000470:
	.short 15, 2
	.short 12, 3
	.short 15, 1
	.short 254, 0

scr_seq_00000776_00000480:
	.short 15, 2
	.short 12, 4
	.short 15, 1
	.short 254, 0

scr_seq_00000776_00000490:
	.short 63, 1
	.short 17, 6
	.short 19, 1
	.short 254, 0

scr_seq_00000776_000004A0:
	.short 62, 3
	.short 17, 6
	.short 19, 1
	.short 254, 0

scr_seq_00000776_000004B0:
	.short 62, 5
	.short 17, 6
	.short 19, 1
	.short 254, 0

scr_seq_00000776_000004C0:
	.short 62, 2
	.short 19, 1
	.short 17, 2
	.short 254, 0

scr_seq_00000776_000004D0:
	.short 1, 1
	.short 254, 0

scr_seq_00000776_000004D8:
	.short 3, 1
	.short 254, 0

scr_seq_00000776_000004E0:
	.short 49, 3
	.short 254, 0

scr_seq_00000776_000004E8:
	.short 12, 8
	.short 254, 0

scr_seq_00000776_000004F0:
	.short 0, 1
	.short 254, 0

scr_seq_00000776_000004F8:
	.short 62, 4
	.short 1, 1
	.short 254, 0

scr_seq_00000776_00000504:
	.short 2, 1
	.short 254, 0
scr_seq_00000776_0000050C:
	scrcmd_609
	lockall
	clearflag FLAG_UNK_2B4
	scrcmd_100 17
	apply_movement 255, scr_seq_00000776_0000040C
	wait_movement
	scrcmd_076 245, 0
	scrcmd_099 15
	scrcmd_523 15, 2, 90, 2, 0
	scrcmd_098 15
	scrcmd_077
	callstd 2042
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 1324
	gotoif ne, scr_seq_00000776_0000057D
	apply_movement 17, scr_seq_00000776_00000654
	apply_movement 255, scr_seq_00000776_00000630
	apply_movement 15, scr_seq_00000776_00000414
	goto scr_seq_00000776_000005C0

scr_seq_00000776_0000057D:
	comparevartovalue VAR_TEMP_x4000, 1325
	gotoif ne, scr_seq_00000776_000005A8
	apply_movement 17, scr_seq_00000776_00000668
	apply_movement 255, scr_seq_00000776_0000063C
	apply_movement 15, scr_seq_00000776_00000420
	goto scr_seq_00000776_000005C0

scr_seq_00000776_000005A8:
	apply_movement 17, scr_seq_00000776_0000067C
	apply_movement 255, scr_seq_00000776_00000648
	apply_movement 15, scr_seq_00000776_0000042C
scr_seq_00000776_000005C0:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	msgbox 14
	closemsg
	apply_movement 17, scr_seq_00000776_00000690
	apply_movement 255, scr_seq_00000776_000006A4
	wait_movement
	buffer_players_name 0
	msgbox 15
	closemsg
	apply_movement 17, scr_seq_00000776_00000698
	apply_movement 255, scr_seq_00000776_000006AC
	wait_movement
	callstd 2043
	hide_person 17
	hide_person 15
	setflag FLAG_UNK_2A4
	setflag FLAG_UNK_2B4
	setflag FLAG_UNK_29F
	setvar VAR_UNK_4070, 0
	setvar VAR_UNK_4071, 0
	clearflag FLAG_UNK_2A0
	setvar VAR_UNK_4086, 1
	releaseall
	end

scr_seq_00000776_0000062F:
	.byte 0x00

scr_seq_00000776_00000630:
	.short 13, 4
	.short 15, 2
	.short 254, 0

scr_seq_00000776_0000063C:
	.short 13, 4
	.short 15, 1
	.short 254, 0

scr_seq_00000776_00000648:
	.short 13, 4
	.short 3, 1
	.short 254, 0

scr_seq_00000776_00000654:
	.short 63, 1
	.short 19, 7
	.short 16, 3
	.short 19, 1
	.short 254, 0

scr_seq_00000776_00000668:
	.short 63, 2
	.short 19, 7
	.short 16, 3
	.short 19, 1
	.short 254, 0

scr_seq_00000776_0000067C:
	.short 63, 3
	.short 19, 7
	.short 16, 3
	.short 19, 1
	.short 254, 0

scr_seq_00000776_00000690:
	.short 0, 1
	.short 254, 0

scr_seq_00000776_00000698:
	.short 14, 2
	.short 12, 13
	.short 254, 0

scr_seq_00000776_000006A4:
	.short 1, 1
	.short 254, 0

scr_seq_00000776_000006AC:
	.short 63, 2
	.short 2, 1
	.short 63, 1
	.short 0, 1
	.short 254, 0
scr_seq_00000776_000006C0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000776_000006D3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000776_000006E6:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000776_000006F9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 66, 0
	msgbox 2
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000776_00000714:
	scrcmd_055 10, 0, 6, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000776_0000072B:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 11, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000776_00000740:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 12, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000776_00000755:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 13, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000776_0000076A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000776_0000086F
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000776_00000883
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000776_000007DB
	apply_movement 255, scr_seq_00000776_00000898
	goto scr_seq_00000776_0000080E

scr_seq_00000776_000007DB:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000776_000007FE
	apply_movement 255, scr_seq_00000776_000008B8
	apply_movement 14, scr_seq_00000776_000008CC
	goto scr_seq_00000776_0000080E

scr_seq_00000776_000007FE:
	apply_movement 255, scr_seq_00000776_000008A4
	apply_movement 14, scr_seq_00000776_000008CC
scr_seq_00000776_0000080E:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000776_00000835
	apply_movement 253, scr_seq_00000776_000008D8
	wait_movement
scr_seq_00000776_00000835:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 50
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000776_0000086F:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000776_00000883:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000776_00000897:
	.byte 0x00

scr_seq_00000776_00000898:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000776_000008A4:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000776_000008B8:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000776_000008CC:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000776_000008D8:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
	.balign 4, 0
