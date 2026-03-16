#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T10R0101.h"
#include "msgdata/msg/msg_0522_T10R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T10R0101_000
	scrdef scr_seq_T10R0101_001
	scrdef scr_seq_T10R0101_002
	scrdef scr_seq_T10R0101_003
	scrdef scr_seq_T10R0101_004
	scrdef scr_seq_T10R0101_005
	scrdef scr_seq_T10R0101_006
	scrdef scr_seq_T10R0101_007
	scrdef scr_seq_T10R0101_008
	scrdef_end

scr_seq_T10R0101_005:
	setflag FLAG_HIDE_WILLS_ROOM_RETREAT
	setflag FLAG_HIDE_KOGAS_ROOM_RETREAT
	setflag FLAG_HIDE_BRUNOS_ROOM_RETREAT
	setflag FLAG_HIDE_KARENS_ROOM_RETREAT
	clearflag FLAG_HIDE_WILLS_ROOM_EXIT
	clearflag FLAG_HIDE_KOGAS_ROOM_EXIT
	clearflag FLAG_HIDE_BRUNOS_ROOM_EXIT
	clearflag FLAG_HIDE_KARENS_ROOM_EXIT
	clearflag FLAG_DEFEATED_WILL
	clearflag FLAG_DEFEATED_KOGA
	clearflag FLAG_DEFEATED_BRUNO
	clearflag FLAG_DEFEATED_KAREN
	compare VAR_UNK_40FC, 1
	goto_if_le _00AC
	goto_if_set FLAG_UNK_AA9, _00AC
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 1
	goto_if_ne _008B
	setvar VAR_UNK_4119, 1
	goto _00AA

_008B:
	compare VAR_TEMP_x4000, 3
	goto_if_ne _00A4
	setvar VAR_UNK_4119, 1
	goto _00AA

_00A4:
	setvar VAR_UNK_4119, 0
_00AA:
	end

_00AC:
	end

scr_seq_T10R0101_001:
	simple_npc_msg msg_0522_T10R0101_00000
	end

scr_seq_T10R0101_002:
	simple_npc_msg msg_0522_T10R0101_00001
	end

scr_seq_T10R0101_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_ABRA, 0
	npc_msg msg_0522_T10R0101_00002
	wait_cry
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T10R0101_006:
	scrcmd_609
	lockall
	fade_out_bgm 0, 3
	apply_movement obj_player, _01DC
	wait_movement
	callstd std_play_rival_intro_music
	get_player_coords VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	clearflag FLAG_HIDE_INDIGO_PLATEAU_RIVAL
	show_person obj_T10R0101_gsrivel
	move_person_facing obj_T10R0101_gsrivel, VAR_SPECIAL_x8000, 0, 23, DIR_NORTH
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_T10R0101_gsrivel, _0208
	apply_movement obj_player, _01E8
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	buffer_rivals_name 0
	npc_msg msg_0522_T10R0101_00003
	closemsg
	get_starter_choice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 152
	goto_if_ne _016E
	trainer_battle TRAINER_RIVAL_SILVER_20, 0, 0, 0
	goto _0191

_016E:
	compare VAR_SPECIAL_RESULT, 155
	goto_if_ne _0189
	trainer_battle TRAINER_RIVAL_SILVER_21, 0, 0, 0
	goto _0191

_0189:
	trainer_battle TRAINER_RIVAL_SILVER_19, 0, 0, 0
_0191:
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _01CE
	callstd std_play_rival_outro_music
	buffer_rivals_name 0
	npc_msg msg_0522_T10R0101_00004
	closemsg
	apply_movement obj_T10R0101_gsrivel, _0210
	wait_movement
	setvar VAR_UNK_4119, 0
	setflag FLAG_UNK_AA9
	hide_person obj_T10R0101_gsrivel
	callstd std_fade_end_rival_outro_music
	releaseall
	end

_01CE:
	hide_person obj_T10R0101_gsrivel
	setflag FLAG_HIDE_INDIGO_PLATEAU_RIVAL
	white_out
	releaseall
	end

	.balign 4, 0
_01DC:
	EmoteExclamationMark
	Delay8
	EndMovement

	.balign 4, 0
_01E8:
	Delay8 2
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_01F4:
	Delay8 2
	WalkNormalEast
	WalkNormalNorth
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0208:
	WalkNormalNorth 7
	EndMovement

	.balign 4, 0
_0210:
	WalkOnSpotNormalSouth
	WalkNormalSouth 7
	EndMovement

scr_seq_T10R0101_000:
	setvar VAR_SPECIAL_x8007, 0
	callstd std_nurse_joy
	end

scr_seq_T10R0101_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd std_mart_intro
	holdmsg
	setvar VAR_SPECIAL_x8004, 13
	callstd std_special_mart
	releaseall
	end

scr_seq_T10R0101_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_TEMP_x4005, 1
	goto_if_ge _0293
	npc_msg msg_0522_T10R0101_00005
	closemsg
	get_player_facing VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 2
	goto_if_ne _027D
	apply_movement obj_T10R0101_counterm, _02A0
	goto _0287

_027D:
	apply_movement obj_T10R0101_counterm, _02B0
	wait_movement
_0287:
	wait_movement
	setvar VAR_TEMP_x4005, 1
	releaseall
	end

_0293:
	npc_msg msg_0522_T10R0101_00006
	wait_button_or_walk_away
	closemsg
	releaseall
	end

	.balign 4, 0
_02A0:
	LockDir
	WalkNormalWest
	UnlockDir
	EndMovement

	.balign 4, 0
_02B0:
	LockDir
	WalkNormalEast
	UnlockDir
	EndMovement

