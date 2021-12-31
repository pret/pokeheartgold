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
	getitemquantity 447, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _004C
	npc_msg msg_0349_R12R0101_00000
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0057
	npc_msg msg_0349_R12R0101_00001
	setvar VAR_SPECIAL_x8004, 447
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
_004C:
	npc_msg msg_0349_R12R0101_00002
	waitbutton
	closemsg
	releaseall
	end

_0057:
	npc_msg msg_0349_R12R0101_00003
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
