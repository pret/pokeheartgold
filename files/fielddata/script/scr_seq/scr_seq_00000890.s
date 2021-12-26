#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000890_0000000A ; 000
	scrdef scr_seq_00000890_00000099 ; 001
	scrdef_end

scr_seq_00000890_0000000A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_089
	gotoif TRUE, scr_seq_00000890_00000081
	msgbox 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000890_00000042
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000890_0000008C
	end

scr_seq_00000890_00000042:
	msgbox 1
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000890_00000065
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000890_0000008C
	end

scr_seq_00000890_00000065:
	setvar VAR_SPECIAL_x8004, 450
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	setflag FLAG_UNK_089
	closemsg
	scrcmd_747
	releaseall
	end

scr_seq_00000890_00000081:
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000890_0000008C:
	msgbox 4
	waitbutton
	closemsg
	scrcmd_747
	releaseall
	end

scr_seq_00000890_00000099:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
