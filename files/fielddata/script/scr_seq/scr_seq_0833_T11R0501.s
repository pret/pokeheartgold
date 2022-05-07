#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T11R0501.h"
#include "msgdata/msg/msg_0534_T11R0501.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T11R0501_000
	scrdef_end

scr_seq_T11R0501_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_GOT_TM29_FROM_MR_PSYCHIC, _0045
	npc_msg msg_0534_T11R0501_00000
	goto_if_no_item_space ITEM_TM29, 1, _0050
	callstd std_give_item_verbose
	setflag FLAG_GOT_TM29_FROM_MR_PSYCHIC
_0045:
	npc_msg msg_0534_T11R0501_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0050:
	callstd std_bag_is_full
	closemsg
	releaseall
	end
	.balign 4, 0
