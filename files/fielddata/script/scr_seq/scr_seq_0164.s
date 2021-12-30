#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0164_001A ; 000
	scrdef scr_seq_0164_011C ; 001
	scrdef scr_seq_0164_01E1 ; 002
	scrdef scr_seq_0164_0521 ; 003
	scrdef scr_seq_0164_0714 ; 004
	scrdef scr_seq_0164_0766 ; 005
	scrdef_end

scr_seq_0164_001A:
	scrcmd_609
	lockall
	npc_msg 0
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0164_0100
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 1
	setvar VAR_SPECIAL_x8004, 437
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	goto scr_seq_0164_005C

scr_seq_0164_005A:
	.byte 0x02, 0x00
scr_seq_0164_005C:
	npc_msg 2
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 156, 255, 0
	menu_item_add 157, 255, 1
	menu_exec
	touchscreen_menu_show
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0164_00A5
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0164_00EE
	goto scr_seq_0164_00EE

scr_seq_0164_00A3:
	.byte 0x02, 0x00
scr_seq_0164_00A5:
	npc_msg 3
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 158, 255, 0
	menu_item_add 157, 255, 1
	menu_exec
	touchscreen_menu_show
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0164_00A5
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0164_00EE
	goto scr_seq_0164_00EE

scr_seq_0164_00EC:
	.byte 0x02, 0x00
scr_seq_0164_00EE:
	setvar VAR_UNK_4117, 1
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0164_00FF:
	.byte 0x00

scr_seq_0164_0100:
	step 32, 1
	step 63, 2
	step 12, 4
	step 14, 1
	step 0, 1
	step 63, 2
	step_end
scr_seq_0164_011C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 5
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0164_014F
	goto scr_seq_0164_0144

scr_seq_0164_0142:
	.byte 0x02, 0x00
scr_seq_0164_0144:
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0164_014F:
	npc_msg 6
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 156, 255, 0
	menu_item_add 157, 255, 1
	menu_exec
	touchscreen_menu_show
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0164_0198
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0164_0144
	goto scr_seq_0164_0144

scr_seq_0164_0196:
	.byte 0x02, 0x00
scr_seq_0164_0198:
	npc_msg 3
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 158, 255, 0
	menu_item_add 157, 255, 1
	menu_exec
	touchscreen_menu_show
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0164_0198
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0164_0144
	goto scr_seq_0164_0144

scr_seq_0164_01DF:
	.byte 0x02
	.byte 0x00
scr_seq_0164_01E1:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_584 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0164_04EC
	get_trcard_stars VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_0164_031B
	get_party_count VAR_TEMP_x4009
	setvar VAR_TEMP_x400A, 0
scr_seq_0164_0215:
	get_partymon_species VAR_TEMP_x400A, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 172
	gotoif ne, scr_seq_0164_0241
	get_partymon_forme VAR_TEMP_x400A, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0164_0241
	goto scr_seq_0164_04F8

scr_seq_0164_0241:
	addvar VAR_TEMP_x400A, 1
	comparevartovar VAR_TEMP_x400A, VAR_TEMP_x4009
	gotoif ge, scr_seq_0164_025A
	goto scr_seq_0164_0215

scr_seq_0164_025A:
	goto scr_seq_0164_0262

scr_seq_0164_0260:
	.byte 0x02, 0x00
scr_seq_0164_0262:
	npc_msg 7
scr_seq_0164_0265:
	touchscreen_menu_hide
	menu_init 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 14, 255, 0
	menu_item_add 15, 255, 1
	menu_item_add 16, 255, 2
	menu_exec
	touchscreen_menu_show
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0164_02BE
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0164_02B3
	goto scr_seq_0164_0326

scr_seq_0164_02B1:
	.byte 0x02, 0x00
scr_seq_0164_02B3:
	npc_msg 13
	goto scr_seq_0164_0265

scr_seq_0164_02BC:
	.byte 0x02, 0x00
scr_seq_0164_02BE:
	scrcmd_565 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0164_02D7
	goto scr_seq_0164_0331

scr_seq_0164_02D5:
	.byte 0x02, 0x00
scr_seq_0164_02D7:
	scrcmd_564 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0164_0310
	goto scr_seq_0164_02F0

scr_seq_0164_02EE:
	.byte 0x02, 0x00
