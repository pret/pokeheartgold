#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000013_00000045 ; 000
	scrdef scr_seq_00000013_0000000A ; 001
	scrdef_end

scr_seq_00000013_0000000A:
	checkflag FLAG_UNK_189
	gotoif lt, scr_seq_00000013_0000001B
	clearflag FLAG_UNK_189
	end

scr_seq_00000013_0000001B:
	scrcmd_484 16384
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, scr_seq_00000013_0000003F
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif eq, scr_seq_00000013_0000003F
	setflag FLAG_UNK_27E
	end

scr_seq_00000013_0000003F:
	clearflag FLAG_UNK_27E
	end

scr_seq_00000013_00000045:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, 32780
	scrcmd_440 32780, 0
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000013_0000014A
	scrcmd_618 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000013_0000015E
	scrcmd_438 2, 32780
	scrcmd_440 32780, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000013_000000BE
	apply_movement 255, scr_seq_00000013_00000174
	apply_movement 8, scr_seq_00000013_000001AC
	goto scr_seq_00000013_000000E9

scr_seq_00000013_000000BE:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000013_000000D9
	apply_movement 255, scr_seq_00000013_0000018C
	goto scr_seq_00000013_000000E9

scr_seq_00000013_000000D9:
	apply_movement 255, scr_seq_00000013_00000198
	apply_movement 8, scr_seq_00000013_000001AC
scr_seq_00000013_000000E9:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000013_00000110
	apply_movement 253, scr_seq_00000013_000001B8
	wait_movement
scr_seq_00000013_00000110:
	setflag FLAG_UNK_189
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_615 75
	lockall
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	clearflag FLAG_UNK_189
	scrcmd_438 2, 32780
	scrcmd_440 32780, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000013_0000014A:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000013_0000015E:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000013_00000172:
	.byte 0x00, 0x00

scr_seq_00000013_00000174:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000013_0000018C:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000013_00000198:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000013_000001AC:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000013_000001B8:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
	.balign 4, 0
