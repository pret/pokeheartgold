#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000089_0000027D ; 000
	scrdef scr_seq_00000089_00000C09 ; 001
	scrdef scr_seq_00000089_00000D6E ; 002
	scrdef scr_seq_00000089_00000D70 ; 003
	scrdef scr_seq_00000089_00000D72 ; 004
	scrdef scr_seq_00000089_000004B4 ; 005
	scrdef scr_seq_00000089_000006F8 ; 006
	scrdef scr_seq_00000089_000008A9 ; 007
	scrdef scr_seq_00000089_00000A56 ; 008
	scrdef scr_seq_00000089_00000C52 ; 009
	scrdef scr_seq_00000089_00000C99 ; 010
	scrdef scr_seq_00000089_00000CE0 ; 011
	scrdef scr_seq_00000089_00000D27 ; 012
	scrdef scr_seq_00000089_00000F2F ; 013
	scrdef scr_seq_00000089_00000F5C ; 014
	scrdef scr_seq_00000089_00000F89 ; 015
	scrdef scr_seq_00000089_00000FB6 ; 016
	scrdef scr_seq_00000089_00000FE3 ; 017
	scrdef scr_seq_00000089_00001010 ; 018
	scrdef scr_seq_00000089_0000103D ; 019
	scrdef scr_seq_00000089_0000106A ; 020
	scrdef scr_seq_00000089_00001097 ; 021
	scrdef scr_seq_00000089_000010C4 ; 022
	scrdef scr_seq_00000089_000010F1 ; 023
	scrdef scr_seq_00000089_0000111E ; 024
	scrdef scr_seq_00000089_0000114B ; 025
	scrdef scr_seq_00000089_00001178 ; 026
	scrdef scr_seq_00000089_000011A5 ; 027
	scrdef scr_seq_00000089_000011D2 ; 028
	scrdef scr_seq_00000089_00001205 ; 029
	scrdef scr_seq_00000089_000000DC ; 030
	scrdef scr_seq_00000089_00000088 ; 031
	scrdef scr_seq_00000089_00000086 ; 032
	scrdef_end

scr_seq_00000089_00000086:
	end

scr_seq_00000089_00000088:
	comparevartovalue VAR_UNK_40AC, 4
	gotoif eq, scr_seq_00000089_000000BE
	comparevartovalue VAR_UNK_40AC, 5
	gotoif eq, scr_seq_00000089_000000BE
	comparevartovalue VAR_UNK_40AC, 6
	gotoif eq, scr_seq_00000089_000000BE
	comparevartovalue VAR_UNK_40AC, 7
	gotoif eq, scr_seq_00000089_000000BE
	end

scr_seq_00000089_000000BE:
	setvar VAR_UNK_40AC, 8
	setvar VAR_UNK_40A9, 2
	setflag FLAG_UNK_24B
	setflag FLAG_UNK_24C
	setflag FLAG_UNK_24D
	clearflag FLAG_UNK_252
	end

scr_seq_00000089_000000DC:
	comparevartovalue VAR_UNK_40AC, 9
	callif ge, scr_seq_00000089_0000025D
	comparevartovalue VAR_UNK_40AD, 2
	gotoif ne, scr_seq_00000089_00000108
	scrcmd_339 0, 44, 0, 3, 2
	goto scr_seq_00000089_00000133

scr_seq_00000089_00000108:
	comparevartovalue VAR_UNK_40AD, 1
	gotoif ne, scr_seq_00000089_00000127
	scrcmd_339 0, 44, 0, 3, 1
	goto scr_seq_00000089_00000133

scr_seq_00000089_00000127:
	scrcmd_339 0, 44, 0, 3, 0
scr_seq_00000089_00000133:
	comparevartovalue VAR_UNK_40AE, 2
	gotoif ne, scr_seq_00000089_00000152
	scrcmd_339 2, 18, 0, 3, 2
	goto scr_seq_00000089_0000017D

scr_seq_00000089_00000152:
	comparevartovalue VAR_UNK_40AE, 1
	gotoif ne, scr_seq_00000089_00000171
	scrcmd_339 2, 18, 0, 3, 1
	goto scr_seq_00000089_0000017D

scr_seq_00000089_00000171:
	scrcmd_339 2, 18, 0, 3, 0
scr_seq_00000089_0000017D:
	comparevartovalue VAR_UNK_40AF, 2
	gotoif ne, scr_seq_00000089_0000019C
	scrcmd_339 3, 44, 0, 10, 2
	goto scr_seq_00000089_000001C7

