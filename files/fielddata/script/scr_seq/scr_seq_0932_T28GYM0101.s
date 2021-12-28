#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0932_T28GYM0101_00BE ; 000
	scrdef scr_seq_0932_T28GYM0101_000A ; 001
	scrdef_end

scr_seq_0932_T28GYM0101_000A:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0932_T28GYM0101_001B
	clearflag FLAG_UNK_189
	end

scr_seq_0932_T28GYM0101_001B:
	scrcmd_142 39, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0932_T28GYM0101_00B8
	checkflag FLAG_UNK_964
	gotoif FALSE, scr_seq_0932_T28GYM0101_00B2
	scrcmd_147 39, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0932_T28GYM0101_00B2
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_0932_T28GYM0101_0067
	setflag FLAG_UNK_2EE
	goto scr_seq_0932_T28GYM0101_00B0

scr_seq_0932_T28GYM0101_0067:
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_0932_T28GYM0101_007E
	setflag FLAG_UNK_2EE
	goto scr_seq_0932_T28GYM0101_00B0

scr_seq_0932_T28GYM0101_007E:
	comparevartovalue VAR_TEMP_x4000, 8
	gotoif ne, scr_seq_0932_T28GYM0101_0095
	setflag FLAG_UNK_2EE
	goto scr_seq_0932_T28GYM0101_00B0

scr_seq_0932_T28GYM0101_0095:
	comparevartovalue VAR_TEMP_x4000, 9
	gotoif ne, scr_seq_0932_T28GYM0101_00AC
	setflag FLAG_UNK_2EE
	goto scr_seq_0932_T28GYM0101_00B0

scr_seq_0932_T28GYM0101_00AC:
	clearflag FLAG_UNK_2EE
scr_seq_0932_T28GYM0101_00B0:
	end

scr_seq_0932_T28GYM0101_00B2:
	clearflag FLAG_UNK_2EE
	end

scr_seq_0932_T28GYM0101_00B8:
	setflag FLAG_UNK_2EE
	end

scr_seq_0932_T28GYM0101_00BE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge 6, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0932_T28GYM0101_0178
	npc_msg 0
	closemsg
	trainer_battle TRAINER_LEADER_PRYCE_PRYCE, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0932_T28GYM0101_0172
	settrainerflag TRAINER_BOARDER_DEANDRE
	settrainerflag TRAINER_BOARDER_GERARDO
	settrainerflag TRAINER_SKIER_JILL
	settrainerflag TRAINER_SKIER_DIANA
	settrainerflag TRAINER_BOARDER_PATTON
	npc_msg 1
	give_badge 6
	addvar VAR_UNK_4134, 1
	add_special_game_stat 22
	comparevartovalue VAR_UNK_4134, 3
	gotoif ne, scr_seq_0932_T28GYM0101_012F
	setvar VAR_UNK_4077, 1
scr_seq_0932_T28GYM0101_012F:
	buffer_players_name 0
	npc_msg 2
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	npc_msg 3
	setvar VAR_SPECIAL_x8004, 334
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0932_T28GYM0101_018E
	callstd std_give_item_verbose
	setflag FLAG_UNK_0D2
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0932_T28GYM0101_0172:
	white_out
	releaseall
	end

scr_seq_0932_T28GYM0101_0178:
	checkflag FLAG_UNK_964
	gotoif TRUE, scr_seq_0932_T28GYM0101_0198
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0932_T28GYM0101_018E:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_0932_T28GYM0101_0198:
	npc_msg 6
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0932_T28GYM0101_01F9
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0932_T28GYM0101_0204
	npc_msg 7
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 40
	faceplayer
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0932_T28GYM0101_01F9:
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0932_T28GYM0101_0204:
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
