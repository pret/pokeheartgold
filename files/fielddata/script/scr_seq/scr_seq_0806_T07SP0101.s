#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0806_0012 ; 000
	scrdef scr_seq_0806_01E3 ; 001
	scrdef scr_seq_0806_0094 ; 002
	scrdef scr_seq_0806_012A ; 003
	scrdef_end

scr_seq_0806_0012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	hasitem ITEM_COIN_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0806_0066
	apply_movement 0, scr_seq_0806_007C
	wait_movement
	npc_msg 12
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_780 0, 0
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	setvar VAR_TEMP_x4001, 2
	releaseall
	end

scr_seq_0806_0066:
	npc_msg 10
	apply_movement 0, scr_seq_0806_007C
	wait_movement
	npc_msg 11
	goto scr_seq_0806_00E4


scr_seq_0806_007C:
	.short 1, 1
	.short 254, 0

scr_seq_0806_0084:
	.short 2, 1
	.short 254, 0

scr_seq_0806_008C:
	.short 3, 1
	.short 254, 0
scr_seq_0806_0094:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_386 VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ne, scr_seq_0806_00B9
	call scr_seq_0806_00EC
	goto scr_seq_0806_00C1

scr_seq_0806_00B9:
	apply_movement 0, scr_seq_0806_007C
scr_seq_0806_00C1:
	wait_movement
	hasitem ITEM_COIN_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0806_00E1
	npc_msg 13
	goto scr_seq_0806_00E4

scr_seq_0806_00E1:
	npc_msg 11
scr_seq_0806_00E4:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0806_00EC:
	get_player_coords VAR_TEMP_x4002, VAR_TEMP_x4003
	get_player_coords VAR_TEMP_x4002, VAR_TEMP_x4003
	comparevartovalue VAR_TEMP_x4002, 6
	gotoif ne, scr_seq_0806_0113
	apply_movement 0, scr_seq_0806_0084
	goto scr_seq_0806_0128

scr_seq_0806_0113:
	comparevartovalue VAR_TEMP_x4002, 8
	gotoif ne, scr_seq_0806_0128
	apply_movement 0, scr_seq_0806_008C
scr_seq_0806_0128:
	return

scr_seq_0806_012A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	hasitem ITEM_COIN_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0806_0184
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0806_0163
	npc_msg 6
	setvar VAR_TEMP_x4001, 1
	goto scr_seq_0806_017C

scr_seq_0806_0163:
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif ne, scr_seq_0806_0179
	npc_msg 7
	goto scr_seq_0806_017C

scr_seq_0806_0179:
	npc_msg 8
scr_seq_0806_017C:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0806_0184:
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0806_019A
	npc_msg 0
	goto scr_seq_0806_019D

scr_seq_0806_019A:
	npc_msg 9
scr_seq_0806_019D:
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0806_01D4
	npc_msg 3
	setvar VAR_TEMP_x4001, 1
	setvar VAR_SPECIAL_x8004, 444
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	npc_msg 4
	goto scr_seq_0806_00E4

scr_seq_0806_01D4:
	setvar VAR_TEMP_x4001, 1
	npc_msg 5
	goto scr_seq_0806_00E4

scr_seq_0806_01E3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 14
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
