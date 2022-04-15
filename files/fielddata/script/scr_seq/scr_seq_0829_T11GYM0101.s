#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T11GYM0101.h"
#include "msgdata/msg/msg_0531_T11GYM0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T11GYM0101_000
	scrdef scr_seq_T11GYM0101_001
	scrdef scr_seq_T11GYM0101_002
	scrdef scr_seq_T11GYM0101_003
	scrdef scr_seq_T11GYM0101_004
	scrdef_end

scr_seq_T11GYM0101_004:
	get_phone_book_rematch PHONE_CONTACT_SABRINA, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 0
	goto_if_ne _0089
	check_registered_phone_number PHONE_CONTACT_SABRINA, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 1
	goto_if_eq _006C
	check_badge BADGE_MARSH, VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 1
	goto_if_eq _0055
	goto _0083

_0055:
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 5
	goto_if_ne _0083
	setflag FLAG_UNK_2F1
	end

_006C:
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 1
	goto_if_ne _0083
	setflag FLAG_UNK_2F1
	end

_0083:
	clearflag FLAG_UNK_2F1
	end

_0089:
	setflag FLAG_UNK_2F1
	end

scr_seq_T11GYM0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge BADGE_MARSH, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0140
	npc_msg msg_0531_T11GYM0101_00000
	closemsg
	trainer_battle TRAINER_LEADER_SABRINA_SABRINA, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0156
	give_badge BADGE_MARSH
	addvar VAR_UNK_4135, 1
	add_special_game_stat 22
	setflag FLAG_UNK_998
	settrainerflag TRAINER_PSYCHIC_M_FRANKLIN
	settrainerflag TRAINER_PSYCHIC_M_JARED
	settrainerflag TRAINER_MEDIUM_REBECCA
	settrainerflag TRAINER_MEDIUM_DARCY
	npc_msg msg_0531_T11GYM0101_00001
	buffer_players_name 0
	npc_msg msg_0531_T11GYM0101_00002
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	npc_msg msg_0531_T11GYM0101_00003
	goto _0102

_0102:
	goto_if_no_item_space ITEM_TM48, 1, _0136
	callstd std_give_item_verbose
	setflag FLAG_UNK_182
	npc_msg msg_0531_T11GYM0101_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0136:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

_0140:
	goto_if_unset FLAG_UNK_182, _0102
	npc_msg msg_0531_T11GYM0101_00005
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0156:
	white_out
	releaseall
	end

scr_seq_T11GYM0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge BADGE_MARSH, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0182
	npc_msg msg_0531_T11GYM0101_00006
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0182:
	npc_msg msg_0531_T11GYM0101_00007
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T11GYM0101_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge BADGE_MARSH, VAR_SPECIAL_RESULT
	buffer_players_name 0
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _01B4
	npc_msg msg_0531_T11GYM0101_00008
	goto _01B7

_01B4:
	npc_msg msg_0531_T11GYM0101_00009
_01B7:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T11GYM0101_003:
	scrcmd_609
	lockall
	scrcmd_600
	play_se SEQ_SE_PL_BOWABOWA
	apply_movement obj_player, _01FC
	wait_movement
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_T11GYM0101, 0, 15, 23, DIR_SOUTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end
	.byte 0x00

_01FC:
	step 1, 2
	step 2, 2
	step 0, 2
	step 3, 2
	step 1, 2
	step 2, 2
	step 0, 2
	step 3, 2
	step 1, 2
	step 2, 2
	step 0, 2
	step 3, 2
	step 1, 2
	step 2, 2
	step 0, 2
	step 3, 1
	step 69, 0
	step_end
	.balign 4, 0
