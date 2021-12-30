#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0229_R30R0201_00CF ; 000
	scrdef scr_seq_0229_R30R0201_002F ; 001
	scrdef scr_seq_0229_R30R0201_0234 ; 002
	scrdef scr_seq_0229_R30R0201_0012 ; 003
	scrdef_end

scr_seq_0229_R30R0201_0012:
	comparevartovalue VAR_UNK_40F9, 1
	gotoif eq, scr_seq_0229_R30R0201_0021
	end

scr_seq_0229_R30R0201_0021:
	move_person 0, 5, 0, 6, 3
	end

scr_seq_0229_R30R0201_002F:
	scrcmd_609
	lockall
	apply_movement 0, scr_seq_0229_R30R0201_03AC
	wait_movement
	apply_movement 1, scr_seq_0229_R30R0201_041C
	apply_movement 0, scr_seq_0229_R30R0201_03B4
	wait_movement
	buffer_players_name 0
	gender_msgbox 0, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 0, scr_seq_0229_R30R0201_03C4
	apply_movement 255, scr_seq_0229_R30R0201_0404
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 0, scr_seq_0229_R30R0201_03E4
	wait_movement
	npc_msg 2
	setvar VAR_SPECIAL_x8004, 484
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	npc_msg 3
	npc_msg 4
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_081 0
	play_fanfare SEQ_ME_ASA
	wait_fanfare
	heal_party
	fade_screen 6, 1, 1, 0
	wait_fade
	goto scr_seq_0229_R30R0201_02E8

scr_seq_0229_R30R0201_00CD:
	.byte 0x02, 0x00
scr_seq_0229_R30R0201_00CF:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40F9, 4
	gotoif ge, scr_seq_0229_R30R0201_00F1
	comparevartovalue VAR_UNK_40F9, 2
	gotoif ge, scr_seq_0229_R30R0201_02CD
scr_seq_0229_R30R0201_00F1:
	checkflag FLAG_UNK_06C
	gotoif TRUE, scr_seq_0229_R30R0201_019F
	checkflag FLAG_UNK_0C9
	gotoif TRUE, scr_seq_0229_R30R0201_012A
	comparevartovalue VAR_UNK_4107, 2
	gotoif ge, scr_seq_0229_R30R0201_011F
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0229_R30R0201_011F:
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0229_R30R0201_012A:
	buffer_players_name 0
	gender_msgbox 16, 17
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0229_R30R0201_0189
	setvar VAR_SPECIAL_x8004, 216
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0229_R30R0201_0194
	callstd std_give_item_verbose
	closemsg
	setflag FLAG_UNK_06C
	setvar VAR_SPECIAL_x8004, 478
	setvar VAR_SPECIAL_x8005, 1
	takeitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	releaseall
	end

scr_seq_0229_R30R0201_0189:
	npc_msg 20
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0229_R30R0201_0194:
	npc_msg 19
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0229_R30R0201_019F:
	checkflag FLAG_UNK_107
	gotoif FALSE, scr_seq_0229_R30R0201_011F
	npc_msg 7
	closemsg
	scrcmd_386 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_0229_R30R0201_01CE
	apply_movement 0, scr_seq_0229_R30R0201_01F8
	goto scr_seq_0229_R30R0201_01F1

scr_seq_0229_R30R0201_01CE:
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_0229_R30R0201_01E9
	apply_movement 0, scr_seq_0229_R30R0201_020C
	goto scr_seq_0229_R30R0201_01F1

scr_seq_0229_R30R0201_01E9:
	apply_movement 0, scr_seq_0229_R30R0201_0220
scr_seq_0229_R30R0201_01F1:
	wait_movement
	releaseall
	end

scr_seq_0229_R30R0201_01F7:
	.byte 0x00

scr_seq_0229_R30R0201_01F8:
	step 1, 3
	step 2, 3
	step 0, 3
	step 3, 3
	step_end

scr_seq_0229_R30R0201_020C:
	step 1, 3
	step 3, 3
	step 0, 3
	step 2, 3
	step_end

scr_seq_0229_R30R0201_0220:
	step 3, 3
	step 0, 3
	step 2, 3
	step 1, 3
	step_end
