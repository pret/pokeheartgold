#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0758_0075 ; 000
	scrdef scr_seq_0758_009E ; 001
	scrdef scr_seq_0758_00B1 ; 002
	scrdef scr_seq_0758_00C4 ; 003
	scrdef scr_seq_0758_00E2 ; 004
	scrdef scr_seq_0758_0137 ; 005
	scrdef scr_seq_0758_0160 ; 006
	scrdef scr_seq_0758_0177 ; 007
	scrdef scr_seq_0758_018C ; 008
	scrdef scr_seq_0758_01A1 ; 009
	scrdef scr_seq_0758_01B6 ; 010
	scrdef scr_seq_0758_01CD ; 011
	scrdef scr_seq_0758_003A ; 012
	scrdef scr_seq_0758_014D ; 013
	scrdef_end

scr_seq_0758_003A:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0758_004B
	clearflag FLAG_UNK_189
	end

scr_seq_0758_004B:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, scr_seq_0758_006F
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_0758_006F
	setflag FLAG_UNK_27E
	end

scr_seq_0758_006F:
	clearflag FLAG_UNK_27E
	end

scr_seq_0758_0075:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_118
	gotoif TRUE, scr_seq_0758_0093
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0758_0093:
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0758_009E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0758_00B1:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0758_00C4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 3
	scrcmd_076 80, 0
	scrcmd_077
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0758_00E2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4087, 3
	gotoif ge, scr_seq_0758_012C
	comparevartovalue VAR_UNK_411C, 2
	gotoif eq, scr_seq_0758_0123
	comparevartovalue VAR_UNK_411C, 1
	gotoif eq, scr_seq_0758_011A
	npc_msg 6
	goto scr_seq_0758_012F

scr_seq_0758_011A:
	npc_msg 7
	goto scr_seq_0758_012F

scr_seq_0758_0123:
	npc_msg 8
	goto scr_seq_0758_012F

scr_seq_0758_012C:
	npc_msg 9
scr_seq_0758_012F:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0758_0137:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 10
	npc_msg 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0758_014D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0758_0160:
	scrcmd_055 13, 0, 4, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0758_0177:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 14, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0758_018C:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 15, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0758_01A1:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 16, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0758_01B6:
	scrcmd_055 17, 1, 14, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0758_01CD:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0758_02F5
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0758_0309
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0758_0246
	apply_movement 255, scr_seq_0758_0320
	apply_movement 6, scr_seq_0758_036C
	goto scr_seq_0758_0294

scr_seq_0758_0246:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0758_0261
	apply_movement 255, scr_seq_0758_0338
	goto scr_seq_0758_0294

scr_seq_0758_0261:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0758_0284
	apply_movement 255, scr_seq_0758_0358
	apply_movement 6, scr_seq_0758_036C
	goto scr_seq_0758_0294

scr_seq_0758_0284:
	apply_movement 255, scr_seq_0758_0344
	apply_movement 6, scr_seq_0758_036C
scr_seq_0758_0294:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0758_02BB
	apply_movement 253, scr_seq_0758_0378
	wait_movement
scr_seq_0758_02BB:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 55
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

scr_seq_0758_02F5:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0758_0309:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0758_031D:
	.byte 0x00, 0x00, 0x00

scr_seq_0758_0320:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0758_0338:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0758_0344:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0758_0358:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0758_036C:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_0758_0378:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
	.balign 4, 0
