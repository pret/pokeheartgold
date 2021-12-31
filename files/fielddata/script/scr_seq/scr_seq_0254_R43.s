#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R43.h"
#include "msgdata/msg/msg_0401_R43.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R43_000
	scrdef scr_seq_R43_001
	scrdef scr_seq_R43_002
	scrdef scr_seq_R43_003
	scrdef_end

scr_seq_R43_000:
	end

scr_seq_R43_001:
	scrcmd_055 18, 1, 3, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_R43_002:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 19, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_R43_003:
	scrcmd_055 20, 1, 6, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
