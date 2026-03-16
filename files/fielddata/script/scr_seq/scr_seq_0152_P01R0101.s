#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_P01R0101.h"
#include "msgdata/msg/msg_0255_P01R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_P01R0101_000
	scrdef scr_seq_P01R0101_001
	scrdef scr_seq_P01R0101_002
	scrdef scr_seq_P01R0101_003
	scrdef scr_seq_P01R0101_004
	scrdef_end

scr_seq_P01R0101_001:
	scrcmd_445 VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 330
	goto_if_eq _0029
	end

_0029:
	set_object_facing obj_P01R0101_seaman_2, DIR_SOUTH
	end

scr_seq_P01R0101_002:
	scrcmd_609
	lockall
	apply_movement obj_P01R0101_ookido, _00E4
	wait_movement
	stop_bgm 0
	play_bgm SEQ_GS_OHKIDO
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_P01R0101_ookido, _00EC
	apply_movement obj_player, _0100
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	buffer_players_name 0
	gender_msgbox msg_0255_P01R0101_00009, msg_0255_P01R0101_00010
	closemsg
	apply_movement obj_P01R0101_ookido, _0110
	wait_movement
	nat_dex_flag_action 1, VAR_SPECIAL_RESULT
	buffer_players_name 0
	play_fanfare SEQ_ME_ITEM
	npc_msg msg_0255_P01R0101_00011
	wait_fanfare
	enable_mass_outbreaks
	npc_msg msg_0255_P01R0101_00012
	closemsg
	apply_movement obj_P01R0101_ookido, _0120
	wait_movement
	npc_msg msg_0255_P01R0101_00013
	closemsg
	apply_movement obj_P01R0101_ookido, _0128
	wait_movement
	hide_person obj_P01R0101_ookido
	setflag FLAG_HIDE_OLIVINE_PORT_OAK
	setvar VAR_UNK_411A, 0
	fade_out_bgm 0, 30
	stop_bgm 0
	reset_bgm
	releaseall
	compare VAR_UNK_40D3, 1
	call_if_eq _00DE
	enable_mass_outbreaks
	end

_00DE:
	clearflag FLAG_HIDE_POKEATHLON_SUPREME_CUP_RECEPTIONIST
	return

	.balign 4, 0
_00E4:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_00EC:
	Delay8
	WalkNormalWest 3
	WalkNormalNorth
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0100:
	Delay8 3
	WalkNormalSouth 3
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0110:
	WalkOnSpotNormalWest
	Delay8 2
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0120:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0128:
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth
	EndMovement

scr_seq_P01R0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_unset FLAG_GAME_CLEAR, _0361
	compare VAR_TEMP_x4002, 1
	goto_if_ge _0356
	get_player_facing VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 0
	goto_if_eq _0320
	compare VAR_UNK_40CB, 7
	goto_if_ge _01FB
	npc_msg msg_0255_P01R0101_00001
	closemsg
	hasitem ITEM_S_S__TICKET, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _02F9
	apply_movement obj_player, _036C
	wait_movement
	buffer_players_name 0
	npc_msg msg_0255_P01R0101_00004
	closemsg
	apply_movement obj_P01R0101_seaman_2, _03F4
	wait_movement
	npc_msg msg_0255_P01R0101_00005
	closemsg
	apply_movement obj_P01R0101_seaman_2, _038C
	wait_movement
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_player, _03AC
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	setvar VAR_TEMP_x4002, 1
	setvar VAR_BOAT_DIRECTION, 1
	setvar VAR_UNK_40DC, 0
	clearflag FLAG_BOAT_ARRIVED
	setflag FLAG_UNK_22C
	setflag FLAG_UNK_22B
	releaseall
	end

_01FB:
	get_weekday VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0218
	goto _02EE

_0212:
	goto _029B

_0218:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0231
	goto _029B

_022B:
	goto _029B

_0231:
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _024A
	goto _02EE

_0244:
	goto _029B

_024A:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _0263
	goto _02EE

_025D:
	goto _029B

_0263:
	compare VAR_SPECIAL_RESULT, 4
	goto_if_ne _027C
	goto _02EE

_0276:
	goto _029B

_027C:
	compare VAR_SPECIAL_RESULT, 5
	goto_if_ne _0295
	goto _029B

_028F:
	goto _029B

_0295:
	goto _02EE

_029B:
	npc_msg msg_0255_P01R0101_00007
	closemsg
	apply_movement obj_P01R0101_seaman_2, _038C
	wait_movement
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_player, _03AC
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	setvar VAR_TEMP_x4002, 1
	setvar VAR_BOAT_DIRECTION, 1
	setvar VAR_UNK_40DC, 0
	clearflag FLAG_BOAT_ARRIVED
	setflag FLAG_UNK_22A
	clearflag FLAG_UNK_22B
	setflag FLAG_UNK_22C
	releaseall
	end

_02EE:
	npc_msg msg_0255_P01R0101_00008
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_02F9:
	apply_movement obj_player, _0378
	wait_movement
	buffer_players_name 0
	npc_msg msg_0255_P01R0101_00002
	closemsg
	apply_movement obj_P01R0101_seaman_2, _03F4
	wait_movement
	npc_msg msg_0255_P01R0101_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0320:
	apply_movement obj_P01R0101_seaman_2, _03B4
	wait_movement
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_player, _03D4
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	apply_movement obj_P01R0101_seaman_2, _03E0
	wait_movement
	releaseall
	end

_0356:
	npc_msg msg_0255_P01R0101_00006
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0361:
	npc_msg msg_0255_P01R0101_00000
	wait_button_or_walk_away
	closemsg
	releaseall
	end

	.balign 4, 0
_036C:
	WalkOnSpotNormalEast
	FaceSouth 2
	EndMovement

	.balign 4, 0
_0378:
	JumpOnSpotFastWest
	JumpOnSpotFastEast
	FaceSouth 2
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_038C:
	LockDir
	WalkNormalSouth
	UnlockDir
	FaceWest 2
	LockDir
	WalkNormalEast
	UnlockDir
	EndMovement

	.balign 4, 0
_03AC:
	WalkNormalSouth 2
	EndMovement

	.balign 4, 0
_03B4:
	LockDir
	WalkNormalNorth
	UnlockDir
	FaceWest 2
	LockDir
	WalkNormalEast
	UnlockDir
	EndMovement

	.balign 4, 0
_03D4:
	Delay8
	WalkNormalNorth 4
	EndMovement

	.balign 4, 0
_03E0:
	WalkNormalWest
	FaceSouth 2
	WalkNormalSouth
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_03F4:
	WalkOnSpotNormalNorth
	EndMovement

scr_seq_P01R0101_003:
	simple_npc_msg msg_0255_P01R0101_00014
	end

scr_seq_P01R0101_004:
	simple_npc_msg msg_0255_P01R0101_00015
	end
	.balign 4, 0
