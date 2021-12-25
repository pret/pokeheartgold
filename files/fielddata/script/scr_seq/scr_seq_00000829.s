#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000829_0000008F ; 000
	scrdef scr_seq_00000829_0000015C ; 001
	scrdef scr_seq_00000829_0000018D ; 002
	scrdef scr_seq_00000829_000001BF ; 003
	scrdef scr_seq_00000829_00000016 ; 004
	scrdef_end

scr_seq_00000829_00000016:
	scrcmd_142 35, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000829_00000089
	scrcmd_147 35, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000829_0000006C
	scrcmd_294 13, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_00000829_00000055
	goto scr_seq_00000829_00000083

scr_seq_00000829_00000055:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_00000829_00000083
	setflag FLAG_UNK_2F1
	end

scr_seq_00000829_0000006C:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_00000829_00000083
	setflag FLAG_UNK_2F1
	end

scr_seq_00000829_00000083:
	clearflag FLAG_UNK_2F1
	end

scr_seq_00000829_00000089:
	setflag FLAG_UNK_2F1
	end

scr_seq_00000829_0000008F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 13, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000829_00000140
	msgbox 0
	closemsg
	trainer_battle 258, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000829_00000156
	scrcmd_295 13
	addvar VAR_UNK_4135, 1
	scrcmd_515 22
	setflag FLAG_UNK_998
	settrainerflag 230
	settrainerflag 415
	settrainerflag 368
	settrainerflag 369
	msgbox 1
	scrcmd_190 0
	msgbox 2
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	msgbox 3
	goto scr_seq_00000829_00000102

scr_seq_00000829_00000102:
	setvar VAR_SPECIAL_x8004, 375
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000829_00000136
	callstd 2033
	setflag FLAG_UNK_182
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000829_00000136:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000829_00000140:
	checkflag FLAG_UNK_182
	gotoif lt, scr_seq_00000829_00000102
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000829_00000156:
	scrcmd_219
	releaseall
	end

scr_seq_00000829_0000015C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 13, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000829_00000182
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000829_00000182:
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000829_0000018D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 13, VAR_SPECIAL_x800C
	scrcmd_190 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000829_000001B4
	msgbox 8
	goto scr_seq_00000829_000001B7

scr_seq_00000829_000001B4:
	msgbox 9
scr_seq_00000829_000001B7:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000829_000001BF:
	scrcmd_609
	lockall
	scrcmd_600
	play_se SEQ_SE_PL_BOWABOWA
	apply_movement 255, scr_seq_00000829_000001FC
	wait_movement
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 410, 0, 15, 23, 1
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000829_000001FB:
	.byte 0x00

scr_seq_00000829_000001FC:
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
