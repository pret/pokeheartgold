#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0163.h"
#include "msgdata/msg/msg_0266.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0163_000
	scrdef_end

scr_seq_0163_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	follow_mon_face_player
	follow_mon_interact
	goto _00F0

_0016:
	get_party_lead_alive VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	random VAR_SPECIAL_RESULT, 3
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_RESULT
	compare_var_to_value VAR_SPECIAL_x8008, 0
	goto_if_eq _0060
	compare_var_to_value VAR_SPECIAL_x8008, 1
	goto_if_eq _0060
	goto _0060

_004C:
	play_cry VAR_TEMP_x4001, 0
	goto _00F0

_0058:
	scrcmd_597
	goto _00F0

_0060:
	play_cry VAR_TEMP_x4001, 0
	scrcmd_622 obj_partner_poke, VAR_SPECIAL_RESULT
	compare_var_to_value VAR_SPECIAL_RESULT, DIR_NORTH
	call_if_eq _00F4
	compare_var_to_value VAR_SPECIAL_RESULT, DIR_SOUTH
	call_if_eq _00FE
	compare_var_to_value VAR_SPECIAL_RESULT, DIR_WEST
	call_if_eq _0108
	compare_var_to_value VAR_SPECIAL_RESULT, DIR_EAST
	call_if_eq _0112
	wait_movement
	scrcmd_597
	goto _00F0

_00AA:
	play_cry VAR_TEMP_x4001, 0
	get_player_facing VAR_SPECIAL_RESULT
	compare_var_to_value VAR_SPECIAL_RESULT, DIR_NORTH
	call_if_eq _011C
	compare_var_to_value VAR_SPECIAL_RESULT, DIR_SOUTH
	call_if_eq _0126
	compare_var_to_value VAR_SPECIAL_RESULT, DIR_WEST
	call_if_eq _0130
	compare_var_to_value VAR_SPECIAL_RESULT, DIR_EAST
	call_if_eq _013A
	wait_movement
	goto _00F0

_00F0:
	releaseall
	end

_00F4:
	apply_movement obj_partner_poke, _016C
	return

_00FE:
	apply_movement obj_partner_poke, _0158
	return

_0108:
	apply_movement obj_partner_poke, _0194
	return

_0112:
	apply_movement obj_partner_poke, _0180
	return

_011C:
	apply_movement obj_partner_poke, _01A8
	return

_0126:
	apply_movement obj_partner_poke, _01C8
	return

_0130:
	apply_movement obj_partner_poke, _01E8
	return

_013A:
	apply_movement obj_partner_poke, _0208
	return

	.balign 4, 0
_0144:
	PauseAnimation
	EmoteExclamationMark
	Delay2
	ResumeAnimation
	EndMovement

	.balign 4, 0
_0158:
	PauseAnimation
	JumpOnSpotFastSouth
	Delay4
	ResumeAnimation
	EndMovement

	.balign 4, 0
_016C:
	PauseAnimation
	JumpOnSpotFastNorth
	Delay4
	ResumeAnimation
	EndMovement

	.balign 4, 0
_0180:
	PauseAnimation
	JumpOnSpotFastEast
	Delay4
	ResumeAnimation
	EndMovement

	.balign 4, 0
_0194:
	PauseAnimation
	JumpOnSpotFastWest
	Delay4
	ResumeAnimation
	EndMovement

	.balign 4, 0
_01A8:
	PauseAnimation
	WalkOnSpotFasterSouth
	WalkOnSpotFasterWest
	WalkOnSpotFasterNorth
	WalkOnSpotFasterEast
	WalkOnSpotFasterSouth
	ResumeAnimation
	EndMovement

	.balign 4, 0
_01C8:
	PauseAnimation
	WalkOnSpotFasterNorth
	WalkOnSpotFasterEast
	WalkOnSpotFasterSouth
	WalkOnSpotFasterWest
	WalkOnSpotFasterNorth
	ResumeAnimation
	EndMovement

	.balign 4, 0
_01E8:
	PauseAnimation
	WalkOnSpotFasterEast
	WalkOnSpotFasterSouth
	WalkOnSpotFasterWest
	WalkOnSpotFasterNorth
	WalkOnSpotFasterEast
	ResumeAnimation
	EndMovement

	.balign 4, 0
_0208:
	PauseAnimation
	WalkOnSpotFasterWest
	WalkOnSpotFasterNorth
	WalkOnSpotFasterEast
	WalkOnSpotFasterSouth
	WalkOnSpotFasterWest
	ResumeAnimation
	EndMovement
	.balign 4, 0
