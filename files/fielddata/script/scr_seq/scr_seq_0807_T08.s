#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T08.h"
#include "msgdata/msg/msg_0512_T08.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T08_000
	scrdef scr_seq_T08_001
	scrdef scr_seq_T08_002
	scrdef scr_seq_T08_003
	scrdef scr_seq_T08_004
	scrdef scr_seq_T08_005
	scrdef scr_seq_T08_006
	scrdef scr_seq_T08_007
	scrdef scr_seq_T08_008
	scrdef scr_seq_T08_009
	scrdef_end

scr_seq_T08_007:
	goto_if_unset FLAG_UNK_189, _003B
	clearflag FLAG_UNK_189
	end

_003B:
	clearflag FLAG_UNK_149
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 2
	goto_if_eq _0063
	compare VAR_TEMP_x4000, 6
	goto_if_eq _0063
	setflag FLAG_HIDE_CAMERON
	end

_0063:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_T08_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _014B
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _015F
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _00DA
	apply_movement obj_player, _0174
	goto _00EA

_00DA:
	apply_movement obj_player, _0180
	apply_movement obj_T08_gsmiddleman1_2, _0194
_00EA:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0111
	apply_movement obj_partner_poke, _01A0
	wait_movement
_0111:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 62
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

_014B:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 5
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_015F:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 3
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.byte 0x00

_0174:
	step 12, 3
	step 33, 1
	step_end

_0180:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_0194:
	step 63, 1
	step 32, 1
	step_end

_01A0:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_T08_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	call _0601
	call _057B
	compare VAR_SPECIAL_x8006, 1
	goto_if_eq _01E0
	npc_msg msg_0512_T08_00007
	closemsg
	call _0601
	releaseall
	end

_01E0:
	npc_msg msg_0512_T08_00008
_01E3:
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_x8000, 1
	goto_if_ne _0202
	menu_item_add 205, 255, 0
_0202:
	compare VAR_SPECIAL_x8001, 1
	goto_if_ne _0217
	menu_item_add 206, 255, 1
_0217:
	compare VAR_SPECIAL_x8002, 1
	goto_if_ne _022C
	menu_item_add 207, 255, 2
_022C:
	compare VAR_SPECIAL_x8003, 1
	goto_if_ne _0241
	menu_item_add 208, 255, 3
_0241:
	menu_item_add 126, 255, 4
	menu_exec
	touchscreen_menu_show
	switch VAR_SPECIAL_RESULT
	case 0, _028D
	case 1, _0331
	case 2, _03D5
	case 3, _0479
	goto _051D

_028D:
	npc_msg msg_0512_T08_00011
	goto_if_no_item_space ITEM_PERSIM_BERRY, 1, _052C
	goto_if_no_item_space ITEM_RAZZ_BERRY, 1, _052C
	goto_if_no_item_space ITEM_POMEG_BERRY, 1, _052C
	giveitem_no_check ITEM_PERSIM_BERRY, 1
	giveitem_no_check ITEM_RAZZ_BERRY, 1
	giveitem_no_check ITEM_POMEG_BERRY, 1
	takeitem ITEM_RED_SHARD, 1, VAR_SPECIAL_RESULT
	goto _053B

_0331:
	npc_msg msg_0512_T08_00012
	goto_if_no_item_space ITEM_BLUK_BERRY, 1, _052C
	goto_if_no_item_space ITEM_KELPSY_BERRY, 1, _052C
	goto_if_no_item_space ITEM_CORNN_BERRY, 1, _052C
	giveitem_no_check ITEM_BLUK_BERRY, 1
	giveitem_no_check ITEM_KELPSY_BERRY, 1
	giveitem_no_check ITEM_CORNN_BERRY, 1
	takeitem ITEM_BLUE_SHARD, 1, VAR_SPECIAL_RESULT
	goto _053B

_03D5:
	npc_msg msg_0512_T08_00013
	goto_if_no_item_space ITEM_PINAP_BERRY, 1, _052C
	goto_if_no_item_space ITEM_GREPA_BERRY, 1, _052C
	goto_if_no_item_space ITEM_NOMEL_BERRY, 1, _052C
	giveitem_no_check ITEM_PINAP_BERRY, 1
	giveitem_no_check ITEM_GREPA_BERRY, 1
	giveitem_no_check ITEM_NOMEL_BERRY, 1
	takeitem ITEM_YELLOW_SHARD, 1, VAR_SPECIAL_RESULT
	goto _053B

