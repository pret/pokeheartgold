#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T23R0201.h"
#include "msgdata/msg/msg_0570_T23R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T23R0201_000
	scrdef scr_seq_T23R0201_001
	scrdef scr_seq_T23R0201_002
	scrdef_end

scr_seq_T23R0201_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_BEAT_AZALEA_ROCKETS, _002C
	npc_msg msg_0570_T23R0201_00000
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_002C:
	goto_if_set FLAG_GOT_HM01, _0042
	npc_msg msg_0570_T23R0201_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0042:
	npc_msg msg_0570_T23R0201_00002
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T23R0201_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_GOT_HM01, _006B
	npc_msg msg_0570_T23R0201_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_006B:
	goto_if_set FLAG_GOT_CHARCOAL_FROM_AZALEA_TOWN_MAN, _00AA
	npc_msg msg_0570_T23R0201_00004
	wait_button
	goto_if_no_item_space ITEM_CHARCOAL, 1, _00B5
	callstd std_obtain_item_verbose
	setflag FLAG_GOT_CHARCOAL_FROM_AZALEA_TOWN_MAN
	closemsg
	releaseall
	end

_00AA:
	npc_msg msg_0570_T23R0201_00006
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_00B5:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_T23R0201_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_FARFETCHD, 0
	npc_msg msg_0570_T23R0201_00008
	wait_cry
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
