#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0812_T08R0201_002A ; 000
	scrdef scr_seq_0812_T08R0201_02CC ; 001
	scrdef scr_seq_0812_T08R0201_02A8 ; 002
	scrdef scr_seq_0812_T08R0201_0083 ; 003
	scrdef scr_seq_0812_T08R0201_0403 ; 004
	scrdef scr_seq_0812_T08R0201_044F ; 005
	scrdef scr_seq_0812_T08R0201_0465 ; 006
	scrdef scr_seq_0812_T08R0201_0478 ; 007
	scrdef scr_seq_0812_T08R0201_048B ; 008
	scrdef scr_seq_0812_T08R0201_04A4 ; 009
	scrdef_end

scr_seq_0812_T08R0201_002A:
	checkflag FLAG_UNK_9CD
	gotoif TRUE, scr_seq_0812_T08R0201_003B
	setvar VAR_UNK_4123, 2000
scr_seq_0812_T08R0201_003B:
	clearflag FLAG_UNK_999
	setflag FLAG_UNK_9CD
	comparevartovalue VAR_UNK_4124, 0
	gotoif ne, scr_seq_0812_T08R0201_0052
	end

scr_seq_0812_T08R0201_0052:
	scrcmd_338 6, 8, 9
	scrcmd_341 6, 2
	end

scr_seq_0812_T08R0201_0062:
	comparevartovalue VAR_UNK_4123, 2000
	gotoif eq, scr_seq_0812_T08R0201_0079
	buffer_players_name 1
	scrcmd_198 2, 16675
	return

scr_seq_0812_T08R0201_0079:
	scrcmd_191 1
	scrcmd_198 2, 16675
	return

scr_seq_0812_T08R0201_0083:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_136
	gotoif TRUE, scr_seq_0812_T08R0201_019B
	setflag FLAG_UNK_136
	buffer_players_name 0
	gender_msgbox 0, 1
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0812_T08R0201_00C5
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0812_T08R0201_0190
	end

scr_seq_0812_T08R0201_00C5:
	npc_msg 2
	goto scr_seq_0812_T08R0201_00E9

scr_seq_0812_T08R0201_00CE:
	npc_msg 3
	goto scr_seq_0812_T08R0201_00E9

scr_seq_0812_T08R0201_00D7:
	npc_msg 4
	goto scr_seq_0812_T08R0201_00E9

scr_seq_0812_T08R0201_00E0:
	npc_msg 5
	goto scr_seq_0812_T08R0201_00E9

scr_seq_0812_T08R0201_00E9:
	touchscreen_menu_hide
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 194, 255, 0
	scrcmd_751 195, 255, 1
	scrcmd_751 196, 255, 2
	scrcmd_751 198, 255, 4
	scrcmd_752
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0812_T08R0201_00CE
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0812_T08R0201_00D7
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_0812_T08R0201_00E0
	goto scr_seq_0812_T08R0201_0144

scr_seq_0812_T08R0201_0144:
	npc_msg 6
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0812_T08R0201_0190
scr_seq_0812_T08R0201_015C:
	setvar VAR_SPECIAL_x800C, 0
	count_pc_empty_space VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif lt, scr_seq_0812_T08R0201_0274
	setvar VAR_SPECIAL_x800C, 0
	scrcmd_509 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0812_T08R0201_0260
	goto scr_seq_0812_T08R0201_01FB

scr_seq_0812_T08R0201_0190:
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0812_T08R0201_019B:
	buffer_players_name 0
	gender_msgbox 8, 9
	goto scr_seq_0812_T08R0201_01A8

scr_seq_0812_T08R0201_01A8:
	touchscreen_menu_hide
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 199, 255, 0
	scrcmd_751 200, 255, 1
	scrcmd_751 201, 255, 2
	scrcmd_752
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0812_T08R0201_015C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0812_T08R0201_026B
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_0812_T08R0201_0190
	goto scr_seq_0812_T08R0201_0190

