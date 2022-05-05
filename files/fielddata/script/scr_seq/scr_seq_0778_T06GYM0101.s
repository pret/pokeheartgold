#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T06GYM0101.h"
#include "msgdata/msg/msg_0485_T06GYM0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T06GYM0101_000
	scrdef scr_seq_T06GYM0101_001
	scrdef scr_seq_T06GYM0101_002
	scrdef scr_seq_T06GYM0101_003
	scrdef scr_seq_T06GYM0101_004
	scrdef scr_seq_T06GYM0101_005
	scrdef scr_seq_T06GYM0101_006
	scrdef scr_seq_T06GYM0101_007
	scrdef scr_seq_T06GYM0101_008
	scrdef scr_seq_T06GYM0101_009
	scrdef scr_seq_T06GYM0101_010
	scrdef scr_seq_T06GYM0101_011
	scrdef scr_seq_T06GYM0101_012
	scrdef scr_seq_T06GYM0101_013
	scrdef scr_seq_T06GYM0101_014
	scrdef scr_seq_T06GYM0101_015
	scrdef scr_seq_T06GYM0101_016
	scrdef scr_seq_T06GYM0101_017
	scrdef scr_seq_T06GYM0101_018
	scrdef scr_seq_T06GYM0101_019
	scrdef scr_seq_T06GYM0101_020
	scrdef scr_seq_T06GYM0101_021
	scrdef scr_seq_T06GYM0101_022
	scrdef scr_seq_T06GYM0101_023
	scrdef scr_seq_T06GYM0101_024
	scrdef scr_seq_T06GYM0101_025
	scrdef_end

scr_seq_T06GYM0101_021:
	goto_if_set FLAG_UNK_31A, _0079
	clearflag FLAG_SYS_SOLVED_LT_SURGE_GYM
_0079:
	vermilion_gym_init
	get_phone_book_rematch PHONE_CONTACT_LT__SURGE, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 0
	goto_if_ne _014A
	goto_if_unset FLAG_CAUGHT_ZAPDOS, _0144
	check_registered_phone_number PHONE_CONTACT_LT__SURGE, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 1
	goto_if_eq _00FB
	scrcmd_522 VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 9
	goto_if_ne _00C7
	setflag FLAG_UNK_2F0
	goto _00F9

_00C7:
	compare VAR_TEMP_x4000, 10
	goto_if_ne _00DE
	setflag FLAG_UNK_2F0
	goto _00F9

_00DE:
	compare VAR_TEMP_x4000, 11
	goto_if_ne _00F5
	setflag FLAG_UNK_2F0
	goto _00F9

_00F5:
	clearflag FLAG_UNK_2F0
_00F9:
	end

_00FB:
	goto_if_set FLAG_TRADE_LT_SURGE_PIKACHU, _010C
	setflag FLAG_UNK_2F0
	end

_010C:
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 5
	goto_if_ne _0127
	setflag FLAG_UNK_2F0
	goto _0142

_0127:
	compare VAR_TEMP_x4000, 6
	goto_if_ne _013E
	setflag FLAG_UNK_2F0
	goto _0142

_013E:
	clearflag FLAG_UNK_2F0
_0142:
	end

_0144:
	clearflag FLAG_UNK_2F0
	end

_014A:
	setflag FLAG_UNK_2F0
	end

scr_seq_T06GYM0101_022:
	goto_if_set FLAG_UNK_31A, _0175
	scrcmd_375 obj_T06GYM0101_stop
	scrcmd_375 obj_T06GYM0101_stop_2
	scrcmd_375 obj_T06GYM0101_stop_3
	scrcmd_375 obj_T06GYM0101_stop_4
	scrcmd_375 obj_T06GYM0101_stop_5
	scrcmd_375 obj_T06GYM0101_stop_6
	end

_0175:
	end

scr_seq_T06GYM0101_000:
	vermilion_gym_can_check 0, VAR_SPECIAL_RESULT
	goto _023A
	.byte 0x02, 0x00
scr_seq_T06GYM0101_001:
	vermilion_gym_can_check 1, VAR_SPECIAL_RESULT
	goto _023A
	.byte 0x02
	.byte 0x00
scr_seq_T06GYM0101_002:
	vermilion_gym_can_check 2, VAR_SPECIAL_RESULT
	goto _023A
	.byte 0x02, 0x00
scr_seq_T06GYM0101_003:
	vermilion_gym_can_check 3, VAR_SPECIAL_RESULT
	goto _023A
	.byte 0x02, 0x00
scr_seq_T06GYM0101_004:
	vermilion_gym_can_check 4, VAR_SPECIAL_RESULT
	goto _023A
	.byte 0x02, 0x00
scr_seq_T06GYM0101_005:
	vermilion_gym_can_check 5, VAR_SPECIAL_RESULT
	goto _023A
	.byte 0x02, 0x00
scr_seq_T06GYM0101_006:
	vermilion_gym_can_check 6, VAR_SPECIAL_RESULT
	goto _023A
	.byte 0x02, 0x00
