#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000205_0000000A ; 000
	scrdef scr_seq_00000205_00000013 ; 001
	scrdef_end

scr_seq_00000205_0000000A:
	scrcmd_186 1
	setflag FLAG_UNK_149
	end

scr_seq_00000205_00000013:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 0, 32780
	callstd 2000
	end
	.balign 4, 0
