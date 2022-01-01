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
	checkflag FLAG_UNK_07B
	gotoif TRUE, _002C
	npc_msg msg_0570_T23R0201_00000
	waitbutton
	closemsg
	releaseall
	end

_002C:
	checkflag FLAG_UNK_080
	gotoif TRUE, _0042
	npc_msg msg_0570_T23R0201_00001
	waitbutton
	closemsg
	releaseall
	end

_0042:
	npc_msg msg_0570_T23R0201_00002
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T23R0201_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_080
	gotoif TRUE, _006B
	npc_msg msg_0570_T23R0201_00003
	waitbutton
	closemsg
	releaseall
	end

_006B:
	checkflag FLAG_UNK_081
	gotoif TRUE, _00AA
	npc_msg msg_0570_T23R0201_00004
	scrcmd_049
	goto_if_no_item_space ITEM_CHARCOAL, 1, _00B5
	callstd std_obtain_item_verbose
	setflag FLAG_UNK_081
	closemsg
	releaseall
	end

_00AA:
	npc_msg msg_0570_T23R0201_00006
	waitbutton
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
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
