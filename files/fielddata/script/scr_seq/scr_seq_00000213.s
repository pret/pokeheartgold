#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000213_00000132 ; 000
	scrdef scr_seq_00000213_0000017F ; 001
	scrdef scr_seq_00000213_00000311 ; 002
	scrdef scr_seq_00000213_0000016C ; 003
	scrdef scr_seq_00000213_000002E8 ; 004
	scrdef scr_seq_00000213_0000047C ; 005
	scrdef scr_seq_00000213_00000026 ; 006
	scrdef scr_seq_00000213_00000056 ; 007
	scrdef scr_seq_00000213_000004A5 ; 008
	scrdef_end

scr_seq_00000213_00000026:
	checkflag FLAG_UNK_12C
	gotoif lt, scr_seq_00000213_0000003D
	scrcmd_339 2, 15, 0, 8, 1
scr_seq_00000213_0000003D:
	checkflag FLAG_UNK_12B
	gotoif lt, scr_seq_00000213_00000054
	scrcmd_339 1, 7, 0, 8, 1
scr_seq_00000213_00000054:
	end

scr_seq_00000213_00000056:
	setflag FLAG_UNK_9D1
	checkflag FLAG_UNK_189
	gotoif lt, scr_seq_00000213_0000006B
	clearflag FLAG_UNK_189
	end

scr_seq_00000213_0000006B:
	scrcmd_147 26, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000213_000000DF
	scrcmd_294 12, 16386
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_00000213_0000009D
	goto scr_seq_00000213_0000012C

scr_seq_00000213_00000097:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_00000213_0000009D:
	goto scr_seq_00000213_000000A5

scr_seq_00000213_000000A3:
	.byte 0x02, 0x00
scr_seq_00000213_000000A5:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 16
	gotoif ne, scr_seq_00000213_000000C0
	clearflag FLAG_UNK_270
	goto scr_seq_00000213_000000DD

scr_seq_00000213_000000C0:
	comparevartovalue VAR_TEMP_x4000, 17
	gotoif ne, scr_seq_00000213_000000D7
	clearflag FLAG_UNK_270
	goto scr_seq_00000213_000000DD

scr_seq_00000213_000000D7:
	goto scr_seq_00000213_0000012C

scr_seq_00000213_000000DD:
	end

scr_seq_00000213_000000DF:
	scrcmd_142 26, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000213_0000012C
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 18
	gotoif ne, scr_seq_00000213_0000010D
	clearflag FLAG_UNK_270
	goto scr_seq_00000213_0000012A

scr_seq_00000213_0000010D:
	comparevartovalue VAR_TEMP_x4000, 19
	gotoif ne, scr_seq_00000213_00000124
	clearflag FLAG_UNK_270
	goto scr_seq_00000213_0000012A

scr_seq_00000213_00000124:
	goto scr_seq_00000213_0000012C

scr_seq_00000213_0000012A:
	end

scr_seq_00000213_0000012C:
	setflag FLAG_UNK_270
	end

scr_seq_00000213_00000132:
	scrcmd_609
	lockall
	apply_movement 0, scr_seq_00000213_0000015C
	wait_movement
	apply_movement 255, scr_seq_00000213_00000164
	wait_movement
	msgbox 0
	waitbutton
	closemsg
	setvar VAR_UNK_4110, 1
	releaseall
	end

scr_seq_00000213_0000015B:
	.byte 0x00

scr_seq_00000213_0000015C:
	.short 75, 1
	.short 254, 0

scr_seq_00000213_00000164:
	.short 34, 1
	.short 254, 0
scr_seq_00000213_0000016C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000213_0000017F:
	scrcmd_609
	lockall
	scrcmd_105 16384, 16385
	comparevartovalue VAR_TEMP_x4001, 8
	gotoif ne, scr_seq_00000213_000001A4
	apply_movement 2, scr_seq_00000213_00000264
	goto scr_seq_00000213_000001AC

scr_seq_00000213_000001A4:
	apply_movement 2, scr_seq_00000213_00000270
scr_seq_00000213_000001AC:
	wait_movement
	comparevartovalue VAR_TEMP_x4001, 8
	gotoif ne, scr_seq_00000213_000001C9
	apply_movement 2, scr_seq_00000213_0000027C
	goto scr_seq_00000213_000001EC

scr_seq_00000213_000001C9:
	comparevartovalue VAR_TEMP_x4001, 10
	gotoif ne, scr_seq_00000213_000001E4
	apply_movement 2, scr_seq_00000213_0000028C
	goto scr_seq_00000213_000001EC

scr_seq_00000213_000001E4:
	apply_movement 2, scr_seq_00000213_0000029C
scr_seq_00000213_000001EC:
	wait_movement
	msgbox 5
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	apply_movement 2, scr_seq_00000213_000002AC
	apply_movement 255, scr_seq_00000213_000002B4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	wait 16, VAR_SPECIAL_x800C
	comparevartovalue VAR_TEMP_x4001, 8
	gotoif ne, scr_seq_00000213_0000023A
	apply_movement 2, scr_seq_00000213_000002C4
	goto scr_seq_00000213_0000025D

scr_seq_00000213_0000023A:
	comparevartovalue VAR_TEMP_x4001, 10
	gotoif ne, scr_seq_00000213_00000255
	apply_movement 2, scr_seq_00000213_000002D0
	goto scr_seq_00000213_0000025D

scr_seq_00000213_00000255:
	apply_movement 2, scr_seq_00000213_000002DC
scr_seq_00000213_0000025D:
	wait_movement
	releaseall
	end

scr_seq_00000213_00000263:
	.byte 0x00

