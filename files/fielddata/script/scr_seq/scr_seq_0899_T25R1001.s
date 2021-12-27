#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0899_0016 ; 000
	scrdef scr_seq_0899_0029 ; 001
	scrdef scr_seq_0899_0052 ; 002
	scrdef scr_seq_0899_007B ; 003
	scrdef scr_seq_0899_00A4 ; 004
	scrdef_end

scr_seq_0899_0016:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0899_0029:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0899_0047
	npc_msg 2
	goto scr_seq_0899_004A

scr_seq_0899_0047:
	npc_msg 1
scr_seq_0899_004A:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0899_0052:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0899_0070
	npc_msg 4
	goto scr_seq_0899_0073

scr_seq_0899_0070:
	npc_msg 3
scr_seq_0899_0073:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0899_007B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0899_0099
	npc_msg 6
	goto scr_seq_0899_009C

scr_seq_0899_0099:
	npc_msg 5
scr_seq_0899_009C:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0899_00A4:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
