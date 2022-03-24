#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07R0106.h"
#include "msgdata/msg/msg_0499_T07R0106.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T07R0106_000
	scrdef scr_seq_T07R0106_001
	scrdef scr_seq_T07R0106_002
	scrdef scr_seq_T07R0106_003
	scrdef_end

scr_seq_T07R0106_000:
	simple_npc_msg msg_0499_T07R0106_00000
	end

scr_seq_T07R0106_001:
	simple_npc_msg msg_0499_T07R0106_00001
	end

scr_seq_T07R0106_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0499_T07R0106_00002
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T07R0106_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0499_T07R0106_00003
	show_money_box 20, 2
	goto _005E

_005E:
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x8000
	menu_item_add 209, 255, 0
	menu_item_add 210, 255, 1
	menu_item_add 211, 255, 2
	menu_item_add 212, 255, 3
	menu_exec
	touchscreen_menu_show
	switch VAR_SPECIAL_x8000
	case 0, _00C2
	case 1, _00CE
	case 2, _00DA
	npc_msg msg_0499_T07R0106_00007
	goto _0205

_00C2:
	setvar VAR_SPECIAL_x8001, 30
	goto _011C

_00CE:
	setvar VAR_SPECIAL_x8001, 31
	goto _011C

_00DA:
	setvar VAR_SPECIAL_x8001, 32
	goto _011C

_00E6:
	hasenoughmoneyimmediate VAR_SPECIAL_RESULT, 200
	return

_00F0:
	hasenoughmoneyimmediate VAR_SPECIAL_RESULT, 300
	return

_00FA:
	hasenoughmoneyimmediate VAR_SPECIAL_RESULT, 350
	return

_0104:
	submoneyimmediate 200
	return

_010C:
	submoneyimmediate 300
	return

_0114:
	submoneyimmediate 350
	return

_011C:
	compare VAR_SPECIAL_x8000, 0
	call_if_eq _00E6
	compare VAR_SPECIAL_x8000, 1
	call_if_eq _00F0
	compare VAR_SPECIAL_x8000, 2
	call_if_eq _00FA
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _01F0
	hasspaceforitem VAR_SPECIAL_x8001, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _01F9
	compare VAR_SPECIAL_x8000, 0
	call_if_eq _0104
	compare VAR_SPECIAL_x8000, 1
	call_if_eq _010C
	compare VAR_SPECIAL_x8000, 2
	call_if_eq _0114
	update_money_box
	buffer_item_name 0, VAR_SPECIAL_x8001
	play_se SEQ_SE_DP_JIHANKI
	buffer_item_name 0, VAR_SPECIAL_x8001
	npc_msg msg_0499_T07R0106_00004
	giveitem_no_check VAR_SPECIAL_x8001, 1
	random VAR_SPECIAL_RESULT, 64
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _01E7
	play_se SEQ_SE_DP_JIHANKI
	buffer_item_name 0, VAR_SPECIAL_x8001
	npc_msg msg_0499_T07R0106_00005
	hasspaceforitem VAR_SPECIAL_x8001, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _01F9
	callstd std_give_item_verbose
_01E7:
	npc_msg msg_0499_T07R0106_00003
	goto _005E

_01F0:
	npc_msg msg_0499_T07R0106_00006
	goto _0205

_01F9:
	callstd std_bag_is_full
	closemsg
	hide_money_box
	releaseall
	end

_0205:
	wait_button_or_walk_away
	closemsg
	hide_money_box
	releaseall
	end
	.balign 4, 0
