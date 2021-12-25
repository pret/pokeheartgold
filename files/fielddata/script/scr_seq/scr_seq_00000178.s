#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000178_00000006 ; 000
	scrdef_end

scr_seq_00000178_00000006:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 0, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
