#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D32R0401.h"
#include "msgdata/msg/msg_0108_D32R0401.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D32R0401_000
	scrdef scr_seq_D32R0401_001
	scrdef scr_seq_D32R0401_002
	scrdef scr_seq_D32R0401_003
	scrdef scr_seq_D32R0401_004
	scrdef scr_seq_D32R0401_005
	scrdef scr_seq_D32R0401_006
	scrdef scr_seq_D32R0401_007
	scrdef scr_seq_D32R0401_008
	scrdef scr_seq_D32R0401_009
	scrdef scr_seq_D32R0401_010
	scrdef scr_seq_D32R0401_011
	scrdef scr_seq_D32R0401_012
	scrdef scr_seq_D32R0401_013
	scrdef scr_seq_D32R0401_014
	scrdef scr_seq_D32R0401_015
	scrdef scr_seq_D32R0401_016
	scrdef scr_seq_D32R0401_017
	scrdef scr_seq_D32R0401_018
	scrdef scr_seq_D32R0401_019
	scrdef scr_seq_D32R0401_020
	scrdef scr_seq_D32R0401_021
	scrdef_end

scr_seq_D32R0401_021:
	battle_hall_count_used_species VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 11
	call_if_ge _0090
	compare VAR_TEMP_x4000, 101
	call_if_ge _007A
	end

_007A:
	move_person obj_D32R0401_var_10, 8, 11
	move_person_facing obj_D32R0401_var_10, 8, 0, 11, DIR_WEST
	return

_0090:
	move_person obj_D32R0401_var_10, 13, 11
	move_person_facing obj_D32R0401_var_10, 13, 0, 11, DIR_WEST
	return

scr_seq_D32R0401_020:
	compare VAR_UNK_4145, 1
	goto_if_eq _00B5
	end

_00B5:
	random VAR_TEMP_x4007, 100
	call_if_unset FLAG_UNK_234, _00D5
	compare VAR_TEMP_x4007, 30
	goto_if_lt _00DF
	end

_00D5:
	hide_person obj_D32R0401_var_2
	setflag FLAG_UNK_234
	return

_00DF:
	goto_if_unset FLAG_UNK_AA1, _00EC
	end

_00EC:
	setflag FLAG_UNK_AA1
	battle_hall_get_total_streak VAR_TEMP_x4008
	compare VAR_TEMP_x4008, 10000
	goto_if_ge _011D
	compare VAR_TEMP_x4008, 1000
	goto_if_ge _012B
	compare VAR_TEMP_x4008, 500
	goto_if_ge _0139
	end

_011D:
	random VAR_UNK_4053, 4
	goto _0147
	.byte 0x02, 0x00
_012B:
	random VAR_UNK_4053, 2
	goto _0147
	.byte 0x02, 0x00
_0139:
	setvar VAR_UNK_4053, 0
	goto _0147
	.byte 0x02, 0x00
_0147:
	clearflag FLAG_UNK_234
	call _017D
	show_person obj_D32R0401_var_2
	end

scr_seq_D32R0401_015:
	get_player_gender VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 0
	call_if_eq _01FB
	compare VAR_TEMP_x4000, 1
	call_if_eq _0203
	call _017D
	end

_017D:
	compare VAR_UNK_4053, 0
	call_if_eq _01B3
	compare VAR_UNK_4053, 1
	call_if_eq _01E3
	compare VAR_UNK_4053, 2
	call_if_eq _01EB
	compare VAR_UNK_4053, 3
	call_if_eq _01F3
	return

_01B3:
	get_player_gender VAR_TEMP_x4009
	compare VAR_TEMP_x4009, 0
	goto_if_eq _01D3
	compare VAR_TEMP_x4009, 1
	goto_if_eq _01DB
	return

_01D3:
	setvar VAR_OBJ_1, 97
	return

_01DB:
	setvar VAR_OBJ_1, 0
	return

_01E3:
	setvar VAR_OBJ_1, 365
	return

_01EB:
	setvar VAR_OBJ_1, 366
	return

_01F3:
	setvar VAR_OBJ_1, 354
	return

_01FB:
	setvar VAR_OBJ_9, 320
	return

_0203:
	setvar VAR_OBJ_9, 317
	return