scr_seq_0812_T08R0201_01FB:
	call scr_seq_0812_T08R0201_0062
	buffer_players_name 0
	gender_msgbox 10, 11
	closemsg
	apply_movement 6, scr_seq_0812_T08R0201_0280
	wait_movement
	scrcmd_600
	apply_movement 255, scr_seq_0812_T08R0201_0294
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 109, 0, 24, 47, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	scrcmd_098 253
	scrcmd_606
	apply_movement 253, scr_seq_0812_T08R0201_02A0
	wait_movement
	scrcmd_099 253
	releaseall
	end

scr_seq_0812_T08R0201_0260:
	npc_msg 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0812_T08R0201_026B:
	npc_msg 13
	goto scr_seq_0812_T08R0201_00E9

scr_seq_0812_T08R0201_0274:
	npc_msg 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0812_T08R0201_027F:
	.byte 0x00

scr_seq_0812_T08R0201_0280:
	.short 36, 1
	.short 12, 2
	.short 15, 1
	.short 38, 1
	.short 254, 0

scr_seq_0812_T08R0201_0294:
	.short 12, 5
	.short 69, 1
	.short 254, 0

scr_seq_0812_T08R0201_02A0:
	.short 0, 1
	.short 254, 0
scr_seq_0812_T08R0201_02A8:
	scrcmd_609
	lockall
	setvar VAR_UNK_4124, 0
	apply_movement 255, scr_seq_0812_T08R0201_03D4
	wait_movement
	apply_movement 6, scr_seq_0812_T08R0201_03BC
	wait_movement
	scrcmd_606
	releaseall
	end

scr_seq_0812_T08R0201_02CC:
	scrcmd_609
	lockall
	setvar VAR_UNK_4124, 0
	apply_movement 255, scr_seq_0812_T08R0201_03DC
	apply_movement 6, scr_seq_0812_T08R0201_03C8
	wait_movement
	scrcmd_511 0, 32780
	scrcmd_198 0, 32780
	scrcmd_511 1, 32780
	scrcmd_198 1, 32780
	scrcmd_511 2, 32780
	scrcmd_198 2, 32780
	scrcmd_511 3, 32780
	scrcmd_198 3, 32780
	npc_msg 16
	scrcmd_511 3, 32780
	comparevartovar VAR_SPECIAL_x800C, VAR_UNK_4123
	gotoif gt, scr_seq_0812_T08R0201_0339
	npc_msg 18
	call scr_seq_0812_T08R0201_0669
	goto scr_seq_0812_T08R0201_034E

scr_seq_0812_T08R0201_0339:
	npc_msg 17
	call scr_seq_0812_T08R0201_0669
	scrcmd_511 3, 16675
	goto scr_seq_0812_T08R0201_034E

scr_seq_0812_T08R0201_034E:
	npc_msg 19
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0812_T08R0201_0391
	npc_msg 24
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0812_T08R0201_0384
	goto scr_seq_0812_T08R0201_034E

scr_seq_0812_T08R0201_0384:
	npc_msg 21
	scrcmd_049
	closemsg
	goto scr_seq_0812_T08R0201_03A1

scr_seq_0812_T08R0201_0391:
	scrcmd_510
	npc_msg 20
	npc_msg 22
	closemsg
	goto scr_seq_0812_T08R0201_03A1

scr_seq_0812_T08R0201_03A1:
	apply_movement 255, scr_seq_0812_T08R0201_03E8
	wait_movement
	apply_movement 6, scr_seq_0812_T08R0201_03BC
	wait_movement
	scrcmd_606
	releaseall
	end

scr_seq_0812_T08R0201_03BB:
	.byte 0x00

scr_seq_0812_T08R0201_03BC:
	.short 14, 1
	.short 13, 2
	.short 254, 0

scr_seq_0812_T08R0201_03C8:
	.short 63, 2
	.short 34, 1
	.short 254, 0

scr_seq_0812_T08R0201_03D4:
	.short 13, 5
	.short 254, 0

scr_seq_0812_T08R0201_03DC:
	.short 13, 2
	.short 39, 1
	.short 254, 0

