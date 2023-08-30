#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T31.h"
#include "msgdata/msg/msg_0636_T31.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T31_000
	scrdef scr_seq_T31_001
	scrdef scr_seq_T31_002
	scrdef_end

scr_seq_T31_001:
	goto_if_unset FLAG_UNK_189, _001F
	clearflag FLAG_UNK_189
	end

_001F:
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 3
	goto_if_eq _0043
	compare VAR_TEMP_x4000, 5
	goto_if_eq _0043
	setflag FLAG_HIDE_CAMERON
	end

_0043:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_T31_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0171
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0185
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _00C2
	apply_movement obj_player, _019C
	apply_movement obj_T31_gsmiddleman1, _01E8
	goto _0110

_00C2:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _00DD
	apply_movement obj_player, _01B4
	goto _0110

_00DD:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _0100
	apply_movement obj_player, _01D4
	apply_movement obj_T31_gsmiddleman1, _01E8
	goto _0110

_0100:
	apply_movement obj_player, _01C0
	apply_movement obj_T31_gsmiddleman1, _01E8
_0110:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0137
	apply_movement obj_partner_poke, _01F4
	wait_movement
_0137:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 77
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

_0171:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 5
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0185:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 3
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_019C:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_01B4:
	step 12, 3
	step 33, 1
	step_end

_01C0:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_01D4:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_01E8:
	step 63, 1
	step 32, 1
	step_end

_01F4:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_T31_002:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0636_T31_00000, VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0
