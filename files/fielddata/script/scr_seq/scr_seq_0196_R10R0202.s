#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R10R0202.h"
#include "msgdata/msg/msg_0345_R10R0202.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R10R0202_000
	scrdef scr_seq_R10R0202_001
	scrdef scr_seq_R10R0202_002
	scrdef scr_seq_R10R0202_003
	scrdef scr_seq_R10R0202_004
	scrdef scr_seq_R10R0202_005
	scrdef scr_seq_R10R0202_006
	scrdef scr_seq_R10R0202_007
	scrdef scr_seq_R10R0202_008
	scrdef scr_seq_R10R0202_009
	scrdef_end

scr_seq_R10R0202_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	hasitem ITEM_MACHINE_PART, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ge _0071
	goto_if_set FLAG_GOT_POWER_PLANT_MANAGERS_STORY, _005C
	setflag FLAG_GOT_POWER_PLANT_MANAGERS_STORY
	setvar VAR_SCENE_ROUTE_10_POWER_PLANT, 1
_005C:
	npc_msg msg_0345_R10R0202_00013
	wait_button_or_walk_away
	closemsg
	apply_movement obj_R10R0202_policeman, _0100
	wait_movement
	releaseall
	end

_0071:
	npc_msg msg_0345_R10R0202_00014
	closemsg
	takeitem ITEM_MACHINE_PART, 1, VAR_SPECIAL_RESULT
	apply_movement obj_R10R0202_gsbigman, _0108
	wait_movement
	wait_se SEQ_SE_GS_W012
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_ROUTE_10_POWER_PLANT_REPAIRED, 0, 13, 7, DIR_SOUTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	npc_msg msg_0345_R10R0202_00015
	apply_movement obj_R10R0202_gsbigman, _0120
	wait_movement
	setflag FLAG_RESTORED_POWER
	npc_msg msg_0345_R10R0202_00016
	giveitem_no_check ITEM_TM57, 1
	npc_msg msg_0345_R10R0202_00017
	wait_button_or_walk_away
	closemsg
	setflag FLAG_UNK_258
	clearflag FLAG_HIDE_LAVENDER_RADIO_TOWER_DIRECTOR
	setflag FLAG_HIDE_SAFFRON_CITY_COPYCAT_HOUSE_CLEFAIRY_DOLL
	clearflag FLAG_HIDE_VERMILION_FAN_CLUB_LOST_ITEM
	setvar VAR_UNK_40FF, 1
	releaseall
	end

_00F5:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

	.balign 4, 0
_0100:
	FaceSouth
	EndMovement

	.balign 4, 0
_0108:
	WalkOnSpotNormalWest
	Delay2
	WalkOnSpotNormalWest
	Delay2
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0120:
	FaceNorth
	EndMovement

scr_seq_R10R0202_007:
	scrcmd_609
	lockall
	play_se SEQ_SE_GS_PHONE0
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 56
	apply_movement obj_R10R0202_policeman, _0198
	apply_movement obj_player, _01B4
	apply_movement obj_R10R0202_gsassistantm, _01CC
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	npc_msg msg_0345_R10R0202_00001
	closemsg
	apply_movement obj_R10R0202_policeman, _01D8
	apply_movement obj_player, _01FC
	wait_movement
	npc_msg msg_0345_R10R0202_00002
	closemsg
	apply_movement obj_R10R0202_policeman, _01E8
	wait_movement
	clearflag FLAG_HIDE_CERULEAN_GYM_ROCKET
	setvar VAR_SCENE_ROUTE_10_POWER_PLANT, 0
	setvar VAR_UNK_411C, 1
	releaseall
	end

	.balign 4, 0
_0198:
	EmoteExclamationMark
	WalkNormalSouth
	WalkNormalEast 2
	WalkNormalNorth 3
	WalkNormalEast 5
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_01B4:
	Delay32 2
	WalkNormalNorth
	FaceSouth
	Delay16
	FaceEast
	EndMovement

	.balign 4, 0
_01CC:
	Delay32 4
	FaceSouth
	EndMovement

	.balign 4, 0
_01D8:
	WalkNormalSouth 2
	WalkNormalWest 5
	FaceNorth
	EndMovement

	.balign 4, 0
_01E8:
	WalkNormalSouth 3
	WalkNormalWest 2
	WalkNormalNorth
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01FC:
	Delay8 7
	FaceSouth
	EndMovement

scr_seq_R10R0202_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_GOT_POWER_PLANT_MANAGERS_STORY, _0226
	npc_msg msg_0345_R10R0202_00000
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0226:
	npc_msg msg_0345_R10R0202_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_R10R0202_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_TRADE_POWER_PLANT_DUGTRIO_MAGNETON, _02D8
	npc_msg msg_0345_R10R0202_00008
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _02CD
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_566
	get_party_selection VAR_SPECIAL_RESULT
	restore_overworld
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	compare VAR_SPECIAL_RESULT, 255
	goto_if_eq _02CD
	load_npc_trade 8
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	get_partymon_species VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	npc_trade_get_req_species VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	goto_if_ne _02C0
	npc_trade_exec VAR_SPECIAL_x8004
	npc_trade_end
	setflag FLAG_TRADE_POWER_PLANT_DUGTRIO_MAGNETON
	npc_msg msg_0345_R10R0202_00009
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_02C0:
	npc_trade_end
	npc_msg msg_0345_R10R0202_00010
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_02CD:
	npc_msg msg_0345_R10R0202_00011
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_02D8:
	npc_msg msg_0345_R10R0202_00012
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_R10R0202_003:
	simple_npc_msg msg_0345_R10R0202_00006
	end

scr_seq_R10R0202_001:
	simple_npc_msg msg_0345_R10R0202_00004
	end

scr_seq_R10R0202_002:
	simple_npc_msg msg_0345_R10R0202_00005
	end

scr_seq_R10R0202_004:
	simple_npc_msg msg_0345_R10R0202_00007
	end

scr_seq_R10R0202_008:
	simple_npc_msg msg_0345_R10R0202_00018
	end

scr_seq_R10R0202_009:
	simple_npc_msg msg_0345_R10R0202_00019
	end
	.balign 4, 0
