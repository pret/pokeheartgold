#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0840_000E ; 000
	scrdef scr_seq_0840_0021 ; 001
	scrdef scr_seq_0840_004A ; 002
	scrdef_end

scr_seq_0840_000E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0840_0021:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_118
	gotoif TRUE, scr_seq_0840_003F
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0840_003F:
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0840_004A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 242, 0
	npc_msg 3
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
