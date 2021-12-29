#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0896_T25R0601_0154 ; 000
	scrdef scr_seq_0896_T25R0601_03B5 ; 001
	scrdef scr_seq_0896_T25R0601_0012 ; 002
	scrdef scr_seq_0896_T25R0601_005A ; 003
	scrdef_end

scr_seq_0896_T25R0601_0012:
	checkflag FLAG_UNK_15D
	gotoif TRUE, scr_seq_0896_T25R0601_0058
	checkflag FLAG_UNK_0B5
	gotoif FALSE, scr_seq_0896_T25R0601_0058
	scrcmd_688 16384, 492
	comparevartovalue VAR_TEMP_x4000, 255
	gotoif eq, scr_seq_0896_T25R0601_0058
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 492
	gotoif ne, scr_seq_0896_T25R0601_0058
	setvar VAR_UNK_4082, 1
scr_seq_0896_T25R0601_0058:
	end

scr_seq_0896_T25R0601_005A:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0896_T25R0601_00FC
	apply_movement 1, scr_seq_0896_T25R0601_0110
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 1, scr_seq_0896_T25R0601_0120
	apply_movement 255, scr_seq_0896_T25R0601_0108
	apply_movement 253, scr_seq_0896_T25R0601_014C
	wait_movement
	npc_msg 5
	closemsg
	apply_movement 1, scr_seq_0896_T25R0601_012C
	wait_movement
	npc_msg 6
	setvar VAR_SPECIAL_x8004, 466
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif eq, scr_seq_0896_T25R0601_00EA
	callstd std_give_item_verbose
	npc_msg 7
	waitbutton
	closemsg
	setflag FLAG_UNK_15D
	setvar VAR_UNK_4082, 0
	releaseall
	end

scr_seq_0896_T25R0601_00EA:
	callstd std_bag_is_full
	closemsg
	releaseall
	setvar VAR_UNK_4082, 0
	releaseall
	end


scr_seq_0896_T25R0601_00FC:
	.short 12, 1
	.short 63, 1
	.short 254, 0

scr_seq_0896_T25R0601_0108:
	.short 3, 1
	.short 254, 0

scr_seq_0896_T25R0601_0110:
	.short 63, 1
	.short 2, 1
	.short 75, 1
	.short 254, 0

scr_seq_0896_T25R0601_0120:
	.short 13, 1
	.short 14, 1
	.short 254, 0

scr_seq_0896_T25R0601_012C:
	.short 38, 4
	.short 254, 0

scr_seq_0896_T25R0601_0134:
	.short 37, 4
	.short 254, 0

scr_seq_0896_T25R0601_013C:
	.short 36, 4
	.short 254, 0

scr_seq_0896_T25R0601_0144:
	.short 39, 4
	.short 254, 0

scr_seq_0896_T25R0601_014C:
	.short 3, 1
	.short 254, 0
scr_seq_0896_T25R0601_0154:
	checkflag FLAG_UNK_0B5
	gotoif TRUE, scr_seq_0896_T25R0601_01E5
	check_badge 2, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0896_T25R0601_0185
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0896_T25R0601_0185:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	hasitem ITEM_SQUIRTBOTTLE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0896_T25R0601_01D0
	npc_msg 1
	setvar VAR_SPECIAL_x8004, 477
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0896_T25R0601_01DB
	callstd std_give_item_verbose
	closemsg
	releaseall
	end

scr_seq_0896_T25R0601_01D0:
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0896_T25R0601_01DB:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_0896_T25R0601_01E5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 3
	npc_msg 8
	touchscreen_menu_hide
	scrcmd_113 20, 2
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 213, 470, 0
	scrcmd_751 214, 472, 1
	scrcmd_751 215, 471, 2
	scrcmd_751 216, 473, 3
	scrcmd_751 217, 474, 4
	scrcmd_752
	copyvar VAR_SPECIAL_x8000, VAR_SPECIAL_x800C
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0896_T25R0601_033D
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0896_T25R0601_0349
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0896_T25R0601_0355
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0896_T25R0601_0361
	npc_msg 10
	goto scr_seq_0896_T25R0601_031F

