#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0955_004E ; 000
	scrdef scr_seq_0955_005A ; 001
	scrdef scr_seq_0955_0066 ; 002
	scrdef scr_seq_0955_0072 ; 003
	scrdef scr_seq_0955_007E ; 004
	scrdef scr_seq_0955_008A ; 005
	scrdef scr_seq_0955_0096 ; 006
	scrdef scr_seq_0955_00A2 ; 007
	scrdef scr_seq_0955_00AE ; 008
	scrdef scr_seq_0955_00BA ; 009
	scrdef scr_seq_0955_00C6 ; 010
	scrdef scr_seq_0955_00D2 ; 011
	scrdef scr_seq_0955_00DE ; 012
	scrdef scr_seq_0955_00EA ; 013
	scrdef scr_seq_0955_00F6 ; 014
	scrdef scr_seq_0955_0129 ; 015
	scrdef scr_seq_0955_0135 ; 016
	scrdef scr_seq_0955_0141 ; 017
	scrdef scr_seq_0955_014D ; 018
	scrdef_end

scr_seq_0955_004E:
	setvar VAR_SPECIAL_x8000, 1
	goto scr_seq_0955_0159

scr_seq_0955_005A:
	setvar VAR_SPECIAL_x8000, 2
	goto scr_seq_0955_0159

scr_seq_0955_0066:
	setvar VAR_SPECIAL_x8000, 3
	goto scr_seq_0955_0159

scr_seq_0955_0072:
	setvar VAR_SPECIAL_x8000, 4
	goto scr_seq_0955_0159

scr_seq_0955_007E:
	setvar VAR_SPECIAL_x8000, 5
	goto scr_seq_0955_0159

scr_seq_0955_008A:
	setvar VAR_SPECIAL_x8000, 6
	goto scr_seq_0955_0159

scr_seq_0955_0096:
	setvar VAR_SPECIAL_x8000, 7
	goto scr_seq_0955_0159

scr_seq_0955_00A2:
	setvar VAR_SPECIAL_x8000, 8
	goto scr_seq_0955_0159

scr_seq_0955_00AE:
	setvar VAR_SPECIAL_x8000, 9
	goto scr_seq_0955_0159

scr_seq_0955_00BA:
	setvar VAR_SPECIAL_x8000, 10
	goto scr_seq_0955_0159

scr_seq_0955_00C6:
	setvar VAR_SPECIAL_x8000, 11
	goto scr_seq_0955_0159

scr_seq_0955_00D2:
	setvar VAR_SPECIAL_x8000, 12
	goto scr_seq_0955_0159

scr_seq_0955_00DE:
	setvar VAR_SPECIAL_x8000, 13
	goto scr_seq_0955_0159

scr_seq_0955_00EA:
	setvar VAR_SPECIAL_x8000, 14
	goto scr_seq_0955_0159

scr_seq_0955_00F6:
	comparevartovalue VAR_UNK_4032, 1
	gotoif eq, scr_seq_0955_0129
	comparevartovalue VAR_UNK_4032, 2
	gotoif eq, scr_seq_0955_0135
	comparevartovalue VAR_UNK_4032, 3
	gotoif eq, scr_seq_0955_0141
	setvar VAR_SPECIAL_x8000, 15
	goto scr_seq_0955_0159

scr_seq_0955_0129:
	setvar VAR_SPECIAL_x8000, 16
	goto scr_seq_0955_0159

scr_seq_0955_0135:
	setvar VAR_SPECIAL_x8000, 17
	goto scr_seq_0955_0159

scr_seq_0955_0141:
	setvar VAR_SPECIAL_x8000, 18
	goto scr_seq_0955_0159

scr_seq_0955_014D:
	setvar VAR_SPECIAL_x8000, 19
	goto scr_seq_0955_0159

scr_seq_0955_0159:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
