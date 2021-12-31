#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25PC0101.h"
#include "msgdata/msg/msg_0583_T25PC0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T25PC0101_000
	scrdef scr_seq_T25PC0101_001
	scrdef scr_seq_T25PC0101_002
	scrdef scr_seq_T25PC0101_003
	scrdef_end

scr_seq_T25PC0101_000:
	setvar VAR_SPECIAL_x8007, 0
	callstd std_nurse_joy
	end

scr_seq_T25PC0101_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, _003C
	npc_msg msg_0583_T25PC0101_00003
	goto _003F

_003C:
	npc_msg msg_0583_T25PC0101_00002
_003F:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25PC0101_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, _0065
	npc_msg msg_0583_T25PC0101_00005
	goto _0068

_0065:
	npc_msg msg_0583_T25PC0101_00004
_0068:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25PC0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, _008E
	npc_msg msg_0583_T25PC0101_00001
	goto _0091

_008E:
	npc_msg msg_0583_T25PC0101_00000
_0091:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
