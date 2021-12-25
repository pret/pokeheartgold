#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000957_00000022 ; 000
	scrdef scr_seq_00000957_00000024 ; 001
	scrdef scr_seq_00000957_00000026 ; 002
	scrdef scr_seq_00000957_0000002A ; 003
	scrdef scr_seq_00000957_000007C8 ; 004
	scrdef scr_seq_00000957_00000BE8 ; 005
	scrdef scr_seq_00000957_00000BFB ; 006
	scrdef scr_seq_00000957_00000C0D ; 007
	scrdef_end

scr_seq_00000957_00000022:
	end

scr_seq_00000957_00000024:
	end

scr_seq_00000957_00000026:
	scrcmd_270
	end

scr_seq_00000957_0000002A:
	play_se SEQ_SE_DP_SELECT
	scrcmd_609
	lockall
	faceplayer
	scrcmd_268 32780
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 5
	gotoif eq, scr_seq_00000957_00000499
	scrcmd_264 0
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_00000957_000004AF
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_00000957_000005DB
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, scr_seq_00000957_00000528
	scrcmd_274 32772, 32780
	scrcmd_268 32780
	comparevartovalue VAR_SPECIAL_x800C, 5
	gotoif eq, scr_seq_00000957_00000499
	msgbox 199
	scrcmd_269 32780
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000957_000007CC
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000957_00000488
	goto scr_seq_00000957_000000BC

scr_seq_00000957_000000BA:
	.byte 0x02, 0x00
scr_seq_00000957_000000BC:
	scrcmd_257 100
	scrcmd_267 2, 32780
	scrcmd_592 32780
	goto scr_seq_00000957_000000EC

scr_seq_00000957_000000D0:
	.byte 0x02, 0x00
scr_seq_00000957_000000D2:
	scrcmd_257 100
	scrcmd_261 11
	scrcmd_267 22, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	goto scr_seq_00000957_000000EC

scr_seq_00000957_000000EA:
	.byte 0x02, 0x00
scr_seq_00000957_000000EC:
	scrcmd_064 31, 3, 0, 1, VAR_SPECIAL_x800C
	scrcmd_841 1
	scrcmd_066 168, 0
	scrcmd_066 59, 1
	scrcmd_066 52, 2
	scrcmd_066 23, 3
	scrcmd_066 142, 4
	scrcmd_066 141, 5
	scrcmd_066 24, 99
	scrcmd_585
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000957_00000184
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000957_00000336
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000957_00000276
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000957_000001ED
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000957_00000396
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_00000957_000003F6
	comparevartovalue VAR_SPECIAL_x8008, 7
	gotoif eq, scr_seq_00000957_000007A0
	scrcmd_271 0, 7
	goto scr_seq_00000957_00000784

scr_seq_00000957_00000182:
	.byte 0x02, 0x00
scr_seq_00000957_00000184:
	scrcmd_271 0, 1
	scrcmd_267 9, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000957_000001A1
	scrcmd_046 VAR_SPECIAL_x800C
scr_seq_00000957_000001A1:
	scrcmd_272 32780
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif eq, scr_seq_00000957_000006AE
	scrcmd_261 5
	scrcmd_267 1, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	scrcmd_257 1
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_160
	scrcmd_150
	call scr_seq_00000957_00000BDA
	message 16
	goto scr_seq_00000957_000000D2

scr_seq_00000957_000001EB:
	.byte 0x02, 0x00
scr_seq_00000957_000001ED:
	scrcmd_356 32780
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif lt, scr_seq_00000957_00000264
	scrcmd_271 0, 3
	scrcmd_267 9, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000957_0000021B
	scrcmd_046 VAR_SPECIAL_x800C
scr_seq_00000957_0000021B:
	scrcmd_272 32780
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif eq, scr_seq_00000957_000006F6
	scrcmd_261 7
	scrcmd_267 1, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	scrcmd_257 3
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_161
	scrcmd_150
	call scr_seq_00000957_00000BDA
	goto scr_seq_00000957_000000D2

