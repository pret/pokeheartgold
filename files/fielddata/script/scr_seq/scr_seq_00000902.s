#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000902_00000016 ; 000
	scrdef scr_seq_00000902_00000032 ; 001
	scrdef scr_seq_00000902_0000005B ; 002
	scrdef scr_seq_00000902_00000084 ; 003
	scrdef scr_seq_00000902_000000AD ; 004
	scrdef_end

scr_seq_00000902_00000016:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 6
	callstd 2052
	releaseall
	end

scr_seq_00000902_00000032:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_00000902_00000050
	msgbox 1
	goto scr_seq_00000902_00000053

scr_seq_00000902_00000050:
	msgbox 0
scr_seq_00000902_00000053:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000902_0000005B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_00000902_00000079
	msgbox 3
	goto scr_seq_00000902_0000007C

scr_seq_00000902_00000079:
	msgbox 2
scr_seq_00000902_0000007C:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000902_00000084:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_00000902_000000A2
	msgbox 5
	goto scr_seq_00000902_000000A5

scr_seq_00000902_000000A2:
	msgbox 4
scr_seq_00000902_000000A5:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000902_000000AD:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
