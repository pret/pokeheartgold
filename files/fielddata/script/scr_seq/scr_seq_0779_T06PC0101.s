#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0779_T06PC0101_0012 ; 000
	scrdef scr_seq_0779_T06PC0101_001E ; 001
	scrdef scr_seq_0779_T06PC0101_0047 ; 002
	scrdef scr_seq_0779_T06PC0101_005A ; 003
	scrdef_end

scr_seq_0779_T06PC0101_0012:
	setvar VAR_SPECIAL_x8007, 0
	callstd 2002
	end

scr_seq_0779_T06PC0101_001E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_173
	gotoif TRUE, scr_seq_0779_T06PC0101_003C
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0779_T06PC0101_003C:
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0779_T06PC0101_0047:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0779_T06PC0101_005A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
