#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T02GYM0101.h"
#include "msgdata/msg/msg_0454_T02GYM0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T02GYM0101_000
	scrdef scr_seq_T02GYM0101_001
	scrdef scr_seq_T02GYM0101_002
	scrdef scr_seq_T02GYM0101_003
	scrdef scr_seq_T02GYM0101_004
	scrdef_end

scr_seq_T02GYM0101_002:
	viridian_gym_init
	setvar VAR_UNK_4127, 0
	get_phone_book_rematch PHONE_CONTACT_BLUE, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 0
	goto_if_ne _0065
	compare VAR_UNK_40FD, 0
	goto_if_eq _005F
	get_weekday VAR_TEMP_x4002
	compare VAR_TEMP_x4002, 5
	goto_if_ne _0059
	setflag FLAG_HIDE_VIRIDIAN_GYM_BLUE
	goto _005D

_0059:
	clearflag FLAG_HIDE_VIRIDIAN_GYM_BLUE
_005D:
	end

_005F:
	clearflag FLAG_HIDE_VIRIDIAN_GYM_BLUE
	end

_0065:
	setflag FLAG_HIDE_VIRIDIAN_GYM_BLUE
	end

scr_seq_T02GYM0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge BADGE_EARTH, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0131
	npc_msg msg_0454_T02GYM0101_00000
	closemsg
	trainer_battle TRAINER_LEADER_BLUE_BLUE, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0147
	give_badge BADGE_EARTH
	addvar VAR_UNK_4135, 1
	setflag FLAG_UNK_998
	add_special_game_stat SCORE_EVENT_BADGE_GET
	settrainerflag TRAINER_ACE_TRAINER_M_ARABELLA
	settrainerflag TRAINER_ACE_TRAINER_F_SALMA
	settrainerflag TRAINER_ACE_TRAINER_M_BONITA
	settrainerflag TRAINER_DOUBLE_TEAM_ELAN_AND_IDA
	setflag FLAG_UNK_97F
	clearflag FLAG_HIDE_ROUTE_10_ZAPDOS
	setflag FLAG_HIDE_CERULEAN_CITY_MAN_OUTSIDE_CAVE
	setvar VAR_UNK_4096, 1
	npc_msg msg_0454_T02GYM0101_00001
	buffer_players_name 0
	npc_msg msg_0454_T02GYM0101_00002
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	npc_msg msg_0454_T02GYM0101_00003
	goto _00F0

_00F0:
	goto_if_no_item_space ITEM_TM92, 1, _0127
	callstd std_give_item_verbose
	setflag FLAG_GOT_TM92_FROM_BLUE
	buffer_players_name 0
	npc_msg msg_0454_T02GYM0101_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0127:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

_0131:
	goto_if_unset FLAG_GOT_TM92_FROM_BLUE, _00F0
	npc_msg msg_0454_T02GYM0101_00005
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0147:
	white_out
	releaseall
	end

scr_seq_T02GYM0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge BADGE_EARTH, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0186
	npc_msg msg_0454_T02GYM0101_00006
	scrcmd_600
	set_follow_mon_inhibit_state 1
	scrcmd_607
	scrcmd_109 253, 56
	setvar VAR_UNK_4127, 1
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0186:
	npc_msg msg_0454_T02GYM0101_00007
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T02GYM0101_003:
	scrcmd_609
	lockall
	goto_if_set FLAG_UNK_13A, _037D
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4000, 1
	goto_if_ne _01C9
	apply_movement obj_T02GYM0101_sunglasses, _0394
	apply_movement obj_player, _040C
	goto _02AB

_01C9:
	compare VAR_TEMP_x4000, 2
	goto_if_ne _01EC
	apply_movement obj_T02GYM0101_sunglasses, _03A4
	apply_movement obj_player, _040C
	goto _02AB

_01EC:
	compare VAR_TEMP_x4000, 3
	goto_if_ne _020F
	apply_movement obj_T02GYM0101_sunglasses, _03B4
	apply_movement obj_player, _040C
	goto _02AB

_020F:
	compare VAR_TEMP_x4000, 4
	goto_if_ne _0232
	apply_movement obj_T02GYM0101_sunglasses, _03C4
	apply_movement obj_player, _0418
	goto _02AB

_0232:
	compare VAR_TEMP_x4000, 5
	goto_if_ne _0255
	apply_movement obj_T02GYM0101_sunglasses, _03D4
	apply_movement obj_player, _0418
	goto _02AB

