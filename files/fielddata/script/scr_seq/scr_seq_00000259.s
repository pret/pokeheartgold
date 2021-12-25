#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000259_0000000E ; 000
	scrdef scr_seq_00000259_00000037 ; 001
	scrdef scr_seq_00000259_0000004E ; 002
	scrdef_end

scr_seq_00000259_0000000E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_079
	gotoif eq, scr_seq_00000259_0000002C
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000259_0000002C:
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000259_00000037:
	scrcmd_055 0, 1, 3, 32780
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 32780
	callstd 2000
	end

scr_seq_00000259_0000004E:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 1, 32780
	callstd 2000
	end
	.balign 4, 0
