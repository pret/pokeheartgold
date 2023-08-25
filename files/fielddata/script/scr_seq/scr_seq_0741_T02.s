#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T02.h"
#include "msgdata/msg/msg_0452_T02.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T02_000
	scrdef scr_seq_T02_001
	scrdef scr_seq_T02_002
	scrdef scr_seq_T02_003
	scrdef scr_seq_T02_004
	scrdef scr_seq_T02_005
	scrdef scr_seq_T02_006
	scrdef scr_seq_T02_007
	scrdef scr_seq_T02_008
	scrdef scr_seq_T02_009
	scrdef scr_seq_T02_010
	scrdef scr_seq_T02_011
	scrdef_end

scr_seq_T02_008:
	goto_if_unset FLAG_UNK_189, _0043
	clearflag FLAG_UNK_189
	end

_0043:
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 3
	goto_if_ne _005E
	clearflag FLAG_HIDE_CAMERON
	goto _0079

_005E:
	compare VAR_TEMP_x4000, 5
	goto_if_ne _0075
	clearflag FLAG_HIDE_CAMERON
	goto _0079

_0075:
	setflag FLAG_HIDE_CAMERON
_0079:
	goto_if_set FLAG_UNLOCKED_WEST_KANTO, _008E
	setflag FLAG_UNLOCKED_WEST_KANTO
	setvar VAR_UNK_4121, 1
_008E:
	end

scr_seq_T02_011:
	setvar VAR_SPECIAL_x8004, 2
	setvar VAR_SPECIAL_x8005, 2
	setvar VAR_SPECIAL_x8006, 0
	callstd std_phone_call
	setvar VAR_UNK_4096, 2
	end

scr_seq_T02_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0452_T02_00000
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _00D7
	npc_msg msg_0452_T02_00001
	goto _00DA

_00D7:
	npc_msg msg_0452_T02_00002
_00DA:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T02_001:
	simple_npc_msg msg_0452_T02_00003
	end

scr_seq_T02_010:
	simple_npc_msg msg_0452_T02_00004
	end

scr_seq_T02_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_GOT_TM85_FROM_VIRIDIAN_CITY_MAN, _0147
	npc_msg msg_0452_T02_00005
	goto_if_no_item_space ITEM_TM85, 1, _0152
	callstd std_give_item_verbose
	setflag FLAG_GOT_TM85_FROM_VIRIDIAN_CITY_MAN
_0147:
	npc_msg msg_0452_T02_00006
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0152:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_T02_009:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0284
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0298
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _01D5
	apply_movement obj_player, _02AC
	apply_movement obj_T02_gsmiddleman1, _02F8
	goto _0223

_01D5:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _01F0
	apply_movement obj_player, _02C4
	goto _0223

_01F0:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _0213
	apply_movement obj_player, _02E4
	apply_movement obj_T02_gsmiddleman1, _02F8
	goto _0223

_0213:
	apply_movement obj_player, _02D0
	apply_movement obj_T02_gsmiddleman1, _02F8
_0223:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _024A
	apply_movement obj_partner_poke, _0304
	wait_movement
_024A:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 69
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

_0284:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 5
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0298:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 3
	wait_button_or_walk_away
	closemsg
	releaseall
	end


_02AC:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_02C4:
	step 12, 3
	step 33, 1
	step_end

_02D0:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_02E4:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_02F8:
	step 63, 1
	step 32, 1
	step_end

_0304:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_T02_003:
	simple_npc_msg msg_0452_T02_00007
	end

scr_seq_T02_004:
	direction_signpost msg_0452_T02_00008, 0, 2, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T02_005:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0452_T02_00009, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T02_006:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0452_T02_00010, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T02_007:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0452_T02_00011, VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0
