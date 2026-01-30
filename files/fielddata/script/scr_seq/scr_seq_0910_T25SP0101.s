#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25SP0101.h"
#include "msgdata/msg/msg_0603_T25SP0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T25SP0101_000
	scrdef scr_seq_T25SP0101_001
	scrdef scr_seq_T25SP0101_002
	scrdef scr_seq_T25SP0101_003
	scrdef scr_seq_T25SP0101_004
	scrdef_end

scr_seq_T25SP0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	hasitem ITEM_COIN_CASE, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _006A
	apply_movement obj_T25SP0101_suit, _0080
	wait_movement
	npc_msg msg_0603_T25SP0101_00040
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	casino_game 0, 0
	restore_overworld
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	setvar VAR_TEMP_x4001, 2
	releaseall
	end

_006A:
	npc_msg msg_0603_T25SP0101_00038
	apply_movement obj_T25SP0101_suit, _0080
	wait_movement
	npc_msg msg_0603_T25SP0101_00039
	goto _00E8

	.balign 4, 0
_0080:
	FaceSouth
	EndMovement

	.balign 4, 0
_0088:
	FaceWest
	EndMovement

	.balign 4, 0
_0090:
	FaceEast
	EndMovement

scr_seq_T25SP0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_player_facing VAR_TEMP_x4002
	compare VAR_TEMP_x4002, 1
	goto_if_ne _00BD
	call _00F0
	goto _00C5

_00BD:
	apply_movement obj_T25SP0101_suit, _0080
_00C5:
	wait_movement
	hasitem ITEM_COIN_CASE, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _00E5
	npc_msg msg_0603_T25SP0101_00041
	goto _00E8

_00E5:
	npc_msg msg_0603_T25SP0101_00039
_00E8:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_00F0:
	get_player_coords VAR_TEMP_x4002, VAR_TEMP_x4003
	compare VAR_TEMP_x4002, 6
	goto_if_ne _0111
	apply_movement obj_T25SP0101_suit, _0088
	goto _0119

_0111:
	apply_movement obj_T25SP0101_suit, _0090
_0119:
	return

scr_seq_T25SP0101_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	hasitem ITEM_COIN_CASE, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0175
	compare VAR_TEMP_x4001, 0
	goto_if_ne _0154
	npc_msg msg_0603_T25SP0101_00034
	setvar VAR_TEMP_x4001, 1
	goto _016D

_0154:
	compare VAR_TEMP_x4001, 1
	goto_if_ne _016A
	npc_msg msg_0603_T25SP0101_00035
	goto _016D

_016A:
	npc_msg msg_0603_T25SP0101_00036
_016D:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0175:
	compare VAR_TEMP_x4001, 0
	goto_if_ne _018B
	npc_msg msg_0603_T25SP0101_00028
	goto _018E

_018B:
	npc_msg msg_0603_T25SP0101_00037
_018E:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _01C5
	npc_msg msg_0603_T25SP0101_00031
	setvar VAR_TEMP_x4001, 1
	giveitem_no_check ITEM_COIN_CASE, 1
	npc_msg msg_0603_T25SP0101_00032
	goto _00E8

_01C5:
	setvar VAR_TEMP_x4001, 1
	npc_msg msg_0603_T25SP0101_00033
	goto _00E8

scr_seq_T25SP0101_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	script_overlay_cmd 3, 0
	npc_msg msg_0603_T25SP0101_00000
	touchscreen_menu_hide
	scrcmd_116 0, 20, 2
_01EC:
	menu_init 1, 1, 0, 1, VAR_TEMP_x4000
	menu_item_add 12, 255, 0
	menu_item_add 13, 255, 1
	menu_item_add 11, 255, 2
	menu_exec
	switch VAR_TEMP_x4000
	case 0, _0234
	case 1, _02D0
	goto _0C17

_0234:
	menu_init 1, 1, 0, 1, VAR_TEMP_x4000
	menu_item_add 14, 255, 0
	menu_item_add 15, 255, 1
	menu_item_add 16, 255, 2
	menu_item_add 17, 255, 3
	menu_item_add 18, 255, 4
	menu_item_add 19, 255, 5
	menu_item_add 11, 255, 6
	menu_exec
	switch VAR_TEMP_x4000
	case 0, _0342
	case 1, _03CD
	case 2, _0458
	case 3, _04E3
	case 4, _056E
	case 5, _05F9
	goto _01EC

