#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000906_00000670 ; 000
	scrdef scr_seq_00000906_000007B6 ; 001
	scrdef scr_seq_00000906_00000E92 ; 002
	scrdef scr_seq_00000906_00001214 ; 003
	scrdef scr_seq_00000906_00001227 ; 004
	scrdef scr_seq_00000906_0000123A ; 005
	scrdef scr_seq_00000906_000012E9 ; 006
	scrdef scr_seq_00000906_000012FC ; 007
	scrdef scr_seq_00000906_0000130F ; 008
	scrdef scr_seq_00000906_00001322 ; 009
	scrdef scr_seq_00000906_00000102 ; 010
	scrdef scr_seq_00000906_00000199 ; 011
	scrdef scr_seq_00000906_000001D4 ; 012
	scrdef scr_seq_00000906_0000020F ; 013
	scrdef scr_seq_00000906_0000024A ; 014
	scrdef scr_seq_00000906_00000285 ; 015
	scrdef scr_seq_00000906_000002C0 ; 016
	scrdef scr_seq_00000906_000002FB ; 017
	scrdef scr_seq_00000906_00000336 ; 018
	scrdef scr_seq_00000906_00000371 ; 019
	scrdef scr_seq_00000906_000003AC ; 020
	scrdef scr_seq_00000906_000003E7 ; 021
	scrdef scr_seq_00000906_00000422 ; 022
	scrdef scr_seq_00000906_0000045D ; 023
	scrdef scr_seq_00000906_00000498 ; 024
	scrdef scr_seq_00000906_000004D3 ; 025
	scrdef scr_seq_00000906_0000050E ; 026
	scrdef scr_seq_00000906_00000549 ; 027
	scrdef scr_seq_00000906_00000584 ; 028
	scrdef scr_seq_00000906_000005BF ; 029
	scrdef scr_seq_00000906_000005FA ; 030
	scrdef scr_seq_00000906_00000635 ; 031
	scrdef scr_seq_00000906_00000086 ; 032
	scrdef_end

scr_seq_00000906_00000086:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_00000906_000000A3
	goto scr_seq_00000906_000000AB

scr_seq_00000906_0000009D:
	.byte 0x16, 0x00, 0x06
	.byte 0x00, 0x00, 0x00
scr_seq_00000906_000000A3:
	goto scr_seq_00000906_000000FC

scr_seq_00000906_000000A9:
	.byte 0x02, 0x00
scr_seq_00000906_000000AB:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_00000906_000000C6
	setflag FLAG_UNK_2DA
	goto scr_seq_00000906_000000FA

scr_seq_00000906_000000C6:
	comparevartovalue VAR_TEMP_x4000, 8
	gotoif ne, scr_seq_00000906_000000DD
	setflag FLAG_UNK_2DA
	goto scr_seq_00000906_000000FA

scr_seq_00000906_000000DD:
	comparevartovalue VAR_TEMP_x4000, 9
	gotoif ne, scr_seq_00000906_000000F4
	setflag FLAG_UNK_2DA
	goto scr_seq_00000906_000000FA

scr_seq_00000906_000000F4:
	goto scr_seq_00000906_000000FC

scr_seq_00000906_000000FA:
	end

scr_seq_00000906_000000FC:
	clearflag FLAG_UNK_2DA
	end

scr_seq_00000906_00000102:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_00000906_0000013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000906_00000139
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_780 0, 0
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000906_00000139:
	releaseall
	end

scr_seq_00000906_0000013D:
	hasitem ITEM_COIN_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000906_00000177
	scrcmd_784 3, 0
	scrcmd_532 32780, 3
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000906_00000186
	scrcmd_784 3, 1
	setvar VAR_TEMP_x4001, 0
	return

scr_seq_00000906_00000177:
	msgbox 25
	waitbutton
	closemsg
	setvar VAR_TEMP_x4001, 1
	return

scr_seq_00000906_00000186:
	msgbox 26
	waitbutton
	closemsg
	scrcmd_784 3, 1
	setvar VAR_TEMP_x4001, 1
	return

scr_seq_00000906_00000199:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_00000906_0000013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000906_000001D0
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_780 1, 0
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000906_000001D0:
	releaseall
	end

scr_seq_00000906_000001D4:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_00000906_0000013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000906_0000020B
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_780 2, 0
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000906_0000020B:
	releaseall
	end

