#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T06.h"
#include "msgdata/msg/msg_0483_T06.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T06_000
	scrdef scr_seq_T06_001
	scrdef scr_seq_T06_002
	scrdef scr_seq_T06_003
	scrdef scr_seq_T06_004
	scrdef scr_seq_T06_005
	scrdef scr_seq_T06_006
	scrdef scr_seq_T06_007
	scrdef scr_seq_T06_008
	scrdef scr_seq_T06_009
	scrdef scr_seq_T06_010
	scrdef scr_seq_T06_011
	scrdef scr_seq_T06_012
	scrdef scr_seq_T06_013
	scrdef_end

scr_seq_T06_009:
	goto_if_unset FLAG_UNK_189, _004B
	clearflag FLAG_UNK_189
	end

_004B:
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 4
	goto_if_ne _0066
	clearflag FLAG_HIDE_CAMERON
	goto _0081

_0066:
	compare VAR_TEMP_x4000, 0
	goto_if_ne _007D
	clearflag FLAG_HIDE_CAMERON
	goto _0081

_007D:
	setflag FLAG_HIDE_CAMERON
_0081:
	setvar VAR_UNK_4085, 0
	end

scr_seq_T06_013:
	scrcmd_609
	lockall
	apply_movement obj_T06_daigo, _016C
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_player, _0190
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	npc_msg msg_0483_T06_00016
	closemsg
	apply_movement obj_T06_daigo, _0180
	wait_movement
	get_game_version VAR_TEMP_x4004
	compare VAR_TEMP_x4004, 8
	goto_if_eq _0109
	scrcmd_452 SPECIES_LATIAS, 1
	npc_msg msg_0483_T06_00017
	closemsg
	create_roamer 2
	scrcmd_453
	apply_movement obj_T06_daigo, _0180
	wait_movement
	npc_msg msg_0483_T06_00019
	closemsg
	apply_movement obj_T06_daigo, _0180
	wait_movement
	npc_msg msg_0483_T06_00021
	closemsg
	goto _013F
	end

_0109:
	scrcmd_452 SPECIES_LATIOS, 0
	npc_msg msg_0483_T06_00018
	closemsg
	create_roamer 3
	scrcmd_453
	apply_movement obj_T06_daigo, _0180
	wait_movement
	npc_msg msg_0483_T06_00020
	closemsg
	apply_movement obj_T06_daigo, _0180
	wait_movement
	npc_msg msg_0483_T06_00022
	closemsg
	goto _013F
	end

_013F:
	apply_movement obj_T06_daigo, _0180
	wait_movement
	npc_msg msg_0483_T06_00023
	closemsg
	apply_movement obj_T06_daigo, _0188
	wait_movement
	setvar VAR_UNK_4130, 2
	hide_person obj_T06_daigo
	setflag FLAG_HIDE_VERMILION_CITY_STEVEN
	releaseall
	end

	.balign 4, 0
_016C:
	EmoteExclamationMark
	Delay8
	WalkNormalWest 4
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0180:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0188:
	WalkNormalEast 10
	EndMovement

	.balign 4, 0
_0190:
	Delay16 4
	WalkNormalSouth
	WalkOnSpotNormalEast
	EndMovement

scr_seq_T06_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_491 247
	goto_if_set FLAG_GOT_PP_MAX_FROM_VERMILLION_CITY_MAN, _01FF
	compare VAR_UNK_4135, 8
	goto_if_ge _020A
	compare VAR_UNK_4135, 5
	goto_if_ge _01F4
	compare VAR_UNK_4135, 1
	goto_if_ge _01E9
	npc_msg msg_0483_T06_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_01E9:
	npc_msg msg_0483_T06_00005
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_01F4:
	npc_msg msg_0483_T06_00006
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_01FF:
	npc_msg msg_0483_T06_00009
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_020A:
	npc_msg msg_0483_T06_00007
	goto_if_no_item_space ITEM_PP_MAX, 1, _0241
	callstd std_give_item_verbose
	setflag FLAG_GOT_PP_MAX_FROM_VERMILLION_CITY_MAN
	npc_msg msg_0483_T06_00008
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0241:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_T06_011:
	scrcmd_609
	lockall
	clearflag FLAG_HIDE_VERMILION_EUSINE
	show_person obj_T06_minaki
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4000, 1334
	goto_if_ne _0270
	goto _037F

_0270:
	apply_movement obj_player, _040C
	wait_movement
	play_cry SPECIES_SUICUNE, 0
	release obj_T06_tsure_poke_static_suicune
	scrcmd_523 obj_T06_tsure_poke_static_suicune, 2, 90, 2, 0
	lock obj_T06_tsure_poke_static_suicune
	wait_cry
	callstd std_play_eusine_music
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 331
	goto_if_ne _02D5
	apply_movement obj_player, _0460
	apply_movement obj_T06_minaki, _0490
	apply_movement obj_T06_tsure_poke_static_suicune, _0414
	goto _0318

