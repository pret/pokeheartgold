#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000078_0000001E ; 000
	scrdef scr_seq_00000078_0000002A ; 001
	scrdef scr_seq_00000078_0000003D ; 002
	scrdef scr_seq_00000078_00000050 ; 003
	scrdef scr_seq_00000078_00000016 ; 004
	scrdef_end

scr_seq_00000078_00000016:
	setvar VAR_UNK_40E5, 2
	end

scr_seq_00000078_0000001E:
	setvar VAR_SPECIAL_x8007, 0
	callstd 2002
	end

scr_seq_00000078_0000002A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000078_0000003D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000078_00000050:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
