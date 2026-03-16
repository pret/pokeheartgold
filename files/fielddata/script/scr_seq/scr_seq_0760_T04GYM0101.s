#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T04GYM0101.h"
#include "msgdata/msg/msg_0469_T04GYM0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T04GYM0101_000
	scrdef scr_seq_T04GYM0101_001
	scrdef scr_seq_T04GYM0101_002
	scrdef scr_seq_T04GYM0101_003
	scrdef scr_seq_T04GYM0101_004
	scrdef scr_seq_T04GYM0101_005
	scrdef scr_seq_T04GYM0101_006
	scrdef scr_seq_T04GYM0101_007
	scrdef_end

scr_seq_T04GYM0101_007:
	get_phone_book_rematch PHONE_CONTACT_MISTY, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 0
	goto_if_ne _00ED
	check_badge BADGE_EARTH, VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 0
	goto_if_eq _00E5
	compare VAR_SCENE_ROUTE_25, 1
	goto_if_eq _00E7
	compare VAR_SCENE_ROUTE_25, 2
	goto_if_eq _00E7
	check_registered_phone_number PHONE_CONTACT_MISTY, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 1
	goto_if_eq _00AD
	scrcmd_522 VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 16
	goto_if_ne _0090
	setflag FLAG_HIDE_CERULEAN_GYM_POPULATION
	goto _00AB

_0090:
	compare VAR_TEMP_x4000, 17
	goto_if_ne _00A7
	setflag FLAG_HIDE_CERULEAN_GYM_POPULATION
	goto _00AB

_00A7:
	clearflag FLAG_HIDE_CERULEAN_GYM_POPULATION
_00AB:
	end

_00AD:
	scrcmd_522 VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 14
	goto_if_ne _00C8
	setflag FLAG_HIDE_CERULEAN_GYM_POPULATION
	goto _00E3

_00C8:
	compare VAR_TEMP_x4000, 15
	goto_if_ne _00DF
	setflag FLAG_HIDE_CERULEAN_GYM_POPULATION
	goto _00E3

_00DF:
	clearflag FLAG_HIDE_CERULEAN_GYM_POPULATION
_00E3:
	end

_00E5:
	end

_00E7:
	clearflag FLAG_HIDE_CERULEAN_GYM_POPULATION
	end

_00ED:
	setflag FLAG_HIDE_CERULEAN_GYM_POPULATION
	end

scr_seq_T04GYM0101_004:
	scrcmd_609
	lockall
	stop_bgm SEQ_GS_GYM
	play_bgm SEQ_GS_EYE_ROCKET
	apply_movement obj_T04GYM0101_rocketm, _01C8
	wait_movement
	play_se SEQ_SE_DP_WALL_HIT2
	npc_msg msg_0469_T04GYM0101_00000
	apply_movement obj_T04GYM0101_rocketm, _01D0
	wait_movement
	npc_msg msg_0469_T04GYM0101_00001
	apply_movement obj_T04GYM0101_rocketm, _01E4
	wait_movement
	npc_msg msg_0469_T04GYM0101_00002
	apply_movement obj_T04GYM0101_rocketm, _01F4
	wait_movement
	npc_msg msg_0469_T04GYM0101_00003
	closemsg
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0179
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0159
	end

_0159:
	apply_movement obj_T04GYM0101_rocketm, _01FC
	apply_movement obj_player, _0204
	apply_movement obj_partner_poke, _0210
	wait_movement
	goto _018B

_0179:
	apply_movement obj_T04GYM0101_rocketm, _01FC
	apply_movement obj_player, _0204
	wait_movement
_018B:
	play_se SEQ_SE_DP_KAIDAN2
	hide_person obj_T04GYM0101_rocketm
	wait_se SEQ_SE_DP_KAIDAN2
	stop_bgm SEQ_GS_EYE_ROCKET
	play_bgm SEQ_GS_GYM
	setflag FLAG_HIDE_CERULEAN_GYM_ROCKET
	clearflag FLAG_HIDE_ROUTE_24_ROCKET
	clearflag FLAG_HIDE_ROUTE_25_MISTY
	clearflag FLAG_HIDE_ROUTE_25_MISTYS_BOYFRIEND
	setvar VAR_UNK_411C, 2
	setvar VAR_SCENE_ROUTE_24_ROCKET, 1
	setvar VAR_UNK_4088, 1
	releaseall
	end

	.balign 4, 0
