#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000249_000000E9 ; 000
	scrdef scr_seq_00000249_00000022 ; 001
	scrdef scr_seq_00000249_00000104 ; 002
	scrdef scr_seq_00000249_0000049B ; 003
	scrdef scr_seq_00000249_000004B2 ; 004
	scrdef scr_seq_00000249_000004C7 ; 005
	scrdef scr_seq_00000249_00000264 ; 006
	scrdef scr_seq_00000249_0000041C ; 007
	scrdef_end

scr_seq_00000249_00000022:
	checkflag FLAG_UNK_189
	gotoif lt, scr_seq_00000249_00000033
	clearflag FLAG_UNK_189
	end

scr_seq_00000249_00000033:
	scrcmd_484 16384
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, scr_seq_00000249_0000005B
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_00000249_0000005B
	setflag FLAG_UNK_27E
	goto scr_seq_00000249_0000005F

scr_seq_00000249_0000005B:
	clearflag FLAG_UNK_27E
scr_seq_00000249_0000005F:
	scrcmd_379 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, scr_seq_00000249_00000087
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, scr_seq_00000249_00000087
	clearflag FLAG_UNK_226
	goto scr_seq_00000249_0000008B

scr_seq_00000249_00000087:
	setflag FLAG_UNK_226
scr_seq_00000249_0000008B:
	checkflag FLAG_UNK_162
	gotoif lt, scr_seq_00000249_000000E3
	scrcmd_142 36, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000249_000000E3
	scrcmd_484 16384
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_00000249_000000C4
	clearflag FLAG_UNK_314
	goto scr_seq_00000249_000000E1

scr_seq_00000249_000000C4:
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_00000249_000000DB
	clearflag FLAG_UNK_314
	goto scr_seq_00000249_000000E1

scr_seq_00000249_000000DB:
	goto scr_seq_00000249_000000E3

scr_seq_00000249_000000E1:
	end

scr_seq_00000249_000000E3:
	setflag FLAG_UNK_314
	end

scr_seq_00000249_000000E9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 241, 0
	msgbox 3
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000249_00000104:
	scrcmd_609
	lockall
	apply_movement 8, scr_seq_00000249_00000208
	wait_movement
	scrcmd_105 16384, 16385
	comparevartovalue VAR_TEMP_x4001, 171
	gotoif ne, scr_seq_00000249_00000133
	apply_movement 8, scr_seq_00000249_00000214
	goto scr_seq_00000249_00000156

scr_seq_00000249_00000133:
	comparevartovalue VAR_TEMP_x4001, 172
	gotoif ne, scr_seq_00000249_0000014E
	apply_movement 8, scr_seq_00000249_00000220
	goto scr_seq_00000249_00000156

scr_seq_00000249_0000014E:
	apply_movement 8, scr_seq_00000249_00000228
scr_seq_00000249_00000156:
	wait_movement
	msgbox 4
	msgbox 5
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000249_000001E3
scr_seq_00000249_00000173:
	msgbox 6
	scrcmd_146 24
	scrcmd_190 0
	msgbox 8
	scrcmd_078 1206
	scrcmd_079
	msgbox 9
	closemsg
	scrcmd_105 16384, 16385
	comparevartovalue VAR_TEMP_x4001, 171
	gotoif ne, scr_seq_00000249_000001AC
	apply_movement 8, scr_seq_00000249_00000234
	goto scr_seq_00000249_000001CF

scr_seq_00000249_000001AC:
	comparevartovalue VAR_TEMP_x4001, 172
	gotoif ne, scr_seq_00000249_000001C7
	apply_movement 8, scr_seq_00000249_00000244
	goto scr_seq_00000249_000001CF

scr_seq_00000249_000001C7:
	apply_movement 8, scr_seq_00000249_00000254
scr_seq_00000249_000001CF:
	wait_movement
	scrcmd_101 8
	setflag FLAG_UNK_228
	releaseall
	setvar VAR_UNK_408F, 1
	end

scr_seq_00000249_000001E3:
	msgbox 7
	msgbox 5
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000249_000001E3
	goto scr_seq_00000249_00000173

scr_seq_00000249_00000204:
	.byte 0x02, 0x00, 0x00, 0x00

scr_seq_00000249_00000208:
	.short 75, 1
	.short 35, 1
	.short 254, 0

scr_seq_00000249_00000214:
	.short 12, 1
	.short 15, 2
	.short 254, 0

scr_seq_00000249_00000220:
	.short 15, 2
	.short 254, 0

scr_seq_00000249_00000228:
	.short 13, 1
	.short 15, 2
	.short 254, 0

scr_seq_00000249_00000234:
	.short 13, 1
	.short 14, 2
	.short 13, 9
	.short 254, 0

scr_seq_00000249_00000244:
	.short 13, 1
	.short 14, 2
	.short 13, 8
	.short 254, 0

scr_seq_00000249_00000254:
	.short 13, 1
	.short 14, 2
	.short 13, 7
	.short 254, 0
scr_seq_00000249_00000264:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, 32780
	scrcmd_440 32780, 0
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000249_0000038C
	scrcmd_618 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000249_000003A0
	scrcmd_438 2, 32780
	scrcmd_440 32780, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000249_000002DD
	apply_movement 255, scr_seq_00000249_000003B4
	apply_movement 11, scr_seq_00000249_00000400
	goto scr_seq_00000249_0000032B

scr_seq_00000249_000002DD:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000249_000002F8
	apply_movement 255, scr_seq_00000249_000003CC
	goto scr_seq_00000249_0000032B

scr_seq_00000249_000002F8:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000249_0000031B
	apply_movement 255, scr_seq_00000249_000003EC
	apply_movement 11, scr_seq_00000249_00000400
	goto scr_seq_00000249_0000032B

scr_seq_00000249_0000031B:
	apply_movement 255, scr_seq_00000249_000003D8
	apply_movement 11, scr_seq_00000249_00000400
scr_seq_00000249_0000032B:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000249_00000352
	apply_movement 253, scr_seq_00000249_0000040C
	wait_movement
scr_seq_00000249_00000352:
	setflag FLAG_UNK_189
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_615 28
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

scr_seq_00000249_0000038C:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000249_000003A0:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 3
	waitbutton
	closemsg
	releaseall
	end


scr_seq_00000249_000003B4:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000249_000003CC:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000249_000003D8:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000249_000003EC:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000249_00000400:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000249_0000040C:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_00000249_0000041C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 10
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000249_00000485
	scrcmd_618 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000249_00000490
	msgbox 11
	closemsg
	setflag FLAG_UNK_189
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_615 80
	faceplayer
	lockall
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	clearflag FLAG_UNK_189
	msgbox 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000249_00000485:
	msgbox 13
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000249_00000490:
	msgbox 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000249_0000049B:
	scrcmd_055 0, 1, 21, 32780
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 32780
	callstd 2000
	end

scr_seq_00000249_000004B2:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 1, 32780
	callstd 2000
	end

scr_seq_00000249_000004C7:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 2, 32780
	callstd 2000
	end
	.balign 4, 0
