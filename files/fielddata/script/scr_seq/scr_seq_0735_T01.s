#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T01.h"
#include "msgdata/msg/msg_0446_T01.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T01_000
	scrdef scr_seq_T01_001
	scrdef scr_seq_T01_002
	scrdef scr_seq_T01_003
	scrdef scr_seq_T01_004
	scrdef scr_seq_T01_005
	scrdef scr_seq_T01_006
	scrdef scr_seq_T01_007
	scrdef_end

scr_seq_T01_007:
	goto_if_unset FLAG_UNK_189, _0033
	clearflag FLAG_UNK_189
	end

_0033:
	goto_if_set FLAG_GOT_HM08, _0044
	goto _004A

_0044:
	setvar VAR_UNK_4096, 0
_004A:
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 3
	goto_if_eq _007B
	compare VAR_TEMP_x4000, 4
	goto_if_eq _007B
	compare VAR_TEMP_x4000, 5
	goto_if_eq _007B
	setflag FLAG_HIDE_CAMERON
	end

_007B:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_T01_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _01A9
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _01BD
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _00FA
	apply_movement obj_player, _01D4
	apply_movement obj_T01_gsmiddleman1, _0220
	goto _0148

_00FA:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0115
	apply_movement obj_player, _01EC
	goto _0148

_0115:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _0138
	apply_movement obj_player, _020C
	apply_movement obj_T01_gsmiddleman1, _0220
	goto _0148

_0138:
	apply_movement obj_player, _01F8
	apply_movement obj_T01_gsmiddleman1, _0220
_0148:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _016F
	apply_movement obj_partner_poke, _022C
	wait_movement
_016F:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 73
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

_01A9:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 5
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_01BD:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 3
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_01D4:
	step 14, 1
	step 12, 2
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_01EC:
	step 12, 3
	step 33, 1
	step_end

_01F8:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_020C:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_0220:
	step 63, 1
	step 32, 1
	step_end

_022C:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_T01_000:
	simple_npc_msg msg_0446_T01_00000
	end

scr_seq_T01_001:
	simple_npc_msg msg_0446_T01_00001
	end

scr_seq_T01_002:
	direction_signpost msg_0446_T01_00002, 0, 1, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T01_003:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0446_T01_00003, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T01_004:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0446_T01_00004, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T01_005:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0446_T01_00005, VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0