scr_seq_00000906_0000020F:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_00000906_0000013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000906_00000246
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_780 3, 0
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000906_00000246:
	releaseall
	end

scr_seq_00000906_0000024A:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_00000906_0000013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000906_00000281
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_780 4, 0
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000906_00000281:
	releaseall
	end

scr_seq_00000906_00000285:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_00000906_0000013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000906_000002BC
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_780 5, 0
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000906_000002BC:
	releaseall
	end

scr_seq_00000906_000002C0:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_00000906_0000013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000906_000002F7
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_780 6, 0
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000906_000002F7:
	releaseall
	end

scr_seq_00000906_000002FB:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_00000906_0000013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000906_00000332
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_780 7, 0
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000906_00000332:
	releaseall
	end

scr_seq_00000906_00000336:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_00000906_0000013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000906_0000036D
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_780 8, 0
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000906_0000036D:
	releaseall
	end

scr_seq_00000906_00000371:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_00000906_0000013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000906_000003A8
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_780 9, 0
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000906_000003A8:
	releaseall
	end

scr_seq_00000906_000003AC:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_00000906_0000013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000906_000003E3
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_780 10, 0
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000906_000003E3:
	releaseall
	end

scr_seq_00000906_000003E7:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_00000906_0000013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000906_0000041E
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_780 11, 0
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000906_0000041E:
	releaseall
	end

scr_seq_00000906_00000422:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_00000906_0000013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000906_00000459
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_780 21, 0
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000906_00000459:
	releaseall
	end

scr_seq_00000906_0000045D:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_00000906_0000013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000906_00000494
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_780 12, 0
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000906_00000494:
	releaseall
	end

scr_seq_00000906_00000498:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_00000906_0000013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000906_000004CF
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_780 13, 0
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000906_000004CF:
	releaseall
	end

scr_seq_00000906_000004D3:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_00000906_0000013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000906_0000050A
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_780 14, 0
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000906_0000050A:
	releaseall
	end

scr_seq_00000906_0000050E:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_00000906_0000013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000906_00000545
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_780 15, 0
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000906_00000545:
	releaseall
	end

scr_seq_00000906_00000549:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_00000906_0000013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000906_00000580
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_780 16, 0
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000906_00000580:
	releaseall
	end

scr_seq_00000906_00000584:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_00000906_0000013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000906_000005BB
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_780 17, 0
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000906_000005BB:
	releaseall
	end

scr_seq_00000906_000005BF:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_00000906_0000013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000906_000005F6
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_780 18, 0
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000906_000005F6:
	releaseall
	end

scr_seq_00000906_000005FA:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_00000906_0000013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000906_00000631
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_780 19, 0
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000906_00000631:
	releaseall
	end

scr_seq_00000906_00000635:
	play_se SEQ_SE_DP_SELECT
	lockall
	call scr_seq_00000906_0000013D
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000906_0000066C
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_780 20, 0
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
scr_seq_00000906_0000066C:
	releaseall
	end

scr_seq_00000906_00000670:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	hasitem ITEM_COIN_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000906_0000069B
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000906_0000069B:
	scrcmd_784 3, 0
	msgbox 2
	scrcmd_746
	scrcmd_116 0, 20, 2
	scrcmd_113 20, 7
scr_seq_00000906_000006B1:
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 127, 255, 0
	scrcmd_751 128, 255, 1
	scrcmd_751 129, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000906_000006FE
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000906_0000074A
	msgbox 6
	goto scr_seq_00000906_000007A4

scr_seq_00000906_000006FC:
	.byte 0x02, 0x00
scr_seq_00000906_000006FE:
	hasenoughmoneyimmediate 32780, 1000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000906_000007A1
	checkgivecoins VAR_SPECIAL_x800C, 50
	snop
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000906_00000796
	submoneyimmediate 1000
	scrcmd_120 50
	scrcmd_118 0
	scrcmd_115
	play_se SEQ_SE_DP_REGI
	wait_se SEQ_SE_DP_REGI
	msgbox 3
	goto scr_seq_00000906_000006B1

scr_seq_00000906_00000748:
	.byte 0x02, 0x00
