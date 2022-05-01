#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07R0203.h"
#include "msgdata/msg/msg_0503_T07R0203.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T07R0203_000
	scrdef scr_seq_T07R0203_001
	scrdef scr_seq_T07R0203_002
	scrdef scr_seq_T07R0203_003
	scrdef scr_seq_T07R0203_004
	scrdef scr_seq_T07R0203_005
	scrdef scr_seq_T07R0203_006
	scrdef scr_seq_T07R0203_007
	scrdef scr_seq_T07R0203_008
	scrdef scr_seq_T07R0203_009
	scrdef scr_seq_T07R0203_010
	scrdef scr_seq_T07R0203_011
	scrdef scr_seq_T07R0203_012
	scrdef scr_seq_T07R0203_013
	scrdef_end

scr_seq_T07R0203_008:
	get_friend_sprite VAR_OBJ_0
	setvar VAR_UNK_4125, 0
	end

scr_seq_T07R0203_011:
	compare VAR_UNK_412C, 0
	goto_if_ne _006B
	move_person_facing obj_T07R0203_var_1, 12, 0, 6, DIR_WEST
	move_person_facing obj_T07R0203_tsure_poke_static_marill, 13, 0, 6, DIR_WEST
_006B:
	end

scr_seq_T07R0203_010:
	scrcmd_609
	lockall
	callstd std_play_friend_music
	apply_movement obj_T07R0203_var_1, _012C
	apply_movement obj_T07R0203_tsure_poke_static_marill, _0138
	wait_movement
	buffer_players_name 0
	gender_msgbox msg_0503_T07R0203_00012, msg_0503_T07R0203_00013
	closemsg
	apply_movement obj_T07R0203_var_1, _0140
	apply_movement obj_T07R0203_tsure_poke_static_marill, _0148
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _0150
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	buffer_players_name 0
	gender_msgbox msg_0503_T07R0203_00014, msg_0503_T07R0203_00015
	closemsg
	apply_movement obj_T07R0203_var_1, _015C
	apply_movement obj_T07R0203_tsure_poke_static_marill, _016C
	wait_movement
	scrcmd_307 0, 0, 3, 2, 77
	scrcmd_310 77
	scrcmd_308 77
	apply_movement obj_T07R0203_var_1, _0180
	apply_movement obj_T07R0203_tsure_poke_static_marill, _018C
	wait_movement
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	callstd std_fade_end_friend_music
	setvar VAR_UNK_412C, 1
	move_person_facing obj_T07R0203_var_1, 29, 0, 29, DIR_WEST
	move_person_facing obj_T07R0203_tsure_poke_static_marill, 29, 0, 29, DIR_WEST
	releaseall
	end
	.byte 0x00

_012C:
	step 14, 4
	step 75, 1
	step_end

_0138:
	step 14, 4
	step_end

_0140:
	step 14, 4
	step_end

_0148:
	step 14, 4
	step_end

_0150:
	step 13, 3
	step 35, 1
	step_end

_015C:
	step 12, 2
	step 14, 1
	step 12, 1
	step_end

_016C:
	step 14, 1
	step 12, 2
	step 14, 1
	step 32, 1
	step_end

_0180:
	step 12, 1
	step 69, 1
	step_end

_018C:
	step 12, 2
	step 69, 1
	step_end
scr_seq_T07R0203_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_johto_dex_complete VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0245
	goto_if_set FLAG_UNK_143, _01ED
	npc_msg msg_0503_T07R0203_00001
	play_fanfare SEQ_ME_HYOUKA2
	wait_fanfare
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_425 0
	scrcmd_150
	setflag FLAG_UNK_143
	add_special_game_stat 25
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
_01ED:
	check_national_dex_complete VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0245
	goto_if_set FLAG_UNK_144, _023A
	npc_msg msg_0503_T07R0203_00002
	play_fanfare SEQ_ME_HYOUKA2
	wait_fanfare
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_425 1
	scrcmd_150
	setflag FLAG_UNK_144
	add_special_game_stat 26
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
_023A:
	npc_msg msg_0503_T07R0203_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0245:
	npc_msg msg_0503_T07R0203_00000
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T07R0203_009:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge BADGE_EARTH, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0276
	npc_msg msg_0503_T07R0203_00007
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0276:
	getitemquantity ITEM_GB_SOUNDS, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _02A7
	npc_msg msg_0503_T07R0203_00008
	giveitem_no_check ITEM_GB_SOUNDS, 1
	npc_msg msg_0503_T07R0203_00010
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_02A7:
	npc_msg msg_0503_T07R0203_00011
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T07R0203_001:
	simple_npc_msg msg_0503_T07R0203_00004
	end

scr_seq_T07R0203_002:
	simple_npc_msg msg_0503_T07R0203_00005
	end

scr_seq_T07R0203_003:
	simple_npc_msg msg_0503_T07R0203_00006
	end

scr_seq_T07R0203_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0503_T07R0203_00016
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T07R0203_013:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0503_T07R0203_00017
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T07R0203_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0503_T07R0203_00018
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T07R0203_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0503_T07R0203_00019
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T07R0203_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0503_T07R0203_00020
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T07R0203_012:
	simple_npc_msg msg_0503_T07R0203_00021
	end
	.balign 4, 0
