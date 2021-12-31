#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R1202.h"
#include "msgdata/msg/msg_0601_T25R1202.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T25R1202_000
	scrdef scr_seq_T25R1202_001
	scrdef scr_seq_T25R1202_002
	scrdef scr_seq_T25R1202_003
	scrdef scr_seq_T25R1202_004
	scrdef scr_seq_T25R1202_005
	scrdef scr_seq_T25R1202_006
	scrdef scr_seq_T25R1202_007
	scrdef scr_seq_T25R1202_008
	scrdef scr_seq_T25R1202_009
	scrdef scr_seq_T25R1202_010
	scrdef scr_seq_T25R1202_011
	scrdef scr_seq_T25R1202_012
	scrdef_end

scr_seq_T25R1202_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0601_T25R1202_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R1202_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0601_T25R1202_00001
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R1202_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0601_T25R1202_00002
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R1202_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0601_T25R1202_00003
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R1202_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0601_T25R1202_00004
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R1202_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0601_T25R1202_00005
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R1202_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0601_T25R1202_00006
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R1202_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0601_T25R1202_00007
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R1202_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0601_T25R1202_00008
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R1202_009:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0601_T25R1202_00009
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R1202_010:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0601_T25R1202_00010
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R1202_011:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8005, 6
	goto _0117
	.byte 0x02, 0x00
_0117:
	npc_msg msg_0601_T25R1202_00013
	touchscreen_menu_hide
	menu_init 21, 11, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 15, 255, 0
	menu_item_add 16, 255, 1
	menu_item_add 17, 255, 2
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, _016E
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, _0193
	goto _0166
	.byte 0x02, 0x00
_0166:
	touchscreen_menu_show
_0168:
	closemsg
	releaseall
	end

_016E:
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0168
	closemsg
	scrcmd_815 0
	callstd 2046
	releaseall
	end

_0193:
	npc_msg msg_0601_T25R1202_00014
	goto _0117
	.byte 0x02, 0x00
scr_seq_T25R1202_012:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8005, 5
	goto _01B2
	.byte 0x02, 0x00
_01B2:
	npc_msg msg_0601_T25R1202_00011
	touchscreen_menu_hide
	menu_init 21, 11, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 15, 255, 0
	menu_item_add 16, 255, 1
	menu_item_add 17, 255, 2
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, _0209
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, _022E
	goto _0201
	.byte 0x02
	.byte 0x00
_0201:
	touchscreen_menu_show
_0203:
	closemsg
	releaseall
	end

_0209:
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0203
	closemsg
	scrcmd_815 0
	callstd 2046
	releaseall
	end

_022E:
	npc_msg msg_0601_T25R1202_00012
	goto _01B2
	.byte 0x02, 0x00, 0x00, 0x00, 0x00
	.balign 4, 0
