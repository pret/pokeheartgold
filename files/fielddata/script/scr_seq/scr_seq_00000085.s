#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000085_0000020B ; 000
	scrdef scr_seq_00000085_000008B2 ; 001
	scrdef scr_seq_00000085_000008EB ; 002
	scrdef scr_seq_00000085_00000924 ; 003
	scrdef scr_seq_00000085_00000998 ; 004
	scrdef scr_seq_00000085_00000227 ; 005
	scrdef scr_seq_00000085_000009C0 ; 006
	scrdef scr_seq_00000085_000009D3 ; 007
	scrdef scr_seq_00000085_000009E6 ; 008
	scrdef scr_seq_00000085_000009F9 ; 009
	scrdef scr_seq_00000085_00000A18 ; 010
	scrdef scr_seq_00000085_00000A2B ; 011
	scrdef scr_seq_00000085_00000A3E ; 012
	scrdef scr_seq_00000085_00000A51 ; 013
	scrdef scr_seq_00000085_00000A64 ; 014
	scrdef scr_seq_00000085_00000157 ; 015
	scrdef scr_seq_00000085_00000A77 ; 016
	scrdef scr_seq_00000085_00000B16 ; 017
	scrdef scr_seq_00000085_00000C29 ; 018
	scrdef scr_seq_00000085_00000D3C ; 019
	scrdef scr_seq_00000085_000000A6 ; 020
	scrdef scr_seq_00000085_0000005A ; 021
	scrdef_end

scr_seq_00000085_0000005A:
	scrcmd_693 16384
	comparevartovalue VAR_TEMP_x4000, 11
	callif ge, scr_seq_00000085_00000090
	comparevartovalue VAR_TEMP_x4000, 101
	callif ge, scr_seq_00000085_0000007A
	end

scr_seq_00000085_0000007A:
	scrcmd_338 11, 8, 11
	scrcmd_339 11, 8, 0, 11, 2
	return

scr_seq_00000085_00000090:
	scrcmd_338 11, 13, 11
	scrcmd_339 11, 13, 0, 11, 2
	return

scr_seq_00000085_000000A6:
	comparevartovalue VAR_UNK_4145, 1
	gotoif eq, scr_seq_00000085_000000B5
	end

scr_seq_00000085_000000B5:
	scrcmd_380 16391, 100
	checkflag FLAG_UNK_234
	callif lt, scr_seq_00000085_000000D5
	comparevartovalue VAR_TEMP_x4007, 30
	gotoif lt, scr_seq_00000085_000000DF
	end

scr_seq_00000085_000000D5:
	scrcmd_101 12
	setflag FLAG_UNK_234
	return

scr_seq_00000085_000000DF:
	checkflag FLAG_UNK_AA1
	gotoif lt, scr_seq_00000085_000000EC
	end

scr_seq_00000085_000000EC:
	setflag FLAG_UNK_AA1
	scrcmd_694 16392
	comparevartovalue VAR_TEMP_x4008, 10000
	gotoif ge, scr_seq_00000085_0000011D
	comparevartovalue VAR_TEMP_x4008, 1000
	gotoif ge, scr_seq_00000085_0000012B
	comparevartovalue VAR_TEMP_x4008, 500
	gotoif ge, scr_seq_00000085_00000139
	end

scr_seq_00000085_0000011D:
	scrcmd_380 16467, 4
	goto scr_seq_00000085_00000147

scr_seq_00000085_00000129:
	.byte 0x02, 0x00
scr_seq_00000085_0000012B:
	scrcmd_380 16467, 2
	goto scr_seq_00000085_00000147

scr_seq_00000085_00000137:
	.byte 0x02, 0x00
scr_seq_00000085_00000139:
	setvar VAR_UNK_4053, 0
	goto scr_seq_00000085_00000147

scr_seq_00000085_00000145:
	.byte 0x02, 0x00
scr_seq_00000085_00000147:
	clearflag FLAG_UNK_234
	call scr_seq_00000085_0000017D
	scrcmd_100 12
	end

