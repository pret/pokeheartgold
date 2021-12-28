#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0023_D18R0101_0118 ; 000
	scrdef scr_seq_0023_D18R0101_0142 ; 001
	scrdef scr_seq_0023_D18R0101_0168 ; 002
	scrdef scr_seq_0023_D18R0101_0012 ; 003
	scrdef_end

scr_seq_0023_D18R0101_0012:
	scrcmd_609
	lockall
	callstd std_play_rival_intro_music
	apply_movement 0, scr_seq_0023_D18R0101_00D0
	wait_movement
	scrcmd_191 0
	npc_msg 0
	closemsg
	get_starter_choice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 152
	gotoif ne, scr_seq_0023_D18R0101_004B
	trainer_battle TRAINER_RIVAL_SILVER_8, 0, 0, 0
	goto scr_seq_0023_D18R0101_006E

scr_seq_0023_D18R0101_004B:
	comparevartovalue VAR_SPECIAL_x800C, 155
	gotoif ne, scr_seq_0023_D18R0101_0066
	trainer_battle TRAINER_RIVAL_SILVER_11, 0, 0, 0
	goto scr_seq_0023_D18R0101_006E

scr_seq_0023_D18R0101_0066:
	trainer_battle TRAINER_RIVAL_SILVER_4, 0, 0, 0
scr_seq_0023_D18R0101_006E:
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0023_D18R0101_00C7
	callstd std_play_rival_outro_music
	scrcmd_191 0
	npc_msg 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	apply_movement 255, scr_seq_0023_D18R0101_00E8
	apply_movement 0, scr_seq_0023_D18R0101_00F8
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	hide_person 0
	callstd 2071
	setflag FLAG_UNK_1C6
	setvar VAR_UNK_40A6, 1
	releaseall
	end

scr_seq_0023_D18R0101_00C7:
	white_out
	releaseall
	end

scr_seq_0023_D18R0101_00CD:
	.byte 0x00, 0x00, 0x00

scr_seq_0023_D18R0101_00D0:
	.short 1, 1
	.short 75, 1
	.short 13, 4
	.short 14, 1
	.short 1, 1
	.short 254, 0

scr_seq_0023_D18R0101_00E8:
	.short 13, 2
	.short 15, 1
	.short 2, 1
	.short 254, 0

scr_seq_0023_D18R0101_00F8:
	.short 13, 3
	.short 14, 1
	.short 13, 1
	.short 14, 3
	.short 13, 1
	.short 14, 4
	.short 13, 3
	.short 254, 0
scr_seq_0023_D18R0101_0118:
	scrcmd_609
	lockall
	callstd 2042
	apply_movement 1, scr_seq_0023_D18R0101_0158
	wait_movement
	buffer_players_name 0
	npc_msg 2
	waitbutton
	closemsg
	callstd 2043
	setvar VAR_UNK_40A2, 1
	releaseall
	end

scr_seq_0023_D18R0101_0142:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0023_D18R0101_0155:
	.byte 0x00, 0x00, 0x00

scr_seq_0023_D18R0101_0158:
	.short 2, 1
	.short 75, 1
	.short 14, 3
	.short 254, 0
scr_seq_0023_D18R0101_0168:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
