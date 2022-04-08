#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D47R0101.h"
#include "msgdata/msg/msg_0135_D47R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D47R0101_000
	scrdef scr_seq_D47R0101_001
	scrdef scr_seq_D47R0101_002
	scrdef scr_seq_D47R0101_003
	scrdef scr_seq_D47R0101_004
	scrdef scr_seq_D47R0101_005
	scrdef scr_seq_D47R0101_006
	scrdef scr_seq_D47R0101_007
	scrdef scr_seq_D47R0101_008
	scrdef scr_seq_D47R0101_009
	scrdef scr_seq_D47R0101_010
	scrdef scr_seq_D47R0101_011
	scrdef_end

scr_seq_D47R0101_006:
	scrcmd_609
	lockall
	apply_movement obj_D47R0101_counterm_3, _01EC
	apply_movement obj_D47R0101_counterm_5, _01EC
	wait_movement
	npc_msg msg_0135_D47R0101_00007
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0062
	safari_zone_action 1, 0
_0062:
	touchscreen_menu_show
	closemsg
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _00BD
	apply_movement obj_player, _01B4
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_D47R0102, 0, 79, 100, DIR_NORTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	lock obj_partner_poke
	scrcmd_606
	apply_movement obj_partner_poke, _0200
	wait_movement
	release obj_partner_poke
	releaseall
	end

_00BD:
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4000, 5
	goto_if_ne _00E2
	setvar VAR_TEMP_x4002, 5
	setvar VAR_TEMP_x4003, 5
	goto _00EE

_00E2:
	setvar VAR_TEMP_x4002, 19
	setvar VAR_TEMP_x4003, 5
_00EE:
	apply_movement obj_player, _01DC
	wait_movement
	scrcmd_307 0, 0, VAR_TEMP_x4002, VAR_TEMP_x4003, 77
	call _08AF
	apply_movement obj_player, _01BC
	apply_movement obj_D47R0101_counterm_3, _01F4
	apply_movement obj_D47R0101_counterm_5, _01F4
	wait_movement
	call _08B7
	setvar VAR_SCENE_SAFARI_ZONE_ENTRANCE, 0
	npc_msg msg_0135_D47R0101_00008
	npc_msg msg_0135_D47R0101_00009
	wait_button_or_walk_away
	closemsg
	scrcmd_606
	releaseall
	end

scr_seq_D47R0101_007:
	scrcmd_609
	lockall
	apply_movement obj_player, _01E4
	wait_movement
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4000, 5
	goto_if_ne _0172
	setvar VAR_TEMP_x4002, 5
	setvar VAR_TEMP_x4003, 5
	goto _017E

_0172:
	setvar VAR_TEMP_x4002, 19
	setvar VAR_TEMP_x4003, 5
_017E:
	scrcmd_307 0, 0, VAR_TEMP_x4002, VAR_TEMP_x4003, 77
	call _08AF
	apply_movement obj_player, _01BC
	wait_movement
	call _08B7
	setvar VAR_SCENE_SAFARI_ZONE_ENTRANCE, 0
	npc_msg msg_0135_D47R0101_00009
	wait_button_or_walk_away
	closemsg
	scrcmd_606
	releaseall
	end
	.byte 0x00, 0x00

_01B4:
	step 12, 1
	step_end

_01BC:
	step 13, 2
	step 14, 1
	step 32, 1
	step_end
	.byte 0x0d, 0x00, 0x04, 0x00
	.byte 0x0e, 0x00, 0x01, 0x00, 0x20, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

_01DC:
	step 13, 1
	step_end

_01E4:
	step 13, 2
	step_end

_01EC:
	step 3, 1
	step_end

_01F4:
	step 63, 1
	step 1, 1
	step_end

_0200:
	step 0, 1
	step_end
