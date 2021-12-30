#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0809_T08GYM0101_0026 ; 000
	scrdef scr_seq_0809_T08GYM0101_06D4 ; 001
	scrdef scr_seq_0809_T08GYM0101_079E ; 002
	scrdef scr_seq_0809_T08GYM0101_0178 ; 003
	scrdef scr_seq_0809_T08GYM0101_0290 ; 004
	scrdef scr_seq_0809_T08GYM0101_03A8 ; 005
	scrdef scr_seq_0809_T08GYM0101_04C5 ; 006
	scrdef scr_seq_0809_T08GYM0101_07CF ; 007
	scrdef scr_seq_0809_T08GYM0101_00F5 ; 008
	scrdef_end

scr_seq_0809_T08GYM0101_0026:
	scrcmd_330
	get_phone_book_rematch 26, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0809_T08GYM0101_00EF
	scrcmd_147 26, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0809_T08GYM0101_00AF
	check_badge 12, VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_0809_T08GYM0101_006D
	goto scr_seq_0809_T08GYM0101_00E9

scr_seq_0809_T08GYM0101_0067:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_0809_T08GYM0101_006D:
	goto scr_seq_0809_T08GYM0101_0075

scr_seq_0809_T08GYM0101_0073:
	.byte 0x02, 0x00
scr_seq_0809_T08GYM0101_0075:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 16
	gotoif ne, scr_seq_0809_T08GYM0101_0090
	setflag FLAG_UNK_2F3
	goto scr_seq_0809_T08GYM0101_00AD

scr_seq_0809_T08GYM0101_0090:
	comparevartovalue VAR_TEMP_x4000, 17
	gotoif ne, scr_seq_0809_T08GYM0101_00A7
	setflag FLAG_UNK_2F3
	goto scr_seq_0809_T08GYM0101_00AD

scr_seq_0809_T08GYM0101_00A7:
	goto scr_seq_0809_T08GYM0101_00E9

scr_seq_0809_T08GYM0101_00AD:
	end

scr_seq_0809_T08GYM0101_00AF:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 18
	gotoif ne, scr_seq_0809_T08GYM0101_00CA
	setflag FLAG_UNK_2F3
	goto scr_seq_0809_T08GYM0101_00E7

scr_seq_0809_T08GYM0101_00CA:
	comparevartovalue VAR_TEMP_x4000, 19
	gotoif ne, scr_seq_0809_T08GYM0101_00E1
	setflag FLAG_UNK_2F3
	goto scr_seq_0809_T08GYM0101_00E7

scr_seq_0809_T08GYM0101_00E1:
	goto scr_seq_0809_T08GYM0101_00E9

scr_seq_0809_T08GYM0101_00E7:
	end

scr_seq_0809_T08GYM0101_00E9:
	clearflag FLAG_UNK_2F3
	end

scr_seq_0809_T08GYM0101_00EF:
	setflag FLAG_UNK_2F3
	end

scr_seq_0809_T08GYM0101_00F5:
	comparevartovalue VAR_TEMP_x400B, 111
	gotoif ne, scr_seq_0809_T08GYM0101_012E
	checktrainerflag TRAINER_LASS_LINDA
	callif lt, scr_seq_0809_T08GYM0101_0130
	checktrainerflag TRAINER_CAMPER_BARRY
	callif lt, scr_seq_0809_T08GYM0101_0142
	checktrainerflag TRAINER_LASS_ALICE
	callif lt, scr_seq_0809_T08GYM0101_0154
	checktrainerflag TRAINER_PICNICKER_CINDY
	callif lt, scr_seq_0809_T08GYM0101_0166
scr_seq_0809_T08GYM0101_012E:
	end

scr_seq_0809_T08GYM0101_0130:
	clearflag FLAG_UNK_266
	show_person 1
	setflag FLAG_UNK_26A
	hide_person 8
	return

scr_seq_0809_T08GYM0101_0142:
	clearflag FLAG_UNK_267
	show_person 5
	setflag FLAG_UNK_26B
	hide_person 7
	return

