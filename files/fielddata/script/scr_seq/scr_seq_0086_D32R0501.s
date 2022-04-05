#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D32R0501.h"
#include "msgdata/msg/msg_0109_D32R0501.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D32R0501_000
	scrdef scr_seq_D32R0501_001
	scrdef scr_seq_D32R0501_002
	scrdef scr_seq_D32R0501_003
	scrdef scr_seq_D32R0501_004
	scrdef scr_seq_D32R0501_005
	scrdef scr_seq_D32R0501_006
	scrdef scr_seq_D32R0501_007
	scrdef scr_seq_D32R0501_008
	scrdef scr_seq_D32R0501_009
	scrdef scr_seq_D32R0501_010
	scrdef scr_seq_D32R0501_011
	scrdef scr_seq_D32R0501_012
	scrdef scr_seq_D32R0501_013
	scrdef_end

scr_seq_D32R0501_013:
	end

scr_seq_D32R0501_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4003, 0
	setvar VAR_TEMP_x4004, 0
	goto _0074
	.byte 0x02, 0x00
scr_seq_D32R0501_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4003, 0
	setvar VAR_TEMP_x4004, 1
	goto _0074
	.byte 0x02, 0x00
_0074:
	scrcmd_682 0
	compare VAR_TEMP_x4004, 0
	call_if_eq _068C
	compare VAR_TEMP_x4004, 1
	call_if_eq _0691
	goto _009A
	.byte 0x02, 0x00
_009A:
	compare VAR_TEMP_x4004, 0
	call_if_eq _0696
	compare VAR_TEMP_x4004, 1
	call_if_eq _06B5
	menu_item_add 41, 255, 2
	menu_item_add 42, 255, 3
	menu_exec
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _013F
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _016C
	compare VAR_SPECIAL_RESULT, 2
	goto_if_eq _0104
	compare VAR_SPECIAL_RESULT, 4
	goto_if_eq _0199
	touchscreen_menu_show
	goto _0126
	.byte 0x02, 0x00
_0104:
	compare VAR_TEMP_x4004, 0
	call_if_eq _06CC
	compare VAR_TEMP_x4004, 1
	call_if_eq _06D1
	goto _009A
	.byte 0x02, 0x00
_0126:
	goto _012E
	.byte 0x02, 0x00
_012E:
	setvar VAR_UNK_4147, 0
	npc_msg msg_0109_D32R0501_00006
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_013F:
	setvar VAR_UNK_4148, 0
	scrcmd_637 0, 3, VAR_SPECIAL_RESULT
	buffer_int 0, 3
	buffer_int 1, 3
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _01C6
	goto _01F0
	.byte 0x02, 0x00
_016C:
	setvar VAR_UNK_4148, 1
	scrcmd_637 0, 3, VAR_SPECIAL_RESULT
	buffer_int 0, 3
	buffer_int 1, 3
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _01C6
	goto _01F0
	.byte 0x02, 0x00
_0199:
	setvar VAR_UNK_4148, 2
	scrcmd_637 0, 2, VAR_SPECIAL_RESULT
	buffer_int 0, 2
	buffer_int 1, 2
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _01DB
	goto _01F0
	.byte 0x02, 0x00
_01C6:
	npc_msg msg_0109_D32R0501_00008
	scrcmd_444 9, 3, 0, 0
	touchscreen_menu_show
	goto _0126
	.byte 0x02, 0x00
_01DB:
	npc_msg msg_0109_D32R0501_00008
	scrcmd_444 9, 2, 0, 0
	touchscreen_menu_show
	goto _0126
	.byte 0x02, 0x00
_01F0:
	npc_msg msg_0109_D32R0501_00007
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_637 4, VAR_UNK_4148, VAR_SPECIAL_RESULT
	scrcmd_639 VAR_TEMP_x4002, VAR_TEMP_x4005, VAR_TEMP_x4006
	compare VAR_TEMP_x4002, 255
	goto_if_ne _0222
	scrcmd_815 0
_0222:
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	compare VAR_TEMP_x4002, 255
	goto_if_eq _0126
	day_care_sanitize_mon VAR_TEMP_x4002, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 255
	goto_if_eq _05FB
	day_care_sanitize_mon VAR_TEMP_x4005, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 255
	goto_if_eq _05FB
	compare VAR_UNK_4148, 2
	goto_if_eq _0283
	day_care_sanitize_mon VAR_TEMP_x4006, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 255
	goto_if_eq _05FB
_0283:
	get_partymon_species VAR_TEMP_x4002, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 0
	goto_if_ne _029E
	touchscreen_menu_show
	goto _0126

_029E:
	goto _02A6
	.byte 0x02, 0x00
_02A6:
	goto _02AE
	.byte 0x02, 0x00
_02AE:
	compare VAR_UNK_4148, 0
	call_if_eq _046A
	compare VAR_UNK_4148, 1
	call_if_eq _046A
	setvar VAR_TEMP_x4000, 0
	heal_party
	callstd std_prompt_save
	copyvar VAR_SPECIAL_RESULT, VAR_TEMP_x4000
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0126
	touchscreen_menu_show
	compare VAR_UNK_4148, 2
	goto_if_eq _02FE
	goto _04CB
	.byte 0x02, 0x00
