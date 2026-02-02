#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R34.h"
#include "msgdata/msg/msg_0384_R34.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R34_000
	scrdef scr_seq_R34_001
	scrdef scr_seq_R34_002
	scrdef scr_seq_R34_003
	scrdef scr_seq_R34_004
	scrdef scr_seq_R34_005
	scrdef scr_seq_R34_006
	scrdef scr_seq_R34_007
	scrdef scr_seq_R34_008
	scrdef scr_seq_R34_009
	scrdef scr_seq_R34_010
	scrdef scr_seq_R34_011
	scrdef scr_seq_R34_012
	scrdef_end

scr_seq_R34_000:
	get_friend_sprite VAR_OBJ_0
	check_day_care_egg VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 0
	goto_if_eq _0057
	set_object_movement_type obj_R34_gsoldman1, 16
	goto _005D

_0057:
	set_object_movement_type obj_R34_gsoldman1, 15
_005D:
	goto_if_unset FLAG_UNK_189, _006E
	clearflag FLAG_UNK_189
	end

_006E:
	check_badge BADGE_PLAIN, VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 0
	goto_if_eq _009F
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 3
	goto_if_eq _00A9
	compare VAR_TEMP_x4000, 4
	goto_if_eq _00A9
_009F:
	setflag FLAG_HIDE_CAMERON
	goto _00AD

_00A9:
	clearflag FLAG_HIDE_CAMERON
_00AD:
	scrcmd_379 VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 3
	goto_if_eq _00D5
	compare VAR_TEMP_x4000, 4
	goto_if_eq _00D5
	clearflag FLAG_UNK_1D1
	setflag FLAG_UNK_1D2
	end

_00D5:
	clearflag FLAG_UNK_1D2
	setflag FLAG_UNK_1D1
	end

scr_seq_R34_001:
	scrcmd_609
	lockall
	apply_movement obj_R34_gsoldman1, _0130
	apply_movement obj_player, _0140
	wait_movement
	npc_msg msg_0384_R34_00046
	buffer_players_name 0
	register_gear_number PHONE_CONTACT_DAY_C_MAN
	npc_msg msg_0384_R34_00047
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	register_gear_number PHONE_CONTACT_DAY_C_LADY
	npc_msg msg_0384_R34_00048
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	npc_msg msg_0384_R34_00049
	closemsg
	apply_movement obj_R34_gsoldman1, _014C
	wait_movement
	setvar VAR_UNK_408E, 3
	releaseall
	end

	.balign 4, 0
_0130:
	EmoteExclamationMark
	WalkNormalSouth
	WalkNormalEast 2
	EndMovement

	.balign 4, 0
_0140:
	Delay8 3
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_014C:
	WalkNormalWest 2
	WalkNormalNorth
	WalkOnSpotNormalSouth
	EndMovement

scr_seq_R34_003:
	scrcmd_609
	lockall
	gender_msgbox msg_0384_R34_00036, msg_0384_R34_00041
	closemsg
	apply_movement obj_R34_gsoldman1, _0510
	wait_movement
	callstd std_play_friend_music
	apply_movement obj_R34_var_1, _049C
	apply_movement obj_R34_tsure_poke_static_marill, _04B0
	wait_movement
	apply_movement obj_R34_gsoldman1, _0500
	wait_movement
	gender_msgbox msg_0384_R34_00037, msg_0384_R34_00042
	closemsg
	apply_movement obj_R34_var_1, _04F8
	wait_movement
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	buffer_players_name 0
	compare VAR_SPECIAL_x8004, 368
	goto_if_ne _01D4
	apply_movement obj_R34_var_1, _04C0
	apply_movement obj_R34_tsure_poke_static_marill, _04CC
	apply_movement obj_R34_gsoldman1, _0494
	goto _0207

