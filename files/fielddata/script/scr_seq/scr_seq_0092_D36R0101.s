; Ilex Forest

#define FARFETCHD_X_COORD                   VAR_TEMP_x4000
#define FARFETCHD_Z_COORD                   VAR_TEMP_x4001
#define FARFETCHD1_BLIND_SPOT               VAR_TEMP_x4002
#define FARFETCHD2_BLIND_SPOT               VAR_TEMP_x4003
#define FARFETCHD1_BOTTOM_RIGHT_FACING_UP   VAR_TEMP_x4004

#include "constants/events.h"
#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D36R0101.h"
#include "msgdata/msg/msg_0115_D36R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D36R0101_000
	scrdef scr_seq_D36R0101_farfetchd1
	scrdef scr_seq_D36R0101_002
	scrdef scr_seq_D36R0101_farfetchd1_sticks1
	scrdef scr_seq_D36R0101_farfetchd1_sticks2
	scrdef scr_seq_D36R0101_farfetchd2
	scrdef scr_seq_D36R0101_farfetchd2_sticks1
	scrdef scr_seq_D36R0101_farfetchd2_sticks2
	scrdef scr_seq_D36R0101_farfetchd2_sticks3
	scrdef scr_seq_D36R0101_farfetchd2_sticks4
	scrdef scr_seq_D36R0101_010
	scrdef scr_seq_D36R0101_011
	scrdef scr_seq_D36R0101_012
	scrdef scr_seq_D36R0101_013
	scrdef scr_seq_D36R0101_014
	scrdef scr_seq_D36R0101_015
	scrdef scr_seq_D36R0101_016
	scrdef scr_seq_D36R0101_017
	scrdef scr_seq_D36R0101_018
	scrdef scr_seq_D36R0101_019
	scrdef scr_seq_D36R0101_020
	scrdef scr_seq_D36R0101_021
	scrdef scr_seq_D36R0101_022
	scrdef_end

scr_seq_D36R0101_000:
	get_friend_sprite VAR_OBJ_0
	goto_if_unset FLAG_UNK_189, _0077
	clearflag FLAG_UNK_189
	goto _00C3

_0077:
	check_badge BADGE_PLAIN, VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 0
	goto_if_eq _00B5
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 2
	goto_if_eq _00BF
	compare VAR_TEMP_x4000, 6
	goto_if_eq _00BF
	compare VAR_TEMP_x4000, 0
	goto_if_eq _00BF
_00B5:
	setflag FLAG_HIDE_CAMERON
	goto _00C3

_00BF:
	clearflag FLAG_HIDE_CAMERON
_00C3:
	goto_if_set FLAG_BEAT_AZALEA_ROCKETS, _00D0
	end

_00D0:
	setvar VAR_FARFETCHD1_STICKS1, STICKS_ACTIVE
	setvar VAR_FARFETCHD2_STICKS1, STICKS_INACTIVE
	setvar VAR_FARFETCHD2_STICKS2, STICKS_INACTIVE
	setvar VAR_FARFETCHD2_STICKS3, STICKS_INACTIVE
	setvar VAR_FARFETCHD2_STICKS4, STICKS_ACTIVE
	setvar VAR_TEMP_x4000, 0
	setvar VAR_TEMP_x4001, 0
	setvar FARFETCHD1_BLIND_SPOT, FALSE
	setvar FARFETCHD2_BLIND_SPOT, FALSE
	setvar FARFETCHD1_BOTTOM_RIGHT_FACING_UP, FALSE
	goto_if_set FLAG_FOUND_FIRST_FARFETCHD, _0124
	goto_if_set FLAG_FOUND_SECOND_FARFETCHD, _0145
	end

_0124:
	goto_if_set FLAG_FOUND_SECOND_FARFETCHD, _0137
	setvar VAR_FARFETCHD1_STICKS1, STICKS_INACTIVE
	end

_0137:
	setvar VAR_FARFETCHD1_STICKS1, STICKS_INACTIVE
	setvar VAR_FARFETCHD2_STICKS4, STICKS_INACTIVE
	end

_0145:
	setvar VAR_FARFETCHD1_STICKS1, STICKS_ACTIVE
	setvar VAR_FARFETCHD2_STICKS4, STICKS_INACTIVE
	end

scr_seq_D36R0101_021:
	compare VAR_UNK_412B, 1
	call_if_eq _016F
	compare VAR_UNK_40FE, 4
	call_if_eq _0189
	end

_016F:
	move_person_facing obj_D36R0101_gsoldman1, 15, 0, 58, DIR_SOUTH
	move_person_facing obj_D36R0101_tsure_poke_static_pichu_spiky, 15, 0, 59, DIR_EAST
	return

_0189:
	move_person_facing obj_D36R0101_var_1, 15, 0, 58, DIR_SOUTH
	move_person_facing obj_D36R0101_tsure_poke_static_marill, 11, 0, 58, DIR_EAST
	return

scr_seq_D36R0101_farfetchd1:
	get_person_coords obj_D36R0101_tsure_poke_static_farfetchd, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	compare FARFETCHD_X_COORD, 25
	goto_if_ne _01C4
	goto _farfetchd1_left

_01BE:
	goto _farfetchd1_left

_01C4:
	compare FARFETCHD_X_COORD, 32
	goto_if_ne _farfetchd1_left
	goto _farfetchd1_right

_farfetchd1_left:
	get_person_coords obj_D36R0101_tsure_poke_static_farfetchd, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	compare FARFETCHD_Z_COORD, 52
	goto_if_ne _01F8
	goto _farfetchd1_top_left

_01F2:
	goto _farfetchd1_right

_01F8:
	compare FARFETCHD_Z_COORD, 62
	goto_if_ne _farfetchd1_right
	goto _farfetchd1_bottom_left

_farfetchd1_right:
	setvar FARFETCHD1_BLIND_SPOT, FALSE
	get_person_coords obj_D36R0101_tsure_poke_static_farfetchd, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	compare FARFETCHD_Z_COORD, 52
	goto_if_ne _0232
	goto _farfetchd1_top_right

_022C:
	goto _farfetchd1_top_left

_0232:
	compare FARFETCHD_Z_COORD, 62
	goto_if_ne _farfetchd1_top_left
	goto _farfetchd1_bottom_right

_farfetchd1_top_left:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar FARFETCHD1_BLIND_SPOT, FALSE
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, DIR_NORTH
	goto_if_ne _0272
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd, _farfetchd1_run_right
	goto _0293

_0272:
	compare VAR_SPECIAL_RESULT, DIR_WEST
	goto_if_ne _0293
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd, _farfetchd_run_down
	setvar VAR_FARFETCHD1_STICKS2, STICKS_ACTIVE
	setvar VAR_FARFETCHD1_STICKS1, STICKS_ACTIVE
_0293:
	wait_movement
	releaseall
	end

_farfetchd1_bottom_left:
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, DIR_WEST
	goto_if_ne _02B6
	goto _farfetchd1_bottom_left_flee_up

_02B0:
	goto _farfetchd1_bottom_left_flee_up

_02B6:
	compare VAR_SPECIAL_RESULT, DIR_SOUTH
	goto_if_ne _farfetchd1_bottom_left_flee_up
	goto _farfetchd1_bottom_left_flee_right

_farfetchd1_bottom_left_flee_up:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_FARFETCHD1_STICKS1, STICKS_INACTIVE
	setvar VAR_FARFETCHD1_STICKS2, STICKS_INACTIVE
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd, _farfetchd_run_up
	wait_movement
	goto_if_set FLAG_UNK_126, _02FD
	npc_msg msg_0115_D36R0101_00036
	wait_button_or_walk_away
	closemsg
	setflag FLAG_UNK_126
_02FD:
	releaseall
	end

_farfetchd1_bottom_left_flee_right:
	compare FARFETCHD1_BLIND_SPOT, TRUE
	goto_if_eq _farfetchd1_bottom_left_caught
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_FARFETCHD1_STICKS1, STICKS_INACTIVE
	setvar VAR_FARFETCHD1_STICKS2, STICKS_INACTIVE
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd, _farfetchd1_run_right
	wait_movement
	goto_if_set FLAG_UNK_126, _0342
	npc_msg msg_0115_D36R0101_00036
	wait_button_or_walk_away
	closemsg
	setflag FLAG_UNK_126
_0342:
	releaseall
	end

