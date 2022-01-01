#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R1005.h"
#include "msgdata/msg/msg_0596_T25R1005.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T25R1005_000
	scrdef scr_seq_T25R1005_001
	scrdef scr_seq_T25R1005_002
	scrdef scr_seq_T25R1005_003
	scrdef scr_seq_T25R1005_004
	scrdef scr_seq_T25R1005_005
	scrdef scr_seq_T25R1005_006
	scrdef_end

scr_seq_T25R1005_005:
	setflag FLAG_UNK_1BE
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, _0046
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, _0044
	clearflag FLAG_UNK_1BE
_0044:
	end

_0046:
	clearflag FLAG_UNK_1BE
	end

scr_seq_T25R1005_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 7
	callstd 2052
	releaseall
	end

scr_seq_T25R1005_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, _0086
	npc_msg msg_0596_T25R1005_00018
	goto _0089

_0086:
	npc_msg msg_0596_T25R1005_00017
_0089:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R1005_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, _00AF
	npc_msg msg_0596_T25R1005_00016
	goto _00B2

_00AF:
	npc_msg msg_0596_T25R1005_00015
_00B2:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R1005_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_969
	gotoif TRUE, _017D
	checkflag FLAG_UNK_08D
	gotoif TRUE, _0172
	npc_msg msg_0596_T25R1005_00009
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _00F6
	goto _0167

_00F6:
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_566
	scrcmd_351 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, _0167
	scrcmd_470 1
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	get_partymon_species VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_472 32780
	comparevartovar VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	gotoif ne, _015A
	scrcmd_473 32772
	scrcmd_474
	setflag FLAG_UNK_08D
	npc_msg msg_0596_T25R1005_00010
	waitbutton
	closemsg
	releaseall
	end

_015A:
	scrcmd_474
	npc_msg msg_0596_T25R1005_00011
	waitbutton
	closemsg
	releaseall
	end

_0167:
	npc_msg msg_0596_T25R1005_00012
	waitbutton
	closemsg
	releaseall
	end

_0172:
	npc_msg msg_0596_T25R1005_00013
	waitbutton
	closemsg
	releaseall
	end

_017D:
	npc_msg msg_0596_T25R1005_00014
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R1005_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0596_T25R1005_00019
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R1005_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_08E
	gotoif TRUE, _0219
	get_lead_mon_index VAR_SPECIAL_x8000
	buffer_mon_species_name 0, VAR_SPECIAL_x8000
	npc_msg msg_0596_T25R1005_00000
	scrcmd_382 VAR_SPECIAL_x800C, VAR_SPECIAL_x8000
	comparevartovalue VAR_SPECIAL_x800C, 149
	gotoif ge, _01E3
	comparevartovalue VAR_SPECIAL_x800C, 50
	gotoif le, _01FE
	npc_msg msg_0596_T25R1005_00003
	waitbutton
	closemsg
	releaseall
	end

_01E3:
	npc_msg msg_0596_T25R1005_00001
	setvar VAR_SPECIAL_x8004, 354
	setvar VAR_SPECIAL_x8005, 1
	callstd std_obtain_item_verbose
	closemsg
	goto _0219

_01FE:
	npc_msg msg_0596_T25R1005_00004
	setvar VAR_SPECIAL_x8004, 348
	setvar VAR_SPECIAL_x8005, 1
	callstd std_obtain_item_verbose
	closemsg
	goto _0219

_0219:
	npc_msg msg_0596_T25R1005_00006
	setflag FLAG_UNK_08E
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
