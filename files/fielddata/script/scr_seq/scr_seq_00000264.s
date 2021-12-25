#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000264_0000001A ; 000
	scrdef scr_seq_00000264_00000068 ; 001
	scrdef scr_seq_00000264_000000B6 ; 002
	scrdef scr_seq_00000264_00000104 ; 003
	scrdef scr_seq_00000264_00000152 ; 004
	scrdef scr_seq_00000264_000001A0 ; 005
	scrdef_end

scr_seq_00000264_0000001A:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8000, 1
	goto scr_seq_00000264_0000002E

scr_seq_00000264_0000002C:
	.byte 0x02, 0x00
scr_seq_00000264_0000002E:
	call scr_seq_00000264_000001EE
	call scr_seq_00000264_000001F5
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8001
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000264_00000221
	comparevartovalue VAR_SPECIAL_x8008, 65534
	gotoif eq, scr_seq_00000264_00000221
	call scr_seq_00000264_00000229
	goto scr_seq_00000264_0000002E

scr_seq_00000264_00000066:
	.byte 0x02, 0x00
scr_seq_00000264_00000068:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8000, 1
	goto scr_seq_00000264_0000007C

scr_seq_00000264_0000007A:
	.byte 0x02, 0x00
scr_seq_00000264_0000007C:
	call scr_seq_00000264_000001EE
	call scr_seq_00000264_000001F5
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8001
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000264_00000221
	comparevartovalue VAR_SPECIAL_x8008, 65534
	gotoif eq, scr_seq_00000264_00000221
	call scr_seq_00000264_00000229
	goto scr_seq_00000264_0000007C

scr_seq_00000264_000000B4:
	.byte 0x02, 0x00
scr_seq_00000264_000000B6:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8000, 2
	goto scr_seq_00000264_000000CA

scr_seq_00000264_000000C8:
	.byte 0x02, 0x00
scr_seq_00000264_000000CA:
	call scr_seq_00000264_000001EE
	call scr_seq_00000264_000001F5
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8001
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000264_00000221
	comparevartovalue VAR_SPECIAL_x8008, 65534
	gotoif eq, scr_seq_00000264_00000221
	call scr_seq_00000264_00000229
	goto scr_seq_00000264_000000CA

scr_seq_00000264_00000102:
	.byte 0x02, 0x00
scr_seq_00000264_00000104:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8000, 5
	goto scr_seq_00000264_00000118

scr_seq_00000264_00000116:
	.byte 0x02, 0x00
scr_seq_00000264_00000118:
	call scr_seq_00000264_000001EE
	call scr_seq_00000264_000001F5
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8001
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000264_00000221
	comparevartovalue VAR_SPECIAL_x8008, 65534
	gotoif eq, scr_seq_00000264_00000221
	call scr_seq_00000264_00000229
	goto scr_seq_00000264_00000118

scr_seq_00000264_00000150:
	.byte 0x02, 0x00
scr_seq_00000264_00000152:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8000, 4
	goto scr_seq_00000264_00000166

scr_seq_00000264_00000164:
	.byte 0x02, 0x00
scr_seq_00000264_00000166:
	call scr_seq_00000264_000001EE
	call scr_seq_00000264_000001F5
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8001
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000264_00000221
	comparevartovalue VAR_SPECIAL_x8008, 65534
	gotoif eq, scr_seq_00000264_00000221
	call scr_seq_00000264_00000229
	goto scr_seq_00000264_00000166

scr_seq_00000264_0000019E:
	.byte 0x02, 0x00
scr_seq_00000264_000001A0:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8000, 6
	goto scr_seq_00000264_000001B4

scr_seq_00000264_000001B2:
	.byte 0x02, 0x00
scr_seq_00000264_000001B4:
	call scr_seq_00000264_000001EE
	call scr_seq_00000264_000001F5
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8001
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000264_00000221
	comparevartovalue VAR_SPECIAL_x8008, 65534
	gotoif eq, scr_seq_00000264_00000221
	call scr_seq_00000264_00000229
	goto scr_seq_00000264_000001B4

scr_seq_00000264_000001EC:
	.byte 0x02, 0x00
scr_seq_00000264_000001EE:
	msgbox 0
	scrcmd_746
	return

scr_seq_00000264_000001F5:
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x8001
	scrcmd_751 1, 255, 0
	scrcmd_751 2, 255, 1
	scrcmd_751 3, 255, 2
	scrcmd_751 4, 255, 3
	scrcmd_752
	return

scr_seq_00000264_00000221:
	closemsg
	scrcmd_747
	releaseall
	end

scr_seq_00000264_00000229:
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	closemsg
	call scr_seq_00000264_0000023F
	return

scr_seq_00000264_0000023F:
	scrcmd_631 32769, 32768, 32771
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	return
	.balign 4, 0
