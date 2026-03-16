#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T24R0501.h"
#include "msgdata/msg/msg_0577_T24R0501.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T24R0501_000
	scrdef_end

scr_seq_T24R0501_000:
	goto_if_set FLAG_GOT_SECRETPOTION, _0024
	compare VAR_SCENE_LIGHTHOUSE_JASMINE, 1
	goto_if_eq _0051
	goto _0024

_0024:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setflag FLAG_SPECIAL_MART_PHARMACY
	npc_msg msg_0577_T24R0501_00003
	holdmsg
	setvar VAR_SPECIAL_x8004, 11
	callstd std_special_mart
	apply_movement obj_T24R0501_sunglasses, _00A8
	wait_movement
	clearflag FLAG_SPECIAL_MART_PHARMACY
	releaseall
	end

_0051:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0577_T24R0501_00000
	wait_button
	goto_if_no_item_space ITEM_SECRETPOTION, 1, _009C
	callstd std_give_item_verbose
	setflag FLAG_GOT_SECRETPOTION
	npc_msg msg_0577_T24R0501_00002
	wait_button
	closemsg
	apply_movement obj_T24R0501_sunglasses, _00A8
	wait_movement
	releaseall
	end

_009C:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

	.balign 4, 0
_00A8:
	FaceNorth
	EndMovement
	.balign 4, 0
