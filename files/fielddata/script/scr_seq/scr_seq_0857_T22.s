#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T22.h"
#include "msgdata/msg/msg_0556_T22.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T22_000
	scrdef scr_seq_T22_001
	scrdef scr_seq_T22_002
	scrdef scr_seq_T22_003
	scrdef scr_seq_T22_004
	scrdef scr_seq_T22_005
	scrdef scr_seq_T22_006
	scrdef scr_seq_T22_007
	scrdef scr_seq_T22_008
	scrdef scr_seq_T22_009
	scrdef scr_seq_T22_010
	scrdef scr_seq_T22_011
	scrdef scr_seq_T22_012
	scrdef scr_seq_T22_013
	scrdef scr_seq_T22_014
	scrdef_end

scr_seq_T22_000:
	setflag FLAG_GOT_PICK_UP_EGG_CALL_FROM_ELM
	phone_call PHONE_CONTACT_PROF__ELM, 2, 1
	setvar VAR_SCENE_VIOLET_CITY_OW, 2
	clearflag FLAG_HIDE_VIOLET_SHOP_LAB_AIDE
	setflag FLAG_HIDE_ELMS_LAB_AIDE
	end

scr_seq_T22_004:
	scrcmd_609
	lockall
	callstd std_play_kimono_girl_music
	apply_movement obj_T22_dancer, _00CC
	wait_movement
	npc_msg msg_0556_T22_00013
	closemsg
	apply_movement obj_T22_dancer, _00DC
	wait_movement
	npc_msg msg_0556_T22_00014
	closemsg
	apply_movement obj_T22_dancer, _00E4
	wait_movement
	npc_msg msg_0556_T22_00015
	closemsg
	apply_movement obj_T22_dancer, _0104
	wait_movement
	npc_msg msg_0556_T22_00016
	closemsg
	apply_movement obj_T22_dancer, _00F4
	wait_movement
	callstd std_fade_end_kimono_girl_music
	hide_person obj_T22_dancer
	setflag FLAG_HIDE_VIOLET_KIMONO_GIRL
	releaseall
	setvar VAR_SCENE_VIOLET_CITY_OW, 4
	end

	.balign 4, 0
_00CC:
	EmoteExclamationMark
	WalkNormalWest 5
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_00DC:
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_00E4:
	LockDir
	WalkSlowSouth
	UnlockDir
	EndMovement

	.balign 4, 0
_00F4:
	WalkNormalSouth 2
	WalkNormalWest
	WalkNormalSouth 7
	EndMovement

	.balign 4, 0
_0104:
	FaceEast
	Delay2
	FaceSouth
	Delay2
	FaceWest
	Delay2
	FaceNorth
	Delay2
	FaceEast
	Delay2
	FaceSouth
	Delay2
	FaceWest
	Delay2
	FaceNorth
	Delay2
	EndMovement

scr_seq_T22_005:
	simple_npc_msg msg_0556_T22_00026
	end

scr_seq_T22_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _0182
	apply_movement obj_T22_gsbigman, _0388
	goto _01C0

_0182:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _019D
	apply_movement obj_T22_gsbigman, _03AC
	goto _01C0

_019D:
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _01B8
	apply_movement obj_T22_gsbigman, _03D0
	goto _01C0

_01B8:
	apply_movement obj_T22_gsbigman, _03F4
_01C0:
	wait_movement
	npc_msg msg_0556_T22_00001
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _01E9
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _01F4
	end

_01E9:
	npc_msg msg_0556_T22_00002
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_01F4:
	npc_msg msg_0556_T22_00003
	closemsg
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _0218
	apply_movement obj_T22_gsbigman, _0418
	goto _0256

_0218:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _0233
	apply_movement obj_T22_gsbigman, _0440
	goto _0256

_0233:
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _024E
	apply_movement obj_T22_gsbigman, _0460
	goto _0256

_024E:
	apply_movement obj_T22_gsbigman, _0484
_0256:
	wait_movement
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 2
	goto_if_eq _028B
	compare VAR_SPECIAL_RESULT, 3
	goto_if_eq _02B9
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _02E7
	goto _0315
	end

_028B:
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_T22_gsbigman, _04B0
	apply_movement obj_player, _05FC
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	goto _0343
	end

_02B9:
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_T22_gsbigman, _04B0
	apply_movement obj_player, _061C
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	goto _0343
	end

_02E7:
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_T22_gsbigman, _04FC
	apply_movement obj_player, _063C
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	goto _0343
	end

_0315:
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_T22_gsbigman, _04B0
	apply_movement obj_player, _0670
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	goto _0343
	end

