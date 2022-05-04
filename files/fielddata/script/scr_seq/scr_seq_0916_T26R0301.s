#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T26R0301.h"
#include "msgdata/msg/msg_0608_T26R0301.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T26R0301_000
	scrdef_end

scr_seq_T26R0301_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_TRADE_OLIVINE_CITY_KRABBY_VOLTORB, _00B3
	npc_msg msg_0608_T26R0301_00000
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0037
	goto _00A8

_0037:
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_566
	get_party_selection VAR_SPECIAL_RESULT
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	compare VAR_SPECIAL_RESULT, 255
	goto_if_eq _00A8
	load_npc_trade 2
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	get_partymon_species VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	npc_trade_get_req_species VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	goto_if_ne _009B
	npc_trade_exec VAR_SPECIAL_x8004
	npc_trade_end
	setflag FLAG_TRADE_OLIVINE_CITY_KRABBY_VOLTORB
	npc_msg msg_0608_T26R0301_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_009B:
	npc_trade_end
	npc_msg msg_0608_T26R0301_00002
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_00A8:
	npc_msg msg_0608_T26R0301_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_00B3:
	npc_msg msg_0608_T26R0301_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
