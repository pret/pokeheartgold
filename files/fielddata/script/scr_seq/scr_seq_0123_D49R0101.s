#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D49R0101.h"
#include "msgdata/msg/msg_0138_D49R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D49R0101_000
	scrdef scr_seq_D49R0101_001
	scrdef scr_seq_D49R0101_002
	scrdef scr_seq_D49R0101_003
	scrdef scr_seq_D49R0101_004
	scrdef scr_seq_D49R0101_005
	scrdef scr_seq_D49R0101_006
	scrdef scr_seq_D49R0101_007
	scrdef scr_seq_D49R0101_008
	scrdef scr_seq_D49R0101_009
	scrdef scr_seq_D49R0101_010
	scrdef scr_seq_D49R0101_011
	scrdef scr_seq_D49R0101_012
	scrdef scr_seq_D49R0101_013
	scrdef scr_seq_D49R0101_014
	scrdef scr_seq_D49R0101_015
	scrdef scr_seq_D49R0101_016
	scrdef scr_seq_D49R0101_017
	scrdef scr_seq_D49R0101_018
	scrdef scr_seq_D49R0101_019
	scrdef scr_seq_D49R0101_020
	scrdef scr_seq_D49R0101_021
	scrdef scr_seq_D49R0101_022
	scrdef scr_seq_D49R0101_023
	scrdef_end

scr_seq_D49R0101_023:
	setflag FLAG_SYS_FLYPOINT_POKEATHLON
	end
	.byte 0x22, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

_0070:
	step 35, 1
	step_end

_0078:
	step 33, 1
	step_end

_0080:
	step 32, 1
	step_end
scr_seq_D49R0101_000:
	scrcmd_609
	lockall
	get_player_facing VAR_TEMP_x400A
	compare VAR_TEMP_x400A, 0
	goto_if_ne _00AB
	apply_movement obj_player, _0230
	goto _00B3

_00AB:
	apply_movement obj_player, _023C
_00B3:
	wait_movement
	clearflag FLAG_HIDE_POKEATHLON_RECEPTION_WHITNEY
	show_person obj_D49R0101_gsleader3
	move_person_facing obj_D49R0101_gsleader3, 23, 0, 20, DIR_NORTH
	compare VAR_TEMP_x400A, 0
	goto_if_ne _00EC
	apply_movement obj_D49R0101_gsleader3, _0248
	apply_movement obj_player, _0260
	goto _00F4

_00EC:
	apply_movement obj_D49R0101_gsleader3, _0258
_00F4:
	wait_movement
	buffer_players_name 0
	npc_msg msg_0138_D49R0101_00080
	closemsg
	wait 30, VAR_SPECIAL_RESULT
	compare VAR_TEMP_x400A, 0
	goto_if_ne _011F
	apply_movement obj_D49R0101_gsleader3, _0200
	goto _0127

_011F:
	apply_movement obj_D49R0101_gsleader3, _0218
_0127:
	wait_movement
	npc_msg msg_0138_D49R0101_00081
	closemsg
	compare VAR_TEMP_x400A, 0
	goto_if_ne _0149
	apply_movement obj_D49R0101_gsleader3, _0270
	goto _018E

_0149:
	compare VAR_TEMP_x400A, 3
	goto_if_ne _016C
	apply_movement obj_D49R0101_gsleader3, _02AC
	apply_movement obj_player, _0070
	goto _018E

_016C:
	apply_movement obj_D49R0101_gsleader3, _02E8
	apply_movement obj_player, _0070
	wait_movement
	apply_movement obj_D49R0101_gsleader3, _0080
	apply_movement obj_player, _0078
_018E:
	wait_movement
	npc_msg msg_0138_D49R0101_00082
	closemsg
	npc_msg msg_0138_D49R0101_00083
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	npc_msg msg_0138_D49R0101_00084
	closemsg
	compare VAR_TEMP_x400A, 0
	goto_if_ne _01BE
	apply_movement obj_D49R0101_gsleader3, _0328
	goto _01E1

_01BE:
	compare VAR_TEMP_x400A, 3
	goto_if_ne _01D9
	apply_movement obj_D49R0101_gsleader3, _0338
	goto _01E1

_01D9:
	apply_movement obj_D49R0101_gsleader3, _0348
_01E1:
	apply_movement obj_player, _0078
	wait_movement
	hide_person obj_D49R0101_gsleader3
	setflag FLAG_HIDE_POKEATHLON_RECEPTION_WHITNEY
	releaseall
	setvar VAR_UNK_40E2, 1
	end
	.byte 0x00, 0x00, 0x00

