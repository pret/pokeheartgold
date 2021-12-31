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
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 24
	callstd 2052
	releaseall
	end

scr_seq_T08FS0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 1
	callstd 2048
	releaseall
	end

scr_seq_T08FS0101_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0513_T08FS0101_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T08FS0101_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0513_T08FS0101_00002
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
