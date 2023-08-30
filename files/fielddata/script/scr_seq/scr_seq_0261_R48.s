#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R48.h"
#include "msgdata/msg/msg_0408_R48.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R48_000
	scrdef scr_seq_R48_001
	scrdef scr_seq_R48_002
	scrdef_end

scr_seq_R48_001:
	goto_if_unset FLAG_UNK_189, _001F
	clearflag FLAG_UNK_189
	end

_001F:
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 5
	goto_if_eq _0043
	compare VAR_TEMP_x4000, 0
	goto_if_eq _0043
	setflag FLAG_HIDE_CAMERON
	end

_0043:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_R48_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _014E
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0162
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _00C2
	apply_movement obj_player, _0178
	apply_movement obj_R48_gsmiddleman1, _01B0
	goto _00ED

_00C2:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _00DD
	apply_movement obj_player, _0190
	goto _00ED

_00DD:
	apply_movement obj_player, _019C
	apply_movement obj_R48_gsmiddleman1, _01B0
_00ED:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0114
	apply_movement obj_partner_poke, _01BC
	wait_movement
_0114:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 37
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

_014E:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 5
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0162:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 3
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.byte 0x00, 0x00

_0178:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_0190:
	step 12, 3
	step 33, 1
	step_end

_019C:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_01B0:
	step 63, 1
	step 32, 1
	step_end

_01BC:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_R48_002:
	direction_signpost msg_0408_R48_00000, 1, 13, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0
