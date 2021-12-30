#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0123_D49R0101_0088 ; 000
	scrdef scr_seq_0123_D49R0101_0350 ; 001
	scrdef scr_seq_0123_D49R0101_040B ; 002
	scrdef scr_seq_0123_D49R0101_05B9 ; 003
	scrdef scr_seq_0123_D49R0101_05BB ; 004
	scrdef scr_seq_0123_D49R0101_05CE ; 005
	scrdef scr_seq_0123_D49R0101_05E1 ; 006
	scrdef scr_seq_0123_D49R0101_05F4 ; 007
	scrdef scr_seq_0123_D49R0101_0607 ; 008
	scrdef scr_seq_0123_D49R0101_061A ; 009
	scrdef scr_seq_0123_D49R0101_062D ; 010
	scrdef scr_seq_0123_D49R0101_0640 ; 011
	scrdef scr_seq_0123_D49R0101_0653 ; 012
	scrdef scr_seq_0123_D49R0101_0666 ; 013
	scrdef scr_seq_0123_D49R0101_06D8 ; 014
	scrdef scr_seq_0123_D49R0101_0679 ; 015
	scrdef scr_seq_0123_D49R0101_068C ; 016
	scrdef scr_seq_0123_D49R0101_069F ; 017
	scrdef scr_seq_0123_D49R0101_06B2 ; 018
	scrdef scr_seq_0123_D49R0101_06C5 ; 019
	scrdef scr_seq_0123_D49R0101_0AE8 ; 020
	scrdef scr_seq_0123_D49R0101_0BB2 ; 021
	scrdef scr_seq_0123_D49R0101_0C57 ; 022
	scrdef scr_seq_0123_D49R0101_0062 ; 023
	scrdef_end

scr_seq_0123_D49R0101_0062:
	setflag FLAG_UNK_9D3
	end

scr_seq_0123_D49R0101_0068:
	.byte 0x22, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_0123_D49R0101_0070:
	step 35, 1
	step_end

scr_seq_0123_D49R0101_0078:
	step 33, 1
	step_end

scr_seq_0123_D49R0101_0080:
	step 32, 1
	step_end
scr_seq_0123_D49R0101_0088:
	scrcmd_609
	lockall
	scrcmd_386 VAR_TEMP_x400A
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif ne, scr_seq_0123_D49R0101_00AB
	apply_movement 255, scr_seq_0123_D49R0101_0230
	goto scr_seq_0123_D49R0101_00B3

scr_seq_0123_D49R0101_00AB:
	apply_movement 255, scr_seq_0123_D49R0101_023C
scr_seq_0123_D49R0101_00B3:
	wait_movement
	clearflag FLAG_UNK_227
	show_person 1
	move_person 1, 23, 0, 20, 0
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif ne, scr_seq_0123_D49R0101_00EC
	apply_movement 1, scr_seq_0123_D49R0101_0248
	apply_movement 255, scr_seq_0123_D49R0101_0260
	goto scr_seq_0123_D49R0101_00F4

scr_seq_0123_D49R0101_00EC:
	apply_movement 1, scr_seq_0123_D49R0101_0258
scr_seq_0123_D49R0101_00F4:
	wait_movement
	buffer_players_name 0
	npc_msg 80
	closemsg
	wait 30, VAR_SPECIAL_x800C
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif ne, scr_seq_0123_D49R0101_011F
	apply_movement 1, scr_seq_0123_D49R0101_0200
	goto scr_seq_0123_D49R0101_0127

scr_seq_0123_D49R0101_011F:
	apply_movement 1, scr_seq_0123_D49R0101_0218
scr_seq_0123_D49R0101_0127:
	wait_movement
	npc_msg 81
	closemsg
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif ne, scr_seq_0123_D49R0101_0149
	apply_movement 1, scr_seq_0123_D49R0101_0270
	goto scr_seq_0123_D49R0101_018E

scr_seq_0123_D49R0101_0149:
	comparevartovalue VAR_TEMP_x400A, 3
	gotoif ne, scr_seq_0123_D49R0101_016C
	apply_movement 1, scr_seq_0123_D49R0101_02AC
	apply_movement 255, scr_seq_0123_D49R0101_0070
	goto scr_seq_0123_D49R0101_018E