scr_seq_00000085_00000157:
	scrcmd_281 16384
	comparevartovalue VAR_TEMP_x4000, 0
	callif eq, scr_seq_00000085_000001FB
	comparevartovalue VAR_TEMP_x4000, 1
	callif eq, scr_seq_00000085_00000203
	call scr_seq_00000085_0000017D
	end

scr_seq_00000085_0000017D:
	comparevartovalue VAR_UNK_4053, 0
	callif eq, scr_seq_00000085_000001B3
	comparevartovalue VAR_UNK_4053, 1
	callif eq, scr_seq_00000085_000001E3
	comparevartovalue VAR_UNK_4053, 2
	callif eq, scr_seq_00000085_000001EB
	comparevartovalue VAR_UNK_4053, 3
	callif eq, scr_seq_00000085_000001F3
	return

scr_seq_00000085_000001B3:
	scrcmd_281 16393
	comparevartovalue VAR_TEMP_x4009, 0
	gotoif eq, scr_seq_00000085_000001D3
	comparevartovalue VAR_TEMP_x4009, 1
	gotoif eq, scr_seq_00000085_000001DB
	return

scr_seq_00000085_000001D3:
	setvar VAR_OBJ_1, 97
	return

scr_seq_00000085_000001DB:
	setvar VAR_OBJ_1, 0
	return

scr_seq_00000085_000001E3:
	setvar VAR_OBJ_1, 365
	return

scr_seq_00000085_000001EB:
	setvar VAR_OBJ_1, 366
	return

scr_seq_00000085_000001F3:
	setvar VAR_OBJ_1, 354
	return

scr_seq_00000085_000001FB:
	setvar VAR_OBJ_9, 320
	return

scr_seq_00000085_00000203:
	setvar VAR_OBJ_9, 317
	return

scr_seq_00000085_0000020B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4003, 0
	setvar VAR_TEMP_x4004, 0
	goto scr_seq_00000085_00000243

scr_seq_00000085_00000225:
	.byte 0x02, 0x00
scr_seq_00000085_00000227:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4003, 0
	setvar VAR_TEMP_x4004, 1
	goto scr_seq_00000085_00000243

scr_seq_00000085_00000241:
	.byte 0x02, 0x00
scr_seq_00000085_00000243:
	scrcmd_682 0
	comparevartovalue VAR_TEMP_x4004, 0
	callif eq, scr_seq_00000085_00000868
	comparevartovalue VAR_TEMP_x4004, 1
	callif eq, scr_seq_00000085_0000086D
	goto scr_seq_00000085_00000269

scr_seq_00000085_00000267:
	.byte 0x02, 0x00
scr_seq_00000085_00000269:
	comparevartovalue VAR_TEMP_x4004, 0
	callif eq, scr_seq_00000085_00000872
	comparevartovalue VAR_TEMP_x4004, 1
	callif eq, scr_seq_00000085_00000891
	scrcmd_751 19, 255, 2
	scrcmd_751 20, 255, 3
	scrcmd_752
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000085_0000030E
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000085_00000331
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_00000085_000002D3
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, scr_seq_00000085_00000354
	scrcmd_747
	goto scr_seq_00000085_000002F5

scr_seq_00000085_000002D1:
	.byte 0x02, 0x00
scr_seq_00000085_000002D3:
	comparevartovalue VAR_TEMP_x4004, 0
	callif eq, scr_seq_00000085_000008A8
	comparevartovalue VAR_TEMP_x4004, 1
	callif eq, scr_seq_00000085_000008AD
	goto scr_seq_00000085_00000269

scr_seq_00000085_000002F3:
	.byte 0x02, 0x00
scr_seq_00000085_000002F5:
	goto scr_seq_00000085_000002FD

scr_seq_00000085_000002FB:
	.byte 0x02, 0x00
scr_seq_00000085_000002FD:
	setvar VAR_UNK_4145, 0
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000085_0000030E:
	setvar VAR_UNK_4146, 0
	scrcmd_633 0, 1, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000085_00000377
	goto scr_seq_00000085_000003A1

