#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R34R0101.h"
#include "msgdata/msg/msg_0385_R34R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R34R0101_000
	scrdef scr_seq_R34R0101_001
	scrdef_end

scr_seq_R34R0101_001:
	scrcmd_609
	lockall
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_R34R0101_var_1, _0140
	apply_movement obj_R34R0101_tsure_poke_static_marill, _014C
	apply_movement obj_player, _0158
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	buffer_players_name 0
	gender_msgbox msg_0385_R34R0101_00000, msg_0385_R34R0101_00010
	closemsg
	gender_msgbox msg_0385_R34R0101_00001, msg_0385_R34R0101_00011
	closemsg
	apply_movement obj_R34R0101_var_1, _0138
	wait_movement
	gender_msgbox msg_0385_R34R0101_00002, msg_0385_R34R0101_00012
	closemsg
	gender_msgbox msg_0385_R34R0101_00003, msg_0385_R34R0101_00013
	closemsg
	apply_movement obj_R34R0101_var_1, _0164
	wait_movement
	gender_msgbox msg_0385_R34R0101_00004, msg_0385_R34R0101_00014
	closemsg
	apply_movement obj_R34R0101_var_1, _016C
	apply_movement obj_R34R0101_tsure_poke_static_marill, _0184
	wait_movement
	gender_msgbox msg_0385_R34R0101_00005, msg_0385_R34R0101_00015
	closemsg
	apply_movement obj_R34R0101_var_1, _0198
	apply_movement obj_R34R0101_tsure_poke_static_marill, _01A8
	wait_movement
	apply_movement obj_player, _0190
	wait_movement
	gender_msgbox msg_0385_R34R0101_00006, msg_0385_R34R0101_00016
	closemsg
	get_player_gender VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _00C6
	register_gear_number PHONE_CONTACT_LYRA
	goto _00CA

_00C6:
	register_gear_number PHONE_CONTACT_ETHAN
_00CA:
	buffer_players_name 0
	gender_msgbox msg_0385_R34R0101_00007, msg_0385_R34R0101_00017
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	apply_movement obj_R34R0101_var_1, _01BC
	wait_movement
	gender_msgbox msg_0385_R34R0101_00008, msg_0385_R34R0101_00018
	closemsg
	apply_movement obj_R34R0101_var_1, _01C4
	apply_movement obj_R34R0101_tsure_poke_static_marill, _01CC
	wait_movement
	gender_msgbox msg_0385_R34R0101_00009, msg_0385_R34R0101_00019
	closemsg
	apply_movement obj_R34R0101_var_1, _01D4
	apply_movement obj_R34R0101_tsure_poke_static_marill, _01E8
	apply_movement obj_player, _0204
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	hide_person obj_R34R0101_var_1
	hide_person obj_R34R0101_tsure_poke_static_marill
	wait_se SEQ_SE_DP_KAIDAN2
	setvar VAR_UNK_408E, 2
	setflag FLAG_UNK_22D
	releaseall
	end
	.byte 0x00

_0138:
	step 75, 1
	step_end

_0140:
	step 63, 1
	step 12, 3
	step_end

_014C:
	step 16, 3
	step 48, 2
	step_end

_0158:
	step 63, 1
	step 12, 3
	step_end

_0164:
	step 33, 1
	step_end

_016C:
	step 14, 1
	step 13, 3
	step 63, 1
	step 75, 1
	step 32, 1
	step_end

_0184:
	step 14, 2
	step 13, 2
	step_end

_0190:
	step 34, 1
	step_end

_0198:
	step 63, 1
	step 12, 1
	step 35, 1
	step_end

_01A8:
	step 35, 1
	step 71, 1
	step 54, 1
	step 72, 1
	step_end

_01BC:
	step 35, 1
	step_end

_01C4:
	step 32, 1
	step_end

_01CC:
	step 32, 1
	step_end

_01D4:
	step 13, 2
	step 15, 1
	step 13, 1
	step 69, 1
	step_end

_01E8:
	step 63, 1
	step 48, 2
	step 63, 1
	step 17, 3
	step 19, 2
	step 37, 1
	step_end

_0204:
	step 63, 2
	step 33, 1
	step_end
scr_seq_R34R0101_000:
	update_day_care_mon_objects
	end
	.balign 4, 0
