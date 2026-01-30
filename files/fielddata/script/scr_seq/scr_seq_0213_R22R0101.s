#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R22R0101.h"
#include "msgdata/msg/msg_0361_R22R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R22R0101_000
	scrdef scr_seq_R22R0101_001
	scrdef scr_seq_R22R0101_002
	scrdef scr_seq_R22R0101_003
	scrdef scr_seq_R22R0101_004
	scrdef scr_seq_R22R0101_005
	scrdef scr_seq_R22R0101_006
	scrdef scr_seq_R22R0101_007
	scrdef scr_seq_R22R0101_008
	scrdef_end

scr_seq_R22R0101_006:
	goto_if_unset FLAG_UNLOCKED_WEST_KANTO, _003D
	move_person_facing obj_R22R0101_policeman_3, 15, 0, 8, DIR_SOUTH
_003D:
	goto_if_unset FLAG_UNLOCKED_MT_SILVER, _0054
	move_person_facing obj_R22R0101_policeman_2, 7, 0, 8, DIR_SOUTH
_0054:
	end

scr_seq_R22R0101_007:
	setflag FLAG_SYS_FLYPOINT_VICTORY_ROAD
	goto_if_unset FLAG_UNK_189, _006B
	clearflag FLAG_UNK_189
	end

_006B:
	check_registered_phone_number PHONE_CONTACT_JANINE, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 1
	goto_if_eq _00DF
	check_badge BADGE_SOUL, VAR_TEMP_x4002
	compare VAR_TEMP_x4002, 0
	goto_if_ne _009D
	goto _012C

_0097:
	goto _00A3

_009D:
	goto _00A5

_00A3:
	end

_00A5:
	scrcmd_522 VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 16
	goto_if_ne _00C0
	clearflag FLAG_UNK_270
	goto _00DD

_00C0:
	compare VAR_TEMP_x4000, 17
	goto_if_ne _00D7
	clearflag FLAG_UNK_270
	goto _00DD

_00D7:
	goto _012C

_00DD:
	end

_00DF:
	get_phone_book_rematch PHONE_CONTACT_JANINE, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 0
	goto_if_ne _012C
	scrcmd_522 VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 18
	goto_if_ne _010D
	clearflag FLAG_UNK_270
	goto _012A

_010D:
	compare VAR_TEMP_x4000, 19
	goto_if_ne _0124
	clearflag FLAG_UNK_270
	goto _012A

_0124:
	goto _012C

_012A:
	end

_012C:
	setflag FLAG_UNK_270
	end

scr_seq_R22R0101_000:
	scrcmd_609
	lockall
	apply_movement obj_R22R0101_policeman, _015C
	wait_movement
	apply_movement obj_player, _0164
	wait_movement
	npc_msg msg_0361_R22R0101_00000
	wait_button_or_walk_away
	closemsg
	setvar VAR_UNK_4110, 1
	releaseall
	end

	.balign 4, 0
_015C:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0164:
	WalkOnSpotNormalWest
	EndMovement

scr_seq_R22R0101_003:
	simple_npc_msg msg_0361_R22R0101_00000
	end

scr_seq_R22R0101_001:
	scrcmd_609
	lockall
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 8
	goto_if_ne _01A4
	apply_movement obj_R22R0101_policeman_3, _0264
	goto _01AC

_01A4:
	apply_movement obj_R22R0101_policeman_3, _0270
_01AC:
	wait_movement
	compare VAR_TEMP_x4001, 8
	goto_if_ne _01C9
	apply_movement obj_R22R0101_policeman_3, _027C
	goto _01EC

_01C9:
	compare VAR_TEMP_x4001, 10
	goto_if_ne _01E4
	apply_movement obj_R22R0101_policeman_3, _028C
	goto _01EC

_01E4:
	apply_movement obj_R22R0101_policeman_3, _029C
_01EC:
	wait_movement
	npc_msg msg_0361_R22R0101_00005
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 56
	apply_movement obj_R22R0101_policeman_3, _02AC
	apply_movement obj_player, _02B4
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	wait 16, VAR_SPECIAL_RESULT
	compare VAR_TEMP_x4001, 8
	goto_if_ne _023A
	apply_movement obj_R22R0101_policeman_3, _02C4
	goto _025D

_023A:
	compare VAR_TEMP_x4001, 10
	goto_if_ne _0255
	apply_movement obj_R22R0101_policeman_3, _02D0
	goto _025D

_0255:
	apply_movement obj_R22R0101_policeman_3, _02DC
_025D:
	wait_movement
	releaseall
	end

	.balign 4, 0
_0264:
	WalkOnSpotNormalNorth
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0270:
	WalkOnSpotNormalSouth
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_027C:
	WalkFastEast
	WalkFastNorth
	WalkOnSpotFastWest
	EndMovement

	.balign 4, 0
