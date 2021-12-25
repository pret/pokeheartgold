#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000254_00000012 ; 000
	scrdef scr_seq_00000254_00000014 ; 001
	scrdef scr_seq_00000254_0000002B ; 002
	scrdef scr_seq_00000254_00000040 ; 003
	scrdef_end

scr_seq_00000254_00000012:
	end

scr_seq_00000254_00000014:
	scrcmd_055 18, 1, 3, 32780
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 32780
	callstd 2000
	end

scr_seq_00000254_0000002B:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 19, 32780
	callstd 2000
	end

scr_seq_00000254_00000040:
	scrcmd_055 20, 1, 6, 32780
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 32780
	callstd 2000
	end
	.balign 4, 0
