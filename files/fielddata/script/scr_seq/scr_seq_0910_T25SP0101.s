#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0910_T25SP0101_0016 ; 000
	scrdef scr_seq_0910_T25SP0101_0098 ; 001
	scrdef scr_seq_0910_T25SP0101_011B ; 002
	scrdef scr_seq_0910_T25SP0101_01D4 ; 003
	scrdef scr_seq_0910_T25SP0101_08B0 ; 004
	scrdef_end

scr_seq_0910_T25SP0101_0016:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	hasitem ITEM_COIN_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0910_T25SP0101_006A
	apply_movement 0, scr_seq_0910_T25SP0101_0080
	wait_movement
	npc_msg 40
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_780 0, 0
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	setvar VAR_TEMP_x4001, 2
	releaseall
	end

scr_seq_0910_T25SP0101_006A:
	npc_msg 38
	apply_movement 0, scr_seq_0910_T25SP0101_0080
	wait_movement
	npc_msg 39
	goto scr_seq_0910_T25SP0101_00E8


scr_seq_0910_T25SP0101_0080:
	step 1, 1
	step_end

scr_seq_0910_T25SP0101_0088:
	step 2, 1
	step_end

scr_seq_0910_T25SP0101_0090:
	step 3, 1
	step_end
scr_seq_0910_T25SP0101_0098:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_386 VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ne, scr_seq_0910_T25SP0101_00BD
	call scr_seq_0910_T25SP0101_00F0
	goto scr_seq_0910_T25SP0101_00C5

scr_seq_0910_T25SP0101_00BD:
	apply_movement 0, scr_seq_0910_T25SP0101_0080
scr_seq_0910_T25SP0101_00C5:
	wait_movement
	hasitem ITEM_COIN_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0910_T25SP0101_00E5
	npc_msg 41
	goto scr_seq_0910_T25SP0101_00E8

scr_seq_0910_T25SP0101_00E5:
	npc_msg 39
scr_seq_0910_T25SP0101_00E8:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0910_T25SP0101_00F0:
	get_player_coords VAR_TEMP_x4002, VAR_TEMP_x4003
	comparevartovalue VAR_TEMP_x4002, 6
	gotoif ne, scr_seq_0910_T25SP0101_0111
	apply_movement 0, scr_seq_0910_T25SP0101_0088
	goto scr_seq_0910_T25SP0101_0119

scr_seq_0910_T25SP0101_0111:
	apply_movement 0, scr_seq_0910_T25SP0101_0090
scr_seq_0910_T25SP0101_0119:
	return

scr_seq_0910_T25SP0101_011B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	hasitem ITEM_COIN_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0910_T25SP0101_0175
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0910_T25SP0101_0154
	npc_msg 34
	setvar VAR_TEMP_x4001, 1
	goto scr_seq_0910_T25SP0101_016D

scr_seq_0910_T25SP0101_0154:
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif ne, scr_seq_0910_T25SP0101_016A
	npc_msg 35
	goto scr_seq_0910_T25SP0101_016D

scr_seq_0910_T25SP0101_016A:
	npc_msg 36
scr_seq_0910_T25SP0101_016D:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0910_T25SP0101_0175:
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0910_T25SP0101_018B
	npc_msg 28
	goto scr_seq_0910_T25SP0101_018E

scr_seq_0910_T25SP0101_018B:
	npc_msg 37
scr_seq_0910_T25SP0101_018E:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0910_T25SP0101_01C5
	npc_msg 31
	setvar VAR_TEMP_x4001, 1
	setvar VAR_SPECIAL_x8004, 444
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	npc_msg 32
	goto scr_seq_0910_T25SP0101_00E8

scr_seq_0910_T25SP0101_01C5:
	setvar VAR_TEMP_x4001, 1
	npc_msg 33
	goto scr_seq_0910_T25SP0101_00E8

scr_seq_0910_T25SP0101_01D4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_784 3, 0
	npc_msg 0
	touchscreen_menu_hide
	scrcmd_116 0, 20, 2
