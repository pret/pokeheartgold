#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0071.h"
#include "msgdata/msg/msg_0003_EVERYWHERE.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0071_000
	scrdef scr_seq_0071_001
	scrdef scr_seq_0071_002
	scrdef_end

scr_seq_0071_000:
	end

scr_seq_0071_001:
	compare VAR_UNK_414E, 0
	call_if_ne _001F
	end

_001F:
	make_object_visible obj_player
	return

scr_seq_0071_002:
	scrcmd_609
	lockall
	call _0090
	random VAR_SPECIAL_RESULT, 4
	switch VAR_SPECIAL_RESULT
	case 1, _00F2
	case 2, _010C
	case 3, _0126
	goto _00D8

_0068:
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_BATTLE_TOWER_UNUSED_3, 0, 7, 6, DIR_NORTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

_0090:
	scrcmd_307 0, 0, 2, 2, 77
	scrcmd_310 77
	scrcmd_308 77
	apply_movement 0, _0140
	wait_movement
	scrcmd_374 obj_player
	apply_movement obj_player, _014C
	wait_movement
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	return

_00C4:
	apply_movement 0, _0154
	apply_movement obj_player, _0164
	wait_movement
	return

_00D8:
	apply_movement 0, _0178
	apply_movement obj_player, _0188
	wait_movement
	goto _0068
	end

_00F2:
	apply_movement 0, _019C
	apply_movement obj_player, _01AC
	wait_movement
	goto _0068
	end

_010C:
	apply_movement 0, _01C0
	apply_movement obj_player, _01D0
	wait_movement
	goto _0068
	end

_0126:
	apply_movement 0, _01E4
	apply_movement obj_player, _01F4
	wait_movement
	goto _0068
	end

	.balign 4, 0
_0140:
	WalkNormalSouth 3
	FaceNorth
	EndMovement

	.balign 4, 0
_014C:
	WalkNormalSouth 2
	EndMovement

	.balign 4, 0
_0154:
	FaceNorth
	WalkNormalNorth 2
	SetInvisible
	EndMovement

	.balign 4, 0
_0164:
	WalkNormalEast
	FaceNorth
	WalkFasterNorth
	SetInvisible
	EndMovement

	.balign 4, 0
_0178:
	WalkNormalEast 4
	WalkNormalNorth 2
	SetInvisible
	EndMovement

	.balign 4, 0
_0188:
	WalkNormalSouth
	WalkNormalEast 4
	WalkNormalNorth 2
	SetInvisible
	EndMovement

	.balign 4, 0
_019C:
	WalkNormalEast 8
	WalkNormalNorth 2
	SetInvisible
	EndMovement

	.balign 4, 0
_01AC:
	WalkNormalSouth
	WalkNormalEast 8
	WalkNormalNorth 2
	SetInvisible
	EndMovement

	.balign 4, 0
_01C0:
	WalkNormalEast 12
	WalkNormalNorth 2
	SetInvisible
	EndMovement

	.balign 4, 0
_01D0:
	WalkNormalSouth
	WalkNormalEast 12
	WalkNormalNorth 2
	SetInvisible
	EndMovement

	.balign 4, 0
_01E4:
	WalkNormalEast 16
	WalkNormalNorth 2
	SetInvisible
	EndMovement

	.balign 4, 0
_01F4:
	WalkNormalSouth
	WalkNormalEast 16
	WalkNormalNorth 2
	SetInvisible
	EndMovement
	.balign 4, 0