_01D4:
	compare VAR_SPECIAL_x8004, 369
	goto_if_ne _01FF
	apply_movement obj_R34_var_1, _04C0
	apply_movement obj_R34_tsure_poke_static_marill, _04CC
	apply_movement obj_R34_gsoldman1, _0494
	goto _0207

_01FF:
	apply_movement obj_R34_var_1, _0518
_0207:
	wait_movement
	gender_msgbox msg_0384_R34_00038, msg_0384_R34_00043
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	compare VAR_SPECIAL_x8004, 363
	goto_if_ne _0234
	apply_movement obj_player, _0528
	goto _02C3

_0234:
	compare VAR_SPECIAL_x8004, 364
	goto_if_ne _024F
	apply_movement obj_player, _0534
	goto _02C3

_024F:
	compare VAR_SPECIAL_x8004, 365
	goto_if_ne _026A
	apply_movement obj_player, _053C
	goto _02C3

_026A:
	compare VAR_SPECIAL_x8004, 366
	goto_if_ne _0285
	apply_movement obj_player, _0548
	goto _02C3

_0285:
	compare VAR_SPECIAL_x8004, 367
	goto_if_ne _02A0
	apply_movement obj_player, _0554
	goto _02C3

_02A0:
	compare VAR_SPECIAL_x8004, 368
	goto_if_ne _02BB
	apply_movement obj_player, _0560
	goto _02C3

_02BB:
	apply_movement obj_player, _056C
_02C3:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	compare VAR_SPECIAL_x8004, 368
	goto_if_ne _02EA
	apply_movement obj_R34_var_1, _0510
	goto _030D

_02EA:
	compare VAR_SPECIAL_x8004, 369
	goto_if_ne _0305
	apply_movement obj_R34_var_1, _0510
	goto _030D

_0305:
	apply_movement obj_R34_var_1, _0508
_030D:
	wait_movement
	buffer_players_name 0
	gender_msgbox msg_0384_R34_00039, msg_0384_R34_00044
	closemsg
	compare VAR_SPECIAL_x8004, 368
	goto_if_ne _033B
	apply_movement obj_R34_var_1, _04D4
	apply_movement obj_R34_tsure_poke_static_marill, _04E8
	goto _036E

_033B:
	compare VAR_SPECIAL_x8004, 369
	goto_if_ne _035E
	apply_movement obj_R34_var_1, _04D4
	apply_movement obj_R34_tsure_poke_static_marill, _04E8
	goto _036E

_035E:
	apply_movement obj_R34_var_1, _04E0
	apply_movement obj_R34_tsure_poke_static_marill, _04F0
_036E:
	wait_movement
	buffer_players_name 0
	gender_msgbox msg_0384_R34_00040, msg_0384_R34_00045
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	compare VAR_SPECIAL_x8004, 368
	goto_if_ne _03AE
	apply_movement obj_R34_var_1, _0578
	apply_movement obj_R34_tsure_poke_static_marill, _0590
	apply_movement obj_player, _05A4
	goto _03F1

_03AE:
	compare VAR_SPECIAL_x8004, 369
	goto_if_ne _03D9
	apply_movement obj_R34_var_1, _0578
	apply_movement obj_R34_tsure_poke_static_marill, _0590
	apply_movement obj_player, _05A4
	goto _03F1

_03D9:
	apply_movement obj_R34_var_1, _0584
	apply_movement obj_R34_tsure_poke_static_marill, _0598
	apply_movement obj_player, _05B4
_03F1:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	scrcmd_307 11, 12, 16, 26, 77
	scrcmd_310 77
	scrcmd_308 77
	apply_movement obj_R34_var_1, _05C4
	apply_movement obj_R34_tsure_poke_static_marill, _05D0
	wait_movement
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_player, _05E0
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	play_se SEQ_SE_DP_KAIDAN2
	scrcmd_596 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0455
	scrcmd_600
