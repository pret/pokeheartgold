#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D37R0101.h"
#include "msgdata/msg/msg_0116_D37R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D37R0101_000
	scrdef scr_seq_D37R0101_001
	scrdef scr_seq_D37R0101_002
	scrdef scr_seq_D37R0101_003
	scrdef_end

scr_seq_D37R0101_003:
	get_friend_sprite VAR_OBJ_0
	end

scr_seq_D37R0101_002:
	scrcmd_609
	lockall
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 3
	goto_if_eq _0228
	clearflag FLAG_HIDE_GOLDENROD_UNDERGROUND_FRIEND
	show_person obj_D37R0101_tsure_poke_static_marill
	compare VAR_TEMP_x4001, 30
	goto_if_ne _0050
	move_person_facing obj_D37R0101_tsure_poke_static_marill, 9, 0, 25, DIR_WEST
_0050:
	play_se SEQ_SE_DP_KAIDAN2
	apply_movement obj_D37R0101_tsure_poke_static_marill, _0174
	wait_movement
	wait 8, VAR_SPECIAL_RESULT
	play_cry SPECIES_MARILL, 0
	wait_cry
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_player, _01BC
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	clearflag FLAG_HIDE_GOLDENROD_UNDERGROUND_FRIEND
	show_person obj_D37R0101_var_1
	compare VAR_TEMP_x4001, 30
	goto_if_ne _00AB
	move_person_facing obj_D37R0101_var_1, 9, 0, 25, DIR_WEST
_00AB:
	play_se SEQ_SE_DP_KAIDAN2
	callstd std_play_friend_music
	apply_movement obj_D37R0101_var_1, _01C4
	wait_movement
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _00EE
	apply_movement obj_D37R0101_tsure_poke_static_marill, _0218
	apply_movement obj_player, _0218
	apply_movement obj_partner_poke, _0218
	wait_movement
	goto _0100

_00EE:
	apply_movement obj_D37R0101_tsure_poke_static_marill, _0218
	apply_movement obj_player, _0218
	wait_movement
_0100:
	buffer_players_name 0
	gender_msgbox msg_0116_D37R0101_00006, msg_0116_D37R0101_00009
	closemsg
	apply_movement obj_D37R0101_var_1, _01D0
	apply_movement obj_D37R0101_tsure_poke_static_marill, _01E0
	wait_movement
	gender_msgbox msg_0116_D37R0101_00007, msg_0116_D37R0101_00010
	giveitem_no_check ITEM_FASHION_CASE, 1
	call _0354
	gender_msgbox msg_0116_D37R0101_00008, msg_0116_D37R0101_00011
	closemsg
	apply_movement obj_D37R0101_var_1, _01F0
	apply_movement obj_D37R0101_tsure_poke_static_marill, _0204
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	setflag FLAG_HIDE_GOLDENROD_UNDERGROUND_FRIEND
	hide_person obj_D37R0101_var_1
	hide_person obj_D37R0101_tsure_poke_static_marill
	wait_se SEQ_SE_DP_KAIDAN2
	callstd std_fade_end_friend_music
	setvar VAR_UNK_40F8, 1
	setflag FLAG_UNK_14C
	releaseall
	end

	.balign 4, 0
_0174:
	WalkSlightlyFastWest
	WalkOnSpotFastEast
	JumpOnSpotFastWest 2
	WalkFastWest 3
	FaceNorth
	Delay1
	FaceEast
	Delay1
	FaceSouth
	Delay1
	FaceWest
	Delay1
	FaceNorth
	Delay1
	FaceEast
	Delay1
	FaceSouth
	EndMovement

	.balign 4, 0
_01BC:
	WalkNormalNorth 3
	EndMovement

	.balign 4, 0
_01C4:
	WalkNormalWest
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_01D0:
	WalkNormalWest
	WalkNormalSouth 2
	WalkNormalWest
	EndMovement

	.balign 4, 0
_01E0:
	Delay8 3
	WalkNormalEast
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_01F0:
	WalkNormalSouth 2
	WalkNormalWest
	WalkNormalSouth
	SetInvisible
	EndMovement

	.balign 4, 0
_0204:
	WalkNormalSouth 3
	WalkNormalWest
	WalkNormalSouth
	SetInvisible
	EndMovement

	.balign 4, 0
_0218:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0220:
	WalkOnSpotNormalSouth
	EndMovement