_farfetchd1_bottom_left_caught:
	play_se SEQ_SE_DP_SELECT
	lockall
	play_cry SPECIES_FARFETCHD, 0
	npc_msg msg_0115_D36R0101_00003
	closemsg
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd, _walk_in_place_face_down
	wait_movement
	hide_person obj_D36R0101_tsure_poke_static_farfetchd
	npc_msg msg_0115_D36R0101_00037
	wait_button_or_walk_away
	closemsg
	setvar VAR_FARFETCHD1_STICKS1, STICKS_INACTIVE
	setvar VAR_FARFETCHD1_STICKS2, STICKS_INACTIVE
	setflag FLAG_HIDE_FARFETCHD_1_LOST
	setflag FLAG_FOUND_FIRST_FARFETCHD
	goto_if_set FLAG_FOUND_SECOND_FARFETCHD, _1207
	clearflag FLAG_HIDE_FARFETCHD_1_FOUND
	wait 20, VAR_SPECIAL_x8004
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_ILEX_FOREST, 0, 15, 65, DIR_NORTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	wait 5, VAR_SPECIAL_x8004
	npc_msg msg_0115_D36R0101_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_farfetchd1_top_right:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, DIR_EAST
	goto_if_ne _0403
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd, _farfetchd_run_down
	setvar VAR_FARFETCHD1_STICKS2, STICKS_ACTIVE
	setvar VAR_FARFETCHD1_STICKS1, STICKS_ACTIVE
	setvar FARFETCHD1_BOTTOM_RIGHT_FACING_UP, TRUE
	goto _0424

_0403:
	compare VAR_SPECIAL_RESULT, DIR_NORTH
	goto_if_ne _0424
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd, _farfetchd1_run_left
	setvar VAR_FARFETCHD1_STICKS1, STICKS_INACTIVE
	setvar VAR_FARFETCHD1_STICKS2, STICKS_INACTIVE
_0424:
	wait_movement
	releaseall
	end

_farfetchd1_bottom_right:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar FARFETCHD1_BOTTOM_RIGHT_FACING_UP, FALSE
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, DIR_EAST
	goto_if_ne _0463
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd, _farfetchd_run_up
	setvar VAR_FARFETCHD1_STICKS1, STICKS_INACTIVE
	setvar VAR_FARFETCHD1_STICKS2, STICKS_INACTIVE
	goto _0484

_0463:
	compare VAR_SPECIAL_RESULT, DIR_SOUTH
	goto_if_ne _0484
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd, _farfetchd1_run_left
	setvar VAR_FARFETCHD1_STICKS1, STICKS_ACTIVE
	setvar VAR_FARFETCHD1_STICKS2, STICKS_INACTIVE
_0484:
	wait_movement
	releaseall
	end

scr_seq_D36R0101_farfetchd1_sticks1:
	scrcmd_609
	lockall
	compare FARFETCHD1_BOTTOM_RIGHT_FACING_UP, TRUE
	goto_if_eq _farfetchd1_look_left
	setvar FARFETCHD1_BLIND_SPOT, TRUE
	setvar VAR_FARFETCHD1_STICKS1, STICKS_INACTIVE
	setvar VAR_FARFETCHD1_STICKS2, STICKS_ACTIVE
	get_person_coords obj_D36R0101_tsure_poke_static_farfetchd, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	compare FARFETCHD_X_COORD, 25
	goto_if_ne _04CE
	goto _sticks1_farfetchd1_left

_04B8:
	goto _sticks1_farfetchd1_left

_04CE:
	compare FARFETCHD_X_COORD, 32
	goto_if_ne _sticks1_farfetchd1_left
	goto _sticks1_farfetchd1_right

_sticks1_farfetchd1_left:
	get_person_coords obj_D36R0101_tsure_poke_static_farfetchd, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	compare FARFETCHD_Z_COORD, 52
	goto_if_ne _0502
	goto _sticks1_farfetchd1_top_left

_04FC:
	goto _sticks1_farfetchd1_right

_0502:
	compare FARFETCHD_Z_COORD, 62
	goto_if_ne _sticks1_farfetchd1_right
	goto _sticks1_farfetchd1_bottom_left

_sticks1_farfetchd1_right:
	get_person_coords obj_D36R0101_tsure_poke_static_farfetchd, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	compare FARFETCHD_Z_COORD, 52
	goto_if_ne _0536
	goto _sticks1_farfetchd1_top_right

_0530:
	goto _sticks1_farfetchd1_top_left

_0536:
	compare FARFETCHD_Z_COORD, 62
	goto_if_ne _sticks1_farfetchd1_top_left
	goto _sticks1_farfetchd1_bottom_right

_sticks1_farfetchd1_top_left:
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd, _exclaim_face_down
	wait_movement
	releaseall
	end

_sticks1_farfetchd1_bottom_left:
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd, _exclaim_face_down
	wait_movement
	goto_if_set FLAG_FARFETCHD_NOTICED_YOU, _skip_farfetchd_noticed_msg
	npc_msg msg_0115_D36R0101_00035
	wait_button_or_walk_away
	closemsg
	setflag FLAG_FARFETCHD_NOTICED_YOU
_skip_farfetchd_noticed_msg:
	releaseall
	end

_sticks1_farfetchd1_top_right:
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd, _exclaim_face_down
	wait_movement
	releaseall
	end

_sticks1_farfetchd1_bottom_right:
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd, _exclaim_face_left
	wait_movement
	releaseall
	end

scr_seq_D36R0101_farfetchd1_sticks2:
	scrcmd_609
	lockall
	compare FARFETCHD1_BOTTOM_RIGHT_FACING_UP, TRUE
	goto_if_eq _farfetchd1_look_left
	setvar VAR_FARFETCHD1_STICKS1, STICKS_ACTIVE
	setvar VAR_FARFETCHD1_STICKS2, STICKS_INACTIVE
	setvar FARFETCHD1_BLIND_SPOT, FALSE
	get_person_coords obj_D36R0101_tsure_poke_static_farfetchd, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	compare FARFETCHD_X_COORD, 25
	goto_if_ne _05DB
	goto _sticks2_farfetchd1_left

_05D5:
	goto _sticks2_farfetchd1_left

_05DB:
	compare FARFETCHD_X_COORD, 32
	goto_if_ne _sticks2_farfetchd1_left
	goto _sticks2_farfetchd1_right

_sticks2_farfetchd1_left:
	get_person_coords obj_D36R0101_tsure_poke_static_farfetchd, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	compare FARFETCHD_Z_COORD, 52
	goto_if_ne _060F
	goto _sticks2_farfetchd1_top_left

_0609:
	goto _sticks2_farfetchd1_right

_060F:
	compare FARFETCHD_Z_COORD, 62
	goto_if_ne _sticks2_farfetchd1_right
	goto _sticks2_farfetchd1_bottom_left

_sticks2_farfetchd1_right:
	get_person_coords obj_D36R0101_tsure_poke_static_farfetchd, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	compare FARFETCHD_Z_COORD, 52
	goto_if_ne _0643
	goto _sticks2_farfetchd1_top_right

_063D:
	goto _sticks2_farfetchd1_top_left

_0643:
	compare FARFETCHD_Z_COORD, 62
	goto_if_ne _sticks2_farfetchd1_top_left
	goto _sticks2_farfetchd1_bottom_right

_sticks2_farfetchd1_top_left:
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd, _exclaim_face_down
	wait_movement
	releaseall
	end

_sticks2_farfetchd1_bottom_left:
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd, _exclaim_face_right
	wait_movement
	releaseall
	end

_sticks2_farfetchd1_top_right:
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd, _exclaim_face_down
	wait_movement
	releaseall
	end

_sticks2_farfetchd1_bottom_right:
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd, _exclaim_face_left
	wait_movement
	releaseall
	end

_farfetchd1_look_left:
	setvar VAR_FARFETCHD1_STICKS1, STICKS_INACTIVE
	setvar VAR_FARFETCHD1_STICKS2, STICKS_INACTIVE
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd, _exclaim_face_left
	wait_movement
	releaseall
	end

scr_seq_D36R0101_farfetchd2:
	get_person_coords obj_D36R0101_tsure_poke_static_farfetchd_2, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	compare FARFETCHD_X_COORD, 41
	goto_if_ne _06C9
	goto _farfetchd2_left

_06C3:
	goto _farfetchd2_left

_06C9:
	compare FARFETCHD_X_COORD, 49
	goto_if_ne _farfetchd2_left
	goto _farfetchd2_right

_farfetchd2_left:
	setvar FARFETCHD2_BLIND_SPOT, FALSE
	get_person_coords obj_D36R0101_tsure_poke_static_farfetchd_2, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	compare FARFETCHD_Z_COORD, 54
	goto_if_ne _0703
	goto _farfetchd_top_left

_06FD:
	goto _farfetchd2_right

