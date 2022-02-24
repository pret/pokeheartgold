#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R26R0201.h"
#include "msgdata/msg/msg_0367_R26R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R26R0201_000
	scrdef_end

scr_seq_R26R0201_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0367_R26R0201_00000
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	closemsg
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0049
	npc_msg msg_0367_R26R0201_00001
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	closemsg
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0049
	npc_msg msg_0367_R26R0201_00002
	wait_button_or_walk_away
	closemsg
_0049:
	releaseall
	end
	.balign 4, 0
