#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0112_D44R0103_0458 ; 000
	scrdef scr_seq_0112_D44R0103_0550 ; 001
	scrdef scr_seq_0112_D44R0103_0563 ; 002
	scrdef scr_seq_0112_D44R0103_007B ; 003
	scrdef scr_seq_0112_D44R0103_001A ; 004
	scrdef scr_seq_0112_D44R0103_0576 ; 005
	scrdef_end

scr_seq_0112_D44R0103_001A:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0112_D44R0103_002B
	clearflag FLAG_UNK_189
	end

scr_seq_0112_D44R0103_002B:
	checkflag FLAG_UNK_0EA
	gotoif TRUE, scr_seq_0112_D44R0103_003C
	goto scr_seq_0112_D44R0103_005A

scr_seq_0112_D44R0103_003C:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0112_D44R0103_0064
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, scr_seq_0112_D44R0103_0064
scr_seq_0112_D44R0103_005A:
	setflag FLAG_HIDE_CAMERON
	goto scr_seq_0112_D44R0103_0068

scr_seq_0112_D44R0103_0064:
	clearflag FLAG_HIDE_CAMERON
scr_seq_0112_D44R0103_0068:
	checkflag FLAG_UNK_0DC
	gotoif TRUE, scr_seq_0112_D44R0103_0075
	end

scr_seq_0112_D44R0103_0075:
	setflag FLAG_UNK_0DD
	end

scr_seq_0112_D44R0103_007B:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0112_D44R0103_0370
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 0
scr_seq_0112_D44R0103_00A0:
	setvar VAR_SPECIAL_x8004, 0
	npc_msg 1
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 0, VAR_SPECIAL_x800C
	menu_item_add 280, 255, 0
	menu_item_add 281, 255, 1
	menu_item_add 282, 255, 0
	menu_exec
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0112_D44R0103_0310
	npc_msg 9
scr_seq_0112_D44R0103_00DF:
	setvar VAR_SPECIAL_x8004, 1
	npc_msg 2
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 0, VAR_SPECIAL_x800C
	menu_item_add 283, 255, 0
	menu_item_add 284, 255, 0
	menu_item_add 285, 255, 1
	menu_exec
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0112_D44R0103_0310
	npc_msg 9
scr_seq_0112_D44R0103_011E:
	setvar VAR_SPECIAL_x8004, 2
	npc_msg 3
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 0, VAR_SPECIAL_x800C
	menu_item_add 286, 255, 1
	menu_item_add 287, 255, 0
	menu_item_add 288, 255, 0
	menu_exec
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0112_D44R0103_0310
	npc_msg 9
scr_seq_0112_D44R0103_015D:
	setvar VAR_SPECIAL_x8004, 3
	npc_msg 4
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 0, VAR_SPECIAL_x800C
	menu_item_add 289, 255, 0
	menu_item_add 290, 255, 1
	menu_item_add 291, 255, 0
	menu_exec
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0112_D44R0103_0310
	npc_msg 9
