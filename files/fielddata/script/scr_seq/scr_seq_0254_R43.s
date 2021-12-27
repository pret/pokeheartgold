#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0254_0012 ; 000
	scrdef scr_seq_0254_0014 ; 001
	scrdef scr_seq_0254_002B ; 002
	scrdef scr_seq_0254_0040 ; 003
	scrdef_end

scr_seq_0254_0012:
	end

scr_seq_0254_0014:
	scrcmd_055 18, 1, 3, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0254_002B:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 19, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0254_0040:
	scrcmd_055 20, 1, 6, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
