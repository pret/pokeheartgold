#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T27R0801.h"
#include "msgdata/msg/msg_0619_T27R0801.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T27R0801_000
	scrdef scr_seq_T27R0801_001
	scrdef_end

scr_seq_T27R0801_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_GOT_DOWSING_MACHINE, _0078
	npc_msg msg_0619_T27R0801_00000
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0044
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _008D
	end

_0044:
	npc_msg msg_0619_T27R0801_00001
	wait_button
	goto_if_no_item_space ITEM_DOWSING_MCHN, 1, _0083
	callstd std_give_item_verbose
	setflag FLAG_GOT_DOWSING_MACHINE
	goto _0078

_0078:
	npc_msg msg_0619_T27R0801_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0083:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

_008D:
	npc_msg msg_0619_T27R0801_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T27R0801_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0619_T27R0801_00005
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _00C7
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _00F9
	end

_00C7:
	npc_msg msg_0619_T27R0801_00006
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _00EE
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _00F9
	end

_00EE:
	npc_msg msg_0619_T27R0801_00007
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_00F9:
	closemsg
	releaseall
	end
	.balign 4, 0
