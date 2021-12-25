#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000237_00000036 ; 000
	scrdef scr_seq_00000237_000000DF ; 001
	scrdef scr_seq_00000237_000005EC ; 002
	scrdef scr_seq_00000237_0000015C ; 003
	scrdef scr_seq_00000237_000007B8 ; 004
	scrdef scr_seq_00000237_0000095C ; 005
	scrdef scr_seq_00000237_000009FC ; 006
	scrdef scr_seq_00000237_00000A25 ; 007
	scrdef scr_seq_00000237_00000A4E ; 008
	scrdef scr_seq_00000237_00000A74 ; 009
	scrdef scr_seq_00000237_00000A89 ; 010
	scrdef scr_seq_00000237_00000A9E ; 011
	scrdef scr_seq_00000237_000005FF ; 012
	scrdef_end

scr_seq_00000237_00000036:
	scrcmd_144 16416
	scrcmd_388 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_00000237_00000057
	scrcmd_340 10, 16
	goto scr_seq_00000237_0000005D

scr_seq_00000237_00000057:
	scrcmd_340 10, 15
scr_seq_00000237_0000005D:
	checkflag FLAG_UNK_189
	gotoif lt, scr_seq_00000237_0000006E
	clearflag FLAG_UNK_189
	end

scr_seq_00000237_0000006E:
	scrcmd_294 2, 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_00000237_0000009F
	scrcmd_484 16384
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, scr_seq_00000237_000000A9
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, scr_seq_00000237_000000A9
scr_seq_00000237_0000009F:
	setflag FLAG_UNK_27E
	goto scr_seq_00000237_000000AD

scr_seq_00000237_000000A9:
	clearflag FLAG_UNK_27E
scr_seq_00000237_000000AD:
	scrcmd_379 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, scr_seq_00000237_000000D5
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, scr_seq_00000237_000000D5
	clearflag FLAG_UNK_1D1
	setflag FLAG_UNK_1D2
	end

scr_seq_00000237_000000D5:
	clearflag FLAG_UNK_1D2
	setflag FLAG_UNK_1D1
	end

scr_seq_00000237_000000DF:
	scrcmd_609
	lockall
	apply_movement 10, scr_seq_00000237_00000130
	apply_movement 255, scr_seq_00000237_00000140
	wait_movement
	msgbox 46
	scrcmd_190 0
	scrcmd_146 6
	msgbox 47
	scrcmd_078 1206
	scrcmd_079
	scrcmd_146 7
	msgbox 48
	scrcmd_078 1206
	scrcmd_079
	msgbox 49
	closemsg
	apply_movement 10, scr_seq_00000237_0000014C
	wait_movement
	setvar VAR_UNK_408E, 3
	releaseall
	end

scr_seq_00000237_0000012E:
	.byte 0x00, 0x00

scr_seq_00000237_00000130:
	.short 75, 1
	.short 13, 1
	.short 15, 2
	.short 254, 0

scr_seq_00000237_00000140:
	.short 63, 3
	.short 34, 1
	.short 254, 0

scr_seq_00000237_0000014C:
	.short 14, 2
	.short 12, 1
	.short 33, 1
	.short 254, 0
scr_seq_00000237_0000015C:
	scrcmd_609
	lockall
	scrcmd_132 36, 41
	closemsg
	apply_movement 10, scr_seq_00000237_00000510
	wait_movement
	callstd 2029
	apply_movement 11, scr_seq_00000237_0000049C
	apply_movement 12, scr_seq_00000237_000004B0
	wait_movement
	apply_movement 10, scr_seq_00000237_00000500
	wait_movement
	scrcmd_132 37, 42
	closemsg
	apply_movement 11, scr_seq_00000237_000004F8
	wait_movement
	scrcmd_105 32772, 32773
	scrcmd_190 0
	comparevartovalue VAR_SPECIAL_x8004, 368
	gotoif ne, scr_seq_00000237_000001D4
	apply_movement 11, scr_seq_00000237_000004C0
	apply_movement 12, scr_seq_00000237_000004CC
	apply_movement 10, scr_seq_00000237_00000494
	goto scr_seq_00000237_00000207

