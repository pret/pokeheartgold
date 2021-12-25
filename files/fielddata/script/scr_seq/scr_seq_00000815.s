#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000815_00000108 ; 000
	scrdef scr_seq_00000815_000004A0 ; 001
	scrdef scr_seq_00000815_000004B5 ; 002
	scrdef scr_seq_00000815_00000016 ; 003
	scrdef scr_seq_00000815_0000037B ; 004
	scrdef_end

scr_seq_00000815_00000016:
	checkflag FLAG_UNK_189
	gotoif lt, scr_seq_00000815_00000027
	clearflag FLAG_UNK_189
	end

scr_seq_00000815_00000027:
	checkflag FLAG_UNK_129
	gotoif eq, scr_seq_00000815_00000038
	setflag FLAG_UNK_27D
	end

scr_seq_00000815_00000038:
	setflag FLAG_UNK_25A
	scrcmd_142 31, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000815_0000007B
	comparevartovalue VAR_UNK_40FD, 0
	gotoif eq, scr_seq_00000815_0000007B
	scrcmd_484 16386
	comparevartovalue VAR_TEMP_x4002, 5
	gotoif ne, scr_seq_00000815_00000077
	clearflag FLAG_UNK_25A
	goto scr_seq_00000815_0000007B

scr_seq_00000815_00000077:
	setflag FLAG_UNK_25A
scr_seq_00000815_0000007B:
	scrcmd_147 30, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000815_000000CC
	scrcmd_294 15, 16386
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif eq, scr_seq_00000815_000000A9
	goto scr_seq_00000815_00000102

scr_seq_00000815_000000A7:
	.byte 0x02, 0x00
scr_seq_00000815_000000A9:
	scrcmd_484 16386
	comparevartovalue VAR_TEMP_x4002, 2
	gotoif ne, scr_seq_00000815_000000C4
	clearflag FLAG_UNK_27D
	goto scr_seq_00000815_000000CA

scr_seq_00000815_000000C4:
	goto scr_seq_00000815_00000102

scr_seq_00000815_000000CA:
	end

scr_seq_00000815_000000CC:
	scrcmd_142 30, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000815_00000102
	scrcmd_484 16386
	comparevartovalue VAR_TEMP_x4002, 4
	gotoif ne, scr_seq_00000815_000000FA
	clearflag FLAG_UNK_27D
	goto scr_seq_00000815_00000100

scr_seq_00000815_000000FA:
	goto scr_seq_00000815_00000102

scr_seq_00000815_00000100:
	end

scr_seq_00000815_00000102:
	setflag FLAG_UNK_27D
	end

scr_seq_00000815_00000108:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_099 253
	apply_movement 253, scr_seq_00000815_000002FC
	wait_movement
	scrcmd_098 253
	comparevartovalue VAR_UNK_40FD, 0
	gotoif ne, scr_seq_00000815_00000304
	checkflag FLAG_UNK_128
	gotoif eq, scr_seq_00000815_0000016F
	setflag FLAG_UNK_128
	msgbox 0
	closemsg
	scrcmd_386 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_00000815_00000162
	apply_movement 0, scr_seq_00000815_00000268
	goto scr_seq_00000815_0000016A

scr_seq_00000815_00000162:
	apply_movement 0, scr_seq_00000815_00000280
scr_seq_00000815_0000016A:
	wait_movement
	msgbox 1
scr_seq_00000815_0000016F:
	comparevartovalue VAR_UNK_4135, 7
	gotoif ge, scr_seq_00000815_0000018C
	scrcmd_198 0, 16693
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000815_0000018C:
	msgbox 2
	closemsg
	scrcmd_386 16384
	scrcmd_106 253, 32772, 32773
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_00000815_000001C7
	comparevartovalue VAR_SPECIAL_x8004, 1035
	gotoif ne, scr_seq_00000815_000001C1
	apply_movement 253, scr_seq_00000815_000002D4
	wait_movement
scr_seq_00000815_000001C1:
	goto scr_seq_00000815_000001DE

scr_seq_00000815_000001C7:
	comparevartovalue VAR_SPECIAL_x8005, 495
	gotoif ne, scr_seq_00000815_000001DE
	apply_movement 253, scr_seq_00000815_000002E4
	wait_movement
