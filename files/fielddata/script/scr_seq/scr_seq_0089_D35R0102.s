#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D35R0102.h"
#include "msgdata/msg/msg_0112_D35R0102.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D35R0102_000
	scrdef scr_seq_D35R0102_001
	scrdef scr_seq_D35R0102_002
	scrdef scr_seq_D35R0102_003
	scrdef scr_seq_D35R0102_004
	scrdef scr_seq_D35R0102_005
	scrdef scr_seq_D35R0102_006
	scrdef scr_seq_D35R0102_007
	scrdef scr_seq_D35R0102_008
	scrdef scr_seq_D35R0102_009
	scrdef scr_seq_D35R0102_010
	scrdef scr_seq_D35R0102_011
	scrdef scr_seq_D35R0102_012
	scrdef scr_seq_D35R0102_013
	scrdef scr_seq_D35R0102_014
	scrdef scr_seq_D35R0102_015
	scrdef scr_seq_D35R0102_016
	scrdef scr_seq_D35R0102_017
	scrdef scr_seq_D35R0102_018
	scrdef scr_seq_D35R0102_019
	scrdef scr_seq_D35R0102_020
	scrdef scr_seq_D35R0102_021
	scrdef scr_seq_D35R0102_022
	scrdef scr_seq_D35R0102_023
	scrdef scr_seq_D35R0102_024
	scrdef scr_seq_D35R0102_025
	scrdef scr_seq_D35R0102_026
	scrdef scr_seq_D35R0102_027
	scrdef scr_seq_D35R0102_028
	scrdef scr_seq_D35R0102_029
	scrdef scr_seq_D35R0102_030
	scrdef scr_seq_D35R0102_031
	scrdef scr_seq_D35R0102_032
	scrdef_end

scr_seq_D35R0102_032:
	end

scr_seq_D35R0102_031:
	compare VAR_UNK_40AC, 4
	goto_if_eq _00BE
	compare VAR_UNK_40AC, 5
	goto_if_eq _00BE
	compare VAR_UNK_40AC, 6
	goto_if_eq _00BE
	compare VAR_UNK_40AC, 7
	goto_if_eq _00BE
	end

_00BE:
	setvar VAR_UNK_40AC, 8
	setvar VAR_UNK_40A9, 2
	setflag FLAG_HIDE_ROCKET_HIDEOUT_B2F_MURKROW_1
	setflag FLAG_HIDE_ROCKET_HIDEOUT_B3F_MURKROW_2
	setflag FLAG_HIDE_ROCKET_HIDEOUT_B2F_MURKROW_2
	clearflag FLAG_HIDE_ROCKET_HIDEOUT_B2F_MURKROW_3
	end

scr_seq_D35R0102_030:
	compare VAR_UNK_40AC, 9
	call_if_ge _025D
	compare VAR_UNK_40AD, 2
	goto_if_ne _0108
	move_person_facing obj_D35R0102_aji_peru, 44, 0, 3, DIR_WEST
	goto _0133

_0108:
	compare VAR_UNK_40AD, 1
	goto_if_ne _0127
	move_person_facing obj_D35R0102_aji_peru, 44, 0, 3, DIR_SOUTH
	goto _0133

_0127:
	move_person_facing obj_D35R0102_aji_peru, 44, 0, 3, DIR_NORTH
_0133:
	compare VAR_UNK_40AE, 2
	goto_if_ne _0152
	move_person_facing obj_D35R0102_aji_peru_2, 18, 0, 3, DIR_WEST
	goto _017D

_0152:
	compare VAR_UNK_40AE, 1
	goto_if_ne _0171
	move_person_facing obj_D35R0102_aji_peru_2, 18, 0, 3, DIR_SOUTH
	goto _017D

_0171:
	move_person_facing obj_D35R0102_aji_peru_2, 18, 0, 3, DIR_NORTH
_017D:
	compare VAR_UNK_40AF, 2
	goto_if_ne _019C
	move_person_facing obj_D35R0102_aji_peru_3, 44, 0, 10, DIR_WEST
	goto _01C7

_019C:
	compare VAR_UNK_40AF, 1
	goto_if_ne _01BB
	move_person_facing obj_D35R0102_aji_peru_3, 44, 0, 10, DIR_SOUTH
	goto _01C7

