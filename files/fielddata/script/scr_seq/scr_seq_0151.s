#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0151_009C ; 000
	scrdef scr_seq_0151_00B3 ; 001
	scrdef scr_seq_0151_00CA ; 002
	scrdef scr_seq_0151_00CC ; 003
	scrdef scr_seq_0151_00CE ; 004
	scrdef scr_seq_0151_00FD ; 005
	scrdef scr_seq_0151_0307 ; 006
	scrdef scr_seq_0151_0340 ; 007
	scrdef scr_seq_0151_054C ; 008
	scrdef scr_seq_0151_055F ; 009
	scrdef scr_seq_0151_0594 ; 010
	scrdef scr_seq_0151_05A7 ; 011
	scrdef scr_seq_0151_05DC ; 012
	scrdef scr_seq_0151_05EF ; 013
	scrdef scr_seq_0151_0624 ; 014
	scrdef scr_seq_0151_0637 ; 015
	scrdef scr_seq_0151_066C ; 016
	scrdef scr_seq_0151_067F ; 017
	scrdef scr_seq_0151_06B4 ; 018
	scrdef scr_seq_0151_06C7 ; 019
	scrdef scr_seq_0151_06FC ; 020
	scrdef scr_seq_0151_070F ; 021
	scrdef scr_seq_0151_0744 ; 022
	scrdef scr_seq_0151_0757 ; 023
	scrdef scr_seq_0151_078C ; 024
	scrdef scr_seq_0151_079F ; 025
	scrdef scr_seq_0151_07D4 ; 026
	scrdef scr_seq_0151_07E7 ; 027
	scrdef scr_seq_0151_081C ; 028
	scrdef_end

scr_seq_0151_0076:
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_176 96, 0, 46, 50, 0
	fade_screen 6, 1, 1, 0x00
	wait_fade
	return

scr_seq_0151_009C:
	scrcmd_609
	lockall
	play_se SEQ_SE_DP_PINPON
	npc_msg 0
	closemsg
	call scr_seq_0151_0076
	releaseall
	end

scr_seq_0151_00B3:
	scrcmd_609
	lockall
	play_se SEQ_SE_DP_PINPON
	npc_msg 1
	closemsg
	call scr_seq_0151_0076
	releaseall
	end

scr_seq_0151_00CA:
	end

scr_seq_0151_00CC:
	end

scr_seq_0151_00CE:
	scrcmd_609
	lockall
	scrcmd_789 0
	npc_msg 3
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0151_00F9
	call scr_seq_0151_0076
	releaseall
	end

scr_seq_0151_00F9:
	releaseall
	end

scr_seq_0151_00FD:
	comparevartovalue VAR_UNK_4058, 0
	gotoif eq, scr_seq_0151_0114
	call scr_seq_0151_02BC
	endstd
	end

scr_seq_0151_0114:
	checkflag FLAG_UNK_AA7
	gotoif TRUE, scr_seq_0151_02A6
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_0151_0139
	npc_msg 4
	goto scr_seq_0151_016E

scr_seq_0151_0139:
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, scr_seq_0151_014F
	npc_msg 5
	goto scr_seq_0151_016E

scr_seq_0151_014F:
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_0151_0165
	npc_msg 6
	goto scr_seq_0151_016E

scr_seq_0151_0165:
	npc_msg 7
	goto scr_seq_0151_0260

scr_seq_0151_016E:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0151_018E
	npc_msg 17
	goto scr_seq_0151_0260

scr_seq_0151_018C:
	.byte 0x02, 0x00
scr_seq_0151_018E:
	count_pc_empty_space VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0151_01B0
	get_party_count VAR_SPECIAL_x8004
	comparevartovalue VAR_SPECIAL_x8004, 6
	gotoif eq, scr_seq_0151_02B1
