#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0901_0012 ; 000
	scrdef scr_seq_0901_002E ; 001
	scrdef scr_seq_0901_0057 ; 002
	scrdef scr_seq_0901_0080 ; 003
	scrdef_end

scr_seq_0901_0012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 5
	callstd 2052
	releaseall
	end

scr_seq_0901_002E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0901_004C
	npc_msg 1
	goto scr_seq_0901_004F

scr_seq_0901_004C:
	npc_msg 0
scr_seq_0901_004F:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0901_0057:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0901_0075
	npc_msg 3
	goto scr_seq_0901_0078

scr_seq_0901_0075:
	npc_msg 2
scr_seq_0901_0078:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0901_0080:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
