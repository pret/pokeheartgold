#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000236_0000000A ; 000
	scrdef scr_seq_00000236_0000001D ; 001
	scrdef_end

scr_seq_00000236_0000000A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000236_0000001D:
	scrcmd_055 1, 1, 2, 32780
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 32780
	callstd 2000
	end
	.balign 4, 0
