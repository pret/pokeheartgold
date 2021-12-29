#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0837_T11R0701_0108 ; 000
	scrdef scr_seq_0837_T11R0701_011B ; 001
	scrdef scr_seq_0837_T11R0701_001A ; 002
	scrdef scr_seq_0837_T11R0701_0530 ; 003
	scrdef scr_seq_0837_T11R0701_016F ; 004
	scrdef scr_seq_0837_T11R0701_00CB ; 005
	scrdef_end

scr_seq_0837_T11R0701_001A:
	setvar VAR_TEMP_x4008, 0
	setvar VAR_TEMP_x4009, 0
	comparevartovalue VAR_UNK_4130, 3
	gotoif eq, scr_seq_0837_T11R0701_0046
	scrcmd_389 16384, 479
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0837_T11R0701_00AB
scr_seq_0837_T11R0701_0046:
	setvar VAR_TEMP_x4009, 1
	clearflag FLAG_UNK_281
	clearflag FLAG_UNK_282
	checkflag FLAG_UNK_167
	gotoif TRUE, scr_seq_0837_T11R0701_0099
	comparevartovalue VAR_UNK_4130, 4
	gotoif eq, scr_seq_0837_T11R0701_0099
	comparevartovalue VAR_UNK_4130, 1
	gotoif le, scr_seq_0837_T11R0701_0099
	comparevartovalue VAR_UNK_40FD, 0
	gotoif eq, scr_seq_0837_T11R0701_0099
	clearflag FLAG_UNK_2FA
	comparevartovalue VAR_UNK_4130, 5
	callif eq, scr_seq_0837_T11R0701_00A5
	end

scr_seq_0837_T11R0701_0099:
	setflag FLAG_UNK_2FA
	call scr_seq_0837_T11R0701_00C3
	end

scr_seq_0837_T11R0701_00A5:
	setflag FLAG_UNK_317
	return

scr_seq_0837_T11R0701_00AB:
	setflag FLAG_UNK_0A0
	setflag FLAG_UNK_281
	setflag FLAG_UNK_282
	setflag FLAG_UNK_2FA
	call scr_seq_0837_T11R0701_00C3
	end

scr_seq_0837_T11R0701_00C3:
	setvar VAR_TEMP_x4008, 1
	return

scr_seq_0837_T11R0701_00CB:
	comparevartovalue VAR_TEMP_x4009, 1
	gotoif ne, scr_seq_0837_T11R0701_00E0
	scrcmd_342 1, 23, 2
scr_seq_0837_T11R0701_00E0:
	comparevartovalue VAR_TEMP_x4008, 0
	gotoif ne, scr_seq_0837_T11R0701_0106
	comparevartovalue VAR_UNK_4130, 3
	gotoif gt, scr_seq_0837_T11R0701_0106
	move_person 2, 22, 0, 8, 0
scr_seq_0837_T11R0701_0106:
	end

scr_seq_0837_T11R0701_0108:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0837_T11R0701_011B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_130
	gotoif TRUE, scr_seq_0837_T11R0701_015A
	npc_msg 1
	setvar VAR_SPECIAL_x8004, 252
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0837_T11R0701_0165
	callstd std_give_item_verbose
	setflag FLAG_UNK_130
scr_seq_0837_T11R0701_015A:
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0837_T11R0701_0165:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_0837_T11R0701_016F:
	checkflag FLAG_UNK_177
	gotoif TRUE, scr_seq_0837_T11R0701_03E8
	comparevartovalue VAR_UNK_4130, 3
	gotoif eq, scr_seq_0837_T11R0701_039B
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_UNK_4130, 3
	npc_msg 14
	closemsg
	scrcmd_386 VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_0837_T11R0701_01B7
	apply_movement 2, scr_seq_0837_T11R0701_03AC
	goto scr_seq_0837_T11R0701_01DA

scr_seq_0837_T11R0701_01B7:
	comparevartovalue VAR_TEMP_x4002, 2
	gotoif ne, scr_seq_0837_T11R0701_01D2
	apply_movement 2, scr_seq_0837_T11R0701_03BC
	goto scr_seq_0837_T11R0701_01DA

scr_seq_0837_T11R0701_01D2:
	apply_movement 2, scr_seq_0837_T11R0701_03B4
scr_seq_0837_T11R0701_01DA:
	wait_movement
	apply_movement 2, scr_seq_0837_T11R0701_03C4
	wait_movement
	npc_msg 15
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_0837_T11R0701_0204
	apply_movement 2, scr_seq_0837_T11R0701_03AC
	goto scr_seq_0837_T11R0701_0227

scr_seq_0837_T11R0701_0204:
	comparevartovalue VAR_TEMP_x4002, 2
	gotoif ne, scr_seq_0837_T11R0701_021F
	apply_movement 2, scr_seq_0837_T11R0701_03BC
	goto scr_seq_0837_T11R0701_0227

scr_seq_0837_T11R0701_021F:
	apply_movement 2, scr_seq_0837_T11R0701_03B4
scr_seq_0837_T11R0701_0227:
	wait_movement
	npc_msg 16
