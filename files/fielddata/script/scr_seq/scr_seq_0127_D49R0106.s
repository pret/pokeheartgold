#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0127_D49R0106_0062 ; 000
	scrdef scr_seq_0127_D49R0106_0075 ; 001
	scrdef scr_seq_0127_D49R0106_009E ; 002
	scrdef scr_seq_0127_D49R0106_03B9 ; 003
	scrdef scr_seq_0127_D49R0106_0454 ; 004
	scrdef scr_seq_0127_D49R0106_0485 ; 005
	scrdef scr_seq_0127_D49R0106_04AE ; 006
	scrdef scr_seq_0127_D49R0106_0041 ; 007
	scrdef scr_seq_0127_D49R0106_0026 ; 008
	scrdef_end

scr_seq_0127_D49R0106_0026:
	checkflag FLAG_UNK_0F1
	gotoif TRUE, scr_seq_0127_D49R0106_0039
	setvar VAR_TEMP_x400D, 0
	end

scr_seq_0127_D49R0106_0039:
	setvar VAR_TEMP_x400D, 1
	end

scr_seq_0127_D49R0106_0041:
	comparevartovalue VAR_TEMP_x400D, 1
	gotoif ne, scr_seq_0127_D49R0106_0060
	move_person 0, 6, 1, 3, 3
	setvar VAR_TEMP_x400D, 0
scr_seq_0127_D49R0106_0060:
	end

scr_seq_0127_D49R0106_0062:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0127_D49R0106_0075:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0F1
	gotoif TRUE, scr_seq_0127_D49R0106_0093
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0127_D49R0106_0093:
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0127_D49R0106_009E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 3
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0127_D49R0106_03AC
scr_seq_0127_D49R0106_00BC:
	npc_msg 6
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 308, 255, 0
	menu_item_add 309, 255, 1
	menu_item_add 310, 255, 2
	menu_item_add 311, 255, 3
	menu_item_add 312, 255, 4
	menu_item_add 135, 255, 5
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0127_D49R0106_03AC
	npc_msg 7
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0127_D49R0106_014D
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0127_D49R0106_0187
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0127_D49R0106_01C1
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0127_D49R0106_01FB
	goto scr_seq_0127_D49R0106_0235

scr_seq_0127_D49R0106_014B:
	.byte 0x02, 0x00
scr_seq_0127_D49R0106_014D:
	setvar VAR_TEMP_x4007, 0
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 298, 255, 0
	menu_item_add 299, 255, 1
	menu_item_add 304, 255, 6
	menu_item_add 13, 255, 10
	menu_exec
	goto scr_seq_0127_D49R0106_026F

scr_seq_0127_D49R0106_0185:
	.byte 0x02, 0x00
scr_seq_0127_D49R0106_0187:
	setvar VAR_TEMP_x4007, 1
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 301, 255, 3
	menu_item_add 300, 255, 2
	menu_item_add 307, 255, 9
	menu_item_add 13, 255, 10
	menu_exec
	goto scr_seq_0127_D49R0106_026F

scr_seq_0127_D49R0106_01BF:
	.byte 0x02
	.byte 0x00
scr_seq_0127_D49R0106_01C1:
	setvar VAR_TEMP_x4007, 2
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 306, 255, 8
	menu_item_add 307, 255, 9
	menu_item_add 299, 255, 1
	menu_item_add 13, 255, 10
	menu_exec
	goto scr_seq_0127_D49R0106_026F

scr_seq_0127_D49R0106_01F9:
	.byte 0x02, 0x00
scr_seq_0127_D49R0106_01FB:
	setvar VAR_TEMP_x4007, 3
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 305, 255, 7
	menu_item_add 304, 255, 6
	menu_item_add 301, 255, 3
	menu_item_add 13, 255, 10
	menu_exec
	goto scr_seq_0127_D49R0106_026F

scr_seq_0127_D49R0106_0233:
	.byte 0x02, 0x00
scr_seq_0127_D49R0106_0235:
	setvar VAR_TEMP_x4007, 4
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 303, 255, 5
	menu_item_add 302, 255, 4
	menu_item_add 298, 255, 0
	menu_item_add 13, 255, 10
	menu_exec
	goto scr_seq_0127_D49R0106_026F

scr_seq_0127_D49R0106_026D:
	.byte 0x02, 0x00
scr_seq_0127_D49R0106_026F:
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0127_D49R0106_02FF
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0127_D49R0106_030A
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0127_D49R0106_0315
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0127_D49R0106_0320
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0127_D49R0106_032B
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0127_D49R0106_0336
	comparevartovalue VAR_SPECIAL_x8008, 6
	gotoif eq, scr_seq_0127_D49R0106_0341
	comparevartovalue VAR_SPECIAL_x8008, 7
	gotoif eq, scr_seq_0127_D49R0106_034C
	comparevartovalue VAR_SPECIAL_x8008, 8
	gotoif eq, scr_seq_0127_D49R0106_0357
	comparevartovalue VAR_SPECIAL_x8008, 9
	gotoif eq, scr_seq_0127_D49R0106_0362
	goto scr_seq_0127_D49R0106_00BC

