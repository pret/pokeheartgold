#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000838_000008A8 ; 000
	scrdef scr_seq_00000838_000000A3 ; 001
	scrdef scr_seq_00000838_000000B7 ; 002
	scrdef scr_seq_00000838_000000CB ; 003
	scrdef scr_seq_00000838_000000DF ; 004
	scrdef scr_seq_00000838_000000F3 ; 005
	scrdef scr_seq_00000838_00000022 ; 006
	scrdef scr_seq_00000838_0000083A ; 007
	scrdef_end

scr_seq_00000838_00000022:
	setflag FLAG_UNK_283
	setflag FLAG_UNK_284
	setflag FLAG_UNK_285
	setflag FLAG_UNK_286
	setflag FLAG_UNK_287
	scrcmd_673 16384, 16385, 16386, 16387, 16388
	comparevartovalue VAR_TEMP_x4000, 0
	callif eq, scr_seq_00000838_00000085
	comparevartovalue VAR_TEMP_x4001, 0
	callif eq, scr_seq_00000838_0000008B
	comparevartovalue VAR_TEMP_x4002, 0
	callif eq, scr_seq_00000838_00000091
	comparevartovalue VAR_TEMP_x4003, 0
	callif eq, scr_seq_00000838_00000097
	comparevartovalue VAR_TEMP_x4004, 0
	callif eq, scr_seq_00000838_0000009D
	end

scr_seq_00000838_00000085:
	clearflag FLAG_UNK_283
	return

scr_seq_00000838_0000008B:
	clearflag FLAG_UNK_284
	return

scr_seq_00000838_00000091:
	clearflag FLAG_UNK_285
	return

scr_seq_00000838_00000097:
	clearflag FLAG_UNK_286
	return

scr_seq_00000838_0000009D:
	clearflag FLAG_UNK_287
	return

scr_seq_00000838_000000A3:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8004, 1
	goto scr_seq_00000838_00000107

scr_seq_00000838_000000B5:
	.byte 0x02, 0x00
scr_seq_00000838_000000B7:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8004, 4
	goto scr_seq_00000838_00000107

scr_seq_00000838_000000C9:
	.byte 0x02, 0x00
scr_seq_00000838_000000CB:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8004, 3
	goto scr_seq_00000838_00000107

scr_seq_00000838_000000DD:
	.byte 0x02, 0x00
scr_seq_00000838_000000DF:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8004, 2
	goto scr_seq_00000838_00000107

scr_seq_00000838_000000F1:
	.byte 0x02, 0x00
scr_seq_00000838_000000F3:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8004, 5
	goto scr_seq_00000838_00000107

scr_seq_00000838_00000105:
	.byte 0x02, 0x00
scr_seq_00000838_00000107:
	scrcmd_389 32780, 479
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000838_000007D8
	comparevartovalue VAR_SPECIAL_x8004, 1
	callif eq, scr_seq_00000838_00000724
	comparevartovalue VAR_SPECIAL_x8004, 3
	callif eq, scr_seq_00000838_00000729
	comparevartovalue VAR_SPECIAL_x8004, 2
	callif eq, scr_seq_00000838_0000072E
	comparevartovalue VAR_SPECIAL_x8004, 4
	callif eq, scr_seq_00000838_00000733
	comparevartovalue VAR_SPECIAL_x8004, 5
	callif eq, scr_seq_00000838_00000738
	scrcmd_674 32771, 32780
	comparevartovalue VAR_SPECIAL_x8003, 1
	gotoif ge, scr_seq_00000838_000001E5
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000838_0000073D
	goto scr_seq_00000838_00000189

scr_seq_00000838_00000187:
	.byte 0x02, 0x00
