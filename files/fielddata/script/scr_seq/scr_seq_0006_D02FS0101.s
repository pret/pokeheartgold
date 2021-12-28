#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0006_D02FS0101_002D ; 000
	scrdef scr_seq_0006_D02FS0101_000A ; 001
	scrdef_end

scr_seq_0006_D02FS0101_000A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setflag FLAG_UNK_18A
	npc_msg 1
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 27
	callstd 2052
	clearflag FLAG_UNK_18A
	releaseall
	end

scr_seq_0006_D02FS0101_002D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