scr_seq_00000906_0000074A:
	hasenoughmoneyimmediate 32780, 10000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000906_000007A1
	checkgivecoins VAR_SPECIAL_x800C, 500
	snop
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000906_00000796
	submoneyimmediate 10000
	scrcmd_120 500
	scrcmd_118 0
	scrcmd_115
	play_se SEQ_SE_DP_REGI
	wait_se SEQ_SE_DP_REGI
	msgbox 3
	goto scr_seq_00000906_000006B1

scr_seq_00000906_00000794:
	.byte 0x02, 0x00
scr_seq_00000906_00000796:
	msgbox 5
	goto scr_seq_00000906_000007A4

scr_seq_00000906_0000079F:
	.byte 0x02
	.byte 0x00
scr_seq_00000906_000007A1:
	msgbox 4
scr_seq_00000906_000007A4:
	waitbutton
	closemsg
	scrcmd_747
	scrcmd_117
	scrcmd_114
	scrcmd_784 3, 1
	releaseall
	end

scr_seq_00000906_000007B6:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_784 3, 0
	msgbox 7
	scrcmd_746
	scrcmd_116 0, 20, 2
scr_seq_00000906_000007CE:
	scrcmd_750 1, 1, 0, 1, VAR_TEMP_x4000
	scrcmd_751 37, 255, 0
	scrcmd_751 38, 255, 1
	scrcmd_751 36, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000906_00000816
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000906_000008B2
	goto scr_seq_00000906_000011F9

scr_seq_00000906_00000816:
	scrcmd_750 1, 1, 0, 1, VAR_TEMP_x4000
	scrcmd_751 39, 255, 0
	scrcmd_751 40, 255, 1
	scrcmd_751 41, 255, 2
	scrcmd_751 42, 255, 3
	scrcmd_751 43, 255, 4
	scrcmd_751 44, 255, 5
	scrcmd_751 36, 255, 6
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000906_00000924
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000906_000009AF
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000906_00000A3A
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000906_00000AC5
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_00000906_00000B50
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_00000906_00000BDB
	goto scr_seq_00000906_000007CE

scr_seq_00000906_000008B2:
	scrcmd_750 1, 1, 0, 1, VAR_TEMP_x4000
	scrcmd_751 45, 255, 0
	scrcmd_751 46, 255, 1
	scrcmd_751 47, 255, 2
	scrcmd_751 48, 255, 3
	scrcmd_751 36, 255, 4
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000906_00000C66
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000906_00000CF1
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000906_00000D7C
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_00000906_00000E07
	goto scr_seq_00000906_000007CE

scr_seq_00000906_00000924:
	setvar VAR_SPECIAL_x8004, 417
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000906_00001127
	scrcmd_194 0, 32772
	msgbox 10
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000906_0000096D
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000906_00000816
scr_seq_00000906_0000096D:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 2000
	gotoif lt, scr_seq_00000906_000011C8
	msgbox 11
	play_se SEQ_SE_DP_REGI
	scrcmd_121 2000
	scrcmd_118 0
	scrcmd_194 0, 32772
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 1, 32780
	msgbox 17
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_00000906_00000816

scr_seq_00000906_000009AD:
	.byte 0x02, 0x00
scr_seq_00000906_000009AF:
	setvar VAR_SPECIAL_x8004, 402
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000906_00001127
	scrcmd_194 0, 32772
	msgbox 10
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000906_000009F8
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000906_00000816
scr_seq_00000906_000009F8:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 4000
	gotoif lt, scr_seq_00000906_000011C8
	msgbox 11
	play_se SEQ_SE_DP_REGI
	scrcmd_121 4000
	scrcmd_118 0
	scrcmd_194 0, 32772
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 1, 32780
	msgbox 17
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_00000906_00000816

scr_seq_00000906_00000A38:
	.byte 0x02, 0x00
scr_seq_00000906_00000A3A:
	setvar VAR_SPECIAL_x8004, 371
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000906_00001127
	scrcmd_194 0, 32772
	msgbox 10
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000906_00000A83
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000906_00000816
scr_seq_00000906_00000A83:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 6000
	gotoif lt, scr_seq_00000906_000011C8
	msgbox 11
	play_se SEQ_SE_DP_REGI
	scrcmd_121 6000
	scrcmd_118 0
	scrcmd_194 0, 32772
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 1, 32780
	msgbox 17
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_00000906_00000816