scr_seq_D47R0101_008:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_D47R0101_gsgentleman, _0310
	apply_movement obj_player, _03B8
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg msg_0135_D47R0101_00029
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _025B
_024A:
	npc_msg msg_0135_D47R0101_00030
	wait_button_or_walk_away
	closemsg
	setvar VAR_UNK_4057, 2
	releaseall
	end

_025B:
	npc_msg msg_0135_D47R0101_00031
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _025B
	goto _024A

scr_seq_D47R0101_009:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_D47R0101_gsgentleman, _0310
	apply_movement obj_player, _03B8
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg msg_0135_D47R0101_00034
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_D47R0101_gsgentleman, _0324
	apply_movement obj_player, _03C8
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg msg_0135_D47R0101_00035
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_D47R0101_gsgentleman, _0334
	apply_movement obj_player, _03D8
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg msg_0135_D47R0101_00036
	wait_button_or_walk_away
	closemsg
	setvar VAR_UNK_4057, 5
	clearflag FLAG_HIDE_SAFARI_ZONE_WORKERS
	releaseall
	end
	.byte 0x00, 0x00

_0310:
	step 1, 1
	step 75, 1
	step 65, 1
	step 14, 1
	step_end

_0324:
	step 12, 2
	step 15, 3
	step 12, 1
	step_end

_0334:
	step 13, 2
	step 14, 2
	step 13, 1
	step 75, 1
	step 0, 1
	step_end

_034C:
	step 14, 2
	step 12, 4
	step 15, 4
	step 1, 1
	step_end

_0360:
	step 12, 4
	step 15, 2
	step 1, 1
	step_end

_0370:
	step 13, 2
	step 15, 1
	step 13, 2
	step 2, 1
	step_end
	.byte 0x0f, 0x00, 0x01, 0x00, 0x41, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00, 0x0e, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
	.byte 0x41, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
	.byte 0x4b, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

_03B8:
	step 65, 1
	step 12, 3
	step 3, 1
	step_end

_03C8:
	step 12, 2
	step 15, 4
	step 12, 1
	step_end

_03D8:
	step 1, 1
	step_end

_03E0:
	step 65, 1
	step 0, 1
	step 65, 1
	step 13, 1
	step 0, 1
	step_end

_03F8:
	step 15, 1
	step 0, 1
	step_end

_0404:
	step 12, 1
	step_end

_040C:
	step 65, 3
	step 3, 1
	step_end
	.byte 0x00, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
	.byte 0x0c, 0x00, 0x03, 0x00, 0x03, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_D47R0101_010:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_183, _0599
	compare VAR_UNK_4057, 2
	goto_if_eq _049D
	compare VAR_UNK_4057, 3
	goto_if_eq _048B
	compare VAR_UNK_4057, 5
	goto_if_eq _04CB
	compare VAR_UNK_4057, 6
	goto_if_eq _0494
	compare VAR_UNK_4057, 7
	goto_if_eq _058F
	npc_msg msg_0135_D47R0101_00042
	goto _0587
	.byte 0x02, 0x00
_048B:
	npc_msg msg_0135_D47R0101_00042
	goto _0587

_0494:
	npc_msg msg_0135_D47R0101_00040
	goto _0587

_049D:
	scrcmd_791 0, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _04B8
	npc_msg msg_0135_D47R0101_00033
	goto _04C3

_04B8:
	npc_msg msg_0135_D47R0101_00032
	setvar VAR_UNK_4057, 3
	scrcmd_792
_04C3:
	goto _0587
	.byte 0x02, 0x00
_04CB:
	scrcmd_791 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _057E
	npc_msg msg_0135_D47R0101_00037
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0515
	apply_movement obj_D47R0101_gsgentleman, _034C
	apply_movement obj_player, _03E0
	wait_movement
	goto _054C

_0515:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _053A
	apply_movement obj_D47R0101_gsgentleman, _0360
	apply_movement obj_player, _03F8
	wait_movement
	goto _054C

_053A:
	apply_movement obj_D47R0101_gsgentleman, _0360
	apply_movement obj_player, _0404
	wait_movement