scr_seq_00000957_00000262:
	.byte 0x02, 0x00
scr_seq_00000957_00000264:
	scrcmd_267 20, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	goto scr_seq_00000957_000000D2

scr_seq_00000957_00000274:
	.byte 0x02, 0x00
scr_seq_00000957_00000276:
	scrcmd_434 32780, 30
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif lt, scr_seq_00000957_00000324
	scrcmd_271 0, 2
	scrcmd_267 9, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000957_000002A6
	scrcmd_046 VAR_SPECIAL_x800C
scr_seq_00000957_000002A6:
	scrcmd_272 32780
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif eq, scr_seq_00000957_000006DE
	scrcmd_261 6
	scrcmd_267 1, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	scrcmd_257 2
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_350
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	msgbox 202
	scrcmd_257 102
	closemsg
	scrcmd_586 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000957_00000B8B
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_00000957_00000B8B
	scrcmd_230
	call scr_seq_00000957_00000BDA
	goto scr_seq_00000957_000000D2

scr_seq_00000957_00000322:
	.byte 0x02, 0x00
scr_seq_00000957_00000324:
	scrcmd_267 19, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	goto scr_seq_00000957_000000D2

scr_seq_00000957_00000334:
	.byte 0x02, 0x00
scr_seq_00000957_00000336:
	scrcmd_271 0, 4
	scrcmd_267 9, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000957_00000353
	scrcmd_046 VAR_SPECIAL_x800C
scr_seq_00000957_00000353:
	scrcmd_272 32780
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif eq, scr_seq_00000957_000006C6
	scrcmd_267 1, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	scrcmd_348 30
	scrcmd_257 4
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_159
	scrcmd_150
	call scr_seq_00000957_00000BDA
	goto scr_seq_00000957_00000478

scr_seq_00000957_00000394:
	.byte 0x02, 0x00
scr_seq_00000957_00000396:
	scrcmd_271 0, 5
	scrcmd_267 9, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000957_000003B3
	scrcmd_046 VAR_SPECIAL_x800C
scr_seq_00000957_000003B3:
	scrcmd_272 32780
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif eq, scr_seq_00000957_00000726
	scrcmd_267 1, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	scrcmd_348 30
	scrcmd_257 5
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_162
	scrcmd_150
	call scr_seq_00000957_00000BDA
	goto scr_seq_00000957_00000478

scr_seq_00000957_000003F4:
	.byte 0x02, 0x00
scr_seq_00000957_000003F6:
	scrcmd_359 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000957_0000074F
	scrcmd_630 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000957_00000761
	scrcmd_271 0, 6
	scrcmd_267 9, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000957_00000435
	scrcmd_046 VAR_SPECIAL_x800C
scr_seq_00000957_00000435:
	scrcmd_272 32780
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif eq, scr_seq_00000957_0000076C
	scrcmd_267 1, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	scrcmd_348 30
	scrcmd_257 6
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_629
	scrcmd_150
	call scr_seq_00000957_00000BDA
	goto scr_seq_00000957_00000478

scr_seq_00000957_00000476:
	.byte 0x02, 0x00
scr_seq_00000957_00000478:
	releaseall
	end

scr_seq_00000957_0000047C:
	.byte 0x0f, 0x01, 0x00, 0x00
	.byte 0x01, 0x00, 0x35, 0x00, 0x61, 0x00, 0x02, 0x00
scr_seq_00000957_00000488:
	msgbox 38
	wait 30, VAR_SPECIAL_x800C
	closemsg
	scrcmd_263
	releaseall
	end

scr_seq_00000957_00000499:
	scrcmd_262
	scrcmd_267 0, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	scrcmd_049
	closemsg
	scrcmd_263
	releaseall
	end