scr_seq_0123_D49R0101_016C:
	apply_movement 1, scr_seq_0123_D49R0101_02E8
	apply_movement 255, scr_seq_0123_D49R0101_0070
	wait_movement
	apply_movement 1, scr_seq_0123_D49R0101_0080
	apply_movement 255, scr_seq_0123_D49R0101_0078
scr_seq_0123_D49R0101_018E:
	wait_movement
	npc_msg 82
	closemsg
	npc_msg 83
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	npc_msg 84
	closemsg
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif ne, scr_seq_0123_D49R0101_01BE
	apply_movement 1, scr_seq_0123_D49R0101_0328
	goto scr_seq_0123_D49R0101_01E1

scr_seq_0123_D49R0101_01BE:
	comparevartovalue VAR_TEMP_x400A, 3
	gotoif ne, scr_seq_0123_D49R0101_01D9
	apply_movement 1, scr_seq_0123_D49R0101_0338
	goto scr_seq_0123_D49R0101_01E1

scr_seq_0123_D49R0101_01D9:
	apply_movement 1, scr_seq_0123_D49R0101_0348
scr_seq_0123_D49R0101_01E1:
	apply_movement 255, scr_seq_0123_D49R0101_0078
	wait_movement
	hide_person 1
	setflag FLAG_UNK_227
	releaseall
	setvar VAR_UNK_40E2, 1
	end

scr_seq_0123_D49R0101_01FD:
	.byte 0x00, 0x00, 0x00

scr_seq_0123_D49R0101_0200:
	step 71, 1
	step 55, 1
	step 72, 1
	step 65, 2
	step 18, 1
	step_end

scr_seq_0123_D49R0101_0218:
	step 71, 1
	step 53, 1
	step 72, 1
	step 65, 2
	step 16, 1
	step_end

scr_seq_0123_D49R0101_0230:
	step 75, 1
	step 33, 1
	step_end

scr_seq_0123_D49R0101_023C:
	step 75, 1
	step 33, 1
	step_end

scr_seq_0123_D49R0101_0248:
	step 23, 1
	step 76, 10
	step 34, 1
	step_end

scr_seq_0123_D49R0101_0258:
	step 76, 9
	step_end

scr_seq_0123_D49R0101_0260:
	step 61, 1
	step 63, 8
	step 35, 1
	step_end

scr_seq_0123_D49R0101_0270:
	step 33, 1
	step 63, 1
	step 32, 1
	step 63, 1
	step 19, 6
	step 16, 6
	step 14, 1
	step 69, 1
	step 65, 2
	step 3, 1
	step 70, 1
	step 15, 1
	step 17, 6
	step 18, 6
	step_end

scr_seq_0123_D49R0101_02AC:
	step 19, 7
	step 33, 1
	step 63, 1
	step 32, 1
	step 63, 1
	step 16, 7
	step 14, 1
	step 69, 1
	step 65, 2
	step 3, 1
	step 70, 1
	step 15, 1
	step 17, 6
	step 18, 6
	step_end

scr_seq_0123_D49R0101_02E8:
	step 19, 7
	step 33, 1
	step 63, 1
	step 32, 1
	step 63, 1
	step 16, 7
	step 14, 1
	step 69, 1
	step 65, 2
	step 3, 1
	step 70, 1
	step 15, 1
	step 17, 7
	step 18, 7
	step 32, 1
	step_end

scr_seq_0123_D49R0101_0328:
	step 77, 2
	step 78, 1
	step 77, 8
	step_end

scr_seq_0123_D49R0101_0338:
	step 77, 1
	step 78, 1
	step 77, 9
	step_end

scr_seq_0123_D49R0101_0348:
	step 77, 9
	step_end
scr_seq_0123_D49R0101_0350:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_114
	gotoif FALSE, scr_seq_0123_D49R0101_03F1
	scrcmd_834 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0123_D49R0101_0400
	npc_msg 49