_0479:
	npc_msg msg_0512_T08_00014
	goto_if_no_item_space ITEM_WEPEAR_BERRY, 1, _052C
	goto_if_no_item_space ITEM_HONDEW_BERRY, 1, _052C
	goto_if_no_item_space ITEM_DURIN_BERRY, 1, _052C
	giveitem_no_check ITEM_WEPEAR_BERRY, 1
	giveitem_no_check ITEM_HONDEW_BERRY, 1
	giveitem_no_check ITEM_DURIN_BERRY, 1
	takeitem ITEM_GREEN_SHARD, 1, VAR_SPECIAL_RESULT
	goto _053B

_051D:
	npc_msg msg_0512_T08_00010
	closemsg
	call _0601
	releaseall
	end

_052C:
	npc_msg msg_0512_T08_00015
	closemsg
	call _0601
	releaseall
	end

_053B:
	setvar VAR_SPECIAL_x8000, 0
	setvar VAR_SPECIAL_x8001, 0
	setvar VAR_SPECIAL_x8002, 0
	setvar VAR_SPECIAL_x8003, 0
	setvar VAR_SPECIAL_x8006, 0
	call _057B
	compare VAR_SPECIAL_x8006, 1
	goto_if_ne _0575
	npc_msg msg_0512_T08_00009
	goto _01E3

_0575:
	goto _051D

_057B:
	hasitem ITEM_RED_SHARD, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _059C
	setvar VAR_SPECIAL_x8000, 1
	setvar VAR_SPECIAL_x8006, 1
_059C:
	hasitem ITEM_BLUE_SHARD, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _05BD
	setvar VAR_SPECIAL_x8001, 1
	setvar VAR_SPECIAL_x8006, 1
_05BD:
	hasitem ITEM_YELLOW_SHARD, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _05DE
	setvar VAR_SPECIAL_x8002, 1
	setvar VAR_SPECIAL_x8006, 1
_05DE:
	hasitem ITEM_GREEN_SHARD, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _05FF
	setvar VAR_SPECIAL_x8003, 1
	setvar VAR_SPECIAL_x8006, 1
_05FF:
	return

_0601:
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0622
	apply_movement obj_T08_juggrer, _064C
	wait_movement
	goto _0649

_0622:
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _063F
	apply_movement obj_T08_juggrer, _0690
	wait_movement
	goto _0649

_063F:
	apply_movement obj_T08_juggrer, _06D4
	wait_movement
_0649:
	return
	.byte 0x00

_064C:
	step 3, 1
	step 0, 1
	step 2, 1
	step 1, 1
	step 3, 1
	step 0, 1
	step 2, 1
	step 1, 1
	step 3, 1
	step 0, 1
	step 2, 1
	step 1, 1
	step 3, 1
	step 0, 1
	step 2, 1
	step 1, 1
	step_end

_0690:
	step 0, 1
	step 2, 1
	step 1, 1
	step 3, 1
	step 0, 1
	step 2, 1
	step 1, 1
	step 3, 1
	step 0, 1
	step 2, 1
	step 1, 1
	step 3, 1
	step 0, 1
	step 2, 1
	step 1, 1
	step 3, 1
	step_end

_06D4:
	step 1, 1
	step 3, 1
	step 0, 1
	step 2, 1
	step 1, 1
	step 3, 1
	step 0, 1
	step 2, 1
	step 1, 1
	step 3, 1
	step 0, 1
	step 2, 1
	step 1, 1
	step 3, 1
	step 0, 1
	step 2, 1
	step_end
scr_seq_T08_000:
	simple_npc_msg msg_0512_T08_00000
	end

scr_seq_T08_001:
	simple_npc_msg msg_0512_T08_00001
	end

scr_seq_T08_002:
	simple_npc_msg msg_0512_T08_00002
	end

scr_seq_T08_009:
	direction_signpost msg_0512_T08_00003, 0, 8, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T08_003:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0512_T08_00004, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T08_004:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0512_T08_00005, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T08_005:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0512_T08_00006, VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0
