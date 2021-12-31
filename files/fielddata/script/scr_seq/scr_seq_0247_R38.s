#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R38.h"
#include "msgdata/msg/msg_0394_R38.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R38_000
	scrdef scr_seq_R38_001
	scrdef scr_seq_R38_002
	scrdef_end

scr_seq_R38_000:
	end

scr_seq_R38_001:
	scrcmd_055 15, 1, 8, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_R38_002:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 16, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