scr_seq_00000838_00000189:
	comparevartovalue VAR_SPECIAL_x8004, 1
	callif eq, scr_seq_00000838_000006FC
	comparevartovalue VAR_SPECIAL_x8004, 3
	callif eq, scr_seq_00000838_00000704
	comparevartovalue VAR_SPECIAL_x8004, 2
	callif eq, scr_seq_00000838_0000070C
	comparevartovalue VAR_SPECIAL_x8004, 4
	callif eq, scr_seq_00000838_00000714
	comparevartovalue VAR_SPECIAL_x8004, 5
	callif eq, scr_seq_00000838_0000071C
	scrcmd_632 32780, 479
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000838_000003B2
	goto scr_seq_00000838_000003C0

scr_seq_00000838_000001E3:
	.byte 0x02, 0x00
scr_seq_00000838_000001E5:
	scrcmd_746
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 15, 255, 0
	scrcmd_751 14, 255, 1
	scrcmd_751 16, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000838_00000189
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000838_00000231
	goto scr_seq_00000838_0000073D

scr_seq_00000838_0000022F:
	.byte 0x02
	.byte 0x00
scr_seq_00000838_00000231:
	scrcmd_674 32771, 32780
	copyvar VAR_SPECIAL_x8000, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8003, 2
	gotoif ge, scr_seq_00000838_00000332
	goto scr_seq_00000838_00000252

scr_seq_00000838_00000250:
	.byte 0x02, 0x00
scr_seq_00000838_00000252:
	scrcmd_199 0, VAR_SPECIAL_x8000
	msgbox 11
	scrcmd_675 32768, 0, 0, 0
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	closemsg
	scrcmd_676 32768, 32772
	comparevartovalue VAR_SPECIAL_x8004, 1
	callif eq, scr_seq_00000838_00000300
	comparevartovalue VAR_SPECIAL_x8004, 3
	callif eq, scr_seq_00000838_0000030A
	comparevartovalue VAR_SPECIAL_x8004, 2
	callif eq, scr_seq_00000838_00000314
	comparevartovalue VAR_SPECIAL_x8004, 4
	callif eq, scr_seq_00000838_0000031E
	comparevartovalue VAR_SPECIAL_x8004, 5
	callif eq, scr_seq_00000838_00000328
	goto scr_seq_00000838_000002C1

scr_seq_00000838_000002BF:
	.byte 0x02
	.byte 0x00
scr_seq_00000838_000002C1:
	scrcmd_815 0
	scrcmd_105 32774, 32775
	scrcmd_386 32780
	scrcmd_176 403, 0, 32774, 32775, 32780
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	scrcmd_490 16395
	comparevartovalue VAR_TEMP_x400A, 1
	callif eq, scr_seq_00000838_000007BA
	goto scr_seq_00000838_000008A4

scr_seq_00000838_000002FE:
	.byte 0x02, 0x00
scr_seq_00000838_00000300:
	clearflag FLAG_UNK_283
	scrcmd_100 0
	return

scr_seq_00000838_0000030A:
	clearflag FLAG_UNK_285
	scrcmd_100 2
	return

scr_seq_00000838_00000314:
	clearflag FLAG_UNK_284
	scrcmd_100 3
	return

scr_seq_00000838_0000031E:
	clearflag FLAG_UNK_286
	scrcmd_100 1
	return

scr_seq_00000838_00000328:
	clearflag FLAG_UNK_287
	scrcmd_100 4
	return

scr_seq_00000838_00000332:
	msgbox 7
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	closemsg
	scrcmd_349
	scrcmd_351 32768
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	comparevartovalue VAR_SPECIAL_x8000, 255
	gotoif eq, scr_seq_00000838_000003AC
	scrcmd_354 32768, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000838_0000041A
	comparevartovalue VAR_SPECIAL_x800C, 479
	gotoif ne, scr_seq_00000838_00000427
	scrcmd_676 32768, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000838_0000039F
	goto scr_seq_00000838_00000252

scr_seq_00000838_0000039D:
	.byte 0x02, 0x00
scr_seq_00000838_0000039F:
	msgbox 17
	waitbutton
	goto scr_seq_00000838_0000089C