scr_seq_00000085_0000032F:
	.byte 0x02
	.byte 0x00
scr_seq_00000085_00000331:
	setvar VAR_UNK_4146, 1
	scrcmd_633 0, 2, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000085_0000038C
	goto scr_seq_00000085_000003A1

scr_seq_00000085_00000352:
	.byte 0x02, 0x00
scr_seq_00000085_00000354:
	setvar VAR_UNK_4146, 2
	scrcmd_633 0, 1, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000085_00000377
	goto scr_seq_00000085_000003A1

scr_seq_00000085_00000375:
	.byte 0x02, 0x00
scr_seq_00000085_00000377:
	msgbox 35
	scrcmd_444 37, 1, 0, 0
	scrcmd_747
	goto scr_seq_00000085_000002F5

scr_seq_00000085_0000038A:
	.byte 0x02, 0x00
scr_seq_00000085_0000038C:
	msgbox 36
	scrcmd_444 37, 2, 0, 0
	scrcmd_747
	goto scr_seq_00000085_000002F5

scr_seq_00000085_0000039F:
	.byte 0x02
	.byte 0x00
scr_seq_00000085_000003A1:
	msgbox 33
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_633 4, 16710, 32780
	scrcmd_635 16386, 16389
	comparevartovalue VAR_TEMP_x4002, 255
	gotoif ne, scr_seq_00000085_000003D1
	scrcmd_815 0
scr_seq_00000085_000003D1:
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	comparevartovalue VAR_TEMP_x4002, 255
	gotoif eq, scr_seq_00000085_000002F5
	scrcmd_690 16386, 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000085_000007B9
	comparevartovalue VAR_UNK_4146, 1
	gotoif eq, scr_seq_00000085_00000414
	goto scr_seq_00000085_0000042F

scr_seq_00000085_00000412:
	.byte 0x02, 0x00
scr_seq_00000085_00000414:
	scrcmd_690 16389, 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000085_000007B9
	goto scr_seq_00000085_0000042F

scr_seq_00000085_0000042D:
	.byte 0x02, 0x00
scr_seq_00000085_0000042F:
	scrcmd_354 16386, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000085_0000044A
	scrcmd_747
	goto scr_seq_00000085_000002F5

scr_seq_00000085_0000044A:
	scrcmd_633 1, 16710, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000085_000004D8
	scrcmd_633 2, 16710, 32780
	scrcmd_202 0, 32780, 0, 0
	comparevartovar VAR_SPECIAL_x800C, VAR_TEMP_x4001
	gotoif eq, scr_seq_00000085_000004D8
	goto scr_seq_00000085_00000484

scr_seq_00000085_00000482:
	.byte 0x02, 0x00
scr_seq_00000085_00000484:
	scrcmd_202 1, 16385, 0, 0
	msgbox 34
	scrcmd_746
	scrcmd_749 1, 1, 1, 1, VAR_SPECIAL_x800C
	scrcmd_751 42, 255, 0
	scrcmd_751 43, 255, 1
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000085_000004C8
	scrcmd_747
	goto scr_seq_00000085_000002F5

scr_seq_00000085_000004C6:
	.byte 0x02, 0x00
scr_seq_00000085_000004C8:
	scrcmd_633 3, 16710, 32780
	goto scr_seq_00000085_000004D8

scr_seq_00000085_000004D6:
	.byte 0x02, 0x00
scr_seq_00000085_000004D8:
	goto scr_seq_00000085_000004E0

scr_seq_00000085_000004DE:
	.byte 0x02, 0x00
scr_seq_00000085_000004E0:
	comparevartovalue VAR_UNK_4146, 0
	callif eq, scr_seq_00000085_0000066C
	comparevartovalue VAR_UNK_4146, 1
	callif eq, scr_seq_00000085_0000066C
	setvar VAR_TEMP_x4000, 0
	scrcmd_282
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000085_000002F5
	comparevartovalue VAR_UNK_4146, 2
	gotoif eq, scr_seq_00000085_0000052E
	goto scr_seq_00000085_00000689