_01BB:
	move_person_facing obj_D35R0102_aji_peru_3, 44, 0, 10, DIR_NORTH
_01C7:
	compare VAR_UNK_40B0, 2
	goto_if_ne _01E6
	move_person_facing obj_D35R0102_aji_peru_4, 44, 0, 28, DIR_WEST
	goto _0211

_01E6:
	compare VAR_UNK_40B0, 1
	goto_if_ne _0205
	move_person_facing obj_D35R0102_aji_peru_4, 44, 0, 28, DIR_SOUTH
	goto _0211

_0205:
	move_person_facing obj_D35R0102_aji_peru_4, 44, 0, 28, DIR_NORTH
_0211:
	compare VAR_UNK_40B1, 2
	goto_if_ne _0230
	move_person_facing obj_D35R0102_aji_peru_5, 18, 0, 28, DIR_WEST
	goto _025B

_0230:
	compare VAR_UNK_40B1, 1
	goto_if_ne _024F
	move_person_facing obj_D35R0102_aji_peru_5, 18, 0, 28, DIR_SOUTH
	goto _025B

_024F:
	move_person_facing obj_D35R0102_aji_peru_5, 18, 0, 28, DIR_NORTH
_025B:
	end

_025D:
	setvar VAR_UNK_40AD, 2
	setvar VAR_UNK_40AE, 2
	setvar VAR_UNK_40AF, 2
	setvar VAR_UNK_40B0, 2
	setvar VAR_UNK_40B1, 2
	return

scr_seq_D35R0102_000:
	scrcmd_609
	lockall
	apply_movement obj_player, _0428
	wait_movement
	apply_movement obj_D35R0102_aji_peru, _0454
	wait_movement
	play_se SEQ_SE_GS_AJITO_SIREN
	scrcmd_709
	stop_se SEQ_SE_GS_AJITO_SIREN
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 4
	goto_if_ne _02C4
	addvar VAR_TEMP_x4001, 1
	goto _02D0
	.byte 0x16, 0x00
	.byte 0x0c, 0x00, 0x00, 0x00
_02C4:
	subvar VAR_TEMP_x4001, 1
	goto _036C

_02D0:
	move_person obj_D35R0102_rocketm, 33, 0
	clearflag FLAG_UNK_1E8
	show_person obj_D35R0102_rocketm
	move_person_facing obj_D35R0102_rocketm, 33, 0, VAR_TEMP_x4001, DIR_WEST
	apply_movement obj_D35R0102_rocketm, _0460
	wait_movement
	apply_movement obj_player, _0478
	wait_movement
	npc_msg msg_0112_D35R0102_00000
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_20, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0C03
	apply_movement obj_D35R0102_rocketm, _0490
	wait_movement
	move_person_facing obj_D35R0102_rocketm, 33, 0, VAR_TEMP_x4001, DIR_EAST
	apply_movement obj_D35R0102_rocketm, _0460
	wait_movement
	npc_msg msg_0112_D35R0102_00001
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_21, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0C03
	apply_movement obj_D35R0102_rocketm, _0490
	wait_movement
	goto _0402

_036C:
	move_person obj_D35R0102_rocketm, 33, 0
	clearflag FLAG_UNK_1E8
	show_person obj_D35R0102_rocketm
	move_person_facing obj_D35R0102_rocketm, 33, 0, VAR_TEMP_x4001, DIR_WEST
	apply_movement obj_D35R0102_rocketm, _046C
	wait_movement
	apply_movement obj_player, _0484
	wait_movement
	npc_msg msg_0112_D35R0102_00000
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_20, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0C03
	apply_movement obj_D35R0102_rocketm, _0490
	wait_movement
	move_person_facing obj_D35R0102_rocketm, 33, 0, VAR_TEMP_x4001, DIR_EAST
	apply_movement obj_D35R0102_rocketm, _046C
	wait_movement
	npc_msg msg_0112_D35R0102_00001
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_21, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0C03
	apply_movement obj_D35R0102_rocketm, _0490
	wait_movement
