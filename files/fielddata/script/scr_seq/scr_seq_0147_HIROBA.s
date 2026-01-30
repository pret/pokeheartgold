#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_HIROBA.h"
#include "msgdata/msg/msg_0212_HIROBA.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_HIROBA_000
	scrdef_end

scr_seq_HIROBA_000:
	scrcmd_609
	lockall
	random VAR_SPECIAL_x8000, 5
	switch VAR_SPECIAL_x8000
	case 0, _0059
	case 1, _0073
	case 2, _008D
	case 3, _00A7
	case 4, _00C1
	end

_0059:
	apply_movement obj_player, _014C
	apply_movement obj_HIROBA_wifisf, _01F4
	wait_movement
	goto _00DB
	end

_0073:
	apply_movement obj_player, _0158
	apply_movement obj_HIROBA_wifisf, _0204
	wait_movement
	goto _00DB
	end

_008D:
	apply_movement obj_player, _0164
	apply_movement obj_HIROBA_wifisf, _0214
	wait_movement
	goto _00DB
	end

_00A7:
	apply_movement obj_player, _0170
	apply_movement obj_HIROBA_wifisf, _0224
	wait_movement
	goto _00DB
	end

_00C1:
	apply_movement obj_player, _017C
	apply_movement obj_HIROBA_wifisf, _0234
	wait_movement
	goto _00DB
	end

_00DB:
	npc_msg msg_0212_HIROBA_00000
	wait_button
	closemsg
	apply_movement obj_player, _0188
	apply_movement obj_HIROBA_wifisf, _0244
	wait_movement
	play_se SEQ_SE_DP_TELE2
	apply_movement obj_player, _01EC
	wait_movement
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	setvar VAR_TEMP_x4003, 1
	warp VAR_UNK_4056, 0, 5, 2, DIR_SOUTH
	scrcmd_436
	scrcmd_166 VAR_SPECIAL_RESULT
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	scrcmd_663 VAR_SPECIAL_x8004
	restore_overworld
	setvar VAR_UNK_4137, 1
	make_object_visible obj_player
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

	.balign 4, 0
_014C:
	WalkNormalNorth 7
	WalkNormalWest 11
	EndMovement

	.balign 4, 0
_0158:
	WalkNormalNorth 7
	WalkNormalWest 9
	EndMovement

	.balign 4, 0
_0164:
	WalkNormalNorth 7
	WalkNormalWest 7
	EndMovement

	.balign 4, 0
_0170:
	WalkNormalNorth 7
	WalkNormalWest 5
	EndMovement

	.balign 4, 0
_017C:
	WalkNormalNorth 7
	WalkNormalWest 3
	EndMovement

	.balign 4, 0
_0188:
	WalkNormalNorth
	FaceWest
	Delay2
	FaceSouth
	Delay2
	FaceEast
	Delay2
	FaceNorth
	Delay2
	FaceWest
	Delay2
	FaceSouth
	Delay2
	FaceEast
	Delay2
	FaceNorth
	Delay2
	FaceWest
	Delay2
	FaceSouth
	Delay2
	FaceEast
	Delay2
	FaceNorth
	EndMovement

	.balign 4, 0
_01EC:
	WarpOut
	EndMovement

	.balign 4, 0
_01F4:
	WalkNormalNorth 6
	WalkNormalWest 12
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0204:
	WalkNormalNorth 6
	WalkNormalWest 10
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0214:
	WalkNormalNorth 6
	WalkNormalWest 8
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0224:
	WalkNormalNorth 6
	WalkNormalWest 6
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0234:
	WalkNormalNorth 6
	WalkNormalWest 4
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0244:
	WalkOnSpotNormalNorth
	EndMovement
	.balign 4, 0
