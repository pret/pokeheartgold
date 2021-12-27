#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0235_0012 ; 000
	scrdef scr_seq_0235_0014 ; 001
	scrdef scr_seq_0235_0027 ; 002
	scrdef scr_seq_0235_003A ; 003
	scrdef_end

scr_seq_0235_0012:
	end

scr_seq_0235_0014:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0235_0027:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0235_003A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
