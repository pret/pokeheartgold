#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T11R0801.h"
#include "msgdata/msg/msg_0540_T11R0801.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T11R0801_000
	scrdef scr_seq_T11R0801_001
	scrdef scr_seq_T11R0801_002
	scrdef_end

scr_seq_T11R0801_000:
	simple_npc_msg msg_0540_T11R0801_00000
	end

scr_seq_T11R0801_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_RESTORED_POWER, _003F
	npc_msg msg_0540_T11R0801_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_003F:
	npc_msg msg_0540_T11R0801_00002
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T11R0801_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_BLISSEY, 0
	npc_msg msg_0540_T11R0801_00003
	wait_cry
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
