#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000096_0000042C ; 000
	scrdef scr_seq_00000096_00000274 ; 001
	scrdef scr_seq_00000096_000000BC ; 002
	scrdef scr_seq_00000096_00000595 ; 003
	scrdef scr_seq_00000096_0000061C ; 004
	scrdef scr_seq_00000096_00000071 ; 005
	scrdef scr_seq_00000096_0000001E ; 006
	scrdef_end

scr_seq_00000096_0000001E:
	setflag FLAG_UNK_1B7
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, scr_seq_00000096_00000033
	clearflag FLAG_UNK_1B7
scr_seq_00000096_00000033:
	setvar VAR_TEMP_x4000, 0
	setvar VAR_TEMP_x4001, 0
	setvar VAR_TEMP_x4002, 1
	setvar VAR_TEMP_x4003, 0
	setvar VAR_TEMP_x4004, 0
	setvar VAR_TEMP_x4005, 0
	setvar VAR_TEMP_x4006, 0
	setvar VAR_TEMP_x4007, 0
	setvar VAR_TEMP_x4008, 0
	setvar VAR_TEMP_x4009, 1
	end

scr_seq_00000096_00000071:
	scrcmd_375 31
	scrcmd_375 30
	scrcmd_375 29
	scrcmd_375 32
	scrcmd_375 33
	scrcmd_375 34
	checkflag FLAG_UNK_09B
	gotoif eq, scr_seq_00000096_00000096
	end

scr_seq_00000096_00000096:
	scrcmd_339 26, 18, 0, 14, 0
	scrcmd_339 27, 24, 0, 14, 0
	scrcmd_339 34, 24, 0, 14, 0
	end

scr_seq_00000096_000000BC:
	scrcmd_609
	lockall
	play_se SEQ_SE_GS_ZUKAN06
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000096_000000F5
	apply_movement 8, scr_seq_00000096_000005CC
	apply_movement 9, scr_seq_00000096_000005D4
	apply_movement 30, scr_seq_00000096_0000060C
	setvar VAR_TEMP_x4001, 1
	goto scr_seq_00000096_00000113

scr_seq_00000096_000000F5:
	apply_movement 8, scr_seq_00000096_000005DC
	apply_movement 9, scr_seq_00000096_000005E4
	apply_movement 30, scr_seq_00000096_00000614
	setvar VAR_TEMP_x4001, 0
scr_seq_00000096_00000113:
	comparevartovalue VAR_TEMP_x4003, 0
	gotoif ne, scr_seq_00000096_0000013C
	apply_movement 12, scr_seq_00000096_000005EC
	apply_movement 13, scr_seq_00000096_000005F4
	setvar VAR_TEMP_x4003, 1
	goto scr_seq_00000096_00000152

scr_seq_00000096_0000013C:
	apply_movement 12, scr_seq_00000096_000005FC
	apply_movement 13, scr_seq_00000096_00000604
	setvar VAR_TEMP_x4003, 0
scr_seq_00000096_00000152:
	comparevartovalue VAR_TEMP_x4005, 0
	gotoif ne, scr_seq_00000096_00000183
	apply_movement 16, scr_seq_00000096_000005CC
	apply_movement 17, scr_seq_00000096_000005D4
	apply_movement 32, scr_seq_00000096_0000060C
	setvar VAR_TEMP_x4005, 1
	goto scr_seq_00000096_000001A1

scr_seq_00000096_00000183:
	apply_movement 16, scr_seq_00000096_000005DC
	apply_movement 17, scr_seq_00000096_000005E4
	apply_movement 32, scr_seq_00000096_00000614
	setvar VAR_TEMP_x4005, 0
scr_seq_00000096_000001A1:
	comparevartovalue VAR_TEMP_x4006, 0
	gotoif ne, scr_seq_00000096_000001D2
	apply_movement 18, scr_seq_00000096_000005CC
	apply_movement 19, scr_seq_00000096_000005D4
	apply_movement 33, scr_seq_00000096_0000060C
	setvar VAR_TEMP_x4006, 1
	goto scr_seq_00000096_000001F0

