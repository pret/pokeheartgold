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
	goto_if_set FLAG_GOT_CLEANSE_TAG_FROM_ROUTE_5_GRANDMA, _0049
	npc_msg msg_0333_R05R0401_00000
	goto_if_no_item_space ITEM_CLEANSE_TAG, 1, _0054
	callstd std_give_item_verbose
	setflag FLAG_GOT_CLEANSE_TAG_FROM_ROUTE_5_GRANDMA
_0049:
	npc_msg msg_0333_R05R0401_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0054:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_R05R0401_001:
	simple_npc_msg msg_0333_R05R0401_00002
	end
	.balign 4, 0
