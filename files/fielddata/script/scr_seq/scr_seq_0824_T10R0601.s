#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T10R0601.h"
#include "msgdata/msg/msg_0527_T10R0601.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T10R0601_000
	scrdef scr_seq_T10R0601_001
	scrdef scr_seq_T10R0601_002
	scrdef_end

scr_seq_T10R0601_001:
	scrcmd_609
	lockall
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_player, _0048
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	play_se SEQ_SE_DP_KI_GASYAN
	clearflag FLAG_UNK_210
	show_person obj_T10R0601_babyboy1_11
	setvar VAR_UNK_40C8, 1
	releaseall
	end

	.balign 4, 0
_0048:
	WalkNormalNorth 6
	EndMovement

scr_seq_T10R0601_002:
	setflag FLAG_UNK_210
	setvar VAR_UNK_40C8, 0
	end

scr_seq_T10R0601_000:
	scrcmd_609
	lockall
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4000, 5
	goto_if_ne _008B
	apply_movement obj_player, _0298
	goto _00AE

_008B:
	compare VAR_TEMP_x4000, 6
	goto_if_ne _00A6
	apply_movement obj_player, _02A8
	goto _00AE

_00A6:
	apply_movement obj_player, _02B0
_00AE:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	apply_movement obj_T10R0601_wataru, _02C0
	wait_movement
	buffer_players_name 0
	gender_msgbox msg_0527_T10R0601_00000, msg_0527_T10R0601_00001
	closemsg
	compare VAR_UNK_4135, 8
	goto_if_lt _00E8
	trainer_battle TRAINER_CHAMPION_LANCE_2, 0, 0, 0
	goto _00F0

_00E8:
	trainer_battle TRAINER_CHAMPION_LANCE, 0, 0, 0
_00F0:
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0290
	buffer_players_name 0
	gender_msgbox msg_0527_T10R0601_00002, msg_0527_T10R0601_00003
	closemsg
	wait 10, VAR_SPECIAL_x8004
	play_se SEQ_SE_DP_KI_GASYAN
	hide_person obj_T10R0601_leag_door2
	move_person_facing obj_T10R0601_kurumi, 6, 0, 20, DIR_NORTH
	move_person_facing obj_T10R0601_ookido, 6, 0, 17, DIR_NORTH
	wait 30, VAR_SPECIAL_x8004
	stop_bgm 0
	play_bgm SEQ_GS_EYE_J_SHOUJO
	apply_movement obj_T10R0601_wataru, _02C8
	apply_movement obj_player, _02E0
	wait_movement
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _01A1
	compare VAR_TEMP_x4000, 5
	goto_if_ne _017C
	apply_movement obj_partner_poke, _02F8
	goto _019F

_017C:
	compare VAR_TEMP_x4000, 6
	goto_if_ne _0197
	apply_movement obj_partner_poke, _0308
	goto _019F

_0197:
	apply_movement obj_partner_poke, _0320
_019F:
	wait_movement
_01A1:
	apply_movement obj_T10R0601_kurumi, _0338
	wait_movement
	npc_msg msg_0527_T10R0601_00005
	closemsg
	apply_movement obj_T10R0601_ookido, _0348
	apply_movement obj_T10R0601_kurumi, _0350
	wait_movement
	buffer_players_name 0
	gender_msgbox msg_0527_T10R0601_00006, msg_0527_T10R0601_00007
	closemsg
	apply_movement obj_T10R0601_kurumi, _0360
	wait_movement
	npc_msg msg_0527_T10R0601_00008
	apply_movement obj_T10R0601_wataru, _0368
	apply_movement obj_player, _0378
	wait_movement
	buffer_players_name 0
	gender_msgbox msg_0527_T10R0601_00009, msg_0527_T10R0601_00010
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_T10R0601_wataru, _0384
	apply_movement obj_player, _0394
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0234
	apply_movement obj_partner_poke, _03A4
	wait_movement
_0234:
	play_se SEQ_SE_DP_KAIDAN2
	apply_movement obj_T10R0601_kurumi, _03AC
	wait_movement
	npc_msg msg_0527_T10R0601_00011
	apply_movement obj_T10R0601_kurumi, _03BC
	wait_movement
	wait_button
	closemsg
	goto_if_set FLAG_GAME_CLEAR, _0268
	clearflag FLAG_HIDE_OLIVINE_PORT_OAK
	setvar VAR_UNK_411A, 1
_0268:
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_POKEMON_LEAGUE_HALL_OF_FAME, 0, 6, 22, DIR_NORTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

_0290:
	white_out
	releaseall
	end

	.balign 4, 0
_0298:
	WalkNormalNorth 2
	WalkNormalEast
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_02A8:
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_02B0:
	WalkNormalNorth 2
	WalkNormalWest
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_02C0:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_02C8:
	FaceSouth
	EmoteExclamationMark 0
	LockDir
	WalkNormalEast
	UnlockDir
	EndMovement

	.balign 4, 0
_02E0:
	FaceSouth
	Delay8 4
	LockDir
	WalkNormalNorth 2
	UnlockDir
	EndMovement

	.balign 4, 0
_02F8:
	WalkFastNorth 3
	WalkFastEast
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0308:
	WalkFastNorth 2
	WalkFastWest
	WalkFastNorth 2
	WalkFastEast
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0320:
	WalkFastNorth
	WalkFastEast
	WalkFastNorth 2
	WalkFastWest 2
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0338:
	WalkFastNorth 12
	FaceSouth
	WalkOnSpotFastSouth 3
	EndMovement

	.balign 4, 0
_0348:
	WalkNormalNorth 8
	EndMovement

	.balign 4, 0
_0350:
	Delay8 6
	WalkNormalWest
	FaceNorth
	EndMovement

	.balign 4, 0
_0360:
	WalkOnSpotFastNorth 4
	EndMovement

	.balign 4, 0
_0368:
	WalkNormalNorth 2
	WalkNormalWest
	FaceSouth
	EndMovement

	.balign 4, 0
_0378:
	Delay8 3
	FaceNorth
	EndMovement

	.balign 4, 0
_0384:
	Delay4
	WalkNormalNorth 2
	SetInvisible
	EndMovement

	.balign 4, 0
_0394:
	WalkNormalNorth 2
	WalkNormalNorth 2
	SetInvisible
	EndMovement

	.balign 4, 0
_03A4:
	SetInvisible
	EndMovement

	.balign 4, 0
_03AC:
	WalkFastNorth 4
	EmoteExclamationMark 0
	Delay8 2
	EndMovement

	.balign 4, 0
_03BC:
	WalkFastEast
	WalkFastWest 2
	WalkFastEast 2
	WalkFastWest
	FaceNorth
	EndMovement
	.balign 4, 0
