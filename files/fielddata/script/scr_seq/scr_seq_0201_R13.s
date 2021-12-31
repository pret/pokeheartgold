#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R13.h"
#include "msgdata/msg/msg_0350_R13.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R13_000
	scrdef scr_seq_R13_001
	scrdef scr_seq_R13_002
	scrdef_end

scr_seq_R13_000:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 0, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_R13_001:
	scrcmd_055 1, 1, 10, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_R13_002:
	scrcmd_055 2, 1, 14, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
