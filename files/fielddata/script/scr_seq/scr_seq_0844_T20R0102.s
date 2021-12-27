#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0844_000A ; 000
	scrdef scr_seq_0844_0021 ; 001
	scrdef_end

scr_seq_0844_000A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	buffer_players_name 0
	gender_msgbox 0, 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0844_0021:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