scr_seq_0809_T08GYM0101_0154:
	clearflag FLAG_UNK_268
	show_person 4
	setflag FLAG_UNK_26C
	hide_person 9
	return

scr_seq_0809_T08GYM0101_0166:
	clearflag FLAG_UNK_269
	show_person 0
	setflag FLAG_UNK_26D
	hide_person 6
	return

scr_seq_0809_T08GYM0101_0178:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checktrainerflag TRAINER_LASS_LINDA
	gotoif eq, scr_seq_0809_T08GYM0101_0277
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0809_T08GYM0101_01AA
	apply_movement 8, scr_seq_0809_T08GYM0101_0620
	goto scr_seq_0809_T08GYM0101_01E8

scr_seq_0809_T08GYM0101_01AA:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0809_T08GYM0101_01C5
	apply_movement 8, scr_seq_0809_T08GYM0101_05E4
	goto scr_seq_0809_T08GYM0101_01E8

scr_seq_0809_T08GYM0101_01C5:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0809_T08GYM0101_01E0
	apply_movement 8, scr_seq_0809_T08GYM0101_0604
	goto scr_seq_0809_T08GYM0101_01E8

scr_seq_0809_T08GYM0101_01E0:
	apply_movement 8, scr_seq_0809_T08GYM0101_0638
scr_seq_0809_T08GYM0101_01E8:
	wait_movement
	clearflag FLAG_UNK_266
	show_person 1
	setflag FLAG_UNK_26A
	hide_person 8
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0809_T08GYM0101_0215
	apply_movement 1, scr_seq_0809_T08GYM0101_0698
	goto scr_seq_0809_T08GYM0101_0253

scr_seq_0809_T08GYM0101_0215:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0809_T08GYM0101_0230
	apply_movement 1, scr_seq_0809_T08GYM0101_065C
	goto scr_seq_0809_T08GYM0101_0253

scr_seq_0809_T08GYM0101_0230:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0809_T08GYM0101_024B
	apply_movement 1, scr_seq_0809_T08GYM0101_0680
	goto scr_seq_0809_T08GYM0101_0253

scr_seq_0809_T08GYM0101_024B:
	apply_movement 1, scr_seq_0809_T08GYM0101_06B4
scr_seq_0809_T08GYM0101_0253:
	wait_movement
	npc_msg 7
	closemsg
	trainer_battle TRAINER_LASS_LINDA, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0809_T08GYM0101_0282
	settrainerflag TRAINER_LASS_LINDA
scr_seq_0809_T08GYM0101_0277:
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0809_T08GYM0101_0282:
	white_out
	releaseall
	setflag FLAG_UNK_266
	clearflag FLAG_UNK_26A
	end

scr_seq_0809_T08GYM0101_0290:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checktrainerflag TRAINER_CAMPER_BARRY
	gotoif eq, scr_seq_0809_T08GYM0101_038F
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0809_T08GYM0101_02C2
	apply_movement 7, scr_seq_0809_T08GYM0101_0620
	goto scr_seq_0809_T08GYM0101_0300

scr_seq_0809_T08GYM0101_02C2:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0809_T08GYM0101_02DD
	apply_movement 7, scr_seq_0809_T08GYM0101_05E4
	goto scr_seq_0809_T08GYM0101_0300

scr_seq_0809_T08GYM0101_02DD:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0809_T08GYM0101_02F8
	apply_movement 7, scr_seq_0809_T08GYM0101_0604
	goto scr_seq_0809_T08GYM0101_0300

scr_seq_0809_T08GYM0101_02F8:
	apply_movement 7, scr_seq_0809_T08GYM0101_0638
scr_seq_0809_T08GYM0101_0300:
	wait_movement
	clearflag FLAG_UNK_267
	show_person 5
	setflag FLAG_UNK_26B
	hide_person 7
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0809_T08GYM0101_032D
	apply_movement 5, scr_seq_0809_T08GYM0101_0698
	goto scr_seq_0809_T08GYM0101_036B

scr_seq_0809_T08GYM0101_032D:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0809_T08GYM0101_0348
	apply_movement 5, scr_seq_0809_T08GYM0101_065C
	goto scr_seq_0809_T08GYM0101_036B

