#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T03.h"
#include "msgdata/msg/msg_0460_T03.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T03_000
	scrdef scr_seq_T03_001
	scrdef scr_seq_T03_002
	scrdef scr_seq_T03_003
	scrdef scr_seq_T03_004
	scrdef scr_seq_T03_005
	scrdef scr_seq_T03_006
	scrdef scr_seq_T03_007
	scrdef scr_seq_T03_008
	scrdef scr_seq_T03_009
	scrdef scr_seq_T03_010
	scrdef scr_seq_T03_011
	scrdef scr_seq_T03_012
	scrdef scr_seq_T03_013
	scrdef_end

scr_seq_T03_008:
	goto_if_unset FLAG_UNK_189, _004B
	clearflag FLAG_UNK_189
	end

_004B:
	goto _030E

_0051:
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 2
	goto_if_eq _0075
	compare VAR_TEMP_x4000, 6
	goto_if_eq _0075
	setflag FLAG_HIDE_CAMERON
	end

_0075:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_T03_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_game_version VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 7
	goto_if_ne _00A5
	goto_if_set FLAG_UNK_094, _0108
	goto _00B0

_00A5:
	goto_if_set FLAG_UNK_093, _0108
_00B0:
	npc_msg msg_0460_T03_00002
	get_game_version VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 7
	goto_if_ne _00E6
	setvar VAR_SPECIAL_x8004, 482
	setvar VAR_SPECIAL_x8005, 1
	callstd std_obtain_item_verbose
	setflag FLAG_UNK_094
	clearflag FLAG_HIDE_WHIRL_ISLAND_LUGIA
	setflag FLAG_HIDE_WHIRL_ISLANDS_BOTTOM_KIMONO_GIRLS
	goto _0102

_00E6:
	setvar VAR_SPECIAL_x8004, 483
	setvar VAR_SPECIAL_x8005, 1
	callstd std_obtain_item_verbose
	setflag FLAG_UNK_093
	clearflag FLAG_HIDE_BELL_TOWER_HO_OH
	setflag FLAG_HIDE_BELL_TOWER_SUMMIT_KIMONO_GIRLS
_0102:
	closemsg
	releaseall
	end

_0108:
	npc_msg msg_0460_T03_00005
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T03_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0218
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _022C
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0184
	apply_movement obj_player, _0240
	goto _01B7

_0184:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _01A7
	apply_movement obj_player, _0260
	apply_movement obj_T03_gsmiddleman1, _0274
	goto _01B7

_01A7:
	apply_movement obj_player, _024C
	apply_movement obj_T03_gsmiddleman1, _0274
_01B7:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _01DE
	apply_movement obj_partner_poke, _0280
	wait_movement
_01DE:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 66
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

_0218:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 5
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_022C:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 3
	wait_button_or_walk_away
	closemsg
	releaseall
	end


_0240:
	step 12, 3
	step 33, 1
	step_end

_024C:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_0260:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_0274:
	step 63, 1
	step 32, 1
	step_end

_0280:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_T03_001:
	simple_npc_msg msg_0460_T03_00000
	end

scr_seq_T03_002:
	simple_npc_msg msg_0460_T03_00001
	end

scr_seq_T03_003:
	direction_signpost msg_0460_T03_00020, 0, 3, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T03_004:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0460_T03_00021, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T03_005:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0460_T03_00022, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T03_006:
	direction_signpost msg_0460_T03_00023, 2, 0, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end

_030E:
	compare VAR_UNK_4083, 4
	goto_if_eq _0341
	compare VAR_UNK_4083, 2
	goto_if_eq _033D
	compare VAR_UNK_4083, 3
	goto_if_eq _033D
	goto _0051
	.byte 0x02, 0x00
_033D:
	clearflag FLAG_HIDE_PEWTER_CITY_STEVEN
_0341:
	get_game_version VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 7
	goto_if_ne _035C
	clearflag FLAG_HIDE_PEWTER_CITY_LATIOS
	goto _0360

_035C:
	clearflag FLAG_HIDE_PEWTER_CITY_LATIAS
_0360:
	end

scr_seq_T03_011:
	compare VAR_UNK_4083, 2
	goto_if_eq _0371
	end

_0371:
	move_person_facing obj_T03_daigo, 1047, 6, 81, DIR_WEST
	end

scr_seq_T03_013:
	goto_if_set FLAG_ENGAGING_STATIC_POKEMON, _038C
	end

_038C:
	get_game_version VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 7
	goto_if_ne _03AB
	setflag FLAG_HIDE_PEWTER_CITY_LATIOS
	hide_person obj_T03_tsure_poke_static_latios
	goto _03B3

