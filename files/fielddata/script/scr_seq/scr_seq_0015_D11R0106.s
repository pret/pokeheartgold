#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D11R0106.h"
#include "msgdata/msg/msg_0053_D11R0106.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D11R0106_000
	scrdef scr_seq_D11R0106_001
	scrdef scr_seq_D11R0106_002
	scrdef scr_seq_D11R0106_003
	scrdef scr_seq_D11R0106_004
	scrdef scr_seq_D11R0106_005
	scrdef scr_seq_D11R0106_006
	scrdef scr_seq_D11R0106_007
	scrdef scr_seq_D11R0106_008
	scrdef scr_seq_D11R0106_009
	scrdef_end

scr_seq_D11R0106_009:
	get_phone_book_rematch PHONE_CONTACT_BLAINE, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 0
	goto_if_ne _00AB
	check_registered_phone_number PHONE_CONTACT_BLAINE, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 1
	goto_if_eq _008A
	check_badge BADGE_EARTH, VAR_TEMP_x4002
	compare VAR_TEMP_x4002, 1
	goto_if_eq _0069
	clearflag FLAG_UNK_2F5
	end

_0069:
	get_weekday VAR_TEMP_x4002
	compare VAR_TEMP_x4002, 2
	goto_if_ne _0084
	setflag FLAG_UNK_2F5
	goto _0088

_0084:
	clearflag FLAG_UNK_2F5
_0088:
	end

_008A:
	get_weekday VAR_TEMP_x4002
	compare VAR_TEMP_x4002, 4
	goto_if_ne _00A5
	setflag FLAG_UNK_2F5
	goto _00A9

_00A5:
	clearflag FLAG_UNK_2F5
_00A9:
	end

_00AB:
	setflag FLAG_UNK_2F5
	end

scr_seq_D11R0106_008:
	call_if_set FLAG_UNK_13B, _00D4
	call_if_set FLAG_UNK_13D, _00E2
	call_if_set FLAG_UNK_13E, _00F0
	end

_00D4:
	move_person_facing obj_D11R0106_gsassistantm, 21, 0, 14, DIR_WEST
	return

_00E2:
	move_person_facing obj_D11R0106_gsassistantm_3, 9, 0, 13, DIR_NORTH
	return

_00F0:
	move_person_facing obj_D11R0106_assistantm, 15, 0, 16, DIR_SOUTH
	return

scr_seq_D11R0106_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge BADGE_VOLCANO, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _01B6
	npc_msg msg_0053_D11R0106_00000
	closemsg
	trainer_battle TRAINER_LEADER_BLAINE_BLAINE, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _01CC
	give_badge BADGE_VOLCANO
	addvar VAR_UNK_4135, 1
	setflag FLAG_UNK_265
	setflag FLAG_HIDE_ROUTE_19_WORKMEN_CLOSED
	clearflag FLAG_HIDE_ROUTE_19_WORKMEN_OPEN
	add_special_game_stat 22
	setflag FLAG_UNK_13F
	setflag FLAG_UNK_140
	setflag FLAG_UNK_13C
	npc_msg msg_0053_D11R0106_00001
	buffer_players_name 0
	npc_msg msg_0053_D11R0106_00002
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	npc_msg msg_0053_D11R0106_00003
	goto _0175

_0175:
	goto_if_no_item_space ITEM_TM50, 1, _01AC
	callstd std_give_item_verbose
	setflag FLAG_UNK_17D
	buffer_players_name 0
	npc_msg msg_0053_D11R0106_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_01AC:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

_01B6:
	goto_if_unset FLAG_UNK_17D, _0175
	npc_msg msg_0053_D11R0106_00005
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_01CC:
	white_out
	releaseall
	end

scr_seq_D11R0106_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_13B, _021A
	npc_msg msg_0053_D11R0106_00006
	closemsg
	trainer_battle TRAINER_SUPER_NERD_CARY, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _01CC
	npc_msg msg_0053_D11R0106_00008
	closemsg
	apply_movement obj_D11R0106_gsassistantm, _0424
	wait_movement
	setflag FLAG_UNK_13B
	releaseall
	end

_021A:
	npc_msg msg_0053_D11R0106_00007
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D11R0106_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_13C, _028C
	npc_msg msg_0053_D11R0106_00009
	closemsg
	trainer_battle TRAINER_SUPER_NERD_WALDO, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _01CC
	npc_msg msg_0053_D11R0106_00011
	closemsg
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _027A
	apply_movement obj_D11R0106_gsassistantm_2, _043C
	goto _0282

_027A:
	apply_movement obj_D11R0106_gsassistantm_2, _0430
_0282:
	wait_movement
	setflag FLAG_UNK_13C
	releaseall
	end

_028C:
	npc_msg msg_0053_D11R0106_00010
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D11R0106_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_13D, _02DF
	npc_msg msg_0053_D11R0106_00012
	closemsg
	trainer_battle TRAINER_SUPER_NERD_MERLE, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _01CC
	npc_msg msg_0053_D11R0106_00014
	closemsg
	apply_movement obj_D11R0106_gsassistantm_3, _0448
	wait_movement
	setflag FLAG_UNK_13D
	releaseall
	end

_02DF:
	npc_msg msg_0053_D11R0106_00013
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D11R0106_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_13E, _0332
	npc_msg msg_0053_D11R0106_00015
	closemsg
	trainer_battle TRAINER_SCIENTIST_GS_LOWELL, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _01CC
	npc_msg msg_0053_D11R0106_00017
	closemsg
	apply_movement obj_D11R0106_assistantm, _0454
	wait_movement
	setflag FLAG_UNK_13E
	releaseall
	end

_0332:
	npc_msg msg_0053_D11R0106_00016
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D11R0106_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_13F, _03A4
	npc_msg msg_0053_D11R0106_00018
	closemsg
	trainer_battle TRAINER_SCIENTIST_GS_LINDEN, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _01CC
	npc_msg msg_0053_D11R0106_00020
	closemsg
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _0392
	apply_movement obj_D11R0106_assistantm_2, _046C
	goto _039A

_0392:
	apply_movement obj_D11R0106_assistantm_2, _0460
_039A:
	wait_movement
	setflag FLAG_UNK_13F
	releaseall
	end

_03A4:
	npc_msg msg_0053_D11R0106_00019
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D11R0106_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_140, _0416
	npc_msg msg_0053_D11R0106_00021
	closemsg
	trainer_battle TRAINER_SCIENTIST_GS_DANIEL, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _01CC
	npc_msg msg_0053_D11R0106_00023
	closemsg
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _0404
	apply_movement obj_D11R0106_assistantm_3, _0478
	goto _040C

_0404:
	apply_movement obj_D11R0106_assistantm_3, _0484
_040C:
	wait_movement
	setflag FLAG_UNK_140
	releaseall
	end

_0416:
	npc_msg msg_0053_D11R0106_00022
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_0424:
	step 15, 1
	step 2, 1
	step_end

_0430:
	step 13, 1
	step 0, 1
	step_end

_043C:
	step 12, 1
	step 1, 1
	step_end

_0448:
	step 13, 1
	step 0, 1
	step_end

_0454:
	step 12, 1
	step 1, 1
	step_end

_0460:
	step 14, 1
	step 3, 1
	step_end

_046C:
	step 15, 1
	step 2, 1
	step_end

_0478:
	step 14, 1
	step 3, 1
	step_end

_0484:
	step 15, 1
	step 2, 1
	step_end
scr_seq_D11R0106_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge BADGE_VOLCANO, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _04B6
	npc_msg msg_0053_D11R0106_00024
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_04B6:
	npc_msg msg_0053_D11R0106_00025
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
