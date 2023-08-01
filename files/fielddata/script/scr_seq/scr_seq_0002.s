#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0002.h"
#include "msgdata/msg/msg_0748.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0002_000
	scrdef scr_seq_0002_001
	scrdef scr_seq_0002_002
	scrdef_end

scr_seq_0002_000:
	setvar VAR_SPECIAL_x8000, MOVE_TUTOR_NPC_FRONTIER_TOP_LEFT
	setvar VAR_TEMP_x400F, 0
	setvar VAR_SPECIAL_x8007, 0
	goto _005C
	.byte 0x02, 0x00
scr_seq_0002_001:
	setvar VAR_SPECIAL_x8000, MOVE_TUTOR_NPC_FRONTIER_TOP_RIGHT
	setvar VAR_TEMP_x400F, 12
	setvar VAR_SPECIAL_x8007, 1
	goto _005C
	.byte 0x02, 0x00
scr_seq_0002_002:
	setvar VAR_SPECIAL_x8000, MOVE_TUTOR_NPC_FRONTIER_BOTTOM_RIGHT
	setvar VAR_TEMP_x400F, 24
	setvar VAR_SPECIAL_x8007, 2
	goto _005C
	.byte 0x02, 0x00
_005C:
	script_overlay_cmd 3, 0
	scrcmd_116 1, 21, 1
	setvar VAR_SPECIAL_x8004, 4
	addvar VAR_SPECIAL_x8004, VAR_TEMP_x400F
	non_npc_msg_var VAR_SPECIAL_x8004
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0352
_008A:
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	closemsg
	scrcmd_117
	party_select_ui
	get_party_selection VAR_SPECIAL_x8001
	scrcmd_150
	scrcmd_116 1, 21, 1
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	compare VAR_SPECIAL_x8001, 255
	goto_if_eq _0352
	get_partymon_species VAR_SPECIAL_x8001, VAR_SPECIAL_x8002
	compare VAR_SPECIAL_x8002, 0
	goto_if_eq _0391
	scrcmd_652 VAR_SPECIAL_x8001, VAR_SPECIAL_x8000, VAR_SPECIAL_x8002
	compare VAR_SPECIAL_x8002, 0
	goto_if_eq _00F0
	goto _0125

_00F0:
	compare VAR_SPECIAL_x8007, 0
	goto_if_ne _0106
	npc_msg msg_0748_00005
	goto _011F

_0106:
	compare VAR_SPECIAL_x8007, 1
	goto_if_ne _011C
	npc_msg msg_0748_00017
	goto _011F

_011C:
	npc_msg msg_0748_00029
_011F:
	goto _008A

_0125:
	setvar VAR_SPECIAL_x8004, 0
	touchscreen_menu_hide
	nop_var_490 VAR_SPECIAL_x8000
	nop_var_490 VAR_SPECIAL_x8001
	nop_var_490 VAR_SPECIAL_x8002
	nop_var_490 VAR_SPECIAL_x8003
_013D:
	move_tutor_choose_move VAR_SPECIAL_x8001, VAR_SPECIAL_x8000, VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	nop_var_490 VAR_SPECIAL_x8000
	nop_var_490 VAR_SPECIAL_x8001
	nop_var_490 VAR_SPECIAL_x8002
	nop_var_490 VAR_SPECIAL_x8003
	copyvar VAR_SPECIAL_x8003, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_x8003, 65533
	goto_if_ne _018F
	addvar VAR_SPECIAL_x8004, 1
	compare VAR_SPECIAL_x8004, VAR_SPECIAL_x8002
	goto_if_lt _013D
	setvar VAR_SPECIAL_x8004, 0
	goto _013D
	.byte 0x16, 0x00, 0x41, 0x00, 0x00, 0x00
_018F:
	compare VAR_SPECIAL_x8003, 65534
	goto_if_ne _01D0
	bufferpartymonnick 0, VAR_SPECIAL_x8001
	setvar VAR_SPECIAL_x8004, 7
	addvar VAR_SPECIAL_x8004, VAR_TEMP_x400F
	non_npc_msg_var VAR_SPECIAL_x8004
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0352
	setvar VAR_SPECIAL_x8004, 0
	closemsg
	goto _013D

_01D0:
	tutor_move_get_price VAR_SPECIAL_x8003, VAR_SPECIAL_x8005
	check_battle_points VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _01EF
	goto _0224

