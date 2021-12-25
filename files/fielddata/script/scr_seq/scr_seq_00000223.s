#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000223_0000000A ; 000
	scrdef scr_seq_00000223_00000012 ; 001
	scrdef_end

scr_seq_00000223_0000000A:
	setvar VAR_UNK_4126, 0
	end

scr_seq_00000223_00000012:
	scrcmd_055 0, 1, 2, 32780
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 32780
	callstd 2000
	end
	.balign 4, 0
