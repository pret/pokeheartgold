#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R28R0101.h"
#include "msgdata/msg/msg_0372_R28R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R28R0101_000
	scrdef scr_seq_R28R0101_001
	scrdef scr_seq_R28R0101_002
	scrdef_end

scr_seq_R28R0101_002:
	apply_movement obj_R28R0101_gsgirl1, _0020
	wait_movement
	setvar VAR_UNK_4126, 1
	end


_0020:
	step 1, 1
	step 75, 1
	step_end
scr_seq_R28R0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_137
	gotoif TRUE, _012A
	faceplayer
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _0060
	apply_movement obj_R28R0101_gsgirl1, _0140
	goto _009E

_0060:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, _007B
	apply_movement obj_R28R0101_gsgirl1, _014C
	goto _009E

_007B:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, _0096
	apply_movement obj_R28R0101_gsgirl1, _0158
	goto _009E

_0096:
	apply_movement obj_R28R0101_gsgirl1, _0164
_009E:
	wait_movement
	npc_msg msg_0372_R28R0101_00000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _00BE
	apply_movement obj_R28R0101_gsgirl1, _0164
	goto _00FC

_00BE:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, _00D9
	apply_movement obj_R28R0101_gsgirl1, _0158
	goto _00FC

_00D9:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, _00F4
	apply_movement obj_R28R0101_gsgirl1, _014C
	goto _00FC

_00F4:
	apply_movement obj_R28R0101_gsgirl1, _0140
_00FC:
	wait_movement
	npc_msg msg_0372_R28R0101_00001
	setvar VAR_SPECIAL_x8004, 374
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0135
	callstd std_give_item_verbose
	setflag FLAG_UNK_137
_012A:
	npc_msg msg_0372_R28R0101_00002
	waitbutton
	closemsg
	releaseall
	end

_0135:
	callstd std_bag_is_full
	closemsg
	releaseall
	end
	.byte 0x00

_0140:
	step 63, 1
	step 32, 1
	step_end

_014C:
	step 63, 1
	step 34, 1
	step_end

_0158:
	step 63, 1
	step 35, 1
	step_end

_0164:
	step 63, 1
	step 33, 1
	step_end
scr_seq_R28R0101_001:
	scrcmd_076 22, 0
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0372_R28R0101_00003
	waitbutton
	closemsg
	releaseall
	scrcmd_077
	end
	.balign 4, 0