scr_seq_D32R0401_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4003, 0
	setvar VAR_TEMP_x4004, 0
	goto _0243
	.byte 0x02, 0x00
scr_seq_D32R0401_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4003, 0
	setvar VAR_TEMP_x4004, 1
	goto _0243
	.byte 0x02, 0x00
_0243:
	scrcmd_682 0
	compare VAR_TEMP_x4004, 0
	call_if_eq _0868
	compare VAR_TEMP_x4004, 1
	call_if_eq _086D
	goto _0269
	.byte 0x02, 0x00
_0269:
	compare VAR_TEMP_x4004, 0
	call_if_eq _0872
	compare VAR_TEMP_x4004, 1
	call_if_eq _0891
	menu_item_add 19, 255, 2
	menu_item_add 20, 255, 3
	menu_exec
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _030E
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0331
	compare VAR_SPECIAL_RESULT, 2
	goto_if_eq _02D3
	compare VAR_SPECIAL_RESULT, 4
	goto_if_eq _0354
	touchscreen_menu_show
	goto _02F5
	.byte 0x02, 0x00
_02D3:
	compare VAR_TEMP_x4004, 0
	call_if_eq _08A8
	compare VAR_TEMP_x4004, 1
	call_if_eq _08AD
	goto _0269
	.byte 0x02, 0x00
_02F5:
	goto _02FD
	.byte 0x02, 0x00
_02FD:
	setvar VAR_UNK_4145, 0
	npc_msg msg_0108_D32R0401_00006
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_030E:
	setvar VAR_UNK_4146, 0
	scrcmd_633 0, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0377
	goto _03A1
	.byte 0x02
	.byte 0x00
_0331:
	setvar VAR_UNK_4146, 1
	scrcmd_633 0, 2, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _038C
	goto _03A1
	.byte 0x02, 0x00
_0354:
	setvar VAR_UNK_4146, 2
	scrcmd_633 0, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0377
	goto _03A1
	.byte 0x02, 0x00
_0377:
	npc_msg msg_0108_D32R0401_00035
	scrcmd_444 37, 1, 0, 0
	touchscreen_menu_show
	goto _02F5
	.byte 0x02, 0x00
_038C:
	npc_msg msg_0108_D32R0401_00036
	scrcmd_444 37, 2, 0, 0
	touchscreen_menu_show
	goto _02F5
	.byte 0x02
	.byte 0x00
_03A1:
	npc_msg msg_0108_D32R0401_00033
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_633 4, VAR_UNK_4146, VAR_SPECIAL_RESULT
	scrcmd_635 VAR_TEMP_x4002, VAR_TEMP_x4005
	compare VAR_TEMP_x4002, 255
	goto_if_ne _03D1
	scrcmd_815 0
_03D1:
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	compare VAR_TEMP_x4002, 255
	goto_if_eq _02F5
	day_care_sanitize_mon VAR_TEMP_x4002, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 255
	goto_if_eq _07B9
	compare VAR_UNK_4146, 1
	goto_if_eq _0414
	goto _042F
	.byte 0x02, 0x00
_0414:
	day_care_sanitize_mon VAR_TEMP_x4005, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 255
	goto_if_eq _07B9
	goto _042F
	.byte 0x02, 0x00
_042F:
	get_partymon_species VAR_TEMP_x4002, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 0
	goto_if_ne _044A
	touchscreen_menu_show
	goto _02F5

_044A:
	scrcmd_633 1, VAR_UNK_4146, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _04D8
	scrcmd_633 2, VAR_UNK_4146, VAR_SPECIAL_RESULT
	buffer_species_name 0, VAR_SPECIAL_RESULT, 0, 0
	compare VAR_SPECIAL_RESULT, VAR_TEMP_x4001
	goto_if_eq _04D8
	goto _0484
	.byte 0x02, 0x00
_0484:
	buffer_species_name 1, VAR_TEMP_x4001, 0, 0
	npc_msg msg_0108_D32R0401_00034
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 1, 1, VAR_SPECIAL_RESULT
	menu_item_add 42, 255, 0
	menu_item_add 43, 255, 1
	menu_exec
	switch VAR_SPECIAL_RESULT
	case 0, _04C8
	touchscreen_menu_show
	goto _02F5
	.byte 0x02, 0x00
