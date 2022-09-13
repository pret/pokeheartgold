#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R32PC0101.h"
#include "msgdata/msg/msg_0381_R32PC0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R32PC0101_000
	scrdef scr_seq_R32PC0101_001
	scrdef scr_seq_R32PC0101_002
	scrdef scr_seq_R32PC0101_003
	scrdef_end

scr_seq_R32PC0101_000:
	setvar VAR_SPECIAL_x8007, 3
	callstd std_nurse_joy
	end

scr_seq_R32PC0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_GOT_OLD_ROD, _008C
	npc_msg msg_0381_R32PC0101_00000
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0058
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _00A1
	end

_0058:
	goto_if_no_item_space ITEM_OLD_ROD, 1, _0097
	callstd std_give_item_verbose
	setflag FLAG_GOT_OLD_ROD
	npc_msg msg_0381_R32PC0101_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_008C:
	npc_msg msg_0381_R32PC0101_00005
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0097:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

_00A1:
	npc_msg msg_0381_R32PC0101_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_R32PC0101_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_GOT_LURE_BALL_FROM_ROUTE_32_KURT_FAN, _0121
	npc_msg msg_0381_R32PC0101_00007
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _00E0
	npc_msg msg_0381_R32PC0101_00008
	goto _00E3

_00E0:
	npc_msg msg_0381_R32PC0101_00009
_00E3:
	goto_if_no_item_space ITEM_LURE_BALL, 2, _0117
	callstd std_give_item_verbose
	npc_msg msg_0381_R32PC0101_00010
	wait_button_or_walk_away
	closemsg
	releaseall
	setflag FLAG_GOT_LURE_BALL_FROM_ROUTE_32_KURT_FAN
	end

_0117:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

_0121:
	npc_msg msg_0381_R32PC0101_00011
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_R32PC0101_003:
	simple_npc_msg msg_0381_R32PC0101_00006
	end
	.balign 4, 0