scr_seq_00000906_00000AC3:
	.byte 0x02, 0x00
scr_seq_00000906_00000AC5:
	setvar VAR_SPECIAL_x8004, 362
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000906_00001127
	scrcmd_194 0, 32772
	msgbox 10
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000906_00000B0E
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000906_00000816
scr_seq_00000906_00000B0E:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 10000
	gotoif lt, scr_seq_00000906_000011C8
	msgbox 11
	play_se SEQ_SE_DP_REGI
	scrcmd_121 10000
	scrcmd_118 0
	scrcmd_194 0, 32772
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 1, 32780
	msgbox 17
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_00000906_00000816

scr_seq_00000906_00000B4E:
	.byte 0x02, 0x00
scr_seq_00000906_00000B50:
	setvar VAR_SPECIAL_x8004, 340
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000906_00001127
	scrcmd_194 0, 32772
	msgbox 10
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000906_00000B99
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000906_00000816
scr_seq_00000906_00000B99:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 10000
	gotoif lt, scr_seq_00000906_000011C8
	msgbox 11
	play_se SEQ_SE_DP_REGI
	scrcmd_121 10000
	scrcmd_118 0
	scrcmd_194 0, 32772
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 1, 32780
	msgbox 17
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_00000906_00000816

scr_seq_00000906_00000BD9:
	.byte 0x02, 0x00
scr_seq_00000906_00000BDB:
	setvar VAR_SPECIAL_x8004, 351
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000906_00001127
	scrcmd_194 0, 32772
	msgbox 10
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000906_00000C24
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000906_00000816
scr_seq_00000906_00000C24:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 10000
	gotoif lt, scr_seq_00000906_000011C8
	msgbox 11
	play_se SEQ_SE_DP_REGI
	scrcmd_121 10000
	scrcmd_118 0
	scrcmd_194 0, 32772
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 1, 32780
	msgbox 17
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_00000906_00000816

scr_seq_00000906_00000C64:
	.byte 0x02, 0x00
scr_seq_00000906_00000C66:
	setvar VAR_SPECIAL_x8004, 251
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000906_00001127
	scrcmd_194 0, 32772
	msgbox 10
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000906_00000CAF
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000906_000008B2
scr_seq_00000906_00000CAF:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 1000
	gotoif lt, scr_seq_00000906_000011C8
	msgbox 11
	play_se SEQ_SE_DP_REGI
	scrcmd_121 1000
	scrcmd_118 0
	scrcmd_194 0, 32772
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 1, 32780
	msgbox 17
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_00000906_000008B2

scr_seq_00000906_00000CEF:
	.byte 0x02
	.byte 0x00
scr_seq_00000906_00000CF1:
	setvar VAR_SPECIAL_x8004, 265
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000906_00001127
	scrcmd_194 0, 32772
	msgbox 10
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000906_00000D3A
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000906_000008B2
scr_seq_00000906_00000D3A:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 1000
	gotoif lt, scr_seq_00000906_000011C8
	msgbox 11
	play_se SEQ_SE_DP_REGI
	scrcmd_121 1000
	scrcmd_118 0
	scrcmd_194 0, 32772
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 1, 32780
	msgbox 17
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_00000906_000008B2

scr_seq_00000906_00000D7A:
	.byte 0x02, 0x00
scr_seq_00000906_00000D7C:
	setvar VAR_SPECIAL_x8004, 276
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000906_00001127
	scrcmd_194 0, 32772
	msgbox 10
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000906_00000DC5
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000906_000008B2
scr_seq_00000906_00000DC5:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 1000
	gotoif lt, scr_seq_00000906_000011C8
	msgbox 11
	play_se SEQ_SE_DP_REGI
	scrcmd_121 1000
	scrcmd_118 0
	scrcmd_194 0, 32772
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 1, 32780
	msgbox 17
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_00000906_000008B2

scr_seq_00000906_00000E05:
	.byte 0x02, 0x00
scr_seq_00000906_00000E07:
	setvar VAR_SPECIAL_x8004, 277
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000906_00001127
	scrcmd_194 0, 32772
	msgbox 10
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000906_00000E50
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000906_000008B2
scr_seq_00000906_00000E50:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 1000
	gotoif lt, scr_seq_00000906_000011C8
	msgbox 11
	play_se SEQ_SE_DP_REGI
	scrcmd_121 1000
	scrcmd_118 0
	scrcmd_194 0, 32772
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 1, 32780
	msgbox 17
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_00000906_000008B2

