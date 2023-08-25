#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R45.h"
#include "msgdata/msg/msg_0405_R45.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R45_000
	scrdef scr_seq_R45_001
	scrdef scr_seq_R45_002
	scrdef scr_seq_R45_003
	scrdef scr_seq_R45_004
	scrdef_end

scr_seq_R45_002:
	goto_if_unset FLAG_UNK_189, _0027
	clearflag FLAG_UNK_189
	end

_0027:
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 3
	goto_if_eq _004B
	compare VAR_TEMP_x4000, 6
	goto_if_eq _004B
	setflag FLAG_HIDE_CAMERON
	end

_004B:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_R45_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0133
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0147
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _00C2
	apply_movement obj_player, _015C
	goto _00D2

_00C2:
	apply_movement obj_player, _0168
	apply_movement obj_R45_gsmiddleman1, _017C
_00D2:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _00F9
	apply_movement obj_partner_poke, _0188
	wait_movement
_00F9:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 47
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

_0133:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 5
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0147:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 3
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.byte 0x00

_015C:
	step 12, 3
	step 33, 1
	step_end

_0168:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_017C:
	step 63, 1
	step 32, 1
	step_end

_0188:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_R45_003:
	simple_npc_msg msg_0405_R45_00000
	end

scr_seq_R45_000:
	direction_signpost msg_0405_R45_00001, 1, 4, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_R45_004:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0405_R45_00002, VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0
