#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000127_00000062 ; 000
	scrdef scr_seq_00000127_00000075 ; 001
	scrdef scr_seq_00000127_0000009E ; 002
	scrdef scr_seq_00000127_000003B9 ; 003
	scrdef scr_seq_00000127_00000454 ; 004
	scrdef scr_seq_00000127_00000485 ; 005
	scrdef scr_seq_00000127_000004AE ; 006
	scrdef scr_seq_00000127_00000041 ; 007
	scrdef scr_seq_00000127_00000026 ; 008
	scrdef_end

scr_seq_00000127_00000026:
	checkflag FLAG_UNK_0F1
	gotoif eq, scr_seq_00000127_00000039
	setvar VAR_TEMP_x400D, 0
	end

scr_seq_00000127_00000039:
	setvar VAR_TEMP_x400D, 1
	end

scr_seq_00000127_00000041:
	comparevartovalue VAR_TEMP_x400D, 1
	gotoif ne, scr_seq_00000127_00000060
	show_person_at 0, 6, 1, 3, 3
	setvar VAR_TEMP_x400D, 0
scr_seq_00000127_00000060:
	end

scr_seq_00000127_00000062:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000127_00000075:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0F1
	gotoif eq, scr_seq_00000127_00000093
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000127_00000093:
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000127_0000009E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 3
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000127_000003AC
scr_seq_00000127_000000BC:
	msgbox 6
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 308, 255, 0
	scrcmd_751 309, 255, 1
	scrcmd_751 310, 255, 2
	scrcmd_751 311, 255, 3
	scrcmd_751 312, 255, 4
	scrcmd_751 135, 255, 5
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_00000127_000003AC
	msgbox 7
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000127_0000014D
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000127_00000187
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000127_000001C1
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000127_000001FB
	goto scr_seq_00000127_00000235

scr_seq_00000127_0000014B:
	.byte 0x02, 0x00
scr_seq_00000127_0000014D:
	setvar VAR_TEMP_x4007, 0
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 298, 255, 0
	scrcmd_751 299, 255, 1
	scrcmd_751 304, 255, 6
	scrcmd_751 13, 255, 10
	scrcmd_752
	goto scr_seq_00000127_0000026F

scr_seq_00000127_00000185:
	.byte 0x02, 0x00
scr_seq_00000127_00000187:
	setvar VAR_TEMP_x4007, 1
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 301, 255, 3
	scrcmd_751 300, 255, 2
	scrcmd_751 307, 255, 9
	scrcmd_751 13, 255, 10
	scrcmd_752
	goto scr_seq_00000127_0000026F

scr_seq_00000127_000001BF:
	.byte 0x02
	.byte 0x00
scr_seq_00000127_000001C1:
	setvar VAR_TEMP_x4007, 2
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 306, 255, 8
	scrcmd_751 307, 255, 9
	scrcmd_751 299, 255, 1
	scrcmd_751 13, 255, 10
	scrcmd_752
	goto scr_seq_00000127_0000026F

scr_seq_00000127_000001F9:
	.byte 0x02, 0x00
scr_seq_00000127_000001FB:
	setvar VAR_TEMP_x4007, 3
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 305, 255, 7
	scrcmd_751 304, 255, 6
	scrcmd_751 301, 255, 3
	scrcmd_751 13, 255, 10
	scrcmd_752
	goto scr_seq_00000127_0000026F

scr_seq_00000127_00000233:
	.byte 0x02, 0x00
scr_seq_00000127_00000235:
	setvar VAR_TEMP_x4007, 4
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 303, 255, 5
	scrcmd_751 302, 255, 4
	scrcmd_751 298, 255, 0
	scrcmd_751 13, 255, 10
	scrcmd_752
	goto scr_seq_00000127_0000026F

scr_seq_00000127_0000026D:
	.byte 0x02, 0x00
scr_seq_00000127_0000026F:
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000127_000002FF
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000127_0000030A
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000127_00000315
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000127_00000320
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000127_0000032B
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_00000127_00000336
	comparevartovalue VAR_SPECIAL_x8008, 6
	gotoif eq, scr_seq_00000127_00000341
	comparevartovalue VAR_SPECIAL_x8008, 7
	gotoif eq, scr_seq_00000127_0000034C
	comparevartovalue VAR_SPECIAL_x8008, 8
	gotoif eq, scr_seq_00000127_00000357
	comparevartovalue VAR_SPECIAL_x8008, 9
	gotoif eq, scr_seq_00000127_00000362
	goto scr_seq_00000127_000000BC

