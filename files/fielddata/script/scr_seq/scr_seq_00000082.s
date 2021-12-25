#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000082_0000001A ; 000
	scrdef scr_seq_00000082_0000002A ; 001
	scrdef scr_seq_00000082_0000003A ; 002
	scrdef scr_seq_00000082_00000012 ; 003
	scrdef_end

scr_seq_00000082_00000012:
	setvar VAR_UNK_40E5, 2
	end

scr_seq_00000082_0000001A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 10440
	releaseall
	end

scr_seq_00000082_0000002A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 10441
	releaseall
	end

scr_seq_00000082_0000003A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 10442
	releaseall
	end
	.balign 4, 0
