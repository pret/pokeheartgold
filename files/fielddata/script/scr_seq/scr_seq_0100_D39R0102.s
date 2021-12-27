#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0100_0012 ; 000
	scrdef scr_seq_0100_0026 ; 001
	scrdef scr_seq_0100_003A ; 002
	scrdef scr_seq_0100_004E ; 003
	scrdef_end

scr_seq_0100_0012:
	setvar VAR_TEMP_x4000, 12
	setvar VAR_TEMP_x4001, 12
	goto scr_seq_0100_0062

scr_seq_0100_0024:
	.byte 0x02, 0x00
scr_seq_0100_0026:
	setvar VAR_TEMP_x4000, 10
	setvar VAR_TEMP_x4001, 21
	goto scr_seq_0100_0062

scr_seq_0100_0038:
	.byte 0x02, 0x00
scr_seq_0100_003A:
	setvar VAR_TEMP_x4000, 20
	setvar VAR_TEMP_x4001, 10
	goto scr_seq_0100_0062

scr_seq_0100_004C:
	.byte 0x02, 0x00
scr_seq_0100_004E:
	setvar VAR_TEMP_x4000, 21
	setvar VAR_TEMP_x4001, 23
	goto scr_seq_0100_0062

scr_seq_0100_0060:
	.byte 0x02, 0x00
scr_seq_0100_0062:
	scrcmd_609
	lockall
	setvar VAR_UNK_40AB, 1
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0100_0093
	apply_movement 255, scr_seq_0100_0118
	apply_movement 253, scr_seq_0100_0124
	goto scr_seq_0100_00E9

scr_seq_0100_0093:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0100_00B6
	apply_movement 255, scr_seq_0100_0134
	apply_movement 253, scr_seq_0100_0140
	goto scr_seq_0100_00E9

scr_seq_0100_00B6:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0100_00D9
	apply_movement 255, scr_seq_0100_0150
	apply_movement 253, scr_seq_0100_015C
	goto scr_seq_0100_00E9

scr_seq_0100_00D9:
	apply_movement 255, scr_seq_0100_016C
	apply_movement 253, scr_seq_0100_0178
scr_seq_0100_00E9:
	wait_movement
	play_se SEQ_SE_GS_RAKKA01
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 238, 0, 16384, 16385, 32780
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0100_0117:
	.byte 0x00

scr_seq_0100_0118:
	.short 40, 4
	.short 69, 1
	.short 254, 0

scr_seq_0100_0124:
	.short 62, 3
	.short 20, 1
	.short 69, 1
	.short 254, 0

scr_seq_0100_0134:
	.short 41, 4
	.short 69, 1
	.short 254, 0

scr_seq_0100_0140:
	.short 62, 3
	.short 21, 1
	.short 69, 1
	.short 254, 0

scr_seq_0100_0150:
	.short 42, 4
	.short 69, 1
	.short 254, 0

scr_seq_0100_015C:
	.short 62, 3
	.short 22, 1
	.short 69, 1
	.short 254, 0

scr_seq_0100_016C:
	.short 43, 4
	.short 69, 1
	.short 254, 0

scr_seq_0100_0178:
	.short 62, 3
	.short 23, 1
	.short 69, 1
	.short 254, 0
	.balign 4, 0
