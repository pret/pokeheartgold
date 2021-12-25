#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000009_00000060 ; 000
	scrdef scr_seq_00000009_00000075 ; 001
	scrdef scr_seq_00000009_0000000E ; 002
	scrdef_end

scr_seq_00000009_0000000E:
	scrcmd_375 0
	scrcmd_379 VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 3
	gotoif ne, scr_seq_00000009_0000003D
	scrcmd_339 0, 18, 0, 10, 1
	scrcmd_342 2, 20, 3
	goto scr_seq_00000009_0000005E

scr_seq_00000009_0000003D:
	comparevartovalue VAR_TEMP_x4001, 4
	gotoif ne, scr_seq_00000009_0000005E
	scrcmd_339 0, 18, 0, 10, 1
	scrcmd_342 2, 20, 3
scr_seq_00000009_0000005E:
	end

scr_seq_00000009_00000060:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 0, 32780
	callstd 2000
	end

scr_seq_00000009_00000075:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
