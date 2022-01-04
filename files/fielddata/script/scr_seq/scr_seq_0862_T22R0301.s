#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T22R0301.h"
#include "msgdata/msg/msg_0560_T22R0301.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T22R0301_000
	scrdef scr_seq_T22R0301_001
	scrdef scr_seq_T22R0301_002
	scrdef scr_seq_T22R0301_003
	scrdef scr_seq_T22R0301_004
	scrdef scr_seq_T22R0301_005
	scrdef scr_seq_T22R0301_006
	scrdef scr_seq_T22R0301_007
	scrdef_end

scr_seq_T22R0301_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_player_facing VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, _0049
	apply_movement obj_T22R0301_gsbigman, _0164
	goto _0087

_0049:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, _0064
	apply_movement obj_T22R0301_gsbigman, _0188
	goto _0087

_0064:
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _007F
	apply_movement obj_T22R0301_gsbigman, _01AC
	goto _0087

_007F:
	apply_movement obj_T22R0301_gsbigman, _01D0
_0087:
	wait_movement
	npc_msg msg_0560_T22R0301_00000
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _00B0
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _00D7
	end

_00B0:
	npc_msg msg_0560_T22R0301_00001
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _00D7
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0157
	end

_00D7:
	npc_msg msg_0560_T22R0301_00002
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _00FE
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0125
	end

_00FE:
	npc_msg msg_0560_T22R0301_00003
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0125
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0157
	end

_0125:
	npc_msg msg_0560_T22R0301_00004
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _014C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0157
	end

_014C:
	npc_msg msg_0560_T22R0301_00005
	waitbutton
	closemsg
	releaseall
	end

_0157:
	npc_msg msg_0560_T22R0301_00006
	waitbutton
	closemsg
	releaseall
	end
	.byte 0x00, 0x00

_0164:
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step_end

_0188:
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step_end

_01AC:
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step_end

_01D0:
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step_end
scr_seq_T22R0301_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0560_T22R0301_00012
	goto _0207
	.byte 0x02, 0x00
_0207:
	npc_msg msg_0560_T22R0301_00013
	touchscreen_menu_hide
	menu_init 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 24, 255, 1
	menu_item_add 25, 255, 2
	menu_item_add 26, 255, 3
	menu_item_add 27, 255, 4
	menu_item_add 28, 255, 5
	menu_item_add 29, 255, 0
	menu_exec
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0264
	npc_msg msg_0560_T22R0301_00014
	goto _0207
	.byte 0x16, 0x00
	.byte 0x74, 0x00, 0x00, 0x00
_0264:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, _0280
	npc_msg msg_0560_T22R0301_00015
	goto _0207
	.byte 0x16, 0x00, 0x58, 0x00, 0x00, 0x00
_0280:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, _029C
	npc_msg msg_0560_T22R0301_00016
	goto _0207
	.byte 0x16, 0x00, 0x3c, 0x00, 0x00, 0x00
_029C:
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif ne, _02B8
	npc_msg msg_0560_T22R0301_00017
	goto _0207
	.byte 0x16, 0x00, 0x20, 0x00, 0x00, 0x00
_02B8:
	comparevartovalue VAR_SPECIAL_x800C, 5
	gotoif ne, _02D4
	npc_msg msg_0560_T22R0301_00018
	goto _0207
	.byte 0x16, 0x00
	.byte 0x04, 0x00, 0x00, 0x00
_02D4:
	closemsg
	releaseall
	end

scr_seq_T22R0301_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0560_T22R0301_00011
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T22R0301_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0560_T22R0301_00019
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0353
	npc_msg msg_0560_T22R0301_00020
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0353
	npc_msg msg_0560_T22R0301_00021
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0353
	npc_msg msg_0560_T22R0301_00022
	closemsg
	touchscreen_menu_show
	apply_movement obj_T22R0301_gsboy1, _035C
	wait_movement
	npc_msg msg_0560_T22R0301_00023
	waitbutton
	closemsg
	releaseall
	end

_0353:
	closemsg
	touchscreen_menu_show
	releaseall
	end
	.byte 0x00

_035C:
	step 32, 1
	step_end
scr_seq_T22R0301_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0560_T22R0301_00007
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T22R0301_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0560_T22R0301_00010
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T22R0301_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0560_T22R0301_00009
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T22R0301_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0560_T22R0301_00008
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
