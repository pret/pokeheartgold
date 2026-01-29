#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D24R0214.h"
#include "msgdata/msg/msg_0082_D24R0214.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D24R0214_000
	scrdef scr_seq_D24R0214_001
	scrdef_end

scr_seq_D24R0214_000:
	scrcmd_609
	lockall
	setvar VAR_UNK_40D8, 1
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0034
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _007E
	end

_0034:
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0053
	apply_movement obj_player, _0108
	goto _0076

_0053:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _006E
	apply_movement obj_player, _0140
	goto _0076

_006E:
	apply_movement obj_player, _0124
_0076:
	wait_movement
	goto _00DA

_007E:
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _00A5
	apply_movement obj_player, _0108
	apply_movement obj_partner_poke, _0114
	goto _00D8

_00A5:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _00C8
	apply_movement obj_player, _0140
	apply_movement obj_partner_poke, _014C
	goto _00D8

_00C8:
	apply_movement obj_player, _0124
	apply_movement obj_partner_poke, _0130
_00D8:
	wait_movement
_00DA:
	play_se SEQ_SE_GS_RAKKA01
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_RUINS_OF_ALPH_NORTHWEST_HIDDEN_ROOM, 0, 11, 14, VAR_SPECIAL_RESULT
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

	.balign 4, 0
_0108:
	WalkOnSpotFasterNorth 4
	SetInvisible
	EndMovement

	.balign 4, 0
_0114:
	Delay4 3
	WalkFasterNorth
	SetInvisible
	EndMovement

	.balign 4, 0
_0124:
	WalkOnSpotFasterWest 4
	SetInvisible
	EndMovement

	.balign 4, 0
_0130:
	Delay4 3
	WalkFasterWest
	SetInvisible
	EndMovement

	.balign 4, 0
_0140:
	WalkOnSpotFasterEast 4
	SetInvisible
	EndMovement

	.balign 4, 0
_014C:
	Delay4 3
	WalkFasterEast
	SetInvisible
	EndMovement

scr_seq_D24R0214_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0082_D24R0214_00000
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
