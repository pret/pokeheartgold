#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0257_R44_000E ; 000
	scrdef scr_seq_0257_R44_0010 ; 001
	scrdef scr_seq_0257_R44_0025 ; 002
	scrdef_end

scr_seq_0257_R44_000E:
	end

scr_seq_0257_R44_0010:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 0, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0257_R44_0025:
	scrcmd_055 1, 1, 1, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
