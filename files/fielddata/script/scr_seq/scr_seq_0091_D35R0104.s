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
	show_person_at 10, 22, 0, 15, 0
	show_person_at 11, 22, 0, 15, 0
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
	.short 14, 1
	.short 254, 0

scr_seq_0091_D35R0104_00F4:
	.short 75, 1
	.short 254, 0

scr_seq_0091_D35R0104_00FC:
	.short 33, 1
	.short 13, 3
	.short 15, 3
	.short 254, 0

scr_seq_0091_D35R0104_010C:
	.short 63, 1
	.short 61, 1
	.short 14, 1
	.short 13, 3
	.short 15, 2
	.short 254, 0

scr_seq_0091_D35R0104_0124:
	.short 14, 9
	.short 254, 0

scr_seq_0091_D35R0104_012C:
	.short 61, 1
	.short 15, 1
	.short 14, 9
	.short 254, 0
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
	.short 51, 2
	.short 254, 0

scr_seq_0091_D35R0104_0194:
	.short 1, 1
	.short 49, 1
	.short 17, 10
	.short 254, 0

scr_seq_0091_D35R0104_01A4:
	.short 63, 1
	.short 33, 1
	.short 254, 0
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
	scrcmd_100 7
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
	scrcmd_191 0
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
	.short 13, 9
	.short 15, 2
	.short 254, 0

scr_seq_0091_D35R0104_029C:
	.short 13, 10
	.short 15, 2
	.short 254, 0

scr_seq_0091_D35R0104_02A8:
	.short 13, 11
	.short 15, 2
	.short 254, 0

scr_seq_0091_D35R0104_02B4:
	.short 14, 2
	.short 254, 0

scr_seq_0091_D35R0104_02BC:
	.short 19, 1
	.short 254, 0

scr_seq_0091_D35R0104_02C4:
	.short 71, 1
	.short 19, 1
	.short 55, 1
	.short 72, 1
	.short 254, 0

scr_seq_0091_D35R0104_02D8:
	.short 40, 1
	.short 42, 1
	.short 63, 1
	.short 14, 2
	.short 12, 9
	.short 254, 0
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
	scrcmd_100 8
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
	.short 12, 5
	.short 14, 1
	.short 34, 1
	.short 254, 0

scr_seq_0091_D35R0104_041C:
	.short 12, 5
	.short 14, 2
	.short 34, 1
	.short 254, 0

scr_seq_0091_D35R0104_042C:
	.short 63, 3
	.short 1, 1
	.short 63, 3
	.short 13, 3
	.short 254, 0

scr_seq_0091_D35R0104_0440:
	.short 63, 4
	.short 35, 1
	.short 254, 0

scr_seq_0091_D35R0104_044C:
	.short 75, 1
	.short 63, 2
	.short 254, 0

scr_seq_0091_D35R0104_0458:
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 254, 0

scr_seq_0091_D35R0104_047C:
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 254, 0
	.byte 0x0f, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_0091_D35R0104_04A8:
	.short 71, 1
	.short 10, 1
	.short 72, 1
	.short 63, 1
	.short 17, 5
	.short 71, 1
	.short 52, 1
	.short 72, 1
	.short 17, 1
	.short 19, 3
	.short 17, 5
	.short 18, 7
	.short 16, 12
	.short 18, 4
	.short 254, 0

scr_seq_0091_D35R0104_04E4:
	.short 13, 3
	.short 15, 2
	.short 51, 2
	.short 254, 0

scr_seq_0091_D35R0104_04F4:
	.short 1, 1
	.short 17, 1
	.short 19, 2
	.short 17, 9
	.short 18, 7
	.short 16, 13
	.short 18, 5
	.short 254, 0
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
	.short 14, 3
	.short 254, 0
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