_028C:
	WalkFastEast
	WalkFastSouth
	WalkOnSpotFastWest
	EndMovement

	.balign 4, 0
_029C:
	WalkFastEast
	WalkFastSouth 2
	WalkOnSpotFastWest
	EndMovement

	.balign 4, 0
_02AC:
	WalkNormalWest
	EndMovement

	.balign 4, 0
_02B4:
	LockDir
	WalkNormalWest
	UnlockDir
	EndMovement

	.balign 4, 0
_02C4:
	WalkNormalSouth
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_02D0:
	WalkNormalNorth
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_02DC:
	WalkNormalNorth 2
	WalkOnSpotNormalWest
	EndMovement

scr_seq_R22R0101_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNLOCKED_WEST_KANTO, _0306
	npc_msg msg_0361_R22R0101_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0306:
	npc_msg msg_0361_R22R0101_00006
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_R22R0101_002:
	scrcmd_609
	lockall
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 8
	goto_if_ne _0336
	apply_movement obj_R22R0101_policeman_2, _03F8
	goto _033E

_0336:
	apply_movement obj_R22R0101_policeman_2, _0404
_033E:
	wait_movement
	compare VAR_TEMP_x4001, 8
	goto_if_ne _035B
	apply_movement obj_R22R0101_policeman_2, _0410
	goto _037E

_035B:
	compare VAR_TEMP_x4001, 10
	goto_if_ne _0376
	apply_movement obj_R22R0101_policeman_2, _0420
	goto _037E

_0376:
	apply_movement obj_R22R0101_policeman_2, _0430
_037E:
	wait_movement
	npc_msg msg_0361_R22R0101_00002
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 56
	apply_movement obj_R22R0101_policeman_2, _0440
	apply_movement obj_player, _0448
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	wait 16, VAR_SPECIAL_RESULT
	compare VAR_TEMP_x4001, 8
	goto_if_ne _03CC
	apply_movement obj_R22R0101_policeman_2, _0458
	goto _03EF

_03CC:
	compare VAR_TEMP_x4001, 10
	goto_if_ne _03E7
	apply_movement obj_R22R0101_policeman_2, _0464
	goto _03EF

_03E7:
	apply_movement obj_R22R0101_policeman_2, _0470
_03EF:
	wait_movement
	releaseall
	end

	.balign 4, 0
_03F8:
	WalkOnSpotNormalNorth
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0404:
	WalkOnSpotNormalSouth
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0410:
	WalkFastWest
	WalkFastNorth
	WalkOnSpotFastEast
	EndMovement

	.balign 4, 0
_0420:
	WalkFastWest
	WalkFastSouth
	WalkOnSpotFastEast
	EndMovement

	.balign 4, 0
_0430:
	WalkFastWest
	WalkFastSouth 2
	WalkOnSpotFastEast
	EndMovement

	.balign 4, 0
_0440:
	WalkNormalEast
	EndMovement

	.balign 4, 0
_0448:
	LockDir
	WalkNormalEast
	UnlockDir
	EndMovement

	.balign 4, 0
_0458:
	WalkNormalSouth
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0464:
	WalkNormalNorth
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0470:
	WalkNormalNorth 2
	WalkOnSpotNormalEast
	EndMovement

scr_seq_R22R0101_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNLOCKED_MT_SILVER, _049A
	npc_msg msg_0361_R22R0101_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_049A:
	npc_msg msg_0361_R22R0101_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_R22R0101_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_registered_phone_number PHONE_CONTACT_JANINE, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 1
	goto_if_eq _0553
	compare VAR_TEMP_x4005, 1
	goto_if_ge _0548
	npc_msg msg_0361_R22R0101_00007
_04D0:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _04F4
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ge _0537
	end

_04F4:
	buffer_players_name 0
	npc_msg msg_0361_R22R0101_00008
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	register_gear_number PHONE_CONTACT_JANINE
	npc_msg msg_0361_R22R0101_00009
	wait_button_or_walk_away
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	setflag FLAG_UNK_270
	hide_person obj_R22R0101_gsleader13
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

_0537:
	setvar VAR_TEMP_x4005, 1
	npc_msg msg_0361_R22R0101_00010
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0548:
	npc_msg msg_0361_R22R0101_00011
	goto _04D0
	end

_0553:
	npc_msg msg_0361_R22R0101_00012
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _05B4
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _05BF
	npc_msg msg_0361_R22R0101_00013
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 70
	faceplayer
	lockall
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	clearflag FLAG_UNK_189
	npc_msg msg_0361_R22R0101_00014
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_05B4:
	npc_msg msg_0361_R22R0101_00015
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_05BF:
	npc_msg msg_0361_R22R0101_00016
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