scr_seq_00000089_0000019C:
	comparevartovalue VAR_UNK_40AF, 1
	gotoif ne, scr_seq_00000089_000001BB
	scrcmd_339 3, 44, 0, 10, 1
	goto scr_seq_00000089_000001C7

scr_seq_00000089_000001BB:
	scrcmd_339 3, 44, 0, 10, 0
scr_seq_00000089_000001C7:
	comparevartovalue VAR_UNK_40B0, 2
	gotoif ne, scr_seq_00000089_000001E6
	scrcmd_339 4, 44, 0, 28, 2
	goto scr_seq_00000089_00000211

scr_seq_00000089_000001E6:
	comparevartovalue VAR_UNK_40B0, 1
	gotoif ne, scr_seq_00000089_00000205
	scrcmd_339 4, 44, 0, 28, 1
	goto scr_seq_00000089_00000211

scr_seq_00000089_00000205:
	scrcmd_339 4, 44, 0, 28, 0
scr_seq_00000089_00000211:
	comparevartovalue VAR_UNK_40B1, 2
	gotoif ne, scr_seq_00000089_00000230
	scrcmd_339 5, 18, 0, 28, 2
	goto scr_seq_00000089_0000025B

scr_seq_00000089_00000230:
	comparevartovalue VAR_UNK_40B1, 1
	gotoif ne, scr_seq_00000089_0000024F
	scrcmd_339 5, 18, 0, 28, 1
	goto scr_seq_00000089_0000025B

scr_seq_00000089_0000024F:
	scrcmd_339 5, 18, 0, 28, 0
scr_seq_00000089_0000025B:
	end

scr_seq_00000089_0000025D:
	setvar VAR_UNK_40AD, 2
	setvar VAR_UNK_40AE, 2
	setvar VAR_UNK_40AF, 2
	setvar VAR_UNK_40B0, 2
	setvar VAR_UNK_40B1, 2
	return

scr_seq_00000089_0000027D:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_00000089_00000428
	wait_movement
	apply_movement 0, scr_seq_00000089_00000454
	wait_movement
	play_se SEQ_SE_GS_AJITO_SIREN
	scrcmd_709
	scrcmd_074 2173
	scrcmd_105 16384, 16385
	comparevartovalue VAR_TEMP_x4001, 4
	gotoif ne, scr_seq_00000089_000002C4
	addvar VAR_TEMP_x4001, 1
	goto scr_seq_00000089_000002D0

scr_seq_00000089_000002BE:
	.byte 0x16, 0x00
	.byte 0x0c, 0x00, 0x00, 0x00
scr_seq_00000089_000002C4:
	subvar VAR_TEMP_x4001, 1
	goto scr_seq_00000089_0000036C

scr_seq_00000089_000002D0:
	scrcmd_338 1, 33, 0
	clearflag FLAG_UNK_1E8
	scrcmd_100 1
	scrcmd_339 1, 33, 0, 16385, 2
	apply_movement 1, scr_seq_00000089_00000460
	wait_movement
	apply_movement 255, scr_seq_00000089_00000478
	wait_movement
	msgbox 0
	closemsg
	scrcmd_213 223, 0, 0, 0
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000089_00000C03
	apply_movement 1, scr_seq_00000089_00000490
	wait_movement
	scrcmd_339 1, 33, 0, 16385, 3
	apply_movement 1, scr_seq_00000089_00000460
	wait_movement
	msgbox 1
	closemsg
	scrcmd_213 224, 0, 0, 0
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000089_00000C03
	apply_movement 1, scr_seq_00000089_00000490
	wait_movement
	goto scr_seq_00000089_00000402

scr_seq_00000089_0000036C:
	scrcmd_338 1, 33, 0
	clearflag FLAG_UNK_1E8
	scrcmd_100 1
	scrcmd_339 1, 33, 0, 16385, 2
	apply_movement 1, scr_seq_00000089_0000046C
	wait_movement
	apply_movement 255, scr_seq_00000089_00000484
	wait_movement
	msgbox 0
	closemsg
	scrcmd_213 223, 0, 0, 0
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000089_00000C03
	apply_movement 1, scr_seq_00000089_00000490
	wait_movement
	scrcmd_339 1, 33, 0, 16385, 3
	apply_movement 1, scr_seq_00000089_0000046C
	wait_movement
	msgbox 1
	closemsg
	scrcmd_213 224, 0, 0, 0
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000089_00000C03
	apply_movement 1, scr_seq_00000089_00000490
	wait_movement
scr_seq_00000089_00000402:
	scrcmd_339 1, 37, 0, 0, 2
	setflag FLAG_UNK_1E8
	setvar VAR_UNK_40AD, 2
	apply_movement 0, scr_seq_00000089_0000049C
	wait_movement
	releaseall
	end