scr_seq_0123_D49R0101_0377:
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 325, 255, 0
	menu_item_add 324, 255, 1
	menu_item_add 323, 255, 2
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0123_D49R0101_03C7
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0123_D49R0101_03D7
	goto scr_seq_0123_D49R0101_03E4

scr_seq_0123_D49R0101_03C1:
	.byte 0x35, 0x00, 0x61, 0x00, 0x02, 0x00
scr_seq_0123_D49R0101_03C7:
	scrcmd_054
	scrcmd_815 0
	scrcmd_771
	goto scr_seq_0123_D49R0101_03E4

scr_seq_0123_D49R0101_03D5:
	.byte 0x02, 0x00
scr_seq_0123_D49R0101_03D7:
	touchscreen_menu_show
	npc_msg 52
	goto scr_seq_0123_D49R0101_0377

scr_seq_0123_D49R0101_03E2:
	.byte 0x02, 0x00
scr_seq_0123_D49R0101_03E4:
	touchscreen_menu_show
	npc_msg 51
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0123_D49R0101_03F1:
	npc_msg 48
	setflag FLAG_UNK_114
	goto scr_seq_0123_D49R0101_0377

scr_seq_0123_D49R0101_03FE:
	.byte 0x02, 0x00
scr_seq_0123_D49R0101_0400:
	npc_msg 50
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0123_D49R0101_040B:
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_0123_D49R0101_05B7
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_835 32780
	comparevartovalue VAR_SPECIAL_x800C, 27
	gotoif eq, scr_seq_0123_D49R0101_05A9
	checkflag FLAG_UNK_115
	gotoif FALSE, scr_seq_0123_D49R0101_0529
	npc_msg 54
scr_seq_0123_D49R0101_0443:
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 325, 255, 0
	menu_item_add 324, 255, 1
	menu_item_add 323, 255, 2
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0123_D49R0101_0493
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0123_D49R0101_04E8
	goto scr_seq_0123_D49R0101_051C

scr_seq_0123_D49R0101_048D:
	.byte 0x35, 0x00, 0x61
	.byte 0x00, 0x02, 0x00
scr_seq_0123_D49R0101_0493:
	scrcmd_054
	scrcmd_815 0
	scrcmd_772
	scrcmd_835 32773
	comparevartovalue VAR_SPECIAL_x8005, 6
	gotoif eq, scr_seq_0123_D49R0101_0538
	comparevartovalue VAR_SPECIAL_x8005, 12
	gotoif eq, scr_seq_0123_D49R0101_054B
	comparevartovalue VAR_SPECIAL_x8005, 18
	gotoif eq, scr_seq_0123_D49R0101_055E
	comparevartovalue VAR_SPECIAL_x8005, 24
	gotoif eq, scr_seq_0123_D49R0101_0571
	comparevartovalue VAR_SPECIAL_x8005, 27
	gotoif eq, scr_seq_0123_D49R0101_0595
	goto scr_seq_0123_D49R0101_051C

scr_seq_0123_D49R0101_04E6:
	.byte 0x02, 0x00
scr_seq_0123_D49R0101_04E8:
	touchscreen_menu_show
	npc_msg 55
	scrcmd_724 12, 32780
	comparevartovalue VAR_SPECIAL_x800C, 100
	gotoif lt, scr_seq_0123_D49R0101_0509
	npc_msg 57
	goto scr_seq_0123_D49R0101_0511

scr_seq_0123_D49R0101_0509:
	buffer_int 0, VAR_SPECIAL_x800C
	npc_msg 56
scr_seq_0123_D49R0101_0511:
	npc_msg 58
	goto scr_seq_0123_D49R0101_0443

scr_seq_0123_D49R0101_051A:
	.byte 0x02, 0x00
scr_seq_0123_D49R0101_051C:
	touchscreen_menu_show
	npc_msg 51
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0123_D49R0101_0529:
	npc_msg 53
	setflag FLAG_UNK_115
	goto scr_seq_0123_D49R0101_0443

scr_seq_0123_D49R0101_0536:
	.byte 0x02, 0x00
