#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R02R0301.h"
#include "msgdata/msg/msg_0323_R02R0301.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R02R0301_000
	scrdef scr_seq_R02R0301_001
	scrdef_end

scr_seq_R02R0301_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_GOT_SACRED_ASH_FROM_ROUTE_2_LAB_AIDE, _004D
	buffer_players_name 0
	gender_msgbox msg_0323_R02R0301_00000, msg_0323_R02R0301_00001
	goto_if_no_item_space ITEM_SACRED_ASH, 1, _0058
	callstd std_give_item_verbose
	setflag FLAG_GOT_SACRED_ASH_FROM_ROUTE_2_LAB_AIDE
_004D:
	npc_msg msg_0323_R02R0301_00002
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0058:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_R02R0301_001:
	simple_npc_msg msg_0323_R02R0301_00003
	end
	.balign 4, 0
