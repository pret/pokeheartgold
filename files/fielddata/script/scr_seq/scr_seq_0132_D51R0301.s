#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D51R0301.h"
#include "msgdata/msg/msg_0147_D51R0301.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D51R0301_000
	scrdef scr_seq_D51R0301_001
	scrdef scr_seq_D51R0301_002
	scrdef scr_seq_D51R0301_003
	scrdef_end

scr_seq_D51R0301_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_09E, _002E
	npc_msg msg_0147_D51R0301_00000
	closemsg
	setflag FLAG_UNK_09E
_002E:
	player_has_species VAR_SPECIAL_RESULT, SPECIES_ARCEUS
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _004C
	npc_msg msg_0147_D51R0301_00002
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_004C:
	apply_movement obj_D51R0301_champion, _0188
	wait_movement
	npc_msg msg_0147_D51R0301_00001
	closemsg
	get_player_facing VAR_TEMP_x4002
	compare VAR_TEMP_x4002, 0
	goto_if_ne _0078
	goto _0107

_0072:
	goto _0097

_0078:
	compare VAR_TEMP_x4002, 1
	goto_if_ne _0091
	goto _00CF

_008B:
	goto _0097

_0091:
	goto _0097

_0097:
	apply_movement obj_D51R0301_champion, _0194
	wait_movement
	apply_movement obj_D51R0301_champion, _01A0
	wait_movement
	npc_msg msg_0147_D51R0301_00003
	closemsg
	apply_movement obj_D51R0301_champion, _01A8
	wait_movement
	npc_msg msg_0147_D51R0301_00004
	closemsg
	apply_movement obj_D51R0301_champion, _01B4
	wait_movement
	goto _0167

_00CF:
	apply_movement obj_D51R0301_champion, _01C4
	wait_movement
	apply_movement obj_D51R0301_champion, _01D0
	wait_movement
	npc_msg msg_0147_D51R0301_00003
	closemsg
	apply_movement obj_D51R0301_champion, _01D8
	wait_movement
	npc_msg msg_0147_D51R0301_00004
	closemsg
	apply_movement obj_D51R0301_champion, _01E0
	wait_movement
	goto _0167

_0107:
	apply_movement obj_D51R0301_champion, _01F0
	wait_movement
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_player, _01FC
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	apply_movement obj_D51R0301_champion, _0204
	wait_movement
	npc_msg msg_0147_D51R0301_00003
	closemsg
	apply_movement obj_D51R0301_champion, _020C
	wait_movement
	apply_movement obj_player, _022C
	wait_movement
	npc_msg msg_0147_D51R0301_00004
	closemsg
	apply_movement obj_D51R0301_champion, _021C
	wait_movement
	goto _0167

_0167:
	play_se SEQ_SE_DP_KAIDAN2
	setflag FLAG_UNK_2DD
	hide_person obj_D51R0301_champion
	clearflag FLAG_HIDE_SINJOH_MYSTRI_SHRINE_CYNTHIA
	wait_se SEQ_SE_DP_KAIDAN2
	setvar VAR_SCENE_SINJOH_MYSTRI_ROOM, 7
	releaseall
	end

	.balign 4, 0
_0188:
	EmoteExclamationMark
	Delay8
	EndMovement

	.balign 4, 0
_0194:
	WalkOnSpotNormalNorth
	WalkSlowNorth 2
	EndMovement

	.balign 4, 0
_01A0:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01A8:
	WalkNormalSouth 2
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_01B4:
	WalkNormalSouth 2
	WalkNormalWest 4
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01C4:
	WalkOnSpotNormalSouth
	WalkSlowSouth
	EndMovement

	.balign 4, 0
_01D0:
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_01D8:
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_01E0:
	WalkNormalSouth 2
	WalkNormalWest 4
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01F0:
	WalkOnSpotNormalNorth
	WalkSlowNorth 2
	EndMovement

	.balign 4, 0
_01FC:
	WalkSlowNorth
	EndMovement

	.balign 4, 0
_0204:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_020C:
	WalkNormalEast
	WalkNormalSouth 2
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_021C:
	WalkNormalSouth 2
	WalkNormalWest 5
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_022C:
	WalkOnSpotNormalEast
	EndMovement

scr_seq_D51R0301_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_SCENE_SINJOH_MYSTRI_ROOM, 13
	goto_if_ge _026E
	goto_if_set FLAG_UNK_09D, _0263
	npc_msg msg_0147_D51R0301_00007
	wait_button_or_walk_away
	closemsg
	setflag FLAG_UNK_09D
	releaseall
	end

_0263:
	npc_msg msg_0147_D51R0301_00008
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_026E:
	npc_msg msg_0147_D51R0301_00009
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D51R0301_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0147_D51R0301_00010
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _02A6
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ge _030C
_02A6:
	npc_msg msg_0147_D51R0301_00011
	closemsg
	play_se SEQ_SE_DP_TELE
	apply_movement obj_player, _0318
	wait_movement
	compare VAR_SCENE_SINJOH_MYSTRI_ROOM, 13
	goto_if_ne _02D2
	setvar VAR_SCENE_SINJOH_MYSTRI_ROOM, 10
	goto _02E4

_02D2:
	setvar VAR_SCENE_SINJOH_MYSTRI_ROOM, 1
	setflag FLAG_HIDE_SINJOH_MYSTRI_SHRINE_CYNTHIA
	clearflag FLAG_UNK_2DD
	clearflag FLAG_UNK_2DB
_02E4:
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_NEW_BARK, 0, 695, 397, DIR_SOUTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

_030C:
	npc_msg msg_0147_D51R0301_00012
	wait_button_or_walk_away
	closemsg
	releaseall
	end

	.balign 4, 0
_0318:
	FaceEast
	Delay4
	FaceSouth
	Delay4
	FaceWest
	Delay4
	FaceNorth
	Delay4
	FaceEast
	Delay2
	FaceSouth
	Delay2
	FaceWest
	Delay2
	FaceNorth
	Delay2
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	EndMovement

scr_seq_D51R0301_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_ABRA, 0
	npc_msg msg_0147_D51R0301_00013
	wait_cry
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