scr_seq_00000957_000004AF:
	scrcmd_262
	scrcmd_267 10, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000957_000005C3
	scrcmd_274 32772, 32780
	comparevartovalue VAR_SPECIAL_x800C, 5
	gotoif eq, scr_seq_00000957_00000488
	scrcmd_269 32780
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_00000957_00000488
	scrcmd_267 13, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_159
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	goto scr_seq_00000957_00000478

scr_seq_00000957_00000526:
	.byte 0x02, 0x00
scr_seq_00000957_00000528:
	scrcmd_262
	scrcmd_267 12, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000957_0000066C
	scrcmd_359 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000957_00000698
	scrcmd_584 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000957_00000682
	scrcmd_274 32772, 32780
	comparevartovalue VAR_SPECIAL_x800C, 5
	gotoif eq, scr_seq_00000957_00000488
	scrcmd_269 32780
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_00000957_00000488
	scrcmd_267 15, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_629
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	goto scr_seq_00000957_00000478

scr_seq_00000957_000005C1:
	.byte 0x02, 0x00
scr_seq_00000957_000005C3:
	scrcmd_267 16, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	scrcmd_263
	closemsg
	releaseall
	end

scr_seq_00000957_000005DB:
	scrcmd_262
	scrcmd_267 11, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000957_00000654
	scrcmd_274 32772, 32780
	comparevartovalue VAR_SPECIAL_x800C, 5
	gotoif eq, scr_seq_00000957_00000488
	scrcmd_269 32780
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_00000957_00000488
	scrcmd_267 14, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_162
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	goto scr_seq_00000957_00000478

scr_seq_00000957_00000652:
	.byte 0x02, 0x00
scr_seq_00000957_00000654:
	scrcmd_267 17, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	closemsg
	scrcmd_263
	releaseall
	end

scr_seq_00000957_0000066C:
	scrcmd_267 18, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	closemsg
	releaseall
	end

scr_seq_00000957_00000682:
	scrcmd_267 26, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	closemsg
	releaseall
	end

scr_seq_00000957_00000698:
	scrcmd_267 21, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	closemsg
	releaseall
	end

scr_seq_00000957_000006AE:
	scrcmd_267 3, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	goto scr_seq_00000957_000007BC

scr_seq_00000957_000006C4:
	.byte 0x02, 0x00
scr_seq_00000957_000006C6:
	scrcmd_267 4, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	goto scr_seq_00000957_000007BC

scr_seq_00000957_000006DC:
	.byte 0x02, 0x00
scr_seq_00000957_000006DE:
	scrcmd_267 5, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	goto scr_seq_00000957_000007BC

scr_seq_00000957_000006F4:
	.byte 0x02, 0x00
scr_seq_00000957_000006F6:
	scrcmd_267 6, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	goto scr_seq_00000957_000007BC

scr_seq_00000957_0000070C:
	.byte 0x02, 0x00, 0x0b, 0x01
	.byte 0x07, 0x00, 0x0c, 0x80, 0x2e, 0x00, 0x0c, 0x80, 0x03, 0x00, 0x1e, 0x00, 0x0c, 0x80, 0x16, 0x00
	.byte 0x98, 0x00, 0x00, 0x00, 0x02, 0x00
scr_seq_00000957_00000726:
	scrcmd_267 8, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	goto scr_seq_00000957_000007BC

scr_seq_00000957_0000073C:
	.byte 0x02, 0x00
scr_seq_00000957_0000073E:
	scrcmd_271 1, 1
	msgbox 36
	goto scr_seq_00000957_00000BC2

scr_seq_00000957_0000074D:
	.byte 0x02, 0x00
scr_seq_00000957_0000074F:
	scrcmd_267 21, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	goto scr_seq_00000957_000000D2

scr_seq_00000957_0000075F:
	.byte 0x02
	.byte 0x00
scr_seq_00000957_00000761:
	msgbox 218
	goto scr_seq_00000957_000000D2

scr_seq_00000957_0000076A:
	.byte 0x02, 0x00
scr_seq_00000957_0000076C:
	scrcmd_267 8, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	goto scr_seq_00000957_000007BC

