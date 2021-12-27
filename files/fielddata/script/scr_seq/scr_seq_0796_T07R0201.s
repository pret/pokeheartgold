#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0796_0022 ; 000
	scrdef scr_seq_0796_0035 ; 001
	scrdef scr_seq_0796_0050 ; 002
	scrdef scr_seq_0796_006B ; 003
	scrdef scr_seq_0796_0086 ; 004
	scrdef scr_seq_0796_001A ; 005
	scrdef_end

scr_seq_0796_001A:
	setvar VAR_UNK_4125, 0
	end

scr_seq_0796_0022:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0796_0035:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 52, 0
	npc_msg 1
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0796_0050:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 35, 0
	npc_msg 2
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0796_006B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 29, 0
	npc_msg 3
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0796_0086:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
