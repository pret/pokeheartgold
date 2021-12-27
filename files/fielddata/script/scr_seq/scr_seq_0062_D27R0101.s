#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0062_0016 ; 000
	scrdef scr_seq_0062_0029 ; 001
	scrdef scr_seq_0062_000E ; 002
	scrdef_end

scr_seq_0062_000E:
	setvar VAR_UNK_4125, 0
	end

scr_seq_0062_0016:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0062_0029:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