scr_seq_00000213_00000264:
	.short 32, 1
	.short 75, 1
	.short 254, 0

scr_seq_00000213_00000270:
	.short 33, 1
	.short 75, 1
	.short 254, 0

scr_seq_00000213_0000027C:
	.short 19, 1
	.short 16, 1
	.short 38, 1
	.short 254, 0

scr_seq_00000213_0000028C:
	.short 19, 1
	.short 17, 1
	.short 38, 1
	.short 254, 0

scr_seq_00000213_0000029C:
	.short 19, 1
	.short 17, 2
	.short 38, 1
	.short 254, 0

scr_seq_00000213_000002AC:
	.short 14, 1
	.short 254, 0

scr_seq_00000213_000002B4:
	.short 71, 1
	.short 14, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000213_000002C4:
	.short 13, 1
	.short 34, 1
	.short 254, 0

scr_seq_00000213_000002D0:
	.short 12, 1
	.short 34, 1
	.short 254, 0

scr_seq_00000213_000002DC:
	.short 12, 2
	.short 34, 1
	.short 254, 0
scr_seq_00000213_000002E8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_12C
	gotoif eq, scr_seq_00000213_00000306
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000213_00000306:
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000213_00000311:
	scrcmd_609
	lockall
	scrcmd_105 16384, 16385
	comparevartovalue VAR_TEMP_x4001, 8
	gotoif ne, scr_seq_00000213_00000336
	apply_movement 1, scr_seq_00000213_000003F8
	goto scr_seq_00000213_0000033E

scr_seq_00000213_00000336:
	apply_movement 1, scr_seq_00000213_00000404
scr_seq_00000213_0000033E:
	wait_movement
	comparevartovalue VAR_TEMP_x4001, 8
	gotoif ne, scr_seq_00000213_0000035B
	apply_movement 1, scr_seq_00000213_00000410
	goto scr_seq_00000213_0000037E

scr_seq_00000213_0000035B:
	comparevartovalue VAR_TEMP_x4001, 10
	gotoif ne, scr_seq_00000213_00000376
	apply_movement 1, scr_seq_00000213_00000420
	goto scr_seq_00000213_0000037E

scr_seq_00000213_00000376:
	apply_movement 1, scr_seq_00000213_00000430
scr_seq_00000213_0000037E:
	wait_movement
	msgbox 2
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	apply_movement 1, scr_seq_00000213_00000440
	apply_movement 255, scr_seq_00000213_00000448
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	wait 16, VAR_SPECIAL_x800C
	comparevartovalue VAR_TEMP_x4001, 8
	gotoif ne, scr_seq_00000213_000003CC
	apply_movement 1, scr_seq_00000213_00000458
	goto scr_seq_00000213_000003EF

scr_seq_00000213_000003CC:
	comparevartovalue VAR_TEMP_x4001, 10
	gotoif ne, scr_seq_00000213_000003E7
	apply_movement 1, scr_seq_00000213_00000464
	goto scr_seq_00000213_000003EF

scr_seq_00000213_000003E7:
	apply_movement 1, scr_seq_00000213_00000470
scr_seq_00000213_000003EF:
	wait_movement
	releaseall
	end

scr_seq_00000213_000003F5:
	.byte 0x00, 0x00, 0x00

scr_seq_00000213_000003F8:
	.short 32, 1
	.short 75, 1
	.short 254, 0

scr_seq_00000213_00000404:
	.short 33, 1
	.short 75, 1
	.short 254, 0

scr_seq_00000213_00000410:
	.short 18, 1
	.short 16, 1
	.short 39, 1
	.short 254, 0

scr_seq_00000213_00000420:
	.short 18, 1
	.short 17, 1
	.short 39, 1
	.short 254, 0

scr_seq_00000213_00000430:
	.short 18, 1
	.short 17, 2
	.short 39, 1
	.short 254, 0

scr_seq_00000213_00000440:
	.short 15, 1
	.short 254, 0

scr_seq_00000213_00000448:
	.short 71, 1
	.short 15, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000213_00000458:
	.short 13, 1
	.short 35, 1
	.short 254, 0

scr_seq_00000213_00000464:
	.short 12, 1
	.short 35, 1
	.short 254, 0

scr_seq_00000213_00000470:
	.short 12, 2
	.short 35, 1
	.short 254, 0
scr_seq_00000213_0000047C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_12B
	gotoif eq, scr_seq_00000213_0000049A
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000213_0000049A:
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000213_000004A5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_147 26, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000213_00000553
	comparevartovalue VAR_TEMP_x4005, 1
	gotoif ge, scr_seq_00000213_00000548
	msgbox 7
scr_seq_00000213_000004D0:
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000213_000004F4
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_00000213_00000537
	end

scr_seq_00000213_000004F4:
	scrcmd_190 0
	msgbox 8
	scrcmd_078 1206
	scrcmd_079
	scrcmd_146 26
	msgbox 9
	waitbutton
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	setflag FLAG_UNK_270
	scrcmd_101 3
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000213_00000537:
	setvar VAR_TEMP_x4005, 1
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000213_00000548:
	msgbox 11
	goto scr_seq_00000213_000004D0

scr_seq_00000213_00000551:
	.byte 0x02, 0x00
scr_seq_00000213_00000553:
	msgbox 12
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000213_000005B4
	scrcmd_618 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000213_000005BF
	msgbox 13
	closemsg
	setflag FLAG_UNK_189
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_615 70
	faceplayer
	lockall
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	clearflag FLAG_UNK_189
	msgbox 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000213_000005B4:
	msgbox 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000213_000005BF:
	msgbox 16
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
