#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000048_00000071 ; 000
	scrdef scr_seq_00000048_00000082 ; 001
	scrdef scr_seq_00000048_00000168 ; 002
	scrdef scr_seq_00000048_00000016 ; 003
	scrdef scr_seq_00000048_00000320 ; 004
	scrdef_end

scr_seq_00000048_00000016:
	checkflag FLAG_UNK_189
	gotoif lt, scr_seq_00000048_00000027
	clearflag FLAG_UNK_189
	end

scr_seq_00000048_00000027:
	scrcmd_294 2, 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_00000048_00000065
	scrcmd_484 16384
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_00000048_0000006B
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, scr_seq_00000048_0000006B
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, scr_seq_00000048_0000006B
scr_seq_00000048_00000065:
	setflag FLAG_UNK_27E
	end

scr_seq_00000048_0000006B:
	clearflag FLAG_UNK_27E
	end

scr_seq_00000048_00000071:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000048_00000082:
	scrcmd_609
	lockall
	scrcmd_339 0, 25, 0, 30, 0
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000048_00000120
	apply_movement 0, scr_seq_00000048_00000144
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	wait 15, VAR_SPECIAL_x8005
	msgbox 1
	apply_movement 0, scr_seq_00000048_00000160
	wait_movement
	msgbox 2
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 321, 0, 7, 4, 3
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	scrcmd_344 2, 2
	msgbox 3
	scrcmd_527 4
	msgbox 5
	scrcmd_190 0
	msgbox 6
	scrcmd_078 1184
	scrcmd_079
	addvar VAR_UNK_403E, 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000048_0000011E:
	.byte 0x00, 0x00

scr_seq_00000048_00000120:
	.short 62, 1
	.short 15, 1
	.short 1, 1
	.short 75, 1
	.short 15, 1
	.short 13, 2
	.short 14, 2
	.short 0, 1
	.short 254, 0

scr_seq_00000048_00000144:
	.short 63, 4
	.short 16, 4
	.short 19, 1
	.short 16, 6
	.short 18, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000048_00000160:
	.short 1, 1
	.short 254, 0
scr_seq_00000048_00000168:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, 32780
	scrcmd_440 32780, 0
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000048_00000290
	scrcmd_618 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000048_000002A4
	scrcmd_438 2, 32780
	scrcmd_440 32780, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000048_000001E1
	apply_movement 255, scr_seq_00000048_000002B8
	apply_movement 1, scr_seq_00000048_00000304
	goto scr_seq_00000048_0000022F

scr_seq_00000048_000001E1:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000048_000001FC
	apply_movement 255, scr_seq_00000048_000002D0
	goto scr_seq_00000048_0000022F

scr_seq_00000048_000001FC:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000048_0000021F
	apply_movement 255, scr_seq_00000048_000002F0
	apply_movement 1, scr_seq_00000048_00000304
	goto scr_seq_00000048_0000022F

scr_seq_00000048_0000021F:
	apply_movement 255, scr_seq_00000048_000002DC
	apply_movement 1, scr_seq_00000048_00000304
scr_seq_00000048_0000022F:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000048_00000256
	apply_movement 253, scr_seq_00000048_00000310
	wait_movement
scr_seq_00000048_00000256:
	setflag FLAG_UNK_189
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_615 4
	lockall
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	clearflag FLAG_UNK_189
	scrcmd_438 2, 32780
	scrcmd_440 32780, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000048_00000290:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000048_000002A4:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 3
	waitbutton
	closemsg
	releaseall
	end


scr_seq_00000048_000002B8:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000048_000002D0:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000048_000002DC:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000048_000002F0:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000048_00000304:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000048_00000310:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_00000048_00000320:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, 32780
	scrcmd_440 32780, 0
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000048_00000290
	scrcmd_618 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000048_000002A4
	scrcmd_438 2, 32780
	scrcmd_440 32780, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000048_00000399
	apply_movement 255, scr_seq_00000048_000002B8
	apply_movement 2, scr_seq_00000048_00000304
	goto scr_seq_00000048_000003E7

scr_seq_00000048_00000399:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000048_000003B4
	apply_movement 255, scr_seq_00000048_000002D0
	goto scr_seq_00000048_000003E7

scr_seq_00000048_000003B4:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000048_000003D7
	apply_movement 255, scr_seq_00000048_000002F0
	apply_movement 2, scr_seq_00000048_00000304
	goto scr_seq_00000048_000003E7

scr_seq_00000048_000003D7:
	apply_movement 255, scr_seq_00000048_000002DC
	apply_movement 2, scr_seq_00000048_00000304
scr_seq_00000048_000003E7:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000048_0000040E
	apply_movement 253, scr_seq_00000048_00000310
	wait_movement
scr_seq_00000048_0000040E:
	setflag FLAG_UNK_189
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_615 4
	lockall
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	clearflag FLAG_UNK_189
	scrcmd_438 2, 32780
	scrcmd_440 32780, 2
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