_0228:
	clearflag FLAG_HIDE_GOLDENROD_UNDERGROUND_FRIEND
	show_person obj_D37R0101_var_1
	clearflag FLAG_HIDE_GOLDENROD_UNDERGROUND_FRIEND
	show_person obj_D37R0101_tsure_poke_static_marill
	lock obj_D37R0101_tsure_poke_static_marill
	callstd std_play_friend_music
	move_person_facing obj_D37R0101_var_1, 25, 0, 9, DIR_NORTH
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	apply_movement obj_player, _0220
	apply_movement obj_D37R0101_var_1, _0308
	wait_movement
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_player, _0310
	apply_movement obj_D37R0101_var_1, _0318
	wait 8, VAR_SPECIAL_RESULT
	move_person_facing obj_D37R0101_tsure_poke_static_marill, 25, 0, 9, DIR_NORTH
	apply_movement obj_D37R0101_tsure_poke_static_marill, _0320
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	buffer_players_name 0
	gender_msgbox msg_0116_D37R0101_00006, msg_0116_D37R0101_00009
	gender_msgbox msg_0116_D37R0101_00007, msg_0116_D37R0101_00010
	giveitem_no_check ITEM_FASHION_CASE, 1
	call _0354
	gender_msgbox msg_0116_D37R0101_00008, msg_0116_D37R0101_00011
	closemsg
	apply_movement obj_D37R0101_var_1, _0328
	apply_movement obj_D37R0101_tsure_poke_static_marill, _033C
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	setflag FLAG_HIDE_GOLDENROD_UNDERGROUND_FRIEND
	hide_person obj_D37R0101_var_1
	hide_person obj_D37R0101_tsure_poke_static_marill
	wait_se SEQ_SE_DP_KAIDAN2
	callstd std_fade_end_friend_music
	setvar VAR_UNK_40F8, 1
	setflag FLAG_UNK_14C
	releaseall
	end

	.balign 4, 0
_0308:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0310:
	WalkNormalSouth 2
	EndMovement

	.balign 4, 0
_0318:
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_0320:
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_0328:
	WalkNormalEast
	WalkNormalNorth 4
	WalkNormalWest 2
	SetInvisible
	EndMovement

	.balign 4, 0
_033C:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 4
	WalkNormalWest 2
	SetInvisible
	EndMovement

_0354:
	call _03A8
	call _03A8
	call _03A8
	call _03A8
	call _03A8
	call _03C2
	call _03C2
	call _03C2
	call _03C2
	call _03C2
	scrcmd_406 0
	setvar VAR_TEMP_x4001, 9999
	call _03DC
	call _03DC
	return

_03A8:
	random VAR_SPECIAL_RESULT, 6
	setvar VAR_SPECIAL_x8004, 0
	addvar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	scrcmd_403 VAR_SPECIAL_x8004, 1
	return

_03C2:
	random VAR_SPECIAL_RESULT, 6
	setvar VAR_SPECIAL_x8004, 18
	addvar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	scrcmd_403 VAR_SPECIAL_x8004, 1
	return

_03DC:
	random VAR_SPECIAL_RESULT, 8
	compare VAR_TEMP_x4001, VAR_SPECIAL_RESULT
	goto_if_eq _03DC
	copyvar VAR_TEMP_x4001, VAR_SPECIAL_RESULT
	setvar VAR_SPECIAL_x8004, 1
	addvar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	scrcmd_406 VAR_SPECIAL_x8004
	return

scr_seq_D37R0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_SCENE_ROCKET_TAKEOVER, 2
	goto_if_ne _0425
	npc_msg msg_0116_D37R0101_00002
	goto _0454

_0425:
	compare VAR_SCENE_ROCKET_TAKEOVER, 4
	goto_if_ne _043B
	npc_msg msg_0116_D37R0101_00002
	goto _0454

_043B:
	compare VAR_SCENE_ROCKET_TAKEOVER, 3
	goto_if_ne _0451
	npc_msg msg_0116_D37R0101_00001
	goto _0454

_0451:
	npc_msg msg_0116_D37R0101_00000
_0454:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D37R0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_SCENE_ROCKET_TAKEOVER, 2
	goto_if_ne _047A
	npc_msg msg_0116_D37R0101_00005
	goto _04A9

_047A:
	compare VAR_SCENE_ROCKET_TAKEOVER, 4
	goto_if_ne _0490
	npc_msg msg_0116_D37R0101_00005
	goto _04A9

_0490:
	compare VAR_SCENE_ROCKET_TAKEOVER, 3
	goto_if_ne _04A6
	npc_msg msg_0116_D37R0101_00004
	goto _04A9

_04A6:
	npc_msg msg_0116_D37R0101_00003
_04A9:
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
