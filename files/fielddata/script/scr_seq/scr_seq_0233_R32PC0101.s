#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0233_0012 ; 000
	scrdef scr_seq_0233_001E ; 001
	scrdef scr_seq_0233_00AC ; 002
	scrdef scr_seq_0233_012C ; 003
	scrdef_end

scr_seq_0233_0012:
	setvar VAR_SPECIAL_x8007, 3
	callstd 2002
	end

scr_seq_0233_001E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_075
	gotoif TRUE, scr_seq_0233_008C
	npc_msg 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0233_0058
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0233_00A1
	end

scr_seq_0233_0058:
	setvar VAR_SPECIAL_x8004, 445
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0233_0097
	callstd 2033
	setflag FLAG_UNK_075
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0233_008C:
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0233_0097:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_0233_00A1:
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0233_00AC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_174
	gotoif TRUE, scr_seq_0233_0121
	npc_msg 7
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0233_00E0
	npc_msg 8
	goto scr_seq_0233_00E3

scr_seq_0233_00E0:
	npc_msg 9
scr_seq_0233_00E3:
	setvar VAR_SPECIAL_x8004, 494
	setvar VAR_SPECIAL_x8005, 2
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0233_0117
	callstd 2033
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	setflag FLAG_UNK_174
	end

scr_seq_0233_0117:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_0233_0121:
	npc_msg 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0233_012C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