scr_seq_00000089_00000426:
	.byte 0x00, 0x00

scr_seq_00000089_00000428:
	.short 75, 1
	.short 63, 2
	.short 3, 2
	.short 63, 1
	.short 2, 2
	.short 63, 1
	.short 3, 2
	.short 63, 1
	.short 0, 2
	.short 63, 1
	.short 254, 0

scr_seq_00000089_00000454:
	.short 75, 1
	.short 63, 2
	.short 254, 0

scr_seq_00000089_00000460:
	.short 23, 11
	.short 0, 2
	.short 254, 0

scr_seq_00000089_0000046C:
	.short 23, 11
	.short 1, 2
	.short 254, 0

scr_seq_00000089_00000478:
	.short 1, 2
	.short 63, 2
	.short 254, 0

scr_seq_00000089_00000484:
	.short 0, 2
	.short 63, 2
	.short 254, 0

scr_seq_00000089_00000490:
	.short 2, 2
	.short 22, 10
	.short 254, 0

scr_seq_00000089_0000049C:
	.short 2, 1
	.short 254, 0

scr_seq_00000089_000004A4:
	.short 1, 1
	.short 254, 0

scr_seq_00000089_000004AC:
	.short 0, 1
	.short 254, 0
scr_seq_00000089_000004B4:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_00000089_00000428
	wait_movement
	apply_movement 2, scr_seq_00000089_00000454
	wait_movement
	play_se SEQ_SE_GS_AJITO_SIREN
	scrcmd_709
	scrcmd_105 16384, 16385
	comparevartovalue VAR_TEMP_x4001, 4
	gotoif ne, scr_seq_00000089_000004F7
	addvar VAR_TEMP_x4001, 1
	goto scr_seq_00000089_00000503

scr_seq_00000089_000004F1:
	.byte 0x16, 0x00, 0x0c, 0x00, 0x00, 0x00
scr_seq_00000089_000004F7:
	subvar VAR_TEMP_x4001, 1
	goto scr_seq_00000089_000005A9

scr_seq_00000089_00000503:
	scrcmd_338 1, 27, 0
	clearflag FLAG_UNK_1E8
	scrcmd_100 1
	scrcmd_339 1, 27, 0, 16385, 2
	apply_movement 1, scr_seq_00000089_00000668
	wait_movement
	apply_movement 255, scr_seq_00000089_00000478
	wait_movement
	msgbox 0
	closemsg
	scrcmd_213 223, 0, 0, 0
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000089_00000C03
	apply_movement 1, scr_seq_00000089_000006C8
	wait_movement
	scrcmd_339 1, 27, 0, 16385, 2
	apply_movement 1, scr_seq_00000089_00000668
	wait_movement
	apply_movement 255, scr_seq_00000089_00000478
	wait_movement
	msgbox 1
	closemsg
	scrcmd_213 224, 0, 0, 0
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000089_00000C03
	apply_movement 1, scr_seq_00000089_000006C8
	wait_movement
	goto scr_seq_00000089_00000649

scr_seq_00000089_000005A9:
	scrcmd_338 1, 27, 0
	clearflag FLAG_UNK_1E8
	scrcmd_100 1
	scrcmd_339 1, 27, 0, 16385, 2
	apply_movement 1, scr_seq_00000089_00000674
	wait_movement
	apply_movement 255, scr_seq_00000089_00000484
	wait_movement
	msgbox 0
	closemsg
	scrcmd_213 223, 0, 0, 0
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000089_00000C03
	apply_movement 1, scr_seq_00000089_000006C8
	wait_movement
	scrcmd_339 1, 27, 0, 16385, 2
	apply_movement 1, scr_seq_00000089_00000674
	wait_movement
	apply_movement 255, scr_seq_00000089_00000484
	wait_movement
	msgbox 1
	closemsg
	scrcmd_213 224, 0, 0, 0
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000089_00000C03
	apply_movement 1, scr_seq_00000089_000006C8
	wait_movement
scr_seq_00000089_00000649:
	scrcmd_101 1
	setflag FLAG_UNK_1E8
	setvar VAR_UNK_40AE, 2
	apply_movement 2, scr_seq_00000089_0000049C
	wait_movement
	releaseall
	end

scr_seq_00000089_00000665:
	.byte 0x00, 0x00, 0x00

scr_seq_00000089_00000668:
	.short 22, 9
	.short 0, 2
	.short 254, 0

scr_seq_00000089_00000674:
	.short 22, 9
	.short 1, 2
	.short 254, 0