scr_seq_0910_T25SP0101_01EC:
	menu_init 1, 1, 0, 1, VAR_TEMP_x4000
	menu_item_add 12, 255, 0
	menu_item_add 13, 255, 1
	menu_item_add 11, 255, 2
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0910_T25SP0101_0234
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0910_T25SP0101_02D0
	goto scr_seq_0910_T25SP0101_0C17

scr_seq_0910_T25SP0101_0234:
	menu_init 1, 1, 0, 1, VAR_TEMP_x4000
	menu_item_add 14, 255, 0
	menu_item_add 15, 255, 1
	menu_item_add 16, 255, 2
	menu_item_add 17, 255, 3
	menu_item_add 18, 255, 4
	menu_item_add 19, 255, 5
	menu_item_add 11, 255, 6
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0910_T25SP0101_0342
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0910_T25SP0101_03CD
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0910_T25SP0101_0458
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0910_T25SP0101_04E3
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0910_T25SP0101_056E
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0910_T25SP0101_05F9
	goto scr_seq_0910_T25SP0101_01EC

scr_seq_0910_T25SP0101_02D0:
	menu_init 1, 1, 0, 1, VAR_TEMP_x4000
	menu_item_add 20, 255, 0
	menu_item_add 21, 255, 1
	menu_item_add 22, 255, 2
	menu_item_add 23, 255, 3
	menu_item_add 11, 255, 4
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0910_T25SP0101_0684
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0910_T25SP0101_070F
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0910_T25SP0101_079A
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0910_T25SP0101_0825
	goto scr_seq_0910_T25SP0101_01EC

scr_seq_0910_T25SP0101_0342:
	setvar VAR_SPECIAL_x8004, 417
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0910_T25SP0101_0B45
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg 3
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0910_T25SP0101_038B
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0910_T25SP0101_0234
scr_seq_0910_T25SP0101_038B:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 2000
	gotoif lt, scr_seq_0910_T25SP0101_0BE6
	npc_msg 4
	play_se SEQ_SE_DP_REGI
	scrcmd_121 2000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg 10
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_0910_T25SP0101_0234

scr_seq_0910_T25SP0101_03CB:
	.byte 0x02, 0x00
scr_seq_0910_T25SP0101_03CD:
	setvar VAR_SPECIAL_x8004, 402
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0910_T25SP0101_0B45
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg 3
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0910_T25SP0101_0416
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0910_T25SP0101_0234
scr_seq_0910_T25SP0101_0416:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 4000
	gotoif lt, scr_seq_0910_T25SP0101_0BE6
	npc_msg 4
	play_se SEQ_SE_DP_REGI
	scrcmd_121 4000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg 10
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_0910_T25SP0101_0234

scr_seq_0910_T25SP0101_0456:
	.byte 0x02, 0x00
scr_seq_0910_T25SP0101_0458:
	setvar VAR_SPECIAL_x8004, 371
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0910_T25SP0101_0B45
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg 3
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0910_T25SP0101_04A1
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0910_T25SP0101_0234
scr_seq_0910_T25SP0101_04A1:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 6000
	gotoif lt, scr_seq_0910_T25SP0101_0BE6
	npc_msg 4
	play_se SEQ_SE_DP_REGI
	scrcmd_121 6000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg 10
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_0910_T25SP0101_0234

scr_seq_0910_T25SP0101_04E1:
	.byte 0x02, 0x00
scr_seq_0910_T25SP0101_04E3:
	setvar VAR_SPECIAL_x8004, 362
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0910_T25SP0101_0B45
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg 3
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0910_T25SP0101_052C
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0910_T25SP0101_0234
scr_seq_0910_T25SP0101_052C:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 10000
	gotoif lt, scr_seq_0910_T25SP0101_0BE6
	npc_msg 4
	play_se SEQ_SE_DP_REGI
	scrcmd_121 10000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg 10
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_0910_T25SP0101_0234

scr_seq_0910_T25SP0101_056C:
	.byte 0x02, 0x00
scr_seq_0910_T25SP0101_056E:
	setvar VAR_SPECIAL_x8004, 340
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0910_T25SP0101_0B45
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg 3
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0910_T25SP0101_05B7
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0910_T25SP0101_0234
scr_seq_0910_T25SP0101_05B7:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 10000
	gotoif lt, scr_seq_0910_T25SP0101_0BE6
	npc_msg 4
	play_se SEQ_SE_DP_REGI
	scrcmd_121 10000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg 10
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_0910_T25SP0101_0234