scr_seq_00000237_000001D4:
	comparevartovalue VAR_SPECIAL_x8004, 369
	gotoif ne, scr_seq_00000237_000001FF
	apply_movement 11, scr_seq_00000237_000004C0
	apply_movement 12, scr_seq_00000237_000004CC
	apply_movement 10, scr_seq_00000237_00000494
	goto scr_seq_00000237_00000207

scr_seq_00000237_000001FF:
	apply_movement 11, scr_seq_00000237_00000518
scr_seq_00000237_00000207:
	wait_movement
	scrcmd_132 38, 43
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_SPECIAL_x8004, 363
	gotoif ne, scr_seq_00000237_00000234
	apply_movement 255, scr_seq_00000237_00000528
	goto scr_seq_00000237_000002C3

scr_seq_00000237_00000234:
	comparevartovalue VAR_SPECIAL_x8004, 364
	gotoif ne, scr_seq_00000237_0000024F
	apply_movement 255, scr_seq_00000237_00000534
	goto scr_seq_00000237_000002C3

scr_seq_00000237_0000024F:
	comparevartovalue VAR_SPECIAL_x8004, 365
	gotoif ne, scr_seq_00000237_0000026A
	apply_movement 255, scr_seq_00000237_0000053C
	goto scr_seq_00000237_000002C3

scr_seq_00000237_0000026A:
	comparevartovalue VAR_SPECIAL_x8004, 366
	gotoif ne, scr_seq_00000237_00000285
	apply_movement 255, scr_seq_00000237_00000548
	goto scr_seq_00000237_000002C3

scr_seq_00000237_00000285:
	comparevartovalue VAR_SPECIAL_x8004, 367
	gotoif ne, scr_seq_00000237_000002A0
	apply_movement 255, scr_seq_00000237_00000554
	goto scr_seq_00000237_000002C3

scr_seq_00000237_000002A0:
	comparevartovalue VAR_SPECIAL_x8004, 368
	gotoif ne, scr_seq_00000237_000002BB
	apply_movement 255, scr_seq_00000237_00000560
	goto scr_seq_00000237_000002C3

scr_seq_00000237_000002BB:
	apply_movement 255, scr_seq_00000237_0000056C
scr_seq_00000237_000002C3:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	comparevartovalue VAR_SPECIAL_x8004, 368
	gotoif ne, scr_seq_00000237_000002EA
	apply_movement 11, scr_seq_00000237_00000510
	goto scr_seq_00000237_0000030D

scr_seq_00000237_000002EA:
	comparevartovalue VAR_SPECIAL_x8004, 369
	gotoif ne, scr_seq_00000237_00000305
	apply_movement 11, scr_seq_00000237_00000510
	goto scr_seq_00000237_0000030D

scr_seq_00000237_00000305:
	apply_movement 11, scr_seq_00000237_00000508
scr_seq_00000237_0000030D:
	wait_movement
	scrcmd_190 0
	scrcmd_132 39, 44
	closemsg
	comparevartovalue VAR_SPECIAL_x8004, 368
	gotoif ne, scr_seq_00000237_0000033B
	apply_movement 11, scr_seq_00000237_000004D4
	apply_movement 12, scr_seq_00000237_000004E8
	goto scr_seq_00000237_0000036E

scr_seq_00000237_0000033B:
	comparevartovalue VAR_SPECIAL_x8004, 369
	gotoif ne, scr_seq_00000237_0000035E
	apply_movement 11, scr_seq_00000237_000004D4
	apply_movement 12, scr_seq_00000237_000004E8
	goto scr_seq_00000237_0000036E

scr_seq_00000237_0000035E:
	apply_movement 11, scr_seq_00000237_000004E0
	apply_movement 12, scr_seq_00000237_000004F0
