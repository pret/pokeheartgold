#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0866_T23_0061 ; 000
	scrdef scr_seq_0866_T23_0074 ; 001
	scrdef scr_seq_0866_T23_0092 ; 002
	scrdef scr_seq_0866_T23_02FC ; 003
	scrdef scr_seq_0866_T23_0046 ; 004
	scrdef scr_seq_0866_T23_0061 ; 005
	scrdef scr_seq_0866_T23_0380 ; 006
	scrdef scr_seq_0866_T23_03A7 ; 007
	scrdef scr_seq_0866_T23_03CC ; 008
	scrdef scr_seq_0866_T23_03E1 ; 009
	scrdef scr_seq_0866_T23_03F6 ; 010
	scrdef scr_seq_0866_T23_040B ; 011
	scrdef scr_seq_0866_T23_0422 ; 012
	scrdef scr_seq_0866_T23_0437 ; 013
	scrdef scr_seq_0866_T23_044E ; 014
	scrdef scr_seq_0866_T23_0461 ; 015
	scrdef scr_seq_0866_T23_0474 ; 016
	scrdef_end

scr_seq_0866_T23_0046:
	comparevartovalue VAR_UNK_4080, 0
	gotoif ne, scr_seq_0866_T23_005F
	setflag FLAG_UNK_19F
	clearflag FLAG_UNK_271
	clearflag FLAG_UNK_272
scr_seq_0866_T23_005F:
	end

scr_seq_0866_T23_0061:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0866_T23_0074:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 9
	scrcmd_076 79, 0
	npc_msg 10
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0866_T23_0092:
	scrcmd_609
	lockall
	fade_out_bgm 0, 3
	apply_movement 255, scr_seq_0866_T23_02A4
	wait_movement
	setvar VAR_UNK_4099, 1
	callstd std_play_rival_intro_music
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 462
	gotoif ne, scr_seq_0866_T23_00E5
	move_person 9, 404, 0, 463, 2
	apply_movement 9, scr_seq_0866_T23_028C
	apply_movement 255, scr_seq_0866_T23_02AC
	goto scr_seq_0866_T23_018E

scr_seq_0866_T23_00E5:
	comparevartovalue VAR_SPECIAL_x8005, 463
	gotoif ne, scr_seq_0866_T23_0114
	move_person 9, 404, 0, 464, 2
	apply_movement 9, scr_seq_0866_T23_028C
	apply_movement 255, scr_seq_0866_T23_02AC
	goto scr_seq_0866_T23_018E

scr_seq_0866_T23_0114:
	comparevartovalue VAR_SPECIAL_x8005, 464
	gotoif ne, scr_seq_0866_T23_0143
	move_person 9, 404, 0, 463, 2
	apply_movement 9, scr_seq_0866_T23_0298
	apply_movement 255, scr_seq_0866_T23_02C0
	goto scr_seq_0866_T23_018E

scr_seq_0866_T23_0143:
	comparevartovalue VAR_SPECIAL_x8005, 465
	gotoif ne, scr_seq_0866_T23_0172
	move_person 9, 404, 0, 464, 2
	apply_movement 9, scr_seq_0866_T23_0298
	apply_movement 255, scr_seq_0866_T23_02C0
	goto scr_seq_0866_T23_018E

scr_seq_0866_T23_0172:
	move_person 9, 404, 0, 465, 2
	apply_movement 9, scr_seq_0866_T23_0298
	apply_movement 255, scr_seq_0866_T23_02C0
scr_seq_0866_T23_018E:
	wait_movement
	scrcmd_191 0
	npc_msg 1
	closemsg
	get_starter_choice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 152
	gotoif ne, scr_seq_0866_T23_01B7
	trainer_battle TRAINER_RIVAL_SILVER_7, 0, 0, 0
	goto scr_seq_0866_T23_01DA

scr_seq_0866_T23_01B7:
	comparevartovalue VAR_SPECIAL_x800C, 155
	gotoif ne, scr_seq_0866_T23_01D2
	trainer_battle TRAINER_RIVAL_SILVER_10, 0, 0, 0
	goto scr_seq_0866_T23_01DA

scr_seq_0866_T23_01D2:
	trainer_battle TRAINER_RIVAL_SILVER, 0, 0, 0