scr_seq_0910_T25SP0101_05F7:
	.byte 0x02, 0x00
scr_seq_0910_T25SP0101_05F9:
	setvar VAR_SPECIAL_x8004, 351
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0910_T25SP0101_0B45
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg 3
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0910_T25SP0101_0642
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0910_T25SP0101_0234
scr_seq_0910_T25SP0101_0642:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 10000
	gotoif lt, scr_seq_0910_T25SP0101_0BE6
	npc_msg 4
	play_se SEQ_SE_DP_REGI
	scrcmd_121 10000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg 10
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_0910_T25SP0101_0234

scr_seq_0910_T25SP0101_0682:
	.byte 0x02, 0x00
scr_seq_0910_T25SP0101_0684:
	setvar VAR_SPECIAL_x8004, 251
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0910_T25SP0101_0B45
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg 3
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0910_T25SP0101_06CD
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0910_T25SP0101_02D0
scr_seq_0910_T25SP0101_06CD:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 1000
	gotoif lt, scr_seq_0910_T25SP0101_0BE6
	npc_msg 4
	play_se SEQ_SE_DP_REGI
	scrcmd_121 1000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg 10
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_0910_T25SP0101_02D0

scr_seq_0910_T25SP0101_070D:
	.byte 0x02, 0x00
scr_seq_0910_T25SP0101_070F:
	setvar VAR_SPECIAL_x8004, 265
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0910_T25SP0101_0B45
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg 3
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0910_T25SP0101_0758
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0910_T25SP0101_02D0
scr_seq_0910_T25SP0101_0758:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 1000
	gotoif lt, scr_seq_0910_T25SP0101_0BE6
	npc_msg 4
	play_se SEQ_SE_DP_REGI
	scrcmd_121 1000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg 10
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_0910_T25SP0101_02D0

scr_seq_0910_T25SP0101_0798:
	.byte 0x02, 0x00
scr_seq_0910_T25SP0101_079A:
	setvar VAR_SPECIAL_x8004, 276
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0910_T25SP0101_0B45
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg 3
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0910_T25SP0101_07E3
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0910_T25SP0101_02D0
scr_seq_0910_T25SP0101_07E3:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 1000
	gotoif lt, scr_seq_0910_T25SP0101_0BE6
	npc_msg 4
	play_se SEQ_SE_DP_REGI
	scrcmd_121 1000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg 10
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_0910_T25SP0101_02D0

scr_seq_0910_T25SP0101_0823:
	.byte 0x02, 0x00
scr_seq_0910_T25SP0101_0825:
	setvar VAR_SPECIAL_x8004, 277
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0910_T25SP0101_0B45
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg 3
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0910_T25SP0101_086E
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0910_T25SP0101_02D0
scr_seq_0910_T25SP0101_086E:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 1000
	gotoif lt, scr_seq_0910_T25SP0101_0BE6
	npc_msg 4
	play_se SEQ_SE_DP_REGI
	scrcmd_121 1000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg 10
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_0910_T25SP0101_02D0

scr_seq_0910_T25SP0101_08AE:
	.byte 0x02, 0x00
scr_seq_0910_T25SP0101_08B0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_784 3, 0
	npc_msg 9
	touchscreen_menu_hide
	scrcmd_116 0, 20, 2
	scrcmd_495 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_0910_T25SP0101_08E5
	goto scr_seq_0910_T25SP0101_08EB

scr_seq_0910_T25SP0101_08DF:
	.byte 0x16
	.byte 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_0910_T25SP0101_08E5:
	goto scr_seq_0910_T25SP0101_0948

scr_seq_0910_T25SP0101_08EB:
	menu_init 1, 1, 0, 1, VAR_TEMP_x4000
	menu_item_add 24, 255, 0
	menu_item_add 25, 255, 1
	menu_item_add 26, 255, 2
	menu_item_add 11, 255, 3
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0910_T25SP0101_09A5
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0910_T25SP0101_09B1
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0910_T25SP0101_09BD
	goto scr_seq_0910_T25SP0101_0C17