_0455:
	fade_screen 6, 1, 0, RGB_BLACK
	wait_se SEQ_SE_DP_KAIDAN2
	wait_fade
	scrcmd_309 77
	setvar VAR_UNK_408E, 1
	warp MAP_ROUTE_34_DAYCARE, 0, 3, 12, DIR_NORTH
	scrcmd_582 MAP_ROUTE_34, 368, 411
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

	.balign 4, 0
_0494:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_049C:
	WalkNormalSouth 6
	WalkNormalEast 3
	WalkNormalSouth 2
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_04B0:
	WalkNormalSouth 7
	WalkNormalEast 3
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_04C0:
	WalkNormalSouth
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_04CC:
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_04D4:
	WalkNormalEast
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_04E0:
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_04E8:
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_04F0:
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_04F8:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0500:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0508:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0510:
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0518:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0520:
	SetInvisible
	EndMovement

	.balign 4, 0
_0528:
	WalkNormalEast
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_0534:
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_053C:
	WalkNormalWest
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_0548:
	WalkNormalWest 2
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_0554:
	WalkNormalWest 3
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_0560:
	WalkNormalWest 3
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_056C:
	WalkNormalWest 4
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_0578:
	WalkNormalEast 3
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0584:
	WalkNormalEast 4
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0590:
	WalkNormalEast 3
	EndMovement

	.balign 4, 0
_0598:
	WalkNormalSouth
	WalkNormalEast 3
	EndMovement

	.balign 4, 0
_05A4:
	Delay8
	WalkNormalEast 3
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_05B4:
	Delay8
	WalkNormalEast 4
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_05C4:
	WalkNormalNorth
	SetInvisible
	EndMovement

	.balign 4, 0
_05D0:
	WalkNormalEast
	WalkNormalNorth
	SetInvisible
	EndMovement

	.balign 4, 0
_05E0:
	WalkNormalNorth 2
	SetInvisible
	EndMovement

scr_seq_R34_002:
	simple_npc_msg msg_0384_R34_00018
	end

scr_seq_R34_012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0727
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _073B
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0678
	apply_movement obj_player, _0750
	apply_movement obj_R34_gsmiddleman1_2, _079C
	goto _06C6

_0678:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0693
	apply_movement obj_player, _0768
	goto _06C6

_0693:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _06B6
	apply_movement obj_player, _0788
	apply_movement obj_R34_gsmiddleman1_2, _079C
	goto _06C6

_06B6:
	apply_movement obj_player, _0774
	apply_movement obj_R34_gsmiddleman1_2, _079C
_06C6:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _06ED
	apply_movement obj_partner_poke, _07A8
	wait_movement
_06ED:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 9
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

_0727:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 5
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_073B:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 3
	wait_button_or_walk_away
	closemsg
	releaseall
	end

	.balign 4, 0
_0750:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0768:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0774:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0788:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_079C:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_07A8:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_R34_004:
	scrcmd_609
	lockall
	count_alive_mons VAR_TEMP_x4003, 6
	compare VAR_TEMP_x4003, 1
	goto_if_ne _07DB
	goto _07E1

_07D5:
	goto _07E1

_07DB:
	goto _087D

_07E1:
	apply_movement obj_R34_gswoman3, _0918
	stop_bgm 0
	play_bgm SEQ_GS_EYE_J_SHOUJO
	wait_movement
	apply_movement obj_player, _0944
	wait_movement
	npc_msg msg_0384_R34_00019
	closemsg
	trainer_battle TRAINER_ACE_TRAINER_F_IRENE, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0912
	apply_movement obj_R34_gswoman3, _094C
	wait_movement
	npc_msg msg_0384_R34_00021
	closemsg
	apply_movement obj_R34_gswoman3_2, _0924
	stop_bgm 0
	play_bgm SEQ_GS_EYE_J_SHOUJO
	wait_movement
	apply_movement obj_player, _093C
	wait_movement
	npc_msg msg_0384_R34_00024
	closemsg
	trainer_battle TRAINER_ACE_TRAINER_F_JENN, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0912
	apply_movement obj_R34_gswoman3_2, _0954
	wait_movement
	npc_msg msg_0384_R34_00026
	wait_button_or_walk_away
	closemsg
	goto _0908
	end

