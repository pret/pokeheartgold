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
	goto_if_set FLAG_UNK_071, _00BD
	npc_msg msg_0562_T22R0601_00001
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	compare VAR_SPECIAL_x800C, 0
	goto_if_eq _0041
	goto _00B2

_0041:
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_566
	get_party_selection VAR_SPECIAL_x800C
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	compare VAR_SPECIAL_x800C, 255
	goto_if_eq _00B2
	scrcmd_470 0
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	get_partymon_species VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_472 32780
	compare VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	goto_if_ne _00A5
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
	simple_npc_msg msg_0562_T22R0601_00000
	end
	.balign 4, 0