scr_seq_00000237_0000036E:
	wait_movement
	scrcmd_190 0
	scrcmd_132 40, 45
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_SPECIAL_x8004, 368
	gotoif ne, scr_seq_00000237_000003AE
	apply_movement 11, scr_seq_00000237_00000578
	apply_movement 12, scr_seq_00000237_00000590
	apply_movement 255, scr_seq_00000237_000005A4
	goto scr_seq_00000237_000003F1

scr_seq_00000237_000003AE:
	comparevartovalue VAR_SPECIAL_x8004, 369
	gotoif ne, scr_seq_00000237_000003D9
	apply_movement 11, scr_seq_00000237_00000578
	apply_movement 12, scr_seq_00000237_00000590
	apply_movement 255, scr_seq_00000237_000005A4
	goto scr_seq_00000237_000003F1

scr_seq_00000237_000003D9:
	apply_movement 11, scr_seq_00000237_00000584
	apply_movement 12, scr_seq_00000237_00000598
	apply_movement 255, scr_seq_00000237_000005B4
scr_seq_00000237_000003F1:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_307 11, 12, 16, 26, 77
	scrcmd_310 77
	scrcmd_308 77
	apply_movement 11, scr_seq_00000237_000005C4
	apply_movement 12, scr_seq_00000237_000005D0
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000237_000005E0
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	play_se SEQ_SE_DP_KAIDAN2
	scrcmd_596 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000237_00000455
	scrcmd_600
scr_seq_00000237_00000455:
	scrcmd_174 6, 1, 0, 0
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_175
	scrcmd_309 77
	setvar VAR_UNK_408E, 1
	scrcmd_176 331, 0, 3, 12, 0
	scrcmd_582 38, 368, 411
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000237_00000492:
	.byte 0x00, 0x00

scr_seq_00000237_00000494:
	.short 33, 1
	.short 254, 0

scr_seq_00000237_0000049C:
	.short 13, 6
	.short 15, 3
	.short 13, 2
	.short 35, 1
	.short 254, 0

scr_seq_00000237_000004B0:
	.short 13, 7
	.short 15, 3
	.short 13, 1
	.short 254, 0

scr_seq_00000237_000004C0:
	.short 13, 1
	.short 35, 1
	.short 254, 0

scr_seq_00000237_000004CC:
	.short 13, 1
	.short 254, 0

scr_seq_00000237_000004D4:
	.short 15, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000237_000004E0:
	.short 13, 1
	.short 254, 0

scr_seq_00000237_000004E8:
	.short 13, 1
	.short 254, 0

scr_seq_00000237_000004F0:
	.short 13, 1
	.short 254, 0

scr_seq_00000237_000004F8:
	.short 75, 1
	.short 254, 0

scr_seq_00000237_00000500:
	.short 34, 1
	.short 254, 0

scr_seq_00000237_00000508:
	.short 35, 1
	.short 254, 0

scr_seq_00000237_00000510:
	.short 32, 1
	.short 254, 0

scr_seq_00000237_00000518:
	.short 33, 1
	.short 254, 0
	.byte 0x45, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_00000237_00000528:
	.short 15, 1
	.short 12, 1
	.short 254, 0

scr_seq_00000237_00000534:
	.short 12, 1
	.short 254, 0

scr_seq_00000237_0000053C:
	.short 14, 1
	.short 12, 1
	.short 254, 0

scr_seq_00000237_00000548:
	.short 14, 2
	.short 12, 1
	.short 254, 0

scr_seq_00000237_00000554:
	.short 14, 3
	.short 12, 1
	.short 254, 0

scr_seq_00000237_00000560:
	.short 14, 3
	.short 12, 1
	.short 254, 0

scr_seq_00000237_0000056C:
	.short 14, 4
	.short 12, 1
	.short 254, 0

scr_seq_00000237_00000578:
	.short 15, 3
	.short 32, 1
	.short 254, 0

