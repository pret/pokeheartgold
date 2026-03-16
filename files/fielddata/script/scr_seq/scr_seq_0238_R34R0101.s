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

	.balign 4, 0
_0138:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0140:
	Delay8
	WalkNormalNorth 3
	EndMovement

	.balign 4, 0
_014C:
	WalkFastNorth 3
	JumpOnSpotFastNorth 2
	EndMovement

	.balign 4, 0
_0158:
	Delay8
	WalkNormalNorth 3
	EndMovement

	.balign 4, 0
_0164:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_016C:
	WalkNormalWest
	WalkNormalSouth 3
	Delay8
	EmoteExclamationMark
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0184:
	WalkNormalWest 2
	WalkNormalSouth 2
	EndMovement

	.balign 4, 0
_0190:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0198:
	Delay8
	WalkNormalNorth
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_01A8:
	WalkOnSpotNormalEast
	LockDir
	JumpNearFastWest
	UnlockDir
	EndMovement

	.balign 4, 0
_01BC:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_01C4:
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_01CC:
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_01D4:
	WalkNormalSouth 2
	WalkNormalEast
	WalkNormalSouth
	SetInvisible
	EndMovement

	.balign 4, 0
_01E8:
	Delay8
	JumpOnSpotFastNorth 2
	Delay8
	WalkFastSouth 3
	WalkFastEast 2
	WalkOnSpotFastSouth
	EndMovement

	.balign 4, 0
_0204:
	Delay8 2
	WalkOnSpotNormalSouth
	EndMovement

scr_seq_R34R0101_000:
	update_day_care_mon_objects
	end
	.balign 4, 0
