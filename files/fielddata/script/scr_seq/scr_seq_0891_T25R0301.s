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
	compare VAR_SPECIAL_x800C, 250
	goto_if_ge _006C
	compare VAR_SPECIAL_x800C, 200
	goto_if_ge _0077
	compare VAR_SPECIAL_x800C, 150
	goto_if_ge _0082
	compare VAR_SPECIAL_x800C, 100
	goto_if_ge _008D
	compare VAR_SPECIAL_x800C, 50
	goto_if_ge _0098
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
	simple_npc_msg msg_0585_T25R0301_00007
	end

scr_seq_T25R0301_002:
	simple_npc_msg msg_0585_T25R0301_00008
	end
	.balign 4, 0
