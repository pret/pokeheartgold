#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0089_D35R0102_027D ; 000
	scrdef scr_seq_0089_D35R0102_0C09 ; 001
	scrdef scr_seq_0089_D35R0102_0D6E ; 002
	scrdef scr_seq_0089_D35R0102_0D70 ; 003
	scrdef scr_seq_0089_D35R0102_0D72 ; 004
	scrdef scr_seq_0089_D35R0102_04B4 ; 005
	scrdef scr_seq_0089_D35R0102_06F8 ; 006
	scrdef scr_seq_0089_D35R0102_08A9 ; 007
	scrdef scr_seq_0089_D35R0102_0A56 ; 008
	scrdef scr_seq_0089_D35R0102_0C52 ; 009
	scrdef scr_seq_0089_D35R0102_0C99 ; 010
	scrdef scr_seq_0089_D35R0102_0CE0 ; 011
	scrdef scr_seq_0089_D35R0102_0D27 ; 012
	scrdef scr_seq_0089_D35R0102_0F2F ; 013
	scrdef scr_seq_0089_D35R0102_0F5C ; 014
	scrdef scr_seq_0089_D35R0102_0F89 ; 015
	scrdef scr_seq_0089_D35R0102_0FB6 ; 016
	scrdef scr_seq_0089_D35R0102_0FE3 ; 017
	scrdef scr_seq_0089_D35R0102_1010 ; 018
	scrdef scr_seq_0089_D35R0102_103D ; 019
	scrdef scr_seq_0089_D35R0102_106A ; 020
	scrdef scr_seq_0089_D35R0102_1097 ; 021
	scrdef scr_seq_0089_D35R0102_10C4 ; 022
	scrdef scr_seq_0089_D35R0102_10F1 ; 023
	scrdef scr_seq_0089_D35R0102_111E ; 024
	scrdef scr_seq_0089_D35R0102_114B ; 025
	scrdef scr_seq_0089_D35R0102_1178 ; 026
	scrdef scr_seq_0089_D35R0102_11A5 ; 027
	scrdef scr_seq_0089_D35R0102_11D2 ; 028
	scrdef scr_seq_0089_D35R0102_1205 ; 029
	scrdef scr_seq_0089_D35R0102_00DC ; 030
	scrdef scr_seq_0089_D35R0102_0088 ; 031
	scrdef scr_seq_0089_D35R0102_0086 ; 032
	scrdef_end

scr_seq_0089_D35R0102_0086:
	end

scr_seq_0089_D35R0102_0088:
	comparevartovalue VAR_UNK_40AC, 4
	gotoif eq, scr_seq_0089_D35R0102_00BE
	comparevartovalue VAR_UNK_40AC, 5
	gotoif eq, scr_seq_0089_D35R0102_00BE
	comparevartovalue VAR_UNK_40AC, 6
	gotoif eq, scr_seq_0089_D35R0102_00BE
	comparevartovalue VAR_UNK_40AC, 7
	gotoif eq, scr_seq_0089_D35R0102_00BE
	end

scr_seq_0089_D35R0102_00BE:
	setvar VAR_UNK_40AC, 8
	setvar VAR_UNK_40A9, 2
	setflag FLAG_UNK_24B
	setflag FLAG_UNK_24C
	setflag FLAG_UNK_24D
	clearflag FLAG_UNK_252
	end

scr_seq_0089_D35R0102_00DC:
	comparevartovalue VAR_UNK_40AC, 9
	callif ge, scr_seq_0089_D35R0102_025D
	comparevartovalue VAR_UNK_40AD, 2
	gotoif ne, scr_seq_0089_D35R0102_0108
	move_person 0, 44, 0, 3, 2
	goto scr_seq_0089_D35R0102_0133

scr_seq_0089_D35R0102_0108:
	comparevartovalue VAR_UNK_40AD, 1
	gotoif ne, scr_seq_0089_D35R0102_0127
	move_person 0, 44, 0, 3, 1
	goto scr_seq_0089_D35R0102_0133

scr_seq_0089_D35R0102_0127:
	move_person 0, 44, 0, 3, 0
scr_seq_0089_D35R0102_0133:
	comparevartovalue VAR_UNK_40AE, 2
	gotoif ne, scr_seq_0089_D35R0102_0152
	move_person 2, 18, 0, 3, 2
	goto scr_seq_0089_D35R0102_017D

scr_seq_0089_D35R0102_0152:
	comparevartovalue VAR_UNK_40AE, 1
	gotoif ne, scr_seq_0089_D35R0102_0171
	move_person 2, 18, 0, 3, 1
	goto scr_seq_0089_D35R0102_017D

scr_seq_0089_D35R0102_0171:
	move_person 2, 18, 0, 3, 0