scr_seq_0866_T23_01DA:
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0866_T23_0285
	callstd std_play_rival_outro_music
	scrcmd_191 0
	npc_msg 2
	closemsg
	setvar VAR_UNK_4075, 2
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 462
	gotoif ne, scr_seq_0866_T23_021E
	apply_movement 9, scr_seq_0866_T23_02D4
	goto scr_seq_0866_T23_0277

scr_seq_0866_T23_021E:
	comparevartovalue VAR_SPECIAL_x8005, 463
	gotoif ne, scr_seq_0866_T23_0239
	apply_movement 9, scr_seq_0866_T23_02DC
	goto scr_seq_0866_T23_0277

scr_seq_0866_T23_0239:
	comparevartovalue VAR_SPECIAL_x8005, 464
	gotoif ne, scr_seq_0866_T23_0254
	apply_movement 9, scr_seq_0866_T23_02D4
	goto scr_seq_0866_T23_0277

scr_seq_0866_T23_0254:
	comparevartovalue VAR_SPECIAL_x8005, 465
	gotoif ne, scr_seq_0866_T23_026F
	apply_movement 9, scr_seq_0866_T23_02DC
	goto scr_seq_0866_T23_0277

scr_seq_0866_T23_026F:
	apply_movement 9, scr_seq_0866_T23_02EC
scr_seq_0866_T23_0277:
	wait_movement
	hide_person 9
	callstd std_fade_end_rival_outro_music
	releaseall
	end

scr_seq_0866_T23_0285:
	white_out
	releaseall
	end

scr_seq_0866_T23_028B:
	.byte 0x00

scr_seq_0866_T23_028C:
	step 14, 9
	step 0, 1
	step_end

scr_seq_0866_T23_0298:
	step 14, 9
	step 1, 1
	step_end

scr_seq_0866_T23_02A4:
	step 75, 1
	step_end

scr_seq_0866_T23_02AC:
	step 3, 1
	step 62, 6
	step 63, 7
	step 1, 1
	step_end

scr_seq_0866_T23_02C0:
	step 3, 1
	step 62, 6
	step 63, 7
	step 0, 1
	step_end

scr_seq_0866_T23_02D4:
	step 14, 3
	step_end

scr_seq_0866_T23_02DC:
	step 14, 1
	step 12, 1
	step 14, 2
	step_end

scr_seq_0866_T23_02EC:
	step 14, 1
	step 12, 2
	step 14, 2
	step_end
scr_seq_0866_T23_02FC:
	scrcmd_609
	lockall
	apply_movement 12, scr_seq_0866_T23_0350
	wait_movement
	npc_msg 16
	play_se SEQ_SE_DP_WALL_HIT
	npc_msg 17
	closemsg
	apply_movement 13, scr_seq_0866_T23_0358
	wait_movement
	move_person 13, 23, 0, 16, 3
	apply_movement 12, scr_seq_0866_T23_0374
	wait_movement
	hide_person 13
	setflag FLAG_UNK_272
	setflag FLAG_UNK_271
	clearflag FLAG_UNK_19F
	setvar VAR_UNK_4080, 1
	releaseall
	end


scr_seq_0866_T23_0350:
	step 34, 2
	step_end

scr_seq_0866_T23_0358:
	step 71, 1
	step 22, 1
	step 63, 2
	step 10, 2
	step 72, 1
	step 18, 9
	step_end

scr_seq_0866_T23_0374:
	step 12, 2
	step 33, 1
	step_end
scr_seq_0866_T23_0380:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_07B
	gotoif TRUE, scr_seq_0866_T23_039C
	npc_msg 18
	goto scr_seq_0866_T23_039F

scr_seq_0866_T23_039C:
	npc_msg 19
scr_seq_0866_T23_039F:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0866_T23_03A7:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_07B
	gotoif TRUE, scr_seq_0866_T23_03C3
	npc_msg 5
	goto scr_seq_0866_T23_039F

scr_seq_0866_T23_03C3:
	npc_msg 6
	goto scr_seq_0866_T23_039F

scr_seq_0866_T23_03CC:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 12, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0866_T23_03E1:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 13, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0866_T23_03F6:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 15, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0866_T23_040B:
	scrcmd_055 11, 0, 14, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0866_T23_0422:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 14, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0866_T23_0437:
	scrcmd_055 0, 1, 2, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0866_T23_044E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0866_T23_0461:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0866_T23_0474:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