scr_seq_0812_T08R0201_03E8:
	.short 13, 4
	.short 254, 0
	.byte 0x49, 0x00, 0xdc, 0x05, 0x60, 0x00, 0x68, 0x00, 0x2d, 0x00, 0x19, 0x32, 0x00, 0x35, 0x00, 0x61
	.byte 0x00, 0x02, 0x00
scr_seq_0812_T08R0201_0403:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	buffer_players_name 0
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_0812_T08R0201_0444
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0812_T08R0201_0439
	goto scr_seq_0812_T08R0201_042E

scr_seq_0812_T08R0201_042E:
	npc_msg 41
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0812_T08R0201_0439:
	npc_msg 42
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0812_T08R0201_0444:
	npc_msg 43
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0812_T08R0201_044F:
	buffer_players_name 0
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 44
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0812_T08R0201_0465:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 45
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0812_T08R0201_0478:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 33
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0812_T08R0201_048B:
	call scr_seq_0812_T08R0201_0062
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 25
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0812_T08R0201_04A4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_TEMP_x4009, 1
	gotoif eq, scr_seq_0812_T08R0201_0511
	scrcmd_528 32780
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, scr_seq_0812_T08R0201_051C
	comparevartovalue VAR_SPECIAL_x800C, 5
	gotoif eq, scr_seq_0812_T08R0201_055D
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0812_T08R0201_059E
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_0812_T08R0201_05D7
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_0812_T08R0201_0610
	goto scr_seq_0812_T08R0201_0506

scr_seq_0812_T08R0201_0504:
	.byte 0x02, 0x00
scr_seq_0812_T08R0201_0506:
	npc_msg 34
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0812_T08R0201_0511:
	npc_msg 40
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0812_T08R0201_051C:
	hasitem ITEM_FASHION_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0812_T08R0201_0506
	setvar VAR_SPECIAL_x8004, 97
	setvar VAR_SPECIAL_x8005, 1
	scrcmd_404 32772, 32773, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0812_T08R0201_0506
	npc_msg 35
	goto scr_seq_0812_T08R0201_0649

scr_seq_0812_T08R0201_055B:
	.byte 0x02, 0x00
scr_seq_0812_T08R0201_055D:
	hasitem ITEM_FASHION_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0812_T08R0201_0506
	setvar VAR_SPECIAL_x8004, 98
	setvar VAR_SPECIAL_x8005, 1
	scrcmd_404 32772, 32773, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0812_T08R0201_0506
	npc_msg 36
	goto scr_seq_0812_T08R0201_0649

scr_seq_0812_T08R0201_059C:
	.byte 0x02, 0x00
scr_seq_0812_T08R0201_059E:
	hasitem ITEM_FASHION_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0812_T08R0201_0506
	setvar VAR_SPECIAL_x8004, 14
	scrcmd_407 32772, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0812_T08R0201_0506
	npc_msg 37
	goto scr_seq_0812_T08R0201_0659

scr_seq_0812_T08R0201_05D5:
	.byte 0x02, 0x00
scr_seq_0812_T08R0201_05D7:
	hasitem ITEM_FASHION_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0812_T08R0201_0506
	setvar VAR_SPECIAL_x8004, 15
	scrcmd_407 32772, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0812_T08R0201_0506
	npc_msg 38
	goto scr_seq_0812_T08R0201_0659

scr_seq_0812_T08R0201_060E:
	.byte 0x02, 0x00
scr_seq_0812_T08R0201_0610:
	hasitem ITEM_FASHION_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0812_T08R0201_0506
	setvar VAR_SPECIAL_x8004, 16
	scrcmd_407 32772, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0812_T08R0201_0506
	npc_msg 39
	goto scr_seq_0812_T08R0201_0659

scr_seq_0812_T08R0201_0647:
	.byte 0x02, 0x00
scr_seq_0812_T08R0201_0649:
	callstd 2007
	setvar VAR_TEMP_x4009, 1
	closemsg
	releaseall
	end