scr_seq_0127_D49R0106_02FD:
	.byte 0x02, 0x00
scr_seq_0127_D49R0106_02FF:
	npc_msg 8
	goto scr_seq_0127_D49R0106_036D

scr_seq_0127_D49R0106_0308:
	.byte 0x02, 0x00
scr_seq_0127_D49R0106_030A:
	npc_msg 9
	goto scr_seq_0127_D49R0106_036D

scr_seq_0127_D49R0106_0313:
	.byte 0x02, 0x00
scr_seq_0127_D49R0106_0315:
	npc_msg 10
	goto scr_seq_0127_D49R0106_036D

scr_seq_0127_D49R0106_031E:
	.byte 0x02, 0x00
scr_seq_0127_D49R0106_0320:
	npc_msg 11
	goto scr_seq_0127_D49R0106_036D

scr_seq_0127_D49R0106_0329:
	.byte 0x02, 0x00
scr_seq_0127_D49R0106_032B:
	npc_msg 12
	goto scr_seq_0127_D49R0106_036D

scr_seq_0127_D49R0106_0334:
	.byte 0x02, 0x00
scr_seq_0127_D49R0106_0336:
	npc_msg 13
	goto scr_seq_0127_D49R0106_036D

scr_seq_0127_D49R0106_033F:
	.byte 0x02
	.byte 0x00
scr_seq_0127_D49R0106_0341:
	npc_msg 14
	goto scr_seq_0127_D49R0106_036D

scr_seq_0127_D49R0106_034A:
	.byte 0x02, 0x00
scr_seq_0127_D49R0106_034C:
	npc_msg 15
	goto scr_seq_0127_D49R0106_036D

scr_seq_0127_D49R0106_0355:
	.byte 0x02, 0x00
scr_seq_0127_D49R0106_0357:
	npc_msg 16
	goto scr_seq_0127_D49R0106_036D

scr_seq_0127_D49R0106_0360:
	.byte 0x02, 0x00
scr_seq_0127_D49R0106_0362:
	npc_msg 17
	goto scr_seq_0127_D49R0106_036D

scr_seq_0127_D49R0106_036B:
	.byte 0x02, 0x00
scr_seq_0127_D49R0106_036D:
	npc_msg 7
	comparevartovalue VAR_TEMP_x4007, 0
	gotoif eq, scr_seq_0127_D49R0106_014D
	comparevartovalue VAR_TEMP_x4007, 1
	gotoif eq, scr_seq_0127_D49R0106_0187
	comparevartovalue VAR_TEMP_x4007, 2
	gotoif eq, scr_seq_0127_D49R0106_01C1
	comparevartovalue VAR_TEMP_x4007, 3
	gotoif eq, scr_seq_0127_D49R0106_01FB
	goto scr_seq_0127_D49R0106_0235

scr_seq_0127_D49R0106_03AA:
	.byte 0x02, 0x00
scr_seq_0127_D49R0106_03AC:
	npc_msg 18
	waitbutton
	closemsg
	touchscreen_menu_show
	releaseall
	end

scr_seq_0127_D49R0106_03B9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0127_D49R0106_03E0
	apply_movement 3, scr_seq_0127_D49R0106_043C
	goto scr_seq_0127_D49R0106_041E

scr_seq_0127_D49R0106_03E0:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0127_D49R0106_03FB
	apply_movement 3, scr_seq_0127_D49R0106_0434
	goto scr_seq_0127_D49R0106_041E

scr_seq_0127_D49R0106_03FB:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0127_D49R0106_0416
	apply_movement 3, scr_seq_0127_D49R0106_044C
	goto scr_seq_0127_D49R0106_041E

scr_seq_0127_D49R0106_0416:
	apply_movement 3, scr_seq_0127_D49R0106_0444
scr_seq_0127_D49R0106_041E:
	wait_movement
	scrcmd_076 85, 0
	npc_msg 24
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0127_D49R0106_0433:
	.byte 0x00

scr_seq_0127_D49R0106_0434:
	step 48, 2
	step_end

scr_seq_0127_D49R0106_043C:
	step 49, 2
	step_end

scr_seq_0127_D49R0106_0444:
	step 50, 2
	step_end

scr_seq_0127_D49R0106_044C:
	step 51, 2
	step_end
scr_seq_0127_D49R0106_0454:
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

scr_seq_0127_D49R0106_0485:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_2D8
	gotoif FALSE, scr_seq_0127_D49R0106_04A3
	npc_msg 19
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0127_D49R0106_04A3:
	npc_msg 20
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0127_D49R0106_04AE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_2D9
	gotoif FALSE, scr_seq_0127_D49R0106_04CC
	npc_msg 21
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0127_D49R0106_04CC:
	npc_msg 22
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
