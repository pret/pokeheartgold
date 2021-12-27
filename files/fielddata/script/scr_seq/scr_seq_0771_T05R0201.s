#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0771_0016 ; 000
	scrdef scr_seq_0771_0029 ; 001
	scrdef scr_seq_0771_003C ; 002
	scrdef scr_seq_0771_0057 ; 003
	scrdef scr_seq_0771_0072 ; 004
	scrdef_end

scr_seq_0771_0016:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0771_0029:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0771_003C:
	scrcmd_076 54, 0
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	scrcmd_077
	end

scr_seq_0771_0057:
	scrcmd_076 33, 0
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	scrcmd_077
	end

scr_seq_0771_0072:
	scrcmd_076 16, 0
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	scrcmd_077
	end
	.balign 4, 0