_0200:
	step 71, 1
	step 55, 1
	step 72, 1
	step 65, 2
	step 18, 1
	step_end

_0218:
	step 71, 1
	step 53, 1
	step 72, 1
	step 65, 2
	step 16, 1
	step_end

_0230:
	step 75, 1
	step 33, 1
	step_end

_023C:
	step 75, 1
	step 33, 1
	step_end

_0248:
	step 23, 1
	step 76, 10
	step 34, 1
	step_end

_0258:
	step 76, 9
	step_end

_0260:
	step 61, 1
	step 63, 8
	step 35, 1
	step_end

_0270:
	step 33, 1
	step 63, 1
	step 32, 1
	step 63, 1
	step 19, 6
	step 16, 6
	step 14, 1
	step 69, 1
	step 65, 2
	step 3, 1
	step 70, 1
	step 15, 1
	step 17, 6
	step 18, 6
	step_end

_02AC:
	step 19, 7
	step 33, 1
	step 63, 1
	step 32, 1
	step 63, 1
	step 16, 7
	step 14, 1
	step 69, 1
	step 65, 2
	step 3, 1
	step 70, 1
	step 15, 1
	step 17, 6
	step 18, 6
	step_end

_02E8:
	step 19, 7
	step 33, 1
	step 63, 1
	step 32, 1
	step 63, 1
	step 16, 7
	step 14, 1
	step 69, 1
	step 65, 2
	step 3, 1
	step 70, 1
	step 15, 1
	step 17, 7
	step 18, 7
	step 32, 1
	step_end

_0328:
	step 77, 2
	step 78, 1
	step 77, 8
	step_end

_0338:
	step 77, 1
	step 78, 1
	step 77, 9
	step_end

_0348:
	step 77, 9
	step_end
scr_seq_D49R0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_unset FLAG_UNK_114, _03F1
	scrcmd_834 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0400
	npc_msg msg_0138_D49R0101_00049
_0377:
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add 325, 255, 0
	menu_item_add 324, 255, 1
	menu_item_add 323, 255, 2
	menu_exec
	switch VAR_SPECIAL_RESULT
	case 0, _03C7
	case 1, _03D7
	goto _03E4
	.byte 0x35, 0x00, 0x61, 0x00, 0x02, 0x00
_03C7:
	holdmsg
	scrcmd_815 0
	scrcmd_771
	goto _03E4
	.byte 0x02, 0x00
_03D7:
	touchscreen_menu_show
	npc_msg msg_0138_D49R0101_00052
	goto _0377
	.byte 0x02, 0x00
_03E4:
	touchscreen_menu_show
	npc_msg msg_0138_D49R0101_00051
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_03F1:
	npc_msg msg_0138_D49R0101_00048
	setflag FLAG_UNK_114
	goto _0377
	.byte 0x02, 0x00
_0400:
	npc_msg msg_0138_D49R0101_00050
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D49R0101_002:
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 2
	goto_if_eq _05B7
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_835 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 27
	goto_if_eq _05A9
	goto_if_unset FLAG_UNK_115, _0529
	npc_msg msg_0138_D49R0101_00054
_0443:
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add 325, 255, 0
	menu_item_add 324, 255, 1
	menu_item_add 323, 255, 2
	menu_exec
	switch VAR_SPECIAL_RESULT
	case 0, _0493
	case 1, _04E8
	goto _051C
	.byte 0x35, 0x00, 0x61
	.byte 0x00, 0x02, 0x00
_0493:
	holdmsg
	scrcmd_815 0
	scrcmd_772
	scrcmd_835 VAR_SPECIAL_x8005
	compare VAR_SPECIAL_x8005, 6
	goto_if_eq _0538
	compare VAR_SPECIAL_x8005, 12
	goto_if_eq _054B
	compare VAR_SPECIAL_x8005, 18
	goto_if_eq _055E
	compare VAR_SPECIAL_x8005, 24
	goto_if_eq _0571
	compare VAR_SPECIAL_x8005, 27
	goto_if_eq _0595
	goto _051C
	.byte 0x02, 0x00
_04E8:
	touchscreen_menu_show
	npc_msg msg_0138_D49R0101_00055
	scrcmd_724 12, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 100
	goto_if_lt _0509
	npc_msg msg_0138_D49R0101_00057
	goto _0511

