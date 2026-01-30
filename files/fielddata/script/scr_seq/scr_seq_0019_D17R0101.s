#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D17R0101.h"
#include "msgdata/msg/msg_0057_D17R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D17R0101_000
	scrdef scr_seq_D17R0101_001
	scrdef scr_seq_D17R0101_002
	scrdef_end

scr_seq_D17R0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_CAUGHT_HO_OH, _0053
	get_game_version VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 8
	goto_if_eq _0048
	goto_if_set FLAG_UNK_108, _005E
	goto_if_set FLAG_UNK_105, _0069
_0048:
	npc_msg msg_0057_D17R0101_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0053:
	npc_msg msg_0057_D17R0101_00006
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_005E:
	npc_msg msg_0057_D17R0101_00005
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0069:
	npc_msg msg_0057_D17R0101_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D17R0101_001:
	scrcmd_609
	lockall
	get_player_facing VAR_TEMP_x400A
	compare VAR_TEMP_x400A, 0
	goto_if_ne _0097
	apply_movement obj_D17R0101_bozu, _02D8
	goto _009F

_0097:
	apply_movement obj_D17R0101_bozu, _02E0
_009F:
	wait_movement
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	compare VAR_TEMP_x400A, 0
	call_if_eq _0150
	compare VAR_TEMP_x400A, 2
	call_if_eq _0192
	goto_if_set FLAG_UNK_093, _028E
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 56
	compare VAR_TEMP_x400A, 0
	goto_if_ne _00F1
	apply_movement obj_player, _0344
	goto _0101

_00F1:
	apply_movement obj_D17R0101_bozu, _0354
	apply_movement obj_player, _0354
_0101:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	get_game_version VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 7
	goto_if_ne _0127
	npc_msg msg_0057_D17R0101_00000
	goto _012A

_0127:
	npc_msg msg_0057_D17R0101_00001
_012A:
	closemsg
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	compare VAR_TEMP_x400A, 0
	call_if_eq _01EF
	compare VAR_TEMP_x400A, 2
	call_if_eq _0231
	releaseall
	end

_0150:
	compare VAR_SPECIAL_x8004, 7
	goto_if_ne _016B
	apply_movement obj_D17R0101_bozu, _02EC
	goto _018E

_016B:
	compare VAR_SPECIAL_x8004, 8
	goto_if_ne _0186
	apply_movement obj_D17R0101_bozu, _02FC
	goto _018E

_0186:
	apply_movement obj_D17R0101_bozu, _0304
_018E:
	wait_movement
	return

_0192:
	compare VAR_SPECIAL_x8005, 7
	goto_if_ne _01AD
	apply_movement obj_D17R0101_bozu, _0314
	goto _01EB

_01AD:
	compare VAR_SPECIAL_x8005, 8
	goto_if_ne _01C8
	apply_movement obj_D17R0101_bozu, _0324
	goto _01EB

_01C8:
	compare VAR_SPECIAL_x8005, 9
	goto_if_ne _01E3
	apply_movement obj_D17R0101_bozu, _032C
	goto _01EB

_01E3:
	apply_movement obj_D17R0101_bozu, _0338
_01EB:
	wait_movement
	return

_01EF:
	compare VAR_SPECIAL_x8004, 7
	goto_if_ne _020A
	apply_movement obj_D17R0101_bozu, _0364
	goto _022D

_020A:
	compare VAR_SPECIAL_x8004, 8
	goto_if_ne _0225
	apply_movement obj_D17R0101_bozu, _0378
	goto _022D

_0225:
	apply_movement obj_D17R0101_bozu, _0384
_022D:
	wait_movement
	return

_0231:
	compare VAR_SPECIAL_x8005, 7
	goto_if_ne _024C
	apply_movement obj_D17R0101_bozu, _0398
	goto _028A

_024C:
	compare VAR_SPECIAL_x8005, 8
	goto_if_ne _0267
	apply_movement obj_D17R0101_bozu, _03A4
	goto _028A

_0267:
	compare VAR_SPECIAL_x8005, 9
	goto_if_ne _0282
	apply_movement obj_D17R0101_bozu, _03B0
	goto _028A

_0282:
	apply_movement obj_D17R0101_bozu, _03C0
_028A:
	wait_movement
	return

_028E:
	npc_msg msg_0057_D17R0101_00002
	closemsg
	show_legendary_wing 0
	releaseall
	setvar VAR_UNK_40F3, 1
	end

scr_seq_D17R0101_002:
	wait 30, VAR_SPECIAL_RESULT
	compare VAR_TEMP_x400A, 0
	goto_if_ne _02C2
	apply_movement obj_D17R0101_bozu, _03D0
	goto _02CA

_02C2:
	apply_movement obj_D17R0101_bozu, _03E0
_02CA:
	wait_movement
	npc_msg msg_0057_D17R0101_00003
	wait_button_or_walk_away
	closemsg
	end

	.balign 4, 0
_02D8:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_02E0:
	FaceEast
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_02EC:
	WalkNormalSouth 2
	WalkNormalWest
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_02FC:
	WalkNormalSouth 3
	EndMovement

	.balign 4, 0
_0304:
	WalkNormalSouth 2
	WalkNormalEast
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_0314:
	WalkNormalNorth
	WalkNormalEast 2
	WalkNormalEast
	EndMovement

	.balign 4, 0
_0324:
	WalkNormalEast 3
	EndMovement

	.balign 4, 0
_032C:
	WalkNormalSouth
	WalkNormalEast 3
	EndMovement

	.balign 4, 0
_0338:
	WalkNormalSouth 2
	WalkNormalEast 3
	EndMovement

	.balign 4, 0
_0344:
	LockDir
	WalkNormalSouth
	UnlockDir
	EndMovement

	.balign 4, 0
_0354:
	LockDir
	WalkNormalEast
	UnlockDir
	EndMovement

	.balign 4, 0
_0364:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 2
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0378:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0384:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 2
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0398:
	WalkNormalWest 4
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_03A4:
	WalkNormalWest 4
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_03B0:
	WalkNormalWest 4
	WalkNormalNorth
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_03C0:
	WalkNormalWest 4
	WalkNormalNorth 2
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_03D0:
	LockDir
	WalkSlowerNorth
	UnlockDir
	EndMovement

	.balign 4, 0
_03E0:
	LockDir
	WalkSlowerWest
	UnlockDir
	EndMovement
	.balign 4, 0