scr_seq_0809_T08GYM0101_0348:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0809_T08GYM0101_0363
	apply_movement 5, scr_seq_0809_T08GYM0101_0680
	goto scr_seq_0809_T08GYM0101_036B

scr_seq_0809_T08GYM0101_0363:
	apply_movement 5, scr_seq_0809_T08GYM0101_06B4
scr_seq_0809_T08GYM0101_036B:
	wait_movement
	npc_msg 9
	closemsg
	trainer_battle TRAINER_CAMPER_BARRY, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0809_T08GYM0101_039A
	settrainerflag TRAINER_CAMPER_BARRY
scr_seq_0809_T08GYM0101_038F:
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0809_T08GYM0101_039A:
	white_out
	releaseall
	setflag FLAG_UNK_267
	clearflag FLAG_UNK_26B
	end

scr_seq_0809_T08GYM0101_03A8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checktrainerflag TRAINER_LASS_ALICE
	gotoif eq, scr_seq_0809_T08GYM0101_04AC
	npc_msg 11
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0809_T08GYM0101_03DF
	apply_movement 9, scr_seq_0809_T08GYM0101_0620
	goto scr_seq_0809_T08GYM0101_041D

scr_seq_0809_T08GYM0101_03DF:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0809_T08GYM0101_03FA
	apply_movement 9, scr_seq_0809_T08GYM0101_05E4
	goto scr_seq_0809_T08GYM0101_041D

scr_seq_0809_T08GYM0101_03FA:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0809_T08GYM0101_0415
	apply_movement 9, scr_seq_0809_T08GYM0101_0604
	goto scr_seq_0809_T08GYM0101_041D

scr_seq_0809_T08GYM0101_0415:
	apply_movement 9, scr_seq_0809_T08GYM0101_0638
scr_seq_0809_T08GYM0101_041D:
	wait_movement
	clearflag FLAG_UNK_268
	show_person 4
	setflag FLAG_UNK_26C
	hide_person 9
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0809_T08GYM0101_044A
	apply_movement 4, scr_seq_0809_T08GYM0101_0698
	goto scr_seq_0809_T08GYM0101_0488

scr_seq_0809_T08GYM0101_044A:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0809_T08GYM0101_0465
	apply_movement 4, scr_seq_0809_T08GYM0101_065C
	goto scr_seq_0809_T08GYM0101_0488

scr_seq_0809_T08GYM0101_0465:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0809_T08GYM0101_0480
	apply_movement 4, scr_seq_0809_T08GYM0101_0680
	goto scr_seq_0809_T08GYM0101_0488

scr_seq_0809_T08GYM0101_0480:
	apply_movement 4, scr_seq_0809_T08GYM0101_06B4
scr_seq_0809_T08GYM0101_0488:
	wait_movement
	npc_msg 12
	closemsg
	trainer_battle TRAINER_LASS_ALICE, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0809_T08GYM0101_04B7
	settrainerflag TRAINER_LASS_ALICE
scr_seq_0809_T08GYM0101_04AC:
	npc_msg 13
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0809_T08GYM0101_04B7:
	white_out
	releaseall
	setflag FLAG_UNK_268
	clearflag FLAG_UNK_26C
	end

scr_seq_0809_T08GYM0101_04C5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checktrainerflag TRAINER_PICNICKER_CINDY
	gotoif eq, scr_seq_0809_T08GYM0101_05C9
	npc_msg 14
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0809_T08GYM0101_04FC
	apply_movement 6, scr_seq_0809_T08GYM0101_0620
	goto scr_seq_0809_T08GYM0101_053A

scr_seq_0809_T08GYM0101_04FC:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0809_T08GYM0101_0517
	apply_movement 6, scr_seq_0809_T08GYM0101_05E4
	goto scr_seq_0809_T08GYM0101_053A

scr_seq_0809_T08GYM0101_0517:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0809_T08GYM0101_0532
	apply_movement 6, scr_seq_0809_T08GYM0101_0604
	goto scr_seq_0809_T08GYM0101_053A