scr_seq_00000089_00000680:
	.short 23, 11
	.short 0, 2
	.short 254, 0

scr_seq_00000089_0000068C:
	.short 23, 11
	.short 1, 2
	.short 254, 0

scr_seq_00000089_00000698:
	.short 23, 11
	.short 0, 2
	.short 254, 0

scr_seq_00000089_000006A4:
	.short 23, 11
	.short 1, 2
	.short 254, 0

scr_seq_00000089_000006B0:
	.short 22, 9
	.short 0, 2
	.short 254, 0

scr_seq_00000089_000006BC:
	.short 22, 9
	.short 1, 2
	.short 254, 0

scr_seq_00000089_000006C8:
	.short 3, 2
	.short 23, 10
	.short 254, 0

scr_seq_00000089_000006D4:
	.short 2, 2
	.short 22, 10
	.short 254, 0

scr_seq_00000089_000006E0:
	.short 2, 2
	.short 22, 10
	.short 254, 0

scr_seq_00000089_000006EC:
	.short 3, 2
	.short 23, 10
	.short 254, 0
scr_seq_00000089_000006F8:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_00000089_00000428
	wait_movement
	apply_movement 3, scr_seq_00000089_00000454
	wait_movement
	play_se SEQ_SE_GS_AJITO_SIREN
	scrcmd_709
	scrcmd_105 16384, 16385
	comparevartovalue VAR_TEMP_x4001, 11
	gotoif ne, scr_seq_00000089_0000073B
	addvar VAR_TEMP_x4001, 1
	goto scr_seq_00000089_00000747

scr_seq_00000089_00000735:
	.byte 0x16, 0x00, 0x0c, 0x00, 0x00, 0x00
scr_seq_00000089_0000073B:
	subvar VAR_TEMP_x4001, 1
	goto scr_seq_00000089_000007ED

scr_seq_00000089_00000747:
	scrcmd_338 1, 33, 0
	clearflag FLAG_UNK_1E8
	scrcmd_100 1
	scrcmd_339 1, 33, 0, 16385, 2
	apply_movement 1, scr_seq_00000089_00000680
	wait_movement
	apply_movement 255, scr_seq_00000089_00000478
	wait_movement
	msgbox 0
	closemsg
	scrcmd_213 223, 0, 0, 0
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000089_00000C03
	apply_movement 1, scr_seq_00000089_000006D4
	wait_movement
	scrcmd_339 1, 33, 0, 16385, 2
	apply_movement 1, scr_seq_00000089_00000680
	wait_movement
	apply_movement 255, scr_seq_00000089_00000478
	wait_movement
	msgbox 1
	closemsg
	scrcmd_213 224, 0, 0, 0
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000089_00000C03
	apply_movement 1, scr_seq_00000089_000006D4
	wait_movement
	goto scr_seq_00000089_0000088D

scr_seq_00000089_000007ED:
	scrcmd_338 1, 33, 0
	clearflag FLAG_UNK_1E8
	scrcmd_100 1
	scrcmd_339 1, 33, 0, 16385, 2
	apply_movement 1, scr_seq_00000089_0000068C
	wait_movement
	apply_movement 255, scr_seq_00000089_00000484
	wait_movement
	msgbox 0
	closemsg
	scrcmd_213 223, 0, 0, 0
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000089_00000C03
	apply_movement 1, scr_seq_00000089_000006D4
	wait_movement
	scrcmd_339 1, 33, 0, 16385, 2
	apply_movement 1, scr_seq_00000089_0000068C
	wait_movement
	apply_movement 255, scr_seq_00000089_00000484
	wait_movement
	msgbox 1
	closemsg
	scrcmd_213 224, 0, 0, 0
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000089_00000C03
	apply_movement 1, scr_seq_00000089_000006D4
	wait_movement
scr_seq_00000089_0000088D:
	scrcmd_101 1
	setflag FLAG_UNK_1E8
	setvar VAR_UNK_40AF, 2
	apply_movement 3, scr_seq_00000089_0000049C
	wait_movement
	releaseall
	end

scr_seq_00000089_000008A9:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_00000089_00000428
	wait_movement
	apply_movement 4, scr_seq_00000089_00000454
	wait_movement
	play_se SEQ_SE_GS_AJITO_SIREN
	scrcmd_709
	scrcmd_105 16384, 16385
	comparevartovalue VAR_TEMP_x4001, 29
	gotoif ne, scr_seq_00000089_000008EC
	addvar VAR_TEMP_x4001, 1
	goto scr_seq_00000089_000008F8