scr_seq_00000085_0000052C:
	.byte 0x02, 0x00
scr_seq_00000085_0000052E:
	msgbox 30
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 14, 255, 0
	scrcmd_751 15, 255, 1
	scrcmd_751 5, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000085_0000057F
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000085_000005D7
	scrcmd_747
	goto scr_seq_00000085_000002F5

scr_seq_00000085_0000057D:
	.byte 0x02, 0x00
scr_seq_00000085_0000057F:
	msgbox 31
	scrcmd_748 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000085_0000052E
	scrcmd_747
	closemsg
	scrcmd_226 30, 0, 0, 32780
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000085_000005C5
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_00000085_000005CD
	goto scr_seq_00000085_0000062F

scr_seq_00000085_000005C3:
	.byte 0x02, 0x00
scr_seq_00000085_000005C5:
	goto scr_seq_00000085_0000052E

scr_seq_00000085_000005CB:
	.byte 0x02, 0x00
scr_seq_00000085_000005CD:
	scrcmd_283
	goto scr_seq_00000085_0000052E

scr_seq_00000085_000005D5:
	.byte 0x02, 0x00
scr_seq_00000085_000005D7:
	msgbox 31
	scrcmd_748 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000085_0000052E
	scrcmd_747
	closemsg
	scrcmd_227 30, 0, 0, 32780
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000085_0000061D
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_00000085_00000625
	goto scr_seq_00000085_0000062F

scr_seq_00000085_0000061B:
	.byte 0x02, 0x00
scr_seq_00000085_0000061D:
	goto scr_seq_00000085_0000052E

scr_seq_00000085_00000623:
	.byte 0x02, 0x00
scr_seq_00000085_00000625:
	scrcmd_283
	goto scr_seq_00000085_0000052E

scr_seq_00000085_0000062D:
	.byte 0x02, 0x00
scr_seq_00000085_0000062F:
	scrcmd_258
	scrcmd_257 108
	scrcmd_634 16385, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000085_00000674
	scrcmd_258
	scrcmd_257 110
	msgbox 32
	comparevartovalue VAR_UNK_4146, 2
	callif eq, scr_seq_00000085_0000066C
	call scr_seq_00000085_000008D9
	goto scr_seq_00000085_00000689

scr_seq_00000085_0000066A:
	.byte 0x02, 0x00
scr_seq_00000085_0000066C:
	setvar VAR_UNK_4145, 255
	return

scr_seq_00000085_00000674:
	call scr_seq_00000085_00000685
	msgbox 57
	goto scr_seq_00000085_000002F5

scr_seq_00000085_00000683:
	.byte 0x02, 0x00
scr_seq_00000085_00000685:
	scrcmd_283
	return

scr_seq_00000085_00000689:
	comparevartovalue VAR_UNK_4146, 0
	callif eq, scr_seq_00000085_00000721
	comparevartovalue VAR_UNK_4146, 1
	callif eq, scr_seq_00000085_0000073C
	comparevartovalue VAR_UNK_4146, 2
	callif eq, scr_seq_00000085_00000757
	play_se SEQ_SE_DP_KAIDAN2
	goto scr_seq_00000085_000006BC

scr_seq_00000085_000006BA:
	.byte 0x02, 0x00
scr_seq_00000085_000006BC:
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_815 0
	comparevartovalue VAR_UNK_4146, 0
	callif eq, scr_seq_00000085_0000077D
	comparevartovalue VAR_UNK_4146, 1
	callif eq, scr_seq_00000085_00000791
	comparevartovalue VAR_UNK_4146, 2
	callif eq, scr_seq_00000085_000007A5
	scrcmd_420 59
	scrcmd_436
	scrcmd_627 9
	comparevartovalue VAR_UNK_4146, 2
	callif eq, scr_seq_00000085_0000071D
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	scrcmd_682 1
	end

scr_seq_00000085_0000071D:
	scrcmd_283
	return

