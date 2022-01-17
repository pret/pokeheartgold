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
	goto_if_set FLAG_UNK_0BE, _00B3
	npc_msg msg_0608_T26R0301_00000
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	compare VAR_SPECIAL_x800C, 0
	goto_if_eq _0037
	goto _00A8

_0037:
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_566
	get_party_selection VAR_SPECIAL_x800C
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	compare VAR_SPECIAL_x800C, 255
	goto_if_eq _00A8
	scrcmd_470 2
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	get_partymon_species VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_472 32780
	compare VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	goto_if_ne _009B
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
