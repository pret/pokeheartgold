#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000245_0000000E ; 000
	scrdef scr_seq_00000245_00000138 ; 001
	scrdef scr_seq_00000245_00000088 ; 002
	scrdef_end

scr_seq_00000245_0000000E:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_UNK_4118, 1
	gotoif ne, scr_seq_00000245_0000002D
	clearflag FLAG_UNK_1C4
	setflag FLAG_UNK_1C3
	goto scr_seq_00000245_00000086

scr_seq_00000245_0000002D:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_00000245_00000048
	clearflag FLAG_UNK_1C4
	setflag FLAG_UNK_1C3
	goto scr_seq_00000245_00000086

scr_seq_00000245_00000048:
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, scr_seq_00000245_00000063
	clearflag FLAG_UNK_1C4
	setflag FLAG_UNK_1C3
	goto scr_seq_00000245_00000086

scr_seq_00000245_00000063:
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_00000245_0000007E
	clearflag FLAG_UNK_1C4
	setflag FLAG_UNK_1C3
	goto scr_seq_00000245_00000086

scr_seq_00000245_0000007E:
	clearflag FLAG_UNK_1C3
	setflag FLAG_UNK_1C4
scr_seq_00000245_00000086:
	end

scr_seq_00000245_00000088:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_00000245_00000120
	wait_movement
	callstd 10406
	comparevartovalue VAR_UNK_4118, 1
	gotoif ne, scr_seq_00000245_0000011A
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000245_00000128
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	play_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 487, 0, 75, 39, 2
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	scrcmd_098 253
	scrcmd_596 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000245_0000010A
	scrcmd_606
	goto scr_seq_00000245_0000010C

scr_seq_00000245_0000010A:
	scrcmd_607
scr_seq_00000245_0000010C:
	apply_movement 253, scr_seq_00000245_00000130
	wait_movement
	scrcmd_099 253
scr_seq_00000245_0000011A:
	releaseall
	end

scr_seq_00000245_0000011E:
	.byte 0x00, 0x00

scr_seq_00000245_00000120:
	.short 0, 1
	.short 254, 0

scr_seq_00000245_00000128:
	.short 34, 1
	.short 254, 0

scr_seq_00000245_00000130:
	.short 2, 1
	.short 254, 0
scr_seq_00000245_00000138:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 10405
	comparevartovalue VAR_UNK_4118, 1
	gotoif ne, scr_seq_00000245_00000231
	checkflag FLAG_UNK_1C4
	gotoif eq, scr_seq_00000245_000001BA
	scrcmd_386 VAR_SPECIAL_x800C
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000245_00000185
	apply_movement 255, scr_seq_00000245_00000238
	goto scr_seq_00000245_000001A8

scr_seq_00000245_00000185:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000245_000001A0
	apply_movement 255, scr_seq_00000245_00000240
	goto scr_seq_00000245_000001A8

scr_seq_00000245_000001A0:
	apply_movement 255, scr_seq_00000245_0000024C
scr_seq_00000245_000001A8:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	goto scr_seq_00000245_000001DC

scr_seq_00000245_000001BA:
	scrcmd_386 VAR_SPECIAL_x800C
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000245_0000025C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
scr_seq_00000245_000001DC:
	play_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 487, 0, 75, 39, 2
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	scrcmd_098 253
	scrcmd_596 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000245_00000221
	scrcmd_606
	goto scr_seq_00000245_00000223

scr_seq_00000245_00000221:
	scrcmd_607
scr_seq_00000245_00000223:
	apply_movement 253, scr_seq_00000245_00000130
	wait_movement
	scrcmd_099 253
scr_seq_00000245_00000231:
	releaseall
	end

scr_seq_00000245_00000235:
	.byte 0x00, 0x00, 0x00

scr_seq_00000245_00000238:
	.short 2, 1
	.short 254, 0

scr_seq_00000245_00000240:
	.short 13, 1
	.short 14, 1
	.short 254, 0

scr_seq_00000245_0000024C:
	.short 15, 1
	.short 13, 2
	.short 14, 2
	.short 254, 0

scr_seq_00000245_0000025C:
	.short 13, 1
	.short 14, 4
	.short 254, 0
	.balign 4, 0
