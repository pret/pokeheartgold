#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R32PC0101.h"
#include "msgdata/msg/msg_0381_R32PC0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R32PC0101_000
	scrdef scr_seq_R32PC0101_001
	scrdef scr_seq_R32PC0101_002
	scrdef scr_seq_R32PC0101_003
	scrdef_end

scr_seq_R32PC0101_000:
	setvar VAR_SPECIAL_x8007, 3
	callstd std_nurse_joy
	end

scr_seq_R32PC0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_075
	gotoif TRUE, _008C
	npc_msg msg_0381_R32PC0101_00000
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0058
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _00A1
	end

_0058:
	setvar VAR_SPECIAL_x8004, 445
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0097
	callstd std_give_item_verbose
	setflag FLAG_UNK_075
	npc_msg msg_0381_R32PC0101_00003
	waitbutton
	closemsg
	releaseall
	end

_008C:
	npc_msg msg_0381_R32PC0101_00005
	waitbutton
	closemsg
	releaseall
	end

_0097:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

_00A1:
	npc_msg msg_0381_R32PC0101_00004
	waitbutton
	closemsg
	releaseall
	end

scr_seq_R32PC0101_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_174
	gotoif TRUE, _0121
	npc_msg msg_0381_R32PC0101_00007
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _00E0
	npc_msg msg_0381_R32PC0101_00008
	goto _00E3

_00E0:
	npc_msg msg_0381_R32PC0101_00009
_00E3:
	setvar VAR_SPECIAL_x8004, 494
	setvar VAR_SPECIAL_x8005, 2
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0117
	callstd std_give_item_verbose
	npc_msg msg_0381_R32PC0101_00010
	waitbutton
	closemsg
	releaseall
	setflag FLAG_UNK_174
	end

_0117:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

_0121:
	npc_msg msg_0381_R32PC0101_00011
	waitbutton
	closemsg
	releaseall
	end

scr_seq_R32PC0101_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0381_R32PC0101_00006
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
