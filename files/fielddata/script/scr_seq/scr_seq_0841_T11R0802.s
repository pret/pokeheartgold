#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T11R0802.h"
#include "msgdata/msg/msg_0541_T11R0802.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T11R0802_000
	scrdef scr_seq_T11R0802_001
	scrdef scr_seq_T11R0802_002
	scrdef scr_seq_T11R0802_003
	scrdef scr_seq_T11R0802_004
	scrdef scr_seq_T11R0802_005
	scrdef scr_seq_T11R0802_006
	scrdef_end

scr_seq_T11R0802_004:
	get_player_gender VAR_TEMP_x4009
	compare VAR_TEMP_x4009, 0
	goto_if_ne _003B
	setvar VAR_OBJ_0, 0
	goto _0041

_003B:
	setvar VAR_OBJ_0, 97
_0041:
	end

scr_seq_T11R0802_005:
	compare VAR_TEMP_x400B, 0
	goto_if_ne _005A
	hide_person obj_T11R0802_var_1
	setvar VAR_TEMP_x400B, 1
_005A:
	end

scr_seq_T11R0802_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	getitemquantity ITEM_PASS, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0125
	getitemquantity ITEM_LOST_ITEM, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _00E9
	goto_if_set FLAG_RESTORED_POWER, _00BD
	call _014D
	buffer_players_name 0
	gender_msgbox msg_0541_T11R0802_00000, msg_0541_T11R0802_00001
	closemsg
	call _01DB
	npc_msg msg_0541_T11R0802_00002
	closemsg
	apply_movement obj_T11R0802_gsgirl1, _026C
	wait_movement
	releaseall
	end

_00BD:
	setflag FLAG_UNK_119
	call _014D
	buffer_players_name 0
	gender_msgbox msg_0541_T11R0802_00003, msg_0541_T11R0802_00004
	closemsg
	call _01DB
	npc_msg msg_0541_T11R0802_00005
	closemsg
	apply_movement obj_T11R0802_gsgirl1, _026C
	wait_movement
	releaseall
	end

_00E9:
	takeitem ITEM_LOST_ITEM, 1, VAR_SPECIAL_RESULT
	npc_msg msg_0541_T11R0802_00006
	clearflag FLAG_HIDE_SAFFRON_CITY_COPYCAT_HOUSE_CLEFAIRY_DOLL
	show_person obj_T11R0802_mono_pip
	giveitem_no_check ITEM_PASS, 1
	npc_msg msg_0541_T11R0802_00008
	wait_button_or_walk_away
	closemsg
	releaseall
	setflag FLAG_UNK_087
	setflag FLAG_UNK_998
	setvar VAR_UNK_40FF, 2
	end

_0125:
	call _014D
	buffer_players_name 0
	gender_msgbox msg_0541_T11R0802_00009, msg_0541_T11R0802_00010
	closemsg
	call _01DB
	npc_msg msg_0541_T11R0802_00011
	closemsg
	apply_movement obj_T11R0802_gsgirl1, _026C
	wait_movement
	releaseall
	end

_014D:
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _016C
	apply_movement obj_T11R0802_gsgirl1, _02B0
	goto _018F

_016C:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0187
	apply_movement obj_T11R0802_gsgirl1, _0274
	goto _018F

_0187:
	apply_movement obj_T11R0802_gsgirl1, _0294
_018F:
	wait_movement
	show_person obj_T11R0802_var_1
	hide_person obj_T11R0802_gsgirl1
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _01B4
	apply_movement obj_T11R0802_var_1, _0304
	goto _01D7

_01B4:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _01CF
	apply_movement obj_T11R0802_var_1, _02C8
	goto _01D7

_01CF:
	apply_movement obj_T11R0802_var_1, _02EC
_01D7:
	wait_movement
	return

_01DB:
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _01FA
	apply_movement obj_T11R0802_var_1, _02B0
	goto _021D

_01FA:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0215
	apply_movement obj_T11R0802_var_1, _0274
	goto _021D

_0215:
	apply_movement obj_T11R0802_var_1, _0294
_021D:
	wait_movement
	show_person obj_T11R0802_gsgirl1
	hide_person obj_T11R0802_var_1
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0242
	apply_movement obj_T11R0802_gsgirl1, _0304
	goto _0265

_0242:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _025D
	apply_movement obj_T11R0802_gsgirl1, _02C8
	goto _0265

_025D:
	apply_movement obj_T11R0802_gsgirl1, _02EC
_0265:
	wait_movement
	return

	.balign 4, 0
_026C:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0274:
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	EndMovement

	.balign 4, 0
_0294:
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	EndMovement

	.balign 4, 0
_02B0:
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	EndMovement

	.balign 4, 0
_02C8:
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	EndMovement

	.balign 4, 0
_02EC:
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	EndMovement

	.balign 4, 0
_0304:
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	EndMovement

scr_seq_T11R0802_003:
	compare VAR_TEMP_x400A, 0
	goto_if_ne _03A3
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0541_T11R0802_00012
	wait_button_or_walk_away
	closemsg
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0359
	apply_movement obj_T11R0802_jupetta, _03C8
	goto _0397

_0359:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0374
	apply_movement obj_T11R0802_jupetta, _03C0
	goto _0397

_0374:
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _038F
	apply_movement obj_T11R0802_jupetta, _03D8
	goto _0397

_038F:
	apply_movement obj_T11R0802_jupetta, _03D0
_0397:
	wait_movement
	setvar VAR_TEMP_x400A, 1
	releaseall
	end

_03A3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_BANETTE, 0
	npc_msg msg_0541_T11R0802_00013
	wait_cry
	wait_button_or_walk_away
	closemsg
	releaseall
	end

	.balign 4, 0
_03C0:
	FaceNorth
	EndMovement

	.balign 4, 0
_03C8:
	FaceSouth
	EndMovement

	.balign 4, 0
_03D0:
	FaceWest
	EndMovement

	.balign 4, 0
_03D8:
	FaceEast
	EndMovement

scr_seq_T11R0802_001:
	simple_npc_msg msg_0541_T11R0802_00015
	end

scr_seq_T11R0802_002:
	simple_npc_msg msg_0541_T11R0802_00014
	end

scr_seq_T11R0802_006:
	goto_if_set FLAG_HIDE_SAFFRON_CITY_COPYCAT_HOUSE_CLEFAIRY_DOLL, _0431
	compare VAR_UNK_40FF, 2
	goto_if_eq _0433
	simple_npc_msg msg_0541_T11R0802_00016
	end

_0431:
	end

_0433:
	simple_npc_msg msg_0541_T11R0802_00017
	end
	.balign 4, 0
