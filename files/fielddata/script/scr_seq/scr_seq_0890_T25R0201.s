#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R0201.h"
#include "msgdata/msg/msg_0584_T25R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T25R0201_000
	scrdef scr_seq_T25R0201_001
	scrdef_end

scr_seq_T25R0201_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_089, _0081
	npc_msg msg_0584_T25R0201_00000
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0042
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _008C
	end

_0042:
	npc_msg msg_0584_T25R0201_00001
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0065
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _008C
	end

_0065:
	giveitem_no_check ITEM_BICYCLE, 1
	setflag FLAG_UNK_089
	closemsg
	touchscreen_menu_show
	releaseall
	end

_0081:
	npc_msg msg_0584_T25R0201_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_008C:
	npc_msg msg_0584_T25R0201_00004
	wait_button_or_walk_away
	closemsg
	touchscreen_menu_show
	releaseall
	end

scr_seq_T25R0201_001:
	simple_npc_msg msg_0584_T25R0201_00005
	end
	.balign 4, 0