scr_seq_0089_D35R0102_017D:
	comparevartovalue VAR_UNK_40AF, 2
	gotoif ne, scr_seq_0089_D35R0102_019C
	move_person 3, 44, 0, 10, 2
	goto scr_seq_0089_D35R0102_01C7

scr_seq_0089_D35R0102_019C:
	comparevartovalue VAR_UNK_40AF, 1
	gotoif ne, scr_seq_0089_D35R0102_01BB
	move_person 3, 44, 0, 10, 1
	goto scr_seq_0089_D35R0102_01C7

scr_seq_0089_D35R0102_01BB:
	move_person 3, 44, 0, 10, 0
scr_seq_0089_D35R0102_01C7:
	comparevartovalue VAR_UNK_40B0, 2
	gotoif ne, scr_seq_0089_D35R0102_01E6
	move_person 4, 44, 0, 28, 2
	goto scr_seq_0089_D35R0102_0211

scr_seq_0089_D35R0102_01E6:
	comparevartovalue VAR_UNK_40B0, 1
	gotoif ne, scr_seq_0089_D35R0102_0205
	move_person 4, 44, 0, 28, 1
	goto scr_seq_0089_D35R0102_0211

scr_seq_0089_D35R0102_0205:
	move_person 4, 44, 0, 28, 0
scr_seq_0089_D35R0102_0211:
	comparevartovalue VAR_UNK_40B1, 2
	gotoif ne, scr_seq_0089_D35R0102_0230
	move_person 5, 18, 0, 28, 2
	goto scr_seq_0089_D35R0102_025B

scr_seq_0089_D35R0102_0230:
	comparevartovalue VAR_UNK_40B1, 1
	gotoif ne, scr_seq_0089_D35R0102_024F
	move_person 5, 18, 0, 28, 1
	goto scr_seq_0089_D35R0102_025B

scr_seq_0089_D35R0102_024F:
	move_person 5, 18, 0, 28, 0
scr_seq_0089_D35R0102_025B:
	end

scr_seq_0089_D35R0102_025D:
	setvar VAR_UNK_40AD, 2
	setvar VAR_UNK_40AE, 2
	setvar VAR_UNK_40AF, 2
	setvar VAR_UNK_40B0, 2
	setvar VAR_UNK_40B1, 2
	return

scr_seq_0089_D35R0102_027D:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_0089_D35R0102_0428
	wait_movement
	apply_movement 0, scr_seq_0089_D35R0102_0454
	wait_movement
	play_se SEQ_SE_GS_AJITO_SIREN
	scrcmd_709
	scrcmd_074 2173
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 4
	gotoif ne, scr_seq_0089_D35R0102_02C4
	addvar VAR_TEMP_x4001, 1
	goto scr_seq_0089_D35R0102_02D0

scr_seq_0089_D35R0102_02BE:
	.byte 0x16, 0x00
	.byte 0x0c, 0x00, 0x00, 0x00
scr_seq_0089_D35R0102_02C4:
	subvar VAR_TEMP_x4001, 1
	goto scr_seq_0089_D35R0102_036C

scr_seq_0089_D35R0102_02D0:
	scrcmd_338 1, 33, 0
	clearflag FLAG_UNK_1E8
	show_person 1
	move_person 1, 33, 0, VAR_TEMP_x4001, 2
	apply_movement 1, scr_seq_0089_D35R0102_0460
	wait_movement
	apply_movement 255, scr_seq_0089_D35R0102_0478
	wait_movement
	npc_msg 0
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_20, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_D35R0102_0C03
	apply_movement 1, scr_seq_0089_D35R0102_0490
	wait_movement
	move_person 1, 33, 0, VAR_TEMP_x4001, 3
	apply_movement 1, scr_seq_0089_D35R0102_0460
	wait_movement
	npc_msg 1
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_21, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_D35R0102_0C03
	apply_movement 1, scr_seq_0089_D35R0102_0490
	wait_movement
	goto scr_seq_0089_D35R0102_0402

scr_seq_0089_D35R0102_036C:
	scrcmd_338 1, 33, 0
	clearflag FLAG_UNK_1E8
	show_person 1
	move_person 1, 33, 0, VAR_TEMP_x4001, 2
	apply_movement 1, scr_seq_0089_D35R0102_046C
	wait_movement
	apply_movement 255, scr_seq_0089_D35R0102_0484
	wait_movement
	npc_msg 0
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_20, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_D35R0102_0C03
	apply_movement 1, scr_seq_0089_D35R0102_0490
	wait_movement
	move_person 1, 33, 0, VAR_TEMP_x4001, 3
	apply_movement 1, scr_seq_0089_D35R0102_046C
	wait_movement
	npc_msg 1
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_21, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_D35R0102_0C03
	apply_movement 1, scr_seq_0089_D35R0102_0490
	wait_movement
