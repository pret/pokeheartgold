#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0210_R18_000A ; 000
	scrdef scr_seq_0210_R18_001C ; 001
	scrdef_end

scr_seq_0210_R18_000A:
	checkflag FLAG_UNK_149
	gotoif TRUE, scr_seq_0210_R18_0017
	end

scr_seq_0210_R18_0017:
	scrcmd_186 1
	end

scr_seq_0210_R18_001C:
	scrcmd_055 0, 1, 1, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
