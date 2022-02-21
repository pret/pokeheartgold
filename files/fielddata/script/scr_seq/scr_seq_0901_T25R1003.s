#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R1003.h"
#include "msgdata/msg/msg_0594_T25R1003.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T25R1003_000
	scrdef scr_seq_T25R1003_001
	scrdef scr_seq_T25R1003_002
	scrdef scr_seq_T25R1003_003
	scrdef_end

scr_seq_T25R1003_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd std_mart_intro
	holdmsg
	setvar VAR_SPECIAL_x8004, 5
	callstd std_special_mart
	releaseall
	end

scr_seq_T25R1003_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_SCENE_ROCKET_TAKEOVER, 3
	goto_if_ne _004C
	npc_msg msg_0594_T25R1003_00001
	goto _004F

_004C:
	npc_msg msg_0594_T25R1003_00000
_004F:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T25R1003_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_SCENE_ROCKET_TAKEOVER, 3
	goto_if_ne _0075
	npc_msg msg_0594_T25R1003_00003
	goto _0078

_0075:
	npc_msg msg_0594_T25R1003_00002
_0078:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T25R1003_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0594_T25R1003_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
