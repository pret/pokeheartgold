#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R39R0101.h"
#include "msgdata/msg/msg_0397_R39R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R39R0101_000
	scrdef scr_seq_R39R0101_001
	scrdef_end

scr_seq_R39R0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_0AA, _002C
	setflag FLAG_UNK_0A8
	npc_msg msg_0397_R39R0101_00000
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_002C:
	setvar VAR_SPECIAL_x8004, 33
	setvar VAR_SPECIAL_x8005, 0
	hasitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 999
	goto_if_ne _0058
	npc_msg msg_0397_R39R0101_00006
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0058:
	show_money_box 20, 2
	npc_msg msg_0397_R39R0101_00001
	touchscreen_menu_hide
	menu_init 1, 1, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add 12, 255, 1
	menu_item_add 13, 255, 2
	menu_item_add 14, 255, 3
	menu_exec
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 3
	goto_if_eq _0111
	compare VAR_SPECIAL_RESULT, 1
	call_if_eq _011E
	compare VAR_SPECIAL_RESULT, 2
	call_if_eq _012C
	hasenoughmoneyvar VAR_SPECIAL_RESULT, VAR_TEMP_x4001
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _00F7
	goto_if_no_item_space ITEM_MOOMOO_MILK, VAR_TEMP_x4000, _0104
	submoneyvar VAR_TEMP_x4001
	update_money_box
	npc_msg msg_0397_R39R0101_00002
	callstd std_give_item_verbose
	closemsg
	hide_money_box
	releaseall
	end

_00F7:
	npc_msg msg_0397_R39R0101_00003
	wait_button_or_walk_away
	closemsg
	hide_money_box
	releaseall
	end

_0104:
	npc_msg msg_0397_R39R0101_00004
	wait_button_or_walk_away
	closemsg
	hide_money_box
	releaseall
	end

_0111:
	npc_msg msg_0397_R39R0101_00005
	wait_button_or_walk_away
	closemsg
	hide_money_box
	releaseall
	end

_011E:
	setvar VAR_TEMP_x4000, 1
	setvar VAR_TEMP_x4001, 500
	return

_012C:
	setvar VAR_TEMP_x4000, 12
	setvar VAR_TEMP_x4001, 6000
	return

scr_seq_R39R0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_0AA, _0158
	npc_msg msg_0397_R39R0101_00007
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0158:
	goto_if_set FLAG_GOT_TM83_FROM_MOOMOO_FARM_WOMAN, _0197
	npc_msg msg_0397_R39R0101_00008
	wait_button
	goto_if_no_item_space ITEM_TM83, 1, _01A2
	callstd std_give_item_verbose
	setflag FLAG_GOT_TM83_FROM_MOOMOO_FARM_WOMAN
	goto _0197

_0197:
	npc_msg msg_0397_R39R0101_00010
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_01A2:
	npc_msg msg_0397_R39R0101_00011
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
