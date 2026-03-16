#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T21.h"
#include "msgdata/msg/msg_0550_T21.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T21_000
	scrdef scr_seq_T21_001
	scrdef scr_seq_T21_002
	scrdef scr_seq_T21_003
	scrdef scr_seq_T21_004
	scrdef scr_seq_T21_005
	scrdef scr_seq_T21_006
	scrdef scr_seq_T21_007
	scrdef scr_seq_T21_008
	scrdef scr_seq_T21_009
	scrdef scr_seq_T21_010
	scrdef_end

scr_seq_T21_010:
	goto_if_unset FLAG_UNK_189, _003F
	clearflag FLAG_UNK_189
	end

_003F:
	check_badge BADGE_PLAIN, VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 0
	goto_if_eq _007D
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 1
	goto_if_eq _0083
	compare VAR_TEMP_x4000, 3
	goto_if_eq _0083
	compare VAR_TEMP_x4000, 5
	goto_if_eq _0083
_007D:
	setflag FLAG_HIDE_CAMERON
	end

_0083:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_T21_000:
	end

scr_seq_T21_001:
	lock obj_T21_gsoldman1
	apply_movement obj_T21_gsoldman1, _0350
	wait_movement
	callstd std_play_follow_music
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 397
	goto_if_ne _00BE
	apply_movement obj_T21_gsoldman1, _0358
	goto _0109

_00BE:
	compare VAR_TEMP_x4001, 398
	goto_if_ne _00D9
	apply_movement obj_T21_gsoldman1, _0360
	goto _0109

_00D9:
	compare VAR_TEMP_x4001, 399
	goto_if_ne _00F4
	apply_movement obj_T21_gsoldman1, _0368
	goto _0109

_00F4:
	compare VAR_TEMP_x4001, 400
	goto_if_ne _0109
	apply_movement obj_T21_gsoldman1, _0370
_0109:
	apply_movement obj_player, _0378
	wait_movement
	npc_msg msg_0550_T21_00000
	closemsg
	buffer_players_name 0
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 397
	goto_if_ne _013C
	apply_movement obj_T21_gsoldman1, _0390
	goto _0187

_013C:
	compare VAR_TEMP_x4001, 398
	goto_if_ne _0157
	apply_movement obj_T21_gsoldman1, _03AC
	goto _0187

_0157:
	compare VAR_TEMP_x4001, 399
	goto_if_ne _0172
	apply_movement obj_T21_gsoldman1, _03D0
	goto _0187

_0172:
	compare VAR_TEMP_x4001, 400
	goto_if_ne _0187
	apply_movement obj_T21_gsoldman1, _03F4
_0187:
	wait_movement
	apply_movement obj_player, _0380
	wait_movement
	npc_msg msg_0550_T21_00001
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	compare VAR_TEMP_x4001, 397
	goto_if_ne _01C5
	apply_movement obj_T21_gsoldman1, _0418
	apply_movement obj_player, _0478
	goto _0228

_01C5:
	compare VAR_TEMP_x4001, 398
	goto_if_ne _01E8
	apply_movement obj_T21_gsoldman1, _0430
	apply_movement obj_player, _0488
	goto _0228

_01E8:
	compare VAR_TEMP_x4001, 399
	goto_if_ne _020B
	apply_movement obj_T21_gsoldman1, _0448
	apply_movement obj_player, _0498
	goto _0228

_020B:
	compare VAR_TEMP_x4001, 400
	goto_if_ne _0228
	apply_movement obj_T21_gsoldman1, _0460
	apply_movement obj_player, _04A8
