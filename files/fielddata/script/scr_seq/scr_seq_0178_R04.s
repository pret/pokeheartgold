#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R04.h"
#include "msgdata/msg/msg_0328_R04.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R04_000
	scrdef_end

scr_seq_R04_000:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 0, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
