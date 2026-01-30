#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_P01R0306.h"
#include "msgdata/msg/msg_0262_P01R0306.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_P01R0306_000
	scrdef scr_seq_P01R0306_001
	scrdef scr_seq_P01R0306_002
	scrdef scr_seq_P01R0306_003
	scrdef_end

scr_seq_P01R0306_001:
	compare VAR_UNK_40CB, 7
	goto_if_ge _003C
	compare VAR_UNK_40CB, 4
	goto_if_gt _0036
	setflag FLAG_UNK_218
	goto _003A

_0036:
	clearflag FLAG_UNK_218
_003A:
	end

_003C:
	setflag FLAG_UNK_216
	setflag FLAG_UNK_218
	end

scr_seq_P01R0306_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_UNK_40CB, 3
	goto_if_gt _006E
	apply_movement obj_P01R0306_gsgentleman, _0090
	wait_movement
	npc_msg msg_0262_P01R0306_00001
	goto _0087

_006E:
	compare VAR_UNK_40CB, 4
	goto_if_ne _0084
	npc_msg msg_0262_P01R0306_00000
	goto _0087

_0084:
	npc_msg msg_0262_P01R0306_00007
_0087:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

	.balign 4, 0
_0090:
	JumpOnSpotFastSouth 2
	EndMovement

scr_seq_P01R0306_003:
	scrcmd_609
	lockall
	apply_movement obj_P01R0306_gsbabygirl1_3, _0110
	wait_movement
	gender_msgbox msg_0262_P01R0306_00002, msg_0262_P01R0306_00003
	closemsg
	apply_movement obj_P01R0306_gsgentleman, _0118
	wait_movement
	buffer_players_name 0
	gender_msgbox msg_0262_P01R0306_00004, msg_0262_P01R0306_00005
	goto_if_no_item_space ITEM_METAL_COAT, 1, _0103
	callstd std_give_item_verbose
_00E2:
	setvar VAR_UNK_40CB, 6
	setflag FLAG_UNK_22A
	play_se SEQ_SE_DP_PINPON
	wait_se SEQ_SE_DP_PINPON
	setflag FLAG_BOAT_ARRIVED
	npc_msg msg_0262_P01R0306_00006
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0103:
	callstd std_bag_is_full
	closemsg
	goto _00E2

	.balign 4, 0
_0110:
	JumpOnSpotFastEast 3
	EndMovement

	.balign 4, 0
_0118:
	WalkSlowSouth
	EndMovement

scr_seq_P01R0306_002:
	simple_npc_msg msg_0262_P01R0306_00008
	end
	.balign 4, 0