scr_seq_0151_01B0:
	count_alive_mons VAR_SPECIAL_x8005, 6
	comparevartovalue VAR_SPECIAL_x8005, 1
	gotoif ne, scr_seq_0151_01D4
	get_party_count VAR_SPECIAL_x8004
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif eq, scr_seq_0151_021A
scr_seq_0151_01D4:
	get_lead_mon_index VAR_SPECIAL_x800C
	bufferpartymonnick 0, VAR_SPECIAL_x800C
	npc_msg 10
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0151_0200
	npc_msg 28
	goto scr_seq_0151_0260

scr_seq_0151_01FE:
	.byte 0x02, 0x00
scr_seq_0151_0200:
	fade_out_bgm 0, 10
	play_bgm SEQ_GS_TAIKAIMAE
	buffer_players_name 0
	npc_msg 13
	setflag FLAG_UNK_15F
	goto scr_seq_0151_0224

scr_seq_0151_021A:
	fade_out_bgm 0, 10
	play_bgm SEQ_GS_TAIKAIMAE
scr_seq_0151_0224:
	buffer_players_name 0
	npc_msg 14
	npc_msg 15
	setflag FLAG_UNK_993
	setflag FLAG_UNK_24E
	setvar VAR_UNK_4118, 1
	setvar VAR_UNK_40F7, 1
	scrcmd_784 1, 0
	scrcmd_785 0, 16384
	call scr_seq_0151_0268
	scrcmd_784 1, 1
	setflag FLAG_UNK_996
	goto scr_seq_0151_0262

scr_seq_0151_025E:
	.byte 0x02, 0x00
scr_seq_0151_0260:
	waitbutton
scr_seq_0151_0262:
	closemsg
	endstd
	end

scr_seq_0151_0268:
	setvar VAR_SPECIAL_x8004, 0
	setvar VAR_SPECIAL_x8005, 627
scr_seq_0151_0274:
	scrcmd_790 32772, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0151_028B
	setflagvar VAR_SPECIAL_x8005
scr_seq_0151_028B:
	addvar VAR_SPECIAL_x8004, 1
	addvar VAR_SPECIAL_x8005, 1
	comparevartovalue VAR_SPECIAL_x8004, 10
	gotoif lt, scr_seq_0151_0274
	return

scr_seq_0151_02A6:
	npc_msg 18
	goto scr_seq_0151_0260

scr_seq_0151_02AF:
	.byte 0x02
	.byte 0x00
scr_seq_0151_02B1:
	npc_msg 16
	goto scr_seq_0151_0260

scr_seq_0151_02BA:
	.byte 0x02, 0x00
scr_seq_0151_02BC:
	buffer_players_name 0
	npc_msg 20
	hasspaceforitem VAR_UNK_4058, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0151_02F3
	copyvar VAR_SPECIAL_x8004, VAR_UNK_4058
	setvar VAR_SPECIAL_x8005, 1
	callstd 2008
	setvar VAR_UNK_4058, 0
	goto scr_seq_0151_02F8

scr_seq_0151_02F3:
	npc_msg 21
	waitbutton
scr_seq_0151_02F8:
	closemsg
	return

scr_seq_0151_02FC:
	.byte 0x2d, 0x00, 0x12, 0x16
	.byte 0x00, 0x5b, 0xff, 0xff, 0xff, 0x02, 0x00
scr_seq_0151_0307:
	scrcmd_789 0
	npc_msg 23
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0151_032B
	npc_msg 26
	closemsg
	endstd
	end

scr_seq_0151_032B:
	npc_msg 27
	closemsg
	setvar VAR_UNK_4118, 2
	call scr_seq_0151_0076
	endstd
	end

scr_seq_0151_0340:
	scrcmd_609
	lockall
	setvar VAR_UNK_4118, 0
	setvar VAR_UNK_40F7, 0
	scrcmd_784 1, 0
	scrcmd_787 16384, 16385, 16386
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_102 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	apply_movement 241, scr_seq_0151_053C
	wait_movement
	npc_msg 29
	scrcmd_786 2
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_0151_038E
	npc_msg 30
	goto scr_seq_0151_0391

