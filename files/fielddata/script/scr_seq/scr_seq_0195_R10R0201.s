#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R10R0201.h"
#include "msgdata/msg/msg_0344_R10R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R10R0201_000
	scrdef scr_seq_R10R0201_001
	scrdef scr_seq_R10R0201_002
	scrdef scr_seq_R10R0201_003
	scrdef scr_seq_R10R0201_004
	scrdef scr_seq_R10R0201_005
	scrdef scr_seq_R10R0201_006
	scrdef scr_seq_R10R0201_007
	scrdef scr_seq_R10R0201_008
	scrdef_end

scr_seq_R10R0201_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0344_R10R0201_00003
	waitbutton
	closemsg
	releaseall
	end

scr_seq_R10R0201_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0344_R10R0201_00004
	waitbutton
	closemsg
	releaseall
	end

scr_seq_R10R0201_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0344_R10R0201_00005
	waitbutton
	closemsg
	releaseall
	end

scr_seq_R10R0201_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0344_R10R0201_00006
	waitbutton
	closemsg
	releaseall
	end

scr_seq_R10R0201_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0344_R10R0201_00007
	waitbutton
	closemsg
	releaseall
	end

scr_seq_R10R0201_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0344_R10R0201_00008
	waitbutton
	closemsg
	releaseall
	end

scr_seq_R10R0201_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_121
	gotoif TRUE, _013F
	npc_msg msg_0344_R10R0201_00009
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0134
	closemsg
	fade_screen 6, 1, 0, 0x0000
	wait_fade
	scrcmd_566
	get_party_selection VAR_SPECIAL_x800C
	scrcmd_150
	fade_screen 6, 1, 1, 0x0000
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, _0134
	scrcmd_470 8
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	get_partymon_species VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_472 32780
	comparevartovar VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	gotoif ne, _0127
	scrcmd_473 32772
	scrcmd_474
	setflag FLAG_UNK_121
	npc_msg msg_0344_R10R0201_00010
	waitbutton
	closemsg
	releaseall
	end

_0127:
	scrcmd_474
	npc_msg msg_0344_R10R0201_00011
	waitbutton
	closemsg
	releaseall
	end

_0134:
	npc_msg msg_0344_R10R0201_00012
	waitbutton
	closemsg
	releaseall
	end

_013F:
	npc_msg msg_0344_R10R0201_00013
	waitbutton
	closemsg
	releaseall
	end

scr_seq_R10R0201_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0344_R10R0201_00014
	waitbutton
	closemsg
	releaseall
	end

scr_seq_R10R0201_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0344_R10R0201_00015
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
