#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0243_R36_006A ; 000
	scrdef scr_seq_0243_R36_03BC ; 001
	scrdef scr_seq_0243_R36_002E ; 002
	scrdef scr_seq_0243_R36_05B9 ; 003
	scrdef scr_seq_0243_R36_05D0 ; 004
	scrdef scr_seq_0243_R36_05E5 ; 005
	scrdef scr_seq_0243_R36_05FA ; 006
	scrdef scr_seq_0243_R36_050A ; 007
	scrdef scr_seq_0243_R36_0544 ; 008
	scrdef scr_seq_0243_R36_0592 ; 009
	scrdef scr_seq_0243_R36_004F ; 010
	scrdef_end

scr_seq_0243_R36_002E:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, scr_seq_0243_R36_0049
	clearflag FLAG_UNK_1C4
	goto scr_seq_0243_R36_004D

scr_seq_0243_R36_0049:
	setflag FLAG_UNK_1C4
scr_seq_0243_R36_004D:
	end

scr_seq_0243_R36_004F:
	checkflag FLAG_UNK_0A4
	gotoif TRUE, scr_seq_0243_R36_005C
	end

scr_seq_0243_R36_005C:
	setflag FLAG_UNK_1C2
	hide_person 4
	clearflag FLAG_UNK_0A4
	end

scr_seq_0243_R36_006A:
	play_se SEQ_SE_DP_SELECT
	lockall
	checkflag FLAG_UNK_1D0
	gotoif FALSE, scr_seq_0243_R36_0261
	hasitem ITEM_SQUIRTBOTTLE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0243_R36_009A
	apply_movement 5, scr_seq_0243_R36_053C
	wait_movement
scr_seq_0243_R36_009A:
	play_se SEQ_SE_GS_KI_UGOKU
	apply_movement 4, scr_seq_0243_R36_038C
	wait_movement
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0243_R36_00B9
	releaseall
	end

scr_seq_0243_R36_00B9:
	npc_msg 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0243_R36_00E0
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0243_R36_025B
	end

scr_seq_0243_R36_00E0:
	buffer_players_name 0
	npc_msg 1
	play_se SEQ_SE_GS_ZENIGAME_JOURO
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0243_R36_0109
	apply_movement 255, scr_seq_0243_R36_039C
	goto scr_seq_0243_R36_012C

scr_seq_0243_R36_0109:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0243_R36_0124
	apply_movement 255, scr_seq_0243_R36_03AC
	goto scr_seq_0243_R36_012C

scr_seq_0243_R36_0124:
	apply_movement 255, scr_seq_0243_R36_03A4
scr_seq_0243_R36_012C:
	wait_movement
	setflag FLAG_UNK_0B4
	npc_msg 2
	closemsg
	play_se SEQ_SE_GS_KI_UGOKU
	apply_movement 4, scr_seq_0243_R36_0394
	wait_movement
	setflag FLAG_UNK_0A4
	scrcmd_589 185, 20, 0
	clearflag FLAG_UNK_0A4
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0243_R36_0255
	scrcmd_683 16385
	comparevartovalue VAR_TEMP_x4001, 3
	gotoif eq, scr_seq_0243_R36_0251
	comparevartovalue VAR_TEMP_x4001, 4
	callif eq, scr_seq_0243_R36_023F
	setflag FLAG_UNK_0B5
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0243_R36_01BC
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0243_R36_03B4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	goto scr_seq_0243_R36_01C6

scr_seq_0243_R36_01BC:
	apply_movement 5, scr_seq_0243_R36_0360
	wait_movement
scr_seq_0243_R36_01C6:
	npc_msg 15
	setvar VAR_SPECIAL_x8004, 470
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	npc_msg 16
	npc_msg 17
	setvar VAR_SPECIAL_x8004, 155
	setvar VAR_SPECIAL_x8005, 3
	callstd std_give_item_verbose
	setvar VAR_SPECIAL_x8004, 151
	setvar VAR_SPECIAL_x8005, 3
	callstd std_give_item_verbose
	npc_msg 18
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0243_R36_0225
	apply_movement 5, scr_seq_0243_R36_0378
	wait_movement
	goto scr_seq_0243_R36_022F

scr_seq_0243_R36_0225:
	apply_movement 5, scr_seq_0243_R36_0380
	wait_movement
scr_seq_0243_R36_022F:
	hide_person 5
	setflag FLAG_UNK_1CF
	clearflag FLAG_UNK_1D0
	releaseall
	end

scr_seq_0243_R36_023F:
	setflag FLAG_UNK_169
	return

scr_seq_0243_R36_0245:
	.byte 0x14, 0x00, 0xd9, 0x07, 0x35, 0x00, 0x16, 0x00, 0xb3, 0xff, 0xff
	.byte 0xff
scr_seq_0243_R36_0251:
	releaseall
	end

scr_seq_0243_R36_0255:
	white_out
	releaseall
	end

scr_seq_0243_R36_025B:
	closemsg
	releaseall
	end

scr_seq_0243_R36_0261:
	play_se SEQ_SE_GS_KI_UGOKU
	apply_movement 4, scr_seq_0243_R36_038C
	wait_movement
	npc_msg 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0243_R36_0296
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0243_R36_025B
	end

