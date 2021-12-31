#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R16.h"
#include "msgdata/msg/msg_0354_R16.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R16_000
	scrdef scr_seq_R16_001
	scrdef_end

scr_seq_R16_000:
	scrcmd_186 1
	setflag FLAG_UNK_149
	end

scr_seq_R16_001:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 0, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
