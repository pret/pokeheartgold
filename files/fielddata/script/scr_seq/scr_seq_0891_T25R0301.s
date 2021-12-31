#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R0301.h"
#include "msgdata/msg/msg_0585_T25R0301.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T25R0301_000
	scrdef scr_seq_T25R0301_001
	scrdef scr_seq_T25R0301_002
	scrdef_end

scr_seq_T25R0301_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_lead_mon_index VAR_SPECIAL_x8000
	npc_msg msg_0585_T25R0301_00000
	scrcmd_382 VAR_SPECIAL_x800C, VAR_SPECIAL_x8000
	comparevartovalue VAR_SPECIAL_x800C, 250
	gotoif ge, _006C
	comparevartovalue VAR_SPECIAL_x800C, 200
	gotoif ge, _0077
	comparevartovalue VAR_SPECIAL_x800C, 150
	gotoif ge, _0082
	comparevartovalue VAR_SPECIAL_x800C, 100
	gotoif ge, _008D
	comparevartovalue VAR_SPECIAL_x800C, 50
	gotoif ge, _0098
	goto _00A3
	.byte 0x02, 0x00
_006C:
	npc_msg msg_0585_T25R0301_00001
	waitbutton
	closemsg
	releaseall
	end

_0077:
	npc_msg msg_0585_T25R0301_00002
	waitbutton
	closemsg
	releaseall
	end

_0082:
	npc_msg msg_0585_T25R0301_00003
	waitbutton
	closemsg
	releaseall
	end

_008D:
	npc_msg msg_0585_T25R0301_00004
	waitbutton
	closemsg
	releaseall
	end

_0098:
	npc_msg msg_0585_T25R0301_00005
	waitbutton
	closemsg
	releaseall
	end

_00A3:
	npc_msg msg_0585_T25R0301_00006
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R0301_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0585_T25R0301_00007
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R0301_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0585_T25R0301_00008
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
