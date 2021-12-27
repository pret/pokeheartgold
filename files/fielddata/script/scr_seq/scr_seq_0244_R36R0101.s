#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0244_000E ; 000
	scrdef scr_seq_0244_0010 ; 001
	scrdef scr_seq_0244_0023 ; 002
	scrdef_end

scr_seq_0244_000E:
	end

scr_seq_0244_0010:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0244_0023:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