_0703:
	compare FARFETCHD_Z_COORD, 64
	goto_if_ne _farfetchd2_right
	goto _farfetchd2_bottom_left

_farfetchd2_right:
	get_person_coords obj_D36R0101_tsure_poke_static_farfetchd_2, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	compare FARFETCHD_Z_COORD, 54
	goto_if_ne _0737
	goto _farfetchd2_top_right

_0731:
	goto _farfetchd_top_left

_0737:
	compare FARFETCHD_Z_COORD, 64
	goto_if_ne _farfetchd_top_left
	goto _farfetchd2_bottom_right

_farfetchd_top_left:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, DIR_NORTH
	goto_if_ne _farfetchd2_top_left_flee_down
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _farfetchd2_run_right
	wait_movement
	setvar VAR_FARFETCHD2_STICKS1, STICKS_ACTIVE
	setvar VAR_FARFETCHD2_STICKS2, STICKS_ACTIVE
	setvar VAR_FARFETCHD2_STICKS3, STICKS_INACTIVE
	setvar VAR_FARFETCHD2_STICKS4, STICKS_INACTIVE
	goto _07BA

_farfetchd2_top_left_flee_down:
	compare VAR_SPECIAL_RESULT, DIR_WEST
	goto_if_ne _07BA
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _farfetchd_run_down
	wait_movement
	setvar VAR_FARFETCHD2_STICKS1, STICKS_INACTIVE
	setvar VAR_FARFETCHD2_STICKS2, STICKS_INACTIVE
	setvar VAR_FARFETCHD2_STICKS3, STICKS_ACTIVE
	setvar VAR_FARFETCHD2_STICKS4, STICKS_INACTIVE
_07BA:
	goto_if_set FLAG_UNK_126, _07D0
	npc_msg msg_0115_D36R0101_00036
	wait_button_or_walk_away
	closemsg
	setflag FLAG_UNK_126
_07D0:
	releaseall
	end

_farfetchd2_bottom_left:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, DIR_SOUTH
	goto_if_ne _farfetchd2_bottom_left_flee_up
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _farfetchd2_run_right
	setvar VAR_FARFETCHD2_STICKS1, STICKS_INACTIVE
	setvar VAR_FARFETCHD2_STICKS2, STICKS_INACTIVE
	setvar VAR_FARFETCHD2_STICKS3, STICKS_INACTIVE
	setvar VAR_FARFETCHD2_STICKS4, STICKS_INACTIVE
	goto _0840

_farfetchd2_bottom_left_flee_up:
	compare VAR_SPECIAL_RESULT, DIR_WEST
	goto_if_ne _0840
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _farfetchd_run_up
	setvar VAR_FARFETCHD2_STICKS1, STICKS_INACTIVE
	setvar VAR_FARFETCHD2_STICKS2, STICKS_INACTIVE
	setvar VAR_FARFETCHD2_STICKS3, STICKS_INACTIVE
	setvar VAR_FARFETCHD2_STICKS4, STICKS_ACTIVE
_0840:
	wait_movement
	releaseall
	end

_farfetchd2_top_right:
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, DIR_NORTH
	goto_if_ne _0863
	goto _farfetchd2_top_right_flee_left

_085D:
	goto _farfetchd2_top_right_flee_left

_0863:
	compare VAR_SPECIAL_RESULT, DIR_EAST
	goto_if_ne _farfetchd2_top_right_flee_left
	goto _farfetchd2_top_right_flee_down

_farfetchd2_top_right_flee_left:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_FARFETCHD2_STICKS1, STICKS_INACTIVE
	setvar VAR_FARFETCHD2_STICKS2, STICKS_INACTIVE
	setvar VAR_FARFETCHD2_STICKS3, STICKS_INACTIVE
	setvar VAR_FARFETCHD2_STICKS4, STICKS_INACTIVE
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _farfetchd2_run_left
	wait_movement
	releaseall
	end

_farfetchd2_top_right_flee_down:
	compare FARFETCHD2_BLIND_SPOT, TRUE
	goto_if_eq _farfetchd2_top_right_caught
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_FARFETCHD2_STICKS1, STICKS_INACTIVE
	setvar VAR_FARFETCHD2_STICKS2, STICKS_INACTIVE
	setvar VAR_FARFETCHD2_STICKS3, STICKS_ACTIVE
	setvar VAR_FARFETCHD2_STICKS4, STICKS_INACTIVE
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _farfetchd_run_down
	wait_movement
	releaseall
	end

_farfetchd2_top_right_caught:
	play_se SEQ_SE_DP_SELECT
	lockall
	play_cry SPECIES_FARFETCHD, 0
	npc_msg msg_0115_D36R0101_00003
	closemsg
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _walk_in_place_face_right
	wait_movement
	hide_person obj_D36R0101_tsure_poke_static_farfetchd_2
	npc_msg msg_0115_D36R0101_00037
	wait_button_or_walk_away
	closemsg
	call_if_unset FLAG_FOUND_FIRST_FARFETCHD, _097A
	setvar VAR_FARFETCHD2_STICKS1, STICKS_INACTIVE
	setvar VAR_FARFETCHD2_STICKS2, STICKS_INACTIVE
	setvar VAR_FARFETCHD2_STICKS3, STICKS_INACTIVE
	setvar VAR_FARFETCHD2_STICKS4, STICKS_INACTIVE
	setflag FLAG_HIDE_FARFETCHD_2_LOST
	setflag FLAG_FOUND_SECOND_FARFETCHD
	goto_if_set FLAG_FOUND_FIRST_FARFETCHD, _1207
	clearflag FLAG_HIDE_FARFETCHD_1_FOUND
	wait 20, VAR_SPECIAL_x8004
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_ILEX_FOREST, 0, 15, 65, DIR_NORTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	wait 5, VAR_SPECIAL_x8004
	npc_msg msg_0115_D36R0101_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_097A:
	setvar VAR_FARFETCHD1_STICKS1, STICKS_ACTIVE
	return

_farfetchd2_bottom_right:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar FARFETCHD2_BLIND_SPOT, FALSE
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, DIR_EAST
	goto_if_ne _farfetchd2_bottom_right_flee_left
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _farfetchd_run_up
	setvar VAR_FARFETCHD2_STICKS1, STICKS_ACTIVE
	setvar VAR_FARFETCHD2_STICKS2, STICKS_ACTIVE
	setvar VAR_FARFETCHD2_STICKS3, STICKS_INACTIVE
	setvar VAR_FARFETCHD2_STICKS4, STICKS_ACTIVE
	goto _09F4

_farfetchd2_bottom_right_flee_left:
	compare VAR_SPECIAL_RESULT, DIR_SOUTH
	goto_if_ne _09F4
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _farfetchd2_run_left
	setvar VAR_FARFETCHD2_STICKS1, STICKS_INACTIVE
	setvar VAR_FARFETCHD2_STICKS2, STICKS_INACTIVE
	setvar VAR_FARFETCHD2_STICKS3, STICKS_INACTIVE
	setvar VAR_FARFETCHD2_STICKS4, STICKS_INACTIVE
_09F4:
	wait_movement
	releaseall
	end

scr_seq_D36R0101_farfetchd2_sticks1:
	scrcmd_609
	lockall
	setvar FARFETCHD2_BLIND_SPOT, FALSE
	get_person_coords obj_D36R0101_tsure_poke_static_farfetchd_2, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	compare FARFETCHD_X_COORD, 41
	goto_if_ne _0A25
	goto _sticks1_farfetchd2_left

_0A1F:
	goto _sticks1_farfetchd2_left

_0A25:
	compare FARFETCHD_X_COORD, 49
	goto_if_ne _sticks1_farfetchd2_left
	goto _sticks1_farfetchd2_right

_sticks1_farfetchd2_left:
	get_person_coords obj_D36R0101_tsure_poke_static_farfetchd_2, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	compare FARFETCHD_Z_COORD, 54
	goto_if_ne _0A59
	goto _sticks1_farfetchd2_top_left

_0A53:
	goto _sticks1_farfetchd2_right

_0A59:
	compare FARFETCHD_Z_COORD, 64
	goto_if_ne _sticks1_farfetchd2_right
	goto _sticks1_farfetchd2_bottom_left

_sticks1_farfetchd2_right:
	get_person_coords obj_D36R0101_tsure_poke_static_farfetchd_2, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	compare FARFETCHD_Z_COORD, 54
	goto_if_ne _0A8D
	goto _sticks1_farfetchd2_top_right

_0A87:
	goto _sticks1_farfetchd2_top_left

_0A8D:
	compare FARFETCHD_Z_COORD, 64
	goto_if_ne _sticks1_farfetchd2_top_left
	goto _sticks1_farfetchd2_bottom_right