_0228:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	npc_msg msg_0550_T21_00002
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_T21_gsoldman1, _04B8
	apply_movement obj_player, _04CC
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	npc_msg msg_0550_T21_00003
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_T21_gsoldman1, _04E0
	apply_movement obj_player, _04FC
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	npc_msg msg_0550_T21_00004
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_T21_gsoldman1, _050C
	apply_movement obj_player, _052C
	wait_movement
	play_se SEQ_SE_GS_N_UMIBE
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	npc_msg msg_0550_T21_00005
	closemsg
	stop_se SEQ_SE_GS_N_UMIBE
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_T21_gsoldman1, _054C
	apply_movement obj_player, _0568
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	npc_msg msg_0550_T21_00006
	give_running_shoes
	buffer_players_name 0
	npc_msg msg_0550_T21_00007
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	npc_msg msg_0550_T21_00008
	closemsg
	apply_movement obj_T21_gsoldman1, _0580
	wait_movement
	scrcmd_307 17, 12, 14, 17, 77
	scrcmd_310 77
	scrcmd_308 77
	apply_movement obj_T21_gsoldman1, _0580
	wait_movement
	release obj_T21_gsoldman1
	release obj_partner_poke
	play_se SEQ_SE_DP_KAIDAN2
	hide_person obj_T21_gsoldman1
	wait_se SEQ_SE_DP_KAIDAN2
	setflag FLAG_HIDE_CHERRYGROVE_GUIDE_GENT
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	callstd std_fade_end_mom_music
	setvar VAR_SCENE_CHERRYGROVE_CITY_OW, 1
	end

	.balign 4, 0
_0350:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0358:
	Delay4
	EndMovement

	.balign 4, 0
_0360:
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_0368:
	WalkNormalSouth 2
	EndMovement

	.balign 4, 0
_0370:
	WalkNormalSouth 3
	EndMovement

	.balign 4, 0
_0378:
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0380:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0388:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0390:
	WalkFastWest 2
	WalkFastNorth 2
	EmoteExclamationMark
	WalkOnSpotFastSouth
	WalkFastSouth 3
	WalkFastEast
	EndMovement

	.balign 4, 0
_03AC:
	WalkFastWest 2
	WalkFastNorth 3
	Delay8
	WalkOnSpotFastSouth
	Delay32
	EmoteExclamationMark
	WalkFastSouth 4
	WalkFastEast
	EndMovement

	.balign 4, 0
_03D0:
	WalkFastWest 2
	WalkFastNorth 4
	Delay8
	WalkOnSpotFastSouth
	Delay32
	EmoteExclamationMark
	WalkFastSouth 5
	WalkFastEast
	EndMovement

	.balign 4, 0
_03F4:
	WalkFastWest 2
	WalkFastNorth 4
	Delay8
	WalkOnSpotFastSouth
	Delay32
	EmoteExclamationMark
	WalkFastSouth 5
	WalkFastEast
	EndMovement

	.balign 4, 0
_0418:
	WalkFastWest
	WalkFastNorth 3
	WalkOnSpotFastSouth
	Delay4 4
	WalkOnSpotFastNorth
	EndMovement

	.balign 4, 0
_0430:
	WalkFastWest
	WalkFastNorth 4
	WalkOnSpotFastSouth
	Delay4 5
	WalkOnSpotFastNorth
	EndMovement

	.balign 4, 0
_0448:
	WalkFastWest
	WalkFastNorth 5
	WalkOnSpotFastSouth
	Delay4 6
	WalkOnSpotFastNorth
	EndMovement

	.balign 4, 0
_0460:
	WalkFastWest
	WalkFastNorth 6
	WalkOnSpotFastSouth
	Delay4 9
	WalkOnSpotFastNorth
	EndMovement

	.balign 4, 0
_0478:
	WalkNormalWest 2
	WalkNormalNorth 2
	Delay8
	EndMovement

	.balign 4, 0
_0488:
	WalkNormalWest 2
	WalkNormalNorth 3
	Delay8
	EndMovement

	.balign 4, 0
_0498:
	WalkNormalWest 2
	WalkNormalNorth 4
	Delay8
	EndMovement

	.balign 4, 0
_04A8:
	WalkNormalWest 2
	WalkNormalNorth 5
	Delay8
	EndMovement

	.balign 4, 0
_04B8:
	WalkFastWest 9
	WalkOnSpotFastEast
	Delay4 7
	WalkOnSpotFastNorth
	EndMovement

	.balign 4, 0
_04CC:
	WalkNormalNorth
	WalkNormalWest 8
	Delay8 2
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_04E0:
	WalkFastWest 6
	WalkFastNorth 2
	WalkFastWest
	WalkOnSpotFastEast
	Delay4 7
	WalkOnSpotFastNorth
	EndMovement

	.balign 4, 0
_04FC:
	WalkNormalWest 7
	WalkNormalNorth 2
	Delay8
	EndMovement

	.balign 4, 0
_050C:
	WalkFastSouth 2
	WalkFastWest 6
	WalkFastSouth 8
	WalkNormalWest 6
	WalkOnSpotFastNorth
	Delay4 17
	WalkOnSpotFastWest
	EndMovement

	.balign 4, 0
