#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0192_0012 ; 000
	scrdef scr_seq_0192_001E ; 001
	scrdef scr_seq_0192_0031 ; 002
	scrdef scr_seq_0192_0062 ; 003
	scrdef_end

scr_seq_0192_0012:
	setvar VAR_SPECIAL_x8007, 0
	callstd 2002
	end

scr_seq_0192_001E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0192_0031:
	checkflag FLAG_UNK_118
	gotoif TRUE, scr_seq_0192_004F
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0192_004F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0192_0062:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