scr_seq_0112_D44R0103_019C:
	setvar VAR_SPECIAL_x8004, 4
	npc_msg 5
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 0, VAR_SPECIAL_x800C
	menu_item_add 292, 255, 1
	menu_item_add 293, 255, 0
	menu_item_add 294, 255, 0
	menu_exec
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0112_D44R0103_0310
	buffer_players_name 0
	npc_msg 6
	closemsg
	move_person 3, 6, 0, 21, 0
	wait 10, VAR_SPECIAL_x8004
	play_se SEQ_SE_DP_DOOR
	wait 5, VAR_SPECIAL_x8004
	callstd 2044
	apply_movement 255, scr_seq_0112_D44R0103_0390
	apply_movement 3, scr_seq_0112_D44R0103_03A8
	wait_movement
	npc_msg 10
	apply_movement 3, scr_seq_0112_D44R0103_03C0
	wait_movement
	npc_msg 11
	apply_movement 3, scr_seq_0112_D44R0103_03D0
	wait_movement
	npc_msg 12
	apply_movement 0, scr_seq_0112_D44R0103_03DC
	wait_movement
	npc_msg 13
	apply_movement 3, scr_seq_0112_D44R0103_03EC
	wait_movement
	npc_msg 14
	apply_movement 3, scr_seq_0112_D44R0103_03F4
	apply_movement 0, scr_seq_0112_D44R0103_03FC
	wait_movement
	npc_msg 15
	buffer_players_name 0
	npc_msg 16
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	give_badge 7
	npc_msg 17
	apply_movement 0, scr_seq_0112_D44R0103_0408
	apply_movement 255, scr_seq_0112_D44R0103_0418
	apply_movement 3, scr_seq_0112_D44R0103_0424
	wait_movement
	npc_msg 18
	closemsg
	wait 15, VAR_SPECIAL_x8005
	npc_msg 19
	closemsg
	apply_movement 3, scr_seq_0112_D44R0103_0434
	wait_movement
	hide_person 3
	callstd 2045
	wait_fanfare
	apply_movement 0, scr_seq_0112_D44R0103_0450
	wait_movement
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_0112_D44R0103_02D3
	npc_msg 20
	goto scr_seq_0112_D44R0103_02D6

scr_seq_0112_D44R0103_02D3:
	npc_msg 21
scr_seq_0112_D44R0103_02D6:
	waitbutton
	closemsg
	releaseall
	setflag FLAG_UNK_998
	setflag FLAG_UNK_0EA
	clearflag FLAG_UNK_209
	setvar VAR_UNK_40C4, 1
	setflag FLAG_UNK_2E5
	setvar VAR_UNK_40C3, 1
	setvar VAR_UNK_407B, 1
	setvar VAR_SCENE_ELMS_LAB, 8
	clearflag FLAG_HIDE_ELMS_LAB_FRIEND
	setvar VAR_SCENE_NEW_BARK_EAST_EXIT, 1
	end

scr_seq_0112_D44R0103_0310:
	setflag FLAG_UNK_0DB
	apply_movement 0, scr_seq_0112_D44R0103_0378
	wait_movement
	npc_msg 7
	apply_movement 0, scr_seq_0112_D44R0103_0388
	wait_movement
	npc_msg 8
	scrcmd_049
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8004
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0112_D44R0103_00A0
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0112_D44R0103_00DF
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0112_D44R0103_011E
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0112_D44R0103_015D
	goto scr_seq_0112_D44R0103_019C


scr_seq_0112_D44R0103_0370:
	step 12, 8
	step_end

scr_seq_0112_D44R0103_0378:
	step 63, 2
	step 3, 1
	step 63, 2
	step_end

scr_seq_0112_D44R0103_0388:
	step 1, 1
	step_end

scr_seq_0112_D44R0103_0390:
	step 63, 1
	step 75, 1
	step 1, 1
	step 63, 8
	step 2, 1
	step_end

scr_seq_0112_D44R0103_03A8:
	step 63, 4
	step 12, 8
	step 14, 1
	step 12, 2
	step 3, 1
	step_end

scr_seq_0112_D44R0103_03C0:
	step 63, 1
	step 71, 1
	step 18, 1
	step_end

scr_seq_0112_D44R0103_03D0:
	step 63, 1
	step 10, 1
	step_end

scr_seq_0112_D44R0103_03DC:
	step 63, 1
	step 9, 1
	step 10, 1
	step_end

scr_seq_0112_D44R0103_03EC:
	step 75, 1
	step_end

scr_seq_0112_D44R0103_03F4:
	step 15, 2
	step_end

scr_seq_0112_D44R0103_03FC:
	step 63, 2
	step 3, 1
	step_end

scr_seq_0112_D44R0103_0408:
	step 8, 1
	step 11, 1
	step 1, 1
	step_end

scr_seq_0112_D44R0103_0418:
	step 65, 2
	step 0, 1
	step_end

scr_seq_0112_D44R0103_0424:
	step 72, 1
	step 65, 2
	step 0, 1
	step_end