_0343:
	npc_msg msg_0556_T22_00004
	closemsg
	apply_movement obj_T22_gsbigman, _05EC
	wait_movement
	scrcmd_307 15, 8, 15, 1, 77
	scrcmd_310 77
	scrcmd_308 77
	apply_movement obj_T22_gsbigman, _05F4
	wait_movement
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	hide_person obj_T22_gsbigman
	setflag FLAG_UNK_19A
	clearflag FLAG_HIDE_EARL_IN_SCHOOL
	releaseall
	end

	.balign 4, 0
_0388:
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	EndMovement

	.balign 4, 0
_03AC:
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	EndMovement

	.balign 4, 0
_03D0:
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	EndMovement

	.balign 4, 0
_03F4:
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	EndMovement

	.balign 4, 0
_0418:
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	EndMovement

	.balign 4, 0
_0440:
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	EndMovement

	.balign 4, 0
_0460:
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	EndMovement

	.balign 4, 0
_0484:
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	EndMovement

	.balign 4, 0
_04B0:
	WalkFastSouth 8
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	WalkFastEast 21
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	WalkFastNorth
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_04FC:
	WalkFastWest 2
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	WalkFastSouth 3
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	WalkFastEast 2
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	WalkFastSouth 5
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	WalkFastEast 21
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	WalkFastNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	EndMovement

	.balign 4, 0
_05EC:
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_05F4:
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_05FC:
	Delay8
	RunWest
	RunSouth 8
	WalkOnSpotNormalEast
	Delay4
	RunEast 21
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_061C:
	Delay8
	RunEast
	RunSouth 8
	WalkOnSpotNormalEast
	Delay4
	RunEast 21
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_063C:
	WalkFastSouth
	WalkFastEast
	WalkOnSpotFastWest
	Delay8 2
	WalkOnSpotFastSouth
	Delay8 2
	WalkFastWest
	RunSouth 6
	WalkOnSpotNormalEast
	Delay4
	RunEast 21
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0670:
	Delay8
	RunSouth 9
	WalkOnSpotNormalEast
	Delay4
	RunEast 21
	WalkOnSpotNormalNorth
	EndMovement

scr_seq_T22_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	call _0ADD
	call _0A57
	compare VAR_SPECIAL_x8006, 1
	goto_if_eq _06BC
	npc_msg msg_0556_T22_00017
	closemsg
	call _0ADD
	releaseall
	end

_06BC:
	npc_msg msg_0556_T22_00018
_06BF:
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_x8000, 1
	goto_if_ne _06DE
	menu_item_add 205, 255, 0
_06DE:
	compare VAR_SPECIAL_x8001, 1
	goto_if_ne _06F3
	menu_item_add 206, 255, 1
_06F3:
	compare VAR_SPECIAL_x8002, 1
	goto_if_ne _0708
	menu_item_add 207, 255, 2
_0708:
	compare VAR_SPECIAL_x8003, 1
	goto_if_ne _071D
	menu_item_add 208, 255, 3
_071D:
	menu_item_add 126, 255, 4
	menu_exec
	touchscreen_menu_show
	switch VAR_SPECIAL_RESULT
	case 0, _0769
	case 1, _080D
	case 2, _08B1
	case 3, _0955
	goto _09F9

_0769:
	npc_msg msg_0556_T22_00021
	goto_if_no_item_space ITEM_CHERI_BERRY, 1, _0A08
	goto_if_no_item_space ITEM_PECHA_BERRY, 1, _0A08
	goto_if_no_item_space ITEM_LEPPA_BERRY, 1, _0A08
	giveitem_no_check ITEM_CHERI_BERRY, 1
	giveitem_no_check ITEM_PECHA_BERRY, 1
	giveitem_no_check ITEM_LEPPA_BERRY, 1
	takeitem ITEM_RED_SHARD, 1, VAR_SPECIAL_RESULT
	goto _0A17

_080D:
	npc_msg msg_0556_T22_00022
	goto_if_no_item_space ITEM_ORAN_BERRY, 1, _0A08
	goto_if_no_item_space ITEM_CHESTO_BERRY, 1, _0A08
	goto_if_no_item_space ITEM_WIKI_BERRY, 1, _0A08
	giveitem_no_check ITEM_ORAN_BERRY, 1
	giveitem_no_check ITEM_CHESTO_BERRY, 1
	giveitem_no_check ITEM_WIKI_BERRY, 1
	takeitem ITEM_BLUE_SHARD, 1, VAR_SPECIAL_RESULT
	goto _0A17

