#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R27R0101.h"
#include "msgdata/msg/msg_0370_R27R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R27R0101_000
	scrdef_end

scr_seq_R27R0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_0E9, _006A
	npc_msg msg_0370_R27R0101_00000
	get_party_lead_alive VAR_TEMP_x4000
	mon_get_friendship VAR_SPECIAL_RESULT, VAR_TEMP_x4000
	compare VAR_SPECIAL_RESULT, 150
	goto_if_ge _003E
	npc_msg msg_0370_R27R0101_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_003E:
	npc_msg msg_0370_R27R0101_00001
	goto_if_no_item_space ITEM_TM37, 1, _0075
	callstd std_give_item_verbose
	setflag FLAG_UNK_0E9
_006A:
	npc_msg msg_0370_R27R0101_00002
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0075:
	callstd std_bag_is_full
	closemsg
	releaseall
	end
	.balign 4, 0