scr_seq_00000838_000003AA:
	.byte 0x02, 0x00
scr_seq_00000838_000003AC:
	scrcmd_747
	releaseall
	end

scr_seq_00000838_000003B2:
	scrcmd_647 32768, 479
	goto scr_seq_00000838_00000434

scr_seq_00000838_000003BE:
	.byte 0x02, 0x00
scr_seq_00000838_000003C0:
	msgbox 7
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	closemsg
	scrcmd_349
	scrcmd_351 32768
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	comparevartovalue VAR_SPECIAL_x8000, 255
	gotoif eq, scr_seq_00000838_0000073D
	scrcmd_354 32768, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000838_0000041A
	comparevartovalue VAR_SPECIAL_x800C, 479
	gotoif ne, scr_seq_00000838_00000427
	goto scr_seq_00000838_00000434

scr_seq_00000838_00000418:
	.byte 0x02, 0x00
scr_seq_00000838_0000041A:
	msgbox 8
	waitbutton
	goto scr_seq_00000838_0000089C

scr_seq_00000838_00000425:
	.byte 0x02, 0x00
scr_seq_00000838_00000427:
	msgbox 9
	waitbutton
	goto scr_seq_00000838_0000089C

scr_seq_00000838_00000432:
	.byte 0x02, 0x00
scr_seq_00000838_00000434:
	scrcmd_140 32780, 315, 32768
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000838_000004BE
	scrcmd_140 32780, 59, 32768
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000838_000004BE
	scrcmd_140 32780, 56, 32768
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000838_000004BE
	scrcmd_140 32780, 403, 32768
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000838_000004BE
	scrcmd_140 32780, 437, 32768
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000838_000004BE
	scrcmd_396 32780, 32768
	copyvar VAR_SPECIAL_x8002, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, scr_seq_00000838_0000051C
	goto scr_seq_00000838_000004CC

scr_seq_00000838_000004BC:
	.byte 0x02, 0x00
scr_seq_00000838_000004BE:
	setvar VAR_SPECIAL_x8002, 0
	goto scr_seq_00000838_000004CC

scr_seq_00000838_000004CA:
	.byte 0x02, 0x00
scr_seq_00000838_000004CC:
	scrcmd_490 16389
	scrcmd_529 16384
	scrcmd_354 16384, 16385
	comparevartovalue VAR_TEMP_x4001, 479
	gotoif ne, scr_seq_00000838_0000050C
	comparevartovar VAR_TEMP_x4000, VAR_SPECIAL_x8000
	gotoif ne, scr_seq_00000838_00000506
	scrcmd_099 253
	apply_movement 253, scr_seq_00000838_000006F0
	wait_movement
	scrcmd_098 253
scr_seq_00000838_00000506:
	setvar VAR_TEMP_x400A, 1
scr_seq_00000838_0000050C:
	scrcmd_199 0, VAR_SPECIAL_x8000
	msgbox 10
	goto scr_seq_00000838_00000671

scr_seq_00000838_0000051A:
	.byte 0x02, 0x00
scr_seq_00000838_0000051C:
	scrcmd_490 16391
	scrcmd_529 16384
	scrcmd_354 16384, 16385
	comparevartovalue VAR_TEMP_x4001, 479
	gotoif ne, scr_seq_00000838_00000564
	scrcmd_490 16384
	scrcmd_490 32768
	comparevartovar VAR_TEMP_x4000, VAR_SPECIAL_x8000
	gotoif ne, scr_seq_00000838_0000055E
	scrcmd_099 253
	apply_movement 253, scr_seq_00000838_000006F0
	wait_movement
	scrcmd_098 253
scr_seq_00000838_0000055E:
	setvar VAR_TEMP_x400A, 1