_04C8:
	scrcmd_633 3, VAR_UNK_4146, VAR_SPECIAL_RESULT
	goto _04D8
	.byte 0x02, 0x00
_04D8:
	goto _04E0
	.byte 0x02, 0x00
_04E0:
	compare VAR_UNK_4146, 0
	call_if_eq _066C
	compare VAR_UNK_4146, 1
	call_if_eq _066C
	setvar VAR_TEMP_x4000, 0
	heal_party
	callstd std_prompt_save
	copyvar VAR_SPECIAL_RESULT, VAR_TEMP_x4000
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _02F5
	compare VAR_UNK_4146, 2
	goto_if_eq _052E
	goto _0689
	.byte 0x02, 0x00
_052E:
	npc_msg msg_0108_D32R0401_00030
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add 14, 255, 0
	menu_item_add 15, 255, 1
	menu_item_add 5, 255, 2
	menu_exec
	switch VAR_SPECIAL_RESULT
	case 0, _057F
	case 1, _05D7
	touchscreen_menu_show
	goto _02F5
	.byte 0x02, 0x00
_057F:
	npc_msg msg_0108_D32R0401_00031
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _052E
	touchscreen_menu_show
	closemsg
	scrcmd_226 30, 0, 0, VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _05C5
	compare VAR_SPECIAL_RESULT, 3
	goto_if_eq _05CD
	goto _062F
	.byte 0x02, 0x00
_05C5:
	goto _052E
	.byte 0x02, 0x00
_05CD:
	scrcmd_283
	goto _052E
	.byte 0x02, 0x00
_05D7:
	npc_msg msg_0108_D32R0401_00031
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _052E
	touchscreen_menu_show
	closemsg
	scrcmd_227 30, 0, 0, VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _061D
	compare VAR_SPECIAL_RESULT, 3
	goto_if_eq _0625
	goto _062F
	.byte 0x02, 0x00
_061D:
	goto _052E
	.byte 0x02, 0x00
_0625:
	scrcmd_283
	goto _052E
	.byte 0x02, 0x00
_062F:
	scrcmd_258
	scrcmd_257 108
	scrcmd_634 VAR_TEMP_x4001, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0674
	scrcmd_258
	scrcmd_257 110
	npc_msg msg_0108_D32R0401_00032
	compare VAR_UNK_4146, 2
	call_if_eq _066C
	call _08D9
	goto _0689
	.byte 0x02, 0x00
_066C:
	setvar VAR_UNK_4145, 255
	return

_0674:
	call _0685
	npc_msg msg_0108_D32R0401_00057
	goto _02F5
	.byte 0x02, 0x00
_0685:
	scrcmd_283
	return

_0689:
	compare VAR_UNK_4146, 0
	call_if_eq _0721
	compare VAR_UNK_4146, 1
	call_if_eq _073C
	compare VAR_UNK_4146, 2
	call_if_eq _0757
	play_se SEQ_SE_DP_KAIDAN2
	goto _06BC
	.byte 0x02, 0x00
_06BC:
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_815 0
	compare VAR_UNK_4146, 0
	call_if_eq _077D
	compare VAR_UNK_4146, 1
	call_if_eq _0791
	compare VAR_UNK_4146, 2
	call_if_eq _07A5
	scrcmd_420 59
	scrcmd_436
	scrcmd_627 9
	compare VAR_UNK_4146, 2
	call_if_eq _071D
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	scrcmd_682 1
	end

_071D:
	scrcmd_283
	return

_0721:
	npc_msg msg_0108_D32R0401_00009
	wait_button
	closemsg
	apply_movement obj_player, _07C8
	apply_movement VAR_SPECIAL_LAST_TALKED, _07F0
	wait_movement
	return

_073C:
	npc_msg msg_0108_D32R0401_00009
	wait_button
	closemsg
	apply_movement obj_player, _07C8
	apply_movement VAR_SPECIAL_LAST_TALKED, _07F0
	wait_movement
	return

_0757:
	npc_msg_var msg_0108_D32R0401_00009
	wait 10, VAR_SPECIAL_RESULT
	scrcmd_258
	scrcmd_257 109
	closemsg
	apply_movement obj_player, _07D8
	apply_movement VAR_SPECIAL_LAST_TALKED, _0800
	wait_movement
	return

_077D:
	apply_movement obj_player, _0818
	apply_movement VAR_SPECIAL_LAST_TALKED, _0848
	wait_movement
	return

