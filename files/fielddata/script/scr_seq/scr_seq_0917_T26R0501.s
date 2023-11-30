#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T26R0501.h"
#include "msgdata/msg/msg_0609_T26R0501.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T26R0501_000
	scrdef scr_seq_T26R0501_001
	scrdef scr_seq_T26R0501_002
	scrdef_end

scr_seq_T26R0501_000:
	simple_npc_msg msg_0609_T26R0501_00000
	end

scr_seq_T26R0501_001:
	simple_npc_msg msg_0609_T26R0501_00001
	end

scr_seq_T26R0501_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_unset FLAG_UNK_AB9, _0050
	npc_msg msg_0609_T26R0501_00004
	goto _00E3

_0050:
	npc_msg msg_0609_T26R0501_00002
	hasitem ITEM_SEAL_CASE, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0071
	npc_msg msg_0609_T26R0501_00005
	goto _00E3

_0071:
	give_random_seal VAR_SPECIAL_x8000, VAR_SPECIAL_x8001, VAR_SPECIAL_x8002
	compare VAR_SPECIAL_x8000, 0
	goto_if_ne _008F
	npc_msg msg_0609_T26R0501_00003
	goto _00E3

_008F:
	setflag FLAG_UNK_AB9
	buffer_seal_name 0, VAR_SPECIAL_x8000
	npc_msg msg_0609_T26R0501_00006
	play_fanfare SEQ_ME_ITEM
	npc_msg msg_0609_T26R0501_00011
	wait_fanfare
	compare VAR_SPECIAL_x8001, 0
	goto_if_eq _00EB
	buffer_seal_name 0, VAR_SPECIAL_x8001
	npc_msg msg_0609_T26R0501_00007
	play_fanfare SEQ_ME_ITEM
	npc_msg msg_0609_T26R0501_00011
	wait_fanfare
	compare VAR_SPECIAL_x8002, 0
	goto_if_eq _00EB
	buffer_seal_name 0, VAR_SPECIAL_x8002
	npc_msg msg_0609_T26R0501_00008
	play_fanfare SEQ_ME_ITEM
	npc_msg msg_0609_T26R0501_00011
	wait_fanfare
	npc_msg msg_0609_T26R0501_00009
_00E3:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_00EB:
	npc_msg msg_0609_T26R0501_00010
	goto _00E3
	end

	.balign 4, 0
