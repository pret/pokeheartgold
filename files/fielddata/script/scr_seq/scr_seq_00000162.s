#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000162_00000124 ; 000
	scrdef scr_seq_00000162_0000002F ; 001
	scrdef scr_seq_00000162_00000012 ; 002
	scrdef scr_seq_00000162_00000153 ; 003
	scrdef_end

scr_seq_00000162_00000012:
	comparevartovalue VAR_UNK_40CB, 4
	gotoif ne, scr_seq_00000162_00000029
	clearflag FLAG_UNK_219
	goto scr_seq_00000162_0000002D

scr_seq_00000162_00000029:
	setflag FLAG_UNK_219
scr_seq_00000162_0000002D:
	end

scr_seq_00000162_0000002F:
	scrcmd_609
	lockall
	setflag FLAG_UNK_0ED
	scrcmd_105 16384, 16385
	comparevartovalue VAR_TEMP_x4001, 19
	gotoif eq, scr_seq_00000162_00000088
	apply_movement 1, scr_seq_00000162_000000C4
	scrcmd_729 16386
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif eq, scr_seq_00000162_0000006B
	apply_movement 253, scr_seq_00000162_00000114
scr_seq_00000162_0000006B:
	apply_movement 255, scr_seq_00000162_00000104
	wait_movement
	msgbox 0
	closemsg
	apply_movement 1, scr_seq_00000162_000000D4
	wait_movement
	releaseall
	end

scr_seq_00000162_00000088:
	apply_movement 1, scr_seq_00000162_000000E4
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif eq, scr_seq_00000162_000000A5
	apply_movement 253, scr_seq_00000162_00000114
scr_seq_00000162_000000A5:
	apply_movement 255, scr_seq_00000162_00000104
	wait_movement
	msgbox 0
	closemsg
	apply_movement 1, scr_seq_00000162_000000F4
	wait_movement
	releaseall
	end

scr_seq_00000162_000000C2:
	.byte 0x00, 0x00

scr_seq_00000162_000000C4:
	.short 0, 2
	.short 12, 1
	.short 2, 2
	.short 254, 0

scr_seq_00000162_000000D4:
	.short 1, 2
	.short 13, 1
	.short 2, 2
	.short 254, 0

scr_seq_00000162_000000E4:
	.short 1, 2
	.short 13, 1
	.short 2, 2
	.short 254, 0

scr_seq_00000162_000000F4:
	.short 0, 2
	.short 12, 1
	.short 2, 2
	.short 254, 0

scr_seq_00000162_00000104:
	.short 71, 1
	.short 14, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000162_00000114:
	.short 71, 1
	.short 14, 1
	.short 72, 1
	.short 254, 0
scr_seq_00000162_00000124:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40CB, 3
	gotoif ge, scr_seq_00000162_00000148
	msgbox 1
	waitbutton
	closemsg
	setflag FLAG_UNK_0ED
	releaseall
	end

scr_seq_00000162_00000148:
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000162_00000153:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	apply_movement 0, scr_seq_00000162_0000020C
	wait_movement
	scrcmd_729 16386
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif eq, scr_seq_00000162_00000180
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
scr_seq_00000162_00000180:
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000162_000001A7
	apply_movement 255, scr_seq_00000162_00000218
	apply_movement 0, scr_seq_00000162_00000238
	goto scr_seq_00000162_000001B7

scr_seq_00000162_000001A7:
	apply_movement 255, scr_seq_00000162_00000228
	apply_movement 0, scr_seq_00000162_00000244
scr_seq_00000162_000001B7:
	wait_movement
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif eq, scr_seq_00000162_000001D0
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
scr_seq_00000162_000001D0:
	msgbox 6
	closemsg
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	setvar VAR_UNK_40CB, 5
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 328, 0, 9, 10, 0
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000162_0000020B:
	.byte 0x00

scr_seq_00000162_0000020C:
	.short 75, 1
	.short 63, 1
	.short 254, 0

scr_seq_00000162_00000218:
	.short 71, 1
	.short 8, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000162_00000228:
	.short 71, 1
	.short 11, 2
	.short 72, 1
	.short 254, 0

scr_seq_00000162_00000238:
	.short 0, 2
	.short 8, 1
	.short 254, 0

scr_seq_00000162_00000244:
	.short 3, 2
	.short 11, 2
	.short 254, 0
	.balign 4, 0
