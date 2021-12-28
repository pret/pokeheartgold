#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0205_R16_000A ; 000
	scrdef scr_seq_0205_R16_0013 ; 001
	scrdef_end

scr_seq_0205_R16_000A:
	scrcmd_186 1
	setflag FLAG_UNK_149
	end

scr_seq_0205_R16_0013:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 0, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
