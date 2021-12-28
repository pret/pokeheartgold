#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0814_T08R0601_0012 ; 000
	scrdef scr_seq_0814_T08R0601_0025 ; 001
	scrdef scr_seq_0814_T08R0601_0040 ; 002
	scrdef scr_seq_0814_T08R0601_005B ; 003
	scrdef_end

scr_seq_0814_T08R0601_0012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0814_T08R0601_0025:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 190, 0
	npc_msg 1
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0814_T08R0601_0040:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 190, 0
	npc_msg 2
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0814_T08R0601_005B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 190, 0
	npc_msg 3
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
