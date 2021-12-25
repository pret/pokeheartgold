#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000000_0000000E ; 000
	scrdef scr_seq_00000000_00000021 ; 001
	scrdef scr_seq_00000000_0000004C ; 002
	scrdef_end

scr_seq_00000000_0000000E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000000_00000021:
	scrcmd_609
	lockall
	msgbox 9
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000000_00000050
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000000_00000063
	end

scr_seq_00000000_0000004C:
	scrcmd_609
	lockall
scr_seq_00000000_00000050:
	scrcmd_151
	msgbox 12
	scrcmd_257 94
	closemsg
	scrcmd_587
	scrcmd_449
	releaseall
	end

scr_seq_00000000_00000063:
	closemsg
	releaseall
	end
	.balign 4, 0
