#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D45R0102.h"
#include "msgdata/msg/msg_0131_D45R0102.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D45R0102_000
	scrdef scr_seq_D45R0102_001
	scrdef scr_seq_D45R0102_002
	scrdef scr_seq_D45R0102_003
	scrdef_end

scr_seq_D45R0102_002:
	end

scr_seq_D45R0102_000:
	compare VAR_UNK_40FE, 4
	goto_if_eq _0077
	compare VAR_UNK_40FE, 3
	goto_if_eq _0057
	compare VAR_UNK_40FE, 2
	goto_if_eq _003D
	end

_003D:
	move_person_facing obj_D45R0102_sakaki, 6, 1, 4, DIR_NORTH
	move_person_facing obj_D45R0102_var_1, 5, 1, 8, DIR_SOUTH
	end

_0057:
	move_person_facing obj_D45R0102_sakaki, 6, 1, 6, DIR_SOUTH
	move_person_facing obj_D45R0102_var_1, 5, 1, 7, DIR_NORTH
	make_object_visible obj_partner_poke
	scrcmd_606
	end

_0077:
	end

scr_seq_D45R0102_001:
	scrcmd_609
	lockall
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_player, _0374
	apply_movement obj_D45R0102_var_1, _03AC
	wait_movement
	apply_movement obj_partner_poke, _0398
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	apply_movement obj_D45R0102_sakaki, _031C
	wait_movement
	npc_msg msg_0131_D45R0102_00000
	closemsg
	apply_movement obj_D45R0102_var_1, _03AC
	wait_movement
	gender_msgbox msg_0131_D45R0102_00008, msg_0131_D45R0102_00007
	closemsg
	apply_movement obj_D45R0102_sakaki, _032C
	wait_movement
	npc_msg msg_0131_D45R0102_00001
	closemsg
	apply_movement obj_D45R0102_var_1, _03B4
	wait_movement
	gender_msgbox msg_0131_D45R0102_00010, msg_0131_D45R0102_00009
	closemsg
	apply_movement obj_D45R0102_var_1, _038C
	wait_movement
	gender_msgbox msg_0131_D45R0102_00012, msg_0131_D45R0102_00011
	closemsg
	apply_movement obj_D45R0102_var_1, _03DC
	wait_movement
	buffer_players_name 0
	gender_msgbox msg_0131_D45R0102_00014, msg_0131_D45R0102_00013
	closemsg
	stop_bgm 0
	play_se SEQ_SE_PL_FR03
	play_bgm SEQ_GS_SENKYO
	npc_msg msg_0131_D45R0102_00002
	stop_se SEQ_SE_PL_FR03
	closemsg
	apply_movement obj_D45R0102_sakaki, _032C
	wait_movement
	npc_msg msg_0131_D45R0102_00003
	closemsg
	setvar VAR_UNK_40FE, 3
	trainer_battle TRAINER_ROCKET_BOSS_GIOVANNI, 0, 1, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0250
	setvar VAR_UNK_40FE, 4
	apply_movement obj_D45R0102_sakaki, _033C
	wait_movement
	npc_msg msg_0131_D45R0102_00004
	closemsg
	apply_movement obj_D45R0102_sakaki, _0350
	wait_movement
	hide_person obj_D45R0102_sakaki
	setflag FLAG_HIDE_TOHJO_FALLS_GIOVANNI
	apply_movement obj_player, _0380
	apply_movement obj_D45R0102_var_1, _0380
	wait_movement
	fade_out_bgm 0, 30
	stop_bgm 0
	play_se SEQ_SE_PL_FR03
	npc_msg msg_0131_D45R0102_00005
	stop_se SEQ_SE_PL_FR03
	closemsg
	apply_movement obj_D45R0102_var_1, _03D4
	wait_movement
	buffer_players_name 0
	gender_msgbox msg_0131_D45R0102_00016, msg_0131_D45R0102_00015
	closemsg
	get_party_lead_alive VAR_TEMP_x4002
	get_partymon_species VAR_TEMP_x4002, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 251
	call_if_ne _02C0
	apply_movement obj_partner_poke, _03A4
	wait_movement
	play_se SEQ_SE_GS_SUZUSYUTUGEN_HO
	fade_screen 6, 6, 0, RGB_WHITE
	wait_fade
	wait 15, VAR_SPECIAL_RESULT
	fade_screen 6, 6, 1, RGB_WHITE
	wait_fade
	apply_movement obj_player, _038C
	wait_movement
	apply_movement obj_D45R0102_var_1, _03C0
	wait_movement
	compare VAR_TEMP_x4003, 1
	goto_if_ne _0224
	gender_msgbox msg_0131_D45R0102_00027, msg_0131_D45R0102_00026
	closemsg
	goto _022A

