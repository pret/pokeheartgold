#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0776_T06_01A0 ; 000
	scrdef scr_seq_0776_T06_06C0 ; 001
	scrdef scr_seq_0776_T06_06D3 ; 002
	scrdef scr_seq_0776_T06_06E6 ; 003
	scrdef scr_seq_0776_T06_06F9 ; 004
	scrdef scr_seq_0776_T06_0714 ; 005
	scrdef scr_seq_0776_T06_072B ; 006
	scrdef scr_seq_0776_T06_0740 ; 007
	scrdef scr_seq_0776_T06_0755 ; 008
	scrdef scr_seq_0776_T06_003A ; 009
	scrdef scr_seq_0776_T06_076A ; 010
	scrdef scr_seq_0776_T06_024B ; 011
	scrdef scr_seq_0776_T06_050C ; 012
	scrdef scr_seq_0776_T06_0089 ; 013
	scrdef_end

scr_seq_0776_T06_003A:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0776_T06_004B
	clearflag FLAG_UNK_189
	end

scr_seq_0776_T06_004B:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, scr_seq_0776_T06_0066
	clearflag FLAG_UNK_27E
	goto scr_seq_0776_T06_0081

scr_seq_0776_T06_0066:
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0776_T06_007D
	clearflag FLAG_UNK_27E
	goto scr_seq_0776_T06_0081

scr_seq_0776_T06_007D:
	setflag FLAG_UNK_27E
scr_seq_0776_T06_0081:
	setvar VAR_UNK_4085, 0
	end

scr_seq_0776_T06_0089:
	scrcmd_609
	lockall
	apply_movement 18, scr_seq_0776_T06_016C
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0776_T06_0190
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 16
	closemsg
	apply_movement 18, scr_seq_0776_T06_0180
	wait_movement
	scrcmd_495 VAR_TEMP_x4004
	comparevartovalue VAR_TEMP_x4004, 8
	gotoif eq, scr_seq_0776_T06_0109
	scrcmd_452 380, 1
	npc_msg 17
	closemsg
	scrcmd_464 2
	scrcmd_453
	apply_movement 18, scr_seq_0776_T06_0180
	wait_movement
	npc_msg 19
	closemsg
	apply_movement 18, scr_seq_0776_T06_0180
	wait_movement
	npc_msg 21
	closemsg
	goto scr_seq_0776_T06_013F

scr_seq_0776_T06_0107:
	.byte 0x02, 0x00
scr_seq_0776_T06_0109:
	scrcmd_452 381, 0
	npc_msg 18
	closemsg
	scrcmd_464 3
	scrcmd_453
	apply_movement 18, scr_seq_0776_T06_0180
	wait_movement
	npc_msg 20
	closemsg
	apply_movement 18, scr_seq_0776_T06_0180
	wait_movement
	npc_msg 22
	closemsg
	goto scr_seq_0776_T06_013F

scr_seq_0776_T06_013D:
	.byte 0x02, 0x00
scr_seq_0776_T06_013F:
	apply_movement 18, scr_seq_0776_T06_0180
	wait_movement
	npc_msg 23
	closemsg
	apply_movement 18, scr_seq_0776_T06_0188
	wait_movement
	setvar VAR_UNK_4130, 2
	hide_person 18
	setflag FLAG_UNK_2FD
	releaseall
	end

scr_seq_0776_T06_016A:
	.byte 0x00, 0x00

scr_seq_0776_T06_016C:
	.short 75, 1
	.short 63, 1
	.short 14, 4
	.short 34, 1
	.short 254, 0

scr_seq_0776_T06_0180:
	.short 34, 1
	.short 254, 0

scr_seq_0776_T06_0188:
	.short 15, 10
	.short 254, 0

scr_seq_0776_T06_0190:
	.short 65, 4
	.short 13, 1
	.short 35, 1
	.short 254, 0
scr_seq_0776_T06_01A0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_491 247
	checkflag FLAG_UNK_0F7
	gotoif TRUE, scr_seq_0776_T06_01FF
	comparevartovalue VAR_UNK_4135, 8
	gotoif ge, scr_seq_0776_T06_020A
	comparevartovalue VAR_UNK_4135, 5
	gotoif ge, scr_seq_0776_T06_01F4
	comparevartovalue VAR_UNK_4135, 1
	gotoif ge, scr_seq_0776_T06_01E9
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0776_T06_01E9:
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0776_T06_01F4:
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0776_T06_01FF:
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0776_T06_020A:
	npc_msg 7
	setvar VAR_SPECIAL_x8004, 53
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0776_T06_0241
	callstd std_give_item_verbose
	setflag FLAG_UNK_0F7
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0776_T06_0241:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_0776_T06_024B:
	scrcmd_609
	lockall
	clearflag FLAG_UNK_2A4
	show_person 16
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 1334
	gotoif ne, scr_seq_0776_T06_0270
	goto scr_seq_0776_T06_037F

