#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0263.h"
#include "msgdata/msg/msg_0433.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0263_000
	scrdef_end

scr_seq_0263_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	script_overlay_cmd 3, 0
	scrcmd_116 1, 21, 1
	goto_if_set FLAG_GOT_SCRATCH_CARD_INFO, _0038
	setflag FLAG_GOT_SCRATCH_CARD_INFO
	buffer_int 0, 1
	npc_msg msg_0433_00015
	goto _0048
	end

_0038:
	buffer_int 0, 1
	npc_msg msg_0433_00000
	goto _0048
	end

_0048:
	npc_msg msg_0433_00001
	touchscreen_menu_hide
	menu_init 1, 1, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add 2, 255, 0
	menu_item_add 3, 255, 1
	menu_item_add 4, 255, 2
	menu_exec
	switch VAR_SPECIAL_RESULT
	case 0, _0097
	case 1, _0178
	goto _016B
	end

_0097:
	buffer_int 2, 1
	npc_msg msg_0433_00007
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _016B
	check_battle_points 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _015E
	scrcmd_556 1
	scrcmd_118 1
	npc_msg msg_0433_00010
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_815 0
	scrcmd_117
	closemsg
	scratch_off_card
	get_scratch_off_prize 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	get_scratch_off_prize 1, VAR_TEMP_x4002, VAR_TEMP_x4003
	get_scratch_off_prize 2, VAR_TEMP_x4004, VAR_TEMP_x4005
	scratch_off_card_end
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	setvar VAR_SPECIAL_x8000, 0
	call _019D
	compare VAR_SPECIAL_x8000, 0
	goto_if_eq _01CE
	buffer_int 0, VAR_SPECIAL_x8000
	npc_msg msg_0433_00011
	compare VAR_TEMP_x4001, 0
	call_if_ne _01D9
	compare VAR_TEMP_x4003, 0
	call_if_ne _0225
	compare VAR_TEMP_x4005, 0
	call_if_ne _0271
	npc_msg msg_0433_00005
	goto _0191
	end

_015E:
	touchscreen_menu_show
	npc_msg msg_0433_00014
	goto _0183
	end

_016B:
	touchscreen_menu_show
	npc_msg msg_0433_00005
	goto _0183
	end

_0178:
	npc_msg msg_0433_00006
	goto _0048
	end

_0183:
	wait_button_or_walk_away
	closemsg
	scrcmd_117
	script_overlay_cmd 3, 1
	releaseall
	end

_0191:
	wait_button_or_walk_away
	closemsg
	script_overlay_cmd 3, 1
	releaseall
	end

_019D:
	compare VAR_TEMP_x4001, 0
	call_if_ne _01C6
	compare VAR_TEMP_x4003, 0
	call_if_ne _01C6
	compare VAR_TEMP_x4005, 0
	call_if_ne _01C6
	return

_01C6:
	addvar VAR_SPECIAL_x8000, 1
	return

_01CE:
	npc_msg msg_0433_00005
	goto _0191
	end

_01D9:
	compare VAR_TEMP_x4001, 1
	goto_if_gt _01F1
	buffer_item_name 0, VAR_TEMP_x4000
	goto _01F6

_01F1:
	buffer_item_name_plural 0, VAR_TEMP_x4000
_01F6:
	buffer_int 1, VAR_TEMP_x4001
	hasspaceforitem VAR_TEMP_x4000, VAR_TEMP_x4001, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _02BD
	play_fanfare SEQ_ME_ITEM
	npc_msg msg_0433_00013
	giveitem VAR_TEMP_x4000, VAR_TEMP_x4001, VAR_SPECIAL_RESULT
	wait_fanfare
	wait_button
	return

_0225:
	compare VAR_TEMP_x4003, 1
	goto_if_gt _023D
	buffer_item_name 0, VAR_TEMP_x4002
	goto _0242

_023D:
	buffer_item_name_plural 0, VAR_TEMP_x4002
_0242:
	buffer_int 1, VAR_TEMP_x4003
	hasspaceforitem VAR_TEMP_x4002, VAR_TEMP_x4003, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _02BD
	play_fanfare SEQ_ME_ITEM
	npc_msg msg_0433_00013
	giveitem VAR_TEMP_x4002, VAR_TEMP_x4003, VAR_SPECIAL_RESULT
	wait_fanfare
	wait_button
	return

_0271:
	compare VAR_TEMP_x4005, 1
	goto_if_gt _0289
	buffer_item_name 0, VAR_TEMP_x4004
	goto _028E

_0289:
	buffer_item_name_plural 0, VAR_TEMP_x4004
_028E:
	buffer_int 1, VAR_TEMP_x4005
	hasspaceforitem VAR_TEMP_x4004, VAR_TEMP_x4005, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _02BD
	play_fanfare SEQ_ME_ITEM
	npc_msg msg_0433_00013
	giveitem VAR_TEMP_x4004, VAR_TEMP_x4005, VAR_SPECIAL_RESULT
	wait_fanfare
	wait_button
	return

_02BD:
	npc_msg msg_0433_00012
	return
	.balign 4, 0