scr_seq_00000815_000001DE:
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_00000815_000001F9
	apply_movement 0, scr_seq_00000815_00000298
	goto scr_seq_00000815_00000201

scr_seq_00000815_000001F9:
	apply_movement 0, scr_seq_00000815_000002A4
scr_seq_00000815_00000201:
	wait_movement
	msgbox 3
	closemsg
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_00000815_00000233
	apply_movement 0, scr_seq_00000815_000002B0
	apply_movement 255, scr_seq_00000815_000002F4
	apply_movement 253, scr_seq_00000815_000002F4
	goto scr_seq_00000815_0000024B

scr_seq_00000815_00000233:
	apply_movement 0, scr_seq_00000815_000002C0
	apply_movement 255, scr_seq_00000815_000002F4
	apply_movement 253, scr_seq_00000815_000002F4
scr_seq_00000815_0000024B:
	wait_movement
	scrcmd_101 0
	setflag FLAG_UNK_25A
	setflag FLAG_UNK_129
	setflag FLAG_UNK_2F8
	clearflag FLAG_UNK_2F9
	releaseall
	end

scr_seq_00000815_00000265:
	.byte 0x00, 0x00, 0x00

scr_seq_00000815_00000268:
	.short 35, 1
	.short 63, 2
	.short 32, 1
	.short 63, 2
	.short 33, 1
	.short 254, 0

scr_seq_00000815_00000280:
	.short 32, 1
	.short 63, 2
	.short 35, 1
	.short 63, 2
	.short 34, 1
	.short 254, 0

scr_seq_00000815_00000298:
	.short 14, 1
	.short 13, 1
	.short 254, 0

scr_seq_00000815_000002A4:
	.short 13, 1
	.short 14, 1
	.short 254, 0

scr_seq_00000815_000002B0:
	.short 13, 2
	.short 14, 2
	.short 13, 8
	.short 254, 0

scr_seq_00000815_000002C0:
	.short 13, 1
	.short 13, 2
	.short 14, 2
	.short 13, 7
	.short 254, 0

scr_seq_00000815_000002D4:
	.short 13, 1
	.short 15, 1
	.short 34, 1
	.short 254, 0

scr_seq_00000815_000002E4:
	.short 14, 1
	.short 12, 1
	.short 35, 1
	.short 254, 0

scr_seq_00000815_000002F4:
	.short 33, 1
	.short 254, 0

scr_seq_00000815_000002FC:
	.short 60, 1
	.short 254, 0
scr_seq_00000815_00000304:
	msgbox 5
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000815_00000365
	scrcmd_618 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000815_00000370
	msgbox 6
	closemsg
	setflag FLAG_UNK_189
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_615 92
	faceplayer
	lockall
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	clearflag FLAG_UNK_189
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000815_00000365:
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000815_00000370:
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000815_0000037B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_147 30, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000815_00000429
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ge, scr_seq_00000815_0000041E
	msgbox 10
scr_seq_00000815_000003A6:
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000815_000003CA
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_00000815_0000040D
	end

scr_seq_00000815_000003CA:
	scrcmd_190 0
	msgbox 11
	scrcmd_078 1206
	scrcmd_079
	scrcmd_146 30
	msgbox 12
	waitbutton
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	setflag FLAG_UNK_27D
	scrcmd_101 1
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000815_0000040D:
	setvar VAR_TEMP_x4004, 1
	msgbox 13
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000815_0000041E:
	msgbox 14
	goto scr_seq_00000815_000003A6

scr_seq_00000815_00000427:
	.byte 0x02, 0x00
scr_seq_00000815_00000429:
	msgbox 15
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000815_0000048A
	scrcmd_618 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000815_00000495
	msgbox 16
	closemsg
	setflag FLAG_UNK_189
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_615 85
	faceplayer
	lockall
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	clearflag FLAG_UNK_189
	msgbox 17
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000815_0000048A:
	msgbox 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000815_00000495:
	msgbox 19
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000815_000004A0:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 20, 32780
	callstd 2000
	end

scr_seq_00000815_000004B5:
	scrcmd_055 21, 0, 9, 32780
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 32780
	callstd 2000
	end
	.balign 4, 0