_0509:
	buffer_int 0, VAR_SPECIAL_RESULT
	npc_msg msg_0138_D49R0101_00056
_0511:
	npc_msg msg_0138_D49R0101_00058
	goto _0443
	.byte 0x02, 0x00
_051C:
	touchscreen_menu_show
	npc_msg msg_0138_D49R0101_00051
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0529:
	npc_msg msg_0138_D49R0101_00053
	setflag FLAG_UNK_115
	goto _0443
	.byte 0x02, 0x00
_0538:
	compare VAR_UNK_4139, 0
	goto_if_eq _0584
	goto _051C

_054B:
	compare VAR_UNK_4139, 1
	goto_if_eq _0584
	goto _051C

_055E:
	compare VAR_UNK_4139, 2
	goto_if_eq _0584
	goto _051C

_0571:
	compare VAR_UNK_4139, 3
	goto_if_eq _0584
	goto _051C

_0584:
	npc_msg msg_0138_D49R0101_00061
	wait_button_or_walk_away
	closemsg
	releaseall
	addvar VAR_UNK_4139, 1
	end

_0595:
	buffer_players_name 0
	npc_msg msg_0138_D49R0101_00062
	wait_button_or_walk_away
	closemsg
	releaseall
	addvar VAR_UNK_4139, 1
	end

_05A9:
	buffer_players_name 0
	npc_msg msg_0138_D49R0101_00060
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_05B7:
	end

scr_seq_D49R0101_003:
	end

scr_seq_D49R0101_004:
	simple_npc_msg msg_0138_D49R0101_00068
	end

scr_seq_D49R0101_005:
	simple_npc_msg msg_0138_D49R0101_00069
	end

scr_seq_D49R0101_006:
	simple_npc_msg msg_0138_D49R0101_00070
	end

scr_seq_D49R0101_007:
	simple_npc_msg msg_0138_D49R0101_00071
	end

scr_seq_D49R0101_008:
	simple_npc_msg msg_0138_D49R0101_00072
	end

scr_seq_D49R0101_009:
	simple_npc_msg msg_0138_D49R0101_00073
	end

scr_seq_D49R0101_010:
	simple_npc_msg msg_0138_D49R0101_00074
	end

scr_seq_D49R0101_011:
	simple_npc_msg msg_0138_D49R0101_00075
	end

scr_seq_D49R0101_012:
	simple_npc_msg msg_0138_D49R0101_00076
	end

scr_seq_D49R0101_013:
	simple_npc_msg msg_0138_D49R0101_00077
	end

scr_seq_D49R0101_015:
	simple_npc_msg msg_0138_D49R0101_00063
	end

scr_seq_D49R0101_016:
	simple_npc_msg msg_0138_D49R0101_00064
	end

scr_seq_D49R0101_017:
	simple_npc_msg msg_0138_D49R0101_00065
	end

scr_seq_D49R0101_018:
	simple_npc_msg msg_0138_D49R0101_00066
	end

scr_seq_D49R0101_019:
	simple_npc_msg msg_0138_D49R0101_00067
	end

scr_seq_D49R0101_014:
	play_se SEQ_SE_DP_SELECT
	lockall
	script_overlay_cmd 3, 0
	npc_msg msg_0138_D49R0101_00085
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x8000
	menu_item_add 337, 255, 0
	menu_item_add 338, 255, 1
	menu_item_add 12, 255, 2
	menu_exec
	copyvar VAR_TEMP_x4005, VAR_SPECIAL_x8000
	compare VAR_TEMP_x4005, 0
	goto_if_ne _072E
	show_money_box 20, 2
	goto _0759
	.byte 0x16, 0x00, 0x1a, 0x00, 0x00, 0x00
_072E:
	compare VAR_TEMP_x4005, 1
	goto_if_ne _0748
	scrcmd_116 2, 20, 2
	goto _0A7F

_0748:
	touchscreen_menu_show
	npc_msg msg_0138_D49R0101_00091
	wait_button_or_walk_away
	closemsg
	releaseall
	script_overlay_cmd 3, 1
	end

_0759:
	npc_msg msg_0138_D49R0101_00086
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x8000
	menu_item_add 209, 255, 0
	menu_item_add 210, 255, 1
	menu_item_add 211, 255, 2
	menu_item_add 212, 255, 3
	menu_exec
	switch VAR_SPECIAL_x8000
	case 0, _07C0
	case 1, _07CC
	case 2, _07D8
	touchscreen_menu_show
	npc_msg msg_0138_D49R0101_00091
	goto _0A5C

