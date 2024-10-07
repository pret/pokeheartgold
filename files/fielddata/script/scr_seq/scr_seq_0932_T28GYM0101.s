#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T28GYM0101.h"
#include "msgdata/msg/msg_0622_T28GYM0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T28GYM0101_000
	scrdef scr_seq_T28GYM0101_001
	scrdef_end

scr_seq_T28GYM0101_001:
	goto_if_unset FLAG_UNK_189, _001B
	clearflag FLAG_UNK_189
	end

_001B:
	get_phone_book_rematch PHONE_CONTACT_PRYCE, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 0
	goto_if_ne _00B8
	goto_if_unset FLAG_GAME_CLEAR, _00B2
	check_registered_phone_number PHONE_CONTACT_PRYCE, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 1
	goto_if_eq _00B2
	scrcmd_522 VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 6
	goto_if_ne _0067
	setflag FLAG_UNK_2EE
	goto _00B0

_0067:
	compare VAR_TEMP_x4000, 7
	goto_if_ne _007E
	setflag FLAG_UNK_2EE
	goto _00B0

_007E:
	compare VAR_TEMP_x4000, 8
	goto_if_ne _0095
	setflag FLAG_UNK_2EE
	goto _00B0

_0095:
	compare VAR_TEMP_x4000, 9
	goto_if_ne _00AC
	setflag FLAG_UNK_2EE
	goto _00B0

_00AC:
	clearflag FLAG_UNK_2EE
_00B0:
	end

_00B2:
	clearflag FLAG_UNK_2EE
	end

_00B8:
	setflag FLAG_UNK_2EE
	end

// This script contains a programming mistake where if the
// player has 99 TM07, the TM07 from Pryce is permanently
// lost. This is unlike every other script for obtaining a
// TM from someone, which all attempt to give the TM until
// the player can accept it.
// FLAG_GOT_TM07_FROM_PRYCE is used here but no code in the
// game ever checks what it is, meaning that flag is useless.
scr_seq_T28GYM0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge BADGE_GLACIER, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0178
	npc_msg msg_0622_T28GYM0101_00000
	closemsg
	trainer_battle TRAINER_LEADER_PRYCE_PRYCE, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0172
	settrainerflag TRAINER_BOARDER_DEANDRE
	settrainerflag TRAINER_BOARDER_GERARDO
	settrainerflag TRAINER_SKIER_JILL
	settrainerflag TRAINER_SKIER_DIANA
	settrainerflag TRAINER_BOARDER_PATTON
	npc_msg msg_0622_T28GYM0101_00001
	give_badge BADGE_GLACIER
	addvar VAR_MIDGAME_BADGES, 1
	add_special_game_stat SCORE_EVENT_BADGE_GET
	compare VAR_MIDGAME_BADGES, 3
	goto_if_ne _012F
	setvar VAR_SCENE_ROCKET_TAKEOVER, 1
_012F:
	buffer_players_name 0
	npc_msg msg_0622_T28GYM0101_00002
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	npc_msg msg_0622_T28GYM0101_00003
	goto_if_no_item_space ITEM_TM07, 1, _018E
	callstd std_give_item_verbose
	setflag FLAG_GOT_TM07_FROM_PRYCE
	npc_msg msg_0622_T28GYM0101_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0172:
	white_out
	releaseall
	end

_0178:
	goto_if_set FLAG_GAME_CLEAR, _0198
	npc_msg msg_0622_T28GYM0101_00005
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_018E:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

_0198:
	npc_msg msg_0622_T28GYM0101_00006
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _01F9
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0204
	npc_msg msg_0622_T28GYM0101_00007
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 40
	faceplayer
	lockall
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	clearflag FLAG_UNK_189
	npc_msg msg_0622_T28GYM0101_00008
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_01F9:
	npc_msg msg_0622_T28GYM0101_00009
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0204:
	npc_msg msg_0622_T28GYM0101_00010
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
