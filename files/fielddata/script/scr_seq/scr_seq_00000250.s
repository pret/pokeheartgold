#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000250_0000000A ; 000
	scrdef scr_seq_00000250_0000013A ; 001
	scrdef_end

scr_seq_00000250_0000000A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0AA
	gotoif TRUE, scr_seq_00000250_0000002C
	setflag FLAG_UNK_0A8
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000250_0000002C:
	setvar VAR_SPECIAL_x8004, 33
	setvar VAR_SPECIAL_x8005, 0
	hasitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 999
	gotoif ne, scr_seq_00000250_00000058
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000250_00000058:
	scrcmd_113 20, 2
	msgbox 1
	scrcmd_746
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 12, 255, 1
	scrcmd_751 13, 255, 2
	scrcmd_751 14, 255, 3
	scrcmd_752
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_00000250_00000111
	comparevartovalue VAR_SPECIAL_x800C, 1
	callif eq, scr_seq_00000250_0000011E
	comparevartovalue VAR_SPECIAL_x800C, 2
	callif eq, scr_seq_00000250_0000012C
	hasenoughmoneyvar 32780, 16385
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000250_000000F7
	setvar VAR_SPECIAL_x8004, 33
	copyvar VAR_SPECIAL_x8005, VAR_TEMP_x4000
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000250_00000104
	submoneyvar 16385
	scrcmd_115
	msgbox 2
	callstd 2033
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_00000250_000000F7:
	msgbox 3
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_00000250_00000104:
	msgbox 4
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_00000250_00000111:
	msgbox 5
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_00000250_0000011E:
	setvar VAR_TEMP_x4000, 1
	setvar VAR_TEMP_x4001, 500
	return

scr_seq_00000250_0000012C:
	setvar VAR_TEMP_x4000, 12
	setvar VAR_TEMP_x4001, 6000
	return

scr_seq_00000250_0000013A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0AA
	gotoif TRUE, scr_seq_00000250_00000158
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000250_00000158:
	checkflag FLAG_UNK_0AB
	gotoif TRUE, scr_seq_00000250_00000197
	msgbox 8
	scrcmd_049
	setvar VAR_SPECIAL_x8004, 410
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000250_000001A2
	callstd 2033
	setflag FLAG_UNK_0AB
	goto scr_seq_00000250_00000197

scr_seq_00000250_00000197:
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000250_000001A2:
	msgbox 11
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