_054C:
	npc_msg msg_0135_D47R0101_00038
	closemsg
	apply_movement obj_D47R0101_gsgentleman, _0370
	apply_movement obj_player, _040C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg msg_0135_D47R0101_00039
	setvar VAR_UNK_4057, 6
	scrcmd_792
	goto _0587

_057E:
	npc_msg msg_0135_D47R0101_00041
	goto _0587

_0587:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_058F:
	setflag FLAG_UNK_183
	npc_msg msg_0135_D47R0101_00043
	npc_msg msg_0135_D47R0101_00044
_0599:
	npc_msg msg_0135_D47R0101_00045
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0683
_05AF:
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add 463, 255, 0
	menu_item_add 464, 255, 1
	menu_item_add 465, 255, 2
	menu_item_add 466, 255, 3
	menu_item_add 467, 255, 4
	menu_item_add 468, 255, 5
	menu_item_add 469, 255, 6
	menu_exec
	switch VAR_SPECIAL_RESULT
	case 0, _064D
	case 1, _0656
	case 2, _065F
	case 3, _0668
	case 4, _0671
	case 5, _067A
	goto _0683
	.byte 0x02, 0x00
_064D:
	npc_msg msg_0135_D47R0101_00047
	goto _05AF

_0656:
	npc_msg msg_0135_D47R0101_00048
	goto _05AF

_065F:
	npc_msg msg_0135_D47R0101_00049
	goto _05AF

_0668:
	npc_msg msg_0135_D47R0101_00050
	goto _05AF

_0671:
	npc_msg msg_0135_D47R0101_00051
	goto _05AF

_067A:
	npc_msg msg_0135_D47R0101_00052
	goto _05AF

_0683:
	touchscreen_menu_show
	npc_msg msg_0135_D47R0101_00053
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D47R0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_UNK_4057, 6
	goto_if_lt _06AE
	npc_msg msg_0135_D47R0101_00015
	goto _06B1

_06AE:
	npc_msg msg_0135_D47R0101_00014
_06B1:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _06E7
	setvar VAR_SPECIAL_x8004, 30
	buffer_int 1, VAR_SPECIAL_x8004
	setvar VAR_SPECIAL_x8005, 1000
	buffer_int 2, VAR_SPECIAL_x8005
	npc_msg msg_0135_D47R0101_00016
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_06E7:
	npc_msg msg_0135_D47R0101_00017
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D47R0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_UNK_4057, 7
	goto_if_eq _0899
_0707:
	compare VAR_UNK_4057, 6
	goto_if_lt _0728
	setvar VAR_SPECIAL_RESULT, 500
	buffer_int 1, VAR_SPECIAL_RESULT
	npc_msg msg_0135_D47R0101_00001
	goto _0736

_0728:
	setvar VAR_SPECIAL_RESULT, 500
	buffer_int 1, VAR_SPECIAL_RESULT
	npc_msg msg_0135_D47R0101_00000
_0736:
	show_money_box 20, 2
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0846
	count_pc_empty_space VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0773
	get_party_count VAR_SPECIAL_x8004
	compare VAR_SPECIAL_x8004, 6
	goto_if_eq _0853
_0773:
	hasenoughmoneyimmediate VAR_SPECIAL_RESULT, 500
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0876
	setvar VAR_SPECIAL_RESULT, 500
	buffer_int 1, VAR_SPECIAL_RESULT
	npc_msg msg_0135_D47R0101_00002
	play_se SEQ_SE_DP_REGI
	submoneyimmediate 500
	update_money_box
	npc_msg msg_0135_D47R0101_00004
	buffer_players_name 0
	setvar VAR_SPECIAL_RESULT, 30
	buffer_int 1, VAR_SPECIAL_RESULT
	npc_msg msg_0135_D47R0101_00005
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	npc_msg msg_0135_D47R0101_00006
	closemsg
	hide_money_box
	scrcmd_600
	apply_movement obj_player, _08C4
	wait_movement
	scrcmd_307 0, 0, 5, 5, 77
	call _08AF
	apply_movement obj_player, _08D0
	wait_movement
	call _08B7
	setvar VAR_SCENE_SAFARI_ZONE_ENTRANCE, 1
	safari_zone_action 0, 0
	set_dynamic_warp MAP_D47R0101, 1, 5, 2, 1
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_D47R0102, 0, 79, 100, DIR_NORTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	lock obj_partner_poke
	scrcmd_606
	apply_movement obj_partner_poke, _0200
	wait_movement
	release obj_partner_poke
	releaseall
	end

