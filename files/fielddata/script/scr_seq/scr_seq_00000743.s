#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000743_0000006B ; 000
	scrdef scr_seq_00000743_0000014D ; 001
	scrdef scr_seq_00000743_00000016 ; 002
	scrdef scr_seq_00000743_00000191 ; 003
	scrdef scr_seq_00000743_00000480 ; 004
	scrdef_end

scr_seq_00000743_00000016:
	scrcmd_331
	setvar VAR_UNK_4127, 0
	scrcmd_142 31, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000743_00000065
	comparevartovalue VAR_UNK_40FD, 0
	gotoif eq, scr_seq_00000743_0000005F
	scrcmd_484 16386
	comparevartovalue VAR_TEMP_x4002, 5
	gotoif ne, scr_seq_00000743_00000059
	setflag FLAG_UNK_2F6
	goto scr_seq_00000743_0000005D

scr_seq_00000743_00000059:
	clearflag FLAG_UNK_2F6
scr_seq_00000743_0000005D:
	end

scr_seq_00000743_0000005F:
	clearflag FLAG_UNK_2F6
	end

scr_seq_00000743_00000065:
	setflag FLAG_UNK_2F6
	end

scr_seq_00000743_0000006B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 15, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000743_00000131
	msgbox 0
	closemsg
	scrcmd_213 261, 0, 0, 0
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000743_00000147
	scrcmd_295 15
	addvar VAR_UNK_4135, 1
	setflag FLAG_UNK_998
	scrcmd_515 22
	settrainerflag 681
	settrainerflag 683
	settrainerflag 682
	settrainerflag 684
	setflag FLAG_UNK_97F
	clearflag FLAG_UNK_297
	setflag FLAG_UNK_30F
	setvar VAR_UNK_4096, 1
	msgbox 1
	scrcmd_190 0
	msgbox 2
	scrcmd_078 1189
	scrcmd_079
	msgbox 3
	goto scr_seq_00000743_000000F0

scr_seq_00000743_000000F0:
	setvar VAR_SPECIAL_x8004, 419
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000743_00000127
	callstd 2033
	setflag FLAG_UNK_17E
	scrcmd_190 0
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000743_00000127:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000743_00000131:
	checkflag FLAG_UNK_17E
	gotoif lt, scr_seq_00000743_000000F0
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000743_00000147:
	scrcmd_219
	releaseall
	end

scr_seq_00000743_0000014D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 15, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000743_00000186
	msgbox 6
	scrcmd_600
	scrcmd_783 1
	scrcmd_607
	scrcmd_109 253, 56
	setvar VAR_UNK_4127, 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000743_00000186:
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000743_00000191:
	scrcmd_609
	lockall
	checkflag FLAG_UNK_13A
	gotoif eq, scr_seq_00000743_0000037D
	scrcmd_105 16384, 16385
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_00000743_000001C9
	apply_movement 4, scr_seq_00000743_00000394
	apply_movement 255, scr_seq_00000743_0000040C
	goto scr_seq_00000743_000002AB

scr_seq_00000743_000001C9:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_00000743_000001EC
	apply_movement 4, scr_seq_00000743_000003A4
	apply_movement 255, scr_seq_00000743_0000040C
	goto scr_seq_00000743_000002AB

scr_seq_00000743_000001EC:
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_00000743_0000020F
	apply_movement 4, scr_seq_00000743_000003B4
	apply_movement 255, scr_seq_00000743_0000040C
	goto scr_seq_00000743_000002AB

scr_seq_00000743_0000020F:
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, scr_seq_00000743_00000232
	apply_movement 4, scr_seq_00000743_000003C4
	apply_movement 255, scr_seq_00000743_00000418
	goto scr_seq_00000743_000002AB

scr_seq_00000743_00000232:
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_00000743_00000255
	apply_movement 4, scr_seq_00000743_000003D4
	apply_movement 255, scr_seq_00000743_00000418
	goto scr_seq_00000743_000002AB

scr_seq_00000743_00000255:
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_00000743_00000278
	apply_movement 4, scr_seq_00000743_000003E4
	apply_movement 255, scr_seq_00000743_00000418
	goto scr_seq_00000743_000002AB

scr_seq_00000743_00000278:
	comparevartovalue VAR_TEMP_x4000, 8
	gotoif ne, scr_seq_00000743_0000029B
	apply_movement 4, scr_seq_00000743_000003F0
	apply_movement 255, scr_seq_00000743_00000424
	goto scr_seq_00000743_000002AB

