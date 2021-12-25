#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000778_00000177 ; 000
	scrdef scr_seq_00000778_00000184 ; 001
	scrdef scr_seq_00000778_00000191 ; 002
	scrdef scr_seq_00000778_0000019E ; 003
	scrdef scr_seq_00000778_000001AB ; 004
	scrdef scr_seq_00000778_000001B8 ; 005
	scrdef scr_seq_00000778_000001C5 ; 006
	scrdef scr_seq_00000778_000001D2 ; 007
	scrdef scr_seq_00000778_000001DF ; 008
	scrdef scr_seq_00000778_000001EC ; 009
	scrdef scr_seq_00000778_000001F9 ; 010
	scrdef scr_seq_00000778_00000206 ; 011
	scrdef scr_seq_00000778_00000213 ; 012
	scrdef scr_seq_00000778_00000220 ; 013
	scrdef scr_seq_00000778_0000022D ; 014
	scrdef scr_seq_00000778_000002F6 ; 015
	scrdef scr_seq_00000778_000002F8 ; 016
	scrdef scr_seq_00000778_000002FA ; 017
	scrdef scr_seq_00000778_000002FC ; 018
	scrdef scr_seq_00000778_000002FE ; 019
	scrdef scr_seq_00000778_00000300 ; 020
	scrdef scr_seq_00000778_0000006A ; 021
	scrdef scr_seq_00000778_00000150 ; 022
	scrdef scr_seq_00000778_00000302 ; 023
	scrdef scr_seq_00000778_000003E3 ; 024
	scrdef scr_seq_00000778_00000414 ; 025
	scrdef_end

scr_seq_00000778_0000006A:
	checkflag FLAG_UNK_31A
	gotoif eq, scr_seq_00000778_00000079
	clearflag FLAG_UNK_9A6
scr_seq_00000778_00000079:
	scrcmd_320
	scrcmd_142 36, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000778_0000014A
	checkflag FLAG_UNK_14A
	gotoif lt, scr_seq_00000778_00000144
	scrcmd_147 36, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000778_000000FB
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 9
	gotoif ne, scr_seq_00000778_000000C7
	setflag FLAG_UNK_2F0
	goto scr_seq_00000778_000000F9

scr_seq_00000778_000000C7:
	comparevartovalue VAR_TEMP_x4000, 10
	gotoif ne, scr_seq_00000778_000000DE
	setflag FLAG_UNK_2F0
	goto scr_seq_00000778_000000F9

scr_seq_00000778_000000DE:
	comparevartovalue VAR_TEMP_x4000, 11
	gotoif ne, scr_seq_00000778_000000F5
	setflag FLAG_UNK_2F0
	goto scr_seq_00000778_000000F9

scr_seq_00000778_000000F5:
	clearflag FLAG_UNK_2F0
scr_seq_00000778_000000F9:
	end

scr_seq_00000778_000000FB:
	checkflag FLAG_UNK_162
	gotoif eq, scr_seq_00000778_0000010C
	setflag FLAG_UNK_2F0
	end

scr_seq_00000778_0000010C:
	scrcmd_484 16384
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_00000778_00000127
	setflag FLAG_UNK_2F0
	goto scr_seq_00000778_00000142

scr_seq_00000778_00000127:
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_00000778_0000013E
	setflag FLAG_UNK_2F0
	goto scr_seq_00000778_00000142

scr_seq_00000778_0000013E:
	clearflag FLAG_UNK_2F0
scr_seq_00000778_00000142:
	end

scr_seq_00000778_00000144:
	clearflag FLAG_UNK_2F0
	end

scr_seq_00000778_0000014A:
	setflag FLAG_UNK_2F0
	end

scr_seq_00000778_00000150:
	checkflag FLAG_UNK_31A
	gotoif eq, scr_seq_00000778_00000175
	scrcmd_375 0
	scrcmd_375 1
	scrcmd_375 2
	scrcmd_375 3
	scrcmd_375 4
	scrcmd_375 5
	end

scr_seq_00000778_00000175:
	end

scr_seq_00000778_00000177:
	scrcmd_322 0, 32780
	goto scr_seq_00000778_0000023A

scr_seq_00000778_00000182:
	.byte 0x02, 0x00
scr_seq_00000778_00000184:
	scrcmd_322 1, 32780
	goto scr_seq_00000778_0000023A

scr_seq_00000778_0000018F:
	.byte 0x02
	.byte 0x00
scr_seq_00000778_00000191:
	scrcmd_322 2, 32780
	goto scr_seq_00000778_0000023A

scr_seq_00000778_0000019C:
	.byte 0x02, 0x00
scr_seq_00000778_0000019E:
	scrcmd_322 3, 32780
	goto scr_seq_00000778_0000023A

