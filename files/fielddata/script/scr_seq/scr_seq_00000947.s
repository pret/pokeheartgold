#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000947_0000000A ; 000
	scrdef scr_seq_00000947_000000D5 ; 001
	scrdef_end

scr_seq_00000947_0000000A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0D0
	gotoif eq, scr_seq_00000947_000000CA
	msgbox 0
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000947_0000003B
	goto scr_seq_00000947_000000BF

scr_seq_00000947_0000003B:
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_566
	scrcmd_351 32780
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000947_000000BF
	scrcmd_470 3
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_354 32772, 32773
	scrcmd_239 32772, 32774
	comparevartovalue VAR_SPECIAL_x8006, 0
	gotoif eq, scr_seq_00000947_000000B2
	scrcmd_472 32780
	comparevartovar VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	gotoif ne, scr_seq_00000947_000000B2
	scrcmd_473 32772
	scrcmd_474
	setflag FLAG_UNK_0D0
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000947_000000B2:
	scrcmd_474
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000947_000000BF:
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000947_000000CA:
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000947_000000D5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_529 32768
	scrcmd_480 32780, 32768, 24
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000947_00000199
	scrcmd_193 0, 32768
	msgbox 5
	scrcmd_483 32780, 32768
	comparevartovalue VAR_SPECIAL_x800C, 510
	gotoif lt, scr_seq_00000947_00000136
	msgbox 6
	scrcmd_481 32768, 24
	scrcmd_078 1185
	scrcmd_190 1
	msgbox 7
	scrcmd_079
	scrcmd_193 0, 32768
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000947_00000136:
	comparevartovalue VAR_SPECIAL_x800C, 506
	gotoif ne, scr_seq_00000947_0000014C
	msgbox 10
	goto scr_seq_00000947_00000191

scr_seq_00000947_0000014C:
	comparevartovalue VAR_SPECIAL_x800C, 507
	gotoif ne, scr_seq_00000947_00000162
	msgbox 11
	goto scr_seq_00000947_00000191

scr_seq_00000947_00000162:
	comparevartovalue VAR_SPECIAL_x800C, 508
	gotoif ne, scr_seq_00000947_00000178
	msgbox 12
	goto scr_seq_00000947_00000191

scr_seq_00000947_00000178:
	comparevartovalue VAR_SPECIAL_x800C, 509
	gotoif ne, scr_seq_00000947_0000018E
	msgbox 13
	goto scr_seq_00000947_00000191

scr_seq_00000947_0000018E:
	msgbox 9
scr_seq_00000947_00000191:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000947_00000199:
	scrcmd_193 0, 32768
	msgbox 14
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