_0402:
	move_person_facing obj_D35R0102_rocketm, 37, 0, 0, DIR_WEST
	setflag FLAG_UNK_1E8
	setvar VAR_UNK_40AD, 2
	apply_movement obj_D35R0102_aji_peru, _049C
	wait_movement
	releaseall
	end
	.byte 0x00, 0x00

_0428:
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

_0454:
	step 75, 1
	step 63, 2
	step_end

_0460:
	step 23, 11
	step 0, 2
	step_end

_046C:
	step 23, 11
	step 1, 2
	step_end

_0478:
	step 1, 2
	step 63, 2
	step_end

_0484:
	step 0, 2
	step 63, 2
	step_end

_0490:
	step 2, 2
	step 22, 10
	step_end

_049C:
	step 2, 1
	step_end

_04A4:
	step 1, 1
	step_end

_04AC:
	step 0, 1
	step_end
scr_seq_D35R0102_005:
	scrcmd_609
	lockall
	apply_movement obj_player, _0428
	wait_movement
	apply_movement obj_D35R0102_aji_peru_2, _0454
	wait_movement
	play_se SEQ_SE_GS_AJITO_SIREN
	scrcmd_709
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 4
	goto_if_ne _04F7
	addvar VAR_TEMP_x4001, 1
	goto _0503
	.byte 0x16, 0x00, 0x0c, 0x00, 0x00, 0x00
_04F7:
	subvar VAR_TEMP_x4001, 1
	goto _05A9

_0503:
	move_person obj_D35R0102_rocketm, 27, 0
	clearflag FLAG_UNK_1E8
	show_person obj_D35R0102_rocketm
	move_person_facing obj_D35R0102_rocketm, 27, 0, VAR_TEMP_x4001, DIR_WEST
	apply_movement obj_D35R0102_rocketm, _0668
	wait_movement
	apply_movement obj_player, _0478
	wait_movement
	npc_msg msg_0112_D35R0102_00000
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_20, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0C03
	apply_movement obj_D35R0102_rocketm, _06C8
	wait_movement
	move_person_facing obj_D35R0102_rocketm, 27, 0, VAR_TEMP_x4001, DIR_WEST
	apply_movement obj_D35R0102_rocketm, _0668
	wait_movement
	apply_movement obj_player, _0478
	wait_movement
	npc_msg msg_0112_D35R0102_00001
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_21, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0C03
	apply_movement obj_D35R0102_rocketm, _06C8
	wait_movement
	goto _0649

_05A9:
	move_person obj_D35R0102_rocketm, 27, 0
	clearflag FLAG_UNK_1E8
	show_person obj_D35R0102_rocketm
	move_person_facing obj_D35R0102_rocketm, 27, 0, VAR_TEMP_x4001, DIR_WEST
	apply_movement obj_D35R0102_rocketm, _0674
	wait_movement
	apply_movement obj_player, _0484
	wait_movement
	npc_msg msg_0112_D35R0102_00000
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_20, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0C03
	apply_movement obj_D35R0102_rocketm, _06C8
	wait_movement
	move_person_facing obj_D35R0102_rocketm, 27, 0, VAR_TEMP_x4001, DIR_WEST
	apply_movement obj_D35R0102_rocketm, _0674
	wait_movement
	apply_movement obj_player, _0484
	wait_movement
	npc_msg msg_0112_D35R0102_00001
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_21, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0C03
	apply_movement obj_D35R0102_rocketm, _06C8
	wait_movement
_0649:
	hide_person obj_D35R0102_rocketm
	setflag FLAG_UNK_1E8
	setvar VAR_UNK_40AE, 2
	apply_movement obj_D35R0102_aji_peru_2, _049C
	wait_movement
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_0668:
	step 22, 9
	step 0, 2
	step_end

_0674:
	step 22, 9
	step 1, 2
	step_end

_0680:
	step 23, 11
	step 0, 2
	step_end

_068C:
	step 23, 11
	step 1, 2
	step_end

_0698:
	step 23, 11
	step 0, 2
	step_end

_06A4:
	step 23, 11
	step 1, 2
	step_end

_06B0:
	step 22, 9
	step 0, 2
	step_end

_06BC:
	step 22, 9
	step 1, 2
	step_end

