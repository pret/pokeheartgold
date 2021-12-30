#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0264_001A ; 000
	scrdef scr_seq_0264_0068 ; 001
	scrdef scr_seq_0264_00B6 ; 002
	scrdef scr_seq_0264_0104 ; 003
	scrdef scr_seq_0264_0152 ; 004
	scrdef scr_seq_0264_01A0 ; 005
	scrdef_end

scr_seq_0264_001A:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8000, 1
	goto scr_seq_0264_002E

scr_seq_0264_002C:
	.byte 0x02, 0x00
scr_seq_0264_002E:
	call scr_seq_0264_01EE
	call scr_seq_0264_01F5
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8001
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0264_0221
	comparevartovalue VAR_SPECIAL_x8008, 65534
	gotoif eq, scr_seq_0264_0221
	call scr_seq_0264_0229
	goto scr_seq_0264_002E

scr_seq_0264_0066:
	.byte 0x02, 0x00
scr_seq_0264_0068:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8000, 1
	goto scr_seq_0264_007C

scr_seq_0264_007A:
	.byte 0x02, 0x00
scr_seq_0264_007C:
	call scr_seq_0264_01EE
	call scr_seq_0264_01F5
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8001
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0264_0221
	comparevartovalue VAR_SPECIAL_x8008, 65534
	gotoif eq, scr_seq_0264_0221
	call scr_seq_0264_0229
	goto scr_seq_0264_007C

scr_seq_0264_00B4:
	.byte 0x02, 0x00
scr_seq_0264_00B6:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8000, 2
	goto scr_seq_0264_00CA

scr_seq_0264_00C8:
	.byte 0x02, 0x00
scr_seq_0264_00CA:
	call scr_seq_0264_01EE
	call scr_seq_0264_01F5
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8001
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0264_0221
	comparevartovalue VAR_SPECIAL_x8008, 65534
	gotoif eq, scr_seq_0264_0221
	call scr_seq_0264_0229
	goto scr_seq_0264_00CA

scr_seq_0264_0102:
	.byte 0x02, 0x00
scr_seq_0264_0104:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8000, 5
	goto scr_seq_0264_0118

scr_seq_0264_0116:
	.byte 0x02, 0x00
scr_seq_0264_0118:
	call scr_seq_0264_01EE
	call scr_seq_0264_01F5
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8001
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0264_0221
	comparevartovalue VAR_SPECIAL_x8008, 65534
	gotoif eq, scr_seq_0264_0221
	call scr_seq_0264_0229
	goto scr_seq_0264_0118

scr_seq_0264_0150:
	.byte 0x02, 0x00
scr_seq_0264_0152:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8000, 4
	goto scr_seq_0264_0166

scr_seq_0264_0164:
	.byte 0x02, 0x00
scr_seq_0264_0166:
	call scr_seq_0264_01EE
	call scr_seq_0264_01F5
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8001
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0264_0221
	comparevartovalue VAR_SPECIAL_x8008, 65534
	gotoif eq, scr_seq_0264_0221
	call scr_seq_0264_0229
	goto scr_seq_0264_0166

scr_seq_0264_019E:
	.byte 0x02, 0x00
scr_seq_0264_01A0:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8000, 6
	goto scr_seq_0264_01B4

scr_seq_0264_01B2:
	.byte 0x02, 0x00
scr_seq_0264_01B4:
	call scr_seq_0264_01EE
	call scr_seq_0264_01F5
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8001
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0264_0221
	comparevartovalue VAR_SPECIAL_x8008, 65534
	gotoif eq, scr_seq_0264_0221
	call scr_seq_0264_0229
	goto scr_seq_0264_01B4

scr_seq_0264_01EC:
	.byte 0x02, 0x00
scr_seq_0264_01EE:
	npc_msg 0
	touchscreen_menu_hide
	return

scr_seq_0264_01F5:
	menu_init 1, 1, 0, 1, VAR_SPECIAL_x8001
	menu_item_add 1, 255, 0
	menu_item_add 2, 255, 1
	menu_item_add 3, 255, 2
	menu_item_add 4, 255, 3
	menu_exec
	return

scr_seq_0264_0221:
	closemsg
	touchscreen_menu_show
	releaseall
	end

scr_seq_0264_0229:
	fade_screen 6, 1, 0, 0
	wait_fade
	closemsg
	call scr_seq_0264_023F
	return

scr_seq_0264_023F:
	scrcmd_631 32769, 32768, 32771
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	return
	.balign 4, 0
