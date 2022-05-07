#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R34R0201.h"
#include "msgdata/msg/msg_0386_R34R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R34R0201_000
	scrdef scr_seq_R34R0201_001
	scrdef scr_seq_R34R0201_002
	scrdef_end

scr_seq_R34R0201_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_GOT_TM12_FROM_ILEX_FOREST_GATE_WOMAN, _0055
	npc_msg msg_0386_R34R0201_00000
	wait_button
	goto_if_no_item_space ITEM_TM12, 1, _0060
	callstd std_give_item_verbose
	setflag FLAG_GOT_TM12_FROM_ILEX_FOREST_GATE_WOMAN
	goto _0055

_0055:
	npc_msg msg_0386_R34R0201_00002
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0060:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_R34R0201_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_BUTTERFREE, 0
	npc_msg msg_0386_R34R0201_00003
	wait_cry
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_R34R0201_002:
	simple_npc_msg msg_0386_R34R0201_00004
	end
	.balign 4, 0
