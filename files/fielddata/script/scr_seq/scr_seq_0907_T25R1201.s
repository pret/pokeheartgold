#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R1201.h"
#include "msgdata/msg/msg_0600_T25R1201.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T25R1201_000
	scrdef scr_seq_T25R1201_001
	scrdef scr_seq_T25R1201_002
	scrdef scr_seq_T25R1201_003
	scrdef scr_seq_T25R1201_004
	scrdef scr_seq_T25R1201_005
	scrdef scr_seq_T25R1201_006
	scrdef scr_seq_T25R1201_007
	scrdef scr_seq_T25R1201_008
	scrdef scr_seq_T25R1201_009
	scrdef scr_seq_T25R1201_010
	scrdef scr_seq_T25R1201_011
	scrdef scr_seq_T25R1201_012
	scrdef scr_seq_T25R1201_013
	scrdef scr_seq_T25R1201_014
	scrdef scr_seq_T25R1201_015
	scrdef scr_seq_T25R1201_016
	scrdef scr_seq_T25R1201_017
	scrdef_end
	scrdef_end ; not sure why there are two of these...

scr_seq_T25R1201_001:
	compare VAR_UNK_4133, 6
	call_if_eq _005B
	end

_005B:
	make_object_visible obj_player
	return

scr_seq_T25R1201_002:
	scrcmd_609
	lockall
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4000, 8
	goto_if_eq _0084
	goto _009D

_007E:
	goto _0097

_0084:
	compare VAR_TEMP_x4001, 2
	goto_if_eq _0097
	goto _009D

_0097:
	call _00A7
_009D:
	setvar VAR_UNK_4133, 0
	releaseall
	end

_00A7:
	scrcmd_307 0, 0, 8, 2, 77
	call _00F5
	scrcmd_374 obj_player
	apply_movement obj_player, _0108
	wait_movement
	call _00FD
	scrcmd_307 0, 0, 8, 4, 77
	call _00F5
	apply_movement obj_player, _0118
	wait_movement
	call _00FD
	setvar VAR_UNK_4133, 0
	return

_00F5:
	scrcmd_310 77
	scrcmd_308 77
	return

_00FD:
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	return

	.balign 4, 0
_0108:
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_0110:
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_0118:
	WalkNormalSouth 2
	EndMovement

scr_seq_T25R1201_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	party_legal_check VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _03C4
	goto_if_set FLAG_UNK_112, _0354
	setflag FLAG_UNK_112
	npc_msg msg_0600_T25R1201_00000
_014B:
	touchscreen_menu_hide
_014D:
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add 131, 255, 0
	menu_item_add 130, 255, 1
	menu_item_add 132, 255, 2
	menu_exec
	switch VAR_SPECIAL_RESULT
	case 0, _0227
	case 1, _01A4
	case 2, _0330
	goto _0330
	end

_01A4:
	npc_msg msg_0600_T25R1201_00002
	goto _01AF
	end

_01AF:
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add 133, 255, 0
	menu_item_add 134, 255, 1
	menu_item_add 135, 255, 2
	menu_exec
	switch VAR_SPECIAL_RESULT
	case 0, _0206
	case 1, _0211
	case 2, _021C
	goto _021C
	end

_0206:
	npc_msg msg_0600_T25R1201_00003
	goto _01AF
	end

_0211:
	npc_msg msg_0600_T25R1201_00004
	goto _01AF
	end

_021C:
	npc_msg msg_0600_T25R1201_00005
	goto _014D
	end

_0227:
	party_count_not_egg VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 2
	goto_if_lt _0240
	goto _035F
	end

_0240:
	npc_msg msg_0600_T25R1201_00009
	wait_button_or_walk_away
	touchscreen_menu_show
	closemsg
	releaseall
	end

_024D:
	callstd std_prompt_save
	copyvar VAR_SPECIAL_RESULT, VAR_TEMP_x4000
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0343
	touchscreen_menu_show
	heal_party
	setvar VAR_UNK_4133, 6
	npc_msg msg_0600_T25R1201_00007
	closemsg
	apply_movement obj_player, _03A0
	wait_movement
	scrcmd_307 0, 0, 8, 4, 77
	call _00F5
	apply_movement obj_player, _03B4
	wait_movement
	call _00FD
	scrcmd_307 0, 0, 8, 2, 77
	call _00F5
	apply_movement obj_player, _03AC
	wait_movement
	make_object_visible obj_player
	apply_movement obj_player, _03BC
	wait_movement
	call _00FD
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_579
	scrcmd_815 0
	scrcmd_166 VAR_SPECIAL_RESULT
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	scrcmd_165 VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0314
	restore_overworld
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	call _00A7
	releaseall
	end

_0314:
	restore_overworld
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	call _00A7
	goto _0343
	end

