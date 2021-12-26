#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000065_00000045 ; 000
	scrdef scr_seq_00000065_0000000A ; 001
	scrdef_end

scr_seq_00000065_0000000A:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_00000065_0000001B
	clearflag FLAG_UNK_189
	end

scr_seq_00000065_0000001B:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, scr_seq_00000065_0000003F
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif eq, scr_seq_00000065_0000003F
	setflag FLAG_UNK_27E
	end

scr_seq_00000065_0000003F:
	clearflag FLAG_UNK_27E
	end

scr_seq_00000065_00000045:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000065_00000127
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000065_0000013B
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000065_000000B6
	apply_movement 255, scr_seq_00000065_00000150
	goto scr_seq_00000065_000000C6

scr_seq_00000065_000000B6:
	apply_movement 255, scr_seq_00000065_0000015C
	apply_movement 3, scr_seq_00000065_00000170
scr_seq_00000065_000000C6:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000065_000000ED
	apply_movement 253, scr_seq_00000065_0000017C
	wait_movement
scr_seq_00000065_000000ED:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 27
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000065_00000127:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000065_0000013B:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000065_0000014F:
	.byte 0x00

scr_seq_00000065_00000150:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000065_0000015C:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000065_00000170:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000065_0000017C:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
	.balign 4, 0
