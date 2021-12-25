#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000168_00000056 ; 000
	scrdef scr_seq_00000168_0000000E ; 001
	scrdef scr_seq_00000168_000001EC ; 002
	scrdef_end

scr_seq_00000168_0000000E:
	checkflag FLAG_UNK_189
	gotoif lt, scr_seq_00000168_0000001F
	clearflag FLAG_UNK_189
	end

scr_seq_00000168_0000001F:
	scrcmd_484 16384
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_00000168_00000050
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, scr_seq_00000168_00000050
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif eq, scr_seq_00000168_00000050
	setflag FLAG_UNK_27E
	end

scr_seq_00000168_00000050:
	clearflag FLAG_UNK_27E
	end

scr_seq_00000168_00000056:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, 32780
	scrcmd_440 32780, 0
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000168_0000015B
	scrcmd_618 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000168_0000016F
	scrcmd_438 2, 32780
	scrcmd_440 32780, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000168_000000CF
	apply_movement 255, scr_seq_00000168_000001BC
	apply_movement 5, scr_seq_00000168_000001D0
	goto scr_seq_00000168_000000FA

scr_seq_00000168_000000CF:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000168_000000EA
	apply_movement 255, scr_seq_00000168_0000019C
	goto scr_seq_00000168_000000FA

scr_seq_00000168_000000EA:
	apply_movement 255, scr_seq_00000168_000001A8
	apply_movement 5, scr_seq_00000168_000001D0
scr_seq_00000168_000000FA:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000168_00000121
	apply_movement 253, scr_seq_00000168_000001DC
	wait_movement
scr_seq_00000168_00000121:
	setflag FLAG_UNK_189
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_615 72
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

scr_seq_00000168_0000015B:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000168_0000016F:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000168_00000183:
	.byte 0x00, 0x0f, 0x00, 0x01, 0x00, 0x0c, 0x00, 0x02, 0x00, 0x0e, 0x00, 0x01, 0x00
	.byte 0x0c, 0x00, 0x03, 0x00, 0x21, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_00000168_0000019C:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000168_000001A8:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000168_000001BC:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000168_000001D0:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000168_000001DC:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_00000168_000001EC:
	scrcmd_055 0, 1, 4, 32780
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 32780
	callstd 2000
	end
	.balign 4, 0