scr_seq_0151_038E:
	npc_msg 31
scr_seq_0151_0391:
	play_fanfare SEQ_ME_MUSHITORI3
	wait_fanfare
	npc_msg 32
	scrcmd_786 1
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_0151_03B3
	npc_msg 33
	goto scr_seq_0151_03B6

scr_seq_0151_03B3:
	npc_msg 34
scr_seq_0151_03B6:
	play_fanfare SEQ_ME_MUSHITORI2
	wait_fanfare
	npc_msg 32
	scrcmd_786 0
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0151_03DC
	setflag FLAG_UNK_141
	npc_msg 35
	goto scr_seq_0151_03E3

scr_seq_0151_03DC:
	clearflag FLAG_UNK_141
	npc_msg 36
scr_seq_0151_03E3:
	play_fanfare SEQ_ME_MUSHITORI1
	wait_fanfare
	npc_msg 32
	buffer_players_name 0
	buffer_item_name 3, VAR_TEMP_x4001
	setvar VAR_SPECIAL_x8004, 37
	addvar VAR_SPECIAL_x8004, VAR_TEMP_x4000
	scrcmd_046 VAR_SPECIAL_x8004
	copyvar VAR_SPECIAL_x8004, VAR_TEMP_x4001
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0151_042F
	callstd std_give_item_verbose
	goto scr_seq_0151_043B

scr_seq_0151_042F:
	buffer_players_name 0
	npc_msg 45
	copyvar VAR_UNK_4058, VAR_TEMP_x4001
scr_seq_0151_043B:
	checkflag FLAG_UNK_15F
	callif TRUE, scr_seq_0151_04F6
	npc_msg 42
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_0151_045E
	closemsg
	goto scr_seq_0151_04B5

scr_seq_0151_045E:
	buffer_species_name 1, VAR_TEMP_x4002, 2, 1
	npc_msg 43
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0151_049E
	fade_screen 6, 1, 0, 0x00
	wait_fade
	nickname_input 255, VAR_SPECIAL_x800C
	fade_screen 6, 1, 1, 0x00
	wait_fade
scr_seq_0151_049E:
	scrcmd_788 5, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0151_04B5
	npc_msg 46
	closemsg
scr_seq_0151_04B5:
	apply_movement 241, scr_seq_0151_0544
	wait_movement
	fade_out_bgm 0, 10
	play_bgm SEQ_GS_D_KOUEN
	scrcmd_103
	call scr_seq_0151_04FD
	setflag FLAG_UNK_AA7
	clearflag FLAG_UNK_993
	clearflag FLAG_UNK_24E
	clearflag FLAG_UNK_15F
	scrcmd_785 1, 0
	scrcmd_784 1, 1
	fade_out_bgm 0, 30
	reset_bgm
	releaseall
	end

scr_seq_0151_04F6:
	npc_msg 47
	closemsg
	return

scr_seq_0151_04FD:
	setvar VAR_SPECIAL_x8004, 0
	setvar VAR_SPECIAL_x8005, 10
	setvar VAR_SPECIAL_x8006, 627
scr_seq_0151_050F:
	scrcmd_109 VAR_SPECIAL_x8005, 2
	clearflagvar VAR_SPECIAL_x8006
	addvar VAR_SPECIAL_x8004, 1
	addvar VAR_SPECIAL_x8005, 1
	addvar VAR_SPECIAL_x8006, 1
	comparevartovalue VAR_SPECIAL_x8004, 10
	gotoif lt, scr_seq_0151_050F
	return

scr_seq_0151_053A:
	.byte 0x00, 0x00

scr_seq_0151_053C:
	step 15, 5
	step_end

scr_seq_0151_0544:
	step 14, 5
	step_end
scr_seq_0151_054C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 48
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0151_055F:
	checkflag FLAG_UNK_141
	gotoif TRUE, scr_seq_0151_0581
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 49
	waitbutton
	closemsg
	releaseall
	goto scr_seq_0151_0592