_0846:
	hide_money_box
	npc_msg msg_0135_D47R0101_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0853:
	hide_money_box
	compare VAR_UNK_4057, 6
	goto_if_lt _086B
	npc_msg msg_0135_D47R0101_00013
	goto _086E

_086B:
	npc_msg msg_0135_D47R0101_00012
_086E:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0876:
	hide_money_box
	compare VAR_UNK_4057, 6
	goto_if_lt _088E
	npc_msg msg_0135_D47R0101_00011
	goto _0891

_088E:
	npc_msg msg_0135_D47R0101_00010
_0891:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0899:
	goto_if_set FLAG_UNK_183, _0707
	npc_msg msg_0135_D47R0101_00018
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_08AF:
	scrcmd_310 77
	scrcmd_308 77
	return

_08B7:
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	return
	.byte 0x00, 0x00

_08C4:
	step 15, 1
	step 0, 1
	step_end

_08D0:
	step 12, 4
	step_end
scr_seq_D47R0101_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_UNK_4057, 0
	goto_if_eq _09DC
	compare VAR_UNK_4057, 1
	goto_if_eq _09DC
	compare VAR_UNK_4057, 2
	goto_if_eq _09DC
	compare VAR_UNK_4057, 3
	goto_if_eq _09DC
	npc_msg msg_0135_D47R0101_00019
	touchscreen_menu_hide
_0919:
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add 457, 255, 0
	menu_item_add 458, 255, 1
	menu_item_add 459, 255, 2
	menu_item_add 460, 255, 3
	menu_item_add 461, 255, 4
	menu_item_add 462, 255, 5
	menu_exec
	switch VAR_SPECIAL_RESULT
	case 0, _09A2
	case 1, _09AB
	case 2, _09B4
	case 3, _09BD
	case 4, _09C6
	goto _09CF
	.byte 0x02, 0x00
_09A2:
	npc_msg msg_0135_D47R0101_00020
	goto _0919

_09AB:
	npc_msg msg_0135_D47R0101_00021
	goto _0919

_09B4:
	npc_msg msg_0135_D47R0101_00022
	goto _0919

_09BD:
	npc_msg msg_0135_D47R0101_00023
	goto _0919

_09C6:
	npc_msg msg_0135_D47R0101_00024
	goto _0919

_09CF:
	touchscreen_menu_show
	npc_msg msg_0135_D47R0101_00026
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_09DC:
	npc_msg msg_0135_D47R0101_00025
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D47R0101_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_UNK_4057, 7
	goto_if_eq _0C21
_09FC:
	scrcmd_247
	nat_dex_flag_action 2, VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 0
	goto_if_eq _0DF2
	compare VAR_UNK_4057, 6
	goto_if_lt _0A26
	npc_msg msg_0135_D47R0101_00065
	goto _0A29

_0A26:
	npc_msg msg_0135_D47R0101_00066
_0A29:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	closemsg
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0BFC
	callstd std_prompt_save
	copyvar VAR_SPECIAL_RESULT, VAR_TEMP_x4000
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0A5D
	goto _0C16
	.byte 0x02, 0x00
_0A5D:
	touchscreen_menu_hide
	npc_msg msg_0135_D47R0101_00071
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add 14, 255, 0
	menu_item_add 15, 255, 1
	menu_item_add 5, 255, 2
	menu_exec
	switch VAR_SPECIAL_RESULT
	case 0, _0AAC
	case 1, _0B2F
	goto _0BFC
	.byte 0x02, 0x00
