#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R27R0101.h"
#include "msgdata/msg/msg_0370_R27R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R27R0101_000
	scrdef_end

scr_seq_R27R0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0E9
	gotoif TRUE, _006A
	npc_msg msg_0370_R27R0101_00000
	get_lead_mon_index VAR_TEMP_x4000
	scrcmd_382 VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 150
	gotoif ge, _003E
	npc_msg msg_0370_R27R0101_00003
	waitbutton
	closemsg
	releaseall
	end

_003E:
	npc_msg msg_0370_R27R0101_00001
	setvar VAR_SPECIAL_x8004, 364
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0075
	callstd std_give_item_verbose
	setflag FLAG_UNK_0E9
_006A:
	npc_msg msg_0370_R27R0101_00002
	waitbutton
	closemsg
	releaseall
	end

_0075:
	callstd std_bag_is_full
	closemsg
	releaseall
	end
	.balign 4, 0
