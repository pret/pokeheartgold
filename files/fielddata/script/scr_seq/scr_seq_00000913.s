#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000913_00000162 ; 000
	scrdef scr_seq_00000913_00000390 ; 001
	scrdef scr_seq_00000913_0000043C ; 002
	scrdef scr_seq_00000913_000004D0 ; 003
	scrdef scr_seq_00000913_00000512 ; 004
	scrdef scr_seq_00000913_00000554 ; 005
	scrdef scr_seq_00000913_0000059B ; 006
	scrdef scr_seq_00000913_00000022 ; 007
	scrdef_end

scr_seq_00000913_00000022:
	scrcmd_142 38, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000913_0000015C
	checkflag FLAG_UNK_964
	gotoif lt, scr_seq_00000913_0000015A
	clearflag FLAG_UNK_1D9
	scrcmd_147 38, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000913_0000007A
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 13
	gotoif ne, scr_seq_00000913_00000072
	setflag FLAG_UNK_1D9
	goto scr_seq_00000913_00000078

scr_seq_00000913_00000072:
	goto scr_seq_00000913_0000009D

scr_seq_00000913_00000078:
	end

scr_seq_00000913_0000007A:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 12
	gotoif ne, scr_seq_00000913_00000095
	setflag FLAG_UNK_1D9
	goto scr_seq_00000913_0000009B

scr_seq_00000913_00000095:
	goto scr_seq_00000913_0000009D

scr_seq_00000913_0000009B:
	end

scr_seq_00000913_0000009D:
	scrcmd_147 28, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000913_0000015A
	scrcmd_294 15, 16386
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif eq, scr_seq_00000913_000000CB
	goto scr_seq_00000913_0000015A

scr_seq_00000913_000000C9:
	.byte 0x02, 0x00
scr_seq_00000913_000000CB:
	scrcmd_484 16384
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_00000913_000000E8
	goto scr_seq_00000913_00000109

scr_seq_00000913_000000E2:
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
scr_seq_00000913_000000E8:
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_00000913_00000101
	goto scr_seq_00000913_00000109

scr_seq_00000913_000000FB:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00
	.byte 0x00
scr_seq_00000913_00000101:
	goto scr_seq_00000913_0000015A

scr_seq_00000913_00000107:
	.byte 0x02, 0x00
scr_seq_00000913_00000109:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 14
	gotoif ne, scr_seq_00000913_00000124
	setflag FLAG_UNK_1D9
	goto scr_seq_00000913_00000158

scr_seq_00000913_00000124:
	comparevartovalue VAR_TEMP_x4000, 15
	gotoif ne, scr_seq_00000913_0000013B
	setflag FLAG_UNK_1D9
	goto scr_seq_00000913_00000158

scr_seq_00000913_0000013B:
	comparevartovalue VAR_TEMP_x4000, 16
	gotoif ne, scr_seq_00000913_00000152
	setflag FLAG_UNK_1D9
	goto scr_seq_00000913_00000158

scr_seq_00000913_00000152:
	goto scr_seq_00000913_0000015A

scr_seq_00000913_00000158:
	end

scr_seq_00000913_0000015A:
	end

scr_seq_00000913_0000015C:
	setflag FLAG_UNK_1D9
	end

scr_seq_00000913_00000162:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 5, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000913_0000020C
	msgbox 0
	closemsg
	scrcmd_213 33, 0, 0, 0
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000913_00000235
	msgbox 1
	scrcmd_190 0
	msgbox 2
	scrcmd_078 1189
	scrcmd_079
	scrcmd_295 5
	addvar VAR_UNK_4134, 1
	scrcmd_515 22
	comparevartovalue VAR_UNK_4134, 3
	gotoif ne, scr_seq_00000913_000001CB
	setvar VAR_UNK_4077, 1
scr_seq_00000913_000001CB:
	msgbox 3
scr_seq_00000913_000001CE:
	setvar VAR_SPECIAL_x8004, 350
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000913_00000202
	callstd 2033
	msgbox 5
	waitbutton
	closemsg
	releaseall
	setflag FLAG_UNK_0C2
	end

scr_seq_00000913_00000202:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000913_0000020C:
	checkflag FLAG_UNK_0C2
	gotoif lt, scr_seq_00000913_000001CE
	scrcmd_147 38, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000913_0000023B
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000913_00000235:
	scrcmd_219
	releaseall
	end

scr_seq_00000913_0000023B:
	checkflag FLAG_UNK_166
	gotoif eq, scr_seq_00000913_0000036F
	comparevartovalue VAR_TEMP_x4000, 77
	gotoif eq, scr_seq_00000913_00000264
	setvar VAR_TEMP_x4000, 77
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000913_00000264:
	msgbox 8
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000913_0000034B
	msgbox 9
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_566
	scrcmd_351 32780
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000913_0000034B
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_354 32772, 16387
	scrcmd_827 32772, 16388
	comparevartovalue VAR_TEMP_x4003, 0
	gotoif eq, scr_seq_00000913_00000356
	comparevartovalue VAR_TEMP_x4004, 0
	gotoif eq, scr_seq_00000913_0000030E
	comparevartovalue VAR_TEMP_x4003, 487
	gotoif eq, scr_seq_00000913_00000364
	comparevartovalue VAR_TEMP_x4003, 492
	gotoif eq, scr_seq_00000913_00000364
	comparevartovalue VAR_TEMP_x4003, 172
	gotoif eq, scr_seq_00000913_00000364
	comparevartovalue VAR_TEMP_x4003, 479
	gotoif eq, scr_seq_00000913_00000364