scr_seq_00000127_000002FD:
	.byte 0x02, 0x00
scr_seq_00000127_000002FF:
	msgbox 8
	goto scr_seq_00000127_0000036D

scr_seq_00000127_00000308:
	.byte 0x02, 0x00
scr_seq_00000127_0000030A:
	msgbox 9
	goto scr_seq_00000127_0000036D

scr_seq_00000127_00000313:
	.byte 0x02, 0x00
scr_seq_00000127_00000315:
	msgbox 10
	goto scr_seq_00000127_0000036D

scr_seq_00000127_0000031E:
	.byte 0x02, 0x00
scr_seq_00000127_00000320:
	msgbox 11
	goto scr_seq_00000127_0000036D

scr_seq_00000127_00000329:
	.byte 0x02, 0x00
scr_seq_00000127_0000032B:
	msgbox 12
	goto scr_seq_00000127_0000036D

scr_seq_00000127_00000334:
	.byte 0x02, 0x00
scr_seq_00000127_00000336:
	msgbox 13
	goto scr_seq_00000127_0000036D

scr_seq_00000127_0000033F:
	.byte 0x02
	.byte 0x00
scr_seq_00000127_00000341:
	msgbox 14
	goto scr_seq_00000127_0000036D

scr_seq_00000127_0000034A:
	.byte 0x02, 0x00
scr_seq_00000127_0000034C:
	msgbox 15
	goto scr_seq_00000127_0000036D

scr_seq_00000127_00000355:
	.byte 0x02, 0x00
scr_seq_00000127_00000357:
	msgbox 16
	goto scr_seq_00000127_0000036D

scr_seq_00000127_00000360:
	.byte 0x02, 0x00
scr_seq_00000127_00000362:
	msgbox 17
	goto scr_seq_00000127_0000036D

scr_seq_00000127_0000036B:
	.byte 0x02, 0x00
scr_seq_00000127_0000036D:
	msgbox 7
	comparevartovalue VAR_TEMP_x4007, 0
	gotoif eq, scr_seq_00000127_0000014D
	comparevartovalue VAR_TEMP_x4007, 1
	gotoif eq, scr_seq_00000127_00000187
	comparevartovalue VAR_TEMP_x4007, 2
	gotoif eq, scr_seq_00000127_000001C1
	comparevartovalue VAR_TEMP_x4007, 3
	gotoif eq, scr_seq_00000127_000001FB
	goto scr_seq_00000127_00000235

scr_seq_00000127_000003AA:
	.byte 0x02, 0x00
scr_seq_00000127_000003AC:
	msgbox 18
	waitbutton
	closemsg
	scrcmd_747
	releaseall
	end

scr_seq_00000127_000003B9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000127_000003E0
	apply_movement 3, scr_seq_00000127_0000043C
	goto scr_seq_00000127_0000041E

scr_seq_00000127_000003E0:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000127_000003FB
	apply_movement 3, scr_seq_00000127_00000434
	goto scr_seq_00000127_0000041E

scr_seq_00000127_000003FB:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000127_00000416
	apply_movement 3, scr_seq_00000127_0000044C
	goto scr_seq_00000127_0000041E

scr_seq_00000127_00000416:
	apply_movement 3, scr_seq_00000127_00000444
scr_seq_00000127_0000041E:
	wait_movement
	scrcmd_076 85, 0
	msgbox 24
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000127_00000433:
	.byte 0x00

scr_seq_00000127_00000434:
	.short 48, 2
	.short 254, 0

scr_seq_00000127_0000043C:
	.short 49, 2
	.short 254, 0

scr_seq_00000127_00000444:
	.short 50, 2
	.short 254, 0

scr_seq_00000127_0000044C:
	.short 51, 2
	.short 254, 0
scr_seq_00000127_00000454:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_190 0
	msgbox 23
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_712 2
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000127_00000485:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_2D8
	gotoif lt, scr_seq_00000127_000004A3
	msgbox 19
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000127_000004A3:
	msgbox 20
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000127_000004AE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_2D9
	gotoif lt, scr_seq_00000127_000004CC
	msgbox 21
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000127_000004CC:
	msgbox 22
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
