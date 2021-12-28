#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0183_R05R0401_000A ; 000
	scrdef scr_seq_0183_R05R0401_005E ; 001
	scrdef_end

scr_seq_0183_R05R0401_000A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_131
	gotoif TRUE, scr_seq_0183_R05R0401_0049
	npc_msg 0
	setvar VAR_SPECIAL_x8004, 224
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0183_R05R0401_0054
	callstd std_give_item_verbose
	setflag FLAG_UNK_131
scr_seq_0183_R05R0401_0049:
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0183_R05R0401_0054:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_0183_R05R0401_005E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
