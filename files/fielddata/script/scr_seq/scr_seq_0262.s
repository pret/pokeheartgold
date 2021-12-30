#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0262_001E ; 000
	scrdef scr_seq_0262_00BD ; 001
	scrdef scr_seq_0262_0181 ; 002
	scrdef scr_seq_0262_0198 ; 003
	scrdef scr_seq_0262_01AF ; 004
	scrdef scr_seq_0262_01C6 ; 005
	scrdef scr_seq_0262_01D2 ; 006
	scrdef_end

scr_seq_0262_001E:
	scrcmd_609
	lockall
	scrcmd_721 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0262_006A
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0262_0049
	npc_msg 8
	goto scr_seq_0262_0062

scr_seq_0262_0049:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0262_005F
	npc_msg 9
	goto scr_seq_0262_0062

scr_seq_0262_005F:
	npc_msg 10
scr_seq_0262_0062:
	waitbutton
	goto scr_seq_0262_00B5

scr_seq_0262_006A:
	npc_msg 4
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0262_00B5
	fade_screen 6, 1, 0, 0x00
	wait_fade
	closemsg
	scrcmd_717 32780
	fade_screen 6, 1, 1, 0x00
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0262_00B7
	scrcmd_718 0, 32780
	npc_msg 5
	waitbutton
scr_seq_0262_00B5:
	closemsg
scr_seq_0262_00B7:
	touchscreen_menu_show
	releaseall
	end

scr_seq_0262_00BD:
	scrcmd_609
	lockall
	scrcmd_719 32768, 32769
	comparevartovalue VAR_SPECIAL_x8000, 255
	gotoif eq, scr_seq_0262_0114
	scrcmd_718 0, 32768
	npc_msg 6
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0262_0112
	fade_screen 6, 1, 0, 0x00
	wait_fade
	closemsg
	scrcmd_720 32769
	fade_screen 6, 1, 1, 0x00
	wait_fade
	npc_msg 7
	waitbutton
scr_seq_0262_0112:
	closemsg
scr_seq_0262_0114:
	touchscreen_menu_show
	releaseall
	end

scr_seq_0262_011A:
	scrcmd_447 1, 0
	comparevartovalue VAR_UNK_40E3, 3
	gotoif ne, scr_seq_0262_0155
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_176 173, 0, 19, 2, 1
	fade_screen 6, 1, 1, 0x00
	wait_fade
	goto scr_seq_0262_0179

scr_seq_0262_0155:
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_176 173, 0, 5, 2, 1
	fade_screen 6, 1, 1, 0x00
	wait_fade
scr_seq_0262_0179:
	setvar VAR_UNK_40E3, 2
	return

scr_seq_0262_0181:
	scrcmd_609
	lockall
	play_se SEQ_SE_DP_PINPON
	npc_msg 0
	closemsg
	call scr_seq_0262_011A
	releaseall
	end

scr_seq_0262_0198:
	scrcmd_609
	lockall
	play_se SEQ_SE_DP_PINPON
	npc_msg 1
	closemsg
	call scr_seq_0262_011A
	releaseall
	end

scr_seq_0262_01AF:
	scrcmd_609
	lockall
	play_se SEQ_SE_DP_PINPON
	npc_msg 2
	closemsg
	call scr_seq_0262_011A
	releaseall
	end

scr_seq_0262_01C6:
	setvar VAR_UNK_40E3, 2
	scrcmd_447 1, 0
	end

scr_seq_0262_01D2:
	scrcmd_609
	lockall
	npc_msg 3
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0262_01FA
	call scr_seq_0262_011A
	releaseall
	end

scr_seq_0262_01FA:
	releaseall
	end
	.balign 4, 0
