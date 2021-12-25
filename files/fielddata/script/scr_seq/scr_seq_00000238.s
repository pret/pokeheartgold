#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000238_00000210 ; 000
	scrdef scr_seq_00000238_0000000A ; 001
	scrdef_end

scr_seq_00000238_0000000A:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 1, scr_seq_00000238_00000140
	apply_movement 2, scr_seq_00000238_0000014C
	apply_movement 255, scr_seq_00000238_00000158
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_190 0
	scrcmd_132 0, 10
	closemsg
	scrcmd_132 1, 11
	closemsg
	apply_movement 1, scr_seq_00000238_00000138
	wait_movement
	scrcmd_132 2, 12
	closemsg
	scrcmd_132 3, 13
	closemsg
	apply_movement 1, scr_seq_00000238_00000164
	wait_movement
	scrcmd_132 4, 14
	closemsg
	apply_movement 1, scr_seq_00000238_0000016C
	apply_movement 2, scr_seq_00000238_00000184
	wait_movement
	scrcmd_132 5, 15
	closemsg
	apply_movement 1, scr_seq_00000238_00000198
	apply_movement 2, scr_seq_00000238_000001A8
	wait_movement
	apply_movement 255, scr_seq_00000238_00000190
	wait_movement
	scrcmd_132 6, 16
	closemsg
	scrcmd_281 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000238_000000C6
	scrcmd_146 4
	goto scr_seq_00000238_000000CA

scr_seq_00000238_000000C6:
	scrcmd_146 3
scr_seq_00000238_000000CA:
	scrcmd_190 0
	scrcmd_132 7, 17
	scrcmd_078 1206
	scrcmd_079
	apply_movement 1, scr_seq_00000238_000001BC
	wait_movement
	scrcmd_132 8, 18
	closemsg
	apply_movement 1, scr_seq_00000238_000001C4
	apply_movement 2, scr_seq_00000238_000001CC
	wait_movement
	scrcmd_132 9, 19
	closemsg
	apply_movement 1, scr_seq_00000238_000001D4
	apply_movement 2, scr_seq_00000238_000001E8
	apply_movement 255, scr_seq_00000238_00000204
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	scrcmd_101 1
	scrcmd_101 2
	wait_se SEQ_SE_DP_KAIDAN2
	setvar VAR_UNK_408E, 2
	setflag FLAG_UNK_22D
	releaseall
	end

scr_seq_00000238_00000137:
	.byte 0x00

scr_seq_00000238_00000138:
	.short 75, 1
	.short 254, 0

scr_seq_00000238_00000140:
	.short 63, 1
	.short 12, 3
	.short 254, 0

scr_seq_00000238_0000014C:
	.short 16, 3
	.short 48, 2
	.short 254, 0

scr_seq_00000238_00000158:
	.short 63, 1
	.short 12, 3
	.short 254, 0

scr_seq_00000238_00000164:
	.short 33, 1
	.short 254, 0

scr_seq_00000238_0000016C:
	.short 14, 1
	.short 13, 3
	.short 63, 1
	.short 75, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000238_00000184:
	.short 14, 2
	.short 13, 2
	.short 254, 0

scr_seq_00000238_00000190:
	.short 34, 1
	.short 254, 0

scr_seq_00000238_00000198:
	.short 63, 1
	.short 12, 1
	.short 35, 1
	.short 254, 0

scr_seq_00000238_000001A8:
	.short 35, 1
	.short 71, 1
	.short 54, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000238_000001BC:
	.short 35, 1
	.short 254, 0

scr_seq_00000238_000001C4:
	.short 32, 1
	.short 254, 0

scr_seq_00000238_000001CC:
	.short 32, 1
	.short 254, 0

scr_seq_00000238_000001D4:
	.short 13, 2
	.short 15, 1
	.short 13, 1
	.short 69, 1
	.short 254, 0

scr_seq_00000238_000001E8:
	.short 63, 1
	.short 48, 2
	.short 63, 1
	.short 17, 3
	.short 19, 2
	.short 37, 1
	.short 254, 0

scr_seq_00000238_00000204:
	.short 63, 2
	.short 33, 1
	.short 254, 0
scr_seq_00000238_00000210:
	scrcmd_715
	end
	.balign 4, 0
