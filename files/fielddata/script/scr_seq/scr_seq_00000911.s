#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000911_000000F4 ; 000
	scrdef scr_seq_00000911_000000F6 ; 001
	scrdef scr_seq_00000911_00000036 ; 002
	scrdef scr_seq_00000911_00000075 ; 003
	scrdef scr_seq_00000911_000005AC ; 004
	scrdef scr_seq_00000911_000005C1 ; 005
	scrdef scr_seq_00000911_000005D8 ; 006
	scrdef scr_seq_00000911_000005ED ; 007
	scrdef scr_seq_00000911_00000602 ; 008
	scrdef scr_seq_00000911_00000615 ; 009
	scrdef scr_seq_00000911_00000628 ; 010
	scrdef scr_seq_00000911_000003F4 ; 011
	scrdef scr_seq_00000911_000000A1 ; 012
	scrdef_end

scr_seq_00000911_00000036:
	setvar VAR_UNK_4077, 2
	setflag FLAG_UNK_0C5
	setflag FLAG_UNK_99B
	comparevartovalue VAR_UNK_40F8, 0
	gotoif ne, scr_seq_00000911_00000057
	setvar VAR_UNK_40F8, 2
scr_seq_00000911_00000057:
	setvar VAR_SPECIAL_x8004, 1
	setvar VAR_SPECIAL_x8005, 2
	setvar VAR_SPECIAL_x8006, 2
	callstd 2039
	setvar VAR_UNK_4134, 5
	end

scr_seq_00000911_00000075:
	setflag FLAG_UNK_0F5
	setvar VAR_UNK_4057, 1
	setvar VAR_SPECIAL_x8004, 24
	setvar VAR_SPECIAL_x8005, 2
	setvar VAR_SPECIAL_x8006, 0
	callstd 2039
	setflag FLAG_UNK_249
	setvar VAR_UNK_40A5, 3
	end

scr_seq_00000911_000000A1:
	checkflag FLAG_UNK_189
	gotoif lt, scr_seq_00000911_000000B2
	clearflag FLAG_UNK_189
	end

scr_seq_00000911_000000B2:
	scrcmd_484 16384
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_00000911_000000CD
	clearflag FLAG_UNK_27E
	goto scr_seq_00000911_000000E8

scr_seq_00000911_000000CD:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_00000911_000000E4
	clearflag FLAG_UNK_27E
	goto scr_seq_00000911_000000E8

scr_seq_00000911_000000E4:
	setflag FLAG_UNK_27E
scr_seq_00000911_000000E8:
	end

scr_seq_00000911_000000EA:
	.byte 0x00, 0x00, 0x4b, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00
scr_seq_00000911_000000F4:
	end

scr_seq_00000911_000000F6:
	scrcmd_609
	lockall
	scrcmd_084 0, 3
	scrcmd_307 8, 7, 13, 14, 77
	scrcmd_310 77
	scrcmd_308 77
	clearflag FLAG_UNK_1D6
	scrcmd_100 3
	apply_movement 3, scr_seq_00000911_000002B4
	wait_movement
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	apply_movement 255, scr_seq_00000911_000002C0
	wait_movement
	callstd 2031
	scrcmd_105 16384, 16385
	comparevartovalue VAR_TEMP_x4001, 239
	gotoif ne, scr_seq_00000911_0000015B
	apply_movement 3, scr_seq_00000911_000002CC
	goto scr_seq_00000911_000001C1

scr_seq_00000911_0000015B:
	comparevartovalue VAR_TEMP_x4001, 240
	gotoif ne, scr_seq_00000911_00000176
	apply_movement 3, scr_seq_00000911_000002DC
	goto scr_seq_00000911_000001C1

scr_seq_00000911_00000176:
	comparevartovalue VAR_TEMP_x4001, 241
	gotoif ne, scr_seq_00000911_00000191
	apply_movement 3, scr_seq_00000911_000002F0
	goto scr_seq_00000911_000001C1

scr_seq_00000911_00000191:
	comparevartovalue VAR_TEMP_x4001, 242
	gotoif ne, scr_seq_00000911_000001AC
	apply_movement 3, scr_seq_00000911_00000304
	goto scr_seq_00000911_000001C1

scr_seq_00000911_000001AC:
	comparevartovalue VAR_TEMP_x4001, 243
	gotoif ne, scr_seq_00000911_000001C1
	apply_movement 3, scr_seq_00000911_00000318
scr_seq_00000911_000001C1:
	wait_movement
	scrcmd_191 0
	msgbox 0
	closemsg
	comparevartovalue VAR_TEMP_x4001, 239
	gotoif ne, scr_seq_00000911_000001F6
	apply_movement 3, scr_seq_00000911_0000032C
	apply_movement 255, scr_seq_00000911_0000037C
	apply_movement 253, scr_seq_00000911_000003C4
	goto scr_seq_00000911_0000029C

scr_seq_00000911_000001F6:
	comparevartovalue VAR_TEMP_x4001, 240
	gotoif ne, scr_seq_00000911_00000221
	apply_movement 3, scr_seq_00000911_0000033C
	apply_movement 255, scr_seq_00000911_0000037C
	apply_movement 253, scr_seq_00000911_000003C4
	goto scr_seq_00000911_0000029C