_02D0:
	menu_init 1, 1, 0, 1, VAR_TEMP_x4000
	menu_item_add 20, 255, 0
	menu_item_add 21, 255, 1
	menu_item_add 22, 255, 2
	menu_item_add 23, 255, 3
	menu_item_add 11, 255, 4
	menu_exec
	switch VAR_TEMP_x4000
	case 0, _0684
	case 1, _070F
	case 2, _079A
	case 3, _0825
	goto _01EC

_0342:
	goto_if_no_item_space ITEM_TM90, 1, _0B45
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg msg_0603_T25SP0101_00003
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _038B
	closemsg
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0234
_038B:
	get_coin_amount VAR_SPECIAL_x8006
	compare VAR_SPECIAL_x8006, 2000
	goto_if_lt _0BE6
	npc_msg msg_0603_T25SP0101_00004
	play_se SEQ_SE_DP_REGI
	take_coins 2000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	buffer_pocket_name 1, VAR_SPECIAL_RESULT
	npc_msg msg_0603_T25SP0101_00010
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_RESULT
	goto _0234
	end

_03CD:
	goto_if_no_item_space ITEM_TM75, 1, _0B45
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg msg_0603_T25SP0101_00003
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0416
	closemsg
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0234
_0416:
	get_coin_amount VAR_SPECIAL_x8006
	compare VAR_SPECIAL_x8006, 4000
	goto_if_lt _0BE6
	npc_msg msg_0603_T25SP0101_00004
	play_se SEQ_SE_DP_REGI
	take_coins 4000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	buffer_pocket_name 1, VAR_SPECIAL_RESULT
	npc_msg msg_0603_T25SP0101_00010
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_RESULT
	goto _0234
	end

_0458:
	goto_if_no_item_space ITEM_TM44, 1, _0B45
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg msg_0603_T25SP0101_00003
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _04A1
	closemsg
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0234
_04A1:
	get_coin_amount VAR_SPECIAL_x8006
	compare VAR_SPECIAL_x8006, 6000
	goto_if_lt _0BE6
	npc_msg msg_0603_T25SP0101_00004
	play_se SEQ_SE_DP_REGI
	take_coins 6000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	buffer_pocket_name 1, VAR_SPECIAL_RESULT
	npc_msg msg_0603_T25SP0101_00010
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_RESULT
	goto _0234
	end

_04E3:
	goto_if_no_item_space ITEM_TM35, 1, _0B45
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg msg_0603_T25SP0101_00003
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _052C
	closemsg
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0234
_052C:
	get_coin_amount VAR_SPECIAL_x8006
	compare VAR_SPECIAL_x8006, 10000
	goto_if_lt _0BE6
	npc_msg msg_0603_T25SP0101_00004
	play_se SEQ_SE_DP_REGI
	take_coins 10000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	buffer_pocket_name 1, VAR_SPECIAL_RESULT
	npc_msg msg_0603_T25SP0101_00010
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_RESULT
	goto _0234
	end

_056E:
	goto_if_no_item_space ITEM_TM13, 1, _0B45
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg msg_0603_T25SP0101_00003
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _05B7
	closemsg
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0234
_05B7:
	get_coin_amount VAR_SPECIAL_x8006
	compare VAR_SPECIAL_x8006, 10000
	goto_if_lt _0BE6
	npc_msg msg_0603_T25SP0101_00004
	play_se SEQ_SE_DP_REGI
	take_coins 10000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	buffer_pocket_name 1, VAR_SPECIAL_RESULT
	npc_msg msg_0603_T25SP0101_00010
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_RESULT
	goto _0234
	end

_05F9:
	goto_if_no_item_space ITEM_TM24, 1, _0B45
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg msg_0603_T25SP0101_00003
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0642
	closemsg
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0234
_0642:
	get_coin_amount VAR_SPECIAL_x8006
	compare VAR_SPECIAL_x8006, 10000
	goto_if_lt _0BE6
	npc_msg msg_0603_T25SP0101_00004
	play_se SEQ_SE_DP_REGI
	take_coins 10000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	buffer_pocket_name 1, VAR_SPECIAL_RESULT
	npc_msg msg_0603_T25SP0101_00010
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_RESULT
	goto _0234
	end

