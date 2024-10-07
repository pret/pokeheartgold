#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T23GYM0102.h"
#include "msgdata/msg/msg_0567_T23GYM0102.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T23GYM0102_000
	scrdef scr_seq_T23GYM0102_001
	scrdef scr_seq_T23GYM0102_002
	scrdef scr_seq_T23GYM0102_003
	scrdef scr_seq_T23GYM0102_004
	scrdef scr_seq_T23GYM0102_005
	scrdef scr_seq_T23GYM0102_006
	scrdef scr_seq_T23GYM0102_007
	scrdef scr_seq_T23GYM0102_008
	scrdef scr_seq_T23GYM0102_009
	scrdef scr_seq_T23GYM0102_010
	scrdef scr_seq_T23GYM0102_011
	scrdef scr_seq_T23GYM0102_012
	scrdef scr_seq_T23GYM0102_013
	scrdef scr_seq_T23GYM0102_014
	scrdef scr_seq_T23GYM0102_015
	scrdef scr_seq_T23GYM0102_016
	scrdef_end

scr_seq_T23GYM0102_016:
	azalea_gym_init
	get_phone_book_rematch PHONE_CONTACT_BUGSY, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 0
	goto_if_ne _00CD
	goto_if_set FLAG_GAME_CLEAR, _006C
	clearflag FLAG_UNK_2EA
	end

_006C:
	check_registered_phone_number PHONE_CONTACT_BUGSY, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 1
	goto_if_eq _0096
	get_weekday VAR_TEMP_x4002
	compare VAR_TEMP_x4002, 4
	goto_if_ne _0096
	setflag FLAG_UNK_2EA
	end

_0096:
	get_weekday VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 1
	goto_if_eq _00C7
	compare VAR_TEMP_x4001, 3
	goto_if_eq _00C7
	compare VAR_TEMP_x4001, 5
	goto_if_eq _00C7
	clearflag FLAG_UNK_2EA
	end

_00C7:
	setflag FLAG_UNK_2EA
	end

_00CD:
	setflag FLAG_UNK_2EA
	end

scr_seq_T23GYM0102_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge BADGE_HIVE, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _017A
	npc_msg msg_0567_T23GYM0102_00000
	closemsg
	trainer_battle TRAINER_LEADER_BUGSY_BUGSY, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0174
	npc_msg msg_0567_T23GYM0102_00001
	buffer_players_name 0
	npc_msg msg_0567_T23GYM0102_00002
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	give_badge BADGE_HIVE
	settrainerflag TRAINER_BUG_CATCHER_AL
	settrainerflag TRAINER_BUG_CATCHER_BENNY
	settrainerflag TRAINER_BUG_CATCHER_JOSH
	settrainerflag TRAINER_TWINS_AMY_AND_MIMI
	add_special_game_stat SCORE_EVENT_BADGE_GET
	npc_msg msg_0567_T23GYM0102_00003
_0136:
	goto_if_no_item_space ITEM_TM89, 1, _016A
	callstd std_give_item_verbose
	setflag FLAG_GOT_TM89_FROM_BUGSY
	npc_msg msg_0567_T23GYM0102_00005
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_016A:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

_0174:
	white_out
	releaseall
	end

_017A:
	goto_if_unset FLAG_GOT_TM89_FROM_BUGSY, _0136
	npc_msg msg_0567_T23GYM0102_00006
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T23GYM0102_000:
	end

scr_seq_T23GYM0102_002:
	azalea_gym_spinarak 0
	end

scr_seq_T23GYM0102_003:
	azalea_gym_spinarak 1
	end

scr_seq_T23GYM0102_004:
	azalea_gym_spinarak 2
	end

scr_seq_T23GYM0102_005:
	azalea_gym_spinarak 3
	end

scr_seq_T23GYM0102_006:
	azalea_gym_spinarak 4
	end

scr_seq_T23GYM0102_007:
	azalea_gym_spinarak 5
	end

scr_seq_T23GYM0102_008:
	azalea_gym_spinarak 6
	end

scr_seq_T23GYM0102_009:
	azalea_gym_spinarak 7
	end

scr_seq_T23GYM0102_010:
	azalea_gym_spinarak 8
	end

scr_seq_T23GYM0102_011:
	azalea_gym_spinarak 9
	end

scr_seq_T23GYM0102_012:
	azalea_gym_spinarak 10
	end

scr_seq_T23GYM0102_013:
	azalea_gym_spinarak 11
	end

scr_seq_T23GYM0102_014:
	azalea_gym_switch 0
	end

scr_seq_T23GYM0102_015:
	azalea_gym_switch 1
	end
	.balign 4, 0
