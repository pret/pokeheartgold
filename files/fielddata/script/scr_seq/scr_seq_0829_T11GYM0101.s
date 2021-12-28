#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0829_T11GYM0101_008F ; 000
	scrdef scr_seq_0829_T11GYM0101_015C ; 001
	scrdef scr_seq_0829_T11GYM0101_018D ; 002
	scrdef scr_seq_0829_T11GYM0101_01BF ; 003
	scrdef scr_seq_0829_T11GYM0101_0016 ; 004
	scrdef_end

scr_seq_0829_T11GYM0101_0016:
	scrcmd_142 35, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0829_T11GYM0101_0089
	scrcmd_147 35, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0829_T11GYM0101_006C
	scrcmd_294 13, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0829_T11GYM0101_0055
	goto scr_seq_0829_T11GYM0101_0083

scr_seq_0829_T11GYM0101_0055:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_0829_T11GYM0101_0083
	setflag FLAG_UNK_2F1
	end

scr_seq_0829_T11GYM0101_006C:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_0829_T11GYM0101_0083
	setflag FLAG_UNK_2F1
	end

scr_seq_0829_T11GYM0101_0083:
	clearflag FLAG_UNK_2F1
	end

scr_seq_0829_T11GYM0101_0089:
	setflag FLAG_UNK_2F1
	end

scr_seq_0829_T11GYM0101_008F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 13, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0829_T11GYM0101_0140
	npc_msg 0
	closemsg
	trainer_battle 258, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0829_T11GYM0101_0156
	scrcmd_295 13
	addvar VAR_UNK_4135, 1
	scrcmd_515 22
	setflag FLAG_UNK_998
	settrainerflag 230
	settrainerflag 415
	settrainerflag 368
	settrainerflag 369
	npc_msg 1
	buffer_players_name 0
	npc_msg 2
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	npc_msg 3
	goto scr_seq_0829_T11GYM0101_0102

scr_seq_0829_T11GYM0101_0102:
	setvar VAR_SPECIAL_x8004, 375
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0829_T11GYM0101_0136
	callstd std_give_item_verbose
	setflag FLAG_UNK_182
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0829_T11GYM0101_0136:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_0829_T11GYM0101_0140:
	checkflag FLAG_UNK_182
	gotoif FALSE, scr_seq_0829_T11GYM0101_0102
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0829_T11GYM0101_0156:
	scrcmd_219
	releaseall
	end

scr_seq_0829_T11GYM0101_015C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 13, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0829_T11GYM0101_0182
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0829_T11GYM0101_0182:
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0829_T11GYM0101_018D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 13, VAR_SPECIAL_x800C
	buffer_players_name 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0829_T11GYM0101_01B4
	npc_msg 8
	goto scr_seq_0829_T11GYM0101_01B7

scr_seq_0829_T11GYM0101_01B4:
	npc_msg 9
scr_seq_0829_T11GYM0101_01B7:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0829_T11GYM0101_01BF:
	scrcmd_609
	lockall
	scrcmd_600
	play_se SEQ_SE_PL_BOWABOWA
	apply_movement 255, scr_seq_0829_T11GYM0101_01FC
	wait_movement
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 410, 0, 15, 23, 1
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0829_T11GYM0101_01FB:
	.byte 0x00

scr_seq_0829_T11GYM0101_01FC:
	.short 1, 2
	.short 2, 2
	.short 0, 2
	.short 3, 2
	.short 1, 2
	.short 2, 2
	.short 0, 2
	.short 3, 2
	.short 1, 2
	.short 2, 2
	.short 0, 2
	.short 3, 2
	.short 1, 2
	.short 2, 2
	.short 0, 2
	.short 3, 1
	.short 69, 0
	.short 254, 0
	.balign 4, 0
