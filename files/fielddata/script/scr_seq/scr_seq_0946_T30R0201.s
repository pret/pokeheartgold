#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T30R0201.h"
#include "msgdata/msg/msg_0633_T30R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T30R0201_000
	scrdef scr_seq_T30R0201_001
	scrdef_end

scr_seq_T30R0201_000:
	simple_npc_msg msg_0633_T30R0201_00000
	end

scr_seq_T30R0201_001:
	play_cry SPECIES_DRATINI, 0
	simple_npc_msg msg_0633_T30R0201_00002
	wait_cry
	end
	.balign 4, 0
