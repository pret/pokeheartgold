#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0860_T22PC0101_001A ; 000
	scrdef scr_seq_0860_T22PC0101_033E ; 001
	scrdef scr_seq_0860_T22PC0101_0351 ; 002
	scrdef scr_seq_0860_T22PC0101_0364 ; 003
	scrdef scr_seq_0860_T22PC0101_0026 ; 004
	scrdef scr_seq_0860_T22PC0101_0264 ; 005
	scrdef_end

scr_seq_0860_T22PC0101_001A:
	setvar VAR_SPECIAL_x8007, 3
	callstd std_nurse_joy
	end

scr_seq_0860_T22PC0101_0026:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 12
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0860_T22PC0101_021D
	scrcmd_815 0
	fade_screen 6, 1, 0, 0x00
	wait_fade
	closemsg
	prompt_easy_chat VAR_SPECIAL_x800C, VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0860_T22PC0101_021F
	npc_msg 13
	fade_screen 6, 1, 0, 0x00
	wait_fade
	closemsg
	scrcmd_815 0
	prompt_easy_chat VAR_SPECIAL_x800C, VAR_SPECIAL_x8002, VAR_SPECIAL_x8003
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0860_T22PC0101_021F
	primo_password_check_1 VAR_SPECIAL_x800C, VAR_SPECIAL_x8000, VAR_SPECIAL_x8001, VAR_SPECIAL_x8002, VAR_SPECIAL_x8003
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0860_T22PC0101_00DD
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0860_T22PC0101_0212
	goto scr_seq_0860_T22PC0101_022A

scr_seq_0860_T22PC0101_00DD:
	primo_password_check_2 VAR_SPECIAL_x800C, VAR_SPECIAL_x8000, VAR_SPECIAL_x8001, VAR_SPECIAL_x8002, VAR_SPECIAL_x8003
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0860_T22PC0101_0212
	comparevartovalue VAR_SPECIAL_x800C, 8
	gotoif eq, scr_seq_0860_T22PC0101_011D
	comparevartovalue VAR_SPECIAL_x800C, 9
	gotoif eq, scr_seq_0860_T22PC0101_0157
	comparevartovalue VAR_SPECIAL_x800C, 10
	gotoif eq, scr_seq_0860_T22PC0101_0191
scr_seq_0860_T22PC0101_011D:
	checkflag FLAG_UNK_159
	gotoif TRUE, scr_seq_0860_T22PC0101_0212
	get_party_count VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, scr_seq_0860_T22PC0101_0207
	setflag FLAG_UNK_159
	npc_msg 18
	buffer_players_name 0
	buffer_species_name 1, SPECIES_MAREEP, 0, 0
	give_egg SPECIES_MAREEP, 14
	goto scr_seq_0860_T22PC0101_01CB

scr_seq_0860_T22PC0101_0157:
	checkflag FLAG_UNK_15A
	gotoif TRUE, scr_seq_0860_T22PC0101_0212
	get_party_count VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, scr_seq_0860_T22PC0101_0207
	setflag FLAG_UNK_15A
	npc_msg 18
	buffer_players_name 0
	buffer_species_name 1, SPECIES_WOOPER, 0, 0
	give_egg SPECIES_WOOPER, 14
	goto scr_seq_0860_T22PC0101_01CB

scr_seq_0860_T22PC0101_0191:
	checkflag FLAG_UNK_15B
	gotoif TRUE, scr_seq_0860_T22PC0101_0212
	get_party_count VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, scr_seq_0860_T22PC0101_0207
	setflag FLAG_UNK_15B
	npc_msg 18
	buffer_players_name 0
	buffer_species_name 1, SPECIES_SLUGMA, 0, 0
	give_egg SPECIES_SLUGMA, 14
	goto scr_seq_0860_T22PC0101_01CB

scr_seq_0860_T22PC0101_01CB:
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0860_T22PC0101_01EC
	apply_movement 8, scr_seq_0860_T22PC0101_023C
	goto scr_seq_0860_T22PC0101_01F4

scr_seq_0860_T22PC0101_01EC:
	apply_movement 8, scr_seq_0860_T22PC0101_0250
scr_seq_0860_T22PC0101_01F4:
	wait_movement
	play_fanfare SEQ_ME_TAMAGO_GET
	npc_msg 19
	wait_fanfare
	waitbutton
	goto scr_seq_0860_T22PC0101_0235

scr_seq_0860_T22PC0101_0207:
	npc_msg 20
	waitbutton
	goto scr_seq_0860_T22PC0101_0235

scr_seq_0860_T22PC0101_0212:
	npc_msg 14
	waitbutton
	goto scr_seq_0860_T22PC0101_0235

scr_seq_0860_T22PC0101_021D:
	touchscreen_menu_show
scr_seq_0860_T22PC0101_021F:
	npc_msg 15
	waitbutton
	goto scr_seq_0860_T22PC0101_0235

scr_seq_0860_T22PC0101_022A:
	npc_msg 16
	waitbutton
	goto scr_seq_0860_T22PC0101_0235

scr_seq_0860_T22PC0101_0235:
	closemsg
	releaseall
	end

scr_seq_0860_T22PC0101_023B:
	.byte 0x00

scr_seq_0860_T22PC0101_023C:
	step 63, 1
	step 32, 1
	step 63, 2
	step 33, 1
	step_end

scr_seq_0860_T22PC0101_0250:
	step 63, 1
	step 32, 1
	step 63, 2
	step 35, 1
	step_end
scr_seq_0860_T22PC0101_0264:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_2C5
	gotoif TRUE, scr_seq_0860_T22PC0101_0280
	npc_msg 21
	goto scr_seq_0860_T22PC0101_028C

scr_seq_0860_T22PC0101_0280:
	buffer_player_union_avatar_class_name 0
	npc_msg 26
	goto scr_seq_0860_T22PC0101_028C

scr_seq_0860_T22PC0101_028C:
	npc_msg 22
	touchscreen_menu_hide
	scrcmd_287
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 53, 255, 0
	menu_item_add 54, 255, 1
	menu_item_add 55, 255, 2
	menu_item_add 56, 255, 3
	menu_item_add 44, 255, 4
	menu_exec
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0860_T22PC0101_0331
	comparevartovalue VAR_SPECIAL_x8008, 65534
	gotoif eq, scr_seq_0860_T22PC0101_0331
	scrcmd_288 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	buffer_trainer_class_name_indef 0, VAR_SPECIAL_x8005
	capitalize 0
	npc_msg 23
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0860_T22PC0101_0313
	goto scr_seq_0860_T22PC0101_028C

scr_seq_0860_T22PC0101_0313:
	touchscreen_menu_show
	buffer_trainer_class_name_indef 0, VAR_SPECIAL_x8005
	npc_msg 24
	setflag FLAG_UNK_2C5
	scrcmd_558 32772, 32773
	scrcmd_289 32773
	goto scr_seq_0860_T22PC0101_0333

scr_seq_0860_T22PC0101_0331:
	touchscreen_menu_show
scr_seq_0860_T22PC0101_0333:
	npc_msg 25
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0860_T22PC0101_033E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0860_T22PC0101_0351:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0860_T22PC0101_0364:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 11
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