scr_seq_0837_T11R0701_022C:
	touchscreen_menu_hide
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x8004
	scrcmd_751 17, 255, 0
	scrcmd_751 18, 255, 1
	scrcmd_751 19, 255, 2
	scrcmd_751 27, 255, 3
	scrcmd_752
	touchscreen_menu_show
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8004
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0837_T11R0701_0346
	get_party_count VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, scr_seq_0837_T11R0701_033B
	comparevartovalue VAR_SPECIAL_x8004, 0
	gotoif ne, scr_seq_0837_T11R0701_0297
	setvar VAR_SPECIAL_x8004, 252
	goto scr_seq_0837_T11R0701_02B6

scr_seq_0837_T11R0701_0297:
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif ne, scr_seq_0837_T11R0701_02B0
	setvar VAR_SPECIAL_x8004, 255
	goto scr_seq_0837_T11R0701_02B6

scr_seq_0837_T11R0701_02B0:
	setvar VAR_SPECIAL_x8004, 258
scr_seq_0837_T11R0701_02B6:
	buffer_species_name_custom 1, VAR_SPECIAL_x8004, 0, 0
	buffer_players_name 0
	npc_msg 20
	play_fanfare SEQ_ME_POKEGET
	npc_msg 21
	wait_fanfare
	give_mon VAR_SPECIAL_x8004, 5, 0, 0, 0, VAR_SPECIAL_x800C
	touchscreen_menu_hide
	npc_msg 25
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0837_T11R0701_0351
	touchscreen_menu_show
scr_seq_0837_T11R0701_02F3:
	npc_msg 22
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0837_T11R0701_0317
	apply_movement 2, scr_seq_0837_T11R0701_03DC
	goto scr_seq_0837_T11R0701_031F

scr_seq_0837_T11R0701_0317:
	apply_movement 2, scr_seq_0837_T11R0701_03CC
scr_seq_0837_T11R0701_031F:
	wait_movement
	hide_person 2
	setflag FLAG_UNK_2FA
	setflag FLAG_UNK_177
	setvar VAR_UNK_4130, 4
	clearflag FLAG_UNK_317
	releaseall
	end

scr_seq_0837_T11R0701_033B:
	npc_msg 23
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0837_T11R0701_0346:
	npc_msg 28
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0837_T11R0701_0351:
	closemsg
	get_party_count VAR_SPECIAL_x800C
	subvar VAR_SPECIAL_x800C, 1
	setvar VAR_TEMP_x4000, 0
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_815 0
	nickname_input VAR_SPECIAL_x800C, VAR_TEMP_x4000
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0837_T11R0701_02F3
	npc_msg 26
	goto scr_seq_0837_T11R0701_02F3

scr_seq_0837_T11R0701_039B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 24
	goto scr_seq_0837_T11R0701_022C


scr_seq_0837_T11R0701_03AC:
	.short 33, 1
	.short 254, 0

scr_seq_0837_T11R0701_03B4:
	.short 34, 1
	.short 254, 0

scr_seq_0837_T11R0701_03BC:
	.short 35, 1
	.short 254, 0

scr_seq_0837_T11R0701_03C4:
	.short 75, 1
	.short 254, 0

scr_seq_0837_T11R0701_03CC:
	.short 14, 2
	.short 13, 3
	.short 14, 8
	.short 254, 0

scr_seq_0837_T11R0701_03DC:
	.short 13, 3
	.short 14, 10
	.short 254, 0
scr_seq_0837_T11R0701_03E8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_UNK_4130, 6
	comparevartovalue VAR_TEMP_x400A, 77
	gotoif ne, scr_seq_0837_T11R0701_040C
	npc_msg 8
	goto scr_seq_0837_T11R0701_0415

scr_seq_0837_T11R0701_040C:
	npc_msg 7
	setvar VAR_TEMP_x400A, 77
scr_seq_0837_T11R0701_0415:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0837_T11R0701_04EA
	npc_msg 9
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_566
	scrcmd_351 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0837_T11R0701_04EA
	scrcmd_470 12
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_382 VAR_TEMP_x4002, VAR_SPECIAL_x8004
	get_partymon_species VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_472 32780
	comparevartovar VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	gotoif ne, scr_seq_0837_T11R0701_04F5
	scrcmd_473 32772
	scrcmd_474
	setflag FLAG_UNK_167
	comparevartovalue VAR_TEMP_x4002, 200
	gotoif lt, scr_seq_0837_T11R0701_04A2
	npc_msg 13
	goto scr_seq_0837_T11R0701_04A5

scr_seq_0837_T11R0701_04A2:
	npc_msg 12
scr_seq_0837_T11R0701_04A5:
	closemsg
	scrcmd_386 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0837_T11R0701_04C6
	apply_movement 2, scr_seq_0837_T11R0701_0504
	goto scr_seq_0837_T11R0701_04CE

scr_seq_0837_T11R0701_04C6:
	apply_movement 2, scr_seq_0837_T11R0701_051C
scr_seq_0837_T11R0701_04CE:
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	hide_person 2
	setflag FLAG_UNK_2FA
	setvar VAR_UNK_4130, 7
	releaseall
	end

scr_seq_0837_T11R0701_04EA:
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0837_T11R0701_04F5:
	scrcmd_474
	npc_msg 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0837_T11R0701_0502:
	.byte 0x00, 0x00

scr_seq_0837_T11R0701_0504:
	.short 14, 2
	.short 13, 5
	.short 14, 1
	.short 13, 1
	.short 69, 1
	.short 254, 0

scr_seq_0837_T11R0701_051C:
	.short 13, 5
	.short 14, 3
	.short 13, 1
	.short 69, 1
	.short 254, 0
scr_seq_0837_T11R0701_0530:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
