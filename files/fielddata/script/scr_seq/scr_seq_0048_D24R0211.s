#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D24R0211.h"
#include "msgdata/msg/msg_0079_D24R0211.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D24R0211_000
	scrdef scr_seq_D24R0211_001
	scrdef scr_seq_D24R0211_002
	scrdef scr_seq_D24R0211_003
	scrdef scr_seq_D24R0211_004
	scrdef_end

scr_seq_D24R0211_003:
	goto_if_unset FLAG_UNK_189, _0027
	clearflag FLAG_UNK_189
	end

_0027:
	check_badge BADGE_PLAIN, VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 0
	goto_if_eq _0065
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 1
	goto_if_eq _006B
	compare VAR_TEMP_x4000, 2
	goto_if_eq _006B
	compare VAR_TEMP_x4000, 4
	goto_if_eq _006B
_0065:
	setflag FLAG_HIDE_CAMERON
	end

_006B:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_D24R0211_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0079_D24R0211_00000
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D24R0211_001:
	scrcmd_609
	lockall
	move_person_facing obj_D24R0211_gsassistantm, 25, 0, 30, DIR_NORTH
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _0120
	apply_movement obj_D24R0211_gsassistantm, _0144
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	wait 15, VAR_SPECIAL_x8005
	npc_msg msg_0079_D24R0211_00001
	apply_movement obj_D24R0211_gsassistantm, _0160
	wait_movement
	npc_msg msg_0079_D24R0211_00002
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_D24R0102, 0, 7, 4, DIR_EAST
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	scrcmd_344 2, 2
	npc_msg msg_0079_D24R0211_00003
	scrcmd_527 4
	npc_msg msg_0079_D24R0211_00005
	buffer_players_name 0
	npc_msg msg_0079_D24R0211_00006
	play_fanfare SEQ_ME_LVUP
	wait_fanfare
	addvar VAR_UNOWN_REPORT_LEVEL, 1
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.byte 0x00, 0x00

_0120:
	step 62, 1
	step 15, 1
	step 1, 1
	step 75, 1
	step 15, 1
	step 13, 2
	step 14, 2
	step 0, 1
	step_end

_0144:
	step 63, 4
	step 16, 4
	step 19, 1
	step 16, 6
	step 18, 1
	step 32, 1
	step_end

_0160:
	step 1, 1
	step_end
scr_seq_D24R0211_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0290
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _02A4
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _01E1
	apply_movement obj_player, _02B8
	apply_movement obj_D24R0211_gsmiddleman1, _0304
	goto _022F

_01E1:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _01FC
	apply_movement obj_player, _02D0
	goto _022F

_01FC:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _021F
	apply_movement obj_player, _02F0
	apply_movement obj_D24R0211_gsmiddleman1, _0304
	goto _022F

_021F:
	apply_movement obj_player, _02DC
	apply_movement obj_D24R0211_gsmiddleman1, _0304
_022F:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0256
	apply_movement obj_partner_poke, _0310
	wait_movement
_0256:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 4
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

_0290:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 5
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_02A4:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 3
	wait_button_or_walk_away
	closemsg
	releaseall
	end


_02B8:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_02D0:
	step 12, 3
	step 33, 1
	step_end

_02DC:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_02F0:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_0304:
	step 63, 1
	step 32, 1
	step_end

_0310:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_D24R0211_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0290
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _02A4
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0399
	apply_movement obj_player, _02B8
	apply_movement obj_D24R0211_gsmiddleman1_2, _0304
	goto _03E7

_0399:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _03B4
	apply_movement obj_player, _02D0
	goto _03E7

_03B4:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _03D7
	apply_movement obj_player, _02F0
	apply_movement obj_D24R0211_gsmiddleman1_2, _0304
	goto _03E7

_03D7:
	apply_movement obj_player, _02DC
	apply_movement obj_D24R0211_gsmiddleman1_2, _0304
_03E7:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _040E
	apply_movement obj_partner_poke, _0310
	wait_movement
_040E:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 4
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
	.balign 4, 0