scr_seq_00000085_00000721:
	msgbox 9
	scrcmd_049
	closemsg
	apply_movement 255, scr_seq_00000085_000007C8
	apply_movement VAR_SPECIAL_x800D, scr_seq_00000085_000007F0
	wait_movement
	return

scr_seq_00000085_0000073C:
	msgbox 9
	scrcmd_049
	closemsg
	apply_movement 255, scr_seq_00000085_000007C8
	apply_movement VAR_SPECIAL_x800D, scr_seq_00000085_000007F0
	wait_movement
	return

scr_seq_00000085_00000757:
	scrcmd_047 9
	wait 10, VAR_SPECIAL_x800C
	scrcmd_258
	scrcmd_257 109
	closemsg
	apply_movement 255, scr_seq_00000085_000007D8
	apply_movement VAR_SPECIAL_x800D, scr_seq_00000085_00000800
	wait_movement
	return

scr_seq_00000085_0000077D:
	apply_movement 255, scr_seq_00000085_00000818
	apply_movement VAR_SPECIAL_x800D, scr_seq_00000085_00000848
	wait_movement
	return

scr_seq_00000085_00000791:
	apply_movement 255, scr_seq_00000085_00000818
	apply_movement VAR_SPECIAL_x800D, scr_seq_00000085_00000848
	wait_movement
	return

scr_seq_00000085_000007A5:
	apply_movement 255, scr_seq_00000085_0000082C
	apply_movement VAR_SPECIAL_x800D, scr_seq_00000085_00000858
	wait_movement
	return

scr_seq_00000085_000007B9:
	scrcmd_747
	setvar VAR_UNK_4145, 0
	callstd 2041
	end

scr_seq_00000085_000007C7:
	.byte 0x00

scr_seq_00000085_000007C8:
	.short 14, 4
	.short 13, 3
	.short 69, 1
	.short 254, 0

scr_seq_00000085_000007D8:
	.short 14, 2
	.short 12, 1
	.short 14, 2
	.short 13, 3
	.short 69, 1
	.short 254, 0

scr_seq_00000085_000007F0:
	.short 14, 3
	.short 13, 3
	.short 69, 1
	.short 254, 0

scr_seq_00000085_00000800:
	.short 14, 1
	.short 12, 1
	.short 14, 2
	.short 13, 3
	.short 69, 1
	.short 254, 0

scr_seq_00000085_00000818:
	.short 23, 4
	.short 20, 3
	.short 2, 1
	.short 70, 1
	.short 254, 0

scr_seq_00000085_0000082C:
	.short 23, 2
	.short 21, 1
	.short 23, 2
	.short 20, 3
	.short 2, 1
	.short 70, 1
	.short 254, 0

scr_seq_00000085_00000848:
	.short 20, 3
	.short 23, 3
	.short 70, 1
	.short 254, 0

scr_seq_00000085_00000858:
	.short 20, 2
	.short 23, 3
	.short 70, 1
	.short 254, 0
scr_seq_00000085_00000868:
	msgbox 0
	return

scr_seq_00000085_0000086D:
	msgbox 3
	return

scr_seq_00000085_00000872:
	msgbox 1
	scrcmd_746
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 16, 255, 0
	scrcmd_751 17, 255, 1
	return

scr_seq_00000085_00000891:
	msgbox 4
	scrcmd_746
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 18, 255, 4
	return

scr_seq_00000085_000008A8:
	msgbox 2
	return

scr_seq_00000085_000008AD:
	msgbox 5
	return

scr_seq_00000085_000008B2:
	scrcmd_682 0
	setvar VAR_TEMP_x4003, 1
	setvar VAR_UNK_4145, 0
	msgbox 11
	call scr_seq_00000085_0000066C
	call scr_seq_00000085_000008D9
	goto scr_seq_00000085_00000689

scr_seq_00000085_000008D7:
	.byte 0x02, 0x00
scr_seq_00000085_000008D9:
	scrcmd_345
	scrcmd_254 32780
	scrcmd_346
	play_se SEQ_SE_DP_SAVE
	wait_se SEQ_SE_DP_SAVE
	return

