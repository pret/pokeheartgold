#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T24R0501.h"
#include "msgdata/msg/msg_0577_T24R0501.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T24R0501_000
	scrdef_end

scr_seq_T24R0501_000:
	checkflag FLAG_UNK_0B9
	gotoif TRUE, _0024
	comparevartovalue VAR_UNK_40A5, 1
	gotoif eq, _0051
	goto _0024

_0024:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setflag FLAG_UNK_16F
	npc_msg msg_0577_T24R0501_00003
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 11
	callstd 2052
	apply_movement obj_T24R0501_sunglasses, _00A8
	wait_movement
	clearflag FLAG_UNK_16F
	releaseall
	end

_0051:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0577_T24R0501_00000
	scrcmd_049
	setvar VAR_SPECIAL_x8004, 464
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _009C
	callstd std_give_item_verbose
	setflag FLAG_UNK_0B9
	npc_msg msg_0577_T24R0501_00002
	scrcmd_049
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
	.byte 0x00, 0x00

_00A8:
	step 0, 1
	step_end
	.balign 4, 0
