#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R09.h"
#include "msgdata/msg/msg_0340_R09.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R09_000
	scrdef_end

scr_seq_R09_000:
	scrcmd_055 0, 1, 1, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