scr_seq_00000085_000008EB:
	msgbox 12
	scrcmd_636 16710
	comparevartovalue VAR_UNK_404F, 1
	callif eq, scr_seq_00000085_00000914
	comparevartovalue VAR_UNK_404F, 3
	callif eq, scr_seq_00000085_0000091C
	goto scr_seq_00000085_000002F5

scr_seq_00000085_00000912:
	.byte 0x02, 0x00
scr_seq_00000085_00000914:
	setvar VAR_UNK_404F, 0
	return

scr_seq_00000085_0000091C:
	setvar VAR_UNK_404F, 2
	return

scr_seq_00000085_00000924:
	comparevartovalue VAR_UNK_4146, 0
	callif eq, scr_seq_00000085_00000960
	comparevartovalue VAR_UNK_4146, 1
	callif eq, scr_seq_00000085_00000960
	comparevartovalue VAR_UNK_404F, 1
	callif eq, scr_seq_00000085_00000966
	comparevartovalue VAR_UNK_404F, 3
	callif eq, scr_seq_00000085_0000097D
	goto scr_seq_00000085_000002F5

scr_seq_00000085_0000095E:
	.byte 0x02, 0x00
scr_seq_00000085_00000960:
	scrcmd_680 29
	return

scr_seq_00000085_00000966:
	msgbox 13
	scrcmd_190 0
	msgbox 15
	scrcmd_078 1185
	scrcmd_079
	setvar VAR_UNK_404F, 2
	return

scr_seq_00000085_0000097D:
	msgbox 13
	scrcmd_190 0
	msgbox 14
	scrcmd_078 1185
	scrcmd_079
	setvar VAR_UNK_404F, 4
	callstd 2040
	return

scr_seq_00000085_00000998:
	goto scr_seq_00000085_000002F5

scr_seq_00000085_0000099E:
	.byte 0x02, 0x00
	.byte 0x0c, 0x00, 0x02, 0x00, 0x3f, 0x00, 0x01, 0x00, 0x0c, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
	.byte 0x0c, 0x00, 0x02, 0x00, 0x3f, 0x00, 0x01, 0x00, 0x0c, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_00000085_000009C0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 59
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000085_000009D3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 60
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000085_000009E6:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 61
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000085_000009F9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	wait_se SEQ_SE_DP_SELECT
	scrcmd_076 80, 0
	msgbox 62
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000085_00000A18:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 63
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000085_00000A2B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 64
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000085_00000A3E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 65
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000085_00000A51:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 66
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000085_00000A64:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 67
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000085_00000A77:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0FE
	gotoif lt, scr_seq_00000085_00000AFF
	scrcmd_692 1, 2, 3, 4, VAR_UNK_4054, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000085_00000AD5
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_00000085_00000AE0
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_00000085_00000AF1
	scrcmd_190 0
	msgbox 69
	msgbox 70
	scrcmd_078 1214
	msgbox 72
	scrcmd_079
	goto scr_seq_00000085_00000B0E

scr_seq_00000085_00000AD3:
	.byte 0x02, 0x00
scr_seq_00000085_00000AD5:
	msgbox 68
	goto scr_seq_00000085_00000B0E

scr_seq_00000085_00000ADE:
	.byte 0x02, 0x00
scr_seq_00000085_00000AE0:
	scrcmd_190 0
	msgbox 73
	msgbox 71
	goto scr_seq_00000085_00000B0E

scr_seq_00000085_00000AEF:
	.byte 0x02
	.byte 0x00
scr_seq_00000085_00000AF1:
	scrcmd_190 0
	msgbox 74
	goto scr_seq_00000085_00000B0E

scr_seq_00000085_00000AFD:
	.byte 0x02, 0x00
scr_seq_00000085_00000AFF:
	setflag FLAG_UNK_0FE
	msgbox 68
	goto scr_seq_00000085_00000B0E

scr_seq_00000085_00000B0C:
	.byte 0x02, 0x00
scr_seq_00000085_00000B0E:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000085_00000B16:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_281 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000085_00000C4A
	goto scr_seq_00000085_00000B37

