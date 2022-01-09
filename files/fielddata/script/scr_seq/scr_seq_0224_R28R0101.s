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
	goto_if_set FLAG_UNK_137, _012A
	faceplayer
	get_player_facing VAR_SPECIAL_x800C
	compare VAR_SPECIAL_x800C, 0
	goto_if_ne _0060
	apply_movement obj_R28R0101_gsgirl1, _0140
	goto _009E

_0060:
	compare VAR_SPECIAL_x800C, 2
	goto_if_ne _007B
	apply_movement obj_R28R0101_gsgirl1, _014C
	goto _009E

_007B:
	compare VAR_SPECIAL_x800C, 3
	goto_if_ne _0096
	apply_movement obj_R28R0101_gsgirl1, _0158
	goto _009E

_0096:
	apply_movement obj_R28R0101_gsgirl1, _0164
_009E:
	wait_movement
	npc_msg msg_0372_R28R0101_00000
	compare VAR_SPECIAL_x800C, 0
	goto_if_ne _00BE
	apply_movement obj_R28R0101_gsgirl1, _0164
	goto _00FC

_00BE:
	compare VAR_SPECIAL_x800C, 2
	goto_if_ne _00D9
	apply_movement obj_R28R0101_gsgirl1, _0158
	goto _00FC

_00D9:
	compare VAR_SPECIAL_x800C, 3
	goto_if_ne _00F4
	apply_movement obj_R28R0101_gsgirl1, _014C
	goto _00FC

_00F4:
	apply_movement obj_R28R0101_gsgirl1, _0140
_00FC:
	wait_movement
	npc_msg msg_0372_R28R0101_00001
	goto_if_no_item_space ITEM_TM47, 1, _0135
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
	play_cry SPECIES_FEAROW, 0
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0372_R28R0101_00003
	waitbutton
	closemsg
	releaseall
	wait_cry
	end
	.balign 4, 0