_0684:
	goto_if_no_item_space ITEM_SILK_SCARF, 1, _0B45
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg msg_0603_T25SP0101_00003
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _06CD
	closemsg
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _02D0
_06CD:
	get_coin_amount VAR_SPECIAL_x8006
	compare VAR_SPECIAL_x8006, 1000
	goto_if_lt _0BE6
	npc_msg msg_0603_T25SP0101_00004
	play_se SEQ_SE_DP_REGI
	take_coins 1000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	buffer_pocket_name 1, VAR_SPECIAL_RESULT
	npc_msg msg_0603_T25SP0101_00010
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_RESULT
	goto _02D0
	end

_070F:
	goto_if_no_item_space ITEM_WIDE_LENS, 1, _0B45
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg msg_0603_T25SP0101_00003
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0758
	closemsg
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _02D0
_0758:
	get_coin_amount VAR_SPECIAL_x8006
	compare VAR_SPECIAL_x8006, 1000
	goto_if_lt _0BE6
	npc_msg msg_0603_T25SP0101_00004
	play_se SEQ_SE_DP_REGI
	take_coins 1000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	buffer_pocket_name 1, VAR_SPECIAL_RESULT
	npc_msg msg_0603_T25SP0101_00010
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_RESULT
	goto _02D0
	end

_079A:
	goto_if_no_item_space ITEM_ZOOM_LENS, 1, _0B45
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg msg_0603_T25SP0101_00003
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _07E3
	closemsg
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _02D0
_07E3:
	get_coin_amount VAR_SPECIAL_x8006
	compare VAR_SPECIAL_x8006, 1000
	goto_if_lt _0BE6
	npc_msg msg_0603_T25SP0101_00004
	play_se SEQ_SE_DP_REGI
	take_coins 1000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	buffer_pocket_name 1, VAR_SPECIAL_RESULT
	npc_msg msg_0603_T25SP0101_00010
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_RESULT
	goto _02D0
	end

_0825:
	goto_if_no_item_space ITEM_METRONOME, 1, _0B45
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg msg_0603_T25SP0101_00003
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _086E
	closemsg
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _02D0
_086E:
	get_coin_amount VAR_SPECIAL_x8006
	compare VAR_SPECIAL_x8006, 1000
	goto_if_lt _0BE6
	npc_msg msg_0603_T25SP0101_00004
	play_se SEQ_SE_DP_REGI
	take_coins 1000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	buffer_pocket_name 1, VAR_SPECIAL_RESULT
	npc_msg msg_0603_T25SP0101_00010
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_RESULT
	goto _02D0
	end

scr_seq_T25SP0101_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	script_overlay_cmd 3, 0
	npc_msg msg_0603_T25SP0101_00009
	touchscreen_menu_hide
	scrcmd_116 0, 20, 2
	get_game_version VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 7
	goto_if_ne _08E5
	goto _08EB

_08DF:
	goto _08EB

_08E5:
	goto _0948

_08EB:
	menu_init 1, 1, 0, 1, VAR_TEMP_x4000
	menu_item_add 24, 255, 0
	menu_item_add 25, 255, 1
	menu_item_add 26, 255, 2
	menu_item_add 11, 255, 3
	menu_exec
	switch VAR_TEMP_x4000
	case 0, _09A5
	case 1, _09B1
	case 2, _09BD
	goto _0C17

_0948:
	menu_init 1, 1, 0, 1, VAR_TEMP_x4000
	menu_item_add 24, 255, 0
	menu_item_add 27, 255, 1
	menu_item_add 26, 255, 2
	menu_item_add 11, 255, 3
	menu_exec
	switch VAR_TEMP_x4000
	case 0, _09A5
	case 1, _09C9
	case 2, _09BD
	goto _0C17

_09A5:
	setorcopyvar VAR_TEMP_x4002, 63
	goto _09D5

_09B1:
	setorcopyvar VAR_TEMP_x4002, 23
	goto _09D5

_09BD:
	setorcopyvar VAR_TEMP_x4002, 147
	goto _09D5

_09C9:
	setorcopyvar VAR_TEMP_x4002, 27
	goto _09D5