scr_seq_0089_D35R0102_0402:
	move_person 1, 37, 0, 0, 2
	setflag FLAG_UNK_1E8
	setvar VAR_UNK_40AD, 2
	apply_movement 0, scr_seq_0089_D35R0102_049C
	wait_movement
	releaseall
	end

scr_seq_0089_D35R0102_0426:
	.byte 0x00, 0x00

scr_seq_0089_D35R0102_0428:
	step 75, 1
	step 63, 2
	step 3, 2
	step 63, 1
	step 2, 2
	step 63, 1
	step 3, 2
	step 63, 1
	step 0, 2
	step 63, 1
	step_end

scr_seq_0089_D35R0102_0454:
	step 75, 1
	step 63, 2
	step_end

scr_seq_0089_D35R0102_0460:
	step 23, 11
	step 0, 2
	step_end

scr_seq_0089_D35R0102_046C:
	step 23, 11
	step 1, 2
	step_end

scr_seq_0089_D35R0102_0478:
	step 1, 2
	step 63, 2
	step_end

scr_seq_0089_D35R0102_0484:
	step 0, 2
	step 63, 2
	step_end

scr_seq_0089_D35R0102_0490:
	step 2, 2
	step 22, 10
	step_end

scr_seq_0089_D35R0102_049C:
	step 2, 1
	step_end

scr_seq_0089_D35R0102_04A4:
	step 1, 1
	step_end

scr_seq_0089_D35R0102_04AC:
	step 0, 1
	step_end
scr_seq_0089_D35R0102_04B4:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_0089_D35R0102_0428
	wait_movement
	apply_movement 2, scr_seq_0089_D35R0102_0454
	wait_movement
	play_se SEQ_SE_GS_AJITO_SIREN
	scrcmd_709
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 4
	gotoif ne, scr_seq_0089_D35R0102_04F7
	addvar VAR_TEMP_x4001, 1
	goto scr_seq_0089_D35R0102_0503

scr_seq_0089_D35R0102_04F1:
	.byte 0x16, 0x00, 0x0c, 0x00, 0x00, 0x00
scr_seq_0089_D35R0102_04F7:
	subvar VAR_TEMP_x4001, 1
	goto scr_seq_0089_D35R0102_05A9

scr_seq_0089_D35R0102_0503:
	scrcmd_338 1, 27, 0
	clearflag FLAG_UNK_1E8
	show_person 1
	move_person 1, 27, 0, VAR_TEMP_x4001, 2
	apply_movement 1, scr_seq_0089_D35R0102_0668
	wait_movement
	apply_movement 255, scr_seq_0089_D35R0102_0478
	wait_movement
	npc_msg 0
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_20, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_D35R0102_0C03
	apply_movement 1, scr_seq_0089_D35R0102_06C8
	wait_movement
	move_person 1, 27, 0, VAR_TEMP_x4001, 2
	apply_movement 1, scr_seq_0089_D35R0102_0668
	wait_movement
	apply_movement 255, scr_seq_0089_D35R0102_0478
	wait_movement
	npc_msg 1
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_21, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_D35R0102_0C03
	apply_movement 1, scr_seq_0089_D35R0102_06C8
	wait_movement
	goto scr_seq_0089_D35R0102_0649

scr_seq_0089_D35R0102_05A9:
	scrcmd_338 1, 27, 0
	clearflag FLAG_UNK_1E8
	show_person 1
	move_person 1, 27, 0, VAR_TEMP_x4001, 2
	apply_movement 1, scr_seq_0089_D35R0102_0674
	wait_movement
	apply_movement 255, scr_seq_0089_D35R0102_0484
	wait_movement
	npc_msg 0
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_20, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_D35R0102_0C03
	apply_movement 1, scr_seq_0089_D35R0102_06C8
	wait_movement
	move_person 1, 27, 0, VAR_TEMP_x4001, 2
	apply_movement 1, scr_seq_0089_D35R0102_0674
	wait_movement
	apply_movement 255, scr_seq_0089_D35R0102_0484
	wait_movement
	npc_msg 1
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_21, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_D35R0102_0C03
	apply_movement 1, scr_seq_0089_D35R0102_06C8
	wait_movement
scr_seq_0089_D35R0102_0649:
	hide_person 1
	setflag FLAG_UNK_1E8
	setvar VAR_UNK_40AE, 2
	apply_movement 2, scr_seq_0089_D35R0102_049C
	wait_movement
	releaseall
	end

scr_seq_0089_D35R0102_0665:
	.byte 0x00, 0x00, 0x00

scr_seq_0089_D35R0102_0668:
	step 22, 9
	step 0, 2
	step_end

scr_seq_0089_D35R0102_0674:
	step 22, 9
	step 1, 2
	step_end

scr_seq_0089_D35R0102_0680:
	step 23, 11
	step 0, 2
	step_end