scr_seq_0123_D49R0101_0538:
	comparevartovalue VAR_UNK_4139, 0
	gotoif eq, scr_seq_0123_D49R0101_0584
	goto scr_seq_0123_D49R0101_051C

scr_seq_0123_D49R0101_054B:
	comparevartovalue VAR_UNK_4139, 1
	gotoif eq, scr_seq_0123_D49R0101_0584
	goto scr_seq_0123_D49R0101_051C

scr_seq_0123_D49R0101_055E:
	comparevartovalue VAR_UNK_4139, 2
	gotoif eq, scr_seq_0123_D49R0101_0584
	goto scr_seq_0123_D49R0101_051C

scr_seq_0123_D49R0101_0571:
	comparevartovalue VAR_UNK_4139, 3
	gotoif eq, scr_seq_0123_D49R0101_0584
	goto scr_seq_0123_D49R0101_051C

scr_seq_0123_D49R0101_0584:
	npc_msg 61
	waitbutton
	closemsg
	releaseall
	addvar VAR_UNK_4139, 1
	end

scr_seq_0123_D49R0101_0595:
	buffer_players_name 0
	npc_msg 62
	waitbutton
	closemsg
	releaseall
	addvar VAR_UNK_4139, 1
	end

scr_seq_0123_D49R0101_05A9:
	buffer_players_name 0
	npc_msg 60
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0123_D49R0101_05B7:
	end

scr_seq_0123_D49R0101_05B9:
	end

scr_seq_0123_D49R0101_05BB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 68
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0123_D49R0101_05CE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 69
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0123_D49R0101_05E1:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 70
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0123_D49R0101_05F4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 71
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0123_D49R0101_0607:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 72
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0123_D49R0101_061A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 73
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0123_D49R0101_062D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 74
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0123_D49R0101_0640:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 75
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0123_D49R0101_0653:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 76
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0123_D49R0101_0666:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 77
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0123_D49R0101_0679:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 63
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0123_D49R0101_068C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 64
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0123_D49R0101_069F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 65
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0123_D49R0101_06B2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 66
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0123_D49R0101_06C5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 67
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0123_D49R0101_06D8:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_784 3, 0
	npc_msg 85
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x8000
	menu_item_add 337, 255, 0
	menu_item_add 338, 255, 1
	menu_item_add 12, 255, 2
	menu_exec
	copyvar VAR_TEMP_x4005, VAR_SPECIAL_x8000
	comparevartovalue VAR_TEMP_x4005, 0
	gotoif ne, scr_seq_0123_D49R0101_072E
	scrcmd_113 20, 2
	goto scr_seq_0123_D49R0101_0759

scr_seq_0123_D49R0101_0728:
	.byte 0x16, 0x00, 0x1a, 0x00, 0x00, 0x00
scr_seq_0123_D49R0101_072E:
	comparevartovalue VAR_TEMP_x4005, 1
	gotoif ne, scr_seq_0123_D49R0101_0748
	scrcmd_116 2, 20, 2
	goto scr_seq_0123_D49R0101_0A7F

scr_seq_0123_D49R0101_0748:
	touchscreen_menu_show
	npc_msg 91
	waitbutton
	closemsg
	releaseall
	scrcmd_784 3, 1
	end

scr_seq_0123_D49R0101_0759:
	npc_msg 86
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x8000
	menu_item_add 209, 255, 0
	menu_item_add 210, 255, 1
	menu_item_add 211, 255, 2
	menu_item_add 212, 255, 3
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0123_D49R0101_07C0
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0123_D49R0101_07CC
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0123_D49R0101_07D8
	touchscreen_menu_show
	npc_msg 91
	goto scr_seq_0123_D49R0101_0A5C

scr_seq_0123_D49R0101_07C0:
	setvar VAR_SPECIAL_x8001, 30
	goto scr_seq_0123_D49R0101_08F8

scr_seq_0123_D49R0101_07CC:
	setvar VAR_SPECIAL_x8001, 31
	goto scr_seq_0123_D49R0101_08F8

