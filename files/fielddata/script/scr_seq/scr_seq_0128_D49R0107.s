#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D49R0107.h"
#include "msgdata/msg/msg_0143_D49R0107.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D49R0107_000
	scrdef scr_seq_D49R0107_001
	scrdef scr_seq_D49R0107_002
	scrdef scr_seq_D49R0107_003
	scrdef scr_seq_D49R0107_004
	scrdef scr_seq_D49R0107_005
	scrdef scr_seq_D49R0107_006
	scrdef scr_seq_D49R0107_007
	scrdef_end

scr_seq_D49R0107_007:
	compare VAR_UNK_40D3, 1
	goto_if_ne _003B
	setvar VAR_TEMP_x400E, 1
	goto _0041

_003B:
	setvar VAR_TEMP_x400E, 0
_0041:
	end

scr_seq_D49R0107_006:
	compare VAR_TEMP_x400F, 0
	goto_if_ne _0058
	create_friendship_room_statues
	setvar VAR_TEMP_x400F, 1
_0058:
	get_player_gender VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 0
	goto_if_ne _007B
	move_person_facing obj_D49R0107_statueheroine, 28, 0, 28, DIR_NORTH
	goto _0087

_007B:
	move_person_facing obj_D49R0107_statuehero, 28, 0, 28, DIR_NORTH
_0087:
	compare VAR_TEMP_x400E, 1
	goto_if_ne _00A6
	move_person_facing obj_D49R0107_thlonowner, 9, 0, 9, DIR_SOUTH
	setvar VAR_TEMP_x400E, 0
_00A6:
	end

scr_seq_D49R0107_005:
	scrcmd_609
	lockall
	apply_movement obj_D49R0107_thlonowner, _015C
	wait_movement
	npc_msg msg_0143_D49R0107_00000
	closemsg
	apply_movement obj_D49R0107_thlonowner, _0164
	wait_movement
	wait 15, VAR_SPECIAL_RESULT
	buffer_players_name 0
	npc_msg msg_0143_D49R0107_00001
	closemsg
	apply_movement obj_D49R0107_thlonowner, _016C
	wait_movement
	npc_msg msg_0143_D49R0107_00002
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_D49R0107_thlonowner, _0174
	apply_movement obj_player, _0180
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	buffer_players_name 0
	npc_msg msg_0143_D49R0107_00003
	closemsg
	apply_movement obj_D49R0107_thlonowner, _0188
	wait_movement
	npc_msg msg_0143_D49R0107_00004
	closemsg
	apply_movement obj_D49R0107_thlonowner, _0164
	wait_movement
	npc_msg msg_0143_D49R0107_00005
	closemsg
	apply_movement obj_D49R0107_thlonowner, _0190
	wait_movement
	releaseall
	setvar VAR_UNK_40D3, 1
	nat_dex_flag_action 2, VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 1
	call_if_eq _0154
	end

_0154:
	clearflag FLAG_HIDE_POKEATHLON_SUPREME_CUP_RECEPTIONIST
	return

	.balign 4, 0
_015C:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0164:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_016C:
	WalkNormalSouth 3
	EndMovement

	.balign 4, 0
_0174:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0180:
	WalkNormalNorth 3
	EndMovement

	.balign 4, 0
_0188:
	WalkSlowNorth
	EndMovement

	.balign 4, 0
_0190:
	WalkOnSpotNormalWest
	LockDir
	WalkSlowEast 2
	UnlockDir
	EndMovement

scr_seq_D49R0107_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	buffer_players_name 0
	npc_msg msg_0143_D49R0107_00006
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D49R0107_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0143_D49R0107_00007
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_712 3
	restore_overworld
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

scr_seq_D49R0107_002:
	simple_npc_msg msg_0143_D49R0107_00008
	end

scr_seq_D49R0107_003:
	simple_npc_msg msg_0143_D49R0107_00008
	end

scr_seq_D49R0107_004:
	simple_npc_msg msg_0143_D49R0107_00008
	end
	.balign 4, 0