scr_seq_0809_T08GYM0101_0532:
	apply_movement 6, scr_seq_0809_T08GYM0101_0638
scr_seq_0809_T08GYM0101_053A:
	wait_movement
	clearflag FLAG_UNK_269
	show_person 0
	setflag FLAG_UNK_26D
	hide_person 6
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0809_T08GYM0101_0567
	apply_movement 0, scr_seq_0809_T08GYM0101_0698
	goto scr_seq_0809_T08GYM0101_05A5

scr_seq_0809_T08GYM0101_0567:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0809_T08GYM0101_0582
	apply_movement 0, scr_seq_0809_T08GYM0101_065C
	goto scr_seq_0809_T08GYM0101_05A5

scr_seq_0809_T08GYM0101_0582:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0809_T08GYM0101_059D
	apply_movement 0, scr_seq_0809_T08GYM0101_0680
	goto scr_seq_0809_T08GYM0101_05A5

scr_seq_0809_T08GYM0101_059D:
	apply_movement 0, scr_seq_0809_T08GYM0101_06B4
scr_seq_0809_T08GYM0101_05A5:
	wait_movement
	npc_msg 15
	closemsg
	trainer_battle TRAINER_PICNICKER_CINDY, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0809_T08GYM0101_05D4
	settrainerflag TRAINER_PICNICKER_CINDY
scr_seq_0809_T08GYM0101_05C9:
	npc_msg 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0809_T08GYM0101_05D4:
	white_out
	releaseall
	setflag FLAG_UNK_269
	clearflag FLAG_UNK_26D
	end

scr_seq_0809_T08GYM0101_05E2:
	.byte 0x00, 0x00

scr_seq_0809_T08GYM0101_05E4:
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step_end

scr_seq_0809_T08GYM0101_0604:
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step_end

scr_seq_0809_T08GYM0101_0620:
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step_end

scr_seq_0809_T08GYM0101_0638:
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step_end

scr_seq_0809_T08GYM0101_065C:
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step_end

scr_seq_0809_T08GYM0101_0680:
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step_end

scr_seq_0809_T08GYM0101_0698:
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step_end

scr_seq_0809_T08GYM0101_06B4:
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step_end
scr_seq_0809_T08GYM0101_06D4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge 12, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0809_T08GYM0101_0778
	npc_msg 0
	closemsg
	setvar VAR_TEMP_x400B, 111
	trainer_battle TRAINER_LEADER_JANINE_JANINE, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0809_T08GYM0101_078E
	setvar VAR_TEMP_x400B, 0
	give_badge 12
	addvar VAR_UNK_4135, 1
	add_special_game_stat 22
	settrainerflag TRAINER_PICNICKER_CINDY
	settrainerflag TRAINER_CAMPER_BARRY
	settrainerflag TRAINER_LASS_LINDA
	settrainerflag TRAINER_LASS_ALICE
	npc_msg 1
	buffer_players_name 0
	npc_msg 2
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	npc_msg 3
	goto scr_seq_0809_T08GYM0101_074F

scr_seq_0809_T08GYM0101_074F:
	setvar VAR_SPECIAL_x8004, 411
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0809_T08GYM0101_0794
	callstd std_give_item_verbose
	setflag FLAG_UNK_12D
scr_seq_0809_T08GYM0101_0778:
	checkflag FLAG_UNK_12D
	gotoif FALSE, scr_seq_0809_T08GYM0101_074F
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0809_T08GYM0101_078E:
	white_out
	releaseall
	end

scr_seq_0809_T08GYM0101_0794:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_0809_T08GYM0101_079E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge 12, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0809_T08GYM0101_07C4
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0809_T08GYM0101_07C4:
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0809_T08GYM0101_07CF:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge 12, VAR_SPECIAL_x800C
	buffer_players_name 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0809_T08GYM0101_07F6
	npc_msg 17
	goto scr_seq_0809_T08GYM0101_07F9

scr_seq_0809_T08GYM0101_07F6:
	npc_msg 18
scr_seq_0809_T08GYM0101_07F9:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
