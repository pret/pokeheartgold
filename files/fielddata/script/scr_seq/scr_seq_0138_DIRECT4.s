#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0138_0006 ; 000
	scrdef_end

scr_seq_0138_0006:
	scrcmd_284
	end

scr_seq_0138_000A:
	.byte 0x02, 0x00
	.balign 4, 0
