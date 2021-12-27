#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0929_000A ; 000
	scrdef scr_seq_0929_0098 ; 001
	scrdef_end

scr_seq_0929_000A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0A3
	gotoif TRUE, scr_seq_0929_0078
	npc_msg 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0929_0044
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0929_008D
	end

scr_seq_0929_0044:
	npc_msg 1
	scrcmd_049
	setvar VAR_SPECIAL_x8004, 471
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0929_0083
	callstd 2033
	setflag FLAG_UNK_0A3
	goto scr_seq_0929_0078

scr_seq_0929_0078:
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0929_0083:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_0929_008D:
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0929_0098:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 5
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0929_00C7
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0929_00F9
	end

scr_seq_0929_00C7:
	npc_msg 6
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0929_00EE
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0929_00F9
	end

scr_seq_0929_00EE:
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0929_00F9:
	closemsg
	releaseall
	end
	.balign 4, 0
