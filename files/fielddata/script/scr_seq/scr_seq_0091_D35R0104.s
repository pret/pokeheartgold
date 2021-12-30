#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0091_D35R0104_01B0 ; 000
	scrdef scr_seq_0091_D35R0104_007A ; 001
	scrdef scr_seq_0091_D35R0104_01C3 ; 002
	scrdef scr_seq_0091_D35R0104_02F0 ; 003
	scrdef scr_seq_0091_D35R0104_0514 ; 004
	scrdef scr_seq_0091_D35R0104_0574 ; 005
	scrdef scr_seq_0091_D35R0104_0026 ; 006
	scrdef scr_seq_0091_D35R0104_013C ; 007
	scrdef scr_seq_0091_D35R0104_0051 ; 008
	scrdef_end

scr_seq_0091_D35R0104_0026:
	checktrainerflag TRAINER_TEAM_ROCKET_F_GRUNT_5
	gotoif lt, scr_seq_0091_D35R0104_004F
	checktrainerflag TRAINER_TEAM_ROCKET_GRUNT_19
	gotoif lt, scr_seq_0091_D35R0104_004F
	comparevartovalue VAR_UNK_40AC, 3
	gotoif ge, scr_seq_0091_D35R0104_004F
	setvar VAR_UNK_40AC, 2
scr_seq_0091_D35R0104_004F:
	end

scr_seq_0091_D35R0104_0051:
	comparevartovalue VAR_UNK_40AC, 4
	gotoif ge, scr_seq_0091_D35R0104_0060
	end

scr_seq_0091_D35R0104_0060:
	move_person 10, 22, 0, 15, 0
	move_person 11, 22, 0, 15, 0
	end

scr_seq_0091_D35R0104_007A:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0091_D35R0104_00EC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 5, scr_seq_0091_D35R0104_00F4
	wait_movement
	apply_movement 5, scr_seq_0091_D35R0104_00FC
	apply_movement 6, scr_seq_0091_D35R0104_010C
	wait_movement
	buffer_players_name 0
	gender_msgbox 0, 1
	closemsg
	apply_movement 5, scr_seq_0091_D35R0104_0124
	apply_movement 6, scr_seq_0091_D35R0104_012C
	wait_movement
	hide_person 5
	hide_person 6
	setflag FLAG_UNK_1E6
	releaseall
	setvar VAR_UNK_40AC, 1
	end

scr_seq_0091_D35R0104_00E9:
	.byte 0x00, 0x00, 0x00

scr_seq_0091_D35R0104_00EC:
	step 14, 1
	step_end

scr_seq_0091_D35R0104_00F4:
	step 75, 1
	step_end

scr_seq_0091_D35R0104_00FC:
	step 33, 1
	step 13, 3
	step 15, 3
	step_end

scr_seq_0091_D35R0104_010C:
	step 63, 1
	step 61, 1
	step 14, 1
	step 13, 3
	step 15, 2
	step_end

scr_seq_0091_D35R0104_0124:
	step 14, 9
	step_end

scr_seq_0091_D35R0104_012C:
	step 61, 1
	step 15, 1
	step 14, 9
	step_end
scr_seq_0091_D35R0104_013C:
	scrcmd_609
	lockall
	apply_movement 16, scr_seq_0091_D35R0104_018C
	wait_movement
	npc_msg 10
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 16, scr_seq_0091_D35R0104_0194
	apply_movement 255, scr_seq_0091_D35R0104_01A4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	setvar VAR_UNK_40AC, 6
	hide_person 16
	setflag FLAG_UNK_24C
	clearflag FLAG_UNK_24D
	releaseall
	end

scr_seq_0091_D35R0104_018B:
	.byte 0x00

scr_seq_0091_D35R0104_018C:
	step 51, 2
	step_end

scr_seq_0091_D35R0104_0194:
	step 1, 1
	step 49, 1
	step 17, 10
	step_end

scr_seq_0091_D35R0104_01A4:
	step 63, 1
	step 33, 1
	step_end
scr_seq_0091_D35R0104_01B0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0091_D35R0104_01C3:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_0091_D35R0104_00F4
	wait_movement
	callstd std_play_rival_intro_music
	clearflag FLAG_UNK_1FD
	show_person 7
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 17
	gotoif ne, scr_seq_0091_D35R0104_01FE
	apply_movement 7, scr_seq_0091_D35R0104_0290
	goto scr_seq_0091_D35R0104_0221

scr_seq_0091_D35R0104_01FE:
	comparevartovalue VAR_TEMP_x4001, 18
	gotoif ne, scr_seq_0091_D35R0104_0219
	apply_movement 7, scr_seq_0091_D35R0104_029C
	goto scr_seq_0091_D35R0104_0221

scr_seq_0091_D35R0104_0219:
	apply_movement 7, scr_seq_0091_D35R0104_02A8
scr_seq_0091_D35R0104_0221:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0091_D35R0104_02B4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	buffer_rivals_name 0
	npc_msg 3
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	apply_movement 7, scr_seq_0091_D35R0104_02BC
	apply_movement 255, scr_seq_0091_D35R0104_02C4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 7, scr_seq_0091_D35R0104_02D8
	wait_movement
	callstd 2032
	hide_person 7
	setflag FLAG_UNK_1FD
	releaseall
	setvar VAR_UNK_40AC, 3
	end