scr_seq_00000085_00000B35:
	.byte 0x02, 0x00
scr_seq_00000085_00000B37:
	scrcmd_190 0
	scrcmd_693 32773
	comparevartovalue VAR_SPECIAL_x8005, 475
	gotoif ge, scr_seq_00000085_00000BBE
	comparevartovalue VAR_SPECIAL_x8005, 351
	gotoif ge, scr_seq_00000085_00000BC9
	comparevartovalue VAR_SPECIAL_x8005, 251
	gotoif ge, scr_seq_00000085_00000BD4
	comparevartovalue VAR_SPECIAL_x8005, 151
	gotoif ge, scr_seq_00000085_00000BDF
	comparevartovalue VAR_SPECIAL_x8005, 101
	gotoif ge, scr_seq_00000085_00000BEA
	comparevartovalue VAR_SPECIAL_x8005, 51
	gotoif ge, scr_seq_00000085_00000BF5
	comparevartovalue VAR_SPECIAL_x8005, 31
	gotoif ge, scr_seq_00000085_00000C00
	comparevartovalue VAR_SPECIAL_x8005, 11
	gotoif ge, scr_seq_00000085_00000C0B
	comparevartovalue VAR_SPECIAL_x8005, 1
	gotoif ge, scr_seq_00000085_00000C16
	msgbox 75
	goto scr_seq_00000085_00000C21

scr_seq_00000085_00000BBC:
	.byte 0x02, 0x00
scr_seq_00000085_00000BBE:
	msgbox 84
	goto scr_seq_00000085_00000C21

scr_seq_00000085_00000BC7:
	.byte 0x02, 0x00
scr_seq_00000085_00000BC9:
	msgbox 83
	goto scr_seq_00000085_00000C21

scr_seq_00000085_00000BD2:
	.byte 0x02, 0x00
scr_seq_00000085_00000BD4:
	msgbox 82
	goto scr_seq_00000085_00000C21

scr_seq_00000085_00000BDD:
	.byte 0x02, 0x00
scr_seq_00000085_00000BDF:
	msgbox 81
	goto scr_seq_00000085_00000C21

scr_seq_00000085_00000BE8:
	.byte 0x02, 0x00
scr_seq_00000085_00000BEA:
	msgbox 80
	goto scr_seq_00000085_00000C21

scr_seq_00000085_00000BF3:
	.byte 0x02, 0x00
scr_seq_00000085_00000BF5:
	msgbox 79
	goto scr_seq_00000085_00000C21

scr_seq_00000085_00000BFE:
	.byte 0x02, 0x00
scr_seq_00000085_00000C00:
	msgbox 78
	goto scr_seq_00000085_00000C21

scr_seq_00000085_00000C09:
	.byte 0x02, 0x00
scr_seq_00000085_00000C0B:
	msgbox 77
	goto scr_seq_00000085_00000C21

scr_seq_00000085_00000C14:
	.byte 0x02, 0x00
scr_seq_00000085_00000C16:
	msgbox 76
	goto scr_seq_00000085_00000C21

scr_seq_00000085_00000C1F:
	.byte 0x02
	.byte 0x00
scr_seq_00000085_00000C21:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000085_00000C29:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_281 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000085_00000B37
	goto scr_seq_00000085_00000C4A

scr_seq_00000085_00000C48:
	.byte 0x02, 0x00
scr_seq_00000085_00000C4A:
	scrcmd_190 0
	scrcmd_693 32773
	comparevartovalue VAR_SPECIAL_x8005, 475
	gotoif ge, scr_seq_00000085_00000CD1
	comparevartovalue VAR_SPECIAL_x8005, 351
	gotoif ge, scr_seq_00000085_00000CDC
	comparevartovalue VAR_SPECIAL_x8005, 251
	gotoif ge, scr_seq_00000085_00000CE7
	comparevartovalue VAR_SPECIAL_x8005, 151
	gotoif ge, scr_seq_00000085_00000CF2
	comparevartovalue VAR_SPECIAL_x8005, 101
	gotoif ge, scr_seq_00000085_00000CFD
	comparevartovalue VAR_SPECIAL_x8005, 51
	gotoif ge, scr_seq_00000085_00000D08
	comparevartovalue VAR_SPECIAL_x8005, 31
	gotoif ge, scr_seq_00000085_00000D13
	comparevartovalue VAR_SPECIAL_x8005, 11
	gotoif ge, scr_seq_00000085_00000D1E
	comparevartovalue VAR_SPECIAL_x8005, 1
	gotoif ge, scr_seq_00000085_00000D29
	msgbox 85
	goto scr_seq_00000085_00000D34