scr_seq_00000778_000001A9:
	.byte 0x02, 0x00
scr_seq_00000778_000001AB:
	scrcmd_322 4, 32780
	goto scr_seq_00000778_0000023A

scr_seq_00000778_000001B6:
	.byte 0x02, 0x00
scr_seq_00000778_000001B8:
	scrcmd_322 5, 32780
	goto scr_seq_00000778_0000023A

scr_seq_00000778_000001C3:
	.byte 0x02, 0x00
scr_seq_00000778_000001C5:
	scrcmd_322 6, 32780
	goto scr_seq_00000778_0000023A

scr_seq_00000778_000001D0:
	.byte 0x02, 0x00
scr_seq_00000778_000001D2:
	scrcmd_322 7, 32780
	goto scr_seq_00000778_0000023A

scr_seq_00000778_000001DD:
	.byte 0x02, 0x00
scr_seq_00000778_000001DF:
	scrcmd_322 8, 32780
	goto scr_seq_00000778_0000023A

scr_seq_00000778_000001EA:
	.byte 0x02, 0x00
scr_seq_00000778_000001EC:
	scrcmd_322 9, 32780
	goto scr_seq_00000778_0000023A

scr_seq_00000778_000001F7:
	.byte 0x02, 0x00
scr_seq_00000778_000001F9:
	scrcmd_322 10, 32780
	goto scr_seq_00000778_0000023A

scr_seq_00000778_00000204:
	.byte 0x02, 0x00
scr_seq_00000778_00000206:
	scrcmd_322 11, 32780
	goto scr_seq_00000778_0000023A

scr_seq_00000778_00000211:
	.byte 0x02, 0x00
scr_seq_00000778_00000213:
	scrcmd_322 12, 32780
	goto scr_seq_00000778_0000023A

scr_seq_00000778_0000021E:
	.byte 0x02, 0x00
scr_seq_00000778_00000220:
	scrcmd_322 13, 32780
	goto scr_seq_00000778_0000023A

scr_seq_00000778_0000022B:
	.byte 0x02, 0x00
scr_seq_00000778_0000022D:
	scrcmd_322 14, 32780
	goto scr_seq_00000778_0000023A

scr_seq_00000778_00000238:
	.byte 0x02, 0x00
scr_seq_00000778_0000023A:
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, scr_seq_00000778_0000027D
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_00000778_000002AA
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000778_0000028E
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_00000778_000002CE
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000778_000002E5
	end

scr_seq_00000778_0000027D:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000778_0000028E:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 9
	waitbutton
	closemsg
	scrcmd_321 0, 0
	msgbox 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000778_000002AA:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 9
	waitbutton
	closemsg
	scrcmd_321 1, 0
	setflag FLAG_UNK_9A6
	scrcmd_074 2150
	msgbox 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000778_000002CE:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 10
	waitbutton
	closemsg
	scrcmd_321 0, 1
	scrcmd_323
	releaseall
	end

scr_seq_00000778_000002E5:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000778_000002F6:
	end

scr_seq_00000778_000002F8:
	end

scr_seq_00000778_000002FA:
	end

scr_seq_00000778_000002FC:
	end

scr_seq_00000778_000002FE:
	end

scr_seq_00000778_00000300:
	end

scr_seq_00000778_00000302:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 10, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000778_000003C7
	msgbox 0
	closemsg
	scrcmd_213 255, 0, 0, 0
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000778_000003DD
	scrcmd_295 10
	addvar VAR_UNK_4135, 1
	scrcmd_515 22
	setflag FLAG_UNK_31A
	scrcmd_101 0
	scrcmd_101 1
	scrcmd_101 2
	scrcmd_101 3
	scrcmd_101 4
	scrcmd_101 5
	settrainerflag 232
	settrainerflag 337
	settrainerflag 396
	msgbox 1
	scrcmd_190 0
	msgbox 2
	scrcmd_078 1189
	scrcmd_079
	msgbox 3
	goto scr_seq_00000778_00000389

scr_seq_00000778_00000389:
	setvar VAR_SPECIAL_x8004, 361
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000778_000003BD
	callstd 2033
	setflag FLAG_UNK_181
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000778_000003BD:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000778_000003C7:
	checkflag FLAG_UNK_181
	gotoif lt, scr_seq_00000778_00000389
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000778_000003DD:
	scrcmd_219
	releaseall
	end

scr_seq_00000778_000003E3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 10, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000778_00000409
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000778_00000409:
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000778_00000414:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 10, 32780
	scrcmd_190 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000778_0000043B
	msgbox 13
	goto scr_seq_00000778_0000043E

scr_seq_00000778_0000043B:
	msgbox 14
scr_seq_00000778_0000043E:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