_sticks1_farfetchd2_top_left:
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _exclaim_face_right
	wait_movement
	releaseall
	end

_sticks1_farfetchd2_bottom_left:
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _exclaim_face_up
	wait_movement
	releaseall
	end

_sticks1_farfetchd2_top_right:
	setvar VAR_FARFETCHD2_STICKS1, STICKS_INACTIVE
	setvar VAR_FARFETCHD2_STICKS2, STICKS_ACTIVE
	setvar VAR_FARFETCHD2_STICKS3, STICKS_INACTIVE
	setvar VAR_FARFETCHD2_STICKS4, STICKS_ACTIVE
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _exclaim_face_up
	wait_movement
	releaseall
	end

_sticks1_farfetchd2_bottom_right:
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _exclaim_face_up
	wait_movement
	releaseall
	end

scr_seq_D36R0101_farfetchd2_sticks2:
	scrcmd_609
	lockall
	setvar FARFETCHD2_BLIND_SPOT, TRUE
	get_person_coords obj_D36R0101_tsure_poke_static_farfetchd_2, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	compare FARFETCHD_X_COORD, 41
	goto_if_ne _0B1B
	goto _sticks2_farfetchd2_left

_0B15:
	goto _sticks2_farfetchd2_left

_0B1B:
	compare FARFETCHD_X_COORD, 49
	goto_if_ne _sticks2_farfetchd2_left
	goto _sticks2_farfetchd2_right

_sticks2_farfetchd2_left:
	get_person_coords obj_D36R0101_tsure_poke_static_farfetchd_2, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	compare FARFETCHD_Z_COORD, 54
	goto_if_ne _0B4F
	goto _sticks2_farfetchd2_top_left

_0B49:
	goto _sticks2_farfetchd2_right

_0B4F:
	compare FARFETCHD_Z_COORD, 64
	goto_if_ne _sticks2_farfetchd2_right
	goto _sticks2_farfetchd2_bottom_left

_sticks2_farfetchd2_right:
	get_person_coords obj_D36R0101_tsure_poke_static_farfetchd_2, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	compare FARFETCHD_Z_COORD, 54
	goto_if_ne _0B83
	goto _sticks2_farfetchd2_top_right

_0B7D:
	goto _sticks2_farfetchd2_top_left

_0B83:
	compare FARFETCHD_Z_COORD, 64
	goto_if_ne _sticks2_farfetchd2_top_left
	goto _sticks2_farfetchd2_bottom_right

_sticks2_farfetchd2_top_left:
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _exclaim_face_right
	wait_movement
	releaseall
	end

_sticks2_farfetchd2_bottom_left:
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _exclaim_face_right
	wait_movement
	releaseall
	end

_sticks2_farfetchd2_top_right:
	setvar VAR_FARFETCHD2_STICKS1, STICKS_ACTIVE
	setvar VAR_FARFETCHD2_STICKS2, STICKS_INACTIVE
	setvar VAR_FARFETCHD2_STICKS3, STICKS_INACTIVE
	setvar VAR_FARFETCHD2_STICKS4, STICKS_ACTIVE
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _exclaim_face_right
	wait_movement
	releaseall
	end

_sticks2_farfetchd2_bottom_right:
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _exclaim_face_up
	wait_movement
	releaseall
	end

scr_seq_D36R0101_farfetchd2_sticks3:
	scrcmd_609
	lockall
	setvar FARFETCHD2_BLIND_SPOT, FALSE
	get_person_coords obj_D36R0101_tsure_poke_static_farfetchd_2, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	compare FARFETCHD_X_COORD, 41
	goto_if_ne _0C11
	goto _sticks3_farfetchd2_left

_0C0B:
	goto _sticks3_farfetchd2_left

_0C11:
	compare FARFETCHD_X_COORD, 49
	goto_if_ne _sticks3_farfetchd2_left
	goto _sticks3_farfetchd2_right

_sticks3_farfetchd2_left:
	get_person_coords obj_D36R0101_tsure_poke_static_farfetchd_2, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	compare FARFETCHD_Z_COORD, 54
	goto_if_ne _0C45
	goto _sticks3_farfetchd2_top_left

_0C3F:
	goto _sticks3_farfetchd2_right

_0C45:
	compare FARFETCHD_Z_COORD, 64
	goto_if_ne _sticks3_farfetchd2_right
	goto _sticks3_farfetchd2_bottom_left

_sticks3_farfetchd2_right:
	get_person_coords obj_D36R0101_tsure_poke_static_farfetchd_2, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	compare FARFETCHD_Z_COORD, 54
	goto_if_ne _0C79
	goto _sticks3_farfetchd2_top_right

_0C73:
	goto _sticks3_farfetchd2_top_left

_0C79:
	compare FARFETCHD_Z_COORD, 64
	goto_if_ne _sticks3_farfetchd2_top_left
	goto _sticks3_farfetchd2_bottom_right

_sticks3_farfetchd2_top_left:
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _exclaim_face_down
	wait_movement
	releaseall
	end

_sticks3_farfetchd2_bottom_left:
	setvar VAR_FARFETCHD2_STICKS3, STICKS_INACTIVE
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _exclaim_face_right
	wait_movement
	releaseall
	end

_sticks3_farfetchd2_top_right:
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _exclaim_face_down
	wait_movement
	releaseall
	end

_sticks3_farfetchd2_bottom_right:
	setvar VAR_FARFETCHD2_STICKS3, STICKS_INACTIVE
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _exclaim_face_left
	wait_movement
	releaseall
	end

scr_seq_D36R0101_farfetchd2_sticks4:
	scrcmd_609
	lockall
	setvar FARFETCHD2_BLIND_SPOT, FALSE
	get_person_coords obj_D36R0101_tsure_poke_static_farfetchd_2, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	compare FARFETCHD_X_COORD, 41
	goto_if_ne _0CFB
	goto _sticks4_farfetchd2_left

_0CF5:
	goto _sticks4_farfetchd2_left

_0CFB:
	compare FARFETCHD_X_COORD, 49
	goto_if_ne _sticks4_farfetchd2_left
	goto _sticks4_farfetchd2_right

_sticks4_farfetchd2_left:
	get_person_coords obj_D36R0101_tsure_poke_static_farfetchd_2, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	compare FARFETCHD_Z_COORD, 54
	goto_if_ne _0D2F
	goto _sticks4_farfetchd2_top_left

_0D29:
	goto _sticks4_farfetchd2_right

_0D2F:
	compare FARFETCHD_Z_COORD, 64
	goto_if_ne _sticks4_farfetchd2_right
	goto _sticks4_farfetchd2_bottom_left

_sticks4_farfetchd2_right:
	get_person_coords obj_D36R0101_tsure_poke_static_farfetchd_2, FARFETCHD_X_COORD, FARFETCHD_Z_COORD
	compare FARFETCHD_Z_COORD, 54
	goto_if_ne _0D63
	goto _sticks4_farfetchd2_top_right

_0D5D:
	goto _sticks4_farfetchd2_top_left

_0D63:
	compare FARFETCHD_Z_COORD, 64
	goto_if_ne _sticks4_farfetchd2_top_left
	goto _sticks4_farfetchd2_bottom_right

_sticks4_farfetchd2_top_left:
	setvar VAR_FARFETCHD2_STICKS4, STICKS_INACTIVE
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _exclaim_face_right
	wait_movement
	releaseall
	end

_sticks4_farfetchd2_bottom_left:
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _exclaim_face_up
	wait_movement
	releaseall
	end

_sticks4_farfetchd2_top_right:
	setvar VAR_FARFETCHD2_STICKS1, STICKS_ACTIVE
	setvar VAR_FARFETCHD2_STICKS2, STICKS_ACTIVE
	setvar VAR_FARFETCHD2_STICKS4, STICKS_INACTIVE
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _exclaim_face_left
	wait_movement
	releaseall
	end

_sticks4_farfetchd2_bottom_right:
	apply_movement obj_D36R0101_tsure_poke_static_farfetchd_2, _exclaim_face_up
	wait_movement
	releaseall
	end

	.balign 4, 0
_exclaim_face_down:
	FaceSouth
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_exclaim_face_up:
	FaceNorth
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_exclaim_face_left:
	FaceWest
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_exclaim_face_right:
	FaceEast
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_farfetchd_run_up:
	EmoteExclamationMark
	WalkFastNorth 10
	FaceSouth
	EndMovement

	.balign 4, 0
_farfetchd_run_down:
	EmoteExclamationMark
	WalkFastSouth 10
	FaceNorth
	EndMovement

	.balign 4, 0