_0AAC:
	npc_msg msg_0135_D47R0101_00086
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0A5D
	setvar VAR_SPECIAL_x8004, 39
	setvar VAR_SPECIAL_x8005, 0
	scrcmd_226 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, 0, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0B05
	compare VAR_SPECIAL_RESULT, 3
	goto_if_eq _0B11
	compare VAR_SPECIAL_RESULT, 4
	goto_if_eq _0B20
	goto _0BB2
	.byte 0x02, 0x00
_0B05:
	scrcmd_283
	touchscreen_menu_hide
	goto _0A5D
	.byte 0x02
	.byte 0x00
_0B11:
	scrcmd_283
	touchscreen_menu_show
	npc_msg msg_0135_D47R0101_00087
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0B20:
	scrcmd_283
	npc_msg msg_0135_D47R0101_00085
	wait_button_or_walk_away
	closemsg
	touchscreen_menu_show
	releaseall
	end

_0B2F:
	npc_msg msg_0135_D47R0101_00086
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0A5D
	setvar VAR_SPECIAL_x8004, 39
	setvar VAR_SPECIAL_x8005, 0
	scrcmd_227 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, 0, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0B88
	compare VAR_SPECIAL_RESULT, 3
	goto_if_eq _0B94
	compare VAR_SPECIAL_RESULT, 4
	goto_if_eq _0BA3
	goto _0BB2
	.byte 0x02, 0x00
_0B88:
	scrcmd_283
	touchscreen_menu_hide
	goto _0A5D
	.byte 0x02, 0x00
_0B94:
	scrcmd_283
	npc_msg msg_0135_D47R0101_00087
	wait_button_or_walk_away
	closemsg
	touchscreen_menu_show
	releaseall
	end

_0BA3:
	scrcmd_283
	npc_msg msg_0135_D47R0101_00085
	wait_button_or_walk_away
	closemsg
	touchscreen_menu_show
	releaseall
	end

_0BB2:
	setvar VAR_UNK_4133, 1
	npc_msg msg_0135_D47R0101_00081
	scrcmd_257 96
	scrcmd_822
	scrcmd_283
	setvar VAR_TEMP_x4000, 0
	scrcmd_823 VAR_TEMP_x4000
	touchscreen_menu_hide
	npc_msg msg_0135_D47R0101_00082
	npc_msg msg_0135_D47R0101_00088
	add_waiting_icon
	save_game_normal VAR_SPECIAL_RESULT
	remove_waiting_icon
	buffer_players_name 0
	npc_msg msg_0135_D47R0101_00089
	play_se SEQ_SE_DP_SAVE
	wait_se SEQ_SE_DP_SAVE
	npc_msg msg_0135_D47R0101_00083
	setvar VAR_UNK_4133, 0
	touchscreen_menu_show
	closemsg
	releaseall
	end

_0BFC:
	npc_msg msg_0135_D47R0101_00085
	wait_button_or_walk_away
	closemsg
	touchscreen_menu_show
	releaseall
	end
	.byte 0x2d, 0x00, 0x55, 0x32, 0x00, 0x35, 0x00
	.byte 0xeb, 0x02, 0x61, 0x00, 0x02, 0x00
_0C16:
	npc_msg msg_0135_D47R0101_00085
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0C21:
	goto_if_set FLAG_UNK_183, _09FC
	npc_msg msg_0135_D47R0101_00018
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D47R0101_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_UNK_4057, 7
	goto_if_eq _0DFD
_0C4C:
	scrcmd_247
	nat_dex_flag_action 2, VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 0
	goto_if_eq _0DF2
	scrcmd_824 VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 0
	goto_if_eq _0C84
	setvar VAR_TEMP_x4000, 0
	scrcmd_823 VAR_TEMP_x4000
	npc_msg msg_0135_D47R0101_00054
	goto _0C8F