_06C8:
	step 3, 2
	step 23, 10
	step_end

_06D4:
	step 2, 2
	step 22, 10
	step_end

_06E0:
	step 2, 2
	step 22, 10
	step_end

_06EC:
	step 3, 2
	step 23, 10
	step_end
scr_seq_D35R0102_006:
	scrcmd_609
	lockall
	apply_movement obj_player, _0428
	wait_movement
	apply_movement obj_D35R0102_aji_peru_3, _0454
	wait_movement
	play_se SEQ_SE_GS_AJITO_SIREN
	scrcmd_709
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 11
	goto_if_ne _073B
	addvar VAR_TEMP_x4001, 1
	goto _0747
	.byte 0x16, 0x00, 0x0c, 0x00, 0x00, 0x00
_073B:
	subvar VAR_TEMP_x4001, 1
	goto _07ED

_0747:
	move_person obj_D35R0102_rocketm, 33, 0
	clearflag FLAG_UNK_1E8
	show_person obj_D35R0102_rocketm
	move_person_facing obj_D35R0102_rocketm, 33, 0, VAR_TEMP_x4001, DIR_WEST
	apply_movement obj_D35R0102_rocketm, _0680
	wait_movement
	apply_movement obj_player, _0478
	wait_movement
	npc_msg msg_0112_D35R0102_00000
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_20, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0C03
	apply_movement obj_D35R0102_rocketm, _06D4
	wait_movement
	move_person_facing obj_D35R0102_rocketm, 33, 0, VAR_TEMP_x4001, DIR_WEST
	apply_movement obj_D35R0102_rocketm, _0680
	wait_movement
	apply_movement obj_player, _0478
	wait_movement
	npc_msg msg_0112_D35R0102_00001
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_21, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0C03
	apply_movement obj_D35R0102_rocketm, _06D4
	wait_movement
	goto _088D

_07ED:
	move_person obj_D35R0102_rocketm, 33, 0
	clearflag FLAG_UNK_1E8
	show_person obj_D35R0102_rocketm
	move_person_facing obj_D35R0102_rocketm, 33, 0, VAR_TEMP_x4001, DIR_WEST
	apply_movement obj_D35R0102_rocketm, _068C
	wait_movement
	apply_movement obj_player, _0484
	wait_movement
	npc_msg msg_0112_D35R0102_00000
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_20, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0C03
	apply_movement obj_D35R0102_rocketm, _06D4
	wait_movement
	move_person_facing obj_D35R0102_rocketm, 33, 0, VAR_TEMP_x4001, DIR_WEST
	apply_movement obj_D35R0102_rocketm, _068C
	wait_movement
	apply_movement obj_player, _0484
	wait_movement
	npc_msg msg_0112_D35R0102_00001
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_21, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0C03
	apply_movement obj_D35R0102_rocketm, _06D4
	wait_movement
_088D:
	hide_person obj_D35R0102_rocketm
	setflag FLAG_UNK_1E8
	setvar VAR_UNK_40AF, 2
	apply_movement obj_D35R0102_aji_peru_3, _049C
	wait_movement
	releaseall
	end

scr_seq_D35R0102_007:
	scrcmd_609
	lockall
	apply_movement obj_player, _0428
	wait_movement
	apply_movement obj_D35R0102_aji_peru_4, _0454
	wait_movement
	play_se SEQ_SE_GS_AJITO_SIREN
	scrcmd_709
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 29
	goto_if_ne _08EC
	addvar VAR_TEMP_x4001, 1
	goto _08F8
	.byte 0x16, 0x00, 0x0c, 0x00, 0x00, 0x00
_08EC:
	subvar VAR_TEMP_x4001, 1
	goto _099E

_08F8:
	move_person obj_D35R0102_rocketm, 33, 0
	clearflag FLAG_UNK_1E8
	show_person obj_D35R0102_rocketm
	move_person_facing obj_D35R0102_rocketm, 33, 0, VAR_TEMP_x4001, DIR_WEST
	apply_movement obj_D35R0102_rocketm, _0698
	wait_movement
	apply_movement obj_player, _0478
	wait_movement
	npc_msg msg_0112_D35R0102_00000
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_20, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0C03
	apply_movement obj_D35R0102_rocketm, _06E0
	wait_movement
	move_person_facing obj_D35R0102_rocketm, 33, 0, VAR_TEMP_x4001, DIR_WEST
	apply_movement obj_D35R0102_rocketm, _0698
	wait_movement
	apply_movement obj_player, _0478
	wait_movement
	npc_msg msg_0112_D35R0102_00001
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_21, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0C03
	apply_movement obj_D35R0102_rocketm, _06E0
	wait_movement
	goto _0A3E

