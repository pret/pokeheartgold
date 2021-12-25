#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000940_00000006 ; 000
	scrdef_end

scr_seq_00000940_00000006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_RED_GYARADOS_MEET
	gotoif eq, scr_seq_00000940_0000003A
	checkflag FLAG_UNK_0C8
	gotoif eq, scr_seq_00000940_0000002F
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000940_0000002F:
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000940_0000003A:
	scrcmd_784 0, 0
	scrcmd_389 32780, 129
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000940_0000005A
	msgbox 2
	goto scr_seq_00000940_00000146

scr_seq_00000940_0000005A:
	msgbox 3
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_349
	scrcmd_351 32770
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	comparevartovalue VAR_SPECIAL_x8002, 255
	gotoif ne, scr_seq_00000940_00000095
	msgbox 10
	goto scr_seq_00000940_00000146

scr_seq_00000940_00000095:
	scrcmd_354 32770, 32769
	comparevartovalue VAR_SPECIAL_x8001, 129
	gotoif eq, scr_seq_00000940_000000B1
	msgbox 8
	goto scr_seq_00000940_00000146

scr_seq_00000940_000000B1:
	scrcmd_390 32780, 32770
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000940_000000E3
	scrcmd_392 0, 1, 32770
	scrcmd_393 2, 3, 129
	msgbox 7
	goto scr_seq_00000940_00000146

scr_seq_00000940_000000DD:
	.byte 0x16, 0x00, 0x1e
	.byte 0x00, 0x00, 0x00
scr_seq_00000940_000000E3:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000940_00000101
	scrcmd_393 0, 1, 129
	msgbox 6
	goto scr_seq_00000940_00000146

scr_seq_00000940_00000101:
	scrcmd_392 0, 1, 32770
	msgbox 4
	setvar VAR_SPECIAL_x8004, 38
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000940_00000137
	callstd 2009
	goto scr_seq_00000940_00000148

scr_seq_00000940_00000137:
	callstd 2033
	scrcmd_391 32770
	setflag FLAG_UNK_139
	msgbox 5
scr_seq_00000940_00000146:
	waitbutton
scr_seq_00000940_00000148:
	closemsg
	scrcmd_784 0, 1
	releaseall
	end
	.balign 4, 0