scr_seq_00000838_00000564:
	scrcmd_199 0, VAR_SPECIAL_x8000
	scrcmd_197 1, 32769
	msgbox 0
	scrcmd_748 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000838_00000649
	goto scr_seq_00000838_0000058A

scr_seq_00000838_00000588:
	.byte 0x02, 0x00
scr_seq_00000838_0000058A:
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	closemsg
	scrcmd_352 1, 32768, 32769
	scrcmd_353 1, 32770
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	comparevartovalue VAR_SPECIAL_x8002, 4
	gotoif eq, scr_seq_00000838_00000628
	scrcmd_398 32780, 32768, 32770
	scrcmd_197 1, 32780
	msgbox 3
	scrcmd_748 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000838_00000649
	scrcmd_199 0, VAR_SPECIAL_x8000
	scrcmd_398 32780, 32768, 32770
	scrcmd_197 1, 32780
	msgbox 4
	play_se SEQ_SE_DP_KON
	wait_se SEQ_SE_DP_KON
	wait 30, VAR_SPECIAL_x800C
	msgbox 5
	wait 32, VAR_SPECIAL_x800C
	scrcmd_197 1, 32769
	msgbox 6
	scrcmd_078 1184
	scrcmd_079
	wait 16, VAR_SPECIAL_x800C
	goto scr_seq_00000838_00000671

scr_seq_00000838_00000626:
	.byte 0x02, 0x00
scr_seq_00000838_00000628:
	scrcmd_197 1, 32769
	msgbox 1
	scrcmd_748 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000838_0000058A
	goto scr_seq_00000838_00000649

scr_seq_00000838_00000647:
	.byte 0x02, 0x00
scr_seq_00000838_00000649:
	scrcmd_199 0, VAR_SPECIAL_x8000
	scrcmd_197 1, 32769
	msgbox 2
	waitbutton
	comparevartovalue VAR_TEMP_x400A, 1
	callif eq, scr_seq_00000838_000007BA
	scrcmd_490 16397
	goto scr_seq_00000838_0000089C

scr_seq_00000838_0000066F:
	.byte 0x02
	.byte 0x00
scr_seq_00000838_00000671:
	scrcmd_675 32768, 32770, 32769, 32772
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	closemsg
	comparevartovalue VAR_SPECIAL_x8004, 1
	callif eq, scr_seq_00000838_000006D2
	comparevartovalue VAR_SPECIAL_x8004, 4
	callif eq, scr_seq_00000838_000006D8
	comparevartovalue VAR_SPECIAL_x8004, 3
	callif eq, scr_seq_00000838_000006DE
	comparevartovalue VAR_SPECIAL_x8004, 2
	callif eq, scr_seq_00000838_000006E4
	comparevartovalue VAR_SPECIAL_x8004, 5
	callif eq, scr_seq_00000838_000006EA
	goto scr_seq_00000838_000002C1

scr_seq_00000838_000006D0:
	.byte 0x02, 0x00
scr_seq_00000838_000006D2:
	scrcmd_101 0
	return

scr_seq_00000838_000006D8:
	scrcmd_101 1
	return

scr_seq_00000838_000006DE:
	scrcmd_101 2
	return

scr_seq_00000838_000006E4:
	scrcmd_101 3
	return

scr_seq_00000838_000006EA:
	scrcmd_101 4
	return


scr_seq_00000838_000006F0:
	.short 45, 2
	.short 69, 1
	.short 254, 0
scr_seq_00000838_000006FC:
	setvar VAR_SPECIAL_x8001, 315
	return

scr_seq_00000838_00000704:
	setvar VAR_SPECIAL_x8001, 59
	return

scr_seq_00000838_0000070C:
	setvar VAR_SPECIAL_x8001, 56
	return

scr_seq_00000838_00000714:
	setvar VAR_SPECIAL_x8001, 403
	return

scr_seq_00000838_0000071C:
	setvar VAR_SPECIAL_x8001, 437
	return

scr_seq_00000838_00000724:
	msgbox 21
	return

