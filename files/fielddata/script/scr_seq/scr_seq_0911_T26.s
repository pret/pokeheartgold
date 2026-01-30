#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T26.h"
#include "msgdata/msg/msg_0604_T26.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T26_000
	scrdef scr_seq_T26_001
	scrdef scr_seq_T26_002
	scrdef scr_seq_T26_003
	scrdef scr_seq_T26_004
	scrdef scr_seq_T26_005
	scrdef scr_seq_T26_006
	scrdef scr_seq_T26_007
	scrdef scr_seq_T26_008
	scrdef scr_seq_T26_009
	scrdef scr_seq_T26_010
	scrdef scr_seq_T26_011
	scrdef scr_seq_T26_012
	scrdef_end

scr_seq_T26_002:
	setvar VAR_SCENE_ROCKET_TAKEOVER, 2
	setflag FLAG_UNK_0C5
	setflag FLAG_ROCKET_TAKEOVER_ACTIVE
	compare VAR_UNK_40F8, 0
	goto_if_ne _0057
	setvar VAR_UNK_40F8, 2
_0057:
	phone_call PHONE_CONTACT_PROF__ELM, 2, 2
	setvar VAR_MIDGAME_BADGES, 5
	end

scr_seq_T26_003:
	setflag FLAG_UNK_0F5
	setvar VAR_UNK_4057, 1
	phone_call PHONE_CONTACT_BAOBA, 2, 0
	setflag FLAG_UNK_249
	setvar VAR_SCENE_LIGHTHOUSE_JASMINE, 3
	end

scr_seq_T26_012:
	goto_if_unset FLAG_UNK_189, _00B2
	clearflag FLAG_UNK_189
	end

_00B2:
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 1
	goto_if_ne _00CD
	clearflag FLAG_HIDE_CAMERON
	goto _00E8

_00CD:
	compare VAR_TEMP_x4000, 2
	goto_if_ne _00E4
	clearflag FLAG_HIDE_CAMERON
	goto _00E8

_00E4:
	setflag FLAG_HIDE_CAMERON
_00E8:
	end

	.balign 4, 0
_00EC:
	EmoteExclamationMark
	EndMovement

scr_seq_T26_000:
	end

scr_seq_T26_001:
	scrcmd_609
	lockall
	fade_out_bgm 0, 3
	scrcmd_307 8, 7, 13, 14, 77
	scrcmd_310 77
	scrcmd_308 77
	clearflag FLAG_HIDE_OLIVINE_RIVAL
	show_person obj_T26_gsrivel
	apply_movement obj_T26_gsrivel, _02B4
	wait_movement
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	apply_movement obj_player, _02C0
	wait_movement
	callstd std_play_rival_intro_music
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 239
	goto_if_ne _015B
	apply_movement obj_T26_gsrivel, _02CC
	goto _01C1

_015B:
	compare VAR_TEMP_x4001, 240
	goto_if_ne _0176
	apply_movement obj_T26_gsrivel, _02DC
	goto _01C1

_0176:
	compare VAR_TEMP_x4001, 241
	goto_if_ne _0191
	apply_movement obj_T26_gsrivel, _02F0
	goto _01C1

_0191:
	compare VAR_TEMP_x4001, 242
	goto_if_ne _01AC
	apply_movement obj_T26_gsrivel, _0304
	goto _01C1

_01AC:
	compare VAR_TEMP_x4001, 243
	goto_if_ne _01C1
	apply_movement obj_T26_gsrivel, _0318
_01C1:
	wait_movement
	buffer_rivals_name 0
	npc_msg msg_0604_T26_00000
	closemsg
	compare VAR_TEMP_x4001, 239
	goto_if_ne _01F6
	apply_movement obj_T26_gsrivel, _032C
	apply_movement obj_player, _037C
	apply_movement obj_partner_poke, _03C4
	goto _029C

_01F6:
	compare VAR_TEMP_x4001, 240
	goto_if_ne _0221
	apply_movement obj_T26_gsrivel, _033C
	apply_movement obj_player, _037C
	apply_movement obj_partner_poke, _03C4
	goto _029C

_0221:
	compare VAR_TEMP_x4001, 241
	goto_if_ne _024C
	apply_movement obj_T26_gsrivel, _034C
	apply_movement obj_player, _037C
	apply_movement obj_partner_poke, _03C4
	goto _029C

