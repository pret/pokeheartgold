#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T09.h"
#include "msgdata/msg/msg_0519_T09.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T09_000
	scrdef scr_seq_T09_001
	scrdef scr_seq_T09_002
	scrdef scr_seq_T09_003
	scrdef scr_seq_T09_004
	scrdef_end

scr_seq_T09_003:
	goto_if_unset FLAG_UNK_189, _0027
	clearflag FLAG_UNK_189
	end

_0027:
	goto_if_set FLAG_UNK_129, _0038
	setflag FLAG_UNK_27D
	end

_0038:
	setflag FLAG_UNK_25A
	get_phone_book_rematch PHONE_CONTACT_BLUE, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 0
	goto_if_ne _007B
	compare VAR_UNK_40FD, 0
	goto_if_eq _007B
	get_weekday VAR_TEMP_x4002
	compare VAR_TEMP_x4002, 5
	goto_if_ne _0077
	clearflag FLAG_UNK_25A
	goto _007B

_0077:
	setflag FLAG_UNK_25A
_007B:
	check_registered_phone_number PHONE_CONTACT_BLAINE, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 1
	goto_if_eq _00CC
	check_badge BADGE_EARTH, VAR_TEMP_x4002
	compare VAR_TEMP_x4002, 1
	goto_if_eq _00A9
	goto _0102
	end

_00A9:
	get_weekday VAR_TEMP_x4002
	compare VAR_TEMP_x4002, 2
	goto_if_ne _00C4
	clearflag FLAG_UNK_27D
	goto _00CA

_00C4:
	goto _0102

_00CA:
	end

_00CC:
	get_phone_book_rematch PHONE_CONTACT_BLAINE, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 0
	goto_if_ne _0102
	get_weekday VAR_TEMP_x4002
	compare VAR_TEMP_x4002, 4
	goto_if_ne _00FA
	clearflag FLAG_UNK_27D
	goto _0100

_00FA:
	goto _0102

_0100:
	end

_0102:
	setflag FLAG_UNK_27D
	end

scr_seq_T09_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	release obj_partner_poke
	apply_movement obj_partner_poke, _02FC
	wait_movement
	lock obj_partner_poke
	compare VAR_UNK_40FD, 0
	goto_if_ne _0304
	goto_if_set FLAG_UNK_128, _016F
	setflag FLAG_UNK_128
	npc_msg msg_0519_T09_00000
	closemsg
	get_player_facing VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 0
	goto_if_ne _0162
	apply_movement obj_T09_gsleader16, _0268
	goto _016A

_0162:
	apply_movement obj_T09_gsleader16, _0280
_016A:
	wait_movement
	npc_msg msg_0519_T09_00001
_016F:
	compare VAR_UNK_4135, 7
	goto_if_ge _018C
	buffer_int 0, VAR_UNK_4135
	npc_msg msg_0519_T09_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_018C:
	npc_msg msg_0519_T09_00002
	closemsg
	get_player_facing VAR_TEMP_x4000
	get_person_coords 253, VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	compare VAR_TEMP_x4000, 0
	goto_if_ne _01C7
	compare VAR_SPECIAL_x8004, 1035
	goto_if_ne _01C1
	apply_movement obj_partner_poke, _02D4
	wait_movement
_01C1:
	goto _01DE

_01C7:
	compare VAR_SPECIAL_x8005, 495
	goto_if_ne _01DE
	apply_movement obj_partner_poke, _02E4
	wait_movement
_01DE:
	compare VAR_TEMP_x4000, 0
	goto_if_ne _01F9
	apply_movement obj_T09_gsleader16, _0298
	goto _0201

_01F9:
	apply_movement obj_T09_gsleader16, _02A4
_0201:
	wait_movement
	npc_msg msg_0519_T09_00003
	closemsg
	compare VAR_TEMP_x4000, 0
	goto_if_ne _0233
	apply_movement obj_T09_gsleader16, _02B0
	apply_movement obj_player, _02F4
	apply_movement obj_partner_poke, _02F4
	goto _024B

_0233:
	apply_movement obj_T09_gsleader16, _02C0
	apply_movement obj_player, _02F4
	apply_movement obj_partner_poke, _02F4
_024B:
	wait_movement
	hide_person obj_T09_gsleader16
	setflag FLAG_UNK_25A
	setflag FLAG_UNK_129
	setflag FLAG_HIDE_VIRIDIAN_CITY_OLD_MAN_OUTSIDE_GYM_LOCKED
	clearflag FLAG_HIDE_VIRIDIAN_CITY_OLD_MAN_OUTSIDE_GYM_UNLOCKED
	releaseall
	end

	.balign 4, 0
_0268:
	WalkOnSpotNormalEast
	Delay8 2
	WalkOnSpotNormalNorth
	Delay8 2
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0280:
	WalkOnSpotNormalNorth
	Delay8 2
	WalkOnSpotNormalEast
	Delay8 2
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0298:
	WalkNormalWest
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_02A4:
	WalkNormalSouth
	WalkNormalWest
	EndMovement

	.balign 4, 0
_02B0:
	WalkNormalSouth 2
	WalkNormalWest 2
	WalkNormalSouth 8
	EndMovement

	.balign 4, 0
_02C0:
	WalkNormalSouth
	WalkNormalSouth 2
	WalkNormalWest 2
	WalkNormalSouth 7
	EndMovement

	.balign 4, 0
_02D4:
	WalkNormalSouth
	WalkNormalEast
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_02E4:
	WalkNormalWest
	WalkNormalNorth
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_02F4:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_02FC:
	Delay1
	EndMovement

_0304:
	npc_msg msg_0519_T09_00005
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0365
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0370
	npc_msg msg_0519_T09_00006
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 92
	faceplayer
	lockall
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	clearflag FLAG_UNK_189
	npc_msg msg_0519_T09_00007
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0365:
	npc_msg msg_0519_T09_00008
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0370:
	npc_msg msg_0519_T09_00009
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T09_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_registered_phone_number PHONE_CONTACT_BLAINE, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 1
	goto_if_eq _0429
	compare VAR_TEMP_x4004, 1
	goto_if_ge _041E
	npc_msg msg_0519_T09_00010
_03A6:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _03CA
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ge _040D
	end

_03CA:
	buffer_players_name 0
	npc_msg msg_0519_T09_00011
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	register_gear_number PHONE_CONTACT_BLAINE
	npc_msg msg_0519_T09_00012
	wait_button_or_walk_away
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	setflag FLAG_UNK_27D
	hide_person obj_T09_gsleader15
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

_040D:
	setvar VAR_TEMP_x4004, 1
	npc_msg msg_0519_T09_00013
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_041E:
	npc_msg msg_0519_T09_00014
	goto _03A6
	end

_0429:
	npc_msg msg_0519_T09_00015
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _048A
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0495
	npc_msg msg_0519_T09_00016
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 85
	faceplayer
	lockall
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	clearflag FLAG_UNK_189
	npc_msg msg_0519_T09_00017
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_048A:
	npc_msg msg_0519_T09_00018
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0495:
	npc_msg msg_0519_T09_00019
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T09_001:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0519_T09_00020, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T09_002:
	direction_signpost msg_0519_T09_00021, 0, 9, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0
