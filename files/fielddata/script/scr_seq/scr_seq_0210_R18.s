#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R18.h"
#include "msgdata/msg/msg_0358_R18.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R18_000
	scrdef scr_seq_R18_001
	scrdef_end

scr_seq_R18_000:
	goto_if_set FLAG_UNK_149, _0017
	end

_0017:
	set_bike_state_lock 1
	end

scr_seq_R18_001:
	direction_signpost msg_0358_R18_00000, 1, 1, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0
