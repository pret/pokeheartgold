#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0829_T11GYM0101_008F ; 000
	scrdef scr_seq_0829_T11GYM0101_015C ; 001
	scrdef scr_seq_0829_T11GYM0101_018D ; 002
	scrdef scr_seq_0829_T11GYM0101_01BF ; 003
	scrdef scr_seq_0829_T11GYM0101_0016 ; 004
	scrdef_end

scr_seq_0829_T11GYM0101_0016:
	get_phone_book_rematch 35, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0829_T11GYM0101_0089
	scrcmd_147 35, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0829_T11GYM0101_006C
	check_badge 13, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0829_T11GYM0101_0055
	goto scr_seq_0829_T11GYM0101_0083

scr_seq_0829_T11GYM0101_0055:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_0829_T11GYM0101_0083
	setflag FLAG_UNK_2F1
	end

scr_seq_0829_T11GYM0101_006C:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_0829_T11GYM0101_0083
	setflag FLAG_UNK_2F1
	end

scr_seq_0829_T11GYM0101_0083:
	clearflag FLAG_UNK_2F1
	end

scr_seq_0829_T11GYM0101_0089:
	setflag FLAG_UNK_2F1
	end

scr_seq_0829_T11GYM0101_008F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge 13, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0829_T11GYM0101_0140
	npc_msg 0
	closemsg
	trainer_battle TRAINER_LEADER_SABRINA_SABRINA, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0829_T11GYM0101_0156
	give_badge 13
	addvar VAR_UNK_4135, 1
	add_special_game_stat 22
	setflag FLAG_UNK_998
	settrainerflag TRAINER_PSYCHIC_M_FRANKLIN
	settrainerflag TRAINER_PSYCHIC_M_JARED
	settrainerflag TRAINER_MEDIUM_REBECCA
	settrainerflag TRAINER_MEDIUM_DARCY
	npc_msg 1
	buffer_players_name 0
	npc_msg 2
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	npc_msg 3
	goto scr_seq_0829_T11GYM0101_0102

scr_seq_0829_T11GYM0101_0102:
	setvar VAR_SPECIAL_x8004, 375
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0829_T11GYM0101_0136
	callstd std_give_item_verbose
	setflag FLAG_UNK_182
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0829_T11GYM0101_0136:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_0829_T11GYM0101_0140:
	checkflag FLAG_UNK_182
	gotoif FALSE, scr_seq_0829_T11GYM0101_0102
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0829_T11GYM0101_0156:
	white_out
	releaseall
	end

scr_seq_0829_T11GYM0101_015C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge 13, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0829_T11GYM0101_0182
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0829_T11GYM0101_0182:
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0829_T11GYM0101_018D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge 13, VAR_SPECIAL_x800C
	buffer_players_name 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0829_T11GYM0101_01B4
	npc_msg 8
	goto scr_seq_0829_T11GYM0101_01B7

scr_seq_0829_T11GYM0101_01B4:
	npc_msg 9
scr_seq_0829_T11GYM0101_01B7:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0829_T11GYM0101_01BF:
	scrcmd_609
	lockall
	scrcmd_600
	play_se SEQ_SE_PL_BOWABOWA
	apply_movement 255, scr_seq_0829_T11GYM0101_01FC
	wait_movement
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_176 410, 0, 15, 23, 1
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

scr_seq_0829_T11GYM0101_01FB:
	.byte 0x00

scr_seq_0829_T11GYM0101_01FC:
	step 1, 2
	step 2, 2
	step 0, 2
	step 3, 2
	step 1, 2
	step 2, 2
	step 0, 2
	step 3, 2
	step 1, 2
	step 2, 2
	step 0, 2
	step 3, 2
	step 1, 2
	step 2, 2
	step 0, 2
	step 3, 1
	step 69, 0
	step_end
	.balign 4, 0
