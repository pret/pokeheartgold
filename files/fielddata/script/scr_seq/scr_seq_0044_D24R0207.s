#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0044_000E ; 000
	scrdef scr_seq_0044_004F ; 001
	scrdef scr_seq_0044_0070 ; 002
	scrdef_end

scr_seq_0044_000E:
	play_se SEQ_SE_GS_RAKKA01
	apply_movement 255, scr_seq_0044_0068
	scrcmd_374 255
	wait_movement
	scrcmd_561 0, 1, 1, 8
	play_se SEQ_SE_DP_SUTYA2
	setvar VAR_UNK_40D5, 0
	comparevartovalue VAR_UNK_40EF, 1
	gotoif eq, scr_seq_0044_004D
	setvar VAR_UNK_40EF, 1
	addvar VAR_UNK_40F1, 1
scr_seq_0044_004D:
	end

scr_seq_0044_004F:
	comparevartovalue VAR_UNK_40D5, 1
	gotoif ne, scr_seq_0044_0064
	scrcmd_490 16597
	scrcmd_375 255
scr_seq_0044_0064:
	end

scr_seq_0044_0066:
	.byte 0x00, 0x00

scr_seq_0044_0068:
	.short 68, 1
	.short 254, 0
scr_seq_0044_0070:
	scrcmd_609
	lockall
	setvar VAR_UNK_40CE, 1
	setflag FLAG_UNK_111
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0044_009E
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0044_0103
	end

scr_seq_0044_009E:
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0044_00BD
	apply_movement 255, scr_seq_0044_021C
	goto scr_seq_0044_00FB

scr_seq_0044_00BD:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0044_00D8
	apply_movement 255, scr_seq_0044_0238
	goto scr_seq_0044_00FB

scr_seq_0044_00D8:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0044_00F3
	apply_movement 255, scr_seq_0044_0254
	goto scr_seq_0044_00FB

scr_seq_0044_00F3:
	apply_movement 255, scr_seq_0044_0270
scr_seq_0044_00FB:
	wait_movement
	goto scr_seq_0044_0182

scr_seq_0044_0103:
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0044_012A
	apply_movement 255, scr_seq_0044_021C
	apply_movement 253, scr_seq_0044_0228
	goto scr_seq_0044_0180

scr_seq_0044_012A:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0044_014D
	apply_movement 255, scr_seq_0044_0238
	apply_movement 253, scr_seq_0044_0244
	goto scr_seq_0044_0180

scr_seq_0044_014D:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0044_0170
	apply_movement 255, scr_seq_0044_0254
	apply_movement 253, scr_seq_0044_0260
	goto scr_seq_0044_0180

scr_seq_0044_0170:
	apply_movement 255, scr_seq_0044_0270
	apply_movement 253, scr_seq_0044_027C
scr_seq_0044_0180:
	wait_movement
scr_seq_0044_0182:
	play_se SEQ_SE_GS_RAKKA01
	comparevartovalue VAR_UNK_403E, 7
	gotoif ge, scr_seq_0044_01C8
	comparevartovalue VAR_UNK_403E, 6
	gotoif eq, scr_seq_0044_01F2
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 315, 0, 5, 42, 32780
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0044_01C4:
	releaseall
	end

scr_seq_0044_01C8:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 492, 0, 5, 42, 32780
	fade_screen 6, 1, 1, 0
	wait_fade
	goto scr_seq_0044_01C4

scr_seq_0044_01F2:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 490, 0, 5, 42, 32780
	fade_screen 6, 1, 1, 0
	wait_fade
	goto scr_seq_0044_01C4


scr_seq_0044_021C:
	.short 40, 4
	.short 69, 1
	.short 254, 0

scr_seq_0044_0228:
	.short 62, 3
	.short 20, 1
	.short 69, 1
	.short 254, 0

scr_seq_0044_0238:
	.short 41, 4
	.short 69, 1
	.short 254, 0

scr_seq_0044_0244:
	.short 62, 3
	.short 21, 1
	.short 69, 1
	.short 254, 0

scr_seq_0044_0254:
	.short 42, 4
	.short 69, 1
	.short 254, 0

scr_seq_0044_0260:
	.short 62, 3
	.short 22, 1
	.short 69, 1
	.short 254, 0

scr_seq_0044_0270:
	.short 43, 4
	.short 69, 1
	.short 254, 0

scr_seq_0044_027C:
	.short 62, 3
	.short 23, 1
	.short 69, 1
	.short 254, 0
	.balign 4, 0
