#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000884_00000006 ; 000
	scrdef_end

scr_seq_00000884_00000006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_495 32780
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_00000884_0000002B
	goto scr_seq_00000884_00000031

scr_seq_00000884_00000025:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_00000884_0000002B:
	goto scr_seq_00000884_00000073

scr_seq_00000884_00000031:
	hasitem ITEM_CLEAR_BELL, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_00000884_00000061
	hasitem ITEM_RAINBOW_WING, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_00000884_0000006A
	goto scr_seq_00000884_000000B5

scr_seq_00000884_00000061:
	msgbox 3
	goto scr_seq_00000884_000000B8

scr_seq_00000884_0000006A:
	msgbox 1
	goto scr_seq_00000884_000000B8

scr_seq_00000884_00000073:
	hasitem ITEM_TIDAL_BELL, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_00000884_000000A3
	hasitem ITEM_SILVER_WING, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_00000884_000000AC
	goto scr_seq_00000884_000000B5

scr_seq_00000884_000000A3:
	msgbox 4
	goto scr_seq_00000884_000000B8

scr_seq_00000884_000000AC:
	msgbox 2
	goto scr_seq_00000884_000000B8

scr_seq_00000884_000000B5:
	msgbox 0
scr_seq_00000884_000000B8:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