scr_seq_0910_T25SP0101_0948:
	menu_init 1, 1, 0, 1, VAR_TEMP_x4000
	menu_item_add 24, 255, 0
	menu_item_add 27, 255, 1
	menu_item_add 26, 255, 2
	menu_item_add 11, 255, 3
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0910_T25SP0101_09A5
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0910_T25SP0101_09C9
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0910_T25SP0101_09BD
	goto scr_seq_0910_T25SP0101_0C17

scr_seq_0910_T25SP0101_09A5:
	setorcopyvar VAR_TEMP_x4002, 63
	goto scr_seq_0910_T25SP0101_09D5

scr_seq_0910_T25SP0101_09B1:
	setorcopyvar VAR_TEMP_x4002, 23
	goto scr_seq_0910_T25SP0101_09D5

scr_seq_0910_T25SP0101_09BD:
	setorcopyvar VAR_TEMP_x4002, 147
	goto scr_seq_0910_T25SP0101_09D5

scr_seq_0910_T25SP0101_09C9:
	setorcopyvar VAR_TEMP_x4002, 27
	goto scr_seq_0910_T25SP0101_09D5

scr_seq_0910_T25SP0101_09D5:
	get_party_count VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 6
	gotoif ne, scr_seq_0910_T25SP0101_09F3
	npc_msg 6
	waitbutton
	closemsg
	goto scr_seq_0910_T25SP0101_0C26

scr_seq_0910_T25SP0101_09F3:
	buffer_species_name 1, VAR_TEMP_x4002, 0, 0
	npc_msg 7
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0910_T25SP0101_0A34
	closemsg
	scrcmd_495 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_0910_T25SP0101_0A2E
	goto scr_seq_0910_T25SP0101_08EB

scr_seq_0910_T25SP0101_0A28:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_0910_T25SP0101_0A2E:
	goto scr_seq_0910_T25SP0101_0948

scr_seq_0910_T25SP0101_0A34:
	comparevartovalue VAR_TEMP_x4002, 63
	gotoif ne, scr_seq_0910_T25SP0101_0A58
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 200
	gotoif lt, scr_seq_0910_T25SP0101_0BF1
	goto scr_seq_0910_T25SP0101_0AB1

scr_seq_0910_T25SP0101_0A58:
	comparevartovalue VAR_TEMP_x4002, 23
	gotoif ne, scr_seq_0910_T25SP0101_0A7C
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 700
	gotoif lt, scr_seq_0910_T25SP0101_0BF1
	goto scr_seq_0910_T25SP0101_0AB1

scr_seq_0910_T25SP0101_0A7C:
	comparevartovalue VAR_TEMP_x4002, 27
	gotoif ne, scr_seq_0910_T25SP0101_0AA0
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 700
	gotoif lt, scr_seq_0910_T25SP0101_0BF1
	goto scr_seq_0910_T25SP0101_0AB1

scr_seq_0910_T25SP0101_0AA0:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 2100
	gotoif lt, scr_seq_0910_T25SP0101_0BF1
scr_seq_0910_T25SP0101_0AB1:
	npc_msg 4
	play_se SEQ_SE_DP_REGI
	give_mon VAR_TEMP_x4002, 15, 0, 0, 0, VAR_SPECIAL_x800C
	buffer_players_name 0
	buffer_species_name 1, VAR_TEMP_x4002, 0, 0
	npc_msg 8
	comparevartovalue VAR_TEMP_x4002, 63
	gotoif ne, scr_seq_0910_T25SP0101_0AEB
	scrcmd_121 200
	goto scr_seq_0910_T25SP0101_0B1D

scr_seq_0910_T25SP0101_0AEB:
	comparevartovalue VAR_TEMP_x4002, 23
	gotoif ne, scr_seq_0910_T25SP0101_0B02
	scrcmd_121 700
	goto scr_seq_0910_T25SP0101_0B1D

