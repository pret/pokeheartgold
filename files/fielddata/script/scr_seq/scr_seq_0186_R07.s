#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0186_R07_000A ; 000
	scrdef scr_seq_0186_R07_001F ; 001
	scrdef_end

scr_seq_0186_R07_000A:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 0, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0186_R07_001F:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
