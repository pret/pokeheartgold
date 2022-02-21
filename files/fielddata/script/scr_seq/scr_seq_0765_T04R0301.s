#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T04R0301.h"
#include "msgdata/msg/msg_0473_T04R0301.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T04R0301_000
	scrdef scr_seq_T04R0301_001
	scrdef scr_seq_T04R0301_002
	scrdef scr_seq_T04R0301_003
	scrdef_end

scr_seq_T04R0301_000:
	simple_npc_msg msg_0473_T04R0301_00000
	end

scr_seq_T04R0301_001:
	simple_npc_msg msg_0473_T04R0301_00001
	end

scr_seq_T04R0301_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_KANGASKHAN, 0
	npc_msg msg_0473_T04R0301_00002
	wait_cry
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T04R0301_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_ZUBAT, 0
	npc_msg msg_0473_T04R0301_00003
	wait_cry
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