_02FE:
	npc_msg msg_0109_D32R0501_00043
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add 14, 255, 0
	menu_item_add 15, 255, 1
	menu_item_add 5, 255, 2
	menu_exec
	switch VAR_SPECIAL_RESULT
	case 0, _034F
	case 1, _03A7
	touchscreen_menu_show
	goto _0126
	.byte 0x02, 0x00
_034F:
	npc_msg msg_0109_D32R0501_00044
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _02FE
	touchscreen_menu_show
	closemsg
	scrcmd_226 31, 0, 0, VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0395
	compare VAR_SPECIAL_RESULT, 3
	goto_if_eq _039D
	goto _03FF
	.byte 0x02, 0x00
_0395:
	goto _02FE
	.byte 0x02, 0x00
_039D:
	scrcmd_283
	goto _02FE
	.byte 0x02, 0x00
_03A7:
	npc_msg msg_0109_D32R0501_00044
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _02FE
	touchscreen_menu_show
	closemsg
	scrcmd_227 31, 0, 0, VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _03ED
	compare VAR_SPECIAL_RESULT, 3
	goto_if_eq _03F5
	goto _03FF
	.byte 0x02, 0x00
_03ED:
	goto _02FE
	.byte 0x02, 0x00
_03F5:
	scrcmd_283
	goto _02FE
	.byte 0x02, 0x00
_03FF:
	scrcmd_258
	scrcmd_257 136
	get_partymon_species VAR_TEMP_x4002, VAR_SPECIAL_x8000
	get_partymon_species VAR_TEMP_x4005, VAR_SPECIAL_x8001
	scrcmd_638 VAR_SPECIAL_x8000, VAR_SPECIAL_x8001, VAR_SPECIAL_RESULT
	switch VAR_SPECIAL_RESULT
	case 1, _0472
	case 2, _0488
	case 3, _049E
	scrcmd_258
	scrcmd_257 138
	npc_msg msg_0109_D32R0501_00045
	compare VAR_UNK_4148, 2
	call_if_eq _046A
	call _06FD
	goto _04CB
	.byte 0x02, 0x00
_046A:
	setvar VAR_UNK_4147, 255
	return

_0472:
	call _04C1
	buffer_mon_species_name 0, VAR_TEMP_x4002
	npc_msg msg_0109_D32R0501_00029
	goto _04B9
	.byte 0x02, 0x00
_0488:
	call _04C1
	buffer_mon_species_name 0, VAR_TEMP_x4005
	npc_msg msg_0109_D32R0501_00029
	goto _04B9
	.byte 0x02, 0x00
_049E:
	call _04C1
	buffer_mon_species_name 0, VAR_TEMP_x4002
	buffer_mon_species_name 1, VAR_TEMP_x4005
	npc_msg msg_0109_D32R0501_00030
	goto _04B9
	.byte 0x02, 0x00
_04B9:
	goto _0126
	.byte 0x02
	.byte 0x00
_04C1:
	scrcmd_258
	scrcmd_257 139
	scrcmd_283
	return

_04CB:
	compare VAR_UNK_4148, 0
	call_if_eq _0563
	compare VAR_UNK_4148, 1
	call_if_eq _057E
	compare VAR_UNK_4148, 2
	call_if_eq _0599
	play_se SEQ_SE_DP_KAIDAN2
	goto _04FE
	.byte 0x02, 0x00
_04FE:
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_815 0
	compare VAR_UNK_4148, 0
	call_if_eq _05BF
	compare VAR_UNK_4148, 1
	call_if_eq _05D3
	compare VAR_UNK_4148, 2
	call_if_eq _05E7
	scrcmd_420 59
	scrcmd_436
	scrcmd_627 11
	compare VAR_UNK_4148, 2
	call_if_eq _055F
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	scrcmd_682 1
	end

_055F:
	scrcmd_283
	return

_0563:
	npc_msg msg_0109_D32R0501_00032
	wait_button
	closemsg
	apply_movement obj_player, _060C
	apply_movement VAR_SPECIAL_LAST_TALKED, _062C
	wait_movement
	return

_057E:
	npc_msg msg_0109_D32R0501_00032
	wait_button
	closemsg
	apply_movement obj_player, _060C
	apply_movement VAR_SPECIAL_LAST_TALKED, _062C
	wait_movement
	return

_0599:
	npc_msg_var msg_0109_D32R0501_00032
	wait 10, VAR_SPECIAL_RESULT
	scrcmd_258
	scrcmd_257 137
	closemsg
	apply_movement obj_player, _0618
	apply_movement VAR_SPECIAL_LAST_TALKED, _0638
	wait_movement
	return

_05BF:
	apply_movement obj_player, _064C
	apply_movement VAR_SPECIAL_LAST_TALKED, _0670
	wait_movement
	return

_05D3:
	apply_movement obj_player, _064C
	apply_movement VAR_SPECIAL_LAST_TALKED, _0670
	wait_movement
	return

