#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0753_T03PC0101_0016 ; 000
	scrdef scr_seq_0753_T03PC0101_0022 ; 001
	scrdef scr_seq_0753_T03PC0101_00D4 ; 002
	scrdef scr_seq_0753_T03PC0101_00E7 ; 003
	scrdef scr_seq_0753_T03PC0101_0102 ; 004
	scrdef_end

scr_seq_0753_T03PC0101_0016:
	setvar VAR_SPECIAL_x8007, 0
	callstd std_nurse_joy
	end

scr_seq_0753_T03PC0101_0022:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_133
	gotoif TRUE, scr_seq_0753_T03PC0101_00C9
	npc_msg 3
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0753_T03PC0101_00BE
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_566
	scrcmd_351 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0753_T03PC0101_00BE
	scrcmd_470 9
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	get_partymon_species VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_472 32780
	comparevartovar VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	gotoif ne, scr_seq_0753_T03PC0101_00B1
	scrcmd_473 32772
	scrcmd_474
	setflag FLAG_UNK_133
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0753_T03PC0101_00B1:
	scrcmd_474
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0753_T03PC0101_00BE:
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0753_T03PC0101_00C9:
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0753_T03PC0101_00D4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0753_T03PC0101_00E7:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 39, 0
	npc_msg 1
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0753_T03PC0101_0102:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