scr_seq_0091_D35R0104_028D:
	.byte 0x00, 0x00, 0x00

scr_seq_0091_D35R0104_0290:
	step 13, 9
	step 15, 2
	step_end

scr_seq_0091_D35R0104_029C:
	step 13, 10
	step 15, 2
	step_end

scr_seq_0091_D35R0104_02A8:
	step 13, 11
	step 15, 2
	step_end

scr_seq_0091_D35R0104_02B4:
	step 14, 2
	step_end

scr_seq_0091_D35R0104_02BC:
	step 19, 1
	step_end

scr_seq_0091_D35R0104_02C4:
	step 71, 1
	step 19, 1
	step 55, 1
	step 72, 1
	step_end

scr_seq_0091_D35R0104_02D8:
	step 40, 1
	step 42, 1
	step 63, 1
	step 14, 2
	step 12, 9
	step_end
scr_seq_0091_D35R0104_02F0:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_0091_D35R0104_00F4
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 23
	gotoif ne, scr_seq_0091_D35R0104_0329
	apply_movement 255, scr_seq_0091_D35R0104_040C
	goto scr_seq_0091_D35R0104_0331

scr_seq_0091_D35R0104_0329:
	apply_movement 255, scr_seq_0091_D35R0104_041C
scr_seq_0091_D35R0104_0331:
	apply_movement 18, scr_seq_0091_D35R0104_0440
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	buffer_players_name 0
	npc_msg 4
	closemsg
	apply_movement 18, scr_seq_0091_D35R0104_044C
	wait_movement
	npc_msg 5
	closemsg
	apply_movement 18, scr_seq_0091_D35R0104_0458
	wait_movement
	clearflag FLAG_UNK_1F4
	show_person 8
	setflag FLAG_UNK_280
	hide_person 18
	apply_movement 8, scr_seq_0091_D35R0104_047C
	wait_movement
	npc_msg 6
	closemsg
	trainer_battle TRAINER_EXECUTIVE_PETREL_PETREL_2, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0091_D35R0104_0405
	npc_msg 7
	closemsg
	apply_movement 8, scr_seq_0091_D35R0104_04A8
	wait_movement
	hide_person 8
	setflag FLAG_UNK_1F4
	apply_movement 9, scr_seq_0091_D35R0104_04E4
	wait_movement
	npc_msg 8
	closemsg
	npc_msg 9
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 9, scr_seq_0091_D35R0104_04F4
	apply_movement 255, scr_seq_0091_D35R0104_042C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	setvar VAR_UNK_40AC, 4
	hide_person 9
	setflag FLAG_UNK_24A
	clearflag FLAG_UNK_24B
	releaseall
	end

scr_seq_0091_D35R0104_0405:
	white_out
	releaseall
	end

scr_seq_0091_D35R0104_040B:
	.byte 0x00

scr_seq_0091_D35R0104_040C:
	step 12, 5
	step 14, 1
	step 34, 1
	step_end

scr_seq_0091_D35R0104_041C:
	step 12, 5
	step 14, 2
	step 34, 1
	step_end

scr_seq_0091_D35R0104_042C:
	step 63, 3
	step 1, 1
	step 63, 3
	step 13, 3
	step_end

scr_seq_0091_D35R0104_0440:
	step 63, 4
	step 35, 1
	step_end

scr_seq_0091_D35R0104_044C:
	step 75, 1
	step 63, 2
	step_end

scr_seq_0091_D35R0104_0458:
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step_end

scr_seq_0091_D35R0104_047C:
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step_end
	.byte 0x0f, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_0091_D35R0104_04A8:
	step 71, 1
	step 10, 1
	step 72, 1
	step 63, 1
	step 17, 5
	step 71, 1
	step 52, 1
	step 72, 1
	step 17, 1
	step 19, 3
	step 17, 5
	step 18, 7
	step 16, 12
	step 18, 4
	step_end

scr_seq_0091_D35R0104_04E4:
	step 13, 3
	step 15, 2
	step 51, 2
	step_end

scr_seq_0091_D35R0104_04F4:
	step 1, 1
	step 17, 1
	step 19, 2
	step 17, 9
	step 18, 7
	step 16, 13
	step 18, 5
	step_end
scr_seq_0091_D35R0104_0514:
	comparevartovalue VAR_UNK_40AC, 4
	gotoif ge, scr_seq_0091_D35R0104_055F
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checktrainerflag TRAINER_TEAM_ROCKET_F_GRUNT_5
	gotoif lt, scr_seq_0091_D35R0104_0561
	checktrainerflag TRAINER_TEAM_ROCKET_GRUNT_19
	gotoif lt, scr_seq_0091_D35R0104_0561
	buffer_players_name 0
	npc_msg 12
	closemsg
	play_se SEQ_SE_DP_DOOR10
	apply_movement 10, scr_seq_0091_D35R0104_056C
	apply_movement 11, scr_seq_0091_D35R0104_056C
	wait_movement
	releaseall
scr_seq_0091_D35R0104_055F:
	end

scr_seq_0091_D35R0104_0561:
	npc_msg 11
	waitbutton
	closemsg
	releaseall
	end


scr_seq_0091_D35R0104_056C:
	step 14, 3
	step_end
scr_seq_0091_D35R0104_0574:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	setflag FLAG_UNK_0D3
	end
	.balign 4, 0