_08B1:
	npc_msg msg_0556_T22_00023
	goto_if_no_item_space ITEM_ASPEAR_BERRY, 1, _0A08
	goto_if_no_item_space ITEM_SITRUS_BERRY, 1, _0A08
	goto_if_no_item_space ITEM_IAPAPA_BERRY, 1, _0A08
	giveitem_no_check ITEM_ASPEAR_BERRY, 1
	giveitem_no_check ITEM_SITRUS_BERRY, 1
	giveitem_no_check ITEM_IAPAPA_BERRY, 1
	takeitem ITEM_YELLOW_SHARD, 1, VAR_SPECIAL_RESULT
	goto _0A17

_0955:
	npc_msg msg_0556_T22_00024
	goto_if_no_item_space ITEM_RAWST_BERRY, 1, _0A08
	goto_if_no_item_space ITEM_LUM_BERRY, 1, _0A08
	goto_if_no_item_space ITEM_AGUAV_BERRY, 1, _0A08
	giveitem_no_check ITEM_RAWST_BERRY, 1
	giveitem_no_check ITEM_LUM_BERRY, 1
	giveitem_no_check ITEM_AGUAV_BERRY, 1
	takeitem ITEM_GREEN_SHARD, 1, VAR_SPECIAL_RESULT
	goto _0A17

_09F9:
	npc_msg msg_0556_T22_00020
	closemsg
	call _0ADD
	releaseall
	end

_0A08:
	npc_msg msg_0556_T22_00025
	closemsg
	call _0ADD
	releaseall
	end

_0A17:
	setvar VAR_SPECIAL_x8000, 0
	setvar VAR_SPECIAL_x8001, 0
	setvar VAR_SPECIAL_x8002, 0
	setvar VAR_SPECIAL_x8003, 0
	setvar VAR_SPECIAL_x8006, 0
	call _0A57
	compare VAR_SPECIAL_x8006, 1
	goto_if_ne _0A51
	npc_msg msg_0556_T22_00019
	goto _06BF

_0A51:
	goto _09F9

_0A57:
	hasitem ITEM_RED_SHARD, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0A78
	setvar VAR_SPECIAL_x8000, 1
	setvar VAR_SPECIAL_x8006, 1
_0A78:
	hasitem ITEM_BLUE_SHARD, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0A99
	setvar VAR_SPECIAL_x8001, 1
	setvar VAR_SPECIAL_x8006, 1
_0A99:
	hasitem ITEM_YELLOW_SHARD, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0ABA
	setvar VAR_SPECIAL_x8002, 1
	setvar VAR_SPECIAL_x8006, 1
_0ABA:
	hasitem ITEM_GREEN_SHARD, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0ADB
	setvar VAR_SPECIAL_x8003, 1
	setvar VAR_SPECIAL_x8006, 1
_0ADB:
	return

_0ADD:
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0AFE
	apply_movement obj_T22_juggrer, _0B28
	wait_movement
	goto _0B25

_0AFE:
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _0B1B
	apply_movement obj_T22_juggrer, _0B6C
	wait_movement
	goto _0B25

_0B1B:
	apply_movement obj_T22_juggrer, _0BB0
	wait_movement
_0B25:
	return

	.balign 4, 0
_0B28:
	FaceEast
	FaceNorth
	FaceWest
	FaceSouth
	FaceEast
	FaceNorth
	FaceWest
	FaceSouth
	FaceEast
	FaceNorth
	FaceWest
	FaceSouth
	FaceEast
	FaceNorth
	FaceWest
	FaceSouth
	EndMovement

	.balign 4, 0
_0B6C:
	FaceNorth
	FaceWest
	FaceSouth
	FaceEast
	FaceNorth
	FaceWest
	FaceSouth
	FaceEast
	FaceNorth
	FaceWest
	FaceSouth
	FaceEast
	FaceNorth
	FaceWest
	FaceSouth
	FaceEast
	EndMovement

	.balign 4, 0
_0BB0:
	FaceSouth
	FaceEast
	FaceNorth
	FaceWest
	FaceSouth
	FaceEast
	FaceNorth
	FaceWest
	FaceSouth
	FaceEast
	FaceNorth
	FaceWest
	FaceSouth
	FaceEast
	FaceNorth
	FaceWest
	EndMovement

scr_seq_T22_002:
	end

scr_seq_T22_006:
	simple_npc_msg msg_0556_T22_00027
	end

scr_seq_T22_007:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0556_T22_00012, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T22_008:
	direction_signpost msg_0556_T22_00009, 0, 13, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T22_009:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0556_T22_00010, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T22_010:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0556_T22_00011, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T22_011:
	simple_npc_msg msg_0556_T22_00005
	end

scr_seq_T22_012:
	simple_npc_msg msg_0556_T22_00006
	end

scr_seq_T22_013:
	simple_npc_msg msg_0556_T22_00007
	end

scr_seq_T22_014:
	simple_npc_msg msg_0556_T22_00008
	end
	.balign 4, 0
