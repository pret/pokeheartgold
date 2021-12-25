#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000209_0000000A ; 000
	scrdef scr_seq_00000209_0000000F ; 001
	scrdef_end

scr_seq_00000209_0000000A:
	scrcmd_186 1
	end

scr_seq_00000209_0000000F:
	scrcmd_186 1
	end
	.balign 4, 0