scr_seq_0229_R30R0201_0234:
	scrcmd_609
	lockall
	setvar VAR_UNK_40F9, 2
	apply_movement 0, scr_seq_0229_R30R0201_03AC
	wait_movement
	apply_movement 0, scr_seq_0229_R30R0201_02D8
	wait_movement
	buffer_players_name 0
	gender_msgbox 21, 22
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 0, scr_seq_0229_R30R0201_03C4
	apply_movement 255, scr_seq_0229_R30R0201_0404
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 23
	closemsg
	apply_movement 0, scr_seq_0229_R30R0201_03E4
	wait_movement
	buffer_players_name 0
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_0229_R30R0201_02B0
	setvar VAR_SPECIAL_x8004, 535
	goto scr_seq_0229_R30R0201_02B6

scr_seq_0229_R30R0201_02B0:
	setvar VAR_SPECIAL_x8004, 534
scr_seq_0229_R30R0201_02B6:
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	closemsg
	npc_msg 26
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0229_R30R0201_02CD:
	npc_msg 27
	waitbutton
	closemsg
	releaseall
	end


scr_seq_0229_R30R0201_02D8:
	step 13, 1
	step 14, 1
	step 13, 1
	step_end
scr_seq_0229_R30R0201_02E8:
	play_bgm SEQ_GS_OHKIDO
	apply_movement 1, scr_seq_0229_R30R0201_0424
	wait_movement
	apply_movement 255, scr_seq_0229_R30R0201_0414
	wait_movement
	buffer_players_name 0
	gender_msgbox 8, 9
	closemsg
	apply_movement 1, scr_seq_0229_R30R0201_0438
	wait_movement
	npc_msg 10
	closemsg
	apply_movement 1, scr_seq_0229_R30R0201_0444
	wait_movement
	npc_msg 11
	buffer_players_name 0
	npc_msg 12
	scrcmd_291
	setflag FLAG_UNK_06B
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	scrcmd_573
	gender_msgbox 13, 14
	closemsg
	buffer_players_name 0
	npc_msg 15
	register_gear_number 2
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	closemsg
	apply_movement 1, scr_seq_0229_R30R0201_0450
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	hide_person 1
	wait_se SEQ_SE_DP_DOOR
	fade_out_bgm 0, 30
	scrcmd_081 0
	reset_bgm
	releaseall
	setvar VAR_UNK_4107, 1
	scrcmd_280 2
	setflag FLAG_UNK_195
	setflag FLAG_HIDE_COMM_CLUB_CLOSED_LADIES
	clearflag FLAG_HIDE_COMM_CLUB_RECEPTIONISTS
	setflag FLAG_HIDE_NEW_BARK_RIVAL
	setvar VAR_SCENE_CHERRYGROVE_CITY_OW, 3
	clearflag FLAG_HIDE_CHERRYGROVE_RIVAL
	setvar VAR_SCENE_ELMS_LAB, 3
	clearflag FLAG_HIDE_ELMS_LAB_OFFICER
	setvar VAR_UNK_408C, 2
	end

scr_seq_0229_R30R0201_03AB:
	.byte 0x00

scr_seq_0229_R30R0201_03AC:
	step 75, 1
	step_end

scr_seq_0229_R30R0201_03B4:
	step 17, 1
	step 18, 5
	step 33, 1
	step_end

scr_seq_0229_R30R0201_03C4:
	step 15, 1
	step 12, 3
	step 33, 1
	step_end
	.byte 0x20, 0x00, 0x01, 0x00, 0x23, 0x00, 0x01, 0x00, 0x22, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00

scr_seq_0229_R30R0201_03E4:
	step 18, 3
	step 16, 1
	step 63, 1
	step 24, 1
	step 9, 1
	step 11, 3
	step 29, 1
	step_end

scr_seq_0229_R30R0201_0404:
	step 12, 1
	step 15, 1
	step 12, 2
	step_end

scr_seq_0229_R30R0201_0414:
	step 34, 1
	step_end

scr_seq_0229_R30R0201_041C:
	step 34, 1
	step_end

scr_seq_0229_R30R0201_0424:
	step 9, 1
	step 10, 4
	step 8, 2
	step 31, 1
	step_end

scr_seq_0229_R30R0201_0438:
	step 9, 1
	step 31, 1
	step_end

scr_seq_0229_R30R0201_0444:
	step 8, 1
	step 31, 1
	step_end

scr_seq_0229_R30R0201_0450:
	step 9, 3
	step 63, 1
	step_end
	.balign 4, 0
