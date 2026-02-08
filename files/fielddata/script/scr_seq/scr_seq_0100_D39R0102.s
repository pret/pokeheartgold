#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D39R0102.h"
#include "msgdata/msg/msg_0003_EVERYWHERE.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D39R0102_000
	scrdef scr_seq_D39R0102_001
	scrdef scr_seq_D39R0102_002
	scrdef scr_seq_D39R0102_003
	scrdef_end

scr_seq_D39R0102_000:
	setvar VAR_TEMP_x4000, 12
	setvar VAR_TEMP_x4001, 12
	goto _0062
	end

scr_seq_D39R0102_001:
	setvar VAR_TEMP_x4000, 10
	setvar VAR_TEMP_x4001, 21
	goto _0062
	end

scr_seq_D39R0102_002:
	setvar VAR_TEMP_x4000, 20
	setvar VAR_TEMP_x4001, 10
	goto _0062
	end

scr_seq_D39R0102_003:
	setvar VAR_TEMP_x4000, 21
	setvar VAR_TEMP_x4001, 23
	goto _0062
	end

_0062:
	scrcmd_609
	lockall
	setvar VAR_UNK_40AB, 1
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0093
	apply_movement obj_player, _0118
	apply_movement obj_partner_poke, _0124
	goto _00E9

_0093:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _00B6
	apply_movement obj_player, _0134
	apply_movement obj_partner_poke, _0140
	goto _00E9

_00B6:
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _00D9
	apply_movement obj_player, _0150
	apply_movement obj_partner_poke, _015C
	goto _00E9

_00D9:
	apply_movement obj_player, _016C
	apply_movement obj_partner_poke, _0178
_00E9:
	wait_movement
	play_se SEQ_SE_GS_RAKKA01
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_ICE_PATH_B2F, 0, VAR_TEMP_x4000, VAR_TEMP_x4001, VAR_SPECIAL_RESULT
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

	.balign 4, 0
_0118:
	WalkOnSpotFasterNorth 4
	SetInvisible
	EndMovement

	.balign 4, 0
_0124:
	Delay4 3
	WalkFasterNorth
	SetInvisible
	EndMovement

	.balign 4, 0
_0134:
	WalkOnSpotFasterSouth 4
	SetInvisible
	EndMovement

	.balign 4, 0
_0140:
	Delay4 3
	WalkFasterSouth
	SetInvisible
	EndMovement

	.balign 4, 0
_0150:
	WalkOnSpotFasterWest 4
	SetInvisible
	EndMovement

	.balign 4, 0
_015C:
	Delay4 3
	WalkFasterWest
	SetInvisible
	EndMovement

	.balign 4, 0
_016C:
	WalkOnSpotFasterEast 4
	SetInvisible
	EndMovement

	.balign 4, 0
_0178:
	Delay4 3
	WalkFasterEast
	SetInvisible
	EndMovement
	.balign 4, 0
