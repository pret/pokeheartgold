#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T26R0301.h"
#include "msgdata/msg/msg_0608_T26R0301.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T26R0301_000
	scrdef_end

scr_seq_T26R0301_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0BE
	gotoif TRUE, _00B3
	npc_msg msg_0608_T26R0301_00000
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0037
	goto _00A8

_0037:
	closemsg
	fade_screen 6, 1, 0, 0x0000
	wait_fade
	scrcmd_566
	get_party_selection VAR_SPECIAL_x800C
	scrcmd_150
	fade_screen 6, 1, 1, 0x0000
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, _00A8
	scrcmd_470 2
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	get_partymon_species VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_472 32780
	comparevartovar VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	gotoif ne, _009B
	scrcmd_473 32772
	scrcmd_474
	setflag FLAG_UNK_0BE
	npc_msg msg_0608_T26R0301_00001
	waitbutton
	closemsg
	releaseall
	end

_009B:
	scrcmd_474
	npc_msg msg_0608_T26R0301_00002
	waitbutton
	closemsg
	releaseall
	end

_00A8:
	npc_msg msg_0608_T26R0301_00003
	waitbutton
	closemsg
	releaseall
	end

_00B3:
	npc_msg msg_0608_T26R0301_00004
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