scr_seq_0164_02F0:
	npc_msg 11
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0164_0331
	goto scr_seq_0164_0326

scr_seq_0164_030E:
	.byte 0x02, 0x00
scr_seq_0164_0310:
	npc_msg 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0164_031B:
	npc_msg 17
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0164_0326:
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0164_0331:
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0164_0356
	goto scr_seq_0164_0326

scr_seq_0164_034E:
	.byte 0x02, 0x00
scr_seq_0164_0350:
	callstd 2041
	end

scr_seq_0164_0356:
	scrcmd_689 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0164_0350
	npc_msg 10
	closemsg
	scrcmd_600
	heal_party
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_815 0
	apply_movement 255, scr_seq_0164_0474
	wait_movement
	goto scr_seq_0164_038C

scr_seq_0164_038A:
	.byte 0x02, 0x00
scr_seq_0164_038C:
	scrcmd_307 0, 0, 9, 5, 77
	call scr_seq_0164_03E0
	apply_movement 255, scr_seq_0164_0480
	wait_movement
	call scr_seq_0164_03E8
	apply_movement 255, scr_seq_0164_0488
	wait_movement
	scrcmd_307 0, 0, 9, 2, 77
	call scr_seq_0164_03E0
	apply_movement 255, scr_seq_0164_0490
	wait_movement
	call scr_seq_0164_03E8
	goto scr_seq_0164_03F3

scr_seq_0164_03DE:
	.byte 0x02, 0x00
scr_seq_0164_03E0:
	scrcmd_310 77
	scrcmd_308 77
	return

scr_seq_0164_03E8:
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	return

scr_seq_0164_03F3:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_436
	scrcmd_565 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0164_041A
	scrcmd_152
	goto scr_seq_0164_041C

scr_seq_0164_041A:
	scrcmd_152
scr_seq_0164_041C:
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	scrcmd_307 0, 0, 8, 2, 77
	call scr_seq_0164_03E0
	apply_movement 255, scr_seq_0164_04A8
	wait_movement
	call scr_seq_0164_03E8
	scrcmd_307 0, 0, 8, 5, 77
	call scr_seq_0164_03E0
	apply_movement 255, scr_seq_0164_04C0
	wait_movement
	call scr_seq_0164_03E8
	scrcmd_606
	releaseall
	end

scr_seq_0164_0472:
	.byte 0x00, 0x00

scr_seq_0164_0474:
	step 15, 1
	step 32, 1
	step_end

scr_seq_0164_0480:
	step 12, 2
	step_end

scr_seq_0164_0488:
	step 12, 1
	step_end

scr_seq_0164_0490:
	step 12, 1
	step 69, 1
	step_end

scr_seq_0164_049C:
	step 12, 2
	step 69, 1
	step_end

scr_seq_0164_04A8:
	step 1, 1
	step 70, 1
	step 13, 2
	step_end
	.byte 0x0d, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_0164_04C0:
	step 13, 2
	step_end

scr_seq_0164_04C8:
	step 35, 1
	step_end

scr_seq_0164_04D0:
	step 12, 1
	step 15, 1
	step 32, 1
	step_end

scr_seq_0164_04E0:
	step 12, 1
	step 69, 1
	step_end
scr_seq_0164_04EC:
	callstd 9016
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0164_04F8:
	scrcmd_490 16385
	scrcmd_490 16386
	comparevartovalue VAR_UNK_412F, 0
	gotoif ne, scr_seq_0164_0516
	npc_msg 29
	goto scr_seq_0164_0519

scr_seq_0164_0516:
	npc_msg 28
scr_seq_0164_0519:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0164_0521:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_trcard_stars VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_0164_0709
	scrcmd_691 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0164_0560
	scrcmd_446 VAR_UNK_4056
	copyvar VAR_UNK_4055, VAR_SPECIAL_x800D
	npc_msg 18
	goto scr_seq_0164_056B

scr_seq_0164_055E:
	.byte 0x02, 0x00
scr_seq_0164_0560:
	npc_msg 26
	goto scr_seq_0164_05C4

scr_seq_0164_0569:
	.byte 0x02, 0x00
scr_seq_0164_056B:
	touchscreen_menu_hide
	menu_init 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 23, 255, 0
	menu_item_add 24, 255, 1
	menu_item_add 25, 255, 2
	menu_exec
	touchscreen_menu_show
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0164_05D7
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0164_05CC
	goto scr_seq_0164_05B9