scr_seq_0812_T08R0201_0659:
	callstd 2026
	setvar VAR_TEMP_x4009, 1
	closemsg
	releaseall
	end

scr_seq_0812_T08R0201_0669:
	scrcmd_511 3, 32780
	comparevartovalue VAR_SPECIAL_x800C, 3000
	callif lt, scr_seq_0812_T08R0201_06A5
	comparevartovalue VAR_SPECIAL_x800C, 3300
	callif lt, scr_seq_0812_T08R0201_071B
	comparevartovalue VAR_SPECIAL_x800C, 3500
	callif lt, scr_seq_0812_T08R0201_076A
	comparevartovalue VAR_SPECIAL_x800C, 10000
	callif lt, scr_seq_0812_T08R0201_07D3
	return

scr_seq_0812_T08R0201_06A5:
	scrcmd_380 32774, 8
	comparevartovalue VAR_SPECIAL_x8006, 0
	callif eq, scr_seq_0812_T08R0201_0861
	comparevartovalue VAR_SPECIAL_x8006, 1
	callif eq, scr_seq_0812_T08R0201_0869
	comparevartovalue VAR_SPECIAL_x8006, 2
	callif eq, scr_seq_0812_T08R0201_0871
	comparevartovalue VAR_SPECIAL_x8006, 3
	callif eq, scr_seq_0812_T08R0201_0879
	comparevartovalue VAR_SPECIAL_x8006, 4
	callif eq, scr_seq_0812_T08R0201_0881
	comparevartovalue VAR_SPECIAL_x8006, 5
	callif eq, scr_seq_0812_T08R0201_0889
	comparevartovalue VAR_SPECIAL_x8006, 6
	callif eq, scr_seq_0812_T08R0201_0891
	comparevartovalue VAR_SPECIAL_x8006, 7
	callif eq, scr_seq_0812_T08R0201_0899
	call scr_seq_0812_T08R0201_082F
	return

scr_seq_0812_T08R0201_071B:
	scrcmd_380 32774, 5
	comparevartovalue VAR_SPECIAL_x8006, 0
	callif eq, scr_seq_0812_T08R0201_08A1
	comparevartovalue VAR_SPECIAL_x8006, 1
	callif eq, scr_seq_0812_T08R0201_08A9
	comparevartovalue VAR_SPECIAL_x8006, 2
	callif eq, scr_seq_0812_T08R0201_08B1
	comparevartovalue VAR_SPECIAL_x8006, 3
	callif eq, scr_seq_0812_T08R0201_08B9
	comparevartovalue VAR_SPECIAL_x8006, 4
	callif eq, scr_seq_0812_T08R0201_08C1
	call scr_seq_0812_T08R0201_082F
	return

scr_seq_0812_T08R0201_076A:
	scrcmd_380 32774, 7
	comparevartovalue VAR_SPECIAL_x8006, 0
	callif eq, scr_seq_0812_T08R0201_08C9
	comparevartovalue VAR_SPECIAL_x8006, 1
	callif eq, scr_seq_0812_T08R0201_08D1
	comparevartovalue VAR_SPECIAL_x8006, 2
	callif eq, scr_seq_0812_T08R0201_08D9
	comparevartovalue VAR_SPECIAL_x8006, 3
	callif eq, scr_seq_0812_T08R0201_08E1
	comparevartovalue VAR_SPECIAL_x8006, 4
	callif eq, scr_seq_0812_T08R0201_08E9
	comparevartovalue VAR_SPECIAL_x8006, 5
	callif eq, scr_seq_0812_T08R0201_08F1
	comparevartovalue VAR_SPECIAL_x8006, 6
	callif eq, scr_seq_0812_T08R0201_08F9
	call scr_seq_0812_T08R0201_082F
	return

