#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0127_0062 ; 000
	scrdef scr_seq_0127_0075 ; 001
	scrdef scr_seq_0127_009E ; 002
	scrdef scr_seq_0127_03B9 ; 003
	scrdef scr_seq_0127_0454 ; 004
	scrdef scr_seq_0127_0485 ; 005
	scrdef scr_seq_0127_04AE ; 006
	scrdef scr_seq_0127_0041 ; 007
	scrdef scr_seq_0127_0026 ; 008
	scrdef_end

scr_seq_0127_0026:
	checkflag FLAG_UNK_0F1
	gotoif TRUE, scr_seq_0127_0039
	setvar VAR_TEMP_x400D, 0
	end

scr_seq_0127_0039:
	setvar VAR_TEMP_x400D, 1
	end

scr_seq_0127_0041:
	comparevartovalue VAR_TEMP_x400D, 1
	gotoif ne, scr_seq_0127_0060
	show_person_at 0, 6, 1, 3, 3
	setvar VAR_TEMP_x400D, 0
scr_seq_0127_0060:
	end

scr_seq_0127_0062:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0127_0075:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0F1
	gotoif TRUE, scr_seq_0127_0093
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0127_0093:
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0127_009E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 3
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0127_03AC
scr_seq_0127_00BC:
	npc_msg 6
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 308, 255, 0
	scrcmd_751 309, 255, 1
	scrcmd_751 310, 255, 2
	scrcmd_751 311, 255, 3
	scrcmd_751 312, 255, 4
	scrcmd_751 135, 255, 5
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0127_03AC
	npc_msg 7
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0127_014D
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0127_0187
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0127_01C1
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0127_01FB
	goto scr_seq_0127_0235

scr_seq_0127_014B:
	.byte 0x02, 0x00
scr_seq_0127_014D:
	setvar VAR_TEMP_x4007, 0
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 298, 255, 0
	scrcmd_751 299, 255, 1
	scrcmd_751 304, 255, 6
	scrcmd_751 13, 255, 10
	scrcmd_752
	goto scr_seq_0127_026F

scr_seq_0127_0185:
	.byte 0x02, 0x00
scr_seq_0127_0187:
	setvar VAR_TEMP_x4007, 1
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 301, 255, 3
	scrcmd_751 300, 255, 2
	scrcmd_751 307, 255, 9
	scrcmd_751 13, 255, 10
	scrcmd_752
	goto scr_seq_0127_026F

scr_seq_0127_01BF:
	.byte 0x02
	.byte 0x00
scr_seq_0127_01C1:
	setvar VAR_TEMP_x4007, 2
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 306, 255, 8
	scrcmd_751 307, 255, 9
	scrcmd_751 299, 255, 1
	scrcmd_751 13, 255, 10
	scrcmd_752
	goto scr_seq_0127_026F

scr_seq_0127_01F9:
	.byte 0x02, 0x00
scr_seq_0127_01FB:
	setvar VAR_TEMP_x4007, 3
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 305, 255, 7
	scrcmd_751 304, 255, 6
	scrcmd_751 301, 255, 3
	scrcmd_751 13, 255, 10
	scrcmd_752
	goto scr_seq_0127_026F

scr_seq_0127_0233:
	.byte 0x02, 0x00
scr_seq_0127_0235:
	setvar VAR_TEMP_x4007, 4
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 303, 255, 5
	scrcmd_751 302, 255, 4
	scrcmd_751 298, 255, 0
	scrcmd_751 13, 255, 10
	scrcmd_752
	goto scr_seq_0127_026F

scr_seq_0127_026D:
	.byte 0x02, 0x00
scr_seq_0127_026F:
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0127_02FF
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0127_030A
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0127_0315
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0127_0320
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0127_032B
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0127_0336
	comparevartovalue VAR_SPECIAL_x8008, 6
	gotoif eq, scr_seq_0127_0341
	comparevartovalue VAR_SPECIAL_x8008, 7
	gotoif eq, scr_seq_0127_034C
	comparevartovalue VAR_SPECIAL_x8008, 8
	gotoif eq, scr_seq_0127_0357
	comparevartovalue VAR_SPECIAL_x8008, 9
	gotoif eq, scr_seq_0127_0362
	goto scr_seq_0127_00BC

