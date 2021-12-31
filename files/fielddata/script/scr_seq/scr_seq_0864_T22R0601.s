#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T22R0601.h"
#include "msgdata/msg/msg_0562_T22R0601.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T22R0601_000
	scrdef scr_seq_T22R0601_001
	scrdef scr_seq_T22R0601_002
	scrdef_end

scr_seq_T22R0601_000:
	end

scr_seq_T22R0601_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_071
	gotoif TRUE, _00BD
	npc_msg msg_0562_T22R0601_00001
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0041
	goto _00B2

_0041:
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_566
	scrcmd_351 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, _00B2
	scrcmd_470 0
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	get_partymon_species VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_472 32780
	comparevartovar VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	gotoif ne, _00A5
	scrcmd_473 32772
	scrcmd_474
	setflag FLAG_UNK_071
	npc_msg msg_0562_T22R0601_00002
	waitbutton
	closemsg
	releaseall
	end

_00A5:
	scrcmd_474
	npc_msg msg_0562_T22R0601_00003
	waitbutton
	closemsg
	releaseall
	end

_00B2:
	npc_msg msg_0562_T22R0601_00004
	waitbutton
	closemsg
	releaseall
	end

_00BD:
	npc_msg msg_0562_T22R0601_00005
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T22R0601_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0562_T22R0601_00000
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
