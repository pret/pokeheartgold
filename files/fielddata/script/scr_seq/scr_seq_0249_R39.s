#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R39.h"
#include "msgdata/msg/msg_0396_R39.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R39_000
	scrdef scr_seq_R39_001
	scrdef scr_seq_R39_002
	scrdef scr_seq_R39_003
	scrdef scr_seq_R39_004
	scrdef scr_seq_R39_005
	scrdef scr_seq_R39_006
	scrdef scr_seq_R39_007
	scrdef_end

scr_seq_R39_001:
	goto_if_unset FLAG_UNK_189, _0033
	clearflag FLAG_UNK_189
	end

_0033:
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 4
	goto_if_eq _005B
	compare VAR_TEMP_x4000, 0
	goto_if_eq _005B
	setflag FLAG_HIDE_CAMERON
	goto _005F

_005B:
	clearflag FLAG_HIDE_CAMERON
_005F:
	scrcmd_379 VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 3
	goto_if_eq _0087
	compare VAR_TEMP_x4000, 4
	goto_if_eq _0087
	clearflag FLAG_UNK_226
	goto _008B

_0087:
	setflag FLAG_UNK_226
_008B:
	goto_if_unset FLAG_TRADE_LT_SURGE_PIKACHU, _00E3
	get_phone_book_rematch PHONE_CONTACT_LT__SURGE, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 0
	goto_if_ne _00E3
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 5
	goto_if_ne _00C4
	clearflag FLAG_UNK_314
	goto _00E1

_00C4:
	compare VAR_TEMP_x4000, 6
	goto_if_ne _00DB
	clearflag FLAG_UNK_314
	goto _00E1

_00DB:
	goto _00E3

_00E1:
	end

_00E3:
	setflag FLAG_UNK_314
	end

scr_seq_R39_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_MILTANK, 0
	npc_msg msg_0396_R39_00003
	wait_cry
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_R39_002:
	scrcmd_609
	lockall
	apply_movement obj_R39_gsgentleman, _0208
	wait_movement
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 171
	goto_if_ne _0133
	apply_movement obj_R39_gsgentleman, _0214
	goto _0156

_0133:
	compare VAR_TEMP_x4001, 172
	goto_if_ne _014E
	apply_movement obj_R39_gsgentleman, _0220
	goto _0156

_014E:
	apply_movement obj_R39_gsgentleman, _0228
_0156:
	wait_movement
	npc_msg msg_0396_R39_00004
	npc_msg msg_0396_R39_00005
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _01E3
_0173:
	npc_msg msg_0396_R39_00006
	register_gear_number PHONE_CONTACT_BAOBA
	buffer_players_name 0
	npc_msg msg_0396_R39_00008
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	npc_msg msg_0396_R39_00009
	closemsg
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 171
	goto_if_ne _01AC
	apply_movement obj_R39_gsgentleman, _0234
	goto _01CF

_01AC:
	compare VAR_TEMP_x4001, 172
	goto_if_ne _01C7
	apply_movement obj_R39_gsgentleman, _0244
	goto _01CF

_01C7:
	apply_movement obj_R39_gsgentleman, _0254
_01CF:
	wait_movement
	hide_person obj_R39_gsgentleman
	setflag FLAG_UNK_228
	releaseall
	setvar VAR_UNK_408F, 1
	end

_01E3:
	npc_msg msg_0396_R39_00007
	npc_msg msg_0396_R39_00005
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _01E3
	goto _0173
	.byte 0x02, 0x00, 0x00, 0x00

_0208:
	step 75, 1
	step 35, 1
	step_end

_0214:
	step 12, 1
	step 15, 2
	step_end

_0220:
	step 15, 2
	step_end

_0228:
	step 13, 1
	step 15, 2
	step_end

_0234:
	step 13, 1
	step 14, 2
	step 13, 9
	step_end

_0244:
	step 13, 1
	step 14, 2
	step 13, 8
	step_end

_0254:
	step 13, 1
	step 14, 2
	step 13, 7
	step_end
scr_seq_R39_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _038C
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _03A0
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _02DD
	apply_movement obj_player, _03B4
	apply_movement obj_R39_gsmiddleman1_2, _0400
	goto _032B

_02DD:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _02F8
	apply_movement obj_player, _03CC
	goto _032B

_02F8:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _031B
	apply_movement obj_player, _03EC
	apply_movement obj_R39_gsmiddleman1_2, _0400
	goto _032B

_031B:
	apply_movement obj_player, _03D8
	apply_movement obj_R39_gsmiddleman1_2, _0400
_032B:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0352
	apply_movement obj_partner_poke, _040C
	wait_movement
_0352:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 28
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

_038C:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 5
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_03A0:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 3
	wait_button_or_walk_away
	closemsg
	releaseall
	end


_03B4:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_03CC:
	step 12, 3
	step 33, 1
	step_end

_03D8:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_03EC:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_0400:
	step 63, 1
	step 32, 1
	step_end

_040C:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_R39_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0396_R39_00010
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0485
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0490
	npc_msg msg_0396_R39_00011
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 80
	faceplayer
	lockall
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	clearflag FLAG_UNK_189
	npc_msg msg_0396_R39_00012
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0485:
	npc_msg msg_0396_R39_00013
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0490:
	npc_msg msg_0396_R39_00014
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_R39_003:
	direction_signpost msg_0396_R39_00000, 1, 21, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_R39_004:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0396_R39_00001, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_R39_005:
	scrcmd_055 3, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0396_R39_00002, VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0