scr_seq_00000838_00000729:
	msgbox 24
	return

scr_seq_00000838_0000072E:
	msgbox 27
	return

scr_seq_00000838_00000733:
	msgbox 30
	return

scr_seq_00000838_00000738:
	msgbox 33
	return

scr_seq_00000838_0000073D:
	comparevartovalue VAR_SPECIAL_x8004, 1
	callif eq, scr_seq_00000838_00000797
	comparevartovalue VAR_SPECIAL_x8004, 3
	callif eq, scr_seq_00000838_0000079E
	comparevartovalue VAR_SPECIAL_x8004, 2
	callif eq, scr_seq_00000838_000007A5
	comparevartovalue VAR_SPECIAL_x8004, 4
	callif eq, scr_seq_00000838_000007AC
	comparevartovalue VAR_SPECIAL_x8004, 5
	callif eq, scr_seq_00000838_000007B3
	comparevartovalue VAR_TEMP_x400A, 1
	callif eq, scr_seq_00000838_000007BA
	scrcmd_490 16390
	goto scr_seq_00000838_0000089C

scr_seq_00000838_00000795:
	.byte 0x02, 0x00
scr_seq_00000838_00000797:
	msgbox 22
	waitbutton
	return

scr_seq_00000838_0000079E:
	msgbox 25
	waitbutton
	return

scr_seq_00000838_000007A5:
	msgbox 28
	waitbutton
	return

scr_seq_00000838_000007AC:
	msgbox 31
	waitbutton
	return

scr_seq_00000838_000007B3:
	msgbox 34
	waitbutton
	return

scr_seq_00000838_000007BA:
	scrcmd_099 253
	apply_movement 253, scr_seq_00000838_000007D0
	wait_movement
	scrcmd_098 253
	return

scr_seq_00000838_000007CE:
	.byte 0x00, 0x00

scr_seq_00000838_000007D0:
	.short 70, 1
	.short 254, 0
scr_seq_00000838_000007D8:
	comparevartovalue VAR_SPECIAL_x8004, 1
	callif eq, scr_seq_00000838_00000821
	comparevartovalue VAR_SPECIAL_x8004, 3
	callif eq, scr_seq_00000838_00000826
	comparevartovalue VAR_SPECIAL_x8004, 2
	callif eq, scr_seq_00000838_0000082B
	comparevartovalue VAR_SPECIAL_x8004, 4
	callif eq, scr_seq_00000838_00000830
	comparevartovalue VAR_SPECIAL_x8004, 5
	callif eq, scr_seq_00000838_00000835
	goto scr_seq_00000838_0000089C

scr_seq_00000838_0000081F:
	.byte 0x02
	.byte 0x00
scr_seq_00000838_00000821:
	msgbox 20
	return

scr_seq_00000838_00000826:
	msgbox 23
	return

scr_seq_00000838_0000082B:
	msgbox 26
	return

scr_seq_00000838_00000830:
	msgbox 29
	return

scr_seq_00000838_00000835:
	msgbox 32
	return

scr_seq_00000838_0000083A:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_674 32771, 32780
	comparevartovalue VAR_SPECIAL_x8003, 0
	gotoif eq, scr_seq_00000838_0000088D
	msgbox 13
	scrcmd_746
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 14, 255, 0
	scrcmd_751 19, 255, 1
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000838_00000231
	goto scr_seq_00000838_0000089C

scr_seq_00000838_0000088B:
	.byte 0x02, 0x00
scr_seq_00000838_0000088D:
	msgbox 18
	waitbutton
	closemsg
	goto scr_seq_00000838_000008A4

scr_seq_00000838_0000089A:
	.byte 0x02, 0x00
scr_seq_00000838_0000089C:
	scrcmd_747
	closemsg
	releaseall
	end

scr_seq_00000838_000008A4:
	releaseall
	end

scr_seq_00000838_000008A8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 35
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