scr_seq_00000957_00000782:
	.byte 0x02, 0x00
scr_seq_00000957_00000784:
	scrcmd_267 23, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	scrcmd_257 101
	closemsg
	scrcmd_266
	releaseall
	end

scr_seq_00000957_000007A0:
	scrcmd_267 24, 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	scrcmd_257 101
	closemsg
	scrcmd_266
	releaseall
	end

scr_seq_00000957_000007BC:
	scrcmd_257 101
	closemsg
	scrcmd_266
	releaseall
	end

scr_seq_00000957_000007C8:
	scrcmd_609
	lockall
scr_seq_00000957_000007CC:
	play_se SEQ_SE_DP_BUTTON9
	scrcmd_264 1
	scrcmd_592 7
	scrcmd_348 30
	goto scr_seq_00000957_000007E4

scr_seq_00000957_000007E2:
	.byte 0x02, 0x00
scr_seq_00000957_000007E4:
	msgbox 9
	scrcmd_257 100
	scrcmd_261 11
	scrcmd_273 32780
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000957_00000863
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000957_00000B11
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000957_00000974
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000957_000008DB
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_00000957_00000A44
	comparevartovalue VAR_SPECIAL_x8008, 6
	gotoif eq, scr_seq_00000957_00000AA2
	comparevartovalue VAR_SPECIAL_x8008, 7
	gotoif eq, scr_seq_00000957_00000BA0
	comparevartovalue VAR_SPECIAL_x8008, 8
	gotoif eq, scr_seq_00000957_00000BB1
	end

scr_seq_00000957_00000863:
	msgbox 11
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000957_000008CA
	scrcmd_271 1, 0
	closemsg
	scrcmd_272 32780
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif eq, scr_seq_00000957_00000B80
	scrcmd_576 32780
	scrcmd_046 VAR_SPECIAL_x800C
	wait 30, VAR_SPECIAL_x800C
	scrcmd_257 1
	closemsg
	scrcmd_261 5
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_160
	scrcmd_150
	call scr_seq_00000957_00000BDA
	goto scr_seq_00000957_000007E4

scr_seq_00000957_000008C8:
	.byte 0x02, 0x00
scr_seq_00000957_000008CA:
	scrcmd_271 1, 1
	msgbox 17
	goto scr_seq_00000957_00000BC2

scr_seq_00000957_000008D9:
	.byte 0x02, 0x00
scr_seq_00000957_000008DB:
	msgbox 26
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000957_00000952
	scrcmd_356 32780
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif lt, scr_seq_00000957_00000963
	scrcmd_271 1, 0
	closemsg
	scrcmd_272 32780
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif eq, scr_seq_00000957_00000BA0
	msgbox 27
	wait 30, VAR_SPECIAL_x800C
	scrcmd_257 3
	closemsg
	scrcmd_261 7
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_161
	scrcmd_150
	scrcmd_261 11
	call scr_seq_00000957_00000BDA
	goto scr_seq_00000957_000007E4

scr_seq_00000957_00000950:
	.byte 0x02, 0x00
scr_seq_00000957_00000952:
	scrcmd_271 1, 1
	msgbox 20
	goto scr_seq_00000957_00000BC2

scr_seq_00000957_00000961:
	.byte 0x02, 0x00
scr_seq_00000957_00000963:
	scrcmd_271 1, 1
	msgbox 29
	goto scr_seq_00000957_00000BC2

scr_seq_00000957_00000972:
	.byte 0x02, 0x00
scr_seq_00000957_00000974:
	msgbox 21
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000957_00000A22
	scrcmd_434 32780, 30
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif lt, scr_seq_00000957_00000A33
	scrcmd_271 1, 0
	closemsg
	scrcmd_272 32780
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif eq, scr_seq_00000957_00000BA0
	msgbox 22
	wait 30, VAR_SPECIAL_x800C
	scrcmd_257 2
	closemsg
	scrcmd_261 6
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_350
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	msgbox 202
	scrcmd_257 102
	closemsg
	scrcmd_586 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000957_00000B8B
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_00000957_00000B8B
	scrcmd_230
	scrcmd_261 11
	call scr_seq_00000957_00000BDA
	goto scr_seq_00000957_000007E4

