#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0222_R27R0101_0006 ; 000
	scrdef_end

scr_seq_0222_R27R0101_0006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0E9
	gotoif TRUE, scr_seq_0222_R27R0101_006A
	npc_msg 0
	get_lead_mon_index VAR_TEMP_x4000
	scrcmd_382 VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 150
	gotoif ge, scr_seq_0222_R27R0101_003E
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0222_R27R0101_003E:
	npc_msg 1
	setvar VAR_SPECIAL_x8004, 364
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0222_R27R0101_0075
	callstd std_give_item_verbose
	setflag FLAG_UNK_0E9
scr_seq_0222_R27R0101_006A:
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0222_R27R0101_0075:
	callstd 2009
	closemsg
	releaseall
	end
	.balign 4, 0
