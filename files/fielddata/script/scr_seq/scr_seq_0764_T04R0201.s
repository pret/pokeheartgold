#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0764_T04R0201_000E ; 000
	scrdef scr_seq_0764_T04R0201_0021 ; 001
	scrdef scr_seq_0764_T04R0201_0034 ; 002
	scrdef_end

scr_seq_0764_T04R0201_000E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0764_T04R0201_0021:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0764_T04R0201_0034:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 50, 0
	npc_msg 2
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
