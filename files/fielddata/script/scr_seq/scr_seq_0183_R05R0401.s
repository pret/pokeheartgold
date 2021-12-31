#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R05R0401.h"
#include "msgdata/msg/msg_0333_R05R0401.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R05R0401_000
	scrdef scr_seq_R05R0401_001
	scrdef_end

scr_seq_R05R0401_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_131
	gotoif TRUE, _0049
	npc_msg msg_0333_R05R0401_00000
	goto_if_no_item_space ITEM_CLEANSE_TAG, 1, _0054
	callstd std_give_item_verbose
	setflag FLAG_UNK_131
_0049:
	npc_msg msg_0333_R05R0401_00001
	waitbutton
	closemsg
	releaseall
	end

_0054:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_R05R0401_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0333_R05R0401_00002
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
