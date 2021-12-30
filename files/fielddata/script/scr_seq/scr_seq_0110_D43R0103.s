#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0110_D43R0103_001E ; 000
	scrdef scr_seq_0110_D43R0103_021C ; 001
	scrdef scr_seq_0110_D43R0103_021E ; 002
	scrdef scr_seq_0110_D43R0103_0230 ; 003
	scrdef scr_seq_0110_D43R0103_0242 ; 004
	scrdef scr_seq_0110_D43R0103_0254 ; 005
	scrdef scr_seq_0110_D43R0103_0266 ; 006
	scrdef_end

scr_seq_0110_D43R0103_001E:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_0110_D43R0103_0168
	wait_movement
	clearflag FLAG_UNK_20A
	show_person 0
	callstd std_play_rival_intro_music
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 37
	gotoif ne, scr_seq_0110_D43R0103_0059
	apply_movement 0, scr_seq_0110_D43R0103_0180
	goto scr_seq_0110_D43R0103_007C

scr_seq_0110_D43R0103_0059:
	comparevartovalue VAR_TEMP_x4000, 38
	gotoif ne, scr_seq_0110_D43R0103_0074
	apply_movement 0, scr_seq_0110_D43R0103_0198
	goto scr_seq_0110_D43R0103_007C

scr_seq_0110_D43R0103_0074:
	apply_movement 0, scr_seq_0110_D43R0103_01B0
scr_seq_0110_D43R0103_007C:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0110_D43R0103_0178
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	buffer_players_name 0
	npc_msg 0
	closemsg
	get_starter_choice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 152
	gotoif ne, scr_seq_0110_D43R0103_00C1
	trainer_battle TRAINER_RIVAL_SILVER_9, 0, 0, 0
	goto scr_seq_0110_D43R0103_00E4

scr_seq_0110_D43R0103_00C1:
	comparevartovalue VAR_SPECIAL_x800C, 155
	gotoif ne, scr_seq_0110_D43R0103_00DC
	trainer_battle TRAINER_RIVAL_SILVER_13, 0, 0, 0
	goto scr_seq_0110_D43R0103_00E4

scr_seq_0110_D43R0103_00DC:
	trainer_battle TRAINER_RIVAL_SILVER_5, 0, 0, 0
scr_seq_0110_D43R0103_00E4:
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0110_D43R0103_015A
	callstd std_play_rival_outro_music
	npc_msg 1
	closemsg
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 37
	gotoif ne, scr_seq_0110_D43R0103_011F
	apply_movement 0, scr_seq_0110_D43R0103_01C8
	goto scr_seq_0110_D43R0103_0142

scr_seq_0110_D43R0103_011F:
	comparevartovalue VAR_TEMP_x4000, 38
	gotoif ne, scr_seq_0110_D43R0103_013A
	apply_movement 0, scr_seq_0110_D43R0103_01E4
	goto scr_seq_0110_D43R0103_0142

scr_seq_0110_D43R0103_013A:
	apply_movement 0, scr_seq_0110_D43R0103_0200
scr_seq_0110_D43R0103_0142:
	wait_movement
	setflag FLAG_UNK_20A
	hide_person 0
	callstd std_fade_end_rival_outro_music
	setvar VAR_UNK_40C5, 1
	releaseall
	end

scr_seq_0110_D43R0103_015A:
	hide_person 0
	setflag FLAG_UNK_20A
	white_out
	releaseall
	end


scr_seq_0110_D43R0103_0168:
	step 75, 1
	step 63, 2
	step 1, 2
	step_end

scr_seq_0110_D43R0103_0178:
	step 9, 1
	step_end

scr_seq_0110_D43R0103_0180:
	step 16, 3
	step 3, 2
	step 19, 4
	step 0, 2
	step 16, 3
	step_end

scr_seq_0110_D43R0103_0198:
	step 16, 3
	step 3, 2
	step 19, 5
	step 0, 2
	step 16, 3
	step_end

