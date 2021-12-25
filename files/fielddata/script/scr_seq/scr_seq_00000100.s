#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000100_00000012 ; 000
	scrdef scr_seq_00000100_00000026 ; 001
	scrdef scr_seq_00000100_0000003A ; 002
	scrdef scr_seq_00000100_0000004E ; 003
	scrdef_end

scr_seq_00000100_00000012:
	setvar VAR_TEMP_x4000, 12
	setvar VAR_TEMP_x4001, 12
	goto scr_seq_00000100_00000062

scr_seq_00000100_00000024:
	.byte 0x02, 0x00
scr_seq_00000100_00000026:
	setvar VAR_TEMP_x4000, 10
	setvar VAR_TEMP_x4001, 21
	goto scr_seq_00000100_00000062

scr_seq_00000100_00000038:
	.byte 0x02, 0x00
scr_seq_00000100_0000003A:
	setvar VAR_TEMP_x4000, 20
	setvar VAR_TEMP_x4001, 10
	goto scr_seq_00000100_00000062

scr_seq_00000100_0000004C:
	.byte 0x02, 0x00
scr_seq_00000100_0000004E:
	setvar VAR_TEMP_x4000, 21
	setvar VAR_TEMP_x4001, 23
	goto scr_seq_00000100_00000062

scr_seq_00000100_00000060:
	.byte 0x02, 0x00
scr_seq_00000100_00000062:
	scrcmd_609
	lockall
	setvar VAR_UNK_40AB, 1
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000100_00000093
	apply_movement 255, scr_seq_00000100_00000118
	apply_movement 253, scr_seq_00000100_00000124
	goto scr_seq_00000100_000000E9

scr_seq_00000100_00000093:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000100_000000B6
	apply_movement 255, scr_seq_00000100_00000134
	apply_movement 253, scr_seq_00000100_00000140
	goto scr_seq_00000100_000000E9

scr_seq_00000100_000000B6:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000100_000000D9
	apply_movement 255, scr_seq_00000100_00000150
	apply_movement 253, scr_seq_00000100_0000015C
	goto scr_seq_00000100_000000E9

scr_seq_00000100_000000D9:
	apply_movement 255, scr_seq_00000100_0000016C
	apply_movement 253, scr_seq_00000100_00000178
scr_seq_00000100_000000E9:
	wait_movement
	play_se SEQ_SE_GS_RAKKA01
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 238, 0, 16384, 16385, 32780
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000100_00000117:
	.byte 0x00

scr_seq_00000100_00000118:
	.short 40, 4
	.short 69, 1
	.short 254, 0

scr_seq_00000100_00000124:
	.short 62, 3
	.short 20, 1
	.short 69, 1
	.short 254, 0

scr_seq_00000100_00000134:
	.short 41, 4
	.short 69, 1
	.short 254, 0

scr_seq_00000100_00000140:
	.short 62, 3
	.short 21, 1
	.short 69, 1
	.short 254, 0

scr_seq_00000100_00000150:
	.short 42, 4
	.short 69, 1
	.short 254, 0

scr_seq_00000100_0000015C:
	.short 62, 3
	.short 22, 1
	.short 69, 1
	.short 254, 0

scr_seq_00000100_0000016C:
	.short 43, 4
	.short 69, 1
	.short 254, 0

scr_seq_00000100_00000178:
	.short 62, 3
	.short 23, 1
	.short 69, 1
	.short 254, 0
	.balign 4, 0