scr_seq_00000089_000008E6:
	.byte 0x16, 0x00, 0x0c, 0x00, 0x00, 0x00
scr_seq_00000089_000008EC:
	subvar VAR_TEMP_x4001, 1
	goto scr_seq_00000089_0000099E

scr_seq_00000089_000008F8:
	scrcmd_338 1, 33, 0
	clearflag FLAG_UNK_1E8
	scrcmd_100 1
	scrcmd_339 1, 33, 0, 16385, 2
	apply_movement 1, scr_seq_00000089_00000698
	wait_movement
	apply_movement 255, scr_seq_00000089_00000478
	wait_movement
	msgbox 0
	closemsg
	scrcmd_213 223, 0, 0, 0
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000089_00000C03
	apply_movement 1, scr_seq_00000089_000006E0
	wait_movement
	scrcmd_339 1, 33, 0, 16385, 2
	apply_movement 1, scr_seq_00000089_00000698
	wait_movement
	apply_movement 255, scr_seq_00000089_00000478
	wait_movement
	msgbox 1
	closemsg
	scrcmd_213 224, 0, 0, 0
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000089_00000C03
	apply_movement 1, scr_seq_00000089_000006E0
	wait_movement
	goto scr_seq_00000089_00000A3E

scr_seq_00000089_0000099E:
	scrcmd_338 1, 33, 0
	clearflag FLAG_UNK_1E8
	scrcmd_100 1
	scrcmd_339 1, 33, 0, 16385, 2
	apply_movement 1, scr_seq_00000089_000006A4
	wait_movement
	apply_movement 255, scr_seq_00000089_00000484
	wait_movement
	msgbox 0
	closemsg
	scrcmd_213 223, 0, 0, 0
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000089_00000C03
	apply_movement 1, scr_seq_00000089_000006E0
	wait_movement
	scrcmd_339 1, 33, 0, 16385, 2
	apply_movement 1, scr_seq_00000089_000006A4
	wait_movement
	apply_movement 255, scr_seq_00000089_00000484
	wait_movement
	msgbox 1
	closemsg
	scrcmd_213 224, 0, 0, 0
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000089_00000C03
	apply_movement 1, scr_seq_00000089_000006E0
	wait_movement
scr_seq_00000089_00000A3E:
	scrcmd_101 1
	setvar VAR_UNK_40B0, 2
	apply_movement 4, scr_seq_00000089_0000049C
	wait_movement
	releaseall
	end

scr_seq_00000089_00000A56:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_00000089_00000428
	wait_movement
	apply_movement 5, scr_seq_00000089_00000454
	wait_movement
	play_se SEQ_SE_GS_AJITO_SIREN
	scrcmd_709
	scrcmd_105 16384, 16385
	comparevartovalue VAR_TEMP_x4001, 29
	gotoif ne, scr_seq_00000089_00000A99
	addvar VAR_TEMP_x4001, 1
	goto scr_seq_00000089_00000AA5

scr_seq_00000089_00000A93:
	.byte 0x16, 0x00, 0x0c, 0x00, 0x00, 0x00
scr_seq_00000089_00000A99:
	subvar VAR_TEMP_x4001, 1
	goto scr_seq_00000089_00000B4B

scr_seq_00000089_00000AA5:
	scrcmd_338 1, 27, 0
	clearflag FLAG_UNK_1E8
	scrcmd_100 1
	scrcmd_339 1, 27, 0, 16385, 2
	apply_movement 1, scr_seq_00000089_000006B0
	wait_movement
	apply_movement 255, scr_seq_00000089_00000478
	wait_movement
	msgbox 0
	closemsg
	scrcmd_213 223, 0, 0, 0
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000089_00000C03
	apply_movement 1, scr_seq_00000089_000006EC
	wait_movement
	scrcmd_339 1, 27, 0, 16385, 2
	apply_movement 1, scr_seq_00000089_000006B0
	wait_movement
	apply_movement 255, scr_seq_00000089_00000478
	wait_movement
	msgbox 1
	closemsg
	scrcmd_213 224, 0, 0, 0
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000089_00000C03
	apply_movement 1, scr_seq_00000089_000006EC
	wait_movement
	goto scr_seq_00000089_00000BEB

