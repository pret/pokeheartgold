#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0245_R36R0201_000E ; 000
	scrdef scr_seq_0245_R36R0201_0138 ; 001
	scrdef scr_seq_0245_R36R0201_0088 ; 002
	scrdef_end

scr_seq_0245_R36R0201_000E:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_UNK_4118, 1
	gotoif ne, scr_seq_0245_R36R0201_002D
	clearflag FLAG_UNK_1C4
	setflag FLAG_UNK_1C3
	goto scr_seq_0245_R36R0201_0086

scr_seq_0245_R36R0201_002D:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_0245_R36R0201_0048
	clearflag FLAG_UNK_1C4
	setflag FLAG_UNK_1C3
	goto scr_seq_0245_R36R0201_0086

scr_seq_0245_R36R0201_0048:
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, scr_seq_0245_R36R0201_0063
	clearflag FLAG_UNK_1C4
	setflag FLAG_UNK_1C3
	goto scr_seq_0245_R36R0201_0086

scr_seq_0245_R36R0201_0063:
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_0245_R36R0201_007E
	clearflag FLAG_UNK_1C4
	setflag FLAG_UNK_1C3
	goto scr_seq_0245_R36R0201_0086

scr_seq_0245_R36R0201_007E:
	clearflag FLAG_UNK_1C3
	setflag FLAG_UNK_1C4
scr_seq_0245_R36R0201_0086:
	end

scr_seq_0245_R36R0201_0088:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_0245_R36R0201_0120
	wait_movement
	callstd 10406
	comparevartovalue VAR_UNK_4118, 1
	gotoif ne, scr_seq_0245_R36R0201_011A
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0245_R36R0201_0128
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 487, 0, 75, 39, 2
	fade_screen 6, 1, 1, 0
	wait_fade
	scrcmd_098 253
	scrcmd_596 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0245_R36R0201_010A
	scrcmd_606
	goto scr_seq_0245_R36R0201_010C

scr_seq_0245_R36R0201_010A:
	scrcmd_607
scr_seq_0245_R36R0201_010C:
	apply_movement 253, scr_seq_0245_R36R0201_0130
	wait_movement
	scrcmd_099 253
scr_seq_0245_R36R0201_011A:
	releaseall
	end

scr_seq_0245_R36R0201_011E:
	.byte 0x00, 0x00

scr_seq_0245_R36R0201_0120:
	.short 0, 1
	.short 254, 0

scr_seq_0245_R36R0201_0128:
	.short 34, 1
	.short 254, 0

scr_seq_0245_R36R0201_0130:
	.short 2, 1
	.short 254, 0
scr_seq_0245_R36R0201_0138:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 10405
	comparevartovalue VAR_UNK_4118, 1
	gotoif ne, scr_seq_0245_R36R0201_0231
	checkflag FLAG_UNK_1C4
	gotoif TRUE, scr_seq_0245_R36R0201_01BA
	scrcmd_386 VAR_SPECIAL_x800C
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0245_R36R0201_0185
	apply_movement 255, scr_seq_0245_R36R0201_0238
	goto scr_seq_0245_R36R0201_01A8

scr_seq_0245_R36R0201_0185:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0245_R36R0201_01A0
	apply_movement 255, scr_seq_0245_R36R0201_0240
	goto scr_seq_0245_R36R0201_01A8

scr_seq_0245_R36R0201_01A0:
	apply_movement 255, scr_seq_0245_R36R0201_024C
scr_seq_0245_R36R0201_01A8:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	goto scr_seq_0245_R36R0201_01DC

scr_seq_0245_R36R0201_01BA:
	scrcmd_386 VAR_SPECIAL_x800C
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0245_R36R0201_025C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
scr_seq_0245_R36R0201_01DC:
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 487, 0, 75, 39, 2
	fade_screen 6, 1, 1, 0
	wait_fade
	scrcmd_098 253
	scrcmd_596 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0245_R36R0201_0221
	scrcmd_606
	goto scr_seq_0245_R36R0201_0223

scr_seq_0245_R36R0201_0221:
	scrcmd_607
scr_seq_0245_R36R0201_0223:
	apply_movement 253, scr_seq_0245_R36R0201_0130
	wait_movement
	scrcmd_099 253
scr_seq_0245_R36R0201_0231:
	releaseall
	end

scr_seq_0245_R36R0201_0235:
	.byte 0x00, 0x00, 0x00

scr_seq_0245_R36R0201_0238:
	.short 2, 1
	.short 254, 0

scr_seq_0245_R36R0201_0240:
	.short 13, 1
	.short 14, 1
	.short 254, 0

scr_seq_0245_R36R0201_024C:
	.short 15, 1
	.short 13, 2
	.short 14, 2
	.short 254, 0

scr_seq_0245_R36R0201_025C:
	.short 13, 1
	.short 14, 4
	.short 254, 0
	.balign 4, 0