scr_seq_0123_D49R0101_07D8:
	setvar VAR_SPECIAL_x8001, 32
	goto scr_seq_0123_D49R0101_08F8

scr_seq_0123_D49R0101_07E4:
	comparevartovalue VAR_TEMP_x4005, 0
	gotoif ne, scr_seq_0123_D49R0101_07FF
	hasenoughmoneyimmediate 32780, 200
	goto scr_seq_0123_D49R0101_0812

scr_seq_0123_D49R0101_07FF:
	comparevartovalue VAR_TEMP_x4005, 1
	gotoif ne, scr_seq_0123_D49R0101_0812
	scrcmd_124 32780, 50
scr_seq_0123_D49R0101_0812:
	return

scr_seq_0123_D49R0101_0814:
	comparevartovalue VAR_TEMP_x4005, 0
	gotoif ne, scr_seq_0123_D49R0101_082F
	hasenoughmoneyimmediate 32780, 300
	goto scr_seq_0123_D49R0101_0842

scr_seq_0123_D49R0101_082F:
	comparevartovalue VAR_TEMP_x4005, 1
	gotoif ne, scr_seq_0123_D49R0101_0842
	scrcmd_124 32780, 80
scr_seq_0123_D49R0101_0842:
	return

scr_seq_0123_D49R0101_0844:
	comparevartovalue VAR_TEMP_x4005, 0
	gotoif ne, scr_seq_0123_D49R0101_085F
	hasenoughmoneyimmediate 32780, 350
	goto scr_seq_0123_D49R0101_0872

scr_seq_0123_D49R0101_085F:
	comparevartovalue VAR_TEMP_x4005, 1
	gotoif ne, scr_seq_0123_D49R0101_0872
	scrcmd_124 32780, 100
scr_seq_0123_D49R0101_0872:
	return

scr_seq_0123_D49R0101_0874:
	comparevartovalue VAR_TEMP_x4005, 0
	gotoif ne, scr_seq_0123_D49R0101_088D
	submoneyimmediate 200
	goto scr_seq_0123_D49R0101_089E

scr_seq_0123_D49R0101_088D:
	comparevartovalue VAR_TEMP_x4005, 1
	gotoif ne, scr_seq_0123_D49R0101_089E
	scrcmd_123 50
scr_seq_0123_D49R0101_089E:
	return

scr_seq_0123_D49R0101_08A0:
	comparevartovalue VAR_TEMP_x4005, 0
	gotoif ne, scr_seq_0123_D49R0101_08B9
	submoneyimmediate 300
	goto scr_seq_0123_D49R0101_08CA

scr_seq_0123_D49R0101_08B9:
	comparevartovalue VAR_TEMP_x4005, 1
	gotoif ne, scr_seq_0123_D49R0101_08CA
	scrcmd_123 80
scr_seq_0123_D49R0101_08CA:
	return

scr_seq_0123_D49R0101_08CC:
	comparevartovalue VAR_TEMP_x4005, 0
	gotoif ne, scr_seq_0123_D49R0101_08E5
	submoneyimmediate 350
	goto scr_seq_0123_D49R0101_08F6

scr_seq_0123_D49R0101_08E5:
	comparevartovalue VAR_TEMP_x4005, 1
	gotoif ne, scr_seq_0123_D49R0101_08F6
	scrcmd_123 100
scr_seq_0123_D49R0101_08F6:
	return

scr_seq_0123_D49R0101_08F8:
	comparevartovalue VAR_SPECIAL_x8000, 0
	callif eq, scr_seq_0123_D49R0101_07E4
	comparevartovalue VAR_SPECIAL_x8000, 1
	callif eq, scr_seq_0123_D49R0101_0814
	comparevartovalue VAR_SPECIAL_x8000, 2
	callif eq, scr_seq_0123_D49R0101_0844
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0123_D49R0101_0A07
	hasspaceforitem VAR_SPECIAL_x8001, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0123_D49R0101_0A35
	comparevartovalue VAR_SPECIAL_x8000, 0
	callif eq, scr_seq_0123_D49R0101_0874
	comparevartovalue VAR_SPECIAL_x8000, 1
	callif eq, scr_seq_0123_D49R0101_08A0
	comparevartovalue VAR_SPECIAL_x8000, 2
	callif eq, scr_seq_0123_D49R0101_08CC
	comparevartovalue VAR_TEMP_x4005, 0
	gotoif ne, scr_seq_0123_D49R0101_097D
	scrcmd_115
	goto scr_seq_0123_D49R0101_098D

