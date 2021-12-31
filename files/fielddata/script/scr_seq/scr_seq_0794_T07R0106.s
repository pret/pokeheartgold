#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07R0106.h"
#include "msgdata/msg/msg_0499_T07R0106.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T07R0106_000
	scrdef scr_seq_T07R0106_001
	scrdef scr_seq_T07R0106_002
	scrdef scr_seq_T07R0106_003
	scrdef_end

scr_seq_T07R0106_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0499_T07R0106_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07R0106_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0499_T07R0106_00001
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07R0106_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0499_T07R0106_00002
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07R0106_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0499_T07R0106_00003
	scrcmd_113 20, 2
	goto _005E

_005E:
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x8000
	menu_item_add 209, 255, 0
	menu_item_add 210, 255, 1
	menu_item_add 211, 255, 2
	menu_item_add 212, 255, 3
	menu_exec
	touchscreen_menu_show
	switch VAR_SPECIAL_x8000
	case 0, _00C2
	case 1, _00CE
	case 2, _00DA
	npc_msg msg_0499_T07R0106_00007
	goto _0205

_00C2:
	setvar VAR_SPECIAL_x8001, 30
	goto _011C

_00CE:
	setvar VAR_SPECIAL_x8001, 31
	goto _011C

_00DA:
	setvar VAR_SPECIAL_x8001, 32
	goto _011C

_00E6:
	hasenoughmoneyimmediate 32780, 200
	return

_00F0:
	hasenoughmoneyimmediate 32780, 300
	return

_00FA:
	hasenoughmoneyimmediate 32780, 350
	return

_0104:
	submoneyimmediate 200
	return

_010C:
	submoneyimmediate 300
	return

_0114:
	submoneyimmediate 350
	return

_011C:
	comparevartovalue VAR_SPECIAL_x8000, 0
	callif eq, _00E6
	comparevartovalue VAR_SPECIAL_x8000, 1
	callif eq, _00F0
	comparevartovalue VAR_SPECIAL_x8000, 2
	callif eq, _00FA
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _01F0
	hasspaceforitem VAR_SPECIAL_x8001, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _01F9
	comparevartovalue VAR_SPECIAL_x8000, 0
	callif eq, _0104
	comparevartovalue VAR_SPECIAL_x8000, 1
	callif eq, _010C
	comparevartovalue VAR_SPECIAL_x8000, 2
	callif eq, _0114
	scrcmd_115
	buffer_item_name 0, VAR_SPECIAL_x8001
	play_se SEQ_SE_DP_JIHANKI
	buffer_item_name 0, VAR_SPECIAL_x8001
	npc_msg msg_0499_T07R0106_00004
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x8001
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	scrcmd_380 VAR_SPECIAL_x800C, 64
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _01E7
	play_se SEQ_SE_DP_JIHANKI
	buffer_item_name 0, VAR_SPECIAL_x8001
	npc_msg msg_0499_T07R0106_00005
	hasspaceforitem VAR_SPECIAL_x8001, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _01F9
	callstd std_give_item_verbose
_01E7:
	npc_msg msg_0499_T07R0106_00003
	goto _005E

_01F0:
	npc_msg msg_0499_T07R0106_00006
	goto _0205

_01F9:
	callstd std_bag_is_full
	closemsg
	scrcmd_114
	releaseall
	end

_0205:
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end
	.balign 4, 0
