#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0908_T25R1202_0036 ; 000
	scrdef scr_seq_0908_T25R1202_0049 ; 001
	scrdef scr_seq_0908_T25R1202_005C ; 002
	scrdef scr_seq_0908_T25R1202_006F ; 003
	scrdef scr_seq_0908_T25R1202_0082 ; 004
	scrdef scr_seq_0908_T25R1202_0095 ; 005
	scrdef scr_seq_0908_T25R1202_00A8 ; 006
	scrdef scr_seq_0908_T25R1202_00BB ; 007
	scrdef scr_seq_0908_T25R1202_00CE ; 008
	scrdef scr_seq_0908_T25R1202_00E1 ; 009
	scrdef scr_seq_0908_T25R1202_00F2 ; 010
	scrdef scr_seq_0908_T25R1202_0103 ; 011
	scrdef scr_seq_0908_T25R1202_019E ; 012
	scrdef_end

scr_seq_0908_T25R1202_0036:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0908_T25R1202_0049:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0908_T25R1202_005C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0908_T25R1202_006F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0908_T25R1202_0082:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0908_T25R1202_0095:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0908_T25R1202_00A8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0908_T25R1202_00BB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0908_T25R1202_00CE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0908_T25R1202_00E1:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0908_T25R1202_00F2:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0908_T25R1202_0103:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8005, 6
	goto scr_seq_0908_T25R1202_0117

scr_seq_0908_T25R1202_0115:
	.byte 0x02, 0x00
scr_seq_0908_T25R1202_0117:
	npc_msg 13
	scrcmd_746
	scrcmd_750 21, 11, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 15, 255, 0
	scrcmd_751 16, 255, 1
	scrcmd_751 17, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0908_T25R1202_016E
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0908_T25R1202_0193
	goto scr_seq_0908_T25R1202_0166

scr_seq_0908_T25R1202_0164:
	.byte 0x02, 0x00
scr_seq_0908_T25R1202_0166:
	scrcmd_747
scr_seq_0908_T25R1202_0168:
	closemsg
	releaseall
	end

scr_seq_0908_T25R1202_016E:
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0908_T25R1202_0168
	closemsg
	scrcmd_815 0
	callstd 2046
	releaseall
	end

scr_seq_0908_T25R1202_0193:
	npc_msg 14
	goto scr_seq_0908_T25R1202_0117

scr_seq_0908_T25R1202_019C:
	.byte 0x02, 0x00
scr_seq_0908_T25R1202_019E:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8005, 5
	goto scr_seq_0908_T25R1202_01B2

scr_seq_0908_T25R1202_01B0:
	.byte 0x02, 0x00
scr_seq_0908_T25R1202_01B2:
	npc_msg 11
	scrcmd_746
	scrcmd_750 21, 11, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 15, 255, 0
	scrcmd_751 16, 255, 1
	scrcmd_751 17, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0908_T25R1202_0209
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0908_T25R1202_022E
	goto scr_seq_0908_T25R1202_0201

scr_seq_0908_T25R1202_01FF:
	.byte 0x02
	.byte 0x00
scr_seq_0908_T25R1202_0201:
	scrcmd_747
scr_seq_0908_T25R1202_0203:
	closemsg
	releaseall
	end

scr_seq_0908_T25R1202_0209:
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0908_T25R1202_0203
	closemsg
	scrcmd_815 0
	callstd 2046
	releaseall
	end

scr_seq_0908_T25R1202_022E:
	npc_msg 12
	goto scr_seq_0908_T25R1202_01B2

scr_seq_0908_T25R1202_0237:
	.byte 0x02, 0x00, 0x00, 0x00, 0x00
	.balign 4, 0
