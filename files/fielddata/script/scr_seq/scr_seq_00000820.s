#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000820_00000025 ; 000
	scrdef scr_seq_00000820_00000068 ; 001
	scrdef scr_seq_00000820_0000000E ; 002
	scrdef_end

scr_seq_00000820_0000000E:
	checkflag FLAG_UNK_0E4
	gotoif eq, scr_seq_00000820_00000023
	scrcmd_375 3
	scrcmd_375 4
	end

scr_seq_00000820_00000023:
	end

scr_seq_00000820_00000025:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000820_00000060
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	play_se SEQ_SE_DP_KI_GASYAN
	clearflag FLAG_UNK_20B
	scrcmd_100 1
	setvar VAR_TEMP_x4001, 1
	releaseall
	end

scr_seq_00000820_0000005D:
	.byte 0x00, 0x00, 0x00

scr_seq_00000820_00000060:
	.short 12, 6
	.short 254, 0
scr_seq_00000820_00000068:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0E4
	gotoif eq, scr_seq_00000820_000000D1
	msgbox 0
	closemsg
	comparevartovalue VAR_UNK_4135, 8
	gotoif lt, scr_seq_00000820_0000009B
	scrcmd_213 702, 0, 0, 0
	goto scr_seq_00000820_000000A3

scr_seq_00000820_0000009B:
	scrcmd_213 245, 0, 0, 0
scr_seq_00000820_000000A3:
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000820_000000DC
	setflag FLAG_UNK_0E4
	msgbox 1
	closemsg
	play_se SEQ_SE_DP_KI_GASYAN
	scrcmd_101 2
	scrcmd_101 3
	scrcmd_101 4
	releaseall
	end

scr_seq_00000820_000000D1:
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000820_000000DC:
	scrcmd_219
	releaseall
	end
	.balign 4, 0
