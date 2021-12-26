#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000753_00000016 ; 000
	scrdef scr_seq_00000753_00000022 ; 001
	scrdef scr_seq_00000753_000000D4 ; 002
	scrdef scr_seq_00000753_000000E7 ; 003
	scrdef scr_seq_00000753_00000102 ; 004
	scrdef_end

scr_seq_00000753_00000016:
	setvar VAR_SPECIAL_x8007, 0
	callstd 2002
	end

scr_seq_00000753_00000022:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_133
	gotoif TRUE, scr_seq_00000753_000000C9
	msgbox 3
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000753_000000BE
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_566
	scrcmd_351 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000753_000000BE
	scrcmd_470 9
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	get_partymon_species VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_472 32780
	comparevartovar VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	gotoif ne, scr_seq_00000753_000000B1
	scrcmd_473 32772
	scrcmd_474
	setflag FLAG_UNK_133
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000753_000000B1:
	scrcmd_474
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000753_000000BE:
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000753_000000C9:
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000753_000000D4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000753_000000E7:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 39, 0
	msgbox 1
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000753_00000102:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