scr_seq_0089_D35R0102_068C:
	step 23, 11
	step 1, 2
	step_end

scr_seq_0089_D35R0102_0698:
	step 23, 11
	step 0, 2
	step_end

scr_seq_0089_D35R0102_06A4:
	step 23, 11
	step 1, 2
	step_end

scr_seq_0089_D35R0102_06B0:
	step 22, 9
	step 0, 2
	step_end

scr_seq_0089_D35R0102_06BC:
	step 22, 9
	step 1, 2
	step_end

scr_seq_0089_D35R0102_06C8:
	step 3, 2
	step 23, 10
	step_end

scr_seq_0089_D35R0102_06D4:
	step 2, 2
	step 22, 10
	step_end

scr_seq_0089_D35R0102_06E0:
	step 2, 2
	step 22, 10
	step_end

scr_seq_0089_D35R0102_06EC:
	step 3, 2
	step 23, 10
	step_end
scr_seq_0089_D35R0102_06F8:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_0089_D35R0102_0428
	wait_movement
	apply_movement 3, scr_seq_0089_D35R0102_0454
	wait_movement
	play_se SEQ_SE_GS_AJITO_SIREN
	scrcmd_709
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 11
	gotoif ne, scr_seq_0089_D35R0102_073B
	addvar VAR_TEMP_x4001, 1
	goto scr_seq_0089_D35R0102_0747

scr_seq_0089_D35R0102_0735:
	.byte 0x16, 0x00, 0x0c, 0x00, 0x00, 0x00
scr_seq_0089_D35R0102_073B:
	subvar VAR_TEMP_x4001, 1
	goto scr_seq_0089_D35R0102_07ED

scr_seq_0089_D35R0102_0747:
	scrcmd_338 1, 33, 0
	clearflag FLAG_UNK_1E8
	show_person 1
	move_person 1, 33, 0, VAR_TEMP_x4001, 2
	apply_movement 1, scr_seq_0089_D35R0102_0680
	wait_movement
	apply_movement 255, scr_seq_0089_D35R0102_0478
	wait_movement
	npc_msg 0
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_20, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_D35R0102_0C03
	apply_movement 1, scr_seq_0089_D35R0102_06D4
	wait_movement
	move_person 1, 33, 0, VAR_TEMP_x4001, 2
	apply_movement 1, scr_seq_0089_D35R0102_0680
	wait_movement
	apply_movement 255, scr_seq_0089_D35R0102_0478
	wait_movement
	npc_msg 1
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_21, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_D35R0102_0C03
	apply_movement 1, scr_seq_0089_D35R0102_06D4
	wait_movement
	goto scr_seq_0089_D35R0102_088D

scr_seq_0089_D35R0102_07ED:
	scrcmd_338 1, 33, 0
	clearflag FLAG_UNK_1E8
	show_person 1
	move_person 1, 33, 0, VAR_TEMP_x4001, 2
	apply_movement 1, scr_seq_0089_D35R0102_068C
	wait_movement
	apply_movement 255, scr_seq_0089_D35R0102_0484
	wait_movement
	npc_msg 0
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_20, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_D35R0102_0C03
	apply_movement 1, scr_seq_0089_D35R0102_06D4
	wait_movement
	move_person 1, 33, 0, VAR_TEMP_x4001, 2
	apply_movement 1, scr_seq_0089_D35R0102_068C
	wait_movement
	apply_movement 255, scr_seq_0089_D35R0102_0484
	wait_movement
	npc_msg 1
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_21, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_D35R0102_0C03
	apply_movement 1, scr_seq_0089_D35R0102_06D4
	wait_movement
scr_seq_0089_D35R0102_088D:
	hide_person 1
	setflag FLAG_UNK_1E8
	setvar VAR_UNK_40AF, 2
	apply_movement 3, scr_seq_0089_D35R0102_049C
	wait_movement
	releaseall
	end

scr_seq_0089_D35R0102_08A9:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_0089_D35R0102_0428
	wait_movement
	apply_movement 4, scr_seq_0089_D35R0102_0454
	wait_movement
	play_se SEQ_SE_GS_AJITO_SIREN
	scrcmd_709
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 29
	gotoif ne, scr_seq_0089_D35R0102_08EC
	addvar VAR_TEMP_x4001, 1
	goto scr_seq_0089_D35R0102_08F8

scr_seq_0089_D35R0102_08E6:
	.byte 0x16, 0x00, 0x0c, 0x00, 0x00, 0x00
scr_seq_0089_D35R0102_08EC:
	subvar VAR_TEMP_x4001, 1
	goto scr_seq_0089_D35R0102_099E