scr_seq_00000089_00000B4B:
	scrcmd_338 1, 27, 0
	clearflag FLAG_UNK_1E8
	scrcmd_100 1
	scrcmd_339 1, 27, 0, 16385, 2
	apply_movement 1, scr_seq_00000089_000006BC
	wait_movement
	apply_movement 255, scr_seq_00000089_00000484
	wait_movement
	msgbox 0
	closemsg
	scrcmd_213 223, 0, 0, 0
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000089_00000C03
	apply_movement 1, scr_seq_00000089_000006EC
	wait_movement
	scrcmd_339 1, 27, 0, 16385, 2
	apply_movement 1, scr_seq_00000089_000006BC
	wait_movement
	apply_movement 255, scr_seq_00000089_00000484
	wait_movement
	msgbox 1
	closemsg
	scrcmd_213 224, 0, 0, 0
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000089_00000C03
	apply_movement 1, scr_seq_00000089_000006EC
	wait_movement
scr_seq_00000089_00000BEB:
	scrcmd_101 1
	setvar VAR_UNK_40B1, 2
	apply_movement 5, scr_seq_00000089_0000049C
	wait_movement
	releaseall
	end

scr_seq_00000089_00000C03:
	scrcmd_219
	releaseall
	end

scr_seq_00000089_00000C09:
	play_se SEQ_SE_DP_SELECT
	lockall
	comparevartovalue VAR_UNK_40AD, 0
	gotoif ne, scr_seq_00000089_00000C2B
	msgbox 2
	goto scr_seq_00000089_00000C4A

scr_seq_00000089_00000C25:
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
scr_seq_00000089_00000C2B:
	comparevartovalue VAR_UNK_40AD, 1
	gotoif ne, scr_seq_00000089_00000C47
	msgbox 3
	goto scr_seq_00000089_00000C4A

scr_seq_00000089_00000C41:
	.byte 0x16, 0x00, 0x03, 0x00, 0x00, 0x00
scr_seq_00000089_00000C47:
	msgbox 4
scr_seq_00000089_00000C4A:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000089_00000C52:
	play_se SEQ_SE_DP_SELECT
	lockall
	comparevartovalue VAR_UNK_40AE, 0
	gotoif ne, scr_seq_00000089_00000C74
	msgbox 2
	goto scr_seq_00000089_00000C4A

scr_seq_00000089_00000C6E:
	.byte 0x16, 0x00
	.byte 0x1f, 0x00, 0x00, 0x00
scr_seq_00000089_00000C74:
	comparevartovalue VAR_UNK_40AE, 1
	gotoif ne, scr_seq_00000089_00000C90
	msgbox 3
	goto scr_seq_00000089_00000C4A

scr_seq_00000089_00000C8A:
	.byte 0x16, 0x00, 0x03, 0x00, 0x00, 0x00
scr_seq_00000089_00000C90:
	msgbox 4
	goto scr_seq_00000089_00000C4A

scr_seq_00000089_00000C99:
	play_se SEQ_SE_DP_SELECT
	lockall
	comparevartovalue VAR_UNK_40AF, 0
	gotoif ne, scr_seq_00000089_00000CBB
	msgbox 2
	goto scr_seq_00000089_00000C4A

scr_seq_00000089_00000CB5:
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
scr_seq_00000089_00000CBB:
	comparevartovalue VAR_UNK_40AF, 1
	gotoif ne, scr_seq_00000089_00000CD7
	msgbox 3
	goto scr_seq_00000089_00000C4A

scr_seq_00000089_00000CD1:
	.byte 0x16, 0x00, 0x03, 0x00, 0x00, 0x00
scr_seq_00000089_00000CD7:
	msgbox 4
	goto scr_seq_00000089_00000C4A

scr_seq_00000089_00000CE0:
	play_se SEQ_SE_DP_SELECT
	lockall
	comparevartovalue VAR_UNK_40B0, 0
	gotoif ne, scr_seq_00000089_00000D02
	msgbox 2
	goto scr_seq_00000089_00000C4A

scr_seq_00000089_00000CFC:
	.byte 0x16, 0x00, 0x1f, 0x00
	.byte 0x00, 0x00
scr_seq_00000089_00000D02:
	comparevartovalue VAR_UNK_40B0, 1
	gotoif ne, scr_seq_00000089_00000D1E
	msgbox 3
	goto scr_seq_00000089_00000C4A

scr_seq_00000089_00000D18:
	.byte 0x16, 0x00, 0x03, 0x00, 0x00, 0x00
scr_seq_00000089_00000D1E:
	msgbox 4
	goto scr_seq_00000089_00000C4A

scr_seq_00000089_00000D27:
	play_se SEQ_SE_DP_SELECT
	lockall
	comparevartovalue VAR_UNK_40B1, 0
	gotoif ne, scr_seq_00000089_00000D49
	msgbox 2
	goto scr_seq_00000089_00000C4A

