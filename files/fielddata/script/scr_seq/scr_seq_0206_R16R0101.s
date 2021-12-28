#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0206_R16R0101_0089 ; 000
	scrdef scr_seq_0206_R16R0101_000A ; 001
	scrdef_end

scr_seq_0206_R16R0101_000A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_ABA
	gotoif TRUE, scr_seq_0206_R16R0101_0068
	scrcmd_540 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0206_R16R0101_007E
	npc_msg 1
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0206_R16R0101_0073
	scrcmd_538 32780, 0
	comparevartovalue VAR_SPECIAL_x800C, 65535
	gotoif eq, scr_seq_0206_R16R0101_007E
	setflag FLAG_UNK_ABA
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0206_R16R0101_0068:
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0206_R16R0101_0073:
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0206_R16R0101_007E:
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0206_R16R0101_0089:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
