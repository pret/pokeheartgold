#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0247_R38_000E ; 000
	scrdef scr_seq_0247_R38_0010 ; 001
	scrdef scr_seq_0247_R38_0027 ; 002
	scrdef_end

scr_seq_0247_R38_000E:
	end

scr_seq_0247_R38_0010:
	scrcmd_055 15, 1, 8, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0247_R38_0027:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 16, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
