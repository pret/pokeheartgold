#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D26R0103.h"
#include "msgdata/msg/msg_0092_D26R0103.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D26R0103_000
	scrdef_end

scr_seq_D26R0103_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_GOT_KINGS_ROCK_FROM_SLOWPOKE_WELL_MAN, _004F
	npc_msg msg_0092_D26R0103_00000
	wait_button
	closemsg
	goto_if_no_item_space ITEM_KINGS_ROCK, 1, _005A
	callstd std_give_item_verbose
	setflag FLAG_GOT_KINGS_ROCK_FROM_SLOWPOKE_WELL_MAN
	goto _004F

_004F:
	npc_msg msg_0092_D26R0103_00002
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_005A:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

_0064:
	end

	.balign 4, 0
