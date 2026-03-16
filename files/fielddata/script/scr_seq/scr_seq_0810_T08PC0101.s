#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T08PC0101.h"
#include "msgdata/msg/msg_0515_T08PC0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T08PC0101_000
	scrdef scr_seq_T08PC0101_001
	scrdef scr_seq_T08PC0101_002
	scrdef scr_seq_T08PC0101_003
	scrdef_end

scr_seq_T08PC0101_000:
	setvar VAR_SPECIAL_x8007, 0
	callstd std_nurse_joy
	end

scr_seq_T08PC0101_001:
	simple_npc_msg msg_0515_T08PC0101_00000
	end

scr_seq_T08PC0101_002:
	simple_npc_msg msg_0515_T08PC0101_00001
	end

scr_seq_T08PC0101_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0515_T08PC0101_00002
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _006E
	apply_movement obj_T08PC0101_gsgirl1, _009C
	goto _0091

_006E:
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _0089
	apply_movement obj_T08PC0101_gsgirl1, _00C0
	goto _0091

_0089:
	apply_movement obj_T08PC0101_gsgirl1, _00E4
_0091:
	npc_msg msg_0515_T08PC0101_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end

	.balign 4, 0
_009C:
	FaceEast
	FaceNorth
	FaceWest
	FaceSouth
	FaceEast
	FaceNorth
	FaceWest
	FaceSouth
	EndMovement

	.balign 4, 0
_00C0:
	FaceNorth
	FaceWest
	FaceSouth
	FaceEast
	FaceNorth
	FaceWest
	FaceSouth
	FaceEast
	EndMovement

	.balign 4, 0
_00E4:
	FaceSouth
	FaceEast
	FaceNorth
	FaceWest
	FaceSouth
	FaceEast
	FaceNorth
	FaceWest
	EndMovement
	.balign 4, 0
