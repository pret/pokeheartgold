#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0208_0006 ; 000
	scrdef_end

scr_seq_0208_0006:
	clearflag FLAG_UNK_149
	end

scr_seq_0208_000C:
	.byte 0x02, 0x00, 0x00, 0x00
	.balign 4, 0
