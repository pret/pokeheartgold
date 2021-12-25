#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000806_00000012 ; 000
	scrdef scr_seq_00000806_000001E3 ; 001
	scrdef scr_seq_00000806_00000094 ; 002
	scrdef scr_seq_00000806_0000012A ; 003
	scrdef_end

scr_seq_00000806_00000012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	hasitem ITEM_COIN_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000806_00000066
	apply_movement 0, scr_seq_00000806_0000007C
	wait_movement
	msgbox 12
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_780 0, 0
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	setvar VAR_TEMP_x4001, 2
	releaseall
	end

scr_seq_00000806_00000066:
	msgbox 10
	apply_movement 0, scr_seq_00000806_0000007C
	wait_movement
	msgbox 11
	goto scr_seq_00000806_000000E4


scr_seq_00000806_0000007C:
	.short 1, 1
	.short 254, 0

scr_seq_00000806_00000084:
	.short 2, 1
	.short 254, 0

scr_seq_00000806_0000008C:
	.short 3, 1
	.short 254, 0
scr_seq_00000806_00000094:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_386 VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ne, scr_seq_00000806_000000B9
	call scr_seq_00000806_000000EC
	goto scr_seq_00000806_000000C1

scr_seq_00000806_000000B9:
	apply_movement 0, scr_seq_00000806_0000007C
scr_seq_00000806_000000C1:
	wait_movement
	hasitem ITEM_COIN_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000806_000000E1
	msgbox 13
	goto scr_seq_00000806_000000E4

scr_seq_00000806_000000E1:
	msgbox 11
scr_seq_00000806_000000E4:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000806_000000EC:
	get_player_coords VAR_TEMP_x4002, VAR_TEMP_x4003
	get_player_coords VAR_TEMP_x4002, VAR_TEMP_x4003
	comparevartovalue VAR_TEMP_x4002, 6
	gotoif ne, scr_seq_00000806_00000113
	apply_movement 0, scr_seq_00000806_00000084
	goto scr_seq_00000806_00000128

scr_seq_00000806_00000113:
	comparevartovalue VAR_TEMP_x4002, 8
	gotoif ne, scr_seq_00000806_00000128
	apply_movement 0, scr_seq_00000806_0000008C
scr_seq_00000806_00000128:
	return

scr_seq_00000806_0000012A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	hasitem ITEM_COIN_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000806_00000184
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000806_00000163
	msgbox 6
	setvar VAR_TEMP_x4001, 1
	goto scr_seq_00000806_0000017C

scr_seq_00000806_00000163:
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif ne, scr_seq_00000806_00000179
	msgbox 7
	goto scr_seq_00000806_0000017C

scr_seq_00000806_00000179:
	msgbox 8
scr_seq_00000806_0000017C:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000806_00000184:
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000806_0000019A
	msgbox 0
	goto scr_seq_00000806_0000019D

scr_seq_00000806_0000019A:
	msgbox 9
scr_seq_00000806_0000019D:
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000806_000001D4
	msgbox 3
	setvar VAR_TEMP_x4001, 1
	setvar VAR_SPECIAL_x8004, 444
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	msgbox 4
	goto scr_seq_00000806_000000E4

scr_seq_00000806_000001D4:
	setvar VAR_TEMP_x4001, 1
	msgbox 5
	goto scr_seq_00000806_000000E4

scr_seq_00000806_000001E3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 14
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
