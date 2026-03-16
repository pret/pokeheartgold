#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R30.h"
#include "msgdata/msg/msg_0375_R30.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R30_000
	scrdef scr_seq_R30_001
	scrdef scr_seq_R30_002
	scrdef scr_seq_R30_003
	scrdef scr_seq_R30_004
	scrdef scr_seq_R30_005
	scrdef scr_seq_R30_006
	scrdef scr_seq_R30_007
	scrdef scr_seq_R30_008
	scrdef scr_seq_R30_009
	scrdef scr_seq_R30_010
	scrdef_end

scr_seq_R30_001:
	setflag FLAG_GOT_ELMS_PANIC_CALL
	phone_call PHONE_CONTACT_PROF__ELM, 2, 0
	setvar VAR_SCENE_ROUTE_30_OW, 3
	end

scr_seq_R30_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0375_R30_00000
	closemsg
	apply_movement obj_R30_tsure_poke_static_rattata, _0088
	wait_movement
	apply_movement obj_R30_tsure_poke_static_pidgey, _0090
	wait_movement
	play_se SEQ_SE_DP_SELECT
	faceplayer
	npc_msg msg_0375_R30_00001
	closemsg
	apply_movement obj_R30_gsboy2_3, _0098
	wait_movement
	releaseall
	end

	.balign 4, 0
_0088:
	JumpOnSpotFastNorth 3
	EndMovement

	.balign 4, 0
_0090:
	JumpOnSpotFastSouth 2
	EndMovement

	.balign 4, 0
_0098:
	WalkOnSpotNormalNorth
	EndMovement

scr_seq_R30_002:
	scrcmd_609
	lockall
	scrcmd_307 17, 11, 11, 3, 77
	scrcmd_310 77
	scrcmd_308 77
	clearflag FLAG_HIDE_ROUTE_30_APRICORN_MAN
	show_person obj_R30_gsmiddleman1
	apply_movement obj_R30_gsmiddleman1, _01B0
	wait_movement
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	apply_movement obj_R30_gsmiddleman1, _01C4
	wait_movement
	npc_msg msg_0375_R30_00005
	closemsg
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	compare VAR_TEMP_x4000, 558
	goto_if_ne _010A
	apply_movement obj_player, _01D4
	goto _0148

_010A:
	compare VAR_TEMP_x4000, 559
	goto_if_ne _0125
	apply_movement obj_player, _01E8
	goto _0148

_0125:
	compare VAR_TEMP_x4000, 560
	goto_if_ne _0140
	apply_movement obj_player, _01FC
	goto _0148

_0140:
	apply_movement obj_player, _0210
_0148:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	npc_msg msg_0375_R30_00006
	giveitem_no_check ITEM_APRICORN_BOX, 1
	npc_msg msg_0375_R30_00008
	closemsg
	apply_movement obj_R30_gsmiddleman1, _01CC
	wait_movement
	scrcmd_307 17, 11, 11, 3, 77
	scrcmd_310 77
	scrcmd_308 77
	apply_movement obj_R30_gsmiddleman1, _01B8
	wait_movement
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	hide_person obj_R30_gsmiddleman1
	setflag FLAG_HIDE_ROUTE_30_APRICORN_MAN
	releaseall
	setflag FLAG_GOT_APRICORN_BOX
	setvar VAR_SCENE_ROUTE_30_OW, 1
	end

	.balign 4, 0
_01B0:
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_01B8:
	WalkNormalNorth
	SetInvisible
	EndMovement

	.balign 4, 0
_01C4:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_01CC:
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_01D4:
	WalkNormalSouth 2
	WalkOnSpotNormalWest
	Delay8 2
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_01E8:
	WalkNormalSouth 2
	WalkOnSpotNormalWest
	Delay8 2
	WalkNormalWest 3
	EndMovement

	.balign 4, 0
_01FC:
	WalkNormalSouth 2
	WalkOnSpotNormalWest
	Delay8 2
	WalkNormalWest 4
	EndMovement

	.balign 4, 0
_0210:
	WalkNormalSouth 2
	WalkOnSpotNormalWest
	Delay8 2
	WalkNormalWest 5
	EndMovement

scr_seq_R30_003:
	simple_npc_msg msg_0375_R30_00013
	end

scr_seq_R30_004:
	scrcmd_609
	lockall
	phone_call PHONE_CONTACT_MOTHER, 2, 0
	setvar VAR_SCENE_ROUTE_30_PHONE_CALL, 0
	setflag FLAG_TALKED_TO_MOM_AFTER_NAMING_RIVAL
	releaseall
	end

scr_seq_R30_005:
	direction_signpost msg_0375_R30_00009, 1, 6, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_R30_006:
	direction_signpost msg_0375_R30_00010, 1, 3, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_R30_007:
	scrcmd_055 3, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0375_R30_00012, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_R30_008:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0375_R30_00011, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_R30_009:
	goto_if_set FLAG_GOT_POKEDEX, _02D5
	simple_npc_msg msg_0375_R30_00002
	end

_02D5:
	simple_npc_msg msg_0375_R30_00003
	end

scr_seq_R30_010:
	simple_npc_msg msg_0375_R30_00004
	end
	.balign 4, 0