_099E:
	move_person obj_D35R0102_rocketm, 33, 0
	clearflag FLAG_UNK_1E8
	show_person obj_D35R0102_rocketm
	move_person_facing obj_D35R0102_rocketm, 33, 0, VAR_TEMP_x4001, DIR_WEST
	apply_movement obj_D35R0102_rocketm, _06A4
	wait_movement
	apply_movement obj_player, _0484
	wait_movement
	npc_msg msg_0112_D35R0102_00000
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_20, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0C03
	apply_movement obj_D35R0102_rocketm, _06E0
	wait_movement
	move_person_facing obj_D35R0102_rocketm, 33, 0, VAR_TEMP_x4001, DIR_WEST
	apply_movement obj_D35R0102_rocketm, _06A4
	wait_movement
	apply_movement obj_player, _0484
	wait_movement
	npc_msg msg_0112_D35R0102_00001
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_21, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0C03
	apply_movement obj_D35R0102_rocketm, _06E0
	wait_movement
_0A3E:
	hide_person obj_D35R0102_rocketm
	setvar VAR_UNK_40B0, 2
	apply_movement obj_D35R0102_aji_peru_4, _049C
	wait_movement
	releaseall
	end

scr_seq_D35R0102_008:
	scrcmd_609
	lockall
	apply_movement obj_player, _0428
	wait_movement
	apply_movement obj_D35R0102_aji_peru_5, _0454
	wait_movement
	play_se SEQ_SE_GS_AJITO_SIREN
	scrcmd_709
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 29
	goto_if_ne _0A99
	addvar VAR_TEMP_x4001, 1
	goto _0AA5
	.byte 0x16, 0x00, 0x0c, 0x00, 0x00, 0x00
_0A99:
	subvar VAR_TEMP_x4001, 1
	goto _0B4B

_0AA5:
	move_person obj_D35R0102_rocketm, 27, 0
	clearflag FLAG_UNK_1E8
	show_person obj_D35R0102_rocketm
	move_person_facing obj_D35R0102_rocketm, 27, 0, VAR_TEMP_x4001, DIR_WEST
	apply_movement obj_D35R0102_rocketm, _06B0
	wait_movement
	apply_movement obj_player, _0478
	wait_movement
	npc_msg msg_0112_D35R0102_00000
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_20, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0C03
	apply_movement obj_D35R0102_rocketm, _06EC
	wait_movement
	move_person_facing obj_D35R0102_rocketm, 27, 0, VAR_TEMP_x4001, DIR_WEST
	apply_movement obj_D35R0102_rocketm, _06B0
	wait_movement
	apply_movement obj_player, _0478
	wait_movement
	npc_msg msg_0112_D35R0102_00001
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_21, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0C03
	apply_movement obj_D35R0102_rocketm, _06EC
	wait_movement
	goto _0BEB

_0B4B:
	move_person obj_D35R0102_rocketm, 27, 0
	clearflag FLAG_UNK_1E8
	show_person obj_D35R0102_rocketm
	move_person_facing obj_D35R0102_rocketm, 27, 0, VAR_TEMP_x4001, DIR_WEST
	apply_movement obj_D35R0102_rocketm, _06BC
	wait_movement
	apply_movement obj_player, _0484
	wait_movement
	npc_msg msg_0112_D35R0102_00000
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_20, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0C03
	apply_movement obj_D35R0102_rocketm, _06EC
	wait_movement
	move_person_facing obj_D35R0102_rocketm, 27, 0, VAR_TEMP_x4001, DIR_WEST
	apply_movement obj_D35R0102_rocketm, _06BC
	wait_movement
	apply_movement obj_player, _0484
	wait_movement
	npc_msg msg_0112_D35R0102_00001
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_21, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0C03
	apply_movement obj_D35R0102_rocketm, _06EC
	wait_movement
