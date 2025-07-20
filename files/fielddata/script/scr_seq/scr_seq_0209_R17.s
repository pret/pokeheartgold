#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R17.h"
#include "msgdata/msg/msg_0357_R17.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R17_000
	scrdef scr_seq_R17_001
	scrdef_end

scr_seq_R17_000:
	set_bike_state_lock 1
	end

scr_seq_R17_001:
	set_bike_state_lock 1
	end
	.balign 4, 0
