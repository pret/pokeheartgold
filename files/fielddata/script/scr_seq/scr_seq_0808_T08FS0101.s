#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T08FS0101.h"
#include "msgdata/msg/msg_0513_T08FS0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T08FS0101_000
	scrdef scr_seq_T08FS0101_001
	scrdef scr_seq_T08FS0101_002
	scrdef scr_seq_T08FS0101_003
	scrdef_end

scr_seq_T08FS0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd std_mart_intro
	holdmsg
	setvar VAR_SPECIAL_x8004, 24
	callstd std_special_mart
	releaseall
	end

scr_seq_T08FS0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd std_mart_intro
	holdmsg
	setvar VAR_SPECIAL_x8004, 1
	callstd std_pokemart
	releaseall
	end

scr_seq_T08FS0101_002:
	simple_npc_msg msg_0513_T08FS0101_00000
	end

scr_seq_T08FS0101_003:
	simple_npc_msg msg_0513_T08FS0101_00002
	end
	.balign 4, 0
