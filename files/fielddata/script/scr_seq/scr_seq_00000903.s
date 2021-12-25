#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000903_0000004C ; 000
	scrdef scr_seq_00000903_00000068 ; 001
	scrdef scr_seq_00000903_00000091 ; 002
	scrdef scr_seq_00000903_000000BA ; 003
	scrdef scr_seq_00000903_00000188 ; 004
	scrdef scr_seq_00000903_0000001E ; 005
	scrdef scr_seq_00000903_00000199 ; 006
	scrdef_end

scr_seq_00000903_0000001E:
	setflag FLAG_UNK_1BE
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_00000903_00000046
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_00000903_00000044
	clearflag FLAG_UNK_1BE
scr_seq_00000903_00000044:
	end

scr_seq_00000903_00000046:
	clearflag FLAG_UNK_1BE
	end

scr_seq_00000903_0000004C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 7
	callstd 2052
	releaseall
	end

scr_seq_00000903_00000068:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_00000903_00000086
	msgbox 18
	goto scr_seq_00000903_00000089

scr_seq_00000903_00000086:
	msgbox 17
scr_seq_00000903_00000089:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000903_00000091:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_00000903_000000AF
	msgbox 16
	goto scr_seq_00000903_000000B2

scr_seq_00000903_000000AF:
	msgbox 15
scr_seq_00000903_000000B2:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000903_000000BA:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_969
	gotoif eq, scr_seq_00000903_0000017D
	checkflag FLAG_UNK_08D
	gotoif eq, scr_seq_00000903_00000172
	msgbox 9
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000903_000000F6
	goto scr_seq_00000903_00000167

scr_seq_00000903_000000F6:
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_566
	scrcmd_351 32780
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000903_00000167
	scrcmd_470 1
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	get_partymon_species VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_472 32780
	comparevartovar VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	gotoif ne, scr_seq_00000903_0000015A
	scrcmd_473 32772
	scrcmd_474
	setflag FLAG_UNK_08D
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000903_0000015A:
	scrcmd_474
	msgbox 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000903_00000167:
	msgbox 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000903_00000172:
	msgbox 13
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000903_0000017D:
	msgbox 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000903_00000188:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 19
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000903_00000199:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_08E
	gotoif eq, scr_seq_00000903_00000219
	scrcmd_529 VAR_SPECIAL_x8000
	scrcmd_193 0, 32768
	msgbox 0
	scrcmd_382 VAR_SPECIAL_x800C, VAR_SPECIAL_x8000
	comparevartovalue VAR_SPECIAL_x800C, 149
	gotoif ge, scr_seq_00000903_000001E3
	comparevartovalue VAR_SPECIAL_x800C, 50
	gotoif le, scr_seq_00000903_000001FE
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000903_000001E3:
	msgbox 1
	setvar VAR_SPECIAL_x8004, 354
	setvar VAR_SPECIAL_x8005, 1
	callstd 2008
	closemsg
	goto scr_seq_00000903_00000219

scr_seq_00000903_000001FE:
	msgbox 4
	setvar VAR_SPECIAL_x8004, 348
	setvar VAR_SPECIAL_x8005, 1
	callstd 2008
	closemsg
	goto scr_seq_00000903_00000219

scr_seq_00000903_00000219:
	msgbox 6
	setflag FLAG_UNK_08E
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