scr_seq_0776_T06_0270:
	apply_movement 255, scr_seq_0776_T06_040C
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
	gotoif ne, scr_seq_0776_T06_02D5
	apply_movement 255, scr_seq_0776_T06_0460
	apply_movement 16, scr_seq_0776_T06_0490
	apply_movement 15, scr_seq_0776_T06_0414
	goto scr_seq_0776_T06_0318

scr_seq_0776_T06_02D5:
	comparevartovalue VAR_TEMP_x4001, 332
	gotoif ne, scr_seq_0776_T06_0300
	apply_movement 255, scr_seq_0776_T06_0470
	apply_movement 16, scr_seq_0776_T06_04A0
	apply_movement 15, scr_seq_0776_T06_0420
	goto scr_seq_0776_T06_0318

scr_seq_0776_T06_0300:
	apply_movement 255, scr_seq_0776_T06_0480
	apply_movement 16, scr_seq_0776_T06_04B0
	apply_movement 15, scr_seq_0776_T06_042C
scr_seq_0776_T06_0318:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 14
	closemsg
	apply_movement 16, scr_seq_0776_T06_04D0
	wait_movement
	buffer_players_name 0
	npc_msg 15
	closemsg
	apply_movement 16, scr_seq_0776_T06_04E8
	apply_movement 255, scr_seq_0776_T06_04F0
	wait_movement
scr_seq_0776_T06_034D:
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

scr_seq_0776_T06_037F:
	apply_movement 255, scr_seq_0776_T06_040C
	apply_movement 15, scr_seq_0776_T06_0458
	wait_movement
	scrcmd_076 245, 0
	scrcmd_099 15
	scrcmd_523 15, 2, 90, 2, 0
	scrcmd_098 15
	scrcmd_077
	callstd 2042
	apply_movement 15, scr_seq_0776_T06_0438
	apply_movement 16, scr_seq_0776_T06_04C0
	apply_movement 255, scr_seq_0776_T06_04F8
	wait_movement
	apply_movement 16, scr_seq_0776_T06_04E0
	apply_movement 255, scr_seq_0776_T06_0504
	wait_movement
	npc_msg 14
	closemsg
	apply_movement 16, scr_seq_0776_T06_04D8
	wait_movement
	npc_msg 15
	closemsg
	apply_movement 16, scr_seq_0776_T06_04E8
	apply_movement 255, scr_seq_0776_T06_04F0
	wait_movement
	goto scr_seq_0776_T06_034D

scr_seq_0776_T06_0409:
	.byte 0x00, 0x00, 0x00

scr_seq_0776_T06_040C:
	.short 75, 1
	.short 254, 0

scr_seq_0776_T06_0414:
	.short 62, 9
	.short 112, 1
	.short 254, 0

scr_seq_0776_T06_0420:
	.short 62, 11
	.short 112, 1
	.short 254, 0

scr_seq_0776_T06_042C:
	.short 62, 13
	.short 112, 1
	.short 254, 0

scr_seq_0776_T06_0438:
	.short 62, 4
	.short 21, 2
	.short 53, 1
	.short 57, 1
	.short 21, 2
	.short 53, 1
	.short 57, 2
	.short 254, 0

scr_seq_0776_T06_0458:
	.short 35, 1
	.short 254, 0

scr_seq_0776_T06_0460:
	.short 15, 2
	.short 12, 2
	.short 15, 1
	.short 254, 0

scr_seq_0776_T06_0470:
	.short 15, 2
	.short 12, 3
	.short 15, 1
	.short 254, 0

scr_seq_0776_T06_0480:
	.short 15, 2
	.short 12, 4
	.short 15, 1
	.short 254, 0

scr_seq_0776_T06_0490:
	.short 63, 1
	.short 17, 6
	.short 19, 1
	.short 254, 0

scr_seq_0776_T06_04A0:
	.short 62, 3
	.short 17, 6
	.short 19, 1
	.short 254, 0

scr_seq_0776_T06_04B0:
	.short 62, 5
	.short 17, 6
	.short 19, 1
	.short 254, 0

scr_seq_0776_T06_04C0:
	.short 62, 2
	.short 19, 1
	.short 17, 2
	.short 254, 0

scr_seq_0776_T06_04D0:
	.short 1, 1
	.short 254, 0

scr_seq_0776_T06_04D8:
	.short 3, 1
	.short 254, 0

