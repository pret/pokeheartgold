#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0903_T25R1005_004C ; 000
	scrdef scr_seq_0903_T25R1005_0068 ; 001
	scrdef scr_seq_0903_T25R1005_0091 ; 002
	scrdef scr_seq_0903_T25R1005_00BA ; 003
	scrdef scr_seq_0903_T25R1005_0188 ; 004
	scrdef scr_seq_0903_T25R1005_001E ; 005
	scrdef scr_seq_0903_T25R1005_0199 ; 006
	scrdef_end

scr_seq_0903_T25R1005_001E:
	setflag FLAG_UNK_1BE
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_0903_T25R1005_0046
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0903_T25R1005_0044
	clearflag FLAG_UNK_1BE
scr_seq_0903_T25R1005_0044:
	end

scr_seq_0903_T25R1005_0046:
	clearflag FLAG_UNK_1BE
	end

scr_seq_0903_T25R1005_004C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 7
	callstd 2052
	releaseall
	end

scr_seq_0903_T25R1005_0068:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0903_T25R1005_0086
	npc_msg 18
	goto scr_seq_0903_T25R1005_0089

scr_seq_0903_T25R1005_0086:
	npc_msg 17
scr_seq_0903_T25R1005_0089:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0903_T25R1005_0091:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0903_T25R1005_00AF
	npc_msg 16
	goto scr_seq_0903_T25R1005_00B2

scr_seq_0903_T25R1005_00AF:
	npc_msg 15
scr_seq_0903_T25R1005_00B2:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0903_T25R1005_00BA:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_969
	gotoif TRUE, scr_seq_0903_T25R1005_017D
	checkflag FLAG_UNK_08D
	gotoif TRUE, scr_seq_0903_T25R1005_0172
	npc_msg 9
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0903_T25R1005_00F6
	goto scr_seq_0903_T25R1005_0167

scr_seq_0903_T25R1005_00F6:
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_566
	scrcmd_351 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0903_T25R1005_0167
	scrcmd_470 1
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	get_partymon_species VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_472 32780
	comparevartovar VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	gotoif ne, scr_seq_0903_T25R1005_015A
	scrcmd_473 32772
	scrcmd_474
	setflag FLAG_UNK_08D
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0903_T25R1005_015A:
	scrcmd_474
	npc_msg 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0903_T25R1005_0167:
	npc_msg 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0903_T25R1005_0172:
	npc_msg 13
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0903_T25R1005_017D:
	npc_msg 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0903_T25R1005_0188:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 19
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0903_T25R1005_0199:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_08E
	gotoif TRUE, scr_seq_0903_T25R1005_0219
	get_lead_mon_index VAR_SPECIAL_x8000
	buffer_mon_species_name 0, VAR_SPECIAL_x8000
	npc_msg 0
	scrcmd_382 VAR_SPECIAL_x800C, VAR_SPECIAL_x8000
	comparevartovalue VAR_SPECIAL_x800C, 149
	gotoif ge, scr_seq_0903_T25R1005_01E3
	comparevartovalue VAR_SPECIAL_x800C, 50
	gotoif le, scr_seq_0903_T25R1005_01FE
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0903_T25R1005_01E3:
	npc_msg 1
	setvar VAR_SPECIAL_x8004, 354
	setvar VAR_SPECIAL_x8005, 1
	callstd 2008
	closemsg
	goto scr_seq_0903_T25R1005_0219

scr_seq_0903_T25R1005_01FE:
	npc_msg 4
	setvar VAR_SPECIAL_x8004, 348
	setvar VAR_SPECIAL_x8005, 1
	callstd 2008
	closemsg
	goto scr_seq_0903_T25R1005_0219

scr_seq_0903_T25R1005_0219:
	npc_msg 6
	setflag FLAG_UNK_08E
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