scr_seq_0089_D35R0102_08F8:
	scrcmd_338 1, 33, 0
	clearflag FLAG_UNK_1E8
	show_person 1
	move_person 1, 33, 0, VAR_TEMP_x4001, 2
	apply_movement 1, scr_seq_0089_D35R0102_0698
	wait_movement
	apply_movement 255, scr_seq_0089_D35R0102_0478
	wait_movement
	npc_msg 0
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_20, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_D35R0102_0C03
	apply_movement 1, scr_seq_0089_D35R0102_06E0
	wait_movement
	move_person 1, 33, 0, VAR_TEMP_x4001, 2
	apply_movement 1, scr_seq_0089_D35R0102_0698
	wait_movement
	apply_movement 255, scr_seq_0089_D35R0102_0478
	wait_movement
	npc_msg 1
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_21, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_D35R0102_0C03
	apply_movement 1, scr_seq_0089_D35R0102_06E0
	wait_movement
	goto scr_seq_0089_D35R0102_0A3E

scr_seq_0089_D35R0102_099E:
	scrcmd_338 1, 33, 0
	clearflag FLAG_UNK_1E8
	show_person 1
	move_person 1, 33, 0, VAR_TEMP_x4001, 2
	apply_movement 1, scr_seq_0089_D35R0102_06A4
	wait_movement
	apply_movement 255, scr_seq_0089_D35R0102_0484
	wait_movement
	npc_msg 0
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_20, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_D35R0102_0C03
	apply_movement 1, scr_seq_0089_D35R0102_06E0
	wait_movement
	move_person 1, 33, 0, VAR_TEMP_x4001, 2
	apply_movement 1, scr_seq_0089_D35R0102_06A4
	wait_movement
	apply_movement 255, scr_seq_0089_D35R0102_0484
	wait_movement
	npc_msg 1
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_21, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_D35R0102_0C03
	apply_movement 1, scr_seq_0089_D35R0102_06E0
	wait_movement
scr_seq_0089_D35R0102_0A3E:
	hide_person 1
	setvar VAR_UNK_40B0, 2
	apply_movement 4, scr_seq_0089_D35R0102_049C
	wait_movement
	releaseall
	end

scr_seq_0089_D35R0102_0A56:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_0089_D35R0102_0428
	wait_movement
	apply_movement 5, scr_seq_0089_D35R0102_0454
	wait_movement
	play_se SEQ_SE_GS_AJITO_SIREN
	scrcmd_709
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 29
	gotoif ne, scr_seq_0089_D35R0102_0A99
	addvar VAR_TEMP_x4001, 1
	goto scr_seq_0089_D35R0102_0AA5

scr_seq_0089_D35R0102_0A93:
	.byte 0x16, 0x00, 0x0c, 0x00, 0x00, 0x00
scr_seq_0089_D35R0102_0A99:
	subvar VAR_TEMP_x4001, 1
	goto scr_seq_0089_D35R0102_0B4B

scr_seq_0089_D35R0102_0AA5:
	scrcmd_338 1, 27, 0
	clearflag FLAG_UNK_1E8
	show_person 1
	move_person 1, 27, 0, VAR_TEMP_x4001, 2
	apply_movement 1, scr_seq_0089_D35R0102_06B0
	wait_movement
	apply_movement 255, scr_seq_0089_D35R0102_0478
	wait_movement
	npc_msg 0
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_20, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_D35R0102_0C03
	apply_movement 1, scr_seq_0089_D35R0102_06EC
	wait_movement
	move_person 1, 27, 0, VAR_TEMP_x4001, 2
	apply_movement 1, scr_seq_0089_D35R0102_06B0
	wait_movement
	apply_movement 255, scr_seq_0089_D35R0102_0478
	wait_movement
	npc_msg 1
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_21, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_D35R0102_0C03
	apply_movement 1, scr_seq_0089_D35R0102_06EC
	wait_movement
	goto scr_seq_0089_D35R0102_0BEB

scr_seq_0089_D35R0102_0B4B:
	scrcmd_338 1, 27, 0
	clearflag FLAG_UNK_1E8
	show_person 1
	move_person 1, 27, 0, VAR_TEMP_x4001, 2
	apply_movement 1, scr_seq_0089_D35R0102_06BC
	wait_movement
	apply_movement 255, scr_seq_0089_D35R0102_0484
	wait_movement
	npc_msg 0
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_20, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_D35R0102_0C03
	apply_movement 1, scr_seq_0089_D35R0102_06EC
	wait_movement
	move_person 1, 27, 0, VAR_TEMP_x4001, 2
	apply_movement 1, scr_seq_0089_D35R0102_06BC
	wait_movement
	apply_movement 255, scr_seq_0089_D35R0102_0484
	wait_movement
	npc_msg 1
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_21, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_D35R0102_0C03
	apply_movement 1, scr_seq_0089_D35R0102_06EC
	wait_movement
