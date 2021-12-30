#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0864_T22R0601_000E ; 000
	scrdef scr_seq_0864_T22R0601_0010 ; 001
	scrdef scr_seq_0864_T22R0601_00C8 ; 002
	scrdef_end

scr_seq_0864_T22R0601_000E:
	end

scr_seq_0864_T22R0601_0010:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_071
	gotoif TRUE, scr_seq_0864_T22R0601_00BD
	npc_msg 1
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0864_T22R0601_0041
	goto scr_seq_0864_T22R0601_00B2

scr_seq_0864_T22R0601_0041:
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_566
	scrcmd_351 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0864_T22R0601_00B2
	scrcmd_470 0
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	get_partymon_species VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_472 32780
	comparevartovar VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	gotoif ne, scr_seq_0864_T22R0601_00A5
	scrcmd_473 32772
	scrcmd_474
	setflag FLAG_UNK_071
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0864_T22R0601_00A5:
	scrcmd_474
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0864_T22R0601_00B2:
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0864_T22R0601_00BD:
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0864_T22R0601_00C8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
