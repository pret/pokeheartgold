#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0108_D42R0101_0006 ; 000
	scrdef_end

scr_seq_0108_D42R0101_0006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0DF
	gotoif TRUE, scr_seq_0108_D42R0101_0045
	npc_msg 0
	setvar VAR_SPECIAL_x8004, 240
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0108_D42R0101_0050
	callstd std_give_item_verbose
	setflag FLAG_UNK_0DF
scr_seq_0108_D42R0101_0045:
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0108_D42R0101_0050:
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