_024C:
	compare VAR_TEMP_x4001, 242
	goto_if_ne _0277
	apply_movement obj_T26_gsrivel, _035C
	apply_movement obj_player, _037C
	apply_movement obj_partner_poke, _03C4
	goto _029C

_0277:
	compare VAR_TEMP_x4001, 243
	goto_if_ne _029C
	apply_movement obj_T26_gsrivel, _036C
	apply_movement obj_player, _03A0
	apply_movement obj_partner_poke, _03E0
_029C:
	wait_movement
	setvar VAR_UNK_4078, 1
	hide_person obj_T26_gsrivel
	setflag FLAG_HIDE_OLIVINE_RIVAL
	callstd std_fade_end_rival_intro_music
	releaseall
	end

	.balign 4, 0
_02B4:
	WalkNormalSouth
	Delay15
	EndMovement

	.balign 4, 0
_02C0:
	EmoteExclamationMark
	Delay8
	EndMovement

	.balign 4, 0
_02CC:
	FaceSouth 2
	WalkNormalEast 2
	Delay15
	EndMovement

	.balign 4, 0
_02DC:
	WalkNormalSouth
	FaceSouth 2
	WalkNormalEast 2
	Delay15
	EndMovement

	.balign 4, 0
_02F0:
	WalkNormalSouth 2
	FaceSouth 2
	WalkNormalEast 2
	Delay15
	EndMovement

	.balign 4, 0
_0304:
	WalkNormalSouth 3
	FaceSouth 2
	WalkNormalEast 2
	Delay15
	EndMovement

	.balign 4, 0
_0318:
	WalkNormalSouth 4
	FaceSouth 2
	WalkNormalEast 2
	Delay15
	EndMovement

	.balign 4, 0
_032C:
	WalkNormalEast 6
	FaceNorth 2
	WalkNormalNorth 10
	EndMovement

	.balign 4, 0
_033C:
	WalkNormalEast 6
	FaceNorth 2
	WalkNormalNorth 11
	EndMovement

	.balign 4, 0
_034C:
	WalkNormalEast 6
	FaceNorth 2
	WalkNormalNorth 12
	EndMovement

	.balign 4, 0
_035C:
	WalkNormalEast 6
	FaceNorth 2
	WalkNormalNorth 13
	EndMovement

	.balign 4, 0
_036C:
	WalkNormalEast 6
	FaceNorth 2
	WalkNormalNorth 14
	EndMovement

	.balign 4, 0
_037C:
	FaceNorth 2
	LockDir
	WalkSlightlyFastSouth
	UnlockDir
	Delay15
	WalkOnSpotNormalEast
	Delay15
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_03A0:
	FaceSouth 2
	LockDir
	WalkSlightlyFastNorth
	UnlockDir
	Delay15
	WalkOnSpotNormalEast
	Delay15
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_03C4:
	FaceNorth 2
	LockDir
	WalkSlightlyFastSouth
	UnlockDir
	Delay32 2
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_03E0:
	FaceSouth 2
	LockDir
	WalkSlightlyFastNorth
	UnlockDir
	EndMovement

scr_seq_T26_011:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _051C
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0530
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _046D
	apply_movement obj_player, _0544
	apply_movement obj_T26_gsmiddleman1, _0590
	goto _04BB

_046D:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0488
	apply_movement obj_player, _055C
	goto _04BB

_0488:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _04AB
	apply_movement obj_player, _057C
	apply_movement obj_T26_gsmiddleman1, _0590
	goto _04BB

_04AB:
	apply_movement obj_player, _0568
	apply_movement obj_T26_gsmiddleman1, _0590
_04BB:
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _04E2
	apply_movement obj_partner_poke, _059C
	wait_movement
_04E2:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 23
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

_051C:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 5
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0530:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 3
	wait_button_or_walk_away
	closemsg
	releaseall
	end

	.balign 4, 0
_0544:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_055C:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0568:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_057C:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0590:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_059C:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_T26_004:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0604_T26_00007, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T26_005:
	direction_signpost msg_0604_T26_00005, 0, 17, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T26_006:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0604_T26_00006, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T26_007:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0604_T26_00008, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_T26_008:
	simple_npc_msg msg_0604_T26_00001
	end

scr_seq_T26_009:
	simple_npc_msg msg_0604_T26_00002
	end

scr_seq_T26_010:
	simple_npc_msg msg_0604_T26_00004
	end
	.balign 4, 0