_0791:
	apply_movement obj_player, _0818
	apply_movement VAR_SPECIAL_LAST_TALKED, _0848
	wait_movement
	return

_07A5:
	apply_movement obj_player, _082C
	apply_movement VAR_SPECIAL_LAST_TALKED, _0858
	wait_movement
	return

_07B9:
	touchscreen_menu_show
	setvar VAR_UNK_4145, 0
	callstd std_bag_is_full_griseous_orb
	end
	.byte 0x00

_07C8:
	step 14, 4
	step 13, 3
	step 69, 1
	step_end

_07D8:
	step 14, 2
	step 12, 1
	step 14, 2
	step 13, 3
	step 69, 1
	step_end

_07F0:
	step 14, 3
	step 13, 3
	step 69, 1
	step_end

_0800:
	step 14, 1
	step 12, 1
	step 14, 2
	step 13, 3
	step 69, 1
	step_end

_0818:
	step 23, 4
	step 20, 3
	step 2, 1
	step 70, 1
	step_end

_082C:
	step 23, 2
	step 21, 1
	step 23, 2
	step 20, 3
	step 2, 1
	step 70, 1
	step_end

_0848:
	step 20, 3
	step 23, 3
	step 70, 1
	step_end

_0858:
	step 20, 2
	step 23, 3
	step 70, 1
	step_end
_0868:
	npc_msg msg_0108_D32R0401_00000
	return

_086D:
	npc_msg msg_0108_D32R0401_00003
	return

_0872:
	npc_msg msg_0108_D32R0401_00001
	touchscreen_menu_hide
	menu_init 1, 1, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add 16, 255, 0
	menu_item_add 17, 255, 1
	return

_0891:
	npc_msg msg_0108_D32R0401_00004
	touchscreen_menu_hide
	menu_init 1, 1, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add 18, 255, 4
	return

_08A8:
	npc_msg msg_0108_D32R0401_00002
	return

_08AD:
	npc_msg msg_0108_D32R0401_00005
	return

scr_seq_D32R0401_001:
	scrcmd_682 0
	setvar VAR_TEMP_x4003, 1
	setvar VAR_UNK_4145, 0
	npc_msg msg_0108_D32R0401_00011
	call _066C
	call _08D9
	goto _0689
	.byte 0x02, 0x00
_08D9:
	add_waiting_icon
	save_game_normal VAR_SPECIAL_RESULT
	remove_waiting_icon
	play_se SEQ_SE_DP_SAVE
	wait_se SEQ_SE_DP_SAVE
	return

scr_seq_D32R0401_002:
	npc_msg msg_0108_D32R0401_00012
	scrcmd_636 VAR_UNK_4146
	compare VAR_BATTLE_HALL_PRINT_PROGRESS, 1
	call_if_eq _0914
	compare VAR_BATTLE_HALL_PRINT_PROGRESS, 3
	call_if_eq _091C
	goto _02F5
	.byte 0x02, 0x00
_0914:
	setvar VAR_BATTLE_HALL_PRINT_PROGRESS, 0
	return

_091C:
	setvar VAR_BATTLE_HALL_PRINT_PROGRESS, 2
	return

scr_seq_D32R0401_003:
	compare VAR_UNK_4146, 0
	call_if_eq _0960
	compare VAR_UNK_4146, 1
	call_if_eq _0960
	compare VAR_BATTLE_HALL_PRINT_PROGRESS, 1
	call_if_eq _0966
	compare VAR_BATTLE_HALL_PRINT_PROGRESS, 3
	call_if_eq _097D
	goto _02F5
	.byte 0x02, 0x00
_0960:
	add_special_game_stat_2 29
	return

_0966:
	npc_msg msg_0108_D32R0401_00013
	buffer_players_name 0
	npc_msg msg_0108_D32R0401_00015
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setvar VAR_BATTLE_HALL_PRINT_PROGRESS, 2
	return

_097D:
	npc_msg msg_0108_D32R0401_00013
	buffer_players_name 0
	npc_msg msg_0108_D32R0401_00014
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setvar VAR_BATTLE_HALL_PRINT_PROGRESS, 4
	callstd std_frontier_gold_prints_check
	return