scr_seq_00000906_00000E90:
	.byte 0x02, 0x00
scr_seq_00000906_00000E92:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_784 3, 0
	msgbox 16
	scrcmd_746
	scrcmd_116 0, 20, 2
	scrcmd_495 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_00000906_00000EC7
	goto scr_seq_00000906_00000ECD

scr_seq_00000906_00000EC1:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_00000906_00000EC7:
	goto scr_seq_00000906_00000F2A

scr_seq_00000906_00000ECD:
	scrcmd_750 1, 1, 0, 1, VAR_TEMP_x4000
	scrcmd_751 49, 255, 0
	scrcmd_751 50, 255, 1
	scrcmd_751 51, 255, 2
	scrcmd_751 36, 255, 3
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000906_00000F87
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000906_00000F93
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000906_00000F9F
	goto scr_seq_00000906_000011F9

scr_seq_00000906_00000F2A:
	scrcmd_750 1, 1, 0, 1, VAR_TEMP_x4000
	scrcmd_751 49, 255, 0
	scrcmd_751 52, 255, 1
	scrcmd_751 51, 255, 2
	scrcmd_751 36, 255, 3
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000906_00000F87
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000906_00000FAB
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_00000906_00000F9F
	goto scr_seq_00000906_000011F9

scr_seq_00000906_00000F87:
	setorcopyvar VAR_TEMP_x4002, 63
	goto scr_seq_00000906_00000FB7

scr_seq_00000906_00000F93:
	setorcopyvar VAR_TEMP_x4002, 23
	goto scr_seq_00000906_00000FB7

scr_seq_00000906_00000F9F:
	setorcopyvar VAR_TEMP_x4002, 147
	goto scr_seq_00000906_00000FB7

scr_seq_00000906_00000FAB:
	setorcopyvar VAR_TEMP_x4002, 27
	goto scr_seq_00000906_00000FB7

scr_seq_00000906_00000FB7:
	scrcmd_332 VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 6
	gotoif ne, scr_seq_00000906_00000FD5
	msgbox 13
	waitbutton
	closemsg
	goto scr_seq_00000906_00001208

scr_seq_00000906_00000FD5:
	scrcmd_202 1, 16386, 0, 0
	msgbox 14
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000906_00001016
	closemsg
	scrcmd_495 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_00000906_00001010
	goto scr_seq_00000906_00000ECD

scr_seq_00000906_0000100A:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_00000906_00001010:
	goto scr_seq_00000906_00000F2A

scr_seq_00000906_00001016:
	comparevartovalue VAR_TEMP_x4002, 63
	gotoif ne, scr_seq_00000906_0000103A
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 200
	gotoif lt, scr_seq_00000906_000011D3
	goto scr_seq_00000906_00001093

scr_seq_00000906_0000103A:
	comparevartovalue VAR_TEMP_x4002, 23
	gotoif ne, scr_seq_00000906_0000105E
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 700
	gotoif lt, scr_seq_00000906_000011D3
	goto scr_seq_00000906_00001093

scr_seq_00000906_0000105E:
	comparevartovalue VAR_TEMP_x4002, 27
	gotoif ne, scr_seq_00000906_00001082
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 700
	gotoif lt, scr_seq_00000906_000011D3
	goto scr_seq_00000906_00001093

scr_seq_00000906_00001082:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 2100
	gotoif lt, scr_seq_00000906_000011D3
scr_seq_00000906_00001093:
	msgbox 11
	play_se SEQ_SE_DP_REGI
	scrcmd_137 16386, 15, 0, 0, 0, 32780
	scrcmd_190 0
	scrcmd_202 1, 16386, 0, 0
	msgbox 15
	comparevartovalue VAR_TEMP_x4002, 63
	gotoif ne, scr_seq_00000906_000010CD
	scrcmd_121 200
	goto scr_seq_00000906_000010FF

scr_seq_00000906_000010CD:
	comparevartovalue VAR_TEMP_x4002, 23
	gotoif ne, scr_seq_00000906_000010E4
	scrcmd_121 700
	goto scr_seq_00000906_000010FF

