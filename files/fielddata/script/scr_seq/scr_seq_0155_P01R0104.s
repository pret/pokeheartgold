#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_P01R0104.h"
#include "msgdata/msg/msg_0258_P01R0104.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_P01R0104_000
	scrdef scr_seq_P01R0104_001
	scrdef scr_seq_P01R0104_002
	scrdef scr_seq_P01R0104_003
	scrdef_end

scr_seq_P01R0104_003:
	goto_if_set FLAG_UNK_168, _0021
	setflag FLAG_UNK_998
_0021:
	scrcmd_804 2
	setflag FLAG_UNK_168
	setflag FLAG_SYS_FLYPOINT_VERMILION
	scrcmd_582 MAP_VERMILION, 1309, 340
	end

scr_seq_P01R0104_002:
	compare VAR_BOAT_DIRECTION, 1
	goto_if_eq _0045
	end

_0045:
	move_person_facing obj_P01R0104_seaman_2, 24, 0, 19, DIR_WEST
	end

scr_seq_P01R0104_001:
	scrcmd_609
	lockall
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_player, _0090
	wait_movement
	apply_movement obj_P01R0104_seaman_2, _0098
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	setvar VAR_BOAT_DIRECTION, 0
	clearflag FLAG_UNK_092
	releaseall
	end

	.balign 4, 0
_0090:
	WalkNormalSouth 3
	EndMovement

	.balign 4, 0
_0098:
	WalkNormalWest
	WalkOnSpotNormalSouth
	EndMovement

scr_seq_P01R0104_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_BOAT_ARRIVED, _0144
	npc_msg msg_0258_P01R0104_00000
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	get_player_facing VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 2
	goto_if_ne _00EF
	apply_movement obj_P01R0104_seaman_2, _0150
	wait_movement
	apply_movement obj_player, _0180
	goto _0126

_00EF:
	compare VAR_TEMP_x4000, 3
	goto_if_ne _0114
	apply_movement obj_P01R0104_seaman_2, _0160
	wait_movement
	apply_movement obj_player, _0190
	goto _0126

_0114:
	apply_movement obj_P01R0104_seaman_2, _0170
	wait_movement
	apply_movement obj_player, _01A0
_0126:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	play_se SEQ_SE_DP_KAIDAN2
	scrcmd_723 1, 0, 307, 24, 19
	releaseall
	end

_0144:
	npc_msg msg_0258_P01R0104_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

	.balign 4, 0
_0150:
	FaceWest
	WalkNormalWest
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0160:
	FaceEast
	WalkNormalEast
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0170:
	FaceEast
	WalkNormalEast
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0180:
	WalkNormalWest
	FaceNorth
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_0190:
	WalkNormalEast
	FaceNorth
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_01A0:
	WalkNormalNorth 2
	EndMovement
	.balign 4, 0
