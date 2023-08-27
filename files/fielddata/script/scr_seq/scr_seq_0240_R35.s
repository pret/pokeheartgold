#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R35.h"
#include "msgdata/msg/msg_0387_R35.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R35_000
	scrdef scr_seq_R35_001
	scrdef scr_seq_R35_002
	scrdef scr_seq_R35_003
	scrdef scr_seq_R35_004
	scrdef_end

scr_seq_R35_001:
	goto_if_unset FLAG_UNK_189, _0027
	clearflag FLAG_UNK_189
	end

_0027:
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 1
	goto_if_eq _005C
	compare VAR_TEMP_x4000, 2
	goto_if_eq _005C
	compare VAR_TEMP_x4000, 5
	goto_if_eq _005C
	setflag FLAG_HIDE_CAMERON
	goto _0060

_005C:
	clearflag FLAG_HIDE_CAMERON
_0060:
	scrcmd_379 VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 3
	goto_if_eq _0088
	compare VAR_TEMP_x4000, 4
	goto_if_eq _0088
	clearflag FLAG_UNK_1CD
	setflag FLAG_UNK_1CE
	end

_0088:
	clearflag FLAG_UNK_1CE
	setflag FLAG_UNK_1CD
	end

scr_seq_R35_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0197
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _01AB
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _010B
	apply_movement obj_player, _01C0
	apply_movement obj_R35_gsmiddleman1, _01F4
	goto _0136

_010B:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0126
	apply_movement obj_player, _01D4
	goto _0136

_0126:
	apply_movement obj_player, _01E0
	apply_movement obj_R35_gsmiddleman1, _01F4
_0136:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _015D
	apply_movement obj_partner_poke, _0200
	wait_movement
_015D:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 11
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

_0197:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 5
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_01AB:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 3
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.byte 0x00

_01C0:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_01D4:
	step 12, 3
	step 33, 1
	step_end

_01E0:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_01F4:
	step 63, 1
	step 32, 1
	step_end

_0200:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_R35_000:
	direction_signpost msg_0387_R35_00028, 1, 4, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_R35_004:
	direction_signpost msg_0387_R35_00029, 1, 19, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_R35_002:
	simple_npc_msg msg_0387_R35_00021
	end
	.balign 4, 0