_052C:
	WalkNormalWest
	WalkNormalSouth 2
	WalkNormalWest 6
	WalkNormalSouth 7
	WalkNormalWest 6
	Delay8 2
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_054C:
	WalkFastEast 16
	WalkOnSpotFastWest
	Delay4 6
	WalkFastSouth 2
	WalkFastEast 6
	WalkOnSpotFastWest
	EndMovement

	.balign 4, 0
_0568:
	Delay4
	WalkNormalSouth
	WalkNormalEast 16
	WalkNormalSouth 2
	WalkNormalEast 5
	EndMovement

	.balign 4, 0
_0580:
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_0588:
	WalkNormalNorth
	EndMovement

scr_seq_T21_002:
	scrcmd_609
	lockall
	apply_movement obj_player, _0680
	wait_movement
	callstd std_play_follow_music
	clearflag FLAG_HIDE_CHERRYGROVE_GUIDE_GENT
	show_person obj_T21_gsoldman1
	lock obj_T21_gsoldman1
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	move_person_facing obj_T21_gsoldman1, VAR_TEMP_x4000, 1, 394, DIR_NORTH
	compare VAR_TEMP_x4000, 549
	goto_if_ne _05DB
	apply_movement obj_T21_gsoldman1, _068C
	goto _05FE

_05DB:
	compare VAR_TEMP_x4000, 550
	goto_if_ne _05F6
	apply_movement obj_T21_gsoldman1, _068C
	goto _05FE

_05F6:
	apply_movement obj_T21_gsoldman1, _069C
_05FE:
	wait_movement
	compare VAR_TEMP_x4000, 549
	goto_if_ne _061B
	apply_movement obj_player, _0380
	goto _063E

_061B:
	compare VAR_TEMP_x4000, 550
	goto_if_ne _0636
	apply_movement obj_player, _0380
	goto _063E

_0636:
	apply_movement obj_player, _0388
_063E:
	wait_movement
	npc_msg msg_0550_T21_00009
	buffer_players_name 0
	npc_msg msg_0550_T21_00010
	play_fanfare SEQ_ME_KEYITEM
	wait_fanfare
	npc_msg msg_0550_T21_00011
	npc_msg msg_0550_T21_00012
	closemsg
	apply_movement obj_T21_gsoldman1, _06AC
	wait_movement
	callstd std_fade_end_mom_music
	release obj_T21_gsoldman1
	hide_person obj_T21_gsoldman1
	setflag FLAG_HIDE_CHERRYGROVE_GUIDE_GENT
	register_pokegear_card 1
	releaseall
	setvar VAR_SCENE_CHERRYGROVE_CITY_OW, 2
	end

	.balign 4, 0
_0680:
	EmoteExclamationMark
	WalkOnSpotFastSouth
	EndMovement

	.balign 4, 0
_068C:
	WalkFastWest
	WalkFastNorth 9
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_069C:
	WalkFastEast
	WalkFastNorth 9
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_06AC:
	WalkFastSouth 9
	EndMovement

scr_seq_T21_003:
	scrcmd_609
	lockall
	fade_out_bgm 0, 3
	apply_movement obj_player, _0350
	wait_movement
	callstd std_play_rival_intro_music
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	move_person_facing obj_T21_gsrivel, 583, 0, VAR_TEMP_x4001, DIR_WEST
	apply_movement obj_T21_gsrivel, _0808
	wait_movement
	npc_msg msg_0550_T21_00013
	closemsg
	get_starter_choice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 152
	goto_if_ne _070C
	trainer_battle TRAINER_PASSERBY_BOY_2, 0, 1, 0
	goto _072F

_070C:
	compare VAR_SPECIAL_RESULT, 155
	goto_if_ne _0727
	trainer_battle TRAINER_PASSERBY_BOY_3, 0, 1, 0
	goto _072F

_0727:
	trainer_battle TRAINER_PASSERBY_BOY, 0, 1, 0
_072F:
	check_battle_won VAR_SPECIAL_RESULT
	callstd std_play_rival_outro_music
	npc_msg msg_0550_T21_00014
	closemsg
	play_se SEQ_SE_DP_WALL_HIT2
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 56
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	compare VAR_SPECIAL_x8005, 398
	goto_if_ne _076B
	apply_movement obj_player, _0890
	goto _0773