scr_seq_0776_T06_04E0:
	.short 49, 3
	.short 254, 0

scr_seq_0776_T06_04E8:
	.short 12, 8
	.short 254, 0

scr_seq_0776_T06_04F0:
	.short 0, 1
	.short 254, 0

scr_seq_0776_T06_04F8:
	.short 62, 4
	.short 1, 1
	.short 254, 0

scr_seq_0776_T06_0504:
	.short 2, 1
	.short 254, 0
scr_seq_0776_T06_050C:
	scrcmd_609
	lockall
	clearflag FLAG_UNK_2B4
	show_person 17
	apply_movement 255, scr_seq_0776_T06_040C
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
	gotoif ne, scr_seq_0776_T06_057D
	apply_movement 17, scr_seq_0776_T06_0654
	apply_movement 255, scr_seq_0776_T06_0630
	apply_movement 15, scr_seq_0776_T06_0414
	goto scr_seq_0776_T06_05C0

scr_seq_0776_T06_057D:
	comparevartovalue VAR_TEMP_x4000, 1325
	gotoif ne, scr_seq_0776_T06_05A8
	apply_movement 17, scr_seq_0776_T06_0668
	apply_movement 255, scr_seq_0776_T06_063C
	apply_movement 15, scr_seq_0776_T06_0420
	goto scr_seq_0776_T06_05C0

scr_seq_0776_T06_05A8:
	apply_movement 17, scr_seq_0776_T06_067C
	apply_movement 255, scr_seq_0776_T06_0648
	apply_movement 15, scr_seq_0776_T06_042C
scr_seq_0776_T06_05C0:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 14
	closemsg
	apply_movement 17, scr_seq_0776_T06_0690
	apply_movement 255, scr_seq_0776_T06_06A4
	wait_movement
	buffer_players_name 0
	npc_msg 15
	closemsg
	apply_movement 17, scr_seq_0776_T06_0698
	apply_movement 255, scr_seq_0776_T06_06AC
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

scr_seq_0776_T06_062F:
	.byte 0x00

scr_seq_0776_T06_0630:
	.short 13, 4
	.short 15, 2
	.short 254, 0

scr_seq_0776_T06_063C:
	.short 13, 4
	.short 15, 1
	.short 254, 0

scr_seq_0776_T06_0648:
	.short 13, 4
	.short 3, 1
	.short 254, 0

scr_seq_0776_T06_0654:
	.short 63, 1
	.short 19, 7
	.short 16, 3
	.short 19, 1
	.short 254, 0

scr_seq_0776_T06_0668:
	.short 63, 2
	.short 19, 7
	.short 16, 3
	.short 19, 1
	.short 254, 0

scr_seq_0776_T06_067C:
	.short 63, 3
	.short 19, 7
	.short 16, 3
	.short 19, 1
	.short 254, 0

scr_seq_0776_T06_0690:
	.short 0, 1
	.short 254, 0

scr_seq_0776_T06_0698:
	.short 14, 2
	.short 12, 13
	.short 254, 0

scr_seq_0776_T06_06A4:
	.short 1, 1
	.short 254, 0

scr_seq_0776_T06_06AC:
	.short 63, 2
	.short 2, 1
	.short 63, 1
	.short 0, 1
	.short 254, 0
scr_seq_0776_T06_06C0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0776_T06_06D3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0776_T06_06E6:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0776_T06_06F9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 66, 0
	npc_msg 2
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0776_T06_0714:
	scrcmd_055 10, 0, 6, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0776_T06_072B:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 11, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0776_T06_0740:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 12, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0776_T06_0755:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 13, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0776_T06_076A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0776_T06_086F
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0776_T06_0883
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0776_T06_07DB
	apply_movement 255, scr_seq_0776_T06_0898
	goto scr_seq_0776_T06_080E

scr_seq_0776_T06_07DB:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0776_T06_07FE
	apply_movement 255, scr_seq_0776_T06_08B8
	apply_movement 14, scr_seq_0776_T06_08CC
	goto scr_seq_0776_T06_080E

scr_seq_0776_T06_07FE:
	apply_movement 255, scr_seq_0776_T06_08A4
	apply_movement 14, scr_seq_0776_T06_08CC
scr_seq_0776_T06_080E:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0776_T06_0835
	apply_movement 253, scr_seq_0776_T06_08D8
	wait_movement
scr_seq_0776_T06_0835:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 50
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0776_T06_086F:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0776_T06_0883:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0776_T06_0897:
	.byte 0x00

scr_seq_0776_T06_0898:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0776_T06_08A4:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0776_T06_08B8:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0776_T06_08CC:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_0776_T06_08D8:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
	.balign 4, 0
