#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D32R0101.h"
#include "msgdata/msg/msg_0103_D32R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D32R0101_000
	scrdef scr_seq_D32R0101_001
	scrdef scr_seq_D32R0101_002
	scrdef scr_seq_D32R0101_003
	scrdef scr_seq_D32R0101_004
	scrdef scr_seq_D32R0101_005
	scrdef scr_seq_D32R0101_006
	scrdef scr_seq_D32R0101_007
	scrdef scr_seq_D32R0101_008
	scrdef scr_seq_D32R0101_009
	scrdef scr_seq_D32R0101_010
	scrdef scr_seq_D32R0101_011
	scrdef_end

scr_seq_D32R0101_011:
	setflag FLAG_SYS_FLYPOINT_UNION_CAVE
	setvar VAR_UNK_40E5, 2
	end

scr_seq_D32R0101_000:
	scrcmd_609
	lockall
	setvar VAR_UNK_40E6, 1
	call _02FF
	npc_msg msg_0103_D32R0101_00000
	closemsg
	call _0333
	goto_if_set FLAG_UNK_176, _0077
	npc_msg msg_0103_D32R0101_00001
	buffer_players_name 0
	play_fanfare SEQ_ME_ITEM
	npc_msg msg_0103_D32R0101_00002
	wait_fanfare
	setflag FLAG_UNK_176
_0077:
	npc_msg msg_0103_D32R0101_00003
	call _00A6
	touchscreen_menu_show
	npc_msg msg_0103_D32R0101_00010
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D32R0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0103_D32R0101_00004
	call _00A6
	goto _012B
	.byte 0x02, 0x00
_00A6:
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add 451, 255, 0
	menu_item_add 452, 255, 1
	menu_item_add 453, 255, 2
	menu_item_add 454, 255, 3
	menu_item_add 455, 255, 4
	menu_item_add 456, 255, 5
	menu_exec
	switch VAR_SPECIAL_RESULT
	case 0, _0138
	case 1, _0170
	case 2, _0146
	case 3, _0154
	case 4, _0162
	return

_012B:
	touchscreen_menu_show
	npc_msg msg_0103_D32R0101_00010
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0138:
	npc_msg msg_0103_D32R0101_00005
	npc_msg msg_0103_D32R0101_00004
	goto _00A6
	.byte 0x02, 0x00
_0146:
	npc_msg msg_0103_D32R0101_00007
	npc_msg msg_0103_D32R0101_00004
	goto _00A6
	.byte 0x02, 0x00
_0154:
	npc_msg msg_0103_D32R0101_00008
	npc_msg msg_0103_D32R0101_00004
	goto _00A6
	.byte 0x02, 0x00
_0162:
	npc_msg msg_0103_D32R0101_00009
	npc_msg msg_0103_D32R0101_00004
	goto _00A6
	.byte 0x02, 0x00
_0170:
	npc_msg msg_0103_D32R0101_00006
	npc_msg msg_0103_D32R0101_00004
	goto _00A6
	.byte 0x02, 0x00
scr_seq_D32R0101_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0103_D32R0101_00017
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _01AD
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _01B8
	end

_01AD:
	npc_msg msg_0103_D32R0101_00018
	goto _01B8
	.byte 0x02, 0x00
_01B8:
	npc_msg msg_0103_D32R0101_00019
	goto _01C3
	.byte 0x02, 0x00
_01C3:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D32R0101_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0103_D32R0101_00020
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _01FA
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0205
	end

_01FA:
	npc_msg msg_0103_D32R0101_00021
	goto _0205
	.byte 0x02, 0x00
_0205:
	npc_msg msg_0103_D32R0101_00022
	goto _0210
	.byte 0x02, 0x00
_0210:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D32R0101_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0103_D32R0101_00023
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0247
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0252
	end

_0247:
	npc_msg msg_0103_D32R0101_00024
	goto _0252
	.byte 0x02, 0x00
_0252:
	npc_msg msg_0103_D32R0101_00025
	goto _025D
	.byte 0x02, 0x00
_025D:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D32R0101_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0103_D32R0101_00026
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0294
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _029F
	end

_0294:
	npc_msg msg_0103_D32R0101_00027
	goto _029F
	.byte 0x02, 0x00
_029F:
	npc_msg msg_0103_D32R0101_00028
	goto _02AA
	.byte 0x02, 0x00
_02AA:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D32R0101_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0103_D32R0101_00029
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _02E1
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _02EC
	end

_02E1:
	npc_msg msg_0103_D32R0101_00030
	goto _02EC
	.byte 0x02, 0x00
_02EC:
	npc_msg msg_0103_D32R0101_00031
	goto _02F7
	.byte 0x02, 0x00
_02F7:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_02FF:
	apply_movement obj_D32R0101_bfsw2, _0384
	apply_movement obj_D32R0101_bfsw2_2, _0384
	apply_movement obj_D32R0101_bfsw2_3, _0384
	apply_movement obj_D32R0101_bfsw2_4, _0384
	apply_movement obj_D32R0101_bfsw2_5, _0384
	apply_movement obj_D32R0101_bfsw2_6, _0384
	wait_movement
	return

_0333:
	toggle_following_pokemon_movement 0
	wait_following_pokemon_movement
	following_pokemon_movement 55
	apply_movement obj_D32R0101_bfsw2, _038C
	apply_movement obj_D32R0101_bfsw2_2, _038C
	apply_movement obj_D32R0101_bfsw2_3, _038C
	apply_movement obj_D32R0101_bfsw2_4, _0394
	apply_movement obj_D32R0101_bfsw2_5, _0394
	apply_movement obj_D32R0101_bfsw2_6, _0394
	apply_movement obj_player, _039C
	wait_movement
	wait_following_pokemon_movement
	toggle_following_pokemon_movement 1
	following_pokemon_movement 48
	return
	.byte 0x00

_0384:
	step 1, 1
	step_end

_038C:
	step 3, 1
	step_end

_0394:
	step 2, 1
	step_end

_039C:
	step 12, 3
	step 34, 1
	step_end
scr_seq_D32R0101_007:
	simple_npc_msg msg_0103_D32R0101_00032
	end

scr_seq_D32R0101_008:
	simple_npc_msg msg_0103_D32R0101_00033
	end

scr_seq_D32R0101_009:
	simple_npc_msg msg_0103_D32R0101_00034
	end

scr_seq_D32R0101_010:
	simple_npc_msg msg_0103_D32R0101_00035
	end
	.balign 4, 0