_0BEB:
	hide_person obj_D35R0102_rocketm
	setvar VAR_UNK_40B1, 2
	apply_movement obj_D35R0102_aji_peru_5, _049C
	wait_movement
	releaseall
	end

_0C03:
	white_out
	releaseall
	end

scr_seq_D35R0102_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	compare VAR_UNK_40AD, 0
	goto_if_ne _0C2B
	npc_msg msg_0112_D35R0102_00002
	goto _0C4A
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
_0C2B:
	compare VAR_UNK_40AD, 1
	goto_if_ne _0C47
	npc_msg msg_0112_D35R0102_00003
	goto _0C4A
	.byte 0x16, 0x00, 0x03, 0x00, 0x00, 0x00
_0C47:
	npc_msg msg_0112_D35R0102_00004
_0C4A:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D35R0102_009:
	play_se SEQ_SE_DP_SELECT
	lockall
	compare VAR_UNK_40AE, 0
	goto_if_ne _0C74
	npc_msg msg_0112_D35R0102_00002
	goto _0C4A
	.byte 0x16, 0x00
	.byte 0x1f, 0x00, 0x00, 0x00
_0C74:
	compare VAR_UNK_40AE, 1
	goto_if_ne _0C90
	npc_msg msg_0112_D35R0102_00003
	goto _0C4A
	.byte 0x16, 0x00, 0x03, 0x00, 0x00, 0x00
_0C90:
	npc_msg msg_0112_D35R0102_00004
	goto _0C4A

scr_seq_D35R0102_010:
	play_se SEQ_SE_DP_SELECT
	lockall
	compare VAR_UNK_40AF, 0
	goto_if_ne _0CBB
	npc_msg msg_0112_D35R0102_00002
	goto _0C4A
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
_0CBB:
	compare VAR_UNK_40AF, 1
	goto_if_ne _0CD7
	npc_msg msg_0112_D35R0102_00003
	goto _0C4A
	.byte 0x16, 0x00, 0x03, 0x00, 0x00, 0x00
_0CD7:
	npc_msg msg_0112_D35R0102_00004
	goto _0C4A

scr_seq_D35R0102_011:
	play_se SEQ_SE_DP_SELECT
	lockall
	compare VAR_UNK_40B0, 0
	goto_if_ne _0D02
	npc_msg msg_0112_D35R0102_00002
	goto _0C4A
	.byte 0x16, 0x00, 0x1f, 0x00
	.byte 0x00, 0x00
_0D02:
	compare VAR_UNK_40B0, 1
	goto_if_ne _0D1E
	npc_msg msg_0112_D35R0102_00003
	goto _0C4A
	.byte 0x16, 0x00, 0x03, 0x00, 0x00, 0x00
_0D1E:
	npc_msg msg_0112_D35R0102_00004
	goto _0C4A

scr_seq_D35R0102_012:
	play_se SEQ_SE_DP_SELECT
	lockall
	compare VAR_UNK_40B1, 0
	goto_if_ne _0D49
	npc_msg msg_0112_D35R0102_00002
	goto _0C4A
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
_0D49:
	compare VAR_UNK_40B1, 1
	goto_if_ne _0D65
	npc_msg msg_0112_D35R0102_00003
	goto _0C4A
	.byte 0x16
	.byte 0x00, 0x03, 0x00, 0x00, 0x00
_0D65:
	npc_msg msg_0112_D35R0102_00004
	goto _0C4A

scr_seq_D35R0102_002:
	end

scr_seq_D35R0102_003:
	end

scr_seq_D35R0102_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_UNK_40AC, 9
	goto_if_ge _0F24
	goto_if_set FLAG_UNK_0D6, _0E58
	npc_msg msg_0112_D35R0102_00005
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0DB7
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0F1E
_0DB7:
	play_se SEQ_SE_DP_DENSI01
	npc_msg msg_0112_D35R0102_00007
	closemsg
	setflag FLAG_UNK_0D6
	compare VAR_UNK_40AD, 2
	goto_if_ge _0DDF
	setvar VAR_UNK_40AD, 1
	apply_movement obj_D35R0102_aji_peru, _04A4
