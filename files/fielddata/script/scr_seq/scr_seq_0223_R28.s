#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R28.h"
#include "msgdata/msg/msg_0371_R28.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R28_000
	scrdef scr_seq_R28_001
	scrdef_end

scr_seq_R28_000:
	setvar VAR_UNK_4126, 0
	end

scr_seq_R28_001:
	scrcmd_055 0, 1, 2, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
