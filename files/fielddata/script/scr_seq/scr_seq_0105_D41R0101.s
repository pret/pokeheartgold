#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D41R0101.h"
#include "msgdata/msg/msg_0003_EVERYWHERE.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D41R0101_000
	scrdef scr_seq_D41R0101_001
	scrdef_end

scr_seq_D41R0101_001:
	goto_if_unset FLAG_UNK_189, _001B
	clearflag FLAG_UNK_189
	end

_001B:
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 4
	goto_if_ne _0036
	clearflag FLAG_HIDE_CAMERON
	goto _003A

_0036:
	setflag FLAG_HIDE_CAMERON
_003A:
	end

scr_seq_D41R0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0164
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0178
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _00B5
	apply_movement obj_player, _018C
	apply_movement obj_D41R0101_gsmiddleman1, _01D8
	goto _0103

_00B5:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _00D0
	apply_movement obj_player, _01A4
	goto _0103

_00D0:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _00F3
	apply_movement obj_player, _01C4
	apply_movement obj_D41R0101_gsmiddleman1, _01D8
	goto _0103

_00F3:
	apply_movement obj_player, _01B0
	apply_movement obj_D41R0101_gsmiddleman1, _01D8
_0103:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _012A
	apply_movement obj_partner_poke, _01E4
	wait_movement
_012A:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 78
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

_0164:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 5
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0178:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 3
	wait_button_or_walk_away
	closemsg
	releaseall
	end


_018C:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_01A4:
	step 12, 3
	step 33, 1
	step_end

_01B0:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_01C4:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_01D8:
	step 63, 1
	step 32, 1
	step_end

_01E4:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
	.balign 4, 0
