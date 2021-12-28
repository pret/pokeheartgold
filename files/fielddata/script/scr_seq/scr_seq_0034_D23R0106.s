#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0034_D23R0106_000A ; 000
	scrdef scr_seq_0034_D23R0106_002F ; 001
	scrdef_end

scr_seq_0034_D23R0106_000A:
	setflag FLAG_UNK_1B7
	setflag FLAG_UNK_1B8
	setvar VAR_UNK_4125, 0
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, scr_seq_0034_D23R0106_002D
	clearflag FLAG_UNK_1B7
	clearflag FLAG_UNK_1B8
scr_seq_0034_D23R0106_002D:
	end

scr_seq_0034_D23R0106_002F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	closemsg
	trainer_battle TRAINER_EXECUTIVE_ARCHER_ARCHER, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0034_D23R0106_025D
	npc_msg 1
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	hide_person 0
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	clearflag FLAG_UNK_99B
	fade_out_bgm 0, 30
	scrcmd_081 0
	wait 15, VAR_SPECIAL_x800C
	reset_bgm
	fade_screen 6, 1, 1, 0
	wait_fade
	move_person 1, 8, 1, 12, 1
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_0034_D23R0106_00C1
	apply_movement 1, scr_seq_0034_D23R0106_0288
	goto scr_seq_0034_D23R0106_0102

scr_seq_0034_D23R0106_00C1:
	comparevartovalue VAR_TEMP_x4000, 8
	gotoif ne, scr_seq_0034_D23R0106_00ED
	apply_movement 1, scr_seq_0034_D23R0106_02A4
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	callif eq, scr_seq_0034_D23R0106_0263
	goto scr_seq_0034_D23R0106_0102

scr_seq_0034_D23R0106_00ED:
	comparevartovalue VAR_TEMP_x4000, 9
	gotoif ne, scr_seq_0034_D23R0106_0102
	apply_movement 1, scr_seq_0034_D23R0106_02C0
scr_seq_0034_D23R0106_0102:
	wait_movement
	comparevartovalue VAR_TEMP_x4000, 8
	gotoif ne, scr_seq_0034_D23R0106_0119
	apply_movement 255, scr_seq_0034_D23R0106_02EC
scr_seq_0034_D23R0106_0119:
	wait_movement
	npc_msg 2
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_0034_D23R0106_014E
	setvar VAR_SPECIAL_x8004, 483
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	setflag FLAG_UNK_093
	npc_msg 5
	closemsg
	goto scr_seq_0034_D23R0106_0167

scr_seq_0034_D23R0106_014E:
	setvar VAR_SPECIAL_x8004, 482
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	setflag FLAG_UNK_094
	npc_msg 6
	closemsg
scr_seq_0034_D23R0106_0167:
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_0034_D23R0106_0182
	apply_movement 1, scr_seq_0034_D23R0106_02F4
	goto scr_seq_0034_D23R0106_01B2

scr_seq_0034_D23R0106_0182:
	comparevartovalue VAR_TEMP_x4000, 8
	gotoif ne, scr_seq_0034_D23R0106_019D
	apply_movement 1, scr_seq_0034_D23R0106_0304
	goto scr_seq_0034_D23R0106_01B2

scr_seq_0034_D23R0106_019D:
	comparevartovalue VAR_TEMP_x4000, 9
	gotoif ne, scr_seq_0034_D23R0106_01B2
	apply_movement 1, scr_seq_0034_D23R0106_0314
scr_seq_0034_D23R0106_01B2:
	wait_movement
	apply_movement 1, scr_seq_0034_D23R0106_0324
	wait_movement
	apply_movement 255, scr_seq_0034_D23R0106_02EC
	wait_movement
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_0034_D23R0106_01E2
	npc_msg 7
	goto scr_seq_0034_D23R0106_01E5

scr_seq_0034_D23R0106_01E2:
	npc_msg 8
scr_seq_0034_D23R0106_01E5:
	closemsg
	apply_movement 1, scr_seq_0034_D23R0106_032C
	wait_movement
	npc_msg 9
	closemsg
	apply_movement 1, scr_seq_0034_D23R0106_0344
	wait_movement
	play_se SEQ_SE_DP_DOOR10
	wait_se SEQ_SE_DP_DOOR10
	wait 8, VAR_SPECIAL_x800C
	hide_person 1
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	releaseall
	setvar VAR_UNK_4077, 5
	setflag FLAG_UNK_0C6
	clearflag FLAG_UNK_2C6
	setflag FLAG_UNK_2C7
	comparevartovalue VAR_UNK_40F8, 2
	gotoif ne, scr_seq_0034_D23R0106_0241
	setvar VAR_UNK_40F8, 0
scr_seq_0034_D23R0106_0241:
	setvar VAR_UNK_407A, 1
	clearflag FLAG_UNK_1E7
	setflag FLAG_UNK_200
	clearflag FLAG_UNK_201
	setflag FLAG_UNK_998
	setflag FLAG_UNK_97D
	end

scr_seq_0034_D23R0106_025D:
	white_out
	releaseall
	end

scr_seq_0034_D23R0106_0263:
	get_person_coords 253, VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8004, 7
	gotoif ne, scr_seq_0034_D23R0106_0286
	wait 112, VAR_SPECIAL_x800C
	apply_movement 253, scr_seq_0034_D23R0106_02DC
scr_seq_0034_D23R0106_0286:
	return


scr_seq_0034_D23R0106_0288:
	.short 13, 1
	.short 14, 4
	.short 12, 7
	.short 15, 4
	.short 12, 3
	.short 34, 1
	.short 254, 0

scr_seq_0034_D23R0106_02A4:
	.short 13, 1
	.short 14, 4
	.short 12, 7
	.short 15, 3
	.short 12, 2
	.short 35, 1
	.short 254, 0

scr_seq_0034_D23R0106_02C0:
	.short 13, 1
	.short 14, 4
	.short 12, 7
	.short 15, 4
	.short 12, 3
	.short 35, 1
	.short 254, 0

scr_seq_0034_D23R0106_02DC:
	.short 12, 1
	.short 15, 1
	.short 33, 1
	.short 254, 0

scr_seq_0034_D23R0106_02EC:
	.short 34, 1
	.short 254, 0

scr_seq_0034_D23R0106_02F4:
	.short 13, 3
	.short 14, 4
	.short 75, 1
	.short 254, 0

scr_seq_0034_D23R0106_0304:
	.short 13, 2
	.short 14, 3
	.short 75, 1
	.short 254, 0

scr_seq_0034_D23R0106_0314:
	.short 13, 3
	.short 14, 4
	.short 75, 1
	.short 254, 0

scr_seq_0034_D23R0106_0324:
	.short 15, 1
	.short 254, 0

scr_seq_0034_D23R0106_032C:
	.short 14, 1
	.short 13, 1
	.short 75, 1
	.short 63, 3
	.short 32, 1
	.short 254, 0

scr_seq_0034_D23R0106_0344:
	.short 13, 6
	.short 15, 4
	.short 254, 0
	.balign 4, 0
