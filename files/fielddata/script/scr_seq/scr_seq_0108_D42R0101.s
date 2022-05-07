#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D42R0101.h"
#include "msgdata/msg/msg_0127_D42R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D42R0101_000
	scrdef_end

scr_seq_D42R0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_GOT_BLACKGLASSES_FROM_DARK_CAVE_MAN, _0045
	npc_msg msg_0127_D42R0101_00000
	goto_if_no_item_space ITEM_BLACKGLASSES, 1, _0050
	callstd std_give_item_verbose
	setflag FLAG_GOT_BLACKGLASSES_FROM_DARK_CAVE_MAN
_0045:
	npc_msg msg_0127_D42R0101_00002
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0050:
	npc_msg msg_0127_D42R0101_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
