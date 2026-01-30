#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T29R0101.h"
#include "msgdata/msg/msg_0627_T29R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T29R0101_000
	scrdef_end

scr_seq_T29R0101_000:
	goto_if_set FLAG_GOT_TM10_FROM_LAKE_OF_RAGE_MAN, _005A
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0627_T29R0101_00000
	goto_if_no_item_space ITEM_TM10, 1, _006B
	callstd std_give_item_verbose
	setflag FLAG_GOT_TM10_FROM_LAKE_OF_RAGE_MAN
	npc_msg msg_0627_T29R0101_00002
	wait_button_or_walk_away
	closemsg
	apply_movement obj_T29R0101_gsbigman, _0078
	wait_movement
	releaseall
	end

_005A:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0627_T29R0101_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_006B:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

	.balign 4, 0
_0078:
	FaceEast
	EndMovement
	.balign 4, 0