_02D5:
	compare VAR_TEMP_x4001, 332
	goto_if_ne _0300
	apply_movement obj_player, _0470
	apply_movement obj_T06_minaki, _04A0
	apply_movement obj_T06_tsure_poke_static_suicune, _0420
	goto _0318

_0300:
	apply_movement obj_player, _0480
	apply_movement obj_T06_minaki, _04B0
	apply_movement obj_T06_tsure_poke_static_suicune, _042C
_0318:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	npc_msg msg_0483_T06_00014
	closemsg
	apply_movement obj_T06_minaki, _04D0
	wait_movement
	buffer_players_name 0
	npc_msg msg_0483_T06_00015
	closemsg
	apply_movement obj_T06_minaki, _04E8
	apply_movement obj_player, _04F0
	wait_movement
_034D:
	callstd std_fade_end_eusine_music
	hide_person obj_T06_minaki
	hide_person obj_T06_tsure_poke_static_suicune
	setflag FLAG_HIDE_VERMILION_EUSINE
	setflag FLAG_HIDE_VERMILION_EUSINE_2
	setflag FLAG_HIDE_VERMILION_SUICUNE
	setvar VAR_UNK_4070, 0
	setvar VAR_UNK_4071, 0
	clearflag FLAG_HIDE_ROUTE_14_SUICUNE
	setvar VAR_UNK_4086, 1
	releaseall
	end

_037F:
	apply_movement obj_player, _040C
	apply_movement obj_T06_tsure_poke_static_suicune, _0458
	wait_movement
	play_cry SPECIES_SUICUNE, 0
	release obj_T06_tsure_poke_static_suicune
	scrcmd_523 obj_T06_tsure_poke_static_suicune, 2, 90, 2, 0
	lock obj_T06_tsure_poke_static_suicune
	wait_cry
	callstd std_play_eusine_music
	apply_movement obj_T06_tsure_poke_static_suicune, _0438
	apply_movement obj_T06_minaki, _04C0
	apply_movement obj_player, _04F8
	wait_movement
	apply_movement obj_T06_minaki, _04E0
	apply_movement obj_player, _0504
	wait_movement
	npc_msg msg_0483_T06_00014
	closemsg
	apply_movement obj_T06_minaki, _04D8
	wait_movement
	npc_msg msg_0483_T06_00015
	closemsg
	apply_movement obj_T06_minaki, _04E8
	apply_movement obj_player, _04F0
	wait_movement
	goto _034D

	.balign 4, 0
_040C:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0414:
	Delay4 9
	MoveAction_112 1
	EndMovement

	.balign 4, 0
_0420:
	Delay4 11
	MoveAction_112 1
	EndMovement

	.balign 4, 0
_042C:
	Delay4 13
	MoveAction_112 1
	EndMovement

	.balign 4, 0
_0438:
	Delay4 4
	WalkFasterSouth 2
	JumpNearFastSouth
	JumpFarSouth
	WalkFasterSouth 2
	JumpNearFastSouth
	JumpFarSouth 2
	EndMovement

	.balign 4, 0
_0458:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0460:
	WalkNormalEast 2
	WalkNormalNorth 2
	WalkNormalEast
	EndMovement

	.balign 4, 0
_0470:
	WalkNormalEast 2
	WalkNormalNorth 3
	WalkNormalEast
	EndMovement

	.balign 4, 0
_0480:
	WalkNormalEast 2
	WalkNormalNorth 4
	WalkNormalEast
	EndMovement

	.balign 4, 0
_0490:
	Delay8
	WalkFastSouth 6
	WalkFastEast
	EndMovement

	.balign 4, 0
_04A0:
	Delay4 3
	WalkFastSouth 6
	WalkFastEast
	EndMovement

	.balign 4, 0
_04B0:
	Delay4 5
	WalkFastSouth 6
	WalkFastEast
	EndMovement

	.balign 4, 0
_04C0:
	Delay4 2
	WalkFastEast
	WalkFastSouth 2
	EndMovement

	.balign 4, 0
_04D0:
	FaceSouth
	EndMovement

	.balign 4, 0
_04D8:
	FaceEast
	EndMovement

	.balign 4, 0
_04E0:
	JumpOnSpotFastSouth 3
	EndMovement

	.balign 4, 0
_04E8:
	WalkNormalNorth 8
	EndMovement

	.balign 4, 0
_04F0:
	FaceNorth
	EndMovement

	.balign 4, 0
_04F8:
	Delay4 4
	FaceSouth
	EndMovement

	.balign 4, 0
_0504:
	FaceWest
	EndMovement

