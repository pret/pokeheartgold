#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000051_0000000A ; 000
	scrdef scr_seq_00000051_0000015C ; 001
	scrdef_end

scr_seq_00000051_0000000A:
	scrcmd_609
	lockall
	setvar VAR_UNK_40D8, 1
	scrcmd_729 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000051_00000034
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000051_0000007E
	end

scr_seq_00000051_00000034:
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000051_00000053
	apply_movement 255, scr_seq_00000051_00000108
	goto scr_seq_00000051_00000076

scr_seq_00000051_00000053:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000051_0000006E
	apply_movement 255, scr_seq_00000051_00000140
	goto scr_seq_00000051_00000076

scr_seq_00000051_0000006E:
	apply_movement 255, scr_seq_00000051_00000124
scr_seq_00000051_00000076:
	wait_movement
	goto scr_seq_00000051_000000DA

scr_seq_00000051_0000007E:
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000051_000000A5
	apply_movement 255, scr_seq_00000051_00000108
	apply_movement 253, scr_seq_00000051_00000114
	goto scr_seq_00000051_000000D8

scr_seq_00000051_000000A5:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000051_000000C8
	apply_movement 255, scr_seq_00000051_00000140
	apply_movement 253, scr_seq_00000051_0000014C
	goto scr_seq_00000051_000000D8

scr_seq_00000051_000000C8:
	apply_movement 255, scr_seq_00000051_00000124
	apply_movement 253, scr_seq_00000051_00000130
scr_seq_00000051_000000D8:
	wait_movement
scr_seq_00000051_000000DA:
	play_se SEQ_SE_GS_RAKKA01
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 319, 0, 11, 14, 32780
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000051_00000106:
	.byte 0x00, 0x00

scr_seq_00000051_00000108:
	.short 40, 4
	.short 69, 1
	.short 254, 0

scr_seq_00000051_00000114:
	.short 62, 3
	.short 20, 1
	.short 69, 1
	.short 254, 0

scr_seq_00000051_00000124:
	.short 42, 4
	.short 69, 1
	.short 254, 0

scr_seq_00000051_00000130:
	.short 62, 3
	.short 22, 1
	.short 69, 1
	.short 254, 0

scr_seq_00000051_00000140:
	.short 43, 4
	.short 69, 1
	.short 254, 0

scr_seq_00000051_0000014C:
	.short 62, 3
	.short 23, 1
	.short 69, 1
	.short 254, 0
scr_seq_00000051_0000015C:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
