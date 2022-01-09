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
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0552_T21PC0101_00004
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T21PC0101_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0552_T21PC0101_00005
	waitbutton
	closemsg
	releaseall
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
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T21PC0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0552_T21PC0101_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T21PC0101_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0552_T21PC0101_00001
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
