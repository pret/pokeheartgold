#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R14.h"
#include "msgdata/msg/msg_0351_R14.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R14_000
	scrdef scr_seq_R14_001
	scrdef scr_seq_R14_002
	scrdef scr_seq_R14_003
	scrdef scr_seq_R14_004
	scrdef scr_seq_R14_005
	scrdef_end

scr_seq_R14_001:
	goto_if_unset FLAG_UNK_189, _002B
	clearflag FLAG_UNK_189
	end

_002B:
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 4
	goto_if_eq _004F
	compare VAR_TEMP_x4000, 0
	goto_if_eq _004F
	setflag FLAG_HIDE_CAMERON
	end

_004F:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_R14_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _017D
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0191
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _00CE
	apply_movement obj_player, _01A8
	apply_movement obj_R14_gsmiddleman1_3, _01F4
	goto _011C

_00CE:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _00E9
	apply_movement obj_player, _01C0
	goto _011C

_00E9:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _010C
	apply_movement obj_player, _01E0
	apply_movement obj_R14_gsmiddleman1_3, _01F4
	goto _011C

_010C:
	apply_movement obj_player, _01CC
	apply_movement obj_R14_gsmiddleman1_3, _01F4
_011C:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0143
	apply_movement obj_partner_poke, _0200
	wait_movement
_0143:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 60
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

_017D:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 5
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0191:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 3
	wait_button_or_walk_away
	closemsg
	releaseall
	end

	.balign 4, 0
_01A8:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01C0:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01CC:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01E0:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01F4:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0200:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_R14_002:
	scrcmd_609
	lockall
	clearflag FLAG_HIDE_ROUTE_14_EUSINE
	show_person obj_R14_minaki
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4000, 1358
	goto_if_ne _024F
	apply_movement obj_player, _0450
	wait_movement
	goto _027C

_0249:
	goto _0255

_024F:
	goto _0255

_0255:
	compare VAR_TEMP_x4001, 409
	goto_if_ne _0272
	apply_movement obj_player, _0450
	wait_movement
	goto _027C

_0272:
	apply_movement obj_player, _0450
	wait_movement
_027C:
	play_cry SPECIES_SUICUNE, 0
	release obj_R14_tsure_poke_static_suicune
	scrcmd_523 obj_R14_tsure_poke_static_suicune, 2, 90, 2, 0
	lock obj_R14_tsure_poke_static_suicune
	wait_cry
	compare VAR_TEMP_x4000, 1358
	goto_if_ne _02B1
	goto _02D0

_02AB:
	goto _02D0

_02B1:
	compare VAR_TEMP_x4000, 1359
	goto_if_ne _02CA
	goto _0382

_02C4:
	goto _02D0

_02CA:
	goto _03AD

_02D0:
	compare VAR_TEMP_x4001, 409
	goto_if_ne _02EB
	apply_movement obj_player, _04AC
	goto _037A

_02EB:
	compare VAR_TEMP_x4001, 410
	goto_if_ne _0306
	apply_movement obj_player, _04C0
	goto _037A

_0306:
	compare VAR_TEMP_x4001, 411
	goto_if_ne _0321
	apply_movement obj_player, _04D0
	goto _037A

_0321:
	compare VAR_TEMP_x4001, 412
	goto_if_ne _033C
	apply_movement obj_player, _04E0
	goto _037A

_033C:
	compare VAR_TEMP_x4001, 413
	goto_if_ne _0357
	apply_movement obj_player, _04E8
	goto _037A

_0357:
	compare VAR_TEMP_x4001, 414
	goto_if_ne _0372
	apply_movement obj_player, _04F8
	goto _037A

_0372:
	apply_movement obj_player, _0508
_037A:
	wait_movement
	goto _03D2

_0382:
	compare VAR_TEMP_x4001, 409
	goto_if_ne _039D
	apply_movement obj_player, _051C
	goto _03A5

_039D:
	apply_movement obj_player, _0530
_03A5:
	wait_movement
	goto _03D2

_03AD:
	compare VAR_TEMP_x4001, 409
	goto_if_ne _03C8
	apply_movement obj_player, _0544
	goto _03D0

_03C8:
	apply_movement obj_player, _0550
_03D0:
	wait_movement