scr_seq_T06_012:
	scrcmd_609
	lockall
	clearflag FLAG_HIDE_VERMILION_EUSINE_2
	show_person obj_T06_minaki_2
	apply_movement obj_player, _040C
	wait_movement
	play_cry SPECIES_SUICUNE, 0
	release obj_T06_tsure_poke_static_suicune
	scrcmd_523 obj_T06_tsure_poke_static_suicune, 2, 90, 2, 0
	lock obj_T06_tsure_poke_static_suicune
	wait_cry
	callstd std_play_eusine_music
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4000, 1324
	goto_if_ne _057D
	apply_movement obj_T06_minaki_2, _0654
	apply_movement obj_player, _0630
	apply_movement obj_T06_tsure_poke_static_suicune, _0414
	goto _05C0

_057D:
	compare VAR_TEMP_x4000, 1325
	goto_if_ne _05A8
	apply_movement obj_T06_minaki_2, _0668
	apply_movement obj_player, _063C
	apply_movement obj_T06_tsure_poke_static_suicune, _0420
	goto _05C0

_05A8:
	apply_movement obj_T06_minaki_2, _067C
	apply_movement obj_player, _0648
	apply_movement obj_T06_tsure_poke_static_suicune, _042C
_05C0:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	npc_msg msg_0483_T06_00014
	closemsg
	apply_movement obj_T06_minaki_2, _0690
	apply_movement obj_player, _06A4
	wait_movement
	buffer_players_name 0
	npc_msg msg_0483_T06_00015
	closemsg
	apply_movement obj_T06_minaki_2, _0698
	apply_movement obj_player, _06AC
	wait_movement
	callstd std_fade_end_eusine_music
	hide_person obj_T06_minaki_2
	hide_person obj_T06_tsure_poke_static_suicune
	setflag FLAG_HIDE_VERMILION_EUSINE
	setflag FLAG_HIDE_VERMILION_EUSINE_2
	setflag FLAG_HIDE_VERMILION_SUICUNE
	setvar VAR_UNK_4070, 0
	setvar VAR_UNK_4071, 0
	clearflag FLAG_HIDE_ROUTE_14_SUICUNE
	setvar VAR_UNK_4086, 1
	releaseall
	end

	.balign 4, 0
_0630:
	WalkNormalSouth 4
	WalkNormalEast 2
	EndMovement

	.balign 4, 0
_063C:
	WalkNormalSouth 4
	WalkNormalEast
	EndMovement

	.balign 4, 0
_0648:
	WalkNormalSouth 4
	FaceEast
	EndMovement

	.balign 4, 0
_0654:
	Delay8
	WalkFastEast 7
	WalkFastNorth 3
	WalkFastEast
	EndMovement

	.balign 4, 0
_0668:
	Delay8 2
	WalkFastEast 7
	WalkFastNorth 3
	WalkFastEast
	EndMovement

	.balign 4, 0
_067C:
	Delay8 3
	WalkFastEast 7
	WalkFastNorth 3
	WalkFastEast
	EndMovement

	.balign 4, 0
_0690:
	FaceNorth
	EndMovement

	.balign 4, 0
_0698:
	WalkNormalWest 2
	WalkNormalNorth 13
	EndMovement

	.balign 4, 0
_06A4:
	FaceSouth
	EndMovement

	.balign 4, 0
_06AC:
	Delay8 2
	FaceWest
	Delay8
	FaceNorth
	EndMovement

scr_seq_T06_001:
	simple_npc_msg msg_0483_T06_00000
	end

scr_seq_T06_002:
	simple_npc_msg msg_0483_T06_00003
	end

scr_seq_T06_003:
	simple_npc_msg msg_0483_T06_00001
	end

scr_seq_T06_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_MACHOP, 0
	npc_msg msg_0483_T06_00002
	wait_cry
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T06_005:
	direction_signpost msg_0483_T06_00010, 0, 6, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T06_006:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0483_T06_00011, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T06_007:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0483_T06_00012, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T06_008:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0483_T06_00013, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T06_010:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _086F
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0883
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _07DB
	apply_movement obj_player, _0898
	goto _080E

_07DB:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _07FE
	apply_movement obj_player, _08B8
	apply_movement obj_T06_gsmiddleman1_2, _08CC
	goto _080E

_07FE:
	apply_movement obj_player, _08A4
	apply_movement obj_T06_gsmiddleman1_2, _08CC
_080E:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0835
	apply_movement obj_partner_poke, _08D8
	wait_movement
_0835:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 50
	lockall
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	clearflag FLAG_UNK_189
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 2
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_086F:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 5
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0883:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 3
	wait_button_or_walk_away
	closemsg
	releaseall
	end

	.balign 4, 0
_0898:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_08A4:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_08B8:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_08CC:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_08D8:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement
	.balign 4, 0