scr_seq_0089_D35R0102_0BEB:
	hide_person 1
	setvar VAR_UNK_40B1, 2
	apply_movement 5, scr_seq_0089_D35R0102_049C
	wait_movement
	releaseall
	end

scr_seq_0089_D35R0102_0C03:
	white_out
	releaseall
	end

scr_seq_0089_D35R0102_0C09:
	play_se SEQ_SE_DP_SELECT
	lockall
	comparevartovalue VAR_UNK_40AD, 0
	gotoif ne, scr_seq_0089_D35R0102_0C2B
	npc_msg 2
	goto scr_seq_0089_D35R0102_0C4A

scr_seq_0089_D35R0102_0C25:
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
scr_seq_0089_D35R0102_0C2B:
	comparevartovalue VAR_UNK_40AD, 1
	gotoif ne, scr_seq_0089_D35R0102_0C47
	npc_msg 3
	goto scr_seq_0089_D35R0102_0C4A

scr_seq_0089_D35R0102_0C41:
	.byte 0x16, 0x00, 0x03, 0x00, 0x00, 0x00
scr_seq_0089_D35R0102_0C47:
	npc_msg 4
scr_seq_0089_D35R0102_0C4A:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0089_D35R0102_0C52:
	play_se SEQ_SE_DP_SELECT
	lockall
	comparevartovalue VAR_UNK_40AE, 0
	gotoif ne, scr_seq_0089_D35R0102_0C74
	npc_msg 2
	goto scr_seq_0089_D35R0102_0C4A

scr_seq_0089_D35R0102_0C6E:
	.byte 0x16, 0x00
	.byte 0x1f, 0x00, 0x00, 0x00
scr_seq_0089_D35R0102_0C74:
	comparevartovalue VAR_UNK_40AE, 1
	gotoif ne, scr_seq_0089_D35R0102_0C90
	npc_msg 3
	goto scr_seq_0089_D35R0102_0C4A

scr_seq_0089_D35R0102_0C8A:
	.byte 0x16, 0x00, 0x03, 0x00, 0x00, 0x00
scr_seq_0089_D35R0102_0C90:
	npc_msg 4
	goto scr_seq_0089_D35R0102_0C4A

scr_seq_0089_D35R0102_0C99:
	play_se SEQ_SE_DP_SELECT
	lockall
	comparevartovalue VAR_UNK_40AF, 0
	gotoif ne, scr_seq_0089_D35R0102_0CBB
	npc_msg 2
	goto scr_seq_0089_D35R0102_0C4A

scr_seq_0089_D35R0102_0CB5:
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
scr_seq_0089_D35R0102_0CBB:
	comparevartovalue VAR_UNK_40AF, 1
	gotoif ne, scr_seq_0089_D35R0102_0CD7
	npc_msg 3
	goto scr_seq_0089_D35R0102_0C4A

scr_seq_0089_D35R0102_0CD1:
	.byte 0x16, 0x00, 0x03, 0x00, 0x00, 0x00
scr_seq_0089_D35R0102_0CD7:
	npc_msg 4
	goto scr_seq_0089_D35R0102_0C4A

scr_seq_0089_D35R0102_0CE0:
	play_se SEQ_SE_DP_SELECT
	lockall
	comparevartovalue VAR_UNK_40B0, 0
	gotoif ne, scr_seq_0089_D35R0102_0D02
	npc_msg 2
	goto scr_seq_0089_D35R0102_0C4A

scr_seq_0089_D35R0102_0CFC:
	.byte 0x16, 0x00, 0x1f, 0x00
	.byte 0x00, 0x00
scr_seq_0089_D35R0102_0D02:
	comparevartovalue VAR_UNK_40B0, 1
	gotoif ne, scr_seq_0089_D35R0102_0D1E
	npc_msg 3
	goto scr_seq_0089_D35R0102_0C4A

scr_seq_0089_D35R0102_0D18:
	.byte 0x16, 0x00, 0x03, 0x00, 0x00, 0x00
scr_seq_0089_D35R0102_0D1E:
	npc_msg 4
	goto scr_seq_0089_D35R0102_0C4A

scr_seq_0089_D35R0102_0D27:
	play_se SEQ_SE_DP_SELECT
	lockall
	comparevartovalue VAR_UNK_40B1, 0
	gotoif ne, scr_seq_0089_D35R0102_0D49
	npc_msg 2
	goto scr_seq_0089_D35R0102_0C4A

scr_seq_0089_D35R0102_0D43:
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
scr_seq_0089_D35R0102_0D49:
	comparevartovalue VAR_UNK_40B1, 1
	gotoif ne, scr_seq_0089_D35R0102_0D65
	npc_msg 3
	goto scr_seq_0089_D35R0102_0C4A

scr_seq_0089_D35R0102_0D5F:
	.byte 0x16
	.byte 0x00, 0x03, 0x00, 0x00, 0x00