_01C8:
	WalkFasterSouth 5
	EndMovement

	.balign 4, 0
_01D0:
	LockDir
	JumpFarNorth
	Delay8 2
	WalkFastSouth 2
	EndMovement

	.balign 4, 0
_01E4:
	EmoteExclamationMark
	LockDir
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_01F4:
	WalkNormalSouth 2
	EndMovement

	.balign 4, 0
_01FC:
	WalkFastSouth
	EndMovement

	.balign 4, 0
_0204:
	WalkFastWest
	FaceEast
	EndMovement

	.balign 4, 0
_0210:
	WalkFastWest
	EndMovement

scr_seq_T04GYM0101_006:
	scrcmd_814
	goto_if_set FLAG_HIDE_CERULEAN_GYM_MACHINE_PART, _022F
	make_object_visible obj_T04GYM0101_stop
	make_object_visible obj_T04GYM0101_stop_2
	end

_022F:
	end

scr_seq_T04GYM0101_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	buffer_players_name 0
	npc_msg msg_0469_T04GYM0101_00016
	goto_if_no_item_space ITEM_MACHINE_PART, 1, _027C
	callstd std_obtain_item_verbose
	hide_person obj_T04GYM0101_stop
	hide_person obj_T04GYM0101_stop_2
	setflag FLAG_HIDE_CERULEAN_GYM_MACHINE_PART
	setvar VAR_SCENE_ROUTE_24_ROCKET, 4
	closemsg
	releaseall
	end

_027C:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_T04GYM0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge BADGE_CASCADE, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0348
	npc_msg msg_0469_T04GYM0101_00008
	closemsg
	trainer_battle TRAINER_LEADER_MISTY_MISTY, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _035E
	give_badge BADGE_CASCADE
	addvar VAR_UNK_4135, 1
	add_special_game_stat SCORE_EVENT_BADGE_GET
	settrainerflag TRAINER_SWIMMER_F_DIANA
	settrainerflag TRAINER_SWIMMER_F_BRIANA
	settrainerflag TRAINER_SWIMMER_F_JOY
	settrainerflag TRAINER_SAILOR_PARKER
	settrainerflag TRAINER_SAILOR_EDDIE
	npc_msg msg_0469_T04GYM0101_00009
	buffer_players_name 0
	npc_msg msg_0469_T04GYM0101_00010
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	call_if_set FLAG_UNK_14D, _0364
	buffer_players_name 0
	npc_msg msg_0469_T04GYM0101_00011
	goto _0307

_0307:
	goto_if_no_item_space ITEM_TM03, 1, _033E
	callstd std_give_item_verbose
	setflag FLAG_GOT_TM03_FROM_MISTY
	buffer_players_name 0
	npc_msg msg_0469_T04GYM0101_00012
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_033E:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

_0348:
	goto_if_unset FLAG_GOT_TM03_FROM_MISTY, _0307
	npc_msg msg_0469_T04GYM0101_00013
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_035E:
	white_out
	releaseall
	end

_0364:
	clearflag FLAG_HIDE_ROUTE_25_SUICUNE
	setvar VAR_SCENE_ROUTE_25, 1
	return

scr_seq_T04GYM0101_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_UNK_4088, 2
	goto_if_ne _03AD
	check_badge BADGE_CASCADE, VAR_SPECIAL_RESULT
	buffer_players_name 0
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _03A4
	npc_msg msg_0469_T04GYM0101_00006
	goto _03A7

_03A4:
	npc_msg msg_0469_T04GYM0101_00007
_03A7:
	goto _03F6

_03AD:
	npc_msg msg_0469_T04GYM0101_00004
	goto _03F6

scr_seq_T04GYM0101_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_UNK_4088, 2
	goto_if_ne _03F3
	check_badge BADGE_CASCADE, VAR_SPECIAL_RESULT
	buffer_players_name 0
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _03EA
	npc_msg msg_0469_T04GYM0101_00006
	goto _03ED

_03EA:
	npc_msg msg_0469_T04GYM0101_00007
_03ED:
	goto _03F6

_03F3:
	npc_msg msg_0469_T04GYM0101_00005
_03F6:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T04GYM0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge BADGE_CASCADE, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0424
	npc_msg msg_0469_T04GYM0101_00014
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0424:
	npc_msg msg_0469_T04GYM0101_00015
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