_07C0:
	setvar VAR_SPECIAL_x8001, 30
	goto _08F8

_07CC:
	setvar VAR_SPECIAL_x8001, 31
	goto _08F8

_07D8:
	setvar VAR_SPECIAL_x8001, 32
	goto _08F8

_07E4:
	compare VAR_TEMP_x4005, 0
	goto_if_ne _07FF
	hasenoughmoneyimmediate VAR_SPECIAL_RESULT, 200
	goto _0812

_07FF:
	compare VAR_TEMP_x4005, 1
	goto_if_ne _0812
	check_athlete_points VAR_SPECIAL_RESULT, 50
_0812:
	return

_0814:
	compare VAR_TEMP_x4005, 0
	goto_if_ne _082F
	hasenoughmoneyimmediate VAR_SPECIAL_RESULT, 300
	goto _0842

_082F:
	compare VAR_TEMP_x4005, 1
	goto_if_ne _0842
	check_athlete_points VAR_SPECIAL_RESULT, 80
_0842:
	return

_0844:
	compare VAR_TEMP_x4005, 0
	goto_if_ne _085F
	hasenoughmoneyimmediate VAR_SPECIAL_RESULT, 350
	goto _0872

_085F:
	compare VAR_TEMP_x4005, 1
	goto_if_ne _0872
	check_athlete_points VAR_SPECIAL_RESULT, 100
_0872:
	return

_0874:
	compare VAR_TEMP_x4005, 0
	goto_if_ne _088D
	submoneyimmediate 200
	goto _089E

_088D:
	compare VAR_TEMP_x4005, 1
	goto_if_ne _089E
	take_athlete_points 50
_089E:
	return

_08A0:
	compare VAR_TEMP_x4005, 0
	goto_if_ne _08B9
	submoneyimmediate 300
	goto _08CA

_08B9:
	compare VAR_TEMP_x4005, 1
	goto_if_ne _08CA
	take_athlete_points 80
_08CA:
	return

_08CC:
	compare VAR_TEMP_x4005, 0
	goto_if_ne _08E5
	submoneyimmediate 350
	goto _08F6

_08E5:
	compare VAR_TEMP_x4005, 1
	goto_if_ne _08F6
	take_athlete_points 100
_08F6:
	return

_08F8:
	compare VAR_SPECIAL_x8000, 0
	call_if_eq _07E4
	compare VAR_SPECIAL_x8000, 1
	call_if_eq _0814
	compare VAR_SPECIAL_x8000, 2
	call_if_eq _0844
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0A07
	hasspaceforitem VAR_SPECIAL_x8001, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0A35
	compare VAR_SPECIAL_x8000, 0
	call_if_eq _0874
	compare VAR_SPECIAL_x8000, 1
	call_if_eq _08A0
	compare VAR_SPECIAL_x8000, 2
	call_if_eq _08CC
	compare VAR_TEMP_x4005, 0
	goto_if_ne _097D
	update_money_box
	goto _098D

_097D:
	compare VAR_TEMP_x4005, 1
	goto_if_ne _098D
	scrcmd_118 2
_098D:
	buffer_item_name 0, VAR_SPECIAL_x8001
	play_se SEQ_SE_DP_JIHANKI
	buffer_item_name 0, VAR_SPECIAL_x8001
	npc_msg msg_0138_D49R0101_00087
	giveitem_no_check VAR_SPECIAL_x8001, 1
	random VAR_SPECIAL_RESULT, 64
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _09E6
	play_se SEQ_SE_DP_JIHANKI
	buffer_item_name 0, VAR_SPECIAL_x8001
	npc_msg msg_0138_D49R0101_00088
	hasspaceforitem VAR_SPECIAL_x8001, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0A35
	callstd std_give_item_verbose
_09E6:
	compare VAR_TEMP_x4005, 0
	goto_if_ne _09FF
	goto _0759
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
_09FF:
	goto _0A7F
	.byte 0x02, 0x00
_0A07:
	touchscreen_menu_show
	compare VAR_TEMP_x4005, 0
	goto_if_ne _0A1F
	npc_msg msg_0138_D49R0101_00089
	goto _0A2F

_0A1F:
	compare VAR_TEMP_x4005, 1
	goto_if_ne _0A2F
	npc_msg msg_0138_D49R0101_00090
