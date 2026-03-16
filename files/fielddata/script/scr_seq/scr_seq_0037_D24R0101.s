#include "constants/events.h"
#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D24R0101.h"
#include "msgdata/msg/msg_0072_D24R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D24R0101_000
	scrdef scr_seq_D24R0101_001
	scrdef scr_seq_D24R0101_002
	scrdef scr_seq_D24R0101_003
	scrdef scr_seq_D24R0101_004
	scrdef scr_seq_D24R0101_005
	scrdef scr_seq_D24R0101_006
	scrdef scr_seq_D24R0101_007
	scrdef_end

scr_seq_D24R0101_006:
	compare VAR_UNOWN_REPORT_LEVEL, 7
	goto_if_ge _005E
	compare VAR_UNOWN_REPORT_LEVEL, 6
	goto_if_eq _0080
_003C:
	move_warp 11, 418, 284
	move_warp 12, 419, 284
	move_warp 13, 418, 284
	move_warp 14, 419, 284
	end

_005E:
	move_warp 8, 418, 284
	move_warp 9, 419, 284
	move_warp 11, 418, 284
	move_warp 12, 419, 284
	end

_0080:
	move_warp 8, 418, 284
	move_warp 9, 419, 284
	move_warp 13, 418, 284
	move_warp 14, 419, 284
	end

scr_seq_D24R0101_005:
	goto_if_unset FLAG_UNK_189, _00B3
	clearflag FLAG_UNK_189
	end

_00B3:
	compare VAR_SCENE_SINJOH_MYSTRI_ROOM, 9
	goto_if_ge _00C6
	setvar VAR_SCENE_SINJOH_MYSTRI_ROOM, 1
_00C6:
	check_badge BADGE_PLAIN, VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 0
	goto_if_eq _0104
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 5
	goto_if_eq _010E
	compare VAR_TEMP_x4000, 6
	goto_if_eq _010E
	compare VAR_TEMP_x4000, 0
	goto_if_eq _010E
_0104:
	setflag FLAG_HIDE_CAMERON
	goto _0112

_010E:
	clearflag FLAG_HIDE_CAMERON
_0112:
	compare VAR_UNOWN_REPORT_LEVEL, 7
	goto_if_ge _005E
	compare VAR_UNOWN_REPORT_LEVEL, 6
	goto_if_eq _0080
	goto _003C
	end

scr_seq_D24R0101_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0239
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _024D
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _01AD
	apply_movement obj_player, _0264
	apply_movement obj_D24R0101_gsmiddleman1, _029C
	goto _01D8

_01AD:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _01C8
	apply_movement obj_player, _027C
	goto _01D8

_01C8:
	apply_movement obj_player, _0288
	apply_movement obj_D24R0101_gsmiddleman1, _029C
_01D8:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _01FF
	apply_movement obj_partner_poke, _02A8
	wait_movement
_01FF:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 3
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

_0239:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 5
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_024D:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 3
	wait_button_or_walk_away
	closemsg
	releaseall
	end

	.balign 4, 0
_0264:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_027C:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0288:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_029C:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_02A8:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_D24R0101_007:
	scrcmd_609
	lockall
	get_party_lead_alive VAR_TEMP_x4005
	follower_poke_is_event_trigger EVENT_ARCEUS_MOVIE_GIFT, VAR_TEMP_x4005, VAR_TEMP_x4006
	compare VAR_TEMP_x4006, 0
	goto_if_eq _02DA
	goto _02EE

_02DA:
	follower_poke_is_event_trigger EVENT_ARCEUS_HALL_OF_ORIGIN, VAR_TEMP_x4005, VAR_TEMP_x4007
	compare VAR_TEMP_x4007, 0
	goto_if_eq _0530
_02EE:
	player_on_bike_check VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0530
	scrcmd_307 13, 8, 25, 29, 77
	scrcmd_310 77
	scrcmd_308 77
	clearflag FLAG_HIDE_ALPH_OUTSIDE_ARCEUS_EVENT_SUIT
	show_person obj_D24R0101_suit
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	apply_movement obj_D24R0101_suit, _0534
	apply_movement obj_player, _05C4
	get_player_facing VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 3
	goto_if_ne _0350
	apply_movement obj_partner_poke, _05DC
	goto _0373

_0350:
	compare VAR_TEMP_x4001, 2
	goto_if_ne _036B
	apply_movement obj_partner_poke, _05F4
	goto _0373

_036B:
	apply_movement obj_partner_poke, _0604
