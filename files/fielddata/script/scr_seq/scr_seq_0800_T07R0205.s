#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0800_T07R0205_0006 ; 000
	scrdef_end

scr_seq_0800_T07R0205_0006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_158
	gotoif TRUE, scr_seq_0800_T07R0205_0071
	npc_msg 0
	scrcmd_379 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, scr_seq_0800_T07R0205_0045
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, scr_seq_0800_T07R0205_0045
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0800_T07R0205_0045:
	npc_msg 2
	setvar VAR_SPECIAL_x8004, 247
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0800_T07R0205_007C
	callstd std_give_item_verbose
	setflag FLAG_UNK_158
scr_seq_0800_T07R0205_0071:
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0800_T07R0205_007C:
	callstd 2009
	closemsg
	releaseall
	end
	.balign 4, 0
