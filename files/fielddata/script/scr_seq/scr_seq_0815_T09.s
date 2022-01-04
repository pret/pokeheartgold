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
	checkflag FLAG_UNK_189
	gotoif FALSE, _0027
	clearflag FLAG_UNK_189
	end

_0027:
	checkflag FLAG_UNK_129
	gotoif TRUE, _0038
	setflag FLAG_UNK_27D
	end

_0038:
	setflag FLAG_UNK_25A
	get_phone_book_rematch 31, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, _007B
	comparevartovalue VAR_UNK_40FD, 0
	gotoif eq, _007B
	get_weekday VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 5
	gotoif ne, _0077
	clearflag FLAG_UNK_25A
	goto _007B

_0077:
	setflag FLAG_UNK_25A
_007B:
	scrcmd_147 30, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _00CC
	check_badge 15, VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif eq, _00A9
	goto _0102
	.byte 0x02, 0x00
_00A9:
	get_weekday VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 2
	gotoif ne, _00C4
	clearflag FLAG_UNK_27D
	goto _00CA

_00C4:
	goto _0102

_00CA:
	end

_00CC:
	get_phone_book_rematch 30, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, _0102
	get_weekday VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 4
	gotoif ne, _00FA
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
	comparevartovalue VAR_UNK_40FD, 0
	gotoif ne, _0304
	checkflag FLAG_UNK_128
	gotoif TRUE, _016F
	setflag FLAG_UNK_128
	npc_msg msg_0519_T09_00000
	closemsg
	get_player_facing VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, _0162
	apply_movement obj_T09_gsleader16, _0268
	goto _016A

_0162:
	apply_movement obj_T09_gsleader16, _0280
_016A:
	wait_movement
	npc_msg msg_0519_T09_00001
_016F:
	comparevartovalue VAR_UNK_4135, 7
	gotoif ge, _018C
	buffer_int 0, VAR_UNK_4135
	npc_msg msg_0519_T09_00004
	waitbutton
	closemsg
	releaseall
	end

_018C:
	npc_msg msg_0519_T09_00002
	closemsg
	get_player_facing VAR_TEMP_x4000
	get_person_coords 253, VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, _01C7
	comparevartovalue VAR_SPECIAL_x8004, 1035
	gotoif ne, _01C1
	apply_movement obj_partner_poke, _02D4
	wait_movement
_01C1:
	goto _01DE

_01C7:
	comparevartovalue VAR_SPECIAL_x8005, 495
	gotoif ne, _01DE
	apply_movement obj_partner_poke, _02E4
	wait_movement
_01DE:
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, _01F9
	apply_movement obj_T09_gsleader16, _0298
	goto _0201

_01F9:
	apply_movement obj_T09_gsleader16, _02A4
_0201:
	wait_movement
	npc_msg msg_0519_T09_00003
	closemsg
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, _0233
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
	.byte 0x00, 0x00, 0x00

_0268:
	step 35, 1
	step 63, 2
	step 32, 1
	step 63, 2
	step 33, 1
	step_end

_0280:
	step 32, 1
	step 63, 2
	step 35, 1
	step 63, 2
	step 34, 1
	step_end

_0298:
	step 14, 1
	step 13, 1
	step_end

_02A4:
	step 13, 1
	step 14, 1
	step_end

_02B0:
	step 13, 2
	step 14, 2
	step 13, 8
	step_end

_02C0:
	step 13, 1
	step 13, 2
	step 14, 2
	step 13, 7
	step_end

_02D4:
	step 13, 1
	step 15, 1
	step 34, 1
	step_end

_02E4:
	step 14, 1
	step 12, 1
	step 35, 1
	step_end

_02F4:
	step 33, 1
	step_end

_02FC:
	step 60, 1
	step_end
_0304:
	npc_msg msg_0519_T09_00005
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0365
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0370
	npc_msg msg_0519_T09_00006
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 92
	faceplayer
	lockall
	fade_screen 6, 1, 1, 0x00
	wait_fade
	clearflag FLAG_UNK_189
	npc_msg msg_0519_T09_00007
	waitbutton
	closemsg
	releaseall
	end

_0365:
	npc_msg msg_0519_T09_00008
	waitbutton
	closemsg
	releaseall
	end

_0370:
	npc_msg msg_0519_T09_00009
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T09_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_147 30, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _0429
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ge, _041E
	npc_msg msg_0519_T09_00010
_03A6:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _03CA
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, _040D
	end

_03CA:
	buffer_players_name 0
	npc_msg msg_0519_T09_00011
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	register_gear_number 30
	npc_msg msg_0519_T09_00012
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	setflag FLAG_UNK_27D
	hide_person obj_T09_gsleader15
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

_040D:
	setvar VAR_TEMP_x4004, 1
	npc_msg msg_0519_T09_00013
	waitbutton
	closemsg
	releaseall
	end

_041E:
	npc_msg msg_0519_T09_00014
	goto _03A6
	.byte 0x02, 0x00
_0429:
	npc_msg msg_0519_T09_00015
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _048A
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0495
	npc_msg msg_0519_T09_00016
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 85
	faceplayer
	lockall
	fade_screen 6, 1, 1, 0x00
	wait_fade
	clearflag FLAG_UNK_189
	npc_msg msg_0519_T09_00017
	waitbutton
	closemsg
	releaseall
	end

_048A:
	npc_msg msg_0519_T09_00018
	waitbutton
	closemsg
	releaseall
	end

_0495:
	npc_msg msg_0519_T09_00019
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T09_001:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0519_T09_00020, VAR_SPECIAL_x800C
	callstd std_signpost
	end

scr_seq_T09_002:
	direction_signpost msg_0519_T09_00021, 0, 9, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd std_signpost
	end
	.balign 4, 0
