#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0116_0081 ; 000
	scrdef scr_seq_0116_0094 ; 001
	scrdef scr_seq_0116_00A7 ; 002
	scrdef scr_seq_0116_00BA ; 003
	scrdef scr_seq_0116_00CD ; 004
	scrdef scr_seq_0116_00E8 ; 005
	scrdef scr_seq_0116_0130 ; 006
	scrdef scr_seq_0116_014F ; 007
	scrdef scr_seq_0116_016E ; 008
	scrdef scr_seq_0116_0189 ; 009
	scrdef scr_seq_0116_019C ; 010
	scrdef scr_seq_0116_01B7 ; 011
	scrdef scr_seq_0116_01CC ; 012
	scrdef scr_seq_0116_01DF ; 013
	scrdef scr_seq_0116_0046 ; 014
	scrdef scr_seq_0116_0398 ; 015
	scrdef scr_seq_0116_03AB ; 016
	scrdef_end

scr_seq_0116_0046:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0116_0057
	clearflag FLAG_UNK_189
	end

scr_seq_0116_0057:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, scr_seq_0116_007B
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, scr_seq_0116_007B
	setflag FLAG_UNK_27E
	end

scr_seq_0116_007B:
	clearflag FLAG_UNK_27E
	end

scr_seq_0116_0081:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0116_0094:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0116_00A7:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0116_00BA:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0116_00CD:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 39, 0
	npc_msg 6
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0116_00E8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_TEMP_x400B, 0
	gotoif ne, scr_seq_0116_0106
	npc_msg 7
	goto scr_seq_0116_0109

scr_seq_0116_0106:
	npc_msg 8
scr_seq_0116_0109:
	waitbutton
	closemsg
	releaseall
	comparevartovalue VAR_TEMP_x400B, 0
	gotoif ne, scr_seq_0116_0128
	addvar VAR_TEMP_x400B, 1
	goto scr_seq_0116_012E

scr_seq_0116_0128:
	setvar VAR_TEMP_x400B, 0
scr_seq_0116_012E:
	end

scr_seq_0116_0130:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 9
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 6
	callstd 2052
	releaseall
	end

scr_seq_0116_014F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 10
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 14
	callstd 2052
	releaseall
	end

scr_seq_0116_016E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 12, 0
	npc_msg 11
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0116_0189:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0116_019C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 79, 0
	npc_msg 13
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0116_01B7:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 17, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0116_01CC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0116_01DF:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0116_0307
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0116_031B
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0116_0258
	apply_movement 255, scr_seq_0116_0330
	apply_movement 12, scr_seq_0116_037C
	goto scr_seq_0116_02A6

scr_seq_0116_0258:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0116_0273
	apply_movement 255, scr_seq_0116_0348
	goto scr_seq_0116_02A6

scr_seq_0116_0273:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0116_0296
	apply_movement 255, scr_seq_0116_0368
	apply_movement 12, scr_seq_0116_037C
	goto scr_seq_0116_02A6

scr_seq_0116_0296:
	apply_movement 255, scr_seq_0116_0354
	apply_movement 12, scr_seq_0116_037C
scr_seq_0116_02A6:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0116_02CD
	apply_movement 253, scr_seq_0116_0388
	wait_movement
scr_seq_0116_02CD:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 38
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0116_0307:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0116_031B:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0116_032F:
	.byte 0x00

scr_seq_0116_0330:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0116_0348:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0116_0354:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0116_0368:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0116_037C:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_0116_0388:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_0116_0398:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0116_03AB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 16
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
