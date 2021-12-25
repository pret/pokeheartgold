#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000210_0000000A ; 000
	scrdef scr_seq_00000210_0000001C ; 001
	scrdef_end

scr_seq_00000210_0000000A:
	checkflag FLAG_UNK_149
	gotoif eq, scr_seq_00000210_00000017
	end

scr_seq_00000210_00000017:
	scrcmd_186 1
	end

scr_seq_00000210_0000001C:
	scrcmd_055 0, 1, 1, 32780
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 32780
	callstd 2000
	end
	.balign 4, 0
