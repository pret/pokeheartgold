#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D23R0105.h"
#include "msgdata/msg/msg_0069_D23R0105.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D23R0105_000
	scrdef scr_seq_D23R0105_001
	scrdef scr_seq_D23R0105_002
	scrdef scr_seq_D23R0105_003
	scrdef_end

scr_seq_D23R0105_000:
	setflag FLAG_HIDE_ROCKET_TAKEOVER_1
	setvar VAR_UNK_4125, 0
	compare VAR_SCENE_ROCKET_TAKEOVER, 4
	goto_if_ne _002D
	clearflag FLAG_HIDE_ROCKET_TAKEOVER_1
_002D:
	end

scr_seq_D23R0105_001:
	simple_npc_msg msg_0069_D23R0105_00007
	end

scr_seq_D23R0105_003:
	simple_npc_msg msg_0069_D23R0105_00008
	end

scr_seq_D23R0105_002:
	compare VAR_SCENE_ROCKET_TAKEOVER, 4
	goto_if_eq _0075
	simple_npc_msg msg_0069_D23R0105_00006
	end

_0075:
	getitemquantity ITEM_BASEMENT_KEY, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _022B
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0069_D23R0105_00000
	closemsg
	wait 16, VAR_SPECIAL_RESULT
	get_player_facing VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 0
	goto_if_ne _00B8
	apply_movement obj_D23R0105_gsgentleman, _0258
	goto _00DB

_00B8:
	compare VAR_TEMP_x4000, 2
	goto_if_ne _00D3
	apply_movement obj_D23R0105_gsgentleman, _024C
	goto _00DB

_00D3:
	apply_movement obj_D23R0105_gsgentleman, _0240
_00DB:
	wait_movement
	compare VAR_TEMP_x4000, 3
	goto_if_ne _00F8
	apply_movement obj_D23R0105_gsgentleman, _0264
	goto _010D

_00F8:
	compare VAR_TEMP_x4000, 2
	goto_if_ne _010D
	apply_movement obj_D23R0105_gsgentleman, _0274
_010D:
	wait_movement
	npc_msg msg_0069_D23R0105_00001
	closemsg
	compare VAR_TEMP_x4000, 3
	goto_if_ne _012F
	apply_movement obj_D23R0105_gsgentleman, _0284
	goto _0144

_012F:
	compare VAR_TEMP_x4000, 2
	goto_if_ne _0144
	apply_movement obj_D23R0105_gsgentleman, _028C
_0144:
	wait_movement
	buffer_players_name 0
	npc_msg msg_0069_D23R0105_00002
	compare VAR_TEMP_x4000, 0
	goto_if_ne _0167
	apply_movement obj_D23R0105_gsgentleman, _02B0
	goto _018A

_0167:
	compare VAR_TEMP_x4000, 2
	goto_if_ne _0182
	apply_movement obj_D23R0105_gsgentleman, _0294
	goto _018A

_0182:
	apply_movement obj_D23R0105_gsgentleman, _02C8
_018A:
	wait_movement
	setflag FLAG_HIDE_RADIO_TOWER_5F_OFFICE_DIRECTOR
	clearflag FLAG_HIDE_RADIO_TOWER_5F_PETREL_REVEALED
	show_person obj_D23R0105_rkanbum2
	hide_person obj_D23R0105_gsgentleman
	compare VAR_TEMP_x4000, 0
	goto_if_ne _01B7
	apply_movement obj_D23R0105_rkanbum2, _0328
	goto _01DA

_01B7:
	compare VAR_TEMP_x4000, 2
	goto_if_ne _01D2
	apply_movement obj_D23R0105_rkanbum2, _0310
	goto _01DA

_01D2:
	apply_movement obj_D23R0105_rkanbum2, _0344
_01DA:
	wait_movement
	npc_msg msg_0069_D23R0105_00003
	closemsg
	trainer_battle TRAINER_EXECUTIVE_PETREL_PETREL, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _021D
	npc_msg msg_0069_D23R0105_00004
	setvar VAR_SPECIAL_x8004, ITEM_BASEMENT_KEY
	setvar VAR_SPECIAL_x8005, 1
	callstd std_obtain_item_verbose
	closemsg
	releaseall
	setvar VAR_UNK_40E7, 2
	clearflag FLAG_HIDE_UNDERGROUND_KIMONO_GIRL
	end

_021D:
	white_out
	clearflag FLAG_HIDE_RADIO_TOWER_5F_OFFICE_DIRECTOR
	setflag FLAG_HIDE_RADIO_TOWER_5F_PETREL_REVEALED
	releaseall
	end

_022B:
	simple_npc_msg msg_0069_D23R0105_00005
	end

	.balign 4, 0
_0240:
	FaceWest
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_024C:
	FaceEast
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0258:
	FaceSouth
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0264:
	LockDir
	WalkFastEast
	UnlockDir
	EndMovement

	.balign 4, 0
_0274:
	LockDir
	WalkFastWest
	UnlockDir
	EndMovement

	.balign 4, 0
_0284:
	WalkFastWest
	EndMovement

	.balign 4, 0
_028C:
	WalkFastEast
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
_02EC:
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
_0310:
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	EndMovement

	.balign 4, 0
_0328:
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	EndMovement

	.balign 4, 0
_0344:
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	EndMovement
	.balign 4, 0
