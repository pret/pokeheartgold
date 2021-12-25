#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000116_00000081 ; 000
	scrdef scr_seq_00000116_00000094 ; 001
	scrdef scr_seq_00000116_000000A7 ; 002
	scrdef scr_seq_00000116_000000BA ; 003
	scrdef scr_seq_00000116_000000CD ; 004
	scrdef scr_seq_00000116_000000E8 ; 005
	scrdef scr_seq_00000116_00000130 ; 006
	scrdef scr_seq_00000116_0000014F ; 007
	scrdef scr_seq_00000116_0000016E ; 008
	scrdef scr_seq_00000116_00000189 ; 009
	scrdef scr_seq_00000116_0000019C ; 010
	scrdef scr_seq_00000116_000001B7 ; 011
	scrdef scr_seq_00000116_000001CC ; 012
	scrdef scr_seq_00000116_000001DF ; 013
	scrdef scr_seq_00000116_00000046 ; 014
	scrdef scr_seq_00000116_00000398 ; 015
	scrdef scr_seq_00000116_000003AB ; 016
	scrdef_end

scr_seq_00000116_00000046:
	checkflag FLAG_UNK_189
	gotoif lt, scr_seq_00000116_00000057
	clearflag FLAG_UNK_189
	end

scr_seq_00000116_00000057:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, scr_seq_00000116_0000007B
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, scr_seq_00000116_0000007B
	setflag FLAG_UNK_27E
	end

scr_seq_00000116_0000007B:
	clearflag FLAG_UNK_27E
	end

scr_seq_00000116_00000081:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000116_00000094:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000116_000000A7:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000116_000000BA:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000116_000000CD:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 39, 0
	msgbox 6
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000116_000000E8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_TEMP_x400B, 0
	gotoif ne, scr_seq_00000116_00000106
	msgbox 7
	goto scr_seq_00000116_00000109

scr_seq_00000116_00000106:
	msgbox 8
scr_seq_00000116_00000109:
	waitbutton
	closemsg
	releaseall
	comparevartovalue VAR_TEMP_x400B, 0
	gotoif ne, scr_seq_00000116_00000128
	addvar VAR_TEMP_x400B, 1
	goto scr_seq_00000116_0000012E

scr_seq_00000116_00000128:
	setvar VAR_TEMP_x400B, 0
scr_seq_00000116_0000012E:
	end

scr_seq_00000116_00000130:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 9
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 6
	callstd 2052
	releaseall
	end

scr_seq_00000116_0000014F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 10
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 14
	callstd 2052
	releaseall
	end

scr_seq_00000116_0000016E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 12, 0
	msgbox 11
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000116_00000189:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000116_0000019C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 79, 0
	msgbox 13
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000116_000001B7:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 17, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000116_000001CC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000116_000001DF:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000116_00000307
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000116_0000031B
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000116_00000258
	apply_movement 255, scr_seq_00000116_00000330
	apply_movement 12, scr_seq_00000116_0000037C
	goto scr_seq_00000116_000002A6

scr_seq_00000116_00000258:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000116_00000273
	apply_movement 255, scr_seq_00000116_00000348
	goto scr_seq_00000116_000002A6

scr_seq_00000116_00000273:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000116_00000296
	apply_movement 255, scr_seq_00000116_00000368
	apply_movement 12, scr_seq_00000116_0000037C
	goto scr_seq_00000116_000002A6

scr_seq_00000116_00000296:
	apply_movement 255, scr_seq_00000116_00000354
	apply_movement 12, scr_seq_00000116_0000037C
scr_seq_00000116_000002A6:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000116_000002CD
	apply_movement 253, scr_seq_00000116_00000388
	wait_movement
scr_seq_00000116_000002CD:
	setflag FLAG_UNK_189
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_615 38
	lockall
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	clearflag FLAG_UNK_189
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000116_00000307:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000116_0000031B:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000116_0000032F:
	.byte 0x00

scr_seq_00000116_00000330:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000116_00000348:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000116_00000354:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000116_00000368:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000116_0000037C:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000116_00000388:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_00000116_00000398:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000116_000003AB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 16
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