scr_seq_T10R0101_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0522_T10R0101_00007
	touchscreen_menu_hide
_02CD:
	menu_init 1, 1, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add msg_0522_T10R0101_00008, 255, 0
	menu_item_add msg_0522_T10R0101_00009, 255, 1
	menu_item_add msg_0522_T10R0101_00010, 255, 2
	menu_exec
	switch VAR_SPECIAL_RESULT
	case 0, _0317
	case 1, _0456
	goto _058C
	end

_0317:
	compare VAR_UNK_40E6, 0
	goto_if_eq _037A
	npc_msg msg_0522_T10R0101_00011
	menu_init 1, 1, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add msg_0522_T10R0101_00012, 255, 0
	menu_item_add msg_0522_T10R0101_00013, 255, 1
	menu_item_add msg_0522_T10R0101_00014, 255, 2
	menu_exec
	switch VAR_SPECIAL_RESULT
	case 0, _037A
	case 1, _03F1
	goto _0371
	end

_0371:
	npc_msg msg_0522_T10R0101_00007
	goto _02CD

_037A:
	npc_msg msg_0522_T10R0101_00015
	menu_init 1, 1, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add msg_0522_T10R0101_00016, 255, 0
	menu_item_add msg_0522_T10R0101_00017, 255, 1
	menu_item_add msg_0522_T10R0101_00018, 255, 2
	menu_item_add msg_0522_T10R0101_00019, 255, 3
	menu_item_add msg_0522_T10R0101_00026, 255, 4
	menu_exec
	compare VAR_SPECIAL_RESULT, 4
	goto_if_eq _03CF
	closemsg
	view_rankings RANKINGS_SCOPE_GROUP, RANKINGS_PAGE_POKEMON, VAR_SPECIAL_RESULT
	npc_msg msg_0522_T10R0101_00007
	touchscreen_menu_hide
	goto _02CD

_03CF:
	compare VAR_UNK_40E6, 0
	goto_if_ne _03EB
	npc_msg msg_0522_T10R0101_00007
	goto _02CD

_03E5:
	goto _03F1

_03EB:
	goto _0317

_03F1:
	npc_msg msg_0522_T10R0101_00015
	menu_init 1, 1, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add msg_0522_T10R0101_00020, 255, 0
	menu_item_add msg_0522_T10R0101_00021, 255, 1
	menu_item_add msg_0522_T10R0101_00022, 255, 2
	menu_item_add msg_0522_T10R0101_00023, 255, 3
	menu_item_add msg_0522_T10R0101_00024, 255, 4
	menu_item_add msg_0522_T10R0101_00025, 255, 5
	menu_item_add msg_0522_T10R0101_00026, 255, 6
	menu_exec
	compare VAR_SPECIAL_RESULT, 6
	goto_if_eq _03CF
	closemsg
	view_rankings RANKINGS_SCOPE_GROUP, RANKINGS_PAGE_BATTLE_TOWER, VAR_SPECIAL_RESULT
	npc_msg msg_0522_T10R0101_00007
	touchscreen_menu_hide
	goto _02CD

_0456:
	compare VAR_UNK_40E6, 0
	goto_if_eq _04B0
	npc_msg msg_0522_T10R0101_00011
	menu_init 1, 1, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add msg_0522_T10R0101_00012, 255, 0
	menu_item_add msg_0522_T10R0101_00013, 255, 1
	menu_item_add msg_0522_T10R0101_00014, 255, 2
	menu_exec
	switch VAR_SPECIAL_RESULT
	case 0, _04B0
	case 1, _0527
	goto _02CD
	end

_04B0:
	npc_msg msg_0522_T10R0101_00015
	menu_init 1, 1, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add msg_0522_T10R0101_00016, 255, 0
	menu_item_add msg_0522_T10R0101_00017, 255, 1
	menu_item_add msg_0522_T10R0101_00018, 255, 2
	menu_item_add msg_0522_T10R0101_00019, 255, 3
	menu_item_add msg_0522_T10R0101_00026, 255, 4
	menu_exec
	compare VAR_SPECIAL_RESULT, 4
	goto_if_eq _0505
	closemsg
	view_rankings RANKINGS_SCOPE_GLOBAL, RANKINGS_PAGE_POKEMON, VAR_SPECIAL_RESULT
	npc_msg msg_0522_T10R0101_00007
	touchscreen_menu_hide
	goto _02CD

_0505:
	compare VAR_UNK_40E6, 0
	goto_if_ne _0521
	npc_msg msg_0522_T10R0101_00007
	goto _02CD

_051B:
	goto _0527

_0521:
	goto _0456

_0527:
	npc_msg msg_0522_T10R0101_00015
	menu_init 1, 1, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add msg_0522_T10R0101_00020, 255, 0
	menu_item_add msg_0522_T10R0101_00021, 255, 1
	menu_item_add msg_0522_T10R0101_00022, 255, 2
	menu_item_add msg_0522_T10R0101_00023, 255, 3
	menu_item_add msg_0522_T10R0101_00024, 255, 4
	menu_item_add msg_0522_T10R0101_00025, 255, 5
	menu_item_add msg_0522_T10R0101_00026, 255, 6
	menu_exec
	compare VAR_SPECIAL_RESULT, 6
	goto_if_eq _0505
	closemsg
	view_rankings RANKINGS_SCOPE_GLOBAL, RANKINGS_PAGE_BATTLE_TOWER, VAR_SPECIAL_RESULT
	npc_msg msg_0522_T10R0101_00007
	touchscreen_menu_hide
	goto _02CD

_058C:
	touchscreen_menu_show
	closemsg
	releaseall
	end
	.balign 4, 0
