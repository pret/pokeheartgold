#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0015_D11R0106_00FE ; 000
	scrdef scr_seq_0015_D11R0106_0490 ; 001
	scrdef scr_seq_0015_D11R0106_01D2 ; 002
	scrdef scr_seq_0015_D11R0106_0225 ; 003
	scrdef scr_seq_0015_D11R0106_0297 ; 004
	scrdef scr_seq_0015_D11R0106_02EA ; 005
	scrdef scr_seq_0015_D11R0106_033D ; 006
	scrdef scr_seq_0015_D11R0106_03AF ; 007
	scrdef scr_seq_0015_D11R0106_00B1 ; 008
	scrdef scr_seq_0015_D11R0106_002A ; 009
	scrdef_end

scr_seq_0015_D11R0106_002A:
	get_phone_book_rematch 30, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0015_D11R0106_00AB
	scrcmd_147 30, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0015_D11R0106_008A
	check_badge 15, VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif eq, scr_seq_0015_D11R0106_0069
	clearflag FLAG_UNK_2F5
	end

scr_seq_0015_D11R0106_0069:
	get_weekday VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 2
	gotoif ne, scr_seq_0015_D11R0106_0084
	setflag FLAG_UNK_2F5
	goto scr_seq_0015_D11R0106_0088

scr_seq_0015_D11R0106_0084:
	clearflag FLAG_UNK_2F5
scr_seq_0015_D11R0106_0088:
	end

scr_seq_0015_D11R0106_008A:
	get_weekday VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 4
	gotoif ne, scr_seq_0015_D11R0106_00A5
	setflag FLAG_UNK_2F5
	goto scr_seq_0015_D11R0106_00A9

scr_seq_0015_D11R0106_00A5:
	clearflag FLAG_UNK_2F5
scr_seq_0015_D11R0106_00A9:
	end

scr_seq_0015_D11R0106_00AB:
	setflag FLAG_UNK_2F5
	end

scr_seq_0015_D11R0106_00B1:
	checkflag FLAG_UNK_13B
	callif TRUE, scr_seq_0015_D11R0106_00D4
	checkflag FLAG_UNK_13D
	callif TRUE, scr_seq_0015_D11R0106_00E2
	checkflag FLAG_UNK_13E
	callif TRUE, scr_seq_0015_D11R0106_00F0
	end

scr_seq_0015_D11R0106_00D4:
	move_person 5, 21, 0, 14, 2
	return

scr_seq_0015_D11R0106_00E2:
	move_person 7, 9, 0, 13, 0
	return

scr_seq_0015_D11R0106_00F0:
	move_person 2, 15, 0, 16, 1
	return

scr_seq_0015_D11R0106_00FE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge 14, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0015_D11R0106_01B6
	npc_msg 0
	closemsg
	trainer_battle TRAINER_LEADER_BLAINE_BLAINE, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0015_D11R0106_01CC
	give_badge 14
	addvar VAR_UNK_4135, 1
	setflag FLAG_UNK_265
	setflag FLAG_UNK_299
	clearflag FLAG_UNK_29A
	add_special_game_stat 22
	setflag FLAG_UNK_13F
	setflag FLAG_UNK_140
	setflag FLAG_UNK_13C
	npc_msg 1
	buffer_players_name 0
	npc_msg 2
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	npc_msg 3
	goto scr_seq_0015_D11R0106_0175

scr_seq_0015_D11R0106_0175:
	setvar VAR_SPECIAL_x8004, 377
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0015_D11R0106_01AC
	callstd std_give_item_verbose
	setflag FLAG_UNK_17D
	buffer_players_name 0
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0015_D11R0106_01AC:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_0015_D11R0106_01B6:
	checkflag FLAG_UNK_17D
	gotoif FALSE, scr_seq_0015_D11R0106_0175
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0015_D11R0106_01CC:
	white_out
	releaseall
	end

scr_seq_0015_D11R0106_01D2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_13B
	gotoif TRUE, scr_seq_0015_D11R0106_021A
	npc_msg 6
	closemsg
	trainer_battle TRAINER_SUPER_NERD_CARY, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0015_D11R0106_01CC
	npc_msg 8
	closemsg
	apply_movement 5, scr_seq_0015_D11R0106_0424
	wait_movement
	setflag FLAG_UNK_13B
	releaseall
	end

