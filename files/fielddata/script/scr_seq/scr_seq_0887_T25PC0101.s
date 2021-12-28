#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0887_T25PC0101_0012 ; 000
	scrdef scr_seq_0887_T25PC0101_0070 ; 001
	scrdef scr_seq_0887_T25PC0101_0047 ; 002
	scrdef scr_seq_0887_T25PC0101_001E ; 003
	scrdef_end

scr_seq_0887_T25PC0101_0012:
	setvar VAR_SPECIAL_x8007, 0
	callstd 2002
	end

scr_seq_0887_T25PC0101_001E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0887_T25PC0101_003C
	npc_msg 3
	goto scr_seq_0887_T25PC0101_003F

scr_seq_0887_T25PC0101_003C:
	npc_msg 2
scr_seq_0887_T25PC0101_003F:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0887_T25PC0101_0047:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0887_T25PC0101_0065
	npc_msg 5
	goto scr_seq_0887_T25PC0101_0068

scr_seq_0887_T25PC0101_0065:
	npc_msg 4
scr_seq_0887_T25PC0101_0068:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0887_T25PC0101_0070:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0887_T25PC0101_008E
	npc_msg 1
	goto scr_seq_0887_T25PC0101_0091

scr_seq_0887_T25PC0101_008E:
	npc_msg 0
scr_seq_0887_T25PC0101_0091:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
