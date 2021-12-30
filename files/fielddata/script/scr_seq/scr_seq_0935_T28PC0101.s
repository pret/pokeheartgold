#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0935_T28PC0101_0012 ; 000
	scrdef scr_seq_0935_T28PC0101_001E ; 001
	scrdef scr_seq_0935_T28PC0101_0031 ; 002
	scrdef scr_seq_0935_T28PC0101_0044 ; 003
	scrdef_end

scr_seq_0935_T28PC0101_0012:
	setvar VAR_SPECIAL_x8007, 2
	callstd std_nurse_joy
	end

scr_seq_0935_T28PC0101_001E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0935_T28PC0101_0031:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0935_T28PC0101_0044:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
