#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R44.h"
#include "msgdata/msg/msg_0404_R44.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R44_000
	scrdef scr_seq_R44_001
	scrdef scr_seq_R44_002
	scrdef_end

scr_seq_R44_000:
	end

scr_seq_R44_001:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 0, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_R44_002:
	scrcmd_055 1, 1, 1, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
