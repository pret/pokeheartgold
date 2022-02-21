#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T22R0401.h"
#include "msgdata/msg/msg_0561_T22R0401.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T22R0401_000
	scrdef scr_seq_T22R0401_001
	scrdef scr_seq_T22R0401_002
	scrdef scr_seq_T22R0401_003
	scrdef_end

scr_seq_T22R0401_000:
	end

scr_seq_T22R0401_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_PIDGEY, 0
	npc_msg msg_0561_T22R0401_00002
	wait_cry
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T22R0401_001:
	simple_npc_msg msg_0561_T22R0401_00000
	end

scr_seq_T22R0401_002:
	simple_npc_msg msg_0561_T22R0401_00001
	end
	.balign 4, 0
