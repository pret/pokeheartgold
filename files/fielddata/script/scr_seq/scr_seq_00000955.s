#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000955_0000004E ; 000
	scrdef scr_seq_00000955_0000005A ; 001
	scrdef scr_seq_00000955_00000066 ; 002
	scrdef scr_seq_00000955_00000072 ; 003
	scrdef scr_seq_00000955_0000007E ; 004
	scrdef scr_seq_00000955_0000008A ; 005
	scrdef scr_seq_00000955_00000096 ; 006
	scrdef scr_seq_00000955_000000A2 ; 007
	scrdef scr_seq_00000955_000000AE ; 008
	scrdef scr_seq_00000955_000000BA ; 009
	scrdef scr_seq_00000955_000000C6 ; 010
	scrdef scr_seq_00000955_000000D2 ; 011
	scrdef scr_seq_00000955_000000DE ; 012
	scrdef scr_seq_00000955_000000EA ; 013
	scrdef scr_seq_00000955_000000F6 ; 014
	scrdef scr_seq_00000955_00000129 ; 015
	scrdef scr_seq_00000955_00000135 ; 016
	scrdef scr_seq_00000955_00000141 ; 017
	scrdef scr_seq_00000955_0000014D ; 018
	scrdef_end

scr_seq_00000955_0000004E:
	setvar VAR_SPECIAL_x8000, 1
	goto scr_seq_00000955_00000159

scr_seq_00000955_0000005A:
	setvar VAR_SPECIAL_x8000, 2
	goto scr_seq_00000955_00000159

scr_seq_00000955_00000066:
	setvar VAR_SPECIAL_x8000, 3
	goto scr_seq_00000955_00000159

scr_seq_00000955_00000072:
	setvar VAR_SPECIAL_x8000, 4
	goto scr_seq_00000955_00000159

scr_seq_00000955_0000007E:
	setvar VAR_SPECIAL_x8000, 5
	goto scr_seq_00000955_00000159

scr_seq_00000955_0000008A:
	setvar VAR_SPECIAL_x8000, 6
	goto scr_seq_00000955_00000159

scr_seq_00000955_00000096:
	setvar VAR_SPECIAL_x8000, 7
	goto scr_seq_00000955_00000159

scr_seq_00000955_000000A2:
	setvar VAR_SPECIAL_x8000, 8
	goto scr_seq_00000955_00000159

scr_seq_00000955_000000AE:
	setvar VAR_SPECIAL_x8000, 9
	goto scr_seq_00000955_00000159

scr_seq_00000955_000000BA:
	setvar VAR_SPECIAL_x8000, 10
	goto scr_seq_00000955_00000159

scr_seq_00000955_000000C6:
	setvar VAR_SPECIAL_x8000, 11
	goto scr_seq_00000955_00000159

scr_seq_00000955_000000D2:
	setvar VAR_SPECIAL_x8000, 12
	goto scr_seq_00000955_00000159

scr_seq_00000955_000000DE:
	setvar VAR_SPECIAL_x8000, 13
	goto scr_seq_00000955_00000159

scr_seq_00000955_000000EA:
	setvar VAR_SPECIAL_x8000, 14
	goto scr_seq_00000955_00000159

scr_seq_00000955_000000F6:
	comparevartovalue VAR_UNK_4032, 1
	gotoif eq, scr_seq_00000955_00000129
	comparevartovalue VAR_UNK_4032, 2
	gotoif eq, scr_seq_00000955_00000135
	comparevartovalue VAR_UNK_4032, 3
	gotoif eq, scr_seq_00000955_00000141
	setvar VAR_SPECIAL_x8000, 15
	goto scr_seq_00000955_00000159

scr_seq_00000955_00000129:
	setvar VAR_SPECIAL_x8000, 16
	goto scr_seq_00000955_00000159

scr_seq_00000955_00000135:
	setvar VAR_SPECIAL_x8000, 17
	goto scr_seq_00000955_00000159

scr_seq_00000955_00000141:
	setvar VAR_SPECIAL_x8000, 18
	goto scr_seq_00000955_00000159

scr_seq_00000955_0000014D:
	setvar VAR_SPECIAL_x8000, 19
	goto scr_seq_00000955_00000159

scr_seq_00000955_00000159:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
