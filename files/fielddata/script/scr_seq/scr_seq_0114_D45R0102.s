#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0114_D45R0102_0014 ; 000
	scrdef scr_seq_0114_D45R0102_0079 ; 001
	scrdef scr_seq_0114_D45R0102_0012 ; 002
	scrdef scr_seq_0114_D45R0102_03E4 ; 003
	scrdef_end

scr_seq_0114_D45R0102_0012:
	end

scr_seq_0114_D45R0102_0014:
	comparevartovalue VAR_UNK_40FE, 4
	gotoif eq, scr_seq_0114_D45R0102_0077
	comparevartovalue VAR_UNK_40FE, 3
	gotoif eq, scr_seq_0114_D45R0102_0057
	comparevartovalue VAR_UNK_40FE, 2
	gotoif eq, scr_seq_0114_D45R0102_003D
	end

scr_seq_0114_D45R0102_003D:
	move_person 4, 6, 1, 4, 0
	move_person 5, 5, 1, 8, 1
	end

scr_seq_0114_D45R0102_0057:
	move_person 4, 6, 1, 6, 1
	move_person 5, 5, 1, 7, 0
	scrcmd_375 253
	scrcmd_606
	end

scr_seq_0114_D45R0102_0077:
	end

scr_seq_0114_D45R0102_0079:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0114_D45R0102_0374
	apply_movement 5, scr_seq_0114_D45R0102_03AC
	wait_movement
	apply_movement 253, scr_seq_0114_D45R0102_0398
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 4, scr_seq_0114_D45R0102_031C
	wait_movement
	npc_msg 0
	closemsg
	apply_movement 5, scr_seq_0114_D45R0102_03AC
	wait_movement
	gender_msgbox 8, 7
	closemsg
	apply_movement 4, scr_seq_0114_D45R0102_032C
	wait_movement
	npc_msg 1
	closemsg
	apply_movement 5, scr_seq_0114_D45R0102_03B4
	wait_movement
	gender_msgbox 10, 9
	closemsg
	apply_movement 5, scr_seq_0114_D45R0102_038C
	wait_movement
	gender_msgbox 12, 11
	closemsg
	apply_movement 5, scr_seq_0114_D45R0102_03DC
	wait_movement
	buffer_players_name 0
	gender_msgbox 14, 13
	closemsg
	scrcmd_081 0
	play_se SEQ_SE_PL_FR03
	play_bgm SEQ_GS_SENKYO
	npc_msg 2
	scrcmd_074 1432
	closemsg
	apply_movement 4, scr_seq_0114_D45R0102_032C
	wait_movement
	npc_msg 3
	closemsg
	setvar VAR_UNK_40FE, 3
	trainer_battle TRAINER_ROCKET_BOSS_GIOVANNI, 0, 1, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0114_D45R0102_0250
	setvar VAR_UNK_40FE, 4
	apply_movement 4, scr_seq_0114_D45R0102_033C
	wait_movement
	npc_msg 4
	closemsg
	apply_movement 4, scr_seq_0114_D45R0102_0350
	wait_movement
	hide_person 4
	setflag FLAG_UNK_303
	apply_movement 255, scr_seq_0114_D45R0102_0380
	apply_movement 5, scr_seq_0114_D45R0102_0380
	wait_movement
	fade_out_bgm 0, 30
	scrcmd_081 0
	play_se SEQ_SE_PL_FR03
	npc_msg 5
	scrcmd_074 1432
	closemsg
	apply_movement 5, scr_seq_0114_D45R0102_03D4
	wait_movement
	buffer_players_name 0
	gender_msgbox 16, 15
	closemsg
	get_lead_mon_index VAR_TEMP_x4002
	get_partymon_species VAR_TEMP_x4002, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 251
	callif ne, scr_seq_0114_D45R0102_02C0
	apply_movement 253, scr_seq_0114_D45R0102_03A4
	wait_movement
	play_se SEQ_SE_GS_SUZUSYUTUGEN_HO
	fade_screen 6, 6, 0, 32767
	wait_fade
	wait 15, VAR_SPECIAL_x800C
	fade_screen 6, 6, 1, 32767
	wait_fade
	apply_movement 255, scr_seq_0114_D45R0102_038C
	wait_movement
	apply_movement 5, scr_seq_0114_D45R0102_03C0
	wait_movement
	comparevartovalue VAR_TEMP_x4003, 1
	gotoif ne, scr_seq_0114_D45R0102_0224
	gender_msgbox 27, 26
	closemsg
	goto scr_seq_0114_D45R0102_022A