_03D2:
	apply_movement obj_R14_tsure_poke_static_suicune, _0488
	apply_movement obj_player, _055C
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	callstd std_play_eusine_music
	apply_movement obj_R14_minaki, _057C
	apply_movement obj_player, _056C
	wait_movement
	buffer_players_name 0
	npc_msg msg_0351_R14_00006
	wait_button_or_walk_away
	closemsg
	callstd std_fade_end_eusine_music
	hide_person obj_R14_tsure_poke_static_suicune
	setflag FLAG_HIDE_ROUTE_14_SUICUNE
	setflag FLAG_HIDE_ROUTE_14_EUSINE
	clearflag FLAG_HIDE_ROUTE_14_EUSINE_2
	setvar VAR_UNK_4086, 0
	setflag FLAG_UNK_14D
	check_badge BADGE_CASCADE, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0449
	clearflag FLAG_HIDE_ROUTE_25_SUICUNE
	setvar VAR_SCENE_ROUTE_25, 1
_0449:
	releaseall
	end

	.balign 4, 0
_0450:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0458:
	Delay4
	FaceWest
	EndMovement

	.balign 4, 0
_0464:
	Delay4
	FaceNorth
	EndMovement

	.balign 4, 0
_0470:
	Delay4
	FaceSouth
	EndMovement

	.balign 4, 0
_047C:
	JumpFartherEast
	FaceWest
	EndMovement

	.balign 4, 0
_0488:
	WalkFasterNorth 2
	JumpNearFastNorth
	JumpFarNorth
	WalkFasterNorth 2
	JumpNearFastNorth
	JumpFarNorth 2
	WalkFasterNorth 2
	JumpNearFastNorth
	EndMovement

	.balign 4, 0
_04AC:
	WalkNormalSouth
	WalkNormalEast 3
	WalkNormalSouth 2
	FaceEast
	EndMovement

	.balign 4, 0
_04C0:
	WalkNormalEast 3
	WalkNormalSouth 2
	FaceEast
	EndMovement

	.balign 4, 0
_04D0:
	WalkNormalEast 3
	WalkNormalSouth
	FaceEast
	EndMovement

	.balign 4, 0
_04E0:
	WalkNormalEast 3
	EndMovement

	.balign 4, 0
_04E8:
	WalkNormalEast 3
	WalkNormalNorth
	FaceEast
	EndMovement

	.balign 4, 0
_04F8:
	WalkNormalEast 3
	WalkNormalNorth 2
	FaceEast
	EndMovement

	.balign 4, 0
_0508:
	WalkNormalNorth
	WalkNormalEast 3
	WalkNormalNorth 2
	FaceEast
	EndMovement

	.balign 4, 0
_051C:
	WalkNormalSouth
	WalkNormalEast 2
	WalkNormalSouth 2
	FaceEast
	EndMovement

	.balign 4, 0
_0530:
	WalkNormalNorth
	WalkNormalEast 2
	WalkNormalNorth 2
	FaceEast
	EndMovement

	.balign 4, 0
_0544:
	WalkNormalSouth 3
	FaceEast
	EndMovement

	.balign 4, 0
_0550:
	WalkNormalNorth 3
	FaceEast
	EndMovement

	.balign 4, 0
_055C:
	Delay8
	FaceNorth
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_056C:
	Delay16 5
	FaceWest
	EndMovement

	.balign 4, 0
_0578:
	EndMovement

	.balign 4, 0
_057C:
	WalkFastNorth 11
	WalkNormalNorth 2
	WalkSlowerNorth
	Delay8 3
	WalkSlowSouth
	FaceEast
	EndMovement

scr_seq_R14_003:
	buffer_players_name 0
	simple_npc_msg msg_0351_R14_00007
	end

scr_seq_R14_004:
	buffer_players_name 0
	simple_npc_msg msg_0351_R14_00007
	end

scr_seq_R14_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_GOT_LUCKY_PUNCH_FROM_ROUTE_14_WOMAN, _0658
	npc_msg msg_0351_R14_00000
	player_on_bike_check VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0602
	get_party_lead_alive VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 113
	goto_if_eq _060D
_0602:
	npc_msg msg_0351_R14_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_060D:
	apply_movement obj_R14_gswoman1, _0698
	wait_movement
	npc_msg msg_0351_R14_00002
	goto_if_no_item_space ITEM_LUCKY_PUNCH, 1, _064E
	callstd std_give_item_verbose
	setflag FLAG_GOT_LUCKY_PUNCH_FROM_ROUTE_14_WOMAN
	npc_msg msg_0351_R14_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_064E:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

_0658:
	player_on_bike_check VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0680
	get_party_lead_alive VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 113
	goto_if_eq _068B
_0680:
	npc_msg msg_0351_R14_00005
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_068B:
	npc_msg msg_0351_R14_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	end

	.balign 4, 0
_0698:
	EmoteExclamationMark
	Delay4
	EndMovement
	.balign 4, 0