scr_seq_0243_R36_0296:
	buffer_players_name 0
	npc_msg 1
	play_se SEQ_SE_GS_ZENIGAME_JOURO
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0243_R36_02BF
	apply_movement 255, scr_seq_0243_R36_039C
	goto scr_seq_0243_R36_02E2

scr_seq_0243_R36_02BF:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0243_R36_02DA
	apply_movement 255, scr_seq_0243_R36_03AC
	goto scr_seq_0243_R36_02E2

scr_seq_0243_R36_02DA:
	apply_movement 255, scr_seq_0243_R36_03A4
scr_seq_0243_R36_02E2:
	wait_movement
	npc_msg 2
	closemsg
	play_se SEQ_SE_GS_KI_UGOKU
	apply_movement 4, scr_seq_0243_R36_0394
	wait_movement
	setflag FLAG_UNK_0A4
	scrcmd_589 185, 20, 0
	clearflag FLAG_UNK_0A4
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0243_R36_0255
	scrcmd_683 16385
	comparevartovalue VAR_TEMP_x4001, 4
	callif eq, scr_seq_0243_R36_023F
	scrcmd_221 16384, 0
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0243_R36_0251
	releaseall
	end

scr_seq_0243_R36_033E:
	.byte 0x00, 0x00
	.byte 0x0c, 0x00, 0x02, 0x00, 0x01, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x3e, 0x00, 0x05, 0x00
	.byte 0x24, 0x00, 0x02, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x0c, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_0243_R36_0360:
	.short 12, 3
	.short 3, 1
	.short 254, 0
	.byte 0x3f, 0x00, 0x01, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_0243_R36_0378:
	.short 14, 10
	.short 254, 0

scr_seq_0243_R36_0380:
	.short 13, 2
	.short 14, 10
	.short 254, 0

scr_seq_0243_R36_038C:
	.short 32, 3
	.short 254, 0

scr_seq_0243_R36_0394:
	.short 36, 6
	.short 254, 0

scr_seq_0243_R36_039C:
	.short 30, 4
	.short 254, 0

scr_seq_0243_R36_03A4:
	.short 28, 4
	.short 254, 0

scr_seq_0243_R36_03AC:
	.short 29, 4
	.short 254, 0

scr_seq_0243_R36_03B4:
	.short 13, 1
	.short 254, 0
scr_seq_0243_R36_03BC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_lead_mon_index VAR_SPECIAL_x8002
	mon_has_ribbon VAR_SPECIAL_x800C, VAR_SPECIAL_x8002, RIBBON_CARELESS
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0243_R36_04E2
	checkflag FLAG_GOT_SHOCK_RIBBON
	gotoif TRUE, scr_seq_0243_R36_04F6
	comparevartovalue VAR_NUM_MET_WEEKDAY_SIBLINGS, 7
	gotoif eq, scr_seq_0243_R36_0490
	checkflag FLAG_UNK_0B1
	gotoif TRUE, scr_seq_0243_R36_0472
	get_weekday VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, scr_seq_0243_R36_0423
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 15
	goto scr_seq_0243_R36_046A

scr_seq_0243_R36_0423:
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 12
	setvar VAR_SPECIAL_x8004, 238
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0243_R36_0486
	callstd std_give_item_verbose
	setflag FLAG_UNK_0B1
	addvar VAR_NUM_MET_WEEKDAY_SIBLINGS, 1
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 13
scr_seq_0243_R36_046A:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0243_R36_0472:
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0243_R36_0486:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_0243_R36_0490:
	get_weekday VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, scr_seq_0243_R36_04B3
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 15
	goto scr_seq_0243_R36_046A

scr_seq_0243_R36_04B3:
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 40
	buffer_mon_species_name 0, VAR_SPECIAL_x8002
	msgbox_extern VAR_SPECIAL_x800C, 42
	give_ribbon VAR_SPECIAL_x8002, RIBBON_CARELESS
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setflag FLAG_GOT_SHOCK_RIBBON
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0243_R36_04E2:
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 41
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0243_R36_04F6:
	get_std_msg_naix 0, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 43
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0243_R36_050A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	hasitem ITEM_SQUIRTBOTTLE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0243_R36_0530
	npc_msg 13
	goto scr_seq_0243_R36_0533

scr_seq_0243_R36_0530:
	npc_msg 14
scr_seq_0243_R36_0533:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0243_R36_053B:
	.byte 0x00

scr_seq_0243_R36_053C:
	.short 0, 1
	.short 254, 0
scr_seq_0243_R36_0544:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	getitemquantity 425, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0243_R36_0572
	npc_msg 3
	setvar VAR_SPECIAL_x8004, 425
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
scr_seq_0243_R36_0572:
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0243_R36_057D:
	.byte 0x2d, 0x00, 0x05
	.byte 0x32, 0x00, 0x35, 0x00, 0x61, 0x00, 0x02, 0x00, 0x14, 0x00, 0xd9, 0x07, 0x35, 0x00, 0x61, 0x00
	.byte 0x02, 0x00
scr_seq_0243_R36_0592:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_1C2
	gotoif TRUE, scr_seq_0243_R36_05AE
	npc_msg 7
	goto scr_seq_0243_R36_05B1

scr_seq_0243_R36_05AE:
	npc_msg 8
scr_seq_0243_R36_05B1:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0243_R36_05B9:
	scrcmd_055 9, 1, 15, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0243_R36_05D0:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 10, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0243_R36_05E5:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 11, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0243_R36_05FA:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 12, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
