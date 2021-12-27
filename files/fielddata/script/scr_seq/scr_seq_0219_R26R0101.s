#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0219_000A ; 000
	scrdef scr_seq_0219_0046 ; 001
	scrdef_end

scr_seq_0219_000A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	play_fanfare SEQ_ME_ASA
	wait_fanfare
	heal_party
	scrcmd_436
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0219_0046:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