_farfetchd1_run_right:
	EmoteExclamationMark
	WalkFastEast 7
	FaceWest
	EndMovement

	.balign 4, 0
_farfetchd1_run_left:
	EmoteExclamationMark
	WalkFastWest 7
	FaceEast
	EndMovement

	.balign 4, 0
_farfetchd2_run_right:
	EmoteExclamationMark
	WalkFastEast 8
	FaceWest
	EndMovement

	.balign 4, 0
_farfetchd2_run_left:
	EmoteExclamationMark
	WalkFastWest 8
	FaceEast
	EndMovement

	.balign 4, 0
_walk_in_place_face_down:
	WalkOnSpotFastSouth 5
	EndMovement

	.balign 4, 0
_walk_in_place_face_right:
	WalkOnSpotFastEast 5
	EndMovement

scr_seq_D36R0101_016:
	scrcmd_609
	lockall
	apply_movement obj_player, _0EC4
	wait_movement
	apply_movement obj_D36R0101_gsbigman, _0ED0
	wait_movement
	play_se SEQ_SE_DP_KI_GASYAN
	screen_shake 0, 2, 10, 5
	apply_movement obj_D36R0101_gsbigman, _0ED8
	wait_movement
	apply_movement obj_D36R0101_gsbigman, _0ED0
	wait_movement
	play_se SEQ_SE_DP_KI_GASYAN
	screen_shake 0, 2, 10, 5
	apply_movement obj_D36R0101_gsbigman, _0ED8
	wait_movement
	setvar VAR_UNK_40EA, 1
	releaseall
	end

	.balign 4, 0
_0EC4:
	EmoteExclamationMark
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0ED0:
	JumpNearFastNorth
	EndMovement

	.balign 4, 0
_0ED8:
	LockDir
	WalkSlowSouth
	UnlockDir
	EndMovement

scr_seq_D36R0101_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0115_D36R0101_00011
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _1086
	npc_msg msg_0115_D36R0101_00014
	closemsg
_0F0B:
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	party_select_ui
	get_party_selection VAR_SPECIAL_RESULT
	restore_overworld
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	compare VAR_SPECIAL_RESULT, 255
	goto_if_eq _1093
	get_partymon_species VAR_SPECIAL_RESULT, VAR_SPECIAL_x8005
	setorcopyvar VAR_SPECIAL_x8006, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_x8005, 0
	goto_if_eq _10A0
	mon_has_move VAR_SPECIAL_RESULT, MOVE_HEADBUTT, VAR_SPECIAL_x8006
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _10E1
	scrcmd_656 VAR_SPECIAL_x8006, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0F84
	npc_msg msg_0115_D36R0101_00016
	closemsg
	goto _0F0B

_0F84:
	count_mon_moves VAR_SPECIAL_x8002, VAR_SPECIAL_x8006
	compare VAR_SPECIAL_x8002, 3
	goto_if_le _1041
	touchscreen_menu_hide
_0F99:
	bufferpartymonnick 0, VAR_SPECIAL_x8006
	npc_msg msg_0115_D36R0101_00017
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _10C7
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	pokemon_summary_screen 1, VAR_SPECIAL_x8006, 29
	get_move_selection 1, VAR_SPECIAL_x8001
	restore_overworld
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	compare VAR_SPECIAL_x8001, 4
	goto_if_eq _10AB
	buffer_party_mon_move_name 1, VAR_SPECIAL_x8006, VAR_SPECIAL_x8001
	npc_msg msg_0115_D36R0101_00018
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _10C7
	set_mon_move VAR_SPECIAL_x8006, VAR_SPECIAL_x8001, MOVE_HEADBUTT
	npc_msg msg_0115_D36R0101_00020
	play_se SEQ_SE_DP_KON
	wait_se SEQ_SE_DP_KON
	wait 30, VAR_SPECIAL_RESULT
	npc_msg msg_0115_D36R0101_00024
	wait 32, VAR_SPECIAL_RESULT
	npc_msg msg_0115_D36R0101_00025
	play_fanfare SEQ_ME_LVUP
	wait_fanfare
	wait 16, VAR_SPECIAL_RESULT
	play_cry VAR_SPECIAL_x8005, 0
	goto _1079

_1041:
	bufferpartymonnick 0, VAR_SPECIAL_x8006
	set_mon_move VAR_SPECIAL_x8006, VAR_SPECIAL_x8002, MOVE_HEADBUTT
	npc_msg msg_0115_D36R0101_00021
	wait 30, VAR_SPECIAL_RESULT
	npc_msg msg_0115_D36R0101_00026
	play_fanfare SEQ_ME_LVUP
	wait_fanfare
	wait 32, VAR_SPECIAL_RESULT
	play_cry VAR_SPECIAL_x8005, 0
	npc_msg msg_0115_D36R0101_00022
	wait_button_or_walk_away
	closemsg
	touchscreen_menu_show
	releaseall
	end

_1079:
	npc_msg msg_0115_D36R0101_00022
	wait_button_or_walk_away
	closemsg
	touchscreen_menu_show
	releaseall
	end

_1086:
	npc_msg msg_0115_D36R0101_00013
	wait_button_or_walk_away
	closemsg
	touchscreen_menu_show
	releaseall
	end

_1093:
	npc_msg msg_0115_D36R0101_00013
	wait_button_or_walk_away
	closemsg
	touchscreen_menu_show
	releaseall
	end

_10A0:
	npc_msg msg_0115_D36R0101_00015
	closemsg
	goto _0F0B

_10AB:
	npc_msg msg_0115_D36R0101_00019
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0F99
	goto _1086

_10C7:
	npc_msg msg_0115_D36R0101_00019
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0F99
	goto _1086

_10E1:
	buffer_mon_species_name 0, VAR_SPECIAL_x8006
	npc_msg msg_0115_D36R0101_00023
	closemsg
	goto _0F0B
	end

scr_seq_D36R0101_010:
	goto_if_set FLAG_FOUND_FIRST_FARFETCHD, _1104
	goto _1115

_1104:
	goto_if_set FLAG_FOUND_SECOND_FARFETCHD, _1126
	goto _1139

_1115:
	goto_if_set FLAG_FOUND_SECOND_FARFETCHD, _1139
	goto _114C

_1126:
	simple_npc_msg msg_0115_D36R0101_00002
	end

_1139:
	simple_npc_msg msg_0115_D36R0101_00001
	end

_114C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0115_D36R0101_00000
	wait_button_or_walk_away
	closemsg
	setvar VAR_UNK_40F4, 0
	releaseall
	end

scr_seq_D36R0101_017:
	scrcmd_609
	lockall
	apply_movement obj_D36R0101_gsboy1, _118C
	apply_movement obj_player, _1194
	wait_movement
	npc_msg msg_0115_D36R0101_00000
	wait_button_or_walk_away
	closemsg
	setvar VAR_UNK_40F4, 0
	releaseall
	end

	.balign 4, 0
_118C:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_1194:
	Delay8 2
	FaceNorth
	EndMovement

scr_seq_D36R0101_011:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_GOT_HM01, _11F2
	npc_msg msg_0115_D36R0101_00006
	goto_if_no_item_space ITEM_HM01, 1, _11FD
	callstd std_give_item_verbose
	setflag FLAG_GOT_HM01
	clearflag FLAG_UNK_1AE
	clearflag FLAG_UNK_1AC
	npc_msg msg_0115_D36R0101_00008
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_11F2:
	npc_msg msg_0115_D36R0101_00010
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_11FD:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

_1207:
	clearflag FLAG_HIDE_ILEX_CUT_MASTER
	show_person obj_D36R0101_gsfighter
	clearflag FLAG_HIDE_FARFETCHD_2_FOUND
	wait 20, VAR_SPECIAL_x8004
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_ILEX_FOREST, 0, 15, 65, DIR_NORTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	wait 5, VAR_SPECIAL_x8004
	npc_msg msg_0115_D36R0101_00002
	wait_button_or_walk_away
	closemsg
	apply_movement obj_D36R0101_gsfighter, _12EC
	apply_movement obj_player, _12F8
	wait_movement
	goto_if_set FLAG_GOT_HM01, _12BE
	npc_msg msg_0115_D36R0101_00006
	goto_if_no_item_space ITEM_HM01, 1, _12C9
	callstd std_give_item_verbose
	setflag FLAG_HIDE_ILEX_CUT_MASTER
	setflag FLAG_HIDE_ILEX_APPRENTICE
	setflag FLAG_HIDE_FARFETCHD_1_LOST
	setflag FLAG_HIDE_FARFETCHD_2_LOST
	setflag FLAG_HIDE_FARFETCHD_1_FOUND
	setflag FLAG_HIDE_FARFETCHD_2_FOUND
	setflag FLAG_GOT_HM01
	clearflag FLAG_UNK_1AE
	clearflag FLAG_UNK_1AC
	npc_msg msg_0115_D36R0101_00008
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_12BE:
	npc_msg msg_0115_D36R0101_00010
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_12C9:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_D36R0101_014:
	play_cry SPECIES_FARFETCHD, 0
	simple_npc_msg msg_0115_D36R0101_00004
	end

	.balign 4, 0
