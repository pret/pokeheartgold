#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T27GYM0101.h"
#include "msgdata/msg/msg_0614_T27GYM0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T27GYM0101_000
	scrdef scr_seq_T27GYM0101_001
	scrdef scr_seq_T27GYM0101_002
	scrdef scr_seq_T27GYM0101_003
	scrdef scr_seq_T27GYM0101_004
	scrdef scr_seq_T27GYM0101_005
	scrdef_end

scr_seq_T27GYM0101_000:
	ecruteak_gym_init
	get_phone_book_rematch PHONE_CONTACT_MORTY, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 0
	goto_if_ne _00AC
	goto_if_unset FLAG_GAME_CLEAR, _00A6
	check_registered_phone_number PHONE_CONTACT_MORTY, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 1
	goto_if_eq _0085
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 1
	goto_if_ne _0068
	setflag FLAG_HIDE_ECRUTEAK_GYM_MORTY
	goto _0083

_0068:
	compare VAR_TEMP_x4000, 2
	goto_if_ne _007F
	setflag FLAG_HIDE_ECRUTEAK_GYM_MORTY
	goto _0083

_007F:
	clearflag FLAG_HIDE_ECRUTEAK_GYM_MORTY
_0083:
	end

_0085:
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 5
	goto_if_ne _00A0
	setflag FLAG_HIDE_ECRUTEAK_GYM_MORTY
	goto _00A4

_00A0:
	clearflag FLAG_HIDE_ECRUTEAK_GYM_MORTY
_00A4:
	end

_00A6:
	clearflag FLAG_HIDE_ECRUTEAK_GYM_MORTY
	end

_00AC:
	setflag FLAG_HIDE_ECRUTEAK_GYM_MORTY
	end

scr_seq_T27GYM0101_004:
	scrcmd_609
	lockall
	apply_movement obj_T27GYM0101_gsoldman1, _0108
	wait_movement
	npc_msg msg_0614_T27GYM0101_00009
	closemsg
	apply_movement obj_T27GYM0101_gsoldman1, _0118
	apply_movement obj_player, _0128
	wait_movement
	setvar VAR_UNK_4079, 1
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_ECRUTEAK, 7, 376, 182, DIR_SOUTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

	.balign 4, 0
_0108:
	EmoteExclamationMark
	WalkNormalSouth 3
	Delay8
	EndMovement

	.balign 4, 0
_0118:
	WalkSlowSouth
	LockDir
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_0128:
	Delay8
	WalkNormalSouth
	Delay8
	EndMovement

scr_seq_T27GYM0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge BADGE_FOG, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _01D9
	npc_msg msg_0614_T27GYM0101_00000
	closemsg
	trainer_battle TRAINER_LEADER_MORTY_MORTY, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _01EF
	npc_msg msg_0614_T27GYM0101_00001
	give_badge BADGE_FOG
	addvar VAR_MIDGAME_BADGES, 1
	add_special_game_stat SCORE_EVENT_BADGE_GET
	setflag FLAG_UNK_998
	buffer_players_name 0
	npc_msg msg_0614_T27GYM0101_00002
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	npc_msg msg_0614_T27GYM0101_00003
	goto _019B

_019B:
	goto_if_no_item_space ITEM_TM30, 1, _01CF
	callstd std_give_item_verbose
	setflag FLAG_GOT_TM30_FROM_MORTY
	npc_msg msg_0614_T27GYM0101_00005
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_01CF:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

_01D9:
	goto_if_unset FLAG_GOT_TM30_FROM_MORTY, _019B
	npc_msg msg_0614_T27GYM0101_00006
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_01EF:
	white_out
	releaseall
	end

scr_seq_T27GYM0101_002:
	scrcmd_609
	lockall
	play_se SEQ_SE_DP_GYURU
	apply_movement obj_player, _0230
	wait_movement
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_ECRUTEAK_GYM, 0, 16, 49, DIR_NORTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

	.balign 4, 0
_0230:
	FaceSouth 2
	FaceWest 2
	FaceNorth 2
	FaceEast 2
	FaceSouth 2
	FaceWest 2
	FaceNorth 2
	FaceEast 2
	FaceSouth 2
	FaceWest 2
	FaceNorth 2
	FaceEast 2
	FaceSouth 2
	FaceWest 2
	FaceNorth 2
	FaceEast
	SetInvisible 0
	EndMovement

scr_seq_T27GYM0101_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge BADGE_FOG, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _029E
	npc_msg msg_0614_T27GYM0101_00007
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_029E:
	buffer_players_name 0
	npc_msg msg_0614_T27GYM0101_00008
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T27GYM0101_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge BADGE_FOG, VAR_SPECIAL_RESULT
	buffer_players_name 0
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _02D3
	npc_msg msg_0614_T27GYM0101_00010
	goto _02D6

_02D3:
	npc_msg msg_0614_T27GYM0101_00011
_02D6:
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
