#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0855_T21R0401_000A ; 000
	scrdef scr_seq_0855_T21R0401_000C ; 001
	scrdef_end

scr_seq_0855_T21R0401_000A:
	end

scr_seq_0855_T21R0401_000C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