_12EC:
	WalkNormalNorth 10
	WalkNormalEast 3
	EndMovement

	.balign 4, 0
_12F8:
	Delay8 12
	FaceWest
	EndMovement

scr_seq_D36R0101_015:
	scrcmd_609
	lockall
	callstd std_play_kimono_girl_music
	apply_movement obj_D36R0101_dancer, _1478
	wait_movement
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	compare VAR_SPECIAL_x8004, 40
	goto_if_ne _1337
	apply_movement obj_D36R0101_dancer, _1484
	goto _133F

_1337:
	apply_movement obj_D36R0101_dancer, _1494
_133F:
	wait_movement
	npc_msg msg_0115_D36R0101_00029
	closemsg
	apply_movement obj_D36R0101_dancer, _14A4
	wait_movement
	npc_msg msg_0115_D36R0101_00030
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _1371
	npc_msg msg_0115_D36R0101_00031
	goto _1374

_1371:
	npc_msg msg_0115_D36R0101_00032
_1374:
	closemsg
	get_party_lead_alive VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 50
	goto_if_eq _13D5
	compare VAR_TEMP_x4001, 51
	goto_if_eq _13D5
	release obj_partner_poke
	compare VAR_SPECIAL_x8004, 40
	goto_if_ne _13C1
	apply_movement obj_player, _14E8
	apply_movement obj_partner_poke, _14FC
	goto _13C9

_13C1:
	apply_movement obj_partner_poke, _1518
_13C9:
	wait_movement
	lock obj_partner_poke
	goto _140A

_13D5:
	release obj_partner_poke
	compare VAR_SPECIAL_x8004, 40
	goto_if_ne _13FC
	apply_movement obj_player, _14E8
	apply_movement obj_partner_poke, _1538
	goto _1404

_13FC:
	apply_movement obj_partner_poke, _1550
_1404:
	wait_movement
	lock obj_partner_poke
_140A:
	compare VAR_SPECIAL_x8004, 40
	goto_if_ne _1425
	apply_movement obj_D36R0101_dancer, _156C
	goto _142D

_1425:
	apply_movement obj_D36R0101_dancer, _1574
_142D:
	wait_movement
	npc_msg msg_0115_D36R0101_00033
	closemsg
	apply_movement obj_D36R0101_dancer, _157C
	wait_movement
	npc_msg msg_0115_D36R0101_00034
	closemsg
	apply_movement obj_D36R0101_dancer, _159C
	wait_movement
	hide_person obj_D36R0101_dancer
	setflag FLAG_UNK_23D
	callstd std_fade_end_kimono_girl_music
	release obj_partner_poke
	apply_movement obj_partner_poke, _1584
	wait_movement
	lock obj_partner_poke
	releaseall
	setvar VAR_UNK_40E9, 1
	end

	.balign 4, 0
_1478:
	EmoteExclamationMark
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_1484:
	WalkNormalSouth
	WalkNormalEast 2
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_1494:
	WalkNormalSouth
	WalkNormalEast 3
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_14A4:
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
	FaceEast
	Delay2
	FaceSouth
	Delay2
	EndMovement

	.balign 4, 0
_14E8:
	FaceWest
	LockDir
	WalkNormalEast
	UnlockDir
	EndMovement

	.balign 4, 0
_14FC:
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 2
	WalkNormalWest 3
	WalkOnSpotNormalEast
	JumpOnSpotFastEast 3
	EndMovement

	.balign 4, 0
_1518:
	WalkNormalWest
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 2
	WalkNormalWest 3
	WalkOnSpotNormalEast
	JumpOnSpotFastEast 3
	EndMovement

	.balign 4, 0
_1538:
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 2
	WalkNormalWest 3
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_1550:
	WalkNormalWest
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 2
	WalkNormalWest 3
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_156C:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_1574:
	WalkNormalWest
	EndMovement

	.balign 4, 0
_157C:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_1584:
	WalkNormalEast 3
	WalkNormalSouth 2
	WalkNormalEast
	WalkNormalSouth
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_159C:
	WalkNormalWest 2
	WalkNormalNorth 2
	WalkNormalWest 6
	EndMovement

scr_seq_D36R0101_018:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _16D8
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _16EC
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, DIR_NORTH
	goto_if_ne _1625
	apply_movement obj_player, _1700
	apply_movement obj_D36R0101_gsmiddleman1, _174C
	goto _1677

_1625:
	compare VAR_SPECIAL_RESULT, DIR_SOUTH
	goto_if_ne _1640
	apply_movement obj_player, _1718
	goto _1677

_1640:
	compare VAR_SPECIAL_RESULT, DIR_EAST
	goto_if_ne _1663
	apply_movement obj_player, _1738
	apply_movement obj_D36R0101_gsmiddleman1, _174C
	goto _1677

_1663:
	stop_se SEQ_SE_GS_N_SESERAGI
	apply_movement obj_player, _1724
	apply_movement obj_D36R0101_gsmiddleman1, _174C
_1677:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _169E
	apply_movement obj_partner_poke, _1758
	wait_movement
_169E:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 8
	lockall
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	clearflag FLAG_UNK_189
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 2
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_16D8:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 5
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_16EC:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 3
	wait_button_or_walk_away
	closemsg
	releaseall
	end

	.balign 4, 0
_1700:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_1718:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_1724:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_1738:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_174C:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_1758:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_D36R0101_012:
	player_on_bike_check VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _1803
	compare VAR_UNK_412B, 2
	goto_if_ge _17C1
	compare VAR_UNK_412B, 1
	goto_if_eq _1803
	get_party_lead_alive VAR_TEMP_x4000
	follower_poke_is_event_trigger EVENT_SPIKY_EARED_PICHU, VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 0
	goto_if_ne _17B7
	goto _17C1

_17B1:
	goto _17C1

_17B7:
	clearflag FLAG_HIDE_ILEX_FOREST_SPIKY_EAR_PICHU
	goto _1816

_17C1:
	compare VAR_UNK_40FE, 4
	goto_if_ge _1803
	goto_if_unset FLAG_BEAT_RADIO_TOWER_ROCKETS, _1803
	get_party_lead_alive VAR_TEMP_x4006
	follower_poke_is_event_trigger EVENT_CELEBI, VAR_TEMP_x4006, VAR_TEMP_x4007
	compare VAR_TEMP_x4007, 0
	goto_if_ne _17FD
	goto _1803

_17F7:
	goto _1803

_17FD:
	goto _1F48

_1803:
	simple_npc_msg msg_0115_D36R0101_00028
	end

_1816:
	scrcmd_609
	lockall
	stop_bgm 0
	clearflag FLAG_HIDE_ILEX_FOREST_SPIKY_EAR_PICHU
	show_person obj_D36R0101_tsure_poke_static_pichu_spiky
	apply_movement obj_D36R0101_tsure_poke_static_pichu_spiky, _1C44
	wait_movement
	play_cry SPECIES_PICHU, 0
	wait_cry
	apply_movement obj_player, _1C58
	wait_movement
	callstd std_play_pichu_music
	apply_movement obj_D36R0101_tsure_poke_static_pichu_spiky, _1C64
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_player, _1C8C
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	npc_msg msg_0115_D36R0101_00038
	closemsg
	apply_movement obj_partner_poke, _1CB4
	wait_movement
	apply_movement obj_D36R0101_tsure_poke_static_pichu_spiky, _1CC4
	wait_movement
	apply_movement obj_partner_poke, _1CF8
	wait_movement
	apply_movement obj_D36R0101_tsure_poke_static_pichu_spiky, _1D08
	apply_movement obj_partner_poke, _1D2C
	wait_movement
	clearflag FLAG_HIDE_ILEX_FOREST_OLD_MAN
	show_person obj_D36R0101_gsoldman1
	apply_movement obj_D36R0101_gsoldman1, _1DE0
	apply_movement obj_D36R0101_tsure_poke_static_pichu_spiky, _1D48
	apply_movement obj_partner_poke, _1DA4
	wait_movement
	apply_movement obj_player, _1E88
	wait_movement
	npc_msg msg_0115_D36R0101_00046
	closemsg
	apply_movement obj_D36R0101_gsoldman1, _1DF4
	wait_movement
	npc_msg msg_0115_D36R0101_00047
	closemsg
	apply_movement obj_D36R0101_gsoldman1, _1E00
	apply_movement obj_D36R0101_tsure_poke_static_pichu_spiky, _1E10
	apply_movement obj_player, _1ED0
	wait_movement
	npc_msg msg_0115_D36R0101_00048
	closemsg
	apply_movement obj_D36R0101_tsure_poke_static_pichu_spiky, _1E20
	apply_movement obj_partner_poke, _1E2C
	wait_movement
	npc_msg msg_0115_D36R0101_00049
	closemsg
	apply_movement obj_partner_poke, _1E38
	wait_movement
	apply_movement obj_D36R0101_tsure_poke_static_pichu_spiky, _1E40
	wait_movement
	apply_movement obj_partner_poke, _1E48
	wait_movement
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_player, _1E74
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	npc_msg msg_0115_D36R0101_00039
	play_cry SPECIES_PICHU, 0
	npc_msg msg_0115_D36R0101_00043
	wait_cry
	closemsg
	call _1987
	compare VAR_SPECIAL_x8004, 1
	call_if_ge _1AFB
	compare VAR_SPECIAL_x8004, 0
	call_if_eq _19AC
	releaseall
	end

