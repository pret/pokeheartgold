#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07R0205.h"
#include "msgdata/msg/msg_0505_T07R0205.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T07R0205_000
	scrdef_end

scr_seq_T07R0205_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_GOT_SPELL_TAG_FROM_CELADON_CITY_MAN, _0071
	npc_msg msg_0505_T07R0205_00000
	scrcmd_379 VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 3
	goto_if_eq _0045
	compare VAR_TEMP_x4000, 4
	goto_if_eq _0045
	npc_msg msg_0505_T07R0205_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0045:
	npc_msg msg_0505_T07R0205_00002
	goto_if_no_item_space ITEM_SPELL_TAG, 1, _007C
	callstd std_give_item_verbose
	setflag FLAG_GOT_SPELL_TAG_FROM_CELADON_CITY_MAN
_0071:
	npc_msg msg_0505_T07R0205_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_007C:
	callstd std_bag_is_full
	closemsg
	releaseall
	end
	.balign 4, 0
