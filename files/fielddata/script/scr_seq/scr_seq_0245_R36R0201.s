#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R36R0201.h"
#include "msgdata/msg/msg_0392_R36R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R36R0201_000
	scrdef scr_seq_R36R0201_001
	scrdef scr_seq_R36R0201_002
	scrdef_end

scr_seq_R36R0201_000:
	get_weekday VAR_TEMP_x4000
	compare VAR_UNK_4118, 1
	goto_if_ne _002D
	clearflag FLAG_UNK_1C4
	setflag FLAG_UNK_1C3
	goto _0086

_002D:
	compare VAR_TEMP_x4000, 2
	goto_if_ne _0048
	clearflag FLAG_UNK_1C4
	setflag FLAG_UNK_1C3
	goto _0086

_0048:
	compare VAR_TEMP_x4000, 4
	goto_if_ne _0063
	clearflag FLAG_UNK_1C4
	setflag FLAG_UNK_1C3
	goto _0086

_0063:
	compare VAR_TEMP_x4000, 6
	goto_if_ne _007E
	clearflag FLAG_UNK_1C4
	setflag FLAG_UNK_1C3
	goto _0086

_007E:
	clearflag FLAG_UNK_1C3
	setflag FLAG_UNK_1C4
_0086:
	end

scr_seq_R36R0201_002:
	scrcmd_609
	lockall
	apply_movement obj_player, _0120
	wait_movement
	callstd std_bug_contest_guard_ask_end
	compare VAR_UNK_4118, 1
	goto_if_ne _011A
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_player, _0128
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_NATIONAL_PARK_BUG_CATCHING_CONTEST, 0, 75, 39, DIR_WEST
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	lock obj_partner_poke
	scrcmd_596 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _010A
	scrcmd_606
	goto _010C

_010A:
	scrcmd_607
_010C:
	apply_movement obj_partner_poke, _0130
	wait_movement
	release obj_partner_poke
_011A:
	releaseall
	end

	.balign 4, 0
_0120:
	FaceNorth
	EndMovement

	.balign 4, 0
_0128:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0130:
	FaceWest
	EndMovement

scr_seq_R36R0201_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd std_bug_contest_guard_start
	compare VAR_UNK_4118, 1
	goto_if_ne _0231
	goto_if_set FLAG_UNK_1C4, _01BA
	get_player_facing VAR_SPECIAL_RESULT
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0185
	apply_movement obj_player, _0238
	goto _01A8

_0185:
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _01A0
	apply_movement obj_player, _0240
	goto _01A8

_01A0:
	apply_movement obj_player, _024C
_01A8:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	goto _01DC

_01BA:
	get_player_facing VAR_SPECIAL_RESULT
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_player, _025C
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
_01DC:
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_NATIONAL_PARK_BUG_CATCHING_CONTEST, 0, 75, 39, DIR_WEST
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	lock obj_partner_poke
	scrcmd_596 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0221
	scrcmd_606
	goto _0223

_0221:
	scrcmd_607
_0223:
	apply_movement obj_partner_poke, _0130
	wait_movement
	release obj_partner_poke
_0231:
	releaseall
	end

	.balign 4, 0
_0238:
	FaceWest
	EndMovement

	.balign 4, 0
_0240:
	WalkNormalSouth
	WalkNormalWest
	EndMovement

	.balign 4, 0
_024C:
	WalkNormalEast
	WalkNormalSouth 2
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_025C:
	WalkNormalSouth
	WalkNormalWest 4
	EndMovement

	.balign 4, 0