scr_seq_00000096_000001D2:
	apply_movement 18, scr_seq_00000096_000005DC
	apply_movement 19, scr_seq_00000096_000005E4
	apply_movement 33, scr_seq_00000096_00000614
	setvar VAR_TEMP_x4006, 0
scr_seq_00000096_000001F0:
	comparevartovalue VAR_TEMP_x4007, 0
	gotoif ne, scr_seq_00000096_00000219
	apply_movement 20, scr_seq_00000096_000005EC
	apply_movement 21, scr_seq_00000096_000005F4
	setvar VAR_TEMP_x4007, 1
	goto scr_seq_00000096_0000022F

scr_seq_00000096_00000219:
	apply_movement 20, scr_seq_00000096_000005FC
	apply_movement 21, scr_seq_00000096_00000604
	setvar VAR_TEMP_x4007, 0
scr_seq_00000096_0000022F:
	comparevartovalue VAR_TEMP_x4008, 0
	gotoif ne, scr_seq_00000096_00000258
	apply_movement 22, scr_seq_00000096_000005EC
	apply_movement 23, scr_seq_00000096_000005F4
	setvar VAR_TEMP_x4008, 1
	goto scr_seq_00000096_0000026E

scr_seq_00000096_00000258:
	apply_movement 22, scr_seq_00000096_000005FC
	apply_movement 23, scr_seq_00000096_00000604
	setvar VAR_TEMP_x4008, 0
scr_seq_00000096_0000026E:
	wait_movement
	releaseall
	end

scr_seq_00000096_00000274:
	scrcmd_609
	lockall
	play_se SEQ_SE_GS_ZUKAN06
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_00000096_000002AD
	apply_movement 6, scr_seq_00000096_000005CC
	apply_movement 7, scr_seq_00000096_000005D4
	apply_movement 31, scr_seq_00000096_0000060C
	setvar VAR_TEMP_x4000, 1
	goto scr_seq_00000096_000002CB

scr_seq_00000096_000002AD:
	apply_movement 6, scr_seq_00000096_000005DC
	apply_movement 7, scr_seq_00000096_000005E4
	apply_movement 31, scr_seq_00000096_00000614
	setvar VAR_TEMP_x4000, 0
scr_seq_00000096_000002CB:
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_00000096_000002F4
	apply_movement 10, scr_seq_00000096_000005EC
	apply_movement 11, scr_seq_00000096_000005F4
	setvar VAR_TEMP_x4002, 1
	goto scr_seq_00000096_0000030A

scr_seq_00000096_000002F4:
	apply_movement 10, scr_seq_00000096_000005FC
	apply_movement 11, scr_seq_00000096_00000604
	setvar VAR_TEMP_x4002, 0
scr_seq_00000096_0000030A:
	comparevartovalue VAR_TEMP_x4004, 0
	gotoif ne, scr_seq_00000096_0000033B
	apply_movement 14, scr_seq_00000096_000005CC
	apply_movement 15, scr_seq_00000096_000005D4
	apply_movement 29, scr_seq_00000096_0000060C
	setvar VAR_TEMP_x4004, 1
	goto scr_seq_00000096_00000359

scr_seq_00000096_0000033B:
	apply_movement 14, scr_seq_00000096_000005DC
	apply_movement 15, scr_seq_00000096_000005E4
	apply_movement 29, scr_seq_00000096_00000614
	setvar VAR_TEMP_x4004, 0
scr_seq_00000096_00000359:
	comparevartovalue VAR_TEMP_x4006, 0
	gotoif ne, scr_seq_00000096_0000038A
	apply_movement 18, scr_seq_00000096_000005CC
	apply_movement 19, scr_seq_00000096_000005D4
	apply_movement 33, scr_seq_00000096_0000060C
	setvar VAR_TEMP_x4006, 1
	goto scr_seq_00000096_000003A8