scr_seq_0015_D11R0106_021A:
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0015_D11R0106_0225:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_13C
	gotoif TRUE, scr_seq_0015_D11R0106_028C
	npc_msg 9
	closemsg
	trainer_battle TRAINER_SUPER_NERD_WALDO, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0015_D11R0106_01CC
	npc_msg 11
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0015_D11R0106_027A
	apply_movement 6, scr_seq_0015_D11R0106_043C
	goto scr_seq_0015_D11R0106_0282

scr_seq_0015_D11R0106_027A:
	apply_movement 6, scr_seq_0015_D11R0106_0430
scr_seq_0015_D11R0106_0282:
	wait_movement
	setflag FLAG_UNK_13C
	releaseall
	end

scr_seq_0015_D11R0106_028C:
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0015_D11R0106_0297:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_13D
	gotoif TRUE, scr_seq_0015_D11R0106_02DF
	npc_msg 12
	closemsg
	trainer_battle TRAINER_SUPER_NERD_MERLE, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0015_D11R0106_01CC
	npc_msg 14
	closemsg
	apply_movement 7, scr_seq_0015_D11R0106_0448
	wait_movement
	setflag FLAG_UNK_13D
	releaseall
	end

scr_seq_0015_D11R0106_02DF:
	npc_msg 13
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0015_D11R0106_02EA:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_13E
	gotoif TRUE, scr_seq_0015_D11R0106_0332
	npc_msg 15
	closemsg
	trainer_battle TRAINER_SCIENTIST_GS_LOWELL, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0015_D11R0106_01CC
	npc_msg 17
	closemsg
	apply_movement 2, scr_seq_0015_D11R0106_0454
	wait_movement
	setflag FLAG_UNK_13E
	releaseall
	end

scr_seq_0015_D11R0106_0332:
	npc_msg 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0015_D11R0106_033D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_13F
	gotoif TRUE, scr_seq_0015_D11R0106_03A4
	npc_msg 18
	closemsg
	trainer_battle TRAINER_SCIENTIST_GS_LINDEN, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0015_D11R0106_01CC
	npc_msg 20
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0015_D11R0106_0392
	apply_movement 3, scr_seq_0015_D11R0106_046C
	goto scr_seq_0015_D11R0106_039A

scr_seq_0015_D11R0106_0392:
	apply_movement 3, scr_seq_0015_D11R0106_0460
scr_seq_0015_D11R0106_039A:
	wait_movement
	setflag FLAG_UNK_13F
	releaseall
	end

scr_seq_0015_D11R0106_03A4:
	npc_msg 19
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0015_D11R0106_03AF:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_140
	gotoif TRUE, scr_seq_0015_D11R0106_0416
	npc_msg 21
	closemsg
	trainer_battle TRAINER_SCIENTIST_GS_DANIEL, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0015_D11R0106_01CC
	npc_msg 23
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0015_D11R0106_0404
	apply_movement 4, scr_seq_0015_D11R0106_0478
	goto scr_seq_0015_D11R0106_040C

scr_seq_0015_D11R0106_0404:
	apply_movement 4, scr_seq_0015_D11R0106_0484
scr_seq_0015_D11R0106_040C:
	wait_movement
	setflag FLAG_UNK_140
	releaseall
	end

scr_seq_0015_D11R0106_0416:
	npc_msg 22
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0015_D11R0106_0421:
	.byte 0x00, 0x00, 0x00

scr_seq_0015_D11R0106_0424:
	step 15, 1
	step 2, 1
	step_end

scr_seq_0015_D11R0106_0430:
	step 13, 1
	step 0, 1
	step_end

scr_seq_0015_D11R0106_043C:
	step 12, 1
	step 1, 1
	step_end

scr_seq_0015_D11R0106_0448:
	step 13, 1
	step 0, 1
	step_end

scr_seq_0015_D11R0106_0454:
	step 12, 1
	step 1, 1
	step_end

scr_seq_0015_D11R0106_0460:
	step 14, 1
	step 3, 1
	step_end

scr_seq_0015_D11R0106_046C:
	step 15, 1
	step 2, 1
	step_end

scr_seq_0015_D11R0106_0478:
	step 14, 1
	step 3, 1
	step_end

scr_seq_0015_D11R0106_0484:
	step 15, 1
	step 2, 1
	step_end
scr_seq_0015_D11R0106_0490:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge 14, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0015_D11R0106_04B6
	npc_msg 24
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0015_D11R0106_04B6:
	npc_msg 25
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
