#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000779_00000012 ; 000
	scrdef scr_seq_00000779_0000001E ; 001
	scrdef scr_seq_00000779_00000047 ; 002
	scrdef scr_seq_00000779_0000005A ; 003
	scrdef_end

scr_seq_00000779_00000012:
	setvar VAR_SPECIAL_x8007, 0
	callstd 2002
	end

scr_seq_00000779_0000001E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_173
	gotoif eq, scr_seq_00000779_0000003C
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000779_0000003C:
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000779_00000047:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000779_0000005A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
