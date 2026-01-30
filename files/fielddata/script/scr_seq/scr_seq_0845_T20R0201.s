#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T20R0201.h"
#include "msgdata/msg/msg_0545_T20R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T20R0201_000
	scrdef scr_seq_T20R0201_001
	scrdef scr_seq_T20R0201_002
	scrdef scr_seq_T20R0201_003
	scrdef scr_seq_T20R0201_004
	scrdef scr_seq_T20R0201_005
	scrdef scr_seq_T20R0201_006
	scrdef_end

scr_seq_T20R0201_000:
	scrcmd_609
	lockall
	apply_movement obj_player, _00A4
	apply_movement obj_T20R0201_gsmama, _00B0
	wait_movement
	callstd std_play_mom_music
	wait 30, VAR_SPECIAL_RESULT
	apply_movement obj_T20R0201_gsmama, _00B8
	wait_movement
	buffer_players_name 0
	gender_msgbox msg_0545_T20R0201_00000, msg_0545_T20R0201_00001
	setflag FLAG_GOT_BAG
	play_fanfare SEQ_SE_PL_KIRAKIRA
	wait_fanfare
	npc_msg msg_0545_T20R0201_00002
	setflag FLAG_GOT_TRAINER_CARD
	play_fanfare SEQ_SE_PL_KIRAKIRA
	wait_fanfare
	npc_msg msg_0545_T20R0201_00003
	setflag FLAG_GOT_SAVE_BUTTON
	play_fanfare SEQ_SE_PL_KIRAKIRA
	wait_fanfare
	npc_msg msg_0545_T20R0201_00004
	setflag FLAG_GOT_OPTIONS_BUTTON
	play_fanfare SEQ_SE_PL_KIRAKIRA
	wait_fanfare
	npc_msg msg_0545_T20R0201_00005
	closemsg
	wait 15, VAR_SPECIAL_RESULT
	apply_movement obj_T20R0201_gsmama, _00C8
	wait_movement
	callstd std_fade_end_mom_music
	setvar VAR_SCENE_PLAYERS_HOUSE_1F, 1
	releaseall
	end

	.balign 4, 0
_00A4:
	Delay4
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_00B0:
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_00B8:
	WalkNormalNorth 2
	WalkNormalWest 3
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_00C8:
	WalkOnSpotNormalSouth
	WalkNormalSouth 3
	WalkNormalEast 3
	WalkOnSpotNormalNorth
	EndMovement

scr_seq_T20R0201_006:
	scrcmd_609
	lockall
	apply_movement obj_player, _00A4
	apply_movement obj_T20R0201_gsmama, _00B0
	wait_movement
	callstd std_play_mom_music
	wait 30, VAR_SPECIAL_RESULT
	apply_movement obj_T20R0201_gsmama, _00B8
	wait_movement
	buffer_players_name 0
	npc_msg msg_0545_T20R0201_00033
	closemsg
	apply_movement obj_T20R0201_gsmama, _00C8
	wait_movement
	callstd std_fade_end_mom_music
	setvar VAR_SCENE_PLAYERS_HOUSE_1F, 4
	releaseall
	end

scr_seq_T20R0201_001:
	goto_if_set FLAG_GAME_CLEAR, _015C
	compare VAR_SCENE_ELMS_LAB, 4
	goto_if_ge _0205
	goto_if_set FLAG_GOT_STARTER, _0179
	simple_npc_msg msg_0545_T20R0201_00006
	end

_015C:
	hasitem ITEM_S_S__TICKET, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _01F2
	goto _0205
	end

_0179:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_GOT_POKEGEAR, _01D4
	buffer_players_name 0
	npc_msg msg_0545_T20R0201_00007
	buffer_players_name 0
	npc_msg msg_0545_T20R0201_00008
	setflag FLAG_GOT_POKEGEAR
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	npc_msg msg_0545_T20R0201_00009
	npc_msg msg_0545_T20R0201_00010
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _01C6
	npc_msg msg_0545_T20R0201_00011
	goto _01C9

_01C6:
	npc_msg msg_0545_T20R0201_00012