_1987:
	get_party_count VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 6
	goto_if_lt _19A4
	setvar VAR_SPECIAL_x8004, 1
	goto _19AA

_19A4:
	setvar VAR_SPECIAL_x8004, 0
_19AA:
	return

_19AC:
	npc_msg msg_0115_D36R0101_00052
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_player, _1EB4
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
_19CF:
	get_player_facing VAR_TEMP_x4005
	compare VAR_TEMP_x4005, 3
	goto_if_ne _19EE
	apply_movement obj_D36R0101_gsoldman1, _1E90
	goto _19F6

_19EE:
	apply_movement obj_D36R0101_gsoldman1, _1E98
_19F6:
	wait_movement
	play_fanfare SEQ_ME_ITEM
	buffer_players_name 0
	npc_msg msg_0115_D36R0101_00044
	wait_fanfare
	npc_msg msg_0115_D36R0101_00053
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	compare VAR_TEMP_x4005, 3
	goto_if_ne _1A2C
	apply_movement obj_player, _1ED8
	goto _1A34

_1A2C:
	apply_movement obj_player, _1EE4
_1A34:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	compare VAR_TEMP_x4008, 0
	goto_if_ne _1A51
	callstd std_fade_end_pichu_music
_1A51:
	give_spiky_ear_pichu
	hide_person obj_D36R0101_tsure_poke_static_pichu_spiky
	setvar VAR_UNK_412B, 2
	play_fanfare SEQ_ME_SHINKAOME
	npc_msg msg_0115_D36R0101_00040
	wait_fanfare
	touchscreen_menu_hide
	npc_msg msg_0115_D36R0101_00045
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _1AC5
	closemsg
	get_party_count VAR_TEMP_x4009
	subvar VAR_TEMP_x4009, 1
	setvar VAR_TEMP_x400A, 0
	nop_var_490 VAR_TEMP_x4009
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	nickname_input VAR_TEMP_x4009, VAR_TEMP_x400A
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	compare VAR_TEMP_x400A, 1
	goto_if_eq _1AC5
	bufferpartymonnick 0, VAR_TEMP_x4009
	npc_msg msg_0115_D36R0101_00054
_1AC5:
	npc_msg msg_0115_D36R0101_00051
	closemsg
	touchscreen_menu_show
	compare VAR_TEMP_x4005, 3
	goto_if_ne _1AE7
	apply_movement obj_D36R0101_gsoldman1, _1E64
	goto _1AEF

_1AE7:
	apply_movement obj_D36R0101_gsoldman1, _1E50
_1AEF:
	wait_movement
	hide_person obj_D36R0101_gsoldman1
	setflag FLAG_HIDE_ILEX_FOREST_OLD_MAN
	return

_1AFB:
	npc_msg msg_0115_D36R0101_00050
	wait_button_or_walk_away
	closemsg
	compare VAR_TEMP_x4008, 0
	goto_if_ne _1B13
	callstd std_fade_end_pichu_music
_1B13:
	setvar VAR_UNK_412B, 1
	return

scr_seq_D36R0101_019:
	scrcmd_609
	lockall
	setvar VAR_TEMP_x4008, 1
	get_player_facing VAR_TEMP_x4005
	compare VAR_TEMP_x4005, 3
	goto_if_ne _1B44
	apply_movement obj_D36R0101_tsure_poke_static_pichu_spiky, _1EF0
	goto _1B67

_1B44:
	compare VAR_TEMP_x4005, 2
	goto_if_ne _1B5F
	apply_movement obj_D36R0101_tsure_poke_static_pichu_spiky, _1EF8
	goto _1B67

_1B5F:
	apply_movement obj_D36R0101_tsure_poke_static_pichu_spiky, _1F00
_1B67:
	wait_movement
	play_cry SPECIES_PICHU, 0
	npc_msg msg_0115_D36R0101_00043
	wait_cry
	closemsg
	call _1987
	compare VAR_SPECIAL_x8004, 1
	goto_if_ge _1C36
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	get_player_facing VAR_TEMP_x4005
	compare VAR_TEMP_x4005, 3
	goto_if_ne _1BB2
	apply_movement obj_D36R0101_gsoldman1, _1E90
	goto _1BD5

_1BB2:
	compare VAR_TEMP_x4005, 2
	goto_if_ne _1BCD
	apply_movement obj_D36R0101_gsoldman1, _1E98
	goto _1BD5

_1BCD:
	apply_movement obj_D36R0101_gsoldman1, _1EA0
_1BD5:
	wait_movement
	npc_msg msg_0115_D36R0101_00052
	closemsg
	get_player_facing VAR_TEMP_x4005
	compare VAR_TEMP_x4005, 3
	goto_if_ne _1BFB
	apply_movement obj_player, _1EA8
	goto _1C1E

_1BFB:
	compare VAR_TEMP_x4005, 2
	goto_if_ne _1C16
	apply_movement obj_player, _1EB4
	goto _1C1E

_1C16:
	apply_movement obj_player, _1EC0
_1C1E:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	call _19CF
	goto _1C3D

_1C36:
	npc_msg msg_0115_D36R0101_00042
	wait_button_or_walk_away
	closemsg
_1C3D:
	releaseall
	end

	.balign 4, 0
_1C44:
	LockDir
	JumpFarEast
	UnlockDir
	JumpOnSpotFastSouth 2
	EndMovement

	.balign 4, 0
_1C58:
	EmoteExclamationMark
	Delay8
	EndMovement

	.balign 4, 0
_1C64:
	WalkFastSouth 7
	JumpOnSpotFastWest
	WalkFastWest 4
	WalkFastNorth 4
	WalkFastEast 4
	WalkFastSouth 4
	WalkFastWest 2
	FaceNorth
	JumpOnSpotFastNorth 2
	EndMovement

	.balign 4, 0
_1C8C:
	Delay8 3
	FaceSouth
	Delay8
	WalkNormalSouth 2
	WalkOnSpotNormalEast
	Delay16
	WalkOnSpotNormalWest
	Delay16
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_1CB4:
	WalkNormalEast
	WalkNormalSouth
	FaceSouth
	EndMovement

	.balign 4, 0
_1CC4:
	LockDir
	JumpNearFastEast
	UnlockDir
	JumpOnSpotFastNorth
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
_1CF8:
	EmoteExclamationMark
	Delay8
	JumpOnSpotFastSouth 2
	EndMovement

	.balign 4, 0
_1D08:
	LockDir
	JumpNearFastSouth
	UnlockDir
	Delay16
	JumpOnSpotFastWest
	WalkFastWest 7
	WalkFastNorth 13
	WalkNormalEast
	EndMovement

	.balign 4, 0
_1D2C:
	Delay16 2
	WalkFastSouth
	WalkFastWest 6
	JumpOnSpotFastNorth
	WalkFastNorth 13
	WalkFastWest
	EndMovement

	.balign 4, 0
_1D48:
	WalkFastSouth 12
	WalkFastEast 6
	WalkFastNorth 4
	WalkFastWest 3
	WalkFastSouth 4
	WalkFastEast 3
	LockDir
	JumpNearFastWest
	UnlockDir
	FaceSouth 6
	LockDir
	WalkSlowWest
	UnlockDir
	FaceWest 6
	FaceNorth 6
	LockDir
	WalkSlowEast
	UnlockDir
	FaceEast 6
	LockDir
	WalkSlowWest
	UnlockDir
	EndMovement

	.balign 4, 0