_0DDF:
	compare VAR_UNK_40AE, 2
	goto_if_ge _0DFA
	setvar VAR_UNK_40AE, 1
	apply_movement obj_D35R0102_aji_peru_2, _04A4
_0DFA:
	compare VAR_UNK_40AF, 2
	goto_if_ge _0E15
	setvar VAR_UNK_40AF, 1
	apply_movement obj_D35R0102_aji_peru_3, _04A4
_0E15:
	compare VAR_UNK_40B0, 2
	goto_if_ge _0E30
	setvar VAR_UNK_40B0, 1
	apply_movement obj_D35R0102_aji_peru_4, _04A4
_0E30:
	compare VAR_UNK_40B1, 2
	goto_if_ge _0E4D
	setvar VAR_UNK_40B1, 1
	apply_movement obj_D35R0102_aji_peru_5, _04A4
	wait_movement
_0E4D:
	npc_msg msg_0112_D35R0102_00009
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0E58:
	npc_msg msg_0112_D35R0102_00006
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0E7D
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0F1E
_0E7D:
	play_se SEQ_SE_DP_DENSI01
	npc_msg msg_0112_D35R0102_00007
	closemsg
	clearflag FLAG_UNK_0D6
	compare VAR_UNK_40AD, 2
	goto_if_ge _0EA5
	setvar VAR_UNK_40AD, 0
	apply_movement obj_D35R0102_aji_peru, _04AC
_0EA5:
	compare VAR_UNK_40AE, 2
	goto_if_ge _0EC0
	setvar VAR_UNK_40AE, 0
	apply_movement obj_D35R0102_aji_peru_2, _04AC
_0EC0:
	compare VAR_UNK_40AF, 2
	goto_if_ge _0EDB
	setvar VAR_UNK_40AF, 0
	apply_movement obj_D35R0102_aji_peru_3, _04AC
_0EDB:
	compare VAR_UNK_40B0, 2
	goto_if_ge _0EF6
	setvar VAR_UNK_40B0, 0
	apply_movement obj_D35R0102_aji_peru_4, _04AC
_0EF6:
	compare VAR_UNK_40B1, 2
	goto_if_ge _0F13
	setvar VAR_UNK_40B1, 0
	apply_movement obj_D35R0102_aji_peru_5, _04AC
	wait_movement
_0F13:
	npc_msg msg_0112_D35R0102_00010
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0F1E:
	closemsg
	releaseall
	end

_0F24:
	npc_msg msg_0112_D35R0102_00008
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D35R0102_013:
	scrcmd_609
	lockall
	scrcmd_708 1
	play_se SEQ_SE_GS_DOKU_TRAP
	rocket_trap_battle SPECIES_KOFFING, 21
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _11FF
	setvar VAR_ROCKET_TRAP_KOFFING_1, 1
	releaseall
	end

scr_seq_D35R0102_014:
	scrcmd_609
	lockall
	scrcmd_708 0
	play_se SEQ_SE_GS_DENKI_TRAP
	rocket_trap_battle SPECIES_VOLTORB, 23
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _11FF
	setvar VAR_ROCKET_TRAP_VOLTORB_1, 1
	releaseall
	end

scr_seq_D35R0102_015:
	scrcmd_609
	lockall
	scrcmd_708 2
	play_se SEQ_SE_GS_IWA_TRAP
	rocket_trap_battle SPECIES_GEODUDE, 21
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _11FF
	setvar VAR_ROCKET_TRAP_GEODUDE_1, 1
	releaseall
	end

scr_seq_D35R0102_016:
	scrcmd_609
	lockall
	scrcmd_708 0
	play_se SEQ_SE_GS_DENKI_TRAP
	rocket_trap_battle SPECIES_VOLTORB, 23
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _11FF
	setvar VAR_ROCKET_TRAP_VOLTORB_2, 1
	releaseall
	end

scr_seq_D35R0102_017:
	scrcmd_609
	lockall
	scrcmd_708 2
	play_se SEQ_SE_GS_IWA_TRAP
	rocket_trap_battle SPECIES_GEODUDE, 21
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _11FF
	setvar VAR_ROCKET_TRAP_GEODUDE_2, 1
	releaseall
	end