_0A2F:
	goto _0A5C

_0A35:
	touchscreen_menu_show
	callstd std_bag_is_full
	closemsg
	compare VAR_TEMP_x4005, 0
	goto_if_ne _0A52
	hide_money_box
	goto _0A54

_0A52:
	scrcmd_117
_0A54:
	script_overlay_cmd 3, 1
	releaseall
	end

_0A5C:
	wait_button_or_walk_away
	closemsg
	compare VAR_TEMP_x4005, 0
	goto_if_ne _0A75
	hide_money_box
	goto _0A77

_0A75:
	scrcmd_117
_0A77:
	script_overlay_cmd 3, 1
	releaseall
	end

_0A7F:
	npc_msg msg_0138_D49R0101_00086
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x8000
	menu_item_add 339, 255, 0
	menu_item_add 340, 255, 1
	menu_item_add 341, 255, 2
	menu_item_add 212, 255, 3
	menu_exec
	switch VAR_SPECIAL_x8000
	case 0, _07C0
	case 1, _07CC
	case 2, _07D8
	touchscreen_menu_show
	npc_msg msg_0138_D49R0101_00091
	goto _0A5C
	.byte 0x02, 0x00
scr_seq_D49R0101_020:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0138_D49R0101_00092
_0AF3:
	npc_msg msg_0138_D49R0101_00093
	touchscreen_menu_hide
	menu_init 1, 1, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add 94, 255, 0
	menu_item_add 95, 255, 1
	menu_item_add 96, 255, 2
	menu_item_add 97, 255, 3
	menu_exec
	switch VAR_SPECIAL_RESULT
	case 0, _0B57
	case 1, _0B65
	case 2, _0B73
	goto _0BA5
	.byte 0x02, 0x00
_0B57:
	setvar VAR_TEMP_x4007, 0
	goto _0B81
	.byte 0x02, 0x00
_0B65:
	setvar VAR_TEMP_x4007, 1
	goto _0B81
	.byte 0x02, 0x00
_0B73:
	setvar VAR_TEMP_x4007, 2
	goto _0B81
	.byte 0x02
	.byte 0x00
_0B81:
	npc_msg msg_0138_D49R0101_00098
	wait 4, VAR_SPECIAL_RESULT
	npc_msg msg_0138_D49R0101_00099
	wait 4, VAR_SPECIAL_RESULT
	closemsg
	play_se SEQ_SE_DP_DECIDE
	scrcmd_743 VAR_TEMP_x4007
	goto _0AF3
	.byte 0x02, 0x00
_0BA5:
	touchscreen_menu_show
	npc_msg msg_0138_D49R0101_00101
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D49R0101_021:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_152, _0C4C
	npc_msg msg_0138_D49R0101_00103
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0BFE
	npc_msg msg_0138_D49R0101_00105
	scrcmd_724 14, VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 1000
	goto_if_ge _0C09
	npc_msg msg_0138_D49R0101_00106
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0BFE:
	npc_msg msg_0138_D49R0101_00104
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0C09:
	npc_msg msg_0138_D49R0101_00107
	goto_if_no_item_space ITEM_RARE_CANDY, 1, _0C42
	callstd std_give_item_verbose
	scrcmd_725 0, 100
	setflag FLAG_UNK_152
	goto _0C4C
	.byte 0x02, 0x00
_0C42:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

_0C4C:
	npc_msg msg_0138_D49R0101_00108
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D49R0101_022:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_153, _0CF0
	scrcmd_724 15, VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 500
	goto_if_ge _0C86
	npc_msg msg_0138_D49R0101_00109
	goto _0C9F

_0C86:
	compare VAR_TEMP_x4000, 1000
	goto_if_ge _0C9C
	npc_msg msg_0138_D49R0101_00111
	goto _0C9F

_0C9C:
	npc_msg msg_0138_D49R0101_00112
_0C9F:
	compare VAR_TEMP_x4000, 2001
	goto_if_ge _0CB7
	npc_msg msg_0138_D49R0101_00110
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0CB7:
	npc_msg msg_0138_D49R0101_00113
	goto_if_no_item_space ITEM_RARE_CANDY, 1, _0C42
	callstd std_give_item_verbose
	scrcmd_725 0, 100
	setflag FLAG_UNK_153
	goto _0CF0
	.byte 0x02, 0x00
_0CF0:
	npc_msg msg_0138_D49R0101_00114
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
