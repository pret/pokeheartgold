#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T08R0601.h"
#include "msgdata/msg/msg_0518_T08R0601.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T08R0601_000
	scrdef scr_seq_T08R0601_001
	scrdef scr_seq_T08R0601_002
	scrdef scr_seq_T08R0601_003
	scrdef_end

scr_seq_T08R0601_000:
	simple_npc_msg msg_0518_T08R0601_00000
	end

scr_seq_T08R0601_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_AIPOM, 0
	npc_msg msg_0518_T08R0601_00001
	wait_cry
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T08R0601_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_AIPOM, 0
	npc_msg msg_0518_T08R0601_00002
	wait_cry
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T08R0601_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_AIPOM, 0
	npc_msg msg_0518_T08R0601_00003
	wait_cry
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
