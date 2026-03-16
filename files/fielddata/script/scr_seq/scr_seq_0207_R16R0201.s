#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R16R0201.h"
#include "msgdata/msg/msg_0356_R16R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R16R0201_000
	scrdef scr_seq_R16R0201_001
	scrdef scr_seq_R16R0201_002
	scrdef scr_seq_R16R0201_003
	scrdef_end

scr_seq_R16R0201_003:
	goto_if_set FLAG_UNK_149, _001F
	end

_001F:
	set_bike_state_lock 1
	end

scr_seq_R16R0201_001:
	scrcmd_609
	lockall
	player_on_bike_check VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _006A
	apply_movement obj_player, _0084
	wait_movement
	npc_msg msg_0356_R16R0201_00001
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_player, _008C
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	releaseall
	end

_006A:
	set_bike_state_lock 1
	setvar VAR_UNK_4129, 1
	setvar VAR_UNK_412A, 1
	setflag FLAG_UNK_149
	releaseall
	end

	.balign 4, 0
_0084:
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_008C:
	WalkNormalEast
	EndMovement

scr_seq_R16R0201_002:
	set_bike_state_lock 0
	setvar VAR_UNK_4129, 0
	setvar VAR_UNK_412A, 0
	clearflag FLAG_UNK_149
	end

scr_seq_R16R0201_000:
	simple_npc_msg msg_0356_R16R0201_00000
	end
	.balign 4, 0