scr_seq_0164_05B7:
	.byte 0x02, 0x00
scr_seq_0164_05B9:
	npc_msg 21
	goto scr_seq_0164_05C4

scr_seq_0164_05C2:
	.byte 0x02, 0x00
scr_seq_0164_05C4:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0164_05CC:
	npc_msg 22
	goto scr_seq_0164_056B

scr_seq_0164_05D5:
	.byte 0x02, 0x00
scr_seq_0164_05D7:
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0164_05B9
	npc_msg 20
	closemsg
	scrcmd_600
	heal_party
	scrcmd_815 0
	apply_movement 255, scr_seq_0164_0474
	wait_movement
	scrcmd_307 0, 0, 5, 5, 77
	call scr_seq_0164_03E0
	apply_movement VAR_SPECIAL_x800D, scr_seq_0164_04C8
	apply_movement 255, scr_seq_0164_0480
	wait_movement
	call scr_seq_0164_03E8
	apply_movement VAR_SPECIAL_x800D, scr_seq_0164_04D0
	wait_movement
	scrcmd_307 0, 0, 5, 2, 77
	call scr_seq_0164_03E0
	apply_movement 255, scr_seq_0164_049C
	apply_movement VAR_SPECIAL_x800D, scr_seq_0164_04E0
	wait_movement
	call scr_seq_0164_03E8
	setvar VAR_TEMP_x4003, 0
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 516, 0, 20, 11, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0164_068F:
	.byte 0xae
	.byte 0x00, 0x06, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0xaf, 0x00, 0xb4, 0x01, 0xa6, 0x00, 0x0c
	.byte 0x80, 0x2a, 0x00, 0x04, 0x80, 0x0c, 0x80, 0x97, 0x02, 0x04, 0x80, 0x96, 0x00, 0xae, 0x00, 0x06
	.byte 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0xaf, 0x00, 0x33, 0x01, 0x00, 0x00, 0x00, 0x00, 0x05
	.byte 0x00, 0x02, 0x00, 0x4d, 0x1a, 0x00, 0x16, 0xfd, 0xff, 0xff, 0x5e, 0x00, 0xff, 0x00, 0xd6, 0xfd
	.byte 0xff, 0xff, 0x5f, 0x00, 0x1a, 0x00, 0x0e, 0xfd, 0xff, 0xff, 0x5e, 0x00, 0xff, 0x00, 0xd6, 0xfd
	.byte 0xff, 0xff, 0x5f, 0x00, 0x33, 0x01, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x05, 0x00, 0x4d, 0x1a
	.byte 0x00, 0xeb, 0xfc, 0xff, 0xff, 0x5e, 0x00, 0xff, 0x00, 0xc3, 0xfd, 0xff, 0xff, 0x5f, 0x00, 0x1a
	.byte 0x00, 0xe3, 0xfc, 0xff, 0xff, 0x61, 0x00, 0x02, 0x00
scr_seq_0164_0709:
	npc_msg 27
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0164_0714:
	scrcmd_609
	lockall
	scrcmd_307 0, 0, 5, 2, 77
	call scr_seq_0164_03E0
	apply_movement 255, scr_seq_0164_04A8
	wait_movement
	call scr_seq_0164_03E8
	scrcmd_307 0, 0, 5, 5, 77
	call scr_seq_0164_03E0
	apply_movement 255, scr_seq_0164_04C0
	wait_movement
	call scr_seq_0164_03E8
	scrcmd_606
	setvar VAR_UNK_4137, 0
	releaseall
	end

scr_seq_0164_0766:
	debugwatch VAR_UNK_4143
	setvar VAR_UNK_414F, 0
	setvar VAR_UNK_4150, 0
	setvar VAR_UNK_4143, 0
	setvar VAR_UNK_4144, 0
	setvar VAR_UNK_4148, 0
	setvar VAR_UNK_4146, 0
	setvar VAR_UNK_4149, 0
	setvar VAR_UNK_414B, 0
	setvar VAR_UNK_4142, 0
	setvar VAR_UNK_4147, 0
	setvar VAR_UNK_4145, 0
	setvar VAR_UNK_414A, 0
	debugwatch VAR_UNK_4143
	end
	.balign 4, 0
