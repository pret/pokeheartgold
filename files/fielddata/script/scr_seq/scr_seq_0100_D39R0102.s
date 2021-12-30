#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0100_D39R0102_0012 ; 000
	scrdef scr_seq_0100_D39R0102_0026 ; 001
	scrdef scr_seq_0100_D39R0102_003A ; 002
	scrdef scr_seq_0100_D39R0102_004E ; 003
	scrdef_end

scr_seq_0100_D39R0102_0012:
	setvar VAR_TEMP_x4000, 12
	setvar VAR_TEMP_x4001, 12
	goto scr_seq_0100_D39R0102_0062

scr_seq_0100_D39R0102_0024:
	.byte 0x02, 0x00
scr_seq_0100_D39R0102_0026:
	setvar VAR_TEMP_x4000, 10
	setvar VAR_TEMP_x4001, 21
	goto scr_seq_0100_D39R0102_0062

scr_seq_0100_D39R0102_0038:
	.byte 0x02, 0x00
scr_seq_0100_D39R0102_003A:
	setvar VAR_TEMP_x4000, 20
	setvar VAR_TEMP_x4001, 10
	goto scr_seq_0100_D39R0102_0062

scr_seq_0100_D39R0102_004C:
	.byte 0x02, 0x00
scr_seq_0100_D39R0102_004E:
	setvar VAR_TEMP_x4000, 21
	setvar VAR_TEMP_x4001, 23
	goto scr_seq_0100_D39R0102_0062

scr_seq_0100_D39R0102_0060:
	.byte 0x02, 0x00
scr_seq_0100_D39R0102_0062:
	scrcmd_609
	lockall
	setvar VAR_UNK_40AB, 1
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0100_D39R0102_0093
	apply_movement 255, scr_seq_0100_D39R0102_0118
	apply_movement 253, scr_seq_0100_D39R0102_0124
	goto scr_seq_0100_D39R0102_00E9

scr_seq_0100_D39R0102_0093:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0100_D39R0102_00B6
	apply_movement 255, scr_seq_0100_D39R0102_0134
	apply_movement 253, scr_seq_0100_D39R0102_0140
	goto scr_seq_0100_D39R0102_00E9

scr_seq_0100_D39R0102_00B6:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0100_D39R0102_00D9
	apply_movement 255, scr_seq_0100_D39R0102_0150
	apply_movement 253, scr_seq_0100_D39R0102_015C
	goto scr_seq_0100_D39R0102_00E9

scr_seq_0100_D39R0102_00D9:
	apply_movement 255, scr_seq_0100_D39R0102_016C
	apply_movement 253, scr_seq_0100_D39R0102_0178
scr_seq_0100_D39R0102_00E9:
	wait_movement
	play_se SEQ_SE_GS_RAKKA01
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_176 238, 0, 16384, 16385, 32780
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

scr_seq_0100_D39R0102_0117:
	.byte 0x00

scr_seq_0100_D39R0102_0118:
	step 40, 4
	step 69, 1
	step_end

scr_seq_0100_D39R0102_0124:
	step 62, 3
	step 20, 1
	step 69, 1
	step_end

scr_seq_0100_D39R0102_0134:
	step 41, 4
	step 69, 1
	step_end

scr_seq_0100_D39R0102_0140:
	step 62, 3
	step 21, 1
	step 69, 1
	step_end

scr_seq_0100_D39R0102_0150:
	step 42, 4
	step 69, 1
	step_end

scr_seq_0100_D39R0102_015C:
	step 62, 3
	step 22, 1
	step 69, 1
	step_end

scr_seq_0100_D39R0102_016C:
	step 43, 4
	step 69, 1
	step_end

scr_seq_0100_D39R0102_0178:
	step 62, 3
	step 23, 1
	step 69, 1
	step_end
	.balign 4, 0