_0224:
	gender_msgbox msg_0131_D45R0102_00018, msg_0131_D45R0102_00017
	closemsg
_022A:
	play_se SEQ_SE_GS_TIMESLIP
	scrcmd_810
	clearflag FLAG_HIDE_ILEX_FOREST_FRIEND
	warp MAP_ILEX_FOREST, 0, 16, 57, DIR_SOUTH
	fade_screen 6, 15, 1, RGB_WHITE
	wait_fade
	releaseall
	end

_0250:
	npc_msg msg_0131_D45R0102_00006
	closemsg
	apply_movement obj_D45R0102_sakaki, _0360
	play_se SEQ_SE_GS_SUZUSYUTUGEN_HO
	fade_screen 6, 6, 0, RGB_WHITE
	wait_fade
	wait 15, VAR_SPECIAL_RESULT
	fade_screen 6, 6, 1, RGB_WHITE
	wait_fade
	wait_movement
	hide_person obj_D45R0102_sakaki
	setflag FLAG_HIDE_TOHJO_FALLS_GIOVANNI
	npc_msg msg_0131_D45R0102_00019
	closemsg
	play_se SEQ_SE_GS_TIMESLIP
	scrcmd_810
	setflag FLAG_UNK_178
	setvar VAR_UNK_40FE, 0
	setflag FLAG_HIDE_ILEX_FOREST_FRIEND
	warp MAP_ILEX_FOREST, 0, 16, 57, DIR_SOUTH
	fade_screen 6, 15, 1, RGB_WHITE
	wait_fade
	touchscreen_menu_show
	releaseall
	end

_02C0:
	setvar VAR_TEMP_x4003, 1
	apply_movement obj_D45R0102_var_1, _0304
	wait_movement
	gender_msgbox msg_0131_D45R0102_00023, msg_0131_D45R0102_00022
	closemsg
	gender_msgbox msg_0131_D45R0102_00025, msg_0131_D45R0102_00024
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	play_fanfare SEQ_ME_ASA
	wait_fanfare
	heal_party
	scrcmd_436
	restore_overworld
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	return

	.balign 4, 0
_0304:
	WalkOnSpotNormalEast
	EmoteExclamationMark
	Delay8
	WalkFastEast
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_031C:
	EmoteExclamationMark
	Delay8
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_032C:
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_0334:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_033C:
	LockDir
	WalkSlowNorth
	UnlockDir
	WalkSlowEast 2
	EndMovement

	.balign 4, 0
_0350:
	WalkNormalSouth 4
	WalkNormalWest 2
	WalkNormalSouth 2
	EndMovement

	.balign 4, 0
_0360:
	WalkSlowEast 2
	WalkSlowSouth 3
	WalkSlowWest 2
	WalkSlowSouth 2
	EndMovement

	.balign 4, 0
_0374:
	WalkOnSpotNormalNorth
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_0380:
	Delay8 3
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_038C:
	EmoteExclamationMark
	Delay8
	EndMovement

	.balign 4, 0
_0398:
	WalkNormalEast
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_03A4:
	JumpOnSpotFastSouth
	EndMovement

	.balign 4, 0
_03AC:
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_03B4:
	WalkNormalNorth
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_03C0:
	WalkOnSpotNormalWest
	Delay8
	WalkOnSpotNormalEast
	Delay8
	EndMovement

	.balign 4, 0
_03D4:
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_03DC:
	WalkOnSpotFastEast 4
	EndMovement

scr_seq_D45R0102_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_UNK_40FE, 4
	goto_if_ge _0404
	npc_msg msg_0131_D45R0102_00020
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0404:
	npc_msg msg_0131_D45R0102_00021
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
