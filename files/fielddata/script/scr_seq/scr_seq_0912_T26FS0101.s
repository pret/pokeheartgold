#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T26FS0101.h"
#include "msgdata/msg/msg_0605_T26FS0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T26FS0101_000
	scrdef scr_seq_T26FS0101_001
	scrdef scr_seq_T26FS0101_002
	scrdef scr_seq_T26FS0101_003
	scrdef_end

scr_seq_T26FS0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd std_mart_intro
	holdmsg
	setvar VAR_SPECIAL_x8004, 1
	callstd std_pokemart
	releaseall
	end

scr_seq_T26FS0101_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd std_mart_intro
	holdmsg
	setvar VAR_SPECIAL_x8004, 10
	callstd std_special_mart
	releaseall
	end

scr_seq_T26FS0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0605_T26FS0101_00000
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T26FS0101_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0605_T26FS0101_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
