#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0869_T23GYM0102_0190 ; 000
	scrdef scr_seq_0869_T23GYM0102_00D3 ; 001
	scrdef scr_seq_0869_T23GYM0102_0192 ; 002
	scrdef scr_seq_0869_T23GYM0102_0197 ; 003
	scrdef scr_seq_0869_T23GYM0102_019C ; 004
	scrdef scr_seq_0869_T23GYM0102_01A1 ; 005
	scrdef scr_seq_0869_T23GYM0102_01A6 ; 006
	scrdef scr_seq_0869_T23GYM0102_01AB ; 007
	scrdef scr_seq_0869_T23GYM0102_01B0 ; 008
	scrdef scr_seq_0869_T23GYM0102_01B5 ; 009
	scrdef scr_seq_0869_T23GYM0102_01BA ; 010
	scrdef scr_seq_0869_T23GYM0102_01BF ; 011
	scrdef scr_seq_0869_T23GYM0102_01C4 ; 012
	scrdef scr_seq_0869_T23GYM0102_01C9 ; 013
	scrdef scr_seq_0869_T23GYM0102_01CE ; 014
	scrdef scr_seq_0869_T23GYM0102_01D3 ; 015
	scrdef scr_seq_0869_T23GYM0102_0046 ; 016
	scrdef_end

scr_seq_0869_T23GYM0102_0046:
	scrcmd_326
	get_phone_book_rematch 34, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0869_T23GYM0102_00CD
	checkflag FLAG_GAME_CLEAR
	gotoif TRUE, scr_seq_0869_T23GYM0102_006C
	clearflag FLAG_UNK_2EA
	end

scr_seq_0869_T23GYM0102_006C:
	scrcmd_147 34, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0869_T23GYM0102_0096
	get_weekday VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 4
	gotoif ne, scr_seq_0869_T23GYM0102_0096
	setflag FLAG_UNK_2EA
	end

scr_seq_0869_T23GYM0102_0096:
	get_weekday VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0869_T23GYM0102_00C7
	comparevartovalue VAR_TEMP_x4001, 3
	gotoif eq, scr_seq_0869_T23GYM0102_00C7
	comparevartovalue VAR_TEMP_x4001, 5
	gotoif eq, scr_seq_0869_T23GYM0102_00C7
	clearflag FLAG_UNK_2EA
	end

scr_seq_0869_T23GYM0102_00C7:
	setflag FLAG_UNK_2EA
	end

scr_seq_0869_T23GYM0102_00CD:
	setflag FLAG_UNK_2EA
	end

scr_seq_0869_T23GYM0102_00D3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0869_T23GYM0102_017A
	npc_msg 0
	closemsg
	trainer_battle TRAINER_LEADER_BUGSY_BUGSY, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0869_T23GYM0102_0174
	npc_msg 1
	buffer_players_name 0
	npc_msg 2
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	give_badge 1
	settrainerflag TRAINER_BUG_CATCHER_AL
	settrainerflag TRAINER_BUG_CATCHER_BENNY
	settrainerflag TRAINER_BUG_CATCHER_JOSH
	settrainerflag TRAINER_TWINS_AMY_AND_MIMI
	add_special_game_stat 22
	npc_msg 3
scr_seq_0869_T23GYM0102_0136:
	setvar VAR_SPECIAL_x8004, 416
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0869_T23GYM0102_016A
	callstd std_give_item_verbose
	setflag FLAG_UNK_07F
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0869_T23GYM0102_016A:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_0869_T23GYM0102_0174:
	white_out
	releaseall
	end

scr_seq_0869_T23GYM0102_017A:
	checkflag FLAG_UNK_07F
	gotoif FALSE, scr_seq_0869_T23GYM0102_0136
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0869_T23GYM0102_0190:
	end

scr_seq_0869_T23GYM0102_0192:
	scrcmd_327 0
	end

scr_seq_0869_T23GYM0102_0197:
	scrcmd_327 1
	end

scr_seq_0869_T23GYM0102_019C:
	scrcmd_327 2
	end

scr_seq_0869_T23GYM0102_01A1:
	scrcmd_327 3
	end

scr_seq_0869_T23GYM0102_01A6:
	scrcmd_327 4
	end

scr_seq_0869_T23GYM0102_01AB:
	scrcmd_327 5
	end

scr_seq_0869_T23GYM0102_01B0:
	scrcmd_327 6
	end

scr_seq_0869_T23GYM0102_01B5:
	scrcmd_327 7
	end

scr_seq_0869_T23GYM0102_01BA:
	scrcmd_327 8
	end

scr_seq_0869_T23GYM0102_01BF:
	scrcmd_327 9
	end

scr_seq_0869_T23GYM0102_01C4:
	scrcmd_327 10
	end

scr_seq_0869_T23GYM0102_01C9:
	scrcmd_327 11
	end

scr_seq_0869_T23GYM0102_01CE:
	scrcmd_328 0
	end

scr_seq_0869_T23GYM0102_01D3:
	scrcmd_328 1
	end
	.balign 4, 0