scr_seq_00000957_00000A20:
	.byte 0x02, 0x00
scr_seq_00000957_00000A22:
	scrcmd_271 1, 1
	msgbox 23
	goto scr_seq_00000957_00000BC2

scr_seq_00000957_00000A31:
	.byte 0x02, 0x00
scr_seq_00000957_00000A33:
	scrcmd_271 1, 1
	msgbox 24
	goto scr_seq_00000957_00000BC2

scr_seq_00000957_00000A42:
	.byte 0x02, 0x00
scr_seq_00000957_00000A44:
	msgbox 30
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000957_00000A22
	scrcmd_271 1, 0
	closemsg
	scrcmd_272 32780
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif eq, scr_seq_00000957_00000BA0
	msgbox 31
	wait 30, VAR_SPECIAL_x800C
	scrcmd_257 5
	closemsg
	scrcmd_261 2
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_162
	scrcmd_150
	call scr_seq_00000957_00000BDA
	releaseall
	end

scr_seq_00000957_00000AA2:
	msgbox 33
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000957_00000A22
	scrcmd_271 1, 0
	closemsg
	scrcmd_359 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000957_0000073E
	scrcmd_272 32780
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif eq, scr_seq_00000957_00000BA0
	msgbox 34
	wait 30, VAR_SPECIAL_x800C
	scrcmd_257 6
	closemsg
	scrcmd_261 13
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_629
	scrcmd_150
	call scr_seq_00000957_00000BDA
	releaseall
	end

scr_seq_00000957_00000B11:
	msgbox 18
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000957_00000B6F
	scrcmd_271 1, 0
	closemsg
	scrcmd_272 32780
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif eq, scr_seq_00000957_00000BA0
	msgbox 19
	wait 30, VAR_SPECIAL_x800C
	scrcmd_257 4
	closemsg
	scrcmd_261 1
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_159
	scrcmd_150
	call scr_seq_00000957_00000BDA
	releaseall
	end

scr_seq_00000957_00000B6F:
	scrcmd_271 1, 1
	msgbox 28
	goto scr_seq_00000957_00000BC2

scr_seq_00000957_00000B7E:
	.byte 0x02, 0x00
scr_seq_00000957_00000B80:
	msgbox 35
	goto scr_seq_00000957_00000BC2

scr_seq_00000957_00000B89:
	.byte 0x02, 0x00
scr_seq_00000957_00000B8B:
	scrcmd_261 11
	msgbox 25
	wait 30, VAR_SPECIAL_x800C
	goto scr_seq_00000957_00000BC2

scr_seq_00000957_00000B9E:
	.byte 0x02, 0x00
scr_seq_00000957_00000BA0:
	msgbox 8
	wait 30, VAR_SPECIAL_x800C
	goto scr_seq_00000957_00000BC2

scr_seq_00000957_00000BAF:
	.byte 0x02
	.byte 0x00
scr_seq_00000957_00000BB1:
	msgbox 10
	wait 30, VAR_SPECIAL_x800C
	goto scr_seq_00000957_00000BC2

scr_seq_00000957_00000BC0:
	.byte 0x02, 0x00
scr_seq_00000957_00000BC2:
	scrcmd_257 101
	closemsg
	scrcmd_266
	releaseall
	end

scr_seq_00000957_00000BCE:
	.byte 0x0f, 0x01
	.byte 0x01, 0x00, 0x01, 0x00, 0x35, 0x00, 0x61, 0x00, 0x02, 0x00
scr_seq_00000957_00000BDA:
	scrcmd_265
	scrcmd_174 6, 1, 1, 0
	return

