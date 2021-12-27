#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0873_000E ; 000
	scrdef scr_seq_0873_004D ; 001
	scrdef scr_seq_0873_00BF ; 002
	scrdef_end

scr_seq_0873_000E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_07B
	gotoif TRUE, scr_seq_0873_002C
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0873_002C:
	checkflag FLAG_UNK_080
	gotoif TRUE, scr_seq_0873_0042
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0873_0042:
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0873_004D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_080
	gotoif TRUE, scr_seq_0873_006B
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0873_006B:
	checkflag FLAG_UNK_081
	gotoif TRUE, scr_seq_0873_00AA
	npc_msg 4
	scrcmd_049
	setvar VAR_SPECIAL_x8004, 249
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0873_00B5
	callstd 2008
	setflag FLAG_UNK_081
	closemsg
	releaseall
	end

scr_seq_0873_00AA:
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0873_00B5:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_0873_00BF:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 83, 0
	npc_msg 8
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