scr_seq_0123_D49R0101_097D:
	comparevartovalue VAR_TEMP_x4005, 1
	gotoif ne, scr_seq_0123_D49R0101_098D
	scrcmd_118 2
scr_seq_0123_D49R0101_098D:
	buffer_item_name 0, VAR_SPECIAL_x8001
	play_se SEQ_SE_DP_JIHANKI
	buffer_item_name 0, VAR_SPECIAL_x8001
	npc_msg 87
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x8001
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	scrcmd_380 32780, 64
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0123_D49R0101_09E6
	play_se SEQ_SE_DP_JIHANKI
	buffer_item_name 0, VAR_SPECIAL_x8001
	npc_msg 88
	hasspaceforitem VAR_SPECIAL_x8001, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0123_D49R0101_0A35
	callstd std_give_item_verbose
scr_seq_0123_D49R0101_09E6:
	comparevartovalue VAR_TEMP_x4005, 0
	gotoif ne, scr_seq_0123_D49R0101_09FF
	goto scr_seq_0123_D49R0101_0759

scr_seq_0123_D49R0101_09F9:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_0123_D49R0101_09FF:
	goto scr_seq_0123_D49R0101_0A7F

scr_seq_0123_D49R0101_0A05:
	.byte 0x02, 0x00
scr_seq_0123_D49R0101_0A07:
	touchscreen_menu_show
	comparevartovalue VAR_TEMP_x4005, 0
	gotoif ne, scr_seq_0123_D49R0101_0A1F
	npc_msg 89
	goto scr_seq_0123_D49R0101_0A2F

scr_seq_0123_D49R0101_0A1F:
	comparevartovalue VAR_TEMP_x4005, 1
	gotoif ne, scr_seq_0123_D49R0101_0A2F
	npc_msg 90
scr_seq_0123_D49R0101_0A2F:
	goto scr_seq_0123_D49R0101_0A5C

scr_seq_0123_D49R0101_0A35:
	touchscreen_menu_show
	callstd std_bag_is_full
	closemsg
	comparevartovalue VAR_TEMP_x4005, 0
	gotoif ne, scr_seq_0123_D49R0101_0A52
	scrcmd_114
	goto scr_seq_0123_D49R0101_0A54

scr_seq_0123_D49R0101_0A52:
	scrcmd_117
scr_seq_0123_D49R0101_0A54:
	scrcmd_784 3, 1
	releaseall
	end

scr_seq_0123_D49R0101_0A5C:
	waitbutton
	closemsg
	comparevartovalue VAR_TEMP_x4005, 0
	gotoif ne, scr_seq_0123_D49R0101_0A75
	scrcmd_114
	goto scr_seq_0123_D49R0101_0A77

scr_seq_0123_D49R0101_0A75:
	scrcmd_117
scr_seq_0123_D49R0101_0A77:
	scrcmd_784 3, 1
	releaseall
	end

scr_seq_0123_D49R0101_0A7F:
	npc_msg 86
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x8000
	menu_item_add 339, 255, 0
	menu_item_add 340, 255, 1
	menu_item_add 341, 255, 2
	menu_item_add 212, 255, 3
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0123_D49R0101_07C0
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0123_D49R0101_07CC
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0123_D49R0101_07D8
	touchscreen_menu_show
	npc_msg 91
	goto scr_seq_0123_D49R0101_0A5C

scr_seq_0123_D49R0101_0AE6:
	.byte 0x02, 0x00