scr_seq_0910_T25SP0101_0B02:
	comparevartovalue VAR_TEMP_x4002, 27
	gotoif ne, scr_seq_0910_T25SP0101_0B19
	scrcmd_121 700
	goto scr_seq_0910_T25SP0101_0B1D

scr_seq_0910_T25SP0101_0B19:
	scrcmd_121 2100
scr_seq_0910_T25SP0101_0B1D:
	scrcmd_118 0
	scrcmd_495 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_0910_T25SP0101_0B3D
	goto scr_seq_0910_T25SP0101_08EB

scr_seq_0910_T25SP0101_0B37:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_0910_T25SP0101_0B3D:
	goto scr_seq_0910_T25SP0101_0948

scr_seq_0910_T25SP0101_0B43:
	.byte 0x02, 0x00
scr_seq_0910_T25SP0101_0B45:
	npc_msg 5
	closemsg
scr_seq_0910_T25SP0101_0B4A:
	comparevartovalue VAR_SPECIAL_x8004, 417
	gotoif ne, scr_seq_0910_T25SP0101_0B63
	goto scr_seq_0910_T25SP0101_0234

scr_seq_0910_T25SP0101_0B5D:
	.byte 0x16, 0x00, 0x83
	.byte 0x00, 0x00, 0x00
scr_seq_0910_T25SP0101_0B63:
	comparevartovalue VAR_SPECIAL_x8004, 402
	gotoif ne, scr_seq_0910_T25SP0101_0B7C
	goto scr_seq_0910_T25SP0101_0234

scr_seq_0910_T25SP0101_0B76:
	.byte 0x16, 0x00, 0x6a, 0x00, 0x00, 0x00
scr_seq_0910_T25SP0101_0B7C:
	comparevartovalue VAR_SPECIAL_x8004, 371
	gotoif ne, scr_seq_0910_T25SP0101_0B95
	goto scr_seq_0910_T25SP0101_0234

scr_seq_0910_T25SP0101_0B8F:
	.byte 0x16
	.byte 0x00, 0x51, 0x00, 0x00, 0x00
scr_seq_0910_T25SP0101_0B95:
	comparevartovalue VAR_SPECIAL_x8004, 362
	gotoif ne, scr_seq_0910_T25SP0101_0BAE
	goto scr_seq_0910_T25SP0101_0234

scr_seq_0910_T25SP0101_0BA8:
	.byte 0x16, 0x00, 0x38, 0x00, 0x00, 0x00
scr_seq_0910_T25SP0101_0BAE:
	comparevartovalue VAR_SPECIAL_x8004, 340
	gotoif ne, scr_seq_0910_T25SP0101_0BC7
	goto scr_seq_0910_T25SP0101_0234

scr_seq_0910_T25SP0101_0BC1:
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
scr_seq_0910_T25SP0101_0BC7:
	comparevartovalue VAR_SPECIAL_x8004, 351
	gotoif ne, scr_seq_0910_T25SP0101_0BE0
	goto scr_seq_0910_T25SP0101_0234

scr_seq_0910_T25SP0101_0BDA:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_0910_T25SP0101_0BE0:
	goto scr_seq_0910_T25SP0101_02D0

scr_seq_0910_T25SP0101_0BE6:
	npc_msg 2
	goto scr_seq_0910_T25SP0101_0B4A

scr_seq_0910_T25SP0101_0BEF:
	.byte 0x02
	.byte 0x00
scr_seq_0910_T25SP0101_0BF1:
	npc_msg 2
	scrcmd_495 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_0910_T25SP0101_0C11
	goto scr_seq_0910_T25SP0101_08EB

scr_seq_0910_T25SP0101_0C0B:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00
	.byte 0x00
scr_seq_0910_T25SP0101_0C11:
	goto scr_seq_0910_T25SP0101_0948

scr_seq_0910_T25SP0101_0C17:
	npc_msg 1
	waitbutton
	closemsg
	goto scr_seq_0910_T25SP0101_0C26

scr_seq_0910_T25SP0101_0C24:
	.byte 0x02, 0x00
scr_seq_0910_T25SP0101_0C26:
	scrcmd_117
	touchscreen_menu_show
	scrcmd_784 3, 1
	releaseall
	end
	.balign 4, 0
