#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D37R0105.h"
#include "msgdata/msg/msg_0120_D37R0105.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D37R0105_000
	scrdef scr_seq_D37R0105_001
	scrdef_end

scr_seq_D37R0105_000:
	setflag FLAG_UNK_1B7
	setflag FLAG_UNK_1B8
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, _0027
	clearflag FLAG_UNK_1B7
	clearflag FLAG_UNK_1B8
_0027:
	end

scr_seq_D37R0105_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	getitemquantity 475, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _005B
	npc_msg msg_0120_D37R0105_00000
	setflag FLAG_UNK_1C1
	setvar VAR_SPECIAL_x8004, 475
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
_005B:
	npc_msg msg_0120_D37R0105_00002
	npc_msg msg_0120_D37R0105_00003
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
