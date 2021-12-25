#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000887_00000012 ; 000
	scrdef scr_seq_00000887_00000070 ; 001
	scrdef scr_seq_00000887_00000047 ; 002
	scrdef scr_seq_00000887_0000001E ; 003
	scrdef_end

scr_seq_00000887_00000012:
	setvar VAR_SPECIAL_x8007, 0
	callstd 2002
	end

scr_seq_00000887_0000001E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_00000887_0000003C
	msgbox 3
	goto scr_seq_00000887_0000003F

scr_seq_00000887_0000003C:
	msgbox 2
scr_seq_00000887_0000003F:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000887_00000047:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_00000887_00000065
	msgbox 5
	goto scr_seq_00000887_00000068

scr_seq_00000887_00000065:
	msgbox 4
scr_seq_00000887_00000068:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000887_00000070:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_00000887_0000008E
	msgbox 1
	goto scr_seq_00000887_00000091

scr_seq_00000887_0000008E:
	msgbox 0
scr_seq_00000887_00000091:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
