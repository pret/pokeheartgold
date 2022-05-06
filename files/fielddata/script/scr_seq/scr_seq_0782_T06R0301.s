#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T06R0301.h"
#include "msgdata/msg/msg_0488_T06R0301.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T06R0301_000
	scrdef scr_seq_T06R0301_001
	scrdef scr_seq_T06R0301_002
	scrdef scr_seq_T06R0301_003
	scrdef scr_seq_T06R0301_004
	scrdef scr_seq_T06R0301_005
	scrdef scr_seq_T06R0301_006
	scrdef scr_seq_T06R0301_007
	scrdef_end

scr_seq_T06R0301_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_unset FLAG_GOT_RARE_CANDY_FROM_FAN_CLUB_CHAIRMAN, _0044
	buffer_players_name 0
	gender_msgbox msg_0488_T06R0301_00004, msg_0488_T06R0301_00005
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0044:
	npc_msg msg_0488_T06R0301_00000
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _009E
	npc_msg msg_0488_T06R0301_00001
	goto_if_no_item_space ITEM_RARE_CANDY, 1, _0093
	callstd std_give_item_verbose
	setflag FLAG_GOT_RARE_CANDY_FROM_FAN_CLUB_CHAIRMAN
	npc_msg msg_0488_T06R0301_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0093:
	npc_msg msg_0488_T06R0301_00007
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_009E:
	npc_msg msg_0488_T06R0301_00006
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T06R0301_001:
	simple_npc_msg msg_0488_T06R0301_00008
	end

scr_seq_T06R0301_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	getitemquantity ITEM_LOST_ITEM, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0141
	getitemquantity ITEM_PASS, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0141
	goto_if_set FLAG_UNK_119, _0116
	goto_if_set FLAG_RESTORED_POWER, _010B
	npc_msg msg_0488_T06R0301_00009
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_010B:
	npc_msg msg_0488_T06R0301_00010
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0116:
	npc_msg msg_0488_T06R0301_00011
	hide_person obj_T06R0301_mono_pip
	setflag FLAG_HIDE_VERMILION_FAN_CLUB_LOST_ITEM
	giveitem_no_check ITEM_LOST_ITEM, 1
	setvar VAR_UNK_4130, 1
	clearflag FLAG_HIDE_VERMILION_CITY_STEVEN
	closemsg
	releaseall
	end

_0141:
	npc_msg msg_0488_T06R0301_00013
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T06R0301_003:
	simple_npc_msg msg_0488_T06R0301_00014
	end

scr_seq_T06R0301_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_BAYLEEF, 0
	npc_msg msg_0488_T06R0301_00016
	wait_cry
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T06R0301_007:
	goto_if_set FLAG_HIDE_VERMILION_FAN_CLUB_LOST_ITEM, _0198
	simple_npc_msg msg_0488_T06R0301_00015
	end

_0198:
	end

scr_seq_T06R0301_005:
	simple_npc_msg msg_0488_T06R0301_00017
	end

scr_seq_T06R0301_006:
	simple_npc_msg msg_0488_T06R0301_00018
	end
	.balign 4, 0