scr_seq_0089_D35R0102_0D65:
	npc_msg 4
	goto scr_seq_0089_D35R0102_0C4A

scr_seq_0089_D35R0102_0D6E:
	end

scr_seq_0089_D35R0102_0D70:
	end

scr_seq_0089_D35R0102_0D72:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40AC, 9
	gotoif ge, scr_seq_0089_D35R0102_0F24
	checkflag FLAG_UNK_0D6
	gotoif TRUE, scr_seq_0089_D35R0102_0E58
	npc_msg 5
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_D35R0102_0DB7
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0089_D35R0102_0F1E
scr_seq_0089_D35R0102_0DB7:
	play_se SEQ_SE_DP_DENSI01
	npc_msg 7
	closemsg
	setflag FLAG_UNK_0D6
	comparevartovalue VAR_UNK_40AD, 2
	gotoif ge, scr_seq_0089_D35R0102_0DDF
	setvar VAR_UNK_40AD, 1
	apply_movement 0, scr_seq_0089_D35R0102_04A4
scr_seq_0089_D35R0102_0DDF:
	comparevartovalue VAR_UNK_40AE, 2
	gotoif ge, scr_seq_0089_D35R0102_0DFA
	setvar VAR_UNK_40AE, 1
	apply_movement 2, scr_seq_0089_D35R0102_04A4
scr_seq_0089_D35R0102_0DFA:
	comparevartovalue VAR_UNK_40AF, 2
	gotoif ge, scr_seq_0089_D35R0102_0E15
	setvar VAR_UNK_40AF, 1
	apply_movement 3, scr_seq_0089_D35R0102_04A4
scr_seq_0089_D35R0102_0E15:
	comparevartovalue VAR_UNK_40B0, 2
	gotoif ge, scr_seq_0089_D35R0102_0E30
	setvar VAR_UNK_40B0, 1
	apply_movement 4, scr_seq_0089_D35R0102_04A4
scr_seq_0089_D35R0102_0E30:
	comparevartovalue VAR_UNK_40B1, 2
	gotoif ge, scr_seq_0089_D35R0102_0E4D
	setvar VAR_UNK_40B1, 1
	apply_movement 5, scr_seq_0089_D35R0102_04A4
	wait_movement
scr_seq_0089_D35R0102_0E4D:
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0089_D35R0102_0E58:
	npc_msg 6
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_D35R0102_0E7D
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0089_D35R0102_0F1E
scr_seq_0089_D35R0102_0E7D:
	play_se SEQ_SE_DP_DENSI01
	npc_msg 7
	closemsg
	clearflag FLAG_UNK_0D6
	comparevartovalue VAR_UNK_40AD, 2
	gotoif ge, scr_seq_0089_D35R0102_0EA5
	setvar VAR_UNK_40AD, 0
	apply_movement 0, scr_seq_0089_D35R0102_04AC
scr_seq_0089_D35R0102_0EA5:
	comparevartovalue VAR_UNK_40AE, 2
	gotoif ge, scr_seq_0089_D35R0102_0EC0
	setvar VAR_UNK_40AE, 0
	apply_movement 2, scr_seq_0089_D35R0102_04AC
scr_seq_0089_D35R0102_0EC0:
	comparevartovalue VAR_UNK_40AF, 2
	gotoif ge, scr_seq_0089_D35R0102_0EDB
	setvar VAR_UNK_40AF, 0
	apply_movement 3, scr_seq_0089_D35R0102_04AC
scr_seq_0089_D35R0102_0EDB:
	comparevartovalue VAR_UNK_40B0, 2
	gotoif ge, scr_seq_0089_D35R0102_0EF6
	setvar VAR_UNK_40B0, 0
	apply_movement 4, scr_seq_0089_D35R0102_04AC
scr_seq_0089_D35R0102_0EF6:
	comparevartovalue VAR_UNK_40B1, 2
	gotoif ge, scr_seq_0089_D35R0102_0F13
	setvar VAR_UNK_40B1, 0
	apply_movement 5, scr_seq_0089_D35R0102_04AC
	wait_movement
scr_seq_0089_D35R0102_0F13:
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0089_D35R0102_0F1E:
	closemsg
	releaseall
	end

scr_seq_0089_D35R0102_0F24:
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0089_D35R0102_0F2F:
	scrcmd_609
	lockall
	scrcmd_708 1
	play_se SEQ_SE_GS_DOKU_TRAP
	scrcmd_249 109, 21
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_D35R0102_11FF
	setvar VAR_UNK_40B2, 1
	releaseall
	end

scr_seq_0089_D35R0102_0F5C:
	scrcmd_609
	lockall
	scrcmd_708 0
	play_se SEQ_SE_GS_DENKI_TRAP
	scrcmd_249 100, 23
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_D35R0102_11FF
	setvar VAR_UNK_40B3, 1
	releaseall
	end