scr_seq_0127_02FD:
	.byte 0x02, 0x00
scr_seq_0127_02FF:
	npc_msg 8
	goto scr_seq_0127_036D

scr_seq_0127_0308:
	.byte 0x02, 0x00
scr_seq_0127_030A:
	npc_msg 9
	goto scr_seq_0127_036D

scr_seq_0127_0313:
	.byte 0x02, 0x00
scr_seq_0127_0315:
	npc_msg 10
	goto scr_seq_0127_036D

scr_seq_0127_031E:
	.byte 0x02, 0x00
scr_seq_0127_0320:
	npc_msg 11
	goto scr_seq_0127_036D

scr_seq_0127_0329:
	.byte 0x02, 0x00
scr_seq_0127_032B:
	npc_msg 12
	goto scr_seq_0127_036D

scr_seq_0127_0334:
	.byte 0x02, 0x00
scr_seq_0127_0336:
	npc_msg 13
	goto scr_seq_0127_036D

scr_seq_0127_033F:
	.byte 0x02
	.byte 0x00
scr_seq_0127_0341:
	npc_msg 14
	goto scr_seq_0127_036D

scr_seq_0127_034A:
	.byte 0x02, 0x00
scr_seq_0127_034C:
	npc_msg 15
	goto scr_seq_0127_036D

scr_seq_0127_0355:
	.byte 0x02, 0x00
scr_seq_0127_0357:
	npc_msg 16
	goto scr_seq_0127_036D

scr_seq_0127_0360:
	.byte 0x02, 0x00
scr_seq_0127_0362:
	npc_msg 17
	goto scr_seq_0127_036D

scr_seq_0127_036B:
	.byte 0x02, 0x00
scr_seq_0127_036D:
	npc_msg 7
	comparevartovalue VAR_TEMP_x4007, 0
	gotoif eq, scr_seq_0127_014D
	comparevartovalue VAR_TEMP_x4007, 1
	gotoif eq, scr_seq_0127_0187
	comparevartovalue VAR_TEMP_x4007, 2
	gotoif eq, scr_seq_0127_01C1
	comparevartovalue VAR_TEMP_x4007, 3
	gotoif eq, scr_seq_0127_01FB
	goto scr_seq_0127_0235

scr_seq_0127_03AA:
	.byte 0x02, 0x00
scr_seq_0127_03AC:
	npc_msg 18
	waitbutton
	closemsg
	scrcmd_747
	releaseall
	end

scr_seq_0127_03B9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0127_03E0
	apply_movement 3, scr_seq_0127_043C
	goto scr_seq_0127_041E

scr_seq_0127_03E0:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0127_03FB
	apply_movement 3, scr_seq_0127_0434
	goto scr_seq_0127_041E

scr_seq_0127_03FB:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0127_0416
	apply_movement 3, scr_seq_0127_044C
	goto scr_seq_0127_041E

scr_seq_0127_0416:
	apply_movement 3, scr_seq_0127_0444
scr_seq_0127_041E:
	wait_movement
	scrcmd_076 85, 0
	npc_msg 24
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0127_0433:
	.byte 0x00

scr_seq_0127_0434:
	.short 48, 2
	.short 254, 0

scr_seq_0127_043C:
	.short 49, 2
	.short 254, 0

scr_seq_0127_0444:
	.short 50, 2
	.short 254, 0

scr_seq_0127_044C:
	.short 51, 2
	.short 254, 0
scr_seq_0127_0454:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	buffer_players_name 0
	npc_msg 23
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_712 2
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0127_0485:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_2D8
	gotoif FALSE, scr_seq_0127_04A3
	npc_msg 19
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0127_04A3:
	npc_msg 20
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0127_04AE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_2D9
	gotoif FALSE, scr_seq_0127_04CC
	npc_msg 21
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0127_04CC:
	npc_msg 22
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