scr_seq_00000096_0000038A:
	apply_movement 18, scr_seq_00000096_000005DC
	apply_movement 19, scr_seq_00000096_000005E4
	apply_movement 33, scr_seq_00000096_00000614
	setvar VAR_TEMP_x4006, 0
scr_seq_00000096_000003A8:
	comparevartovalue VAR_TEMP_x4008, 0
	gotoif ne, scr_seq_00000096_000003D1
	apply_movement 22, scr_seq_00000096_000005EC
	apply_movement 23, scr_seq_00000096_000005F4
	setvar VAR_TEMP_x4008, 1
	goto scr_seq_00000096_000003E7

scr_seq_00000096_000003D1:
	apply_movement 22, scr_seq_00000096_000005FC
	apply_movement 23, scr_seq_00000096_00000604
	setvar VAR_TEMP_x4008, 0
scr_seq_00000096_000003E7:
	comparevartovalue VAR_TEMP_x4009, 0
	gotoif ne, scr_seq_00000096_00000410
	apply_movement 24, scr_seq_00000096_000005EC
	apply_movement 25, scr_seq_00000096_000005F4
	setvar VAR_TEMP_x4009, 1
	goto scr_seq_00000096_00000426

scr_seq_00000096_00000410:
	apply_movement 24, scr_seq_00000096_000005FC
	apply_movement 25, scr_seq_00000096_00000604
	setvar VAR_TEMP_x4009, 0
scr_seq_00000096_00000426:
	wait_movement
	releaseall
	end

scr_seq_00000096_0000042C:
	scrcmd_609
	lockall
	play_se SEQ_SE_GS_ZUKAN06
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_00000096_0000045D
	apply_movement 10, scr_seq_00000096_000005EC
	apply_movement 11, scr_seq_00000096_000005F4
	setvar VAR_TEMP_x4002, 1
	goto scr_seq_00000096_00000473

scr_seq_00000096_0000045D:
	apply_movement 10, scr_seq_00000096_000005FC
	apply_movement 11, scr_seq_00000096_00000604
	setvar VAR_TEMP_x4002, 0
scr_seq_00000096_00000473:
	comparevartovalue VAR_TEMP_x4003, 0
	gotoif ne, scr_seq_00000096_0000049C
	apply_movement 12, scr_seq_00000096_000005EC
	apply_movement 13, scr_seq_00000096_000005F4
	setvar VAR_TEMP_x4003, 1
	goto scr_seq_00000096_000004B2

scr_seq_00000096_0000049C:
	apply_movement 12, scr_seq_00000096_000005FC
	apply_movement 13, scr_seq_00000096_00000604
	setvar VAR_TEMP_x4003, 0
scr_seq_00000096_000004B2:
	comparevartovalue VAR_TEMP_x4004, 0
	gotoif ne, scr_seq_00000096_000004E3
	apply_movement 14, scr_seq_00000096_000005CC
	apply_movement 15, scr_seq_00000096_000005D4
	apply_movement 29, scr_seq_00000096_0000060C
	setvar VAR_TEMP_x4004, 1
	goto scr_seq_00000096_00000501

scr_seq_00000096_000004E3:
	apply_movement 14, scr_seq_00000096_000005DC
	apply_movement 15, scr_seq_00000096_000005E4
	apply_movement 29, scr_seq_00000096_00000614
	setvar VAR_TEMP_x4004, 0
scr_seq_00000096_00000501:
	comparevartovalue VAR_TEMP_x4005, 0
	gotoif ne, scr_seq_00000096_00000532
	apply_movement 16, scr_seq_00000096_000005CC
	apply_movement 17, scr_seq_00000096_000005D4
	apply_movement 32, scr_seq_00000096_0000060C
	setvar VAR_TEMP_x4005, 1
	goto scr_seq_00000096_00000550

scr_seq_00000096_00000532:
	apply_movement 16, scr_seq_00000096_000005DC
	apply_movement 17, scr_seq_00000096_000005E4
	apply_movement 32, scr_seq_00000096_00000614
	setvar VAR_TEMP_x4005, 0
