#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0863_0012 ; 000
	scrdef scr_seq_0863_002F ; 001
	scrdef scr_seq_0863_0042 ; 002
	scrdef scr_seq_0863_0014 ; 003
	scrdef_end

scr_seq_0863_0012:
	end

scr_seq_0863_0014:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 16, 0
	npc_msg 2
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0863_002F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0863_0042:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
