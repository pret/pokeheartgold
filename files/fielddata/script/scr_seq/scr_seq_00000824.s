#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000824_0000005C ; 000
	scrdef scr_seq_00000824_0000000E ; 001
	scrdef scr_seq_00000824_00000050 ; 002
	scrdef_end

scr_seq_00000824_0000000E:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000824_00000048
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	play_se SEQ_SE_DP_KI_GASYAN
	clearflag FLAG_UNK_210
	scrcmd_100 3
	setvar VAR_UNK_40C8, 1
	releaseall
	end

scr_seq_00000824_00000046:
	.byte 0x00, 0x00

scr_seq_00000824_00000048:
	.short 12, 6
	.short 254, 0
scr_seq_00000824_00000050:
	setflag FLAG_UNK_210
	setvar VAR_UNK_40C8, 0
	end

scr_seq_00000824_0000005C:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_105 16384, 16385
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_00000824_0000008B
	apply_movement 255, scr_seq_00000824_00000298
	goto scr_seq_00000824_000000AE

scr_seq_00000824_0000008B:
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_00000824_000000A6
	apply_movement 255, scr_seq_00000824_000002A8
	goto scr_seq_00000824_000000AE

scr_seq_00000824_000000A6:
	apply_movement 255, scr_seq_00000824_000002B0
scr_seq_00000824_000000AE:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 0, scr_seq_00000824_000002C0
	wait_movement
	scrcmd_190 0
	scrcmd_132 0, 1
	closemsg
	comparevartovalue VAR_UNK_4135, 8
	gotoif lt, scr_seq_00000824_000000E8
	scrcmd_213 701, 0, 0, 0
	goto scr_seq_00000824_000000F0

scr_seq_00000824_000000E8:
	scrcmd_213 244, 0, 0, 0
scr_seq_00000824_000000F0:
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000824_00000290
	scrcmd_190 0
	scrcmd_132 2, 3
	closemsg
	wait 10, VAR_SPECIAL_x8004
	play_se SEQ_SE_DP_KI_GASYAN
	scrcmd_101 4
	scrcmd_339 2, 6, 0, 20, 0
	scrcmd_339 1, 6, 0, 17, 0
	wait 30, VAR_SPECIAL_x8004
	scrcmd_081 0
	scrcmd_080 1107
	apply_movement 0, scr_seq_00000824_000002C8
	apply_movement 255, scr_seq_00000824_000002E0
	wait_movement
	scrcmd_729 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000824_000001A1
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_00000824_0000017C
	apply_movement 253, scr_seq_00000824_000002F8
	goto scr_seq_00000824_0000019F

scr_seq_00000824_0000017C:
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_00000824_00000197
	apply_movement 253, scr_seq_00000824_00000308
	goto scr_seq_00000824_0000019F

scr_seq_00000824_00000197:
	apply_movement 253, scr_seq_00000824_00000320
scr_seq_00000824_0000019F:
	wait_movement
scr_seq_00000824_000001A1:
	apply_movement 2, scr_seq_00000824_00000338
	wait_movement
	msgbox 5
	closemsg
	apply_movement 1, scr_seq_00000824_00000348
	apply_movement 2, scr_seq_00000824_00000350
	wait_movement
	scrcmd_190 0
	scrcmd_132 6, 7
	closemsg
	apply_movement 2, scr_seq_00000824_00000360
	wait_movement
	msgbox 8
	apply_movement 0, scr_seq_00000824_00000368
	apply_movement 255, scr_seq_00000824_00000378
	wait_movement
	scrcmd_190 0
	scrcmd_132 9, 10
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 0, scr_seq_00000824_00000384
	apply_movement 255, scr_seq_00000824_00000394
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000824_00000234
	apply_movement 253, scr_seq_00000824_000003A4
	wait_movement
scr_seq_00000824_00000234:
	play_se SEQ_SE_DP_KAIDAN2
	apply_movement 2, scr_seq_00000824_000003AC
	wait_movement
	msgbox 11
	apply_movement 2, scr_seq_00000824_000003BC
	wait_movement
	scrcmd_049
	closemsg
	checkflag FLAG_UNK_964
	gotoif eq, scr_seq_00000824_00000268
	clearflag FLAG_UNK_251
	setvar VAR_UNK_411A, 1
scr_seq_00000824_00000268:
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 306, 0, 6, 22, 0
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000824_00000290:
	scrcmd_219
	releaseall
	end

scr_seq_00000824_00000296:
	.byte 0x00, 0x00

scr_seq_00000824_00000298:
	.short 12, 2
	.short 15, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000824_000002A8:
	.short 12, 2
	.short 254, 0

scr_seq_00000824_000002B0:
	.short 12, 2
	.short 14, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000824_000002C0:
	.short 33, 1
	.short 254, 0

scr_seq_00000824_000002C8:
	.short 1, 1
	.short 75, 0
	.short 71, 1
	.short 15, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000824_000002E0:
	.short 1, 1
	.short 63, 4
	.short 71, 1
	.short 12, 2
	.short 72, 1
	.short 254, 0

scr_seq_00000824_000002F8:
	.short 16, 3
	.short 19, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000824_00000308:
	.short 16, 2
	.short 18, 1
	.short 16, 2
	.short 19, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000824_00000320:
	.short 16, 1
	.short 19, 1
	.short 16, 2
	.short 18, 2
	.short 33, 1
	.short 254, 0

scr_seq_00000824_00000338:
	.short 16, 12
	.short 1, 1
	.short 37, 3
	.short 254, 0

scr_seq_00000824_00000348:
	.short 12, 8
	.short 254, 0

scr_seq_00000824_00000350:
	.short 63, 6
	.short 14, 1
	.short 0, 1
	.short 254, 0

scr_seq_00000824_00000360:
	.short 36, 4
	.short 254, 0

scr_seq_00000824_00000368:
	.short 12, 2
	.short 14, 1
	.short 1, 1
	.short 254, 0

scr_seq_00000824_00000378:
	.short 63, 3
	.short 0, 1
	.short 254, 0

scr_seq_00000824_00000384:
	.short 62, 1
	.short 12, 2
	.short 69, 1
	.short 254, 0

scr_seq_00000824_00000394:
	.short 12, 2
	.short 12, 2
	.short 69, 1
	.short 254, 0

scr_seq_00000824_000003A4:
	.short 69, 1
	.short 254, 0

scr_seq_00000824_000003AC:
	.short 16, 4
	.short 75, 0
	.short 63, 2
	.short 254, 0

scr_seq_00000824_000003BC:
	.short 19, 1
	.short 18, 2
	.short 19, 2
	.short 18, 1
	.short 0, 1
	.short 254, 0
	.balign 4, 0