scr_seq_0812_T08R0201_07D3:
	scrcmd_380 32774, 6
	comparevartovalue VAR_SPECIAL_x8006, 0
	callif eq, scr_seq_0812_T08R0201_0901
	comparevartovalue VAR_SPECIAL_x8006, 1
	callif eq, scr_seq_0812_T08R0201_0909
	comparevartovalue VAR_SPECIAL_x8006, 2
	callif eq, scr_seq_0812_T08R0201_0911
	comparevartovalue VAR_SPECIAL_x8006, 3
	callif eq, scr_seq_0812_T08R0201_0919
	comparevartovalue VAR_SPECIAL_x8006, 4
	callif eq, scr_seq_0812_T08R0201_0921
	comparevartovalue VAR_SPECIAL_x8006, 5
	callif eq, scr_seq_0812_T08R0201_0929
	call scr_seq_0812_T08R0201_082F
	return

scr_seq_0812_T08R0201_082F:
	hasspaceforitem VAR_SPECIAL_x8006, 1, VAR_SPECIAL_x8007
	comparevartovalue VAR_SPECIAL_x8007, 0
	callif ne, scr_seq_0812_T08R0201_084C
	setvar VAR_SPECIAL_x800C, 10000
	return

scr_seq_0812_T08R0201_084C:
	npc_msg 23
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x8006
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	return

scr_seq_0812_T08R0201_0861:
	setvar VAR_SPECIAL_x8006, 149
	return

scr_seq_0812_T08R0201_0869:
	setvar VAR_SPECIAL_x8006, 150
	return

scr_seq_0812_T08R0201_0871:
	setvar VAR_SPECIAL_x8006, 151
	return

scr_seq_0812_T08R0201_0879:
	setvar VAR_SPECIAL_x8006, 152
	return

scr_seq_0812_T08R0201_0881:
	setvar VAR_SPECIAL_x8006, 153
	return

scr_seq_0812_T08R0201_0889:
	setvar VAR_SPECIAL_x8006, 154
	return

scr_seq_0812_T08R0201_0891:
	setvar VAR_SPECIAL_x8006, 155
	return

scr_seq_0812_T08R0201_0899:
	setvar VAR_SPECIAL_x8006, 156
	return

scr_seq_0812_T08R0201_08A1:
	setvar VAR_SPECIAL_x8006, 159
	return

scr_seq_0812_T08R0201_08A9:
	setvar VAR_SPECIAL_x8006, 160
	return

scr_seq_0812_T08R0201_08B1:
	setvar VAR_SPECIAL_x8006, 161
	return

scr_seq_0812_T08R0201_08B9:
	setvar VAR_SPECIAL_x8006, 162
	return

scr_seq_0812_T08R0201_08C1:
	setvar VAR_SPECIAL_x8006, 163
	return

scr_seq_0812_T08R0201_08C9:
	setvar VAR_SPECIAL_x8006, 164
	return

scr_seq_0812_T08R0201_08D1:
	setvar VAR_SPECIAL_x8006, 165
	return

scr_seq_0812_T08R0201_08D9:
	setvar VAR_SPECIAL_x8006, 166
	return

scr_seq_0812_T08R0201_08E1:
	setvar VAR_SPECIAL_x8006, 167
	return

scr_seq_0812_T08R0201_08E9:
	setvar VAR_SPECIAL_x8006, 168
	return

scr_seq_0812_T08R0201_08F1:
	setvar VAR_SPECIAL_x8006, 157
	return

scr_seq_0812_T08R0201_08F9:
	setvar VAR_SPECIAL_x8006, 158
	return

scr_seq_0812_T08R0201_0901:
	setvar VAR_SPECIAL_x8006, 169
	return

scr_seq_0812_T08R0201_0909:
	setvar VAR_SPECIAL_x8006, 170
	return

scr_seq_0812_T08R0201_0911:
	setvar VAR_SPECIAL_x8006, 171
	return

scr_seq_0812_T08R0201_0919:
	setvar VAR_SPECIAL_x8006, 172
	return

scr_seq_0812_T08R0201_0921:
	setvar VAR_SPECIAL_x8006, 173
	return

scr_seq_0812_T08R0201_0929:
	setvar VAR_SPECIAL_x8006, 174
	return
	.balign 4, 0
