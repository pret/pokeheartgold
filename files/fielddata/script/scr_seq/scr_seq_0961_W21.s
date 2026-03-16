#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_W21.h"
#include "msgdata/msg/msg_0743_W21.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_W21_000
	scrdef scr_seq_W21_001
	scrdef_end

scr_seq_W21_001:
	goto_if_unset FLAG_UNK_189, _001B
	clearflag FLAG_UNK_189
	end

_001B:
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 1
	goto_if_eq _003F
	compare VAR_TEMP_x4000, 0
	goto_if_eq _003F
	setflag FLAG_HIDE_CAMERON
	end

_003F:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_W21_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0152
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0166
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _00BE
	apply_movement obj_player, _017C
	apply_movement obj_W21_gsmiddleman1, _01B0
	goto _00F1

_00BE:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _00E1
	apply_movement obj_player, _019C
	apply_movement obj_W21_gsmiddleman1, _01B0
	goto _00F1

_00E1:
	apply_movement obj_player, _0188
	apply_movement obj_W21_gsmiddleman1, _01B0
_00F1:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0118
	apply_movement obj_partner_poke, _01BC
	wait_movement
_0118:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 74
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

_0152:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 5
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0166:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 3
	wait_button_or_walk_away
	closemsg
	releaseall
	end

	.balign 4, 0
_017C:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0188:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_019C:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01B0:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_01BC:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement
	.balign 4, 0
