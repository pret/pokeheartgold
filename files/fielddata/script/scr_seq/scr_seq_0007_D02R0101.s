#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0007_D02R0101_0006 ; 000
	scrdef_end

scr_seq_0007_D02R0101_0006:
	callstd std_play_rival_intro_music
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 0, scr_seq_0007_D02R0101_00D0
	apply_movement 255, scr_seq_0007_D02R0101_00DC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	buffer_players_name 0
	scrcmd_191 1
	npc_msg 0
	closemsg
	get_starter_choice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 152
	gotoif ne, scr_seq_0007_D02R0101_005A
	trainer_battle 286, 0, 0, 0
	goto scr_seq_0007_D02R0101_007D

scr_seq_0007_D02R0101_005A:
	comparevartovalue VAR_SPECIAL_x800C, 155
	gotoif ne, scr_seq_0007_D02R0101_0075
	trainer_battle 287, 0, 0, 0
	goto scr_seq_0007_D02R0101_007D

scr_seq_0007_D02R0101_0075:
	trainer_battle 285, 0, 0, 0
scr_seq_0007_D02R0101_007D:
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0007_D02R0101_00C9
	callstd std_play_rival_outro_music
	buffer_players_name 0
	scrcmd_191 1
	npc_msg 1
	closemsg
	apply_movement 0, scr_seq_0007_D02R0101_00E8
	wait_movement
	hide_person 0
	callstd 2071
	setflag FLAG_UNK_25C
	clearflag FLAG_UNK_2E0
	setvar VAR_UNK_40FC, 1
	setvar VAR_UNK_40F5, 1
	setflag FLAG_UNK_0E3
	end

scr_seq_0007_D02R0101_00C9:
	scrcmd_219
	end

scr_seq_0007_D02R0101_00CD:
	.byte 0x00, 0x00, 0x00

scr_seq_0007_D02R0101_00D0:
	.short 75, 1
	.short 14, 4
	.short 254, 0

scr_seq_0007_D02R0101_00DC:
	.short 63, 4
	.short 15, 1
	.short 254, 0

scr_seq_0007_D02R0101_00E8:
	.short 19, 5
	.short 17, 9
	.short 254, 0
	.byte 0x02, 0x00, 0x00, 0x00
	.balign 4, 0
