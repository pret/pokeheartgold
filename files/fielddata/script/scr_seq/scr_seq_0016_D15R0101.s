#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0016_D15R0101_0016 ; 000
	scrdef scr_seq_0016_D15R0101_0018 ; 001
	scrdef scr_seq_0016_D15R0101_002B ; 002
	scrdef scr_seq_0016_D15R0101_003E ; 003
	scrdef scr_seq_0016_D15R0101_0051 ; 004
	scrdef_end

scr_seq_0016_D15R0101_0016:
	end

scr_seq_0016_D15R0101_0018:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0016_D15R0101_002B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0016_D15R0101_003E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0016_D15R0101_0051:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
