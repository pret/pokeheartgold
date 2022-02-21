#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07R0201.h"
#include "msgdata/msg/msg_0501_T07R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T07R0201_000
	scrdef scr_seq_T07R0201_001
	scrdef scr_seq_T07R0201_002
	scrdef scr_seq_T07R0201_003
	scrdef scr_seq_T07R0201_004
	scrdef scr_seq_T07R0201_005
	scrdef_end

scr_seq_T07R0201_005:
	setvar VAR_UNK_4125, 0
	end

scr_seq_T07R0201_000:
	simple_npc_msg msg_0501_T07R0201_00000
	end

scr_seq_T07R0201_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_MEOWTH, 0
	npc_msg msg_0501_T07R0201_00001
	wait_cry
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T07R0201_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_CLEFAIRY, 0
	npc_msg msg_0501_T07R0201_00002
	wait_cry
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T07R0201_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_NIDORAN_F, 0
	npc_msg msg_0501_T07R0201_00003
	wait_cry
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T07R0201_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0501_T07R0201_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
