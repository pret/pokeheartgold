#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07R0102.h"
#include "msgdata/msg/msg_0495_T07R0102.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T07R0102_000
	scrdef scr_seq_T07R0102_001
	scrdef scr_seq_T07R0102_002
	scrdef scr_seq_T07R0102_003
	scrdef scr_seq_T07R0102_004
	scrdef scr_seq_T07R0102_005
	scrdef scr_seq_T07R0102_006
	scrdef scr_seq_T07R0102_007
	scrdef_end

scr_seq_T07R0102_006:
	goto_if_unset FLAG_UNK_189, _0033
	clearflag FLAG_UNK_189
	end

_0033:
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 5
	goto_if_ne _004E
	clearflag FLAG_HIDE_CAMERON
	goto _0052

_004E:
	setflag FLAG_HIDE_CAMERON
_0052:
	end

scr_seq_T07R0102_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd std_mart_intro
	holdmsg
	setvar VAR_SPECIAL_x8004, 18
	callstd std_special_mart
	releaseall
	end

scr_seq_T07R0102_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd std_mart_intro
	holdmsg
	setvar VAR_SPECIAL_x8004, 19
	callstd std_special_mart
	releaseall
	end

scr_seq_T07R0102_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	hasitem ITEM_FASHION_CASE, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _01DA
	npc_msg msg_0495_T07R0102_00003
	get_player_facing VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 2
	goto_if_ne _00C9
	apply_movement obj_T07R0102_leader3, _01E8
	goto _00D1

_00C9:
	apply_movement obj_T07R0102_leader3, _0200
_00D1:
	wait_movement
	npc_msg msg_0495_T07R0102_00004
	apply_movement obj_T07R0102_leader3, _0218
	wait_movement
	compare VAR_TEMP_x4000, 0
	goto_if_ne _00FB
	apply_movement obj_T07R0102_leader3, _0220
	goto _011E

_00FB:
	compare VAR_TEMP_x4000, 2
	goto_if_ne _0116
	apply_movement obj_T07R0102_leader3, _0230
	goto _011E

_0116:
	apply_movement obj_T07R0102_leader3, _0228
_011E:
	wait_movement
	npc_msg msg_0495_T07R0102_00005
	setvar VAR_SPECIAL_x8004, 92
	setvar VAR_SPECIAL_x8005, 1
	callstd std_receive_accessory
	npc_msg msg_0495_T07R0102_00006
	setvar VAR_SPECIAL_x8004, 93
	setvar VAR_SPECIAL_x8005, 1
	callstd std_receive_accessory
	npc_msg msg_0495_T07R0102_00007
	setvar VAR_SPECIAL_x8004, 94
	setvar VAR_SPECIAL_x8005, 1
	callstd std_receive_accessory
	npc_msg msg_0495_T07R0102_00008
	closemsg
	compare VAR_TEMP_x4000, 3
	call_if_eq _01A0
	compare VAR_TEMP_x4000, 3
	goto_if_ne _0186
	apply_movement obj_T07R0102_leader3, _0250
	goto _018E

_0186:
	apply_movement obj_T07R0102_leader3, _0238
_018E:
	wait_movement
	hide_person obj_T07R0102_leader3
	setflag FLAG_UNK_313
	clearflag FLAG_HIDE_ROUTE_47_CRASHER_WAKE
	releaseall
	end

_01A0:
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _01D8
	get_person_coords 253, VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	compare VAR_SPECIAL_x8005, 5
	goto_if_ne _01D8
	release obj_partner_poke
	apply_movement obj_partner_poke, _0264
	wait_movement
	lock obj_partner_poke
_01D8:
	return

_01DA:
	npc_msg msg_0495_T07R0102_00009
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_01E8:
	step 14, 1
	step 32, 1
	step 63, 1
	step 15, 1
	step 32, 1
	step_end

_0200:
	step 15, 1
	step 32, 1
	step 63, 1
	step 14, 1
	step 32, 1
	step_end

_0218:
	step 75, 1
	step_end

_0220:
	step 33, 1
	step_end

_0228:
	step 34, 1
	step_end

_0230:
	step 35, 1
	step_end

_0238:
	step 14, 2
	step 13, 1
	step 14, 4
	step 12, 1
	step 14, 4
	step_end

_0250:
	step 13, 1
	step 14, 6
	step 12, 1
	step 14, 4
	step_end

_0264:
	step 78, 1
	step 76, 1
	step 1, 1
	step_end
scr_seq_T07R0102_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _039C
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _03B0
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _02ED
	apply_movement obj_player, _03C4
	apply_movement obj_T07R0102_gsmiddleman1_2, _0410
	goto _033B

_02ED:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0308
	apply_movement obj_player, _03DC
	goto _033B

_0308:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _032B
	apply_movement obj_player, _03FC
	apply_movement obj_T07R0102_gsmiddleman1_2, _0410
	goto _033B

_032B:
	apply_movement obj_player, _03E8
	apply_movement obj_T07R0102_gsmiddleman1_2, _0410
_033B:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0362
	apply_movement obj_partner_poke, _041C
	wait_movement
_0362:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 58
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

_039C:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 5
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_03B0:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 3
	wait_button_or_walk_away
	closemsg
	releaseall
	end


_03C4:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_03DC:
	step 12, 3
	step 33, 1
	step_end

_03E8:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_03FC:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_0410:
	step 63, 1
	step 32, 1
	step_end

_041C:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_T07R0102_002:
	simple_npc_msg msg_0495_T07R0102_00000
	end

scr_seq_T07R0102_003:
	simple_npc_msg msg_0495_T07R0102_00001
	end

scr_seq_T07R0102_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0495_T07R0102_00002
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
