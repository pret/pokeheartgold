#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000247_0000000E ; 000
	scrdef scr_seq_00000247_00000010 ; 001
	scrdef scr_seq_00000247_00000027 ; 002
	scrdef_end

scr_seq_00000247_0000000E:
	end

scr_seq_00000247_00000010:
	scrcmd_055 15, 1, 8, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000247_00000027:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 16, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