scr_seq_00000085_00000CCF:
	.byte 0x02
	.byte 0x00
scr_seq_00000085_00000CD1:
	msgbox 94
	goto scr_seq_00000085_00000D34

scr_seq_00000085_00000CDA:
	.byte 0x02, 0x00
scr_seq_00000085_00000CDC:
	msgbox 93
	goto scr_seq_00000085_00000D34

scr_seq_00000085_00000CE5:
	.byte 0x02, 0x00
scr_seq_00000085_00000CE7:
	msgbox 92
	goto scr_seq_00000085_00000D34

scr_seq_00000085_00000CF0:
	.byte 0x02, 0x00
scr_seq_00000085_00000CF2:
	msgbox 91
	goto scr_seq_00000085_00000D34

scr_seq_00000085_00000CFB:
	.byte 0x02, 0x00
scr_seq_00000085_00000CFD:
	msgbox 90
	goto scr_seq_00000085_00000D34

scr_seq_00000085_00000D06:
	.byte 0x02, 0x00
scr_seq_00000085_00000D08:
	msgbox 89
	goto scr_seq_00000085_00000D34

scr_seq_00000085_00000D11:
	.byte 0x02, 0x00
scr_seq_00000085_00000D13:
	msgbox 88
	goto scr_seq_00000085_00000D34

scr_seq_00000085_00000D1C:
	.byte 0x02, 0x00
scr_seq_00000085_00000D1E:
	msgbox 87
	goto scr_seq_00000085_00000D34

scr_seq_00000085_00000D27:
	.byte 0x02, 0x00
scr_seq_00000085_00000D29:
	msgbox 86
	goto scr_seq_00000085_00000D34

scr_seq_00000085_00000D32:
	.byte 0x02, 0x00
scr_seq_00000085_00000D34:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000085_00000D3C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_190 0
	copyvar VAR_TEMP_x4001, VAR_OBJ_1
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif eq, scr_seq_00000085_00000D90
	comparevartovalue VAR_TEMP_x4001, 97
	gotoif eq, scr_seq_00000085_00000D9B
	comparevartovalue VAR_TEMP_x4001, 365
	gotoif eq, scr_seq_00000085_00000DA6
	comparevartovalue VAR_TEMP_x4001, 366
	gotoif eq, scr_seq_00000085_00000DB1
	comparevartovalue VAR_TEMP_x4001, 354
	gotoif eq, scr_seq_00000085_00000DBC
	end

scr_seq_00000085_00000D90:
	msgbox 96
	goto scr_seq_00000085_00000DC7

scr_seq_00000085_00000D99:
	.byte 0x02, 0x00
scr_seq_00000085_00000D9B:
	msgbox 95
	goto scr_seq_00000085_00000DC7

scr_seq_00000085_00000DA4:
	.byte 0x02, 0x00
scr_seq_00000085_00000DA6:
	msgbox 97
	goto scr_seq_00000085_00000DC7

scr_seq_00000085_00000DAF:
	.byte 0x02
	.byte 0x00
scr_seq_00000085_00000DB1:
	msgbox 98
	goto scr_seq_00000085_00000DC7

scr_seq_00000085_00000DBA:
	.byte 0x02, 0x00
scr_seq_00000085_00000DBC:
	msgbox 99
	goto scr_seq_00000085_00000DC7

scr_seq_00000085_00000DC5:
	.byte 0x02, 0x00
scr_seq_00000085_00000DC7:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
