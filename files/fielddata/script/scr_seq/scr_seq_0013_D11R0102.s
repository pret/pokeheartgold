#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D11R0102.h"
#include "msgdata/msg/msg_0003_EVERYWHERE.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D11R0102_000
	scrdef scr_seq_D11R0102_001
	scrdef_end

scr_seq_D11R0102_001:
	goto_if_unset FLAG_UNK_189, _001B
	clearflag FLAG_UNK_189
	end

_001B:
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 2
	goto_if_eq _003F
	compare VAR_TEMP_x4000, 6
	goto_if_eq _003F
	setflag FLAG_HIDE_CAMERON
	end

_003F:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_D11R0102_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _014A
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _015E
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _00BE
	apply_movement obj_player, _0174
	apply_movement obj_D11R0102_gsmiddleman1, _01AC
	goto _00E9

_00BE:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _00D9
	apply_movement obj_player, _018C
	goto _00E9

_00D9:
	apply_movement obj_player, _0198
	apply_movement obj_D11R0102_gsmiddleman1, _01AC
_00E9:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0110
	apply_movement obj_partner_poke, _01B8
	wait_movement
_0110:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 75
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

_014A:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 5
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_015E:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 3
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.byte 0x00, 0x00

_0174:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_018C:
	step 12, 3
	step 33, 1
	step_end

_0198:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_01AC:
	step 63, 1
	step 32, 1
	step_end

_01B8:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
	.balign 4, 0