_087D:
	apply_movement obj_R34_gswoman3, _0918
	stop_bgm 0
	play_bgm SEQ_GS_EYE_J_SHOUJO
	wait_movement
	apply_movement obj_player, _0944
	wait_movement
	npc_msg msg_0384_R34_00019
	closemsg
	apply_movement obj_R34_gswoman3_2, _0924
	play_bgm SEQ_GS_EYE_J_SHOUJO
	wait_movement
	apply_movement obj_player, _093C
	wait_movement
	npc_msg msg_0384_R34_00024
	closemsg
	trainer_battle TRAINER_ACE_TRAINER_F_JENN, 120, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0912
	apply_movement obj_R34_gswoman3, _094C
	wait_movement
	apply_movement obj_player, _0944
	wait_movement
	npc_msg msg_0384_R34_00021
	closemsg
	apply_movement obj_R34_gswoman3_2, _0954
	wait_movement
	apply_movement obj_player, _093C
	wait_movement
	npc_msg msg_0384_R34_00026
	wait_button_or_walk_away
	closemsg
_0908:
	setvar VAR_UNK_4097, 1
	releaseall
	end

_0912:
	white_out
	releaseall
	end

	.balign 4, 0
_0918:
	EmoteExclamationMark
	WalkNormalWest 4
	EndMovement

	.balign 4, 0
_0924:
	EmoteExclamationMark
	WalkNormalEast 4
	EndMovement

	.balign 4, 0
_0930:
	EmoteExclamationMark
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_093C:
	FaceWest
	EndMovement

	.balign 4, 0
_0944:
	FaceEast
	EndMovement

	.balign 4, 0
_094C:
	JumpOnSpotFastWest 2
	EndMovement

	.balign 4, 0
_0954:
	JumpOnSpotFastEast 2
	EndMovement

scr_seq_R34_005:
	scrcmd_609
	lockall
	setvar VAR_TEMP_x4004, 777
	apply_movement obj_R34_gswoman3_3, _0930
	stop_bgm 0
	play_bgm SEQ_GS_EYE_J_SHOUJO
	wait_movement
	npc_msg msg_0384_R34_00028
	closemsg
	stop_bgm 0
	trainer_battle TRAINER_ACE_TRAINER_F_KATE, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0912
	setvar VAR_UNK_4097, 2
_09A0:
	npc_msg msg_0384_R34_00030
	goto_if_no_item_space ITEM_POWER_HERB, 1, _09EE
	callstd std_give_item_verbose
	setvar VAR_UNK_4097, 3
	npc_msg msg_0384_R34_00032
	wait_button_or_walk_away
	closemsg
_09D5:
	compare VAR_TEMP_x4004, 777
	goto_if_ne _09EA
	releaseall
	goto _09EC

_09EA:
	releaseall
_09EC:
	end

_09EE:
	callstd std_bag_is_full
	closemsg
	goto _09D5
	end

scr_seq_R34_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_UNK_4097, 1
	goto_if_ne _0A1A
	npc_msg msg_0384_R34_00022
	goto _0A1D

_0A1A:
	npc_msg msg_0384_R34_00023
_0A1D:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_R34_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_UNK_4097, 1
	goto_if_ne _0A43
	npc_msg msg_0384_R34_00026
	goto _0A46

_0A43:
	npc_msg msg_0384_R34_00027
_0A46:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_R34_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4004, 555
	compare VAR_UNK_4097, 2
	goto_if_eq _09A0
	npc_msg msg_0384_R34_00032
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_R34_009:
	scrcmd_055 3, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0384_R34_00034, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_R34_010:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0384_R34_00035, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_R34_011:
	direction_signpost msg_0384_R34_00033, 1, 4, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0
