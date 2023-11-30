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
	simple_npc_msg msg_0601_T25R1202_00000
	end

scr_seq_T25R1202_001:
	simple_npc_msg msg_0601_T25R1202_00001
	end

scr_seq_T25R1202_002:
	simple_npc_msg msg_0601_T25R1202_00002
	end

scr_seq_T25R1202_003:
	simple_npc_msg msg_0601_T25R1202_00003
	end

scr_seq_T25R1202_004:
	simple_npc_msg msg_0601_T25R1202_00004
	end

scr_seq_T25R1202_005:
	simple_npc_msg msg_0601_T25R1202_00005
	end

scr_seq_T25R1202_006:
	simple_npc_msg msg_0601_T25R1202_00006
	end

scr_seq_T25R1202_007:
	simple_npc_msg msg_0601_T25R1202_00007
	end

scr_seq_T25R1202_008:
	simple_npc_msg msg_0601_T25R1202_00008
	end

scr_seq_T25R1202_009:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0601_T25R1202_00009
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T25R1202_010:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0601_T25R1202_00010
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T25R1202_011:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8005, 6
	goto _0117
	end

_0117:
	npc_msg msg_0601_T25R1202_00013
	touchscreen_menu_hide
	menu_init 21, 11, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add 15, 255, 0
	menu_item_add 16, 255, 1
	menu_item_add 17, 255, 2
	menu_exec
	switch VAR_SPECIAL_RESULT
	case 0, _016E
	case 1, _0193
	goto _0166
	end

_0166:
	touchscreen_menu_show
_0168:
	closemsg
	releaseall
	end

_016E:
	callstd std_prompt_save
	copyvar VAR_SPECIAL_RESULT, VAR_TEMP_x4000
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0168
	closemsg
	scrcmd_815 0
	callstd std_enter_global_terminal
	releaseall
	end

_0193:
	npc_msg msg_0601_T25R1202_00014
	goto _0117
	end

scr_seq_T25R1202_012:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8005, 5
	goto _01B2
	end

_01B2:
	npc_msg msg_0601_T25R1202_00011
	touchscreen_menu_hide
	menu_init 21, 11, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add 15, 255, 0
	menu_item_add 16, 255, 1
	menu_item_add 17, 255, 2
	menu_exec
	switch VAR_SPECIAL_RESULT
	case 0, _0209
	case 1, _022E
	goto _0201
	end

_0201:
	touchscreen_menu_show
_0203:
	closemsg
	releaseall
	end

_0209:
	callstd std_prompt_save
	copyvar VAR_SPECIAL_RESULT, VAR_TEMP_x4000
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0203
	closemsg
	scrcmd_815 0
	callstd std_enter_global_terminal
	releaseall
	end

_022E:
	npc_msg msg_0601_T25R1202_00012
	goto _01B2
	end

	.balign 4, 0
