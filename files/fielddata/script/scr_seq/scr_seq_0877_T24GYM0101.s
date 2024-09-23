#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T24GYM0101.h"
#include "msgdata/msg/msg_0574_T24GYM0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T24GYM0101_000
	scrdef scr_seq_T24GYM0101_001
	scrdef scr_seq_T24GYM0101_002
	scrdef scr_seq_T24GYM0101_003
	scrdef_end

scr_seq_T24GYM0101_001:
	cianwood_gym_init
	clearflag FLAG_SYS_CIANWOOD_WATERFALL_DISABLE
	end

scr_seq_T24GYM0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_TEMP_x4000, 0
	goto_if_eq _010A
	check_badge BADGE_STORM, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _00EE
	npc_msg msg_0574_T24GYM0101_00000
	closemsg
	trainer_battle TRAINER_LEADER_CHUCK_CHUCK, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0104
	npc_msg msg_0574_T24GYM0101_00003
	settrainerflag TRAINER_BLACK_BELT_YOSHI
	settrainerflag TRAINER_BLACK_BELT_LAO
	settrainerflag TRAINER_BLACK_BELT_NOB
	settrainerflag TRAINER_BLACK_BELT_LUNG
	buffer_players_name 0
	npc_msg msg_0574_T24GYM0101_00004
	give_badge BADGE_STORM
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	addvar VAR_MIDGAME_BADGES, 1
	add_special_game_stat SCORE_EVENT_BADGE_GET
	setvar VAR_UNK_4116, 1
	compare VAR_MIDGAME_BADGES, 3
	goto_if_ne _00A6
	setvar VAR_SCENE_ROCKET_TAKEOVER, 1
_00A6:
	npc_msg msg_0574_T24GYM0101_00005
	goto _00AF

_00AF:
	goto_if_no_item_space ITEM_TM01, 1, _00E3
	callstd std_give_item_verbose
	setflag FLAG_GOT_TM01_FROM_CHUCK
	npc_msg msg_0574_T24GYM0101_00006
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_00E3:
	npc_msg msg_0574_T24GYM0101_00007
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_00EE:
	goto_if_unset FLAG_GOT_TM01_FROM_CHUCK, _00AF
	npc_msg msg_0574_T24GYM0101_00008
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0104:
	white_out
	releaseall
	end

_010A:
	npc_msg msg_0574_T24GYM0101_00009
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T24GYM0101_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_TEMP_x4000, 0
	goto_if_eq _0135
	npc_msg msg_0574_T24GYM0101_00012
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0135:
	npc_msg msg_0574_T24GYM0101_00010
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0153
	closemsg
	releaseall
	end

_0153:
	buffer_players_name 0
	npc_msg msg_0574_T24GYM0101_00011
	closemsg
	setflag FLAG_SYS_CIANWOOD_WATERFALL_DISABLE
	stop_se SEQ_SE_GS_N_TAKI
	play_se SEQ_SE_DP_SHIP03
	play_se SEQ_SE_GS_TAKI2
	cianwood_gym_turn_winch VAR_TEMP_x4000
	releaseall
	end

scr_seq_T24GYM0101_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge BADGE_STORM, VAR_SPECIAL_RESULT
	buffer_players_name 0
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _019A
	npc_msg msg_0574_T24GYM0101_00013
	goto _019D

_019A:
	npc_msg msg_0574_T24GYM0101_00014
_019D:
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
