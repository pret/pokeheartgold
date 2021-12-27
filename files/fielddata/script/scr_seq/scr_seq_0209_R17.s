#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0209_000A ; 000
	scrdef scr_seq_0209_000F ; 001
	scrdef_end

scr_seq_0209_000A:
	scrcmd_186 1
	end

scr_seq_0209_000F:
	scrcmd_186 1
	end
	.balign 4, 0
