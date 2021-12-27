#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0884_0006 ; 000
	scrdef_end

scr_seq_0884_0006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_0884_002B
	goto scr_seq_0884_0031

scr_seq_0884_0025:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_0884_002B:
	goto scr_seq_0884_0073

scr_seq_0884_0031:
	hasitem ITEM_CLEAR_BELL, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_0884_0061
	hasitem ITEM_RAINBOW_WING, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_0884_006A
	goto scr_seq_0884_00B5

scr_seq_0884_0061:
	npc_msg 3
	goto scr_seq_0884_00B8

scr_seq_0884_006A:
	npc_msg 1
	goto scr_seq_0884_00B8

scr_seq_0884_0073:
	hasitem ITEM_TIDAL_BELL, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_0884_00A3
	hasitem ITEM_SILVER_WING, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_0884_00AC
	goto scr_seq_0884_00B5

scr_seq_0884_00A3:
	npc_msg 4
	goto scr_seq_0884_00B8

scr_seq_0884_00AC:
	npc_msg 2
	goto scr_seq_0884_00B8

scr_seq_0884_00B5:
	npc_msg 0
scr_seq_0884_00B8:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
