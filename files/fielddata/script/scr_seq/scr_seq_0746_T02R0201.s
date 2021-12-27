#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0746_0012 ; 000
	scrdef scr_seq_0746_0025 ; 001
	scrdef scr_seq_0746_0038 ; 002
	scrdef scr_seq_0746_0053 ; 003
	scrdef_end

scr_seq_0746_0012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0746_0025:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0746_0038:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 21, 0
	npc_msg 2
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0746_0053:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 19, 0
	npc_msg 3
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