scr_seq_D32R0401_004:
	goto _02F5
	.byte 0x02, 0x00
	.byte 0x0c, 0x00, 0x02, 0x00, 0x3f, 0x00, 0x01, 0x00, 0x0c, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
	.byte 0x0c, 0x00, 0x02, 0x00, 0x3f, 0x00, 0x01, 0x00, 0x0c, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_D32R0401_006:
	simple_npc_msg msg_0108_D32R0401_00059
	end

scr_seq_D32R0401_007:
	simple_npc_msg msg_0108_D32R0401_00060
	end

scr_seq_D32R0401_008:
	simple_npc_msg msg_0108_D32R0401_00061
	end

scr_seq_D32R0401_009:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	wait_se SEQ_SE_DP_SELECT
	play_cry SPECIES_SLOWBRO, 0
	npc_msg msg_0108_D32R0401_00062
	wait_cry
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D32R0401_010:
	simple_npc_msg msg_0108_D32R0401_00063
	end

scr_seq_D32R0401_011:
	simple_npc_msg msg_0108_D32R0401_00064
	end

scr_seq_D32R0401_012:
	simple_npc_msg msg_0108_D32R0401_00065
	end

scr_seq_D32R0401_013:
	simple_npc_msg msg_0108_D32R0401_00066
	end

scr_seq_D32R0401_014:
	simple_npc_msg msg_0108_D32R0401_00067
	end

scr_seq_D32R0401_016:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_unset FLAG_MET_HALL_STREAK_TRACKER_DUDE, _0AFF
	buffer_battle_hall_streak 1, 2, 3, 4, VAR_UNK_4054, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0AD5
	compare VAR_SPECIAL_RESULT, 2
	goto_if_eq _0AE0
	compare VAR_SPECIAL_RESULT, 3
	goto_if_eq _0AF1
	buffer_players_name 0
	npc_msg msg_0108_D32R0401_00069
	npc_msg msg_0108_D32R0401_00070
	play_fanfare SEQ_ME_BPGET
	npc_msg msg_0108_D32R0401_00072
	wait_fanfare
	goto _0B0E
	.byte 0x02, 0x00
_0AD5:
	npc_msg msg_0108_D32R0401_00068
	goto _0B0E
	.byte 0x02, 0x00
_0AE0:
	buffer_players_name 0
	npc_msg msg_0108_D32R0401_00073
	npc_msg msg_0108_D32R0401_00071
	goto _0B0E
	.byte 0x02
	.byte 0x00
_0AF1:
	buffer_players_name 0
	npc_msg msg_0108_D32R0401_00074
	goto _0B0E
	.byte 0x02, 0x00
_0AFF:
	setflag FLAG_MET_HALL_STREAK_TRACKER_DUDE
	npc_msg msg_0108_D32R0401_00068
	goto _0B0E
	.byte 0x02, 0x00
_0B0E:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D32R0401_017:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_player_gender VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0C4A
	goto _0B37
	.byte 0x02, 0x00
_0B37:
	buffer_players_name 0
	battle_hall_count_used_species VAR_SPECIAL_x8005
	compare VAR_SPECIAL_x8005, 475
	goto_if_ge _0BBE
	compare VAR_SPECIAL_x8005, 351
	goto_if_ge _0BC9
	compare VAR_SPECIAL_x8005, 251
	goto_if_ge _0BD4
	compare VAR_SPECIAL_x8005, 151
	goto_if_ge _0BDF
	compare VAR_SPECIAL_x8005, 101
	goto_if_ge _0BEA
	compare VAR_SPECIAL_x8005, 51
	goto_if_ge _0BF5
	compare VAR_SPECIAL_x8005, 31
	goto_if_ge _0C00
	compare VAR_SPECIAL_x8005, 11
	goto_if_ge _0C0B
	compare VAR_SPECIAL_x8005, 1
	goto_if_ge _0C16
	npc_msg msg_0108_D32R0401_00075
	goto _0C21
	.byte 0x02, 0x00
_0BBE:
	npc_msg msg_0108_D32R0401_00084
	goto _0C21
	.byte 0x02, 0x00
_0BC9:
	npc_msg msg_0108_D32R0401_00083
	goto _0C21
	.byte 0x02, 0x00
_0BD4:
	npc_msg msg_0108_D32R0401_00082
	goto _0C21
	.byte 0x02, 0x00
