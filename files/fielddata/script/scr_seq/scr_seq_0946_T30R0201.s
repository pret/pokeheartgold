#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0946_000A ; 000
	scrdef scr_seq_0946_001D ; 001
	scrdef_end

scr_seq_0946_000A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0946_001D:
	scrcmd_076 147, 0
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	scrcmd_077
	end
	.balign 4, 0
