#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0200_R12R0101_0006 ; 000
	scrdef_end

scr_seq_0200_R12R0101_0006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	getitemquantity 447, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0200_R12R0101_004C
	npc_msg 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0200_R12R0101_0057
	npc_msg 1
	setvar VAR_SPECIAL_x8004, 447
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
scr_seq_0200_R12R0101_004C:
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0200_R12R0101_0057:
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