scr_seq_00000237_00000584:
	.short 15, 4
	.short 32, 1
	.short 254, 0

scr_seq_00000237_00000590:
	.short 15, 3
	.short 254, 0

scr_seq_00000237_00000598:
	.short 13, 1
	.short 15, 3
	.short 254, 0

scr_seq_00000237_000005A4:
	.short 63, 1
	.short 15, 3
	.short 32, 1
	.short 254, 0

scr_seq_00000237_000005B4:
	.short 63, 1
	.short 15, 4
	.short 32, 1
	.short 254, 0

scr_seq_00000237_000005C4:
	.short 12, 1
	.short 69, 1
	.short 254, 0

scr_seq_00000237_000005D0:
	.short 15, 1
	.short 12, 1
	.short 69, 1
	.short 254, 0

scr_seq_00000237_000005E0:
	.short 12, 2
	.short 69, 1
	.short 254, 0
scr_seq_00000237_000005EC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000237_000005FF:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, 32780
	scrcmd_440 32780, 0
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000237_00000727
	scrcmd_618 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000237_0000073B
	scrcmd_438 2, 32780
	scrcmd_440 32780, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000237_00000678
	apply_movement 255, scr_seq_00000237_00000750
	apply_movement 15, scr_seq_00000237_0000079C
	goto scr_seq_00000237_000006C6

scr_seq_00000237_00000678:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000237_00000693
	apply_movement 255, scr_seq_00000237_00000768
	goto scr_seq_00000237_000006C6

scr_seq_00000237_00000693:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000237_000006B6
	apply_movement 255, scr_seq_00000237_00000788
	apply_movement 15, scr_seq_00000237_0000079C
	goto scr_seq_00000237_000006C6

scr_seq_00000237_000006B6:
	apply_movement 255, scr_seq_00000237_00000774
	apply_movement 15, scr_seq_00000237_0000079C
scr_seq_00000237_000006C6:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000237_000006ED
	apply_movement 253, scr_seq_00000237_000007A8
	wait_movement
scr_seq_00000237_000006ED:
	setflag FLAG_UNK_189
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_615 9
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

scr_seq_00000237_00000727:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000237_0000073B:
	scrcmd_438 2, 32780
	scrcmd_440 32780, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000237_0000074F:
	.byte 0x00

scr_seq_00000237_00000750:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000237_00000768:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000237_00000774:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000237_00000788:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000237_0000079C:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000237_000007A8:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_00000237_000007B8:
	scrcmd_609
	lockall
	scrcmd_357 16387, 6
	comparevartovalue VAR_TEMP_x4003, 1
	gotoif ne, scr_seq_00000237_000007DB
	goto scr_seq_00000237_000007E1

scr_seq_00000237_000007D5:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_00000237_000007DB:
	goto scr_seq_00000237_0000087D

scr_seq_00000237_000007E1:
	apply_movement 5, scr_seq_00000237_00000918
	scrcmd_081 0
	scrcmd_080 1107
	wait_movement
	apply_movement 255, scr_seq_00000237_00000944
	wait_movement
	msgbox 19
	closemsg
	scrcmd_213 120, 0, 0, 0
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000237_00000912
	apply_movement 5, scr_seq_00000237_0000094C
	wait_movement
	msgbox 21
	closemsg
	apply_movement 6, scr_seq_00000237_00000924
	scrcmd_081 0
	scrcmd_080 1107
	wait_movement
	apply_movement 255, scr_seq_00000237_0000093C
	wait_movement
	msgbox 24
	closemsg
	scrcmd_213 417, 0, 0, 0
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000237_00000912
	apply_movement 6, scr_seq_00000237_00000954
	wait_movement
	msgbox 26
	waitbutton
	closemsg
	goto scr_seq_00000237_00000908

scr_seq_00000237_0000087B:
	.byte 0x02, 0x00
