#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0223_R28_000A ; 000
	scrdef scr_seq_0223_R28_0012 ; 001
	scrdef_end

scr_seq_0223_R28_000A:
	setvar VAR_UNK_4126, 0
	end

scr_seq_0223_R28_0012:
	scrcmd_055 0, 1, 2, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