scr_seq_0112_D44R0103_0434:
	step 71, 1
	step 13, 1
	step 72, 1
	step 21, 3
	step 23, 1
	step 21, 4
	step_end

scr_seq_0112_D44R0103_0450:
	step 33, 1
	step_end
scr_seq_0112_D44R0103_0458:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0DD
	gotoif TRUE, scr_seq_0112_D44R0103_053D
	checkflag FLAG_UNK_0DC
	gotoif TRUE, scr_seq_0112_D44R0103_052E
	checkflag FLAG_UNK_0DA
	gotoif TRUE, scr_seq_0112_D44R0103_04A6
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_0112_D44R0103_049B
	npc_msg 20
	goto scr_seq_0112_D44R0103_049E

scr_seq_0112_D44R0103_049B:
	npc_msg 22
scr_seq_0112_D44R0103_049E:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0112_D44R0103_04A6:
	npc_msg 26
	get_party_count VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 6
	gotoif ne, scr_seq_0112_D44R0103_04C3
	npc_msg 28
	goto scr_seq_0112_D44R0103_0548

scr_seq_0112_D44R0103_04C3:
	buffer_players_name 0
	npc_msg 27
	play_fanfare SEQ_ME_SHINKAOME
	wait_fanfare
	give_mon SPECIES_DRATINI, 15, 0, 0, 0, VAR_SPECIAL_x800C
	checkflag FLAG_UNK_0DB
	gotoif TRUE, scr_seq_0112_D44R0103_04F0
	set_mon_move VAR_SPECIAL_x8005, 0, MOVE_EXTREME_SPEED
scr_seq_0112_D44R0103_04F0:
	npc_msg 32
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0112_D44R0103_050E
	goto scr_seq_0112_D44R0103_052E

scr_seq_0112_D44R0103_050E:
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	nickname_input VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	fade_screen 6, 1, 1, 0x00
	wait_fade
scr_seq_0112_D44R0103_052E:
	setflag FLAG_UNK_0DC
	npc_msg 29
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0112_D44R0103_053D:
	npc_msg 30
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0112_D44R0103_0548:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0112_D44R0103_0550:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 24
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0112_D44R0103_0563:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 25
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0112_D44R0103_0576:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0112_D44R0103_069E
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0112_D44R0103_06B2
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0112_D44R0103_05EF
	apply_movement 255, scr_seq_0112_D44R0103_06C8
	apply_movement 4, scr_seq_0112_D44R0103_0714
	goto scr_seq_0112_D44R0103_063D

scr_seq_0112_D44R0103_05EF:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0112_D44R0103_060A
	apply_movement 255, scr_seq_0112_D44R0103_06E0
	goto scr_seq_0112_D44R0103_063D

scr_seq_0112_D44R0103_060A:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0112_D44R0103_062D
	apply_movement 255, scr_seq_0112_D44R0103_0700
	apply_movement 4, scr_seq_0112_D44R0103_0714
	goto scr_seq_0112_D44R0103_063D

scr_seq_0112_D44R0103_062D:
	apply_movement 255, scr_seq_0112_D44R0103_06EC
	apply_movement 4, scr_seq_0112_D44R0103_0714
scr_seq_0112_D44R0103_063D:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0112_D44R0103_0664
	apply_movement 253, scr_seq_0112_D44R0103_0720
	wait_movement
scr_seq_0112_D44R0103_0664:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 46
	lockall
	fade_screen 6, 1, 1, 0x00
	wait_fade
	clearflag FLAG_UNK_189
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0112_D44R0103_069E:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0112_D44R0103_06B2:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0112_D44R0103_06C6:
	.byte 0x00, 0x00

scr_seq_0112_D44R0103_06C8:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0112_D44R0103_06E0:
	step 12, 3
	step 33, 1
	step_end

scr_seq_0112_D44R0103_06EC:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0112_D44R0103_0700:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0112_D44R0103_0714:
	step 63, 1
	step 32, 1
	step_end

scr_seq_0112_D44R0103_0720:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
	.balign 4, 0
