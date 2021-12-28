#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0082_D32R0103_001A ; 000
	scrdef scr_seq_0082_D32R0103_002A ; 001
	scrdef scr_seq_0082_D32R0103_003A ; 002
	scrdef scr_seq_0082_D32R0103_0012 ; 003
	scrdef_end

scr_seq_0082_D32R0103_0012:
	setvar VAR_UNK_40E5, 2
	end

scr_seq_0082_D32R0103_001A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 10440
	releaseall
	end

scr_seq_0082_D32R0103_002A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 10441
	releaseall
	end

scr_seq_0082_D32R0103_003A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 10442
	releaseall
	end
	.balign 4, 0
