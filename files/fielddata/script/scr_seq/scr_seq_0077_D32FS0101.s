#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0077_D32FS0101_0012 ; 000
	scrdef scr_seq_0077_D32FS0101_002E ; 001
	scrdef scr_seq_0077_D32FS0101_004A ; 002
	scrdef scr_seq_0077_D32FS0101_005D ; 003
	scrdef_end

scr_seq_0077_D32FS0101_0012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 1
	callstd 2048
	releaseall
	end

scr_seq_0077_D32FS0101_002E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 12
	callstd 2052
	releaseall
	end

scr_seq_0077_D32FS0101_004A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0077_D32FS0101_005D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