_0BDF:
	npc_msg msg_0108_D32R0401_00081
	goto _0C21
	.byte 0x02, 0x00
_0BEA:
	npc_msg msg_0108_D32R0401_00080
	goto _0C21
	.byte 0x02, 0x00
_0BF5:
	npc_msg msg_0108_D32R0401_00079
	goto _0C21
	.byte 0x02, 0x00
_0C00:
	npc_msg msg_0108_D32R0401_00078
	goto _0C21
	.byte 0x02, 0x00
_0C0B:
	npc_msg msg_0108_D32R0401_00077
	goto _0C21
	.byte 0x02, 0x00
_0C16:
	npc_msg msg_0108_D32R0401_00076
	goto _0C21
	.byte 0x02
	.byte 0x00
_0C21:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D32R0401_018:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_player_gender VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0B37
	goto _0C4A
	.byte 0x02, 0x00
_0C4A:
	buffer_players_name 0
	battle_hall_count_used_species VAR_SPECIAL_x8005
	compare VAR_SPECIAL_x8005, 475
	goto_if_ge _0CD1
	compare VAR_SPECIAL_x8005, 351
	goto_if_ge _0CDC
	compare VAR_SPECIAL_x8005, 251
	goto_if_ge _0CE7
	compare VAR_SPECIAL_x8005, 151
	goto_if_ge _0CF2
	compare VAR_SPECIAL_x8005, 101
	goto_if_ge _0CFD
	compare VAR_SPECIAL_x8005, 51
	goto_if_ge _0D08
	compare VAR_SPECIAL_x8005, 31
	goto_if_ge _0D13
	compare VAR_SPECIAL_x8005, 11
	goto_if_ge _0D1E
	compare VAR_SPECIAL_x8005, 1
	goto_if_ge _0D29
	npc_msg msg_0108_D32R0401_00085
	goto _0D34
	.byte 0x02
	.byte 0x00
_0CD1:
	npc_msg msg_0108_D32R0401_00094
	goto _0D34
	.byte 0x02, 0x00
_0CDC:
	npc_msg msg_0108_D32R0401_00093
	goto _0D34
	.byte 0x02, 0x00
_0CE7:
	npc_msg msg_0108_D32R0401_00092
	goto _0D34
	.byte 0x02, 0x00
_0CF2:
	npc_msg msg_0108_D32R0401_00091
	goto _0D34
	.byte 0x02, 0x00
_0CFD:
	npc_msg msg_0108_D32R0401_00090
	goto _0D34
	.byte 0x02, 0x00
_0D08:
	npc_msg msg_0108_D32R0401_00089
	goto _0D34
	.byte 0x02, 0x00
_0D13:
	npc_msg msg_0108_D32R0401_00088
	goto _0D34
	.byte 0x02, 0x00
_0D1E:
	npc_msg msg_0108_D32R0401_00087
	goto _0D34
	.byte 0x02, 0x00
_0D29:
	npc_msg msg_0108_D32R0401_00086
	goto _0D34
	.byte 0x02, 0x00
_0D34:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D32R0401_019:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	buffer_players_name 0
	copyvar VAR_TEMP_x4001, VAR_OBJ_1
	compare VAR_TEMP_x4001, 0
	goto_if_eq _0D90
	compare VAR_TEMP_x4001, 97
	goto_if_eq _0D9B
	compare VAR_TEMP_x4001, 365
	goto_if_eq _0DA6
	compare VAR_TEMP_x4001, 366
	goto_if_eq _0DB1
	compare VAR_TEMP_x4001, 354
	goto_if_eq _0DBC
	end

_0D90:
	npc_msg msg_0108_D32R0401_00096
	goto _0DC7
	.byte 0x02, 0x00
_0D9B:
	npc_msg msg_0108_D32R0401_00095
	goto _0DC7
	.byte 0x02, 0x00
_0DA6:
	npc_msg msg_0108_D32R0401_00097
	goto _0DC7
	.byte 0x02
	.byte 0x00
_0DB1:
	npc_msg msg_0108_D32R0401_00098
	goto _0DC7
	.byte 0x02, 0x00
_0DBC:
	npc_msg msg_0108_D32R0401_00099
	goto _0DC7
	.byte 0x02, 0x00
_0DC7:
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