scr_seq_0151_0581:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 50
	waitbutton
	closemsg
	releaseall
scr_seq_0151_0592:
	end

scr_seq_0151_0594:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 51
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0151_05A7:
	checkflag FLAG_UNK_141
	gotoif TRUE, scr_seq_0151_05C9
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 52
	waitbutton
	closemsg
	releaseall
	goto scr_seq_0151_05DA

scr_seq_0151_05C9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 53
	waitbutton
	closemsg
	releaseall
scr_seq_0151_05DA:
	end

scr_seq_0151_05DC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 54
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0151_05EF:
	checkflag FLAG_UNK_141
	gotoif TRUE, scr_seq_0151_0611
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 55
	waitbutton
	closemsg
	releaseall
	goto scr_seq_0151_0622

scr_seq_0151_0611:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 56
	waitbutton
	closemsg
	releaseall
scr_seq_0151_0622:
	end

scr_seq_0151_0624:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 57
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0151_0637:
	checkflag FLAG_UNK_141
	gotoif TRUE, scr_seq_0151_0659
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 58
	waitbutton
	closemsg
	releaseall
	goto scr_seq_0151_066A

scr_seq_0151_0659:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 59
	waitbutton
	closemsg
	releaseall
scr_seq_0151_066A:
	end

scr_seq_0151_066C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 60
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0151_067F:
	checkflag FLAG_UNK_141
	gotoif TRUE, scr_seq_0151_06A1
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 61
	waitbutton
	closemsg
	releaseall
	goto scr_seq_0151_06B2

scr_seq_0151_06A1:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 62
	waitbutton
	closemsg
	releaseall
scr_seq_0151_06B2:
	end

scr_seq_0151_06B4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 63
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0151_06C7:
	checkflag FLAG_UNK_141
	gotoif TRUE, scr_seq_0151_06E9
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 64
	waitbutton
	closemsg
	releaseall
	goto scr_seq_0151_06FA

scr_seq_0151_06E9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 65
	waitbutton
	closemsg
	releaseall
scr_seq_0151_06FA:
	end

scr_seq_0151_06FC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 66
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0151_070F:
	checkflag FLAG_UNK_141
	gotoif TRUE, scr_seq_0151_0731
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 67
	waitbutton
	closemsg
	releaseall
	goto scr_seq_0151_0742

scr_seq_0151_0731:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 68
	waitbutton
	closemsg
	releaseall
scr_seq_0151_0742:
	end

scr_seq_0151_0744:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 69
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0151_0757:
	checkflag FLAG_UNK_141
	gotoif TRUE, scr_seq_0151_0779
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 70
	waitbutton
	closemsg
	releaseall
	goto scr_seq_0151_078A

scr_seq_0151_0779:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 71
	waitbutton
	closemsg
	releaseall
scr_seq_0151_078A:
	end

scr_seq_0151_078C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 72
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0151_079F:
	checkflag FLAG_UNK_141
	gotoif TRUE, scr_seq_0151_07C1
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 73
	waitbutton
	closemsg
	releaseall
	goto scr_seq_0151_07D2

scr_seq_0151_07C1:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 74
	waitbutton
	closemsg
	releaseall
scr_seq_0151_07D2:
	end

scr_seq_0151_07D4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 75
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0151_07E7:
	checkflag FLAG_UNK_141
	gotoif TRUE, scr_seq_0151_0809
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 76
	waitbutton
	closemsg
	releaseall
	goto scr_seq_0151_081A

scr_seq_0151_0809:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 77
	waitbutton
	closemsg
	releaseall
scr_seq_0151_081A:
	end

scr_seq_0151_081C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4058, 0
	gotoif eq, scr_seq_0151_083D
	call scr_seq_0151_02BC
	goto scr_seq_0151_0844

scr_seq_0151_083D:
	npc_msg 22
	waitbutton
	closemsg
scr_seq_0151_0844:
	releaseall
	end
	.balign 4, 0
