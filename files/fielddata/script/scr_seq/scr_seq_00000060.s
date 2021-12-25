#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000060_0000000E ; 000
	scrdef scr_seq_00000060_00000021 ; 001
	scrdef scr_seq_00000060_00000055 ; 002
	scrdef_end

scr_seq_00000060_0000000E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000060_00000021:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 3
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000060_00000047
	closemsg
	releaseall
	end

scr_seq_00000060_00000047:
	scrcmd_190 0
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000060_00000055:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	closemsg
	scrcmd_213 486, 0, 0, 0
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000060_00000193
	msgbox 2
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_101 1
	scrcmd_101 2
	scrcmd_101 3
	scrcmd_101 4
	setflag FLAG_UNK_1A9
	wait 20, VAR_SPECIAL_x8004
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	scrcmd_339 7, 36, 0, 7, 2
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000060_000000F7
	apply_movement 7, scr_seq_00000060_0000019C
	apply_movement 255, scr_seq_00000060_000001C0
	goto scr_seq_00000060_00000107

scr_seq_00000060_000000F7:
	apply_movement 7, scr_seq_00000060_0000019C
	apply_movement 255, scr_seq_00000060_000001DC
scr_seq_00000060_00000107:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_190 0
	msgbox 0
	closemsg
	clearflag FLAG_UNK_19E
	clearflag FLAG_UNK_1AB
	setflag FLAG_UNK_07B
	setvar VAR_UNK_4075, 1
	setvar VAR_UNK_4080, 2
	setvar VAR_UNK_4099, 1
	setvar VAR_UNK_409B, 1
	setvar VAR_UNK_409E, 1
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 164, 0, 4, 5, 0
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	setflag FLAG_UNK_1AA
	setflag FLAG_UNK_1D5
	setflag FLAG_UNK_1AC
	clearflag FLAG_UNK_1AD
	clearflag FLAG_UNK_1A7
	clearflag FLAG_UNK_1A8
	setvar VAR_UNK_40F4, 1
	releaseall
	end

scr_seq_00000060_00000193:
	scrcmd_219
	releaseall
	end

scr_seq_00000060_00000199:
	.byte 0x00, 0x00, 0x00

scr_seq_00000060_0000019C:
	.short 14, 2
	.short 13, 2
	.short 14, 3
	.short 12, 2
	.short 62, 4
	.short 14, 1
	.short 12, 3
	.short 2, 1
	.short 254, 0

scr_seq_00000060_000001C0:
	.short 15, 2
	.short 0, 1
	.short 63, 6
	.short 1, 1
	.short 63, 5
	.short 3, 1
	.short 254, 0

scr_seq_00000060_000001DC:
	.short 13, 1
	.short 15, 1
	.short 0, 1
	.short 63, 6
	.short 1, 1
	.short 63, 5
	.short 3, 1
	.short 254, 0
	.balign 4, 0
