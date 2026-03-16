#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D26R0102.h"
#include "fielddata/script/scr_seq/event_D36R0101.h"
#include "msgdata/msg/msg_0091_D26R0102.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D26R0102_000
	scrdef scr_seq_D26R0102_001
	scrdef scr_seq_D26R0102_002
	scrdef_end

scr_seq_D26R0102_000:
	simple_npc_msg msg_0091_D26R0102_00005
	end

scr_seq_D26R0102_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0091_D26R0102_00003
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0047
	closemsg
	releaseall
	end

_0047:
	buffer_players_name 0
	npc_msg msg_0091_D26R0102_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D26R0102_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0091_D26R0102_00001
	closemsg
	trainer_battle TRAINER_EXECUTIVE_PROTON_PROTON, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0193
	npc_msg msg_0091_D26R0102_00002
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	hide_person obj_D26R0102_rocketm
	hide_person obj_D26R0102_rocketm_2
	hide_person obj_D26R0102_rocketw
	hide_person obj_D26R0102_rkanbum3
	setflag FLAG_UNK_1A9
	wait 20, VAR_SPECIAL_x8004
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	move_person_facing obj_D26R0102_gantetsu, 36, 0, 7, DIR_WEST
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _00F7
	apply_movement obj_D26R0102_gantetsu, _019C
	apply_movement obj_player, _01C0
	goto _0107

_00F7:
	apply_movement obj_D26R0102_gantetsu, _019C
	apply_movement obj_player, _01DC
_0107:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	buffer_players_name 0
	npc_msg msg_0091_D26R0102_00000
	closemsg
	clearflag FLAG_UNK_19E
	clearflag FLAG_HIDE_AZALEA_SLOWPOKES
	setflag FLAG_BEAT_AZALEA_ROCKETS
	setvar VAR_UNK_4075, 1
	setvar VAR_UNK_4080, 2
	setvar VAR_FARFETCHD1_STICKS1, STICKS_ACTIVE
	setvar VAR_FARFETCHD1_STICKS2, STICKS_ACTIVE
	setvar VAR_FARFETCHD2_STICKS4, STICKS_ACTIVE
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_AZALEA_KURT_HOUSE, 0, 4, 5, DIR_NORTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	setflag FLAG_UNK_1AA
	setflag FLAG_UNK_1D5
	setflag FLAG_UNK_1AC
	clearflag FLAG_HIDE_ILEX_APPRENTICE
	clearflag FLAG_HIDE_FARFETCHD_1_LOST
	clearflag FLAG_HIDE_FARFETCHD_2_LOST
	setvar VAR_UNK_40F4, 1
	releaseall
	end

_0193:
	white_out
	releaseall
	end

	.balign 4, 0
_019C:
	WalkNormalWest 2
	WalkNormalSouth 2
	WalkNormalWest 3
	WalkNormalNorth 2
	Delay4 4
	WalkNormalWest
	WalkNormalNorth 3
	FaceWest
	EndMovement

	.balign 4, 0
_01C0:
	WalkNormalEast 2
	FaceNorth
	Delay8 6
	FaceSouth
	Delay8 5
	FaceEast
	EndMovement

	.balign 4, 0
_01DC:
	WalkNormalSouth
	WalkNormalEast
	FaceNorth
	Delay8 6
	FaceSouth
	Delay8 5
	FaceEast
	EndMovement
	.balign 4, 0
