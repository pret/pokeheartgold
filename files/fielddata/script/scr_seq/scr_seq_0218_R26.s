#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R26.h"
#include "msgdata/msg/msg_0365_R26.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R26_000
	scrdef scr_seq_R26_001
	scrdef scr_seq_R26_002
	scrdef scr_seq_R26_003
	scrdef_end

scr_seq_R26_001:
	goto_if_unset FLAG_UNK_189, _0023
	clearflag FLAG_UNK_189
	end

_0023:
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 2
	goto_if_eq _0047
	compare VAR_TEMP_x4000, 5
	goto_if_eq _0047
	setflag FLAG_HIDE_CAMERON
	end

_0047:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_R26_000:
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
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _00C6
	apply_movement obj_player, _017C
	apply_movement obj_R26_gsmiddleman1, _01B4
	goto _00F1

_00C6:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _00E1
	apply_movement obj_player, _0194
	goto _00F1

_00E1:
	apply_movement obj_player, _01A0
	apply_movement obj_R26_gsmiddleman1, _01B4
_00F1:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0118
	apply_movement obj_partner_poke, _01C0
	wait_movement
_0118:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 48
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
	.byte 0x00, 0x00

_017C:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_0194:
	step 12, 3
	step 33, 1
	step_end

_01A0:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_01B4:
	step 63, 1
	step 32, 1
	step_end

_01C0:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_R26_002:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0365_R26_00000, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_R26_003:
	direction_signpost msg_0365_R26_00001, 1, 6, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0