_09D5:
	get_party_count VAR_SPECIAL_x8005
	compare VAR_SPECIAL_x8005, 6
	goto_if_ne _09F3
	npc_msg msg_0603_T25SP0101_00006
	wait_button_or_walk_away
	closemsg
	goto _0C26

_09F3:
	buffer_species_name 1, VAR_TEMP_x4002, 0, 0
	npc_msg msg_0603_T25SP0101_00007
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0A34
	closemsg
	get_game_version VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 7
	goto_if_ne _0A2E
	goto _08EB

_0A28:
	goto _0A34

_0A2E:
	goto _0948

_0A34:
	compare VAR_TEMP_x4002, 63
	goto_if_ne _0A58
	get_coin_amount VAR_SPECIAL_x8006
	compare VAR_SPECIAL_x8006, 200
	goto_if_lt _0BF1
	goto _0AB1

_0A58:
	compare VAR_TEMP_x4002, 23
	goto_if_ne _0A7C
	get_coin_amount VAR_SPECIAL_x8006
	compare VAR_SPECIAL_x8006, 700
	goto_if_lt _0BF1
	goto _0AB1

_0A7C:
	compare VAR_TEMP_x4002, 27
	goto_if_ne _0AA0
	get_coin_amount VAR_SPECIAL_x8006
	compare VAR_SPECIAL_x8006, 700
	goto_if_lt _0BF1
	goto _0AB1

_0AA0:
	get_coin_amount VAR_SPECIAL_x8006
	compare VAR_SPECIAL_x8006, 2100
	goto_if_lt _0BF1
_0AB1:
	npc_msg msg_0603_T25SP0101_00004
	play_se SEQ_SE_DP_REGI
	give_mon VAR_TEMP_x4002, 15, 0, 0, 0, VAR_SPECIAL_RESULT
	buffer_players_name 0
	buffer_species_name 1, VAR_TEMP_x4002, 0, 0
	npc_msg msg_0603_T25SP0101_00008
	compare VAR_TEMP_x4002, 63
	goto_if_ne _0AEB
	take_coins 200
	goto _0B1D

_0AEB:
	compare VAR_TEMP_x4002, 23
	goto_if_ne _0B02
	take_coins 700
	goto _0B1D

_0B02:
	compare VAR_TEMP_x4002, 27
	goto_if_ne _0B19
	take_coins 700
	goto _0B1D

_0B19:
	take_coins 2100
_0B1D:
	scrcmd_118 0
	get_game_version VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 7
	goto_if_ne _0B3D
	goto _08EB

_0B37:
	goto _0B43

_0B3D:
	goto _0948

_0B43:
	end

_0B45:
	npc_msg msg_0603_T25SP0101_00005
	closemsg
_0B4A:
	compare VAR_SPECIAL_x8004, 417
	goto_if_ne _0B63
	goto _0234

_0B5D:
	goto _0BE6

_0B63:
	compare VAR_SPECIAL_x8004, 402
	goto_if_ne _0B7C
	goto _0234

_0B76:
	goto _0BE6

_0B7C:
	compare VAR_SPECIAL_x8004, 371
	goto_if_ne _0B95
	goto _0234

_0B8F:
	goto _0BE6

_0B95:
	compare VAR_SPECIAL_x8004, 362
	goto_if_ne _0BAE
	goto _0234

_0BA8:
	goto _0BE6

_0BAE:
	compare VAR_SPECIAL_x8004, 340
	goto_if_ne _0BC7
	goto _0234

_0BC1:
	goto _0BE6

_0BC7:
	compare VAR_SPECIAL_x8004, 351
	goto_if_ne _0BE0
	goto _0234

_0BDA:
	goto _0BE6

_0BE0:
	goto _02D0

_0BE6:
	npc_msg msg_0603_T25SP0101_00002
	goto _0B4A
	end

_0BF1:
	npc_msg msg_0603_T25SP0101_00002
	get_game_version VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 7
	goto_if_ne _0C11
	goto _08EB

_0C0B:
	goto _0C17

_0C11:
	goto _0948

_0C17:
	npc_msg msg_0603_T25SP0101_00001
	wait_button_or_walk_away
	closemsg
	goto _0C26
	end

_0C26:
	scrcmd_117
	touchscreen_menu_show
	script_overlay_cmd 3, 1
	releaseall
	end
	.balign 4, 0