_01C9:
	npc_msg msg_0545_T20R0201_00013
	wait_button_or_dpad
	closemsg
	releaseall
	end

_01D4:
	npc_msg msg_0545_T20R0201_00014
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_01DF:
	simple_npc_msg msg_0545_T20R0201_00007
	end

_01F2:
	simple_npc_msg msg_0545_T20R0201_00034
	end

_0205:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_TALKED_TO_MOM_AFTER_NAMING_RIVAL, _0275
	check_badge BADGE_ZEPHYR, VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 0
	goto_if_ne _0234
	npc_msg msg_0545_T20R0201_00015
	goto _023A

_0234:
	buffer_players_name 0
	npc_msg msg_0545_T20R0201_00016
_023A:
	setflag FLAG_TALKED_TO_MOM_AFTER_NAMING_RIVAL
	setvar VAR_SCENE_ROUTE_30_PHONE_CALL, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0266
	npc_msg msg_0545_T20R0201_00017
	setflag FLAG_SYS_MOMS_SAVINGS
	goto _026D

_0266:
	npc_msg msg_0545_T20R0201_00018
	clearflag FLAG_SYS_MOMS_SAVINGS
_026D:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0275:
	npc_msg msg_0545_T20R0201_00020
	scrcmd_795 1, 1
	touchscreen_menu_hide
	menu_init 1, 1, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add 29, 255, 0
	menu_item_add 30, 255, 1
	menu_item_add 31, 255, 2
	menu_item_add 32, 255, 3
	menu_exec
	switch VAR_SPECIAL_RESULT
	case 0, _02DF
	case 1, _0335
	case 2, _0398
	goto _03D1
	end

_02DF:
	bank_or_wallet_is_full 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _043A
	check_bank_balance VAR_SPECIAL_RESULT, 1
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _041C
	bank_transaction 1, VAR_SPECIAL_RESULT
	scrcmd_796
	touchscreen_menu_show
	switch VAR_SPECIAL_RESULT
	case 0, _03E0
	case 1, _0411
	releaseall
	end

_0335:
	bank_or_wallet_is_full 0, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _042B
	hasenoughmoneyvar VAR_SPECIAL_RESULT, 1
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0389
	bank_transaction 0, VAR_SPECIAL_RESULT
	scrcmd_796
	touchscreen_menu_show
	switch VAR_SPECIAL_RESULT
	case 0, _03FA
	case 1, _0411
	releaseall
	end

_0389:
	touchscreen_menu_show
	scrcmd_796
	npc_msg msg_0545_T20R0201_00026
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0398:
	npc_msg msg_0545_T20R0201_00025
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	scrcmd_796
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _03C2
	buffer_players_name 0
	npc_msg msg_0545_T20R0201_00017
	setflag FLAG_SYS_MOMS_SAVINGS
	goto _03C9

_03C2:
	npc_msg msg_0545_T20R0201_00018
	clearflag FLAG_SYS_MOMS_SAVINGS
_03C9:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_03D1:
	scrcmd_796
	touchscreen_menu_show
	npc_msg msg_0545_T20R0201_00021
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_03E0:
	closemsg
	wait 8, VAR_SPECIAL_RESULT
	play_se SEQ_SE_GS_OKOZUKAI
	buffer_players_name 0
	npc_msg msg_0545_T20R0201_00024
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_03FA:
	closemsg
	wait 8, VAR_SPECIAL_RESULT
	play_se SEQ_SE_GS_OKOZUKAI
	npc_msg msg_0545_T20R0201_00023
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0411:
	npc_msg msg_0545_T20R0201_00021
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_041C:
	touchscreen_menu_show
	scrcmd_796
	npc_msg msg_0545_T20R0201_00022
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_042B:
	touchscreen_menu_show
	scrcmd_796
	npc_msg msg_0545_T20R0201_00027
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_043A:
	touchscreen_menu_show
	scrcmd_796
	npc_msg msg_0545_T20R0201_00028
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T20R0201_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0545_T20R0201_00035
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T20R0201_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0545_T20R0201_00036
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T20R0201_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0545_T20R0201_00037
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T20R0201_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0545_T20R0201_00038
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
