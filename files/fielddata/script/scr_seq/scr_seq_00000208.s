#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000208_00000006 ; 000
	scrdef_end

scr_seq_00000208_00000006:
	clearflag FLAG_UNK_149
	end

scr_seq_00000208_0000000C:
	.byte 0x02, 0x00, 0x00, 0x00
	.balign 4, 0