scr_seq_0110_D43R0103_01B0:
	step 16, 3
	step 3, 2
	step 19, 6
	step 0, 2
	step 16, 3
	step_end

scr_seq_0110_D43R0103_01C8:
	step 1, 2
	step 13, 2
	step 2, 2
	step 14, 5
	step 1, 2
	step 13, 7
	step_end

scr_seq_0110_D43R0103_01E4:
	step 1, 2
	step 13, 2
	step 2, 2
	step 14, 6
	step 1, 2
	step 13, 7
	step_end

scr_seq_0110_D43R0103_0200:
	step 1, 2
	step 13, 2
	step 2, 2
	step 14, 7
	step 1, 2
	step 13, 7
	step_end
scr_seq_0110_D43R0103_021C:
	end

scr_seq_0110_D43R0103_021E:
	setvar VAR_TEMP_x4000, 57
	setvar VAR_TEMP_x4001, 42
	goto scr_seq_0110_D43R0103_0278

scr_seq_0110_D43R0103_0230:
	setvar VAR_TEMP_x4000, 28
	setvar VAR_TEMP_x4001, 38
	goto scr_seq_0110_D43R0103_0278

scr_seq_0110_D43R0103_0242:
	setvar VAR_TEMP_x4000, 31
	setvar VAR_TEMP_x4001, 44
	goto scr_seq_0110_D43R0103_0278

scr_seq_0110_D43R0103_0254:
	setvar VAR_TEMP_x4000, 22
	setvar VAR_TEMP_x4001, 17
	goto scr_seq_0110_D43R0103_0278

scr_seq_0110_D43R0103_0266:
	setvar VAR_TEMP_x4000, 58
	setvar VAR_TEMP_x4001, 28
	goto scr_seq_0110_D43R0103_0278

scr_seq_0110_D43R0103_0278:
	scrcmd_609
	lockall
	setvar VAR_UNK_40CA, 1
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0110_D43R0103_02A9
	apply_movement 255, scr_seq_0110_D43R0103_0330
	apply_movement 253, scr_seq_0110_D43R0103_033C
	goto scr_seq_0110_D43R0103_02FF

scr_seq_0110_D43R0103_02A9:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0110_D43R0103_02CC
	apply_movement 255, scr_seq_0110_D43R0103_034C
	apply_movement 253, scr_seq_0110_D43R0103_0358
	goto scr_seq_0110_D43R0103_02FF

scr_seq_0110_D43R0103_02CC:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0110_D43R0103_02EF
	apply_movement 255, scr_seq_0110_D43R0103_0384
	apply_movement 253, scr_seq_0110_D43R0103_0390
	goto scr_seq_0110_D43R0103_02FF

scr_seq_0110_D43R0103_02EF:
	apply_movement 255, scr_seq_0110_D43R0103_0368
	apply_movement 253, scr_seq_0110_D43R0103_0374
scr_seq_0110_D43R0103_02FF:
	wait_movement
	play_se SEQ_SE_GS_RAKKA01
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 178, 0, 16384, 16385, 32780
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0110_D43R0103_032D:
	.byte 0x00, 0x00, 0x00

scr_seq_0110_D43R0103_0330:
	step 40, 4
	step 69, 1
	step_end

scr_seq_0110_D43R0103_033C:
	step 62, 3
	step 20, 1
	step 69, 1
	step_end

scr_seq_0110_D43R0103_034C:
	step 41, 4
	step 69, 1
	step_end

scr_seq_0110_D43R0103_0358:
	step 62, 3
	step 21, 1
	step 69, 1
	step_end

scr_seq_0110_D43R0103_0368:
	step 42, 4
	step 69, 1
	step_end

scr_seq_0110_D43R0103_0374:
	step 62, 3
	step 22, 1
	step 69, 1
	step_end

scr_seq_0110_D43R0103_0384:
	step 43, 4
	step 69, 1
	step_end

scr_seq_0110_D43R0103_0390:
	step 62, 3
	step 23, 1
	step 69, 1
	step_end
	.balign 4, 0