scr_seq_0114_D45R0102_0224:
	gender_msgbox 18, 17
	closemsg
scr_seq_0114_D45R0102_022A:
	play_se SEQ_SE_GS_TIMESLIP
	scrcmd_810
	clearflag FLAG_UNK_310
	scrcmd_176 117, 0, 16, 57, 1
	fade_screen 6, 15, 1, 32767
	wait_fade
	releaseall
	end

scr_seq_0114_D45R0102_0250:
	npc_msg 6
	closemsg
	apply_movement 4, scr_seq_0114_D45R0102_0360
	play_se SEQ_SE_GS_SUZUSYUTUGEN_HO
	fade_screen 6, 6, 0, 32767
	wait_fade
	wait 15, VAR_SPECIAL_x800C
	fade_screen 6, 6, 1, 32767
	wait_fade
	wait_movement
	hide_person 4
	setflag FLAG_UNK_303
	npc_msg 19
	closemsg
	play_se SEQ_SE_GS_TIMESLIP
	scrcmd_810
	setflag FLAG_UNK_178
	setvar VAR_UNK_40FE, 0
	setflag FLAG_UNK_310
	scrcmd_176 117, 0, 16, 57, 1
	fade_screen 6, 15, 1, 32767
	wait_fade
	touchscreen_menu_show
	releaseall
	end

scr_seq_0114_D45R0102_02C0:
	setvar VAR_TEMP_x4003, 1
	apply_movement 5, scr_seq_0114_D45R0102_0304
	wait_movement
	gender_msgbox 23, 22
	closemsg
	gender_msgbox 25, 24
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	play_fanfare SEQ_ME_ASA
	wait_fanfare
	heal_party
	scrcmd_436
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	return

scr_seq_0114_D45R0102_0302:
	.byte 0x00, 0x00

scr_seq_0114_D45R0102_0304:
	step 35, 1
	step 75, 1
	step 63, 1
	step 19, 1
	step 32, 1
	step_end

scr_seq_0114_D45R0102_031C:
	step 75, 1
	step 63, 1
	step 33, 1
	step_end

scr_seq_0114_D45R0102_032C:
	step 13, 1
	step_end
	.byte 0x21, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_0114_D45R0102_033C:
	step 71, 1
	step 8, 1
	step 72, 1
	step 11, 2
	step_end

scr_seq_0114_D45R0102_0350:
	step 13, 4
	step 14, 2
	step 13, 2
	step_end

scr_seq_0114_D45R0102_0360:
	step 11, 2
	step 9, 3
	step 10, 2
	step 9, 2
	step_end

scr_seq_0114_D45R0102_0374:
	step 32, 1
	step 12, 1
	step_end

scr_seq_0114_D45R0102_0380:
	step 63, 3
	step 13, 1
	step_end

scr_seq_0114_D45R0102_038C:
	step 75, 1
	step 63, 1
	step_end

scr_seq_0114_D45R0102_0398:
	step 15, 1
	step 12, 1
	step_end

scr_seq_0114_D45R0102_03A4:
	step 49, 1
	step_end

scr_seq_0114_D45R0102_03AC:
	step 32, 1
	step_end

scr_seq_0114_D45R0102_03B4:
	step 12, 1
	step 35, 1
	step_end

scr_seq_0114_D45R0102_03C0:
	step 34, 1
	step 63, 1
	step 35, 1
	step 63, 1
	step_end

scr_seq_0114_D45R0102_03D4:
	step 13, 1
	step_end

scr_seq_0114_D45R0102_03DC:
	step 39, 4
	step_end
scr_seq_0114_D45R0102_03E4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40FE, 4
	gotoif ge, scr_seq_0114_D45R0102_0404
	npc_msg 20
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0114_D45R0102_0404:
	npc_msg 21
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
