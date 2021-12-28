#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0900_T25R1002_001A ; 000
	scrdef scr_seq_0900_T25R1002_0036 ; 001
	scrdef scr_seq_0900_T25R1002_0052 ; 002
	scrdef scr_seq_0900_T25R1002_007B ; 003
	scrdef scr_seq_0900_T25R1002_00A4 ; 004
	scrdef scr_seq_0900_T25R1002_00CD ; 005
	scrdef_end

scr_seq_0900_T25R1002_001A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 3
	callstd 2052
	releaseall
	end

scr_seq_0900_T25R1002_0036:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 4
	callstd 2052
	releaseall
	end

scr_seq_0900_T25R1002_0052:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0900_T25R1002_0070
	npc_msg 1
	goto scr_seq_0900_T25R1002_0073

scr_seq_0900_T25R1002_0070:
	npc_msg 0
scr_seq_0900_T25R1002_0073:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0900_T25R1002_007B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0900_T25R1002_0099
	npc_msg 5
	goto scr_seq_0900_T25R1002_009C

scr_seq_0900_T25R1002_0099:
	npc_msg 4
scr_seq_0900_T25R1002_009C:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0900_T25R1002_00A4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0900_T25R1002_00C2
	npc_msg 3
	goto scr_seq_0900_T25R1002_00C5

scr_seq_0900_T25R1002_00C2:
	npc_msg 2
scr_seq_0900_T25R1002_00C5:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0900_T25R1002_00CD:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
