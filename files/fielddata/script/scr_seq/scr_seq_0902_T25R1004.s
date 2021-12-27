#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0902_0016 ; 000
	scrdef scr_seq_0902_0032 ; 001
	scrdef scr_seq_0902_005B ; 002
	scrdef scr_seq_0902_0084 ; 003
	scrdef scr_seq_0902_00AD ; 004
	scrdef_end

scr_seq_0902_0016:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 6
	callstd 2052
	releaseall
	end

scr_seq_0902_0032:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0902_0050
	npc_msg 1
	goto scr_seq_0902_0053

scr_seq_0902_0050:
	npc_msg 0
scr_seq_0902_0053:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0902_005B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0902_0079
	npc_msg 3
	goto scr_seq_0902_007C

scr_seq_0902_0079:
	npc_msg 2
scr_seq_0902_007C:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0902_0084:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0902_00A2
	npc_msg 5
	goto scr_seq_0902_00A5

scr_seq_0902_00A2:
	npc_msg 4
scr_seq_0902_00A5:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0902_00AD:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
