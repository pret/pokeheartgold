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


_0084:
	step 75, 1
	step 18, 3
	step_end

_0090:
	step 0, 1
	step 75, 1
	step 18, 3
	step_end

_00A0:
	step 65, 3
	step 1, 1
	step_end

_00AC:
	step 65, 3
	step 17, 1
	step 0, 1
	step_end
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


_0150:
	step 19, 1
	step 17, 10
	step_end

_015C:
	step 71, 1
	step 19, 1
	step 72, 1
	step 1, 1
	step_end

_0170:
	step 62, 12
	step 2, 1
	step_end

_017C:
	step 62, 1
	step 1, 1
	step 62, 10
	step 12, 1
	step 2, 1
	step_end
scr_seq_R24_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	compare VAR_SCENE_ROUTE_24_ROCKET, 2
	goto_if_ne _01B3
	goto _01DC
	.byte 0x16, 0x00, 0x29
	.byte 0x00, 0x00, 0x00
_01B3:
	compare VAR_SCENE_ROUTE_24_ROCKET, 3
	goto_if_ne _01D1
	faceplayer
	npc_msg msg_0362_R24_00005
	goto _01DF
	.byte 0x16, 0x00, 0x0b, 0x00, 0x00
	.byte 0x00
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
	.byte 0x16, 0x00, 0x29, 0x00, 0x00, 0x00
_0206:
	compare VAR_SCENE_ROUTE_24_ROCKET, 3
	goto_if_ne _0224
	faceplayer
	npc_msg msg_0362_R24_00008
	goto _0232
	.byte 0x16, 0x00
	.byte 0x0b, 0x00, 0x00, 0x00
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