_0373:
	wait_movement
	npc_msg msg_0072_D24R0101_00001
	closemsg
	apply_movement obj_D24R0101_suit, _054C
	compare VAR_TEMP_x4001, 3
	goto_if_ne _039D
	apply_movement obj_partner_poke, _0614
	goto _03C0

_039D:
	compare VAR_TEMP_x4001, 2
	goto_if_ne _03B8
	apply_movement obj_partner_poke, _0624
	goto _03C0

_03B8:
	apply_movement obj_partner_poke, _0630
_03C0:
	wait_movement
	npc_msg msg_0072_D24R0101_00002
	closemsg
	compare VAR_TEMP_x4001, 3
	goto_if_ne _03E2
	apply_movement obj_D24R0101_suit, _0554
	goto _03EA

_03E2:
	apply_movement obj_D24R0101_suit, _0570
_03EA:
	wait_movement
	npc_msg msg_0072_D24R0101_00003
	closemsg
	apply_movement obj_D24R0101_suit, _0584
	wait_movement
	npc_msg msg_0072_D24R0101_00004
	closemsg
	apply_movement obj_D24R0101_suit, _05A4
	wait_movement
	npc_msg msg_0072_D24R0101_00005
	closemsg
	apply_movement obj_D24R0101_suit, _05B4
	wait_movement
	npc_msg msg_0072_D24R0101_00006
	closemsg
	setvar VAR_SCENE_SINJOH_MYSTRI_ROOM, 2
	setflag FLAG_HIDE_ALPH_OUTSIDE_ARCEUS_EVENT_SUIT
	clearflag FLAG_HIDE_ALPH_MAIN_CHAMBER_ARCEUS_EVENT_PEOPLE
	play_se SEQ_SE_DP_KAIDAN2
	compare VAR_UNOWN_REPORT_LEVEL, 6
	goto_if_ne _0467
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL_SINJOH_EVENT, 0, 15, 24, DIR_WEST
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	goto _0530

_0467:
	compare VAR_UNOWN_REPORT_LEVEL, 7
	goto_if_ne _049E
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL_SINJOH_EVENT_2, 0, 15, 24, DIR_WEST
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	goto _0530

_049E:
	compare VAR_UNOWN_REPORT_LEVEL, 8
	goto_if_ne _04D5
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL_SINJOH_EVENT_2, 0, 15, 24, DIR_WEST
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	goto _0530

_04D5:
	compare VAR_UNOWN_REPORT_LEVEL, 9
	goto_if_ne _050C
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL_SINJOH_EVENT_2, 0, 15, 24, DIR_WEST
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	goto _0530

_050C:
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL, 0, 15, 24, DIR_WEST
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
_0530:
	releaseall
	end

	.balign 4, 0
_0534:
	Delay4
	WalkFastSouth 3
	LockDir
	WalkFasterNorth
	UnlockDir
	EndMovement

	.balign 4, 0
_054C:
	WalkFastSouth
	EndMovement

	.balign 4, 0
_0554:
	WalkOnSpotFastWest
	EmoteExclamationMark
	Delay8
	LockDir
	WalkNormalEast
	UnlockDir
	EndMovement

	.balign 4, 0
_0570:
	EmoteExclamationMark
	Delay8
	WalkNormalEast
	WalkOnSpotFastSouth
	EndMovement

	.balign 4, 0
_0584:
	WalkNormalEast
	WalkNormalWest 2
	Delay8
	WalkNormalEast 2
	WalkOnSpotFastEast
	WalkNormalWest
	WalkOnSpotFastSouth
	EndMovement

	.balign 4, 0
_05A4:
	EmoteExclamationMark
	Delay8
	WalkOnSpotFastSouth
	EndMovement

	.balign 4, 0
_05B4:
	WalkNormalWest
	WalkNormalSouth
	WalkOnSpotFastSouth
	EndMovement

	.balign 4, 0
_05C4:
	LockDir
	JumpFarSouth
	WalkFastSouth 2
	UnlockDir
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_05DC:
	LockDir
	WalkFastWest
	UnlockDir
	Delay8 2
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_05F4:
	JumpOnSpotFastWest
	Delay8 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0604:
	LockDir
	WalkFastSouth 5
	UnlockDir
	EndMovement

	.balign 4, 0
_0614:
	WalkNormalSouth 3
	WalkNormalEast
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0624:
	WalkNormalSouth 4
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0630:
	Delay8 2
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth
	EndMovement

scr_seq_D24R0101_000:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0072_D24R0101_00010, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_D24R0101_001:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0072_D24R0101_00009, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_D24R0101_002:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0072_D24R0101_00007, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_D24R0101_003:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0072_D24R0101_00008, VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0
