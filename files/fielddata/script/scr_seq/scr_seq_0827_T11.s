#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T11.h"
#include "msgdata/msg/msg_0529_T11.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T11_000
	scrdef scr_seq_T11_001
	scrdef scr_seq_T11_002
	scrdef scr_seq_T11_003
	scrdef scr_seq_T11_004
	scrdef scr_seq_T11_005
	scrdef scr_seq_T11_006
	scrdef scr_seq_T11_007
	scrdef scr_seq_T11_008
	scrdef scr_seq_T11_009
	scrdef scr_seq_T11_010
	scrdef scr_seq_T11_011
	scrdef scr_seq_T11_012
	scrdef scr_seq_T11_013
	scrdef scr_seq_T11_014
	scrdef scr_seq_T11_015
	scrdef scr_seq_T11_016
	scrdef_end

scr_seq_T11_016:
	goto_if_unset FLAG_UNK_0A0, _0055
	clearflag FLAG_UNK_0A0
_0055:
	goto_if_unset FLAG_UNK_189, _0066
	clearflag FLAG_UNK_189
	end

_0066:
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 1
	goto_if_eq _00B5
	compare VAR_TEMP_x4000, 2
	goto_if_eq _00B5
	compare VAR_TEMP_x4000, 3
	goto_if_eq _00B5
	compare VAR_TEMP_x4000, 5
	goto_if_eq _00BF
	compare VAR_TEMP_x4000, 6
	goto_if_eq _00BF
	setflag FLAG_HIDE_CAMERON
	setflag FLAG_UNK_27F
	end

_00B5:
	clearflag FLAG_HIDE_CAMERON
	setflag FLAG_UNK_27F
	end

_00BF:
	setflag FLAG_HIDE_CAMERON
	clearflag FLAG_UNK_27F
	end

scr_seq_T11_014:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _034C
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0360
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0142
	apply_movement obj_player, _01D0
	apply_movement obj_T11_gsmiddleman1_2, _0208
	goto _016D

_0142:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _015D
	apply_movement obj_player, _01E8
	goto _016D

_015D:
	apply_movement obj_player, _01F4
	apply_movement obj_T11_gsmiddleman1_2, _0208
_016D:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0194
	apply_movement obj_partner_poke, _0214
	wait_movement
_0194:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 52
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
	.byte 0x00, 0x00

_01D0:
	step 14, 1
	step 12, 2
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_01E8:
	step 12, 3
	step 33, 1
	step_end

_01F4:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_0208:
	step 63, 1
	step 32, 1
	step_end

_0214:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_T11_015:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _034C
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0360
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _029D
	apply_movement obj_player, _0374
	apply_movement obj_T11_gsmiddleman1_3, _0208
	goto _02EB

_029D:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _02B8
	apply_movement obj_player, _01E8
	goto _02EB

_02B8:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _02DB
	apply_movement obj_player, _01F4
	apply_movement obj_T11_gsmiddleman1_3, _0208
	goto _02EB

_02DB:
	apply_movement obj_player, _038C
	apply_movement obj_T11_gsmiddleman1_3, _0208
_02EB:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0312
	apply_movement obj_partner_poke, _0214
	wait_movement
_0312:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 53
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

_034C:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 5
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0360:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 3
	wait_button_or_walk_away
	closemsg
	releaseall
	end


_0374:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_038C:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end
scr_seq_T11_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_2FB, _03BE
	npc_msg msg_0529_T11_00002
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_03BE:
	npc_msg msg_0529_T11_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T11_000:
	simple_npc_msg msg_0529_T11_00000
	end

scr_seq_T11_001:
	simple_npc_msg msg_0529_T11_00001
	end

scr_seq_T11_003:
	simple_npc_msg msg_0529_T11_00004
	end

scr_seq_T11_004:
	simple_npc_msg msg_0529_T11_00005
	end

scr_seq_T11_005:
	simple_npc_msg msg_0529_T11_00006
	end

scr_seq_T11_006:
	simple_npc_msg msg_0529_T11_00007
	end

scr_seq_T11_007:
	simple_npc_msg msg_0529_T11_00008
	end

scr_seq_T11_008:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0529_T11_00009, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T11_009:
	direction_signpost msg_0529_T11_00010, 0, 10, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T11_010:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0529_T11_00011, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T11_011:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0529_T11_00012, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T11_012:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0529_T11_00013, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T11_013:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0529_T11_00014, VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0