_0255:
	compare VAR_TEMP_x4000, 6
	goto_if_ne _0278
	apply_movement obj_T02GYM0101_sunglasses, _03E4
	apply_movement obj_player, _0418
	goto _02AB

_0278:
	compare VAR_TEMP_x4000, 8
	goto_if_ne _029B
	apply_movement obj_T02GYM0101_sunglasses, _03F0
	apply_movement obj_player, _0424
	goto _02AB

_029B:
	apply_movement obj_T02GYM0101_sunglasses, _03FC
	apply_movement obj_player, _0424
_02AB:
	wait_movement
	npc_msg msg_0454_T02GYM0101_00008
	closemsg
	setflag FLAG_UNK_13A
	compare VAR_TEMP_x4000, 1
	goto_if_ne _02D1
	apply_movement obj_T02GYM0101_sunglasses, _0430
	goto _037B

_02D1:
	compare VAR_TEMP_x4000, 2
	goto_if_ne _02EC
	apply_movement obj_T02GYM0101_sunglasses, _043C
	goto _037B

_02EC:
	compare VAR_TEMP_x4000, 3
	goto_if_ne _0307
	apply_movement obj_T02GYM0101_sunglasses, _0448
	goto _037B

_0307:
	compare VAR_TEMP_x4000, 4
	goto_if_ne _0322
	apply_movement obj_T02GYM0101_sunglasses, _0454
	goto _037B

_0322:
	compare VAR_TEMP_x4000, 5
	goto_if_ne _033D
	apply_movement obj_T02GYM0101_sunglasses, _0460
	goto _037B

_033D:
	compare VAR_TEMP_x4000, 6
	goto_if_ne _0358
	apply_movement obj_T02GYM0101_sunglasses, _046C
	goto _037B

_0358:
	compare VAR_TEMP_x4000, 8
	goto_if_ne _0373
	apply_movement obj_T02GYM0101_sunglasses, _046C
	goto _037B

_0373:
	apply_movement obj_T02GYM0101_sunglasses, _0474
_037B:
	wait_movement
_037D:
	scrcmd_600
	set_follow_mon_inhibit_state 1
	scrcmd_607
	scrcmd_109 253, 56
	setvar VAR_UNK_4127, 1
	releaseall
	end

	.balign 4, 0
_0394:
	FaceWest
	EmoteExclamationMark
	WalkNormalWest 5
	EndMovement

	.balign 4, 0
_03A4:
	FaceWest
	EmoteExclamationMark
	WalkNormalWest 4
	EndMovement

	.balign 4, 0
_03B4:
	FaceWest
	EmoteExclamationMark
	WalkNormalWest 3
	EndMovement

	.balign 4, 0
_03C4:
	FaceWest
	EmoteExclamationMark
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_03D4:
	FaceWest
	EmoteExclamationMark
	WalkNormalWest
	EndMovement

	.balign 4, 0
_03E4:
	FaceWest
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_03F0:
	FaceEast
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_03FC:
	FaceEast
	EmoteExclamationMark
	WalkNormalEast
	EndMovement

	.balign 4, 0
_040C:
	Delay16 2
	FaceEast
	EndMovement

	.balign 4, 0
_0418:
	Delay8 2
	FaceEast
	EndMovement

	.balign 4, 0
_0424:
	Delay8 2
	FaceWest
	EndMovement

	.balign 4, 0
_0430:
	WalkNormalEast 5
	FaceSouth
	EndMovement

	.balign 4, 0
_043C:
	WalkNormalEast 4
	FaceSouth
	EndMovement

	.balign 4, 0
_0448:
	WalkNormalEast 3
	FaceSouth
	EndMovement

	.balign 4, 0
_0454:
	WalkNormalEast 2
	FaceSouth
	EndMovement

	.balign 4, 0
_0460:
	WalkNormalEast
	FaceSouth
	EndMovement

	.balign 4, 0
_046C:
	FaceSouth
	EndMovement

	.balign 4, 0
_0474:
	WalkNormalWest
	FaceSouth
	EndMovement

scr_seq_T02GYM0101_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge BADGE_EARTH, VAR_SPECIAL_RESULT
	buffer_players_name 0
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _04A7
	npc_msg msg_0454_T02GYM0101_00009
	goto _04AA

_04A7:
	npc_msg msg_0454_T02GYM0101_00010
_04AA:
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
