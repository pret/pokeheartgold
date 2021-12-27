#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0909_0032 ; 000
	scrdef scr_seq_0909_0045 ; 001
	scrdef scr_seq_0909_0058 ; 002
	scrdef scr_seq_0909_006B ; 003
	scrdef scr_seq_0909_007E ; 004
	scrdef scr_seq_0909_0091 ; 005
	scrdef scr_seq_0909_00A4 ; 006
	scrdef scr_seq_0909_00B7 ; 007
	scrdef scr_seq_0909_00CA ; 008
	scrdef scr_seq_0909_00DD ; 009
	scrdef scr_seq_0909_00EE ; 010
	scrdef scr_seq_0909_00FF ; 011
	scrdef_end

scr_seq_0909_0032:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0909_0045:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0909_0058:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0909_006B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0909_007E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0909_0091:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0909_00A4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0909_00B7:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0909_00CA:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0909_00DD:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0909_00EE:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0909_00FF:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_0909_0113

scr_seq_0909_0111:
	.byte 0x02, 0x00
scr_seq_0909_0113:
	npc_msg 11
	scrcmd_746
	scrcmd_750 21, 11, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 13, 255, 0
	scrcmd_751 14, 255, 1
	scrcmd_751 15, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0909_016A
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0909_018F
	goto scr_seq_0909_0162

scr_seq_0909_0160:
	.byte 0x02, 0x00
scr_seq_0909_0162:
	scrcmd_747
scr_seq_0909_0164:
	closemsg
	releaseall
	end

scr_seq_0909_016A:
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0909_0164
	closemsg
	scrcmd_815 0
	callstd 2046
	releaseall
	end

scr_seq_0909_018F:
	npc_msg 12
	goto scr_seq_0909_0113

scr_seq_0909_0198:
	.byte 0x02, 0x00, 0x00, 0x00
	.balign 4, 0
