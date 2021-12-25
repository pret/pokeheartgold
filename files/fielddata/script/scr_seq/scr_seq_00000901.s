#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000901_00000012 ; 000
	scrdef scr_seq_00000901_0000002E ; 001
	scrdef scr_seq_00000901_00000057 ; 002
	scrdef scr_seq_00000901_00000080 ; 003
	scrdef_end

scr_seq_00000901_00000012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 5
	callstd 2052
	releaseall
	end

scr_seq_00000901_0000002E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_00000901_0000004C
	msgbox 1
	goto scr_seq_00000901_0000004F

scr_seq_00000901_0000004C:
	msgbox 0
scr_seq_00000901_0000004F:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000901_00000057:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_00000901_00000075
	msgbox 3
	goto scr_seq_00000901_00000078

scr_seq_00000901_00000075:
	msgbox 2
scr_seq_00000901_00000078:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000901_00000080:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
