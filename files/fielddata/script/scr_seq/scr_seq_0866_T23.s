#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T23.h"
#include "msgdata/msg/msg_0564_T23.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T23_000
	scrdef scr_seq_T23_001
	scrdef scr_seq_T23_002
	scrdef scr_seq_T23_003
	scrdef scr_seq_T23_004
	scrdef scr_seq_T23_005
	scrdef scr_seq_T23_006
	scrdef scr_seq_T23_007
	scrdef scr_seq_T23_008
	scrdef scr_seq_T23_009
	scrdef scr_seq_T23_010
	scrdef scr_seq_T23_011
	scrdef scr_seq_T23_012
	scrdef scr_seq_T23_013
	scrdef scr_seq_T23_014
	scrdef scr_seq_T23_015
	scrdef scr_seq_T23_016
	scrdef_end

scr_seq_T23_004:
	compare VAR_UNK_4080, 0
	goto_if_ne _005F
	setflag FLAG_UNK_19F
	clearflag FLAG_AZALEA_ROCKET_HARASSING_CIVILIAN
	clearflag FLAG_AZALEA_HARASSED_CIVILIAN
_005F:
	end

scr_seq_T23_000:
scr_seq_T23_005:
	simple_npc_msg msg_0564_T23_00003
	end

scr_seq_T23_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0564_T23_00009
	play_cry SPECIES_SLOWPOKE, 0
	npc_msg msg_0564_T23_00010
	wait_cry
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T23_002:
	scrcmd_609
	lockall
	fade_out_bgm 0, 3
	apply_movement obj_player, _02A4
	wait_movement
	setvar VAR_UNK_4099, 1
	callstd std_play_rival_intro_music
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	compare VAR_SPECIAL_x8005, 462
	goto_if_ne _00E5
	move_person_facing obj_T23_gsrivel, 404, 0, 463, DIR_WEST
	apply_movement obj_T23_gsrivel, _028C
	apply_movement obj_player, _02AC
	goto _018E

_00E5:
	compare VAR_SPECIAL_x8005, 463
	goto_if_ne _0114
	move_person_facing obj_T23_gsrivel, 404, 0, 464, DIR_WEST
	apply_movement obj_T23_gsrivel, _028C
	apply_movement obj_player, _02AC
	goto _018E

_0114:
	compare VAR_SPECIAL_x8005, 464
	goto_if_ne _0143
	move_person_facing obj_T23_gsrivel, 404, 0, 463, DIR_WEST
	apply_movement obj_T23_gsrivel, _0298
	apply_movement obj_player, _02C0
	goto _018E

_0143:
	compare VAR_SPECIAL_x8005, 465
	goto_if_ne _0172
	move_person_facing obj_T23_gsrivel, 404, 0, 464, DIR_WEST
	apply_movement obj_T23_gsrivel, _0298
	apply_movement obj_player, _02C0
	goto _018E

_0172:
	move_person_facing obj_T23_gsrivel, 404, 0, 465, DIR_WEST
	apply_movement obj_T23_gsrivel, _0298
	apply_movement obj_player, _02C0
_018E:
	wait_movement
	buffer_rivals_name 0
	npc_msg msg_0564_T23_00001
	closemsg
	get_starter_choice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 152
	goto_if_ne _01B7
	trainer_battle TRAINER_RIVAL_SILVER_7, 0, 0, 0
	goto _01DA

_01B7:
	compare VAR_SPECIAL_RESULT, 155
	goto_if_ne _01D2
	trainer_battle TRAINER_RIVAL_SILVER_10, 0, 0, 0
	goto _01DA

_01D2:
	trainer_battle TRAINER_RIVAL_SILVER, 0, 0, 0
_01DA:
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0285
	callstd std_play_rival_outro_music
	buffer_rivals_name 0
	npc_msg msg_0564_T23_00002
	closemsg
	setvar VAR_UNK_4075, 2
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	compare VAR_SPECIAL_x8005, 462
	goto_if_ne _021E
	apply_movement obj_T23_gsrivel, _02D4
	goto _0277

_021E:
	compare VAR_SPECIAL_x8005, 463
	goto_if_ne _0239
	apply_movement obj_T23_gsrivel, _02DC
	goto _0277

_0239:
	compare VAR_SPECIAL_x8005, 464
	goto_if_ne _0254
	apply_movement obj_T23_gsrivel, _02D4
	goto _0277

_0254:
	compare VAR_SPECIAL_x8005, 465
	goto_if_ne _026F
	apply_movement obj_T23_gsrivel, _02DC
	goto _0277

_026F:
	apply_movement obj_T23_gsrivel, _02EC
_0277:
	wait_movement
	hide_person obj_T23_gsrivel
	callstd std_fade_end_rival_outro_music
	releaseall
	end

_0285:
	white_out
	releaseall
	end
	.byte 0x00

_028C:
	step 14, 9
	step 0, 1
	step_end

_0298:
	step 14, 9
	step 1, 1
	step_end

_02A4:
	step 75, 1
	step_end

_02AC:
	step 3, 1
	step 62, 6
	step 63, 7
	step 1, 1
	step_end

_02C0:
	step 3, 1
	step 62, 6
	step 63, 7
	step 0, 1
	step_end

_02D4:
	step 14, 3
	step_end

_02DC:
	step 14, 1
	step 12, 1
	step 14, 2
	step_end

_02EC:
	step 14, 1
	step 12, 2
	step 14, 2
	step_end
scr_seq_T23_003:
	scrcmd_609
	lockall
	apply_movement obj_T23_rocketm_3, _0350
	wait_movement
	npc_msg msg_0564_T23_00016
	play_se SEQ_SE_DP_WALL_HIT
	npc_msg msg_0564_T23_00017
	closemsg
	apply_movement obj_T23_gsmiddleman1_2, _0358
	wait_movement
	move_person_facing obj_T23_gsmiddleman1_2, 23, 0, 16, DIR_EAST
	apply_movement obj_T23_rocketm_3, _0374
	wait_movement
	hide_person obj_T23_gsmiddleman1_2
	setflag FLAG_AZALEA_HARASSED_CIVILIAN
	setflag FLAG_AZALEA_ROCKET_HARASSING_CIVILIAN
	clearflag FLAG_UNK_19F
	setvar VAR_UNK_4080, 1
	releaseall
	end


_0350:
	step 34, 2
	step_end

_0358:
	step 71, 1
	step 22, 1
	step 63, 2
	step 10, 2
	step 72, 1
	step 18, 9
	step_end

_0374:
	step 12, 2
	step 33, 1
	step_end
scr_seq_T23_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_BEAT_AZALEA_ROCKETS, _039C
	npc_msg msg_0564_T23_00018
	goto _039F

_039C:
	npc_msg msg_0564_T23_00019
_039F:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T23_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_BEAT_AZALEA_ROCKETS, _03C3
	npc_msg msg_0564_T23_00005
	goto _039F

_03C3:
	npc_msg msg_0564_T23_00006
	goto _039F

scr_seq_T23_008:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0564_T23_00012, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T23_009:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0564_T23_00013, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T23_010:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0564_T23_00015, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T23_011:
	direction_signpost msg_0564_T23_00011, 0, 14, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T23_012:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0564_T23_00014, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T23_013:
	direction_signpost msg_0564_T23_00000, 1, 2, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T23_014:
	simple_npc_msg msg_0564_T23_00004
	end

scr_seq_T23_015:
	simple_npc_msg msg_0564_T23_00007
	end

scr_seq_T23_016:
	simple_npc_msg msg_0564_T23_00008
	end
	.balign 4, 0
