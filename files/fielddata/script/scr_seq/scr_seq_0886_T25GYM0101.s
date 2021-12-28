#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0886_T25GYM0101_010C ; 000
	scrdef scr_seq_0886_T25GYM0101_021E ; 001
	scrdef scr_seq_0886_T25GYM0101_0284 ; 002
	scrdef scr_seq_0886_T25GYM0101_02B5 ; 003
	scrdef scr_seq_0886_T25GYM0101_0016 ; 004
	scrdef_end

scr_seq_0886_T25GYM0101_0016:
	scrcmd_142 17, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0886_T25GYM0101_0106
	checkflag FLAG_UNK_964
	gotoif FALSE, scr_seq_0886_T25GYM0101_0100
	scrcmd_147 17, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0886_T25GYM0101_00AF
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 12
	gotoif ne, scr_seq_0886_T25GYM0101_0062
	setflag FLAG_UNK_2EC
	goto scr_seq_0886_T25GYM0101_00AD

scr_seq_0886_T25GYM0101_0062:
	comparevartovalue VAR_TEMP_x4000, 13
	gotoif ne, scr_seq_0886_T25GYM0101_0079
	setflag FLAG_UNK_2EC
	goto scr_seq_0886_T25GYM0101_00AD

scr_seq_0886_T25GYM0101_0079:
	comparevartovalue VAR_TEMP_x4000, 14
	gotoif ne, scr_seq_0886_T25GYM0101_0090
	setflag FLAG_UNK_2EC
	goto scr_seq_0886_T25GYM0101_00AD

scr_seq_0886_T25GYM0101_0090:
	comparevartovalue VAR_TEMP_x4000, 15
	gotoif ne, scr_seq_0886_T25GYM0101_00A7
	setflag FLAG_UNK_2EC
	goto scr_seq_0886_T25GYM0101_00AD

scr_seq_0886_T25GYM0101_00A7:
	goto scr_seq_0886_T25GYM0101_0100

scr_seq_0886_T25GYM0101_00AD:
	end

scr_seq_0886_T25GYM0101_00AF:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 18
	gotoif ne, scr_seq_0886_T25GYM0101_00CA
	setflag FLAG_UNK_2EC
	goto scr_seq_0886_T25GYM0101_00FE

scr_seq_0886_T25GYM0101_00CA:
	comparevartovalue VAR_TEMP_x4000, 19
	gotoif ne, scr_seq_0886_T25GYM0101_00E1
	setflag FLAG_UNK_2EC
	goto scr_seq_0886_T25GYM0101_00FE

scr_seq_0886_T25GYM0101_00E1:
	comparevartovalue VAR_TEMP_x4000, 20
	gotoif ne, scr_seq_0886_T25GYM0101_00F8
	setflag FLAG_UNK_2EC
	goto scr_seq_0886_T25GYM0101_00FE

scr_seq_0886_T25GYM0101_00F8:
	goto scr_seq_0886_T25GYM0101_0100

scr_seq_0886_T25GYM0101_00FE:
	end

scr_seq_0886_T25GYM0101_0100:
	clearflag FLAG_UNK_2EC
	end

scr_seq_0886_T25GYM0101_0106:
	setflag FLAG_UNK_2EC
	end

scr_seq_0886_T25GYM0101_010C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge 2, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0886_T25GYM0101_0202
	checkflag FLAG_UNK_0B7
	gotoif TRUE, scr_seq_0886_T25GYM0101_01A0
	comparevartovalue VAR_UNK_410A, 1
	gotoif eq, scr_seq_0886_T25GYM0101_017D
	npc_msg 0
	closemsg
	trainer_battle TRAINER_LEADER_WHITNEY, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0886_T25GYM0101_0218
	settrainerflag TRAINER_LASS_CARRIE
	settrainerflag TRAINER_LASS_CATHY
	settrainerflag TRAINER_BEAUTY_VICTORIA
	settrainerflag TRAINER_BEAUTY_SAMANTHA
	add_special_game_stat 22
	show_person_at 1, 13, 0, 15, 0
scr_seq_0886_T25GYM0101_017D:
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	setvar VAR_UNK_410A, 1
	setflag FLAG_UNK_084
	setvar VAR_UNK_40DA, 1
	clearflag FLAG_UNK_223
	setflag FLAG_UNK_224
	end

scr_seq_0886_T25GYM0101_01A0:
	npc_msg 3
	buffer_players_name 0
	npc_msg 4
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	give_badge 2
	setvar VAR_UNK_410A, 2
	clearflag FLAG_UNK_084
	setflag FLAG_UNK_998
	npc_msg 5
scr_seq_0886_T25GYM0101_01C4:
	setvar VAR_SPECIAL_x8004, 372
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0886_T25GYM0101_01F8
	callstd std_give_item_verbose
	npc_msg 7
	waitbutton
	closemsg
	setflag FLAG_UNK_085
	releaseall
	end

scr_seq_0886_T25GYM0101_01F8:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_0886_T25GYM0101_0202:
	checkflag FLAG_UNK_085
	gotoif FALSE, scr_seq_0886_T25GYM0101_01C4
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0886_T25GYM0101_0218:
	white_out
	releaseall
	end

scr_seq_0886_T25GYM0101_021E:
	scrcmd_609
	lockall
	apply_movement 1, scr_seq_0886_T25GYM0101_0260
	wait_movement
	npc_msg 9
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 1, scr_seq_0886_T25GYM0101_026C
	apply_movement 255, scr_seq_0886_T25GYM0101_0278
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	setflag FLAG_UNK_0B7
	releaseall
	end

scr_seq_0886_T25GYM0101_025F:
	.byte 0x00

scr_seq_0886_T25GYM0101_0260:
	.short 75, 1
	.short 12, 3
	.short 254, 0

scr_seq_0886_T25GYM0101_026C:
	.short 13, 3
	.short 32, 1
	.short 254, 0

scr_seq_0886_T25GYM0101_0278:
	.short 63, 1
	.short 12, 1
	.short 254, 0
scr_seq_0886_T25GYM0101_0284:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge 2, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0886_T25GYM0101_02AA
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0886_T25GYM0101_02AA:
	npc_msg 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0886_T25GYM0101_02B5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge 2, VAR_SPECIAL_x800C
	buffer_players_name 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0886_T25GYM0101_02DC
	npc_msg 12
	goto scr_seq_0886_T25GYM0101_02DF

scr_seq_0886_T25GYM0101_02DC:
	npc_msg 13
scr_seq_0886_T25GYM0101_02DF:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
