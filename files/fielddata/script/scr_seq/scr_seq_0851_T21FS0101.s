#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0851_0012 ; 000
	scrdef scr_seq_0851_0073 ; 001
	scrdef scr_seq_0851_004A ; 002
	scrdef scr_seq_0851_002E ; 003
	scrdef_end

scr_seq_0851_0012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 0
	callstd 2048
	releaseall
	end

scr_seq_0851_002E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 0
	callstd 2052
	releaseall
	end

scr_seq_0851_004A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4108, 4
	gotoif lt, scr_seq_0851_0068
	npc_msg 1
	goto scr_seq_0851_006B

scr_seq_0851_0068:
	npc_msg 0
scr_seq_0851_006B:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0851_0073:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