_03AB:
	setflag FLAG_HIDE_PEWTER_CITY_LATIAS
	hide_person obj_T03_tsure_poke_static_latias
_03B3:
	end

scr_seq_T03_012:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _0440
	wait_movement
	apply_movement obj_T03_daigo, _045C
	wait_movement
	get_game_version VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 7
	goto_if_ne _03F1
	npc_msg msg_0460_T03_00006
	goto _03F4

_03F1:
	npc_msg msg_0460_T03_00007
_03F4:
	closemsg
	apply_movement obj_T03_daigo, _0464
	apply_movement obj_player, _0464
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	get_game_version VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 7
	goto_if_ne _042C
	npc_msg msg_0460_T03_00008
	goto _042F

_042C:
	npc_msg msg_0460_T03_00009
_042F:
	wait_button_or_walk_away
	closemsg
	setvar VAR_UNK_4083, 3
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_0440:
	step 13, 4
	step 2, 1
	step_end

_044C:
	step 63, 1
	step 15, 2
	step 63, 1
	step_end

_045C:
	step 33, 1
	step_end

_0464:
	step 14, 3
	step_end

_046C:
	step 13, 2
	step 14, 1
	step_end

_0478:
	step 34, 1
	step_end

_0480:
	step 15, 8
	step_end
scr_seq_T03_010:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_546 0, VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 0
	goto_if_eq _0649
	get_game_version VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 7
	goto_if_ne _04C8
	setvar VAR_TEMP_x400A, 381
	play_cry VAR_TEMP_x400A, 0
	npc_msg msg_0460_T03_00010
	goto _04D7

_04C8:
	setvar VAR_TEMP_x400A, 380
	play_cry VAR_TEMP_x400A, 0
	npc_msg msg_0460_T03_00011
_04D7:
	wait_cry
	closemsg
	setflag FLAG_ENGAGING_STATIC_POKEMON
	wild_battle VAR_TEMP_x400A, 40, 0
	clearflag FLAG_ENGAGING_STATIC_POKEMON
	scrcmd_683 VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 2
	goto_if_eq _057B
	compare VAR_TEMP_x4000, 3
	goto_if_eq _057B
	scrcmd_588 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0526
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _055A
_0526:
	get_game_version VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 7
	goto_if_ne _0540
	npc_msg msg_0460_T03_00012
	goto _0543

_0540:
	npc_msg msg_0460_T03_00013
_0543:
	closemsg
	compare VAR_UNK_4083, 4
	goto_if_eq _0649
	goto _0585
	.byte 0x02, 0x00
_055A:
	copyvar VAR_TEMP_x4009, VAR_UNK_4083
	setvar VAR_UNK_4083, 5
	compare VAR_TEMP_x4009, 4
	goto_if_eq _0649
	goto _0585
	.byte 0x02, 0x00
_057B:
	white_out
	goto _0649
	.byte 0x02, 0x00
_0585:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_T03_daigo, _046C
	apply_movement obj_player, _044C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	compare VAR_TEMP_x4000, 5
	goto_if_eq _060C
	compare VAR_TEMP_x4000, 1
	goto_if_eq _05D2
	compare VAR_TEMP_x4000, 4
	goto_if_eq _05FF
_05D2:
	get_game_version VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 7
	goto_if_ne _05EC
	npc_msg msg_0460_T03_00016
	goto _05EF

_05EC:
	npc_msg msg_0460_T03_00017
_05EF:
	closemsg
	setvar VAR_UNK_4083, 4
	goto _061F
	.byte 0x02, 0x00
_05FF:
	npc_msg msg_0460_T03_00014
	closemsg
	goto _061F
	.byte 0x02, 0x00
_060C:
	npc_msg msg_0460_T03_00018
	closemsg
	setvar VAR_UNK_4083, 4
	goto _061F
	.byte 0x02, 0x00
_061F:
	apply_movement obj_T03_daigo, _0478
	wait_movement
	npc_msg msg_0460_T03_00015
	closemsg
	apply_movement obj_T03_daigo, _0480
	wait_movement
	hide_person obj_T03_daigo
	compare VAR_UNK_4130, 4
	call_if_eq _064D
_0649:
	releaseall
	end

_064D:
	clearflag FLAG_HIDE_STEVEN_IN_HOUSE_AFTER_LATIS
	return

scr_seq_T03_009:
	simple_npc_msg msg_0460_T03_00019
	end
	.balign 4, 0
