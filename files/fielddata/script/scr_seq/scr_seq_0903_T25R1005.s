#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R1005.h"
#include "msgdata/msg/msg_0596_T25R1005.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T25R1005_000
	scrdef scr_seq_T25R1005_001
	scrdef scr_seq_T25R1005_002
	scrdef scr_seq_T25R1005_003
	scrdef scr_seq_T25R1005_004
	scrdef scr_seq_T25R1005_005
	scrdef scr_seq_T25R1005_006
	scrdef_end

scr_seq_T25R1005_005:
	setflag FLAG_HIDE_GOLDENROD_DEPT_STORE_5F_RETURN_FRUSTRATION_LADY
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 0
	goto_if_eq _0046
	compare VAR_TEMP_x4000, 0
	goto_if_ne _0044
	clearflag FLAG_HIDE_GOLDENROD_DEPT_STORE_5F_RETURN_FRUSTRATION_LADY
_0044:
	end

_0046:
	clearflag FLAG_HIDE_GOLDENROD_DEPT_STORE_5F_RETURN_FRUSTRATION_LADY
	end

scr_seq_T25R1005_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd std_mart_intro
	holdmsg
	setvar VAR_SPECIAL_x8004, 7
	callstd std_special_mart
	releaseall
	end

scr_seq_T25R1005_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_SCENE_ROCKET_TAKEOVER, 3
	goto_if_ne _0086
	npc_msg msg_0596_T25R1005_00018
	goto _0089

_0086:
	npc_msg msg_0596_T25R1005_00017
_0089:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T25R1005_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_SCENE_ROCKET_TAKEOVER, 3
	goto_if_ne _00AF
	npc_msg msg_0596_T25R1005_00016
	goto _00B2

_00AF:
	npc_msg msg_0596_T25R1005_00015
_00B2:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T25R1005_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_SYS_ROCKET_COSTUME, _017D
	goto_if_set FLAG_TRADE_GOLDENROD_CITY_DROWZEE_MACHOP, _0172
	npc_msg msg_0596_T25R1005_00009
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _00F6
	goto _0167

_00F6:
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_566
	get_party_selection VAR_SPECIAL_RESULT
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	compare VAR_SPECIAL_RESULT, 255
	goto_if_eq _0167
	load_npc_trade 1
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	get_partymon_species VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	npc_trade_get_req_species VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	goto_if_ne _015A
	npc_trade_exec VAR_SPECIAL_x8004
	npc_trade_end
	setflag FLAG_TRADE_GOLDENROD_CITY_DROWZEE_MACHOP
	npc_msg msg_0596_T25R1005_00010
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_015A:
	npc_trade_end
	npc_msg msg_0596_T25R1005_00011
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0167:
	npc_msg msg_0596_T25R1005_00012
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0172:
	npc_msg msg_0596_T25R1005_00013
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_017D:
	npc_msg msg_0596_T25R1005_00014
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T25R1005_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0596_T25R1005_00019
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T25R1005_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_08E, _0219
	get_party_lead_alive VAR_SPECIAL_x8000
	buffer_mon_species_name 0, VAR_SPECIAL_x8000
	npc_msg msg_0596_T25R1005_00000
	mon_get_friendship VAR_SPECIAL_RESULT, VAR_SPECIAL_x8000
	compare VAR_SPECIAL_RESULT, 149
	goto_if_ge _01E3
	compare VAR_SPECIAL_RESULT, 50
	goto_if_le _01FE
	npc_msg msg_0596_T25R1005_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_01E3:
	npc_msg msg_0596_T25R1005_00001
	setvar VAR_SPECIAL_x8004, 354
	setvar VAR_SPECIAL_x8005, 1
	callstd std_obtain_item_verbose
	closemsg
	goto _0219

_01FE:
	npc_msg msg_0596_T25R1005_00004
	setvar VAR_SPECIAL_x8004, 348
	setvar VAR_SPECIAL_x8005, 1
	callstd std_obtain_item_verbose
	closemsg
	goto _0219

_0219:
	npc_msg msg_0596_T25R1005_00006
	setflag FLAG_UNK_08E
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
