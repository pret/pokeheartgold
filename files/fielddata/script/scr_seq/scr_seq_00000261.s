#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000261_00000049 ; 000
	scrdef scr_seq_00000261_0000000E ; 001
	scrdef scr_seq_00000261_000001CC ; 002
	scrdef_end

scr_seq_00000261_0000000E:
	checkflag FLAG_UNK_189
	gotoif lt, scr_seq_00000261_0000001F
	clearflag FLAG_UNK_189
	end

scr_seq_00000261_0000001F:
	scrcmd_484 16384
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif eq, scr_seq_00000261_00000043
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_00000261_00000043
	setflag FLAG_UNK_27E
	end

scr_seq_00000261_00000043:
	clearflag FLAG_UNK_27E
	end

scr_seq_00000261_00000049:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, 32780
	scrcmd_440 32780, 0
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000261_0000014E
	scrcmd_618 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000261_00000162
	scrcmd_438 2, 32780
	scrcmd_440 32780, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000261_000000C2
	apply_movement 255, scr_seq_00000261_00000178
	apply_movement 1, scr_seq_00000261_000001B0
	goto scr_seq_00000261_000000ED

scr_seq_00000261_000000C2:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000261_000000DD
	apply_movement 255, scr_seq_00000261_00000190
	goto scr_seq_00000261_000000ED

scr_seq_00000261_000000DD:
	apply_movement 255, scr_seq_00000261_0000019C
	apply_movement 1, scr_seq_00000261_000001B0
scr_seq_00000261_000000ED:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000261_00000114
	apply_movement 253, scr_seq_00000261_000001BC
	wait_movement
scr_seq_00000261_00000114:
	setflag FLAG_UNK_189
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_615 37
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

scr_seq_00000261_0000014E:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000261_00000162:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000261_00000176:
	.byte 0x00, 0x00

scr_seq_00000261_00000178:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000261_00000190:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000261_0000019C:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000261_000001B0:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000261_000001BC:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_00000261_000001CC:
	scrcmd_055 0, 1, 13, 32780
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 32780
	callstd 2000
	end
	.balign 4, 0
