#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0852_T21PC0101_001A ; 000
	scrdef scr_seq_0852_T21PC0101_0075 ; 001
	scrdef scr_seq_0852_T21PC0101_0088 ; 002
	scrdef scr_seq_0852_T21PC0101_004C ; 003
	scrdef scr_seq_0852_T21PC0101_0026 ; 004
	scrdef scr_seq_0852_T21PC0101_0039 ; 005
	scrdef_end

scr_seq_0852_T21PC0101_001A:
	setvar VAR_SPECIAL_x8007, 0
	callstd 2002
	end

scr_seq_0852_T21PC0101_0026:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0852_T21PC0101_0039:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0852_T21PC0101_004C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_SCENE_ELMS_LAB, 3
	gotoif lt, scr_seq_0852_T21PC0101_006A
	npc_msg 3
	goto scr_seq_0852_T21PC0101_006D

scr_seq_0852_T21PC0101_006A:
	npc_msg 2
scr_seq_0852_T21PC0101_006D:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0852_T21PC0101_0075:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0852_T21PC0101_0088:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
