#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000113_00000006 ; 000
	scrdef_end

scr_seq_00000113_00000006:
	scrcmd_375 0
	end
	.balign 4, 0
