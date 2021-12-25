#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000105_0000003C ; 000
	scrdef scr_seq_00000105_0000000A ; 001
	scrdef_end

scr_seq_00000105_0000000A:
	checkflag FLAG_UNK_189
	gotoif lt, scr_seq_00000105_0000001B
	clearflag FLAG_UNK_189
	end

scr_seq_00000105_0000001B:
	scrcmd_484 16384
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, scr_seq_00000105_00000036
	clearflag FLAG_UNK_27E
	goto scr_seq_00000105_0000003A

scr_seq_00000105_00000036:
	setflag FLAG_UNK_27E
scr_seq_00000105_0000003A:
	end

scr_seq_00000105_0000003C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, 32780
	scrcmd_440 32780, 0
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000105_00000164
	scrcmd_618 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000105_00000178
	scrcmd_438 2, 32780
	scrcmd_440 32780, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000105_000000B5
	apply_movement 255, scr_seq_00000105_0000018C
	apply_movement 1, scr_seq_00000105_000001D8
	goto scr_seq_00000105_00000103

scr_seq_00000105_000000B5:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000105_000000D0
	apply_movement 255, scr_seq_00000105_000001A4
	goto scr_seq_00000105_00000103

scr_seq_00000105_000000D0:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000105_000000F3
	apply_movement 255, scr_seq_00000105_000001C4
	apply_movement 1, scr_seq_00000105_000001D8
	goto scr_seq_00000105_00000103

scr_seq_00000105_000000F3:
	apply_movement 255, scr_seq_00000105_000001B0
	apply_movement 1, scr_seq_00000105_000001D8
scr_seq_00000105_00000103:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000105_0000012A
	apply_movement 253, scr_seq_00000105_000001E4
	wait_movement
scr_seq_00000105_0000012A:
	setflag FLAG_UNK_189
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_615 78
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

scr_seq_00000105_00000164:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000105_00000178:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 3
	waitbutton
	closemsg
	releaseall
	end


scr_seq_00000105_0000018C:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000105_000001A4:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000105_000001B0:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000105_000001C4:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000105_000001D8:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000105_000001E4:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
	.balign 4, 0