scr_seq_00000911_00000221:
	comparevartovalue VAR_TEMP_x4001, 241
	gotoif ne, scr_seq_00000911_0000024C
	apply_movement 3, scr_seq_00000911_0000034C
	apply_movement 255, scr_seq_00000911_0000037C
	apply_movement 253, scr_seq_00000911_000003C4
	goto scr_seq_00000911_0000029C

scr_seq_00000911_0000024C:
	comparevartovalue VAR_TEMP_x4001, 242
	gotoif ne, scr_seq_00000911_00000277
	apply_movement 3, scr_seq_00000911_0000035C
	apply_movement 255, scr_seq_00000911_0000037C
	apply_movement 253, scr_seq_00000911_000003C4
	goto scr_seq_00000911_0000029C

scr_seq_00000911_00000277:
	comparevartovalue VAR_TEMP_x4001, 243
	gotoif ne, scr_seq_00000911_0000029C
	apply_movement 3, scr_seq_00000911_0000036C
	apply_movement 255, scr_seq_00000911_000003A0
	apply_movement 253, scr_seq_00000911_000003E0
scr_seq_00000911_0000029C:
	wait_movement
	setvar VAR_UNK_4078, 1
	scrcmd_101 3
	setflag FLAG_UNK_1D6
	callstd 2032
	releaseall
	end


scr_seq_00000911_000002B4:
	.short 13, 1
	.short 64, 1
	.short 254, 0

scr_seq_00000911_000002C0:
	.short 75, 1
	.short 63, 1
	.short 254, 0

scr_seq_00000911_000002CC:
	.short 1, 2
	.short 15, 2
	.short 64, 1
	.short 254, 0

scr_seq_00000911_000002DC:
	.short 13, 1
	.short 1, 2
	.short 15, 2
	.short 64, 1
	.short 254, 0

scr_seq_00000911_000002F0:
	.short 13, 2
	.short 1, 2
	.short 15, 2
	.short 64, 1
	.short 254, 0

scr_seq_00000911_00000304:
	.short 13, 3
	.short 1, 2
	.short 15, 2
	.short 64, 1
	.short 254, 0

scr_seq_00000911_00000318:
	.short 13, 4
	.short 1, 2
	.short 15, 2
	.short 64, 1
	.short 254, 0

scr_seq_00000911_0000032C:
	.short 15, 6
	.short 0, 2
	.short 12, 10
	.short 254, 0

scr_seq_00000911_0000033C:
	.short 15, 6
	.short 0, 2
	.short 12, 11
	.short 254, 0

scr_seq_00000911_0000034C:
	.short 15, 6
	.short 0, 2
	.short 12, 12
	.short 254, 0

scr_seq_00000911_0000035C:
	.short 15, 6
	.short 0, 2
	.short 12, 13
	.short 254, 0

scr_seq_00000911_0000036C:
	.short 15, 6
	.short 0, 2
	.short 12, 14
	.short 254, 0

scr_seq_00000911_0000037C:
	.short 0, 2
	.short 71, 1
	.short 77, 1
	.short 72, 1
	.short 64, 1
	.short 35, 1
	.short 64, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000911_000003A0:
	.short 1, 2
	.short 71, 1
	.short 76, 1
	.short 72, 1
	.short 64, 1
	.short 35, 1
	.short 64, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000911_000003C4:
	.short 0, 2
	.short 71, 1
	.short 77, 1
	.short 72, 1
	.short 66, 2
	.short 34, 1
	.short 254, 0

scr_seq_00000911_000003E0:
	.short 1, 2
	.short 71, 1
	.short 76, 1
	.short 72, 1
	.short 254, 0
scr_seq_00000911_000003F4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, 32780
	scrcmd_440 32780, 0
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000911_0000051C
	scrcmd_618 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000911_00000530
	scrcmd_438 2, 32780
	scrcmd_440 32780, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000911_0000046D
	apply_movement 255, scr_seq_00000911_00000544
	apply_movement 7, scr_seq_00000911_00000590
	goto scr_seq_00000911_000004BB

scr_seq_00000911_0000046D:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000911_00000488
	apply_movement 255, scr_seq_00000911_0000055C
	goto scr_seq_00000911_000004BB

scr_seq_00000911_00000488:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000911_000004AB
	apply_movement 255, scr_seq_00000911_0000057C
	apply_movement 7, scr_seq_00000911_00000590
	goto scr_seq_00000911_000004BB

scr_seq_00000911_000004AB:
	apply_movement 255, scr_seq_00000911_00000568
	apply_movement 7, scr_seq_00000911_00000590
scr_seq_00000911_000004BB:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000911_000004E2
	apply_movement 253, scr_seq_00000911_0000059C
	wait_movement
scr_seq_00000911_000004E2:
	setflag FLAG_UNK_189
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_615 23
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

scr_seq_00000911_0000051C:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000911_00000530:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 3
	waitbutton
	closemsg
	releaseall
	end


scr_seq_00000911_00000544:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000911_0000055C:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000911_00000568:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000911_0000057C:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000911_00000590:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000911_0000059C:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_00000911_000005AC:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 7, 32780
	callstd 2000
	end

scr_seq_00000911_000005C1:
	scrcmd_055 5, 0, 17, 32780
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 32780
	callstd 2000
	end

scr_seq_00000911_000005D8:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 6, 32780
	callstd 2000
	end

scr_seq_00000911_000005ED:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 8, 32780
	callstd 2000
	end

scr_seq_00000911_00000602:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000911_00000615:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000911_00000628:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
