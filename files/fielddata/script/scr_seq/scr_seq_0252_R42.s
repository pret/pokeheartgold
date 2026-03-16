#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R42.h"
#include "msgdata/msg/msg_0399_R42.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R42_000
	scrdef scr_seq_R42_001
	scrdef scr_seq_R42_002
	scrdef scr_seq_R42_003
	scrdef scr_seq_R42_004
	scrdef scr_seq_R42_005
	scrdef_end

scr_seq_R42_000:
	scrcmd_609
	lockall
	apply_movement obj_player, _017C
	wait_movement
	get_player_coords VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	clearflag FLAG_HIDE_ROUTE_42_HIKER
	show_person obj_R42_mount_2_2
	compare VAR_SPECIAL_x8001, 172
	goto_if_ne _0051
	apply_movement obj_R42_mount_2_2, _0198
	goto _00AA

_0051:
	compare VAR_SPECIAL_x8001, 173
	goto_if_ne _006C
	apply_movement obj_R42_mount_2_2, _01A4
	goto _00AA

_006C:
	compare VAR_SPECIAL_x8001, 174
	goto_if_ne _0087
	apply_movement obj_R42_mount_2_2, _01B0
	goto _00AA

_0087:
	compare VAR_SPECIAL_x8001, 175
	goto_if_ne _00A2
	apply_movement obj_R42_mount_2_2, _01BC
	goto _00AA

_00A2:
	apply_movement obj_R42_mount_2_2, _01C8
_00AA:
	wait_movement
	play_se SEQ_SE_DP_WALL_HIT2
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 56
	apply_movement obj_player, _0184
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	npc_msg msg_0399_R42_00005
	closemsg
	apply_movement obj_R42_mount_2_2, _01D4
	wait_movement
	giveitem_no_check ITEM_HM04, 1
	npc_msg msg_0399_R42_00006
	closemsg
	compare VAR_SPECIAL_x8001, 172
	goto_if_ne _010D
	apply_movement obj_R42_mount_2_2, _01DC
	goto _0166

_010D:
	compare VAR_SPECIAL_x8001, 173
	goto_if_ne _0128
	apply_movement obj_R42_mount_2_2, _01F0
	goto _0166

_0128:
	compare VAR_SPECIAL_x8001, 174
	goto_if_ne _0143
	apply_movement obj_R42_mount_2_2, _0204
	goto _0166

_0143:
	compare VAR_SPECIAL_x8001, 175
	goto_if_ne _015E
	apply_movement obj_R42_mount_2_2, _0210
	goto _0166

_015E:
	apply_movement obj_R42_mount_2_2, _0224
_0166:
	wait_movement
	setflag FLAG_HIDE_ROUTE_42_HIKER
	hide_person obj_R42_mount_2_2
	setvar VAR_UNK_4091, 1
	releaseall
	end

	.balign 4, 0
_017C:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0184:
	FaceEast
	LockDir
	JumpFarWest
	UnlockDir
	EndMovement

	.balign 4, 0
_0198:
	WalkFastSouth
	WalkFastWest
	EndMovement

	.balign 4, 0
_01A4:
	WalkFastSouth 2
	WalkFastWest
	EndMovement

	.balign 4, 0
_01B0:
	WalkFastSouth 3
	WalkFastWest
	EndMovement

	.balign 4, 0
_01BC:
	WalkFastSouth 4
	WalkFastWest
	EndMovement

	.balign 4, 0
_01C8:
	WalkFastSouth 5
	WalkFastWest
	EndMovement

	.balign 4, 0
_01D4:
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_01DC:
	WalkNormalSouth
	WalkNormalWest 5
	WalkNormalSouth 2
	WalkNormalWest 5
	EndMovement

	.balign 4, 0
_01F0:
	WalkNormalSouth
	WalkNormalWest 5
	WalkNormalSouth
	WalkNormalWest 5
	EndMovement

	.balign 4, 0
_0204:
	WalkNormalSouth
	WalkNormalWest 10
	EndMovement

	.balign 4, 0
_0210:
	WalkNormalSouth
	WalkNormalWest 4
	WalkNormalNorth
	WalkNormalWest 5
	EndMovement

	.balign 4, 0
_0224:
	WalkNormalNorth
	WalkNormalWest 10
	EndMovement

scr_seq_R42_001:
	scrcmd_609
	lockall
	play_cry SPECIES_SUICUNE, 0
	release obj_R42_tsure_poke_static_suicune
	scrcmd_523 obj_R42_tsure_poke_static_suicune, 2, 90, 2, 0
	lock obj_R42_tsure_poke_static_suicune
	wait_cry
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 56
	apply_movement obj_R42_tsure_poke_static_suicune, _02EC
	apply_movement obj_player, _0308
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	clearflag FLAG_HIDE_ROUTE_42_EUSINE
	show_person obj_R42_minaki
	callstd std_play_eusine_music
	apply_movement obj_R42_minaki, _0324
	wait_movement
	npc_msg msg_0399_R42_00007
	closemsg
	apply_movement obj_R42_minaki, _0334
	wait_movement
	buffer_players_name 0
	npc_msg msg_0399_R42_00008
	closemsg
	apply_movement obj_R42_minaki, _0348
	wait_movement
	npc_msg msg_0399_R42_00009
	closemsg
	apply_movement obj_R42_minaki, _0340
	wait_movement
	callstd std_fade_end_eusine_music
	hide_person obj_R42_tsure_poke_static_suicune
	hide_person obj_R42_minaki
	setflag FLAG_HIDE_ROUTE_42_SUICUNE
	setflag FLAG_HIDE_ROUTE_42_EUSINE
	setvar VAR_UNK_4092, 0
	setvar VAR_UNK_4070, 1
	setvar VAR_UNK_4071, 1
	clearflag FLAG_HIDE_VERMILION_SUICUNE
	releaseall
	end

	.balign 4, 0
_02EC:
	Delay4 3
	WalkFasterWest 2
	JumpFarWest
	WalkFasterWest 2
	JumpFarNorth 2
	MoveAction_112 1
	EndMovement

	.balign 4, 0
_0308:
	EmoteExclamationMark
	LockDir
	WalkFastNorth 4
	UnlockDir
	Delay16
	WalkNormalEast
	EndMovement

	.balign 4, 0
_0324:
	WalkNormalEast 4
	WalkNormalNorth 3
	WalkNormalEast 6
	EndMovement

	.balign 4, 0
_0334:
	WalkNormalNorth
	FaceWest
	EndMovement

	.balign 4, 0
_0340:
	WalkNormalEast 9
	EndMovement

	.balign 4, 0
_0348:
	WalkNormalEast
	EndMovement

scr_seq_R42_002:
	direction_signpost msg_0399_R42_00000, 1, 1, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_R42_003:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0399_R42_00001, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_R42_004:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0399_R42_00002, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_R42_005:
	direction_signpost msg_0399_R42_00003, 1, 2, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0