scr_seq_00000913_0000030E:
	scrcmd_199 1, VAR_SPECIAL_x8004
	msgbox 13
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000913_0000034B
	closemsg
	scrcmd_470 5
	scrcmd_473 32772
	scrcmd_474
	setflag FLAG_UNK_166
	setvar VAR_TEMP_x4000, 55
	msgbox 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000913_0000034B:
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000913_00000356:
	scrcmd_190 0
	msgbox 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000913_00000364:
	msgbox 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000913_0000036F:
	comparevartovalue VAR_TEMP_x4000, 55
	gotoif ne, scr_seq_00000913_00000385
	msgbox 11
	goto scr_seq_00000913_00000388

scr_seq_00000913_00000385:
	msgbox 12
scr_seq_00000913_00000388:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000913_00000390:
	scrcmd_609
	lockall
	apply_movement 2, scr_seq_00000913_0000040C
	wait_movement
	scrcmd_105 16384, 16385
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_00000913_000003BF
	apply_movement 2, scr_seq_00000913_00000414
	goto scr_seq_00000913_000003E2

scr_seq_00000913_000003BF:
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_00000913_000003DA
	apply_movement 2, scr_seq_00000913_0000041C
	goto scr_seq_00000913_000003E2

scr_seq_00000913_000003DA:
	apply_movement 2, scr_seq_00000913_00000424
scr_seq_00000913_000003E2:
	apply_movement 255, scr_seq_00000913_0000042C
	wait_movement
	msgbox 19
	waitbutton
	closemsg
	releaseall
	comparevartovalue VAR_UNK_410E, 1
	gotoif ne, scr_seq_00000913_00000408
	setvar VAR_UNK_410E, 2
scr_seq_00000913_00000408:
	end

scr_seq_00000913_0000040A:
	.byte 0x00, 0x00

scr_seq_00000913_0000040C:
	.short 75, 1
	.short 254, 0

scr_seq_00000913_00000414:
	.short 15, 1
	.short 254, 0

scr_seq_00000913_0000041C:
	.short 15, 2
	.short 254, 0

scr_seq_00000913_00000424:
	.short 15, 3
	.short 254, 0

scr_seq_00000913_0000042C:
	.short 34, 1
	.short 254, 0

scr_seq_00000913_00000434:
	.short 35, 1
	.short 254, 0
scr_seq_00000913_0000043C:
	scrcmd_609
	lockall
	apply_movement 1, scr_seq_00000913_0000040C
	wait_movement
	scrcmd_105 16384, 16385
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_00000913_0000046B
	apply_movement 1, scr_seq_00000913_000004B8
	goto scr_seq_00000913_0000048E

scr_seq_00000913_0000046B:
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_00000913_00000486
	apply_movement 1, scr_seq_00000913_000004C0
	goto scr_seq_00000913_0000048E

scr_seq_00000913_00000486:
	apply_movement 1, scr_seq_00000913_000004C8
scr_seq_00000913_0000048E:
	apply_movement 255, scr_seq_00000913_00000434
	wait_movement
	msgbox 21
	waitbutton
	closemsg
	releaseall
	comparevartovalue VAR_UNK_410E, 2
	gotoif ne, scr_seq_00000913_000004B4
	setvar VAR_UNK_410E, 3
scr_seq_00000913_000004B4:
	end

scr_seq_00000913_000004B6:
	.byte 0x00, 0x00

scr_seq_00000913_000004B8:
	.short 14, 3
	.short 254, 0

scr_seq_00000913_000004C0:
	.short 14, 2
	.short 254, 0

scr_seq_00000913_000004C8:
	.short 14, 1
	.short 254, 0
scr_seq_00000913_000004D0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 5, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000913_000004F4
	msgbox 20
	goto scr_seq_00000913_000004F7

scr_seq_00000913_000004F4:
	msgbox 19
scr_seq_00000913_000004F7:
	waitbutton
	closemsg
	releaseall
	comparevartovalue VAR_UNK_410E, 1
	gotoif ne, scr_seq_00000913_00000510
	setvar VAR_UNK_410E, 2
scr_seq_00000913_00000510:
	end

scr_seq_00000913_00000512:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 5, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000913_00000536
	msgbox 22
	goto scr_seq_00000913_00000539

scr_seq_00000913_00000536:
	msgbox 21
scr_seq_00000913_00000539:
	waitbutton
	closemsg
	releaseall
	comparevartovalue VAR_UNK_410E, 2
	gotoif ne, scr_seq_00000913_00000552
	setvar VAR_UNK_410E, 3
scr_seq_00000913_00000552:
	end

scr_seq_00000913_00000554:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 5, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000913_00000590
	comparevartovalue VAR_UNK_410E, 0
	gotoif ne, scr_seq_00000913_00000585
	msgbox 16
	goto scr_seq_00000913_00000588

scr_seq_00000913_00000585:
	msgbox 17
scr_seq_00000913_00000588:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000913_00000590:
	msgbox 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000913_0000059B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 5, 32780
	scrcmd_190 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000913_000005C2
	msgbox 23
	goto scr_seq_00000913_000005C5

scr_seq_00000913_000005C2:
	msgbox 24
scr_seq_00000913_000005C5:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