_0330:
	setvar VAR_UNK_4133, 0
	touchscreen_menu_show
	npc_msg msg_0600_T25R1201_00006
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0343:
	setvar VAR_UNK_4133, 0
	npc_msg msg_0600_T25R1201_00006
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0354:
	npc_msg msg_0600_T25R1201_00001
	goto _014B
	end

_035F:
	get_party_count VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 6
	goto_if_eq _0378
	goto _024D
	end

_0378:
	count_pc_empty_space VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0391
	goto _024D
	end

_0391:
	touchscreen_menu_show
	npc_msg msg_0600_T25R1201_00008
	wait_button_or_walk_away
	closemsg
	releaseall
	end

	.balign 4, 0
_03A0:
	WalkNormalEast
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_03AC:
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_03B4:
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_03BC:
	FaceSouth
	EndMovement

_03C4:
	callstd std_party_illegal
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T25R1201_003:
	simple_npc_msg msg_0600_T25R1201_00010
	end

scr_seq_T25R1201_004:
	simple_npc_msg msg_0600_T25R1201_00011
	end

scr_seq_T25R1201_005:
	simple_npc_msg msg_0600_T25R1201_00012
	end

scr_seq_T25R1201_006:
	simple_npc_msg msg_0600_T25R1201_00013
	end

scr_seq_T25R1201_007:
	simple_npc_msg msg_0600_T25R1201_00014
	end

scr_seq_T25R1201_008:
	simple_npc_msg msg_0600_T25R1201_00015
	end

scr_seq_T25R1201_009:
	simple_npc_msg msg_0600_T25R1201_00016
	end

scr_seq_T25R1201_010:
	simple_npc_msg msg_0600_T25R1201_00017
	end

scr_seq_T25R1201_011:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8005, 3
	goto _047C
	end

_047C:
	npc_msg msg_0600_T25R1201_00031
	touchscreen_menu_hide
	menu_init 21, 11, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add 33, 255, 0
	menu_item_add 34, 255, 1
	menu_item_add 35, 255, 2
	menu_exec
	switch VAR_SPECIAL_RESULT
	case 0, _04D3
	case 1, _04F8
	goto _04CB
	end

_04CB:
	touchscreen_menu_show
_04CD:
	closemsg
	releaseall
	end

_04D3:
	callstd std_prompt_save
	copyvar VAR_SPECIAL_RESULT, VAR_TEMP_x4000
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _04CD
	closemsg
	scrcmd_815 0
	callstd std_enter_global_terminal
	releaseall
	end

_04F8:
	npc_msg msg_0600_T25R1201_00032
	goto _047C
	end

scr_seq_T25R1201_012:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_SPECIAL_x8005, 4
	goto _0517
	end

_0517:
	npc_msg msg_0600_T25R1201_00029
	touchscreen_menu_hide
	menu_init 21, 11, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add 33, 255, 0
	menu_item_add 34, 255, 1
	menu_item_add 35, 255, 2
	menu_exec
	switch VAR_SPECIAL_RESULT
	case 0, _056E
	case 1, _0593
	goto _0566
	end

_0566:
	touchscreen_menu_show
_0568:
	closemsg
	releaseall
	end

_056E:
	callstd std_prompt_save
	copyvar VAR_SPECIAL_RESULT, VAR_TEMP_x4000
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0568
	closemsg
	scrcmd_815 0
	callstd std_enter_global_terminal
	releaseall
	end

_0593:
	npc_msg msg_0600_T25R1201_00030
	goto _0517
	end

scr_seq_T25R1201_013:
	simple_npc_msg msg_0600_T25R1201_00027
	end

scr_seq_T25R1201_014:
	simple_npc_msg msg_0600_T25R1201_00028
	end

scr_seq_T25R1201_015:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	party_legal_check VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0622
	setvar VAR_SPECIAL_x8000, 0
	get_partymon_species VAR_SPECIAL_x8000, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _064D
	buffer_mon_species_name 0, 0
	npc_msg msg_0600_T25R1201_00018
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _062D
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _063A
	end

_0622:
	npc_msg msg_0600_T25R1201_00023
	goto _067F
	end

_062D:
	set_favorite_mon
	npc_msg msg_0600_T25R1201_00020
	goto _067F
	end

_063A:
	buffer_mon_species_name 0, 0
	npc_msg msg_0600_T25R1201_00021
	goto _067F
	end

_064A:
	npc_msg msg_0600_T25R1201_00018
_064D:
	npc_msg msg_0600_T25R1201_00019
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _062D
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0674
	end

_0674:
	npc_msg msg_0600_T25R1201_00022
	goto _067F
	end

_067F:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T25R1201_016:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0600_T25R1201_00024
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _06D1
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	closemsg
	scrcmd_681 VAR_SPECIAL_x8004
	compare VAR_SPECIAL_x8004, 0
	goto_if_eq _06D1
	npc_msg msg_0600_T25R1201_00025
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_06D1:
	npc_msg msg_0600_T25R1201_00026
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T25R1201_017:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0600_T25R1201_00036
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