scr_seq_T06GYM0101_007:
	vermilion_gym_can_check 7, VAR_SPECIAL_RESULT
	goto _023A
	.byte 0x02, 0x00
scr_seq_T06GYM0101_008:
	vermilion_gym_can_check 8, VAR_SPECIAL_RESULT
	goto _023A
	.byte 0x02, 0x00
scr_seq_T06GYM0101_009:
	vermilion_gym_can_check 9, VAR_SPECIAL_RESULT
	goto _023A
	.byte 0x02, 0x00
scr_seq_T06GYM0101_010:
	vermilion_gym_can_check 10, VAR_SPECIAL_RESULT
	goto _023A
	.byte 0x02, 0x00
scr_seq_T06GYM0101_011:
	vermilion_gym_can_check 11, VAR_SPECIAL_RESULT
	goto _023A
	.byte 0x02, 0x00
scr_seq_T06GYM0101_012:
	vermilion_gym_can_check 12, VAR_SPECIAL_RESULT
	goto _023A
	.byte 0x02, 0x00
scr_seq_T06GYM0101_013:
	vermilion_gym_can_check 13, VAR_SPECIAL_RESULT
	goto _023A
	.byte 0x02, 0x00
scr_seq_T06GYM0101_014:
	vermilion_gym_can_check 14, VAR_SPECIAL_RESULT
	goto _023A
	.byte 0x02, 0x00
_023A:
	compare VAR_SPECIAL_RESULT, 4
	goto_if_eq _027D
	compare VAR_SPECIAL_RESULT, 2
	goto_if_eq _02AA
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _028E
	compare VAR_SPECIAL_RESULT, 3
	goto_if_eq _02CE
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _02E5
	end

_027D:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0485_T06GYM0101_00008
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_028E:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0485_T06GYM0101_00009
	wait_button_or_walk_away
	closemsg
	vermilion_gym_lock_action 0, 0
	npc_msg msg_0485_T06GYM0101_00011
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_02AA:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0485_T06GYM0101_00009
	wait_button_or_walk_away
	closemsg
	vermilion_gym_lock_action 1, 0
	setflag FLAG_SYS_SOLVED_LT_SURGE_GYM
	stop_se SEQ_SE_GS_DENGEKIBARIA
	npc_msg msg_0485_T06GYM0101_00012
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_02CE:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0485_T06GYM0101_00010
	wait_button_or_walk_away
	closemsg
	vermilion_gym_lock_action 0, 1
	resample_vermilion_gym_cans
	releaseall
	end

_02E5:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0485_T06GYM0101_00008
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T06GYM0101_015:
	end

scr_seq_T06GYM0101_016:
	end

scr_seq_T06GYM0101_017:
	end

scr_seq_T06GYM0101_018:
	end

scr_seq_T06GYM0101_019:
	end

scr_seq_T06GYM0101_020:
	end

scr_seq_T06GYM0101_023:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge BADGE_THUNDER, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _03C7
	npc_msg msg_0485_T06GYM0101_00000
	closemsg
	trainer_battle TRAINER_LEADER_LT_SURGE_LT__SURGE, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _03DD
	give_badge BADGE_THUNDER
	addvar VAR_UNK_4135, 1
	add_special_game_stat 22
	setflag FLAG_UNK_31A
	hide_person obj_T06GYM0101_stop
	hide_person obj_T06GYM0101_stop_2
	hide_person obj_T06GYM0101_stop_3
	hide_person obj_T06GYM0101_stop_4
	hide_person obj_T06GYM0101_stop_5
	hide_person obj_T06GYM0101_stop_6
	settrainerflag TRAINER_GUITARIST_VINCENT
	settrainerflag TRAINER_GENTLEMAN_GREGORY
	settrainerflag TRAINER_JUGGLER_HORTON
	npc_msg msg_0485_T06GYM0101_00001
	buffer_players_name 0
	npc_msg msg_0485_T06GYM0101_00002
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	npc_msg msg_0485_T06GYM0101_00003
	goto _0389

_0389:
	goto_if_no_item_space ITEM_TM34, 1, _03BD
	callstd std_give_item_verbose
	setflag FLAG_UNK_181
	npc_msg msg_0485_T06GYM0101_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_03BD:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

_03C7:
	goto_if_unset FLAG_UNK_181, _0389
	npc_msg msg_0485_T06GYM0101_00005
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_03DD:
	white_out
	releaseall
	end

scr_seq_T06GYM0101_024:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge BADGE_THUNDER, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0409
	npc_msg msg_0485_T06GYM0101_00006
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0409:
	npc_msg msg_0485_T06GYM0101_00007
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T06GYM0101_025:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge BADGE_THUNDER, VAR_SPECIAL_RESULT
	buffer_players_name 0
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _043B
	npc_msg msg_0485_T06GYM0101_00013
	goto _043E

_043B:
	npc_msg msg_0485_T06GYM0101_00014
_043E:
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
