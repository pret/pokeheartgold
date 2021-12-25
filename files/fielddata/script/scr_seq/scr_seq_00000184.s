#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000184_0000000A ; 000
	scrdef scr_seq_00000184_0000001D ; 001
	scrdef_end

scr_seq_00000184_0000000A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000184_0000001D:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 1, 32780
	callstd 2000
	end
	.balign 4, 0