scr_seq_D35R0102_018:
	scrcmd_609
	lockall
	scrcmd_708 0
	play_se SEQ_SE_GS_DENKI_TRAP
	rocket_trap_battle SPECIES_VOLTORB, 23
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _11FF
	setvar VAR_ROCKET_TRAP_VOLTORB_3, 1
	releaseall
	end

scr_seq_D35R0102_019:
	scrcmd_609
	lockall
	scrcmd_708 0
	play_se SEQ_SE_GS_DENKI_TRAP
	rocket_trap_battle SPECIES_VOLTORB, 23
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _11FF
	setvar VAR_ROCKET_TRAP_VOLTORB_4, 1
	releaseall
	end

scr_seq_D35R0102_020:
	scrcmd_609
	lockall
	scrcmd_708 1
	play_se SEQ_SE_GS_DOKU_TRAP
	rocket_trap_battle SPECIES_KOFFING, 21
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _11FF
	setvar VAR_ROCKET_TRAP_KOFFING_2, 1
	releaseall
	end

scr_seq_D35R0102_021:
	scrcmd_609
	lockall
	scrcmd_708 1
	play_se SEQ_SE_GS_DOKU_TRAP
	rocket_trap_battle SPECIES_KOFFING, 21
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _11FF
	setvar VAR_ROCKET_TRAP_KOFFING_3, 1
	releaseall
	end

scr_seq_D35R0102_022:
	scrcmd_609
	lockall
	scrcmd_708 2
	play_se SEQ_SE_GS_IWA_TRAP
	rocket_trap_battle SPECIES_GEODUDE, 21
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _11FF
	setvar VAR_ROCKET_TRAP_GEODUDE_3, 1
	releaseall
	end

scr_seq_D35R0102_023:
	scrcmd_609
	lockall
	scrcmd_708 2
	play_se SEQ_SE_GS_IWA_TRAP
	rocket_trap_battle SPECIES_GEODUDE, 21
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _11FF
	setvar VAR_ROCKET_TRAP_GEODUDE_4, 1
	releaseall
	end

scr_seq_D35R0102_024:
	scrcmd_609
	lockall
	scrcmd_708 1
	play_se SEQ_SE_GS_DOKU_TRAP
	rocket_trap_battle SPECIES_KOFFING, 21
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _11FF
	setvar VAR_ROCKET_TRAP_KOFFING_4, 1
	releaseall
	end

scr_seq_D35R0102_025:
	scrcmd_609
	lockall
	scrcmd_708 0
	play_se SEQ_SE_GS_DENKI_TRAP
	rocket_trap_battle SPECIES_VOLTORB, 23
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _11FF
	setvar VAR_ROCKET_TRAP_VOLTORB_5, 1
	releaseall
	end

scr_seq_D35R0102_026:
	scrcmd_609
	lockall
	scrcmd_708 0
	play_se SEQ_SE_GS_DENKI_TRAP
	rocket_trap_battle SPECIES_VOLTORB, 23
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _11FF
	setvar VAR_ROCKET_TRAP_VOLTORB_6, 1
	releaseall
	end

scr_seq_D35R0102_027:
	scrcmd_609
	lockall
	scrcmd_708 1
	play_se SEQ_SE_GS_DOKU_TRAP
	rocket_trap_battle SPECIES_KOFFING, 21
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _11FF
	setvar VAR_ROCKET_TRAP_KOFFING_5, 1
	releaseall
	end

scr_seq_D35R0102_028:
	scrcmd_609
	lockall
	scrcmd_708 2
	play_se SEQ_SE_GS_IWA_TRAP
	rocket_trap_battle SPECIES_GEODUDE, 21
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _11FF
	setvar VAR_ROCKET_TRAP_GEODUDE_5, 1
	releaseall
	end

_11FF:
	white_out
	releaseall
	end

scr_seq_D35R0102_029:
	scrcmd_609
	lockall
	play_se SEQ_SE_PL_BOWABOWA
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	wait 15, VAR_SPECIAL_RESULT
	warp MAP_D35R0102, 0, 50, 4, DIR_WEST
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end
	.balign 4, 0
