#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D02FS0101.h"
#include "msgdata/msg/msg_0048_D02FS0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D02FS0101_000
	scrdef scr_seq_D02FS0101_001
	scrdef_end

scr_seq_D02FS0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setflag FLAG_UNK_18A
	npc_msg msg_0048_D02FS0101_00001
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 27
	callstd std_special_mart
	clearflag FLAG_UNK_18A
	releaseall
	end

scr_seq_D02FS0101_000:
	simple_npc_msg msg_0048_D02FS0101_00000
	end
	.balign 4, 0
