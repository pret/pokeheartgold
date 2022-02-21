#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T21PC0101.h"
#include "msgdata/msg/msg_0552_T21PC0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T21PC0101_000
	scrdef scr_seq_T21PC0101_001
	scrdef scr_seq_T21PC0101_002
	scrdef scr_seq_T21PC0101_003
	scrdef scr_seq_T21PC0101_004
	scrdef scr_seq_T21PC0101_005
	scrdef_end

scr_seq_T21PC0101_000:
	setvar VAR_SPECIAL_x8007, 0
	callstd std_nurse_joy
	end

scr_seq_T21PC0101_004:
	simple_npc_msg msg_0552_T21PC0101_00004
	end

scr_seq_T21PC0101_005:
	simple_npc_msg msg_0552_T21PC0101_00005
	end

scr_seq_T21PC0101_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_SCENE_ELMS_LAB, 3
	goto_if_lt _006A
	npc_msg msg_0552_T21PC0101_00003
	goto _006D

_006A:
	npc_msg msg_0552_T21PC0101_00002
_006D:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T21PC0101_001:
	simple_npc_msg msg_0552_T21PC0101_00000
	end

scr_seq_T21PC0101_002:
	simple_npc_msg msg_0552_T21PC0101_00001
	end
	.balign 4, 0