_076B:
	apply_movement obj_player, _08A4
_0773:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	compare VAR_SPECIAL_x8005, 398
	goto_if_ne _079A
	apply_movement obj_T21_gsrivel, _0810
	goto _07A2

_079A:
	apply_movement obj_T21_gsrivel, _0844
_07A2:
	wait_movement
	npc_msg msg_0550_T21_00015
	closemsg
	get_person_coords 4, VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	compare VAR_SPECIAL_x8005, 401
	goto_if_ne _07D4
	apply_movement obj_T21_gsrivel, _0880
	apply_movement obj_player, _08B8
	goto _07E4

_07D4:
	apply_movement obj_T21_gsrivel, _0878
	apply_movement obj_player, _08B8
_07E4:
	wait_movement
	hide_person obj_T21_gsrivel
	setflag FLAG_HIDE_CHERRYGROVE_RIVAL
	callstd std_fade_end_rival_outro_music
	releaseall
	setvar VAR_SCENE_CHERRYGROVE_CITY_OW, 4
	setflag FLAG_MET_PASSERBY_BOY
	end

_0800:
	white_out
	releaseall
	end

	.balign 4, 0
_0808:
	WalkNormalWest 7
	EndMovement

	.balign 4, 0
_0810:
	WalkNormalWest 6
	EmoteExclamationMark
	WalkOnSpotFastSouth
	Delay8
	WalkOnSpotFastNorth
	Delay8
	WalkOnSpotFastSouth
	Delay8
	WalkOnSpotNormalEast
	Delay8
	WalkNormalEast 5
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0844:
	WalkNormalWest 6
	EmoteExclamationMark
	WalkOnSpotFastSouth
	Delay8
	WalkOnSpotFastNorth
	Delay8
	WalkOnSpotFastSouth
	Delay8
	WalkOnSpotNormalEast
	Delay8
	WalkNormalEast 5
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0878:
	WalkNormalWest 11
	EndMovement

	.balign 4, 0
_0880:
	WalkNormalWest 5
	WalkNormalNorth
	WalkNormalWest 6
	EndMovement

	.balign 4, 0
_0890:
	FaceNorth
	LockDir
	WalkFastSouth
	UnlockDir
	EndMovement

	.balign 4, 0
_08A4:
	FaceSouth
	LockDir
	WalkFastNorth
	UnlockDir
	EndMovement

	.balign 4, 0
_08B8:
	Delay8 2
	WalkOnSpotNormalWest
	EndMovement

scr_seq_T21_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_GOT_MYSTIC_WATER_FROM_CHERRYGROVE_CITY_MAN, _0903
	npc_msg msg_0550_T21_00020
	goto_if_no_item_space ITEM_MYSTIC_WATER, 1, _090E
	callstd std_give_item_verbose
	setflag FLAG_GOT_MYSTIC_WATER_FROM_CHERRYGROVE_CITY_MAN
_0903:
	npc_msg msg_0550_T21_00021
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_090E:
	npc_msg msg_0550_T21_00022
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T21_009:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0A41
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0A55
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0992
	apply_movement obj_player, _0A6C
	apply_movement obj_T21_gsmiddleman1, _0AC0
	goto _09E0

_0992:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _09AD
	apply_movement obj_player, _0A84
	goto _09E0

_09AD:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _09D0
	apply_movement obj_player, _0AA4
	apply_movement obj_T21_gsmiddleman1, _0AC0
	goto _09E0

_09D0:
	apply_movement obj_player, _0A90
	apply_movement obj_T21_gsmiddleman1, _0AC0
_09E0:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0A07
	apply_movement obj_partner_poke, _0ACC
	wait_movement
_0A07:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 1
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

_0A41:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 5
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0A55:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 3
	wait_button_or_walk_away
	closemsg
	releaseall
	end

	.balign 4, 0
_0A6C:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0A84:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0A90:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0AA4:
	WalkNormalSouth
	WalkNormalEast 2
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0AC0:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0ACC:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_T21_005:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0550_T21_00024, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T21_006:
	direction_signpost msg_0550_T21_00023, 0, 12, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T21_007:
	simple_npc_msg msg_0550_T21_00019
	end

scr_seq_T21_008:
	simple_npc_msg msg_0550_T21_00017
	end
	.balign 4, 0
