#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R1002.h"
#include "msgdata/msg/msg_0593_T25R1002.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T25R1002_000
	scrdef scr_seq_T25R1002_001
	scrdef scr_seq_T25R1002_002
	scrdef scr_seq_T25R1002_003
	scrdef scr_seq_T25R1002_004
	scrdef scr_seq_T25R1002_005
	scrdef_end

scr_seq_T25R1002_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd std_mart_intro
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 3
	callstd std_special_mart
	releaseall
	end

scr_seq_T25R1002_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd std_mart_intro
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 4
	callstd std_special_mart
	releaseall
	end

scr_seq_T25R1002_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, _0070
	npc_msg msg_0593_T25R1002_00001
	goto _0073

_0070:
	npc_msg msg_0593_T25R1002_00000
_0073:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R1002_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, _0099
	npc_msg msg_0593_T25R1002_00005
	goto _009C

_0099:
	npc_msg msg_0593_T25R1002_00004
_009C:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R1002_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, _00C2
	npc_msg msg_0593_T25R1002_00003
	goto _00C5

_00C2:
	npc_msg msg_0593_T25R1002_00002
_00C5:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R1002_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0593_T25R1002_00006
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