scr_seq_00000089_00000D43:
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
scr_seq_00000089_00000D49:
	comparevartovalue VAR_UNK_40B1, 1
	gotoif ne, scr_seq_00000089_00000D65
	msgbox 3
	goto scr_seq_00000089_00000C4A

scr_seq_00000089_00000D5F:
	.byte 0x16
	.byte 0x00, 0x03, 0x00, 0x00, 0x00
scr_seq_00000089_00000D65:
	msgbox 4
	goto scr_seq_00000089_00000C4A

scr_seq_00000089_00000D6E:
	end

scr_seq_00000089_00000D70:
	end

scr_seq_00000089_00000D72:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40AC, 9
	gotoif ge, scr_seq_00000089_00000F24
	checkflag FLAG_UNK_0D6
	gotoif eq, scr_seq_00000089_00000E58
	msgbox 5
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000089_00000DB7
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000089_00000F1E
scr_seq_00000089_00000DB7:
	play_se SEQ_SE_DP_DENSI01
	msgbox 7
	closemsg
	setflag FLAG_UNK_0D6
	comparevartovalue VAR_UNK_40AD, 2
	gotoif ge, scr_seq_00000089_00000DDF
	setvar VAR_UNK_40AD, 1
	apply_movement 0, scr_seq_00000089_000004A4
scr_seq_00000089_00000DDF:
	comparevartovalue VAR_UNK_40AE, 2
	gotoif ge, scr_seq_00000089_00000DFA
	setvar VAR_UNK_40AE, 1
	apply_movement 2, scr_seq_00000089_000004A4
scr_seq_00000089_00000DFA:
	comparevartovalue VAR_UNK_40AF, 2
	gotoif ge, scr_seq_00000089_00000E15
	setvar VAR_UNK_40AF, 1
	apply_movement 3, scr_seq_00000089_000004A4
scr_seq_00000089_00000E15:
	comparevartovalue VAR_UNK_40B0, 2
	gotoif ge, scr_seq_00000089_00000E30
	setvar VAR_UNK_40B0, 1
	apply_movement 4, scr_seq_00000089_000004A4
scr_seq_00000089_00000E30:
	comparevartovalue VAR_UNK_40B1, 2
	gotoif ge, scr_seq_00000089_00000E4D
	setvar VAR_UNK_40B1, 1
	apply_movement 5, scr_seq_00000089_000004A4
	wait_movement
scr_seq_00000089_00000E4D:
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000089_00000E58:
	msgbox 6
	scrcmd_746
	scrcmd_748 VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000089_00000E7D
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000089_00000F1E
scr_seq_00000089_00000E7D:
	play_se SEQ_SE_DP_DENSI01
	msgbox 7
	closemsg
	clearflag FLAG_UNK_0D6
	comparevartovalue VAR_UNK_40AD, 2
	gotoif ge, scr_seq_00000089_00000EA5
	setvar VAR_UNK_40AD, 0
	apply_movement 0, scr_seq_00000089_000004AC
scr_seq_00000089_00000EA5:
	comparevartovalue VAR_UNK_40AE, 2
	gotoif ge, scr_seq_00000089_00000EC0
	setvar VAR_UNK_40AE, 0
	apply_movement 2, scr_seq_00000089_000004AC
scr_seq_00000089_00000EC0:
	comparevartovalue VAR_UNK_40AF, 2
	gotoif ge, scr_seq_00000089_00000EDB
	setvar VAR_UNK_40AF, 0
	apply_movement 3, scr_seq_00000089_000004AC
scr_seq_00000089_00000EDB:
	comparevartovalue VAR_UNK_40B0, 2
	gotoif ge, scr_seq_00000089_00000EF6
	setvar VAR_UNK_40B0, 0
	apply_movement 4, scr_seq_00000089_000004AC
scr_seq_00000089_00000EF6:
	comparevartovalue VAR_UNK_40B1, 2
	gotoif ge, scr_seq_00000089_00000F13
	setvar VAR_UNK_40B1, 0
	apply_movement 5, scr_seq_00000089_000004AC
	wait_movement
scr_seq_00000089_00000F13:
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000089_00000F1E:
	closemsg
	releaseall
	end

scr_seq_00000089_00000F24:
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000089_00000F2F:
	scrcmd_609
	lockall
	scrcmd_708 1
	play_se SEQ_SE_GS_DOKU_TRAP
	scrcmd_249 109, 21
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000089_000011FF
	setvar VAR_UNK_40B2, 1
	releaseall
	end

scr_seq_00000089_00000F5C:
	scrcmd_609
	lockall
	scrcmd_708 0
	play_se SEQ_SE_GS_DENKI_TRAP
	scrcmd_249 100, 23
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000089_000011FF
	setvar VAR_UNK_40B3, 1
	releaseall
	end