scr_seq_0089_D35R0102_0F89:
	scrcmd_609
	lockall
	scrcmd_708 2
	play_se SEQ_SE_GS_IWA_TRAP
	scrcmd_249 74, 21
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_D35R0102_11FF
	setvar VAR_UNK_40B4, 1
	releaseall
	end

scr_seq_0089_D35R0102_0FB6:
	scrcmd_609
	lockall
	scrcmd_708 0
	play_se SEQ_SE_GS_DENKI_TRAP
	scrcmd_249 100, 23
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_D35R0102_11FF
	setvar VAR_UNK_40B5, 1
	releaseall
	end

scr_seq_0089_D35R0102_0FE3:
	scrcmd_609
	lockall
	scrcmd_708 2
	play_se SEQ_SE_GS_IWA_TRAP
	scrcmd_249 74, 21
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_D35R0102_11FF
	setvar VAR_UNK_40B6, 1
	releaseall
	end

scr_seq_0089_D35R0102_1010:
	scrcmd_609
	lockall
	scrcmd_708 0
	play_se SEQ_SE_GS_DENKI_TRAP
	scrcmd_249 100, 23
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_D35R0102_11FF
	setvar VAR_UNK_40B7, 1
	releaseall
	end

scr_seq_0089_D35R0102_103D:
	scrcmd_609
	lockall
	scrcmd_708 0
	play_se SEQ_SE_GS_DENKI_TRAP
	scrcmd_249 100, 23
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_D35R0102_11FF
	setvar VAR_UNK_40B8, 1
	releaseall
	end

scr_seq_0089_D35R0102_106A:
	scrcmd_609
	lockall
	scrcmd_708 1
	play_se SEQ_SE_GS_DOKU_TRAP
	scrcmd_249 109, 21
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_D35R0102_11FF
	setvar VAR_UNK_40B9, 1
	releaseall
	end

scr_seq_0089_D35R0102_1097:
	scrcmd_609
	lockall
	scrcmd_708 1
	play_se SEQ_SE_GS_DOKU_TRAP
	scrcmd_249 109, 21
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_D35R0102_11FF
	setvar VAR_UNK_40BA, 1
	releaseall
	end

scr_seq_0089_D35R0102_10C4:
	scrcmd_609
	lockall
	scrcmd_708 2
	play_se SEQ_SE_GS_IWA_TRAP
	scrcmd_249 74, 21
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_D35R0102_11FF
	setvar VAR_UNK_40BB, 1
	releaseall
	end

scr_seq_0089_D35R0102_10F1:
	scrcmd_609
	lockall
	scrcmd_708 2
	play_se SEQ_SE_GS_IWA_TRAP
	scrcmd_249 74, 21
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_D35R0102_11FF
	setvar VAR_UNK_40BC, 1
	releaseall
	end

scr_seq_0089_D35R0102_111E:
	scrcmd_609
	lockall
	scrcmd_708 1
	play_se SEQ_SE_GS_DOKU_TRAP
	scrcmd_249 109, 21
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_D35R0102_11FF
	setvar VAR_UNK_40BD, 1
	releaseall
	end

scr_seq_0089_D35R0102_114B:
	scrcmd_609
	lockall
	scrcmd_708 0
	play_se SEQ_SE_GS_DENKI_TRAP
	scrcmd_249 100, 23
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_D35R0102_11FF
	setvar VAR_UNK_40BE, 1
	releaseall
	end

scr_seq_0089_D35R0102_1178:
	scrcmd_609
	lockall
	scrcmd_708 0
	play_se SEQ_SE_GS_DENKI_TRAP
	scrcmd_249 100, 23
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_D35R0102_11FF
	setvar VAR_UNK_40BF, 1
	releaseall
	end

scr_seq_0089_D35R0102_11A5:
	scrcmd_609
	lockall
	scrcmd_708 1
	play_se SEQ_SE_GS_DOKU_TRAP
	scrcmd_249 109, 21
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_D35R0102_11FF
	setvar VAR_UNK_40C0, 1
	releaseall
	end

scr_seq_0089_D35R0102_11D2:
	scrcmd_609
	lockall
	scrcmd_708 2
	play_se SEQ_SE_GS_IWA_TRAP
	scrcmd_249 74, 21
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0089_D35R0102_11FF
	setvar VAR_UNK_40C1, 1
	releaseall
	end

scr_seq_0089_D35R0102_11FF:
	white_out
	releaseall
	end

scr_seq_0089_D35R0102_1205:
	scrcmd_609
	lockall
	play_se SEQ_SE_PL_BOWABOWA
	fade_screen 6, 1, 0, 0x00
	wait_fade
	wait 15, VAR_SPECIAL_x800C
	scrcmd_176 247, 0, 50, 4, 2
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end
	.balign 4, 0
