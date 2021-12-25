#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000054_0000006D ; 000
	scrdef scr_seq_00000054_0000007E ; 001
	scrdef scr_seq_00000054_00000012 ; 002
	scrdef scr_seq_00000054_00000080 ; 003
	scrdef_end

scr_seq_00000054_00000012:
	checkflag FLAG_UNK_189
	gotoif lt, scr_seq_00000054_00000023
	clearflag FLAG_UNK_189
	end

scr_seq_00000054_00000023:
	scrcmd_294 2, 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_00000054_00000061
	scrcmd_484 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000054_00000067
	comparevartovalue VAR_TEMP_x4001, 2
	gotoif eq, scr_seq_00000054_00000067
	comparevartovalue VAR_TEMP_x4001, 4
	gotoif eq, scr_seq_00000054_00000067
scr_seq_00000054_00000061:
	setflag FLAG_UNK_27E
	end

scr_seq_00000054_00000067:
	clearflag FLAG_UNK_27E
	end

scr_seq_00000054_0000006D:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000054_0000007E:
	end

scr_seq_00000054_00000080:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, 32780
	scrcmd_440 32780, 0
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000054_00000197
	scrcmd_618 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000054_000001AB
	scrcmd_438 2, 32780
	scrcmd_440 32780, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000054_000000F9
	apply_movement 255, scr_seq_00000054_000001C0
	apply_movement 0, scr_seq_00000054_0000020C
	goto scr_seq_00000054_00000147

scr_seq_00000054_000000F9:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000054_00000114
	apply_movement 255, scr_seq_00000054_000001D8
	goto scr_seq_00000054_00000147

scr_seq_00000054_00000114:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000054_00000137
	apply_movement 255, scr_seq_00000054_000001F8
	apply_movement 0, scr_seq_00000054_0000020C
	goto scr_seq_00000054_00000147

scr_seq_00000054_00000137:
	apply_movement 255, scr_seq_00000054_000001E4
	apply_movement 0, scr_seq_00000054_0000020C
scr_seq_00000054_00000147:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 253, scr_seq_00000054_00000218
	wait_movement
	setflag FLAG_UNK_189
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_615 4
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

scr_seq_00000054_00000197:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000054_000001AB:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000054_000001BF:
	.byte 0x00

scr_seq_00000054_000001C0:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000054_000001D8:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000054_000001E4:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000054_000001F8:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000054_0000020C:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000054_00000218:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
	.balign 4, 0