scr_seq_0123_D49R0101_0AE8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 92
scr_seq_0123_D49R0101_0AF3:
	npc_msg 93
	touchscreen_menu_hide
	menu_init 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 94, 255, 0
	menu_item_add 95, 255, 1
	menu_item_add 96, 255, 2
	menu_item_add 97, 255, 3
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0123_D49R0101_0B57
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0123_D49R0101_0B65
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0123_D49R0101_0B73
	goto scr_seq_0123_D49R0101_0BA5

scr_seq_0123_D49R0101_0B55:
	.byte 0x02, 0x00
scr_seq_0123_D49R0101_0B57:
	setvar VAR_TEMP_x4007, 0
	goto scr_seq_0123_D49R0101_0B81

scr_seq_0123_D49R0101_0B63:
	.byte 0x02, 0x00
scr_seq_0123_D49R0101_0B65:
	setvar VAR_TEMP_x4007, 1
	goto scr_seq_0123_D49R0101_0B81

scr_seq_0123_D49R0101_0B71:
	.byte 0x02, 0x00
scr_seq_0123_D49R0101_0B73:
	setvar VAR_TEMP_x4007, 2
	goto scr_seq_0123_D49R0101_0B81

scr_seq_0123_D49R0101_0B7F:
	.byte 0x02
	.byte 0x00
scr_seq_0123_D49R0101_0B81:
	npc_msg 98
	wait 4, VAR_SPECIAL_x800C
	npc_msg 99
	wait 4, VAR_SPECIAL_x800C
	closemsg
	play_se SEQ_SE_DP_DECIDE
	scrcmd_743 16391
	goto scr_seq_0123_D49R0101_0AF3

scr_seq_0123_D49R0101_0BA3:
	.byte 0x02, 0x00
scr_seq_0123_D49R0101_0BA5:
	touchscreen_menu_show
	npc_msg 101
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0123_D49R0101_0BB2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_152
	gotoif TRUE, scr_seq_0123_D49R0101_0C4C
	npc_msg 103
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0123_D49R0101_0BFE
	npc_msg 105
	scrcmd_724 14, 16384
	comparevartovalue VAR_TEMP_x4000, 1000
	gotoif ge, scr_seq_0123_D49R0101_0C09
	npc_msg 106
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0123_D49R0101_0BFE:
	npc_msg 104
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0123_D49R0101_0C09:
	npc_msg 107
	setvar VAR_SPECIAL_x8004, 50
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0123_D49R0101_0C42
	callstd std_give_item_verbose
	scrcmd_725 0, 100
	setflag FLAG_UNK_152
	goto scr_seq_0123_D49R0101_0C4C

scr_seq_0123_D49R0101_0C40:
	.byte 0x02, 0x00
scr_seq_0123_D49R0101_0C42:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_0123_D49R0101_0C4C:
	npc_msg 108
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0123_D49R0101_0C57:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_153
	gotoif TRUE, scr_seq_0123_D49R0101_0CF0
	scrcmd_724 15, 16384
	comparevartovalue VAR_TEMP_x4000, 500
	gotoif ge, scr_seq_0123_D49R0101_0C86
	npc_msg 109
	goto scr_seq_0123_D49R0101_0C9F

scr_seq_0123_D49R0101_0C86:
	comparevartovalue VAR_TEMP_x4000, 1000
	gotoif ge, scr_seq_0123_D49R0101_0C9C
	npc_msg 111
	goto scr_seq_0123_D49R0101_0C9F

scr_seq_0123_D49R0101_0C9C:
	npc_msg 112
scr_seq_0123_D49R0101_0C9F:
	comparevartovalue VAR_TEMP_x4000, 2001
	gotoif ge, scr_seq_0123_D49R0101_0CB7
	npc_msg 110
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0123_D49R0101_0CB7:
	npc_msg 113
	setvar VAR_SPECIAL_x8004, 50
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0123_D49R0101_0C42
	callstd std_give_item_verbose
	scrcmd_725 0, 100
	setflag FLAG_UNK_153
	goto scr_seq_0123_D49R0101_0CF0

scr_seq_0123_D49R0101_0CEE:
	.byte 0x02, 0x00
scr_seq_0123_D49R0101_0CF0:
	npc_msg 114
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
