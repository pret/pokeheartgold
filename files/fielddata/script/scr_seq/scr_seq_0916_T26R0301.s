#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0916_T26R0301_0006 ; 000
	scrdef_end

scr_seq_0916_T26R0301_0006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0BE
	gotoif TRUE, scr_seq_0916_T26R0301_00B3
	npc_msg 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0916_T26R0301_0037
	goto scr_seq_0916_T26R0301_00A8

scr_seq_0916_T26R0301_0037:
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_566
	scrcmd_351 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0916_T26R0301_00A8
	scrcmd_470 2
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	get_partymon_species VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_472 32780
	comparevartovar VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	gotoif ne, scr_seq_0916_T26R0301_009B
	scrcmd_473 32772
	scrcmd_474
	setflag FLAG_UNK_0BE
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0916_T26R0301_009B:
	scrcmd_474
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0916_T26R0301_00A8:
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0916_T26R0301_00B3:
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
