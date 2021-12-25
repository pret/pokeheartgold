#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000138_00000006 ; 000
	scrdef_end

scr_seq_00000138_00000006:
	scrcmd_284
	end

scr_seq_00000138_0000000A:
	.byte 0x02, 0x00
	.balign 4, 0
