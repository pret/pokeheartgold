#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0250_000A ; 000
	scrdef scr_seq_0250_013A ; 001
	scrdef_end

scr_seq_0250_000A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0AA
	gotoif TRUE, scr_seq_0250_002C
	setflag FLAG_UNK_0A8
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0250_002C:
	setvar VAR_SPECIAL_x8004, 33
	setvar VAR_SPECIAL_x8005, 0
	hasitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 999
	gotoif ne, scr_seq_0250_0058
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0250_0058:
	scrcmd_113 20, 2
	npc_msg 1
	scrcmd_746
	scrcmd_750 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 12, 255, 1
	scrcmd_751 13, 255, 2
	scrcmd_751 14, 255, 3
	scrcmd_752
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_0250_0111
	comparevartovalue VAR_SPECIAL_x800C, 1
	callif eq, scr_seq_0250_011E
	comparevartovalue VAR_SPECIAL_x800C, 2
	callif eq, scr_seq_0250_012C
	hasenoughmoneyvar 32780, 16385
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0250_00F7
	setvar VAR_SPECIAL_x8004, 33
	copyvar VAR_SPECIAL_x8005, VAR_TEMP_x4000
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0250_0104
	submoneyvar 16385
	scrcmd_115
	npc_msg 2
	callstd 2033
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_0250_00F7:
	npc_msg 3
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_0250_0104:
	npc_msg 4
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_0250_0111:
	npc_msg 5
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_0250_011E:
	setvar VAR_TEMP_x4000, 1
	setvar VAR_TEMP_x4001, 500
	return

scr_seq_0250_012C:
	setvar VAR_TEMP_x4000, 12
	setvar VAR_TEMP_x4001, 6000
	return

scr_seq_0250_013A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0AA
	gotoif TRUE, scr_seq_0250_0158
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0250_0158:
	checkflag FLAG_UNK_0AB
	gotoif TRUE, scr_seq_0250_0197
	npc_msg 8
	scrcmd_049
	setvar VAR_SPECIAL_x8004, 410
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0250_01A2
	callstd 2033
	setflag FLAG_UNK_0AB
	goto scr_seq_0250_0197

scr_seq_0250_0197:
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0250_01A2:
	npc_msg 11
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
