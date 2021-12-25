#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000203_00000006 ; 000
	scrdef_end

scr_seq_00000203_00000006:
	scrcmd_055 0, 1, 10, 32780
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 32780
	callstd 2000
	end
	.balign 4, 0
