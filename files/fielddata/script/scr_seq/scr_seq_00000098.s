#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000098_00000006 ; 000
	scrdef_end

scr_seq_00000098_00000006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_10C
	gotoif eq, scr_seq_00000098_00000097
	checkflag FLAG_UNK_10D
	gotoif eq, scr_seq_00000098_00000046
	msgbox 0
	closemsg
	scrcmd_213 158, 0, 0, 0
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000098_000000CC
	setflag FLAG_UNK_10D
scr_seq_00000098_00000046:
	msgbox 1
	scrcmd_332 32773
	comparevartovalue VAR_SPECIAL_x8005, 6
	gotoif ne, scr_seq_00000098_00000063
	msgbox 4
	goto scr_seq_00000098_000000D2

scr_seq_00000098_00000063:
	scrcmd_190 0
	msgbox 2
	scrcmd_078 1187
	scrcmd_079
	scrcmd_137 236, 10, 0, 0, 0, 32780
	msgbox 5
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 0
	callif eq, scr_seq_00000098_000000A6
	scrcmd_747
scr_seq_00000098_00000097:
	setflag FLAG_UNK_10C
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000098_000000A6:
	setvar VAR_TEMP_x4000, 0
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_173 32773, 16384
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	return

scr_seq_00000098_000000CC:
	scrcmd_219
	releaseall
	end

scr_seq_00000098_000000D2:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