scr_seq_00000957_00000BE8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 207
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000957_00000BFB:
	play_se SEQ_SE_DP_SELECT
	scrcmd_609
	lockall
	faceplayer
	goto scr_seq_00000957_00000499

scr_seq_00000957_00000C0B:
	.byte 0x02, 0x00
scr_seq_00000957_00000C0D:
	play_se SEQ_SE_DP_SELECT
	scrcmd_609
	lockall
	faceplayer
	goto scr_seq_00000957_00000C1F

scr_seq_00000957_00000C1D:
	.byte 0x02, 0x00
scr_seq_00000957_00000C1F:
	scrcmd_262
	checkflag FLAG_UNK_069
	callif eq, scr_seq_00000957_00000C87
	scrcmd_746
scr_seq_00000957_00000C2E:
	checkflag FLAG_UNK_069
	callif lt, scr_seq_00000957_00000C8C
	setflag FLAG_UNK_069
	scrcmd_749 21, 11, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 11, 255, 0
	scrcmd_751 169, 255, 1
	scrcmd_751 24, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000957_00000CAF
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000957_00000C91
	goto scr_seq_00000957_00000CA5

scr_seq_00000957_00000C85:
	.byte 0x02, 0x00
scr_seq_00000957_00000C87:
	msgbox 158
	return

scr_seq_00000957_00000C8C:
	msgbox 157
	return

scr_seq_00000957_00000C91:
	scrcmd_747
	scrcmd_260 32780
	scrcmd_046 VAR_SPECIAL_x800C
	scrcmd_746
	goto scr_seq_00000957_00000C2E

scr_seq_00000957_00000CA3:
	.byte 0x02, 0x00
scr_seq_00000957_00000CA5:
	scrcmd_747
	scrcmd_263
	closemsg
	releaseall
	end

scr_seq_00000957_00000CAF:
	msgbox 159
	scrcmd_749 24, 3, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 52, 255, 0
	scrcmd_751 23, 255, 1
	scrcmd_751 142, 255, 2
	scrcmd_751 59, 255, 3
	scrcmd_751 170, 255, 4
	scrcmd_751 141, 255, 5
	scrcmd_751 13, 255, 6
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000957_00000D50
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000957_00000D5F
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000957_00000D6E
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000957_00000D7D
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000957_00000D8C
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_00000957_00000D9B
	goto scr_seq_00000957_00000C2E

scr_seq_00000957_00000D4E:
	.byte 0x02, 0x00
scr_seq_00000957_00000D50:
	scrcmd_747
	msgbox 160
	scrcmd_746
	goto scr_seq_00000957_00000CAF

scr_seq_00000957_00000D5D:
	.byte 0x02, 0x00
scr_seq_00000957_00000D5F:
	scrcmd_747
	msgbox 161
	scrcmd_746
	goto scr_seq_00000957_00000CAF

scr_seq_00000957_00000D6C:
	.byte 0x02, 0x00
scr_seq_00000957_00000D6E:
	scrcmd_747
	msgbox 162
	scrcmd_746
	goto scr_seq_00000957_00000CAF

scr_seq_00000957_00000D7B:
	.byte 0x02, 0x00
scr_seq_00000957_00000D7D:
	scrcmd_747
	msgbox 164
	scrcmd_746
	goto scr_seq_00000957_00000CAF

scr_seq_00000957_00000D8A:
	.byte 0x02, 0x00
scr_seq_00000957_00000D8C:
	scrcmd_747
	msgbox 165
	scrcmd_746
	goto scr_seq_00000957_00000CAF

scr_seq_00000957_00000D99:
	.byte 0x02, 0x00
scr_seq_00000957_00000D9B:
	scrcmd_747
	msgbox 163
	scrcmd_746
	goto scr_seq_00000957_00000CAF

scr_seq_00000957_00000DA8:
	.byte 0x02, 0x00, 0x16, 0x00, 0x7e, 0xfe, 0xff, 0xff
	.byte 0x02, 0x00, 0x00, 0x00
	.balign 4, 0