scr_seq_00000743_0000029B:
	apply_movement 4, scr_seq_00000743_000003FC
	apply_movement 255, scr_seq_00000743_00000424
scr_seq_00000743_000002AB:
	wait_movement
	msgbox 8
	closemsg
	setflag FLAG_UNK_13A
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_00000743_000002D1
	apply_movement 4, scr_seq_00000743_00000430
	goto scr_seq_00000743_0000037B

scr_seq_00000743_000002D1:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_00000743_000002EC
	apply_movement 4, scr_seq_00000743_0000043C
	goto scr_seq_00000743_0000037B

scr_seq_00000743_000002EC:
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_00000743_00000307
	apply_movement 4, scr_seq_00000743_00000448
	goto scr_seq_00000743_0000037B

scr_seq_00000743_00000307:
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, scr_seq_00000743_00000322
	apply_movement 4, scr_seq_00000743_00000454
	goto scr_seq_00000743_0000037B

scr_seq_00000743_00000322:
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_00000743_0000033D
	apply_movement 4, scr_seq_00000743_00000460
	goto scr_seq_00000743_0000037B

scr_seq_00000743_0000033D:
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_00000743_00000358
	apply_movement 4, scr_seq_00000743_0000046C
	goto scr_seq_00000743_0000037B

scr_seq_00000743_00000358:
	comparevartovalue VAR_TEMP_x4000, 8
	gotoif ne, scr_seq_00000743_00000373
	apply_movement 4, scr_seq_00000743_0000046C
	goto scr_seq_00000743_0000037B

scr_seq_00000743_00000373:
	apply_movement 4, scr_seq_00000743_00000474
scr_seq_00000743_0000037B:
	wait_movement
scr_seq_00000743_0000037D:
	scrcmd_600
	scrcmd_783 1
	scrcmd_607
	scrcmd_109 253, 56
	setvar VAR_UNK_4127, 1
	releaseall
	end


scr_seq_00000743_00000394:
	.short 2, 1
	.short 75, 1
	.short 14, 5
	.short 254, 0

scr_seq_00000743_000003A4:
	.short 2, 1
	.short 75, 1
	.short 14, 4
	.short 254, 0

scr_seq_00000743_000003B4:
	.short 2, 1
	.short 75, 1
	.short 14, 3
	.short 254, 0

scr_seq_00000743_000003C4:
	.short 2, 1
	.short 75, 1
	.short 14, 2
	.short 254, 0

scr_seq_00000743_000003D4:
	.short 2, 1
	.short 75, 1
	.short 14, 1
	.short 254, 0

scr_seq_00000743_000003E4:
	.short 2, 1
	.short 75, 1
	.short 254, 0

scr_seq_00000743_000003F0:
	.short 3, 1
	.short 75, 1
	.short 254, 0

scr_seq_00000743_000003FC:
	.short 3, 1
	.short 75, 1
	.short 15, 1
	.short 254, 0

scr_seq_00000743_0000040C:
	.short 65, 2
	.short 3, 1
	.short 254, 0

scr_seq_00000743_00000418:
	.short 63, 2
	.short 3, 1
	.short 254, 0

scr_seq_00000743_00000424:
	.short 63, 2
	.short 2, 1
	.short 254, 0

scr_seq_00000743_00000430:
	.short 15, 5
	.short 1, 1
	.short 254, 0

scr_seq_00000743_0000043C:
	.short 15, 4
	.short 1, 1
	.short 254, 0

scr_seq_00000743_00000448:
	.short 15, 3
	.short 1, 1
	.short 254, 0

scr_seq_00000743_00000454:
	.short 15, 2
	.short 1, 1
	.short 254, 0

scr_seq_00000743_00000460:
	.short 15, 1
	.short 1, 1
	.short 254, 0

scr_seq_00000743_0000046C:
	.short 1, 1
	.short 254, 0

scr_seq_00000743_00000474:
	.short 14, 1
	.short 1, 1
	.short 254, 0
scr_seq_00000743_00000480:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 15, 32780
	scrcmd_190 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000743_000004A7
	msgbox 9
	goto scr_seq_00000743_000004AA

scr_seq_00000743_000004A7:
	msgbox 10
scr_seq_00000743_000004AA:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