_01EF:
	compare VAR_SPECIAL_x8007, 0
	goto_if_ne _0205
	npc_msg msg_0748_00006
	goto _021E

_0205:
	compare VAR_SPECIAL_x8007, 1
	goto_if_ne _021B
	npc_msg msg_0748_00018
	goto _021E

_021B:
	npc_msg msg_0748_00030
_021E:
	goto _0352

_0224:
	bufferpartymonnick 0, VAR_SPECIAL_x8001
	buffer_move_name 1, VAR_SPECIAL_x8003
	count_mon_moves VAR_SPECIAL_x8006, VAR_SPECIAL_x8001
	compare VAR_SPECIAL_x8006, 4
	goto_if_lt _0328
_0241:
	setvar VAR_SPECIAL_x8004, 8
	addvar VAR_SPECIAL_x8004, VAR_TEMP_x400F
	non_npc_msg_var VAR_SPECIAL_x8004
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _03A4
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	closemsg
	scrcmd_117
	choose_move_ui 1, VAR_SPECIAL_x8001, VAR_SPECIAL_x8003
	get_move_selection 1, VAR_SPECIAL_x8006
	nop_var_490 VAR_SPECIAL_x8006
	scrcmd_150
	scrcmd_116 1, 21, 1
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	compare VAR_SPECIAL_x8006, 4
	goto_if_eq _03A4
	nop_var_490 VAR_SPECIAL_x8006
	buffer_party_mon_move_name 2, VAR_SPECIAL_x8001, VAR_SPECIAL_x8006
	setvar VAR_SPECIAL_x8004, 9
	addvar VAR_SPECIAL_x8004, VAR_TEMP_x400F
	non_npc_msg_var VAR_SPECIAL_x8004
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _03A4
	compare VAR_SPECIAL_x8007, 0
	goto_if_ne _02EA
	npc_msg msg_0748_00012
	goto _0303

_02EA:
	compare VAR_SPECIAL_x8007, 1
	goto_if_ne _0300
	npc_msg msg_0748_00024
	goto _0303

_0300:
	npc_msg msg_0748_00036
_0303:
	play_se SEQ_SE_DP_KON
	wait_se SEQ_SE_DP_KON
	wait 30, VAR_SPECIAL_RESULT
	buffer_party_mon_move_name 1, VAR_SPECIAL_x8001, VAR_SPECIAL_x8006
	setvar VAR_SPECIAL_x8004, 13
	addvar VAR_SPECIAL_x8004, VAR_TEMP_x400F
	non_npc_msg_var VAR_SPECIAL_x8004
_0328:
	buffer_move_name 1, VAR_SPECIAL_x8003
	setvar VAR_SPECIAL_x8004, 14
	addvar VAR_SPECIAL_x8004, VAR_TEMP_x400F
	non_npc_msg_var VAR_SPECIAL_x8004
	play_fanfare SEQ_ME_LVUP
	wait_fanfare
	scrcmd_556 VAR_SPECIAL_x8005
	scrcmd_118 1
	tutor_move_teach_in_slot VAR_SPECIAL_x8001, VAR_SPECIAL_x8006, VAR_SPECIAL_x8003
_0352:
	compare VAR_SPECIAL_x8007, 0
	goto_if_ne _0368
	npc_msg msg_0748_00015
	goto _0381

_0368:
	compare VAR_SPECIAL_x8007, 1
	goto_if_ne _037E
	npc_msg msg_0748_00027
	goto _0381

_037E:
	npc_msg msg_0748_00039
_0381:
	wait_button_or_walk_away
	closemsg
	touchscreen_menu_show
	scrcmd_117
	script_overlay_cmd 3, 1
	endstd
	end

_0391:
	npc_msg msg_0748_00040
	wait_button_or_walk_away
	closemsg
	touchscreen_menu_show
	scrcmd_117
	script_overlay_cmd 3, 1
	endstd
	end

_03A4:
	setvar VAR_SPECIAL_x8004, 10
	addvar VAR_SPECIAL_x8004, VAR_TEMP_x400F
	non_npc_msg_var VAR_SPECIAL_x8004
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0241
	setvar VAR_SPECIAL_x8004, 11
	addvar VAR_SPECIAL_x8004, VAR_TEMP_x400F
	non_npc_msg_var VAR_SPECIAL_x8004
	goto _0352
	.byte 0x02
	.byte 0x00, 0x00, 0x00, 0x00
	.balign 4, 0
