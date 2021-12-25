#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000133_00000099 ; 000
	scrdef scr_seq_00000133_0000000E ; 001
	scrdef scr_seq_00000133_0000007E ; 002
	scrdef_end

scr_seq_00000133_0000000E:
	comparevartovalue VAR_UNK_40F9, 4
	gotoif ge, scr_seq_00000133_0000007C
	scrcmd_495 16384
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_00000133_00000038
	goto scr_seq_00000133_00000040

scr_seq_00000133_00000032:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_00000133_00000038:
	goto scr_seq_00000133_0000004A

scr_seq_00000133_0000003E:
	.byte 0x02, 0x00
scr_seq_00000133_00000040:
	setflag FLAG_UNK_2D0
	setflag FLAG_UNK_2D3
	end

scr_seq_00000133_0000004A:
	checkflag FLAG_UNK_18B
	gotoif eq, scr_seq_00000133_0000007C
	hasitem ITEM_RED_ORB, 1, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ge, scr_seq_00000133_00000072
	goto scr_seq_00000133_00000040

scr_seq_00000133_00000070:
	.byte 0x02, 0x00
scr_seq_00000133_00000072:
	setflag FLAG_UNK_2D3
	clearflag FLAG_UNK_2D0
	end

scr_seq_00000133_0000007C:
	end

scr_seq_00000133_0000007E:
	checkflag FLAG_UNK_0A4
	gotoif eq, scr_seq_00000133_0000008B
	end

scr_seq_00000133_0000008B:
	setflag FLAG_UNK_2D0
	scrcmd_101 0
	clearflag FLAG_UNK_0A4
	end

scr_seq_00000133_00000099:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 383, 0
	msgbox 0
	scrcmd_077
	closemsg
	setflag FLAG_UNK_0A4
	scrcmd_589 383, 50, 0
	clearflag FLAG_UNK_0A4
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000133_0000019D
	scrcmd_683 16386
	comparevartovalue VAR_TEMP_x4002, 3
	gotoif eq, scr_seq_00000133_000000EC
	comparevartovalue VAR_TEMP_x4002, 4
	gotoif eq, scr_seq_00000133_000000FB
scr_seq_00000133_000000EC:
	msgbox 1
	waitbutton
	closemsg
	setflag FLAG_UNK_18B
	releaseall
	end

scr_seq_00000133_000000FB:
	setvar VAR_UNK_40F9, 4
	setflag FLAG_UNK_179
	clearflag FLAG_UNK_2D3
	scrcmd_100 1
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000133_00000142
	apply_movement 1, scr_seq_00000133_000001A4
	wait_movement
	apply_movement 255, scr_seq_00000133_000001B0
	wait_movement
	goto scr_seq_00000133_00000156

scr_seq_00000133_00000142:
	apply_movement 1, scr_seq_00000133_000001BC
	wait_movement
	apply_movement 255, scr_seq_00000133_000001C8
	wait_movement
scr_seq_00000133_00000156:
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	msgbox 2
	closemsg
	apply_movement 1, scr_seq_00000133_000001D0
	wait_movement
	msgbox 3
	closemsg
	apply_movement 1, scr_seq_00000133_000001E0
	wait_movement
	msgbox 4
	closemsg
	apply_movement 1, scr_seq_00000133_000001EC
	wait_movement
	scrcmd_101 1
	setflag FLAG_UNK_2D3
	setflag FLAG_UNK_2CF
	releaseall
	end

scr_seq_00000133_0000019D:
	scrcmd_219
	releaseall
	end

scr_seq_00000133_000001A3:
	.byte 0x00

scr_seq_00000133_000001A4:
	.short 12, 8
	.short 32, 1
	.short 254, 0

scr_seq_00000133_000001B0:
	.short 33, 1
	.short 13, 1
	.short 254, 0

scr_seq_00000133_000001BC:
	.short 12, 10
	.short 32, 1
	.short 254, 0

scr_seq_00000133_000001C8:
	.short 33, 1
	.short 254, 0

scr_seq_00000133_000001D0:
	.short 33, 1
	.short 9, 2
	.short 32, 1
	.short 254, 0

scr_seq_00000133_000001E0:
	.short 12, 2
	.short 32, 1
	.short 254, 0

scr_seq_00000133_000001EC:
	.short 13, 8
	.short 254, 0
	.balign 4, 0
