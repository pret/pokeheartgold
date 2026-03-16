#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R24.h"
#include "msgdata/msg/msg_0362_R24.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R24_000
	scrdef scr_seq_R24_001
	scrdef scr_seq_R24_002
	scrdef scr_seq_R24_003
	scrdef scr_seq_R24_004
	scrdef_end

scr_seq_R24_004:
	compare VAR_SCENE_ROUTE_24_ROCKET, 2
	goto_if_eq _0025
	end

_0025:
	setvar VAR_SCENE_ROUTE_24_ROCKET, 1
	end

scr_seq_R24_003:
	scrcmd_609
	lockall
	get_player_facing VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 0
	goto_if_ne _0060
	apply_movement obj_R24_rocketm, _0084
	apply_movement obj_R24_gsman1, _00A0
	apply_movement obj_R24_gswoman2, _00AC
	goto _0078

_0060:
	apply_movement obj_R24_rocketm, _0090
	apply_movement obj_R24_gsman1, _00A0
	apply_movement obj_R24_gswoman2, _00AC
_0078:
	wait_movement
	setvar VAR_SCENE_ROUTE_24_ROCKET, 2
	releaseall
	end

	.balign 4, 0
_0084:
	EmoteExclamationMark
	WalkFastWest 3
	EndMovement

	.balign 4, 0
_0090:
	FaceNorth
	EmoteExclamationMark
	WalkFastWest 3
	EndMovement

	.balign 4, 0
_00A0:
	Delay16 3
	FaceSouth
	EndMovement

	.balign 4, 0
_00AC:
	Delay16 3
	WalkFastSouth
	FaceNorth
	EndMovement

scr_seq_R24_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	stop_bgm SEQ_GS_R_12_24
	play_bgm SEQ_GS_EYE_ROCKET
	npc_msg msg_0362_R24_00000
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_24, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _014A
	npc_msg msg_0362_R24_00002
	closemsg
	fade_out_bgm 0, 30
	npc_msg msg_0362_R24_00003
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 56
	apply_movement obj_R24_rocketm, _0150
	apply_movement obj_player, _015C
	apply_movement obj_R24_gsman1, _0170
	apply_movement obj_R24_gswoman2, _017C
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	hide_person obj_R24_rocketm
	setflag FLAG_HIDE_ROUTE_24_ROCKET
	clearflag FLAG_HIDE_CERULEAN_GYM_MACHINE_PART
	play_bgm SEQ_GS_R_12_24
	setvar VAR_SCENE_ROUTE_24_ROCKET, 3
	releaseall
	end

_014A:
	white_out
	releaseall
	end

	.balign 4, 0
_0150:
	WalkFastEast
	WalkFastSouth 10
	EndMovement

	.balign 4, 0
_015C:
	LockDir
	WalkFastEast
	UnlockDir
	FaceSouth
	EndMovement

	.balign 4, 0
_0170:
	Delay4 12
	FaceWest
	EndMovement

	.balign 4, 0
_017C:
	Delay4
	FaceSouth
	Delay4 10
	WalkNormalNorth
	FaceWest
	EndMovement

scr_seq_R24_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	compare VAR_SCENE_ROUTE_24_ROCKET, 2
	goto_if_ne _01B3
	goto _01DC

_01AD:
	goto _01DC

_01B3:
	compare VAR_SCENE_ROUTE_24_ROCKET, 3
	goto_if_ne _01D1
	faceplayer
	npc_msg msg_0362_R24_00005
	goto _01DF

_01CB:
	goto _01DC

_01D1:
	faceplayer
	npc_msg msg_0362_R24_00006
	goto _01DF

_01DC:
	npc_msg msg_0362_R24_00004
_01DF:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_R24_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	compare VAR_SCENE_ROUTE_24_ROCKET, 2
	goto_if_ne _0206
	goto _022F

_0200:
	goto _022F

_0206:
	compare VAR_SCENE_ROUTE_24_ROCKET, 3
	goto_if_ne _0224
	faceplayer
	npc_msg msg_0362_R24_00008
	goto _0232

_021E:
	goto _022F

_0224:
	faceplayer
	npc_msg msg_0362_R24_00009
	goto _0232

_022F:
	npc_msg msg_0362_R24_00007
_0232:
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