_0C84:
	npc_msg msg_0135_D47R0101_00060
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0C8F:
	show_money_box 20, 2
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0D9F
	count_pc_empty_space VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0CCC
	get_party_count VAR_SPECIAL_x8004
	compare VAR_SPECIAL_x8004, 6
	goto_if_eq _0DAC
_0CCC:
	hasenoughmoneyimmediate VAR_SPECIAL_RESULT, 500
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0DCF
	setvar VAR_SPECIAL_RESULT, 500
	buffer_int 1, VAR_SPECIAL_RESULT
	npc_msg msg_0135_D47R0101_00055
	play_se SEQ_SE_DP_REGI
	submoneyimmediate 500
	update_money_box
	npc_msg msg_0135_D47R0101_00057
	buffer_players_name 0
	setvar VAR_SPECIAL_RESULT, 30
	buffer_int 1, VAR_SPECIAL_RESULT
	npc_msg msg_0135_D47R0101_00058
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	npc_msg msg_0135_D47R0101_00059
	closemsg
	hide_money_box
	scrcmd_600
	apply_movement obj_player, _08C4
	wait_movement
	scrcmd_307 0, 0, 19, 5, 77
	call _08AF
	apply_movement obj_player, _08D0
	wait_movement
	call _08B7
	setvar VAR_SCENE_SAFARI_ZONE_ENTRANCE, 3
	safari_zone_action 0, 1
	set_dynamic_warp MAP_D47R0101, 2, 19, 2, 1
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	warp MAP_D47R0102, 0, 79, 100, DIR_NORTH
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	lock obj_partner_poke
	scrcmd_606
	apply_movement obj_partner_poke, _0200
	wait_movement
	release obj_partner_poke
	releaseall
	end

_0D9F:
	hide_money_box
	npc_msg msg_0135_D47R0101_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0DAC:
	hide_money_box
	compare VAR_UNK_4057, 6
	goto_if_lt _0DC4
	npc_msg msg_0135_D47R0101_00013
	goto _0DC7

_0DC4:
	npc_msg msg_0135_D47R0101_00012
_0DC7:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0DCF:
	hide_money_box
	compare VAR_UNK_4057, 6
	goto_if_lt _0DE7
	npc_msg msg_0135_D47R0101_00011
	goto _0DEA

_0DE7:
	npc_msg msg_0135_D47R0101_00010
_0DEA:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0DF2:
	npc_msg msg_0135_D47R0101_00084
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0DFD:
	goto_if_set FLAG_UNK_183, _0C4C
	npc_msg msg_0135_D47R0101_00018
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D47R0101_011:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_247
	nat_dex_flag_action 2, VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 0
	goto_if_eq _0E73
	compare VAR_UNK_4057, 6
	goto_if_lt _0E45
	npc_msg msg_0135_D47R0101_00093
	goto _0E48

_0E45:
	npc_msg msg_0135_D47R0101_00094
_0E48:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0E68
	npc_msg msg_0135_D47R0101_00095
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0E68:
	npc_msg msg_0135_D47R0101_00096
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0E73:
	npc_msg msg_0135_D47R0101_00092
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D47R0101_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_UNK_4057, 0
	goto_if_eq _0EF1
	compare VAR_UNK_4057, 1
	goto_if_eq _0EF1
	compare VAR_UNK_4057, 2
	goto_if_eq _0EF1
	compare VAR_UNK_4057, 3
	goto_if_eq _0EF1
	buffer_players_name 0
	npc_msg msg_0135_D47R0101_00027
	closemsg
	clearflag FLAG_UNK_99D
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_716
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	goto_if_set FLAG_UNK_99D, _0EFC
	releaseall
	end

_0EF1:
	npc_msg msg_0135_D47R0101_00028
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0EFC:
	scrcmd_561 0, 2, 10, 6
	play_se SEQ_SE_DP_KI_GASYAN
	npc_msg msg_0135_D47R0101_00091
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
