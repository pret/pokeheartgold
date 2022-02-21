#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R12R0101.h"
#include "msgdata/msg/msg_0349_R12R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R12R0101_000
	scrdef_end

scr_seq_R12R0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	getitemquantity ITEM_SUPER_ROD, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _004C
	npc_msg msg_0349_R12R0101_00000
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0057
	npc_msg msg_0349_R12R0101_00001
	giveitem_no_check ITEM_SUPER_ROD, 1
_004C:
	npc_msg msg_0349_R12R0101_00002
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0057:
	npc_msg msg_0349_R12R0101_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