_1DA4:
	WalkFastSouth 13
	WalkFastEast 7
	JumpOnSpotFastNorth
	JumpOnSpotFastWest
	Delay8 4
	LockDir
	JumpNearFastEast
	UnlockDir
	FaceSouth 6
	FaceEast 6
	FaceNorth 6
	FaceWest 6
	Delay32
	WalkNormalWest
	EndMovement

	.balign 4, 0
_1DE0:
	Delay16 5
	WalkSlowSouth 10
	WalkSlowEast 4
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_1DF4:
	WalkOnSpotNormalNorth
	Delay16
	EndMovement

	.balign 4, 0
_1E00:
	WalkOnSpotNormalSouth
	Delay16
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_1E10:
	Delay16
	WalkOnSpotNormalNorth
	Delay16
	EndMovement

	.balign 4, 0
_1E20:
	JumpOnSpotFastNorth
	JumpOnSpotFastEast
	EndMovement

	.balign 4, 0
_1E2C:
	JumpNearFastWest
	JumpOnSpotFastWest 2
	EndMovement

	.balign 4, 0
_1E38:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_1E40:
	JumpOnSpotFastEast 2
	EndMovement

	.balign 4, 0
_1E48:
	JumpOnSpotFastNorth 2
	EndMovement

	.balign 4, 0
_1E50:
	WalkOnSpotNormalEast
	Delay16
	WalkSlowWest 4
	WalkSlowNorth 10
	EndMovement

	.balign 4, 0
_1E64:
	WalkSlowSouth 2
	WalkSlowWest 4
	WalkSlowNorth 12
	EndMovement

	.balign 4, 0
_1E74:
	EmoteExclamationMark
	Delay8
	WalkNormalSouth
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_1E88:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_1E90:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_1E98:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_1EA0:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_1EA8:
	WalkNormalNorth
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_1EB4:
	WalkNormalNorth
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_1EC0:
	WalkNormalEast
	WalkNormalNorth 2
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_1ED0:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_1ED8:
	WalkNormalSouth
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_1EE4:
	WalkNormalSouth
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_1EF0:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_1EF8:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_1F00:
	WalkOnSpotNormalSouth
	EndMovement

scr_seq_D36R0101_020:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4008, 1
	call _1987
	compare VAR_SPECIAL_x8004, 0
	goto_if_ne _1F35
	call _1F3F
	goto _1F3B

_1F35:
	call _1AFB
_1F3B:
	releaseall
	end

_1F3F:
	npc_msg msg_0115_D36R0101_00055
	wait_button_or_walk_away
	closemsg
	return

_1F48:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	apply_movement obj_partner_poke, _2038
	wait_movement
	fade_out_bgm 0, 30
	callstd std_play_friend_music
	touchscreen_menu_hide
	clearflag FLAG_HIDE_ILEX_FOREST_FRIEND
	show_person obj_D36R0101_var_1
	show_person obj_D36R0101_tsure_poke_static_marill
	apply_movement obj_D36R0101_var_1, _2054
	apply_movement obj_D36R0101_tsure_poke_static_marill, _2060
	wait_movement
	apply_movement obj_player, _200C
	wait_movement
	buffer_players_name 0
	gender_msgbox msg_0115_D36R0101_00057, msg_0115_D36R0101_00056
	closemsg
	callstd std_fade_end_friend_music
	play_se SEQ_SE_GS_SUZUSYUTUGEN_HO
	fade_screen 6, 6, 0, RGB_WHITE
	wait_fade
	wait 15, VAR_SPECIAL_RESULT
	fade_screen 6, 6, 1, RGB_WHITE
	wait_fade
	apply_movement obj_player, _2014
	apply_movement obj_D36R0101_var_1, _208C
	wait_movement
	gender_msgbox msg_0115_D36R0101_00059, msg_0115_D36R0101_00058
	closemsg
	play_se SEQ_SE_GS_TIMESLIP
	scrcmd_810
	setvar VAR_UNK_40FE, 1
	clearflag FLAG_HIDE_ROUTE_22_GIOVANNI_RIVAL
	clearflag FLAG_HIDE_ROUTE_22_FRIEND
	setflag FLAG_HIDE_ILEX_FOREST_FRIEND
	warp MAP_ROUTE_22, 0, 954, 280, DIR_SOUTH
	fade_screen 6, 15, 1, RGB_WHITE
	wait_fade
	releaseall
	end

	.balign 4, 0
_200C:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_2014:
	EmoteExclamationMark
	Delay8
	WalkOnSpotNormalNorth
	Delay8
	WalkOnSpotNormalWest
	Delay8
	WalkOnSpotNormalSouth
	Delay8
	EndMovement

	.balign 4, 0
_2038:
	FaceSouth
	FaceSouth
	JumpFarSouth
	LockDir
	JumpNearFastNorth
	LockDir
	EndMovement

	.balign 4, 0
_2054:
	WalkNormalSouth 11
	WalkNormalEast 2
	EndMovement

	.balign 4, 0
_2060:
	WalkNormalSouth 8
	WalkOnSpotNormalEast
	WalkNormalEast
	LockDir
	WalkNormalSouth
	Delay8
	UnlockDir
	WalkOnSpotNormalWest
	Delay8
	WalkNormalWest
	EndMovement

	.balign 4, 0
_208C:
	Delay16
	WalkNormalEast 2
	WalkNormalNorth 2
	WalkOnSpotNormalEast
	EndMovement

scr_seq_D36R0101_022:
	scrcmd_609
	lockall
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_D36R0101_var_1, _2148
	apply_movement obj_player, _21F4
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	gender_msgbox msg_0115_D36R0101_00061, msg_0115_D36R0101_00060
	closemsg
	apply_movement obj_D36R0101_tsure_poke_static_marill, _2170
	wait_movement
	callstd std_play_friend_music
	apply_movement obj_D36R0101_var_1, _215C
	wait_movement
	gender_msgbox msg_0115_D36R0101_00063, msg_0115_D36R0101_00062
	closemsg
	apply_movement obj_D36R0101_var_1, _218C
	wait_movement
	gender_msgbox msg_0115_D36R0101_00065, msg_0115_D36R0101_00064
	closemsg
	apply_movement obj_D36R0101_var_1, _219C
	apply_movement obj_D36R0101_tsure_poke_static_marill, _21A4
	wait_movement
	buffer_players_name 0
	gender_msgbox msg_0115_D36R0101_00067, msg_0115_D36R0101_00066
	closemsg
	apply_movement obj_D36R0101_var_1, _21AC
	apply_movement obj_D36R0101_tsure_poke_static_marill, _21C4
	wait_movement
	callstd std_fade_end_friend_music
	touchscreen_menu_show
	setvar VAR_UNK_40FE, 5
	hide_person obj_D36R0101_var_1
	hide_person obj_D36R0101_tsure_poke_static_marill
	setflag FLAG_HIDE_ILEX_FOREST_FRIEND
	releaseall
	end

	.balign 4, 0
_2148:
	WalkOnSpotNormalWest
	Delay8
	WalkOnSpotNormalEast
	Delay8
	EndMovement

	.balign 4, 0
_215C:
	WalkOnSpotNormalWest
	EmoteExclamationMark
	Delay8
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_2170:
	Delay8
	JumpOnSpotFastEast 2
	LockDir
	JumpNearFastNorth
	JumpNearFastSouth
	UnlockDir
	EndMovement

	.balign 4, 0
_218C:
	WalkNormalWest 3
	Delay16
	JumpOnSpotFastWest 2
	EndMovement

	.balign 4, 0
_219C:
	WalkNormalEast 3
	EndMovement

	.balign 4, 0
_21A4:
	WalkNormalEast 3
	EndMovement

	.balign 4, 0
_21AC:
	WalkNormalWest 4
	WalkNormalNorth 6
	WalkOnSpotNormalSouth
	Delay8 6
	WalkNormalNorth 5
	EndMovement

	.balign 4, 0
_21C4:
	LockDir
	JumpNearFastSouth
	UnlockDir
	WalkOnSpotNormalNorth
	WalkNormalWest 3
	Delay8
	WalkOnSpotNormalEast
	Delay8 4
	WalkOnSpotNormalNorth
	JumpOnSpotFastNorth
	WalkNormalNorth 10
	EndMovement

	.balign 4, 0
_21F4:
	WalkNormalSouth
	Delay8
	EndMovement

scr_seq_D36R0101_013:
	scrcmd_055 3, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0115_D36R0101_00027, VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0
