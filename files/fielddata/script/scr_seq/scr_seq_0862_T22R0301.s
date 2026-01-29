#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T22R0301.h"
#include "msgdata/msg/msg_0560_T22R0301.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T22R0301_000
	scrdef scr_seq_T22R0301_001
	scrdef scr_seq_T22R0301_002
	scrdef scr_seq_T22R0301_003
	scrdef scr_seq_T22R0301_004
	scrdef scr_seq_T22R0301_005
	scrdef scr_seq_T22R0301_006
	scrdef scr_seq_T22R0301_007
	scrdef_end

scr_seq_T22R0301_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _0049
	apply_movement obj_T22R0301_gsbigman, _0164
	goto _0087

_0049:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _0064
	apply_movement obj_T22R0301_gsbigman, _0188
	goto _0087

_0064:
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _007F
	apply_movement obj_T22R0301_gsbigman, _01AC
	goto _0087

_007F:
	apply_movement obj_T22R0301_gsbigman, _01D0
_0087:
	wait_movement
	npc_msg msg_0560_T22R0301_00000
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _00B0
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _00D7
	end

_00B0:
	npc_msg msg_0560_T22R0301_00001
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _00D7
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0157
	end

_00D7:
	npc_msg msg_0560_T22R0301_00002
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _00FE
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0125
	end

_00FE:
	npc_msg msg_0560_T22R0301_00003
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0125
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0157
	end

_0125:
	npc_msg msg_0560_T22R0301_00004
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _014C
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0157
	end

_014C:
	npc_msg msg_0560_T22R0301_00005
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0157:
	npc_msg msg_0560_T22R0301_00006
	wait_button_or_walk_away
	closemsg
	releaseall
	end

	.balign 4, 0
_0164:
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	EndMovement

	.balign 4, 0
_0188:
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	EndMovement

	.balign 4, 0
_01AC:
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	EndMovement

	.balign 4, 0
_01D0:
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	EndMovement

scr_seq_T22R0301_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0560_T22R0301_00012
	goto _0207
	end

_0207:
	npc_msg msg_0560_T22R0301_00013
	touchscreen_menu_hide
	menu_init 1, 1, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add 24, 255, 1
	menu_item_add 25, 255, 2
	menu_item_add 26, 255, 3
	menu_item_add 27, 255, 4
	menu_item_add 28, 255, 5
	menu_item_add 29, 255, 0
	menu_exec
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0264
	npc_msg msg_0560_T22R0301_00014
	goto _0207

_025E:
	goto _02D8

_0264:
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _0280
	npc_msg msg_0560_T22R0301_00015
	goto _0207

_027A:
	goto _02D8

_0280:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _029C
	npc_msg msg_0560_T22R0301_00016
	goto _0207

_0296:
	goto _02D8

_029C:
	compare VAR_SPECIAL_RESULT, 4
	goto_if_ne _02B8
	npc_msg msg_0560_T22R0301_00017
	goto _0207

_02B2:
	goto _02D8

_02B8:
	compare VAR_SPECIAL_RESULT, 5
	goto_if_ne _02D4
	npc_msg msg_0560_T22R0301_00018
	goto _0207

_02CE:
	goto _02D8

_02D4:
	closemsg
	releaseall

_02D8:
	end

scr_seq_T22R0301_003:
	simple_npc_msg msg_0560_T22R0301_00011
	end

scr_seq_T22R0301_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0560_T22R0301_00019
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0353
	npc_msg msg_0560_T22R0301_00020
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0353
	npc_msg msg_0560_T22R0301_00021
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0353
	npc_msg msg_0560_T22R0301_00022
	closemsg
	touchscreen_menu_show
	apply_movement obj_T22R0301_gsboy1, _035C
	wait_movement
	npc_msg msg_0560_T22R0301_00023
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0353:
	closemsg
	touchscreen_menu_show
	releaseall
	end

	.balign 4, 0
_035C:
	WalkOnSpotNormalNorth
	EndMovement

scr_seq_T22R0301_004:
	simple_npc_msg msg_0560_T22R0301_00007
	end

scr_seq_T22R0301_005:
	simple_npc_msg msg_0560_T22R0301_00010
	end

scr_seq_T22R0301_006:
	simple_npc_msg msg_0560_T22R0301_00009
	end

scr_seq_T22R0301_007:
	simple_npc_msg msg_0560_T22R0301_00008
	end
	.balign 4, 0