scr_seq_0896_T25R0601_0276:
	comparevartovalue VAR_SPECIAL_x8000, 0
	callif eq, scr_seq_0896_T25R0601_036D
	comparevartovalue VAR_SPECIAL_x8000, 1
	callif eq, scr_seq_0896_T25R0601_0377
	comparevartovalue VAR_SPECIAL_x8000, 2
	callif eq, scr_seq_0896_T25R0601_0381
	comparevartovalue VAR_SPECIAL_x8000, 3
	callif eq, scr_seq_0896_T25R0601_038B
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0896_T25R0601_0334
	hasspaceforitem VAR_SPECIAL_x8001, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0896_T25R0601_032B
	comparevartovalue VAR_SPECIAL_x8000, 0
	callif eq, scr_seq_0896_T25R0601_0395
	comparevartovalue VAR_SPECIAL_x8000, 1
	callif eq, scr_seq_0896_T25R0601_039D
	comparevartovalue VAR_SPECIAL_x8000, 2
	callif eq, scr_seq_0896_T25R0601_03A5
	comparevartovalue VAR_SPECIAL_x8000, 3
	callif eq, scr_seq_0896_T25R0601_03AD
	scrcmd_115
	play_se SEQ_SE_DP_REGI
	giveitem VAR_SPECIAL_x8001, 1, VAR_SPECIAL_x800C
	buffer_item_name 0, VAR_SPECIAL_x8001
	npc_msg 11
	npc_msg 9
	goto scr_seq_0896_T25R0601_031F

scr_seq_0896_T25R0601_031F:
	waitbutton
	closemsg
	touchscreen_menu_show
	scrcmd_114
	releaseall
	end

scr_seq_0896_T25R0601_032B:
	npc_msg 12
	goto scr_seq_0896_T25R0601_031F

scr_seq_0896_T25R0601_0334:
	npc_msg 13
	goto scr_seq_0896_T25R0601_031F

scr_seq_0896_T25R0601_033D:
	setvar VAR_SPECIAL_x8001, 95
	goto scr_seq_0896_T25R0601_0276

scr_seq_0896_T25R0601_0349:
	setvar VAR_SPECIAL_x8001, 96
	goto scr_seq_0896_T25R0601_0276

scr_seq_0896_T25R0601_0355:
	setvar VAR_SPECIAL_x8001, 97
	goto scr_seq_0896_T25R0601_0276

scr_seq_0896_T25R0601_0361:
	setvar VAR_SPECIAL_x8001, 98
	goto scr_seq_0896_T25R0601_0276

scr_seq_0896_T25R0601_036D:
	hasenoughmoneyimmediate 32780, 200
	return

scr_seq_0896_T25R0601_0377:
	hasenoughmoneyimmediate 32780, 200
	return

scr_seq_0896_T25R0601_0381:
	hasenoughmoneyimmediate 32780, 200
	return

scr_seq_0896_T25R0601_038B:
	hasenoughmoneyimmediate 32780, 200
	return

scr_seq_0896_T25R0601_0395:
	submoneyimmediate 200
	return

scr_seq_0896_T25R0601_039D:
	submoneyimmediate 200
	return

scr_seq_0896_T25R0601_03A5:
	submoneyimmediate 200
	return

scr_seq_0896_T25R0601_03AD:
	submoneyimmediate 200
	return

scr_seq_0896_T25R0601_03B5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_15D
	gotoif TRUE, scr_seq_0896_T25R0601_03FD
	scrcmd_688 32780, 492
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0896_T25R0601_03F2
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 492
	gotoif eq, scr_seq_0896_T25R0601_0432
scr_seq_0896_T25R0601_03F2:
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0896_T25R0601_03FD:
	scrcmd_688 32780, 492
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0896_T25R0601_03F2
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 492
	gotoif ne, scr_seq_0896_T25R0601_03F2
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0896_T25R0601_0432:
	apply_movement 1, scr_seq_0896_T25R0601_04F0
	wait_movement
	npc_msg 5
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0896_T25R0601_0460
	apply_movement 1, scr_seq_0896_T25R0601_0134
	goto scr_seq_0896_T25R0601_049E

scr_seq_0896_T25R0601_0460:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0896_T25R0601_047B
	apply_movement 1, scr_seq_0896_T25R0601_013C
	goto scr_seq_0896_T25R0601_049E

scr_seq_0896_T25R0601_047B:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0896_T25R0601_0496
	apply_movement 1, scr_seq_0896_T25R0601_0144
	goto scr_seq_0896_T25R0601_049E

scr_seq_0896_T25R0601_0496:
	apply_movement 1, scr_seq_0896_T25R0601_012C
scr_seq_0896_T25R0601_049E:
	wait_movement
	npc_msg 6
	setvar VAR_SPECIAL_x8004, 466
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif eq, scr_seq_0896_T25R0601_04DD
	callstd std_give_item_verbose
	npc_msg 7
	waitbutton
	closemsg
	setflag FLAG_UNK_15D
	setvar VAR_UNK_4082, 0
	releaseall
	end

scr_seq_0896_T25R0601_04DD:
	callstd std_bag_is_full
	closemsg
	releaseall
	setvar VAR_UNK_4082, 0
	releaseall
	end

scr_seq_0896_T25R0601_04EF:
	.byte 0x00

scr_seq_0896_T25R0601_04F0:
	.short 75, 1
	.short 254, 0
	.balign 4, 0
