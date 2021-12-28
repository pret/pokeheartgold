#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0877_T24GYM0101_001A ; 000
	scrdef scr_seq_0877_T24GYM0101_0012 ; 001
	scrdef scr_seq_0877_T24GYM0101_0115 ; 002
	scrdef scr_seq_0877_T24GYM0101_0173 ; 003
	scrdef_end

scr_seq_0877_T24GYM0101_0012:
	scrcmd_318
	clearflag FLAG_UNK_981
	end

scr_seq_0877_T24GYM0101_001A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_0877_T24GYM0101_010A
	scrcmd_294 4, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0877_T24GYM0101_00EE
	npc_msg 0
	closemsg
	trainer_battle 34, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0877_T24GYM0101_0104
	npc_msg 3
	settrainerflag 156
	settrainerflag 157
	settrainerflag 251
	settrainerflag 159
	buffer_players_name 0
	npc_msg 4
	scrcmd_295 4
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	addvar VAR_UNK_4134, 1
	scrcmd_515 22
	setvar VAR_UNK_4116, 1
	comparevartovalue VAR_UNK_4134, 3
	gotoif ne, scr_seq_0877_T24GYM0101_00A6
	setvar VAR_UNK_4077, 1
scr_seq_0877_T24GYM0101_00A6:
	npc_msg 5
	goto scr_seq_0877_T24GYM0101_00AF

scr_seq_0877_T24GYM0101_00AF:
	setvar VAR_SPECIAL_x8004, 328
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0877_T24GYM0101_00E3
	callstd std_give_item_verbose
	setflag FLAG_UNK_0BA
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0877_T24GYM0101_00E3:
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0877_T24GYM0101_00EE:
	checkflag FLAG_UNK_0BA
	gotoif FALSE, scr_seq_0877_T24GYM0101_00AF
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0877_T24GYM0101_0104:
	scrcmd_219
	releaseall
	end

scr_seq_0877_T24GYM0101_010A:
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0877_T24GYM0101_0115:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_0877_T24GYM0101_0135
	npc_msg 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0877_T24GYM0101_0135:
	npc_msg 10
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0877_T24GYM0101_0153
	closemsg
	releaseall
	end

scr_seq_0877_T24GYM0101_0153:
	buffer_players_name 0
	npc_msg 11
	closemsg
	setflag FLAG_UNK_981
	scrcmd_074 2143
	play_se SEQ_SE_DP_SHIP03
	play_se SEQ_SE_GS_TAKI2
	scrcmd_319 16384
	releaseall
	end

scr_seq_0877_T24GYM0101_0173:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 4, VAR_SPECIAL_x800C
	buffer_players_name 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0877_T24GYM0101_019A
	npc_msg 13
	goto scr_seq_0877_T24GYM0101_019D

scr_seq_0877_T24GYM0101_019A:
	npc_msg 14
scr_seq_0877_T24GYM0101_019D:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
