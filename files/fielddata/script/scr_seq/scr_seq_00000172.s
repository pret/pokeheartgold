#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000172_0000000A ; 000
	scrdef scr_seq_00000172_00000062 ; 001
	scrdef_end

scr_seq_00000172_0000000A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_135
	gotoif TRUE, scr_seq_00000172_0000004D
	buffer_players_name 0
	gender_msgbox 0, 1
	setvar VAR_SPECIAL_x8004, 44
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000172_00000058
	callstd 2033
	setflag FLAG_UNK_135
scr_seq_00000172_0000004D:
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000172_00000058:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000172_00000062:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