scr_seq_00000237_0000087D:
	apply_movement 5, scr_seq_00000237_00000918
	scrcmd_081 0
	scrcmd_080 1107
	wait_movement
	apply_movement 255, scr_seq_00000237_00000944
	wait_movement
	msgbox 19
	closemsg
	apply_movement 6, scr_seq_00000237_00000924
	scrcmd_080 1107
	wait_movement
	apply_movement 255, scr_seq_00000237_0000093C
	wait_movement
	msgbox 24
	closemsg
	scrcmd_213 417, 120, 0, 0
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000237_00000912
	apply_movement 5, scr_seq_00000237_0000094C
	wait_movement
	apply_movement 255, scr_seq_00000237_00000944
	wait_movement
	msgbox 21
	closemsg
	apply_movement 6, scr_seq_00000237_00000954
	wait_movement
	apply_movement 255, scr_seq_00000237_0000093C
	wait_movement
	msgbox 26
	waitbutton
	closemsg
scr_seq_00000237_00000908:
	setvar VAR_UNK_4097, 1
	releaseall
	end

scr_seq_00000237_00000912:
	scrcmd_219
	releaseall
	end


scr_seq_00000237_00000918:
	.short 75, 1
	.short 14, 4
	.short 254, 0

scr_seq_00000237_00000924:
	.short 75, 1
	.short 15, 4
	.short 254, 0

scr_seq_00000237_00000930:
	.short 75, 1
	.short 12, 2
	.short 254, 0

scr_seq_00000237_0000093C:
	.short 2, 1
	.short 254, 0

scr_seq_00000237_00000944:
	.short 3, 1
	.short 254, 0

scr_seq_00000237_0000094C:
	.short 50, 2
	.short 254, 0

scr_seq_00000237_00000954:
	.short 51, 2
	.short 254, 0
scr_seq_00000237_0000095C:
	scrcmd_609
	lockall
	setvar VAR_TEMP_x4004, 777
	apply_movement 7, scr_seq_00000237_00000930
	scrcmd_081 0
	scrcmd_080 1107
	wait_movement
	msgbox 28
	closemsg
	scrcmd_081 0
	scrcmd_213 118, 0, 0, 0
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000237_00000912
	setvar VAR_UNK_4097, 2
scr_seq_00000237_000009A0:
	msgbox 30
	setvar VAR_SPECIAL_x8004, 271
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000237_000009EE
	callstd 2033
	setvar VAR_UNK_4097, 3
	msgbox 32
	waitbutton
	closemsg
scr_seq_00000237_000009D5:
	comparevartovalue VAR_TEMP_x4004, 777
	gotoif ne, scr_seq_00000237_000009EA
	releaseall
	goto scr_seq_00000237_000009EC

scr_seq_00000237_000009EA:
	releaseall
scr_seq_00000237_000009EC:
	end

scr_seq_00000237_000009EE:
	callstd 2009
	closemsg
	goto scr_seq_00000237_000009D5

scr_seq_00000237_000009FA:
	.byte 0x02, 0x00
scr_seq_00000237_000009FC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4097, 1
	gotoif ne, scr_seq_00000237_00000A1A
	msgbox 22
	goto scr_seq_00000237_00000A1D

scr_seq_00000237_00000A1A:
	msgbox 23
scr_seq_00000237_00000A1D:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000237_00000A25:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4097, 1
	gotoif ne, scr_seq_00000237_00000A43
	msgbox 26
	goto scr_seq_00000237_00000A46

scr_seq_00000237_00000A43:
	msgbox 27
scr_seq_00000237_00000A46:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000237_00000A4E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4004, 555
	comparevartovalue VAR_UNK_4097, 2
	gotoif eq, scr_seq_00000237_000009A0
	msgbox 32
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000237_00000A74:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 34, 32780
	callstd 2000
	end

scr_seq_00000237_00000A89:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 35, 32780
	callstd 2000
	end

scr_seq_00000237_00000A9E:
	scrcmd_055 33, 1, 4, 32780
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 32780
	callstd 2000
	end
	.balign 4, 0