_05E7:
	apply_movement obj_player, _065C
	apply_movement VAR_SPECIAL_LAST_TALKED, _067C
	wait_movement
	return

_05FB:
	touchscreen_menu_show
	setvar VAR_UNK_4147, 0
	callstd std_bag_is_full_griseous_orb
	end
	.byte 0x00, 0x00, 0x00

_060C:
	step 14, 6
	step 69, 1
	step_end

_0618:
	step 14, 3
	step 12, 1
	step 14, 3
	step 69, 1
	step_end

_062C:
	step 14, 5
	step 69, 1
	step_end

_0638:
	step 14, 2
	step 12, 1
	step 14, 3
	step 69, 1
	step_end

_064C:
	step 23, 6
	step 70, 1
	step 2, 1
	step_end

_065C:
	step 23, 6
	step 21, 1
	step 70, 1
	step 2, 1
	step_end

_0670:
	step 23, 5
	step 70, 1
	step_end

_067C:
	step 21, 1
	step 23, 5
	step 70, 1
	step_end
_068C:
	npc_msg msg_0109_D32R0501_00000
	return

_0691:
	npc_msg msg_0109_D32R0501_00003
	return

_0696:
	npc_msg msg_0109_D32R0501_00001
	touchscreen_menu_hide
	menu_init 1, 1, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add 38, 255, 0
	menu_item_add 39, 255, 1
	return

_06B5:
	npc_msg msg_0109_D32R0501_00004
	touchscreen_menu_hide
	menu_init 1, 1, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add 40, 255, 4
	return

_06CC:
	npc_msg msg_0109_D32R0501_00002
	return

_06D1:
	npc_msg msg_0109_D32R0501_00005
	return

scr_seq_D32R0501_001:
	scrcmd_682 0
	setvar VAR_TEMP_x4003, 1
	setvar VAR_UNK_4147, 0
	npc_msg msg_0109_D32R0501_00033
	call _046A
	call _06FD
	goto _04CB
	.byte 0x02, 0x00
_06FD:
	add_waiting_icon
	save_game_normal VAR_SPECIAL_RESULT
	remove_waiting_icon
	play_se SEQ_SE_DP_SAVE
	wait_se SEQ_SE_DP_SAVE
	return

scr_seq_D32R0501_002:
	lockall
	faceplayer
	npc_msg msg_0109_D32R0501_00034
	scrcmd_640 VAR_UNK_4148
	compare VAR_BATTLE_CASTLE_PRINT_PROGRESS, 1
	call_if_eq _073C
	compare VAR_BATTLE_CASTLE_PRINT_PROGRESS, 3
	call_if_eq _0744
	goto _0126
	.byte 0x02, 0x00
_073C:
	setvar VAR_BATTLE_CASTLE_PRINT_PROGRESS, 0
	return

_0744:
	setvar VAR_BATTLE_CASTLE_PRINT_PROGRESS, 2
	return

scr_seq_D32R0501_003:
	compare VAR_UNK_4148, 0
	call_if_eq _0788
	compare VAR_UNK_4148, 1
	call_if_eq _0788
	compare VAR_BATTLE_CASTLE_PRINT_PROGRESS, 1
	call_if_eq _078E
	compare VAR_BATTLE_CASTLE_PRINT_PROGRESS, 3
	call_if_eq _07A5
	goto _0126
	.byte 0x02, 0x00
_0788:
	add_special_game_stat_2 28
	return

_078E:
	npc_msg msg_0109_D32R0501_00035
	buffer_players_name 0
	npc_msg msg_0109_D32R0501_00037
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setvar VAR_BATTLE_CASTLE_PRINT_PROGRESS, 2
	return

_07A5:
	npc_msg msg_0109_D32R0501_00035
	buffer_players_name 0
	npc_msg msg_0109_D32R0501_00036
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setvar VAR_BATTLE_CASTLE_PRINT_PROGRESS, 4
	callstd std_frontier_gold_prints_check
	return

scr_seq_D32R0501_004:
	goto _0126
	.byte 0x02, 0x00, 0x0c, 0x00, 0x02, 0x00, 0x3f, 0x00, 0x01, 0x00
	.byte 0x0c, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x0c, 0x00, 0x02, 0x00, 0x3f, 0x00, 0x01, 0x00
	.byte 0x0c, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_D32R0501_006:
	simple_npc_msg msg_0109_D32R0501_00046
	end

scr_seq_D32R0501_007:
	simple_npc_msg msg_0109_D32R0501_00047
	end

scr_seq_D32R0501_008:
	simple_npc_msg msg_0109_D32R0501_00048
	end

scr_seq_D32R0501_009:
	simple_npc_msg msg_0109_D32R0501_00049
	end

scr_seq_D32R0501_010:
	simple_npc_msg msg_0109_D32R0501_00050
	end

scr_seq_D32R0501_011:
	simple_npc_msg msg_0109_D32R0501_00051
	end

scr_seq_D32R0501_012:
	simple_npc_msg msg_0109_D32R0501_00052
	end
	.balign 4, 0
