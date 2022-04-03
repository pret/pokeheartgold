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
	get_party_lead_alive VAR_SPECIAL_x8000
	npc_msg msg_0585_T25R0301_00000
	mon_get_friendship VAR_SPECIAL_RESULT, VAR_SPECIAL_x8000
	compare VAR_SPECIAL_RESULT, 250
	goto_if_ge _006C
	compare VAR_SPECIAL_RESULT, 200
	goto_if_ge _0077
	compare VAR_SPECIAL_RESULT, 150
	goto_if_ge _0082
	compare VAR_SPECIAL_RESULT, 100
	goto_if_ge _008D
	compare VAR_SPECIAL_RESULT, 50
	goto_if_ge _0098
	goto _00A3
	.byte 0x02, 0x00
_006C:
	npc_msg msg_0585_T25R0301_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0077:
	npc_msg msg_0585_T25R0301_00002
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0082:
	npc_msg msg_0585_T25R0301_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_008D:
	npc_msg msg_0585_T25R0301_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0098:
	npc_msg msg_0585_T25R0301_00005
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_00A3:
	npc_msg msg_0585_T25R0301_00006
	wait_button_or_walk_away
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
