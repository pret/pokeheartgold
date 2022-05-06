#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T30R0301.h"
#include "msgdata/msg/msg_0634_T30R0301.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T30R0301_000
	scrdef scr_seq_T30R0301_001
	scrdef_end

scr_seq_T30R0301_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_TRADE_BLACKTHORN_CITY_DRAGONAIR_DODRIO, _00CA
	npc_msg msg_0634_T30R0301_00000
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _003B
	goto _00BF

_003B:
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_566
	get_party_selection VAR_SPECIAL_RESULT
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	compare VAR_SPECIAL_RESULT, 255
	goto_if_eq _00BF
	load_npc_trade 3
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	get_partymon_species VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	mon_get_gender VAR_SPECIAL_x8004, VAR_SPECIAL_x8006
	compare VAR_SPECIAL_x8006, 0
	goto_if_eq _00B2
	npc_trade_get_req_species VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	goto_if_ne _00B2
	npc_trade_exec VAR_SPECIAL_x8004
	npc_trade_end
	setflag FLAG_TRADE_BLACKTHORN_CITY_DRAGONAIR_DODRIO
	npc_msg msg_0634_T30R0301_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_00B2:
	npc_trade_end
	npc_msg msg_0634_T30R0301_00002
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_00BF:
	npc_msg msg_0634_T30R0301_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_00CA:
	npc_msg msg_0634_T30R0301_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T30R0301_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_party_lead_alive VAR_SPECIAL_x8000
	mon_has_ribbon VAR_SPECIAL_RESULT, VAR_SPECIAL_x8000, RIBBON_HOENN_EFFORT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0199
	buffer_mon_species_name 0, VAR_SPECIAL_x8000
	npc_msg msg_0634_T30R0301_00005
	get_ev_total VAR_SPECIAL_RESULT, VAR_SPECIAL_x8000
	compare VAR_SPECIAL_RESULT, 510
	goto_if_lt _0136
	npc_msg msg_0634_T30R0301_00006
	give_ribbon VAR_SPECIAL_x8000, RIBBON_HOENN_EFFORT
	play_fanfare SEQ_ME_ITEM
	buffer_players_name 1
	npc_msg msg_0634_T30R0301_00007
	wait_fanfare
	buffer_mon_species_name 0, VAR_SPECIAL_x8000
	npc_msg msg_0634_T30R0301_00008
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0136:
	compare VAR_SPECIAL_RESULT, 506
	goto_if_ne _014C
	npc_msg msg_0634_T30R0301_00010
	goto _0191

_014C:
	compare VAR_SPECIAL_RESULT, 507
	goto_if_ne _0162
	npc_msg msg_0634_T30R0301_00011
	goto _0191

_0162:
	compare VAR_SPECIAL_RESULT, 508
	goto_if_ne _0178
	npc_msg msg_0634_T30R0301_00012
	goto _0191

_0178:
	compare VAR_SPECIAL_RESULT, 509
	goto_if_ne _018E
	npc_msg msg_0634_T30R0301_00013
	goto _0191

_018E:
	npc_msg msg_0634_T30R0301_00009
_0191:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0199:
	buffer_mon_species_name 0, VAR_SPECIAL_x8000
	npc_msg msg_0634_T30R0301_00014
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
