#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T26PC0101.h"
#include "msgdata/msg/msg_0607_T26PC0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T26PC0101_000
	scrdef scr_seq_T26PC0101_001
	scrdef scr_seq_T26PC0101_002
	scrdef scr_seq_T26PC0101_003
	scrdef scr_seq_T26PC0101_004
	scrdef_end

scr_seq_T26PC0101_000:
	setvar VAR_SPECIAL_x8007, 0
	callstd std_nurse_joy
	end

scr_seq_T26PC0101_004:
	goto_if_defeated TRAINER_BEAUTY_CHARLOTTE, _00E6
	compare VAR_TEMP_x4007, 77
	goto_if_eq _00C4
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0607_T26PC0101_00003
	setvar VAR_TEMP_x4007, 77
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _0068
	apply_movement obj_T26PC0101_gswoman2, _00FC
	goto _007D

_0068:
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _007D
	apply_movement obj_T26PC0101_gswoman2, _0104
_007D:
	wait_movement
	npc_msg msg_0607_T26PC0101_00004
_0082:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _00D5
	npc_msg msg_0607_T26PC0101_00005
	closemsg
	trainer_battle TRAINER_BEAUTY_CHARLOTTE, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _00E0
	settrainerflag TRAINER_BEAUTY_CHARLOTTE
	npc_msg msg_0607_T26PC0101_00006
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_00C4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0607_T26PC0101_00008
	goto _0082

_00D5:
	npc_msg msg_0607_T26PC0101_00007
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_00E0:
	white_out
	releaseall
	end

_00E6:
	simple_npc_msg msg_0607_T26PC0101_00006
	end

	.balign 4, 0
_00FC:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0104:
	WalkOnSpotNormalSouth
	EndMovement

scr_seq_T26PC0101_001:
	simple_npc_msg msg_0607_T26PC0101_00000
	end

scr_seq_T26PC0101_002:
	simple_npc_msg msg_0607_T26PC0101_00001
	end

scr_seq_T26PC0101_003:
	simple_npc_msg msg_0607_T26PC0101_00002
	end
	.balign 4, 0
