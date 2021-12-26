#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000916_00000006 ; 000
	scrdef_end

scr_seq_00000916_00000006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0BE
	gotoif TRUE, scr_seq_00000916_000000B3
	msgbox 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000916_00000037
	goto scr_seq_00000916_000000A8

scr_seq_00000916_00000037:
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_566
	scrcmd_351 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000916_000000A8
	scrcmd_470 2
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	get_partymon_species VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_472 32780
	comparevartovar VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	gotoif ne, scr_seq_00000916_0000009B
	scrcmd_473 32772
	scrcmd_474
	setflag FLAG_UNK_0BE
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000916_0000009B:
	scrcmd_474
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000916_000000A8:
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000916_000000B3:
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