scr_seq_00000906_000010E4:
	comparevartovalue VAR_TEMP_x4002, 27
	gotoif ne, scr_seq_00000906_000010FB
	scrcmd_121 700
	goto scr_seq_00000906_000010FF

scr_seq_00000906_000010FB:
	scrcmd_121 2100
scr_seq_00000906_000010FF:
	scrcmd_118 0
	scrcmd_495 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_00000906_0000111F
	goto scr_seq_00000906_00000ECD

scr_seq_00000906_00001119:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_00000906_0000111F:
	goto scr_seq_00000906_00000F2A

scr_seq_00000906_00001125:
	.byte 0x02, 0x00
scr_seq_00000906_00001127:
	msgbox 12
	closemsg
scr_seq_00000906_0000112C:
	comparevartovalue VAR_SPECIAL_x8004, 417
	gotoif ne, scr_seq_00000906_00001145
	goto scr_seq_00000906_00000816

scr_seq_00000906_0000113F:
	.byte 0x16
	.byte 0x00, 0x83, 0x00, 0x00, 0x00
scr_seq_00000906_00001145:
	comparevartovalue VAR_SPECIAL_x8004, 402
	gotoif ne, scr_seq_00000906_0000115E
	goto scr_seq_00000906_00000816

scr_seq_00000906_00001158:
	.byte 0x16, 0x00, 0x6a, 0x00, 0x00, 0x00
scr_seq_00000906_0000115E:
	comparevartovalue VAR_SPECIAL_x8004, 371
	gotoif ne, scr_seq_00000906_00001177
	goto scr_seq_00000906_00000816

scr_seq_00000906_00001171:
	.byte 0x16, 0x00, 0x51, 0x00, 0x00, 0x00
scr_seq_00000906_00001177:
	comparevartovalue VAR_SPECIAL_x8004, 362
	gotoif ne, scr_seq_00000906_00001190
	goto scr_seq_00000906_00000816

scr_seq_00000906_0000118A:
	.byte 0x16, 0x00, 0x38, 0x00, 0x00, 0x00
scr_seq_00000906_00001190:
	comparevartovalue VAR_SPECIAL_x8004, 340
	gotoif ne, scr_seq_00000906_000011A9
	goto scr_seq_00000906_00000816

scr_seq_00000906_000011A3:
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
scr_seq_00000906_000011A9:
	comparevartovalue VAR_SPECIAL_x8004, 351
	gotoif ne, scr_seq_00000906_000011C2
	goto scr_seq_00000906_00000816

scr_seq_00000906_000011BC:
	.byte 0x16, 0x00, 0x06, 0x00
	.byte 0x00, 0x00
scr_seq_00000906_000011C2:
	goto scr_seq_00000906_000008B2

scr_seq_00000906_000011C8:
	msgbox 9
	goto scr_seq_00000906_0000112C

scr_seq_00000906_000011D1:
	.byte 0x02, 0x00
scr_seq_00000906_000011D3:
	msgbox 9
	scrcmd_495 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_00000906_000011F3
	goto scr_seq_00000906_00000ECD

scr_seq_00000906_000011ED:
	.byte 0x16, 0x00, 0x06
	.byte 0x00, 0x00, 0x00
scr_seq_00000906_000011F3:
	goto scr_seq_00000906_00000F2A

scr_seq_00000906_000011F9:
	msgbox 8
	waitbutton
	closemsg
	goto scr_seq_00000906_00001208

scr_seq_00000906_00001206:
	.byte 0x02, 0x00
scr_seq_00000906_00001208:
	scrcmd_117
	scrcmd_747
	scrcmd_784 3, 1
	releaseall
	end

scr_seq_00000906_00001214:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000906_00001227:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 19
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000906_0000123A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 27
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000906_000012DE
	msgbox 31
	waitbutton
	msgbox 28
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000906_000012DE
	msgbox 32
	waitbutton
	msgbox 28
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000906_000012DE
	msgbox 33
	waitbutton
	msgbox 28
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000906_000012DE
	msgbox 34
	waitbutton
	msgbox 28
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000906_000012DE
	msgbox 35
	waitbutton
	msgbox 30
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000906_000012DE:
	msgbox 29
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000906_000012E9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 21
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000906_000012FC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 22
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000906_0000130F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 23
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000906_00001322:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 24
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