scr_seq_00000096_00000550:
	comparevartovalue VAR_TEMP_x4007, 0
	gotoif ne, scr_seq_00000096_00000579
	apply_movement 20, scr_seq_00000096_000005EC
	apply_movement 21, scr_seq_00000096_000005F4
	setvar VAR_TEMP_x4007, 1
	goto scr_seq_00000096_0000058F

scr_seq_00000096_00000579:
	apply_movement 20, scr_seq_00000096_000005FC
	apply_movement 21, scr_seq_00000096_00000604
	setvar VAR_TEMP_x4007, 0
scr_seq_00000096_0000058F:
	wait_movement
	releaseall
	end

scr_seq_00000096_00000595:
	checkflag FLAG_UNK_09B
	gotoif eq, scr_seq_00000096_000005CA
	scrcmd_609
	lockall
	play_se SEQ_SE_GS_ZUKAN06
	apply_movement 26, scr_seq_00000096_000005DC
	apply_movement 27, scr_seq_00000096_000005E4
	apply_movement 34, scr_seq_00000096_00000614
	wait_movement
	setflag FLAG_UNK_09B
	releaseall
	end

scr_seq_00000096_000005CA:
	end


scr_seq_00000096_000005CC:
	.short 15, 2
	.short 254, 0

scr_seq_00000096_000005D4:
	.short 14, 2
	.short 254, 0

scr_seq_00000096_000005DC:
	.short 14, 2
	.short 254, 0

scr_seq_00000096_000005E4:
	.short 15, 2
	.short 254, 0

scr_seq_00000096_000005EC:
	.short 13, 2
	.short 254, 0

scr_seq_00000096_000005F4:
	.short 12, 2
	.short 254, 0

scr_seq_00000096_000005FC:
	.short 12, 2
	.short 254, 0

scr_seq_00000096_00000604:
	.short 13, 2
	.short 254, 0

scr_seq_00000096_0000060C:
	.short 15, 2
	.short 254, 0

scr_seq_00000096_00000614:
	.short 14, 2
	.short 254, 0
scr_seq_00000096_0000061C:
	scrcmd_609
	lockall
	callstd 2031
	scrcmd_339 28, 28, 0, 4, 2
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 28, scr_seq_00000096_000006E0
	apply_movement 255, scr_seq_00000096_000006F4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_191 0
	msgbox 0
	closemsg
	scrcmd_206 32780
	comparevartovalue VAR_SPECIAL_x800C, 152
	gotoif ne, scr_seq_00000096_0000067D
	scrcmd_213 289, 0, 0, 0
	goto scr_seq_00000096_000006A0

scr_seq_00000096_0000067D:
	comparevartovalue VAR_SPECIAL_x800C, 155
	gotoif ne, scr_seq_00000096_00000698
	scrcmd_213 271, 0, 0, 0
	goto scr_seq_00000096_000006A0

scr_seq_00000096_00000698:
	scrcmd_213 288, 0, 0, 0
scr_seq_00000096_000006A0:
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000096_000006D9
	callstd 2070
	scrcmd_191 0
	msgbox 1
	closemsg
	setvar VAR_UNK_40A0, 1
	apply_movement 28, scr_seq_00000096_00000700
	wait_movement
	scrcmd_101 28
	callstd 2071
	releaseall
	end

scr_seq_00000096_000006D9:
	scrcmd_219
	releaseall
	end

scr_seq_00000096_000006DF:
	.byte 0x00

scr_seq_00000096_000006E0:
	.short 62, 6
	.short 14, 3
	.short 13, 1
	.short 14, 4
	.short 254, 0

scr_seq_00000096_000006F4:
	.short 75, 1
	.short 15, 1
	.short 254, 0

scr_seq_00000096_00000700:
	.short 15, 4
	.short 12, 1
	.short 15, 4
	.short 254, 0
	.balign 4, 0