scr_seq_00000089_00000F89:
	scrcmd_609
	lockall
	scrcmd_708 2
	play_se SEQ_SE_GS_IWA_TRAP
	scrcmd_249 74, 21
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000089_000011FF
	setvar VAR_UNK_40B4, 1
	releaseall
	end

scr_seq_00000089_00000FB6:
	scrcmd_609
	lockall
	scrcmd_708 0
	play_se SEQ_SE_GS_DENKI_TRAP
	scrcmd_249 100, 23
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000089_000011FF
	setvar VAR_UNK_40B5, 1
	releaseall
	end

scr_seq_00000089_00000FE3:
	scrcmd_609
	lockall
	scrcmd_708 2
	play_se SEQ_SE_GS_IWA_TRAP
	scrcmd_249 74, 21
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000089_000011FF
	setvar VAR_UNK_40B6, 1
	releaseall
	end

scr_seq_00000089_00001010:
	scrcmd_609
	lockall
	scrcmd_708 0
	play_se SEQ_SE_GS_DENKI_TRAP
	scrcmd_249 100, 23
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000089_000011FF
	setvar VAR_UNK_40B7, 1
	releaseall
	end

scr_seq_00000089_0000103D:
	scrcmd_609
	lockall
	scrcmd_708 0
	play_se SEQ_SE_GS_DENKI_TRAP
	scrcmd_249 100, 23
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000089_000011FF
	setvar VAR_UNK_40B8, 1
	releaseall
	end

scr_seq_00000089_0000106A:
	scrcmd_609
	lockall
	scrcmd_708 1
	play_se SEQ_SE_GS_DOKU_TRAP
	scrcmd_249 109, 21
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000089_000011FF
	setvar VAR_UNK_40B9, 1
	releaseall
	end

scr_seq_00000089_00001097:
	scrcmd_609
	lockall
	scrcmd_708 1
	play_se SEQ_SE_GS_DOKU_TRAP
	scrcmd_249 109, 21
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000089_000011FF
	setvar VAR_UNK_40BA, 1
	releaseall
	end

scr_seq_00000089_000010C4:
	scrcmd_609
	lockall
	scrcmd_708 2
	play_se SEQ_SE_GS_IWA_TRAP
	scrcmd_249 74, 21
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000089_000011FF
	setvar VAR_UNK_40BB, 1
	releaseall
	end

scr_seq_00000089_000010F1:
	scrcmd_609
	lockall
	scrcmd_708 2
	play_se SEQ_SE_GS_IWA_TRAP
	scrcmd_249 74, 21
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000089_000011FF
	setvar VAR_UNK_40BC, 1
	releaseall
	end

scr_seq_00000089_0000111E:
	scrcmd_609
	lockall
	scrcmd_708 1
	play_se SEQ_SE_GS_DOKU_TRAP
	scrcmd_249 109, 21
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000089_000011FF
	setvar VAR_UNK_40BD, 1
	releaseall
	end

scr_seq_00000089_0000114B:
	scrcmd_609
	lockall
	scrcmd_708 0
	play_se SEQ_SE_GS_DENKI_TRAP
	scrcmd_249 100, 23
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000089_000011FF
	setvar VAR_UNK_40BE, 1
	releaseall
	end

scr_seq_00000089_00001178:
	scrcmd_609
	lockall
	scrcmd_708 0
	play_se SEQ_SE_GS_DENKI_TRAP
	scrcmd_249 100, 23
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000089_000011FF
	setvar VAR_UNK_40BF, 1
	releaseall
	end

scr_seq_00000089_000011A5:
	scrcmd_609
	lockall
	scrcmd_708 1
	play_se SEQ_SE_GS_DOKU_TRAP
	scrcmd_249 109, 21
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000089_000011FF
	setvar VAR_UNK_40C0, 1
	releaseall
	end

scr_seq_00000089_000011D2:
	scrcmd_609
	lockall
	scrcmd_708 2
	play_se SEQ_SE_GS_IWA_TRAP
	scrcmd_249 74, 21
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000089_000011FF
	setvar VAR_UNK_40C1, 1
	releaseall
	end

scr_seq_00000089_000011FF:
	scrcmd_219
	releaseall
	end

scr_seq_00000089_00001205:
	scrcmd_609
	lockall
	play_se SEQ_SE_PL_BOWABOWA
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	wait 15, VAR_SPECIAL_x800C
	scrcmd_176 247, 0, 50, 4, 2
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end
	.balign 4, 0
